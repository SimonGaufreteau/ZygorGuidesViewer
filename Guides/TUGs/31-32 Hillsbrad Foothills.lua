local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\31-32 Hillsbrad Foothills',
  [[
	author TUGs
	next TUGs\\33 Gnomeregan
	startlevel 31
step //1
..turnin The Missing Diplomat##1245
step //2
..accept The Missing Diplomat##1246
step //3
..turnin The Missing Diplomat##1246
step //4
..accept The Missing Diplomat##1447
step //5
XXXX 1
step //6
..turnin The Missing Diplomat##1447
step //7
..accept The Missing Diplomat##1247
step //8
..turnin The Missing Diplomat##1247
step //9
..accept The Missing Diplomat##1248
step //10
..turnin Seeking Wisdom##269
step //11
..accept The Doomed Fleet##270
step //12
use Hearthstone##6948
step //13
..turnin The Missing Diplomat##1248
step //14
..accept The Missing Diplomat##1249
step //15
XXXX 1
step //16
..turnin The Doomed Fleet##270
step //17
..accept Lightforge Iron##321
step //18
..turnin The Missing Diplomat##1249
step //19
..accept The Missing Diplomat##1250
step //20
..turnin The Missing Diplomat##1250
step //21
..accept The Missing Diplomat##1264
step //22
..turnin Lightforge Iron##321
step //23
..accept The Lost Ingots##324
step //24
XXXX 1
step //25
..turnin The Lost Ingots##324
step //26
..accept Blessed Arm##322
step //27
goto Wetlands,13,54
step //28
Take the boat to Hillsbrad.
step //29
..accept Hints of a New Plague?##659
step //30
..accept Down the Coast##536
step //31
XXXX 1
step //32
..turnin Down the Coast##536
step //33
..accept Farren's Proof##559
step //34
XXXX 1
step //35
..turnin Farren's Proof##559
step //36
..accept Farren's Proof##560
step //37
..turnin Farren's Proof##560
step //38
..accept Farren's Proof##561
step //39
..accept Syndicate Assassins##505
step //40
..turnin Farren's Proof##561
step //41
..accept Stormwind Ho!##562
step //42
XXXX 1
step //43
..turnin Stormwind Ho!##562
step //44
..accept Reassignment##563
step //45
..accept Costly Menace##564
step //46
..fpath Hillsbrad Foothills
step //47
XXXX 1
step //48
XXXX 1
step //49
XXXX 1
step //50
..accept Foreboding Plans##510
step //51
..accept Encrypted Letter##511
step //52
'TODO: Add quest: Syndicate Plans
step //53
..turnin Costly Menace##564
step //54
..turnin Encrypted Letter##511
step //55
..accept Letter to Stormpike##514
step //56
..turnin Foreboding Plans##510
step //57
..turnin Syndicate Assassins##505
step //58
use Hearthstone##6948
step //59
'Fly to: Ironforge
step //60
..accept Reclaimers' Business in Desolace##1453
step //61
..turnin Letter to Stormpike##514
step //62
..accept Further Mysteries##525
step //63
..accept The Brassbolts Brothers##1179
step //64
..turnin A King's Tribute##689
step //65
..accept A King's Tribute##700
step //66
..turnin A King's Tribute##700
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
