local ZGV = ZygorGuidesViewer

local ItemScore = {}
ZGV.ItemScore = ItemScore
local L = ZGV.L

-- Stat keywords:
-- Only stats defined in this table are valid. Use entry in blizz when filling rule sets

local locale=GetLocale()
if locale=="enGB" then locale="enUS" end  -- just in case.

ItemScore.Keywords = {
	{blizz="AGILITY", zgvdisplay="Agility",pattern="ITEM_MOD_AGILITY"},
	{blizz="INTELLECT", zgvdisplay="Intellect",pattern="ITEM_MOD_INTELLECT"},
	{blizz="SPIRIT", zgvdisplay="Spirit",pattern="ITEM_MOD_SPIRIT"},
	{blizz="STAMINA", zgvdisplay="Stamina",pattern="ITEM_MOD_STAMINA"},
	{blizz="STRENGTH", zgvdisplay="Strength",pattern="ITEM_MOD_STRENGTH"},
	{blizz="ARMOR", zgvdisplay="Armor",pattern="ARMOR_TEMPLATE"}, -- base armor on gear
	{blizz="ARMOR_PENETRATION", zgvdisplay="Armor Penetration",pattern="ITEM_MOD_ARMOR_PENETRATION_RATING"},
	{blizz="ATTACK_POWER", zgvdisplay="Attack Power",pattern="ITEM_MOD_ATTACK_POWER"},
	{blizz="BLOCK", zgvdisplay="Block",pattern="ITEM_MOD_BLOCK_RATING"},
	{blizz="BLOCK_VALUE", zgvdisplay="Block Value",pattern="ITEM_MOD_BLOCK_VALUE"},
	{blizz="CRIT", zgvdisplay="Critical Strike %",pattern="ITEM_MOD_CRIT_RATING"},
	{blizz="CRIT_MELEE", zgvdisplay="Critical Strike Melee %",pattern="ITEM_MOD_CRIT_MELEE_RATING"},
	{blizz="CRIT_RANGED", zgvdisplay="Critical Strike Ranged %",pattern="ITEM_MOD_CRIT_RANGED_RATING"},
	{blizz="CRIT_SPELL", zgvdisplay="Critical Strike Spell% ",pattern="ITEM_MOD_CRIT_SPELL_RATING"},
	{blizz="DAMAGE_PER_SECOND", zgvdisplay="Damage Per Second",pattern="DPS_TEMPLATE"},
	{blizz="DEFENSE_SKILL", zgvdisplay="Defense",pattern="ITEM_MOD_DEFENSE_SKILL_RATING"},
	{blizz="DODGE", zgvdisplay="Dodge",pattern="ITEM_MOD_DODGE_RATING"},
	{blizz="EXTRA_ARMOR", zgvdisplay="Extra Armor",pattern="ITEM_MOD_EXTRA_ARMOR"},
	{blizz="EXPERTISE", zgvdisplay="Expertise",pattern="ITEM_MOD_EXPERTISE_RATING"},
	{blizz="FERAL_ATTACK_POWER", zgvdisplay="Feral Attack Power",pattern="ITEM_MOD_FERAL_ATTACK_POWER"},
	{blizz="HASTE", zgvdisplay="Haste",pattern="ITEM_MOD_HASTE_RATING"},
	--{blizz="HASTE_SPELL", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_MELEE_RATING"},
	--{blizz="HASTE_MEELE", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_SPELL_RATING"},
	--{blizz="HASTE_RANGED", zgvdisplay="Haste Spell",pattern="ITEM_MOD_HASTE_RANGED_RATING"},
	{blizz="HEALTH_REGENERATION", zgvdisplay="Health Regeneration",pattern="ITEM_MOD_HEALTH_REGEN"},
	{blizz="HEALTH", zgvdisplay="Health",pattern="ITEM_MOD_HEALTH"},
	{blizz="HIT", zgvdisplay="Hit",pattern="ITEM_MOD_HIT_RATING"},
	{blizz="HIT_MELEE", zgvdisplay="Hit Melee %",pattern="ITEM_MOD_HIT_MELEE_RATING"},
	{blizz="HIT_RANGED", zgvdisplay="Hit Ranged %",pattern="ITEM_MOD_HIT_RANGED_RATING"},
	{blizz="HIT_SPELL", zgvdisplay="Hit Spell %",pattern="ITEM_MOD_HIT_SPELL_RATING"},
	{blizz="MANA", zgvdisplay="Mana",pattern="ITEM_MOD_MANA"},
	{blizz="MANA_REGENERATION", zgvdisplay="Mana Regeneration",pattern="ITEM_MOD_MANA_REGENERATION"},
	{blizz="PARRY", zgvdisplay="Parry",pattern="ITEM_MOD_PARRY_RATING"},
	{blizz="RANGED_ATTACK_POWER", zgvdisplay="Ranged Attack Power",pattern="ITEM_MOD_RANGED_ATTACK_POWER"},
	{blizz="SPELL_DAMAGE_DONE", zgvdisplay="Spell Bonus Damage",pattern="ITEM_MOD_SPELL_DAMAGE_DONE"},
	{blizz="SPELL_HEALING_DONE", zgvdisplay="Spell Bonus Healing",pattern="ITEM_MOD_SPELL_HEALING_DONE"},
	{blizz="SPELL_PENETRATION", zgvdisplay="Spell Penetration",pattern="ITEM_MOD_SPELL_PENETRATION"},
	{blizz="SPELL_POWER", zgvdisplay="Spell Power",pattern="ITEM_MOD_SPELL_POWER"},
	{blizz="SPELL_DAMAGE_DONE_HOLY", zgvdisplay="Spell Damage Holy"},
	{blizz="SPELL_DAMAGE_DONE_FIRE", zgvdisplay="Spell Damage Fire"},
	{blizz="SPELL_DAMAGE_DONE_NATURE", zgvdisplay="Spell Damage Nature"},
	{blizz="SPELL_DAMAGE_DONE_FROST", zgvdisplay="Spell Damage Frost"},
	{blizz="SPELL_DAMAGE_DONE_SHADOW", zgvdisplay="Spell Damage Shadow"},
	{blizz="SPELL_DAMAGE_DONE_ARCANE", zgvdisplay="Spell Damage Arcane"},

	{blizz="HOLY_RESISTANCE", zgvdisplay="Resistance Holy", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL1_CAP"])},
	{blizz="FIRE_RESISTANCE", zgvdisplay="Resistance Fire", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL2_CAP"])},
	{blizz="NATURE_RESISTANCE", zgvdisplay="Resistance Nature", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL3_CAP"])},
	{blizz="FROST_RESISTANCE", zgvdisplay="Resistance Frost", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL4_CAP"])},
	{blizz="SHADOW_RESISTANCE", zgvdisplay="Resistance Shadow", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL5_CAP"])},
	{blizz="ARCANE_RESISTANCE", zgvdisplay="Resistance Arcane", regex = ITEM_RESIST_SINGLE:gsub("%%s",_G["SPELL_SCHOOL6_CAP"])},

	{blizz="SPELL_HEAL_DAMAGE", multi={"SPELL_DAMAGE_DONE","SPELL_HEALING_DONE"}},

}

for i,v in pairs(ItemScore.Keywords) do -- convert blizzard templates to lua regex match
	local regex,regex2
	v.regexs = {}

	-- try to use defined patterns
	if v.pattern or v.regex then
		regex = v.regex or _G[v.pattern]
		regex = regex:gsub("1%$",""):gsub("2%$",""):gsub("3%$",""):gsub("4%$","")
		regex = regex:gsub("%(","%%("):gsub("%)","%%)"):gsub("%%d","([0-9]+)"):gsub("%%c","([+-]+)"):gsub("%%s","([0-9.,]+)"):gsub("%%([0-9]+)%$","%%").."$"
		regex = regex:lower()

		local short = v.pattern and _G[v.pattern.."_SHORT"]
		if short then 
			if locale=="koKR" or locale=="zhCN" or locale=="zhTW" then
				regex2 = "^"..short.." ([+-]+)([0-9.,]+)".."$"
			else
				regex2 = "^".."([+-]+)([0-9.,]+) "..short.."$"
			end
			regex2 = regex2:lower()
		end
		
		
		if regex==regex2 then regex2=nil end
		table.insert(v.regexs,regex)
		table.insert(v.regexs,regex2)
	end

	-- try to pull from localisation files
	local pattern = L[v.blizz]
	if pattern ~= v.blizz then table.insert(v.regexs,pattern:lower()) end
	for i=2,10 do
		local pattern = L[v.blizz..i]
		if pattern ~= v.blizz..i then table.insert(v.regexs,pattern:lower()) end
	end
end


ItemScore.KnownKeyWords = {}
for i,v in pairs(ItemScore.Keywords) do -- create lookup table for use in popups, since GetItemStats/Delta fails on suffix items, and we need to use our cached data instead
	ItemScore.KnownKeyWords[v.blizz] = v.zgvdisplay
end

ItemScore.ProtectedGear = {}
ItemScore.Unique_Equipped_Families = { }-- those items are unique equipped, but do not return GetItemUniqueness values
ItemScore.FixedLevelHeirloom = {}
ItemScore.HeirloomBonuses = {}
ItemScore.GemStatsByExp = {}
ItemScore.GemData = {}

ItemScore.Item_Weapon_Types = {
	[0] = "AXE",
	[1] = "TH_AXE",
	[2] = "BOW",
	[3] = "GUN",
	[4] = "MACE",
	[5] = "TH_MACE",
	[6] = "TH_POLE",
	[7] = "SWORD",
	[8] = "TH_SWORD",
	[9] = "WARGLAIVE",
	[10] = "TH_STAFF",
	[11] = "DRUID_BEAR",
	[12] = "DRUID_CAT",
	[13] = "FIST",
	[14] = "MISCWEAP",
	[15] = "DAGGER",
	[16] = "THROWN",
	[17] = "SPEAR",
	[18] = "CROSSBOW",
	[19] = "WAND",
	[20] = "FISHPOLE",
	}

ItemScore.Item_Armor_Types = {
	[0] = "JEWELERY", -- necklace, rings and trinkets, also some cosmetic armor
	[1] = "CLOTH",
	[2] = "LEATHER",
	[3] = "MAIL",
	[4] = "PLATE",
	[5] = "COSMETIC",
	[6] = "SHIELD",
	[7] = "LIBRAM",
	[8] = "IDOL",
	[9] = "TOTEM",
	[10] = "SIGIL",
	[11] = "RELIC",
	}

ItemScore.TypeToSlot = {
	INVTYPE_WEAPON = INVSLOT_MAINHAND, -- dual wield handled in GetValidSlots
	INVTYPE_WEAPONMAINHAND = INVSLOT_MAINHAND,
	INVTYPE_2HWEAPON = INVSLOT_MAINHAND, -- titan fury hanndled in GetValidSlots
	INVTYPE_WEAPONOFFHAND = INVSLOT_OFFHAND,
	INVTYPE_SHIELD = INVSLOT_OFFHAND,
	INVTYPE_THROWN = INVSLOT_RANGED,
	INVTYPE_RANGED = INVSLOT_RANGED,
	INVTYPE_RANGEDRIGHT = INVSLOT_RANGED,
	INVTYPE_HOLDABLE = INVSLOT_OFFHAND,
	INVTYPE_HEAD = INVSLOT_HEAD,
	INVTYPE_NECK = INVSLOT_NECK,
	INVTYPE_SHOULDER = INVSLOT_SHOULDER,
	INVTYPE_CLOAK = INVSLOT_BACK,
	INVTYPE_CHEST = INVSLOT_CHEST,
	INVTYPE_ROBE = INVSLOT_CHEST,
	INVTYPE_WRIST = INVSLOT_WRIST,
	INVTYPE_HAND = INVSLOT_HAND,
	INVTYPE_WAIST = INVSLOT_WAIST,
	INVTYPE_LEGS = INVSLOT_LEGS,
	INVTYPE_FEET = INVSLOT_FEET,
	INVTYPE_FINGER = INVSLOT_FINGER1, -- second slot handled in GetValidSlots
	INVTYPE_TRINKET = INVSLOT_TRINKET1, -- second slot handled in GetValidSlots
	INVTYPE_RELIC = INVSLOT_RANGED,
}

ItemScore.SkillNames = { -- gets trimmed in a moment
	DUALWIELD = {id=118,	enUS="Dual Wield",	deDE="Beidhändigkeit",	esES="Empuñadura dual",	esMX="Doble empuñadura",	frFR="Ambidextrie",	ptBR="Empunhar Duas Armas",	ruRU="Бой двумя руками",	koKR="쌍수 무기",	zhCN="双武器",	zhTW="雙武器",	enGB="Dual Wield",	ptPT="Empunhar Duas Armas",},
	SWORD = {id=43,	enUS="Swords",	deDE="Schwerter",	esES="Espadas",	esMX="Espadas",	frFR="Epées",	ptBR="Espadas",	ruRU="Мечи",	koKR="도검류",	zhCN="单手剑",	zhTW="劍",	enGB="Swords",	ptPT="Espadas",},
	WAND = {id=228,	enUS="Wands",	deDE="Zauberstäbe",	esES="Varitas",	esMX="Varitas",	frFR="Baguettes",	ptBR="Varinhas",	ruRU="Жезлы",	koKR="마법봉류",	zhCN="魔杖",	zhTW="魔杖",	enGB="Wands",	ptPT="Varinhas",},
	TH_SWORD = {id=55,	enUS="Two-Handed Swords",	deDE="Zweihandschwerter",	esES="Espadas de dos manos",	esMX="Espadas de dos manos",	frFR="Epées à deux mains",	ptBR="Espadas de Duas Mãos",	ruRU="Двуручные мечи",	koKR="양손 도검류",	zhCN="双手剑",	zhTW="雙手劍",	enGB="Two-Handed Swords",	ptPT="Espadas de Duas Mãos",},
	THROWN = {id=176,	enUS="Thrown",	deDE="Wurfwaffen",	esES="Armas arrojadizas",	esMX="Armas arrojadizas",	frFR="Armes de jet",	ptBR="Arremesso",	ruRU="Метательное оружие",	koKR="투척 무기류",	zhCN="投掷武器",	zhTW="投擲武器",	enGB="Thrown",	ptPT="Arremesso",},
	FIST = {id=473,	enUS="Fist Weapons",	deDE="Faustwaffen",	esES="Armas de puño",	esMX="Armas de puño",	frFR="Armes de pugilat",	ptBR="Armas de punho",	ruRU="Кистевое оружие",	koKR="장착 무기류",	zhCN="拳套",	zhTW="拳套",	enGB="Fist Weapons",	ptPT="Armas de punho",},
	TH_MACE = {id=160,	enUS="Two-Handed Maces",	deDE="Zweihandstreitkolben",	esES="Mazas de dos manos",	esMX="Mazas de dos manos",	frFR="Masses à deux mains",	ptBR="Maças de Duas Mãos",	ruRU="Двуручное дробящее оружие",	koKR="양손 둔기류",	zhCN="双手锤",	zhTW="雙手錘",	enGB="Two-Handed Maces",	ptPT="Maças de Duas Mãos",},
	TH_AXE = {id=172,	enUS="Two-Handed Axes",	deDE="Zweihandäxte",	esES="Hachas de dos manos",	esMX="Hachas de dos manos",	frFR="Haches à deux mains",	ptBR="Machados de Duas Mãos",	ruRU="Двуручные топоры",	koKR="양손 도끼류",	zhCN="双手斧",	zhTW="雙手斧",	enGB="Two-Handed Axes",	ptPT="Machados de Duas Mãos",},
	AXE = {id=44,	enUS="Axes",	deDE="Äxte",	esES="Hachas",	esMX="Hachas",	frFR="Haches",	ptBR="Machados",	ruRU="Топоры",	koKR="도끼류",	zhCN="单手斧",	zhTW="斧",	enGB="Axes",	ptPT="Machados",},
	GUN = {id=46,	enUS="Guns",	deDE="Schusswaffen",	esES="Armas de fuego",	esMX="Armas de fuego",	frFR="Armes à feu",	ptBR="Armas de Fogo",	ruRU="Огнестрельное оружие",	koKR="총기류",	zhCN="枪械",	zhTW="槍械",	enGB="Guns",	ptPT="Armas de Fogo",},
	TH_POLE = {id=229,	enUS="Polearms",	deDE="Stangenwaffen",	esES="Armas de asta",	esMX="Armas de asta",	frFR="Armes d'hast",	ptBR="Armas de Haste",	ruRU="Древковое оружие",	koKR="장창류",	zhCN="长柄武器",	zhTW="長柄武器",	enGB="Polearms",	ptPT="Armas de Haste",},
	BOW = {id=45,	enUS="Bows",	deDE="Bogen",	esES="Arcos",	esMX="Arcos",	frFR="Arcs",	ptBR="Arcos",	ruRU="Луки",	koKR="활류",	zhCN="弓",	zhTW="弓",	enGB="Bows",	ptPT="Arcos",},
	CROSSBOW = {id=226,	enUS="Crossbows",	deDE="Armbrüste",	esES="Ballestas",	esMX="Ballestas",	frFR="Arbalètes",	ptBR="Bestas",	ruRU="Арбалеты",	koKR="석궁류",	zhCN="弩",	zhTW="弩",	enGB="Crossbows",	ptPT="Bestas",},
	TH_STAFF = {id=136,	enUS="Staves",	deDE="Stäbe",	esES="Bastones",	esMX="Bastones",	frFR="Bâtons",	ptBR="Báculos",	ruRU="Посохи",	koKR="지팡이류",	zhCN="法杖",	zhTW="法杖",	enGB="Staves",	ptPT="Báculos",},
	MACE = {id=54,	enUS="Maces",	deDE="Streitkolben",	esES="Mazas",	esMX="Mazas",	frFR="Masse",	ptBR="Maças",	ruRU="Дробящее оружие",	koKR="둔기류",	zhCN="单手锤",	zhTW="錘",	enGB="Maces",	ptPT="Maças",},
	DAGGER = {id=173,	enUS="Daggers",	deDE="Dolche",	esES="Dagas",	esMX="Dagas",	frFR="Dagues",	ptBR="Adagas",	ruRU="Кинжалы",	koKR="단검류",	zhCN="匕首",	zhTW="匕首",	enGB="Daggers",	ptPT="Adagas",},
	PLATE = {id=293,	enUS="Plate Mail",	deDE="Plattenpanzer",	esES="Armadura de placas",	esMX="Malla de placas",	frFR="Armure en plaques",	ptBR="Armadura de Placa",	ruRU="Латы",	koKR="판금 갑옷",	zhCN="板甲",	zhTW="鎧甲",	enGB="Plate Mail",	ptPT="Armadura de Placa",},
	MAIL = {id=413,	enUS="Mail",	deDE="Schwere Rüstung",	esES="Mallas",	esMX="Malla",	frFR="Mailles",	ptBR="Malha",	ruRU="Кольчужные доспехи",	koKR="사슬",	zhCN="锁甲",	zhTW="鎖甲",	enGB="Mail",	ptPT="Malha",},
	CLOTH = {id=415,	enUS="Cloth",	deDE="Stoff",	esES="Tela",	esMX="Tela",	frFR="Tissu",	ptBR="Tecido",	ruRU="Тканевые доспехи",	koKR="천",	zhCN="布甲",	zhTW="布甲",	enGB="Cloth",	ptPT="Tecido",},
	SHIELD = {id=433,	enUS="Shield",	deDE="Schild",	esES="Escudo",	esMX="Escudo",	frFR="Bouclier",	ptBR="Escudo",	ruRU="Щит",	koKR="방패",	zhCN="盾牌",	zhTW="盾牌",	enGB="Shield",	ptPT="Escudo",},
	LEATHER = {id=414,	enUS="Leather",	deDE="Leder",	esES="Cuero",	esMX="Cuero",	frFR="Cuir",	ptBR="Couro",	ruRU="Кожаные доспехи",	koKR="가죽",	zhCN="皮甲",	zhTW="皮甲",	enGB="Leather",	ptPT="Couro",},
}
ItemScore.SkillNamesRev={}
ItemScore.SkillNamesByID={}

for i,skillset in pairs(ItemScore.SkillNames) do -- drop other languages
	local name = skillset[locale] or skillset.enUS
	ItemScore.SkillNames[i] = name
	ItemScore.SkillNamesRev[name] = i
	ItemScore.SkillNamesByID[skillset.id] = i
end

ItemScore.SpellsToCache = { -- spells that are attached to items to give them extra stats. we need to have them precached, so that items can be scored properly
	758,4070,4152,4977,5102,5707,5718,5719,6260,6261,7219,7363,7515,7516,7517,7518,7527,7540,7546,7552,7560,7569,7570,7574,7576,7578,7581,7582,7597,7598,
	7617,7619,7678,7679,7680,7681,7685,7686,7687,7688,7689,7696,7700,7701,7702,7703,7706,7707,7708,7709,7710,7711,7721,7823,7825,7826,8082,8299,8315,8324,
	8357,8360,8397,8747,9132,9133,9134,9138,9139,9140,9141,9142,9160,9233,9294,9295,9296,9298,9304,9305,9306,9307,9308,9314,9315,9316,9317,9318,9325,9326,
	9327,9328,9329,9330,9331,9332,9333,9334,9335,9336,9342,9343,9344,9345,9346,9357,9358,9359,9361,9395,9396,9397,9398,9400,9401,9402,9403,9404,9405,9406,
	9407,9408,9411,9412,9413,9414,9415,9416,9417,9778,11789,11992,12418,12560,12956,13383,13384,13385,13386,13387,13388,13389,13390,13587,13595,13597,13598,
	13599,13601,13665,13667,13669,13670,13674,13675,13676,13830,13831,13881,13959,14027,14047,14049,14052,14054,14055,14056,14089,14097,14098,14121,14127,
	14248,14249,14254,14548,14550,14552,14553,14565,14588,14590,14628,14630,14633,14635,14673,14675,14677,14710,14712,14714,14716,14793,14794,14798,14799,
	14803,14824,14825,14826,14827,14828,14829,15438,15464,15465,15466,15594,15599,15600,15687,15693,15696,15714,15715,15717,15760,15763,15768,15771,15776,
	15804,15805,15806,15807,15808,15809,15810,15811,15812,15813,15814,15815,15816,15817,15818,15821,15824,15826,15829,15874,15956,16372,16550,16611,16615,
	16620,16638,16718,16982,17178,17280,17319,17320,17328,17350,17367,17371,17482,17493,17495,17619,17623,17625,17670,17713,17746,17747,17768,17816,17818,
	17819,17829,17830,17866,17867,17868,17871,17872,17873,17875,17878,17890,17891,17896,17897,17898,17899,17900,17901,17902,17945,17947,17949,17988,17993,
	17997,18008,18009,18011,18013,18014,18015,18018,18020,18029,18030,18031,18032,18033,18034,18035,18036,18037,18038,18039,18040,18041,18042,18043,18044,
	18045,18046,18049,18050,18052,18053,18054,18055,18056,18057,18060,18061,18062,18063,18064,18065,18066,18067,18074,18076,18079,18087,18097,18098,18185,
	18196,18198,18201,18207,18212,18287,18369,18378,18379,18382,18384,18388,18676,18764,18799,18815,18816,18985,19307,19380,19409,19691,19786,20732,20847,
	20885,20886,20959,20969,21079,21142,21185,21346,21347,21348,21352,21360,21361,21362,21363,21364,21365,21366,21409,21410,21429,21431,21432,21433,21434,
	21438,21439,21440,21442,21445,21473,21475,21476,21477,21485,21509,21518,21593,21595,21596,21598,21599,21600,21601,21607,21618,21619,21620,21623,21624,
	21625,21626,21627,21628,21629,21631,21632,21633,21634,21635,21636,21640,21641,21643,21751,21958,21969,21978,21991,22188,22586,22587,22588,22589,22590,
	22618,22620,22683,22778,22801,22811,22836,22849,22852,22854,22855,22912,22988,23037,23043,23046,23049,23101,23157,23172,23181,23203,23210,23212,23213,
	23217,23236,23264,23265,23266,23300,23409,23433,23434,23435,23440,23480,23481,23482,23483,23515,23516,23562,23593,23594,23674,23686,23688,23689,23701,
	23727,23728,23729,23730,23731,23732,23929,23930,23990,24188,24191,24196,24197,24198,24243,24291,24292,24301,24350,24351,24362,24392,24426,24428,24429,
	24430,24432,24433,24434,24436,24591,24595,24666,24667,24694,24697,24748,24774,24775,24782,24852,24994,25036,25669,25717,25718,25767,25901,25906,25975,
	26142,26153,26154,26155,26158,26203,26204,26208,26228,26283,26395,26405,26460,26461,26647,26814,27037,27038,27043,27206,27225,27518,27522,27539,27561,
	27656,27743,27744,27797,27846,27847,27848,27850,27851,27853,27855,27859,28112,28141,28142,28143,28144,28145,28152,28154,28155,28264,28282,28325,28347,
	28539,28686,28687,28693,28717,28736,28767,28792,28799,28805,28840,28841,28847,28849,28851,28852,28853,28854,28855,28856,28857,28869,28870,28876,29112,
	29113,29150,29162,29369,29413,29414,29415,29416,29417,29418,29501,29624,29625,29626,29632,29633,29634,29635,29636,29637,31750,370391}

for _,spellID in ipairs(ItemScore.SpellsToCache) do
	if not C_Spell.IsSpellDataCached(spellID) then
		C_Spell.RequestLoadSpellData(spellID)
	end
end
ItemScore.SpellsToCache = nil