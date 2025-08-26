local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

--[[
	Regions are custom subzones. Unwanted beelines are prevented if nodes are in different regions.
	A region must have a name (and many regions can share a name), and either:
		- center (map+coords), radius (number in yards) : for coordinate-based detection
		- minimapzone (English, from GetMinimapZoneText()), optionally mapzone : for subzone name-based detection
	After those, regions can have any properties, the ones in use are:
		- nofly : nodes in the region get the 'nofly' attribute, becoming unreachable for flight
		- dark : costs of travel from start and to end node get multiplied, and non-hardwired node linkage is completely forbidden. Use only for "one possible path only" zones.

	In general, if you want a region to have a specific route through it, set it to dark so that the system doesn't ignore the route and plan a beeline instead.
	Then, remember to add some nodes in the region, so that there IS a reasonable path through it...

	Conversely, if you set dark and don't plan some paths across the area, it'll become a "swamp", an area the system will try to avoid altogether.

	You can also add "green borders" to a region, so that it is directly seen and connected to a neighboring zone, instead of its own zone.
--]]
data.basenodes.advanced = {
	{"REGION",name="ruttheran",center="Teldrassil 55,92",radius=200},
	--		Swamp of Sorrows 69.6,53.9 (Temple of Atal'Hakkar Outside (Entering Doorway Outside mini map))
	--		Swamp of Sorrows 69.8,52.9 (Temple of Atal'Hakkar Inside (going downstairs Inside mini map))
	--
	--		Swamp of Sorrows 70.0,51.1 (5 yds before Broken Hall starts (underwater))
	--		Swamp of Sorrows 70.2,50.4 (5 yds into Broken Halls (swimming across pool indoors))
	--
	--		Swamp of Sorrows 70.9,46.2 (5 yds before exting Broken Halls (out of water on stone floor))
	--		Swamp of Sorrows 71.1,45.4 (5 yds entering indoor The Temple of Atal'Hakkar (hallway L))
	--
	--		Swamp of Sorrows 73.7,44.3 (5 yds before exiting indoor The Temple of Atal'Hakkar (hallway downstairs L))
	--		Swamp of Sorrows 74.3,44.5 (5 yds Entering Hall of Masks (exiting stairs hallway))
	--
	--		Swamp of Sorrows 76.0,45.3 (Portal to Dungeon (in hall of masks))	
}

