local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("LevelingHCLASSIC") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Startup Guide Wizard")
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Undead Starter (1-14)",{
image=ZGV.IMAGESDIR.."Tirisfal Glades",
condition_suggested=function() return raceclass('Scourge') and level <= 12 end,
condition_suggested_race=function() return raceclass('Scourge') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\The Barrens (12-18)",
hardcore = true,
},[[
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
Enter the building |goto Tirisfal Glades 31.39,66.20 < 10 |walk
talk Shadow Priest Sarvis##1569
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
kill 8 Mindless Zombie##1501 |q 364/1 |goto Tirisfal Glades 31.96,63.30
step
label "Kill_Wretched_Zombies"
kill 8 Wretched Zombie##1502 |q 364/2 |goto Tirisfal Glades 31.96,63.30
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
accept The Lost Rune##77672 |goto Tirisfal Glades 30.91,66.34 |only if ZGV.IsClassicSoD
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
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 10 |walk
talk David Trias##2122
|tip Inside the building.
turnin Encrypted Scroll##3096 |goto Tirisfal Glades 32.53,65.65
accept The Scarlet Rune##77669 |goto Tirisfal Glades 32.53,65.65
|only if Scourge Rogue and ZGV.IsClassicSoD
step
kill Scarlet Convert##1506+
|tip They look like humans.
|tip You can also pickpocket them.
collect Rune of Shadowstrike##204795 |goto Tirisfal Glades 36.89,67.82 |q 77669
|only if Scourge Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn Engrave Gloves - Shadowstrike |q 77669/1
|only if Scourge Rogue and ZGV.IsClassicSoD
step
Enter the building |goto Tirisfal Glades 32.22,65.62 < 10 |walk
talk David Trias##2122
|tip Inside the building.
turnin The Scarlet Rune##77669 |goto Tirisfal Glades 32.53,65.65
|only if Scourge Rogue and ZGV.IsClassicSoD
step
talk Dark Cleric Duesten##2123
|tip Inside the building.
turnin Hallowed Scroll##3097 |goto Tirisfal Glades 31.11,66.03
accept Meditation on Undeath##77670 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest and ZGV.IsClassicSoD
step
Gain the Meditation on Undeath Buff |complete hasbuff(418459) |goto Tirisfal Glades 31.46,64.90
|tip Use the "/kneel" emote at this location.
|only if Scourge Priest and ZGV.IsClassicSoD
step
use the Memory of a Troubled Acolyte##205951
Learn Spell: Engrave Gloves - Penance |q 77670/1 |goto Tirisfal Glades 31.46,64.90
|only if Scourge Priest and ZGV.IsClassicSoD
step
Enter the building |goto Tirisfal Glades 31.39,66.20 < 10 |walk
talk Dark Cleric Duesten##2123
|tip Inside the building.
turnin Meditation on Undeath##77670 |goto Tirisfal Glades 31.11,66.03
|only if Scourge Priest and ZGV.IsClassicSoD
step
talk Isabella##2124
|tip Inside the building.
turnin Glyphic Scroll##3098 |goto Tirisfal Glades 30.94,66.06
accept Spell Research##77671 |goto Tirisfal Glades 30.93,66.06
|only if Scourge Mage and ZGV.IsClassicSoD
step
kill Scarlet Initiate##1507+
|tip They look like humans.
collect Spell Notes: CALE ENCI##203751 |goto Tirisfal Glades 36.89,67.82 |q 77671
|only if Scourge Mage and ZGV.IsClassicSoD
step
use the Spell Notes: CALE ENCI##203751
Learn: Engrave Gloves - Ice Lance |q 77671/1
|only if Scourge Mage and ZGV.IsClassicSoD
step
Enter the building |goto Tirisfal Glades 31.39,66.20 < 10 |walk
talk Isabella##2124
turnin Spell Research##77671 |goto Tirisfal Glades 30.93,66.06
|only if Scourge Mage and ZGV.IsClassicSoD
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
Enter the mine |goto Tirisfal Glades 26.84,59.42 < 15 |walk
click Lost Stash##406736
|tip Inside the mine.
collect Rune of Haunting##205230 |goto Tirisfal Glades 24.60,59.45 |q 77672
|only if Scourge Warlock and ZGV.IsClassicSoD
step
use the Rune of Haunting##205230
Learn Engrave Gloves - Haunt |q 77672/1
|only if Scourge Warlock and ZGV.IsClassicSoD
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
Enter the building |goto Tirisfal Glades 31.38,66.20 < 10 |walk
talk Maximillion##2126
|tip Inside the building.
turnin The Lost Rune##77672 |goto Tirisfal Glades 30.91,66.34
|only if Scourge Warlock and ZGV.IsClassicSoD
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
|tip These mobs can be tougher than normal, go slow and let yourself heal after each fight. |only if Hardcore
|tip Beware of the rare spawn ghost that can spawn on the field, it does a lot of damage. |only if Hardcore
step
label "Kill_Wandering_Spirits"
kill 8 Wandering Spirit##1532 |q 356/2 |goto Tirisfal Glades 75.54,60.85
|tip These mobs can be tougher than normal, go slow and let yourself heal after each fight. |only if Hardcore
|tip Beware of the rare spawn ghost that can spawn on the field, it does a lot of damage. |only if Hardcore
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
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Tauren Starter (1-12)",{
image=ZGV.IMAGESDIR.."Mulgore",
condition_suggested=function() return raceclass('Tauren') and level <= 12 end,
condition_suggested_race=function() return raceclass('Tauren') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\The Barrens (12-18)",
hardcore = true,
},[[
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
talk Meela Dawnstrider##3062
|tip Inside the building.
turnin Rune-Inscribed Note##3093 |goto Mulgore 45.01,75.94
accept Icons of Power##77652 |goto Mulgore 45.01,75.94
|only if Tauren Shaman and ZGV.IsClassicSoD
step
talk Gart Mistrunner##3060
|tip Inside the building.
turnin Verdant Note##3094 |goto Mulgore 45.09,75.93
accept Relics of the Tauren##77648 |goto Mulgore 45.09,75.93
|only if Tauren Druid and ZGV.IsClassicSoD
step
Enter the building |goto Mulgore 44.32,76.21 < 7 |walk
talk Chief Hawkwind##2981
|tip Inside the building.
turnin A Humble Task##753 |goto Mulgore 44.18,76.06
accept Rites of the Earthmother##755 |goto Mulgore 44.18,76.06
step
talk Grull Hawkwind##2980
|tip Inside the building.
turnin Simple Note##3091 |goto Mulgore 44.01,76.13
|only if Tauren Warrior and ZGV.IsClassicSoD
step
talk Lanka Farshot##3061
|tip Inside the building.
turnin Etched Note##3092 |goto Mulgore 44.26,75.69
accept A Hunter's Strength##77649 |goto Mulgore 44.26,75.69
|only if Tauren Hunter and ZGV.IsClassicSoD
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
step
_NOTE:_
Learn the Moonfire Ability
|tip Make sure to learn the Moonfire ability from your class trainer.
|tip You will need it to get a rune soon.
Click Here to Continue |confirm
|only if Tauren Druid and ZGV.IsClassicSoD
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
kill Bristleback Shaman##2953+
|tip They look like quilboars wearing purple robes around this area.
|tip They seem to mostly be inside or near buildings.
collect Dyadic Icon##206381 |goto Mulgore 64.40,79.09 |q 77652
|only if Tauren Shaman and ZGV.IsClassicSoD
step
Equip the Dyadic Icon |equipped Dyadic Icon##206381 |q 77652
|only if Tauren Shaman and ZGV.IsClassicSoD
step
kill Bristleback Shaman##2953+
|tip They look like quilboars wearing purple robes around this area.
|tip They seem to mostly be inside or near buildings.
|tip They will use abilities that deal Nature damage.
|tip You will gain a buff.
|tip Repeat this process until you have 10 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Mulgore 64.40,79.09 |q 77652
|only if Tauren Shaman and ZGV.IsClassicSoD
step
use the Dyadic Icon##206381
Learn: Engrave Chest - Overload |q 77652/1
|only if Tauren Shaman and ZGV.IsClassicSoD
step
Follow the path up |goto Mulgore 62.19,75.79 < 15 |walk
click Bristlebark Loot Cache##403102
|tip It looks like a brown wooden chest.
|tip Up on the plateau.
collect Lunar Idol##208414 |goto Mulgore 61.61,76.02 |q 77648
|only if Tauren Druid and ZGV.IsClassicSoD
step
Equip the Lunar Idol |equipped Lunar Idol##208414 |q 77648
|only if Tauren Druid and ZGV.IsClassicSoD
step
Kill enemies around this area
|tip Make sure they die while affected by your "Moonfire" ability.
|tip You will gain a buff.
|tip Repeat this process until you have 6 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Mulgore 46.36,82.84 |q 77648
|only if Tauren Druid and ZGV.IsClassicSoD
step
use the Lunar Idol##208414
Learn Engrave Chest - Fury of Stormrage |q 77648/1
|only if Tauren Druid and ZGV.IsClassicSoD
step
label "Learn_Chimera_Shot_Tauren_Hunter"
kill Bristleback Battleboar##2954+
|tip They look like tan boars.
collect Rune of the Chimera##206168 |n
use the Rune of the Chimera##206168
Learn Engrave Gloves - Chimera Shot |q 77649/1 |goto Mulgore 63.58,78.00
|only if Tauren Hunter and ZGV.IsClassicSoD
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
talk Meela Dawnstrider##3062
|tip Inside the hut.
turnin Icons of Power##77652 |goto Mulgore 45.01,75.94
|only if Tauren Shaman and ZGV.IsClassicSoD
step
talk Seer Ravenfeather##5888
turnin Call of Earth##1519 |goto Mulgore 44.73,76.19
accept Call of Earth##1520 |goto Mulgore 44.73,76.19
|only if Tauren Shaman
step
talk Gart Mistrunner##3060
|tip Inside the building.
turnin Relics of the Tauren##77648 |goto Mulgore 45.09,75.93
|only if Tauren Druid and ZGV.IsClassicSoD
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
talk Lanka Farshot##3061
|tip Inside the building.
turnin A Hunter's Strength##77649 |goto Mulgore 44.26,75.69
|only if Tauren Hunter and ZGV.IsClassicSoD
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
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Orc & Troll Starter (1-12)",{
image=ZGV.IMAGESDIR.."Durotar",
condition_suggested=function() return raceclass{'Orc','Troll'} and level <= 12 end,
condition_suggested_race=function() return raceclass{'Orc','Troll'} end,
condition_suggested_exclusive=true,
next="Leveling Guides\\The Barrens (12-18)",
hardcore = true,
},[[
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
talk Ken'jai##3707
accept Wisdom of the Loa##77642 |goto Durotar 42.36,68.81
|only if Troll Priest and ZGV.IsClassicSoD
step
Leave the Valley of Trials |goto Durotar 49.59,68.29 < 20 |only if walking
talk Serpent Loa##208307
|tip Target the Loa Altar.
|tip It looks like a stone pedastal with 2 stone snakes on top of it.
|tip Use the "/kneel" emote while standing next to it.
|tip The Serpent Loa looks like a snake that appears next to the altar.
Select _"Thank you, great spirit. (Receive Blessing of the Loa)"_
Gain the Meditation on the Loa |complete hasbuff(417316) |goto Durotar 55.35,72.73 |q 77642
|tip You will gain a buff that allows you to learn Priest runes.
|only if Troll Priest and ZGV.IsClassicSoD
step
use the Memory of a Troubled Acolyte##205951
Learn Spell: Engrave Gloves - Penance |q 77642/1
|only if Troll Priest and ZGV.IsClassicSoD
step
Enter the Valley of Trials |goto Durotar 49.59,68.29 < 20 |only if walking
talk Ken'jai##3707
turnin Wisdom of the Loa##77642 |goto Durotar 42.36,68.81
|only if Troll Priest and ZGV.IsClassicSoD
step
Enter the cave |goto Durotar 42.28,68.43 < 10 |walk
talk Rwag##3155
|tip Inside the cave.
accept Atop the Cliffs##77583 |goto Durotar 41.28,68.00
|only if Orc Rogue and ZGV.IsClassicSoD
step
Enter the cave |goto Durotar 42.28,68.43 < 10 |walk
talk Rwag##3155
|tip Inside the cave.
accept Atop the Cliffs##77592 |goto Durotar 41.28,68.00
|only if Troll Rogue and ZGV.IsClassicSoD
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
Jump down carefully to the ledge below, then jump over to the ledge with the chest |goto Durotar 42.86,69.78 < 10 |only if walking
click Hidden Cache
|tip It looks like a wooden chest up on a ledge.
collect Rune of Shadowstrike##204795 |goto Durotar 43.25,69.57 |q 77583
|only if Orc Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn Engrave Gloves - Shadowstrike |q 77583/1
|only if Orc Rogue and ZGV.IsClassicSoD
step
Jump down carefully to the ledge below, then jump over to the ledge with the chest |goto Durotar 42.86,69.78 < 10 |only if walking
click Hidden Cache
|tip It looks like a wooden chest up on a ledge.
collect Rune of Shadowstrike##204795 |goto Durotar 43.25,69.57 |q 77592
|only if Troll Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn Engrave Gloves - Shadowstrike |q 77592/1
|only if Troll Rogue and ZGV.IsClassicSoD
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
turnin Atop the Cliffs##77583 |goto Durotar 41.28,68.00 |only if ZGV.IsClassicSoD
|only if Orc Rogue
step
talk Rwag##3155
|tip Inside the cave.
turnin Encrypted Tablet##3083 |goto Durotar 41.28,68.00
turnin Atop the Cliffs##77592 |goto Durotar 41.28,68.00 |only if ZGV.IsClassicSoD
|only if Troll Rogue
step
talk Nartok##3156
|tip Inside the cave.
turnin Tainted Parchment##3090 |goto Durotar 40.65,68.51
accept Stolen Power##77586 |goto Durotar 40.65,68.51 |only if ZGV.IsClassicSoD
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
accept Spell Research##77643 |goto Durotar 42.51,69.04 |only if ZGV.IsClassicSoD
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
accept Hunt for the Rune##77584 |goto Durotar 42.83,69.33 |only if ZGV.IsClassicSoD
|only if Orc Hunter
step
talk Jen'shan##3154
turnin Etched Tablet##3082 |goto Durotar 42.84,69.32
accept Rugged Terrain##77590 |goto Durotar 42.83,69.33 |only if ZGV.IsClassicSoD
|only if Troll Hunter
step
talk Foreman Thazz'ril##11378
|tip You must be level 3 before this quest is available.
accept Lazy Peons##5441 |goto Durotar 44.62,68.64
step
talk Shikrik##3157
turnin Rune-Inscribed Parchment##3089 |goto Durotar 42.39,69.00
accept Icons of Power##77585 |goto Durotar 42.39,69.00
|only if Orc Shaman and ZGV.IsClassicSoD
stickystart "Collect_Scorpid_Worker_Tails"
step
kill Scorpid Worker##3124+
|tip They look like scorpions.
collect Dyadic Icon##206381 |goto Durotar 40.80,62.65 |q 77585
|only if Orc Shaman and ZGV.IsClassicSoD
step
Equip the Dyadic Icon |equipped Dyadic Icon##206381 |q 77585
|only if Orc Shaman and ZGV.IsClassicSoD
step
kill Scorpid Worker##3124+
|tip They look like scorpions.
|tip They will use abilities that deal Nature damage.
|tip You will gain a buff.
|tip Repeat this process until you have 10 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Durotar 40.80,62.65 |q 77585
|only if Orc Shaman and ZGV.IsClassicSoD
stickystop "Collect_Scorpid_Worker_Tails"
step
use the Dyadic Icon##206381
Learn: Engrave Chest - Overload |q 77585/1
|only if Orc Shaman and ZGV.IsClassicSoD
step
talk Shikrik##3157
turnin Rune-Inscribed Tablet##3084 |goto Durotar 42.39,69.00
accept Icons of Power##77587 |goto Durotar 42.39,69.00
|only if Troll Shaman and ZGV.IsClassicSoD
stickystart "Collect_Scorpid_Worker_Tails"
step
kill Scorpid Worker##3124+
|tip They look like scorpions.
collect Dyadic Icon##206381 |goto Durotar 40.80,62.65 |q 77587
|only if Troll Shaman and ZGV.IsClassicSoD
step
Equip the Dyadic Icon |equipped Dyadic Icon##206381 |q 77587
|only if Troll Shaman and ZGV.IsClassicSoD
step
kill Scorpid Worker##3124+
|tip They look like scorpions.
|tip They will use abilities that deal Nature damage.
|tip You will gain a buff.
|tip Repeat this process until you have 10 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Durotar 40.80,62.65 |q 77587
|only if Troll Shaman and ZGV.IsClassicSoD
stickystop "Collect_Scorpid_Worker_Tails"
step
use the Dyadic Icon##206381
Learn: Engrave Chest - Overload |q 77587/1
|only if Troll Shaman and ZGV.IsClassicSoD
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
label "Learn_Chimera_Shot_Orc"
kill Scorpid Worker##3124+
|tip They look like scorpions. |notinsticky
collect Rune of the Chimera##206168 |n
use the Rune of the Chimera##206168
Learn Engrave Gloves - Chimera Shot |q 77584/1 |goto Durotar 40.71,62.45
|only if Orc Hunter and ZGV.IsClassicSoD
step
label "Learn_Chimera_Shot_Troll"
kill Scorpid Worker##3124+
|tip They look like scorpions. |notinsticky
collect Rune of the Chimera##206168 |n
use the Rune of the Chimera##206168
Learn Engrave Gloves - Chimera Shot |q 77590/1 |goto Durotar 40.71,62.45
|only if Troll Hunter and ZGV.IsClassicSoD
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
talk Jen'shan##3154
turnin Hunt for the Rune##77584 |goto Durotar 42.83,69.33
|only if Orc Hunter and ZGV.IsClassicSoD
step
talk Jen'shan##3154
turnin Rugged Terrain##77590 |goto Durotar 42.83,69.33
|only if Troll Hunter and ZGV.IsClassicSoD
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
click Waterlogged Stashbox##404695
|tip It looks like a chest, underwater in a small nook.
|tip Inside the cave.
collect Rune of Haunting##205230 |goto Durotar 43.00,54.46 |q 77586
|only if Orc Warlock and ZGV.IsClassicSoD
step
use the Rune of Haunting##205230
Learn Spell: Engrave Gloves - Haunt |q 77586/1
|only if Orc Warlock and ZGV.IsClassicSoD
step
click Waterlogged Stashbox##404695
|tip It looks like a chest, underwater in a small nook.
|tip Inside the cave.
collect Spell Notes: CALE ENCI##203751 |goto Durotar 43.00,54.46 |q 77643
|only if Troll Mage and ZGV.IsClassicSoD
step
use the Spell Notes: CALE ENCI##203751
Learn: Engrave Gloves - Ice Lance |q 77643/1
|only if Troll Mage and ZGV.IsClassicSoD
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
turnin Stolen Power##77586 |goto Durotar 40.65,68.51
|only if Orc Warlock and ZGV.IsClassicSoD
step
Enter the cave |goto Durotar 42.29,68.43 < 10 |walk
talk Nartok##3156
|tip Inside the cave.
learnspell Life Tap##1454 |goto Durotar 40.65,68.51
learnspell Shadow Bolt##695 |goto Durotar 40.65,68.51
|only if Warlock and level >= 6
step
talk Mai'ah##5884
turnin Spell Research##77643 |goto Durotar 42.51,69.04
|only if Troll Mage and ZGV.IsClassicSoD
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
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Barrens (12-18)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (18-19)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Barrens (19-20)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (20-21)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (21-22)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (22-24)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Barrens (24-26)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (26-27)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (27-28)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Thousand Needles (28-30)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (30-32)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands (32-33)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Thousand Needles (33-34)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Desolace (34-36)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (36-37)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (37-38)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Alterac Mountains (38-38)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands (38-39)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Badlands (39-40)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (40-40)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Swamp of Sorrows (40-41)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Desolace (41-41)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (41-42)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (42-42)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (42-43)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (43-44)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (44-45)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Swamp of Sorrows (45-46)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (46-48)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (48-48)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Hinterlands (48-49)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (49-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (50-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (50-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Blasted Lands (50-51)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Searing Gorge (51-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Burning Steppes (52-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Azshara (52-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood (52-53)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (53-53)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood (53-53)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (53-54)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (54-54)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Azshara (54-54)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood (54-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring Part 2 (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (55-56)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Eastern Plaguelands (56-57)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (57-58)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (58-59)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Silithus (59-60)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Chest Quest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Scepter of the Shifting Sands")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Signet Ring of the Bronze Dragonflight")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ahn'Qiraj Gear\\Cenarion Battlegear")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Combat Assignments")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Tactical Assignments")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Cenarion Field Duty Logistics Assignments")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Druid Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Priest Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Warrior Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Hunter Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Mage Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Rogue Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Shaman Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Warlock Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Extra Zones\\Silverpine Forest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Consumed by Rage [Wetlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Endless Rage [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Flagellation [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Thunder Bluff)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Tirisfal Glades)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault (Orgrimmar)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Durotar)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Mulgore)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder (Tirisfal Glades)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Quick Strike [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Raging Blow [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Single-Minded Fury")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Blood Surge")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Enraged Regeneration")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Focused Rage [Arathi Highlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Intervene [Thousand Needles]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Precise Timing")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Rallying Cry [Badlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Rampage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Sword and Board")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Shield Mastery")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Gladiator Stance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Wrecking Crew")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Taste for Blood")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 3 Runes\\Vigilance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Fresh Meat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Sudden Death")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Shockwave")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 4 Runes\\Commanding Shout (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Orgrimmar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Blade Dance [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Deadly Brew [Silvepine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Envenom [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Just a Flesh Wound")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Main Gauche [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [Silverpine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Orc Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Troll Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Undead Only) [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shiv [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Master of Subtlety [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Poisoned Knife")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Rolling with the Punches [Thousand Needles]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shadowstep")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shuriken Toss [Swamp of Sorrows]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Waylay")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Combat Potency")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Carnage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Unfair Advantage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Focused Attacks")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Honor Among Thieves")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 3 Runes\\Cut to the Chase")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Blunderbuss")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Crimson Tempest")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Fan of Knives")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Redirect (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Atrophic Poison (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Numbing Poison (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Occult Poison (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 4 Runes\\Sebacious Poison (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Troll Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Undead Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Circle of Healing [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Mind Sear")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Troll Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Undead Only) [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Power Word: Barrier [Redridge Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Prayer of Mending [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Serendipity [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shadow Word: Death [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Strength of Soul [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Twisted Faith [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Dispersion [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Empowered Renew [Alterac Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Mind Spike")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Pain Suppression")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Renewed Hope [Desolace]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Spirit of the Redeemer")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Divine Aegis")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Surge of Light")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Eye of the Void")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Pain and Suffering")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Despair")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 3 Runes\\Void Zone")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Binding Heal")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Soul Warding")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Vampiric Touch")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Increased Fortitude (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 4 Runes\\Shadowfiend (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Arcane Blast [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Arcane Surge")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Enlightenment [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Icy Veins")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Bomb [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Mass Regeneration [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [Silverpine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Rewind Time [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Brain Freeze [Various Zones]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Chronostatic Preservation [Thousand Needles]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Frostfire Bolt [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Hot Streak [Alterac Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Missile Barrage [Deadwind Pass]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spellfrost Bolt [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spell Power [Various Zones]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Advanced Warding")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Balefire Bolt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Displacement")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Deep Freeze")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Temporal Anomaly")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 3 Runes\\Molten Armor")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Arcane Barrage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Overheat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Frozen Orb")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Expanded Intellect (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Pact [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Tactics [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Everlasting Affliction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Orc Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Undead Only) [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Incinerate [Redridge Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Lake of Fire [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [Silverpine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Metamorphosis [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [Silverpine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Tirisfal Glades]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Dance of the Wicked [Thousand Needles]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Demonic Knowledge")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Grimoire of Synergy")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Invocation [Arathi Highlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadow and Flame")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadowflame [Desolace]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Summon Felguard")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Vengeance")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Explorer Imp & Fel Portal Locations")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Immolation Aura")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Unstable Affliction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Backdraft")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Pandemic")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Decimation")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Mark of Chaos")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Infernal Armor")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Fel Armor (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Portal of Summoning (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 4 Runes\\Soul Harvesting (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Cobra Slayer [Wetlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [Silverpine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Orc Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Troll Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Tauren Only) [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Cobra Strikes [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Kill Shot [Stonetalon Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Lone Wolf [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Serpent Spread")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Sniper Training [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Dual Wield Specialization [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Expose Weakness")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Wyvern Strike")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Melee Specialist")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Steady Shot [Arathi Highlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Trap Launcher")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Focus Fire")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Raptor Fury")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\T.N.T.")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Catlike Reflexes")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Lock and Load")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 3 Runes\\Rapid Killing Rune & Core Hound Pet")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Improved Volley")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Resourcefulness")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Hit and Run")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Aspect of the Viper (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 4 Runes\\Heart of the Lion (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Fury of Stormrage (Tauren Only) [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lacerate [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lifebloom [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Living Seed [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Mangle [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Savage Roar [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Skull Bash")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Starsurge [Wetlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Sunfire [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Survival of the Fittest [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Wild Growth [Moonglade]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Wild Strikes [Stonetalon Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Berserk [Thousand Needles]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Dreamstate [Desolace]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Eclipse")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\King of the Jungle")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Nourish")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Survival Instincts")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Efflorescence")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Elune's Fires")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Improved Frenzied Regeneration")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Gale Winds")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Gore")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 3 Runes\\Improved Barkskin")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Ancestral Guidance [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Ancestral Guidance [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Dual Wield Specialization [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Earth Shield [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Healing Rain")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Lava Burst [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Dual Wield & Lava Lash [Thunder Bluff]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Molten Blast [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Molten Blast [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Orc Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Troll Only) [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Overload (Tauren Only) [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Greater Ghost Wolf [Stonetalon Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Shield Mastery [Durotar]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Shield Mastery [Mulgore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Water Shield [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Way of Earth [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Ancestral Awakening")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Decoy Totem")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Fire Nova")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Maelstrom Weapon")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Power Surge")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Spirit of the Alpha")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Two-Handed Mastery")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Riptide")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Burn")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Overcharged")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Rolling Thunder")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Static Shock")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Mental Dexterity")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 3 Runes\\Tidal Waves")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Storm, Earth, and Fire")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Feral Spirit")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Coherence")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Shamanistic Rage (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 4 Runes\\Totemic Projection (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Arcane Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Axe Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Dagger Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Defense Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Feral Combat Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Fire Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Fist Weapon Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Frost Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Holy Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Mace Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Nature Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Pole Weapon Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Ranged Weapon Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Shadow Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 4 Ring Runes\\Rune of Sword Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 5 Ring Runes\\Rune of Meditation Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Phase 5 Ring Runes\\Rune of Healing Specialization")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Items\\Cozy Sleeping Bag")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Items\\Wild Offering (Currency)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Ashenvale Nightmare Incursion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Duskwood Nightmare Incursion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Hinterlands Nightmare Incursion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Nightmare Incursion\\Feralas Nightmare Incursion")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling\\Season of Discovery Phase 4 Quest Stacking\\Phase 4 Launch Day Guide")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Blackrock Eruption")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Demon Fall Canyon Dungeon Unlock")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Karazhan Crypts Attunement")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Silverpine Forest (12-14)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Scarlet Insignia / Scarlet Uniform")
