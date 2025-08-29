local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\23-24 Stockades',
  [[
	author TUGs
	next TUGs\\23-25 Redridge MountainsIII
	startlevel 23
step //1
..accept Quell The Uprising##387
step //2
..accept The Stockade Riots##391
step //3
..accept The Color of Blood##388
step //4
'Fly to: Duskwood
step //5
..accept Crime and Punishment##377
step //6
'Fly to: Redridge Mountains
step //7
..accept What Comes Around...##386
step //8
Do the dungeon
step //9
.kill 10 Defias Prisoner|q 387/1
.kill 8 Defias Convict|q 387/2
.kill 8 Defias Insurgent|q 387/3
step //10
.get Head of Bazil Thredd|q 391/1
step //11
.get 10 Red Wool Bandana|q 388/1
step //12
get 1 Hand of Dextren Ward|q 377/1
step //13
get 1 Head of Targorr|q 386/1
step //14
..turnin Quell The Uprising##387
step //15
..turnin The Stockade Riots##391
step //16
..accept The Curious Visitor##392
step //17
..turnin The Curious Visitor##392
step //18
..accept Shadow of the Past##393
step //19
..turnin The Color of Blood##388
step //20
..turnin Shadow of the Past##393
step //21
..accept Look to an Old Friend##350
step //22
..turnin Look to an Old Friend##350
step //23
..accept Infiltrating the Castle##2745
step //24
..turnin Infiltrating the Castle##2745
step //25
..accept Items of Some Consequence##2746
step //26
We will turn in the other 2 dungeons quests in the next guide.
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
