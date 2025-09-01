ZGV.Retrofit = {}

ZGV.Retrofit.IsClassicSoD = false
ZGV.IMAGESDIR = 'nothing'

ZGV.ClassToNumber = {
    ['WARRIOR'] = 1,
    ['PALADIN'] = 2,
    ['HUNTER'] = 3,
    ['ROGUE'] = 4,
    ['PRIEST'] = 5,
    ['DEATHKNIGHT'] = 6,
    ['SHAMAN'] = 7,
    ['MAGE'] = 8,
    ['WARLOCK'] = 9,
    ['DRUID'] = 11,
}

-- C_Item helper
ZGV.Retrofit.C_Item = {

  -- Returns true if the item exists in the player’s inventory or bags
  DoesItemExist = function(itemLocation)
    if not itemLocation then
      return false
    end
    local bag, slot = itemLocation.bag, itemLocation.slot
    if bag and slot then
      local itemLink = GetContainerItemLink(bag, slot)
      return itemLink ~= nil
    end
    return false
  end,

  -- Returns the item ID from an item location
  GetItemID = function(itemLocation)
    if not C_Item.DoesItemExist(itemLocation) then
      return nil
    end
    local itemLink = GetContainerItemLink(itemLocation.bag, itemLocation.slot)
    if itemLink then
      local itemID = tonumber(string.match(itemLink, 'item:(%d+):'))
      return itemID
    end
    return nil
  end,

  -- Returns info for an item link or ID
  -- Matches retail's GetItemInfoInstant more closely
  GetItemInfoInstant = function(item)
    if not item then
      return nil
    end
    local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice =
      GetItemInfo(item)
    if not name then
      return nil
    end
    -- itemID
    local itemID = tonumber(string.match(link, 'item:(%d+):'))
    return itemID, class, subclass, equipSlot, texture
  end,

  -- Returns a texture for an item location
  GetItemIcon = function(itemLocation)
    if not C_Item.DoesItemExist(itemLocation) then
      return nil
    end
    local texture = GetContainerItemInfo(itemLocation.bag, itemLocation.slot)
    return texture
  end,

  GetItemClassInfo = function(classID)
    return ITEM_CLASS_NAMES[classID]
  end,
  GetItemQualityColor = function(qualityID)
    return ITEM_QUALITY_COLORS[qualityID] or { r = 1, g = 1, b = 1 }
  end,
}

if not C_Item then
  C_Item = {}
end

ZGV.Retrofit.C_Container = {
  GetItemCooldown = GetItemCooldown,
}

