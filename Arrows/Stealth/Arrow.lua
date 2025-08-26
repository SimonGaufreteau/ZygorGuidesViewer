local name,ZGV = ...

local arrowskindir,arrowskinname = "Stealth","Stealth"
local arrowSkin = ZGV.Pointer:AddArrowSkin(arrowskindir,arrowskinname)

arrowSkin.options = {
	spr_w = 102,
	spr_h = 68,
	img_w = 1024,
	img_h = 1024,
	spritecount = 150,
	mirror = false,

	precise = {
		range = 3,
		smooth = false,
		r=0.4,g=1.0,b=0.3,
	},
	
	-- colors
	ar=1.0,ag=0.0,ab=0,
	br=0.8,bg=0.7,bb=0,
	cr=0.1,cg=0.8,cb=0,

	texture = arrowSkin:GetDir().."arrow",
	texturespecular = arrowSkin:GetDir().."arrow-specular",
	
	template = "ZygorGuidesViewerFrame_ArrowSkin_Template",
}

arrowSkin.icons = {
	-- name = {col,row,width,height}
	here =		{ 1,1, 40,40},
	upstairs =	{ 2,1, 60,60},
	error =		{ 3,1, 40,40},
	instance =	{ 4,1, 40,40},
	taxi =		{ 5,1, 40,40},
	ship =		{ 6,1, 40,40},
	waiting =	{ 1,2, 40,40},
	downstairs =	{ 2,2, 60,60},
	instancehide =	{ 4,2, 40,40},

	file = arrowSkin:GetDir().."specials",
	cols = 8,
	rows = 2,
	width = 1024,
	height = 256,
	padding = 0,
	default = "wait"
}