local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\33-34 Stranglethorn Valley',
  [[
	author TUGs
	next TUGs\\34-36 Desolace
	startlevel 33
step //1
'Fly to: Stormwind City
step //2
'Set your Hearthstone in Stormwind City
step //3
..turnin Blessed Arm##322
step //4
..accept Armed and Ready##325
step //5
..turnin Reassignment##563
step //6
'Fly to: Westfall
step //7
..turnin Armed and Ready##325
step //8

step //9
..turnin Morbent Fel##55
step //10
Run back to Westfall´s Flightmaster.
step //11
'Fly to: Stranglethorn Vale
step //12
..accept The Second Rebellion##203
step //13
..accept Bad Medicine##204
step //14
..accept Krazek's Cookery##210
step //15
..accept Stop The Shrinking##26437
step //16
..accept Welcome to the Jungle##583
step //17
..turnin Welcome to the Jungle##583
step //18
..accept Raptor Mastery##194
step //19
..accept Tiger Mastery##185
step //20
..accept Panther Mastery##190
step //21

step //22
..turnin Tiger Mastery##185
step //23
..accept Tiger Mastery##186
step //24

step //25

step //26

step //27

step //28
..turnin The Second Rebellion##203
step //29
..turnin Bad Medicine##204
step //30
..turnin Tiger Mastery##186
step //31
..accept Tiger Mastery##187
step //32
..turnin Panther Mastery##190
step //33
..accept Panther Mastery##191
step //34

step //35

step //36

step //37
goto Stranglethorn Vale,27,77.2
step //38
..accept Supply and Demand##575
step //39
..fpath Stranglethorn Vale
step //40
..turnin Krazek's Cookery##210
step //41
..accept The Haunted Isle##616
step //42
..turnin The Haunted Isle##616
step //43
Take the Boat to Ratchet
step //44
..turnin The Barrens Port##1039
#N/A
step //46
'Set your Hearthstone in 
step //47
goto Thousand Needles,31.8,23.5
step //48
..fpath Feralas
step //49
TODO:Add feralas qsts here?
step //50
..accept Driving License Approval##26665
step //51
..turnin The Brassbolts Brothers##1179
step //52
..accept Hardened Shells##1105
step //53
..accept Salt Flat Venom##1104
step //54
..accept Rocket Car Parts##1110
step //55
..accept Wharfmaster Dizzywig##1111
step //56
..accept Hemet Nesingwary##5762
step //57
1
3
step //58
..accept Load Lightening##1176
step //59
..accept The Ghost of the Flats##26561
step //60
..accept Fresh Water Delivery##26666
step //61
..accept Load Lightening##1176
step //62
..accept A Bump in the Road##1175
step //63
1176 Load Lightening
26561 The Ghost of the Flats
26666 Fresh Water Delivery
1176 Load Lightening
1175 A Bump in the Road
26666 Fresh Water Delivery
step //64
..turnin A Bump in the Road##1175
step //65
..turnin Load Lightening##1176
step //66
..accept Goblin Sponsorship##1178
step //67
..turnin Fresh Water Delivery##26666
step //68
..turnin Hardened Shells##1105
step //69
..turnin Salt Flat Venom##1104
step //70
..turnin Rocket Car Parts##1110
step //71
..fpath Tanaris
step //72
use Hearthstone##6948
step //73
..turnin Goblin Sponsorship##1178
step //74
..accept Goblin Sponsorship##1180
step //75
..turnin Wharfmaster Dizzywig##1111
step //76
..accept Parts for Kravel##1112
step //77
Run to Desolace.
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
