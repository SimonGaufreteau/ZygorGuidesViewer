-- Based on sha2.lua version 9 (2020-05-10) made by Egor Skriptunoff, ported for the WoW environment
-- https://github.com/Egor-Skriptunoff/pure_lua_SHA

local MAJOR_VERSION = "LibHash-1.0"
local MINOR_VERSION = 1
if not LibStub then error(MAJOR_VERSION .. " requires LibStub.")end
local lib = LibStub:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not lib then return end

local unpack, table_concat, byte, char, string_rep, sub, gsub, gmatch, floor, ceil, math_min, math_max, tonumber, type = table.unpack or unpack, table.concat, string.byte, string.char, string.rep, string.sub, string.gsub, string.gmatch, math.floor, math.ceil, math.min, math.max, tonumber, type

--------------------------------------------------------------------------------
-- BASIC 32-BIT BITWISE FUNCTIONS
--------------------------------------------------------------------------------

local AND, OR, XOR, SHL, SHR, ROL, ROR, HEX, XOR_BYTE

function SHL(x, n)
    return (x * 2 ^ n) % 2 ^ 32
end

function SHR(x, n)
    -- return (x % 2^32 - x % 2^n) / 2^n
    x = x % 2 ^ 32 / 2 ^ n
    return x - x % 1
end

function ROL(x, n)
    x = x % 2 ^ 32 * 2 ^ n
    local r = x % 2 ^ 32
    return r + (x - r) / 2 ^ 32
end

function ROR(x, n)
    x = x % 2 ^ 32 / 2 ^ n
    local r = x % 1
    return r * 2 ^ 32 + (x - r)
end

local AND_of_two_bytes = {[0] = 0} -- look-up table (256*256 entries)
local idx = 0
for y = 0, 127 * 256, 256 do
    for x = y, y + 127 do
        x = AND_of_two_bytes[x] * 2
        AND_of_two_bytes[idx] = x
        AND_of_two_bytes[idx + 1] = x
        AND_of_two_bytes[idx + 256] = x
        AND_of_two_bytes[idx + 257] = x + 1
        idx = idx + 2
    end
    idx = idx + 256
end

local function and_or_xor(x, y, operation)
    -- operation: nil = AND, 1 = OR, 2 = XOR
    local x0 = x % 2 ^ 32
    local y0 = y % 2 ^ 32
    local rx = x0 % 256
    local ry = y0 % 256
    local res = AND_of_two_bytes[rx + ry * 256]
    x = x0 - rx
    y = (y0 - ry) / 256
    rx = x % 65536
    ry = y % 256
    res = res + AND_of_two_bytes[rx + ry] * 256
    x = (x - rx) / 256
    y = (y - ry) / 256
    rx = x % 65536 + y % 256
    res = res + AND_of_two_bytes[rx] * 65536
    res = res + AND_of_two_bytes[(x + y - rx) / 256] * 16777216
    if operation then
        res = x0 + y0 - operation * res
    end
    return res
end

function AND(x, y)
    return and_or_xor(x, y)
end

function OR(x, y)
    return and_or_xor(x, y, 1)
end

function XOR(x, y, z, t, u) -- 2..5 arguments
    if z then
        if t then
            if u then
                t = and_or_xor(t, u, 2)
            end
            z = and_or_xor(z, t, 2)
        end
        y = and_or_xor(y, z, 2)
    end
    return and_or_xor(x, y, 2)
end

function XOR_BYTE(x, y)
    return x + y - 2 * AND_of_two_bytes[x + y * 256]
end

local HexTable = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"}

function HEX(x)
    local res = {}
    for i = 8, 1, -1 do
        local y = x % 16
        x = (x - y) / 16

        res[i] = HexTable[y + 1]
    end
    return table.concat(res, "")
end

local function XOR32A5(x)
    return XOR(x, 0xA5A5A5A5) % 4294967296
end

local function create_array_of_lanes()
    return {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
end

--------------------------------------------------------------------------------
-- CREATING OPTIMIZED INNER LOOP
--------------------------------------------------------------------------------

-- Inner loop functions
local sha256_feed_64, sha512_feed_128, md5_feed_64, sha1_feed_64, keccak_feed

-- Arrays of SHA2 "magic numbers" (in "INT64" and "FFI" branches "*_lo" arrays contain 64-bit values)
local sha2_K_lo, sha2_K_hi, sha2_H_lo, sha2_H_hi, sha3_RC_lo, sha3_RC_hi = {}, {}, {}, {}, {}, {}
local sha2_H_ext256 = {[224] = {}, [256] = sha2_H_hi}
local sha2_H_ext512_lo, sha2_H_ext512_hi = {[384] = {}, [512] = sha2_H_lo}, {[384] = {}, [512] = sha2_H_hi}
local md5_K, md5_sha1_H = {}, {0x67452301, 0xEFCDAB89, 0x98BADCFE, 0x10325476, 0xC3D2E1F0}
local md5_next_shift = {0, 0, 0, 0, 0, 0, 0, 0, 28, 25, 26, 27, 0, 0, 10, 9, 11, 12, 0, 15, 16, 17, 18, 0, 20, 22, 23, 21}
local common_W = {} -- temporary table shared between all calculations (to avoid creating new temporary table every time)
local K_lo_modulo = 4294967296

-- implementation for Lua 5.1/5.2 (with or without bitwise library available)

function sha256_feed_64(H, str, offs, size)
    -- offs >= 0, size >= 0, size is multiple of 64
    local W, K = common_W, sha2_K_hi
    local h1, h2, h3, h4, h5, h6, h7, h8 = H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8]
    for pos = offs, offs + size - 1, 64 do
        for j = 1, 16 do
            pos = pos + 4
            local a, b, c, d = byte(str, pos - 3, pos)
            W[j] = ((a * 256 + b) * 256 + c) * 256 + d
        end
        for j = 17, 64 do
            local a, b = W[j - 15], W[j - 2]
            W[j] =
                XOR(ROR(a, 7), ROL(a, 14), SHR(a, 3)) + XOR(ROL(b, 15), ROL(b, 13), SHR(b, 10)) + W[j - 7] + W[j - 16]
        end
        local a, b, c, d, e, f, g, h = h1, h2, h3, h4, h5, h6, h7, h8
        for j = 1, 64 do
            local z = XOR(ROR(e, 6), ROR(e, 11), ROL(e, 7)) + AND(e, f) + AND(-1 - e, g) + h + K[j] + W[j]
            h = g
            g = f
            f = e
            e = z + d
            d = c
            c = b
            b = a
            a = z + AND(d, c) + AND(a, XOR(d, c)) + XOR(ROR(a, 2), ROR(a, 13), ROL(a, 10))
        end
        h1, h2, h3, h4 = (a + h1) % 4294967296, (b + h2) % 4294967296, (c + h3) % 4294967296, (d + h4) % 4294967296
        h5, h6, h7, h8 = (e + h5) % 4294967296, (f + h6) % 4294967296, (g + h7) % 4294967296, (h + h8) % 4294967296
    end
    H[1], H[2], H[3], H[4], H[5], H[6], H[7], H[8] = h1, h2, h3, h4, h5, h6, h7, h8
end

