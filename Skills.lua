-- Vanilla and TBC

local ZGV = ZygorGuidesViewer
if not ZGV then return end

ZGV.Skills = {}
local Skills = ZGV.Skills

local max_level = GetMaxLevelForExpansionLevel(GetExpansionLevel())

tinsert(ZGV.startups,{"Skills setup",function(self)
	Skills:CleanSkillTable()
	Skills:MakeSkillsPopup()

	Skills.WorkerFrame=CreateFrame("FRAME")
	Skills.WorkerFrame:Show()

	local _,name = UnitClass("player")
	Skills.ClassNameForTrainers = name:lower():gsub("^%l", string.upper)

	ZGV:AddEventHandler("TRAINER_SHOW",Skills.EventDriver)
	ZGV:AddEventHandler("TRAINER_CLOSED",Skills.EventDriver)

end, after="all"})

function Skills:EventDriver(event,payload)
	if not ZGV.db.profile.nc_skills or not ZGV.db.profile.nc_skills_trainer then return end
	if not Skills:GetLearnableSkills() then return end

	if event=="TRAINER_SHOW" then
		Skills.SkillsPopup:Hide()
		local npcid = tostring(ZGV.GetUnitId("npc"))
		for id,data in ZGV.NPCData:iterate("Class"..Skills.ClassNameForTrainers) do
			if id==npcid and ZGV.db.profile.nc_skills_trainer and ZGV.db.profile.nc_enable and ZGV.db.profile.nc_skills then
				Skills:ShowToast()
			end
		end
		--Skills.SkillsPopup:ClearAllPoints()
		--Skills.SkillsPopup:SetPoint("TOPLEFT",ClassTrainerFrame,"TOPRIGHT",-24,-12)
	--elseif event=="TRAINER_CLOSED" then
		--Skills.SkillsPopup:Hide()
	end
end

function Skills:CleanSkillTable()
	local _,classname = UnitClass("player")

	for class,classdata in pairs(Skills.SkillTraining) do
		-- remove skills not for current class
		if class~=classname then 
			Skills.SkillTraining[class]=nil 
		else
			for level,skills in pairs(classdata) do
				for i,skilldata in ipairs(skills) do
					-- remove wrong faction and race skills
					if (skilldata.faction and not ZGV:RaceClassMatch(skilldata.faction)) or (skilldata.race and not ZGV:RaceClassMatch(skilldata.race)) then
						skills[i]=nil
					else
					-- query server for names, ranks and icons
						skilldata.faction = nil
						skilldata.race = nil
						local s = Spell:CreateFromSpellID(skilldata[1])
						local spellInfo = C_Spell.GetSpellInfo(skilldata[1])
						skilldata.name = spellInfo.name
						skilldata.icon = spellInfo.originalIconID
					end
				end
			end
		end
	end

	local required_talents = {}
	Skills.TalentsDependants = {}

	-- clone talent locks, set condition env
	for level=1,max_level do
		local skills = Skills.SkillTraining[classname][level]
		if skills then
			for _,skilldata in ipairs(skills) do
				if type(skilldata.optional)=="string" then
					skilldata.optional_raw = skilldata.optional
					skilldata.optional = ZGV.Parser.MakeCondition(skilldata.optional_raw)
					setfenv(skilldata.optional,ZGV.Parser.ConditionEnv)
				end

				if skilldata.req and (not skilldata.talent) and required_talents[skilldata.req] then
					skilldata.talent = required_talents[skilldata.req]
					required_talents[skilldata[1]] = required_talents[skilldata.req]
				end

				if skilldata.talent then
					required_talents[skilldata[1]] = skilldata.talent
				end

				if skilldata.req then
					Skills.TalentsDependants[skilldata.req] = skilldata
				end
			end
		end
	end
end

function Skills:IsDependantKnown(sdata)
	--if sdata.pet and not UnitExists("pet") then return true end -- if it is a pet skill, but pet doesn't exist, mark it as known

	if not Skills.TalentsDependants[sdata[1]] then return false end
	local dep = Skills.TalentsDependants[sdata[1]]
	
	if IsSpellKnown(sdata[1],sdata.pet) or IsPlayerSpell(sdata[1]) or IsSpellKnownOrOverridesKnown(sdata[1]) then return true end
	if IsSpellKnown(dep[1],dep.pet) or IsPlayerSpell(dep[1]) or IsSpellKnownOrOverridesKnown(dep[1]) then return true end
	return Skills:IsDependantKnown(dep)
