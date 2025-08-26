local name,ZGV = ...

local GetSpellInfo = ZGV.Retrofit.C_Spell.GetSpellInfo
local GetSpellCooldown = ZGV.Retrofit.C_Spell.GetSpellCooldown

-- GLOBAL BINDING_HEADER_ZYGORGUIDESACTIONBAR

local ActionBar = {
	Buttons = {},
	KeyboundButtons = {},
}

ZGV.ActionBar = ActionBar

local CHAIN = ZGV.ChainCall
local L = ZGV.L
local ui = ZGV.UI
local SkinData = ui.SkinData

local BUTTON_SIZE = 30
local BAR_HEIGHT = BUTTON_SIZE+10

local GetSpellCooldown = C_Spell.GetSpellCooldown or GetSpellCooldown

local function OnEvent(self, event)
	if not ZGV.db.profile.enable_actionbuttons then return end -- disabled
	if not ZGV.ActionBar or not ZGV.ActionBar.Frame then return end -- we are too early
	if not ZGV.CurrentStep then return end -- we will retry on step focus
	if event=="BAG_UPDATE_DELAYED" and not ZGV.db.profile.actionbar_trash then return end -- trasher is disabled, we do not care about bag changes
	if event=="PLAYER_REGEN_DISABLED" then ActionBar.Lockdown = true end
	if event=="PLAYER_REGEN_ENABLED" then ActionBar.Lockdown = false end
		
	if event=="ZGV_STARTED_SKIPPING" then 
		ActionBar:ClearBar("forcehide")
		return
	end
	
	if event~="ZGV_STOPPED_SKIPPING" and ZGV.skipping then return end

	-- only events registered here are for updating action bar, so no need to handle them separately
	ActionBar:SetActionButtons()
end

local function DragStart(self)
	if InCombatLockdown() or ActionBar.Lockdown then return false end

	local objtype = self:GetAttribute("type")
	local object = self:GetAttribute(objtype)
	if objtype == 'item' then
		C_Item.PickupItem(object)
	elseif objtype == 'macro' then
		PickupMacro(object)
	elseif objtype == 'petaction' then
		PickupPetAction(object)
	elseif objtype == 'spell' then
		PickupSpell(object)
	end
end

function ActionBar:Initialise()
	ActionBar:CreateFrame()

	-- create globals for blizzard keybind menu
	for i=1,5 do
		_G[("BINDING_NAME_CLICK ZygorAB%d:LeftButton"):format(i)] = ("Zygor ActionBar Button %d"):format(i)
	end
	BINDING_HEADER_ZYGORGUIDESACTIONBAR = "Zygor Guides Viewer Action Bar"
	ZGV:AddMessageHandler("ZGV_STEP_CHANGED",OnEvent)
	ZGV:AddMessageHandler("ZGV_STARTED_SKIPPING",OnEvent)
	ZGV:AddMessageHandler("ZGV_STOPPED_SKIPPING",OnEvent)

	ZGV:AddMessageHandler("ZGV_NPC_TRANSLATED",OnEvent)
	ZGV:AddEventHandler("PLAYER_REGEN_ENABLED",OnEvent)
	ZGV:AddEventHandler("PLAYER_REGEN_DISABLED",OnEvent)
	if ZGV.IsRetail then ZGV:AddEventHandler("UPDATE_VEHICLE_ACTIONBAR",OnEvent) end
	ZGV:AddEventHandler("BAG_UPDATE_DELAYED",OnEvent)

	local function poolinit(frame)
		frame:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
		frame:SetParent(ActionBar.Frame)
		frame:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		frame:RegisterForClicks("AnyUp","AnyDown")
		if not ZGV.IsRetail then
			frame:RegisterForClicks("AnyUp")
		end
		frame:RegisterForDrag("LeftButton")
		frame:SetScript("OnDragStart", DragStart)
	end

	local function pooloverlayinit(frame)
		frame:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
		frame:SetHighlightTexture("Interface/Buttons/ButtonHilight-Square")
		frame:SetParent(ActionBar.Frame)
		frame:SetSize(BUTTON_SIZE,BUTTON_SIZE)
		frame:SetMouseClickEnabled(false)
		frame:SetScript("OnEvent", frame.UpdateCooldown)
		frame:RegisterEvent("ACTIONBAR_UPDATE_COOLDOWN")
	end

	local function poolresetter(pool,frame)
		frame:SetAttribute("type",nil)
		frame:SetAttribute("macro",nil)
		frame:SetAttribute("item",nil)
		frame:SetAttribute("itemid",nil)
		frame:SetAttribute("spell",nil)
		frame:SetAttribute("spellid",nil)
		frame:SetAttribute("petaction",nil)
		frame:SetAttribute("petid",nil)
		frame:Hide()
		frame:ClearAllPoints()
	end

	local function pooloverlayresetter(pool,frame)
		frame.icon:SetTexture(nil)
		frame.button=nil
		frame.tooltip=nil
		frame:Hide()
		frame:ClearAllPoints()
	end
	
	ActionBar.ButtonPool = CreateFramePool("BUTTON",nil,"ZygorActionButton",poolresetter,nil,poolinit)
	ActionBar.ButtonOverlayPool = CreateFramePool("BUTTON",ActionBar.Frame,"ZygorActionButtonOverlay",pooloverlayresetter,nil,pooloverlayinit)

	for i=1,5 do 
		local button = CreateFrame("BUTTON","ZygorAB"..i,nil,"ZygorActionButton")
		poolinit(button)
		ActionBar.KeyboundButtons[i] = button
	end
	
	ActionBar.PoolInit = poolinit
	ActionBar.PoolOverlayInit = pooloverlayinit
	ActionBar.PoolResetter = poolresetter

	local numAccountMacros, numCharacterMacros = GetNumMacros();
	for i = 0 + numAccountMacros, 1, -1 do
		local name, icon, body = GetMacroInfo(i)
		if name and name:match("^ZygorAction[0-9]+$") then
			DeleteMacro(i)
		end
	end

	for i = 120 + numCharacterMacros, 121, -1 do
		local name, icon, body = GetMacroInfo(i)
		if name and name:match("^ZygorAction[0-9]+$") then
			DeleteMacro(i)
		end
	end
