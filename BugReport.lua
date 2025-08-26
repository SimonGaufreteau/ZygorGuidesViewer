local name,ZGV = ...

local GetSpellInfo = ZGV.Retrofit.C_Spell.GetSpellInfo
local GetAuraDataByIndex = C_UnitAuras.GetAuraDataByIndex

-- GLOBAL ZygorGuidesViewer_DumpFrameReport,ZygorGuidesViewerMaintenanceFrame

local L = ZGV.L

local table,string,tonumber,tostring,ipairs,pairs,setmetatable = table,string,tonumber,tostring,ipairs,pairs,setmetatable

local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local CHAIN = ZGV.ChainCall
local AceGUI = LibStub("AceGUI-3.0-Z")
local ui = ZGV.UI

local BZL,BZR=ZGV.BZL,ZGV.BZR

ZGV.BugReport = {}
local BugReport = ZGV.BugReport

BugReport.StepFeedback = {}
local StepFeedback = BugReport.StepFeedback

BugReport.GuideRating = {}
local GuideRating = BugReport.GuideRating

--[[
local function tostr(val)
	if type(val)=="string" then
		return '"'..val..'"'
	elseif type(val)=="number" then
		return tostring(val)
	elseif not val then
		return "nil"
	elseif type(val)=="boolean" then
		return tostring(val).." ["..type(val).."]"
	end
end
--]]

local dropDownOptions = {
	"Guide Viewer",
	"Waypoint Arrow",
	"Travel System",
	"Gear System",
	"Notification Center",
	"Sticky Steps",
	"Pet Battle UI",
	"General Guide Content Errors",
	"Other",
}

tinsert(ZGV.startups,{"BugReport pruning dumps",function(self)
	BugReport:PruneDumps()
end})

tinsert(ZGV.startups,{"BugReport + Spoo",function(self)
	local Spoo = LibStub("Spoo","silent")
	if not Spoo then return end
	Spoo:SetDumpFunc(function (index,data)
		ZGV:ShowDump(index.." = "..ZGV:Serialize(data))
	end)
end})

local function superconcat(table,glue)
	local s=""
	for i=1,#table do
		if #s>0 then s=s..glue end
		s=s..tostring(table[i])
	end
	return s
end

local function SkinData(property)
--[[	if ZGV.CurrentSkinStyle.id=="midnight" and property=="Backdrop" then
		return {
				bgFile = "Interface/Tooltips/UI-Tooltip-Background",
				edgeFile = "Interface/Tooltips/UI-Tooltip-Border",
				tile = true, tileSize = 32, edgeSize = 16,
				insets = { left = 4, right = 4, top = 4, bottom = 4 }
			}
	else--]]
		return ZGV.UI.SkinData(property)
	--end
end

-- misc:
local function CreateDumpFrameBasic()
	local name = "ZygorGuidesViewer_DumpFrameBasic"

	local frame = CHAIN(ui:Create("Frame",UIParent,name))
		:SetSize(900,570)
		:SetPoint("CENTER", UIParent, "CENTER")
		:SetFrameStrata("FULLSCREEN")
		:Hide()
		.__END
	if ZGV.DEV then frame:CanDrag(true) end
	tinsert(UISpecialFrames, name)

	local scroll = CHAIN(ui:Create("ScrollChild",frame,name.."Scroll","editbox"))
		:SetBackdrop(SkinData("BugEditBackdrop"))
		:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))
		:SetPoint("TOPLEFT", frame, 8, -50)
		:MySetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 38)
		:HookScript("OnShow",function(me) me.child:SetFocus(true) end)
	.__END
	frame.scroll = scroll

	scroll.child:SetScript("OnEscapePressed", function() frame.save=nil frame:Hide() end)
	frame.editBox = scroll.child

	local close = CHAIN(CreateFrame("Button", nil, frame))
		:SetPoint("TOPRIGHT", frame, "TOPRIGHT",-5,-5)
		:SetSize(15,15)
		:SetScript("OnClick",function() frame:Hide() end)
	.__END
	ZGV.ButtonSets.TitleButtons.CLOSE:AssignToButton(close)

	local title = CHAIN(frame:CreateFontString(nil,"OVERLAY"))
		:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
		:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -30, -45)
		:SetFont(FONTBOLD,14,"")
		:SetJustifyH("CENTER")
		:SetJustifyV("TOP")
		.__END
	frame.title = title

	frame.OKButton = CHAIN(ui:Create("Button",frame))
		:SetSize(200,25)
		:SetText("OK")
		:SetFont(FONTBOLD,14,"")
		:SetPoint("BOTTOM", frame, "BOTTOM",0,5)
		--		:SetScript("OnClick",function(self) if frame.save and frame.timestamp then ZGV:SaveDump(frame.editBox:GetText(),frame.timestamp) frame.save=nil frame.timestamp=nil end  frame:Hide()  end)
		:SetScript("OnClick",function(self)
			if ZygorGuidesViewer_DumpFrameReport and ZygorGuidesViewer_DumpFrameReport:IsShown() then
				ZygorGuidesViewer_DumpFrameReport.text = frame.editBox:GetText()  -- save modified text
			end
			frame:Hide()
		end)
		:SetPushedBackdropColor(unpack(SkinData("Accent")))
	.__END

	if ZGV.DEV then
		local oldreports = CHAIN(ui:Create("DropDown",frame))
			:SetPoint("BOTTOMRIGHT",frame,"BOTTOMRIGHT",0,0)
			:SetWidth(125)
			:SetText("Old Reports")
		.__END
		oldreports.frame:Show()

		if ZGV.db.global.bugreports then
			for time,report in pairs(ZGV.db.global.bugreports) do
				oldreports:AddItem(date("%m/%d/%y %H:%M:%S",time),nil,function(self)
					frame.editBox:SetText(report.text:gsub("%%%%","\n"))
				end)
			end
		end

		frame.oldreports = oldreports
	end

	ZGV.BugReport.dumpFrameBasic=frame
end

local function CreateDumpFrameReport()
	local name = "ZygorGuidesViewer_DumpFrameReport"

	local frame = CHAIN(ui:Create("Frame",UIParent,name))
		:SetSize(500,470)
		:SetPoint("CENTER", UIParent, "CENTER")
		:SetFrameStrata("FULLSCREEN")
		:Hide()
		.__END
	if ZGV.DEV then frame:CanDrag(true) end
	frame:SetBackdrop(ZGV.UI.SkinData("WindowBackdrop"))
	frame:SetBackdropColor(0,0,0,1)
	frame:SetBackdropBorderColor(0,0,0,1)

	ZGV.BugReport.dumpFrameReport = frame
	tinsert(UISpecialFrames, name)

	local title = CHAIN(frame:CreateFontString(nil,"OVERLAY"))
		:SetPoint("TOPLEFT", frame, "TOPLEFT", 10, -10)
		:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", -30, -45)
		:SetFont(FONTBOLD,15,"")
		:SetText(L['bugreport_header'])
		:SetJustifyH("LEFT")
		:SetJustifyV("TOP")
	.__END
	frame.title = title

	-- DropDown
		local selector = CHAIN(ui:Create("DropDown",frame))
			:SetPoint("TOPLEFT",title,"BOTTOMLEFT",0,10)
			:SetWidth(200)
			:SetText(L['bugreport_bugtype'])
		.__END
		selector.frame:Show()

		for i,opt in pairs(dropDownOptions) do
			selector:AddItem(opt)
		end

		frame.selector = selector

	-- Box 1
		frame.header1 = CHAIN(frame:CreateFontString(nil,"OVERLAY"))
			:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -25)
			:SetWidth(460)
			:SetFont(FONT,14,"")
			:SetJustifyH("LEFT")
			:SetJustifyV("TOP")
			:SetWordWrap(true)
			:SetText(L['bugreport_description'])
		.__END

		frame.scroll1 = CHAIN(ui:Create("ScrollChild",frame,name.."Scroll1","editbox"))
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))
			--:SetHideWhenUseless(1)
			:SetSize(480,135)
			:SetPoint("TOPLEFT", frame.header1, "BOTTOMLEFT", 0, -10)
			:MySetPoint("BOTTOMRIGHT", frame, "RIGHT", -10, 0)
		.__END

		CHAIN(frame.scroll1.child)
			:SetScript("OnEscapePressed", function() frame.save=nil frame:Hide() end)
			:SetScript("OnTabPressed", function() frame.edit2Box:SetFocus(true) end)
			:SetFont(FONT,12,"")

		frame.edit1Box = frame.scroll1.child

	-- Box 2
		frame.header2= CHAIN(frame:CreateFontString(nil,"OVERLAY"))
			:SetPoint("TOPLEFT", frame.scroll1, "BOTTOMLEFT",0,-10)
			:SetFont(FONT,14,"")
			:SetJustifyH("LEFT")
			:SetJustifyV("TOP")
			:SetWidth(460)
			:SetWordWrap(true)
			:SetText(L['bugreport_info'])
		.__END

		frame.scroll2 = CHAIN(ui:Create("ScrollChild",frame,name.."Scroll2","editbox"))
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))
			--:SetHideWhenUnless(1)
			:SetSize(480,135)
			:SetPoint("TOPLEFT", frame.header2, "BOTTOMLEFT", 0, -10)
			:MySetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -10, 35)
		.__END

		CHAIN(frame.scroll2.child)
			:SetScript("OnEscapePressed", function() frame.save=nil frame:Hide() end)
			:SetScript("OnTabPressed", function() frame.edit1Box:SetFocus(true) end)
			:SetFont(FONT,12,"")

		frame.edit2Box = frame.scroll2.child

	--[[
	-- Box 3
		frame.header3 = CHAIN(frame:CreateFontString(nil,"OVERLAY"))
			:SetPoint("TOPLEFT", frame.editFrame2, "BOTTOMLEFT",0,-10)
			:SetFont(FONT,14)
			:SetJustifyH("CENTER")
			:SetJustifyV("TOP")
			:SetText("What information do you think will be important for fixing the issue?")
		.__END

		frame.edit3Box = CHAIN(CreateFrame("EditBox", nil, frame))
			:SetMultiLine(true)
			--:SetMaxLetters(999999)
			:EnableMouse(true)
			:SetAutoFocus(false)
			:SetFont(FONT,12)
			:SetWidth(400)
			:SetHeight(270)
			:SetScript("OnEscapePressed", function() frame.save=nil frame:Hide() end)
			:SetScript("OnTabPressed", function() frame.edit1Box:SetFocus(true) end)
			.__END

		frame.editFrame3 = CHAIN(CreateFrame("Button", name, frame))
			:SetBackdrop(SkinData("Backdrop"))
			:SetBackdropColor(unpack(SkinData("GuideBackdropColor")))
			:SetBackdropBorderColor(unpack(SkinData("GuideBackdropBorderColor")))
			:SetSize(480,100)
			:SetPoint("TOPLEFT", frame.header3, "BOTTOMLEFT", 0, -10)
			:RegisterForClicks("LeftButton")
			:EnableMouse(true)
			:SetScript("OnClick", function() frame.edit1Box:SetFocus(true) end)
		.__END

		frame.edit3Box:SetAllPoints(frame.editFrame3)

	--]]

	local close = CHAIN(CreateFrame("Button", nil, frame))
		:SetPoint("TOPRIGHT", frame, "TOPRIGHT",-5,-5)
		:SetSize(15,15)
		:SetScript("OnClick",function() frame:Hide() end)
	.__END
	ZGV.ButtonSets.TitleButtons.CLOSE:AssignToButton(close)

	if not ZGV.StandAlone then
	frame.OKButton = CHAIN(ui:Create("Button",frame))
		:SetSize(200,25)
		:SetText(L['bugreport_button_save'])
		:SetFont(FONTBOLD,14,"")
		:SetPoint("BOTTOM", frame, "BOTTOM",0,5)
		:SetScript("OnClick",function(self)
			local function safexml(s)  return s:gsub("<","&lt;"):gsub(">","&gt;")  end
			if frame.save and frame.timestamp and frame.text then
				local text = "<report timestamp=\"" .. frame.timestamp .. "\">"
					  ..   "<type>" .. safexml(frame.selector.text:GetText()) .."</type>"
				          ..   "<description>" .. safexml(frame.edit1Box:GetText()) .."</description>"
				          ..   "<info>" .. safexml(frame.edit2Box:GetText()) .."</info>"
				          ..   "<body>" .. safexml(frame.text) .."</body>"
					  .. "</report>"
				BugReport:SaveDump(text, frame.timestamp)
				frame.save=nil
				frame.timestamp=nil
			end
			frame:Hide()
		end)
	.__END
	end

	frame.viewbut = CHAIN(ui:Create("Button",frame))
		:SetSize(100,25)
		:SetText(L['bugreport_button_view'])
		:SetFont(FONTBOLD,14,"")
		:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT",5,5)
		:SetScript("OnClick",function(self)
			if frame.text then
				local s = "--- Provided information ---\n"
				s = s .. "Type: "..frame.selector.text:GetText() .."\n"
				s = s .. "description: "..tostring(ZGV.BugReport.dumpFrameReport.edit1Box:GetText()) .."\n"
				s = s .. "info: "..tostring(ZGV.BugReport.dumpFrameReport.edit2Box:GetText()) .."\n\n"
				ZGV:ShowDump(s..frame.text,"Bug Report Contents")
			end
		end)
		:SetPushedBackdropColor(unpack(SkinData("Accent")))
	.__END

	if ZGV.StandAlone then
		frame.viewbut:ClearAllPoints()
		frame.viewbut:SetPoint("BOTTOM", frame, "BOTTOM",0,5)
	end

	ZGV:AddMessageHandler("SKIN_UPDATED",{BugReport,"ApplySkin"})
	BugReport:ApplySkin()
