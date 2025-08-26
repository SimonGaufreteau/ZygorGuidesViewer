local ZGV=ZygorGuidesViewer
if not ZGV then return end

local PointerMap = {}
ZGV.PointerMap = PointerMap

local CHAIN=ZGV.ChainCall
local ui = ZGV.UI
local SkinData = ui.SkinData

local PREVIEW_ALPHA = 0.5
local PREVIEW_SCALE = 0.5

PointerMap.Instances = {
	[48]	= {name="Blackfathom Deeps", 
		{file="blackfathomdeeps"},
	},
	[230]	= {name="Blackrock Depths",
		{file="blackrockdepths-db", name="Detention Block"},
		{file="blackrockdepths-sf",both=true, name="Shadowforge City"},
		points = {
			{ "1 43.37,54.29 -x- 2 29.90,94.37" },
			{ "1 67.71,19.75 -x- 2 47.58,58.03" },
		}
	},
	[229]	= {name="Blackrock Spire",
		{file="lbrs-1", name="Lower Spire - part 1"},
		{file="lbrs-2",both=true, name="Lower Spire - part 2"},
		{file="lbrs-3", name="Lower Spire - part 3"},
		{file="lbrs-4", name="Lower Spire - part 4"},
		{file="ubrs", name="Upper Spire"},
		points = {
			{ "1 63.97,53.99 -x- 2 66.43,24.49" },
			{ "2 70.41,56.10 -x- 3 70.52,60.66" },
			{ "3 31.07,89.81 -x- 4 40.21,60.84" },
		}
	},
	[36]	= {name="The Deadmines",
		{file="deadmines",both=true},
	},
	[429]	= {name="Dire Maul",
		{file="diremaul-east-up",both=true, name="Dire Maul East - Upstairs"},
		{file="diremaul-east-down",both=true, name="Dire Maul East - Downstairs"},
		{file="diremaul-west",both=true, name="Dire Maul West"},
		{file="diremaul-north",both=true, name="Dire Maul North"},
		points = {
			{ "1 54.84,66.58 -x- 2 64.55,89.76" },
			{ "3 53.78,25.49 -x- 4 64.08,82.38" },
		}
	},
	[90]	= {name="Gnomeregan",
		{file="gnomeregan"},	
	},
	[349]	= {name="Maraudon", 
		{file="maraudon",both=true},
	},
	[389]	= {name="Ragefire Chasm",
		{file="ragefirechasm",both=true},
	},
	[129]	= {name="Razorfen Downs",
		{file="razorfendowns",both=true},	
	},
	[47]	= {name="Razorfen Kraul",
		{file="razorfenkraul"},	
	},
	[1001]	= {name="Scarlet Halls",
		{file=""},
	},
	[189]	= {name="Scarlet Monastery",
		{file="sm-armory",both=true, name="The Armory"},
		{file="sm-library", name="The Library"},
		{file="sm-cathedral",both=true, name="The Cathedral"},
		{file="sm-cemetery", name="The Cemetery"},
	},
	[289]	= {name="Scholomance",
		{file="scholo-up",both=true,name="Main Floor"},
		{file="scholo-down",both=true,name="Downstairs"},
		points = {
			{ "1 31.07,40.12 -x- 2 09.89,38.89", tooltip="To Jandice Barov",tooltip2="Back upstairs" },
			{ "1 32.36,82.61 -x- 2 24.64,64.00", tooltip="To Rattlegore",tooltip2="Back upstairs"  },
			{ "1 43.01,83.49 -x- 2 40.21,64.17", tooltip="To the Laboratory",tooltip2="Back upstairs"  },
			{ "1 60.34,64.35 -x- 2 59.52,24.67", tooltip="To Headmaster's Study",tooltip2="Back upstairs" },
		}
	},
	[33]	= {name="Shadowfang Keep",
		{file="shadowfangkeep"},
	},
	[34]	= {name="The Stockade",
		{file="stockade",both=true},
	},
	[329]	= {name="Stratholme",
		{file="stratholme-living",both=true, name="Living Side"},
		{file="stratholme-undead",both=true, name="Undead Side"},
		points = {
			{ "1 96.98,32.04 -x- 2 47.58,84.89" },
		}
	},
	[109]	= {name="The Temple of Atal'Hakkar",
		{file="sunkentemple",both=true},
	},
	[70]	= {name="Uldaman",
		{file="uldaman"},
	},
	[43]	= {name="Wailing Caverns",
		{file="wailingcaverns"},
	},
	[209]	= {name="Zul'Farrak",
		{file="zulfarrak"},
	},

	--[[
	[469]	= {name="Blackwing Lair",
		{file=""},	
	},
	[409]	= {name="Molten Core",
		{file=""},	
	},
	[509]	= {name="Ruins of Ahn'Qiraj",
		{file=""},	
	},
	[531]	= {name="Temple of Ahn'Qiraj",
		{file=""},	
	}, 
	[533]	= {name="Naxxramas", -- verify instanceID
		{file=""},	
	}, 
	[249]	= {name="Onyxia", -- verify instanceID
		{file=""},	
	}, 
	[309]	= {name="Zul'Gurub", -- verify instanceID
		{file=""},	
	}, 
	--]]
}