end

function ActionBar:SetActionButtons()
	if ActionBar.SetTimer then ZGV:CancelTimer(ActionBar.SetTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.SetTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	if ActionBar.SetTimer then ZGV:CancelTimer(ActionBar.SetTimer) end
	ActionBar.SetTimer = ZGV:ScheduleTimer(function() 
		ActionBar:SetActionButtonsQueued()
	end, 0)
end

function ActionBar:SetActionButtonsQueued()
	if not ZGV.CurrentStep then 
		ZGV.ActionBar:ClearBar()
		ActionBar:ReanchorButtons() 
		return 
	end

	ActionBar:ClearBar()

	-- current step
	local actions = {}
	local actions_npc = {}

	local goals = {}
	
	for gi,goal in ipairs(ZGV.CurrentStep.goals) do
		tinsert(goals,goal)
	--	print(goals[1])
	--	print(goals[2])
	end
	for si,step in ipairs(ZGV:GetStickiesAt(ZGV.CurrentStep.num)) do
		if not step:IsComplete() then
			for gi,goal in ipairs(step.goals) do tinsert(goals,goal) end
		end
	end

	for gi,goal in ipairs(goals) do
		if goal:IsVisible() then
			if goal.castspell and goal.castspellid and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"spell",goal.castspellid})
			elseif goal.castspell and goal.extraaction  and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"extraaction",goal.extraaction})
			elseif (goal.item or goal.itemid) and (goal.action=="use" or goal.action=="useany") and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"item",goal.itemid or goal.item})
			elseif goal.script and goal.script:find("DoEmote")  and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"emote",goal.script})
			elseif goal.script and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"script",goal.script})
			elseif goal.macrosrc and ZGV.db.profile.actionbar_quest then
				table.insert(actions,{"macro",goal.macrosrc})
			elseif goal.petaction and ZGV.db.profile.actionbar_quest then
				local num,name,tex = ZGV.FindPetActionInfo(goal)
				if num and name then
					table.insert(actions,{"petaction",{num,name,tex}})
				end
			elseif goal.action=="equipped" and goal.targetid then
				table.insert(actions,{"equip",goal.targetid})
			elseif goal.action=="talk" and goal.npcid and ZGV.db.profile.actionbar_talk then
				table.insert(actions_npc,{"talk",goal.useid or goal.npcid,goal.usename or goal.npc})
			elseif goal.action=="clicknpc" and goal.npcid and ZGV.db.profile.actionbar_talk then
				table.insert(actions_npc,{"clicknpc",goal.useid or goal.npcid,goal.usename or goal.npc})
			elseif goal.action=="kill" and (goal.targetid or goal.targets) and ZGV.db.profile.actionbar_kill then
				if goal.targets then
					for _,target in ipairs(goal.targets) do
						table.insert(actions_npc,{"kill",target[2],target[1],sticky=goal.parentStep:IsCurrentlySticky()})
					end
				else
					table.insert(actions_npc,{"kill",goal.useid or goal.targetid,goal.usename or goal.target,sticky=goal.parentStep:IsCurrentlySticky()})
				end
			elseif goal.action=="openskill" and goal.tradeskill then
				table.insert(actions,{"openskill",goal})
			elseif goal.action=="create" and goal.spellid then
				table.insert(actions,{"create",goal})
			end
		end -- if goal visible
	end -- for goal in step

	local counter = 0
	for _,data in ipairs(actions) do 
		counter = counter + 1
		ZGV.ActionBar:SetButton(data[1],data[2],data[3],counter) 
	end
	for _,data in ipairs(actions_npc) do 
		counter = counter + 1
		ZGV.ActionBar:SetButton(data[1],data[2],data[3],counter,data.sticky) 
	end


	ActionBar.TrashButton = nil
	if ZGV.db.profile.actionbar_trash then
		counter = counter + 1
		ActionBar.TrashButton = ZGV.ActionBar:SetButton("trash",{},nil,counter)
	end
	ActionBar:ReanchorButtons()end