end

local function dumpquest(quest)
	local s = ("%d. \"%s\" ##%d (lv=%d%s):\n"):format(quest.index,quest.title,quest.id,quest.level,quest.complete and ", complete" or "")
	if quest.goals then
		for i,goal in ipairs(quest.goals) do
			s = s .. ("... %d. \"%s\" (%s, %s/%s%s)\n"):format(i,goal.leaderboard,goal.type,goal.num,goal.needed,goal.complete and ", complete" or "")
		end
	end
	return s
end

local function anytostring(s)
	if type(s)=="table" then
		return superconcat(s,",")
	else
		return tostring(s)
	end
end

BugReport.Flags = {guide=1,step=1,player=1,questlog=1,inventory=1,parselog=1,itemscore=1,gearfinder=1}

function BugReport:GetReport_Flavor()
	return
		   (ZGV.IsRetail and "RETAIL")
		or (ZGV.IsClassicAnnivHardcore and "CLASSIC-ANNIVHC")
		or (ZGV.IsClassicAnniv and "CLASSIC-ANNIV")
		or (ZGV.IsClassicHardcore and "CLASSIC-HC")
		or (ZGV.IsClassicSoM and "CLASSIC-SOM")
		or (ZGV.IsClassicSoD and "CLASSIC-SOD")
		or (ZGV.IsClassic and "CLASSIC")
		or (ZGV.IsClassicCATA and "CLASSIC-CATA")
		or (ZGV.IsClassicWOTLK and "CLASSIC-WOTLK")
		or (ZGV.IsClassicTBC and "CLASSIC-TBC")
		or (ZGV.IsClassicMOP and "CLASSIC-MOP")
		or "???"
end

function BugReport:GetReport_Player_Basic()
	local spec = "n/a"

	if ZGV.IsRetail then
		spec = (select(2,GetSpecializationInfo(GetSpecialization() or 0)))
	end

	local chromietime = "n/a"
	if ZGV.IsRetail then
		local t = ZGV.Parser.ConditionEnv.chromietime()
		if t then
			chromietime = t.." "..(ZGV.Parser.ChromieTime[t] or "???")
		else
			chromietime = "not set"
		end
	end			


	return ("Race: %s  Class: %s  Spec: %s  Level: %.2f   Flavor: %s, Faction: %s, Chromie: %s"):format(
		select(2,UnitRace("player")),
		select(2,UnitClass("player")),
		spec or "none",
		ZGV:GetPlayerPreciseLevel(),
		self:GetReport_Flavor(),
		UnitFactionGroup("player"),
		chromietime)
end

function BugReport:GetReport_Player_Location()
	local mapid = C_Map.GetBestMapForUnit("player") or -1
	local coords = C_Map.GetPlayerMapPosition(mapid,"player")
	local x,y = coords and coords.x or 0,coords and coords.y or 0
	return ("Position: |cffffeeaa%s ##%d %.2f,%.2f|r (zone:'%s', realzone:'%s', subzone:'%s', minimapzone:'%s')"):format(
	 ZGV.GetMapNameByID(mapid) or "?",mapid, (x or 0)*100,(y or 0)*100,
	 GetZoneText(),GetRealZoneText(),GetSubZoneText(),GetMinimapZoneText())
end

function BugReport:GetReport_Travel()
	local LibRover=ZGV.LibRover
	if ZGV.db.profile.pathfinding and LibRover.RESULTS then
		local s = ""
		for k,v in ipairs(LibRover.RESULTS) do
			s = s .. (" %d. %s\n"):format(k,v:tostring())
		end
		if #LibRover.RESULTS_SKIPPED_START>0 then
			s = s .. "  Skipped at start:\n"
			for k,v in ipairs(LibRover.RESULTS_SKIPPED_START) do
				s = s .. (" %s\n"):format(v:tostring())
			end
		end
		if #LibRover.RESULTS_SKIPPED_END>0 then
			s = s .. "  Skipped at end:\n"
			for k,v in ipairs(LibRover.RESULTS_SKIPPED_END) do
				s = s .. (" %s\n"):format(v:tostring())
			end
		end
		s = s .. "Travel mode: "..ZGV.db.global.travelmode.."\n"
		s = s .. "Comfort mode: "..ZGV.db.profile.pathfinding_comfort.."\n"
		if ZGV.db.profile.travelavoidportals then s = s .. "Avoid portals: true\n" else s = s .. "Avoid portals: false\n" end
		if ZGV.db.profile.travelusehs then s = s .. "Use HS: true\n" else s = s .. "Use HS: false\n" end
		if ZGV.db.profile.traveluseitems then s = s .. "Use items: true\n" else s = s .. "Use items: false\n" end
		if ZGV.db.profile.travelusespells then s = s .. "Use spells: true\n" else s = s .. "Use spells: false\n" end
		if ZGV.db.profile.travelprefertaxi then s = s .. "Prefer taxi: true\n" else s = s .. "Prefer taxi: false\n" end
		return s
	else
		return "No travel data"
	end
end

