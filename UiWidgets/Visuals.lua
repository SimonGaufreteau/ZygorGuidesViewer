local name,ZGV = ...
local ZGV = ZGV

local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local L = ZGV.L
local CHAIN = ZGV.ChainCall
local SkinData = ZGV.UI.SkinData

ZGV.Visuals = {}
local Visuals = ZGV.Visuals

--[[
params:
	data - array of elements to be created
	width - optional if parent is provided - target width of elements
	parent - optional - frame to be filled with elements. if none, new width given width will be created
	config - array of optional settings
		NOWORDWRAP -- should list and item elements not be wordwrapped
		GUIDESTATUS -- shows guide completion status as icon
		GUIDESTATUSBACKGROUND -- shows guide completion status as background color
		FIRSTANCHOR -- if set, first element is anchored to given object instead to parent
		TOPLEFT -- if set, first element is anchored to parent with given margins
		EXTRASPACE -- if set, adds extra vertical space between elements
		POSTCLICK -- function to be called after element onclick is executed
		BOTTOMPADDING -- array of element type=int of extra space to add after element (modifies height, nulls space)
		...
--]]

function Visuals:Render(data,width,parent,config)
	local renderer = {}
	setmetatable(renderer,{ __index=Visuals })

	renderer.WIDTH = width
	if parent then
		if not width then renderer.WIDTH=parent:GetWidtth() end
		renderer.PARENT = parent
	else
		renderer.PARENT = CreateFrame("Frame")
		renderer.PARENT:SetWidth(width)
	end

	-- copy config to renderer
	if config then
		for i,v in pairs(config) do
			renderer[i]=v
		end
	end

	-- set dedfault bottom padding
	renderer.BOTTOMPADDING = renderer.BOTTOMPADDING or {}
	renderer.BOTTOMPADDING.item = renderer.BOTTOMPADDING.item or 10
	renderer.BOTTOMPADDING.content = renderer.BOTTOMPADDING.content or 30
	renderer.BOTTOMPADDING.section = renderer.BOTTOMPADDING.section or 10

	local PREV
	local HEIGHT = renderer.ANCHOR and renderer.ANCHOR[2]:GetBottom() or 0
	renderer.PARENT.Objects = {}

	local content_block
	for i,element in ipairs(data) do
		if (not element.faction or (element.faction==faction)) and (not element.beta or ZGV.BETA) then
			local object, e_height, space,guideslist_content
			if renderer[element[1]] then
				object,e_height,space,guideslist_content= renderer[element[1]](renderer,element)
			else
				print("Unknown visual element at",i,element[1])
				return false
			end

			if guideslist_content then
				if not object then 
					guideslist_content:Hide() 
				else
					guideslist_content:Show()
					if PREV then
						guideslist_content:SetPoint("TOPLEFT",PREV,"BOTTOMLEFT",0,-space)
					elseif renderer.FIRSTANCHOR then
						guideslist_content:SetPoint(unpack(renderer.FIRSTANCHOR))
					else
						local top,left = 10,-5
						if renderer.TOPLEFT then top,left = unpack(renderer.TOPLEFT) end
						guideslist_content:SetPoint("TOPLEFT",renderer.PARENT,"TOPLEFT",top,left)
					end
					table.insert(renderer.PARENT.Objects,guideslist_content)
					PREV = guideslist_content
					HEIGHT = HEIGHT + e_height + space
				end
			end


			if object then
				if element[1]=="content" then
					content_block = object
				elseif content_block then
					object.parentblock = content_block
				end

				element.object = object
				object:Show()

				if PREV then
					object:SetPoint("TOPLEFT",PREV,"BOTTOMLEFT",0,-space)
				elseif renderer.FIRSTANCHOR then
					object:SetPoint(unpack(renderer.FIRSTANCHOR))
				else
					local top,left = 10,-5
					if renderer.TOPLEFT then top,left = unpack(renderer.TOPLEFT) end
					object:SetPoint("TOPLEFT",renderer.PARENT,"TOPLEFT",top,left)
				end
				table.insert(renderer.PARENT.Objects,object)
				PREV = object
				HEIGHT = HEIGHT + e_height + space
			end
		end
	end

	renderer.PARENT:SetHeight(HEIGHT)

	return renderer.PARENT,renderer
