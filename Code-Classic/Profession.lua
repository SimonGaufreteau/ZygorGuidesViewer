if debug then
	ZygorGuidesViewer={startups={}}
	ZygorGuidesViewer_L=function() end
	GetLocale=function() return "enUS" end
	tinsert=table.insert
	ERR_LEARN_RECIPE_S = "Learn %s"
	hooksecurefunc=function() end
end

local ZGV = ZygorGuidesViewer
if not ZGV then return end


ZGV.Professions = {}
local ZGVP = ZGV.Professions

local Gratuity = LibStub("LibGratuity-3.0")

ZGVP.skillSpells = {}

ZGVP.tradeskills = {
	[129] = {name="First Aid",crafting=true, skill=129, icon=135966},
	[171] = {name="Alchemy",crafting=true, skill=171, icon=136240},
	[164] = {name="Blacksmithing",crafting=true, skill=164, icon=136241},
	[333] = {name="Enchanting",crafting=true, skill=333, icon=136244},
	[202] = {name="Engineering",crafting=true, skill=202, icon=136243},
	[165] = {name="Leatherworking",crafting=true, skill=165, icon=133611},
	[197] = {name="Tailoring",crafting=true, skill=197, icon=136249},
	[182] = {name="Herbalism", skill=182, icon=136065},
	[186] = {name="Mining",crafting=true, skill=186, icon=136248},
	[393] = {name="Skinning", skill=393, icon=134366},
	[185] = {name="Cooking",crafting=true, skill=185, icon=133971},
	[356] = {name="Fishing", skill=356, icon=136245},
	[762] = {name="Riding", skill=762, icon=136103},
	[633] = {name="Lockpicking", skill=633, icon=136058},
}


ZGVP.skillLocale = {
	[129]={deDE="Erste Hilfe",	esES="Primeros auxilios",frFR="Secourisme",	ptBR="Primeiros Socorros",ruRU="Первая помощь",	koKR="응급치료",	zhCN="急救",	zhTW="急救",	esMX="Primeros auxilios"},
	[164]={deDE="Schmiedekunst",	esES="Herrería",	frFR="Forge",		ptBR="Ferraria",	ruRU="Кузнечное дело",	koKR="대장기술",	zhCN="锻造",	zhTW="锻造",	esMX="Herrería"},
	[165]={deDE="Lederverarbeitung",esES="Peletería",	frFR="Travail du cuir",	ptBR="Couraria",	ruRU="Кожевничество",	koKR="가죽 세공",	zhCN="制皮",	zhTW="制皮",	esMX="Peletería"},
	[171]={deDE="Alchemie",		esES="Alquimia",	frFR="Alchimie",	ptBR="Alquimia",	ruRU="Алхимия",		koKR="연금술",	zhCN="炼金术",	zhTW="炼金术",	esMX="Alquimia"},
	[182]={deDE="Kräuterkunde",	esES="Herboristería",	frFR="Herboristerie",	ptBR="Herborismo",	ruRU="Травничество",	koKR="약초 채집",	zhCN="草药学",	zhTW="草药学",	esMX="Herboristería"},
	[185]={deDE="Kochkunst",	esES="Cocina",		frFR="Cuisine",		ptBR="Culinária",	ruRU="Кулинария",	koKR="요리",	zhCN="烹饪",	zhTW="烹饪",	esMX="Cocina"},
	[186]={deDE="Bergbau",		esES="Minería",		frFR="Minage",		ptBR="Mineração",	ruRU="Горное дело",	koKR="채광",	zhCN="采矿",	zhTW="采矿",	esMX="Minería"},
	[197]={deDE="Schneiderei",	esES="Sastrería",	frFR="Couture",		ptBR="Alfaiataria",	ruRU="Портняжное дело",	koKR="재봉술",	zhCN="裁缝",	zhTW="裁缝",	esMX="裁缝"},
	[202]={deDE="Ingenieurskunst",	esES="Ingeniería",	frFR="Ingénierie",	ptBR="Engenharia",	ruRU="Инженерное дело",	koKR="기계공학",	zhCN="工程学",	zhTW="工程学",	esMX="Ingeniería"},
	[333]={deDE="Verzauberkunst",	esES="Encantamiento",	frFR="Enchantement",	ptBR="Encantamento",	ruRU="Наложение чар",	koKR="마법부여",	zhCN="附魔",	zhTW="附魔",	esMX="Encantamiento"},
	[356]={deDE="Angeln",		esES="Pesca",		frFR="Pêche",		ptBR="Pesca",		ruRU="Рыбная ловля",	koKR="낚시",	zhCN="钓鱼",	zhTW="钓鱼",	esMX="Pesca"},
	[393]={deDE="Kürschnerei",	esES="Desuello",	frFR="Dépeçage",	ptBR="Esfolamento",	ruRU="Снятие шкур",	koKR="무두질",	zhCN="剥皮",	zhTW="剥皮",	esMX="Desuello"},
	[762]={deDE="Reiten",		esES="Equitación",	frFR="Monte",		ptBR="Montaria",	ruRU="Верховая езда",	koKR="타기",	zhCN="骑术",	zhTW="骑术",	esMX="Equitación"},
	[633]={deDE="Schlossknacken",	esES="Ganzúa",		frFR="Crochetage",	ptBR="Arrombamento",	ruRU="Вскрытие замков",	koKR="자물쇠 따기",zhCN="开锁",	zhTW="开锁",	esES="Ganzúa"},
} -- GETS TRIMMED.

