local name, ZGV = ...

ZGV.Retrofit = {}

ZGV.Retrofit.C_Spell = {}
-- missing on cata
ZGV.Retrofit.C_Spell.GetSpellInfo = C_Spell and C_Spell.GetSpellInfo
	or function(spellID)
		local name, rank, iconID, castTime, minRange, maxRange, spellID, originalIconID = GetSpellInfo(spellID)
		return {
			name = name,
			nil, -- ranks are always nil
			iconID = iconID,
			castTime = castTime,
			minRange = minRange,
			maxRange = maxRange,
			spellID = spellID,
			originalIconID = originalIconID,
		}
	end

-- missing on classic, cata
ZGV.Retrofit.C_Spell.GetSpellCooldown = C_Spell and C_Spell.GetSpellCooldown
	or function(spellID)
		local startTime, duration, isEnabled, modRate = GetSpellCooldown(spellID)
		return {
			startTime = startTime,
			duration = duration,
			isEnabled = isEnabled,
			modRate = modRate,
		}
	end

--TODO : Check if this works
if not C_Spell then
	C_Spell = {}
end
for k, v in pairs(ZGV.Retrofit.C_Spell) do
	C_Spell[k] = v
end

--[[ 
3.3.5 Compatibility layer for C_QuestLog 
Maps modern C_QuestLog functions to old API equivalents
--]]
if not C_QuestLog then
	C_QuestLog = {}

	-- Check if a quest is flagged as completed
	function C_QuestLog.IsQuestFlaggedCompleted(questID)
		return IsQuestComplete(questID) or false
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
end

if not GetCurrentRegion then
	function GetCurrentRegion()
		return 3 -- default to EU
	end
end

-- Patch for AceComm
if not Enum then
	Enum = {
		-- https://wowpedia.fandom.com/wiki/Enum.UIMapType
		UIMapType = {
			Cosmic = 0,
			World = 1,
			Continent = 2,
			Zone = 3,
			Dungeon = 4,
			Micro = 5,
			Orphan = 6,
		},
		ItemClass = {
			Consumable = 0,
			Container = 1,
			Weapon = 2,
			Gem = 3,
			Armor = 4,
			Reagent = 5,
			Projectile = 6,
			Tradegoods = 7,
			Recipe = 9,
			Quiver = 11,
			Questitem = 12,
			Key = 13,
			Miscellaneous = 15,
			Glyph = 16, -- Wrath still had glyphs
		},
		ItemQuality = {
			Poor = 0, -- gray
			Common = 1, -- white
			Uncommon = 2, -- green
			Rare = 3, -- blue
			Epic = 4, -- purple
			Legendary = 5, -- orange
			Artifact = 6, -- gold/teal
			Heirloom = 7, -- yellow
		},
	}
end

local ITEM_QUALITY_COLORS = {
	[Enum.ItemQuality.Poor] = { r = 0.62, g = 0.62, b = 0.62 }, -- gray
	[Enum.ItemQuality.Common] = { r = 1.00, g = 1.00, b = 1.00 }, -- white
	[Enum.ItemQuality.Uncommon] = { r = 0.12, g = 1.00, b = 0.00 }, -- green
	[Enum.ItemQuality.Rare] = { r = 0.00, g = 0.44, b = 0.87 }, -- blue
	[Enum.ItemQuality.Epic] = { r = 0.64, g = 0.21, b = 0.93 }, -- purple
	[Enum.ItemQuality.Legendary] = { r = 1.00, g = 0.50, b = 0.00 }, -- orange
	[Enum.ItemQuality.Artifact] = { r = 0.90, g = 0.80, b = 0.50 }, -- gold/teal
	[Enum.ItemQuality.Heirloom] = { r = 0.00, g = 0.80, b = 1.00 }, -- yellow/teal
}