function sha512_feed_128(H_lo, H_hi, str, offs, size)
    -- offs >= 0, size >= 0, size is multiple of 128
    -- W1_hi, W1_lo, W2_hi, W2_lo, ...   Wk_hi = W[2*k-1], Wk_lo = W[2*k]
    local W, K_lo, K_hi = common_W, sha2_K_lo, sha2_K_hi
    local h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo =
        H_lo[1],
        H_lo[2],
        H_lo[3],
        H_lo[4],
        H_lo[5],
        H_lo[6],
        H_lo[7],
        H_lo[8]
    local h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi =
        H_hi[1],
        H_hi[2],
        H_hi[3],
        H_hi[4],
        H_hi[5],
        H_hi[6],
        H_hi[7],
        H_hi[8]
    for pos = offs, offs + size - 1, 128 do
        for j = 1, 16 * 2 do
            pos = pos + 4
            local a, b, c, d = byte(str, pos - 3, pos)
            W[j] = ((a * 256 + b) * 256 + c) * 256 + d
        end
        for jj = 17 * 2, 80 * 2, 2 do
            local a_lo, a_hi, b_lo, b_hi = W[jj - 30], W[jj - 31], W[jj - 4], W[jj - 5]
            local tmp1 =
                XOR(SHR(a_lo, 1) + SHL(a_hi, 31), SHR(a_lo, 8) + SHL(a_hi, 24), SHR(a_lo, 7) + SHL(a_hi, 25)) %
                4294967296 +
                XOR(SHR(b_lo, 19) + SHL(b_hi, 13), SHL(b_lo, 3) + SHR(b_hi, 29), SHR(b_lo, 6) + SHL(b_hi, 26)) %
                    4294967296 +
                W[jj - 14] +
                W[jj - 32]
            local tmp2 = tmp1 % 4294967296
            W[jj - 1] =
                XOR(SHR(a_hi, 1) + SHL(a_lo, 31), SHR(a_hi, 8) + SHL(a_lo, 24), SHR(a_hi, 7)) +
                XOR(SHR(b_hi, 19) + SHL(b_lo, 13), SHL(b_hi, 3) + SHR(b_lo, 29), SHR(b_hi, 6)) +
                W[jj - 15] +
                W[jj - 33] +
                (tmp1 - tmp2) / 4294967296
            W[jj] = tmp2
        end
        local a_lo, b_lo, c_lo, d_lo, e_lo, f_lo, g_lo, h_lo = h1_lo, h2_lo, h3_lo, h4_lo, h5_lo, h6_lo, h7_lo, h8_lo
        local a_hi, b_hi, c_hi, d_hi, e_hi, f_hi, g_hi, h_hi = h1_hi, h2_hi, h3_hi, h4_hi, h5_hi, h6_hi, h7_hi, h8_hi
        for j = 1, 80 do
            local jj = 2 * j
            local tmp1 =
                XOR(SHR(e_lo, 14) + SHL(e_hi, 18), SHR(e_lo, 18) + SHL(e_hi, 14), SHL(e_lo, 23) + SHR(e_hi, 9)) %
                4294967296 +
                (AND(e_lo, f_lo) + AND(-1 - e_lo, g_lo)) % 4294967296 +
                h_lo +
                K_lo[j] +
                W[jj]
            local z_lo = tmp1 % 4294967296
            local z_hi =
                XOR(SHR(e_hi, 14) + SHL(e_lo, 18), SHR(e_hi, 18) + SHL(e_lo, 14), SHL(e_hi, 23) + SHR(e_lo, 9)) +
                AND(e_hi, f_hi) +
                AND(-1 - e_hi, g_hi) +
                h_hi +
                K_hi[j] +
                W[jj - 1] +
                (tmp1 - z_lo) / 4294967296
            h_lo = g_lo
            h_hi = g_hi
            g_lo = f_lo
            g_hi = f_hi
            f_lo = e_lo
            f_hi = e_hi
            tmp1 = z_lo + d_lo
            e_lo = tmp1 % 4294967296
            e_hi = z_hi + d_hi + (tmp1 - e_lo) / 4294967296
            d_lo = c_lo
            d_hi = c_hi
            c_lo = b_lo
            c_hi = b_hi
            b_lo = a_lo
            b_hi = a_hi
            tmp1 =
                z_lo + (AND(d_lo, c_lo) + AND(b_lo, XOR(d_lo, c_lo))) % 4294967296 +
                XOR(SHR(b_lo, 28) + SHL(b_hi, 4), SHL(b_lo, 30) + SHR(b_hi, 2), SHL(b_lo, 25) + SHR(b_hi, 7)) %
                    4294967296
            a_lo = tmp1 % 4294967296
            a_hi =
                z_hi + (AND(d_hi, c_hi) + AND(b_hi, XOR(d_hi, c_hi))) +
                XOR(SHR(b_hi, 28) + SHL(b_lo, 4), SHL(b_hi, 30) + SHR(b_lo, 2), SHL(b_hi, 25) + SHR(b_lo, 7)) +
                (tmp1 - a_lo) / 4294967296
        end
        a_lo = h1_lo + a_lo
        h1_lo = a_lo % 4294967296
        h1_hi = (h1_hi + a_hi + (a_lo - h1_lo) / 4294967296) % 4294967296
        a_lo = h2_lo + b_lo
        h2_lo = a_lo % 4294967296
        h2_hi = (h2_hi + b_hi + (a_lo - h2_lo) / 4294967296) % 4294967296
        a_lo = h3_lo + c_lo
        h3_lo = a_lo % 4294967296
        h3_hi = (h3_hi + c_hi + (a_lo - h3_lo) / 4294967296) % 4294967296
        a_lo = h4_lo + d_lo
        h4_lo = a_lo % 4294967296
        h4_hi = (h4_hi + d_hi + (a_lo - h4_lo) / 4294967296) % 4294967296
        a_lo = h5_lo + e_lo
        h5_lo = a_lo % 4294967296
        h5_hi = (h5_hi + e_hi + (a_lo - h5_lo) / 4294967296) % 4294967296
        a_lo = h6_lo + f_lo
        h6_lo = a_lo % 4294967296
        h6_hi = (h6_hi + f_hi + (a_lo - h6_lo) / 4294967296) % 4294967296
        a_lo = h7_lo + g_lo
        h7_lo = a_lo % 4294967296
        h7_hi = (h7_hi + g_hi + (a_lo - h7_lo) / 4294967296) % 4294967296
        a_lo = h8_lo + h_lo
        h8_lo = a_lo % 4294967296
        h8_hi = (h8_hi + h_hi + (a_lo - h8_lo) / 4294967296) % 4294967296
    end
    H_lo[1], H_lo[2], H_lo[3], H_lo[4], H_lo[5], H_lo[6], H_lo[7], H_lo[8] =
        h1_lo,
        h2_lo,
        h3_lo,
        h4_lo,
        h5_lo,
        h6_lo,
        h7_lo,
        h8_lo
    H_hi[1], H_hi[2], H_hi[3], H_hi[4], H_hi[5], H_hi[6], H_hi[7], H_hi[8] =
        h1_hi,
        h2_hi,
        h3_hi,
        h4_hi,
        h5_hi,
        h6_hi,
        h7_hi,
        h8_hi
end

function md5_feed_64(H, str, offs, size)
    -- offs >= 0, size >= 0, size is multiple of 64
    local W, K, md5_next_shift = common_W, md5_K, md5_next_shift
    local h1, h2, h3, h4 = H[1], H[2], H[3], H[4]
    for pos = offs, offs + size - 1, 64 do
        for j = 1, 16 do
            pos = pos + 4
            local a, b, c, d = byte(str, pos - 3, pos)
            W[j] = ((d * 256 + c) * 256 + b) * 256 + a
        end
        local a, b, c, d = h1, h2, h3, h4
        local s = 32 - 7
        for j = 1, 16 do
            local F = ROR(AND(b, c) + AND(-1 - b, d) + a + K[j] + W[j], s) + b
            s = md5_next_shift[s]
            a = d
            d = c
            c = b
            b = F
        end
        s = 32 - 5
        for j = 17, 32 do
            local F = ROR(AND(d, b) + AND(-1 - d, c) + a + K[j] + W[(5 * j - 4) % 16 + 1], s) + b
            s = md5_next_shift[s]
            a = d
            d = c
            c = b
            b = F
        end
        s = 32 - 4
        for j = 33, 48 do
            local F = ROR(XOR(XOR(b, c), d) + a + K[j] + W[(3 * j + 2) % 16 + 1], s) + b
            s = md5_next_shift[s]
            a = d
            d = c
            c = b
            b = F
        end
        s = 32 - 6
        for j = 49, 64 do
            local F = ROR(XOR(c, OR(b, -1 - d)) + a + K[j] + W[(j * 7 - 7) % 16 + 1], s) + b
            s = md5_next_shift[s]
            a = d
            d = c
            c = b
            b = F
        end
        h1 = (a + h1) % 4294967296
        h2 = (b + h2) % 4294967296
        h3 = (c + h3) % 4294967296
        h4 = (d + h4) % 4294967296
    end
    H[1], H[2], H[3], H[4] = h1, h2, h3, h4
end

