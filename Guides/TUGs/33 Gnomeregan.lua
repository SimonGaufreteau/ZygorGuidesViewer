local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\33 Gnomeregan',
  [[
	author TUGs
	next TUGs\\33-34 Stranglethorn Valley
	startlevel 33
step //1
Next part is optional,as its Gnomeregan, continue with Accept The Brassbolt Brother
step //2
..accept Essential Artificials##2924
step //3
..accept Data Rescue##2930
step //4
..turnin Tinkmaster Overspark##2923
step //5
..accept Save Techbot's Brain!##2922
step //6
..accept The Grand Betrayal##2929
step //7
..accept The Day After##2927
step //8
..turnin The Day After##2927
step //9
..accept Gnogaine##2926
step //10
'Set your Hearthstone in Dun Morogh
step //11
..turnin Gnogaine##2926
step //12
..turnin Essential Artificials##2924
step //13
..turnin Data Rescue##2930
step //14
..turnin Save Techbot's Brain!##2922
step //15
..turnin The Grand Betrayal##2929
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