--[[
points={
	{"1 10.00,10.00 -x- 2 10.00,90.00", mode="stairsdown", tooltip="To floor 2", tooltip2="To floor 1"}, 
	{"1 30.00,30.00 -x- 2 30.00,30.00", mode="stairs"},  -- tooltip automated 
	{"1 90.00,90.00 -to- 2 90.00,10.00", mode="stairs"}, -- tooltip automated 
	{"3 50.00,50.00", mode="boss", tooltip="Big bad", click=function() print("clicked") end}, 
},
--]]



local icons = {
	default = {ZGV.DIR.."\\Skins\\Default\\Stealth\\stepicons",1,32},
	stairsup = {ZGV.DIR.."\\Skins\\Default\\Stealth\\stepicons",2,32,"stairsdown"},
	stairsdown = {ZGV.DIR.."\\Skins\\Default\\Stealth\\stepicons",3,32,"stairsup"},
	stairs = {ZGV.DIR.."\\Skins\\Default\\Stealth\\stepicons",5,32},
	boss = {ZGV.DIR.."\\Skins\\Default\\Stealth\\stepicons",6,32},
}


function PointerMap:ParsePoints()
	for map,data in pairs(PointerMap.Instances) do
		if data.points then
			for pointnum=1,#data.points do
				local point = data.points[pointnum]

				local mxy1,dir,mxy2 = point[1]:match("^(.-)%s+%-([xto]+)%-%s+(.-)$")
				local f1,x1,y1, f2,x2,y2
				if not mxy1 then mxy1 = point[1] end -- single node, not a connection
				
				if mxy1 then 
					f1,x1,y1 = mxy1:match("^(.-)[%s,]+(%-?[0-9%.]+),(%-?[0-9%.]+)$") 
					f1,x1,y1 = tonumber(f1),tonumber(x1),tonumber(y1)
				end
				if mxy2 then 
					f2,x2,y2 = mxy2:match("^(.-)[%s,]+(%-?[0-9%.]+),(%-?[0-9%.]+)$") 
					f2,x2,y2 = tonumber(f2),tonumber(x2),tonumber(y2)
				end

				point.id=("%d_%d_%d"):format(map,pointnum,1)
				point.f=f1
				point.x=x1/100
				point.y=y1/100
				point.floor = f2

				if not point.tooltip and f2 then
					point.tooltip = "To "..(data[f2].name or "?")
				end

				if mxy2 then
					local point2 = {
						f=f2, 
						x=x2/100, 
						y=y2/100, 
						mode=point.mode, 
						id=("%d_%d_%d"):format(map,pointnum,2)
					}

					if icons[point.mode] and icons[point.mode][4] then point2.mode=icons[point.mode][4] end

					if dir=="x" then 
						point2.links=point.id 
						point2.floor=f1 
					end
					point.links=point2.id
					
					if point.tooltip2 then 
						point2.tooltip = point.tooltip2
						point.tooltip2 = nil
					else
						if dir=="x" then
							point2.tooltip = "To "..(data[f1].name or "?")
						else
							point2.tooltip = "From "..(data[f1].name or "?")
						end
					end
					table.insert(data.points,point2)
				end
			end
		end
	end