ZGV.Professions.LocaleSkills={}
ZGV.Professions.LocaleSkillsR={}
for id,data in pairs(ZGVP.skillLocale) do 
	ZGVP.skillLocale[id]=data[GetLocale()] or (ZGVP.tradeskills[id] and ZGVP.tradeskills[id].name)
	ZGV.Professions.LocaleSkillsR[ZGVP.skillLocale[id]] = id
end

setmetatable(ZGV.Professions.LocaleSkills,{__index=function(t,skill) return ZGV.Professions.skillLocale[ZGVP.tradeskillsIdByName[skill] or 0] or skill end})


-- Map ids by english names
ZGVP.tradeskillsIdByName = {}
for id,data in pairs(ZGVP.tradeskills) do 
	ZGVP.tradeskillsIdByName[data.name] = id 
end

function ZGV:CacheSkills()
	local current_time = debugprofilestop()
	if (current_time - (ZGV.last_cached_skills or 0)) < 1000 then return end
	ZGV.last_cached_skills = current_time	

	for i=1, GetNumSkillLines() do
		local skillName, _, _, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType = GetSkillLineInfo(i);
		local skillTag = ZGV.Professions.LocaleSkillsR[skillName]
		local skillEngName = (ZGVP.tradeskills[skillTag] and ZGVP.tradeskills[skillTag].name)
		if skillTag then
			local pro = ZGVP.SkillsKnown[skillEngName]
			if not pro then
				pro={}
				ZGVP.SkillsKnown[skillEngName]=pro
			end
			pro.level=skillRank
			pro.max=skillMaxRank
			pro.active=true
			pro.skillID=skillTag
			pro.name=skillEngName
		end
	end

	self:CacheRecipes(profs)  -- or try to, anyway. --Do Cooking masteries too
end

function ZGV:CacheRecipes()
	if ZGVP.CS_Timer then ZGV:CancelTimer(ZGVP.CS_Timer) end
	ZGVP.CS_Timer = ZGV:ScheduleTimer(function() 
		ZGV:CacheRecipes_Queued()
	end, 2)
end

