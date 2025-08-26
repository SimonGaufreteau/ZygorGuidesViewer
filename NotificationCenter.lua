local name,ZGV = ...

local tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil=tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil

local NC = {}
NC.Entries = {}

local L = ZGV.L
local CHAIN = ZGV.ChainCall
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold

local ui = ZGV.UI
local SkinData = ui.SkinData

local FADEIN_TIME = 0.5
local FADEOUT_TIME = 0.5

ZGV.NotificationCenter=NC

local LH = LibStub("LibHash-1.0")

ZGV_Notification_Entry_Template_Mixin = {}
function ZGV_Notification_Entry_Template_Mixin:ApplySkin() 
	if self.single or self.special then
		self.time:SetFont(FONT,8*(ZGV.db.profile.nc_toast_fontsize or 10)/10)
		self.title:SetFont(FONTBOLD,ZGV.db.profile.nc_toast_fontsize or 10)
		self.text:SetFont(FONT,ZGV.db.profile.nc_toast_fontsize or 10)

		self:SetBackdrop(SkinData("FloatMenuSmallBackdrop"))
		self:SetBackdropColor(unpack(SkinData("FloatMenuSmallBackdropColor")))
		self:SetBackdropBorderColor(unpack(SkinData("FloatMenuSmallBackdropBorderColor")))
	else
		self.time:SetFont(FONT,8)
		self.title:SetFont(FONTBOLD,10)
		self.text:SetFont(FONT,10)
	end

	self.time:SetTextColor(1,1,1,1)
	self.title:SetTextColor(1,1,1,1)
	self.text:SetTextColor(0.8,0.8,0.8,1)
	self.close:ApplySkin()
end

function ZGV_Notification_Entry_Template_Mixin:SetEntry(entry) 
	self.time:SetText("("..ZGV.F.GetTimeFromSeconds(time()-entry.data.added,"min").." ago)")
	self.title:SetText(entry.title)
	self.text:SetText(entry.text)

	if entry.data.special then
		self.SpecialButton:SetScript("OnClick",entry.func)
		self.SpecialButton:SetText(entry.data.specialtext)
	else
		self:SetScript("OnClick",entry.func)
	end

	local iconset = entry.iconset or ZGV.IconSets.NotificationIcons
	iconset[entry.iconkey]:AssignToTexture(self.icon)

	self.entry = entry

	self:UpdateMode()
	self:UpdateHeight()
end

function ZGV_Notification_Entry_Template_Mixin:StartFadeTimer()
	local SHOW_TIME = self.entry.data.displaytime or ZGV.db.profile.nc_duration
	self.FadeTimer = ZGV:ScheduleTimer(function() 
		ZGV.UIFrameFade.UIFrameFadeOut(self, FADEOUT_TIME, 1, 0, function() 
			C_Timer.After(0,function() 
				self:Hide() 
				if self.entry and self.entry.data.transient then
					NC:RemoveEntry(self.entry.ident)
				end
				NC:UpdateButton() 
			end) 
		end)
	end, SHOW_TIME)
end

function ZGV_Notification_Entry_Template_Mixin:CancelFadeTimer()
	if self.FadeTimer then ZGV:CancelTimer(self.FadeTimer) end
	ZGV.UIFrameFade.UIFrameFadeAbort(self)
end


function ZGV_Notification_Entry_Template_Mixin:UpdateMode() 
	local mode = self.entry.data.forcemode or ((ZGV.db.profile.nc_size==1 or self.entry.text=="") and "compact") or "detailed"

	if mode=="compact" then -- compact
		self.text:Hide()
		if self.single or self.special then
			self.title:ClearAllPoints()
			self.title:SetPoint("LEFT",self.icon,"RIGHT",5,0)
			self.title:SetPoint("RIGHT",self.close,"RIGHT",-5,0)
		end
	else -- detailed
		self.text:Show()
		if self.single or self.special then
			self.title:ClearAllPoints()
			self.title:SetPoint("LEFT",self.icon,"RIGHT",5,0)
			self.title:SetPoint("RIGHT",self.close,"RIGHT",-5,0)
			self.title:SetPoint("TOP",self,"TOP",0,-5)
		end
	end
end