end

function Visuals:GetAsString(data)
	local output = ""
	for i,element in ipairs(data) do
		if (not element.faction or (element.faction==faction)) and (not element.beta or ZGV.BETA) then
			if Visuals.AsString[element[1]] then
				local elementtxt = Visuals.AsString[element[1]](element)
				output = output .. elementtxt.."|n"
			end
		end
	end
	return output
end

local faction=UnitFactionGroup("player"):sub(1,1)

local function SetTextColors(str,gray,dev)
	if not (gray or dev) then
		str = str:gsub("[**]+([^\*]+)[**]+","|cfffe6100%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffbbbbbb%1|r")
	elseif dev then
		str = str:gsub("[**]+([^\*]+)[**]+","|cffff9a5c%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffbbbbbb%1|r")
		if not str:find("(DEV)") then str=str .. " (DEV)" end
	else
		str = str:gsub("[**]+([^\*]+)[**]+","|cffaaaaaa%1|r")
		str = str:gsub("[==]+([^\=]+)[==]+","|cffaaaaaa%1|r")
	end
	return str
end

Visuals.AsString = {}

Visuals.generic = function(self,element)
	local PARENT = self.TEMPPARENT or self.PARENT
	self.TEMPPARENT = nil

	local object = CHAIN(ZGV.UI:Create("Button",PARENT))
		:SetNormalBackdropColor(0,0,0,0)
		:SetBackdropBorderColor(0,0,0,0)
		:RegisterForClicks("AnyUp")
		:SetPoint("LEFT")
		:SetScript("OnEnter",function(self) 
			if self.cursor then SetCursor(self.cursor) end
			if self.onenterfunc then
				self:onenterfunc()
			elseif self.tooltip then 
				local text = type(self.tooltip)=="function" and self.tooltip() or self.tooltip
				GameTooltip:SetOwner(self, "ANCHOR_CURSOR")
				GameTooltip:AddLine(text)
				GameTooltip:Show()
			end
		end)
		:SetScript("OnLeave",function(self) 
			if self.cursor then SetCursor(nil) end 
			if self.onleavefunc then
				 self:onleavefunc()
			else
				GameTooltip:Hide()
			end
		end)
	.__END
	object.text = CHAIN(object:GetFontString())
		:SetFont(FONT,13)
		:ClearAllPoints()
		:SetPoint("LEFT")
		:SetPoint("RIGHT")
		:SetJustifyH("LEFT")
	.__END
	
	object.tooltip = element.tooltip

	if element.onclick then
		object:SetScript("OnClick", function() 
			element.onclick() 
			if self.POSTCLICK then self.POSTCLICK() end
		end)
	elseif element.guide then
		if not element.text then
			local guide = ZGV:GetGuideByTitle(element.guide)
			if guide and not guide.missing then 
				element.text = "**"..(guide.title_short or element.guide).."**"
			else
				local folder,title = element.guide:match("^(.+)\\(.-)$")
				element.text = "**"..(title).."**"
			end
		end

		if element.action=="select" then
			object:SetScript("OnClick", function() 
				local folder,_ = element.guide:match("^(.+)\\(.-)$")
				ZGV.GuideMenu:Show(folder)
				ZGV.GuideMenu.FocusedGuide = ZGV:GetGuideByTitle(element.guide)
				ZGV.GuideMenu:ShowGuideDetails(ZGV.GuideMenu.FocusedGuide)
				ZGV.GuideMenu:Update()
				if self.POSTCLICK then self.POSTCLICK() end
			end)
		else
			local guide = ZGV:GetGuideByTitle(element.guide)
			if guide and not guide.missing then
				object:SetScript("OnClick", function() -- maybe OnDoubleClick?
					ZGV.GuideMenu:ActivateGuide(ZGV:GetGuideByTitle(element.guide))
					if self.POSTCLICK then self.POSTCLICK() end
				end)
			end
		end
	elseif element.folder then
		element.folder = element.folder:gsub("\\$","")
		if not element.text then
			local path,tit = element.folder:match("^(.*)\\+(.-)$")
			element.text = tit
		end

		object:SetScript("OnClick", function() 
			ZGV.GuideMenu:Show(element.folder) 
			if self.POSTCLICK then self.POSTCLICK() end
		end)
	elseif element.featured then
		object:SetScript("OnClick", function()
			if not ZGV.GuideMenu.FeaturedReady then return end
			ZGV.GuideMenu:Show("Featured") 
			ZGV.GuideMenu:ShowFeatured(element.featured,element.section)
			if self.POSTCLICK then self.POSTCLICK() end
		end)

	else
		object:EnableMouse(false)
		object:SetPushedTextOffset(0,0)
	end
	return object