function ZGV:CacheRecipes_Queued()
	local skill = GetTradeSkillLine()
	if skill=="UNKNOWN" then return end

	local profID = ZGV.Professions.LocaleSkillsR[skill]

	if not profID then return end

	-- scan!
	local recipes = self.db.char.RecipesKnown --used in Goal.lua and Options.lua

	-- make sure it's the new format
	if not self.db.char.RecipeWipe01142013 or (recipes and type(recipes[next(recipes)])~="table") then wipe(recipes) self.db.char.RecipeWipe01142013 = true end
	if not recipes[profID] then recipes[profID] = {} end
	recipes = recipes[profID]

	wipe(recipes)

	local scanned=0
	for i = 1,500 do
		local tradeName,tradeType,numAvailable,_,_,_,_,_,rank,maxrank = GetTradeSkillInfo(i)

		if tradeName and tradeType~="header" and tradeType~="subheader" then
			-- regular recipe
			Gratuity:SetTradeSkillItem(i);
			local _,link = Gratuity.vars.tooltip:GetItem() -- ugly, but grat gives no direct access to GetItem
			if link then
				local recipe = {}

				recipe.productlink = link
				recipe.producttype,recipe.productid = link:match("|H(%w+):(%d+)")

				local spell = ZygorGuidesViewer.Professions.ItemToSpell[tonumber(link:match("|H%w+:(%d+)"))]
				if spell then 
					recipes[spell]=recipe
					recipe.spell = spell
					recipe.learned = true
					recipe.difficulty = tradeType
					recipe.numSkillUps = 1
					recipe.numAvailable = numAvailable
					--recipe.link = GetTradeSkillRecipeLink(i)
					recipe.productid = tonumber(recipe.productid)
					recipe.nummade = {GetTradeSkillNumMade(i)}
					recipe.reagents={}
					local numreagents = GetTradeSkillNumReagents(i)
					for r=1,numreagents do
						local reagent = {}
						reagent.name,reagent.texture,reagent.num,reagent.have = GetTradeSkillReagentInfo(i,r)

						if not reagent.id then ZGV:Debug("Missing reagent in recipe %d: %d %s", i,recipe.spell,recipe.link) end

						reagent.link = GetTradeSkillReagentItemLink(i,r)
						if reagent.link then reagent.id = tonumber(reagent.link:match("|H%w+:(%d+)")) end
						tinsert(recipe.reagents,reagent)
						if not reagent.id then ZGV:Debug("Missing reagent %d in recipe %d: %d %s", r, i, recipe.spell,recipe.link) end
					end
				else
					ZGV:Debug("&professions Missing spell for product %s",recipe.productid)
				end

				scanned=scanned+1
				--]]
			end
		
		elseif tradeName and tradeType=="subheader" then --Cooking Masteries
			for UsName,id in pairs(CookingSkills) do
				local name = GetSpellInfo(id) --local name

				if tradeName == name then
					self.db.char.cookingMasteries[id] = rank

					local pro = self.skills[name]
					if not pro then
						pro={} self.skills[name]=pro
					end
					pro.level = rank pro.max = maxrank pro.active = true
					pro.name = name --localized.. Does it matter?
					pro.spell = id pro.skillID = id --this Id is not actually what we need. But we can use it to match properly.

					self:Debug(tradeName.." has level "..rank)
					break
				end
			end
		end
	end
	self:Debug(scanned.." "..skill.." recipes found")

	local Goldguide = ZGV.Goldguide
	if Goldguide and Goldguide.MainFrame and Goldguide.MainFrame:IsVisible() then 
		Goldguide:InitialiseCraftingChores()
		for _,chore in pairs(Goldguide.Chores.Crafting) do chore:CalculateDetails(true)  chore.needsRefresh=true end
	end
end

function ZGVP:GetSkill(name)
	if not name then return ZGV.db.char.SkillsKnown[""] end

	-- handle aliases : legion_alchemy => Legion Alchemy
	name = name:gsub("_"," "):gsub("(%a)([%w]*)", function(first,rest) return first:upper()..rest:lower() end)


	if ZGV.db.profile.fakeskills[name] then
		return ZGV.db.profile.fakeskills[name] -- faked value
	elseif ZGV.db.char.SkillsKnown[name] then
		return ZGV.db.char.SkillsKnown[name]
	else
		return ZGV.db.char.SkillsKnown[""] -- proper value or empty placeholer
	end
end

