--[[
Rule: on every talent purchase, figure out in how many talents the player can get back on track
by comparing his prospective build to subbuilds of order 1..n

Don't warn if the distance is less than their REMAINING talents after the purchase-to-be
--]]

-- #GLOBALS ChatFontSmall,CreateFrame,GameTooltip,GetCVar,GetCVarBool,HideUIPanel,LibStub,NO,QuickDumpStatusAndSuggestion,SAFEMODE,self,SetCVar,ShowUIPanel,StaticPopup_Show,StaticPopupDialogs,SystemFont_Tiny,UIParent,UISpecialFrames,UnitClass,UnitLevel,UnitName,YES
-- #GLOBALS UnitCharacterPoints
-- #GLOBALS ToggleTalentFrame,PlayerTalentFrame,TalentFrame_LoadUI,TalentFrame_Update,TalentMicroButton
-- #GLOBALS PLAYER_TALENTS_PER_TIER

-- #GLOBALS (API confirmed),GetNumTalents,GetNumTalentTabs,GetTalentInfo,GetTalentPrereqs,GetTalentTabInfo,LearnTalent
-- #GLOBALS (Zygor),BINDING_HEADER_ZYGORTALENTADVISOR,BINDING_NAME_ZYGORTALENTADVISOR_OPENPOPUP
-- #GLOBALS (Zygor),ZygorGuidesViewer,ZGV,ZygorTalentAdvisor_L,ZygorTalentAdvisor_TalentFrameLearnButton_OnClick,ZygorTalentAdvisorPopout

-- #GLOBALS-REMOVED!!! SetPreviewPrimaryTalentTree,AddPreviewTalentPoints,GetActiveTalentGroup,GetGroupPreviewTalentPointsSpent,GetPreviewPrimaryTalentTree,GetPrimaryTalentTree,GetTalentLink,GetUnspentTalentPoints,ResetGroupPreviewTalentPoints,LearnPreviewTalents
-- #GLOBALS (maybe),TalentFrameHeaderHelpBoxArrow1,TalentFrameHeaderHelpBoxArrow2,TalentFrameHeaderHelpBoxArrow3,TalentFrameLearnButton,TalentFrameLearnButton_OnClick,TalentFramePanel1SelectTreeButton,

-- #GLOBALS pet,

--[[
New Classic API?

function TalentFrame_UpdateTalentPoints()
	local talentPoints = UnitCharacterPoints("player");
	TalentFrameTalentPointsText:SetText(talentPoints);
	TalentFrame.talentPoints = talentPoints;
end
--]]

SAFEMODE = false

local name, ZGV = ...

local ZTA = {}
ZGV.TalentAdvisor = ZTA
ZGV.ZTA = ZTA

local CHAIN = ZGV.ChainCall

ZTA.buildStorage = {}

ZTA.registeredBuilds = {}

ZTA.L = ZygorGuidesViewer_L("zta")
local L = ZTA.L

local framename = "ZygorTalentAdvisorFrame"

--local HEADER_ZYGORTALENTADVISOR = L["name_plain"]
BINDING_NAME_ZYGORTALENTADVISOR_OPENPOPUP = L["binding_popout"]

ZTA.currentBuild = {}
ZTA.currentBuildTitle = {}
ZTA.status = { code = "?" }
ZTA.status_preview = { code = "?" }
ZTA.suggestion = {}
ZTA.suggestion_preview = {}

--[[
 ######################################################################################################################
     S E T U P
 ######################################################################################################################
--]]

local BUILDKEY_NONE = 99

function ZTA:Initialize()
	if not ZGV.db.profile.zta_enabled then
		return
	end
	if ZTA.Initialised then
		return
	end
	self:SetupConfig()

	--[[
	if GetTalentInfo(1,1) then
		self:DelayedRegisteredBuilds()
	end
	--]]

	ZGV:AddEventHandler("CHARACTER_POINTS_CHANGED", ZTA.CHARACTER_POINTS_CHANGED)

	hooksecurefunc("ToggleTalentFrame", function()
		self:Debug("ToggleTalentFrame hook")
		ZTA:PlayTalented()
	end)
	TalentMicroButton:HookScript("OnClick", function()
		self:Debug("TalentMicroButton hook")
		ZTA:PlayTalented()
	end)

	EventUtil.ContinueOnAddOnLoaded("Blizzard_TalentUI", function()
		hooksecurefunc("PlayerTalentTab_OnClick", function()
			self:Debug("PlayerTalentTab_OnClick hook")
			ZTA:PlayTalented()
		end)
	end)

	ZTA:SetHooks()

	StaticPopupDialogs["ZYGORTALENTADVISOR_WARNING"] = {
		text = "",
		button1 = YES,
		button2 = NO,
		OnAccept = function(self)
			if SAFEMODE then
				self:Debug("learning " .. self.data.tab .. "," .. self.data.talent)
				return nil
			end
			ZTA.Old_LearnTalent(self.data.tab, self.data.talent)
			ZTA:PlayTalented()
		end,
		OnCancel = function(self) end,
		OnHide = function(self)
			self.data = nil
			self.selectedIcon = nil
		end,
		hideOnEscape = 1,
		timeout = 0,
		whileDead = 1,
	}

	StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"] = {
		text = "",
		button1 = YES,
		button2 = NO,
		OnAccept = function(self)
			if SAFEMODE then
				self:Debug("learning previewed")
				return nil
			end
			LearnPreviewTalents(self)
		end,
		OnCancel = function(self) end,
		OnHide = function(self)
			self.data = nil
			self.selectedIcon = nil
		end,
		hideOnEscape = 1,
		timeout = 0,
		whileDead = 1,
	}

	--[[
	StaticPopupDialogs['ZYGORTALENTADVISOR_CONFIRM_LEARN_PREVIEW_TALENTS'] = {
		text = CONFIRM_LEARN_PREVIEW_TALENTS,
		button1 = YES,
		button2 = NO,
		OnAccept = function (self)
			LearnPreviewTalents(ZygorTalentAdvisor.Window.pet)
		end,
		OnCancel = function (self) end,
		hideOnEscape = 1,
		timeout = 0,
		exclusive = 1,
	}
	StaticPopupDialogs['ZYGORTALENTADVISOR_CONFIRMBULKLEARNING'] = {
		text = "...",
		button1 = YES,
		button2 = NO,
		OnAccept = function (self)
			ZTA:LearnSuggestedTalents(self.data.pet)
		end,
		OnCancel = function (self) end,
		hideOnEscape = 1,
		timeout = 0,
		exclusive = 1,
	}
	--]]

	if UnitClass("player") and GetTalentInfo(1, 1) then
		self:PruneRegisteredBuilds()
		self:LoadBuilds()
	else
		self:Debug("Couldn't PruneRegisteredBuilds at this time.")
	end

	self.popout = ZygorTalentAdvisorPopout

	self.popout:SetScript("OnShow", ZTA.Popout_OnShow)
	self.popout:SetScript("OnHide", ZTA.Popout_OnHide)
	self.popout:SetScript("OnUpdate", ZTA.Popout_OnUpdate)
	ZTA.Popout_OnLoad(self.popout)
	ZTA.Initialised = true
end

function ZTA:SetHooks()
	self.Old_LearnTalent = self.Old_LearnTalent or LearnTalent
	self.Old_GameTooltipSetTalent = self.Old_GameTooltipSetTalent or GameTooltip.SetTalent

	if ZGV.db.profile.zta_enabled then
		LearnTalent = self.ZTA_LearnTalent
		GameTooltip.SetTalent = self.ZTA_GameTooltipSetTalent
		if self.TalentFrame and self.TalentFrame.advisorbutton then
			self.TalentFrame.advisorbutton:Show()
		end
	else
		LearnTalent = self.Old_LearnTalent
		GameTooltip.SetTalent = self.Old_GameTooltipSetTalent
		if self.TalentFrame and self.TalentFrame.advisorbutton then
			self.TalentFrame.advisorbutton:Hide()
		end
	end
end

function ZTA:PrepareConfigDefaults()
	return {
		char = {
			zta_currentBuildKey = "_",
		},
		global = {
			zta_tutorialflags = {},
		},
		profile = {
			zta_forcebuild = false,
			zta_hints = true,
			zta_preview = true,
			zta_popup = 1,
			zta_windowdocked = true,
		},
	}
end

