local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Horde' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Undead Starter (1-14)',
  {
    image = ZGV.IMAGESDIR .. 'Tirisfal Glades',
    condition_suggested = function()
      return raceclass('Scourge') and level <= 12
    end,
    condition_suggested_race = function()
      return raceclass('Scourge')
    end,
    condition_suggested_exclusive = true,
    next = 'Leveling Guides\\The Barrens (12-18)',
    hardcore = true,
  },
  [[
step
talk Undertaker Mordo##1568
|tip Leave the crypt.
|tip Destroy your Hearthstone as you run up.
|tip You will get another one before you need to use it.
|tip We are doing this to gain an extra bag slot.
trash Hearthstone##6948
accept Rude Awakening##363 |goto Tirisfal Glades 30.22,71.65 |only if Undead
step
kill 2 Duskbat##1512 |goto Tirisfal Glades/0 29.59,68.55 |q 364 |future
|tip Loot them for 10 copper worth of vendor items.
|tip This will let you train a spell early.
|tip This substantially increases your leveling speed and is worth the detour.
|only if (Warrior or Warlock) and level <= 2
step
talk Archibald Kava##2113
|tip Acquire 10 copper.
|tip You can sell some of your gear or food if you are short, it's not important at this level.
|tip Do not sell your water. |only if Warlock
Sell your trash |vendor Archibald Kava##2113 |q 364 |future |goto Tirisfal Glades/0 32.43,65.67
|only if Warrior or Warlock
step
goto Tirisfal Glades 31.39,66.20
talk Shadow Priest Sarvis##1569
Click Here To Copy The Video Link |popuptext www.youtube.com/watch?v=g5Aak-n_XJk
|tip Inside the building.
turnin Rude Awakening##363 |goto Tirisfal Glades 30.84,66.20
accept The Mindless Ones##364 |goto Tirisfal Glades 30.84,66.20
step
talk Venya Marthand##5667
|tip Inside the building.
accept Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Undead Warlock
step
talk Maximillion##2126
Select _"I submit myself for further training my master."_ |gossip 98050 |goto Tirisfal Glades/0 30.91,66.34
learnspell Immolate##348
|only if Undead Warlock
step
talk Dannal Stern##2119
|tip Inside the building, on the ground floor.
|tip You will need 10 copper to learn this spell.
learnspell Battle Shout##6673 |goto Tirisfal Glades/0 32.68,65.56
|only if Warrior
stickystart "Kill_Wretched_Zombies"
stickystart "Collect_Rattlecage_Skulls_Warlock"
step
kill 8 Mindless Zombie##1501 |q 364/1  |goto Tirisfal Glades 31.96,63.30
|only if guideflag("testflag")
step
label "Kill_Wretched_Zombies"
kill 8 Wretched Zombie##1502 |q 364/2  |goto Tirisfal Glades 31.96,63.30
step
label "Collect_Rattlecage_Skulls_Warlock"
kill Rattlecage Skeleton##1890+
collect 3 Rattlecage Skull##6281 |q 1470/1 |goto Tirisfal Glades 32.73,60.10
|only if Scourge Warlock
step
Enter the building |goto Tirisfal Glades 31.39,66.20 < 10 |walk
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin The Mindless Ones##364 |goto Tirisfal Glades 30.84,66.20
accept Simple Scroll##3095 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Warrior
accept Tainted Scroll##3099 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Warlock
accept Encrypted Scroll##3096 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Rogue
accept Hallowed Scroll##3097 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Priest
accept Glyphic Scroll##3098 |goto Tirisfal Glades 30.84,66.20		|only if Scourge Mage
accept Rattling the Rattlecages##3901 |goto Tirisfal Glades 30.84,66.20
step
talk Novice Elreth##1661
|tip Inside the building.
accept The Damned##376 |goto Tirisfal Glades 30.86,66.05
step
talk Maximillion##2126
|tip Inside the building.
turnin Tainted Scroll##3099 |goto Tirisfal Glades 30.91,66.34
|only if Scourge Warlock
step
talk Venya Marthand##5667
|tip Inside the building.
turnin Piercing the Veil##1470 |goto Tirisfal Glades 30.98,66.41
|only if Scourge Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 376
|tip Use the "Summon Imp" ability.
|only if Scourge Warlock and not warlockpet("Imp")
stickystart "Collect_Scavenger_Paws"
stickystart "Collect_Duskbat_Wings"
step
label "Collect_Scavenger_Paws"
kill Young Scavenger##1508+
|tip They look like wolves.
collect 6 Scavenger Paw##3265 |q 376/1 |goto Tirisfal Glades 32.35,57.69
You can find more around: |notinsticky
[35.07,58.45]
[30.07,62.32]
step
label "Collect_Duskbat_Wings"
kill Duskbat##1512+
|tip They look like bats.
collect 6 Duskbat Wing##3264 |q 376/2 |goto Tirisfal Glades 32.35,57.69
You can find more around: |notinsticky
[35.07,58.45]
[30.07,62.32]
step
kill 12 Rattlecage Skeleton##1890 |q 3901/1 |goto Tirisfal Glades 32.93,60.75
step
Kill enemies around this area
ding 3,1000 |goto Tirisfal Glades 32.35,57.69
|tip We want to hit level 4 when we turn in quests.
You can find more around: |notinsticky
[35.07,58.45]
[30.07,62.32]
step
Enter the building |goto Tirisfal Glades 31.38,66.20 < 7 |walk
talk Novice Elreth##1661
|tip Inside the building.
turnin The Damned##376 |goto Tirisfal Glades 30.86,66.05
accept Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Shadow Priest Sarvis##1569
|tip Inside the building.
turnin Rattling the Rattlecages##3901 |goto Tirisfal Glades 30.83,66.20
step
talk Maximillion##2126
|tip Inside the building.
learnspell Corruption##172 |goto Tirisfal Glades/0 30.91,66.34
|only if Scourge Warlock
step
talk Isabella##2124
|tip Inside the building.
turnin Glyphic Scroll##3098 |goto Tirisfal Glades 30.94,66.06
learnspell Arcane Intellect##1459 |goto Tirisfal Glades 30.94,66.06
learnspell Conjure Water##5504 |goto Tirisfal Glades 30.94,66.06
learnspell Frostbolt##116 |goto Tirisfal Glades 30.94,66.06
|only if Scourge Mage
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
turnin Hallowed Scroll##3097 |goto Tirisfal Glades 31.11,66.03
learnspell Shadow Word: Pain##589 |goto Tirisfal Glades 31.11,66.03
learnspell Power Word: Fortitude##1243 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest
step
talk Executor Arren##1570
accept Night Web's Hollow##380 |goto Tirisfal Glades 32.15,66.01
step
talk Deathguard Saltain##1740
accept Scavenging Deathknell##3902 |goto Tirisfal Glades 31.61,65.60
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 7 |walk
talk Dannal Stern##2119
|tip Inside the building.
turnin Simple Scroll##3095 |goto Tirisfal Glades 32.69,65.56
learnspell Rend##772 |goto Tirisfal Glades 32.69,65.56
learnspell Charge##100 |goto Tirisfal Glades 32.69,65.56
|only if Scourge Warrior
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 10 |walk
talk David Trias##2122
|tip Inside the building.
|tip None of your spells are worth training currently, save your silver to buy a weapon upgrade later.
turnin Encrypted Scroll##3096 |goto Tirisfal Glades 32.53,65.65
|only if Scourge Rogue
step
talk Archibald Kava##2113
Sell your trash |vendor Archibald Kava##2113 |q 3902 |goto Tirisfal Glades/0 32.43,65.67
step
click Equipment Box##164662+
|tip They look like piles of brown boxes on the ground outside near buildings, and inside the buildings around this area.
|tip Kill enemies as you walk, to gain experience along the way.
collect 6 Scavenged Goods##11127 |q 3902/1 |goto Tirisfal Glades 32.60,63.50
stickystart "Kill_Night_Web_Spiders"
step
kill 10 Young Night Web Spider##1504 |q 380/1 |goto Tirisfal Glades 28.55,58.19
|tip Outside the mine.
step
label "Kill_Night_Web_Spiders"
kill 8 Night Web Spider##1505 |q 380/2 |goto Tirisfal Glades 26.84,59.41
|tip Inside the mine.
|tip Watch for respawns while in the area.	|only if hardcore
step
Kill enemies around this area
|tip Inside and outside the mine.
|tip Watch for respawns while in the cave.	|only if hardcore
ding 5 |goto Tirisfal Glades 26.84,59.41
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Tirisfal Glades 26.84,59.41 |q 380
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.24,64.89 |q 380 |zombiewalk
|only if not hardcore
step
talk Deathguard Saltain##1740
turnin Scavenging Deathknell##3902 |goto Tirisfal Glades 31.61,65.60
step
talk Executor Arren##1570
turnin Night Web's Hollow##380 |goto Tirisfal Glades 32.15,66.01
accept The Scarlet Crusade##381 |goto Tirisfal Glades 32.15,66.01
step
Kill Scarlet enemies around this area
collect 12 Scarlet Armband##3266 |q 381/1 |goto Tirisfal Glades 36.89,67.95
step
kill Samuel Fipps##1919
|tip Grind any level 3 or higher enemies you see en route to Samuel.
|tip This will reduce a grind later.
collect Samuel's Remains##16333 |goto Tirisfal Glades 36.68,61.57 |q 6395
step
Kill Enemies Around This Area
|tip This will let you reach level 6 when returning to town.
|tip Focus on killing enemies level 3 or higher.
ding 5,1990 |goto Tirisfal Glades 36.68,61.57 |q 6395
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Tirisfal Glades 37.61,61.37 |q 6395
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 31.22,64.89 |q 6395 |zombiewalk
|only if not hardcore
step
click Marla's Grave##178090
Bury Samuel's Remains |q 6395/1 |goto Tirisfal Glades 31.17,65.08
step
Enter the building |goto Tirisfal Glades 31.38,66.20 < 7 |walk
talk Novice Elreth##1661
|tip Inside the building.
turnin Marla's Last Wish##6395 |goto Tirisfal Glades 30.86,66.05
step
talk Executor Arren##1570
turnin The Scarlet Crusade##381 |goto Tirisfal Glades 32.15,66.01
accept The Red Messenger##382 |goto Tirisfal Glades 32.15,66.01
step
talk Archibald Kava##2113
Sell your trash |vendor Archibald Kava##2113 |q 382 |goto Tirisfal Glades/0 32.43,65.67
step
talk Maximillion##2126
|tip Inside the building.
learnspell Life Tap##1454 |goto Tirisfal Glades 30.91,66.34
learnspell Shadow Bolt##695 |goto Tirisfal Glades 30.91,66.34
|only if Scourge Warlock and level >= 6
step
talk Isabella##2124
|tip Inside the building.
|tip Conjure Food is a low priority spell, you can skip it for now if you are low on money.
learnspell Fire Blast##2136 |goto Tirisfal Glades 30.94,66.06
learnspell Fireball##143 |goto Tirisfal Glades 30.94,66.06
learnspell Conjure Food##587 |goto Tirisfal Glades 30.94,66.06
|only if Scourge Mage and level >= 6
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
accept In Favor of Darkness##5651 |goto Tirisfal Glades 31.11,66.03
learnspell Power Word: Shield##17 |goto Tirisfal Glades 31.11,66.03
learnspell Smite##591 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest and level >= 6
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 7 |walk
talk Dannal Stern##2119
|tip Inside the building.
|tip Train Parry as well.
|tip If you are short on money, learning Parry is more important. |only if hardcore
learnspell Thunder Clap##6343 |goto Tirisfal Glades 32.69,65.56
|only if Scourge Warrior and level >= 6
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 10 |walk
talk David Trias##2122
|tip Inside the building.
learnspell Sinister Strike##1757 |goto Tirisfal Glades 32.53,65.65
learnspell Gouge##1776 |goto Tirisfal Glades 32.53,65.65
|only if Scourge Rogue and level >= 6
step
kill Meven Korgal##1667
collect Scarlet Crusade Documents##2885 |q 382/1 |goto Tirisfal Glades 36.56,68.53
step
Kill enemies around this area
ding 6 |goto Tirisfal Glades 37.00,68.20
step
talk Executor Arren##1570
turnin The Red Messenger##382 |goto Tirisfal Glades 32.15,66.01
accept Vital Intelligence##383 |goto Tirisfal Glades 32.15,66.01
step
talk Calvin Montague##6784
accept A Rogue's Deal##8 |goto Tirisfal Glades 38.23,56.79
step
talk Deathguard Simmer##1519
accept Fields of Grief##365 |goto Tirisfal Glades 40.91,54.17
step
talk Gordo##10666
|tip He looks like an abomination that walks along this road to the east.
|tip Kill enemies as you walk to find him, to gain experience along the way.
|tip He can sometimes run off into the woods to kill enemies.
|tip If you don't see him by the time you reach town, turn around and look for him.
|tip This is an important quest.
accept Gordo's Task##5481 |goto Tirisfal Glades 43.72,54.34
He walks along the road between here and [55.15,52.32]
stickystart "Collect_Gloom_Weed"
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |q 5481
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 56.40,49.39 |q 5481 |zombiewalk
|only if not hardcore
step
talk Deathguard Dillinger##1496
accept A Putrid Task##404 |goto Tirisfal Glades 58.20,51.45
step
Enter the building |goto Tirisfal Glades 59.58,52.12 < 7 |walk
talk Apothecary Johaan##1518
|tip Inside the building.
accept A New Plague##367 |goto Tirisfal Glades 59.45,52.40
step
talk Executor Zygand##1515
turnin Vital Intelligence##383 |goto Tirisfal Glades 60.59,51.76
accept At War With The Scarlet Crusade##427 |goto Tirisfal Glades 60.59,51.76
step
click Wanted!
accept Wanted: Maggot Eye##398 |goto Tirisfal Glades 60.73,51.52
step
Enter the building |goto Tirisfal Glades 60.90,51.51 < 7 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
accept Graverobbers##358 |goto Tirisfal Glades 61.26,50.84
step
Enter the building |goto Tirisfal Glades 61.56,53.06 < 7 |walk
talk Innkeeper Renee##5688
|tip Inside the building.
turnin A Rogue's Deal##8 |goto Tirisfal Glades 61.71,52.05
step
talk Innkeeper Renee##5688
|tip Inside the building.
home Gallows' End Tavern |goto Tirisfal Glades 61.71,52.05
step
Summon Your Imp |complete warlockpet("Imp")
|tip Use the "Summon Imp" ability.
|tip You need to have your Imp active in order to complete the next step.
|only if Scourge Warlock and not warlockpet("Imp")
step
talk Gina Lang##5750
|tip Upstairs inside the building.
buy Grimoire of Blood Pact (Rank 1)##16321 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Blood Pact (Rank 1)##16321
Teach Your Imp Blood Pact (Rank 1) |learnpetspell Blood Pact##6307 |goto Tirisfal Glades 61.55,52.61
|only if Scourge Warlock
step
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
turnin In Favor of Darkness##5651 |goto Tirisfal Glades 61.57,52.19
accept Garments of Darkness##5650 |goto Tirisfal Glades 61.57,52.19
|only if Scourge Priest
step
Heal and Fortify Deathguard Kel |q 5650/1 |goto Tirisfal Glades 59.18,46.50
|tip Target Deathguard Kel.
|tip First, cast your "Lesser Heal (Rank 2)" spell on him.
|tip Second, cast your "Power Word: Fortitude" spell on him.
|only if Scourge Priest
step
talk Mrs. Winters##2134
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 404
|only if Scourge Rogue
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 404
|only if Scourge Rogue and itemcount(2494) == 0
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 404
|only if Scourge Warrior and itemcount(2488) == 0
step
_NOTE:_
Save All Linen Cloth You Find
|tip As you quest, save all Linen Cloth you find.
|tip Be careful not to accidentally sell them to a vendor.
|tip You will need ~70 Linen Cloth when you are level 10-11.
|tip You will use them to create your wand, which will be a powerful weapon for you.
|tip However, if you are confident you will be able to buy a wand from the Auction House (if this isn't a new or populated server), you can ignore this. |only if not selfmade
Click Here to Continue |confirm |q 404 |future
|only if Priest or Mage or Warlock
stickystart "Collect_Darkhound_Blood"
step
Kill enemies around this area
'|kill 10 Ravaged Corpse##1526, Rotting Dead##1525
|tip Only enemies that look like zombies will drop the quest item.
collect 7 Putrid Claw##2855 |q 404/1 |goto Tirisfal Glades 53.25,57.00
You can find more around [52.04,52.14]
step
label "Collect_Darkhound_Blood"
Kill Darkhound enemies around this area
'|kill Cursed Darkhound##1548, Decrepit Darkhound##1547
|tip They look like grey demon dogs.
|tip Kill them while heading west.
collect 5 Darkhound Blood##2858 |q 367/1 |goto Tirisfal Glades 48.00,58.82
You can find more around: |notinsticky
[48.61,54.05]
[44.74,53.81]
[43.71,57.19]
[40.75,55.76]
[39.87,51.66]
stickystop "Collect_Gloom_Weed"
step
click Tirisfal Pumpkin##375+
|tip They look like large orange pumpkins on the ground around this area.
collect 10 Tirisfal Pumpkin##2846 |q 365/1 |goto Tirisfal Glades 35.82,50.82
step
kill 10 Scarlet Warrior##1535 |q 427/1 |goto Tirisfal Glades 32.19,48.70
step
Kill enemies around this area
|tip This is so we hit level 8 in town.
ding 7,1825 |goto Tirisfal Glades 35.82,50.82
step
label "Collect_Gloom_Weed"
click Gloom Weed##175566+
|tip They look like small scraggly purple plants on the ground around this area.
|tip They can be pretty far spread out, so you may have to search around.
collect 3 Gloom Weed##12737 |q 5481/1 |goto Tirisfal Glades 51.42,55.05
You can find more around: |notinsticky
[51.52,51.98]
[50.62,55.23]
[49.97,56.40]
[48.82,58.67]
[43.78,56.19]
[44.92,52.98]
step
talk Coleman Farthing##1500
|tip Inside the building.
accept Deaths in the Family##354 |goto Tirisfal Glades 61.72,52.29
accept The Haunted Mills##362 |goto Tirisfal Glades 61.72,52.29
step
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
accept The Chill of Death##375 |goto Tirisfal Glades 61.89,52.73
step
Enter the building |goto Tirisfal Glades 61.56,53.06 < 7 |walk
talk Dark Cleric Beryl##2129
|tip Upstairs inside the building.
turnin Garments of Darkness##5650 |goto Tirisfal Glades 61.57,52.19
|only if Scourge Priest
step
talk Mrs. Winters##2134
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 375
|only if Scourge Rogue
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 375
|only if Scourge Rogue and itemcount(2494) == 0
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 375
|only if Scourge Warrior and itemcount(2488) == 0
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##427 |goto Tirisfal Glades 60.59,51.77
accept At War With The Scarlet Crusade##370 |goto Tirisfal Glades 60.59,51.77
step
talk Deathguard Burgess##1652
accept Proof of Demise##374 |goto Tirisfal Glades 60.92,52.01
step
Enter the building |goto Tirisfal Glades 59.58,52.12 < 7 |walk
talk Apothecary Johaan##1518
|tip Inside the building.
turnin Fields of Grief##365 |goto Tirisfal Glades 59.45,52.40
accept Fields of Grief##407 |goto Tirisfal Glades 59.45,52.40
turnin A New Plague##367 |goto Tirisfal Glades 59.45,52.40
accept A New Plague##368 |goto Tirisfal Glades 59.45,52.40
step
talk Deathguard Dillinger##1496
turnin A Putrid Task##404 |goto Tirisfal Glades 58.20,51.45
accept The Mills Overrun##426 |goto Tirisfal Glades 58.20,51.45
step
talk Junior Apothecary Holland##10665
|tip He walks around this area.
turnin Gordo's Task##5481 |goto Tirisfal Glades 58.25,49.76
accept Doom Weed##5482 |goto Tirisfal Glades 58.25,49.76
step
talk Captured Scarlet Zealot##1931
|tip Downstairs inside the building.
turnin Fields of Grief##407 |goto Tirisfal Glades 61.97,51.29
step
talk Austil de Mon##2131
|tip Inside the inn.
learnspell Hamstring##1715 |goto Tirisfal Glades/0 61.86,52.54
learnspell Heroic Strike##284 |goto Tirisfal Glades/0 61.86,52.54
|only if Warrior and level >= 8
step
talk Marion Call##2130
|tip Upstairs in the inn.
learnspell Eviscerate##6760 |goto Tirisfal Glades/0 61.75,52.01
learnspell Evasion##5277 |goto Tirisfal Glades/0 61.75,52.01
|only if Rogue and level >= 8
step
talk Dark Cleric Beryl##2129
|tip Upstairs in the inn.
learnspell Renew##139 |goto Tirisfal Glades/0 61.57,52.19
|only if Priest and level >= 8
step
talk Rupert Boch##2127
|tip Upstairs in the inn.
learnspell Fear##5782 |goto Tirisfal Glades/0 61.60,52.40
learnspell Curse of Agony##980 |goto Tirisfal Glades/0 61.60,52.40
|only if Warlock and level >= 8
step
talk Gina Lang##5750
|tip Upstairs inside the building.
buy Grimoire of Firebolt (Rank 2)##16302 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Firebolt (Rank 2)##16302
Teach Your Imp Firebolt (Rank 2) |learnpetspell Firebolt##7799 |goto Tirisfal Glades 61.55,52.61
|only if Scourge Warlock
step
talk Cain Firesong##2128
|tip Upstairs in the inn.
learnspell Polymorph##118 |goto Tirisfal Glades/0 61.97,52.46
learnspell Frostbolt##205 |goto Tirisfal Glades/0 61.97,52.46
|tip Frostbolt is optional, Fireball is more damage per mana at this level.
|only if Mage and level >= 8
step
talk Innkeeper Renee##5688
|tip Inside the building.
|tip Quests get more difficult from here, have a stockpile of food and water.
Stock up on Food and Water |vendor Innkeeper Renee##5688 |goto Tirisfal Glades 61.71,52.05
step
talk Mrs. Winters##2134
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 5482
step
talk Selina Weston##3548
|tip Selina can sell Lesser Healing Potions.
|tip They are a limited item and may not be in stock if other players bought them recently.
|tip There are difficult quests ahead you will want these for.
Check for Potions |vendor Selina Weston##3548 |goto Tirisfal Glades/0 61.76,50.03 |q 5482
stickystart "Collect_Doom_Weed"
stickystart "Collect_Embalming_Ichors"
step
kill 8 Rot Hide Graverobber##1941 |q 358/1 |goto Tirisfal Glades 55.37,42.34
|tip Use the Minor Troll's Blood potions you received from a quest earlier.
|tip They reduce downtime more than you'd think.
stickystart "Kill_Rot_Hide_Mongrels"
step
label "Collect_Doom_Weed"
click Doom Weed##176753+
|tip They look like small green and purple scraggly plants on the ground around this area.
|tip They can be pretty spread out, so you may need to search around.
collect 10 Doom Weed##13702 |q 5482/1 |goto Tirisfal Glades 57.17,35.72
You can find a few more around [56.98,40.63]
step
kill Maggot Eye##1753
|tip Inside the building.
|tip He's a level 10, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you.
collect Maggot Eye's Paw##3635 |q 398/1 |goto Tirisfal Glades 58.66,30.76
step
label "Kill_Rot_Hide_Mongrels"
kill 5 Rot Hide Mongrel##1675 |q 358/2 |goto Tirisfal Glades 59.10,36.18
step
label "Collect_Embalming_Ichors"
Kill Rot Hide enemies around this area
collect 8 Embalming Ichor##2834 |q 358/3 |goto Tirisfal Glades 59.10,36.18
step
Kill Vile Fin enemies around this area
collect 5 Vile Fin Scale##2859 |q 368/1 |goto Tirisfal Glades 59.86,28.31
You can find more around [62.06,29.45]
step
label "Kill_Greater_Duskbat"
kill Greater Duskbat##1553+
collect 5 Duskbat Pelt##2876 |q 375/1 |goto Tirisfal Glades 62.00,44.30
You can find more around: |notinsticky
[64.43,55.19]
[64.67,50.23]
[63.22,46.58]
[62.14,41.90]
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Tirisfal Glades 59.86,28.31 |q 368
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 56.40,49.38 |q 368 |zombiewalk
|only if not hardcore
step
talk Junior Apothecary Holland##10665
|tip He walks around this area.
turnin Doom Weed##5482 |goto Tirisfal Glades 57.97,49.71
step
Enter the building |goto Tirisfal Glades 59.58,52.12 < 7 |walk
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##368 |goto Tirisfal Glades 59.45,52.40
accept A New Plague##369 |goto Tirisfal Glades 59.45,52.40
step
talk Executor Zygand##1515
turnin Wanted: Maggot Eye##398 |goto Tirisfal Glades 60.58,51.77
step
Enter the building |goto Tirisfal Glades 60.90,51.52 < 10 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Graverobbers##358 |goto Tirisfal Glades 61.26,50.85
accept Forsaken Duties##359 |goto Tirisfal Glades 61.26,50.85
accept The Prodigal Lich##405 |goto Tirisfal Glades 61.26,50.85
step
talk Abigail Shiel##2118
|tip This is for a quest.
buy Coarse Thread##2320 |q 375/2 |goto Tirisfal Glades 61.03,52.37
step
Enter the building |goto Tirisfal Glades 61.56,53.05 < 7 |walk
talk Gretchen Dedmar##1521
|tip Upstairs inside the building.
turnin The Chill of Death##375 |goto Tirisfal Glades 61.89,52.73
step
talk Innkeeper Renee##5688
|tip Inside the building.
|tip Quests get more difficult from here, have a stockpile of food and water.
Stock up on Food and Water |vendor Innkeeper Renee##5688 |goto Tirisfal Glades 61.71,52.05
step
talk Nurse Neela##5759
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Tirisfal Glades 61.82,52.83
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats or zeppelins, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 362
step
talk Mrs. Winters##2134
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 404
|only if Scourge Rogue
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 404
|only if Scourge Rogue and itemcount(2494) == 0
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 404
|only if Scourge Warrior and itemcount(2488) == 0
step
talk Mrs. Winters##2134
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 362
step
talk Selina Weston##3548
|tip Selina can sell Lesser Healing Potions.
|tip They are a limited item and may not be in stock if other players bought them recently.
|tip There are difficult quests ahead you will want these for.
Check for Potions |vendor Selina Weston##3548 |goto Tirisfal Glades/0 61.76,50.03 |q 362
stickystart "Collect_Notched_Ribs"
stickystart "Collect_Blackened_Skulls"
step
Follow the road |goto Tirisfal Glades 46.44,44.85 < 50 |only if walking
kill Devlin Agamand##1657
|tip He looks like an armored skeleton mage.
collect Devlin's Remains##2831 |q 362/1 |goto Tirisfal Glades 47.34,40.77
step
Enter the building |goto Tirisfal Glades 49.37,36.03 < 7 |walk
kill Nissa Agamand##1655
|tip She looks like the ghost of a woman that walks around inside the building.
|tip She can be upstairs or downstairs.
collect Nissa's Remains##2828 |q 354/2 |goto Tirisfal Glades 49.54,36.02
step
kill Gregor Agamand##1654
|tip He looks like a ghoul that walks around this area.
collect Gregor's Remains##2829 |q 354/1 |goto Tirisfal Glades 45.74,29.38
step
kill Thurman Agamand##1656
|tip He looks like a zombie that walks around this area.
collect Thurman's Remains##2830 |q 354/3 |goto Tirisfal Glades 43.64,35.41
step
label "Collect_Notched_Ribs"
Kill Soldier enemies around this area
'|kill Cracked Skull Soldier##1523, Rattlecage Soldier##1520
|tip They look like armored skeletons around this area.
|tip All around this whole area.
collect 5 Notched Rib##3162 |q 426/1 |goto Tirisfal Glades 47.73,35.28
step
label "Collect_Blackened_Skulls"
kill Darkeye Bonecaster##1522+
|tip All around this whole area.
collect 3 Blackened Skull##3163 |q 426/2 |goto Tirisfal Glades 47.73,35.28
step
label "Collect_A_Letter_To_Yvette"
Kill enemies around this area
|tip Only enemies that look like skeletons will drop the quest item.
|tip All around this whole area.
|tip If you reach level 9 and 4700 exp before finding it, skip this step.
collect A Letter to Yvette##2839 |goto Tirisfal Glades 47.73,35.28 |q 361 |future |or
ding 9,4700 |goto Tirisfal Glades 47.73,35.28 |or
step
use A Letter to Yvette##2839
|tip If you reach level 9 and 4700 exp before finding it, skip this step.
accept A Letter Undelivered##361
|only if itemcount(2839) > 0
step
Kill Enemies in the Area
|tip This will ensure you hit level 10 when turning in your quests later.
|tip Enemies here have low health and armor making it a very good grind spot.
|tip You can grind here longer if you wish to reduce grinding later.
ding 9,4700 |goto Tirisfal Glades 47.73,35.28
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Tirisfal Glades 47.73,35.28 |q 354
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 56.40,49.39 |q 354 |zombiewalk
|only if not hardcore
step
talk Deathguard Dillinger##1496
turnin The Mills Overrun##426 |goto Tirisfal Glades 58.20,51.45
step
Enter the building |goto Tirisfal Glades 61.56,53.05 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Deaths in the Family##354 |goto Tirisfal Glades 61.72,52.29
turnin The Haunted Mills##362 |goto Tirisfal Glades 61.72,52.29
accept Speak with Sevren##355 |goto Tirisfal Glades 61.72,52.29
step
talk Yvette Farthing##1560
|tip Inside the building.
turnin A Letter Undelivered##361 |goto Tirisfal Glades 61.58,52.60
step
talk Oliver Dwor##2136
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip You will be able to dual wield at level 10 soon and need a second weapon.
|tip If you have upwards of 30 silver, skip this step. We'll buy a Cutlass in Undercity soon.
Visit the Vendor |vendor Oliver Dwor##2136 |goto Tirisfal Glades 60.13,53.40 |q 375
|only if Scourge Rogue and itemcount(2494) < 2
step
talk Rupert Boch##2127
|tip Upstairs inside the building.
learnspell Drain Soul##1120 |goto Tirisfal Glades/0 61.60,52.40
learnspell Create Healthstone (Minor)##6201 |goto Tirisfal Glades/0 61.60,52.40
|tip This requires Drain Soul to be trained.
learnspell Demon Skin##696 |goto Tirisfal Glades/0 61.60,52.40
learnspell Immolate##707 |goto Tirisfal Glades/0 61.60,52.40
|only if Scourge Warlock
step
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades 61.62,52.67
|only if Scourge Warlock
step
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Halgar's Summons##1478 |goto Undercity 85.04,26.01
accept Creature of the Void##1473 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
talk Bethor Iceshard##1498
turnin The Prodigal Lich##405 |goto Undercity 84.07,17.45
accept The Lich's Identity##357 |goto Undercity 84.07,17.45
|only if Scourge Warlock
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Warlock"	|or	|q 357
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Warlock"	|or	|q 357
|only if Warlock
step
label "Create_Wand_Warlock"
collect 70 Linen Cloth##2589 |q 357
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Warlock
step
talk Victor Ward##11048
Learn Tailoring |skillmax Tailoring,75 |goto Undercity/0 70.08,29.82 |q 357
|only if Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 357
|only if Warlock
step
talk Millie Gregorian##4577
buy 10 Coarse Thread##2320 |goto Undercity 70.59,30.14 |q 357
|only if Warlock
step
talk Victor Ward##11048
learn Brown Linen Robe##7623 |goto Undercity/0 70.08,29.82 |q 357
|only if Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 357
|only if Warlock
step
talk Malcomb Wynn##11067
Learn Enchanting |skillmax Enchanting,75 |goto Undercity/0 62.54,60.35 |q 357
|only if Warlock
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Thaddeus Webb here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Undercity 62.38,60.98 |q 357
collect 2 Lesser Magic Essence##10938 |goto Undercity 62.38,60.98 |q 357
|only if Warlock
step
talk Thaddeus Webb##4617
buy Copper Rod##6217 |goto Undercity 62.38,60.98 |q 357
buy Simple Wood##4470 |goto Undercity 62.38,60.98 |q 357
|only if Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 357
|only if Warlock
step
talk Malcomb Wynn##11067
learn Lesser Magic Wand##14293 |goto Undercity/0 62.54,60.35 |q 357
|only if Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 357
|only if Warlock
stickystart "Kill_Captain_Perrine"
stickystart "Collect_Scarlet_Insignia_Rings"
stickystart "Kill_Scarlet_Zealots"
stickystart "Kill_Scarlet_Missionaries"
step
label "Skip_Wand_Warlock"
Leave Undercity |goto Undercity 66.23,0.23 < 10 |walk
Enter the building |goto Tirisfal Glades 51.44,67.70 < 7 |walk
click Perrine's Chest
|tip Inside the building.
collect Egalin's Grimoire##6285 |q 1473/1 |goto Tirisfal Glades 51.06,67.57
|only if Scourge Warlock
step
label "Kill_Captain_Perrine"
kill Captain Perrine##1662 |q 370/1 |goto Tirisfal Glades 51.13,67.80
|tip Inside the building.
|only if Scourge Warlock
step
label "Kill_Scarlet_Zealots"
kill 3 Scarlet Zealot##1537 |q 370/2 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if Scourge Warlock
step
label "Kill_Scarlet_Missionaries"
kill 3 Scarlet Missionary##1536 |q 370/3 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if Scourge Warlock
step
label "Collect_Scarlet_Insignia_Rings"
Kill Scarlet enemies around this area
'|kill Scarlet Missionary##1536, Scarlet Zealot##1537
|tip We'll finish this quest later.
collect 10 Scarlet Insignia Ring##2875 |q 374/1 |count 5 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if Scourge Warlock
step
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Creature of the Void##1473 |goto Undercity 85.04,26.01
accept The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
use the Runes of Summoning##6284
|tip Use them on the pink symbol on the ground.
kill Summoned Voidwalker##5676 |q 1471/1 |goto Undercity 86.62,27.10
|only if Scourge Warlock
step
talk Carendin Halgar##5675
turnin The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
_NOTE:_
|tip As you follow the guide, use your "Drain Soul" spell as you kill an enemy to get a Soul Shard.
|tip Once you have a Soul Shard, use your "Summon Voidwalker" ability to summon your voidwalker.
|tip It will tank enemies for you, making it easier to kill enemies.
Click Here to Continue |confirm |q 355
|only if Scourge Warlock
step
talk Innkeeper Norman##6741
|tip Upstairs inside Undercity.
home Undercity |goto Undercity/0 67.72,37.90
|only if Scourge Warlock
step
talk Deathguard Burgess##1652
turnin Proof of Demise##374 |goto Tirisfal Glades 60.93,52.00
|only if Scourge Warlock and readyq(374)
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##370 |goto Tirisfal Glades 60.58,51.76
accept At War With The Scarlet Crusade##371 |goto Tirisfal Glades 60.58,51.76
|only if Scourge Warlock
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Scourge Warrior
step
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
click Mausoleum Trigger##104593
Watch the dialogue
|tip Ulag the Cleaver will open the crypt door nearby and attack you.
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.16,48.51
|only if Scourge Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
|only if Scourge Warrior
step
talk Marion Call##2130
|tip Upstairs inside the building.
accept Mennet Carkad##1885 |goto Tirisfal Glades 61.75,52.00
|tip Train Dual Wield
learnspell Sprint##2983 |goto Tirisfal Glades 61.75,52.00
learnspell Slice and Dice##5171 |goto Tirisfal Glades 61.75,52.00
|only if Scourge Rogue
step
talk Cain Firesong##2128
|tip Upstairs inside the building.
accept Speak with Anastasia##1881 |goto Tirisfal Glades 61.97,52.47
learnspell Conjure Water##5505 |goto Tirisfal Glades/0 61.97,52.46
learnspell Frost Nova##122 |goto Tirisfal Glades/0 61.97,52.46
learnspell Frost Armor##7300 |goto Tirisfal Glades/0 61.97,52.46
|only if Scourge Mage
step
talk Mrs. Winters##2134
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 355
stickystart "Collect_Scarlet_Insignia_Rings"
stickystart "Kill_Scarlet_Zealots"
stickystart "Kill_Scarlet_Missionaries"
step
Enter the building |goto Tirisfal Glades 51.44,67.70 < 7 |walk
kill Captain Perrine##1662 |q 370/1 |goto Tirisfal Glades 51.13,67.80
|tip Inside the building.
|only if not Scourge Warlock
step
label "Kill_Scarlet_Zealots"
kill 3 Scarlet Zealot##1537 |q 370/2 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if not Scourge Warlock
step
label "Kill_Scarlet_Missionaries"
kill 3 Scarlet Missionary##1536 |q 370/3 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if not Scourge Warlock
step
label "Collect_Scarlet_Insignia_Rings"
Kill Scarlet enemies around this area
|tip We'll finish this quest later.
collect 10 Scarlet Insignia Ring##2875 |q 374/1 |count 5 |goto Tirisfal Glades 52.04,67.78
You can find more around [48.02,65.73]
|only if not Scourge Warlock
step
talk Bethor Iceshard##1498
turnin The Prodigal Lich##405 |goto Undercity 84.07,17.45
accept The Lich's Identity##357 |goto Undercity 84.07,17.45
|only if not Scourge Warlock
step
talk Mennet Carkad##6467
turnin Mennet Carkad##1885 |goto Undercity 83.51,69.11
accept The Deathstalkers##1886 |goto Undercity 83.51,69.11
|only if Scourge Rogue
step
talk Archibald##11870
|tip This will allow you to equip one-handed swords.
Train Swords |complete weaponskill("SWORD") > 0 |goto Undercity 57.31,32.77
|only if Scourge Rogue
step
talk Louis Warren##4557
buy Cutlass##851 |n
|tip This is well worth it if you can afford it.
|tip You will need 21 silver.
Visit the Vendor |vendor Louis Warren##4557 |goto Undercity/0 61.16,40.88 |q 359
|only if Scourge Rogue
step
talk Nathaniel Steenwick##4592
buy Keen Throwing Knife##3107 |n
|tip If you can afford it.
|tip You will equip it after you reach level 11 soon.
|tip If you have better, skip this step.
Visit the Vendor |vendor Nathaniel Steenwick##4592 |goto Undercity 77.49,49.63 |q 359
|only if Scourge Rogue
step
talk Brom Killian##4598
|tip We are learning this to make Sharpening Stones. They are a large DPS increase at this level.
Train Apprentice Mining |skillmax Mining,75 |goto Undercity/0 56.02,37.39
|only if Warrior or Rogue
step
talk Sarah Killian##4599
collect Mining Pick##2901 |goto Undercity/0 56.68,36.86
Visit the Vendor |vendor Sarah Killian##4599 |goto Undercity/0 56.68,36.86
|only if Warrior or Rogue
step
talk Basil Frye##4605
|tip Gather Rough Stone as you quest and make them into Sharpening Stones to apply to your weapons.
|tip Do this until level 20, when it will no longer be worth the time.
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Undercity/0 56.02,37.39
|only if Warrior or Rogue
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Priest"	|or	|q 357
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Priest"	|or	|q 357 |only if Priest
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Mage"	|or	|q 357 |only if Mage
|only if Priest or Mage
step
label "Create_Wand_Priest"
collect 70 Linen Cloth##2589 |q 357
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Priest or Mage
step
talk Victor Ward##11048
Learn Tailoring |skillmax Tailoring,75 |goto Undercity/0 70.08,29.82 |q 357
|only if Priest or Mage
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 357
|only if Priest or Mage
step
talk Millie Gregorian##4577
buy 10 Coarse Thread##2320 |goto Undercity 70.59,30.14 |q 357
|only if Priest or Mage
step
talk Victor Ward##11048
learn Brown Linen Robe##7623 |goto Undercity/0 70.08,29.82 |q 357
|only if Priest or Mage
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 357
|only if Priest or Mage
step
talk Malcomb Wynn##11067
Learn Enchanting |skillmax Enchanting,75 |goto Undercity/0 62.54,60.35 |q 357
|only if Priest or Mage
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Thaddeus Webb here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Undercity 62.38,60.98 |q 357
collect 2 Lesser Magic Essence##10938 |goto Undercity 62.38,60.98 |q 357
|only if Priest or Mage
step
talk Thaddeus Webb##4617
buy Copper Rod##6217 |goto Undercity 62.38,60.98 |q 357
buy Simple Wood##4470 |goto Undercity 62.38,60.98 |q 357
|only if Priest or Mage
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 357
|only if Priest or Mage
step
talk Lavinia Crowe##4616
learn Lesser Magic Wand##14293 |goto Undercity 62.47,61.80 |q 357
|only if Priest or Mage
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 357
|only if Priest	or Mage
step
label "Skip_Wand_Priest"
talk Aelthalyste##4606
accept Touch of Weakness##5658 |goto Undercity 49.27,17.11 |instant
learnspell Mind Blast##8092 |goto Undercity 49.27,17.11
learnspell Lesser Heal##2053 |goto Undercity 49.27,17.11
learnspell Shadow Word: Pain##594 |goto Undercity 49.27,17.11
learnspell Resurrection##2006 |goto Undercity 49.27,17.11 |only if not hardcore
|tip Only train Resurrection if you plan to do group content. |only if not hardcore
|only if Scourge Priest
step
label "Skip_Wand_Mage"
talk Anastasia Hartwell##4568
turnin Speak with Anastasia##1881 |goto Undercity/0 85.14,10.01
accept The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.01
|only if Scourge Mage
stickystart "Astor_Hadren"
step
talk Deathguard Burgess##1652
turnin Proof of Demise##374 |goto Tirisfal Glades 60.93,52.00
|only if not Scourge Warlock and readyq(374)
stickystop "Astor_Hadren"
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##370 |goto Tirisfal Glades 60.58,51.76
accept At War With The Scarlet Crusade##371 |goto Tirisfal Glades 60.58,51.76
|only if not Scourge Warlock
step
talk Innkeeper Renee##5688
|tip Inside the building.
|tip Quests get more difficult from here, have a stockpile of food and water.
Stock up on Food and Water |vendor Innkeeper Renee##5688 |goto Tirisfal Glades 61.71,52.05 |q 356
step
talk Selina Weston##3548
|tip Selina can sell Lesser Healing Potions.
|tip They are a limited item and may not be in stock if other players bought them recently.
|tip There are difficult quests ahead you will want these for.
Check for Potions |vendor Selina Weston##3548 |goto Tirisfal Glades/0 61.76,50.03 |q 356
stickystart "Astor_Hadren"
step
talk Deathguard Linnea##1495
turnin Forsaken Duties##359 |goto Tirisfal Glades 65.49,60.25
accept Return to the Magistrate##360 |goto Tirisfal Glades 65.49,60.25
accept Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
stickystop "Astor_Hadren"
stickystart "Kill_Bleeding_Horrors"
stickystart "Kill_Wandering_Spirits"
step
click Balnir Snapdragons
collect Balnir Snapdragons##7227 |q 1882/1 |goto Tirisfal Glades 77.39,61.76
|only if Scourge Mage
step
label "Kill_Bleeding_Horrors"
kill 8 Bleeding Horror##1529 |q 356/1 |goto Tirisfal Glades 75.54,60.85
|tip These mobs can be tougher than normal, go slow and let yourself heal after each fight. |only if hardcore
|tip Beware of the rare spawn ghost that can spawn on the field, it does a lot of damage. |only if hardcore
step
label "Kill_Wandering_Spirits"
kill 8 Wandering Spirit##1532 |q 356/2 |goto Tirisfal Glades 75.54,60.85
|tip These mobs can be tougher than normal, go slow and let yourself heal after each fight. |only if hardcore
|tip Beware of the rare spawn ghost that can spawn on the field, it does a lot of damage. |only if hardcore
stickystart "Kill_Scarlet_Friars"
step
Follow the path up |goto Tirisfal Glades 79.31,57.29 < 10 |only if walking
Enter the building |goto Tirisfal Glades 79.18,55.98 < 7 |walk
kill Captain Vachon##1664 |q 371/1 |goto Tirisfal Glades 78.82,56.13
|tip Inside the building.
|tip If there's a Friar with him, kill the Friar first.
|tip Clear the enemies around the tower first as Captain Vachon will run for help when low health.
step
label "Kill_Scarlet_Friars"
kill 5 Scarlet Friar##1538 |q 371/2 |goto Tirisfal Glades 79.79,55.85
|tip These mobs can cast a full heal.
|tip Try to save energy to Gouge them to stop the cast. |only if Rogue
You can find more around [76.42,55.60]
step
kill Vicious Night Web Spider##1555+
collect 4 Vicious Night Web Spider Venom##2872 |q 369/1 |goto Tirisfal Glades 84.20,53.16
You can find more around: |notinsticky
[88.35,53.73]
[89.50,51.06]
step
Follow the path |goto Tirisfal Glades 79.34,48.27 < 50 |only if walking
click Gunther's Books
collect The Lich's Spellbook##2833 |q 357/1 |goto Tirisfal Glades 67.97,42.10
step
talk Selina Weston##3548
|tip Selina can sell Lesser Healing Potions.
|tip They are a limited item and may not be in stock if other players bought them recently.
|tip There are difficult quests ahead you will want these for.
Check for Potions |vendor Selina Weston##3548 |goto Tirisfal Glades/0 61.76,50.03 |q 357
step
Enter the building |goto Tirisfal Glades 59.58,52.12 < 10 |walk
talk Apothecary Johaan##1518
|tip Inside the building.
turnin A New Plague##369 |goto Tirisfal Glades 59.45,52.40
accept A New Plague##492 |goto Tirisfal Glades 59.45,52.40
accept Delivery to Silverpine Forest##445 |goto Tirisfal Glades 59.45,52.40
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##371 |goto Tirisfal Glades 60.58,51.77
accept At War With The Scarlet Crusade##372 |goto Tirisfal Glades 60.58,51.77
step
talk Deathguard Burgess##1652
turnin Proof of Demise##374 |goto Tirisfal Glades 60.93,52.00
|only if readyq(374)
step
Enter the building |goto Tirisfal Glades 60.90,51.52 < 10 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
turnin Return to the Magistrate##360 |goto Tirisfal Glades 61.26,50.84
turnin Speak with Sevren##355 |goto Tirisfal Glades 61.26,50.84
step
talk Mrs. Winters##2134
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 492
step
Enter the building |goto Tirisfal Glades 61.56,53.06 < 7 |walk
talk Captured Mountaineer##2211
|tip Downstairs inside the building.
turnin A New Plague##492 |goto Tirisfal Glades 61.94,51.40
stickystart "Astor_Hadren"
step
talk Bethor Iceshard##1498
turnin The Lich's Identity##357 |goto Undercity 84.07,17.45
accept Return the Book##366 |goto Undercity/0 84.07,17.45
step
talk Mennet Carkad##6467
turnin The Deathstalkers##1886 |goto Undercity 83.51,69.11
accept The Deathstalkers##1898 |goto Undercity 83.51,69.11
|only if Scourge Rogue and itemcount(7231) > 0
step
talk Andron Gant##6522
turnin The Deathstalkers##1898 |goto Undercity 54.82,76.30
accept The Deathstalkers##1899 |goto Undercity 54.82,76.30
|only if Scourge Rogue and completedq(1886)
step
click Andron's Bookshelf##103600
collect Andron's Ledger##7294 |q 1899/1 |goto Undercity 55.42,77.05
|only if Scourge Rogue and completedq(1886)
step
talk Mennet Carkad##6467
turnin The Deathstalkers##1899 |goto Undercity 83.51,69.11
accept The Deathstalkers##1978 |goto Undercity 65.53,79.73
|only if Scourge Rogue and completedq(1886)
step
talk Varimathras##2425
turnin The Deathstalkers##1978 |goto Undercity 59.75,84.64
|only if Scourge Rogue and completedq(1886)
step
talk Anastasia Hartwell##4568
turnin The Balnir Farmstead##1882 |goto Undercity/0 85.14,10.01
|only if Scourge Mage
step
talk Deathguard Linnea##1495
turnin Rear Guard Patrol##356 |goto Tirisfal Glades 65.49,60.25
step
talk Gunther Arcanus##1497
turnin Return the Book##366 |goto Tirisfal Glades 68.20,41.92
accept Proving Allegiance##409 |goto Tirisfal Glades 68.20,41.92
stickystop "Astor_Hadren"
step
click Crate of Candles##1586
|tip Complete the "Candles of Beckoning" quest.
collect Candle of Beckoning##3080 |goto Tirisfal Glades 68.16,42.02 |q 409
step
click Lillith's Dinner Table##1557
|tip Complete the "Dormant Shade" quest.
kill Lillith Nefara##1946 |q 409/1 |goto Tirisfal Glades 66.64,44.89
step
talk Gunther Arcanus##1497
turnin Proving Allegiance##409 |goto Tirisfal Glades 68.20,41.92
accept The Prodigal Lich Returns##411 |goto Tirisfal Glades 68.20,41.92
step
kill Captain Melrache##1665 |q 372/1 |goto Tirisfal Glades 79.60,25.20
|tip Inside the tower.
|tip He has two guards but they are very weak.
|tip Focus the bodyguards down first, don't be afraid to run away and reset the fight after killing one to make it easier.
|tip An enemy patrols around the tower, kill it first.
|tip Grind en route to this quest, we want to be level 12 soon.
step
kill 2 Scarlet Bodyguard##1660 |q 372/2 |goto Tirisfal Glades 79.60,25.20
step
talk Innkeeper Renee##5688
|tip Inside the building.
Stock up on Food and Water |vendor Innkeeper Renee##5688 |goto Tirisfal Glades 61.71,52.05 |q 411
step
talk Mrs. Winters##2134
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mrs. Winters##2134 |goto Tirisfal Glades 61.16,52.60 |q 411
step
talk Executor Zygand##1515
turnin At War With The Scarlet Crusade##372 |goto Tirisfal Glades 60.58,51.77
step
talk Selina Weston##3548
|tip Selina can sell Lesser Healing Potions.
|tip They are a limited item and may not be in stock if other players bought them recently.
|tip There are difficult quests ahead you will want these for.
Check for Potions |vendor Selina Weston##3548 |goto Tirisfal Glades/0 61.76,50.03 |q 411
step
label "Astor_Hadren"
map Tirisfal Glades
path follow strictbounce; loop on; ants curved; dist 30; markers none
path	61.54,53.28	61.82,54.57	62.45,55.57	63.15,55.72	63.70,57.49
path	63.73,58.70	63.25,60.21	61.55,61.86	60.41,62.86	58.50,64.26
path	56.97,64.96	56.30,65.64	55.89,66.67	55.39,69.16	54.93,72.43
path	54.42,74.90
map Silverpine Forest
path	67.49,5.64 	66.23,7.46	64.34,9.06	61.22,11.04	58.39,12.07
path	57.10,12.99	55.44,15.44	53.08,20.60	51.92,22.43	49.96,26.91
path	49.76,28.79	49.71,32.93	50.09,34.10	50.87,35.49	51.10,36.76
path	48.42,38.77	47.03,40.57
kill Astor Hadren##6497
|tip He walks along the road between Brill in Tirisfal Glades, and The Sepulcher in Silverpine Forest.
|tip The fight can be tough, so be ready to use potions if available.
|tip He's level 13, but you should be able to kill him at this level.
collect Astor's Letter of Introduction##7231 |q 1886/1
|only if Scourge Rogue
stickystart "Collect_Discolored_Worg_Hearts"
step
Enter the building |goto Silverpine Forest 56.30,9.25 < 10 |walk
talk Deathstalker Erland##1978
|tip Inside the building.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept Escorting Erland##435 |goto Silverpine Forest 56.19,9.18 |noautoaccept
step
Watch the dialogue
|tip Follow Deathstalker Erland and protect him as he walks.
|tip He eventually walks to this location.
Erland Must Reach Rane Yorick |q 435/1 |goto Silverpine Forest 54.30,13.43
step
talk Rane Yorick##1950
turnin Escorting Erland##435 |goto Silverpine Forest 53.46,13.43
accept The Deathstalkers' Report##449 |goto Silverpine Forest 53.46,13.43
accept Wild Hearts##429 |goto Silverpine Forest 53.46,13.42
step
label "Collect_Discolored_Worg_Hearts"
Kill Worg enemies around this area
'|kill Mottled Worg##1766, Worg##1765
|tip They look like black wolves.
|tip Go out of your way to kill these, the drop rate is low.
|tip You will kill 7~ Worgs during the escort quest soon. You should get 2~ hearts from this.
collect 6 Discolored Worg Heart##3164 |goto Silverpine Forest 57.05,11.75 |q 429 |future
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[60.92,11.16]
[65.26,8.37]
step
Follow the road |goto Silverpine Forest 48.24,38.96 < 50 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.60
step
talk Karos Razok##2226
|tip We are opening the flight map to let the guide learn that you have the Undercity flight path already.
fpath Undercity |goto Silverpine Forest 45.62,42.60
step
talk Dalar Dawnweaver##1938
|tip He walks around this area.
accept Prove Your Worth##421 |goto Silverpine Forest 44.20,39.78
step
talk Shadow Priest Allister##2121
accept Border Crossings##477 |goto Silverpine Forest 43.98,40.93
step
talk Deathguard Podrig##6389
accept Supplying the Sepulcher##6321 |goto Silverpine Forest 43.43,41.68
|only if Scourge
step
Enter the crypt |goto Silverpine Forest 43.09,41.39 < 10 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin The Deathstalkers' Report##449 |goto Silverpine Forest 43.43,40.87
accept Speak with Renferrel##3221 |goto Silverpine Forest 43.43,40.87
accept The Dead Fields##437 |goto Silverpine Forest 43.43,40.87
step
talk Apothecary Renferrel##1937
|tip Leave the crypt.
turnin Delivery to Silverpine Forest##445 |goto Silverpine Forest 42.80,40.86 |only if haveq(445) or completedq(445)
accept A Recipe For Death##447 |goto Silverpine Forest 42.80,40.86
turnin Wild Hearts##429 |goto Silverpine Forest 42.80,40.86
accept Return to Quinn##430 |goto Silverpine Forest 42.80,40.86
turnin Speak with Renferrel##3221 |goto Silverpine Forest 42.80,40.86
accept Zinge's Delivery##1359 |goto Silverpine Forest 42.80,40.86
step
talk Edwin Harly##2140
|tip If you can afford it, and you need more bag space, buy bags.
|tip He can also sell more healing potions if you're running low.
Visit the Vendor |vendor Edwin Harly##2140 |goto Silverpine Forest 43.98,39.90 |q 6321
step
talk Karos Razok##2226
turnin Supplying the Sepulcher##6321 |goto Silverpine Forest 45.62,42.60
accept Ride to the Undercity##6323 |goto Silverpine Forest 45.62,42.60
|only if Scourge
stickystart "Collect_Grizzled_Bear_Hearts"
step
kill 5 Moonrage Whitescalp##1769 |q 421/1 |goto Silverpine Forest 49.54,35.83
You can find more around: |notinsticky
[Silverpine Forest 50.87,41.75]
[Silverpine Forest 53.89,39.63]
[Silverpine Forest 54.54,43.80]
[Silverpine Forest 52.26,47.97]
step
Kill enemies around this area
ding 12 |goto Silverpine Forest 49.54,35.83
You can find more around: |notinsticky
[50.87,41.75]
[53.89,39.63]
[54.54,43.80]
[52.26,47.97]
step
Follow the road |goto Silverpine Forest 47.13,40.41 < 30 |only if walking
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Prove Your Worth##421 |goto Silverpine Forest 44.20,39.78
accept Arugal's Folly##422 |goto Silverpine Forest 44.20,39.78
step
Follow the road |goto Silverpine Forest 46.29,41.44 < 35 |only if walking
Cross the bridge |goto Silverpine Forest 49.74,30.06 < 15 |only if walking
Enter the building |goto Silverpine Forest 52.81,27.80 < 7 |walk
click Dusty Spellbooks
|tip Upstairs inside the building.
|tip You will be attacked after you loot it.
collect Remedy of Arugal##3155 |q 422/1 |goto Silverpine Forest 52.82,28.58
step
Enter the building |goto Silverpine Forest 53.40,13.27 < 7 |walk
talk Quinn Yorick##1951
|tip Upstairs inside the building.
turnin Return to Quinn##430 |goto Silverpine Forest 53.43,12.59
step
talk Rane Yorick##1950
|tip Outside the building.
accept Ivar the Foul##425 |goto Silverpine Forest 53.46,13.43
step
Enter the building |goto Silverpine Forest 52.00,14.07 < 7 |walk
kill Ivar the Foul##1971
|tip Inside the building.
|tip There are three ghouls inside the building with him, but one occasionally patrols to the front of the barn.
|tip Wait for that one to patrol out and kill it alone so you only have to deal with the two extra enemy.
|tip One of the remaining ghouls also moves a bit and can be lured out separately.
collect Ivar's Head##3621 |q 425/1 |goto Silverpine Forest 51.53,13.91
step
talk Rane Yorick##1950
turnin Ivar the Foul##425 |goto Silverpine Forest 53.46,13.43
stickystart "Collect_Essence_Of_Nightlash"
step
_Note_
|tip A level 25 elite called "Son of Arugal" patrols around this next quest area.
|tip He looks like a worgen and slowly walks around.
|tip Keep your head on a swivel and do not aggro him, you will almost certainly die.
Click Here If You Understand |confirm
|only if hardcore and haveq(437)
step
Enter the Dead Fields |q 437/2 |goto Silverpine Forest 45.44,21.01
step
label "Collect_Essence_Of_Nightlash"
Kill Rot Hide enemies around this area
|tip They look like gnolls.
kill Nightlash##1983
|tip She will eventually spawn at this location, once you've killed enough Rot Hide enemies.
collect Essence of Nightlash##3622 |q 437/1 |goto Silverpine Forest 45.44,21.01
stickystart "Collect_Skittering_Blood"
step
label "Collect_Grizzled_Bear_Hearts"
Kill Grizzled Bear enemies around this area
|tip Be careful of the elite worgen that walks around this area. |notinsticky
collect 6 Grizzled Bear Heart##3253 |q 447/1 |goto Silverpine Forest 42.56,18.47
You can find more around: |notinsticky
[39.31,16.15]
[34.99,16.68]
step
label "Collect_Skittering_Blood"
kill Moss Stalker##1780+
|tip Inside and outside the mine.
|tip Be careful of the elite worgen that walks around this area. |notinsticky
collect 6 Skittering Blood##3254 |q 447/2 |goto Silverpine Forest 35.65,13.58
|tip It's possible your bags start to get full doing this quest. |notinsticky
Theres a nearby vendor here: |notinsticky
[33.00,17.84]
step
Kill enemies around this area
|tip Inside and outside the mine.
|tip Watch for respawns while in the area.	|only if hardcore
ding 13 |goto Silverpine Forest 35.65,13.58
step
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Silverpine Forest 35.65,13.58 |q 447
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Silverpine Forest/0 44.31,41.51 |q 447 |zombiewalk
|only if not hardcore
step
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Arugal's Folly##422 |goto Silverpine Forest/0 44.20,39.78
accept Arugal's Folly##423 |goto Silverpine Forest/0 44.20,39.78
step
Enter the crypt |goto Silverpine Forest/0 43.09,41.39 < 10 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin The Dead Fields##437 |goto Silverpine Forest/0 43.43,40.87
accept The Decrepit Ferry##438 |goto Silverpine Forest/0 43.43,40.87
step
click Corpse Laden Boat##1593
|tip Be very careful navigating to the boat, the enemies around here are high level. |only if hardcore
turnin The Decrepit Ferry##438 |goto Silverpine Forest/0 58.39,34.84
accept Rot Hide Clues##439 |goto Silverpine Forest/0 58.39,34.84
stickystart "Collect_Glutton_Shackles"
step
Follow the path |goto Silverpine Forest/0 54.00,37.86 < 30 |only if walking
kill Moonrage Darksoul##1782+
|tip Inside and outside the mine.
|tip Watch for patrols and respawns.	|only if hardcore
collect 3 Darksoul Shackle##3157 |q 423/2 |goto Silverpine Forest/0 56.54,46.02
step
label "Collect_Glutton_Shackles"
kill Moonrage Glutton##1779+
|tip Inside and outside the mine. |notinsticky
|tip Watch for patrols and respawns.	|only if hardcore |notinsticky
collect 6 Glutton Shackle##3156 |q 423/1 |goto Silverpine Forest/0 56.54,46.02
step
click Dalaran Crate##1627
|tip Clear a safe space around the camp. This quest can be deadly.
|tip You will almost always pull atleast 2 of the mages at once. If you pull 3, run away immediately.
|tip Pulling 2 is fairly safe, just use a healing potion.
|tip Do not pull the second pair of 2 mages until your potion is off cooldown, you should have time before the mobs respawn.
|tip If you do not have 2 healing potions, consider asking for help in chat.
turnin Border Crossings##477 |goto Silverpine Forest/0 49.91,60.32
accept Maps and Runes##478 |goto Silverpine Forest/0 49.91,60.32
step
talk Shadow Priest Allister##2121
turnin Maps and Runes##478 |goto Silverpine Forest/0 43.98,40.93
accept Dalar's Analysis##481 |goto Silverpine Forest/0 43.98,40.93
step
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Arugal's Folly##423 |goto Silverpine Forest/0 44.19,39.78
turnin Dalar's Analysis##481 |goto Silverpine Forest/0 44.19,39.78
accept Dalaran's Intentions##482 |goto Silverpine Forest/0 44.19,39.78
step
talk Shadow Priest Allister##2121
turnin Dalaran's Intentions##482 |goto Silverpine Forest/0 43.98,40.93
step
Enter the crypt |goto Silverpine Forest/0 43.08,41.39 < 10 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin Rot Hide Clues##439 |goto Silverpine Forest/0 43.43,40.87
accept The Engraved Ring##440 |goto Silverpine Forest/0 43.43,40.87
step
Kill enemies around this area
ding 14 |goto Silverpine Forest/0 52.81,33.14
step
Enter the building |goto Tirisfal Glades 60.90,51.51 < 10 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
|tip If your hearth is not still set to Brill, skip this step.
|tip You will turn it in later.
turnin The Engraved Ring##440 |goto Tirisfal Glades 61.26,50.85
accept Raleigh and the Undercity##441 |goto Tirisfal Glades 61.26,50.85
step
talk Gordon Wendham##4556
|tip Upstairs inside Undercity.
turnin Ride to the Undercity##6323 |goto Undercity 61.49,41.80
accept Michael Garrett##6322 |goto Undercity 61.49,41.80
|only if Scourge
step
talk Michael Garrett##4551
turnin Michael Garrett##6322 |goto Undercity 63.26,48.56
|only if Scourge
step
talk Raleigh Andrean##2050
turnin Raleigh and the Undercity##441 |goto Undercity 61.99,42.72
|only if haveq(441)
step
talk Bethor Iceshard##1498
turnin The Prodigal Lich Returns##411 |goto Undercity 84.07,17.45
step
talk Mennet Carkad##6467
turnin The Deathstalkers##1886 |goto Undercity 83.51,69.11
accept The Deathstalkers##1898 |goto Undercity 83.51,69.11
|only if Scourge Rogue and itemcount(7231) > 0
step
talk Andron Gant##6522
turnin The Deathstalkers##1898 |goto Undercity 54.82,76.30
accept The Deathstalkers##1899 |goto Undercity 54.82,76.30
|only if Scourge Rogue and completedq(1886)
step
click Andron's Bookshelf##103600
collect Andron's Ledger##7294 |q 1899/1 |goto Undercity 55.42,77.05
|only if Scourge Rogue and completedq(1886)
step
talk Mennet Carkad##6467
turnin The Deathstalkers##1899 |goto Undercity 83.51,69.11
accept The Deathstalkers##1978 |goto Undercity 65.53,79.73
|only if Scourge Rogue and completedq(1886)
step
talk Varimathras##2425
turnin The Deathstalkers##1978 |goto Undercity 59.75,84.64
|only if Scourge Rogue and completedq(1886)
step
Follow the path down |goto Undercity 52.84,77.62 < 7 |walk
talk Master Apothecary Faranell##2055
turnin A Recipe For Death##447 |goto Undercity 48.82,69.29
step
talk Apothecary Zinge##5204
turnin Zinge's Delivery##1359 |goto Undercity 50.13,67.99
accept Sample for Helbrim##1358 |goto Undercity 50.13,67.99
step
Enter the building |goto Tirisfal Glades 60.90,51.51 < 10 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
|tip It is no longer convenient to turn in Raleigh and the Undercity so we are skipping it.
turnin The Engraved Ring##440 |goto Tirisfal Glades 61.26,50.85
|only if haveq(440)
step
Enter Orgrimmar |goto Durotar 45.52,12.07 < 20 |only if walking
Enter the building |goto Orgrimmar 47.53,65.22 < 7 |only if walking
talk Doras##3310
|tip At the top of the tower.
fpath Orgrimmar |goto Orgrimmar 45.12,63.89
step
talk Therzok##6446
|tip Inside the Cleft of Shadow.
accept The Shattered Hand##1963 |goto Orgrimmar 42.73,53.55
|only if Orc Rogue or Troll Rogue
step
Follow the road |goto Durotar 52.38,33.50 < 30 |only if walking
Follow the road |goto Durotar 52.23,42.43 < 30 |only if walking
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar 50.85,43.59
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Tauren Starter (1-12)',
  {
    image = ZGV.IMAGESDIR .. 'Mulgore',
    condition_suggested = function()
      return raceclass('Tauren') and level <= 12
    end,
    condition_suggested_race = function()
      return raceclass('Tauren')
    end,
    condition_suggested_exclusive = true,
    next = 'Leveling Guides\\The Barrens (12-18)',
    hardcore = true,
  },
  [[
step
talk Grull Hawkwind##2980
accept The Hunt Begins##747 |goto Mulgore 44.87,77.08
step
kill 2 Plainstrider##2955 |q 747 |goto Mulgore 45.94,82.61
|tip Loot them for 10 copper worth of vendor items.
|tip This will let you train a spell early.
|tip This substantially increases your leveling speed and is worth the detour.
|only if Warrior or Shaman
step
talk Kawnie Softbreeze##3072
|tip Acquire 10 copper, sell your armor if you have to.
Visit the Vendor |vendor Kawnie Softbreeze##3072 |q 747 |goto Mulgore/0 45.29,76.52
|only if Warrior or Shaman
step
talk Meela Dawnstrider##3062
|tip Inside the building.
|tip You will need 10 copper to learn this spell.
learnspell Rockbiter Weapon##8017 |goto Mulgore 45.01,75.94
|only if Shaman
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
|tip You will need 10 copper to learn this spell.
Select _"I require warrior training."_ |gossip 96162
learn Battle Shout##6673 |goto Mulgore 44.01,76.13
|only if Warrior
step
Enter the building |goto Mulgore 44.32,76.21 < 7 |walk
talk Chief Hawkwind##2981
|tip Inside the building.
accept A Humble Task##752 |goto Mulgore 44.18,76.06
stickystart "Collect_Plainstrider_Meat"
stickystart "Collect_Plainstrider_Feathers"
step
talk Greatmother Hawkwind##2991
turnin A Humble Task##752 |goto Mulgore 50.03,81.16
accept A Humble Task##753 |goto Mulgore 50.03,81.16
step
click Water Pitcher
|tip It's on the well.
collect Water Pitcher##4755 |q 753/1 |goto Mulgore 50.21,81.36
step
label "Collect_Plainstrider_Meat"
kill Plainstrider##2955+
collect 7 Plainstrider Meat##4739 |q 747/1 |goto Mulgore 45.94,82.61
step
label "Collect_Plainstrider_Feathers"
kill Plainstrider##2955+
collect 7 Plainstrider Feather##4740 |q 747/2 |goto Mulgore 45.94,82.61
step
Kill enemies around this area
ding 2 |goto Mulgore 45.94,82.61
step
talk Grull Hawkwind##2980
turnin The Hunt Begins##747 |goto Mulgore 44.87,77.08
accept Simple Note##3091 |goto Mulgore 44.87,77.08			|only Tauren Warrior
accept Rune-Inscribed Note##3093 |goto Mulgore 44.87,77.08		|only Tauren Shaman
accept Etched Note##3092 |goto Mulgore 44.87,77.08			|only Tauren Hunter
accept Verdant Note##3094 |goto Mulgore 44.87,77.08			|only Tauren Druid
accept The Hunt Continues##750 |goto Mulgore 44.87,77.08
step
talk Kawnie Softbreeze##3072
collect 800 Light Shot##2516 |only if Hunter
Visit the Vendor |vendor Kawnie Softbreeze##3072 |q 750 |goto Mulgore/0 45.29,76.52
step
Enter the building |goto Mulgore 44.32,76.21 < 7 |walk
talk Chief Hawkwind##2981
|tip Inside the building.
turnin A Humble Task##753 |goto Mulgore 44.18,76.06
accept Rites of the Earthmother##755 |goto Mulgore 44.18,76.06
step
kill Mountain Cougar##2961+
collect 10 Mountain Cougar Pelt##4742 |q 750/1 |goto Mulgore 48.29,90.11
You can find more around: |notinsticky
[Mulgore 45.06,90.93]
[Mulgore 42.05,88.44]
step
talk Seer Graytongue##2982
turnin Rites of the Earthmother##755 |goto Mulgore 42.58,92.18
accept Rite of Strength##757 |goto Mulgore 42.58,92.18
step
Kill enemies around this area
|tip This is so we reach level 4 when we return to town.
ding 3,1150 |goto Mulgore 48.29,90.11
You can find more around: |notinsticky
[45.06,90.93]
[42.05,88.44]
step
talk Grull Hawkwind##2980
turnin The Hunt Continues##750 |goto Mulgore 44.87,77.08
accept The Battleboars##780 |goto Mulgore 44.87,77.08
step
talk Seer Ravenfeather##5888
accept Call of Earth##1519 |goto Mulgore 44.73,76.18
|only if Tauren Shaman
step
talk Meela Dawnstrider##3062
turnin Rune-Inscribed Note##3093 |goto Mulgore 45.01,75.94
learnspell Earth Shock##8042
|only if Tauren Shaman
step
talk Harutt Thunderhorn##3059
|tip Inside the building.
turnin Simple Note##3091 |goto Mulgore 44.01,76.13
learnspell Rend##772 |goto Mulgore 44.01,76.13
learnspell Charge##100 |goto Mulgore 44.01,76.13
|only if Tauren Warrior
step
talk Gart Mistrunner##3060
|tip Inside the building.
turnin Verdant Note##3094 |goto Mulgore 45.09,75.93
learnspell Moonfire##8921 |goto Mulgore 45.09,75.93
|tip We do not recommend learning Rejuvenation unless you will be giving yourself money from another character.
|tip It is better to save for a weapon upgrade soon.
|only if Tauren Druid
step
talk Lanka Farshot##3061
|tip Inside the building.
turnin Etched Note##3092 |goto Mulgore 44.26,75.69
learnspell Serpent Sting##1978 |goto Mulgore 44.26,75.69
|only if Tauren Hunter
step
talk Brave Windfeather##3209
|tip She walks around this area.
accept Break Sharptusk!##3376 |goto Mulgore 44.94,77.04
stickystart "Collect_Battleboar_Flanks"
step
kill Battleboar##2966+
collect 8 Battleboar Snout##4848 |q 780/1 |goto Mulgore 55.97,83.14
You can find more around [Mulgore 56.89,87.89]
step
label "Collect_Battleboar_Flanks"
kill Battleboar##2966+
collect 8 Battleboar Flank##4849 |q 780/2 |goto Mulgore 55.97,83.14
You can find more around [56.89,87.89]
step
Kill enemies around this area
|tip This is to shorten a grind step later.
ding 4,1500 |goto Mulgore 55.97,83.14
You can find more around [56.89,87.89]
stickystart "Collect_Bristleback_Belts"
stickystart "Collect_Ritual_Salves"
stickystart "Learn_Chimera_Shot_Tauren_Hunter"
step
Enter the tunnel |goto Mulgore 58.15,85.02 < 15 |only if walking
Leave the tunnel |goto Mulgore 59.69,83.29 < 15 |only if walking
Follow the path |goto Mulgore 62.65,80.87 < 20 |only if walking
Continue following the path |goto Mulgore 62.60,78.75 < 20 |only if walking
Enter the building |goto Mulgore 64.28,77.98 < 15 |walk
kill Chief Sharptusk Thornmantle##8554
|tip Inside the building.
collect Chief Sharptusk Thornmantle's Head##10459 |q 3376/1 |goto Mulgore 64.70,77.66
step
Enter the cave |goto Mulgore 63.44,82.01 < 15 |walk
click Dirt-stained Map##3076
|tip Inside the cave.
collect Dirt-stained Map##4851 |n
use the Dirt-stained Map##4851
accept Attack on Camp Narache##781 |goto Mulgore 63.24,82.70
step
label "Collect_Ritual_Salves"
kill Bristleback Shaman##2953+
|tip They can be pretty spread out around this area.
collect 2 Ritual Salve##6634 |q 1519/1 |goto Mulgore 63.87,80.34
You can find more around [Mulgore 59.92,75.65]
|only if Tauren Shaman
step
label "Collect_Bristleback_Belts"
Kill Bristleback enemies around this area
collect 12 Bristleback Belt##4770 |q 757/1 |goto Mulgore 63.58,78.00
step
Kill Enemies in the area
|tip This is to ensure we hit level 6 in town
ding 5,880 |goto Mulgore 63.58,78.00
step
talk Grull Hawkwind##2980
turnin The Battleboars##780 |goto Mulgore 44.87,77.08
step
talk Brave Windfeather##3209
|tip She walks around this area.
turnin Break Sharptusk!##3376 |goto Mulgore 44.94,77.04
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1519 |goto Mulgore 44.73,76.19
accept Call of Earth##1520 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
Enter the building |goto Mulgore 44.32,76.21 < 7 |walk
talk Chief Hawkwind##2981
|tip Inside the building.
turnin Attack on Camp Narache##781 |goto Mulgore 44.18,76.06
turnin Rite of Strength##757 |goto Mulgore 44.18,76.06
accept Rites of the Earthmother##763 |goto Mulgore 44.18,76.06
step
use the Earth Sapta##6635
|tip Use it next to the huge rock.
talk the Minor Manifestation of Earth##5891
turnin Call of Earth##1520 |goto Mulgore 53.88,80.56
accept Call of Earth##1521 |goto Mulgore 53.88,80.56
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1521 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
Follow the path |goto Mulgore 39.45,82.40 < 20 |only if walking
talk Antur Fallow##6775
accept A Task Unfinished##1656 |goto Mulgore 38.52,81.56
step
talk Ruul Eagletalon##2985
|tip Grind en route.
|tip You want 4s 18c when arriving in town to buy a weapon upgrade. |only if Hunter
accept Dangers of the Windfury##743 |goto Mulgore 47.36,62.02
step
talk Baine Bloodhoof##2993
turnin Rites of the Earthmother##763 |goto Mulgore 47.52,60.17
accept Sharing the Land##745 |goto Mulgore 47.52,60.17
accept Rite of Vision##767 |goto Mulgore 47.52,60.17
accept Dwarven Digging##746 |goto Mulgore 47.52,60.17
step
Enter the building |goto Mulgore 46.82,60.55 < 7 |walk
talk Innkeeper Kauth##6747
|tip Inside the building.
turnin A Task Unfinished##1656 |goto Mulgore 46.62,61.09
step
talk Innkeeper Kauth##6747
|tip Inside the building.
|tip Stock up on food and water, there is a lot of grinding ahead.
home Bloodhoof Village |goto Mulgore 46.62,61.09 |q 860 |future
step
talk Mull Thunderhorn##2948
accept Poison Water##748 |goto Mulgore 48.53,60.40
|only if Tauren
step
talk Harken Windtotem##2947
|tip Inside the building.
accept Swoop Hunting##761 |goto Mulgore 48.71,59.33
step
talk Zarlman Two-Moons##3054
turnin Rite of Vision##767 |goto Mulgore 47.76,57.54
accept Rite of Vision##771 |goto Mulgore 47.76,57.54
step
talk Maur Raincaller##3055
accept Mazzranache##766 |goto Mulgore 46.99,57.07
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 766
|only if Tauren Warrior and itemcount(2493) == 0
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Kennah Hawkseye##3078
|tip Inside the building.
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kennah Hawkseye##3078 |goto Mulgore 45.49,58.47 |q 766
|only if Tauren Hunter and itemcount(2509) == 0
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 766
|only if Tauren Shaman and itemcount(2495) == 0
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 766
|only if Tauren Druid and itemcount(2495) == 0
stickystart "Collect_Plainstrider_Scales"
stickystart "Collect_Swoop_Gizzards"
stickystart "Collect_Ambercorns"
stickystart "Collect_Trophy_Swoop_Quills"
stickystart "Collect_Prairie_Wolf_Paws"
stickystart "Collect_Plainstrider_Talons"
step
kill Prairie Wolf##2958+
collect Prairie Wolf Heart##4804 |q 766/1 |goto Mulgore 39.77,60.43
You can find more around [Mulgore 39.61,54.74]
step
label "Collect_Plainstrider_Scales"
kill Adult Plainstrider##2956+
collect Plainstrider Scale##4806 |q 766/3 |goto Mulgore 39.77,60.43
You can find more around [39.61,54.74]
step
label "Collect_Prairie_Wolf_Paws"
kill Prairie Wolf##2958+
collect 6 Prairie Wolf Paw##4758 |q 748/1 |goto Mulgore 39.77,60.43
You can find more around [39.61,54.74]
|only if Tauren	and itemcount(4804) > 0
step
label "Collect_Plainstrider_Talons"
kill Adult Plainstrider##2956+
collect 4 Plainstrider Talon##4759 |q 748/2 |goto Mulgore 39.77,60.43
You can find more around [39.61,54.74]
|only if Tauren	and itemcount(4806) > 0
stickystop "Collect_Trophy_Swoop_Quills"
stickystop "Collect_Ambercorns"
stickystop "Collect_Swoop_Gizzards"
step
talk Mull Thunderhorn##2948
turnin Poison Water##748 |goto Mulgore 48.53,60.39
|only if Tauren
step
Watch the dialogue
talk Mull Thunderhorn##2948
accept Winterhoof Cleansing##754 |goto Mulgore 48.53,60.40
|only if Tauren
step
talk Harken Windtotem##2947
|tip Inside the building.
turnin Swoop Hunting##761 |goto Mulgore 48.71,59.33
|only if readyq(761)
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Warrior and itemcount(2493) == 0
step
talk Kennah Hawkseye##3078
|tip Inside the building.
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kennah Hawkseye##3078 |goto Mulgore 45.49,58.47 |q 771
|only if Tauren Hunter and itemcount(2509) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Shaman and itemcount(2495) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Druid and itemcount(2495) == 0
step
talk Moorat Longstride##3076
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Moorat Longstride##3076 |goto Mulgore 45.86,57.66 |q 771
stickystart "Collect_Ambercorns"
step
click Well Stone+
|tip They look like flat grey rocks on the ground around this area.
collect 2 Well Stone##4808 |q 771/1 |goto Mulgore 53.50,66.20
step
use the Winterhoof Cleansing Totem##5411
Cleanse the Winterhoof Water Well |q 754/1 |goto Mulgore 53.64,66.15
|only if Tauren
stickystart "Kill_Palemane_Skinners"
stickystart "Kill_Palemane_Tanners"
step
kill 5 Palemane Poacher##2951 |q 745/3 |goto Mulgore 53.94,72.53
|tip Beware Snagglespear, he is a rare spawn level 9 that does a lot of damage.
You can find more around [48.08,71.60]
step
label "Kill_Palemane_Skinners"
kill 8 Palemane Skinner##2950 |q 745/2 |goto Mulgore 53.94,72.53
You can find more around [48.08,71.60]
step
label "Kill_Palemane_Tanners"
kill 10 Palemane Tanner##2949 |q 745/1 |goto Mulgore 53.94,72.53
You can find more around [48.08,71.60]
step
label "Collect_Ambercorns"
click Ambercorn##2912+
|tip They look like small brown pine cones on the ground near trees around this area.
collect 2 Ambercorn##4809 |q 771/2 |goto Mulgore 38.83,59.75
You can find another one at [38.83,59.75]
step
Kill enemies around this area
ding 8 |goto Mulgore 53.94,72.53
You can find more around [48.08,71.60]
step
talk Mull Thunderhorn##2948
turnin Winterhoof Cleansing##754 |goto Mulgore 48.53,60.39
accept Thunderhorn Totem##756 |goto Mulgore 48.53,60.39
|only if Tauren
step
talk Baine Bloodhoof##2993
turnin Sharing the Land##745 |goto Mulgore 47.51,60.16
step
talk Vira Younghoof##5939
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Mulgore 46.80,60.85
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats or zeppelins, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 771
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Moorat Longstride##3076
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Moorat Longstride##3076 |goto Mulgore 45.86,57.66 |q 771
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Warrior and itemcount(2493) == 0
step
talk Kennah Hawkseye##3078
|tip Inside the building.
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kennah Hawkseye##3078 |goto Mulgore 45.49,58.47 |q 771
|only if Tauren Hunter and itemcount(2509) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Shaman and itemcount(2495) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 771
|only if Tauren Druid and itemcount(2495) == 0
step
talk Zarlman Two-Moons##3054
turnin Rite of Vision##771 |goto Mulgore 47.76,57.54
accept Rite of Vision##772 |goto Mulgore 47.76,57.54
|tip You don't need to follow the wolf that appears.
step
map Mulgore
path follow strict; loop on; ants curved; dist 30
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45	57.37,61.24	56.19,61.05	54.83,60.54	53.08,60.28
path	51.94,59.61
talk Morin Cloudstalker##2988
|tip He walks along the road around this area.
accept The Ravaged Caravan##749
stickystart "Collect_Cougar_Claws"
stickystart "Collect_Stalker_Claws"
stickystart "Collect_Trophy_Swoop_Quills"
stickystart "Collect_Swoop_Gizzards"
step
click Sealed Supply Crate
turnin The Ravaged Caravan##749 |goto Mulgore 53.74,48.18
accept The Ravaged Caravan##751 |goto Mulgore 53.74,48.18
step
kill Flatland Cougar##3035+
collect Flatland Cougar Femur##4805 |q 766/2 |goto Mulgore 46.78,40.19
You can find more around: |notinsticky
[51.33,35.52]
[37.14,43.56]
step
label "Collect_Cougar_Claws"
kill Flatland Cougar##3035+
collect 6 Cougar Claws##4802 |q 756/2 |goto Mulgore 46.78,40.19
You can find more around: |notinsticky
[51.33,35.52]
[37.14,43.56]
|only if Tauren	and itemcount(4805) > 0
step
label "Collect_Stalker_Claws"
kill Prairie Stalker##2959+
collect 6 Stalker Claws##4801 |q 756/1 |goto Mulgore 46.78,40.19
You can find more around: |notinsticky
[51.33,35.52]
[37.14,43.56]
|only if Tauren
step
label "Collect_Swoop_Gizzards"
kill Wiry Swoop##2969+
|tip They are pretty spread out around this area.
|tip You can find more to the north and south.
collect Swoop Gizzard##4807 |q 766/4 |goto Mulgore 39.77,60.43
You can find more around [39.61,54.74]
step
label "Collect_Trophy_Swoop_Quills"
kill Wiry Swoop##2969+
|tip They are pretty spread out around this area.
|tip You can find more to the north and south.
collect 8 Trophy Swoop Quill##4769 |q 761/1 |goto Mulgore 39.77,60.43
You can find more around [39.61,54.74]
|only if itemcount(4807) > 0
step
Kill enemies around this area
|tip This is to ensure you hit level 9 soon.
ding 8,2500 |goto Mulgore 46.78,40.19
You can find more around: |notinsticky
[51.33,35.52]
[37.14,43.56]
step
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |q 766
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore 46.41,55.57 |q 766 |zombiewalk
|only if not hardcore
step
talk Maur Raincaller##3055
turnin Mazzranache##766 |goto Mulgore 46.98,57.07
step
talk Harken Windtotem##2947
|tip Inside the building.
turnin Swoop Hunting##761 |goto Mulgore 48.71,59.33
|only if readyq(761)
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Totem##756 |goto Mulgore 48.53,60.40
|only if Tauren
step
Watch the dialogue
talk Mull Thunderhorn##2948
accept Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
|only if Tauren
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Moorat Longstride##3076
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Moorat Longstride##3076 |goto Mulgore 45.86,57.66 |q 751
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 751
|only if Tauren Warrior and itemcount(2493) == 0
step
talk Kennah Hawkseye##3078
|tip Inside the building.
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kennah Hawkseye##3078 |goto Mulgore 45.49,58.47 |q 751
|only if Tauren Hunter and itemcount(2509) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 751
|only if Tauren Shaman and itemcount(2495) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 751
|only if Tauren Druid and itemcount(2495) == 0
step
talk Innkeeper Kauth##6747
|tip Inside the building.
|tip Stock up on food and water.
Visit the Vendor |vendor Innkeeper Kauth##6747 |q 746 |goto Mulgore 46.62,61.09
step
use the Thunderhorn Cleansing Totem##5415
Cleanse the Thunderhorn Water Well |q 758/1 |goto Mulgore 44.59,45.43
|only if Tauren
step
Kill Bael'dun enemies around this area
collect 5 Prospector's Pick##4702 |goto Mulgore 31.26,49.84 |q 746
You can find more around [31.97,48.76]
step
Smash the Prospector's Picks at the forge
collect 5 Broken Tools##4703 |goto Mulgore 31.26,49.84 |q 746
step
Kill Windfury enemies around this area
collect 8 Windfury Talon##4751 |q 743/1 |goto Mulgore 33.97,41.87
You can find more around: |notinsticky
[32.17,42.16]
step
Follow the path up |goto Mulgore 34.46,37.31 < 30 |only if walking
Enter the cave |goto Mulgore 33.31,36.45 < 10 |walk
talk Seer Wiserunner##2984
|tip Inside the cave.
turnin Rite of Vision##772 |goto Mulgore 32.72,36.09
accept Rite of Wisdom##773 |goto Mulgore 32.72,36.09
step
talk Lorekeeper Raintotem##3233
trash Water of the Seers##4823
|tip You will never use the water, it is safe to destroy it.
|tip Grind en route.
accept A Sacred Burial##833 |goto Mulgore 59.86,25.63
stickystart "Kill_Bristleback_Interlopers"
step
talk Ancestral Spirit##2994
turnin Rite of Wisdom##773 |goto Mulgore 61.45,21.02
accept Journey into Thunder Bluff##775 |goto Mulgore 61.45,21.02
step
label "Kill_Bristleback_Interlopers"
kill 8 Bristleback Interloper##3232 |q 833/1 |goto Mulgore 61.22,21.26
step
talk Lorekeeper Raintotem##3233
turnin A Sacred Burial##833 |goto Mulgore 59.86,25.63
step
Kill enemies around this area
|tip You need to be level 10 to accept a quest.
ding 10 |goto Mulgore 61.22,21.26
step
talk Skorn Whitecloud##3052
accept The Hunter's Way##861 |goto Mulgore 46.76,60.23
step
Enter the building |goto Mulgore 46.32,58.68 < 10 |walk
talk Moorat Longstride##3076
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
collect 1200 Heavy Shot##2519 |goto Mulgore 45.86,57.66 |q 758 |only if Hunter
|tip Upgrade to level 10 ammo while you are here. |only if Hunter
Visit the Vendor |vendor Moorat Longstride##3076 |goto Mulgore 45.86,57.66 |q 758
step
talk Kennah Hawkseye##3078
|tip Inside the building.
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kennah Hawkseye##3078 |goto Mulgore 45.49,58.47 |q 758
|only if Tauren Hunter and itemcount(2509) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 758
|only if Tauren Shaman and itemcount(2495) == 0
step
talk Mahnott Roughwound##3077
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Mahnott Roughwound##3077 |goto Mulgore 45.66,58.60 |q 758
|only if Tauren Druid and itemcount(2495) == 0
step
talk Ruul Eagletalon##2985
turnin Dangers of the Windfury##743 |goto Mulgore 47.35,62.02
step
talk Mull Thunderhorn##2948
turnin Thunderhorn Cleansing##758 |goto Mulgore 48.53,60.40
accept Wildmane Totem##759 |goto Mulgore 48.53,60.40
|only if Tauren
step
talk Baine Bloodhoof##2993
turnin Dwarven Digging##746 |goto Mulgore 47.51,60.17
step
talk Krang Stonehoof##3063
accept Veteran Uzzek##1505 |goto Mulgore 49.52,60.58
|only if Tauren Warrior
step
talk Yaw Sharpmane##3065
accept Taming the Beast##6061 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15914
|tip Use it on an Adult Plainstrider around this area.
Tame an Adult Plainstrider |q 6061/1 |goto Mulgore 43.81,51.82
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
You can find more around [40.11,57.35]
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6061 |goto Mulgore 47.82,55.69
accept Taming the Beast##6087 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15915
|tip Use it on a Prairie Stalker around this area.
Tame a Prairie Stalker |q 6087/1 |goto Mulgore 46.48,49.06
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6087 |goto Mulgore 47.82,55.69
accept Taming the Beast##6088 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15916
|tip Use it on a Swoop around this area.
|tip They do a knockdown which may interrupt your cast.
|tip You may need to abandon the quest and re-accept it if you run out of changes on the Taming Rod.
|tip Be ready to cancel the tame and use a healing potion if you get low, don't die due to an unlucky knock down. Just try again. |only if hardcore
Tame a Swoop |q 6088/1 |goto Mulgore 46.48,49.06
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6088 |goto Mulgore 47.82,55.69
accept Training the Beast##6089 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
talk Narm Skychaser##3066
|tip Inside the building.
accept Call of Fire##2984 |goto Mulgore 48.39,59.16
|tip This won't be available if you've spoken with or completed quests with Turak Runetotem already.
|only if Tauren Shaman
step
talk Gennia Runetotem##3064
|tip Inside the building.
accept Heeding the Call##5928 |goto Mulgore 48.48,59.64
|only if Tauren Druid
step
map Mulgore
path follow strict; loop on; ants curved; dist 30
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45	57.37,61.24	56.19,61.05	54.83,60.54	53.08,60.28
path	51.94,59.61
talk Morin Cloudstalker##2988
|tip He walks along the road around this area.
turnin The Ravaged Caravan##751
accept The Venture Co.##764
accept Supervisor Fizsprocket##765
step
_NOTE:_
Tame a Prairie Wolf Alpha
|tip Use your "Tame Beast" ability on a Prairie Wolf Alpha.
|tip These wolves can teach you "Bite 2".
|tip Disable their Furious Howl ability unless you're grouping with a melee party member.
|tip This will be your permament pet for a while.
Click Here to Continue |confirm |goto Felwood 62.21,19.91 |q 978
|only if Hunter
step
kill Prairie Wolf Alpha##2960+
collect 8 Prairie Alpha Tooth##4803 |q 759/1 |goto Mulgore 64.01,58.98
You can find more around [65.56,66.34]
step
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Mulgore 64.01,58.98 |q 759
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Mulgore 46.41,55.58 |q 759 |zombiewalk
|only if not hardcore
step
talk Mull Thunderhorn##2948
turnin Wildmane Totem##759 |goto Mulgore 48.53,60.40
|only if Tauren
step
Watch the dialogue
talk Mull Thunderhorn##2948
accept Wildmane Cleansing##760 |goto Mulgore 48.53,60.40
|only if Tauren
step
talk Omusa Thunderhorn##10378
fpath Camp Taurajo |goto The Barrens 44.45,59.15
step
talk Omusa Thunderhorn##10378
|tip We are opening the flight map to let the guide learn that you have the Thunder Bluff flight path already.
fpath Thunder Bluff |goto The Barrens 44.45,59.15
step
Enter the building |goto Thunder Bluff 44.99,62.17 < 10 |walk
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71
|only if Tauren Druid
step
Enter the building |goto Thunder Bluff 74.13,29.89 < 10 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Heeding the Call##5928 |goto Thunder Bluff 76.46,27.23
accept Moonglade##5922 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
accept The Barrens Oases##886 |goto Thunder Bluff 78.62,28.56
|only if Tauren Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5922 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Follow the path |goto Moonglade 42.47,34.44 < 20 |only if walking
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5930/1 |goto Moonglade 39.11,27.51
|only if Tauren Druid
step
talk Faustron##12740
fpath Moonglade |goto Moonglade 32.11,66.60
|only if Tauren Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
accept Back to Thunder Bluff##5932 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Enter the building |goto Thunder Bluff 74.09,29.91 < 10 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Back to Thunder Bluff##5932 |goto Thunder Bluff 76.46,27.23
accept Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
use the Cenarion Lunardust##15710
kill Lunaclaw##12138
|tip A spirit will appear after you kill her.
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."_
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6002/1 |goto The Barrens 42.00,60.86
|only if Tauren Druid
step
talk Kirge Sternhorn##3418
accept Journey to the Crossroads##854 |goto The Barrens 44.88,58.61
|only if Tauren
step
talk Tonga Runetotem##3448
turnin The Barrens Oases##886 |goto The Barrens/0 52.26,31.93
|only if Tauren Druid
step
talk Thork##3429
turnin Journey to the Crossroads##854 |goto The Barrens 51.50,30.87
|only if Tauren
step
talk Devrak##3615
fpath Crossroads |goto The Barrens 51.51,30.34
step
talk Jahan Hawkwing##3483
accept A Bundle of Hides##6361 |goto The Barrens 51.21,29.05
|only if Tauren
step
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if Tauren Warrior
step
Follow the path |goto Durotar 39.18,32.15 < 20 |only if walking
kill Thunder Lizard##3130+
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 39.27,28.29
|only if Tauren Warrior
step
Follow the path |goto Durotar 39.16,32.31 < 20 |only if walking
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
accept Thun'grim Firegaze##1502 |goto The Barrens 61.38,21.12
|only if Tauren Warrior
step
Follow the path |goto The Barrens 57.17,22.87 < 70 |only if walking
Run up the mountain |goto The Barrens 54.50,27.94 < 15 |only if walking
Follow the path |goto The Barrens 56.72,28.65 < 15 |only if walking
talk Thun'grim Firegaze##5878
|tip On top of the mountain.
turnin Thun'grim Firegaze##1502 |goto The Barrens 57.23,30.34
accept Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if Tauren Warrior
step
Run down the mountain |goto The Barrens 56.67,28.62 < 15 |only if walking
click Stolen Iron Chest
collect Forged Steel Bars##6534 |q 1503/1 |goto The Barrens 55.05,26.65
|only if Tauren Warrior
step
Run up the mountain |goto The Barrens 54.50,27.94 < 15 |only if walking
Follow the path |goto The Barrens 56.72,28.65 < 15 |only if walking
talk Thun'grim Firegaze##5878
|tip On top of the mountain.
turnin Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if Tauren Warrior
step
talk Kranal Fiss##5907
|tip He walks around this area.
turnin Call of Fire##2984 |goto The Barrens 56.03,19.89
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if Tauren Shaman
step
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if Tauren Shaman
step
Follow the path |goto The Barrens 61.47,20.86 < 40 |only if walking
Kill Razormane enemies around this area
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 54.15,25.01
|only if Tauren Shaman
step
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar 50.85,43.59
|only if Tauren Shaman
step
Follow the path up |goto Durotar 54.54,39.45 < 40 |only if walking
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip They seem to mostly be towards the back of the cave.
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar 52.82,28.82
|only if Tauren Shaman
step
Leave the cave |goto Durotar 52.83,28.93 < 15 |walk
Jump down onto the huge long rock |goto Durotar 51.97,31.29 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if Tauren Shaman
step
use the Fire Sapta##6636
|tip On top of the mountain.
Gain Sapta Sight |havebuff Sapta Sight##8898 |goto Durotar 38.16,58.54 |q 1526
|only if Tauren Shaman
step
kill Minor Manifestation of Fire##5893
|tip On top of the mountain.
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.72,58.29
|only if Tauren Shaman
step
click Brazier of the Dormant Flame
|tip On top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if Tauren Shaman
step
talk Kargal Battlescar##3337
turnin Conscript of the Horde##840 |goto The Barrens 62.26,19.38
accept Crossroads Conscription##842 |goto The Barrens 62.26,19.38
|only if Tauren Shaman
step
talk Kranal Fiss##5907
|tip He walks around this area.
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if Tauren Shaman
step
Enter the building |goto The Barrens 52.03,30.18 < 10 |walk
talk Innkeeper Boorand Plainswind##3934
|tip Inside the building.
home The Crossroads |goto The Barrens 51.99,29.89
step
talk Devrak##3615
turnin A Bundle of Hides##6361 |goto The Barrens 51.50,30.34
accept Ride to Thunder Bluff##6362 |goto The Barrens 51.50,30.34
|only if Tauren
step
talk Cairne Bloodhoof##3057
|tip Inside the building.
turnin Journey into Thunder Bluff##775 |goto Thunder Bluff 60.30,51.68
accept Rites of the Earthmother##776 |goto Thunder Bluff 60.30,51.68
step
Enter the building |goto Thunder Bluff 59.80,82.89 < 15 |walk
talk Holt Thunderhorn##3039
|tip Inside the building.
turnin Training the Beast##6089 |goto Thunder Bluff 57.31,89.76
|only if Tauren Hunter
step
talk Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.13,84.01
|tip Train your pet.
|tip Use your "Beast Training" ability to teach your pet abilities.
Click Here to Continue |confirm |q 744 |future
|only if Tauren Hunter
step
Enter the building |goto Thunder Bluff 74.09,29.91 < 10 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
talk Ahanu##8359
|tip Inside the building.
turnin Ride to Thunder Bluff##6362 |goto Thunder Bluff 45.77,55.84
accept Tal the Wind Rider Master##6363 |goto Thunder Bluff 45.77,55.84
|only if Tauren
step
talk Tal##2995
turnin Tal the Wind Rider Master##6363 |goto Thunder Bluff 47.00,49.83
accept Return to Jahan##6364 |goto Thunder Bluff 47.00,49.83
|only if Tauren
step
talk Eyahn Eagletalon##2987
accept Preparation for Ceremony##744 |goto Thunder Bluff 37.69,59.56
step
talk Kuruk##8362
Vendor your Trash |vendor Kuruk##8362 |q 744 |goto Thunder Bluff/0 38.93,64.59
step
talk Ansekhwa##11869
|tip This will allow you to equip staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Warrior and GetMoney() >= 1000
step
talk Ansekhwa##11869
|tip This will allow you to equip staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Hunter and GetMoney() >= 1000
step
talk Ansekhwa##11869
|tip This will allow you to equip two-handed maces.
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Druid and GetMoney() >= 1000
stickystart "Collect_Bronze_Feathers"
stickystart "Ghost_Howl_1"
step
Follow the path down |goto Thunder Bluff 35.39,63.27 < 10 |only if walking
kill Windfury Sorceress##2964+
collect 6 Azure Feather##4752 |q 744/1 |goto Mulgore 55.99,16.24
You can find more around: |notinsticky
[Mulgore 54.44,11.34]
[Mulgore 51.93,6.71]
[Mulgore 39.73,6.93]
[Mulgore 36.60,11.33]
step
label "Collect_Bronze_Feathers"
kill Windfury Matriarch##2965+
collect 6 Bronze Feather##4753 |q 744/2 |goto Mulgore 55.99,16.24
[54.44,11.34]
[51.93,6.71]
[39.73,6.93]
[36.60,11.33]
step
Kill enemies around this area
|tip Watch for patrols and respawns.	|only if hardcore
ding 11 |goto Mulgore 55.99,16.24
[54.44,11.34]
[51.93,6.71]
[39.73,6.93]
[36.60,11.33]
stickystart "Collect_Flatland_Prowler_Claws"
stickystart "Kill_Venture_Co_Supervisors"
stickystart "Kill_Venture_Co_Workers"
step
use the Wildmane Cleansing Totem##5416
Cleanse the Wildmane Well |q 760/1 |goto Mulgore 42.77,14.21
|tip Don't worry about killing the Venture Co. right now, we will finish them later.
|only if Tauren
stickystop "Kill_Venture_Co_Supervisors"
stickystop "Kill_Venture_Co_Workers"
step
map Mulgore
path	follow smart;	loop;	ants curved;	dist 40
path	49.15,18.59	49.34,19.98	49.74,21.77	49.95,22.75	50.59,24.71
path	51.10,26.03	51.43,26.30	52.10,28.15	52.35,30.13	52.17,30.72
path	52.12,31.43	52.85,32.09	53.36,32.25	54.42,32.28	54.75,32.09
path	54.98,31.78	55.18,31.05	55.24,28.87	55.11,26.88	54.72,24.96
path	54.16,23.56	53.93,22.62	54.06,21.44	54.47,19.73	54.39,18.65
path	54.08,17.21	53.56,15.74	53.14,14.98	52.68,12.71	51.82,11.83
path	50.99,12.41	50.00,14.08	49.23,15.46
kill Arra'chea##3058
|tip It looks like a dark grey kodo that walks clockwise in a path around this whole area.
|tip This step's path will take you counter-clockwise to help you find it faster.
|tip Grind as you look for her, she has a long respawn. This will reduce grinding later.
collect Horn of Arra'chea##4841 |q 776/1
step
label "Collect_Flatland_Prowler_Claws"
kill Flatland Prowler##3566+
collect 4 Flatland Prowler Claw##5203 |q 861/1 |goto Mulgore 45.10,17.36
You can find more around: |notinsticky
[51.03,13.25]
[39.72,12.05]
step
label "Ghost_Howl_1"
kill Ghost Howl##3056
collect Demon Scarred Cloak##4854 |q 770 |future |goto Thunder Bluff 60.29,51.68
|tip Ghost Howl is a rare spawn level 12 wolf that can roam this area. He starts a quest when killed.
|tip Skip this step if you don't see him before returning to Thunder Bluff. |notinsticky
|tip He can spawn in random locations and has hour long respawns, he's not worth waiting for. |notinsticky
step
use Demon Scarred Cloak##4854
accept The Demon Scarred Cloak##770 |goto Thunder Bluff 60.29,51.68
|only if itemcount(4854) > 0
step
Follow the path up |goto Thunder Bluff 59.87,19.62 < 20 |only if walking
Ride one of the elevators up |goto Thunder Bluff 57.28,24.99 < 20 |only if walking
Head up the totem tower |goto Thunder Bluff, 32.10,25.89 < 20 |only if walking
talk Cairne Bloodhoof##3057
|tip Inside the building.
turnin Rites of the Earthmother##776 |goto Thunder Bluff 60.29,51.68
step
talk Eyahn Eagletalon##2987
|tip He walks around this area.
turnin Preparation for Ceremony##744 |goto Thunder Bluff 37.67,59.60
step
talk Kuruk##8362
|tip Restock on ammo if needed |only if Hunter
Vendor your Trash |vendor Kuruk##8362 |q 861 |goto Thunder Bluff/0 38.93,64.59
step
talk Ansekhwa##11869
|tip This will allow you to equip staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Warrior and GetMoney() >= 1000
step
talk Ansekhwa##11869
|tip This will allow you to equip staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Hunter and GetMoney() >= 1000
step
talk Ansekhwa##11869
|tip This will allow you to equip two-handed maces.
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Thunder Bluff 40.93,62.73
|only if Tauren Druid and GetMoney() >= 1000
step
talk Melor Stonehoof##3441
turnin The Hunter's Way##861 |goto Thunder Bluff 61.53,80.89
accept Sergra Darkthorn##860 |goto Thunder Bluff 61.53,80.89
step
talk Pakwa##8364
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Pakwa##8364 |goto Thunder Bluff 39.31,64.27 |q 860
stickystart "Ghost_Howl_2"
stickystart "Kill_Venture_Co_Supervisors"
stickystart "Kill_Venture_Co_Workers"
step
Ride one of the elevators down |goto Thunder Bluff 35.55,63.22 < 20 |only if walking and subzone("Thunder Bluff")
Follow the path up |goto Mulgore 61.77,48.52 < 20 |only if walking
Enter the mine |goto Mulgore 61.56,46.90 < 10 |walk
kill Supervisor Fizsprocket##3051
|tip Inside the mine.
|tip Watch for patrols and respawns while in the mine.	|only if hardcore
collect Fizsprocket's Clipboard##4819 |q 765/1 |goto Mulgore 64.90,43.31
stickystop "Ghost_Howl_2"
step
label "Kill_Venture_Co_Supervisors"
kill 6 Venture Co. Supervisor##2979 |q 764/2 |goto Mulgore 61.46,47.19
|tip Inside and outside the mine. |notinsticky
|tip Watch for patrols and respawns while around here.	|only if hardcore |notinsticky
step
label "Kill_Venture_Co_Workers"
kill 14 Venture Co. Worker##2978 |q 764/1 |goto Mulgore 61.46,47.19
|tip Inside and outside the mine. |notinsticky
|tip Watch for patrols and respawns while around here.	|only if hardcore |notinsticky
step
Kill enemies around this area
|tip Inside and outside the mine.
|tip Watch for patrols and respawns while around here.	|only if hardcore |notinsticky
ding 12 |goto Mulgore 61.46,47.19
step
label "Ghost_Howl_2"
kill Ghost Howl##3056
collect Demon Scarred Cloak##4854 |q 770 |future |goto Mulgore 48.53,60.39
|tip Ghost Howl is a rare spawn level 12 wolf that can roam this area. He starts a quest when killed.
|tip Skip this step if you don't see him before returning to Bloodhoof Village. |notinsticky
|tip He can spawn in random locations and has hour long respawns, he's not worth waiting for. |notinsticky
step
use Demon Scarred Cloak##4854
accept The Demon Scarred Cloak##770 |goto Thunder Bluff 60.29,51.68
|only if itemcount(4854) > 0
step
talk Mull Thunderhorn##2948
turnin Wildmane Cleansing##760 |goto Mulgore 48.53,60.39
|only if Tauren
step
talk Skorn Whitecloud##3052
turnin The Demon Scarred Cloak##770 |goto Mulgore 46.76,60.23
|only if haveq(770)
step
map Mulgore
path follow smart; loop on; ants curved; dist 30
path	51.94,59.61	53.08,60.28	54.83,60.54	56.19,61.05	57.37,61.24
path	59.72,62.45	57.37,61.24	56.19,61.05	54.83,60.54	53.08,60.28
path	51.94,59.61
talk Morin Cloudstalker##2988
|tip He walks along the road around this area.
turnin The Venture Co.##764
turnin Supervisor Fizsprocket##765
step
talk Sergra Darkthorn##3338
turnin Sergra Darkthorn##860 |goto The Barrens 52.23,31.01
step
talk Jahan Hawkwing##3483
turnin Return to Jahan##6364 |goto The Barrens 51.21,29.05
|only if Tauren
step
_NOTE:_
Tame a Venomtail Scorpid
|tip We are heading to Orgimmar and this is on the way.
|tip You will need to abandon your wolf. If you've found another pet you care for, stable it in The Crossroads.
|tip Use your "Tame Beast" ability on a Venomtail Scorpid.
|tip They look like yellow and green scorpions around this area.
|tip We want them because they teach Claw Rank 2.
|tip Toggle off their Scorpion Poison ability after taming, it's only worthwhile on elites.
|tip This will be your pet for the next 2-3 levels.
Click Here to Continue |confirm |goto Durotar 44.02,17.33 |q 869 |future
|only if Tauren Hunter
step
Enter the building |goto Orgrimmar 47.47,65.13 < 15 |only if walking
talk Doras##3310
|tip At the top of the tower.
|tip You are taking the time to get the Orgrimmar flight path now, so you can use it to travel faster in the future.
fpath Orgrimmar |goto Orgrimmar 45.13,63.90
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Orc & Troll Starter (1-12)',
  {
    image = ZGV.IMAGESDIR .. 'Durotar',
    condition_suggested = function()
      return raceclass({ 'Orc', 'Troll' }) and level <= 12
    end,
    condition_suggested_race = function()
      return raceclass({ 'Orc', 'Troll' })
    end,
    condition_suggested_exclusive = true,
    next = 'Leveling Guides\\The Barrens (12-18)',
    hardcore = true,
  },
  [[
step
talk Kaltunk##10176
accept Your Place In The World##4641 |goto Durotar 43.29,68.54
step
kill 2 Mottled Boar##3098 |q 788 |future |goto Durotar 42.57,63.25
|tip Loot them for 10 copper worth of vendor items.
|tip This will let you train a spell early.
|tip This substantially increases your leveling speed and is worth the detour.
|only if Warrior or Warlock or Shaman
step
talk Duokna##3158
|tip Acquire 10 copper.
|tip You can sell some of your gear if you are short, it's not important at this level.
Sell your trash |vendor Duokna##3158  |q 788 |future |goto Durotar/0 42.59,67.35
|only if Warrior or Warlock or Shaman
step
talk Frang##3153
|tip You will need 10 copper to learn this spell.
|tip Keep this buff up at all times, especially at low levels it can cut your kill times in half.
learnspell Battle Shout##6673 |goto Durotar 42.89,69.43
|only if Warrior
step
talk Shikrik##3157
|tip You will need 10 copper to learn this spell.
|tip Keep this buff up at all times, especially at low levels it can cut your kill times in half.
learnspell Rockbiter Weapon##8017 |goto Durotar 42.39,69.00
|only if Shaman
step
talk Nartok##3156
|tip You will need 10 copper to learn this spell.
|tip Inside the cave.
learnspell Immolate##348 |goto Durotar 40.65,68.51
|only if Warlock
step
talk Ruzan##5765
accept Vile Familiars##1485 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
Enter the cave |goto Durotar 42.28,68.42 < 10 |walk
talk Gornek##3143
|tip Inside the cave.
turnin Your Place In The World##4641 |goto Durotar 42.06,68.33
accept Cutting Teeth##788 |goto Durotar 42.06,68.33
step
kill 10 Mottled Boar##3098 |q 788/1 |goto Durotar 42.57,63.25
|tip While leveling to 60 be sure to use your racial "Blood Fury" on cooldown as it will substantially increase your leveling speed. |only if Orc
|tip Don't wait for the best moment unless you're about to do a hard quest. |only if Orc
|tip While leveling to 60 be sure to use your racial "Berserking" on cooldown as it will substantially increase your leveling speed. |only if Troll
|tip Don't wait for the best moment unless you're about to do a hard quest. |only if Troll
step
Kill enemies around this area
|tip You are about to fight a level 4 enemy.
|tip Being a level higher will help.
ding 2 |goto Durotar 42.57,63.25
step
label "Collect_Vile_Familiar_Heads"
kill Vile Familiar##3101+
|tip Don't go inside the cave.
collect 6 Vile Familiar Head##6487 |q 1485/1 |goto Durotar 45.20,57.36
|only if Orc Warlock
step
talk Hana'zua##3287
|tip Grind enemies on the way.
|tip When we say to do this it is to make grind steps later less tedious by getting some out of the way now.
accept Sarkoth##790 |goto Durotar 40.60,62.59
step
kill Sarkoth##3281
|tip It looks like a darker colored scorpion that walks around this area.
|tip He's level 4, but you should be able to kill him at this level.
collect Sarkoth's Mangled Claw##4905 |q 790/1 |goto Durotar 40.50,66.82
step
talk Hana'zua##3287
turnin Sarkoth##790 |goto Durotar 40.60,62.59
accept Sarkoth##804 |goto Durotar 40.60,62.59
step
talk Ruzan##5765
|tip Grind enemies on the way.
turnin Vile Familiars##1485 |goto Durotar 42.59,69.00
accept Vile Familiars##1499 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
cast Summon Imp##688
|tip Use the "Summon Imp" ability.
Summon Your Imp |complete warlockpet("Imp")
|only if Orc Warlock and not warlockpet("Imp")
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##1499 |goto Durotar 42.85,69.15
|only if Orc Warlock
step
Enter the cave |goto Durotar 42.29,68.43 < 10 |walk
talk Gornek##3143
|tip Inside the cave.
|tip Grind on the way to this turnin. |only if not Orc Warlock
turnin Cutting Teeth##788 |goto Durotar 42.06,68.33
turnin Sarkoth##804 |goto Durotar 42.06,68.33
accept Simple Parchment##2383 |goto Durotar 42.06,68.33				|only Orc Warrior
accept Rune-Inscribed Parchment##3089 |goto Durotar 42.06,68.33			|only Orc Shaman
accept Encrypted Parchment##3088 |goto Durotar 42.06,68.33			|only Orc Rogue
accept Etched Parchment##3087 |goto Durotar 42.06,68.33				|only Orc Hunter
accept Tainted Parchment##3090 |goto Durotar 42.06,68.33			|only Orc Warlock
accept Simple Tablet##3065 |goto Durotar 42.06,68.33				|only Troll Warrior
accept Etched Tablet##3082 |goto Durotar 42.06,68.33				|only Troll Hunter
accept Encrypted Tablet##3083 |goto Durotar 42.06,68.33				|only Troll Rogue
accept Hallowed Tablet##3085 |goto Durotar 42.06,68.33				|only Troll Priest
accept Rune-Inscribed Tablet##3084 |goto Durotar 42.06,68.33			|only Troll Shaman
accept Glyphic Tablet##3086 |goto Durotar 42.06,68.33				|only Troll Mage
accept Sting of the Scorpid##789 |goto Durotar 42.06,68.33
step
talk Rwag##3155
|tip Inside the cave.
turnin Encrypted Parchment##3088 |goto Durotar 41.28,68.00
|only if Orc Rogue
step
talk Rwag##3155
|tip Inside the cave.
turnin Encrypted Tablet##3083 |goto Durotar 41.28,68.00
|only if Troll Rogue
step
talk Nartok##3156
|tip Inside the cave.
turnin Tainted Parchment##3090 |goto Durotar 40.65,68.51
|only if Orc Warlock
step
talk Hraug##12776
|tip Inside the cave.
buy Grimoire of Blood Pact (Rank 1)##16321 |n
|tip You cannot use this item until you have reached level 4.
|tip It costs 1 silver.
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Blood Pact (Rank 1)##16321
Teach Your Imp Blood Pact (Rank 1) |learnpetspell Blood Pact##6307 |goto Durotar 40.56,68.44
|only if Orc Warlock
step
talk Galgar##9796
accept Galgar's Cactus Apple Surprise##4402 |goto Durotar 42.73,67.24
step
talk Duokna##3158
|tip Purchase more ammo.
|tip Don't buy a full quiver worth, we need to save money for later.
collect 600 Rough Arrow##2512 |goto Durotar/0 42.59,67.35 |q 3087
|only if Hunter
step
talk Duokna##3158
Sell your junk |vendor Duokna##3158 |goto Durotar/0 42.59,67.35 |q 4402
|only if not Hunter
step
talk Ken'jai##3707
turnin Hallowed Tablet##3085 |goto Durotar 42.36,68.82
|only if Troll Priest
step
talk Mai'ah##5884
turnin Glyphic Tablet##3086 |goto Durotar 42.51,69.04
|only if Troll Mage
step
talk Zureetha Fargaze##3145
accept Vile Familiars##792 |goto Durotar 42.85,69.14
|only if not Orc Warlock
step
talk Frang##3153
turnin Simple Parchment##2383 |goto Durotar 42.89,69.43
|only if Orc Warrior
step
talk Frang##3153
turnin Simple Tablet##3065 |goto Durotar 42.89,69.43
|only if Troll Warrior
step
talk Jen'shan##3154
turnin Etched Parchment##3087 |goto Durotar 42.84,69.32
|only if Orc Hunter
step
talk Jen'shan##3154
turnin Etched Tablet##3082 |goto Durotar 42.84,69.32
|only if Troll Hunter
step
talk Foreman Thazz'ril##11378
|tip You must be level 3 before this quest is available.
accept Lazy Peons##5441 |goto Durotar 44.62,68.64
stickystart "Collect_Scorpid_Worker_Tails"
stickystop "Collect_Scorpid_Worker_Tails"
stickystart "Collect_Scorpid_Worker_Tails"
stickystop "Collect_Scorpid_Worker_Tails"
stickystart "Collect_Cactus_Apples"
stickystart "Collect_Scorpid_Worker_Tails"
stickystart "Learn_Chimera_Shot_Orc"
stickystart "Learn_Chimera_Shot_Troll"
step
use the Foreman's Blackjack##16114
|tip Use it on Lazy Peons at each location.
|tip They look like orcs sleeping on the ground around this area.
|tip They rotate between working and sleeping.
|tip If they aren't sleeping, don't wait, go to the next location.
|tip This step will complete when you check all areas, don't worry, you'll get more chances later.
|tip Grind enemies and loot apples between locations.
map Durotar/0
path follow smart; loop on; ants curved; dist 35
path 44.98,69.13	47.56,69.35		45.65,65.81
path 47.18,65.27	46.74,60.79		46.98,57.95
Check for sleeping Lazy Peons |q 5441/1
step
label "Kill_Vile_Familiars"
kill 12 Vile Familiar##3101 |q 792/1 |goto Durotar 45.20,57.36
|tip Don't go inside the cave. |notinsticky
|only if not Orc Warlock
step
use the Foreman's Blackjack##16114
map Durotar/0
path follow smart; loop on; ants curved; dist 35
path 43.79,57.72	42.84,57.34		41.18,58.84
path 40.91,60.43	38.86,61.83
Awaken #5# Peons |q 5441/1
|tip Use it on Lazy Peons around this area.
|tip They look like orcs sleeping on the ground around this area.
|tip If they aren't sleeping, don't wait, go to the next location.
|tip Grind enemies and collect apples between locations.
step
label "Collect_Cactus_Apples"
click Cactus Apple##171938+
|tip They look like green cactuses with small round red balls on them on the ground.
map Durotar/0
path follow smart; loop on; ants curved; dist 35
path 42.50,58.69	41.58,58.63		40.54,60.33
path 39.69,62.95	40.81,63.89		41.93,63.31
collect 10 Cactus Apple##11583 |q 4402/1
step
label "Collect_Scorpid_Worker_Tails"
kill Scorpid Worker##3124+
collect 10 Scorpid Worker Tail##4862 |q 789/1 |goto Durotar 40.71,62.45
step
Kill enemies around this area
ding 4 |goto Durotar 40.71,62.45
step
talk Duokna##3158
Sell your junk |vendor Duokna##3158 |goto Durotar/0 42.59,67.35 |q 4402
|tip Grind any level 2 or higher enemy en route.
|tip Level 1's aren't worth the time.
step
talk Galgar##9796
turnin Galgar's Cactus Apple Surprise##4402 |goto Durotar 42.73,67.24
step
Enter the cave |goto Durotar 42.28,68.43 < 10 |walk
talk Gornek##3143
|tip Inside the cave.
turnin Sting of the Scorpid##789 |goto Durotar 42.05,68.32
step
talk Ken'jai##3707
learnspell Power Word: Fortitude##1243 |goto Durotar 42.36,68.82
learnspell Shadow Word: Pain##589 |goto Durotar 42.36,68.82
|only if Priest and level >= 4
step
talk Mai'ah##5884
learnspell Frostbolt##116 |goto Durotar 42.51,69.04
learnspell Arcane Intellect##1459 |goto Durotar 42.51,69.04
learnspell Conjure Water##5504 |goto Durotar 42.51,69.04
|only if Mage and level >= 4
step
talk Frang##3153
learnspell Rend##772 |goto Durotar 42.89,69.43
learnspell Charge##100 |goto Durotar 42.89,69.43
|only if Warrior and level >= 4
step
talk Jen'shan##3154
learnspell Serpent Sting##1978 |goto Durotar 42.84,69.32
|tip We advise against training other spells, you will need silver for a weapon upgrade at level 6.
|only if Hunter and level >= 4
step
talk Shikrik##3157
learnspell Earth Shock##8042 |goto Durotar 42.39,69.00 |only if level >= 4
turnin Icons of Power##77585 |goto Durotar 42.39,69.00 |only if Orc Shaman
turnin Icons of Power##77587 |goto Durotar 42.39,69.00 |only if Troll Shaman
|only if Shaman
step
talk Canaga Earthcaller##5887
accept Call of Earth##1516 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##792 |goto Durotar 42.85,69.15 |only if not Orc Warlock
accept Burning Blade Medallion##794 |goto Durotar 42.85,69.15
step
Enter the cave |goto Durotar 42.29,68.43 < 10 |walk
talk Nartok##3156
|tip Inside the cave.
learnspell Corruption##172 |goto Durotar 40.65,68.51
|only if Warlock and level >= 4
step
talk Foreman Thazz'ril##11378
turnin Lazy Peons##5441 |goto Durotar 44.62,68.64
accept Thazz'ril's Pick##6394 |goto Durotar 44.62,68.64
step
Kill enemies around this area
ding 5 |goto Durotar 45.20,57.36
stickystart "Collect_Felstalker_Hoofs"
step
Enter the cave |goto Durotar 45.34,56.36 < 10 |walk
Follow the path |goto Durotar 44.42,54.58 < 7 |walk
click Thazz'ril's Pick
|tip Inside the cave.
|tip Grind level 2 or higher enemies en route.
collect Thazz'ril's Pick##16332 |q 6394/1 |goto Durotar 43.73,53.79
step
Follow the path |goto Durotar 44.76,54.54 < 10 |walk
Continue following the path |goto Durotar 44.45,52.74 < 10 |walk
Continue following the path |goto Durotar 43.39,52.01 < 10 |walk
kill Yarrog Baneshadow##3183
|tip Inside the cave.
collect Burning Blade Medallion##4859 |q 794/1 |goto Durotar 42.71,52.95
step
Kill enemies around this area
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore
|tip Getting this far into level 5 will allow you to reach level 6 when you turn in quests soon.
|tip This is important, so you can visit your class trainer before leaving the starter area.
ding 5,1700 |goto Durotar 42.71,52.95
step
label "Collect_Felstalker_Hoofs"
kill Felstalker##3102+
|tip Inside the cave.
collect 2 Felstalker Hoof##6640 |q 1516/1 |goto Durotar 44.82,54.59
|only if Shaman
step
talk Duokna##3158
Sell your junk |vendor Duokna##3158 |goto Durotar/0 42.59,67.35 |q 6394
step
talk Foreman Thazz'ril##11378
turnin Thazz'ril's Pick##6394 |goto Durotar/0 44.62,68.64
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1516 |goto Durotar 42.41,69.17
accept Call of Earth##1517 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Zureetha Fargaze##3145
turnin Burning Blade Medallion##794 |goto Durotar 42.85,69.15
accept Report to Sen'jin Village##805 |goto Durotar 42.85,69.15
step
talk Ken'jai##3707
accept In Favor of Spirituality##5649 |goto Durotar 42.36,68.81
learnspell Power Word: Shield##17 |goto Durotar 42.36,68.81 |only if level >= 6
learnspell Smite##591 |goto Durotar 42.36,68.81 |only if level >= 6
|only if Troll Priest
step
Follow the path |goto Durotar 43.57,69.85 < 20 |only if walking
Follow the path up |goto Durotar 41.56,73.28 < 15 |only if walking
use the Earth Sapta##6635
talk Minor Manifestation of Earth##5891
turnin Call of Earth##1517 |goto Durotar 44.03,76.20
accept Call of Earth##1518 |goto Durotar 44.03,76.20
|only if Shaman
step Follow the path |goto Durotar 43.49,69.67 < 30 |only if walking
talk Canaga Earthcaller##5887
turnin Call of Earth##1518 |goto Durotar 42.41,69.17
|only if Shaman
step
talk Shikrik##3157 |goto Durotar/0 42.39,69.00
learnspell Healing Wave##332 |goto Durotar 42.39,69.00 |only if level >= 6
learnspell Earthbind Totem##2484 |goto Durotar 42.39,69.00 |only if level >= 6
|only if Shaman
step
Enter the cave |goto Durotar 42.29,68.43 < 10 |walk
talk Nartok##3156
|tip Inside the cave.
learnspell Life Tap##1454 |goto Durotar 40.65,68.51
learnspell Shadow Bolt##695 |goto Durotar 40.65,68.51
|only if Warlock and level >= 6
step
Enter the cave |goto Durotar 42.28,68.43 < 10 |walk
talk Rwag##3155
|tip Inside the cave.
learnspell Sinister Strike##1757 |goto |goto Durotar 41.28,68.00
learnspell Gouge##1776 |goto |goto Durotar 41.28,68.00
|only if Rogue and level >= 6
step
talk Mai'ah##5884
learnspell Fire Blast##2136 |goto Durotar 42.51,69.04
learnspell Fireball##143 |goto Durotar 42.51,69.04
learnspell Conjure Food##587 |goto Durotar 42.51,69.04
|only if Mage and level >= 6
step
talk Frang##3153
|tip Train Parry
learnspell Thunder Clap##6343 |goto Durotar 42.89,69.43
|only if Warrior and level >= 6
step
talk Jen'shan##3154
learnspell Hunter's Mark##1130 |goto Durotar 42.84,69.32
learnspell Arcane Shot##3044 |goto Durotar 42.84,69.32
|tip If you will have under 3 silver afterwards, do not train any spells.
|tip If you have enough for one, take Hunter's Mark.
|tip You need 2 silver and 85 copper after leaving this area.
|only if Hunter and level >= 6
step
Follow the road |goto Durotar 49.58,68.28 < 30 |only if walking
talk Ukor##6786
accept A Peon's Burden##2161 |goto Durotar 52.06,68.31
step
talk Lar Prowltusk##3140
|tip He walks around this area.
|tip Grind enemies on the way to Sen'jin Village
|tip You need 2s 85c to buy a bow upgrade soon that is very important. |only if Hunter and GetMoney() < 285
|tip We strongly recommend grinding boar and scorpion nearby until you can buy it. |only if Hunter and GetMoney() < 285
map Durotar/0
path follow smart; loop on; ants curved; dist 20
path  54.19,73.29	54.63,74.72		54.09,76.49
accept Thwarting Kolkar Aggression##786
step
talk Vel'rin Fang##3194
|tip Inside the building.
accept Practical Prey##817 |goto Durotar 55.96,73.92
step
talk Master Vornal##3304
accept A Solvent Spirit##818 |goto Durotar 55.94,74.39
step
talk Master Gadrin##3188
turnin Report to Sen'jin Village##805 |goto Durotar 55.95,74.72
accept Minshina's Skull##808 |goto Durotar 55.95,74.72
accept Zalazane##826 |goto Durotar 55.95,74.72
accept Report to Orgnil##823 |goto Durotar 55.95,74.72
step
talk Trayexir##10369
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Orc Warrior and itemcount(2491) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Tomahawk##2490 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Troll Warrior and itemcount(2490) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Hunter and itemcount(2506) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Rogue and itemcount(2494) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Shaman and itemcount(2495) == 0
step
Enter the building |goto Durotar 56.22,74.18 < 10 |walk
talk K'waii##3186
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
|tip Stock up on arrows with remaining money. |only if Hunter
Visit the Vendor |vendor K'waii##3186 |goto Durotar 56.29,73.40 |q 808
step
Kill enemies as you follow the beach west |goto Durotar 59.29,73.42 < 30 |only if walking
Kill enemies as you follow the beach west |goto Durotar 57.65,78.34 < 30 |only if walking
kill Pygmy Surf Crawler##3106+
|tip They look like crabs.
collect 8 Crawler Mucus##4888 |n
Kill Makrura enemies around this area
|tip They look like lobster creatures.
collect 4 Intact Makrura Eye##4887 |n
'|kill Makrura Clacker##3103, Makrura Shellhide##3104
|tip You don't need to complete collecting these right now.
|tip We will finish off the quest later, if you don't get them all now.
Reach the End of the Beach |goto Durotar 52.50,82.76 < 50 |c |q 818
|only if not ((itemcount(4888) == 8) and (itemcount(4887) == 4))
step
Follow the path |goto Durotar 50.85,79.14 < 15 |only if walking
Enter the building |goto Durotar 49.89,80.80 < 7 |walk
click Attack Plan: Valley of Trials##3189
|tip Inside the building.
Destroy the Attack Plan: Valley of Trials |q 786/1 |goto Durotar 49.82,81.28
step
click Attack Plan: Sen'jin Village##3190
Destroy the Attack Plan: Sen'jin Village |q 786/2 |goto Durotar 47.66,77.34
step
Follow the path |goto Durotar 47.66,80.69 < 20 |only if walking
click Attack Plan: Orgrimmar##3192
Destroy the Attack Plan: Orgrimmar |q 786/3 |goto Durotar 46.23,78.95
step
Stand in the Fire to Kill Yourself
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Durotar 46.41,79.20 |q 786
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.49,73.26 |q 786 |zombiewalk
|only if not hardcore
step
talk Lar Prowltusk##3140
|tip He walks around this area.
map Durotar/0
path follow smart; loop on; ants curved; dist 20
path  54.19,73.29	54.63,74.72		54.09,76.49
turnin Thwarting Kolkar Aggression##786
|only if hardcore
step
Enter the building |goto Durotar 56.22,74.18 < 7 |walk
talk K'waii##3186
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor K'waii##3186 |goto Durotar 56.29,73.40 |q 823
step
talk Trayexir##10369
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Orc Warrior and itemcount(2491) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Tomahawk##2490 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Troll Warrior and itemcount(2490) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Hunter and itemcount(2506) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Rogue and itemcount(2494) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 818
|only if Shaman and itemcount(2495) == 0
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
|only if readyq(818)
step
talk Lar Prowltusk##3140
|tip He walks around this area.
map Durotar/0
path follow smart; loop on; ants curved; dist 20
path  54.19,73.29	54.63,74.72		54.09,76.49
turnin Thwarting Kolkar Aggression##786
|only if not hardcore
step
talk Orgnil Soulscar##3142
|tip Grind mobs en route.
|tip The next quest area has you fight a level 8 with adds, it is very important you grind experience as you run to town. |only if hardcore
turnin Report to Orgnil##823 |goto Durotar 52.25,43.15
accept Dark Storms##806 |goto Durotar 52.25,43.15
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
accept Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept Encroachment##837 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip He walks around this area.
accept Break a Few Eggs##815 |goto Durotar 51.11,42.45
step
talk Furl Scornbrow##3147
|tip At the top of the tower.
accept Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Krunn##3175
Train Apprentice Mining |skillmax Mining,75 |goto Durotar/0 51.81,40.89
|tip Weapon stones are up to a 30% damage increase at this level and are very worthwhile.
|tip Mine Copper Ore as you see it.
|only if Warrior or Rogue
step
talk Dwukk##3174
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Durotar/0 52.04,40.71
|tip Weapon stones are up to a 30% damage increase at this level and are very worthwhile.
|tip Mine Copper Ore as you see it and use the Rough Stones to make sharpening stones.
|only if Warrior or Rogue
step
talk Flakk##3168
collect Mining Pick##2901 |goto Durotar/0 52.98,41.98
|only if Warrior or Rogue
step
Enter the building |goto Durotar 51.84,41.95 < 10 |walk
talk Innkeeper Grosk##6928
|tip Inside the building.
turnin A Peon's Burden##2161 |goto Durotar 51.52,41.65
step
talk Innkeeper Grosk##6928
|tip Inside the building.
home Razor Hill |goto Durotar 51.52,41.65
step
talk Uhgar##3163
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 784
|only if Orc Warrior and itemcount(2491) == 0
step
talk Uhgar##3163
buy Tomahawk##2490 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 784
|only if Troll Warrior and itemcount(2490) == 0
step
talk Ghrawt##3165
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
|tip You shouldn't need more than 800 arrows before you reach level 10.
collect 800 Rough Arrow##2512 |goto Durotar 52.98,41.03 |q 784
Visit the Vendor |vendor Ghrawt##3165 |goto Durotar 52.98,41.03 |q 784
|only if Hunter and itemcount(2506) == 0
step
talk Uhgar##3163
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 784
|only if Rogue and itemcount(2494) == 0
step
talk Trayexir##10369
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Trayexir##10369 |goto Durotar 56.47,73.12 |q 784
|only if Shaman and itemcount(2495) == 0
step
Enter the building |goto Durotar 53.26,42.59 < 10 |walk
talk Tai'jin##3706
|tip Inside the building.
turnin In Favor of Spirituality##5649 |goto Durotar 54.26,42.93
accept Garments of Spirituality##5648 |goto Durotar 54.26,42.93
|only if Troll Priest
step
Heal and Fortify Grunt Kor'ja |q 5648/1 |goto Durotar 53.10,46.46
|tip Target Grunt Kor'ja.
|tip First, cast your "Lesser Heal (Rank 2)" spell on her.
|tip Second, cast your "Power Word: Fortitude" spell on her.
|only if Troll Priest
step
Enter the building |goto Durotar 53.26,42.59 < 10 |walk
talk Tai'jin##3706
|tip Inside the building.
turnin Garments of Spirituality##5648 |goto Durotar 54.26,42.93
|only if Troll Priest
step
_NOTE:_
Save All Linen Cloth You Find
|tip As you quest in Durotar, save all Linen Cloth you find.
|tip Be careful not to accidentally sell them to a vendor.
|tip You will need ~70 Linen Cloth when you are level 10-11.
|tip You will use them to create your wand, which will be a powerful weapon for you.
|tip However, if you are confident you will be able to buy a wand from the Auction House (if this isn't a new or populated server), you can ignore this. |only if not selfmade
Click Here to Continue |confirm |q 791
|only if Priest or Mage or Warlock
step
Kill enemies around this area
|tip You are about to have to fight 2 enemies at once, so being a level higher will help.
|tip One is a level 8, and the other is level 6-7.
|tip You can skip this if you think you'll be able to kill them without leveling first.
|tip If you still have a Healing Potion, you should be fine.
ding 8 |goto Durotar 58.21,57.44
You can find more around [57.72,52.62]
|only if hardcore
stickystart "Kill_Kul_Tiras_Sailors"
stickystart "Kill_Kul_Tiras_Marines"
step
Enter the building |goto Durotar 58.99,58.30 < 15 |walk
Run up the stairs |goto Durotar 59.86,58.28 < 7 |walk
kill Lieutenant Benedict##3192 |q 784/3 |goto Durotar 59.71,58.27
|tip Upstairs inside the building.
|tip If you have trouble, try to find someone to help you.
collect Benedict's Key##4882 |goto Durotar 59.71,58.27 |q 830 |future |only if not haveq(830)
step
Run up the stairs |goto Durotar 59.90,57.87 < 5 |walk
click Benedict's Chest
|tip Upstairs, on top of the building.
collect Aged Envelope##4881 |goto Durotar 59.26,57.66 |q 830 |future
|only if not haveq(830)
step
use the Aged Envelope##4881
accept The Admiral's Orders##830 |goto Durotar 58.21,57.44
|only if not haveq(830)
step
label "Collect_Canvas_Scraps"
Kill Kul Tiras enemies around this area
collect 8 Canvas Scraps##4870 |q 791/1 |goto Durotar 58.21,57.44
You can find more around [Durotar 57.72,52.62]
step
label "Kill_Kul_Tiras_Sailors"
kill 10 Kul Tiras Sailor##3128 |q 784/1 |goto Durotar 58.21,57.44
You can find more around [57.72,52.62]
step
label "Kill_Kul_Tiras_Marines"
kill 8 Kul Tiras Marine##3129 |q 784/2 |goto Durotar 58.21,57.44
You can find more around [57.72,52.62]
step
Kill enemies around this area
|tip If you plan to make your own wand and not purchase one from the auction house, this is a great grind spot.
|tip Grinding here will replace another grind step in the future while also getting you more linen.
|tip You can skip this if you have other plans for obtaining a wand.
|tip You should obtain the remaining 20 Linen while doing other quests.
collect 50 Linen Cloth##2589 |goto Durotar 58.21,57.44 |q 791
You can find more around [57.72,52.62]
|only if Priest or Mage or Warlock
step
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Durotar 57.72,52.62 |q 830
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 53.51,44.45 |q 830 |zombiewalk
|only if not hardcore
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Vanquish the Betrayers##784 |goto Durotar 51.95,43.50
accept From The Wreckage....##825 |goto Durotar 51.95,43.50
turnin The Admiral's Orders##830 |goto Durotar 51.95,43.50
accept The Admiral's Orders##831 |goto Durotar 51.95,43.50
step
talk Grimtak##3881
Vendor your Trash |vendor Grimtak##3881 |goto Durotar/0 51.13,42.63 |q 791
step
talk Furl Scornbrow##3147
|tip At the top of the tower.
turnin Carry Your Weight##791 |goto Durotar 49.89,40.38
step
talk Kaplak##3170
|tip Upstairs in the bunker.
learnspell Eviscerate##6760 |goto Durotar/0 51.97,43.70
learnspell Evasion##5277 |goto Durotar/0 51.97,43.70
|only if Rogue and level >= 8
step
talk Thotar##3171
|tip Downstairs in the bunker.
|tip Train Parry.
learnspell Concussive Shote##5116 |goto Durotar/0 51.97,43.70
learnspell Raptor Strike##14260 |goto Durotar/0 51.97,43.70
|only if Hunter and level >= 8
step
talk Uhgar##3163
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 831
|only if Orc Warrior and itemcount(2491) == 0
step
talk Uhgar##3163
buy Tomahawk##2490 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 831
|only if Troll Warrior and itemcount(2490) == 0
step
talk Ghrawt##3165
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ghrawt##3165 |goto Durotar 52.98,41.03 |q 831
|only if Hunter and itemcount(2506) == 0
step
talk Ghrawt##3165
collect 600 Rough Arrow##2512 |goto Durotar 52.98,41.03 |q 831
|only if Hunter
step
talk Uhgar##3163
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 831
|only if Rogue and itemcount(2494) == 0
step
talk Uhgar##3163
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 831
|only if Shaman and itemcount(2495) == 0
step
talk Dhugru Gorelust##3172
|tip Outside, behind the building.
learnspell Curse of Agony##980 |goto Durotar/0 54.38,41.20
learnspell Fear##5782 |goto Durotar/0 54.38,41.20
|only if Warlock and level >= 8
step
talk Kitha##6027
|tip Outside, behind the building.
buy Grimoire of Firebolt (Rank 2)##16302 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Firebolt (Rank 2)##16302
Teach Your Imp Firebolt (Rank 2) |learnpetspell Firebolt##7799 |goto Durotar 54.71,41.50
|only if Warlock
step
talk Tai'jin##3706
|tip Inside the building.
learnspell Renew##139 |goto Durotar/0 54.26,42.93
|only if Priest and level >= 8
step
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
learnspell Hamstring##1715 |goto Durotar/0 54.19,42.47
learnspell Heroic Strike##284 |goto Durotar/0 54.19,42.47
|only if Warrior and level >= 8
step
talk Swart##3173
learnspell Lightning Shield##324 |goto Durotar/0 54.42,42.57
learnspell Stoneclaw Totem##5730 |goto Durotar/0 54.42,42.57
|only if Shaman and level >= 8
step
Enter the building |goto Durotar 53.23,42.60 < 10 |walk
talk Rawrk##5943
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Durotar 54.17,41.93
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats or zeppelins, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 825
step
talk Jark##3164
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Jark##3164 |goto Durotar 54.39,42.18 |q 825
stickystart "Collect_Crawler_Mucus"
stickystart "Collect_Intact_Makrura_Eyes"
step
click Gnomish Toolbox##3236+
|tip It looks like a grey metal chest. There can be multiple at each wrecked boat.
|tip Underwater, inside the sunken ship.
|tip You will collect more at a different location.
collect Gnomish Tools##4863 |q 825/1 |goto Durotar 61.96,55.47 |count 1
step
click Gnomish Toolbox##3236+
|tip It looks like a grey metal chest. There can be multiple at each wrecked boat.
|tip Underwater.
|tip You will collect more at a different location.
collect 2 Gnomish Tools##4863 |q 825/1 |goto Durotar 62.26,56.32 |count 2
step
click Gnomish Toolbox##3236+
|tip It looks like a grey metal chest. There can be multiple at each wrecked boat.
|tip Underwater, under the sunken ship.
collect 3 Gnomish Tools##4863 |q 825/1 |goto Durotar 62.43,59.84 |count 3
step
label "Collect_Crawler_Mucus"
kill Pygmy Surf Crawler##3106+
|tip They look like crabs.
|tip Underwater all around this area. |notinsticky
|tip You can find more at the next quest area if this area is heavily contested. |notinsticky
collect 8 Crawler Mucus##4888 |q 818/2 |goto Durotar 63.80,54.61
step
label "Collect_Intact_Makrura_Eyes"
Kill Makrura enemies around this area
|tip They look like lobster creatures.
|tip Underwater all around this area. |notinsticky
|tip You can find more at the next quest area if this area is heavily contested. |notinsticky
collect 4 Intact Makrura Eye##4887 |q 818/1 |goto Durotar 63.80,54.61
'|kill Makrura Clacker##3103, Makrura Shellhide##3104
stickystart "Collect_Taillasher_Eggs"
stickystart "Collect_Durotar_Tiger_Fur"
stickystart "Kill_Hexed_Trolls"
stickystart "Kill_Voodoo_Trolls"
step
kill Zalazane##3205
|tip He walks around this area.
|tip Be careful not to pull two trolls at once.
|tip He has an extremely fast respawn time, do not wait around in camp. |only if hardcore
collect Zalazane's Head##4866 |q 826/3 |goto Durotar 67.29,87.05
step
click Imprisoned Darkspear##3237
|tip They look like skulls on the ground.
collect Minshina's Skull##4864 |q 808/1 |goto Durotar 67.45,87.81
step
label "Kill_Hexed_Trolls"
kill 8 Hexed Troll##3207 |q 826/1 |goto Durotar 67.17,86.99
You can find more around [67.36,83.45]
step
label "Kill_Voodoo_Trolls"
kill 8 Voodoo Troll##3206 |q 826/2 |goto Durotar 67.17,86.99
|tip Voodoo Trolls will fully heal from Healing Wave.
You can find more around [67.36,83.45]
step
label "Collect_Taillasher_Eggs"
click Taillasher Eggs##3240+
|tip They look like clusters of purple eggs on the ground near trees around this area.
collect 3 Taillasher Egg##4890 |q 815/1 |goto Durotar 64.56,73.28
You can find more at: |notinsticky
[61.37,78.34]
[60.33,82.86]
[59.78,89.67]
[63.00,94.44]
step
label "Collect_Durotar_Tiger_Fur"
kill Durotar Tiger##3121+
|tip Prioritize killing Tigers over everything else.
|tip They do not have many spawns and the drop rate is low.
|tip If you complete every other quest here without getting atleast 2 furs, or the zone is heavily contested, skip this quest. |notinsticky
collect 4 Durotar Tiger Fur##4892 |q 817/1 |goto Durotar 63.42,95.23
You can find more around: |notinsticky
[60.74,90.32]
[59.85,82.67]
step
Kill enemies around this area
|tip Having this much experience will allow you to reach the next level when you turn in quests.
|tip It will also put you close to level 10 after turning in all quests, so you can get your level 10 spells faster.
|ding 8,5000 |goto Durotar 63.42,95.23
You can find more around: |notinsticky
[60.74,90.32]
[59.85,82.67]
step
Allow Enemies to Kill You
|tip Dying has no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |q 817
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 57.50,73.26 |q 817 |zombiewalk
|only if not hardcore
step
Enter the building |goto Durotar 56.23,74.16 < 7 |walk
talk K'waii##3186
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor K'waii##3186 |goto Durotar 56.29,73.40 |q 817
step
talk Master Gadrin##3188
turnin Minshina's Skull##808 |goto Durotar 55.95,74.72
turnin Zalazane##826 |goto Durotar 55.95,74.72
|tip You will receive a "Faintly Glowing Skull" item as a quest reward.
|tip Be careful not to accidentally sell it to a vendor.
|tip You will use it later to make a quest easier.
step
talk Master Vornal##3304
turnin A Solvent Spirit##818 |goto Durotar 55.94,74.39
|tip Really Sticky Glue, the reward from this quest, can save your life if you need to run away. |only if hardcore
|tip Be sure to keybind it and don't sell it! |only if hardcore
step
talk Vel'rin Fang##3194
|tip Inside the building.
turnin Practical Prey##817 |goto Durotar 55.95,73.93
step
talk Un'Thuwa##5880
learnspell Polymorph##118 |goto Durotar/0 56.30,75.11
learnspell Frostbolt##205 |goto Durotar/0 56.30,75.11
|tip Frostbolt is optional, Fireball is more damage per mana at this level.
|only if Mage and level >= 8
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin From The Wreckage....##825 |goto Durotar 51.95,43.50
step
talk Cook Torka##3191
|tip He walks around this area.
turnin Break a Few Eggs##815 |goto Durotar 51.11,42.45
stickystart "Kill_Razormane_Scouts"
step
kill 4 Razormane Quilboar##3111 |q 837/1 |goto Durotar 49.86,49.33
step
label "Kill_Razormane_Scouts"
kill 4 Razormane Scout##3112 |q 837/2 |goto Durotar 49.86,49.33
stickystart "Kill_Razormane_Battleguards"
step
kill 4 Razormane Dustrunner##3113 |q 837/3 |goto Durotar 42.94,39.44
You can find more around: |notinsticky
[38.18,53.53]
step
label "Kill_Razormane_Battleguards"
kill 4 Razormane Battleguard##3114 |q 837/4 |goto Durotar 42.94,39.44
[38.18,53.53]
step
Kill enemies in the area
|tip This will let you get level 10 from turning in this quest.
ding 9,6000 |goto Durotar 42.94,39.44
step
talk Gar'Thok##3139
|tip Upstairs inside the building.
turnin Encroachment##837 |goto Durotar 51.95,43.50
step
talk Takrin Pathseeker##3336
accept Conscript of the Horde##840 |goto Durotar 50.85,43.59
step
talk Tai'jin##3706
|tip Inside the building.
learnspell Mind Blast##8092 |goto Durotar/0 54.26,42.93
learnspell Lesser Heal##2053 |goto Durotar/0 54.26,42.93
learnspell Shadow Word: Pain##594 |goto Durotar/0 54.26,42.93
learnspell Resurrection##2006 |goto Durotar/0 54.26,42.93 |only if not hardcore
|tip Only train Resurrection if you plan to do group content. |only if not hardcore
accept Hex of Weakness##5654 |goto Durotar 54.26,42.93 |only if Troll Priest
|only if Priest and level >= 10
step
Enter the building |goto Durotar 53.25,42.59 < 10 |walk
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
learnspell Bloodrage##2687 |goto Durotar 54.19,42.47
accept Veteran Uzzek##1505 |goto Durotar 54.19,42.47
|only if Warrior and level >= 10
step
talk Kaplak##3170
|tip Upstairs inside the building.
|tip Train Dual Wield
learnspell Sprint##2983 |goto Durotar 51.98,43.69
learnspell Slice and Dice##5171 |goto Durotar 51.98,43.69
learnspell Sap##6770 |goto Durotar 51.98,43.69
|tip Sap is low priority if you are low on money.
accept Therzok##1859 |goto Durotar 51.98,43.69
|only if Rogue and level >= 10
step
talk Swart##3173
learnspell Flametongue Weapon##8024 |goto Durotar/0 54.42,42.57
learnspell Flame Shock##8050 |goto Durotar/0 54.42,42.57
learnspell Strength of Earth Totem##8075 |goto Durotar/0 54.42,42.57
accept Call of Fire##2983 |goto Durotar 54.42,42.58
|only if Shaman and level >= 10
step
talk Grimtak##3881
buy Tough Jerky##117 |n
|tip Buy up to 20, whatever you have money and bag space for.
|tip This will be used to feed your permanent pet soon and keep it Happy, so it deals more damage and gains Loyalty faster.
|tip By keeping your pet Happy and ranking up its Loyalty, it won't run away and abandon you, and will need food less often to stay Happy.
Visit the Vendor |vendor Grimtak##3881 |goto Durotar 51.13,42.63 |q 6081 |future
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
accept Taming the Beast##6062 |goto Durotar 51.85,43.49
learnspell Aspect of the Hawk##13165 |goto Durotar 51.85,43.49
learnspell Serpent Sting##13549 |goto Durotar 51.85,43.49
|only if Hunter and level >= 10
step
use the Taming Rod##15917
|tip Use it on a Dire Mottled Boar around this area.
Tame a Dire Mottled Boar |q 6062/1 |goto Durotar 51.84,47.23
|tip Don't dismiss it after turning in the quest.
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6062 |goto Durotar 51.85,43.49
accept Taming the Beast##6083 |goto Durotar 51.85,43.49
|only if Hunter
step
talk Ghrawt##3165
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ghrawt##3165 |goto Durotar 52.98,41.03 |q 6083
|only if Hunter and itemcount(2506) == 0
step
talk Ghrawt##3165
|tip Delete your old ammo and replace it with a quiver full of level 10 ammo.
collect 1000 Sharp Arrow##2515 |goto Durotar 52.98,41.03 |q 6081 |future
|only if Hunter
step
Follow the path |goto Durotar 54.36,39.59 < 40 |only if walking
use the Taming Rod##15919
|tip Use it on a Surf Crawler around this area.
|tip Grind mobs as you head north if you still have your boar.
|tip Dismiss your boar before trying to tame the Surf Crawler.
|tip It may attack you after you dismiss it.
Tame a Surf Crawler |q 6083/1 |goto Durotar 59.01,27.64
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
|tip Grind mobs on the way back if you still have your crab.
|tip Dismiss your crab after turning in this quest.
|tip It may attack you after you dismiss it.
turnin Taming the Beast##6083 |goto Durotar 51.85,43.49
accept Taming the Beast##6082 |goto Durotar 51.85,43.49
|only if Hunter
step
Follow the path |goto Durotar 54.36,39.59 < 40 |only if walking
use the Taming Rod##15920
|tip Use it on an Armored Scorpid around this area.
Tame an Armored Scorpid |q 6082/1 |goto Durotar 55.09,37.54
|only if Hunter
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6082 |goto Durotar 51.85,43.49
accept Training the Beast##6081 |goto Durotar 51.85,43.49
|only if Hunter
step
talk Misha Tor'kren##3193
|tip She walks around inside the building.
accept Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
|only if Hunter
step
talk Rhinag##3190
|tip Between the huge rocks.
accept Need for a Cure##812 |goto Durotar 41.54,18.60
|only if Hunter
step
Enter the building |goto Orgrimmar 48.20,79.60 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 831
|only if Hunter
step
Follow the path up |goto Orgrimmar 71.64,25.95 < 15 |only if walking
Follow the path up |goto Orgrimmar 67.68,14.51 < 10 |only if walking
talk Ormak Grimshot##3352
turnin Training the Beast##6081 |goto Orgrimmar 66.05,18.54
|only if Hunter
step
_NOTE:_
You Can Now Train Your Pet
talk Xao'tsu##10088 |goto Orgrimmar/0 66.33,14.80
|tip Learn pet abilities from Pet Trainers.
|tip Use your "Beast Training" ability to teach your pet abilities.
Click Here to Continue |confirm |q 834 |future
|only if Hunter
step
talk Zendo'jian##3409
buy Laminated Recurve Bow##2507 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zendo'jian##3409 |goto Orgrimmar/0 81.12,18.70
|only if Hunter and GetMoney() >= 1100
step
talk Hanashi##2704
Train Staves |complete weaponskill("TH_STAFF") > 0	|goto Orgrimmar/0 81.44,19.59
|only if Hunter and GetMoney() >= 1000
step
Enter the building |goto Orgrimmar 40.24,36.97 < 10 |walk
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar 32.27,35.82
|only if Hunter
step
talk Thrall##4949
|tip Inside the building.
accept Hidden Enemies##5726 |goto Orgrimmar 31.80,37.82
|only if Hunter
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.59 |sticky saved
|only if Hunter
step
_Note:_
You can Safely Abandon a Quest
|tip You no longer need to have the "Need for a Cure" quest.
|tip Abandoning it will remove the timer for the "Finding the Antidote" quest, allowing you to complete it whenever you want to.
Abandon the _"Need for a Cure"_ Quest |complete not haveq(812)
|only if Hunter
step
_Note:_
Enter the Ragefire Chasm Dungeon
|tip Walk into the swirling portal.
|tip In the Cleft of Shadow.
|tip Dying inside this dungeon will take you outside of Orgrimmar quickly.
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Orgrimmar 52.31,49.27 |q 834 |future
|only if Hunter and not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 834 |future |zombiewalk
|only if Hunter and not hardcore
step
_NOTE:_
Tame a Venomtail Scorpid
|tip Use your "Tame Beast" ability on a Venomtail Scorpid.
|tip They look like yellow and green scorpions around this area.
|tip We want them because they teach Claw Rank 2.
|tip Toggle off their Scorpion Poison ability after taming, it's only worthwhile on elites.
Click Here to Continue |confirm |goto Durotar 44.02,17.33 |q 834 |future
|only if Hunter
step
talk Ophek##3294
|tip Outside, behind the building.
accept Gan'rul's Summons##1506 |goto Durotar 54.37,41.29
|only if Warlock
step
talk Dhugru Gorelust##3172
|tip Outside, behind the building.
learnspell Drain Soul##1120 |goto Durotar/0 54.38,41.20
learnspell Create Healthstone (Minor)##6201 |goto Durotar/0 54.38,41.20
|tip This requires Drain Soul to be trained.
learnspell Demon Skin##696 |goto Durotar/0 54.38,41.20
learnspell Immolate##707 |goto Durotar/0 54.38,41.20
|only if Warlock and level >= 10
step
talk Misha Tor'kren##3193
|tip She walks around inside the building.
accept Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
|only if Warlock
step
talk Rhinag##3190
|tip Between the huge rocks.
accept Need for a Cure##812 |goto Durotar 41.54,18.60
|only if Warlock
step
talk Hanashi##2704
Train Staves |complete weaponskill("TH_STAFF") > 0	|goto Orgrimmar/0 81.44,19.59
|only if Warlock and GetMoney() >= 1000
step
Enter the building |goto Orgrimmar 40.24,36.97 < 10 |walk
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar 32.27,35.82
|only if Warlock
step
talk Thrall##4949
|tip Inside the building.
accept Hidden Enemies##5726 |goto Orgrimmar 31.80,37.82
|only if Warlock
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.59 |sticky saved
|only if Warlock
step
_Note:_
You can Safely Abandon a Quest
|tip You no longer need to have the "Need for a Cure" quest.
|tip Abandoning it will remove the timer for the "Finding the Antidote" quest, allowing you to complete it whenever you want to.
Abandon the _"Need for a Cure"_ Quest |complete not haveq(812)
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip In the Cleft of Shadow.
turnin Gan'rul's Summons##1506 |goto Orgrimmar 48.24,45.29
accept Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
_Note:_
Enter the Ragefire Chasm Dungeon
|tip Walk into the swirling portal.
|tip In the Cleft of Shadow.
|tip Dying inside this dungeon will take you outside of Orgrimmar quickly.
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Orgrimmar 52.31,49.27 |q 834 |future
|only if Warlock and not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 834 |future |zombiewalk
|only if Warlock and not hardcore
step
talk Misha Tor'kren##3193
|tip She walks around inside the building.
|tip Grind en route to accepting this quest.
accept Lost But Not Forgotten##816 |goto Durotar 43.11,30.24
|only if not (Hunter or Warlock)
step
talk Rezlak##3293
accept Winds in the Desert##834 |goto Durotar 46.37,22.94
|tip Grind en route to accepting this quest.
step
click Stolen Supply Sack+
|tip They look like tan bags on the ground around this area.
collect 5 Sack of Supplies##4918 |q 834/1 |goto Durotar 49.19,21.57
You can find more around:
[50.66,26.64]
[48.35,32.66]
step
talk Rezlak##3293
turnin Winds in the Desert##834 |goto Durotar 46.37,22.94
accept Securing the Lines##835 |goto Durotar 46.37,22.94
stickystart "Kill_Dustwind_Savages"
step
Follow the path |goto Durotar 49.68,28.45 < 20 |only if walking
Enter the tunnel |goto Durotar 51.95,27.44 < 15 |only if walking
Leave the tunnel |goto Durotar 53.75,27.79 < 15 |only if walking
kill 8 Dustwind Storm Witch##3118 |q 835/2 |goto Durotar 53.89,24.97
|tip Be careful, the Storm Witches on the ledges up above will evade your attacks. |only if hardcore
You can find more down the path that starts at [53.98,22.49]
step
label "Kill_Dustwind_Savages"
kill 12 Dustwind Savage##3117 |q 835/1 |goto Durotar 53.89,24.97
You can find more down the path that starts at [53.98,22.49]
step
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Durotar 53.89,24.97 |q 835
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 835 |zombiewalk
|only if not hardcore
step
talk Rezlak##3293
turnin Securing the Lines##835 |goto Durotar 46.37,22.94
step
Jump down carefully onto the flat rock below |goto Durotar 43.21,25.05 < 7 |only if walking
Follow the path |goto Durotar 41.66,25.34 < 30 |only if walking
use the Faintly Glowing Skull##4945
|tip Use it on Fizzle Darkstorm, it will damage him, and make the fight much easier.
|tip You want to use after you've taken some damage, as it heals you for the damage you deal.
|tip If you feel you can kill him without using it, save it for emergancies later. |only if hardcore
kill Fizzle Darkstorm##3203
|tip Kill his imp minion first, to make the fight easier.
|tip He walks around in the camp, standing by the bonfire for a while, then walking away from it.
|tip Wait for him to walk away from the bonfire, so you can kill the other enemy alone before you attack Fizzle Darkstorm.
|tip Clear out most of the enemies in the camp he walks around in, to make the fight safer.
|tip Pull him away from the camp, so you have more space to fight him away from other enemies.
|tip He's level 12, but you should be able to kill him at this level, with the help of the Faintly Glowing Skull.
|tip If you have trouble, try to get someone to help you.
collect Fizzle's Claw##4869 |q 806/1 |goto Durotar 42.28,26.59
step
Fight your way out of the canyon |goto Durotar/0 39.15,28.71 < 25 |q 806
step
talk Rhinag##3190
|tip Between the huge rocks.
accept Need for a Cure##812 |goto Durotar 41.54,18.60
|only if not (Hunter or Warlock)
step
Enter the building |goto Orgrimmar 48.20,79.60 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 831
|only if not (Hunter or Warlock)
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Priest"	|or	|q 831
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Priest"	|or	|q 831
|only if Priest or Mage or Warlock
step
label "Create_Wand_Priest"
collect 70 Linen Cloth##2589 |q 831
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Priest or Mage or Warlock
step
Enter the building |goto Orgrimmar/0 61.40,50.35 < 10 |walk
talk Snang##2855
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Orgrimmar 62.93,49.26 |q 831
|only if Priest or Mage or Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 831
|only if Priest or Mage or Warlock
step
talk Borya##3364
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Orgrimmar 63.08,51.45 |q 831
|only if Priest or Mage or Warlock
step
talk Snang##2855
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Orgrimmar 62.93,49.26 |q 831
|only if Priest or Mage or Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 831
|only if Priest or Mage or Warlock
step
Enter the building |goto Orgrimmar 53.45,36.95 < 10 |walk
talk Jhag##11066
|tip Inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Orgrimmar/0 53.47,38.54 |q 831
|only if Priest or Mage or Warlock
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Kithas here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Orgrimmar/0 53.88,38.02 |q 831
collect 2 Lesser Magic Essence##10938 |goto Orgrimmar/0 53.88,38.02 |q 831
|only if Priest or Mage or Warlock
step
talk Kithas##3346
|tip Inside the building.
buy Copper Rod##6217 |goto Orgrimmar/0 53.88,38.02 |q 831
buy Simple Wood##4470 |goto Orgrimmar/0 53.88,38.02 |q 831
|only if Priest or Mage or Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 831
|only if Priest or Mage or Warlock
step
talk Jhag##11066
|tip Inside the building.
learn Lesser Magic Wand##14293 |goto Orgrimmar/0 53.47,38.54 |q 831
|only if Priest or Mage or Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 831
|only if Priest or Mage or Warlock
step
label "Skip_Wand_Priest"
Enter the building |goto Orgrimmar 40.24,36.97 < 10 |walk
talk Nazgrel##3230
|tip Inside the building.
turnin The Admiral's Orders##831 |goto Orgrimmar 32.27,35.82
|only if not (Hunter or Warlock)
step
talk Thrall##4949
|tip Inside the building.
accept Hidden Enemies##5726 |goto Orgrimmar 31.80,37.82
|only if not (Hunter or Warlock)
step
talk Therzok##6446
|tip Inside the Cleft of Shadow.
turnin Therzok##1859 |goto Orgrimmar 42.73,53.55 |only if haveq(1859) or completedq(1859)
accept The Shattered Hand##1963 |goto Orgrimmar 42.73,53.55
|only if (Orc or Troll) and Rogue
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
accept Finding the Antidote##813 |goto Orgrimmar 47.24,53.59 |sticky saved
|only if not (Hunter or Warlock)
step
_Note:_
You can Safely Abandon a Quest
|tip You no longer need to have the "Need for a Cure" quest.
|tip Abandoning it will remove the timer for the "Finding the Antidote" quest, allowing you to complete it whenever you want to.
Abandon the _"Need for a Cure"_ Quest |complete not haveq(812)
|only if not (Hunter or Warlock)
step
talk Enyo##5883
learnspell Conjure Water##5505 |goto Orgrimmar/0 38.78,85.63
learnspell Frost Nova##122 |goto Orgrimmar/0 38.78,85.63
learnspell Frost Armor##7300 |goto Orgrimmar/0 38.78,85.63
|only if Mage and level >= 10
stickystart "Collect_Venomtail_Sac"
step
kill Dreadmaw Crocolisk##3110+
|tip Kill them as you move south along the river.
|tip If you get very unlucky and reach the bridge into the Barrens before finding it, head back north killing Scorpions for Poison Sacs.
|tip The crocodiles should respawn up north at the same time you arrive.
collect Kron's Amulet##4891 |q 816/1 |goto Durotar 36.24,21.58
You can find more along the river down to around [The Barrens 63.13,17.26]
step
label "Collect_Venomtail_Sac"
kill Venomtail Scorpid##3127+
collect 4 Venomtail Poison Sac##4886 |q 813/1 |future |goto Durotar 53.46,15.02 |sticky saved
You can find more around [43.21,17.06]
step
talk Orgnil Soulscar##3142
turnin Dark Storms##806 |goto Durotar 52.24,43.15
accept Margoz##828 |goto Durotar 52.24,43.15
step
talk Uhgar##3163
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 5726
|only if Orc Warrior and itemcount(2491) == 0
step
talk Uhgar##3163
buy Tomahawk##2490 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 5726
|only if Troll Warrior and itemcount(2490) == 0
step
Enter the building |goto Durotar 53.25,42.59 < 7 |walk
talk Swart##3173
|tip Inside the building.
accept Call of Fire##2983 |goto Durotar 54.42,42.58
|only if Shaman
step
talk Ghrawt##3165
buy Laminated Recurve Bow##2507 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ghrawt##3165 |goto Durotar 52.98,41.03 |q 5726
|only if Hunter and itemcount(2507) == 0
step
talk Uhgar##3163
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 5726
|only if Rogue and itemcount(2494) == 0
step
talk Uhgar##3163
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uhgar##3163 |goto Durotar 52.02,40.45 |q 5726
|only if Shaman and itemcount(2495) == 0
step
Follow the path |goto Durotar 54.62,39.25 < 40 |only if walking
Continue following the path |goto Durotar 56.37,29.88 < 50 |only if walking
talk Margoz##3208
turnin Margoz##828 |goto Durotar 56.41,20.04
accept Skull Rock##827 |goto Durotar 56.41,20.04
stickystart "Collect_Lieutenants_Insignia"
stickystart "Collect_Searing_Collars"
step
Enter the cave |goto Durotar 55.02,9.79 < 10 |walk
Follow the path |goto Durotar 53.71,8.71 < 10 |walk
Continue following the path |goto Durotar 51.67,8.21 < 10 |walk
click Burning Blade Stash##58595
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore |notinsticky
collect Tablet of Verga##6535 |q 1501/1 |goto Durotar 51.62,9.74
|only if Warlock
step
label "Collect_Lieutenants_Insignia"
Kill Burning Blade enemies around this area |notinsticky
|tip Inside the cave. |notinsticky
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore |notinsticky
collect Lieutenant's Insignia##14544 |q 5726/1 |goto Durotar 54.98,9.69
|tip If you reach level 12 before getting it, you can skip this step.
step
label "Collect_Searing_Collars"
Kill Burning Blade enemies around this area |notinsticky
|tip Inside the cave. |notinsticky
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore |notinsticky
collect 6 Searing Collar##4871 |q 827/1 |goto Durotar 54.98,9.69
step
Kill mobs in the area
|tip We want to be level 12 when we enter Orgrimmar next.
ding 11,7430 |goto Durotar 54.98,9.69
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore |notinsticky
step
Leave the cave |goto Durotar 54.98,9.69 < 15 |walk |only if subzone("Skull Rock") and _G.IsIndoors()
talk Margoz##3208
turnin Skull Rock##827 |goto Durotar 56.41,20.03
accept Neeru Fireblade##829 |goto Durotar 56.41,20.03
step
Enter the building |goto Orgrimmar 48.20,79.60 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 5726
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Hex of Weakness##5654 |goto Orgrimmar 35.59,87.83
|only if Troll Priest
step
Optional Route Change
|tip You can opt to do Ragefire Chasm around level 16 instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Ragefire Chasm, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Ragefire Chasm later |confirm RFCflag
Click Here if you'd prefer to grind |confirm
step
Enter the building |goto Orgrimmar 40.23,37.00 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5726 |goto Orgrimmar 31.79,37.82
accept Hidden Enemies##5727 |goto Orgrimmar 31.74,37.83 |only if guideflag("RFCflag")
step
Follow the path |goto Orgrimmar 54.40,35.58 < 15 |only if walking
Follow the path down |goto Orgrimmar 55.22,40.76 < 15 |only if walking
talk Neeru Fireblade##3216
|tip Inside the building.
Select _"You may speak frankly, Neeru..."_
Gauge Neeru Fireblade's Reaction to Being a Member of the Burning Blade |q 5727/1 |goto Orgrimmar 49.47,50.63
|only if guideflag("RFCflag")
step
talk Neeru Fireblade##3216
|tip Inside the tent.
|tip In the Cleft of Shadow.
turnin Neeru Fireblade##829 |goto Orgrimmar 49.49,50.59
accept Ak'Zeloth##809 |goto Orgrimmar 49.49,50.59
step
talk Kor'ghan##3189
|tip Inside the Cleft of Shadow.
turnin Finding the Antidote##813 |goto Orgrimmar 47.24,53.59 |sticky saved
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip In the Cleft of Shadow.
turnin Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
accept The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
use Glyphs of Summoning##7464
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent.
|tip In the Cleft of Shadow.
kill Summoned Voidwalker##5676 |q 1504/1 |goto Orgrimmar 49.44,50.02
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
|tip In the Cleft of Shadow.
turnin The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
_NOTE:_
Create Soul Shards
|tip As you follow the guide, use your "Drain Soul" spell as you kill an enemy to get a Soul Shard.
|tip Once you have a Soul Shard, use your "Summon Voidwalker" ability to summon your voidwalker.
|tip It will tank enemies for you, making it easier to kill enemies.
Click Here to Continue |confirm |q 812 |future
|only if Warlock
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5727 |goto Orgrimmar 31.74,37.83
|only if guideflag("RFCflag")
step
talk Xao'tsu##10088
Train your pet spells. |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 816
|only if Hunter
step
talk Ormak Grimshot##3352 |only if Hunter
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.08,18.51 |only if Hunter |q 816
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 816
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 816
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 816
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 816
Train your spells. |trainer Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 816
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 816
|tip Inside the building. |only if Warrior or Mage or Priest
step
_Note:_
Enter the Ragefire Chasm Dungeon
|tip Walk into the swirling portal.
|tip Dying inside this dungeon will take you outside of Orgrimmar quickly.
Allow Enemies to Kill You
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Orgrimmar 52.31,49.27 |q 812 |future
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Durotar 47.05,17.59 |q 812 |future |zombiewalk
|only if not hardcore
step
talk Rhinag##3190
|tip Between the huge rocks.
|tip Grind en route, we are going to the Barrens soon and there is a jump in levels.
accept Need for a Cure##812 |goto Durotar 41.54,18.60
step
talk Rhinag##3190
|tip Between the huge rocks.
turnin Need for a Cure##812 |goto Durotar 41.54,18.60
step
talk Misha Tor'kren##3193
|tip She walks around inside the building.
|tip Grind en route, we are going to the Barrens soon and there is a jump in levels.
turnin Lost But Not Forgotten##816 |goto Durotar 43.10,30.24
step
Kill enemies around this area
|tip You are grinding here to prepare yourself for the Barrens.
|ding 12,3000 |goto Durotar 42.94,39.44
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\The Barrens (12-18)',
  {
    image = ZGV.IMAGESDIR .. 'The Barrens',
    condition_suggested = function()
      return level >= 12 and level <= 18 and not completedq(875)
    end,
    next = 'Leveling Guides\\Stonetalon Mountains (18-19)',
    hardcore = true,
  },
  [[
step
Optional Route Change
|tip You can opt to do Ragefire Chasm around level 16 instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Ragefire Chasm, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Ragefire Chasm later |confirm RFCflag
Click Here if you'd prefer to grind |confirm
|only if Scourge
step
talk Kargal Battlescar##3337
turnin Conscript of the Horde##840 |goto The Barrens 62.26,19.38
accept Crossroads Conscription##842 |goto The Barrens 62.26,19.38
|only if haveq(840) or completedq(840)
step
talk Kranal Fiss##5907
turnin Call of Fire##2983 |goto The Barrens 56.03,19.89
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if ((Orc or Troll) and Shaman)
step
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if ((Orc or Troll) and Shaman)
step
Follow the path |goto The Barrens 61.47,20.86 < 40 |only if walking
Kill Razormane enemies around this area
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 54.15,25.01
|only if ((Orc or Troll) and Shaman)
step
Follow the path up |goto Durotar/0 54.54,39.45 < 40 |only if walking
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip They seem to mostly be towards the back of the cave.
|tip Watch for patrols and respawns while inside the cave.	|only if hardcore |notinsticky
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar 52.82,28.82
|only if ((Orc or Troll) and Shaman)
step
Leave the cave |goto Durotar 52.83,28.93 < 15 |walk
Jump down onto the huge long rock |goto Durotar 51.97,31.29 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 15 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if ((Orc or Troll) and Shaman)
step
use the Fire Sapta##6636
|tip On top of the mountain.
Gain Sapta Sight |havebuff Sapta Sight##8898 |goto Durotar 38.16,58.54 |q 1526
|only if ((Orc or Troll) and Shaman)
step
kill Minor Manifestation of Fire##5893
|tip On top of the mountain.
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.72,58.29
|only if ((Orc or Troll) and Shaman)
step
click Brazier of the Dormant Flame##61934
|tip On top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if ((Orc or Troll) and Shaman)
step
talk Kranal Fiss##5907
|tip He walks around this area.
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if ((Orc or Troll) and Shaman)
step
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if ((Orc or Troll) and Warrior)
step
Enter the canyon |goto Durotar 39.18,32.15 < 30 |only if walking
kill Thunder Lizard##3130+
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 39.27,28.29
|only if ((Orc or Troll) and Warrior)
step
Leave the canyon |goto Durotar 39.16,32.31 < 30 |only if walking
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
accept Thun'grim Firegaze##1502 |goto The Barrens 61.38,21.12
|only if ((Orc or Troll) and Warrior)
step
talk Ak'Zeloth##3521
turnin Ak'Zeloth##809 |goto The Barrens 62.34,20.07
accept The Demon Seed##924 |goto The Barrens 62.34,20.07
|only if Orc or Troll
step
click Flawed Power Stone##5619+
|tip It's the stone on a brazier beside you.
accept Flawed Power Stone##926 |goto The Barrens 62.34,20.03 |instant |sticky saved
collect Flawed Power Stone##4986 |goto The Barrens 62.34,20.03 |q 924
|only if Orc or Troll
step
_NOTE:_
Try to Hurry
|tip You just picked up an item with a 30 minute countdown timer.
|tip You are about to complete the quest, but try to hurry to make sure the item doesn't disappear.
Click Here to Continue |confirm |q 924
|only if Orc or Troll
step
click Chen's Empty Keg##3238
|tip It may not be here, and has about a 5 minute respawn time.
|tip If it's not here, skip this step, you will try again later at another location.
collect Chen's Empty Keg##4926 |goto The Barrens 55.78,20.01 |q 819 |future
|only if Orc or Troll or Scourge
step
use Chen's Empty Keg##4926
accept Chen's Empty Keg##819 |goto The Barrens 52.62,29.84
|only if ((Orc or Troll or Scourge) and itemcount(4926) > 0)
step
talk Zargh##3489
accept Meats to Orgrimmar##6365 |goto The Barrens 52.62,29.84
|only if Orc or Troll
step
talk Sergra Darkthorn##3338
turnin Crossroads Conscription##842 |goto The Barrens 52.24,31.01 |only if haveq(842) or completedq(842)
accept Plainstrider Menace##844 |goto The Barrens 52.24,31.01
step
talk Tonga Runetotem##3448
accept The Forgotten Pools##870 |goto The Barrens 52.26,31.93
step
Enter the building |goto The Barrens 52.03,30.16 < 10 |walk
talk Innkeeper Boorand Plainswind##3934
|tip Inside the building.
home The Crossroads |goto The Barrens 51.99,29.90
step
talk Gazrog##3464
accept Raptor Thieves##869 |goto The Barrens 51.93,30.32
step
talk Hula'mahi##3490
Sell your Trash |vendor Hula'mahi##3490 |q 867 |goto The Barrens/0 51.39,30.21
step
talk Thork##3429
accept Disrupt the Attacks##871 |goto The Barrens 51.50,30.87
accept Supplies for the Crossroads##5041 |goto The Barrens 51.50,30.87
step
talk Darsok Swiftdagger##3449
|tip At the top of the tower.
accept Harpy Raiders##867 |goto The Barrens 51.62,30.89
step
talk Devrak##3615
turnin Meats to Orgrimmar##6365 |goto The Barrens 51.50,30.34
|only if Orc or Troll
step
talk Devrak##3615
fpath Crossroads |goto The Barrens 51.50,30.34
step
talk Devrak##3615
|tip We are opening the flight map to let the guide learn that you have the Orgrimmar flight path already.
fpath Orgrimmar |goto The Barrens 51.50,30.34
step
talk Apothecary Helbrim##3390
turnin Sample for Helbrim##1358 |goto The Barrens 51.44,30.15 |only if haveq(1358) or completedq(1358)
accept Wharfmaster Dizzywig##1492 |goto The Barrens 51.44,30.15
accept Fungal Spores##848 |goto The Barrens 51.44,30.15
stickystart "Collect_Plainstrider_Beaks"
step
Run up the mountain |goto The Barrens 50.93,22.55 < 15 |only if walking
Follow the path |goto The Barrens 49.00,20.05 < 20 |only if walking
Enter the cave |goto The Barrens 47.66,19.17 < 15 |walk
click The Altar of Fire##3525
|tip Inside the cave.
Destroy the Demon Seed |q 924/1 |goto The Barrens 47.96,19.07
|only if Orc or Troll
stickystop "Collect_Plainstrider_Beaks"
step
Stand in the Fire to Kill Yourself
|tip You will only receive resurrection sickness for a short time.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto The Barrens 47.45,19.28 |q 924
|only if (Orc or Troll) and not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto The Barrens 50.72,32.61 |q 924 |future |zombiewalk
|only if (Orc or Troll) and not hardcore
step
talk Omusa Thunderhorn##10378
|tip Be careful while running here.
|tip The enemies along the way are much higher level.
fpath Camp Taurajo |goto The Barrens 44.45,59.15
|only if Warrior and not Tauren
step
Ride an elevator up into Thunder Bluff |goto Thunder Bluff 32.11,67.16 < 20 |only if walking
talk Ansekhwa##11869
|tip We are taking a field trip to Thunder Bluff, so you can learn how to use staves and two-handed maces.
|tip This will allow you to equip staves and two-handed maces.
|tip It will be good to have the option to use them while leveling.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Thunder Bluff 40.93,62.73
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Thunder Bluff 40.93,62.73
|only if Warrior and not Tauren
step
talk Rahauro##11833
|tip He walks around this area.
accept Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83
accept Searching for the Lost Satchel##5722 |goto Thunder Bluff 70.51,31.83
|only if Warrior and not Tauren and guideflag("RFCflag")
step
talk Tal##2995
|tip At the top of the tower.
fpath Thunder Bluff |goto Thunder Bluff 46.98,49.84
|only if Warrior and not Tauren
step
talk Rahauro##11833
|tip He walks around this area.
accept Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83
accept Searching for the Lost Satchel##5722 |goto Thunder Bluff 70.51,31.83
|only if Warrior and guideflag("RFCflag")
step
talk Archibald##11870
|tip We are taking a field trip to Undercity, so you can learn how to use one-handed swords.
|tip This will allow you to equip one-handed swords.
|tip It will be good to have the option to use them while leveling.
Train Swords |complete weaponskill("SWORD") > 0 |goto Undercity 57.31,32.77
|only if (Orc or Troll) and Rogue
step
Optional Route Change
|tip Leveling in the Barrens can be very punishing at first for your class.
|tip It is a slower leveling speed to go to Silverpine Forest but it will make the experience much smoother.
|tip It will also make you much less likely to die. |only if hardcore
|tip If you'd like to level in Silverpine Forest for a few levels then continue with the Barrens again after, click the guide below.
|tip Otherwise skip this step.
|loadguide "Leveling Guides\\Silverpine Forest (12-14)"
|only if (Orc or Troll) and (Rogue or Warrior) and level < 14
step
Run up the mountain |goto The Barrens 54.50,27.94 < 15 |only if walking
Follow the path |goto The Barrens 56.72,28.65 < 15 |only if walking
talk Thun'grim Firegaze##5878
|tip On top of the mountain.
turnin Thun'grim Firegaze##1502 |goto The Barrens 57.23,30.34
accept Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if ((Orc or Troll) and Warrior)
step
Run down the mountain |goto The Barrens 56.67,28.62 < 15 |only if walking
click Stolen Iron Chest##58369
collect Forged Steel Bars##6534 |q 1503/1 |goto The Barrens 55.05,26.65
|only if ((Orc or Troll) and Warrior)
step
Run up the mountain |goto The Barrens 54.50,27.94 < 15 |only if walking
Follow the path |goto The Barrens 56.72,28.65 < 15 |only if walking
talk Thun'grim Firegaze##5878
|tip On top of the mountain.
turnin Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if ((Orc or Troll) and Warrior)
stickystart "Collect_Raptor_Heads"
stickystart "Kill_Razormane_Water_Seekers"
stickystart "Kill_Razormane_Thornweavers"
stickystart "Kill_Razormane_Hunters"
step
click Chen's Empty Keg##3238
|tip It may not be here, and has about a 5 minute respawn time.
|tip If it's not here, skip this step, you will try again later at another location.
collect Chen's Empty Keg##4926 |goto The Barrens 55.70,27.29 |q 819 |future
stickystop "Collect_Raptor_Heads"
step
use Chen's Empty Keg##4926
accept Chen's Empty Keg##819 |goto The Barrens 55.57,26.71
|only if itemcount(4926) > 0
step
label "Kill_Razormane_Water_Seekers"
kill 8 Razormane Water Seeker##3267 |q 871/1 |goto The Barrens 55.57,26.71
You can find more around [54.26,25.66]
step
label "Kill_Razormane_Thornweavers"
kill 8 Razormane Thornweaver##3268 |q 871/2 |goto The Barrens 55.57,26.71
You can find more around [54.26,25.66]
step
label "Kill_Razormane_Hunters"
kill 3 Razormane Hunter##3265 |q 871/3 |goto The Barrens 55.57,26.71
|tip They walk with wolf pets around this area.
You can find more around [54.26,25.66]
step
Kill enemies around this area
|tip You are grinding a bit here to prevent you from having to grind for a long time all at once later to hit level 16 before some difficult quests.
ding 13 |goto The Barrens 55.57,26.71
You can find more around [54.26,25.66]
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Beaks"
step
click Chen's Empty Keg##3238
|tip If you already checked the location in the previous step, then you should find it here.
collect Chen's Empty Keg##4926 |goto The Barrens 55.78,20.01 |q 819 |future
step
use Chen's Empty Keg##4926
accept Chen's Empty Keg##819 |goto The Barrens 54.16,23.75
|only if itemcount(4926) > 0
step
label "Collect_Plainstrider_Beaks"
Kill Plainstrider enemies around this area
'|kill Greater Plainstrider##3244, Fleeting Plainstrider##3246, Ornery Plainstrider##3245
collect 7 Plainstrider Beak##5087 |q 844/1 |goto The Barrens 54.16,23.75
You can find more: |notinsticky
Around [53.48,21.68]
Around [51.49,27.47]
Around [53.74,28.85]
Around [53.36,33.32]
Around [50.52,31.88]
step
talk Sergra Darkthorn##3338
turnin Plainstrider Menace##844 |goto The Barrens 52.24,31.01
accept The Zhevra##845 |goto The Barrens 52.24,31.01
stickystop "Collect_Raptor_Heads"
step
talk Thork##3429
turnin Disrupt the Attacks##871 |goto The Barrens 51.50,30.87
accept The Disruption Ends##872 |goto The Barrens 51.50,30.87
step
talk Lizzarik##3658
|tip He looks like a goblin that travels on the road between Crossroads and Ratchet.
|tip If he's not here, skip this step, we'll try again later.
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip You can't use it until level 14, but you'll level up soon.
|tip If you have better, skip this step.
Visit the Vendor |vendor Lizzarik##3658 |goto The Barrens 52.21,30.85 |q 924
|only if Warrior and itemcount(4778) == 0
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Zhevra_Hooves"
step
talk Ak'Zeloth##3521
|tip Grind en route to this turnin
turnin The Demon Seed##924 |goto The Barrens 62.34,20.07
|only if Orc or Troll
step
label "Collect_Zhevra_Hooves"
kill Zhevra Runner##3242+
|tip They look like zebras.
collect 4 Zhevra Hooves##5086 |q 845/1 |goto The Barrens 55.62,21.23
You can find more around:
[The Barrens 58.82,21.68]
[53.77,35.31]
stickystop "Collect_Raptor_Heads"
stickystart "Kill_Razormane_Geomancers"
stickystart "Kill_Razormane_Defenders"
step
Follow the path |goto The Barrens 57.84,23.93 < 70 |only if walking
Continue following the path |goto The Barrens 58.95,25.20 < 50 |only if walking
kill Kreenig Snarlsnout##3438
|tip He walks around this area.
collect Kreenig Snarlsnout's Tusk##5063 |q 872/3 |goto The Barrens 58.53,27.04
step
click Crossroads' Supply Crates##175708
|tip They look like piles of brown boxes on the ground around this area.
collect Crossroads' Supply Crates##12708 |q 5041/1 |goto The Barrens 58.53,27.27
You can find more around [59.24, 24.65]
step
label "Kill_Razormane_Geomancers"
kill 8 Razormane Geomancer##3269 |q 872/1 |goto The Barrens 58.99,24.66
You can find more around [57.20,24.98]
step
label "Kill_Razormane_Defenders"
kill 8 Razormane Defender##3266 |q 872/2 |goto The Barrens 58.99,24.66
You can find more around [57.20,24.98]
step
Kill enemies around this area
|tip You are grinding a bit here to prevent you from having to grind for a long time all at once later to hit level 16 before some difficult quests.
ding 14 |goto The Barrens 58.99,24.66
You can find more around [57.20,24.98]
stickystart "Collect_Raptor_Heads"
step
_NOTE:_
Tame a Savannah Prowler
|tip Use your "Tame Beast" ability on a Savannah Prowler.
|tip They look like lions around this area.
|tip Make sure to tame a level 14 Savannah Prowler.
|tip You can abandon your pet right before taming a Savannah Prowler.
|tip This will be your new permanent pet.
Train Your Pet
|tip Be sure to train your new pet with the highest ranks of Growl and Bite you currently have.
Click Here to Continue |confirm |goto The Barrens 63.15,28.88 |q 887 |future
|only if Hunter
step
Follow the coast to Ratchet and enter the building |goto The Barrens 62.89,36.52 < 10 |walk
|tip Grind en route to accepting this quest.
talk Gazlowe##3391
|tip Upstairs inside the building.
accept Southsea Freebooters##887 |goto The Barrens 62.68,36.23
stickystop "Collect_Raptor_Heads"
step
talk Bragok##16227
fpath Ratchet |goto The Barrens 63.09,37.16
step
talk Sputtervalve##3442
accept Samophlange##894 |goto The Barrens 62.98,37.22
step
_Destroy This Item:_
|tip It is no longer needed.
trash Control Console Operating Manual##5088
step
talk Wharfmaster Dizzywig##3453
turnin Wharfmaster Dizzywig##1492 |goto The Barrens 63.35,38.45
step
talk Fuzruckle##3496
|tip Deposit these items into the bank if you are struggling with bag space.
|tip We are withdrawing them again after this next quest. Skip this step if you have plenty of space.
bank Kreenig Snarlsnout's Tusk##5063 |goto The Barrens 62.64,37.42 |q 872 |future
bank Zhevra Hooves##5086 |goto The Barrens 62.64,37.42 |q 845 |future
bank Crossroads' Supply Crates##12708 |goto The Barrens 62.64,37.42 |q 5041 |future
step
click WANTED
accept WANTED: Baron Longshore##895 |goto The Barrens 62.59,37.47
step
talk Mebok Mizzyrix##3446
accept Raptor Horns##865 |goto The Barrens 62.37,37.62
step
talk Brewmaster Drohn##3292
turnin Chen's Empty Keg##819 |goto The Barrens 62.26,38.39
accept Chen's Empty Keg##821 |goto The Barrens 62.26,38.39
step
talk Innkeeper Wiley##6791
|tip Inside the building.
|tip The fish here are extremely cheap compared to other food vendors.
Stock up on Food/Water |vendor Innkeeper Wiley##6791 |goto The Barrens 62.05,39.41 |q 895
step
Enter the building |goto The Barrens 62.24,37.62 < 10 |walk
talk Ironzar##3491
|tip Inside the building.
buy Scimitar##2027+ |n
|tip If you can afford it.
|tip Buy 2, if you can, so you can dual wield them.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ironzar##3491 |goto The Barrens 62.24,37.48 |q 887
|only if Rogue and itemcount(2027) == 0
step
Enter the building |goto The Barrens 62.24,37.62 < 10 |walk
talk Ironzar##3491
|tip Inside the building.
buy Gnarled Staff##2030 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ironzar##3491 |goto The Barrens 62.24,37.48 |q 887
|only if Shaman and itemcount(2030) == 0
stickystart "Kill_Southsea_Cannoneers"
stickystart "Kill_Southsea_Brigands"
step
Follow the path |goto The Barrens 62.39,39.42 < 30 |only if walking and not subzone("The Merchant Coast")
kill Tazan##6494
|tip He looks like a troll with purple pants that walks around this area.
collect Tazan's Satchel##7209 |q 1963/1 |goto The Barrens 63.59,44.31
Also check around [The Barrens 61.65,44.21]
|only if Orc Rogue and Troll Rogue
step
Follow the path |goto The Barrens 62.39,39.42 < 30 |only if walking and not subzone("The Merchant Coast")
kill Baron Longshore##3467
|tip He walks around this area, wearing a red coat.
|tip He can spawn in 3 different camps around this area.
|tip If you have trouble, try to kite him away from the group, so you can fight him alone.
collect Baron Longshore's Head##5084 |q 895/1 |goto The Barrens 64.22,47.13
He can also be around: |notinsticky
[The Barrens 63.64,49.18]
[The Barrens 62.66,49.73]
step
label "Kill_Southsea_Cannoneers"
kill 6 Southsea Cannoneer##3382 |q 887/2 |goto The Barrens 63.79,45.59
You can find more around [63.67,49.07]
step
label "Kill_Southsea_Brigands"
kill 12 Southsea Brigand##3381 |q 887/1 |goto The Barrens 63.79,45.59
You can find more around [63.67,49.07]
step
Enter the building |goto The Barrens 62.24,37.62 < 10 |walk
talk Ironzar##3491
|tip Inside the building.
buy Scimitar##2027+ |n
|tip If you can afford it.
|tip Buy 2, if you can, so you can dual wield them.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ironzar##3491 |goto The Barrens 62.24,37.48 |q 895
|only if Rogue and itemcount(2027) == 0
step
Enter the building |goto The Barrens 62.24,37.62 < 10 |walk
talk Ironzar##3491
|tip Inside the building.
buy Gnarled Staff##2030 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ironzar##3491 |goto The Barrens 62.24,37.48 |q 895
|only if Shaman and itemcount(2030) == 0
step
talk Fuzruckle##3496
|tip Collect these items from the bank.
collect Kreenig Snarlsnout's Tusk##5063 |goto The Barrens 62.64,37.42 |q 872
collect 4 Zhevra Hooves##5086 |goto The Barrens 62.64,37.42 |q 845
collect Crossroads' Supply Crates##12708 |goto The Barrens 62.64,37.42 |q 5041
step
Enter the building |goto The Barrens 62.89,36.52 < 10 |walk
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Southsea Freebooters##887 |goto The Barrens 62.68,36.23
accept The Missing Shipment##890 |goto The Barrens 62.68,36.23
turnin WANTED: Baron Longshore##895 |goto The Barrens 62.68,36.23
step
talk Wharfmaster Dizzywig##3453
turnin The Missing Shipment##890 |goto The Barrens 63.35,38.45
accept The Missing Shipment##892 |goto The Barrens 63.35,38.45
accept Miner's Fortune##896 |goto The Barrens 63.35,38.45
step
Enter the building |goto The Barrens 62.89,36.52 < 10 |walk
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin The Missing Shipment##892 |goto The Barrens 62.68,36.23
accept Stolen Booty##888 |goto The Barrens 62.68,36.23
step
talk Lizzarik##3658
|tip He looks like a goblin that travels on the road between Crossroads and Ratchet.
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Lizzarik##3658 |goto The Barrens 61.76,38.27 |q 903 |future
If he's not here, follow the road to Crossroads where he stands at [52.21,30.85]
|only if Warrior and itemcount(4778) == 0
step
talk Thork##3429
turnin Supplies for the Crossroads##5041 |goto The Barrens 51.50,30.87
turnin The Disruption Ends##872 |goto The Barrens 51.50,30.87
|nohearth
step
talk Sergra Darkthorn##3338
turnin The Zhevra##845 |goto The Barrens 52.23,31.01
accept Prowlers of the Barrens##903 |goto The Barrens 52.23,31.01
step
talk Devrak##3615
accept Ride to Orgrimmar##6384 |goto The Barrens 51.50,30.34
|tip Do not fly to Orgrimmar yet.
|tip This quest may be gray but you still get full exp up to level 17.
|only if Orc or Troll
step
talk Uthrok##3488
buy Fine Longbow##11304 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uthrok##3488 |goto The Barrens 51.11,29.06 |q 903
|only if Hunter and itemcount(11304) == 0
step
talk Uthrok##3488
buy Medium Quiver##11362 |n
|tip If you can afford it.
Visit the Vendor |vendor Uthrok##3488 |goto The Barrens 51.11,29.06 |q 903
|only if Hunter and itemcount(11362) == 0
step
talk Barg##3481
|tip Stock up on arrows |only if Hunter
Vendor your Trash |vendor talk Barg##3481 |goto The Barrens/0 51.67,29.96 |q 903
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Kidneys"
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
accept Centaur Bracers##855 |goto The Barrens 45.34,28.41
accept Kolkar Leaders##850 |goto The Barrens 45.34,28.41
stickystart "Collect_Fungal_Spores"
stickystart "Collect_Centaur_Bracers"
step
Explore the Waters of the Forgotten Pools |q 870/1 |goto The Barrens 45.07,22.53
|tip Underwater.
|tip Swim next to the bubbling rock.
stickystop "Collect_Raptor_Heads"
stickystop "Collect_Plainstrider_Kidneys"
step
label "Collect_Fungal_Spores"
click Laden Mushroom##3640+
|tip They look like large blue mushrooms on the ground around this area.
|tip They can spawn in multiple locations around this pond.
collect 4 Fungal Spores##5012 |q 848/1 |goto The Barrens 44.95,22.54
step
kill Barak Kodobane##3394
|tip He walks around this area.
|tip He's level 16, but you should be able to kill him at this level.
|tip He can hit very hard, be ready to use your potion if you need to.
|tip Do not worry about finishing the Centaur Bracers yet, you have more chances later. |only if not completedq(855)
collect Barak's Head##5022 |q 850/1 |goto The Barrens 42.72,23.61
step
Kill enemies around this area
|tip You are grinding a bit here to prevent you from having to grind for a long time all at once later to hit level 16 before some difficult quests.
ding 15 |goto The Barrens 42.60,25.43
You can find more around [44.35,22.03]
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Kidneys"
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
turnin Centaur Bracers##855 |goto The Barrens 45.34,28.41			|only if readyq(855)
turnin Kolkar Leaders##850 |goto The Barrens 45.34,28.41
accept Verog the Dervish##851 |goto The Barrens 45.34,28.41
stickystop "Collect_Centaur_Bracers"
stickystart "Collect_Prowler_Claws"
step
kill Savannah Prowler##3425+
collect 5 Savannah Lion Tusk##4893 |q 821/1 |goto The Barrens 41.47,28.75
|tip Grind north as you kill Savannah Prowlers.
You can find more around: |notinsticky
[40.97,26.77]
[41.43,23.84]
[40.56,22.84]
[40.95,21.54]
[40.32,20.57]
step
label "Collect_Prowler_Claws"
kill Savannah Prowler##3425+ |notinsticky
collect 7 Prowler Claws##5096 |q 903/1 |goto The Barrens 40.32,20.57
|tip Grind north as you kill Savannah Prowlers. |notinsticky
You can find more around: |notinsticky
[40.95,21.54]
[40.56,22.84]
[41.43,23.84]
[40.97,26.77]
[41.47,28.75]
stickystop "Collect_Raptor_Heads"
stickystop "Collect_Plainstrider_Kidneys"
step
Kill Witchwing enemies around this area
|tip Work your way northeast/east as you kill them.
|tip Be very careful as you go deeper in the harpy area, the mobs get much higher level towards the back.
collect 8 Witchwing Talon##5064 |q 867/1 |goto The Barrens 40.86,18.45
You can find more around [41.57,15.02]
stickystart "Collect_Raptor_Heads"
stickystart "Collect_Plainstrider_Kidneys"
step
talk Vrang Wildgore##3682
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Vrang Wildgore##3682 |goto The Barrens 43.80,12.21 |q 821
|only if Warrior and itemcount(4778) == 0
step
talk Vrang Wildgore##3682
Visit the Vendor |vendor Vrang Wildgore##3682 |goto The Barrens 43.80,12.21 |q 869
|only if not Warrior
step
label "Collect_Raptor_Heads"
Kill Sunscale enemies around this area
|tip They look like purple raptors all around the Barrens.
|tip Just kill them as you see them.
|tip You will be turning this quest in soon, so you need all of the heads now. |notinsticky
collect 12 Raptor Head##5062 |q 869/1 |goto The Barrens 43.72,15.65
You can find more around [The Barrens 47.20,14.04]
step
label "Collect_Plainstrider_Kidneys"
Kill Plainstrider enemies around this area
|tip They look like large walking birds with small wings.
collect 5 Plainstrider Kidney##4894 |q 821/2 |goto The Barrens 45.55,14.64
You can find more around: |notinsticky
[47.80,13.60]
[50.76,13.28]
step
click Control Console##4141
|tip Grind en route to this turnin.
turnin Samophlange##894 |goto The Barrens 52.41,11.64
accept Samophlange##900 |goto The Barrens 52.41,11.64
step
click the Fuel Control Valve##61936
|tip You will not be attacked after you shut it off.
Shut Off the Fuel Control Valve |q 900/2 |goto The Barrens 52.40,11.41
step
click the Regulator Valve##61935
|tip One enemy will appear and attack you.
Shut Off the Regulator Valve |q 900/3 |goto The Barrens 52.29,11.40
step
click Main Control Valve##4072
|tip Two enemies will appear and attack you.
Shut Off the Main Control Valve |q 900/1 |goto The Barrens 52.33,11.57
step
click Control Console##4141
turnin Samophlange##900 |goto The Barrens 52.41,11.64
accept Samophlange##901 |goto The Barrens 52.41,11.64
step
Enter the building |goto The Barrens 52.92,10.55 < 10 |walk
kill Tinkerer Sniggles##3471
|tip Inside the building.
collect Console Key##5089 |q 901/1 |goto The Barrens 52.84,10.39
step
click Control Console##4141
turnin Samophlange##901 |goto The Barrens 52.41,11.64
accept Samophlange##902 |goto The Barrens 52.41,11.64
step
Kill enemies around this area
|tip You are about to have to complete a difficult escort quest soon.
|tip It will help a lot to be a level higher.
ding 16 |goto The Barrens 52.46,11.75
You can find more around: |notinsticky
[53.03,10.76]
[53.27,12.53]
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells and then we will hearth.
|tip This step will complete when your Hearthstone is ready to use.
Grind XP Until Your Hearth Is Ready |complete C_Container.GetItemCooldown(6948) <= 300 |goto The Barrens 52.46,11.75 |q 902
|only if Druid
step
Enter the building |goto Thunder Bluff 74.15,29.89 < 10 |walk
talk Turak Runetotem##3033
|tip Inside the building.
accept A Lesson to Learn##27 |goto Thunder Bluff 76.48,27.22
|only if Druid
step
talk Rahauro##11833
|tip He walks around this area.
accept Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83
accept Searching for the Lost Satchel##5722 |goto Thunder Bluff 70.51,31.83
|only if Druid and guideflag("RFCflag")
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##27 |goto Moonglade 56.21,30.64
accept Trial of the Lake##28 |goto Moonglade 56.21,30.64
|only if Druid
step
click Bauble Container##177785
|tip It looks like a wicker vase on the ground underwater.
|tip They spawn randomly, so you may have to search around this area.
collect 1 Shrine Bauble##15877 |goto Moonglade 54.33,55.65
Click Here to Continue |confirm |q 28
|only if Druid
step
use the Shrine Bauble##15877
Complete the Trial of the Lake |q 28/1 |goto Moonglade 35.92,41.38
|only if Druid
step
talk Tajarri##11799
turnin Trial of the Lake##28 |goto Moonglade 36.52,40.10
accept Trial of the Sea Lion##30 |goto Moonglade 36.52,40.10
|only if Druid
step
click Strange Lockbox##177794
|tip Underwater.
collect Half Pendant of Aquatic Agility##15883 |goto The Barrens 56.67,8.32 |q 30
|only if Druid
step
talk Loganaar##12042
Train your spells |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 3444
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
Prepare for Ragefire Chasm
|tip It will be a good time to start Ragefire Chasm soon.
|tip You should run it after the next 2 quests, roughly 30 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("RFCflag")
step
talk Wizzlecrank's Shredder##3439
|tip This is an escort quest.
|tip If it's not here, someone may be escorting it.
|tip Wait until it respawns.
accept Ignition##858 |goto The Barrens 56.51,7.45
step
Follow the path up |goto The Barrens 56.46,8.48 < 7 |only if walking
kill Supervisor Lugwizzle##3445
|tip He walks around this area on both levels of the platform.
|tip If the level 19 rare enemy is walking on the platform too, try to kill Supervisor Lugwizzle alone as fast as you can for the key, and run.
|tip If you have trouble, try to find someone to help you.
|tip If you can't get it done, you can skip the quest, and the escort quest after it.
|tip You can grind a little later to make up for it.
collect Ignition Key##5050 |q 858/1 |goto The Barrens 56.20,8.25
step
talk Wizzlecrank's Shredder##3439
|tip If it's not here, someone may be escorting it.
|tip Wait until it respawns.
turnin Ignition##858 |goto The Barrens 56.51,7.45
step
talk Wizzlecrank's Shredder##3439
|tip If it's not here, someone may be escorting it.
|tip Wait until it respawns.
accept The Escape##863 |goto The Barrens 56.51,7.45 |noautoaccept
step
Watch the dialogue
|tip Follow Wizzlecrank's Shredder and protect him as he walks.
|tip He eventually walks to this location.
Escort Wizzlecrank Out of the Venture Co. Drill Site |q 863/1 |goto The Barrens 55.35,7.70
step
Follow the path up |goto The Barrens 61.54,6.68 < 40 |only if walking
Kill Venture Co. enemies around this area
collect Cats Eye Emerald##5097 |q 896/1 |goto The Barrens 61.61,4.61
step
Head to Orgrimmar |goto Kalimdor/0 56.80,45.50 < 30 |notravel |only if not zone("Orgrimmar")
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
accept Hidden Enemies##5728 |goto Orgrimmar 31.74,37.83
|only if guideflag("RFCflag")
step
Head to Orgrimmar |goto Kalimdor/0 56.80,45.50 < 30 |notravel |only if not zone("Orgrimmar")
Follow the path down |goto Orgrimmar 55.22,40.76 < 15 |only if walking
talk Neeru Fireblade##3216
|tip Inside the building.
accept Slaying the Beast##5761 |goto Orgrimmar 49.49,50.60
|only if guideflag("RFCflag")
step
Run Ragefire Chasm
|tip You can use our Ragefire Chasm guide if you want assistance.
|tip After completing the dungeon, run outside to Orgrimmar and return to this guide.
|tip Do not follow the Ragefire Chasm turnin guide.
|loadguide "Dungeon Guides\\Ragefire Chasm (13-18)"
|confirm
|only if guideflag("RFCflag")
step
talk Neeru Fireblade##3216
|tip Inside the building.
turnin Slaying the Beast##5761 |goto Orgrimmar 49.49,50.60
|only if guideflag("RFCflag")
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5728 |goto Orgrimmar 31.74,37.83
accept Hidden Enemies##5729 |goto Orgrimmar 31.74,37.83
|only if guideflag("RFCflag")
step
talk Neeru Fireblade##3216
|tip Inside the building.
turnin Hidden Enemies##5729 |goto Orgrimmar 49.49,50.60
accept Hidden Enemies##5730 |goto Orgrimmar 49.49,50.60
|only if guideflag("RFCflag")
step
Follow the path up |goto Orgrimmar 48.35,49.33 < 10 |only if walking
Follow the path |goto Orgrimmar 56.91,40.80 < 10 |only if walking
Enter the building |goto Orgrimmar 40.07,37.01 < 10 |walk
talk Thrall##4949
|tip Inside the building.
turnin Hidden Enemies##5730 |goto Orgrimmar 31.74,37.83
|only if guideflag("RFCflag")
step
Kill enemies around this area
|tip You should already be this far into level 16, if you completed the escort quest in the previous steps.
|tip This grind will get you caught up, if you had to skip the quests.
ding 16,7000 |goto The Barrens 61.61,4.61
step
talk Xao'tsu##10088
Train your pet spells. |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 896
|only if Hunter
step
Head to Orgrimmar |goto Kalimdor/0 56.80,45.50 < 30 |notravel |only if not zone("Orgrimmar")
talk Ormak Grimshot##3352 |only if Hunter
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer	Ormak Grimshot##3352 |goto Orgrimmar/0 66.08,18.51 |only if Hunter |q 896
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 896
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 896
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 896
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 896
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 896
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 896
|tip Inside the building. |only if Warrior or Mage or Priest
step
Enter the building |goto Orgrimmar/0 81.00,19.85 < 10 |walk
talk Hanashi##2704
|tip Inside the building.
|tip This will allow you to equip staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Orgrimmar 81.53,19.63
|only if Hunter or Warlock or Priest
step
talk Therzok##6446
|tip Inside the Cleft of Shadow.
turnin The Shattered Hand##1963 |goto Orgrimmar 42.73,53.55
accept The Shattered Hand##1858 |goto Orgrimmar 42.73,53.55
|only if Orc Rogue and Troll Rogue
step
talk Shenthul##3401
|tip Inside the building.
learnspell Pick Pocket##921 |goto Orgrimmar 42.98,53.69
|only if Rogue
step
Enter the building |goto Orgrimmar 54.07,68.85 < 10 |walk
Use the _Pick Pocket_ Ability
|tip Use it on Gamon.
|tip Inside the building.
collect Tazan's Key##7208 |goto Orgrimmar 54.00,68.03 |q 1858
|only if Orc Rogue and Troll Rogue
step
use Tazan's Key##7208
|tip Use it on "Tazan's Satchel" in your bags.
collect Tazan's Logbook##7295 |q 1858/1
|only if Orc Rogue and Troll Rogue
step
talk Therzok##6446
|tip Inside the Cleft of Shadow.
turnin The Shattered Hand##1858 |goto Orgrimmar 42.73,53.55
|only if Orc Rogue and Troll Rogue
step
talk Shenthul##3401
|tip Inside the Cleft of Shadow.
accept Zando'zan##2379 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
talk Zando'zan##3402
|tip Inside the Cleft of Shadow.
turnin Zando'zan##2379 |goto Orgrimmar 42.73,52.95
accept Wrenix of Ratchet##2382 |goto Orgrimmar 42.73,52.95
|only if Rogue
step
Enter the building |goto Orgrimmar 40.27,36.98 < 10 |walk
talk Zor Lonetree##4047
accept The Spirits of Stonetalon##1061 |goto Orgrimmar 38.93,38.38
step
Enter the building |goto Orgrimmar 54.02,68.86 < 10 |walk
talk Innkeeper Gryshka##6929
|tip Inside the building.
|tip This quest may be gray but you still get full exp up to level 17.
turnin Ride to Orgrimmar##6384 |goto Orgrimmar 54.09,68.41
accept Doras the Wind Rider Master##6385 |goto Orgrimmar 54.09,68.41
|only if Orc or Troll
step
Enter the building |goto Orgrimmar 47.45,65.08 < 10 |walk
talk Doras##3310
|tip At the top of the tower.
turnin Doras the Wind Rider Master##6385 |goto Orgrimmar 45.12,63.89
accept Return to the Crossroads.##6386 |goto Orgrimmar 45.12,63.89
|tip This quest may be gray but you still get full exp up to level 17.
|only if Orc or Troll
step
talk Zargh##3489
turnin Return to the Crossroads.##6386 |goto The Barrens 52.62,29.84
|tip This quest may be gray but you still get full exp up to level 17.
|only if Orc or Troll
step
talk Darsok Swiftdagger##3449
|tip At the top of the tower.
turnin Harpy Raiders##867 |goto The Barrens 51.62,30.90
accept Harpy Lieutenants##875 |goto The Barrens 51.62,30.90
step
talk Tonga Runetotem##3448
turnin The Forgotten Pools##870 |goto The Barrens 52.26,31.93
accept The Stagnant Oasis##877 |goto The Barrens 52.26,31.93
step
talk Kalyimah Stormcloud##3487
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bigger bags.
Visit the Vendor |vendor Kalyimah Stormcloud##3487 |goto The Barrens 52.26,32.02 |q 877
step
talk Barg##3481
Buy more Arrows |vendor Barg##3481 |goto The Barrens/0 51.67,29.96 |q 877
|only if Hunter
step
Enter the building |goto The Barrens 52.03,30.16 < 10 |walk
talk Innkeeper Boorand Plainswind##3934
|tip Inside the building.
Stock up on Food/Water |vendor Innkeeper Boorand Plainswind##3934 |goto The Barrens 51.99,29.90 |q 877
step
talk Sergra Darkthorn##3338
turnin Prowlers of the Barrens##903 |goto The Barrens 52.24,31.01
accept Echeyakee##881 |goto The Barrens 52.24,31.01
step
talk Lizzarik##3658
|tip He looks like a goblin that travels on the road between Crossroads and Ratchet.
|tip If he's not here, skip this step, we'll try again later.
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Lizzarik##3658 |goto The Barrens 52.21,30.85 |q 869
|only if Warrior and itemcount(4778) == 0
step
talk Gazrog##3464
turnin Raptor Thieves##869 |goto The Barrens 51.93,30.32
accept Stolen Silver##3281 |goto The Barrens 51.93,30.32
step
talk Apothecary Helbrim##3390
turnin Fungal Spores##848 |goto The Barrens 51.44,30.15
step
use the Horn of Echeyakee##10327
kill Echeyakee##3475
|tip He looks like a white lion that spawns nearby.
collect Echeyakee's Hide##5100 |q 881/1 |goto The Barrens 55.85,17.08
step
talk Sergra Darkthorn##3338
turnin Echeyakee##881 |goto The Barrens 52.23,31.00
accept The Angry Scytheclaws##905 |goto The Barrens 52.23,31.00
step
talk Mankrik##3432
accept Consumed by Hatred##899 |goto The Barrens 51.95,31.58
accept Lost in Battle##4921 |goto The Barrens 51.95,31.58
step
talk Sikwa##9981
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 2".
|tip If you followed the Mulgore guide you should already have this and can skip these taming steps. |only if Tauren
Click Here to Continue |confirm |goto The Barrens 51.74,29.66 |q 881
|only if Hunter
step
_NOTE:_
|tip You can tame any other beast along the way to help you get here and find an Oasis Snapjaw to tame.
|tip Abandon whatever beast you tamed, before beginning to tame an Oasis Snapjaw.
Tame an Oasis Snapjaw
|tip Use your "Tame Beast" ability on an Oasis Snapjaw.
|tip They look like blue turtles around this area.
|tip Make sure to tame one that's level 15.
Click Here to Continue |confirm |goto The Barrens 55.47,41.73 |q 881
|only if Hunter
step
talk Reggifuz##10063
Learn the "Bite 2" Pet Ability
|tip Kill enemies en route to Ratchet until you see a message in your chat saying you learned "Bite 2".
|tip Abandon the Oasis Snapjaw and grab your permanent pet from the stables once you are in Ratchet.
|tip Teach "Bite 2" to your permanent pet.
Click Here to Continue |confirm |goto The Barrens/0 62.19,39.21 |q 881
|only if Hunter
step
talk Wrenix the Wretched##7161
turnin Wrenix of Ratchet##2382 |goto The Barrens 63.07,36.32
accept Plundering the Plunderers##2381 |goto The Barrens 63.07,36.32
|only if Rogue
step
talk Wrenix's Gizmotronic Apparatus##7166
Choose _"Press the yellow button labeled 'Thieves' Tools.'"_
collect Thieves' Tools##5060 |goto The Barrens 63.12,36.32 |q 2381
|only if Rogue and itemcount(5060) == 0
step
talk Wrenix's Gizmotronic Apparatus##7166
Choose _"Press the red button labeled 'E.C.A.C.'"_
collect E.C.A.C.##7970 |goto The Barrens 63.12,36.32 |q 2381
|only if Rogue and itemcount(7970) == 0
step
talk Sputtervalve##3442
turnin Samophlange##902 |goto The Barrens 62.98,37.22
turnin The Escape##863 |goto The Barrens 62.98,37.22
accept Ziz Fizziks##1483 |goto The Barrens 62.98,37.22
step
_Destroy This Item:_
|tip It is no longer needed.
trash Control Console Operating Manual##5088
|only if itemcount(5088) > 0
step
talk Wharfmaster Dizzywig##3453
turnin Miner's Fortune##896 |goto The Barrens 63.35,38.45
step
talk Fuzruckle##3496
|tip Deposit these items into the bank.
bank Plainstrider Kidney##4894 |goto The Barrens 62.64,37.42 |q 821 |future
bank Savannah Lion Tusk##4893 |goto The Barrens 62.64,37.42 |q 821 |future
step
talk Mebok Mizzyrix##3446
accept Deepmoss Spider Eggs##1069 |goto The Barrens 62.37,37.62
step
talk Lizzarik##3658
|tip He looks like a goblin that travels on the road between Crossroads and Ratchet.
|tip If he's not here, skip this step, we'll try again later.
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Lizzarik##3658 |goto The Barrens 61.76,38.27 |q 888
|only if Warrior and itemcount(4778) == 0
step
Follow the path |goto The Barrens 62.39,39.42 < 30 |only if walking and not subzone("The Merchant Coast")
Board the ship |goto The Barrens 64.18,45.49 < 10 |only if walking
click Buccaneer's Strongbox##123330+
|tip They look like small grey metal chests on the ground around this area.
|tip Downstairs inside the ship, on the middle level.
Reach Skill 85 in Lockpicking |skill Lockpicking,85 |goto The Barrens 65.06,45.43 |q 2381
|only if Rogue
step
_NOTE:_
Get Ready to Use the _E.C.A.C._
|tip In the next step, use it on Polly after you look the chest.
|tip Polly appears as a level 50 enemy, but weakens to level 18 when you use the E.C.A.C. on it.
Click Here to Continue |confirm |q 2381
|only if Rogue
step
click The Jewel of the Southsea##123462
|tip It looks like a small brown wooden chest on the ground.
|tip Downstairs inside the ship, on the bottom level.
collect Southsea Treasure##7968 |q 2381/1 |goto The Barrens 64.95,45.44
|only if Rogue
step
Follow the path |goto The Barrens 62.39,39.42 < 30 |only if walking and not subzone("The Merchant Coast")
click Fragile - Do Not Drop##3768
collect Telescopic Lens##5077 |q 888/2 |goto The Barrens 63.58,49.24
step
click Drizzlik's Emporium##3767
|tip These looks like a crate on the ground.
collect Shipment of Boots##5076 |q 888/1 |goto The Barrens 62.63,49.64
stickystart "Collect_Sunscale_Feathers"
stickystart "Collect_Intact_Raptor_Horns"
step
Follow the path |goto The Barrens 61.73,52.05 < 60 |only if walking
Follow the path |goto The Barrens 57.35,52.24 < 20 |only if walking
click Stolen Silver##147557
collect Stolen Silver##5061 |q 3281/1 |goto The Barrens 58.03,53.87
step
label "Collect_Sunscale_Feathers"
Kill Sunscale enemies around this area
|tip They look like purple raptors all around the Barrens.
|tip Sunscale Scytheclaws have the highest chance to drop these.
|tip These enemies can "Thrash" which means they can do multiple attacks at once. Be careful of getting low health! |only if hardcore
collect 3 Sunscale Feather##5165 |goto The Barrens 58.03,53.87 |q 905
|tip Be careful not to accidentally sell these to a vendor.
You can find more around [57.35,52.24]
stickystop "Collect_Intact_Raptor_Horns"
stickystart "Collect_Centaur_Bracers"
step
click Bubbling Fissure##3737
|tip Underwater.
Test the Dried Seeds |q 877/1 |goto The Barrens 55.61,42.74
step
kill Verog the Dervish##3395
|tip Kill Kolkar enemies around this whole area.
|tip Eventually, you will see a red yelled message in your chat window that means he appeared.
|tip The yelled message says "I am summoned! Intruders, come to my tent and face your death!"
|tip This may take a while.
|tip He spawns at this location.
collect Verog's Head##5023 |q 851/1 |goto The Barrens 52.91,41.77
step
label "Collect_Centaur_Bracers"
Kill Kolkar enemies around this area
|tip Kill them all around the Stagnant Oasis area. |notinsticky
collect 15 Centaur Bracers##5030 |q 855/1 |goto The Barrens 52.91,41.77
stickystart "Collect_Intact_Raptor_Horns"
step
click Blue Raptor Nest##6907
Visit the Blue Raptor Nest |q 905/1 |goto The Barrens 52.60,46.11
step
click Red Raptor Nest##6906
Visit the Red Raptor Nest |q 905/3 |goto The Barrens 52.46,46.57
step
click Yellow Raptor Nest##6908
Visit the Yellow Raptor Nest |q 905/2 |goto The Barrens 52.02,46.47
step
_Destroy These Items:_
|tip They are no longer needed.
trash Sunscale Feather##5165 |goto The Barrens 49.33,50.32
step
label "Collect_Intact_Raptor_Horns"
kill Sunscale Scytheclaw##3256+
|tip They look like purple raptors.
|tip They share spawn points with the other enemies, so kill those too, if you can't find any.
collect 5 Intact Raptor Horn##5055 |q 865/1 |goto The Barrens 52.42,46.33
You can find more around [50.30,45.88]
step
clicknpc Beaten Corpse##10668
|tip Kill enemies as you walk, to gain experience along the way.
Choose _"I inspect the body further."_
Find Mankrik's Wife |q 4921/1 |goto The Barrens 49.33,50.32
step
Enter the building |goto The Barrens 45.35,58.81 < 10 |walk
talk Innkeeper Byula##7714
|tip Inside the building.
|tip Stock up on food and water while you are here. There is a long grind ahead.
home Camp Taurajo |goto The Barrens 45.58,59.04
step
talk Mangletooth##3430
accept Tribes at War##878 |goto The Barrens 44.55,59.24
step
talk Omusa Thunderhorn##10378
fpath Camp Taurajo |goto The Barrens 44.45,59.15
step
talk Gazrog##3464
turnin Stolen Silver##3281 |goto The Barrens 51.93,30.32
step
talk Lizzarik##3658
|tip He looks like a goblin that travels on the road between Crossroads and Ratchet.
|tip If he's not here, skip this step.
buy Heavy Spiked Mace##4778 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Lizzarik##3658 |goto The Barrens 52.21,30.85 |q 905
|only if Warrior and itemcount(4778) == 0
step
talk Sergra Darkthorn##3338
turnin The Angry Scytheclaws##905 |goto The Barrens 52.23,31.01
accept Jorn Skyseer##3261 |goto The Barrens 52.23,31.01
step
talk Mankrik##3432
turnin Lost in Battle##4921 |goto The Barrens 51.95,31.58
step
talk Tonga Runetotem##3448
turnin The Stagnant Oasis##877 |goto The Barrens 52.26,31.93
accept Altered Beings##880 |goto The Barrens 52.26,31.93
step
_Destroy This Item:_
|tip It is no longer needed.
trash Dried Seeds##5068
step
talk Kalyimah Stormcloud##3487
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bigger bags.
Visit the Vendor |vendor Kalyimah Stormcloud##3487 |goto The Barrens 52.26,32.02 |q 880
step
talk Uthrok##3488
buy Fine Longbow##11304 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Uthrok##3488 |goto The Barrens 51.11,29.06 |q 880
|only if Hunter and itemcount(11304) == 0
step
talk Uthrok##3488
buy Medium Quiver##11362 |n
|tip If you can afford it.
Visit the Vendor |vendor Uthrok##3488 |goto The Barrens 51.11,29.06 |q 880
|only if Hunter and itemcount(11362) == 0
step
talk Uthrok##3488
|tip Buy enough ammo to fill your ammo bag, plus 3-4 extra stacks.								|only if Hunter
|tip You are about to quest for a while and there's nowhere to buy ammo along the way.
Visit the Vendor |vendor Uthrok##3488 |goto The Barrens 51.11,29.06 |q 880
|only if Hunter
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
turnin Centaur Bracers##855 |goto The Barrens 45.34,28.41
turnin Verog the Dervish##851 |goto The Barrens 45.34,28.41
accept Hezrul Bloodmark##852 |goto The Barrens 45.34,28.41
step
kill Witchwing Slayer##3278+
|tip These enemies know execute and will kill you if you drop below 20% hp, be careful!
|tip Be careful to avoid Sister Rathtalon.
|tip She looks like an elite green harpy that flies around this area.
|tip There are also Witchwing Ambusher harpies that can stealth, so be careful.
collect 6 Harpy Lieutenant Ring##5065 |q 875/1 |goto The Barrens 39.46,15.20
step
Kill enemies around this area
|tip You want to be atleast level 18 for future quests.
ding 18 |goto The Barrens 39.46,15.20
step
use the Grimoire of Consume Shadows (Rank 1)##16357
|tip You should have purchased this in a previous guide.
Teach Your Voidwalker Consume Shadows (Rank 1) |learnpetspell Consume Shadows##17767 |goto The Barrens 25.66,77.66
|tip You need to have your voidwalker active to be able to learn these new spells.
|only if Warlock
step
_NOTE:_
Save Wool Cloth in Your Bank as You Level
|tip You are reaching the level where Wool Cloth will start to drop regularly
|tip You will need 240 Wool Cloth later.
|tip As you level and collect these cloth naturally from killing enemies while following the guide, make sure you deposit the cloth into a bank whenever you are near one.
|tip This will give you about 40,000 quick and easy xp to help you get to level 60 faster in the longer later levels.
Click Here to Continue |confirm
|only if level < 60
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stonetalon Mountains (18-19)',
  {
    image = ZGV.IMAGESDIR .. 'Stonetalon Mountains',
    condition_suggested = function()
      return level >= 18 and level <= 19 and not completedq(1094)
    end,
    next = 'Leveling Guides\\The Barrens (19-20)',
    hardcore = true,
  },
  [[
step
Follow the path to Stonetalon Mountains |goto The Barrens 40.17,24.03 < 70 |only if walking
talk Seereth Stonebreak##4049
turnin The Spirits of Stonetalon##1061 |goto The Barrens 35.26,27.88
accept Goblin Invaders##1062 |goto The Barrens 35.26,27.88
step
talk Makaba Flathoof##11857
accept Avenge My Village##6548 |goto The Barrens 35.19,27.79
stickystart "Kill_Grimtotem_Ruffians"
step
Follow the path |goto Stonetalon Mountains 82.09,96.48 < 40 |only if walking
kill 8 Grimtotem Ruffian##11910 |q 6548/1 |goto Stonetalon Mountains 82.02,88.63
step
label "Kill_Grimtotem_Ruffians"
kill 6 Grimtotem Mercenary##11911 |q 6548/2 |goto Stonetalon Mountains 82.02,88.63
step
Follow the path |goto Stonetalon Mountains 80.52,93.47 < 40 |only if walking
talk Makaba Flathoof##11857
turnin Avenge My Village##6548 |goto The Barrens 35.19,27.79
accept Kill Grundig Darkcloud##6629 |goto The Barrens 35.19,27.79
stickystart "Kill_Grimtotem_Brutes"
step
Follow the path |goto Stonetalon Mountains 82.09,96.48 < 40 |only if walking
Follow the path up |goto Stonetalon Mountains 75.89,91.45 < 30 |only if walking
Follow the path |goto Stonetalon Mountains 71.50,88.59 < 30 |only if walking
kill Grundig Darkcloud##11858 |q 6629/1 |goto Stonetalon Mountains 73.65,86.13
|tip We will take the slightly longer way around to get to him, but it will clear path for the escort quest you accept after killing him.
step
label "Kill_Grimtotem_Brutes"
kill 6 Grimtotem Brute##11912 |q 6629/2 |goto Stonetalon Mountains 73.65,86.60
You can find more around: |notinsticky
[75.46,86.48]
[71.76,86.49]
step
Enter the building |goto Stonetalon Mountains 73.64,86.09 < 10 |walk
talk Kaya Flathoof##11856
|tip Inside the building.
|tip This is an escort quest.
|tip If she's not here, someone may be escorting her.
|tip Wait until she respawns.
accept Protect Kaya##6523 |goto Stonetalon Mountains 73.48,85.59 |noautoaccept
step
Watch the dialogue
|tip Follow Kaya Flathoof and protect her as she walks.
|tip She eventually walks to this location.
|tip You will be attacked by a group of 3 enemies near the end of the escort.
|tip Kill the Grimtotem Sorcerer first, when the group of enemies appears.
Escort Kaya to Camp Aparaje |q 6523/1 |goto Stonetalon Mountains 77.10,90.84
|tip If you have trouble, try to find someone to help you, or skip the quest.
step
Follow the path |goto Stonetalon Mountains 72.13,90.84 < 40 |only if walking
talk Xen'Zilla##12816
|tip Inside the building.
accept Blood Feeders##6461 |goto Stonetalon Mountains 71.24,95.02
stickystart "Collect_Deepmoss_Eggs"
stickystart "Kill_Deepmoss_Creepers"
step
label "Kill_Deepmoss_Creepers"
kill 10 Deepmoss Creeper##4005 |q 6461/1 |goto Stonetalon Mountains 59.23,75.59
|tip They look like green spiders.
|tip Kill them as you walk along the road.
You can find more up the path that starts at [58.08,76.04]
step
talk Jeeda##4083
|tip Upstairs in the inn.
|tip She can sell healing potions as a limited supply item, check if they are in stock.
Sell your trash and buy potions |vendor Jeeda##4083 |goto Stonetalon Mountains/0 47.61,61.59 |q 6461
step
talk Tharm##4312
fpath Sun Rock Retreat |goto Stonetalon Mountains 45.13,59.84
stickystart "Kill_Deepmoss_Venomspitters"
step
Follow the path |goto Stonetalon Mountains 60.93,69.48 < 40 |only if walking
Enter the building |goto Stonetalon Mountains 59.04,62.24 < 10 |walk
talk Ziz Fizziks##4201
|tip Inside the building.
turnin Ziz Fizziks##1483 |goto Stonetalon Mountains 58.99,62.60
accept Super Reaper 6000##1093 |goto Stonetalon Mountains 58.99,62.60
step
label "Collect_Deepmoss_Eggs"
click Deepmoss Eggs##19541+
|tip They look like large white eggs on the ground around this area.
|tip Sometimes enemies will spawn after looting them.
collect 15 Deepmoss Egg##5570 |q 1069/1 |goto Stonetalon Mountains 61.74,61.21
step
label "Kill_Deepmoss_Venomspitters"
kill 7 Deepmoss Venomspitter##4007 |q 6461/2 |goto Stonetalon Mountains 61.74,61.21
|tip They look like green spiders. |notinsticky
stickystart "Kill_Venture_Co_Loggers"
step
talk Veenix##4086
buy Kris##2209 |n
|tip If you can afford it.
|tip You will be able to use it at level 19 soon.
|tip If you have better, skip this step.
Visit the Vendor |vendor Veenix##4086 |goto Stonetalon Mountains 58.22,51.74 |q 1093
|only if Rogue and itemcount(2209) == 0
step
kill Venture Co. Operator##3988+
collect Super Reaper 6000 Blueprints##5734 |q 1093/1 |goto Stonetalon Mountains 62.33,53.49
You can find more around: |notinsticky
[Stonetalon Mountains 66.16,52.01]
[Stonetalon Mountains 66.49,45.90]
[Stonetalon Mountains 70.97,43.13]
[Stonetalon Mountains 73.02,49.47]
[Stonetalon Mountains 74.68,55.44]
step
label "Kill_Venture_Co_Loggers"
kill 15 Venture Co. Logger##3989 |q 1062/1 |goto Stonetalon Mountains 60.44,52.78
You can find more around: |notinsticky
[71.20,56.50]
[70.01,48.11]
[64.24,46.72]
step
Enter the building |goto Stonetalon Mountains 59.04,62.24 < 10 |walk
talk Ziz Fizziks##4201
|tip Inside the building.
turnin Super Reaper 6000##1093 |goto Stonetalon Mountains 58.99,62.60
accept Further Instructions##1094 |goto Stonetalon Mountains 58.99,62.60
step
Kill enemies around this area
|tip You are about to have to kill a level 22 enemy soon.
|tip It will help to be a level higher.
ding 19 |goto Stonetalon Mountains 61.74,61.21
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\The Barrens (19-20)',
  {
    image = ZGV.IMAGESDIR .. 'The Barrens',
    condition_suggested = function()
      return level >= 19 and level <= 20 and not completedq(6629)
    end,
    next = 'Leveling Guides\\Stonetalon Mountains (20-21)',
    hardcore = true,
  },
  [[
step
talk Jorn Skyseer##3387
turnin Jorn Skyseer##3261 |goto The Barrens 44.86,59.14
|tip This quest-chain starts in The Barrens (12-18) with "That Plainstrider Menace".
accept Ishamuhale##882 |goto The Barrens 44.86,59.14
stickystart "Collect_Hoof_Of_Lakotamani"
step
kill Stormsnout##3240+
collect Thunder Lizard Horn##4895 |q 821/3 |goto The Barrens 47.33,55.94
You can find more around: |notinsticky
[48.39,56.91]
[49.98,53.64]
stickystart "Kill_Bristleback_Water_Seekers"
stickystart "Kill_Bristleback_Thornweavers"
stickystart "Kill_Bristleback_Geomancers"
step
Kill Bristleback enemies around this area
collect 60 Bristleback Quilboar Tusk##5085 |q 899/1 |goto The Barrens 51.18,56.02
You can find more around: |notinsticky
[52.85,53.42]
step
label "Kill_Bristleback_Water_Seekers"
kill 6 Bristleback Water Seeker##3260 |q 878/1 |goto The Barrens 51.18,56.02
You can find more around: |notinsticky
[52.85,53.42]
[46.49,53.26]
step
label "Kill_Bristleback_Thornweavers"
kill 12 Bristleback Thornweaver##3261 |q 878/2 |goto The Barrens 51.18,56.02
You can find more around: |notinsticky
[52.85,53.42]
step
label "Kill_Bristleback_Geomancers"
kill 12 Bristleback Geomancer##3263 |q 878/3 |goto The Barrens 51.18,56.02
You can find more around: |notinsticky
[52.85,53.42]
[40.40,45.20]
step
label "Collect_Blood_Shard"
Kill Bristleback enemies around this area
collect Blood Shard##5075 |goto The Barrens 51.18,56.02 |q 5052 |future
|tip Be careful not to accidentally sell this to a vendor.
You can find more around: |notinsticky
[52.85,53.42]
step
label "Collect_Hoof_Of_Lakotamani"
kill Lakota'mani##3474
|tip It looks like a grey kodo that walks around this area.
|tip It's level 22, but you should be able to kill it at this level.
|tip if you have trouble, try to find someone to help you, or skip the quest. |notinsticky
|tip You can make up for it by grinding a bit later. |notinsticky
|tip Grind mobs while you look for Lakota'mani. |notinsticky
collect Hoof of Lakota'mani##5099 |goto The Barrens 50.09,53.20 |q 883 |future
He can also be around: |notinsticky
[46.73,50.93]
[46.03,49.58]
[44.62,49.07]
step
use the Hoof of Lakota'mani##5099
accept Lakota'mani##883 |goto The Barrens 55.53,42.70
|only if itemcount(5099) > 0
stickystart "Collect_Zhevra_Carcass"
step
kill Oasis Snapjaw##3461+
|tip They look like turtles.
|tip Underwater and along the edges of the water around this area.
collect 8 Altered Snapjaw Shell##5098 |q 880/1 |goto The Barrens 55.53,42.70
step
label "Collect_Zhevra_Carcass"
kill Zhevra Charger##3426+
|tip Kill a Zhevra en route.
collect Fresh Zhevra Carcass##10338 |goto The Barrens 60.55,32.81 |q 882
step
use the Fresh Zhevra Carcass##10338
kill Ishamuhale##3257
|tip Grind en route.
|tip He looks like a raptor that appears nearby.
collect Ishamuhale's Fang##5101 |q 882/1 |goto The Barrens 59.89,30.29
step
talk Wrenix the Wretched##7161
turnin Plundering the Plunderers##2381 |goto The Barrens 63.07,36.32
|only if Rogue
step
Enter the building |goto The Barrens 62.89,36.52 < 10 |walk
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Stolen Booty##888 |goto The Barrens 62.68,36.23
step
talk Sputtervalve##3442
turnin Further Instructions##1094 |goto The Barrens 62.98,37.22
accept Further Instructions##1095 |goto The Barrens 62.98,37.22
step
talk Fuzruckle##3496
|tip Collect these items from the bank.
collect 5 Plainstrider Kidney##4894 |goto The Barrens 62.64,37.42 |q 821
collect 5 Savannah Lion Tusk##4893 |goto The Barrens 62.64,37.42 |q 821
step
talk Mebok Mizzyrix##3446
turnin Raptor Horns##865 |goto The Barrens 62.37,37.62
turnin Deepmoss Spider Eggs##1069 |goto The Barrens 62.37,37.62
step
_Destroy These Items:_
|tip They are no longer needed.
trash Deepmoss Egg##5570 |goto The Barrens 62.26,38.39
step
talk Brewmaster Drohn##3292
turnin Chen's Empty Keg##821 |goto The Barrens 62.26,38.39
accept Chen's Empty Keg##822 |goto The Barrens 62.26,38.39
step
talk Vexspindle##3492
|tip Inside the building.
|tip He can sell Wolf Bracers, which are very strong bracers for a long time. |only if Hunter or Rogue or Shaman or Druid
|tip Purchase them if they are available. |only if Hunter or Rogue or Shaman or Druid
Vendor your Trash |vendor Vexspindle##3492 |goto The Barrens/0 62.16,38.45 |q 875
step
talk Darsok Swiftdagger##3449
|tip At the top of the tower.
turnin Harpy Lieutenants##875 |goto The Barrens 51.62,30.90
accept Serena Bloodfeather##876 |goto The Barrens 51.62,30.90
step
talk Mankrik##3432
turnin Consumed by Hatred##899 |goto The Barrens 51.95,31.58
step
_Destroy These Items:_
|tip They are no longer needed.
trash Bristleback Quilboar Tusk##5085 |goto The Barrens 52.26,31.93
step
talk Tonga Runetotem##3448
turnin Altered Beings##880 |goto The Barrens 52.26,31.93
accept Hamuul Runetotem##1489 |goto The Barrens 52.26,31.93
accept Mura Runetotem##3301 |goto The Barrens 52.26,31.93
step
talk Apothecary Helbrim##3390
accept Apothecary Zamah##853 |goto The Barrens 51.44,30.15
step
_NOTE:_
You Have a Timed Quest
|tip You just picked up a timed quest, so try to hurry when completing the next steps until you turn the quest in.
|tip The quest is called "Apothecary Zamah", and you will complete it in Thunder Bluff soon.
Click Here to Continue |confirm |q 853
step
talk Mangletooth##3430
turnin Tribes at War##878 |goto The Barrens 44.55,59.24
accept Blood Shards of Agamaggan##5052 |goto The Barrens 44.55,59.24
step
talk Mangletooth##3430
turnin Blood Shards of Agamaggan##5052 |goto The Barrens 44.55,59.24
step
_NOTE:_
talk Mangletooth##3430
|tip You can now talk to Mangletooth and give him Blood Shards in exchange for buffs.
|tip Any time you are going to be questing in the Barrens, and you have extra Blood Shards available, try to get some buffs to make questing faster.
|tip Below is the recommended buffs for your class.
|tip Spirit of the Wind is by far the highest priority as travel time is one of the biggest parts of leveling speed.
|tip Razorhide is also highly recommended if you know you'll be fighting regularly for the next 10 minutes as it is a large DPS increase. |only if not Hunter or Warlock
|tip
|tip SPIRIT OF THE WIND
|tip +30% Movement Speed (5 Minutes) - 10 Blood Shards
|tip Note: This buff does NOT stack with other run speed increase abilities.
|tip |only if not Warlock or Priest or Mage
|tip AGAMAGGAN'S STRENGTH |only if not Warlock or Priest or Mage
|tip +10 Strength (30 Minutes) - 4 Blood Shards |only if not Warlock or Priest or Mage
|tip
|tip AGAMAGGAN'S AGILITY
|tip +10 Agility (30 Minutes) - 4 Blood Shards
|tip |only if not Warrior or Rogue
|tip WISDOM OF AGAMAGGAN |only if not Warrior or Rogue
|tip +10 Intellect (30 Minutes) - 4 Blood Shards |only if not Warrior or Rogue
|tip
|tip RISING SPIRIT
|tip +25 Spirit (30 Minutes) - 4 Blood Shards
|tip
|tip RAZORHIDE |only if not Hunter or Warlock
|tip +95 Armor and Returns Damage to Enemies (10 Minutes) - 4 Blood Shards |only if not Hunter or Warlock
|tip |only if not Hunter or Warlock
Click Here to Continue |confirm |goto The Barrens 44.55,59.24 |q 883 |future
step
Kill enemies around this area
|tip You should already hit level 20 from turning in quests, but this is in case you didn't.
|tip You are about to go to Thunder Bluff, where you can learn your level 20 abilities.
ding 20 |goto The Barrens 46.01,54.01
step
talk Jorn Skyseer##3387
turnin Ishamuhale##882 |goto The Barrens 44.86,59.14
accept Enraged Thunder Lizards##907 |goto The Barrens 44.86,59.14
turnin Lakota'mani##883 |goto The Barrens 44.86,59.14
step
kill Thunderhead##3239+
collect 3 Thunder Lizard Blood##5143 |q 907/1 |goto The Barrens 45.68,62.35
You can find more around [48.77,60.76]
step
talk Jorn Skyseer##3387
turnin Enraged Thunder Lizards##907 |goto The Barrens 44.86,59.14
accept Cry of the Thunderhawk##913 |goto The Barrens 44.86,59.14
step
Kill Thunderhawk enemies around this area
|tip They look like Wind Serpents.
collect Thunderhawk Wings##5164 |q 913/1 |goto The Barrens 45.94,56.31
You can find more around: |notinsticky
[49.27,55.13]
[48.55,56.71]
[48.11,60.01]
step
talk Jorn Skyseer##3387
turnin Cry of the Thunderhawk##913 |goto The Barrens 44.86,59.14
accept Mahren Skyseer##874 |goto The Barrens 44.86,59.14
step
talk Mangletooth##3430
|tip You are about to journey to Thunder Bluff, grab Spirit of the Wind before going if you do not alredy have the flight path.
Click Here to Continue |confirm |goto The Barrens 44.55,59.24 |q 853 |future
|only if itemcount(5075) >= 10 and not Tauren
step
Ride the elevator up to enter Thunder Bluff |goto Thunder Bluff 31.78,66.01 < 15 |c |q 853
|only if not Tauren
step
Enter the building |goto Thunder Bluff 44.99,62.17 < 10 |walk
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71
step
Optional Route Change
|tip You can opt to do Wailing Caverns soon instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Wailing Caverns, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Wailing Caverns later |confirm WCflag
Click Here if you'd prefer to grind |confirm
step
Enter the building |goto Thunder Bluff 53.89,55.52 < 10 |walk
talk Etu Ragetotem##3020
|tip Inside the building.
buy Maul##924 |n
|tip If you can afford it.
|tip You will use it when you reach level 21.
|tip If you have better or plan on running Wailing Caverns, skip this step.
Visit the Vendor |vendor Etu Ragetotem##3020 |goto Thunder Bluff 53.19,58.29 |q 853
|only if Warrior and itemcount(924) == 0
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if Priest or Mage |q 1489
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
Train your spells. |trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 1489
Train your spells. |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 1489
Train your spells. |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 1489
Train your spells. |trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 1489
Train your spells. |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 1489
|tip Inside the building. |only if Warrior or Hunter
|tip Inside the cave |only if Priest or Mage
step
talk Hesuwa Thunderhorn##10086
Train your pet spells. |trainer Hesuwa Thunderhorn##10086 |goto Thunder Bluff/0 54.21,83.86
|only if Hunter
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if not subzone("The Pools of Vision")
talk Apothecary Zamah##3419
|tip Inside the cave.
|tip It is usually recommended to take the Swiftness Potions as they can be used to escape deadly situations. |only if hardcore
turnin Apothecary Zamah##853 |goto Thunder Bluff 22.81,20.90
accept Serpentbloom##962 |goto Thunder Bluff 22.82,20.90 |only if guideflag("WCflag")
step
talk Clarice Foster##5543
|tip She patrols inside the cave.
accept Until Death Do Us Part##264 |goto Thunder Bluff/0 28.78,26.03
step
talk Rahauro##11833
|tip He walks around this area.
turnin Returning the Lost Satchel##5724 |goto Thunder Bluff 70.51,31.83 |only if completedq(5724)
turnin Testing an Enemy's Strength##5723 |goto Thunder Bluff 70.51,31.83 |only if completedq(5723)
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if subzone("The Pools of Vision")
Enter the building |goto Thunder Bluff 74.12,29.89 < 10 |walk
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin Hamuul Runetotem##1489 |goto Thunder Bluff 78.62,28.56
accept Nara Wildmane##1490 |goto Thunder Bluff 78.62,28.56
step
talk Kym Wildmane##3036
Train your level 20 spells. |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |q 1490
|only if Druid
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Nara Wildmane##1490 |goto Thunder Bluff 75.65,31.61
accept Leaders of the Fang##914 |goto Thunder Bluff 75.65,31.60 |only if guideflag("WCflag")
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if subzone("The Pools of Vision")
talk Kuna Thunderhorn##3015
buy Heavy Recurve Bow##3027 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kuna Thunderhorn##3015 |goto Thunder Bluff 47.00,45.70 |q 876
|only if Hunter and itemcount(3027) == 0
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if subzone("The Pools of Vision")
talk Tal##2995
|tip At the top of the tower.
fpath Thunder Bluff |goto Thunder Bluff 46.98,49.84
step
talk Mirket##3325
Train your level 20 spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97  |q 264
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent, inside the Cleft of Shadow.
accept Devourer of Souls##1507 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1509 |future
|only if Warlock
step
talk Cazul##5909
|tip Inside the Cleft of Shadow.
turnin Devourer of Souls##1507 |goto Orgrimmar 47.06,46.48
accept Blind Cazul##1508 |goto Orgrimmar 47.06,46.48
|only if Warlock
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Dusk Wand##5211 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 1510 |future
|only if Warlock and itemcount(5211) == 0
step
Enter the building |goto Orgrimmar 38.07,60.65 < 15 |walk
talk Zankaja##5910
|tip Inside the building.
turnin Blind Cazul##1508 |goto Orgrimmar 37.03,59.45
accept News of Dogran##1509 |goto Orgrimmar 37.03,59.45
|only if Warlock
step
talk Gazrog##3464
turnin News of Dogran##1509 |goto The Barrens 51.93,30.32
accept News of Dogran##1510 |goto The Barrens 51.93,30.32
|only if Warlock
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Dusk Wand##5211 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 1510 |future
|only if Priest and itemcount(5211) == 0
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Dusk Wand##5211 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 1510 |future
|only if Mage and itemcount(5211) == 0
step
Enter the building |goto Orgrimmar 38.75,83.34 < 10 |only if walking
talk Thuul##5958
|tip Upstairs, on top of the building.
learnspell Teleport: Orgrimmar##3567 |goto Orgrimmar 38.68,85.41
|only if Mage
step
kill Hezrul Bloodmark##3396
|tip He patrols around the lake.
|tip He has two lower level guards with him. At this level most classes should be able to kill Hezrul and run away, then loot the head after the guards reset.
|tip If you are worried, ask for help in chat or skip this step. You will need to grind a few thousand experience later if you opt to skip.
|tip You can use fear on one of the guards if the area is clear of extra enemies. |only if Warlock
collect Hezrul's Head##5025 |q 852/1 |goto The Barrens 46.40,37.60
step
talk Regthar Deathgate##3389
|tip Upstairs inside the building.
turnin Hezrul Bloodmark##852 |goto The Barrens 45.34,28.41
step
kill Serena Bloodfeather##3452
|tip Be careful, some of the harpies are stealthed around this area.
collect Serena's Head##5067 |q 876/1 |goto The Barrens 39.16,12.17
step
Prepare for Wailing Caverns
|tip It will be a good time to start Wailing Caverns soon.
|tip You should run it after getting the flight path in Stonetalon Mountains, roughly 15 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("WCflag")
step
Follow the path to Stonetalon Mountains |goto The Barrens 40.17,24.03 < 70 |only if walking
talk Seereth Stonebreak##4049
turnin Goblin Invaders##1062 |goto The Barrens 35.26,27.88
step
Watch the dialogue
talk Seereth Stonebreak##4049
accept The Elder Crone##1063 |goto The Barrens 35.26,27.88
accept Shredding Machines##1068 |goto The Barrens 35.26,27.88
step
talk Makaba Flathoof##11857
turnin Protect Kaya##6523 |goto The Barrens 35.19,27.79
accept Kaya's Alive##6401 |goto The Barrens 35.19,27.79
turnin Kill Grundig Darkcloud##6629 |goto The Barrens 35.19,27.79
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stonetalon Mountains (20-21)',
  {
    image = ZGV.IMAGESDIR .. 'Stonetalon Mountains',
    condition_suggested = function()
      return level >= 20 and level <= 21 and not completedq(1068)
    end,
    next = 'Leveling Guides\\Ashenvale (21-22)',
    hardcore = true,
  },
  [[
step
Follow the path up and through the mountains |goto Stonetalon Mountains 82.07,98.57 < 20 |only if walking and subzone("The Barrens")
Enter the cave |goto Stonetalon Mountains 74.22,97.13 < 10 |walk
talk Witch Doctor Jin'Zil##3995
|tip Inside the cave.
|tip You must be level 20 to accept this quest.
accept Jin'Zil's Forest Magic##1058 |goto Stonetalon Mountains 74.54,97.94
step
talk Ken'zigla##4197
turnin News of Dogran##1510 |goto Stonetalon Mountains 73.25,95.13
accept Ken'zigla's Draught##1511 |goto Stonetalon Mountains 73.25,95.13
|only if Warlock
step
talk Xen'Zilla##12816
|tip Inside the building.
turnin Blood Feeders##6461 |goto Stonetalon Mountains 71.24,95.02
step
Follow the road to this path |goto Stonetalon Mountains 51.64,61.06 < 40 |only if walking and not subzone ("Sun Rock Retreat")
Follow the path up |goto Stonetalon Mountains 49.20,61.91 < 20 |only if walking
talk Tsunaman##11862
|tip It walks around this area.
accept Trouble in the Deeps##6562 |goto Stonetalon Mountains 47.37,64.29
accept Elemental War##6393 |goto Stonetalon Mountains 47.37,64.29
step
talk Tharm##4312
fpath Sun Rock Retreat |goto Stonetalon Mountains 45.13,59.84
step
talk Tammra Windfield##11864
turnin Kaya's Alive##6401 |goto Stonetalon Mountains 47.46,58.38
|only if haveq(6401) or completedq(6401)
step
talk Gereck##10048
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 3".
Click Here to Continue |confirm |goto Stonetalon Mountains 47.93,61.39 |q 1095
|only if Hunter
step
_NOTE:_
Tame a Deepmoss Creeper
|tip Use your "Tame Beast" ability on a Deepmoss Creeper.
|tip They look like green spiders around this area.
Learn the "Bite 3" Pet Ability
|tip Kill enemies around this area, as you walk back to Sun Rock Retreat, until you see a message in your chat saying you learned "Bite 3".
|tip You will teach "Bite 3" to your permanent pet soon.
Click Here to Continue |confirm |goto Stonetalon Mountains 59.46,74.32 |q 1095
|only if Hunter
step
talk Gereck##10048
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Bite 3" to your permanent pet.
Click Here to Continue |confirm |goto Stonetalon Mountains 47.93,61.39 |q 1095
|only if Hunter
step
talk Jeeda##4083
|tip Upstairs in the inn.
|tip She can sell healing potions as a limited supply item, check if they are in stock.
Sell your trash and buy potions |vendor Jeeda##4083 |goto Stonetalon Mountains/0 47.61,61.59 |q 1095
|only if Hunter
step
talk Crane Operator Bigglefuzz##3665
|tip We are starting to head to Wailing Caverns now.
accept Trouble at the Docks##959 |goto The Barrens 63.09,37.61
|only if guideflag("WCflag")
step
Follow the path up |goto The Barrens 50.32,35.44 < 10 |only if walking
Continue up the path |goto The Barrens 49.17,34.09 < 10 |only if walking
Follow the path |goto The Barrens 48.09,32.95 < 10 |only if walking
Follow the path down |goto The Barrens 47.28,33.56 < 10 |only if walking
Jump down here |goto The Barrens 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto The Barrens 45.77,36.16 < 5 |c |q 3369 |future |or
|tip Aim for the stone.
'|complete completedq(1486) and completedq(1487)
|only if guideflag("WCflag")
step
Enter the cave |goto The Barrens 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
accept Deviate Hides##1486 |goto The Barrens 45.98,35.66
|only if guideflag("WCflag")
step
talk Ebru##5768
|tip Inside the cave.
accept Deviate Eradication##1487 |goto The Barrens 46.01,35.74
|only if guideflag("WCflag")
step
Enter the cave |goto The Barrens 45.97,36.33 < 10 |walk
Follow the path |goto The Barrens 45.91,35.62 < 10 |walk
Continue follow the path |goto The Barrens 46.26,34.98 < 10 |walk
Follow the path |goto The Barrens 45.94,34.24 < 10 |walk
kill Mad Magglish##3655
|tip He is stealthed inside the cave.
|tip Do not attempt to do this quest until you have your group with you.
collect 99-Year-Old Port##5334 |q 959/1 |goto The Barrens 45.69,33.60
You can also find him around: |notinsticky
[46.84,34.63]
[46.47,35.50]
|only if guideflag("WCflag")
step
Run Wailing Caverns
|tip You can use our Wailing Caverns guide if you want assistance.
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Wailing Caverns quest turnin guide.
|loadguide "Dungeon Guides\\Wailing Caverns (15-25)"
|confirm
|only if guideflag("WCflag")
step
collect Glowing Shard##10441 |n
use the Glowing Shard##10441
accept The Glowing Shard##6981 |or
'|accept The Glowing Shard##3366 |or
|only if itemcount(10441) > 0
step
Follow the path up |goto Wailing Caverns/0 47.59,34.46 < 7 |only if walking
Cross the bridge |goto Wailing Caverns/0 47.52,33.91 < 7 |only if walking
Continue following the path |goto Wailing Caverns/0 47.41,32.89 < 7 |only if walking
Cross the water |goto Wailing Caverns/0 46.91,32.63 < 10 |only if walking
Continue following the path |goto Wailing Caverns/0 45.86,33.34 < 10 |only if walking
Leave the cave |goto Wailing Caverns/0 45.95,36.21 < 7 |c |q 3369 |future
|only if guideflag("WCflag")
step
Follow the path up |goto Wailing Caverns/0 50.32,35.44 < 10 |only if walking
Continue up the path |goto Wailing Caverns/0 49.17,34.09 < 10 |only if walking
Follow the path |goto Wailing Caverns/0 48.09,32.95 < 10 |only if walking
Follow the path down |goto Wailing Caverns/0 47.28,33.56 < 10 |only if walking
Jump down here |goto Wailing Caverns/0 45.86,35.86 < 10 |only if walking
Jump down carefully here |goto Wailing Caverns/0 45.77,36.16 < 5 |c |q 3369 |future |or
|tip Aim for the stone.
'|complete completedq(1486) and completedq(1487) |or
|only if guideflag("WCflag")
step
Enter the cave |goto The Barrens 45.85,35.95 < 5 |walk
talk Nalpak##5767
|tip Inside the cave.
|tip If you did not finish this quest we will not run Wailing Caverns again in our guide. |only if not completedq(1486)
|tip You should abandon the quest unless you plan to do Wailing Caverns more for your own enjoyment. |only if not completedq(1486)
turnin Deviate Hides##1486 |goto The Barrens 45.98,35.66
|only if guideflag("WCflag")
step
talk Ebru##5768
|tip Inside the cave.
|tip It is possible to get very unlucky and not finish this quest. |only if not completedq(1487)
|tip You should abandon the quest unless you plan to do Wailing Caverns more for your own enjoyment. |only if not completedq(1487)
turnin Deviate Eradication##1487 |goto The Barrens 46.01,35.74
|only if guideflag("WCflag")
step
talk Mebok Mizzyrix##3446
turnin Smart Drinks##1491 |goto The Barrens 62.37,37.62
|only if completedq(1491)
step
talk Crane Operator Bigglefuzz##3665
turnin Trouble at the Docks##959 |goto The Barrens 63.09,37.61
|only if guideflag("WCflag")
step
talk Sputtervalve##3442
Select _"Tell me about the Glowing Shard."_
Speak with Someone in Ratchet About the Glowing Shard |q 6981/1 |goto The Barrens 62.98,37.22 |only if haveq(6981) or completedq(6981)
Speak with Someone in Ratchet About the Glowing Shard |q 3366/1 |goto The Barrens 62.98,37.22 |only if haveq(3366) or completedq(3366)
|only if guideflag("WCflag")
step
Follow the path up |goto The Barrens 50.32,35.44 < 10 |only if walking
Continue up the path |goto The Barrens 49.17,34.09 < 10 |only if walking
talk Falla Sagewind##8418
|tip Inside the building.
turnin The Glowing Shard##6981 |goto The Barrens 48.18,32.78 |only if haveq(6981) or completedq(6981)
turnin The Glowing Shard##3366 |goto The Barrens 48.18,32.78 |only if haveq(3366) or completedq(3366)
accept In Nightmares##3369 |goto The Barrens 48.18,32.78
|only if guideflag("WCflag")
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Leaders of the Fang##914 |goto Thunder Bluff 75.65,31.60
|only if guideflag("WCflag")
step
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin In Nightmares##3369 |goto Thunder Bluff 78.59,28.56
|only if guideflag("WCflag")
step
Enter the cave |goto Thunder Bluff 29.89,29.80 < 5 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
|tip If you did not finish this quest we will not run Wailing Caverns again in our guide. |only if not completedq(962)
|tip You should abandon the quest unless you plan to do Wailing Caverns more for your own enjoyment. |only if not completedq(962)
turnin Serpentbloom##962 |goto Thunder Bluff 22.82,20.90
|only if guideflag("WCflag")
step
Enter the building |goto Stonetalon Mountains 59.04,62.24 < 10 |walk
talk Ziz Fizziks##4201
|tip Inside the building.
turnin Further Instructions##1095 |goto Stonetalon Mountains 58.99,62.60
step
map Stonetalon Mountains
path follow strict; loop on; ants curved; dist 30
path	70.92,55.19	70.58,56.13	69.98,56.69	69.20,56.59	68.51,56.08
path	67.85,55.98	67.07,56.26	66.45,56.30	65.78,57.19	65.12,56.96
path	64.45,56.38	63.71,56.82	63.06,56.27	62.34,56.15	61.62,55.15
path	61.13,54.68	61.02,54.09	60.22,53.98	59.92,53.63	59.66,53.07
path	59.67,52.14	60.34,51.69	61.02,52.34
path	60.34,51.69	59.67,52.14	59.66,53.07	59.92,53.63	60.22,53.98
path	61.02,54.09	61.13,54.68	61.62,55.15	62.34,56.15	63.06,56.27
path	63.71,56.82	64.45,56.38	65.12,56.96	65.78,57.19	66.45,56.30
path	67.07,56.26	67.85,55.98	68.51,56.08	69.20,56.59	69.98,56.69
path	70.58,56.13
kill XT:9##4074 |q 1068/2
|tip It looks like a grey metal goblin machine in a path around this area.
|tip It's level 23, but you should be able to kill it at this level, especially if you already hit level 21.
|tip It may be easier to follow this  path visually on your map, rather than follow the arrow.
step
map Stonetalon Mountains/0
path follow strict; loop on; ants curved; dist 30
path	67.36,46.37	66.85,46.89	66.24,46.52	65.79,45.15	65.08,44.78
path	63.70,45.03	63.73,45.94	63.37,46.11	63.43,46.59	63.87,46.53
path	64.42,46.18	64.70,46.55	64.81,47.63	65.13,48.22	65.92,48.63
path	66.25,49.63	66.61,49.62	66.84,48.93	67.15,49.23	68.40,49.61
path	68.88,48.61	69.04,47.60	69.44,46.57	69.88,47.14	70.08,47.70
path	70.24,48.61	70.80,48.59	71.22,48.24	71.25,47.13	71.37,46.31
path	71.42,45.54	71.25,44.47	71.24,43.42
path	71.25,44.47	71.42,45.54	71.37,46.31	71.25,47.13	71.22,48.24
path	70.80,48.59	70.24,48.61	70.08,47.70	69.88,47.14	69.44,46.57
path	69.04,47.60	68.88,48.61	68.40,49.61	67.15,49.23	66.84,48.93
path	66.61,49.62	66.25,49.63	65.92,48.63	65.13,48.22	64.81,47.63
path	64.70,46.55	64.42,46.18	63.87,46.53	63.43,46.59	63.37,46.11
path	63.73,45.94	63.70,45.03	65.08,44.78	65.79,45.15	66.24,46.52
path	66.85,46.89
kill XT:4##4073 |q 1068/1
|tip It looks like a grey metal goblin machine in a path around this area.
|tip It's level 23, but you should be able to kill it at this level, especially if you already hit level 21.
|tip It may be easier to follow this  path visually on your map, rather than follow the arrow.
step
Kill enemies around this area
|tip We want to be atleast level 21 for the next segment.
ding 21 |goto Stonetalon Mountains/0 75.19,45.76
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Ashenvale (21-22)',
  {
    image = ZGV.IMAGESDIR .. 'Ashenvale',
    condition_suggested = function()
      return level >= 21 and level <= 22 and not completedq(6383)
    end,
    next = 'Leveling Guides\\Hillsbrad Foothills (22-24)',
    hardcore = true,
  },
  [[
step
Enter the tunnel and follow the path of lanterns to Ashenvale |goto Stonetalon Mountains 78.28,42.51 < 15 |only if walking
Leave the tunnel and enter Ashenvale |goto Stonetalon Mountains 81.54,30.03 < 15 |only if walking
Be careful to avoid Astranaar and follow the road |goto Ashenvale 29.05,48.24 < 40 |only if walking
Follow the road to this path |goto Ashenvale 25.45,39.69 < 40 |only if walking
Run around the mountains |goto Ashenvale 16.93,29.97 < 40 |only if walking
talk Andruk##11901
fpath Zoram'gar Outpost |goto Ashenvale 12.23,33.80
step
talk Je'neu Sancrea##12736
|tip Inside the building.
turnin Trouble in the Deeps##6562 |goto Ashenvale 11.57,34.29
step
talk Karang Amakkar##12757
accept Between a Rock and a Thistlefur##216 |goto Ashenvale 11.90,34.53
step
talk Marukai##12719
|tip Inside the building.
accept Naga at the Zoram Strand##6442 |goto Ashenvale 11.69,34.90
step
talk Mitsuwa##12721
|tip Inside the building.
accept Troll Charm##6462 |goto Ashenvale 11.65,34.85
step
Kill Wrathtail enemies around this area
collect 20 Wrathtail Head##5490 |q 6442/1 |goto Ashenvale 12.68,29.52
You can find more around [14.62,19.38]
step
Kill enemies around this area
|tip Getting this far into level 21 will allow you to hit level 22 when we turn in quests soon in Thunder Bluff.
|tip As a Druid, it will be a good time train your level 22 abilities, so you don't have to fly back all the way from Moonglade.						|only if Druid
|tip Also, you will be doing a fairly difficult escort quest soon, and it will help to be a level higher.
ding 21,22400 |goto Ashenvale 12.68,29.52
You can find more around [14.62,19.38]
step
talk Marukai##12719
|tip Inside the building.
turnin Naga at the Zoram Strand##6442 |goto Ashenvale 11.69,34.90
step
Enter the building |goto Thunder Bluff 53.89,55.49 < 10 |walk
talk Kard Ragetotem##3021
|tip Inside the building.
buy Longsword##923 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kard Ragetotem##3021 |goto Thunder Bluff 52.98,56.63 |q 1063
|only if Rogue and itemcount(923) ==0
step
talk Magatha Grimtotem##4046
|tip Inside the building.
turnin The Elder Crone##1063 |goto Thunder Bluff 69.85,30.91
step
Watch the dialogue
talk Magatha Grimtotem##4046
|tip Inside the building.
accept Forsaken Aid##1064 |goto Thunder Bluff 69.85,30.91
|tip This requires a questchain that starts in the "Stonetalon Mountains (18-19)" guide.
|tip This questline also continues in "The Barrens (19-20)".
step
Enter the building |goto Thunder Bluff 74.12,29.89 < 10 |walk
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin Hamuul Runetotem##1489 |goto Thunder Bluff 78.62,28.56
accept Nara Wildmane##1490 |goto Thunder Bluff 78.62,28.56
step
talk Nara Wildmane##5770
|tip Inside the building.
turnin Nara Wildmane##1490 |goto Thunder Bluff 75.65,31.61
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
turnin Forsaken Aid##1064 |goto Thunder Bluff 22.81,20.90
accept Journey to Tarren Mill##1065 |goto Thunder Bluff 22.81,20.90
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if subzone("The Pools of Vision")
Enter the building |goto Thunder Bluff 45.80,58.83 < 10 |walk
talk Chesmu##8356
|tip Inside the building.
|tip Deposit these items into the bank.
bank Zamah's Note##5628 |goto Thunder Bluff 47.13,57.89 |q 1065 |future
bank Sample Snapjaw Shell##10414 |goto Thunder Bluff 47.13,57.89 |q 3301 |future
step
talk Grunt Logmar##5911
turnin Ken'zigla's Draught##1511 |goto The Barrens 44.62,59.27
accept Dogran's Captivity##1515 |goto The Barrens 44.62,59.27
|only if Warlock
step
talk Grunt Dogran##5908
|tip Inside the hut.
turnin Dogran's Captivity##1515 |goto The Barrens 43.31,47.89
accept Love's Gift##1512 |goto The Barrens 43.31,47.89
|only if Warlock
step
talk Darsok Swiftdagger##3449
|tip At the top of the tower.
turnin Serena Bloodfeather##876 |goto The Barrens 51.62,30.90
accept Letter to Jin'Zil##1060 |goto The Barrens 51.62,30.90
step
talk Korran##3428
accept Egg Hunt##868 |goto The Barrens 51.07,29.63
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
accept The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
Watch the dialogue
|tip Inside the tent, inside the Cleft of Shadow.
|tip Wait for Shenthul to salute you (you will see him perform a hand movement).
Perform the Shattered Salute |q 2460/1 |goto Orgrimmar 43.05,53.74
|tip Target Shenthul and type "/salute" into your chat to perform the Salute emote.
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
accept Deep Cover##2458 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
use the Flare Gun##8051
|tip Use it while targeting Taskmaster Fizzule nearby to the north.
|tip You must use it TWICE in a row.
|tip After shooting 2 flares, perform the "/salute" emote while still targeting Taskmaster Fizzule.
Signal Taskmaster Fizzule |q 2458/1 |goto The Barrens 55.47,6.08
|only if Rogue
step
talk Taskmaster Fizzule##7233
turnin Deep Cover##2458 |goto The Barrens 55.44,5.56
accept Mission: Possible But Not Probable##2478 |goto The Barrens 55.44,5.56
|only if Rogue
step
collect Silixiz's Tower Key##8072 |q 2478/5 |goto The Barrens 54.80,5.97
|tip Use your "Pickpocket" ability on Foreman Silixiz.
|only if Rogue
step
Enter the building |goto The Barrens 54.87,5.86 < 10 |walk
kill 2 Mutated Venture Co. Drone##7310 |q 2478/1 |goto The Barrens 54.71,5.73
|tip Inside the building, on the bottom floor.
|only if Rogue
step
kill 2 Venture Co. Patroller##7308 |q 2478/3 |goto The Barrens 54.81,5.59
|tip Upstairs inside the building, on the lower middle floor.
|only if Rogue
step
kill 2 Venture Co. Lookout##7307 |q 2478/2 |goto The Barrens 54.63,5.64
|tip Upstairs on the balcony of the building, on the upper middle floor.
|only if Rogue
step
kill Grand Foreman Puzik Gallywix##7288
|tip Upstairs inside the building, on the top floor.
|tip He is level 23 elite, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you.
|tip It's important to get this done, so you can learn Poisons, so you can level faster.
collect Cache of Zanzil's Altered Mixture##8073 |q 2478/6 |goto The Barrens 54.75,5.59
collect Gallywix's Head##8074 |q 2478/4 |goto The Barrens 54.75,5.59
|only if Rogue
step
click Gallywix's Lockbox##129127
|tip Upstairs inside the building, on the top floor.
|tip You will get a debuff after opening it, but don't worry about it.
Receive the Touch of Zanzil |havebuff Touch of Zanzil##9991 |goto The Barrens 54.75,5.55 |q 2478
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin Mission: Possible But Not Probable##2478 |goto Orgrimmar 43.05,53.74
accept Hinott's Assistance##2479 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on Dust of Decay and Empty Vials, at least 20 of each.
|tip You will use these to create poisons soon to use on your weapon to help you deal more damage.
|tip The poisons only last for 30 minutes, so you want to have enough to be able to always poison your weapon.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.09,49.48 |q 2479
|only if Rogue
step
Enter the building |goto Orgrimmar 40.21,36.95 < 15 |walk
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Water##1528 |goto Orgrimmar 37.96,37.74
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##1528 |goto The Barrens 65.83,43.78
accept Call of Water##1530 |goto The Barrens 65.83,43.78
|only if Shaman
step
talk Brine##5899
|tip On top of the hill.
turnin Call of Water##1530 |goto The Barrens 43.42,77.41
accept Call of Water##1535 |goto The Barrens 43.42,77.41
|only if Shaman
step
use the Empty Brown Waterskin##7766
collect Filled Brown Waterskin##7769 |q 1535/1 |goto The Barrens/0 44.19,76.90
|only if Shaman
step
talk Brine##5899
|tip On top of the hill.
turnin Call of Water##1535 |goto The Barrens/0 43.42,77.41
accept Call of Water##1536 |goto The Barrens/0 43.42,77.41
|only if Shaman
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent, inside the Cleft of Shadow.
turnin Love's Gift##1512 |goto Orgrimmar 48.25,45.29
accept The Binding##1513 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
use Dogran's Pendant##6626
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent, inside the Cleft of Shadow.
kill Summoned Succubus##5677 |q 1513/1 |goto Orgrimmar 49.45,50.03
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent, inside the Cleft of Shadow.
turnin The Binding##1513 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 3301
|only if Warlock
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Dusk Wand##5211 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 3301
|only if Warlock and itemcount(5211) == 0
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Dusk Wand##5211 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 3301
|only if Mage and itemcount(5211) == 0
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Hillsbrad Foothills (22-24)',
  {
    image = ZGV.IMAGESDIR .. 'Hillsbrad Foothills',
    condition_suggested = function()
      return level >= 22 and level <= 24 and not completedq(546)
    end,
    next = 'Leveling Guides\\The Barrens (24-26)',
    hardcore = true,
  },
  [[
step
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
step
talk Ezekiel Graves##4585
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Ezekiel Graves##4585 |goto Undercity 75.60,51.60 |q 3301
|only if Rogue
step
talk Kaelystia Hatebringer##4566 |only if Mage
talk Kaal Soulreaper##4563 |only if Warlock
talk Aelthalyste##4606 |only if Priest
talk Baltus Fowler##4595 |only if Warrior
talk Carolyn Ward##4582 |only if Rogue
Train your spells. |trainer Kaelystia Hatebringer##4566 |goto Undercity/0 85.04,14.03 |only if Mage |q 3301
Train your spells. |trainer Kaal Soulreaper##4563 |goto Undercity/0 86.07,15.78 |only if Warlock |q 3301
Train your spells. |trainer Aelthalyste##4606 |goto Undercity/0 49.11,18.40 |only if Priest |q 3301
Train your spells. |trainer Baltus Fowler##4595 |goto Undercity/0 47.30,17.22 |only if Warrior |q 3301
Train your spells. |trainer Carolyn Ward##4582 |goto Undercity/0 83.88,72.09 |only if Rogue |q 3301
|tip Inside the building |only if Warrior or Mage or Warlock
step
talk Lexington Mortaim##2492
learnspell Teleport: Undercity##3563 |goto Undercity 84.19,15.58
|only if Mage
step
talk Hannah Akeley##4575
|tip If you can afford it.
|tip Stock up on a couple of Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Hannah Akeley##4575 |goto Undercity 82.78,15.83 |q 3301
|only if Mage
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Blood Shard##5075 |goto Undercity 65.97,44.75 |q 868 |future |only if itemcount(5075) > 0
bank Digging Claw##5059 |goto Undercity 65.97,44.75 |q 868 |future
bank Letter to Jin'Zil##5594 |goto Undercity 65.97,44.75 |q 1060 |future
|tip Collect these items from the bank.
collect Zamah's Note##5628 |goto Undercity 65.97,44.75 |q 1065
collect Sample Snapjaw Shell##10414 |goto Undercity 65.97,44.75 |q 3301
step
talk Raleigh Andrean##2050
accept A Husband's Revenge##530 |goto Undercity 61.99,42.72
|only if completedq(441)
step
Leave Undercity through the sewer |goto Undercity/0 46.73,43.95 < 20 |walk |only if zone("Undercity")
Leave Undercity through the sewer |goto Undercity 14.81,35.28 < 20 |walk |only if zone("Undercity") |notravel
click Strong Lockbox##177844
|tip Underwater.
collect Half Pendant of Aquatic Endurance##15882 |goto Silverpine Forest 29.54,29.50 |q 30
|only if Druid
step
Run around the mountains and follow the road into the Sepulcher |goto Silverpine Forest 48.24,38.96 < 70 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.60
|only if Druid
step
Leave Undercity through the sewer |goto Undercity/0 46.73,43.95 < 20 |walk |only if zone("Undercity")
Leave Undercity through the sewer |goto Undercity 14.81,35.28 < 20 |walk |only if zone("Undercity") |notravel
Follow the road into the Sepulcher |goto Silverpine Forest 48.24,38.96 < 70 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.60
|only if not Druid
step
Optional Route Change
|tip You can opt to do Shadowfang Keep at the end of the Hillsbrad guide instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Shadowfang Keep, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
|tip As a hardcore player we want to warn you SFK can be dangerous at level 24, bring higher level party members if you choose to do this. |only if hardcore
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Shadowfang Keep later |confirm SFKflag
Click Here if you'd prefer to grind |confirm
step
talk Shadow Priest Allister##2121
accept Beren's Peril##516 |goto Silverpine Forest 43.98,40.93
step
talk Mura Runetotem##8385
turnin Mura Runetotem##3301 |goto Silverpine Forest 42.91,41.99
step
click Yuriv's Tombstone
turnin Until Death Do Us Part##264 |goto Silverpine Forest 44.20,42.69
step
talk Apothecary Renferrel##1937
accept Journey to Hillsbrad Foothills##493 |goto Silverpine Forest 42.80,40.87
step
kill Valdred Moray##2332
|tip He walks around this area.
collect Valdred's Hands##3613 |q 530/1 |goto Silverpine Forest 45.88,84.92
|only if haveq(530)
stickystart "Kill_Ravenclaw_Guardians"
step
Follow the road |goto Silverpine Forest 46.46,41.31 < 20 |only if walking and not haveq(530)
Continue following the road |goto Silverpine Forest 52.93,42.41 < 30 |only if walking and not haveq(530)
Continue following the road |goto Silverpine Forest 54.93,75.62 < 30 |only if walking and not haveq(530)
Follow the path up |goto Silverpine Forest 60.35,74.70 < 10 |only if walking
Enter the cave |goto Silverpine Forest 60.44,72.37 < 10 |walk
kill 6 Ravenclaw Drudger##1974 |q 516/1 |goto Silverpine Forest 59.48,70.59
|tip Inside and outside the cave.
step
label "Kill_Ravenclaw_Guardians"
kill 6 Ravenclaw Guardian##1973 |q 516/2 |goto Silverpine Forest 59.48,70.59
|tip Inside the cave.
step
talk Deathstalker Lesh##2214
accept Time To Strike##494 |goto Hillsbrad Foothills 20.78,47.40
step
talk Zarise##2389
fpath Tarren Mill |goto Hillsbrad Foothills 60.14,18.62
step
Enter the building |goto Hillsbrad Foothills 61.49,19.43 < 7 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Journey to Tarren Mill##1065 |goto Hillsbrad Foothills 61.44,19.06
accept Blood of Innocents##1066 |goto Hillsbrad Foothills 61.44,19.06
turnin Journey to Hillsbrad Foothills##493 |goto Hillsbrad Foothills 61.44,19.06
accept Elixir of Suffering##496 |goto Hillsbrad Foothills 61.44,19.06
accept Elixir of Pain##501 |goto Hillsbrad Foothills 61.44,19.06
step
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2479 |goto Hillsbrad Foothills 61.63,19.19
accept Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.63,19.19
|only if Rogue
step
Watch the dialogue
|tip Inside the building.
Complete the Cure |q 2480/1 |goto Hillsbrad Foothills 61.58,18.97
|only if Rogue
step
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.58,18.97
|only if Rogue
step
use Hinott's Oil##8095
|tip This will remove the debuff you received from the earlier Rogue quest.
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|only if Rogue
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin Time To Strike##494 |goto Hillsbrad Foothills 62.33,20.46
accept Battle of Hillsbrad##527 |goto Hillsbrad Foothills 62.33,20.46
step
click Dangerous!##2008
|tip It looks like a wanted poster on the doorway of the building.
accept Dangerous!##567 |goto Hillsbrad Foothills 62.55,19.69
step
click WANTED##1763
accept WANTED: Syndicate Personnel##549 |goto Hillsbrad Foothills 62.62,20.74
step
Enter the building |goto Hillsbrad Foothills 62.91,20.56 < 7 |walk
talk Krusk##2229
|tip Inside the building.
accept The Rescue##498 |goto Hillsbrad Foothills 63.23,20.66
step
talk Theodore Mont Claire##10057
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Claw 3".
Click Here to Continue |confirm |goto Hillsbrad Foothills 62.31,19.70 |q 529
|only if Hunter
step
_NOTE:_
Tame a Gray Bear
|tip Use your "Tame Beast" ability on a Gray Bear.
Learn the "Claw 3" Pet Ability
|tip Kill enemies around this area until you see a message in your chat saying you learned "Claw 3".
|tip You will teach "Claw 3" to your permanent pet soon.
Click Here to Continue |confirm |goto Hillsbrad Foothills/0 65.75,22.90 |q 529
|only if Hunter
step
talk Theodore Mont Claire##10057
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Claw 3" to your permanent pet.
Click Here to Continue |confirm |goto Hillsbrad Foothills 62.31,19.70 |q 529
|only if Hunter
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You will use it when you reach level 26.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Warrior and itemcount(12249) == 0
step
talk Ott##3539
buy Broad Bladed Knife##12247 |n
|tip If you can afford it.
|tip You will use it when you reach level 27.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Rogue and itemcount(12247) == 0
step
use the Empty Red Waterskin##7768
collect Filled Red Waterskin##7771 |q 1536/1 |goto Hillsbrad Foothills 62.15,20.75
|only if Shaman
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Shaman and itemcount(12249) == 0
stickystart "Collect_Creeper_Ichor"
stickystart "Collect_Gray_Bear_Tongues"
stickystart "Collect_Vials_of_Innocent_Blood"
stickystart "Kill_Syndicate_Rogues"
stickystart "Kill_Syndicate_Watchmen"
step
Enter Durnholde Keep |goto Hillsbrad Foothills 76.57,46.48 < 20 |only if walking
Cross the bridge and follow the path up |goto Hillsbrad Foothills 78.37,43.29 < 20 |only if walking
kill Jailor Marlgen##2428
|tip He walks around multiple locations around this area.
collect Burnished Gold Key##3499 |goto Hillsbrad Foothills 79.60,40.05 |q 498
Also check for him walking along the path around [Hillsbrad Foothills 77.77,39.84]
stickystop "Collect_Creeper_Ichor"
stickystop "Collect_Gray_Bear_Tongues"
step
click Locked ball and chain##1721
|tip Tied to Tog'thar's leg.
Rescue Tog'thar |q 498/2 |goto Hillsbrad Foothills 79.79,39.66
step
kill Jailor Eston##2427
|tip He walks around multiple locations around this area.
collect Dull Iron Key##3467 |goto Hillsbrad Foothills 79.60,41.83 |q 498
Also check in the building around [75.61,42.44]
step
click Locked ball and chain##1721
|tip Inside the building.
|tip Tied to Drull's leg.
Rescue Drull |q 498/1 |goto Hillsbrad Foothills 75.33,41.50
step
label "Collect_Vials_of_Innocent_Blood"
kill Syndicate Shadow Mage##2244+
|tip All around inside Durnholde Keep. They share spawns with other enemies here. |notinsticky
collect 5 Vial of Innocent Blood##5620 |q 1066/1 |goto Hillsbrad Foothills 77.69,44.10
step
label "Kill_Syndicate_Rogues"
kill 10 Syndicate Rogue##2260 |q 549/1 |goto Hillsbrad Foothills 77.69,44.10
|tip All around inside Durnholde Keep. They share spawns with other enemies here. |notinsticky
step
label "Kill_Syndicate_Watchmen"
kill 10 Syndicate Watchman##2261 |q 549/2 |goto Hillsbrad Foothills 77.69,44.10
|tip All around inside Durnholde Keep. They share spawns with other enemies here. |notinsticky
step
Cross the bridge and leave Durnholde Keep |goto Hillsbrad Foothills 76.57,46.48 < 20 |c |q 498
|only if walking and subzone("Durnholde Keep")
stickystart "Collect_Gray_Bear_Tongues"
step
label "Collect_Creeper_Ichor"
kill Forest Moss Creeper##2350+
|tip They look like green spiders.
collect Creeper Ichor##3477 |q 496/2 |goto Hillsbrad Foothills 64.87,34.43
You can find more around: |notinsticky
[59.39,35.13]
[58.06,25.95]
|stickyif not subzone("Durnholde Keep")
step
label "Collect_Gray_Bear_Tongues"
kill Gray Bear##2351+
|tip you may also kill other Gray Bears in the area (Vicious or Elder) if you run out of standard the Gray Bears. They are tougher, yet also drop tongues.
collect 10 Gray Bear Tongue##3476 |q 496/1 |goto Hillsbrad Foothills 64.87,34.43
You can find more around: |notinsticky
[59.39,35.13]
[58.06,25.95]
|stickyif not subzone("Durnholde Keep")
step
Kill enemies around this area
|tip We want to be level 23 for upcoming quests with higher level enemies.
ding 23 |goto Hillsbrad Foothills 64.87,34.43
You can find more around: |notinsticky
[59.39,35.13]
[58.06,25.95]
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You will use it when you reach level 26.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Warrior and itemcount(12249) == 0
step
talk Ott##3539
buy Broad Bladed Knife##12247 |n
|tip If you can afford it.
|tip You will use it when you reach level 27.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Rogue and itemcount(12247) == 0
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if Shaman and itemcount(12249) == 0
step
talk Ott##3539
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 498
|only if not Warrior or Shaman or Rogue
step
Enter the building |goto Hillsbrad Foothills 61.49,19.43 < 7 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Blood of Innocents##1066 |goto Hillsbrad Foothills 61.44,19.06
turnin Elixir of Suffering##496 |goto Hillsbrad Foothills 61.44,19.06
accept Elixir of Suffering##499 |goto Hillsbrad Foothills 61.44,19.06
accept Return to Thunder Bluff##1067 |goto Hillsbrad Foothills 61.44,19.06
step
talk Umpi##2230
|tip Inside the building.
turnin Elixir of Suffering##499 |goto Hillsbrad Foothills 61.52,19.20
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin WANTED: Syndicate Personnel##549 |goto Hillsbrad Foothills 62.33,20.46
step
Enter the building |goto Hillsbrad Foothills 62.91,20.56 < 7 |walk
talk Krusk##2229
|tip Inside the building.
turnin The Rescue##498 |goto Hillsbrad Foothills 63.23,20.66
stickystart "Collect_Mountain_Lion_Blood"
stickystart "Kill_Hillsbrad_Farmers"
stickystart "Kill_Hillsbrad_Farmhands"
step
Avoid the higher level yeti cave nearby |goto Hillsbrad Foothills 45.59,38.17 < 50 |only if walking and level < 29
kill Farmer Getz##2403 |q 527/4 |goto Hillsbrad Foothills 36.74,39.44
|tip Inside the building.
He can also be: |notinsticky
Inside the barn at [35.13,37.54]
In the field around [35.35,40.80]
step
kill Farmer Ray##232 |q 527/3 |goto Hillsbrad Foothills 33.68,35.42
|tip Enemies tend to bunch together around this area.	|only if hardcore
|tip They may also run away in fear when at low health.	|only if hardcore
|tip Watch for patrols and respawns around here.	|only if hardcore
He can also be inside the building, upstairs or downstairs, around [33.22,34.76]
step
label "Kill_Hillsbrad_Farmers"
Leave the building |goto Hillsbrad Foothills 32.92,35.24 < 7 |walk
kill 6 Hillsbrad Farmer##2266 |q 527/1 |goto Hillsbrad Foothills 31.24,37.49
|tip Enemies tend to bunch together around this area.	|only if hardcore |notinsticky
|tip They may also run away in fear when at low health.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns around here.	|only if hardcore |notinsticky
You can find more around [34.79,40.52]
step
label "Kill_Hillsbrad_Farmhands"
kill 6 Hillsbrad Farmhand##2360 |q 527/2 |goto Hillsbrad Foothills 31.24,37.49
|tip Enemies tend to bunch together around this area.	|only if hardcore |notinsticky
|tip They may also run away in fear when at low health.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns around here.	|only if hardcore |notinsticky
You can find more around [34.79,40.52]
step
label "Collect_Mountain_Lion_Blood"
kill Starving Mountain Lion##2384+
collect 10 Mountain Lion Blood##3496 |q 501/1 |goto Hillsbrad Foothills 40.82,37.37
You can find more around [51.26,33.54]
|stickyif not subzone("Hillsbrad Fields")
step
Enter the building |goto Hillsbrad Foothills 61.49,19.43 < 7 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Elixir of Pain##501 |goto Hillsbrad Foothills 61.44,19.06
accept Elixir of Pain##502 |goto Hillsbrad Foothills 61.44,19.06
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin Battle of Hillsbrad##527 |goto Hillsbrad Foothills 62.33,20.45
accept Battle of Hillsbrad##528 |goto Hillsbrad Foothills 62.33,20.45
step
talk Deathguard Samsa##2418
accept Souvenirs of Death##546 |goto Hillsbrad Foothills 62.13,19.68
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You will use it when you reach level 26.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 502
|only if Warrior and itemcount(12249) == 0
step
talk Ott##3539
buy Broad Bladed Knife##12247 |n
|tip If you can afford it.
|tip You will use it when you reach level 27.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 502
|only if Rogue and itemcount(12247) == 0
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 502
|only if Shaman and itemcount(12249) == 0
step
talk Ott##3539
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 502
|only if not Warrior or Shaman or Rogue
step
Prepare for Shadowfang Keep
|tip It will be a good time to start Shadowfang Keep.
|tip You should run it after this next questing segment, roughly 30 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("SFKflag")
stickystart "Kill_Citizen_Wilkes"
stickystart "Kill_Hillsbrad_Peasants"
stickystart "Collect_Hillsbrad_Human_Skulls"
step
Avoid the higher level yeti cave nearby |goto Hillsbrad Foothills 45.59,38.17 < 70 |only if walking and level < 29
talk Stanley##2274
|tip He looks like a small wolf that walks around this area in front of the building.
|tip After you turn in the quest, he will become enraged and attack you.
|tip Kill him after he enrages for another 1000+ bonus experience.
turnin Elixir of Pain##502 |goto Hillsbrad Foothills 32.66,35.32
step
kill Farmer Kalaba##2451 |q 567/4 |goto Hillsbrad Foothills 34.68,46.04
|tip She walks around this area carrying a pitchfork.
step
label "Kill_Citizen_Wilkes"
map Hillsbrad Foothills
path follow strict; loop on; ants curved; dist 20
path	32.97,39.58	34.15,38.65	35.48,38.74	36.50,39.45	35.78,38.83
path	33.97,38.73	32.53,40.00	32.59,38.14	32.67,36.96	32.62,36.03
path	32.92,35.26	32.58,35.83	32.69,36.96	32.56,38.30	32.54,39.49
path	32.63,41.07	32.46,42.55	31.40,42.23	31.06,41.73	30.55,40.61
path	30.83,41.62	31.21,42.19	31.72,42.24	32.43,42.86	32.51,44.69
path	32.30,45.13	32.55,44.19	32.56,42.23	32.61,41.17
kill Citizen Wilkes##2449 |q 567/2
|tip He walks on the path between the buildings around this area.
|tip Be on the look out for Hillsbrad Footmen while in the area.
|tip They tend to be around fences.
step
label "Kill_Hillsbrad_Peasants"
kill 15 Hillsbrad Peasant##2267 |q 528/1 |goto Hillsbrad Foothills 34.91,46.21
step
Kill enemies around this area
|tip You are going to have to kill level 26 enemies for a quest soon, so it will help to be a level higher.
ding 24 |goto Hillsbrad Foothills 34.79,40.54
stickystop "Collect_Hillsbrad_Human_Skulls"
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin Battle of Hillsbrad##528 |goto Hillsbrad Foothills 62.33,20.45
accept Battle of Hillsbrad##529 |goto Hillsbrad Foothills 62.33,20.45
step
talk Theodore Mont Claire##10057
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 4".
Click Here to Continue |confirm |goto Hillsbrad Foothills 62.31,19.70 |q 529
|only if Hunter
step
_NOTE:_
Tame a Giant Moss Creeper
|tip Use your "Tame Beast" ability on a Giant Moss Creeper.
|tip They look like green spiders around this area.
|tip Make sure to tame a level 24 Giant Moss Creeper.
Learn the "Bite 4" Pet Ability
|tip Kill enemies around this area until you see a message in your chat saying you learned "Bite 4".
|tip You will teach "Bite 4" to your permanent pet soon.
Click Here to Continue |confirm |goto Hillsbrad Foothills 71.50,20.91 |q 529
|only if Hunter
step
talk Theodore Mont Claire##10057
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Bite 4" to your permanent pet.
Click Here to Continue |confirm |goto Hillsbrad Foothills 62.31,19.70 |q 529
|only if Hunter
step
talk Raleigh Andrean##2050
turnin A Husband's Revenge##530 |goto Undercity 61.99,42.72
|only if readyq(530) and guideflag("SFKflag")
step
talk Keeper Bel'dugur##2934
accept The Book of Ur##1013 |goto Undercity 53.72,54.45
|only if guideflag("SFKflag")
step
talk Dalar Dawnweaver##1938
accept Arugal Must Die##1014 |goto Silverpine Forest 44.20,39.79
|only if guideflag("SFKflag")
step
Enter the crypt |goto Silverpine Forest 43.09,41.38 < 5 |walk
talk High Executor Hadrec##1952
|tip Inside the crypt.
accept Deathstalkers in Shadowfang##1098 |goto Silverpine Forest 43.42,40.87
|only if guideflag("SFKflag")
step
talk Shadow Priest Allister##2121
turnin Beren's Peril##516 |goto Silverpine Forest 43.98,40.93
step
talk Raleigh Andrean##2050
turnin A Husband's Revenge##530 |goto Undercity 61.99,42.72
|only if readyq(530)
step
Run Shadowfang Keep
|tip You can use our Shadowfang Keep guide if you want assistance.
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Shadowfang Keep quest turnin guide.
|loadguide "Dungeon Guides\\Shadowfang Keep (22-30)"
|confirm
|only if guideflag("SFKflag")
step
talk Dalar Dawnweaver##1938
turnin Arugal Must Die##1014 |goto Silverpine Forest 44.20,39.79
|only if guideflag("SFKflag")
step
talk Keeper Bel'dugur##2934
turnin The Book of Ur##1013 |goto Undercity 53.72,54.45
|only if guideflag("SFKflag")
step
use the Half Pendant of Aquatic Agility##15883
collect Pendant of the Sea Lion##15885 |q 30/1 |goto Moonglade 35.92,41.42
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Trial of the Sea Lion##30 |goto Moonglade 56.21,30.64
accept Aquatic Form##31 |goto Moonglade 56.21,30.64
|only if Druid
step
talk Kuna Thunderhorn##3015
buy Sturdy Recurve##11306 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip It's a level 27 bow, but since it's limited supply, try to get it now and hold onto it, if you can.
|tip You can start using it immediately when you hit level 27 soon.
|tip If you have better, skip this step.
buy Razor Arrow##3030+ |n
|tip Stock up on a lot of these arrows, enough to fill your entire ammo bag.
|tip When you hit level 25, you will replace all of your arrows with these stronger level 25 arrows.
|tip You won't be near a vendor that sells these for a while, so it's better to sacrifice the bag space and get them now, for a big dps jump when you hit level 25.
Visit the Vendor |vendor Kuna Thunderhorn##3015 |goto Thunder Bluff 47.00,45.70 |q 529
|only if Hunter and (itemcount(11306) == 0)
step
Enter the building |goto Thunder Bluff 53.90,55.50 < 10 |walk
talk Delgo Ragetotem##3019
|tip Inside the building.
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You will use it when you reach level 26.
|tip If you have better, skip this step.
Visit the Vendor |vendor Delgo Ragetotem##3019 |goto Thunder Bluff 54.07,57.23 |q 529
|only if Warrior and itemcount(12249) == 0
step
talk Ott##3539
buy Merciless Axe##12249 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ott##3539 |goto Hillsbrad Foothills 60.43,26.18 |q 529
|only if Shaman and itemcount(12249) == 0
step
talk Kym Wildmane##3036
Train your spells. |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |q 31
|only if Druid
step
Enter the building |goto Thunder Bluff 74.10,29.88 < 10 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Aquatic Form##31 |goto Thunder Bluff 76.48,27.22
|only if Druid
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
turnin Return to Thunder Bluff##1067 |goto Thunder Bluff 22.81,20.90
step
Watch the dialogue
talk Apothecary Zamah##3419
|tip Inside the cave.
accept The Flying Machine Airport##1086 |goto Thunder Bluff 22.81,20.89
step
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
Train your spells. |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 868
Train your spells. |trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 868
|tip Inside the cave |only if Priest or Mage
step
Leave the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if subzone("The Pools of Vision")
talk Zangen Stonehoof##4721
accept The Sacred Flame##1195 |goto Thunder Bluff 54.96,51.38
step
Enter the building |goto Thunder Bluff 45.80,58.83 < 10 |walk
talk Chesmu##8356
|tip Inside the building.
|tip Deposit these items into the bank.
bank Hillsbrad Human Skull##3692+ |goto Thunder Bluff 47.13,57.89 |q 546 |future
bank Toxic Fogger##5638 |goto Thunder Bluff 47.13,57.89 |q 1086 |future
bank Shipment of Iron##3564 |goto Thunder Bluff 47.13,57.89 |q 529 |future |only if itemcount(3564) > 0
|tip Collect these items from the bank.
|tip If you have atleast 10 Blood Shards, grab them as well.
collect Digging Claw##5059 |goto Thunder Bluff 47.13,57.89 |q 868
step
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
Train your spells. |trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 868
Train your spells. |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 868
Train your spells. |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 868
|tip Inside the building. |only if Warrior or Hunter
step
label "Collect_Hillsbrad_Human_Skulls"
Kill Hillsbrad enemies around this area
|tip You do not need to finish this step now, we return in the future.
collect 30 Hillsbrad Human Skull##3692 |q 546/1 |goto Thunder Bluff 34.91,46.21
|sticky only
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\The Barrens (24-26)',
  {
    image = ZGV.IMAGESDIR .. 'The Barrens',
    condition_suggested = function()
      return level >= 24 and level <= 26 and not completedq(868)
    end,
    next = 'Leveling Guides\\Stonetalon Mountains (26-27)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.40,30.20 |q 868 |future
|only if Rogue
step
talk Mangletooth##3430
accept Betrayal from Within##879 |goto The Barrens 44.55,59.24
step
_NOTE:_
talk Mangletooth##3430
|tip You can now talk to Mangletooth and give him Blood Shards in exchange for buffs.
|tip Any time you are going to be questing in the Barrens, and you have extra Blood Shards available, try to get some buffs to make questing faster.
|tip Below is the recommended buffs for your class.
|tip Spirit of the Wind is by far the highest priority as travel time is one of the biggest parts of leveling speed.
|tip Razorhide is also highly recommended for this next segment as it will instantly kill the adds that get spawned. |only if not Hunter or Warlock
|tip
|tip SPIRIT OF THE WIND
|tip +30% Movement Speed (5 Minutes) - 10 Blood Shards
|tip Note: This buff does NOT stack with other run speed increase abilities.
|tip |only if not Warlock or Priest or Mage
|tip AGAMAGGAN'S STRENGTH |only if not Warlock or Priest or Mage
|tip +10 Strength (30 Minutes) - 4 Blood Shards |only if not Warlock or Priest or Mage
|tip
|tip AGAMAGGAN'S AGILITY
|tip +10 Agility (30 Minutes) - 4 Blood Shards
|tip |only if not Warrior or Rogue
|tip WISDOM OF AGAMAGGAN |only if not Warrior or Rogue
|tip +10 Intellect (30 Minutes) - 4 Blood Shards |only if not Warrior or Rogue
|tip
|tip RISING SPIRIT
|tip +25 Spirit (30 Minutes) - 4 Blood Shards
|tip
|tip RAZORHIDE |only if not Hunter or Warlock
|tip +Armor and Returns Damage to Enemies (10 Minutes) - 4 Blood Shards |only if not Hunter or Warlock
|tip |only if not Hunter or Warlock
Click Here to Continue |confirm |goto The Barrens 44.55,59.24 |q 849 |future
|only if itemcount(5075) >= 4
step
talk Tatternack Steelforge##3433
accept Weapons of Choice##893 |goto The Barrens 45.10,57.68
step
Enter the building |goto The Barrens 45.35,58.81 < 10 |walk
talk Innkeeper Byula##7714
|tip Inside the building.
home Camp Taurajo |goto The Barrens 45.58,59.04
stickystart "Collect_Kodo_Liver"
step
kill Owatanka##3473
|tip It looks like a blue thunder lizard that walks around this area.
collect Owatanka's Tailspike##5102 |goto The Barrens 44.20,62.31 |q 884 |future
He can also be around: |notinsticky
[45.48,62.53]
[49.80,61.46]
[49.41,58.78]
step
use Owatanka's Tailspike##5102
accept Owatanka##884 |goto The Barrens 47.99,70.25
stickystart "Silthid_Harvester"
step
click Silithid Mound##3685+
|tip They look like larger rocks with green liquid oozing out of their tops on the ground around this area.
|tip You may sometimes be attacked by enemies that appear after you loot them.
collect 12 Silithid Egg##5058 |q 868/1 |goto The Barrens 47.99,70.25
You can find more around: |notinsticky
[44.96,69.37]
[43.02,70.49]
[44.57,72.12]
step
label "Silthid_Harvester"
kill Silithid Harvester##3253
|tip This is a very rare spawn that can appear around the Silithid Mounds. Do not worry if you cannot find him and skip this step.
collect Harvester's Head##5138 |q 868 |goto The Barrens 47.99,70.25
|stickyif subzone("Field of Giants")
step
use Harvester's Head##5138
accept The Harvester##897 |goto The Barrens 46.13,75.54
|only if itemcount(5138) > 0
stickystart "Collect_Thunderhawk_Saliva_Gland"
stickystart "Collect_Lightning_Gland"
step
talk Gann Stonespire##3341
|tip He walks north and south along this road.
accept Gann's Reclamation##843 |goto The Barrens 46.13,75.54
He walks between here and [46.12,81.24]
step
talk Brine##5899
|tip On top of the hill.
turnin Call of Water##1536 |goto The Barrens 43.42,77.41
accept Call of Water##1534 |goto The Barrens 43.42,77.41
|only if Shaman
step
label "Collect_Kodo_Liver"
Kill Kodos around the area
|tip They often roam in packs.
collect Kodo Liver##4896 |q 822/3 |goto The Barrens 46.50,67.00
You can find more around: |notinsticky
[48.62,60.62]
[46.62,52.82]
[49.62,54.81]
[47.62,65.62]
stickystop "Collect_Thunderhawk_Saliva_Gland"
stickystop "Collect_Lightning_Gland"
stickystart "Collect_Washte_Pawnes_Feather"
stickystart "Collect_Razormane_Backstabber"
stickystart "Collect_Razormane_Wand"
stickystart "Collect_Razormane_War_Shield"
step
kill Kuz##3436
|tip He walks around this area.
|tip This enemy can have a long respawn time, grind around the area if you do not see him.
collect Kuz's Skull##5074 |q 879/1 |goto The Barrens 45.44,80.02
He walks between here and around the burned buildings around [44.11,80.70]
step
kill Nak##3434
|tip He walks around this area.
|tip Be careful, some enemies are stealthed around this area.
|tip This enemy can have a long respawn time, grind around the area if you do not see him.
collect Nak's Skull##5073 |q 879/2 |goto The Barrens 43.82,83.10
step
Follow the path up |goto The Barrens 40.97,80.67 < 30 |only if walking
Enter the building |goto The Barrens 40.30,80.72 < 15 |walk
kill Lok Orcbane##3435
|tip Inside the building.
|tip This enemy can have a long respawn time, grind around the area if you do not see him.
collect Lok's Skull##5072 |q 879/3 |goto The Barrens 40.15,80.54
step
label "Collect_Razormane_Backstabber"
Kill Razormane enemies around this area
|tip Only Razormane Pathfinders and Razormane Stalkers will drop the quest item.
|tip Be careful, some enemies are stealthed around this area. |notinsticky
collect Razormane Backstabber##5093 |q 893/1 |goto The Barrens 44.19,80.61
|tip Be careful not to accidentally sell this to a vendor.
You can find more around: |notinsticky
[43.82,83.10]
[42.14,81.41]
[41.65,78.79]
step
label "Collect_Razormane_Wand"
kill Razormane Seer##3458+
|tip Be careful, some enemies are stealthed around this area. |notinsticky
collect Charred Razormane Wand##5092 |q 893/2 |goto The Barrens 42.14,81.41
|tip Be careful not to accidentally sell this to a vendor.
You can find more around [41.65,78.79]
step
label "Collect_Razormane_War_Shield"
kill Razormane Warfrenzy##3459+
|tip Be careful, some enemies are stealthed around this area. |notinsticky
collect Razormane War Shield##5094 |q 893/3 |goto The Barrens 42.14,81.41
|tip Be careful not to accidentally sell this to a vendor.
You can find more around [41.65,78.79]
step
label "Collect_Washte_Pawnes_Feather"
kill Washte Pawne##3472
|tip It looks like a red wind serpent that flies around this area.
|tip If you don't see him after checking every location, grind in the area until he respawns. |notinsticky
collect Washte Pawne's Feather##5103 |goto The Barrens 43.18,80.92 |q 885 |future
Also check around: |notinsticky
[44.76,78.88]
[44.46,74.76]
[46.78,79.18]
[47.63,80.29]
step
use Washte Pawne's Feather##5103
accept Washte Pawne##885 |goto The Barrens 46.34,85.00
|only if itemcount(5103) > 0
stickystart "Kill_Baeldun_Excavators"
stickystart "Kill_Baeldun_Foremen"
step
Follow the path down |goto The Barrens 46.34,85.00 < 40 |only if walking
kill Prospector Khazgorm##3392
|tip He walks around this area.
collect Khazgorm's Journal##5006 |q 843/3 |goto The Barrens 47.55,85.26
He can also be around [48.33,86.22]
step
label "Kill_Baeldun_Excavators"
kill 15 Bael'dun Excavator##3374 |q 843/1 |goto The Barrens 47.41,84.99
step
label "Kill_Baeldun_Foremen"
kill 5 Bael'dun Foreman##3375 |q 843/2 |goto The Barrens 47.41,84.99
stickystart "Collect_Thunderhawk_Saliva_Gland"
stickystart "Collect_Lightning_Gland"
step
Follow the path up |goto The Barrens 46.85,84.89 < 40 |only if walking and subzone("Bael Modan")
talk Gann Stonespire##3341
|tip He walks north and south along this road.
turnin Gann's Reclamation##843 |goto The Barrens 46.12,81.24
accept Revenge of Gann##846 |goto The Barrens 46.12,81.24
He walks between here and [46.13,75.54]
stickystop "Collect_Thunderhawk_Saliva_Gland"
stickystop "Collect_Lightning_Gland"
stickystart "Collect_Wood_Pulp"
stickystart "Collect_Sodium_Nitrate"
step
Follow the path up |goto The Barrens 48.01,83.10 < 30 |only if walking
Kill Bael'dun enemies around this area
|tip Inside and outside the building.
|tip They respawn fairly quickly, so it's safer to stay outside the building if you're solo.
collect 6 Nitroglycerin##5017 |q 846/1 |goto The Barrens 48.75,84.49
step
label "Collect_Wood_Pulp"
Kill Bael'dun enemies around this area |notinsticky
|tip Inside and outside the building. |notinsticky
|tip They respawn fairly quickly, so it's safer to stay outside the building if you're solo. |notinsticky
collect 6 Wood Pulp##5018 |q 846/2 |goto The Barrens 48.75,84.49
step
label "Collect_Sodium_Nitrate"
Kill Bael'dun enemies around this area |notinsticky
|tip Inside and outside the building. |notinsticky
|tip They respawn fairly quickly, so it's safer to stay outside the building if you're solo. |notinsticky
collect 6 Sodium Nitrate##5019 |q 846/3 |goto The Barrens 48.75,84.49
stickystart "Collect_Thunderhawk_Saliva_Gland"
stickystart "Collect_Lightning_Gland"
step
talk Gann Stonespire##3341
|tip He walks north and south along this road.
turnin Revenge of Gann##846 |goto The Barrens 46.12,81.24
accept Revenge of Gann##849 |goto The Barrens 46.12,81.24
He walks between here and [46.13,75.54]
stickystop "Collect_Thunderhawk_Saliva_Gland"
stickystop "Collect_Lightning_Gland"
step
Follow the path down |goto The Barrens 46.30,84.97 < 40 |only if walking
click Bael Modan Flying Machine
|tip At the top of the wooden platform.
|tip You can click it from far away.
Destroy the Bael Modan Flying Machine |q 849/1 |goto The Barrens 47.00,85.60
stickystart "Collect_Thunderhawk_Saliva_Gland"
stickystart "Collect_Lightning_Gland"
step
Follow the path up |goto The Barrens 46.53,85.38 < 40 |only if walking and subzone("Bael Modan")
talk Gann Stonespire##3341
|tip He walks north and south along this road.
turnin Revenge of Gann##849 |goto The Barrens 46.12,81.24
He walks between here and [46.13,75.54]
step
label "Collect_Thunderhawk_Saliva_Gland"
kill Greater Thunderhawk##3249
|tip They look like wind serpents.
collect Thunderhawk Saliva Gland##4897 |q 822/2 |goto The Barrens 46.81,76.62
You can find more around here: |notinsticky
[47.81,80.21]
[44.62,76.62]
step
label "Collect_Lightning_Gland"
kill Stormhide##3238
|tip They look like kodo dinosaurs.
collect 5 Lightning Gland##4898 |q 822/1 |goto The Barrens 46.81,76.62
You can find more around here: |notinsticky
[47.81,80.21]
[44.62,76.62]
step
Kill enemies around this area
|tip You will be near Orgrimmar soon, and you'll want to be level 26 to be able to train your level 26 abilities.
|tip Grinding this far into level 25 will make sure you're level 26 before going to Orgrimmar after turning in quests.
ding 25,20500 |goto The Barrens 42.79,80.27
step
Continue to kill enemies around this area
|tip Grind enemies until your Hearthstone is off cooldown.
|tip This will save on long travel time while getting ahead of a grind later.
|tip This step will complete when your Hearthstone is ready to use.
|tip Any experience you get here is a "bonus" to save on grinding later and is not required if you'd rather skip this step.
Grind XP Until Your Hearth is off CD |complete C_Container.GetItemCooldown(6948) <= 10 |q 874
step
talk Shardi##11899
|tip Be careful as you run here, there are higher level enemies in this zone.
fpath Brackenwall Village |goto Dustwallow Marsh 35.56,31.88
|only if not hardcore
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 874
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
talk Zulrg##4884
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You can't use it until level 32, but it would be good to have now, if it's available, for an instant weapon upgrade later.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zulrg##4884 |goto Dustwallow Marsh 36.17,31.80 |q 874
|only if Warrior and itemcount(12251) == 0 and not hardcore
step
talk Zulrg##4884
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip You can't use it until level 32, but it would be good to have now, if it's available, for an instant weapon upgrade later.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zulrg##4884 |goto Dustwallow Marsh 36.17,31.80 |q 874
|only if Shaman and itemcount(12251) == 0 and not hardcore
step
talk Tatternack Steelforge##3433
turnin Weapons of Choice##893 |goto The Barrens 45.10,57.68
step
talk Jorn Skyseer##3387
turnin Owatanka##884 |goto The Barrens 44.86,59.14
turnin Washte Pawne##885 |goto The Barrens 44.86,59.14
turnin The Harvester##897 |goto The Barrens 44.86,59.14 |only if haveq(897)
accept The Ashenvale Hunt##6382 |goto The Barrens 44.86,59.14
step
talk Mangletooth##3430
turnin Betrayal from Within##879 |goto The Barrens 44.55,59.24
accept Betrayal from Within##906 |goto The Barrens 44.55,59.24
step
talk Thork##3429
turnin Betrayal from Within##906 |goto The Barrens 51.50,30.87
step
talk Korran##3428
turnin Egg Hunt##868 |goto The Barrens 51.07,29.63
step
_Destroy These Item:_
|tip They are no longer needed.
trash Silithid Egg##5058 |goto The Barrens 51.99,29.90
step
Enter the building |goto The Barrens 52.03,30.16 < 10 |walk
talk Innkeeper Boorand Plainswind##3934
|tip Inside the building.
home The Crossroads |goto The Barrens 51.99,29.90
step
talk Fuzruckle##3496
|tip Collect these items from the bank.
collect Toxic Fogger##5638 |goto The Barrens 62.64,37.42 |q 1086
collect Letter to Jin'Zil##5594 |goto The Barrens 62.64,37.42 |q 1060
step
talk Brewmaster Drohn##3292
turnin Chen's Empty Keg##822 |goto The Barrens 62.26,38.39
step
talk Vexspindle##3492
|tip This merchant can sell Wolf Bracers as a limited supply item.
|tip They are very powerful bracers for you, buy them if they're available.
Check for Wolf Bracers |vendor Vexspindle##3492 |goto The Barrens/0 62.16,38.45 |q 874
|only if Rogue or Druid or Shaman or Hunter
step
talk Mahren Skyseer##3388
turnin Mahren Skyseer##874 |goto The Barrens 65.84,43.86
accept Isha Awak##873 |goto The Barrens 65.84,43.86
step
kill Isha Awak##3476
|tip It looks like a loch ness dinosaur creature that swims in the water around this area.
|tip It can spawn in 3 locations off the coast.
collect Heart of Isha Awak##5104 |q 873/1 |goto The Barrens 65.63,47.08
Also check around: |notinsticky
[64.19,50.62]
[63.59,53.52]
step
talk Mahren Skyseer##3388
turnin Isha Awak##873 |goto The Barrens 65.84,43.86
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stonetalon Mountains (26-27)',
  {
    image = ZGV.IMAGESDIR .. 'Stonetalon Mountains',
    condition_suggested = function()
      return level >= 26 and level <= 27 and not completedq(1068)
    end,
    next = 'Leveling Guides\\Ashenvale (27-28)',
    hardcore = true,
  },
  [[
step
Enter the building |goto Orgrimmar/0 48.19,79.68 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 6 extra stacks.
|tip You'll be questing for a while, without easy access to an ammo vendor.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 1087 |future
|only if Hunter
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 1087 |future
|only if Rogue
step
talk Xao'tsu##10088
Train your pet spells. |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 1087 |future
|only if Hunter
step
talk Ormak Grimshot##3352 |only if Hunter
talk Ormok##3328 |only if Rogue
Train your spells. |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.08,18.51 |only if Hunter |q 1087 |future
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 1087 |future
step
talk Braelyn Firehand##4198
accept Cenarius' Legacy##1087 |goto Stonetalon Mountains 45.94,60.42
step
talk Tammra Windfield##11864
accept Cycle of Rebirth##6301 |goto Stonetalon Mountains 47.46,58.38
step
talk Maggran Earthbinder##11860
accept Calling in the Reserves##5881 |goto Stonetalon Mountains 47.20,61.15
accept Harpies Threaten##6282 |goto Stonetalon Mountains 47.20,61.15
step
Follow the road |goto Stonetalon Mountains 53.19,61.77 < 50 |only if walking and subzone("Sun Rock Retreat")
click Wanted Poster: Besseleth
accept Arachnophobia##6284 |goto Stonetalon Mountains 59.07,75.71
step
Follow the path up |goto Stonetalon Mountains 58.08,76.05 < 30 |only if walking and not subzone("Sishir Canyon")
kill Besseleth##11921
|tip She looks like a large orange spider.
|tip She can spawn in multiple locations around this area.
|tip She's a level 21 elite, but you should be able to kill her at this level.
|tip If you have trouble, try to find someone to help you, or skip the quest.
|tip Note that she can do a 10 second root, run away early if the fight is going poorly. |only if hardcore
|tip Make sure to clear an escape route before hand. |only if hardcore
collect Besseleth's Fang##16192 |q 6284/1 |goto Stonetalon Mountains 51.96,73.85
Also check around: |notinsticky
[52.36,71.62]
[54.65,72.10]
step
Follow the path down |goto Stonetalon Mountains 55.53,76.22 < 30 |only if walking and subzone("Sishir Canyon")
Enter the building |goto Stonetalon Mountains 59.04,62.25 < 10 |walk
talk Ziz Fizziks##4201
|tip Inside the building.
accept Gerenzo Wrenchwhistle##1096 |goto Stonetalon Mountains 58.99,62.60
step
use the Toxic Fogger##5638
|tip Stand under the wooden platform.
Place the Toxic Fogger |q 1086/1 |goto Stonetalon Mountains 66.52,45.48
step
Follow the path up |goto Stonetalon Mountains 68.94,39.65 < 30 |only if walking
kill Gerenzo Wrenchwhistle##4202
|tip Up on the wooden platform.
|tip He can spawn in other locations on this platform, so search around if he's not here.
|tip If you have trouble, try to find someone to help you.
|tip You can also try to kite him up and off the wooden platform, so you can fight him alone.
collect Gerenzo's Mechanical Arm##5736 |q 1096/1 |goto Stonetalon Mountains 64.49,40.25
step
talk Nizzik##4085
|tip Up on the wooden platform, at the very end of the wooden path.
|tip He may sell a gear upgrade for your class.
|tip If he has one available, buy it if you can afford it.
|tip Be very careful not to fall down while walking these platforms. |only if hardcore
Visit the Vendor |vendor Nizzik##4085 |goto Stonetalon Mountains 62.70,40.18 |q 1096
step
Enter the building |goto Stonetalon Mountains 59.04,62.24 < 10 |walk
talk Ziz Fizziks##4201
|tip Inside the building.
turnin Gerenzo Wrenchwhistle##1096 |goto Stonetalon Mountains 58.99,62.60
stickystart "Collect_Gaea_Seeds"
stickystart "Collect_Stonetalon_Sap"
step
Leave Windshear Crag and follow the road |goto Stonetalon Mountains 59.34,70.94 < 50 |only if walking and subzone("Windshear Crag")
Kill Courser enemies around this area
|tip They look like deer.
collect 30 Courser Eye##5585 |q 1058/3 |goto Stonetalon Mountains 45.07,24.08
You can find more around [39.86,10.89]
stickystop "Collect_Gaea_Seeds"
stickystart "Collect_Twilight_Whiskers"
step
kill Fey Dragon##4016+
|tip They look like small blue dragons.
|tip They are uncommon and spread out around this area.
collect Fey Dragon Scale##5583 |q 1058/4 |goto Stonetalon Mountains 37.41,21.06
You can find more around: |notinsticky
[39.66,13.58]
[33.14,13.21]
step
label "Collect_Stonetalon_Sap"
kill Sap Beast##4020+
|tip They look like green oozes.
|tip They share spawn points with Corrosive Sap Beasts, so kill those too, if you can't find any.
|tip This item is a very low drop rate and you need to go out of your way to make sure you're killing slimes as they respawn.
|tip When you're out of slimes, go kill Twilight Runners as they similarly have a low droprate and long respawn time.
|tip Corrosive Sap Beasts will not drop the quest item.
collect 5 Stonetalon Sap##5582 |q 1058/1 |goto Stonetalon Mountains 34.16,18.16
You can find more around [38.75,17.26]
You can find Twilight Runners around [31.89,10.01]
stickystart "Kill_Sons_Of_Cenarius"
stickystart "Kill_Daughters_Of_Cenarius"
stickystart "Kill_Cenarion_Botanists"
step
label "Collect_Twilight_Whiskers"
kill Twilight Runner##4067+
|tip They look like blue jaguars with white spots.
collect 5 Twilight Whisker##5584 |q 1058/2 |goto Stonetalon Mountains 31.89,10.01
step
label "Kill_Sons_Of_Cenarius"
kill 4 Son of Cenarius##4057 |q 1087/1 |goto Stonetalon Mountains 36.09,12.57
|tip They have Treant Ally bodyguards that look like walking trees.
|tip Be careful to avoid Sentinel Amarassan, the level 27 elite night elf that walks around this area.
step
label "Kill_Daughters_Of_Cenarius"
kill 4 Daughter of Cenarius##4053 |q 1087/2 |goto Stonetalon Mountains 36.09,12.57
|tip Be careful to avoid Sentinel Amarassan, the level 27 elite night elf that walks around this area. |notinsticky
step
label "Kill_Cenarion_Botanists"
kill 4 Cenarion Botanist##4051 |q 1087/3 |goto Stonetalon Mountains 36.09,12.57
|tip Be careful to avoid Sentinel Amarassan, the level 27 elite night elf that walks around this area. |notinsticky
step
label "Collect_Gaea_Seeds"
Follow the path |goto Stonetalon Mountains 41.62,16.01 < 30 |only if walking and subzone("Stonetalon Peak")
click Gaea Seed##177926+
|tip They look like brown pine cones on the ground near the lake around this area.
|tip Be careful to avoid the elite windstrider that flies around this area. |notinsticky
collect 10 Gaea Seed##16205 |q 6301/1 |goto Stonetalon Mountains 49.33,44.09
You can find more around: |notinsticky
[46.39,38.89]
[50.48,36.81]
|stickyif subzone("Mirkfallon Lake")
stickystart "Kill_Bloodfury_Ambushers"
stickystart "Kill_Bloodfury_Slayers"
stickystart "Kill_Bloodfury_Roguefeathers"
stickystart "Collect_Incendrites"
step
Follow the path |goto Stonetalon Mountains 42.49,42.46 < 30 |only if walking and subzone ("Mirkfallon Lake") |notravel
kill 7 Bloodfury Harpy##4022 |q 6282/1 |goto Stonetalon Mountains 34.51,62.27 |notravel
|tip These share spawns with other harpies in the area. Grind all harpies you see to make the area safer and force respawns.
You can find more around: |notinsticky
[32.26,60.12]
[32.44,65.30]
step
label "Kill_Bloodfury_Ambushers"
kill 7 Bloodfury Ambusher##4025 |q 6282/2 |goto Stonetalon Mountains 30.24,62.84
|tip Warning! These mobs do a high damage lightning shock that may catch you off guard, don't let yourself get too low health. |only if hardcore
|tip These share spawns with other harpies in the area. Grind all harpies you see to make the area safer and force respawns. |notinsticky
You can find more around: |notinsticky
[34.51,62.27]
[32.44,65.30]
step
label "Kill_Bloodfury_Slayers"
kill 7 Bloodfury Slayer##4024 |q 6282/3 |goto Stonetalon Mountains 35.96,68.52
|tip Warning! These mobs know execute and will kill you if you fall below 20% health! |only if hardcore
|tip These share spawns with other harpies in the area. Grind all harpies you see to make the area safer and force respawns. |notinsticky
You can find more around [28.83,69.50]
step
label "Kill_Bloodfury_Roguefeathers"
kill 7 Bloodfury Roguefeather##4023 |q 6282/4 |goto Stonetalon Mountains 35.96,68.52
|tip Warning! These mobs can Thrash which means they may attack you multiple times at once. |only if hardcore
|tip These share spawns with other harpies in the area. Grind all harpies you see to make the area safer and force respawns. |notinsticky
You can find more around [28.83,69.50]
step
Follow the path up |goto Stonetalon Mountains 37.93,67.96 < 20 |only if walking and subzone("The Charred Vale")
Continue up the path |goto Stonetalon Mountains 41.37,70.24 < 20 |only if walking and subzone("The Charred Vale")
talk Braelyn Firehand##4198
turnin Cenarius' Legacy##1087 |goto Stonetalon Mountains 45.94,60.42
stickystop "Collect_Incendrites"
step
talk Maggran Earthbinder##11860
turnin Harpies Threaten##6282 |goto Stonetalon Mountains 47.19,61.14
accept Bloodfury Bloodline##6283 |goto Stonetalon Mountains 47.19,61.14
turnin Arachnophobia##6284 |goto Stonetalon Mountains 47.20,61.16
step
talk Tammra Windfield##11864
turnin Cycle of Rebirth##6301 |goto Stonetalon Mountains 47.46,58.38
accept New Life##6381 |goto Stonetalon Mountains 47.46,58.38
step
talk Kulwia##12043
Vendor your Trash |vendor Kulwia##12043 |goto Stonetalon Mountains/0 45.38,59.34 |q 6283
stickystart "Plant_Gaea_Seeds"
stickystart "Collect_Incendrites"
step
Follow the path up |goto Stonetalon Mountains 44.63,61.81 < 20 |only if walking
Follow the path down |goto Stonetalon Mountains 43.53,65.33 < 20 |only if walking
Continue down the path |goto Stonetalon Mountains 41.16,70.69 < 30 |only if walking
Follow the path |goto Stonetalon Mountains 37.90,67.87 < 30 |only if walking
kill Bloodfury Ripper##12579
|tip She looks like a blue harpy that flies around this area.
|tip She's a level 26 elite, but fairly easy to solo.
|tip Kite her away to fight her alone. You will need to pre-emptively clear an area, making sure to kill all the patrols as well.
|tip If you have trouble, try to find someone to help you, or skip the quest.
collect Bloodfury Ripper's Remains##16190 |q 6283/1 |goto Stonetalon Mountains 30.76,61.92
step
label "Plant_Gaea_Seeds"
click Gaea Dirt Mound##177929+
|tip They look like piles of green and brown dirt on the ground.
|tip You can find them all around the Charred Vale area.
Plant #10# Gaea Seeds |q 6381/1 |goto Stonetalon Mountains 32.25,68.16
|stickyif subzone("The Charred Vale")
step
label "Collect_Incendrites"
Kill enemies around this area
|tip Only enemies that look like fire elementals will drop the quest item.
collect 10 Incendrites##16312 |q 6393/1 |goto Stonetalon Mountains 34.86,64.96
You can find more around: |notinsticky
[29.65,64.44]
[31.27,73.77]
[35.92,72.58]
|stickyif subzone("The Charred Vale")
step
Follow the path up |goto Stonetalon Mountains 37.93,67.96 < 20 |only if walking and subzone("The Charred Vale")
Continue up the path |goto Stonetalon Mountains 41.37,70.24 < 20 |only if walking and subzone("The Charred Vale")
Follow the path up |goto Stonetalon Mountains 44.93,63.37 < 20 |only if walking
talk Tsunaman##11862
|tip It walks around this area.
turnin Elemental War##6393 |goto Stonetalon Mountains 47.19,64.42
step
talk Maggran Earthbinder##11860
turnin Bloodfury Bloodline##6283 |goto Stonetalon Mountains 47.20,61.16
step
talk Tammra Windfield##11864
turnin New Life##6381 |goto Stonetalon Mountains 47.46,58.38
step
Follow the road |goto Stonetalon Mountains 53.14,61.73 < 50 |only if walking and subzone("Sun Rock Retreat")
Follow the path up |goto Stonetalon Mountains 71.91,91.81 < 30 |only if walking and subzone("Webwinder Path")
Enter the cave |goto Stonetalon Mountains 74.23,97.12 < 15 |walk
talk Witch Doctor Jin'Zil##3995
|tip Inside the cave.
turnin Letter to Jin'Zil##1060 |goto Stonetalon Mountains 74.54,97.94
step
talk Witch Doctor Jin'Zil##3995
|tip Inside the cave.
turnin Jin'Zil's Forest Magic##1058 |goto Stonetalon Mountains 74.54,97.94
step
Follow the path up and through the mountains to the Barrens |goto Stonetalon Mountains 72.88,93.76 < 20 |only if walking and subzone("Malaka'jin")
talk Seereth Stonebreak##4049
turnin Shredding Machines##1068 |goto The Barrens 35.26,27.88
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Ashenvale (27-28)',
  {
    image = ZGV.IMAGESDIR .. 'Ashenvale',
    condition_suggested = function()
      return level >= 27 and level <= 28 and not completedq(1131)
    end,
    next = 'Leveling Guides\\Thousand Needles (28-30)',
    hardcore = true,
  },
  [[
step
Enter the building |goto Orgrimmar/0 48.19,79.68 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 6-8 extra stacks.
|tip You'll be questing for a while, without easy access to an ammo vendor.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 6441 |future
|only if Hunter
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48
|only if Rogue
step
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 6441 |future
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 6441 |future
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 6441 |future
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 6441 |future
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 6441 |future
|tip Inside the building. |only if Warrior or Mage or Priest
step
Enter the building |goto Orgrimmar 53.68,64.58 < 10 |walk
talk Auctioneer Thathung##8673
|tip Buy these items from the auction house. They are usually very cheap and this gives a lot of exp.
|tip Try to make sure all of the pages are available before buying any.
|tip If you cannot get every page, skip this step.
collect Shredder Operating Manual - Page 1##16645 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 2##16646 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 3##16647 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 4##16648 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 5##16649 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 6##16650 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 7##16651 |goto Orgrimmar 55.90,62.71|q 6504 |future
collect Shredder Operating Manual - Page 8##16652 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 9##16653 |goto Orgrimmar 55.90,62.71|q 6504 |future
collect Shredder Operating Manual - Page 10##16654 |goto Orgrimmar 55.90,62.71 |q 6504 |future
collect Shredder Operating Manual - Page 11##16655 |goto Orgrimmar 55.90,62.71|q 6504 |future
collect Shredder Operating Manual - Page 12##16656 |goto Orgrimmar 55.90,62.71|q 6504 |future
|only if not selfmade
step
use Shredder Operating Manual - Page 1##16645
|tip This will combine all 4 pages into a chapter.
collect Shredder Operating Manual - Chapter 1##16642 |goto Orgrimmar/0 54.64,67.73 |q 6504 |future
|only if not selfmade and itemcount (16645) > 0
step
use Shredder Operating Manual - Page 5##16649
|tip This will combine all 4 pages into a chapter.
collect Shredder Operating Manual - Chapter 2##16643 |goto Orgrimmar/0 54.64,67.73 |q 6504 |future
|only if not selfmade and itemcount (16649) > 0
step
use Shredder Operating Manual - Page 9##16653
|tip This will combine all 4 pages into the final chapter.
collect Shredder Operating Manual - Chapter 3##16644 |goto Orgrimmar/0 54.64,67.73 |q 6504 |future
|only if not selfmade and itemcount (16653) > 0
step
talk Barkeep Morag##5611
|tip Stock up on a lot of food and water, there is no vendor in Ashenvale.
Buy Food and Water |vendor Barkeep Morag##5611 |goto Orgrimmar/0 54.64,67.73 |q 6441 |future
step
Optional Route Change
|tip You can opt to do Blackfathom Deeps at the end of the Ashenvale guide instead of grinding.
|tip This is very recommended for casters due to the wand quest reward, you will use it until level 50. |only if Mage or Warlock or Priest
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Blackfathom Deep, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Blackfathom Deep later |confirm BFDflag
Click Here if you'd prefer to grind |confirm
step
Leave Orgrimmar |goto Kalimdor/0 56.80,45.50 < 30 |notravel
Run up the coast |goto Ashenvale/0 91.38,65.46 < 50 |c |q 6441 |future
|tip This step is walking you to Splintertree Post in Ashenvale, if you deviated from the guide and have the flight path, fly instead.
|only if walking and not zone("Ashenvale")
step
talk Qeeju##15131
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Claw 4".
Click Here to Continue |confirm |goto Ashenvale/0 73.38,61.03 |q 6441 |future
|only if Hunter
step
_NOTE:_
Tame an Elder Ashenvale Bear
|tip Use your "Tame Beast" ability on a Elder Ashenvale Bear.
|tip They look like large bears around this area.
Learn the "Claw 4" Pet Ability
|tip Kill enemies on the way back to town, until you see a message in your chat saying you learned "Claw 4".
|tip You will teach "Claw 4" to your permanent pet soon.
Click Here to Continue |confirm |goto Ashenvale/0 68.49,61.89 |q 6441 |future
|only if Hunter
step
talk Qeeju##15131
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Claw 4" to your permanent pet.
Click Here to Continue |confirm |goto Ashenvale/0 73.38,61.03 |q 6441 |future
|only if Hunter
step
talk Senani Thunderheart##12696
turnin The Ashenvale Hunt##6382 |goto Ashenvale 73.78,61.46
accept The Ashenvale Hunt##6383 |goto Ashenvale 73.78,61.46 |instant
step
talk Pixel##12724
accept Satyr Horns##6441 |goto Ashenvale 73.06,61.48
step
talk Mastok Wrilehiss##12737
accept Stonetalon Standstill##25 |goto Ashenvale 73.67,60.01
step
talk Vhulgra##12616
fpath Splintertree Post |goto Ashenvale 73.18,61.59
step
talk Kuray'bin##12867
accept Ashenvale Outrunners##6503 |goto Ashenvale 71.10,68.12
step
kill 9 Ashenvale Outrunner##12856 |q 6503/1 |goto Ashenvale 74.63,71.67
|tip They look like stealthed night elves around this area.
|tip They tend be near the trees around this area.
|tip Be careful to avoid Sharptalon.
|tip It looks like a level 31, large blue bird that flies low to the ground around this area.
You can find more around: |notinsticky
[71.07,75.21]
[76.89,71.90]
step
talk Torek##12858
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
|tip Make sure 3 Splintertree Raiders are next to him before talking to him.
|tip They will not help you fight if they are not there.
|tip This quest can be difficult to solo for some classes.
|tip If you are unsure if you can handle killing groups of enemies quickly, try to find someone to help you, or skip the quest.
accept Torek's Assault##6544 |goto Ashenvale 68.34,75.30 |noautoaccept
step
Watch the dialogue
|tip Follow Torek and protect him as he walks. Always let Torek go first and aggro enemies, he won't fight if he doesn't aggro first.
|tip He eventually walks to this location.
|tip A group of 4 enemies will spawn inside the building, so be prepared.
|tip Once you have cleared the building run onto the balcony in the back of the building, and stay there.
|tip Let the group of orcs attack the 4 enemies that enter the building first so they get aggro, then go help.
|tip After you help Torek, kill the other enemies.
|tip Torek must survive.
kill Duriel Moonfire##12860
Take Silverwing Outpost |q 6544/1 |goto Ashenvale 64.66,75.34
|tip If you have trouble, try to find someone to help you, or skip the quest.
step
talk Gurda Ragescar##12718
accept The Lost Pages##6504 |goto Ashenvale/0 70.00,71.15
|only if (itemcount(16645) > 0) and (itemcount(16649) > 0) and (itemcount(16653) > 0)
step
talk Gurda Ragescar##12718
turnin The Lost Pages##6504 |goto Ashenvale/0 70.00,71.15
|only if haveq(6504)
step
Follow the road to this path |goto Ashenvale 71.12,69.19 < 30 |only if walking and not subzone("Splintertree Post")
Follow the path |goto Ashenvale 73.51,63.54 < 15 |only if walking
talk Ertog Ragetusk##12877
turnin Torek's Assault##6544 |goto Ashenvale 73.03,62.47
step
talk Kuray'bin##12867
turnin Ashenvale Outrunners##6503 |goto Ashenvale 71.11,68.12
step
Follow the path along the river and follow this path up |goto Ashenvale 72.33,49.92 < 30 |only if walking
Kill Felmusk enemies around this area
|tip They look like satyrs.
|tip Some of them are stealthed around this area, so be careful.
collect 16 Satyr Horns##5481 |q 6441/1 |goto Ashenvale 68.58,53.57
You can find more around: |notinsticky
[66.77,55.65]
[66.36,52.48]
stickystart "Collect_Shadumbras_Head"
step
Run here and prepare to jump down. You do not want to get stuck behind the trees or you will have to unstuck. |goto Ashenvale 63.92,52.01 < 50 |only if walking and subzone("Night Run")
Jump towards the arrow to avoid the trees. |goto Ashenvale/0 64.91,51.41 < 20 |only if walking and subzone("Night Run")
kill Laughing Sister##4054+
collect Etched Phial##5867 |goto Ashenvale 58.64,55.75 |q 1195
You can find more around [60.63,52.19]
step
label "Collect_Shadumbras_Head"
map Ashenvale/0
path follow strict; loop on; ants curved; dist 30
path	57.81,55.97	57.46,56.05	56.93,56.04	56.39,55.92	56.20,55.46
path	55.70,55.42	54.13,54.92	52.15,54.34	55.61,55.38	56.19,55.44
path	56.37,55.91	57.43,56.06	57.86,55.96	58.07,55.65	58.82,55.24
path	59.10,54.77	59.30,54.18	59.57,53.70	59.86,53.36	60.25,52.67
path	60.52,52.35	60.93,51.69	61.01,51.07	61.02,50.38	61.28,50.07
path	61.83,49.80	62.52,49.81	62.10,49.78	61.35,49.99	61.02,50.36
path	61.03,50.93	60.97,51.46	60.51,52.38	59.83,53.40	59.58,53.68
path	59.32,54.12	59.09,54.78	58.88,55.19
kill Shadumbra##12677
|tip It looks like a black panther that walks in a large pattern around this area.
collect Shadumbra's Head##16304 |q 24 |future
|only if completedq(6383)
step
use Shadumbra's Head##16304
accept Shadumbra's Head##24 |goto Ashenvale/0 44.27,56.27
|only if itemcount(16304) > 0
stickystart "Kill_Thistlefur_Avengers"
stickystart "Kill_Thistlefur_Shamans"
step
Follow the road to this path |goto Ashenvale/0 44.27,56.27 < 80 |only if walking
Enter Thistlefur Village |goto Ashenvale/0 38.43,36.09 < 30 |only if walking
Follow the path up |goto Ashenvale/0 37.48,32.25 < 30 |only if walking
Enter the cave |goto Ashenvale/0 38.41,30.57 < 15 |walk
click Troll Chest##178144+
|tip They look like small brown wooden boxes on the ground all throughout the cave, but mainly on the top floor.
collect 8 Troll Charm##16602 |q 6462/1 |goto Ashenvale/0 39.94,32.08
step
talk Ruul Snowhoof##12818
|tip Inside the cave, on the bottom floor.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait for him to respawn.
|tip This quest can be difficult to solo for some classes.
|tip If you are unsure if you can handle killing groups of enemies quickly, try to find someone to help you, or skip the quest.
accept Freedom to Ruul##6482 |goto Ashenvale/0 41.49,34.50 |noautoaccept
|tip Kill enemies to clear a path almost to the cave exit BEFORE accepting this quest.
|tip You will be attacked by a group of 3 enemies before you leave the cave, so you want the path clear, so you don't aggro extra enemies.
step
Escort Ruul from the Thistlefurs |q 6482/1 |goto Ashenvale/0 38.56,37.47
|tip Follow Ruul Snowhoof and protect him as he walks.
|tip You will be attacked by a group of 3 enemies before leaving the cave, and also near the end of the escort.
|tip He leaves the cave and eventually walks to this location.
|tip If you have trouble, try to find someone to help you, or skip the quest.
step
label "Kill_Thistlefur_Avengers"
kill 12 Thistlefur Avenger##3925 |q 216/1 |goto Ashenvale/0 37.33,35.30
You can find more around [35.87,32.39]
|stickyif subzone("Thistlefur Village")
step
label "Kill_Thistlefur_Shamans"
kill 12 Thistlefur Shaman##3924 |q 216/2 |goto Ashenvale/0 37.33,35.30
You can find more around [35.87,32.39]
|stickyif subzone("Thistlefur Village")
step
Leave Thistlefur Village and follow the path southeast to the road |goto Ashenvale/0 38.46,36.03 < 30 |only if walking and subzone("Thistlefur Village")
Head to the road |goto Ashenvale/0 42.54,57.54 < 50 |only if walking
|only if completedq(6383) and (not haveq(23) or not completedq(23))
step
map Ashenvale/0
path follow strict; loop on; ants curved; dist 30
path	42.69,63.22	43.09,63.07	43.24,63.76	43.71,63.87	43.25,63.81
path	43.13,63.09	42.70,63.17	42.55,63.96	42.25,64.80	41.87,65.35
path	40.85,66.35	40.23,66.26	39.77,65.43	39.66,63.82	39.80,62.90
path	39.65,63.77	39.77,65.41	41.40,66.60	41.47,67.53	41.77,68.25
path	42.05,68.75	42.43,68.43	42.93,68.43	43.32,68.07	43.78,68.87
path	43.36,68.13	42.46,68.38	42.05,68.75	41.73,68.15	41.47,67.49
path	41.40,66.52	40.22,66.23	39.77,65.45	39.68,64.37	39.64,63.81
path	39.83,62.80	39.66,63.78	39.78,65.45	40.20,66.23	40.54,65.96
path	41.57,65.66	42.19,64.90	42.53,64.04
kill Ursangous##12678
|tip He looks like a grey night elf druid bear that walks around this area.
collect Ursangous's Paw##16303 |q 23 |future
|only if completedq(6383)
step
use Ursangous's Paw##16303
accept Ursangous's Paw##23 |goto Ashenvale 33.55,67.44 |only if Shaman
accept Ursangous's Paw##23 |goto Ashenvale 48.92,69.57 |only if not Shaman
|only if itemcount(16303) > 0
step
use the Empty Blue Waterskin##7767
collect Filled Blue Waterskin##7770 |q 1534/1 |goto Ashenvale 33.55,67.44
|only if Shaman
step
Prepare for Blackfathom Deep
|tip It will be a good time to start Blackfathom Deep.
|tip You should run it after this next questing segment, roughly 30 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("BFDflag")
stickystart "Collect_Befouled_Water_Globe"
stickystart "Kill_Befouled_Water_Elementals"
step
Scout the Gazebo on Mystral Lake that Overlooks the Nearby Alliance Outpost |q 25/2 |goto Ashenvale 48.92,69.57
step
label "Collect_Befouled_Water_Globe"
kill Tideress##12759
|tip It looks like a darker green colored water elemental that moves around this area.
|tip It moves in the water of the whole lake, and on this small island, so you may need to search around for it.
collect Befouled Water Globe##16408 |goto Ashenvale 48.11,69.78 |q 1918 |future
step
use the Befouled Water Globe##16408
accept The Befouled Element##1918 |goto Ashenvale 48.11,69.78
step
label "Kill_Befouled_Water_Elementals"
kill 12 Befouled Water Elemental##3917 |q 25/1 |goto Ashenvale 48.11,69.78
|tip You can find more in the water around this area.
step
use the Etched Phial##5867
collect Filled Etched Phial##5868 |q 1195/1 |goto Ashenvale 60.20,72.90
step
Follow the path up and follow the road back to Splintertree Post |goto Ashenvale 59.51,68.25 < 30 |only if walking and (subzone("Moonwell") or subzone("Nightsong Woods"))
talk Senani Thunderheart##12696
turnin Ursangous's Paw##23 |goto Ashenvale 73.78,61.46
turnin Shadumbra's Head##24 |goto Ashenvale 73.78,61.46
step
Enter the building |goto Ashenvale 73.71,60.94 < 10 |walk
talk Yama Snowhoof##12837
|tip Inside the building.
turnin Freedom to Ruul##6482 |goto Ashenvale 74.11,60.92
step
talk Mastok Wrilehiss##12737
turnin Stonetalon Standstill##25 |goto Ashenvale 73.67,60.00
turnin The Befouled Element##1918 |goto Ashenvale 73.67,60.00
accept Je'neu of the Earthen Ring##824 |goto Ashenvale 73.67,60.00
step
talk Pixel##12724
turnin Satyr Horns##6441 |goto Ashenvale 73.06,61.48
step
talk Karang Amakkar##12757
turnin Between a Rock and a Thistlefur##216 |goto Ashenvale 11.90,34.54
step
talk Mitsuwa##12721
|tip Inside the building.
turnin Troll Charm##6462 |goto Ashenvale 11.65,34.85
step
talk Je'neu Sancrea##12736
|tip Inside the building.
turnin Je'neu of the Earthen Ring##824 |goto Ashenvale 11.56,34.29
step
Run Blackfathom Deeps
|tip You can use our Blackfathom Deep guide if you want assistance.
|tip Make sure you accept the Blackfathom Villainy quest inside the dungeon!
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Blackfathom Deep quest turnin guide.
|loadguide "Dungeon Guides\\Blackfathom Deeps (24-32)"
|confirm
|only if guideflag("BFDflag")
step
use the Strange Water Globe##16782
accept Baron Aquanis##6922 |goto Ashenvale 11.57,34.28
|only if guideflag("BFDflag")
step
talk Je'neu Sancrea##12736
|tip Inside the building.
turnin The Essence of Aku'Mai##6563 |goto Ashenvale 11.57,34.28 |only if completedq(6563)
turnin Allegiance to the Old Gods##6565 |goto Ashenvale 11.57,34.28 |only if completedq(6565)
turnin Amongst the Ruins##6921 |goto Ashenvale 11.57,34.28 |only if completedq(6921)
turnin Baron Aquanis##6922 |goto Ashenvale 11.57,34.28 |only if haveq(6922)
|only if guideflag("BFDflag")
step
talk Bashana Runetotem##9087
|tip Inside the building.
turnin Blackfathom Villainy##6561 |goto Thunder Bluff 71.07,34.16
|only if guideflag("BFDflag")
step
talk Kuna Thunderhorn##3015
buy Sturdy Recurve##11306 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kuna Thunderhorn##3015 |goto Thunder Bluff 47.00,45.70 |q 1195
|only if Hunter and (itemcount(11306) == 0)
step
Enter the cave |goto Thunder Bluff 29.87,29.84 < 15 |walk
talk Apothecary Zamah##3419
|tip Inside the cave.
turnin The Flying Machine Airport##1086 |goto Thunder Bluff 22.81,20.89
step
Leave the cave |goto Thunder Bluff 29.87,29.84 < 15 |walk |only if subzone("The Pools of Vision")
talk Zangen Stonehoof##4721
turnin The Sacred Flame##1195 |goto Thunder Bluff 54.97,51.41
accept The Sacred Flame##1196 |goto Thunder Bluff 54.97,51.41
step
talk Melor Stonehoof##3441
accept Steelsnap##1131 |goto Thunder Bluff 61.54,80.92
step
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Thousand Needles (28-30)',
  {
    image = ZGV.IMAGESDIR .. 'Thousand Needles',
    condition_suggested = function()
      return level >= 28 and level <= 30 and not completedq(1432)
    end,
    next = 'Leveling Guides\\Hillsbrad Foothills (30-32)',
    hardcore = true,
  },
  [[
step
talk Tatternack Steelforge##3433
accept A New Ore Sample##1153 |goto The Barrens 45.10,57.68
|tip This requires you to complete the prequest "Weapons of Choice" found in "The Barrens (24-26)" guide.
step
talk Brine##5899
|tip On top of the hill.
turnin Call of Water##1534 |goto The Barrens 43.42,77.41
accept Call of Water##220 |goto The Barrens 43.42,77.41
|only if Shaman
step
talk Grish Longrunner##12576
|tip This npc gets killed fairly often by Alliance players entering Thousand Needles.
|tip If he's not here, just wait until he respawns.
turnin Calling in the Reserves##5881 |goto Thousand Needles 31.86,21.66
step
talk Brave Moonhorn##10079
|tip This npc gets killed fairly often by Alliance players entering Thousand Needles.
|tip If he's not here, just wait until he respawns.
accept Message to Freewind Post##4542 |goto Thousand Needles 32.24,22.17
stickystart "Galak_Messenger_Check"
step
Ride an elevator down into Thousand Needles, follow the road to Freewind Post, and ride an elevator up |goto Thousand Needles 46.81,47.35 < 30 |only if walking
talk Nyse##4317
fpath Freewind Post |goto Thousand Needles 45.14,49.11
step
label "Galak_Messenger_Check"
kill Galak Messenger##10617
|tip He looks like a black centaur that runs around this area.
|tip He very rarely passes through here but it will save you searching later if you see him now.
|tip Don't stress if you don't see him before you reach Freewind Post.
collect Assassination Note##12564 |q 4881 |future
|sticky only
step
talk Elu##10377
|tip He walks around this area.
accept Wind Rider##4767 |goto Thousand Needles 44.93,48.93
step
talk Hagar Lightninghoof##10539
accept Alien Egg##4821 |goto Thousand Needles 44.64,50.29
step
talk Cliffwatcher Longhorn##10537
|tip He walks around this area.
turnin Message to Freewind Post##4542 |goto Thousand Needles 45.65,50.80
accept Pacify the Centaur##4841 |goto Thousand Needles 45.65,50.80
step
Enter the building |goto Thousand Needles 45.95,51.07 < 7 |walk
talk Rau Cliffrunner##4722
|tip Inside the building.
turnin The Sacred Flame##1196 |goto Thousand Needles 46.14,51.72
accept The Sacred Flame##1197 |goto Thousand Needles 46.14,51.72
|tip This chain started in the "Hillsbrad Foothills (22-24)" guide.
|tip This questline also continues in "Ashenvale (27-28)".
step
click Wanted Poster - Arnak Grimtotem##176115
accept Wanted - Arnak Grimtotem##5147 |goto Thousand Needles 46.00,50.84
step
talk Starn##9551
|tip Restock on arrows |only if Hunter
Vendor your Trash |vendor Starn##9551 |goto Thousand Needles/0 44.91,50.67 |q 1197
stickystart "Kill_Galak_Scouts"
stickystart "Kill_Galak_Wranglers"
stickystart "Kill_Galak_Windchasers"
step
Enter the cave |goto Thousand Needles 44.05,37.34 < 15 |walk
Follow the path |goto Thousand Needles 44.24,35.60 < 10 |walk
Follow the path |goto Thousand Needles 43.46,35.28 < 10 |walk
Continue following the path |goto Thousand Needles 42.06,34.68 < 10 |walk
click Ancient Brazier##20807
|tip Inside the cave.
|tip Clear all enemies as you make your way to the Brazier.	|only if hardcore
|tip There's two level 30 enemies guarding it, but you should be able to kill them at this level.
|tip If you have trouble, try to find someone to help you.
collect Cloven Hoof##5869 |q 1197/1 |goto Thousand Needles 42.01,31.51
step
Leave the cave |goto Thousand Needles 44.05,37.34 < 15 |c |q 4841
|only if subzone("Splithoof Hold")
step
label "Kill_Galak_Scouts"
kill 12 Galak Scout##4094 |q 4841/1 |goto Thousand Needles 45.77,40.84
|tip You can find them all around in this whole centaur camp area. |notinsticky
|tip Try to stay on the east side of the camp as you finish up the quest, since you'll be traveling east in the next steps. |notinsticky
step
label "Kill_Galak_Wranglers"
kill 10 Galak Wrangler##4093 |q 4841/2 |goto Thousand Needles 45.77,40.84
|tip You can find them all around in this whole centaur camp area. |notinsticky
|tip Try to stay on the east side of the camp as you finish up the quest, since you'll be traveling east in the next steps. |notinsticky
step
label "Kill_Galak_Windchasers"
kill 6 Galak Windchaser##4096 |q 4841/3 |goto Thousand Needles 45.77,40.84
|tip You can find them all around in this whole centaur camp area. |notinsticky
|tip Try to stay on the east side of the camp as you finish up the quest, since you'll be traveling east in the next steps. |notinsticky
stickystart "Collect_Unrefined_Ore_Sample"
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
Enter the cave |goto Thousand Needles 53.67,42.51 < 10 |walk
talk Dorn Plainstalker##2986
|tip Inside the cave.
accept Test of Faith##1149 |goto Thousand Needles 53.94,41.48
step
Watch the dialogue
Teleport to the Plateau |goto Thousand Needles 26.43,31.29 < 20 |noway |c |q 1149
step
Jump directly off the wooden platform, you will not die. |goto Thousand Needles 53.89,41.62 < 20 |noway |c |q 1149
step
talk Dorn Plainstalker##2986
|tip Inside the cave.
turnin Test of Faith##1149 |goto Thousand Needles 53.94,41.48
step
click Alien Egg##175565
|tip It looks like a large white egg sitting upright on the ground.
|tip It can spawn in multiple locations.
collect Alien Egg##12467 |q 4821/1 |goto Thousand Needles 56.35,50.36
Also check around: |notinsticky
[52.33,55.21]
step
label "Collect_Unrefined_Ore_Sample"
map Thousand Needles
path follow strict; loop on; ants straight; dist 30
path	56.69,46.47	58.20,46.41	61.34,45.75	63.64,46.94	63.68,50.02
path	65.00,52.38	66.54,50.44	68.40,52.18	67.95,58.15	66.39,61.88
path	63.98,60.80	61.56,60.05	59.17,58.18	56.17,55.65	54.20,53.93
path	52.35,54.06	51.20,52.01	51.66,48.82	52.94,47.66	53.16,45.46
path	52.57,43.69	50.83,41.70	51.42,43.42	56.70,46.50
Kill Gravelsnout enemies around this area
|tip They look like kobolds.
|tip They're pretty uncommon to find, and they're spread out in the areas off of the main roads.
|tip Grind other enemies while looking for the kobolds.
collect Unrefined Ore Sample##5842 |q 1153/1
step
Ride an elevator up |goto Thousand Needles 47.02,48.32 < 50 |only if walking
|tip Grind en route to this turnin.
talk Hagar Lightninghoof##10539
turnin Alien Egg##4821 |goto Thousand Needles 44.64,50.29
accept Serpent Wild##4865 |goto Thousand Needles 44.64,50.29
step
talk Starn##9551
|tip Buy enough ammo to fill your ammo bag, plus 8-10 extra stacks.
|tip You have a long grind coming up soon.
Visit the Vendor |vendor Starn##9551 |goto Thousand Needles 44.89,50.68 |q 1197
|only if Hunter
step
talk Cliffwatcher Longhorn##10537
|tip He walks around this area.
turnin Pacify the Centaur##4841 |goto Thousand Needles 45.65,50.80
accept Grimtotem Spying##5064 |goto Thousand Needles 45.65,50.80
step
Enter the building |goto Thousand Needles 45.94,51.06 < 7 |walk
talk Rau Cliffrunner##4722
|tip Inside the building.
turnin The Sacred Flame##1197 |goto Thousand Needles 46.14,51.71
step
Ride an elevator down |goto Thousand Needles 45.92,49.82 < 20 |only if walking and subzone("Freewind Post")
Follow the path up |goto Thousand Needles 14.75,32.83 < 15 |only if walking
click Highperch Wyvern Egg##175384+
|tip They look like large eggs with blue spots on them on the ground near walls and pillars in this area.
collect 10 Highperch Wyvern Egg##12356 |q 4767/1 |count 7 |goto Thousand Needles 11.22,36.01
stickystart "Collect_Wyvern_Eggs_Escort"
step
Follow the path up |goto Thousand Needles 13.17,39.51 < 15 |only if walking
talk Pao'ka Swiftmountain##10427
|tip This is an escort quest.
|tip If he's not here, someone else may be escorting him.
|tip Wait until he respawns.
|tip If there is a level 32 rare elite wyvern flying nearby this NPC, try to find someone to help you, or skip the quest.
|tip If you skip the quest, grind about 3500 xp in this wyvern area before continuing.
accept Homeward Bound##4770 |goto Thousand Needles 17.89,40.57 |noautoaccept
step
Watch the dialogue
|tip Follow Pao'ka Swiftmountain and protect him as he walks.
|tip Try to clear the path as he walks, as much as you can.
|tip A group of 3 wyverns will ambush you once you reach the wide open area.
|tip Fight the eastern-most wyvern of the three near the exit, the other two will not aggro and will eventually despawn.
|tip He eventually walks to this location.
|tip If you find it too difficult, try to get someone to help you, or skip the quest.
Escort Pao'ka Swiftmountain to Safety |q 4770/1 |goto Thousand Needles 15.16,32.67
step
label "Collect_Wyvern_Eggs_Escort"
click Highperch Wyvern Egg##175384+
|tip They look like large eggs with blue spots on them on the ground near walls and pillars in this area.
|tip Finish this before finishing the escort.
collect 10 Highperch Wyvern Egg##12356 |q 4767/1 |goto Thousand Needles 11.22,36.01
step
map Thousand Needles
path	follow loose;	loop;	ants curved;	dist 30
path	18.21,26.63		17.18,29.62		14.66,30.75		11.08,22.60
path	13.29,19.81		14.83,19.58		17.19,18.92		18.71,24.78
kill Steelsnap##4548
|tip He looks like a brown hyena that walks around this area with 2 purple hyena guards.
|tip If you need to, kite him away from his bodyguards, so you can fight him alone.
|tip Make sure to clear a safe area before kiting him, there can be stealthed cats in the area.
collect Steelsnap's Rib##5837 |q 1131/1
step
map Thousand Needles
path follow strict; loop on; ants curved; dist 30
path	39.44,33.24	38.82,31.88	37.54,29.57	35.90,28.67	34.91,28.50
path	33.44,30.51	32.13,30.43	30.36,28.81	28.74,28.74	27.10,28.28
path	25.12,28.25	24.20,26.78	22.81,25.96	21.41,27.49	19.38,26.95
path	18.71,24.95	18.31,22.24	18.58,25.92	20.01,27.62	21.87,30.19
path	23.27,31.50	25.29,34.22	26.34,34.21	29.31,34.01	31.42,30.78
path	32.92,30.73	35.08,28.16	36.95,29.43	38.71,31.64	39.36,33.09
kill Galak Messenger##10617
|tip He looks like a black centaur that runs around this area in a large clockwise path.
|tip This path will take you in a counter-clockwise pattern, to find him faster.
|tip If you don't want to search for him, and don't mind waiting, skip to the next step.
|tip We will show you a good location to wait for him.
collect Assassination Note##12564 |q 4881 |future
step
kill Galak Messenger##10617
|tip He looks like a black centaur that runs around this area in a large clockwise path.
|tip The previous guide step walks you through a path to actively search for him.
|tip If you don't want to search for him, be patient and wait at this location.
|tip He crosses this spot twice during his path, so it's the best spot to wait.
|tip Unless another player kills him, he will eventually cross this location.
collect Assassination Note##12564 |goto Thousand Needles 31.50,29.96 |q 4881 |future
step
use the Assassination Note##12564
accept Assassination Plot##4881 |goto Thousand Needles 21.55,32.35
step
talk Motega Firemane##10428
|tip He walks around this area.
turnin Homeward Bound##4770 |goto Thousand Needles 21.55,32.35 |only if haveq(4770) or completedq(4770)
turnin Serpent Wild##4865 |goto Thousand Needles 21.55,32.35
accept Sacred Fire##5062 |goto Thousand Needles 21.55,32.35
step
talk Kanati Greycloud##10638
turnin Assassination Plot##4881 |goto Thousand Needles 21.26,32.07
accept Protect Kanati Greycloud##4966 |goto Thousand Needles 21.26,32.07
|tip You will be attacked by a group of 3 enemies, so be ready.
step
Kill the enemies that attack
Protect Kanati Greycloud |q 4966/1 |goto Thousand Needles 21.10,31.21
step
talk Kanati Greycloud##10638
turnin Protect Kanati Greycloud##4966 |goto Thousand Needles 21.26,32.07
step
click Incendia Agave##175928+
|tip They look like yellow-brown spikey plants on the ground around the water, and underwater, around this area.
|tip You will likely have to do multiple laps between respawns. Grind mobs as you wait.
|tip The elementals can do an instant high damage stun, be careful of being low health! |only if hardcore
collect 10 Incendia Agave##12732 |q 5062/1 |goto Thousand Needles 33.37,32.86
You can find more around: |notinsticky
[35.62,35.09]
[36.84,37.54]
step
talk Melor Stonehoof##3441
turnin Steelsnap##1131 |goto Thunder Bluff 61.53,80.90
accept Frostmaw##1136 |goto Thunder Bluff 61.53,80.90
step
_Destroy This Item:_
|tip It is no longer needed.
trash Kodo Skin Scroll##5838
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if Priest or Mage |q 1153
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
talk Kym Wildmane##3036 |only if Druid
trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 1153
trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 1153
trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 1153
trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 1153
trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 1153
trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |only if Druid |q 1153
|tip Inside the building. |only if Warrior or Hunter
|tip Inside the cave |only if Priest or Mage
|tip Train your spells.
step
talk Magatha Grimtotem##4046
|tip Inside the tent.
turnin Sacred Fire##5062 |goto Thunder Bluff 69.86,30.92
accept Arikara##5088 |goto Thunder Bluff 69.86,30.92
step
talk Tatternack Steelforge##3433
turnin A New Ore Sample##1153 |goto The Barrens 45.10,57.68
step
talk Elu##10377
|tip He walks around this area.
turnin Wind Rider##4767 |goto Thousand Needles 44.93,48.93
step
talk Starn##9551
|tip Buy enough ammo to fill your ammo bag, plus 6 extra stacks.
|tip You'll be questing a while, without easy access to an ammo vendor.
Visit the Vendor |vendor Starn##9551 |goto Thousand Needles 44.89,50.68 |q 5088
|only if Hunter
step
Go down the elevator |goto Thousand Needles/0 46.57,48.44 < 15 |only if walking and subzone("Freewind Post")
Follow the path up |goto Thousand Needles 31.24,36.88 < 15 |only if walking
Cross the hanging bridge |goto Thousand Needles 33.13,35.33 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 31.97,31.32 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 33.24,28.50 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 34.99,31.50 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 35.66,39.40 < 10 |only if walking
Enter the building |goto Thousand Needles 38.97,41.15 < 10 |walk
click Document Chest##176344
|tip Inside the building.
collect Secret Note #3##12768 |q 5064/3 |goto Thousand Needles 39.32,41.52
step
Enter the building |goto Thousand Needles 34.11,39.49 < 10 |walk
click Document Chest##176344
|tip Inside the building.
collect Secret Note #2##12766 |q 5064/2 |goto Thousand Needles 33.78,39.97
step
Cross the hanging bridge |goto Thousand Needles 33.26,36.30 < 10 |only if walking
click Document Chest##176344
collect Secret Note #1##12765 |q 5064/1 |goto Thousand Needles 31.80,32.59
step
Cross the hanging bridge |goto Thousand Needles 32.36,33.47 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 34.22,35.79 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 35.67,30.99 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 37.15,33.10 < 10 |only if walking
click Sacred Fire of Life##175944
|tip Clear the area of enemies first.
|tip A level 28 elite enemy will spawn, but it's pretty easy to kill.
Light the Sacred Fire of Life |q 5088/2 |goto Thousand Needles 38.02,35.32
step
kill Arikara##10882
|tip It's elite, but pretty easy to kill.
|tip If you have trouble killing it, try to get someone to help you, or skip the quest.
collect Arikara Serpent Skin##12925 |q 5088/1 |goto Thousand Needles 38.29,35.54
step
Cross the hanging bridge |goto Thousand Needles 37.72,35.00 < 10 |only if walking
Cross the hanging bridge |goto Thousand Needles 37.62,31.50 < 10 |only if walking
kill Arnak Grimtotem##10896
|tip He walks around this area.
collect Arnak's Hoof##12884 |q 5147/1 |goto Thousand Needles 38.08,26.85
step
talk Lakota Windsong##10646
|tip This is an escort quest.
|tip If she's not here, someone else may be escorting her.
|tip Wait until she respawns.
accept Free at Last##4904 |goto Thousand Needles 37.99,26.59 |noautoaccept
step
Watch the dialogue
|tip Follow Lakota Windsong and protect her as she walks.
|tip Try to clear the path in front of her, as much as you can.
|tip You will be attacked by 2 enemies that spawn on each plateau as you walk.
|tip She eventually walks to this location.
|tip If you have trouble, try to get someone to help you, or skip the quest.
Escort Lakota Windsong from the Darkcloud Pinnacle |q 4904/1 |goto Thousand Needles 30.97,37.09
step
talk Motega Firemane##10428
turnin Arikara##5088 |goto Thousand Needles 21.55,32.35
step
talk Wizlo Bearingshiner##10941
accept Hypercapacitor Gizmo##5151 |goto Thousand Needles/0 21.45,32.54
|only if Hunter or Warlock
step
kill Enraged Panther##10992
|tip This is an elite quest, but you should be able to easily solo her if you let your pet tank.
|tip Drop an immolation trap infront of the cage before opening it. |only if Hunter
|tip If your pet is about to die, use Aspect of the Cheetah and prepare to head back to the road and kite her along it until she dies. |only if Hunter
|tip Clear the area before starting the fight so you can safely use fear to crowd control the panther. |only if warlock
|tip Open the cage to start the fight when you are ready.
collect Hypercapacitor Gizmo##12946 |q 5151 |goto Thousand Needles/0 22.74,24.40
|only if Hunter or Warlock
step
Kill enemies around this area
collect 15 Silk Cloth##4306 |goto Thousand Needles 18.47,22.35 |q 4449 |future
|tip You will need these for a later quest in Searing Gorge.
|tip Make sure to not accidentally sell these to a vendor.
step
talk Laer Stepperunner##3689
|tip You have a long grind ahead.
Stock up on food and water |vendor Laer Stepperunner##3689 |goto Thousand Needles/0 21.06,31.87 |q 5064
|only if level < 31
step
Kill enemies around this area
|tip You are about to go to Orgrimmar soon.
|tip It will be a good time to train your level 30 abilities.
|tip We are grinding a large amount here, so that you don't have to grind an extremely long time all at once trying to get to level 32 fairly soon.
|tip You will reach a point soon where you need to be at least level 32 to be able to kill quest enemies at a decent speed.
|tip Alternatively, you could also skip this step and take a break from questing once you get to Orgrimmar soon, get your level 30 abilties, and run dungeons to hit level 32 before continuing with the guide, so you can be a little ahead of the guide going forward.
ding 30,30000 |goto Thousand Needles 18.47,22.35
You can sell items at [21.06,31.86]
step
talk Wizlo Bearingshiner##10941
turnin Hypercapacitor Gizmo##5151 |goto Thousand Needles/0 21.45,32.54
|only if Hunter or Warlock
step
Follow the road up into Feralas |goto Thousand Needles 7.68,10.62 < 30 |only if walking and zone("Thousand Needles")
talk Shyn##8020
|tip Be careful when walking to this location.
|tip The enemies in this zone are much higher level than you currently.
|tip If you die, resurrect at the Camp Mojache spirit healer.
fpath Camp Mojache |goto Feralas 75.45,44.36
|only if not hardcore
step
talk Cliffwatcher Longhorn##10537
|tip He walks around this area.
turnin Grimtotem Spying##5064 |goto Thousand Needles 45.65,50.80
turnin Wanted - Arnak Grimtotem##5147 |goto Thousand Needles 45.65,50.80
step
Enter the building |goto Thousand Needles 45.94,51.07 < 7 |walk
talk Innkeeper Abeqwa##11116
|tip Inside the building.
home Freewind Post |goto Thousand Needles 46.07,51.51
step
talk Thalia Amberhide##10645
|tip Inside the building.
turnin Free at Last##4904 |goto Thousand Needles 45.97,51.61
step
talk Kravel Koalbeard##4452
accept Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
accept Wharfmaster Dizzywig##1111 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
accept Salt Flat Venom##1104 |goto Thousand Needles 78.06,77.13
step
talk Wizzle Brassbolts##4453
accept Hardened Shells##1105 |goto Thousand Needles 78.14,77.12
step
talk Pozzik##4630
accept Load Lightening##1176 |goto Thousand Needles 80.18,75.89
step
talk Trackmaster Zherin##4629
accept A Bump in the Road##1175 |goto Thousand Needles 81.64,77.95
step
talk Bulkrek Ragefist##7824
|tip Avoid enemies as you walk here, they are higher level than you.
fpath Gadgetzan |goto Tanaris 51.60,25.44
step
talk Korran##3428
accept The Swarm Grows##1145 |goto The Barrens 51.07,29.63
step
talk Wharfmaster Dizzywig##3453
turnin Wharfmaster Dizzywig##1111 |goto The Barrens 63.35,38.45
accept Parts for Kravel##1112 |goto The Barrens 63.35,38.45
step
talk Islen Waterseer##5901
turnin Call of Water##220 |goto The Barrens 65.83,43.78
accept Call of Water##63 |goto The Barrens 65.83,43.78
|only if Shaman
step
Enter the building |goto Orgrimmar 49.90,70.55 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Put these items in the bank.
bank Kravel's Parts##5800 |goto Orgrimmar 49.58,69.12 |q 1112 |future
bank 15 Silk Cloth##4306 |goto Orgrimmar 49.58,69.12 |q 4449 |future
|tip Try to keep these separated from the cloth you're saving for cloth donation quests.
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48
|only if Rogue
step
Enter the building |goto Orgrimmar 45.74,57.43 < 10 |walk
talk Horthus##3323
|tip Inside the building.
|tip If you can afford it.
|tip Stock up on a few Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Horthus##3323 |goto Orgrimmar 45.45,56.55 |q 2 |future
|only if Mage
step
talk Belgrom Rockmaul##4485
turnin The Swarm Grows##1145 |goto Orgrimmar 75.23,34.23
accept The Swarm Grows##1146 |goto Orgrimmar 75.23,34.23
step
Enter the building |goto Orgrimmar 76.57,32.86 < 10 |walk
talk Sorek##3354
|tip Inside the building.
accept The Islander##1718 |goto Orgrimmar 80.39,32.38
|only if Warrior
step
Enter the building |goto Orgrimmar 81.05,19.76 < 10 |walk
talk Sayoc##11868
|tip Inside the building.
|tip This will allow you to equip two-handed axes.
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0 |goto Orgrimmar 81.70,19.55
|only if Hunter
step
talk Craven Drok##5639
|tip He walks around this area inside the Cleft of Shadow.
accept Alliance Relations##1431 |goto Orgrimmar 46.76,50.43
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 2 |future
|only if Warlock
step
talk Klannoc Macleod##6236
turnin The Islander##1718 |goto The Barrens 68.62,49.17
accept The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
Step on the Grate to Begin the Affray |q 1719/1 |goto The Barrens 68.61,48.72
|only if Warrior
step
kill Affray Challenger##6240+
|tip You will have to kill six of them before Big Will will appear.
|tip You will fight them one at a time.
kill Big Will##6238 |q 1719/2 |goto The Barrens 68.61,48.72
|tip It may take a while before he appears.
|only if Warrior
step
talk Klannoc Macleod##6236
|tip You will learn Berserker Stance from completing this quest.
turnin The Affray##1719 |goto The Barrens 68.62,49.17
accept The Windwatcher##1791 |goto The Barrens 68.62,49.17
|only if Warrior
step
map Ashenvale
path follow strict; loop on; ants curved; dist 30
path	71.49,70.11	72.04,70.46	72.56,70.62	73.41,70.57	74.38,70.07
path	75.07,70.01	75.94,69.80	76.09,69.00	76.85,68.13	77.57,66.41
path	77.89,65.98	78.32,65.65
path	77.89,65.98	77.57,66.41	76.85,68.13	76.09,69.00	75.94,69.80
path	75.07,70.01	74.38,70.07	73.41,70.57	72.56,70.62	72.04,70.46
kill Sharptalon##12676
|tip He looks like a large blue bird that flies low to the ground around this area.
collect Sharptalon's Claw##16305 |q 2 |future
|only if completedq(6383)
step
use Sharptalon's Claw##16305
accept Sharptalon's Claw##2 |goto Ashenvale 73.78,61.46
|only if itemcount(16305) > 0
step
talk Senani Thunderheart##12696
turnin Sharptalon's Claw##2 |goto Ashenvale 73.78,61.46
accept The Hunt Completed##247 |goto Ashenvale 73.78,61.46
step
Enter the building |goto Orgrimmar 22.28,53.78 < 10 |walk
talk Keldran##5640
|tip He walks around inside the building.
turnin Alliance Relations##1431 |goto Orgrimmar 22.56,52.63
accept Alliance Relations##1432 |goto Orgrimmar 22.56,52.63
step
Enter the building |goto Orgrimmar 40.30,36.97 < 15 |walk
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Air##1531 |goto Orgrimmar 37.96,37.73
|only if Shaman
step
Optional Route Change
|tip You can opt to do Gnomeregan soon instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Gnomeregan, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Gnomeregan later |confirm Gnomerflag
Click Here if you'd prefer to grind |confirm
step
Enter the building |goto Orgrimmar 75.22,24.61 < 5 |walk
talk Nogg##3412
|tip Inside the building.
|tip It is likely your quest log will be full carrying this quest.
|tip However, you need to accept it to be eligible for the next quest.
|tip Once you have the "Chief Engineer Scooty" quest you can safely abandon Rig Wars if your quest log fills up.
|tip It is very likely another player in the party will be able to share Rig Wars with you when its time for Gnomeregan.
accept Rig Wars##2841 |goto Orgrimmar 76.00,25.42
|only if guideflag("Gnomerflag")
step
talk Sovik##3413
|tip Inside the building.
accept Chief Engineer Scooty##2842 |goto Orgrimmar 75.49,25.35
|only if guideflag("Gnomerflag")
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Pestilent Wand##5347 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 1432
|only if Priest and itemcount(5347) == 0
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Hillsbrad Foothills (30-32)',
  {
    image = ZGV.IMAGESDIR .. 'Hillsbrad Foothills',
    condition_suggested = function()
      return level >= 30 and level <= 32 and not completedq(509)
    end,
    next = 'Leveling Guides\\Arathi Highlands (32-33)',
    hardcore = true,
  },
  [[
step
_NOTE:_
Save Silk Cloth in Your Bank as You Level
|tip You are reaching the level where Silk Cloth will start to drop regularly
|tip You will need 240 Silk Cloth later.
|tip As you level and collect these cloth naturally from killing enemies while following the guide, make sure you deposit the cloth into a bank whenever you are near one.
|tip This will give you about 40,000 quick and easy xp to help you get to level 60 faster in the longer later levels.
Click Here to Continue |confirm
|only if level < 60
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Belgrom's Sealed Note##5850 |goto Undercity 65.97,44.75 |q 1146 |future
|tip Collect these items from the bank.
collect Shipment of Iron##3564 |goto Undercity 65.97,44.75 |q 529
|tip You may not have this item, that is okay, skip this if so.
collect Hillsbrad Human Skull##3692+ |goto Undercity 65.97,44.75 |q 546
|tip Collect all of the skulls you have in the bank.
step
talk Eunice Burch##4552
|tip You need to have the Cooking profession learned in order to accept a quest soon.
Learn Cooking |skillmax Cooking,75 |goto Undercity 62.14,44.91 |q 7321 |future
step
talk Archibald##11870
|tip This will allow you to equip crossbows and two-handed swords.
Train Crossbows |complete weaponskill("CROSSBOW") > 0 |goto Undercity 57.31,32.77
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0 |goto Undercity 57.31,32.77
|only if Hunter
step
talk Benijah Fenner##4602
buy Heavy Quiver##7371 |n
|tip If you can afford it.
Visit the Vendor |vendor Benijah Fenner##4602 |goto Undercity 58.82,32.82 |q 1432
|only if Hunter and itemcount(7371) == 0
step
talk Benijah Fenner##4602
buy Heavy Crossbow##15809 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Benijah Fenner##4602 |goto Undercity 58.82,32.82 |q 1432
|only if Hunter and itemcount(15809) == 0
step
talk Genavie Callow##4486
accept To Steal From Thieves##1164 |goto Undercity 63.83,49.45
step
talk Geoffrey Hartwell##4600
buy Broadsword##2520 |n
|tip If you can afford it.
|tip You will use it when you reach level 31.
|tip If you have better, skip this step.
Visit the Vendor |vendor Geoffrey Hartwell##4600 |goto Undercity 58.67,33.06 |q 529
|only if Rogue and itemcount(2520) == 0
step
talk Ezekiel Graves##4585
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Ezekiel Graves##4585 |goto Undercity 75.60,51.60 |q 529
|only if Rogue
step
talk Hannah Akeley##4575
|tip If you can afford it.
|tip Stock up on a few Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Hannah Akeley##4575 |goto Undercity 82.78,15.83 |q 529
|only if Mage
step
Jump up and follow the path behind the tree |goto Silverpine Forest 42.03,40.66 < 7 |only if walking
use the Water Sapta##6637
|tip This will allow you to see the green water elementals you need to kill.
kill Corrupt Water Spirit##5897+
collect Corrupt Manifestation's Bracers##7812 |q 63/1 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
click Brazier of Everfount##113791
turnin Call of Water##63 |goto Silverpine Forest 38.28,44.56
accept Call of Water##100 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
Watch the dialogue
talk Minor Manifestation of Water##5895
turnin Call of Water##100 |goto Silverpine Forest 38.75,44.62
accept Call of Water##96 |goto Silverpine Forest 38.75,44.62
|only if Shaman
step
Run around the mountains and make your way back to The Sepulcher |goto Silverpine Forest 38.77,32.08 < 50 |c |q 96
|only if Shaman and subzone("North Tide's Run")
step
Enter the building |goto Hillsbrad Foothills 61.49,19.43 < 10 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
accept Elixir of Agony##509 |goto Hillsbrad Foothills 61.44,19.06
step
talk Tallow##2770
accept The Hammer May Fall##676 |goto Hillsbrad Foothills 61.87,19.58
stickystart "Collect_Hillsbrad_Human_Skulls"
stickystart "Kill_Blacksmith_Verrington"
stickystart "Kill_Hillsbrad_Apprentice_Blacksmiths"
step
click Shipment of Iron##1736
|tip Inside the building.
|tip If Blacksmith Verringtan is inside the building, you may need help with this.
collect Shipment of Iron##3564 |q 529/3 |goto Hillsbrad Foothills 32.01,45.45
step
label "Kill_Blacksmith_Verrington"
kill Blacksmith Verringtan##2404 |q 529/1 |goto Hillsbrad Foothills 32.41,44.81
|tip He can spawn in multiple locations around, and inside this blacksmith building, and he walks around this area. |notinsticky
|tip If he spawns inside the blacksmith building, this can be a bit harder. |notinsticky
|tip Try to kit him away from the other enemies, or try to find someone to help you. |notinsticky
step
label "Kill_Hillsbrad_Apprentice_Blacksmiths"
kill 4 Hillsbrad Apprentice Blacksmith##2265 |q 529/2 |goto Hillsbrad Foothills 32.41,44.81
|tip All around this blacksmith building. |notinsticky
stickystop "Collect_Hillsbrad_Human_Skulls"
step
talk High Executor Darthalia##2215
turnin Battle of Hillsbrad##529 |goto Hillsbrad Foothills 62.33,20.45
accept Battle of Hillsbrad##532 |goto Hillsbrad Foothills 62.33,20.45
step
Enter the building |goto Hillsbrad Foothills 62.51,19.61 < 10 |walk
talk Christoph Jeffcoat##2393
|tip Inside the building.
accept Soothing Turtle Bisque##7321 |goto Hillsbrad Foothills 62.29,19.04
|only if skill("Cooking") > 0
step
Enter the building |goto Hillsbrad Foothills 62.91,20.56 < 10 |walk
talk Krusk##2229
|tip Inside the building.
accept Infiltration##533 |goto Hillsbrad Foothills 63.24,20.65
step
talk Novice Thaivand##2429
|tip Outside in the graveyard.
accept Helcular's Revenge##552 |goto Hillsbrad Foothills 63.88,19.66
stickystart "Collect_Turtle_Meat"
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
|tip Follow the river north to travel to this location.
turnin The Windwatcher##1791 |goto Alterac Mountains 80.50,66.92
accept Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
label "Collect_Turtle_Meat"
kill Snapjaw##2408+
|tip They look like turtles.
|tip You can find more all along the river to the north and south.
|tip If you go far south, be careful to avoid Southshore.
|tip If you go far north, be careful to avoid Narillasanz, he is a red elite dragon that can rarely patrol near the river.
collect 10 Turtle Meat##3712 |q 7321/1 |goto Hillsbrad Foothills 68.28,23.81
step
Enter the building |goto Hillsbrad Foothills 62.51,19.61 < 10 |walk
talk Christoph Jeffcoat##2393
|tip Inside the building.
buy Soothing Spices##3713 |n
collect Soothing Spices##3713 |q 7321/2 |goto Hillsbrad Foothills 62.29,19.04
step
talk Christoph Jeffcoat##2393
|tip Inside the building.
turnin Soothing Turtle Bisque##7321 |goto Hillsbrad Foothills 62.29,19.04
step
Enter the building |goto Hillsbrad Foothills 61.58,20.61 < 10 |walk
talk Magus Wordeen Voidglare##2410
|tip Inside the building.
accept Prison Break In##544 |goto Hillsbrad Foothills 61.60,20.84
step
talk Keeper Bel'varil##2437
|tip Inside the building.
accept Stone Tokens##556 |goto Hillsbrad Foothills 61.50,20.93
step
Kill Yeti enemies around this area
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while in the cave.	|only if hardcore
collect Helcular's Rod##3708 |q 552/1 |goto Hillsbrad Foothills 46.21,31.86
stickystart "Kill_Hillsbrad_Councilmen"
stickystart "Collect_Hillsbrad_Human_Skulls"
step
Leave the cave |goto Hillsbrad Foothills 46.21,31.86 < 15 |walk |only if subzone("Darrow Hill") and _G.IsIndoors()
Enter the building |goto Hillsbrad Foothills 30.46,42.20 < 10 |walk
kill Clerk Horrace Whitesteed##2448 |q 567/1 |goto Hillsbrad Foothills 29.81,42.42
|tip Inside the building.
|tip Try to pull enemies out of the building, to avoid having to fight them all at once.
step
kill Magistrate Burnside##2335 |q 532/1 |goto Hillsbrad Foothills 29.67,41.64
|tip Inside the building.
step
click Hillsbrad Proclamation##1761
|tip Inside the building on the railing.
|tip Be careful this building is full of enemies that run at low health.
|tip Try to pull them outside the building 1-2 at a time so it's safer.
Destroy the Hillsbrad Proclamation |q 532/3 |goto Hillsbrad Foothills 29.73,41.75
step
click Hillsbrad Town Registry##1759
|tip Inside the building. It is a book in the corner.
|tip Be careful this building is full of enemies that run at low health.
|tip Try to pull them outside the building 1-2 at a time so it's safer.
collect Hillsbrad Town Registry##3657 |q 532/4 |goto Hillsbrad Foothills 29.52,41.53
step
label "Kill_Hillsbrad_Councilmen"
kill 5 Hillsbrad Councilman##2387 |q 532/2 |goto Hillsbrad Foothills 30.46,42.20
|tip Inside and outside the building.
stickystop "Collect_Hillsbrad_Human_Skulls"
step
talk High Executor Darthalia##2215
turnin Battle of Hillsbrad##532 |goto Hillsbrad Foothills 62.33,20.45
accept Battle of Hillsbrad##539 |goto Hillsbrad Foothills 62.33,20.45
step
talk Novice Thaivand##2429
turnin Helcular's Revenge##552 |goto Hillsbrad Foothills 63.88,19.66
accept Helcular's Revenge##553 |goto Hillsbrad Foothills 63.88,19.66 |only if not hardcore
step
talk Kayren Soothallow##2401
|tip Buy enough ammo to fill your ammo bag, plus 6-8 extra stacks.
|tip You have a long grind coming up soon. If you didn't grind earlier at level 30, buy a LOT of arrows.
Visit the Vendor |vendor Kayren Soothallow##2401 |goto Hillsbrad Foothills 62.56,19.91 |q 553
|only if Hunter
step
Enter the cave |goto Hillsbrad Foothills 46.21,31.86 < 15 |walk
Run down the ramp and follow the path |goto Hillsbrad Foothills 45.00,28.07 < 10 |walk
click Flame of Veraz##1769
|tip Downstairs inside the cave.
|tip Watch for patrols and respawns.
Charge the Flame of Veraz |q 553/2 |goto Hillsbrad Foothills 44.04,26.56
|only if not hardcore
step
Follow the path |goto Hillsbrad Foothills 44.92,28.21 < 15 |walk
Follow the path up |goto Hillsbrad Foothills 44.11,28.54 < 15 |walk
Follow the path |goto Hillsbrad Foothills 45.42,30.93 < 15 |c |q 553
|only if not hardcore
step
click Flame of Azel##1768
|tip Upstairs inside the cave.
|tip Watch for patrols and respawns.
Charge the Flame of Azel |q 553/1 |goto Hillsbrad Foothills 43.90,28.05
|only if not hardcore
stickystart "Collect_Hillsbrad_Human_Skulls"
step
Leave the cave |goto Hillsbrad Foothills 46.27,31.94 < 15 |walk |only if subzone("Darrow Hill") and _G.IsIndoors()
Enter the mine via the ground floor back entrance |goto Hillsbrad Foothills 26.51,58.61 < 10 |q 567
stickystart "Kill_Hillsbrad_Miners"
step
Follow the path |goto Hillsbrad Foothills 30.07,57.44 < 15 |walk
kill Foreman Bonds##2305 |q 539/1 |goto Hillsbrad Foothills 31.21,56.01
|tip Inside the mine.
|tip He will summon two adds when he dies, make sure you're ready for them.
|tip Watch for patrols and respawns.	|only if hardcore
step
kill Miner Hackett##2450 |q 567/3 |goto Hillsbrad Foothills 31.12,58.62
|tip Inside the mine.
|tip He can spawn in multiple locations inside the mine.
|tip Watch for patrols and respawns.	|only if hardcore
He can also be around: |notinsticky
[30.60,56.38]
[31.97,52.28]
[29.70,56.02]
step
label "Kill_Hillsbrad_Miners"
kill 10 Hillsbrad Miner##2269 |q 539/2 |goto Hillsbrad Foothills 30.86,53.92
|tip All around inside the mine. |notinsticky
|tip Watch for patrols and respawns.	|only if hardcore |notinsticky
step
label "Collect_Hillsbrad_Human_Skulls"
Kill Hillsbrad enemies around this area |notinsticky
collect 30 Hillsbrad Human Skull##3692 |q 546/1 |goto Hillsbrad Foothills 30.86,53.92
step
Kill enemies around this area
|tip All around inside the mine.
|tip Watch for patrols and respawns.	|only if hardcore
|tip The enemies you will need to kill for quests going forward are a bit higher level, so we need to grind here for a while to get you high enough level so that you can kill them decently fast.
|tip If you prefer, you could run dungeons to also try to get some gear upgrades in the process.
ding 32 |goto Hillsbrad Foothills 30.86,53.92
step
Leave Azurelode Mine |complete not (subzone("Azurelode Mine") and _G.IsIndoors()) |q 567
|tip There are multiple exits.
|tip Fight your way to any of them and leave the mine.
stickystart "Collect_Worn_Stone_Tokens"
step
kill Ricter##2411
|tip He walks around this area.
|tip He runs away really fast at low health, try to slow or CC him so he doesn't run and pull more enemies.
collect Bloodstone Marble##3689 |q 544/2 |goto Alterac Mountains 20.20,84.08
step
Enter the building |goto Alterac Mountains 20.46,86.09 < 10 |walk
kill Alina##2412
|tip She walks around inside the building.
collect Bloodstone Shard##3690 |q 544/3 |goto Alterac Mountains 20.35,86.35
step
kill Dermot##2413
|tip He walks around inside the building.
collect Bloodstone Wedge##3691 |q 544/1 |goto Alterac Mountains 20.01,86.13
step
Enter the building |goto Alterac Mountains 18.65,84.41 < 7 |walk
kill Kegan Darkmar##2414
|tip Upstairs inside the building.
|tip He is guarded by Warden Belamoore, a high level mage. Use the stairs or the doorway downstairs to break line of sight of her casts and prevent her from damaging you.
|tip Don't fight her in a position you can get fireballed repeatedly or you will die.
collect Bloodstone Oval##3688 |q 544/4 |goto Alterac Mountains 17.78,83.20
step
_Destroy This Item:_
|tip It is no longer needed.
trash Belamoore's Research Journal##3711
step
label "Collect_Worn_Stone_Tokens"
Kill Dalaran enemies around this area
|tip They can also be in the buildings around this area.
_NOTE_ |only if Warrior or Rogue or Shaman or Druid
|tip This is very important, do not let your focus drop on this quest. |only if (Warrior or Rogue or Shaman or Druid) and hardcore
|tip Don't melee attack the Dalaran Shield Guards when they are glowing red. |only if Warrior or Rogue or Shaman or Druid
|tip This spell will reflect heavy damage back at you and can quickly kill you if you aren't watching. |only if Warrior or Rogue or Shaman or Druid
collect 10 Worn Stone Token##3714 |q 556/1 |goto Alterac Mountains 19.33,82.59
You can find more around [16.58,76.69]
step
Follow the path up |goto Alterac Mountains/0 35.16,80.18 < 20 |only if walking
Enter the cave |goto Alterac Mountains/0 37.55,68.05 < 15 |walk
click Flame of Uzel##1770
|tip Inside the cave.
Charge the Flame of Uzel |q 553/3 |goto Alterac Mountains/0 37.54,66.26
|only if not hardcore
step
Follow the path |goto Alterac Mountains/0 40.38,74.19 < 30 |only if walking and subzone("Growless Cave")
Avoid the Alliance Camp |goto Alterac Mountains/0 40.65,85.89 < 30 |only if walking and hardcore
Kill Syndicate enemies around this area
|tip Be very careful to not run into the Alliance camp when routing here. |only if hardcore
|tip Enemies may run away in fear when at low health.	|only if hardcore
collect Syndicate Missive##3601 |q 533/1 |goto Alterac Mountains/0 47.69,82.45
step
Enter the building |goto Hillsbrad Foothills 61.58,20.61 < 10 |walk
talk Magus Wordeen Voidglare##2410
|tip Inside the building.
turnin Prison Break In##544 |goto Hillsbrad Foothills 61.60,20.84
step
talk Keeper Bel'varil##2437
|tip Inside the building.
turnin Stone Tokens##556 |goto Hillsbrad Foothills 61.50,20.94
step
talk Deathguard Samsa##2418
turnin Souvenirs of Death##546 |goto Hillsbrad Foothills 62.11,19.70
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin Battle of Hillsbrad##539 |goto Hillsbrad Foothills 62.33,20.46
turnin Dangerous!##567 |goto Hillsbrad Foothills 62.33,20.46
step
Enter the building |goto Hillsbrad Foothills 62.91,20.56 < 10 |walk
talk Krusk##2229
|tip Inside the building.
turnin Infiltration##533 |goto Hillsbrad Foothills 63.24,20.65
step
talk Kayren Soothallow##2401
Vendor your Trash |vendor Kayren Soothallow##2401 |goto Hillsbrad Foothills/0 62.53,19.91 |q 509
step
Avoid Southshore |goto Hillsbrad Foothills 54.96,49.07 < 30 |only if walking
Follow the path and be careful to avoid the guards |goto Hillsbrad Foothills 53.54,52.18 < 30 |only if walking
click Helcular's Grave##1767
turnin Helcular's Revenge##553 |goto Hillsbrad Foothills 52.78,53.38
|only if not hardcore
step
click Mudsnout Blossom##1723+
|tip They look like large white and blue mushrooms on the ground around this area.
collect 6 Mudsnout Blossoms##3502 |q 509/1 |goto Hillsbrad Foothills 64.26,61.28
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Arathi Highlands (32-33)',
  {
    image = ZGV.IMAGESDIR .. 'Arathi Highlands',
    condition_suggested = function()
      return level >= 32 and level <= 32 and not completedq(513)
    end,
    next = 'Leveling Guides\\Thousand Needles (33-34)',
    hardcore = true,
  },
  [[
stickystart "Kill_Boulderfist_Ogres"
step
kill 10 Boulderfist Enforcer##2564 |q 676/2 |goto Arathi Highlands 34.81,44.14
|tip Inside the cave.
|tip Watch for patrols and respawns while in the cave.	|only if hardcore
step
Leave the cave |goto Arathi Highlands 34.82,44.15 < 15 |c |q 676
|only if subzone("Boulderfist Outpost")
step
label "Kill_Boulderfist_Ogres"
kill 8 Boulderfist Ogre##2562 |q 676/1 |goto Arathi Highlands 36.32,43.60
You can find more around: |notinsticky
[32.61,40.22]
[33.17,48.05]
step
kill Marcel Dabyrie##4481
|tip Avoid the Alliance guards near Refuge Camp while running here. |only if hardcore
|tip Inside the building.
|tip If you have trouble, try to find someone to help you.
collect Marcel's Head##5832 |q 1164/2 |goto Arathi Highlands 54.14,38.16
step
kill Fardel Dabyrie##4479
|tip If you have trouble, try to find someone to help you.
|tip He can spawn in multiple locations.
collect Fardel's Head##58312 |q 1164/3 |goto Arathi Highlands 56.54,38.70
Also check around: |notinsticky
[54.61,37.69]
[56.73,40.36]
step
kill Kenata Dabyrie##4480
|tip Inside the building.
|tip If you have trouble, try to find someone to help you.
collect Kenata's Head##5830 |q 1164/1 |goto Arathi Highlands 56.37,36.08
step
Enter Hammerfall |goto Arathi Highlands 73.46,30.45 < 15 |only if walking
talk Urda##2851
fpath Hammerfall |goto Arathi Highlands 73.06,32.68
step
talk Tharlidun##9976
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 5".
Click Here to Continue |confirm |goto Arathi Highlands 73.93,33.13 |q 677 |future
|only if Hunter
step
talk Drum Fel##2771
turnin The Hammer May Fall##676 |goto Arathi Highlands 74.24,33.91
accept Call to Arms##677 |goto Arathi Highlands 74.24,33.91
step
talk Gor'mul##2792
|tip He walks around this area.
accept Hammerfall##655 |goto Arathi Highlands 72.67,34.12
step
talk Tor'gan##2706
turnin Hammerfall##655 |goto Arathi Highlands 74.71,36.29
accept Raising Spirits##672 |goto Arathi Highlands 74.71,36.29
accept Foul Magics##671 |goto Arathi Highlands 74.71,36.29
step
_NOTE:_
Tame a Plains Creeper
|tip Use your "Tame Beast" ability on a Plains Creeper.
|tip They look like grey spiders around this area.
|tip Make sure to tame a level 32 Plains Creeper.
Learn the "Bite 5" Pet Ability
|tip Kill enemies around this area until you see a message in your chat saying you learned "Bite 5".
|tip You will teach "Bite 5" to your permanent pet soon.
Click Here to Continue |confirm |goto Arathi Highlands 71.04,48.59 |q 677
|only if Hunter
step
talk Tharlidun##9976
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Bite 5" to your permanent pet.
Click Here to Continue |confirm |goto Arathi Highlands 73.93,33.13 |q 677
|only if Hunter
stickystart "Kill_Witherbark_Axe_Throwers"
stickystart "Kill_Witherbark_Witch_Doctors"
step
kill 10 Witherbark Headhunter##2556 |q 677/2 |goto Arathi Highlands 66.66,64.37
|tip They share spawn points with the other Witherbark enemies, so kill those too, if you can't find any.
|tip Try to only fight ones that are within 2 levels of you, some can spawn 3 levels higher in this area.
You can find more around: |notinsticky
[Arathi Highlands 61.45,72.04]
[Arathi Highlands 64.79,72.83]
[Arathi Highlands 70.29,68.39]
[Arathi Highlands 72.11,64.09]
[Arathi Highlands 70.82,60.27]
step
label "Kill_Witherbark_Axe_Throwers"
kill 10 Witherbark Axe Thrower##2554 |q 677/1 |goto Arathi Highlands 66.66,64.37
|tip They share spawn points with the other Witherbark enemies, so kill those too, if you can't find any. |notinsticky
You can find more around: |notinsticky
[61.45,72.04]
[64.79,72.83]
[70.29,68.39]
[72.11,64.09]
[70.82,60.27]
step
label "Kill_Witherbark_Witch_Doctors"
kill 8 Witherbark Witch Doctor##2555 |q 677/3 |goto Arathi Highlands 66.66,64.37
|tip They share spawn points with the other Witherbark enemies, so kill those too, if you can't find any. |notinsticky
You can find more around: |notinsticky
[61.45,72.04]
[64.79,72.83]
[70.29,68.39]
[72.11,64.09]
[70.82,60.27]
stickystart "Collect_Highland_Raptor_Eyes"
step
Kill Syndicate enemies around this area
|tip Some of them are stealthed, so be careful.
|tip They are also inside the buildings.
|tip You can find more stealthed along the small hill ridges surrounding this village.
|tip Be careful to avoid Refuge Pointe while traveling here.
|tip Be sure you are Tracking Hidden to help you spot these enemies. |only if Hunter
collect 10 Bloodstone Amulet##4495 |q 671/1 |goto Arathi Highlands 32.67,29.22
step
Kill enemies around this area
|tip Some of them are stealthed, so be careful.
|tip They are also inside the buildings.
|tip You can find more stealthed along the small hill ridges surrounding this village.
ding 33 |goto Arathi Highlands 32.67,29.22
step
label "Collect_Highland_Raptor_Eyes"
Kill Raptor enemies around this area
|tip We are returning to Hammerfall after this, so start killing that way once you are close to finishing.
collect 10 Highland Raptor Eye##4512 |q 672/1 |goto Arathi Highlands 39.33,37.51
You can find more around: |notinsticky
[60.44,43.32]
[68.04,35.31]
|stickyif not subzone("Northfold Manor")
step
talk Tor'gan##2706
turnin Foul Magics##671 |goto Arathi Highlands 74.71,36.29
turnin Raising Spirits##672 |goto Arathi Highlands 74.71,36.29
accept Raising Spirits##674 |goto Arathi Highlands 74.71,36.29
step
talk Gor'mul##2792
|tip He walks around this area.
turnin Raising Spirits##674 |goto Arathi Highlands 72.67,34.12
accept Raising Spirits##675 |goto Arathi Highlands 72.67,34.12
step
talk Tor'gan##2706
turnin Raising Spirits##675 |goto Arathi Highlands 74.71,36.29
step
Run up the stairs |goto Arathi Highlands 73.49,34.09 < 10 |only if walking
talk Drum Fel##2771
turnin Call to Arms##677 |goto Arathi Highlands 74.24,33.91
step
Enter the building |goto Hillsbrad Foothills 61.49,19.43 < 7 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Elixir of Agony##509 |goto Hillsbrad Foothills 61.44,19.06
accept Elixir of Agony##513 |goto Hillsbrad Foothills 61.44,19.06
step
talk Genavie Callow##4486
turnin To Steal From Thieves##1164 |goto Undercity 63.84,49.45
step
talk William Montague##4549
|tip Collect these items from the bank.
collect Kravel's Parts##5800 |goto Undercity 65.97,44.75 |q 1112
collect Belgrom's Sealed Note##5850 |goto Undercity 65.97,44.75 |q 1146
step
Follow the path down |goto Undercity 52.84,77.63 < 7 |walk
talk Master Apothecary Faranell##2055
turnin Elixir of Agony##513 |goto Undercity 48.82,69.28
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Thousand Needles (33-34)',
  {
    image = ZGV.IMAGESDIR .. 'Thousand Needles',
    condition_suggested = function()
      return level >= 33 and level <= 32 and not completedq(1182)
    end,
    next = 'Leveling Guides\\Desolace (34-36)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 96
|only if Rogue
step
talk Islen Waterseer##5901
turnin Call of Water##96 |goto The Barrens 65.83,43.78
|only if Shaman
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 1146
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
talk Cliffwatcher Longhorn##10537
|tip He walks around this area.
accept Family Tree##5361 |goto Thousand Needles 45.65,50.80
step
Follow the path up |goto Thousand Needles 54.67,44.77 < 20 |only if walking
talk Prate Cloudseer##5905
turnin Call of Air##1531 |goto Thousand Needles 53.54,42.65
|only if Shaman
step
talk Starn##9551
|tip Restock on ammo |only if Hunter
Vendor your Trash |vendor Starn##9551 |goto Thousand Needles/0 44.90,50.68 |q 1146
step
talk Moktar Krin##4483
turnin The Swarm Grows##1146 |goto Thousand Needles 67.58,63.94
accept The Swarm Grows##1147 |goto Thousand Needles 67.58,63.94
step
talk Kravel Koalbeard##4452
|tip Grind en route to this turnin. Every enemy is used for a quest.
turnin Parts for Kravel##1112 |goto Thousand Needles 77.79,77.27
step
Watch the dialogue
talk Kravel Koalbeard##4452
accept Delivery to the Gnomes##1114 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
turnin Delivery to the Gnomes##1114 |goto Thousand Needles 78.06,77.12
step
talk Kravel Koalbeard##4452
accept The Rumormonger##1115 |goto Thousand Needles 77.79,77.27
step
Prepare for Gnomeregan
|tip It will be a good time to start Gnomeregan soon.
|tip You should run it after finishing this zone and arriving in Booty Bay, roughly 1 hour.
|tip Start looking for a group.
|confirm
|only if guideflag("Gnomerflag")
stickystart "Collect_Rocket_Car_Parts"
stickystart "Kill_Saltstone_Crystalhides"
step
kill 6 Saltstone Gazer##4150 |q 1175/3 |goto Thousand Needles 77.51,87.20
stickystop "Collect_Rocket_Car_Parts"
stickystop "Kill_Saltstone_Crystalhides"
stickystart "Kill_Silithid_Hive_Drones"
stickystart "Kill_Silithid_Invaders"
stickystart "Kill_Silithid_Searchers"
stickystart "Accept_Parts_Of_The_Swarm"
stickystart "Collect_Silithid_Talons"
step
label "Kill_Silithid_Invaders"
kill 5 Silithid Invader##4131 |q 1147/3 |goto Thousand Needles 66.32,86.18
|tip Inside the cave.
|tip They share spawn points with Silithid Hive Drones inside the cave.
|tip Prioritize killing mobs  in this cave as you may have to do several clears.
|tip Be careful when killing the Silithid Hive Drones, they will call for help.
|tip Try to pull them away from other nearby enemies.
step
label "Kill_Silithid_Searchers"
kill 5 Silithid Searcher##4130 |q 1147/1 |goto Thousand Needles 70.52,83.14
|tip These are only in the ruins outside the nearby cave. |notinsticky
You can find more around: |notinsticky
[67.24,82.00]
step
label "Kill_Silithid_Hive_Drones"
kill 5 Silithid Hive Drone##4133 |q 1147/2 |goto Thousand Needles 69.50,84.74
|tip Be careful when killing these, they will call for help. |notinsticky
|tip Try to pull them away from other nearby enemies. |notinsticky
You can find more inside the cave at [66.32,86.18]
step
Leave the cave |goto Thousand Needles 66.32,86.18 < 15 |c |q 1147
|only if _G.IsIndoors() and subzone("The Rustmaul Dig Site")
step
label "Accept_Parts_Of_The_Swarm"
Kill Silithid enemies around this area
collect Cracked Silithid Carapace##5877 |n
use the Cracked Silithid Carapace##5877
accept Parts of the Swarm##1148 |goto Thousand Needles 69.50,84.74
|only if (haveq(1147) or completedq(1147)) or (haveq(1148) or completedq(1148))
step
label "Collect_Silithid_Talons"
Kill Silithid enemies around this area
collect 5 Silithid Talon##5854 |q 1148/2 |goto Thousand Needles 69.50,84.74
|only if haveq(1148) or completedq(1148)
stickystart "Collect_Intact_Silithid_Carapaces"
stickystart "Collect_Silithid_Heart"
step
label "Collect_Silithid_Heart"
Kill Silithid enemies around this area
collect Silithid Heart##5855 |q 1148/1 |goto Thousand Needles 69.50,84.74
You can find more inside the cave at [66.32,86.18]
|only if haveq(1148) or completedq(1148)
step
label "Collect_Intact_Silithid_Carapaces"
Kill Silithid enemies around this area
collect 3 Intact Silithid Carapace##5853 |q 1148/3 |goto Thousand Needles 69.50,84.74
|only if haveq(1148) or completedq(1148)
stickystart "Collect_Hollow_Vulture_Bones"
stickystart "Collect_Salty_Scorpid_Venom"
stickystart "Collect_Hardened_Tortoise_Shells"
stickystart "Kill_Saltstone_Basilisks"
stickystart "Collect_Rocket_Car_Parts"
stickystart "Kill_Saltstone_Crystalhides"
step
label "Collect_Hollow_Vulture_Bones"
Kill Salt Flats enemies around this area
|tip They look like vultures.
|tip You can rarely find individual ones all around Shimmering Flats.
|tip However, this is the only location where there are multiple of them.
|tip Be careful, the Salt Flats Vultures can execute |only if hardcore
collect 10 Hollow Vulture Bone##5848 |q 1176/1 |goto Thousand Needles 87.45,65.73
|tip You should alternate between this area and the Scorpid camp, as they have low drop rates.
step
label "Collect_Salty_Scorpid_Venom"
Kill Scorpid enemies around this area
'|kill Scorpid Reaver##4140, Scorpid Terror##4139, Vile Sting##5937
|tip They look like scorpions.
|tip These should be your second priority, the drop rate is rather low.
collect 6 Salty Scorpid Venom##5794 |q 1104/1 |goto Thousand Needles 71.60,73.80
You can find more around: |notinsticky
[77.95,53.29]
[73.56,56.98]
[71.30,66.70]
[77.61,68.70]
step
label "Collect_Hardened_Tortoise_Shells"
Kill Sparkleshell enemies around this area
|tip They look like turtles.
collect 9 Hardened Tortoise Shell##5795 |q 1105/1 |goto Thousand Needles 82.53,55.37
You can find more around: |notinsticky
[77.41,53.72]
[73.05,56.51]
[74.82,63.33]
step
label "Kill_Saltstone_Basilisks"
kill 10 Saltstone Basilisk##4147 |q 1175/1 |goto Thousand Needles 77.73,59.22
|tip These are primarily found around the crater.
You can find more around: |notinsticky
[73.41,57.27]
[70.97,66.69]
[77.48,52.40]
step
label "Kill_Saltstone_Crystalhides"
kill 10 Saltstone Crystalhide##4151 |q 1175/2 |goto Thousand Needles 77.51,87.20
step
label "Collect_Rocket_Car_Parts"
click Rocket Car Rubble##19868+
|tip They look like various machine parts scattered on the ground.
|tip You can find them all throughout the Shimmering Flats.
collect 30 Rocket Car Parts##5798 |q 1110/1 |goto Thousand Needles 83.06,61.38
You can find more around: |notinsticky
[77.95,53.29]
[73.56,56.98]
[71.30,66.70]
[77.61,68.70]
step
talk Kravel Koalbeard##4452
turnin Rocket Car Parts##1110 |goto Thousand Needles 77.79,77.27
accept Hemet Nesingwary##5762 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
turnin Salt Flat Venom##1104 |goto Thousand Needles 78.06,77.13
step
talk Wizzle Brassbolts##4453
turnin Hardened Shells##1105 |goto Thousand Needles 78.14,77.12
step
talk Fizzle Brassbolts##4454
accept Martek the Exiled##1106 |goto Thousand Needles 78.06,77.12
|tip You must have completed "Salt Flat Venom" and "Hardened Shells" from previous guides to accept this.
step
talk Pozzik##4630
turnin Load Lightening##1176 |goto Thousand Needles 80.18,75.88
accept Goblin Sponsorship##1178 |goto Thousand Needles 80.18,75.88
step
talk Trackmaster Zherin##4629
turnin A Bump in the Road##1175 |goto Thousand Needles 81.63,77.95
step
talk Moktar Krin##4483
turnin The Swarm Grows##1147 |goto Thousand Needles 67.58,63.94
step
talk Korran##3428
turnin Parts of the Swarm##1148 |goto The Barrens 51.07,29.63
accept Parts of the Swarm##1184 |goto The Barrens 51.07,29.63
step
_Destroy This Item:_
|tip It is no longer needed.
trash Cracked Silithid Carapace##5877
step
Enter the building |goto The Barrens 62.89,36.52 < 10 |walk
talk Gazlowe##3391
|tip Upstairs inside the building.
turnin Goblin Sponsorship##1178 |goto The Barrens 62.68,36.23
accept Goblin Sponsorship##1180 |goto The Barrens 62.68,36.23
step
talk Fuzruckle##3496
|tip Deposit these items into the bank.
bank Fizzle Brassbolts' Letter##5827 |goto The Barrens 62.64,37.42 |q 1106 |future
bank Kravel's Crate##14542 |goto The Barrens 62.64,37.42 |q 5762 |future
step
talk Wharfmaster Lozgil##4631
turnin Goblin Sponsorship##1180 |goto Stranglethorn Vale 26.34,73.56
accept Goblin Sponsorship##1181 |goto Stranglethorn Vale 26.34,73.56
step
Enter the building |goto Stranglethorn Vale 28.11,74.98 < 10 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zarena Cromwind##2482 |goto Stranglethorn Vale 28.34,75.46 |q 874
|only if Warrior and itemcount(12251) == 0
step
Enter the building |goto Stranglethorn Vale 28.11,74.98 < 10 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zarena Cromwind##2482 |goto Stranglethorn Vale 28.34,75.46 |q 874
|only if Shaman and itemcount(12251) == 0
step
Follow the path up |goto Stranglethorn Vale 27.85,76.74 < 10 |only if walking
Cross the bridge |goto Stranglethorn Vale 28.15,76.52 < 10 |only if walking
Enter the building |goto Stranglethorn Vale 28.21,77.33 < 7 |walk
talk Drizzlik##2495
|tip Inside the building.
accept Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
step
Enter the building |goto Stranglethorn Vale 27.08,77.62 < 7 |walk
talk Crank Fizzlebub##2498
|tip Inside the building.
accept Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
step
talk Nixxrax Fillamug##2832
Stock up on Food and Water |vendor Nixxrax Fillamug##2832 |goto Stranglethorn Vale/0 27.05,77.19 |q 874
step
talk Kebok##737
|tip Upstairs inside the building, on the top floor.
accept Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.12
accept Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.12
step
talk Krazek##773
|tip Upstairs inside the building, on the top floor.
turnin The Rumormonger##1115 |goto Stranglethorn Vale 26.94,77.21
accept Investigate the Camp##201 |goto Stranglethorn Vale 26.95,77.21
step
talk Baron Revilgaz##2496
|tip Upstairs on the balcony of the building.
turnin Goblin Sponsorship##1181 |goto Stranglethorn Vale 27.23,76.87
accept Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
step
talk Ian Strom##1411
Train your spells. |trainer Ian Strom##1411 |goto Stranglethorn Vale/0 26.82,77.16 |q 1182
|tip He is on the second floor of the inn, in a back room.
|only if Rogue
step
talk Gringer##2858
|tip Upstairs on the balcony of the building.
fpath Booty Bay |goto Stranglethorn Vale 26.87,77.10
step
talk Innkeeper Skindle##6807
|tip Inside the building, on the bottom floor.
home Booty Bay |goto Stranglethorn Vale 27.04,77.31
|only if guideflag("Gnomerflag")
step
talk Scooty##7853
turnin Chief Engineer Scooty##2842 |goto Stranglethorn Vale 27.60,77.48
accept Gnomer-gooooone!##2843 |goto Stranglethorn Vale 27.60,77.48
|only if guideflag("Gnomerflag")
step
Watch the dialogue
Wait for Scooty to Calibrate the Goblin Transponder |q 2843/1
|only if guideflag("Gnomerflag")
step
talk Scooty##7853
turnin Gnomer-gooooone!##2843 |goto Stranglethorn Vale 27.60,77.48
|only if guideflag("Gnomerflag")
step
Run Gnomeregan
|tip Stepping on this teleporter will bring you to the dungeon.
|tip Make sure you have the "Rig Wars" quest before doing the dungeon! |only if not haveq(2841)
|tip You can use our Gnomeregan guide if you want assistance.
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Wailing Caverns quest turnin guide.
|loadguide "Dungeon Guides\\Gnomeregan (29-38)"
|confirm
|only if guideflag("Gnomerflag")
step
talk Scooty##7853
turnin A Fine Mess##2904 |goto Stranglethorn Vale 27.60,77.48
|only if completedq(2904)
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Desolace (34-36)',
  {
    image = ZGV.IMAGESDIR .. 'Desolace',
    condition_suggested = function()
      return level >= 34 and level <= 36 and not completedq(1184)
    end,
    next = 'Leveling Guides\\Stranglethorn Vale (36-37)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 1480 |future
|only if Rogue
step
talk Innkeeper Pala##6746
|tip Inside the building.
home Thunder Bluff |goto Thunder Bluff 45.81,64.71
step
talk Auctioneer Stampi##8674
|tip Buy these items from the Auction House.
|tip If you can't get them, you can skip this step. They just make some quests easier to do later, but you can still get it done without them.
collect 2 Elixir of Water Breathing##5996 |goto Thunder Bluff/0 40.43,51.77 |q 6142 |future
|only if not (Undead or Druid or Warlock or Shaman) and not selfmade
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if Priest or Mage |q 1480 |future
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
talk Kym Wildmane##3036 |only if Druid
Train your spells. |trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 1480 |future
Train your spells. |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 1480 |future
Train your spells. |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 1480 |future
Train your spells. |trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 1480 |future
Train your spells. |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 1480 |future
Train your spells. |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |only if Druid |q 1480 |future
|tip Inside the building. |only if Warrior or Hunter
|tip Inside the cave |only if Priest or Mage
step
Enter the cave |goto Thunder Bluff 29.79,29.81 < 10 |walk
talk Birgitte Cranston##5957
|tip Inside the cave.
learnspell Teleport: Thunder Bluff##3566 |goto Thunder Bluff 22.50,16.91
|only if Mage
step
Leave the cave |goto Thunder Bluff 29.79,29.81 < 10 |walk |only if Mage and subzone("The Pools of Vision")
Follow the path up |goto Stonetalon Mountains 44.63,61.81 < 20 |only if walking and not zone("Desolace")
Follow the path down |goto Stonetalon Mountains 43.53,65.33 < 20 |only if walking and not zone("Desolace")
Continue down the path |goto Stonetalon Mountains 41.16,70.69 < 30 |only if walking and not zone("Desolace")
Kill Burning Blade enemies around this area
collect Flayed Demon Skin##20310 |goto Desolace 56.06,29.54 |q 1480 |future
step
use the Flayed Demon Skin##20310
accept The Corrupter##1480 |goto Desolace 38.88,27.17
step
talk Azore Aldamort##11863
accept Sceptre of Light##5741 |goto Desolace 38.88,27.17
step
Follow the path up |goto Desolace 56.10,53.66 < 15 |only if walking
talk Nataka Longhorn##11259
turnin Family Tree##5361 |goto Desolace 55.41,55.81
step
talk Felgur Twocuts##5395
accept Khan Dez'hepah##1365 |goto Desolace 56.20,59.57
step
talk Gurda Wildmane##5412
accept Gelkis Alliance##1368 |goto Desolace 56.29,59.68
step
Cross the bridge |goto Desolace 54.70,55.06 < 10 |only if walking
talk Takata Steelblade##5641
turnin Alliance Relations##1432 |goto Desolace 52.57,54.39
accept Alliance Relations##1433 |goto Desolace 52.57,54.39
accept Befouled by Satyr##1434 |goto Desolace 52.57,54.39
step
talk Maurin Bonesplitter##4498
turnin Alliance Relations##1433 |goto Desolace 52.24,53.44
accept The Burning of Spirits##1435 |goto Desolace 52.24,53.44
turnin The Corrupter##1480 |goto Desolace 52.24,53.44
accept The Corrupter##1481 |goto Desolace 52.24,53.44
step
Enter the building |goto Desolace 73.24,42.41 < 10 |walk
kill Khan Dez'hepah##5600
|tip Inside the building.
collect Khan Dez'hepah's Head##6066 |q 1365/1 |goto Desolace 73.38,41.62
He can also spawn: |notinsticky
Inside the building at [72.90,46.66]
Inside the tent at [74.68,48.84]
stickystart "Kill_Hatefury_Rogues"
stickystart "Kill_Hatefury_Felsworns"
stickystart "Kill_Hatefury_Betrayers"
stickystart "Kill_Hatefury_Hellcallers"
step
kill Hatefury Shadowstalker##4674+
|tip They share spawn points with the others, so kill those also, if you can't find any.
collect Shadowstalker Scalp##6441 |q 1481/1 |goto Desolace 75.60,23.34
You can find more around: |notinsticky
[79.65,19.76]
[77.19,15.26]
[72.61,18.28]
step
label "Kill_Hatefury_Rogues"
kill 7 Hatefury Rogue##4670 |q 1434/1 |goto Desolace 75.60,23.34
|tip They share spawn points with the others, so kill those also, if you can't find any. |notinsticky
You can find more around: |notinsticky
[79.65,19.76]
[77.19,15.26]
[72.61,18.28]
step
label "Kill_Hatefury_Felsworns"
kill 7 Hatefury Felsworn##4672 |q 1434/2 |goto Desolace 75.60,23.34
|tip They share spawn points with the others, so kill those also, if you can't find any. |notinsticky
You can find more around: |notinsticky
[79.65,19.76]
[77.19,15.26]
[72.61,18.28]
step
label "Kill_Hatefury_Betrayers"
kill 7 Hatefury Betrayer##4673 |q 1434/3 |goto Desolace 75.60,23.34
|tip They share spawn points with the others, so kill those also, if you can't find any. |notinsticky
You can find more around: |notinsticky
[79.65,19.76]
[77.19,15.26]
[72.61,18.28]
step
label "Kill_Hatefury_Hellcallers"
kill 7 Hatefury Hellcaller##4675 |q 1434/4 |goto Desolace 75.60,23.34
|tip They share spawn points with the others, so kill those also, if you can't find any. |notinsticky
You can find more around: |notinsticky
[79.65,19.76]
[77.19,15.26]
[72.61,18.28]
step
talk Bibbly F'utzbuckle##11438
|tip He walks around this area.
accept Bone Collector##5501 |goto Desolace 62.33,38.98
step
Follow the path up |goto Desolace 55.89,53.49 < 15 |only if walking
Cross the bridge |goto Desolace 54.73,55.09 < 10 |only if walking
talk Takata Steelblade##5641
turnin Befouled by Satyr##1434 |goto Desolace 52.57,54.38
step
talk Maurin Bonesplitter##4498
turnin The Corrupter##1481 |goto Desolace 52.25,53.45
accept The Corrupter##1482 |goto Desolace 52.25,53.45
step
Cross the bridge |goto Desolace 53.07,53.73 < 10 |only if walking
talk Felgur Twocuts##5395
turnin Khan Dez'hepah##1365 |goto Desolace 56.20,59.56
accept Centaur Bounty##1366 |goto Desolace 56.20,59.56
step
talk Smeed Scrabblescrew##11596
accept Kodo Roundup##5561 |goto Desolace 60.86,61.86
stickystart "Collect_Kodo_Bones"
step
use the Kodo Kombobulator##13892
|tip Use it on Kodo enemies around this area.
|tip You can find more all around this bone graveyard area.
Tame #5# Kodos |q 5561/1 |goto Desolace 54.45,63.19
|tip You must bring them back to Smeed Scrabblescrew to tame them.
|tip Talk to the kodos after you bring them to Smeed Scrabblescrew.
Bring the Kodos back to [60.73,61.96]
step
talk Smeed Scrabblescrew##11596
turnin Kodo Roundup##5561 |goto Desolace 60.86,61.86
step
label "Collect_Kodo_Bones"
click Kodo Bones##176751
|tip They look like large white horned animal skulls on the ground around this area.
|tip If a Kodo Apparition appears and attacks you, run away until it leaves you alone, if you can't kill them. |only if not hardcore
|tip Kodo Aparitions may spawn after looting a bone and are very high level, be ready to run after each bone is looted. You should not fight them at this level. |only if hardcore
|tip If you still have trouble, try to get someone to help you.
collect 10 Kodo Bone##13703 |q 5501/1 |goto Desolace 51.31,58.04
stickystart "Reach_Friendly_Reputation_With_The_Gelkis_Clan_Centaur"
step
Kill Magram enemies around this area
|tip The ones in the outskirts of the village are a bit lower level and easier to grind.
|tip Be careful to avoid the Magram Pack Runners that walk around this area with 2 high level hyena guards.
collect 15 Centaur Ear##6067 |q 1366/1 |goto Desolace 70.30,73.77
step
label "Reach_Friendly_Reputation_With_The_Gelkis_Clan_Centaur"
Kill Magram enemies around this area |notinsticky
|tip The ones in the outskirts of the village are a bit lower level and easier to grind. |notinsticky
|tip Be careful to avoid the Magram Pack Runners that walk around this area with 2 high level hyena guards. |notinsticky
Reach Friendly Reputation with the Gelkis Clan Centaur |q 1368/1 |goto Desolace 70.30,73.77
step
Kill enemies around this area
|tip We want to be level 35 to stay ahead of the level curve soon.
ding 35 |goto Desolace 70.30,73.77
step
Follow the path up |goto Desolace 57.68,56.38 < 20 |only if walking
talk Felgur Twocuts##5395
turnin Centaur Bounty##1366 |goto Desolace 56.19,59.56
step
Follow the road |goto Desolace 48.69,75.76 < 50 |only if walking
talk Uthek the Wise##5397
turnin Gelkis Alliance##1368 |goto Desolace 36.23,79.25
accept Stealing Supplies##1370 |goto Desolace 36.23,79.25
step
Enter Shadowprey Village |goto Desolace 26.27,74.83 < 20 |only if walking
talk Roon Wildmane##11877
accept Hunting in Stranglethorn##5763 |goto Desolace 25.05,72.28
step
talk Tukk##12027
|tip Restock on arrows. |only if Hunter
Vendor your Trash |vendor Tukk##12027 |goto Desolace/0 24.94,71.85 |q 5763
step
talk Taiga Wisemane##11624
accept Hand of Iruxos##5381 |goto Desolace 25.81,68.22
step
talk Drulzegar Skraghook##12340
accept Other Fish to Fry##6143 |goto Desolace 23.32,72.87
step
talk Mai'Lahii##12031
|tip Inside the building.
accept Clam Bait##6142 |goto Desolace 22.65,71.97
step
talk Thalon##6726
fpath Shadowprey Village |goto Desolace 21.60,74.13
step
Leave Shadowprey Village |goto Desolace 27.16,75.88 < 40 |only if walking and subzone("Shadowprey Village")
Follow the path up |goto Desolace 44.13,70.19 < 20 |only if walking
Continue up the path |goto Desolace 45.92,70.92 < 20 |only if walking
talk Bibbly F'utzbuckle##11438
|tip He walks around this area.
turnin Bone Collector##5501 |goto Desolace 62.33,38.98
stickystart "Collect_Infused_Burning_Gems"
step
Follow the path |goto Desolace 56.06,29.54 < 15 |only if walking
kill Burning Blade Seer##13019
|tip At the top of the tower.
collect Sceptre of Light##15750 |q 5741/1 |goto Desolace 55.17,30.15
step
Enter the building |goto Desolace 55.35,27.54 < 10 |walk
click Hand of Iruxos Crystal##176581
|tip Inside the building.
|tip Kill all of the enemies in this room before clicking it.
|tip A level 37 enemy will appear, so be prepared to fight.
kill Demon Spirit##11876
collect Demon Box##13542 |q 5381/1 |goto Desolace 54.97,26.65
step
label "Collect_Infused_Burning_Gems"
use the Burning Gem##6436
|tip Use it on Burning Blade enemies around this area when they are low health.
collect 15 Infused Burning Gem##6435 |q 1435/1 |goto Desolace 55.20,28.90
step
Leave Thunder Axe Fortress |goto Desolace 56.06,29.53 < 15 |only if walking and subzone("Thunder Axe Fortress")
talk Azore Aldamort##11863
turnin Sceptre of Light##5741 |goto Desolace 38.88,27.17
accept Book of the Ancients##6027 |goto Desolace 38.88,27.17
step
click Rackmore's Log
|tip Jump down and follow the water.
accept Claim Rackmore's Treasure!##6161 |goto Desolace 36.07,30.41
stickystart "Collect_Softshelled_Clam_Meats"
step
Kill Drysnap enemies around this area
|tip They look like lobsters underwater around this area.
collect Rackmore's Silver Key##15878 |q 6161/1 |goto Desolace 32.78,31.37
stickystart "Collect_Rackmores_Golden_Key"
stickystart "Kill_Slitherblade_Nagas"
stickystart "Kill_Slitherblade_Sorceresses"
step
label "Collect_Softshelled_Clam_Meats"
click Giant Softshell Clam##177784+
|tip They look like large white clam shells on the ground underwater around this area.
kill Enraged Reef Crawler##12347+
|tip They look like crabs underwater around this area.
collect Soft-shelled Clam##15874 |n
use the Soft-shelled Clam##15874+
collect 10 Soft-shelled Clam Meat##15924 |q 6142/1 |goto Desolace 33.70,27.83
stickystart "Collect_Oracle_Crystal"
stickystart "Kill_Slitherblade_Myrmidons"
step
label "Collect_Rackmores_Golden_Key"
Kill Slitherblade enemies around this area
|tip Underwater.
|tip Watch your breath meter at all times.	|only if hardcore |notinsticky
collect Rackmore's Golden Key##15881 |q 6161/2 |goto Desolace 35.20,24.86
step
click Rackmore's Chest##177786
|tip On the ground at the base of the tree.
turnin Claim Rackmore's Treasure!##6161 |goto Desolace 30.00,8.70
step
click Serpent Statue
|tip A level 38 enemy will appear, so be prepared to fight.
kill Lord Kragaru##12369
collect Book of the Ancients##15803 |q 6027/1 |goto Desolace 28.19,6.62
step
label "Collect_Oracle_Crystal"
kill Slitherblade Oracle##4718+
|tip Underwater and on the islands around this area. |notinsticky
|tip They share spawn points with the other nagas, so kill them too, if you can't find any Oracles. |notinsticky
collect Oracle Crystal##6442 |q 1482/1 |goto Desolace 28.19,6.43
You can find more around: |notinsticky
[27.89,14.09]
[33.97,10.16]
[31.74,15.64]
[32.93,21.73]
[39.90,15.11]
step
label "Kill_Slitherblade_Myrmidons"
kill 7 Slitherblade Myrmidon##4714 |q 6143/1 |goto Desolace 32.12,18.59
|tip Underwater and on the islands around this area. |notinsticky
|tip They share spawns with other types of naga in the area. |notinsticky
step
label "Kill_Slitherblade_Nagas"
kill 7 Slitherblade Naga##4711 |q 6143/2 |goto Desolace 35.20,24.86
|tip Underwater and on the islands around this area. |notinsticky
|tip They share spawns with other types of naga in the area. |notinsticky
step
label "Kill_Slitherblade_Sorceresses"
kill 5 Slitherblade Sorceress##4712 |q 6143/3 |goto Desolace 35.20,24.86
|tip Underwater and on the islands around this area. |notinsticky
|tip They share spawns with other types of naga in the area. |notinsticky
step
Follow the path up |goto Desolace 40.91,29.00 < 20 |only if walking
talk Azore Aldamort##11863
turnin Book of the Ancients##6027 |goto Desolace 38.89,27.17
step
Follow the path up |goto Desolace 55.89,53.49 < 15 |only if walking
Cross the bridge |goto Desolace 54.72,55.08 < 10 |only if walking
talk Maurin Bonesplitter##4498
turnin The Burning of Spirits##1435 |goto Desolace 52.24,53.44
turnin The Corrupter##1482 |goto Desolace 52.24,53.44
step
talk Harnor##8152
Vendor your Trash |vendor Harnor##8152 |goto Desolace/0 51.22,53.27 |q 6143
step
Watch the dialogue
talk Maurin Bonesplitter##4498
accept The Corrupter##1484 |goto Desolace 52.25,53.44
step
talk Takata Steelblade##5641
turnin The Corrupter##1484 |goto Desolace 52.57,54.38
accept Alliance Relations##1436 |goto Desolace 52.57,54.38
stickystart "Reach_Friendly_Reputation_With_The_Gelkis_Clan_Centaur_1370"
step
click Sack of Meat##22245+
|tip They look like tan leather bags on the ground near the buildings around this area.
|tip Not all of the tan bags you see will be clickable.
collect 6 Crudely Dried Meat##6069 |q 1370/1 |goto Desolace 70.90,75.47
step
label "Reach_Friendly_Reputation_With_The_Gelkis_Clan_Centaur_1370"
Kill Magram enemies around this area
|tip The ones in the outskirts of the village are a bit lower level and easier to grind. |notinsticky
|tip Be careful to avoid the Magram Pack Runners that walk around this area with 2 high level hyena guards. |notinsticky
Reach Friendly Reputation with the Gelkis Clan Centaur |q 1370/2 |goto Desolace 70.30,73.77
|tip You should already be Friendly from completing a quest earlier in the guide.
step
Kill enemies around this area
|tip Getting this far into level 35 will allow you to reach level 36 when you turn in quests soon.
|tip You will be returning to Thunder Bluff and Orgrimmar soon, so it will be a good time to get your level 36 abilities.
ding 35,57600 |goto Desolace 70.30,73.77
step
Follow the road |goto Desolace 48.69,75.76 < 50 |only if walking
talk Uthek the Wise##5397
turnin Stealing Supplies##1370 |goto Desolace 36.23,79.25
accept Ongeku##1373 |goto Desolace 36.23,79.25
step
Enter Shadowprey Village |goto Desolace 26.62,75.41 < 30 |only if walking and not subzone("Shadowprey Village")
talk Tukk##12027
Vendor your Trash |vendor Tukk##12027 |goto Desolace/0 24.94,71.85 |q 5381
step
Enter Shadowprey Village |goto Desolace 26.62,75.41 < 30 |only if walking and not subzone("Shadowprey Village")
talk Taiga Wisemane##11624
turnin Hand of Iruxos##5381 |goto Desolace 25.81,68.22
step
talk Aboda##11105
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Claw 5".
Click Here to Continue |confirm |goto Desolace/0 24.88,68.68 |q 6143
|only if Hunter
step
_NOTE:_
Tame a Scorpashi Lasher
|tip Use your "Tame Beast" ability on a Scorpashi Lasher..
|tip They look like scorpions around this area.
Learn the "Claw 5" Pet Ability
|tip Kill enemies on the way back to Shadowprey Village until your chat says you learned "Claw 5".
|tip You will teach "Claw 5" to your permanent pet soon.
Click Here to Continue |confirm |goto Desolace/0 41.31,70.89 |q 6143
|only if Hunter
step
talk Aboda##11105
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Claw 5" to your permanent pet.
Click Here to Continue |confirm |goto Desolace/0 24.88,68.68 |q 6143
|only if Hunter
step
talk Drulzegar Skraghook##12340
turnin Other Fish to Fry##6143 |goto Desolace 23.32,72.87
step
talk Mai'Lahii##12031
|tip Inside the building.
turnin Clam Bait##6142 |goto Desolace 22.64,71.97
step
Enter the building |goto Orgrimmar 22.28,53.78 < 10 |walk
talk Keldran##5640
|tip He walks around inside the building.
turnin Alliance Relations##1436 |goto Orgrimmar 22.56,52.63
step
Enter the building |goto Orgrimmar 75.22,24.61 < 5 |walk
talk Nogg##3412
|tip Inside the building.
turnin Rig Wars##2841 |goto Orgrimmar 76.00,25.42
|only if guideflag("Gnomerflag")
step
Enter the building |goto Orgrimmar 53.68,64.58 < 10 |walk
talk Auctioneer Thathung##8673
|tip Inside the building.
|tip Buy these items from the auction house.
|tip If they're not available, or you can't afford them, skip this step.
|tip You will be able to kill enemies soon to get them, but it will be slower.
collect 8 Liferoot##3357 |q 1712/1 |goto Orgrimmar 55.90,62.71
|only if Warrior and not selfmade
step
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 1184
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 1184
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 1184
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 1184
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 1184
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 1184
|tip Inside the building. |only if Warrior or Mage or Priest
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1184
|only if Warlock
step
talk Belgrom Rockmaul##4485
turnin Parts of the Swarm##1184 |goto Orgrimmar 75.23,34.24
step
Enter the building |goto Orgrimmar 49.86,70.45 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Collect these items from the bank.
collect Kravel's Crate##14542 |goto Orgrimmar 49.58,69.12 |q 5762
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stranglethorn Vale (36-37)',
  {
    image = ZGV.IMAGESDIR .. 'Stranglethorn Vale',
    condition_suggested = function()
      return level >= 36 and level <= 37 and not completedq(575)
    end,
    next = 'Leveling Guides\\Dustwallow Marsh (37-38)',
    hardcore = true,
  },
  [[
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48
|only if Rogue
step
Enter the building |goto Orgrimmar 54.04,68.86 < 7 |walk
talk Innkeeper Gryshka##6929
|tip Inside the building.
home Orgrimmar |goto Orgrimmar 54.09,68.42
Restock on Food and Water |vendor Innkeeper Gryshka##6929 |goto Orgrimmar 54.09,68.42
step
talk Zudd##3624
Train your pet in Grom'gol. |trainer Zudd##3624 |goto Stranglethorn Vale/0 31.13,28.93 |q 5762
|only if Hunter
step
talk Kragg##1404
Train your spells. |trainer Kragg##1404 |goto Stranglethorn Vale/0 31.24,28.68 |q 5762
|only if Hunter
step
talk Commander Aggro'gosh##2464
|tip He walks around this area.
accept The Defense of Grom'gol##568 |goto Stranglethorn Vale 32.17,28.90
step
talk Thysta##1387
fpath Grom'gol |goto Stranglethorn Vale 32.54,29.35
step
talk Nimboya##2497
accept Hunt for Yenniku##581 |goto Stranglethorn Vale 32.16,27.73
step
talk Kin'weelay##2519
accept Bloody Bone Necklaces##596 |goto Stranglethorn Vale 32.27,27.71
accept The Vile Reef##629 |goto Stranglethorn Vale 32.27,27.71
step
Locate the Hunters' Camp |q 201/1 |goto Stranglethorn Vale 35.55,10.55
step
talk Hemet Nesingwary##715
turnin Hemet Nesingwary##5762 |goto Stranglethorn Vale 35.66,10.81
turnin Hunting in Stranglethorn##5763 |goto Stranglethorn Vale 35.66,10.81
step
talk Barnil Stonepot##716
accept Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.53
step
talk Hemet Nesingwary##715
turnin Welcome to the Jungle##583 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##194 |goto Stranglethorn Vale 35.66,10.81
step
talk Ajeck Rouack##717
accept Tiger Mastery##185 |goto Stranglethorn Vale 35.61,10.62
step
talk Sir S. J. Erlgadin##718
accept Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
stickystart "Collect_Large_Crocolisk_Skins"
step
kill 10 Young Panther##683 |q 190/1 |goto Stranglethorn Vale 41.70,12.28
You can find more around: |notinsticky
[42.40,10.56]
[41.06,8.26]
stickystop "Collect_Large_Crocolisk_Skins"
step
kill Kurzen Medicine Man##940+
|tip They share spawn points with the other enemies around this area, so kill those too, if you can't find any.
collect 8 Liferoot##3357 |q 1712/1 |goto Stranglethorn Vale 44.34,10.02
|tip You need these for an important class quest soon.
|tip Be careful not to accidentally sell these to a vendor.
|only if Warrior
stickystart "Collect_Large_Crocolisk_Skins"
step
kill 10 Young Stranglethorn Tiger##681 |q 185/1 |goto Stranglethorn Vale 35.23,12.83
You can find more around: |notinsticky
[Stranglethorn Vale 33.42,11.47]
[Stranglethorn Vale 31.79,9.19]
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##190 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##191 |goto Stranglethorn Vale 35.55,10.55
step
talk Ajeck Rouack##717
turnin Tiger Mastery##185 |goto Stranglethorn Vale 35.61,10.62
accept Tiger Mastery##186 |goto Stranglethorn Vale 35.61,10.62
stickystop "Collect_Large_Crocolisk_Skins"
stickystart "Kill_Panthers"
stickystart "Kill_Stranglethorn_Tigers"
step
Follow the path up |goto Stranglethorn Vale 30.79,8.27 < 20 |only if walking
kill 10 Stranglethorn Raptor##685 |q 194/1 |goto Stranglethorn Vale 26.04,16.19
step
label "Kill_Panthers"
kill 10 Panther##736 |q 191/1 |goto Stranglethorn Vale 30.02,10.56
You can find more around: |notinsticky
[28.35,12.13]
[28.55,16.11]
[30.33,15.29]
step
label "Kill_Stranglethorn_Tigers"
kill 10 Stranglethorn Tiger##682 |q 186/1 |goto Stranglethorn Vale 30.02,10.56
You can find more around: |notinsticky
[28.35,12.13]
[28.55,16.11]
[30.33,15.29]
step
_NOTE:_
Tame a Stranglethorn Tiger
|tip This is optional if you want the "Dash" ability.
|tip If you do not want to manage your pet's Dash, skip this step.
|tip It will waste your pet's energy and lower your DPS if it is not properly managed.
|tip Use your "Tame Beast" ability on a Stranglethorn Tiger.
|tip They look like orange tigers around this area.
|tip You can abandon your pet right before taming a Stranglethorn Tiger.
|tip This will be your new permanent pet.
|tip You will gain the "Dash" pet ability.
Train Your Pet
|tip Be sure to train your new pet with the highest ranks of Growl, Claw and Bite that you currently have.
Click Here to Continue |confirm |goto Stranglethorn Vale 29.44,9.80 |q 186
|only if Hunter
step
label "Collect_Large_Crocolisk_Skins"
kill River Crocolisk##1150+
|tip Along the water around this area.
|tip Go out of your way to kill these enemies, the drop rate can be very bad.
collect 2 Large River Crocolisk Skin##4053 |q 575/1 |goto Stranglethorn Vale 33.45,8.28
You can find more around: |notinsticky
[37.63,9.93]
[40.24,13.68]
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##191 |goto Stranglethorn Vale 35.55,10.55
accept Panther Mastery##192 |goto Stranglethorn Vale 35.55,10.55
step
talk Ajeck Rouack##717
turnin Tiger Mastery##186 |goto Stranglethorn Vale 35.61,10.62
accept Tiger Mastery##187 |goto Stranglethorn Vale 35.61,10.62
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##194 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##195 |goto Stranglethorn Vale 35.66,10.81
stickystart "Kill_Elder_Stranglethorn_Tigers"
stickystart "Collect_Bloodscalp_Ears"
stickystart "Collect_Bloody_Bone_Necklaces"
step
Kill Bloodscalp enemies around this area
|tip You can find a few more along the path in the outskirts circling this camp.
collect 9 Bloodscalp Tusk##3901 |q 581/1 |goto Stranglethorn Vale 33.85,15.53
You can find more around: |notinsticky
[31.68,12.65]
[29.36,19.97]
step
label "Kill_Elder_Stranglethorn_Tigers"
kill 10 Elder Stranglethorn Tiger##1085 |q 187/1 |goto Stranglethorn Vale 33.27,18.77
You can find more around [31.47,16.21]
stickystop "Collect_Bloodscalp_Ears"
stickystop "Collect_Bloody_Bone_Necklaces"
stickystart "Kill_Lashtail_Raptors"
step
kill 10 Lashtail Raptor##686 |q 195/1 |goto Stranglethorn Vale 30.50,23.96
You can find more around: |notinsticky
[32.63,23.93]
[35.83,25.97]
[38.79,25.47]
[38.31,20.32]
step
label "Kill_Lashtail_Raptors"
kill 15 Lashtail Raptor##686 |q 568/1 |goto Stranglethorn Vale 30.50,23.96
You can find more around: |notinsticky
[32.63,23.93]
[35.83,25.97]
[38.79,25.47]
[38.31,20.32]
step
talk Nimboya##2497
turnin Hunt for Yenniku##581 |goto Stranglethorn Vale 32.16,27.72
accept Headhunting##582 |goto Stranglethorn Vale 32.16,27.72
step
talk Commander Aggro'gosh##2464
|tip He walks around this area.
turnin The Defense of Grom'gol##568 |goto Stranglethorn Vale 32.17,28.91
accept The Defense of Grom'gol##569 |goto Stranglethorn Vale 32.17,28.91
step
talk Uthok##1149
|tip Restock on arrows. |only if Hunter
Vendor your Trash |vendor Uthok##1149 |goto Stranglethorn Vale/0 31.55,27.97 |q 629
step
click Gri'lek the Wanderer##58
|tip It is a tablet underwater.
|tip There are two of them, go for the one on the outside of the wall to avoid murlocs.
|tip Be careful to avoid the elite murlocs nearby.
|tip Watch your breath meter at all times.	|only if hardcore
collect Tablet Shard##4094 |q 629/1 |goto Stranglethorn Vale 24.75,22.84
step
kill Crystal Spine Basilisk##689+
collect 10 Singing Crystal Shard##3918 |q 605/1 |goto Stranglethorn Vale 27.06,18.51
You can find more around [25.11,17.42]
stickystart "Collect_Bloodscalp_Ears"
stickystart "Collect_Bloody_Bone_Necklaces"
stickystart "Collect_Bloodscalp_Tusks_Warrior"
step
kill Bloodscalp Headhunter##671+
collect 20 Shrunken Head##1532 |q 582/1 |goto Stranglethorn Vale 20.29,12.82
You can find more: |notinsticky
Up the path that starts at [21.42,10.11]
Up the path that starts at [23.81,10.66]
step
label "Collect_Bloodscalp_Ears"
Kill Bloodscalp enemies around this area |notinsticky
collect 15 Bloodscalp Ear##1519 |q 189/1 |goto Stranglethorn Vale 20.29,12.82
You can find more: |notinsticky
Up the path that starts at [21.42,10.11]
Up the path that starts at [23.81,10.66]
step
label "Collect_Bloody_Bone_Necklaces"
Kill Bloodscalp enemies around this area |notinsticky
collect 25 Bloody Bone Necklace##3915 |q 596/1 |goto Stranglethorn Vale 20.29,12.82
You can find more: |notinsticky
Up the path that starts at [21.42,10.11]
Up the path that starts at [23.81,10.66]
step
label "Collect_Bloodscalp_Tusks_Warrior"
Kill Bloodscalp enemies around this area
collect 30 Bloodscalp Tusk##3901 |q 1712/2 |goto Stranglethorn Vale 20.29,12.82
You can find more: |notinsticky
Up the path that starts at [Stranglethorn Vale 21.42,10.11]
Up the path that starts at [Stranglethorn Vale 23.81,10.66]
|only if Warrior
step
talk Nimboya##2497
turnin Headhunting##582 |goto Stranglethorn Vale 32.16,27.73
step
_Destroy These Items:_
|tip They are no longer needed.
trash Shrunken Head##1532 |goto Stranglethorn Vale 32.27,27.70
step
talk Kin'weelay##2519
turnin Bloody Bone Necklaces##596 |goto Stranglethorn Vale 32.27,27.70
turnin The Vile Reef##629 |goto Stranglethorn Vale 32.27,27.70
step
talk Far Seer Mok'thardin##2465
accept Mok'thardin's Enchantment##570 |goto Stranglethorn Vale 32.12,29.24
step
talk Kebok##737
|tip Upstairs inside the building, on the top floor.
turnin Bloodscalp Ears##189 |goto Stranglethorn Vale 27.00,77.13
step
talk Krazek##773
|tip Upstairs inside the building, on the top floor.
turnin Investigate the Camp##201 |goto Stranglethorn Vale 26.94,77.21
step
Cross the bridge |goto Stranglethorn Vale 28.15,76.52 < 10 |only if walking
Enter the building |goto Stranglethorn Vale 28.21,77.33 < 7 |walk
talk Drizzlik##2495
|tip Inside the building.
turnin Supply and Demand##575 |goto Stranglethorn Vale 28.29,77.59
accept Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
stickystart "Kill_Moshogg_Witch_Doctors"
stickystart "Collect_Snapjaw_Skin"
step
kill 10 Mosh'Ogg Brute##1142 |q 569/1 |goto Stranglethorn Vale 37.40,31.30
step
label "Kill_Moshogg_Witch_Doctors"
kill 5 Mosh'Ogg Witch Doctor##1144 |q 569/2 |goto Stranglethorn Vale 37.40,31.30
step
label "Collect_Snapjaw_Skin"
kill Snapjaw Crocolisk##1152
|tip There will never be enough ogres to finish the quest without waiting for respawns.
|tip Rotate between killing crocolisks and ogres to be efficient between respawns.
collect 5 Snapjaw Crocolisk Skin##4104 |q 577 |goto Stranglethorn Vale, 38.20,30.60
You can find more here: |notinsticky
[40.21,27.21]
[41.81,21.61]
stickystart "Collect_Shadowmaw_Claws"
stickystart "Kill_Shadowmaw_Panthers"
step
kill Stranglethorn Tigress##772+
|tip They share spawn points with Shadowmaw Panthers, so kill those too, to get more Stranglethorn Tigresses to spawn.
|tip The Shadowmaw Panthers are stealthed around this area.
|tip Avoid the level 43 elite white tiger, King Bangladesh, on top of the hill around the southwestern waypoints.
|tip If you go to the northeastern areas, avoid the level 40 elite non-stealthed black panther, Bhag'thera.
collect Pristine Tigress Fang##3839|q 570/2 |goto Stranglethorn Vale 36.30,37.18
You can find more around: |notinsticky
[39.77,33.70]
[46.42,27.34]
[49.23,22.66]
step
label "Collect_Shadowmaw_Claws"
kill Shadowmaw Panther##684+
|tip They are stealthed around this area, typically near trees. |notinsticky
|tip They share spawn points with Stranglethorn Tigresses, so kill those too, to get more Shadowmaw Panthers to spawn. |notinsticky
|tip Avoid the level 43 elite white tiger, King Bangladesh, on top of the hill around the southwestern waypoints. |notinsticky
|tip If you go to the northeastern areas, avoid the level 40 elite non-stealthed black panther, Bhag'thera. |notinsticky
collect 8 Shadowmaw Claw##3838 |q 570/1 |goto Stranglethorn Vale 36.30,37.18
You can find more around: |notinsticky
[39.77,33.70]
[46.42,27.34]
[49.23,22.66]
step
label "Kill_Shadowmaw_Panthers"
kill 10 Shadowmaw Panther##684 |q 192/1 |goto Stranglethorn Vale 36.30,37.18
|tip They are stealthed around this area. |notinsticky
|tip They share spawn points with Stranglethorn Tigresses, so kill those too, if you can't find any. |notinsticky
|tip Be careful to avoid the level 40 elite non-stealthed black panther, Bhag'thera, if you see him. |notinsticky
|tip Avoid the level 43 elite white tiger, King Bangalash, on top of the hill around the southwestern waypoints. |notinsticky
You can find more around: |notinsticky
[39.77,33.70]
[46.42,27.34]
[49.23,22.66]
stickystart "Collect_Tumbled_Crystals"
step
Follow the path up |goto Stranglethorn Vale 42.25,18.10 < 15 |only if walking
kill Foreman Cozzle##4723
|tip Inside the building at the top of the platform.
collect Cozzle's Key##5851 |goto Stranglethorn Vale 42.65,18.35 |q 1182
step
Enter the building |goto Stranglethorn Vale 43.45,20.36 < 10 |walk
click Cozzle's Footlocker##20691
|tip Inside the building.
collect Fuel Regulator Blueprints##5852 |q 1182/1 |goto Stranglethorn Vale 43.34,20.34
step
label "Collect_Tumbled_Crystals"
kill Venture Co. Geologist##1096+
collect 8 Tumbled Crystal##4106 |q 213/1 |goto Stranglethorn Vale 44.63,21.45
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##192 |goto Stranglethorn Vale 35.56,10.55
accept Panther Mastery##193 |goto Stranglethorn Vale 35.56,10.55
step
talk Ajeck Rouack##717
turnin Tiger Mastery##187 |goto Stranglethorn Vale 35.62,10.62
accept Tiger Mastery##188 |goto Stranglethorn Vale 35.62,10.62
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##195 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
step
kill Sin'Dall##729
|tip He looks like an orange tiger that walks around this area.
|tip He's usually on top of this hill, though.
collect Paw of Sin'Dall##3879 |q 188/1 |goto Stranglethorn Vale 32.21,17.39
step
talk Ajeck Rouack##717
turnin Tiger Mastery##188 |goto Stranglethorn Vale 35.62,10.62
step
talk Nimboya##2497
accept Trollbane##638 |goto Stranglethorn Vale 32.16,27.73
step
talk Commander Aggro'gosh##2464
|tip He walks around this area.
turnin The Defense of Grom'gol##569 |goto Stranglethorn Vale 32.17,28.90
step
talk Far Seer Mok'thardin##2465
turnin Mok'thardin's Enchantment##570 |goto Stranglethorn Vale 32.12,29.24
step
talk Baron Revilgaz##2496
|tip Upstairs on the balcony of the building.
turnin Goblin Sponsorship##1182 |goto Stranglethorn Vale 27.23,76.87
accept Goblin Sponsorship##1183 |goto Stranglethorn Vale 27.23,76.87
step
talk Kebok##737
|tip Upstairs inside the building, on the top floor.
turnin Hostile Takeover##213 |goto Stranglethorn Vale 27.00,77.13
accept Skullsplitter Tusks##209 |goto Stranglethorn Vale 27.00,77.13
step
talk Krazek##773
|tip Upstairs inside the building, on the top floor.
accept Dream Dust in the Swamp##1116 |goto Stranglethorn Vale 26.94,77.21
step
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
turnin Singing Blue Shards##605 |goto Stranglethorn Vale 27.12,77.21
accept Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
step
Cross the bridge |goto Stranglethorn Vale 28.15,76.52 < 10 |only if walking
Enter the building |goto Stranglethorn Vale 28.21,77.33 < 7 |walk
talk Drizzlik##2495
|tip Inside the building.
turnin Some Assembly Required##577 |goto Stranglethorn Vale 28.29,77.59
accept Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
step
Enter the building |goto Stranglethorn Vale 28.11,74.98 < 10 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zarena Cromwind##2482 |goto Stranglethorn Vale 28.34,75.46 |q 572 |future
|only if Warrior and itemcount(12251) == 0
step
Enter the building |goto Stranglethorn Vale 28.11,74.98 < 10 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zarena Cromwind##2482 |goto Stranglethorn Vale 28.34,75.46 |q 572 |future
|only if Shaman and itemcount(12251) == 0
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Dustwallow Marsh (37-38)',
  {
    image = ZGV.IMAGESDIR .. 'Dustwallow Marsh',
    condition_suggested = function()
      return level >= 37 and level <= 38 and not completedq(668)
    end,
    next = 'Leveling Guides\\Alterac Mountains (38-38)',
    hardcore = true,
  },
  [[
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48
|only if Rogue
step
Enter the building |goto Orgrimmar 48.19,79.69 < 10 |walk
talk Shimra##5817
|tip Inside the building.
buy 3 Soothing Spices##3713 |goto Orgrimmar 47.91,80.35 |q 1218 |future
|tip Make sure to not accidentally sell these to a vendor.
|tip You will need them for a quest soon.
step
Enter the building |goto Orgrimmar 49.86,70.42 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Fuel Regulator Blueprints##5852 |goto Orgrimmar 49.58,69.12 |q 1183 |future
step
Optional Route Change
|tip You can opt to do Scarlet Monastery around level 38 instead of grinding.
|tip This is highly recommended due to weapon upgrades from a quest. |only if Rogue or Warrior
|tip We will do Library, Armory, and Cathedral.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Scarlet Monastery, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Scarlet Monastery later |confirm SMflag
Click Here if you'd prefer to grind |confirm
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 1218 |future
|only if Warlock
step
click Hoofprints##21015
accept Suspicious Hoofprints##1268 |goto Dustwallow Marsh 29.70,47.63
|only if hardcore
step
click Theramore Guard Badge##21042
|tip It looks like a tiny metal object on the floor.
accept Lieutenant Paval Reethe##1269 |goto Dustwallow Marsh 29.83,48.24
|only if hardcore
step
click Black Shield##20992
accept The Black Shield##1251 |goto Dustwallow Marsh 29.63,48.59
|only if hardcore
step
talk Mudcrush Durtfeet##4503
accept Hungry!##1177 |goto Dustwallow Marsh 35.15,38.25
step
talk Nazeer Bloodpike##4791
accept Theramore Spies##1201 |goto Dustwallow Marsh 35.21,30.66
step
click Hoofprints##21015
accept Suspicious Hoofprints##1268 |goto Dustwallow Marsh 29.70,47.63
|only if not hardcore
step
click Theramore Guard Badge##21042
|tip It looks like a tiny metal object on the floor.
accept Lieutenant Paval Reethe##1269 |goto Dustwallow Marsh 29.83,48.24
|only if not hardcore
step
click Black Shield##20992
accept The Black Shield##1251 |goto Dustwallow Marsh 29.63,48.59
|only if not hardcore
step
talk Krog##4926
turnin Suspicious Hoofprints##1268 |goto Dustwallow Marsh 36.42,31.88
turnin Lieutenant Paval Reethe##1269 |goto Dustwallow Marsh 36.42,31.88
turnin The Black Shield##1251 |goto Dustwallow Marsh 36.42,31.88
accept The Black Shield##1321 |goto Dustwallow Marsh 36.42,31.88
step
talk Do'gol##5087
turnin The Black Shield##1321 |goto Dustwallow Marsh 36.53,30.80
accept The Black Shield##1322 |goto Dustwallow Marsh 36.53,30.80
step
talk Shardi##11899
fpath Brackenwall Village |goto Dustwallow Marsh 35.56,31.88
|only if hardcore
stickystart "Collect_Acidic_Venom_Sacs"
step
map Dustwallow Marsh
path follow strict; loop on; ants straight; dist 15
path	38.02,33.98	36.60,35.60	37.00,38.60	38.02,37.38	40.66,35.33
path	40.57,33.42	41.74,26.59	42.12,26.04	41.62,25.20	40.93,25.48
path	39.66,23.86	38.95,21.65	38.93,22.40	38.05,23.54	38.03,25.57
path	37.60,27.00	39.00,26.40
kill 9 Theramore Infiltrator##4834 |q 1201/1
|tip They walk around stealthed, spread out in small areas.
|tip This path will lead you to many locations to check for them.
step
talk "Stinky" Ignatz##4880
|tip Kill the raptors near him before accepting the quest.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait for him to respawn.
accept Stinky's Escape##1270 |goto Dustwallow Marsh 46.88,17.52 |noautoaccept
step
Watch the dialogue
|tip Follow and protect "Stinky" Ignatz as he walks.
|tip He eventually walks to this location.
Help Stinky Find Bogbean Leaves |q 1270/1 |goto Dustwallow Marsh 48.86,24.65
step
talk "Swamp Eye" Jarl##4792
accept Soothing Spices##1218 |goto Dustwallow Marsh 55.43,26.27
|tip You will need the Soothing Spices you purchased in Orgrimmar earlier in the guide.
step
talk "Swamp Eye" Jarl##4792
turnin Soothing Spices##1218 |goto Dustwallow Marsh 55.43,26.27
accept Jarl Needs Eyes##1206 |goto Dustwallow Marsh 55.43,26.27
step
click Loose Dirt##20985
accept The Lost Report##1238 |goto Dustwallow Marsh 55.44,25.93
step
Kill Mirefin enemies around this area
collect 12 Mirefin Head##5847 |q 1177/1 |goto Dustwallow Marsh 57.20,22.33
You can find more around:
[57.50,16.51]
[54.42,15.92]
step
Follow the path up |goto Dustwallow Marsh 57.90,18.51 < 20 |only if walking and subzone("Dreadmurk Shore")
Kill Darkmist enemies around this area
|tip They look like green spiders.
|tip Inside and outside the mine.
collect 40 Unpopped Darkmist Eye##5884 |q 1206/1 |goto Dustwallow Marsh 33.22,22.76
step
label "Collect_Acidic_Venom_Sacs"
Kill Darkfang enemies around this area
|tip They look like orange spiders.
|tip They are stealthed around the area and share spawns with Bloodfen Raptors.
|tip Kill Bloodfen Raptors if you can't find any.
|tip They can be pretty spread out.
collect 6 Acidic Venom Sac##5959 |q 1322/1 |goto Dustwallow Marsh 37.80,26.20
You can find more around: |notinsticky
[41.39,25.47]
[39.64,22.33]
[38.94,19.25]
[41.60,18.87]
[39.43,14.84]
[43.23,21.94]
step
Prepare for Scarlet Monastery
|tip It will be a good time to start Scarlet Monastery soon.
|tip We will do Library, Armory and Cathedral.
|tip You should run it after turning in the quests from this guide, roughly 30 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("SMflag")
step
talk Nazeer Bloodpike##4791
turnin Theramore Spies##1201 |goto Dustwallow Marsh 35.21,30.66
turnin The Lost Report##1238 |goto Dustwallow Marsh 35.21,30.66
step
talk Do'gol##5087
turnin The Black Shield##1322 |goto Dustwallow Marsh 36.53,30.80
accept The Black Shield##1323 |goto Dustwallow Marsh 36.53,30.80
step
talk Krog##4926
turnin The Black Shield##1323 |goto Dustwallow Marsh 36.42,31.88
step
talk Mudcrush Durtfeet##4503
turnin Hungry!##1177 |goto Dustwallow Marsh 35.15,38.25
step
Kill enemies around this area
|tip Getting this far into level 37 will allow you to reach level 38 when you turn in quests soon.
|tip You will be hearthing back to Orgrimmar soon, so it will be a good time to get your level 38 abilities.
|tip You will also need to be level 38 to be able to accept some quests soon.
|tip You should already be this far into level 37, but this is just in case you're not.
ding 37,68000 |goto Dustwallow Marsh 39.96,22.73
|only if not guideflag("SMflag")
step
talk "Swamp Eye" Jarl##4792
turnin Jarl Needs Eyes##1206 |goto Dustwallow Marsh 55.43,26.27
step
_Destroy These Items:_
|tip They are no longer needed.
trash Unpopped Darkmist Eye##5884 |goto Dustwallow Marsh 55.44,25.93
step
click Loose Dirt##20985
accept The Severed Head##1239 |goto Dustwallow Marsh 55.44,25.93
step
talk Nazeer Bloodpike##4791
turnin The Severed Head##1239 |goto Dustwallow Marsh 35.21,30.66
accept The Troll Witchdoctor##1240 |goto Dustwallow Marsh 35.21,30.66
step
Enter the building |goto Tanaris 52.21,28.58 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Defiant Orc Head##5918 |goto Tanaris 52.30,28.91 |q 1240 |future
|tip Collect these items from the bank.
collect Fuel Regulator Blueprints##5852 |goto Tanaris 52.30,28.91 |q 1183
step
talk Pozzik##4630
turnin Goblin Sponsorship##1183 |goto Thousand Needles 80.18,75.88
accept The Eighteenth Pilot##1186 |goto Thousand Needles 80.18,75.88
step
talk Razzeric##4706
turnin The Eighteenth Pilot##1186 |goto Thousand Needles 80.33,76.09
accept Razzeric's Tweaking##1187 |goto Thousand Needles 80.33,76.09
step
talk Sage Truthseeker##3978
|tip Inside the building.
accept Compendium of the Fallen##1049 |goto Thunder Bluff 34.41,46.90
|only if guideflag("SMflag") and not Undead
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 1187
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
Follow the path down |goto Undercity 52.86,77.57 < 7 |walk
talk Apothecary Zinge##5204
accept Errand for Apothecary Zinge##232 |goto Undercity 50.13,67.99
step
Follow the path up |goto Undercity 47.90,76.49 < 7 |walk
talk Alessandro Luca##7683
turnin Errand for Apothecary Zinge##232 |goto Undercity 58.62,54.67
accept Errand for Apothecary Zinge##238 |goto Undercity 58.62,54.67
step
Follow the path down |goto Undercity 52.86,77.57 < 7 |walk
talk Apothecary Zinge##5204
turnin Errand for Apothecary Zinge##238 |goto Undercity 50.13,67.99
accept Into the Field##243 |goto Undercity 50.13,67.99
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
accept Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
|only if guideflag("SMflag")
step
talk Abigail Sawyer##4604
buy Massive Longbow##11307 |n
|tip If you can afford it.
|tip It's a limited supply item, so it may not be for sale.
|tip You can't use it until level 42, but it's good to have waiting to use, and you can only buy it in major cities.
|tip We will check vendors for it along the way, if it's not here right now.
|tip If you have better, skip this step.
Visit the Vendor |vendor Abigail Sawyer##4604 |goto Undercity 54.70,38.76 |q 243
|only if Hunter and itemcount(11307) == 0
step
talk Auctioneer Epitwee##8721
|tip Buy these items from the Auction House.
|tip If you can't get them, you can skip this step. They just make some quests easier to do later, but you can still get it done without them.
|tip There are more auction steps after this one, skip this step after completeing it and don't run to the mailbox yet.
collect 2 Elixir of Water Breathing##5996 |goto Undercity 64.42,52.41 |q 668 |future
|only if not (Undead or Druid or Warlock or Shaman) and not selfmade
step
talk Auctioneer Epitwee##8721
|tip Buy these items from the Auction House.
|tip Each item is for an individual optional quest. If you can't get them it's fine you'll just have to grind more later.
|tip This is the best time to get these items, but the quest is still a while away.
|tip Leave these items in the mailbox so you don't waste storage space. Manually skip this step once you're done.
|tip There are more auction steps after this one, skip this step after completeing it and don't run to the mailbox yet. |only if Warrior
collect 1 Gyrochronatom##4389 |goto Undercity 64.42,52.41 |q 714 |future
collect 1 Frost Oil##3829 |goto Undercity 64.42,52.41 |q 713 |future
collect 1 Patterned Bronze Bracers##2868 |goto Undercity 64.42,52.41 |q 716 |future
collect 1 Lesser Invisibility Potion##3823 |goto Undercity 64.42,52.41 |q 715 |future
collect 1 Healing Potion##929 |goto Undercity 64.42,52.41 |q 715 |future
collect 9 Blue Pearl##4611 |goto Undercity 64.42,52.41 |q 705 |future
|tip The Blue Pearls are often expensive, we don't expect you to be able to get these but it is extra experience if they're affordable.
|only if not selfmade
step
talk Geoffrey Hartwell##4600
buy Rondel##2534 |n
|tip If you can afford it.
|tip You will use it when you reach level 39.
|tip If you have better, skip this step.
Visit the Vendor |vendor Geoffrey Hartwell##4600 |goto Undercity 58.67,33.06 |q 668 |future
|only if Rogue and itemcount(2534) == 0
step
talk Auctioneer Naxxremis##15683
|tip Buy these items from the Auction House.
|tip If you can't get them, you can kill enemies for them in the next few steps, but it will likely take a long time.
|tip You need these for your Whirlwind weapon class quest, which gives a big weapon upgrade.
collect 8 Thundering Charm##4480 |goto Undercity 64.39,35.82 |q 1714 |future
collect 8 Burning Charm##4479 |goto Undercity 64.39,35.82 |q 1714 |future
collect 8 Cresting Charm##4481 |goto Undercity 64.39,35.82 |q 1714 |future
collect 2 Nature Protection Potion##6052 |goto Undercity 64.39,35.82 |q 1713 |future
|tip You will have to kill a level 40 elite enemy soon, which hits hard and deals only Nature damage.
|tip These will help you to have more time to kill it to be able to get a big weapon upgrade.
|tip Alternatively, if you can easily get a friend to help you kill it very soon, you can skip buying the potions.
|only if Warrior and not selfmade
step
kill Cresting Exile##2761+
collect 8 Cresting Charm##4481 |goto Arathi Highlands 66.71,30.04 |q 1714 |future
|only if Warrior
step
kill Thundering Exile##2762+
collect 8 Thundering Charm##4480 |goto Arathi Highlands 52.05,50.59 |q 1714 |future
|only if Warrior
step
kill Burning Exile##2760+
|tip Be careful to avoid Refuge Pointe while traveling here.
collect 8 Burning Charm##4479 |goto Arathi Highlands 25.40,30.28 |q 1714 |future
|only if Warrior
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Field Testing Kit##8523 |goto Undercity 65.97,44.75 |q 243 |future
|tip Collect these items from the bank.
collect Fizzle Brassbolts' Letter##5827 |goto Undercity 65.97,44.75 |q 1106
step
talk Martha Strain##5753
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Martha Strain##5753 |goto Undercity 85.70,16.08 |q 668 |future
|only if Warlock
step
talk Hannah Akeley##4575
|tip If you can afford it.
|tip Stock up on a few Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Hannah Akeley##4575 |goto Undercity 82.78,15.83 |q 545 |future
|only if Mage
step
Run Scarlet Monastery
|tip You can use our Scarlet Monastery guide if you want assistance.
|tip After completing the dungeon, run outside to Undercity and return to this guide.
|tip Do not follow the Scarlet Monastery turnin guide.
|loadguide "Dungeon Guides\\Scarlet Monastery (Library) (31-37)"
|loadguide "Dungeon Guides\\Scarlet Monastery (Armory) (35-40)"
|loadguide "Dungeon Guides\\Scarlet Monastery (Cathedral) (36-42)"
|confirm
|only if guideflag("SMflag")
step
Follow the path |goto Undercity 52.15,64.37 < 10 |only if walking
talk Varimathras##2425
turnin Into The Scarlet Monastery##1048 |goto Undercity 56.26,92.20
|only if guideflag("SMflag")
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Alterac Mountains (38-38)',
  {
    image = ZGV.IMAGESDIR .. 'Alterac Mountains',
    condition_suggested = function()
      return level == 38 and not completedq(508)
    end,
    next = 'Leveling Guides\\Arathi Highlands (38-39)',
    hardcore = true,
  },
  [[
step
talk Patrice Dwyer##3551
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Patrice Dwyer##3551 |goto Silverpine Forest 42.90,41.80
|only if Rogue
step
talk Magus Wordeen Voidglare##2410
|tip Inside the building.
accept Dalaran Patrols##545 |goto Hillsbrad Foothills 61.60,20.84
step
use Nature Protection Potion##6052
|tip You are about to accept a quest soon to kill a level 40 elite enemy.
|tip You will need to use another Nature Protection Potion during the fight, so use one now, and wait until your potion cooldown is finished before accepting the quest in the next step.
|tip The potion lasts 1 hour, so you have plenty of time to get to the quest location in a few steps.
Click Here to Continue |confirm |q 1713 |future
|only if Warrior and itemcount(6052) > 0
step
talk Keeper Bel'varil##2437
|tip Inside the building.
accept Bracers of Binding##557 |goto Hillsbrad Foothills 61.50,20.94
step
click WANTED##1763
|tip As a hardcore player you may need to abandon this quest later. |only if hardcore
|tip We will try to complete it but if you are behind in levels it will be skipped. |only if hardcore
accept WANTED: Baron Vardus##566 |goto Hillsbrad Foothills 62.62,20.74
step
talk Krusk##2229
|tip Inside the building.
accept Gol'dir##503 |goto Hillsbrad Foothills 63.24,20.66
step
click Bath'rah's Cauldron##89931
|tip Follow the river north to travel to this location.
|tip Complete the "Essence of the Exile" quest.
collect Essence of the Exile##6851 |q 1712/3 |goto Alterac Mountains 79.32,66.81
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
turnin Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
accept The Summoning##1713 |goto Alterac Mountains 80.50,66.92 |noautoaccept
|tip Make sure your potion cooldown is finished before accept this quest.
|only if Warrior
step
Watch the dialogue
|tip Follow Bath'rah the Windwatcher as he walks.
|tip He will summon Cyclonian, a level 40 elite.
kill Cyclonian##6239
|tip Use the other Nature Protection Potion when the effect of the first one ends. |only if itemcount(6052) > 0
|tip If you have trouble, try to find someone to help you.
collect Whirlwind Heart##6894 |q 1713/1 |goto Alterac Mountains 80.60,62.52
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
|tip Inside the building.
turnin The Summoning##1713 |goto Alterac Mountains 80.50,66.92
accept Whirlwind Weapon##1792 |goto Alterac Mountains 80.50,66.92 |instant
|only if Warrior
step
kill Jailor Borhuin##2431
|tip Inside the building.
|tip He can spawn in multiple buildings around this area.
|tip There are many stealthed enemies in this area, be careful and move slowly.
|tip The wizards hit hard and run away when melee'd, which may pull more enemies.
|tip Do not be afraid to run away and reset the fight if a wizard is mean to you.
collect Rusted Iron Key##3704 |q 503/1 |goto Alterac Mountains 63.13,43.47
He can also be: |notinsticky
Inside the building at [Alterac Mountains 62.70,40.12]
Upstairs inside the building at [Alterac Mountains 60.62,43.87]
step
Find Where Gol'dir is Being Held |q 503/2 |goto Alterac Mountains 60.19,43.91
|tip Upstairs inside the building.
step
talk Gol'dir##2316
|tip Upstairs inside the building.
turnin Gol'dir##503 |goto Alterac Mountains 59.96,43.74
accept Blackmoore's Legacy##506 |goto Alterac Mountains 59.96,43.74
step
Enter the building |goto Hillsbrad Foothills 62.91,20.57 < 10 |walk
talk Krusk##2229
|tip Inside the building.
turnin Blackmoore's Legacy##506 |goto Hillsbrad Foothills 63.24,20.66
accept Lord Aliden Perenolde##507 |goto Hillsbrad Foothills 63.24,20.66 |only if level <= 40 or not hardcore
step
Follow the path up |goto Alterac Mountains 49.49,69.34 < 30 |only if walking
Kill Mountain Lion enemies around this area
collect Fresh Carcass##5810 |goto Alterac Mountains 45.35,77.70 |q 1136
You can find more around [Alterac Mountains 39.03,87.28]
step
Follow the path |goto Alterac Mountains 41.79,77.11 < 30 |only if walking
Enter the cave |goto Alterac Mountains 37.55,68.05 < 15 |walk
use the Fresh Carcass##5810
|tip Inside the cave.
kill Frostmaw##4504
|tip He spawns outside of the cave then walks to the entrance.
collect Frostmaw's Mane##5811 |q 1136/1 |goto Alterac Mountains 37.54,66.26
stickystart "Kill_Dalaran_Summoners"
stickystart "Kill_Elemental_Slaves"
step
kill Elemental Slave##2359+
collect 4 Bracers of Earth Binding##3715 |q 557/1 |goto Alterac Mountains 15.84,77.20
You can find more around [21.48,59.77]
step
label "Kill_Dalaran_Summoners"
kill 6 Dalaran Summoner##2358 |q 545/1 |goto Alterac Mountains 15.84,77.20
You can find more around [21.48,59.77]
step
label "Kill_Elemental_Slaves"
kill 12 Elemental Slave##2359 |q 545/2 |goto Alterac Mountains 15.84,77.20
You can find more around [21.48,59.77]
step
Follow the path northeast up the coast |goto Alterac Mountains 23.65,49.63 < 50 |only if walking and subzone("Dalaran")
Enter the building |goto Alterac Mountains 39.46,15.38 < 10 |walk
kill Lord Aliden Perenolde##2423 |q 507/1 |goto Alterac Mountains 39.32,14.58
|tip Upstairs inside the building.
|tip He's level 41, but you should be able to kill him at this level.
|tip Be careful, there are stealthed enemies around this area.
|tip If you have trouble, try to find someone to help you.
|tip You can skip the quest, if you need to, but will need to grind about 8,000 xp later to make up for it.
|only if level <= 40 or not hardcore
step
talk Elysa##2317
|tip Upstairs inside the building.
turnin Lord Aliden Perenolde##507 |goto Alterac Mountains 39.30,14.31
accept Taretha's Gift##508 |goto Alterac Mountains 39.30,14.31
|only if level <= 40 or not hardcore
step
kill Baron Vardus##2306
|tip He can spawn in multiple camps around this area.
collect Head of Baron Vardus##3626 |q 566/1 |goto Alterac Mountains 47.83,17.11
He can also spawn: |notinsticky
In the camp at [53.48,20.51]
In the camp at [56.26,26.74]
In the camp at [58.08,30.00]
Downstairs inside the building at [60.30,43.21]
|only if level <= 40 or not hardcore
step
Enter the building |goto Hillsbrad Foothills 61.58,20.61 < 10 |walk
talk Magus Wordeen Voidglare##2410
|tip Inside the building.
turnin Dalaran Patrols##545 |goto Hillsbrad Foothills 61.60,20.84
step
talk Keeper Bel'varil##2437
|tip Inside the building.
turnin Bracers of Binding##557 |goto Hillsbrad Foothills 61.50,20.94
step
talk High Executor Darthalia##2215
|tip She walks around this area.
turnin WANTED: Baron Vardus##566 |goto Hillsbrad Foothills 62.33,20.45
|only if completedq(566)
step
Enter the building |goto Hillsbrad Foothills 62.91,20.57 < 10 |walk
talk Krusk##2229
|tip Inside the building.
turnin Taretha's Gift##508 |goto Hillsbrad Foothills 63.24,20.66
|only if completedq(508)
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Arathi Highlands (38-39)',
  {
    image = ZGV.IMAGESDIR .. 'Arathi Highlands',
    condition_suggested = function()
      return level >= 38 and level <= 39 and not completedq(669)
    end,
    next = 'Leveling Guides\\Badlands (39-40)',
    hardcore = true,
  },
  [[
step
talk Zengu##2703
turnin Trollbane##638 |goto Arathi Highlands 73.80,33.95
step
talk Drum Fel##2771
accept Call to Arms##678 |goto Arathi Highlands 74.24,33.91
step
talk Tor'gan##2706
accept Guile of the Raptor##701 |goto Arathi Highlands 74.71,36.29
step
click Shards of Myzrael##138492
accept The Princess Trapped##642 |goto Arathi Highlands 62.48,33.80
step
Kill Drywhisker enemies around this area
|tip You can find more in the cave at the top of the path referenced below.
|tip Drywhisker Surveyors are ranged attackers that deal high ranged damage.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.				|only if hardcore
collect 12 Mote of Myzrael##4435 |q 642/1 |goto Arathi Highlands 76.13,44.11
You can find more: |notinsticky
Around [78.07,35.28]
Up the path that starts at [80.84,39.91]
step
Follow the path up |goto Arathi Highlands 80.90,39.96 < 10 |only if walking and not _G.IsIndoors()
Enter the cave |goto Arathi Highlands 82.66,36.16 < 15 |walk |only if not _G.IsIndoors()
click Iridescent Shard##2701+
|tip Upstairs inside the cave.
|tip Drywhisker Surveyors are ranged attackers that deal high ranged damage.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.				|only if hardcore
turnin The Princess Trapped##642 |goto Arathi Highlands 84.31,30.92
accept Stones of Binding##651 |goto Arathi Highlands 84.31,30.92
step
Leave the cave |goto Arathi Highlands 82.69,36.21 < 15 |walk |only if subzone("Drywhisker Gorge") and _G.IsIndoors()
click Stone of East Binding##2691
|tip This is in the middle of the stone ring.
collect Cresting Key##4484 |q 651/2 |goto Arathi Highlands 66.75,29.75
step
click Stone of Outer Binding##2690
collect Thundering Key##4485 |q 651/3 |goto Arathi Highlands 52.06,50.69
stickystart "Kill_Boulderfist_Brutes"
stickystart "Collect_Raptor_Hearts"
step
kill 4 Boulderfist Magus##2567+ |q 678/2 |goto Arathi Highlands 52.77,74.81
|tip You can find more inside the cave nearby.
|tip Watch for patrols and respawns while in the cave.			|only if hardcore
|tip Boulderfist Magi are ranged attackers that deal heavy damage.	|only if hardcore
_NOTE_ |only if hardcore
|tip Molok the Crusher is a rare spawn in this area, if he is alive be very, very, careful. He does insanely high damage. Avoid him if possible. |only if hardcore
step
label "Kill_Boulderfist_Brutes"
kill 10 Boulderfist Brute##2566 |q 678/1 |goto Arathi Highlands 52.77,74.81
|tip You can find more inside the cave nearby. |notinsticky
|tip Boulderfist Magus are ranged attackers that deal heavy damage.	|only if hardcore |notinsticky
step
label "Collect_Raptor_Hearts"
kill Highland Fleshstalker##2561+
collect 12 Raptor Heart##4513 |q 701/1 |goto Arathi Highlands 47.45,77.65
You can find more around [52.35,66.84]
step
Kill enemies around this area
|tip Getting this far into level 38 will allow you to reach level 39 when turning in quests soon.
|tip You will be doing an escort quest soon that can be difficult, so it will help to be a level higher.
ding 38,75000 |goto Arathi Highlands 47.45,77.65
You can find more around: |notinsticky
[52.35,66.84]
[52.77,74.81]
step
talk Tor'gan##2706
turnin Guile of the Raptor##701 |goto Arathi Highlands 74.71,36.29
accept Guile of the Raptor##702 |goto Arathi Highlands 74.71,36.29
step
talk Gor'mul##2792
|tip He walks around this area.
turnin Guile of the Raptor##702 |goto Arathi Highlands 72.55,34.01
step
talk Mu'uta##9555
Vendor your Trash |vendor Mu'uta##9555 |goto Arathi Highlands/0 72.53,33.40 |q 678
step
Watch the dialogue
talk Gor'mul##2792
|tip He walks around this area.
accept Guile of the Raptor##847 |goto Arathi Highlands 72.55,34.01
step
talk Drum Fel##2771
turnin Call to Arms##678 |goto Arathi Highlands 74.24,33.91
step
talk Tor'gan##2706
turnin Guile of the Raptor##847 |goto Arathi Highlands 74.71,36.29
step
click Stone of West Binding##2689
|tip Be careful to avoid Refuge Pointe while traveling here.
collect Burning Key##4483 |q 651/1 |goto Arathi Highlands 25.52,30.12
step
click Stone of Inner Binding##2702
turnin Stones of Binding##651 |goto Arathi Highlands 36.19,57.37
step
Follow the path |goto Arathi Highlands 31.22,65.35 < 30 |only if walking and not subzone("Faldir's Cove")
Enter the tunnel |goto Arathi Highlands 21.58,75.61 < 15 |only if walking and not subzone("Faldir's Cove")
Leave the tunnel |goto Arathi Highlands 22.00,79.55 < 15 |only if walking and not subzone("Faldir's Cove")
talk Lolo the Lookout##2766
|tip He walks around this area.
accept Land Ho!##663 |goto Arathi Highlands 31.78,82.70
step
talk Shakes O'Breen##2610
turnin Land Ho!##663 |goto Arathi Highlands 32.28,81.38
step
talk First Mate Nilzlix##2767
|tip He walks around this area.
accept Deep Sea Salvage##662 |goto Arathi Highlands 32.77,81.47
step
talk Captain Steelgut##2769
accept Drowned Sorrows##664 |goto Arathi Highlands 34.00,80.79
step
talk Professor Phizzlethorpe##2768
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept Sunken Treasure##665 |goto Arathi Highlands 33.87,80.55 |noautoaccept
step
Watch the dialogue
|tip Follow Professor Phizzlethorpe as he walks.
|tip He eventually walks back to this location.
Kill the enemies that attack
|tip Two level 40 water elementals will attack.
|tip If you have trouble, try to find someone to help you.
Defend Professor Phizzlethorpe |q 665/1 |goto Arathi Highlands/0 35.75,79.59
step
talk Doctor Draxlegauge##2774
turnin Sunken Treasure##665 |goto Arathi Highlands 33.86,80.45
accept Sunken Treasure##666 |goto Arathi Highlands 33.86,80.45
step
Equip the Goggles of Gem Hunting
|tip They should be in your bags.
Click Here After Equipping The Goggles |confirm |q 666
step
use an Elixir of Water Breathing##5996
|tip You should have these from purchasing them earlier in the guide from the auction house in Undercity. |only if not selfmade
Gain Water Breathing |havebuff Water Breathing##7178 |goto Arathi Highlands 28.42,84.79 |q 666
|only if not (Undead or Druid or Warlock or Shaman) and itemcount(5996) > 0
stickystart "Collect_Elven_Gems"
stickystart "Kill_Daggerspine_Sorceresses"
stickystart "Kill_Daggerspine_Raiders"
step
click Maiden's Folly Log##2709
|tip It looks like a large brown book in a grey metal cauldron.
|tip On the middle floor of the sunken ship.
collect Maiden's Folly Log##4489 |q 662/2 |goto Arathi Highlands 23.41,85.10
step
click Maiden's Folly Charts##2707
|tip It looks like a tan scroll laying flat on a wooden ledge.
|tip On the middle floor of the sunken ship.
collect Maiden's Folly Charts##4487 |q 662/1 |goto Arathi Highlands 23.04,84.51
step
click Spirit of Silverpine Charts##2708
|tip It looks like a tan scroll laying flat on a wooden crate next to a cannon.
|tip On the middle floor of the sunken ship.
collect Spirit of Silverpine Charts##4488 |q 662/3 |goto Arathi Highlands 20.45,85.60
step
click Spirit of Silverpine Log##2710
|tip It looks like an open book laying on the ground.
|tip At the very bottom of the ship.
collect Spirit of Silverpine Log##4490 |q 662/4 |goto Arathi Highlands 20.65,85.10
step
label "Collect_Elven_Gems"
click Calcified Elven Gem##2712+
|tip They look like large gray stones on the ground underwater around this area.
|tip If you are wearing the Goggles of Gem Hunting, they will appear on your minimap as yellow dots.
collect 10 Elven Gem##4492 |q 666/1 |goto Arathi Highlands 25.03,85.70
You can find more around: |notinsticky
[24.65,90.70]
[18.60,90.36]
[19.70,84.18]
step
label "Kill_Daggerspine_Sorceresses"
kill 3 Daggerspine Sorceress##2596 |q 664/2 |goto Arathi Highlands 22.83,87.29
|tip Underwater around this area. |notinsticky
step
label "Kill_Daggerspine_Raiders"
kill 10 Daggerspine Raider##2595 |q 664/1 |goto Arathi Highlands 22.83,87.29
|tip The Raiders have a 10 second net, be careful when engaging them to be sure you won't drown in a net.
|tip Underwater around this area. |notinsticky
step
talk First Mate Nilzlix##2767
Re-equip your regular head armor while swimming to this turnin.
|tip He walks around this area.
turnin Deep Sea Salvage##662 |goto Arathi Highlands 32.80,81.48
step
talk Captain Steelgut##2769
turnin Drowned Sorrows##664 |goto Arathi Highlands 34.00,80.79
step
talk Doctor Draxlegauge##2774
turnin Sunken Treasure##666 |goto Arathi Highlands 33.85,80.45
accept Sunken Treasure##668 |goto Arathi Highlands 33.85,80.45
step
talk Shakes O'Breen##2610
turnin Sunken Treasure##668 |goto Arathi Highlands 32.29,81.38
accept Sunken Treasure##669 |goto Arathi Highlands 32.29,81.38
step
Leave the Cove |goto Arathi Highlands/0 22.07,79.87 < 20 |c |q 669
|tip You are going to be traveling to Badlands, be careful to not aggro the dwarf guards on the way. |only if hardcore
|tip They are currently bugged and will PvP flag you even if you do not fight back. |only if hardcore
|only if subzone("Faldir's Cove")
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Badlands (39-40)',
  {
    image = ZGV.IMAGESDIR .. 'Badlands',
    condition_suggested = function()
      return level >= 38 and level <= 40 and not completedq(2981)
    end,
    next = 'Leveling Guides\\Stranglethorn Vale (40-40)',
    hardcore = true,
  },
  [[
step
talk Martek the Exiled##4618
turnin Martek the Exiled##1106 |goto Badlands 42.22,52.69
accept Indurium##1108 |goto Badlands 42.22,52.69
step
talk Lotwil Veriatus##2921
accept Study of the Elements: Rock##710 |goto Badlands 25.95,44.87
stickystart "Collect_Small_Stone_Shards"
step
talk Neeka Bloodscar##5394
|tip At the top of the tower.
|tip If you have items in the mail from an auction step earlier, now is the time to grab them. |only if not selfmade
accept Coyote Thieves##1419 |goto Badlands 6.48,47.18
accept Report to Helgrum##1420 |goto Badlands 6.48,47.18
stickystop "Collect_Small_Stone_Shards"
step
talk Gorrik##2861
fpath Kargath |goto Badlands 3.99,44.78
step
Enter the building |goto Badlands 3.83,46.98 < 10 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
|tip If you have items in the mail from an auction step earlier, now is the time to grab them. |only if not selfmade
accept Badlands Reagent Run##2258 |goto Badlands 2.42,46.06
step
talk Grawl##2908
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 8-10 extra stacks.
|tip You will be questing for a while, without easy access to an ammo vendor.
Visit the Vendor |vendor Grawl##2908 |goto Badlands 3.12,45.93 |q 2258
|only if Hunter
stickystart "Collect_Small_Stone_Shards"
stickystart "Collect_Buzzard_Gizzards"
stickystart "Collect_Buzzard_Wings"
step
Kill Rock Elemental enemies around this area
collect 5 Rock Elemental Shard##7848 |q 2258/3 |goto Badlands 19.46,43.02
You can find more around [Badlands 13.98,39.71]
step
label "Collect_Small_Stone_Shards"
kill Lesser Rock Elemental##2735+ |notinsticky
|tip You will need to do multiple clears to get enough stone shards.
|tip Kill Buzzards to the south between respawns. Rotate betweem them and the elementals.
collect 10 Small Stone Shard##4626 |q 710/1 |goto Badlands 19.46,43.02
You can find more around [13.98,39.71]
stickystop "Collect_Buzzard_Gizzards"
stickystop "Collect_Buzzard_Wings"
step
talk Lotwil Veriatus##2921
turnin Study of the Elements: Rock##710 |goto Badlands 25.95,44.87
accept Study of the Elements: Rock##711 |goto Badlands 25.95,44.87
stickystart "Collect_Buzzard_Gizzards"
stickystart "Collect_Buzzard_Wings"
stickystart "Collect_Crag_Coyote_Fangs"
stickystart "Collect_Coyote_Jawbones"
step
kill Rock Elemental##92+
collect 3 Large Stone Slab##4627 |q 711/1 |goto Badlands 39.30,77.11
You can find more around [43.56,84.04]
step
Kill Stonevault enemies around this area
collect 10 Indurium Flake##5797 |q 1108/1 |goto Badlands 50.51,69.96
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
label "Collect_Buzzard_Wings"
Kill Buzzard enemies around this area
collect 4 Buzzard Wing##3404 |q 703/1 |future |goto Badlands 16.82,59.84
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[12.45,69.20]
[17.43,48.90]
[25.63,62.04]
[33.36,59.65]
[28.67,72.03]
[24.51,74.45]
[18.90,77.65]
step
talk Martek the Exiled##4618
turnin Indurium##1108 |goto Badlands 42.21,52.70
step
talk Rigglefuzz##2817
accept Barbecued Buzzard Wings##703 |goto Badlands 42.39,52.93
turnin Barbecued Buzzard Wings##703 |goto Badlands 42.39,52.93
accept Pearl Diving##705 |goto Badlands 42.39,52.93 |only if itemcount(4611) >= 9
step
talk Rigglefuzz##2817
turnin Pearl Diving##705 |goto Badlands 42.39,52.93
|only if itemcount(4611) >= 9
step
Watch the dialogue
talk Martek the Exiled##4618
accept News for Fizzle##1137 |goto Badlands 42.21,52.70
step
talk Lotwil Veriatus##2921
turnin Study of the Elements: Rock##711 |goto Badlands 25.95,44.87
accept Study of the Elements: Rock##712 |goto Badlands 25.95,44.87
step
label "Collect_Crag_Coyote_Fangs"
Kill Coyote enemies around this area
collect 10 Crag Coyote Fang##7846 |q 2258/2 |goto Badlands 23.75,55.12
You can find more around: |notinsticky
[14.18,65.72]
[31.58,65.16]
step
label "Collect_Coyote_Jawbones"
Kill Coyote enemies around this area
collect 30 Coyote Jawbone##6166 |q 1419/1 |goto Badlands 23.75,55.12
You can find more around: |notinsticky
[14.18,65.72]
[31.58,65.16]
step
Kill enemies around this area
|tip Getting this far into level 39 will allow you to reach level 40 when you turn in quests soon.
|tip Grinding a bit here will reduce the amount you have to grind all at once later.
|tip Also, you are about to return to Orgrimmar, so it will be a good time to learn your level 40 abilities.
ding 39,80000 |goto Badlands 30.24,59.90
step
_Destroy These Items:_
|tip They are no longer needed. You can also keep to sell on the auction house if you wish.
trash Buzzard Wing##3404 |goto Badlands 6.48,47.18
step
kill Greater Rock Elemental##2736+
|tip If you have trouble, try to find someone to help you.
|tip This quest is especially worth doing if you purchased the items for the Nifty Stopwatch chain earlier. |only if not selfmade
|tip These enemies can be tough, and are a bit higher level. |only if hardcore
|tip If you'd rather not risk it, skip this step and abandon the "Study of the Elements: Rock" quest. |only if hardcore
collect 5 Bracers of Rock Binding##4628 |q 712/1 |goto Badlands 5.40,76.83
You can find more up the path that starts at [13.20,83.27]
step
talk Lotwil Veriatus##2921
turnin Study of the Elements: Rock##712 |goto Badlands 25.95,44.87
accept Gyro... What?##714 |goto Badlands 25.95,44.87 |only if itemcount(4389) > 0
accept Coolant Heads Prevail##713 |goto Badlands 25.95,44.87 |only if itemcount(3829) > 0
step
talk Lotwil Veriatus##2921
turnin Gyro... What?##714 |goto Badlands 25.95,44.87 |only if itemcount(4389) > 0
turnin Coolant Heads Prevail##713 |goto Badlands 25.95,44.87 |only if itemcount(3829) > 0
|only if itemcount(4389) > 0 or itemcount(3829)
step
talk Lucien Tosselwrench##2920
accept Liquid Stone##715 |goto Badlands 25.95,44.67 |only if itemcount(3823) > 0 and itemcount(929) > 0
accept Stone Is Better than Cloth##716 |goto Badlands 25.95,44.67 |only if itemcount(2868) > 0
|only if (itemcount(3823) > 0 and itemcount(929) > 0) or itemcount(2868) > 0
step
talk Lucien Tosselwrench##2920
turnin Liquid Stone##715 |goto Badlands 25.95,44.67 |only if itemcount(3823) > 0 and itemcount(929) > 0
turnin Stone Is Better than Cloth##716 |goto Badlands 25.95,44.67 |only if itemcount(2868) > 0
|only if (itemcount(3823) > 0 and itemcount(929) > 0) or itemcount(2868) > 0
step
talk Neeka Bloodscar##5394
|tip At the top of the tower.
turnin Coyote Thieves##1419 |goto Badlands 6.48,47.18
step
Enter the building |goto Badlands 3.85,47.00 < 10 |walk
talk Jarkal Mossmeld##6868
|tip Upstairs inside the building.
turnin Badlands Reagent Run##2258 |goto Badlands 2.42,46.06
step
_Destroy These Items:_
|tip They are no longer needed.
trash Crag Coyote Fang##7846 |goto Orgrimmar 75.23,34.24
step
_Note_:
|tip Now that you are level 40, this is the best time to get your mount.
|tip This requires around 100 gold.
|tip If you cannot afford it now, it will be up to you to pick a good time to buy it once you can afford it in the future.
Click Here to continue |confirm |q 1420
step
talk Belgrom Rockmaul##4485
accept A Threat in Feralas##2981 |goto Orgrimmar 75.23,34.24
step
talk Trak'gen##3313
Stock up on level 40 Arrows |vendor Trak'gen##3313 |goto Orgrimmar/0 48.14,80.56 |q 1420
|only if Hunter
step
Enter the building |goto Orgrimmar 77.36,38.72 < 10 |walk
talk Jin'sora##3410
buy Massive Longbow##11307 |n
|tip If you can afford it.
|tip It's a limited supply item, so it may not be for sale.
|tip You can't use it until level 42, but it's good to have waiting to use, and you can only buy it in major cities.
|tip We will check vendors for it along the way, if it's not here right now.
|tip If you have better, skip this step.
Visit the Vendor |vendor Jin'sora##3410 |goto Orgrimmar 78.09,38.46 |q 1420
|only if Hunter and itemcount(11307) == 0
step
talk Barkeep Morag##5611
|tip If you are using a pet that requires meat, stock up.
|tip You won't see another meat vendor for a while.
Restock on Meat |vendor Barkeep Morag##5611 |goto Orgrimmar/0 54.63,67.81 |q 1420
|only if Hunter
step
talk Katis##5816
|tip Inside the tent, inside the Cleft of Shadow.
buy Blackbone Wand##5239 |n
|tip If you can afford it.
|tip You will use it when you reach level 41.
|tip If you have better, skip this step.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.18,48.44 |q 1432
|only if Priest and itemcount(5239) == 0
step
Enter the building |goto Orgrimmar 49.87,70.48 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Frostmaw's Mane##5811 |goto Orgrimmar 49.58,69.12 |q 1136 |future
|tip Collect these items from the bank.
collect Defiant Orc Head##5918 |goto Orgrimmar 49.58,69.12 |q 1240
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48
|only if Rogue
step
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells.	|trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 1420
Train your spells.	|trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 1420
Train your spells.	|trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 1420
Train your spells.	|trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 1420
Train your spells.	|trainer Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 1420
Train your spells.	|trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 1420
|tip Inside the building. |only if Warrior or Mage or Priest
step
Enter the building |goto Orgrimmar 53.68,64.58 < 10 |walk
talk Auctioneer Thathung##8673
|tip Buy these items from the auction house. They are usually very cheap and this gives a lot of exp.
|tip Try to make sure all of the pages are available before buying any.
|tip If you cannot get every page, skip this step.
|tip Leave these items in your mailbox for storage space.
collect Green Hills of Stranglethorn - Page 1##2725 |goto Orgrimmar 55.90,62.71 |q 339 |future
collect Green Hills of Stranglethorn - Page 4##2728 |goto Orgrimmar 55.90,62.71 |q 339 |future
collect Green Hills of Stranglethorn - Page 6##2730 |goto Orgrimmar 55.90,62.71 |q 339 |future
collect Green Hills of Stranglethorn - Page 8##2732 |goto Orgrimmar 55.90,62.71 |q 339 |future
collect Green Hills of Stranglethorn - Page 10##2734 |goto Orgrimmar 55.90,62.71 |q 340 |future
collect Green Hills of Stranglethorn - Page 11##2735 |goto Orgrimmar 55.90,62.71 |q 340 |future
collect Green Hills of Stranglethorn - Page 14##2738 |goto Orgrimmar 55.90,62.71 |q 340 |future
collect Green Hills of Stranglethorn - Page 16##2740 |goto Orgrimmar 55.90,62.71 |q 340 |future
collect Green Hills of Stranglethorn - Page 18##2742 |goto Orgrimmar 55.90,62.71 |q 341 |future
collect Green Hills of Stranglethorn - Page 20##2744 |goto Orgrimmar 55.90,62.71 |q 341 |future
collect Green Hills of Stranglethorn - Page 21##2745 |goto Orgrimmar 55.90,62.71 |q 341 |future
collect Green Hills of Stranglethorn - Page 24##2748 |goto Orgrimmar 55.90,62.71 |q 341 |future
collect Green Hills of Stranglethorn - Page 25##2749 |goto Orgrimmar 55.90,62.71 |q 342 |future
collect Green Hills of Stranglethorn - Page 26##2750 |goto Orgrimmar 55.90,62.71 |q 342 |future
collect Green Hills of Stranglethorn - Page 27##2751 |goto Orgrimmar 55.90,62.71 |q 342 |future
|only if not selfmade
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stranglethorn Vale (40-40)',
  {
    image = ZGV.IMAGESDIR .. 'Stranglethorn Vale',
    condition_suggested = function()
      return level == 40 and not completedq(197)
    end,
    next = 'Leveling Guides\\Swamp of Sorrows (40-41)',
    hardcore = true,
  },
  [[
step
Enter the building |goto Stranglethorn Vale 28.11,74.98 < 10 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Big Stick##12251 |n
|tip If you can afford it.
|tip It may not be available to buy, since it's a limited supply item.
|tip If you have better, skip this step.
Visit the Vendor |vendor Zarena Cromwind##2482 |goto Stranglethorn Vale 28.34,75.46 |q 1240
|only if Shaman and itemcount(12251) == 0
step
talk Zudd##3624
Train your pet in Grom'gol. |trainer Zudd##3624 |goto Stranglethorn Vale/0 31.13,28.93 |q 1240
|only if Hunter
step
talk Kragg##1404
Train your spells. |trainer Kragg##1404 |goto Stranglethorn Vale/0 31.24,28.68 |q 1240
|only if Hunter
step
talk Nimboya##2497
accept Bloodscalp Clan Heads##584 |goto Stranglethorn Vale 32.16,27.72
step
talk Kin'weelay##2519
turnin The Troll Witchdoctor##1240 |goto Stranglethorn Vale 32.27,27.71
step
talk Far Seer Mok'thardin##2465
accept Mok'thardin's Enchantment##572 |goto Stranglethorn Vale 32.12,29.24
step
Watch the dialogue
talk Kin'weelay##2519
accept Split Bone Necklace##598 |goto Stranglethorn Vale 32.27,27.71
stickystart "Collect_Nezzlioks_Head"
stickystart "Collect_Elder_Crocolisk_Skin"
step
Run down the coast and follow the path up |goto Stranglethorn Vale 21.43,10.13 < 15 |only if walking
kill Gan'zulah##1061
|tip Watch for patrols and respawn while in the area.						|only if hardcore |notinsticky
|tip Bloodscalp Headhunters and Beastmasters are ranged attackers that can pile on quickly.	|only if hardcore |notinsticky
collect Gan'zulah's Head##3904 |q 584/1 |goto Stranglethorn Vale 23.44,8.12
step
label "Collect_Nezzlioks_Head"
kill Nezzliok the Dire##1062
|tip He walks around this area.
|tip Watch for patrols and respawn while in the area.						|only if hardcore |notinsticky
|tip Bloodscalp Headhunters and Beastmasters are ranged attackers that can pile on quickly.	|only if hardcore |notinsticky
collect Nezzliok's Head##3905 |q 584/2 |goto Stranglethorn Vale 23.52,9.53
step
click Bubbling Cauldron
turnin Bloodscalp Clan Heads##584 |goto Stranglethorn Vale 32.22,27.60
step
Watch the dialogue
click Bubbling Cauldron
accept Speaking with Nezzliok##585 |goto Stranglethorn Vale 32.22,27.60
step
Enter the building |goto Stranglethorn Vale 31.32,29.58 < 10 |walk
talk Innkeeper Thulbek##5814
|tip Inside the building.
home Grom'gol Base Camp |goto Stranglethorn Vale 31.49,29.75
stickystart "Collect_Jungle_Stalker_Feathers"
step
kill 10 Jungle Stalker##687 |q 196/1 |goto Stranglethorn Vale 33.70,38.83
|tip Be careful to avoid Tethis.
|tip He looks like a level 43 elite blue raptor that walks around this area.
You can find more around: |notinsticky
[31.79,41.74]
[28.91,44.29]
[27.19,49.65]
step
label "Collect_Jungle_Stalker_Feathers"
kill Jungle Stalker##687+ |notinsticky
collect 10 Jungle Stalker Feather##3863 |q 572/1 |goto Stranglethorn Vale 33.70,38.83
|tip Be careful to avoid Tethis. |notinsticky
|tip He looks like a level 43 elite blue raptor that walks around this area. |notinsticky
You can find more around: |notinsticky
[31.79,41.74]
[28.91,44.29]
[27.19,49.65]
step
label "Collect_Elder_Crocolisk_Skin"
kill Elder Saltwater Crocolisk##2635
|tip This is a crocodile that can spawn along the beach.
|tip He is an elite enemy that you should be able to solo at this level.
|tip You kite him to Grom'Gol and have the guards help you, as long as you weaken him to 50% hp you'll get kill credit.
|tip You'll need to hit him every 10 seconds or so to prevent him from resetting while kiting.
|tip Ask for help if you are worried.
collect Elder Crocolisk Skin##4105 |q 628 |goto Stranglethorn Vale 29.41,25.21
He can spawn on the shore between these two points: |notinsticky
[33.41,32.41]
[21.41,15.81]
|stickyif not subzone("Ruins of Zul'kunda")
step
Kill Venture Co. enemies around this area
|tip Be careful of tinkerers. They summon an add and deal heavy damage.
collect 10 Singing Blue Crystal##3917 |q 600/1 |goto Stranglethorn Vale 41.22,43.95
stickystart "Collect_Split_Bones_Necklaces"
stickystart "Collect_Skullsplitter_Tusks"
step
click Ziata'jai Trophy Skulls
collect Ziata'jai Trophy##3907 |q 585/2 |goto Stranglethorn Vale 42.21,36.12
step
click Zul'Mamwe Trophy Skulls
collect Zul'Mamwe Trophy##3908 |q 585/3 |goto Stranglethorn Vale 47.65,39.54
step
click Balia'mah Trophy Skulls
collect Balia'mah Trophy##3906 |q 585/1 |goto Stranglethorn Vale 46.14,32.33
step
label "Collect_Split_Bones_Necklaces"
Kill Skullsplitter enemies around this area
collect 25 Split Bone Necklace##3916 |q 598/1 |goto Stranglethorn Vale 42.69,36.60
You can find more around: |notinsticky
[45.93,32.79]
[47.39,39.42]
[45.33,42.07]
step
label "Collect_Skullsplitter_Tusks"
Kill Skullsplitter enemies around this area
collect 18 Skullsplitter Tusk##1524 |q 209/1 |goto Stranglethorn Vale 42.69,36.60
You can find more around: |notinsticky
[45.93,32.79]
[47.39,39.42]
[45.33,42.07]
step
kill Bhag'thera##728
|tip He looks like an unstealthed black panther.
|tip He is a level 40 elite, you should be able to kill him if you let your pet tank.
|tip If you have trouble or want to be safe, you'll get another chance later.
|tip He can spawn in multiple locations.
collect Fang of Bhag'thera##3876 |q 193/1 |goto Stranglethorn Vale 46.37,29.05
Cross this tree bridge to get to the other locations: [48.92,28.04]
You can also find him around: |notinsticky
[49.60,24.03]
[48.99,20.20]
|only if Hunter or Warlock
step
talk Uthok##1149
|tip Stock up on arrows. |only if Hunter
Vendor your Trash |vendor Uthok##1149 |q 572 |goto Stranglethorn Vale/0 31.55,27.95
step
talk Far Seer Mok'thardin##2465
|tip If you purchased Green Hills of Stranglethorn pages from the auction house earlier, grab them from the mailbox now. |only if not selfmade
turnin Mok'thardin's Enchantment##572 |goto Stranglethorn Vale 32.12,29.24
step
talk Kin'weelay##2519
|tip If you purchased Green Hills of Stranglethorn pages from the auction house earlier, grab them from the mailbox now. |only if not selfmade
turnin Split Bone Necklace##598 |goto Stranglethorn Vale 32.27,27.71
step
click Bubbling Cauldron
turnin Speaking with Nezzliok##585 |goto Stranglethorn Vale 32.22,27.60
accept Marg Speaks##1261 |goto Stranglethorn Vale 32.22,27.60
step
talk Barnil Stonepot##716
|tip If you purchased or found all of the Green Hills of Stranglethorn pages, accept this quest.
|tip Otherwise skip it.
accept The Green Hills of Stranglethorn##338 |goto Stranglethorn Vale 35.66,10.53
step
talk Barnil Stonepot##716
|tip Depending on your quest log space you may have to accept and turn in these quests one by one.
accept Chapter I##339 |goto Stranglethorn Vale 35.66,10.53
accept Chapter II##340 |goto Stranglethorn Vale 35.66,10.53
accept Chapter III##341 |goto Stranglethorn Vale 35.66,10.53
accept Chapter IV##342 |goto Stranglethorn Vale 35.66,10.53
|only if haveq(338)
step
talk Barnil Stonepot##716
turnin Chapter I##339 |goto Stranglethorn Vale 35.66,10.53
turnin Chapter II##340 |goto Stranglethorn Vale 35.66,10.53
turnin Chapter III##341 |goto Stranglethorn Vale 35.66,10.53
turnin Chapter IV##342 |goto Stranglethorn Vale 35.66,10.53
|only if haveq(338)
step
talk Barnil Stonepot##716
turnin The Green Hills of Stranglethorn##338 |goto Stranglethorn Vale 35.66,10.53
|only if readyq(338)
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##193 |goto Stranglethorn Vale 35.55,10.55
|only if itemcount(3876) > 0
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##196 |goto Stranglethorn Vale 35.66,10.81
accept Raptor Mastery##197 |goto Stranglethorn Vale 35.66,10.81
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Swamp of Sorrows (40-41)',
  {
    image = ZGV.IMAGESDIR .. 'Swamp of Sorrows',
    condition_suggested = function()
      return level >= 40 and level <= 41 and not completedq(1205)
    end,
    next = 'Leveling Guides\\Desolace (41-41)',
    hardcore = true,
  },
  [[
step
Follow the path |goto Duskwood/0 78.40,60.33 < 35	|only if hardcore
Continue following the path |goto Duskwood/0 81.97,50.51 < 35	|only if hardcore
Follow the road |goto Duskwood/0 83.73,42.32 < 25			|only if hardcore
talk Deathstalker Zraedus##5418
|tip Be careful to avoid Darkshire as you travel here.
accept Nothing But The Truth##1372 |goto Duskwood 87.81,35.63
step
talk Apothecary Faustin##5414
turnin Nothing But The Truth##1372 |goto Duskwood 87.46,35.25
step
Follow the road through Deadwind Pass |goto Duskwood 87.73,40.68 < 40 |only if walking and not zone("Swamp of Sorrows")
Cross the bridge |goto Deadwind Pass/0 41.89,34.66 < 20 |only if walking and not zone("Swamp of Sorrows")
Continue following the road into Swamp of Sorrows |goto Deadwind Pass 52.04,43.41 < 30 |only if walking and not zone("Swamp of Sorrows")
Kill Whelp enemies around this area
|tip They look like tiny flying dragons.
|tip There's not enough whelps here to complete the quest without waiting for respawns.
|tip Kill all of the whelps you can find, then skip to the next step.
|tip We'll come back later to finish up the quest.
collect 10 Speck of Dream Dust##5803 |q 1116/1 |goto Swamp of Sorrows 14.74,60.20
step
Enter the building |goto Swamp of Sorrows 45.26,55.32 < 10 |walk
talk Dar##5591
|tip Inside the building.
accept Lack of Surplus##698 |goto Swamp of Sorrows 44.70,57.20
step
talk Thultazor##983
|tip He can sell potions as a limited stock item, they may not be up.
Check for Potions |vendor Thultazor##983 |q 698 |goto Swamp of Sorrows/0 45.78,52.85
step
talk Breyk##6026
fpath Stonard |goto Swamp of Sorrows 46.07,54.82
step
Enter the building |goto Swamp of Sorrows 47.18,54.29 < 10 |walk
talk Helgrum the Swift##1442
|tip Upstairs inside the building.
turnin Report to Helgrum##1420 |goto Swamp of Sorrows 47.74,55.20
step
talk Fel'zerul##1443
|tip Upstairs inside the building.
accept Pool of Tears##1424 |goto Swamp of Sorrows 47.93,54.80
step
talk Hekkru##10049
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 6".
Click Here to Continue |confirm |goto Swamp of Sorrows 45.56,55.15 |q 1392 |future
|only if Hunter
stickystart "Collect_Unprepared_Sawtooth_Flanks"
step
_NOTE:_
Tame a Deathstrike Tarantula
|tip Use your "Tame Beast" ability on a Deathstrike Tarantula.
|tip They look like green spiders around this area.
|tip Make sure to tame a level 40 Deathstrike Tarantula.
Learn the "Bite 6" Pet Ability
|tip Grind crocolisks until you see a message in your chat saying you learned "Bite 6".
|tip You will teach "Bite 6" to your permanent pet soon.
Click Here to Continue |confirm |goto Swamp of Sorrows 58.26,62.55 |q 1392 |future
|only if Hunter
stickystop "Collect_Unprepared_Sawtooth_Flanks"
step
talk Hekkru##10049
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Bite 6" to your permanent pet.
Click Here to Continue |confirm |goto Swamp of Sorrows 45.56,55.15 |q 1392 |future
|only if Hunter
stickystart "Collect_Unprepared_Sawtooth_Flanks"
step
map Swamp of Sorrows
path	follow strict;	loop;	ants curved;	dist 30
path	32.39,35.38		33.15,43.58		37.34,46.76		42.24,33.84
path	47.11,38.83		49.86,40.28		54.02,39.21		55.84,35.85
kill Noboru the Cudgel##5477
|tip He looks like a larger Lost One creature that walks around this area with 2 bodyguards.
collect Noboru's Cudgel##6196 |q 1392 |future
step
use Noboru's Cudgel##6196
accept Noboru the Cudgel##1392	|goto Swamp of Sorrows 25.99,31.40
step
talk Magtoor##1776
accept Draenethyst Crystals##1389 |goto Swamp of Sorrows 25.99,31.40
step
label "Collect_Unprepared_Sawtooth_Flanks"
Kill Sawtooth enemies around this area
|tip They look like crocodiles.
collect 8 Unprepared Sawtooth Flank##6169 |q 698/1 |goto Swamp of Sorrows 48.36,40.15
You can find more around: |notinsticky
[55.69,35.96]
[61.98,30.32]
[55.77,53.75]
step
talk Tok'Kar##5592
turnin Lack of Surplus##698 |goto Swamp of Sorrows 81.32,80.97
accept Lack of Surplus##699 |goto Swamp of Sorrows 81.32,80.97
step
use an Elixir of Water Breathing##5996								|only if not (Undead or Druid or Warlock or Shaman) and itemcount(5996) > 0
click Atal'ai Artifact##30854+
|tip They look like various small objects on the ground underwater around this area.
|tip You can find them all around this large lake.
collect 10 Atal'ai Artifact##6175 |q 1424/1 |goto Swamp of Sorrows 67.14,58.70
stickystart "Collect_Draenethyst_Shard"
stickystart "Collect_Draenethyst_Crystals"
step
talk Galen Goodward##5391
|tip This is an escort quest that can be very difficult.
|tip Don't be afraid to let Galen die and run away. |only if hardcore
|tip Methodically clear the camp beside Galen before starting the escort to make it easier.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept Galen's Escape##1393 |goto Swamp of Sorrows 65.41,18.23 |noautoaccept
|only if not Warrior
step
Watch the dialogue
|tip Follow Galen Goodward and protect him as he walks.
|tip He eventually walks to this location.
Escort Galen Out of the Fallow Sanctuary |q 1393/1 |goto Swamp of Sorrows 53.05,29.64
|only if haveq(1393)
step
label "Collect_Draenethyst_Shard"
kill Ongeku##5622
|tip He walks around this area, and can spawn in multiple locations.
|tip This quest was picked up during the Desolace 34-36 guide.
collect Draenethyst Shard##6190 |q 1373/1 |goto Swamp of Sorrows 61.31,23.25
Also check around [65.12,22.22]
step
label "Collect_Draenethyst_Crystals"
click Draenethyst Crystal+
|tip They look like large clusters of blue crystals on the ground around this area.
collect 6 Draenethyst Crystal##6071 |q 1389/1 |goto Swamp of Sorrows 55.74,27.60
You can find more around [63.50,22.72]
step
click Galen's Strongbox
turnin Galen's Escape##1393 |goto Swamp of Sorrows 47.81,39.76
|only if readyq(1393)
step
Enter the building |goto Swamp of Sorrows 47.01,54.13 < 10 |walk
talk Fel'zerul##1443
|tip Upstairs inside the building.
turnin Pool of Tears##1424 |goto Swamp of Sorrows 47.93,54.79
step
talk Hartash##981
buy Falchion##2528 |n
|tip If you can afford it.
|tip You will use it when you reach level 41.
|tip If you have better, skip this step.
Visit the Vendor |vendor Hartash##981 |goto Swamp of Sorrows 45.67,50.92 |q 1116
|only if Rogue and itemcount(2528) == 0
step
talk Magtoor##1776
turnin Draenethyst Crystals##1389 |goto Swamp of Sorrows 25.99,31.40
turnin Noboru the Cudgel##1392 |goto Swamp of Sorrows 25.99,31.40
step
Kill enemies around this area
|tip We want to be level 41 to stay ahead of the level curve.
ding 41 |goto Swamp of Sorrows 40.10,41.95
step
Kill Whelp enemies around this area
|tip They look like tiny flying dragons.
collect 10 Speck of Dream Dust##5803 |q 1116/1 |goto Swamp of Sorrows 14.74,60.20
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells and then we will hearth.
|tip This step will complete when your Hearthstone is ready to use.
Grind XP Until Your Hearth Is Ready |complete C_Container.GetItemCooldown(6948) <= 100 |goto Swamp of Sorrows 14.74,60.20 |q 1116
|only if Druid
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 1116
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
talk Kebok##737
|tip Upstairs inside the building, on the top floor.
turnin Skullsplitter Tusks##209 |goto Stranglethorn Vale 27.00,77.13
step
talk Krazek##773
|tip Upstairs inside the building, on the top floor.
turnin Dream Dust in the Swamp##1116 |goto Stranglethorn Vale 26.94,77.21
step
talk Fleet Master Seahorn##2487
|tip Upstairs, outside on the balcony of the building.
turnin Sunken Treasure##669 |goto Stranglethorn Vale 27.17,77.01
step
Watch the dialogue
talk Krazek##773
|tip Upstairs inside the building, on the top floor.
accept Rumors for Kravel##1117 |goto Stranglethorn Vale 26.94,77.21
accept Tran'rek##2864 |goto Stranglethorn Vale 26.94,77.21
step
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
turnin Venture Company Mining##600 |goto Stranglethorn Vale 27.12,77.21
step
Enter the building |goto Stranglethorn Vale 27.64,77.09 < 7 |walk
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
accept Stoley's Debt##2872 |goto Stranglethorn Vale 27.78,77.07
step
talk Viznik Goldgrubber##2625
|tip Deposit these items into the bank.
bank Goblin Rumors##5804 |goto Stranglethorn Vale 26.54,76.57 |q 1117 |future
bank Elder Crocolisk Skin##4105 |goto Orgrimmar 49.58,69.12 |q 2635 |only if itemcount(4105) > 0
|tip Collect these items from the bank.
collect Frostmaw's Mane##5811 |goto Stranglethorn Vale 26.54,76.57 |q 1136
step
talk Mebok Mizzyrix##3446
turnin Stinky's Escape##1270 |goto The Barrens 62.37,37.62
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 1273 |future
|only if Rogue
step
talk Katis##5816
|tip Inside the building.
buy Blackbone Wand##5239 |n
|tip It costs 3g 48s 58c so don't travel if you don't want to spend the money.
Visit the Vendor |vendor Katis##5816 |goto Orgrimmar 44.17,48.44 |q 1273 |future
|only if Priest
step
talk Ogron##4983
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept Questioning Reethe##1273 |goto Dustwallow Marsh 40.96,36.69 |noautoaccept
step
Watch the dialogue
|tip Follow Ogron and protect him as he walks.
|tip He eventually walks to this location.
Kill the enemies that attack
|tip A group of 4 enemies will attack.
|tip Try to let Ogron tank 1-2 enemies while you kill 2-3 enemies, then help Ogron.
|tip Ogron must survive.
|tip If you have trouble, try to find someone to help you.
Question Reethe with Ogron |q 1273/1 |goto Dustwallow Marsh 42.65,38.07
step
talk Krog##4926
turnin Questioning Reethe##1273 |goto Dustwallow Marsh 36.42,31.88
accept The Black Shield##1276 |goto Dustwallow Marsh 36.42,31.88
step
Enter the building |goto The Barrens 45.35,58.81 < 10 |walk
talk Innkeeper Byula##7714
|tip Inside the building.
home Camp Taurajo |goto The Barrens 45.58,59.04
step
talk Kuna Thunderhorn##3015
buy Massive Longbow##11307 |n
|tip If you can afford it.
|tip It's a limited supply item, so it may not be for sale.
|tip You can't use it until level 42, but it's good to have waiting to use, and you can only buy it in major cities.
|tip We will check vendors for it along the way, if it's not here right now.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kuna Thunderhorn##3015 |goto Thunder Bluff 47.00,45.70 |q 1276
|only if Hunter and itemcount(11307) == 0
step
talk Mosarn##4943
|tip Inside the tent.
turnin The Black Shield##1276 |goto Thunder Bluff 54.01,80.77
step
talk Sage Truthseeker##3978
|tip Inside the building.
turnin Compendium of the Fallen##1049 |goto Thunder Bluff 34.41,46.90
|only if completedq(1049)
step
talk Melor Stonehoof##3441
turnin Frostmaw##1136 |goto Thunder Bluff 61.53,80.90
accept Deadmire##1205 |goto Thunder Bluff 61.53,80.90	|only if not hardcore
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Desolace (41-41)',
  {
    image = ZGV.IMAGESDIR .. 'Desolace',
    condition_suggested = function()
      return level == 41 and not completedq(5581)
    end,
    next = 'Leveling Guides\\Tanaris (41-42)',
    hardcore = true,
  },
  [[
step
talk Taiga Wisemane##11624
accept Portals of the Legion##5581 |goto Desolace 25.81,68.22
step
Leave Shadowprey Village |goto Desolace 26.51,75.12 < 30 |only if walking and subzone("Shadowprey Village")
talk Uthek the Wise##5397
turnin Ongeku##1373 |goto Desolace 36.22,79.25
accept Khan Jehn##1374 |goto Desolace 36.22,79.25
step
kill Khan Jehn##5601
|tip He walks in and out of this tent.
collect Khan Jehn's Head##6072 |q 1374/1 |goto Desolace 66.39,80.08
step
Follow the path up |goto Desolace 44.19,70.30 < 20 |only if walking
Continue up the path |goto Desolace 45.68,70.97 < 20 |only if walking
talk Hornizz Brimbuzzle##6019
accept Ghost-o-plasm Round Up##6134 |goto Desolace 47.83,61.82
step
Follow the path up |goto Desolace 55.50,58.04 < 20 |only if walking
Cross the bridge |goto Desolace 54.73,55.09 < 10 |only if walking
talk Takata Steelblade##5641
accept The Corrupter##1488 |goto Desolace 52.57,54.38
step
use the Crate of Ghost Magnets##15848
|tip Kill any nearby enemies before using it.
|tip Use it next to the huge bones on the ground around this area.
kill Magrami Spectre##11560+
|tip They continuously walk to the spinning green thing that appears on the ground.
|tip They will become hostile when they reach the green thing.
|tip Stand on the large hill nearby to the northwest and pull them away from the green thing to fight them one at a time.
collect 8 Ghost-o-plasm##15849 |q 6134/1 |goto Desolace 63.81,91.27
stickystart "Kill_Lord_Azrethoc"
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 53.17,84.03 |count 1
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 52.70,81.92 |count 2
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 50.96,81.26 |count 3
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 53.11,79.95 |count 4
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 53.90,79.14 |count 5
step
click Demon Portal
|tip These are purple stone circles that spawn all over the area.
|tip They will spawn an enemy shortly after you click on them.
kill Demon Portal Guardian##11937
Banish the Demon Portal |q 5581/1 |goto Desolace 55.07,79.40 |count 6
step
kill Jugkar Grim'rod##5771 |q 1488/2 |goto Desolace 55.91,77.76
|tip Be careful to avoid Lord Azrethoc, a level 40 elite demon that walks around nearby.
step
label "Kill_Lord_Azrethoc"
kill Lord Azrethoc##5760 |q 1488/1 |goto Desolace 56.83,79.69
|tip He looks like a brown winged demon that walks around this area.
|tip He is a level 40 elite, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you, or skip the quest.
|tip Be sure to clear the area around him so you don't accidentally pull extra mobs, this place has a lot of patrols.
You can also find him around [56.80,73.68]
step
Follow the path up |goto Desolace 55.50,58.04 < 20 |only if walking
Cross the bridge |goto Desolace 54.73,55.09 < 10 |only if walking
talk Takata Steelblade##5641
turnin The Corrupter##1488 |goto Desolace 52.57,54.38
step
talk Hornizz Brimbuzzle##6019
turnin Ghost-o-plasm Round Up##6134 |goto Desolace 47.83,61.82
step
talk Uthek the Wise##5397
turnin Khan Jehn##1374 |goto Desolace 36.22,79.25
step
Enter Shadowprey Village |goto Desolace 26.62,75.41 < 30 |only if walking and not subzone("Shadowprey Village")
talk Taiga Wisemane##11624
turnin Portals of the Legion##5581 |goto Desolace 25.81,68.22
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Tanaris (41-42)',
  {
    image = ZGV.IMAGESDIR .. 'Tanaris',
    condition_suggested = function()
      return level >= 41 and level <= 42 and not completedq(1194)
    end,
    next = 'Leveling Guides\\Dustwallow Marsh (42-42)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20
|only if Rogue
step
_NOTE:_
Save Mageweave Cloth in Your Bank as You Level
|tip You are reaching the level where Mageweave Cloth will start to drop regularly
|tip You will need 240 Mageweave Cloth later.
|tip As you level and collect these cloth naturally from killing enemies while following the guide, make sure you deposit the cloth into a bank whenever you are near one.
|tip This will give you about 40,000 quick and easy xp to help you get to level 60 faster in the longer later levels.
Click Here to Continue |confirm
|only if level < 60
step
talk Tran'rek##7876
turnin Tran'rek##2864 |goto Tanaris 51.57,26.76
step
Enter the building |goto Tanaris 52.38,27.91 < 10 |walk
talk Innkeeper Fizzgrimble##7733
|tip Inside the building.
home Gadgetzan |goto Tanaris 52.51,27.91
step
talk Spigot Operator Luglunket##7408
accept Water Pouch Bounty##1707 |goto Tanaris 52.48,28.44
step
talk Chief Engineer Bilgewhizzle##7407
turnin Into the Field##243 |goto Tanaris 52.46,28.51
accept Slake That Thirst##379 |goto Tanaris 52.46,28.51
accept Wastewander Justice##1690 |goto Tanaris 52.46,28.51
step
talk Senior Surveyor Fizzledowser##7724
accept Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
|only if not hardcore
step
use the Untapped Dowsing Widget##8584
|tip Avoid the elite enemies nearby this location while traveling here.
|tip Use it in the water.
|tip Once you get the Tapped Dowsing Widget, run away to safety immediately.
|tip Multiple higher level enemies appear after using the item.
collect Tapped Dowsing Widget##8585 |q 992/1 |goto Tanaris 39.09,29.17
|only if not hardcore
step
talk Senior Surveyor Fizzledowser##7724
turnin Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
|only if not hardcore
stickystart "Collect_Wastewander_Water_Pouches"
stickystart "Kill_Wastewander_Bandits"
stickystart "Kill_Wastewander_Thives"
step
talk Yeh'kinya##8579
accept Screecher Spirits##3520 |goto Tanaris 66.99,22.36
stickystop "Collect_Wastewander_Water_Pouches"
stickystop "Kill_Wastewander_Bandits"
stickystop "Kill_Wastewander_Thives"
step
Enter the building |goto Tanaris 66.99,23.87 < 10 |walk
talk Stoley##7881
|tip Inside the building.
turnin Stoley's Debt##2872 |goto Tanaris 67.11,23.98
stickystart "Kill_Wastewander_Bandits"
stickystart "Kill_Wastewander_Thives"
step
label "Collect_Wastewander_Water_Pouches"
Kill Wastewander enemies around this area
collect 10 Wastewander Water Pouch##8483 |goto Tanaris 59.82,24.34
|tip Be careful not to accidentally sell these to a vendor.
|tip You are gathering extra of these, so you can turn in multiple quests at the same time.
You can find more around [63.51,30.31]
|only if haveq(1707) or haveq(379)
step
label "Kill_Wastewander_Bandits"
kill 10 Wastewander Bandit##5618 |q 1690/1 |goto Tanaris 59.82,24.34
You can find more around [63.51,30.31]
step
label "Kill_Wastewander_Thives"
kill 10 Wastewander Thief##5616 |q 1690/2 |goto Tanaris 59.82,24.34
You can find more around [63.51,30.31]
step
Kill enemies around this area
|tip Getting this far into level 41 will allow you to reach level 42 when you turn in quests soon.
|tip Grinding a bit now will reduce how much you have to grind all at once later to reach level 43.
ding 41,86600 |goto Tanaris 59.82,24.34
You can find more around [63.51,30.31]
step
talk Chief Engineer Bilgewhizzle##7407
turnin Slake That Thirst##379 |goto Tanaris 52.46,28.51
turnin Wastewander Justice##1690 |goto Tanaris 52.46,28.51
step
talk Spigot Operator Luglunket##7408
turnin Water Pouch Bounty##1707 |goto Tanaris 52.48,28.44
step
_Destroy This Item:_
|tip It is no longer needed.
|tip You can loot it to destroy it.
trash Gadgetzan Water Co. Care Package##8484
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Model 4711-FTZ Power Source##8524 |goto Tanaris 52.30,28.91 |q 654 |future
bank Yeh'kinya's Bramble##10699 |goto Tanaris 52.30,28.91 |q 3520 |future
|tip Collect these items from the bank.
collect Goblin Rumors##5804 |goto Tanaris 52.30,28.91 |q 1117
step
talk Kravel Koalbeard##4452
turnin Rumors for Kravel##1117 |goto Thousand Needles 77.79,77.27
step
Watch the dialogue
talk Kravel Koalbeard##4452
accept Back to Booty Bay##1118 |goto Thousand Needles 77.79,77.27
step
talk Fizzle Brassbolts##4454
turnin News for Fizzle##1137 |goto Thousand Needles 78.06,77.13
step
talk Pozzik##4630
accept Keeping Pace##1190 |goto Thousand Needles 80.18,75.88
step
talk Zamek##4709
|tip Click "Complete Quest" to complete "Zamek's Distraction".
Click Here After Completing Zamek's Distraction |confirm |goto Thousand Needles 79.81,77.02 |q 1190
step
Enter the building |goto Thousand Needles 77.52,77.60 < 10 |walk
click Rizzle's Unguarded Plans
|tip Inside the building.
|tip Wait for Rizzle Brassbolts to run out of the building.
turnin Keeping Pace##1190 |goto Thousand Needles 77.22,77.42
accept Rizzle's Schematics##1194 |goto Thousand Needles 77.22,77.42
step
talk Pozzik##4630
turnin Rizzle's Schematics##1194 |goto Thousand Needles 80.18,75.88
step
_Destroy This Item:_
|tip It is no longer needed.
trash Sample of Indurium Ore##5866
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Kravel's Scheme##5826 |goto Tanaris 52.30,28.91 |q 1118 |future
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Dustwallow Marsh (42-42)',
  {
    image = ZGV.IMAGESDIR .. 'Dustwallow Marsh',
    condition_suggested = function()
      return level == 42 and not completedq(1262)
    end,
    next = 'Leveling Guides\\Tanaris (42-43)',
    hardcore = true,
  },
  [[
step
talk Zanara##9552
|tip Buy enough ammo to fill your ammo bag, plus 5 extra stacks.
|tip You have a long grind coming up soon.
Visit the Vendor |vendor Zanara##9552 |goto Dustwallow Marsh 35.50,30.09 |q 1166 |future
|only if Hunter
step
talk Overlord Mok'Morokk##4500
accept Overlord Mok'Morokk's Concern##1166 |goto Dustwallow Marsh 36.30,31.42
step
Enter the cave |goto Dustwallow Marsh 36.83,32.41 < 15 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
accept Identifying the Brood##1169 |goto Dustwallow Marsh 37.15,33.08
step
talk Tharg##4502
accept Army of the Black Dragon##1168 |goto Dustwallow Marsh 37.37,31.39
step
Optional Route Change
|tip You can opt to do Zul'Farrak around level 48 instead of grinding.
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Zul'Farrak, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Zul'Farrak later |confirm ZFflag
Click Here if you'd prefer to grind |confirm
step
map Dustwallow Marsh
path follow strictbounce; loop off; ants curved; dist 30; markers none
path	47.10,51.36	47.61,52.53	47.61,53.26	47.05,54.32	46.40,54.20
path	45.65,52.97	46.41,54.19	47.57,54.87	47.75,55.92	45.92,61.67
path	44.65,62.27	45.91,61.67	47.62,56.05	48.13,55.79	48.92,57.12
path	49.56,56.90	50.94,54.14	50.94,53.28	49.93,52.67
kill Deadmire##4841
|tip He looks like a white crocodile that walks in a large pattern in the water around this area.
|tip He's level 45, but you should be able to kill him at this level.
collect Deadmire's Tooth##5945 |q 1205/1
|only if not hardcore
step
click Gizmorium Shipping Crate##20727
collect Seaforium Booster##5862 |q 1187/1 |goto Dustwallow Marsh 54.07,56.48
step
Kill Muckshell enemies around this area
|tip Underwater.
collect Jeweled Pendant##5942 |q 1261/1 |goto Dustwallow Marsh 56.97,61.32
You can find more around: |notinsticky
[55.05,63.62]
[59.71,67.50]
[60.49,61.94]
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
accept Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if guideflag("ZFflag")
stickystart "Collect_Searing_Tongues"
stickystart "Collect_Searing_Hearts"
stickystart "Kill_Firemane_Scouts"
stickystart "Kill_Firemane_Ash_Tails"
step
Follow the path up |goto Dustwallow Marsh 55.47,65.33 < 30 |only if walking and subzone("Tidefury Cove")
click Mok'Morokk's Snuff##19904
|tip Searing Whelps are ranged attackers that hit fairly hard.	|only if hardcore
collect Mok'Morokk's Snuff##5834 |q 1166/1 |goto Dustwallow Marsh 44.53,66.04
stickystop "Collect_Searing_Tongues"
stickystop "Collect_Searing_Hearts"
step
click Mok'Morokk's Grog##19905
|tip Searing Whelps are ranged attackers that hit fairly hard.	|only if hardcore
collect Mok'Morokk's Grog##5835 |q 1166/2 |goto Dustwallow Marsh 38.67,65.58
stickystart "Kill_Firemane_Scalebanes"
step
Enter the cave |goto Dustwallow Marsh 38.41,66.04 < 15 |walk
Follow the path |goto Dustwallow Marsh 38.61,68.06 < 10 |walk
Continue following the path |goto Dustwallow Marsh 37.29,68.69 < 10 |walk
click Mok'Morokk's Strongbox##19906
|tip Inside the cave.
|tip Watch for patrols and respawns while in the cave.	|only if hardcore
collect Mok'Morokk's Strongbox##5836 |q 1166/3 |goto Dustwallow Marsh 36.64,69.57
stickystart "Collect_Searing_Tongues"
stickystart "Collect_Searing_Hearts"
step
label "Kill_Firemane_Scalebanes"
kill 5 Firemane Scalebane##4328 |q 1168/3 |goto Dustwallow Marsh 37.69,68.03
|tip Inside the cave.
|tip They share spawn points with the other enemies in this cave, so kill those too, if you can't find any.
|tip Keep an eye out for Firemane Ash Tail enemies.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.		|only if hardcore |notinsticky
step
Leave the cave |goto Dustwallow Marsh 38.38,66.07 < 15 |c |q 1168
|only if subzone("The Den of Flame") and _G.IsIndoors()
step
label "Kill_Firemane_Scouts"
kill 15 Firemane Scout##4329 |q 1168/1 |goto Dustwallow Marsh 39.33,65.51
|tip Keep an eye out for Firemane Ash Tail enemies.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.		|only if hardcore |notinsticky
You can find more around: |notinsticky
[42.59,66.78]
[44.80,65.91]
step
label "Kill_Firemane_Ash_Tails"
kill 10 Firemane Ash Tail##4331 |q 1168/2 |goto Dustwallow Marsh 39.33,65.51
|tip Watch for patrols and respawns while here.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[42.59,66.78]
[44.80,65.91]
step
label "Collect_Searing_Tongues"
Kill Searing enemies around this area
|tip They look like small flying dragons.
|tip Keep an eye out for Firemane Ash Tail enemies.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.		|only if hardcore |notinsticky
collect 15 Searing Tongue##5840 |q 1169/1 |goto Dustwallow Marsh 41.65,74.41
You can find more around: |notinsticky
[42.58,80.29]
[47.01,81.34]
step
label "Collect_Searing_Hearts"
Kill Searing enemies around this area
|tip They look like small flying dragons.
|tip Watch for patrols and respawns while here.	|only if hardcore |notinsticky
collect 15 Searing Heart##5841 |q 1169/2 |goto Dustwallow Marsh 41.65,74.41
You can find more around: |notinsticky
[42.58,80.29]
[47.01,81.34]
step
Enter the cave |goto Dustwallow Marsh 36.83,32.42 < 15 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
turnin Identifying the Brood##1169 |goto Dustwallow Marsh 37.15,33.08
step
Watch the dialogue
|tip Inside the cave.
talk Draz'Zilb##4501
accept The Brood of Onyxia##1170 |goto Dustwallow Marsh 37.15,33.08
step
talk Tharg##4502
turnin Army of the Black Dragon##1168 |goto Dustwallow Marsh 37.37,31.39
step
talk Overlord Mok'Morokk##4500
turnin The Brood of Onyxia##1170 |goto Dustwallow Marsh 36.30,31.42
accept The Brood of Onyxia##1171 |goto Dustwallow Marsh 36.30,31.42
turnin Overlord Mok'Morokk's Concern##1166 |goto Dustwallow Marsh 36.30,31.42
step
Enter the cave |goto Dustwallow Marsh 36.83,32.42 < 10 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
turnin The Brood of Onyxia##1171 |goto Dustwallow Marsh 37.15,33.08
step
talk Nazeer Bloodpike##4791
turnin Marg Speaks##1261 |goto Dustwallow Marsh 35.21,30.66
accept Report to Zor##1262 |goto Dustwallow Marsh 35.21,30.66
step
talk Zanara##9552
|tip Buy enough ammo to fill your ammo bag, plus 5-6 extra stacks.
|tip You will be questing a while.
Visit the Vendor |vendor Zanara##9552 |goto Dustwallow Marsh 35.50,30.09 |q 1262
|only if Hunter
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Tanaris (42-43)',
  {
    image = ZGV.IMAGESDIR .. 'Tanaris',
    condition_suggested = function()
      return level == 43 and not completedq(864)
    end,
    next = 'Leveling Guides\\Feralas (43-44)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 1262
|only if Rogue
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Deadmire's Tooth##5945 |goto Tanaris 52.30,28.91 |q 1205 |future |only if not hardcore
bank Seaforium Booster##5862 |goto Tanaris 52.30,28.91 |q 1187 |future
bank Jeweled Pendant##5942 |goto Tanaris 52.30,28.91 |q 1262 |future
|tip Collect these items from the bank.
collect Field Testing Kit##8523 |goto Tanaris 52.30,28.91 |q 654 |future
collect Model 4711-FTZ Power Source##8524 |goto Tanaris 52.30,28.91 |q 654 |future
step
_WARNING:_
|tip Do NOT accept the quest in the next step, if you are not planning to continue for at least 2 more hours.
|tip The quest has a time limit of 2 hours to complete, and it continues counting down even when you're logged out.
|tip It's a lot of work to be able to get the quest again if you fail it.
|tip Also, during this quest, you will collect Samples from various types of creatures.
|tip Don't destroy any of the Untested Samples, even if you don't need them anymore.
|tip This may accidentally abandon the quest.
Click Here to Continue |confirm |q 654 |future
step
use the Model 4711-FTZ Power Source##8524
|tip Use this while you're in Gadgetzan.
|tip It gives you a time limited quest, so you'll want to get started right away.
accept Tanaris Field Sampling##654 |goto Tanaris 51.59,28.85
stickystart "Collect_Acceptable_Hyena_Samples"
stickystart "Collect_Acceptable_Scorpid_Samples"
step
Kill Glasshide enemies around this area
|tip They look like basilisks.
|tip You can find them all throughout Tanaris.
collect Untested Basilisk Sample##9437+ |n
use the Untested Basilisk Sample##9437+
|tip Not all of the samples will be acceptable.
collect 8 Acceptable Basilisk Sample##9440 |q 654/1 |goto Tanaris 45.23,27.79
You can find more around: |notinsticky
[48.76,32.42]
[53.58,32.60]
[54.45,37.96]
[57.95,31.54]
[56.86,25.30]
step
label "Collect_Acceptable_Hyena_Samples"
Kill Blisterpaw enemies around this area
|tip They look like hyenas.
|tip You can find them all throughout Tanaris. |notinsticky
collect Untested Hyena Sample##9439+ |n
use the Untested Hyena Sample##9439+
|tip Not all of the samples will be acceptable. |notinsticky
collect 8 Acceptable Hyena Sample##9441 |q 654/2 |goto Tanaris 45.23,27.79
You can find more around: |notinsticky
[48.76,32.42]
[53.58,32.60]
[54.45,37.96]
[57.95,31.54]
[56.86,25.30]
[49.69,35.71]
step
label "Collect_Acceptable_Scorpid_Samples"
Kill Scorpid enemies around this area
|tip They look like scorpions.
|tip You can find them all throughout Tanaris.|notinsticky
collect Untested Scorpid Sample##9442+ |n
use the Untested Scorpid Sample##9442+
|tip Not all of the samples will be acceptable.|notinsticky
collect 8 Acceptable Scorpid Sample##9438 |q 654/3 |goto Tanaris 45.23,27.79
You can find more around: |notinsticky
[48.76,32.42]
[53.58,32.60]
[54.45,37.96]
[57.95,31.54]
[56.86,25.30]
step
talk Chief Engineer Bilgewhizzle##7407
turnin Tanaris Field Sampling##654 |goto Tanaris 52.46,28.51
accept Return to Apothecary Zinge##864 |goto Tanaris 52.46,28.51
step
_Destroy These Items:_
|tip They are no longer needed.
trash Model 4711-FTZ Power Source##8524 |goto Tanaris 52.21,28.57
trash Untested Basilisk Sample##9437 |goto Tanaris 52.21,28.57
trash Untested Hyena Sample##9439 |goto Tanaris 52.21,28.57
trash Untested Scorpid Sample##9442 |goto Tanaris 52.21,28.57
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Sealed Field Testing Kit##8527 |goto Tanaris 52.30,28.91 |q 864 |future
step
talk Gimblethorn##7799
|tip Inside the building.
|tip Collect these items from the bank.
collect Yeh'kinya's Bramble##10699 |goto Tanaris 52.30,28.91 |q 3520
step
Kill enemies around this area
|tip Follow this path loop and kill enemies as you walk.
|tip You should already be pretty close to reaching level 43.
ding 43 |goto Tanaris 59.82,24.34
You can find more around [63.51,30.31]
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Feralas (43-44)',
  {
    image = ZGV.IMAGESDIR .. 'Feralas',
    condition_suggested = function()
      return level >= 43 and level <= 44 and not completedq(3002)
    end,
    next = 'Leveling Guides\\Stranglethorn Vale (44-45)',
    hardcore = true,
  },
  [[
step
talk Bronk##8158
|tip Bronk sells potions as a limited stock item, they may not be here if another player recently bought them.
Check for Potions |vendor Bronk##8158 |goto Feralas/0 76.08,43.30 |q 2981
step
talk Orwin Gizzmick##8021
accept Gordunni Cobalt##2987 |goto Feralas 75.70,44.30
step
talk Shyn##8020
fpath Camp Mojache |goto Feralas 75.45,44.36
|only if hardcore
stickystart "Accept_Ogres_Of_Feralas"
step
talk Krueg Skullsplitter##4544
accept A New Cloak's Sheen##2973 |goto Feralas 75.94,42.74
step
talk Hadoken Swiftstrider##7875
accept War on the Woodpaw##2862 |goto Feralas 74.91,42.47
step
Enter the building |goto Feralas 74.69,43.00 < 10 |walk
talk Jangdor Swiftstrider##7854
|tip Inside the building.
accept The Mark of Quality##2822 |goto Feralas 74.43,42.91
step
label "Accept_Ogres_Of_Feralas"
talk Rok Orhan##7777
|tip She walks around this area wearing red armor.
turnin A Threat in Feralas##2981 |goto Feralas 76.01,43.51
accept The Ogres of Feralas##2975 |goto Feralas 76.01,43.51
Also check around [73.46,45.68]
step
Enter the building |goto Feralas 74.63,44.69 < 7 |walk
talk Innkeeper Greul##7737
home Camp Mojache |goto Feralas 74.80,45.18
step
Kill Woodpaw enemies around this area
collect 10 Woodpaw Gnoll Mane##9237 |q 2862/1 |goto Feralas 72.71,39.53
You can find more around [72.68,36.94]
stickystart "Collect_Gordunni_Cobalt"
stickystart "Kill_Gordunni_Ogres"
stickystart "Kill_Gordunni_Ogre_Mages"
stickystart "Kill_Gordunni_Brutes"
step
Follow the path up |goto Feralas 74.89,35.26 < 15 |only if walking
Follow the path |goto Feralas 76.29,32.90 < 15 |c |only if walking
|only if not subzone("Gordunni Outpost") and haveq(2978)
step
map Feralas
path follow strict; loop on; ants straight; dist 15
path	75.13,29.73	75.21,28.71	74.51,27.92	79.41,34.81
path 	80.51,34.31	80.81,35.01
click Gordunni Scroll##143980
|tip It looks like a while unrolled scroll.
|tip It can spawn in multiple locations around this ogre area. The arrow will guide you through all possible spawn locations.
collect Gordunni Scroll##9370 |q 2978 |future
step
use the Gordunni Scroll##9370
accept The Gordunni Scroll##2978 |goto Feralas 75.74,33.79
step
label "Collect_Gordunni_Cobalt"
use Orwin's Shovel##9466
|tip Use it next to glowing blue dots on the ground around this area.
|tip You can use it multiple times, one for each blue dot.
click Gordunni Dirt Mound+
|tip They look like piles of dirt that appear on the ground after using Orwin's Shovel.
|tip The dirt mounds will glow blue if they contain the quest item.
|tip Gordunni Ogre Mages are ranged attackers that deal significant damage.	|only if hardcore
collect 12 Gordunni Cobalt##9463 |q 2987/1 |goto Feralas 75.74,33.79
You can find more further along the paths that start at: |notinsticky
[76.00,34.20]
[76.30,33.02]
step
label "Kill_Gordunni_Ogres"
kill 10 Gordunni Ogre##5229 |q 2975/1 |goto Feralas 75.74,33.79
|tip Watch for patrols and respawn while in the area.	|only if hardcore |notinsticky
|tip This is a very good grind area if you don't plan to do any dungeons and want to get some grinding done early. |notinsticky
|tip If you are up for it, just grind here for as long as you can tolerate before getting bored. There is a very long grind at level 46 that this will help with. |notinsticky
You can find more further along the paths that start at: |notinsticky
[76.00,34.20]
[76.30,33.02]
step
label "Kill_Gordunni_Ogre_Mages"
kill 10 Gordunni Ogre Mage##5237 |q 2975/2 |goto Feralas 75.74,33.79
|tip Watch for patrols and respawn while in the area.	|only if hardcore |notinsticky
|tip This is a very good grind area if you don't plan to do any dungeons and want to get some grinding done early. |notinsticky
|tip If you are up for it, just grind here for as long as you can tolerate before getting bored. There is a very long grind at level 46 that this will help with. |notinsticky
You can find more further along the paths that start at: |notinsticky
[76.00,34.20]
[76.30,33.02]
step
label "Kill_Gordunni_Brutes"
kill 5 Gordunni Brute##5232 |q 2975/3 |goto Feralas 75.74,33.79
|tip Watch for patrols and respawn while in the area.	|only if hardcore |notinsticky
|tip This is a very good grind area if you don't plan to do any dungeons and want to get some grinding done early. |notinsticky
|tip If you are up for it, just grind here for as long as you can tolerate before getting bored. There is a very long grind at level 46 that this will help with. |notinsticky
You can find more further along the paths that start at: |notinsticky
[76.00,34.20]
[76.30,33.02]
step
talk Hadoken Swiftstrider##7875
turnin War on the Woodpaw##2862 |goto Feralas 74.91,42.47
accept Alpha Strike##2863 |goto Feralas 74.91,42.46
stickystart "Accept_Dark_Ceremony"
step
talk Orwin Gizzmick##8021
turnin Gordunni Cobalt##2987 |goto Feralas 75.70,44.31
step
label "Accept_Dark_Ceremony"
talk Rok Orhan##7777
|tip She walks around this area wearing red armor.
turnin The Ogres of Feralas##2975 |goto Feralas 76.01,43.51
accept The Ogres of Feralas##2980 |goto Feralas 76.01,43.51
turnin The Gordunni Scroll##2978 |goto Feralas 76.01,43.51
accept Dark Ceremony##2979 |goto Feralas 76.01,43.51
Also check around [73.46,45.68]
step
Enter the building |goto Feralas 74.63,44.69 < 7 |walk
talk Innkeeper Greul##7737
home Camp Mojache |goto Feralas 74.80,45.18
step
kill Sprite Darter##5278+
|tip Try to hurry, you have another quest that is timed.
collect 10 Iridescent Sprite Darter Wing##9369 |q 2973/1 |goto Feralas 70.01,47.07
You can find more around: |notinsticky
[67.77,47.94]
[66.20,47.56]
[64.37,48.63]
step
kill 5 Woodpaw Alpha##5258 |q 2863/1 |goto Feralas 74.34,54.96
|tip There should be 1 Woodpaw Alpha in each of these small camps.
|tip This is a timed quest, so try to hurry.
|tip Enemies tend to bunch together around camps.	|only if hardcore
|tip Skip this step if you are having trouble.		|only if hardcore
You can find more around: |notinsticky
[75.48,56.48]
[73.27,56.17]
[72.40,56.55]
[71.42,55.92]
step
talk Hadoken Swiftstrider##7875
turnin Alpha Strike##2863 |goto Feralas 74.91,42.46
accept Woodpaw Investigation##2902 |goto Feralas 74.91,42.46
step
talk Krueg Skullsplitter##4544
turnin A New Cloak's Sheen##2973 |goto Feralas 75.94,42.74
accept A Grim Discovery##2974 |goto Feralas 75.94,42.74
step
_Destroy This Item:_
|tip It is no longer needed.
trash Iridescent Sprite Darter Wing##9369
step
click Woodpaw Battle Map##142195
turnin Woodpaw Investigation##2902 |goto Feralas 71.63,55.92
accept The Battle Plans##2903 |goto Feralas 71.63,55.92
Approach from here [71.05,56.30]										|only if hardcore
|tip The mob on the left from this side has a chance to pull by itself as opposed to the other 3 at this camp.	|only if hardcore
step
Kill Grimtotem enemies around this area
collect 20 Grimtotem Horn##9460 |q 2974/1 |goto Feralas 67.85,46.40
|tip Enemies may run away in fear at low health.		|only if hardcore
|tip Grimtotem Shaman will heal when their health is low.	|only if hardcore
|tip Watch for patrols and respawns.				|only if hardcore
You can find more around [69.66,39.93]
step
talk Hadoken Swiftstrider##7875
turnin The Battle Plans##2903 |goto Feralas 74.91,42.47
accept Zukk'ash Infestation##7730 |goto Feralas 74.91,42.47
accept Stinglasher##7731 |goto Feralas 74.91,42.47
step
talk Bronk##8158
|tip Bronk sells potions as a limited stock item, they may not be here if another player recently bought them.
Check for Potions |vendor Bronk##8158 |goto Feralas/0 76.08,43.30 |q 2974
step
talk Krueg Skullsplitter##4544
turnin A Grim Discovery##2974 |goto Feralas 75.94,42.74
accept A Grim Discovery##2976 |goto Feralas 75.94,42.74
step
_Destroy This Item:_
|tip It is no longer needed.
trash Grimtotem Horn##9460
step
Enter the building |goto Feralas 74.64,44.70 < 10 |walk
talk Cawind Trueaim##9548
|tip Upstairs, outside on the balcony of the building.
|tip Buy enough ammo to fill your ammo bag, plus 4-5 stacks.
|tip You will be out questing for a while.
Visit the Vendor |vendor Cawind Trueaim##9548 |goto Feralas 74.94,45.71 |q 2976
|only if Hunter
stickystart "Collect_Zukkash_Carapaces"
step
kill Stinglasher##14661
|tip He looks like a flying green bug, flying around this area, with a small green cloud below him.
|tip He's a level 47, but you should be able to kill him at this level.
|tip He sometimes temporarily goes inside the bug caves around this area, but most of the time he's outside.
|tip Ask for help if you think you'll struggle, or skip this quest. |only if hardcore
collect Stinglasher's Glands##18962 |q 7731/1 |goto Feralas 76.98,61.55
He can also be around [Feralas 73.73,63.06]
step
label "Collect_Zukkash_Carapaces"
Kill Zukk'ash enemies around this area
|tip You can find more inside the bug caves around this area.
|tip Watch for patrols and respawns.							|only if hardcore |notinsticky
|tip Zukka'ash Stingers will attempt to do heavy damage when they are about to die.	|only if hardcore |notinsticky
|tip Zukka'ash Workers will attempt to flee at low health.				|only if hardcore |notinsticky
|tip Watch out for Stinglasher while in the area.					|only if hardcore |notinsticky
collect 20 Zukk'ash Carapace##18961 |q 7730/1 |goto Feralas 74.55,62.08
step
Follow the road |goto Feralas 67.56,49.82 < 40 |only if walking and not subzone("High Wilderness")
Kill Screecher enemies around this area
|tip Vale Screechers and Rogue Vale Screechers will count for the quest.
|tip They look like thin red flying serpents.
use Yeh'kinya's Bramble##10699
|tip Use it on their corpses.
talk Screecher Spirit##8612+
|tip They appear after using Yeh'kinya's Bramble on the corpses.
Collect #3# Screecher Spirits |q 3520/1 |goto Feralas 60.77,49.94
You can find more around: |notinsticky
[58.94,51.11]
[56.89,47.94]
[55.67,46.84]
[53.22,46.90]
[52.27,49.13]
stickystart "Kill_Gordunni_Warlocks"
step
kill 5 Gordunni Mauler##5234 |q 2980/3 |goto Feralas 61.00,55.61
|tip Watch for patrols and respawns while in this area.	|only if hardcore
You can find more around [60.77,57.89]
stickystart "Kill_Gordunni_Shamans"
step
kill Gordunni Mage-Lord##5239+
|tip Watch for patrols and respawns while in this area. |only if hardcore
collect Gordunni Orb##9371 |q 2979/1 |goto Feralas 59.67,66.85
step
label "Kill_Gordunni_Shamans"
kill 10 Gordunni Shaman##5236 |q 2980/1 |goto Feralas 59.67,66.85
|tip They share spawn points with the other ogres, so kill those too, if you can't find any. |notinsticky
|tip Watch for patrols and respawns while in this area. |only if hardcore |notinsticky
step
label "Kill_Gordunni_Warlocks"
kill 10 Gordunni Warlock##5240 |q 2980/2 |goto Feralas 59.22,64.15
|tip Watch for patrols and respawns while in this area. |only if hardcore |notinsticky
You can find more around [61.03,55.64]
stickystart "Collect_Long_Elegant_Feathers"
step
Follow the path up |goto Feralas 54.10,68.24 < 40 |only if walking and not subzone("Frayfeather Highlands")
click Hippogryph Egg##141931
collect Hippogryph Egg##8564 |goto Feralas 56.66,75.90 |q 2741 |future
|tip You will use this for a future quest.
|tip Be careful not to accidentally sell this to a vendor.
You can find more around: |notinsticky
[58.49,76.10]
[57.99,76.30]
[58.27,76.72]
[56.66,75.90]
[57.30,77.37]
[57.02,78.21]
step
label "Collect_Long_Elegant_Feathers"
kill Frayfeather Hippogryph##5300+
|tip The other types of Frayfeather enemies will not drop the quest item.
|tip This is for a future quest. The drop rate is very low but grinding here will reduce a grind we have to do later.
collect 10 Long Elegant Feather##4589 |goto Feralas 56.04,62.91 |q 7842 |future
|tip Be careful not to accidentally sell these to a vendor.
step
Kill enemies around this area
|tip You should already be level 44, or very close.
|tip You will be going to Orgrimmar soon, so it will be a good time to learn your level 42 and 44 abilities.
ding 44 |goto Feralas 56.04,62.91
step
Kill Feral Scar enemies around this area
|tip They look like yetis.
|tip Watch for respawns and patrols while in the area. |only if hardcore
collect 10 Thick Yeti Hide##8973 |q 2822/1 |goto Feralas 56.20,57.02
You can find more through the tunnel at [55.14,56.36]
step
use OOX-22/FE Distress Beacon##8705
accept Find OOX-22/FE!##2766 |goto Feralas 53.63,55.29
|only if itemcount(2766) > 0
step
Enter the tunnel |goto Feralas 55.22,56.39 < 15 |only if walking and (subzone("Feral Scar Vale") and not _G.IsIndoors())
talk Homing Robot OOX-22/FE##7807
|tip On the ground, in the outdoor clearing between the tunnel and the cave.
|tip Watch for respawns and patrols while in the area. |only if hardcore
turnin Find OOX-22/FE!##2766 |goto Feralas 53.35,55.70
stickystart "Accept_The_Gordunni_Orb"
step
talk Witch Doctor Uzer'i##8115
accept A Strange Request##3121 |goto Feralas 74.42,43.36
step
Enter the building |goto Feralas 74.69,43.00 < 10 |walk
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin The Mark of Quality##2822 |goto Feralas 74.43,42.91
step
talk Hadoken Swiftstrider##7875
turnin Zukk'ash Infestation##7730 |goto Feralas 74.91,42.47
turnin Stinglasher##7731 |goto Feralas 74.91,42.47
accept Zukk'ash Report##7732 |goto Feralas 74.91,42.47
step
label "Accept_The_Gordunni_Orb"
talk Rok Orhan##7777
|tip She walks around this area wearing red armor.
turnin The Ogres of Feralas##2980 |goto Feralas 76.01,43.51
turnin Dark Ceremony##2979 |goto Feralas 76.01,43.51
accept The Gordunni Orb##3002 |goto Feralas 76.01,43.51
Also check around [73.46,45.68]
step
talk Bronk##8158
|tip Bronk sells potions as a limited stock item, they may not be here if another player recently bought them.
Check for Potions |vendor Bronk##8158 |goto Feralas/0 76.08,43.30 |q 7732
step
Enter the building |goto Orgrimmar 49.86,70.46 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Yeh'kinya's Bramble##10699 |goto Orgrimmar 49.58,69.12 |q 3520 |future
bank Hippogryph Egg##8564 |goto Orgrimmar 49.58,69.12 |q 2741 |future
bank Long Elegant Feather##4589 |goto Orgrimmar 49.58,69.12 |q 7842 |future
|tip Collect these items from the bank.
collect Jeweled Pendant##5942 |goto Orgrimmar 49.58,69.12 |q 1262
step
Run up the stairs |goto Orgrimmar 56.33,56.94 < 10 |only if walking
Enter the building |goto Orgrimmar 57.05,45.87 < 7 |walk
talk Zilzibin Drumlore##7010
|tip Inside the building.
|tip It's on the upper level of buildings.
turnin Zukk'ash Report##7732 |goto Orgrimmar 56.28,46.67
step
talk Belgrom Rockmaul##4485
turnin A Grim Discovery##2976 |goto Orgrimmar 75.23,34.24
step
Enter the building |goto Orgrimmar 40.27,36.98 < 10 |walk
talk Zor Lonetree##4047
|tip Inside the building.
turnin Report to Zor##1262 |goto Orgrimmar 38.93,38.38
accept Service to the Horde##7541 |goto Orgrimmar 38.93,38.38 |instant
step
talk Neeru Fireblade##3216
|tip Inside the tent, inside the Cleft of Shadow.
turnin A Strange Request##3121 |goto Orgrimmar 49.47,50.59
accept Return to Witch Doctor Uzer'i##3122 |goto Orgrimmar 49.47,50.59
step
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 3122
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 3122
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 3122
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 3122
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 3122
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 3122
|tip Inside the building. |only if Warrior or Mage or Priest
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 3002
|only if Rogue
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 3002
|only if Warlock
step
Enter the building |goto Orgrimmar 38.73,83.29 < 10 |walk
talk Uthel'nay##7311
|tip Inside the building.
turnin The Gordunni Orb##3002 |goto Orgrimmar 39.16,86.24
step
Enter the building |goto Orgrimmar 49.86,70.46 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Neeru's Herb Pouch##9628 |goto Orgrimmar 49.58,69.12 |q 3122 |future
|tip Collect these items from the bank.
collect Kravel's Scheme##5826 |goto Orgrimmar 49.58,69.12 |q 1118
collect Elder Crocolisk Skin##4105 |goto Orgrimmar 49.58,69.12 |q 2635
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Stranglethorn Vale (44-45)',
  {
    image = ZGV.IMAGESDIR .. 'Stranglethorn Vale',
    condition_suggested = function()
      return level >= 44 and level <= 45 and not completedq(608)
    end,
    next = 'Leveling Guides\\Swamp of Sorrows (45-46)',
    hardcore = true,
  },
  [[
step
talk Zudd##3624
Train your pet in Grom'gol. |trainer Zudd##3624 |goto Stranglethorn Vale/0 31.13,28.93 |q 197
|only if Hunter
step
talk Kragg##1404
Train your spells. |trainer Kragg##1404 |goto Stranglethorn Vale/0 31.24,28.68 |q 197
|only if Hunter
step
talk Far Seer Mok'thardin##2465
accept Mok'thardin's Enchantment##571 |goto Stranglethorn Vale 32.12,29.24
step
click Bubbling Cauldron
accept Speaking with Gan'zulah##586 |goto Stranglethorn Vale 32.22,27.60
step
kill Tethis##730
|tip He looks like a blue raptor that walks around this area.
|tip He is a level 43 elite, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you.
collect Talon of Tethis##3877 |q 197/1 |goto Stranglethorn Vale 32.22,40.89
You can also find him around: |notinsticky
[31.17,43.40]
[28.74,44.84]
step
kill Bhag'thera##728
|tip He looks like an unstealthed black panther.
|tip He is a level 40 elite, so you should be able to kill him pretty easily.
|tip If you have trouble, try to find someone to help you.
|tip He can spawn in multiple locations.
collect Fang of Bhag'thera##3876 |q 193/1 |goto Stranglethorn Vale 46.37,29.05
Cross this tree bridge to get to the other locations: [48.92,28.04]
You can also find him around: |notinsticky
[49.60,24.03]
[48.99,20.20]
|only if haveq(193)
step
talk Hemet Nesingwary##715
turnin Raptor Mastery##197 |goto Stranglethorn Vale 35.66,10.81
step
talk Sir S. J. Erlgadin##718
turnin Panther Mastery##193 |goto Stranglethorn Vale 35.55,10.55
step
talk Privateer Bloads##2494
|tip He walks around this area.
accept Akiris by the Bundle##617 |goto Stranglethorn Vale 26.76,76.38
He sometimes walks to [27.43,76.78]
step
Enter the building |goto Stranglethorn Vale 27.08,77.62 < 7 |walk
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
turnin Back to Booty Bay##1118 |goto Stranglethorn Vale 27.12,77.21
step
Watch the dialogue
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
accept Zanzil's Secret##621 |goto Stranglethorn Vale 27.12,77.21
step
Cross the bridge |goto Stranglethorn Vale 28.15,76.52 < 10 |only if walking
Enter the building |goto Stranglethorn Vale 28.21,77.33 < 7 |walk
talk Drizzlik##2495
|tip Inside the building.
turnin Excelsior##628 |goto Stranglethorn Vale 28.29,77.59
|only if itemcount(4105) > 0
step
Enter the building |goto Stranglethorn Vale 27.64,77.09 < 7 |walk
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
accept Scaring Shaky##606 |goto Stranglethorn Vale 27.78,77.07
step
talk First Mate Crazz##2490
accept The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 28.10,76.22
step
Enter the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and subzone("Booty Bay")
click Bloodsail Correspondence
|tip You will need to clear the camp, try to pull methodically so you never get more than 1-2 enemies at a time.
|tip The casters do a heavy hitting fireball and the other enemies can net, be careful. |only if hardcore
turnin The Bloodsail Buccaneers##595 |goto Stranglethorn Vale 27.28,69.52
accept The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 27.28,69.52
step
Enter the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not subzone("Booty Bay")
talk First Mate Crazz##2490
turnin The Bloodsail Buccaneers##597 |goto Stranglethorn Vale 28.10,76.21
accept The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 28.10,76.21
step
Enter the building |goto Stranglethorn Vale 27.08,77.62 < 7 |walk
talk Deeg##2488
|tip Upstairs inside the building, on the top floor.
accept Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Fleet Master Seahorn##2487
|tip Upstairs on the balcony of the building.
turnin The Bloodsail Buccaneers##599 |goto Stranglethorn Vale 27.17,77.01
accept The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
step
Run up the ramp and follow the path |goto Stranglethorn Vale 28.07,76.49 < 10 |only if walking
talk Dizzy One-Eye##2493
|tip Outside, next to the building.
accept Keep An Eye Out##576 |goto Stranglethorn Vale 28.59,75.90
stickystart "Collect_Snuff"
stickystart "Collect_Dizzys_Eye"
stickystart "Kill_Bloodsail_Swashbucklers"
step
Enter the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.46 < 15 |only if walking and subzone("Booty Bay")
Follow the path |goto Stranglethorn Vale 32.89,73.75 < 40 |only if walking and not subzone("Wild Shore")
click Bloodsail Charts
|tip It looks like a brown piece of paper.
|tip It can spawn on any of the objects in these 2 small camps.
collect Bloodsail Charts##3920 |q 604/2 |goto Stranglethorn Vale 29.59,80.83
Also check around: |notinsticky
[27.15,82.69]
[27.74,83.13]
step
click Bloodsail Orders
|tip It looks like a white unrolled scroll.
|tip It can spawn on any of the objects in these 2 small camps.
collect Bloodsail Orders##3921 |q 604/3 |goto Stranglethorn Vale 29.59,80.80
Also check around: |notinsticky
[27.18,82.66]
[27.74,83.13]
step
label "Collect_Snuff"
Kill Bloodsail enemies around this area
collect 15 Snuff##3910 |q 587/1 |goto Stranglethorn Vale 27.07,82.90
You can find more around: |notinsticky
[29.78,81.38]
[32.96,73.85]
step
label "Collect_Dizzys_Eye"
Kill Bloodsail enemies around this area
collect Dizzy's Eye##3897 |q 576/1 |goto Stranglethorn Vale 27.07,82.90
You can find more around: |notinsticky
[29.78,81.38]
[32.96,73.85]
step
label "Kill_Bloodsail_Swashbucklers"
kill 10 Bloodsail Swashbuckler##1563 |q 604/1 |goto Stranglethorn Vale 27.07,82.90
You can find more around: |notinsticky
[29.78,81.38]
[32.96,73.85]
stickystart "Collect_Mistvale_Giblets"
step
Follow the path |goto Stranglethorn Vale 32.75,73.68 < 40 |only if walking and subzone("Wild Shore")
kill Elder Mistvale Gorilla##1557+
|tip This has a low drop rate, and can sometimes take a while to get, depending on your luck.
|tip If you reach 20% into level 45 without getting it, skip the quest.
|tip If you don't get it, you will have to skip multiple quests.
collect Aged Gorilla Sinew##3862 |q 571/1 |goto Stranglethorn Vale 31.72,67.03
You can find more around: |notinsticky
[33.79,64.66]
[32.18,59.97]
step
label "Collect_Mistvale_Giblets"
kill Elder Mistvale Gorilla##1557+ |notinsticky
collect 5 Mistvale Giblets##3919 |q 606/1 |goto Stranglethorn Vale 31.72,67.03
You can find more around: |notinsticky
[33.79,64.66]
[32.18,59.97]
step
Kill enemies around this area
|tip You will have to complete some difficult quests soon. It will help to be a level higher.
ding 45 |goto Stranglethorn Vale 31.72,67.03
You can find more around: |notinsticky
[33.79,64.66]
[32.18,59.97]
step
Enter the tunnel to enter Booty Bay |goto Stranglethorn Vale 29.56,72.51 < 15 |only if walking and not subzone("Booty Bay")
talk Dizzy One-Eye##2493
|tip Outside, next to the building.
turnin Keep An Eye Out##576 |goto Stranglethorn Vale 28.59,75.90
step
talk "Shaky" Phillipe##2502
turnin Scaring Shaky##606 |goto Stranglethorn Vale 26.90,73.59
accept Return to MacKinley##607 |goto Stranglethorn Vale 26.90,73.59
step
Enter the building |goto Stranglethorn Vale 27.64,77.09 < 7 |walk
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Return to MacKinley##607 |goto Stranglethorn Vale 27.78,77.07
accept Voodoo Dues##609 |goto Stranglethorn Vale 27.78,77.07
step
Enter the building |goto Stranglethorn Vale 27.08,77.62 < 7 |walk |only if not subzone("The Salty Sailor Tavern")
talk Deeg##2488
|tip Upstairs inside the building, on the top floor.
turnin Up to Snuff##587 |goto Stranglethorn Vale 26.92,77.35
step
talk Fleet Master Seahorn##2487
|tip Upstairs on the balcony of the building.
turnin The Bloodsail Buccaneers##604 |goto Stranglethorn Vale 27.17,77.01
accept The Bloodsail Buccaneers##608 |goto Stranglethorn Vale 27.17,77.01	|only if not hardcore
step
talk Far Seer Mok'thardin##2465
turnin Mok'thardin's Enchantment##571 |goto Stranglethorn Vale 32.12,29.24
accept Mok'thardin's Enchantment##573 |goto Stranglethorn Vale 32.12,29.24
step
Fly to Booty Bay |goto Stranglethorn Vale 26.87,77.10 < 50 |c |q 573
|only if not subzone("Booty Bay")
stickystart "Collect_Akiris_Reeds"
stickystart "Kill_Naga_Explorers"
step
Enter the tunnel to leave Booty Bay |goto Stranglethorn Vale 28.00,73.43 < 15 |only if walking and subzone("Booty Bay")
Follow the path up |goto Stranglethorn Vale 24.87,63.68 < 20 |only if walking and not subzone("Nek'mani Wellspring")
Follow the path up |goto Stranglethorn Vale 25.76,63.47 < 15 |only if walking and not subzone("Nek'mani Wellspring")
Follow the path |goto Stranglethorn Vale 27.35,62.99 < 20 |only if walking and not subzone("Nek'mani Wellspring")
click The Holy Spring
collect Holy Spring Water##737 |q 573/2 |goto Stranglethorn Vale 28.92,61.96
step
label "Collect_Akiris_Reeds"
kill Naga Explorer##1907+
collect 10 Akiris Reed##4029 |q 617/1 |goto Stranglethorn Vale 27.88,62.75
You can find more around: |notinsticky
[27.00,63.02]
[25.43,62.88]
[26.04,60.45]
step
label "Kill_Naga_Explorers"
kill 10 Naga Explorer##1907 |q 573/1 |goto Stranglethorn Vale 27.88,62.75
You can find more around: |notinsticky
[27.00,63.02]
[25.43,62.88]
[26.04,60.45]
stickystart "Collect_Zanzils_Mixture"
step
Cross the bridge |goto Stranglethorn Vale 27.20,58.95 < 20 |only if walking and subzone("Southern Savage Coast")
kill Jon-Jon the Crow##2536
collect Jon-Jon's Golden Spyglass##3925 |q 609/2 |goto Stranglethorn Vale 34.93,51.85
step
kill Maury "Club Foot" Wilkins##2535
collect Maury's Clubbed Foot##3924 |q 609/1 |goto Stranglethorn Vale 35.25,51.26
step
Follow the path |goto Stranglethorn Vale 33.73,53.77 < 30 |only if walking and not subzone("Ruins of Aboraz")
kill Chucky "Ten Thumbs"##2537
collect Chucky's Huge Ring##3926 |q 609/3 |goto Stranglethorn Vale 40.00,58.24
step
label "Collect_Zanzils_Mixture"
Kill Zanzil enemies around this area
|tip Be careful to not attack Zanzil the Outcast in the ruins. He summons a lot of enemies. |only if subzone("Ruins of Aboraz")
|tip If you do happen to pull him, he will evade if you run in the water. |only if subzone("Ruins of Aboraz")
collect 12 Zanzil's Mixture##4016 |q 621/1 |goto Stranglethorn Vale 40.00,58.24
You can find more around [34.12,51.96]
step
Follow the path back to the road |goto Stranglethorn Vale 37.84,56.28 < 20 |only if walking and subzone("Ruins of Aboraz")
kill Ana'thek the Cruel##1059
|tip He patrols the road here with two guards. Clear out a safe area to fight him.
|tip You may have to kill Ana'thek himself then run away if your class isn't capable of fighting 3 enemies or crowd controlling.
|tip Be very careful of patrols in the area. |only if hardcore
collect Broken Armor of Ana'thek##3909 |q 586/4 |goto Stranglethorn Vale/0 45.72,41.23
step
kill Skullsplitter Hunter##669 |q 586/1 |goto Stranglethorn Vale 42.69,36.60
|tip These share spawns with the lower level enemies in the western side of the ruins. |notinsticky
|tip You may have to kill other enemies until they spawn. |notinsticky
|tip Be very careful of patrols in the area. |only if hardcore |notinsticky
You can find more around: |notinsticky
[45.93,32.79]
[47.39,39.42]
[45.33,42.07]
step
kill Skullsplitter Berserker##783 |q 586/3 |goto Stranglethorn Vale/0 47.78,41.90
|tip These share spawns with the higher level enemies in the eastern side of the ruins. |notinsticky
|tip You may have to kill other enemies until they spawn. |notinsticky
|tip Be very careful to not pull multiple enemies and watch for patrols in the area. |only if hardcore |notinsticky
step
kill Skullsplitter Headhunter##781 |q 586/2 |goto Stranglethorn Vale/0 47.78,41.90
|tip These share spawns with the higher level enemies in the eastern side of the ruins. |notinsticky
|tip You may have to kill other enemies until they spawn. |notinsticky
|tip Be very careful to not pull multiple enemies and watch for patrols in the area. |only if hardcore |notinsticky
step
click Bubbling Cauldron
turnin Speaking with Gan'zulah##586 |goto Stranglethorn Vale 32.22,27.60
accept The Fate of Yenniku##588 |goto Stranglethorn Vale 32.22,27.60
step
talk Kin'weelay##2519
turnin The Fate of Yenniku##588 |goto Stranglethorn Vale 32.27,27.71
step
talk Far Seer Mok'thardin##2465
turnin Mok'thardin's Enchantment##573 |goto Stranglethorn Vale 32.12,29.24
step
talk Uthok##1149
|tip Stock up on arrows. |only if Hunter
Vendor your Trash |vendor Uthok##1149 |q 621 |goto Stranglethorn Vale/0 31.55,27.95
step
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
turnin Zanzil's Secret##621 |goto Stranglethorn Vale 27.12,77.21
step
talk Innkeeper Skindle##6807
|tip Inside the building, on the bottom floor.
home Booty Bay |goto Stranglethorn Vale 27.04,77.31
step
Enter the building |goto Stranglethorn Vale 27.64,77.09 < 7 |walk
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Voodoo Dues##609 |goto Stranglethorn Vale 27.78,77.07
step
talk Privateer Bloads##2494
|tip He walks around this area.
turnin Akiris by the Bundle##617 |goto Stranglethorn Vale 26.76,76.38
He sometimes walks to [27.43,76.78]
step
Swim out of Booty Bay |goto Stranglethorn Vale 24.70,75.54 < 40 |only if walking and subzone("Booty Bay")
Run up the ramp to board the ship |goto Stranglethorn Vale 29.89,89.33 < 10 |only if walking
kill Captain Keelhaul##2548 |q 608/2 |goto Stranglethorn Vale 29.20,88.34
|tip He walks around this area, downstairs inside the ship.
|tip On the middle floor.
|tip If you have trouble, try to find someone to help you.
|only if not hardcore
step
click Cortello's Riddle
|tip It looks like a white rolled up scroll.
|tip It can spawn in multiple locations on any floor downstairs inside the ship.
collect Cortello's Riddle##4056 |goto Stranglethorn Vale 29.20,88.60 |q 624 |future |or
|tip
Click Here if the Scroll is Not On This Ship |confirm |or
|only if not (haveq(624) or completedq(624))
|only if not hardcore
step
Run up the ramp to board the ship |goto Stranglethorn Vale 30.17,89.43 < 10 |only if walking
kill Fleet Master Firallon##2546 |q 608/3 |goto Stranglethorn Vale 30.58,90.64
|tip Downstairs inside the ship.
|tip On the middle floor.
|tip He's level 48, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you.
|only if not hardcore
step
click Cortello's Riddle
|tip It looks like a white rolled up scroll.
|tip It can spawn in multiple locations on any floor downstairs inside the ship.
collect Cortello's Riddle##4056 |goto Stranglethorn Vale 30.64,90.17 |q 624 |future |or
|tip
Click Here if the Scroll is Not On This Ship |confirm |or
|only if not (haveq(624) or completedq(624))
|only if not hardcore
step
Run up the ramp to board the ship |goto Stranglethorn Vale 33.66,87.48 < 10 |only if walking
kill Captain Stillwater##2550 |q 608/1 |goto Stranglethorn Vale 32.87,88.20
|tip Downstairs inside the ship.
|tip On the middle floor.
|tip If you have trouble, try to find someone to help you.
|only if not hardcore
step
click Cortello's Riddle
|tip It looks like a white rolled up scroll.
|tip It can spawn in multiple locations on any floor downstairs inside the ship.
collect Cortello's Riddle##4056 |goto Stranglethorn Vale 33.39,88.17 |q 624 |future
|tip If you still can't find it, skip the quest.
|only if not (haveq(624) or completedq(624))
|only if not hardcore
step
use Cortello's Riddle##4056
accept Cortello's Riddle##624 |goto Stranglethorn Vale 27.07,77.28
|only if itemcount(4056) > 0
step
use the Hearthstone##6948
Hearth to Booty Bay |goto Stranglethorn Vale 27.07,77.28 < 30 |noway |c |q 608
|only if subzone("Wild Shore")
step
talk Whiskey Slim##2491
|tip Inside the building, on the bottom floor.
accept Whiskey Slim's Lost Grog##580 |goto Stranglethorn Vale 27.13,77.45
step
talk Fleet Master Seahorn##2487
|tip Upstairs, on the balcony of the building.
turnin The Bloodsail Buccaneers##608 |goto Stranglethorn Vale 27.17,77.00
|only if not hardcore
step
talk Uthok##1149
|tip Buy enough ammo to fill your ammo bag, plus 4-6 extra stacks.
|tip You will be out questing for a while with no arrow vendor nearby.
Visit the Vendor |vendor Uthok##1149 |goto Stranglethorn Vale 31.55,27.95 |q 580
|only if Hunter and not hardcore
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Swamp of Sorrows (45-46)',
  {
    image = ZGV.IMAGESDIR .. 'Swamp of Sorrows',
    condition_suggested = function()
      return level >= 45 and level <= 46 and not completedq(1188)
    end,
    next = 'Leveling Guides\\Tanaris (46-48)',
    hardcore = true,
  },
  [[
step
talk Fallen Hero of the Horde##7572
accept Fall From Grace##2784 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
Select _"Why are you here?"_
Listen to the Tale of Sorrow |q 2784/1 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
turnin Fall From Grace##2784	 |goto Swamp of Sorrows 34.29,66.13
accept The Disgraced One##2621	 |goto Swamp of Sorrows 34.29,66.13
step
click A Soggy Scroll##2553
|tip Underwater, under the bridge.
turnin Cortello's Riddle##624 |goto Swamp of Sorrows 22.86,48.19
accept Cortello's Riddle##625 |goto Swamp of Sorrows 22.86,48.19
|only if not hardcore
step
Enter the building |goto Swamp of Sorrows 46.95,54.07 < 10 |walk
talk Dispatch Commander Ruag##7623
|tip Upstairs inside the building.
turnin The Disgraced One##2621 |goto Swamp of Sorrows 47.79,54.95
accept The Missing Orders##2622 |goto Swamp of Sorrows 47.79,54.95
step
talk Fel'zerul##1443
|tip Upstairs inside the building.
accept The Atal'ai Exile##1429 |goto Swamp of Sorrows 47.93,54.79
step
Enter the building |goto Swamp of Sorrows 45.25,55.33 < 10 |walk
talk Bengor##7643
|tip Inside the building.
turnin The Missing Orders##2622 |goto Swamp of Sorrows 44.98,57.34
step
talk Thultazor##983
|tip He can sell potions as a limited stock item, they may not be up.
Check for Potions |vendor Thultazor##983 |q 699 |goto Swamp of Sorrows/0 45.78,52.85
step
kill Sawtooth Snapper##1087+
collect 6 Sawtooth Snapper Claw##6168 |q 699/1 |goto Swamp of Sorrows 75.12,18.47
You can find more around [83.03,33.42]
step
talk Tok'Kar##5592
turnin Lack of Surplus##699 |goto Swamp of Sorrows 81.32,80.97
accept Threat From the Sea##1422 |goto Swamp of Sorrows 81.32,80.97
step
talk Katar##5593
turnin Threat From the Sea##1422 |goto Swamp of Sorrows 83.75,80.42
accept Threat From the Sea##1426 |goto Swamp of Sorrows 83.75,80.42
stickystart "Kill_Marsh_Flesheaters"
stickystart "Kill_Marsh_Inkspewers"
step
kill 10 Marsh Murloc##747 |q 1426/1 |goto Swamp of Sorrows 82.88,91.02
|tip You can only find them around the most southern part of the beach.
step
label "Kill_Marsh_Flesheaters"
kill 10 Marsh Flesheater##751 |q 1426/3 |goto Swamp of Sorrows 82.88,91.02
|tip You can find them all along the beach |notinsticky
|tip They tend to spawn near the turtle corpses. |notinsticky
|tip They share spawns with other murlocs in the area and are rarer, you may have to kill quite a few to make them spawn. |notinsticky
You can find more around: |notinsticky
[87.69,78.14]
[93.46,61.21]
step
label "Kill_Marsh_Inkspewers"
kill 10 Marsh Inkspewer##750 |q 1426/2 |goto Swamp of Sorrows 82.88,91.02
|tip You can find them all along the southern half of the beach. |notinsticky
You can find more around: |notinsticky
[87.69,78.14]
[93.46,61.21]
step
talk Katar##5593
turnin Threat From the Sea##1426 |goto Swamp of Sorrows 83.76,80.43
accept Threat From the Sea##1427 |goto Swamp of Sorrows 83.76,80.43
step
talk Tok'Kar##5592
turnin Threat From the Sea##1427 |goto Swamp of Sorrows 81.31,80.97
step
talk Katar##5593
accept Continued Threat##1428 |goto Swamp of Sorrows 83.76,80.41
stickystart "Kill_Marsh_Flesheaters_1428"
stickystart "Kill_Marsh_Oracles_1428"
step
kill 10 Marsh Inkspewer##750 |q 1428/1 |goto Swamp of Sorrows 66.15,76.96
|tip Inside the cave.
|tip They share spawn points with the other murlocs, so kill those too.
|tip Watch for patrols and respawns.	|only if hardcore
|tip Be careful to avoid Swamp Talker, a level 50 grey murloc that can spawn in multiple locations inside the cave.
step
label "Kill_Marsh_Flesheaters_1428"
kill 10 Marsh Flesheater##751 |q 1428/2 |goto Swamp of Sorrows 63.32,84.96
|tip Inside the cave. |notinsticky
|tip They share spawn points with the other murlocs, so kill those too. |notinsticky
|tip Watch for patrols and respawns.	|only if hardcore |notinsticky
|tip Be careful to avoid Swamp Talker, a level 50 grey murloc that can spawn in multiple locations inside the cave. |notinsticky
step
label "Kill_Marsh_Oracles_1428"
kill 10 Marsh Oracle##752 |q 1428/3 |goto Swamp of Sorrows 63.32,84.96
|tip Inside the cave. |notinsticky
|tip They share spawn points with the other murlocs, so kill those too. |notinsticky
|tip Watch for patrols and respawns.	|only if hardcore |notinsticky
|tip Be careful to avoid Swamp Talker, a level 50 grey murloc that can spawn in multiple locations inside the cave. |notinsticky
step
Leave the cave |goto Swamp of Sorrows 66.37,76.54 < 20 |walk |only if subzone("Stagalbog Cave")
talk Katar##5593
turnin Continued Threat##1428 |goto Swamp of Sorrows 83.75,80.42
step
Kill enemies around this area
|tip You need to be level 46 to be able to accept a quest soon.
ding 46 |goto Swamp of Sorrows 82.88,91.02
You can find more around: |notinsticky
[87.69,78.14]
[93.46,61.21]
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells and then we will hearth.
|tip This step will complete when your Hearthstone is ready to use.
Grind XP Until Your Hearth Is Ready |complete C_Container.GetItemCooldown(6948) <= 100 |goto Swamp of Sorrows 82.88,91.02 |q 1187
|only if Druid
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 1187
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
_WARNING:_
|tip Do NOT accept the quest in the next step, if you are not planning to continue for at least 30 minutes more.
|tip The quest has a time limit of 2 hours to complete, and it continues counting down even when you're logged out.
|tip You will turn the quest in shortly, so you don't need the full 2 hours.
Click Here to Continue |confirm |q 1119 |future
step
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
accept Zanzil's Mixture and a Fool's Stout##1119 |goto Stranglethorn Vale 27.12,77.21
step
talk Viznik Goldgrubber##2625
|tip Deposit these items into the bank.
bank Bundle of Atal'ai Artifacts##6193 |goto Stranglethorn Vale 26.54,76.57 |q 1429 |future
|tip Collect these items from the bank.
collect Seaforium Booster##5862 |goto Stranglethorn Vale 26.54,76.57 |q 1187
collect Yeh'kinya's Bramble##10699 |goto Stranglethorn Vale 26.54,76.57 |q 3520
collect Hippogryph Egg##8564 |goto Stranglethorn Vale 26.54,76.57 |q 2741 |future
collect Neeru's Herb Pouch##9628 |goto Stranglethorn Vale 26.54,76.57 |q 3122
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 3122
|only if Rogue
step
talk Witch Doctor Uzer'i##8115
turnin Return to Witch Doctor Uzer'i##3122 |goto Feralas 74.42,43.36
step
Watch the dialogue
talk Witch Doctor Uzer'i##8115
accept Testing the Vessel##3123 |goto Feralas 74.42,43.36
accept The Sunken Temple##3380 |goto Feralas 74.42,43.36
step
talk Kravel Koalbeard##4452
turnin Zanzil's Mixture and a Fool's Stout##1119 |goto Thousand Needles 77.79,77.27
step
Watch the dialogue
talk Kravel Koalbeard##4452
accept Get the Gnomes Drunk##1120 |goto Thousand Needles 77.79,77.27
step
talk Gnome Pit Boss##4495
turnin Get the Gnomes Drunk##1120 |goto Thousand Needles 77.56,76.94
step
talk Kravel Koalbeard##4452
accept Report Back to Fizzlebub##1122 |goto Thousand Needles 77.79,77.27
step
talk Razzeric##4706
turnin Razzeric's Tweaking##1187 |goto Thousand Needles 80.33,76.10
accept Safety First##1188 |goto Thousand Needles 80.33,76.10
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Tanaris (46-48)',
  {
    image = ZGV.IMAGESDIR .. 'Tanaris',
    condition_suggested = function()
      return level >= 46 and level <= 48 and not completedq(32)
    end,
    next = 'Leveling Guides\\Dustwallow Marsh (48-48)',
    hardcore = true,
  },
  [[
step
talk Shreev##4708
turnin Safety First##1188 |goto Tanaris 50.96,27.24
step
talk Senior Surveyor Fizzledowser##7724
accept Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
|only if hardcore
step
use the Untapped Dowsing Widget##8584
|tip Avoid the elite enemies nearby this location while traveling here.
|tip Use it in the water.
|tip Once you get the Tapped Dowsing Widget, run away to safety immediately.
|tip Multiple higher level enemies appear after using the item.
collect Tapped Dowsing Widget##8585 |q 992/1 |goto Tanaris 39.09,29.17
|only if hardcore
step
talk Senior Surveyor Fizzledowser##7724
turnin Gadgetzan Water Survey##992 |goto Tanaris 50.21,27.48
accept Noxious Lair Investigation##82 |goto Tanaris 50.21,27.48
|only if hardcore
step
talk Senior Surveyor Fizzledowser##7724
accept Noxious Lair Investigation##82 |goto Tanaris 50.21,27.48
|only if not hardcore
step
talk Tran'rek##7876
accept Thistleshrub Valley##3362 |goto Tanaris 51.57,26.76
step
click Wanted Poster##142122
accept WANTED: Caliph Scorpidsting##2781 |goto Tanaris 51.84,27.02
accept WANTED: Andre Firebeard##2875 |goto Tanaris 51.84,27.02
step
click Egg-O-Matic##142071
accept The Super Egg-O-Matic##2741 |goto Tanaris 52.37,26.97 |instant
step
_Open This Item:_
|tip Open it for rewards, its no longer needed.
|tip You can turn in the egg for Curgle Cranklehop next to the Egg-o-Matic.
trash Egg Crate##8647 |goto Tanaris/0 52.36,26.90
step
talk Andi Lynn##11758
accept The Dunemaul Compound##5863 |goto Tanaris 52.82,27.40
step
Enter the building |goto Tanaris 52.38,27.91 < 10 |walk
talk Innkeeper Fizzgrimble##7733
|tip Inside the building.
home Gadgetzan |goto Tanaris 52.51,27.92
step
talk Dirge Quikcleave##8125
Buy Food and Water |vendor Dirge Quikcleave##8125 |goto Tanaris/0 52.63,28.11 |q 5863
step
talk Chief Engineer Bilgewhizzle##7407
accept More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Wildkin Muisek Vessel##9618 |goto Tanaris 52.30,28.91 |q 3123 |future
bank Fool's Stout Report##5807 |goto Tanaris 52.30,28.91 |q 1122 |future
step
talk Marin Noggenfogger##7564
accept The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
step
talk Haughty Modiste##15165
accept Pirate Hats Ahoy!##8365 |goto Tanaris 66.56,22.27
step
talk Yeh'kinya##8579
turnin Screecher Spirits##3520 |goto Tanaris 66.99,22.36
step
step
talk Jabbey##8139
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 10-15 extra stacks.
|tip You have a very long grind coming up soon.
Visit the Vendor |vendor Jabbey##8139 |goto Tanaris 67.01,21.99 |q 8365
|only if Hunter
step
Enter the building |goto Tanaris 66.99,23.87 < 10 |walk
talk Security Chief Bilgewhizzle##7882
|tip Inside the building.
accept Southsea Shakedown##8366 |goto Tanaris 67.06,23.89
step
talk Stoley##7881
|tip Inside the building.
accept Stoley's Shipment##2873 |goto Tanaris 67.11,23.98
stickystart "Kill_Wastewander_Rogues"
stickystart "Kill_Wastewander_Assassins"
stickystart "Kill_Wastewander_Shadow_Mages"
step
path	follow loose;	loop;	ants curved;	dist 40
path	63.84,31.89		63.30,37.23		62.29,37.83		59.52,41.19
path	58.71,38.17		61.87,33.42
kill Caliph Scorpidsting##7847
|tip He walks in a counter-clockwise pattern, so this path will help you find him faster.
|tip He walks with 2 stealthed guards with him, so be careful.
|tip If you have trouble, try to find someone to help you.
collect Caliph Scorpidsting's Head##8723 |q 2781/1
step
label "Kill_Wastewander_Rogues"
kill 8 Wastewander Rogue##5615 |q 1691/1 |goto Tanaris 60.87,32.74
|tip They are stealthed around this area.
|tip Watch out for Caliph Scorpidsting, who patrols around this area.	|only if hardcore |notinsticky
|tip Wasteland Shadow Mages are ranged attackers that come with a pet.	|only if hardcore |notinsticky
|tip Wastewander Assassins can execute you if you are below 20% health. |only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more around: |notinsticky
[61.84,34.67]
[59.99,37.02]
[58.85,36.63]
[58.81,39.22]
[60.52,39.06]
[63.40,37.65]
[64.43,39.57]
[65.32,36.89]
step
label "Kill_Wastewander_Assassins"
kill 6 Wastewander Assassin##5623 |q 1691/2 |goto Tanaris 60.87,32.74
|tip Watch out for Caliph Scorpidsting, who patrols around this area.	|only if hardcore |notinsticky
|tip Be careful of stealthed enemies around this area.			|only if hardcore |notinsticky
|tip Wasteland Shadow Mages are ranged attackers that come with a pet.	|only if hardcore |notinsticky
|tip Wastewander Assassins can execute you if you are below 20% health. |only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more around: |notinsticky
[61.84,34.67]
[59.99,37.02]
[58.85,36.63]
[58.81,39.22]
[60.52,39.06]
[63.40,37.65]
[64.43,39.57]
[65.32,36.89]
step
label "Kill_Wastewander_Shadow_Mages"
kill 10 Wastewander Shadow Mage##5617 |q 1691/3 |goto Tanaris 60.87,32.74
|tip Watch out for Caliph Scorpidsting, who patrols around this area.	|only if hardcore |notinsticky
|tip Be careful of stealthed enemies around this area.			|only if hardcore |notinsticky
|tip Wastewander Assassins can execute you if you are below 20% health. |only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more around: |notinsticky
[61.84,34.67]
[59.99,37.02]
[58.85,36.63]
[58.81,39.22]
[60.52,39.06]
[63.40,37.65]
[64.43,39.57]
[65.32,36.89]
stickystart "Collect_Southsea_Pirate_Hats"
stickystart "Kill_Southsea_Pirates"
stickystart "Kill_Southsea_Freebooters"
stickystart "Kill_Southsea_Dock_Workers"
stickystart "Kill_Southsea_Swashbucklers"
stickystart "Collect_Ship_Schedule"
step
Enter the tunnel |goto Tanaris 68.62,41.46 < 20 |only if walking and not subzone("Lost Rigger Cove")
Enter the building |goto Tanaris 72.61,46.82 < 10 |walk
click Stolen Cargo
|tip Upstairs inside the building.
collect Stoley's Shipment##9244 |q 2873/1 |goto Tanaris 72.19,46.77
step
kill Andre Firebeard##7883
|tip Try to pull him with as few other enemies as possible. You may have to kill him then run away til the adds reset.
|tip If you have trouble, try to find someone to help you.
collect Firebeard's Head##9246 |q 2875/1 |goto Tanaris 73.37,47.14
step
label "Collect_Southsea_Pirate_Hats"
Kill Southsea enemies around this area
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
collect 20 Southsea Pirate Hat##20519 |q 8365/1 |goto Tanaris 73.26,46.42
You can find more around [72.29,44.64]
step
label "Kill_Southsea_Pirates"
kill 10 Southsea Pirate##7855 |q 8366/1 |goto Tanaris 73.26,46.42
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more around [72.29,44.64]
step
label "Kill_Southsea_Freebooters"
kill 10 Southsea Freebooter##7856 |q 8366/2 |goto Tanaris 73.26,46.42
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more around [72.29,44.64]
step
label "Kill_Southsea_Dock_Workers"
kill 10 Southsea Dock Worker##7857 |q 8366/3 |goto Tanaris 73.76,47.42
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
|tip You can find more up on the wooden platforms nearby.
step
label "Kill_Southsea_Swashbucklers"
kill 10 Southsea Swashbuckler##7858 |q 8366/4 |goto Tanaris 75.19,45.96
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
You can find more in the buildings around [72.96,47.07]
step
label "Collect_Ship_Schedule"
Kill Southsea enemies around this area
|tip Enemies may will flee when at low health.				|only if hardcore |notinsticky
|tip Avoid entering buildings when possible.				|only if hardcore |notinsticky
|tip Enemies tend to bunch up and pull in groups inside them.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while here.				|only if hardcore |notinsticky
collect Pirate's Footlocker##9276 |n
use Pirate's Footlocker##9276+
collect Ship Schedule##9250 |goto Tanaris 73.26,46.42 |q 2876 |future
|tip It may take a long time to get it, but this is a good grind to do to get a lot of extra xp built up.
|tip If you reach level 47 before you get it, skip the quest.
|tip Note: Other players can find Ship Schedules and trade you footlockers with it inside, as it is only soulbound once they loot it from the footlocker. |only if not selfmade
You can find more around [72.29,44.64]
step
Run through the tunnel to leave Lost Rigger Cove |goto Tanaris 69.78,42.46 < 15 |only if walking and subzone("Lost Rigger Cove")
Kill Wastewander enemies around this area
|tip You are about to have to kill a lot of level 48-50 enemies soon, so being a level higher will make it more manageable.
|tip We will turn in the quests you've completed later, to earn a large chunk of experience toward getting to level 48.
|tip Alternatively, you could run some dungeons instead, if you prefer.
|tip If you choose to grind, on the bright side, you'll be increasing your rep with Gadgetzan.
collect Wastewander Water Pouch##8483+ |n
|tip You can turn in stacks of 5 water pouches in Gadgetzan for 380 xp.
|tip Collect enough stacks of them so that when you turn them in after grinding, you will hit level 47.
|tip If you need to sell items while grinding, kill enemies as you walk to and from Gadgetzan.
ding 47 |goto Tanaris 62.72,36.93
You can find more around [60.32,37.26]
Turn the Water Pouches in at [52.49,28.45]
You can sell items in Gadgetzan at [51.46,28.81]
You can buy arrows at [67.01,21.99]
step
talk Chief Engineer Bilgewhizzle##7407
turnin WANTED: Caliph Scorpidsting##2781 |goto Tanaris 52.46,28.51
turnin More Wastewander Justice##1691 |goto Tanaris 52.46,28.51
step
talk Spigot Operator Luglunket##7408
turnin Water Pouch Bounty##1878 |goto Tanaris 52.48,28.44
|only if itemcount(8483) >= 5
step
talk Dirge Quikcleave##8125
Buy Food and Water |vendor Dirge Quikcleave##8125 |goto Tanaris/0 52.63,28.11 |q 3380
step
talk Marvon Rivetseeker##7771
turnin The Sunken Temple##3380 |goto Tanaris 52.71,45.93
accept The Stone Circle##3444 |goto Tanaris 52.71,45.93
accept Gahz'ridian##3161 |goto Tanaris 52.71,45.93
step
Kill Centipaar enemies around this area
|tip Centipaar Workers may flee quickly when they are at low health.	|only if hardcore
|tip Centipaar Swarmers will spawn adds the longer they are alive.	|only if hardcore
collect 5 Centipaar Insect Parts##8587 |q 82/1 |goto Tanaris 35.74,42.06
stickystart "Kill_Dunemaul_Brutes"
stickystart "Kill_Dunemaul_Enforcers"
step
Enter the cave |goto Tanaris 41.09,57.35 < 20 |walk
kill Gor'marok the Ravager##12046 |q 5863/3 |goto Tanaris 41.50,57.81
|tip Inside the small cave.
step
click Gahz'ridian+
|tip They look like small piles of sand on the ground around this area.
collect 30 Gahz'ridian Ornament##8443 |q 3161/1 |goto Tanaris 40.45,72.67
You can find more around [46.96,65.87]
step
label "Kill_Dunemaul_Brutes"
kill 10 Dunemaul Brute##5474 |q 5863/1 |goto Tanaris 40.45,72.67
You can find more around: |notinsticky
[46.96,65.87]
[40.04,55.70]
step
label "Kill_Dunemaul_Enforcers"
kill 10 Dunemaul Enforcer##5472 |q 5863/2 |goto Tanaris 40.45,72.67
You can find more around: |notinsticky
[46.96,65.87]
[40.04,55.70]
step
Prepare for Zul'Farrak
|tip It will be a good time to start Zul'Farrak soon.
|tip You should run it after the next 2 quests, roughly 30 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("ZFflag")
stickystart "Kill_Gnarled_Thistleshrubs"
stickystart "Kill_Thistleshrub_Rootshapers"
step
kill Thistleshrub Dew Collector##5481+
collect Laden Dew Gland##8428 |q 2605/1 |goto Tanaris 29.97,66.48
You can find more around: |notinsticky
[28.18,64.79]
[30.54,64.66]
step
label "Kill_Gnarled_Thistleshrubs"
kill 8 Gnarled Thistleshrub##5490 |q 3362/1 |goto Tanaris 29.97,66.48
You can find more around: |notinsticky
[28.18,64.79]
[30.54,64.66]
step
label "Kill_Thistleshrub_Rootshapers"
kill 8 Thistleshrub Rootshaper##5485 |q 3362/2 |goto Tanaris 29.97,66.48
You can find more around: |notinsticky
[28.18,64.79]
[30.54,64.66]
step
talk Tooga##5955
|tip He looks like a turtle that walks around this area.
|tip This is an escort quest.
|tip If you can't find him, someone may be escorting him.
|tip Just keep grinding enemies around this area until you find him.
accept Tooga's Quest##1560 |goto Tanaris 28.50,63.10 |noautoaccept
Also check around: |notinsticky
[29.97,66.48]
[30.54,64.66]
[31.79,74.15]
[29.58,74.73]
stickystart "Lead_Tooga_To_Torta"
step
talk Marvon Rivetseeker##7771
turnin Gahz'ridian##3161 |goto Tanaris 52.71,45.93 |notravel |only if haveq(1560)
turnin Gahz'ridian##3161 |goto Tanaris 52.71,45.93 |only if not haveq(1560)
step
label "Lead_Tooga_To_Torta"
Lead Tooga to Torta |q 1560/1 |goto Tanaris 66.57,25.67 |notravel
|tip He will follow you.
|tip Protect Tooga as you walk, and try to stay fairly close to him.
|tip If you get too far away from him, you will fail the quest.
|tip Torta looks like a turtle that walks around this area.
step
talk Torta##6015
|tip She looks like a turtle that walks around this area.
turnin Tooga's Quest##1560 |goto Tanaris 66.57,25.67
step
Enter the building |goto Tanaris 66.99,23.87 < 10 |walk
talk Security Chief Bilgewhizzle##7882
|tip Inside the building.
turnin WANTED: Andre Firebeard##2875 |goto Tanaris 67.06,23.89
turnin Southsea Shakedown##8366 |goto Tanaris 67.06,23.89
step
use the Ship Schedule##9250
accept Ship Schedules##2876 |goto Tanaris 67.06,23.89
|only if itemcount(9250) > 0
step
talk Security Chief Bilgewhizzle##7882
turnin Ship Schedules##2876 |goto Tanaris 67.06,23.89
|only if haveq(2876)
step
talk Stoley##7881
|tip Inside the building.
turnin Stoley's Shipment##2873 |goto Tanaris 67.11,23.97
accept Deliver to MacKinley##2874 |goto Tanaris 67.11,23.97
step
talk Haughty Modiste##15165
turnin Pirate Hats Ahoy!##8365 |goto Tanaris 66.56,22.27
step
talk Jabbey##8139
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag.
|tip You have a very long grind coming up soon.
Visit the Vendor |vendor Jabbey##8139 |goto Tanaris 67.01,21.99 |q 284
|only if Hunter
step
talk Yeh'kinya##8579
accept The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
|only if guideflag("ZFflag")
step
talk Chief Engineer Bilgewhizzle##7407
accept Divino-matic Rod##2768 |goto Tanaris 52.46,28.51
|only if guideflag("ZFflag")
step
talk Tran'rek##7876
accept Scarab Shells##2865 |goto Tanaris 51.57,26.76
|only if guideflag("ZFflag")
step
talk Trenton Lighthammer##7804
accept Troll Temper##3042 |goto Tanaris 51.42,28.75
|only if guideflag("ZFflag")
step
talk Wizzle Brassbolts##4453
|tip This quest can only be completed if someone in your group has the "Mallet of Zul'Farrak" which is very difficult to obtain.
|tip Ask if anyone has the mallet before running off to accept this.
accept Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
|only if guideflag("ZFflag")
step
Run Zul'Farrak
|tip You can use our Zul'Farrak guide if you want assistance.
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Zul'Farrak turnin guide.
|loadguide "Dungeon Guides\\Zul'Farrak (44-49)"
|confirm
|only if guideflag("ZFflag")
step
talk Wizzle Brassbolts##4453
turnin Gahz'rilla##2770 |goto Thousand Needles 78.14,77.11
|only if guideflag("ZFflag")
step
talk Yeh'kinya##8579
turnin The Prophecy of Mosh'aru##3527 |goto Tanaris 66.98,22.36
|only if guideflag("ZFflag")
step
talk Chief Engineer Bilgewhizzle##7407
turnin Divino-matic Rod##2768 |goto Tanaris 52.46,28.51
|only if guideflag("ZFflag")
step
talk Tran'rek##7876
turnin Scarab Shells##2865 |goto Tanaris 51.57,26.76
|only if guideflag("ZFflag")
step
talk Trenton Lighthammer##7804
turnin Troll Temper##3042 |goto Tanaris 51.42,28.75
|only if guideflag("ZFflag")
step
Kill enemies around this area
|tip Getting this far into level 47 will allow you to reach level 48 when you turn in quests soon.
|tip You will be going to an insect cave area soon that can be pretty difficult, so being a level higher will help.
|tip As you start getting close to completing this step, start making your way toward Gadgetzan.
|tip Don't use your hearthstone to return to Gadgetzan for the next steps, you will use it at another location very soon.
ding 47,112000 |goto Tanaris 60.87,32.74
You can find more around: |notinsticky
[61.84,34.67]
[59.99,37.02]
[58.85,36.63]
[58.81,39.22]
[60.52,39.06]
[63.40,37.65]
[64.43,39.57]
[65.32,36.89]
step
talk Marin Noggenfogger##7564
turnin The Thirsty Goblin##2605 |goto Tanaris 51.81,28.66
accept In Good Taste##2606 |goto Tanaris 51.81,28.66
step
talk Sprinkle##7583
turnin In Good Taste##2606 |goto Tanaris 51.06,26.87
accept Sprinkle's Secret Ingredient##2641 |goto Tanaris 51.06,26.87
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Noxious Lair Investigation##82 |goto Tanaris 50.89,26.96
step
talk Senior Surveyor Fizzledowser##7724
accept The Scrimshank Redemption##10 |goto Tanaris 50.21,27.48
step
talk Tran'rek##7876
turnin Thistleshrub Valley##3362 |goto Tanaris 51.57,26.76
step
talk Andi Lynn##11758
turnin The Dunemaul Compound##5863 |goto Tanaris 52.82,27.40
step
Follow the path down |goto Tanaris 55.87,70.27 < 30 |only if walking
Enter the cave |goto Tanaris 55.78,68.91 < 10 |c |q 10
step
Follow the path down |goto Tanaris 55.93,68.37 < 7 |walk
Continue following the path down |goto Tanaris 56.17,68.34 < 7 |walk
Follow the path |goto Tanaris 56.55,68.72 < 7 |walk
Follow the path up |goto Tanaris 57.19,70.16 < 7 |walk
Follow the path down |goto Tanaris 57.61,70.67 < 7 |walk
Follow the path |goto Tanaris 57.38,71.30 < 7 |walk
click Scrimshank's Surveying Gear##144053
|tip Inside the cave.
|tip Hazzali Workers may run away quickly when low health.	|only if hardcore
|tip Hazzali Swarmers may spawn adds while you fight them.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.		|only if hardcore
collect Scrimshank's Surveying Gear##8593 |q 10/1 |goto Tanaris 55.97,71.18
step
use the OOX-17/TN Distress Beacon##8623
accept Find OOX-17/TN!##351 |goto Tanaris 60.23,64.72
|only if itemcount(8623) > 0
step
talk Homing Robot OOX-17/TN##7784
turnin Find OOX-17/TN!##351 |goto Tanaris 60.23,64.72
step
talk Senior Surveyor Fizzledowser##7724
turnin The Scrimshank Redemption##10 |goto Tanaris 50.21,27.48
accept Insect Part Analysis##110 |goto Tanaris 50.21,27.48
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Insect Part Analysis##110 |goto Tanaris 50.89,26.96
accept Insect Part Analysis##113 |goto Tanaris 50.89,26.96
step
talk Senior Surveyor Fizzledowser##7724
turnin Insect Part Analysis##113 |goto Tanaris 50.21,27.48
accept Rise of the Silithid##32 |goto Tanaris 50.21,27.48
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Deposit these items into the bank.
bank Stoley's Bottle##9245 |goto Tanaris 52.30,28.91 |q 2874 |future
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Dustwallow Marsh (48-48)',
  {
    image = ZGV.IMAGESDIR .. 'Dustwallow Marsh',
    condition_suggested = function()
      return level == 48 and not completedq(4300)
    end,
    next = 'Leveling Guides\\The Hinterlands (48-49)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 1172 |future
|only if Rogue
step
talk Melor Stonehoof##3441
accept Deadmire##1205 |goto Thunder Bluff 61.53,80.90
|only if hardcore
step
Enter the cave |goto Dustwallow Marsh 36.84,32.43 < 15 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
accept The Brood of Onyxia##1172 |goto Dustwallow Marsh 37.15,33.08
step
map Dustwallow Marsh
path follow strictbounce; loop off; ants curved; dist 30; markers none
path	47.10,51.36	47.61,52.53	47.61,53.26	47.05,54.32	46.40,54.20
path	45.65,52.97	46.41,54.19	47.57,54.87	47.75,55.92	45.92,61.67
path	44.65,62.27	45.91,61.67	47.62,56.05	48.13,55.79	48.92,57.12
path	49.56,56.90	50.94,54.14	50.94,53.28	49.93,52.67
kill Deadmire##4841
|tip He looks like a white crocodile that walks in a large pattern in the water around this area.
|tip He's level 45, but you should be able to kill him at this level.
collect Deadmire's Tooth##5945 |q 1205/1
|only if hardcore
step
Enter the building |goto Dustwallow Marsh 45.88,57.22 < 5 |walk
talk Tabetha##6546
|tip Inside the building.
turnin Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if guideflag("ZFflag")
step
click Egg of Onyxia+
|tip They look like large brown spikey eggs grouped together.
Destroy #5# Eggs of Onyxia |q 1172/1 |goto Dustwallow Marsh 53.57,72.52
You can find more at: |notinsticky
[48.39,75.98]
[56.65,75.40]
step
Enter the cave |goto Dustwallow Marsh 31.71,65.74 < 15 |walk
click Musty Scroll
|tip Inside the cave.
turnin Cortello's Riddle##625 |goto Dustwallow Marsh 31.10,66.15
accept Cortello's Riddle##626 |goto Dustwallow Marsh 31.10,66.15
|only if not hardcore
step
Enter the cave |goto Dustwallow Marsh 36.81,32.36 < 15 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
turnin The Brood of Onyxia##1172 |goto Dustwallow Marsh 37.15,33.08
step
Enter the building |goto Thunder Bluff 45.80,58.83 < 10 |walk
talk Chesmu##8356
|tip Inside the building.
|tip Collect these items from the bank.
collect Deadmire's Tooth##5945 |goto Thunder Bluff 47.13,57.89 |q 1205	|only if not hardcore
collect Insect Analysis Report##8594 |goto Thunder Bluff 47.13,57.89 |q 32
step
talk Melor Stonehoof##3441
turnin Deadmire##1205 |goto Thunder Bluff 61.54,80.91
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if Priest or Mage |q 32
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
talk Kym Wildmane##3036 |only if Druid
Train your spells. |trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 32
Train your spells. |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 32
Train your spells. |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 32
Train your spells. |trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 32
Train your spells. |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 32
Train your spells. |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |only if Druid |q 32
|tip Inside the building. |only if Warrior or Hunter
|tip Inside the cave |only if Priest or Mage
step
click Marvon's Chest
collect Stone Circle##10556 |q 3444/1 |goto The Barrens 62.50,38.54
step
Run up the stairs |goto Orgrimmar 56.42,56.92 < 10 |only if walking
Enter the building |goto Orgrimmar 57.06,45.88 < 7 |walk
talk Zilzibin Drumlore##7010
|tip Inside the building.
turnin Rise of the Silithid##32 |goto Orgrimmar 56.27,46.67
step
Enter the building |goto Orgrimmar 58.91,37.66 < 10 |walk
talk Dran Droffers##6986
|tip Inside the building.
accept Ripple Recovery##649 |goto Orgrimmar 59.48,36.59
step
talk Malton Droffers##6987
|tip Inside the building.
turnin Ripple Recovery##649 |goto Orgrimmar 59.64,36.92
accept Ripple Recovery##650 |goto Orgrimmar 59.64,36.92
step
Enter the building |goto Orgrimmar 56.48,35.24 < 10 |walk
talk Jes'rimon##8659
|tip Upstairs inside the building.
accept Bone-Bladed Weapons##4300 |goto Orgrimmar 55.51,34.09
step
talk Mirket##3325 |only if Warlock
talk Ormok##3328 |only if Rogue
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97  |only if Warlock |q 4300
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 4300
|only if Warlock or Rogue
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 4300
|only if Warlock
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\The Hinterlands (48-49)',
  {
    image = ZGV.IMAGESDIR .. 'The Hinterlands',
    condition_suggested = function()
      return level >= 48 and level <= 49 and not completedq(2662)
    end,
    next = 'Leveling Guides\\Feralas (49-50)',
    hardcore = true,
  },
  [[
step
talk Ezekiel Graves##4585
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Ezekiel Graves##4585 |goto Undercity 75.20,51.19 |q 864
|only if Rogue
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Stone Circle##10556 |goto Undercity 65.97,44.75 |q 3444 |future
|tip Collect these items from the bank.
collect Sealed Field Testing Kit##8527 |goto Undercity 65.97,44.75 |q 864
collect 10 Long Elegant Feather##4589 |goto Undercity 65.97,44.75 |q 7842 |future
collect Bundle of Atal'ai Artifacts##6193 |goto Undercity 65.97,44.75 |q 1429
collect Wildkin Muisek Vessel##9618 |goto Undercity 65.97,44.75 |q 3123
step
talk Oran Snakewrithe##7825
accept Lines of Communication##2995 |goto Undercity 73.06,32.85
step
Follow the path down |goto Undercity 52.86,77.57 < 7 |walk
talk Chemist Cuely##8390
accept Seeping Corruption##3568 |goto Undercity 48.71,71.42
step
talk Apothecary Zinge##5204
turnin Return to Apothecary Zinge##864 |goto Undercity 50.14,67.97
step
talk Hannah Akeley##4575
|tip If you can afford it.
|tip Stock up on a few Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Hannah Akeley##4575 |goto Undercity 82.78,15.83 |q 650
|only if Mage
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Box of Empty Vials##10695 |goto Undercity 65.97,44.75 |q 3568 |future
step
talk Kayren Soothallow##2401
|tip Buy enough ammo to fill your ammo bag, plus 6-8 stacks.
|tip You cannot buy level 40 ammo in the Hinterlands, so you need to stock up now, so you don't run out while questing.
Visit the Vendor |vendor Kayren Soothallow##2401 |goto Hillsbrad Foothills 62.56,19.91 |q 2933 |future
|only if Hunter
step
click Venom Bottle##142702
|tip Avoid Aerie Peak while making your way into the Hinterlands.	|only if hardcore
accept Venom Bottles##2933 |goto The Hinterlands 22.99,57.72
step
Follow the path up |goto The Hinterlands 20.80,47.91 < 30 |only if walking
talk Gilveradin Sunchaser##7801
turnin Ripple Recovery##650 |goto The Hinterlands 26.71,48.59
accept A Sticky Situation##77 |goto The Hinterlands 26.71,48.59
step
click Violet Tragan+
|tip They look like large brown and white mushrooms underwater around this area.
|tip Don't worry about killing Wildkin for another quest yet.
collect Violet Tragan##8526 |q 2641/1 |goto The Hinterlands 41.04,59.79
step
Follow the road around the mountain and run down this path |goto The Hinterlands 72.48,66.10 < 30 |only if walking and not (subzone("Revantusk Village") or subzone("The Overlook Cliffs"))
talk Smith Slagtree##14737
|tip He walks around this area.
accept Vilebranch Hooligans##7839 |goto The Hinterlands 77.23,80.12
step
Enter the building |goto The Hinterlands 78.54,80.72 < 10 |walk
talk Lard##14731
|tip Inside the building.
|tip Restock on food and water while talking to him.
accept Lard Lost His Lunch##7840 |goto The Hinterlands 78.14,81.38
step
talk Katoom the Angler##14740
accept Snapjaws, Mon!##7815 |goto The Hinterlands 80.33,81.53
accept Gammerita, Mon!##7816 |goto The Hinterlands 80.33,81.53
|tip Gammerita is an elite quest and you may need help.	|only if hardcore
step
talk Gorkas##4314
fpath Revantusk Village |goto The Hinterlands 81.70,81.76
stickystart "Collect_Pupellyverbos_Port"
stickystart "Collect_Katooms_Best_Lure"
stickystart "Kill_Saltwater_Snapjaws"
step
click Cortello's Treasure
|tip Underwater, at the base of the waterfall.
|tip Grind Snapjaws en route.
turnin Cortello's Riddle##626 |goto The Hinterlands 80.81,46.81
|only if not hardcore
stickystop "Collect_Pupellyverbos_Port"
stickystop "Collect_Katooms_Best_Lure"
stickystop "Kill_Saltwater_Snapjaws"
step
click Lard's Picnic Basket
Kill the enemies that attack
|tip There are 3 enemies that attack all at once together, each level 49.
|tip You only need to kill and loot any one of them to get the quest item.
|tip If you can't kill or escape the other 2, try to find someone to help you.
collect Lard's Lunch##19034 |q 7840/1 |goto The Hinterlands 84.47,41.22
stickystart "Collect_Pupellyverbos_Port"
stickystart "Kill_Saltwater_Snapjaws"
step
label "Collect_Katooms_Best_Lure"
kill Gammerita##7977 |goto The Hinterlands 75.62,67.03
|tip It looks like a blue turtle that walks around this area.
|tip It's a level 48 elite, but you should be able to kill it at this level.
|tip If you have trouble, try to find someone to help you.
|tip You can also wait for her to patrol closer to town, the guards will help you kill her.
|tip Just be sure to do atleast 50% of her health in damage to get credit.
collect Katoom's Best Lure##19023 |q 7816/1 |goto The Hinterlands 75.62,67.03
You can also find it around: |notinsticky
[77.45,62.32]
[80.79,55.59]
step
label "Collect_Pupellyverbos_Port"
click Pupellyverbos Port
|tip They look like small dark blue bottles on the ground around this area.
|tip Be careful to avoid Gammmerita, it's the only turtle that will attack you. |notinsticky
|tip It looks like a blue turtle that walks around this area. |notinsticky
collect 12 Pupellyverbos Port##3900 |q 580/1 |goto The Hinterlands 79.60,81.61
You can find more around: |notinsticky
[76.26,85.63]
[73.71,91.28]
[78.44,75.71]
[78.49,69.25]
[79.46,62.41]
[81.08,55.81]
|stickyif subzone("The Overlook Cliffs")
step
label "Kill_Saltwater_Snapjaws"
kill 15 Saltwater Snapjaw##2505 |q 7815/1 |goto The Hinterlands 81.83,52.01
You can find more around [76.49,69.69]
step
Enter the building |goto The Hinterlands 78.54,80.72 < 10 |walk
talk Lard##14731
|tip Inside the building.
|tip Restock on food and water while talking to him.
turnin Lard Lost His Lunch##7840 |goto The Hinterlands 78.14,81.38
step
talk Katoom the Angler##14740
turnin Snapjaws, Mon!##7815 |goto The Hinterlands 80.33,81.53
turnin Gammerita, Mon!##7816 |goto The Hinterlands 80.33,81.53
step
talk Huntsman Markhor##14741
accept Stalking the Stalkers##7828 |goto The Hinterlands 79.16,79.52
accept Hunt the Savages##7829 |goto The Hinterlands 79.16,79.52
accept Avenging the Fallen##7830 |goto The Hinterlands 79.16,79.52
step
talk Otho Moji'ko##14738
|tip Inside the building.
accept Message to the Wildhammer##7841 |goto The Hinterlands 79.40,79.09
step
talk Mystic Yayo'jin##14739
|tip She walks around inside the building.
accept Cannibalistic Cousins##7844 |goto The Hinterlands 78.80,78.24
step
Follow the path up |goto The Hinterlands 76.06,61.17 < 20 |only if walking and (subzone("Revantusk Village") or subzone("The Overlook Cliffs"))
kill 15 Silvermane Stalker##2926 |q 7828/1 |goto The Hinterlands 69.37,59.11
|tip They can be stealthed around this area.
|tip Be sure to use Track Hidden. |only if Hunter
You can find more around: |notinsticky
[73.24,56.13]
[76.40,50.71]
[67.43,50.01]
[63.14,49.58]
stickystart "Collect_Wildkin_Muisek"
stickystart "Kill_Savage_Owlbeasts"
stickystart "Kill_Vilebranch_Scalpers"
stickystart "Kill_Vilebranch_Soothsayers"
step
click Slagtree's Lost Tools
|tip It looks like a small silver metal bucket with tools in it.
|tip It can be in five different locations. Follow the loop until you find it.
collect Slagtree's Lost Tools##19033 |q 7839/1
map The Hinterlands/0
path follow smart; loop on; ants curved; dist 35
path 72.61,53.01		71.01, 48.61		66.41, 44.71
path 57.40,42.55		53.31, 38.81
stickystop "Kill_Vilebranch_Scalpers"
stickystop "Kill_Vilebranch_Soothsayers"
step
Enter the cave |goto The Hinterlands 57.46,38.88 < 20 |walk
click Horde Supply Crate##142191+
|tip They look like brown wooden boxes on the ground inside the cave.
|tip Watch for patrols and respawns while here.	|only if hardcore
collect 10 Hinterlands Honey Ripple##8684 |q 77/1 |goto The Hinterlands 57.36,41.68
stickystart "Collect_Skylord_Plume"
step
Leave the cave |goto The Hinterlands 57.46,38.88 < 20 |walk |only if subzone("Skulk Rock") and _G.IsIndoors()
accept Find OOX-09/HL!##485 |goto The Hinterlands/0 49.41,37.62
|only if itemcount(8704) > 0
step
Leave the cave |goto The Hinterlands 57.46,38.88 < 20 |walk |only if subzone("Skulk Rock") and _G.IsIndoors()
turnin Find OOX-09/HL!##485 |goto The Hinterlands/0 49.41,37.62
|tip Do not accept the follow up to do the escort unless you are in a group. It is extremely difficult.
|only if itemcount(8704) > 0
step
label "Collect_Wildkin_Muisek"
Leave the cave |goto The Hinterlands 57.46,38.88 < 20 |walk |only if subzone("Skulk Rock") and _G.IsIndoors()
kill Savage Owlbeast##2929+
|tip They are pretty spread out all around the eastern side of the Hinterlands.
use the Wildkin Muisek Vessel##9618
|tip Use it on their corpses.
collect 10 Wildkin Muisek##9594 |q 3123/1 |goto The Hinterlands 62.58,40.86
You can find more around: |notinsticky
[61.52,41.91]
[61.68,44.29]
[60.92,46.42]
[56.16,46.07]
[53.05,48.90]
[55.80,51.57]
[60.39,54.06]
[65.74,57.99]
|stickyif not subzone("Skulk Rock")
step
kill 15 Silvermane Howler##2925 |q 7828/2 |goto The Hinterlands 49.43,58.50
|tip They share spawn points with Primitive Owlbeasts.
|tip Kill Savage and Primitive Owlbeasts while waiting on Howler spawns.
You can find more around: |notinsticky
[46.93,59.87]
[43.32,61.80]
[46.05,53.95]
step
label "Kill_Savage_Owlbeasts"
kill 20 Savage Owlbeast##2929 |q 7829/1 |goto The Hinterlands 62.58,40.86
|tip They are pretty spread out all around the eastern side of the Hinterlands. |notinsticky
You can find more around: |notinsticky
[61.52,41.91]
[61.68,44.29]
[60.92,46.42]
[56.16,46.07]
[53.05,48.90]
[55.80,51.57]
[60.39,54.06]
[65.74,57.99]
|stickyif not subzone("Skulk Rock")
step
label "Collect_Skylord_Plume"
kill Razorbeak Skylord##2659+
|tip They look like flying eagle beasts.
|tip There are only two in the zone.
|tip One of them flies low to the ground around this area.
collect Skylord Plume##19025 |q 7830/1 |goto The Hinterlands 63.82,51.93
You can find the other one around [52.98,51.68]
|stickyif not subzone("Skulk Rock")
stickystart "Kill_Vilebranch_Scalpers"
stickystart "Kill_Vilebranch_Soothsayers"
step
label "Kill_Vilebranch_Scalpers"
kill 30 Vilebranch Scalper##4466 |q 7844/1 |goto The Hinterlands 47.53,66.44
|tip Be careful, Scalpers can execute you below 20% health |only if hardcore
|tip They share spawns with other Vilebranch enemies at the temple.  |notinsticky
|tip There are guaranteed spawns at the north camps if you struggle to find any here. |notinsticky
You can find more around: |notinsticky
[65.40,44.84]
[70.49,48.38]
step
label "Kill_Vilebranch_Soothsayers"
kill 15 Vilebranch Soothsayer##4467 |q 7844/2 |goto The Hinterlands 47.53,66.44
|tip They share spawns with other Vilebranch enemies at the temple.  |notinsticky
|tip There are guaranteed spawns at the north camps if you struggle to find any here. |notinsticky
You can find more around: |notinsticky
[65.40,44.84]
[70.49,48.38]
stickystart "Kill_Highvale_Scouts"
stickystart "Kill_Highvale_Outrunners"
stickystart "Kill_Highvale_Rangers"
stickystart "Kill_Highvale_Marksmen"
step
Enter the building |goto The Hinterlands 31.42,48.68 < 15 |walk
click Highvale Records
|tip Inside the building.
|tip Enemies around this area will may run away at low health.	|only if hardcore |notinsticky
Burn the Highvale Records |q 2995/1 |goto The Hinterlands 31.98,46.83
step
talk Rin'ji##7780
|tip Inside the building.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait for him to respawn.
|tip Clear enemies nearby if you have to wait or before accepting the quest.	|only if hardcore |notinsticky
|tip Enemies around this area may run away at low health.			|only if hardcore |notinsticky
accept Rin'ji is Trapped!##2742 |goto The Hinterlands 30.73,46.97 |noautoaccept
step
Watch the dialogue
|tip Follow and protect Rin'ji as he walks.
|tip You will be attacked by two groups of 3 enemies along the way.
|tip He eventually walks to this location.
Escort Rin'ji to Safety |q 2742/1 |goto The Hinterlands 34.64,56.38
step
click Highvale Notes##144072
|tip It is by barrels in the corner.
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
Burn the Highvale Notes |q 2995/2 |goto The Hinterlands 29.63,48.66
step
click Highvale Report##144073
|tip It is on a table inside the shrine.
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
Burn the Highvale Report |q 2995/3 |goto The Hinterlands 28.56,46.05
step
label "Kill_Highvale_Scouts"
kill 15 Highvale Scout##2692 |q 7841/1 |goto The Hinterlands 31.74,49.40
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
|tip You can find more around this area, surrounding this building. |notinsticky
step
label "Kill_Highvale_Outrunners"
kill 15 Highvale Outrunner##2691 |q 7841/2 |goto The Hinterlands 31.74,49.40
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
|tip You can find more around this area, surrounding this building. |notinsticky
step
label "Kill_Highvale_Rangers"
kill 15 Highvale Ranger##2694 |q 7841/3
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
|tip You can find more around this area, surrounding this building. |notinsticky
step
label "Kill_Highvale_Marksmen"
kill 15 Highvale Marksman##2693 |q 7841/4
|tip Enemies around this area may run away at low health.	|only if hardcore |notinsticky
|tip You can find more around this area, surrounding this building. |notinsticky
step
click Rin'ji's Secret##142127
turnin Rin'ji is Trapped!##2742 |goto The Hinterlands 86.30,59.01
accept Rin'ji's Secret##2782 |goto The Hinterlands 86.30,59.01
step
talk Smith Slagtree##14737
|tip He walks around this area.
turnin Vilebranch Hooligans##7839 |goto The Hinterlands 77.24,80.12
step
talk Mystic Yayo'jin##14739
|tip She walks around inside the building.
turnin Cannibalistic Cousins##7844 |goto The Hinterlands 78.80,78.25
step
talk Otho Moji'ko##14738
|tip Inside the building.
turnin Message to the Wildhammer##7841 |goto The Hinterlands 79.40,79.08
accept Another Message to the Wildhammer##7842 |goto The Hinterlands 79.40,79.08
step
talk Otho Moji'ko##14738
|tip Inside the building.
turnin Another Message to the Wildhammer##7842 |goto The Hinterlands 79.40,79.08
accept The Final Message to the Wildhammer##7843 |goto The Hinterlands 79.40,79.08
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
trash Long Elegant Feather##4589 |goto The Hinterlands 79.16,79.53
step
talk Huntsman Markhor##14741
turnin Stalking the Stalkers##7828 |goto The Hinterlands 79.16,79.53
turnin Hunt the Savages##7829 |goto The Hinterlands 79.16,79.53
turnin Avenging the Fallen##7830 |goto The Hinterlands 79.16,79.53
step
Enter the building |goto Hillsbrad Foothills 61.50,19.45 < 10 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Venom Bottles##2933 |goto Hillsbrad Foothills 61.44,19.06
accept Undamaged Venom Sac##2934 |goto Hillsbrad Foothills 61.44,19.06
step
talk Kayren Soothallow##2401
|tip Stock up on ammo |only if Hunter
Visit the Vendor |vendor Kayren Soothallow##2401 |goto Hillsbrad Foothills 62.56,19.91 |q 7843
step
use the Final Message to the Wildhammer##19036
|tip Be careful, Alliance NPC enemies sometimes walk near this location.
|tip This quest may PvP flag you if you get too close. |only if hardcore
Deliver the Message to the Wildhammer |q 7843/1 |goto The Hinterlands 14.39,48.03
step
Follow the path up |goto The Hinterlands 20.44,48.08 < 30 |only if walking
talk Gilveradin Sunchaser##7801
turnin A Sticky Situation##77 |goto The Hinterlands 26.71,48.59
accept Ripple Delivery##81 |goto The Hinterlands 26.71,48.59
stickystart "Collect_Undamaged_Venom_Sac"
step
Follow the path down |goto The Hinterlands 35.81,63.99 < 30 |only if walking
Jump on the side rail of the stairs and follow the path up |goto The Hinterlands 33.50,74.12 < 15 |only if walking
Jump down here |goto The Hinterlands 33.20,74.97 < 10 |only if walking
talk Atal'ai Exile##5598
|tip Standing on a ledge on the side of the building.
turnin The Atal'ai Exile##1429 |goto The Hinterlands 33.75,75.21
accept Return to Fel'Zerul##1444 |goto The Hinterlands 33.75,75.21
step
label "Collect_Undamaged_Venom_Sac"
kill Witherbark Broodguard##2686+
|tip They look like spiders.
|tip This droprate is very low, grind enemies if there are no more spiders alive to stay busy.
collect Undamaged Venom Sac##9322 |q 2934/1 |goto The Hinterlands 34.38,72.92
step
Follow the path |goto The Hinterlands 35.80,64.19 < 30 |only if walking and subzone("Shadra'Alor")
accept Find OOX-09/HL!##485 |goto The Hinterlands/0 49.41,37.62
|only if itemcount(8704) > 0
step
Follow the path |goto The Hinterlands 35.80,64.19 < 30 |only if walking and subzone("Shadra'Alor")
turnin Find OOX-09/HL!##485 |goto The Hinterlands/0 49.41,37.62
|tip Do not accept the follow up to do the escort unless you are in a group. It is extremely difficult.
|only if itemcount(8704) > 0
step
Follow the path |goto The Hinterlands 35.80,64.19 < 30 |only if walking and subzone("Shadra'Alor")
Follow the road around the mountain and run down this path |goto The Hinterlands 72.48,66.10 < 30 |only if walking and not (subzone("Revantusk Village") or subzone("The Overlook Cliffs"))
talk Otho Moji'ko##14738
|tip Inside the building.
turnin The Final Message to the Wildhammer##7843 |goto The Hinterlands 79.38,79.08
step
talk Huntsman Markhor##14741
|tip Stable your permanent pet.
|tip You are about to tame a temporary pet soon, so you can learn "Bite 7".
Click Here to Continue |confirm |goto The Hinterlands 79.16,79.53 |q 2934
|only if Hunter
step
_NOTE:_
Tame a Saltwater Snapjaw
|tip Use your "Tame Beast" ability on a Saltwater Snapjaw.
|tip They look like orange turtles around this area.
|tip Make sure to tame a level 49 Saltwater Snapjaw.
Learn the "Bite 7" Pet Ability
|tip Kill enemies around this area until you see a message in your chat saying you learned "Bite 7".
|tip You will teach "Bite 7" to your permanent pet soon.
Click Here to Continue |confirm |goto The Hinterlands 76.39,67.43 |q 2934
|only if Hunter
step
talk Huntsman Markhor##14741
|tip Abandon your temporary pet and get your permanent pet from the stable.
|tip Teach "Bite 7" to your permanent pet.
Click Here to Continue |confirm |goto The Hinterlands 79.16,79.53 |q 2934
|only if Hunter
step
Enter the building |goto Hillsbrad Foothills 61.50,19.45 < 10 |walk
talk Apothecary Lydon##2216
|tip Inside the building.
turnin Undamaged Venom Sac##2934 |goto Hillsbrad Foothills 61.44,19.07
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Dran's Ripple Delivery##8685 |goto Undercity 65.97,44.75 |q 81 |future
bank Pupellyverbos Port##3900 |goto Undercity 65.97,44.75 |q 580 |future
|tip You should have 12 of these.
step
talk Ezekiel Graves##4585
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Ezekiel Graves##4585 |goto Undercity 75.20,51.19 |q 2995
|only if Rogue
step
talk Oran Snakewrithe##7825
turnin Lines of Communication##2995 |goto Undercity 73.07,32.85
turnin Rin'ji's Secret##2782 |goto Undercity 73.07,32.85
accept Oran's Gratitude##8273 |goto Undercity 73.07,32.85 |instant
step
talk Sprinkle##7583
turnin Sprinkle's Secret Ingredient##2641 |goto Tanaris 51.06,26.87
step
Watch the dialogue
talk Sprinkle##7583
accept Delivery for Marin##2661 |goto Tanaris 51.06,26.87
step
talk Marin Noggenfogger##7564
turnin Delivery for Marin##2661 |goto Tanaris 51.81,28.66
accept Noggenfogger Elixir##2662 |goto Tanaris 51.81,28.66
step
Watch the dialogue
talk Marin Noggenfogger##7564
turnin Noggenfogger Elixir##2662 |goto Tanaris 51.81,28.66
|tip It is worthwhile buying a stack of Noggenfogger and keeping it in your bags, it can grant you slowfall to help with traversing the world. |only if not Mage
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Feralas (49-50)',
  {
    image = ZGV.IMAGESDIR .. 'Feralas',
    condition_suggested = function()
      return level >= 49 and level <= 50 and not completedq(3444)
    end,
    next = "Leveling Guides\\Un'Goro Crater (50-50)",
    hardcore = true,
  },
  [[
step
talk Talo Thornhoof##7776
|tip Inside the tent.
accept Dark Heart##3062 |goto Feralas 76.18,43.83	|only if not hardcore
accept Vengeance on the Northspring##3063 |goto Feralas 76.18,43.83
accept The Strength of Corruption##4120 |goto Feralas 76.18,43.83
step
Enter the building |goto Feralas 74.68,42.99 < 10 |walk
talk Jangdor Swiftstrider##7854
|tip Inside the building.
accept Improved Quality##7734 |goto Feralas 74.43,42.91
step
talk Witch Doctor Uzer'i##8115
turnin Testing the Vessel##3123 |goto Feralas 74.42,43.36
accept Hippogryph Muisek##3124 |goto Feralas 74.42,43.36
accept Natural Materials##3128 |goto Feralas 74.42,43.36
stickystart "Collect_Resilient_Sinew"
stickystart "Collect_Metallic_Fragments"
step
Kill Frayfeather enemies around this area
use the Hippogryph Muisek Vessel##9619
|tip Use it on their corpses.
collect 10 Hippogryph Muisek##9595 |q 3124/1 |goto Feralas 56.03,63.05
You can find more around: |notinsticky
[54.06,65.91]
[54.21,70.46]
step
label "Collect_Resilient_Sinew"
Kill Frayfeather enemies around this area
collect 20 Resilient Sinew##9591 |q 3128/3 |goto Feralas 56.03,63.05
You can find more around: |notinsticky
[54.06,65.91]
[54.21,70.46]
step
label "Collect_Metallic_Fragments"
Kill Frayfeather enemies around this area |notinsticky
collect 40 Metallic Fragments##9592 |q 3128/4 |goto Feralas 56.03,63.05
You can find more around: |notinsticky
[54.06,65.91]
[54.21,70.46]
step
talk Witch Doctor Uzer'i##8115
turnin Hippogryph Muisek##3124 |goto Feralas 74.42,43.36
accept Faerie Dragon Muisek##3125 |goto Feralas 74.42,43.36
stickystart "Collect_Encrusted_Minerals"
step
kill Sprite Darter##5278+
use the Faerie Dragon Muisek Vessel##9620
|tip Use it on their corpses.
collect 8 Faerie Dragon Muisek##9596 |q 3125/1 |goto Feralas 70.00,46.91
You can find more around: |notinsticky
[68.36,48.10]
[66.03,47.52]
[64.35,48.69]
step
label "Collect_Encrusted_Minerals"
kill Sprite Darter##5278+
collect 6 Encrusted Minerals##9589 |q 3128/2 |goto Feralas 70.00,46.91
You can find more around: |notinsticky
[68.36,48.10]
[66.03,47.52]
[64.35,48.69]
step
talk Witch Doctor Uzer'i##8115
turnin Faerie Dragon Muisek##3125 |goto Feralas 74.42,43.36
accept Treant Muisek##3126 |goto Feralas 74.42,43.36
stickystart "Collect_Splintered_Logs"
step
label "Treant_Musk_Route_1"
map Feralas
path follow strictbounce; loop off; ants curved; dist 20; markers none
path	67.98,60.10	68.99,60.18	69.56,59.39	70.42,57.76	71.76,58.50
path	72.31,59.41	72.80,58.52	74.67,57.39	74.01,57.48	72.93,57.68
path	72.77,56.32	73.43,54.88	74.26,53.13	73.90,51.60	72.78,50.89
kill Wandering Forest Walker##7584+
_Route 1_
|tip Follow the route, searching for a Wandering Forest Walker.
|tip They look like walking trees.
|tip One of them walks back and forth along this path.
|tip They have extremely long respawns and only one is spawned at each area.
|tip After killing a Treant at one area, click a line below to jump to another route.
use the Treant Muisek Vessel##9606
|tip Use it on their corpses.
collect 3 Treant Muisek##9593 |q 3126/1
Click Here for Route 2  |next "Treant_Musk_Route_2"
Click Here for Route 3  |next "Treant_Musk_Route_3"
step
label "Treant_Musk_Route_2"
map Feralas/0
path follow smart; loop on; ants straight; dist 30
path	69.67,44.39	70.43,42.62	72.02,41.07
path 	73.06,40.65	73.69,38.97	73.84,38.73
path	74.75,38.56	76.49,39.76	77.44,40.76
kill Wandering Forest Walker##7584+
_Route 2_
|tip Follow the route, searching for a Wandering Forest Walker.
|tip They look like walking trees.
|tip One of them walks back and forth along this path.
|tip They have extremely long respawns and only one is spawned at each area.
|tip After killing a Treant at one area, click a line below to jump to another route.
use the Treant Muisek Vessel##9606
|tip Use it on their corpses.
collect 3 Treant Muisek##9593 |q 3126/1
Click Here for Route 3  |next "Treant_Musk_Route_3"
Click Here for Route 1  |next "Treant_Musk_Route_1"
step
label "Treant_Musk_Route_3"
map Feralas/0
path follow smart; loop on; ants straight; dist 30
path	69.67,44.39	70.43,42.62	72.02,41.07
path 	73.06,40.65	73.69,38.97	73.84,38.73
path	74.75,38.56	76.49,39.76	77.44,40.76
kill Wandering Forest Walker##7584+
_Route 3_
|tip Follow the route, searching for a Wandering Forest Walker.
|tip They look like walking trees.
|tip One of them walks back and forth along this path.
|tip They have extremely long respawns and only one is spawned at each area.
|tip After killing a Treant at one area, click a line below to jump to another route.
use the Treant Muisek Vessel##9606
|tip Use it on their corpses.
collect 3 Treant Muisek##9593 |q 3126/1
Click Here to Skip This Quest for now |next "Collect_Splintered_Logs"
Click Here for Route 1  |next "Treant_Musk_Route_1"
Click Here for Route 2  |next "Treant_Musk_Route_3"
step
label "Collect_Splintered_Logs"
map Feralas
path follow strictbounce; loop off; ants curved; dist 20; markers none
path	67.98,60.10	68.99,60.18	69.56,59.39	70.42,57.76	71.76,58.50
path	72.31,59.41	72.80,58.52	74.67,57.39	74.01,57.48	72.93,57.68
path	72.77,56.32	73.43,54.88	74.26,53.13	73.90,51.60	72.78,50.89
kill Wandering Forest Walker##7584+ |notinsticky
|tip Follow the path, searching for a Wandering Forest Walker. |notinsticky
|tip They look like walking trees. |notinsticky
|tip One of them walks back and forth along this path. |notinsticky
|tip Return to its respawn point after killing it and wait. |notinsticky
|tip It takes approximately 6 minutes for it to respawn. |notinsticky
collect 2 Splintered Log##9590 |q 3128/1
It respawns at [67.99,60.11]
step
talk Witch Doctor Uzer'i##8115
turnin Treant Muisek##3126 |goto Feralas 74.42,43.36
accept Mountain Giant Muisek##3127 |goto Feralas 74.42,43.36
turnin Natural Materials##3128 |goto Feralas 74.42,43.36
step
Enter the building |goto Feralas 74.64,44.70 < 10 |walk
talk Cawind Trueaim##9548
|tip Upstairs, outside on the balcony of the building.
|tip Buy enough ammo to fill your ammo bag, plus 8-10 extra stacks.
|tip You will be out questing for a while.
Visit the Vendor |vendor Cawind Trueaim##9548 |goto Feralas 74.94,45.71 |q 3127
|only if Hunter
step
talk Zorbin Fandazzle##14637
accept Zapped Giants##7003 |goto Feralas 44.81,43.42
accept Fuel for the Zapping##7721 |goto Feralas 44.81,43.42
|tip The Sea Elementals/Sprays are immune to frost damage.	|only if hardcore
stickystart "Collect_Water_Elemental_Cores"
step
use Zorbin's Ultra-Shrinker##18904
|tip Use it on Wave Striders around this area.
|tip They look like tall green giants that walks on the shore and in the water around this area.
|tip This quest item only lasts for 2 hours.
|tip If you need a new one, abandon the quest and accept it again from the goblin in the previous guide step.
kill Zapped Wave Strider##14638+
collect 15 Miniaturization Residue##18956 |q 7003/1 |goto Feralas 44.38,50.11
You can find more around: |notinsticky
[46.63,59.79]
[45.36,67.94]
[40.03,37.38]
[36.09,33.74]
step
label "Collect_Water_Elemental_Cores"
Kill Sea enemies around this area
|tip They look like water elementals.
|tip Up and down this whole shore.
|tip These are immune to frost damage.	|only if hardcore
collect 10 Water Elemental Core##18958 |q 7721/1 |goto Feralas 46.73,60.23
You can find more around: |notinsticky
[46.30,52.00]
[40.71,37.59]
step
talk Zorbin Fandazzle##14637
turnin Zapped Giants##7003 |goto Feralas 44.81,43.42
turnin Fuel for the Zapping##7721 |goto Feralas 44.81,43.42
step
_Destroy This Item:_
|tip It is no longer needed.
|tip You will get a new one in the next step, that will last an additional 2 hours.
trash Zorbin's Ultra-Shrinker##18904
step
talk Zorbin Fandazzle##14637
accept Again With the Zapped Giants##7725 |goto Feralas 44.81,43.42
|tip We are only accepting this quest to get the item.
|tip You will use the item to shrink giants later, to make another quest easier.
stickystart "Collect_Perfect_Yeti_Hide"
step
Follow the path up |goto Feralas 46.28,37.56 < 20 |only if walking and subzone("The Forgotten Coast")
Follow the path up |goto Feralas 51.42,32.47 < 20 |only if walking
Kill Rage Scar enemies around this area
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while here.	|only if hardcore
collect 10 Rage Scar Yeti Hide##18947 |q 7734/1 |goto Feralas 53.17,31.82
step
label "Collect_Perfect_Yeti_Hide"
Kill Rage Scar enemies around this area |notinsticky
|tip Inside and outside the cave. |notinsticky
|tip Watch for patrols and respawns while here.	|only if hardcore |notinsticky
collect Perfect Yeti Hide##18972 |goto Feralas 53.17,31.82 |q 7738 |future
|tip You can also get this item by skinning enemies. |only if skill('Skinning') > 0
step
Leave the cave |goto Feralas 53.21,31.84 < 15 |walk |only if subzone("Rage Scar Hold") and _G.IsIndoors()
use the Zorbin's Ultra-Shrinker##18904
|tip Use it on enemies around this area.
|tip They look like rock giants.
Kill enemies around this area
use the Mountain Giant Muisek Vessel##9621
|tip Use it on their corpses.
|tip Don't worry about collecting the Miniatuization Residue, we don't turn in that quest. We just have it for the zapper. |only if haveq(7725)
collect 7 Mountain Giant Muisek##9597 |q 3127/1 |goto Feralas 40.25,24.48
You can find more around [37.96,20.91]
stickystart "Kill_Northspring_Harpies"
stickystart "Kill_Northspring_Roguefeathers"
stickystart "Kill_Northspring_Slayers"
stickystart "Kill_Northspring_Windcallers"
step
Kill Northspring enemies around this area
|tip They look like harpies.
collect Horn of Hatetalon##9530 |goto Feralas 39.64,14.79 |q 3062
You can find more around [39.19,9.95]
|only if not hardcore
step
_Note:_
You can Safely Abandon a Quest
|tip You no longer need to have the "Again With the Zapped Giants" quest.
|tip We only accepted it to get Zorbin's Ultra-Shrinker, to make the rock giants easier to kill.
Abandon the _"Again With the Zapped Giants"_ Quest |complete not haveq(7725)
step
_Destroy This Item:_
|tip It is no longer needed.
trash Zorbin's Ultra-Shrinker##18904
step
use the Horn of Hatetalon##9530
kill Edana Hatetalon##8075
|tip She is a level 50 elite, but you should be able to kill her at this level.
|tip If you have trouble, try to find someone to help you.
collect Edana's Dark Heart##9528 |q 3062/1 |goto Feralas 40.55,8.59
|only if not hardcore
step
label "Kill_Northspring_Harpies"
kill 4 Northspring Harpy##5362 |q 3063/1 |goto Feralas 39.64,14.79
You can find more around [39.19,9.95]
step
label "Kill_Northspring_Roguefeathers"
kill 4 Northspring Roguefeather##5363 |q 3063/2 |goto Feralas 39.64,14.79
You can find more around [39.19,9.95]
step
label "Kill_Northspring_Slayers"
kill 4 Northspring Slayer##5364 |q 3063/3 |goto Feralas 39.64,14.79
You can find more around [39.19,9.95]
step
label "Kill_Northspring_Windcallers"
kill 4 Northspring Windcaller##5366 |q 3063/4 |goto Feralas 39.64,14.79
You can find more around [39.19,9.95]
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells and then we will hearth.
|tip This step will complete when your Hearthstone is ready to use.
Grind XP Until Your Hearth Is Almost Up |complete C_Container.GetItemCooldown(6948) <= 100 |goto Feralas 39.64,14.79 |q 3444
|only if Druid
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 3444
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 300
step
Enter the building |goto Tanaris 52.21,28.57 < 10 |walk
talk Gimblethorn##7799
|tip Inside the building.
|tip Collect these items from the bank.
collect Stone Circle##10556 |goto Tanaris 52.30,28.91 |q 3444
step
talk Marvon Rivetseeker##7771
turnin The Stone Circle##3444 |goto Tanaris 52.71,45.92
]]
)
ZygorGuidesViewer:RegisterGuide(
  "Leveling Guides\\Un'Goro Crater (50-50)",
  {
    image = ZGV.IMAGESDIR .. "Un'Goro Crater",
    condition_suggested = function()
      return level == 50 and not completedq(3884)
    end,
    next = 'Leveling Guides\\Feralas (50-50)',
    hardcore = true,
  },
  [[
step
Follow the path down into Un'Goro Crater |goto Tanaris 27.04,56.57 < 40 |only if walking and not zone("Un'Goro Crater")
talk Torwa Pathfinder##9619
accept The Apes of Un'Goro##4289 |goto Un'Goro Crater 71.64,75.96
accept The Fare of Lar'korwi##4290 |goto Un'Goro Crater 71.64,75.96
stickystart "Collect_White_Ravasaur_Claws"
stickystart "Collect_A_Mangled_Journal"
stickystart "Accept_Willidens_Journal"
stickystart "Collect_Power_Crystals"
stickystart "Collect_UnGoro_Soil"
step
click A Wrecked Raft
accept It's a Secret to Everybody##3844 |goto Un'Goro Crater 63.02,68.50
step
click A Small Pack
|tip Underwater.
turnin It's a Secret to Everybody##3844 |goto Un'Goro Crater 63.12,69.02
accept It's a Secret to Everybody##3845 |goto Un'Goro Crater 63.12,69.02
step
click Fresh Threshadon Carcass
|tip Avoid the elite t-rex that sometimes walks near this location.
collect Piece of Threshadon Carcass##11504 |q 4290/1 |goto Un'Goro Crater 68.75,56.66
step
talk Torwa Pathfinder##9619
turnin The Fare of Lar'korwi##4290 |goto Un'Goro Crater 71.64,75.97
accept The Scent of Lar'korwi##4291 |goto Un'Goro Crater 71.64,75.97
step
kill Lar'korwi Mate##9683
|tip Stand on the pile of purple eggs to get it to appear.
collect 2 Ravasaur Pheromone Gland##11509 |q 4291/1 |goto Un'Goro Crater 67.32,73.05
You can find more eggs at: |notinsticky
[62.87,80.48]
[60.92,72.23]
[66.60,66.73]
step
talk Torwa Pathfinder##9619
turnin The Scent of Lar'korwi##4291 |goto Un'Goro Crater 71.63,75.97
accept The Bait for Lar'korwi##4292 |goto Un'Goro Crater 71.63,75.97
step
label "Collect_White_Ravasaur_Claws"
Kill Ravasaur enemies around this area
|tip Don't go out of your way for this quest, just kill ones in your way.
collect 8 White Ravasaur Claw##11477 |q 4300/1 |goto Un'Goro Crater 65.60,70.85
You can find more around [67.02,59.15]
step
label "Collect_Power_Crystals"
click Power Crystal+
|tip They look clusters of red, yellow, green, or blue crystals on the ground around this area.
|tip They tend to be around the base of trees, or near the cliffs surrounding Un'Goro Crater.
|tip Stick to searching around the eastern side of the zone, since there are lower level enemies there, and the crystals can spawn anywhere in the zone.
|tip Kill enemies here and there as you search around, to continue gaining experience.
collect 7 Red Power Crystal##11186 |q 4284 |future |only if itemcount(11186) < 7
collect 7 Yellow Power Crystal##11188 |q 4284 |future |only if itemcount(11188) < 7
collect 7 Green Power Crystal##11185 |q 4284 |future |only if itemcount(11185) < 7
collect 7 Blue Power Crystal##11184 |q 4284 |future |only if itemcount(11184) < 7
|only if (itemcount(11186) < 7) or (itemcount(11188) < 7) or (itemcount(11185) < 7) or (itemcount(11184) < 7)
step
use A Small Pack##11107
collect Large Compass##11104 |q 3845/1
collect Curled Map Parchment##11105 |q 3845/2
collect Lion-headed Key##11106 |q 3845/3
step
_Destroy This Item:_
|tip It is no longer needed.
trash Faded Photograph##11108
trash Heavy Throwing Dagger##3108
step
Follow the path up into Marshal's Refuge |goto Un'Goro Crater 46.01,13.45 < 20 |only if walking and not subzone("Marshal's Refuge")
talk Linken##8737
turnin It's a Secret to Everybody##3845 |goto Un'Goro Crater 44.66,8.11
accept It's a Secret to Everybody##3908 |goto Un'Goro Crater 44.66,8.11
stickystop "Collect_UnGoro_Soil"
stickystop "Collect_A_Mangled_Journal"
step
talk Williden Marshal##9270
turnin Williden's Journal##3884 |goto Un'Goro Crater 43.95,7.14
|only if haveq(3884) or completedq(3884)
step
talk Nergal##12959
|tip Buy enough ammo to fill your ammo bag, plus 10-15 extra stacks.
|tip You will be questing for a while in Blasted Lands soon, with no easy access to ammo.
Visit the Vendor |vendor Nergal##12959 |goto Un'Goro Crater 43.27,7.73 |q 4284 |future
|only if Hunter
step
Enter the cave |goto Un'Goro Crater 43.47,6.81 < 15 |walk |only if subzone("Marshal's Refuge") and not _G.IsIndoors()
talk J.D. Collie##9117
|tip Inside the cave.
accept Crystals of Power##4284 |goto Un'Goro Crater 41.92,2.70
step
talk J.D. Collie##9117
|tip Inside the cave.
turnin Crystals of Power##4284 |goto Un'Goro Crater 41.92,2.70
step
_Destroy These Items:_
|tip They are no longer needed.
trash Red Power Crystal##11186 |goto Un'Goro Crater 43.47,6.81
trash Yellow Power Crystal##11188 |goto Un'Goro Crater 43.47,6.81
trash Green Power Crystal##11185 |goto Un'Goro Crater 43.47,6.81
trash Blue Power Crystal##11184 |goto Un'Goro Crater 43.47,6.81
step
Leave the cave |goto Un'Goro Crater 43.47,6.81 < 15 |walk |only if subzone("Marshal's Refuge") and _G.IsIndoors()
talk Gryfe##10583
fpath Marshal's Refuge |goto Un'Goro Crater 45.23,5.84
step
label "Collect_UnGoro_Soil"
click Un'Goro Dirt Pile+
|tip They look like piles of dark brown dirt on the ground around this area.
|tip You can find them all over the entire zone.
Kill enemies around this area
|tip Any enemy in Un'Goro Crater can drop the quest item.
collect 20 Un'Goro Soil##11018 |q 3761 |future
|tip Be careful not to accidentally sell these to a vendor.
|sticky only
step
label "Collect_A_Mangled_Journal"
Kill enemies around this area
|tip Any enemy in Un'Goro Crater can drop the quest item.
collect A Mangled Journal##11116 |q 3884 |future
|sticky only
step
label "Accept_Willidens_Journal"
use A Mangled Journal##11116
accept Williden's Journal##3884
|only if itemcount(11116) > 0
|sticky only
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Feralas (50-50)',
  {
    image = ZGV.IMAGESDIR .. 'Feralas',
    condition_suggested = function()
      return level == 50 and not completedq(1122)
    end,
    next = 'Leveling Guides\\Blasted Lands (50-51)',
    hardcore = true,
  },
  [[
step
Optional Route Change
|tip You can opt to do Maraudon soon instead of grinding.
|tip This is highly recommended due to the weapon quest reward. |only if Hunter or Rogue or Warrior
|tip This will mean slower leveling but it will be more fun and potentially give you gear upgrades.
|tip If you choose to do Maraudon, we will say when to accept and turnin dungeon quests that are worth doing in your route.
|tip We will also say when it is a good time to do the dungeon.
_Note_
|tip This feature is currently experimental and may result in a full quest log. If this happens, please submit a feedback report so we can fix it!
|tip If you have a full quest log, we recommend abandoning any dungeon quests that can be shared by your party members later.
Click Here if you'd like to run Maraudon later |confirm Maraflag
Click Here if you'd prefer to grind |confirm
step
Prepare for Maraudon
|tip It will be a good time to start Maraudon soon.
|tip You should run it after finishing this guide, roughly 45 minutes.
|tip Start looking for a group.
|confirm
|only if guideflag("Maraflag")
step
talk Talo Thornhoof##7776
|tip Inside the building.
turnin Dark Heart##3062 |goto Feralas 76.18,43.83 |only if haveq(3062)
turnin Vengeance on the Northspring##3063 |goto Feralas 76.18,43.83
step
_Destroy This Item:_
|tip It is no longer needed.
trash Horn of Hatetalon##9530
step
use the Perfect Yeti Hide##18972
accept Perfect Yeti Hide##7738 |goto Feralas 74.68,43.00
step
Enter the building |goto Feralas 74.68,43.00 < 10 |walk
talk Jangdor Swiftstrider##7854
|tip Inside the building.
turnin Improved Quality##7734 |goto Feralas 74.43,42.91
turnin Perfect Yeti Hide##7738 |goto Feralas 74.43,42.91
step
talk Witch Doctor Uzer'i##8115
turnin Mountain Giant Muisek##3127 |goto Feralas 74.42,43.37
accept Weapons of Spirit##3129 |goto Feralas 74.42,43.37
step
Watch the dialogue
talk Witch Doctor Uzer'i##8115
turnin Weapons of Spirit##3129 |goto Feralas 74.42,43.37
step
talk Overlord Mok'Morokk##4500
|tip You will have to fight him after accepting this quest, so be prepared.
accept Challenge Overlord Mok'Morokk##1173 |goto Dustwallow Marsh 36.30,31.42
|only if not hardcore
step
Watch the dialogue
kill Overlord Mok'Morokk##4500
|tip He will eventually surrender at around 30% health.
|tip If you have trouble, try to find someone to help you.
Drive Overlord Mok'Morokk from Brackenwall Village |q 1173/1 |goto Dustwallow Marsh 36.30,31.42
|only if not hardcore
step
Enter the cave |goto Dustwallow Marsh 36.81,32.36 < 15 |walk
talk Draz'Zilb##4501
|tip Inside the cave.
turnin Challenge Overlord Mok'Morokk##1173 |goto Dustwallow Marsh 37.15,33.08
|only if not hardcore
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 1122
|only if Rogue
step
talk Fuzruckle##3496
|tip Deposit these items into the bank.
bank Torwa's Pouch##11568 |goto The Barrens 62.64,37.42 |q 4292 |future
bank Linken's Training Sword##11133 |goto The Barrens 62.64,37.42 |q 3908 |future
bank White Ravasaur Claw##11477 |goto The Barrens 62.64,37.42 |q 4300 |future
|tip You should have 8 of these.
|tip Collect these items from the bank.
collect Fool's Stout Report##5807 |goto The Barrens 62.64,37.42 |q 1122
collect Stoley's Bottle##9245 |goto The Barrens 62.64,37.42 |q 2874
collect 12 Pupellyverbos Port##3900 |goto The Barrens 62.64,37.42 |q 580
collect 15 Silk Cloth##4306 |goto The Barrens 62.64,37.42 |q 4449 |future
|tip You need these for a quest in Searing Gorge soon.
step
Enter the building |goto The Barrens 62.52,38.58 < 10 |walk
talk Liv Rizzlefix##8496
|tip Inside the building.
accept Volcanic Activity##4502 |goto The Barrens 62.45,38.74
step
Enter the building |goto The Barrens 62.08,39.25 < 15 |walk
talk Innkeeper Wiley##6791
|tip Inside the building.
|tip Stock up on food and water, you have a long questing session coming up.
home Ratchet |goto The Barrens 62.05,39.41
|only if not guideflag("Maraflag")
step
Enter the building |goto Stranglethorn Vale 28.11,75.00 < 10 |walk
talk Haren Kanmae##2839
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 10 extra stacks.
|tip You will be out questing for a while, with no easy access to an ammo vendor.
Visit the Vendor |vendor Haren Kanmae##2839 |goto Stranglethorn Vale 28.31,74.56 |q 1122
|only if Hunter
step
Enter the building |goto Stranglethorn Vale 27.64,77.09 < 7 |walk
talk "Sea Wolf" MacKinley##2501
|tip Inside the building.
turnin Deliver to MacKinley##2874 |goto Stranglethorn Vale 27.78,77.07
step
talk Ian Strom##1411
Train your spells. |trainer Ian Strom##1411 |goto Stranglethorn Vale/0 26.82,77.16 |q 580
|tip He is on the second floor of the inn, in a back room.
|only if Rogue
step
Enter the building |goto Stranglethorn Vale 27.08,77.62 < 7 |walk |only if not subzone("The Salty Sailor Tavern")
talk Whiskey Slim##2491
|tip Inside the building, on the bottom floor.
turnin Whiskey Slim's Lost Grog##580 |goto Stranglethorn Vale 27.13,77.45
step
talk Crank Fizzlebub##2498
|tip Inside the building, on the bottom floor.
turnin Report Back to Fizzlebub##1122 |goto Stranglethorn Vale 27.11,77.27
step
|tip We are heading to Maraudon now.
|tip You really want your hearthstone set here to save time turning in Maraudon quests later.
|tip It will make a flight in the Searing Gorge guide take ~6 minutes longer but is well worth it to save 30 minutes now.
home Shadowprey Village |goto Desolace/0 24.11,68.22
|only if guideflag("Maraflag")
step
Run up the stairs |goto Desolace 23.61,70.08 < 7 |only if walking
talk Vark Battlescar##11823
|tip Upstairs inside the building.
accept Vyletongue Corruption##7029 |goto Desolace 23.22,70.32
|only if guideflag("Maraflag")
step
talk Selendra##13699
accept Corruption of Earth and Seed##7064 |goto Desolace 26.86,77.67
|only if guideflag("Maraflag")
step
talk Willow##13656
|tip Inside the building.
accept Twisted Evils##7028 |goto Desolace 62.19,39.63
|only if guideflag("Maraflag")
step
talk Centuar Pariah##13717
|tip He walks around this area.
accept The Pariah's Instructions##7067 |goto Desolace 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
|only if guideflag("Maraflag")
step
Run up the stairs |goto Desolace 29.84,62.54 < 7 |only if walking
|tip Once you have your group assembled, head inside.
click Stone Door
Enter the building |goto Desolace/0 29.11,62.56 < 10 |c |q 7066 |future
|only if guideflag("Maraflag")
step
Run down the stairs |goto Desolace/0 38.25,57.99 < 7 |only if walking
Follow the path |goto Desolace/0 38.43,57.85 < 10 |only if walking
Continue following the path |goto Desolace/0 38.64,57.71 < 7 |only if walking
Continue following the path |goto Desolace/0 38.53,57.55 < 10 |only if walking
Continue following the path |goto Desolace/0 38.48,57.34 < 7 |q 7067
|only if guideflag("Maraflag")
step
Continue following the path |goto Desolace 29.44,57.22 < 7 |only if walking
Jump down here |goto Desolace 28.80,56.17 < 7 |q 7067
|only if guideflag("Maraflag")
step
Follow the path |goto Desolace 38.60,57.95 < 10 |only if walking
Continue following the path |goto Desolace 38.44,58.13 < 7 |only if walking
Continue following the path |goto Desolace 38.49,58.22 < 7 |q 7067
|only if guideflag("Maraflag")
step
talk Cavindra##13697
accept Legend of Maraudon##7044	|goto Desolace 38.76,58.13
|only if guideflag("Maraflag")
step
Follow the path |goto Desolace 38.82,58.31 < 7 |only if walking
use Coated Cerulean Vial##17693
collect Filled Cerulean Vial##17696 |q 7029/2 |goto Desolace 38.92,58.36
|only if guideflag("Maraflag")
step
Run Maraudon
|tip You can use our Maraudon guide if you want assistance.
|tip After completing the dungeon, run outside and return to this guide.
|tip Do not follow the Maraudon quest turnin guide.
|loadguide "Dungeon Guides\\Maraudon (Wicked Grotto - Purple) (45-53)"
|loadguide "Dungeon Guides\\Maraudon (Foulspore Cavern - Orange) (45-53)"
|loadguide "Dungeon Guides\\Maraudon (Poison Falls - Inner) (48-57)"
|loadguide "Dungeon Guides\\Maraudon (Earth Song Falls - Inner) (48-57)"
|confirm
|only if guideflag("Maraflag")
step
Run up the stairs |goto Desolace 23.61,70.08 < 7 |only if walking
talk Vark Battlescar##11823
|tip Upstairs inside the building.
turnin Vyletongue Corruption##7029 |goto Desolace 23.22,70.32
|only if guideflag("Maraflag")
step
talk Selendra##13699
turnin Corruption of Earth and Seed##7064 |goto Desolace 26.86,77.67
|only if guideflag("Maraflag")
step
talk Centuar Pariah##13717
|tip He walks around this area.
turnin The Pariah's Instructions##7067 |goto Desolace 51.47,87.41
You may also find him around: |notinsticky
[48.23,87.69]
[43.95,86.00]
|only if guideflag("Maraflag")
step
talk Willow##13656
|tip Inside the building.
turnin Twisted Evils##7028 |goto Desolace 62.19,39.63
|only if guideflag("Maraflag")
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Blasted Lands (50-51)',
  {
    image = ZGV.IMAGESDIR .. 'Blasted Lands',
    condition_suggested = function()
      return level >= 50 and level <= 51 and not completedq(2585)
    end,
    next = 'Leveling Guides\\Searing Gorge (51-52)',
    hardcore = true,
  },
  [[
step
talk Ogromm##987 |only if Hunter
talk Kartosh##988 |only if Warlock
Train your spells. |trainer Ogromm##987 |goto Swamp of Sorrows/0 47.26,53.42 |q 1444 |only if Hunter
Train your spells. |trainer Kartosh##988 |goto Swamp of Sorrows/0 48.65,55.62 |q 1444 |only if Warlock
|tip Inside the building on the stairwell. |only if Warlock
|tip Outside the building behind the wagon |only if Hunter
|only if Hunter or Warlock
step
talk Grokor##3622
Train your pet spells. |trainer Grokor##3622 |goto Swamp of Sorrows/0 47.35,52.89 |q 1444
|only if Hunter
step
Enter the building |goto Swamp of Sorrows 45.25,55.33 < 7 |walk
talk Bengor##7643
|tip Inside the building.
accept The Swamp Talker##2623 |goto Swamp of Sorrows 44.98,57.34
step
Enter the building |goto Swamp of Sorrows 46.95,54.07 < 10 |walk
talk Fel'zerul##1443
|tip Upstairs inside the building.
turnin Return to Fel'Zerul##1444 |goto Swamp of Sorrows 47.93,54.79
step
Enter the cave |goto Swamp of Sorrows 66.22,76.75 < 20 |walk
Follow the path |goto Swamp of Sorrows 64.40,82.08 < 20 |walk
Continue following the path |goto Swamp of Sorrows 63.41,84.99 < 20 |walk
Follow the path up |goto Swamp of Sorrows 64.48,89.66 < 20 |walk
Continue up the path |goto Swamp of Sorrows 63.67,91.42 < 20 |walk
kill Swamp Talker##950
|tip Upstairs inside the cave.
|tip If he's not here, check around in other places in the cave.
|tip He can spawn in many places inside the cave.
|tip Watch for patrols of respawns.	|only if hardcore
collect Warchief's Orders##8463 |q 2623/1 |goto Swamp of Sorrows 62.60,88.08
step
Leave the cave |goto Swamp of Sorrows 66.37,76.54 < 15 |walk |only if subzone("Stagalbog Cave")
talk Fallen Hero of the Horde##7572
turnin The Swamp Talker##2623 |goto Swamp of Sorrows 34.29,66.13
accept A Tale of Sorrow##2801 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
Select _"Please continue, Hero..."_
Listen to a Tale of Sorrow |q 2801/1 |goto Swamp of Sorrows 34.29,66.13
step
talk Fallen Hero of the Horde##7572
turnin A Tale of Sorrow##2801 |goto Swamp of Sorrows 34.29,66.13
step
talk Bloodmage Drazial##7505
accept Snickerfang Jowls##2581 |goto Blasted Lands 50.55,14.21
accept A Boar's Vitality##2583 |goto Blasted Lands 50.55,14.21
accept The Decisive Striker##2585 |goto Blasted Lands 50.55,14.21
step
talk Bloodmage Lynnore##7506
accept The Basilisk's Bite##2601 |goto Blasted Lands 50.64,14.30
accept Vulture's Vigor##2603 |goto Blasted Lands 50.64,14.30
stickystart "Collect_Blasted_Boar_Lungs"
stickystart "Collect_Scorpok_Pincers"
stickystart "Collect_Basilisk_Brains"
stickystart "Collect_Vulture_Gizzards"
stickystart "Collect_Snickerfang"
step
label "Collect_Vulture_Gizzards"
kill Black Slayer##5982+
|tip Bonepickers will also drop the quest item.
|tip They look like vultures.
|tip You will collect enough of these to turn in all 5 quests at once. |notinsticky
|tip These usually take the longest to collect, by far.
|tip Go out of your way to camp the vulture spawns and kill other mobs while they respawn.
|tip You can try to buy them from the auction house, if you don't want to spend the time to collect them. |only if not selfmade
collect 14 Vulture Gizzard##8396 |goto Blasted Lands 48.50,19.78 |q 2603
You can find more around: |notinsticky
[45.45,35.25]
[53.42,37.61]
[55.04,43.80]
[59.33,42.05]
[56.46,36.51]
[58.82,27.97]
[62.28,26.43]
step
label "Collect_Basilisk_Brains"
Kill Redstone enemies around this area
|tip They look like basilisks.
|tip These should be your second priority after vultures.
|tip They share spawn locations with other enemies. |notinsticky
|tip They share spawns with the boars. |notinsticky
|tip You will collect enough of these to turn in all 5 quests at once. |notinsticky
collect 11 Basilisk Brain##8394 |goto Blasted Lands 55.08,28.94 |q 2601
You can find more around: |notinsticky
[61.75,27.98]
[59.71,43.76]
step
label "Collect_Blasted_Boar_Lungs"
Kill Boar enemies around this area
|tip They share spawn locations with the basilisks. |notinsticky
|tip If you can't find any at these locations, kill other enemies to get them to spawn. |notinsticky
|tip You will collect enough of these to turn in all 5 quests at once. |notinsticky
collect 6 Blasted Boar Lung##8392 |goto Blasted Lands 57.51,28.74 |q 2583
You can find more around: |notinsticky
[61.82,28.49]
[59.11,35.83]
[59.52,43.48]
step
label "Collect_Snickerfang"
Kill Snickerfang enemies around this area
|tip They look like hyenas.
|tip They share spawn locations with the scorpions. |notinsticky
|tip If you can't find any at these locations, kill other enemies to get them to spawn.
|tip You will collect enough of these to turn in all 5 quests at once. |notinsticky
collect 5 Snickerfang Jowl##8391 |goto Blasted Lands 47.21,21.18 |q 2581
You can find more around: |notinsticky
[44.82,24.87]
[45.44,35.35]
[50.96,38.09]
step
label "Collect_Scorpok_Pincers"
kill Scorpok Stinger##5988+
|tip They look like scorpions.
|tip They share spawn locations with the hyenas. |notinsticky
|tip If you can't find any at these locations, kill other enemies to get them to spawn. |notinsticky
|tip You will collect enough of these to turn in all 5 quests at once. |notinsticky
collect 6 Scorpok Pincer##8393 |goto Blasted Lands 49.10,18.12 |q 2585
You can find more around: |notinsticky
[45.29,21.33]
[44.61,29.11]
[52.04,30.03]
[56.81,21.17]
step
talk Kum'isha the Collector##7363
|tip He walks around this area.
accept Everything Counts In Large Amounts##3501 |goto Blasted Lands 51.80,35.64
|only if itemcount(10593) > 0
step
talk Kum'isha the Collector##7363
|tip He walks around this area.
turnin Everything Counts In Large Amounts##3501 |goto Blasted Lands 51.80,35.64
|only if haveq(3501) or completedq(3501)
step
step
talk Bloodmage Lynnore##7506
turnin The Basilisk's Bite##2601 |goto Blasted Lands 50.64,14.30
turnin Vulture's Vigor##2603 |goto Blasted Lands 50.64,14.30
step
talk Bloodmage Drazial##7505
turnin Snickerfang Jowls##2581 |goto Blasted Lands 50.55,14.21
turnin A Boar's Vitality##2583 |goto Blasted Lands 50.55,14.21
turnin The Decisive Striker##2585 |goto Blasted Lands 50.55,14.21
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
|tip They sell well on the Auction House if you'd rather do that.
trash Snickerfang Jowl##8391
trash Blasted Boar Lung##8392
trash Scorpok Pincer##8393
trash Basilisk Brain##8394
trash Vulture Gizzard##8396
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Searing Gorge (51-52)',
  {
    image = ZGV.IMAGESDIR .. 'Searing Gorge',
    condition_suggested = function()
      return level >= 51 and level <= 52 and not completedq(4022)
    end,
    next = 'Leveling Guides\\Burning Steppes (52-52)',
    hardcore = true,
  },
  [[
step
talk Thal'trak Proudtusk##9082
|tip He walks along the path near Kargath.
|tip He will only offer the quest when he's standing here.
|tip If he's not here, wait until he walks walk to this location.
accept Dreadmaul Rock##3821 |goto Badlands 3.36,48.07
step
click Wooden Outhouse##173265
accept Caught!##4449 |goto Searing Gorge 65.54,62.24
step
kill 8 Dark Iron Geologist##5839 |q 4449/1 |goto Searing Gorge 63.13,60.28
|tip They share spawn points with the Dark Iron Watchmen, so kill those too, if you can't find any.
|tip Watch for respawns around the area.	|only if hardcore
step
click Wooden Outhouse##173265
|tip You should have the Silk Cloth already from a previous guide.
turnin Caught!##4449 |goto Searing Gorge 65.54,62.24
step
Follow the path |goto Searing Gorge 66.79,34.56 < 50 |only if walking
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
step
Follow the path up |goto Searing Gorge 31.52,33.54 < 20 |only if walking and not subzone("Thorium Point")
talk Grisha##3305
|tip Make a sharp turn at the top of the path.
fpath Thorium Point |goto Searing Gorge 34.85,30.87
step
click Wanted/Missing/Lost & Found##179827
accept STOLEN: Smithing Tuyere and Lookout's Spyglass##7728 |goto Searing Gorge 37.63,26.53
accept JOB OPPORTUNITY: Culling the Competition##7729 |goto Searing Gorge 37.63,26.53
step
talk Hansel Heavyhands##14627
accept Curse These Fat Fingers##7723 |goto Searing Gorge 38.57,27.80
accept Fiery Menace!##7724 |goto Searing Gorge 38.57,27.80
accept Incendosaurs? Whateverosaur is More Like It##7727 |goto Searing Gorge 38.57,27.80
stickystart "Collect_Smithing_Lookout"
stickystart "Collect_Grimesilt_Outhouse_Key"
stickystart "Collect_Golem_Oil"
stickystart "Collect_Hearts_Of_Flame"
stickystart "Kill_Greater_Lava_Spiders"
stickystart "Kill_Heavy_War_Golems"
step
label "Collect_Smithing_Tuyere"
kill Dark Iron Steamsmith##5840+
|tip Prioritize this step heavily.
|tip They have a roughly 5 minute respawn time and a low drop rate.
|tip Work on the other quests around this area while waiting for them to respawn.
collect Smithing Tuyere##18959 |q 7728/1 |goto Searing Gorge 39.13,49.64
You can find more around [42.86,51.59]
step
label "Collect_Smithing_Lookout"
kill Dark Iron Lookout##8566+
|tip They are around the watch towers on the cliff surrounding the huge pit.
|tip There are not many of these and should be your second priority for clears after Steamsmiths.
collect Lookout's Spyglass##18960 |q 7728/2 |goto Searing Gorge 33.03,53.44
You can find more around: |notinsticky
[35.40,59.82]
[43.47,63.52]
[52.47,57.97]
step
label "Collect_Golem_Oil"
Kill enemies around this area
|tip Only Tempered War Golems, Heavy War Golems, and Magma Elementals will drop the quest item.
|tip Prioritize Magma elementals where possible. |notinsticky
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
|tip Prioritize Magma elementals where possible. |notinsticky
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
stickystart "Collect_Thorium_Plated_Daggers"
step
label "Kill_Greater_Lava_Spiders"
kill 20 Greater Lava Spider##5858 |q 7724/1 |goto Searing Gorge 28.78,44.44
You can find more around: |notinsticky
[29.23,55.00]
[29.51,72.50]
step
label "Kill_Heavy_War_Golems"
kill 20 Heavy War Golem##5854 |q 7723/1	|goto Searing Gorge 32.42,49.43
You can find more around: |notinsticky
[37.02,42.98]
[47.99,38.64]
step
Jump down onto the metal walkway here |goto Searing Gorge 49.32,43.74 < 15 |only if walking
Enter the cave |goto Searing Gorge 49.58,45.49 < 10 |c |q 7727
|only if not (subzone("The Slag Pit") and _G.IsIndoors())
stickystop "Collect_Thorium_Plated_Daggers"
step
Jump down from the bridge inside the cave here |goto Searing Gorge 47.73,41.92 < 10 |walk
kill 20 Incendosaur##9318 |q 7727/1 |goto Searing Gorge 51.73,37.16
|tip Inside the cave.
You can find more around: |notinsticky
[50.37,24.75]
[45.03,21.73]
stickystart "Kill_Dark_Iron_Taskmasters"
stickystart "Kill_Dark_Iron_Slavers"
step
label "Collect_Thorium_Plated_Daggers"
Follow the path |goto Searing Gorge 50.14,38.78 < 15 |walk
Continue following the path |goto Searing Gorge 47.13,43.05 < 15 |walk
Leave the cave |goto Searing Gorge 47.52,46.46 < 15 |walk
Enter the cave at the other entrance |goto Searing Gorge 49.60,45.50 < 15 |walk
Kill Dark Iron enemies around this area
|tip They look like dwarves.
|tip Inside the cave, all throughout. |notinsticky
|tip Watch out for patrols and respawns.	|only if hardcore |notinsticky
collect 8 Thorium Plated Dagger##10551 |q 3443/1 |goto Searing Gorge 43.38,34.94
step
label "Kill_Dark_Iron_Taskmasters"
kill 15 Dark Iron Taskmaster##5846 |q 7729/1 |goto Searing Gorge 43.38,34.94
|tip Inside the cave, all throughout. |notinsticky
|tip Watch out for patrols and respawns.	|only if hardcore |notinsticky
|tip You can also find some outside, near Thorium Point. |notinsticky
step
label "Kill_Dark_Iron_Slavers"
kill 15 Dark Iron Slaver##5844 |q 7729/2 |goto Searing Gorge 43.38,34.94
|tip Inside the cave, all throughout. |notinsticky
|tip Watch out for patrols and respawns.	|only if hardcore |notinsticky
|tip You can also find some outside, near Thorium Point. |notinsticky
step
label "Collect_Grimesilt_Outhouse_Key"
use the Grimesilt Outhouse Key##11818
accept The Key to Freedom##4451
|only if itemcount(11818) > 0
step
Leave the cave |goto Searing Gorge 49.58,45.49 < 10 |c |only if (subzone("The Slag Pit") and _G.IsIndoors())
talk Master Smith Burninate##14624
|tip Restock on arrows |only if Hunter
Vendor your Trash |vendor Master Smith Burninate##14624 |goto Searing Gorge/0 38.69,28.35 |q 7723
step
Leave the cave |goto Searing Gorge 49.58,45.49 < 10 |c |only if (subzone("The Slag Pit") and _G.IsIndoors())
talk Hansel Heavyhands##14627
turnin Curse These Fat Fingers##7723 |goto Searing Gorge 38.59,27.81
turnin Fiery Menace!##7724 |goto Searing Gorge 38.59,27.81
turnin Incendosaurs? Whateverosaur is More Like It##7727 |goto Searing Gorge 38.59,27.81
step
talk Taskmaster Scrange##14626
turnin STOLEN: Smithing Tuyere and Lookout's Spyglass##7728 |goto Searing Gorge 38.98,27.51
turnin JOB OPPORTUNITY: Culling the Competition##7729 |goto Searing Gorge 38.98,27.51
step
talk Kalaran Windblade##8479
turnin Forging the Shaft##3443 |goto Searing Gorge 39.06,38.99
accept The Flame's Casing##3452 |goto Searing Gorge 39.06,38.99	|only if not hardcore
step
Kill Twilight enemies around this area
|tip They are elite enemies, so you may need help with this.
|tip If you have trouble, try to find someone to help you.
|tip Doing this quest unlocks more quests that give easy experience, so it's important to get it done.
collect Symbol of Ragnaros##10552 |q 3452/1 |goto Searing Gorge 24.62,35.13
You can find more inside the cave at [21.89,36.36]
You can find more up the path that starts at [24.23,33.12]
|only if not hardcore
step
talk Kalaran Windblade##8479
turnin The Flame's Casing##3452 |goto Searing Gorge 39.05,38.99
accept The Torch of Retribution##3453 |goto Searing Gorge 39.05,38.99
|only if not hardcore
step
Watch the dialogue
Witness the Creation of the Torch |q 3453/1 |goto Searing Gorge 39.05,38.99
|only if not hardcore
step
talk Kalaran Windblade##8479
turnin The Torch of Retribution##3453 |goto Searing Gorge 39.05,38.99
accept The Torch of Retribution##3454 |goto Searing Gorge 39.05,38.99
|only if not hardcore
step
click Torch of Retribution##149047
turnin The Torch of Retribution##3454 |goto Searing Gorge 39.06,39.06
|only if not hardcore
step
talk Kalaran Windblade##8479
accept Squire Maltrake##3462 |goto Searing Gorge 39.05,39.00
|only if not hardcore
step
talk Squire Maltrake##8509
turnin Squire Maltrake##3462 |goto Searing Gorge 39.16,38.99
accept Set Them Ablaze!##3463 |goto Searing Gorge 39.16,38.99
|only if not hardcore
step
Run up the ramp |goto Searing Gorge 33.50,53.64 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Northern Tower Ablaze |q 3463/4 |goto Searing Gorge 33.31,54.49
|only if not hardcore
step
Run up the ramp |goto Searing Gorge 35.92,59.85 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Western Tower Ablaze |q 3463/1 |goto Searing Gorge 35.67,60.68
|only if not hardcore
step
Follow the path |goto Searing Gorge 35.00,72.13 < 50 |only if walking
Run up the ramp |goto Searing Gorge 44.10,61.85 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Southern Tower Ablaze |q 3463/2 |goto Searing Gorge 44.03,60.91
|only if not hardcore
step
Cross the hanging bridge |goto Searing Gorge 52.48,57.95 < 15 |only if walking
Run up the ramp |goto Searing Gorge 50.19,55.61 < 15 |only if walking
click Sentry Brazier##149025
|tip On the metal platform of the tower.
|tip You have to equip the Torch of Retribution.
|tip Remember to re-equip your normal weapon after.
Set the Eastern Tower Ablaze |q 3463/3 |goto Searing Gorge 50.06,54.74
|only if not hardcore
step
click Wooden Outhouse##173265
turnin The Key to Freedom##4451 |goto Searing Gorge 65.53,62.23
step
Follow the path |goto Searing Gorge 66.79,34.56 < 50 |only if walking
talk Squire Maltrake##8509
turnin Set Them Ablaze!##3463 |goto Searing Gorge 39.17,39.00
|only if not hardcore
step
_Destroy This Item:_
|tip It is no longer needed.
trash Torch of Retribution##10515
step
Watch the dialogue
click Hoard of the Black Dragonflight##149502
accept Trinkets...##3481 |goto Searing Gorge 38.86,38.99
|only if not hardcore
step
click Hoard of the Black Dragonflight##149502
turnin Trinkets...##3481 |goto Searing Gorge 38.86,38.99
|only if not hardcore
step
use the Hoard of the Black Dragonflight##10569
collect Black Dragonflight Molt##10575 |q 4022 |future
|tip Keep this, you'll need it for a future quest.
|only if not hardcore
step
Kill enemies around this area
|tip You are about to have to kill a bit higher level enemies in Burning Steppes soon, and then you will go to Orgrimmar.
|tip It will be a good time to learn your level 52 abilities.
ding 52 |goto Searing Gorge 28.78,44.44
You can find more around: |notinsticky
[29.23,55.00]
[29.51,72.50]
step
Enter Blackrock Mountain and run through to Burning Steppes |goto Searing Gorge 34.80,83.96
|tip The waypoint arrow will not work inside Blackrock Mountain.
|tip Just follow the path to the other doorway, then run down the ramp to enter Burning Steppes.
Travel to the Burning Steppes |complete zone("Burning Steppes")
|only if not haveq(4726) or completedq(4726)
step
talk Vahgruk##13177
|tip The enemies in this zone are too high for your level.
|tip Be very careful to navigate around them and not aggro any while running.
|tip If you die running here, just resurrect at the spirit healer. |only if not hardcore
fpath Flame Crest |goto Burning Steppes 65.68,24.21
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Burning Steppes (52-52)',
  {
    image = ZGV.IMAGESDIR .. 'Burning Steppes',
    condition_suggested = function()
      return level == 52 and not completedq(4300)
    end,
    next = ZGV.IsClassicSoD and 'Leveling Guides\\Felwood (52-53)'
      or 'Leveling Guides\\Azshara (52-52)',
    hardcore = true,
  },
  [[
step
_NOTE:_
Save Runecloth in Your Bank as You Level
|tip You are reaching the level where Runecloth will start to drop regularly
|tip You will need 240 Runecloth later.
|tip As you level and collect these cloth naturally from killing enemies while following the guide, make sure you deposit the cloth into a bank whenever you are near one.
|tip This will give you about 40,000 quick and easy xp to help you get to level 60 faster in the longer later levels.
Click Here to Continue |confirm
|only if level < 60
step
talk Tinkee Steamboil##10267
accept Broodling Essence##4726 |goto Burning Steppes 65.24,24.00
step
talk Maxwort Uberglint##9536
accept Tablet of the Seven##4296 |goto Burning Steppes 65.16,23.92
step
Follow the path up |goto Burning Steppes 75.39,38.29 < 20 |only if walking
click Sha'ni Proudtusk's Remains
|tip On a stone table at the top of the mountain.
talk Sha'ni Proudtusk##9136
|tip She appears nearby.
turnin Dreadmaul Rock##3821 |goto Burning Steppes 79.79,45.52
stickystart "Collect_Broodling_Essences"
step
Enter the cave |goto Burning Steppes 94.11,31.92 < 15 |walk
talk Cyrus Therepentous##9459
|tip Inside the cave.
accept A Taste of Flame##4022 |goto Burning Steppes 95.06,31.57
|only if not hardcore
step
talk Cyrus Therepentous##9459
|tip Inside the cave.
Select _"I do not posess proof any proof, Cyrus."_
kill Frenzied Black Drake##9461
|tip This dragon is a 54 elite and will immediately attack you.
|tip You may need help with this.
|tip The molt item is not group loot, so only one person can loot it.
collect Black Dragonflight Molt##10575 |q 4022/1 |goto Burning Steppes 95.06,31.57
|only if not hardcore
step
talk Cyrus Therepentous##9459
|tip Inside the cave.
Select _"I present you with proof of my deeds, Cyrus."_
Present the Proof |q 4022/2 |goto Burning Steppes 95.06,31.57
|only if not hardcore
step
talk Cyrus Therepentous##9459
|tip Inside the cave.
turnin A Taste of Flame##4022 |goto Burning Steppes 95.06,31.57
|only if not hardcore
step
label "Collect_Broodling_Essences"
use the Draco-Incarcinatrix 900##12284
|tip Use it on Broodling enemies around this area.
|tip They look like small flying dragons.
|tip They share spawn points with the scorpids and wolves, so kill those also, if you can't find any.
Kill Broodling enemies around this area
click Broodling Essence+
|tip They look like red floating crystals that appear above their corpses after you kill them.
collect 8 Broodling Essence##12283 |q 4726/1 |goto Burning Steppes 72.83,28.41
You can find more around: |notinsticky
[80.05,27.94]
[87.34,32.01]
[91.96,35.64]
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells soon and then we will hearth.
|tip This step will complete when your Hearthstone is almost ready to use.
Grind XP Until Your Hearth Is Almost Ready |complete C_Container.GetItemCooldown(6948) <= 500 |goto Burning Steppes 72.83,28.41 |q 4296
|only if Druid
step
click Tablet of the Seven##169294
Choose _"Transcribe the tablet."_
collect Tablet Transcript##11470 |q 4296/1 |goto Burning Steppes 54.09,40.73
step
Follow the path up |goto Burning Steppes 63.92,29.88 < 20 |only if walking and not subzone("Flame Crest")
talk Tinkee Steamboil##10267
turnin Broodling Essence##4726 |goto Burning Steppes 65.23,23.99
accept Felnok Steelspring##4808 |goto Burning Steppes 65.23,23.99
step
talk Maxwort Uberglint##9536
turnin Tablet of the Seven##4296 |goto Burning Steppes 65.15,23.91
step
talk Chemist Fuely##10136
accept A Sample of Slime...##4293 |goto Undercity/0 47.45,73.36
accept ... and a Batch of Ooze##4294 |goto Undercity/0 47.45,73.36
step
talk William Montague##4549
|tip Collect these items from the bank.
collect Box of Empty Vials##10695 |goto Undercity 65.97,44.75 |q 3568
collect Dran's Ripple Delivery##8685 |goto Undercity 65.97,44.75 |q 81
collect Linken's Training Sword##11133 |goto Undercity 65.97,44.75 |q 3908
collect 8 White Ravasaur Claw##11477 |goto Undercity 65.97,44.75 |q 4300
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 4300
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
step
Enter the building |goto Orgrimmar 48.19,79.68 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 10-15 extra stacks.
|tip You will be out questing for a while, with no easy access to an ammo vendor.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 4300
|only if Hunter
step
talk Ormak Grimshot##3352 |only if Hunter
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer	Ormak Grimshot##3352 |goto Orgrimmar/0 66.08,18.51 |only if Hunter |q 4300
Train your spells. |trainer Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 4300
Train your spells. |trainer Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 4300
Train your spells. |trainer Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 4300
Train your spells. |trainer Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 4300
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 4300
Train your spells. |trainer Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 4300
|tip Inside the building. |only if Warrior or Mage or Priest
step
Run up the stairs |goto Orgrimmar 56.42,56.92 < 15 |only if walking
Enter the building |goto Orgrimmar 57.06,45.88 < 10 |walk
talk Zilzibin Drumlore##7010
|tip Inside the building.
accept March of the Silithid##4494 |goto Orgrimmar 56.27,46.67
step
talk Kurgul##5815
|tip Inside the Cleft of Shadow.
|tip If you can afford them.
|tip Buy all of the Grimoires for spells that are upgrades for the spells you use with your pet.
|tip After buying them, make sure to use them in your bags to learn the spells.
Visit the Vendor |vendor Kurgul##5815 |goto Orgrimmar 47.52,46.72 |q 4300
|only if Warlock
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 81
|only if Rogue
step
Enter the building |goto Orgrimmar 58.97,37.57 < 10 |walk
talk Dran Droffers##6986
|tip Inside the building.
turnin Ripple Delivery##81 |goto Orgrimmar 59.48,36.59
step
Enter the building |goto Orgrimmar 56.47,35.25 < 10 |walk
talk Jes'rimon##8659
|tip Upstairs on the balcony of the building.
turnin Bone-Bladed Weapons##4300 |goto Orgrimmar 55.52,34.09
step
Enter the building |goto Orgrimmar 54.04,68.86 < 10 |walk
talk Innkeeper Gryshka##6929
|tip Inside the building.
home Orgrimmar |goto Orgrimmar 54.09,68.42
step
talk Barkeep Morag##5611
Restock Food / Water |vendor Barkeep Morag##5611 |goto Orgrimmar/0 54.63,67.81 |q 4494
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Azshara (52-52)',
  {
    image = ZGV.IMAGESDIR .. 'Azshara',
    condition_suggested = function()
      return level == 52 and not completedq(3565)
    end,
    next = 'Leveling Guides\\Felwood (52-53)',
    hardcore = true,
    hideif = ZGV.IsClassicSoD,
  },
  [[
step
talk Loh'atu##11548
accept Spiritual Unrest##5535 |goto Azshara 11.37,78.16
accept A Land Filled with Hatred##5536 |goto Azshara 11.37,78.16
stickystart "Kill_Highborne_Lichlings"
step
Follow the path up |goto Azshara 13.45,73.32 < 30 |only if walking
kill 6 Highborne Apparition##6116 |q 5535/1 |goto Azshara 14.66,72.47
You can find more around [17.21,68.82]
step
label "Kill_Highborne_Lichlings"
kill 6 Highborne Lichling##6117 |q 5535/2 |goto Azshara 17.21,68.82
You can find more around [14.66,72.47]
stickystart "Kill_Haldarr_Trickster"
stickystart "Kill_Haldarr_Felsworns"
step
Follow the path up |goto Azshara 19.36,62.52 < 30 |only if walking
kill 6 Haldarr Satyr##6125 |q 5536/1 |goto Azshara 19.82,61.38
|tip These Satyr share spawns and you may need to do multiple clears to get the ones you need.
|tip Grind enemies around the hill while waiting on respawns.
step
label "Kill_Haldarr_Trickster"
kill 2 Haldarr Trickster##6126 |q 5536/2 |goto Azshara 19.82,61.38
|tip These Satyr share spawns and you may need to do multiple clears to get the ones you need. |notinsticky
|tip Grind enemies around the hill while waiting on respawns. |notinsticky
step
label "Kill_Haldarr_Felsworns"
kill 2 Haldarr Felsworn##6127 |q 5536/3 |goto Azshara 19.82,61.38
|tip These Satyr share spawns and you may need to do multiple clears to get the ones you need. |notinsticky
|tip Grind enemies around the hill while waiting on respawns. |notinsticky
step
talk Loh'atu##11548
turnin Spiritual Unrest##5535 |goto Azshara 11.37,78.17
turnin A Land Filled with Hatred##5536 |goto Azshara 11.37,78.17
step
talk Kroum##8610
fpath Valormok |goto Azshara 21.96,49.62
step
talk Ag'tor Bloodfist##8576
turnin Betrayed##3504 |goto Azshara 22.26,51.48
step
talk Jediga##8587
accept Stealing Knowledge##3517 |goto Azshara 22.56,51.42
stickystart "Collect_Tablet_Of_BethAmara"
stickystart "Collect_Tablet_Of_Jinyael"
stickystart "Collect_Tablet_Of_Saelhai"
step
click Tablet of Markri##148514
|tip It looks like a stone rectangle with green glowing runes on it.
|tip It can spawn in multiple locations, so keep an eye out for it as you walk around this area.
collect Tablet of Markri##10540 |q 3517/3 |goto Azshara 34.66,55.62
It can also be at: |notinsticky
[35.69,56.50]
[40.00,64.17]
[37.92,47.77]
[39.85,45.88]
step
label "Collect_Tablet_Of_BethAmara"
click Tablet of Beth'Amara##148516
|tip It looks like a stone rectangle with pink glowing runes on it.
|tip It can spawn in multiple locations, so keep an eye out for it as you walk around this area. |notinsticky
collect Tablet of Beth'Amara##10538 |q 3517/1 |goto Azshara 35.20,58.00
It can also be at: |notinsticky
[39.53,64.29]
[38.89,53.45]
[37.08,51.84]
[39.59,48.16]
step
label "Collect_Tablet_Of_Jinyael"
click Tablet of Jin'yael##148513
|tip It looks like a stone rectangle with blue glowing runes on it.
|tip It can spawn in multiple locations, so keep an eye out for it as you walk around this area. |notinsticky
collect Tablet of Jin'yael##10539 |q 3517/2 |goto Azshara 36.44,54.02
It can also be at: |notinsticky
[38.30,53.42]
[37.41,60.66]
[36.27,62.19]
step
label "Collect_Tablet_Of_Saelhai"
click Tablet of Sael'hai##148515
|tip It looks like a stone rectangle with yellow glowing runes on it.
|tip It can spawn in multiple locations, so keep an eye out for it as you walk around this area. |notinsticky
collect Tablet of Sael'hai##10541 |q 3517/4 |goto Azshara 35.90,53.53
It can also be at: |notinsticky
[37.31,48.10]
[38.58,54.58]
[37.15,60.54]
[41.48,65.02]
step
use the Box of Empty Vials##10695
collect Empty Vial Labeled #1##10687 |q 3568 |goto Azshara 47.70,61.05
collect Empty Vial Labeled #2##10688 |q 3568 |goto Azshara 47.70,61.05
collect Empty Vial Labeled #3##10689 |q 3568 |goto Azshara 47.70,61.05
collect Empty Vial Labeled #4##10690 |q 3568 |goto Azshara 47.70,61.05
step
use the Empty Vial Labeled #1##10687
|tip Use it in the water.
collect Filled Vial Labeled #1##10691 |q 3568/1 |goto Azshara 47.70,61.05
step
use the Empty Vial Labeled #2##10688
|tip Use it in the water.
collect Filled Vial Labeled #2##10692 |q 3568/2 |goto Azshara 47.86,51.55
step
use the Empty Vial Labeled #3##10689
|tip Use it in the water.
collect Filled Vial Labeled #3##10693 |q 3568/3 |goto Azshara 48.60,48.56
step
use the Empty Vial Labeled #4##10690
|tip Use it in the water.
collect Filled Vial Labeled #4##10694 |q 3568/4 |goto Azshara 47.41,46.28
step
Follow the path up |goto Azshara 46.00,38.71 < 30 |only if walking and subzone("The Shattered Strand")
talk Jediga##8587
turnin Stealing Knowledge##3517 |goto Azshara 22.56,51.42
accept Delivery to Magatha##3518 |goto Azshara 22.56,51.42
accept Delivery to Jes'rimon##3541 |goto Azshara 22.56,51.42
accept Delivery to Archmage Xylem##3561 |goto Azshara 22.56,51.42
|nohearth
step
talk Sanath Lim-yo##8395 |goto Azshara 28.11,50.09
|tip Accept the "Meeting with the Master" quest.
Teleport Up the Mountain |goto Azshara 26.33,46.23 < 20 |noway |c |q 3561
step
Follow the path up |goto Azshara 26.53,43.88 < 20 |only if walking
Enter the building |goto Azshara 29.22,40.71 < 10 |walk
talk Archmage Xylem##8379
|tip He walks around inside the building, on multiple levels.
turnin Delivery to Archmage Xylem##3561 |goto Azshara 29.71,40.52
accept Xylem's Payment to Jediga##3565 |goto Azshara 29.71,40.52
step
Leave the building |goto Azshara 29.21,40.73 < 10 |walk
Follow the path down |goto Azshara 26.90,42.85 < 20 |only if walking
talk Nyrill##8399 |goto Azshara 26.47,46.28
|tip Accept the "Return Trip" quest.
Teleport to the Ground |goto Azshara 28.06,50.41 < 20 |noway |c |q 3565
step
talk Jediga##8587
turnin Xylem's Payment to Jediga##3565 |goto Azshara 22.56,51.42
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Felwood (52-53)',
  {
    image = ZGV.IMAGESDIR .. 'Felwood',
    condition_suggested = function()
      return level >= 52 and level <= 53 and not completedq(8465)
    end,
    next = 'Leveling Guides\\Winterspring (53-53)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 5155 |future
|only if Rogue
step
talk Greta Mosshoof##10922
|tip She walks around this area.
accept Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
step
talk Taronn Redfeather##10921
|tip Inside the building.
accept Verifying the Corruption##5156 |goto Felwood 50.89,81.62
step
talk Maybess Riverbreeze##9529
|tip She walks around this area.
accept Cleansing Felwood##4102 |goto Felwood 46.68,82.98
stickystart "Kill_Jaedenar_Guardians"
stickystart "Kill_Jaedenar_Adepts"
stickystart "Kill_Jaedenar_Cultists"
step
kill 4 Jaedenar Hound##7125 |q 5155/1 |goto Felwood 38.87,58.49
|tip You can find more in the caves nearby in this area.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
You can find more around: |notinsticky
[37.87,60.72]
[35.12,60.26]
step
label "Kill_Jaedenar_Guardians"
kill 4 Jaedenar Guardian##7113 |q 5155/2 |goto Felwood 38.87,58.49
|tip You can find more in the caves nearby in this area. |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[37.87,60.72]
[35.12,60.26]
step
label "Kill_Jaedenar_Adepts"
kill 6 Jaedenar Adept##7115 |q 5155/3 |goto Felwood 38.87,58.49
|tip You can find more in the caves nearby in this area. |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[37.87,60.72]
[35.12,60.26]
step
label "Kill_Jaedenar_Cultists"
kill 6 Jaedenar Cultist##7112 |q 5155/4 |goto Felwood 38.87,58.49
|tip You can find more in the caves nearby in this area. |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[37.87,60.72]
[35.12,60.26]
step
Follow the path |goto Felwood 38.65,57.32 < 30 |only if walking and subzone("Jaedenar")
Follow the river west |goto Felwood 37.54,49.25 < 30 |only if walking and not subzone("Bloodvenom Post")
talk Winna Hazzard##9996
accept Well of Corruption##4505 |goto Felwood 34.21,52.34
step
talk Dreka'Sur##9620
accept A Husband's Last Battle##6162 |goto Felwood 34.80,52.73
step
talk Brakkar##11900
fpath Bloodvenom Post |goto Felwood 34.44,53.96
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
Follow the road south and follow the path |goto Felwood 41.51,63.66 < 30 |only if walking and not subzone("Ruins of Constellas")
Follow the path |goto Felwood 36.64,66.86 < 30 |only if walking
use the Hardened Flasket##12566
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
|tip Be careful there are a lot of stealthed enemies here. |only if hardcore |notinsticky
collect Filled Flasket##12567 |q 4505/1 |goto Felwood 32.41,66.58
step
talk Grazle##11554
accept Timbermaw Ally##8460 |goto Felwood 50.93,85.01
stickystart "Kill_Deadwood_Warriors"
stickystart "Kill_Deadwood_Pathfinders"
stickystart "Kill_Deadwood_Gardeners"
step
kill Overlord Ror##9464
|tip Watch out for patrols and respawns while in the area. |only if hardcore
collect Overlord Ror's Claw##15879 |q 6162/1 |goto Felwood 48.23,94.27
step
label "Kill_Deadwood_Warriors"
kill 6 Deadwood Warrior##7153 |q 8460/1 |goto Felwood 48.32,92.99
|tip Enemies tend to bunch up around here.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
label "Kill_Deadwood_Pathfinders"
kill 6 Deadwood Pathfinder##7155 |q 8460/2 |goto Felwood 48.32,92.99
|tip Enemies tend to bunch up around here.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
label "Kill_Deadwood_Gardeners"
kill 6 Deadwood Gardener##7154 |q 8460/3 |goto Felwood 48.32,92.99
|tip Enemies tend to bunch up around here.		|only if hardcore |notinsticky
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
talk Grazle##11554
turnin Timbermaw Ally##8460 |goto Felwood 50.93,85.02
accept Speak to Nafien##8462 |goto Felwood 50.93,85.02
step
talk Greta Mosshoof##10922
|tip She walks around this area.
turnin Forces of Jaedenar##5155 |goto Felwood 51.21,82.11
accept Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
step
Follow the path |goto Felwood 38.43,59.68 < 30 |only if walking
use the Empty Canteen##12922
|tip Watch out for patrols and respawns while in the area.	|only if hardcore |notinsticky
collect Corrupt Moonwell Water##12907 |q 5157/1 |goto Felwood 35.19,59.95
step
Leave Jaedenar |goto Felwood 38.43,59.68 < 30 |only if walking and subzone("Jaedenar")
kill Ooze enemies around this area
collect 40 Felwood Slime Sample##12230 |goto Felwood/0 39.51,55.12
|only if haveq(4293)
stickystart "Kill_Entropic_Beasts"
stickystart "Kill_Entropic_Horrors"
step
Leave Jaedenar |goto Felwood 38.43,59.68 < 30 |only if walking and subzone("Jaedenar")
|tip Watch out for patrols and respawns while in the area.	|only if hardcore and subzone("Jaedenar") |notinsticky
Explore the Craters in Shatter Scar Vale |q 5156/3 |goto Felwood 41.54,42.98
|tip Be careful to avoid the elite Infernal Sentries around this area.
step
label "Kill_Entropic_Beasts"
kill 2 Entropic Beast##9878 |q 5156/1 |goto Felwood 41.36,41.19
|tip Be careful to avoid the elite Infernal Sentries around this area. |notinsticky
step
label "Kill_Entropic_Horrors"
kill 2 Entropic Horror##9879 |q 5156/2 |goto Felwood 41.36,41.19
|tip Be careful to avoid the elite Infernal Sentries around this area. |notinsticky
stickystart "Kill_Angerclaw_Grizzlies"
stickystart "Kill_Felpaw_Ravagers"
step
Follow the path |goto Felwood 49.95,14.87 < 50 |only if walking and not subzone("Irontree Woods")
Kill Warpwood enemies around this area
|tip Try to stay outside the cave, these enemies respawn quickly and will close you in.
|tip Grind Bears and Wolves while waiting on the outside enemies to respawn.
|tip These enemies can heal and root, be careful.	|only if hardcore
collect 15 Blood Amber##11503 |q 4102/1 |goto Felwood 55.45,17.15
step
Leave the cave |goto Felwood 55.83,17.18 < 30 |c |q 4102
|only if subzone("Irontree Cavern")
step
label "Kill_Angerclaw_Grizzlies"
kill 12 Angerclaw Grizzly##8957 |q 4120/1 |goto Felwood 53.01,15.91
You can find more around: |notinsticky
[56.24,21.15]
[56.77,25.02]
[54.68,24.72]
[53.48,28.22]
[58.13,16.84]
[61.85,17.37]
[64.07,20.11]
step
label "Kill_Felpaw_Ravagers"
kill 12 Felpaw Ravager##8961 |q 4120/2 |goto Felwood 56.24,21.15
You can find more around: |notinsticky
[56.77,25.02]
[54.68,24.72]
[53.48,28.22]
[58.13,16.84]
[61.85,17.37]
[64.07,20.11]
step
Kill enemies around this area
|tip You are about to have to kill a lot of level 54-55 enemies and will want to be higher level.
|tip Try to avoid grinding bears where you can, they are tanky.
|tip The tree elementals around the lakes nearby are great to farm if its uncontested.
ding 53 |goto Felwood 53.01,15.91
You can find more around: |notinsticky
[56.24,21.15]
[56.77,25.02]
[54.68,24.72]
[53.48,28.22]
[58.13,16.84]
[61.85,17.37]
[64.07,20.11]
step
Follow the road |goto Felwood 64.18,15.20 < 30 |only if walking
talk Nafien##15395
turnin Speak to Nafien##8462 |goto Felwood 64.77,8.13
accept Deadwood of the North##8461 |goto Felwood 64.77,8.13
stickystart "Kill_Deadwood_Avengers"
stickystart "Kill_Deadwood_Shamans"
step
kill 6 Deadwood Den Watcher##7156 |q 8461/1 |goto Felwood 63.08,8.82
|tip They will call for help when at low health so pull them away from other Deadwood enemies.	|only if hardcore
|tip Be careful pulling enemies near buildings bunching together.				|only if hardcore
|tip Watch for respawns while in the area.							|only if hardcore
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
label "Kill_Deadwood_Avengers"
kill 6 Deadwood Avenger##7157 |q 8461/2 |goto Felwood 63.08,8.82
|tip Be careful pulling enemies near buildings.	|only if hardcore |notinsticky
|tip Watch for respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
label "Kill_Deadwood_Shamans"
kill 6 Deadwood Shaman##7158 |q 8461/3 |goto Felwood 63.08,8.82
|tip Be careful pulling enemies near buildings.	|only if hardcore |notinsticky
|tip Watch for respawns while in the area.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
Follow the road |goto Felwood 64.18,15.20 < 30 |only if walking
talk Nafien##15395
|tip You may have Deadwood Headdress Feathers from killing Deadwood enemies nearby.
|tip Turn in any feathers you have with the "Feathers for Nafien" repeatable quest.
turnin Deadwood of the North##8461 |goto Felwood 64.77,8.13
accept Speak to Salfa##8465 |goto Felwood 64.77,8.13
step
Kill Deadwood enemies around this area
Reach Unfriendly Reputation with the Timbermaw Hold Faction |complete rep('Timbermaw Hold') >= Unfriendly |goto Felwood 63.08,8.82
|tip You are about to go through a long tunnel full of level 52-54 enemies.
|tip If you are not at least Unfriendly with this faction, you will be attacked.
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
You can turn in Deadwood Headdress Feathers to Nafien at [64.77,8.13]
|tip They have a chance to drop from Deadwood enemies.
|tip You can only turn in stacks of 5.
|tip Each stack of 5 will give you 50 reputation with Timbermaw Hold.
|tip It's easy to pull multiple enemies by accident in this area.	|only if hardcore |notinsticky
|tip Watch for respawns while in the area.				|only if hardcore |notinsticky
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Winterspring (53-53)',
  {
    image = ZGV.IMAGESDIR .. 'Winterspring',
    condition_suggested = function()
      return level == 53 and not completedq(4808)
    end,
    next = 'Leveling Guides\\Felwood (53-53)',
    hardcore = true,
  },
  [[
step
Enter the tunnel |goto Felwood 65.13,8.01 < 10 |walk |only if not zone("Moonglade")
Run down the stairs and follow the path |goto Felwood 65.36,2.34 < 10 |walk |only if not zone("Moonglade")
Leave the tunnel |goto Moonglade 35.75,72.48 < 10 |walk |only if not zone("Moonglade")
talk Faustron##12740
fpath Moonglade |goto Moonglade 32.09,66.61
step
talk Keeper Remulos##11832
turnin Seed of Life##7066 |goto Moonglade 36.18,41.82
|only if guideflag("Maraflag")
step
Enter the tunnel |goto Moonglade 35.74,72.49 < 10 |walk |only if not zone("Winterspring")
Follow the path |goto Felwood 66.26,2.90 < 10 |walk |only if not zone("Winterspring")
Leave the tunnel |goto Felwood 68.40,5.84 < 10 |walk |only if not zone("Winterspring")
talk Salfa##11556
turnin Speak to Salfa##8465 |goto Winterspring 27.74,34.50
step
talk Donova Snowden##9298
turnin It's a Secret to Everybody##3908 |goto Winterspring 31.27,45.17
step
Watch the dialogue
talk Donova Snowden##9298
accept Threat of the Winterfall##5082 |goto Winterspring 31.27,45.17
stickystart "Kill_Winterfall_Pathfinders"
stickystart "Kill_Winterfall_Den_Watchers"
stickystart "Collect_Empty_Firewater_Flask"
stickystart "Accept_Winterfall_Firewater"
step
kill 8 Winterfall Totemic##7441 |q 5082/3 |goto Winterspring 30.57,37.17
|tip They share spawn points with the other Winterfall enemies.
|tip Kill the other types also, to get more to spawn.
You can find more around: |notinsticky
[39.46,43.70]
[41.78,43.14]
step
label "Kill_Winterfall_Pathfinders"
kill 8 Winterfall Pathfinder##7442 |q 5082/1 |goto Winterspring 30.57,37.17
|tip They share spawn points with the other Winterfall enemies. |notinsticky
|tip Kill the other types also, to get more to spawn. |notinsticky
You can find more around: |notinsticky
[39.46,43.70]
[41.78,43.14]
step
label "Kill_Winterfall_Den_Watchers"
kill 8 Winterfall Den Watcher##7440 |q 5082/2 |goto Winterspring 30.57,37.17
|tip They share spawn points with the other Winterfall enemies. |notinsticky
|tip Kill the other types also, to get more to spawn. |notinsticky
You can find more around: |notinsticky
[39.46,43.70]
[41.78,43.14]
step
label "Collect_Empty_Firewater_Flask"
Kill Winterfall enemies around this area
collect Empty Firewater Flask##12771 |goto Winterspring 30.57,37.17 |q 5083 |future
You can find more around: |notinsticky
[39.46,43.70]
[41.78,43.14]
step
label "Accept_Winterfall_Firewater"
use the Empty Firewater Flask##12771
accept Winterfall Firewater##5083
|only if itemcount(12771) > 0
step
talk Donova Snowden##9298
turnin Threat of the Winterfall##5082 |goto Winterspring 31.27,45.16
turnin Winterfall Firewater##5083 |goto Winterspring 31.27,45.16
accept Falling to Corruption##5084 |goto Winterspring 31.27,45.16
accept The Videre Elixir##3909 |goto Winterspring 31.27,45.16
step
Enter Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking
talk Felnok Steelspring##10468
turnin Felnok Steelspring##4808 |goto Winterspring 61.63,38.61
step
talk Himmik##11187
Restock on Food and Water |vendor Himmik##11187 |goto Winterspring/0 61.32,39.15 |q 3909
step
Leave Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking
talk Yugrek##11139
fpath Everlook |goto Winterspring 60.47,36.30
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Felwood (53-53)',
  {
    image = ZGV.IMAGESDIR .. 'Felwood',
    condition_suggested = function()
      return level == 53 and not completedq(5887)
    end,
    next = "Leveling Guides\\Un'Goro Crater (53-54)",
    hardcore = true,
  },
  [[
step
talk Dreka'Sur##9620
turnin A Husband's Last Battle##6162 |goto Felwood 34.80,52.73
step
talk Winna Hazzard##9996
turnin Well of Corruption##4505 |goto Felwood 34.21,52.34
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
talk Maybess Riverbreeze##9529
|tip She walks around this area.
turnin Cleansing Felwood##4102 |goto Felwood 46.72,83.07
step
talk Maybess Riverbreeze##9529
|tip She walks around this area.
Select _"I need a Cenarion beacon."_
collect Cenarion Beacon##11511 |goto Felwood 46.72,83.07 |q 5887 |future
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
talk Greta Mosshoof##10922
|tip She walks around this area.
turnin Collection of the Corrupt Water##5157 |goto Felwood 51.21,82.11
accept Seeking Spiritual Aid##5158 |goto Felwood 51.21,82.11
step
talk Taronn Redfeather##10921
|tip Inside the building.
turnin Verifying the Corruption##5156 |goto Felwood 50.89,81.62
]]
)
ZygorGuidesViewer:RegisterGuide(
  "Leveling Guides\\Un'Goro Crater (53-54)",
  {
    image = ZGV.IMAGESDIR .. "Un'Goro Crater",
    condition_suggested = function()
      return level >= 53 and level <= 54 and not completedq(4496)
    end,
    next = 'Leveling Guides\\Feralas (54-54)',
    hardcore = true,
  },
  [[
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 4244 |future
|only if Rogue
step
Enter the building |goto Orgrimmar 53.64,64.64 < 10 |walk
talk Auctioneer Thathung##8673
|tip Inside the building.
|tip Buy it from the Auction House.
|tip It is needed for a quest in Un'Goro Crater.
|tip If you can't get one, it's okay, but you will need to skip 2 quests later.
collect Mithril Casing##10561 |goto Orgrimmar 55.69,62.86 |q 4244 |future
|only if not selfmade
step
Enter the building |goto Orgrimmar 56.48,35.24 < 10 |walk
talk Jes'rimon##8659
|tip Upstairs inside the building.
turnin Delivery to Jes'rimon##3541 |goto Orgrimmar 55.51,34.09
accept Jes'rimon's Payment to Jediga##3563 |goto Orgrimmar 55.51,34.09
step
Enter the building |goto Orgrimmar 49.85,70.43 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Corrupt Moonwell Water##12907 |goto Orgrimmar 49.58,69.12 |q 5158 |future
bank Tablet of Beth'Amara##10538 |goto Orgrimmar 49.58,69.12 |q 3518 |future
bank Filled Vial Labeled #1##10691 |goto Orgrimmar 49.58,69.12 |q 3568 |future
bank Filled Vial Labeled #2##10692 |goto Orgrimmar 49.58,69.12 |q 3568 |future
bank Filled Vial Labeled #3##10693 |goto Orgrimmar 49.58,69.12 |q 3568 |future
bank Filled Vial Labeled #4##10694 |goto Orgrimmar 49.58,69.12 |q 3568 |future
bank Jes'rimon's Note##10680 |goto Orgrimmar 49.58,69.12 |q 3563
step
talk Karus##3309
|tip Inside the building.
|tip Collect these items from the bank.
collect Torwa's Pouch##11568 |goto Orgrimmar 49.58,69.12 |q 4292
step
Enter the building |goto The Barrens 45.35,58.81 < 10 |walk
talk Innkeeper Byula##7714
|tip Inside the building.
home Camp Taurajo |goto The Barrens 45.58,59.04
step
Enter the building |goto Tanaris 50.95,26.99 < 10 |walk
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin March of the Silithid##4494 |goto Tanaris 50.89,26.96
accept Bungle in the Jungle##4496 |goto Tanaris 50.89,26.96
step
talk Tran'rek##7876
accept Super Sticky##4504 |goto Tanaris 51.57,26.76
step
talk Larion##9118
accept Larion and Muigin##4145 |goto Un'Goro Crater 45.54,8.72
step
talk Williden Marshal##9270
accept Expedition Salvation##3881 |goto Un'Goro Crater 43.95,7.14
step
talk Hol'anyee Marshal##9271
accept Alien Ecology##3883 |goto Un'Goro Crater 43.89,7.24
step
talk Spark Nilminer##9272
accept Roll the Bones##3882 |goto Un'Goro Crater 43.50,7.42
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk
talk J.D. Collie##9117
|tip Inside the cave.
accept The Northern Pylon##4285 |goto Un'Goro Crater 41.92,2.70
step
Leave the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if subzone("Marshal's Refuge") and _G.IsIndoors()
click Beware of Pterrordax
accept Beware of Pterrordax##4501 |goto Un'Goro Crater 43.55,8.42
step
talk Shizzle##9998
accept Shizzle's Flyer##4503 |goto Un'Goro Crater 44.24,11.59
step
talk Karna Remtravel##9618
accept Chasing A-Me 01##4243 |goto Un'Goro Crater 46.38,13.45
stickystart "Collect_UnGoro_Soil"
stickystart "Collect_A_Mangled_Journal"
stickystart "Accept_Willidens_Journal"
stickystart "Collect_Webbed_Pterrordax_Scales"
step
Run around the huge tree and follow the path up |goto Un'Goro Crater 54.83,13.49 < 40 |only if walking
click Northern Crystal Pylon##164955
Choose _"I want to examine this pylon."_
Discover and Examine the Northern Crystal Pylon |q 4285/1 |goto Un'Goro Crater 56.48,12.45
step
kill Pterrordax##9166+
|tip Kill all of them around this area.
|tip You will kill more of these later, so you don't need to complete the quest now.
Clike Here to Continue |confirm |goto Un'Goro Crater 56.71,9.55 |q 4501
stickystop "Collect_Webbed_Pterrordax_Scales"
stickystart "Kill_Bloodpetal_Flayer"
step
Kill Tar enemies around this area
collect 12 Super Sticky Tar##11834 |q 4504/1 |goto Un'Goro Crater 59.96,30.56
You can find more around: |notinsticky
[59.75,24.49]
[63.54,23.41]
step
label "Kill_Bloodpetal_Flayer"
kill 5 Bloodpetal Flayer##6510 |q 4145/3 |goto Un'Goro Crater 57.09,16.45
You can find more around: |notinsticky
[56.74,24.61]
stickystart "Collect_UnGoro_Thunderer_Pelts"
stickystart "Collect_UnGoro_Stomper_Pelts"
step
kill Un'Goro Gorilla##6514+
|tip Inside and outside the cave.
|tip The gorillas share spawn points.
|tip If you can't find any more of these, kill the other types of gorillas to get them to spawn.
|tip These enemies call for help when at low health.	|only if hardcore |notinsticky
|tip This call for help can aggro through walls, be very careful and check if you're still in combat after killing one. |only if hardcore |notinsticky
collect 2 Un'Goro Gorilla Pelt##11478 |q 4289/1 |goto Un'Goro Crater 64.02,16.32
step
label "Collect_UnGoro_Stomper_Pelts"
kill Un'Goro Stomper##6513+
|tip Inside and outside the cave. |notinsticky
|tip The gorillas share spawn points. |notinsticky
|tip If you can't find any more of these, kill the other types of gorillas to get them to spawn. |notinsticky
|tip Un'Goro Gorillas may call for help when at low health.	|only if hardcore |notinsticky
|tip This call for help can aggro through walls, be very careful and check if you're still in combat after killing one. |only if hardcore |notinsticky
|tip Watch for patrols and respawns.				|only if hardcore |notinsticky
collect 2 Un'Goro Stomper Pelt##11479 |q 4289/2 |goto Un'Goro Crater 64.02,16.32
step
label "Collect_UnGoro_Thunderer_Pelts"
kill Un'Goro Thunderer##6516+
|tip Inside and outside the cave. |notinsticky
|tip The gorillas share spawn points. |notinsticky
|tip If you can't find any more of these, kill the other types of gorillas to get them to spawn. |notinsticky
|tip Un'Goro Gorillas may call for help when at low health.	|only if hardcore |notinsticky
|tip This call for help can aggro through walls, be very careful and check if you're still in combat after killing one. |only if hardcore |notinsticky
|tip Watch for patrols and respawns.				|only if hardcore |notinsticky
collect 2 Un'Goro Thunderer Pelt##11480 |q 4289/3 |goto Un'Goro Crater 64.02,16.32
step
Enter the cave |goto Un'Goro Crater 63.88,16.44 < 15 |walk |only if not _G.IsIndoors()
Follow the path inside the cave |goto Un'Goro Crater 65.87,16.75 < 10 |walk
talk A-Me 01##9623
|tip Inside the cave.
|tip She gives an escort quest.
|tip If she's not here, someone may be escorting her.
|tip Wait until she respawns.					|only if not hardcore
|tip Clear nearby enemies while waiting for her to re-appear.	|only if hardcore
turnin Chasing A-Me 01##4243 |goto Un'Goro Crater 67.65,16.76
accept Chasing A-Me 01##4244 |goto Un'Goro Crater 67.65,16.76 |only if (itemcount(10561) > 0) or (haveq(4244) or completedq(4244))
step
_NOTE:_
Grind to Catch Up XP
|tip You don't have the Mithril Casing item, so you're unable to complete 2 quests from A-Me 01.
|tip Grind 12,000 xp on the apes inside and outside this cave to make up for the lost xp.
Click Here to Continue After Grinding |confirm |q 4491 |future
|only if (itemcount(10561) == 0) and (completedq(4243) and not (haveq(4244) or completedq(4244)))
step
talk A-Me 01##9623
|tip Inside the cave.
|tip This is an escort quest.
|tip If she's not here, someone may be escorting her.
|tip Wait until she respawns.
turnin Chasing A-Me 01##4244 |goto Un'Goro Crater 67.65,16.76
|tip If you don't have the Mithril Casing to complete this quest, abandon the quest and grind 12,000 xp on the apes.  |only if (itemcount(10561) == 0) and not completedq(4244)
|tip This will make up for skipping this quest, and the escort quest followup. |only if (itemcount(10561) == 0) and not completedq(4244)
accept Chasing A-Me 01##4245 |goto Un'Goro Crater 67.65,16.76 |noautoaccept
|only if haveq(4244) or completedq(4244)
step
Watch the dialogue
|tip Follow A-Me 01 and protect her as she walks.
|tip She eventually walks to this location.
Protect A-Me 01 Until You Reach Karna Remtravel |q 4245/1 |goto Un'Goro Crater 46.32,13.68
|only if haveq(4245) or completedq(4245)
step
talk Karna Remtravel##9618
turnin Chasing A-Me 01##4245 |goto Un'Goro Crater 46.38,13.45
|only if haveq(4245) or completedq(4245)
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk
talk J.D. Collie##9117
|tip Inside the cave.
turnin The Northern Pylon##4285 |goto Un'Goro Crater 41.92,2.70
accept The Eastern Pylon##4287 |goto Un'Goro Crater 41.92,2.70
accept The Western Pylon##4288 |goto Un'Goro Crater 41.92,2.70
stickystart "Collect_Dinosaur_Bones"
stickystart "Collect_Webbed_Diemetradon_Scales"
stickystart "Kill_Bloodpetal_Lashers"
stickystart "Collect_UnGoro_Slime_Samples"
step
Leave the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if subzone("Marshal's Refuge") and _G.IsIndoors()
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
click Crate of Foodstuffs
collect Crate of Foodstuffs##11113 |q 3881/1 |goto Un'Goro Crater 68.51,36.54
step
Follow the path up |goto Un'Goro Crater 76.66,48.69 < 20 |only if walking
click Eastern Crystal Pylon
Choose _"I want to examine this pylon."_
Discover and Examine the Eastern Crystal Pylon |q 4287/1 |goto Un'Goro Crater 77.24,49.97
step
use Torwa's Pouch##11568
collect Preserved Threshadon Meat##11569 |q 4292 |goto Un'Goro Crater 79.92,49.90
collect Preserved Pheromone Mixture##11570 |q 4292 |goto Un'Goro Crater 79.92,49.90
step
use the Preserved Threshadon Meat##11569
|tip Use this first.
use the Preserved Pheromone Mixture##11570
|tip Use this second.
kill Lar'korwi##9684
|tip He's level 56, but you should be able to kill him at this level.
|tip If you have trouble, try to find someone to help you.
collect Lar'korwi's Head##11510 |q 4292/1 |goto Un'Goro Crater 79.92,49.90
step
talk Torwa Pathfinder##9619
turnin The Apes of Un'Goro##4289 |goto Un'Goro Crater 71.64,75.97
turnin The Bait for Lar'korwi##4292 |goto Un'Goro Crater 71.63,75.96
accept The Mighty U'cha##4301 |goto Un'Goro Crater 71.64,75.97
stickystart "Collect_Webbed_Pterrordax_Scales"
step
Follow the path up |goto Un'Goro Crater 58.01,85.25 < 20 |only if walking
kill 10 Pterrordax##9166 |q 4501/1 |goto Un'Goro Crater 56.23,90.09
You can find more: |notinsticky
Up the path that starts at [51.26,86.64]
Up the path that starts at [45.88,86.65]
stickystop "Collect_Webbed_Pterrordax_Scales"
stickystop "Collect_UnGoro_Slime_Samples"
stickystop "Collect_Dinosaur_Bones"
stickystop "Collect_Webbed_Diemetradon_Scales"
stickystart "Collect_Gorishi_Scent_Gland"
step
Enter the cave |goto Un'Goro Crater 49.95,81.70 < 10 |walk
Follow the path down |goto Un'Goro Crater 49.48,83.08 < 7 |walk
use the Unused Scraping Vial##11132
|tip Inside the cave.
|tip Gorishi Workers may call for help when at low health.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.		|only if hardcore
collect Hive Wall Sample##11131 |q 3883/1 |goto Un'Goro Crater 48.74,85.21
step
Leave the cave |goto Un'Goro Crater 49.94,81.65 < 10 |c |q 4496
|only if subzone("The Slithering Scar") and _G.IsIndoors()
step
label "Collect_Gorishi_Scent_Gland"
Kill Gorishi enemies around this area
|tip You can find more inside the insect cave in the ground nearby.
|tip Gorishi Workers may call for help when at low health.	|only if hardcore |notinsticky
|tip Watch for patrols and respawns while in the cave.		|only if hardcore |notinsticky
collect Gorishi Scent Gland##11837 |q 4496/1 |goto Un'Goro Crater 50.66,77.01
stickystart "Kill_Bloodpetal_Trappers"
stickystart "Kill_Frenzied_Pterrordax"
stickystart "Collect_Dinosaur_Bones"
stickystart "Collect_Webbed_Diemetradon_Scales"
stickystart "Collect_UnGoro_Slime_Samples"
step
Leave the cave |goto Un'Goro Crater 49.94,81.65 < 10 |only if subzone("The Slithering Scar") and _G.IsIndoors()
click Research Equipment##161521
collect Research Equipment##11112 |q 3881/2 |goto Un'Goro Crater 38.47,66.11
step
talk Krakle##10302
accept Finding the Source##974 |goto Un'Goro Crater 30.93,50.43
step
label "Kill_Bloodpetal_Trappers"
kill 5 Bloodpetal Trapper##6512 |q 4145/2 |goto Un'Goro Crater 39.85,53.54
You can find more around [34.49,37.63]
stickystart "Collect_Webbed_Pterrordax_Scales"
step
Follow the path up |goto Un'Goro Crater 24.20,61.28 < 20 |only if walking
click Western Crystal Pylon##164956
Choose _"I want to examine this pylon."_
Discover and Examine the Western Crystal Pylon |q 4288/1 |goto Un'Goro Crater 23.79,59.19
step
label "Kill_Frenzied_Pterrordax"
kill 15 Frenzied Pterrordax##9167 |q 4501/2 |goto Un'Goro Crater 21.75,59.39
You can find more around: |notinsticky
[23.26,49.89]
[22.81,41.53]
[23.36,41.24]
[39.05,47.06]
[28.28,33.06]
[34.49,37.63]
[31.25,44.33]
step
label "Collect_Webbed_Pterrordax_Scales"
Kill Pterrordax enemies around this area
|tip They look like pterodactyls.
collect 8 Webbed Pterrordax Scale##11831 |q 4503/2 |goto Un'Goro Crater 24.15,38.86
You can find more around: |notinsticky
[39.05,47.06]
[28.28,33.06]
[34.49,37.63]
[31.25,44.33]
step
label "Collect_Dinosaur_Bones"
Kill Diemetradon enemies around this area
collect 8 Dinosaur Bone##11114 |q 3882/1 |goto Un'Goro Crater 59.18,53.99
You can find more around: |notinsticky
[56.74,63.47]
[49.24,61.78]
[50.79,67.25]
[45.26,68.91]
[41.52,56.95]
step
label "Collect_Webbed_Diemetradon_Scales"
Kill Diemetradon enemies around this area
collect 8 Webbed Diemetradon Scale##11830 |q 4503/1 |goto Un'Goro Crater 59.18,53.99
You can find more around: |notinsticky
[56.74,63.47]
[49.24,61.78]
[50.79,67.25]
[45.26,68.91]
[41.52,56.95]
step
label "Collect_UnGoro_Soil"
click Un'Goro Dirt Pile##157936+
|tip They look like piles of dark brown dirt on the ground around this area.
|tip You can find them all over the entire zone.
Kill enemies around this area
|tip Any enemy in Un'Goro Crater can drop the quest item.
collect 25 Un'Goro Soil##11018 |q 3761 |future
|tip Be careful not to accidentally sell these to a vendor.
step
label "Collect_UnGoro_Slime_Samples"
Kill Ooze enemies as you quest
collect 40 Un'Goro Slime Sample##12235 |goto Un'Goro Crater/0 57.48,65.95
You can find more around: |notinsticky
[45.09,68.24]
[38.49,48.67]
[38.42,31.93]
[27.92,35.59]
[25.51,45.45]
|only if haveq(4294)
step
label "Collect_A_Mangled_Journal"
Kill enemies around this area
|tip Any enemy in Un'Goro Crater can drop the quest item.
collect A Mangled Journal##11116 |q 3884 |future
step
talk Shizzle##9998
turnin Shizzle's Flyer##4503 |goto Un'Goro Crater 44.23,11.59
step
label "Accept_Willidens_Journal"
use A Mangled Journal##11116
accept Williden's Journal##3884 |goto Un'Goro Crater 43.62,8.50
|only if itemcount(11116) > 0
step
talk Spraggle Frock##9997
turnin Beware of Pterrordax##4501 |goto Un'Goro Crater 43.62,8.50
accept Lost!##4492 |goto Un'Goro Crater 43.62,8.50
step
talk Spark Nilminer##9272
turnin Roll the Bones##3882 |goto Un'Goro Crater 43.50,7.43
step
talk Hol'anyee Marshal##9271
turnin Alien Ecology##3883 |goto Un'Goro Crater 43.89,7.24
step
talk Williden Marshal##9270
turnin Expedition Salvation##3881 |goto Un'Goro Crater 43.95,7.14
turnin Williden's Journal##3884 |goto Un'Goro Crater 43.95,7.14
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk
talk J.D. Collie##9117
|tip Inside the cave.
turnin The Eastern Pylon##4287 |goto Un'Goro Crater 41.92,2.70
turnin The Western Pylon##4288 |goto Un'Goro Crater 41.92,2.70
accept Making Sense of It##4321 |goto Un'Goro Crater 41.92,2.70
step
talk J.D. Collie##9117
|tip Inside the cave.
turnin Making Sense of It##4321 |goto Un'Goro Crater 41.92,2.70
step
_Destroy This Item:_
|tip It is no longer needed.
trash Crystal Pylon User's Manual##11482
step
Leave the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk |only if subzone("Marshal's Refuge") and _G.IsIndoors()
talk Larion##9118
turnin Larion and Muigin##4145 |goto Un'Goro Crater 45.54,8.72
accept Marvon's Workshop##4147 |goto Un'Goro Crater 45.54,8.72
step
Kill enemies around this area
|tip You should already be level 54.
|tip You are about to have to complete an escort quest that can be a little difficult.
ding 54 |goto Un'Goro Crater 45.80,17.72
stickystart "Collect_UnGoro_Ash"
step
Follow the path up |goto Un'Goro Crater 52.84,42.05 < 20 |only if walking
Follow the path up |goto Un'Goro Crater 52.33,45.52 < 10 |only if walking
Continue up the path |goto Un'Goro Crater 51.18,47.35 < 10 |only if walking
use Krakle's Thermometer##12472
|tip At the top of the mountain.
Find the Hottest Area of Fire Plume Ridge |q 974/1 |goto Un'Goro Crater 49.70,45.74
step
label "Collect_UnGoro_Ash"
Kill enemies around this area
|tip They look like fire elementals on and around this volcano mountain.
|tip Avoid the elite enemy in the cave at the top of the mountain.
collect 9 Un'Goro Ash##11829 |q 4502/1 |goto Un'Goro Crater 50.98,47.18
step
Enter the cave |goto Un'Goro Crater 52.44,51.07 < 15 |walk
talk Ringo##9999
|tip Inside the cave.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
turnin Lost!##4492 |goto Un'Goro Crater 51.90,49.85
accept A Little Help From My Friends##4491 |goto Un'Goro Crater 51.90,49.85 |noautoaccept
step
Leave the cave |goto Un'Goro Crater 52.50,51.16 < 15 |walk
Follow the path down |goto Un'Goro Crater 54.19,50.77 < 15 |only if walking
Follow the path |goto Un'Goro Crater 56.72,43.18 < 50 |only if walking
Follow the path up |goto Un'Goro Crater 46.04,13.45 < 20 |only if walking
Watch the dialogue
|tip Ringo will follow you, protect him as you walk.
|tip He will faint multiple times as he walks, so make sure he is with you at all times.
|tip You will see a message in your chat when he faints.
use Spraggle's Canteen##11804
|tip Use it on Ringo to revive him when he faints.
Escort Ringo to Spraggle Frock at Marshal's Refuge |q 4491/1 |goto Un'Goro Crater 43.62,8.51
step
Watch the dialogue
talk Spraggle Frock##9997
turnin A Little Help From My Friends##4491 |goto Un'Goro Crater 43.62,8.51
step
_Destroy This Item:_
|tip It is no longer needed.
trash Spraggle's Canteen##11804
step
Run around the huge tree and follow the path up |goto Un'Goro Crater 54.83,13.49 < 40 |only if walking
Enter the cave |goto Un'Goro Crater 63.94,16.39 < 15 |walk
Follow the path |goto Un'Goro Crater 65.98,15.65 < 10 |walk
Continue following the path |goto Un'Goro Crater 69.08,17.63 < 10 |walk
Continue following the path |goto Un'Goro Crater 69.41,16.57 < 10 |walk
Continue following the path |goto Un'Goro Crater 68.61,13.57 < 10 |walk
kill U'cha##9622
|tip Upstairs inside the cave.
|tip Un'goro Gorillas may call for health when their health is low.	|only if hardcore
|tip This call for help can aggro through walls, be very careful and check if you're still in combat after killing one. |only if hardcore
collect U'cha's Pelt##11476 |q 4301/1 |goto Un'Goro Crater 68.15,12.58
step
Leave the cave |goto Un'Goro Crater 63.88,16.43 < 15 |walk |only if subzone("Fungal Rock") and _G.IsIndoors()
talk Torwa Pathfinder##9619
turnin The Mighty U'cha##4301 |goto Un'Goro Crater 71.63,75.96
step
talk Krakle##10302
turnin Finding the Source##974 |goto Un'Goro Crater 30.93,50.44
accept The New Springs##980 |goto Un'Goro Crater 30.93,50.44
step
talk Tran'rek##7876
turnin Super Sticky##4504 |goto Tanaris 51.57,26.76
|nohearth
step
talk Alchemist Pestlezugg##5594
|tip Inside the building.
turnin Bungle in the Jungle##4496 |goto Tanaris 50.89,26.96
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Feralas (54-54)',
  {
    image = ZGV.IMAGESDIR .. 'Feralas',
    condition_suggested = function()
      return level == 54 and not completedq(5159)
    end,
    next = ZGV.IsClassicSoD and 'Leveling Guides\\Felwood (54-55)'
      or 'Leveling Guides\\Azshara (54-54)',
    hardcore = true,
  },
  [[
step
talk Talo Thornhoof##7776
|tip Inside the building.
turnin The Strength of Corruption##4120 |goto Feralas 76.18,43.83
step
Discover Dire Maul |goto Feralas 59.12,44.62 < 20 |q 5527 |future
|tip Run slightly onto the huge ramp to discover the Dire Maul dungeon.
|tip As soon as you reach the ramp and discover Dire Maul, run away from the ogres and go back to the road.
|tip You need to discover the Dire Maul dungeon to be able to accept a quest later in the guide.
step
Leave Dire Maul |goto Feralas/0 59.46,47.43 < 40 |only if subzone("Dire Maul")
Jump onto this break in the wall from the nearby ledge |goto Feralas 44.62,9.81 < 3 |only if walking
click Evoroot
|tip Inside the building.
collect Evoroot##11242 |goto Feralas 44.55,10.13 |q 3909
step
Jump out of the building |goto Feralas 44.64,9.95 < 7 |only if walking and subzone("Ruins of Ravenwind")
talk Gregan Brewspewer##7775
|tip Complete the repeatable "The Videre Elixir" quest.
collect Videre Elixir##11243 |q 3909/1 |goto Feralas 45.12,25.57
stickystart "Accept_The_New_Frontier"
step
Enter the building |goto Thunder Bluff 45.01,62.18 < 10 |walk
talk Innkeeper Pala##6746
|tip Inside the building.
|tip Restock on food and water while you're here.
accept Assisting Arch Druid Runetotem##3762 |goto Thunder Bluff 45.81,64.71
step
Enter the building |goto Thunder Bluff 45.80,58.83 < 10 |walk
talk Chesmu##8356
|tip Inside the building.
|tip Collect these items from the bank.
collect Corrupt Moonwell Water##12907 |goto Thunder Bluff 47.13,57.89 |q 5158
collect Tablet of Beth'Amara##10538 |goto Thunder Bluff 47.13,57.89 |q 3518
collect Jes'rimon's Note##10680 |goto Thunder Bluff 47.13,57.89 |q 3563
step
label "Accept_The_New_Frontier"
map Thunder Bluff
path	follow strict;	loop on;	ants curved;	dist 20
path	43.31,60.55	42.71,56.37	39.75,52.04	37.13,51.84	36.42,55.39
path	37.65,61.32	39.52,63.00	43.31,60.37	44.40,68.49	46.13,69.24
path	48.79,66.90	49.93,62.30	56.57,61.87	57.10,59.04	56.37,54.59
path	58.20,53.77	59.03,50.99	58.08,48.89	56.38,48.00	54.17,48.84
path	52.72,51.74	54.12,53.82	56.18,55.10	57.12,60.23	56.10,62.19
path	49.94,62.33	49.12,66.66	45.91,69.29	44.41,68.71
talk Bluff Runner Windstrider##10881
|tip He walks around in Thunder Bluff.
accept The New Frontier##1000
accept A Call to Arms: The Plaguelands!##5095
|tip This quest may not be avaialble if you've accepted other Plaguelands quests.
step
talk Magatha Grimtotem##4046
|tip Inside the tent.
turnin Delivery to Magatha##3518 |goto Thunder Bluff 69.87,30.91
accept Magatha's Payment to Jediga##3562 |goto Thunder Bluff 69.87,30.91
step
Enter the building |goto Thunder Bluff 74.16,29.88 < 10 |walk
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
turnin The New Frontier##1000 |goto Thunder Bluff 78.59,28.55
accept Rabine Saturna##1123 |goto Thunder Bluff 78.59,28.55
turnin Assisting Arch Druid Runetotem##3762 |goto Thunder Bluff 78.59,28.55
accept Un'Goro Soil##3761 |goto Thunder Bluff 78.59,28.55
step
talk Ghede##9076
|tip Outside the tent.
turnin Un'Goro Soil##3761 |goto Thunder Bluff 77.45,21.98
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
trash Un'Goro Soil##11018 |goto Thunder Bluff 74.16,29.88
step
Enter the building |goto Thunder Bluff 74.16,29.88 < 10 |walk
talk Arch Druid Hamuul Runetotem##5769
|tip Inside the building.
accept Morrowgrain Research##3782 |goto Thunder Bluff 78.59,28.57
|tip This will require you to have completed 'Un'Goro Soil' from the Un'Goro Crater (53-54) guide.
step
talk Bashana Runetotem##9087
|tip Inside the building.
turnin Morrowgrain Research##3782 |goto Thunder Bluff 71.06,34.15
step
Enter the cave |goto Thunder Bluff 29.81,29.82 < 10 |walk |only if Priest or Mage
talk Urek Thunderhorn##3040 |only if Hunter
talk Ker Ragetotem##3043 |only if Warrior
talk Siln Skychaser##3030 |only if Shaman
talk Thurston Xane##3049 |only if Mage
talk Malakai Cross##3045 |only if Priest
talk Kym Wildmane##3036 |only if Druid
Train your spells. |trainer	Urek Thunderhorn##3040 |goto Thunder Bluff/0 59.09,86.85 |only if Hunter |q 4502
Train your spells. |trainer Ker Ragetotem##3043 |goto Thunder Bluff/0 57.63,85.53 |only if Warrior |q 4502
Train your spells. |trainer Siln Skychaser##3030 |goto Thunder Bluff/0 22.86,20.97 |only if Shaman |q 4502
Train your spells. |trainer	Thurston Xane##3049 |goto Thunder Bluff/0 25.24,20.94 |only if Mage |q 4502
Train your spells. |trainer Malakai Cross##3045 |goto Thunder Bluff/0 24.63,22.57 |only if Priest |q 4502
Train your spells. |trainer Kym Wildmane##3036 |goto Thunder Bluff/0 77.07,29.87 |only if Druid |q 4502
|tip Inside the building. |only if Warrior or Hunter
|tip Inside the cave |only if Priest or Mage
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
trash Packet of Tharlendris Seeds##11022 |goto The Barrens 51.39,30.20
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 4502
|only if Rogue
step
Enter the building |goto The Barrens 62.52,38.57 < 10 |walk
talk Liv Rizzlefix##8496
|tip Inside the building.
turnin Volcanic Activity##4502 |goto The Barrens 62.45,38.73
turnin Marvon's Workshop##4147 |goto The Barrens 62.45,38.73
step
talk Islen Waterseer##5901
turnin Seeking Spiritual Aid##5158 |goto The Barrens 65.83,43.78
step
Watch the dialogue
talk Islen Waterseer##5901
accept Cleansed Water Returns to Felwood##5159 |goto The Barrens 65.83,43.78
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Azshara (54-54)',
  {
    image = ZGV.IMAGESDIR .. 'Azshara',
    condition_suggested = function()
      return level == 54 and not completedq(3507)
    end,
    next = 'Leveling Guides\\Felwood (54-55)',
    hardcore = true,
    hideif = ZGV.IsClassicSoD,
  },
  [[
step
talk Ag'tor Bloodfist##8576
accept Betrayed##3505 |goto Azshara 22.26,51.48
step
talk Jediga##8587
turnin Jes'rimon's Payment to Jediga##3563 |goto Azshara 22.56,51.42
turnin Magatha's Payment to Jediga##3562 |goto Azshara 22.56,51.42
accept Delivery to Andron Gant##3542 |goto Azshara 22.56,51.42
step
talk Kim'jael##8420
|tip On top of the big hill.
accept Kim'jael Indeed!##3601 |goto Azshara 53.45,21.82
stickystart "Collect_Kimjaels_Stuff"
stickystart "Kill_Blood_Elf_Surveyors"
step
kill 10 Blood Elf Reclaimer##6199 |q 3505/1 |goto Azshara 56.09,30.20
|tip Enemies have a fairly large aggro radius as well.	|only if hardcore |notinsticky
|tip Watch for respawns while in this area.		|only if hardcore |notinsticky
You can find more around: |notinsticky
[56.29,28.76]
[57.03,28.30]
[58.55,29.05]
[58.76,28.71]
[59.61,30.93]
step
label "Kill_Blood_Elf_Surveyors"
kill 10 Blood Elf Surveyor##6198 |q 3505/2 |goto Azshara 56.09,30.20
|tip Enemies have a fairly large aggro radius as well.	|only if hardcore |notinsticky
|tip Watch for respawns while in this area.		|only if hardcore |notinsticky
You can find more around: |notinsticky
[56.29,28.76]
[57.03,28.30]
[58.55,29.05]
[58.76,28.71]
[59.61,30.93]
step
Find Magus Rimtori's Camp |q 3505/3 |goto Azshara 59.51,31.30
|tip Enemies have a fairly large aggro radius as well.	|only if hardcore |notinsticky
|tip Watch for respawns while in this area.		|only if hardcore |notinsticky
step
click Kaldorei Tome of Summoning##151286
turnin Betrayed##3505 |goto Azshara 59.51,31.30
accept Betrayed##3506 |goto Azshara 59.51,31.30
step
click Arcane Focusing Crystal
|tip You will be attacked.
kill Blood Elf Defender##8581
|tip He will call for Magus Rimtori when his health gets low.
kill Magus Rimtori##8578
collect Head of Magus Rimtori##10597 |q 3506/1 |goto Azshara 59.55,31.52
step
label "Collect_Kimjaels_Stuff"
click Kim'jael's Equipment##153123
|tip They look like wooden boxes on the ground around this area.
|tip Some of them may be empty.
|tip They respawn very quickly, you can find one safe area and stay at it to complete the quest.
|tip The mobs here are VERY dangerous, don't extend further into the camp than you have to. |only if hardcore
|tip Blood Elf Reclaimers are ranged attackers that deal HEAVY damage.	|only if hardcore
|tip Surveyors have a large aggro radius and do an instant cast fire nova for a large amount of damage |only if hardcore
|tip Enemies may bunch together so be careful.				|only if hardcore
|tip Watch for patrols and respawns while in the area.			|only if hardcore
collect Kim'Jael's Compass##10717 |q 3601/1 |goto Azshara 56.09,30.20
collect Kim'Jael's Scope##10715 |q 3601/2 |goto Azshara 56.09,30.20
collect Kim'Jael's Stuffed Chicken##10722 |q 3601/3 |goto Azshara 56.09,30.20
collect Kim'Jael's Wizzlegoober##10718 |q 3601/4 |goto Azshara 56.09,30.20
You can find more around: |notinsticky
[56.29,28.76]
[57.03,28.30]
[58.55,29.05]
[58.76,28.71]
[59.61,30.93]
step
talk Kim'jael##8420
|tip On top of the big hill.
turnin Kim'jael Indeed!##3601 |goto Azshara 53.45,21.82
accept Kim'jael's "Missing" Equipment##5534 |goto Azshara 53.45,21.82
step
Follow the path down |goto Azshara 45.27,37.16 < 50 |only if walking and not subzone("The Shattered Strand")
Kill Spitelash enemies around this area
collect Some Rune##13815 |q 5534/1 |goto Azshara 47.65,43.93
You can find more around: |notinsticky
[46.76,53.80]
[48.51,64.11]
step
Follow the path up |goto Azshara 45.95,38.62 < 30 |only if walking and subzone("The Shattered Strand")
talk Kim'jael##8420
|tip On top of the big hill.
turnin Kim'jael's "Missing" Equipment##5534 |goto Azshara 53.45,21.82
step
talk Ag'tor Bloodfist##8576
turnin Betrayed##3506 |goto Azshara 22.26,51.48
accept Betrayed##3507 |goto Azshara 22.26,51.48
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Felwood (54-55)',
  {
    image = ZGV.IMAGESDIR .. 'Felwood',
    condition_suggested = function()
      return level >= 54 and level <= 55 and not completedq(5085)
    end,
    next = 'Leveling Guides\\Winterspring (55-55)',
    hardcore = true,
  },
  [[
step
talk Hula'mahi##3490
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Hula'mahi##3490 |goto The Barrens 51.39,30.20 |q 4521 |future
|only if Rogue
step
talk Trull Failbane##10306
accept Wild Guardians##4521 |goto Felwood 34.73,52.80
step
talk Winna Hazzard##9996
accept Corrupted Sabers##4506 |goto Felwood 34.21,52.34
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
talk Greta Mosshoof##10922
turnin Cleansed Water Returns to Felwood##5159 |goto Felwood 51.21,82.11
accept Dousing the Flames of Protection##5165 |goto Felwood 51.21,82.11
stickystart "Collect_Blood_Red_Key"
stickystart "Accept_A_Strange_Red_Key"
stickystart "Arko'narin_escort_start"
step
Follow the road to Jaedenar and follow path |goto Felwood 38.40,59.74 < 30 |only if walking and not subzone("Shadow Hold")
Enter the cave |goto Felwood 35.41,58.69 < 10 |walk |only if not subzone("Shadow Hold")
|tip The Shadow Hold is dangerous. |only if hardcore
|tip Keep an eye out for patrolling enemies as well as enemy casters while inside. |only if hardcore
|tip Clear enemies
click Brazier of Pain##176158
|tip Downstairs inside the cave, on the top level.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Extinguish the Brazier of Pain |q 5165/1 |goto Felwood 36.27,56.29
step
click Brazier of Hatred##176161
|tip Downstairs inside the cave, on the top level.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Extinguish the Brazier of Hatred |q 5165/4 |goto Felwood 36.48,55.18
step
label "Collect_Blood_Red_Key"
Kill enemies around this area
|tip All around inside the cave, on both levels.
|tip Once you get this item, you will accept a quest from it that you will turn in on the top level of the cave.
|tip Watch for patrols and respawns while in the area.	|only if hardcore |notinsticky
collect Blood Red Key##13140 |goto Felwood 36.29,55.96 |q 5202 |future
step
label "Accept_A_Strange_Red_Key"
use the Blood Red Key##13140
accept A Strange Red Key##5202
|only if itemcount(13140) > 0
step
label "Arko'narin_escort_start"
talk Captured Arko'narin##11016
|tip Inside a yellow wooden cage.
|tip Downstairs inside the cave, on the top level.
turnin A Strange Red Key##5202 |goto Felwood 36.21,55.50
|only if itemcount(13140) > 0
step
talk Captured Arko'narin##11016
|tip Inside a yellow wooden cage.
|tip This will start an escort quest, follow her and activate braziers as she walks.
accept Rescue From Jaedenar##5203 |goto Felwood 36.21,55.50
step
Run around the hole in the floor and follow the path down |goto Felwood 38.25,54.06 < 10 |c |q 5165
step
click Brazier of Suffering##176160
|tip Downstairs inside the cave, on the bottom level.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Extinguish the Brazier of Suffering |q 5165/3 |goto Felwood 36.73,53.26
step
click Brazier of Malice
|tip Downstairs inside the cave, on the bottom level.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
|tip The escort quest will have 2 Felguards spawn behind you after clicking this brazier.
|tip Let Arko'narin go first to get aggro.
Extinguish the Brazier of Malice |q 5165/2 |goto Felwood 37.68,52.69
step
Protect Arko'narin out of Shadow Hold |q 5203 |goto Felwood 35.41,58.69
|tip As you exit the cave, you will have to fight an elite.
|tip Let Arko'narin attack him first and build up a substantial threat lead so she can tank for you.
|tip It's okay to just stand still for a moment while they fight to make sure you don't pull aggro.
|tip If you don't feel confident, run away and skip this quest. |only if hardcore
step
Follow the path up |goto Felwood 35.94,56.76 < 10 |walk
Leave the cave |complete not subzone("Shadow Hold") |goto Felwood 35.42,58.81 |q 5165
step
Leave Jaedenar |goto Felwood 38.40,59.74 < 30 |only if walking and subzone("Jaedenar")
Run around the mountain |goto Felwood 41.64,63.41 < 40 |only if walking and not subzone("Ruins of Constellas")
Follow the path |goto Felwood 36.64,66.86 < 30 |only if walking
use Winna's Kitten Carrier##12565
|tip Use it next to the green moonwell.
|tip A Corrupted Saber will begin following you.
Click Here Once the Corrupted Saber is Following You |confirm |goto Felwood 32.42,66.59 |q 4506
step
Follow the road |goto Felwood 42.05,62.92 < 40 |only if walking and subzone("Ruins of Constellas")
Follow the river west |goto Felwood 37.54,49.25 < 30 |only if walking and not subzone("Bloodvenom Post")
talk Corrupted Saber##10042
|tip It should still be following you.
Choose _"I want to release the corrupted saber to Winna."_
Return the Corrupted Cat to Winna Hazzard |q 4506/1 |goto Felwood 34.21,52.34
step
talk Winna Hazzard##9996
turnin Corrupted Sabers##4506 |goto Felwood 34.21,52.34
step
talk Bale##2806
|tip Stock up on arrows |only if Hunter
Vendor your Trash |vendor Bale##2806 |goto Felwood/0 34.76,53.21 |q 5084
step
Enter Felpaw Village |goto Felwood 61.73,14.28 < 40 |only if walking and not subzone("Felpaw Village")
Kill enemies around this area
|tip You should already be level 55, or pretty close.
|tip You are about to have to kill a level 57 enemy with 1-2 enemies close to it, so it will help to be a level higher.
ding 55 |goto Felwood 62.88,11.89
You can find more around [61.89,7.40]
step
Enter Felpaw Village |goto Felwood 61.73,14.28 < 40 |only if walking and not subzone("Felpaw Village")
click Deadwood Cauldron##176091
|tip Clear out a safe area to pull enemies to.
|tip Try to kite the enemies near the cauldron away one at a time to fight them alone, until you can kill the rest.
|tip If you have trouble, try to find someone to help you.
turnin Falling to Corruption##5084 |goto Felwood 60.20,5.87
accept Mystery Goo##5085 |goto Felwood 60.20,5.87
step
Follow the road |goto Felwood 64.18,15.20 < 30 |only if walking
talk Nafien##15395 |goto Felwood 64.77,8.13
|tip Turn in your feathers to Nafien for extra experience. You can turn them in in sets of 5.
|tip Destroy any leftovers after, this is the last time we will farm this area.
trash Deadwood Headdress Feather##21377
|only if itemcount(21377) >= 5
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Winterspring (55-55)',
  {
    image = ZGV.IMAGESDIR .. 'Winterspring',
    condition_suggested = function()
      return level == 55 and not completedq(5601)
    end,
    next = 'Leveling Guides\\Felwood (55-55)',
    hardcore = true,
  },
  [[
step
Follow the road up |goto Felwood 64.06,14.72 < 30 |only if walking and subzone("Felpaw Village")
Enter the tunnel |goto Felwood 65.13,8.01 < 10 |walk |only if not zone("Winterspring")
Follow the path |goto Felwood 66.26,2.90 < 10 |walk |only if not zone("Winterspring")
Leave the tunnel |goto Felwood 68.40,5.84 < 10 |walk |only if not zone("Winterspring")
talk Donova Snowden##9298
turnin Mystery Goo##5085 |goto Winterspring 31.27,45.16
accept Toxic Horrors##5086 |goto Winterspring 31.27,45.16
turnin The New Springs##980 |goto Winterspring 31.27,45.17
accept Strange Sources##4842 |goto Winterspring 31.27,45.17
turnin The Videre Elixir##3909 |goto Winterspring 31.27,45.16
accept Meet at the Grave##3912 |goto Winterspring 31.27,45.16
step
kill 15 Ragged Owlbeast##7450 |q 4521/2 |goto Winterspring 38.76,38.12
|tip They are fairly uncommon and pretty spread out, so just keep checking all of the locations until you kill them all.
You can find more around: |notinsticky
[42.53,36.68]
[44.28,37.81]
[45.54,35.78]
[46.82,37.49]
[45.24,42.58]
[47.37,42.74]
[49.83,39.97]
[51.43,39.38]
[52.48,38.20]
[54.55,37.31]
step
kill 15 Raging Owlbeast##7451 |q 4521/1 |goto Winterspring 51.38,33.81
You can find more around: |notinsticky
[55.70,28.23]
[54.70,32.29]
[58.04,33.18]
[60.31,29.67]
[60.13,34.07]
step
Enter Everlook |goto Winterspring 60.56,38.20 < 10 |only if walking
talk Umi Rumplesnicker##10305
accept Are We There, Yeti?##3783 |goto Winterspring 60.88,37.62
step
Leave Everlook |goto Winterspring 60.56,38.20 < 10 |only if walking and subzone("Everlook")
Kill Ice Thistle enemies around this area
|tip Watch for patrols and respawns while here.	|only if hardcore
collect 10 Thick Yeti Fur##12366 |q 3783/1 |goto Winterspring 66.79,43.34
You can find more inside the cave at [67.65,41.75]
step
Leave the cave |goto Winterspring 67.65,41.75 < 30 |walk |only if subzone("Ice Thistle Hills") and _G.IsIndoors()
Cross the bridge |goto Winterspring 62.42,67.44 < 30 |only if walking
Discover Darkwhisper Gorge |q 4842/1 |goto Winterspring 59.84,74.12
step
Enter Everlook |goto Winterspring 60.56,38.20 < 10 |only if walking
talk Umi Rumplesnicker##10305
turnin Are We There, Yeti?##3783 |goto Winterspring 60.88,37.62
step
Enter the building |goto Winterspring 61.32,38.72 < 10 |walk
talk Innkeeper Vizzie##11118
|tip Inside the building.
home Everlook |goto Winterspring 61.36,38.83
step
use the Videre Elixir##11243
|tip You will die. |only if not hardcore
|tip It will bring you to 1 hp, make sure no other enemies are nearby that could hit you. |only if hardcore
|tip This quest was updated to no longer kill you on Hardcore servers |only if hardcore
Drink the Videre Elixir |complete isdead |goto Tanaris 54.03,28.73 |q 3912
step
talk Gaeriyan##9299
|tip He looks like a human ghost that walks around this small area.
turnin Meet at the Grave##3912 |goto Tanaris 53.93,23.34 |zombiewalk |only if not hardcore
accept A Grave Situation##3913 |goto Tanaris 53.93,23.34 |zombiewalk |only if not hardcore
turnin Meet at the Grave##3912 |goto Tanaris 53.93,23.34 |only if hardcore
accept A Grave Situation##3913 |goto Tanaris 53.93,23.34 |only if hardcore
step
Resurrect at the Gadgetzan Graveyard |complete not isdead |goto Tanaris 54.03,28.73 |q 3913 |zombiewalk
|tip A popup will appear allowing you to resurrect.
|tip You won't get more resurrection sickness.
|only if not hardcore
step
_Destroy or Sell These Items:_
|tip They are no longer needed.
trash Videre Elixir##11243 |goto Tanaris 53.82,29.06
step
click A Conspicuous Gravestone
turnin A Grave Situation##3913 |goto Tanaris 53.82,29.06
accept Linken's Sword##3914 |goto Tanaris 53.82,29.06
step
talk Linken##8737
turnin Linken's Sword##3914 |goto Un'Goro Crater 44.66,8.10
accept A Gnome's Assistance##3941 |goto Un'Goro Crater 44.66,8.10
step
Enter the cave |goto Un'Goro Crater 43.47,6.79 < 15 |walk
talk J.D. Collie##9117
|tip Inside the cave.
turnin A Gnome's Assistance##3941 |goto Un'Goro Crater 41.92,2.70
step
Watch the dialogue
talk J.D. Collie##9117
|tip Inside the cave.
accept Linken's Memory##3942 |goto Un'Goro Crater 41.92,2.70
step
talk Gregor Greystone##10431
|tip Inside the building.
accept The Everlook Report##6029 |goto Winterspring 61.35,38.97
accept Duke Nicholas Zverenhoff##6030 |goto Winterspring 61.35,38.97
step
talk Jessica Redpath##11629
|tip Inside the building.
accept Sister Pamela##5601 |goto Winterspring 61.28,38.98
step
Enter the building |goto Winterspring 61.33,37.35 < 10 |walk
talk Izzy Coppergrab##13917
|tip Inside the building.
|tip Deposit these items into the bank.
bank Tablet of Markri##10540 |goto Winterspring 61.45,36.981 |q 3542 |future
bank Everlook Report##15788 |goto Winterspring 61.45,36.98 |q 6029 |future
bank Studies in Spirit Speaking##15790 |goto Winterspring 61.45,36.98 |q 6030 |future
bank Head of Magus Rimtori##10597 |goto Winterspring 61.45,36.98 |q 3507
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Felwood (55-55)',
  {
    image = ZGV.IMAGESDIR .. 'Felwood',
    condition_suggested = function()
      return level == 55 and not completedq(4084)
    end,
    next = 'Leveling Guides\\Winterspring Part 2 (55-55)',
    hardcore = true,
  },
  [[
step
talk Trull Failbane##10306
turnin Wild Guardians##4521 |goto Felwood 34.73,52.79
accept Wild Guardians##4741 |goto Felwood 34.73,52.79
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
talk Greta Mosshoof##10922
turnin Dousing the Flames of Protection##5165 |goto Felwood 51.21,82.11
step
talk Jessir Moonbow##11019
turnin Rescue From Jaedenar##5203 |goto Felwood/0 51.35,82.01 |only if completedq(5203)
step
talk Maybess Riverbreeze##9529
|tip She walks around this area.
|tip You can turn in this quest multiple times depending on how many shards you have.
|tip Use these Salves to activate Corrupted Songflowers in the zone, they give you a very strong buff.
accept Salve via Hunting##5887 |goto Felwood 46.72,83.07
step
Enter the building |goto Felwood 51.26,81.70 < 10 |walk
talk Eridan Bluewind##9116
|tip Inside the building.
turnin Linken's Memory##3942 |goto Felwood 51.35,81.51
accept Silver Heart##4084 |goto Felwood 51.35,81.51
stickystart "Collect_Toxic_Horror_Droplets"
stickystart "Collect_Silvery_Claws"
step
Kill Irontree enemies around this area
|tip They look like walking trees with no leaves.
collect Irontree Heart##11173 |q 4084/2 |goto Felwood 51.57,20.70
step
label "Collect_Toxic_Horror_Droplets"
kill Toxic Horror##7132+
|tip All around this green lake.
collect 3 Toxic Horror Droplet##12822 |q 5086/1 |goto Felwood 49.42,23.51
step
label "Collect_Silvery_Claws"
Kill enemies around this area
|tip Only enemies that look like bears and wolves will drop the quest item.
collect 11 Silvery Claws##11172 |q 4084/1 |goto Felwood 53.31,27.49
You can find more around: |notinsticky
[56.10,22.91]
[57.71,18.14]
[61.26,15.96]
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Winterspring Part 2 (55-55)',
  {
    image = ZGV.IMAGESDIR .. 'Winterspring',
    condition_suggested = function()
      return level == 55 and not completedq(4300)
    end,
    next = 'Leveling Guides\\Western Plaguelands (55-56)',
    hardcore = true,
  },
  [[
step
Follow the road up and enter the tunnel |goto Felwood 65.13,8.01 < 10 |only if walking and not zone("Winterspring")
Follow the path |goto Felwood 66.26,2.90 < 10 |only if walking and not zone("Winterspring")
Leave the tunnel |goto Felwood 68.40,5.84 < 10 |only if walking and not zone("Winterspring")
talk Donova Snowden##9298
turnin Strange Sources##4842 |goto Winterspring 31.27,45.16
turnin Toxic Horrors##5086 |goto Winterspring 31.27,45.16
accept Winterfall Runners##5087 |goto Winterspring 31.27,45.16
step
kill Winterfall Runner##10916+
|tip They look like a group of 3 white furbolgs that walk back and forth along this road.
|tip Check these locations, and if you don't find them, wait at the location in this step closest to Everlook.
|tip They will eventually walk past this location.
|tip Use cooldowns here and have a potion ready |only if hardcore
collect Winterfall Crate##12829 |q 5087/1 |goto Winterspring 30.04,42.55
You can also find them around: |notinsticky
[46.96,39.54]
[53.55,33.96]
If you don't want to wait for the patrol, there's also usually one in Felwood around [Felwood 60.23,5.75]
step
talk Donova Snowden##9298
turnin Winterfall Runners##5087 |goto Winterspring 31.27,45.17
step
Run along the river to leave Bloodvenom Post |goto Felwood 37.69,49.42 < 30 |only if walking and (subzone("Bloodvenom Post") or subzone("Bloodvenom River"))
Enter the building |goto Felwood 51.26,81.70 < 10 |walk
talk Eridan Bluewind##9116
|tip Inside the building.
turnin Silver Heart##4084 |goto Felwood 51.35,81.51
accept Aquementas##4005 |goto Felwood 51.35,81.51
step
Enter the building |goto Orgrimmar 49.85,70.43 < 10 |walk
talk Karus##3309
|tip Inside the building.
|tip Deposit these items into the bank.
bank Eridan's Supplies##11617 |goto Orgrimmar 49.58,69.12 |q 4005 |future
|tip Collect these items from the bank.
collect Head of Magus Rimtori##10597 |goto Orgrimmar 49.58,69.12 |q 3507
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 3507
|only if Rogue
step
Enter the building |goto Orgrimmar 48.19,79.68 < 10 |walk
talk Trak'gen##3313
|tip Inside the building.
|tip Buy enough ammo to fill your ammo bag, plus 10-12 extra stacks.
|tip You will be out questing for a while, with no easy access to an ammo vendor.
Visit the Vendor |vendor Trak'gen##3313 |goto Orgrimmar 48.12,80.53 |q 3507
|only if Hunter
step
talk Belgrom Rockmaul##4485
turnin Betrayed##3507 |goto Orgrimmar 75.23,34.24
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Western Plaguelands (55-56)',
  {
    image = ZGV.IMAGESDIR .. 'Western Plaguelands',
    condition_suggested = function()
      return level >= 55 and level <= 56 and not completedq(4985)
    end,
    next = 'Leveling Guides\\Eastern Plaguelands (56-57)',
    hardcore = true,
  },
  [[
step
talk William Montague##4549
|tip Collect these items from the bank.
collect Filled Vial Labeled #1##10691 |goto Undercity 65.97,44.75 |q 3568
collect Filled Vial Labeled #2##10692 |goto Undercity 65.97,44.75 |q 3568
collect Filled Vial Labeled #3##10693 |goto Undercity 65.97,44.75 |q 3568
collect Filled Vial Labeled #4##10694 |goto Undercity 65.97,44.75 |q 3568
collect Tablet of Markri##10540 |goto Undercity 65.97,44.75 |q 3542
collect Everlook Report##15788 |goto Undercity 65.97,44.75 |q 6029
collect Studies in Spirit Speaking##15790 |goto Undercity 65.97,44.75 |q 6030
step
talk Harbinger Balthazad##10879
|tip He walks around this area in the middle of Undercity.
|tip He's wearing holding a lantern, wearing a white shirt.
|tip He can also be in the ring hallway surrounding the center of Undercity.
|tip This quest will not be here if you have other Call to Arms quests.
accept A Call to Arms: The Plaguelands!##5094 |goto Undercity 63.81,44.07
|only if not haveq(5095)
step
talk Andron Gant##6522
turnin Delivery to Andron Gant##3542 |goto Undercity 54.82,76.35
accept Andron's Payment to Jediga##3564 |goto Undercity 54.82,76.35
step
Follow the path down |goto Undercity 52.92,77.65 < 10 |walk
talk Chemist Cuely##8390
turnin Seeping Corruption##3568 |goto Undercity 48.71,71.40
step
Watch the dialogue
talk Chemist Cuely##8390
accept Seeping Corruption##3569 |goto Undercity 48.71,71.40
step
talk Thersa Windsong##8393
turnin Seeping Corruption##3569 |goto Undercity 49.03,70.82
step
talk Chemist Cuely##8390
accept Seeping Corruption##3570 |goto Undercity 48.71,71.40 |instant
step
talk Hannah Akeley##4575
|tip If you can afford it.
|tip Stock up on a few Runes of Teleportation to use to travel faster while leveling.
Visit the Vendor |vendor Hannah Akeley##4575 |goto Undercity 82.78,15.83 |q 5094
|only if Mage
step
talk William Montague##4549
|tip Deposit these items into the bank.
bank Andron's Note##10679 |goto Undercity 65.97,44.75 |q 3564 |future
step
talk Mickey Levine##11615
accept A Plague Upon Thee##5901 |goto Tirisfal Glades 83.29,72.33
step
talk High Executor Derrington##10837
turnin A Call to Arms: The Plaguelands!##5094 |goto Tirisfal Glades 83.13,68.93 |only if haveq(5094)
turnin A Call to Arms: The Plaguelands!##5095 |goto Tirisfal Glades 83.13,68.93 |only if haveq(5095)
accept Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
step
click Box of Incendiaries##176092
collect Flame in a Bottle##12814 |goto Tirisfal Glades 83.17,69.09 |q 5096
step
talk Argent Officer Garush##10839
turnin The Everlook Report##6029 |goto Tirisfal Glades 83.19,68.45
accept Argent Dawn Commission##5503 |goto Tirisfal Glades 83.19,68.45 |instant
step
Equip the Argent Dawn Commission
|tip Wearing it will allow Minion's Scourgestones to drop from undead enemies in Western and Eastern Plaguelands.
Gain the Argent Dawn Commission Buff |havebuff Argent Dawn Commission##17670 |q 5402 |future
step
Enter the building |goto Western Plaguelands 38.04,54.61 < 10 |walk
talk Janice Felstone##10778
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
accept Better Late Than Never##5021 |goto Western Plaguelands 38.40,54.05
step
Enter the building |goto Western Plaguelands 38.52,55.33 < 10 |walk
click Janice's Parcel
|tip Inside the building.
|tip You'll have to click it twice.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
turnin Better Late Than Never##5021 |goto Western Plaguelands 38.73,55.24
accept Better Late Than Never##5023 |goto Western Plaguelands 38.73,55.24
step
click Command Tent
use the Scourge Banner##12807
Destroy the Command Tent and Plant the Scourge Banner in the Camp |q 5096/1 |goto Western Plaguelands 40.68,51.98
_Note_
|tip These mobs can VERY easily chain pull. Be methodical about how you pull mobs out of the camp here and be ready to run if you get too many.
|tip The mages can do very high damage from far away, never pull more than two of them at once.
|tip If you are very unlucky and the camp spawned nothing but mages, get help or skip this quest for now. |only if hardcore
|tip If you have to skip this quest, grind mobs around the area or do a dungeon until you find help.  |only if hardcore
|tip Unfortunately this is an important chain and you cannot do other quests in the zone if you don't do it. |only if hardcore
step
talk High Executor Derrington##10837
turnin Scarlet Diversions##5096 |goto Tirisfal Glades 83.13,68.93
accept All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.94
accept The Scourge Cauldrons##5228 |goto Tirisfal Glades 83.13,68.93
step
_Destroy This Item:_
|tip It is no longer needed.
trash Flame in a Bottle##12814
step
talk Shadow Priestess Vandis##11055
turnin The Scourge Cauldrons##5228 |goto Tirisfal Glades 83.03,71.91
accept Target: Felstone Field##5229 |goto Tirisfal Glades 83.03,71.91
step
kill Cauldron Lord Bilemaw##11075
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Felstone Field Cauldron Key##13194 |q 5229/1 |goto Western Plaguelands 37.03,57.11
step
click Scourge Cauldron##176361
turnin Target: Felstone Field##5229 |goto Western Plaguelands 37.19,56.87
accept Return to the Bulwark##5230 |goto Western Plaguelands 37.19,56.87
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5230 |goto Tirisfal Glades 83.04,71.91
accept Target: Dalson's Tears##5231 |goto Tirisfal Glades 83.04,71.91
step
kill Cauldron Lord Malvinious##11077
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Dalson's Tears Cauldron Key##13195 |q 5231/1 |goto Western Plaguelands 46.18,52.38
step
click Scourge Cauldron##177289
|tip Watch for patrols and respawns while in the area.	|only if hardcore
turnin Target: Dalson's Tears##5231 |goto Western Plaguelands 46.18,52.02
accept Return to the Bulwark##5232 |goto Western Plaguelands 46.18,52.02
step
Enter the building |goto Western Plaguelands 47.52,50.94 < 10 |walk
click Mrs. Dalson's Diary
|tip Inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
accept Mrs. Dalson's Diary##5058 |goto Western Plaguelands 47.79,50.67 |instant
step
kill Wandering Skeleton##10816
|tip It looks like a white skeleton that spawns here and walks around this area around the buildings nearby.
|tip You can wait here until it walks by here, or respawns, or you can search around the buildings.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Dalson Outhouse Key##12738 |goto Western Plaguelands 47.85,49.32 |q 5060 |future
step
click Outhouse##175925
|tip Accept the "Locked Away" quest.
kill Farmer Dalson##10836
collect Dalson Cabinet Key##12739 |goto Western Plaguelands 48.11,49.71 |q 5060 |future
step
Enter the building |goto Western Plaguelands 47.14,50.19 < 10 |walk
click Locked Cabinet
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
accept Locked Away##5060 |goto Western Plaguelands 47.37,49.65 |instant
step
Kill enemies around this area
|tip You should already be level 56, or pretty close.
ding 56 |goto Western Plaguelands 37.04,57.13
step
Enter the building |goto Western Plaguelands 39.57,68.38 < 10 |walk
talk Chromie##10667
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
accept A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Mark Tower One |q 5098/1 |goto Western Plaguelands 40.13,71.52
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Mark Tower Four |q 5098/4 |goto Western Plaguelands 46.70,71.10
step
use the Temporal Displacer##12627
|tip Use it near the silos with blue light shining out of them around this area.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
|tip Try to pick silos near bodies of water. |only if hardcore
|tip The parasites evade in water, run to the river if you're overwhelmed |only if hardcore
kill 15 Temporal Parasite##10717 |q 4971/1 |goto Western Plaguelands 48.97,68.53
You can find more around: |notinsticky
[49.95,66.69]
[48.14,66.12]
[47.93,63.01]
[46.77,62.41]
[45.02,62.68]
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Mark Tower Three |q 5098/3 |goto Western Plaguelands 44.22,63.37
step
use the Beacon Torch##12815
|tip Use it in front of the tower entrance.
|tip Be careful, there is an elite enemy inside the tower.
|tip Avoid the doorway, making sure the elite inside can't see you.
|tip You can get closer to the tower safely, if the enemy inside can't see you.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
Mark Tower Two |q 5098/2 |goto Western Plaguelands 42.44,66.27
step
Enter the building |goto Western Plaguelands 39.57,68.38 < 10 |walk
talk Chromie##10667
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
turnin A Matter of Time##4971 |goto Western Plaguelands 39.45,66.76
accept Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
step
click Small Lockbox##175802+
|tip They look like small grey metal chests on the ground inside the crumbled buildings around this area.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect 5 Andorhal Watch##12638 |q 4972/1 |goto Western Plaguelands 38.29,69.63
You can find more at: |notinsticky
[38.88,68.06]
[40.27,68.17]
[40.85,67.14]
[40.32,66.48]
step
Enter the building |goto Western Plaguelands 39.57,68.38 < 10 |walk
talk Chromie##10667
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
turnin Counting Out Time##4972 |goto Western Plaguelands 39.45,66.76
step
talk High Executor Derrington##10837
turnin All Along the Watchtowers##5098 |goto Tirisfal Glades 83.13,68.93
accept Scholomance##838 |goto Tirisfal Glades 83.13,68.93
step
_Destroy This Item:_
|tip It is no longer needed.
trash Beacon Torch##12815
step
talk Apothecary Dithers##11057
turnin Scholomance##838 |goto Tirisfal Glades 83.28,69.23
accept Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5232 |goto Tirisfal Glades 83.04,71.91
accept Target: Writhing Haunt##5233 |goto Tirisfal Glades 83.04,71.91
step
Kill Skeletal enemies around this area
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect 15 Skeletal Fragments##14619 |q 964/1 |goto Western Plaguelands 36.64,57.74
step
kill Cauldron Lord Razarch##11076
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Writhing Haunt Cauldron Key##13197 |q 5233/1 |goto Western Plaguelands 53.02,66.06
step
click Scourge Cauldron##175925
|tip Watch for patrols and respawns while in the area.	|only if hardcore
turnin Target: Writhing Haunt##5233 |goto Western Plaguelands 53.02,65.72
accept Return to the Bulwark##5234 |goto Western Plaguelands 53.02,65.72
step
Enter the building |goto Western Plaguelands 53.60,64.79 < 10 |walk
talk Mulgris Deepriver##10739
|tip Inside the building.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
accept The Wildlife Suffers Too##4984 |goto Western Plaguelands 53.72,64.67
stickystart "Kill_Diseased_Wolves"
step
Follow the path |goto Western Plaguelands 50.41,29.78 < 40 |only if walking
talk Kirsta Deepshadow##11610
accept Unfinished Business##6004 |goto Western Plaguelands 51.92,28.06
stickystart "Kill_Scarlet_Hunters"
stickystart "Kill_Scarlet_Mages"
stickystart "Kill_Scarlet_Knights"
step
kill 2 Scarlet Medic##10605 |q 6004/1 |goto Western Plaguelands 51.67,44.39
|tip They share spawn points with other Scarlet enemies, so kill them too, if you can't find any.
|tip Prioritize killing the Medics first if you pull multiple enemies and don't plan on running.	|only if hardcore
step
label "Kill_Scarlet_Hunters"
kill 2 Scarlet Hunter##1831 |q 6004/2 |goto Western Plaguelands 51.67,44.39
|tip They share spawn points with other Scarlet enemies, so kill them too, if you can't find any. |notinsticky
|tip Prioritize killing the Medics first if you pull multiple enemies and don't plan on running.	|only if hardcore |notinsticky
step
label "Kill_Scarlet_Mages"
kill 2 Scarlet Mage##1826 |q 6004/3 |goto Western Plaguelands 50.47,41.12
|tip They share spawn points with other Scarlet enemies, so kill them too, if you can't find any. |notinsticky
|tip Prioritize killing the Medics first if you pull multiple enemies and don't plan on running.	|only if hardcore |notinsticky
step
label "Kill_Scarlet_Knights"
kill 2 Scarlet Knight##1833 |q 6004/4 |goto Western Plaguelands 50.47,41.12
|tip They share spawn points with other Scarlet enemies, so kill them too, if you can't find any. |notinsticky
|tip Prioritize killing the Medics first if you pull multiple enemies and don't plan on running.	|only if hardcore |notinsticky
step
Follow the path |goto Western Plaguelands 50.41,29.78 < 40 |only if walking
talk Kirsta Deepshadow##11610
turnin Unfinished Business##6004 |goto Western Plaguelands 51.92,28.06
accept Unfinished Business##6023 |goto Western Plaguelands 51.92,28.06
step
Run around the mountain and follow the path up |goto Western Plaguelands 55.23,34.61 < 30 |only if walking
kill Huntsman Radley##11613 |q 6023/1 |goto Western Plaguelands 57.83,36.09
|tip Watch for patrols and respawns while in the area.	|only if hardcore
step
kill Cavalier Durgen##11611 |q 6023/2 |goto Western Plaguelands 54.37,23.77
|tip He walks back and forth, between this spot and the top of the tower.
|tip Wait outside the tower near this spot, he will eventually walk outside.
|tip Pull him away into the road nearby, so you can fight him alone.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
step
talk Kirsta Deepshadow##11610
turnin Unfinished Business##6023 |goto Western Plaguelands 51.92,28.06
step
label "Kill_Diseased_Wolves"
kill 8 Diseased Wolf##1817 |q 4984/1 |goto Western Plaguelands 46.92,39.81
|tip They share spawn points with Carrion Lurker spiders.
|tip Kill those as well, if you can't find any wolves.
You can find more around: |notinsticky
[45.96,48.00]
[42.74,54.83]
step
Enter the building |goto Western Plaguelands 53.60,64.79 < 10 |walk
talk Mulgris Deepriver##10739
|tip Inside the building.
turnin The Wildlife Suffers Too##4984 |goto Western Plaguelands 53.72,64.67
accept The Wildlife Suffers Too##4985 |goto Western Plaguelands 53.72,64.67
step
kill 8 Diseased Grizzly##1816 |q 4985/1 |goto Western Plaguelands 56.91,62.97
|tip They share spawn points with Plague Lurker spiders.
|tip Kill those as well, if you can't find any bears.
You can find more around: |notinsticky
[57.72,58.55]
[58.89,53.98]
[63.17,49.89]
[68.09,46.85]
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Eastern Plaguelands (56-57)',
  {
    image = ZGV.IMAGESDIR .. 'Eastern Plaguelands',
    condition_suggested = function()
      return level >= 56 and level <= 57 and not completedq(7818)
    end,
    next = 'Leveling Guides\\Western Plaguelands (57-58)',
    hardcore = true,
  },
  [[
step
Cross into Eastern Plaguelands and follow the river north |goto Western Plaguelands 69.30,45.04 < 50 |only if walking and zone("Western Plaguelands")
talk Tirion Fordring##1855
|tip He walks around this area.
accept Demon Dogs##5542 |goto Eastern Plaguelands 7.56,43.70
accept Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.56,43.70
accept Carrion Grubbage##5544 |goto Eastern Plaguelands 7.56,43.70
stickystart "Kill_Plaguebats"
stickystart "Kill_Plaguehound_Runts"
stickystart "Collect_Slabs_Of_Carrion_Worm_Meat"
step
talk Nathanos Blightcaller##11878
accept To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
accept Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
step
talk Pamela Redpath##10926
|tip She walks around this area inside this crumbled house.
turnin Sister Pamela##5601 |goto Eastern Plaguelands 36.45,90.80
accept Pamela's Doll##5149 |goto Eastern Plaguelands 36.45,90.80
stickystop "Kill_Plaguebats"
stickystop "Kill_Plaguehound_Runts"
stickystop "Collect_Slabs_Of_Carrion_Worm_Meat"
stickystart "Collect_Pamelas_Dolls_Left_Side"
stickystart "Collect_Pamelas_Dolls_Right_Side"
step
click Pamela's Doll's Head##176116
|tip It looks like a brown ball, with two X's for eyes, with flies buzzing around it.
|tip It can be in any of the 3 buildings around this area.
|tip Enemies may spawn after interacting with the doll.	|only if hardcore
collect Pamela's Doll's Head##12886 |goto Eastern Plaguelands 39.07,91.53 |q 5149
step
label "Collect_Pamelas_Dolls_Left_Side"
click Pamela's Doll's Left Side##176142
|tip It looks like a brown half of a doll, with one arm and one leg, with flies buzzing around it.
|tip It can be in any of the 3 buildings around this area.
|tip Enemies may spawn after interacting with the doll.	|only if hardcore
collect Pamela's Doll's Left Side##12887 |goto Eastern Plaguelands 39.07,91.53 |q 5149
step
label "Collect_Pamelas_Dolls_Right_Side"
click Pamela's Doll's Right Side##176143
|tip It looks like a brown half of a doll, with one arm and one leg, with flies buzzing around it.
|tip It can be in any of the 3 buildings around this area.
|tip Enemies may spawn after interacting with the doll.	|only if hardcore
collect Pamela's Doll's Right Side##12888 |goto Eastern Plaguelands 39.07,91.53 |q 5149
step
use Pamela's Doll's Head##12886
collect Pamela's Doll##12885 |q 5149/1 |goto Eastern Plaguelands 36.45,90.80
step
talk Pamela Redpath##10926
|tip She walks around this area inside this crumbled house.
turnin Pamela's Doll##5149 |goto Eastern Plaguelands 36.45,90.80
accept Auntie Marlene##5152 |goto Eastern Plaguelands 36.45,90.80
accept Uncle Carlin##5241 |goto Eastern Plaguelands 36.45,90.80
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
kill 5 Plaguehound##8597 |q 5542/2 |goto Eastern Plaguelands 70.01,68.38
You can find more around: |notinsticky
[76.41,66.59]
[71.11,56.12]
stickystop "Collect_Slabs_Of_Carrion_Worm_Meat"
step
talk Caretaker Alen##11038
|tip He walks around this area.
accept Zaeldarr the Outcast##6021 |goto Eastern Plaguelands 79.54,63.77
accept The Restless Souls##5281 |goto Eastern Plaguelands 79.54,63.77
step
talk Duke Nicholas Zverenhoff##11039
turnin Duke Nicholas Zverenhoff##6030 |goto Eastern Plaguelands 81.43,59.82
step
talk Carlin Redpath##11063
turnin Uncle Carlin##5241 |goto Eastern Plaguelands 81.52,59.77
accept Defenders of Darrowshire##5211 |goto Eastern Plaguelands 81.52,59.77
step
talk Georgia##12636
fpath Light's Hope Chapel |goto Eastern Plaguelands 80.22,57.01
stickystart "Kill_Frenzied_Plaguehounds"
stickystart "Collect_Slabs_Of_Carrion_Worm_Meat"
step
talk Aurora Skycaller##10304
turnin Troubled Spirits of Kel'Theril##5245 |goto Eastern Plaguelands 53.51,22.00
stickystart "Darrowshire_Spirits"
step
Kill enemies around this area
|tip All around this town.
|tip Only Undead enemies will drop the quest item.
collect 7 Living Rot##15447 |n
|tip Get these as fast as you can.
|tip They only last for 10 minutes before they disappear.
|tip These items do not stack, so make sure you have 7 free bag spaces to collect them.
|tip Watch for stealthed enemies around here.				|only if hardcore
|tip Walk carefully through the area to avoid pulling many enemies.	|only if hardcore
use Mortar and Pestle##15454
collect Coagulated Rot##15448 |q 6022/1 |goto Eastern Plaguelands 59.90,68.41
step
kill 20 Noxious Plaguebat##8601 |q 6042/1 |goto Eastern Plaguelands 61.96,61.16
You can find more around: |notinsticky
[54.34,58.88]
[49.30,62.57]
[52.57,56.21]
[54.57,50.34]
[60.98,55.50]
stickystart "Kill_Frenzied_Plaguehounds"
step
kill 10 Monstrous Plaguebat##8602 |q 6042/2 |goto Eastern Plaguelands 60.85,48.81
|tip Watch for a pack of elite enemies along the road while traveling.	|only if hardcore
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
[48.56,26.97]
[52.38,24.42]
step
label "Kill_Frenzied_Plaguehounds"
kill 5 Frenzied Plaguehound##8598 |q 5542/3 |goto Eastern Plaguelands 62.63,47.95
|tip Watch for a pack of elite enemies along the road while traveling.	|only if hardcore |notinsticky
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
step
Kill enemies around this area
|tip You should already be level 57, or pretty close.
|tip Watch for a pack of elite enemies along the road while traveling.	|only if hardcore
ding 57 |goto Eastern Plaguelands 60.85,48.81
You can find more around: |notinsticky
[51.17,43.24]
[49.69,35.97]
[48.56,26.97]
[52.38,24.42]
step
click Large Termite Mound##177464+
|tip They look like large brown and white stones cracked open with green goo leaking out of the top of them around this area.
|tip When fighting near the road, watch for a group of elite patrols and avoid them.	|only if hardcore
collect 100 Plagueland Termites##15043 |q 5903/1 |goto Eastern Plaguelands 45.90,34.10
You can find more around: |notinsticky
[42.19,38.20]
[42.84,34.28]
[40.61,31.38]
[36.03,31.81]
[32.08,35.71]
[26.47,37.57]
[25.22,37.89]
[28.46,32.49]
[26.16,29.78]
[23.87,25.24]
[22.45,21.52]
[20.40,27.00]
step
label "Darrowshire_Spirits"
Kill ghouls as you quest
|tip Only enemies that look like ghouls will count.
|tip They share spawn points with other undead in the area. IF you don't see any you may need to grind other mobs to force them to respawn.
talk Darrowshire Spirit##11064+
|tip They appear after you kill the ghouls.
Free #15# Darrowshire Spirits |q 5211/1 |goto Eastern Plaguelands 66.88,40.62
You can find more around: |notinsticky
[42.19,38.20]
[42.84,34.28]
[40.61,31.38]
[36.03,31.81]
[32.08,35.71]
[26.47,37.57]
[25.22,37.89]
[28.46,32.49]
[26.16,29.78]
[23.87,25.24]
[22.45,21.52]
[20.40,27.00]
step
Enter the building |goto Eastern Plaguelands 14.59,33.47 < 10 |walk
talk Egan##11140
|tip Inside the building.
turnin The Restless Souls##5281 |goto Eastern Plaguelands 14.45,33.74
step
talk Augustus the Touched##12384
|tip Inside the building.
accept Augustus' Receipt Book##6164 |goto Eastern Plaguelands 14.45,33.48
step
Enter the building |goto Eastern Plaguelands 17.56,33.03 < 10 |walk
click Augustus' Receipt Book
|tip Upstairs inside the building.
collect Augustus' Receipt Book##15884 |q 6164/1 |goto Eastern Plaguelands 17.43,31.09
step
Enter the building |goto Eastern Plaguelands 14.59,33.47 < 10 |walk
talk Augustus the Touched##12384
|tip Inside the building.
turnin Augustus' Receipt Book##6164 |goto Eastern Plaguelands 14.45,33.48
step
label "Collect_Slabs_Of_Carrion_Worm_Meat"
kill Carrion Grub##8603+
|tip Go out of your way to kill grubs, the drop rate can be bad.
collect 15 Slab of Carrion Worm Meat##13853 |q 5544/1 |goto Eastern Plaguelands 43.24,82.95
You can find more around: |notinsticky
[42.24,69.81]
[35.16,74.32]
[27.42,69.07]
[19.99,68.52]
[18.56,77.87]
[33.76,82.90]
step
Follow the path |goto Eastern Plaguelands 11.93,61.49 < 40 |only if walking
talk Tirion Fordring##1855
|tip He walks around this area.
|tip Run all the way around the mountain.
|tip You will die if you go through the cave, run all the way around. |only if hardcore
turnin Demon Dogs##5542 |goto Eastern Plaguelands 7.57,43.70
turnin Blood Tinged Skies##5543 |goto Eastern Plaguelands 7.57,43.70
turnin Carrion Grubbage##5544 |goto Eastern Plaguelands 7.57,43.70
accept Redemption##5742 |goto Eastern Plaguelands 7.57,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
|tip Type "/sit" into your chat, or press X.
|tip You must be sitting for the dialogue option to appear when you talk to him.
Select _"I am ready to hear your tale, Tirion."_
Listen to Tirion's Tale |q 5742/1 |goto Eastern Plaguelands 7.57,43.70
step
talk Tirion Fordring##1855
|tip He walks around this area.
turnin Redemption##5742 |goto Eastern Plaguelands 7.57,43.70
step
talk Nathanos Blightcaller##11878
turnin To Kill With Purpose##6022 |goto Eastern Plaguelands 26.54,74.74
turnin Un-Life's Little Annoyances##6042 |goto Eastern Plaguelands 26.54,74.74
step
Enter the crypt |goto Eastern Plaguelands 27.86,85.48 < 10 |walk
kill Zaeldarr the Outcast##12250
|tip Downstairs inside the crypt.
collect Zaeldarr's Head##15785 |q 6021/1 |goto Eastern Plaguelands 27.46,84.88
step
talk Caretaker Alen##11038
|tip He walks around this area.
turnin Zaeldarr the Outcast##6021 |goto Eastern Plaguelands 79.54,63.77
step
talk Carlin Redpath##11063
turnin Defenders of Darrowshire##5211 |goto Eastern Plaguelands 81.52,59.76
step
talk Royal Overseer Bauhaus##10781
turnin Better Late Than Never##5023 |goto Undercity 69.78,43.15
accept The Jeremiah Blues##5049 |goto Undercity 69.78,43.15
step
talk Jeremiah Payson##8403
|tip Under the stairs.
turnin The Jeremiah Blues##5049 |goto Undercity 67.60,44.16
accept Good Luck Charm##5050 |goto Undercity 67.60,44.16
step
talk Auctioneer Rhyker##15686
|tip Buy these items from the auction house or collect them from your bank.
|tip You will turn them in for a lot of experience.
|tip If you have any in your bank, get them out before you buy more.
|tip If you can't get them, it's okay, but you may have to grind a bit later to make up for it.
collect 60 Wool Cloth##2592 |goto Undercity 60.47,46.44 |q 7813 |future
collect 60 Silk Cloth##4306 |goto Undercity 60.47,46.44 |q 7814 |future
collect 60 Mageweave Cloth##4338 |goto Undercity 60.47,46.44 |q 7817 |future
collect 60 Runecloth##14047 |goto Undercity 60.47,46.44 |q 7818 |future
|only if not selfmade
step
talk Ralston Farnsley##14729
accept A Donation of Wool##7813 |goto Undercity 71.66,29.23 |instant
|only if itemcount(2592) >= 60
step
talk Ralston Farnsley##14729
accept A Donation of Silk##7814 |goto Undercity 71.66,29.23 |instant
|only if itemcount(4306) >= 60
step
talk Ralston Farnsley##14729
accept A Donation of Mageweave##7817 |goto Undercity 71.66,29.23 |instant
|only if itemcount(4338) >= 60
step
talk Ralston Farnsley##14729
accept A Donation of Runecloth##7818 |goto Undercity 71.66,29.23 |instant
|only if itemcount(14047) >= 60
step
talk Kaelystia Hatebringer##4566 |only if Mage
talk Kaal Soulreaper##4563 |only if Warlock
talk Aelthalyste##4606 |only if Priest
talk Baltus Fowler##4595 |only if Warrior
talk Carolyn Ward##4582 |only if Rogue
Train your spells. |trainer Kaelystia Hatebringer##4566 |goto Undercity/0 85.04,14.03 |only if Mage |q 5050
Train your spells. |trainer Kaal Soulreaper##4563 |goto Undercity/0 86.07,15.78 |only if Warlock |q 5050
Train your spells. |trainer Aelthalyste##4606 |goto Undercity/0 49.11,18.40 |only if Priest |q 5050
Train your spells. |trainer Baltus Fowler##4595 |goto Undercity/0 47.30,17.22 |only if Warrior |q 5050
Train your spells. |trainer Carolyn Ward##4582 |goto Undercity/0 83.88,72.09 |only if Rogue |q 5050
|tip Inside the building |only if Warrior or Mage or Warlock
step
talk Ezekiel Graves##4585
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Ezekiel Graves##4585 |goto Undercity 75.20,51.19 |q 5050
|only if Rogue
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Western Plaguelands (57-58)',
  {
    image = ZGV.IMAGESDIR .. 'Western Plaguelands',
    condition_suggested = function()
      return level >= 57 and level <= 58 and not completedq(5210)
    end,
    next = 'Leveling Guides\\Winterspring (58-59)',
    hardcore = true,
  },
  [[
step
talk Mickey Levine##11615
turnin A Plague Upon Thee##5901 |goto Tirisfal Glades 83.29,72.33
accept A Plague Upon Thee##5902 |goto Tirisfal Glades 83.29,72.33
step
_Destroy These Items:_
|tip They are no longer needed.
trash Plagueland Termites##15043 |goto Tirisfal Glades 83.04,71.91
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5234 |goto Tirisfal Glades 83.04,71.91
accept Target: Gahrron's Withering##5235 |goto Tirisfal Glades 83.04,71.91
step
talk Apothecary Dithers##11057
turnin Skeletal Fragments##964 |goto Tirisfal Glades 83.28,69.23
step
Enter the building |goto Western Plaguelands 38.04,54.61 < 10 |walk
talk Janice Felstone##10778
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin Good Luck Charm##5050 |goto Western Plaguelands 38.40,54.05
accept Two Halves Become One##5051 |goto Western Plaguelands 38.40,54.05
step
kill Jabbering Ghoul##10801
|tip It looks like a green ghoul holding a pitchfork.
|tip He can possibly spawn in multiple locations, and may walk around this area.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
collect Good Luck Other-Half-Charm##12722 |goto Western Plaguelands 36.84,58.23 |q 5051
step
use the Good Luck Other-Half-Charm##12722
collect Good Luck Charm##12723 |q 5051/1
step
Enter the building |goto Western Plaguelands 38.04,54.61 < 10 |walk
talk Janice Felstone##10778
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin Two Halves Become One##5051 |goto Western Plaguelands 38.40,54.05
step
click Northridge Lumber Mill Crate##177490
|tip Inside the building.
Choose _"Place Termite Barrel on the crate."_
click Termite Barrel
|tip It appears on top of the crate.
turnin A Plague Upon Thee##5902 |goto Western Plaguelands 48.35,32.00
accept A Plague Upon Thee##6390 |goto Western Plaguelands 48.35,32.00
step
Enter the building |goto Western Plaguelands 49.29,78.56 < 10 |walk
talk Marlene Redpath##10927
|tip Upstairs inside the building.
turnin Auntie Marlene##5152 |goto Western Plaguelands 49.17,78.58
accept A Strange Historian##5153 |goto Western Plaguelands 49.17,78.58
step
click Joseph Redpath's Monument##176145
collect Joseph's Wedding Ring##12894 |q 5153/1 |goto Western Plaguelands 49.68,76.77
step
Cross the bridge |goto Western Plaguelands 49.22,73.14 < 30 |only if walking and subzone("Sorrow Hill")
Enter the building |goto Western Plaguelands 39.57,68.38 < 10 |walk
talk Chromie##10667
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin A Strange Historian##5153 |goto Western Plaguelands 39.45,66.76
accept The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
step
Hug the outside of this building carefully to avoid enemies and get to the building entrance |goto Western Plaguelands 43.81,70.34 < 5 |only if walking
Enter the building |goto Western Plaguelands 44.09,69.22 < 10 |walk
click Musty Tome##176150+
|tip They look like blue books on the floor inside this building.
|tip Only one of them is the real book, and it's random.
|tip If you click fake books, enemies will spawn, so try to only click the real book.
|tip To identify the real book, zoom in your view, mouse over the books to highlight them, and look at the book pages.
|tip The fake books will have very blurry pages, with the top half of pages shaded darker than the bottom half of pages.
|tip The real book pages look sharper, and the top half and bottom half of the pages are not shaded differently.
|tip If the correct book isn't there, click other books and kill enemies until the correct book appears.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
collect Annals of Darrowshire##12900 |q 5154/1 |goto Western Plaguelands 43.52,69.55
step
Leave the building and be careful to avoid the enemies nearby |goto Western Plaguelands 44.09,69.22 < 10 |walk |only if subzone("Ruins of Andorhal") and _G.IsIndoors()
Enter the building |goto Western Plaguelands 39.57,68.38 < 10 |walk
talk Chromie##10667
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin The Annals of Darrowshire##5154 |goto Western Plaguelands 39.45,66.76
accept Brother Carlin##5210 |goto Western Plaguelands 39.45,66.76
step
Enter the building |goto Western Plaguelands 53.60,64.79 < 10 |walk
talk Mulgris Deepriver##10739
|tip Inside the building.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin The Wildlife Suffers Too##4985 |goto Western Plaguelands 53.72,64.67
accept Glyphed Oaken Branch##4987 |goto Western Plaguelands 53.72,64.67
step
kill Cauldron Lord Soulwrath##11078
|tip He walks around this area.
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
collect Gahrron's Withering Cauldron Key##13196 |q 5235/1 |goto Western Plaguelands 62.78,58.75
step
click Scourge Cauldron##176361
|tip Watch for patrols and respawns while you navigate the area. |only if hardcore
turnin Target: Gahrron's Withering##5235 |goto Western Plaguelands 62.56,58.57
accept Return to the Bulwark##5236 |goto Western Plaguelands 62.56,58.57
step
talk Shadow Priestess Vandis##11055
turnin Return to the Bulwark##5236 |goto Tirisfal Glades 83.03,71.91
step
talk Mickey Levine##11615
turnin A Plague Upon Thee##6390 |goto Tirisfal Glades 83.29,72.33
step
talk High Executor Derrington##10837
accept Mission Accomplished!##5238 |goto Tirisfal Glades 83.13,68.94 |instant
step
talk Carlin Redpath##11063
turnin Brother Carlin##5210 |goto Eastern Plaguelands 81.52,59.77
step
Kill enemies around this area
|tip You should already be pretty close to reaching level 58.
|tip Grinding a bit now will reduce the grinding you have to do later.
ding 58 |goto Eastern Plaguelands 60.01,68.45
step
Grind enemies in the area
|tip We are going to Moonglade to train our spells and then we will hearth.
|tip This step will complete when your Hearthstone is ready to use.
Grind XP Until Your Hearth Is Ready |complete C_Container.GetItemCooldown(6948) <= 100 |goto Eastern Plaguelands 60.01,68.45 |q 4741
|only if Druid
step
cast Teleport: Moonglade##18960
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 4741
|tip Go to Moonglade and train your spells, then hearth once it is off cooldown.
|only if Druid and C_Container.GetItemCooldown(6948) <= 100
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Winterspring (58-59)',
  {
    image = ZGV.IMAGESDIR .. 'Winterspring',
    condition_suggested = function()
      return level >= 58 and level <= 59 and not completedq(5163)
    end,
    next = 'Leveling Guides\\Silithus (59-60)',
    hardcore = true,
  },
  [[
step
talk Felnok Steelspring##10468
accept Chillwind Horns##4809 |goto Winterspring 61.63,38.61
step
talk Umi Rumplesnicker##10305
accept Are We There, Yeti?##977 |goto Winterspring 60.88,37.62
step
Leave Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking and subzone("Everlook")
Kill Ice Thistle enemies around this area
|tip Inside and outside the cave.
|tip Only the Matriarchs or Patriarchs will drop the quest item.
collect 2 Pristine Yeti Horn##12367 |q 977/1 |goto Winterspring 67.65,41.75
step
Leave the cave |goto Winterspring 67.70,41.57 < 30 |walk |only if subzone("Ice Thistle Hills") and _G.IsIndoors()
Follow the path up |goto Winterspring 63.11,59.12 < 40 |only if walking
kill 13 Moontouched Owlbeast##7453 |q 4741/1 |goto Winterspring 65.45,60.06
|tip You can find more inside the small caves around this area.
|tip They share spawn points with other Owlbeast enemies, so kill those too.
You can find more around [64.97,63.19]
step
talk Trull Failbane##10306
turnin Wild Guardians##4741 |goto Felwood 34.73,52.79
accept Wild Guardians##4721 |goto Felwood 34.73,52.79
step
Enter Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking
talk Umi Rumplesnicker##10305
turnin Are We There, Yeti?##977 |goto Winterspring 60.88,37.62
accept Are We There, Yeti?##5163 |goto Winterspring 60.88,37.62
step
use Umi's Mechanical Yeti##12928
|tip Use it on Legacki.
Scare Legacki |q 5163/1 |goto Winterspring 61.54,38.62
step
Leave Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking and subzone("Everlook")
kill Chillwind Chimaera##7448+
|tip They look like chimaeras.
|tip They share spawn points with the bears, so kill them too.
collect 8 Uncracked Chillwind Horn##12444 |q 4809/1 |goto Winterspring 59.97,21.54
You can find more around: |notinsticky
[54.75,22.59]
[59.18,18.02]
[60.13,12.28]
[57.99,14.79]
stickystart "Kill_Berserk_Owlbeasts"
step
Kill Owlbeast enemies around this area
|tip You can find more through the tunnel nearby.
|tip They share spawn points with other Owlbeast enemies, so kill those too.
|tip Berserk Owlbeasts have the highest drop chance for this quest item, but any Owlbeast can drop it.
collect Blue-feathered Necklace##12558 |goto Winterspring 63.18,21.91 |q 4882 |future
You can find more around: |notinsticky
[66.17,22.72]
[67.65,21.98]
[66.09,19.38]
[64.99,18.71]
step
use the Blue-feathered Necklace##12558
accept Guarding Secrets##4882 |goto Winterspring 63.18,21.91
step
label "Kill_Berserk_Owlbeasts"
kill 10 Berserk Owlbeast##7454 |q 4721/1 |goto Winterspring 63.18,21.91
|tip You can find more through the tunnel nearby. |notinsticky
|tip They share spawn points with other Owlbeast enemies, so kill those too. |notinsticky
You can find more around: |notinsticky
[66.17,22.72]
[67.65,21.98]
[66.09,19.38]
[64.99,18.71]
step
Enter Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking
talk Felnok Steelspring##10468
turnin Chillwind Horns##4809 |goto Winterspring 61.63,38.61
step
Enter the building |goto Winterspring 61.33,37.35 < 10 |walk
talk Izzy Coppergrab##13917
|tip Inside the building.
|tip Collect these items from the bank.
collect Eridan's Supplies##11617 |goto 61.45,36.98 |q 4005
collect Andron's Note##10679 |goto Winterspring 61.45,36.98 |q 3564
step
Leave Everlook |goto Winterspring 60.56,38.21 < 10 |only if walking and subzone("Everlook")
Follow the road and enter the building |goto Moonglade 51.47,41.45 < 15 |walk
talk Rabine Saturna##11801
|tip Inside the building.
turnin Rabine Saturna##1123 |goto Moonglade 51.68,45.09
accept Wasteland##1124 |goto Moonglade 51.68,45.09
step
talk Rabine Saturna##11801
|tip Inside the building.
accept A Reliquary of Purity##5527 |goto Moonglade 51.68,45.09
|tip If you didn't discover the Dire Maul dungeon earlier in the guide, you won't be able to accept this quest.
step
talk Loganaar##12042
Train your spells. |trainer Loganaar##12042 |goto Moonglade/0 52.50,40.54 |q 5527
|only if Druid
step
talk Trull Failbane##10306
turnin Wild Guardians##4721 |goto Felwood 34.73,52.79
turnin Guarding Secrets##4882 |goto Felwood 34.73,52.79
accept Guarding Secrets##4883 |goto Felwood 34.73,52.79
step
talk Jediga##8587
turnin Andron's Payment to Jediga##3564 |goto Azshara 22.56,51.42
step
Enter the building |goto Orgrimmar 53.65,64.61 < 10 |walk
talk Auctioneer Thathung##8673
|tip Inside the building.
|tip Buy these items from the auction house or collect them from your bank.
|tip You will turn them in for a lot of experience.
|tip If you have any in your bank, get them out before you buy more.
|tip If you can't get them, it's okay, but you may have to grind a bit later to make up for it.
collect 60 Wool Cloth##2592		|goto Orgrimmar 55.90,62.71		|q 7826 |future
collect 60 Silk Cloth##4306		|goto Orgrimmar 55.90,62.71		|q 7827 |future
collect 60 Mageweave Cloth##4338	|goto Orgrimmar 55.90,62.71		|q 7831 |future
collect 60 Runecloth##14047		|goto Orgrimmar 55.90,62.71		|q 7824 |future
|only if not selfmade
step
Enter the building |goto Orgrimmar 61.35,50.37 < 10 |walk
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Wool##7826 |goto Orgrimmar 63.60,51.23 |instant
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Silk##7827 |goto Orgrimmar 63.60,51.23 |instant
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Mageweave##7831 |goto Orgrimmar 63.60,51.23 |instant
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Runecloth##7824 |goto Orgrimmar 63.60,51.23 |instant
step
Enter the building |goto Orgrimmar 53.65,64.61 < 10 |walk
talk Auctioneer Thathung##8673
|tip Inside the building.
|tip Buy these items from the auction house.
|tip You will turn them in for a lot of experience.
|tip If you have any in your bank, get them out before you buy more.
|tip If you can't get them, it's okay, but you may have to grind a bit later to make up for it.
collect 60 Wool Cloth##2592		|goto Orgrimmar 55.90,62.71		|q 7833 |future
collect 60 Silk Cloth##4306		|goto Orgrimmar 55.90,62.71		|q 7834 |future
collect 60 Mageweave Cloth##4338	|goto Orgrimmar 55.90,62.71		|q 7835 |future
collect 60 Runecloth##14047		|goto Orgrimmar 55.90,62.71		|q 7836 |future
|only if not selfmade
step
Enter the building |goto Orgrimmar 38.74,83.32 < 10 |walk
talk Vehena##14727
|tip Inside the building.
accept A Donation of Wool##7833 |goto Orgrimmar 37.70,87.90 |instant
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Silk##7834 |goto Orgrimmar 37.70,87.90 |instant
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Mageweave##7835 |goto Orgrimmar 37.70,87.90 |instant
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Runecloth##7836 |goto Orgrimmar 37.70,87.90 |instant
step
talk Cenarion Emissary Blackhoof##15188
accept Taking Back Silithus##8276 |goto Orgrimmar 47.64,65.77
step
talk Xao'tsu##10088
Train your pet spells. |trainer Xao'tsu##10088 |goto Orgrimmar/0 66.34,14.83 |q 1124
|only if Hunter
step
talk Ormak Grimshot##3352 |only if Hunter
talk Grezz Ragefist##3353 |only if Warrior
talk Kardris Dreamseeker##3344 |only if Shaman
talk Ormok##3328 |only if Rogue
talk Mirket##3325 |only if Warlock
talk Enyo##5883 |only if Mage
talk Ur'kyo##6018 |only if Priest
Train your spells. |trainer Ormak Grimshot##3352 |goto Orgrimmar/0 66.08,18.51 |only if Hunter |q 1124
Train your spells. |trainer	Grezz Ragefist##3353 |goto Orgrimmar/0 79.76,31.42 |only if Warrior |q 1124
Train your spells. |trainer	Kardris Dreamseeker##3344 |goto Orgrimmar/0 38.81,36.47 |only if Shaman |q 1124
Train your spells. |trainer	Ormok##3328 |goto Orgrimmar/0 43.91,54.60 |only if Rogue |q 1124
Train your spells. |trainer	Mirket##3325 |goto Orgrimmar/0 48.61,46.97 |only if Warlock |q 1124
Train your spells. |trainer	Enyo##5883 |goto Orgrimmar/0 38.75,85.68 |only if Mage |q 1124
Train your spells. |trainer	Ur'kyo##6018 |goto Orgrimmar/0 35.60,87.82 |only if Priest |q 1124
|tip Inside the building. |only if Warrior or Mage or Priest
step
talk Rekkul##3334
|tip Inside the tent, inside the Cleft of Shadow.
|tip Stock up on poisons.
|tip Open your poison crafting window and purchase the ingredients you need.
Visit the Vendor |vendor Rekkul##3334 |goto Orgrimmar 42.11,49.48 |q 1124
|only if Rogue
step
talk Auctioneer Stampi##8674
|tip Buy these items from the Auction House.
|tip They will give you a lot of free exp and save you doing a dangerous quest, but may be pricey.
|tip Once you purchase these items, don't go to the mailbox and manually skip this step. There is another auction house step.
collect 20 Encrypted Twilight Text##2592 |goto Thunder Bluff/0 40.43,51.77 |q 8318 |future
|only if not selfmade
step
talk Auctioneer Stampi##8674
|tip Buy these items from the auction house.
|tip You will turn them in for a lot of experience.
|tip If you have any in your bank, get them out before you buy more.
|tip If you can't get them, it's okay, but you may have to grind a bit later to make up for it.
collect 60 Wool Cloth##2592		|goto Thunder Bluff 40.41,51.77		|q 7820 |future
collect 60 Silk Cloth##4306		|goto Thunder Bluff 40.41,51.77		|q 7821 |future
collect 60 Mageweave Cloth##4338	|goto Thunder Bluff 40.41,51.77		|q 7822 |future
collect 60 Runecloth##14047		|goto Thunder Bluff 40.41,51.77		|q 7823 |future
|only if not selfmade
step
Enter the building |goto Thunder Bluff 43.72,42.46 < 10 |walk
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Wool##7820 |goto Thunder Bluff 43.05,42.72 |instant
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Silk##7821 |goto Thunder Bluff 43.05,42.72 |instant
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Mageweave##7822 |goto Thunder Bluff 43.05,42.72 |instant
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Runecloth##7823 |goto Thunder Bluff 43.05,42.72 |instant
step
Enter the building |goto Thunder Bluff 74.19,29.89 < 10 |walk
talk Nara Wildmane##5770
|tip Inside the building.
turnin Glyphed Oaken Branch##4987 |goto Thunder Bluff 75.65,31.61
turnin Guarding Secrets##4883 |goto Thunder Bluff 75.65,31.61
step
use the Umi's Mechanical Yeti##12928
|tip Use it on Sprinkle.
Scare Sprinkle |q 5163/2 |goto Tanaris 51.06,26.87
step
use Eridan's Supplies##11617
collect Irontree Heart##11173 |q 4005
collect 11 Silvery Claws##11172 |q 4005
collect Book of Aquor##11169 |q 4005
step
Enter the tunnel |goto Tanaris 68.62,41.46 < 15 |only if walking
Follow the path |goto Tanaris 73.19,45.54 < 20 |only if walking
Continue following the path |goto Tanaris 72.22,48.95 < 30 |only if walking
use the Book of Aquor##11169
Watch the dialogue
|tip Aquementas will appear and approach from the east and attack you.
kill Aquementas##9453
collect Silver Totem of Aquementas##11522 |q 4005/1 |goto Tanaris 70.42,49.90
step
Enter the cave |goto Un'Goro Crater 43.44,6.77 < 15 |walk
talk J.D. Collie##9117
|tip Inside the cave.
turnin Aquementas##4005 |goto Un'Goro Crater 41.92,2.70
accept Linken's Adventure##3961 |goto Un'Goro Crater 41.92,2.70
step
_Destroy These Items:_
|tip They are no longer needed.
trash Irontree Heart##11173 |goto Un'Goro Crater 43.44,6.77
trash 11 Silvery Claws##11172 |goto Un'Goro Crater 43.44,6.77
trash Book of Aquor##11169 |goto Un'Goro Crater 43.44,6.77
step
Leave the cave |goto Un'Goro Crater 43.44,6.77 < 15 |walk |only if subzone("Marshal's Refuge") and _G.IsIndoors()
talk Linken##8737
turnin Linken's Adventure##3961 |goto Un'Goro Crater 44.66,8.10
step
use the Umi's Mechanical Yeti##12928
|tip Use it on Quixxil.
Scare Quixxil |q 5163/3 |goto Un'Goro Crater 43.67,9.38
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Silithus (59-60)',
  {
    image = ZGV.IMAGESDIR .. 'Silithus',
    condition_suggested = function()
      return level >= 59 and level <= 60 and not completedq(1185)
    end,
    hardcore = true,
  },
  [[
step
talk Layo Starstrike##13220
|tip Inside the building.
turnin Wasteland##1124 |goto Silithus 81.87,18.93
accept The Spirits of Southwind##1125 |goto Silithus 81.87,18.93
step
talk Windcaller Proudhorn##15191
turnin Taking Back Silithus##8276 |goto Silithus 51.15,38.29
accept Securing the Supply Lines##8280 |goto Silithus 51.15,38.29
step
talk Beetix Ficklespragg##15189
|tip She walks around this area upstairs inside the building.
accept Deadly Desert Venom##8277 |goto Silithus 51.71,38.58
step
talk Geologist Larksbane##15183
accept The Twilight Mystery##8284 |goto Silithus 49.67,37.46
step
talk Bor Wildmane##15306
accept Secret Communication##8318 |goto Silithus 48.57,37.78
step
talk Runk Windtamer##15178
fpath Cenarion Hold |goto Silithus 48.68,36.68
step
Enter the building |goto Silithus 49.60,36.02 < 10 |only if walking
talk Commander Mar'alith##15181
|tip Outside, on the balcony of the building.
accept Dearest Natalia##8304 |goto Silithus 49.19,34.18
step
Enter the building |goto Silithus 63.45,54.09 < 10 |walk
click Dusty Reliquary##179565
|tip Inside the building.
|tip The 'Tortured' enemies around here will summon Hive'Ashi Drones on death.	|only if hardcore
|tip Watch for respawns while in the area.				|only if hardcore
collect Reliquary of Purity##22201 |q 5527/1 |goto Silithus 63.23,55.35
stickystart "Kill_Tortured_Druids"
stickystart "Kill_Tortured_Sentinels"
step
label "Kill_Tortured_Druids"
kill 8 Tortured Druid##12178 |q 1125/1 |goto Silithus 62.96,53.11
|tip The 'Tortured' enemies around here will summon Hive'Ashi Drones on death.	|only if hardcore |notinsticky
|tip You can find more inside the buildings around this area.
step
label "Kill_Tortured_Sentinels"
kill 8 Tortured Sentinel##12179 |q 1125/2 |goto Silithus 62.96,53.11
|tip You can find more inside the buildings around this area.
|tip The 'Tortured' enemies around here will summon Hive'Ashi Drones on death.	|only if hardcore |notinsticky
step
Incoming Difficult Quest
|tip The next quest has you traveling back to the area full of Tortured enemies.
|tip Interacting with the Hive'Ashi Pod will spawn 3 Ambushers which may be very difficult to handle solo.
|tip The quest is optional, but you will need to grind an extra, 16,550 xp to make up for skipping it.
|tip You will likely want to skip this quest if you cannot find help.
Click Here to Continue |confirm |q 1126 |future
|only if not hardcore
stickystart "Collect_Stonelash_Scorpid_Stingers"
stickystart "Collect_Sand_Skitterer_Fangs"
stickystart "Kill_Dredge_Strikers"
step
talk Layo Starstrike##13220
|tip Inside the building.
turnin The Spirits of Southwind##1125 |goto Silithus 81.87,18.93
accept Hive in the Tower##1126 |goto Silithus 81.87,18.93 |only if not hardcore
step
Enter the building |goto Silithus 60.45,52.83 < 10 |walk
|tip Three silithid will ambush you when you enter the tower.
click Hive'Ashi Pod##178553
|tip Remember, 3 Hive'Ashi Ambushers will spawn upon interacting with this object.	|only if hardcore
|tip They will keep spawning until you loot the item and retreat.			|only if hardcore
|tip Skip this quest if you can't find help.						|only if hardcore
|tip At the top of the tower.
kill Hive'Ashi Ambusher##13301+
collect Encrusted Silithid Object##17346 |q 1126/1 |goto Silithus 60.35,52.55
|only if haveq(1126)
stickystop "Collect_Stonelash_Scorpid_Stingers"
stickystop "Collect_Sand_Skitterer_Fangs"
stickystop "Kill_Dredge_Strikers"
step
Kill Hive'Ashi enemies around this area
|tip You may need help with this.
collect Brann Bronzebeard's Lost Letter##20461 |goto Silithus 55.97,49.86 |q 8308 |future
|tip This has a low drop rate.
You can find more around: |notinsticky
[52.57,52.85]
[48.18,44.34]
|only if not hardcore
step
use Brann Bronzebeard's Lost Letter##20461
accept Brann Bronzebeard's Lost Letter##8308
|only if not hardcore
stickystart "Collect_Stonelash_Scorpid_Stingers"
stickystart "Collect_Sand_Skitterer_Fangs"
stickystart "Kill_Dredge_Strikers"
step
talk Layo Starstrike##13220
|tip Inside the building.
turnin Hive in the Tower##1126 |goto Silithus 81.87,18.93
accept Umber, Archivist##6844 |goto Silithus 81.87,18.93
step
Run around the mountain |goto Silithus 69.55,30.94 < 70 |only if walking
Kill Twilight enemies around this area
|tip Watch for respawns around this area.	|only if hardcore
|tip It's easy to get overwhelmed by adds here.	|only if hardcore
collect 10 Encrypted Twilight Text##20404 |q 8318/1 |goto Silithus 66.89,19.00
You can find more inside the cave at [68.88,15.22]
step
label "Collect_Stonelash_Scorpid_Stingers"
kill Stonelash Scorpid##11735+
|tip They look like scorpions.
collect 8 Stonelash Scorpid Stinger##20373 |q 8277/1 |goto Silithus 60.63,17.19
You can find more around: |notinsticky
[51.92,17.95]
[52.50,30.60]
[68.54,32.78]
[59.11,23.46]
step
label "Collect_Sand_Skitterer_Fangs"
kill Sand Skitterer##11738+
|tip They look like spiders.
collect 8 Sand Skitterer Fang##20376 |q 8277/2 |goto Silithus 60.63,17.19
You can find more around: |notinsticky
[51.92,17.95]
[52.50,30.60]
[68.54,32.78]
[59.11,23.46]
step
label "Kill_Dredge_Strikers"
kill 15 Dredge Striker##11740 |q 8280/1 |goto Silithus 60.63,17.19
You can find more around: |notinsticky
[51.92,17.95]
[52.50,30.60]
[68.54,32.78]
[59.11,23.46]
step
talk Windcaller Proudhorn##15191
turnin Securing the Supply Lines##8280 |goto Silithus 51.15,38.29
accept Stepping Up Security##8281 |goto Silithus 51.15,38.29
step
talk Beetix Ficklespragg##15189
|tip She walks around this area upstairs inside the building.
turnin Deadly Desert Venom##8277 |goto Silithus 51.71,38.58
accept Noggle's Last Hope##8278 |goto Silithus 51.71,38.58
step
talk Bor Wildmane##15306
turnin Secret Communication##8318 |goto Silithus 48.58,37.78
step
click Twilight Tablet Fragment##180501+
|tip They look like small blue-glowing broken pieces of stone tablets on the ground around this area.
collect 8 Twilight Tablet Fragment##20378 |q 8284/1 |goto Silithus 24.33,11.94
step
Kill Twilight enemies around this area
|tip Watch for patrols and respawns while in the area.	|only if hardcore
|tip Enemies tend to be close together.			|only if hardcore
collect 10 Encrypted Twilight Text##20404 |goto Silithus 27.34,33.46 |q 8323 |future
stickystart "Collect_Stonelash_Pincer_Stingers"
step
kill 20 Dredge Crusher##11741 |q 8281/1 |goto Silithus 27.26,43.55
You can find more around: |notinsticky
[36.54,50.40]
[37.93,60.76]
[47.11,59.42]
[57.55,60.78]
step
label "Collect_Stonelash_Pincer_Stingers"
kill Stonelash Pincer##11736+
collect 3 Stonelash Pincer Stinger##20374 |q 8278/2 |goto Silithus 27.26,43.55
You can find more around: |notinsticky
[36.54,50.40]
[37.93,60.76]
[47.11,59.42]
[57.55,60.78]
stickystart "Collect_Stonelash_Flayer_Stingers"
stickystart "Collect_Rock_Stalker_Fangs"
step
talk Rutgar Glyphshaper##15170
turnin Brann Bronzebeard's Lost Letter##8308 |goto Silithus 41.28,88.45
|only if not hardcore
step
talk Rutgar Glyphshaper##15170
Select _"Hello, Rutgar. The Commander has sent me here to gather some information about his missing wife."_
Question Rutgar |q 8304/2 |goto Silithus 41.28,88.45
step
talk Frankal Stonebridge##15171
Select _"Hello, Frankal. I've heard that you might have some information as to the whereabouts of Mistress Natalia Mar'alith."_
Question Frankal |q 8304/1 |goto Silithus 40.82,88.85
step
label "Collect_Stonelash_Flayer_Stingers"
kill Stonelash Flayer##11737+
collect 3 Stonelash Flayer Stinger##20375 |q 8278/1 |goto Silithus 45.44,86.38
You can find more around: |notinsticky
[45.15,82.20]
[36.97,86.68]
[28.44,80.89]
[35.23,71.64]
step
label "Collect_Rock_Stalker_Fangs"
kill Rock Stalker##11739+
collect 3 Rock Stalker Fang##20377 |q 8278/3 |goto Silithus 45.44,86.38
You can find more around: |notinsticky
[45.15,82.20]
[36.97,86.68]
[28.44,80.89]
[35.23,71.64]
step
talk Windcaller Proudhorn##15191
turnin Stepping Up Security##8281 |goto Silithus 51.15,38.29
step
talk Beetix Ficklespragg##15189
|tip She walks around this area upstairs inside the building.
turnin Noggle's Last Hope##8278 |goto Silithus 51.71,38.58
step
talk Geologist Larksbane##15183
turnin The Twilight Mystery##8284 |goto Silithus 49.67,37.46
accept The Deserter##8285 |goto Silithus 49.67,37.46
step
Enter the building |goto Silithus 49.61,36.05 < 10 |only if walking
talk Commander Mar'alith##15181
|tip Outside, on the balcony of the building.
turnin Dearest Natalia##8304 |goto Silithus 49.19,34.18
step
Enter the cave |goto Silithus 66.32,70.03 < 15 |walk
talk Hermit Ortell##15194
|tip Inside the cave.
turnin The Deserter##8285 |goto Silithus 67.19,69.76
accept The Twilight Lexicon##8279 |goto Silithus 67.19,69.76
step
kill Twilight Keeper Havunth##11804
|tip He looks like an orc that walks around this area wearing a bright purple robe.
|tip You can wait around this spot to avoid going into the camp looking for him.
collect Twilight Lexicon - Chapter 3##20396 |q 8279/3 |goto Silithus 42.00,44.13
step
kill Twilight Keeper Mayna##15200
|tip She walks around this area.
collect Twilight Lexicon - Chapter 1##20394 |q 8279/1 |goto Silithus 26.46,36.45
step
kill Twilight Keeper Exeter##11803
collect Twilight Lexicon - Chapter 2##20395 |q 8279/2 |goto Silithus 16.09,86.37
step
Run around the bug area |goto Silithus 55.17,63.52 < 70 |only if walking
Enter the cave |goto Silithus 66.32,70.03 < 15 |walk
talk Hermit Ortell##15194
|tip Inside the cave.
turnin The Twilight Lexicon##8279 |goto Silithus 67.19,69.76
accept A Terrible Purpose##8287 |goto Silithus 67.19,69.76
accept True Believers##8323 |goto Silithus 67.19,69.76
step
talk Hermit Ortell##15194
|tip Inside the cave.
turnin True Believers##8323 |goto Silithus 67.19,69.76
step
Follow the path up into Cenarion Hold |goto Silithus 45.64,43.35 < 50 |only if walking and not subzone("Cenarion Hold")
Enter the building |goto Silithus 49.61,36.05 < 10 |only if walking
talk Commander Mar'alith##15181
|tip Outside, on the balcony of the building.
turnin A Terrible Purpose##8287 |goto Silithus 49.19,34.18
step
talk Umi Rumplesnicker##10305
turnin Are We There, Yeti?##5163 |goto Winterspring 60.88,37.62
step
Follow the road |goto Moonglade 40.73,35.75 < 70 |only if walking and not Druid
talk Umber##11939
|tip He walks around this area.
turnin Umber, Archivist##6844 |goto Moonglade 44.89,35.59
accept Uncovering Past Secrets##6845 |goto Moonglade 44.89,35.59
step
Enter the building |goto Moonglade 51.47,41.44 < 10 |walk
talk Rabine Saturna##11801
|tip Inside the building.
turnin A Reliquary of Purity##5527 |goto Moonglade 51.68,45.08
turnin Uncovering Past Secrets##6845 |goto Moonglade 51.68,45.08
step
talk Umber##11939
|tip He walks around this area.
accept Under the Chitin Was...##1185 |goto Moonglade 44.89,35.59 |instant
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Druid',
  {
    description = 'This guide will walk you through completing various Druid Class Quests.',
  },
  [[
step
ding 10
step
Enter the building |goto Mulgore 48.16,59.53 < 15 |walk
talk Gennia Runetotem##3064
|tip Inside the building.
accept Heeding the Call##5928 |goto Mulgore 48.48,59.64
|only if Tauren Druid
step
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Heeding the Call##5928 |goto Thunder Bluff 76.46,27.23
accept Moonglade##5922 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5922 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Follow the path |goto Moonglade 42.47,34.44 < 20 |only if walking
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5930/1 |goto Moonglade 39.11,27.51
|only if Tauren Druid
step
talk Faustron##12740
fpath Moonglade |goto Moonglade 32.11,66.60
|only if Tauren Druid
step
Follow the road |goto Moonglade 40.77,35.81 < 20 |only if walking
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5930 |goto Moonglade 56.21,30.64
accept Back to Thunder Bluff##5932 |goto Moonglade 56.21,30.64
|only if Tauren Druid
step
Locate Bunthen Plainswind |goto Moonglade 44.28,45.86 < 10 |c |q 5932
|only if Tauren Druid
step
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Back to Thunder Bluff##5932 |goto Thunder Bluff 76.46,27.23
accept Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
use the Cenarion Lunardust##15710
kill Lunaclaw##12138
|tip A spirit will appear after you kill her.
talk Lunaclaw Spirit##12144
Select _"You have fought well, spirit. I ask you to grant me the strength of your body and the strength of your heart."_
Face Lunaclaw and Earn the Strength of Body and Heart it Possesses |q 6002/1 |goto The Barrens 42.00,60.86
|only if Tauren Druid
step
Enter Mulgore |goto The Barrens 41.54,58.56 < 30 |only if walking
Cross the bridge |goto Mulgore 48.13,53.43 < 20 |only if walking
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 58.66,46.92 < 15 |walk
Cross the bridge |goto Thunder Bluff 61.44,40.20 < 10 |walk
Enter the building |goto Thunder Bluff 74.09,29.91 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Body and Heart##6002 |goto Thunder Bluff 76.46,27.23
|only if Tauren Druid
step
ding 14
step
talk Auctioneer Stampi##8674
collect 5 Earthroot##2449 |goto Thunder Bluff 40.40,51.77 |q 6128 |future
|tip Buy them from the Auction House.
|only if Druid and not selfmade
step
Enter the building |goto Thunder Bluff 74.17,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
accept Lessons Anew##6126 |goto Thunder Bluff 76.47,27.23
|only if Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Lessons Anew##6126 |goto Moonglade 56.21,30.64
accept The Principal Source##6127 |goto Moonglade 56.21,30.64
|only if Druid
step
Follow the path up |goto The Barrens 51.08,22.66 < 15 |only if walking
Follow the path |goto The Barrens 49.16,20.33 < 15 |only if walking
Follow the path up |goto The Barrens 48.00,19.56 < 10 |only if walking
use the Empty Dreadmist Peak Sampler##15842
|tip Use it while standing in the bubbling water at the top of the mountain.
collect Filled Dreadmist Peak Sampler##15843 |q 6127/1 |goto The Barrens 48.41,18.89
|only if Druid
step
Follow the path down |goto The Barrens 49.22,20.39 < 20 |only if walking
Follow the path |goto The Barrens 52.34,29.37 < 20 |only if walking
talk Tonga Runetotem##3448
turnin The Principal Source##6127 |goto The Barrens 52.26,31.93
accept Gathering the Cure##6128 |goto The Barrens 52.26,31.93
|only if Druid
step
Follow the path |goto The Barrens 50.09,40.90 < 30 |only if walking
kill Lost Barrens Kodo##3234+
collect 5 Kodo Horn##15852 |q 6128/2 |goto The Barrens 51.93,43.65
You can find more around: |notinsticky
[52.71,45.41]
[55.16,45.59]
[47.25,43.31]
[45.77,43.28]
[44.82,40.80]
|only if Druid
step
talk Tonga Runetotem##3448
turnin Gathering the Cure##6128 |goto The Barrens 52.26,31.93
accept Curing the Sick##6129 |goto The Barrens 52.26,31.93
|only if Druid
step
use the Curative Animal Salve##15826
'|talk Sickly Gazelle##12296+
|tip Use it on Sickly Gazelles around this area.
|tip They look like green gazelles all around the northern area of the Barrens.
Cure #10# Sickly Gazelles |q 6129/1 |goto The Barrens 50.17,31.12
You can find more around: |notinsticky
[48.77,29.54]
[48.33,26.15]
[48.84,23.88]
[49.99,23.09]
[51.79,20.51]
[53.44,20.86]
[54.29,21.65]
[54.98,21.95]
[53.52,26.92]
|only if Druid
step
Enter the building |goto Moonglade 56.13,30.98 < 15 |walk
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Curing the Sick##6129 |goto Moonglade 56.21,30.64
accept Power over Poison##6130 |goto Moonglade 56.21,30.64
|only if Druid
step
Enter the building |goto Thunder Bluff 74.17,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Power over Poison##6130 |goto Thunder Bluff 76.47,27.23
|only if Druid
step
ding 16
step
Follow the road |goto The Barrens 38.42,28.96 < 30 |only if walking
Continue following the road |goto The Barrens 43.46,30.63 < 30 |only if walking
Continue following the road |goto The Barrens 47.95,28.00 < 30 |only if walking
Follow the path |goto The Barrens 50.82,29.06 < 15 |only if walking
Enter the building |goto Thunder Bluff 74.15,29.89 < 7 |walk
talk Turak Runetotem##3033
|tip Inside the building.
accept A Lesson to Learn##27 |goto Thunder Bluff 76.47,27.22
|only if Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin A Lesson to Learn##27 |goto Moonglade 56.21,30.65
accept Trial of the Lake##28 |goto Moonglade 56.21,30.65
|only if Druid
step
click Bauble Container##177785
|tip It looks like a wicker vase on the ground underwater.
|tip They spawn randomly, so you may have to search around this area.
|tip Swim at the top of the water until you can see one. |only if hardcore
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Shrine Bauble##15877 |goto Moonglade 54.33,55.65 |q 28 |future
|only if Druid
step
use the Shrine Bauble##15877
Complete the Trial of the Lake |q 28/1 |goto Moonglade 35.92,41.38
|only if Druid
step
talk Tajarri##11799
turnin Trial of the Lake##28 |goto Moonglade 36.51,40.11
accept Trial of the Sea Lion##30 |goto Moonglade 36.51,40.11
|only if Druid
step
Leave the building |goto The Barrens 52.03,30.18 < 7 |walk
Follow the path |goto Orgrimmar 52.54,85.14 < 15 |only if walking
Enter Undercity |goto Tirisfal Glades 61.86,65.03 < 15 |only if walking
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if Druid
step
Leave Undercity |goto Undercity 66.19,0.63 < 10 |walk
Follow the road |goto Tirisfal Glades 56.17,65.88 < 30|only if walking
Continue following the road |goto Silverpine Forest 58.14,12.21 < 30 |only if walking
Follow the path |goto Silverpine Forest 51.56,22.48 < 30 |only if walking
Continue following the path |goto Silverpine Forest 44.15,28.90 < 30 |only if walking
click Strange Lockbox##177844
|tip Underwater.
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Half Pendant of Aquatic Endurance##15882 |goto Silverpine Forest 29.54,29.53 |q 30
|only if Druid
step
Follow the path |goto The Barrens 52.92,12.63 < 40 |only if walking
click Strange Lockbox##177794
|tip Underwater.
|tip Hover above the container before swimming directly down to it. |only if hardcore
|tip Don't linger underwater longer than is required and watch your breath meter. |only if hardcore
collect Half Pendant of Aquatic Agility##15883 |goto The Barrens 56.68,8.32 |q 30
|only if Druid
step
use the Half Pendant of Aquatic Agility##15883
collect Pendant of the Sea Lion##15885 |q 30/1 |goto Moonglade 35.92,41.42
|only if Druid
step
Follow the road |goto Moonglade 41.76,35.10 < 20 |only if walking
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Trial of the Sea Lion##30 |goto Moonglade 56.21,30.64
accept Aquatic Form##31 |goto Moonglade 56.21,30.64
|only if Druid
step
Enter the building |goto Thunder Bluff 74.15,29.89 < 15 |walk
talk Turak Runetotem##3033
|tip Inside the building.
turnin Aquatic Form##31 |goto Thunder Bluff 76.47,27.22
|only if Druid
step
ding 52
step
talk Turak Runetotem##3033
|tip Insidie the building.
accept Torwa Pathfinder##9063 |goto Thunder Bluff 76.60,27.60
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Torwa Pathfinder##9063 |goto Un'Goro Crater 71.63,75.96
accept Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
Kill Gorishi enemies around this area
|tip Gorishi Workers may call for help when at low health.	|only if hardcore
|tip Watch for patrols and respawns while in the cave.		|only if hardcore
collect 8 Gorishi Sting##22435 |q 9052/1 |goto Un'Goro Crater 50.40,78.60
|only if Druid
step
click Bloodpetal Sprout##164958
|tip They look like vines entwined in a ball.
|tip They are all over Un'Goro Crater.
collect 8 Bloodcap##22434 |q 9052/2 |goto Un'Goro Crater 71.90,57.40
You Can Find More Around [53.50,14.90]
[34.60,30.60]
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Bloodpetal Poison##9052 |goto Un'Goro Crater 71.63,75.96
accept Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
use the Devilsaur Barb##22432
|tip Use it on roaming Devilsaur around Un'Goro Crater.
Stab a Devilsaur with the Barb |q 9051/1 |goto Un'Goro Crater 67.31,33.89
|only if Druid
step
talk Torwa Pathfinder##9619
turnin Toxic Test##9051 |goto Un'Goro Crater 71.63,75.96
accept A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if Druid
step
Run up the stairs |goto Swamp of Sorrows 56.28,76.52 < 10 |only if walking
Enter the building |q 9053 |future |goto Swamp of Sorrows 56.33,76.26 < 10 |c
|only if Druid
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 9053 |future
|only if Druid
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Atal'alarion##8580
|tip Refer to the Temple of Atal'Hakkar Dungeon Guide to accomplish that.
collect Putrid Vine##22444 |q 9053/1
|only if Druid
step
talk Torwa Pathfinder##9619
turnin A Better Ingredient##9053 |goto Un'Goro Crater 71.63,75.96
|only if Druid
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Priest',
  {
    description = 'This guide will walk you through completing various Priest Class Quests.',
  },
  [[
step
ding 10
step
Enter the building |goto Durotar 53.24,42.59 < 10 |walk
talk Tai'jin##3706
|tip Inside the building.
accept Hex of Weakness##5652 |goto Durotar 54.26,42.93
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Hex of Weakness##5652 |goto Orgrimmar 35.59,87.83
|only if Troll Priest
step
talk Father Lankester##4607
accept Touch of Weakness##5658 |goto Undercity 49.14,14.61
|only if Scourge Priest
step
talk Aelthalyste##4606
turnin Touch of Weakness##5658 |goto Undercity 49.27,17.11
|only if Scourge Priest
step
ding 20
step
Enter the cave |goto Thunder Bluff 29.73,29.76
talk Miles Welsh##3044
|tip Inside the cave.
accept Shadowguard##5643 |goto Thunder Bluff 25.32,15.24
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Inside the building.
turnin Shadowguard##5643 |goto Orgrimmar 35.59,87.83
|only if Troll Priest
step
talk Ur'kyo##6018
|tip Upstairs inside the building.
accept Devouring Plague##5644 |goto Orgrimmar 35.59,87.83
|only if Scourge Priest
step
talk Aelthalyste##4606
turnin Devouring Plague##5644 |goto Undercity 49.27,17.11
|only if Scourge Priest
step
ding 52
step
talk Ur'kyo##6018
|tip Inside the building.
accept Cenarion Aid##8254 |goto Orgrimmar 35.60,87.60
|only if Priest
step
talk Ogtinc##8405
turnin Cenarion Aid##8254 |goto Azshara 42.40,42.60
accept Of Coursers We know##8255 |goto Azshara 42.40,42.60
|only if Priest
step
kill Mosshoof Courser##8761
|tip they are scattered all over the area.
collect 4 Healthy Courser Gland##20027 |q 8255/1 |goto Azshara 49.47,17.62
|only if Priest
step
talk Ogtinc##8405
turnin Of Coursers We know##8255 |goto Azshara 42.40,42.60
accept The Ichor of Undeath##8256 |goto Azshara 42.40,42.60
|only if Priest
step
Kill Highborne enemies around this area
collect Ichor of Undeath##7972 |q 8256/1 |goto Winterspring 52.59,40.68
|tip These have a low drop rate.
You can find more around: |notinsticky
[53.62,42.09]
[56.02,44.24]
|only if Priest
step
talk Ogtinc##8405
turnin The Ichor of Undeath##8256 |goto Azshara 42.40,42.60
accept Blood of Morphaz##8257 |goto Azshara 42.40,42.60
|only if Priest
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 9053 |future
|only if Priest
step
Inside the Temple of Atal'Hakkar Dungeon:
kill Morphaz##5719
collect Blood of Morphaz##20025 |q 8257/1
|only if Priest
step
talk Greta Mosshoof##10922
turnin Blood of Morphaz##8257 |goto Felwood 51.20,82.20
|only if Priest
step
ding 58
step
talk Movkar##16012
|tip Inside the building.
accept An Earnest Proposition##8916 |goto Orgrimmar 34.80,38.00
|only if Priest
step
Kill Frostsaber enemies around this area
collect 15 Winterspring Blood Sample##21928 |q 8916/1 |goto Winterspring/0 51.80,9.20
|only if Priest
step
collect Devout Bracers##16697 |q 8916/2
|tip These drop from enemies in Stratholme.
|tip Refer to either Stratholme dungeon guides to accomplish this.
|tip You can also buy them from the Auction House.|only if not selfmade
|only if Priest
step
Collect 20 Gold |complete _G.GetMoney() >= 2000 |q 8916/3
|only if Priest
step
talk Movkar##16012
|tip Inside the building.
turnin An Earnest Proposition##8916 |goto Orgrimmar 34.80,38.00
|only if Priest
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Warrior',
  {
    description = 'This guide will walk you through completing various Warrior Class Quests.',
  },
  [[
step
ding 10
step
talk Krang Stonehoof##3063
accept Veteran Uzzek##1505 |goto Mulgore 49.52,60.58
|only if Tauren Warrior
step
Enter the building |goto Durotar 53.25,42.59 < 7 |walk
talk Tarshaw Jaggedscar##3169
|tip Inside the building.
accept Veteran Uzzek##1505 |goto Durotar 54.19,42.46
|only if (Orc Warrior) or (Troll Warrior)
step
Leave the building |goto Durotar 53.27,42.59 < 7 |walk
Follow the road |goto Durotar 50.64,43.97 < 15 |only if walking
Cross the bridge |goto Durotar 34.60,42.31 < 15 |only if walking
talk Uzzek##5810
turnin Veteran Uzzek##1505 |goto The Barrens 61.38,21.11
accept Path of Defense##1498 |goto The Barrens 61.38,21.11
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Cross the bridge |goto The Barrens 62.68,19.22 < 15 |only if walking
Follow the path |goto Durotar 39.18,32.15 < 15 |only if walking
kill Thunder Lizard##3130+
|tip Watch for respawns while in the area. |only if hardcore
collect 5 Singed Scale##6486 |q 1498/1 |goto Durotar 39.27,28.29
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path |goto Durotar 39.16,32.31 < 15 |only if walking
Cross the bridge |goto Durotar 34.60,42.28 < 15 |only if walking
talk Uzzek##5810
turnin Path of Defense##1498 |goto The Barrens 61.38,21.11
accept Thun'grim Firegaze##1502 |goto The Barrens 61.38,21.11
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path up |goto The Barrens 55.51,32.40
talk Thun'grim Firegaze##5878
turnin Thun'grim Firegaze##1502 |goto The Barrens 57.23,30.34
accept Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path down |goto The Barrens 55.51,32.40
click Stolen Iron Chest##58369
collect Forged Steel Bars##6534 |q 1503/1 |goto The Barrens 55.05,26.66
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
Follow the path up |goto The Barrens 55.51,32.40
talk Thun'grim Firegaze##5878
turnin Forged Steel##1503 |goto The Barrens 57.23,30.34
|only if (Orc Warrior) or (Troll Warrior) or (Tauren Warrior)
step
talk Austil de Mon##2131
|tip Inside the building.
accept Speak with Dillinger##1818 |goto Tirisfal Glades 61.85,52.54
|only if Scourge Warrior
step
Leave the building |goto Tirisfal Glades 61.56,53.05 < 7 |walk
talk Deathguard Dillinger##1496
turnin Speak with Dillinger##1818 |goto Tirisfal Glades 58.20,51.45
accept Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
click Doors
kill Ulag the Cleaver##6390 |q 1819/1 |goto Tirisfal Glades 59.64,48.09
|only if Scourge Warrior
step
talk Deathguard Dillinger##1496
turnin Ulag the Cleaver##1819 |goto Tirisfal Glades 58.20,51.45
accept Speak with Coleman##1820 |goto Tirisfal Glades 58.20,51.45
|only if Scourge Warrior
step
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Speak with Coleman##1820 |goto Tirisfal Glades 61.72,52.29
accept Agamand Heirlooms##1821 |goto Tirisfal Glades 61.72,52.29
|only if Scourge Warrior
step
Follow the path up |goto Tirisfal Glades 47.86,47.45 < 20 |only if walking
Enter the crypt |q 1821 |goto Tirisfal Glades 52.25,26.86 < 10 |c |walk
|only if Scourge Warrior
step
click Agamand Weapon Rack##105172
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Mace##7569 |q 1821/3 |goto Tirisfal Glades 52.66,27.04
|only if Scourge Warrior
step
click Agamand Weapon Rack##105171
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Dagger##7568 |q 1821/2 |goto Tirisfal Glades 51.89,27.12
|only if Scourge Warrior
step
click Agamand Weapon Rack##105169
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Axe##7567 |q 1821/1 |goto Tirisfal Glades 51.70,25.69
|only if Scourge Warrior
step
click Agamand Weapon Rack##105170
|tip Inside the crypt.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Agamand Family Sword##7566 |q 1821/1 |goto Tirisfal Glades 52.65,25.86
|only if Scourge Warrior
step
Leave the crypt |q 1821 |goto Tirisfal Glades 52.25,26.86 < 10 |walk
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Coleman Farthing##1500
|tip Inside the building.
turnin Agamand Heirlooms##1821 |goto Tirisfal Glades 61.72,52.29
|only if Scourge Warrior
step
ding 30
step
Incoming Difficult Quest
|tip You're going to be tasked with surviving the Affray, which is a combat trial.
|tip You'll be tasked with killing waves of enemies with very little downtime afforded in between.
|tip If possible, you may want to get help for this.
Click Here to Continue |confirm |q 1718 |future
|only if Warrior and hardcore
step
Enter the building |goto Orgrimmar 76.52,32.92 < 7 |walk
talk Sorek##3354
|tip Inside the building.
accept The Islander##1718 |goto Orgrimmar 80.38,32.38
|only if Warrior
step
talk Klannoc Macleod##6236
turnin The Islander##1718 |goto The Barrens 68.62,49.17
accept The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
Step on the Grate to Begin the Affray |q 1719/1 |goto The Barrens 68.61,48.72
|only if Warrior
step
kill Affray Challenger##6240+
|tip You will have to kill six of them before Big Will will appear.
|tip They will fight them one at a time.
|tip Avoid using AoE abilities as they may aggro the other affray contestants. |only if hardcore
|tip When you defeat an enemy, don't stand near the grate or it will force the next opponent. |only if hardcore
|tip Eat or Bandage after each opponent. |only if hardcore
|tip Step back after each opponent spawns. |only if hardcore
kill Big Will##6238 |q 1719/2 |goto The Barrens 68.61,48.72
|tip It may take a while before he appears.
|only if Warrior
step
talk Klannoc Macleod##6236
turnin The Affray##1719 |goto The Barrens 68.62,49.17
|only if Warrior
step
ding 38
step
collect 8 Liferoot##3357 |q 1712 |future
|tip If you have the Herbalism profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warrior
step
talk Klannoc Macleod##6236
accept The Windwatcher##1791 |goto The Barrens 68.62,49.17
|only if Warrior
step
Follow the path |goto Hillsbrad Foothills 70.63,10.06
talk Bath'rah the Windwatcher##6176
turnin The Windwatcher##1791 |goto Alterac Mountains 80.50,66.92
accept Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
kill Burning Exile##2760
collect 8 Burning Charm##4479 |q 1712 |future |goto Arathi Highlands 26.60,31.80
|only if Warrior
step
kill Thundering Exile##2762
collect 8 Thundering Charm##4480 |q 1712 |future |goto Arathi Highlands 52.60,52.20
|only if Warrior
step
kill Cresting Exile##2761
collect 8 Cresting Charm##4481 |q 1712 |future |goto Arathi Highlands 68.00,30.00
|only if Warrior
step
Kill Bloodscalp enemies around this area
collect 30 Bloodscalp Tusk##3901 |q 1712/2 |goto Stranglethorn Vale 25.85,11.25
|only if Warrior
step
click Bath'rah's Cauldron##89931
accept Essence of the Exile##1714 |goto Alterac Mountains 79.31,66.81
collect Essence of the Exile##6851 |q 1712/3 |goto Alterac Mountains 79.31,66.81
|only if Warrior
step
Incoming Difficult Quest
|tip "The Summoning" quest coming up after Cyclonian has you facing a level 40 elite enemy.
|tip You will likely need help with this.
Click Here to Continue |confirm |q 1713 |future
|only if Warrior and hardcore
step
talk Bath'rah the Windwatcher##6176
turnin Cyclonian##1712 |goto Alterac Mountains 80.50,66.92
accept The Summoning##1713 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
Follow Bath'rah the Windwatcher
Watch the Dialogue
kill Cyclonian##6239
|tip You may need help with this.
|tip This is a level 40 Elite enemy. |only if hardcore
collect Whirlwind Heart##6894 |q 1713/1 |goto Alterac Mountains 80.57,62.56
|only if Warrior
step
talk Bath'rah the Windwatcher##6176
turnin The Summoning##1713 |goto Alterac Mountains 80.50,66.92
accept Whirlwind Weapon##1792 |goto Alterac Mountains 80.50,66.92
|only if Warrior
step
ding 52
step
Enter the building |goto Orgrimmar 76.52,32.92 < 7 |walk
talk Sorek##3354
|tip Inside the building.
accept A Troubled Spirit##8417 |goto Orgrimmar 80.38,32.38
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin A Troubled Spirit##8417 |goto Swamp of Sorrows 34.29,66.15
accept Warrior Kinship##8423 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
step
kill 7 Helboar##5993 |q 8423/1 |goto Blasted Lands 51.34,53.45
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin Warrior Kinship##8423 |goto Swamp of Sorrows 34.29,66.15
accept War on the Shadowsworn##8424 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
stickystart "Kill_Shadowsworn_Cultitst"
stickystart "Kill_Shadowsworn_Thug"
step
kill 20	Shadowsworn Adept##6006 |q 8424/1 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore
|only if Warrior
step
label "Kill_Shadowsworn_Cultitst"
kill 10 Shadowsworn Cultist##6004 |q 8424/2 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore |notinsticky
|only if Warrior
step
label "Kill_Shadowsworn_Thug"
kill 20 Shadowsworn Thug##6005 |q 8424/3 |goto Blasted Lands 65.17,32.83
|tip Watch for patrols and respawns around this area. |only if hardcore |notinsticky
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin War on the Shadowsworn##8424 |goto Swamp of Sorrows 34.29,66.15
accept Voodoo Feathers##8425 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Warrior and hardcore
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8425 |future
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8425/1
|tip These come from Gasher and Zul'Lor.
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8425/2
|tip These come from Mijan and Hukku.
|only if Warrior
step
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8425/3
|tip These come from Zolo and Loro.
|only if Warrior
step
talk Fallen Hero of the Horde##7572
turnin Voodoo Feathers##8425 |goto Swamp of Sorrows 34.29,66.15
|only if Warrior
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Hunter',
  {
    description = 'This guide will walk you through completing various Hunter Class Quests.',
  },
  [[
step
ding 10
step
talk Thotar##3171
|tip Inside the building.
accept Taming the Beast##6062 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
use the Taming Rod##15917
|tip Use it on a Dire Mottled Boar around this area.
Tame a Dire Mottled Boar |q 6062/1 |goto Durotar 51.84,47.23
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6062 |goto Durotar 51.85,43.49
accept Taming the Beast##6083 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
Follow the path |goto Durotar 54.36,39.59 < 20 |only if walking
use the Taming Rod##15919
|tip Use it on a Surf Crawler around this area.
Tame a Surf Crawler |q 6083/1 |goto Durotar 59.01,27.64
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6083 |goto Durotar 51.85,43.49
accept Taming the Beast##6082 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
use the Taming Rod##15920
|tip Use it on an Armored Scorpid around this area.
Tame an Armored Scorpid |q 6082/1 |goto Durotar 45.21,45.77
|only if (Orc Hunter) or (Troll Hunter)
step
talk Thotar##3171
|tip Inside the building.
turnin Taming the Beast##6082 |goto Durotar 51.85,43.49
accept Training the Beast##6081 |goto Durotar 51.85,43.49
|only if (Orc Hunter) or (Troll Hunter)
step
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path up |goto Orgrimmar 71.64,25.95 < 15 |only if walking
Follow the path up |goto Orgrimmar 67.68,14.51 < 7 |only if walking
talk Ormak Grimshot##3352
turnin Training the Beast##6081 |goto Orgrimmar 66.05,18.54
|only if (Orc Hunter) or (Troll Hunter)
step
talk Yaw Sharpmane##3065
accept Taming the Beast##6061 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15914
|tip Use it on an Adult Plainstrider around this area.
Tame an Adult Plainstrider |q 6061/1 |goto Mulgore 43.81,51.82
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
You can find more around [40.11,57.35]
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6061 |goto Mulgore 47.82,55.69
accept Taming the Beast##6087 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15915
|tip Use it on a Prairie Stalker around this area.
Tame a Prairie Stalker |q 6087/1 |goto Mulgore 46.48,49.06
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast##6087 |goto Mulgore 47.82,55.69
accept Taming the Beast##6088 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
use the Taming Rod##15916
|tip Use it on a Swoop around this area.
Tame a Swoop |q 6088/1 |goto Mulgore 46.48,49.06
|only if Tauren Hunter
step
talk Yaw Sharpmane##3065
turnin Taming the Beast#6088 |goto Mulgore 47.82,55.69
accept Training the Beast##6089 |goto Mulgore 47.82,55.69
|only if Tauren Hunter
step
Ride the elevator up |goto Thunder Bluff 31.80,65.96 < 10 |only if walking
Enter the building |goto Thunder Bluff 44.91,61.98 < 15 |only if walking
Cross the bridge |goto Thunder Bluff 47.69,68.75 < 10 |only if walking
Enter the building |goto Thunder Bluff 59.80,82.89 < 15 |walk
talk Holt Thunderhorn##3039
|tip Inside the building.
turnin Training the Beast##6089 |goto Thunder Bluff 57.31,89.76
|only if Tauren Hunter
step
ding 50
|only if not hardcore
step
ding 52
|only if hardcore
step
Follow the path up |goto Orgrimmar 66.46,22.63 < 10 |only if walking
talk Ormak Grimshot##3352
accept The Hunter's Charm##8151 |goto Orgrimmar 66.06,18.54
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin The Hunter's Charm##8151 |goto Azshara 42.40,42.62
accept Courser Antlers##8153 |goto Azshara 42.40,42.62
|only if Hunter
step
kill Mosshoof Courser##8761
|tip they are scattered all over the area.
collect 2 Perfect Courser Antler##20017 |q 8153/1 |goto Azshara 49.47,17.62
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin Courser Antlers##8153 |goto Azshara 42.40,42.62
accept Wavethrashing##8231 |goto Azshara 42.40,42.62
|only if Hunter
step
Jump down here carefully |goto Azshara 33.68,48.68 < 10 |only if walking
Follow the path down |goto Azshara 40.54,47.84 < 15 |only if walking
Kill Wavethrasher enemies around this area
|tip They are underwater around this area.
collect 6 Wavethrasher Scale##20087 |q 8231/1 |goto Azshara 52.61,41.87
You can find more around here [59.77,37.36]
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin Wavethrashing##8231 |goto Azshara 42.40,42.62
accept The Green Drake##8232 |goto Azshara 42.40,42.62
|only if Hunter
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Hunter and hardcore
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8232 |future
|only if Hunter
step
Inside the Temple of Atal'Hakkar:
kill Morphaz##5719
collect Tooth of Morphaz##20019 |q 8232/1
|only if Hunter
step
Follow the path up |goto Azshara 42.09,42.45
talk Ogtinc##8405
turnin The Green Drake##8232 |goto Azshara 42.40,42.62
|only if Hunter
step
ding 60
step
Incoming Raid Steps
|tip The upcoming quest steps will send you into the Molten Core and Onyxia's Lair raids.
|tip You will need a group to complete them.
Click Here to Continue |confirm |q 7635 |future
|only if Hunter
step
Inside the Molten Core Raid:
kill Majordomo Executus##12018
collect Ancient Petrified Leaf##18703 |n
use the Ancient Petrified Leaf##18703
accept The Ancient Leaf##7632
|only if Hunter
step
talk Vartus the Ancient##14524
|tip Kill enemies around the area for him to appear.
turnin The Ancient Leaf##7632 |goto Felwood 48.99,24.44
accept An Introduction##7633 |goto Felwood 48.99,24.44
accept Stave of the Ancients##7636 |goto Felwood 48.99,24.44
|only if Hunter
step
talk Stoma the Ancient##14525
|tip Kill enemies around the area for him to appear.
accept A Proper String##7635 |goto Felwood 48.31,24.43
|only if Hunter
step
label "Simone_the_Inconspicuous_1"
map Un'Goro Crater
path loop off; dist 20
path	40.60,79.81	39.66,80.76	40.56,83.56	44.20,84.60	44.70,84.97
path	47.33,83.43	48.29,83.07	49.48,82.62	52.88,82.85	54.39,80.58
path	53.25,76.57	52.94,71.85	52.49,70.68	50.94,68.32	48.26,68.82
path	46.33,66.62	45.54,65.95	44.59,63.45	41.43,62.58	41.03,62.86
path	39.76,60.14	40.27,55.85	39.31,48.70	38.48,45.86	38.04,41.96
path	36.18,39.79	35.09,38.14	33.26,37.56	31.74,42.57	31.26,43.64
path	31.58,44.98
Follow the path
talk Simone the Inconspicuous##14527
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip She patrols all around Un'Goro Crater.
Select _"Show me your real face, demon."_
kill Simone the Inconspicuous##14527
|tip This must be done alone or it will despawn.
collect Simone's Head##18952 |q 7636/1 |next "Klinfran_the_Crazed_1" |or
'|goto Un'Goro Crater 31.58,44.98 < 20 |noway |or |c |next "Simone_the_Inconspicuous_2"
|only if Hunter
step
label "Simone_the_Inconspicuous_2"
map Un'Goro Crater
path loop off; dist 20
path	34.12,41.24	35.41,41.78	36.58,44.59	37.39,46.16	37.11,50.89
path	38.49,51.80	39.14,53.13	38.36,56.24	38.06,60.14	38.74,65.34
path	39.38,67.27	39.65,69.63	40.89,73.47	41.67,73.78	42.23,75.22
path	42.32,77.27	41.33,78.48	40.66,79.79
Follow the path
talk Simone the Inconspicuous##14527
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip She patrols all around Un'Goro Crater.
Select _"Show me your real face, demon."_
kill Simone the Inconspicuous##14527
|tip This must be done alone or it will despawn.
collect Simone's Head##18952 |q 7636/1 |next "Klinfran_the_Crazed_1" |or
'|goto Un'Goro Crater 40.66,79.79 < 20 |noway |or |c |next "Simone_the_Inconspicuous_1"
|only if Hunter
step
label "Klinfran_the_Crazed_1"
map Burning Steppes
path dist 25
path	30.95,53.11	28.61,51.69	26.37,50.79	24.46,49.56	22.35,49.13
path	19.24,49.41	17.32,53.62	17.55,57.76	19.13,59.29	21.32,59.59
path	24.15,62.26	25.60,62.31	25.54,64.65	27.14,62.05	28.46,59.49
path	28.81,56.98	30.04,55.63	29.20,51.92
Follow the path
talk Franklin the Friendly##14529
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He patrols around Burning Steppes.
Select _"Show me your real face, demon."_
kill Klinfran the Crazed##14534
|tip This must be done alone or it will despawn.
collect Klinfran's Head##18953 |q 7636/2
|only if Hunter
step
map Silithus
path dist 20
path	27.18,84.28	25.70,86.85	25.51,88.41	22.00,86.39	21.41,83.81
path	21.45,81.74	23.00,79.45	24.79,76.13	26.93,75.99	28.43,76.18
path	28.98,80.30	29.15,81.69	26.81,84.80
Follow the path
talk Nelson the Nice##14536
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He walks around the area.
Select _"Show me your real face, demon."_
kill Solenor the Slayer##14530
|tip This must be done alone or it will despawn.
collect Solenor's Head##18954 |q 7636/3 |goto Silithus 26.00,81.20
|only if Hunter
step
map Winterspring
path dist 17
path	57.82,21.11	58.43,21.89	58.74,22.81	59.05,23.60	59.71,24.17
path	60.19,23.60	60.38,22.81	60.15,21.85	60.63,21.54	60.84,21.21
path	60.33,20.38	59.94,19.05	59.71,17.37	60.14,16.22	60.62,15.32
path	60.87,14.53	60.51,13.36	59.83,12.09	59.33,12.32	58.73,12.74
path	58.15,13.34	57.93,14.47	58.11,15.96	58.50,17.78	58.22,19.31
path	57.98,20.53
Follow the path
talk Artorius the Amiable##14531
|tip Use the "Track Demons" ability from the Survival Branch to accomplish this.
|tip He walks around the area.
Select _"Show me your real face, demon."_
kill Artorius the Doombringer##14535
|tip This must be done alone or it will despawn and be on a 3 hour timer.
collect Artorius's Head##18955 |q 7636/4 |goto Winterspring 58.20,15.60
|only if Hunter
step
Inside the Onyxia's Lair Raid:
kill Onyxia##10184
collect Mature Black Dragon Sinew##18705 |q 7635/1
|tip This isn't a 100% drop rate.
|only if Hunter
step
talk Vartus the Ancient##14524
|tip Kill enemies around the area for him to appear.
turnin Stave of the Ancients##7636  |goto Felwood 48.99,24.44
|only if Hunter
step
talk Stoma the Ancient##14525
|tip Kill enemies around the area for him to appear.
turnin A Proper String##7635 |goto Felwood 48.31,24.43
|only if Hunter
step
use the Ancient Rune Etched Stave##18707
collect Rhok'delar, Longbow of the Ancient Keepers##18713 |n
collect Lok'delar, Stave of the Ancient Keepers##18715 |n
|only if Hunter
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Mage',
  {
    description = 'This guide will walk you through completing various Mage Class Quests.',
  },
  [[
step
ding 15
step
talk Uthel'nay##7311
|tip Inside the building.
accept Speak with Un'thuwa##1883 |goto Orgrimmar 39.16,86.27
|only if Mage
step
talk Un'Thuwa##5880
|tip Inside the building.
turnin Speak with Un'thuwa##1883 |goto Durotar 56.31,75.11
accept Ju-Ju Heaps##1884 |goto Durotar 56.31,75.11
|only if Mage
step
click Ju-ju Heap##102986
|tip They look like a pile of skulls.
|tip They are in buildings all around this area.
|tip Watch for patrols and respawns while in the area. |only if hardcore
Destroy 4 Ju-ju Heaps |q 1884/1 |goto Durotar 67.76,83.50
|only if Mage
step
talk Un'Thuwa##5880
|tip Inside the building.
turnin Ju-Ju Heaps##1884 |goto Durotar 56.31,75.11
|only if Mage
step
ding 15
step
talk Uthel'nay##7311
|tip Inside the building.
accept Report to Anastasia##1959 |goto Orgrimmar 39.16,86.27
|only if Mage
step
talk Anastasia Hartwell##4568
turnin Report to Anastasia##1959 |goto Undercity 85.14,10.06
accept Investigate the Alchemist Shop##1960 |goto Undercity 85.14,10.06
|only if Mage
step
click Cantation of Manifestation##105175
|tip It looks like a scroll on the ledge of the wall.
collect Cantation of Manifestation##7308 |q 1960/3 |goto Undercity 85.65,10.00
|only if Mage
step
click Chest of Containment Coffers##105174
|tip It looks like a brown treasure box on the edge of the wall.
collect Chest of Containment Coffers##7247 |q 1960/2 |goto Undercity 85.65,10.00
|only if Mage
step
use the Cantation of Manifestation##7308
|tip Use the "Arcane Explosion" ability after using the Cantation to reveal the enemy.
kill Rift Spawn##6492
use the Chest of Containment Coffers##7247
|tip Use it on the Rift Spawn corpse.
click Filled Containment Coffer
collect 3 Filled Containment Coffer##7292 |q 1960/1 |goto Undercity 52.99,74.92
|only if Mage
step
talk Anastasia Hartwell##4568
turnin Investigate the Alchemist Shop##1960 |goto Undercity 85.14,10.06
accept Gathering Materials##1961 |goto Undercity 85.14,10.06
|only if Mage
stickystart "10_linen"
step
Kill enemies around this area
collect 6 Dalaran Mana Gem##7293 |q 1961/2 |goto Silverpine Forest 62.26,64.24
|tip Keep an eye out for patrols and casters while in the cave. |only if hardcore
|only if Mage
step
label "10_linen"
Kill enemies around this area
|tip Keep an eye out for patrols and casters while in the cave. |only if hardcore |notinsticky
collect 10 Linen Cloth##2589 |q 1961/1 |goto Silverpine Forest 62.26,64.24
|only if Mage
step
talk Josef Gregorian##4576
turnin Gathering Materials##1961 |goto Undercity 70.75,30.69
Watch the Dialogue
accept Spellfire Robes##1962 |goto Undercity 70.75,30.69
|only if Mage
step
ding 26
step
talk Anastasia Hartwell##4568
accept Speak with Deino##1943 |goto Undercity 85.13,9.98
|only if Mage
step
talk Deino##5885
turnin Speak with Deino##1943 |goto Orgrimmar 38.45,86.14
accept Waters of Xavian##1944 |goto Orgrimmar 38.45,86.14
|only if Mage
step
Follow the path up |goto Ashenvale 73.67,50.38 < 15
use Deino's Flask##7269
collect Xavian Water Sample##7268 |q 1944/1 |goto Ashenvale 76.33,41.43
|only if Mage
step
talk Deino##5885
turnin Waters of Xavian##1944 |goto Orgrimmar 38.45,86.14
accept Laughing Sisters##1945 |goto Orgrimmar 38.45,86.14
|only if Mage
step
kill Laughing Sister##4054
|tip Watch for patrols and respawns in the area. |only if hardcore
collect 12 Laughing Sister's Hair##7270 |q 1945/1 |goto Ashenvale 58.61,59.49
You can find more around here [58.25,55.98]
|only if Mage
step
talk Kil'hala##3484
turnin Laughing Sisters##1945 |goto The Barrens 52.20,31.70
accept Nether-lace Garment##1946 |goto The Barrens 52.20,31.70
|only if Mage
step
ding 30
step
talk Deino##5885
|tip Inside the building.
accept Journey to the Marsh##1947 |goto Orgrimmar 38.45,86.14
|only if Mage
step
collect 1 Jade##1529 |q 1948 |future
|tip These are gathered with the Mining profession.
|tip You can also buy them from the Auction House. |only if not selfmade
|tip Make sure not to accidentally vendor it.
step
talk Tabetha##6546
|tip Inside the building.
turnin Journey to the Marsh##1947 |goto Dustwallow Marsh 46.06,57.09
Watch the Dialogue
accept Hidden Secrets##1949 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
talk Magus Tirth##6548
turnin Hidden Secrets##1949 |goto Thousand Needles 78.29,75.70
accept Get the Scoop##1950 |goto Thousand Needles 78.29,75.70
|only if Mage
step
talk "Plucky" Johnson##6626
|tip Use the "/beckon" Emote to turn him back to a human.
Tell him to _"Please tell me the Phrase..."_
Learn the Secret Phrase |q 1950/1 |goto Thousand Needles 79.60,75.60
|only if Mage
step
talk Magus Tirth##6548
turnin Get the Scoop##1950 |goto Thousand Needles 78.29,75.70
accept Rituals of Power##1951 |goto Thousand Needles 78.29,75.70
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
accept Items of Power##1948 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Kill Witherbark enemies around this area
|tip They look like trolls.
collect 10 Witherbark Totem Stick##7273 |q 1948 |goto Arathi Highlands 66.66,64.37
|only if Mage
step
use the Witherbark Totem Stick##7273
|tip Clear the enemies around the stones before doing so.
click Bolt Charged Bramble##103662
|tip On top of the rock at the center of the Outer Binding Circle.
collect Bolt Charged Bramble##7272 |q 1948/2 |goto Arathi Highlands 52.06,50.69
|only if Mage
step
collect 1 Jade##1529 |q 1948
|tip You should have collected this earlier.
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Items of Power##1948 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Scarlet Monastery (Library) Dungeon:
|tip The upcoming quest steps will send you into the Scarlet Monastery dungeons.
|tip You will need a group to complete them.
Click Here to Continue |confirm |q 1951
|only if Mage and hardcore
step
Enter the building |goto Tirisfal Glades/0 82.65,32.88 < 7 |walk
Enter the Portal |goto Tirisfal Glades/0 85.33,32.27 < 7 |walk
Enter the Scarlet Monastery - Library Dungeon with Your Group |goto Scarlet Monastery/0 0.00,0.00 < 500 |c |noway |q 1951
|only if Mage
step
Inside the Scarlet Monastery Library Dungeon:
click Rituals of Power
|tip In the Athenaeum, to the left of the doorway.
collect Rituals of Power##7274 |q 1951/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Rituals of Power##1951  |goto Dustwallow Marsh 46.06,57.09
accept Mage's Wand##1952 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Mage's Wand##1952 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 40
step
talk Anastasia Hartwell##4568
accept Return to the Marsh##1953 |goto Undercity 85.13,9.98
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Return to the Marsh##1953 |goto Dustwallow Marsh 46.06,57.09
accept The Infernal Orb##1954 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Burning Blade Summoner##4668
|tip You may have to look around for them. |only if hardcore
|tip Watch out for patrols and respawns while in the area. |only if hardcore
collect Infernal Orb##7291 |q 1954/1 |goto Desolace 53.34,79.05
|only if Mage
step
Incoming Elite Quest
|tip During the quest "The Exorcism", you will be tasked with killing The Demon of the Orb, which is a level 40 elite enemy.
|tip It will deal a lot of a damage.
|tip If you are unable to get help, you should have your best healing potions ready.
Click Here to Continue |confirm |q 1955 |future
|only if Mage and hardcore
step
talk Tabetha##6546
|tip Inside the building.
turnin The Infernal Orb##1954 |goto Dustwallow Marsh 46.06,57.09
accept The Exorcism##1955 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Demon of the Orb##6549 |q 1955/1 |goto Dustwallow Marsh 46.04,57.10
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin The Exorcism##1955 |goto Dustwallow Marsh 46.06,57.09
accept Power in Uldaman##1956 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Uldaman dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 1956
|only if Mage and hardcore
step
Enter the Uldaman Dungeon with Your Group |goto Uldaman/0 0.00,0.00 < 500 |c |q 1956
|only if Mage
step
Inside the Uldaman Dungeon:
kill Obsidian Sentinel##7023
|tip Use the Uldaman Dungeon guide to accomplish this.
collect Obsidian Power Source##8053 |q 1956/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Power in Uldaman##1956 |goto Dustwallow Marsh 46.06,57.09
accept Mana Surges##1957 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
kill Mana Surge##6550
|tip They will spawn continuously as you kill them.
Slay #12# Manage Surges |q 1957/1 |goto Dustwallow Marsh 45.85,56.76
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Mana Surges##1957 |goto Dustwallow Marsh 46.06,57.09
Watch the Dialogue
accept Celestial Power##1958 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 46
step
talk Anastasia Hartwell##4568
accept Tabetha's Task##2861 |goto Undercity 85.13,9.98
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Tabetha's Task##2861 |goto Dustwallow Marsh 46.06,57.09
accept Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Zul'Farrak dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 2846
|only if Mage and hardcore
step
Enter the Zul'Farrak Dungeon with Your Group |goto Zul'Farrak/0 0.00,0.00 < 500 |c |q 2846
step
Inside the Zul'Farrak Dungeon:
kill Hydromancer Velratha##7795
collect Tiara of the Deep##9234 |q 2846/1
|only if Mage
step
talk Tabetha##6546
|tip Inside the building.
turnin Tiara of the Deep##2846 |goto Dustwallow Marsh 46.06,57.09
|only if Mage
step
ding 60
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 62.49,24.89 < 5 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - North Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7463 |future
step
Inside the Dire Maul North Dungeon:
talk Lorekeeper Lydros##14368
|tip Through the Conservatory Door in the courtyard.
accept Arcane Refreshment##7463
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (East) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
Continue following the path |goto Feralas/0 64.85,30.18 < 7 |only if walking
Enter the Dire Maul - East Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 18299 |future
step
Inside the Dire Maul East Dungeon:
kill Hydrospawn##13280
|tip Refer to the Dire Maul East Dungeon guide to accomplish this.
collect Hydrospawn Essence##18299
|only if Mage
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Dire Maul (North) dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 7463 |future
|only if Mage and hardcore
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 62.49,24.89 < 5 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - North Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7463
step
Inside the Dire Maul North Dungeon:
talk Lorekeeper Lydros##14368
|tip Through the Conservatory Door in the courtyard.
turnin Arcane Refreshment##7463
|only if Mage
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Rogue',
  {
    description = 'This guide will walk you through completing various Rogue Class Quests.',
  },
  [[
step
ding 20
|only if not hardcore
step
ding 24
|tip We are waiting until 24 because you will have to deal with an level 23 elite.
|tip You are able to proceed at level 21, but you will likely need help.
Click Here to Continue |confirm |q 2478 |future
|only if hardcore
step
talk Gest##3327
Train the "Pick Lock" Ability |complete knowspell(1804) |goto Orgrimmar 42.71,51.48
|only if Rogue
step
Follow the path |goto The Barrens 62.37,39.44 < 15 |only if walking
Follow the path onto the ship |goto The Barrens 64.18,45.49 < 7 |only if walking
click Buccaneer's Strongbox##123330+
|tip They look like grey metal chests.
|tip Inside the ship, on the middle level.
|tip Keep clicking them until you reach Lockpicking skill level 75.
|tip Watch for patrols and respawns around the area. |only if hardcore
Click Here After Reaching Level 75 Lockpicking |confirm |goto The Barrens 65.07,45.44 |q 2480 |future
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
accept The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
Watch the dialogue
|tip Inside the tent, inside the Cleft of Shadow.
|tip Wait for Shenthul to salute you (you will see him perform a hand movement).
Perform the Shattered Salute |q 2460/1 |goto Orgrimmar 43.05,53.74
|tip Target Shenthul and type "/salute" into your chat to perform the Salute emote.
|only if Rogue
step
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin The Shattered Salute##2460 |goto Orgrimmar 43.05,53.74
accept Deep Cover##2458 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
Follow the road |goto The Barrens 52.37,27.62 < 30 |only if walking
Follow the path |goto The Barrens 54.47,10.25 < 50 |only if walking
use the Flare Gun##8051
|tip Use it while targeting Taskmaster Fizzule nearby to the north.
|tip You must use it TWICE in a row.
|tip After shooting 2 flares, perform the "/salute" emote while still targeting Taskmaster Fizzule.
Signal Taskmaster Fizzule |q 2458/1 |goto The Barrens 55.47,6.08
|only if Rogue
step
talk Taskmaster Fizzule##7233
turnin Deep Cover##2458 |goto The Barrens 55.44,5.56
accept Mission: Possible But Not Probable##2478 |goto The Barrens 55.44,5.56
|only if Rogue
step
collect Silixiz's Tower Key##8072 |q 2478/5 |goto The Barrens 54.80,5.97
|tip Use your "Pickpocket" ability on Foreman Silixiz.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
Enter the building |goto The Barrens 54.87,5.86 < 7 |walk
kill 2 Mutated Venture Co. Drone##7310 |q 2478/1 |goto The Barrens 54.71,5.73
|tip Inside the building, on the bottom floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill 2 Venture Co. Patroller##7308 |q 2478/3 |goto The Barrens 54.81,5.59
|tip Upstairs inside the building, on the lower middle floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill 2 Venture Co. Lookout##7307 |q 2478/2 |goto The Barrens 54.63,5.64
|tip Upstairs on the balcony of the building, on the upper middle floor.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|only if Rogue
step
kill Grand Foreman Puzik Gallywix##7288
|tip Upstairs inside the building, on the top floor.
|tip He is elite, but you should be able to kill him. |only if not hardcore
|tip If you have trouble, try to find someone to help you. |only if not hardcore
|tip This enemy is elite. |only if hardcore
|tip You will likely need help with this if you aren't overleveled. |only if hardcore
|tip Only one head per kill will drop.
|tip He will allegedly spawn every 8 to 10 minutes.
collect Cache of Zanzil's Altered Mixture##8073 |q 2478/6 |goto The Barrens 54.75,5.59
collect Gallywix's Head##8074 |q 2478/4 |goto The Barrens 54.75,5.59
|only if Rogue
step
click Gallywix's Lockbox##129127
|tip Upstairs inside the building, on the top floor.
|tip You will get a debuff after opening it.
Receive the Touch of Zanzil |havebuff Touch of Zanzil##9991 |goto The Barrens 54.75,5.55 |q 2478
|only if Rogue
step
Follow the path |goto The Barrens 54.71,9.86 < 50 |only if walking
Follow the road |goto The Barrens 52.13,18.67 < 30 |only if walking
talk Shenthul##3401
|tip Inside the tent, inside the Cleft of Shadow.
turnin Mission: Possible But Not Probable##2478 |goto Orgrimmar 43.05,53.74
accept Hinott's Assistance##2479 |goto Orgrimmar 43.05,53.74
|only if Rogue
step
_Note for Rogues:_
|tip Now we need to travel to Tarren Mill in Hillsbrad Foothills.
|tip That's where you will complete your class quest.
|tip It's a long run, but it will improve your leveling by allowing you to learn to make Poisons.
Click Here to Continue |confirm |q 2480 |future
|only if Rogue
step
Enter Undercity |goto Tirisfal Glades 61.86,65.03 < 15 |only if walking
talk Michael Garrett##4551
fpath Undercity |goto Undercity 63.28,48.58
|only if Rogue
step
Leave Undercity |goto Undercity 66.19,0.63 < 10 |walk
Follow the road |goto Tirisfal Glades 56.17,65.88 < 30|only if walking
Continue following the road |goto Silverpine Forest 58.14,12.21 < 30 |only if walking
Cross the bridge |goto Silverpine Forest 49.75,28.82 < 15 |only if walking
Follow the road |goto Silverpine Forest 48.71,38.60 < 30 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.59
|only if Rogue
step
Follow the road |goto Silverpine Forest 46.48,41.31 < 20 |only if walking
Continue following the road |goto Silverpine Forest 52.85,43.92 < 30 |only if walking
Continue following the road |goto Silverpine Forest 53.88,73.53 < 30 |only if walking
Enter Hillsbrad Foothills |goto Silverpine Forest 66.87,80.22 < 30 |only if walking
Follow the road |goto Hillsbrad Foothills 57.51,36.04 < 30 |only if walking
talk Zarise##2389
fpath Tarren Mill |goto Hillsbrad Foothills 60.14,18.62
|only if Rogue
step
Enter the building |goto Hillsbrad Foothills 61.50,19.43 < 7 |walk
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2479 |goto Hillsbrad Foothills 61.63,19.19
accept Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.63,19.19
|only if Rogue
step
Watch the dialogue
|tip Inside the building.
Complete the Cure |q 2480/1 |goto Hillsbrad Foothills 61.49,18.95
|only if Rogue
step
talk Serge Hinott##2391
|tip Inside the building.
turnin Hinott's Assistance##2480 |goto Hillsbrad Foothills 61.58,18.97
|only if Rogue
step
use Hinott's Oil##8095
Remove the Touch of Zanzil |nobuff Touch of Zanzil##9991
|only if Rogue
step
ding 50
|only if not hardcore
step
ding 52
|only if hardcore
step
talk Ormok##3328
accept A Simple Request##8233 |goto Orgrimmar 43.91,54.62
|only if Rogue
step
Follow the road up |goto Hillsbrad Foothills 75.51,23.52 < 10 |only if walking
Enter the cave |goto Hillsbrad Foothills 77.82,19.27 < 10 |walk
Follow the path |goto Alterac Mountains 81.71,77.48 < 10 |only if walking
Enter the building |goto Alterac Mountains 85.46,79.39 < 10 |walk
talk Lord Jorach Ravenholdt##6768
turnin A Simple Request##8233 |goto Alterac Mountains 86.03,78.88
accept Sealed Azure Bag##8234 |goto Alterac Mountains 86.03,78.88
|only if Rogue
step
kill Timbermaw Shaman##6188
collect Sealed Azure Bag##19775 |q 8234/1 |goto Azshara 43.77,25.56
You can find more around:
[41.49,19.55]
|only if Rogue
step
talk Sanath Lim-yo##8395
accept Meeting with the Master##3503 |goto Azshara 28.11,50.09
|only if Rogue
step
Follow the path up |goto Azshara 26.48,44.23 < 15 |only if walking
talk Archmage Xylem##8379
|tip Inside the tower.
turnin Sealed Azure Bag##8234 |goto Azshara 29.71,40.52
accept Encoded Fragments##8235 |goto Azshara 29.71,40.52
|only if Rogue
step
Follow the path down |goto Azshara 27.04,43.31 < 15 |only if walking
talk Nyrill##8399
accept Return Trip##3421 |goto Azshara 36.13,67.82
|only if Rogue
step
kill Forest Ooze##8766
collect 10 Encoded Fragment##20023 |q 8235/1 |goto Azshara 73.40,25.20
You can find more around
[80.13,24.75]
[72.71,23.53]
[74.59,13.08]
[66.10,22.93]
|only if Rogue
step
talk Sanath Lim-yo##8395
accept Meeting with the Master##3503 |goto Azshara 28.11,50.09
|only if Rogue
step
Follow the path up |goto Azshara 26.48,44.23 < 15 |only if walking
talk Archmage Xylem##8379
|tip Inside the tower.
turnin Encoded Fragments##8235 |goto Azshara 29.71,40.52
accept The Azure Key##8236 |goto Azshara 29.71,40.52
|only if Rogue
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Rogue and hardcore
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8236 |future
|only if Rogue
step
Inside the Temple of Atal'Hakkar:
kill Morphaz##5719
|tip Refer to the Temple of Atal'Hakkar Dungeon guide to accomplish this.
collect Azure Key##20022 |q 8236/1
|only if Rogue
step
Follow the road up |goto Hillsbrad Foothills 75.51,23.52 < 10 |only if walking
Enter the cave |goto Hillsbrad Foothills 77.82,19.27 < 10 |walk
Follow the path |goto Alterac Mountains 81.71,77.48 < 10 |only if walking
Enter the building |goto Alterac Mountains 85.46,79.39 < 10 |walk
talk Lord Jorach Ravenholdt##6768
turnin The Azure Key##8236|goto Alterac Mountains 86.03,78.88
|only if Rogue
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Shaman',
  {
    description = 'This guide will walk you through completing various Shaman Class Quests.',
  },
  [[
step
ding 4
step
talk Seer Ravenfeather##5888
accept Call of Earth##1519 |goto Mulgore 44.73,76.18
|only if Tauren Shaman
step
kill Bristleback Shaman##2953+
|tip They can be pretty spread out around this area.
collect 2 Ritual Salve##6634 |q 1519/1 |goto Mulgore 63.87,80.34
You can find more around [59.92,75.65]
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1519 |goto Mulgore 44.73,76.19
accept Call of Earth##1520 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
use the Earth Sapta##6635
talk the Minor Manifestation of Earth##5891
turnin Call of Earth##1520 |goto Mulgore 53.88,80.56
accept Call of Earth##1521 |goto Mulgore 53.88,80.56
|only if Tauren Shaman
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1521 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
talk Canaga Earthcaller##5887
accept Call of Earth##1516 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
kill Felstalker##3102+
|tip Inside the cave.
collect 2 Felstalker Hoof##6640 |q 1516/1 |goto Durotar 44.82,54.59
|only if (Orc Shaman) or (Troll Shaman)
step
talk Canaga Earthcaller##5887
turnin Call of Earth##1516 |goto Durotar 42.41,69.17
accept Call of Earth##1517 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
Follow the path |goto Durotar 43.57,69.85 < 20 |only if walking
Follow the path up |goto Durotar 41.56,73.28 < 15 |only if walking
Continue up the path |goto Durotar 40.74,74.35 < 10 |only if walking
Follow the path |goto Durotar 42.49,74.89 < 10 |only if walking
use the Earth Sapta##6635
talk Minor Manifestation of Earth##5891
turnin Call of Earth##1517 |goto Durotar 44.03,76.20
accept Call of Earth##1518 |goto Durotar 44.03,76.20
|only if (Orc Shaman) or (Troll Shaman)
step
Jump down here |goto Durotar 43.73,74.92 < 10 |only if walking
Follow the path |goto Durotar 43.49,69.67 < 30 |only if walking
talk Canaga Earthcaller##5887
turnin Call of Earth##1518 |goto Durotar 42.41,69.17
|only if (Orc Shaman) or (Troll Shaman)
step
ding 10
|only if not hardcore
step
ding 12
|only if hardcore
step
Enter the building |goto Durotar 53.25,42.59 < 7 |walk
talk Swart##3173
|tip Inside the building.
accept Call of Fire##2983 |goto Durotar 54.42,42.58
|only if Shaman
step
Leave the building |goto Durotar 53.27,42.59 < 7 |walk
Follow the road |goto Durotar 50.64,43.97 < 15 |only if walking
Cross the bridge |goto Durotar 34.60,42.31 < 15 |only if walking
talk Kranal Fiss##5907
turnin Call of Fire##2983 |goto The Barrens 56.03,19.89
accept Call of Fire##1524 |goto The Barrens 56.03,19.89
|only if Shaman
step
Cross the bridge |goto The Barrens 62.67,19.22 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 10 |only if walking
Continue up the path |goto Durotar 36.61,58.19 < 5 |only if walking
Continue up the path |goto Durotar 37.74,58.24 < 5 |only if walking
Continue up the path |goto Durotar 38.94,57.56 < 5 |only if walking
Follow the path |goto Durotar 39.18,58.63 < 5 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1524 |goto Durotar 38.55,58.96
accept Call of Fire##1525 |goto Durotar 38.55,58.96
|only if Shaman
step
Follow the path down |goto Durotar 39.21,58.52 < 7 |only if walking
Follow the path |goto The Barrens 61.47,20.86 < 40 |only if walking
Kill Razormane enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Fire Tar##5026 |q 1525/1 |goto The Barrens 54.15,25.01
|only if Shaman
step
Cross the bridge |goto The Barrens 62.67,19.23 < 15 |only if walking
Follow the path |goto Durotar 50.78,43.81 < 15 |only if walking
Continue following the path |goto Durotar 54.15,40.72 < 15 |only if walking
Enter the cave |goto Durotar 52.82,28.82 < 10 |walk
Follow the path |goto Durotar 53.07,27.09 < 10 |walk
kill Burning Blade Cultist##3199+
|tip Inside the cave.
|tip They seem to mostly be towards the back of the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Reagent Pouch##6652 |q 1525/2 |goto Durotar 52.12,24.95
|only if Shaman
step
Follow the path |goto Durotar 53.13,27.27 < 10 |walk
Leave the cave |goto Durotar 52.83,28.93 < 10 |walk
Jump down onto the huge long rock |goto Durotar 51.97,31.29 < 15 |only if walking
Follow the path up |goto Durotar 36.59,57.07 < 10 |only if walking
Continue up the path |goto Durotar 36.61,58.19 < 5 |only if walking
Continue up the path |goto Durotar 37.74,58.24 < 5 |only if walking
Continue up the path |goto Durotar 38.94,57.56 < 5 |only if walking
Follow the path |goto Durotar 39.18,58.63 < 5 |only if walking
talk Telf Joolam##5900
|tip On top of the mountain.
turnin Call of Fire##1525 |goto Durotar 38.55,58.96
accept Call of Fire##1526 |goto Durotar 38.55,58.96
|only if Shaman
step
Follow the path up |goto Durotar 38.34,58.52 < 5 |only if walking
use the Fire Sapta##6636
kill Minor Manifestation of Fire##5893
|tip On top of the mountain.
|tip It will be immune to fire damage. |only if hardcore
collect Glowing Ember##6655 |q 1526/1 |goto Durotar 38.84,58.24
|only if Shaman
step
click Brazier of the Dormant Flame##61934
|tip On top of the mountain.
turnin Call of Fire##1526 |goto Durotar 38.95,58.22
accept Call of Fire##1527 |goto Durotar 38.95,58.22
|only if Shaman
step
Follow the path down |goto Durotar 39.19,57.81 < 5 |only if walking
talk Kranal Fiss##5907
turnin Call of Fire##1527 |goto The Barrens 56.04,19.89
|only if Shaman
step
ding 20
step
Enter the building |goto Orgrimmar 40.21,36.95 < 15 |walk
talk Searn Firewarder##5892
|tip Inside the building.
|tip We run back to Crossroads first, instead of hearthing.
|tip We are saving your hearthstone to use in Hillsbrad Foothills, to return to Crossroads quickly.
accept Call of Water##1528 |goto Orgrimmar 37.96,37.74
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##1528 |goto The Barrens 65.83,43.78
accept Call of Water##1530 |goto The Barrens 65.83,43.78
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1530 |goto The Barrens 43.42,77.41
accept Call of Water##1535 |goto The Barrens 43.42,77.41
|only if Shaman
step
use the Empty Brown Waterskin##7766
collect Filled Brown Waterskin##7769 |q 1535/1 |goto The Barrens/0 44.19,76.90
|only if Shaman
step
Follow the path up |goto The Barrens/0 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1535 |goto The Barrens/0 43.42,77.41
accept Call of Water##1536 |goto The Barrens/0 43.42,77.41
|only if Shaman
step
use the Empty Red Waterskin##7768
collect Filled Red Waterskin##7771 |q 1536/1 |goto Hillsbrad Foothills 62.15,20.75
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1536 |goto The Barrens 43.42,77.41
accept Call of Water##1534 |goto The Barrens 43.42,77.41
|only if Shaman
step
Follow the path |goto The Barrens 38.83,58.05 < 30 |only if walking
use the Empty Blue Waterskin##7767
collect Filled Blue Waterskin##7770 |q 1534/1 |goto Ashenvale 33.55,67.44
|only if Shaman
step
Follow the road |goto The Barrens 46.12,67.29 < 30 |only if walking
Follow the path up |goto The Barrens 44.28,77.29 < 15 |only if walking
talk Brine##5899
turnin Call of Water##1534 |goto The Barrens 43.42,77.41
accept Call of Water##220 |goto The Barrens 43.42,77.41
|only if Shaman
step
Follow the road |goto The Barrens 46.85,65.69 < 30 |only if walking
talk Islen Waterseer##5901
turnin Call of Water##220 |goto The Barrens 65.83,43.78
accept Call of Water##63 |goto The Barrens 65.83,43.78
|only if Shaman
step
Jump up onto the tree |goto Silverpine Forest/0 42.02,40.67 < 5
Jump down carefully |goto Silverpine Forest/0 39.70,40.98 < 10
Follow the path |goto Silverpine Forest/0 39.09,43.05 < 10
use the Water Sapta##6637
kill Corrupt Water Manifestation##5894
collect Corrupt Manifestation's Bracers##7812 |q 63/1 |goto Silverpine Forest/0 38.84,44.25
|only if Shaman
step
click Brazier of Everfount
turnin Call of Water##63 |goto Silverpine Forest 38.28,44.56
accept Call of Water##100 |goto Silverpine Forest 38.28,44.56
|only if Shaman
step
Watch the dialogue
talk Minor Manifestation of Water##5895
turnin Call of Water##100 |goto Silverpine Forest 38.75,44.62
accept Call of Water##96 |goto Silverpine Forest 38.75,44.62
|only if Shaman
step
talk Islen Waterseer##5901
turnin Call of Water##96 |goto The Barrens 65.83,43.78
|only if Shaman
step
ding 30
step
Enter the building |goto Orgrimmar 40.25,36.98 < 10 |walk
talk Searn Firewarder##5892
|tip Inside the building.
accept Call of Air##1531 |goto Orgrimmar 37.97,37.73
|only if Shaman
step
Follow the path up |goto Thousand Needles 54.68,44.78 < 15 |only if walking
talk Prate Cloudseer##5905
turnin Call of Air##1531 |goto Thousand Needles 53.54,42.65
|only if Shaman
step
ding 52
step
collect 1 Elemental Air##7069
|tip Refer to the "Elemental Air" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Shaman
step
collect 1 Elemental Fire##7068
|tip Refer to the "Elemental Fire" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Shaman
step
collect 1 Elemental Earth##7067
|tip Refer to the "Elemental Earth" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Shaman
step
collect 1 Elemental Water##7070
|tip Refer to the "Elemental Water" farming guide to accomplish this.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Shaman
step
talk Beram Skychaser##3032
|tip Inside the building.
accept Elemental Mastery##8410 |goto Thunder Bluff 22.80,19.40
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Elemental Mastery##8410 |goto Alterac Mountains 80.50,66.92
accept Spirit Totem##8412 |goto Alterac Mountains 80.50,66.92
|only if Shaman
stickystart "Thick_Black_Claw"
step
Kill enemies around this area
collect 8 Bloodshot Spider Eye##20610 |q 8412/1 |goto Western Plaguelands 33.60,60.40
You can find more around here [58.40,53.60]
|only if Shaman
step
label "Thick_Black_Claw"
Kill enemies around this area
collect 8 Thick Black Claw##20611 |q 8412/2 |goto Western Plaguelands 33.60,60.40
You can find more around here [58.40,53.60]
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Spirit Totem##8412 |goto Alterac Mountains 80.50,66.92
accept Da Voodoo##8413 |goto Alterac Mountains 80.50,66.92
|only if Shaman
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8425
|only if Shaman and hardcore
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8413 |future
|only if Shaman
stickystart "Blue_Voodoo_Feathers"
stickystart "Green_Voodoo_Feathers"
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8413/1
|tip These come from Gasher and Zul'Lor.
|only if Shaman
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8413/2
|tip These come from Mijan and Hukku.
|only if Shaman
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8413/3
|tip These come from Zolo and Loro.
|only if Shaman
step
talk Bath'rah the Windwatcher##6176
turnin Da Voodoo##8413 |goto Alterac Mountains 80.50,66.92
|only if Shaman
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Class Quests\\Warlock',
  {
    description = 'This guide will walk you through completing various Warlock Class Quests.',
  },
  [[
step
talk Ruzan##5765
accept Vile Familiars##1485 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
kill Vile Familiar##3101+
|tip Inside and outside the cave.
collect 6 Vile Familiar Head##6487 |q 1485/1 |goto Durotar 45.34,56.36
|only if Orc Warlock
step
talk Ruzan##5765
turnin Vile Familiars##1485 |goto Durotar 42.59,69.00
accept Vile Familiars##1499 |goto Durotar 42.59,69.00
|only if Orc Warlock
step
talk Zureetha Fargaze##3145
turnin Vile Familiars##1499 |goto Durotar 42.85,69.15
|only if Orc Warlock
step
talk Venya Marthand##5667
|tip Inside the building.
accept Piercing the Veil##1470 |goto Durotar 30.98,66.41
|only if Scourge Warlock
step
kill Rattlecage Skeleton##1890+
collect 3 Rattlecage Skull##6281 |q 1470/1 |goto Durotar 32.73,60.10
|only if Scourge Warlock
step
talk Venya Marthand##5667
|tip Inside the building.
turnin Piercing the Veil##1470 |goto Durotar 30.98,66.41
|only if Scourge Warlock
step
ding 10
step
Enter the building |goto Tirisfal Glades 61.56,53.04 < 7 |walk
talk Ageron Kargal##5724
|tip Upstairs inside the building.
accept Halgar's Summons##1478 |goto Tirisfal Glades 61.62,52.67
|only if Scourge Warlock
step
Leave the building |goto Tirisfal Glades 61.56,53.06 < 7 |walk
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Halgar's Summons##1478 |goto Undercity 85.04,26.01
accept Creature of the Void##1473 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
Leave Undercity |goto Undercity 66.23,0.23 < 10 |walk
Enter the building |goto Tirisfal Glades 51.44,67.70 < 7 |walk
click Perrine's Chest
|tip Inside the building.
collect Egalin's Grimoire##6285 |q 1473/1 |goto Tirisfal Glades 51.06,67.57
|only if Scourge Warlock
step
Leave the building |goto Tirisfal Glades 51.44,67.69 < 7 |walk
Enter Undercity |goto Tirisfal Glades 61.88,65.06 < 10 |only if walking
talk Carendin Halgar##5675
turnin Creature of the Void##1473 |goto Undercity 85.04,26.01
accept The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
use the Runes of Summoning##6284
|tip Use them on the pink symbol on the ground.
kill Summoned Voidwalker##5676 |q 1471/1 |goto Undercity 86.62,27.10
|tip Don't forget to summon your imp. |only if hardcore
|only if Scourge Warlock
step
talk Carendin Halgar##5675
turnin The Binding##1471 |goto Undercity 85.04,26.01
|only if Scourge Warlock
step
talk Ophek##3294
|tip Outside, behind the building.
accept Gan'rul's Summons##1506 |goto Durotar 54.37,41.29
|only if Orc Warlock
step
Follow the road |goto Durotar 52.37,40.01 < 30 |only if walking
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path |goto Orgrimmar 51.55,58.13 < 20 |only if walking
Follow the path down |goto Orgrimmar 55.96,41.03 < 15 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Gan'rul's Summons##1506 |goto Orgrimmar 48.24,45.29
accept Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
Follow the path up |goto Orgrimmar 43.93,56.80 < 10 |walk
Follow the path |goto Orgrimmar 38.49,54.16 < 10 |walk
Follow the path |goto Orgrimmar 52.50,85.13 < 20 |only if walking
Leave Orgrimmar |goto Orgrimmar 49.10,94.75 < 20 |only if walking
Enter the cave |goto Durotar 55.02,9.79 < 10 |walk
Follow the path |goto Durotar 53.80,8.83 < 10 |walk
Continue following the path |goto Durotar 52.75,7.87 < 10 |walk
Continue following the path |goto Durotar 51.68,8.23 < 10 |walk
click Burning Blade Stash##58595
|tip Inside the cave.
collect Tablet of Verga##6535 |q 1501/1 |goto Durotar 51.62,9.74
|only if Orc Warlock
step
Follow the path |goto Durotar 51.73,8.10 < 10 |walk
Continue following the path |goto Durotar 52.49,8.31 < 10 |walk
Continue following the path |goto Durotar 54.20,8.92 < 10 |walk
Leave the cave |goto Durotar 55.03,9.87 < 10 |walk
Enter Orgrimmar |goto Durotar 45.54,12.06 < 20 |only if walking
Follow the path |goto Orgrimmar 51.55,58.13 < 20 |only if walking
Follow the path down |goto Orgrimmar 55.96,41.03 < 10 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Creature of the Void##1501 |goto Orgrimmar 48.24,45.29
accept The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
use Glyphs of Summoning##7464
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent.
kill Summoned Voidwalker##5676 |q 1504/1 |goto Orgrimmar 49.44,50.02
|only if Orc Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin The Binding##1504 |goto Orgrimmar 48.24,45.29
|only if Orc Warlock
step
ding 20
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent, inside the Cleft of Shadow.
accept Devourer of Souls##1507 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
talk Cazul##5909
turnin Devourer of Souls##1507 |goto Orgrimmar 47.06,46.48
accept Blind Cazul##1508 |goto Orgrimmar 47.06,46.48
|only if Warlock
step
Follow the path up |goto Orgrimmar 43.93,56.92 < 15 |walk
Follow the path |goto Orgrimmar 38.40,54.26 < 20 |only if walking
Enter the building |goto Orgrimmar 38.07,60.65 < 15 |walk
talk Zankaja##5910
|tip Inside the building.
turnin Blind Cazul##1508 |goto Orgrimmar 37.03,59.45
accept News of Dogran##1509 |goto Orgrimmar 37.03,59.45
|only if Warlock
step
talk Gazrog##3464
turnin News of Dogran##1509 |goto The Barrens 51.93,30.32
accept News of Dogran##1510 |goto The Barrens 51.93,30.32
|only if Warlock
step
Follow the road |goto The Barrens 50.82,29.07 < 20 |only if walking
Follow the road |goto The Barrens 39.39,29.65 < 30 |only if walking
Follow the path up |goto Stonetalon Mountains 82.07,98.57 < 15 |only if walking
Follow the path |goto Stonetalon Mountains 77.19,98.73 < 15 |only if walking
Jump down here |goto Stonetalon Mountains 75.01,97.08 < 15 |only if walking
talk Ken'zigla##4197
turnin News of Dogran##1510 |goto Stonetalon Mountains 73.25,95.12
accept Ken'zigla's Draught##1511 |goto Stonetalon Mountains 73.25,95.12
|only if Warlock
step
Follow the path up |goto Stonetalon Mountains 72.89,93.73 < 15 |only if walking
Follow the path |goto Stonetalon Mountains 77.33,98.72 < 15 |only if walking
Follow the road |goto The Barrens 35.84,27.53 < 30 |only if walking
Continue following the road |goto The Barrens 39.43,29.70 < 30 |only if walking
Follow the path |goto The Barrens 50.83,29.09 < 20 |only if walking
talk Grunt Logmar##5911
turnin Ken'zigla's Draught##1511 |goto The Barrens 44.62,59.27
accept Dogran's Captivity##1515 |goto The Barrens 44.62,59.27
|only if Warlock
step
talk Grunt Dogran##5908
|tip Inside the hut.
turnin Dogran's Captivity##1515 |goto The Barrens 43.31,47.89
accept Love's Gift##1512 |goto The Barrens 43.31,47.89
|only if Warlock
step
Follow the path down |goto Orgrimmar 39.74,53.78 < 20 |walk
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin Love's Gift##1512 |goto Orgrimmar 48.25,45.29
accept The Binding##1513 |goto Orgrimmar 48.25,45.29
|only if Warlock
step
use Dogran's Pendant##6626
|tip Use it while standing on the pink symbol on the ground.
|tip Inside the tent.
kill Summoned Succubus##5677 |q 1513/1 |goto Orgrimmar 49.45,50.03
|only if Warlock
step
talk Gan'rul Bloodeye##5875
|tip Inside the tent.
turnin The Binding##1513 |goto Orgrimmar 48.24,45.29
|only if Warlock
step
ding 30
step
talk Gan'rul Bloodeye##5875
|tip Inside the building.
accept Seeking Strahad##2996 |goto Orgrimmar 48.24,45.30
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Seeking Strahad##2996 |goto The Barrens 62.63,35.50
accept Tome of the Cabal##1801 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Jorah Annison##6293
turnin Tome of the Cabal##1758 |goto Undercity 75.91,37.87
accept Tome of the Cabal##1803 |goto Undercity 75.91,37.87
|only if Warlock
step
Follow the path down |goto Hillsbrad Foothills 36.94,65.37 < 30 |only if walking
click Tome of the Cabal##92013
|tip It looks like a blue book on the ground next to some crates.
collect Moldy Tome##6931 |q 1803/1 |goto Hillsbrad Foothills 27.78,72.78
|only if Warlock
step
Enter the cave |goto Thousand Needles 44.09,37.29 < 10 |walk
click Damaged Chest##92423
collect Tattered Manuscript##6997 |q 1803/2 |goto Thousand Needles 43.43,32.69
|only if Warlock
step
talk Jorah Annison##6293
turnin Tome of the Cabal##1803 |goto Undercity 75.91,37.87
accept Tome of the Cabal##1805 |goto Undercity 75.91,37.87
|only if Warlock
step
Follow the path up |goto Wetlands 42.83,41.04
Kill Dragonmaw enemies around this area
collect 3 Rod of Channeling##6930 |q 1805/1 |goto Wetlands 45.09,43.08
|tip They drop from Dragonmaw Bonewarders and Shadowwarders.
You can find more around here [49.48,48.47]
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Tome of the Cabal##1805 |goto The Barrens 62.63,35.50
accept The Binding##1471 |goto The Barrens 62.63,35.50
|only if Warlock
step
use the Tome of the Cabal##6999
|tip Use it inside the building.
kill Summoned Felhunter##6268 |q 1471/1 |goto The Barrens 62.60,35.28
|only if Warlock
step
talk Strahad Farsan##6251
turnin The Binding##1471 |goto The Barrens 62.63,35.50
|only if Warlock
step
ding 40
step
talk Zevrost##3326
|tip Inside the building.
accept Summon Felsteed##3631 |goto Orgrimmar 48.48,45.44
|only if Warlock
step
Follow the path up |goto The Barrens 61.93,36.72 < 15
talk Strahad Farsan##6251
turnin Summon Felsteed##3631 |goto The Barrens 62.63,35.50
accept Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
talk Strahad Farsan##6251
turnin Summon Felsteed##4490 |goto The Barrens 62.63,35.50
|only if Warlock
step
ding 53
|only if not hardcore
step
ding 55
|only if hardcore
step
collect 1 Fel Cloth##14256 |q 8420 |future
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warlock
step
talk Niby the Almighty##14469
accept What Niby Commands##7601 |goto Felwood 41.38,44.86
|only if Warlock
step
talk Impsy##14470
turnin What Niby Commands##7601 |goto Felwood 41.36,45.02
accept Flawless Fel Essence##7602 |goto Felwood 41.36,45.02
accept Hot and Itchy##8420 |goto Felwood 41.36,45.02
'|accept The Wrong Stuff##8421 |or
|only if Warlock
step
talk Impsy##14470
turnin Hot and Itchy##8420 |goto Felwood 41.36,45.02 |only if haveq(8420) or completedq(8420)
accept The Wrong Stuff##8421 |goto Felwood 41.36,45.02
|only if Warlock
step
kill Tainted Ooze##7092+
collect 4 Bloodvenom Essence##20614 |q 8421/2 |goto Felwood 40.92,46.83
You can find more around here [41.93,49.75]
|only if Warlock
step
Kill enemies around this area
collect 10 Rotting Wood##20613 |q 8421/1 |goto Felwood 46.89,24.16
You can find more around here [52.81,21.50]
|only if Warlock
step
talk Impsy##14470
turnin The Wrong Stuff##8421 |goto Felwood 41.36,45.02
accept Trolls of a Feather##8422 |goto Felwood 41.36,45.02
|only if Warlock
step
Enter the building |goto Felwood 35.39,58.54 < 8 |walk
kill Jaedenar Legionnaire##9862
|tip They are found throughout the Shadow Hold.
|tip Watch for patrols and respawns while in the area.	|only if hardcore
collect Flawless Fel Essence (Jaedenar)##18622 |q 7602/2 |goto Felwood 36.25,55.94
|only if Warlock
step
Kill Legashi enemies around this area
collect Flawless Fel Essence (Azshara)##18624 |q 7602/1 |goto Azshara 52.03,18.65
You can find more around here
[61.22,24.87]
[66.09,16.86]
|only if Warlock
step
kill Felguard Sentry##6011
collect Flawless Fel Essence (Dark Portal)##18623 |q 7602/3 |goto Blasted Lands 61.32,54.18
You can find more around here [54.03,54.60]
|only if Warlock
step
Incoming Dungeon Step
|tip The next couple of steps will be taking you to the Sunken Temple dungeon.
|tip You will need a group to complete the dungeon as well as the quest.
|tip If you don't have a group, wait until you do before continuing.
Click Here to Continue |confirm |q 8236
|only if Warlock and hardcore
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
Enter The Temple of Atal'Hakkar Dungeon with Your Group |goto The Temple of Atal'Hakkar/0 0.00,0.00 < 500 |c |q 8232 |future
|only if Warlock
stickystart "Blue_Voodoo_Feathers"
stickystart "Green_Voodoo_Feathers"
step
Inside the Temple of Atal'Hakkar:
collect 2 Amber Voodoo Feather##20606 |q 8422/1
|tip These come from Gasher and Zul'Lor.
|only if Warlock
step
label "Blue_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Blue Voodoo Feather##20607 |q 8422/2
|tip These come from Mijan and Hukku.
|only if Warlock
step
label "Green_Voodoo_Feathers"
Inside the Temple of Atal'Hakkar:
collect 2 Green Voodoo Feather##20608 |q 8422/3
|tip These come from Zolo and Loro.
|only if Warlock
step
talk Impsy##14470
turnin Flawless Fel Essence##7602 |goto Felwood 41.36,45.02
turnin Trolls of a Feather##8422 |goto Felwood 41.36,45.02
accept Kroshius' Infernal Core##7603 |goto Felwood 41.36,45.02
|only if Warlock
step
Follow the road |goto Felwood 38.76,41.70 < 25 |only if walking
Continue following the road |goto Felwood 39.01,37.86 < 25 |only if walking
Follow the path |goto Felwood 41.25,36.95 < 25 |only if walking
use the Fel Fire##18626
kill Kroshius##14467
|tip You may need help.
collect Kroshius' Infernal Core##18625 |q 7603/1 |goto Felwood 45.73,34.81
|only if Warlock
step
talk Niby the Almighty##14469
turnin Kroshius' Infernal Core##7603 |goto Felwood 41.38,44.86
|only if Warlock
step
ding 60
step
collect 35 Black Dragonscale##15416 |q 7628 |future
|tip These are gathered with the Skinning profession.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warlock
step
collect 10 Elixir of Shadow Power##9264 |q 7626 |future
|tip These are with the Alchemy profession.
|tip It takes 3 Ghost Mushrooms and a Crystal Vial to make one.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warlock
step
collect 6 Large Brilliant Shard##14344 |q 7627 |future
|tip If you have the Enchanting profession, use your Disenchant ability on level 51-60 blue weapons and armor.
|tip You can also buy them from the Auction House. |only if not selfmade
|only if Warlock
step
collect 25 Dark Iron Ore##11370 |q 7627 |future
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warlock
step
collect 3 Arcanite Bar##12360 |q 7630 |future
|tip These are with the Alchemy profession.
|tip It takes 1 Thorium Bar and 1 Arcane Crystal to make one.
|tip Try to find a Alchemist to create one for you.
|tip You can also purchase them from the Auction House. |only if not selfmade
|only if Warlock
step
Collect 250 Gold |complete _G.GetMoney() >= 2500000 |q 7637 |future
|only if Warlock
step
talk Kurgul##5815
accept Mor'zul Bloodbringer##7562 |goto Orgrimmar 47.52,46.73
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Mor'zul Bloodbringer##14436
turnin Mor'zul Bloodbringer##7562 |goto Burning Steppes 12.69,31.64
accept Rage of Blood##7563 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
Enter the cave |goto Winterspring 65.04,18.78 < 10 |walk
Kill Owlbeast enemies around this area
|tip Watch for respawns while in the area. |only if hardcore
collect 30 Raging Beast's Blood##18590 |goto Winterspring 63.65,16.33
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Mor'zul Bloodbringer##14436
turnin Rage of Blood##7563 |goto Burning Steppes 12.69,31.64
accept Wildeyes##7564 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Wildeyes##7564 |goto Burning Steppes 12.43,31.63
accept Lord Banehollow##7623 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Mor'zul Bloodbringer##14436
accept Bell of Dethmoora##7626 |goto Burning Steppes 12.69,31.64
accept Wheel of the Black March##7627 |goto Burning Steppes 12.69,31.64
accept Doomsday Candle##7628 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Bell of Dethmoora##7626 |goto Burning Steppes 12.43,31.63
turnin Wheel of the Black March##7627 |goto Burning Steppes 12.43,31.63
turnin Doomsday Candle##7628 |goto Burning Steppes 12.43,31.63
accept Arcanite##7630 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
turnin Arcanite##7630 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
buy 6 Shadowy Potion##18802 |q 7623 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
use the Shadowy Potion##18802
|tip use it before you enter Shadow Hold.
|tip It will make most enemies inside friendly for 20 minutes.
Enter the building |goto Felwood 35.42,58.61 < 10 |walk
Run down the ramp |goto Felwood 35.47,58.18 < 10 |walk
Run down the ramp |goto Felwood 36.04,56.42 < 10 |walk
Run up the ramp |goto Felwood 36.69,55.99 < 10 |walk
Follow the path down |goto Felwood 36.64,54.91 < 10 |walk
Run down the ramp |goto Felwood 38.19,54.10 < 5 |c |q 7623 |walk
|only if Warlock
step
Follow the path |goto Felwood 37.10,54.04 < 10 |walk
Cross the water |goto Felwood 37.61,52.21 < 10 |walk
Follow the path up |goto Felwood 36.26,52.52 < 10 |walk
Run down the ramp |goto Felwood 37.20,50.82 < 10 |walk
Continue down the ramp |goto Felwood 38.90,49.72 < 10 |c |q 7623 |walk
|only if Warlock
step
Follow the path	|goto Felwood 39.85,49.23 < 10 |walk
Follow the path |goto Felwood 40.04,47.80 < 10 |walk
Follow the path up |goto Felwood 38.56,46.06 < 10 |walk
Follow the path up |goto Felwood 37.43,46.24 < 10 |walk
Cross the bridge |goto Felwood 38.03,46.52 < 10 |walk
Cross the bridge |goto Felwood 37.33,47.22 < 10 |c |q 7623 |walk
|only if Warlock
step
use the Shadowy Potion##18802
|tip You need to have this buff for the next step.
Get the Taint of Shadow Buff |havebuff Taint of Shadow##23179
|only if Warlock
step
talk Lord Banehollow##9516
|tip Inside the cave.
turnin Lord Banehollow##7623 |goto Felwood 35.93,44.41
accept Ulathek the Traitor##7624 |goto Felwood 35.93,44.41
|only if Warlock
step
Cross the bridge |goto Felwood 36.20,46.09 < 10 |walk
Cross the bridge |goto Felwood 37.95,47.27 < 10 |walk
Run down the ramp |goto Felwood 37.94,45.39 < 10 |walk
Follow the path |goto Felwood 37.65,46.62 < 10 |walk
Continue following the path |goto Felwood 39.57,47.05 < 10 |walk
Cross the bridge |goto Felwood 40.06,48.94  < 10 |walk
talk Ulathek##14523
Remove the Taint of Shadow buff |nobuff Taint of Shadow##23179 |q 7624 |goto Felwood 39.89,49.17
|only if Warlock
step
Cross the bridge |goto Felwood 40.02,48.99 < 10
kill Ulathek##14523
collect The Traitor's Heart##18719 |q 7624/1 |goto Felwood 40.77,48.42
|only if Warlock
step
use the Shadowy Potion##18802
Get the Taint of Shadow Buff |havebuff Taint of Shadow##23179 |q 7624
|only if Warlock
step
Cross the bridge |goto Felwood 40.49,48.48 < 10 |walk
Run down the ramp |goto Felwood 40.04,47.71 < 10 |walk
Run up the ramp |goto Felwood 38.49,46.17 < 10 |walk
Follow the path |goto Felwood 38.22,46.82 < 10 |walk
Run up the ramp |goto Felwood 37.35,45.87 < 10 |c |q 7624 |walk
|only if Warlock
step
Cross the bridge |goto Felwood 38.03,46.48 < 10 |walk
Cross the bridge |goto Felwood 37.46,47.35 < 10 |walk
talk Lord Banehollow##9516
|tip Inside the cave.
turnin Ulathek the Traitor##7624 |goto Felwood 35.93,44.41
accept Xorothian Stardust##7625 |goto Felwood 35.93,44.41
|only if Warlock
step
talk Ur'dan##14522
|tip Inside the cave.
buy Xorothian Stardust##18687 |q 7625/1 |goto Felwood 36.17,44.46
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Gorzeeki Wildeyes##14437
turnin Xorothian Stardust##7625 |goto Burning Steppes 12.43,31.63
accept Imp Delivery##7629 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
Incoming Dungeon Steps
|tip The next few steps will send you into 2 different dungeons: Scholomance and then Dire Maul - West.
|tip You will need a group for each instance.
Click Here to Continue |confirm |q 7629 |future
|only if Warlock
step
Enter the Scholomance Dungeon with Your Group |goto Scholomance/0 0.00,0.00 < 500 |c |q 7629
|tip This requires the Skeleton Key from the quest "The Key to Scholomance".
|only if Warlock
step
Inside the Scholomance Dungeon:
use Imp in a Jar##18688
|tip Use it near the Alchemy Station at the start of the room with Ras Frostwhisper.
Watch the dialogue
Create the Parchment |q 7629/1
|only if Warlock
step
Follow the path |goto Burning Steppes 15.46,40.26 < 15 |only if walking
talk Gorzeeki Wildeyes##14437
turnin Imp Delivery##7629 |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Gorzeeki Wildeyes##14437
buy J'eevee's Jar##18663 |q 7631 |future |goto Burning Steppes 12.43,31.63
buy Black Lodestone##18629 |q 7631 |future |goto Burning Steppes 12.43,31.63
buy Xorothian glyphs##18670 |q 7631 |future |goto Burning Steppes 12.43,31.63
|only if Warlock
step
talk Mor'zul Bloodbringer##14436
accept Dreadsteed of Xoroth##7631 |goto Burning Steppes 12.69,31.64
|only if Warlock
step
Incoming Dungeon Steps
|tip The next few steps will send you into 2 different dungeons: Scholomance and then Dire Maul - West.
|tip You will need a group for each instance.
Click Here to Continue |confirm |q 7631 |future
|only if Warlock
step
Run up the ramp |goto Feralas/0 59.13,44.67 < 20 |only if walking
Follow the path |goto Feralas/0 59.52,39.51 < 15 |only if walking
Continue following the path |goto Feralas/0 61.72,38.78 < 15 |only if walking
Continue following the path |goto Feralas/0 61.15,34.87 < 7 |only if walking
click Door |goto Feralas/0 60.32,30.16 < 10 |walk
|tip You need a Crescent Key to unlock this door.
|tip This drops from Pusillin in the "Dire Maul - East" dungeon.
Enter the Dire Maul - West Dungeon with Your Group |goto Dire Maul/0 0.00,0.00 < 500 |c |q 7631
|only if Warlock
step
Inside the Dire Maul - West Dungeon:
use J'eevee's Jar##18663
|tip Use it in the area where Immol'thar is.
|tip Clear the room before starting.
Kill enemies around this area
|tip Focus on Dread Guards as they appear.
|tip They will spawn in waves after using J'eevee's Jar.
|tip Recharge the Bell, Wheel and Candle as they run out of charges.
|tip They will tilt when they need to be recharged.
|tip Use the "Black Lodestone" to fix them, which costs a soul shard.
use Xorothian glyphs##18670
kill Xorothian Dreadsteed##14502
|tip At 50% health, Lord Hel'nurath will appear and need to be killed.
talk Dreadsteed Spirit##14504
turnin Dreadsteed of Xoroth##7631
|only if Warlock
]]
)
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Extra Zones\\Silverpine Forest',
  {
    image = ZGV.IMAGESDIR .. 'Silverpine Forest',
    condition_suggested = function()
      return level >= 18 and level <= 21 and not completedq(516)
    end,
  },
  [[
stickystart "Collect_Discolored_Worg_Hearts"
step
Enter Silverpine Forest |goto Silverpine Forest 67.40,5.82 < 30 |only if walking
Follow the path |goto Silverpine Forest 61.48,10.78 < 30 |only if walking
Enter the building |goto Silverpine Forest 56.30,9.25 < 7 |walk
talk Deathstalker Erland##1978
|tip Inside the building.
|tip This is an escort quest.
|tip If he's not here, someone may be escorting him.
|tip Wait until he respawns.
accept Escorting Erland##435 |goto Silverpine Forest 56.19,9.18 |noautoaccept
step
Watch the dialogue
|tip Follow Deathstalker Erland and protect him as he walks.
|tip He eventually walks to this location.
Erland Must Reach Rane Yorick |q 435/1 |goto Silverpine Forest 54.30,13.43
step
talk Rane Yorick##1950
turnin Escorting Erland##435 |goto Silverpine Forest 53.46,13.43
accept The Deathstalkers' Report##449 |goto Silverpine Forest 53.46,13.43
step
label "Collect_Discolored_Worg_Hearts"
Kill Worg enemies around this area
'|kill Mottled Worg##1766, Worg##1765
|tip They look like black wolves.
collect 6 Discolored Worg Heart##3164 |goto Silverpine Forest 57.05,11.75 |q 429 |future
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[60.92,11.16]
[65.26,8.37]
step
Follow the road |goto Silverpine Forest 54.84,16.67 < 30 |only if walking
Cross the bridge |goto Silverpine Forest 49.77,28.76 < 15 |only if walking
Follow the road |goto Silverpine Forest 50.97,36.80 < 30 |only if walking
talk Karos Razok##2226
fpath The Sepulcher |goto Silverpine Forest 45.62,42.60
step
talk Dalar Dawnweaver##1938
|tip He walks around this area.
accept Prove Your Worth##421 |goto Silverpine Forest 44.20,39.78
step
talk Shadow Priest Allister##2121
accept Border Crossings##477 |goto Silverpine Forest 43.98,40.93
step
talk Innkeeper Bates##6739
home The Sepulcher |goto Silverpine Forest 43.18,41.28 |q 516 |future
step
talk Deathguard Podrig##6389
accept Supplying the Sepulcher##6321 |goto Silverpine Forest 43.43,41.68
|only if Scourge
step
talk Apothecary Renferrel##1937
turnin Delivery to Silverpine Forest##445 |goto Silverpine Forest 42.80,40.87 |only if Scourge
accept A Recipe For Death##447 |goto Silverpine Forest 42.80,40.87
step
Enter the crypt |goto Silverpine Forest 43.09,41.39 < 7 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin The Deathstalkers' Report##449 |goto Silverpine Forest 43.43,40.87
accept Speak with Renferrel##3221 |goto Silverpine Forest 43.43,40.87
accept Lost Deathstalkers##428 |goto Silverpine Forest 43.43,40.87
accept The Dead Fields##437 |goto Silverpine Forest 43.43,40.87
step
Run up the stairs |goto Silverpine Forest 42.70,40.97 < 5 |walk
Leave the crypt |goto Silverpine Forest 43.10,41.38 < 5 |c |q 3221
step
talk Apothecary Renferrel##1937
turnin Speak with Renferrel##3221 |goto Silverpine Forest 42.80,40.87
accept Zinge's Delivery##1359 |goto Silverpine Forest 42.80,40.87
step
talk Karos Razok##2226
turnin Supplying the Sepulcher##6321 |goto Silverpine Forest 45.62,42.60
accept Ride to the Undercity##6323 |goto Silverpine Forest 45.62,42.60
|only if Scourge
step
talk Gordon Wendham##4556
turnin Ride to the Undercity##6323 |goto Undercity 61.49,41.80
accept Michael Garrett##6322 |goto Undercity 61.49,41.80
|only if Scourge
step
talk Michael Garrett##4551
turnin Michael Garrett##6322 |goto Undercity 63.26,48.56
accept Return to Podrig##6324 |goto Undercity 63.26,48.56
|only if Scourge
step
talk Deathguard Podrig##6389
turnin Return to Podrig##6324 |goto Silverpine Forest 43.42,41.68
|only if Scourge
stickystart "Collect_Grizzled_Bear_Hearts"
step
Follow the road |goto Silverpine Forest 46.30,41.43 < 20 |only if walking
kill 5 Moonrage Whitescalp##1769 |q 421/1 |goto Silverpine Forest 49.54,35.83
You can find more around: |notinsticky
[Silverpine Forest 50.87,41.75]
[Silverpine Forest 53.89,39.63]
[Silverpine Forest 54.54,43.80]
[Silverpine Forest 52.26,47.97]
step
label "Collect_Grizzled_Bear_Hearts"
kill Ferocious Grizzled Bear##1778+
collect 6 Grizzled Bear Heart##3253 |q 447/1 |goto Silverpine Forest 49.54,35.83
You can find more around: |notinsticky
[50.87,41.75]
[53.89,39.63]
[54.54,43.80]
[52.26,47.97]
step
Follow the road |goto Silverpine Forest 48.11,39.05 < 30 |only if walking
Follow the path |goto Silverpine Forest 46.22,41.49 < 20 |only if walking
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Prove Your Worth##421 |goto Silverpine Forest 44.20,39.78
accept Arugal's Folly##422 |goto Silverpine Forest 44.20,39.78
step
Follow the road |goto Silverpine Forest 46.29,41.44 < 20 |only if walking
Cross the bridge |goto Silverpine Forest 49.74,30.06 < 15 |only if walking
Enter the building |goto Silverpine Forest 52.81,27.80 < 7 |walk
click Dusty Spellbooks
|tip Upstairs inside the building.
|tip You will be attacked after you loot it.
collect Remedy of Arugal##3155 |q 422/1 |goto Silverpine Forest 52.82,28.58
step
Leave the building |goto Silverpine Forest 52.81,27.80 < 7 |walk
Follow the road |goto Silverpine Forest 51.14,24.36 < 30 |only if walking
talk Rane Yorick##1950
|tip She may be fighting nearby.
turnin Lost Deathstalkers##428 |goto Silverpine Forest 53.46,13.42
accept Wild Hearts##429 |goto Silverpine Forest 53.46,13.42
stickystart "Collect_Essence_Of_Nightlash"
step
Enter the Dead Fields |q 437/2 |goto Silverpine Forest 45.44,21.01
step
label "Collect_Essence_Of_Nightlash"
Kill Rot Hide enemies around this area
kill Nightlash##1983
|tip She will eventually spawn at this location, once you've killed enough Rot Hide enemies.
collect Essence of Nightlash##3622 |q 437/1 |goto Silverpine Forest 45.44,21.01
step
kill Moss Stalker##1780+
|tip Inside and outside the mine.
|tip Be careful of the elite worgen that walks around this area.
collect 6 Skittering Blood##3254 |q 447/2 |goto Silverpine Forest 35.65,13.58
step
talk Apothecary Renferrel##1937
turnin Wild Hearts##429 |goto Silverpine Forest 42.80,40.86
accept Return to Quinn##430 |goto Silverpine Forest 42.80,40.86
step
Enter the crypt |goto Silverpine Forest 43.09,41.39 < 7 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin The Dead Fields##437 |goto Silverpine Forest 43.43,40.87
accept The Decrepit Ferry##438 |goto Silverpine Forest 43.43,40.87
step
Run up the stairs |goto Silverpine Forest 42.70,40.97 < 5 |walk
Leave the crypt |goto Silverpine Forest 43.10,41.38 < 5 |walk
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Arugal's Folly##422 |goto Silverpine Forest 44.20,39.78
accept Arugal's Folly##423 |goto Silverpine Forest 44.20,39.78
step
Follow the path down |goto Undercity 52.84,77.62 < 7 |walk
talk Master Apothecary Faranell##2055
turnin A Recipe For Death##447 |goto Undercity 48.82,69.29
step
talk Apothecary Zinge##5204
turnin Zinge's Delivery##1359 |goto Undercity 50.13,67.99
accept Sample for Helbrim##1358 |goto Undercity 50.13,67.99
step
Follow the road |goto Silverpine Forest 46.22,41.49 < 20 |only if walking
Continue following the road |goto Silverpine Forest 51.33,36.98 < 30 |only if walking
Follow the path |goto Silverpine Forest 52.57,54.58 < 30 |only if walking
click Dalaran Crate
turnin Border Crossings##477 |goto Silverpine Forest 49.91,60.32
accept Maps and Runes##478 |goto Silverpine Forest 49.91,60.32
step
Follow the road |goto Silverpine Forest 52.34,53.55 < 30 |only if walking
Follow the path |goto Silverpine Forest 52.94,40.60 < 30 |only if walking
click Corpse Laden Boat
turnin The Decrepit Ferry##438 |goto Silverpine Forest 58.39,34.84
accept Rot Hide Clues##439 |goto Silverpine Forest 58.39,34.84
step
Follow the road |goto Silverpine Forest 50.40,34.67 < 20 |only if walking
Cross the bridge |goto Silverpine Forest 49.75,30.06 < 15 |only if walking
Enter the building |goto Silverpine Forest 53.40,13.27 < 7 |walk
talk Quinn Yorick##1951
|tip Upstairs inside the building.
turnin Return to Quinn##430 |goto Silverpine Forest 53.43,12.59
step
Leave the building |goto Silverpine Forest 53.40,13.27 < 7 |walk
talk Rane Yorick##1950
accept Ivar the Foul##425 |goto Silverpine Forest 53.46,13.43
step
Enter the building |goto Silverpine Forest 52.00,14.07 < 7 |walk
kill Ivar the Foul##1971
|tip Inside the building.
collect Ivar's Head##3621 |q 425/1 |goto Silverpine Forest 51.53,13.91
step
Leave the building |goto Silverpine Forest 52.00,14.07 < 7 |walk
talk Rane Yorick##1950
turnin Ivar the Foul##425 |goto Silverpine Forest 53.46,13.43
stickystart "Collect_Glutton_Shackles"
step
Follow the road |goto Silverpine Forest 54.25,17.88 < 30 |only if walking
Follow the path |goto Silverpine Forest 51.66,22.55 < 30 |only if walking
kill Moonrage Darksoul##1782+
|tip Be careful of the elite worgen that walks around this area.
collect 3 Darksoul Shackle##3157 |q 423/2 |goto Silverpine Forest 45.98,28.13
You can find more around: |notinsticky
[41.39,29.68]
[38.63,24.59]
step
label "Collect_Glutton_Shackles"
kill Moonrage Glutton##1779+
|tip Be careful of the elite worgen that walks around this area.
collect 6 Glutton Shackle##3156 |q 423/1 |goto Silverpine Forest 45.98,28.13
You can find more around: |notinsticky
[41.39,29.68]
[38.63,24.59]
step
Enter the crypt |goto Silverpine Forest 43.08,41.39 < 5 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
turnin Rot Hide Clues##439 |goto Silverpine Forest 43.43,40.87
accept The Engraved Ring##440 |goto Silverpine Forest 43.43,40.87
step
Run up the stairs |goto Silverpine Forest 42.72,40.91 < 5 |walk
Leave the crypt |goto Silverpine Forest 43.09,41.38 < 5 |walk
talk Shadow Priest Allister##2121
turnin Maps and Runes##478 |goto Silverpine Forest 43.98,40.93
accept Dalar's Analysis##481 |goto Silverpine Forest 43.98,40.93
step
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Arugal's Folly##423 |goto Silverpine Forest 44.19,39.78
accept Arugal's Folly##424 |goto Silverpine Forest 44.19,39.78
turnin Dalar's Analysis##481 |goto Silverpine Forest 44.19,39.78
accept Dalaran's Intentions##482 |goto Silverpine Forest 44.19,39.78
step
talk Shadow Priest Allister##2121
turnin Dalaran's Intentions##482 |goto Silverpine Forest 43.98,40.93
accept Ambermill Investigations##479 |goto Silverpine Forest 43.98,40.93
step
Follow the road |goto Silverpine Forest 46.24,41.51 < 20 |only if walking
Continue following the road |goto Silverpine Forest 51.43,37.17 < 30 |only if walking
Follow the path |goto Silverpine Forest 54.47,48.06 < 15 |only if walking
Follow the path up |goto Silverpine Forest 55.82,48.47 < 15 |only if walking
Enter the mine |goto Silverpine Forest 56.54,46.01 < 7 |walk
kill Grimson the Pale##1972
|tip Inside the mine.
collect Head of Grimson##3634 |q 424/1 |goto Silverpine Forest 58.58,44.85
step
Leave the mine |goto Silverpine Forest 56.54,46.01 < 7 |walk
Follow the road |goto Silverpine Forest 53.00,56.46 < 30 |only if walking
Follow the path |goto Silverpine Forest 54.06,61.14 < 30 |only if walking
Kill Dalaran enemies around this area
collect 8 Dalaran Pendant##3354 |q 479/1 |goto Silverpine Forest 59.13,64.34
step
Follow the road |goto Silverpine Forest 53.51,59.48 < 30 |only if walking
Continue following the road |goto Silverpine Forest 49.38,38.02 < 30 |only if walking
Follow the path |goto Silverpine Forest 46.26,41.52 < 20 |only if walking
talk Dalar Dawnweaver##1938
|tip He walks around this area.
turnin Arugal's Folly##424 |goto Silverpine Forest 44.19,39.78
step
talk Shadow Priest Allister##2121
turnin Ambermill Investigations##479 |goto Silverpine Forest 43.98,40.94
step
Enter the building |goto Tirisfal Glades 60.90,51.51 < 7 |walk
talk Magistrate Sevren##1499
|tip Inside the building.
turnin The Engraved Ring##440 |goto Tirisfal Glades 61.26,50.85
accept Raleigh and the Undercity##441 |goto Tirisfal Glades 61.26,50.85
step
Leave the building |goto Tirisfal Glades 60.90,51.51 < 7 |walk
Enter the cave |goto Thunder Bluff 29.84,29.88 < 7 |walk
talk Clarice Foster##5543
|tip She walks around this area inside the cave.
accept Until Death Do Us Part##264 |goto Thunder Bluff 24.72,22.30
step
Leave the cave |goto Thunder Bluff 29.84,29.88 < 7 |walk
talk Raleigh Andrean##2050
turnin Raleigh and the Undercity##441 |goto Undercity 61.99,42.72
accept A Husband's Revenge##530 |goto Undercity 61.99,42.72
step
click Yuriv's Tombstone
turnin Until Death Do Us Part##264 |goto Silverpine Forest 44.20,42.69
step
Enter the crypt |goto Silverpine Forest 43.10,41.39 < 7 |walk
talk High Executor Hadrec##1952
|tip Downstairs inside the crypt.
accept Rot Hide Ichor##443 |goto Silverpine Forest 43.43,40.87
step
Run up the stairs |goto Silverpine Forest 42.71,40.95 < 5 |walk
Leave the crypt |goto Silverpine Forest 43.10,41.38 < 5 |walk
Follow the road |goto Silverpine Forest 46.32,41.47 < 20 |only if walking
Continue following the road |goto Silverpine Forest 52.86,43.74 < 30 |only if walking
kill Valdred Moray##2332
|tip He walks around this area.
collect Valdred's Hands##3613 |q 530/1 |goto Silverpine Forest 45.88,84.92
stickystart "Collect_Rot_Hide_Ichors"
step
Follow the path up |goto Silverpine Forest 51.95,72.25 < 20 |only if walking
Follow the road |goto Silverpine Forest 53.70,71.60 < 30 |only if walking
Continue following the road |goto Silverpine Forest 51.91,50.20 < 40 |only if walking
Follow the path |goto Silverpine Forest 55.16,38.10 < 30 |only if walking
Follow the path up |goto Silverpine Forest 64.59,32.37 < 20 |only if walking
Kill Rot Hide enemies around this area
collect A Talking Head##3317 |goto Silverpine Forest 68.31,35.72 |q 460 |future
You can find more around [65.74,30.02]
step
use A Talking Head##3317
accept Resting in Pieces##460
step
label "Collect_Rot_Hide_Ichors"
Kill Rot Hide enemies around this area
collect 8 Rot Hide Ichor##3236 |q 443/1 |goto Silverpine Forest 65.74,30.02
You can find more around [68.31,35.72]
step
Follow the path |goto Silverpine Forest 65.78,30.02 < 15 |only if walking
Continue following the path |goto Silverpine Forest 66.05,27.00 < 15 |only if walking
Continue following the path |goto Silverpine Forest 67.28,24.62 < 10 |only if walking
click A Shallow Grave
turnin Resting in Pieces##460 |goto Silverpine Forest 67.86,24.84
accept The Hidden Niche##461 |goto Silverpine Forest 67.86,24.84
step
Follow the path |goto Silverpine Forest 67.22,24.67 < 15 |only if walking
Enter the building |goto Silverpine Forest 65.74,24.98 < 10 |only if walking
Run up the stairs |goto Silverpine Forest 65.69,23.37 < 5 |only if walking
Run up the stairs |goto Silverpine Forest 65.33,23.31 < 5 |only if walking
click Dusty Shelf
|tip It looks like an empty wooden bookcase.
|tip On the roof of the building, in a side room.
turnin The Hidden Niche##461 |goto Silverpine Forest 65.34,24.81
accept Wand to Bethor##491 |goto Silverpine Forest 65.34,24.81
step
talk Apothecary Renferrel##1937
turnin Rot Hide Ichor##443 |goto Silverpine Forest 42.80,40.86
accept Rot Hide Origins##444 |goto Silverpine Forest 42.80,40.86
step
talk Raleigh Andrean##2050
turnin A Husband's Revenge##530 |goto Undercity 61.99,42.72
step
talk Bethor Iceshard##1498
|tip At the top of the stairs.
turnin Rot Hide Origins##444 |goto Undercity 84.09,17.47
turnin Wand to Bethor##491 |goto Undercity 84.09,17.47
step
talk Shadow Priest Allister##2121
accept Beren's Peril##516 |goto Silverpine Forest 43.98,40.93
step
talk Apothecary Renferrel##1937
accept Journey to Hillsbrad Foothills##493 |goto Silverpine Forest 42.80,40.87
stickystart "Kill_Ravenclaw_Guardians"
step
Follow the road |goto Silverpine Forest 46.46,41.31 < 20 |only if walking
Continue following the road |goto Silverpine Forest 52.93,42.41 < 30 |only if walking
Continue following the road |goto Silverpine Forest 54.93,75.62 < 30 |only if walking
Follow the path up |goto Silverpine Forest 60.35,74.70 < 10 |only if walking
Enter the cave |goto Silverpine Forest 60.44,72.37 < 10 |walk
kill 6 Ravenclaw Drudger##1974 |q 516/1 |goto Silverpine Forest 59.48,70.59
|tip Inside and outside the cave.
step
label "Kill_Ravenclaw_Guardians"
kill 6 Ravenclaw Guardian##1973 |q 516/2 |goto Silverpine Forest 59.48,70.59
|tip Inside the cave.
step
Leave the cave |goto Silverpine Forest 60.44,72.37 < 10 |walk
Follow the road |goto Silverpine Forest 58.88,77.75 < 30 |only if walking
Continue following the road |goto Silverpine Forest 53.71,72.61 < 30 |only if walking
Continue following the road |goto Silverpine Forest 51.91,50.20 < 30 |only if walking
Continue following the road |goto Silverpine Forest 50.83,37.00 < 50 |only if walking
talk Shadow Priest Allister##2121
turnin Beren's Peril##516 |goto Silverpine Forest 43.98,40.93
]]
)
