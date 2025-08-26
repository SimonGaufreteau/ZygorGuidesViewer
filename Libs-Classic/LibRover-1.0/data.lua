local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.version={
	nodes_version = 10,  -- Increase this when working on the nodes. Bake the connections using the Debug menu when you're done.
}

-- These are kept strictly unique. Make up bogus names if you need to.
-- If multiple numbers are given, then only the first one is used here; others are used by Pointer to define phasedMaps.

data.MapIDsByName = {

--World Zones
["Azeroth"] = {[0]=947},
["Eastern Kingdoms"]={[0]=1415},
["Kalimdor"]={[0]=1414},

-------------------------------------
-------    EASTERN KINGDOMS   -------
-------------------------------------

["Alterac Mountains"]={[0]=1416},
["Arathi Highlands"]={[0]=1417},
["Badlands"]={[0]=1418},
["Blasted Lands"]={[0]=1419},
["Burning Steppes"]={[0]=1428},
["Deadwind Pass"]={[0]=1430},
["Dun Morogh"]={[0]=1426},
["Duskwood"]={[0]=1431},
["Eastern Plaguelands"]={[0]=1423},
["Elwynn Forest"]={[0]=1429},
["Hillsbrad Foothills"]={[0]=1424},
["Ironforge"]={[0]=1455},
["Loch Modan"]={[0]=1432},
["Redridge Mountains"]={[0]=1433},
["Searing Gorge"]={[0]=1427},
["Silverpine Forest"]={[0]=1421},
["Stormwind City"]={[0]=1453},
["Stranglethorn Vale"]={[0]=1434},
["Swamp of Sorrows"]={[0]=1435},
["The Hinterlands"]={[0]=1425},
["Tirisfal Glades"]={[0]=1420},
["Undercity"]={[0]=1458},
["Western Plaguelands"]={[0]=1422},
["Westfall"]={[0]=1436},
["Wetlands"]={[0]=1437},

--Kalimdor
["Ashenvale"]={[0]=1440},
["Azshara"]={[0]=1447},
["Darkshore"]={[0]=1439},
["Darnassus"]={[0]=1457},
["Desolace"]={[0]=1443},
["Durotar"]={[0]=1411},
["Dustwallow Marsh"]={[0]=1445},
["Felwood"]={[0]=1448},
["Feralas"]={[0]=1444},
["Moonglade"]={[0]=1450},
["Mulgore"]={[0]=1412},
["Orgrimmar"]={[0]=1454},
["Silithus"]={[0]=1451},
["Stonetalon Mountains"]={[0]=1442},
["Tanaris"]={[0]=1446},
["Teldrassil"]={[0]=1438},
["The Barrens"]={[0]=1413},
["Thousand Needles"]={[0]=1441},
["Thunder Bluff"]={[0]=1456},
["Un'Goro Crater"]={[0]=1449},
["Winterspring"]={[0]=1452},


--Battlegrounds
["Alterac Valley"]={[0]=1459},
["Arathi Basin"]={[0]=1461},
["Warsong Gulch"]={[0]=1460},

--Instanced Zones/Misc
["Eastern Kingdoms B"]={[0]=1463},
["Kalimdor B"]={[0]=1464},

-- Faked dungeons and raids
-- Kalimdor
["Blackfathom Deeps"] =		{[0]=9001,c=1414, instance=48  },
["Dire Maul"] =			{[0]=9005,c=1414, instance=429 },
["Maraudon"] =			{[0]=9007,c=1414, instance=349 },
["Onyxia"] =			{[0]=9010,c=1414, instance=249 },
["Ragefire Chasm"] =		{[0]=9010,c=1414, instance=389 },
["Razorfen Downs"] =		{[0]=9011,c=1414, instance=129 },
["Razorfen Kraul"] =		{[0]=9012,c=1414, instance=47  },
["Temple of Ahn'Qiraj"] =	{[0]=9019,c=1414, instance=531 },
["The Temple of Atal'Hakkar"] =	{[0]=9022,c=1414, instance=109 },
["Wailing Caverns"] =		{[0]=9024,c=1414, instance=43  },
["Zul'Farrak"] =		{[0]=9025,c=1414, instance=209 },

-- Eastern Kingdoms
["Blackrock Depths"] =		{[0]=9002,c=1415, instance=230 },
["Blackrock Spire"] =		{[0]=9003,c=1415, instance=229 },
["Blackwing Lair"] =		{[0]=9004,c=1415, instance=469 },
["Gnomeregan"] =		{[0]=9006,c=1415, instance=90  },
["Molten Core"] =		{[0]=9008,c=1415, instance=409 },
["Naxxramas"] =			{[0]=9009,c=1415, instance=533 },
["Ruins of Ahn'Qiraj"] =	{[0]=9013,c=1415, instance=509 },
["Scarlet Halls"] =		{[0]=9014,c=1415, instance=1001},
["Scarlet Monastery"] =		{[0]=9015,c=1415, instance=189},
["Scholomance"] =		{[0]=9016,c=1415, instance=289},
["Shadowfang Keep"] =		{[0]=9017,c=1415, instance=33  },
["Stratholme"] =		{[0]=9018,c=1415, instance=329 },
["The Deadmines"] =		{[0]=9020,c=1415, instance=36  },
["The Stockade"] =		{[0]=9021,c=1415, instance=34  },
["Uldaman"] =			{[0]=9023,c=1415, instance=70  },
["Zul'Gurub"] =			{[0]=9026,c=1415, instance=859 },

}