function ZGV_Notification_Entry_Template_Mixin:OnEnter()
	if self.single or self.special then self:CancelFadeTimer()  end
	self.close:Show()
	if not self.entry then return end
	if not self.entry.data.tooltip then return end
	GameTooltip:SetOwner(self,"ANCHOR_CURSOR")
	GameTooltip:SetText(self.entry.data.tooltip)
	GameTooltip:Show()
end

function ZGV_Notification_Entry_Template_Mixin:OnLeave()
	if (self.single or self.special) and self.entry then self:StartFadeTimer()  end
	self.close:Hide()
	GameTooltip:Hide()
end

function ZGV_Notification_Entry_Template_Mixin:UpdateHeight() 
	self:Show()

	local height = 5
	height = height + (self.time:IsVisible() and self.time:GetStringHeight()+0 or 0)
	height = height + (self.title:IsVisible() and self.title:GetStringHeight()+3 or 0)
	height = height + (self.text:IsVisible() and self.text:GetStringHeight()+3 or 0)
	height = height + (self.SpecialButton and self.SpecialButton:IsVisible() and self.SpecialButton:GetHeight()+8 or 0)

	if (self.single or self.special) then height = max(height,25) end

	self:SetHeight(height)
	self:Hide()
end

-- x button within single notification
ZGV_Notification_Entry_Close_Template_Mixin = {}
function ZGV_Notification_Entry_Close_Template_Mixin:OnClick() 
	local parent = self:GetParent()
	local entry = parent.entry
	if parent.single or self.special then
		parent:CancelFadeTimer()
		parent:Hide()
	else	
		NC:RemoveEntry(entry.ident)
	end
end

function ZGV_Notification_Entry_Close_Template_Mixin:OnEnter() 
	local parent = self:GetParent()
	parent:GetScript("OnEnter")(parent)
end
function ZGV_Notification_Entry_Close_Template_Mixin:OnLeave() 
	local parent = self:GetParent()
	parent:GetScript("OnLeave")(parent)
end


-- three buttons in notifications dropdown: toggle viewer, reset notifications, show settings
ZGV_Notification_Settings_Template_Mixin = {}
function ZGV_Notification_Settings_Template_Mixin:OnEnter()
	if self.single then self:CancelFadeTimer()  end
	if self.tooltip then
		GameTooltip:SetOwner(self,"ANCHOR_TOP",0,10)
		GameTooltip:SetText(self.tooltip)
		GameTooltip:Show()
	end
	if self.showparentmenu then
		UIDropDownForkButton_OnEnter(self:GetParent())
	end
end

function ZGV_Notification_Settings_Template_Mixin:OnLeave()
	if self.single then self:StartFadeTimer()  end
	GameTooltip:Hide()
	if self.showparentmenu then
		UIDropDownForkButton_OnLeave(self:GetParent())
	end
end

