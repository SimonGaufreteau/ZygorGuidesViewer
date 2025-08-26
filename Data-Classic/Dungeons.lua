local Dungeons = ZGV.Dungeons

Dungeons.ExpansionsLimits = {
	[0] = 60, -- vanilla
}

Dungeons.Phases = {}

if ZGV.IsClassicAnniv then
	Dungeons.Phases = {
		["anniv1"] = true,
		["anniv2"] = false,
		["anniv3"] = false,
		["anniv4"] = false,
		["anniv5"] = false,
	}

end


-- Timewalks and legion mythics do not have any lfg entry, so we need to hardcode basic data for them
Dungeons.hardcoded_dungeons = {
	[719] =  {instanceID=48,   expansionLevel=0, minLevel=15, difficulty=1, mapid=9001, name="Blackfathom Deeps"},
	[1584] = {instanceID=230,  expansionLevel=0, minLevel=42, difficulty=1, mapid=9002, name="Blackrock Depths"},
	[2557] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul East", instancename="Dire Maul"},
	[2558] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul North", instancename="Dire Maul"},
	[2559] = {instanceID=429,  expansionLevel=0, minLevel=31, difficulty=1, mapid=9005, name="Dire Maul West", instancename="Dire Maul"},
	[721] =  {instanceID=90,   expansionLevel=0, minLevel=19, difficulty=1, mapid=9006, name="Gnomeregan"},
	[1583] = {instanceID=229,  expansionLevel=0, minLevel=48, difficulty=1, mapid=9003, name="Lower Blackrock Spire"},
	[2102] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Inner", instancename="Maraudon"},
	[2101] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Orange", instancename="Maraudon"},
	[2100] = {instanceID=349,  expansionLevel=0, minLevel=25, difficulty=1, mapid=9007, name="Maraudon Purple", instancename="Maraudon"},
	[2437] = {instanceID=389,  expansionLevel=0, minLevel=10, difficulty=1, mapid=9010, name="Ragefire Chasm"},
	[722] =  {instanceID=129,  expansionLevel=0, minLevel=35, difficulty=1, mapid=9011, name="Razorfen Downs"},
	[491] =  {instanceID=47,   expansionLevel=0, minLevel=25, difficulty=1, mapid=9012, name="Razorfen Kraul"},
	[796] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Armory", instancename="Scarlet Monastery"},
	[797] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Cathedral", instancename="Scarlet Monastery"},
	[798] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Graveyard", instancename="Scarlet Monastery"},
	[799] =  {instanceID=1004, expansionLevel=0, minLevel=20, difficulty=1, mapid=9015, name="Scarlet Monastery Library", instancename="Scarlet Monastery"},
	[2057] = {instanceID=1007, expansionLevel=0, minLevel=33, difficulty=1, mapid=9016, name="Scholomance"},
	[209] =  {instanceID=33,   expansionLevel=0, minLevel=11, difficulty=1, mapid=9017, name="Shadowfang Keep"},
	[2017] = {instanceID=329,  expansionLevel=0, minLevel=37, difficulty=1, mapid=9018, name="Stratholme Living", instancename="Stratholme"},
	[2018] = {instanceID=329,  expansionLevel=0, minLevel=37, difficulty=1, mapid=9018, name="Stratholme Undead", instancename="Stratholme"},
	[1581] = {instanceID=36,   expansionLevel=0, minLevel=10, difficulty=1, mapid=9020, name="The Deadmines"},
	[717] =  {instanceID=34,   expansionLevel=0, minLevel=15, difficulty=1, mapid=9021, name="The Stockade"},
	[1477] = {instanceID=109,  expansionLevel=0, minLevel=45, difficulty=1, mapid=9022, name="The Temple of Atal'Hakkar"},
	[1337] = {instanceID=70,   expansionLevel=0, minLevel=30, difficulty=1, mapid=9023, name="Uldaman"},
	[1582] = {instanceID=229,  expansionLevel=0, minLevel=48, difficulty=1, mapid=9003, name="Upper Blackrock Spire"},
	[718] =  {instanceID=43,   expansionLevel=0, minLevel=10, difficulty=1, mapid=9024, name="Wailing Caverns"},
	[1176] = {instanceID=209,  expansionLevel=0, minLevel=39, difficulty=1, mapid=9025, name="Zul'Farrak"},

	[2677] = {instanceID=469, expansionLevel=0, minLevel=60, difficulty=14, mapid=9004, name="Blackwing Lair"},
	[2717] = {instanceID=409, expansionLevel=0, minLevel=60, difficulty=14, mapid=9008, name="Molten Core"},
	[3456] = {instanceID=533, expansionLevel=0, minLevel=60, difficulty=14, mapid=9009, name="Naxxramas"}, -- verify instanceID, correct difficulty once unlocked
	[2159] = {instanceID=249, expansionLevel=0, minLevel=60, difficulty=14, mapid=9010, name="Onyxia"}, -- verify instanceID
	[3429] = {instanceID=509, expansionLevel=0, minLevel=60, difficulty=14, mapid=9013, name="The Ruins of Ahn'Qiraj"},
	[3428] = {instanceID=531, expansionLevel=0, minLevel=60, difficulty=14, mapid=9019, name="The Temple of Ahn'Qiraj"},
	[0] =    {instanceID=0,   expansionLevel=0, minLevel=60, difficulty=14, mapid=-1, name="World Bosses"},
	[1977] = {instanceID=309, expansionLevel=0, minLevel=60, difficulty=14, mapid=9026, name="Zul'Gurub"}, -- verify instanceID
}

if ZGV.IsClassicSoM then
	Dungeons.hardcoded_dungeons[2677] = nil -- Blackwing Lair
	Dungeons.hardcoded_dungeons[1977] = nil -- Zul'Gurub
	Dungeons.hardcoded_dungeons[3429] = nil -- The Ruins of Ahn'Qiraj
	Dungeons.hardcoded_dungeons[3428] = nil -- The Temple of Ahn'Qiraj
	Dungeons.hardcoded_dungeons[3456] = nil -- Naxxramas
end

Dungeons.max_levels = {
}

Dungeons.add_flags = {
}

if ZGV.IsClassicAnniv then
	Dungeons.add_flags[2717] = { phase="anniv1" }
	Dungeons.add_flags[2159] = { phase="anniv1" }
	Dungeons.add_flags[2159] = { phase="anniv1" }
	Dungeons.add_flags[2557] = { phase="anniv2" }
	Dungeons.add_flags[2558] = { phase="anniv2" }
	Dungeons.add_flags[2559] = { phase="anniv2" }
	Dungeons.add_flags[2677] = { phase="anniv3" }
	Dungeons.add_flags[1977] = { phase="anniv3" }
	Dungeons.add_flags[3429] = { phase="anniv4" }
	Dungeons.add_flags[3428] = { phase="anniv4" }
	Dungeons.add_flags[3456] = { phase="anniv5" }

	tinsert(ZGV.startups,{"Dungeons startup (anniversary)",function(self)
		if ZygorGuidesViewer.ItemScore.Items["Classic Dungeons\\World Bosses"] then
			for _,entry in pairs(ZygorGuidesViewer.ItemScore.Items["Classic Dungeons\\World Bosses"]) do
				if type(entry)=="table" then
					if entry.boss=="6109" or entry.boss=="12397" then -- Azuregos or Kazzak
						entry.phase = "anniv2"
					else -- Green Dragons	
						entry.phase = "anniv4"
					end
				end
			end
		end
	end})
end