function sha1_feed_64(H, str, offs, size)
    -- offs >= 0, size >= 0, size is multiple of 64
    local W = common_W
    local h1, h2, h3, h4, h5 = H[1], H[2], H[3], H[4], H[5]
    for pos = offs, offs + size - 1, 64 do
        for j = 1, 16 do
            pos = pos + 4
            local a, b, c, d = byte(str, pos - 3, pos)
            W[j] = ((a * 256 + b) * 256 + c) * 256 + d
        end
        for j = 17, 80 do
            W[j] = ROL(XOR(W[j - 3], W[j - 8], W[j - 14], W[j - 16]), 1)
        end
        local a, b, c, d, e = h1, h2, h3, h4, h5
        for j = 1, 20 do
            local z = ROL(a, 5) + AND(b, c) + AND(-1 - b, d) + 0x5A827999 + W[j] + e -- constant = floor(2^30 * sqrt(2))
            e = d
            d = c
            c = ROR(b, 2)
            b = a
            a = z
        end
        for j = 21, 40 do
            local z = ROL(a, 5) + XOR(b, c, d) + 0x6ED9EBA1 + W[j] + e -- 2^30 * sqrt(3)
            e = d
            d = c
            c = ROR(b, 2)
            b = a
            a = z
        end
        for j = 41, 60 do
            local z = ROL(a, 5) + AND(d, c) + AND(b, XOR(d, c)) + 0x8F1BBCDC + W[j] + e -- 2^30 * sqrt(5)
            e = d
            d = c
            c = ROR(b, 2)
            b = a
            a = z
        end
        for j = 61, 80 do
            local z = ROL(a, 5) + XOR(b, c, d) + 0xCA62C1D6 + W[j] + e -- 2^30 * sqrt(10)
            e = d
            d = c
            c = ROR(b, 2)
            b = a
            a = z
        end
        h1 = (a + h1) % 4294967296
        h2 = (b + h2) % 4294967296
        h3 = (c + h3) % 4294967296
        h4 = (d + h4) % 4294967296
        h5 = (e + h5) % 4294967296
    end
    H[1], H[2], H[3], H[4], H[5] = h1, h2, h3, h4, h5
end

