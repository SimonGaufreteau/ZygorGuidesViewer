local name,ZGV = ...

local tinsert,tremove,print,ipairs,pairs,wipe=tinsert,tremove,print,ipairs,pairs,wipe
local G = _G

local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local L = ZGV.L
local CHAIN = ZGV.ChainCall

local DropDownFork = {}

ZGV.UI:RegisterWidget("DropDownFork",DropDownFork)
local SkinData = ZGV.UI.SkinData


function DropDownFork:New(parent,name)
	local container = CreateFrame("Button", name, parent,"BackdropTemplate")
	container:SetScript("OnClick",function() container:ShowMenu() end)


	container.Text = CHAIN(container:CreateFontString())
		:SetAllPoints()
		:SetFont(ZGV.Font,10)
		:SetSize(100,20)
		:SetText("...")
		:SetTextColor(1,1,1,1)
		:Show()
	.__END
	container.Button = CHAIN(CreateFrame("Button",nil,container,"ZGV_DefaultSkin_TitleButton_Template"))
		:SetPoint("TOPRIGHT",-3,-3)
		:SetPoint("BOTTOMRIGHT",-3,3)
		:SetScript("OnClick",function() container:ShowMenu() end)
		:Show()
	.__END
	container.Button.buttonkey = "DROPDOWN"
	container.Button:ApplySkin()

	container.Dropdown = CreateFrame("Frame", nil, nil, "UIDropDownForkTemplate")
	container.Dropdown.OnButtonClicked = function(button) container:SetSelected(button) end

	container.Values = {}
	container.Menu = {}
	container.Current = ""

	for f,fun in pairs(self) do
		container[f]=fun
	end

	container:ApplySkin()

	return container
end

function DropDownFork:ApplySkin()
	CHAIN(self)
		:SetBackdrop(SkinData("UIDropDownBackdrop"))
		:SetBackdropColor(unpack(SkinData("UIDropDownBackdropColor")))
		:SetBackdropBorderColor(unpack(SkinData("UIDropDownBorderColor")))

	self.Text:SetTextColor(unpack(SkinData("UIDropDownLabelColor")))
	self.Button:ApplySkin()
	self.Button:SetButtonColor(unpack(SkinData("UIDropDownLabelColor")))
end

function DropDownFork:SetName(text)
	self.Name = text
	self.Text:SetText(text)
end

function DropDownFork:ShowMenu()
	if DropDownForkList1 and DropDownForkList1:IsShown() and DropDownForkList1.dropdown==self.Dropdown then CloseDropDownForks() return end
	table.wipe(self.Menu)

	if self.ValuesFunc then self:ValuesFunc() end -- fill self.Values with options

	for i,v in ipairs(self.Values) do
		v.checked = v.checked or self.checkedfunc or function() return self.Current==v.value end
		v.func = v.func or self.buttonfunc
		table.insert(self.Menu,v)
	end

	UIDropDownFork_SetAnchor(self.Dropdown, 20, 0, "TOPRIGHT", self.Button ,"BOTTOMLEFT")
	EasyFork(self.Menu,self.Dropdown,nil,0,0,"MENU",false,"callback")
	UIDropDownFork_SetWidth(self.Dropdown, 300)
end

function DropDownFork:OnButtonClicked(func)
	self.buttonfunc = func
end

function DropDownFork:IsButtonChecked(func)
	self.checkedfunc = func
end

function DropDownFork:AddItem(text,value,func,tooltip)
	table.insert(self.Values,{
		text=text,
		func=func,
		value=value, 
		tooltipTitle=tooltip,
	})
end

function DropDownFork:SetValues(array)
	self.Values = array
end

function DropDownFork:SetValuesFunc(func)
	self.ValuesFunc = func
end

function DropDownFork:SetCurrentSelectedByValue(value)
	if self.ValuesFunc then self:ValuesFunc() end -- fill self.Values with options
	for i,v in ipairs(self.Values) do
		if v.value==value then
			self.Current = value
			if not self.Name then
				self.Text:SetText(v.text)
			end
		end
	end
end

function DropDownFork:GetCurrentSelectedText()
	for i,v in ipairs(self.Values) do
		if v.value==self.Current then
			return v.text
		end
	end
end

function DropDownFork:AddTooltip()
end

function DropDownFork:SetSelected(button)
	self.Current = button.value
	if not self.Name then
		self.Text:SetText(button:GetText())
	end
end