function BugReport:GetReport(maint,flags)
	local s = ""

	s = s .. ("Zygor Guides Viewer v%s %s\n"):format(ZGV.version,self:GetReport_Flavor())
	s = s .. ("Guide: %s\nStep: %d\n"):format(ZGV.CurrentGuideName or "no guide",ZGV.CurrentStepNum or 0)
	s = s .. "\n"

	if maint then
		s = s .. "\nMAINTENANCE OPTIONS THAT WERE ENABLED PROPERLY: ______________\nMAINTENANCE OPTION THAT CAUSED DISCONNECTION: _______________\n\n"
	end

	flags = flags or self.Flags

	local report = {}

	report.player = "--- Player information ---\n"
	if self.Flags.player then
		local s
		s = self:GetReport_Player_Basic() .. "\n" .. self:GetReport_Player_Location() .. "\n"  -- moved out, to reuse by StepFeedback
		if GetLocale()~="enUS" then
			--s = s .. ("    enUS: realzone:'%s' zone:'%s' subzone:'%s' minimapzone:'%s')\n"):format(tostring(BZR[GetRealZoneText()]),tostring(BZR[GetZoneText()]),BZR[GetSubZoneText()] or "("..GetSubZoneText()..")",BZR[GetMinimapZoneText()] or "("..GetMinimapZoneText()..")")
			s = s .. ("Locale: %s\n"):format(GetLocale())
		end
		if UnitClass("target") then
			s = s .. ("Target: %s ##%s\n"):format(UnitName("target"),ZGV.GetTargetId())
		end

		s = s .. "\n\n--Professions\n"
		if ZGV.IsRetail then
			local profTable = {GetProfessions()}
			local found
			for num,prof in pairs (profTable) do
				found = true
				local name,_,level,maxlevel=GetProfessionInfo(prof)
				s = s..(" %s - Current Level: %d Max Level: %d\n"):format(name,level,maxlevel)
			end
			if not found then s = s.. "NONE" end
		else
			for _,pro in pairs(ZGV.Professions.SkillsKnown) do
				if not pro.placeholder then
					s = s .. ("%s %s %d/%d\n"):format(pro.name,pro.skillID,pro.level,pro.max)
				end
			end
		end

		s = s .. "\n\n--Enabled Addons\n"
		local numAddons  = C_AddOns.GetNumAddOns()
		for i=1,numAddons do
			local name,_,_,enabled = C_AddOns.GetAddOnInfo(i)
			if enabled then s = s .. " "..name .. "\n" end
		end
		report.player = report.player .. s
	else
		report.player = report.player .. "(skipped)\n"
	end

	report.parser = "\n\n--- Parser Errors ---\n"
	if self.Flags.parselog then
		local s = ""
		s = s .. (ZGV.ParseLog~="" and ZGV.ParseLog or "NONE\n").."\n"
		report.parser = report.parser .. s
	else
		report.parser = report.parser .. "(skipped)\n"
	end

	report.guide = "\n\n--- GUIDE ---\n"
	if self.Flags.guide then
		local s = ""
		if ZGV.CurrentGuide and not ZGV.CurrentGuide.parse_failed then
			s = s .. ("Guide: %s\n"):format(tostring(ZGV.CurrentGuide.title_short))
			local g = ZGV.CurrentGuide
			s = s .. ("Type: %s  Parsed: %s  Fully: %s\n"):format(tostring(g.type),g.parsed and "yes" or "no", g.fully_parsed and "yes" or "no")
			s = s .. ("Startlevel: %s  Endlevel: %s\n"):format(tostring(g.startlevel),tostring(g.endlevel))
			s = s .. ("Next: %s \n"):format(tostring(g.next))
			local labels = ""
			for label,steps in pairs(g.steplabels) do
				labels = labels .. " " .. label .. "="
				for i,step in ipairs(steps) do
					labels = labels .. tostring(step) .. ","
				end
			end
			s = s .. ("Steps: %d  Labels: %s\n"):format(#g.steps,labels)
		else
			s = s .. "(no guide loaded)\n"
		end
		report.guide = report.guide .. s
	else
		report.guide = report.guide .. "(skipped)\n"
	end

	report.step = "\n\n--- STEP ---\n"
	if self.Flags.step then
		local s = ""
		local step = ZGV.CurrentStep
		if step then
			for k,v in pairs(step) do
				local f

				if k=="map" then
					f=(ZGV.GetMapNameByID(step.map) or '') .. '#'..tostring(step.map) .. " /"..tostring(step.floor)
				elseif k=="waypath" then
					f=(#v.coords).." points"
				elseif k~="goals" and k~="L"
				 and k~="isobsolete" and k~="isauxiliary"
				 and k~="parentGuide"
				 and k~="prepared"
				 and type(v)~="function" then
					f = anytostring(v)
				end
				if f then
					s = s .. ("  %s: %s\n"):format(k,f)
				end
			end
			local complete,possible,progress = step:IsComplete()
			s = s .. ("  (%s, %s, %s)\n"):format(complete and "COMPLETE" or "incomplete", possible and "POSSIBLE" or "impossible", step:IsAuxiliary() and "AUX" or "not aux")

			s = s .. "Goals: \n"

			for i,goal in ipairs(step.goals) do
				s = s .. ("%d. %s %s\n"):format(i,(". "):rep(goal.indent),goal.text and "\""..goal.text.."\"" or "<"..goal:GetText()..">")
				for k,v in pairs(goal) do
					local f
					-- hide these completely
					if k~="map" and k~="mapL" and k~="x" and k~="y" and k~="dist" and k~="floor"
					and k~="L"
					and k~="indent" and k~="text" and k~="parentStep" and k~="num" and k~="status"
					-- these get their own display
					and k~="item" and k~="itemid"
					and k~="castspell" and k~="castspellid"
					and k~="quest" and k~="questid" and k~="questreqs"
					and k~="lasttext" and k~="lastbrief" and k~="lastshowcompleteness"
					and k~="mobs"
					and k~="target" and k~="targetid" and k~="objnum"
					and k~="condition_visible_raw" and k~="condition_complete_raw"
					and type(v)~="function" then
						f = anytostring(v)
					end
					if f then
						s = s .. ("    %s: %s\n"):format(k,f)
					end
				end
				if goal.x or goal.y or goal.action=="goto" then
					local map
					if goal.map then
						map = (ZGV.GetMapNameByID(goal.map) or '') .. ' #|cff888888'..tostring(goal.map) .. "|r /|cffffaa00"..tostring(goal.floor).."|r"
					else
						map = "unknown"
					end
					s = s .. ("    map: |cffffdd00%s|r |cffaaff00%s,%s|r"):format(map,goal.x or "-",goal.y or "-")
					if goal.dist then s = s .. ("|cffff8800 %s%s|r"):format(goal.dist>0 and ">" or "<",math.abs(goal.dist)) else s = s .. ("|cffff8800 (no dist)|r") end
					s = s .. "|r\n"
				end
				if goal.itemid or goal.item then
					s = s .. ("   item: \"%s\"  ##%s"):format(tostring(goal.item),tostring(goal.itemid))
					if goal.itemid then
						local a={ZGV:GetItemInfo(goal.itemid)}
						s = s .. ("  ZGV:GetItemInfo(%d) == %s\n"):format(goal.itemid,superconcat(a,","))
					elseif goal.item then
						local a={ZGV:GetItemInfo(goal.item)}
						s = s .. ("  ZGV:GetItemInfo(\"%s\") == %s\n"):format(goal.item,superconcat(a,","))
					end
				end
				if goal.castspellid or goal.castspell then
					s = s .. ("   castspell: \"%s\"  ##%s"):format(tostring(goal.castspell),tostring(goal.castspellid))
					if goal.castspellid then
						local spellData = GetSpellInfo(goal.castspellid)
						s = s .. ("  GetSpellInfo(%d) == %s\n"):format(goal.castspellid,spellData.name)
					elseif goal.castspell then
						local spellData = GetSpellInfo(goal.castspell)
						s = s .. ("  GetSpellInfo(\"%s\") == %s\n"):format(goal.castspell,spellData.name)
					end
				end
				if goal.questid and goal.quest then
					local questdata,inlog = ZGV.Localizers:GetQuestData(goal.questid)
					s = s .. ("    quest: \"%s\" ##%s"):format(questdata and questdata.title or "?",tostring(goal.questid))
					if goal.questid then
						if goal.objnum then
							if questdata and questdata.goals then
								local goaltext = questdata.goals[goal.objnum].item
								if not goaltext then goaltext="???" end
								s = s .. (" goal %d: \"%s\""):format(goal.objnum,goaltext)
							else
								s = s .. (" goal %d"):format(goal.objnum)
							end
						else
							s = s .. (" (no goal)")
						end
						if inlog then
							s = s .. "  - quest in log "
						else
							s = s .. "  - quest not in log "
						end
						if ZGV.completedQuests[goal.questid] then
							s = s .. "(id: completed)"
						else
							s = s .. "(id: not completed)"

							-- deprecating title storing totally, since GetQuestID is here.
							--[[
							if ZGV.completedQuestTitles[goal.quest] then
								s = s .. " (title: completed)"
							else
								s = s .. " (title: not completed)"
							end
							--]]
						end
					end
					s = s .. "\n"
				end
				if goal.target then
					s = s .. ("    target: \"%s\""):format(goal.target)
					if goal.targetid then
						s = s .. (" ##%d\n"):format(goal.targetid)
					end
					s = s .. "\n"
				end
				if goal.mobs then
					s = s .. "    mobs: "
					for k,v in ipairs(goal.mobs) do
						s = s .. v.name .. "  "
					end
					s = s .. "\n"
				end
				if goal.questreqs and #goal.questreqs>0 then
					s = s .. "    questreqs: "..superconcat(goal.questreqs,",").."\n"
				end
				if goal.condition_visible then
					s = s .. "    visibility condition: "..goal.condition_visible_raw.."\n"
				end
				if goal.condition_complete then
					s = s .. "    completion condition: "..goal.condition_complete_raw.."\n"
				end

				s = s .. "    Status: "..goal:GetStatus()

				if goal:IsCompleteable() then
					local comp,poss,prog,explanation,isbad = goal:IsComplete()
					s = s .. (" (%s, %s, %s progress, %s, '%s'%s)\n"):format(comp and "|cff00ff00COMPLETE|r" or "|cffffaa00incomplete|r", poss and "|cffbbff00POSSIBLE|r" or "|cff880000impossible|r", tostring(prog), step:IsAuxiliary() and "|cff8888ffAUX|r" or "|cff8888aanot aux|r" , tostring(explanation) or "-", isbad and " WARNING" or "")
				else
					s = s .. "  (|cff008800not completable|r)\n"
				end
			end
		else
			s = s .. "No current step loaded.\n"
		end
		report.step = report.step .. s
	else
		report.step = report.step .. "(skipped)\n"
	end

	report.itemscore = "\n\n-- Auto Equip Information --"
	if self.Flags.itemscore then
		local ItemScore = ZGV.ItemScore
		local Upgrades = ItemScore.Upgrades

		local s = ""

		local spec = ""
		if ZGV.IsRetail then
			spec = ("Spec: %s"):format(select(2,GetSpecializationInfo(ItemScore.playerspec or 0)))
		else
			spec = ("Build: %s"):format(ZGV.db.char.gear_selected_build or 0)
		end

		s = s .. ("Class: %s\nLevel: %s\n%s\n"):format(ItemScore.playerclass,ItemScore.playerlevel,spec)

		if ZGV.IsClassic or ZGV.IsClassicTBC or ZGV.IsClassicWOTLK then
			s = s .. "\n\n*** Skills: " 
			s = s .. "\n locale " .. GetLocale()
			s = s .. "\n** registered " 
			for i,v in pairs(ItemScore.Skills) do 
				s = s .. "\n " .. i .. " = " .. v
			end

			s = s .. "\n** raw " 
			for i=1, GetNumSkillLines() do
				local skillName, _, _, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType = GetSkillLineInfo(i);
				local skillTag = ItemScore.SkillNamesRev[skillName]
				s = s .. "\n " .. skillName .. " " .. (skillTag or "")
			end
		end

		s = s .. "\n\n*** Player statweights: " 
		for i,v in pairs(ItemScore.ActiveRuleSet.stats) do 
			s = s .. "\n " .. i .. " = " .. v
		end

		s = s .. "\n Fallback weight = " .. (ItemScore.ActiveRuleSet.whiteScoreWeight or 0)



		if Upgrades.EquippedItems then
			s = s.."\nCurrent Gear\n"

			for slot,info in pairs(Upgrades.EquippedItems) do
				s = s.."   "..slot.. (" - %s scored: %d\n"):format(info.itemlink or "no item", info.score or 0)
			end
		end
		if Upgrades.UpgradeQueue then
			s = s.."\nPossible Upgrades\n"

			for slot,info in pairs(Upgrades.UpgradeQueue) do
				if info.itemlink then
					s = s.."   "..slot.. (" - %s scored: %d\n"):format(info.itemlink or "no item", info.score or 0)
				end
			end
		end


		report.itemscore = report.itemscore .. s
	else
		report.itemscore = report.itemscore .. "(skipped)\n"
	end

	report.gearfinder = "\n\n-- Gear Finder Information --"
	if self.Flags.gearfinder then
		local s = ""
		s = s.."\nGearfinder Dungeons\n"
		ZGV.ItemScore.GearFinder.CurrentExpansion = (GetClassicExpansionLevel and GetClassicExpansionLevel()) or (GetServerExpansionLevel and GetServerExpansionLevel()) or 1

		for dungeon,dungeondata in pairs(ZGV.ItemScore.Items) do
			local valid, future, ident, maxscale, mythic, comment = ZGV.ItemScore.GearFinder:IsValidDungeon(dungeondata.dungeonmap or dungeondata.dungeon, dungeondata.instanceId)
			s = s..("%s%s %s, "):format(dungeondata.dungeonmap or dungeondata.dungeon, (valid and " ok" or ""), comment or "")
		end

		if ZGV.ItemScore.GearFinder.ResultsReady then
			s = s.."\nGearfinder Upgrades\n"
			for slot,upgrades in pairs(ZGV.ItemScore.GearFinder.UpgradeQueue) do
				s = s .. "\n slot "..slot..":"
				for _,upgrade in ipairs(upgrades) do
					s = s .. upgrade.itemlink ..","
				end
			end
		end
		report.gearfinder = report.gearfinder .. s
	else
		report.gearfinder = report.gearfinder .. "(skipped)\n"
	end

	report.questlog = "\n\n--- Cached quest log ---\n"
	if self.Flags.questlog then
		local s = ""
		if ZGV.quests then
			for index,quest in pairs(ZGV.quests) do
				s = s .. dumpquest(quest)
			end
		else
			s = s .. "(no quest log)"
		end
		s = s .. "\n"

		s = s .. "--- Cached quests, by ID ---\n"
		if ZGV.questsbyid then
			for id,quest in pairs(ZGV.questsbyid) do
				s = s .. ("#%d: %s\n"):format(id,quest.title)
			end
		else
			s = s .. "(no quest log)"
		end
		report.questlog = report.questlog .. s
	else
		report.questlog = report.questlog .. "(skipped)\n"
	end

	report.inventory = "\n\n--- Inventory ---\n"
	if self.Flags.inventory then
		local s = ""
		local inventory={}
		for bag=-2,4 do
			for slot=1,C_Container.GetContainerNumSlots(bag) do
				local link = C_Container.GetContainerItemLink(bag,slot)
				if link then
					local item = C_Container.GetContainerItemInfo(bag,slot)
					local id,name = string.match(link,"item:(%d-):.-|h%[(.-)%]")
					if name then
						tinsert(inventory,("    %s ##%d x%d\n"):format(name or "?",id or 0,item.stackCount or 0))
					else
						id,name = string.match(link,"battlepet:(%d-):.-|h%[(.-)%]")
						if name then
							tinsert(inventory,("    CAGED PET: %s ##%d x%d\n"):format(name or "?",id or 0,item.stackCount or 0))
						else
							tinsert(inventory,"    ? "..item)
						end
					end
				end
			end
		end
		table.sort(inventory)
		s = s .. table.concat(inventory,"")
		report.inventory = report.inventory .. s
	else
		report.inventory = report.inventory .. "(skipped)\n"
	end

	report.buffs = "\n\n-- Buffs --\n"
	do
		local s = ""
		for i=1,30 do
			local buff = GetAuraDataByIndex("player",i,"HELPFUL")
			if buff then s=s..("%s (%d)\n"):format(buff.name,buff.spellId) end
		end
		s = s .. "\n\n-- Debuffs --\n"
		for i=1,30 do
			local debuff = GetAuraDataByIndex("player",i,"HARMFUL")
			if debuff then s=s..("%s (%d)\n"):format(debuff.name,debuff.spellId) end
		end
		report.buffs = report.buffs .. s
	end

	report.petbar = "\n\n-- Pet action bar --\n"
	do
		local s = ""
		for i=1,12 do
			local name,texid = GetPetActionInfo(i)
			if name then s=s..("%d. %s (\"%s\")\n"):format(i,name,texid) end
		end
		report.petbar = report.petbar .. s
	end

	report.taxis = "\n\n-- Flight Paths --\n"
	if ZGV.LibTaxi then
		local s = ""
		s = s .. table.concat(ZGV.TableKeys(ZGV.db.char.taxis)," , ")
		report.taxis = report.taxis .. s
	end

	report.travel = "\n\n-- Travel Route --\n"
	local s = ""
	s = self:GetReport_Travel() .. "\n"  -- moved out, to reuse by StepFeedback
	report.travel = report.travel .. s

	report.options = "\n\n-- Options --\n"
	do
		local s = ""
		s = s .. "Profile:\n"
		local profile_s = ""
		for k,v in pairs(ZGV.db.profile) do profile_s = profile_s .. "  "..k.." = "..anytostring(v)..",  " end
		if #profile_s>1000 then
			profile_s = profile_s:sub(1,1000) .. "\n--TERMINATED at 1k--\n"
		end
		s = s .. profile_s
		report.options = report.options .. s
	end

	--s = s .. ZGV:DumpVal(ZGV.quests,0,4,true)
	--ZGV:Print(s)
	report.errors = "-- Errors --\n"
	if ZGV.ErrorLogger_GetErrors then
		local s = ""
		local errors = ZGV:ErrorLogger_GetErrors()
		if #errors>0 then
			for ei,err in ipairs(errors) do s = s .. "----------------\nTime: "..(err.time or "?").."\nCount: "..(err.count or 1).."\nError: \n"..tostring(err.message).."\n----------------\n" end
		end
		report.errors = report.errors .. s
	else
		report.errors = report.errors .. "(n/a)\n"
	end

	report.log = "-- Log --\n"
	do
		local s = ""
		s = s .. ZGV.Log:Dump(100)
		report.log = report.log .. s
	end

	report.sync = "-- Sync --\n"
	do
		local s = ""
		if ZGV.db.profile.sync_enabled then s = s .. "Sync enabled: true\n" else s = s .. "Sync enabled: false\n" end
		if ZGV.db.profile.share_masterslave == 0 then s = s .. "Sync mode: disabled\n" elseif ZGV.db.profile.share_masterslave == 1 then s = s .. "Sync mode: master\n" else s = s .. "Sync mode: slave\n" end
		report.sync = report.sync .. s
	end

	local sections = {'player','parser','guide','step','itemscore','gearfinder','questlog','inventory','buffs','petbar','taxis','travel','options','errors','log','sync'}
	local limit_bypass = {gearfinder=15000}
	local s = ""
	local limit = 5000
	for _,k in ipairs(sections) do
		local ss = report[k]
		if #ss>(limit_bypass[k] or limit) then ss=ss:sub(1,(limit_bypass[k] or limit)).."\n ["..#ss.." chars, cut at "..(limit_bypass[k] or limit).."]\n" end
		s = s .. ss
	end
	return s,report
end

function BugReport:GenerateAndShow(maint)
	local report = self:GetReport(maint)

	local title = maint and "Zygor Guides Viewer" or (ZGV.CurrentGuideName or L["report_notitle"])
	local author = maint and "zygor@zygorguides.com" or (ZGV.CurrentGuide and ZGV.CurrentGuide.author or L["report_noauthor"])

	title = L["report_title"..(ZGV.DEV and "_2" or "")]:format(title,author)

	ZGV.GuideMenu:Hide()
	ZGV:ScheduleTimer(function() Screenshot() end, 0.5)
	ZGV:ScheduleTimer(function() self:ShowReportDialog(report) end, 0.6)
end


function BugReport:SaveDump(text,timestamp,header,addonmodule,severity,geardump)
	timestamp = timestamp or time()
	ZGV.db.global.bugreports = ZGV.db.global.bugreports or {}
	ZGV.db.global.bugreports[timestamp]=self:FormatDumpForUpload(text,header,addonmodule,severity,geardump)
	if ZGV.DEV then
		if GuideRating.GuideRatingViewer then 
			ZGV:Debug("Guide rating saved for upload.")
		else 
			ZGV:Debug("Bug report saved for upload.")
			ZGV:ShowDump(ZGV.db.global.bugreports[timestamp])
		end
	end
end

function BugReport:PruneDumps()
	if not ZGV.db.global.bugreports then return end
	for timestamp,report in pairs(ZGV.db.global.bugreports) do
		if (time()-timestamp > 86400*7)  -- remove week old
		or (#report==0)  -- remove empty?
		or (report:find("bug_report_sent=1"))  -- remove sent
		then ZGV.db.global.bugreports[timestamp]=nil end
	end
end

function BugReport:GetUniqueId()
	local guid = UnitGUID("player"):gsub("Player%-","")
	local time = ("%.03f"):format(GetTime())
	return guid..":"..time
end

function BugReport:SimpleDump(tab)
	local t={}
	for k,v in pairs(tab) do tinsert(t,("%s=%s"):format(k,(tonumber(v) and v or "\""..tostring(v).."\""))) end
	return table.concat(t,"\n").."\n"
end

function BugReport:FormatDumpForUpload(content,more_headers,addonmodule,severity,geardump)
	local header = ""
	header = header .. "bug_report_id="..self:GetUniqueId().."\n"
	header = header .. "bug_report_sent=0\n"
	header = header .. "bug_report_time="..time().."\n"
	header = header .. "bug_report_version="..ZGV.version.."\n"
	header = header .. "bug_report_player="..BugReport:GetReport_Player_Basic().."\n"
	header = header .. "bug_report_loc="..BugReport:GetReport_Player_Location().."\n"
	if addonmodule then
		header = header .. "bug_report_module="..addonmodule.."\n"
		header = header .. "bug_report_severity="..severity.."\n"
	end
	if geardump then
		header = header .. "bug_report_gearreport="..geardump.."\n"
	end
	if addonmodule == "travel" then
		header = header .. "bug_report_travelreport="..BugReport:GetReport_Travel().."\n"
	end
	if more_headers then header = header .. more_headers end

	return ("%s\n%s\n---->>\n%s\n<<----\n%s"):format("%%BUG_REPORT_START%%",header,content,"%%BUG_REPORT_END%%")
end

function BugReport:GetDumpBody(report)
	return report:match("%-%-%-%->>\n(.-)\n<<%-%-%-%-")
end

function ZGV:ShowDump(text,title,options)
	local f
	HideUIPanel(InterfaceOptionsFrame)
	HideUIPanel(ZygorGuidesViewerMaintenanceFrame)

	if type(text)=="table" then text=ZGV:Serialize(text) end
	text = tostring(text)

	if not self.BugReport.dumpFrameBasic then CreateDumpFrameBasic() end
	f = self.BugReport.dumpFrameBasic

	width = max(250,options and options.width or 900)
	height = max(130,options and options.height or 570)

	f:SetSize(width,height)

	f.editBox:SetText(text:gsub("[^%w%p%s]",function(c) return ("\\%d"):format(strbyte(c)) end)) -- fix for out-of-ascii chars
	f.title:SetText(title or "Generic dump:")
	f:SetFrameLevel(999)

	if options and options.copy then
		f.editBox:HighlightText(0)
		f.editBox:SetFocus(true)
	end

	if f.oldreports then
		if options and options.hidedev then
			f.oldreports:Hide()
		else
			f.oldreports:Show()
		end
	end

	ShowUIPanel(f)
end

--local DELAYFRAME
function BugReport:DelayedShowReportDialog(report)
	--if not DELAYFRAME then DELAYFRAME=CreateFrame("FRAME") end
	--DELAYFRAME:SetScript("OnUpdate",function(self) ZGV:ShowReportDialog(report) self:SetScript("OnUpdate",nil) end)
	ZGV:ScheduleTimer(function() ZGV.BugReport:ShowReportDialog(report) end, 0.5)
end

function BugReport:ShowReportDialog(report)
	if not self.dumpFrameReport then CreateDumpFrameReport() end
	local f = self.dumpFrameReport

	f.timestamp = time()
	f.save = true
	f.text = report

	-- Clear the text
	f.edit1Box:SetText("")
	f.edit2Box:SetText("")
	--f.edit3Box:SetText("")

	ShowUIPanel(f)

	f.edit1Box:SetFocus(true)
end

function ZGV:DumpVal(val,lev,maxlev,nofun)
	if not lev then lev=1 end
	if not maxlev then maxlev=1 end

	if lev>maxlev then return ("...") end
	local s = ""
	if type(val)=="string" then
		s = ('"%s"'):format(val)
	elseif type(val)=="number" then
		s = ("%s"):format(tostring(val))
	elseif type(val)=="function" then
		s = ("")
	elseif type(val)=="table" then
		s = "\n"
		for k,v in pairs(val) do
			if type(k)~="string" or not k:find("^parent")
			then
				if type(v)~="function" then
					s = s .. ("   "):rep(lev) .. ("%s=%s"):format(k,self:DumpVal(v,lev+1,maxlev,nofun))
				elseif not nofun then
					s = s .. ("   "):rep(lev) .. ("%s(function)\n"):format(k)
				end
			end
		end
	end

	return s.."\n"
end

local looped

local lua_reserved_words = {}
for _, v in ipairs ({
    "and", "break", "do", "else", "elseif", "end", "false",
    "for", "function", "if", "in", "local", "nil", "not", "or",
    "repeat", "return", "then", "true", "until", "while"
}) do lua_reserved_words [v] = true end
local function safe_word(s)
	return not lua_reserved_words[s] and s:match("^%a[%a%d]*$")
end

local function escape(s)
	return '"' .. s:gsub('\\','\\\\'):gsub('"','\\"') .. '"'
end

local function alphasort(a,b)
	local na,nb=tonumber(a),tonumber(b)
	if na and nb then return na<nb end
	if na and not nb then return true end
	if nb and not na then return false end
	return tostring(a)<tostring(b)
end

function ZGV:Serialize(val,lev)
	lev=lev or 0
	if lev==0 then looped={} end
	local s = ""
	local indent = ""
	for i=1,lev do indent=indent.."  " end

	if type(val)=="string" then
		s = ('"%s"'):format(val)
	elseif type(val)=="number" then
		s = ("%s"):format(tostring(val))
	elseif type(val)=="function" then
		s = ("nil  --function")
	elseif type(val)=="table" then
		if looped[val] then return "nil --loop!" end
		looped[val]=true
		s = "{"
		local keys = {}
		for k,v in pairs(val) do tinsert(keys,k) end
		table.sort(keys,alphasort)
		for _,k in ipairs(keys) do
			local v = val[k]
			s = s .. "\n" .. indent .. "  "
			if type(k)=="number" then s = s .. "[" .. tostring(k) .. "]"
			elseif type(k)=="string" then
				if safe_word(k) then s = s .. k
				else s = s .. '[' .. escape(k) .. ']'
				end
			end
			s = s .. " = " .. self:Serialize(v,lev+1) .. ","
		end
		s = s .. "\n" .. indent .. "}"
	elseif type(val)=="nil" then
		s = "nil"
	elseif type(val)=="boolean" then
		s = tostring(val)
	end

	return s
end


function BugReport:ApplySkin()
	if self.dumpFrameBasic then

		local function set_alpha(new_a,r,g,b,a) return r,g,b,new_a*a end
		local OPACITY = SkinData("UseOpacity") and ZGV.db.profile.opacity or  1

		CHAIN(self.dumpFrameBasic)
			:SetBackdrop(SkinData("BugBackdrop"))
			:SetBackdropColor(set_alpha(OPACITY,unpack(SkinData("BugBackdropColor"))))
			:SetBackdropBorderColor(set_alpha(OPACITY,unpack(SkinData("BugBackdropBorderColor"))))

		CHAIN(self.dumpFrameBasic.editBox)
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))

		CHAIN(self.dumpFrameBasic.edit1Box)
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))

		CHAIN(self.dumpFrameBasic.edit2Box)
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))
	end
