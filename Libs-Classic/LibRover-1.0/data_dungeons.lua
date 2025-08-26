local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.DungeonEntrances = {}
data.basenodes.DungeonFloors = {}

data.basenodes.DungeonEntrances = {

--------------------------------------
---   DUNGEON ENTRANCES & EXITS    ---
--------------------------------------
	-- {autotype:portal_dungeon} gives the nice "enter dungeon"/"exit dungeon" mechanics.

	--------------------
	---   KALIMDOR   ---
	--------------------

		-- RAGEFIRE CHASM
			"Orgrimmar/0 53.55,48.33 -x- Ragefire Chasm/0 0.00,0.00 {autotype:portal_dungeon}",

		-- WAILING CAVERNS
			"The Barrens/0 45.97,36.25 <radius:20> <title:Enter the cave>",
			"@+ -x- The Barrens/0 46.23,34.89 <radius:15> <dark:1> <title:Follow the path>",
			"@+ -x- The Barrens/0 45.86,33.22 <radius:15> <dark:1> <title:Follow the path>",
			"@+ -x- The Barrens/0 47.44,33.14 <radius:15> <dark:1> <title:Follow the path>",
			"@+ -x- The Barrens/0 47.72,34.93 <radius:15> <dark:1> <title:Enter Wailing Caverns>",
			"@+ -x- Wailing Caverns/0 0.00,0.00 {autotype:portal_dungeon}",

		-- BLACKFATHOM DEEPS
			"Ashenvale/0 16.51,11.01 -x- Blackfathom Deeps/0 0.00,0.00 {autotype:portal_dungeon}",

		-- ZUL'FARRAK
			"Tanaris/0 38.73,19.74 -x- Zul'Farrak/0 0.00,0.00 {autotype:portal_dungeon}",

		-- RAZORFEN DOWNS
			"The Barrens/0 49.10,93.56 <radius:15> <title:Enter the cave>",
			"@+ -x- The Barrens/0 49.73,92.72 <radius:10> <dark:1> <title:Follow the path>",
			"@+ -x- The Barrens/0 50.25,92.83 <radius:10> <dark:1> <title:Follow the path>",
			"@+ -x- The Barrens/0 50.86,92.86 <radius:10> <dark:1> <title:Enter Razorfen Downs>",
			"@+ -x- Razorfen Downs/0 0.00,0.00 {autotype:portal_dungeon}",

		-- RAZORFEN KRAUL
			"The Barrens/0 43.71,90.11 <radius:15> <title:Follow the path>",
			"@+ -x- The Barrens/0 42.28,89.89 <radius:15> <dark:1> <title:Enter Razorfen Kraul>",
			"@+ -x- Razorfen Kraul/0 0.00,0.00 {autotype:portal_dungeon}",

		-- MARAUDON: EARTHSONG FALLS
			"Desolace/0 29.24,61.19 -to- Maraudon/0 0.00,0.00 {template:cityportal}",

		-- MARAUDON: THE WICKED GROTTO
			"Desolace/0 30.51,54.53 -x- Maraudon/0 0.00,0.00 {autotype:portal_dungeon}",

		-- MARAUDON: FOULSPORE CAVERN
			"Desolace/0 35.92,64.63 -x- Maraudon/0 0.00,0.00 {autotype:portal_dungeon}",

		-- DIRE MAUL: WARPWOOD QUARTER
			"Feralas/0 64.85,29.54 -x- Dire Maul/0 0.00,0.00 {autotype:portal_dungeon}",--Commons Right Entrance
			--"Feralas/0 76.45,35.90 -x- Dire Maul/0 0.00,0.00 {autotype:portal_dungeon}",--Lariss Pavilion Entrance
			
		-- DIRE MAUL: CAPITAL GARDENS
			--"Feralas/0 60.31,31.30 -x- Dire Maul/0 0.00,0.00 {autotype:portal_dungeon}",--Left Entrance
			"Feralas/0 59.49,29.35 -x- Dire Maul/0 0.00,0.00 {autotype:portal_dungeon}",--Right Entrance
			
		-- DIRE MAUL: GORDOK COMMONS
			"Feralas 62.82,24.46 -x- Dire Maul/0 0.00,0.00 {autotype:portal_dungeon}",--North

			

	----------------------------
	---   EASTERN KINGDOMS   ---
	----------------------------

		--Scholomance
			"Western Plaguelands/0 69.72,73.36 <radius:15> <title:Enter the building>",
			"@+ -x- Western Plaguelands/0 42.12,11.95 <radius:10> <dark:1> <title:Click the Scholomance Door\n|cffff1100 Requires the Skeleton Key!|r>",
			"@+ -x- Western Plaguelands/0 68.50,72.58 <radius:15> <dark:1> <title:Enter Scholomance>",
			"@+ -x- Scholomance/0 0.00,0.00 <dark:1> {autotype:portal_dungeon}",
		
		-- STRATHOLME: MAIN GATE
			"Eastern Plaguelands/0 30.85,19.78 <radius:15> <title:Cross the bridge>",
			"@+ -x- Eastern Plaguelands/0 31.34,15.78 <radius:15> <dark:1> <title:Enter Stratholme>",
			"@+ -x- Stratholme/0 0.00,0.00 <dark:1> {autotype:portal_dungeon}",
			
		-- STRATHOLME: SERVICE ENTRACE
			"Eastern Plaguelands/0 48.23,21.88 -x- Stratholme/0 0.00,0.00 {autotype:portal_dungeon}",
			
		--SUNKEN TEMPLE
			"Swamp of Sorrows/0 77.34,35.85 -x- The Temple of Atal'Hakkar/0 0.00,0.00 {autotype:portal_dungeon}",

		--Scarlet Monastery Armory
			"Tirisfal Glades/0 85.67,31.76 -x- Scarlet Monastery/0 0.00,0.00 {autotype:portal_dungeon}",
			
		--Scarlet Monastery Library
			"Tirisfal Glades/0 85.33,32.27 -x- Scarlet Monastery/0 0.00,0.00 {autotype:portal_dungeon}",
			
		--Scarlet Monastery Cathedral
			"Tirisfal Glades/0 85.32,30.48 -x- Scarlet Monastery/0 0.00,0.00 {autotype:portal_dungeon}",
			
		--Scarlet Monastery Graveyard
			"Tirisfal Glades/0 84.84,30.51 -x- Scarlet Monastery/0 0.00,0.00 {autotype:portal_dungeon}",

		-- DEADMINES
			"Westfall/0 38.16,77.48 -x- The Deadmines/0 0.00,0.00 {autotype:portal_dungeon}",
			
		-- SHADOWFANG KEEP
			"Silverpine Forest/0 47.16,69.51 <radius:20> <title:Follow the path up>",
			"@+ -x- Silverpine Forest/0 45.57,68.28 <radius:15> <dark:1> <title:Cross the bridge>",
			"@+ -x- Silverpine Forest/0 44.74,67.80 <radius:8> <dark:1> <title:Enter Shadowfang Keep>",
			"@+ -x- Shadowfang Keep/0 0.00,0.00 <dark:1> {autotype:portal_dungeon}",
			
		-- THE STOCKADE
			"Stormwind City/0 39.67,53.98 -x- The Stockade/0 0.00,0.00 {autotype:portal_dungeon}",

		-- GNOMEREGAN
			"Dun Morogh/0 17.41,39.12 -x- Gnomeregan/0 0.00,0.00 {autotype:portal_dungeon}",
			
		-- ULDAMAN
			"Badlands/0 44.28,12.15 <radius:15> <title:Enter the cave>",
			"@+ -x- Badlands/0 42.12,11.95 <radius:10> <dark:1> <title:Follow the path>",
			"@+ -x- Badlands/0 39.51,11.97 <radius:15> <dark:1> <title:Enter the tunnel>",
			"@+ -x- Badlands/0 37.73,11.57 <radius:10> <dark:1> <title:Follow the path>",
			"@+ -x- Badlands/0 36.41,11.99 <radius:10> <dark:1> <title:Jump down here>",
			"@+ -x- Badlands/0 35.23,10.40 <radius:15> <dark:1> <title:Enter Uldaman>",
			"@+ -x- Uldaman/0 0.00,0.00 <dark:1> {autotype:portal_dungeon}",


			--Back Entrance
			--"Badlands/0 65.33,43.59 <radius:15> <title:Enter the cave>",
			--"@+ -x- Badlands/0 66.78,44.94 <radius:10> <dark:1> <title:Follow the path>",
			--"@+ -x- Badlands/0 67.77,44.44 <radius:7> <dark:1> <title:Follow the path>",
			--"@+ -x- Badlands/0 67.76,43.89 <radius:8> <dark:1> <title:Enter Uldaman>",
			--"@+ -x- Uldaman/0 0.00,0.00 <dark:1> {autotype:portal_dungeon}",

		-- BLACKROCK DEPTHS
			"Searing Gorge/0 27.07,72.51 -x- Blackrock Depths/0 0.00,0.00 {autotype:portal_dungeon}",
			
		-- BLACKROCK SPIRE
			"Searing Gorge/0 40.70,95.71 -x- Blackrock Spire/0 0.00,0.00 {autotype:portal_dungeon}",
			

		

-----------------------------------
---   RAID ENTRANCES & EXITS    ---
-----------------------------------

	--------------------
	---   KALIMDOR   ---
	--------------------
		-- Temple of Ahn'Qiraj
			"Silithus/0 23.20,102.20 <radius:30> <title:Run up the stairs>",
			"@+ -x- Silithus/0 15.48,97.98 <radius:7> <dark:1> <title:Enter The\nTemple of Ahn'Qiraj>",
			"@+ -x- Temple of Ahn'Qiraj/0 0.00,0.00 {autotype:portal_dungeon}",
			
		-- Ruins of Ahn'Qiraj
			"Silithus/0 29.57,106.09 -x- Ruins of Ahn'Qiraj/0 0.00,0.00 {autotype:portal_dungeon}",
			
			
	
	----------------------------
	---   EASTERN KINGDOMS   ---
	----------------------------
		--Molten Core
			--"Blackrock Depths/2 68.8,38.2 -x- Molten Core/1 26.6,25.0 <subtype:portaldungeon>",
			--"Molten Core/1 26.5,24.3 -x- Burning Steppes/16 54.1,83.1 <subtype:portaldungeon>",
			--"Burning Steppes/16 54.1,83.1 -x- Molten Core/1 26.5,24.3 {autotype:portal_dungeon}",
			
		--Blackwing Lair
			--"Blackrock Spire/7 54.7,22.5 -x- Blackwing Lair/1 52.5,83.6 <subtype:portaldungeon>",
			--"Blackwing Lair/1 52.5,83.6 -x- Burning Steppes/14 65.6,42.2 <subtype:portaldungeon>",
			--"Burning Steppes/14 64.3,70.9 -x- Blackwing Lair/1 52.5,83.6 {autotype:portal_dungeon}",	
}








data.basenodes.DungeonFloors = {

}

--[[
-- translate the flooring zone-folders from names to numbers
	local TEMP={}
	for zone,zonedata in pairs(data.basenodes.DungeonFloors) do
		if type(zone)~="number" then
			local id=data.MapIDsByName[zone]
			if type(id)=="table" then id=id[1] end
			if not id then error("Map "..zone.." has no ID!") end
			zone=id
		end
		TEMP[zone]=zonedata
	end
	data.basenodes.DungeonFloors=TEMP
--]]