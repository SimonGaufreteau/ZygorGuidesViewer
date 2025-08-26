local ZGV = ZGV
local L = ZGV.L
local CHAIN = ZGV.ChainCall
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local SkinData = ZGV.UI.SkinData
local ZGV_Widget_Object_Mixin = ZGV_Widget_Object_Mixin

local widget={
	ident = "valor",
	group = "dungeons",
	sizes = {
		{width = 2,height = 1}
	},
	sizelimits = {
		minwidth = 2, 
		minheight = 1,
		maxwidth = 2,
		maxheight = 1,
	},
	events = {
		CURRENCY_DISPLAY_UPDATE=true,
	},
	valid = ZGV.IsRetail,
}

function widget:Initialise()
	self.frame = ZGV.UI:Create("Button",ZGV.Widgets.Parent,nil,nil,"ZGV_Widget_Template")
	self.frame.header = CHAIN(self.frame:CreateFontString())
		:SetFont(FONTBOLD,14) 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_valor_header"])
		:SetIgnoreParentAlpha(true)
	.__END
	self.frame.text = CHAIN(self.frame:CreateFontString())
		:SetFont(FONT,18) 
		:SetTextColor(1,1,1,1)
		:SetText("")
		:SetIgnoreParentAlpha(true)
	.__END
	self.frame.cap = CHAIN(self.frame:CreateFontString())
		:SetPoint("TOP",self.frame.text,"BOTTOM",0,-2)
		:SetFont(FONT,12) 
		:SetTextColor(1,1,1,1)
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.header:SetPoint("BOTTOM",self.frame.text,"TOP",0,2)
	self.frame.text:SetPoint("CENTER")

	Mixin(self,ZGV_Widget_Object_Mixin)
end

function widget:Update()
	local currency = C_CurrencyInfo.GetCurrencyInfo(1191)

	if currency.maxQuantity>0 then
		self.frame.text:SetText(L["widget_capped_general"]:format(currency.quantity,currency.maxQuantity))
	else
		self.frame.text:SetText(currency.quantity)
	end

	if (currency.maxWeeklyQuantity or 0) > 0 then
		self.frame.cap:SetText(L["widget_capped_weekly"]:format(currency.quantityEarnedThisWeek,currency.maxWeeklyQuantity))
		self.frame.cap:Show()
	else
		self.frame.cap:Hide()
	end
end

function widget:OnEvent(event,...)
	self:Update()
end


ZGV.Widgets:RegisterWidget(widget)