end


function StepFeedback:CreateFrame(itemlink)
	if self.Frame then return end
	local frame = CHAIN(ui:Create("Frame",UIParent))
		:SetSize(600,300)
		:SetPoint("CENTER", UIParent, "CENTER")
		:SetFrameStrata("FULLSCREEN")
		:CanDrag(true)
		:Hide()
		.__END
	self.Frame = frame

	frame.title = CHAIN(frame:CreateFontString())
		:SetFont(FONTBOLD,15,"")
		:SetJustifyH("LEFT")
		:SetPoint("TOP",frame,0,-5)
		:SetText(L["bugreport_step_title"])
		.__END

	frame.typetext = CHAIN(frame:CreateFontString())	--"Please select a feedback type"
		:SetFont(FONT,12,"")
		:SetJustifyH("LEFT")
		:SetPoint("TOP",frame.title,"BOTTOM",0,-7)
		:SetPoint("LEFT",frame,10,0)
		:SetText(L["bugreport_step_type"])
		:SetWidth(200)
		.__END

	frame.typeguide = CHAIN(ui:Create("Button",frame))	--Guide button
		:SetPoint("LEFT",frame.typetext,"RIGHT",10,0)
		:SetSize(100,20)
		:SetText("Guide")
		:SetFont(FONT,12)
		:SetScript("OnClick",function()
			StepFeedback.ReportMode = "guide"
			StepFeedback.Frame:UpdateLayout()
		end)
		:SetNormalBackdropColor(unpack(SkinData("ButtonColor1")))
	.__END
	frame.typeaddon= CHAIN(ui:Create("Button",frame))	--Addon button
		:SetPoint("LEFT",frame.typeguide,"RIGHT",10,0)
		:SetSize(100,20)
		:SetText("Addon")
		:SetFont(FONT,12)
		:SetScript("OnClick",function()
			StepFeedback.ReportMode = "addon"
			StepFeedback.Frame:UpdateLayout()
		end)
		:SetNormalBackdropColor(0.1,0.1,0.1,1)
	.__END

	local modules = {
		{value="default", text=L["bugreport_step_default"]},
		{value="guideviewer", text=L["bugreport_step_comp_guideviewer"]},
		{value="share", text=L["bugreport_step_comp_share"]},
		{value="guidemenu", text=L["bugreport_step_comp_guidemenu"]},
		{value="featured", text=L["bugreport_step_comp_featured"]},
		{value="widgets", 	text=L["bugreport_step_comp_widgets"]},
		{value="travel", text=L["bugreport_step_comp_travel"]},
		{value="findNPC", text=L["bugreport_step_comp_findNPC"]},
		{value="notifications", text=L["bugreport_step_comp_notifications"]},
		{value="gearsuggestion", text=L["bugreport_step_comp_gearsuggestion"]},
		{value="gearfinder", text=L["bugreport_step_comp_gearfinder"]},
		{value="auction", text=L["bugreport_step_comp_auctiontools"]},
		{value="poi", 	text=L["bugreport_step_comp_poi"]},
		{value="talentadvisor", text=L["bugreport_step_comp_talentadvisor"]},
		{value="settings", text=L["bugreport_step_comp_settings"]},
		{value="other",	text=L["bugreport_step_comp_other"]},
	}

	local severity = {
		{value="default", text=L["bugreport_step_severity0"]},
		{value="high", text=L["bugreport_step_severity1"]},
		{value="medium", text=L["bugreport_step_severity2"]},
		{value="low", text=L["bugreport_step_severity3"]},
	}

	frame.addoncontainer = CHAIN(CreateFrame("Frame",nil,frame))
		:SetPoint("TOPLEFT",frame.typetext,"BOTTOMLEFT",0,-10)
		:SetSize(200,30)
		:Hide()
	.__END

	frame.componenttext = CHAIN(frame.addoncontainer:CreateFontString())	--"Please select a component"
		:SetFont(FONT,12,"")
		:SetJustifyH("LEFT")
		:SetPoint("TOPLEFT",frame.addoncontainer,"TOPLEFT")
		:SetText(L["bugreport_step_component"])
		:SetWidth(200)
	.__END

	frame.addonmodule= CHAIN(ui:Create("DropDown",frame.addoncontainer,2,frame:GetFrameLevel()+2))
		:SetPoint("LEFT",frame.componenttext,"RIGHT",10,0)
		:SetSize(250,20)
	.__END
	frame.addonmodule.frame:SetBackdropColor(0.1,0.1,0.1,1)

	frame.severitytext = CHAIN(frame.addoncontainer:CreateFontString())	--"Tell us how severe the issue is"
		:SetFont(FONT,12,"")
		:SetJustifyH("LEFT")
		:SetPoint("TOPLEFT",frame.componenttext,"BOTTOMLEFT",0,-10)
		:SetText(L["bugreport_step_severity"])
		:SetWidth(200)
		.__END

	frame.severity= CHAIN(ui:Create("DropDown",frame.addoncontainer,2,frame:GetFrameLevel()+2))	--"Issue is minor and.."
		:SetPoint("LEFT",frame.severitytext,"RIGHT",10,0)
		:SetSize(250,20)
	.__END
	frame.severity.frame:SetBackdropColor(0.1,0.1,0.1,1)

	for optnum,opt in ipairs(modules) do
		local item = frame.addonmodule:AddItem(opt.text,opt.value)
	end
	frame.addonmodule:SetCurrentSelectedByValue("default")

	for optnum,opt in ipairs(severity) do
		local item = frame.severity:AddItem(opt.text,opt.value)
	end
	frame.severity:SetCurrentSelectedByValue("default")
	
	frame.close = CHAIN(CreateFrame("Button",nil,frame,"ZGV_DefaultSkin_TitleButton_Template"))
		:SetPoint("TOPRIGHT",frame,"TOPRIGHT", -5, -4)
		:SetScript("OnClick", function() 
			frame.errEditbox:Hide()
			frame.errMessage:Hide()
			frame.errComponent:Hide()
			frame.errSeverity:Hide()
			StepFeedback.ReportMode = "guide"
			StepFeedback.Frame:UpdateLayout()
			StepFeedback:Hide()
		 end)
		.__END
	frame.close.buttonkey = "CLOSE"
	frame.close:ApplySkin()

	frame.scroll = CHAIN(ui:Create("ScrollChild",frame,nil,"editbox"))	--Input box
		:SetPoint("TOP",frame.typetext,"BOTTOM",0,-15)
		:SetPoint("LEFT",frame,10,0)
		:SetSize(580,235)
		:MySetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -1, 38)
		:HookScript("OnShow",function(me)
			if frame.editBox:GetText() == "" then
				frame.editBox:SetText(frame.editBox.placeholder)
				frame.editBox:SetTextColor(1,1,1,0.7)
			end
		end)
	.__END

	frame.scroll.child:SetScript("OnEscapePressed", function() frame.save=nil frame:Hide() end)
	frame.editBox = frame.scroll.child	

	if itemlink then
		frame.editBox.placeholder = L["bugreport_step_message_gear"]:format(itemlink)
	else
		if StepFeedback.ReportMode == nil or StepFeedback.ReportMode == "Guide" then
			frame.editBox.placeholder = L["bugreport_step_message"]
		else
			frame.editBox.placeholder = L["bugreport_step_message_addon"]
		end
	end

	frame.editBox:SetScript("OnEditFocusLost",function(self)
		if self:GetText()=="" then
			self:SetText(self.placeholder)
			self:SetTextColor(1,1,1,0.7)
		end
	end)
	frame.editBox:SetScript("OnEditFocusGained",function(self)
		if self:GetText()==self.placeholder then
			self:SetText("")
			self:SetTextColor(1,1,1,1)
		end
	end)

	frame.buttonsubmit = CHAIN(ui:Create("Button",frame))
		:SetSize(180,25)
		:SetText(L["bugreport_step_submit"])
		:SetFont(FONTBOLD,14,"")
		:SetPoint("BOTTOMRIGHT", frame, -10,5)
		:SetScript("OnClick",function(self)
			if self:GetParent().old_timestamp then ZGV.db.global.bugreports[self:GetParent().old_timestamp]=nil end
			frame.errEditbox:Hide()
			frame.errMessage:Hide()
			frame.errComponent:Hide()
			frame.errSeverity:Hide()

			if StepFeedback.ReportMode == "guide" then
				if self:GetParent().editBox:GetText() ~= L["bugreport_step_message"] then
					StepFeedback:Save(self:GetParent().editBox:GetText())
					frame.errEditbox:Hide()
					frame.errMessage:Hide()
					self:GetParent().editBox:SetText(L["bugreport_step_message"])
				else
					frame.errEditbox:Show()
					frame.errMessage:SetText(L["bugreport_step_nofeed"])
					frame.errMessage:Show()
				end
			else
				if self:GetParent().editBox:GetText() ~= L["bugreport_step_message_addon"] and frame.addonmodule:GetCurrentSelectedItemValue() ~= "default" and frame.severity:GetCurrentSelectedItemValue() ~= "default" or ZGV.DEV then
					local geardump = ""
					if StepFeedback.itemlink then
						geardump = ZGV.ItemScore.Upgrades:GetGearReport(StepFeedback.itemlink)
						ZGV.ItemScore.Upgrades:SetBadUpgrade(StepFeedback.itemString,StepFeedback.slot)	-- Send it to BadUpgrades because they don't want it suggested again.
						ZGV:Print(StepFeedback.itemlink.." will no longer be suggested as an upgrade.")
						StepFeedback.itemlink = nil
						StepFeedback.itemString = nil
						StepFeedback.slot = nil
					end

					StepFeedback:Save(self:GetParent().editBox:GetText(),frame.addonmodule:GetCurrentSelectedItemValue(),frame.severity:GetCurrentSelectedItemValue(), geardump)
					frame.errEditbox:Hide()
					frame.errMessage:Hide()
					frame.errComponent:Hide()
					frame.errSeverity:Hide()
					self:GetParent().editBox:SetText(L["bugreport_step_message"])
				else
					if self:GetParent().editBox:GetText() == L["bugreport_step_message_addon"]  then frame.errEditbox:Show() end
					if frame.addonmodule:GetCurrentSelectedItemValue() == "default" then frame.errComponent:Show() end
					if frame.severity:GetCurrentSelectedItemValue() == "default" then frame.errSeverity:Show() end
					frame.errMessage:SetText(L["bugreport_step_addoninfo"])
					frame.errMessage:Show()
				end
			end
		end)
		:SetPushedBackdropColor(unpack(SkinData("Accent")))
	.__END

	function frame:UpdateLayout(ftype, component, itemlink)
		local height = frame.editBox:GetHeight() + frame.buttonsubmit:GetHeight()
		if StepFeedback.ReportMode == "guide" then
			frame.addoncontainer:Hide()
			frame.typeguide:SetNormalBackdropColor(unpack(SkinData("ButtonColor1")))
			frame.typeaddon:SetNormalBackdropColor(0.1,0.1,0.1,1)
			frame.scroll:SetPoint("TOP",frame.typetext,"BOTTOM",0,-15)
			if frame.editBox:GetText() == L["bugreport_step_message_addon"] or string.match(frame.editBox:GetText(), "Please explain why you feel") then frame.editBox:SetText(L["bugreport_step_message"]) end
			frame.editBox.placeholder = L["bugreport_step_message"]
			frame.errEditbox:Hide()
			frame.errMessage:Hide()
			frame.errComponent:Hide()
			frame.errSeverity:Hide()
		else
			frame.addoncontainer:Show()
			frame.typeguide:SetNormalBackdropColor(0.1,0.1,0.1,1)
			frame.typeaddon:SetNormalBackdropColor(unpack(SkinData("ButtonColor1")))
			frame.scroll:SetPoint("TOP",frame.addoncontainer,"BOTTOM",0,-15)
			if itemlink then
				frame.editBox.placeholder = L["bugreport_step_message_gear"]:format(itemlink)
			else
				if frame.editBox:GetText() == L["bugreport_step_message"] or string.match(frame.editBox:GetText(), "Please explain why you feel") then
					frame.editBox.placeholder = L["bugreport_step_message_addon"]
					frame.editBox:SetText(L["bugreport_step_message_addon"])
				end
			end
			frame.errEditbox:Hide()
			frame.errMessage:Hide()
		end
	end


	----------------Error messages------------------
	frame.errEditbox = CHAIN(ui:Create("Frame",frame))
		:SetBackdropColor(0,0,0,0)
		:SetBackdropBorderColor(83/255,33/255,11/255,1)
		:SetPoint("TOPLEFT", frame.scroll)
		:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -15, 40)
		:Hide()
	.__END

	frame.errComponent = CHAIN(ui:Create("Frame",frame))
		:SetBackdropColor(0,0,0,0)
		:SetBackdropBorderColor(83/255,33/255,11/255,1)
		:SetPoint("TOPLEFT", frame.typeguide, "BOTTOMLEFT", -1, -2)
		:SetSize(252,22)
		:Hide()
	.__END

	frame.errSeverity = CHAIN(ui:Create("Frame",frame))
		:SetBackdropColor(0,0,0,0)
		:SetBackdropBorderColor(83/255,33/255,11/255,1)
		:SetPoint("TOPLEFT", frame.errComponent, "BOTTOMLEFT")
		:SetSize(252,22)
		:Hide()
	.__END

	frame.errMessage = CHAIN(frame:CreateFontString())
		:SetFont(FONT,12,"")
		:SetJustifyH("LEFT")
		:SetSize(290,30)
		:SetPoint("RIGHT",frame.buttonsubmit,"LEFT",-10,0)
		:SetText(L["bugreport_step_nofeed"])
		:Hide()
	.__END


	ZGV:AddMessageHandler("SKIN_UPDATED",{self,"ApplySkin"})
	self:ApplySkin()