end

PointerMap.IconPool = {}
local function PointerMapIconOnEnter(self)
	if self.point and self.point.tooltip~="" then
		GameTooltip:SetOwner(self,"ANCHOR_RIGHT") 
		GameTooltip:SetText(self.point.tooltip) 
		GameTooltip:Show()
	end
end

local function PointerMapIconOnLeave(self)
	GameTooltip:Hide()
end

local function PointerMapIconOnClick(self)
	if IsShiftKeyDown() then return end
	if self.point.floor then
		local point=self.point
		PointerMap:ShowPreview(PointerMap.CurrentMap,point.floor,point.links)
		local pt
		for i,v in ipairs(PointerMap.Instances[PointerMap.CurrentMap].points) do if v.id==point.links then pt=v end end
		if pt then PointerMap:ShowLine(point.x,point.y,pt.x,pt.y) end
	elseif self.point.click then
		self.point.click()
	end
end

-- timings
local BLINK_PAUSE=4.0
local BLINK_PING=1.0
local BLINK_GLOW1,BLINK_GLOW2=0.3,0.7
local BLINK_LINESPEED=0.15

function PointerMap:GetIconFromPool()
	for _,icon in ipairs(PointerMap.IconPool) do
		if icon.unused then return icon end
	end
	local icon = CHAIN(CreateFrame("Button",nil,PointerMap.Frame))
		:SetSize(17,17)
		:SetScript("OnEnter",PointerMapIconOnEnter)
		:SetScript("OnLeave",PointerMapIconOnLeave)
		:SetScript("OnClick",PointerMapIconOnClick)
		:SetFrameLevel(3)
		:Show()
	.__END
	icon.tex = CHAIN(icon:CreateTexture())
		:SetAllPoints()
	.__END
	icon.tex.anim = CHAIN(icon.tex:CreateAnimationGroup()) 
		:SetLooping("REPEAT") 
	.__END
	CHAIN(icon.tex.anim:CreateAnimation("SCALE")) 
		:SetScale(2,2) 
		:SetDuration(0.5) 
		:SetSmoothing("OUT")
	CHAIN(icon.tex.anim:CreateAnimation("SCALE")) 
		:SetScale(0.5,0.5) 
		:SetDuration(0.5) 
		:SetSmoothing("IN")

	icon.ping = CHAIN(icon:CreateTexture())
		:SetAllPoints()
		:SetScale(1.3)
		:SetTexture(ZGV.DIR .. "\\Skins\\door-highlight-neg")
		:SetBlendMode("ADD")
		:SetVertexColor(0.4,0.6,1.0)
		:SetTexelSnappingBias(0)
		:SetSnapToPixelGrid(false)
		:Hide()
	.__END

		icon.ping.anim = CHAIN(icon.ping:CreateAnimationGroup()) 
				:SetLooping("NONE") 
				:SetToFinalAlpha(true)
				:SetScript("OnPlay",function() icon.ping:Show() end)
				:SetScript("OnStop",function() icon.ping:Hide() end)
				:SetScript("OnFinished",function() icon.ping:Hide() icon.glow.anim:Play() end)
			.__END

			-- ping animation
				CHAIN(icon.ping.anim:CreateAnimation("ALPHA"))
					:SetFromAlpha(0)
					:SetToAlpha(0)
					:SetDuration(BLINK_LINESPEED)
					:SetOrder(1)
				CHAIN(icon.ping.anim:CreateAnimation("SCALE"))
					--:SetFromScale(1,1)
					--:SetToScale(3,3)
					:SetScale(1,3)
					:SetDuration(BLINK_PING)
					:SetSmoothing("OUT")
					:SetOrder(2)
				CHAIN(icon.ping.anim:CreateAnimation("ALPHA"))
					:SetFromAlpha(1.0)
					:SetToAlpha(0)
					:SetSmoothing("OUT")
					:SetDuration(BLINK_PING)
					:SetEndDelay(BLINK_PAUSE)
					:SetOrder(2)
			--
		------------------

	icon.glow = CHAIN(icon:CreateTexture())
		:SetPoint("CENTER")
		:SetSize(25,25)
		:SetTexture(ZGV.DIR .. "\\Skins\\door-highlight")
		:SetBlendMode("ADD")
		:SetVertexColor(0.4,0.6,1.0)
		:SetTexelSnappingBias(0)
		:SetSnapToPixelGrid(false)
		:SetAlpha(0.5)
		:Hide()
	.__END

		------------------
			icon.glow.anim = CHAIN(icon.glow:CreateAnimationGroup()) 
				:SetLooping("REPEAT") 
				:SetToFinalAlpha(true)
				:SetScript("OnPlay",function() icon.glow:Show() end)
				:SetScript("OnStop",function() icon.glow:Hide() end)
				:SetScript("OnFinished",function(self) icon.glow:Hide() end)
			.__END
			-- idle animation
				local scale=1.3
				CHAIN(icon.glow.anim:CreateAnimation("SCALE"))
					:SetStartDelay(BLINK_LINESPEED)
					:SetScale(scale,scale)
					--:SetFromScale(2.0,2.0)
					--:SetToScale(2.0*scale,2.0*scale)
					:SetSmoothing("OUT")
					:SetDuration(BLINK_GLOW1)
					:SetOrder(1)
				CHAIN(icon.glow.anim:CreateAnimation("ALPHA"))
					:SetFromAlpha(0.2)
					:SetToAlpha(0.7)
					--:SetFromScale(2.0,2.0)
					--:SetToScale(2.0*scale,2.0*scale)
					:SetSmoothing("OUT")
					:SetDuration(BLINK_GLOW1)
					:SetOrder(1)
				CHAIN(icon.glow.anim:CreateAnimation("SCALE"))
					--:SetFromScale(1,1)
					--:SetToScale(1/scale,1/scale)
					:SetScale(1/scale,1/scale)
					:SetSmoothing("IN")
					:SetDuration(BLINK_GLOW2)
					:SetOrder(2)
				CHAIN(icon.glow.anim:CreateAnimation("ALPHA"))
					:SetFromAlpha(0.7)
					:SetToAlpha(0.2)
					--:SetFromScale(2.0,2.0)
					--:SetToScale(2.0*scale,2.0*scale)
					:SetSmoothing("IN")
					:SetDuration(BLINK_GLOW2)
					:SetOrder(2)

					:SetEndDelay(BLINK_PAUSE)
			--
		------------------
	
	table.insert(PointerMap.IconPool,icon)
	return icon