function ZGVP:GetSkillDataByName(name)
	for id,data in pairs(ZGVP.tradeskills) do 
		if data.name==name then return data end
	end
end



function ZGV:Profession_NEW_RECIPE_LEARNED(event,spell)
	ZGV.db.char.RecipesKnownNew[spell] = true
	--[[
	for skill,skilltable in pairs(ZGV.db.char.RecipesKnown) do
		if skilltable[spell] then
			skilltable[spell].learned=true
		end
	end
	--]]
end

local ERR_LEARN_RECIPE_S_fmt = ERR_LEARN_RECIPE_S:gsub("%.","%%."):gsub("%%s","(.+)")
--local TRADESKILL_LOG_FIRSTPERSON_fmt = TRADESKILL_LOG_FIRSTPERSON:gsub("%%s","(.-)")

function ZGV:Profession_CHAT_MSG_SYSTEM(event,text)
	local _,_,item = text:find(ERR_LEARN_RECIPE_S_fmt)
	if item then
		self.recentlyLearnedRecipes[item]=true
	end
end





function ZGV:PerformTradeSkillGoal(goal)
	if not goal then return end
	if not goal.spellid then 
		goal.spellid = ZygorGuidesViewer.Professions.ItemToSpell[goal.targetid]
	end
	if not goal.spellid then return end

	if goal.skillnum then
		-- skillup-based
		self:PerformTradeSkill(goal.spellid,goal.skillnum)
	elseif goal.targetid then
		self:PerformTradeSkill(goal.spellid,goal.count-C_Item.GetItemCount(goal.targetid))
	end
end

function ZGV:PerformTradeSkill(id,count)
	if not count then count=1 end
	if count<=0 then return end

	local skillNum = self:FindTradeSkillNum(id)

	if skillNum then
		DoTradeSkill(skillNum,count)
	end
end

function ZGV:FindTradeSkillNum(id)
	if not id then return end
	for i = 1,500 do
		local tradeName,tradeType = GetTradeSkillInfo(i)

		if tradeName and tradeType~="header" then
			Gratuity:SetTradeSkillItem(i);
			local _,link = Gratuity.vars.tooltip:GetItem() -- ugly, but grat gives no direct access to GetItem
			if link then
				local spell = ZygorGuidesViewer.Professions.ItemToSpell[tonumber(link:match("|H%w+:(%d+)"))]
				if spell==id then
					return i
				end
			end
		end
	end
end


function ZGVP:GetRecipe(spellid)
	local RK = ZGV.db.char.RecipesKnown
	if not RK or not next(RK) then return false,"no data" end
	for skillid,recipes in pairs(RK) do
		if recipes[spellid] then return recipes[spellid] end
	end
	return false,"not found"
end

function ZGVP:KnowsRecipe(spellid)
	local ret,error = ZGVP:GetRecipe(spellid)
	if ret then
		return ret.learned,true
	else
		return ZGV.db.char.RecipesKnownNew[spellid],false
	end
end

local pattern = "Skill (%d+) increased from (%d+) to (%d+)"
local function UpdateSkillConsole(_,_,msg)
	local id,from,to = msg:match(pattern)

	if id and to then
		id=tonumber(id)
		to=tonumber(to)

		for name,skill in pairs(ZGV.db.char.SkillsKnown) do
			if skill.skillID==id then
				if to>0 then
					skill.level = to
					return
				else
					ZGV.db.char.SkillsKnown[name]=nil
					ZGV.db.char.RecipesKnown[skill.skillID]=nil
				end
			end
		end

		if to>0 then
			for sid,linedata in pairs(ZGVP.tradeskills) do
				if sid==id then
					ZGVP.SkillsKnown[linedata.name] = ZGVP.SkillsKnown[linedata.name] or {}
					local pro =  ZGVP.SkillsKnown[linedata.name]
					local subname = linedata.name
					pro.level = to
					pro.max = 300
					pro.active = true
					pro.skillID = linedata.skill
					pro.name = subname
					pro.parentname = linedata.name
					pro.parentskillID = sid
				end
			end
		else
			for name,linedata in pairs(ZGVP.SkillsKnown) do
				if linedata.parentskillID==id or linedata.skillID==id then
					ZGVP.SkillsKnown[name] = nil
				end
			end
		end
	end