end

function StepFeedback:Clear(ftype, component, itemlink)
	self.Frame.editBox:SetText("")
	self.Frame.severity:SetCurrentSelectedByValue("default")
	if not ftype and not component then
		self.ReportMode = "guide"
		self.Frame.addonmodule:SetCurrentSelectedByValue("default")
	else
		if ftype then self.ReportMode = "addon" end
		if component then self.Frame.addonmodule:SetCurrentSelectedByValue(component) end
	end
	StepFeedback.Frame:UpdateLayout(ftype, component, itemlink)
end

function StepFeedback:ApplySkin()
	if self.Frame then
		CHAIN(self.Frame)
			:SetBackdrop(SkinData("BugBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugBackdropColor")))
			:SetBackdropBorderColor(unpack(SkinData("BugBackdropBorderColor")))

		CHAIN(self.Frame.scroll)
			:SetBackdrop(SkinData("BugEditBackdrop"))
			:SetBackdropColor(unpack(SkinData("BugEditBackdropColor")))
	end
end

function StepFeedback:Show(ftype, component, itemlink)
	self:CreateFrame(itemlink)
	self:Clear(ftype, component, itemlink)
	local timestamp,report = self:FindStepReportForCurrentStep(itemlink)
	if report then
		self.Frame.old_timestamp = timestamp
		self.Frame.editBox:SetText(report)
	else
		self.Frame.old_timestamp = nil
	end
	self.Frame:Show()
