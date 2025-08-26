local name,ZGV = ...

ZygorGuidesViewerFrame_ArrowSkin_Mixin = CreateFromMixins(ZygorGuidesViewerFrame_Arrow_Mixin)

local msin,mcos,mabs,mfloor,mround=math.sin,math.cos,math.abs,math.floor,math.round
local rad2deg = 180/math.pi

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:Setup()
	self:SetupSprites()
	self:SetupColors()

	local arrowskindir = self.skin:GetDir()

	self:Hide()
	self.title:SetFont(ZGV.Font,9)

	local getTexCoord = function(set,name)
		local c,r=unpack(set[name])
		return
			(c-1)/set.cols + (set.padding/set.cols),
			(c  )/set.cols - (set.padding/set.cols),
			(r-1)/set.rows + (set.padding/set.rows),
			(r  )/set.rows - (set.padding/set.rows)
	end

	local icons = self.icons
	for k,icon in pairs(icons) do
		if type(icon)=="table" then
			icon.texcoord={getTexCoord(icons,k)}
			icon.AssignToTexture = function(self,texture)
				texture:SetTexture(icons.file)
				texture:SetTexCoord(unpack(self.texcoord))
				if self[3] then
					texture:SetSize(self[3],self[4])
				end
			end
		end
	end
end

local precision_range = 0.02
local precision_mult = 1/precision_range

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowTraveling (elapsed,angle_rad,dist)
	self.arrow:Show() 
	self.special:Hide() 
	self.title:Show()
	self.specialmode = nil
	
	------------ color
	
	local r,g,b = self:GetArrowColors(angle_rad,dist)
	if r then self.arrow.arr:SetVertexColor(r,g,b) end

	local angle=angle_rad*rad2deg
		
	-- precision!
	local precise = self:GetPrecisionMeter(angle)
	if precise>0 then
		if not self.options.precise.smooth then precise=1 end
		local r,g,b,a = self.arrow.arr:GetVertexColor()
		--r = r + (1-r)*0.5*precise
		r = self.options.precise.r
		g = self.options.precise.g
		b = self.options.precise.b
		--b = b + (1-b)*0.5*precise
		self.arrow.arr:SetVertexColor(r,g,b,a)
		--self.arrspecular:SetAlpha(0.7 + 0.3*precise)
	else
		--self.arrspecular:SetAlpha(0.7)
	end
	
	------------ rotation

	self.arrow.arr:SetSpriteNum(mround(angle)%360)
	if self.options.texturespecular then
		self.arrow.arrspecular:SetSpriteNum(mround(angle)%360)
		self.arrow.arrspecular:SetAlpha(0.7)
	end

	--self.arrspecular:SetTexCoord(x1,x2,y1,y2)
	-- self.mask:SetTexCoord(x1,x2,y1,y2) -- WON'T WORK! Need a reverse texcoord here, oh boy, oh boy
	--self.mask:SetPoint("TOPLEFT",-self.mask:GetWidth()*x1,self.mask:GetHeight()*y1)

end

local specials={"here","waiting","upstairs","downstairs","error","instance","instancehide","ship","taxi"}
function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowSpecial(spec)
	if spec==nil or not self.special[spec] then 
		self.arrow:Hide() 
		self.special:Hide() 
		return 
	end
	self.arrow:Hide() 
	self.special:Show()
	self.specialmode = spec

	for k,v in ipairs(specials) do if v~=spec then self.special[v]:Stop() end end
	
	if self.icons[spec] then
		self.icons[spec]:AssignToTexture(self.special)
	end

	self.special[spec]:Play()
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowArrived()
	self:ShowSpecial("here")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowStairs(up)
	self:ShowSpecial(up and "upstairs" or "downstairs")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowWaiting(phase)
	--self.arrow:SetAngle(phase*6.28)
	self:ShowSpecial("waiting")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowNothing()
	self:ShowSpecial(nil)
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowError()
	self:ShowSpecial("error")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowInstance()
	self:ShowSpecial("instance")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:HideInstance()
	self:ShowSpecial("instancehide")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowShip()
	self:ShowSpecial("ship")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:ShowTaxi()
	self:ShowSpecial("taxi")
end

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:SetNotice(text)
	self.notice = text
end

-- ShowText: inherited

function ZygorGuidesViewerFrame_ArrowSkin_Mixin:SetOption(opt,val)
	if opt=="metal" then
		local skindir = self.skin:GetDir()
		self.arrow.arr:SetTexture(skindir.."arrow"..(val and "-specular" or "") ,false)
	end
end