end

function ZGVP:HasProfessionSlot()
	local p1, p2, arch, fish, cook, first = GetProfessions()
	return not (p1 and p2)
end

function ZGVP:HasProfessionUnscanned(name)
	local skill = ZGV.db.char.SkillsKnown[name]

	if not skill then return false end

	if not ZGV.db.char.RecipesKnown[skill.skillID] then return true end

	return false
end

function ZGVP:GoalRecipe(skill,spellid,loud)
    if not (TradeSkillFrame and TradeSkillFrame:IsVisible()) then return nil,"closed" end
    if not skill or not spellid then return nil,"no_data" end
    local skilldata = ZGV.Professions:GetSkill(skill)
    if not skilldata then return nil,"no_prof" end
    local skillid = skilldata.parentskillID or skilldata.skillID
    if not ZGV.db.char.RecipesKnown[skillid] then return nil,"no_prof" end
    local recipe = ZGV.db.char.RecipesKnown[skillid][spellid]
    if not recipe then return nil,"unknown" end
    if not recipe.learned then return nil,"unknown" end
    if not recipe.difficulty or not recipe.numAvailable then return nil,"unknown" end
    return recipe
end

local function UpdateSpellInfo(_,_,arg3)
	do return end
	for level,skills in pairs(ZGVP.SkillTraining) do
		if skills[arg3] then
			local name, _, icon = GetSpellInfo(skill)
			skills[arg3].name = skills[arg3].name or name
			skills[arg3].rank = skills[arg3].rank or GetSpellSubtext(arg3)
			skills[arg3].icon = skills[arg3].icon or icon
		end
	end
end

tinsert(ZGV.startups,{"Professions setup",function(self)
	ZGV.db.char.SkillsKnown = ZGV.db.char.SkillsKnown or {}
	ZGV.db.char.RecipesKnownNew = ZGV.db.char.RecipesKnownNew or {}

	ZGV.db.char.SkillsKnown[""] = {active=false,level=0,max=0,placeholder=true}
	ZGVP.SkillsKnown = ZGV.db.char.SkillsKnown

	self:AddEventHandler("PLAYER_ENTERING_WORLD","CacheSkills") 
	self:AddEventHandler("SKILL_LINES_CHANGED","CacheSkills")
	--self:AddEventHandler("CHAT_MSG_SKILL","CacheSkills")
	self:AddEventHandler("CONSOLE_MESSAGE",UpdateSkillConsole) -- replaces CHAT_MSG_SKILL for our needs
	self:AddEventHandler("TRADE_SKILL_SHOW","CacheSkills")
	self:AddEventHandler("TRADE_SKILL_DATA_SOURCE_CHANGED","CacheSkills")

	self:AddEventHandler("TRADE_SKILL_UPDATE","CacheSkills")

	self:AddEventHandler("CHAT_MSG_SYSTEM","Profession_CHAT_MSG_SYSTEM")
	self:AddEventHandler("NEW_RECIPE_LEARNED","Profession_NEW_RECIPE_LEARNED")

	self:AddEventHandler("TRADE_SKILL_LIST_UPDATE","CacheRecipes")

	self:AddEventHandler("SPELL_TEXT_UPDATE",UpdateSpellInfo) -- replaces CHAT_MSG_SKILL for our needs
	self:AddEventHandler("SPELL_DATA_LOAD_RESULT",UpdateSpellInfo) -- replaces CHAT_MSG_SKILL for our needs

	--self:AddEventHandler("CHAT_MSG_COMBAT_FACTION_CHANGE","CHAT_MSG_COMBAT_FACTION_CHANGE_Faction")

	LoadAddOn("Blizzard_TradeSkillUI")

	ZGV:CacheSkills()

	hooksecurefunc("SkillFrame_UpdateSkills",function() ZGV:CacheSkills() end)
end})