function ActionBar:ShowTooltip()
	if ActionBar.Active then return end

	GameTooltip:SetOwner(ActionBar.Frame,"ANCHOR_BOTTOMLEFT")
	GameTooltip:SetText("Zygor Action Bar")
	GameTooltip:Show()

end

function ActionBar:CreateFrame() 
	if not ActionBar.Frame then
		ActionBar.Frame = CHAIN(ui:Create("Frame", UIParent, "ZygorGuidesViewer_ActionBar","BackdropTemplate,SecureHandlerStateTemplate"))
			:SetSize(BAR_HEIGHT,BAR_HEIGHT)
			:SetFrameStrata("LOW")
			:SetFrameLevel(10)
			:CanDrag(true)
			:SetScript("OnEnter", function()
				ActionBar:ShowTooltip()
				end
			)
			:SetScript("OnLeave", function()
				GameTooltip:Hide()
				end
			)
			:SetScript("OnDragStop", function(self)
				self:StopMovingOrSizing()
				if self.snapped then
					self:ClearAllPoints()
					--self:SetPoint("BOTTOMLEFT",ZGV.Frame,"TOPLEFT",0,10)
				else
					ZGV.F.SaveFrameAnchor(self,"actionbar_anchor")
				end
			end)
			:SetScript("OnMouseDown", function(self)
				-- store mouse-on-frame location, to take over dragging position
				local ssc=self:GetEffectiveScale()
				local l,b=self:GetLeft()*ssc,self:GetBottom()*ssc
				local cx,cy = GetCursorPosition()
				self.drag_offset_x,self.drag_offset_y = cx-l,cy-b
			end)
			:SetScript("OnUpdate",ActionBar.Frame_OnUpdate)
			:SetScript("OnSizeChanged",function() if not ZGV.db.profile.actionbar_anchor then ActionBar:SnapToZGVFrame(true) end end)
			:SetAttribute("_onstate-combathide", "if newstate == 'show' then self:Show(); else self:Hide(); end")
			:Hide()
		.__END
		ActionBar.Frame.close = CHAIN(CreateFrame("Button",nil,ActionBar.Frame,"ZGV_DefaultSkin_TitleButton_Template"))
			:SetPoint("TOPRIGHT",ActionBar.Frame,"TOPRIGHT", -5, -4)
			:SetScript("OnClick", function() 
				ZGV.db.profile.enable_actionbar = false
				ActionBar:ToggleFrame()
			 end)
			.__END
		ActionBar.Frame.close.buttonkey = "CLOSE"
		ActionBar.Frame.close:ApplySkin()

		ActionBar.Frame.Overlay = CHAIN(ui:Create("Frame", ActionBar.Frame))
			:SetAllPoints()
			:SetAlpha(1)
			:SetFrameLevel(15)
			:EnableMouse(true)
			:Hide()
		.__END

		if ZGV.db.profile.actionbar_anchor then
			ZGV.F.SetFrameAnchor(ActionBar.Frame,ZGV.db.profile.actionbar_anchor)
		end
	end

	ZGV:AddMessageHandler("SKIN_UPDATED",ActionBar.ApplySkin)
	ActionBar:SetCombatHiding()
	if not (InCombatLockdown() or ActionBar.Lockdown) then ActionBar.Frame:Hide() end

	ActionBar:ApplySkin()