function NC:Startup()
	local Messages = ZGV.GuideMenu.Messages
	NC.Types = {
		cutscene =	{iconkey="CUTSCENE", priority=10}, -- dismiss
		gearequipped =	{iconkey="GEAR", priority=11}, -- dismiss
		invalid =	{iconkey="ZYGOR", priority=12, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		pet =		{iconkey="PET", priority=13, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		hunterpet =	{iconkey="PET", priority=14, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		mount =		{iconkey="MOUNT", priority=15, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		goldbuy =	{iconkey="GOLD", priority=16, click=function() ZGV.Inventory:BuyItems() end}, -- dismiss
		dungeon =	{iconkey="DUNGEON", priority=17, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		multidungeon =	{iconkey="DUNGEON", priority=18, click=function(entry) ZGV.GuideFuncs:CreateDungeonPopup(entry.data.object,entry.data.nctext) end},

		welcome =	{iconkey="ZYGOR", priority=21, click=function() if Messages.welcome.action then Messages.welcome.action() end end},
		guides =	{iconkey="ZYGOR", priority=22, click=function() if Messages.guides.action then Messages.guides.action() end end},
		features =	{iconkey="ZYGOR", priority=23, click=function() if Messages.features.action then Messages.features.action() end end},

		event =		{iconkey="EVENTS", priority=31, click=function(entry) ZGV.GuideMenu:Show(entry.data.folder) end},
		monkdaily =	{iconkey="MONK", priority=32, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},
		daily =		{iconkey="DAILY", priority=33}, -- dismiss
		weekly =	{iconkey="WEEKLY", priority=34}, -- dismiss

		gear =		{iconkey="GEAR", priority=41, click=function() ZGV.ItemScore.Upgrades.DimItems=true OpenAllBags() CloseDropDownForks() ZGV.NotificationCenter:RemoveEntriesByType("gear") end},
		gearpop =	{iconkey="GEAR", priority=41, click=function(entry) ZGV.ItemScore.Upgrades:ShowEquipmentChangePopup() CloseDropDownForks() ZGV.NotificationCenter:RemoveEntriesByType("gearpop") end},
		skills =	{iconkey="SKILL", priority=42, click=function() ZGV.Skills:ShowSkillPopup(nil,nil,"forceShow") end},

		orientation =	{iconkey="ORIENTATION", priority=51, click=function() ZGV.Tabs:LoadGuideToTab("Leveling Guides\\Startup Guide Wizard") end},
		riding =	{iconkey="RIDING", priority=52, click=function(entry) ZGV.Tabs:LoadGuideToTab(entry.data.guide) end},

		options =	{iconkey="ZYGOR", priority=60, click=function(entry) ZGV:OpenOptions(entry.data.tab) end},
		pandarenreload=	{iconkey="RELOAD", priority=61, click=function() ReloadUI() end},
		sharestart =	{iconkey="SHARE", priority=62, click=function() ZGV.Sync:ActivateAsMaster() end},
		shareaccept =	{iconkey="SHARE", priority=63, click=function() ZGV.Sync:ActivateAsSlave() end},
		noskill =	{iconkey="NOSKILL", priority=64}, -- dismiss
	}

	ZGV.db.char.savednotifications = ZGV.db.char.savednotifications or {}
	NC.Saved = ZGV.db.char.savednotifications

	-- button pool for dropdown menu
	local function poolinit(frame)
		frame:ApplySkin()
	end
	local function poolresetter(pool,frame)
		frame:Hide()
		frame:ClearAllPoints()
	end
	NC.ButtonPool = CreateFramePool("BUTTON",ZGV.Frame,"ZGV_Notification_Entry_Template",poolresetter,nil,poolinit)

	NC.EntrySettings = CreateFrame("BUTTON","ZGVNotificationSettingsButton",ZygorGuidesViewerMapIcon,"ZGV_Notification_Settings_Template")
	NC.EntrySettings.title:SetFont(FONTBOLD,14)
	NC.EntrySettings.title:SetTextColor(1,1,1,1)
	NC.EntrySettings.title:SetText("Notifications")

	NC.EntrySettings.clear:SetScript("OnClick",function() NC:ClearNotifications() end)
	NC.EntrySettings.clear.tooltip = L["nc_reset"]
	NC.EntrySettings.settings:SetScript("OnClick",function() ZygorGuidesViewer:OpenOptions() end)
	NC.EntrySettings.settings.tooltip = L["nc_settings"]

	-- single button for floating notification
	NC.SingleNotif = CreateFrame("BUTTON",nil,ZygorGuidesViewerMapIcon,"ZGV_Notification_Entry_Template")
	NC.SingleNotif.time:Hide()
	NC.SingleNotif.icon:SetPoint("LEFT",NC.SingleNotif,"LEFT",3,0)
	NC.SingleNotif.single = true
	NC.SingleNotif:ApplySkin()
	NC.SingleNotif:SetParent(ZygorGuidesViewerMapIcon)
	NC.SingleNotif:EnableMouse(true)


	-- Special button for floating notification
	NC.SpecialNotif = CreateFrame("BUTTON",nil,ZygorGuidesViewerMapIcon,"ZGV_Notification_Entry_Template")
	NC.SpecialNotif.time:Hide()
	NC.SpecialNotif.icon:SetPoint("LEFT",NC.SpecialNotif,"LEFT",3,0)
	NC.SpecialNotif.special = true
	NC.SpecialNotif:ApplySkin()
	NC.SpecialNotif:SetParent(ZygorGuidesViewerMapIcon)
	NC.SpecialNotif:EnableMouse(true)
	NC.SpecialNotif:SetPoint("RIGHT",ZygorGuidesViewerMapIcon,"LEFT",0,0) -- needs to be anchored for height calculation to work

	NC.SpecialNotif.SpecialButton = CHAIN(ui:Create("Button",NC.SpecialNotif))
		:SetSize(95,20)
		:SetPoint("TOP",NC.SpecialNotif.text,"BOTTOM", 0, -8)
		:SetFont(FONT,12)
		:SetText("")
		:RegisterForClicks("LeftButtonUp")
		:SetPushedBackdropColor(unpack(SkinData("ButtonHighlightColor1")))
		:Show()
	.__END


	NC:UpdatePosition()
	
	ZGV:ScheduleRepeatingTimer(NC.HandleQueue, 0.5) -- no need to run on update

	ZGV:AddEventHandler("PLAYER_LOGOUT",NC.SaveNotifications)
	ZGV:AddMessageHandler("SKIN_UPDATED",NC.ApplySkin)

	NC.MenuFrame = ZGV.Frame.Controls.MenuHostNotifications

	NC:ApplySkin()
	NC:LoadNotifications()
	NC:UpdateButton()

	ZygorGuidesViewerMapIcon:SetLoading(false)

	if NC.AddQueue then
		for _,entry in ipairs(NC.AddQueue) do
			NC:AddEntry(unpack(entry))
		end
	end

	if NC.ShowOnLoad then
		NC:ShowAll()
	end

	NC:CheckDynamicNotifications()
end

-- data
--	whatever special is needed to handle that type (guide names, steps, pet ids)
--	displaytime - override notification duration
--	nosave - don't put into saved vars
--	priority - override priority value
--	cleartype - remove all other notifications of given type
--	shown - go directly to unread
--	transient - do not go to unreads after showing
--	tooltip - text of tooltip
--	ident - static ident
--	keeponclick - do not remove notification from nc when clicked
--	special - is shown using ShowSpecial, outside of queue, using separate frame
function NC:AddEntry(notiftype,title,text,data)
	if not NC.Types then
		-- too soon, you woke me up too soon
		NC.AddQueue = NC.AddQueue or {}
		table.insert(NC.AddQueue,{notiftype,title,text,data})
		return
	end
	
	if not ZGV.db.profile.nc_enable then return end
	assert(type(notiftype)=="string" and NC.Types[notiftype], "Notification unknown type "..(notiftype or "missing"))
	assert(type(title)=="string", "Notification title missing")
	assert(type(text)=="string", "Notification text missing")
	local typedata = NC.Types[notiftype]
	
	local entry = {}
	local data = data or {}

	if data.cleartype then
		NC:RemoveEntriesByType(notiftype)
	end

	entry.notiftype = notiftype
	entry.title = title
	entry.text = text
	entry.data = data
	data.added = data.added or time()

	local ident = (data.special and notiftype) or data.ident or debugprofilestop()..notiftype
	entry.ident = ident
	entry.func = function() 
		if typedata.click then typedata.click(entry) end
		if not entry.data.keeponclick then NC:RemoveEntry(entry.ident) end 
	end
	entry.iconset = typedata.iconset
	entry.iconkey = typedata.iconkey
	entry.priority = entry.data.priority or typedata.priority

	-- "Send All Notifications to Notification Center"
	if ZGV.db.profile.nc_sendtonc then
		entry.data.shown = true
	end

	-- "Mark all Notifications as seen"
	if ZGV.db.profile.nc_markseen then
		entry.data.reviewed = true
	end

	if not entry.data.special then
		table.insert(NC.Entries,1,entry)
	else
		NC:ShowSpecial(entry)
	end

	return ident
end

function NC:RemoveEntriesByType(notiftype)
	for i,entry in ipairs_reverse(NC.Entries) do
		if entry.notiftype == notiftype then
			NC:RemoveEntry(entry.ident)
		end
	end
	NC:UpdateButton()
end

function NC:RemoveEntry(ident)
	for i,entry in ipairs(NC.Entries) do
		if entry.ident == ident then
			table.remove(NC.Entries,i)
		end
	end

	if NC.SingleNotif and NC.SingleNotif.entry and NC.SingleNotif.entry.ident == ident then
		NC.SingleNotif:CancelFadeTimer()
		NC.SingleNotif.entry = nil
		NC.SingleNotif:Hide()
	end

	if NC.SpecialNotif and NC.SpecialNotif.entry and NC.SpecialNotif.entry.ident == ident then
		NC.SpecialNotif:CancelFadeTimer()
		NC.SpecialNotif.entry = nil
		NC.SpecialNotif:Hide()
	end

	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==ZGV.Frame.Controls.MenuHostNotifications then
		NC:ShowAll("force")
	end
	NC:UpdateButton()
end

function NC:GetEntry(ident)
	for i,entry in ipairs(NC.Entries) do
		if entry.ident == ident then
			return entry
		end
	end
end

function NC:UpdatePosition()
	if not NC.SingleNotif then return end

	if ZGV.db.profile.nc_position==3 then
		NC.SingleNotif:SetMovable(true)
		NC.SingleNotif:RegisterForDrag("LeftButton")
		NC.SingleNotif:SetScript("OnDragStart", function(self)
			self:CancelFadeTimer()
			self:StartMoving()
		end)
		NC.SingleNotif:SetScript("OnDragStop", function(self)
			self:StopMovingOrSizing()
			ZGV.F.SaveFrameAnchor(NC.SingleNotif,"notification_anchor")
		end)
	else
		NC.SingleNotif:SetMovable(false)
		NC.SingleNotif:SetScript("OnDragStart", nil)
		NC.SingleNotif:SetScript("OnDragStop", nil)
	end

	NC.SingleNotif:ClearAllPoints()
	if ZGV.db.profile.nc_position==1 then -- left
		if ZygorGuidesViewerMapIcon:GetLeft() > (NC.SingleNotif:GetWidth() + 10) then
			NC.SingleNotif:SetPoint("TOPRIGHT",ZygorGuidesViewerMapIcon,"TOPLEFT",0,-3)
		else
			NC.SingleNotif:SetPoint("TOPLEFT",ZygorGuidesViewerMapIcon,"TOPRIGHT",0,-3)
		end
	elseif ZGV.db.profile.nc_position==2 then
		if ZygorGuidesViewerMapIcon:GetRight() > (NC.SingleNotif:GetWidth() + 10) then
			NC.SingleNotif:SetPoint("TOPLEFT",ZygorGuidesViewerMapIcon,"TOPRIGHT",0,-3)
		else
			NC.SingleNotif:SetPoint("TOPRIGHT",ZygorGuidesViewerMapIcon,"TOPLEFT",0,-3)
		end
	else
		NC.SingleNotif:SetPoint("TOPRIGHT",ZygorGuidesViewerMapIcon,"TOPRIGHT",0,0)
		ZGV.F.SetFrameAnchor(NC.SingleNotif,ZGV.db.profile.notification_anchor)
	end
end


function NC:ShowSpecial(entry)
	-- set item for menu
	entry.data.shown = true

	NC.SpecialNotif:SetEntry(entry)
	NC.SpecialNotif:ApplySkin()
	NC.SpecialNotif:ClearAllPoints()
	NC.SpecialNotif:SetPoint(unpack(entry.data.anchor))

	ZGV.UIFrameFade.UIFrameFadeIn(NC.SpecialNotif, FADEIN_TIME)
	
	NC.SpecialNotif.FadeTimer = ZGV:ScheduleTimer(function() 
		NC.SpecialNotif:StartFadeTimer()
	end,FADEIN_TIME)
end


NC.MenuItems = {}
function NC:ShowOne(entry)
	-- set item for menu
	entry.data.shown = true

	NC.SingleNotif:SetEntry(entry)
	NC.SingleNotif:ApplySkin()
	NC:UpdatePosition()

	ZGV.UIFrameFade.UIFrameFadeIn(NC.SingleNotif, FADEIN_TIME)
	
	NC.SingleNotif.FadeTimer = ZGV:ScheduleTimer(function() 
		NC.SingleNotif:StartFadeTimer()
	end,FADEIN_TIME)
end

function NC:ShowAll(force)
	if not force and DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==ZGV.Frame.Controls.MenuHostNotifications then
		CloseDropDownForks()
		return
	end

	if NC.SingleNotif:IsVisible() then
		NC.SingleNotif:CancelFadeTimer()
		NC.SingleNotif:Hide()
	end

	local menu = {}
	tinsert(menu,{
		text = "",
		customFrame=NC.EntrySettings,
		paddingbottom=0,
		height=20,
		keepShownOnClick=true,
		minWidth=225,
	})
	local LIMIT,COUNTER = 5,0


	if #NC.Entries==0 then
		tinsert(menu,{
			title=L["notifcenter_no_entries"],
			text=L["notifcenter_no_entries"],
			notCheckable=1,
		})
	else
		for _,entry in ipairs(NC.Entries) do
			if not entry.data.transient then
				local frame = NC.ButtonPool:Acquire()
				frame:SetParent(ZygorGuidesViewerMapIcon)
				frame:SetPoint("RIGHT",ZygorGuidesViewerMapIcon,"LEFT",0,0) -- needs to be anchored for height calculation to work
				frame:SetEntry(entry)

				entry.data.shown = true
				entry.data.reviewed = true

				tinsert(menu,{
					text = "",
					customFrame=frame,
					leftPadding = -10,
				})
				tinsert(menu,UIDropDownFork_separatorInfo)
				COUNTER = COUNTER + 1
				if COUNTER==LIMIT then
					break
				end
			end
		end
	end
	
	ZGV.Frame.Controls.MenuHostNotifications:ClearAllPoints()
	if tonumber(ZygorGuidesViewerMapIcon:GetLeft())>225 then
		UIDropDownFork_SetAnchor(ZGV.Frame.Controls.MenuHostNotifications, 0, 0, "TOPRIGHT", ZygorGuidesViewerMapIcon, "TOPLEFT")
	else
		UIDropDownFork_SetAnchor(ZGV.Frame.Controls.MenuHostNotifications, 0, 0, "TOPLEFT", ZygorGuidesViewerMapIcon, "TOPRIGHT")
	end
	EasyFork(menu,ZGV.Frame.Controls.MenuHostNotifications,nil,0,0,"MENU",10)
	ZGV.Frame.Controls.MenuHostNotifications.noRightPaddingOnLevel = 1

	NC:UpdateButton()
end

function NC:ShowSub(force)
	if not force and DropDownForkList2 and DropDownForkList2:IsShown() and DropDownForkList2.dropdown==ZGV.Frame.Controls.MenuHostNotifications then
		DropDownForkList2:Hide()
		return
	end

	ToggleDropDownFork(2, nil, ZGV.Frame.Controls.MenuHostNotifications, nil, nil, nil, NC.EntrySettings.menuList, NC.EntrySettings);

end


function NC:ClearNotifications()
	table.wipe(NC.Entries)
	table.wipe(NC.Saved)
	NC:UpdateButton()
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==ZGV.Frame.Controls.MenuHostNotifications then
		NC:ShowAll("force")
	end
end

function NC:LoadNotifications()
	for i,entry in ipairs(NC.Saved) do
		NC:AddEntry(entry.notiftype,entry.title,entry.text,entry.data)
	end
	NC:UpdateButton()
end

function NC:SaveNotifications()
	table.wipe(NC.Saved)

	for i,entry in ipairs(NC.Entries) do
		if not entry.data.nosave then
			entry.data.shown = true -- don't pop in next round
			-- clear stuff that we will rebuild
			entry.func = nil
			entry.iconset = nil
			entry.iconkey = nil
			entry.ident = nil
			table.insert(NC.Saved,1,entry) -- insert at front, so when read current order gets maintained
		end
	end
end

function NC:UpdateButton()
	if ZGV.db.profile.nc_enable then
		for i,entry in ipairs(NC.Entries) do
			if not entry.data.reviewed then
				-- show orange border
				ZGV.ButtonSets.Minimap.ACTIVE:AssignToButton(ZygorGuidesViewerMapIcon)
				return
			end
		end
	end
	ZGV.ButtonSets.Minimap.NORMAL:AssignToButton(ZygorGuidesViewerMapIcon)
end

function NC.HandleQueue()
	if not NC.SingleNotif or NC.SingleNotif:IsVisible() then return end
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==ZGV.Frame.Controls.MenuHostNotifications then return end
	if #NC.Entries==0 then return end

	-- check if there are any priority waiting
	for i,entry in ipairs_reverse(NC.Entries) do
		if not entry.data.shown and entry.data.priority then
			NC:ShowOne(entry)
			NC.Visible = true
			return
		end
	end

	-- handle normal entries
	local entryToShow
	for i,entry in ipairs_reverse(NC.Entries) do
		if not entry.data.shown then
			if not entryToShow or entryToShow.priority>entry.priority then
				entryToShow = entry
			end
		end
	end

	if entryToShow then
		NC:ShowOne(entryToShow)
		NC.Visible = true
	end
end

function NC:ApplySkin()
	NC.EntrySettings.title:SetFont(FONTBOLD,14)
	NC.EntrySettings.title:SetTextColor(1,1,1,1)
	NC.EntrySettings.settings:ApplySkin()
	NC.EntrySettings.clear:ApplySkin()
end


local function format_text(str)
	str = str:gsub("\t","")
	str = str:gsub("[*][*]([^\*]+)[*][*]","|cfffe6100%1|r")
	str = str:gsub("[=][=]([^\=]+)[=][=]","|cffbbbbbb%1|r")

	str = str:gsub("*","|T"..ZGV.IconSets.StepLineIcons.BIGDOT:GetFontString(14,14,0,-4,254,97,0).."|t")
	str = str:gsub("{%!}","|T"..ZGV.IconSets.StepLineIcons.EXCLAMATION:GetFontString(14,14,0,-5,254,97,0).."|t")
	str = str:gsub("{%.}","|T"..ZGV.IconSets.StepLineIcons.DOT:GetFontString(14,14,0,-3,254,97,0).."|t")
	str = str:gsub("{%?}","|T"..ZGV.IconSets.StepLineIcons.QUEST:GetFontString(14,14,0,-5,254,97,0).."|t")
	str = str:gsub("{v}","|T"..ZGV.IconSets.StepLineIcons.CHECK:GetFontString(14,14,0,-3,254,97,0).."|t")
	str = str:gsub("{x}","|T"..ZGV.IconSets.StepLineIcons.STAR:GetFontString(14,14,0,-3,254,97,0).."|t")

	return str
end

function NC:CheckDynamicNotifications()

	NC:QuestResetTrigger()
	ZGV:ScheduleRepeatingTimer(function()
		NC:QuestResetTrigger()
	end,60)

	ZGV:ScheduleRepeatingTimer(function()
		NC:OrientationTrigger()
	end,2)

	NC:EventsTrigger()
	ZGV:ScheduleRepeatingTimer(function()
		NC:EventsTrigger()
	end,60*60)

	local welcome = ZGV.GuideMenu.Messages.welcome
	if welcome then
		local welcomehash = LH.md5(welcome.title..welcome.text)
		if ZGV.db.profile.welcomehash ~= welcomehash and ZGV.db.profile.nc_welcome then 
			NC:AddEntry("welcome",welcome.title,format_text(welcome.text),{cleartype=true,keeponclick=true, displaytime=welcome.displaytime })
			ZGV.db.profile.welcomehash = welcomehash
		end
	end

	local guides = ZGV.GuideMenu.Messages.guides
	if guides then
		local guideshash = LH.md5(guides.title..guides.text)
		if ZGV.db.profile.guideshash ~= guideshash and ZGV.db.profile.nc_general then 
			NC:AddEntry("guides",guides.title,format_text(guides.text),{cleartype=true,keeponclick=true, displaytime=guides.displaytime})
			ZGV.db.profile.guideshash = guideshash
		end
	end

	local features = ZGV.GuideMenu.Messages.features
	if features then
		local featureshash = LH.md5(features.title..features.text)
		if ZGV.db.profile.featureshash ~= featureshash and ZGV.db.profile.nc_general then 
			NC:AddEntry("features",features.title,format_text(features.text),{cleartype=true,keeponclick=true, displaytime=features.displaytime})
			ZGV.db.profile.updatehash = updatehash
		end
	end

end

function NC:EventsTrigger()
	local function findguides(event)
		local eventgroup = ZGV:FindOrCreateGroup(ZGV.registered_groups,"EVENTS","onlyfind")
		if not eventgroup then return end
		for _,group in ipairs(eventgroup.groups) do
			if group.name:upper()==event then
				return group
			end
		end
	end

	local dateobject = C_DateAndTime.GetCurrentCalendarTime()
	local day = dateobject.monthDay
	local year = dateobject.year

	local numEvents = C_Calendar.GetNumDayEvents(0, day);
	
	for event=1, numEvents do
		local eventdata = C_Calendar.GetDayEvent(0,day,event)
		if eventdata and eventdata.calendarType=="HOLIDAY" then
			local remains,remainsec = ZGV.F.GetTimeUntil(eventdata.endTime)
			if remainsec>0 then
				local details = C_Calendar.GetHolidayInfo(0,day,event)

				local eventident = ZGV.WorldEventIDs[eventdata.eventID]
				if eventident and not ZGV.db.profile.notifiedevents[year..eventident] then
					ZGV.db.profile.notifiedevents[year..eventident] = true
					local folder = findguides(eventident)
					if folder and ZGV.db.profile.nc_events then
						NC:AddEntry("event","The "..eventdata.title.." event is in progress.","Click to see guides for it.",{folder=folder.fullpath})
					end
				end
			end
		end	
	end
end

function NC:QuestResetTrigger()
	local weekly = C_DateAndTime.GetSecondsUntilWeeklyReset()
	local daily = C_DateAndTime.GetSecondsUntilDailyReset()
	local epoch = time()
	-- weekly>lastweekly handles the moment of reset, lastweeklycheck against epoch prevents popup if player was offline for more than half a day
	if ZGV.db.profile.lastweekly and weekly>ZGV.db.profile.lastweekly and (ZGV.db.profile.lastweeklycheck and epoch-ZGV.db.profile.lastweeklycheck<12*60*60) and ZGV.db.profile.nc_worldquest then
		NC:AddEntry("weekly","Weekly Quests have reset on the server.","",{dontsave=true})
	end
	if ZGV.db.profile.lastdaily and daily>ZGV.db.profile.lastdaily and (ZGV.db.profile.lastdailycheck and epoch-ZGV.db.profile.lastdailycheck<12*60*60) and ZGV.db.profile.nc_dailyquest then
		NC:AddEntry("daily","Daily Quests have reset on the server.","",{dontsave=true})
	end
	ZGV.db.profile.lastweekly = weekly
	ZGV.db.profile.lastdaily = daily
	ZGV.db.profile.lastweeklycheck = epoch
	ZGV.db.profile.lastdailycheck = epoch
end

local capitalsCATA = {
	[1455] = "Ironforge",
	[1453] = "Stormwind City",
	[90] = "Undercity",
	[1457] = "Darnassus",
	[1454] = "Orgrimmar",
	[1458] = "Orgrimmar",
	[1456] = "Thunder Bluff",
	[1954] = "Silvermoon City",
	[1947] = "The Exodar",
	[1954] = "Shattrath City",
	[1955] = "Shattrath City",
	[125] = "Dalaran",
}

local capitals = {
	[87] = "Ironforge",
	[84] = "Stormwind City",
	[90] = "Undercity",
	[89] = "Darnassus",
	[85] = "Orgrimmar",
	[86] = "Orgrimmar",
	[88] = "Thunder Bluff",
	[110] = "Silvermoon City",
	[103] = "The Exodar",
	[111] = "Shattrath City",
	[125] = "Dalaran",
	[126] = "Dalaran",
	[622] = "Stormshield",
	[624] = "Warspear",
}

function NC:OrientationTrigger()
	local x,y,m=LibRover:GetPlayerPosition()

	if m and m>0 then
		if (self.LastMap ~= m or (self.city ~= m and (capitals[m] or capitalsCATA[m]))) then
			if capitals[m] or  capitalsCATA[m] then
				self.city = m
				if ZGV.db.profile.nc_orientation and not ZGV.db.global.bannedtoasts["orientation"] and not LibTaxi:IsContinentKnown() then
					ZGV:ScheduleTimer(function()
						ZGV.NotificationCenter:AddEntry("orientation","Run Startup Orientation to improve guide directions","Click to open in new tab.",{cleartype=true})
					end,2)
				elseif ZGV.DEV then
					ZGV:Print("User data available. Skipping Orientation Guide toast.")
					ZGV:Debug("User data available. Skipping Orientation Guide toast.")
				else
					ZGV:Debug("User data available. Skipping Orientation Guide toast.")
				end
			end
		end
		self.LastMap = m
	end
end

tinsert(ZGV.startups,{"NC2 startup",function(self)
	NC:Startup()
end,after="all"})
