local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\29-30 AshenvaleII',
  [[
	author TUGs
	next TUGs\\30-31 DuskwoodIII
	startlevel 29
step //1
'Set your Hearthstone in Auberdine
step //2
'Fly to: Ashenvale
step //3
goto Ashenvale,22,53
step //4
..accept The Howling Vale##1022
step //5
..accept Vile Satyr! Dryads in Danger!##1021
step //6
..accept Kayneth Stillwind##4581
step //7
..turnin Annals of Hajiri##26241
step //8
..accept Annals of Hajiri##26242
step //9
..accept Fallen Sky Lake##1035
step //10
XXXX 1
step //11
Get the wooden Staff from the Chest at: [G54,35Ashenvale]
step //12
Do: [QC1022] Go through the cave at[G53,37.58Ashenvale] and loot the tome.
step //13
..turnin Raene's Cleansing##1026
step //14
..accept Raene's Cleansing##1027
step //15
1
step //16
..turnin Vile Satyr! Dryads in Danger!##1021
step //17
..accept The Branch of Cenarius##1031
step //18
This quest can be hard for some classes, do it later if you cant handle it or just skip it alltogether
step //19

step //20
..accept Reclaiming Felfire Hill##9526
step //21
..turnin Kayneth Stillwind##4581
step //22
..accept Forsaken Diseases##1011
step //23
..accept A Shameful Waste##9517
step //24
2
step //25
2
step //26
1
step //27
XXXX 1
step //28
XXXX 1
step //29
XXXX 1
step //30
XXXX 1
step //31
..turnin Reclaiming Felfire Hill##9526
step //32
..turnin A Shameful Waste##9517
step //33
..turnin Forsaken Diseases##1011
step //34
..fpath Azshara
step //35
'Fly to: Ashenvale
step //36
..turnin The Tower of Althalaxx##1140
step //37

step //38
..turnin The Howling Vale##1022
step //39
..accept Velinde Starsong##1037
step //40
..turnin The Branch of Cenarius##1031
step //41
..turnin Annals of Hajiri##26242
step //42
..turnin Fallen Sky Lake##1035
step //43
..turnin Raene's Cleansing##1027
step //44
..accept Raene's Cleansing##1028
step //45
..turnin Raene's Cleansing##1028
step //46
use Hearthstone##6948
step //47
'Fly to: Ruth'Theran
step //48
..accept Klockmort's Essentials##2925
step //49
..turnin Velinde Starsong##1037
step //50
..accept Velinde's Effects##1038
step //51

step //52
..turnin Velinde's Effects##1038
step //53
..accept The Barrens Port##1039
step //54
'Fly to: Auberdine
step //55
Take the boat to Menethil.
step //56
'Fly to: Ironforge
step //57
..turnin Klockmort's Essentials##2925
step //58
..turnin Sully Balloo's Letter##637
step //59
..accept Sully Balloo's Letter##683
step //60
..turnin Sully Balloo's Letter##683
step //61
..accept A King's Tribute##686
step //62
..turnin A King's Tribute##686
step //63
..accept A King's Tribute##689
step //64
'Fly to: Stormwind City
step //65
'Learn your spells at your trainer
step //66
..turnin A Noble Brew##335
step //67
..accept A Noble Brew##336
step //68
..accept Tinkmaster Overspark##2923
step //69
..accept The Missing Diplomat##1274
step //70
..turnin Cleansing the Eye##293
step //71
..turnin A Noble Brew##336
step //72
..turnin The Missing Diplomat##1274
step //73
..accept The Missing Diplomat##1241
step //74
..turnin The Missing Diplomat##1241
step //75
..accept The Missing Diplomat##1242
step //76
..turnin The Missing Diplomat##1242
step //77
..accept The Missing Diplomat##1243
step //78
'Fly to: Duskwood
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