end

function PointerMap:RemoveAllIcons()
	for _,icon in ipairs(PointerMap.IconPool) do
		icon.unused = true
		icon.tex.anim:Stop()
		icon.ping.anim:Stop()
		icon.glow.anim:Stop()
		icon:Hide()
	end
end


function PointerMap:CreateFrame()
	PointerMap.Frame = CHAIN(ui:Create("Frame",UIParent,"ZGV_PointerMapFrame"))
		:SetFrameStrata("HIGH")
		:SetToplevel(true)
		:SetBackdropColor(0,0,0,0.6)
		:SetPoint("TOPLEFT",UIParent,0,-100)
		:CanDrag(true)
		:Hide()
		:SetScript("OnEvent",PointerMap.EventHandler)
		:RegisterEvent("PLAYER_STARTED_MOVING")
		:RegisterEvent("PLAYER_STOPPED_MOVING")
		:SetSize(772,539)
	.__END
	PointerMap:UpdateSettings()
	local MF=PointerMap.Frame
	MF:SetScript("OnDragStop",function() 
		MF:StopMovingOrSizing()
		ZGV.F.SaveFrameAnchor(MF,"mappreview_anchor")
	end)

	if ZGV.db.profile.mappreview_anchor then
		ZGV.F.SetFrameAnchor(MF,ZGV.db.profile.mappreview_anchor)
	end

	
	--tinsert(UISpecialFrames, "ZGV_PointerMapFrame") -- allows the frame to be closable with ESC keypress - don't it breaks auto reshow after zoning

	MF.HeaderFrame = CHAIN(ui:Create("Frame",MF,nil))
		:SetPoint("TOPLEFT",1,-1)
		:SetPoint("TOPRIGHT",-1,-1)
		:SetHeight(27)
		:SetFrameStrata("HIGH")
		:SetFrameLevel(MF:GetFrameLevel()+2)
		:SetBackdropColor(0,0,0,0)
		:SetBackdropBorderColor(0,0,0,0)
		:SetToplevel(true)
		.__END

		MF.HeaderFrame.Logo = CHAIN(MF.HeaderFrame:CreateTexture())
			:SetPoint("TOP",MF.HeaderFrame,"TOP",0,-3) 
			:SetSize(100,25)
			:SetTexture(SkinData("TitleLogo"))
		.__END

		MF.HeaderFrame.close = CHAIN(CreateFrame("Button",nil,MF.HeaderFrame))
			:SetPoint("TOPRIGHT",-5,-5)
			:SetSize(17,17)
			:SetScript("OnClick", function() PointerMap:HidePreview() end)
			.__END
		ZGV.ButtonSets.TitleButtons["CLOSE"]:AssignToButton(MF.HeaderFrame.close)

		MF.FloorDropdown = CHAIN(ui:Create("DropDown",MF,2,MF.HeaderFrame:GetFrameLevel()+2))
			:SetPoint("LEFT",MF.HeaderFrame,"LEFT",10,0)
			:SetSize(200,18)
			:AddTooltip("ANCHOR_TOPLEFT","")
		.__END	
		--MF.FloorDropdown.frame:SetAlpha(ZGV.db.profile.preview_alpha) 
	
	MF.BackTexture = CHAIN(MF:CreateTexture())
		:SetPoint("TOPLEFT",MF.HeaderFrame,"BOTTOMLEFT",10,0) 
		:SetColorTexture(0,0,0,1)
		:SetDrawLayer("BACKGROUND")
		:SetSize(750,500)
	.__END

	MF.ImageTexture = CHAIN(MF:CreateTexture())
		:SetPoint("TOPLEFT",MF.HeaderFrame,"BOTTOMLEFT",10,0) 
		:SetTexCoord(0,1,0,683/1024)
		:SetSize(750,500)
		--:SetNonBlocking(false)
	.__END

	MF.TextureCache = {}

	MF.FooterSettingsButton = CHAIN(CreateFrame("Button",nil,MF))
		:SetSize(15,15)
		:SetPoint("BOTTOMRIGHT",-3,3)
		:SetScript("OnClick",function() ZGV:OpenOptions("maps") end)
	.__END
	ZGV.ButtonSets.TitleButtons["SETTINGS"]:AssignToButton(MF.FooterSettingsButton)

	MF.Line = CreateFrame("FRAME", "ZygorGuidesViewer_MapPreview_MapLine", MF, "ZygorGuidesViewer_MapLineTemplate")

	PointerMap:UpdateDevSettings()
