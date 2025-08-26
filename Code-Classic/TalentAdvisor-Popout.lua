local popout = {}
local _,ZGV=...
local ZTA = ZGV.ZTA
if not ZTA then return end
local L = ZTA.L

function ZTA.Popout_OnShow(self)
	if not ZTA then return end

	UIParentLoadAddOn("Blizzard_TalentUI")
	if ZTA.db.profile.zta_windowdocked then
		if not PlayerTalentFrame:IsShown() then ToggleTalentFrame() end
	end

	ZTA.Popout_Reparent()
	ZTA.Popout_UpdateDocking()
	ZTA.Popout_Update()
	if PlayerTalentFrame.advisorbutton then
		PlayerTalentFrame.advisorbutton:SetButtonState("PUSHED",1)
	end
	--PlaySound("igCharacterInfoTab");
end

function ZTA.Popout_OnHide(self)
	ZTA.Popout_UpdateDocking()
	if PlayerTalentFrame.advisorbutton then
		PlayerTalentFrame.advisorbutton:SetButtonState("NORMAL")
	end
	--PlaySound("igCharacterInfoTab");
end

function ZTA.Popout_OnUpdate(self)
	--if self.needsResizing>0 then self.needsResizing=self.needsResizing-1 end

	if self.needsResizing and self.needsResizing>0 then
		ZTA:Debug("resizing")
		if self.scroll.child.group1:GetTop() and not self.glyphmode then 
			local height = self.scroll.child.group1:GetTop() - self.scroll.child.talents3:GetBottom()
			local maxheight=100
			local minheight=50
			if height>maxheight then height=maxheight end
			if height<minheight then height=minheight end
			self.scroll.child:SetHeight(height)

			local runes = ZTA.currentBuildGlyphs and 50 or 0
			self.scroll:SetPoint("BOTTOMRIGHT",-35,70+runes)

			self:SetHeight(height+145 + runes)
		else
			self.suggestionLabel:SetSize(230,0)
			self:SetHeight(self.suggestionLabel:GetHeight()+100)
		end

		self.runesLabel:SetPoint("BOTTOM",self.configure,"TOP")


		self.needsResizing=self.needsResizing-1
		ZTA.Popout_UpdateDocking()
	end
	if ZTA.popout.moving then
		ZTA.db.profile.zta_windowdocked=ZTA.Popout_InDockingRange()
		ZGV:RefreshOptions()
		ZTA.Popout_UpdateDocking()
	end
end

function ZTA.Popout_OnLoad(self)
	self:RegisterForDrag("LeftButton")

	--ZygorTalentAdvisorPopoutButton:SetNormalTexture(ZGV.DIR.."\\Skins\\popout-button-2")
	--ZygorTalentAdvisorPopoutButton:SetPushedTexture(ZGV.DIR.."\\Skins\\popout-button-2-down")
	--ZygorTalentAdvisorPopoutButton:SetHighlightTexture(ZGV.DIR.."\\Skins\\popout-button-2-hi")
	--[[
	ZygorTalentAdvisorPopoutScroll:SetScript("OnScrollRangeChanged",function(self,xrange,yrange)
		ScrollFrame_OnScrollRangeChanged(self, xrange, yrange)
		print(xrange)
		print(yrange)
		local scrollbar = _G[self:GetName().."ScrollBar"];
		local min,max = scrollbar:GetMinMaxValues()
		if max>0 then
			scrollbar:Show()
		else
			scrollbar:Hide()
		end
		print("scrollrangechanged")
	end)
	--]]
end

function ZTA.Popout_OnDragStart(self)
	ZTA.db.profile.zta_windowdocked = false
	--ZTA.Popout_Reparent()
	ZTA.Popout_UpdateDocking(false)
	self:ClearAllPoints()
	self:StartMoving()
	self.moving=true
	--print("dragstart")
end