-- Localized fallback strings (these match Wrath client categories)
local ITEM_CLASS_NAMES = {
	[Enum.ItemClass.Consumable] = ITEM_CLASSES_CONSUMABLE or "Consumable",
	[Enum.ItemClass.Container] = ITEM_CLASSES_CONTAINER or "Container",
	[Enum.ItemClass.Weapon] = ITEM_CLASSES_WEAPON or "Weapon",
	[Enum.ItemClass.Gem] = ITEM_CLASSES_GEM or "Gem",
	[Enum.ItemClass.Armor] = ITEM_CLASSES_ARMOR or "Armor",
	[Enum.ItemClass.Reagent] = ITEM_CLASSES_REAGENT or "Reagent",
	[Enum.ItemClass.Projectile] = ITEM_CLASSES_PROJECTILE or "Projectile",
	[Enum.ItemClass.Tradegoods] = ITEM_CLASSES_TRADEGOODS or "Trade Goods",
	[Enum.ItemClass.Recipe] = ITEM_CLASSES_RECIPE or "Recipe",
	[Enum.ItemClass.Quiver] = ITEM_CLASSES_QUIVER or "Quiver",
	[Enum.ItemClass.Questitem] = ITEM_CLASSES_QUESTITEM or "Quest",
	[Enum.ItemClass.Key] = ITEM_CLASSES_KEY or "Key",
	[Enum.ItemClass.Miscellaneous] = ITEM_CLASSES_MISCELLANEOUS or "Miscellaneous",
	[Enum.ItemClass.Glyph] = ITEM_CLASSES_GLYPH or "Glyph",
}

-- Patch missing C_ChatInfo functions for 3.3.5
if not C_ChatInfo then
	C_ChatInfo = {}
	C_ChatInfo.SendAddonMessage = SendAddonMessage
	C_ChatInfo.SendChatMessage = SendChatMessage
	C_ChatInfo.BNSendGameData = BNSendGameData
end

-- TODO : Check what functions call this one
if not CreateVector2D then
	function CreateVector2D(x, y)
		return { x = x, y = y }
	end
end
if not CreateFromMixins then
	function CreateFromMixins(...)
		local t = {}
		for i = 1, select("#", ...) do
			local mixin = select(i, ...)
			if type(mixin) == "table" then -- only iterate if it's a table
				for k, v in pairs(mixin) do
					t[k] = v
				end
			end
		end
		return t
	end
end

-- NOTE : Imported from questie backport to Epoch
QuestieCompat = {}

local mapIdToUiMapId = {}
-- convert current mapAreaID and mapLevel to UiMapId
-- https://wowpedia.fandom.com/wiki/API_GetCurrentMapAreaID
-- https://wowwiki-archive.fandom.com/wiki/API_GetCurrentMapDungeonLevel
-- https://wowpedia.fandom.com/wiki/UiMapID#Classic
function QuestieCompat.GetCurrentUiMapID()
	local mapID = GetCurrentMapAreaID()
	if mapID == 0 then -- both the "Cosmic" and "Azeroth" maps return a mapID of 0
		mapID = GetCurrentMapContinent()
	end
	return mapIdToUiMapId[mapID + GetCurrentMapDungeonLevel() / 10] or 946
end

-- This function will do its utmost to retrieve some sort of valid position
-- for the player, including changing the current map zoom (if needed)
-- https://wowpedia.fandom.com/wiki/API_C_Map.GetPlayerMapPosition?oldid=2167175
function QuestieCompat.GetCurrentPlayerPosition()
	local x, y = GetPlayerMapPosition("player")
	if x <= 0 and y <= 0 then
		if WorldMapFrame:IsVisible() then
			-- we know there is a visible world map, so don't cause
			-- WORLD_MAP_UPDATE events by changing map zoom
			return QuestieCompat.GetCurrentUiMapID(), x, y
		end
		SetMapToCurrentZone()
		x, y = GetPlayerMapPosition("player")
		if x <= 0 and y <= 0 then
			-- attempt to zoom out once - logic copied from WorldMapZoomOutButton_OnClick()
			if ZoomOut() then
				-- do nothing
			elseif GetCurrentMapZone() ~= WORLDMAP_WORLD_ID then
				SetMapZoom(GetCurrentMapContinent())
			else
				SetMapZoom(WORLDMAP_WORLD_ID)
			end
			x, y = GetPlayerMapPosition("player")
			if x <= 0 and y <= 0 then
				-- we are in an instance without a map or otherwise off map
				return QuestieCompat.GetCurrentUiMapID(), x, y
			end
		end
	end
	return QuestieCompat.GetCurrentUiMapID(), x, y
end

local function MakeVector2D(x, y)
	local v = { x = x or 0, y = y or 0 }
	function v:GetXY()
		return self.x, self.y
	end
	return v
