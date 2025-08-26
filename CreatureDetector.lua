local name,ZGV = ...

local CreatureDetector = {}
ZGV.CreatureDetector = CreatureDetector

local L = ZGV.L
--local LM = ZGV.LM
local CHAIN = ZGV.ChainCall

local table,string,tonumber,ipairs,pairs,setmetatable,min,max,tinsert = table,string,tonumber,ipairs,pairs,setmetatable,min,max,tinsert
local CT = LibStub("LibBabble-CreatureType-3.0")
local CTR = CT:GetReverseLookupTable()

CreatureDetector.mountSpellDatabase={}
CreatureDetector.petIDDatabase={}
CreatureDetector.modelDatabase={}

CreatureDetector.MAX_DETECTED_GUIDES = 5

tinsert(ZGV.startups,{"CreatureDetector startup",function(self)
	CreatureDetector:StartUp()
end})

function CreatureDetector:Detect(force)
	if not UnitExists("target") or InCombatLockdown() then return end

	if UnitIsPlayer("target") then -- Screw the IDs this one is safer
		self:DetectMount(not force)
	elseif (CTR[UnitCreatureType("target")] == "Non-combat Pet") then -- 
		self:DetectPet(not force)
	elseif (string.find(UnitGUID("target"),"Pet-")) then
		self:DetectHunterPet(not force)
	end
	return
end

-- Tries to detect a combat pet selected by player
local PLAYER_PET_PATTERN = UNITNAME_SUMMON_TITLE1:format(UnitName("player"))
function CreatureDetector:DetectHunterPet(silent_mode)
	if select(2,UnitClass("player"))~="HUNTER" then
		return nil  -- no business viewing it, either.
	end

	-- Check if our target is sane
	if UnitIsUnit("target","pet") then return end -- own pet
	local guid=UnitGUID("target")


	if not guid or not UnitExists("target") then
		if not silent_mode then  ZGV:Print("Incorrect target.")  end
		return  -- not a pet, whatever, bail out
	end

	-- Check the existence of the pet database
	if not self.modelDatabase then
		if not silent_mode then  ZGV:Print("No model guides are registered, sorry.")  end
		return
	end
	
	-- Second pet is not a unittoken pet, so we can't just check for it.
	-- Scan tooltip for Playername's Pet
	if ZGV.IsRetail then
		local tooltip = ZGV.TooltipScanner:GetUnit("target")
		if tooltip[2]==PLAYER_PET_PATTERN then
			return
		end
	end

	-- Creating a PlayerModel to display the model of a said pet
	self.PetMirror = self.PetMirror or CreateFrame("PlayerModel")
	self.PetMirror:Show() -- briefly
	self.PetMirror:SetUnit("target")

	-- Perfect, so what's the deal?
	local fileid = self.PetMirror:GetModelFileID()
	self.PetMirror:Hide() -- and stay low
	
	local guide = self.modelDatabase[fileid] and self.modelDatabase[fileid][1]

	if guide then
		CreatureDetector:Report("hunterpet",guide,owned)
	else
		ZGV:Debug("Hunter Pet Guide not found")
	end
end

-- Tries to detect the non-combat pet selected by player
function CreatureDetector:DetectPet(silent_mode)
	-- Check if our target is sane
	local guid = UnitGUID("target")
	local target = ZGV.GetTargetId()

	if not target then return end

	if not guid or not UnitExists("target") then -- "If that's not a NPC
		if not silent_mode then  ZGV:Print("Incorrect target.")  end
		return
	end

	-- Check the existence of the pet database
	if not self.petIDDatabase then
		if not silent_mode then  ZGV:Print("No minipet guides are registered, sorry.")  end
		return
	end

	local guide = self.petIDDatabase[target] and self.petIDDatabase[target][1] 

	local species = target and ZGV.PetBattle.SpeciesByDisplayId[target]
	local owned = species and ZGV.Parser.ConditionEnv.haspet(species)

	ZGV:Debug("pet %d %s",target,guide and "found" or "not found")

	-- If found, point at it
	if guide then
		ZGV:Debug("Mini Pet Detected")
		CreatureDetector:Report("pet",guide,owned)
	else
		ZGV:Debug("Mini Pet Guide not found")
	end
end

-- Tries to detect the mount of the target and focus the guide picker on this guide
-- TODO test and make sure if we need to force the loading of all guides in question
function CreatureDetector:DetectMount(silent_mode)
	-- Check if our target is sane
	if not UnitExists("target") or not UnitIsPlayer("target") then
		ZGV:Print("Incorrect target.")
		return
	end

	-- Check the existence of the mount database
	if not self.mountSpellDatabase then
		if not silent_mode then  ZGV:Print("No mount guides are registered, sorry.")  end
		return
	end

	-- Browsing through the buffs on the target and finding the one we have a guide for
	-- TODO is there a way to tell the whole amount of buffs on a unit?
	local guide, owned
	for i=1,1024 do -- meh
		local data = C_UnitAuras.GetAuraDataByIndex("target",i)
		if not data then break end

		local spellID = data.spellId

		if self.mountSpellDatabase[spellID] then
			owned = ZGV.Parser.ConditionEnv.hasmount(spellID)
			guide = self.mountSpellDatabase[spellID][1] --Only one guide per mount is needed. If there are more just ignore them.
			break
		end
	end

	-- If found, point at it
	if guide then
		CreatureDetector:Report("mount",guide,owned)
	else
		ZGV:Debug("CreatureDetector: No valid mount guide found for targeted player.")
	end
