ZygorGuidesViewerMapIcon_Mixin = {}

local RADIUS_ADJ = -5

function ZygorGuidesViewerMapIcon_Mixin:OnUpdate(elapsed)
	if self:IsDragging() then
		local minimap = self:GetParent()
		local radius = (minimap:GetWidth() + self:GetWidth()) / 2
		local width = self:GetWidth()
		local x,y = minimap:GetCenter()
		local sc = minimap:GetEffectiveScale()
		local mx,my = GetCursorPosition() --self:GetCenter()
		mx=mx/sc  my=my/sc
		local dx,dy=mx-x,my-y
		local dist = (dx*dx+dy*dy)^0.5

		local radmin=radius + RADIUS_ADJ
		local radsnap=radius+width*0.2
		local radpull=radius+width*0.7
		local radfre=radius+width

		local radclamp
		if dist<=radsnap then self.snapped=true radclamp=radmin
		elseif dist<radpull and self.snapped then radclamp=radmin
		elseif dist<radfre and self.snapped then radclamp=radmin+(dist-radpull)/2
		else self.snapped=false -- dobby is freeee
		end

		if radclamp then
			dx=dx/(dist/radclamp)
			dy=dy/(dist/radclamp)
		end

		self:ClearAllPoints()
		self:SetPoint("CENTER",self:GetParent(),"CENTER",dx,dy)
	end
end

function ZygorGuidesViewerMapIcon_Mixin:Setup()
	ZGV.F.AssignButtonTexture(self,ZGV.SKINSDIR.."minimap-icon",1,2)
end

function ZygorGuidesViewerMapIcon_Mixin:SetLoading(enable)
	if enable then
		self.loading = true
		self.spinner:SetTexture(ZGV.SKINSDIR.."loading")
		self.spinner:Show()
		self.Loop:Play()
	else
		self.loading = false
		self.spinner:Hide()
	end
end

function ZygorGuidesViewerMapIcon_Mixin:OnClick(button)
	GameTooltip:Hide()
	if button=="LeftButton" then
		if ZGV.db.profile.nc_enable then
			if self.loading then
				ZGV.NotificationCenter.ShowOnLoad = true
			else
				ZGV.NotificationCenter:ShowAll()
			end
		else
			ZGV:ToggleFrame()
		end
	else
		ZGV:ToggleFrame()
	end
end
function ZygorGuidesViewerMapIcon_Mixin:OnDragStart()
	self:StartMoving()
end

function ZygorGuidesViewerMapIcon_Mixin:OnDragStop()
	self:StopMovingOrSizing()
	ZGV.NotificationCenter:UpdatePosition()
end

function ZygorGuidesViewerMapIcon_Mixin:OnLoad()
	self:RegisterForClicks("LeftButtonUp","RightButtonUp")
	self:RegisterForDrag("LeftButton")
end

function ZygorGuidesViewerMapIcon_Mixin:OnEnter()
	if not ZGV.db.profile.nc_enable then return end

	GameTooltip:SetOwner(self, "BOTTOMLEFT")
	GameTooltip:SetText(ZGV.L['minimap_tooltip'])
	GameTooltip:Show()
end

function ZygorGuidesViewerMapIcon_Mixin:OnLeave()
	GameTooltip:Hide()
end