local name,ZGV = ...

-- #GLOBALS ZygorGuidesViewer

local GuideMenu = ZGV.GuideMenu

GuideMenu.Messages = {}
-- Notification messages
GuideMenu.Messages.welcome = { 
	action = function() ZGV.GuideMenu:Show("Featured") end,
	title = "Welcome to Zygor Guides",
	text = [[* See the **new WoW Classic Guides**
	]],
}

--[=[
GuideMenu.Messages.guides = { 
	action = function() ZGV.GuideMenu:Show("Featured") end,
	title = "New in this update",
	text = [[Added additional **Dragonflight Pets and Achievements** guides
	]],
}

GuideMenu.Messages.features = { 
	action = function() print("features") end,
	title = "New features have been added.",
	text = [[
	]],
}
--]=]


-- ZygorMessage widget
GuideMenu.ZygorMessage = [[
Welcome to Zygor's Classic Guides

Please contact Customer Support if you encounter any issues.
]]

GuideMenu.Bulletin={
	{"banner", image=ZGV.IMAGESDIR.."banner"},
	{"title", text=[[December 16th, 2021]]},
	{"list", text=[[Added **Feast of Winter Veil Quest**]], guide="EVENTS\\Feast of Winter Veil\\Feast of Winter Veil Quest"},
	{"title", text=[[Version 1.0.22761]]},
	{"section", text=[[LEVELING]]},
	{"item", text=[[Added |cfffe6100Scepter of the Shifting Sands|r.]], guide="LEVELING\\Scepter of the Shifting Sands"},
	{"item", text=[[Added |cfffe6100Ruins of Ahn'Qiraj Cloak Quest|r.]], guide="LEVELING\\Ruins of Ahn'Qiraj Cloak Quest"},
	{"item", text=[[Added |cfffe6100Ruins of Ahn'Qiraj Ring Quest|r.]], guide="LEVELING\\Ruins of Ahn'Qiraj Ring Quest"},
	{"item", text=[[Added |cfffe6100Ruins of Ahn'Qiraj Weapon Quest|r.]], guide="LEVELING\\Ruins of Ahn'Qiraj Weapon Quest"},
	{"item", text=[[Added |cfffe6100Temple of Ahn'Qiraj Shoulder Quest|r.]], guide="LEVELING\\Temple of Ahn'Qiraj Shoulder Quest"},
	{"item", text=[[Added |cfffe6100Temple of Ahn'Qiraj Boots Quest|r.]], guide="LEVELING\\Temple of Ahn'Qiraj Boots Quest"},
	{"item", text=[[Added |cfffe6100Temple of Ahn'Qiraj Helm Quest|r.]], guide="LEVELING\\Temple of Ahn'Qiraj Helm Quest"},
	{"item", text=[[Added |cfffe6100Temple of Ahn'Qiraj Legs Quest|r.]], guide="LEVELING\\Temple of Ahn'Qiraj Legs Quest"},
	{"item", text=[[Added |cfffe6100Temple of Ahn'Qiraj Chest Quest|r.]], guide="LEVELING\\Temple of Ahn'Qiraj Chest Quest"},
	{"item", text=[[Added |cfffe6100Signet Ring of the Bronze Dragonflight|r.]], guide="LEVELING\\Signet Ring of the Bronze Dragonflight"},
	{"item", text=[[Added |cfffe6100Cenarion Battlegear|r.]], guide="LEVELING\\Cenarion Battlegear"},
	{"item", text=[[Added |cfffe6100Cenarion Field Duty Combat Assignments|r.]], guide="LEVELING\\Cenarion Field Duty Combat Assignments"},
	{"item", text=[[Added |cfffe6100Cenarion Field Duty Tactical Assignments|r.]], guide="LEVELING\\Cenarion Field Duty Tactical Assignments"},
	{"item", text=[[Added |cfffe6100Cenarion Field Duty Logistics Assignments|r.]], guide="LEVELING\\Cenarion Field Duty Logistics Assignments"},

}