data.MapNamesByID = {}
data.FloorByID = {}
data.MapGroupIDs = {}
data.InstanceMaps = {}
data.InstanceMapsRev = {}
data.InstanceMapsContinents = {}
data.DungeonMaps = {} -- This is used by |goto implementation to detect which maps cannot be positioned anymore.
for mapname,mapdata in pairs(data.MapIDsByName) do 
	for floornum,floormap in pairs(mapdata) do
		if tonumber(floornum) then
			data.MapNamesByID[floormap] = {mapname,floornum}
			data.FloorByID[floormap] = floornum
			data.MapGroupIDs[floormap] = mapname
		end
	end
	if mapdata.instance then
		data.InstanceMaps[mapdata.instance] = mapdata[0]
		data.InstanceMapsRev[mapdata[0]] = mapdata.instance
		data.InstanceMapsContinents[mapdata[0]] = mapdata.c
		data.DungeonMaps[mapdata[0]] = true
	end
end

--[[
	YE OLDE HELP TEXT

	Okay, to clarify, there's multiple ways to write a map link now. It's a mess, but it works.

	The first, simplest way, is two nodes linked, written in plain text (let's hope they're accessible by some means):
		"First Zone/2 11.22,33.44 -x- Second Zone/3 55.66,77.88",

	The "-x-" means it's a crossing, two-way. You can use "-to-" to make a one-way link.


	NODE NAMES:

	Adding @something after the node coordinates gives the node a name, for later reuse.
		"Stormwind 11.22,33.44 -x- Elwynn Forest 55.66,77.88 @stormgate",
		"Elwynn 77.77,66.66 -x- @stormgate",

	You can also use @+ to indicate the last node created or mentioned, whether it was named or not.
		"Stormwind 11.22,33.44 -x- Elwynn Forest 55.66,77.88",
		"@+ -x- Elwynn 77.77,66.66",

	This allows for easy chaining of nodes.


	ONE NODE?

	You can create just one node:
		"Solitary 11.1,22.2"

	This only makes sense if you @+ link to it later, or give it an explicit @name and refer to that.


	ADDITIONAL NODE DATA:

	Writing <field:value> after a node's coordinates assigns additional data.
		"Stormwind 11.1,22.2 <title:Watch out, dog poo> <radius:5>"

	Data fields include (among others):
		'title' to caption a node,
		'radius' to set the node's player-detection radius,
		'region' to assign a node to a special region,
		'nofly' set to 1 means the node cannot be flown to,
		'dark' set to 1 means the node can only be seen by the player from a small distance, but suffers no penalty when chained between other nodes


	ADDITIONAL LINK DATA:

	Writing {field:value} after both nodes assigns data to their link:
		"Stormwind 11.1,22.2 -x- Elwynn Forest 55.5,66.6 {cost:999}"   -- this is a very time-costly connection


	ADVANCED FORMAT:

	If that's not enough, you can use a "raw" format to write node links:
		{ "@+" , "Orgrimmar/1 11.1,22.2" , template="portalauto", faction="H", cost=123 }

	Within that, you can go even deeper and write the node(s) in raw mode, too:
		{ "@+" , {"Orgrimmar/1 11.1,22.2",title="Something in Orgri",region="whatever"} , oneway=1 }

	Very advanced, messy, "fake zone"-based mapping (Maraudon the Zone of Nightmares) makes extensive use of that.

--]]


data.basenodes = {}

data.basenodes.setup = {
	--"REGION fuselightbtspre Badlands 79.1,31.6 <150",
}



