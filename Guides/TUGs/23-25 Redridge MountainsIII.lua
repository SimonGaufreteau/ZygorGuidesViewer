local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\23-25 Redridge MountainsIII',
  [[
	author TUGs
	next TUGs\\25-27 Ashenvale+WetlandsI
	startlevel 23
step //1
'Fly to: Redridge Mountains
step //2
..accept Blackrock Bounty##128
step //3
..accept Howling in the Hills##126
step //4
..turnin Messenger to Westfall##144
step //5
..accept Messenger to Darkshire##145
step //6
..accept Solomon's Law##91
step //7
..accept Clyde's Special Thread##26233
step //8
..accept Murloc Poachers##150
step //9
..turnin Murloc Poachers##150
step //10
..accept Wanted: Lieutenant Fangore##180
step //11
..turnin What Comes Around...##386
step //12
..accept An Unwelcome Guest##34
step //13
.get 1 Bellygrub's Tusk|q 34/1
step //14
..turnin The Legend of Stalvan##74
step //15
..accept The Legend of Stalvan##75
step //16
Go upstairs and loot the Box
step //17
..turnin The Legend of Stalvan##75
step //18
..accept The Legend of Stalvan##78
step //19
..accept A Watchful Eye##94
step //20
..turnin A Watchful Eye##94
step //21
..accept Gnoll Patrol##26234
step //22
.kill 1 Murloc Tidecaller|q 26336/3
.kill 1 Murloc Nightcrawler|q 26336/4
step //23
.kill 7 Shadowhide Brute|q 26234/1
.kill 7 Shadowhide Warrior|q 26234/2
step //24
.get 10 Shadowhide Pendant|q 91/1
step //25
.get 1 Fangore's Paw|q 180/1
step //26
There is a Drop-Quest-Item Glowing Shadowhide Pendant. You have to turn it in in Elwynn Forest, wich I think is a waste of time for 1.400xp. I will NOT include it in this guide, do it if you want though.
step //27
..turnin Gnoll Patrol##26234
step //28
The next area is pretty dangerous even for good players. Additionally you might wanna do the escort quest that is in the cave(follow the left side). I usually dont do it,so this guide skips it.
step //29
.kill 15 Blackrock Champion|q 128/1
step //30
Yowler is pretty hard too, as he has 2-3 adds. Do it if you can, grind 200xp if you dont
step //31
.get 1 Yowler's Paw|q 126/1
step //32
..turnin Howling in the Hills##126
step //33
..turnin Wanted: Lieutenant Fangore##180
step //34
..turnin Solomon's Law##91
step //35
..turnin Clyde's Special Thread##26233
step //36
..turnin An Unwelcome Guest##34
step //37
..turnin One Of Each##26336
step //38
..turnin Blackrock Bounty##128
step //39
'Fly to: Duskwood
step //40
..turnin The Legend of Stalvan##78
step //41
..accept The Legend of Stalvan##79
step //42
..turnin Dusky Crab Cakes##93
step //43
..accept Return to Jitters##240
step //44
..accept Seasoned Wolf Kabobs##90
step //45
..turnin Seasoned Wolf Kabobs##90
step //46
ding 25
step //47
..turnin The Legend of Stalvan##79
step //48
..accept The Legend of Stalvan##80
step //49
..turnin The Legend of Stalvan##80
step //50
..accept The Legend of Stalvan##97
step //51
..turnin Crime and Punishment##377
step //52
..turnin Messenger to Darkshire##145
step //53
..turnin The Legend of Stalvan##97
step //54
'Fly to: Stranglethorn Vale, North
step //55
..turnin Sven's Revenge##95
step //56
..accept Sven's Camp##230
step //57
..turnin Eight-Legged Menaces##245
step //58
..turnin Return to Jitters##240
step //59
.kill 15 Skeletal Fiend|q 57/1
.kill 15 Skeletal Horror|q 57/2
.get 5 Fresh Bone Powder|q 26314/1
step //60
..turnin Deliver the Thread##157
step //61
..accept Zombie Juice##158
step //62
..turnin Sven's Camp##230
step //63
..accept The Shadowy Figure##262
step //64
use Hearthstone##6948
step //65
..turnin A Donation of Wool##7791
step //66
..accept A Noble Brew##335
step //67
'Fly to: Ironforge
step //68
..turnin The Powers Below##968
step //69
'Learn your spells at your trainer
step //70
'Fly to: Wetlands
step //71
'Set your Hearthstone in Wetlands
step //72
Take the boat to Auberdine.
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