end

function StepFeedback:Hide()
	self:Clear()
	self.Frame:Hide()
end

function StepFeedback:GetGuideStepSignature()
	return (ZGV.CurrentGuide and ZGV.CurrentGuide.title or "??").."::"..(ZGV.CurrentStep and ZGV.CurrentStep.num or "??")
end

function StepFeedback:GetStepReportHeader()
	return
		"bug_report_guide="..self:GetGuideStepSignature().."\n"..
		"bug_report_steplabel="..(ZGV.CurrentStep and ZGV.CurrentStep.reportlabel).."\n"..
		"bug_report_steptxt="..(ZGV.CurrentStep and ZGV.CurrentStep:GetDebugDump():gsub("\n",";;") or "").."\n"..
		"bug_report_chain="..ZGV.QuestDB:ExplainStep().."\n"
end

function StepFeedback:FindStepReportForCurrentStep(itemlink)
	if not ZGV.db.global.bugreports then return end
	if itemlink then return end
	--if StepFeedback.ReportMode == "addon" then return end
	--if string.match(self.Frame.editBox:GetText(), "Please explain why you feel") then self.Frame.editBox:SetText(L["bugreport_step_message"]) end
	if string.match(self.Frame.editBox:GetText(), "Please explain why you feel") then return end
	local signature = self:GetGuideStepSignature().."\n" -- look for Name\\Of\\Guide::123\n
	for timestamp,report in pairs(ZGV.db.global.bugreports) do
		if report:find(signature,1,true) then return timestamp,BugReport:GetDumpBody(report) end
	end
end

function StepFeedback:Save(text,addonmodule,severity,geardump)
	BugReport:SaveDump(text,time(),self:GetStepReportHeader(),addonmodule,severity,geardump)
	self:Hide()
end

function StepFeedback:ShowTooltip(text)
	ZGV.ChainCall(GameTooltip)
		:SetOwner(ZGV.Frame, "ANCHOR_TOP")
		:SetText(L['bugreport_step_tooltip'])
		:AddLine(L['bugreport_step_tooltip2'])
		:Show()
end


---@return string|boolean
local function getNextGuideTitleSafely(where)
	local nextg = ZGV.CurrentGuide.next
	if not nextg then return false end
	local nextguide = ZGV:GetGuideByTitle(nextg)
	if not nextguide then return ZGV:Error("Cannot find next guide ("..where.."): "..nextg) end
	return nextguide.title_short
end

function GuideRating:NextRatingGuide(source)
	local nextGuide = ZGV.CurrentGuide.next
	local scored = ZGV.db.char.scoredguides[nextGuide]

	if scored == "declined" or not nextGuide then	---Only if the guide popped up as a next invalid guide and was declined by the user
		if not GuideRating.NoRatingFrame then
			GuideRating:CreateAltFrame()
		else
			GuideRating.NoRatingFrame:Show()
		end
		return
	end

	ZGV:SetGuide(nextGuide, nil, nil, nil, ZGV.CurrentGuide)
end