-- C_UnitAuras helper
ZGV.Retrofit.C_UnitAuras = {

  -- Returns aura data by index (mimics retail's GetAuraDataByIndex)
  GetAuraDataByIndex = function(unit, index, filter)
    filter = filter or 'HELPFUL|HARMFUL' -- unused in Wrath

    local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster

    -- Try buff first
    name, rank, icon, count, debuffType, duration, expirationTime, unitCaster =
      UnitBuff(unit, index)
    local isDebuff = false
    if not name then
      -- Try debuff
      name, rank, icon, count, debuffType, duration, expirationTime, unitCaster =
        UnitDebuff(unit, index)
      isDebuff = true
    end

    if not name then
      return nil
    end

    return {
      name = name,
      icon = icon,
      count = count or 0,
      debuffType = debuffType,
      duration = duration or 0,
      expirationTime = expirationTime or 0,
      unitCaster = unitCaster,
      spellId = 0, -- not available pre-retail
      isDebuff = isDebuff,
    }
  end,

  -- Returns the index of a player aura by spell name (Wrath has no spellID)
  GetPlayerAuraBySpellID = function(spellName)
    local player = 'player'
    for i = 1, 40 do
      local aura = ZGV.Retrofit.C_UnitAuras.GetAuraDataByIndex(player, i)
      if aura and aura.name == spellName then
        return i, aura
      end
    end
    return nil
  end,
}

if not C_UnitAuras then
  C_UnitAuras = ZGV.Retrofit.C_UnitAuras
end

if not C_QuestLog then
  C_QuestLog = {}

  -- Check if a quest is flagged as completed
  function C_QuestLog.IsQuestFlaggedCompleted(questID)
    return C_QuestLog.IsQuestComplete(questID) or false
  end

  -- Get the quest log index by quest ID
  function C_QuestLog.GetQuestLogIndexByID(questID)
    for i = 1, GetNumQuestLogEntries() do
      local _, _, _, _, _, _, _, questId = GetQuestLogTitle(i)
      if questId == questID then
        return i
      end
    end
    return nil
  end

  -- Get quest info (title)
  function C_QuestLog.GetQuestInfo(questID)
    local index = C_QuestLog.GetQuestLogIndexByID(questID)
    if index then
      local title = GetQuestLogTitle(index)
      return title
    end
    return nil
  end

  -- Get quest objectives info
  function C_QuestLog.GetQuestObjectives(questID)
    local objectives = {}
    local index = C_QuestLog.GetQuestLogIndexByID(questID)
    if index then
      local numObjectives = GetNumQuestLeaderBoards(index)
      for i = 1, numObjectives do
        local desc, type, done = GetQuestLogLeaderBoard(i, index)
        objectives[i] = {
          text = desc,
          type = type,
          finished = done,
        }
      end
    end
    return objectives
  end

  -- Is quest in the player's log
  function C_QuestLog.IsQuestInLog(questID)
    return C_QuestLog.GetQuestLogIndexByID(questID) ~= nil
  end

  -- Get quest objective text for a specific objective
  function C_QuestLog.GetQuestObjectiveInfo(questID, objectiveIndex)
    local index = C_QuestLog.GetQuestLogIndexByID(questID)
    if index then
      local desc, type, done = GetQuestLogLeaderBoard(objectiveIndex, index)
      return desc, type, done
    end
    return nil
  end

  -- Get all quests in the quest log
  function C_QuestLog.GetAllQuestIDs()
    local questIDs = {}
    for i = 1, GetNumQuestLogEntries() do
      local _, _, _, _, _, _, _, questId = GetQuestLogTitle(i)
      if questId then
        table.insert(questIDs, questId)
      end
    end
    return questIDs
  end

  -- Check if quest is complete (ready to turn in) by looking at quest log
  function C_QuestLog.IsQuestComplete(questID)
    local index = C_QuestLog.GetQuestLogIndexByID(questID)
    if index then
      -- GetQuestLogTitle returns: title, level, suggestedGroup, isHeader,
      -- isCollapsed, isComplete, frequency, questID
      local _, _, _, _, _, isComplete = GetQuestLogTitle(index)
      if isComplete == 1 then
        return true
      end
    end
    return false
  end
end

local ItemScore = {}

--I Hate this but no way around it
ItemScore.SkillNames = { -- gets trimmed in a moment
  DUALWIELD = {
    id = 118,
    enUS = 'Dual Wield',
    deDE = 'Beidhändigkeit',
    esES = 'Empuñadura dual',
    esMX = 'Doble empuñadura',
    frFR = 'Ambidextrie',
    ptBR = 'Empunhar Duas Armas',
    ruRU = 'Бой двумя руками',
    koKR = '쌍수 무기',
    zhCN = '双武器',
    zhTW = '雙武器',
    enGB = 'Dual Wield',
    ptPT = 'Empunhar Duas Armas',
  },
  SWORD = {
    id = 43,
    enUS = 'Swords',
    deDE = 'Schwerter',
    esES = 'Espadas',
    esMX = 'Espadas',
    frFR = 'Epées',
    ptBR = 'Espadas',
    ruRU = 'Мечи',
    koKR = '도검류',
    zhCN = '单手剑',
    zhTW = '劍',
    enGB = 'Swords',
    ptPT = 'Espadas',
  },
  WAND = {
    id = 228,
    enUS = 'Wands',
    deDE = 'Zauberstäbe',
    esES = 'Varitas',
    esMX = 'Varitas',
    frFR = 'Baguettes',
    ptBR = 'Varinhas',
    ruRU = 'Жезлы',
    koKR = '마법봉류',
    zhCN = '魔杖',
    zhTW = '魔杖',
    enGB = 'Wands',
    ptPT = 'Varinhas',
  },
  TH_SWORD = {
    id = 55,
    enUS = 'Two-Handed Swords',
    deDE = 'Zweihandschwerter',
    esES = 'Espadas de dos manos',
    esMX = 'Espadas de dos manos',
    frFR = 'Epées à deux mains',
    ptBR = 'Espadas de Duas Mãos',
    ruRU = 'Двуручные мечи',
    koKR = '양손 도검류',
    zhCN = '双手剑',
    zhTW = '雙手劍',
    enGB = 'Two-Handed Swords',
    ptPT = 'Espadas de Duas Mãos',
  },
  THROWN = {
    id = 176,
    enUS = 'Thrown',
    deDE = 'Wurfwaffen',
    esES = 'Armas arrojadizas',
    esMX = 'Armas arrojadizas',
    frFR = 'Armes de jet',
    ptBR = 'Arremesso',
    ruRU = 'Метательное оружие',
    koKR = '투척 무기류',
    zhCN = '投掷武器',
    zhTW = '投擲武器',
    enGB = 'Thrown',
    ptPT = 'Arremesso',
  },
  FIST = {
    id = 473,
    enUS = 'Fist Weapons',
    deDE = 'Faustwaffen',
    esES = 'Armas de puño',
    esMX = 'Armas de puño',
    frFR = 'Armes de pugilat',
    ptBR = 'Armas de punho',
    ruRU = 'Кистевое оружие',
    koKR = '장착 무기류',
    zhCN = '拳套',
    zhTW = '拳套',
    enGB = 'Fist Weapons',
    ptPT = 'Armas de punho',
  },
  TH_MACE = {
    id = 160,
    enUS = 'Two-Handed Maces',
    deDE = 'Zweihandstreitkolben',
    esES = 'Mazas de dos manos',
    esMX = 'Mazas de dos manos',
    frFR = 'Masses à deux mains',
    ptBR = 'Maças de Duas Mãos',
    ruRU = 'Двуручное дробящее оружие',
    koKR = '양손 둔기류',
    zhCN = '双手锤',
    zhTW = '雙手錘',
    enGB = 'Two-Handed Maces',
    ptPT = 'Maças de Duas Mãos',
  },
  TH_AXE = {
    id = 172,
    enUS = 'Two-Handed Axes',
    deDE = 'Zweihandäxte',
    esES = 'Hachas de dos manos',
    esMX = 'Hachas de dos manos',
    frFR = 'Haches à deux mains',
    ptBR = 'Machados de Duas Mãos',
    ruRU = 'Двуручные топоры',
    koKR = '양손 도끼류',
    zhCN = '双手斧',
    zhTW = '雙手斧',
    enGB = 'Two-Handed Axes',
    ptPT = 'Machados de Duas Mãos',
  },
  AXE = {
    id = 44,
    enUS = 'Axes',
    deDE = 'Äxte',
    esES = 'Hachas',
    esMX = 'Hachas',
    frFR = 'Haches',
    ptBR = 'Machados',
    ruRU = 'Топоры',
    koKR = '도끼류',
    zhCN = '单手斧',
    zhTW = '斧',
    enGB = 'Axes',
    ptPT = 'Machados',
  },
  GUN = {
    id = 46,
    enUS = 'Guns',
    deDE = 'Schusswaffen',
    esES = 'Armas de fuego',
    esMX = 'Armas de fuego',
    frFR = 'Armes à feu',
    ptBR = 'Armas de Fogo',
    ruRU = 'Огнестрельное оружие',
    koKR = '총기류',
    zhCN = '枪械',
    zhTW = '槍械',
    enGB = 'Guns',
    ptPT = 'Armas de Fogo',
  },
  TH_POLE = {
    id = 229,
    enUS = 'Polearms',
    deDE = 'Stangenwaffen',
    esES = 'Armas de asta',
    esMX = 'Armas de asta',
    frFR = "Armes d'hast",
    ptBR = 'Armas de Haste',
    ruRU = 'Древковое оружие',
    koKR = '장창류',
    zhCN = '长柄武器',
    zhTW = '長柄武器',
    enGB = 'Polearms',
    ptPT = 'Armas de Haste',
  },
  BOW = {
    id = 45,
    enUS = 'Bows',
    deDE = 'Bogen',
    esES = 'Arcos',
    esMX = 'Arcos',
    frFR = 'Arcs',
    ptBR = 'Arcos',
    ruRU = 'Луки',
    koKR = '활류',
    zhCN = '弓',
    zhTW = '弓',
    enGB = 'Bows',
    ptPT = 'Arcos',
  },
  CROSSBOW = {
    id = 226,
    enUS = 'Crossbows',
    deDE = 'Armbrüste',
    esES = 'Ballestas',
    esMX = 'Ballestas',
    frFR = 'Arbalètes',
    ptBR = 'Bestas',
    ruRU = 'Арбалеты',
    koKR = '석궁류',
    zhCN = '弩',
    zhTW = '弩',
    enGB = 'Crossbows',
    ptPT = 'Bestas',
  },
  TH_STAFF = {
    id = 136,
    enUS = 'Staves',
    deDE = 'Stäbe',
    esES = 'Bastones',
    esMX = 'Bastones',
    frFR = 'Bâtons',
    ptBR = 'Báculos',
    ruRU = 'Посохи',
    koKR = '지팡이류',
    zhCN = '法杖',
    zhTW = '法杖',
    enGB = 'Staves',
    ptPT = 'Báculos',
  },
  MACE = {
    id = 54,
    enUS = 'Maces',
    deDE = 'Streitkolben',
    esES = 'Mazas',
    esMX = 'Mazas',
    frFR = 'Masse',
    ptBR = 'Maças',
    ruRU = 'Дробящее оружие',
    koKR = '둔기류',
    zhCN = '单手锤',
    zhTW = '錘',
    enGB = 'Maces',
    ptPT = 'Maças',
  },
  DAGGER = {
    id = 173,
    enUS = 'Daggers',
    deDE = 'Dolche',
    esES = 'Dagas',
    esMX = 'Dagas',
    frFR = 'Dagues',
    ptBR = 'Adagas',
    ruRU = 'Кинжалы',
    koKR = '단검류',
    zhCN = '匕首',
    zhTW = '匕首',
    enGB = 'Daggers',
    ptPT = 'Adagas',
  },
  PLATE = {
    id = 293,
    enUS = 'Plate Mail',
    deDE = 'Plattenpanzer',
    esES = 'Armadura de placas',
    esMX = 'Malla de placas',
    frFR = 'Armure en plaques',
    ptBR = 'Armadura de Placa',
    ruRU = 'Латы',
    koKR = '판금 갑옷',
    zhCN = '板甲',
    zhTW = '鎧甲',
    enGB = 'Plate Mail',
    ptPT = 'Armadura de Placa',
  },
  MAIL = {
    id = 413,
    enUS = 'Mail',
    deDE = 'Schwere Rüstung',
    esES = 'Mallas',
    esMX = 'Malla',
    frFR = 'Mailles',
    ptBR = 'Malha',
    ruRU = 'Кольчужные доспехи',
    koKR = '사슬',
    zhCN = '锁甲',
    zhTW = '鎖甲',
    enGB = 'Mail',
    ptPT = 'Malha',
  },
  CLOTH = {
    id = 415,
    enUS = 'Cloth',
    deDE = 'Stoff',
    esES = 'Tela',
    esMX = 'Tela',
    frFR = 'Tissu',
    ptBR = 'Tecido',
    ruRU = 'Тканевые доспехи',
    koKR = '천',
    zhCN = '布甲',
    zhTW = '布甲',
    enGB = 'Cloth',
    ptPT = 'Tecido',
  },
  SHIELD = {
    id = 433,
    enUS = 'Shield',
    deDE = 'Schild',
    esES = 'Escudo',
    esMX = 'Escudo',
    frFR = 'Bouclier',
    ptBR = 'Escudo',
    ruRU = 'Щит',
    koKR = '방패',
    zhCN = '盾牌',
    zhTW = '盾牌',
    enGB = 'Shield',
    ptPT = 'Escudo',
  },
  LEATHER = {
    id = 414,
    enUS = 'Leather',
    deDE = 'Leder',
    esES = 'Cuero',
    esMX = 'Cuero',
    frFR = 'Cuir',
    ptBR = 'Couro',
    ruRU = 'Кожаные доспехи',
    koKR = '가죽',
    zhCN = '皮甲',
    zhTW = '皮甲',
    enGB = 'Leather',
    ptPT = 'Couro',
  },
}

ItemScore.SkillNamesRev = {}
ItemScore.SkillNamesByID = {}

for i, skillset in pairs(ItemScore.SkillNames) do -- drop other languages
  local name = skillset[locale] or skillset.enUS
  ItemScore.SkillNames[i] = name
  ItemScore.SkillNamesRev[name] = i
  ItemScore.SkillNamesByID[skillset.id] = i
end

ZGV.ItemScore = ItemScore

function ShowCopyPopup(text)
  -- Main frame
  local f = CreateFrame('Frame', nil, UIParent)
  f:SetSize(340, 200)
  f:SetPoint('CENTER')
  f:SetBackdrop({
    bgFile = 'Interface/DialogFrame/UI-DialogBox-Background',
    edgeFile = 'Interface/DialogFrame/UI-DialogBox-Border',
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 8, right = 8, top = 8, bottom = 8 },
  })
  f:SetBackdropColor(0, 0, 0, 1)
  f:EnableMouse(true)
  f:SetMovable(true)
  f:RegisterForDrag('LeftButton')
  f:SetScript('OnDragStart', f.StartMoving)
  f:SetScript('OnDragStop', f.StopMovingOrSizing)

  -- Close button
  local close = CreateFrame('Button', nil, f, 'UIPanelCloseButton')
  close:SetPoint('TOPRIGHT', -4, -4)

  -- ScrollFrame
  local scroll = CreateFrame('ScrollFrame', nil, f)
  scroll:SetPoint('TOPLEFT', 16, -32)
  scroll:SetPoint('BOTTOMRIGHT', -26, 16)

  -- Scrollbar
  local scrollbar = CreateFrame('Slider', nil, scroll, 'UIPanelScrollBarTemplate')
  scrollbar:SetPoint('TOPLEFT', f, 'TOPRIGHT', -28, -52)
  scrollbar:SetPoint('BOTTOMLEFT', f, 'BOTTOMRIGHT', -28, 16)
  scrollbar:SetMinMaxValues(0, 1)
  scrollbar:SetValueStep(1)
  scrollbar:SetWidth(16)
  scrollbar:Hide() -- will show if needed

  -- EditBox inside scroll
  local editbox = CreateFrame('EditBox', nil, scroll)
  editbox:SetMultiLine(true)
  editbox:SetFontObject(ChatFontNormal)
  editbox:SetAutoFocus(false)
  editbox:SetWidth(280)
  editbox:SetScript('OnEscapePressed', function(self)
    self:ClearFocus()
  end)
  editbox:SetScript('OnEditFocusGained', function(self)
    self:HighlightText()
  end)

  scroll:SetScrollChild(editbox)

  -- Scroll handling
  scrollbar:SetScript('OnValueChanged', function(self, value)
    scroll:SetVerticalScroll(value)
  end)

  scroll:SetScript('OnScrollRangeChanged', function(self, xrange, yrange)
    if yrange > 0 then
      scrollbar:SetMinMaxValues(0, yrange)
      scrollbar:Show()
    else
      scrollbar:Hide()
    end
  end)

  -- Fill text
  editbox:SetText(text or '')
  editbox:HighlightText()
  editbox:SetFocus()

  -- Cleanup
  local function cleanup()
    editbox:ClearFocus()
    f:Hide()
    f:SetParent(nil)
  end
  close:SetScript('OnClick', cleanup)
  f:SetScript('OnHide', cleanup)

  f:Show()
end