end

function PointerMap:CacheTexture(i,tex)
	if not self.Frame.TextureCache[i] then self.Frame.TextureCache[i] = CHAIN(self.Frame:CreateTexture()):Hide().__END end
	CHAIN(self.Frame.TextureCache[i]):SetTexture(ZGV.IMAGESDIR.."Dungeons\\"..tex):SetAlpha(0):Show()
end

local function exportpoint()
	if not IsShiftKeyDown() or not ZGV.db.profile.debug_display then return end
	local MF=PointerMap.Frame

	local frame = MF.ImageTexture
	local x,y=GetCursorPosition()

	local cx,cy
	
	cx=(x-(frame:GetLeft()*frame:GetEffectiveScale()))/(frame:GetWidth()*frame:GetEffectiveScale())
	cy=(y-(frame:GetBottom()*frame:GetEffectiveScale()))/(frame:GetHeight()*frame:GetEffectiveScale())
	cy=1-cy

	local out = ("%d %.2f,%.2f"):format(PointerMap.CurrentLevel,cx*100,cy*100)

	if IsControlKeyDown() and PointerMap.lastpoint then  PointerMap.lastpoint.x=cx  PointerMap.lastpoint.y=cy  PointerMap:ShowPreview(PointerMap.CurrentMap,PointerMap.CurrentLevel)  end

	MF.Output:SetText(out)
	MF.Output:HighlightText(0,0)