end

function CreatureDetector:Report(type,guide,owned)
	local NC = ZGV.NotificationCenter
	if not ZGV.db.profile.nc_creatures then return end

	-- do we already have that guide reported?
	for _,entry in ipairs(NC.Entries) do
		if entry.notiftype == "pet" or entry.notiftype == "hunterpet"  or entry.notiftype == "mount" then
			if entry.data.guide == guide.title then 
				-- remove and retrigger
				NC:RemoveEntry(entry.ident)
			end
		end
	end

	-- add new notification
	local title = L['notifcenter_cd_creature_title']:format(guide.title_short)
	local text = L['notifcenter_cd_'..type..'_text']
	local owned = owned and L['notifcenter_cd_'..type..'_owned'] or ""

	NC:AddEntry(
		type,
		title,
		text..owned,
		{guide=guide.title}
	)
end


local function registerIn(tab,id,guide)
	if not (id and guide) then return end
	if not tab[id] then
		tab[id]={}
	else
		for k,v in ipairs(tab[id]) do
			if v==guide then -- No duplicates please
				return
			end
		end
	end
	table.insert(tab[id],guide)
end

-- Registers a correspondence between mount spell id and a guide to obtain it
function CreatureDetector:RegisterMountSpell(spellid,guide)
	registerIn(self.mountSpellDatabase,spellid,guide)
end

-- Registers a correspondence between pet spell id and a guide to obtain it
function CreatureDetector:RegisterPetID(petid,guide)
	registerIn(self.petIDDatabase,petid,guide)
end

-- Registers a correspondence between a model and a guide to obtain it
function CreatureDetector:RegisterGuideModel(displayid,guide,fileid)
	registerIn(self.modelDatabase,fileid,guide)
end

function CreatureDetector:StartUp() -- Create the button
	if ZGV.IsRetail then
		hooksecurefunc("ToggleCollectionsJournal",function() CreatureDetector.MountJournalIconSetup() end)
		ZGV.SearchIconPool = ZGV.SearchIconPool or CreateFramePool("BUTTON",nil,"ZygorSearchButton")
	end
	ZGV:AddEventHandler("PLAYER_TARGET_CHANGED",CreatureDetector.OnEvent) 
end

function CreatureDetector:OnEvent(event)
	if event=="PLAYER_TARGET_CHANGED" then
		CreatureDetector:Detect()
	end
end



function CreatureDetector.MountJournalIconSetup()
	if CreatureDetector.MountsLoaded then return end

	hooksecurefunc(MountJournal.ScrollBox,"Update",CreatureDetector.UpdateMountIcons)

	CreatureDetector.MountsLoaded=true
end

function CreatureDetector.UpdateMountIcons()
	ZGV.SearchIconPool:ReleaseAll()

	local i, blizzbutton
	for i,blizzbutton in ipairs(MountJournal.ScrollBox.view.frames) do
		local button = ZGV.SearchIconPool:Acquire()
		button:SetParent(blizzbutton)
		button:SetPoint("TOPRIGHT",blizzbutton,"TOPRIGHT",-2,-5)
		button:SetFrameLevel(blizzbutton:GetFrameLevel()+1)
		button.tooltiptext = ZGV.L['mountframe_button']:format(blizzbutton.name:GetText())
		button:SetScript("OnClick", function() CreatureDetector.MountJournalIcon_OnClick(blizzbutton.spellID) end) -- Find the mount
	
		local spellID = blizzbutton.spellID
		local guide = spellID and CreatureDetector.mountSpellDatabase[spellID] and CreatureDetector.mountSpellDatabase[spellID][1]
		local owned = ZGV.Parser.ConditionEnv.hasmount(spellID)

		if spellID and guide and blizzbutton:IsShown() and not owned then
			ZGV:Debug("&mountguides Showing icon for pet %d %s",specID,blizzbutton.name:GetText())
			button:Show()
		else
			if ZGV.db.profile.debug then
				if not blizzbutton:IsShown() then
					ZGV:Debug("&mountguides Not showing icon for mount button %d... hidden",i)
				elseif not spellID then
					ZGV:Debug("&mountguides Not showing icon for mount %s... unknown??",blizzbutton.name:GetText())
				elseif not guide then
					ZGV:Debug("&mountguides Not showing icon for mount %d %s: no guide",spellID,blizzbutton.name:GetText())
				elseif ZGV.Parser.ConditionEnv.hasmount(spellID) then
					ZGV:Debug("&mountguides Not showing icon for mount %d %s: owned",spellID,blizzbutton.name:GetText())
				end
			end
			button:Hide()
		end
	end
end

function CreatureDetector.MountJournalIcon_OnClick(spellID)
	local guide = CreatureDetector.mountSpellDatabase[spellID] and CreatureDetector.mountSpellDatabase[spellID][1]
	if not guide then return end

	ZGV.Tabs:LoadGuideToTab(guide,1,"mounts")
end