function GuideRating:CreateFrame()

	local feedbacktext
	local frame

	frame = CHAIN(ZGV.UI:Create("Frame", nil))
			:SetHeight(220)
			:SetBackdropColor(0,0,0,0)
			:CanDrag(false)
		.__END
	GuideRating.GuideRatingViewer=frame
	GuideRating.GuideRatingViewer:Hide()

	frame.frameFS = CHAIN(frame:CreateFontString())
		:SetFont(ZGV.Font,12,"")
		:SetTextColor(1,1,1,1)
		:SetPoint("LEFT",frame)
		:SetPoint("RIGHT",frame)
		:SetJustifyH("CENTER")
		:SetHeight(60)
	.__END

	frame.face1 = CHAIN(CreateFrame("Button",nil,frame,"ZGV_Guide_Rating_Star_Template"))
		:SetPoint("TOP",frame.frameFS,"BOTTOM",-50,-5)
		:SetSize(35,35)
        .__END
	frame.face1.ButtonNumber = 3
	ZGV.ButtonSets.RatingButtons.HAPPY:AssignToButton(frame.face1)

	frame.face2 = CHAIN(CreateFrame("Button",nil,frame,"ZGV_Guide_Rating_Star_Template"))
		:SetPoint("TOP",frame.frameFS,"BOTTOM",0,-5)
		:SetSize(35,35)
        .__END
	frame.face2.ButtonNumber = 2
	ZGV.ButtonSets.RatingButtons.INDIFFERENT:AssignToButton(frame.face2)

	frame.face3 = CHAIN(CreateFrame("Button",nil,frame,"ZGV_Guide_Rating_Star_Template"))
		:SetPoint("TOP",frame.frameFS,"BOTTOM",50,-5)
		:SetSize(35,35)
        .__END
	frame.face3.ButtonNumber = 1
	ZGV.ButtonSets.RatingButtons.UNHAPPY:AssignToButton(frame.face3)

	frame.facesbgleft = CHAIN(CreateFrame("Button","ZGVFaceBGLeft",frame))
		:SetPoint("TOPLEFT",frame.face1, -25,0)
		:SetPoint("BOTTOMRIGHT",frame.face1,"BOTTOMLEFT")
		:SetScript("OnLeave", function()
			if GuideRating.score == nil then
				frame.face1:SetAlpha(1)
				frame.face2:SetAlpha(1)
				frame.face3:SetAlpha(1)
			elseif GuideRating.score == 3 then
				frame.face1:SetAlpha(1)
				frame.face2:SetAlpha(0.3)
				frame.face3:SetAlpha(0.3)
			elseif GuideRating.score == 2 then
				frame.face1:SetAlpha(0.3)
				frame.face2:SetAlpha(1)
				frame.face3:SetAlpha(0.3)
			elseif GuideRating.score == 1 then
				frame.face1:SetAlpha(0.3)
				frame.face2:SetAlpha(0.3)
				frame.face3:SetAlpha(1)
			end
		end)
	.__END

	frame.facesbgright = CHAIN(CreateFrame("Button","ZGVFaceBGRight",frame))
		:SetPoint("TOPRIGHT",frame.face3,"TOPRIGHT", 25,0)
		:SetPoint("BOTTOMLEFT",frame.face3,"BOTTOMRIGHT")
		:SetScript("OnLeave", function()
			if GuideRating.score == nil then
				frame.face1:SetAlpha(1)
				frame.face2:SetAlpha(1)
				frame.face3:SetAlpha(1)
			elseif GuideRating.score == 3 then
				frame.face1:SetAlpha(1)
				frame.face2:SetAlpha(0.3)
				frame.face3:SetAlpha(0.3)
			elseif GuideRating.score == 2 then
				frame.face1:SetAlpha(0.3)
				frame.face2:SetAlpha(1)
				frame.face3:SetAlpha(0.3)
			elseif GuideRating.score == 1 then
				frame.face1:SetAlpha(0.3)
				frame.face2:SetAlpha(0.3)
				frame.face3:SetAlpha(1)
			end
		end)
	.__END

	frame.facesbgmiddle = CHAIN(CreateFrame("Button","ZGVFaceBGMid",frame))
		:SetPoint("TOPLEFT",frame.face1,"TOPLEFT")
		:SetPoint("BOTTOMRIGHT",frame.face3,"BOTTOMRIGHT")
		:SetScript("OnEnter", function()
			frame.face1:SetAlpha(0.3)
			frame.face2:SetAlpha(0.3)
			frame.face3:SetAlpha(0.3)
		end)
		:SetScript("OnLeave", function()
			if ZGV.BugReport.GuideRating.score == nil then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 3 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 2 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 1 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(1)
			end
		end)
	.__END

	frame.facesbgtop = CHAIN(CreateFrame("Button","ZGVFaceBGTop",frame))
		:SetPoint("CENTER",frame.face2,0,35)
		:SetSize(200,35)
		:SetScript("OnLeave", function()
			if ZGV.BugReport.GuideRating.score == nil then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(1)
			elseif ZGV.BugReport.GuideRating.score == 3 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 2 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 1 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(1)
			end
		end)
	.__END

	frame.facesbgbottom = CHAIN(CreateFrame("Button","ZGVFaceBGBottom",frame))
		:SetPoint("CENTER",frame.face2,0,-35)
		:SetSize(200,35)
		:SetScript("OnLeave", function()
			if ZGV.BugReport.GuideRating.score == nil then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(1)
			elseif ZGV.BugReport.GuideRating.score == 3 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 2 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(1)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
			elseif ZGV.BugReport.GuideRating.score == 1 then
				ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
				ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(1)
			end
		end)
	.__END

	frame.scroll = CHAIN(ZGV.UI:Create("ScrollChild",frame,nil,"editbox"))
		:SetPoint("TOPLEFT",frame.frameFS,0,-110)
		:SetPoint("BOTTOMRIGHT",frame,-18,45) 
		:HookScript("OnLoad",function(me) me.child:SetFocus(false) end)
	.__END

	local feedbackboxbackdrop = frame:CreateTexture(nil, "ARTWORK")
		feedbackboxbackdrop:SetPoint("LEFT",frame.scroll.child,"LEFT")
		feedbackboxbackdrop:SetPoint("TOPRIGHT",frame.scroll,"TOPRIGHT")
		feedbackboxbackdrop:SetPoint("BOTTOMRIGHT",frame.scroll,"BOTTOMRIGHT")
		feedbackboxbackdrop:SetColorTexture(0,0,0,1)

	frame.scroll.child:SetScript("OnLeave",function(self) GameTooltip:Hide() end)

	frame.buttonsubmit = CHAIN(ZGV.UI:Create("Button",frame))
		:SetSize(80,20)
		:SetText(L["bugreport_step_submit"])	
		:SetFont(FONTBOLD,12,"")
		:SetPoint("BOTTOM", frame, 75,14)
		:SetPushedBackdropColor(unpack(SkinData("Accent")))
		:SetScript("OnClick",function(self)
			if (GuideRating.score ~= nil) and (GuideRating.score > 0) then
				if (GuideRating.score == 1) and (frame.scroll.child:GetText() == "|cff888888Please tell us your thoughts on this guide.") then
					ZGV:Print(L['viewer_special_badscore'])
				else
					if self:GetParent().old_timestamp then
						ZGV.db.global.bugreports[self:GetParent().old_timestamp]=nil
					end
					if frame.scroll.child:GetText() == "|cff888888Please tell us your thoughts on this guide." then
						frame.scroll.child:SetText("")
						GuideRating:Save(frame.scroll.child:GetText())
					else
						GuideRating:Save(frame.scroll.child:GetText())
					end
					ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] = GuideRating.score
					GuideRating:ShowGuideRating()
				end
			else
				ZGV:Print(L['viewer_special_scorecheck'])
			end
		end)
	.__END

	frame.buttoncancel = CHAIN(ZGV.UI:Create("Button",frame))
		:SetSize(80,20)
		:SetText(L['viewer_special_cancel'])
		:SetFont(FONTBOLD,12,"")
		:SetPoint("BOTTOM", frame,-75,14)
		:SetPushedBackdropColor(unpack(SkinData("Accent")))
		:SetScript("OnClick",function(self)
			ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] = -1
			frame:Hide()
			if GuideRating.ZygorPopup then
				GuideRating.ZygorPopup:Hide()
				GuideRating.ZygorPopupOn:Hide()
			end
			GuideRating.GuideRatingViewer:Hide()
			if not GuideRating.CancelledRatingFrame then
				GuideRating:CreateCancelledFrame()
				GuideRating.CancelledRatingFrame:Show()
			else
				local nexttitle = getNextGuideTitleSafely("#001")
				GuideRating.CancelledRatingFrame.nextFS:SetText(
					nexttitle
						and L['viewer_special_cancelled_next']:format("cfffe610",nexttitle)
						or L['viewer_special_cancelled_menu'])
				GuideRating.CancelledRatingFrame:Show()
			end	
		end)
	.__END

	frame.scroll.child:SetScript("OnEditFocusGained", function()
		if (GuideRating.score ~= nil) and (GuideRating.score > 0) then
			if ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title] then
				frame.scroll.child:SetText(ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title])
			elseif frame.scroll.child:GetText()=="|cff888888"..L['viewer_special_rateexp'] then
				frame.scroll.child:SetText("")
			end
		else
			CHAIN(GameTooltip):SetOwner(frame.face2,"ANCHOR_BOTTOM") :SetText(L['viewer_special_selectfirst']) :Show()
			frame.scroll.child:ClearFocus()
		end
	end)
	
	frame.scroll.child:SetScript("OnEditFocusLost", function()
		if (GuideRating.score ~= nil) and (GuideRating.score > 0) then
			if frame.scroll.child:GetText()==("" or nil) and ZGV.BugReport.GuideRating.score ~= nil then
				if ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title] == nil then
					frame.scroll.child:SetText("|cff888888"..L['viewer_special_rateexp'])
				else
					frame.scroll.child:SetText(ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title])
				end
			elseif frame.scroll.child:GetText()~=(("|cff888888"..(L['viewer_special_rateexp'] or "") or nil) and (GuideRating.score > 0)) then
				ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title] = frame.scroll.child:GetText()
				ZGV.db.char.ratingscorecache[ZGV.CurrentGuide.title] = GuideRating.score
			end
		else return end
	end)

	local toggleButton = CHAIN(ZGV.UI:Create("ToggleButton",frame,"nameofButton"))
			:SetPoint("BOTTOMLEFT", frame,5,-10)
			:SetText(L['viewer_special_toggle'])
			:SetScript("OnClick",function(me)
				me:Toggle(not me.curToggle)
				if ZGV.db.profile.ratings == true then
					ZGV.db.profile.ratings = false
					ZGV:RefreshOptions()
					GuideRating.GuideRatingViewer:Hide()
					GuideRating:ShowGuideRating()
				end
				me:Toggle(not me.curToggle)
			end)
		.__END
end

function GuideRating:CreateAltFrame()
	local frame = CHAIN(ZGV.UI:Create("Frame", nil))
			:SetBackdropColor(0,0,0,0)
			:CanDrag(false)
			:SetParent(ZGV.Frame.Border)
			:SetPoint("TOPLEFT",ZGV.Frame.Border,0,-60) 
			:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
		.__END
	GuideRating.NoRatingFrame=frame

	frame.frameFS = CHAIN(frame:CreateFontString())
		:SetFont(ZGV.Font,12,"")
		:SetTextColor(1,1,1,1)
		:SetPoint("TOPLEFT",ZGV.Frame.Border,10,-60) 
		:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
		:SetJustifyH("CENTER")
		:SetText(L['viewer_special_rate_menu'])
	.__END

	frame.nextstepbutton = CHAIN(CreateFrame("Button","ZGVRateNext",frame))
		:SetPoint("TOPLEFT",frame, 10,-10)
		:SetPoint("BOTTOMRIGHT",frame,-10,10)
		:SetScript("OnClick", function()
			ZGV.GuideMenu:Show()
		end)
	.__END

	GuideRating:Position()

end

function GuideRating:CreateCancelledFrame()

	local frame = CHAIN(ZGV.UI:Create("Frame", nil))
		:SetParent(ZGV.Frame.Border)
		:SetPoint("TOPLEFT",ZGV.Frame.Border,10,-30) 
		:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border,-10,20)
		:SetBackdropColor(0,0,0,0)
		:CanDrag(false)
	.__END
	GuideRating.CancelledRatingFrame=frame

	frame.centeranchor = CHAIN(ZGV.UI:Create("Frame",frame))
		:SetParent(ZGV.Frame.Border)
		:SetBackdropColor(0,0,0,0)
		:SetPoint("TOP",ZGV.Frame.Border,"CENTER",0,-33)
		:SetPoint("BOTTOM",ZGV.Frame.Border,"CENTER",0,-40)
		:CanDrag(false)
	.__END

	frame.ratebutton = CHAIN(CreateFrame("Button","ZGVRateNext",frame))
		:SetPoint("TOP",frame.centeranchor,"TOP",0,50)
		:SetPoint("BOTTOM",frame.centeranchor,"TOP")
		:SetPoint("RIGHT",frame,"RIGHT")
		:SetPoint("LEFT",frame,"LEFT")
		:SetScript("OnClick", function()
			ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] = nil
			GuideRating:ShowGuideRating()
		end)
	.__END

	frame.rateFS = CHAIN(frame.ratebutton:CreateFontString())
		:SetFont(ZGV.Font,12,"")
		:SetTextColor(1,1,1,1)
		:SetText(L['viewer_special_cancelled_rate'])
		:SetPoint("TOPLEFT",frame.ratebutton,"TOPLEFT")
		:SetPoint("BOTTOMRIGHT",frame.ratebutton,"BOTTOMRIGHT")
	.__END

	frame.nextstepbutton = CHAIN(CreateFrame("Button","ZGVRateNext",frame))
		:SetPoint("TOP",frame.centeranchor,"BOTTOM")
		:SetPoint("BOTTOM",frame.centeranchor,"BOTTOM",0,-50)
		:SetPoint("RIGHT",frame,"RIGHT")
		:SetPoint("LEFT",frame,"LEFT")
		:SetScript("OnClick", function()
			if (getNextGuideTitleSafely("#002")) then
				GuideRating:NextRatingGuide("nextstepbuttonfromcancel")
			else
				ZGV.GuideMenu:Show()
			end
		end)
	.__END

	frame.nextFS = CHAIN(frame.nextstepbutton:CreateFontString())
		:SetFont(ZGV.Font,12,"")
		:SetTextColor(1,1,1,1)
		:SetPoint("TOPLEFT",frame.nextstepbutton,"TOPLEFT")
		:SetPoint("BOTTOMRIGHT",frame.nextstepbutton,"BOTTOMRIGHT")
	.__END

	ZGV:ScheduleTimer(function()
		local nexttitle = getNextGuideTitleSafely("#003")
		frame.nextFS:SetText(nexttitle
			and L['viewer_special_cancelled_next']:format("cfffe610",nexttitle)
			 or L['viewer_special_cancelled_menu'])
	 end, 0.2)

end