-- These zone pairs see directly into each other, as they share "green" borders.
data.greenborders = {

	{"Western Plaguelands","Eastern Plaguelands"},
	{"Feralas","Thousand Needles"},
	{"The Barrens","Durotar"},
	{"Mulgore","Thunder Bluff"},
	{"Elwynn Forest","Duskwood"},
	{"Westfall","Duskwood"},
	{"Westfall","Elwynn Forest"},
	{"Hillsbrad Foothills","Alterac Mountains"},
	--{"The Temple of Atal'Hakkar","Swamp of Sorrows"},
}

data.walls = {
}

data.ZoneMeta = {
	["ALL_MICROS"] = {hostile=true},
	--[111] = {hostile=false},
	--[222] = {minlevel=50},
	
	["Western Plaguelands/0"] = {levelhostile=3}, -- hostile if player is more than 3 levels below blizz recommender minimum
}

--[[
--]]



-- force areas of map1 to be treated as if player was on target map. useful when blizz map detection fails and gives us continent instead of local map. 
data.RemapData = {
	-- source map = ractange based on y,x = unitposition, target map to remap coords to
	-- use ZGV.Testing.remap_dump to grab this
	--/run ZGV.Testing.Remaps:Record()
	--/run ZGV.Testing.Remaps:Report()
	--/run WorldMapFrame.BlackoutFrame:Hide()
	[1414] = { -- Kalimdor
		{top=7380.2001953125, bottom=7111.6000976563, left=-2149.9001464844, right=-2217.1000976563, target=1450}, -- timbermaw hold north part to moonglade
		{top=-3368.0380859375, bottom=-4531.5688476562, left=1612.5491943359, right=682.98950195312, target=1444}, -- Dire Maul entrance to feralas
		{top=-481.93762207031, bottom=-844, left=-1734.4168701172, right=-2443.75, target=1413},	-- Wailing Caverns entrance
		{top=-4125.3334960938, bottom=-4530.3623046875, left=-1276.0064697266, right=-1762.8522949219, target=1413},--Razorfen Kraul entrance
		{top=-4582.068359375, bottom=-4775.9653320312, left=-2201.96484375, right=-2542.3266601562, target=1413},--Razorfen Downs entrance
		{top=4370.810546875, bottom=4036.9792480469, left=1075.3408203125, right=622.20294189453, target=1440},--Blackfathom Deeps entrance
		{top=-8169.6137695312, bottom=-8618.4921875, left=2033.1823730469, right=1360.8060302734, target=1451},--The Scarab Wall
		{top=-691.6240234375, bottom=-1758.9799804688, left=3207.9675292969, right=2398.7431640625, target=1443},--Maraudon entrance
	},
	[1415] = { -- Eeastern Kingdoms
		{top=-11034.790039062, bottom=-11321.396484375, left=1741.1593017578, right=1311.25, target=1436}, -- deadmines entrance to westfall
		{top=-10132.08203125, bottom=-10545.963867188, left=-3655.4799804688, right=-4123.0810546875, target=1435}, -- swamp of sorrows lake fix
		{top=-4721.1206054688, bottom=-5505.3076171875, left=1252.9982910156, right=558.43389892578, target=1426}, --Gnomeregan entrance
		{top=2943.8537597656, bottom=2767.0622558594, left=-615.70629882812, right=-928.17529296875, target=1420}, --Scarlet Monastery
		{top=-6028.44921875, bottom=-6189.142578125, left=-2917.7893066406, right=-3252.7543945312, target=1418}, --Uldaman entrance
		{top=-6508.2651367188, bottom=-6736.8564453125, left=-3644.3022460938, right=-3979.2670898438, target=1418}, --Uldaman rear entrance
		{top=-7150.4682617188, bottom=-7780.24609375, left=-880.25659179688, right=-1410.1198730469, target=1427}, --Blackrock Mountain/Searing Gorge
		{top=-7780.24609375, bottom=-8027.24609375, left=-1000.25659179688, right=-1280.1198730469, target=1428}, --Blackrock Mountain/Burning Steppes
		{top=1360.0352783203, bottom=1193.6667480469, left=-2490.8962402344, right=-2697.4860839844, target=1422}, --Scholomance entrance
		{top=3337.2485351562, bottom=3076.5563964844, left=-3941.2150878906, right=-4173.6611328125, target=1423}, --Stratholme Service entrance
		{top=3536.4562988281, bottom=3251.6638183594, left=-3184.056640625, right=-3532.9575195312, target=1423}, --Stratholme Main entrance
	},
}