end

function PointerMap:UpdateDevSettings()
	local MF = ZGV.PointerMap.Frame

	if ZGV.db.profile.debug_display then
		MF:SetScript("OnMouseUp",exportpoint)

		if not self.exporttimer then self.exporttimer = ZGV:ScheduleRepeatingTimer(exportpoint,0.2) end

		if not MF.Output then
			MF.Output = CHAIN(ui:Create("EditBox",MF))
				:SetPoint("RIGHT",MF.HeaderFrame.close,"LEFT",-10,0)
				:SetWidth(200)
				:SetText("Point dumper running")
				:SetScript("OnEditFocusLost",function(self)
					self:HighlightText(0,0)
				end)
				:SetScript("OnEditFocusGained",function(self)
					self:HighlightText()
				end)
			.__END
		end
		MF.Output:Show()
	else
		if MF.Output then MF.Output:Hide() end
		MF:SetScript("OnMouseUp",nil)
		if self.exporttimer then ZGV:CancelTimer(self.exporttimer)  self.exporttimer=nil end
	end
end


-- switch world map into zygor preview mode
function PointerMap:ShowPreview(instance,level,link)
	if not ZGV.CurrentStep or not ZGV.CurrentStep.map then return end

	instance = ZGV.db.char.fakeinstance or instance or select(8,GetInstanceInfo())
	-- if we are showing different instance than the last time, do not show previous floor
	if PointerMap.CurrentMap ~= instance then PointerMap.CurrentLevel = nil end
	level = level or PointerMap.CurrentLevel or 1

	if not (PointerMap.Instances[instance] and PointerMap.Instances[instance][level]) then 
		return
	end

	PointerMap:RemoveAllIcons()

	local dropdown = PointerMap.Frame.FloorDropdown

	local instance_data = PointerMap.Instances[instance]
	local fdata = instance_data[level]
	local faction_suffix = "-"..(fdata.both and "both" or UnitFactionGroup("player"))

	if #instance_data<2 then
		dropdown:Hide()
	else
		dropdown.pullout:Clear()
		for i,v in ipairs(instance_data) do
			local item = dropdown:AddItem(v.name,v.name,function(item)
				PointerMap:ShowPreview(instance,i)
			end)
			self:CacheTexture(i,v.file..faction_suffix)
		end
		PointerMap.Frame.FloorDropdown:Show()
		PointerMap.Frame.FloorDropdown:SetCurrentSelectedByValue(instance_data[level].name)
	end

	PointerMap.CurrentMap = instance
	PointerMap.CurrentLevel = level
	
	local filename = fdata.file..faction_suffix
	ZGV:Debug("Showing dungeon map %s",filename)
	PointerMap.Frame.ImageTexture:SetTexture(ZGV.IMAGESDIR.."Dungeons\\"..filename)
	PointerMap.Frame:Show()
	PointerMap.Frame:SetAlpha(ZGV.db.profile.preview_alpha)

	if PointerMap.Instances[instance].points then
		local fw,fh = PointerMap.Frame.ImageTexture:GetWidth(),PointerMap.Frame.ImageTexture:GetHeight()

		for i,point in ipairs(PointerMap.Instances[instance].points) do
			if point.f==level then
				local px = point.x*fw
				local py = point.y*fh
				local icon = PointerMap:GetIconFromPool()
				icon:SetPoint("CENTER",PointerMap.Frame.ImageTexture,"TOPLEFT",px,-py)
				if point.mode then
					local mode = icons[point.mode]

					icon.tex:SetTexture(mode[1])
					icon.tex:SetTexCoord((mode[2]-1)/mode[3],mode[2]/mode[3],0,1)
				else
					-- transparent point
					icon.tex:SetColorTexture(0,0,0,0)
				end
				icon.unused = false
				icon.point = point
				icon:Show()

				if point.id==link then
					--icon.tex.anim:Play()
					--ZGV:ScheduleTimer(function() icon.tex.anim:Stop() end,3)
					icon.glow.anim:Stop()
					icon.ping.anim:Play()

					PointerMap.lastpoint = point
				else
					icon.glow.anim:Play()
				end
			end
		end
	end
