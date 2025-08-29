local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\11-15 Darkshore',
  [[
	author TUGs
	next TUGs\\15-17 Redridge Mountains+Loch Modan
	startlevel 11
step //1
..accept Welcome to Auberdine##26202
step //2
..accept For Love Eternal##963
step //3
..accept Buzzbox 827##983
step //4
..accept Plagued Lands##2118
step //5
..accept How Big a Threat?##984
step //6
..accept Washed Ashore##3524
step //7
.get 6 Crawler Leg|q 983/1
step //8
.get Sea Creature Bones|q 3524/1
step //9
goal Rabid Thistle Bear Captured|q 2118/1
step //10
goal Find a corrupt furbolg camp|q 984/1
step //11
..turnin Buzzbox 827##983
step //12
..accept Buzzbox 411##1001
step //13
..turnin Washed Ashore##3524
step //14
..accept Washed Ashore##4681
step //15
.get Sea Turtle Remains|q 4681/1
step //16
.get 3 Thresher Eye|q 1001/1
step //17
..accept Bashal'Aran##954
step //18
..accept Tools of the Highborne##958
step //19
..turnin Welcome to Auberdine##26202
step //20
..turnin Washed Ashore##4681
step //21
..accept Cave Mushrooms##947
step //22
..accept The Red Crystal##4811
step //23
..accept Balancing the Forest##26199
step //24
..turnin Plagued Lands##2118
step //25
..accept Cleansing of the Infected##2138
step //26
..turnin How Big a Threat?##984
step //27
..accept How Big a Threat?##985
step //28
..accept Thundris Windweaver##4761
step //29
.kill 5 Young Moonkin|q 26199/1
.kill 10 Moonkin|q 26199/2
step //30
ding 14
step //31
goal Locate the large, red crystal on Darkshore's eastern mountain range|q 4811/1
step //32
..turnin Bashal'Aran##954
step //33
..accept Bashal'Aran##955
step //34
.get 8 Grell Earring|q 955/1
step //35
..turnin Bashal'Aran##955
step //36
..accept Bashal'Aran##956
step //37
.get Ancient Moonstone Seal|q 956/1
step //38
..turnin Bashal'Aran##956
step //39
..accept Bashal'Aran##957
step //40
..turnin Balancing the Forest##26199
step //41
..accept Balancing the Forest##26200
step //42
..turnin The Red Crystal##4811
step //43
..accept As Water Cascades##4812
step //44
use Empty Water Tube##14338
step //45
goto Darkshore,46,46
step //46
goto Darkshore,45,50
step //47
goto Darkshore,45,54
step //48
.kill 5 Moonkin Oracle|q 26200/1
.kill 10 Raging Moonkin|q 26200/2
step //49
..turnin As Water Cascades##4812
step //50
..accept The Fragments Within##4813
step //51
..accept The Fall of Ameth'Aran##953
step //52
.get Anaya's Pendant|q 963/1
goal Destroy the seal at the ancient flame|q 957/1
goal Read the Lay of Ameth'Aran |q 953/1
goal Read the Fall of Ameth'Aran|q 953/2
.get 7 Highborne Relic|q 958/1
step //53
..turnin The Fall of Ameth'Aran##953
step //54
..accept Beached Sea Turtle##4722
step //55
.kill 8 Blackwood Pathfinder|q 985/1
.kill 5 Blackwood Windtalker|q 985/2
step //56
ding 15
step //57
..turnin Beached Sea Turtle##4722
step //58
..turnin For Love Eternal##963
step //59
..turnin Balancing the Forest##26200
step //60
..turnin The Fragments Within##4813
step //61
..turnin How Big a Threat?##985
step //62
..accept The Tower of Althalaxx##965
step //63
..accept Deep Ocean, Vast Sea##982
step //64
..accept The Twilight's Hammer##26201
step //65
..turnin Tools of the Highborne##958
step //66
..turnin Thundris Windweaver##4761
step //67
..accept The Cliffspring River##4762
step //68
.get Silver Dawning's Lockbox|q 982/1
.get Mist Veil's Lockbox|q 982/2
step //69
..accept Beached Sea Creature##4723
step //70
..turnin Buzzbox 411##1001
step //71
..accept Buzzbox 323##1002
step //72
..turnin Bashal'Aran##957
step //73
Kill Moonstalkers for Buzzbox 323 whilst going towards the beached sea turtle.
step //74
..accept Beached Sea Turtle##4725
step //75
.get Cliffspring River Sample|q 4762/1
step //76
..accept Beached Sea Turtle##4727
step //77
..turnin The Tower of Althalaxx##965
step //78
..accept The Tower of Althalaxx##966
step //79
.get 6 Moonstalker Fang|q 1002/1
step //80
.kill 20 Rabid Thistle Bear|q 2138/1
step //81
Turn in the quest Buzzbox 323 AS SOON AS IT IS DONE
step //82
..turnin Buzzbox 323##1002
step //83
..accept Buzzbox 525##1003
step //84
.get 5 Scaber Stalk|q 947/1
.get 1 Death Cap|q 947/2
step //85
DIE ON PURPOSE - REZZ UP
step //86
..turnin Cleansing of the Infected##2138
step //87
..accept Tharnariun's Hope##2139
step //88
..accept A Lost Master##986
step //89
..turnin Deep Ocean, Vast Sea##982
step //90
..turnin The Cliffspring River##4762
step //91
..accept The Blackwood Corrupted##4763
step //92
ding 16
step //93
..accept The Absent Minded Prospector##729
step //94
..turnin Cave Mushrooms##947
step //95
..accept Onu##948
step //96
use Empty Cleansing Bowl##12346
step //97
..accept WANTED: Murkdeep!##4740
step //98
..turnin Beached Sea Creature##4723
..turnin Beached Sea Turtle##4725
..turnin Beached Sea Turtle##4727
step //99
..turnin Beached Sea Turtle##4725
step //100
..turnin Beached Sea Creature##4723
step //101
..accept Fruit of the Sea##1138
step //102
use Hearthstone##6948
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
