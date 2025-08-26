local name,ZGV = ...

-- GLOBAL Spoo

ZGV.Faction = {}
local Faction = ZGV.Faction

local MAX_FACTION_ID = 5000 -- as of 2022-11-26, it's 2553.
local HIDDEN_FRIENDSHIP_ID_MIN = 1400
local HIDDEN_FRIENDSHIP_ID_MAX = 2500

local GetFactionInfoByID = GetFactionInfoByID
if not GetFactionInfoByID then
	GetFactionInfoByID=function(id)
		local data = C_Reputation.GetFactionDataByID(id)
		if data then
			return data.name, data.description, data.reaction, data.currentReactionThreshold, data.nextReactionThreshold, data.currentStanding,data.atWarWith,data.canToggleAtWar,data.isHeader, data.isCollapsed,data.isHeaderWithRep,data.isWatched,data.isChild,data.factionID,data.hasBonusRepGain
		end
	end
end

---@type table<number,Rep>
Faction.reputations={}

---@alias RepType 'faction'|'bodyguard'|'tiller'|'fisherfriend'|'timewalker'|'brawl'|'bees'|'venari'|'archivists'|'artisansconsortium'|'valdrakken'|'cobaltassembly'|'basic_friend'|'major'

---@class StandingDef
---@field name string
---@field from number
---@field color? string
---@field use_renown? boolean

---@class RepTypeData
---@field standings StandingDef[]
---@field check? fun(id:number|nil,fid:number|nil,ftex:number|nil):boolean

