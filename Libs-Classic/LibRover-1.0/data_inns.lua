local name,addon = ...

addon.LibRoverData = addon.LibRoverData or {}
local data=addon.LibRoverData

data.basenodes.inns = {
	['Teldrassil']={
		{name="Shadowglen",x=58.59,y=44.79},								-- No NPC (Night Elf starter zone default hearthstone)
		{name="Dolanaar",faction="A",npc="Innkeeper Keldamyr",npcid=6736,x=55.62,y=59.79},
	},	
	
	['Dun Morogh']={
		{name="Coldridge Valley",x=29.87,y=71.98},								-- No NPC (Gnome & Dwarf starter zone default hearthstone)
		{name="Thunderbrew Distillery",faction="A",npc="Innkeeper Belm",npcid=1247,x=47.38,y=52.52},
	},

	['Elwynn Forest']={
		{name="Northshire Valley",x=48.06,y=43.65},								-- No NPC (Human starter zone default hearthstone)		
		{name="Goldshire",faction="A",npc="Innkeeper Farley",npcid=295,x=43.77,y=65.80},
	},

	['Darnassus']={
		{name="Craftsmen's Terrace",faction="A",npc="Innkeeper Saelienne",npcid=6735,x=67.42,y=15.65},
	},

	['Darkshore']={
		{name="Auberdine",faction="A",npc="Innkeeper Shaussiy",npcid=6737,x=37.04,y=44.13},
	},

	['Ironforge']={
		{name="Ironforge",faction="A",npc="Innkeeper Firebrew",npcid=5111,x=18.15,y=51.45},
	},

	['Stormwind City']={
		{name="Stormwind City",faction="A",npc="Innkeeper Allison",npcid=6740,x=52.62,y=65.70},
	},

	['Loch Modan']={
		{name="Stoutlager Inn",faction="A",npc="Innkeeper Hearthstove",npcid=6734,x=35.53,y=48.40},
	},

	['Westfall']={
		{name="Sentinel Hill",faction="A",npc="Innkeeper Heather",npcid=8931,x=52.86,y=53.72},
	},

	['Redridge Mountains']={
		{name="Lakeshire",faction="A",npc="Innkeeper Brianna",npcid=6727,x=27.01,y=44.82},
	},

	['Wetlands']={
		{name="Deepwater Tavern",faction="A",npc="Innkeeper Helbrek",npcid=1464,x=10.70,y=60.95},
	},

	['Duskwood']={
		{name="Darkshire",faction="A",npc="Innkeeper Trelayne",npcid=6790,x=73.87,y=44.41},
	},

	['Ashenvale']={
		{name="Astranaar",faction="A",npc="Innkeeper Kimlya",npcid=6738,x=36.99,y=49.22},
		{name="Splintertree Post",faction="H",npc="Innkeeper Kaylisk",npcid=12196,x=73.99,y=60.65},
	},

	['Stonetalon Mountains']={
		{name="Stonetalon Peak",faction="A",npc="Innkeeper Faralia",npcid=16458,x=35.79,y=5.74},
		{name="Sun Rock Retreat",faction="H",npc="Innkeeper Jayka",npcid=7731,x=47.47,y=62.13},
	},

	['Desolace']={
		{name="Nijel's Point",faction="A",npc="Innkeeper Lyshaerya",npcid=11103,x=66.27,y=6.55},
		{name="Shadowprey Village",faction="H",npc="Innkeeper Sikewa",npcid=11106,x=24.09,y=68.21},
	},

	['Dustwallow Marsh']={
		{name="Theramore Isle",faction="A",npc="Innkeeper Janene",npcid=6272,x=66.59,y=45.22},
	},

	['Tanaris']={
		{name="Gadgetzan",faction="B",npc="Innkeeper Fizzgrimble",npcid=7733,x=52.51,y=27.91},
	},

	['Durotar']={
		{name="Valley of Trials",x=43.29,y=68.85},							-- No NPC (Orc & Troll starter zone default hearthstone)
		{name="Razor Hill",faction="H",npc="Innkeeper Grosk",npcid=6928,x=51.51,y=41.64},
	},

	['Mulgore']={
		{name="Camp Narache",x=44.88,y=77.22},								-- No NPC (Tauren starter zone default hearthstone)
		{name="Bloodhoof Village",faction="H",npc="Innkeeper Kauth",npcid=6747,x=46.62,y=61.09},
	},

	['Tirisfal Glades']={
		{name="Shadow Grave",x=30.01,y=71.74},							-- No NPC (Undead starter zone default hearthstone)		
		{name="Gallows' End Tavern",faction="H",npc="Innkeeper Renee",npcid=5688,x=61.71,y=52.05},
	},

	['Orgrimmar']={
		{name="Orgrimmar",faction="H",npc="Innkeeper Gryshka",npcid=6929,x=54.10,y=68.41},
	},

	['Thunder Bluff']={
		{name="Thunder Bluff",faction="H",npc="Innkeeper Pala",npcid=6746,x=45.82,y=64.73},
	},

	['Undercity']={
		{name="Undercity",faction="H",npc="Innkeeper Norman",npcid=6741,x=67.74,y=37.89},
	},

	['Silverpine Forest']={
		{name="The Sepulcher",faction="H",npc="Innkeeper Bates",npcid=6739,x=43.18,y=41.28},
	},

	['The Barrens']={
		{name="The Crossroads",faction="H",npc="Innkeeper Boorand Plainswind",npcid=3934,x=51.99,y=29.89},
		{name="Ratchet",faction="B",npc="Innkeeper Wiley",npcid=6791,x=62.05,y=39.41},
		{name="Camp Taurajo",faction="H",npc="Byula",npcid=7714,x=45.58,y=59.04},
	},

	['Hillsbrad Foothills']={
		{name="Tarren Mill",faction="H",npc="Innkeeper Shay",npcid=2388,x=62.78,y=19.03},
		{name="Southshore",faction="A",npc="Innkeeper Anderson",npcid=2352,x=51.17,y=58.93},
	},

	['Thousand Needles']={
		{name="Freewind Post",faction="H",npc="Innkeeper Abeqwa",npcid=11116,x=46.07,y=51.52},
	},

	['Arathi Highlands']={
		{name="Hammerfall",faction="H",npc="Innkeeper Adegwa",npcid=7731,x=73.84,y=32.46},
	},

	['Stranglethorn Vale']={
		{name="Grom'gol Base Camp",faction="H",npc="Innkeeper Thulbek",npcid=5814,x=31.49,y=29.75},
		{name="Booty Bay",faction="B",npc="Innkeeper Skindle",npcid=6807,x=27.04,y=77.31},
	},

	['Swamp of Sorrows']={
		{name="Stonard",faction="H",npc="Innkeeper Karakul",npcid=6930,x=45.16,y=56.66},
	},

	['Badlands']={
		{name="Kargath",faction="H",npc="Innkeeper Shul\'kar",npcid=9356,x=2.81,y=45.85},
	},

	['Feralas']={
		{name="Feathermoon Stronghold",faction="A",npc="Innkeeper Shyria",npcid=7736,x=30.97,y=43.49},
		{name="Camp Mojache",faction="H",npc="Innkeeper Greul",npcid=7737,x=74.80,y=45.18},
	},

	['The Hinterlands']={
		{name="Wildhammer Keep",faction="A",npc="Innkeeper Thulfram",npcid=7744,x=14.15,y=41.57},
		{name="Revantusk Village",faction="H",npc="Lard",npcid=14731,x=78.14,y=81.38},
	},

	['Winterspring']={
		{name="Everlook",faction="B",npc="Innkeeper Vizzie",npcid=11118,x=61.36,y=38.83},
	},

	['Silithus']={
		{name="Cenarion Hold",faction="B",npc="Calandrath",npcid=15174,x=51.89,y=39.16},
	},

	['Eastern Plaguelands']={
		{name="Light's Hope Chapel",faction="B",npc="Jessica Chambers",npcid=16256,x=81.63,y=58.08},
	},
}