end
Visuals.AsString.generic = function(element)
	return ""
end

Visuals.title = function(self,element,width)
	local space = element.space or 30
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	width = width or element.width or self.WIDTH
	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetText(SetTextColors(element.text))
		:SetFont(element.volume or FONT,element.fontsize or 18)
	.__END
	if element.center then object.text:SetJustifyH("CENTER") end
	object.text:SetWordWrap(false)
	local text_height = object.text:GetStringHeight()
	if self.BOTTOMPADDING["title"] then
		text_height = text_height + self.BOTTOMPADDING["title"]
	end

	object:SetHeight(text_height)

	object.ztype = "title"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.title = function(element)
	return "title"..element.text..(element.guide or element.folder or element.featured or "")

end

Visuals.banner = function(self,element,width)
	local space = element.space or 5
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	width = width or element.width or self.WIDTH
	local object = CHAIN(Visuals.generic(self,element))
		:SetSize(width,element.height or 109)
	.__END

	object:SetTexture(element.image)
	--object.cursor = "Interface\\CURSOR\\vehichleCursor"

	if element.top then object:SetTexCoord(element.top, element.bottom, element.left, element.right) end

	if element.onclick then
		object:SetHighlightTexture(ZGV.DIR.."\\Skins\\white")
		--object:GetHighlightTexture()
		CHAIN(object:GetHighlightTexture())
			:SetBlendMode("ADD")
			:SetAlpha(0.1)
	end

	local element_height = element.height or 109
	if self.BOTTOMPADDING["banner"] then
		object.tex:ClearAllPoints()
		object.tex:SetPoint("TOPLEFT")
		object.tex:SetPoint("BOTTOMRIGHT",0,self.BOTTOMPADDING["banner"])
		element_height = element_height + self.BOTTOMPADDING["banner"]
	end
	object:SetHeight(element_height)

	object.ztype = "banner"
	object.space = space
	return object,element_height,space
end
Visuals.AsString.banner = function(element)
	return "banner"..element.image..(element.guide or element.folder or element.featured or "")
end