function ZTA:SetupConfig()
	self.db = ZGV.db

	local Getter_Simple = function(info)
		return self.db.profile[info[#info]]
	end
	local Setter_Simple = function(info, value)
		self.db.profile[info[#info]] = value
	end

	self.options = {
		name = L["name"],
		desc = L["desc"],
		type = "group",
		order = 1,
		--hidden = true,
		handler = self,
		get = Getter_Simple,
		set = Setter_Simple,
		args = {
			desc = {
				order = 1,
				type = "description",
				name = L["desc"],
			},
			zta_enabled = {
				name = L["opt_enabled"],
				type = "toggle",
				width = "full",
				--get inherited simple
				set = function(i, v)
					Setter_Simple(i, v)
					ZTA:SetHooks()
					if v then
						ZTA:Initialize()
						ZygorTalentAdvisorPopoutButton:Show()
						ZTA:PlayTalented()
					else
						ZygorTalentAdvisorPopoutButton:Hide()
						ZTA:CleanupTalentFrame()
					end
				end,
				order = 1,
				_default = true,
			},
			desc01 = {
				type = "header",
				name = L["opt_build_header"],
				order = 1.01,
				hidden = function()
					local _, class = UnitClass("player")
					return class ~= "HUNTER"
				end,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			build = { ------------------- BUILD --------------------
				name = L["opt_build"],
				desc = L["opt_build_desc"],
				type = "select",
				values = function()
					local t = { [BUILDKEY_NONE] = L["opt_build_none"] }
					if not self.registeredBuilds[1] then
						return t
					end
					local k, v
					local _, playerclass = UnitClass("player")
					for k, v in ipairs(self.registeredBuilds) do
						if v.class and v.class == playerclass then
							t[k] = { name = v.displayname, tooltip = v.tooltip }
						end
					end
					return t
				end,
				width = "double",
				get = function()
					return tonumber(self.db.char.zta_currentBuildKey) or BUILDKEY_NONE
				end,
				set = function(_, k)
					self:SetCurrentBuild(k, false)
				end,
				order = 1.1,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			zta_forcebuild = {
				name = L["opt_force"],
				desc = L["opt_force_desc"],
				type = "toggle",
				width = "single",
				--get simple
				set = function(i, v)
					Setter_Simple(i, v)
					self:LoadBuilds(false)
				end,
				hidden = function()
					return self.status.code ~= "RED"
				end,
				order = 1.2,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			desc1 = { order = 1.21, type = "description", name = "" },
			buildstatus = {
				type = "description",
				name = function()
					return self:GetStatusMessage(false)
				end,
				width = "full",
				order = 1.3,
			},
			--[[
			desc12 = { order = 1.31,	type = "description",	name = "|n", },
			descp = { ---------------- PET BUILD ------------------
				type = "header",
				name = L['opt_petbuild_header'],
				order = 2.01,
				hidden = function() local _,class = UnitClass("player") return class~="HUNTER" end,
			},
			--]]
			desc21 = { order = 2.21, type = "description", name = "" },
			talentframe = {
				name = L["opt_talentframe"],
				type = "header",
				--inline = true,
				order = 7,
				--args = {
			},
			zta_hints = {
				name = L["opt_hints"],
				desc = L["opt_hints_desc"],
				type = "toggle",
				width = "full",
				--get inherited simple
				set = function(i, v)
					Setter_Simple(i, v)
					if PlayerTalentFrame then
						PlayerTalentFrame_Update()
					end
				end,
				order = 7.1,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			zta_preview = {
				name = L["opt_preview"],
				desc = L["opt_preview_desc"],
				type = "toggle",
				width = "full",
				--get inherited simple
				set = function(i, v)
					Setter_Simple(i, v)
					if PlayerTalentFrame then
						PlayerTalentFrame_Update()
					end
				end,
				order = 7.2,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			zta_popup = {
				name = L["opt_popup"],
				desc = L["opt_popup_desc"],
				type = "select",
				style = "radio",
				width = "double",
				--get inherited simple
				--set inherited simple
				values = {
					[0] = L["opt_popup_0"],
					L["opt_popup_1"],
					L["opt_popup_2"] --[[,L['opt_popup_3']--]],
				},
				order = 8,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			zta_windowdocked = {
				name = L["opt_popup_dock"],
				desc = L["opt_popup_dock_desc"],
				type = "toggle",
				width = "double",
				--get inherited simple
				set = function(i, v)
					Setter_Simple(i, v)
					ZTA.Popout_Reparent()
					if v == false then
						ZygorTalentAdvisorPopout:ClearAllPoints()
						ZygorTalentAdvisorPopout:SetPoint("CENTER", 0, 200)
					end
					ZTA.Popout_UpdateDocking()
				end,
				order = 9,
				disabled = function()
					return not self.db.profile.zta_enabled
				end,
			},
			sep1 = {
				type = "description",
				name = " |n |n |n",
				order = 98,
			},
		},
	}

	return self.options
end

function ZTA:SetupConfigExtra()
	local Getter_Simple = function(info)
		return self.db.profile[info[#info]]
	end
	local Setter_Simple = function(info, value)
		self.db.profile[info[#info]] = value
	end

	local extra_args = {}
	extra_args["fake_talentsspent"] = {
		name = "FAKE talents spent",
		type = "range",
		min = -1,
		max = 60,
		step = 1,
		bigStep = 1,
		set = function(i, v)
			Setter_Simple(i, v)
			ZTA:PlayTalented()
		end,
		order = 100.1,
		_default = -1,
	}
	extra_args["fake_talentsunused"] = {
		name = "FAKE talents available",
		type = "range",
		min = -1,
		max = 60,
		step = 1,
		bigStep = 1,
		set = function(i, v)
			Setter_Simple(i, v)
			ZTA:PlayTalented()
		end,
		order = 100.2,
		_default = -1,
	}
	extra_args["fake_gotnewtalents"] = {
		name = "FAKE got new talents!",
		type = "execute",
		func = function()
			ZTA:CHARACTER_POINTS_CHANGED(_, 1)
		end,
		order = 100.3,
		_default = -1,
	}
	return { debugfake = { args = extra_args } }
end

function ZTA:LoadBuilds()
	if self.db.char.zta_currentBuildKey ~= BUILDKEY_NONE then
		self:SetCurrentBuild(self.db.char.zta_currentBuildKey, "startup")
	end
end

---- events

function ZTA:CHARACTER_POINTS_CHANGED(_, delta)
	if not ZGV.db.profile.zta_enabled then
		return
	end

	local self = ZTA -- I hate myself
	self:Debug("CHARACTER_POINTS_CHANGED " .. tostring(delta))
	if delta > 0 then
		self:OnNewTalents()
	end
	if self.bulklearning and delta < 0 and self.suggestion then
		self:UpdateSuggestions(false)
		if #self.suggestion > 0 then
			local sug_talent = self.suggestion[1]
			local name = GetTalentInfo(sug_talent.tab, sug_talent.talent)
			self:Print(L["msg_learned_talent"]:format(name))
			self.Old_LearnTalent(sug_talent.tab, sug_talent.talent)
		else
			self.bulklearning = nil
			self:Print("Fast learning complete.")
		end
	end
	self:UpdateSuggestions(false)
	ZTA:PlayTalented()
	ZTA.Popout_Update()
end

function ZTA:OnNewTalents()
	--local lasttalents = pet and self.lastUnspentPetTalents or self.lastUnspentTalents
	-- no selected build? bail.
	self:Debug("On New Talents")

	if not self.currentBuild and UnitCharacterPoints("player") > 0 then
		--if LibTutorial then LibTutorial:ShowTutorial("ZTA2") end
		return nil
	end

	--if self.alreadyProcessingNewTalents[toboolean(pet)] then return end

	--self.alreadyProcessingNewTalents[toboolean(pet)]=true

	-- no talents? bail.
	--if GetUnspentTalentPoints(false,pet)==0 then return end
	-- or not! handle clearing, too.

	self:LoadBuilds()

	--if not self:GetSuggestion(pet) then return nil end
	-- oh, do pop up, just with a warning

	local switchToPet = function()
		-- try to activate the pet talent frame
		for i = 1, 5 do
			local tab = _G["PlayerSpecTab" .. i]
			if tab and string.find(tab.specIndex, "^petspec") then
				tab:Click()
				break
			end
		end
	end

	local popup = self.db.profile.zta_popup or 0
	if popup == 1 then
		UIParentLoadAddOn("Blizzard_TalentUI")
		ShowUIPanel(PlayerTalentFrame)
		--PlayerTalentFrame_Open(pet, pet and 1 or GetActiveTalentGroup())

		if pet then
			switchToPet()
		end
	end

	if popup == 2 then
		ZTA.Popout_Popout()
		if pet then
			switchToPet()
		end
		ZTA.Popout_Update()
	end

	if popup == 3 then
		self:LearnSuggestedTalents(true)
	end

	self:PlayTalented()
end

local panels = { "" } --{"Panel1","Panel2","Panel3","PetPanel"}
function ZTA:CleanupTalentFrame()
	local hint, bor
	for p, panel in ipairs(panels) do
		for talent = 1, 100 do
			bor = _G["PlayerTalentFrame" .. panel .. "Talent" .. talent .. "RankBorder"]
			if bor then
				bor:SetWidth(32)
				bor:SetHeight(32)
			end

			hint = _G["PlayerTalentFrame" .. panel .. "Talent" .. talent .. "Hint"]
			if hint then
				hint:Hide()
			end
		end
	end

	self.cleaning = true
	--pcall(function() PlayerTalentFrame_Update(PlayerTalentFrame) end) -- something breaks here... screw it?
	PlayerTalentFrame_Update()
	self.cleaning = false
end

local function ZTA_SelectTree_Flash(self, elapsed)
	do
		return
	end
	self.time = self.time + elapsed
	if self.time > 0.5 then
		-- PlayerTalentFramePanel1SelectTreeButton:UnlockHighlight()
		-- PlayerTalentFramePanel2SelectTreeButton:UnlockHighlight()
		-- PlayerTalentFramePanel3SelectTreeButton:UnlockHighlight()
		if ZTA.currentBuild and ZTA.currentBuild.spec then
			local specbutton = _G["PlayerTalentFramePanel" .. ZTA.currentBuild.player.spec .. "SelectTreeButton"]
			if specbutton and specbutton.flash then
				specbutton:LockHighlight()
			else
				specbutton:UnlockHighlight()
			end
			specbutton.flash = not specbutton.flash
		end
		self.time = 0
	end
end

function ZTA:PlayTalented(remaining)
	if not ZGV.db.profile.zta_enabled then
		return
	end

	if self.cleaning then
		return nil
	end
	if not PlayerTalentFrame or not PlayerTalentFrame:IsVisible() then
		return
	end

	-- hook in deeper.
	if not self.hooked then
		self:Debug("zta hooking 1st time")
		--TalentFrameLearnButton:SetScript("OnClick",ZygorTalentAdvisor_TalentFrameLearnButton_OnClick) -- As of patch 1.13.2.30786 there's no Learn button, no Preview, talents are learned after being clicked once.

		--ZTA.Popout_Hook(ZygorTalentAdvisorPopout)

		hooksecurefunc("PlayerTalentFrame_OnHide", function()
			if self.popout.moving and self.popout:GetParent() == PlayerTalentFrame then
				self.db.profile.zta_windowdocked = false
				ZTA.Popout_Reparent()
				ZTA.Popout_UpdateDocking()
				self.popout.moving = false
				self.popout:StopMovingOrSizing()
				self.popout:Show()
			end

			--[[
			if self.popout:IsShown() then
				PlayerTalentFrame.advisorbutton:SetButtonState("PUSHED",1)
			else
				PlayerTalentFrame.advisorbutton:SetButtonState("NORMAL")
			end
			--]]

			--[[
			for i=1,MAX_NUM_TALENTS do
				_G['PlayerTalentFrameTalent'..i]:SetScript("OnClick",ZygorTalentAdvisor_PlayerTalentFrameTalent_OnClick)
			end
			--]]

			--[[
			if not self.hookedreset then
				self.hookedreset=true
				--self:Debug("hooked")
			end
			if PlayerTalentFrame and PlayerTalentFrame:IsVisible() then
				self:UpdateSuggestions(PlayerTalentFrame.pet)
			end
			--]]
		end)

		hooksecurefunc("PlayerTalentFrame_Update", function()
			self:PlayTalented()
		end)
		--hooksecurefunc("TalentFrame_UpdateControls",function() self:PlayTalented() end)

		self.hooked = true
	end

	if not PlayerTalentFrame.advisorbutton then
		--ZygorTalentAdvisorPopoutButton:SetParent(PlayerTalentFrame)

		PlayerTalentFrame.advisorbutton =
			ZGV.ChainCall(CreateFrame("BUTTON", nil, PlayerTalentFrame, "ZygorSpecialButton_Template"))
				:ApplySkin()
				:SetSize(32, 32)
				:SetPoint("TOPRIGHT", PlayerTalentFrame, "TOPRIGHT", -36, -40)
				:SetFrameStrata("HIGH")
				:SetFrameLevel(611)
				:SetScript("OnClick", function()
					if ZygorTalentAdvisorPopout and ZygorTalentAdvisorPopout:IsShown() then
						ZygorTalentAdvisorPopout:Hide()
					else
						ZGV.ZTA.Popout_Popout()
					end
				end)
				:SetScript("OnEnter", function(self)
					CHAIN(GameTooltip)
						:SetOwner(self, "ANCHOR_TOPLEFT")
						:SetText(L["name"])
						:AddLine(L["popout_button_tip"])
						--:SetText(L['popout_button_tip'])
						:Show()
				end)
				:SetScript("OnLeave", function(self)
					GameTooltip:Hide()
				end)
				:Show().__END

		PlayerTalentFrame.advisorbutton = ZygorTalentAdvisorPopoutButton

		--self.Popout_UpdateDocking()
		--[[ -- advisor button moved to "tab"
		--PlayerTalentFrame.advisorbutton:SetFrameLevel(120)
		--PlayerTalentFrameActivateButton:SetPoint("TOPRIGHT",PlayerTalentFrame,"TOPRIGHT",-40,-30)
		--]]

		--[[
		CreateFrame("Button",nil,PlayerTalentFrame,"UIPanelButtonTemplate")
		PlayerTalentFrame.advisorbutton:ClearAllPoints()
		PlayerTalentFrame.advisorbutton:SetPoint("TOPRIGHT",-40,-40)
		PlayerTalentFrame.advisorbutton:SetHeight(30)
		PlayerTalentFrame.advisorbutton:SetWidth(30)
		PlayerTalentFrame.advisorbutton:SetText("ZTA>")
		PlayerTalentFrame.advisorbutton:SetScript("OnClick",function() if ZygorTalentAdvisorPopout_Popup:IsShown() then ZygorTalentAdvisorPopout_Popup:Hide() else ZygorTalentAdvisorPopout_Popup() end end)
		--PlayerTalentFrame.advisorbutton:SetScript("OnEnter",function(self) GameTooltip_SetDefaultAnchor(GameTooltip,self)  GameTooltip:SetText(L['name']) GameTooltip:AddLine(L['popout_button_tip']) GameTooltip:Show() end)
		PlayerTalentFrame.advisorbutton:SetScript("OnEnter",function(self) GameTooltip_AddNewbieTip(self, L['name'], 1,1,1, L['popout_button_tip']) end)
		PlayerTalentFrame.advisorbutton:SetScript("OnLeave",GameTooltip_Hide)
		--]]
	end
	PlayerTalentFrame.advisorbutton:Show()

	local tab, panel = PanelTemplates_GetSelectedTab(PlayerTalentFrame), ""

	local build = self.currentBuild
	local force = self.db.profile.zta_forcebuild

	-- no build or build disabled? clean up, bail out.
	if not build or self.status.code == "BLACK" or (self.status.code == "RED" and not force) then
		self:CleanupTalentFrame()
		ZTA.Popout_Update()
		--ZTA.Popout_UpdateDocking()
		return
	end

	self:Debug("Displaying talent suggestions in tab %d.", tab)

	self:UpdateSuggestions()
	local suggestion = self.suggestion
	local preview = GetCVarBool("previewTalentsOption")

	ZTA.Popout_Update()
	--ZTA.Popout_UpdateDocking()

	--self:Debug("playtalented ")

	--[[
	local advisory = L['talentframeadvisory_head']:format(self.currentBuildTitle)
	local status = preview and self.status_preview or self.status
	if status.code=="ORANGE" then
		advisory = advisory .. "\n" .. L['talentframeadvisory_orange']:format(status.missed-status.pointsleft)
	end
	if status.code=="RED" then
		advisory = advisory .. "\n" .. L['talentframeadvisory_red']
	end
	TalentFrame.advisory:SetText(advisory)
	--]]

	-- first the spec buttons
	if not PlayerTalentFrame.scriptedtoflash then
		PlayerTalentFrame:HookScript("OnUpdate", ZTA_SelectTree_Flash)
		PlayerTalentFrame.time = 0
		PlayerTalentFrame.scriptedtoflash = true
		ZTA_SelectTree_Flash(PlayerTalentFrame, 99) --force
	end
	if PlayerTalentFramePanel1SelectTreeButton and PlayerTalentFramePanel1SelectTreeButton:IsShown() then
		PlayerTalentFrameHeaderHelpBoxArrow1:Hide()
		PlayerTalentFrameHeaderHelpBoxArrow2:Hide()
		PlayerTalentFrameHeaderHelpBoxArrow3:Hide()
		_G["PlayerTalentFrameHeaderHelpBoxArrow" .. build.spec]:Show()
	end

	--PlayerTalentFrameHeaderFrame.HeaderText:SetText(self.currentBuildTitle)
	--PlayerTalentFrameHeaderFrame.SubHeaderText:SetText("One-liner description could go here.")

	local counts, maxcounts = self:CountBuildTalents(self:GetTalentsSpent(), build)

	local button
	local txt, bor, borg, hint

	local borsizew, borsizeh = 32, 32 -- natural rank border size
	local borbigsizew, borbigsizeh = 54, 32 -- natural rank border size

	--for tab,panel in ipairs(panels) do
	local talents = GetNumTalents(tab)
	for talent = 1, talents do
		--[[
				txt = _G["PlayerTalentFrameTalent"..talent.."_MrRipleyTxt"]
				bor = _G["PlayerTalentFrameTalent"..talent.."_MrRipleyBor"]
				if not txt then
					button = _G["PlayerTalentFrameTalent"..talent]
					txt = button:CreateFontString("PlayerTalentFrameTalent"..talent.."_MrRipleyTxt")
					txt:SetPoint("TOPRIGHT",button,"TOPRIGHT",3,3)
					txt:SetWidth(8)
					txt:SetJustifyV("TOP")
					txt:SetJustifyH("CENTER")
					txt:SetFontObject(GameFontNormalSmall)
					bor = button:CreateTexture("PlayerTalentFrameTalent"..talent.."_MrRipleyBor")
					bor:SetPoint("CENTER",txt)
					bor:SetTexture("Interface\\TalentFrame\\TalentFrame-RankBorder")
					bor:SetWidth(32)
					bor:SetHeight(32)
				end
			--]]

		local prefix = "PlayerTalentFrame" .. panel .. "Talent" .. talent
		button = _G[prefix]
		txt = _G[prefix .. "Rank"]
		bor = _G[prefix .. "RankBorder"]
		borg = _G[prefix .. "RankBorder"] --Green?
		hint = _G[prefix .. "Hint"]
		local texture = button.icon

		-- prepare the hint balloon
		if not hint then
			hint = button:CreateTexture(prefix .. "Hint")
			--hint:SetTexture("Interface\\Buttons\\CheckButtonHilight")
			hint:SetPoint("LEFT", texture, "RIGHT", -14, 5)
			hint:SetSize(32, 32)
			hint:SetTexture(ZGV.DIR .. "\\Skins\\ZTA_Hints")
			hint:SetDrawLayer("OVERLAY")
		end

		local name, _, _, _, rank, maxrank, available, wtfrank = GetTalentInfo(tab, talent, false, pet)
		local desired = maxcounts[tab] and maxcounts[tab][talent] or 0

		local color_up_notfull = "|cff00ff00"
		local color_up_full = "|cffffff00"

		-- textual build preview
		if self.db.profile.zta_preview and self.status.code ~= "BLACK" and (self.status.code ~= "RED" or force) then
			if desired > 0 and rank < desired then
				if not txt:IsVisible() then
					txt:SetText("|cffaaaaaa" .. rank .. "/|r|cff00aaff" .. desired .. "|r")
					txt:Show()
					bor:Show()
				else
					txt:SetText(rank .. "|cffaaaaaa/|r|cff00aaff" .. desired .. "|r")
				end

				bor:SetSize(borbigsizew, borbigsizeh)
				borg:SetSize(borbigsizew, borbigsizeh)
			elseif desired > 0 and rank == desired then
				txt:SetText(rank .. "/" .. desired)
				bor:SetSize(borbigsizew, borbigsizeh)
				borg:SetSize(borbigsizew, borbigsizeh)
			elseif rank > desired then
				txt:SetText(rank .. "|cffaaaaaa/|r|cffff0000" .. desired .. "|r")
				bor:SetSize(borbigsizew, borbigsizeh)
				borg:SetSize(borbigsizew, borbigsizeh)
			else
				--bor:SetSize(18,18)
				--borg:SetSize(18,18)
				--if GetUnspentTalentPoints(false,pet) preview
			end
		else
			bor:SetSize(borsizew, borsizeh)
			borg:SetSize(borsizew, borsizeh)
			txt:SetText(rank)
			--if rank<maxrank then txt:SetTextColor(0,1,0) else txt:SetTextColor
		end

		-- hint balloons

		if suggestion and #suggestion > 0 and self.db.profile.zta_hints then
			local suggested

			-- consider all suggestions in preview/ooo mode; only the first suggestion in strict/inorder mode
			--self:IsOutOfOrder(pet) or

			-- actually, no. Let's try to get out of OOO mode somehow.
			--[[
				if preview or (suggestion[1][1]==tab and suggestion[1][2]==talent) then
					suggested = suggestion and suggestion[tab.."."..talent]
				end
				--]]
			suggested = suggestion[tab .. "." .. talent]

			local mindesired = counts[tab] and counts[tab][talent] or 0

			-- hint balloon display
			if suggested then -- suggested this turn
				local hintpoints = suggested --(rank-realrank)  -- suggested minus previewed
				if hintpoints > 0 then
					hint:SetTexCoord(0.125 * hintpoints, 0.125 * (hintpoints + 1), 0, 1)
				elseif hintpoints == 0 then
					hint:SetTexCoord(0.125 * 6, 0.125 * 7, 0, 1)
				else
					hint:SetTexCoord(0.875, 1.000, 0, 1) -- X
					--self:Debug("X1"..name.." : hints="..hintpoints.." for rank "..rank)
				end
				hint:SetDesaturated(texture:IsDesaturated())
				hint:Show()
			elseif rank > mindesired and preview and rank > realrank and realrank <= mindesired then -- overinvested! oh shit. But warn only if it matters anymore.
				hint:SetTexCoord(0.875, 1.000, 0, 1) -- X
				hint:SetDesaturated(texture:IsDesaturated())
				hint:Show()
				--self:Debug("X2 "..name)
			else
				hint:Hide()
			end
		else
			hint:Hide()
		end
	end
	--end

	if self.db.profile.fake_talentsunused > -1 then
		PlayerTalentFrameTalentPointsText:SetText(
			("%d |cff888888(%d)"):format(self.db.profile.fake_talentsunused, UnitCharacterPoints("player"))
		)
	end
end

function ZTA:GetSuggestionTooltip()
	self:Debug("GetSuggestionTooltip")
	return L["suggest_button_tooltip"]:format(self.currentBuildTitle["player"])
end

function ZTA:GetSuggestionFormatted()
	UIParentLoadAddOn("Blizzard_TalentUI")
	local sugformatted = {}
	for i = 1, #self.suggestion do
		local tab, talent = self.suggestion[i].tab, self.suggestion[i].talent
		local id, tabname, description, icon, pointsSpent, background, previewPointsSpent, isUnlocked =
			GetTalentTabInfo(tab, false)
		local name, tex, _, _, realrank, maxrank = GetTalentInfo(tab, talent, false)
		if not sugformatted[tabname] then
			sugformatted[tabname] = {}
		end
		local inserted = false
		for i = 1, #sugformatted[tabname] do
			if sugformatted[tabname][i].name == name then
				if maxrank > 1 then
					table.insert(sugformatted[tabname][i], realrank + #sugformatted[tabname][i] + 1)
				else
					table.insert(sugformatted[tabname][i], 0)
				end
				inserted = true
				break
			end
		end
		if not inserted then -- new talent
			table.insert(
				sugformatted[tabname],
				{ tex = tex, tab = tab, name = name, talent = talent, [1] = realrank + 1 }
			)
		end
	end
	return sugformatted
end

function ZTA:LearnSuggestedTalents(loud)
	UIParentLoadAddOn("Blizzard_TalentUI")
	if not self.currentBuild then
		self:Print(L["error_bulklearn_nobuild"])
		return
	end
	if not self.suggestion or #self.suggestion == 0 then
		self:Print(L["error_bulklearn_nosuggestion"])
		return
	end

	local suggestion = self.suggestion

	if loud then
		local sugformatted = self:GetSuggestionFormatted()
		local s = ""

		self:Print(L["msg_learned_verbose"])

		for tab, talents in pairs(sugformatted) do
			self:Print("|cffffffff" .. tab .. "|r:")
			local s
			for n, levels in ipairs(talents) do
				local talent = "|T" .. levels.tex .. ":0:0:0:0|t " .. GetTalentInfo(levels.tab, levels.talent) --|cffffdd00"..GetTalentLink(levels.tab,levels.talent,false,pet,GetActiveTalentGroup())
				if levels[1] == 0 then
					s = talent
				else
					s = talent .. " |cff997700("
					if #levels < 3 then
						s = s .. table.concat(levels, ",")
					else
						s = s .. levels[1] .. "-" .. levels[#levels]
					end
					s = s .. ")|r"
				end
				self:Print(L["msg_learned_verbose_talent"]:format(s))
			end
		end
	else
		self:Print("Starting fast learning.")
	end

	if #suggestion > 1 then
		self.bulklearning = true
		ZTA:CHARACTER_POINTS_CHANGED(_, -1)
		--[[ TODO: rework, talent previews do not exist on classic
		local preview = GetCVar("previewTalentsOption")
		SetCVar("previewTalentsOption",1)
		self:PreviewSuggestions(true)
		self:ScheduleTimer(function()
			LearnPreviewTalents()
			SetCVar("previewTalentsOption",preview)
		end, 0.1)
		--]]
	else
		self.Old_LearnTalent(suggestion[1].tab, suggestion[1].talent)
	end

	if not self.db.profile.zta_windowdocked then
		ZygorTalentAdvisorPopout:Hide()
	else
		ZTA.Popout_Update()
	end

	--[[
	else
		self.bulklearning=true -- starts processing the queue, driven by CHARACTER_POINTS_CHANGED -1
		local name=GetTalentInfo(self.suggestion[1].tab,self.suggestion[1].talent,false)
		self:Print(L['msg_learned']:format(name))
		Old_LearnTalent(self.suggestion[1].tab,self.suggestion[1].talent)
	end
	--]]
end

-- Talent Previews were added in patch 3.1.0.
function ZTA:PreviewSuggestions(quiet)
	print("UNABLE TO PREVIEW - rework using pre-")
	do
		return
	end

	self.cleaning = true

	local suggestion = self.suggestion
	if not suggestion then
		return
	end

	-- this may look out of order, but is fine for applying ALL suggestions

	-- not any longer?

	local pts
	--[[
	local sug
	for tab,talent in talentpairs(false) do
		sug = suggestion[tab.."."..talent]
		if sug then 
			pts = GetGroupPreviewTalentPointsSpent()
			AddPreviewTalentPoints(tab,talent,sug)
			if pts==GetGroupPreviewTalentPointsSpent() then
				local name=GetTalentInfo(tab,talent,false)
				self:Print("|cffff0000Error!|r Talent "..name.." suggested but unavailable!")
			end
		end
	end
	--]]

	for i, sug in ipairs(suggestion) do
		pts = GetGroupPreviewTalentPointsSpent()
		AddPreviewTalentPoints(sug.tab, sug.talent, 1)
		if pts == GetGroupPreviewTalentPointsSpent() then
			local name = GetTalentInfo(sug.tab, sug.talent, false)
			self:Print("|cffff0000Error!|r Talent " .. name .. " suggested but unavailable!")
		end
	end

	self.cleaning = false
	self:PlayTalented()

	if not quiet and (not PlayerTalentFrame or not PlayerTalentFrame:IsVisible()) then
		UIParentLoadAddOn("Blizzard_TalentUI")
		ToggleTalentFrame()
	end
end

function ZTA.talentpairs()
	local tab, tal = 1, 0
	return function()
		tal = tal + 1
		if tal > GetNumTalents(tab) then
			tal = 1
			tab = tab + 1
		end
		if tab <= GetNumTalentTabs() then
			return tab, tal
		end
	end
end

local PLAYER_TALENTS_PER_TIER = 5

function ZTA.ZTA_LearnTalent(tab, talent) --,pet,group
	local self = ZTA
	-- need to double-check if the user hasn't clicked an inaccessible talent, otherwise we're barking up the wrong tree
	if UnitCharacterPoints("player") == 0 then
		return nil
	end

	local _, _, _, _, tabPointsSpent, _, _, _ = GetTalentTabInfo(tab, false)
	local name, iconTexture, tier, column, rank, maxRank, isExceptional, available = GetTalentInfo(tab, talent) --, false, pet, group

	if ((tier - 1) * PLAYER_TALENTS_PER_TIER > tabPointsSpent) then
		-- tier locked! bail.
		return nil
	end
	local reqtab, reqtal, learnable = GetTalentPrereqs(tab, talent, false)
	if reqtab and not learnable then
		return nil
	end

	local suggestion = self.suggestion
	if self.currentBuild and suggestion and #suggestion > 0 then
		local status = self.status

		local found, s
		for i = 1, #suggestion do
			if suggestion[i].tab == tab and suggestion[i].talent == talent then
				found = i
			end
		end
		if not found then
			-- RED!
			local counts, maxcounts = self:CountBuildTalents(self:GetTalentsSpent(), self.currentBuild)
			local buildTitle = self.currentBuildTitle
			if not maxcounts[tab] or maxcounts[tab][talent] == 0 then
				-- never taken at all
				StaticPopupDialogs["ZYGORTALENTADVISOR_WARNING"].text = L["warning_learn1_red0"]:format(buildTitle)
			elseif rank + 1 > maxcounts[tab][talent] then
				-- taken, but not this far
				StaticPopupDialogs["ZYGORTALENTADVISOR_WARNING"].text = L["warning_learn1_red"]:format(
					buildTitle,
					maxcounts[tab][talent],
					GetTalentInfo(tab, talent, false)
				)
			else
				-- Warning, ORANGE zone: not in suggestion, so too far
				local stab = suggestion[1].tab
				local stalent = suggestion[1].talent
				StaticPopupDialogs["ZYGORTALENTADVISOR_WARNING"].text = L["warning_learn1_orange"]:format(
					buildTitle,
					select(2, GetTalentTabInfo(stab, false)),
					GetTalentInfo(stab, stalent, false),
					GetTalentInfo(tab, talent, false)
				)
			end
			local dialog = StaticPopup_Show("ZYGORTALENTADVISOR_WARNING")
			if dialog then
				dialog.data = { tab = tab, talent = talent }
			else
				self:Print("ERROR: Cannot show dialog.\n" .. StaticPopupDialogs["ZYGORTALENTADVISOR_WARNING"].text)
			end
			return
		else
			-- YELLOW.
		end
	end

	if SAFEMODE then
		self:Debug("Learning\n" .. name)
	else
		self.Old_LearnTalent(tab, talent)
	end
end

-- OVERRIDE
-- unused in Classic; no Learn button
function ZygorTalentAdvisor_TalentFrameLearnButton_OnClick(self)
	local TalentFrame = PlayerTalentFrame

	local ZTA = ZygorTalentAdvisor

	ZTA:UpdateSuggestions()
	local status = ZTA.status_preview
	local build = ZTA.currentBuild

	if status and build then
		if status.code == "GREEN" or status.code == "YELLOW" then
			StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"].text =
				L["warning_preview_green"]:format(ZTA.currentBuildTitle)
		elseif status.code == "ORANGE" then
			StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"].text =
				L["warning_preview_orange"]:format(ZTA.currentBuildTitle, status.missed - status.pointsleft) --GetUnspentTalentPoints(false,pet)+GetGroupPreviewTalentPointsSpent(pet) ??
		elseif status.code == "RED" then
			StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"].text =
				L["warning_preview_red"]:format(ZTA.currentBuildTitle)
		elseif status.code == "BLACK" then
			StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"].text = L["warning_preview_black"]:format(status.msg)
		end
		local dialog = StaticPopup_Show("ZYGORTALENTADVISOR_PREVIEWWARNING")
		if dialog then
			dialog.data = {}
		else
			ZTA:Print("ERROR: Cannot show dialog.\n" .. StaticPopupDialogs["ZYGORTALENTADVISOR_PREVIEWWARNING"].text)
		end
		return nil
	else
		TalentFrameLearnButton_OnClick(self)
		--StaticPopup_Show("CONFIRM_LEARN_PREVIEW_TALENTS")
	end
end

--[[
function ZygorTalentAdvisor_PlayerTalentFrameTalent_OnClick(self, button)
	--debug("click in zta? "..tostring(self.isZTA))
	if ( IsModifiedClick("CHATLINK") ) then
		local link = GetTalentLink(PanelTemplates_GetSelectedTab(PlayerTalentFrame), self:GetID(),
			PlayerTalentFrame.inspect, PlayerTalentFrame.pet, PlayerTalentFrame.talentGroup, GetCVarBool("previewTalents"));
		if ( link ) then
			ChatEdit_InsertLink(link);
		end
	elseif not PlayerTalentFrame.inspect and (PlayerTalentFrame.pet or GetActiveTalentGroup(false,PlayerTalentFrame.pet)==PlayerTalentFrame.talentGroup) then
		-- only allow functionality if an active spec is selected
		if ( button == "LeftButton" ) then
			if ( GetCVarBool("previewTalents") ) then
				AddPreviewTalentPoints(PanelTemplates_GetSelectedTab(PlayerTalentFrame), self:GetID(), 1, PlayerTalentFrame.pet, PlayerTalentFrame.talentGroup);
			else
				LearnTalent(PanelTemplates_GetSelectedTab(PlayerTalentFrame), self:GetID(), PlayerTalentFrame.pet, PlayerTalentFrame.talentGroup);
			end
		elseif ( button == "RightButton" ) then
			if ( GetCVarBool("previewTalents") ) then
				if IsTalentRemovable(PanelTemplates_GetSelectedTab(PlayerTalentFrame), self:GetID(), PlayerTalentFrame.pet, PlayerTalentFrame.talentGroup) then
					AddPreviewTalentPoints(PanelTemplates_GetSelectedTab(PlayerTalentFrame), self:GetID(), -1, PlayerTalentFrame.pet, PlayerTalentFrame.talentGroup);
				end
			end
		end
	end

	if self.isZTA then
		self:GetScript("OnLeave")(self)
		self:GetScript("OnEnter")(self)
	end
end

function ZygorTalentAdvisor_PlayerTalentFrameTalent_OnEvent(self, event, ...)
	if self:GetID() then
		-- whoa, original button! handle carefully.
		PlayerTalentFrameTalent_OnEvent(self, button)
		return
	end
	if ( GameTooltip:IsOwned(self) ) then
		GameTooltip:SetTalent(self.tab, self.talent, false, false, 1, GetCVarBool("previewTalents"))
	end
end

function ZygorTalentAdvisor_PlayerTalentFrameTalent_OnEnter(self)
	if self:GetID() and self:GetID()>0 then
		-- whoa, original button! handle carefully.
		PlayerTalentFrameTalent_OnEnter(self, button)
		return
	end
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetTalent(self.tab, self.talent, false, false, 1, GetCVarBool("previewTalents"))
end
--]]

---
-- @return nil
--
function ZTA:MarkBuildTaken(build)
	if not build then
		return
	end
	for n = 1, #build do
		build[n].taken = nil
		build[n].preview = nil
	end

	build.realfail = nil
	build.previewfail = nil
	for tab, talent in self.talentpairs(false) do
		local name, _, _, _, realrank, maxrank, isExceptional, available = GetTalentInfo(tab, talent, false)
		if name then
			-- we're missing prevrank now?
			for i = 1, realrank do
				local found
				for n = 1, #build do
					if build[n][1] == tab and build[n][2] == talent and not build[n].taken and not build[n].preview then
						--self:Debug(tab..","..talent.." ".."build#"..n.." "..((i>realrank)and"preview"or"taken"))
						if i > realrank then -- marking as prev-taken
							build[n].preview = true
						else
							build[n].taken = true
						end
						found = true
						break
					end
				end
				if not found then
					-- okay, we have a fuckup, but a real or a preview fuckup?
					if i <= realrank then
						build.realfail = true
					else
						build.previewfail = true
					end
					break
				end
			end
		end
		-- if build.realfail then break end    -- does this break red builds?
	end
	if build.realfail then
		build.previewfail = true
	end
end

function ZTA:GetBuildStatus(build, preview)
	-- first, a diagnosis: can this be done at all?
	-- GREEN: we can proceed safely; player's current build is a direct start-based subset of the target build.
	-- YELLOW: we can proceed carefully; player's current build is a subset of the target build, but not start-based, but can be fixed in the remaining points.
	-- ORANGE: minor fuckup; player's current build is a non-start-based subset of the target build and can not be fixed in the remaining points.
	-- RED: major fuckup; player's current build is NOT a subset of the target build.

	local status = { code = "?", pointsleft = 0, missed = 0 }

	-- To glean that, we need to remove player's current talents from the start of the target build plan, and see what that gives us.
	-- Or at least mark them as taken.

	-- REMOVED FROM HERE: handling selected spec,dualspec,pet

	self:MarkBuildTaken(build)

	local force = self.db.profile.zta_forcebuild

	if (preview and build.previewfail or build.realfail) and not force then
		--self:Debug("Code: RED. B0rked.")
		status.code = "RED"
		return status -- if real status is RED, preview status doesn't matter
	end

	-- find the index of the last taken talent in the build plan
	-- this helps both the real and preview checks
	local last = 0
	for n = 1, #build do
		if build[n]["taken"] then
			last = n
		end
		if preview and build[n]["preview"] then
			last = n
		end
	end

	-- Whew, it's not RED, so maybe it's GREEN?
	-- if that's equal to the number of the player's talents, we're GREEN. Unless we were RED already, screw it then.
	local spent = self:GetTalentsSpent() -- +(preview and GetGroupPreviewTalentPointsSpent(pet) or 0)  -- classic: no preview
	if spent == last then
		status.code = "GREEN"
	else
		-- Okay, so it's either yellow or orange. Let's see in how many moves the player can reach the true path of enlightenment - that is, the proper build.
		-- Obviously they must've missed some talents and taken others - that's the number they must make up for.
		local pointsleft = UnitCharacterPoints("player") -- -(preview and GetGroupPreviewTalentPointsSpent() or 0) -- classic: no preview
		local missed = 0
		for n = 1, last do
			if not build[n].taken and not (preview and build[n].preview) then
				missed = missed + 1
			end
		end
		--self:Debug("pointsleft",pointsleft)
		--self:Debug("missed",missed)
		if pointsleft >= missed then
			-- whew, safe.
			status.code = "YELLOW"
			status.pointsleft = pointsleft
			status.missed = missed
		else
			-- oh, how sad
			status.code = "ORANGE"
			status.pointsleft = pointsleft
			status.missed = missed
		end
	end

	if (preview and build.previewfail or build.realfail) and force then
		-- RED comes back
		status.code = "RED"
	end

	return status
end

function QuickDumpStatusAndSuggestion(status, sug)
	local s = ""
	s = s .. (status and status.code or "?")
	if status and (status.code == "YELLOW" or status.code == "ORANGE") then
		s = s .. (" (%d)"):format(status.pointsleft - status.missed)
	end
	if status and (status.code == "BLACK") then
		s = s .. (" (%s)"):format(status.msg)
	end
	s = s .. ": "
	if sug then
		for i = 1, #sug do
			s = s .. sug[i].tab .. "," .. sug[i].talent .. "; "
		end
	else
		s = s .. "none"
	end
	return s
end

function ZTA:UpdateSuggestions()
	local preview = GetCVarBool("previewTalentsOption")

	local build = self.currentBuild
	if not build then
		return nil
	end

	self:Debug("&_PUSH UpdateSuggestions()")

	self.suggestion, self.status = self:MakeSuggestion()
	self:Debug("suggestion: " .. QuickDumpStatusAndSuggestion(self.status, self.suggestion))
	if preview then
		self.suggestion_preview, self.status_preview = self:MakeSuggestion(true)
		self:Debug("suggestion_preview: " .. QuickDumpStatusAndSuggestion(self.status_preview, self.suggestion_preview))
	end

	if self.suggestion and #self.suggestion > 0 then
		--if LibTutorial then LibTutorial:ShowTutorial("ZTA3") end
	end
	self:Debug("&_POP")
end

---
-- @return suggestion,status
function ZTA:MakeSuggestion(preview)
	self:Debug("MakeSuggestion(" .. tostring(preview) .. ")")

	-- clear any old suggestions, for starters
	local suggestion = {}

	if self:IsDisabled() then
		local status = { code = "BLACK", msg = "disabled" }
		return {}, status
	end

	local build = self.currentBuild
	if not build then
		--		local status = {code="BLACK",msg=L["status_black_broken"]:format(self.brokenmsg)}
		return {}, self.status
	end
	if #build < self:GetTalentsSpent() then
		local status = { code = "BLACK", msg = L["status_black_smallbuild"]:format(#build, self:GetTalentsSpent()) }
		return {}, status
	end

	local AddSuggestion = function(tab, talent)
		suggestion[tab .. "." .. talent] = (suggestion[tab .. "." .. talent] or 0) + 1
		table.insert(suggestion, { tab = tab, talent = talent })
		--self:Debug(tab,talent)
	end

	local status = self:GetBuildStatus(build, preview)

	if status.code == "BLACK" then
		return suggestion, status
	end

	if #build < self:GetTalentsSpent() then
		-- somehow exceeded
		local status = { code = "BLACK", msg = L["status_black_exceeded"]:format(#build, self:GetTalentsSpent()) }
		return {}, status
	elseif #build == self:GetTalentsSpent() then
		-- complete or altogether different
		local alltaken = true
		for i = 1, #build do
			if not build[i].taken then
				alltaken = false
				break
			end
		end
		if alltaken then
			local status = { code = "BLACK", msg = L["status_black_complete"]:format(#build, self:GetTalentsSpent()) }
			return {}, status
		else
			local status = { code = "BLACK", msg = L["status_black_different"]:format(#build, self:GetTalentsSpent()) }
			return {}, status
		end
	end

	local force = self.db.profile.zta_forcebuild
	if status.code ~= "RED" or force then
		-- suggest away!
		local points = self:GetUnusedTalentPoints()
		if preview then
			points = points - GetGroupPreviewTalentPointsSpent()
		end
		for i = 1, #build do
			if points == 0 then
				break
			end
			local tab, talent = unpack(build[i])
			if not build[i].taken and not (preview and build[i].preview) then
				points = points - 1
				AddSuggestion(tab, talent)
			end
		end
	end

	return suggestion, status
end

function ZTA:IsOutOfOrder()
	return self.outOfOrder
end

function ZTA:IsDisabled()
	return self.disabled
end

function ZTA:Hint(tab, talent)
	local id, name, description, icon, pointsSpent, background, previewPointsSpent, isUnlocked =
		GetTalentTabInfo(i, false)
	local name, _, _, _, rank = GetTalentInfo(tab, talent, false)

	ZGV:Print("Suggestion: Upgrade your talent '" .. name .. "'.")
end

function ZTA:GetTalentsSpent()
	if self.db.profile.fake_talentsspent > -1 then
		return self.db.profile.fake_talentsspent
	end
	local tabs = 3 -- classic: hardcoded
	local talentsSpent = 0
	for i = 1, tabs do
		local id, name, description, icon, pointsSpent, background, previewPointsSpent, isUnlocked =
			GetTalentTabInfo(i, false)
		talentsSpent = talentsSpent + pointsSpent
	end
	return talentsSpent
end

function ZTA:GetUnusedTalentPoints()
	if self.db.profile.fake_talentsunused > -1 then
		return self.db.profile.fake_talentsunused
	end
	return UnitCharacterPoints("player")
end

--- select a build. Determine if it's a pet build from the build itself.
function ZTA:SetCurrentBuild(key, startup)
	local builds = self.registeredBuilds

	if type(key) == "string" then
		for i, v in ipairs(builds) do
			if v.buildKey == key then
				key = i
			end
		end
	end

	self:Debug("&_PUSH SetCurrentBuild " .. tostring(key))

	--[[
	if type(key)=="string" then
		for i,build in ipairs(builds) do
			if build.title==num then
				num=i
				break
			end
		end
		if type(num)=="string" then
			self:Print("no such build name: "..num)
			num=0
		end
	end
	--]]

	local build = builds[key]

	if build then
		-- we have the build, let's check it.
		-- we could trust pruning for classes, but pet types change often.

		local _, myclass = UnitClass("player")

		self:Debug("build is " .. tostring(build.title))

		self.status = { code = "?" }

		if build.class and build.class ~= myclass then
			self.status = { code = "BLACK", msg = "wrong class, wtf?" }
			self:Debug("&_POP")
			return nil
		end -- why wasn't it pruned with PruneRegisteredBuilds, anyway?

		--[[
		local localclass,class = UnitClass("player")
		if #builds==0 then
			self:Print("No registered builds for "..localclass)
			return
		end
		if not builds[num] then
			self:Print("No registered build number "..num.." for "..localclass)
			return
		end
		--]]

		-- okay, build seems to match us or the pet; let's parse it

		local data, msg

		if build then
			data = build.build

			if self.status.code ~= "BLACK" then -- nil-safe
				if type(data) == "string" then
					if data:find("^%d+$") then
						-- numbers; Blizzard format
						data = self:ParseBlizzardTalents(data)
						if data then
							-- parsed? save.
							build.build = data
						else
							--builds[num].build=nil
							data = nil
							self.status = { code = "BLACK", msg = L["status_black_badblizzard"] }
						end
					else
						-- text; text lines format
						data, msg = self:ParseTextTalents(data)
						if data then
							-- parsed? save.
							self:Debug("Parsed")
							build.build = data
						else
							--builds[num].build=nil
							self:Debug("Boo!")
							data = nil
							self.status = { code = "BLACK", msg = L["status_black_brokenbuild"]:format(msg) }
						end
					end
				elseif type(data) == "table" and type(data[1]) == "string" then
					data, msg = self:ParseTableTalents(data)
					if data then
						-- parsed? save.
						self:Debug("Parsed")
						build.build = data
					else
						--builds[num].build=nil
						self:Debug("Boo!")
						data = nil
						self.status = { code = "BLACK", msg = L["status_black_brokenbuild"]:format(msg) }
					end
				end

				if build.glyphs and type(build.glyphs[1]) == "string" then
					local glyphs = {}
					for i, glyph in ipairs(build.glyphs) do
						local name, id = ZGV.Parser.ParseID(glyph)
						table.insert(glyphs, { name, id })
					end
					build.glyphs = glyphs
				end
			end

			if type(data) == "table" and type(data[1]) == "table" then
				-- probably proper format, finally
				self:Debug("Data OK, cool")
				local _, maxcounts = self:CountBuildTalents(nil, data)
				for tab, talents in ipairs(maxcounts) do
					for talent, count in ipairs(talents) do
						local name, _, _, _, realrank, maxrank, available, rank = GetTalentInfo(tab, talent, false)
						if name and maxrank < count then
							self.status =
								{ code = "BLACK", msg = L["status_black_builderror"]:format(count, name, maxrank) }
							break
						end
					end
				end
			end
		end

		self.currentBuild = data
		self.currentBuildGlyphs = build.glyphs
		self.currentBuildTitle = data and build and build.title or nil
	else
		self.status = {}
		self.status_preview = {}
		self.currentBuild = nil
		self.currentBuildTitle = nil
	end

	self.db.char.zta_currentBuildKey = key

	self:UpdateSuggestions()
	self:PlayTalented()

	if not startup and build then
		ZGV.db.char.gear_active_build = build.statweights
		ZGV.db.char.gear_selected_build = build.statweights
		ZGV.ItemScore:DelayedRefreshUserData()
	end

	self:Debug("&_POP")
end

-- returns ranks suggested at num talents used
function ZTA:CountBuildTalents(num, build)
	local counts = {}
	local maxcounts = {}
	local zeroer = {
		__index = function(tab, key)
			return 0
		end,
	}

	if not build then
		build = self.currentBuild
	end
	if num and num > #build then
		num = #build
	end

	if num then
		for i = 1, num do
			local tab, talent = build[i][1], build[i][2]
			if not counts[tab] then
				counts[tab] = {}
				setmetatable(counts[tab], zeroer)
			end
			counts[tab][talent] = counts[tab][talent] + 1
		end
	end
	for i = 1, #build do
		local tab, talent = build[i][1], build[i][2]
		if not maxcounts[tab] then
			maxcounts[tab] = {}
			setmetatable(maxcounts[tab], zeroer)
		end
		maxcounts[tab][talent] = maxcounts[tab][talent] + 1
	end

	return counts, maxcounts
end

function ZTA:SetOption(cmd)
	LibStub("AceConfigCmd-3.0-Z").HandleCommand(self, "zta", "ZygorTalentAdvisor", cmd)
end

function ZTA:OpenOptions()
	ZGV:OpenOptions("zta")
end

function ZTA:GetStatusMessage()
	local status = self.status
	if not status or not status.code then
		return ""
	end

	if status.code == "BLACK" then
		return status.msg
	elseif status.code == "RED" then
		--local _,maxcounts = self:CountBuildTalents(nil,build)
		--local maxcount = maxcounts[tab] and maxcounts[tab][talent] or 0
		if self.db.profile.zta_forcebuild then
			return L["status_red_forced"]
		else
			return L["status_red"]
		end
		-- ? L['status_red_forced']
	elseif status.code == "GREEN" then
		return L["status_green"]
	elseif status.code == "YELLOW" then
		return L["status_yellow"]:format(status.pointsleft - status.missed)
	elseif status.code == "ORANGE" then
		return L["status_orange"]:format(status.missed - status.pointsleft)
	end
end

function ZTA:GetRunesMessage()
	local text = ""
	if ZTA.currentBuildGlyphs then
		C_Engraving.RefreshRunesList()
		local usedrunes = {}
		for i, slot in pairs(ZGV.Inventory.InvSlots) do
			local slotid, _ = GetInventorySlotInfo(slot)
			if slotid then
				local rune = C_Engraving.GetRuneForEquipmentSlot(slotid)
				if rune and rune.learnedAbilitySpellIDs then
					for _, spell in pairs(rune.learnedAbilitySpellIDs) do
						usedrunes[spell] = true
					end
				end
			end
		end

		text = "|n|nSuggested runes:|n"
		for i, v in ipairs(ZTA.currentBuildGlyphs) do
			local known = usedrunes[v[2]] and "- |cff00ff00" or "- |cffff0000"
			text = text .. known .. v[1] .. "|r|n"
		end
	end
	return text
end

function ZTA:DumpTalents()
	local s = ""

	for tab = 1, GetNumTalentTabs(false) do
		s = s .. ("\t--%d. %s:\n"):format(tab, tostring(select(2, GetTalentTabInfo(tab, false))))
		for talent = 1, GetNumTalents(tab, false) do
			local name, _, _, _, realrank, maxrank, available, rank = GetTalentInfo(tab, talent, false)
			if name then
				s = s .. ('\t\t["%s"] = "%d,%d",\n'):format(name, tab, talent)
				--if rank~=realrank then s=s..(" +%d"):format(rank) end
				--s=s.."\n"
			end
		end
	end

	ZGV:ShowDump(s)
end

function ZTA:DumpVal(val, lev, maxlev, nofun)
	if lev > maxlev then
		return "..."
	end
	local s = ""
	if type(val) == "string" then
		s = ('"%s"'):format(val)
	elseif type(val) == "number" then
		s = ("%s"):format(tostring(val))
	elseif type(val) == "function" then
		s = ""
	elseif type(val) == "table" then
		s = "\n"
		for k, v in pairs(val) do
			if k ~= "parentStep" then
				if type(v) ~= "function" then
					s = s .. ("   "):rep(lev) .. ("%s=%s"):format(k, self:DumpVal(v, lev + 1, maxlev, nofun))
				elseif not nofun then
					s = s .. ("   "):rep(lev) .. ("%s(function)\n"):format(k)
				end
			end
		end
	end

	return s .. "\n"
end

function ZTA.ZTA_GameTooltipSetTalent(gametooltip, tab, talent, group, preview)
	-- self == GameTooltip!!
	ZTA.Old_GameTooltipSetTalent(gametooltip, tab, talent, group, preview)
	local build = ZTA.currentBuild
	if build and ZTA.status and ZTA.status.code and ZTA.status.code ~= "BLACK" then
		local counts, maxcounts = ZTA:CountBuildTalents(nil)
		local name, _, _, _, cur_rank = GetTalentInfo(tab, talent)
		local build_rank = tonumber(maxcounts and maxcounts[tab] and maxcounts[tab][talent]) or 0
		local color = ""
		local secondline = ""
		if cur_rank > build_rank then
			-- overshot
			color = "|cffff0000"
			secondline = L["talenttooltip_overshot"]:format(cur_rank - build_rank)
		elseif cur_rank < build_rank then
			-- ok
			color = "|cffffff00"
			secondline = L["talenttooltip_undershot"]:format(build_rank - cur_rank)
		elseif build_rank > 0 then
			color = "|cff00ff00"
			secondline = L["talenttooltip_ok"]:format(cur_rank - build_rank)
		else
			color = "|cffaaaaaa"
			secondline = L["talenttooltip_none"]
		end
		GameTooltip:AddLine(L["talenttooltip"]:format(ZTA.currentBuildTitle, color, build_rank), 1, 1, 1)
		if ZTA:GetUnusedTalentPoints() > 0 then
			GameTooltip:AddLine(secondline, 1, 1, 1)
		end
		GameTooltip:Show()
	end
end

function ZTA:CreateDumpFrame()
	local name = "ZygorTalentAdvisor_DumpFrame"

	local frame = CreateFrame("Frame", name, UIParent, "BackdropTemplate")
	self.dumpFrame = frame
	frame:SetBackdrop({
		bgFile = [[Interface\DialogFrame\UI-DialogBox-Background]],
		edgeFile = [[Interface\DialogFrame\UI-DialogBox-Border]],
		tile = true,
		tileSize = 16,
		edgeSize = 16,
		insets = { left = 3, right = 3, top = 5, bottom = 3 },
	})
	frame:SetBackdropColor(0, 0, 0, 1)
	frame:SetWidth(500)
	frame:SetHeight(400)
	frame:SetPoint("CENTER", UIParent, "CENTER")
	frame:Hide()
	frame:SetFrameStrata("DIALOG")
	tinsert(UISpecialFrames, name)

	local scrollArea = CreateFrame("ScrollFrame", name .. "Scroll", frame, "UIPanelScrollFrameTemplate")
	scrollArea:SetPoint("TOPLEFT", frame, "TOPLEFT", 8, -50)
	scrollArea:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -30, 8)

	local editBox = CreateFrame("EditBox", nil, frame)
	editBox:SetMultiLine(true)
	editBox:SetMaxLetters(99999)
	editBox:EnableMouse(true)
	editBox:SetAutoFocus(false)
	editBox:SetFontObject(ChatFontSmall)
	editBox:SetWidth(400)
	editBox:SetHeight(270)
	editBox:SetScript("OnEscapePressed", function()
		frame:Hide()
	end)
	self.dumpFrame.editBox = editBox

	scrollArea:SetScrollChild(editBox)

	local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
	close:SetPoint("TOPRIGHT", frame, "TOPRIGHT")

	local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
	self.dumpFrame.title = title
	title:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
	title:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -30, -45)
	title:SetJustifyH("CENTER")
	title:SetJustifyV("TOP")
end

function ZTA:Debug(s, ...)
	ZGV:Debug("&TalentAdv " .. s, ...)
end

function ZTA:Print(s, ...)
	ZGV:Print("- Talent Advisor: " .. s, ...)
end

function ZTA:IsBuildSelected()
	if ZGV.db.char.zta_currentBuildKey ~= nil and ZGV.db.char.zta_currentBuildKey ~= 99 then
		return true
	end
end

tinsert(ZGV.startups, {
	"Talent Advisor",
	function(self)
		ZTA:Initialize()
	end,
})