function keccak_feed(lanes_lo, lanes_hi, str, offs, size, block_size_in_bytes)
    -- This is an example of a Lua function having 79 local variables :-)
    -- offs >= 0, size >= 0, size is multiple of block_size_in_bytes, block_size_in_bytes is positive multiple of 8
    local RC_lo, RC_hi = sha3_RC_lo, sha3_RC_hi
    local qwords_qty = block_size_in_bytes / 8
    for pos = offs, offs + size - 1, block_size_in_bytes do
        for j = 1, qwords_qty do
            local a, b, c, d = byte(str, pos + 1, pos + 4)
            lanes_lo[j] = XOR(lanes_lo[j], ((d * 256 + c) * 256 + b) * 256 + a)
            pos = pos + 8
            a, b, c, d = byte(str, pos - 3, pos)
            lanes_hi[j] = XOR(lanes_hi[j], ((d * 256 + c) * 256 + b) * 256 + a)
        end
        local L01_lo,
            L01_hi,
            L02_lo,
            L02_hi,
            L03_lo,
            L03_hi,
            L04_lo,
            L04_hi,
            L05_lo,
            L05_hi,
            L06_lo,
            L06_hi,
            L07_lo,
            L07_hi,
            L08_lo,
            L08_hi,
            L09_lo,
            L09_hi,
            L10_lo,
            L10_hi,
            L11_lo,
            L11_hi,
            L12_lo,
            L12_hi,
            L13_lo,
            L13_hi,
            L14_lo,
            L14_hi,
            L15_lo,
            L15_hi,
            L16_lo,
            L16_hi,
            L17_lo,
            L17_hi,
            L18_lo,
            L18_hi,
            L19_lo,
            L19_hi,
            L20_lo,
            L20_hi,
            L21_lo,
            L21_hi,
            L22_lo,
            L22_hi,
            L23_lo,
            L23_hi,
            L24_lo,
            L24_hi,
            L25_lo,
            L25_hi =
            lanes_lo[1],
            lanes_hi[1],
            lanes_lo[2],
            lanes_hi[2],
            lanes_lo[3],
            lanes_hi[3],
            lanes_lo[4],
            lanes_hi[4],
            lanes_lo[5],
            lanes_hi[5],
            lanes_lo[6],
            lanes_hi[6],
            lanes_lo[7],
            lanes_hi[7],
            lanes_lo[8],
            lanes_hi[8],
            lanes_lo[9],
            lanes_hi[9],
            lanes_lo[10],
            lanes_hi[10],
            lanes_lo[11],
            lanes_hi[11],
            lanes_lo[12],
            lanes_hi[12],
            lanes_lo[13],
            lanes_hi[13],
            lanes_lo[14],
            lanes_hi[14],
            lanes_lo[15],
            lanes_hi[15],
            lanes_lo[16],
            lanes_hi[16],
            lanes_lo[17],
            lanes_hi[17],
            lanes_lo[18],
            lanes_hi[18],
            lanes_lo[19],
            lanes_hi[19],
            lanes_lo[20],
            lanes_hi[20],
            lanes_lo[21],
            lanes_hi[21],
            lanes_lo[22],
            lanes_hi[22],
            lanes_lo[23],
            lanes_hi[23],
            lanes_lo[24],
            lanes_hi[24],
            lanes_lo[25],
            lanes_hi[25]
        for round_idx = 1, 24 do
            local C1_lo = XOR(L01_lo, L06_lo, L11_lo, L16_lo, L21_lo)
            local C1_hi = XOR(L01_hi, L06_hi, L11_hi, L16_hi, L21_hi)
            local C2_lo = XOR(L02_lo, L07_lo, L12_lo, L17_lo, L22_lo)
            local C2_hi = XOR(L02_hi, L07_hi, L12_hi, L17_hi, L22_hi)
            local C3_lo = XOR(L03_lo, L08_lo, L13_lo, L18_lo, L23_lo)
            local C3_hi = XOR(L03_hi, L08_hi, L13_hi, L18_hi, L23_hi)
            local C4_lo = XOR(L04_lo, L09_lo, L14_lo, L19_lo, L24_lo)
            local C4_hi = XOR(L04_hi, L09_hi, L14_hi, L19_hi, L24_hi)
            local C5_lo = XOR(L05_lo, L10_lo, L15_lo, L20_lo, L25_lo)
            local C5_hi = XOR(L05_hi, L10_hi, L15_hi, L20_hi, L25_hi)
            local D_lo = XOR(C1_lo, C3_lo * 2 + (C3_hi % 2 ^ 32 - C3_hi % 2 ^ 31) / 2 ^ 31)
            local D_hi = XOR(C1_hi, C3_hi * 2 + (C3_lo % 2 ^ 32 - C3_lo % 2 ^ 31) / 2 ^ 31)
            local T0_lo = XOR(D_lo, L02_lo)
            local T0_hi = XOR(D_hi, L02_hi)
            local T1_lo = XOR(D_lo, L07_lo)
            local T1_hi = XOR(D_hi, L07_hi)
            local T2_lo = XOR(D_lo, L12_lo)
            local T2_hi = XOR(D_hi, L12_hi)
            local T3_lo = XOR(D_lo, L17_lo)
            local T3_hi = XOR(D_hi, L17_hi)
            local T4_lo = XOR(D_lo, L22_lo)
            local T4_hi = XOR(D_hi, L22_hi)
            L02_lo = (T1_lo % 2 ^ 32 - T1_lo % 2 ^ 20) / 2 ^ 20 + T1_hi * 2 ^ 12
            L02_hi = (T1_hi % 2 ^ 32 - T1_hi % 2 ^ 20) / 2 ^ 20 + T1_lo * 2 ^ 12
            L07_lo = (T3_lo % 2 ^ 32 - T3_lo % 2 ^ 19) / 2 ^ 19 + T3_hi * 2 ^ 13
            L07_hi = (T3_hi % 2 ^ 32 - T3_hi % 2 ^ 19) / 2 ^ 19 + T3_lo * 2 ^ 13
            L12_lo = T0_lo * 2 + (T0_hi % 2 ^ 32 - T0_hi % 2 ^ 31) / 2 ^ 31
            L12_hi = T0_hi * 2 + (T0_lo % 2 ^ 32 - T0_lo % 2 ^ 31) / 2 ^ 31
            L17_lo = T2_lo * 2 ^ 10 + (T2_hi % 2 ^ 32 - T2_hi % 2 ^ 22) / 2 ^ 22
            L17_hi = T2_hi * 2 ^ 10 + (T2_lo % 2 ^ 32 - T2_lo % 2 ^ 22) / 2 ^ 22
            L22_lo = T4_lo * 2 ^ 2 + (T4_hi % 2 ^ 32 - T4_hi % 2 ^ 30) / 2 ^ 30
            L22_hi = T4_hi * 2 ^ 2 + (T4_lo % 2 ^ 32 - T4_lo % 2 ^ 30) / 2 ^ 30
            D_lo = XOR(C2_lo, C4_lo * 2 + (C4_hi % 2 ^ 32 - C4_hi % 2 ^ 31) / 2 ^ 31)
            D_hi = XOR(C2_hi, C4_hi * 2 + (C4_lo % 2 ^ 32 - C4_lo % 2 ^ 31) / 2 ^ 31)
            T0_lo = XOR(D_lo, L03_lo)
            T0_hi = XOR(D_hi, L03_hi)
            T1_lo = XOR(D_lo, L08_lo)
            T1_hi = XOR(D_hi, L08_hi)
            T2_lo = XOR(D_lo, L13_lo)
            T2_hi = XOR(D_hi, L13_hi)
            T3_lo = XOR(D_lo, L18_lo)
            T3_hi = XOR(D_hi, L18_hi)
            T4_lo = XOR(D_lo, L23_lo)
            T4_hi = XOR(D_hi, L23_hi)
            L03_lo = (T2_lo % 2 ^ 32 - T2_lo % 2 ^ 21) / 2 ^ 21 + T2_hi * 2 ^ 11
            L03_hi = (T2_hi % 2 ^ 32 - T2_hi % 2 ^ 21) / 2 ^ 21 + T2_lo * 2 ^ 11
            L08_lo = (T4_lo % 2 ^ 32 - T4_lo % 2 ^ 3) / 2 ^ 3 + T4_hi * 2 ^ 29 % 2 ^ 32
            L08_hi = (T4_hi % 2 ^ 32 - T4_hi % 2 ^ 3) / 2 ^ 3 + T4_lo * 2 ^ 29 % 2 ^ 32
            L13_lo = T1_lo * 2 ^ 6 + (T1_hi % 2 ^ 32 - T1_hi % 2 ^ 26) / 2 ^ 26
            L13_hi = T1_hi * 2 ^ 6 + (T1_lo % 2 ^ 32 - T1_lo % 2 ^ 26) / 2 ^ 26
            L18_lo = T3_lo * 2 ^ 15 + (T3_hi % 2 ^ 32 - T3_hi % 2 ^ 17) / 2 ^ 17
            L18_hi = T3_hi * 2 ^ 15 + (T3_lo % 2 ^ 32 - T3_lo % 2 ^ 17) / 2 ^ 17
            L23_lo = (T0_lo % 2 ^ 32 - T0_lo % 2 ^ 2) / 2 ^ 2 + T0_hi * 2 ^ 30 % 2 ^ 32
            L23_hi = (T0_hi % 2 ^ 32 - T0_hi % 2 ^ 2) / 2 ^ 2 + T0_lo * 2 ^ 30 % 2 ^ 32
            D_lo = XOR(C3_lo, C5_lo * 2 + (C5_hi % 2 ^ 32 - C5_hi % 2 ^ 31) / 2 ^ 31)
            D_hi = XOR(C3_hi, C5_hi * 2 + (C5_lo % 2 ^ 32 - C5_lo % 2 ^ 31) / 2 ^ 31)
            T0_lo = XOR(D_lo, L04_lo)
            T0_hi = XOR(D_hi, L04_hi)
            T1_lo = XOR(D_lo, L09_lo)
            T1_hi = XOR(D_hi, L09_hi)
            T2_lo = XOR(D_lo, L14_lo)
            T2_hi = XOR(D_hi, L14_hi)
            T3_lo = XOR(D_lo, L19_lo)
            T3_hi = XOR(D_hi, L19_hi)
            T4_lo = XOR(D_lo, L24_lo)
            T4_hi = XOR(D_hi, L24_hi)
            L04_lo = T3_lo * 2 ^ 21 % 2 ^ 32 + (T3_hi % 2 ^ 32 - T3_hi % 2 ^ 11) / 2 ^ 11
            L04_hi = T3_hi * 2 ^ 21 % 2 ^ 32 + (T3_lo % 2 ^ 32 - T3_lo % 2 ^ 11) / 2 ^ 11
            L09_lo = T0_lo * 2 ^ 28 % 2 ^ 32 + (T0_hi % 2 ^ 32 - T0_hi % 2 ^ 4) / 2 ^ 4
            L09_hi = T0_hi * 2 ^ 28 % 2 ^ 32 + (T0_lo % 2 ^ 32 - T0_lo % 2 ^ 4) / 2 ^ 4
            L14_lo = T2_lo * 2 ^ 25 % 2 ^ 32 + (T2_hi % 2 ^ 32 - T2_hi % 2 ^ 7) / 2 ^ 7
            L14_hi = T2_hi * 2 ^ 25 % 2 ^ 32 + (T2_lo % 2 ^ 32 - T2_lo % 2 ^ 7) / 2 ^ 7
            L19_lo = (T4_lo % 2 ^ 32 - T4_lo % 2 ^ 8) / 2 ^ 8 + T4_hi * 2 ^ 24 % 2 ^ 32
            L19_hi = (T4_hi % 2 ^ 32 - T4_hi % 2 ^ 8) / 2 ^ 8 + T4_lo * 2 ^ 24 % 2 ^ 32
            L24_lo = (T1_lo % 2 ^ 32 - T1_lo % 2 ^ 9) / 2 ^ 9 + T1_hi * 2 ^ 23 % 2 ^ 32
            L24_hi = (T1_hi % 2 ^ 32 - T1_hi % 2 ^ 9) / 2 ^ 9 + T1_lo * 2 ^ 23 % 2 ^ 32
            D_lo = XOR(C4_lo, C1_lo * 2 + (C1_hi % 2 ^ 32 - C1_hi % 2 ^ 31) / 2 ^ 31)
            D_hi = XOR(C4_hi, C1_hi * 2 + (C1_lo % 2 ^ 32 - C1_lo % 2 ^ 31) / 2 ^ 31)
            T0_lo = XOR(D_lo, L05_lo)
            T0_hi = XOR(D_hi, L05_hi)
            T1_lo = XOR(D_lo, L10_lo)
            T1_hi = XOR(D_hi, L10_hi)
            T2_lo = XOR(D_lo, L15_lo)
            T2_hi = XOR(D_hi, L15_hi)
            T3_lo = XOR(D_lo, L20_lo)
            T3_hi = XOR(D_hi, L20_hi)
            T4_lo = XOR(D_lo, L25_lo)
            T4_hi = XOR(D_hi, L25_hi)
            L05_lo = T4_lo * 2 ^ 14 + (T4_hi % 2 ^ 32 - T4_hi % 2 ^ 18) / 2 ^ 18
            L05_hi = T4_hi * 2 ^ 14 + (T4_lo % 2 ^ 32 - T4_lo % 2 ^ 18) / 2 ^ 18
            L10_lo = T1_lo * 2 ^ 20 % 2 ^ 32 + (T1_hi % 2 ^ 32 - T1_hi % 2 ^ 12) / 2 ^ 12
            L10_hi = T1_hi * 2 ^ 20 % 2 ^ 32 + (T1_lo % 2 ^ 32 - T1_lo % 2 ^ 12) / 2 ^ 12
            L15_lo = T3_lo * 2 ^ 8 + (T3_hi % 2 ^ 32 - T3_hi % 2 ^ 24) / 2 ^ 24
            L15_hi = T3_hi * 2 ^ 8 + (T3_lo % 2 ^ 32 - T3_lo % 2 ^ 24) / 2 ^ 24
            L20_lo = T0_lo * 2 ^ 27 % 2 ^ 32 + (T0_hi % 2 ^ 32 - T0_hi % 2 ^ 5) / 2 ^ 5
            L20_hi = T0_hi * 2 ^ 27 % 2 ^ 32 + (T0_lo % 2 ^ 32 - T0_lo % 2 ^ 5) / 2 ^ 5
            L25_lo = (T2_lo % 2 ^ 32 - T2_lo % 2 ^ 25) / 2 ^ 25 + T2_hi * 2 ^ 7
            L25_hi = (T2_hi % 2 ^ 32 - T2_hi % 2 ^ 25) / 2 ^ 25 + T2_lo * 2 ^ 7
            D_lo = XOR(C5_lo, C2_lo * 2 + (C2_hi % 2 ^ 32 - C2_hi % 2 ^ 31) / 2 ^ 31)
            D_hi = XOR(C5_hi, C2_hi * 2 + (C2_lo % 2 ^ 32 - C2_lo % 2 ^ 31) / 2 ^ 31)
            T1_lo = XOR(D_lo, L06_lo)
            T1_hi = XOR(D_hi, L06_hi)
            T2_lo = XOR(D_lo, L11_lo)
            T2_hi = XOR(D_hi, L11_hi)
            T3_lo = XOR(D_lo, L16_lo)
            T3_hi = XOR(D_hi, L16_hi)
            T4_lo = XOR(D_lo, L21_lo)
            T4_hi = XOR(D_hi, L21_hi)
            L06_lo = T2_lo * 2 ^ 3 + (T2_hi % 2 ^ 32 - T2_hi % 2 ^ 29) / 2 ^ 29
            L06_hi = T2_hi * 2 ^ 3 + (T2_lo % 2 ^ 32 - T2_lo % 2 ^ 29) / 2 ^ 29
            L11_lo = T4_lo * 2 ^ 18 + (T4_hi % 2 ^ 32 - T4_hi % 2 ^ 14) / 2 ^ 14
            L11_hi = T4_hi * 2 ^ 18 + (T4_lo % 2 ^ 32 - T4_lo % 2 ^ 14) / 2 ^ 14
            L16_lo = (T1_lo % 2 ^ 32 - T1_lo % 2 ^ 28) / 2 ^ 28 + T1_hi * 2 ^ 4
            L16_hi = (T1_hi % 2 ^ 32 - T1_hi % 2 ^ 28) / 2 ^ 28 + T1_lo * 2 ^ 4
            L21_lo = (T3_lo % 2 ^ 32 - T3_lo % 2 ^ 23) / 2 ^ 23 + T3_hi * 2 ^ 9
            L21_hi = (T3_hi % 2 ^ 32 - T3_hi % 2 ^ 23) / 2 ^ 23 + T3_lo * 2 ^ 9
            L01_lo = XOR(D_lo, L01_lo)
            L01_hi = XOR(D_hi, L01_hi)
            L01_lo, L02_lo, L03_lo, L04_lo, L05_lo =
                XOR(L01_lo, AND(-1 - L02_lo, L03_lo)),
                XOR(L02_lo, AND(-1 - L03_lo, L04_lo)),
                XOR(L03_lo, AND(-1 - L04_lo, L05_lo)),
                XOR(L04_lo, AND(-1 - L05_lo, L01_lo)),
                XOR(L05_lo, AND(-1 - L01_lo, L02_lo))
            L01_hi, L02_hi, L03_hi, L04_hi, L05_hi =
                XOR(L01_hi, AND(-1 - L02_hi, L03_hi)),
                XOR(L02_hi, AND(-1 - L03_hi, L04_hi)),
                XOR(L03_hi, AND(-1 - L04_hi, L05_hi)),
                XOR(L04_hi, AND(-1 - L05_hi, L01_hi)),
                XOR(L05_hi, AND(-1 - L01_hi, L02_hi))
            L06_lo, L07_lo, L08_lo, L09_lo, L10_lo =
                XOR(L09_lo, AND(-1 - L10_lo, L06_lo)),
                XOR(L10_lo, AND(-1 - L06_lo, L07_lo)),
                XOR(L06_lo, AND(-1 - L07_lo, L08_lo)),
                XOR(L07_lo, AND(-1 - L08_lo, L09_lo)),
                XOR(L08_lo, AND(-1 - L09_lo, L10_lo))
            L06_hi, L07_hi, L08_hi, L09_hi, L10_hi =
                XOR(L09_hi, AND(-1 - L10_hi, L06_hi)),
                XOR(L10_hi, AND(-1 - L06_hi, L07_hi)),
                XOR(L06_hi, AND(-1 - L07_hi, L08_hi)),
                XOR(L07_hi, AND(-1 - L08_hi, L09_hi)),
                XOR(L08_hi, AND(-1 - L09_hi, L10_hi))
            L11_lo, L12_lo, L13_lo, L14_lo, L15_lo =
                XOR(L12_lo, AND(-1 - L13_lo, L14_lo)),
                XOR(L13_lo, AND(-1 - L14_lo, L15_lo)),
                XOR(L14_lo, AND(-1 - L15_lo, L11_lo)),
                XOR(L15_lo, AND(-1 - L11_lo, L12_lo)),
                XOR(L11_lo, AND(-1 - L12_lo, L13_lo))
            L11_hi, L12_hi, L13_hi, L14_hi, L15_hi =
                XOR(L12_hi, AND(-1 - L13_hi, L14_hi)),
                XOR(L13_hi, AND(-1 - L14_hi, L15_hi)),
                XOR(L14_hi, AND(-1 - L15_hi, L11_hi)),
                XOR(L15_hi, AND(-1 - L11_hi, L12_hi)),
                XOR(L11_hi, AND(-1 - L12_hi, L13_hi))
            L16_lo, L17_lo, L18_lo, L19_lo, L20_lo =
                XOR(L20_lo, AND(-1 - L16_lo, L17_lo)),
                XOR(L16_lo, AND(-1 - L17_lo, L18_lo)),
                XOR(L17_lo, AND(-1 - L18_lo, L19_lo)),
                XOR(L18_lo, AND(-1 - L19_lo, L20_lo)),
                XOR(L19_lo, AND(-1 - L20_lo, L16_lo))
            L16_hi, L17_hi, L18_hi, L19_hi, L20_hi =
                XOR(L20_hi, AND(-1 - L16_hi, L17_hi)),
                XOR(L16_hi, AND(-1 - L17_hi, L18_hi)),
                XOR(L17_hi, AND(-1 - L18_hi, L19_hi)),
                XOR(L18_hi, AND(-1 - L19_hi, L20_hi)),
                XOR(L19_hi, AND(-1 - L20_hi, L16_hi))
            L21_lo, L22_lo, L23_lo, L24_lo, L25_lo =
                XOR(L23_lo, AND(-1 - L24_lo, L25_lo)),
                XOR(L24_lo, AND(-1 - L25_lo, L21_lo)),
                XOR(L25_lo, AND(-1 - L21_lo, L22_lo)),
                XOR(L21_lo, AND(-1 - L22_lo, L23_lo)),
                XOR(L22_lo, AND(-1 - L23_lo, L24_lo))
            L21_hi, L22_hi, L23_hi, L24_hi, L25_hi =
                XOR(L23_hi, AND(-1 - L24_hi, L25_hi)),
                XOR(L24_hi, AND(-1 - L25_hi, L21_hi)),
                XOR(L25_hi, AND(-1 - L21_hi, L22_hi)),
                XOR(L21_hi, AND(-1 - L22_hi, L23_hi)),
                XOR(L22_hi, AND(-1 - L23_hi, L24_hi))
            L01_lo = XOR(L01_lo, RC_lo[round_idx])
            L01_hi = L01_hi + RC_hi[round_idx] -- RC_hi[] is either 0 or 0x80000000, so we could use fast addition instead of slow XOR
        end
        lanes_lo[1] = L01_lo
        lanes_hi[1] = L01_hi
        lanes_lo[2] = L02_lo
        lanes_hi[2] = L02_hi
        lanes_lo[3] = L03_lo
        lanes_hi[3] = L03_hi
        lanes_lo[4] = L04_lo
        lanes_hi[4] = L04_hi
        lanes_lo[5] = L05_lo
        lanes_hi[5] = L05_hi
        lanes_lo[6] = L06_lo
        lanes_hi[6] = L06_hi
        lanes_lo[7] = L07_lo
        lanes_hi[7] = L07_hi
        lanes_lo[8] = L08_lo
        lanes_hi[8] = L08_hi
        lanes_lo[9] = L09_lo
        lanes_hi[9] = L09_hi
        lanes_lo[10] = L10_lo
        lanes_hi[10] = L10_hi
        lanes_lo[11] = L11_lo
        lanes_hi[11] = L11_hi
        lanes_lo[12] = L12_lo
        lanes_hi[12] = L12_hi
        lanes_lo[13] = L13_lo
        lanes_hi[13] = L13_hi
        lanes_lo[14] = L14_lo
        lanes_hi[14] = L14_hi
        lanes_lo[15] = L15_lo
        lanes_hi[15] = L15_hi
        lanes_lo[16] = L16_lo
        lanes_hi[16] = L16_hi
        lanes_lo[17] = L17_lo
        lanes_hi[17] = L17_hi
        lanes_lo[18] = L18_lo
        lanes_hi[18] = L18_hi
        lanes_lo[19] = L19_lo
        lanes_hi[19] = L19_hi
        lanes_lo[20] = L20_lo
        lanes_hi[20] = L20_hi
        lanes_lo[21] = L21_lo
        lanes_hi[21] = L21_hi
        lanes_lo[22] = L22_lo
        lanes_hi[22] = L22_hi
        lanes_lo[23] = L23_lo
        lanes_hi[23] = L23_hi
        lanes_lo[24] = L24_lo
        lanes_hi[24] = L24_hi
        lanes_lo[25] = L25_lo
        lanes_hi[25] = L25_hi
    end