Visuals.text = function(self,element,width)
	local space = element.space or 5
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	width = width or element.width or self.WIDTH

	local object = CHAIN(Visuals.generic(self,element))
		:SetFont(FONT,element.fontsize or 13)
		:SetWidth(width)
		:SetText(SetTextColors(element.text))
		
	.__END
	CHAIN(object.text)
		:SetWordWrap(true)
		:SetWidth(width)
		:SetSpacing(6)
		:ClearAllPoints()
		:SetPoint("LEFT",2,0)

	if element.center then
		object.text:SetJustifyH("CENTER") 
	else
		object.text:SetJustifyH("LEFT")
	end

	local text_height = object.text:GetStringHeight()

	if self.BOTTOMPADDING["text"] then
		text_height = text_height + self.BOTTOMPADDING["text"]
	end
	
	object:SetHeight(text_height)

	object.ztype = "text"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.text = function(element)
	return "text"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.item = function(self,element,width,mode)
	local space = element.space or 5
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	mode = mode or element.mode or self.MODE
	width = width or element.width or self.WIDTH
	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetFont(FONT,element.fontsize or 13)
		:SetTexture(ZGV.IconSets.StepLineIcons.file)
	.__END
	if element.size == "S" then
		object:SetTexCoord(unpack(ZGV.IconSets.StepLineIcons['DOT'].texcoord))
	else
		object:SetTexCoord(unpack(ZGV.IconSets.StepLineIcons['BIGDOT'].texcoord))
	end
	object.GUIDESTATUSBACKGROUND = self.GUIDESTATUSBACKGROUND

	
	local guide = (object.guide or element.guide) and ZGV:GetGuideByTitle(object.guide or element.guide)
	local folder = (object.folder or element.folder) and ZGV:FindOrCreateGroup(ZGV.registered_groups,object.folder or element.folder,"onlyfind")
	self.guide = guide
	self.folder = folder

	
	if (guide and not guide.missing) or folder then
		object:SetText(SetTextColors(element.text,false,guide and guide.devonly))
	else
		object:SetText(SetTextColors(element.text,(object.guide or element.guide or object.folder or element.folder)))
	end
	
	CHAIN(object)
		:SetBackdrop(SkinData("MainBackdrop"))
		:SetBackdropColor(ZGV.F.HTMLColor("#222222"))
		:SetBackdropBorderColor(0,0,0,0)

	function object:onenterfunc()
		local guide = ZGV:GetGuideByTitle(element.guide)
		local tooltip = ZGV.GuideMenu.FeaturedTooltip

		if guide and not guide.missing then 
			if not guide.description or guide.description=="" then return end
			tooltip.Text:SetText(object.tooltip or guide.description)

			if guide.headerdata.model then
				tooltip.GuideModel:SetModels(guide.headerdata.model)
				tooltip.GuideModel:Show()
				tooltip.Text:SetWidth(150)
				tooltip:SetHeight(max(ZGV.GuideMenu.FeaturedTooltip.Text:GetStringHeight()+10,100))
			else
				tooltip.GuideModel:Hide()
				tooltip.Text:SetWidth(250)
				tooltip:SetHeight(ZGV.GuideMenu.FeaturedTooltip.Text:GetStringHeight()+10)
			end
		else
			tooltip.GuideModel:Hide()
			tooltip.Text:SetText(L["guidemenu_missing_guide"])
			tooltip.Text:SetWidth(250)
			tooltip:SetHeight(ZGV.GuideMenu.FeaturedTooltip.Text:GetStringHeight()+10)
		end
		
		tooltip:SetPoint("BOTTOMLEFT",object,"TOPLEFT")
		--tooltip:SetParent(object)
		tooltip:Show()
	end

	function object:onleavefunc()
		ZGV.GuideMenu.FeaturedTooltip:Hide()
	end

	CHAIN(object.tex)
		:ClearAllPoints()
		:SetPoint("TOPLEFT",3,1)
		:SetSize(16,16)
		:SetVertexColor(ZGV.F.HTMLColor("#fe6100ff"))

	CHAIN(object.text)
		--:SetPoint("TOP")
		:SetPoint("LEFT",object.tex,"RIGHT",7,0)
		:SetWidth(width-15)
		:SetWordWrap(not self.NOWORDWRAP)
		:SetSpacing(4)

	if element.icon then
		CHAIN(object.tex)
			:ClearAllPoints()
			:SetSize(14,14)
			:SetVertexColor(1,1,1,1)
			:SetPoint("LEFT",3,0)
		if element.guide then
			local guide = ZGV:GetGuideByTitle(element.guide)
			ZGV.IconSets.TabsIcons[element.guide.type]:AssignToTexture(object.tex)
		else
			ZGV.IconSets.TabsIcons[element.icon]:AssignToTexture(object.tex)
		end
	end

	if self.GUIDESTATUS then
		CHAIN(object.tex)
			:ClearAllPoints()
			:SetSize(14,14)
			:SetVertexColor(1,1,1,1)
			:SetPoint("LEFT",3,0)
			:SetTexture(ZGV.IconSets.GuideIconsSmall.file)
		object.text:SetPoint("LEFT",object.tex,"RIGHT",4,-1)
		function object:updatefunc()
			if element.guide then
				local guide = ZGV:GetGuideByTitle(element.guide)
				local status=guide and guide.GetStatus and guide:GetStatus("detailed")
				local complete=(status=="COMPLETE")

				if complete then
					self.tex:SetTexture(ZGV.IconSets.StepLineIcons.file)
					self.tex:SetTexCoord(unpack(ZGV.IconSets.StepLineIcons['CHECK'].texcoord))
					if self.GUIDESTATUSBACKGROUND then
						CHAIN(self)
							:SetBackdropColor(ZGV.F.HTMLColor(ZGV_Override_BG or "#003300"))
							:SetBackdropBorderColor(ZGV.F.HTMLColor(ZGV_Override_BD or "#004400"))
					end
				else
					self.tex:SetTexCoord(unpack(ZGV.IconSets.GuideIconsSmall['GUIDE'].texcoord))
					if self.GUIDESTATUSBACKGROUND then
						CHAIN(self)
							:SetBackdropColor(ZGV.F.HTMLColor("#222222"))
							:SetBackdropBorderColor(0,0,0,0)
					end
				end
			elseif element.folder then
				self.tex:SetTexCoord(unpack(ZGV.IconSets.GuideIconsSmall['FOLDER'].texcoord))
			end
		end

		object:updatefunc()
	end

	local text_height = object.text:GetStringHeight()+5

	if self.BOTTOMPADDING["item"] then
		text_height = text_height + self.BOTTOMPADDING["item"]
	end

	object:SetHeight(text_height)

	object.ztype = "item"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.item = function(element)
	return "item"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.list = function(self,element,width)
	local space = element.space or 5
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	mode = mode or element.mode or self.MODE
	width = width or element.width or self.WIDTH
	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetFont(FONT,element.fontsize or 13)
		:SetTexture(ZGV.IconSets.StepLineIcons.file)
	.__END
	if element.size == "S" then
		object:SetTexCoord(unpack(ZGV.IconSets.StepLineIcons['DOT'].texcoord))
	else
		object:SetTexCoord(unpack(ZGV.IconSets.StepLineIcons['BIGDOT'].texcoord))
	end

	
	local guide = (object.guide or element.guide) and ZGV:GetGuideByTitle(object.guide or element.guide)
	local folder = (object.folder or element.folder) and ZGV:FindOrCreateGroup(ZGV.registered_groups,object.folder or element.folder,"onlyfind")
	self.guide = guide
	self.folder = folder
	
	if (guide and not guide.missing) or folder then
		object:SetText(SetTextColors(element.text,false,guide and guide.devonly))
	else
		object:SetText(SetTextColors(element.text,(object.guide or element.guide or object.folder or element.folder)))
	end
	
	CHAIN(object.tex)
		:ClearAllPoints()
		:SetPoint("TOPLEFT",3,1)
		:SetSize(16,16)
		:SetVertexColor(ZGV.F.HTMLColor("#fe6100ff"))

	CHAIN(object.text)
		--:SetPoint("TOP")
		:SetPoint("TOPLEFT",object.tex,"TOPRIGHT",7,0)
		:SetWidth(width-15)
		:SetWordWrap(not self.NOWORDWRAP)
		:SetSpacing(4)

	local text_height = object.text:GetStringHeight()+5

	if self.BOTTOMPADDING["list"] then
		text_height = text_height + self.BOTTOMPADDING["list"]
	end

	object:SetHeight(text_height)

	object.ztype = "list"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.list = function(element)
	return "list"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.columns = function(self,element,width)
	local space = 5
	if self.EXTRASPACE then space = space + self.EXTRASPACE end
	width = width or element.width or self.WIDTH

	local object = CHAIN(CreateFrame("Frame", nil, self.PARENT))
		:SetWidth(width)
		:SetHeight(20)
	.__END
	object.Columns = {}

	local count = 0
	for i=2,#element do
		if element[i][1]=="column" then count=count+1 end
	end

	local c_width = math.floor((width - 5*(count-1)) / max(1,count))

	local current_column
	local height = 0
	local max_height = 0
	local prev

	local padding = 5


	if count>0 then
		for i=2,#element do -- from 2, since 1 is the "columns" keyword
			local colelement = element[i]
			if colelement[1]=="column" then
				local column = CHAIN(CreateFrame("Frame", nil, object)):SetWidth(c_width).__END
				current_column = column
				height = 0
				prev = nil
				column.Elements = {}
				table.insert(object.Columns,column)
				if #object.Columns==1 then
					column:SetPoint("TOPLEFT",object,"TOPLEFT",0,0)
				else
					column:SetPoint("TOPLEFT",object.Columns[#object.Columns-1],"TOPRIGHT",5,0)
				end

			else
				if (not colelement.faction or (colelement.faction==faction)) then	
					local subobject, s_height, s_space
					if Visuals[colelement[1]] then
						subobject,s_height,s_space = Visuals[colelement[1]](self,current_column,colelement,c_width)
					else
						print("Unknown column element at",i,colelement[1])
						return false
					end

					table.insert(current_column.Elements,subobject)

					subelement.object = subobject


					if prev then
						subobject:SetPoint("TOPLEFT",prev,"BOTTOMLEFT",0,-padding)
					else
						subobject:SetPoint("TOPLEFT",current_column,"TOPLEFT",0,-padding)
					end
					height=height+s_height+padding
					prev=subobject
				end
			end
			max_height = math.max(max_height,height)
		end
	else -- no columns defined, auto assign two column layout
		for i=2,#element do -- from 2, since 1 is the "columns" keyword
			local colelement = element[i]
			if (not colelement.faction or (colelement.faction==faction)) then
				count = count + 1
			end
		end

		if count==0 then count = 1 end

		count = math.min((element.count or 2),count)
		c_width = math.floor((width - 5*(count-1)) / count)
		for i=1,count do
			local column = CHAIN(CreateFrame("Frame", nil, object)):SetWidth(c_width).__END
			height = 0
			column.Elements = {}
			table.insert(object.Columns,column)
			if #object.Columns==1 then
				column:SetPoint("TOPLEFT",object,"TOPLEFT",-3,0)
			else
				column:SetPoint("TOPLEFT",object.Columns[#object.Columns-1],"TOPRIGHT",5,0)
			end
		end

		local prev = {}

		local validcount = 1
		for i=2,#element do -- from 2, since 1 is the "columns" keyword
			local colelement = element[i]
			if (not colelement.faction or (colelement.faction==faction)) then
				validcount = validcount + 1
				local subobject, s_height, s_space

				local position = (validcount-2)%count+1

				if Visuals[colelement[1]] then
					self.TEMPPARENT = object.Columns[position]
					subobject,s_height,s_space = Visuals[colelement[1]](self,colelement,c_width)
				else
					print("Unknown subcolumn element at",i,colelement[1])
					return false
				end

				table.insert(object.Columns[position].Elements,subobject)
				colelement.object = subobject


				if prev[position] then
					subobject:SetPoint("TOPLEFT",prev[position],"BOTTOMLEFT",0,-padding)
				else
					subobject:SetPoint("TOPLEFT",object.Columns[position],"TOPLEFT",0,-padding)
				end
				
				if position==1 then height=height+s_height+padding end
				prev[position]=subobject

				max_height = math.max(max_height,height)
			end
		end
	end

	max_height = max_height + padding


	for i,column in ipairs(object.Columns) do
		column:SetHeight(max_height)
	end

	if self.BOTTOMPADDING["columns"] then
		max_height = max_height + self.BOTTOMPADDING["columns"]
	end

	object:SetHeight(max_height+space)


	object.ztype = "columns"
	object.space = space

	return object,max_height,space
end
Visuals.AsString.columns = function(element)
	local coltext = ""
	for i=2,#element do coltext = coltext .. Visuals.AsString[element[i][1]](element[i]) end
	return "columns"..(element.text or "")..coltext..(element.guide or element.folder or element.featured or "")
end

Visuals.content = function(self,element,width)
	local space = element.space or 10
	if self.EXTRASPACE then space = space + self.EXTRASPACE end
	width = width or element.width or self.WIDTH

	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetText(SetTextColors(element.text))
		:SetFont(FONTBOLD,element.fontsize or 16)
		:EnableMouse(true)
	.__END
	object.text:SetWordWrap(false)

	object.Toggle = CHAIN(self.PARENT:CreateTexture())
		:SetTexture(ZGV.ButtonSets.TitleButtons.file)
		:SetSize(14,14)
		:SetVertexColor(1,1,1,1)
		:SetPoint("RIGHT",object,"RIGHT",0,0)
	.__END

	object:SetScript("OnClick",function() 
		object.group_visible = not object.group_visible
		object:UpdateText()

		ZGV.db.profile.featuredhide[object.group_ident] = not object.group_visible
		ZGV.GuideMenu:ShowFeatured(unpack(ZGV.GuideMenu.ActiveFeatured))
	end) 

	function object:UpdateText() -- after loading of clicking
		if object.group_visible then
			object.Toggle:SetTexCoord(unpack(ZGV.ButtonSets.TitleButtons['MINUS'].texcoords[1]))
		else
			object.Toggle:SetTexCoord(unpack(ZGV.ButtonSets.TitleButtons['PLUS'].texcoords[1]))
		end
	end

	object.Decor = CHAIN(self.PARENT:CreateTexture())
		:SetTexture(ZGV.DIR.."\\Skins\\white")
		:SetSize(width,1)
		:SetVertexColor(ZGV.F.HTMLColor("#363636ff"))
		:SetPoint("TOP",object,"BOTTOM",0,5)
	.__END

	object.Elements = {}

	local text_height = object.text:GetStringHeight()

	if self.BOTTOMPADDING["content"] then
		text_height = text_height + self.BOTTOMPADDING["content"]
	end

	
	object:SetHeight(text_height)

	object.ztype = "content"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.content = function(element)
	return "content"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.guideslist = function(self,element,width)
	local space = e and element.space or 15
	if self.EXTRASPACE then space = space + self.EXTRASPACE end
	width = width or (e and element.width) or self.WIDTH

	element.text = element.text or element.content

	local results = ZGV:FindFilteredGuides(element.filters)
	table.sort(results,function(a,b) return a[2]<b[2] end)

	element.columns = element.columns or 2

	local guideslist_content
	if element.text then
		guideslist_content = Visuals.content(self,element,width)
	end

	if #results==0 and element.text then
		if guideslist_content then 
			guideslist_content.force_hidden=true 
			guideslist_content.group_visible=false 
			guideslist_content:Hide()
			guideslist_content.Toggle:Hide()
			guideslist_content.Decor:Hide()
		end
		return false,0,0,guideslist_content
	end
	
	-- create placeholder to be fed to columns parser later
	local creator = {count=element.columns}

	-- add guides to columns, spreading evenly
	local counter = 0
	for i,v in ipairs(results) do
		counter = counter + 1
		table.insert(creator,{"item",guide=v[1]})
		if element.limit and counter == element.limit then break end
	end

	-- set creator to be columns
	table.insert(creator,1,"columns")

	-- make columns
	local object, height, space = Visuals.columns(self,creator,width)

	object.ztype = "guideslist"
	return object,1,space,guideslist_content
end
Visuals.AsString.guideslist = function(element)
	local filters,temp = "",{}
	if element.filters then
		for i,v in pairs(element.filters) do
			if type(v)=="table" then
				table.insert(temp,i..table.concat(v,","))
			else
				table.insert(temp,i..v)
			end
		end
		table.sort(temp)
		filters = table.concat(temp,",")

	end
	return "guideslist"..(element.content or "")..filters..(element.text or "")..(element.guide or element.folder or element.featured or "")
end

Visuals.section = function(self,element,width)
	local space = element.space or 10
	if self.EXTRASPACE then space = space + self.EXTRASPACE end
	width = width or element.width or self.WIDTH

	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetText(SetTextColors(element.text))
		:SetFont(FONTBOLD,element.fontsize or 14)
	.__END

	local tabicon = ZGV.IconSets.TabsIcons[element.text]
	if not tabicon.default then
		object:SetTexture(ZGV.IconSets.TabsIcons.file)
		CHAIN(object.tex)
			:ClearAllPoints()
			:SetPoint("LEFT",5,-3)
			:SetSize(18,18)
			:Show()
		object.text:SetPoint("LEFT",30,-3)

		object.tex:SetTexCoord(unpack(tabicon.texcoord))
		object:SetText(tabicon.label)
	end

	
	local text_height = object.text:GetStringHeight()

	if self.BOTTOMPADDING["section"] then
		text_height = text_height + self.BOTTOMPADDING["section"]
	end

	
	object:SetHeight(text_height)
	--object:SetBackdropBorderColor(1,1,1,1)

	object.ztype = "section"
	object.space = space
	return object,text_height,space
end
Visuals.AsString.section = function(element)
	return "section"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.roadmap_section = function(self,element,width) -- not used by hand, creates container for guide type in expanded mode (back arrow, title, frame)
	local space = element.space or 10
	if self.EXTRASPACE then space = space + self.EXTRASPACE end
	width = width or element.width or self.WIDTH

	local object = CHAIN(Visuals.generic(self,element))
		:SetWidth(width)
		:SetText(SetTextColors(ZGV.IconSets.TabsIcons[element.text].label))
		:SetFont(FONTBOLD,element.fontsize or 14)
		:EnableMouse(true)
	.__END

	object.backicon = CHAIN(object:CreateTexture())
		:SetSize(12,12)
		:SetPoint("LEFT")
		:SetTexture(ZGV.ButtonSets.TitleButtons.file)
		:SetTexCoord(unpack(ZGV.ButtonSets.TitleButtons['STEP_PREV'].texcoords[1]))
	.__END
	CHAIN(object.text)
		:ClearAllPoints()
		:SetPoint("LEFT",object.backicon,"RIGHT",5,0)
		:SetFont(FONTBOLD,element.fontsize or 15)

	local text_height = object.text:GetStringHeight() + 10
	object:SetHeight(text_height)

	object.ztype = "roadmap_section"
	object.space = space
	object.storedheight = text_height
	return object, text_height, space
end
Visuals.AsString.roadmap_section = function(element)
	return "roadmap_section"..element.text..(element.guide or element.folder or element.featured or "")
end

Visuals.separator = function(self,parent,width)
	local space = 15
	if self.EXTRASPACE then space = space + self.EXTRASPACE end

	local object = CHAIN(parent:CreateTexture())
		:SetTexture(ZGV.DIR.."\\Skins\\white")
		:SetSize(width,1)
		:SetVertexColor(ZGV.F.HTMLColor("#363636ff"))
	.__END

	object.ztype = "separator"
	object.space = space
	return object,1,space
end
Visuals.AsString.separator = function(element)
	return ""
end