end

QuestieCompat.C_Map = {
	-- Returns map information.
	-- https://wowpedia.fandom.com/wiki/API_C_Map.GetMapInfo
	GetMapInfo = function(uiMapID)
		if QuestieCompat.UiMapData[uiMapID] then
			return QuestieCompat.UiMapData[uiMapID]
		end
	end,
	-- Returns a map subzone name.
	-- https://wowpedia.fandom.com/wiki/API_C_Map.GetAreaInfo
	GetAreaInfo = function(areaID)
		return
	end,
	-- Returns the current UI map for the given unit.
	-- https://wowpedia.fandom.com/wiki/API_C_Map.GetBestMapForUnit
	GetBestMapForUnit = function(unit)
		if unit == "player" then
			return QuestieCompat.GetCurrentPlayerPosition()
		end
	end,
	-- Translates a map position to a world map position.
	-- https://wowpedia.fandom.com/wiki/API_C_Map.GetWorldPosFromMapPos
	GetWorldPosFromMapPos = function(uiMapID, mapPos)
		local x, y, instanceID = QuestieCompat.HBD:GetWorldCoordinatesFromZone(mapPos.x, mapPos.y, uiMapID)
		return instanceID or 0, MakeVector2D(x, y)
	end,

	GetMapChildrenInfo = function(parentMapID, topDownStyle, z, w)
		local children = {}

		for mapID, mapData in pairs(QuestieCompat.UiMapData) do
			if mapData.parentMapID == parentMapID then
				table.insert(children, {
					mapType = mapData.mapType,
					mapID = mapData.mapID,
					name = mapData.name,
					parentMapID = mapData.parentMapID,
				})
			end
		end

		return children
	end,

	GetMapGroupID = function(uiMapID)
		local mapData = QuestieCompat.UiMapData[uiMapID]
		if mapData and mapData.mapGroupID then
			return mapData.mapGroupID
		end
		return nil
	end,
}
-- https://www.townlong-yak.com/framexml/classic/Blizzard_MapCanvas/Blizzard_MapCanvas.lua
QuestieCompat.WorldMapFrame = {
	IsVisible = function(self)
		return WorldMapFrame:IsVisible()
	end,
	IsShown = function(self)
		return WorldMapFrame:IsShown()
	end,
	Show = function(self)
		ShowUIPanel(WorldMapFrame)
	end,
	GetCanvas = function(self)
		return WorldMapButton
	end,
	GetMapID = QuestieCompat.GetCurrentUiMapID,
	SetMapID = function(self, UiMapID)
		local mapID = QuestieCompat.UiMapData[UiMapID].mapID
		local mapLevel = QuestieCompat.Round(mapID % 1 * 10)

		SetMapByID(math.floor(mapID) - 1)
		if mapLevel > 0 then
			SetDungeonMapLevel(mapLevel)
		end
	end,
	EnumeratePinsByTemplate = function(self, template)
		return pairs(QuestieCompat.HBDPins.worldmapPins)
	end,
}
if not C_Map then
	C_Map = QuestieCompat.C_Map
end

if not UnitPosition then
	function UnitPosition(unit)
		-- Only works reliably for the player, unless you have other unit map APIs
		if not UnitExists(unit) then
			return nil
		end

		-- Get map coords (0-1 range)
		local mapID = QuestieCompat.C_Map.GetBestMapForUnit(unit)
		if not mapID then
			return nil
		end

		local x, y = GetPlayerMapPosition(unit) -- 0–1 normalized coords
		if not x or not y or (x == 0 and y == 0) then
			return nil
		end

		-- Convert to world coords
		local wx, wy, instanceID = QuestieCompat.HBD:GetWorldCoordinatesFromZone(x, y, mapID)

		return wx, wy, 0, instanceID or 0
	end
end