end

function ActionBar:ShowDisabledOverlay()
	ActionBar.Frame.Overlay:Show()
end

local SNAP_Y=5
function ActionBar.Frame_OnUpdate(self)
	if self:IsDragging() then
		local ssc=self:GetEffectiveScale()
		local x,y = GetCursorPosition()
		local l,b=x-self.drag_offset_x,y-self.drag_offset_y
		local zsc=ZGV.Frame:GetEffectiveScale()
		local zl,zt=ZGV.Frame:GetLeft()*zsc,ZGV.Frame:GetTop()*zsc
		if (math.abs(zl-l)<10 and math.abs((zt+SNAP_Y)-b)<10) then
			self.snapped=true
			ZGV.db.profile.actionbar_anchor=nil
			ActionBar:SnapToZGVFrame(true)
			--ZGV.Anchors:Save(self,"actionbar_anchor")
		else
			self.snapped=false
			self:ClearAllPoints()
			self:SetPoint("BOTTOMLEFT",self:GetParent(),"BOTTOMLEFT",l/ssc,b/ssc)
		end
		--[[
		local width = self:GetWidth()
		local x,y = minimap:GetCenter()
		local sc = minimap:GetEffectiveScale()
		local mx,my = GetCursorPosition() --self:GetCenter()
		mx=mx/sc  my=my/sc
		local dx,dy=mx-x,my-y
		local dist = (dx*dx+dy*dy)^0.5

		local radmin=radius
		local radsnap=radius+width*0.2
		local radpull=radius+width*0.7
		local radfre=radius+width

		local radclamp
		if dist<=radsnap then self.snapped=true radclamp=radmin
		elseif dist<radpull and self.snapped then radclamp=radmin
		elseif dist<radfre and self.snapped then radclamp=radmin+(dist-radpull)/2
		else self.snapped=false -- dobby is freeee
		end
		
		if radclamp then
			dx=dx/(dist/radclamp)
			dy=dy/(dist/radclamp)
		end
		--]]
	else
		-- position it where it needs to be, but without anchoring
		if not ZGV.db.profile.actionbar_anchor then
			ActionBar:SnapToZGVFrame()
		end
	end
end

local old_x,old_y
function ActionBar:SnapToZGVFrame(force)
	if ActionBar.SnapTimer then ZGV:CancelTimer(ActionBar.SnapTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.SnapTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SnapToZGVFrame(force)
		end, 1)
		return
	end

	local x,y = ZGV.Frame:GetLeft()*ZGV.Frame:GetEffectiveScale(),ZGV.Frame:GetTop()*ZGV.Frame:GetEffectiveScale()
	if force or x~=old_x or y~=old_y then
		old_x,old_y=x,y
		self.Frame:ClearAllPoints()
		self.Frame:SetPoint("BOTTOMLEFT",UIParent,"BOTTOMLEFT",(x/self.Frame:GetEffectiveScale()),(y+SNAP_Y)/self.Frame:GetEffectiveScale())
	end
end


function ActionBar:ApplySkin()
	local MF = ActionBar.Frame
	if not MF then return end

	ZGV.ButtonSets.TitleButtons.CLOSE:AssignToButton(MF.close)

	local function set_alpha(new_a,r,g,b,a) return r,g,b,new_a*a end
	local OPACITY = SkinData("UseOpacity") and ZGV.db.profile.opacity or  1

	MF:SetBackdrop(SkinData("ActionBarBackdrop"))
	MF:SetBackdropColor(set_alpha(OPACITY,unpack(SkinData("ActionBarBackdropColor"))))
	MF:SetBackdropBorderColor(set_alpha(OPACITY,unpack(SkinData("ActionBarBackdropBorderColor"))))

	ActionBar:SetAlpha()
	ActionBar:SetScale() 
