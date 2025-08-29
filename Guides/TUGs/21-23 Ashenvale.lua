local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\21-23 Ashenvale',
  [[
	author TUGs
	next TUGs\\23-24 Stockades
	startlevel 21
step //1
Take the boat to Darkshore.
step //2
..turnin The Corruption Abroad##3765
step //3
..turnin Mathystra Relics##951
step //4
ESCORT QUEST INCOMING,make sure all group members are on the same questprogress.
step //5
..turnin A Lost Master##993
step //6
..accept Escape Through Force##994
step //7
.goal Help Volcor to the road|q 994/1
step //8
..turnin One Shot. One Kill.##5713
step //9
..turnin The Tower of Althalaxx##967
step //10
..accept The Tower of Althalaxx##970
step //11
..accept Bathran's Hair##1010
step //12
.get Glowing Soul Gem|q 970/1
step //13
.get 5 Bathran's Hair|q 1010/1
step //14
..turnin Bathran's Hair##1010
step //15
..accept Orendil's Cure##1020
step //16
..turnin The Tower of Althalaxx##970
step //17
..accept The Tower of Althalaxx##973
step //18
..turnin Therylune's Escape##945
step //19
ding 21
step //20
..fpath Ashenvale
step //21
..accept The Zoram Strand##1008
step //22
..accept On Guard in Stonetalon##1070
step //23
..accept Journey to Stonetalon Peak##1056
step //24
..accept Raene's Cleansing##991
step //25
..accept Culling the Threat##1054
step //26
..turnin Orendil's Cure##1020
step //27
..accept Elune's Tear##1033
step //28
..turnin Raene's Cleansing##991
step //29
..accept Raene's Cleansing##1023
step //30
.get Glowing Gem|q 1023/1
step //31
..accept The Ancient Statuette##1007
step //32
.get Ancient Statuette|q 1007/1
step //33
..turnin The Ancient Statuette##1007
step //34
..accept Ruuzel##1009
step //35
As a Group do Ruuzel, if youre solo skip it. (Some classes can do it solo too, Mage,Warlock,Hunter especially).
step //36
.get Ring of Zoram|q 1009/1
step //37
.get 20 Wrathtail Head|q 1008/1
step //38
..turnin Ruuzel##1009
step //39
.get Dal Bloodclaw's Skull|q 1054/1
step //40
'Grind the furbolgs till level 22.
step //41
..turnin The Zoram Strand##1008
step //42
..accept Pridewings of Stonetalon##1134
step //43
..turnin Raene's Cleansing##1023
step //44
..turnin Culling the Threat##1054
]]
)
ZygorGuidesViewer:RegisterGuide(
  'TUGs\\Darkshore 11-15',
  [[

]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
