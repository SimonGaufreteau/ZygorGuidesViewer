# Lib: Hash

## Description

This Library provides functions to calculate message digest.  
This library is a port of the **pure_lua_SHA** module made by **Egor Skriptunoff**: [Github Project](https://github.com/Egor-Skriptunoff/pure_lua_SHA)

Supported hashes:

```lua
MD5            -- LH.md5(message)
SHA-1          -- LH.sha1(message)
-- SHA2
SHA-224        -- LH.sha224(message)
SHA-256        -- LH.sha256(message)
SHA-384        -- LH.sha384(message)
SHA-512        -- LH.sha512(message)
SHA-512/224    -- LH.sha512_224(message)
SHA-512/256    -- LH.sha512_256(message)
-- SHA3
SHA3-224       -- LH.sha3_224(message)
SHA3-256       -- LH.sha3_256(message)
SHA3-384       -- LH.sha3_384(message)
SHA3-512       -- LH.sha3_512(message)
SHAKE128       -- LH.shake128(digest_size_in_bytes, message)
SHAKE256       -- LH.shake256(digest_size_in_bytes, message)
-- HMAC (applicable to any hash-function from this module except SHAKE)
HMAC           -- LH.hmac(LH.any_hash_func, key, message)
```

---

## Usage

Input data should be provided as a binary string: either as a whole string or as a sequence of substrings (chunk-by-chunk loading).  
Result (SHA digest) is returned in hexadecimal representation (as a string of lowercase hex digits).

Simplest usage example:

```lua
local LH = LibStub("LibHash-1.0")
local your_hash = LH.sha256("your string")
-- assert(your_hash == "d14d691dac70eada14d9f23ef80091bca1c75cf77cf1cd5cf2d04180ca0d9911")
```

---

## FAQ

---

* **Q:** How to get SHA digest as binary string instead of hexadecimal representation?
* **A:**  
Use function `LH.hex2bin()` to convert hexadecimal to binary:

```lua
local LH = LibStub("LibHash-1.0")
local binary_hash = LH.hex2bin(LH.sha256("your string"))
-- assert(binary_hash == "\209Mi\29\172p\234\218\20\217\242>\248\0\145\188\161\199\\\247|\241\205\\\242\208A\128\202\r\153\17")
```

---

* **Q:** How to get SHA digest as base64 string?
* **A:**  
There are functions `LH.bin2base64()` and `LH.base642bin()` for converting between binary and base64:

```lua
local LH = LibStub("LibHash-1.0")
local binary_hash = LH.hex2bin(LH.sha256("your string"))
local base64_hash = LH.bin2base64(binary_hash)
-- assert(base64_hash == "0U1pHaxw6toU2fI++ACRvKHHXPd88c1c8tBBgMoNmRE=")
```

---

* **Q:** How to calculate SHA digest of long data stream?
* **A:**

```lua
local LH = LibStub("LibHash-1.0")
local append = LH.sha256()  -- if the "message" argument is omitted then "append" function is returned
append("your")
append(" st")                -- you should pass all parts of your long message to the "append" function (chunk-by-chunk)
append("ring")
local your_hash = append()   -- and finally ask for the result (by invoking the "append" function without argument)
-- assert(your_hash == "d14d691dac70eada14d9f23ef80091bca1c75cf77cf1cd5cf2d04180ca0d9911")
```

---

* **Q:** How to calculate HMAC-SHA1, HMAC-SHA256, etc. ?
* **A:**

```lua
-- Calculating HMAC-SHA1
local LH = LibStub("LibHash-1.0")
local your_hmac = LH.hmac(LH.sha1, "your key", "your message")
-- assert(your_hmac == "317d0dfd868a5c06c9444ac1328aa3e2bfd29fb2")
```

The same in chunk-by-chunk mode (for long messages):

```lua
local LH = LibStub("LibHash-1.0")
local append = LH.hmac(LH.sha1, "your key")
append("your")
append(" mess")
append("age")
local your_hmac = append()
-- assert(your_hmac == "317d0dfd868a5c06c9444ac1328aa3e2bfd29fb2")
```

---

* **Q:** Can SHAKE128/SHAKE256 be used to generate digest of infinite length ?
* **A:**  
Yes!  
For example, you can convert your password into infinite stream of pseudo-random bytes.  
Set `digest_size_in_bytes` to `-1` and obtain the function `get_next_part(part_size_in_bytes)`.  
Invoke this function repeatedly to get consecutive parts of the infinite digest.

```lua
local LH = LibStub("LibHash-1.0")
local get_next_part_of_digest = LH.shake128(-1, "The quick brown fox jumps over the lazy dog")
assert(get_next_part_of_digest(5) == "f4202e3c58") -- 5 bytes in hexadecimal representation
assert(get_next_part_of_digest()  == "52")         -- size=1 is assumed when omitted
assert(get_next_part_of_digest(0) == "")           -- size=0 is a valid size
assert(get_next_part_of_digest(4) == "f9182a04")   -- and so on to the infinity...
-- Note: you can use LH.hex2bin() to convert these hexadecimal parts to binary strings
-- By definition, the result of SHAKE with finite "digest_size_in_bytes" is just a finite prefix of "infinite digest":
assert(LH.shake128(4, "The quick brown fox jumps over the lazy dog")) == "f4202e3c")
```

For SHAKE, it's possible to combine "chunk-by-chunk" input mode with "chunk-by-chunk" output mode:

```lua
local LH = LibStub("LibHash-1.0")
local append_input_message = LH.shake128(-1)
append_input_message("The quick brown fox")
append_input_message(" jumps over")
append_input_message(" the lazy dog")
local get_next_part_of_digest = append_input_message()  -- input stream is terminated, now we can start receiving the output stream
assert(get_next_part_of_digest(5) == "f4202e3c58")
assert(get_next_part_of_digest(5) == "52f9182a04")      -- and so on...
```