-- C_Item helper
QuestieCompat.C_Item = {

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
			local itemID = tonumber(string.match(itemLink, "item:(%d+):"))
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
		local itemID = tonumber(string.match(link, "item:(%d+):"))
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

-- C_Container backport
-- C_Container helper
QuestieCompat.C_Container = {

	-- Returns the number of slots in a bag
	GetContainerNumSlots = function(bagID)
		return GetContainerNumSlots(bagID) or 0
	end,

	-- Returns a table with item info for a bag slot
	GetContainerItemInfo = function(bagID, slot)
		local texture, count, locked, quality, readable, lootable, itemLink = GetContainerItemInfo(bagID, slot)
		return {
			texture = texture,
			count = count,
			locked = locked,
			quality = quality,
			readable = readable,
			lootable = lootable,
			itemLink = itemLink,
		}
	end,

	-- Returns the item link for a bag slot
	GetContainerItemLink = function(bagID, slot)
		return GetContainerItemLink(bagID, slot)
	end,

	-- Returns whether a bag slot is locked
	IsLocked = function(bagID, slot)
		local _, _, locked = GetContainerItemInfo(bagID, slot)
		return locked
	end,

	-- Returns the number of free slots and bag type for a bag
	GetContainerNumFreeSlots = function(bagID)
		local free, bagType = GetContainerNumFreeSlots(bagID)
		return free, bagType
	end,

	ContainerIDToInventoryID = function(bagID)
		-- Backpack
		if bagID == 0 then
			return 20
		end
		-- Bags 1–4
		if bagID >= 1 and bagID <= 4 then
			return 20 + bagID
		end
		-- Fallback: return bagID itself
		return bagID
	end,
}

if not C_Container then
	C_Container = QuestieCompat.C_Container
end

-- Mixin backport
if not Mixin then
	function Mixin(target, ...)
		if not target then
			return
		end
		for i = 1, select("#", ...) do
			local mixin = select(i, ...)
			if type(mixin) == "table" then
				for k, v in pairs(mixin) do
					target[k] = v
				end
			end
		end
		return target
	end
end

if not C_EventUtils then
	C_EventUtils = {}
end

-- Stub function: returns true for anything, or implement a simple lookup table ?
C_EventUtils.IsEventValid = function(eventID)
	if not eventID then
		return false
	end
	-- Optionally, whitelist of valid IDs
	-- local validEvents = { [123] = true, [456] = true }
	-- return validEvents[eventID] or false
	return true
end

-- Special frame
QuestieCompat.frame = CreateFrame("Frame")
QuestieCompat.frame:RegisterEvent("ADDON_LOADED")
QuestieCompat.frame:RegisterEvent("PLAYER_LOGIN")
QuestieCompat.frame:RegisterEvent("PLAYER_LOGOUT")
QuestieCompat.frame:RegisterEvent("PLAYER_ENTERING_WORLD")
QuestieCompat.frame:SetScript("OnEvent", function(self, event, ...)
	local handler = QuestieCompat[event]
	if type(handler) == "function" then
		handler(self, event, ...)
	else
		-- Uncomment for debugging
		-- print("No handler for event:", event, ...)
	end
end)

local activeTimers = {}
local inactiveTimers = {}

local function timerCancel(id)
	local timer = activeTimers[id]
	if not timer then
		return
	end

	timer:GetParent():Stop()

	timer.id = nil
	activeTimers[id] = nil
	inactiveTimers[timer] = true
end

local function timerOnFinished(self)
	local id = self.id
	self.callback(id)

	-- Make sure timer wasn't cancelled during the callback and used again
	if id == self.id then
		if self.iterations > 0 then
			self.iterations = self.iterations - 1
			if self.iterations == 0 then
				timerCancel(id)
			end
		end
	end
end

QuestieCompat.C_Timer = {
	-- Schedules a (repeating) timer that can be canceled. (https://wowpedia.fandom.com/wiki/API_C_Timer.NewTimer)
	NewTicker = function(duration, callback, iterations)
		local timer = next(inactiveTimers)
		if timer then
			inactiveTimers[timer] = nil
		else
			local anim = QuestieCompat.frame:CreateAnimationGroup()
			timer = anim:CreateAnimation()
			timer:SetScript("OnFinished", timerOnFinished)
		end

		if duration < 0.01 then
			duration = 0.01
		end
		timer:SetDuration(duration)

		timer.callback = callback
		timer.iterations = iterations or -1
		timer.id = { Cancel = timerCancel }
		activeTimers[timer.id] = timer

		local anim = timer:GetParent()
		anim:SetLooping("REPEAT")
		anim:Play()

		return timer.id
	end,
	-- Schedules a timer. (https://wowpedia.fandom.com/wiki/API_C_Timer.After)
	After = function(duration, callback)
		return QuestieCompat.C_Timer.NewTicker(duration, callback, 1)
	end,
}

if not C_Timer then
	C_Timer = QuestieCompat.C_Timer
end

-- C_UnitAuras

-- C_UnitAuras helper
QuestieCompat.C_UnitAuras = {

	-- Returns aura data by index (mimics retail's GetAuraDataByIndex)
	GetAuraDataByIndex = function(unit, index, filter)
		filter = filter or "HELPFUL|HARMFUL" -- unused in Wrath

		local name, rank, icon, count, debuffType, duration, expirationTime, unitCaster

		-- Try buff first
		name, rank, icon, count, debuffType, duration, expirationTime, unitCaster = UnitBuff(unit, index)
		local isDebuff = false
		if not name then
			-- Try debuff
			name, rank, icon, count, debuffType, duration, expirationTime, unitCaster = UnitDebuff(unit, index)
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
		local player = "player"
		for i = 1, 40 do
			local aura = QuestieCompat.C_UnitAuras.GetAuraDataByIndex(player, i)
			if aura and aura.name == spellName then
				return i, aura
			end
		end
		return nil
	end,
}

if not C_UnitAuras then
	C_UnitAuras = QuestieCompat.C_UnitAuras
end

-- C_Unit helper
QuestieCompat.C_Unit = {}

-- Table mapping class IDs to class tokens
local CLASS_ID_TO_TOKEN = {
	[1] = "WARRIOR",
	[2] = "PALADIN",
	[3] = "HUNTER",
	[4] = "ROGUE",
	[5] = "PRIEST",
	[6] = "DEATHKNIGHT", -- Wrath adds DK in 3.3.5
	[7] = "SHAMAN",
	[8] = "MAGE",
	[9] = "WARLOCK",
	[11] = "DRUID",
}

-- Localized class names using CLASS constants
local CLASS_TOKEN_TO_NAME = {}
for _, token in pairs(CLASS_ID_TO_TOKEN) do
	local _, className = UnitClass("player") -- default to player class
	CLASS_TOKEN_TO_NAME[token] = _G["LOCALIZED_CLASS_" .. token] or token or className
end

-- Returns class info for a given classID
function QuestieCompat.C_Unit.GetClassInfo(classID)
	local token = CLASS_ID_TO_TOKEN[classID]
	if not token then
		return nil
	end
	local localizedName = CLASS_TOKEN_TO_NAME[token] or token
	return localizedName, token, classID
end

if not GetClassInfo then
	GetClassInfo = QuestieCompat.C_Unit.GetClassInfo
end

if not SOUNDKIT then
	SOUNDKIT = {}
end

SOUNDKIT.MAP_PING = 567 -- approximate ping sound
SOUNDKIT.UI_IG_MAINMENU_OPTIN_CHECKBOX_ON = 856 -- main menu checkbox select
SOUNDKIT.UI_IG_CHAT_SCROLL_BUTTON = 858 -- chat scroll click
SOUNDKIT.UI_IG_QUEST_LIST_OPEN = 859 -- quest log open
SOUNDKIT.UI_IG_QUEST_LIST_CLOSE = 860 -- quest log close
SOUNDKIT.UI_IG_MINIMAP_ZOOM_IN = 861 -- minimap zoom in

function GetMaxLevelForExpansionLevel(expansion)
	return 60
end

-- C_DateAndTime helper
QuestieCompat.C_DateAndTime = {

	-- Returns current calendar time (mimics GetCurrentCalendarTime)
	GetCurrentCalendarTime = function()
		local t = date("*t") -- Lua table with year, month, day, hour, min, sec, wday
		return {
			year = t.year,
			month = t.month,
			day = t.day,
			hour = t.hour,
			minute = t.min,
			second = t.sec,
			weekday = t.wday, -- 1 = Sunday
		}
	end,

	-- Returns number of saved instances (wraps Wrath API)
	GetNumSavedInstances = function()
		return GetNumSavedInstances()
	end,

	-- Returns saved instance info by index (wraps Wrath API)
	GetSavedInstanceInfo = function(index)
		return GetSavedInstanceInfo(index)
	end,
}

if not C_DateAndTime then
	C_DateAndTime = QuestieCompat.C_DateAndTime
end