end

function ActionBar:ToggleFrame()
	if not ActionBar.Frame then
		ActionBar:CreateFrame()
	end

	if ActionBar.ToggleTimer then ZGV:CancelTimer(ActionBar.ToggleTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.ToggleTimer = ZGV:ScheduleTimer(function() 
			ActionBar:ToggleFrame()
		end, 1)
		return
	end
	
	if ZGV.db.profile.enable_actionbar and ZGV.db.profile.enable_actionbuttons and ZGV.db.profile.enable_viewer then
		ActionBar.Frame:Show()
		ActionBar:SetActionButtons()
	else
		ActionBar.Frame:Hide()
	end
		
end

function ActionBar:SetButton(btype,object,fallbackname,counter,sticky) 
	if not ZGV.db.profile.enable_actionbuttons then return end
	
	if btype and not object then ZGV:Debug("ActionButton must have data defined if type is set") return end

	local button,freshbutton
	if counter>5 then
		button,freshbutton = ActionBar.ButtonPool:Acquire()
		if not ZGV.IsRetail and freshbutton then ActionBar.PoolInit(button) end -- classic does not have custom creationFunc yet, need to call it by hand
	else
		button = ActionBar.KeyboundButtons[counter]
	end

	local macro_text,macro_text_right,shift_macro_text, shift_macro_text_right = "","","","" 
	local macro_name,macro_tooltip
	local zygor_texture_key,zygor_tooltip_func, zygor_texture, _

	local macro_texture = 134327

	-- set data based on type

	if btype=="item" then 
		macro_name,_,_,_,_,_,_,_,_,macro_texture = ZGV:GetItemInfo(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/use item:"..object
		button:SetAttribute("itemid",object)
	elseif btype=="equip" then 
		macro_name,_,_,_,_,_,_,_,_,macro_texture = ZGV:GetItemInfo(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/equip item:"..object
		button:SetAttribute("itemid",object)	
	elseif btype=="spell" then
		local spellData = GetSpellInfo(object)
		macro_name,macro_texture = spellData.name, spellData.iconID
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..macro_name
		button:SetAttribute("spellid",object)
	elseif btype=="extraaction" then
		local spellData = GetSpellInfo(object)
		macro_name,macro_texture = spellData.name, spellData.iconID
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/click ExtraActionButton1"
		button:SetAttribute("spellid",object)
	elseif btype=="petaction" then
		local num
		num,macro_name,macro_texture = unpack(object)
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..macro_name
		button:SetAttribute("petaction",num)
		button:SetAttribute("petid",num)
	elseif btype=="emote" then
		if type(object)=="number" then 
			macro_text = GetMacroBody(object)
			_,macro_texture = GetMacroInfo(object)
		else
			macro_text = "/run "..object
		end
		--_,macro_texture = GetMacroInfo(object)
		zygor_texture_key = "EMOTE"
		macro_tooltip = macro_text:match("\"(.*)\"") -- /run DoEmote("blah") -> blah
	elseif btype=="script" then
		macro_text = "/run "..object
		macro_tooltip = object
		zygor_texture_key = "SCRIPT"
	elseif btype=="macro" then
		macro_text = object
		macro_tooltip = object
		zygor_texture_key = "SCRIPT"
	elseif btype=="zygor" then
		button:SetAttribute("zygor","zygor")
	elseif btype=="talk" then
		local name = ZGV.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_talk to"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV:MCM(4)\n/cleartarget\n/target "..name.."\n/run ZGV:MRM()"
		zygor_texture_key = "TALK"
	elseif btype=="clicknpc" then
		local name = ZGV.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_clicknpc"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV:MCM(4)\n/cleartarget\n/target "..name.."\n/run ZGV:MRM(6)"
		zygor_texture_key = "TALK"
	elseif btype=="kill" then
		local name = ZGV.Localizers:GetTranslatedNPC(object,fallbackname)
		macro_name = L["stepgoal_kill"]:format(name)
		macro_tooltip = macro_name
		macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV:MCM(8)\n/cleartarget\n/target "..name.."\n/run ZGV:MRM("..(sticky and 7 or "")..")\n/cleartarget [dead]"
		zygor_texture_key = "KILL"
	elseif btype=="openskill" then
		local skilldata = ZGV.Professions:GetSkillDataByName(object.tradeskill)
		if skilldata.skill then
			local name = ZGV.Professions.LocaleSkills[object.tradeskill]
			macro_name = "Open "..name.." tradeskill"
			if ZGV.IsRetail then
				macro_texture = C_TradeSkillUI.GetTradeSkillTexture(skilldata.skill)
				macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run C_TradeSkillUI.OpenTradeSkill("..skilldata.parent..")"
			else
				macro_texture = skilldata.icon
				macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/cast "..name

			end
		end
		macro_tooltip = macro_name

	elseif btype=="trash" then
		zygor_texture_key = "TRASH"
		local items = ZGV.Inventory:GetGrayTrashDetails()
		local item = items and items[1]
		if item then
			local _, _, itemName, _, count, price, _ = unpack(item)
			object = item -- store, so that we have data to pass to destroy function
			--macro_name = itemID
			macro_tooltip = L["actionbar_trash"]:format(count,itemName,ZGV.GetMoneyString(price))
			macro_name = macro_tooltip
			if #items>1 then
				macro_tooltip = macro_tooltip .. L["actionbar_trash_more_header"]
				for i=2,#items do
					macro_tooltip = macro_tooltip .. L["actionbar_trash_more"]:format(items[i][5],items[i][3],ZGV.GetMoneyString(items[i][6]))
				end
			end
			shift_macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV.Inventory:HandleTrashMacro()"
			macro_text_right = shift_macro_text
		else
			--macro_texture = 1505955
			macro_tooltip = L["actionbar_trash_nothing"]
		end
	elseif btype=="create" then
		ActionBar.creategoal = object.num
		local spellData = GetSpellInfo(object.spellid)
		macro_name = spellData.name
		if  (ZGV.Professions:GetRecipe(object.spellid)) then
			macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV.ActionBar:CreateGoaltype("..ActionBar.creategoal..")"
			local product =  (ZGV.Professions:GetRecipe(object.spellid)).productid
			local  _,_,_,_,_,_,_,_,_,ptexture = ZGV:GetItemInfo(product)
			if ptexture then
				macro_texture = ptexture
			elseif spellData then
				macro_texture = spellData.iconID
			else
				zygor_texture_key = "SCRIPT"
			end
		else
			zygor_texture_key = "SCRIPT"
			macro_text = (macro_name and "#showtooltip "..macro_name.."\n" or "").."/run ZGV.ActionBar:CreateGoaltype("..ActionBar.creategoal..")"
		end
		macro_tooltip = L["stepgoal_create"] :format(macro_name)
	end

	if InCombatLockdown() or ActionBar.Lockdown then -- just in case we got into combat state while function was running
		ActionBar.SetTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	button:SetAttribute("type","macro")
	button:SetAttribute("macrotext1",macro_text)
	button:SetAttribute("macrotext2",macro_text_right)
	button:SetAttribute("shift-macrotext1",shift_macro_text)
	button:SetAttribute("shift-macrotext2",shift_macro_text_right)

	local overlay,freshoverlay = ActionBar.ButtonOverlayPool:Acquire()
	if not ZGV.IsRetail and freshoverlay then ActionBar.PoolOverlayInit(overlay) end -- classic does not have creationFunc yet, need to call it by hand
	overlay:Setup(button,zygor_texture_key,macro_tooltip,btype,macro_texture,object)

	table.insert(ActionBar.Buttons,button)

	return button
end

function ActionBar:CreateGoaltype(goal)
	ZGV:PerformTradeSkillGoal(ZGV.CurrentStep.goals[goal])
end

function ActionBar:ClearBar(forcehide) 
	if not ActionBar.Frame then return end
	if ActionBar.ClearTimer then ZGV:CancelTimer(ActionBar.ClearTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.ClearTimer = ZGV:ScheduleTimer(function() 
			ActionBar:ClearBar(forcehide)
		end, 1)
		return
	end

	
	if ZGV.db.profile.enable_actionbar then ActionBar.Frame.Overlay:Show() end

	table.wipe(ActionBar.Buttons)
	for _,button in ipairs(ActionBar.KeyboundButtons) do ActionBar.PoolResetter(nil,button) end
	ActionBar.ButtonPool:ReleaseAll()
	ActionBar.ButtonOverlayPool:ReleaseAll()

	if forcehide or not ZGV.db.profile.enable_actionbar then
		ActionBar.Frame:Hide()
	end
end

function ActionBar:ReanchorButtons(force) 
	if ActionBar.SetTimer then ZGV:CancelTimer(ActionBar.SetTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then
		ActionBar.SetTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SetActionButtons()
		end, 1)
		return
	end

	if not ActionBar.Frame then return end
	if not ZGV.db.profile.enable_viewer then ActionBar.Frame.Overlay:Hide() ActionBar.Frame:Hide() return end -- viewer is hidden, go away
	if not ZGV.db.profile.enable_actionbuttons and not force then return end -- everything is disabled, abort
	if not ZGV.db.profile.enable_actionbar and not force then return end -- we are not showing buttons, only updating macros. bail out

	local previous = false
	local space = 5
	local width = space
	local active = false
	ActionBar.Frame:Show()
	ActionBar.Frame:SetAlpha(0.01)

	for _,button in ipairs(ActionBar.Buttons) do
		button:ClearAllPoints()
	end

	for _,button in ipairs(ActionBar.Buttons) do
		if not previous then
			button:SetPoint("TOPLEFT",ActionBar.Frame,"TOPLEFT",space,-space)
		else
			button:SetPoint("TOPLEFT",previous,"TOPRIGHT",space,0)
		end
		width = width + button:GetWidth() + space
		previous = button
		active = true
		button:Show()
	end

	ActionBar.Active = active

	ActionBar.Frame:SetWidth(width+25)
	
	ActionBar.Frame.Overlay:Hide()

	if force=="off" then 
		ActionBar.Frame:Hide()
		return 
	elseif active or force=="on" then 
		ActionBar.Frame:SetAlpha(1)
		ActionBar.Frame:Show()
	-- -- actionbar_hide_useless variant
	--elseif ZGV.db.profile.actionbar_hide_useless then
	--	ActionBar.Frame:Hide()
	--else 
	--	ActionBar.Frame:Show()
	else 
		ActionBar.Frame:Hide()
	end
end

function ActionBar:SetCombatHiding(mode)
	local mode = ZGV.db.profile.hideincombat and ZGV.db.profile.hidebarincombat

	for _,button in pairs(ActionBar.Buttons) do
		if button.SetCombatHiding then
			button:SetCombatHiding(mode)
		end
	end

	if mode then
		RegisterAttributeDriver(self.Frame, "state-combathide", "[combat] hide; show");
	else
		UnregisterAttributeDriver(self.Frame, "state-combathide");
	end
end

function ActionBar:SetScale() 
	if ActionBar.ScaleTimer then ZGV:CancelTimer(ActionBar.ScaleTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.ScaleTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SetScale()
		end, 1)
		return
	end
	ActionBar.Frame:SetScale(ZGV.db.profile.actionbar_scale)
end

function ActionBar:SetAlpha(value) 
	if ActionBar.OpacityTimer then ZGV:CancelTimer(ActionBar.OpacityTimer) end
	if InCombatLockdown() or ActionBar.Lockdown then 
		ActionBar.OpacityTimer = ZGV:ScheduleTimer(function() 
			ActionBar:SetAlpha()
		end, 1)
		return
	end
	ActionBar.Frame:SetAlpha(value or ZGV.db.profile.opacitymain)
end

function ActionBar:TutorialPreview(mode) 
	local button = ActionBar.Buttons[1]

	if ActionBar.Frame:IsVisible() and (button and not button:GetAttribute("zygor")) then return end -- there is a non-faked button visible, do not hide/show anything


	if mode=="on" then
		if not (button and button:GetAttribute("type")) then -- there is no button visible, make a fake one
			button = ActionBar:SetButton("macro","")
			button:SetAttribute("zygor","zygor")
		end
		ActionBar:ReanchorButtons("on")
	else
		if button then button:SetAttribute("type",nil) end -- clear whatever is visible
		ActionBar:ReanchorButtons(not ZGV.db.profile.enable_actionbar and "off")
	end
end

tinsert(ZGV.startups,{"ActionBar startup",function(self)
	ActionBar:Initialise()
end})

ZygorActionButtonOverlay_Mixin = {}
function ZygorActionButtonOverlay_Mixin:OnEnter()
	if self.tooltipDisabled then return end
	if not self.button then return end

	local top = self.button:GetTop()
	local screenh = UIParent:GetHeight()
	if top>screenh/2 then
		GameTooltip:SetOwner(self,"ANCHOR_BOTTOM")
	else
		GameTooltip:SetOwner(self,"ANCHOR_TOP")
	end
	
	local button = self.button

	if button:GetAttribute("itemid") then
		local itemid = button:GetAttribute("itemid")
		local link = "item:"..itemid
		if not link then return end
		GameTooltip:SetHyperlink(link)
	elseif button:GetAttribute("spellid") then
		GameTooltip:SetSpellByID(button:GetAttribute("spellid"))
	elseif button:GetAttribute("petid") then
		GameTooltip:SetPetAction(button:GetAttribute("petid"))
	elseif self.tooltip then
		GameTooltip:SetText(self.tooltip)
	end

	GameTooltip:Show()
end
function ZygorActionButtonOverlay_Mixin:OnLeave()
	if (GameTooltip:GetOwner()==self) then
		GameTooltip:Hide()
	end
end

local fallback_textures = {
	spell=1121022,
	item=1121021,
	macro=1121020,
	petaction=1121022,
}
function ZygorActionButtonOverlay_Mixin:Setup(button,iconsetkey,tooltip,btype,macro_texture,object)
	self:SetAllPoints(button)
	self.tooltip = tooltip
	self.button = button

	if iconsetkey then
		ZGV.IconSets.ActionBarIcons[iconsetkey]:AssignToTexture(self.icon)
	else
		self.icon:SetTexCoord(0,1,0,1)

		local button_type = button:GetAttribute("type")
		local tex, needsglobal = macro_texture, nil
		if button:GetAttribute("spellid") then
			local spellData = GetSpellInfo(button:GetAttribute("spellid"))
			tex = spellData.iconID
		elseif button:GetAttribute("itemid") then
			tex = select(10, ZGV:GetItemInfo(button:GetAttribute("itemid")))
		elseif button:GetAttribute("macro") then
			tex = select(2,GetMacroInfo(button:GetAttribute("macro")))
		elseif button:GetAttribute("petaction") then
			_,tex = GetPetActionInfo(button:GetAttribute("petaction"))
		end
		if not tex then tex = fallback_textures[button_type] end
		
		self.icon:SetTexture(tex)
	end
	self:Show()
	self:UpdateCooldown()
end

function ZygorActionButtonOverlay_Mixin:UpdateCooldown()
	if not self.button then return end
	local button = self.button

	local starts,dur,ends = 0,0,0
	if button:GetAttribute("itemid") and tonumber(button:GetAttribute("itemid")) then
		starts,dur,ends = C_Container.GetItemCooldown(button:GetAttribute("itemid"))
	elseif button:GetAttribute("spellid") and tonumber(button:GetAttribute("spellid")) then
		local cooldown = GetSpellCooldown(button:GetAttribute("spellid"))
		starts,dur,ends = cooldown.startTime, cooldown.duration, cooldown.isEnabled
		if type(starts)=="table" then starts,dur,ends = starts.startTime,starts.duration,starts.startTime+starts.duration end
		if type(starts)=="table" then starts,dur,ends = starts.startTime,starts.duration,starts.startTime+starts.duration end
	elseif button:GetAttribute("petid") and tonumber(button:GetAttribute("petid")) then
		starts,dur,ends = GetPetActionCooldown(button:GetAttribute("petid"))
	end

	self.cooldown:SetDrawSwipe(true);

	CooldownFrame_Set(self.cooldown, starts,dur,ends)
	if (starts and starts>0) then self.cooldown:Show() else self.cooldown:Hide() end
end

function ZygorActionButtonOverlay_Mixin:Reset()
	self.icon:SetTexture(nil)
	self.tooltip=nil
	self:Hide()
	self:ClearAllPoints()
end