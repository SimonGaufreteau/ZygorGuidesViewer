local ZGV = ZGV
local L = ZGV.L
local CHAIN = ZGV.ChainCall
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local SkinData = ZGV.UI.SkinData
local ZGV_Widget_Object_Mixin = ZGV_Widget_Object_Mixin

local widget={
	ident = "zygormessage",
	group = "general",
	sizes = {
		{width = 2, height = 1},
	},
	sizelimits = {
		minwidth = 2, 
		minheight = 1,
		maxwidth = 6,
		maxheight = 6,
	},
}

local function format_text(str)
	str = str:gsub("[*][*]([^\*]+)[*][*]","|cfffe6100%1|r")
	str = str:gsub("[=][=]([^\=]+)[=][=]","|cffbbbbbb%1|r")

	local bigdot = ZGV.IconSets.StepLineIcons.file
	str = str:gsub("*","|T"..bigdot..":14:14:0:0:1024:32:32:64:0:32:254:97:0|t")
	return str
end

function widget:Initialise()
	self.frame = ZGV.UI:Create("Button",ZGV.Widgets.Parent,nil,nil,"ZGV_Widget_Template")

	self.frame.header = CHAIN(self.frame:CreateFontString())
		:SetPoint("TOPLEFT",10,-10)
		:SetFont(FONTBOLD,14,"") 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_zygormessage_header"])
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.content = CHAIN(ZGV.UI:Create("ScrollChild",self.frame, nil, "editbox"))
		:SetPoint("TOPLEFT",10,-30)
		:SetPoint("BOTTOMRIGHT",-13,25)
		:Show()
		.__END
	self.frame.content:SetHideWhenUseless(true)
	CHAIN(self.frame.content.child)
		:SetText(format_text(ZGV.GuideMenu.ZygorMessage))
		:SetIgnoreParentAlpha(true)
		:Disable()

	self.frame.clicker = CHAIN(CreateFrame("Button",nil,self.frame))
		:SetAllPoints()
		:SetScript("OnClick",function() self:TogglePopup() end)
		:EnableMouse(true)
		:SetFrameLevel(self.frame.content.child:GetFrameLevel()+1)
	.__END
	if self.Floating then
		CHAIN(self.frame.clicker)	
			:SetScript("OnEnter",function() self:SetInteractive(true,true) end)
			:SetScript("OnLeave",function() self:SetInteractive(false,true) end)
			:SetScript("OnDragStart",function() self:OnDragStart() end)
			:SetScript("OnDragStop",function() self:OnDragStop() end)
			:RegisterForDrag("LeftButton")
			:SetMovable(true)
	end

	self.popup = CHAIN(ZGV.CreateFrameWithBG("Button",nil,ZGV.Widgets.Fader))
		:SetSize(ZGV.Widgets.Fader:GetWidth(),ZGV.Widgets.Fader:GetHeight())
	.__END

		self.popup.contentinner = CHAIN(CreateFrame("Frame", nil, self.popup))
			:SetPoint("TOPLEFT")
			:SetPoint("BOTTOMRIGHT")
			:SetWidth(600)
			:SetHeight(100)
			:Show()
		.__END

		self.popup.content = CHAIN(ZGV.UI:Create("ScrollChild",self.popup, nil, self.popup.contentinner))
			:SetPoint("TOPLEFT",0,-30)
			:SetPoint("BOTTOMRIGHT",-16,1)
			:Show()
			.__END
		self.popup.content:SetHideWhenUseless(true)

	Mixin(self,ZGV_Widget_Object_Mixin)
end

function widget:InitialisePopup()
	if self.popupready then return end

	ZGV.Visuals:Render(ZGV.GuideMenu.Bulletin,552,self.popup.contentinner,{TOPLEFT={10,0},EXTRASPACE=5})

	local height = self.popup.contentinner:GetHeight()

	self.popup.contentinner:SetHeight(height)
	self.popup.content:TotalValue(height)
	self.popup.content:SetValue(0)
	self.popup.content:SetVerticalScroll(0)

	self.popupready = true
end

ZGV.Widgets:RegisterWidget(widget)