---@type table<RepType,RepTypeData>
local reptypes = {  -- OVERRIDDEN in Classic/WOTLK
	['faction'] = {
		standings = {
			{ name="Hated", from=-42000, color="880000" },
			{ name="Hostile", from=-6000, color="ff0000"},			
			{ name="Unfriendly", from=-3000, color="ff8800" },
			{ name="Neutral", from=0*3000, color="ffff00" },
			{ name="Friendly", from=1*3000, color="00ff00" },
			{ name="Honored", from=2*3000, color="00ff88" },
			{ name="Revered", from=4*3000, color="00ffff" },
			{ name="Exalted", from=7*3000, color="cc88ff" },
		},
	},
	['bodyguard'] = {
		standings = {
			{ name="Bodyguard", from=0*10000, color="ffff00"},
			{ name="Trusted Bodyguard", from=1*10000, color="00ff00"},			
			{ name="Personal Wingman", from=2*10000, color="00ffff" },
		},
		check = function(id,fid,ftex)
			return ftex==666623
		end,
		barmax=10000
	},
	['tiller'] = {
		standings = {
			{ name="Stranger", from=0*8400, color="ffff00"},
			{ name="Acquaintance", from=1*8400, color="00ff00"},			
			{ name="Buddy", from=2*8400, color="00ff88" },
			{ name="Friend", from=3*8400, color="00ffff" },
			{ name="Good Friend", from=4*8400, color="44ddff" },
			{ name="Best Friend", from=5*8400, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==1273 or fid==1275 or fid==1276 or fid==1277 or fid==1278 or fid==1279 or fid==1280 or fid==1281 or fid==1282 or fid==1283
		end,
		max=6*8400,
		barmax=8400
	},
	['fisherfriend'] = {
		standings = {
			{ name="Stranger", from=0*8400, color="ffff00"},
			{ name="Pal", from=1*8400, color="00ff00"},			
			{ name="Buddy", from=2*8400, color="00ff88" },
			{ name="Friend", from=3*8400, color="00ffff" },
			{ name="Good Friend", from=4*8400, color="44ddff" },
			{ name="Best Friend", from=5*8400, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2097 or fid==2098 or fid==2099 or fid==2100 or fid==2101 or fid==2102
		end,
	},
	['timewalker'] = {
		standings = {
			{ name="Whelpling", from=0},
			{ name="Temporal Trainee", from=1000},			
			{ name="Timehopper", from=2500 },
			{ name="Chrono-Friend", from=4500 },
			{ name="Bronze Ally", from=7000 },
			{ name="Epoch-Mender", from=10000 },
			{ name="Timelord", from=15000 }
		},
		check = function(id,fid,ftex)
			return fid==2135
		end,
		barmax=3000
	},
	['brawl'] = {
		standings = setmetatable({ max=5 },{__index=function(_,num) return tonumber(num) and { name="Rank "..num, from=(tonumber(num)-1)*1000 } end}),
		check = function(id,fid,ftex)
			return fid==2010 or fid==2011 or -- legion, season 3
			fid==1690 or fid==1691 or -- wod, no longer seems to exist
			fid==1419 or fid==1374    -- pandaria, season 1
		end
	},
	['bees'] = {
		standings = {
			{ name="Nascent", from=0, color="ffff00" },
			{ name="Juvenile", from=1*3500, color="00ff00" },
			{ name="Mature", from=2*3500, color="00ffff" },
		},
		check = function(id,fid,ftex)
			return fid==2398
		end
	},
	['venari'] = {
		standings = {
			{ name="Dubious", from=0, color="ffff00"},
			{ name="Apprehensive", from=1000, color="00ff00"},			
			{ name="Tentative", from=7000, color="00ff88" },
			{ name="Ambivalent", from=14000, color="00ffff" },
			{ name="Cordial", from=21000, color="44ddff" },
			{ name="Appreciative", from=42000, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2432
		end
	},
	['archivists'] = {
		standings = {
			{ name="Tier 1", from=0, color="ffff00"},
			{ name="Tier 2", from=3000, color="00ff00"},
			{ name="Tier 3", from=7500, color="00ff88" },
			{ name="Tier 4", from=14000, color="00ffff" },
			{ name="Tier 5", from=25000, color="44ddff" },
			{ name="Tier 6", from=41000, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2472
		end
	},

	['artisansconsortium'] = {
		standings = {
			{ name="Neutral", from=0, color="ffff00"},
			{ name="Preferred", from=500, color="00ff00"},
			{ name="Respected", from=2500, color="00ff88" },
			{ name="Valued", from=5500, color="00ffff" },
			{ name="Esteemed", from=12500, color="cc88ff" }
		},
		check = function(id,fid,ftex)
			return fid==2544
		end
	},

	['valdrakken'] = {
		standings = {
			{ name="Acquaintance", from=0, color="ffff00"},
			{ name="Cohort", from=8400, color="00ff00"},
			{ name="Ally", from=16800, color="00ff88" },
			{ name="Fang", from=25200, color="00ffff" },
			{ name="Friend", from=33600, color="44ddff" },
			{ name="True Friend", from=42000, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2517 or fid==2518
		end
	},
	['cobaltassembly'] = {
		standings = {
			{ name="Empty", from=0, color="ffff00"},
			{ name="Low", from=300, color="00ff00"},
			{ name="Medium", from=1200, color="00ff88" },
			{ name="High", from=3600, color="00ffff" },
			{ name="Maximum", from=10000, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2550
		end
	},
	['soridormi'] = {
		standings = {
			{ name="Anomaly", from=0, color="ffff00"},
			{ name="Future Friend", from=7000, color="00ff00"},
			{ name="Rift-Mender", from=14000, color="00ff88" },
			{ name="Timewalker", from=24000, color="00ffff" },
			{ name="Legend of the Multiverse", from=42000, color="cc88ff" },
		},
		check = function(id,fid,ftex)
			return fid==2553
		end
	},
	['severedthreads'] = {
		standings = {
			{ name="Stranger",	from=0,		color="ffff00"},
			{ name="Acquaintance",	from=2500,	color="ffe89a"},
			{ name="Crony",		from=5000,	color="ffdab2"},
			{ name="Accomplice",	from=7500,	color="ffccb8"},
			{ name="Collaborator",	from=10000,	color="ffbdbb"},
			{ name="Accessory",	from=12500,	color="ffabc2"},
			{ name="Abettor",	from=15000,	color="ff95d2"},
			{ name="Conspirator",	from=17500,	color="fd82f1"},
			{ name="Mastermind",	from=20000,	color="cc88ff"},
		},
		check = function(id,fid,ftex)
			return fid==2601 or fid==2605 or fid==2607
		end
	},

	['delvecompanion'] = {
		standings = {
			{ name="Level 1",	from=0 ,	color="ffff00"},
			{ name="Level 2",	from=2500,	color="ffff00"},
			{ name="Level 3",	from=5500,	color="fdfb09"},
			{ name="Level 4",	from=9100,	color="fdfb09"},
			{ name="Level 5",	from=13420,	color="fbf712"},
			{ name="Level 6",	from=18604,	color="fbf712"},
			{ name="Level 7",	from=24825,	color="faf31a"},
			{ name="Level 8",	from=32290,	color="faf31a"},
			{ name="Level 9",	from=41248,	color="f8ef23"},
			{ name="Level 10",	from=51997,	color="f8ef23"},
			{ name="Level 11",	from=64497,	color="f6ea2c"},
			{ name="Level 12",	from=76997,	color="f6ea2c"},
			{ name="Level 13",	from=89497,	color="f4e635"},
			{ name="Level 14",	from=101997,	color="f4e635"},
			{ name="Level 15",	from=114497,	color="f3e23e"},
			{ name="Level 16",	from=126997,	color="f3e23e"},
			{ name="Level 17",	from=139497,	color="f1de46"},
			{ name="Level 18",	from=151997,	color="f1de46"},
			{ name="Level 19",	from=164497,	color="efda4f"},
			{ name="Level 20",	from=176997,	color="efda4f"},
			{ name="Level 21",	from=189497,	color="edd658"},
			{ name="Level 22",	from=201997,	color="edd658"},
			{ name="Level 23",	from=214497,	color="ecd261"},
			{ name="Level 24",	from=226997,	color="ecd261"},
			{ name="Level 25",	from=239497,	color="eace6a"},
			{ name="Level 26",	from=251997,	color="eace6a"},
			{ name="Level 27",	from=264497,	color="e8ca72"},
			{ name="Level 28",	from=276997,	color="e8ca72"},
			{ name="Level 29",	from=289497,	color="e6c67b"},
			{ name="Level 30",	from=301997,	color="e6c67b"},
			{ name="Level 31",	from=314497,	color="e5c184"},
			{ name="Level 32",	from=326997,	color="e5c184"},
			{ name="Level 33",	from=339497,	color="e3bd8d"},
			{ name="Level 34",	from=351997,	color="e3bd8d"},
			{ name="Level 35",	from=364497,	color="e1b995"},
			{ name="Level 36",	from=376997,	color="e1b995"},
			{ name="Level 37",	from=389497,	color="dfb59e"},
			{ name="Level 38",	from=401997,	color="dfb59e"},
			{ name="Level 39",	from=414497,	color="deb1a7"},
			{ name="Level 40",	from=426997,	color="deb1a7"},
			{ name="Level 41",	from=439497,	color="dcadb0"},
			{ name="Level 42",	from=451997,	color="dcadb0"},
			{ name="Level 43",	from=464497,	color="daa9b9"},
			{ name="Level 44",	from=476997,	color="daa9b9"},
			{ name="Level 45",	from=489497,	color="d8a5c1"},
			{ name="Level 46",	from=501997,	color="d8a5c1"},
			{ name="Level 47",	from=514497,	color="d7a1ca"},
			{ name="Level 48",	from=526997,	color="d7a1ca"},
			{ name="Level 49",	from=539497,	color="d59dd3"},
			{ name="Level 50",	from=551997,	color="d59dd3"},
			{ name="Level 51",	from=564497,	color="d398dc"},
			{ name="Level 52",	from=576997,	color="d398dc"},
			{ name="Level 53",	from=589497,	color="d194e5"},
			{ name="Level 54",	from=601997,	color="d194e5"},
			{ name="Level 55",	from=614497,	color="d090ed"},
			{ name="Level 56",	from=626997,	color="d090ed"},
			{ name="Level 57",	from=639497,	color="ce8cf6"},
			{ name="Level 58",	from=651997,	color="ce8cf6"},
			{ name="Level 59",	from=664497,	color="cc88ff"},
			{ name="Level 60",	from=676997,	color="cc88ff"},
		},
		check = function(id,fid,ftex)
			return fid==2640
		end
	},


	
	
	['basic_friend'] = {
		standings = {
			{ name="Neutral",  from=0, color="ffff00" },
			{ name="Friendly", from=1*3000, color="00ff00" },
			{ name="Honored",  from=3*3000, color="00ff88" },
			{ name="Revered",  from=7*3000, color="00ffff" },
			{ name="Exalted",  from=14*3000, color="cc88ff" },
		},
		-- no check; assumed for all Friendship reps, unless another check matches.
	},
	['major'] = {
		use_renown = true,
		---@return StandingDef
		standings = setmetatable({},{__index = function(rep,num)  return { name="Renown "..num, color="ffffff" }  end}),
		check = function (id, fid, ftex)
			return C_Reputation and C_Reputation.IsMajorFaction and C_Reputation.IsMajorFaction(id)
		end
	}
}
Faction.ReputationTypes = reptypes  -- for debugging

local defaultReps = {
	[941]=3,  -- "The Mag'har" : unfriendly
	[978]=3,  -- "Kurenai" : unfriendly
	[1275]=5, -- "Ella" : 
	[1277]=5, -- "Chee Chee" : 
	[1281]=5, -- "Gina Mudclaw" : 
	[1273]=5, -- "Jogu the Drunk" : 
	[1278]=5, -- "Sho" : 
	[932]=3,  -- "The Aldor" : The Aldor: unfriendly
	[934]=3,  -- "The Scryers" : The Scryers: unfriendly
	[2432]=1, -- "Ve'nari" : Dubious
}


local standingnums={} -- for by-name lookups.
Faction.StandingNums = standingnums  -- exported for Parser and Goal

local standingcolors = {"aa0000","ff0000","ff8800","ffff00","00ff00","00ff88","00ffff","cc88ff",[105]="00ff44",[106]="00ffcc"}   -- what's with the 105 and 106??

for type,data in pairs(reptypes) do
	for num,standing in ipairs(data.standings) do
		standingnums[standing.name]=num  -- no reverse lookups, too many conflicts between faction types!
		standingcolors[standing.name]=standing.color
	end
end


local LF=ZygorGuidesViewer_L("Faction")

tinsert(ZGV.startups,{"Faction startup",function(self)
	Faction:UPDATE_FACTION()
	--self:AddEventHandler("PLAYER_ENTERING_WORLD","UPDATE_FACTION_Faction")
	self:AddEventHandler("UPDATE_FACTION",{Faction,"UPDATE_FACTION"})
	if ZGV.IsRetail then
		self:AddEventHandler("COVENANT_SANCTUM_RENOWN_LEVEL_CHANGED",{Faction,"UPDATE_FACTION"})
		self:AddEventHandler("MAJOR_FACTION_RENOWN_LEVEL_CHANGED",{Faction,"UPDATE_FACTION"})
	end
	--self:AddEventHandler("CHAT_MSG_COMBAT_FACTION_CHANGE","CHAT_MSG_COMBAT_FACTION_CHANGE_Faction")

	-- translate
	local sex = UnitSex("player")==3 and "_FEMALE" or ""
	for i=1,8 do
		reptypes["faction"].standings[i].name_local = _G['FACTION_STANDING_LABEL'..i..sex]
	end

	--tillerrepnames[4]=tillerrepnames[5] --Stranger
end})

--[[
NOTES:

FACTION reps:
-------------
local name,desc,standing,min,max,val,_,_,header,_,headerhasrep,_,_, _,_,id = GetFactionInfoByID(1281)

min,max = used for bar display
val = actual value
"1000/2500" shown on bar is just (val-min)/(max-min)
^ bar shows: min->val->max


FRIENDSHIP reps:
----------------
local friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThresh, friendThreshNext = C_GossipInfo.GetFriendshipReputation(1281)

standing = ignored? 1? whatever
min->val->max = shown on bar in reps panel?
friendThresh->friendRep->friendThreshNext = shown on bar, too?

GossipFrame: if not friendThresh then  friendThresh, friendThreshNext, friendRep = 0, 1, 1  end   -- simulate full bar



local name,desc,standing,min,max,val,_,_,header,_,headerhasrep,_,_, _,_,id = GetFactionInfoByID(1281)
name="Gina"
desc=""
standing=6
min=9000
max=21000
val=13860

local friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThresh, friendThreshNext = C_GossipInfo.GetFriendshipReputation(1281)
friendRep=13860 ==val?
friendMaxRep=42999
friendThresh=8400

barValue = friendRep - friendThresh   == 11880-8400
barMax = min( friendMaxRep - friendThresh, 8400)   == 42999-8400 .. 8400   (so, 8400 or less)


3480/8400



*** At tillers rep change, there's:  -7410 (-88.2%) - 10% to Buddy

*** friendThresh = solution? humm?

--]]

ZGV.factions_mentioned = {}



function Faction:GetFakeRep(id,standing,min,max,val,name)
	local oldrep = self.reputations[id]
	local rep = self.RepProto:New(id,name)
	rep.standing = standing or rep.standing
	if min then rep.min=min end
	if max then rep.max=max end
	if val then rep.val=val end
	if oldrep then rep.reptypemeta = oldrep.reptypemeta end
	return rep
end

function Faction:ReportChange(name,delta,progdelta,going)
	print(("|cffbbbbff%s|r: %s%d (%.1f%%) - %s"):format(
		name,
		delta>0 and "+" or "", delta,
		progdelta*100,
		going
	))
end

function Faction:ReportNoChange(name,going)
	print(("|cffbbbbff%s|r: %s"):format(
		name,
		going
	))
end

function Faction:CacheRepByID(id) -- OVERRIDDEN in Classic
	local name,desc,standing,bmin,bmax,val,_,_,header,_,headerhasrep,_,_, _ , hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(id)
	local friendData = C_GossipInfo.GetFriendshipReputation(id)
	local friendID = friendData.friendshipFactionID or 0
	local friendRep = friendData.standing
	local friendThresh = friendData.reactionThreshold
	local friendThreshNext = friendData.nextThreshold
	
	name = name or friendData.name
	if not name then return false,"no name",id end
	
	local reptype = (function()
		for typ,data in pairs(reptypes) do if data.check and data.check(id,friendID or 0,friendData.texture) then return typ end end
		if friendID>0 then return "basic_friend" end
		return "faction"
	end)()
	local repdata = reptypes[reptype]

	local maxstanding
	if reptype=="major" then -- whole different set of data
		local majorFacData = C_MajorFactions.GetMajorFactionData(id)
		if majorFacData then
			val = majorFacData.renownReputationEarned
			bmin = 0
			bmax = majorFacData.renownLevelThreshold
			standing = majorFacData.renownLevel
			local levels = C_MajorFactions.GetRenownLevels(id)
			maxstanding = #levels
		else
			reptype = "faction"
			repdata = repdata[reptype]
		end
	end

	if friendID>0 then  -- Friendships; figure out numeric standing from thresholds
		if friendThreshNext then
			bmin,bmax,val = friendThresh, friendThreshNext, friendRep
		else
			bmin,bmax,val = 0,1,1
		end

		for index,data in ipairs(repdata.standings) do
			if friendRep>=(data.from or 0) then standing=index end
		end
	end

	-- data gathered, let's put it in

	local oldval,oldsta,oldmin,oldprog
	local rep = self.reputations[id]
	if rep then
		if rep.val~=val or rep.standing~=standing then
			oldval=rep.val
			oldsta=rep.standing
			oldmin=rep.min
			oldprog=rep.progress
		end
	else
		rep = self.RepProto:New(id,name)
		self.reputations[id]=rep
	end
	if bmax==bmin then bmax=bmin+1 end
	local progress = (val-bmin)/(bmax-bmin)
	
	rep.id = id
	rep.name = name
	rep.reptype = reptype
	rep.reptypemeta = repdata
	rep.standing = standing
	rep.min=bmin
	rep.max=bmax
	rep.val=val
	rep.progress=progress
	rep.hasBonus = hasBonusRepGain
	rep.friendID = friendID
	rep.friendRep = friendRep
	rep.maxstanding = maxstanding

	-- Dinging a majorfac renown level goes like this:
	-- U_F changes val from 990 to 10 (for example)
	-- M_F_R_L_C changes standing

	if (oldval and oldval~=val) or (oldsta and oldsta~=standing) then self:Debug("Rep change: %s (%d) by %d to %d, standing %d",rep.name,rep.id,rep.val-oldval,rep.val,rep.standing) end
	
	if ZGV.db.profile.analyzereps then
		if (oldval and oldval~=val) or (oldsta and oldsta~=standing) then
			if rep.reptype=="major" and rep.val<oldval then -- don't report negative rep changes for major factions; probably M_F_R_L_C incoming next, with no val change but with standing change
				--self:ReportNoChange(rep.name, rep:Going(true))
			elseif rep.reptype=="major" and rep.val==oldval and oldsta~=standing then -- report just new standing, this is likely M_F_R_L_C
				self:ReportNoChange(rep.name, rep:Going(true))
			else
				self:ReportChange(rep.name, rep.val-oldval, (oldmin~=rep.min and rep.progress or rep.progress-oldprog), rep:Going(true))
			end
		end
	end
	
	if C_Reputation.IsFactionParagon(id) then
		local currentValue, threshold, rewardQuestID, hasRewardPending, tooLowLevelForParagon = C_Reputation.GetFactionParagonInfo(id)
		local oldParagonVal,oldParagonProgress
		if not tooLowLevelForParagon then
			local value = mod(currentValue, threshold)
			oldParagonVal=rep.paragonVal
			oldParagonProgress=rep.paragonProgress
			rep.paragonVal=value
			if hasRewardPending then value=threshold end -- imitate cap
			rep.paragonThresh=threshold
			rep.paragonReward = hasRewardPending
			rep.paragonProgress = value/threshold
		end
		if ZGV.db.profile.analyzereps then
			if oldParagonVal and oldParagonVal~=rep.paragonVal then self:ReportChange(rep.name,rep.paragonVal-oldParagonVal,rep.paragonProgress-oldParagonProgress, rep:Going(true)) end
		end
	end

	return rep
end

function Faction:CacheReputations()
	local faction_ids = {}
	for id=1,MAX_FACTION_ID do
		local name,desc,standing,bmin,bmax,val,_,_,header,_,headerhasrep,_,_, existing_id , hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(id)
		if ZGV.IsRetail and not existing_id and id>=HIDDEN_FRIENDSHIP_ID_MIN and id<=HIDDEN_FRIENDSHIP_ID_MAX then -- maybe hidden friendship
			local fr=C_GossipInfo.GetFriendshipReputation(id)
			if fr and fr.text~="" then  existing_id=id  end
		end
		if existing_id then tinsert(faction_ids,existing_id) end
	end
	if ZGV.IsRetail then
		tinsert(faction_ids,2010) -- brawlgar arena
		tinsert(faction_ids,2011) -- brawlgar arena
	end

	for i,id in ipairs(faction_ids) do self:CacheRepByID(id) end
end

function ZGV:GetReputation(...)
	return Faction:GetReputation(...)
end

local name_to_id_cache = {}
local bad_name_id = -1
local known_duplicates = { -- factions that may be misidentified by name alone, because of duplicate entries.
	['Darkspear Trolls']=530, -- NOT 1447
}
function Faction:GetReputation(id)
	local name
	if type(id)=="string" then
		name,id=id,nil
		name = ZGV.BFL[name] or name -- localize
		if name_to_id_cache[name] then
			-- use cache
			id=name_to_id_cache[name]
		else
			if known_duplicates[name] then
				-- use hardcoded list
				id = known_duplicates[name]
			else
				-- find it the hard way
				for rid,rep in pairs(self.reputations) do  if rep.name==name then  id=rid  break end  end
				if not id then  id=bad_name_id  bad_name_id=bad_name_id-1  end  -- improvise id if name is bad
			end
			name_to_id_cache[name]=id
			ZGV.factions_mentioned[id]=name .. (id<0 and " UNKNOWN" or "")
		end
	end
	local rep = ZGV.db.profile.fakereps[id] and self:GetFakeRep(id,ZGV.db.profile.fakereps[id],nil,nil,nil,name or GetFactionInfoByID(id))
		or self.reputations[id]
		or self.RepProto:New(id,name or GetFactionInfoByID(id))
	return rep
end

function Faction:UPDATE_FACTION()
	ZGV:ThrottlerWrap("Faction_UPDATE_FACTION",0,function()
		Faction:CacheReputations()
		ZGV:UpdateFrame(true)
	end)
end

--[[
-- Not in use. Keep for debugging?
local messages={FACTION_STANDING_DECREASED,FACTION_STANDING_DECREASED_GENERIC,FACTION_STANDING_INCREASED,FACTION_STANDING_INCREASED_BONUS,FACTION_STANDING_INCREASED_GENERIC}
for i,msg in ipairs(messages) do messages[i]=msg:gsub("%%[.%d]?[sdf]","(.*)") end
function ZGV:CHAT_MSG_COMBAT_FACTION_CHANGE_Faction(event,text)
	--print("Faction!",text)
	for i,msg in ipairs(messages) do
		local faction = text:match(msg)
		if faction then
			local rep = self:GetReputation(faction)
			print(("%s: %s (%s)"):format(faction,rep:Current(),rep:Going()))
			return
		end
	end
end
--]]

function Faction:DEV_GetFactionsSorted()
	local tab={}
	for id,fac in pairs(self.reputations) do
		local name=fac.name or ("unnamed:"..id)
		if tab[name] then
			ZGV.F.dig_set(tab,"__DUPLICATES__",name,{tab[name].id})
			tinsert(tab.__DUPLICATES__[name],id)
		else
			tab[fac.name]=fac
		end
	end
	return tab
end

function Faction:DEV_DebugReputationsBasic()
	for id=1,MAX_FACTION_ID do repeat
		local name,desc,standing,bmin,bmax,val,_,_,header,_,headerhasrep,_,_, id , hasBonusRepGain, canBeLFGBonus = GetFactionInfoByID(id)
		if not id or header then break end --continue
		local rep = self:GetReputation(id)
		Spoo(rep)
		print(("#%d |cffffff88%s|r: (%s%s|r) %s, %s"):format(
			id,
			rep.name or "(?)",
			(setmetatable( { faction="|cffffaaff" } ,{__index=function() return "|cffff00ff" end}))[rep.reptype],
			rep.reptype,
			rep:GetFormattedStanding(),
			rep:Going(true)
		))
	until true end
end

function Faction:DEV_DetectHiddenFriendships() -- dev only
	local hf=0
	for id=1,MAX_FACTION_ID do
		local nam=GetFactionInfoByID(id)
		if not nam then 
			local fr=C_GossipInfo.GetFriendshipReputation(id)
			if fr.text~="" then
				hf=hf+1
				print(hf,":",id,fr.text)
			end
		end
	end
end

function Faction:Debug(s,...)
	return ZGV:Debug("&faction "..s,...)
end

local Spoo = LibStub("Spoo","silent")
if Spoo then
	setmetatable(Faction.reputations,{__itemname=function(rep)
		return ("%s (%s%s|r) %s, %s"):format(
			rep.name or "(?)",
			(setmetatable( { faction="|cffffaaff" } ,{__index=function() return "|cffff00ff" end}))[rep.reptype],
			rep.reptype or "?",
			rep:GetFormattedStanding(),
			rep:Going(true)
		)
	end})
end



-- #########################################################
-- #########################################################
-- #########################################################
-- #########################################################

---
-- @return

---@class Rep
---@field id number
---@field name string
---@field standing number
---@field min number
---@field max number
---@field val number
---@field progress number
---@field reptypemeta table
---@field New? function
---@field CalcTo? function
---@field CalcTotalTo? function
---@field DebugCalcTotalTo? function
---@field Going? function
---@field GetStandingName? function
---@field Current? function
---@field Next? function
---@field GetNextStanding? function
---@field EqualOrAbove? function
---@field Below? function
---@field GetFormattedStanding? function
---@field GetRawReputation? function
---@field GetRawFriendship? function
---@field ReportNoChange? function
---@field UpdateRep? function

local RepProto = {} ---@type Rep
Faction.RepProto = RepProto

function RepProto:New(id,name)
	local rep = { ---@type Rep
		id=id,
		name=name or GetFactionInfoByID(id),
		standing=defaultReps[id] or 4,min=0,max=0,val=0,
		progress=0,
		reptypemeta=reptypes['faction'],
	}
	for k,v in pairs(self) do rep[k]=v end
	return rep
end

function RepProto:CalcTo(standing)
	if type(standing)=="string" then standing=standingnums[standing] if not standing then return end end
	if standing-self.standing>1 then
		return nil,nil
	elseif standing<=self.standing then
		return 0
	else
		return self.max-self.val
	end
end

function RepProto:CalcTotalTo(standing)
	if type(standing)=="string" then standing=standingnums[standing] if not standing then return end end

	if standing<=self.standing then return 0 end

	local total = self.min
	local fromhostile = 0
	local current = self.val

	if self.val < 0 then
		-- we are in hated zone
		for i=self.standing,standing do
			if self.reptypemeta.standings[i].from <= 0 then
				fromhostile = math.abs(self.val - self.reptypemeta.standings[i].from)
			end
		end
		current = 0
		total = 0
	end

	for i=self.standing+1,standing do
		if self.reptypemeta.standings[i].from >= 0 then
			total = total + self.reptypemeta.standings[i].from
		end
	end
	return total+fromhostile - current
end

function RepProto:DebugCalcTotalTo()
	for i,stand in ipairs(self.reptypemeta.standings) do
		print(i,stand.name,self:CalcTotalTo(stand.name))
	end
end


local BAR_LEN = 20
local BAR_CHAR = "||"
local function bar(val)
	local bars=floor(val*BAR_LEN)
	return ("|cffffff00[|cff00ff00%s|r|cff666666%s|r]|r"):format(strrep(BAR_CHAR,bars),strrep(BAR_CHAR,BAR_LEN-bars))
end

function RepProto:GetStandingName(num)
	local standing = self.reptypemeta.standings[num]
	return standing and standing.name_local or standing.name or "?"
end

function RepProto:Current()
	return self:GetStandingName(self.standing)
end

function RepProto:Next()
	local nextstanding = self:GetNextStanding()
	return self.reptypemeta.standings[nextstanding].name
end

function RepProto:Going(color)
	local maxstanding = self.maxstanding or self.reptypemeta.standings.max or #self.reptypemeta.standings
	if color then
		if self.standing==maxstanding then
			if self.paragonVal then
				return LF["going"]:format(self.paragonProgress*100,"bonus: "..bar(self.paragonProgress))
			else
				return self:GetFormattedStanding(maxstanding)
			end
		else 
			return LF["going"]:format(self.progress*100,self:GetFormattedStanding(self:GetNextStanding())) .. ": "..bar(self.progress) 
		end
	else
		if self.standing==maxstanding then return self:Current() else return LF["going"]:format(self.progress*100,self:Next()) end
	end
end

function RepProto:GetNextStanding()
	if self.reptypemeta.standings.max==self.standing or self.maxstanding==self.standing then return self.standing end
	local nextstanding = self.standing+1
	if self.reptypemeta.standings[nextstanding] then return nextstanding
	else return self.standing end
end

function RepProto:EqualOrAbove(standing)
	if type(standing)=="string" then standing=standingnums[standing] if not standing then return end end
	return self.standing>=standing
end

function RepProto:Below(standing)
	if type(standing)=="string" then standing=standingnums[standing] if not standing then return end end
	return self.standing<standing
end

function RepProto:GetFormattedStanding(standing)
	if not standing then standing = self.friendship or self.standing end
	local standingmeta = self.reptypemeta.standings[standing]
	return ("|cff%s%s|r"):format(
		standingmeta.color or standingcolors[standing] or "5500ff?",
		standingmeta.name or ("?"..standing.."?"))
end

--- @return table rep Spoo-friendly GetFactionInfoByID() results
function RepProto:GetRawReputation()
	return setmetatable({GetFactionInfoByID(self.id)},{__desc={'name','desc','standing','bmin','bmax','val','_','_','header','_','headerhasrep','_','_','id','hasBonusRepGain','canBeLFGBonus'}})
end
function RepProto:GetRawFriendship()
	return setmetatable({C_GossipInfo.GetFriendshipReputation(self.id)},{__desc={'ID', 'Rep', 'MaxRep', 'Name', 'Text', 'Texture', 'TextLevel', 'Thresh', 'ThreshNext'}})
end

function RepProto:ReportNoChange()
	Faction:ReportNoChange(self.name, self:Going(true))
end

function RepProto:UpdateRep()
	Faction:CacheRepByID(self.id)
end





if ZGV.IsRetail then
	ZGV.Covenants={}
	function ZGV.Covenants.CacheResults()
		table.wipe(ZGV.db.char.covenantupgrades)
		ZGV.db.char.covenantupgrades["Reservoir Upgrades"]={}
		ZGV.db.char.covenantupgrades["Anima Conductor"]={}
		ZGV.db.char.covenantupgrades["Transport Network"]={}
		ZGV.db.char.covenantupgrades["Command Table"]={}
		ZGV.db.char.covenantupgrades["Covenant Unique"]={}

		local features = C_CovenantSanctumUI.GetFeatures()
		if not features then return end
		
		for _,data in ipairs(features) do
			local info = C_Garrison.GetTalentTreeInfo(data.garrTalentTreeID)
			local target
			if info then
				if info.featureType == Enum.GarrTalentFeatureType.ReservoirUpgrades then target = ZGV.db.char.covenantupgrades["Reservoir Upgrades"] end
				if info.featureType == Enum.GarrTalentFeatureType.AnimaDiversion then target = ZGV.db.char.covenantupgrades["Anima Conductor"] end
				if info.featureType == Enum.GarrTalentFeatureType.TravelPortals then target = ZGV.db.char.covenantupgrades["Transport Network"] end
				if info.featureType == Enum.GarrTalentFeatureType.Adventures then target = ZGV.db.char.covenantupgrades["Command Table"] end
				if info.featureType == Enum.GarrTalentFeatureType.SanctumUnique then target = ZGV.db.char.covenantupgrades["Covenant Unique"] end

				for i,talent in ipairs(info.talents) do
					target[talent.tier+1]=talent.researched
				end
			end
		end
	end

	tinsert(ZGV.startups,{"Faction: Covenants startup",function(self)
		ZGV.db.char.covenantupgrades = ZGV.db.char.covenantupgrades or {}
		ZGV.Covenants.Data = ZGV.db.char.covenantupgrades

		--ZGV:AddEventHandler("COVENANT_SANCTUM_INTERACTION_STARTED",ZGV.Covenants.CacheResults) -- DRAGONFLIGHT BUG, event missing
	end})
end