end

function Skills:MakeSkillsPopup()
	local CHAIN = ZGV.ChainCall
	local FONT=ZGV.Font
	local FONTBOLD=ZGV.FontBold
	local MAXWIDTH=350

	local BUTTON_HEIGHT = 30

	local limits = {normal=5,optional=3,future=3}


	Skills.SkillsPopup = ZGV.PopupHandler:NewPopup("ZGVSkillsTraining","skills")
	local popup = Skills.SkillsPopup

	popup.text:SetText("")
	popup.text2:SetText(ZGV.L["skills_new"])
	popup.acceptbutton:SetText(ZGV.L["skills_trainer"])
	popup.morebutton:SetText(ZGV.L["skills_trainer_pet"])
	popup.morebutton:SetSize(100,20)

	for set,limit in pairs(limits) do
		popup[set.."header"] = CHAIN(popup:CreateFontString(nil,"ARTWORK")) 
			:SetFont(FONT,12) 
		.__END
		popup[set.."headerdecor"] = CHAIN(popup:CreateTexture(nil,"BACKGROUND")) 
			:SetSize(1,1) 
			:SetPoint("TOP",popup[set.."header"],"BOTTOM") 
			:SetPoint("LEFT",popup,"LEFT",5,0) 
			:SetPoint("RIGHT",popup,"RIGHT",-5,0) 
			:SetTexture(ZGV.DIR.."\\Skins\\white")
			:SetVertexColor(0.7,0.7,0.7,1)
		.__END

		popup[set.."more"] = CHAIN(ZGV.UI:Create("Button",popup)) 
			:SetPoint("LEFT",popup[set.."header"],"RIGHT",10,0) 
			:SetPoint("RIGHT",popup,"RIGHT",-10,0) 
			:SetFont(FONT,10) 
			:SetBackdropColor(0,0,0,0)         
			:SetBackdropBorderColor(0,0,0,0)   
			:SetNormalBackdropColor(0,0,0,0)   
			:SetHighlightBackdropColor(0,0,0,0)
			:SetText(ZGV.L["skills_more"])
			:SetScript("OnClick",function() popup:ToggleSet(set) end)
		.__END
		CHAIN(ZGVSkillsTraining[set.."more"]:GetFontString())
			:ClearAllPoints()
			:SetPoint("RIGHT",ZGVSkillsTraining[set.."more"],"RIGHT")
	end

	popup.normalheader:SetText(ZGV.L["skills_essential"])
	popup.optionalheader:SetText(ZGV.L["skills_optional"])
	popup.futureheader:SetText(ZGV.L["skills_future"])

	popup.normalcontent = CHAIN(CreateFrame("Frame", nil, popup))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(290)
			:SetHeight(100)
		.__END
		popup.normalscroll = CHAIN(ZGV.UI:Create("ScrollChild",popup,nil,popup.normalcontent))
			:SetPoint("TOPLEFT",popup.normalheader,"BOTTOMLEFT",0,-10)
			:SetPoint("RIGHT",popup,"RIGHT",-16,0)
			:SetHeight(100)
			:Show()
			.__END
		popup.normalscroll:SetHideWhenUseless(true)

	popup.optionalcontent = CHAIN(CreateFrame("Frame", nil, popup))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(290)
			:SetHeight(100)
		.__END
		popup.optionalscroll = CHAIN(ZGV.UI:Create("ScrollChild",popup,nil,popup.optionalcontent))
			:SetPoint("TOPLEFT",popup.optionalheader,"BOTTOMLEFT",0,-10)
			:SetPoint("RIGHT",popup,"RIGHT",-16,0)
			:SetHeight(100)
			:Show()
			.__END
		popup.optionalscroll:SetHideWhenUseless(true)

	popup.futurecontent = CHAIN(CreateFrame("Frame", nil, popup))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(290)
			:SetHeight(100)
		.__END
		popup.futurescroll = CHAIN(ZGV.UI:Create("ScrollChild",popup,nil,popup.futurecontent))
			:SetPoint("TOPLEFT",popup.futureheader,"BOTTOMLEFT",0,-10)
			:SetPoint("RIGHT",popup,"RIGHT",-16,0)
			:SetHeight(100)
			:Show()
			.__END
		popup.futurescroll:SetHideWhenUseless(true)

	popup.normalheader:SetPoint("TOPLEFT",popup.text2,"BOTTOMLEFT",0,-10)
	popup.optionalheader:SetPoint("TOPLEFT",popup.normalscroll,"BOTTOMLEFT",0,-10)
	popup.futureheader:SetPoint("TOPLEFT",popup.normalscroll ,"BOTTOMLEFT",0,-10)


	local function make_button(parent)
		local button = 	CHAIN(CreateFrame("Button"))
			:SetSize(295,BUTTON_HEIGHT)
			:SetParent(parent)
		.__END
		button:SetScript("OnEnter",function()
			if button.spell then
				GameTooltip:SetOwner(button, "ANCHOR_CURSOR")
				GameTooltip:SetSpellByID(button.spell)
				GameTooltip:Show()
			end
		end)
		button:SetScript("OnLeave",function()
			GameTooltip:FadeOut()
		end)

		
		button.texture = CHAIN(button:CreateTexture(nil,"BACKGROUND")) 
			:SetSize(BUTTON_HEIGHT,BUTTON_HEIGHT) 
			:SetPoint("TOPLEFT",button) 
		.__END

		button.caption = CHAIN(button:CreateFontString(nil,"ARTWORK")) 
			:SetPoint("LEFT",button.texture,"RIGHT",7,7) 
			:SetFont(FONT,12) 
			:SetText("caption")
		.__END
		button.cost = CHAIN(button:CreateFontString(nil,"ARTWORK")) 
			:SetPoint("LEFT",button.texture,"RIGHT",7,-7) 
			:SetFont(FONT,12) 
			:SetText("cost")
		.__END


		button.remove = CHAIN(ZGV.CreateFrameWithBG("Button"))
			:SetParent(button)
			:SetSize(12,12)
			:SetNormalTexture(ZGV.DIR.."\\Skins\\ban")
			:SetPoint("RIGHT",button,-15,0)
			:SetBackdropColor(0,0,0,0)
			:SetBackdropBorderColor(0,0,0,0)
			:SetScript("OnClick", function(self) Skills:BanLearnableSkills(button.spell) end)
			:SetScript("OnEnter",function()
				GameTooltip:SetOwner(button, "ANCHOR_CURSOR")
				GameTooltip:AddLine("Don't report this skill")
				GameTooltip:Show()
			end)
			:SetScript("OnLeave",function()
				GameTooltip:FadeOut()
			end)
		.__END

		button.known = CHAIN(ZGV.CreateFrameWithBG("Button"))
			:SetParent(button)
			:SetSize(12,12)
			:SetPoint("RIGHT",button.remove,"LEFT",-5,0)
			:SetNormalTexture("")
			:SetBackdropColor(0,0,0,0)
			:SetBackdropBorderColor(0,0,0,0)
			:SetScript("OnClick", function(self) Skills:MarkLearnedSkills(button.ranks) end)
			:SetScript("OnEnter",function()
				GameTooltip:SetOwner(button, "ANCHOR_CURSOR")
				GameTooltip:AddLine("Mark as already known")
				GameTooltip:Show()
			end)
			:SetScript("OnLeave",function()
				GameTooltip:FadeOut()
			end)
		.__END
		ZGV.IconSets.StepLineIcons.CHECK:AssignToTexture(button.known:GetNormalTexture())

		return button
	end




	popup.normal = {}
	popup.optional = {}
	popup.future = {}

	local BUTTON_MARGIN = 5

	function popup:AdjustSize()
		local offsets = 10 + 10 + 5 + 10 --Logo and top + text and buttons + buttons and bottom + header and icons
		local height = offsets + self.text:GetStringHeight() + self.text2:GetStringHeight() + self.logo:GetHeight() + self.acceptbutton:GetHeight()
		height = height + (popup.normalheader:GetStringHeight()+20)
		if self.morebutton:IsVisible() then height = height + self.morebutton:GetHeight() end

		if popup.optionalheader:IsVisible() then height = height + (popup.optionalheader:GetStringHeight()+20) end
		if popup.futureheader:IsVisible() then height = height + (popup.futureheader:GetStringHeight()+20) end

		for set,limit in pairs(limits) do
			local scrollheight=0
			for i,button in ipairs(popup[set]) do 
				if button:IsVisible() then 
					scrollheight=scrollheight+button:GetHeight()+BUTTON_MARGIN
				end 
			end
			if scrollheight>0 then
				popup[set.."content"]:SetHeight(scrollheight)
				scrollheight = math.min(scrollheight,(BUTTON_HEIGHT+BUTTON_MARGIN)*limit)
				height = height + scrollheight
				popup[set.."scroll"]:SetHeight(scrollheight)
			end
		end

		local minWidth = self.acceptbutton:GetWidth() + self.declinebutton:GetWidth() + self.settings:GetWidth()
		local width = min(max(minWidth,max(self.text:GetStringWidth(),self.text2:GetStringWidth())) + 70 , MAXWIDTH)

		self:SetSize(width,height)
	end

	function popup:ToggleSet(set)
		local used_counter = 0
		for i,but in ipairs(popup[set]) do if but.spell then used_counter = used_counter + 1 end end

		if used_counter<=limits[set] then return end

		local state = not popup[set.."more"].expanded
		popup[set.."more"].expanded = state

		if state then
			popup[set.."more"]:SetText(ZGV.L["skills_hide"])
		else
			popup[set.."more"]:SetText(ZGV.L["skills_mode_count"]:format(popup.counts[set]-limits[set]))
		end

		local height=0
		local width = (used_counter>limits[set] and state) and 285 or 295
		for i,but in ipairs(popup[set]) do
			if but.spell then
				if i>limits[set] and not state then 
					but:Hide()
				else
					but:Show()
					but:SetWidth(width)
					height=height+but:GetHeight()+BUTTON_MARGIN
				end
			end	
		end

		popup[set.."content"]:SetHeight(height)
		popup[set.."scroll"]:TotalValue(height)
		popup[set.."scroll"]:SetValue(0)
		popup[set.."scroll"]:SetVerticalScroll(0)

		popup:AdjustSize()
	end

	function popup:OnAccept()
		ZGV.WhoWhere:FindNPC("Class"..Skills.ClassNameForTrainers)
		if popup.ResetTimer then ZGV:CancelTimer(popup.ResetTimer) end
		popup.ResetTimer = ZGV:ScheduleTimer(function() popup.LastTrainer = nil end,15*60)
	end

	function popup:OnMore()
		ZGV.WhoWhere:FindNPC("ClassHunter pets")
		if popup.ResetTimer then ZGV:CancelTimer(popup.ResetTimer) end
		popup.ResetTimer = ZGV:ScheduleTimer(function() popup.LastTrainer = nil end,15*60)
	end


	function popup:OnDecline()
		if popup.ResetTimer then ZGV:CancelTimer(popup.ResetTimer) end
		popup.ResetTimer = ZGV:ScheduleTimer(function() popup.LastTrainer = nil end,15*60)
	end

	function popup:DisplaySkills(forceShow)

		for i,but in ipairs(popup.normal) do but:SetWidth(295) but:Hide() but.spell=nil end
		for i,but in ipairs(popup.optional) do but:SetWidth(295) but:Hide() but.spell=nil end
		for i,but in ipairs(popup.future) do but:SetWidth(295) but:Hide() but.spell=nil end

		popup.text2:SetText(ZGV.L["skills_new"])

		popup.acceptbutton:Show()
		popup.declinebutton:Show()

		popup.normalheader:Show()
		popup.normalheaderdecor:Show()
		popup.optionalheader:Hide()
		popup.optionalheaderdecor:Hide()
		popup.futureheader:Hide()
		popup.futureheaderdecor:Hide()

		popup.normalmore:Hide()
		popup.optionalmore:Hide()
		popup.futuremore:Hide()
	
		local data = Skills:GetLearnableSkills()
		if not data then
			ZGV:Print("No learnable skills found.")
			return
		end
		
		popup.counts = {normal=#data[1],optional=#data[2],future=#data[3]}

		if #data[1]>limits.normal then
			popup.normalmore:Show()
			popup.normalmore:SetText(ZGV.L["skills_mode_count"]:format(#data[1]-limits.normal))
		end

		local pettrainer = false

		if #data[1]>0 then
			popup.normalheader:Show()
			popup.normalheaderdecor:Show()
			for i,skill in ipairs(data[1]) do
				popup.normal[i] = popup.normal[i] or make_button(popup.normalcontent)
				local but = popup.normal[i]

				if i==1 then
					but:SetPoint("TOPLEFT",popup.normalcontent,"TOPLEFT",0,0)
				else
					but:SetPoint("TOPLEFT",popup.normal[i-1],"BOTTOMLEFT",0,-BUTTON_MARGIN)
				end

				but.texture:SetTexture(skill[2])
				but.caption:SetText((skill[7] and "|cff6666ff(Pet)|r " or "")..skill[1].." "..skill[4])
				but.cost:SetText(ZGV.GetMoneyString(skill[5]))
				but.spell = skill[3]
				but.ranks = skill[8]

				if skill[7] then 
					pettrainer=true
					but.known:Show() 
				else 
					but.known:Hide() 
				end

				if i>limits.normal then 
					but:Hide()
				else
					but:Show()
				end

				popup.optionalheader:SetPoint("TOPLEFT",popup.normalscroll,"BOTTOMLEFT",0,-10)
				popup.futureheader:SetPoint("TOPLEFT",popup.normalscroll,"BOTTOMLEFT",0,-10)
			end
		else
			popup.normalheader:Hide()
			popup.normalheaderdecor:Hide()
			popup.optionalheader:SetPoint("TOPLEFT",popup.text2,"BOTTOMLEFT",0,-10)
			popup.futureheader:SetPoint("TOPLEFT",popup.text2,"BOTTOMLEFT",0,-10)
		end

		if #data[2]>0 then
			popup.optionalheader:Show()
			popup.optionalheaderdecor:Show()
			if #data[2]>limits.optional then
				popup.optionalmore:Show()
				popup.optionalmore:SetText(ZGV.L["skills_mode_count"]:format(#data[2]-limits.optional))
			end

			for i,skill in ipairs(data[2]) do
				popup.optional[i] = popup.optional[i] or make_button(popup.optionalcontent)
				local but = popup.optional[i]

				if i==1 then
					but:SetPoint("TOPLEFT",popup.optionalcontent,"TOPLEFT",0,0)
				else
					but:SetPoint("TOPLEFT",popup.optional[i-1],"BOTTOMLEFT",0,-BUTTON_MARGIN)
				end

				but.texture:SetTexture(skill[2])
				but.caption:SetText((skill[7] and "|cff6666ff(Pet)|r " or "")..skill[1].." "..skill[4])
				but.cost:SetText(ZGV.GetMoneyString(skill[5]))
				but.spell = skill[3]
				but.ranks = skill[8]

				if skill[7] then 
					pettrainer=true
					but.known:Show() 
				else 
					but.known:Hide() 
				end

				if i>limits.optional then 
					but:Hide()
				else
					but:Show()
				end
			end
			popup.futureheader:SetPoint("TOPLEFT",popup.optionalscroll,"BOTTOMLEFT",0,-10)
		end

		if #data[3]>0 then
			popup.futureheader:Show()
			popup.futureheaderdecor:Show()
			if #data[3]>limits.future then
				popup.futuremore:Show()
				popup.futuremore:SetText(ZGV.L["skills_mode_count"]:format(#data[3]-limits.future))
			end

			for i,skill in ipairs(data[3]) do
				popup.future[i] = popup.future[i] or make_button(popup.futurecontent)
				local but = popup.future[i]
				but.caption:SetTextColor(0.7,0.7,0.7,0.7)
				but.texture:SetDesaturated(true)

				if i==1 then
					but:SetPoint("TOPLEFT",popup.futurecontent,"TOPLEFT",0,0)
				else
					but:SetPoint("TOPLEFT",popup.future[i-1],"BOTTOMLEFT",0,-BUTTON_MARGIN)
				end

				but.known:Hide() 

				but.texture:SetTexture(skill[2])
				but.caption:SetText((skill[7] and "(pet) " or "")..skill[1].." "..skill[4])
				but.cost:SetText("in "..skill[6].. " level"..(skill[6]>1 and "s" or ""))
				but.spell = skill[3]
				but.ranks = skill[8]

				if i>limits.future then 
					but:Hide()
				else
					but:Show()
				end
			end
		end

		if pettrainer then
			self.acceptbutton:SetPoint("BOTTOMRIGHT",self.morebutton,"TOP",-5,5)
			self.declinebutton:SetPoint("BOTTOMLEFT",self.morebutton,"TOP",5,5)
			self.morebutton:Show()
		else
			self.acceptbutton:SetPoint("BOTTOMRIGHT",self,"BOTTOM",-5,5)
			self.declinebutton:SetPoint("BOTTOMLEFT",self,"BOTTOM",5,5)
			self.morebutton:Hide()
		end

		popup.count = #data[1]

		if forceShow then
			Skills.SkillsPopup:SavedShow() -- not normal show as that calls whole queue. now we just want to show the frame
			if popup.normalmore.expanded then
				popup.normalmore.expanded = false
				popup:ToggleSet("normal")
			end

			if popup.optionalmore.expanded then
				popup.optionalmore.expanded = false
				popup:ToggleSet("optional")
			end

			if popup.futuremore.expanded then
				popup.futuremore.expanded = false
				popup:ToggleSet("future")
			end
		else
			ZGV.PopupHandler:QueuePush(self)
		end
	end


	function popup:DisplayEmpty(float)
		for i,but in ipairs(popup.normal) do but:Hide() end
		for i,but in ipairs(popup.optional) do but:Hide() end
		for i,but in ipairs(popup.future) do but:Hide() end

		popup.text2:SetText(ZGV.L["skills_nothing"])

		popup.acceptbutton:Hide()
		popup.declinebutton:Hide()
		
		popup.normalheader:Hide()
		popup.normalheaderdecor:Hide()
		popup.optionalheader:Hide()
		popup.optionalheaderdecor:Hide()
		popup.futureheader:Hide()
		popup.futureheaderdecor:Hide()

		popup.normalmore:Hide()
		popup.optionalmore:Hide()
		popup.futuremore:Hide()
	end

	popup:DisplaySkills(true)

	Skills.SkillsPopup:Hide()

	function popup:returnMinimizeSettings(count)
		local tooltipText = "Click to show the skill popup again"
		return "skills","You have new skills available.",tooltipText,{cleartype=true,quiet=true}
		
	end

	if ZGV.db.profile.nc_skills_login and ZGV.db.profile.nc_enable and ZGV.db.profile.nc_skills then
		Skills:ShowToast()
	end

	Skills.SkillDistanceTimer = ZGV:ScheduleRepeatingTimer(function() Skills:MaybeShowPopupByDistance() end, 2)	
end

function Skills:BanLearnableSkills(skillid)
	local name = C_Spell.GetSpellInfo(skillid).name

	if name then
		ZGV.db.char.bannedskills[name] = true
		Skills:RefreshSkillPopup()
	end
end

function Skills:MarkLearnedSkills(ranks)
	for _,skillid in pairs(ranks) do
		ZGV.db.char.learnedskills[skillid] = true
	end
	Skills:RefreshSkillPopup()
end

function Skills:RefreshSkillPopup()
	Skills.SkillsPopup:Hide()
	Skills:ShowSkillPopup(nil,Skills.SkillsPopup.mode,"forceShow")
end

function ZGV.Skills:GetLearnableSkills(level,forceShow)
	local level = level or UnitLevel("player")
	local _,classname = UnitClass("player")

	local function get_by_name(arr,sdata)
		for i,v in ipairs(arr) do
			if v.name==sdata.name then return v end
		end
		table.insert(arr,{name=sdata.name, icon=sdata.icon, ranks={}, skill=sdata[1], pet=sdata.pet})
		return arr[#arr]
	end

	local results,opt_results,future_results = {},{},{}

	for slevel=1,max_level do
		local skills=Skills.SkillTraining[classname][slevel]
		if slevel<=level and skills then
			for _,sdata in pairs(skills) do
				local skill=sdata[1]
				if not (IsSpellKnown(skill,sdata.pet) or IsPlayerSpell(skill) or Skills:IsDependantKnown(sdata)) -- already known
				  -- and not sdata.pet -- pet skills detection is broken. hunter can have skill learned to teach to pet, but ISK reports false until pet knows it. disable for now
				   and not ZGV.db.char.bannedskills[sdata.name] -- not banned
				   and not ZGV.db.char.learnedskills[sdata[1]] -- not marked as known
				   and (not sdata.talent or IsSpellKnown(sdata.talent) or IsPlayerSpell(sdata.talent)) -- no required talent, or talent known
				   then
					if (sdata.optional==true) or (type(sdata.optional)=="function" and sdata.optional())  then
						if ZGV.db.profile.nc_skills_optional then
							local entry = get_by_name(opt_results,sdata)
							table.insert(entry.ranks,{skill=sdata.skill,rank=sdata.rank or "",cost=sdata[2],req=sdata.req,talent=sdata.talent,pet=sdata.pet})
						end
					elseif (type(sdata.valid)=="nil" or sdata.valid) then  -- no valid definition, or it is met
						local entry = get_by_name(results,sdata)
						table.insert(entry.ranks,{
							skill=sdata[1],
							rank=sdata.rank or "",
							cost=sdata[2],
							req=sdata.req,
							talent=sdata.talent,
							pet=sdata.pet})
					end
				end
			end
		end
	end

	if ZGV.db.profile.nc_skills_future then
		for slevel=level+1,math.min(level+3,max_level) do
			local skills=Skills.SkillTraining[classname][slevel]
			if #future_results>0 then break end

			if skills then
				for _,sdata in pairs(skills) do
					if (not sdata.talent or IsSpellKnown(sdata.talent) or IsPlayerSpell(sdata.talent)) 
					   and not Skills:IsDependantKnown(sdata)
					   and not ZGV.db.char.bannedskills[sdata.name] -- not banned
					   then
						local entry = get_by_name(future_results,sdata)
						entry.level = slevel-level
						table.insert(entry.ranks,{skill=sdata.skill,rank=sdata.rank,cost=sdata[2],req=sdata.req,talent=sdata.talent,pet=sdata.pet})
					end
				end
			end
		end
	end

	-- show only if core skills are found
	if #results==0 and not forceShow then return end

	sort(results,function(a,b) return a.name<b.name end)
	sort(opt_results,function(a,b) return a.name<b.name end)
	sort(future_results,function(a,b) return a.name<b.name end)

	local display = {}

	for index,data in ipairs({results,opt_results,future_results}) do
		display[index]={}
		for _,skill in ipairs(data) do
			local minrank,maxrank,cost,ranks = nil,nil,0,""

			local ids = {}

			for _,rank in ipairs(skill.ranks) do
				if (not minrank) or (minrank>(tonumber(rank.rank) or 0)) then minrank=tonumber(rank.rank) or 0 end
				if (not maxrank) or (maxrank<(tonumber(rank.rank) or 0)) then maxrank=tonumber(rank.rank) or 0 end
				cost = cost + (rank.cost or 0)
				table.insert(ids,rank.skill)
			end

			local rankmsg = ""
			if minrank and maxrank and (minrank~=0 and maxrank~=0) then
				if minrank~=maxrank then 
					rankmsg = "(Ranks "..minrank.."-"..maxrank..")"
				else
					rankmsg = "(Rank "..minrank..")"
				end
			end
					
			table.insert(display[index],{skill.name,skill.icon,skill.skill,rankmsg,cost,skill.level,skill.pet,ids})
		end
	end


	return display
end

function Skills:ShowSkillPopup(level,mode,forceShow)
	if not (ZGV.db.profile.nc_skills or forceShow) then return end

	Skills.SkillsPopup.mode = mode or "default"

	Skills.SkillsPopup:ClearAllPoints()
	Skills.SkillsPopup:SetPoint("TOP",0,-50)

	local display = Skills:GetLearnableSkills(level,forceShow)
	if display and (display[1][1] or display[2][1] or display[3][1]) then
		Skills.SkillsPopup:DisplaySkills(forceShow)
	elseif forceShow then
		Skills.SkillsPopup:DisplayEmpty()
	end
end

local dist_threshold_show = 30
local dist_threshold_reset = 60
-- lifted from WhoWHere
local function CalcStep()
	if Skills.thread then
		local ok,err = coroutine.resume(Skills.thread)
		if not ok then print(ok,err) end
		if coroutine.status(Skills.thread)=="dead" then
			Skills.thread=nil
			Skills.WorkerFrame:SetScript("OnUpdate",nil)
		end
	end
	if Skills.SkillTrainerInDistance then
		if Skills.SkillsPopup.LastTrainer~=Skills.SkillTrainerInDistance then
			ZGV:Debug("&skills popup, showing by distance")
			if ZGV.db.profile.nc_skills and ZGV.db.profile.nc_skills_dist and ZGV.db.profile.nc_enable and Skills:GetLearnableSkills() then Skills:ShowToast() end
			Skills.SkillsPopup.LastTrainer = Skills.SkillTrainerInDistance
		else
			ZGV:Debug("&skills popup, already shown for this npc")
		end
		Skills.SkillTrainerInDistance = nil
	end
end

-- lifted from WhoWHere
local function CalcThread()
	local x,y,m=LibRover:GetPlayerPosition()
	local parse=ZGV.NPCData.parseNPC
	local mindist,minid
	for id,data in ZGV.NPCData:iterate("Class"..Skills.ClassNameForTrainers) do
		local npc=parse(data)
		if tonumber(npc.m) and npc.m>0 then
			npc.x=npc.x*0.01
			npc.y=npc.y*0.01
			local dist=ZGV.HBD:GetZoneDistance(m,x,y,npc.m,npc.x,npc.y)

			if dist then
				if Skills.SkillsPopup.LastTrainer==id and dist>dist_threshold_reset then
					Skills.SkillsPopup.LastTrainer = nil
				end	

				if ZGV.db.profile.nc_skills and ZGV.db.profile.nc_skills_dist and ZGV.db.profile.nc_enable and Skills:GetLearnableSkills() and dist<dist_threshold_show then
					ZGV:Debug("&skills popup, found by distance "..id)
					Skills.SkillTrainerInDistance = id
					return true
				elseif ZGV.db.profile.nc_skills and ZGV.db.profile.nc_skills_town and ZGV.db.profile.nc_enable and Skills:GetLearnableSkills() and npc.m==Skills.SkillSearchByMap and (npc.m~=Skills.SkillTrainerShownByMap) then
					ZGV:Debug("&skills popup, found for capital "..Skills.SkillSearchByMap)
					Skills.SkillTrainerShownByMap = Skills.SkillSearchByMap
					Skills:ShowToast()
					return true
				end
			end
		end
		coroutine.yield()
	end
	return false
end

local capitals = {
	[1455] = "Ironforge",
	[1453] = "Stormwind City",
	[1458] = "Undercity",
	[1457] = "Darnassus",
	[1454] = "Orgrimmar",
	[1456] = "Thunder Bluff",
	[1954] = "Silvermoon City",
	[1947] = "The Exodar",
	[1955] = "Shattrath City",
}


function Skills:MaybeShowPopupByDistance()
	if not ZGV.db.profile.nc_skills then return end
	
	local x,y,m=LibRover:GetPlayerPosition()

	if ZGV.db.profile.nc_skills_town and ZGV.db.profile.nc_skills and Skills:GetLearnableSkills() and m and Skills.SkillTrainerShownByMap~=m then -- we changed maps, and care about town popups
		if capitals[m] then
			ZGV:Debug("&skills popup, new map - capital")
			Skills.SkillSearchByMap = m
		else
			ZGV:Debug("&skills popup, new map - not capital")
			Skills.SkillTrainerShownByMap = m -- mark map as having the popup already shown, so we don't retry it here
			Skills.SkillSearchByMap = nil
		end
	end

	if (ZGV.db.profile.nc_skills_town or ZGV.db.profile.nc_skills_dist) and Skills:GetLearnableSkills() and ZGV.db.profile.nc_skills then
		Skills.WorkerFrame:SetScript("OnUpdate",CalcStep)
		Skills.thread = coroutine.create(CalcThread)
	end

end

function Skills:ShowToast()
	if ZGV:Throttler("skillstoast",120) then return end

	ZGV.NotificationCenter:AddEntry("skills", "You have new skills available.", "Click to see skills.",{cleartype=true})

end
