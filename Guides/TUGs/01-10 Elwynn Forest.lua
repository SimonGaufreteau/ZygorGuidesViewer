local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\1-10 Elwynn Forest',
  [[
	author TUGs
	defaultfor Human
	next TUGs\\10-11 DunMorogh+LochModan
	startlevel 1
step //1
..accept A Threat Within##783
step //2
..turnin A Threat Within##783
step //3
..accept Kobold Camp Cleanup##7
step //4
..accept Eagan Peltskinner##5261
step //5
..turnin Eagan Peltskinner##5261
step //6
.kill 8 Kobold Vermin|q 7/1
step //7
ding 2
step //8
..turnin Kobold Camp Cleanup##7
step //9
..accept Investigate Echo Ridge##15
step //10
..accept Simple Letter##3100
only Warrior
step //11
..accept Consecrated Letter##3101
only Paladin
step //12
..accept Tainted Letter##3105
only Warlock
step //13
..accept Glyphic Letter##3104
only Mage
step //14
..accept Brotherhood of Thieves##18
step //15
..turnin Tainted Letter##3105
only Warlock
step //16
..accept The Stolen Tome##1598
only Warlock
step //17

only Warlock
step //18
.get 12 Red Burlap Bandana|q 18/1
step //19
..turnin Brotherhood of Thieves##18
step //20
ding 3
step //21
..accept Milly Osworth##3903
step //22
..accept Bounty on Garrick Padfoot##6
step //23
..turnin The Stolen Tome##1598
only Warlock
step //24
..accept Swiftpaw##26326
step //25
.get Garrick's Head|q 6/1
step //26
..accept The Soaked Barrel##26152
step //27

step //28
..turnin Milly Osworth##3903
step //29
..turnin The Soaked Barrel##26152
step //30
..accept Find the Brother##26153
step //31
.kill 10 Kobold Workers|q 15/1
step //32
..turnin Swiftpaw##26326
step //33
..turnin Bounty on Garrick Padfoot##6
step //34
..turnin Investigate Echo Ridge##15
step //35
..accept Skirmish at Echo Ridge##21
step //36
..turnin Glyphic Letter##3104
only Mage
step //37
..turnin ##
only Priest
step //38
..turnin ##
only Rogue
step //39
..turnin Simple Letter##3100
only Warrior
step //40
..turnin Consecrated Letter##3101
only Paladin
step //41
'Learn your spells at your trainer
step //42
..accept A Brother's Disgust##26154
step //43
.kill 10 Kobold Laborer|q 21/1
step //44
..turnin Skirmish at Echo Ridge##21
step //45
Make sure to manually accept the next 2 quests, AddOn is buggy here :( (marked as accepted before they are accepted)
step //46
..accept Report to Goldshire##54
step //47
..accept Rest and Relaxation##2158
step //48
..accept Spider Elixir##26150
step //49
..turnin Report to Goldshire##54
step //50
..accept The Fargodeep Mine##62
step //51
..turnin Rest and Relaxation##2158
step //52
'Set your Hearthstone in Elwynn Forest
step //53
..accept Kobold Candles##60
step //54
..turnin A Brother's Disgust##26154
step //55
..accept A Mage's Advice##26155
step //56
..turnin A Mage's Advice##26155
step //57
..accept Linus Stone Tips##16156
step //58
..accept Gold Dust Exchange##47
step //59
On your way to the next Quest kill as many Kobolds and Boars(you will need 4 Chunk of Boar Meat soon) as you can.
step //60
..accept Lost Necklace##85
step //61
ding 5
step //62
On your way to the next Quest kill as many Kobolds and Boars(you will need 4 Chunk of Boar Meat soon) as you can. If you got the 4 meat already,skip the boars.
step //63
..turnin Lost Necklace##85
step //64
..accept Pie for Billy##86
step //65
..accept Young Lovers##106
step //66
..turnin Young Lovers##106
step //67
..accept Speak with Gramma##111
step //68
Get the rest of the 4 Chunk of Boar Meat now.
step //69
..turnin Pie for Billy##86
step //70
..accept Back to Billy##84
step //71
..turnin Speak with Gramma##111
step //72
..accept Note to William##107
step //73
..turnin Back to Billy##84
step //74
..accept Goldtooth##87
step //75
goal Scout through the Fargodeep Mine|q 62/1
.get Bernice's Necklace|q 87/1
.get 10 Gold Dust|q 47/1
.get 8 Large Candle|q 60/1
step //76
'Grind in the mine till you are 1980xp away from level 7.
step //77
..accept Princess Must Die!##88
step //78
..turnin Goldtooth##87
step //79
ding 7
step //80
Die and rezz at Ghosthealer
step //81

step //82
..turnin Note to William##107
step //83
..accept Collecting Kelp##112
step //84
..turnin Kobold Candles##60
step //85
..accept Shipment to Stormwind##61
step //86
..turnin Linus Stone Tips##16156
step //87
..accept Brewing Brethren##26157
step //88
..turnin Gold Dust Exchange##47
step //89
..accept A Fishy Peril##40
step //90
'Buy 1Salt at Tharynn Bouden
step //91
'Buy 5Mild Spices at Tharynn Bouden
step //92
'Buy 5Simple Flour at Tharynn Bouden
step //93
..turnin A Fishy Peril##40
step //94
..accept Further Concerns##35
step //95
..turnin The Fargodeep Mine##62
step //96
..accept The Jasperlode Mine##76
step //97
'Buy 1Gladius at Corina Steele41.5,65.8
only Warrior
step //98
'Buy 1Wooden Mallet at Corina Steele41.5,65.8
only Paladin
step //99
'Learn your spells at your trainer
only Warrior,Paladin
step //100
'Learn your spells at your trainer
only Warlock,Mage,Priest,Rogue
step //101
.get 4 Crystal Kelp Frond|q 112/1
step //102
goal Scout through the Jasperlode Mine|q 76/1
step //103
goto Elwynn Forest,65,67
step //104
..accept Wanted: Big blue##26161
step //105
..accept Just Desserts##26147
step //106

step //107
..turnin Just Desserts##26147
step //108
..accept Just Desserts##26148
step //109

step //110
..turnin Just Desserts##26148
step //111
..accept Just Desserts##26149
step //112
..turnin Just Desserts##26149
step //113
..turnin Further Concerns##35
step //114
..accept Find the Lost Guards##37
step //115
..accept Protect the Frontier##52
step //116
..turnin Find the Lost Guards##37
step //117
..accept Discover Rolf's Fate##45
step //118

step //119
..turnin Wanted: Big blue##26161
step //120
..accept A Bundle of Trouble##5545
step //121
.get 8 Bundle of Wood|q 5545/1
.kill 8 Prowler|q 52/1
.kill 5 Young Forest Bear|q 52/2
..turnin Discover Rolf's Fate##45
..accept Report to Thomas##71
step //122
ding 8
step //123
..turnin A Bundle of Trouble##5545
step //124
..accept Red Linen Goods##83
step //125
..turnin Protect the Frontier##52
step //126
..turnin Report to Thomas##71
step //127
..accept Deliver Thomas' Report##39
step //128
.get 6 Red Linen Bandana|q 83/1
step //129
.get Brass Collar##1006|q 88/1
step //130
..turnin Red Linen Goods##83
step //131
Enter the Redridge Mountains and die to the spiders at the entrance
step //132
goto Redridge Mountains,12,74
step //133
Die and rezz at Ghosthealer
step //134
goto Redridge Mountains,26,57
step //135
goto Redridge Mountains,30, 59
step //136
..fpath Redridge Mountains
step //137
use Hearthstone##6948
step //138
Buy Missing 6Slot Bags so you got 4 bags.
step //139
'Learn your spells at your trainer
only Warlock,Mage,Priest,Rogue
step //140
..turnin Collecting Kelp##112
step //141
..accept The Escape##114
step //142
..turnin The Jasperlode Mine##76
step //143
ding 9
step //144
..turnin Deliver Thomas' Report##39
step //145
..accept Report to Gryan Stoutmantle##109
step //146
..accept Westbrook Garrison Needs Help!##239
step //147
..accept Elmore's Task##1097
step //148
'Learn your spells at your trainer
only Paladin, Warrior
step //149
..turnin Spider Elixir##26150
step //150
..turnin The Escape##114
step //151
..turnin Princess Must Die!##88
step //152
..turnin Westbrook Garrison Needs Help!##239
step //153
'Grind on the gnolls in the south till you are 800xp away from level 10.
step //154
goto Westfall,59,18
step //155
Die and rezz at Ghosthealer
step //156
goto Westfall,53,54
step //157
'Set your Hearthstone in Westfall
step //158
..turnin Report to Gryan Stoutmantle##109
step //159
Make sure to manually accept the quest A swift message(and its follow ups), AddOn is buggy here :( (marked as accepted before they are accepted)
step //160
..accept A swift Message##6181
step //161
..turnin A swift Message##6181
step //162
..accept Continue to Stormwind##6281
step //163
'Fly to: Stormwind City
step //164
..turnin Shipment to Stormwind##61
step //165
..turnin Continue to Stormwind##6281
step //166
..accept Dungar Longdrink##6261
step //167
..turnin Dungar Longdrink##6261
step //168
..accept Return to Lewis##6285
step //169
..turnin Elmore's Task##1097
step //170
..accept Stormpike's Delivery##353
step //171
Take the Tram to Ironforge
step //172
..fpath Ironforge
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
