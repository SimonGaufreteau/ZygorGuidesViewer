local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.transit = {






---------------------
----   PORTALS   ----
---------------------

	--## ALLIANCE ##--

		-- Rut'theran Village / Darnassus Pink Portal
			"Teldrassil 55.91,89.64 <region:ruttheran> -x- Darnassus 30.06,41.44 {fac:A} {mode:PORTAL} {title_atob:Enter the pink portal to Darnassus} {title_btoa:Enter the pink portal to Rut'theran Village}",

		-- Moonglade to Rut'theran Village Druid fake taxi
			"Moonglade 44.19,45.33 -to- Teldrassil 58.33,93.86 <region:ruttheran> {mode:PORTAL} {fac:A} {title:Take hippogryph to Rut'theran Village } {cost:145} {cond:ZGV:RaceClassMatch('DRUID')}",

	--## HORDE ##--

		-- Moonglade to Thunderbluff Druid fake taxi
			"Moonglade 44.27,45.77 -to- Thunder Bluff 46.70,49.92 {mode:PORTAL} {fac:H} {title:Take windrider to Thunder Bluff} {cost:515} {cond:ZGV:RaceClassMatch('DRUID')}",



-------------------------
-- BOATS AND ZEPPELINS --
-------------------------

	--## ALLIANCE ##--
		
		-- Rut'theran Village (Teldrassil) / Auberdine (Darkshore) Boat
			"Teldrassil 54.86,96.79 <region:ruttheran> -x- Darkshore 33.19,40.13 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Auberdine} {title_btoa:Ride the Boat to Rut'theran Village}",

		-- Menethil Harbor (Wetlands) / Auberdine (Darkshore) Boat
			"Wetlands 4.62,57.18 -x- Darkshore 32.41,43.79 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Auberdine} {title_btoa:Ride the Boat to Menethil Harbor}",

		-- Menethil Harbor (Wetlands) / Theramore Isle (Dustwallow Marsh) Boat
			"Wetlands 5.08,63.40 -x- Dustwallow Marsh 71.54,56.34 {fac:A} {mode:SHIP} {title_atob:Ride the Boat to Theramore Isle} {title_btoa:Ride the Boat to Menethil Harbor}",



		-- DEEPRUN TRAM (Ironforge / Stormwind City)
			-- Stormwind - Elwyyn Forest, Eastern Kingdoms --
			--"Stormwind City/0 69.62,31.11 -x- Deeprun Tram/1 42.53,11.53 @deeprun_sw {mode:PORTAL} {title_atob:Enter the Deeprun Tram Portal\nand Ride the Tram to Ironforge} "..
			--	"{title_btoa:Enter Ironforge through the Portal}",

			-- Ironforge - Dun Morogh, Eastern Kingdoms --
			--"Ironforge/0 76.93,51.25 -x- Deeprun Tram/1 45.77,12.47 @deeprun_if {mode:PORTAL} {title_atob:Enter the Deeprun Tram Portal\nand Ride the Tram to Stormwind City} "..
			--	"{title_btoa:Ride the Tram to Ironforge\nand Enter Ironforge through the Portal}",
			"Stormwind City/0 60.36,12.47 -x- Ironforge 72.90,50.27 {fac:A} {mode:PORTAL} {cost:500} {title_atob:Ride the Deeprun Tram to Ironforge} {title_btoa:Ride the Deeprun Tram to Stormwind}",



	--## HORDE ##--

		-- Undercity (Tirisfal Glades) / Orgrimmar (Durotar) Zeppelin
			"Tirisfal Glades 60.70,58.76 -x- Durotar 50.82,13.81 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Orgrimmar} {title_btoa:Ride the Zeppelin to Undercity}",

		-- Undercity (Tirisfal Glades) / Grom'gol Base Camp (Stranglethorn Vale) Zeppelin
			"Tirisfal Glades 61.88,59.10 -x- Stranglethorn Vale 31.53,29.15 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Grom'gol Base Camp} {title_btoa:Ride the Zeppelin to Undercity}",

		-- Orgrimmar (Durotar) / Grom'gol Base Camp (Stranglethorn Vale) Zeppelin
			"Durotar 50.57,12.66 -x- Stranglethorn Vale 31.35,30.12 {fac:H} {mode:ZEPPELIN} {title_atob:Ride the Zeppelin to Grom'gol Base Camp} {title_btoa:Ride the Zeppelin to Orgrimmar}",
	


	--## NEUTRAL ##--

		-- Booty Bay (Stranglethorn Vale) -x- Rachet (The Barrens) Boat
			"Stranglethorn Vale 25.92,73.15 -x- The Barrens 63.66,38.65 {fac:B} {mode:SHIP} {title_atob:Ride the Boat to Ratchet} {title_btoa:Ride the Boat to Booty Bay}",






------------------
-- CLASS SPELLS --
------------------

	----------------
	---   MAGE   ---		-- NOTE: ACCOUNT FOR "Rune of Teleportation" REQUIRED TO CAST TELEPORT SPELLS
	----------------
	
	--## ALLIANCE ##--
		-- Teleport: Darnassus
			"Darnassus 40.13,81.83		<spell:3565>	<faction:A>",
		
		-- Teleport: Ironforge
			"Ironforge 25.52,8.41		<spell:3562>	<faction:A>",
		
		-- Teleport: Stormwind
			"Stormwind City 38.01,80.84	<spell:3561>	<faction:A>",



	--## HORDE ##--
		-- Teleport: Undercity
			"Undercity 84.65,16.32		<spell:3563>	<faction:H>",

		-- Teleport: Orgrimmar
			"Orgrimmar 38.57,85.95		<spell:3567>	<faction:H>",
		
		-- Teleport: Thunder Bluff
			"Thunder Bluff 22.35,16.52	<spell:3566>	<faction:H>",
		
	

	-----------------
	---   DRUID   ---
	-----------------
		-- Teleport: Moonglade
			"Moonglade 56.26,32.46		<spell:18960>",
	


	------------------
	---   SHAMAN   ---
	------------------

		-- NOTE: ADD "Astral Recall" SPELL, IF POSSIBLE.
}
