local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\25-27 Ashenvale+WetlandsI',
  [[
	author TUGs
	next TUGs\\27-29 DuskwoodII+WetlandsII
	startlevel 25
step //1
..turnin Escape Through Force##994
step //2
'Fly to: Ashenvale
step //3
..accept Attack on the Foulweald##26362
step //4
..accept Raene's Cleansing##1024
step //5
..accept An Aggressive Defense##1025
step //6
.get 1 Elune's Tear|q 1033/1
step //7
..turnin Raene's Cleansing##1024
step //8
..accept Raene's Cleansing##1026
step //9
..turnin Elune's Tear##1033
step //10
..accept The Ruins of Stardust##1034
step //11
.get 1 Ilkrud Magthrull's Tome|q 973/1
step //12
.get 5 Handful of Stardust|q 1034/1
'Use your Glass Phial for Annals of Hajiri
step //13
..accept Elemental Bracers##1016
step //14

step //15
..turnin Elemental Bracers##1016
step //16
.get 15 Foulweald Amulet|q 26362/1
.kill 1 Foulweald Den Watcher|q 1025/1
.kill 2 Foulweald Ursa|q 1025/2
.kill 10 Foulweald Totemic|q 1025/3
.kill 12 Foulweald Warrior|q 1025/4
step //17
..turnin The Ruins of Stardust##1034
step //18
..turnin An Aggressive Defense##1025
step //19
..turnin Attack on the Foulweald##26362
step //20
..turnin The Tower of Althalaxx##973
step //21
..accept The Tower of Althalaxx##1140
step //22
ding 26
step //23
use Hearthstone##6948
step //24
'Buy https://classic.wowhead.com/quest=1 at 
step //25
..turnin The Absent Minded Prospector##942
step //26
..accept The Absent Minded Prospector##943
step //27
..accept Oars O'er the Bay##26386
step //28
..accept The Third Fleet##288
step //29
..turnin The Third Fleet##288
step //30
..accept The Greenwarden##463
step //31
..accept Digging Through the Ooze##470
step //32
..accept Claws from the Deep##279
step //33
..accept Young Crocolisk Skins##484
step //34
..accept Fall of Dun Modr##472
step //35
..accept Report to Captain Stoutfist##473
step //36
..turnin Report to Captain Stoutfist##473
step //37
..turnin Oars O'er the Bay##26386
step //38
..accept In Search of The Excavation Team##305
step //39
.kill 12 Bluegill Murloc|q 279/1
.get 1 Gobbler's Head|q 279/2
step //40
.get 4 Young Crocolisk Skin|q 484/1
step //41
..accept Ormer's Revenge##294
step //42
..turnin In Search of The Excavation Team##305
step //43
..accept In Search of The Excavation Team##306
step //44
.get 1  Flagongut's Fossil|q 943/2
step //45
..accept Uncovering the Past##299
step //46
.kill 10 Mottled Raptor|q 294/1
.kill 10 Mottled Screecher|q 294/2
.get 1  Stone of Relu|q 943/1
.get 1  Neru Fragment|q 299/4
step //47
..turnin Ormer's Revenge##294
step //48
..accept Ormer's Revenge##295
step //49
.kill 10 Mottled Scytheclaw|q 295/1
.kill 10 Mottled Razormaw|q 295/2
.get 1  Golm Fragment|q 299/3
.get 1  Ados Fragment|q 299/1
.get 1  Modt Fragment|q 299/2
step //50
..turnin Ormer's Revenge##295
step //51
..accept Ormer's Revenge##296
step //52
..turnin Uncovering the Past##299
step //53
goto Wetlands,31.99,48.68
step //54
goto Wetlands,31.15,49.05
step //55
goto Wetlands,32.41,50.92
step //56
.get 1 Sarltooth's Talon|q 296/1
step //57
..turnin Ormer's Revenge##296
step //58
..accept Message to Menethil##26283
step //59
..accept Daily Delivery##469
step //60
..turnin The Greenwarden##463
step //61
..accept Tramping Paws##276
step //62
.kill 15 Mosshide Gnoll|q 276/1
.kill 15 Mosshide Mongrel|q 276/2
.get 1 Musquash Root|q 335/2
step //63
..turnin Tramping Paws##276
step //64
..accept Fire Taboo##277
step //65
.get 9 Crude Flint|q 277/1
.get 1 Sida's Bag|q 470/1
step //66
..turnin Fire Taboo##277
step //67
..accept Blisters on The Land##275
step //68
use Hearthstone##6948
step //69
..turnin The Absent Minded Prospector##943
step //70
..turnin Digging Through the Ooze##470
step //71
..turnin In Search of The Excavation Team##305
step //72
..turnin Message to Menethil##26283
step //73
ding 27
step //74
..turnin Daily Delivery##469
step //75
..turnin Young Crocolisk Skins##484
step //76
..accept Apprentive's Duties##471
step //77
..turnin Claws from the Deep##279
step //78
..accept Reclaiming Goods##281
step //79
'Fly to: Stormwind City
step //80
'Learn your spells at your trainer
step //81
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