end

function PointerMap:ShowLine(x1,y1,x2,y2)
	self.Frame.Line:SetAllPoints(self.Frame.ImageTexture) -- needed for :SetStartPoint to accept simple coords
	CHAIN(self.Frame.Line.Fill)
		:SetTexture(ZGV.DIR .. "\\Skins\\pingline")
		:SetVertexColor(0.6,0.8,1.0,0.8)
		:SetBlendMode("ADD")
		:SetStartPoint("TOPLEFT",x1*self.Frame.ImageTexture:GetWidth(),-y1*self.Frame.ImageTexture:GetHeight())
		:SetEndPoint("TOPLEFT",x2*self.Frame.ImageTexture:GetWidth(),-y2*self.Frame.ImageTexture:GetHeight())
		:SetThickness(5)
	self.Frame.Line.RevealAnim:Play()
end

function PointerMap:HidePreview(manual)
	PointerMap.Frame:Hide()
	ZGV.db.char.previewhidden = true
end

function PointerMap:UpdateSettings()
	PointerMap.Frame:SetAlpha(ZGV.db.profile.preview_alpha)
	PointerMap.Frame:SetScale(ZGV.db.profile.preview_scale)
end

function PointerMap:FadeOut() 
	if not PointerMap.Frame:IsVisible() then return end
	PointerMap.Frame:SetAlpha(ZGV.db.profile.preview_alpha/2) 
end

function PointerMap:FadeIn() 
	if not PointerMap.Frame:IsVisible() then return end
	PointerMap.Frame:SetAlpha(ZGV.db.profile.preview_alpha) 
end

function PointerMap:ShouldShowPreview() 
	if not ZGV.db.profile.preview then return false,"disabled" end
	if not ZGV.PointerMap.Frame then return false,"not loaded yet" end
	if not ZGV.db.profile.arrowshow then return false,"arrow disabled" end
	if not ZGV.CurrentGuide then return false,"no guide" end
	if not ZGV.Frame:IsVisible() then return false,"viewer hidden" end

	local name, instanceType, difficultyID, difficultyName, maxPlayers, dynamicDifficulty, isDynamic, instanceID, instanceGroupSize, LfgDungeonID = GetInstanceInfo()
	if ZGV.db.char.fakeinstance then 
		instanceID=ZGV.db.char.fakeinstance 
		instanceType="dungeon"
	end

	if not instanceType or instanceType=="none" then return false,"not instance" end
	if not PointerMap.Instances[instanceID] then return false,"no map" end

	return true
end

function PointerMap:IsPreviewShown() 
	return ZGV.PointerMap.Frame:IsVisible() 
end

function PointerMap.EventHandler(self,event)
	if event=="PLAYER_STARTED_MOVING" then
		PointerMap:FadeOut()
	elseif event=="PLAYER_STOPPED_MOVING" then
		PointerMap:FadeIn()
	end
end

tinsert(ZGV.startups,{"Map preview",function(self)
	PointerMap:CreateFrame()
	PointerMap:ParsePoints()
end})

-- testing:  /run pmi=next(ZGV.PointerMap.Instances,pmi) ZGV.PointerMap:ShowPreview(pmi,1)