function GuideRating:Save(text)
	BugReport:SaveDump(text,time(),GuideRating:GetStepReportHeader())
end

function GuideRating:GetStepReportHeader()
	return
		"bug_report_guide="..StepFeedback:GetGuideStepSignature().."\n"..
		"bug_report_score="..ZGV.BugReport.GuideRating.score.."\n"
end

function GuideRating:HideRatingWidgets()
	if GuideRating.GuideRatingViewer then GuideRating.GuideRatingViewer:Hide() end
	if GuideRating.NoRatingFrame then GuideRating.NoRatingFrame:Hide() end
	if GuideRating.CancelledRatingFrame then GuideRating.CancelledRatingFrame:Hide() end
	if GuideRating.ZygorPopupOn then GuideRating.ZygorPopupOn:Hide() end
	if GuideRating.ZygorPopup then GuideRating.ZygorPopup:Hide() end
end


function GuideRating:ShowGuideRating()
	if ZGV.CurrentGuide and not ZGV.CurrentStep.score then return end
	if ZGV.BugReport.GuideRating.NoRatingFrame then ZGV.BugReport.GuideRating.NoRatingFrame:Hide() end
	if ZGV.BugReport.GuideRating.CancelledRatingFrame then GuideRating.CancelledRatingFrame:Hide() end

	if ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] ~= nil and (ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] > -1) or not ZGV.db.profile.ratings or ZGV.CurrentGuide.headerdata.noscoring then  --if the guide is already rated (1-3), rating was refused (0) or ratings disabled in options or guide header
		GuideRating:HideRatingWidgets()
		GuideRating:NextRatingGuide("show1")
	elseif ZGV.db.profile.ratings and (ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] == -1) then --if ratings are enabled and the rating was cancelled (i.e. is in pending state)
		GuideRating:HideRatingWidgets()
		if not GuideRating.CancelledRatingFrame then
			GuideRating:CreateCancelledFrame()
			GuideRating:Position()
			GuideRating.CancelledRatingFrame:Show()
		else
			local nexttitle = getNextGuideTitleSafely("#004")
			GuideRating.CancelledRatingFrame.nextFS:SetText(nexttitle
				and L['viewer_special_cancelled_next']:format("cfffe610",nexttitle)
				 or L['viewer_special_cancelled_menu'])
			GuideRating:Position()
			GuideRating.CancelledRatingFrame:Show()
		end
	else --if the ratings are enabled and guide was not rated or cancelled yet
		if ZGV.Frame.Border:GetHeight() >= 274 or not ZGV.db.profile.fixedheight then  --if auto-resize is on or the vertically resized frame is large enough for in-viewer rating
			if not GuideRating.GuideRatingViewer then
				GuideRating:CreateFrame()

				GuideRating:Position()
				ZGV:ResizeFrame("ratingframe")

				GuideRating:UpdateText()
				GuideRating:ClearRateState()
			else
				GuideRating:ClearRateState()
				GuideRating.GuideRatingViewer:ClearAllPoints()

				GuideRating:Position()
				ZGV:ResizeFrame("ratingframe")
				if GuideRating.ZygorPopupOn then GuideRating.ZygorPopupOn:Hide() end

				GuideRating:UpdateText()
			end
		else --if the verically resized frame is not large enough for in-viewer rating
			if not GuideRating.GuideRatingViewer then
				GuideRating:CreateFrame()

				GuideRating:UpdateText()
				GuideRating:Popup()
			else
				GuideRating:ClearRateState()

				GuideRating:UpdateText()
				GuideRating:Popup()
			end
		end
	end
end

function GuideRating:ClearRateState()
	if GuideRating.GuideRatingViewer then
		if ZGV.db.char.ratingscorecache[ZGV.CurrentGuide.title] ~= nil then
			GuideRating.score = ZGV.db.char.ratingscorecache[ZGV.CurrentGuide.title]
		else
			GuideRating.score = nil
		end
		ZGV.ButtonSets.RatingButtons.HAPPY:AssignToButton(GuideRating.GuideRatingViewer.face1)
		ZGV.ButtonSets.RatingButtons.INDIFFERENT:AssignToButton(GuideRating.GuideRatingViewer.face2)
		ZGV.ButtonSets.RatingButtons.UNHAPPY:AssignToButton(GuideRating.GuideRatingViewer.face3)
		if ZGV.BugReport.GuideRating.score == nil then
			ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.9)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.9)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.9)
		elseif ZGV.BugReport.GuideRating.score == 3 then
			ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.9)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
		elseif ZGV.BugReport.GuideRating.score == 2 then
			ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.9)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.3)
		elseif ZGV.BugReport.GuideRating.score == 1 then
			ZGV.BugReport.GuideRating.GuideRatingViewer.face1:SetAlpha(0.3)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face2:SetAlpha(0.3)
			ZGV.BugReport.GuideRating.GuideRatingViewer.face3:SetAlpha(0.9)
		end
	
		if ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title] == nil and ZGV.db.char.ratingscorecache[ZGV.CurrentGuide.title] == nil then
			GuideRating.GuideRatingViewer.scroll.child:SetText("")
		elseif ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title] == nil and ZGV.db.char.ratingscorecache[ZGV.CurrentGuide.title] ~= nil then
			GuideRating.GuideRatingViewer.scroll.child:SetText("|cff888888"..L['viewer_special_rateexp'])
		else
			GuideRating.GuideRatingViewer.scroll.child:SetText(ZGV.db.char.ratingfeedbackcache[ZGV.CurrentGuide.title])
		end
	end
end

function GuideRating:Popup()
	if not GuideRating.ZygorPopup then
		dialog = ZGV.PopupHandler:NewPopup("GuideScore","default")
		dialog:SetText("","") 
		dialog.declinebutton:Hide()
		dialog.acceptbutton:Hide()
		dialog.logo:Show()
		dialog.minimize:SetScript("OnClick", function()
			ZGV.db.char.scoredguides[ZGV.CurrentGuide.title] = 0
			GuideRating.ZygorPopupOn:Hide()
			GuideRating.ZygorPopup:Hide()
			GuideRating.GuideRatingViewer:Hide()
			if not GuideRating.NoRatingFrame then
				GuideRating:CreateAltFrame()
				GuideRating.NoRatingFrame:Show()
			else
				if ZGV.CurrentGuide.next ~= nil then
					GuideRating:NextRatingGuide("popup")
				else
					GuideRating.NoRatingFrame.frameFS:SetText(L['viewer_special_rate_menu'])
				end
				GuideRating.NoRatingFrame:Show()
			end
		end)
		dialog.AdjustSize = function(self)
			local offsets = (self.logo:IsVisible() and (self.logo:GetHeight()+15) or 5) + 30 --Logo and top + more room
			self:SetHeight(offsets + 275)
			self:SetWidth(270)
		end

		dialog.LayoutFull= function(self) end

		GuideRating.ZygorPopup = dialog
	end

	GuideRating.GuideRatingViewer:SetParent(GuideRating.ZygorPopup)
	GuideRating.GuideRatingViewer:ClearAllPoints()
	GuideRating.GuideRatingViewer:SetPoint("BOTTOMRIGHT", GuideRating.ZygorPopup,"BOTTOMRIGHT",-10,15)
	GuideRating.GuideRatingViewer:SetPoint("TOPLEFT", GuideRating.ZygorPopup.logo, "TOPLEFT",-70,0)
	GuideRating.GuideRatingViewer.frameFS:SetPoint("TOP",GuideRating.ZygorPopup,0,-15)
	GuideRating.ZygorPopup.noMinimizeToNC=true
	

	if not GuideRating.ZygorPopupOn then
	frame = CHAIN(ZGV.UI:Create("Frame", nil))
		:SetBackdropColor(0,0,0,0)
		:CanDrag(false)
		:SetParent(ZGV.Frame.Border)
		:SetPoint("TOPLEFT",ZGV.Frame.Border,0,-60) 
		:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
	.__END
	GuideRating.ZygorPopupOn=frame

	frame.frameFS = CHAIN(frame:CreateFontString())
		:SetFont(ZGV.Font,12,"")
		:SetTextColor(0.8,0.8,0.8,1)
		:SetPoint("TOPLEFT",ZGV.Frame.Border,10,-60) 
		:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border) 
		:SetJustifyH("CENTER")
		:SetText(L['viewer_special_senttopopup'])
	.__END

	end

	GuideRating.GuideRatingViewer:Show()
	GuideRating.ZygorPopup:Show()
	GuideRating.ZygorPopupOn:Show()

end

function GuideRating:Position()
	if not ZGV.db.profile.resizeup then
		if GuideRating.GuideRatingViewer then
			GuideRating.GuideRatingViewer:SetParent(ZGV.Frame.Border)
			GuideRating.GuideRatingViewer.frameFS:SetPoint("TOP",GuideRating.GuideRatingViewer,0,-80)
			GuideRating.GuideRatingViewer:SetPoint("TOPLEFT",ZGV.Frame.Border,8,0) 
			GuideRating.GuideRatingViewer:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border,-8,20)
		end

		if GuideRating.NoRatingFrame then
			GuideRating.NoRatingFrame:SetPoint("TOPLEFT",ZGV.Frame.Border,0,-60) 
			GuideRating.NoRatingFrame:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
			GuideRating.NoRatingFrame.frameFS:SetPoint("TOPLEFT",ZGV.Frame.Border,10,-60) 
			GuideRating.NoRatingFrame.frameFS:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
		end
	
		if GuideRating.CancelledRatingFrame then
			GuideRating.CancelledRatingFrame.centeranchor:SetPoint("TOP",ZGV.Frame.Border,"CENTER",0,-33)
			GuideRating.CancelledRatingFrame.centeranchor:SetPoint("BOTTOM",ZGV.Frame.Border,"CENTER",0,-40)
		end
		
	else
		if GuideRating.GuideRatingViewer then
			GuideRating.GuideRatingViewer:SetParent(ZGV.Frame.Border)
			GuideRating.GuideRatingViewer.frameFS:SetPoint("TOP",GuideRating.GuideRatingViewer,0,-15)
			GuideRating.GuideRatingViewer:SetPoint("TOPLEFT",ZGV.Frame.Border,8,0) 
			GuideRating.GuideRatingViewer:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border,-8,95)
		end

		if GuideRating.NoRatingFrame then
			GuideRating.NoRatingFrame:SetPoint("TOPLEFT",ZGV.Frame.Border,0,0) 
			GuideRating.NoRatingFrame:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
			GuideRating.NoRatingFrame.frameFS:SetPoint("TOPLEFT",ZGV.Frame.Border,10,30) 
			GuideRating.NoRatingFrame.frameFS:SetPoint("BOTTOMRIGHT",ZGV.Frame.Border)
		end

		if GuideRating.CancelledRatingFrame then
			GuideRating.CancelledRatingFrame.centeranchor:SetPoint("TOP",ZGV.Frame.Border,"CENTER",0,23)
			GuideRating.CancelledRatingFrame.centeranchor:SetPoint("BOTTOM",ZGV.Frame.Border,"CENTER",0,23)
		end
	end
end

function GuideRating:UpdateText()
	if ZGV.Frame.Border:GetHeight() >= 274 or not ZGV.db.profile.fixedheight then
		GuideRating.GuideRatingViewer.frameFS:SetText(L['viewer_special_rate']:format("cfffe610",ZGV.CurrentGuide.title_short))
		GuideRating.GuideRatingViewer:Show()
	else
		GuideRating.GuideRatingViewer.frameFS:SetText(L['viewer_special_popup']:format("cfffe610",ZGV.CurrentGuide.title_short))
		GuideRating.GuideRatingViewer:Show()
	end
end