function ZTA.Popout_InDockingRange()
	return PlayerTalentFrame and PlayerTalentFrame:IsShown()
	and abs(ZTA.popout:GetLeft()-PlayerTalentFrame:GetRight()+36)<20
	and ZTA.popout:GetTop()-PlayerTalentFrame:GetTop()<20
	and ZTA.popout:GetTop()-PlayerTalentFrame:GetTop()>-200
end

function ZTA.Popout_OnDragStop(self)
	--print("dragstop")
	self:StopMovingOrSizing()
	self.moving=nil
	--	((self:GetLeft()>TalentFrame:GetLeft() and self:GetLeft()-TalentFrame:GetRight()+42<20 and abs(self:GetTop()-TalentFrame:GetTop()+10)<20 then
	if ZTA.Popout_InDockingRange() then
		ZTA.db.profile.zta_windowdocked = true
	else
		ZTA.db.profile.zta_windowdocked = false
	end
	ZGV:RefreshOptions()
	ZTA.Popout_Reparent()
	ZTA.Popout_UpdateDocking()
end

function ZTA.Popout_Update()
	ZTA:Debug("ZGV.ZTA.Popout_Update")
	local self=ZygorTalentAdvisorPopout

	if not self:IsShown() then
		ZTA:Debug("ZygorTalentAdvisorPopout hidden, not updating")
		return
	end

	-- Prepare basic data: are we handling glyphs? are we viewing the pet?
	
	local s = ""

	self.buildLabel:SetText(L['window_header_buildlabel'])  -- "Build: "


	-- Obtain suggestion status code

	local code = ZTA.status.code


	-- Use the code (no matter what we're handling).

	if code=="GREEN" then
		self.warning:Show()
		self.warning:GetRegions():SetVertexColor(0,1,1)
	elseif code=="YELLOW" then
		self.warning:Show()
		self.warning:GetRegions():SetVertexColor(0.8,1,1)
	elseif code=="ORANGE" then
		self.warning:Show()
		self.warning:GetRegions():SetVertexColor(1,0.6,0)
	elseif code=="RED" then
		self.warning:Show()
		self.warning:GetRegions():SetVertexColor(1,0,0)
	elseif code=="BLACK" then
		self.warning:Show()
		self.warning:GetRegions():SetVertexColor(1,0,0)
	else
		self.warning:Hide()
	end


	local tabn = 1
	if not (ZTA.currentBuild and ZTA.currentBuild[1]) then
		s=L['error_bulklearn_nobuild']
		self.build:SetText(L['window_header_buildnone'])
		self.suggestionLabel:SetText(L['window_suggestion_nobuild'])
		self.scroll:Hide()
		self.preview:Hide()
		self.accept:Hide()
		--if ZTA.status.code then self.warning:Show() else self.warning:Hide() end
	else
		self.build:SetText(L['window_header_build']:format(ZTA.currentBuildTitle or "unknown"))
		self.preview:Hide()

			-- Suggestion for: TALENTS

			local text = ""

			if ZTA:GetUnusedTalentPoints()==0 then
				text = L['window_suggestion_nopoints']
				self.scroll:Hide()
				--self.preview:Hide()
				self.accept:Hide()
			elseif not ZTA.suggestion or #ZTA.suggestion==0 then
				if ZTA.status.code=="BLACK" then
					text = ZTA.status.msg
				elseif ZTA.status.code=="RED" then
					text = L['window_suggestion_none']
				else
					text = "Why are there no suggestions..?"
				end
				self.scroll:Hide()
				--self.preview:Hide()
				self.accept:Hide()
			else
				text = L['window_suggestion_normal']

				local sugformatted = ZTA:GetSuggestionFormatted()
				
				self.sugheight = 0
				for tab,talents in pairs(sugformatted) do
					self.scroll.child['group'..tabn]:SetText(tab)
					s = ""
					for n,levels in ipairs(talents) do
						talent = "|T"..levels.tex..":0:0:0:0|t "..levels.name
						if #s>0 then s=s.."\n" end
						if levels[1]==0 then
							s=s..talent
						else
							s=s..talent.." |cff997700("
							if #levels<3 then s=s..table.concat(levels,",") else s=s..levels[1].."-"..levels[#levels] end
							s=s..")|r"
						end
					end
					self.scroll.child['talents'..tabn]:SetText(s)
					tabn=tabn+1
					if tabn>3 then break end
				end

				self.accept:Show()
				self.accept:SetText(LEARN)

				--[[
				if GetCVarBool("previewTalents")
				and (
					GetUnspentTalentPoints(false,pet)-GetGroupPreviewTalentPointsSpent(pet)>0
				     or ZTA.status_preview.code~=ZTA.status.code
				     or tonumber(ZTA.status_preview.missed)>tonumber(ZTA.status.missed)
				    ) then
					self.preview:SetText(L['preview_button'])
					self.preview:Enable()
				else
					self.preview:SetText(L['preview_button_done'])
					self.preview:Disable()
				end
				self.preview:SetText(L['preview_button'])
				--]]


				self.scroll:Show()
			end

			self.runesLabel:SetText(ZTA:GetRunesMessage())
			self.suggestionLabel:SetText(text)


	end
	while tabn<=3 do
		self.scroll.child['group'..tabn]:SetText("")
		self.scroll.child['group'..tabn]:SetHeight(0)
		self.scroll.child['talents'..tabn]:SetText("")
		self.scroll.child['talents'..tabn]:SetHeight(0)
		tabn=tabn+1
	end

	self.configure:SetText(L['configure_button'])
	self.needsResizing=2
end

function ZTA.Popout_Hook()
	ZTA.Popout_UpdateDocking()
end

function ZTA.Popout_UpdateDocking()
	local self=ZygorTalentAdvisorPopout

	if PlayerTalentFrame.advisorbutton then
		if ZTA.db.profile.zta_windowdocked and self:IsShown() then
			--PlayerSpecTab1:SetPoint("TOPLEFT",TalentFrame,"TOPRIGHT",ZygorTalentAdvisorPopout:GetWidth()-8,-36)
			PlayerTalentFrame.advisorbutton:SetParent(ZTA.popout)
			PlayerTalentFrame.advisorbutton:SetPoint("TOPLEFT",ZTA.popout,"TOPRIGHT",-5,-10)
		else
			--PlayerSpecTab1:SetPoint("TOPLEFT",TalentFrame,"TOPRIGHT",0,-36)
			PlayerTalentFrame.advisorbutton:SetParent(PlayerTalentFrame)
			PlayerTalentFrame.advisorbutton:SetPoint("TOPLEFT",PlayerTalentFrame,"TOPRIGHT",-35,-140)
		end
	end

	if ZTA.db.profile.zta_windowdocked then
		self.TopRight:SetTexture(ZGV.DIR.."\\Skins\\popout-noclose")
		self.TopRight:SetTexCoord(0,1,0,1)
		self.CloseButton:Hide()
	else
		self.TopRight:SetTexture([[Interface\PaperDollInfoFrame\UI-GearManager-Border]])
		self.TopRight:SetTexCoord(0.625,0.75,0,1)
		self.CloseButton:Show()
	end
end

function ZTA.Popout_Reparent()
	local self=ZygorTalentAdvisorPopout
	if ZTA.db.profile.zta_windowdocked then
		self:SetParent(PlayerTalentFrame)
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT",PlayerTalentFrame,"TOPRIGHT",-36,-130)
	else
		self:SetParent(UIParent)
	end
end

function ZTA.Popout_Popout()
	UIParentLoadAddOn("Blizzard_TalentUI")
	if not PlayerTalentFrame:IsShown() and ZGV.db.profile.zta_windowdocked then
		ShowUIPanel(PlayerTalentFrame)
	end
	ZygorTalentAdvisorPopout:Show()
end