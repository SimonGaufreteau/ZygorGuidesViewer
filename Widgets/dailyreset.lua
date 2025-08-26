local ZGV = ZGV
local L = ZGV.L
local CHAIN = ZGV.ChainCall
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local SkinData = ZGV.UI.SkinData
local ZGV_Widget_Object_Mixin = ZGV_Widget_Object_Mixin

local widget={
	ident = "dailyreset",
	group = "dailies",
	sizes = {
		{width = 2,height = 1}
	},
	sizelimits = {
		minwidth = 2, 
		minheight = 1,
		maxwidth = 2,
		maxheight = 1,
	},
	tick = 1,
}

function widget:Initialise()
	self.frame = ZGV.UI:Create("Button",ZGV.Widgets.Parent,nil,nil,"ZGV_Widget_Template")

	self.frame.header = CHAIN(self.frame:CreateFontString())
		:SetFont(FONTBOLD,14) 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_dailyreset_header"])
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.text = CHAIN(self.frame:CreateFontString())
		:SetFont(FONT,18) 
		:SetTextColor(1,1,1,1)
		:SetText("")
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.header:SetPoint("BOTTOM",self.frame.text,"TOP",0,2)
	self.frame.text:SetPoint("CENTER")
	
	Mixin(self,ZGV_Widget_Object_Mixin)
end

local function format_text(str)
	str = str:gsub("[*][*]([^\*]+)[*][*]","|cfffe6100%1|r")
	str = str:gsub("[=][=]([^\=]+)[=][=]","|cffbbbbbb%1|r")

	local bigdot = ZGV.IconSets.StepLineIcons.file
	str = str:gsub("*","|T"..bigdot..":14:14:0:0:1024:32:32:64:0:32:254:97:0|t")
	return str
end

function widget:Update(forced)		--the argument is for fake toast option
	local seconds
	if not forced then
		seconds = C_DateAndTime.GetSecondsUntilDailyReset()
		local res = ZGV.F.GetTimeFromSeconds(seconds,"short")

		self.frame.text:SetText(res)
	else
		seconds = 0
	end
	if not ZGV.IsClassic then

		if not ZGV.db.global.nextdailyreset then
			ZGV.db.global.nextdailyreset = C_DateAndTime.GetSecondsUntilDailyReset()
		elseif (C_DateAndTime.GetSecondsUntilDailyReset() > ZGV.db.global.nextdailyreset) then
			ZGV.db.global.nextdailyreset = C_DateAndTime.GetSecondsUntilDailyReset()
		end
	end

end


function widget:OnTick()
	self:Update()
end

ZGV.Widgets:RegisterWidget(widget)