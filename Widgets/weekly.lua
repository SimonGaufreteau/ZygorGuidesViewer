local ZGV = ZGV
local L = ZGV.L
local CHAIN = ZGV.ChainCall
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local SkinData = ZGV.UI.SkinData
local ZGV_Widget_Object_Mixin = ZGV_Widget_Object_Mixin

local widget={
	ident = "weeklyquests",
	group = "dailies",
	sizes = {
		{width = 3,height = 2}
	},
	sizelimits = {
		minwidth = 3, 
		minheight = 2,
		maxwidth = 3,
		maxheight = 3,
	},
	tick = 1,
}

local function row_onenter(row)
	if not row.text:GetText() then return end
	GameTooltip:SetOwner(row, "ANCHOR_BOTTOM")
	GameTooltip:SetText(row.text:GetText(), 1, 1, 1, 1, true)
	GameTooltip:AddLine(row.tooltip, 1.0, 0.82, 0.0, 1.0, true)
	GameTooltip:Show()
end

local function row_onleave(row)
	GameTooltip:Hide()
end

local function row_onclick(row)
	local mapID = C_TaskQuest.GetQuestZoneID(row.questID)
	ZGV.WorldQuests:SuggestWorldQuestGuide(nil,row.questID,true,mapID)
end

function widget:Initialise()
	self.frame = ZGV.UI:Create("Button",ZGV.Widgets.Parent,nil,nil,"ZGV_Widget_Template")
	self.frame.header = CHAIN(self.frame:CreateFontString())
		:SetPoint("TOPLEFT",10,-10)
		:SetFont(FONTBOLD,14) 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_weeklyquests_header"])
		:SetIgnoreParentAlpha(true)
	.__END

	self.frame.empty = CHAIN(self.frame:CreateFontString())
		:SetPoint("CENTER")
		:SetFont(FONT,14) 
		:SetTextColor(1,1,1,1)
		:SetText(L["widget_weeklyquests_empty"])
		:Show()
		:SetIgnoreParentAlpha(true)
	.__END

	self.rows = {}
	local prev

	for i=1,6 do
		local row = CHAIN(CreateFrame("Button",nil,self.frame))
			:SetPoint("RIGHT")
			:SetHeight(20)
			:SetScript("OnEnter",row_onenter)
			:SetScript("OnLeave",row_onleave)
			--:SetScript("OnClick",row_onclick)
			:Hide()
			:SetIgnoreParentAlpha(true)
		.__END
		if prev then
			row:SetPoint("TOPLEFT",prev,"BOTTOMLEFT",0,-2)
		else
			row:SetPoint("TOPLEFT",self.frame.header,"BOTTOMLEFT",0,-8)
		end
		
		prev = row

		row.tex = CHAIN(row:CreateTexture())
			:SetPoint("LEFT")
			:SetSize(20,20)
			:SetTexture(ZGV.IconSets.ExpansionIcons.file)
			:Show()
		.__END

		row.text = CHAIN(row:CreateFontString())
			:SetFont(FONT,13)
			:SetPoint("LEFT",row.tex,"RIGHT",5,0)
			:SetPoint("RIGHT",row,-10,0)
			:SetWordWrap(false)
			:SetJustifyH("LEFT")
		.__END

		table.insert(self.rows,row)
	end

	self.region = GetCVar("portal")

	Mixin(self,ZGV_Widget_Object_Mixin)
end

local sortorder = {
	DRAGON = 1,
	SHADOW = 2,
	BFA = 3,
	LEGION = 4,
	WOD = 5,
	MOP = 6,
	CATA = 7,
	WOTLK = 8,
	TBC = 9,
	VANILLA = 10,
}

local results = {}
function widget:Update()
	if not (ZGV_WIDGET_DATA and ZGV_WIDGET_DATA.Weekly) then return end
	if not ZGV_WIDGET_DATA.Weekly[self.region] then return end

	table.wipe(results)

	self.frame.empty:Show()
	for _,row in ipairs(self.rows) do row:Hide() end

	for quest,data in pairs(ZGV_WIDGET_DATA.Weekly[self.region]) do
		table.insert(results, {quest, data[3], ZGV.QuestDB:GetQuestName(tonumber(quest)),data[4]})
	end

	if #results==0 then return end

	table.sort(results, function(a,b) 
		if a[2]==b[2] then
			return (a[3] or "") < (b[3] or "")
		else
			return sortorder[a[2]] < sortorder[b[2]]
		end
	end)

	self.frame.empty:Hide()

	for i,qdata in pairs(results) do
		local qid = qdata[1]
		local qname = qdata[3]

		local row = self.rows[i]
		if row then
			row.text:SetText(qname)
			row.questID = qid
			row.tooltip = qdata[4]
			if C_QuestLog.IsQuestFlaggedCompleted(qid) then
				ZGV.IconSets.StepLineIcons['CHECK']:AssignToTexture(row.tex)
			else
				ZGV.IconSets.ExpansionIcons[qdata[2]]:AssignToTexture(row.tex)
			end
			row.tex:Show()
			row:Show()
		end
	end
end


function widget:OnTick()
	self:Update()
end

ZGV.Widgets:RegisterWidget(widget)