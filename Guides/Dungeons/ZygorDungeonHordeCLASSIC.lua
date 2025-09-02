local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Horde' then
  return
end
if ZGV:DoMutex('DungeonHCLASSIC') then
  return
end
ZygorGuidesViewer.GuideMenuTier = 'CLA'

ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Ragefire Chasm Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Ragefire Chasm',
    description = 'This guide will walk you through completing the Ragefire Chasm quests.',
    condition_suggested = function()
      return level >= 13 and level <= 18 and not completedq(5723)
    end,
    condition_end = function()
      return completedq(5723)
    end,
  },
  [[
step
Reach Level 9 |ding 9
|tip Use the Leveling guides to accomplish this.
step
talk Rahauro##11833
|tip He walks around this area.
accept Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83
accept Searching for the Lost Satchel##5722 |goto Thunder Bluff 70.51,31.83
step
Enter the tunnel |goto Undercity 51.93,64.78 < 10 |only if walking
Follow the path |goto Undercity 45.95,73.73 < 10 |only if walking
talk Varimathras##2425
accept The Power to Destroy...##5725 |goto Undercity 56.26,92.19
step
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
accept Hidden Enemies##5726 |goto Orgrimmar 31.74,37.83
step
Enter the cave |goto Durotar 54.96,9.64 < 15 |walk
Kill Burning Blade enemies around this area
|tip Inside the cave.
collect Lieutenant's Insignia##14544 |q 5726/1 |goto Durotar 53.83,9.04
step
Leave the cave |goto Durotar 54.96,9.64 < 15 |walk
Enter Orgrimmar |goto Orgrimmar 49.08,94.82 < 15 |c |q 5726
step
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5726 |goto Orgrimmar 31.74,37.83
accept Hidden Enemies##5727 |goto Orgrimmar 31.74,37.83
step
Follow the path |goto Orgrimmar 54.40,35.58 < 15 |only if walking
Follow the path down |goto Orgrimmar 55.22,40.76 < 15 |only if walking
talk Neeru Fireblade##3216
|tip Inside the building.
Select _"You may speak frankly, Neeru..."_
Gauge Neeru Fireblade's Reaction to Being a Member of the Burning Blade |q 5727/1 |goto Orgrimmar 49.47,50.63
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5727 |goto Orgrimmar 31.74,37.83
accept Hidden Enemies##5728 |goto Orgrimmar 31.74,37.83
step
Follow the path down |goto Orgrimmar 55.22,40.76 < 15 |only if walking
talk Neeru Fireblade##3216
|tip Inside the building.
accept Slaying the Beast##5761 |goto Orgrimmar 49.49,50.60
step
Enter the Ragefire Chasm Dungeon with Your Group |goto Ragefire Chasm/0 0.00,0.00 < 500 |c |q 5723
stickystart "Slay_8_Ragefire_Trogg"
stickystart "Slay_8_Ragefire_Shaman"
stickystart "Collect_Spells_of_Shadow"
stickystart "Collect_Incantations_from_the_Nether"
step
_Inside the Ragefire Chasm Dungeon:_
talk Maur Grimtotem##11834
|tip Follow long path down and take the first right.
|tip Run up the ramp in the room, killing the troggs.
|tip Maur Grimtotem will be on the floor up in the room.
turnin Searching for the Lost Satchel##5722
accept Returning the Lost Satchel##5724
step
_Inside the Ragefire Chasm Dungeon:_
kill Taragaman the Hungerer##11520
|tip The second boss of the dungeon.
collect Taragaman the Hungerer's Heart##14540 |q 5761/1
step
_Inside the Ragefire Chasm Dungeon:_
kill Jergosh the Invoker##11518 |q 5728/2
|tip The third boss of the dungeon.
step
_Inside the Ragefire Chasm Dungeon:_
kill Bazzalan##11519 |q 5728/1
|tip The final boss of the dungeon.
step
label "Slay_8_Ragefire_Trogg"
_Inside the Ragefire Chasm Dungeon:_ |notinsticky
kill Ragefire Trogg##11318
|tip They are found throughout the instance.
Slay #8# Ragefire Troggs |q 5723/1
step
label "Slay_8_Ragefire_Shaman"
_Inside the Ragefire Chasm Dungeon:_ |notinsticky
kill 8 Ragefire Shaman##11319
|tip They are found throughout the instance.
Slay #8# Ragefire Shaman |q 5723/2
step
label "Collect_Spells_of_Shadow"
_Inside the Ragefire Chasm Dungeon:_ |notinsticky
Kill Searing Blade enemies around this area
|tip Only Searing Blade Cultists and Searing Blade Warlocks will drop this quest item.
collect Spells of Shadow##14395 |q 5725/1
step
label "Collect_Incantations_from_the_Nether"
_Inside the Ragefire Chasm Dungeon:_ |notinsticky
Kill Searing Blade enemies around this area
|tip Only Searing Blade Cultists and Searing Blade Warlocks will drop this quest item.
collect Incantations from the Nether##14396 |q 5725/2
step
Leave the Ragefire Chasm Instance
Click Here to Continue |confirm |q 5724
step
talk Neeru Fireblade##3216
|tip Inside the building.
turnin Slaying the Beast##5761 |goto Orgrimmar 49.49,50.60
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5728 |goto Orgrimmar 31.74,37.83
accept Hidden Enemies##5729 |goto Orgrimmar 31.74,37.83
step
talk Neeru Fireblade##3216
|tip Inside the building.
turnin Hidden Enemies##5729 |goto Orgrimmar 49.49,50.60
accept Hidden Enemies##5730 |goto Orgrimmar 49.49,50.60
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5730 |goto Orgrimmar 31.74,37.83
step
Enter the tunnel |goto Undercity 51.93,64.78 < 10 |only if walking
Follow the path |goto Undercity 45.95,73.73 < 10 |only if walking
talk Varimathras##2425
turnin The Power to Destroy...##5725 |goto Undercity 56.26,92.19
step
talk Rahauro##11833
|tip He walks around this area.
turnin Returning the Lost Satchel##5724 |goto Thunder Bluff 70.51,31.83
turnin Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Wailing Caverns Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Wailing Caverns',
    description = 'This guide will walk you through completing the Wailing Caverns quests.',
    condition_suggested = function()
      return level >= 15 and level <= 25 and not completedq(962)
    end,
    condition_end = function()
      return completedq(962)
    end,
  },
  [[
step
Reach Level 15 |ding 15
|tip Use the Leveling guides to accomplish this.
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
accept The Barrens Oasis##886 |goto Thunder Bluff 78.59,28.56
|only of not haveq(870) or completedq(870)
step
talk Tonga Runetotem##3448
turnin The Barrens Oasis##886 |goto The Barrens 52.26,31.93
accept The Forgotten Pools##870 |goto The Barrens 52.26,31.93
step
Explore the Waters of the Forgotten Pools |q 870/1 |goto The Barrens 45.07,22.53
|tip Underwater.
step
talk Tonga Runetotem##3448
turnin The Forgotten Pools##870 |goto The Barrens 52.26,31.93
accept The Stagnant Oasis##877 |goto The Barrens 52.26,31.93
step
Follow the path |goto The Barrens 59.88,38.96 < 30 |only if walking
click Bubbling Fissure
|tip Underwater.
Test the Dried Seeds |q 877/1 |goto The Barrens 55.61,42.74
step
talk Tonga Runetotem##3448
turnin The Stagnant Oasis##877 |goto The Barrens 52.26,31.93
accept Altered Beings##880 |goto The Barrens 52.26,31.93
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
trash Dried Seeds##5068
step
kill Oasis Snapjaw##3461+
|tip Underwater and along the edges of the water around this area.
collect 8 Altered Snapjaw Shell##5098 |q 880/1 |goto The Barrens 55.53,42.70
step
talk Tonga Runetotem##3448
turnin Altered Beings##880 |goto The Barrens 52.26,31.93
accept Hamuul Runetotem##1489 |goto The Barrens 52.26,31.93
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin Hamuul Runetotem##1489 |goto Thunder Bluff 78.59,28.56
accept Nara Wildmane##1490 |goto Thunder Bluff 78.59,28.56
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Nara Wildmane##1490 |goto Thunder Bluff 75.65,31.60
accept Leaders of the Fang##914 |goto Thunder Bluff 75.65,31.60
step
Enter the cave |goto Thunder Bluff 29.89,29.80 < 5 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
accept Serpentbloom##962 |goto Thunder Bluff 22.82,20.90
step
talk Mebok Mizzyrix##3446
accept Raptor Horns##865 |goto The Barrens 62.37,37.62
step
kill Sunscale Scytheclaw##3256+
|tip They look like purple raptors.
collect 5 Intact Raptor Horn##5055 |q 865/1 |goto The Barrens 43.36,15.57
You can find more around [45.27,14.94]
step
talk Mebok Mizzyrix##3446
turnin Raptor Horns##865 |goto The Barrens 62.37,37.62
accept Smart Drinks##1491 |goto The Barrens 62.37,37.62
step
talk Crane Operator Bigglefuzz##3665
accept Trouble at the Docks##959 |goto The Barrens 63.09,37.61
step
Follow the path up |goto The Barrens 50.32,35.44 < 10 |only if walking
Continue up the path |goto The Barrens 49.17,34.09 < 10 |only if walking
Follow the path |goto The Barrens 48.09,32.95 < 10 |only if walking
Follow the path down |goto The Barrens 47.28,33.56 < 10 |only if walking
Jump down here |goto The Barrens 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto The Barrens 45.77,36.16 < 5 |c |q 3369 |future |or
|tip Aim for the stone.
'|complete completedq(1486) and completedq(1487)
step
Enter the cave |goto The Barrens 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
accept Deviate Hides##1486 |goto The Barrens 45.98,35.66
step
talk Ebru##5768
|tip Inside the cave.
accept Deviate Eradication##1487 |goto The Barrens 46.01,35.74
step
Enter the cave |goto The Barrens 45.97,36.33 < 10 |walk
Follow the path |goto The Barrens 45.91,35.62 < 10 |walk
Continue follow the path |goto The Barrens 46.26,34.98 < 10 |walk
Follow the path |goto The Barrens 45.94,34.24 < 10 |walk
kill Mad Magglish##3655
|tip He is stealthed inside the cave.
collect 99-Year-Old Port##5334 |q 959/1 |goto The Barrens 45.69,33.60
You can also find him around: |notinsticky
[46.84,34.63]
[46.47,35.50]
step
Enter the Wailing Caverns Dungeon with Your Group |goto Wailing Caverns/0 0.00,0.00 < 500 |c |q 3369 |future
stickystart "Collect_6_Wailing_Essence"
stickystart "Collect_10_Serpentbloom"
stickystart "Collect_20_Deviate_Hide"
stickystart "Slay_7_Deviate_Ravager"
stickystart "Slay_7_Deviate_Viper"
stickystart "Slay_7_Deviate_Shambler"
stickystart "Slay_7_Deviate_Dreadfang"
step
_Inside the Wailing Caverns Dungeon:_
kill Lady Anacondra##3671
|tip She is the first boss of the dungeon.
|tip She can spawn at several locations in the Screaming Gully.
collect Gem of Anacondra##9739 |q 914/2
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Cobrahn##3669
|tip He is the second boss of the dungeon.
|tip Follow the water path west from the Screaming Gully into the Pit of Fangs.
|tip Follow the path up and around through the Pit of Fangs.
collect Gem of Cobrahn##9738 |q 914/1
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Pythas##3670
|tip He is the third boss of the dungeon.
|tip Leave the Pit of Fangs and reenter the Screaming Gully.
|tip Follow the water path east to briefly enter The Wailing Caverns and then the Crag of the Everliving.
|tip Continue through the Crag of the Everliving to reach the Winding Chasm.
|tip Immediately after reaching the Winding Chasm, follow the right path northeast through the small pool of water.
|tip He is back in the northern part of the Winding Chasm.
collect Gem of Pythas##9740 |q 914/3
step
_Inside the Wailing Caverns Dungeon:_
kill Lord Serpentis##3673
|tip After killing Lord Pythas in the Winding Chasm, head southeast to enter The Wailing Caverns.
|tip Continue south a short distance and head left after reaching an area with lots of small white candles on the ground and a Druid of the Fang.
|tip You will now be back in the Winding Chasm, continue straight southeast through this cave section, passing a pool of water on your left.
|tip You will reach a fenced off area with two Druid of the Fang guards and an optional boss, Skum.
|tip Follow the path to the right of the fence and continue going southwest to reach the Crag of the Everliving.
|tip Carefully jump across the gap by the small waterfall and continue along this upper path to reach Lord Serpentis.
collect Gem of Serpentis##9741 |q 914/4
step
label "Collect_6_Wailing_Essence"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
Kill Ectoplasm enemies around this area
|tip They are found throughout the dungeon.
collect 6 Wailing Essence##6464 |q 1491/1
step
label "Collect_10_Serpentbloom"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
click Serpentbloom##13874+
|tip They look like small green, purple and pink plants along the walls inside of the dungeon.
collect 10 Serpentbloom##5339 |q 962/1
step
label "Collect_20_Deviate_Hide"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
Kill Deviate enemies around this area
|tip They are found throughout the dungeon.
collect 20 Deviate Hide##6443 |q 1486/1
step
label "Slay_7_Deviate_Ravager"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Ravager##3636 |q 1487/1
|tip They are found in the Screaming Gully.
step
label "Slay_7_Deviate_Viper"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Viper##5755 |q 1487/2
|tip They are found in the Pit of Fangs.
step
label "Slay_7_Deviate_Shambler"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Shambler##5761 |q 1487/3
|tip They are found in the Crag of the Everliving.
step
label "Slay_7_Deviate_Dreadfang"
_Inside the Wailing Caverns Dungeon:_ |notinsticky
kill 7 Deviate Dreadfang##5056 |q 1487/4
|tip They are found in the Winding Chasm.
step
_Inside the Wailing Caverns Dungeon:_
talk Disciple of Naralex##3678
|tip He is standing at the dungeon entrance.
Select _"Let the event begin!"_
|tip This will only be an available option once the previous bosses have been killed.
Escort the Disciple of Naralex
|tip Kill the enemies that spawn and attack and don't let him die.
|tip This will be easier if the Screaming Gully is already cleared of enemies.
kill Mutanus the Devourer##3654
|tip He will spawn at Dreamer's Rock, after several waves of enemies.
collect Glowing Shard##10441 |n
use the Glowing Shard##10441
accept The Glowing Shard##6981 |or
'|accept The Glowing Shard##3366 |or
step
Leave the Wailing Caverns Dungeon
Click Here to Continue |confirm |q 3369 |future
step
Follow the path up |goto Wailing Caverns/0 47.59,34.46 < 7 |only if walking
Cross the bridge |goto Wailing Caverns/0 47.52,33.91 < 7 |only if walking
Continue following the path |goto Wailing Caverns/0 47.41,32.89 < 7 |only if walking
Cross the water |goto Wailing Caverns/0 46.91,32.63 < 10 |only if walking
Continue following the path |goto Wailing Caverns/0 45.86,33.34 < 10 |only if walking
Leave the cave |goto Wailing Caverns/0 45.95,36.21 < 7 |c |q 3369 |future
step
Follow the path up |goto Wailing Caverns/0 50.32,35.44 < 10 |only if walking
Continue up the path |goto Wailing Caverns/0 49.17,34.09 < 10 |only if walking
Follow the path |goto Wailing Caverns/0 48.09,32.95 < 10 |only if walking
Follow the path down |goto Wailing Caverns/0 47.28,33.56 < 10 |only if walking
Jump down here |goto Wailing Caverns/0 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto Wailing Caverns/0 45.77,36.16 < 5 |c |q 3369 |future |or
|tip Aim for the stone.
'|complete completedq(1486) and completedq(1487) |or
step
Enter the cave |goto The Barrens 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
turnin Deviate Hides##1486 |goto The Barrens 45.98,35.66
step
talk Ebru##5768
|tip Inside the cave.
turnin Deviate Eradication##1487 |goto The Barrens 46.01,35.74
step
talk Mebok Mizzyrix##3446
turnin Smart Drinks##1491 |goto The Barrens 62.37,37.62
step
talk Crane Operator Bigglefuzz##3665
turnin Trouble at the Docks##959 |goto The Barrens 63.09,37.61
step
talk Sputtervalve##3442
Select _"Tell me about the Glowing Shard."_
Speak with Someone in Ratchet About the Glowing Shard |q 6981/1 |goto The Barrens 62.98,37.22 |only if haveq(6981) or completedq(6981)
Speak with Someone in Ratchet About the Glowing Shard |q 3366/1 |goto The Barrens 62.98,37.22 |only if haveq(3366) or completedq(3366)
step
Follow the path up |goto The Barrens 50.32,35.44 < 10 |only if walking
Continue up the path |goto The Barrens 49.17,34.09 < 10 |only if walking
talk Falla Sagewind##8418
|tip Inside the building.
turnin The Glowing Shard##6981 |goto The Barrens 48.18,32.78 |only if haveq(6981) or completedq(6981)
turnin The Glowing Shard##3366 |goto The Barrens 48.18,32.78 |only if haveq(3366) or completedq(3366)
accept In Nightmares##3369 |goto The Barrens 48.18,32.78
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Leaders of the Fang##914 |goto Thunder Bluff 75.65,31.60
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin In Nightmares##3369 |goto Thunder Bluff 78.59,28.56
step
Enter the cave |goto Thunder Bluff 29.89,29.80 < 5 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
turnin Serpentbloom##962 |goto Thunder Bluff 22.82,20.90
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Shadowfang Keep Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Shadowfang Keep',
    description = 'This guide will walk you through completing the Shadowfang Keep quests.',
    condition_suggested = function()
      return level >= 18 and level <= 30 and not completedq(1013)
    end,
    condition_end = function()
      return completedq(1013)
    end,
  },
  [[
step
Reach Level 18 |ding 18
|tip Use the Leveling guides to accomplish this.
step
talk Keeper Bel'dugur##2934
accept The Book of Ur##1013 |goto Undercity 53.72,54.45
step
talk Dalar Dawnweaver##1938
accept Arugal Must Die##1014 |goto Silverpine Forest 44.20,39.79
step
Enter the crypt |goto Silverpine Forest 43.09,41.38 < 5 |walk
talk High Executor Hadrec##1952
|tip Inside the crypt.
accept Deathstalkers in Shadowfang##1098 |goto Silverpine Forest 43.42,40.87
step
Enter the Shadowfang Keep Dungeon with Your Group |goto Shadowfang Keep/0 0.00,0.00 < 500 |c |q 1013
step
_Inside the Shadowfang Keep Dungeon:_
kill Rethilgore##3914
|tip The first boss of the dungeon.
click Lever
|tip Open the cell door and speak with Deathstalker Adamant.
talk Deathstalker Adamant##3849
Select _"Please unlock the courtyard door."_
|tip Follow him and once he opens the door, jump down to the right of the stairs.
talk Deathstalker Vincent##4444
turnin Deathstalkers in Shadowfang##1098
step
_Inside the Shadowfang Keep Dungeon:_
|tip Follow the path through the dungeon, defeat Baron Silverlaine, and then head upstairs.
|tip Continue following the path to defeat Commander Springvale then go downstairs and outside.
|tip Continue along the outside path to reenter the building and reach Odo the Blindwatcher and eventually Fenrus the Devourer.
kill Fenrus the Devourer##4274
click The Book of Ur##36738
|tip It looks like a blue blook on a bookshelf on the left side of the room where Fenrus the Devourer is.
collect The Book of Ur##6283 |q 1013/1
step
_Inside the Shadowfang Keep Dungeon:_
kill Archmage Arugal##4275
|tip He is the last boss of the dungeon.
collect Head of Arugal##5442 |q 1014/1
step
Leave the Shadowfang Keep Dungeon
Click Here to Continue |confirm |q 1013
step
talk Dalar Dawnweaver##1938
turnin Arugal Must Die##1014 |goto Silverpine Forest 44.20,39.79
step
talk Keeper Bel'dugur##2934
turnin The Book of Ur##1013 |goto Undercity 53.72,54.45
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Blackfathom Deeps Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Blackfathom Deeps',
    description = 'This guide will walk you through completing the Blackfathom Deeps quests.',
    condition_suggested = function()
      return level >= 21 and level <= 32 and not completedq(6561)
    end,
    condition_end = function()
      return completedq(6561)
    end,
    hideif = ZGV.IsClassicSoD,
  },
  [[
step
Reach Level 21 |ding 21
|tip Use the Leveling guides to accomplish this.
step
talk Je'neu Sancrea##12736
|tip Inside the building.
accept The Essence of Aku'Mai##6563 |goto Ashenvale 11.57,34.28
accept Amongst the Ruins##6921 |goto Ashenvale 11.57,34.28
step
Follow the path |goto Ashenvale 14.11,14.87 < 15 |only if walking
Jump down into the water |goto Ashenvale 43.97,35.37 < 20 |walk
Enter the underwater cave |goto Ashenvale 43.94,35.27 < 7 |walk
kill Blackfathom Tide Priestess##4802
|tip You may need help with this.
collect Damp Note##16790 |goto Ashenvale 43.82,35.14 |q 6564 |future
|tip This has a low drop rate.
step
use the Damp Note##16790
accept Allegience to the Old Gods##6564
step
talk Je'neu Sancrea##12736
|tip Inside the building.
turnin Allegience to the Old Gods##6564 |goto Ashenvale 11.57,34.28
accept Allegiance to the Old Gods##6565 |goto Ashenvale 11.57,34.28
step
Jump into the water |goto Ashenvale/0 14.12,13.88 < 10 |walk
Swim underwater into the cave |goto Ashenvale/0 13.28,13.23 < 10 |walk
click Sapphire of Aku'Mai##178184+
|tip They look like light-blue crystals along the cavern walls all through out this area.
collect 20 Sapphire of Aku'Mai##16784 |q 6563/1 |goto Ashenvale/0 13.74,9.38
step
Follow the path |goto Ashenvale/0 14.37,9.20 < 10 |walk
Continue following the path |goto Ashenvale/0 16.50,11.61 < 10 |walk
Enter the Blackfathom Deeps Dungeon with Your Group |goto Blackfathom Deeps/0 0.00,0.00 < 500 |c |q 6561 |future
step
_Inside the Blackfathom Deeps Dungeon:_
talk Argent Guard Thaelrid##4787
|tip Follow the path inside the dungeon to enter The Drowned Sacellum.
|tip Swim to the south side of the room and then jump across the platforms to reach the southwest path.
|tip Continue following the path to The Pool of Ask'ar then head southwest again and swim into the underwater cave.
|tip He is laying on the ground inside the underwater cave.
accept Blackfathom Villainy##6561
step
_Inside the Blackfathom Deeps Dungeon:_
kill Lorgus Jett##12902 |q 6565/1
|tip He is an optional mini boss in the dungeon.
|tip Leave the underwater cave and reenter the main room in The Pool of Ask'ar.
|tip Swim south and follow the path to the left.
|tip When the path branches in multiple directions he can usually be found in one of the small nooks on the western side of the map.
|tip If he's not there he should be further down the path to the south.
step
_Inside the Blackfathom Deeps Dungeon:_
click Fathom Stone
|tip It is under water in the center of the Moonshrine Ruins, beneath the walkway just before Twilight Lord Kelris.
|tip Clicking it will also cause Baron Aquanis to spawn.
collect Fathom Core##16762 |q 6921
step
_Inside the Blackfathom Deeps Dungeon:_
kill Baron Aquanis##12876
|tip He is an optional boss in the dungeon.
|tip He spawns after clicking the Fathom Stone underwater in the Moonshrine Ruins.
collect Strange Water Globe##16782 |q 6922 |future
step
use the Strange Water Globe##16782
accept Baron Aquanis##6922
step
_Inside the Blackfathom Deeps Dungeon:_
kill Twilight Lord Kelris##4832
collect Head of Kelris##5881 |q 6561/1
step
Leave the Blackfathom Deeps Dungeon
Click Here to Continue |confirm |q 6561
step
talk Je'neu Sancrea##12736
|tip Inside the building.
turnin The Essence of Aku'Mai##6563 |goto Ashenvale 11.57,34.28
turnin Allegiance to the Old Gods##6565 |goto Ashenvale 11.57,34.28
turnin Amongst the Ruins##6921 |goto Ashenvale 11.57,34.28
turnin Baron Aquanis##6922 |goto Ashenvale 11.57,34.28
step
talk Bashana Runetotem##9087
|tip Inside the building.
turnin Blackfathom Villainy##6561 |goto Thunder Bluff 71.07,34.16
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Gnomeregan Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Gnomeregan',
    description = 'This guide will walk you through completing the Gnomeregan quests.',
    condition_suggested = function()
      return level >= 25 and level <= 38 and not completedq(2841)
    end,
    condition_end = function()
      return completedq(2841)
    end,
    hideif = ZGV.IsClassicSoD,
  },
  [[
step
Reach Level 25 |ding 25
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar 75.22,24.61 < 5 |walk
talk Nogg##3412
|tip Inside the building.
accept Rig Wars##2841 |goto Orgrimmar 76.00,25.42
step
talk Sovik##3413
|tip Inside the building.
accept Chief Engineer Scooty##2842 |goto Orgrimmar 75.49,25.35
step
talk Scooty##7853
turnin Chief Engineer Scooty##2842 |goto Stranglethorn Vale 27.60,77.48
accept Gnomer-gooooone!##2843 |goto Stranglethorn Vale 27.60,77.48
step
Watch the dialogue
Wait for Scooty to Calibrate the Goblin Transponder |q 2843/1
step
talk Scooty##7853
turnin Gnomer-gooooone!##2843 |goto Stranglethorn Vale 27.60,77.48
step
Step onto the teleporter |goto Stranglethorn Vale 27.63,77.56
Teleport to the Gnomeregan Dungeon |goto Dun Morogh/0 21.98,36.73 < 1000 |c |noway |q 2841
step
Follow the path |goto Dun Morogh/0 19.93,36.02 < 10 |walk
Enter the Gnomeregan Dungeon with Your Group |goto Gnomeregan/0 0.00,0.00 < 500 |c |q 2841
step
_Inside the Gnomeregan Dungeon:_
kill Mekgineer Thermaplugg##7800
|tip He is the last boss of the dungeon.
|tip Follow the path west through The Hall of Gears to enter the Launch Bay.
|tip Continue southwest through the Launch Bay and follow the path to reach Tinkers' Court.
collect Thermaplugg's Safe Combination##9299 |q 2841/2
step
_Inside the Gnomeregan Dungeon:_
click Thermaplugg's Safe##142477
|tip It's near the back wall of the third pillar from the right in the room with Mekgineer Thermaplugg.
collect Rig Blueprints##9153 |q 2841/1
step
Leave the Gnomeregan Dungeon
Click Here to Continue |confirm |q 2841
step
Enter the building |goto Orgrimmar 75.22,24.61 < 5 |walk
talk Nogg##3412
|tip Inside the building.
turnin Rig Wars##2841 |goto Orgrimmar 76.00,25.42
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Razorfen Kraul Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Razorfen Kraul',
    description = 'This guide will walk you through completing the Razorfen Kraul quests.',
    condition_suggested = function()
      return level >= 30 and level <= 40 and not completedq(6522)
    end,
    condition_end = function()
      return completedq(6522)
    end,
  },
  [[
step
Reach Level 30 |ding 30
|tip Use the Leveling guides to accomplish this.
step
Follow the path	|goto Undercity 46.94,59.57 < 10 |only if walking
Run down the ramp |goto Undercity 44.56,66.51 < 10 |only if walking
talk Master Apothecary Faranell##2055
accept Going, Going, Guano!##1109 |goto Undercity 48.81,69.30
step
talk Mebok Mizzyrix##3446
accept Blueleaf Tubers##1221 |goto The Barrens 62.37,37.62
step
click Snufflenose Command Sticks##68865
|tip They look like a bundle of sticks sitting in an urn in front of the building.
collect Snufflenose Command Stick##6684 |q 1221/4|goto The Barrens 62.34,37.61
step
click Snufflenose Owner's Manual##21530
|tip They look like books sitting on the table in front of the building.
collect Snufflenose Owner's Manual##5897 |q 1221/3 |goto The Barrens 62.34,37.63
step
click Crate with Holes##21277
|tip They look like boxes sitting on the ground and the table in front of the building.
collect Crate With Holes##5880 |q 1221/2 |goto The Barrens 62.33,37.63
step
talk Auld Stonespire##4451
|tip Inside the building.
accept A Vengeful Fate##1102 |goto Thunder Bluff 36.02,59.88
step
Enter the Razorfen Kraul Dungeon with Your Group |goto Razorfen Kraul/0 0.00,0.00 < 500 |c |q 6522 |future
step
_Inside the Razorfen Kraul Dungeon:_
|tip After killing Overlord Ramtusk, go southwest and cross the bridge to reach the small platform in between two bridges.
use the Crate With Holes##5880
|tip This will summon a gopher.
use the Snufflenose Command Stick##6684
|tip Use it to command the gopher.
click Blueleaf Tuber##20920+
collect 6 Blueleaf Tuber##5876 |q 1221/1
step
_Inside the Razorfen Kraul Dungeon:_ |notinsticky
collect Kraul Guano##5801 |q 1109/1
|tip These drop from Kraul Bats and Greater Kraul Bats.
|tip Continue west across the bridges and enter the cave.
step
_Inside the Razorfen Kraul Dungeon:_
kill Charlga Razorflank##4421
|tip She is the last boss of the dungeon.
|tip Continue south through the cave, follow the path around and exit to the north.
collect Razorflank's Heart##5793 |q 1102/1
step
_Inside the Razorfen Kraul Dungeon:_
kill Charlga Razorflank##4421
|tip She is the last boss of the dungeon.
collect Small Scroll##17008 |q 6522 |future
step
use the Small Scroll##17008
accept An Unholy Alliance##6522
step
_Inside the Razorfen Kraul Dungeon:_
talk Willix the Importer##4508
|tip Inside the building.
|tip Jump down from the platform where Charlga Razorflank was and head to the tent to the left.
|tip This is an escort quest.
accept Willix the Importer##1144
step
_Inside the Razorfen Kraul Dungeon:_
Follow and protect Willix the Importer
Escort Willix the Importer out of Razorfen Kraul |q 1144/1
step
_Inside the Razorfen Kraul Dungeon:_
talk Willix the Importer##4508
|tip He will be at the entrance after the completion of the escort quest.
turnin Willix the Importer##1144
step
Leave the Razorfen Kraul Dungeon
Click Here to Continue |confirm |q 6522
step
talk Mebok Mizzyrix##3446
turnin Blueleaf Tubers##1221 |goto The Barrens 62.37,37.62
step
talk Auld Stonespire##4451
|tip Inside the building.
turnin A Vengeful Fate##1102 |goto Thunder Bluff 36.02,59.88
step
Follow the path	|goto Undercity 46.94,59.57 < 10 |only if walking
Run down the ramp |goto Undercity 44.56,66.51 < 10 |only if walking
talk Master Apothecary Faranell##2055
turnin Going, Going, Guano!##1109 |goto Undercity 48.81,69.30
step
Follow the path |goto Undercity 51.86,64.67 < 10 |only if walking
talk Varimathras##2425
turnin An Unholy Alliance##6522 |goto Undercity 56.23,92.18
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Scarlet Monastery Graveyard Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Scarlet Monastery',
    description = 'This guide will walk you through completing the Scarlet Monastery Graveyard Quests.',
  },
  [[
step
Reach Level 30 |ding 30
|tip Use the Leveling guides to accomplish this.
step
Follow the path	|goto Undercity 46.94,59.57 < 10 |only if walking
Run down the ramp |goto Undercity 44.56,66.51 < 10 |only if walking
talk Master Apothecary Faranell##2055
accept Going, Going, Guano!##1109 |goto Undercity 48.81,69.30
step
collect Kraul Guano##5801 |q 1109/1
|tip These drop from Kraul Bats and Greater Kraul Bats in the Razorfen Kraul Dungeon.
|tip Use the Razorfen Kraul Quests guide to accomplish this.
step
Follow the path	|goto Undercity 46.94,59.57 < 10 |only if walking
Run down the ramp |goto Undercity 44.56,66.51 < 10 |only if walking
talk Master Apothecary Faranell##2055
turnin Going, Going, Guano!##1109 |goto Undercity 48.81,69.30
accept Hearts of Zeal##1113 |goto Undercity 48.81,69.30
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
Enter the Portal |goto Tirisfal Glades/0 84.84,30.51 < 7 |walk
Enter the Scarlet Monastery - Graveyard Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1113
stickystart "Collect_30_Heart_of_Zeal"
step
Inside the Scarlet Monastery Graveyard Dungeon:
talk Vorrel Sengutz##3981
|tip After entering the Chamber of Atonement, he is laying on a table to the right, next to Interrogator Vishas.
accept Vorrel's Revenge##1051
step
label "Collect_30_Heart_of_Zeal"
Inside the Scarlet Monastery Graveyard Dungeon: |notinsticky
Kill Scarlet enemies around this area
|tip You can find more outside of the dungeon.
collect 30 Heart of Zeal##5805 |q 1113/1
step
Leave the Scarlet Monastery Graveyard Dungeon
Click Here to Continue |confirm |q 1113
step
Cross the water |goto Silverpine Forest/0 58.44,35.31 < 20 |only if walking
Continue across the water |goto Silverpine Forest/0 81.11,30.01 < 20 |only if walking
kill Nancy Vishas##3984
|tip Inside the building.
|tip You may need help with this.
collect Vorrel's Wedding Ring##5538 |q 1051/1 |goto Alterac Mountains 32.34,32.78
step
talk Monika Sengutz##3982
|tip Inside the building.
turnin Vorrel's Revenge##1051 |goto Hillsbrad Foothills 62.67,18.88
step
Follow the path	|goto Undercity 46.94,59.57 < 10 |only if walking
Run down the ramp |goto Undercity 44.56,66.51 < 10 |only if walking
talk Master Apothecary Faranell##2055
turnin Hearts of Zeal##1113 |goto Undercity 48.81,69.30
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Scarlet Monastery Library Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Scarlet Monastery',
    description = 'This guide will walk you through completing the Scarlet Monastery Library Quests.',
  },
  [[
step
Reach Level 28 |ding 28
|tip Use the Leveling guides to accomplish this.
step
talk Sage Truthseeker##3978
|tip Inside the building.
accept Compendium of the Fallen##1049 |goto Thunder Bluff 34.41,46.90
|only Orc, Tauren, Troll
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 7 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
accept Test of Faith##1149 |goto Thousand Needles 53.94,41.48
step
Watch the dialogue
Teleport to the Plateau |goto Thousand Needles 26.43,31.29 < 20 |noway |c |q 1149
step
Jump down here |goto Thousand Needles 26.43,32.41
|tip You won't die.
Return to Dorn Plainstalker |goto Thousand Needles 53.89,41.62 < 20 |noway |c |q 1149
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 7 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
turnin Test of Faith##1149 |goto Thousand Needles 53.94,41.48
accept Test of Endurance##1150 |goto Thousand Needles 53.94,41.48
step
Follow the path up |goto Thousand Needles 27.59,49.85 < 7 |only if walking
Continue up the path |goto Thousand Needles 28.73,51.37 < 7 |only if walking
Enter the cave |goto Thousand Needles 27.27,51.29 < 8 |walk
click Harpy Foodstuffs##20447
|tip Inside the cave.
Kill the enemies that attack in waves
kill Grenka Bloodscreech##4490
collect Grenka's Claw##5843 |q 1150/1 |goto Thousand Needles 25.84,54.77
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 7 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
turnin Test of Endurance##1150 |goto Thousand Needles 53.94,41.48
accept Test of Strength##1151 |goto Thousand Needles 53.94,41.48
step
label "RokAlim_the_Pounder_Path_One"
map Thousand Needles
path loop off; dist 20
path	26.24,47.48	23.91,44.29	20.59,40.07	17.96,37.68	15.25,33.88
path	14.11,29.42	12.88,26.44
kill Rok'Alim the Pounder##4499
|tip It patrols along this path.
|tip You may need help with this.
collect Fragments of Rok'Alim##5844 |or |q 1151/1 |next "Accept_Test_Of_Lore"
'|goto Thousand Needles 12.88,26.44 < 20 |noway |or |c
step
map Thousand Needles
path loop off; dist 20
path	12.88,26.44	14.11,29.42	15.25,33.88	17.96,37.68	20.59,40.07
path	23.91,44.29	26.24,47.48
kill Rok'Alim the Pounder##4499
|tip It patrols along this path.
|tip You may need help with this.
collect Fragments of Rok'Alim##5844 |or |q 1151/1
'|goto Thousand Needles 26.24,47.48 < 20 |noway |or |c |next "RokAlim_the_Pounder_Path_One"
step
label "Accept_Test_Of_Lore"
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 7 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
turnin Test of Strength##1151 |goto Thousand Needles 53.94,41.48
accept Test of Lore##1152 |goto Thousand Needles 53.94,41.48
step
Follow the path |goto Stonetalon Mountains 61.45,66.35 < 20 |only if walking
talk Braug Dimspirit##4489
|tip Inside the tent.
turnin Test of Lore##1152 |goto Stonetalon Mountains 78.78,45.67
accept Test of Lore##1154 |goto Stonetalon Mountains 78.78,45.67
step
Enter the building |goto Ashenvale 75.96,75.38 < 8 |walk
Follow the path down |goto Ashenvale 76.27,75.64 < 8 |c |q 1154 |future
step
Follow the path |goto Ashenvale 77.23,76.28 < 10 |walk
Run down the ramp |goto Ashenvale 77.31,75.18 < 10 |walk
Continue following the path |goto Ashenvale 76.76,74.86 < 10 |walk
Continue down the path |goto Ashenvale 75.66,76.11 < 10 |walk
Cross the bridge |goto Ashenvale 75.41,75.11 < 5 |walk
click The Legacy of the Aspects##20725
|tip Inside the cave.
collect Legacy of the Aspects##5860 |q 1154/1 |goto Ashenvale 75.56,74.37
step
Follow the path |goto Stonetalon Mountains 61.45,66.35 < 20 |only if walking
talk Braug Dimspirit##4489
|tip Inside the tent.
turnin Test of Lore##1154 |goto Stonetalon Mountains 78.78,45.67
accept Test of Lore##6627 |goto Stonetalon Mountains 78.78,45.67
step
talk Braug Dimspirit##4489
|tip Inside the tent.
Select _"Neltharion is my answer."_
Answer Braug Dimspirit's Question Correctly |q 6627/1 |goto Stonetalon Mountains 78.78,45.67
step
talk Braug Dimspirit##4489
|tip Inside the tent.
turnin Test of Lore##6627 |goto Stonetalon Mountains 78.78,45.67
accept Test of Lore##1159 |goto Stonetalon Mountains 78.78,45.67
step
talk Parqual Fintallas##4488
|tip Standing on the bridge.
turnin Test of Lore##1159 |goto Undercity 57.80,65.44
accept Test of Lore##1160 |goto Undercity 57.80,65.44
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
accept Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
Enter the Portal |goto Tirisfal Glades/0 85.33,32.27 < 7 |walk
Enter the Scarlet Monastery - Library Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1160
step
Inside the Scarlet Monastery Library Dungeon:
kill Houndmaster Loksey##3974 |q 1048/4
|tip He is the first boss of the dungeon.
|tip Follow the path to enter Huntsman's Cloister, then continue south to the small room.
step
Inside the Scarlet Monastery Library Dungeon:
click Beginnings of the Undead Threat##20726
|tip It looks like an open book laying on a table.
|tip It is in the first room on the left once you enter the Gallery of Treasures.
collect Beginnings of the Undead Threat##5861 |q 1160/1
step
Inside the Scarlet Monastery Library Dungeon:
click Compendium of the Fallen##19283
|tip Continue following the path through the dungeon to reach the Athenaeum.
|tip Once you enter the Athenaeum, follow the wall left and it will be on a nearby bookcase.
collect Compendium of the Fallen##5535 |q 1049/1
|only Orc, Tauren, Troll
step
Inside the Scarlet Monastery Library Dungeon:
click Doan's Strongbox##103821
|tip It looks like a grey and black lockbox on the ground behind Arcanist Doan, the final boss of the dungeon.
collect The Scarlet Key##7146
|tip This key is required to open the doors to access the last two wings of the Scarlet Monastery Dungeon.
|tip If someone in your group already has the key you can skip this step.
step
Leave the Scarlet Monastery Library Dungeon
Click Here to Continue |confirm |q 1160
step
talk Parqual Fintallas##4488
|tip Standing on the bridge.
turnin Test of Lore##1160 |goto Undercity 57.80,65.44
accept Test of Lore##6628 |goto Undercity 57.80,65.44
step
talk Parqual Fintallas##4488
|tip Choose "Ner'zhul", which should be the 3rd option.
Answer Parqual Fintallas' Question Correctly |q 6628/1 |goto Undercity 57.80,65.44
step
talk Parqual Fintallas##4488
|tip Standing on the bridge.
turnin Test of Lore##6628 |goto Undercity 57.80,65.44
accept Final Passage##1394 |goto Undercity 57.80,65.44
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
turnin Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
|tip This quest requires you to kill bosses in Scarlet Monastery - Library, Armory and Cathedral.
|tip Use the Scarlet Monastery Armory Quests and Scarlet Monastery Cathedral Quests guides to accomplish this.
|tip If you haven't completed the other objectives yet, skip this for now.
step
talk Sage Truthseeker##3978
|tip Inside the building.
turnin Compendium of the Fallen##1049 |goto Thunder Bluff 34.41,46.90
|only Orc, Tauren, Troll
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 7 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
turnin Final Passage##1394 |goto Thousand Needles 53.94,41.48
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Scarlet Monastery Armory Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Scarlet Monastery',
    description = 'This guide will walk you through completing the Scarlet Monastery Armory Quests.',
  },
  [[
step
Reach Level 38 |ding 38
|tip Use the Leveling guides to accomplish this.
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
accept Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
click Armory Door |goto Tirisfal Glades/0 85.41,31.59 < 7 |walk
|tip You will need The Scarlet Key from the chest behind Arcanist Doan in the Library to open this.
|tip A rogue with 175 Lockpicking skill can pick it and a Truesilver Key opens it too.
|tip Engineers can also blast the door open.
Enter the Portal |goto Tirisfal Glades/0 85.67,31.76 < 7 |walk
Enter the Scarlet Monastery - Armory Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1048
step
Inside the Scarlet Monastery Armory Dungeon:
kill Herod##3975 |q 1048/3
|tip He is the only boss of the dungeon, found all the way at the end.
step
Leave the Scarlet Monastery Armory Dungeon
Click Here to Continue |confirm |q 1048
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
turnin Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
|tip This quest requires you to kill bosses in Scarlet Monastery - Library, Armory and Cathedral.
|tip Use the Scarlet Monastery Library Quests and Scarlet Monastery Cathedral Quests guides to accomplish this.
|tip If you haven't completed the other objectives yet, skip this for now.
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Scarlet Monastery Cathedral Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Scarlet Monastery',
    description = 'This guide will walk you through completing the Scarlet Monastery Cathedral Quests.',
  },
  [[
step
Reach Level 40 |ding 40
|tip Use the Leveling guides to accomplish this.
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
accept Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
click Cathedral Door |goto Tirisfal Glades/0 85.21,30.86 < 7 |walk
|tip You will need The Scarlet Key from the chest behind Arcanist Doan in the Library to open this.
|tip A rogue with 175 Lockpicking skill can pick it and a Truesilver Key opens it too.
|tip Engineers can also blast the door open.
Enter the Portal |goto Tirisfal Glades/0 85.32,30.48 < 7 |walk
Enter the Scarlet Monastery - Cathedral Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1048
step
Inside the Scarlet Monastery Cathedral Dungeon:
kill Scarlet Commander Mograine##3976 |q 1048/2
|tip He is the last boss of the dungeon, found all the way at the end.
step
Inside the Scarlet Monastery Cathedral Dungeon:
kill High Inquisitor Whitemane##3977 |q 1048/1
|tip She is the last boss of the dungeon, found all the way at the end.
step
Leave the Scarlet Monastery Cathedral Dungeon
Click Here to Continue |confirm |q 1048
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
turnin Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Razorfen Downs Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Razorfen Downs',
    description = 'This guide will walk you through completing the Razorfen Downs Quests.',
  },
  [[
step
Reach Level 37 |ding 37
|tip Use the leveling guides to accomplish this.
step
kill Charlga Razorflank##4421
|tip She is the last boss of the Razorfen Kraul Dungeon.
|tip Use the Razorfen Kraul Dungeon guide to accomplish this.
collect Small Scroll##17008 |n
use the Small Scroll##17008
accept An Unholy Alliance##6522
step
Follow the path |goto Undercity 51.86,64.67 < 10 |only if walking
talk Varimathras##2425
turnin An Unholy Alliance##6522 |goto Undercity 56.23,92.18
accept An Unholy Alliance##6521 |goto Undercity 56.23,92.18
step
talk Andrew Brownell##2308
accept Bring the End##3341 |goto Undercity 74.06,33.29
step
Follow the path |goto The Barrens 45.30,89.28 < 20 |only if walking
Follow the path up |goto The Barrens 49.10,94.49
talk Myriam Moonsinger##12866
accept A Host of Evil##6626 |goto The Barrens 49.01,94.94
stickystart "Kill_8_Razorfen_Battleguards"
stickystart "Kill_8_Razorfen_Thronweavers"
stickystart "Kill_8_Death's_Head_Cultists"
step
kill Ambassador Malcin##12865
collect Ambassador Malcin's Head##17009 |q 6521/1 |goto The Barrens 48.52,95.62
You can also find him around: |notinsticky
[48.09,92.47]
[47.78,90.71]
[46.30,90.26]
step
label "Kill_8_Razorfen_Battleguards"
kill 8 Razorfen Battleguard##7873 |q 6626/1 |goto The Barrens 48.59,95.47
You can find more around [48.22,92.41] |notinsticky
step
label "Kill_8_Razorfen_Thronweavers"
kill 8 Razorfen Thornweaver##7874 |q 6626/2 |goto The Barrens 48.14,92.26
step
label "Kill_8_Death's_Head_Cultists"
kill 8 Death's Head Cultist##7872 |q 6626/3 |goto The Barrens 46.68,87.95
You can find more around [48.22,92.41] |notinsticky
step
Follow the path up |goto The Barrens 49.10,94.49
talk Myriam Moonsinger##12866
turnin A Host of Evil##6626 |goto The Barrens 49.01,94.94
step
Enter the Razorfen Downs Dungeon with Your Group |goto Razorfen Downs 0.00,0.00 < 500 |c |q 6521
step
Inside the Razorfen Downs Dungeon:
click Holding Pen
|tip It looks like a large wooden fence on the north side of The Murder Pens.
|tip Follow the path left along the north side of the dungeon to reach the Spiral of Thorns and eventually The Caller's Chamber.
|tip Continue through The Caller's Chamber to reach The Murder Pens and immediately go left.
|tip Be sure to clear each area of enemies as you go.
talk Belnistrasz##8516
|tip Inside the Holding Pen.
accept Scourge of the Downs##3523
step
Inside the Razorfen Downs Dungeon:
talk Belnistrasz##8516
|tip Inside the Holding Pen.
turnin Scourge of the Downs##3523
accept Extinguishing the Idol##3525
|tip This is an escort quest.
|tip Accepting this quest will automatically start the escort after a few seconds.
|tip All group members will need to accept it at the same time to avoid missing the quest.
step
Inside the Razorfen Downs Dungeon:
Follow and protect Belnistrasz
Kill the enemies that attack in waves
kill Plaguemaw the Rotting##7356
Escort Belnistrasz to the Quilboar's Idol |q 3525/1
step
Inside the Razorfen Downs Dungeon:
click Belnistrasz's Brazier
|tip It will be in the room where he was channeling.
turnin Extinguishing the Idol##3525
step
Inside the Razorfen Downs Dungeon:
kill Amnennar the Coldbringer##7358
|tip He is the last boss of the dungeon.
|tip Follow the left path out of the Belnistrasz escort room, then go right in the Spiral of Thorns and jump down.
|tip From here, go west and follow the path as it wraps up and around, eventually reaching Amnennar at the top.
collect Skull of the Coldbringer##10420 |q 3341/1
step
Leave the Razorfen Downs Dungeon
Click Here to Continue |confirm |q 6521
step
talk Andrew Brownell##2308
turnin Bring the End##3341 |goto Undercity 74.06,33.29
step
Follow the path |goto Undercity 51.86,64.67 < 10 |only if walking
talk Varimathras##2425
turnin An Unholy Alliance##6521 |goto Undercity 56.23,92.18
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Uldaman Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Uldaman',
    description = 'This guide will walk you through completing the Uldaman Quests.',
  },
  [[
step
Reach Level 37 |ding 37
|tip Use the Leveling guides to accomplish this.
step
talk Patrick Garrett##5651
accept Reclaimed Treasure##2342 |goto Undercity 62.32,48.62
step
talk Rigglefuzz##2817
accept Power Stones##2418 |goto Badlands 42.38,52.95
step
talk Theldurin the Lost##2785
accept Solution to Doom##709 |goto Badlands 51.39,76.86
step
Enter the building |goto Badlands 3.83,46.98 < 5 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
accept Badlands Reagent Run##2258 |goto Badlands 2.43,46.08
stickystart "Collect_Buzzard_Gizzards"
stickystart "Collect_Crag_Coyote_Fangs"
step
Follow the path |goto Badlands 9.18,43.23 < 15 |only if walking
kill Lesser Rock Elemental##2735+
collect 5 Rock Elemental Shard##7848 |q 2258/3 |goto Badlands 19.46,43.02
You can find more around [13.98,39.71]
step
label "Collect_Buzzard_Gizzards"
Kill Buzzard enemies around this area
collect 5 Buzzard Gizzard##7847 |q 2258/1 |goto Badlands 16.82,59.84
You can find more around: |notinsticky
[12.45,69.20]
[17.43,48.90]
[25.63,62.04]
[33.36,59.65]
[28.67,72.03]
[24.51,74.45]
[18.90,77.65]
step
label "Collect_Crag_Coyote_Fangs"
Kill Coyote enemies around this area
collect 10 Crag Coyote Fang##7846 |q 2258/2 |goto Badlands 23.75,55.12
You can find more around: |notinsticky
[14.18,65.72]
[31.58,65.16]
step
Enter the building |goto Badlands 3.83,46.98 < 5 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Badlands Reagent Run##2258 |goto Badlands 2.43,46.08
accept Uldaman Reagent Run##2202 |goto Badlands 2.43,46.08
step
Kill Shadowforge enemies around this area
|tip You may need help with this.
|tip You can find more inside the cave.
collect Shattered Necklace##7666 |goto Badlands 45.10,12.01 |q 2283 |future
step
talk Dran Droffers##6986
|tip Inside the building.
accept Necklace Recovery##2283 |goto Orgrimmar 59.48,36.59
step
talk Dran Droffers##6986
|tip Inside the building.
turnin Necklace Recovery##2283 |goto Orgrimmar 59.48,36.59
accept Necklace Recovery, Take 2##2284 |goto Orgrimmar 59.48,36.59
step
Follow the path |goto Badlands/0 51.90,15.69 < 20 |only if walking
Enter the cave |goto Badlands/0 54.50,57.78 < 7 |walk
Follow the path |goto Badlands/0 54.16,57.78
Continue following the path |goto Badlands/0 53.97,57.75 < 7 |only if walking
Continue following the path |goto Badlands/0 54.08,58.00 < 7 |only if walking
click Ancient Chest##126260
|tip Inside the cave.
collect Tablet of Ryun'eh##4631 |q 709/1 |goto Badlands/0 54.14,58.24
step
Follow the path |goto Badlands/0 54.09,58.01 < 7 |only if walking
Continue following the path |goto Badlands/0 53.78,57.96 < 7 |only if walking
click Garrett Family Chest##124388
|tip Inside the cave.
collect Garrett Family Treasure##8026 |q 2342/1 |goto Badlands/0 53.78,58.23
step
Enter the Uldaman Dungeon with Your Group |goto Uldaman/0 0.00,0.00 < 500 |q 2318 |future
step
Inside the Uldaman Dungeon:
talk Remains of a Paladin##6912
|tip After entering the dungeon, follow the corridor on the right into the big open room, then continue to the second corridor on the right.
|tip He's laying on the ground surrounded by enemies.
turnin Necklace Recovery, Take 2##2284
accept Translating the Journal##2318
step
Leave the Uldaman Dungeon
Click Here to Continue |confirm |q 2318
step
Enter the building |goto Badlands 3.83,46.98 < 5 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Translating the Journal##2318 |goto Badlands 2.43,46.07
accept Translating the Journal##2338 |goto Badlands 2.43,46.07
step
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Translating the Journal##2338
Watch the Dialogue
accept Find the Gems and Power Source##2339 |goto Badlands 2.43,46.07
step
Enter the Uldaman Dungeon with Your Group |goto Uldaman/0 0.00,0.00 < 500 |c |q 2341 |future
stickystart "Collect_12_Magenta_Cap_Cluster"
stickystart "Collect_8_Dentrium_Power_Stone"
stickystart "Collect_8_An'Alleum_Power_Stone"
step
Inside the Uldaman Dungeon:
click Conspicuous Urn##125477
|tip It looks like a tall brown urn in the southeastern side of Dig Two, to the right of the large double doors.
|tip Follow the path through the first corridor to enter the big open room, then follow the left corridor and enter the room to the south to reach Dig Two.
collect Shattered Necklace Topaz##7671 |q 2339/3
step
Inside the Uldaman Dungeon:
click Shadowforge Cache##113757
|tip Looting this will cause a few enemies to spawn.
|tip It looks like a stone chest on the northwestern side of Dig Three.
|tip Continue west through the dungeon, pass through the Map Chamber and then continue north.
|tip Proceed north and follow the western-most path.
|tip After passing through the caves with bats you'll reach a more open area with a pit of non-elite scorpions.
|tip Go left here and immediately left again to reach Dig Three.
collect Shattered Necklace Ruby##7669 |q 2339/1
step
Inside the Uldaman Dungeon:
kill Grimlok##4854
|tip Leave Dig Three and go left, then continue left to the end of The Stone Vault.
collect Shattered Necklace Sapphire##7670 |q 2339/2
step
Inside the Uldaman Dungeon:
click Altar of The Keepers
|tip Leave The Stone Vault and follow the left path to reach the Hall of the Crafters.
kill Archaedas##2748
|tip He is the last boss of the dungeon.
collect Shattered Necklace Power Source##7672 |q 2339/4
step
Inside the Uldaman Dungeon:
click The Discs of Norgannon
|tip In the room behind Archaedas.
|tip You will only be able to access this room after Archadas is defeated.
accept The Platinum Discs##2278
|only if level >=40
step
Inside the Uldaman Dungeon:
talk Lore Keeper of Norgannon##7172
Select _"Who are the Earthen?"_
Learn What Lore That the Stone Watcher Has to Offer |q 2278/1
|only if level >=40
step
Inside the Uldaman Dungeon:
click The Discs of Norgannon
turnin The Platinum Discs##2278
accept The Platinum Discs##2280
|only if level >=40
step
label "Collect_12_Magenta_Cap_Cluster"
Inside the Uldaman Dungeon: |notinsticky
click Magenta Cap Clusters##126049+
|tip They look like a pair of mushrooms along the walls of the cave areas.
|tip You can find more outside of the dungeon.
collect 12 Magenta Cap Cluster##8047 |q 2202/1
step
label "Collect_8_Dentrium_Power_Stone"
Inside the Uldaman Dungeon: |notinsticky
Kill Shadowforge enemies around this area
|tip You can find more outside of the dungeon.
collect 8 Dentrium Power Stone##8009 |q 2418/1
step
label "Collect_8_An'Alleum_Power_Stone"
Inside the Uldaman Dungeon: |notinsticky
Kill Shadowforge enemies around this area
|tip You can find more outside of the dungeon.
collect 8 An'Alleum Power Stone##8052 |q 2418/2
step
Leave the Uldaman Dungeon
Click Here to Continue |confirm |q 2341 |future
step
Enter the building |goto Badlands 3.83,46.98 < 5 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Uldaman Reagent Run##2202 |goto Badlands 2.43,46.08
turnin Find the Gems and Power Source##2339 |goto Badlands 2.43,46.07
Watch the Dialogue
accept Deliver the Gems##2340 |goto Badlands 2.43,46.07
step
talk Rigglefuzz##2817
turnin Power Stones##2418 |goto Badlands 42.38,52.95
step
talk Theldurin the Lost##2785
turnin Solution to Doom##709 |goto Badlands 51.39,76.86
step
talk Patrick Garrett##5651
turnin Reclaimed Treasure##2342 |goto Undercity 62.32,48.62
step
Enter the building |goto Orgrimmar 59.01,37.57 < 5
talk Dran Droffers##6986
|tip Inside the building.
turnin Deliver the Gems##2340 |goto Orgrimmar 59.50,36.60
accept Necklace Recovery, Take 3##2341 |goto Orgrimmar 59.50,36.60
step
Enter the building |goto Thunder Bluff 36.34,50.53 < 10 |walk
talk Sage Truthseeker##3978
|tip Inside the building.
turnin The Platinum Discs##2280 |goto Thunder Bluff 34.40,46.91
|only if level >=40
step
Enter the building |goto Badlands 3.83,46.98 < 5 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Necklace Recovery, Take 3##2341 |goto Badlands 2.43,46.07
]]
)
ZygorGuidesViewer:RegisterGuide(
  "Dungeon Guides\\Zul'Farrak Quests",
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. "Zul'Farrak",
    description = "This guide will walk you through completing the Zul'Farrak Quests.",
  },
  [[
step
Reach Level 40 |ding 40
|tip Use the Leveling guides to accomplish this.
step
click Venom Bottle
|tip It looks like a green battle laying against a crate.
accept Venom Bottles##2933 |goto The Hinterlands 23.51,58.78
step
Run up the stairs |goto The Hinterlands 47.74,66.60 < 10 |only if walking
kill Qiaga the Keeper##7996
|tip At the top of the Altar of Zul.
|tip You may need help with this.
collect Sacred Mallet##9241 |goto The Hinterlands 48.66,68.25 |q 2770 |future
step
Run up the stairs |goto The Hinterlands 66.67,66.75 < 10 |only if walking
Continue up the stairs |goto The Hinterlands 67.91,69.04 < 10 |only if walking
Follow the path |goto The Hinterlands 67.78,70.69 < 10 |only if walking
Run up the stairs |goto The Hinterlands 65.07,68.93 < 10 |only if walking
Follow the path |goto The Hinterlands 63.77,70.68 < 10 |only if walking
Continue following the path |goto The Hinterlands 65.39,72.99 < 10 |q 2770 |future
step
Run up the stairs |goto The Hinterlands 67.16,73.31 < 10 |only if walking
Follow the path |goto The Hinterlands 64.54,74.99 < 10 |only if walking
Run up the stairs |goto The Hinterlands 62.17,71.38 < 10 |only if walking
Continue up the stairs |goto The Hinterlands 59.92,70.16 < 10 |only if walking
Follow the path |goto The Hinterlands 59.16,74.13 < 10 |q 2770 |future
step
use the Sacred Mallet##9241
collect Mallet of Zul'Farrak##9240 |goto The Hinterlands 59.64,77.90 |q 2770 |future
step
Enter the building |goto Hillsbrad Foothills 61.50,19.43 < 5 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Venom Bottles##2933 |goto Hillsbrad Foothills 61.44,19.06
accept Undamaged Venom Sac##2934 |goto Hillsbrad Foothills 61.44,19.06
step
Follow the path up |goto Hillsbrad Foothills 72.92,23.67 < 10 |only if walking
Continue following the path |goto Hillsbrad Foothills 74.43,23.22 < 10 |only if walking
Continue following the path |goto Hillsbrad Foothills 84.10,32.70 < 15 |only if walking
Enter the Hinterlands |goto Hillsbrad Foothills 90.05,24.99 < 20 |q 2934 |future
step
Follow the path |goto The Hinterlands 35.74,64.01 < 10 |only if walking
kill Witherbark Broodguard##2686
collect 1 Undamaged Venom Sac##9322 |q 2934/1 |goto The Hinterlands 34.78,69.45
step
Enter the building |goto Hillsbrad Foothills 61.50,19.43 < 5 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Undamaged Venom Sac##2934 |goto Hillsbrad Foothills 61.44,19.06
accept Consult Master Gadrin##2935 |goto Hillsbrad Foothills 61.44,19.06
step
talk Master Gadrin##3188
turnin Consult Master Gadrin##2935 |goto Durotar 55.95,74.72
accept The Spider God##2936 |goto Durotar 55.95,74.72
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
accept Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
step
talk Wizzle Brassbolts##4453
accept Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.98,22.36
step
kill Vale Screecher##5307
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612
collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
step
talk Chief Engineer Bilgewhizzle##7407
accept Divino-matic Rod##2768 |goto Tanaris 52.46,28.51
step
talk Tran'rek##7876
accept Scarab Shells##2865 |goto Tanaris 51.57,26.76
step
talk Trenton Lighthammer##7804
accept Troll Temper##3042 |goto Tanaris 51.42,28.75
step
Enter the Zul'Farrak Dungeon with Your Group |goto Zul'Farrak/0 0.00,0.00 < 500 |c |q 2936
stickystart "Collect_5_Uncracked_Scarab_Shell"
stickystart "Collect_20_Troll_Temper"
step
Inside the Zul'Farrak Dungeon:
click Tablet of Theka##142715
|tip It looks like a large stone tablet laying up against a wall in the center of the scarab room.
Choose _Continue reading..._
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
Find the Spider God's Name |q 2936/1
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip He is the second boss of the dungeon.
collect First Mosh'aru Tablet##10660 |q 3527/1
step
Inside the Zul'Farrak Dungeon:
Kill the enemies that attack in waves
|tip Continue following the path west and run up the stairs to reach the top of the large pyramid.
|tip Kill the Sandfury Executioner and then open the cages to start the event.
kill Sergeant Bly##7604
|tip He will be killable after you release them from captivity and clear the temple event.
collect Divino-matic Rod##8548 |q 2768/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Follow the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
collect Tiara of the Deep##9234 |q 2846/1
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Inside the Zul'Farrak Dungeon:
use the Mallet of Zul'Farrak##9240
|tip Clear the room.
|tip Use it near the gong atop the pool of water.
kill Gahz'rilla##7273
collect Gahz'rilla's Electrified Scale##8707 |q 2770/1
step
label "Collect_5_Uncracked_Scarab_Shell"
Inside the Zul'Farrak Dungeon: |notinsticky
kill Scarab##7269
|tip They are found all around the instance, but mostly in the scarab room with Theka the Martyr.
collect 5 Uncracked Scarab Shell##9238 |q 2865/1
step
label "Collect_20_Troll_Temper"
Inside the Zul'Farrak Dungeon: |notinsticky
Kill enemies around this area
|tip These drop from troll enemies inside of Zul'Farrak.
|tip It will likely take multiple runs to complete.
collect 20 Troll Temper##9523 |q 3042/1
step
Leave the Zul'Farak Dungeon
Click Here to Continue |confirm |q 2936
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
step
talk Chief Engineer Bilgewhizzle##7407
turnin Divino-matic Rod##2768 |goto Tanaris 52.46,28.51
step
talk Tran'rek##7876
turnin Scarab Shells##2865 |goto Tanaris 51.57,26.76
step
talk Trenton Lighthammer##7804
turnin Troll Temper##3042 |goto Tanaris 51.42,28.75
step
talk Wizzle Brassbolts##4453
turnin Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
turnin Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
step
talk Master Gadrin##3188
turnin The Spider God##2936 |goto Durotar 55.95,74.72
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Maraudon Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Maraudon',
    description = 'This guide will walk you through completing the Maraudon Quests.',
  },
  [[
step
Reach Level 45 |ding 45
|tip Use the Leveling guides to accomplish this.
step
Run up the stairs |goto Orgrimmar 38.30,81.47 < 7 |only if walking
Enter the building |goto Orgrimmar 38.75,83.33 < 7 |walk
talk Uthel'nay##7311
|tip Inside the building.
accept Shadowshard Fragments##7068 |goto Orgrimmar 39.16,86.26
step
Run up the stairs |goto Desolace 23.61,70.08 < 7 |only if walking
talk Vark Battlescar##11823
|tip Upstairs inside the building.
accept Vyletongue Corruption##7029 |goto Desolace 23.22,70.32
step
talk Selendra##13699
accept Corruption of Earth and Seed##7064 |goto Desolace 26.86,77.67
step
talk Willow##13656
|tip Inside the building.
accept Twisted Evils##7028 |goto Desolace 62.19,39.63
step
talk Centuar Pariah##13717
|tip He walks around this area.
accept The Pariah's Instructions##7067 |goto Desolace 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
step
Run up the stairs |goto Desolace 29.84,62.54 < 7 |only if walking
click Stone Door
Enter the building |goto Desolace/0 29.11,62.56 < 10 |c |q 7066 |future
step
kill The Nameless Prophet##13718
|tip He spawns in multiple locations outside of the Maraudon dungeon.
|tip You may need help with this.
collect Amulet of Spirits##17757 |goto Desolace/0 38.31,57.96 |q 7067
You may also find him at: |notinsticky
[38.32,58.18]
[38.20,58.05]
[38.39,57.96]
step
Run down the stairs |goto Desolace/0 38.25,57.99 < 7 |only if walking
Follow the path |goto Desolace/0 38.43,57.85 < 10 |only if walking
Continue following the path |goto Desolace/0 38.64,57.71 < 7 |only if walking
Continue following the path |goto Desolace/0 38.53,57.55 < 10 |only if walking
Continue following the path |goto Desolace/0 38.48,57.34 < 7 |q 7067
step
Continue following the path |goto Desolace 29.44,57.22 < 7 |only if walking
Jump down here |goto Desolace 28.80,56.17 < 7 |q 7067
step
Enter the cave |goto Desolace 28.71,56.20 < 5 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Gelk.
|tip He walks around this area.
kill Gelk##13741
collect Gem of the Second Khan##17762 |goto Desolace 38.47,57.29 |q 7067
step
Follow the path |goto Desolace 38.46,57.08 < 5 |only if walking
Kill Shadowshard enemies around this area
collect 10 Shadowshard Fragment##17756 |q 7068/1 |goto Desolace 28.32,54.47
step
Follow the path |goto Desolace 29.58,55.54 < 7 |only if walking
Continue following the path |goto Desolace 29.46,57.25 < 7 |only if walking |q 7067
step
Jump down here |goto Desolace 38.53,57.60 < 5 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Kolk.
kill Kolk##13742
collect Gem of the First Khan##17761 |goto Desolace 38.50,57.72 |q 7067
step
Follow the path |goto Desolace 38.60,57.95 < 10 |only if walking
Continue following the path |goto Desolace 38.44,58.13 < 7 |only if walking
Continue following the path |goto Desolace 38.49,58.22 < 7 |q 7067
step
talk Cavindra##13697
accept Legend of Maraudon##7044	|goto Desolace 38.76,58.13
step
Follow the path |goto Desolace 38.82,58.31 < 7 |only if walking
use Coated Cerulean Vial##17693
collect Filled Cerulean Vial##17696 |q 7029/2 |goto Desolace 38.92,58.36
step
Follow the path |goto Desolace 39.08,58.01 < 10 |only if walking
Continue following the path |goto Desolace 39.35,58.03 < 7 |only if walking
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Magra.
|tip He walks around this area.
kill Magra##13740
collect Gem of the Third Khan##17763 |goto Desolace 39.20,57.68 |q 7067
step
Follow the path |goto Desolace 39.21,57.84 < 10 |only if walking
Continue following the path |goto Desolace 39.35,58.04 < 10 |only if walking
Enter the Maraudon (Foulspore Cavern - Orange) Dungeon with your Group |goto Desolace 39.27,58.19 < 5 |q 7046 |future
stickystart "Collect_Gem_of_the_Fifth_Khan"
stickystart "Heal_Vylestem_Vines"
stickystart "Collect_15_Theradric_Crystal_Carving"
step
Inside the Maraudon Dungeon:
kill Noxxion##13282
|tip It is the first boss on the Orange side of Maraudon.
|tip After entering the dungeon, run up the stairs and follow the path to the right whenever possible.
collect Celebrian Rod##17702 |q 7044/2
step
label "Collect_Gem_of_the_Fifth_Khan"
Inside the Maraudon Dungeon: |notinsticky
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Veng.
|tip He walks around the Orange side of Maraudon.
kill Veng##13738
collect Gem of the Fifth Khan##17765 |q 7067
step
label "Heal_Vylestem_Vines"
Inside the Maraudon Dungeon: |notinsticky
use the Filled Cerulean Vial##17696
|tip While in the Foulspore Cavern, or Orange side of Maraudon, there will be tree stumps with a red top.
|tip You won't be able to target them.
|tip They have five leaves growing out of them.
|tip Use the Filled Cerulean Vial near them and Noxxious Scion will spawn.
kill Noxxious Scion##13696+
Heal 8 Vylestem Vines |q 7029/1
step
Leave the Maraudon - Orange Dungeon
Click Here to Continue |confirm |q 7067
stickystop "Collect_15_Theradric_Crystal_Carving"
step
click Stone Door
Enter the building |goto Desolace/0 29.11,62.56 < 5 |walk
Jump down here |goto Desolace/0 28.06,64.21 < 7 |c |walk
step
Jump down here |goto Desolace/0 27.84,62.83 < 10
Follow the path |goto Desolace/0 29.32,61.24 < 7 |walk
Follow the path |goto Desolace/0 29.67,58.58 < 7 |walk
Enter the Maraudon - Purple Dungeon with Your Group |goto Maraudon/0 0.00,0.00 < 500 |c |q 7066 |future
stickystart "Collect_15_Theradric_Crystal_Carving"
step
Inside the Maraudon Dungeon:
use the Amulet of Spirits##17757
|tip Use it on the Spirit of Maraudos.
|tip He walks around The Wicked Grotto in the Purple side of Maraudon.
kill Maraudos##13739
collect Gem of the Fourth Khan##17764 |q 7067
step
Inside the Maraudon Dungeon:
use the Gem of the Fifth Khan##17765
collect Amulet of Union##17758 |q 7067/1
step
Inside the Maraudon Dungeon:
kill Lord Vyletongue##12236
|tip He is Purple side of Maraudon.
|tip Proceed through The Wicked Grotto and enter the Vyletongue Seat.
|tip He is in a small room on the northern side.
collect Celebrian Diamond##17703 |q 7044/1
step
Inside the Maraudon Dungeon:
kill Celebras the Cursed##12225
|tip He is Purple side of Maraudon.
|tip Continue through the Vyletongue Seat and into the Poison Falls.
|tip Once you reach the Poison Falls, continue working your way west and then south, where he will be on a small island.
talk Celebras the Redeemed##13716
|tip He will appear after you kill Celebras the Cursed.
turnin Legend of Maraudon##7044
accept The Scepter of Celebras##7046
step
Inside the Maraudon Dungeon:
Follow Celebras the Redeemed
|tip Click the stone he leads you to.
click Incantations of Celebras
Watch the Dialogue
Create the Scepter of Celebras |q 7046/1
step
Inside the Maraudon Dungeon:
talk Celebras the Redeemed##13716
turnin The Scepter of Celebras##7046
step
Inside the Maraudon Dungeon:
kill Princess Theradras##12201 |q 7064/1
|tip She is the last boss on the Purple side of Maraudon.
|tip Continue going south and jump down the waterfall.
|tip Continue following the path south through the dungeon to reach Zaetar's Grave.
|tip Princess Theradras is found at the end of Zaetar's Grave.
step
Inside the Maraudon Dungeon:
talk Zaetar's Spirit##12238
|tip He will appear at the center of the room once Princess Theradras is killed.
accept Seed of Life##7066
step
label "Collect_15_Theradric_Crystal_Carving"
Inside the Maraudon Dungeon: |notinsticky
Kill enemies around this area
|tip These drop from enemies inside of Maraudon.
collect 15 Theradric Crystal Carving##17684 |q 7028/1
step
Leave the Maraudon Dungeon
Click Here to Continue |confirm |q 7066
step
Run up the stairs |goto Orgrimmar 38.30,81.47 < 7 |only if walking
Enter the building |goto Orgrimmar 38.75,83.33 < 7 |walk
talk Uthel'nay##7311
turnin Shadowshard Fragments##7068 |goto Orgrimmar 39.16,86.26
step
Run up the stairs |goto Desolace 23.61,70.08 < 7 |only if walking
talk Vark Battlescar##11823
|tip Upstairs inside the building.
turnin Vyletongue Corruption##7029 |goto Desolace 23.22,70.32
step
talk Selendra##13699
turnin Corruption of Earth and Seed##7064 |goto Desolace 26.86,77.67
step
talk Centuar Pariah##13717
|tip He walks around this area.
turnin The Pariah's Instructions##7067 |goto Desolace 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
step
talk Willow##13656
|tip Inside the building.
turnin Twisted Evils##7028 |goto Desolace 62.19,39.63
step
talk Keeper Remulos##11832
turnin Seed of Life##7066 |goto Moonglade 36.18,41.82
]]
)
ZygorGuidesViewer:RegisterGuide(
  "Dungeon Guides\\Temple of Atal'Hakkar Quests",
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. "The Temple of Atal'Hakkar",
    description = "This guide will walk you through completing the Temple of Atal'Hakkar Quests.",
    hideif = ZGV.IsClassicSoD,
  },
  [[
step
Reach Level 47 |ding 47
|tip Use the Leveling guides to accomplish this.
step
talk Witch Doctor Uzer'i##8115
accept The Sunken Temple##3380 |goto Feralas 74.42,43.36
step
talk Marvon Rivetseeker##7771
turnin The Sunken Temple##3380 |goto Tanaris 52.71,45.92
accept The Stone Circle##3444 |goto Tanaris 52.71,45.92
step
click Marvon's Chest
collect Stone Circle##10556 |q 3444/1 |goto The Barrens 62.50,38.54
step
talk Marvon Rivetseeker##7771
turnin The Stone Circle##3444 |goto Tanaris 52.71,45.92
accept Into the Depths##3446 |goto Tanaris 52.71,45.92
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.98,22.36
step
kill Vale Screecher##5307+
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612+
Collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
step
Enter the Zul'Farrak Dungeon with Your Group |goto Zul'Farrak/0 0.00,0.00 < 500 |c |q 3527 |future
|tip You may need help with this quest.
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
|tip He is the second boss of the dungeon.
|tip You may need help with this.
collect First Mosh'aru Tablet##10660 |q 3527/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Follow the path west to reach an open room with a large pyramid on the western side.
|tip Continue following the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
|tip You may need help with this.
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Leave the Zul'Farrak Dungeon
Click Here to Continue |confirm |q 3527
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Zul'Farrak/0 66.98,22.36
accept The Ancient Egg##4787 |goto Zul'Farrak/0 66.98,22.36
step
Enter the building |goto Swamp of Sorrows 47.23,54.36 < 7 |walk
talk Fel'zerul##1443
|tip Inside the building.
accept Pool of Tears##1424 |goto Swamp of Sorrows 47.94,54.79
step
use an Elixir of Water Breathing##5996
click Atal'ai Artifact##30856+
|tip They look like various small objects on the ground underwater around this area.
|tip You can find them all around this large lake.
collect 10 Atal'ai Artifact##6175 |q 1424/1 |goto Swamp of Sorrows 67.14,58.70
step
Enter the building |goto Swamp of Sorrows 47.23,54.36 < 7 |walk
talk Fel'zerul##1443
|tip Inside the building.
turnin Pool of Tears##1424 |goto Swamp of Sorrows 47.94,54.79
accept The Atal'ai Exile##1429 |goto Swamp of Sorrows 47.94,54.79
step
Follow the path |goto The Hinterlands 35.78,64.12 < 15 |only if walking
Run up the stairs |goto The Hinterlands 33.09,73.80 < 15 |only if walking
Jump down here |goto The Hinterlands 33.11,75.53 < 7 |only if walking
talk Atal'ai Exile##5598
turnin The Atal'ai Exile##1429 |goto The Hinterlands 33.75,75.22
accept Return to Fel'Zerul##1444 |goto The Hinterlands 33.75,75.22
accept Jammal'an the Prophet##1446 |goto The Hinterlands 33.75,75.22
step
Follow the path |goto The Hinterlands 35.79,64.07 < 15 |only if walking
Run up the stairs |goto The Hinterlands 66.70,66.71 < 8 |only if walking
Follow the path |goto The Hinterlands 66.63,68.83 < 10 |only if walking
Run up the stairs |goto The Hinterlands 67.93,69.12 < 10 |only if walking
Follow the path |goto The Hinterlands 67.78,70.73 < 10 |q 4787
step
Run up the stairs |goto The Hinterlands 65.08,68.94 < 8 |only if walking
Follow the path |goto The Hinterlands 63.69,70.44 < 10 |only if walking
Continue following the path |goto The Hinterlands 65.38,72.92 < 10 |only if walking
Run up the stairs |goto The Hinterlands 67.14,73.37 < 8 |only if walking
Follow the path |goto The Hinterlands 67.15,75.46 < 10 |q 4787
step
Follow the path |goto The Hinterlands 64.52,74.83 < 10 |only if walking
Run up the stairs |goto The Hinterlands 62.16,71.38 < 10 |only if walking
Continue up the stairs |goto The Hinterlands 59.96,70.17 < 10 |only if walking
Follow the path |goto The Hinterlands 58.68,70.28 < 10 |only if walking
Continue following the path |goto The Hinterlands 59.15,74.30 < 10 |q 4787
step
Enter the cave |goto The Hinterlands 58.61,79.19 < 10 |walk
Follow the path down |goto The Hinterlands 58.26,82.31 < 10 |walk
Follow the path up |goto The Hinterlands 54.81,83.42 < 10 |walk
click Ancient Egg##175889
|tip Inside the cave.
|tip You may need help with this.
collect Ancient Egg##12402 |q 4787/1 |goto The Hinterlands 57.52,86.78
step
talk Yeh'kinya##8579
turnin The Ancient Egg##4787 |goto Tanaris 66.98,22.36
accept The God Hakkar##3528 |goto Tanaris 66.98,22.36
step
Enter the building |goto Swamp of Sorrows 47.23,54.36 < 7 |walk
talk Fel'zerul##1443
|tip Inside the building.
turnin Return to Fel'Zerul##1444 |goto Swamp of Sorrows 47.94,54.79
accept The Temple of Atal'Hakkar##1445 |goto Swamp of Sorrows 47.94,54.79
step
Follow the path up |goto Un'Goro Crater 45.72,13.08 < 10 |only if walking
talk Larion##9118
accept Larion and Muigin##4145 |goto Un'Goro Crater 45.53,8.71
stickystart "Kill_Bloodpetal_Thresher"
stickystart "Kill_Bloodpetal_Lashers"
stickystart "Kill_Bloodpetal_Trappers"
step
kill 5 Bloodpetal Flayer##6510 |q 4145/3 |goto Un'Goro Crater 57.09,16.45
You can find more around [56.74,24.61]
step
label "Kill_Bloodpetal_Thresher"
kill 5 Bloodpetal Thresher##6511 |q 4145/4 |goto Un'Goro Crater 56.59,34.46
You can find more around: |notinsticky
[61.68,36.93]
[69.81,29.80]
step
label "Kill_Bloodpetal_Lashers"
kill 5 Bloodpetal Lasher##6509 |q 4145/1 |goto Un'Goro Crater 69.81,29.80
You can find more around: |notinsticky
[61.68,36.93]
[56.59,34.46]
step
label "Kill_Bloodpetal_Trappers"
kill 5 Bloodpetal Trapper##6512 |q 4145/2 |goto Un'Goro Crater 39.85,53.54
You can find more around [34.49,37.63]
step
Follow the path up |goto Un'Goro Crater 45.72,13.08 < 10 |only if walking
talk Larion##9118
turnin Larion and Muigin##4145 |goto Un'Goro Crater 45.53,8.71
accept Marvon's Workshop##4147 |goto Un'Goro Crater 45.53,8.71
step
Enter the building |goto The Barrens 62.52,38.57 < 7 |walk
talk Liv Rizzlefix##8496
|tip Inside the building.
turnin Marvon's Workshop##4147 |goto The Barrens 62.45,38.73
accept Zapper Fuel##4146 |goto The Barrens 62.45,38.73
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 3528
stickystart "Collect_20_Fetish_of_Hakkar"
stickystart "Collect_5_Atal'ai_Haze"
step
Inside the Temple of Atal'Hakkar Dungeon:
|tip After entering the dungeon follow the left path and then go down the stairs to reach the Hall of Serpents.
|tip Run around the outside ring and clear each of the small inside rooms.
click Atal'ai Statue##148830+
|tip Click the serpent statues in the inside rooms in this order:
|tip South, north, southwest, southeast, northwest then finally the northeast altar.
|tip Atal'alarion will appear after clicking the statues in the correct order; jump down and kill him.
kill Atal'alarion##8580
click Altar of Hakkar
|tip At the top of the stairs in The Pit of Refuse.
turnin Into the Depths##3446
accept Secret of the Circle##3447
step
Inside the Temple of Atal'Hakkar Dungeon:
click Idol of Hakkar##148838
|tip In the center of the room in The Pit of Refuse.
turnin Secret of the Circle##3447
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Jammal'an the Prophet##5710
|tip Follow the path up and out of The Pit of Refuse.
|tip Follow the left path again and go up three large sets of stairs, immediately go right to follow a short hallway and reach the upper level of The Pit of Sacrifice.
|tip There should be an elite enemy named Hukku channeling a spell on this balcony; kill him and then go back down the short hallway, but turn right and continue up the stairs to the Hall of the Cursed.
|tip Proceed around this room, following each set of stairs up or down to find additional balconies with named enemies channeling a spell.
|tip There are a total of six named elites that need to be killed in order to remove that barrier blocking the way to Jammal'an the Prophet.
|tip After all six balconies have been cleared, drop down from the final balcony into The Pit of Sacrifice.
|tip Follow the southeast path to reach Jammal'an the Prophet.
collect Head of Jammal'an##6212 |q 1446/1
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Shade of Eranikus##5709
|tip Return to the main central room in The Pit of Sacrifice and follow the southern path.
collect Essence of Eranikus##10454 |q 3373 |future
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Eranikus##10454
accept The Essence of Eranikus##3373
step
Inside the Temple of Atal'Hakkar Dungeon:
click Essence Font##148512
|tip It looks like a stone table in the northeastern corner of the room with the Shade of Eranikus.
turnin The Essence of Eranikus##3373
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Egg of Hakkar##10465
|tip Use it next to the skeleton laying on the ground in the Sanctum of the Fallen God.
|tip Return to the main central room in The Pit of Sacrifice and follow the southwestern path to reach the Sanctum of the Fallen God.
Kill the enemies that spawn in waves
kill Hakkari Bloodkeeper##8438+
collect Hakkari Blood##10460 |n
|tip Use it to put out the braziers in each corner of the room.
click Eternal Flame##148420+
kill Avatar of Hakkar##8443
|tip It will spawn after the four Eternal Flames have been extinguished.
collect Essence of Hakkar##10663 |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Hakkar##10663
Fill the Egg of Hakkar |q 3528/1
step
label "Collect_20_Fetish_of_Hakkar"
Inside the Temple of Atal'Hakkar Dungeon: |notinsticky
Kill Atal'ai enemies around this area
collect 20 Fetish of Hakkar##6181 |q 1445/1
|tip These can also drop outside of the instance.
step
label "Collect_5_Atal'ai_Haze"
Inside the Temple of Atal'Hakkar Dungeon: |notinsticky
Kill enemies around this area
|tip Murk Worms, Deep Lurkers and Saturated Oozes specifically drop the quest item.
collect 5 Atal'ai Haze##11318 |q 4146/1
step
Leave the Temple of Atal'Hakkar
Click Here to Continue |confirm |q 3528
step
Enter the building |goto Swamp of Sorrows 47.23,54.36 < 7 |walk
talk Fel'zerul##1443
|tip Inside the building.
turnin The Temple of Atal'Hakkar##1445 |goto Swamp of Sorrows 47.94,54.79
step
Follow the path |goto The Hinterlands 35.78,64.12 < 15 |only if walking
Run up the stairs |goto The Hinterlands 33.09,73.80 < 15 |only if walking
Jump down here |goto The Hinterlands 33.11,75.53 < 7 |only if walking
talk Atal'ai Exile##5598
turnin Jammal'an the Prophet##1446 |goto The Hinterlands 33.75,75.22
step
talk Yeh'kinya##8579
turnin The God Hakkar##3528 |goto Tanaris 66.98,22.36
step
talk Larion##9118
turnin Zapper Fuel##4146 |goto Un'Goro Crater 45.54,8.71
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Blackrock Depths Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Blackrock Depths',
    description = 'This guide will walk you through completing the Blackrock Depths Quests.',
  },
  [[
step
Reach Level 52 |ding 52
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Tanaris 66.99,23.87 < 5 |walk
talk Yorba Screwspigot##9706
|tip Inside the building.
accept Yuka Screwspigot##4324 |goto Tanaris 67.04,24.01
step
Follow the path |goto Undercity 52.81,77.39 < 10 |walk
Follow the path down |goto Undercity 51.16,80.26 < 8 |walk
talk Apothecary Zinge##5204
accept Vivian Lagrave##4133 |goto Undercity 50.14,67.99
step
talk Shadowmage Vivian Lagrave##9078
turnin Vivian Lagrave##4133 |goto Badlands 2.89,47.76
accept Lost Thunderbrew Recipe##4134 |goto Badlands 2.89,47.76
step
talk Thunderheart##9084
|tip He will sometimes go out on patrol.
|tip Do not click him until he stops near this spot or you might attack him.
|tip Wait for him to reapper in Kargath.
accept Disharmony of Flame##3906 |goto Badlands 3.32,48.27
step
click WANTED##164867
accept KILL ON SIGHT: Dark Iron Dwarves##4081 |goto Badlands 3.77,47.47
step
talk Hierophant Theodora Mulvadania##9079
accept The Rise of the Machines##4061 |goto Badlands 3.03,47.81
step
talk Kalaran Windblade##8479
accept Divine Retribution##3441 |goto Searing Gorge 39.05,38.99
step
talk Kalaran Windblade##8479
Select _"Tell me what drives this vengeance?"_
Listen to Kalaran's Story |q 3441/1 |goto Searing Gorge 39.05,38.99
step
talk Kalaran Windblade##8479
turnin Divine Retribution##3441 |goto Searing Gorge 39.05,38.99
accept The Flawless Flame##3442 |goto Searing Gorge 39.05,38.99
stickystart "Collect_Hearts_Of_Flame"
step
Kill enemies around this area
|tip Only Tempered War Golems, Heavy War Golems, and Magma Elementals will drop the quest item.
collect 4 Golem Oil##10511 |q 3442/2 |goto Searing Gorge 48.59,38.32
You can find more around: |notinsticky
[43.27,39.20]
[36.56,40.58]
[32.26,46.19]
[25.43,53.98]
[31.52,72.23]
step
label "Collect_Hearts_Of_Flame"
Kill Elemental enemies around this area
|tip Heavy War Golems will not drop this quest item.
collect 4 Heart of Flame##10509 |q 3442/1 |goto Searing Gorge 42.58,38.58
You can find more around: |notinsticky
[39.22,41.58]
[31.18,43.67]
[25.43,53.98]
[31.52,72.23]
step
talk Kalaran Windblade##8479
turnin The Flawless Flame##3442 |goto Searing Gorge 39.05,38.99
accept Forging the Shaft##3443 |goto Searing Gorge 39.05,38.99
step
Jump down here |goto Searing Gorge 49.32,43.74 < 15 |only if walking
Enter the cave |goto Searing Gorge 49.58,45.49 < 10 |walk
Cross the bridge |goto Searing Gorge 47.78,42.60 < 15 |walk
Follow the path |goto Searing Gorge 42.02,35.57 < 15 |walk
Kill Dark Iron enemies around this area
|tip Inside the cave, all throughout.
|tip You can also find some outside, near Thorium Point.
collect 8 Thorium Plated Dagger##10551 |q 3443/1 |goto Searing Gorge 43.38,34.94
step
Follow the path |goto Searing Gorge 50.59,38.45 < 15 |walk
Continue following the path |goto Searing Gorge 47.21,42.94 < 15 |walk
Leave the cave |goto Searing Gorge 47.53,46.72 < 15 |walk
Jump down carefully here |goto Searing Gorge 48.98,46.87 < 10 |only if walking
Follow the path up |goto Searing Gorge 58.08,41.10 < 15 |only if walking
Follow the path |goto Searing Gorge 65.38,34.61 < 30 |only if walking
talk Kalaran Windblade##8479
turnin Forging the Shaft##3443 |goto Searing Gorge 39.06,38.99
accept The Flame's Casing##3452 |goto Searing Gorge 39.06,38.99
step
Follow the path down |goto Searing Gorge 34.86,25.83 < 20 |only if walking
Follow the path |goto Searing Gorge 31.32,33.57 < 30 |only if walking
Kill Twilight enemies around this area
|tip They are elite enemies, you will likely need help with this.
|tip Try to find someone to help you.
|tip Doing this quest unlocks more quests that give easy experience, so it's important to get it done.
collect Symbol of Ragnaros##10552 |q 3452/1 |goto Searing Gorge 24.62,35.13
|tip This has a low drop rate.
You can find more inside the cave at [21.89,36.36]
You can find more up the path that starts at [24.23,33.12]
step
Follow the path |goto Searing Gorge 26.48,34.56 < 30 |only if walking
talk Kalaran Windblade##8479
turnin The Flame's Casing##3452 |goto Searing Gorge 39.05,38.99
accept The Torch of Retribution##3453 |goto Searing Gorge 39.05,38.99
step
Watch the dialogue
Witness the Creation of the Torch |q 3453/1 |goto Searing Gorge 39.05,38.99
step
talk Kalaran Windblade##8479
turnin The Torch of Retribution##3453 |goto Searing Gorge 39.05,38.99
accept The Torch of Retribution##3454 |goto Searing Gorge 39.05,38.99
step
click Torch of Retribution##149047
turnin The Torch of Retribution##3454 |goto Searing Gorge 39.06,39.06
step
talk Kalaran Windblade##8479
accept Squire Maltrake##3462 |goto Searing Gorge 39.05,39.00
step
talk Squire Maltrake##8509
turnin Squire Maltrake##3462 |goto Searing Gorge 39.16,38.99
accept Set Them Ablaze!##3463 |goto Searing Gorge 39.16,38.99
step
Follow the path |goto Searing Gorge 33.70,49.71 < 30 |only if walking
Run up the ramp |goto Searing Gorge 33.50,53.64 < 15 |only if walking
click Sentry Brazier##149032
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Northern Tower Ablaze |q 3463/4 |goto Searing Gorge 33.31,54.49
step
Run up the ramp |goto Searing Gorge 35.92,59.85 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Western Tower Ablaze |q 3463/1 |goto Searing Gorge 35.67,60.68
step
Follow the path |goto Searing Gorge 35.00,72.13 < 30 |only if walking
Continue following the path |goto Searing Gorge 43.33,72.09 < 30 |only if walking
Run up the ramp |goto Searing Gorge 44.10,61.85 < 15 |only if walking
click Sentry Brazier##149030
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Southern Tower Ablaze |q 3463/2 |goto Searing Gorge 44.03,60.91
step
Cross the hanging bridge |goto Searing Gorge 52.48,57.95 < 15 |only if walking
Run up the ramp |goto Searing Gorge 50.19,55.61 < 15 |only if walking
click Sentry Brazier##149031
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Eastern Tower Ablaze |q 3463/3 |goto Searing Gorge 50.06,54.74
step
Follow the path |goto Searing Gorge 67.99,50.25 < 30 |only if walking
Continue following the path |goto Searing Gorge 66.79,34.56 < 30 |only if walking
talk Squire Maltrake##8509
turnin Set Them Ablaze!##3463 |goto Searing Gorge 39.17,39.00
step
Watch the dialogue
click Hoard of the Black Dragonflight##149502
accept Trinkets...##3481 |goto Searing Gorge 38.86,38.99
step
click Hoard of the Black Dragonflight##149502
turnin Trinkets...##3481 |goto Searing Gorge 38.86,38.99
|tip Save the Hoard of the Black Dragonflight for later.
step
Kill enemies around this area
collect 10 Fractured Elemental Shard##11266 |q 4061/1 |goto Burning Steppes 62.44,40.48
You can find more around [69.20,37.33]
step
talk Maxwort Uberglint##9536
accept The Heart of the Mountain##4123 |goto Burning Steppes 65.15,23.91
step
Enter the cave |goto Burning Steppes 65.65,22.68 < 7 |walk
talk Yuka Screwspigot##9544
|tip Inside the cave.
turnin Yuka Screwspigot##4324 |goto Burning Steppes 66.06,21.95
accept Ribbly Screwspigot##4136 |goto Burning Steppes 66.06,21.95
step
Enter the cave |goto Burning Steppes 94.43,31.86 < 7 |walk
talk Cyrus Therepentous##9459
|tip Inside the cave.
accept A Taste of Flame##4022 |goto Burning Steppes 95.07,31.56
step
use the Hoard of the Black Dragonflight##10569
collect Black Dragonflight Molt##10575 |q 4022/1
step
talk Cyrus Therepentous##9459
|tip Inside the cave.
turnin A Taste of Flame##4022 |goto Burning Steppes 95.07,31.56
accept A Taste of Flame##4024 |goto Burning Steppes 95.07,31.56
step
talk Hierophant Theodora Mulvadania##9079
turnin The Rise of the Machines##4061 |goto Badlands 3.03,47.81
accept The Rise of the Machines##4062 |goto Badlands 3.03,47.81
step
talk Lotwil Veriatus##2921
turnin The Rise of the Machines##4062 |goto Badlands 25.95,44.87
accept The Rise of the Machines##4063 |goto Badlands 25.95,44.87
step
Enter Blackrock Mountain |goto Searing Gorge/0 34.80,85.37 < 7 |walk
Jump into the lava |complete isdead |goto Searing Gorge/0 34.62,95.45 |q 3801 |future
|tip You will need to be dead to talk to the next quest giver.
step
Enter Blackrock Mountain |goto Searing Gorge/0 34.80,85.37 < 7 |walk |zombiewalk
Jump into the lava |goto Searing Gorge/0 34.62,95.45 < 7 |only if walking |zombiewalk
Run up the chain |goto Searing Gorge/0 33.53,96.61 < 5 |only if walking |zombiewalk
Enter the building |goto Searing Gorge/0 36.06,98.76 < 5 |only if walking |zombiewalk
talk Franclorn Forgewright##8888
|tip You must be dead to talk to him.
accept Dark Iron Legacy##3801 |goto Searing Gorge/0 35.50,100.38 |zombiewalk
step
talk Franclorn Forgewright##8888
|tip You must be dead to talk to him.
turnin Dark Iron Legacy##3801 |goto Searing Gorge/0 35.50,100.38 |zombiewalk
accept Dark Iron Legacy##3802 |goto Searing Gorge/0 35.50,100.38 |zombiewalk
step
Run down the chain |goto Searing Gorge/0 34.30,98.02 < 5 |only if walking
Enter the building |goto Searing Gorge/0 32.54,94.96 < 5 |walk
kill Overmaster Pyron##9026 |q 3906/1 |goto Searing Gorge/0 26.36,77.69
|tip He patrols around this area.
|tip You may need help with this.
step
Enter the Blackrock Depths Dungeon with Your Group |goto Blackrock Depths/0 0.00,0.00 < 500 |q 4123
stickystart "Collect_Dark_Keeper_Key"
stickystart "Kill_15_Anvilrage_Guardsman"
stickystart "Kill_10_Anvilrage_Warden"
stickystart "Kill_5_Anvilrage_Footman"
stickystart "Collect_10_Intact_Elemental_Core"
step
Inside the Blackrock Depths Dungeon:
kill Fineous Darkvire##9056
|tip After entering the dungeon, proceed east through the Detention Block and then turn left after reaching the Halls of the Law to start the Ring of the Law event.
|tip Complete the event and then exit through the west gate to enter the Eastern Garrison, immediately take a sharp right and go up the stairs to reach the upper level of the arena.
|tip Follow the path around the arena and go down the ramp on the other side, go left and across the bridge to The Domicile.
|tip Continue down the ramps in The Domicile to enter Shadowforge City, take the second door on the right to enter the Hall of Crafting.
|tip Fight down to the lower level of the Hall of Crafting.
|tip Fineous walks around this area.
collect Ironfel##10999 |q 3802/1
step
Inside the Blackrock Depths Dungeon:
click Monument of Franclorn Forgewright##164689
|tip Retrace your steps back through the Hall of Crafting, Shadowforge City and The Domicile to cross the bridge and reach the Shrine of Thaurissan.
|tip Continue straight until you reach the deadend with the Monument of Franclorn Forgewright sitting against the far wall.
turnin Dark Iron Legacy##3802
step
Inside the Blackrock Depths Dungeon:
kill Bael'Gar##9016
|tip Turn around and cross the bridge in Shadowforge City to once again reach The Domicile.
|tip Follow the same path as before to reach the Hall of Crafting where you killed Fineous Darkvire.
|tip Continue down through the Hall of Crafting's lower level to reach the boss Lord Incendius.
|tip Defeat him and keep going to reach the Dark Iron Highway.
|tip Bael'Gar is at the very end of the Dark Iron Highway.
use the Altered Black Dragonflight Molt##11231
|tip Use it on Bael'Gars corpse.
collect Encased Fiery Essence##11230 |q 4024/1
step
Inside the Blackrock Depths Dungeon:
kill Golem Lord Argelmach##8983
|tip Run back down the Dark Iron Highway, take the first right and unlock the gate on your left.
|tip Unlock the first door on your left to enter East Garrison.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison, then go right and down the ramp to reach The Manufactory and Golem Lord Argelmach.
collect Head of Argelmach##11268 |q 4063/1
step
Inside the Blackrock Depths Dungeon:
talk Mistress Nagmara##9500
|tip Turn around to leave The Manufactory, but go left instead and follow the path to reach The Grim Guzzler.
|tip She walks around the Grim Guzzler.
accept The Love Potion##4201
step
Inside the Blackrock Depths Dungeon:
talk Ribbly Screwspigot##9543
|tip He's at the bottom level of the Grim Guzzler.
Select _"Your family says hello, Ribbly. And they want your head!"_
kill Ribbly Screwspigot##9543
collect Ribbly's Head##11313 |q 4136/1
step
Inside the Blackrock Depths Dungeon:
click Thunderbrew Lager Keg##164911+
|tip They look like wooden kegs sitting in a side room in the lower section of The Grim Guzzler.
|tip Destroy all three kegs to spawn Hurley Blackbreath.
kill Hurley Blackbreath##9537
collect Lost Thunderbrew Recipe##11312 |q 4134/1
step
label "Collect_10_Intact_Elemental_Core"
Inside the Blackrock Depths Dungeon: |notinsticky
Kill enemies around this area
|tip Specifically, Golem and Construct enemies throughout the dungeon.
collect 10 Intact Elemental Core##11269 |q 4063/2
step
label "Collect_Dark_Keeper_Key"
Inside the Blackrock Depths Dungeon: |notinsticky
Kill enemies around this area
collect 12 Relic Coffer Key##11078 |q 4123 |future
step
label "Kill_15_Anvilrage_Guardsman"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 15 Anvilrage Guardsman##8891 |q 4081/1
step
label "Kill_10_Anvilrage_Warden"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 10 Anvilrage Warden##8890 |q 4081/2
step
label "Kill_5_Anvilrage_Footman"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 5 Anvilrage Footman##8892 |q 4081/3
step
Inside the Blackrock Depths Dungeon:
click Relic Coffer Door
|tip Open all 12 of them inside of the Black Vault after clearing the room.
|tip Proceed back through The Domicile to reach the Shadowforge City, then take the first door on the right to enter The Black Vault.
kill Watchman Doomgrip##9476
|tip He will spawn once all 12 Relic Coffer Doors have been opened.
click Heart of the Mountain##165554
|tip It looks like a small red crystal sitting on a purple pillow against the wall underneath the Dark Coffer.
collect The Heart of the Mountain##11309 |q 4123/1
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4123
step
talk Maxwort Uberglint##9536
turnin The Heart of the Mountain##4123 |goto Burning Steppes 65.15,23.91
step
Enter the cave |goto Burning Steppes 65.65,22.68 < 7 |walk
talk Yuka Screwspigot##9544
|tip Inside the cave.
turnin Ribbly Screwspigot##4136 |goto Burning Steppes 66.06,21.95
step
Enter the cave |goto Burning Steppes 94.43,31.86 < 7 |walk
talk Cyrus Therepentous##9459
|tip Inside the cave.
turnin A Taste of Flame##4024 |goto Burning Steppes 95.07,31.56
step
collect 4 Gromsblood##8846 |q 4201/1
|tip These are gathered with the Herbalism Profession.
|tip Load the "Gromsblood Farming Guide" to accomplish this.
|tip You can also buy these from the Auction House.
step
Kill Cliff enemies around this area
|tip These are elite.
|tip You may need help with this.
collect 10 Giant Silver Vein##11405 |q 4201/2 |goto Azshara 44.81,85.43
You Can Find More At These Locations:
[48.72,87.54]
[52.63,85.45]
[58.25,89.50]
[60.45,89.81]
[59.12,83.27]
[52.13,78.62]
step
Follow the path up |goto Un'Goro Crater 31.19,51.48 < 10 |only if walking
use Nagmara's Vial##11412
|tip You must be in the water.
collect Nagmara's Filled Vial##11413 |q 4201/3 |goto Un'Goro Crater 31.99,50.01
step
talk Thunderheart##9084
|tip He will sometimes go out on patrol.
|tip Do not click him until he stops near this spot or you might attack him.
|tip Wait for him to reapper in Kargath.
turnin Disharmony of Flame##3906 |goto Badlands 3.32,48.27
accept Disharmony of Fire##3907 |goto Badlands 3.32,48.27
step
talk Shadowmage Vivian Lagrave##9078
turnin Lost Thunderbrew Recipe##4134 |goto Badlands 2.89,47.76
step
talk Warlord Goretooth##9077
|tip At the top of the tower.
turnin KILL ON SIGHT: Dark Iron Dwarves##4081 |goto Badlands 5.83,47.52
step
click KILL ON SIGHT##164868
accept KILL ON SIGHT: High Ranking Dark Iron Officials##4082 |goto Badlands 3.97,46.76
step
talk Lotwil Veriatus##2921
turnin The Rise of the Machines##4063 |goto Badlands 25.95,44.87
step
Continue down and run down the chain |goto Badlands 34.86,99.20 < 5 |walk
Enter the building |goto Badlands 32.55,94.94 < 5 |walk
Follow the path |goto Badlands 26.88,83.87 < 30 |walk
Enter the Blackrock Depths Dungeon with Your Group |goto Blackrock Depths/0 0.00,0.00 < 500 |c |q 4082
stickystart "Kill_10_Anvilrage_Medic"
stickystart "Kill_10_Anvilrage_Soldier"
stickystart "Kill_10_Anvilrage_Officer"
step
Inside the Blackrock Depths Dungeon:
kill Lord Incendius##9017 |q 3907/1
|tip After entering the dungeon, go left through the Shadowforge Gate and head north to reach the Dark Iron Highway.
|tip Continue east through the Dark Iron Highway to reach the Shadowforge City and Lord Incendius.
step
Inside the Blackrock Depths Dungeon:
kill Lord Incendius##9017
collect Tablet of Kurniya##11126 |q 3907/2
step
Inside the Blackrock Depths Dungeon:
talk Mistress Nagmara##9500
|tip She walks around The Grim Guzzler.
|tip Go back through the Dark Iron Highway and go left to enter the Detention Block.
|tip Go through the Shadowforge Gate and then through the East Garrison Door.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison, then go right and down the ramp to reach The Manufactory.
|tip Take another right and follow the path to reach The Grim Guzzler.
turnin The Love Potion##4201
step
label "Kill_10_Anvilrage_Medic"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 10 Anvilrage Medic##8894 |q 4082/1
step
label "Kill_10_Anvilrage_Soldier"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 10 Anvilrage Soldier##8893 |q 4082/2
step
label "Kill_10_Anvilrage_Officer"
Inside the Blackrock Depths Dungeon: |notinsticky
kill 10 Anvilrage Officer##8895 |q 4082/3
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4082
step
talk Thunderheart##9084
|tip He will sometimes go out on patrol.
|tip Do not click him until he stops near this spot or you might attack him.
|tip Wait for him to reapper in Kargath.
turnin Disharmony of Fire##3907 |goto Badlands 3.33,48.28
step
talk Galamav the Marksman##9081
|tip At the top of the tower.
accept Commander Gor'shak##3981 |goto Badlands 5.95,47.75
step
talk Warlord Goretooth##9077
|tip At the top of the tower.
turnin KILL ON SIGHT: High Ranking Dark Iron Officials##4082 |goto Badlands 5.83,47.52
step
Run down the chain |goto Searing Gorge/0 37.25,94.39 < 5 |walk
Enter the building |goto Searing Gorge/0 35.91,100.22 < 7 |c
step
Continue down and run down the chain |goto Searing Gorge/0 34.86,99.20 < 5 |walk
Enter the building |goto Searing Gorge/0 32.55,94.94 < 5 |walk
Follow the path |goto Searing Gorge/0 26.88,83.87 < 30 |walk
Enter the Blackrock Depths Dungeon with Your Group |goto Blackrock Depths/0 0.00,0.00 < 500 |c |q 4001 |future
step
Inside the Blackrock Depths Dungeon:
kill High Interrogator Gerstahn##9018
|tip After entering the dungeon, go straight into the Detention Block and then take the first right.
|tip Follow this path around until you can go left into a room at the back of this long hallway.
collect Prison Cell Key##11140 |q 3981 |future
step
Inside the Blackrock Depths Dungeon:
click Cell Door
|tip Leave the room with High Interrogator Gerstahn and continue left through the tunnel.
|tip While in the tunnel, open the first interactable Cell Door on the left.
talk Commander Gor'shak##9020
turnin Commander Gor'shak##3981
accept What Is Going On?##3982
|tip Clear the enemies around the cell before accepting this quest.
step
Inside the Blackrock Depths Dungeon:
Kill the enemies that attack in waves
|tip There will be two waves of enemies.
|tip Make sure Commander Gor'shak doesn't die.
Survive the Onslaught |q 3982/1
step
Inside the Blackrock Depths Dungeon:
talk Commander Gor'shak##9020
turnin What Is Going On?##3982
accept What Is Going On?##4001
step
Inside the Blackrock Depths Dungeon:
click Cell Door
|tip Exit the cell and cross the hallway.
|tip Open the first cell door on the left.
talk Kharan Mighthammer##9021
Select _"I need to know where the princess are, Kharan!"_
Gather Information from Kharan |q 4001/1
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4001
step
Enter the building |goto Orgrimmar 40.09,36.93 < 8 |walk
talk Thrall##4949
|tip Inside the building.
turnin What Is Going On?##4001 |goto Orgrimmar 31.77,37.82
accept The Eastern Kingdom##4002 |goto Orgrimmar 31.77,37.82
step
talk Thrall##4949
|tip Inside the building.
turnin The Eastern Kingdom##4002 |goto Orgrimmar 31.77,37.82
accept The Royal Rescue##4003 |goto Orgrimmar 31.77,37.82
step
Run down the chain |goto Searing Gorge/0 37.25,94.39 < 5 |walk
Enter the building |goto Searing Gorge/0 35.91,100.22 < 7 |c
step
Continue down and run down the chain |goto Searing Gorge/0 34.86,99.20 < 5 |walk
Enter the building |goto Searing Gorge/0 32.55,94.94 < 5 |walk
Follow the path |goto Searing Gorge/0 26.88,83.87 < 30 |walk
Enter the Blackrock Depths Dungeon with Your Group |goto Blackrock Depths/0 0.00,0.00 < 500 |c |q 4004 |future
step
Inside the Blackrock Depths Dungeon:
kill Emperor Dagran Thaurissan##9019
|tip Don't kill Princess Moira Bronzebeard during the encounter.
|tip Interrupt her heals otherwise the encounter will be complicated.
|tip You will not be able to turn in the quest if you kill her.
|tip After entering the dungeon, go left through the two Shadowforge Gates and then through the East Garrison Door.
|tip In the lower part of this room, click the Shadowforge Lock, then run up the two sets of stairs and follow the hallway on the left just before the third set of stairs.
|tip Follow the path through the hallway to reach the West Garrison, then go right and down the ramp to reach The Manufactory.
|tip Take another right and follow the path to reach The Grim Guzzler.
|tip Buy Dark Iron Ale from Plugger Spazzring and give it to Private Rocknot to get through The Grim Guzzler.
|tip Leave The Grim Guzzler through the northeast door that is now open, go through the door on your first left and down the ramps.
|tip Go left again through the Chamber of Enchantment and north through the Mold Foundry.
|tip Continue through the Summoners' Tomb to reach The Lyceum.
|tip Kill the Shadowforge Flame Keepers in the center of the room and use the Shadowforge Torches that they drop to light the Shadowforge Braziers in the east side of the room in order to proceed.
|tip Proceed east through The Iron Hall, defeat Magmus and then finally enter The Imperial Seat.
Slay Emperor Dagran Thaurissan |q 4003/1
step
Inside the Blackrock Depths Dungeon:
talk Princess Moira Bronzebeard##8929
|tip She is in the room where Emperor Dagran Thaurissan was.
turnin The Royal Rescue##4003
accept The Princess Saved?##4004
step
Leave the Blackrock Depths Dungeon
Click Here to Continue |confirm |q 4004
step
Enter the building |goto Orgrimmar 40.09,36.93 < 8 |walk
talk Thrall##4949
|tip Inside the building.
turnin The Princess Saved?##4004 |goto Orgrimmar 31.77,37.82
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Dire Maul East Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Dire Maul',
    description = 'This guide will walk you through completing the Dire Maul East Quests.',
  },
  [[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Moonglade 51.46,41.44 < 7 |walk
talk Rabine Saturna##11801
|tip Inside the building.
accept A Reliquary of Purity##5527 |goto Moonglade 51.69,45.10
step
click Dusty Reliquary##179565
|tip Inside the building.
collect Reliquary of Purity##22201 |goto Silithus 63.23,55.36 |q 5527
step
Enter the building |goto Moonglade 51.46,41.44 < 7 |walk
talk Rabine Saturna##11801
|tip Inside the building.
turnin A Reliquary of Purity##5527 |goto Moonglade 51.69,45.10
accept Shards of the Felvine##5526 |goto Moonglade 51.69,45.10
step
talk Talo Thornhoof##7776
|tip Inside the building.
accept Lethtendris's Web##7489 |goto Feralas 76.18,43.84
step
talk Azj'Tordin##14355
|tip On top of the platform.
accept Pusillin and the Elder Azj'Tordin##7441 |goto Feralas 76.91,37.35
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
Continue following the path |goto Feralas/0 64.85,30.18 < 7 |only if walking
Enter the Dire Maul - East Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 5526
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the northwest part of the Warpwood Quarter.
Select _"Game? Are you crazy?"_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the southern part of the Warpwood Quarter, near the dungeon entrance.
Select _"Why you little..."_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip He's in the northeastern part of the Warpwood Quarter.
Select _"Mark my words, I will catch you, Imp. And when I do!"_
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip Follow the northeastern path from the Warpwood Quarter to reach The Hidden Reach.
|tip Continue east down the path through The Hidden Reach to find him.
Select _"DIE!"_
|tip He will be in the Hidden Reach, straight through the tunnel.
|tip He will run off after speaking to him.
|tip If you don't do this, he will not be killable later.
Click Here to Continue |confirm |q 7441
step
Inside the Dire Maul East Dungeon:
talk Pusillin##14354
|tip Continue southeast and run up the ramp to the small upper platform.
Select _"Prepare to meet your maker."_
kill Pusillin##14354
collect Book of Incantations##18261 |q 7441/1
collect Crescent Key##18249 |q 7463 |future |only if Mage
step
Inside the Dire Maul East Dungeon:
kill Lethtendris##14327
|tip After killing Pusillin go west up the ramps back the way you came through The Hidden Reach.
|tip After going up the ramps and before reentering the Warpwood Quarter, enter the left room.
|tip Go south in this room and then run up the large ramp to reach the upper level to find Lethtendris.
collect Lethtendris's Web##18426 |q 7489/1
step
Inside the Dire Maul East Dungeon:
kill Zevrim Thornhoof##11490
|tip This boss must be defeated to gain access to the last boss, Alzzin the Wildshaper.
|tip After killing Lethtendris follow the southeastern path down the spiral ramp.
|tip Once in the next room go north and follow the ramp up.
Click Here to Continue |confirm |q 5526
step
Inside the Dire Maul East Dungeon:
|tip After killing Zevrim Thornhoof jump off the west side of the platform.
|tip Follow the path in the southwestern part of the room to reach The Conservatory.
|tip Go north through The Conservatory to find Ironbark the Redeemed.
talk Ironbark the Redeemed##14241
|tip He walks around this area.
Select _"Thank you Ironbark. We are ready for you to open the door."_
Click Here to Continue |confirm |q 5526
step
Inside the Dire Maul East Dungeon:
kill Alzzin the Wildshaper##11492
|tip After talking to Ironbark the Redeemed, continue north through The Conservatory.
click Felvine Shard##179559
|tip It looks like a small glowing red object sitting on the ground next to a twisted vine plant next to the boss.
collect Felvine Shard##18501 |q 5526
step
Inside the Dire Maul East Dungeon:
use the Reliquary of Purity##18539
|tip Use it next to the twisted vine plant next to the boss.
Seal the Reliquary of Purity |q 5526/1
step
Leave the Dire Maul East Dungeon
Click Here to Continue |confirm |q 5526
step
talk Talo Thornhoof##7776
|tip Inside the building.
turnin Lethtendris's Web##7489 |goto Feralas 76.18,43.84
step
talk Azj'Tordin##14355
|tip On top of the platform.
turnin Pusillin and the Elder Azj'Tordin##7441 |goto Feralas 76.91,37.35
step
Enter the building |goto Moonglade 51.46,41.44 < 7 |walk
talk Rabine Saturna##11801
|tip Inside the building.
turnin Shards of the Felvine##5526 |goto Moonglade 51.69,45.10
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Dire Maul West Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Dire Maul',
    description = 'This guide will walk you through completing the Dire Maul West Quests.',
  },
  [[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
Inside the Dire Maul East Dungeon:
kill Pusillin##14354
|tip He is the first boss in the Dire Maul East dungeon.
|tip Use the Dire Maul East dungeon guide to accomplish this.
collect Crescent Key##18249 |q 7462 |future
|tip This item is required to enter Dire Maul West.
|tip If someone else in the group has it you can skip this step.
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 60.32,30.16 < 10 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - West Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7462 |future
step
Inside the Dire Maul West Dungeon:
Clear the First Pylon
|tip Head west a short distance in Capital Gardens and kill the enemies around the large glowing blue pylon.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
Clear the Second Pylon
|tip Pass through the archways in the northwest part of Capital Gardens to enter the Court of the Highborne.
|tip Go through the archway on the northern side of the Court of the Highborne and then go up the ramp.
|tip Proceed east to the pylon.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
talk Shen'dralar Ancient##14358
|tip She is above the platform overseeing Tendris Warpwood.
|tip Head south from the second pylon to reach the Shen'dralar Ancient.
accept The Madness Within##7461
step
Inside the Dire Maul West Dungeon:
Clear the Third Pylon
|tip Follow the path south and west.
|tip Kill the Arcane Aberrations and Mana Remnant.
|tip This pylon must be deactivated in order to fight Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
click Door
|tip The door is behind Tendris Warpwood.
|tip Jump down to the lower level of the Court of the Highborne.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
|tip Follow the path to reach the Prison of Immol'thar.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
kill Immol'thar##11496
|tip Clear the remaining two pylons in this room in order to engage him.
Slay Immol'thar |q 7461/1
step
Inside the Dire Maul West Dungeon:
click Door
|tip Follow the tunnel in the northeastern part of the Prison of Immol'thar.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
Click Here to Continue |confirm |q 7462 |future
step
Inside the Dire Maul West Dungeon:
kill Prince Tortheldrin##11486
|tip Once inside The Athenaeum, jump down.
|tip He is underneath the platform that you are on after entering the room.
Slay Prince Tortheldrin |q 7461/2
step
Inside the Dire Maul West Dungeon:
talk Shen'dralar Ancient##14358
|tip She is above the platform overseeing Tendris Warpwood.
|tip Go back up the ramp in The Athenaeum, and east through the Prison of Immol'thar.
|tip Go up the ramp in the Court of the Highborne, then north and up a second ramp, then follow the path east and south to reach her.
turnin The Madness Within##7461
accept The Treasure of the Shen'dralar##7462
step
Inside the Dire Maul West Dungeon:
click Treasure of the Shen'dralar
|tip It looks like a large stone chest underneath the ramp in The Athenaeum.
|tip Go back through the Prison of Immol'thar and reenter The Athenaeum.
turnin The Treasure of the Shen'dralar##7462
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Dire Maul North Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Dire Maul',
    description = 'This guide will walk you through completing the Dire Maul North Quests.',
  },
  [[
step
Reach Level 56 |ding 56
|tip Use the Leveling guides to accomplish this.
step
collect 4 Bolt of Runecloth##14048 |q 5518 |future
|tip You can have a Tailor make these with 20 Runecloth.
|tip You can also purchase these from the auction house.
step
collect 8 Rugged Leather##8170 |q 5518 |future
|tip Use the Rugged Leather farming guide to accomplish this.
|tip You can also purchase these from the Auction House.
step
talk Borya##3364
|tip Inside the building.
buy 2 Rune Thread##14341 |goto Orgrimmar 63.06,51.41 |q 5518 |future
step
talk Sage Korolusk##14373
|tip He patrols along the road.
accept Elven Legends##7481 |goto Feralas 75.45,43.68
step
Inside the Dire Maul East Dungeon:
kill Pusillin##14354
|tip He is the first boss in the Dire Maul East dungeon.
|tip Use the Dire Maul East dungeon guide to accomplish this.
collect Crescent Key##18249 |q 7481
|tip This item is required to enter Dire Maul West.
|tip If someone else in the group has it you can skip this step.
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 62.49,24.89 < 5 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - North Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7481
step
Inside the Dire Maul North Dungeon:
click Conservatory Door
|tip Jump down into the courtyard.
|tip Once there, head west down a ramp with the Conservatory Door.
|tip Run through the tunnel to reach The Athenaeum.
|tip You will need the Crescent Key from Dire Maul East or a Rogue to open this.
click Skeletal Remains of Kariel Winthalus##179544
|tip On the ground next to an elf and a bookcase in the north part of the room.
Find the Skeletal Remains of Master Kariel Winthalus |q 7481/1
step
Inside the Dire Maul North Dungeon:
click Fengus's Chest##179516
|tip It looks like a brown and black chest in the middle of the courtyard.
|tip Leave The Athenaeum and go back through the long tunnel to return to Dire Maul North.
|tip Head west into the second large open room.
collect Gordok Courtyard Key##18266 |q 7481
step
Inside the Dire Maul North Dungeon:
click Gordok Courtyard Door
|tip It is on the western side of the room.
Click Here to Continue |confirm |q 7481
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip Follow the tunnel to reach the Halls of Destruction.
|tip He is in the northeast corner of the Halls of Destruction.
accept The Gordok Ogre Suit##5518
step
Inside the Dire Maul North Dungeon:
click Ogre Tannin Basket##179499
|tip It is up the ramp just above where Knot Thimblejack is, in the northwest corner of the room.
|tip Only one person in your group will be able to collect this.
collect Ogre Tannin##18240 |q 5518/4
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip He is in the northeast corner of the Halls of Destruction.
turnin The Gordok Ogre Suit##5518
step
Inside the Dire Maul North Dungeon:
Kill Guard enemies around this area
|tip Guard Mol'dar, Slip'kik, Fengus and Captain Kromcrush can drop the key.
|tip The guards can be found in the Halls of Destruction and in each of the large open rooms at the beginning of the dungeon.
|tip Captain Kromcrush is found in Gordok's Seat, which is reached by going through the upper level of the Halls of Destruction.
|tip It also has a small chance to drop from Gordok trash mobs throughout the dungeon.
collect Gordok Shackle Key##18250 |q 5525 |future
step
Inside the Dire Maul North Dungeon:
talk Knot Thimblejack##14338
|tip He is in the northeast corner of the Halls of Destruction.
turnin Free Knot!##7429
step
Inside the Dire Maul North Dungeon:
talk Stomper Kreeg##14322
|tip You will only be able to speak with him after a tribute run.
|tip Use the Dire Maul North Tribute dungeon guide to accomplish this.
accept The Gordok Taste Test##5528
step
Inside the Dire Maul North Dungeon:
talk Captain Kromcrush##14325
|tip To do this, you will need to do a tribute run.
|tip Use the Dire Maul North Tribute dungeon guide to accomplish this.
accept Unfinished Gordok Business##7703
step
Inside the Dire Maul West Dungeon:
click The Prince's Chest##179545
|tip Run back to the start of the instance and enter the Library through the courtyard door.
|tip The chest will be behind where he stands.
collect Gauntlet of Gordok Might##18336 |q 7703/1
step
Inside the Dire Maul North Dungeon:
talk Captain Kromcrush##14325
|tip To do this, you will need to do a tribute run.
|tip You may need to run another Tribute Run to accomplish this.
turnin Unfinished Gordok Business##7703
step
Leave the Dire Maul North Dungeon
Click Here to Continue |confirm |q 7481
step
talk Sage Korolusk##14373
|tip He patrols along the road.
turnin Elven Legends##7481 |goto Feralas 75.45,43.68
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Lower Blackrock Spire Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Lower Blackrock Spire',
    description = 'This guide will walk you through completing the Lower Blackrock Spire Quests.',
  },
  [[
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.98,22.36
step
kill Vale Screecher##5307
|tip These have a low spawn rate.
use Yeh'Kinya's Bramble##10699
|tip Use it on their corpse.
talk Screecher Spirit##8612+
collect 3 Screecher Spirits |q 3520/1 |goto Feralas 58.31,57.70
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.98,22.36
accept The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
step
Enter the Zul'Farrak Dungeon with Your Group |goto Zul'Farrak/0 0.00,0.00 < 555 |c |q 3527
step
Inside the Zul'Farrak Dungeon:
kill Theka the Martyr##7272
|tip He is the second boss of the dungeon.
|tip Follow the path north and then go right when the path splits.
|tip Quickly go left afterwards and then north.
collect First Mosh'aru Tablet##10660 |q 3527/1
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
|tip Continue following the path west to reach the room with a large pyramid on the western side.
|tip Follow the path southeast to reach the large room with a pool in the center.
|tip She walks around this area.
collect Second Mosh'aru Tablet##10661 |q 3527/2
step
Leave the Zul'Farrak Dungeon
Click Here to Continue |confirm |q 3527
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
accept The Ancient Egg##4787 |goto Tanaris 66.98,22.36
step
Follow the path |goto The Hinterlands 35.79,64.07 < 15 |only if walking
Run up the stairs |goto The Hinterlands 66.70,66.71 < 8 |only if walking
Follow the path |goto The Hinterlands 66.63,68.83 < 10 |only if walking
Run up the stairs |goto The Hinterlands 67.93,69.12 < 10 |only if walking
Follow the path |goto The Hinterlands 67.78,70.73 < 10 |q 4787
step
Run up the stairs |goto The Hinterlands 65.08,68.94 < 8 |only if walking
Follow the path |goto The Hinterlands 63.69,70.44 < 10 |only if walking
Continue following the path |goto The Hinterlands 65.38,72.92 < 10 |only if walking
Run up the stairs |goto The Hinterlands 67.14,73.37 < 8 |only if walking
Follow the path |goto The Hinterlands 67.15,75.46 < 10 |q 4787
step
Follow the path |goto The Hinterlands 64.52,74.83 < 10 |only if walking
Run up the stairs |goto The Hinterlands 62.16,71.38 < 10 |only if walking
Continue up the stairs |goto The Hinterlands 59.96,70.17 < 10 |only if walking
Follow the path |goto The Hinterlands 58.68,70.28 < 10 |only if walking
Continue following the path |goto The Hinterlands 59.15,74.30 < 10 |q 4787
step
Enter the cave |goto The Hinterlands 58.61,79.19 < 10 |walk
Follow the path down |goto The Hinterlands 58.26,82.31 < 10 |walk
Follow the path up |goto The Hinterlands 54.81,83.42 < 10 |walk
click Ancient Egg##175889
|tip Inside the cave.
|tip You may need help with this.
collect Ancient Egg##12402 |q 4787/1 |goto The Hinterlands 57.52,86.78
step
talk Yeh'kinya##8579
turnin The Ancient Egg##4787 |goto Tanaris 66.98,22.36
accept The God Hakkar##3528 |goto Tanaris 66.98,22.36
step
Run up the stairs |goto Swamp of Sorrows/0 69.36,56.89 < 7 |walk
Enter the building and swim under the water |goto Swamp of Sorrows/0 70.54,49.78 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 72.69,42.22 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 75.69,45.78 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 78.62,47.47 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 80.22,49.62 < 7 |walk
Follow the path |goto Swamp of Sorrows/0 81.33,42.38 < 7 |walk
Run down the stairs |goto Swamp of Sorrows/0 78.86,40.74 < 7 |walk
Run down the ramp |goto Swamp of Sorrows/0 76.85,38.82 < 7 |walk
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Egg of Hakkar##10465
|tip Use it next to the skeleton laying on the ground in the Sanctum of the Fallen God.
|tip After entering the dungeon, follow the left path and go up three large sets of stairs, immediately go right to follow a short hallway to reach the upper level of The Pit of Sacrifice and jump down.
|tip Follow the southwestern path to reach the Sanctum of the Fallen God.
Kill the enemies that spawn in waves
kill Hakkari Bloodkeeper##8438+
collect Hakkari Blood##10460 |n
|tip Use it to put out the braziers in each corner of the room.
click Eternal Flame##148420+
kill Avatar of Hakkar##8443
|tip It will spawn after the four Eternal Flames have been extinguished.
collect Essence of Hakkar##10663 |q 3528
step
Inside the Temple of Atal'Hakkar Dungeon:
use the Essence of Hakkar##10663
Fill the Egg of Hakkar |q 3528/1
step
Leave the Temple of Atal'Hakkar Dungeon
Click Here to Continue |confirm |q 3528
step
talk Yeh'kinya##8579
turnin The God Hakkar##3528 |goto Tanaris 66.98,22.36
step
talk Prospector Ironboot##10460
accept The Lost Tablets of Mosh'aru##5065 |goto Tanaris 66.89,24.03
step
Follow the path up |goto Eastern Plaguelands 64.37,21.89 < 10 |only if walking
click Fourth Mosh'aru Tablet##175488
collect Fourth Mosh'aru Tablet##12412 |q 5065/2 |goto Eastern Plaguelands 72.67,15.56
step
click Third Mosh'aru Tablet##175487
|tip At the top of the temple.
collect Third Mosh'aru Tablet##12411 |q 5065/1 |goto Eastern Plaguelands 72.35,12.92
step
talk Prospector Ironboot##10460
turnin The Lost Tablets of Mosh'aru##5065 |goto Tanaris 66.89,24.03
accept The Final Tablets##4788 |goto Tanaris 66.89,24.03
step
talk Ragged John##9563
accept Mother's Milk##4866 |goto Burning Steppes 65.01,23.77
step
talk Kibler##10260
|tip Inside the cave.
accept Kibler's Exotic Pets##4729 |goto Burning Steppes 65.88,21.92
accept En-Ay-Es-Tee-Why##4862 |goto Burning Steppes 65.88,21.92
step
talk Warlord Goretooth##9077
|tip He patrols around the area.
Select _"What roles?"_
|tip Click through the dialogue.
collect Warlord Goretooth's Command##12563 |goto Badlands 5.82,47.51 |complete itemcount(12563) == 1 or haveq(4903) or completedq(4903)
step
use Warlord Goretooth's Command##12563
accept Warlord's Command##4903
step
talk Lexlort##9080
accept Operative Bijou##4981 |goto Badlands 5.87,47.64
step
talk Galamav the Marksman##9081
|tip At the top of the tower.
accept The Pack Mistress##4724 |goto Badlands 5.96,47.74
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 4788
stickystart "Important_Blackrock_Documents"
stickystart "Collect_Unadorned_Seal_of_Ascension"
step
Inside the Lower Blackrock Spire Dungeon:
talk Warosh##10799
|tip He patrols around Hordemar City.
|tip After entering the dungeon, follow the path right in the Hall of Blackhand to reach Hordemar City.
accept Urok Doomhowl##4867
step
Inside the Lower Blackrock Spire Dungeon:
click Roughshod Pike##175886
|tip It is standing upright in a wooden weapon rack along the left wall after crossing the second bridge in Hordemar City.
collect Roughshod Pike##12533 |q 4867 |future
|tip If someone else in your group looted it you can skip this step.
step
Inside the Lower Blackrock Spire Dungeon:
talk Bijou##10257
|tip Once you pass the second bridge, jump into the groove in the ground.
|tip Bijou will be down there.
turnin Operative Bijou##4981
accept Bijou's Belongings##4982
step
Inside the Lower Blackrock Spire Dungeon:
click Bijou's Belongings##175334
|tip It looks like a small wooden and metal chest on the lowest level of Hordemar City.
|tip It can be found anywhere from Hordemar to the Skitterweb Tunnels.
collect Bijou's Belongings##12345 |q 4982/1
step
Inside the Lower Blackrock Spire Dungeon:
talk Bijou##10257
|tip She is down in a groove in Hordemar City.
turnin Bijou's Belongings##4982
accept Bijou's Reconnaissance Report##4983
step
label "Collect_Unadorned_Seal_of_Ascension"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
Kill enemies around this area
collect Unadorned Seal of Ascension##12219 |q 4742 |future
step
Inside the Lower Blackrock Spire Dungeon:
talk Vaelan##10296
|tip Run up the ramp near where you entered Lower Blackrock Spire.
|tip A little way closer to the entrance of the dungeon, just before the area where Warosh patrols.
Watch the Dialogue
Select _"As you wish, Vaelan."_
accept Seal of Ascension##4742
step
Inside the Lower Blackrock Spire Dungeon:
click Fifth Mosh'aru Tablet##175949
|tip Cross the two bridges into Hordemar City, then jump down to where Bijou is.
|tip Run down the ramp, then back up directly across.
|tip Run up the stairs to the left.
|tip On the far side of the wall in the room with Shadow Hunter Vosh'gajin.
collect Fifth Mosh'aru Tablet##12740 |q 4788/1
step
Inside the Lower Blackrock Spire Dungeon:
kill War Master Voone##9237 |q 4903/3
|tip Follow the ramps back down to the lowest level of Tazz'Alaor.
|tip Follow the path in the southwestern corner of the room.
step
Inside the Lower Blackrock Spire Dungeon:
kill War Master Voone##9237
|tip Follow the ramps back down to the lowest level of Tazz'Alaor.
|tip Follow the path in the southwestern corner of the room.
collect Gemstone of Smolderthorn##12335 |q 4742/2
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
step
Inside the Lower Blackrock Spire Dungeon:
click Sixth Mosh'aru Tablet##175950
|tip On the wall in the room with War Master Voone.
collect Sixth Mosh'aru Tablet##12741 |q 4788/2
step
Inside the Lower Blackrock Spire Dungeon:
kill Highlord Omokk##9196 |q 4903/2
|tip Return to the upper level of the dungeon again and proceed through Hordemar City.
|tip Continue past the groove in the ground where Bijou is and go west with all of the ogres to reach Mok'Doom.
|tip He is in the back of the room along the north side.
step
Inside the Lower Blackrock Spire Dungeon:
kill Highlord Omokk##9196
|tip Return to the upper level of the dungeon again and proceed through Hordemar City.
|tip Continue past the groove in the ground where Bijou is and go west with all of the ogres to reach Mok'Doom.
|tip He is in the back of the room along the north side.
collect Omokk's Head##12534 |q 4867 |future
collect Gemstone of Spirestone##12336 |q 4742/1
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
stickystart "Destroy_15_Spire_Spider_Eggs"
step
Inside the Lower Blackrock Spire Dungeon:
kill Mother Smolderweb##10596
|tip In the lower part of the dungeon, in the upper level of the Skitterweb Tunnels.
Gain the "Mother's Milk" Buff |havebuff Mother's Milk##16468 |q 4866
|tip If you are able to dispel the poison, make sure you don't.
step
label "Destroy_15_Spire_Spider_Eggs"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
click Spire Spider Egg##175588+
|tip In the upper level of the Skitterweb Tunnels.
collect 15 Spire Spider Egg##12530 |q 4862/1
step
Inside the Lower Blackrock Spire Dungeon:
use Omokk's Head##12534
|tip Use it near the pile of bones up the ramp past Mother Smolderweb.
|tip It looks like a large pile of skulls in Hordemar City.
kill Urok Doomhowl##10584
|tip He will appear after a wave of ogres.
collect Warosh's Mojo##12712 |q 4867/1
step
Inside the Lower Blackrock Spire Dungeon:
use the Empty Worg Pup Cage##12262
|tip Use it on a Bloodaxe Worg Pup.
|tip They are in the same room as Halycon.
|tip After killing Urok Doomhowl, follow the path southwest down the hallway past a room of scorpions on your right.
|tip Go through the doorway, up the stairs and then go right to reach Halycon's Lair.
collect Caged Worg Pup##12263 |q 4729/1
step
Inside the Lower Blackrock Spire Dungeon:
kill Halycon##10220 |q 4724/1
|tip Inside Halycon's Lair.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568 |q 4903/1
|tip Final boss of Lower Blackrock Spire, inside the Chamber of Battle.
|tip After killing Halycon, go up the first small set of stairs on your left in the hallway room before Halycon's Lair.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568
|tip Final boss of Lower Blackrock Spire, inside the Chamber of Battle.
|tip After killing Halycon, go up the first small set of stairs on your left in the hallway room before Halycon's Lair.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
collect Gemstone of Bloodaxe##12337 |q 4742/3
|tip This isn't a 100% drop rate.
|tip You may need to roll against group members to get this.
step
label "Important_Blackrock_Documents"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
click Inconspicuous Documents##175785
|tip They can be found in four spots:
|tip Room with Overlord Wyrmthalak.
|tip In the room with Master Voone.
|tip In the room with Highlord Omokk.
|tip Next to Urok's Tribute Pile.
collect Important Blackrock Documents##12562 |q 4903/4
step
Inside the Lower Blackrock Spire Dungeon:
talk Warosh##10799
|tip He patrols near the start of Lower Blackrock Spire.
turnin Urok Doomhowl##4867
step
Inside the Lower Blackrock Spire Dungeon:
talk Vaelan##10296
|tip Run up the ramp near where you entered Lower Blackrock Spire.
turnin Seal of Ascension##4742
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4788
step
Return to Ragged John |q 4866/1 |goto Burning Steppes 65.01,23.77
step
talk Ragged John##9563
turnin Mother's Milk##4866 |goto Burning Steppes 65.01,23.77
step
talk Kibler##10260
|tip Inside the cave.
turnin Kibler's Exotic Pets##4729 |goto Burning Steppes 65.88,21.92
turnin En-Ay-Es-Tee-Why##4862 |goto Burning Steppes 65.88,21.92
step
talk Warlord Goretooth##9077
|tip He patrols around the area.
turnin Warlord's Command##4903 |goto Badlands 5.82,47.51
step
talk Lexlort##9080
turnin Bijou's Reconnaissance Report##4983 |goto Badlands 5.87,47.64
step
talk Galamav the Marksman##9081
|tip At the top of the tower.
turnin The Pack Mistress##4724 |goto Badlands 5.96,47.74
step
talk Prospector Ironboot##10460
turnin The Final Tablets##4788 |goto Tanaris 66.89,24.03
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Scholomance Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Scholomance',
    description = 'This guide will walk you through completing the Scholomance Quests.',
  },
  [[
step
Reach Level 50 |ding 50
|tip Use the Leveling guides to accomplish this.
step
talk Harbinger Balthazad##10879
|tip He walks around this area in the middle of Undercity.
|tip He's wearing holding a lantern, wearing a white shirt.
|tip He can also be in the ring hallway surrounding the center of Undercity.
accept A Call to Arms: The Plaguelands!##5094 |goto Undercity 63.81,44.07
step
talk Tinkee Steamboil##10267
accept Broodling Essence##4726 |goto Burning Steppes 65.24,24.00
step
use the Draco-Incarcinatrix 900##12284
|tip Use it on Broodling enemies around this area.
|tip They look like small flying dragons.
Kill Broodling enemies around this area
click Broodling Essence##175264+
|tip They look like red floating crystals that appear above their corpses after you kill them.
collect 8 Broodling Essence##12283 |q 4726/1 |goto Burning Steppes 59.26,32.49
You can find more around: |notinsticky
[72.83,28.41]
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
step
Follow the path up |goto Burning Steppes 63.92,29.88 < 15 |only if walking
talk Tinkee Steamboil##10267
turnin Broodling Essence##4726 |goto Burning Steppes 65.23,23.99
accept Felnok Steelspring##4808 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
turnin Felnok Steelspring##4808 |goto Winterspring 61.63,38.61
accept Chillwind Horns##4809 |goto Winterspring 61.63,38.61
step
kill Chillwind Ravager##7449+
|tip They look like chimeras.
|tip They share spawn points with the bears, so kill them too.
collect 8 Uncracked Chillwind Horn##12444 |q 4809/1 |goto Winterspring 59.97,21.54
You can find more around: |notinsticky
[54.75,22.59]
[59.18,18.02]
[60.13,12.28]
[57.99,14.79]
step
talk Felnok Steelspring##10468
turnin Chillwind Horns##4809 |goto Winterspring 61.63,38.61
accept Return to Tinkee##4810 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Return to Tinkee##4810 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
accept Tinkee Steamboil##4907 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Tinkee Steamboil##4907 |goto Burning Steppes 65.23,23.99
accept Egg Freezing##4734 |goto Burning Steppes 65.23,23.99
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 4734
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Don't get too close or they will hatch if they aren't frozen.
Test the Eggscilloscope Prototype |q 4734/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4734
step
talk Tinkee Steamboil##10267
turnin Egg Freezing##4734  |goto Burning Steppes 65.23,23.99
accept Egg Collection##4735 |goto Burning Steppes 65.23,23.99
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 4735
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Use it to freeze the eggs.
|tip Don't get too close or they will hatch if they aren't frozen.
use the Collectronic Module##12287
|tip Use it to collect the eggs.
collect 8 Collected Dragon Egg##12241 |q 4735/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4735
step
talk Tinkee Steamboil##10267
turnin Egg Collection##4735 |goto Burning Steppes 65.23,23.99
accept Leonid Barthalomew##5522 |goto Burning Steppes 65.23,23.99
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Leonid Barthalomew##5522 |goto Eastern Plaguelands 81.73,57.83
accept Betina Bigglezink##5531 |goto Eastern Plaguelands 81.73,57.83
step
talk Betina Bigglezink##11035
turnin Betina Bigglezink##5531 |goto Eastern Plaguelands 81.47,59.65
accept Plagued Hatchlings##5529 |goto Eastern Plaguelands 81.47,59.65
accept Dawn's Gambit##4771 |goto Eastern Plaguelands 81.47,59.65
step
talk High Executor Derrington##10837
turnin A Call to Arms: The Plaguelands!##5094 |goto Tirisfal Glades 83.13,68.93
accept Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
step
click Box of Incendiaries##176092
collect Flame in a Bottle##12814 |goto Tirisfal Glades 83.17,69.09 |q 5096
step
click Command Tent
use the Scourge Banner##12807
Destroy the Command Tent and Plant the Scourge Banner in the Camp |q 5096/1 |goto Western Plaguelands 40.68,51.98
step
talk High Executor Derrington##10837
turnin Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
accept All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.93
step
Cross the bridge |goto Western Plaguelands 49.22,73.14 < 20 |only if walking
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Four |q 5098/4 |goto Western Plaguelands 46.70,71.10
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower One |q 5098/1 |goto Western Plaguelands 40.13,71.52
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Two |q 5098/2 |goto Western Plaguelands 42.44,66.27
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
Mark Tower Three |q 5098/3 |goto Western Plaguelands 44.22,63.37
step
talk High Executor Derrington##10837
turnin All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.93
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk High Executor Derrington##10837
accept Scholomance##838 |goto Tirisfal Glades 83.13,68.93
step
talk Apothecary Dithers##11057
turnin Scholomance##838 |goto Tirisfal Glades 83.28,69.23
accept Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
step
Kill Skeletal enemies around this area
collect 15 Skeletal Fragments##14619 |q 964/1 |goto Western Plaguelands 36.64,57.74
step
talk Apothecary Dithers##11057
turnin Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
accept Mold Rhymes With...##5514 |goto Tirisfal Glades 83.28,69.23
step
talk Krinkle Goodsteel##5411
turnin Mold Rhymes With...##5514 |goto Tanaris 51.46,28.82
|tip Turning this quest in will cost 15 gold.
accept Fire Plume Forged##5802 |goto Tanaris 51.46,28.82
step
collect 2 Thorium Bar##12359 |q 5802 |future
|tip These are made with the Mining Profession.
|tip It requires 1 Thorium Ore each.
|tip You can also purchase these from the Auction House.
step
use the Skeleton Key Mold##14644
|tip You must be in the lake of lava.
collect Unfinished Skeleton Key##14645 |q 5802/1 |goto Un'Goro Crater 48.78,47.19
step
talk Apothecary Dithers##11057
turnin Fire Plume Forged##5801 |goto Tirisfal Glades 83.28,69.24
accept Araj's Scarab##5803 |goto Tirisfal Glades 83.28,69.24
step
kill Araj the Summoner##1852
|tip You may need help with this.
click Araj's Phylactery##177241
collect Araj's Scarab##14610 |q 5803/1 |goto Western Plaguelands 45.27,69.21
step
talk Apothecary Dithers##11057
turnin Araj's Scarab##5803 |goto Tirisfal Glades 83.28,69.23
step
talk High Executor Derrington##10837
accept The Key to Scholomance##5511 |goto Tirisfal Glades 83.13,68.93
step
talk Alexi Barov##11022
accept Barov Family Fortune##5341 |goto Tirisfal Glades 83.05,71.61
step
talk Eva Sarkhoff##11216
Select _"The pleasure is mine madam. Might I ask what it is that you are doing here?"_
|tip Click through the dialogue.
accept Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5341
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
click The Deed to Southshore##176486
|tip It looks like an open white scroll laying on a table in the northeastern part of The Reliquary.
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
collect The Deed to Southshore##13450 |q 5341/3
stickystart "Slay_20_Plagued_Hatchlings"
step
Inside the Scholomance Dungeon:
click The Deed to Tarren Mill##176487
|tip It looks like an open white scroll laying on a table to the left as you enter The Great Ossuary.
|tip Proceed through the Iron Gate on the north side of The Reliquary to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
collect The Deed to Tarren Mill##13451 |q 5341/4
step
label "Slay_20_Plagued_Hatchlings"
Inside the Scholomance Dungeon: |notinsticky
kill 20 Plagued Hatchling##10678 |q 5529/1
|tip They are inside The Great Ossuary.
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip He is downstairs inside The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level.
collect Viewing Room Key##13873 |q 5341
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
use the Dawn's Gambit##12368
|tip Use it in The Viewing Room.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Clear the room before using it.
Place the Dawn's Gmabit |q 4771/1
step
Inside the Scholomance Dungeon:
kill Vectus##10432
|tip In The Viewing Room.
Slay Vectus |q 4771/2
step
Inside the Scholomance Dungeon:
click The Deed to Brill##176484
|tip It looks like an open white scroll sitting on a ledge near the boss on the southwestern part of The Laboratory.
|tip Run back up the stairs to return to The Viewing Room.
|tip Go through the Iron Gate on the south side of The Viewing Room and go down the stairs to reach The Laboratory.
collect The Deed to Brill##13471 |q 5341/1
step
Inside the Scholomance Dungeon:
click Remains of Eva Sarkhoff##176544
|tip They look like a pile of bloodied bones in the northern part of the room with Doctor Theolen Krastinov.
|tip Go through the Iron Gate on the eastern side of The Viewing Room and go down the stairs to reach the Headmaster's Study.
|tip Staying on the upper level of the Headmaster's Study, head around the outside of the room and enter the room across from the entrance on the eastern side.
Burn the Remains of Eva Sarkhoff |q 5382/2
step
Inside the Scholomance Dungeon:
click Remains of Lucien Sarkhoff##176545
|tip They look like a pile of bloodied bones in the southeastern part of the room with Doctor Theolen Krastinov.
Burn the Remains of Lucien Sarkhoff |q 5382/3
step
Inside the Scholomance Dungeon:
kill Doctor Theolen Krastinov##11261 |q 5382/1
step
Inside the Scholomance Dungeon:
click The Deed to Caer Darrow##176485
|tip It looks like an open white scroll laying on a table on the eastern side of the Barov Family Vault.
|tip Return to the Headmaster's Study and jump down, then turn around and enter the eastern room to reach the Barov Family Vault.
collect The Deed to Caer Darrow##13448 |q 5341/2
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5341
step
talk Eva Sarkhoff##11216
turnin Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
accept Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
step
talk Alexi Barov##11022
turnin Barov Family Fortune##5341 |goto Tirisfal Glades 83.05,71.61
step
talk Betina Bigglezink##11035
turnin Plagued Hatchlings##5529 |goto Eastern Plaguelands 81.47,59.66
|tip This will unlock the next quest, which drops from inside Scholomance.
turnin Dawn's Gambit##4771 |goto Eastern Plaguelands 81.47,59.65
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5515
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
kill Jandice Barov##10503
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Proceed into the next main room and then follow the path to the right and go down the stairs.
|tip Jandice is in the northeastern part of this room.
collect Krastinov's Bag of Horrors##13725 |q 5515/1
step
Inside the Scholomance Dungeon:
kill Plagued Hatchling##10678+
collect Healthy Dragon Scale##13920 |q 5582 |future
step
use the Healthy Dragon Scale##13920
accept Healthy Dragon Scale##5582
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5515
step
talk Eva Sarkhoff##11216
turnin Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
accept Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
talk Betina Bigglezink##11035
turnin Healthy Dragon Scale##5582 |goto Eastern Plaguelands 81.47,59.66
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5384
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
click Brazier of the Herald
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Follow the path out to the right to the balcony.
|tip Clear the Chamber of Summoning before doing this.
kill Kirtonos the Herald##10506 |q 5384/1
|tip Drag him back into the gate.
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5384
step
talk Eva Sarkhoff##11216
turnin Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
accept The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
step
click Keepsake of Remembrance##176630
|tip It looks like a small red book at the top of the tower.
|tip If it's not there, check in the fireplaces of nearby buildings.
collect Keepsake of Remembrance##13585 |q 5461/1 |goto Arathi Highlands 17.91,69.41
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
accept The Dying, Ras Frostwhisper##5462 |goto Western Plaguelands 70.57,74.11
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin The Dying, Ras Frostwhisper##5462 |goto Eastern Plaguelands 81.72,57.83
accept Menethil's Gift##5463 |goto Eastern Plaguelands 81.72,57.83
step
click Elders' Square Service Gate |goto Eastern Plaguelands/0 47.88,23.87 < 10 |walk
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the Stratholme - Undead Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5464 |future
step
Inside the Stratholme - Undead Dungeon:
click Menethil's Gift##176631
|tip It looks like a large orange circular symbol on the floor in the room with Baron Rivendare.
|tip Follow the path north and then east through the two Gauntlet Gates to reach the Gauntlet.
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
|tip Continue following the path north and then west to reach Slaughter Square.
|tip Enter the building in Slaughter Square and go downstairs.
turnin Menethil's Gift##5463
accept Menethil's Gift##5464
step
Leave the Stratholme Dungeon
Click Here to Continue |confirm |q 5464
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Menethil's Gift##5464 |goto Eastern Plaguelands 81.72,57.83
accept Soulbound Keepsake##5465 |goto Eastern Plaguelands 81.72,57.83
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin Soulbound Keepsake##5465 |goto Western Plaguelands 70.57,74.11
accept The Lich, Ras Frostwhisper##5466 |goto Western Plaguelands 70.57,74.11
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5466
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level with Rattlegore.
collect Viewing Room Key##13873 |q 5466
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
use the Soulbound Keepsake##13752
|tip Use it on Ras Frostwhisper.
kill Ras Frostwhisper##10508
|tip He is inside The Laboratory.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Continue through the Iron Gate on the south side of The Viewing Room and go down the stairs to reach The Laboratory.
collect Human Head of Ras Frostwhisper##13626 |q 5466/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5466
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Lich, Ras Frostwhisper##5466 |goto Western Plaguelands 70.57,74.11
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Stratholme - Live Side Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Stratholme',
    description = 'This guide will walk you through completing the Stratholme - Live Side Quests.',
  },
  [[
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk Smokey LaRue##11033
accept The Great Fras Siabi##5214 |goto Eastern Plaguelands 80.60,57.99
step
talk Duke Nicholas Zverenhoff##11039
accept The Archivist##5251 |goto Eastern Plaguelands 81.44,59.82
step
talk Caretaker Alen##11038
|tip He walks around this area.
accept The Restless Souls##5281 |goto Eastern Plaguelands 79.73,63.69
step
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5281 |goto Eastern Plaguelands 14.45,33.74
accept The Restless Souls##5282 |goto Eastern Plaguelands 14.45,33.74
step
Enter the cave |goto Eastern Plaguelands 15.37,29.30 < 10 |walk
Follow the path |goto Eastern Plaguelands 13.73,32.07 < 15 |walk
Leave the cave |goto Eastern Plaguelands 7.50,40.68 < 15 |walk
talk Tirion Fordring##1855
|tip He walks around this area.
accept Demon Dogs##5542 |goto Eastern Plaguelands 7.56,43.70
accept Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.56,43.70
accept Carrion Grubbage##5544 |goto Eastern Plaguelands 7.56,43.70
stickystart "Kill_Plaguehound_Runts"
stickystart "Collect_Slabs_Of_Carrion_Worm_Meat"
step
label "Kill_Plaguebats"
kill 30 Plaguebat##8600 |q 5543/1 |goto Eastern Plaguelands 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[35.16,74.32]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
label "Kill_Plaguehound_Runts"
kill 20 Plaguehound Runt##8596 |q 5542/1 |goto Eastern Plaguelands 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
label "Collect_Slabs_Of_Carrion_Worm_Meat"
kill Carrion Grub##8603+
collect 15 Slab of Carrion Worm Meat##13853 |q 5544/1 |goto Eastern Plaguelands 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[35.16,74.32]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
kill 5 Plaguehound##8597 |q 5542/2 |goto Eastern Plaguelands 70.01,68.38
You can find more around: |notinsticky
[76.41,66.59]
[71.11,56.12]
step
label "Kill_Frenzied_Plaguehounds"
kill 5 Frenzied Plaguehound##8598 |q 5542/3 |goto Eastern Plaguelands 62.63,47.95
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Demon Dogs##5542 |goto Eastern Plaguelands 7.56,43.70
turnin Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.56,43.70
turnin Carrion Grubbage##5544 |goto Eastern Plaguelands 7.56,43.70
accept Redemption##5742 |goto Eastern Plaguelands 7.56,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
|tip Type "/sit" into your chat, or press X.
|tip You must be sitting for the dialogue option to appear when you talk to him.
Select _"I am ready to hear your tale, Tirion."_
Listen to Tirion's Tale |q 5742/1 |goto Eastern Plaguelands 7.56,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Redemption##5742 |goto Eastern Plaguelands 7.56,43.70
accept Of Forgotten Memories##5781 |goto Eastern Plaguelands 7.56,43.70
step
click Loose Dirt Mound##177240
|tip Mercutio Filthgorger appears with a group of 3 guards with him.
|tip Try to kite Mercutio Filthgorger away from his guards, so you can fight him by himself.
|tip If you have trouble, try to find someone to help you.
kill Mercutio Filthgorger##11886
collect Taelan's Hammer##14613 |q 5781/1 |goto Eastern Plaguelands 28.31,86.88
step
Follow the path |goto Eastern Plaguelands 11.93,61.49 < 30 |only if walking
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Forgotten Memories##5781 |goto Eastern Plaguelands 7.56,43.70
accept Of Lost Honor##5845 |goto Eastern Plaguelands 7.56,43.70
step
click Symbol of Lost Honor##177264
|tip Underwater.
collect Symbol of Lost Honor##14625 |q 5845/1 |goto Eastern Plaguelands 71.30,33.95
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Lost Honor##5845 |goto Eastern Plaguelands 7.56,43.70
accept Of Love and Family##5846 |goto Eastern Plaguelands 7.56,43.70
step
talk Artist Renfray##11936
|tip Inside the building.
turnin Of Love and Family##5846 |goto Western Plaguelands 65.77,75.37
accept Of Love and Family##5848 |goto Western Plaguelands 65.77,75.37
step
Enter the Stratholme - Live Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5282
stickystart "Free_15_Souls"
step
Inside the Stratholme - Live Dungeon:
click Premius Siabi Tobacco
|tip It looks like a small wooden crate on the ground.
|tip Turn left twice into King's Square.
kill Fras Siabi##11058
collect Siabi's Premium Tobacco##13172 |q 5214/1
step
Inside the Stratholme - Live Dungeon:
click The Bastion Door
|tip Go north and then west once you enter Market Row to reach Crusader's Square.
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
click Malor's Strongbox##176112
|tip Enter The Hall of Lights, go down the hall and enter the small room on the left.
|tip In the same room as Malor the Zealous.
|tip It looks like a small toolbox in the corner of the room.
collect Medallion of Faith##12845 |q 5122 |future
step
Inside the Stratholme - Live Dungeon:
click Hall of High Command
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
|tip Go across the hall from The Hall of Lights to enter The Scarlet Bastion.
kill Archivist Galford##10811
|tip He is near the end of The Scarlet Bastion across from Grand Crusader Dathrohan.
Slay Archivist Galford |q 5251/1
step
Inside the Stratholme - Live Dungeon:
click Unfinished Painting##177287
|tip In the same room as Archivist Galford.
collect Of Love and Family##14679 |q 5848/1
step
Inside the Stratholme - Live Dungeon:
click Scarlet Archive##176245
|tip It looks like a small brown book on the table in the room where Archivist Galford is.
Burn the Archive |q 5251/2
step
label "Free_15_Souls"
Inside the Stratholme - Live Dungeon:
Equip Egan's Blaster
|tip It should be in your inventory.
use Egan's Blaster##13289
|tip Use it on Spectral Citizens.
|tip This will cause Restless Spirits to spawn.
|tip Use Egan's Blaster on the Restless Spirits after.
Free 15 Souls |q 5282/1
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5282
step
click Elders' Square Service Gate |goto Eastern Plaguelands/0 47.88,23.87 < 10 |walk
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the Stratholme - Undead Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5122 |future
step
Inside the Stratholme - Undead Dungeon:
click Service Entrance Gate
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
talk Aurius##10931
|tip Inside the chapel to the right as you enter.
accept The Medallion of Faith##5122
step
Leave the Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5122
step
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5282 |goto Stratholme/0 14.45,33.74
step
Enter the cave |goto Stratholme/0 15.37,29.30 < 10 |walk
Follow the path |goto Stratholme/0 13.73,32.07 < 15 |walk
Leave the cave |goto Stratholme/0 7.50,40.68 < 15 |walk
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Of Love and Family##5848 |goto Western Plaguelands 65.77,75.37
step
talk Smokey LaRue##11033
turnin The Great Fras Siabi##5214 |goto Eastern Plaguelands 80.60,57.99
step
talk Duke Nicholas Zverenhoff##11039
turnin The Archivist##5251 |goto Eastern Plaguelands 81.44,59.82
step
Enter the Stratholme - Live Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5262 |future
step
Inside the Scholomance - Live Dungeon:
kill Balnazzar##10813
|tip He is the last boss of the Live Side of Stratholme.
|tip He is at the very end of The Scarlet Bastion, across from where Archivist Galford was.
collect Head of Balnazzar##13250 |q 5262 |future
step
use the Head of Balnazzar##13250
accept The Truth Comes Crashing Down##5262
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5262
step
talk Duke Nicholas Zverenhoff##11039
turnin The Truth Comes Crashing Down##5262 |goto Eastern Plaguelands 81.44,59.82
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Stratholme - Undead Side Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Stratholme',
    description = 'This guide will walk you through completing the Stratholme - Undead Side Quests.',
  },
  [[
step
Reach Level 55 |ding 55
|tip Use the Leveling guides to accomplish this.
step
talk Eva Sarkhoff##11216
Select _"The pleasure is mine madam. Might I ask what it is that you are doing here?"_
|tip Click through the dialogue.
accept Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5382
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
kill Rattlegore##11622
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Continue straight through the dungeon to reach The Great Ossuary.
|tip Jump down into one of the holes on the sides of the room to reach the lower level with Rattlegore.
collect Viewing Room Key##13873 |q 5382
|tip This key is required to progress further into the dungeon.
|tip If someone else in the group already has it you can skip this step.
step
Inside the Scholomance Dungeon:
click Remains of Eva Sarkhoff##176544
|tip They look like a pile of bloodied bones in the northern part of the room with Doctor Theolen Krastinov.
|tip Go back upstairs after killing Rattlegore and head north in The Great Ossuary to return to the previous room (the map will just say Scholomance).
|tip Go right through the Iron Gate, clear the room and open the Viewing Room Door using the key.
|tip Take a quick left in The Viewing Room, go through the Iron Gate and follow the stairs down to reach the Headmaster's Study.
|tip Staying on the upper level of the Headmaster's Study, head around the outside of the room and enter the room across from the entrance on the eastern side.
Burn the Remains of Eva Sarkhoff |q 5382/2
step
Inside the Scholomance Dungeon:
click Remains of Lucien Sarkhoff##176545
|tip They look like a pile of bloodied bones in the southeastern part of the room with Doctor Theolen Krastinov.
Burn the Remains of Lucien Sarkhoff |q 5382/3
step
Inside the Scholomance Dungeon:
kill Doctor Theolen Krastinov##11261 |q 5382/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5382
step
talk Eva Sarkhoff##11216
turnin Doctor Theolen Krastinov, the Butcher##5382 |goto Western Plaguelands 70.22,73.72
accept Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5515
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
kill Jandice Barov##10503
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Proceed into the next main room and then follow the path to the right and go down the stairs.
|tip Jandice is in the northeastern part of this room.
collect Krastinov's Bag of Horrors##13725 |q 5515/1
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5515
step
talk Eva Sarkhoff##11216
turnin Krastinov's Bag of Horrors##5515 |goto Western Plaguelands 70.22,73.72
accept Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 5384
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
step
Inside the Scholomance Dungeon:
click Brazier of the Herald
|tip After entering the dungeon, follow the path forward to enter The Reliquary.
|tip Go left and proceed through the Iron Gate on the north side of the room to reach the Chamber of Summoning.
|tip Follow the path out to the right to the balcony.
|tip Clear the Chamber of Summoning before doing this.
kill Kirtonos the Herald##10506 |q 5384/1
|tip Drag him back into the gate.
step
Leave the Scholomance Dungeon
Click Here to Continue |confirm |q 5384
step
talk Eva Sarkhoff##11216
turnin Kirtonos the Herald##5384 |goto Western Plaguelands 70.22,73.72
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
accept The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
step
click Keepsake of Remembrance##176630
|tip It looks like a small red book at the top of the tower.
|tip If it's not there, check in the fireplaces of nearby buildings.
collect Keepsake of Remembrance##13585 |q 5461/1 |goto Arathi Highlands 17.91,69.41
step
use the Spectral Essence##13544
Equip the Spectral Essence
talk Magistrate Marduke##11286
|tip You must have the Spectral Essence equipped to see him.
turnin The Human, Ras Frostwhisper##5461 |goto Western Plaguelands 70.57,74.11
accept The Dying, Ras Frostwhisper##5462 |goto Western Plaguelands 70.57,74.11
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin The Dying, Ras Frostwhisper##5462 |goto Eastern Plaguelands 81.72,57.83
accept Menethil's Gift##5463 |goto Eastern Plaguelands 81.72,57.83
step
talk Duke Nicholas Zverenhoff##11039
accept The Archivist##5251 |goto Eastern Plaguelands 81.44,59.82
step
Enter the Stratholme - Live Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5251
step
Inside the Stratholme - Live Dungeon:
click The Bastion Door
|tip Go left after entering, then north and then west once you enter Market Row to reach Crusader's Square.
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
click Malor's Strongbox##176112
|tip Enter The Hall of Lights, go down the hall and enter the small room on the left.
|tip In the same room as Malor the Zealous.
|tip It looks like a small toolbox in the corner of the room.
collect Medallion of Faith##12845 |q 5122 |future
step
Inside the Stratholme - Live Dungeon:
click Hall of High Command
|tip This requires The Scarlet Key from the Scarlet Monastery dungeon or a Rogue with leveled lockpicking to open.
|tip Go across the hall from The Hall of Lights to enter The Scarlet Bastion.
kill Archivist Galford##10811
|tip He is near the end of The Scarlet Bastion across from Grand Crusader Dathrohan.
Slay Archivist Galford |q 5251/1
step
Inside the Stratholme - Live Dungeon:
click Scarlet Archive##176245
|tip It looks like a small brown book on the table in the room where Archivist Galford is.
Burn the Archive |q 5251/2
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5251
step
talk Duke Nicholas Zverenhoff##11039
turnin The Archivist##5251 |goto Eastern Plaguelands 81.44,59.82
step
Enter the Stratholme - Live Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5262 |future
step
Inside the Scholomance - Live Dungeon:
kill Balnazzar##10813
|tip He is the last boss of the Live Side of Stratholme.
|tip He is at the very end of The Scarlet Bastion, across from where Archivist Galford was.
collect Head of Balnazzar##13250 |q 5262 |future
step
use the Head of Balnazzar##13250
accept The Truth Comes Crashing Down##5262
step
Leave the Stratholme - Live Dungeon
Click Here to Continue |confirm |q 5262
step
talk Duke Nicholas Zverenhoff##11039
turnin The Truth Comes Crashing Down##5262 |goto Eastern Plaguelands 81.44,59.82
accept Above and Beyond##5263 |goto Eastern Plaguelands 81.44,59.82
step
Follow the path |goto Eastern Plaguelands 12.00,61.72 < 30 |only if walking
talk Nathanos Blightcaller##11878
accept To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
accept The Ranger Lord's Behest##6133 |goto Eastern Plaguelands 26.54,74.74
accept Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
step
kill 20 Noxious Plaguebat##8601 |q 6042/1 |goto Eastern Plaguelands 61.96,61.16
You can find more around: |notinsticky
[54.34,58.88]
[49.30,62.57]
[52.57,56.21]
[54.57,50.34]
[60.98,55.50]
step
Kill enemies around this area
collect 7 Living Rot##15447 |q 6022
|tip These have a 10 minute timer before they vanish from your inventory.
step
use the Mortar and Pestle##15454
collect Coagulated Rot##15448 |q 6022/1 |goto Eastern Plaguelands 59.96,68.34
step
kill 10 Monstrous Plaguebat##8602 |q 6042/2 |goto Eastern Plaguelands 60.85,48.81
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
[48.56,26.97]
[52.38,24.42]
stickystart "Kill_8_Pathstrider"
stickystart "Kill_8_Ranger"
stickystart "Kill_8_Woodsman"
step
Follow the path up |goto Eastern Plaguelands 51.67,21.60 < 10 |only if walking
click Quel'Thalas Registry##177747
|tip It looks like a small brown book sitting on a bench inside the building.
|tip You may need to kill enemies to get it to spawn.
collect Quel'Thalas Registry##15847 |q 6133/4 |goto Eastern Plaguelands 52.14,18.31
step
label "Kill_8_Pathstrider"
kill Pathstrider##8565 |q 6133/1 |goto Eastern Plaguelands 52.81,18.66
You can find more around [53.86,15.80] |notinsticky
step
label "Kill_8_Ranger"
kill Ranger##8564 |q 6133/2 |goto Eastern Plaguelands 52.81,18.66
You can find more around [53.86,15.80] |notinsticky
step
label "Kill_8_Woodsman"
kill Woodsman##8563 |q 6133/3 |goto Eastern Plaguelands 52.81,18.66
You can find more around [53.86,15.80] |notinsticky
step
Follow the path |goto Eastern Plaguelands 12.00,61.72 < 30 |only if walking
talk Nathanos Blightcaller##11878
turnin To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
turnin The Ranger Lord's Behest##6133 |goto Eastern Plaguelands 26.54,74.74
turnin Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
accept Duskwing, Oh How I Hate Thee...##6135 |goto Eastern Plaguelands 26.54,74.74
accept The Corpulent One##6136 |goto Eastern Plaguelands 26.54,74.74
step
map Eastern Plaguelands
path loop off
path	32.59,74.29	34.52,71.21	34.74,66.76	33.18,65.94	30.61,66.29
path	29.25,66.06	26.54,69.63	27.02,67.54
Search for Duskwing along the path
kill Duskwing##11897
|tip You may need help with this.
collect Patch of Duskwing's Fur##15850 |q 6135/1 |goto Eastern Plaguelands 31.24,72.32
step
map Eastern Plaguelands
path loop off
path	63.94,34.72	61.10,32.30	59.08,32.17	57.32,32.05	54.03,31.91
path	52.77,32.07
Search for Borelgore along the path
kill Borelgore##11896 |q 6136/1
step
Follow the path |goto Eastern Plaguelands 12.00,61.72 < 30 |only if walking
talk Nathanos Blightcaller##11878
turnin Duskwing, Oh How I Hate Thee...##6135 |goto Eastern Plaguelands 26.54,74.74
turnin The Corpulent One##6136 |goto Eastern Plaguelands 26.54,74.74
accept Ramstein##6163 |goto Eastern Plaguelands 26.54,74.74
step
talk Betina Bigglezink##11035
accept The Flesh Does Not Lie##5212 |goto Eastern Plaguelands 81.47,59.65
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
accept Houses of the Holy##5243 |goto Eastern Plaguelands 81.73,57.83
step
click Elders' Square Service Gate |goto Eastern Plaguelands/0 47.88,23.87 < 10 |walk
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the Stratholme - Undead Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5263
stickystart "Collect_20_Plagued_Flesh_Sample"
stickystart "Collect_5_Stratholme_Holy_Water"
step
Inside the Stratholme - Undead Dungeon:
click Service Entrance Gate
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
talk Aurius##10931
|tip Inside the chapel to the right as you enter.
accept The Medallion of Faith##5122 |q 5125 |future
step
Inside the Stratholme - Undead Dungeon:
kill Ramstein the Gorger##10439
|tip Follow the path north and then east through the two Gauntlet Gates to reach the Gauntlet.
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
|tip Continue following the path north and then west to reach Slaughter Square.
|tip Clear the area of enemies to summon Ramstein the Gorger.
collect Head of Ramstein the Gorger##15880 |q 6163/1
step
Inside the Stratholme - Undead Dungeon:
kill Baron Rivendare##10440
|tip Enter the building in Slaughter Square and go downstairs.
collect Head of Baron Rivendare##13251 |q 5263/1
step
Inside the Stratholme - Undead Dungeon:
talk Aurius##10917
|tip On the floor in the room with Baron Rivendare.
|tip He appears if you've completed The Medallion of Faith quest.
|tip He will not appear again if you fail to kill the Baron and you will have to wait for a reset to try again.
accept Aurius' Reckoning##5125
step
Inside the Stratholme - Undead Dungeon:
click Menethil's Gift##176631
|tip It looks like a large orange circular symbol on the floor in the room with Baron Rivendare.
turnin Menethil's Gift##5463
accept Menethil's Gift##5464
step
label "Collect_20_Plagued_Flesh_Sample"
Inside the Stratholme - Undead Dungeon: |notinsticky
Kill enemies around this area
collect 20 Plagued Flesh Sample##13174 |q 5212/1
step
label "Collect_5_Stratholme_Holy_Water"
Inside the Stratholme - Undead Dungeon: |notinsticky
click Stratholme Supply Crate##181085+
|tip They look like brown boxes along the walls of the dungeon.
|tip They will sometimes spawn enemies instead.
collect 5 Stratholme Holy Water##13180 |q 5243/1
step
Leave Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5243
step
talk Duke Nicholas Zverenhoff##11039
turnin Above and Beyond##5263 |goto Eastern Plaguelands 81.44,59.82
step
talk Betina Bigglezink##11035
turnin The Flesh Does Not Lie##5212 |goto Eastern Plaguelands 81.47,59.65
accept The Active Agent##5213 |goto Eastern Plaguelands 81.47,59.65
step
talk Leonid Barthalomew the Revered##11036
|tip Inside the building.
turnin Menethil's Gift##5464 |goto Eastern Plaguelands 81.72,57.83
turnin Houses of the Holy##5243 |goto Eastern Plaguelands 81.73,57.83
step
Follow the path |goto Eastern Plaguelands 12.00,61.72 < 30 |only if walking
talk Nathanos Blightcaller##11878
turnin Ramstein##6163 |goto Eastern Plaguelands 26.54,74.74
step
click Elders' Square Service Gate |goto Eastern Plaguelands/0 47.88,23.87 < 10 |walk
|tip This requires the Key to the City, which drops from Magistrate barthilas in Stratholme - Live.
Enter the Stratholme - Undead Dungeon with Your Group |goto Stratholme/0 0.00,0.00 < 500 |c |q 5213
step
Inside the Stratholme - Undead Dungeon:
click Scourge Data##176249
|tip It looks like a small metal box in one of the three Ziggurats in The Gauntlet area.
|tip Follow the path north and then east through the two Gauntlet Gates to reach the Gauntlet.
|tip This requires the Key to the City or a Rogue with leveled lockpicking to open.
collect Scourge Data##13176 |q 5213/1
step
Leave Stratholme - Undead Dungeon
Click Here to Continue |confirm |q 5213
step
talk Betina Bigglezink##11035
turnin The Active Agent##5213 |goto Eastern Plaguelands 81.47,59.65
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Dungeon Guides\\Upper Blackrock Spire Quests',
  {
    author = 'support@zygorguides.com',
    image = ZGV.IMAGESDIR .. 'Upper Blackrock Spire',
    description = 'This guide will walk you through completing the Upper Blackrock Quests.',
  },
  [[
step
Reach Level 57 |ding 57
|tip Use the Leveling guides to accomplish this.
step
Follow the path down |goto Undercity 52.89,77.39 < 10 |only if walking
talk Apothecary Zinge##5204
accept Vivian Lagrave and the Darkstone Tablet##4769 |goto Undercity 50.14,67.98
step
talk Shadowmage Vivian Lagrave##9078
turnin Vivian Lagrave and the Darkstone Tablet##4769 |goto Badlands 2.90,47.75
accept The Darkstone Tablet##4768 |goto Badlands 2.90,47.75
step
talk Warlord Goretooth##9077
|tip He patrols around town.
|tip He must be at the top of the tower to accept this quest.
accept Warlord's Command##4903 |goto Badlands 5.82,47.53
step
talk Tinkee Steamboil##10267
accept Broodling Essence##4726 |goto Burning Steppes 65.24,24.00
step
use the Draco-Incarcinatrix 900##12284
|tip Use it on Broodling enemies around this area.
|tip They look like small flying dragons.
Kill Broodling enemies around this area
click Broodling Essence##175264+
|tip They look like red floating crystals that appear above their corpses after you kill them.
collect 8 Broodling Essence##12283 |q 4726/1 |goto Burning Steppes 59.26,32.49
You can find more around: |notinsticky
[72.83,28.41]
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
step
Follow the path up |goto Burning Steppes 63.92,29.88 < 15 |only if walking
talk Tinkee Steamboil##10267
turnin Broodling Essence##4726 |goto Burning Steppes 65.23,23.99
accept Felnok Steelspring##4808 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
turnin Felnok Steelspring##4808 |goto Winterspring 61.63,38.61
accept Chillwind Horns##4809 |goto Winterspring 61.63,38.61
step
kill Chillwind Ravager##7449+
|tip They look like chimeras.
|tip They share spawn points with the bears, so kill them too.
collect 8 Uncracked Chillwind Horn##12444 |q 4809/1 |goto Winterspring 59.97,21.54
You can find more around: |notinsticky
[54.75,22.59]
[59.18,18.02]
[60.13,12.28]
[57.99,14.79]
step
talk Felnok Steelspring##10468
turnin Chillwind Horns##4809 |goto Winterspring 61.63,38.61
accept Return to Tinkee##4810 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Return to Tinkee##4810 |goto Burning Steppes 65.23,23.99
step
talk Felnok Steelspring##10468
accept Tinkee Steamboil##4907 |goto Winterspring 61.63,38.61
step
talk Tinkee Steamboil##10267
turnin Tinkee Steamboil##4907 |goto Burning Steppes 65.23,23.99
accept Egg Freezing##4734 |goto Burning Steppes 65.23,23.99
step
talk Duke Hydraxis##13278
accept Poisoned Water##6804 |goto Azshara 79.28,73.69
accept Stormers and Rumblers##6805 |goto Azshara 79.28,73.69
stickystart "Kill_15_Desert_Rumbler"
step
kill 15 Dust Stormer##11744 |q 6805/1 |goto Silithus 19.84,22.23
You can find more around:
[22.87,13.34]
[29.37,15.01]
step
label "Kill_15_Desert_Rumbler"
kill 15 Desert Rumbler##11746 |q 6805/2 |goto Silithus 19.84,22.23
You can find more around: |notinsticky
[22.87,13.34]
[29.37,15.01]
step
use the Aspect of Neptulon##17310
|tip Use it on Plague Ravagers and Blighted Surge around this area.
kill Discordant Surge##13279+
collect 12 Discordant Bracers##17309 |q 6804/1 |goto Eastern Plaguelands 62.61,79.45
step
talk Duke Hydraxis##13278
turnin Poisoned Water##6804 |goto Azshara 79.28,73.69
turnin Stormers and Rumblers##6805 |goto Azshara 79.28,73.69
accept Eye of the Emberseer##6821 |goto Azshara 79.28,73.69
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 6602
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
stickystart "Collect_Important_Blackrock_Documents"
step
Inside the Lower Blackrock Spire Dungeon:
kill Highlord Omokk##9196 |q 4903/2
|tip After entering the dungeon, follow the path right in the Hall of Blackhand to reach Hordemar City.
|tip Proceed across the bridges through Hordemar City, continue past the groove in the ground where Bijou is and go west with all of the ogres to reach Mok'Doom.
|tip He is in the back of the room along the north side.
step
Inside the Lower Blackrock Spire Dungeon:
kill War Master Voone##9237 |q 4903/3
|tip Backtrack back to Hordemar City and jump down into the groove in the ground where Bijou is.
|tip Head south from Bijou to follow a short path and reach Tazz'Alaor.
|tip Follow the ramps down to the lowest level of Tazz'Alaor.
|tip Follow the path in the southwestern corner of the room.
step
Inside the Lower Blackrock Spire Dungeon:
kill Overlord Wyrmthalak##9568 |q 4903/1
|tip Leave Tazz'Alaor through the northeastern exit to enter the lower level of Hordemar City.
|tip Follow the path east and south to reach the Skitterweb Tunnels.
|tip Follow the path up and out of the Skitterweb Tunnels to reenter the upper levels of Hordemar City.
|tip Follow the path up, kill the group of ogres and then follow the path south along the western wall through the short hallway and up the small set of stairs.
|tip Turn right twice to go up another small set of stairs.
|tip Cross this room and continue up the small set of stairs on the opposite side, continue forward to reach the Chamber of Battle.
step
label "Collect_Important_Blackrock_Documents"
Inside the Lower Blackrock Spire Dungeon: |notinsticky
click Inconspicuous Documents##175785
|tip It looks like a small open scroll laying on the ground behind one of these three bosses.
|tip Check behind each boss after killing them to see if it's there.
collect Important Blackrock Documents##12562 |q 4903/4
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4903
step
talk Warlord Goretooth##9077
|tip He patrols around town.
|tip He must be at the top of the tower to accept this quest.
turnin Warlord's Command##4903 |goto Badlands 5.82,47.53
accept Eitrigg's Wisdom##4941 |goto Badlands 5.82,47.53
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 4768
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
kill Pyroguard Emberseer##9816
|tip After entering the dungeon, follow the path to the left to enter the Upper Blackrock Spire.
|tip Someone in your group must have the Seal of Ascension in order to open the door.
|tip Clear the enemies in the first room to unlock the door to the next room.
|tip Kill the Blackhand Incarcerators to release Pyroguard Emberseer.
collect Eye of the Emberseer##17322 |q 6821/1
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Don't get too close or they will hatch if they aren't frozen.
Test the Eggscilloscope Prototype |q 4734/1
step
Inside the Upper Blackrock Spire Dungeon:
click Darkstone Tablet##175385
|tip It looks like a square silver tablet in the center of The Rookery, just before the ramp.
collect Darkstone Tablet##12358 |q 4768/1
step
Inside the Upper Blackrock Spire Dungeon:
talk Awbee##10740
|tip Proceed through the upper level of The Rookery to reach the Hall of Blackhand.
|tip Go east in the Hall of Blackhand and jump down into the Blackrock Stadium to start the encounter.
|tip Kill the enemies that attack, then finally Gyth and Warchief Rend Blackhand.
|tip Exit the stadium to the south.
|tip It's on the ledge just past the door after the Gyth and Warchief Rend Blackhand encounter.
accept The Matron Protectorate##5160
step
Inside the Upper Blackrock Spire Dungeon:
kill The Beast##10430
|tip Head east up the stairs from Awbee and go right into The Furnace, followed by a left to reach The Beast.
collect Finkle's Skinner##12709 |n
|tip This is a rare drop and may take multiple attempts to get.
|tip If you don't have Skinning or you don't want to do this you can skip this step but you will have to skip the next quest.
use Finkle's Skinner##12709
Skin The Beast
|tip This requires level 315 Skinning to accomplish.
|tip You can achieve this with the "Enchant Gloves - Skinning" along with Finkle's Skinner equipped.
|confirm |q 5047 |future
step
Inside the Upper Blackrock Spire Dungeon:
talk Finkle Einhorn##10776
|tip He will appear after skinning The Beast.
Select _"How the hell did you get in there to begin with?"_
accept Finkle Einhorn, At Your Service!##5047
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4768
step
talk Shadowmage Vivian Lagrave##9078
turnin The Darkstone Tablet##4768 |goto Badlands 2.90,47.75
step
talk Warlord Goretooth##9077
|tip He patrols around town.
|tip He must be at the top of the tower to accept this quest.
turnin Warlord's Command##4903 |goto Badlands 5.82,47.53
accept Eitrigg's Wisdom##4941 |goto Badlands 5.80,47.53
step
Enter the building |goto Orgrimmar 40.25,36.95 < 7 |walk
talk Eitrigg##3144
|tip Inside the building.
Select _"Hello, Eitrigg. I bring news back from Blackrock Spire."_
|tip Click through the dialogue.
Council with Eitrigg |q 4941/1 |goto Orgrimmar 34.28,39.35
step
talk Thrall##4949
|tip Inside the building.
turnin Eitrigg's Wisdom##4941 |goto Orgrimmar 31.74,37.83
accept For The Horde!##4974 |goto Orgrimmar 31.74,37.83
step
talk Tinkee Steamboil##10267
turnin Egg Freezing##4734  |goto Burning Steppes 65.23,23.99
accept Egg Collection##4735 |goto Burning Steppes 65.23,23.99
step
talk Malyfous Darkhammer##10637
turnin Finkle Einhorn, At Your Service!##5047 |goto Winterspring 60.99,38.78
step
Follow the path up |goto Winterspring 58.09,51.54 < 15 |only if walking
Continue up the path |goto Winterspring 55.88,53.87 < 10 |only if walking
Continue up the path |goto Winterspring 54.70,54.48 < 10 |only if walking
Jump down here |goto Winterspring 53.56,53.23 < 10 |only if walking
Jump up here |goto Winterspring 54.16,52.01 < 10 |only if walking
talk Haleh##10929
turnin The Matron Protectorate##5160 |goto Winterspring 54.54,51.20
accept Wrath of the Blue Flight##5161 |goto Winterspring 54.54,51.20
step
talk Haleh##10929
turnin Wrath of the Blue Flight##5161 |goto Winterspring 54.54,51.20
accept Wrath of the Blue Flight##5162 |goto Winterspring 54.54,51.20
step
talk Jeziba##10976
|tip Upstairs inside the building.
turnin Wrath of the Blue Flight##5162 |goto Western Plaguelands 39.38,66.78
accept Catalogue of the Wayward##5164 |goto Western Plaguelands 39.38,66.78
step
click Catalogue of the Wayward##176192
|tip It looks like a blue book on the bedside table upstairs inside the building.
turnin Catalogue of the Wayward##5164 |goto Western Plaguelands 39.35,66.60
step
talk Duke Hydraxis##13278
turnin Eye of the Emberseer##6821 |goto Azshara 79.28,73.69
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 4974
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
use the Eggscilloscope Prototype##12286
|tip Use it on the eggs in The Rookery, just past Pyroguard Emberseer.
|tip Use it to freeze the eggs.
|tip Don't get too close or they will hatch if they aren't frozen.
use the Collectronic Module##12287
|tip Use it to collect the eggs.
collect 8 Collected Dragon Egg##12241 |q 4735/1
step
Inside the Upper Blackrock Spire Dungeon:
kill Warchief Rend Blackhand##10429
|tip Proceed through the upper level of The Rookery to reach the Hall of Blackhand.
|tip Go east in the Hall of Blackhand and jump down into the Blackrock Stadium to start the encounter.
|tip Kill the enemies that attack, then finally Gyth and Warchief Rend Blackhand.
collect Head of Rend Blackhand##12630 |q 4974/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 4974
step
talk Tinkee Steamboil##10267
turnin Egg Collection##4735 |goto Burning Steppes 65.23,23.99
step
Follow the path |goto Orgrimmar 51.98,57.66 < 10 |only if walking
Enter the building |goto Orgrimmar 40.25,36.95 < 7 |walk
talk Thrall##4949
|tip Inside the building.
turnin For The Horde!##4974 |goto Orgrimmar 31.74,37.83
accept What the Wind Carries##6566 |goto Orgrimmar 31.74,37.83
step
talk Thrall##4949
|tip Inside the building.
Select _"Please share your wisdom with me, Warchief."_
|tip Click through the dialogue.
Listen to Thrall's Tale |q 6566/1 |goto Orgrimmar 31.74,37.83
step
talk Thrall##4949
|tip Inside the building.
turnin What the Wind Carries##6566 |goto Orgrimmar 31.74,37.83
accept The Champion of the Horde##6567 |goto Orgrimmar 31.74,37.83
step
label "Rexxar_Champion_of_the_Horde_Path_One"
map Stonetalon Mountains
path follow smart; loop off; ants curved; dist 20
path	30.39,73.93	30.07,77.17	29.77,77.90
map Desolace
path	53.34,5.86	54.72,11.16	56.39,13.39	59.43,15.18	60.89,16.96
path	62.54,20.27	63.33,27.21	61.77,32.81	60.42,37.22	57.01,38.15
path	53.39,37.31	50.37,42.62	48.99,53.91	55.06,64.40	55.74,67.74
path	51.77,71.68	50.04,75.60	47.63,75.37	40.00,78.28	39.80,82.01
path	41.88,85.48	40.77,89.83	42.26,96.67
map Feralas
path	45.88,4.39	44.90,7.23	45.05,9.16	45.87,11.01	46.46,15.48
path	46.35,21.15	48.21,23.21	48.79,25.33
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin The Champion of the Horde##6567 |or |next "Accept_Testament_of_Power"
'|goto Feralas 48.79,25.33 < 20 |noway |or |c
step
map Feralas
path follow smart; loop off; ants curved; dist 20
path	48.79,25.33	48.21,23.21	46.35,21.15	46.46,15.48	45.87,11.01
path	45.05,9.16	44.90,7.23	45.88,4.39
map Desolace
path	42.26,96.67	40.77,89.83	41.88,85.48	39.80,82.01	40.00,78.28
path	47.63,75.37	50.04,75.60	51.77,71.68	55.74,67.74	55.06,64.40
path	48.99,53.91	50.37,42.62	53.39,37.31	57.01,38.15	60.42,37.22
path	61.77,32.81	63.33,27.21	62.54,20.27	60.89,16.96	59.43,15.18
path	56.39,13.39	54.72,11.16	53.34,5.86
map Stonetalon Mountains
path	29.77,77.90	30.07,77.17	30.39,73.93
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin The Champion of the Horde##6567 |or
'|goto Stonetalon Mountains 30.39,73.93 < 20 |noway |or |c |next "Rexxar_Champion_of_the_Horde_Path_One"
step
label "Accept_Testament_of_Power"
talk Rexxar##10182
accept The Testament of Rexxar##6568
step
talk Myranda the Hag##11872
turnin The Testament of Rexxar##6568 |goto Western Plaguelands 50.79,77.85
accept Oculus Illusions##6569 |goto Western Plaguelands 50.79,77.85
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 6569
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
Kill Rage Talon enemies throughout the dungeon
|tip There's a few at the very beginning of the dungeon and a lot more in The Rookery.
collect 20 Black Dragonspawn Eye##16786 |q 6569/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 6569
step
talk Myranda the Hag##11872
turnin Oculus Illusions##6569 |goto Western Plaguelands 50.79,77.85
accept Emberstrife##6570 |goto Western Plaguelands 50.79,77.85
step
Enter the cave |goto Dustwallow Marsh 54.54,84.73 < 5 |walk
Equip the Amulet of Draconic Subversion
|tip It should be in your bags.
Equip the Amulet of Draconic Subversion |equipped Amulet of Draconic Subversion##16787 |goto Dustwallow Marsh 55.09,85.62 |q 6570
step
use Amulet of Draconic Subversion##16787
Become Disguised |havebuff Illusion: Black Dragonkin##19937 |goto Dustwallow Marsh 55.09,85.62 |q 6570
step
Follow the path |goto Dustwallow Marsh 55.43,86.98 < 7 |walk
Continue following the path |goto Dustwallow Marsh 57.76,86.86 < 7 |walk
talk Emberstrife##10321
|tip Inside the cave.
turnin Emberstrife##6570 |goto Dustwallow Marsh 56.65,87.71
accept The Test of Skulls, Scryer##6582 |goto Dustwallow Marsh 56.65,87.71
accept The Test of Skulls, Somnus##6583 |goto Dustwallow Marsh 56.65,87.71
accept The Test of Skulls, Chronalis##6584 |goto Dustwallow Marsh 56.65,87.71
step
Follow the path |goto Tanaris 61.28,50.59 < 10 |only if walking
kill Chronalis##8197
|tip It flies around this area.
|tip Killing it will require a full group.
collect The Skull of Chronalis##16871 |q 6584/1 |goto Tanaris 64.07,48.75
step
Follow the path up |goto Winterspring 59.30,43.21 < 10 |only if walking
Enter the cave |goto Winterspring 57.15,49.93 < 7 |walk
Follow the path down |goto Winterspring 54.65,49.94 < 10 |only if walking
kill Scryer##10664
|tip Inside the cave.
|tip It flies around this area.
|tip Killing it will require a full group.
collect The Skull of Scryer##16869 |q 6582/1 |goto Winterspring 52.87,56.08
step
kill Somnus##12900
|tip It flies around this area, between these two spots.
|tip Killing it will require a full group.
collect The Skull of Somnus##16870 |q 6583/1 |goto Swamp of Sorrows 80.44,68.40
It may also be found around [77.87,37.19]
step
Enter the cave |goto Dustwallow Marsh 54.54,84.73 < 5 |walk
Equip the Amulet of Draconic Subversion
|tip It should be in your bags.
Equip the Amulet of Draconic Subversion |equipped Amulet of Draconic Subversion##16787 |goto Dustwallow Marsh 55.09,85.62 |q 6584
step
use Amulet of Draconic Subversion##16787
Become Disguised |havebuff Illusion: Black Dragonkin##19937 |goto Dustwallow Marsh 55.09,85.62 |q 6584
step
Follow the path |goto Dustwallow Marsh 55.43,86.98 < 7 |walk
Continue following the path |goto Dustwallow Marsh 57.76,86.86 < 7 |walk
talk Emberstrife##10321
|tip Inside the cave.
turnin The Test of Skulls, Scryer##6582 |goto Dustwallow Marsh 56.65,87.71
turnin The Test of Skulls, Somnus##6583 |goto Dustwallow Marsh 56.65,87.71
turnin The Test of Skulls, Chronalis##6584 |goto Dustwallow Marsh 56.65,87.71
accept The Test of Skulls, Axtroz##6585 |goto Dustwallow Marsh 56.65,87.71
step
Follow the path up |goto Wetlands 74.18,47.32 < 20 |only if walking
kill Axtroz##12899
|tip It flies back and forth between these two gates.
|tip Killing it will require a full group.
collect The Skull of Axtroz##16872 |q 6585/1 |goto Wetlands 82.81,48.88
step
Enter the cave |goto Dustwallow Marsh 54.54,84.73 < 5 |walk
Equip the Amulet of Draconic Subversion
|tip It should be in your bags.
Equip the Amulet of Draconic Subversion |equipped Amulet of Draconic Subversion##16787 |goto Dustwallow Marsh 55.09,85.62 |q 6585
step
use Amulet of Draconic Subversion##16787
Become Disguised |havebuff Illusion: Black Dragonkin##19937 |goto Dustwallow Marsh 55.09,85.62 |q 6585
step
Follow the path |goto Dustwallow Marsh 55.43,86.98 < 7 |walk
Continue following the path |goto Dustwallow Marsh 57.76,86.86 < 7 |walk
talk Emberstrife##10321
|tip Inside the cave.
turnin The Test of Skulls, Axtroz##6585 |goto Dustwallow Marsh 56.65,87.71
accept Ascension...##6601 |goto Dustwallow Marsh 56.65,87.71
step
label "Rexxar_Ascension_Path_One"
map Stonetalon Mountains
path follow smart; loop off; ants curved; dist 20
path	30.39,73.93	30.07,77.17	29.77,77.90
map Desolace
path	53.34,5.86	54.72,11.16	56.39,13.39	59.43,15.18	60.89,16.96
path	62.54,20.27	63.33,27.21	61.77,32.81	60.42,37.22	57.01,38.15
path	53.39,37.31	50.37,42.62	48.99,53.91	55.06,64.40	55.74,67.74
path	51.77,71.68	50.04,75.60	47.63,75.37	40.00,78.28	39.80,82.01
path	41.88,85.48	40.77,89.83	42.26,96.67
map Feralas
path	45.88,4.39	44.90,7.23	45.05,9.16	45.87,11.01	46.46,15.48
path	46.35,21.15	48.21,23.21	48.79,25.33
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin Ascension...##6601 |or |next "Accept_Blood_of_the_Black_Dragon_Champion"
'|goto Feralas 48.79,25.33 < 20 |noway |or |c
step
map Feralas
path follow smart; loop off; ants curved; dist 20
path	48.79,25.33	48.21,23.21	46.35,21.15	46.46,15.48	45.87,11.01
path	45.05,9.16	44.90,7.23	45.88,4.39
map Desolace
path	42.26,96.67	40.77,89.83	41.88,85.48	39.80,82.01	40.00,78.28
path	47.63,75.37	50.04,75.60	51.77,71.68	55.74,67.74	55.06,64.40
path	48.99,53.91	50.37,42.62	53.39,37.31	57.01,38.15	60.42,37.22
path	61.77,32.81	63.33,27.21	62.54,20.27	60.89,16.96	59.43,15.18
path	56.39,13.39	54.72,11.16	53.34,5.86
map Stonetalon Mountains
path	29.77,77.90	30.07,77.17	30.39,73.93
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin Ascension...##6601 |or
'|goto Stonetalon Mountains 30.39,73.93 < 20 |noway |or |c |next "Rexxar_Ascension_Path_One"
step
label "Accept_Blood_of_the_Black_Dragon_Champion"
talk Rexxar##10182
accept Blood of the Black Dragon Champion##6602
step
Run up the chain |goto Searing Gorge/0 37.25,94.29 < 5 |walk
Jump down here |goto Searing Gorge/0 37.79,92.44 < 5 |walk
Jump to the balcony |goto Searing Gorge/0 39.72,95.58 < 5 |walk
Enter the Blackrock Spire Dungeon with Your Group |goto Blackrock Spire/0 0.00,0.00 < 500 |c |q 6602
|tip This quest requires you to progress through the Upper Blackrock Spire dungeon.
|tip You will likely need a 10 person raid group to complete the quest.
step
Inside the Upper Blackrock Spire Dungeon:
kill General Drakkisath##10363
|tip After entering the dungeon, follow the path to the left to enter the Upper Blackrock Spire.
|tip Someone in your group must have the Seal of Ascension in order to open the door.
|tip Follow the path in the dungeon to reach The Rookery.
|tip Proceed through the upper level of The Rookery to reach the Hall of Blackhand.
|tip Go east in the Hall of Blackhand and jump down into the Blackrock Stadium to start the encounter.
|tip Kill the enemies that attack, then finally Gyth and Warchief Rend Blackhand and exit the stadium to the south.
|tip After exiting the stadium go left, right and right again then continue west to reach the Spire Throne.
collect Blood of the Black Dragon Champion##16663 |q 6602/1
step
Leave the Blackrock Spire Dungeon
Click Here to Continue |confirm |q 6602
step
label "Rexxar_Blood_of_the_Black_Dragon_Champion_Path_One"
map Stonetalon Mountains
path follow smart; loop off; ants curved; dist 20
path	30.39,73.93	30.07,77.17	29.77,77.90
map Desolace
path	53.34,5.86	54.72,11.16	56.39,13.39	59.43,15.18	60.89,16.96
path	62.54,20.27	63.33,27.21	61.77,32.81	60.42,37.22	57.01,38.15
path	53.39,37.31	50.37,42.62	48.99,53.91	55.06,64.40	55.74,67.74
path	51.77,71.68	50.04,75.60	47.63,75.37	40.00,78.28	39.80,82.01
path	41.88,85.48	40.77,89.83	42.26,96.67
map Feralas
path	45.88,4.39	44.90,7.23	45.05,9.16	45.87,11.01	46.46,15.48
path	46.35,21.15	48.21,23.21	48.79,25.33
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin Blood of the Black Dragon Champion##6602 |or
|tip Completing this quest will award you with a Darkfire Amulet, which will allow you to enter the Onyxia's Lair raid.
|tip You must keep it in your inventory in order to enter the raid instance.
'|goto Feralas 48.79,25.33 < 20 |noway |or |c
step
map Feralas
path follow smart; loop off; ants curved; dist 20
path	48.79,25.33	48.21,23.21	46.35,21.15	46.46,15.48	45.87,11.01
path	45.05,9.16	44.90,7.23	45.88,4.39
map Desolace
path	42.26,96.67	40.77,89.83	41.88,85.48	39.80,82.01	40.00,78.28
path	47.63,75.37	50.04,75.60	51.77,71.68	55.74,67.74	55.06,64.40
path	48.99,53.91	50.37,42.62	53.39,37.31	57.01,38.15	60.42,37.22
path	61.77,32.81	63.33,27.21	62.54,20.27	60.89,16.96	59.43,15.18
path	56.39,13.39	54.72,11.16	53.34,5.86
map Stonetalon Mountains
path	29.77,77.90	30.07,77.17	30.39,73.93
Follow the path looking for Rexxar
talk Rexxar##10182
|tip He walks along the road through Stonetalon Mountains, Desolace and Feralas.
|tip He's an Orc that walks with a pet bear.
turnin Blood of the Black Dragon Champion##6602 |or
|tip Completing this quest will award you with a Darkfire Amulet, which will allow you to enter the Onyxia's Lair raid.
|tip You must keep it in your inventory in order to enter the raid instance.
'|goto Stonetalon Mountains 30.39,73.93 < 20 |noway |or |c |next "Rexxar_Blood_of_the_Black_Dragon_Champion_Path_One"
]]
)
