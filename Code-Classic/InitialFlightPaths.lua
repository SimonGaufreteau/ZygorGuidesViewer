local function loadFlightPaths()
	if not ZGV.db.char.initialFlightPathsLoaded then
		local initialPaths = {
			["Human"] = {
				["432:672"] = true, -- Stormwind
			},
			["Dwarf"] = {
				["507:488"] = true, -- Ironforge
			},
			["NightElf"] = {
				["416:157"] = true, -- Rut'theran Village
			},
			["Gnome"] = {
				["507:488"] = true, -- Ironforge
			},
			["Orc"] = {
				["628:443"] = true, -- Orgrimmar
			},
			["Scourge"] = { -- Undead
				["442:194"] = true, -- Undercity
			},
			["Tauren"] = {
				["449:561"] = true, -- Thunder Bluff
			},
			["Troll"] = {
				["628:443"] = true, -- Orgrimmar
			},
		}
		
		local raceName, raceID = UnitRace("player")		
		if initialPaths[raceID] then
			for i,v in pairs(initialPaths[raceID]) do
				ZGV.db.char.taxis[i] = true
			end
			ZGV.db.char.initialFlightPathsLoaded = true
		else
			ZGV:Debug("Missing initial flight paths for race: %s",raceID)
		end

		initialPaths = nil
	end
end

tinsert(ZGV.startups, {"InitialFlightPaths loading",loadFlightPaths})