end

--------------------------------------------------------------------------------
-- MAGIC NUMBERS CALCULATOR
--------------------------------------------------------------------------------
-- Q:
--    Is 53-bit "double" math enough to calculate square roots and cube roots of primes with 64 correct bits after decimal point?
-- A:
--    Yes, 53-bit "double" arithmetic is enough.
--    We could obtain first 40 bits by direct calculation of p^(1/3) and next 40 bits by one step of Newton's method.

do
    local function mul(src1, src2, factor, result_length)
        -- src1, src2 - long integers (arrays of digits in base 2^24)
        -- factor - small integer
        -- returns long integer result (src1 * src2 * factor) and its floating point approximation
        local result, carry, value, weight = {}, 0.0, 0.0, 1.0
        for j = 1, result_length do
            for k = math_max(1, j + 1 - #src2), math_min(j, #src1) do
                carry = carry + factor * src1[k] * src2[j + 1 - k] -- "int32" is not enough for multiplication result, that's why "factor" must be of type "double"
            end
            local digit = carry % 2 ^ 24
            result[j] = floor(digit)
            carry = (carry - digit) / 2 ^ 24
            value = value + digit * weight
            weight = weight * 2 ^ 24
        end
        return result, value
    end

    local idx, step, p, one, sqrt_hi, sqrt_lo = 0, {4, 1, 2, -2, 2}, 4, {1}, sha2_H_hi, sha2_H_lo
    repeat
        p = p + step[p % 6]
        local d = 1
        repeat
            d = d + step[d % 6]
            if d * d > p then -- next prime number is found
                local root = p ^ (1 / 3)
                local R = root * 2 ^ 40
                R = mul({R - R % 1}, one, 1.0, 2)
                local _, delta = mul(R, mul(R, R, 1.0, 4), -1.0, 4)
                local hi = R[2] % 65536 * 65536 + floor(R[1] / 256)
                local lo = R[1] % 256 * 16777216 + floor(delta * (2 ^ -56 / 3) * root / p)
                if idx < 16 then
                    root = p ^ (1 / 2)
                    R = root * 2 ^ 40
                    R = mul({R - R % 1}, one, 1.0, 2)
                    _, delta = mul(R, R, -1.0, 2)
                    local hi = R[2] % 65536 * 65536 + floor(R[1] / 256)
                    local lo = R[1] % 256 * 16777216 + floor(delta * 2 ^ -17 / root)
                    local idx = idx % 8 + 1
                    sha2_H_ext256[224][idx] = lo
                    sqrt_hi[idx], sqrt_lo[idx] = hi, lo
                    if idx > 7 then
                        sqrt_hi, sqrt_lo = sha2_H_ext512_hi[384], sha2_H_ext512_lo[384]
                    end
                end
                idx = idx + 1
                sha2_K_hi[idx], sha2_K_lo[idx] = hi, lo % K_lo_modulo
                break
            end
        until p % d == 0
    until idx > 79
end

-- Calculating IVs for SHA512/224 and SHA512/256
for width = 224, 256, 32 do
    local H_lo, H_hi = {}
    H_hi = {}
    for j = 1, 8 do
        H_lo[j] = XOR32A5(sha2_H_lo[j])
        H_hi[j] = XOR32A5(sha2_H_hi[j])
    end
    sha512_feed_128(H_lo, H_hi, "SHA-512/" .. tostring(width) .. "\128" .. string_rep("\0", 115) .. "\88", 0, 128)
    sha2_H_ext512_lo[width] = H_lo
    sha2_H_ext512_hi[width] = H_hi
end

-- Constants for MD5
do
    local sin, abs, modf = math.sin, math.abs, math.modf
    for idx = 1, 64 do
        -- we can't use formula floor(abs(sin(idx))*2^32) because its result may be beyond integer range on Lua built with 32-bit integers
        local hi, lo = modf(abs(sin(idx)) * 2 ^ 16)
        md5_K[idx] = hi * 65536 + floor(lo * 2 ^ 16)
    end
end

-- Constants for SHA3
do
    local sh_reg = 29
    local function next_bit()
        local r = sh_reg % 2
        sh_reg = XOR_BYTE((sh_reg - r) / 2, 142 * r)
        return r
    end
    for idx = 1, 24 do
        local lo, m = 0
        for _ = 1, 6 do
            m = m and m * m * 2 or 1
            lo = lo + next_bit() * m
        end
        local hi = next_bit() * m
        sha3_RC_hi[idx], sha3_RC_lo[idx] = hi, lo
    end
end

--------------------------------------------------------------------------------
-- MAIN FUNCTIONS
--------------------------------------------------------------------------------

local function sha256ext(width, message)
    -- Create an instance (private objects for current calculation)
    local H, length, tail = {unpack(sha2_H_ext256[width])}, 0.0, ""

    local function partial(message_part)
        if message_part then
            if tail then
                length = length + #message_part
                local offs = 0
                if tail ~= "" and #tail + #message_part >= 64 then
                    offs = 64 - #tail
                    sha256_feed_64(H, tail .. sub(message_part, 1, offs), 0, 64)
                    tail = ""
                end
                local size = #message_part - offs
                local size_tail = size % 64
                sha256_feed_64(H, message_part, offs, size - size_tail)
                tail = tail .. sub(message_part, #message_part + 1 - size_tail)
                return partial
            else
                error("Adding more chunks is not allowed after receiving the result", 2)
            end
        else
            if tail then
                local final_blocks = {tail, "\128", string_rep("\0", (-9 - length) % 64 + 1)}
                tail = nil
                -- Assuming user data length is shorter than (2^53)-9 bytes
                -- Anyway, it looks very unrealistic that someone would spend more than a year of calculations to process 2^53 bytes of data by using this Lua script :-)
                -- 2^53 bytes = 2^56 bits, so "bit-counter" fits in 7 bytes
                length = length * (8 / 256 ^ 7) -- convert "byte-counter" to "bit-counter" and move decimal point to the left
                for j = 4, 10 do
                    length = length % 1 * 256
                    final_blocks[j] = char(floor(length))
                end
                final_blocks = table_concat(final_blocks)
                sha256_feed_64(H, final_blocks, 0, #final_blocks)
                local max_reg = width / 32
                for j = 1, max_reg do
                    H[j] = HEX(H[j])
                end
                H = table_concat(H, "", 1, max_reg)
            end
            return H
        end
    end
    if message then
        -- Actually perform calculations and return the SHA256 digest of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading
        -- User should feed every chunk of input data as single argument to this function and finally get SHA256 digest by invoking this function without an argument
        return partial
    end
end

local function sha512ext(width, message)
    -- Create an instance (private objects for current calculation)
    local length, tail, H_lo, H_hi = 0.0, "", {unpack(sha2_H_ext512_lo[width])}, {unpack(sha2_H_ext512_hi[width])}

    local function partial(message_part)
        if message_part then
            if tail then
                length = length + #message_part
                local offs = 0
                if tail ~= "" and #tail + #message_part >= 128 then
                    offs = 128 - #tail
                    sha512_feed_128(H_lo, H_hi, tail .. sub(message_part, 1, offs), 0, 128)
                    tail = ""
                end
                local size = #message_part - offs
                local size_tail = size % 128
                sha512_feed_128(H_lo, H_hi, message_part, offs, size - size_tail)
                tail = tail .. sub(message_part, #message_part + 1 - size_tail)
                return partial
            else
                error("Adding more chunks is not allowed after receiving the result", 2)
            end
        else
            if tail then
                local final_blocks = {tail, "\128", string_rep("\0", (-17 - length) % 128 + 9)}
                tail = nil
                -- Assuming user data length is shorter than (2^53)-17 bytes
                -- 2^53 bytes = 2^56 bits, so "bit-counter" fits in 7 bytes
                length = length * (8 / 256 ^ 7) -- convert "byte-counter" to "bit-counter" and move floating point to the left
                for j = 4, 10 do
                    length = length % 1 * 256
                    final_blocks[j] = char(floor(length))
                end
                final_blocks = table_concat(final_blocks)
                sha512_feed_128(H_lo, H_hi, final_blocks, 0, #final_blocks)
                local max_reg = ceil(width / 64)
                for j = 1, max_reg do
                    H_lo[j] = HEX(H_hi[j]) .. HEX(H_lo[j])
                end
                H_hi = nil
                H_lo = sub(table_concat(H_lo, "", 1, max_reg), 1, width / 4)
            end
            return H_lo
        end
    end

    if message then
        -- Actually perform calculations and return the SHA512 digest of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading
        -- User should feed every chunk of input data as single argument to this function and finally get SHA512 digest by invoking this function without an argument
        return partial
    end
end

local function md5(message)
    -- Create an instance (private objects for current calculation)
    local H, length, tail = {unpack(md5_sha1_H, 1, 4)}, 0.0, ""

    local function partial(message_part)
        if message_part then
            if tail then
                length = length + #message_part
                local offs = 0
                if tail ~= "" and #tail + #message_part >= 64 then
                    offs = 64 - #tail
                    md5_feed_64(H, tail .. sub(message_part, 1, offs), 0, 64)
                    tail = ""
                end
                local size = #message_part - offs
                local size_tail = size % 64
                md5_feed_64(H, message_part, offs, size - size_tail)
                tail = tail .. sub(message_part, #message_part + 1 - size_tail)
                return partial
            else
                error("Adding more chunks is not allowed after receiving the result", 2)
            end
        else
            if tail then
                local final_blocks = {tail, "\128", string_rep("\0", (-9 - length) % 64)}
                tail = nil
                length = length * 8 -- convert "byte-counter" to "bit-counter"
                for j = 4, 11 do
                    local low_byte = length % 256
                    final_blocks[j] = char(low_byte)
                    length = (length - low_byte) / 256
                end
                final_blocks = table_concat(final_blocks)
                md5_feed_64(H, final_blocks, 0, #final_blocks)
                for j = 1, 4 do
                    H[j] = HEX(H[j])
                end
                H = gsub(table_concat(H), "(..)(..)(..)(..)", "%4%3%2%1")
            end
            return H
        end
    end

    if message then
        -- Actually perform calculations and return the MD5 digest of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading
        -- User should feed every chunk of input data as single argument to this function and finally get MD5 digest by invoking this function without an argument
        return partial
    end
end

local function sha1(message)
    -- Create an instance (private objects for current calculation)
    local H, length, tail = {unpack(md5_sha1_H)}, 0.0, ""

    local function partial(message_part)
        if message_part then
            if tail then
                length = length + #message_part
                local offs = 0
                if tail ~= "" and #tail + #message_part >= 64 then
                    offs = 64 - #tail
                    sha1_feed_64(H, tail .. sub(message_part, 1, offs), 0, 64)
                    tail = ""
                end
                local size = #message_part - offs
                local size_tail = size % 64
                sha1_feed_64(H, message_part, offs, size - size_tail)
                tail = tail .. sub(message_part, #message_part + 1 - size_tail)
                return partial
            else
                error("Adding more chunks is not allowed after receiving the result", 2)
            end
        else
            if tail then
                local final_blocks = {tail, "\128", string_rep("\0", (-9 - length) % 64 + 1)}
                tail = nil
                -- Assuming user data length is shorter than (2^53)-9 bytes
                -- 2^53 bytes = 2^56 bits, so "bit-counter" fits in 7 bytes
                length = length * (8 / 256 ^ 7) -- convert "byte-counter" to "bit-counter" and move decimal point to the left
                for j = 4, 10 do
                    length = length % 1 * 256
                    final_blocks[j] = char(floor(length))
                end
                final_blocks = table_concat(final_blocks)
                sha1_feed_64(H, final_blocks, 0, #final_blocks)
                for j = 1, 5 do
                    H[j] = HEX(H[j])
                end
                H = table_concat(H)
            end
            return H
        end
    end

    if message then
        -- Actually perform calculations and return the SHA-1 digest of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading
        -- User should feed every chunk of input data as single argument to this function and finally get SHA-1 digest by invoking this function without an argument
        return partial
    end
end

local function keccak(block_size_in_bytes, digest_size_in_bytes, is_SHAKE, message)
    -- "block_size_in_bytes" is multiple of 8
    if type(digest_size_in_bytes) ~= "number" then
        -- arguments in SHAKE are swapped:
        --    NIST FIPS 202 defines SHAKE(message,num_bits)
        --    this module   defines SHAKE(num_bytes,message)
        -- it's easy to forget about this swap, hence the check
        error("Argument 'digest_size_in_bytes' must be a number", 2)
    end

    -- Create an instance (private objects for current calculation)
    local tail, lanes_lo, lanes_hi = "", create_array_of_lanes(), create_array_of_lanes()
    local result

    --~     pad the input N using the pad function, yielding a padded bit string P with a length divisible by r (such that n = len(P)/r is integer),
    --~     break P into n consecutive r-bit pieces P0, ..., Pn-1 (last is zero-padded)
    --~     initialize the state S to a string of b 0 bits.
    --~     absorb the input into the state: For each block Pi,
    --~         extend Pi at the end by a string of c 0 bits, yielding one of length b,
    --~         XOR that with S and
    --~         apply the block permutation f to the result, yielding a new state S
    --~     initialize Z to be the empty string
    --~     while the length of Z is less than d:
    --~         append the first r bits of S to Z
    --~         if Z is still less than d bits long, apply f to S, yielding a new state S.
    --~     truncate Z to d bits

    local function partial(message_part)
        if message_part then
            if tail then
                local offs = 0
                if tail ~= "" and #tail + #message_part >= block_size_in_bytes then
                    offs = block_size_in_bytes - #tail
                    keccak_feed(
                        lanes_lo,
                        lanes_hi,
                        tail .. sub(message_part, 1, offs),
                        0,
                        block_size_in_bytes,
                        block_size_in_bytes
                    )
                    tail = ""
                end
                local size = #message_part - offs
                local size_tail = size % block_size_in_bytes
                keccak_feed(lanes_lo, lanes_hi, message_part, offs, size - size_tail, block_size_in_bytes)
                tail = tail .. sub(message_part, #message_part + 1 - size_tail)
                return partial
            else
                error("Adding more chunks is not allowed after receiving the result", 2)
            end
        else
            if tail then
                -- append the following bits to the message: for usual SHA3: 011(0*)1, for SHAKE: 11111(0*)1
                local gap_start = is_SHAKE and 31 or 6
                tail =
                    tail ..
                    (#tail + 1 == block_size_in_bytes and char(gap_start + 128) or
                        char(gap_start) .. string_rep("\0", (-2 - #tail) % block_size_in_bytes) .. "\128")
                keccak_feed(lanes_lo, lanes_hi, tail, 0, #tail, block_size_in_bytes)
                tail = nil

                local lanes_used = 0
                local total_lanes = floor(block_size_in_bytes / 8)
                local qwords = {}

                local function get_next_qwords_of_digest(qwords_qty)
                    -- returns not more than 'qwords_qty' qwords ('qwords_qty' might be non-integer)
                    -- doesn't go across keccak-buffer boundary
                    -- block_size_in_bytes is a multiple of 8, so, keccak-buffer contains integer number of qwords
                    if lanes_used >= total_lanes then
                        keccak_feed(lanes_lo, lanes_hi, "\0\0\0\0\0\0\0\0", 0, 8, 8)
                        lanes_used = 0
                    end
                    qwords_qty = floor(math_min(qwords_qty, total_lanes - lanes_used))
                    for j = 1, qwords_qty do
                        qwords[j] = HEX(lanes_hi[lanes_used + j]) .. HEX(lanes_lo[lanes_used + j])
                    end
                    lanes_used = lanes_used + qwords_qty
                    return gsub(
                        table_concat(qwords, "", 1, qwords_qty),
                        "(..)(..)(..)(..)(..)(..)(..)(..)",
                        "%8%7%6%5%4%3%2%1"
                    ), qwords_qty * 8
                end

                local parts = {} -- digest parts
                local last_part, last_part_size = "", 0

                local function get_next_part_of_digest(bytes_needed)
                    -- returns 'bytes_needed' bytes, for arbitrary integer 'bytes_needed'
                    bytes_needed = bytes_needed or 1
                    if bytes_needed <= last_part_size then
                        last_part_size = last_part_size - bytes_needed
                        local part_size_in_nibbles = bytes_needed * 2
                        local result = sub(last_part, 1, part_size_in_nibbles)
                        last_part = sub(last_part, part_size_in_nibbles + 1)
                        return result
                    end
                    local parts_qty = 0
                    if last_part_size > 0 then
                        parts_qty = 1
                        parts[parts_qty] = last_part
                        bytes_needed = bytes_needed - last_part_size
                    end
                    -- repeats until the length is enough
                    while bytes_needed >= 8 do
                        local next_part, next_part_size = get_next_qwords_of_digest(bytes_needed / 8)
                        parts_qty = parts_qty + 1
                        parts[parts_qty] = next_part
                        bytes_needed = bytes_needed - next_part_size
                    end
                    if bytes_needed > 0 then
                        last_part, last_part_size = get_next_qwords_of_digest(1)
                        parts_qty = parts_qty + 1
                        parts[parts_qty] = get_next_part_of_digest(bytes_needed)
                    else
                        last_part, last_part_size = "", 0
                    end
                    return table_concat(parts, "", 1, parts_qty)
                end

                if digest_size_in_bytes < 0 then
                    result = get_next_part_of_digest
                else
                    result = get_next_part_of_digest(digest_size_in_bytes)
                end
            end
            return result
        end
    end

    if message then
        -- Actually perform calculations and return the SHA3 digest of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading
        -- User should feed every chunk of input data as single argument to this function and finally get SHA3 digest by invoking this function without an argument
        return partial
    end
end

local hex2bin, bin2base64, base642bin
do
    function hex2bin(hex_string)
        return (gsub(
            hex_string,
            "%x%x",
            function(hh)
                return char(tonumber(hh, 16))
            end
        ))
    end

    local base64_symbols = {
        ["+"] = 62,
        ["-"] = 62,
        [62] = "+",
        ["/"] = 63,
        ["_"] = 63,
        [63] = "/",
        ["="] = -1,
        ["."] = -1,
        [-1] = "="
    }
    local symbol_index = 0
    for j, pair in ipairs {"AZ", "az", "09"} do
        for ascii = byte(pair), byte(pair, 2) do
            local ch = char(ascii)
            base64_symbols[ch] = symbol_index
            base64_symbols[symbol_index] = ch
            symbol_index = symbol_index + 1
        end
    end

    function bin2base64(binary_string)
        local result = {}
        for pos = 1, #binary_string, 3 do
            local c1, c2, c3, c4 = byte(sub(binary_string, pos, pos + 2) .. "\0", 1, -1)
            result[#result + 1] =
                base64_symbols[floor(c1 / 4)] ..
                base64_symbols[c1 % 4 * 16 + floor(c2 / 16)] ..
                    base64_symbols[c3 and c2 % 16 * 4 + floor(c3 / 64) or -1] .. base64_symbols[c4 and c3 % 64 or -1]
        end
        return table_concat(result)
    end

    function base642bin(base64_string)
        local result, chars_qty = {}, 3
        for pos, ch in gmatch(gsub(base64_string, "%s+", ""), "()(.)") do
            local code = base64_symbols[ch]
            if code < 0 then
                chars_qty = chars_qty - 1
                code = 0
            end
            local idx = pos % 4
            if idx > 0 then
                result[-idx] = code
            else
                local c1 = result[-1] * 4 + floor(result[-2] / 16)
                local c2 = (result[-2] % 16) * 16 + floor(result[-3] / 4)
                local c3 = (result[-3] % 4) * 64 + code
                result[#result + 1] = sub(char(c1, c2, c3), 1, chars_qty)
            end
        end
        return table_concat(result)
    end
end

local block_size_for_HMAC  -- this table will be initialized at the end of the module

local function pad_and_xor(str, result_length, byte_for_xor)
    return gsub(
        str,
        ".",
        function(c)
            return char(XOR_BYTE(byte(c), byte_for_xor))
        end
    ) .. string_rep(char(byte_for_xor), result_length - #str)
end

local function hmac(hash_func, key, message)
    -- Create an instance (private objects for current calculation)
    local block_size = block_size_for_HMAC[hash_func]
    if not block_size then
        error("Unknown hash function", 2)
    end
    if #key > block_size then
        key = hex2bin(hash_func(key))
    end
    local append = hash_func()(pad_and_xor(key, block_size, 0x36))
    local result

    local function partial(message_part)
        if not message_part then
            result = result or hash_func(pad_and_xor(key, block_size, 0x5C) .. hex2bin(append()))
            return result
        elseif result then
            error("Adding more chunks is not allowed after receiving the result", 2)
        else
            append(message_part)
            return partial
        end
    end

    if message then
        -- Actually perform calculations and return the HMAC of a message
        return partial(message)()
    else
        -- Return function for chunk-by-chunk loading of a message
        -- User should feed every chunk of the message as single argument to this function and finally get HMAC by invoking this function without an argument
        return partial
    end
end

lib.md5 = md5 -- MD5
lib.sha1 = sha1 -- SHA-1
-- SHA2 hash functions:
lib.sha224 = function(message)
    return sha256ext(224, message)
end -- SHA-224
lib.sha256 = function(message)
    return sha256ext(256, message)
end -- SHA-256
lib.sha512_224 = function(message)
    return sha512ext(224, message)
end -- SHA-512/224
lib.sha512_256 = function(message)
    return sha512ext(256, message)
end -- SHA-512/256
lib.sha384 = function(message)
    return sha512ext(384, message)
end -- SHA-384
lib.sha512 = function(message)
    return sha512ext(512, message)
end -- SHA-512
-- SHA3 hash functions:
lib.sha3_224 = function(message)
    return keccak((1600 - 2 * 224) / 8, 224 / 8, false, message)
end -- SHA3-224
lib.sha3_256 = function(message)
    return keccak((1600 - 2 * 256) / 8, 256 / 8, false, message)
end -- SHA3-256
lib.sha3_384 = function(message)
    return keccak((1600 - 2 * 384) / 8, 384 / 8, false, message)
end -- SHA3-384
lib.sha3_512 = function(message)
    return keccak((1600 - 2 * 512) / 8, 512 / 8, false, message)
end -- SHA3-512
lib.shake128 = function(digest_size_in_bytes, message)
    return keccak((1600 - 2 * 128) / 8, digest_size_in_bytes, true, message)
end -- SHAKE128
lib.shake256 = function(digest_size_in_bytes, message)
    return keccak((1600 - 2 * 256) / 8, digest_size_in_bytes, true, message)
end -- SHAKE256
-- misc utilities:
lib.hmac = hmac -- HMAC(hash_func, key, message) is applicable to any hash function from this module except SHAKE*
lib.hex2bin = hex2bin -- converts hexadecimal representation to binary string
lib.base642bin = base642bin -- converts base64 representation to binary string
lib.bin2base64 = bin2base64 -- converts binary string to base64 representation

block_size_for_HMAC = {
    [lib.md5] = 64,
    [lib.sha1] = 64,
    [lib.sha224] = 64,
    [lib.sha256] = 64,
    [lib.sha512_224] = 128,
    [lib.sha512_256] = 128,
    [lib.sha384] = 128,
    [lib.sha512] = 128,
    [lib.sha3_224] = (1600 - 2 * 224) / 8,
    [lib.sha3_256] = (1600 - 2 * 256) / 8,
    [lib.sha3_384] = (1600 - 2 * 384) / 8,
    [lib.sha3_512] = (1600 - 2 * 512) / 8
}
