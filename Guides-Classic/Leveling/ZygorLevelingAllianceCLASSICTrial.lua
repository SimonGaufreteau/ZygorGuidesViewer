local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("LevelingACLASSIC") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Startup Guide Wizard")
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Human Starter (1-15)",{
image=ZGV.IMAGESDIR.."Elwynn Forest",
condition_suggested=function() return raceclass('Human') and level <= 12 end,
condition_suggested_race=function() return raceclass('Human') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Darkshore (13-17)",
hardcore = true,
},[[
step
_Destroy This Item:_
|tip You won't use it in the Northshire Valley starter area.
|tip You will get another one before you need to use it.
|tip We are doing this to gain an extra bag slot.
trash Hearthstone##6948
|only if not Warlock
step
kill 2 Young Wolf##299 |goto Elwynn Forest 46.38,38.58 |q 33 |future
|tip Loot them for 10 copper worth of vendor items.
|tip This will let you train a spell early.
|tip This substantially increases your leveling speed and is worth the detour.
You can find more around: |notinsticky
[45.82,44.02]
[50.16,45.83]
[52.06,40.29]
|only if (Warrior or Warlock) and level <= 2
step
talk Godric Rothgar##1213
|tip Acquire 10 copper.
|tip You can sell some of your gear if you are short, it's not important at this level.
Sell your trash |vendor Godric Rothgar##1213 |q 33 |future |goto Elwynn Forest/0 47.69,41.42
|only if Warrior or Warlock
step
talk Deputy Willem##823
accept A Threat Within##783 |goto Elwynn Forest 48.17,42.95
step
talk Drusilla La Salle##459
|tip Outside, next to the building.
accept The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
learnspell Immolate##348 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
click Stolen Books
|tip We are going to get our imp pet early.
|tip This is HIGHLY recommended as it doubles your leveling speed.
|tip At level 1 you don't have much to lose, but you will get another chance later if you don't wish to risk this. |only if hardcore
|tip While standing inside the tent, zoom your camera out and click the small pile of books in the junk to the right of the tent opening.
|tip There is a video linked below if you need an example.
Click Here To Copy The Video Link |popuptext youtu.be/SEATloEvXAM
collect Powers of the Void##6785 |q 1598/1 |goto Elwynn Forest 56.74,43.77
|only if Human Warlock
step
talk Drusilla La Salle##459
use Hearthstone##6948
|tip Hearth back to your spawn.
turnin The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 18 |future
|tip Use the "Summon Imp" ability.
|only if Human Warlock and not warlockpet("Imp")
step
_Destroy This Item:_
|tip You won't use it again in the Northshire Valley starter area.
|tip You will get another one before you need to use it.
|tip We are doing this to gain an extra bag slot.
trash Hearthstone##6948	|goto Elwynn Forest 48.31,41.99
|only if Warlock
step
Enter the building |goto Elwynn Forest 48.31,41.99 < 10 |walk
talk Marshal McBride##197
|tip Inside the building.
turnin A Threat Within##783 |goto Elwynn Forest 48.92,41.61
accept Kobold Camp Cleanup##7 |goto Elwynn Forest 48.92,41.61
step
talk Llane Beshere##911
|tip Inside the building, on the ground floor.
|tip You will need 10 copper to learn this spell.
learnspell Battle Shout##6673 |goto Elwynn Forest 50.24,42.28
|only if Warrior
step
talk Deputy Willem##823
accept Eagan Peltskinner##5261 |goto Elwynn Forest 48.17,42.95
step
talk Eagan Peltskinner##196
|tip Outside the building.
turnin Eagan Peltskinner##5261 |goto Elwynn Forest 48.94,40.16
accept Wolves Across the Border##33 |goto Elwynn Forest 48.94,40.16
step
Kill Wolf enemies around this area
collect 8 Tough Wolf Meat##750 |q 33/1 |goto Elwynn Forest 46.38,38.58
You can find more around: |notinsticky
[45.82,44.02]
[50.16,45.83]
[52.06,40.29]
step
kill 10 Kobold Vermin##6 |q 7/1 |goto Elwynn Forest 47.49,36.15
You can find more around [51.18,37.25]
step
talk Eagan Peltskinner##196
turnin Wolves Across the Border##33 |goto Elwynn Forest 48.94,40.16
step
Kill enemies around this area
ding 3 |goto Elwynn Forest 47.49,36.15
You can find more around [51.18,37.25]
step
talk Godric Rothgar##1213
Sell your trash |vendor Godric Rothgar##1213 |q 7 |goto Elwynn Forest/0 47.69,41.42
step
Enter the building |goto Elwynn Forest 48.31,41.99 < 10 |walk
talk Marshal McBride##197
|tip Inside the building.
turnin Kobold Camp Cleanup##7 |goto Elwynn Forest 48.92,41.61
accept Investigate Echo Ridge##15 |goto Elwynn Forest 48.92,41.61
accept Glyphic Letter##3104 |goto Elwynn Forest 48.92,41.61		|only Human Mage
accept Simple Letter##3100 |goto Elwynn Forest 48.92,41.61		|only Human Warrior
accept Tainted Letter##3105 |goto Elwynn Forest 48.92,41.61		|only Human Warlock
accept Encrypted Letter##3102 |goto Elwynn Forest 48.92,41.61		|only Human Rogue
accept Hallowed Letter##3103 |goto Elwynn Forest 48.92,41.61		|only Human Priest
accept Consecrated Letter##3101 |goto Elwynn Forest 48.92,41.61	|only Human Paladin
step
talk Llane Beshere##911
|tip Inside the building, on the ground floor.
turnin Simple Letter##3100 |goto Elwynn Forest 50.24,42.28
accept The Lost Rune##77616 |goto Elwynn Forest 50.24,42.28 |only if ZGV.IsClassicSoD
|only if Human Warrior and ZGV.IsClassicSoD
step
talk Brother Sammuel##925
|tip Inside the building, on the ground floor.
turnin Consecrated Letter##3101 |goto Elwynn Forest 50.43,42.12
accept Relics of the Light##77617 |goto Elwynn Forest 50.43,42.12 |only if ZGV.IsClassicSoD
|only if Human Paladin and ZGV.IsClassicSoD
step
talk Priestess Anetta##375
|tip Inside the building, on the ground floor.
turnin Hallowed Letter##3103 |goto Elwynn Forest 49.81,39.49
accept Meditation on the Light##77619 |goto Elwynn Forest 49.81,39.49 |only if ZGV.IsClassicSoD
|only if Human Priest and ZGV.IsClassicSoD
step
Gain the Meditation on the Light Buff |complete hasbuff(410935) |goto Elwynn Forest 49.81,39.49 |q 77619
|tip Use the "/kneel" emote while standing inside the building.
|tip You will gain a buff that allows you to learn Priest runes.
|only if Human Priest and ZGV.IsClassicSoD
step
Kill Kobold enemies around this area
|tip Inside the mine.
collect Memory of a Troubled Acolyte##205951 |goto Elwynn Forest 47.66,31.86 |q 77619
|only if Human Priest and ZGV.IsClassicSoD
step
use the Memory of a Troubled Acolyte##205951
Learn Spell: Engrave Gloves - Penance |q 77619/1
|only if Human Priest and ZGV.IsClassicSoD
step
Enter the building |goto Elwynn Forest 48.31,41.99 < 10 |walk
talk Priestess Anetta##375
|tip Inside the building, on the ground floor.
turnin Meditation on the Light##77619 |goto Elwynn Forest 49.81,39.49
|only if Human Priest and ZGV.IsClassicSoD
step
talk Khelden Bremen##198
|tip Upstairs inside the building, on the middle floor.
turnin Glyphic Letter##3104 |goto Elwynn Forest 49.66,39.40
learnspell Arcane Intellect##1459 |goto Elwynn Forest 49.66,39.40
learnspell Conjure Water##5504 |goto Elwynn Forest 49.66,39.40
learnspell Frostbolt##116 |goto Elwynn Forest 49.66,39.40
accept Spell Research##77620 |goto Elwynn Forest 49.66,39.40 |only if ZGV.IsClassicSoD
|only if Human Mage and ZGV.IsClassicSoD
step
Leave the building |goto Elwynn Forest 48.30,42.00 < 10 |walk |only if _G.IsIndoors()
kill 10 Kobold Worker##257 |q 15/1 |goto Elwynn Forest 47.49,36.15
You can find more around [Elwynn Forest 51.18,37.25]
step
Enter the mine |goto Elwynn Forest 47.67,31.88 < 15 |walk
click Kobold Stashbox##397987
|tip It looks like a wooden chest on the ground.
|tip Inside the mine.
collect Rune of Victory Rush##204806 |goto Elwynn Forest 50.63,27.27 |q 77616
|only if Human Warrior and ZGV.IsClassicSoD
step
use the Rune of Victory Rush##204806
Learn: Engrave Gloves - Victory Rush |q 77616/1
|only if Human Warrior and ZGV.IsClassicSoD
step
Kill enemies around this area
|tip Getting this far into level 3 will allow you to reach level 4 when you turn in a quest soon.
ding 3,1150 |goto Elwynn Forest 47.49,36.15
You can find more around [51.18,37.25]
step
talk Godric Rothgar##1213
|tip You will need 1-2 silver for spells.
Sell your trash |vendor Godric Rothgar##1213 |q 15 |goto Elwynn Forest/0 47.69,41.42
step
Enter the building |goto Elwynn Forest 48.28,42.02 < 10 |walk
talk Marshal McBride##197
|tip Inside the building.
turnin Investigate Echo Ridge##15 |goto Elwynn Forest 48.93,41.61
accept Skirmish at Echo Ridge##21 |goto Elwynn Forest 48.93,41.61
step
talk Llane Beshere##911
|tip Inside the building, on the ground floor.
learnspell Rend##772 |goto Elwynn Forest 50.24,42.28
learnspell Charge##100 |goto Elwynn Forest 50.24,42.28
turnin Simple Letter##3100 |goto Elwynn Forest 50.24,42.28
|only if Human Warrior
step
talk Brother Sammuel##925
|tip Inside the building, on the ground floor.
learnspell Judgement##20271 |goto Elwynn Forest 50.43,42.12
learnspell Blessing of Might##19740 |goto Elwynn Forest 50.43,42.12
learnspell Devotion Aura##465 |goto Elwynn Forest 50.43,42.12
turnin Consecrated Letter##3101 |goto Elwynn Forest 50.43,42.12
|only if Human Paladin
step
talk Priestess Anetta##375
|tip Inside the building, on the ground floor.
learnspell Shadow Word: Pain##589 |goto Elwynn Forest 49.81,39.49
learnspell Power Word: Fortitude##1243 |goto Elwynn Forest 49.81,39.49
turnin Hallowed Letter##3103 |goto Elwynn Forest 49.81,39.49
|only if Human Priest
step
talk Llane Beshere##911
|tip Inside the building.
turnin The Lost Rune##77616 |goto Elwynn Forest 50.24,42.28
|only if Human Warrior and ZGV.IsClassicSoD
step
talk Khelden Bremen##198
|tip Upstairs inside the building, on the middle floor.
turnin Glyphic Letter##3104 |goto Elwynn Forest 49.66,39.40
learnspell Arcane Intellect##1459 |goto Elwynn Forest 49.66,39.40
learnspell Conjure Water##5504 |goto Elwynn Forest 49.66,39.40
learnspell Frostbolt##116 |goto Elwynn Forest 49.66,39.40
|only if Human Mage
step
talk Deputy Willem##823
|tip Outside, in front of the building.
accept Brotherhood of Thieves##18 |goto Elwynn Forest 48.17,42.93
stickystart "Collect_Red_Burlap_Bandanas"
step
talk Drusilla La Salle##459
|tip Outside, next to the building.
turnin Tainted Letter##3105 |goto Elwynn Forest 49.87,42.65
accept The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
accept Stolen Power##77621 |goto Elwynn Forest 49.87,42.65 |only if ZGV.IsClassicSoD
learnspell Corruption##172 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
click Stolen Books
|tip Try to pull enemies one at a time when possible.
|tip While standing inside the tent, zoom your camera out and click the small pile of books in the junk to the right of the tent opening.
collect Powers of the Void##6785 |q 1598/1 |goto Elwynn Forest 56.74,43.77
|only if Human Warlock
step
talk Drusilla La Salle##459
|tip Outside, next to the building.
turnin The Stolen Tome##1598 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 18 |future
|tip Use the "Summon Imp" ability.
|only if Human Warlock and not warlockpet("Imp")
step
click Defias Stashbox##387477
collect Rune of Haunting##205230 |goto Elwynn Forest 52.54,51.92 |q 77621
|only if Human Warlock and ZGV.IsClassicSoD
step
use the Rune of Haunting##205230
Learn Engrave Gloves - Haunt |q 77621/1
|only if Human Warlock and ZGV.IsClassicSoD
step
talk Drusilla La Salle##459
|tip Outside, next to the building.
turnin Stolen Power##77621 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock and ZGV.IsClassicSoD
step
_NOTE:_
Learn the Judgement Ability
|tip Make sure to learn the Judgement ability from your class trainer.
|tip You will need it to get a rune soon.
Click Here to Continue |confirm |q 77617
|only if Human Paladin and ZGV.IsClassicSoD
step
kill Defias Thug##38+
collect Libram of Judgement##205420 |goto Elwynn Forest 56.09,42.35 |q 77617
You can find more around [Elwynn Forest 53.20,50.30]
|only if Human Paladin and ZGV.IsClassicSoD
step
Equip the Libram of Judgement |equipped Libram of Judgement##205420 |q 77617
|only if Human Paladin and ZGV.IsClassicSoD
step
kill Defias Thug##38+
|tip Use your "Seal of Righteousness" ability, and then use your "Judgement" ability on them.
|tip You will gain a buff.
|tip Repeat this process until you have 10 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Elwynn Forest 56.09,42.35 |q 77617
You can find more around [53.20,50.30]
|only if Human Paladin and ZGV.IsClassicSoD
step
use the Libram of Judgement##205420
Learn the Spell: Engrave Gloves - Crusader Strike |q 77617/1
|only if Human Paladin and ZGV.IsClassicSoD
step
talk Jorik Kerridan##915
|tip Outside, in the stables behind the the building.
turnin Encrypted Letter##3102 |goto Elwynn Forest 50.31,39.92
accept Thrice Stolen##77618 |goto Elwynn Forest 50.31,39.92 |only if ZGV.IsClassicSoD
|only if Human Rogue
step
click Defias Stashbox##387477
collect Rune of Shadowstrike##204795 |goto Elwynn Forest 52.54,51.92 |q 77618
|only if Human Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn: Engrave Gloves - Shadowstrike |q 77618/1
|only if Human Rogue and ZGV.IsClassicSoD
step
kill Defias Thug##38+
|tip They look like humans.
collect Spell Notes: CALE ENCI##203751 |goto Elwynn Forest 54.89,42.98 |q 77620
You can find more around [Elwynn Forest 54.13,48.90]
|only if Human Mage and ZGV.IsClassicSoD
step
use the Spell Notes: CALE ENCI##203751
Learn: Engrave Gloves - Ice Lance |q 77620/1
|only if Human Mage and ZGV.IsClassicSoD
step
label "Collect_Red_Burlap_Bandanas"
kill Defias Thug##38+ |notinsticky
collect 12 Red Burlap Bandana##752 |q 18/1 |goto Elwynn Forest 56.09,42.35
You can find more around [Elwynn Forest 53.20,50.30]
step
talk Deputy Willem##823
|tip Outside, in front of the building.
turnin Brotherhood of Thieves##18 |goto Elwynn Forest 48.17,42.94
accept Bounty on Garrick Padfoot##6 |goto Elwynn Forest 48.17,42.94
accept Milly Osworth##3903 |goto Elwynn Forest 48.17,42.94
step
talk Godric Rothgar##1213
Sell your trash |vendor Godric Rothgar##1213 |q 6 |goto Elwynn Forest/0 47.69,41.42
step
Enter the building |goto Elwynn Forest 48.30,42.00 < 10 |walk
talk Brother Sammuel##925
|tip Inside the building, on the ground floor.
turnin Relics of the Light##77617 |goto Elwynn Forest 50.43,42.12
|only if Human Paladin and ZGV.IsClassicSoD
step
Enter the building |goto Elwynn Forest 48.31,41.99 < 10 |walk
talk Khelden Bremen##198
|tip Upstairs inside the building.
turnin Spell Research##77620 |goto Elwynn Forest 49.66,39.40
|only if Human Mage and ZGV.IsClassicSoD
step
kill 12 Kobold Laborer##80 |q 21/1 |goto Elwynn Forest 47.67,31.86
|tip Inside the mine.
step
Kill enemies around this area
|tip Inside and outside the mine.
ding 5 |goto Elwynn Forest 47.67,31.86
step
Leave the mine |goto Elwynn Forest 47.66,31.89 < 15 |walk |only if subzone("Echo Ridge Mine") and _G.IsIndoors()
talk Milly Osworth##9296
|tip Outside, behind the building.
turnin Milly Osworth##3903 |goto Elwynn Forest 50.69,39.35
accept Milly's Harvest##3904 |goto Elwynn Forest 50.69,39.35
step
talk Jorik Kerridan##915
|tip Inside the building.
turnin Thrice Stolen##77618 |goto Elwynn Forest 50.31,39.92
|only if Human Rogue and ZGV.IsClassicSoD
step
kill Garrick Padfoot##103
collect Garrick's Head##182 |q 6/1 |goto Elwynn Forest 57.51,48.25
step
click Milly's Harvest+
|tip They look like wooden buckets on the ground around this area.
collect 8 Milly's Harvest##11119 |q 3904/1 |goto Elwynn Forest 53.88,48.55
step
Kill enemies around this area
|tip Getting this far into level 5 will allow you to reach level 6 when you turn in quests soon.
|tip You need to be level 6 to be able to learn your class abilities before leaving this starter area.
ding 5,1500 |goto Elwynn Forest 56.09,42.35
You can find more around [53.20,50.30]
step
Kill enemies around this area
|tip Getting this far into level 5 will allow you to reach level 6 when you turn in quests soon.
|tip You need to be level 6 to be able to learn your class abilities before leaving this starter area.
ding 5,1100 |goto Elwynn Forest 56.09,42.35
You can find more around [53.20,50.30]
step
talk Milly Osworth##9296
turnin Milly's Harvest##3904 |goto Elwynn Forest 50.69,39.35
accept Grape Manifest##3905 |goto Elwynn Forest 50.69,39.35
step
talk Deputy Willem##823
|tip Outside, in front of the building.
turnin Bounty on Garrick Padfoot##6 |goto Elwynn Forest 48.17,42.94
step
talk Godric Rothgar##1213
Sell your trash |vendor Godric Rothgar##1213 |q 21 |goto Elwynn Forest/0 47.69,41.42
step
Enter the building |goto Elwynn Forest 48.27,42.01 < 10 |walk
talk Marshal McBride##197
|tip Inside the building.
turnin Skirmish at Echo Ridge##21 |goto Elwynn Forest 48.92,41.61
accept Report to Goldshire##54 |goto Elwynn Forest 48.92,41.61
step
Run up the stairs |goto Elwynn Forest 49.56,41.61 < 7 |walk
talk Brother Neals##952
|tip Upstairs inside the building, all the way at the top.
turnin Grape Manifest##3905 |goto Elwynn Forest 49.47,41.58
step
talk Priestess Anetta##375
|tip Inside the building, on the ground floor.
accept In Favor of the Light##5623 |goto Elwynn Forest 49.81,39.49
|only if Human Priest
step
Follow the road |goto Elwynn Forest 47.05,47.69 < 20 |only if walking
talk Falkhaan Isenstrider##6774
accept Rest and Relaxation##2158 |goto Elwynn Forest 45.56,47.74
step
talk Marshal Dughan##240
turnin Report to Goldshire##54 |goto Elwynn Forest 42.11,65.93
accept The Fargodeep Mine##62 |goto Elwynn Forest 42.11,65.93
step
Enter the building |goto Elwynn Forest 42.95,65.65 < 10 |walk
talk William Pestle##253
|tip Inside the building.
accept Kobold Candles##60 |goto Elwynn Forest 43.32,65.70
step
talk Innkeeper Farley##295
|tip Inside the building.
turnin Rest and Relaxation##2158 |goto Elwynn Forest 43.77,65.81
step
talk Brog Hamfist##151
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Brog Hamfist##151 |goto Elwynn Forest 43.96,65.92 |q 60
step
talk Maximillian Crowe##906
|tip Downstairs in the inn.
|tip Enter from the kitchen.
learnspell Life Tap##1454 |goto Elwynn Forest/0 44.39,66.23
learnspell Shadow Bolt##695 |goto Elwynn Forest/0 44.39,66.23
|only if Warlock and level >= 6
step
Summon Your Imp |complete warlockpet("Imp")
|tip Use the "Summon Imp" ability.
|tip You need to have your Imp active in order to complete the next step.
|only if Human Warlock and not warlockpet("Imp")
step
talk Cylina Darkheart##6374
|tip Downstairs inside the inn.
buy Grimoire of Blood Pact (Rank 1)##16321 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Blood Pact (Rank 1)##16321
Teach Your Imp Blood Pact (Rank 1) |learnpetspell Blood Pact##6307 |goto Elwynn Forest 44.40,65.99
|only if Warlock
step
talk Brog Hamfist##151
|tip Inside the building.
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it this is very important for hard quests later on.
Visit the Vendor |vendor Brog Hamfist##151 |goto Elwynn Forest 43.96,65.92 |q 60
|only if Rogue or Warrior
step
talk Michelle Belle##2329
|tip Upstairs inside the building.
|tip This requires 1 silver, skip this step if you are tight on money.
|tip You will need up to 2 silver to train level 6 spells. |only if not Warlock
Train Apprentice First Aid |skillmax First Aid,75 |goto Elwynn Forest 43.39,65.55
|only if GetMoney() > 150
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 60
step
talk Keryn Sylvius##917
|tip Upstairs in the inn.
learnspell Sinister Strike##1757 |goto Elwynn Forest/0 43.87,65.93
learnspell Gouge##1776 |goto Elwynn Forest/0 43.87,65.93
|only if Rogue and level >= 6
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
learnspell Power Word: Shield##17 |goto Elwynn Forest 43.28,65.72
learnspell Smite##591 |goto Elwynn Forest 43.28,65.72
turnin In Favor of the Light##5623 |goto Elwynn Forest 43.28,65.72 |only if Human Priest
accept Garments of the Light##5624 |goto Elwynn Forest 43.28,65.72 |only if Human Priest
|only if Priest and level >= 6
step
'|talk Guard Roberts##12423
Heal and Fortify Guard Roberts |q 5624/1 |goto Elwynn Forest/0 48.14,68.04
|tip Target Guard Roberts.
|tip First, cast your "Lesser Heal (Rank 2)" spell on him.
|tip Second, cast your "Power Word: Fortitude" spell on him.
|only if Human Priest
step
Enter the building |goto Elwynn Forest/0 42.95,65.65 < 10 |walk
talk Priestess Josetta##377
|tip Upstairs inside the building.
turnin Garments of the Light##5624 |goto Elwynn Forest/0 43.28,65.72
|only if Human Priest
step
talk Zaldimar Wefhellt##328
|tip Upstairs in the inn.
|tip Conjure Food is a low priority spell, you can skip it for now if you are low on money.
learnspell Fire Blast##2136 |goto Elwynn Forest/0 43.25,66.21
learnspell Fireball##143 |goto Elwynn Forest/0 43.25,66.21
learnspell Conjure Food##587 |goto Elwynn Forest/0 43.25,66.21
|only if Mage and level >= 6
step
talk Corina Steele##54
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 60
|only if Warrior and itemcount(2488) == 0
step
talk Corina Steele##54
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 60
|only if Paladin and itemcount(2493) == 0
step
talk Corina Steele##54
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 60
|only if Rogue and itemcount(2494) == 0
step
talk Smith Argus##514
Select _"Train me."_ |gossip 95665 |goto Elwynn Forest/0 41.71,65.55
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Elwynn Forest/0 41.71,65.55
|tip Weapon stones are up to a 30% damage increase at this level and are very worthwhile.
|tip We'll get rough stones from Kobolds soon.
|only if Warrior or Rogue or Paladin
step
talk Lyria Du Lac##913
|tip Train Parry as well.
|tip If you are short on money, learning Parry is more important. |only if hardcore
learnspell Thunder Clap##6343 |goto Elwynn Forest/0 41.10,65.76
|only if Warrior and level >= 6
step
talk Brother Wilhelm##927
learnspell Divine Protection##498 |goto Elwynn Forest/0 41.10,66.03
learnspell Holy Light##639 |goto Elwynn Forest/0 41.10,66.03
|only if Paladin and level >= 6
step
talk Remy "Two Times"##241
accept Gold Dust Exchange##47 |goto Elwynn Forest 42.14,67.26
stickystart "Collect_Chunks_Of_Boar_Meat"
step
talk "Auntie" Bernice Stonefield##246
|tip Grind enemies on the way to make a grind step less tedious later.
accept Lost Necklace##85 |goto Elwynn Forest 34.48,84.26
step
talk Billy Maclure##247
|tip Grind enemies on the way to make a grind step less tedious later.
turnin Lost Necklace##85 |goto Elwynn Forest 43.13,85.72
accept Pie for Billy##86 |goto Elwynn Forest 43.13,85.72
step
Enter the building |goto Elwynn Forest 43.00,89.40 < 10 |walk
talk Maybell Maclure##251
|tip Inside the building.
accept Young Lovers##106 |goto Elwynn Forest 43.15,89.62
step
talk Joshua Maclure##258
Sell your trash |vendor Joshua Maclure##258 |q 106 |goto Elwynn Forest/0 42.35,89.34
step
label "Collect_Chunks_Of_Boar_Meat"
kill Stonetusk Boar##113+
collect 4 Chunk of Boar Meat##769 |q 86/1 |goto Elwynn Forest 41.86,87.12 |future
|tip Be careful not to accidentally sell these to a vendor.
step
talk "Auntie" Bernice Stonefield##246
|tip Grind enemies on the way to make a grind step less tedious later.
turnin Pie for Billy##86 |goto Elwynn Forest 34.48,84.26
accept Back to Billy##84 |goto Elwynn Forest 34.48,84.26
step
talk Ma Stonefield##244
accept Princess Must Die!##88 |goto Elwynn Forest/0 34.66,84.48
step
talk Tommy Joe Stonefield##252
|tip Grind enemies on the way to make a grind step less tedious later.
turnin Young Lovers##106 |goto Elwynn Forest 29.84,85.99
accept Speak with Gramma##111 |goto Elwynn Forest 29.84,85.99
step
Enter the building |goto Elwynn Forest 34.82,84.11 < 10 |walk
talk Gramma Stonefield##248
|tip Inside the building.
turnin Speak with Gramma##111 |goto Elwynn Forest 34.94,83.86
accept Note to William##107 |goto Elwynn Forest 34.94,83.86
step
talk Billy Maclure##247
|tip Grind enemies on the way to make a grind step less tedious later.
turnin Back to Billy##84 |goto Elwynn Forest 43.13,85.72
accept Goldtooth##87 |goto Elwynn Forest 43.13,85.72
step
_NOTE:_
Save All Linen Cloth You Find
|tip As you quest in Elwynn Forest, save all Linen Cloth you find.
|tip Be careful not to accidentally sell them to a vendor.
|tip You will need ~70 Linen Cloth when you are level 10-11.
|tip You will use them to create your wand, which will be a powerful weapon for you.
|tip However, if you are confident you will be able to buy a wand from the Auction House, you can ignore this. |only if not selfmade
Click Here to Continue |confirm |q 364 |future
|only if Priest	or Warlock or Mage
stickystart "Collect_Gold_Dust"
stickystart "Collect_Large_Candles"
step
Enter the mine |goto Elwynn Forest 38.97,82.33 < 10 |walk
|tip Watch for patrols and respawns while in the area. |only if hardcore
Scout Through the Fargodeep Mine |q 62/1 |goto Elwynn Forest 39.61,80.21
|tip Inside the mine.
|tip Explore carefully through this area. |only if harcore
|tip As you loot Rough Stones, craft them into Sharpening Stones and apply them to your weapon |only if Warrior or Rogue
|tip As you loot Rough Stones, craft them into Weightstones and apply them to your weapon |only if Paladin
step
Follow the path inside the mine |goto Elwynn Forest 39.76,79.21 < 10 |walk
kill Goldtooth##327
|tip He walks around this area inside the mine.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Bernice's Necklace##981 |q 87/1 |goto Elwynn Forest 41.71,78.04
step
label "Collect_Gold_Dust"
Kill Kobold enemies around this area
|tip Inside the mine.
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 10 Gold Dust##773 |q 47/1 |goto Elwynn Forest 39.61,80.21
step
label "Collect_Large_Candles"
Kill Kobold enemies around this area |notinsticky
|tip Inside the mine. |notinsticky
|tip You can find more outside the mine. |notinsticky
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Large Candle##772 |q 60/1 |goto Elwynn Forest 39.61,80.21
step
Kill enemies around this area
|tip Inside and outside the mine.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Getting this far into level 7 will allow you to reach level 8 after turning in quests soon.
|tip You can grind around 600 exp grinding towards Goldshire if you want to skip this step a little early and kill on your way.
ding 7,1900  |goto Elwynn Forest 39.61,80.21
step
Leave the mine |complete not _G.IsIndoors()
|tip There are multiple exits, so just leave through the one you come across first.
|only if haveq(62) or haveq(87) or haveq(47) or haveq(60)
step
talk "Auntie" Bernice Stonefield##246
turnin Goldtooth##87 |goto Elwynn Forest 34.49,84.25
step
talk Remy "Two Times"##241
turnin Gold Dust Exchange##47 |goto Elwynn Forest 42.14,67.26
accept A Fishy Peril##40 |goto Elwynn Forest 42.14,67.26
step
talk Marshal Dughan##240
turnin A Fishy Peril##40 |goto Elwynn Forest 42.11,65.93
accept Further Concerns##35 |goto Elwynn Forest 42.11,65.93
turnin The Fargodeep Mine##62 |goto Elwynn Forest 42.11,65.93
accept The Jasperlode Mine##76 |goto Elwynn Forest 42.11,65.93
step
Enter the building |goto Elwynn Forest 42.95,65.65 < 10 |walk
talk William Pestle##253
|tip Inside the building.
turnin Kobold Candles##60 |goto Elwynn Forest 43.32,65.70
accept Shipment to Stormwind##61 |goto Elwynn Forest 43.32,65.70
turnin Note to William##107 |goto Elwynn Forest 43.32,65.70
accept Collecting Kelp##112 |goto Elwynn Forest 43.32,65.70
step
talk Innkeeper Farley##295
|tip Inside the building.
|tip This will create a Hearthstone for you, so you have one again.
home Goldshire |goto Elwynn Forest 43.77,65.81 |q 1097 |future
step
talk Brog Hamfist##151
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
|tip You will need up to 4 silver to train spells.
Visit the Vendor |vendor Brog Hamfist##151 |goto Elwynn Forest 43.96,65.92 |q 112
step
talk Lyria Du Lac##913
learnspell Hamstring##1715 |goto Elwynn Forest/0 41.10,65.76
learnspell Heroic Strike##284 |goto Elwynn Forest/0 41.10,65.76
|only if Warrior and level >= 8
step
talk Brother Wilhelm##927
learnspell Hammer of Justice##853 |goto Elwynn Forest/0 41.10,66.03
learnspell Purify##1152 |goto Elwynn Forest/0 41.10,66.03
|only if Paladin and level >= 8
step
talk Priestess Josetta##377
|tip Upstairs inside the building.
learnspell Renew##139 |goto Elwynn Forest 43.28,65.72
|only if Priest and level >= 8
step
talk Zaldimar Wefhellt##328
|tip Upstairs in the inn.
learnspell Polymorph##118 |goto Elwynn Forest/0 43.25,66.21
learnspell Frostbolt##205 |goto Elwynn Forest/0 43.25,66.21
|tip Frostbolt is optional, Fireball is more damage per mana at this level.
|only if Mage and level >= 8
step
talk Maximillian Crowe##906
|tip Downstairs in the inn.
|tip Enter from the kitchen.
learnspell Fear##5782 |goto Elwynn Forest/0 44.39,66.23
learnspell Curse of Agony##980 |goto Elwynn Forest/0 44.39,66.23
|only if Warlock and level >= 8
step
Summon Your Imp |complete warlockpet("Imp") |q 112
|tip Use the "Summon Imp" ability.
|tip You need to have your Imp active in order to complete the next step.
|only if Human Warlock and not warlockpet("Imp")
step
talk Cylina Darkheart##6374
|tip Downstairs inside the building.
buy Grimoire of Firebolt (Rank 2)##16302 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Firebolt (Rank 2)##16302
Teach Your Imp Firebolt (Rank 2) |learnpetspell Firebolt##7799 |goto Elwynn Forest 44.40,65.99
|only if Human Warlock
step
talk Keryn Sylvius##917
|tip Upstairs in the inn.
learnspell Eviscerate##6760 |goto Elwynn Forest/0 43.87,65.93
learnspell Evasion##5277 |goto Elwynn Forest/0 43.87,65.93
|only if Rogue and level >= 8
step
talk Corina Steele##54
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 112
|only if Warrior and itemcount(2488) == 0
step
talk Corina Steele##54
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 112
|only if Paladin and itemcount(2493) == 0
step
talk Corina Steele##54
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Corina Steele##54 |goto Elwynn Forest 41.53,65.90 |q 112
|only if Rogue and itemcount(2494) == 0
step
Kill Murloc enemies around this area
collect 4 Crystal Kelp Frond##1256 |q 112/1 |goto Elwynn Forest 50.20,66.86
You can find more around [Elwynn Forest 55.90,66.66]
step
Enter the mine |goto Elwynn Forest 61.71,53.87 < 10 |walk
Scout Through the Jasperlode Mine |q 76/1 |goto Elwynn Forest 60.38,49.68
|tip Inside the mine.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Kobold Geomancers deal heavy damage. |only if hardcore
|tip Use Line of Sight to cancel their casts and maneuver them into move favorable positions when possible. |only if hardcore
step
Leave the mine |goto Elwynn Forest 61.74,53.88 < 10 |walk |only if subzone("Jasperlode Mine") and _G.IsIndoors()
talk Guard Thomas##261
|tip Grind mobs en route to this quest.
turnin Further Concerns##35 |goto Elwynn Forest 73.97,72.18
accept Find the Lost Guards##37 |goto Elwynn Forest 73.97,72.18
accept Protect the Frontier##52 |goto Elwynn Forest 73.97,72.18
stickystart "Kill_Young_Forest_Bears"
stickystart "Kill_Prowlers"
step
click A Half-Eaten Body##55
|tip Grind mobs en route to the body.
turnin Find the Lost Guards##37 |goto Elwynn Forest 72.65,60.33
accept Discover Rolf's Fate##45 |goto Elwynn Forest 72.65,60.33
step
talk Supervisor Raelen##10616
accept A Bundle of Trouble##5545 |goto Elwynn Forest 81.38,66.11
step
talk Rallic Finn##1198
Vendor your trash |vendor Rallic Finn##1198 |q 5545 |goto Elwynn Forest/0 83.28,66.09
stickystart "Collect_Bundles_Of_Wood"
step
Kill enemies around this area
|tip The next step in the guide can be pretty tough, so being a level higher will help.
ding 9 |goto Elwynn Forest 77.69,61.78
You can find more around [83.76,60.88]
step
click Rolf's Corpse##56
|tip Watch out for adds when you're pulling from the murloc huts nearby. |only if hardcore
|tip Murloc Foragers may heal when at low health. |only if hardcore
|tip Also watch for respawns if you're clearing. |only if hardcore
|tip This is one of the few items in the game you can loot while inside of your Divine Protection. |only if Paladin
turnin Discover Rolf's Fate##45 |goto Elwynn Forest 79.80,55.52
accept Report to Thomas##71 |goto Elwynn Forest 79.80,55.52
step
label "Collect_Bundles_Of_Wood"
click Bundle of Wood##176793+
|tip They look like small stacks of brown logs at the base of trees around this area.
collect 8 Bundle of Wood##13872 |q 5545/1 |goto Elwynn Forest 77.69,61.78
You can find more around [83.76,60.88]
step
label "Kill_Young_Forest_Bears"
kill 5 Young Forest Bear##822 |q 52/2 |goto Elwynn Forest 86.49,63.95
You can find more around: |notinsticky
[81.76,59.01]
[78.29,61.34]
[71.40,61.40]
[68.66,65.13]
[75.22,67.19]
step
label "Kill_Prowlers"
kill 8 Prowler##118 |q 52/1 |goto Elwynn Forest 83.27,60.09
step
talk Rallic Finn##1198
Vendor your trash |vendor Rallic Finn##1198 |q 5545 |goto Elwynn Forest/0 83.28,66.09
step
talk Supervisor Raelen##10616
turnin A Bundle of Trouble##5545 |goto Elwynn Forest 81.38,66.12
step
talk Sara Timberlain##278
|tip In front of the building.
accept Red Linen Goods##83 |goto Elwynn Forest 79.46,68.78
step
talk Guard Thomas##261
turnin Protect the Frontier##52 |goto Elwynn Forest 73.97,72.18
turnin Report to Thomas##71 |goto Elwynn Forest 73.97,72.18
accept Deliver Thomas' Report##39 |goto Elwynn Forest 73.97,72.18
accept Report to Gryan Stoutmantle##109 |goto Elwynn Forest 73.97,72.18
stickystart "Bandanas_Collect"
step
kill Princess##330
|tip This quest can be very hard, but there are often other players nearby looking to do it as well.
|tip You can skip this step if you are unable to find help or aren't confident soloing it.
|tip You received 2 Lesser Healing Potions from a recent quest, don't forget about them! |only if hardcore
|tip Don't run from the boars if you can help it, this will make them charge and do extra damage |only if hardcore
|tip Use your throwing knives you purchased here. |only if Warrior or Rogue
|tip This quest can be hard on a Paladin as you have no way to kite Princess. Skip it if you aren't comfortable. |only if Paladin
|tip You can use the fence kiting video below to get room to for casting heals. |only if Paladin
|tip Use the corner fence to easily kite Princess, view the video below for a visual example.
Click Here To Copy The Video Link |popuptext youtu.be/f9Ilklxp0QU
collect Brass Collar##1006 |q 88/1 |goto Elwynn Forest 69.61,79.38
step
label "Bandanas_Collect"
Kill Defias enemies around this area
|tip Focus on killing the ones along the perimeter of the farm, near the fences and buildings.
|tip You may want to avoid pulling from inside the buildings. |only if hardcore
|tip You will likely pull multiple enemies doing so. |only if hardcore
collect 6 Red Linen Bandana##1019 |q 83/1 |goto Elwynn Forest 69.61,79.38
step
Kill enemies around this area
|tip Focus on killing the ones along the perimeter of the farm, near the fences and buildings.
|tip Getting this far into level 9 will allow you to reach level 10 after turning in quests soon.
|tip You may want to avoid pulling from inside the buildings. |only if hardcore
|tip You will likely pull multiple enemies doing so. |only if hardcore
ding 9,3600 |goto Elwynn Forest 69.61,79.38
step
collect 70 Linen Cloth##2589 |goto Elwynn Forest 69.61,79.38
|tip Focus on killing the ones along the perimeter of the farm, near the fences and buildings.
|tip This will allow you to craft a wand soon. You can skip this step if you have other plans for a wand.
|tip You may want to avoid pulling from inside the buildings. |only if hardcore
|tip You will likely pull multiple enemies doing so. |only if hardcore
|only if Warlock or Mage or Priest
step
Continue to kill enemies around this area
|tip Grind enemies until your Hearthstone has 5 minutes on its cooldown.
|tip You will be hearthing back to Goldshire to save on long travel time.
|tip This step will complete when your Hearthstone is ready to use.
|tip Any experience you get here is a "bonus" to save on grinding later and is not required if you'd rather skip this step.
Grind XP Until You Can Hearth to Goldshire |complete C_Container.GetItemCooldown(6948) <= 100 |q 83 |only if hardcore
Grind XP Until You Can Hearth to Goldshire |complete C_Container.GetItemCooldown(6948) <= 300 |q 83 |only if not hardcore
step
use the Westfall Deed##1972
accept Furlbrow's Deed##184
|only if itemcount(1972) > 0
step
talk Sara Timberlain##278
|tip In front of the building.
turnin Red Linen Goods##83 |goto Elwynn Forest 79.46,68.79
step
talk Ariena Stormfeather##931
|tip Be careful as you travel here, follow the road.
|tip The enemies in this zone are much higher level than you currently.
fpath Lakeshire |goto Redridge Mountains 30.59,59.41
|only if not hardcore
step
talk Brog Hamfist##151
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Brog Hamfist##151 |q 112 |goto Elwynn Forest 43.96,65.92
step
talk William Pestle##253
|tip Inside the building.
turnin Collecting Kelp##112 |goto Elwynn Forest 43.32,65.71
step
Watch the dialogue
talk William Pestle##253
|tip Inside the building.
accept The Escape##114 |goto Elwynn Forest 43.32,65.71
step
talk Marshal Dughan##240
turnin Deliver Thomas' Report##39 |goto Elwynn Forest 42.11,65.93
turnin The Jasperlode Mine##76 |goto Elwynn Forest 42.11,65.93
accept Westbrook Garrison Needs Help!##239 |goto Elwynn Forest 42.11,65.93
accept Cloth and Leather Armor##59 |goto Elwynn Forest 42.11,65.93 |only if Warlock
step
talk Smith Argus##514
|tip Inside the building.
accept Elmore's Task##1097 |goto Elwynn Forest 41.71,65.55
step
Enter the building |goto Elwynn Forest 42.95,65.65 < 10 |walk
talk Priestess Josetta##377
|tip Upstairs inside the building.
accept Desperate Prayer##5635 |goto Elwynn Forest 43.28,65.72
learnspell Mind Blast##8092 |goto Elwynn Forest 43.28,65.72
learnspell Lesser Heal##2053 |goto Elwynn Forest 43.28,65.72
learnspell Shadow Word: Pain##594 |goto Elwynn Forest 43.28,65.72
learnspell Resurrection##2006 |goto Elwynn Forest 43.28,65.72
|tip Only train Resurrection if you plan to do group content.
|only if Human Priest and level >= 10
step
Enter the building |goto Elwynn Forest 42.95,65.65 < 10 |walk
talk Maximillian Crowe##906
|tip Downstairs in the inn.
|tip Enter from the kitchen.
learnspell Drain Soul##1120 |goto Elwynn Forest/0 44.39,66.23
learnspell Create Healthstone (Minor)##6201 |goto Elwynn Forest/0 44.39,66.23
|tip This requires Drain Soul to be trained.
learnspell Demon Skin##696 |goto Elwynn Forest/0 44.39,66.23
learnspell Immolate##707 |goto Elwynn Forest/0 44.39,66.23
|only if Warlock and level >= 10
step
talk Remen Marcot##6121
|tip Downstairs inside the building.
accept Gakin's Summons##1685 |goto Elwynn Forest 44.49,66.27
|only if Human Warlock
step
talk Brother Wilhelm##927
learnspell Seal of Righteousness##20287 |goto Elwynn Forest/0 41.10,66.03
learnspell Lay on Hands##633 |goto Elwynn Forest/0 41.10,66.03
learnspell Blessing of Protection##1022 |goto Elwynn Forest/0 41.10,66.03
learnspell Devotion Aura##10290 |goto Elwynn Forest/0 41.10,66.03
|only if Paladin and level >= 10
step
talk Zaldimar Wefhellt##328
|tip Upstairs in the inn.
learnspell Conjure Water##5505 |goto Elwynn Forest/0 43.25,66.21
learnspell Frost Nova##122 |goto Elwynn Forest/0 43.25,66.21
learnspell Frost Armor##7300 |goto Elwynn Forest/0 43.25,66.21
|only if Mage and level >= 10
step
talk Keryn Sylvius##917
|tip Upstairs in the inn.
|tip Train Dual Wield
learnspell Sprint##2983 |goto Elwynn Forest/0 43.87,65.93
learnspell Slice and Dice##5171 |goto Elwynn Forest/0 43.87,65.93
learnspell Sap##6770 |goto Elwynn Forest/0 43.87,65.93
|tip Sap is low priority if you are low on money.
|only if Rogue and level >= 10
step
Enter the building |goto Elwynn Forest 43.00,89.40 < 10 |walk
talk Maybell Maclure##251
|tip Inside the building.
turnin The Escape##114 |goto Elwynn Forest 43.15,89.62
step
talk Ma Stonefield##244
turnin Princess Must Die!##88 |goto Elwynn Forest 34.66,84.48
step
talk Deputy Rainer##963
turnin Westbrook Garrison Needs Help!##239 |goto Elwynn Forest 24.23,74.45
accept Riverpaw Gnoll Bounty##11 |goto Elwynn Forest 24.23,74.45
step
click Wanted Poster##68
|tip Its a sign by the road.
accept Wanted: "Hogger"##176 |goto Elwynn Forest 24.50,74.70
|only if Human Warlock
step
Kill Riverpaw enemies around this area
|tip Be careful if you're pulling from one of the camps. |only if hardcore
|tip You'll likely get adds. |only if hardcore
collect 8 Painted Gnoll Armband##782 |q 11/1 |goto Elwynn Forest 26.75,86.83
You can find more around [24.75,94.05]
step
kill Hogger##448
|tip He can spawn in multiple places around the area.
|tip He does a charge similar to boars that will deal extra damage if you get too far from him.
|tip This quest can be difficult but there are often lots of players looking to kill him. Skip this step if you aren't comfortable. |only if hardcore
|tip Don't forget about your healthstones and health potions! |only if hardcore
|tip He can be cheesed by kiting him to the guard tower. Watch the video below for an example.
Click Here To Copy The Video Link |popuptext youtu.be/x79t_tTgey0
collect Huge Gnoll Claw##1931 |q 176 |goto Elwynn Forest 26.75,86.83
|only if Human Warlock
step
use Gold Pickup Schedule##1307
accept The Collector##123 |goto Elwynn Forest 24.23,74.45
|only if Human Warlock and itemcount(1307) > 0
step
talk Deputy Rainer##963
turnin Riverpaw Gnoll Bounty##11 |goto Elwynn Forest 24.23,74.45
step
talk Farmer Furlbrow##237
turnin Furlbrow's Deed##184 |goto Westfall 59.96,19.36 |only if haveq(184) or completedq(184)
accept The Forgotten Heirloom##64 |goto Westfall 59.96,19.36
step
talk Verna Furlbrow##238
accept Westfall Stew##36 |goto Westfall 59.92,19.42
accept Poor Old Blanchy##151 |goto Westfall 59.92,19.42
step
talk Farmer Saldean##233
accept The Killing Fields##9 |goto Westfall 56.05,31.22
step
Enter the building |goto Westfall 56.15,31.04 < 10 |walk
talk Salma Saldean##235
|tip Inside the building.
turnin Westfall Stew##36 |goto Westfall 56.42,30.52
accept Westfall Stew##38 |goto Westfall 56.42,30.52
accept Goretusk Liver Pie##22 |goto Westfall 56.42,30.52
step
talk Gryan Stoutmantle##234
|tip Stick to the roads and do not run through the field |only if hardcore
turnin Report to Gryan Stoutmantle##109 |goto Westfall 56.33,47.52
step
Enter the building |goto Westfall 56.53,47.39 < 10 |walk
talk Quartermaster Lewis##491
|tip Inside the building.
accept A Swift Message##6181 |goto Westfall 57.00,47.17
|only if Human
step
talk Quartermaster Lewis##491
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Quartermaster Lewis##491 |goto Westfall 57.00,47.17 |q 61
step
talk Thor##523
fpath Sentinel Hill |goto Westfall 56.55,52.64
step
talk Thor##523
turnin A Swift Message##6181 |goto Westfall 56.56,52.64
accept Continue to Stormwind##6281 |goto Westfall 56.56,52.64
|only if Human
step
talk Thor##523
|tip Open the flight map.
|tip We are opening the flight map to let the guide learn that you have the Stormwind City flight path already.
fpath Stormwind City |goto Westfall 56.55,52.64
|only if Human
step
Enter the building |goto Stormwind City 56.59,64.87 < 10 |walk
talk Morgan Pestle##279
|tip Inside the building.
turnin Shipment to Stormwind##61 |goto Stormwind City 56.21,64.59
step
Enter the building |goto Stormwind City 57.51,61.65 < 10 |walk
talk Thurman Mullby##1285
|tip Inside the building.
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Thurman Mullby##1285 |goto Stormwind City 58.37,61.68 |q 1097
|only if Rogue
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use two-handed swords.
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Warrior
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use one-handed swords.
Train One-Handed Swords |complete weaponskill("SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Rogue
step
talk Gunther Weller##1289
|tip Inside the building.
buy Cutlass##851 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Gunther Weller##1289 |goto Stormwind City 57.55,57.07 |q 1097
|only if Rogue and itemcount(851) == 0
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use staves.
|tip If you are tight on money and need to buy a wand, a wand is more important.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Stormwind City 57.13,57.71
|only if Priest
step
Enter the building |goto Stormwind City 53.44,64.92 < 10 |walk
talk Innkeeper Allison##6740
|tip Inside the building.
home Stormwind City |goto Stormwind City 52.62,65.70
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Priest"	|or	|q 1097
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Priest"	|or	|q 1097
|only if Priest
step
label "Create_Wand_Priest"
collect 70 Linen Cloth##2589 |q 1097
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Priest
step
Enter the building |goto Stormwind City 44.55,73.89 < 10 |walk
talk Lawrence Schneider##1300
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Stormwind City 43.69,73.71 |q 1097
|only if Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 1097
|only if Priest
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Stormwind City 43.25,74.08 |q 1097
|only if Priest
step
talk Lawrence Schneider##1300
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Stormwind City 43.69,73.71 |q 1097
|only if Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 1097
|only if Priest
step
Enter the building |goto Stormwind City 43.72,63.84 < 10 |walk
talk Lucan Cordell##1317
|tip Inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Stormwind City 42.94,64.65 |q 1097
|only if Priest
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Jessara Cordell here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Stormwind City 42.81,64.39 |q 1097
collect 2 Lesser Magic Essence##10938 |goto Stormwind City 42.81,64.39 |q 1097
|only if Priest
step
talk Jessara Cordell##1318
|tip Inside the building.
buy Copper Rod##6217 |goto Stormwind City 42.81,64.39 |q 1097
buy Simple Wood##4470 |goto Stormwind City 42.81,64.39 |q 1097
|only if Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 1097
|only if Priest
step
talk Betty Quin##11068
|tip Inside the building.
learn Lesser Magic Wand##14293 |goto Stormwind City 43.11,63.72 |q 1097
|only if Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 1097
|only if Priest
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use staves.
|tip If you are tight on money and need to buy a wand, a wand is more important.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Stormwind City 57.13,57.71
|only if Human Warlock
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Warlock"	|or	|q 1097
No, I Already Have a Wand	|confirm	|next "Skip_Wand_HumanWarlock"	|or	|q 1097
|only if Warlock
step
label "Create_Wand_Warlock"
collect 70 Linen Cloth##2589 |q 1097
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Warlock
step
Enter the building |goto Stormwind City 44.55,73.89 < 10 |walk
talk Lawrence Schneider##1300
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Stormwind City 43.69,73.71 |q 1097
|only if Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 1097
|only if Warlock
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Stormwind City 43.25,74.08 |q 1097
|only if Warlock
step
talk Lawrence Schneider##1300
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Stormwind City 43.69,73.71 |q 1097
|only if Warlock
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 1097
|only if Warlock
step
Enter the building |goto Stormwind City 43.72,63.84 < 10 |walk
talk Lucan Cordell##1317
|tip Inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Stormwind City 42.94,64.65 |q 1097
|only if Warlock
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Jessara Cordell here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Stormwind City 42.81,64.39 |q 1097
collect 2 Lesser Magic Essence##10938 |goto Stormwind City 42.81,64.39 |q 1097
|only if Warlock
step
talk Jessara Cordell##1318
|tip Inside the building.
buy Copper Rod##6217 |goto Stormwind City 42.81,64.39 |q 1097
buy Simple Wood##4470 |goto Stormwind City 42.81,64.39 |q 1097
|only if Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 1097
|only if Warlock
step
talk Betty Quin##11068
|tip Inside the building.
learn Lesser Magic Wand##14293 |goto Stormwind City 43.11,63.72 |q 1097
|only if Warlock
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 1097
|only if Warlock
step
label "Skip_Wand_HumanWarlock"
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Gakin's Summons##1685 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only Human Warlock
step
talk Jennea Cannon##5497 |only if Mage
talk Einris Brightspear##5515 |only if Hunter
talk Ursula Deline##5495 |only if Warlock
talk Wu Shen##5479 |only if Warrior
talk Osborne the Night Man##918 |only if Rogue
talk Sheldras Moontree##5504 |only if Druid
talk Brother Benjamin##5484 |only if Priest
talk Arthur the Faithful##5491 |only if Paladin
trainer Jennea Cannon##5497 |goto Stormwind City/0 38.62,79.35 |only if Mage |q 1097
trainer Einris Brightspear##5515  |goto Stormwind City/0 61.66,15.30 |only if Hunter |q 1097
trainer Ursula Deline##5495 |goto Stormwind City/0 26.13,77.20 |only if Warlock |q 1097
trainer Wu Shen##5479 |goto Stormwind City/0 78.72,45.77 |only if Warrior |q 1097
trainer Osborne the Night Man##918 |goto Stormwind City/0 74.54,52.80 |only if Rogue |q 1097
trainer Sheldras Moontree##5504 |goto Stormwind City/0 20.92,55.52 |only if Druid |q 1097
trainer Brother Benjamin##5484 |goto Stormwind City/0 41.64,28.98 |only if Priest |q 1097
trainer Arthur the Faithful##5491 |goto Stormwind City/0 38.65,32.80 |only if Paladin |q 1097
|tip Inside the tower. |only if Mage
|tip Inside the building. |only if Hunter or Warrior or Priest or Paladin
|tip He patrols inside. |only if Priest
|tip In the basement. |only if Warlock
|tip Train your spells.
step
talk Marshal Dughan##240
turnin The Collector##123 |goto Elwynn Forest 42.11,65.93
accept Manhunt##147 |goto Elwynn Forest 42.11,65.93
|only if Human Warlock and haveq(123)
step
talk Marshal Dughan##240
turnin Wanted: "Hogger"##176 |goto Elwynn Forest 42.11,65.93
|only if Human Warlock and readyq(176)
step
Leave the building |goto Stormwind City 29.15,74.18 < 10 |walk |only if subzone("The Slaughtered Lamb")
talk Sara Timberlain##278
|tip In front of the building.
|tip Level your wand skill en route to this quest if it is low.
|tip You really want it near max to fight Surena soon.
turnin Cloth and Leather Armor##59 |goto Elwynn Forest 79.46,68.78
|only if Human Warlock
stickystart "Kill_Collector_HumanWarlock"
step
Leave the building |goto Stormwind City 29.15,74.18 < 10 |walk |only if subzone("The Slaughtered Lamb")
kill Surena Caledon##881
|tip Inside the building.
|tip You will pull 3 enemies. Apply DoTs and Wand Surena. Put your pet on Morgan, and fear the third.
|tip Make a healthstone and don't forget to use it if needed.
|tip Morgan does a backstab, don't turn your back to him! |only if hardcore
|tip Don't be afraid to ask for help from people in the area. |only if hardcore
|tip We have a video of us doing this step below if you want to see how it's performed before you pull.
Click Here To Copy The Video Link |popuptext youtu.be/unJ1RuAlDTY
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Human Warlock
step
label "Kill_Collector_HumanWarlock"
kill Morgan the Collector##473
collect The Collector's Ring##2239 |q 147/1 |goto Elwynn Forest 71.02,80.78
|only if Human Warlock
step
Grind XP Until You Can Hearth |complete C_Container.GetItemCooldown(6948) == 0 |q 1688 |goto Elwynn Forest 71.02,80.78
|tip This is optional and simply makes you have to grind less later.
|only if Human Warlock and C_Container.GetItemCooldown(6948) <= 600 and not haveq(147)
step
talk Marshal Dughan##240
turnin Manhunt##147 |goto Elwynn Forest 42.11,65.93
|only if Human Warlock and haveq(147)
step
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only if Human Warlock
step
use the Bloodstone Choker##6928
|tip Use it while standing on the pink symbol on the ground.
|tip Downstairs inside the building, inside the crypt.
kill Summoned Voidwalker##5676 |q 1689/1 |goto Stormwind City 25.11,77.46
|only if Human Warlock
step
talk Gakin the Darkbinder##6122
|tip Upstairs inside the building, in the basement above the crypt.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Human Warlock
step
_NOTE:_
Create Soul Shards
|tip As you follow the guide, use your "Drain Soul" spell as you kill an enemy to get a Soul Shard.
|tip Once you have a Soul Shard, use your "Summon Voidwalker" ability to summon your voidwalker.
|tip It will tank enemies for you, making it easier to kill enemies.
Click Here to Continue |confirm |q 1097
|only if Human Warlock
step
Leave the building |goto Stormwind City 29.15,74.14 < 10 |c |q 1097
|only if Human Warlock and subzone("The Slaughtered Lamb")
step
label "Skip_Wand_Priest"
Enter the building |goto Stormwind City 43.04,34.49 < 10 |walk
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5635 |goto Stormwind City 38.58,26.01
|only if Human Priest
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Mage"	|or	|q 1097
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Mage"	|or	|q 1097
|only if Human Mage
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Mage"	|or	|q 1097
No, I Already Have a Wand	|confirm	|next "Skip_Wand_NotHumanMage"	|or	|q 1097
|only if not Human and Mage
step
label "Create_Wand_Mage"
collect 70 Linen Cloth##2589 |q 1097
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Mage
step
Enter the building |goto Stormwind City 44.55,73.89 < 10 |walk
talk Lawrence Schneider##1300
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Stormwind City 43.69,73.71 |q 1097
|only if Mage
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 1097
|only if Mage
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Stormwind City 43.25,74.08 |q 1097
|only if Mage
step
talk Lawrence Schneider##1300
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Stormwind City 43.69,73.71 |q 1097
|only if Mage
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 1097
|only if Mage
step
Enter the building |goto Stormwind City 43.72,63.84 < 10 |walk
talk Lucan Cordell##1317
|tip Inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Stormwind City 42.94,64.65 |q 1097
|only if Mage
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Jessara Cordell here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Stormwind City 42.81,64.39 |q 1097
collect 2 Lesser Magic Essence##10938 |goto Stormwind City 42.81,64.39 |q 1097
|only if Mage
step
talk Jessara Cordell##1318
|tip Inside the building.
buy Copper Rod##6217 |goto Stormwind City 42.81,64.39 |q 1097
buy Simple Wood##4470 |goto Stormwind City 42.81,64.39 |q 1097
|only if Mage
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 1097
|only if Mage
step
talk Betty Quin##11068
|tip Inside the building.
learn Lesser Magic Wand##14293 |goto Stormwind City 43.11,63.72 |q 1097
|only if Mage
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 1097
|only if Mage
step
label "Skip_Wand_Mage"
Enter the building |goto Stormwind City 73.64,47.60 < 10 |walk
talk Osric Strang##1323
|tip Inside the building.
turnin Continue to Stormwind##6281 |goto Stormwind City 74.32,47.24
accept Dungar Longdrink##6261 |goto Stormwind City 74.32,47.24
|only if Human
step
talk Lyria Du Lac##913
accept A Warrior's Training##1638 |goto Elwynn Forest 41.09,65.77 |or
'|complete completedq(1679) |or
|only if Human Warrior
step
Enter the building |goto Stormwind City 71.66,39.89 < 10 |walk
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26 |or
'|complete completedq(1678) |or
|only if Human Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|tip He will attack you immediately after you accept this quest.
|only if Human Warrior
step
kill Bartleby##6090
|tip He walks around this area inside the building.
|tip He will eventually surrender.
Beat Bartleby |q 1640/1 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|only if Human Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|only if Human Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26 |or
'|complete completedq(1678) |or
|only if Human Warrior
step
label "Skip_Wand_NotHumanMage"
Enter the building |goto Stormwind City 51.83,13.26 < 10 |walk
talk Grimand Elmore##1416
|tip Inside the building.
turnin Elmore's Task##1097 |goto Stormwind City 51.76,12.07
accept Stormpike's Delivery##353 |goto Stormwind City 51.76,12.07
step
Follow the path |goto Stormwind City 60.27,12.57 < 20 |walk
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Stormwind City 63.92,8.20 |q 433 |future
|tip Walk into the swirling portal.
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the Deeprun Tram from Stormwind City to Ironforge.
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
|tip We cannot give you an arrow to follow here as it is inside an instance.
accept Deeprun Rat Roundup##6661
step
_Inside Deeprun Tram:_
use Rat Catcher's Flute##17117
|tip Use it on Deeprun Rats around this area.
|tip They look like small grey rats on the ground around this area.
|tip In the Ironforge section of the Deeprun Tram.
Capture #5# Rats |q 6661/1
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
|tip We cannot give you an arrow to follow here as it is inside an instance.
turnin Deeprun Rat Roundup##6661
step
_Inside Deeprun Tram:_
Enter Ironforge |complete zone("Ironforge") |q 433 |future
|tip Walk into the swirling portal to Monty's left.
|tip We cannot give you an arrow to follow here as it is inside an instance.
step
Run up the stairs and enter the building |goto Ironforge 59.41,37.76 < 7 |walk
talk Daryl Riknussun##5159
|tip Inside the building.
|tip You need to have the Cooking profession learned in order to accept a quest soon.
Learn Cooking |skillmax Cooking,75 |goto Ironforge 60.08,36.43 |q 7321 |future
step
talk Gryth Thurden##1573
fpath Ironforge |goto Ironforge 55.50,47.75
step
Run up the stairs and enter the building |goto Ironforge 61.31,88.15 < 7 |walk
talk Buliwyf Stonehand##11865
|tip Inside the building.
|tip This will allow you to equip two-handed maces.
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Ironforge 61.17,89.52
|only if Warrior
step
talk Bixi Wobblebonk##13084
|tip Inside the building.
|tip This will allow you to equip thrown weapons.
|tip Skip this if you'd prefer to just use other ranged weapons.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
talk Brenwyn Wintersteel##5120
|tip Downstairs inside the building.
buy Small Throwing Knife##2947 |n
|tip If you can afford it.
|tip If you have better, skip this step.
|tip Skip this if you didn't learn the Throwing skill.
Visit the Vendor |vendor Brenwyn Wintersteel##5120 |goto Ironforge 62.37,88.68 |q 433 |future
|only if Warrior
step
Enter the building |goto Dun Morogh 45.97,48.83 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
accept Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
|only if level < 11
step
talk Senir Whitebeard##1252
accept Frostmane Hold##287 |goto Dun Morogh 46.73,53.83
|only if level < 11
step
Follow the path |goto Dun Morogh 39.61,48.01 < 40 |only if walking
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
|tip Go out of your way to grind mobs en route to this quest.
talk Tundra MacGrann##1266
|tip On top of the mountain.
|tip As you travel to him, be careful to avoid the elite yeti that walks around this area.
accept Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
|only if level < 11
step
Enter the cave |goto Dun Morogh 37.80,53.69 < 20 |walk
click MacGrann's Meat Locker##272
|tip Inside the cave.
|tip Wait for the elite yeti to leave the cave and walk away before you enter the cave.
collect MacGrann's Dried Meats##2667 |q 312/1 |goto Dun Morogh 38.51,53.93
|tip He runs back quickly after he walks down the path a bit.
|tip Try to get into the cave as quick as you can when he leaves it, to give yourself time to run back out safely.
|tip If he attacks you as you leave the cave, just run away.
|only if haveq(312)
step
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
talk Tundra MacGrann##1266
|tip On top of the mountain.
turnin Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
|only if readyq(312)
stickystart "Kill_Frostmane_Headhunters"
step
Enter the cave |goto Dun Morogh 24.84,50.89 < 20 |walk
Follow the path down |goto Dun Morogh 22.61,50.53 < 20 |walk
Fully Explore Frostmane Hold |q 287/2 |goto Dun Morogh 22.79,52.10
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave. |only if hardcore
|only if haveq(287)
step
label "Kill_Frostmane_Headhunters"
Follow the path up |goto Dun Morogh 21.78,50.47 < 20 |walk
kill 5 Frostmane Headhunter##1123 |q 287/1 |goto Dun Morogh 24.87,50.90
|tip Inside and outside the cave. |notinsticky
|tip Watch for patrols and respawns while inside the cave. |only if hardcore |notinsticky
|only if haveq(287)
stickystart "Collect_Gyromechanic_Gears"
step
Leave the cave |goto Dun Morogh 25.07,50.99 < 20 |walk |only if subzone("Frostmane Hold") and _G.IsIndoors()
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Restabilization Cog##3083 |q 412/1 |goto Dun Morogh 25.64,43.33
|only if haveq(412)
step
label "Collect_Gyromechanic_Gears"
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Gyromechanic Gear##3084 |q 412/2 |goto Dun Morogh 25.64,43.33
|only if haveq(412)
step
Leave the building |goto Dun Morogh 46.95,52.05 < 10 |walk |only if subzone("Thunderbrew Distillery")
talk Senir Whitebeard##1252
turnin Frostmane Hold##287 |goto Dun Morogh 46.73,53.82
|only if readyq(287)
step
Enter the building |goto Dun Morogh 45.97,48.84 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
turnin Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
|only if readyq(412)
step
talk Rudra Amberstill##1265
accept Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|tip Only do this quest if you purchased throwing weapons |only if Warrior or Rogue
|tip And you trained Gouge |only if Rogue
|tip And you trained Hamstring |only if Warrior
|tip We strongly recommend trying to find help for this quest as it gives a large weapon upgrade. |only if Paladin
|tip We do not recommend trying to solo him however. |only if Paladin
|tip Skip this step if you aren't comfortable cheesing an elite, you will just need to grind more later. |only if hardcore
|tip We strongly recommend watching the video below before attempting this quest. |only if not Paladin
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE |only if not Paladin
step
Aggro Vagash |goto Dun Morogh 62.41,48.08 > 10
|tip He can spawn deep in the cave. Wait for him to come out if you want an easier time. |only if not Paladin
|tip Follow the arrow and kite him to the fence location. |only if not Paladin
|tip Hop back and forth over the fence so Vagash can't attack you while you whittle him down. |only if not Paladin
|tip We strongly recommend watching the video below before attempting this quest. |only if not Paladin
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE |only if not Paladin
|tip Skip this step if you are unable to find help, it is difficult to solo. |only if Paladin
collect Fang of Vagash##3627 |q 314/1 |goto Dun Morogh 63.90,49.86
step
talk Rudra Amberstill##1265
turnin Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|only if readyq(314)
step
talk Senator Mehr Stonehallow##1977
accept The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
accept Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
stickystart "Kill_Rockjaw_Skullthumpers"
step
Enter the cave |goto Dun Morogh 70.70,56.49 < 20 |walk
kill 10 Rockjaw Bonesnapper##1117 |q 433/1 |goto Dun Morogh 70.98,54.77
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave. |only if hardcore
step
label "Kill_Rockjaw_Skullthumpers"
kill 6 Rockjaw Skullthumper##1115 |q 432/1 |goto Dun Morogh 70.70,56.49
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while inside the cave. |only if hardcore |notinsticky
step
Kill enemies around this area
|tip Inside and outside the cave. |only if not hardcore
|tip Try to grind outside of the cave. |only if hardcore
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Getting this far into level 10 will allow you to reach level 11 after turning in quests soon.
ding 10,6400 |goto Dun Morogh 70.70,56.49
step
Leave the cave |goto Dun Morogh 70.70,56.49 < 20 |walk |only if subzone("Gol'Bolar Quarry Mine")
Follow the path up |goto Dun Morogh 67.86,57.69 < 20 |only if walking
talk Senator Mehr Stonehallow##1977
turnin The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
turnin Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
step
Follow the road |goto Dun Morogh 67.68,52.75 < 40 |only if walking and subzone("Gol'Bolar Quarry")
Follow the road and run through the tunnel |goto Dun Morogh 81.21,42.70 < 10 |only if walking and not subzone("North Gate Outpost")
talk Pilot Hammerfoot##1960
accept The Lost Pilot##419 |goto Dun Morogh 83.89,39.19
step
click A Dwarven Corpse##2059
turnin The Lost Pilot##419 |goto Dun Morogh 79.67,36.17
accept A Pilot's Revenge##417 |goto Dun Morogh 79.67,36.17
step
kill Mangeclaw##1961
|tip He walks around this area.
collect Mangy Claw##3183 |q 417/1 |goto Dun Morogh 78.31,37.76
step
talk Pilot Hammerfoot##1960
turnin A Pilot's Revenge##417 |goto Dun Morogh 83.89,39.19
step
Run through the tunnel |goto Dun Morogh 84.42,31.02 < 10 |only if walking and not zone("Loch Modan")
Enter the building |goto Loch Modan 23.53,17.89 < 10 |walk
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
turnin Stormpike's Delivery##353 |goto Loch Modan 24.76,18.40
accept Filthy Paws##307 |goto Loch Modan 24.76,18.40
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
step
Kill enemies around this area
|tip Getting this far into level 11 will allow you to reach level 12 after turning in quests soon.
|tip You are about to have to complete a quest that can be pretty difficult at level 11, so being a level higher will help.
ding 11,7950 |goto Loch Modan 35.69,31.78 |q 418 |future
You can find more around: |notinsticky
[29.17,23.57]
[29.43,48.28]
step
Enter the building |goto Loch Modan 35.23,47.75 < 7 |walk
talk Vidra Hearthstove##1963
|tip Inside the building.
accept Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
stickystop "Collect_Boar_Intestines"
stickystop "Collect_Spider_Ichors"
stickystop "Collect_Bear_Meat"
step
talk Yanni Stoutheart##1682
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Yanni Stoutheart##1682 |goto Loch Modan 34.76,48.62 |q 416 |future
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
accept Rat Catching##416
accept Mountaineer Stormpike's Task##1339
|tip This quest won't be available if you've picked up Stormpike's Order. |only if haveq(1338)
|tip Drop Stormpike's Order and it should become available. |only if haveq(1338)
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
stickystart "Collect_Tunnel_Rat_Ears"
stickystart "Collect_Linen_Cloth_Paladin"
step
click Miners' League Crates##271
|tip They look like piles of brown boxes on the ground around this area inside the mine.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Tunnel Rat Geomancers are casters that deal heavy damage. |only if hardcore
|tip This mine can be dangerous, so try to stay near the entrance and wait for boxes to respawn, if you can, so you can leave quickly when you're finished.
collect 4 Miners' Gear##2640 |q 307/1 |goto Loch Modan 35.48,18.85
step
label "Collect_Tunnel_Rat_Ears"
Leave the mine |goto Loch Modan 35.48,18.85 < 10 |walk |only if subzone("Silver Stream Mine") and _G.IsIndoors()
Kill Tunnel Rat enemies around this area
collect 12 Tunnel Rat Ear##3110 |q 416/1 |goto Loch Modan 24.57,29.79
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
You can find more around [26.08,43.64]
step
label "Collect_Linen_Cloth_Paladin"
Kill Tunnel Rat enemies around this area
|tip You will need these soon for a Paladin class quest.
|tip Be careful not to accidentally sell these to a vendor.
collect 10 Linen Cloth##2589 |goto Loch Modan 24.57,29.79 |q 1644 |future
You can find more around [26.08,43.64]
|only if Human Paladin
step
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
turnin Filthy Paws##307 |goto Loch Modan 24.76,18.40
turnin Mountaineer Stormpike's Task##1339 |goto Loch Modan 24.76,18.40
accept Stormpike's Order##1338 |goto Loch Modan 24.76,18.40
step
label "Collect_Boar_Intestines"
kill Mountain Boar##1190+
collect 3 Boar Intestines##3172 |goto Loch Modan 36.99,34.36 |q 418 |future
You can find more around [29.17,23.57]
step
label "Collect_Spider_Ichors"
kill Forest Lurker##1195+
collect 3 Spider Ichor##3174 |goto Loch Modan 35.69,31.78 |q 418 |future
You can find more around: |notinsticky
[29.17,23.57]
[29.43,48.28]
step
label "Collect_Bear_Meat"
kill Elder Black Bear##1186+
collect 3 Bear Meat##3173 |goto Loch Modan 35.68,32.10 |q 418 |future
You can find more around: |notinsticky
[30.73,25.86]
[28.66,11.57]
[24.03,25.79]
[27.45,28.54]
[28.09,40.94]
step
talk Vidra Hearthstove##1963
|tip Inside the building.
turnin Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
turnin Rat Catching##416
step
talk Thorgrum Borrelson##1572
fpath Thelsamar |goto Loch Modan 33.94,50.95
step
talk Mountaineer Cobbleflint##1089
accept In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.12
step
Enter the building |goto Loch Modan 23.71,75.47 < 10 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
accept The Trogg Threat##267 |goto Loch Modan 23.23,73.67
stickystart "Kill_Stonesplinter_Troggs"
stickystart "Kill_Stonesplinter_Scouts"
step
Follow the road to the path here |goto Loch Modan 29.32,66.73 < 40 |only if walking and not subzone("Stonesplinter Valley")
Kill Stonesplinter enemies around this area
collect 8 Trogg Stone Tooth##2536 |q 267/1 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore
step
label "Kill_Stonesplinter_Troggs"
kill 10 Stonesplinter Trogg##1161 |q 224/1 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
label "Kill_Stonesplinter_Scouts"
kill 10 Stonesplinter Scout##1162 |q 224/2 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
Kill enemies around this area
|tip Getting this far into level 12 will allow you to reach level 13 after turning in quests soon.
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
ding 12,8300 |goto Loch Modan 32.51,73.25
step
Leave Stonesplinter Valley and follow the road |goto Loch Modan 30.57,69.69 < 20 |only if walking and subzone("Stonesplinter Valley")
talk Mountaineer Cobbleflint##1089
turnin In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.13
step
Enter the building |goto Loch Modan 23.71,75.45 < 7 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
turnin The Trogg Threat##267 |goto Loch Modan 23.23,73.67
step
Enter the building |goto Stormwind City 43.44,35.14 < 10 |walk
talk Duthorian Rall##6171
|tip Inside the building.
accept The Tome of Divinity##1641 |goto Stormwind City 39.81,29.80 |instant
|only if Human Paladin
step
use the Tome of Divinity##6775
accept The Tome of Divinity##1642
|only if Human Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1642 |goto Stormwind City 39.81,29.80
accept The Tome of Divinity##1643 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
Leave the building |goto Stormwind City 43.06,34.49 < 10 |walk |only if subzone("Cathedral of Light")
talk Stephanie Turner##6174
turnin The Tome of Divinity##1643 |goto Stormwind City 57.08,61.74
accept The Tome of Divinity##1644 |goto Stormwind City 57.08,61.74
|only if Human Paladin
step
talk Stephanie Turner##6174
|tip You should already have 10 Linen Cloth from earlier in the guide.
turnin The Tome of Divinity##1644 |goto Stormwind City 57.08,61.74
accept The Tome of Divinity##1780 |goto Stormwind City 57.08,61.74
|only if Human Paladin
step
Enter the building |goto Stormwind City 43.44,35.14 < 10 |walk
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1780 |goto Stormwind City 39.81,29.80
accept The Tome of Divinity##1781 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
talk Gazin Tenorm##6173
|tip Inside the building.
turnin The Tome of Divinity##1781 |goto Stormwind City 38.55,26.45
accept The Tome of Divinity##1786 |goto Stormwind City 38.55,26.45
|only if Human Paladin
step
Leave the building |goto Stormwind City 43.06,34.49 < 10 |walk |only if subzone("Cathedral of Light")
use the Symbol of Life##6866
|tip Use it on Henze Faulk's corpse.
|tip This will resurrect him and allow you to talk to him.
Watch the dialogue
talk Henze Faulk##6172
turnin The Tome of Divinity##1786 |goto Elwynn Forest 72.60,51.41
accept The Tome of Divinity##1787 |goto Elwynn Forest 72.60,51.41
|only if Human Paladin
step
kill Defias Rogue Wizard##474+
collect Defias Script##6846 |q 1787/1 |goto Elwynn Forest 74.07,51.57
|only if Human Paladin
step
Enter the building |goto Stormwind City 43.44,35.14 < 10 |walk
talk Gazin Tenorm##6173
|tip Inside the building.
turnin The Tome of Divinity##1787 |goto Stormwind City 38.56,26.47
accept The Tome of Divinity##1788 |goto Stormwind City 38.56,26.47
|only if Human Paladin
step
talk Duthorian Rall##6171
|tip Inside the building.
turnin The Tome of Divinity##1788 |goto Stormwind City 39.81,29.80
|only if Human Paladin
step
talk Furen Longbeard##5413
turnin Stormpike's Order##1338 |goto Stormwind City 58.09,16.53
step
Run up the ramp |goto Stormwind City 62.42,62.28 < 10 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
turnin Dungar Longdrink##6261 |goto Stormwind City 66.27,62.13
accept Return to Lewis##6285 |goto Stormwind City 66.27,62.13
|only if Human
step
A New Wand Is Available
|tip The 'Greater Magic Wand' is created with the Enchanting profession at level 70.
|tip It requires 1 Simple Wood and 1 Greater Magic Essence to craft.
|tip You can use the Auction House to acquire one, or craft one yourself if you are able. |only if not selfmade
|tip You can also craft one yourself if you are able. |only if selfmade
Click Here to Continue |confirm
|only if Priest and itemcount(11288) == 0
step
talk Innkeeper Heather##8931
collect 40 Longjaw Mud Snapper##4592 |goto Westfall/0 52.86,53.72 |q 102
|tip This food is extremely cheap compared to most.
|tip Stock up and use it liberally.
|only if Warrior or Rogue
step
talk Scout Galiaan##878
accept Red Leather Bandanas##153 |goto Westfall 53.98,52.98
step
talk Gryan Stoutmantle##234
accept The People's Militia##12 |goto Westfall 56.33,47.52
step
talk Captain Danuvin##821
accept Patrolling Westfall##102 |goto Westfall 56.42,47.62
step
Enter the building |goto Westfall 56.51,47.40 < 10 |walk
talk Quartermaster Lewis##491
|tip Inside the building.
turnin Return to Lewis##6285 |goto Westfall 57.00,47.17
|only if Human
stickystart "Collect_Stringy_Vulture_Meat"
stickystart "Collect_Handfuls_Of_Oats"
stickystart "Collect_Goretusk_Livers"
stickystart "Kill_Defias_Trappers"
stickystart "Kill_Defias_Smugglers"
step
label "Kill_Defias_Trappers"
kill 15 Defias Trapper##504 |q 12/1 |goto Westfall 49.35,47.19
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
You can find more around: |notinsticky
[50.73,40.31]
[46.51,38.74]
[46.51,27.82]
step
label "Kill_Defias_Smugglers"
kill 15 Defias Smuggler##95 |q 12/2 |goto Westfall 49.35,47.19
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
You can find more around: |notinsticky
[50.73,40.31]
[46.51,38.74]
[46.51,27.82]
stickystart "Collect_Goretusk_Snouts"
step
Kill enemies around this area
|tip Getting this far into level 13 will allow you to reach level 14 when turning in quests soon.
|tip You are about to do a few quests where you may have to fight multiple enemies fairly often, so it will help to be a level higher.
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
ding 13,9500 |goto Westfall 49.35,47.19
You can find more around: |notinsticky
[50.73,40.31]
[46.51,38.74]
stickystart "Collect_Okra"
stickystart "Kill_Harvest_Watchers"
step
click Furlbrow's Wardrobe##290
|tip Clear the area before trying to complete this quest.
|tip It looks like a dark colored tall piece of furniture inside the building - but don't go inside the building.
|tip Be careful to avoid the doorway of the building, so you don't aggro the enemies inside.
|tip Set your max camera distance to the highest value in the game's Interface Options.
|tip Scroll your camera all the way out and stand here, outside the building.
|tip Adjust your camera so that you can see, and click, Furlbrow's Wardrobe through the doorway.
|tip You can click it from outside the building by doing this.
|tip If you can't get it to work, try to kill the enemies inside the building. |only if not hardore
|tip If you have trouble, try to find someone to help you. |only if hardcore
collect Furlbrow's Pocket Watch##841 |q 64/1 |goto Westfall 49.24,19.42
step
Kill Defias enemies around this area
collect 15 Red Leather Bandana |q 153/1 |goto Westfall 49.24,19.42
|tip Watch for patrols and respawns while in the area. |only if hardcore
You can find more around: |notinsticky
[50.73,40.31]
[46.51,38.74]
[46.51,27.82]
stickystop "Collect_Okra"
stickystop "Kill_Harvest_Watchers"
stickystart "Collect_Murloc_Eyes"
step
Kill Riverpaw enemies around this area
collect 8 Gnoll Paw##725 |q 102/1 |goto Westfall 52.06,14.98
|tip The gnolls tend to aggro as a group when at camps. |only if hardcore
|tip You may have to wait on respawns to find Gnolls that aren't in large groups.
|tip Focus on killing Murlocs for their eyes as you wait on respawns.
You can find more around: |notinsticky
[56.88,13.69]
[44.90,13.81]
step
label "Collect_Murloc_Eyes"
Kill Murloc enemies around this area
|tip The murloc tend to aggro in groups near the huts. |only if hardcore
collect 3 Murloc Eye##730 |q 38/2 |goto Westfall 54.65,10.94
step
Follow the path up |goto Westfall 54.63,14.26 < 30 |c |q 151
|only if subzone("Longshore")
step
label "Collect_Goretusk_Livers"
Kill Goretusk enemies around this area
|tip Go out of your way to kill boars, this quest can take a while.
collect 8 Goretusk Liver##723 |q 22/1 |goto Westfall 53.55,41.12
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[60.81,45.54]
[60.01,29.16]
step
label "Collect_Goretusk_Snouts"
Kill Goretusk enemies around this area
|tip They look like boars.
collect 3 Goretusk Snout##731 |q 38/3 |goto Westfall 53.55,41.12
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[60.81,45.54]
[60.01,29.16]
step
label "Collect_Stringy_Vulture_Meat"
Kill Fleshripper enemies around this area
|tip They look like vultures.
collect 3 Stringy Vulture Meat##729 |q 38/1 |goto Westfall 53.55,41.12
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[60.81,45.54]
[60.01,29.16]
[49.44,27.31]
step
label "Collect_Handfuls_Of_Oats"
click Sack of Oats##2724
|tip They look like tan grain bags on the ground around this area.
|tip They are spread out around Westfall, usually concentrated near and around farm areas.
|tip Keep an eye out for these as you run around completing other quests.
collect 8 Handful of Oats##1528 |q 151/1 |goto Westfall 50.51,20.69
You can find more around: |notinsticky
[57.38,18.41]
step
talk Verna Furlbrow##238
turnin Poor Old Blanchy##151 |goto Westfall 59.92,19.42
step
talk Farmer Furlbrow##237
turnin The Forgotten Heirloom##64 |goto Westfall 59.95,19.36
stickystart "Kill_Harvest_Watchers"
step
label "Collect_Okra"
kill Harvest Watcher##114+
collect 3 Okra##732 |q 38/4 |goto Westfall 53.89,32.26
|tip Make sure not to sell these to a vendor.
You can find more around [51.03,22.94]
step
Enter the building |goto Westfall 56.15,31.05 < 10 |walk
talk Salma Saldean##235
|tip Inside the building.
turnin Goretusk Liver Pie##22 |goto Westfall 56.42,30.52
step
Enter the building |goto Westfall 56.15,31.05 < 10 |walk
talk Salma Saldean##235
|tip Inside the building.
turnin Westfall Stew##38 |goto Westfall 56.42,30.52
step
label "Kill_Harvest_Watchers"
kill 20 Harvest Watcher##114 |q 9/1 |goto Westfall 53.89,32.26
You can find more around [51.03,22.94]
step
Kill enemies around this area
|tip Getting this far into level 14 will allow you to reach level 15 when turning in quest soon.
ding 14,11900 |goto Westfall 53.89,32.26
You can find more around [51.03,22.94]
step
talk Farmer Saldean##233
turnin The Killing Fields##9 |goto Westfall 56.04,31.23
Sell your junk here as well |vendor Farmer Saldean##233 |goto Westfall 56.04,31.23
|only if readyq(9)
step
talk Captain Danuvin##821
turnin Patrolling Westfall##102 |goto Westfall 56.42,47.62
step
talk Gryan Stoutmantle##234
turnin The People's Militia##12 |goto Westfall 56.33,47.52
step
talk Gryan Stoutmantle##234
accept The Defias Brotherhood##65 |goto Westfall 56.33,47.52
step
talk Quartermaster Lewis##491
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Quartermaster Lewis##491 |goto Westfall 57.00,47.17 |q 65
step
talk Scout Galiaan##878
turnin Red Leather Bandanas##153 |goto Westfall 53.99,52.98
step
talk Jennea Cannon##5497 |only if Mage
talk Einris Brightspear##5515 |only if Hunter
talk Ursula Deline##5495 |only if Warlock
talk Wu Shen##5479 |only if Warrior
talk Osborne the Night Man##918 |only if Rogue
talk Sheldras Moontree##5504 |only if Druid
talk Brother Benjamin##5484 |only if Priest
talk Arthur the Faithful##5491 |only if Paladin
trainer Jennea Cannon##5497 |goto Stormwind City/0 38.62,79.35 |only if Mage |q 963 |future
trainer Einris Brightspear##5515  |goto Stormwind City/0 61.66,15.30 |only if Hunter |q 963 |future
trainer Ursula Deline##5495 |goto Stormwind City/0 26.13,77.20 |only if Warlock |q 963 |future
trainer Wu Shen##5479 |goto Stormwind City/0 78.72,45.77 |only if Warrior |q 963 |future
trainer Osborne the Night Man##918 |goto Stormwind City/0 74.54,52.80 |only if Rogue |q 963 |future
trainer Sheldras Moontree##5504 |goto Stormwind City/0 20.92,55.52 |only if Druid |q 963 |future
trainer Brother Benjamin##5484 |goto Stormwind City/0 41.64,28.98 |only if Priest |q 963 |future
trainer Arthur the Faithful##5491 |goto Stormwind City/0 38.65,32.80 |only if Paladin |q 963 |future
|tip Inside the tower. |only if Mage
|tip Inside the building. |only if Hunter or Warrior or Priest or Paladin
|tip He patrols inside. |only if Priest
|tip In the basement. |only if Warlock
|tip Train your spells.
|only if not hardcore
step
Follow the path up |goto Dun Morogh 30.71,34.33 < 10 |only if walking
Continue up the path |goto Dun Morogh 31.06,32.56 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.43,32.34 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.14,30.50 < 7 |only if walking
Follow the path down |goto Dun Morogh 32.33,28.63 < 15 |only if walking
Follow the path |goto Dun Morogh 32.74,27.11 < 20 |only if walking
Jump to Your Death |havebuff Ghost##8326 |goto Eastern Kingdoms 44.92,51.98 |q 963 |future |notravel
|tip While you are in the Wetlands, keep running north and jump off the cliff.
|tip This is a much easier and faster way to reach Menethil Harbor.
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer Near Menethil Harbor |complete not isdead |goto Wetlands 11.72,43.30 |q 963 |future |zombiewalk
|only if not hardcore
step
Enter Menethil Harbor and the building |goto Wetlands 10.25,56.45 < 10 |walk |only if not subzone("Menethil Keep")
talk Neal Allen##1448
|tip Inside the building.
buy Bronze Tube##4371 |n
|tip If you can afford it.
|tip It may not be for sale, since it's a limited supply item.
|tip This item is needed for a quest later on in Duskwood.
Visit the Vendor |vendor Neal Allen##1448 |goto Wetlands 10.75,56.75 |q 174 |future
|only if not hardcore
step
_Note_
We are going to Menethil Harbor.
|tip The remaining quests in Eastern Kingdoms are high level.
|tip There is a slow (45 minutes) but safe way, or a fast (10 minutes) but slightly dangerous way that also lets you train spells.
|tip This will be your only chance to train in the next 6-8 levels. |only if Warlock or Paladin or Mage
|tip We have a video to help with the fast route and it is relatively safe if you are patient.
I want the fast but risky route. |confirm	|next "Fast_Route"	|or	|q 3524 |future
I want the slow but safe route.	|confirm	|next "Safe_Route"	|or	|q 3524 |future
|only if hardcore
step
label "Fast_Route"
talk Jennea Cannon##5497 |only if Mage
talk Einris Brightspear##5515 |only if Hunter
talk Ursula Deline##5495 |only if Warlock
talk Wu Shen##5479 |only if Warrior
talk Osborne the Night Man##918 |only if Rogue
talk Sheldras Moontree##5504 |only if Druid
talk Brother Benjamin##5484 |only if Priest
talk Arthur the Faithful##5491 |only if Paladin
trainer Jennea Cannon##5497 |goto Stormwind City/0 38.62,79.35 |only if Mage |q 963 |future
trainer Einris Brightspear##5515  |goto Stormwind City/0 61.66,15.30 |only if Hunter |q 963 |future
trainer Ursula Deline##5495 |goto Stormwind City/0 26.13,77.20 |only if Warlock |q 963 |future
trainer Wu Shen##5479 |goto Stormwind City/0 78.72,45.77 |only if Warrior |q 963 |future
trainer Osborne the Night Man##918 |goto Stormwind City/0 74.54,52.80 |only if Rogue |q 963 |future
trainer Sheldras Moontree##5504 |goto Stormwind City/0 20.92,55.52 |only if Druid |q 963 |future
trainer Brother Benjamin##5484 |goto Stormwind City/0 41.64,28.98 |only if Priest |q 963 |future
trainer Arthur the Faithful##5491 |goto Stormwind City/0 38.65,32.80 |only if Paladin |q 963 |future
|tip Inside the tower. |only if Mage
|tip Inside the building. |only if Hunter or Warrior or Priest or Paladin
|tip He patrols inside. |only if Priest
|tip In the basement. |only if Warlock
|tip Train your spells.
|only if hardcore
step
Head to the path above the frozen lake |goto Dun Morogh/0 58.11,41.94 < 30 |only if walking
Continue up the hill |goto Dun Morogh/0 60.60,44.07 < 10 |only if walking
Jump at the dark part of the mountain to skip up. Watch the video if you need visual help, it can be confusing. |goto Dun Morogh/0 60.72,44.18 < 5 |only if walking
Jump up the hill further |goto Dun Morogh/0 61.03,44.06 < 10 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.03,44.06 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.14,41.38 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 59.51,40.00 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 59.23,39.15 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.29,37.96 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.37,32.08 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 62.14,27.43 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.16,25.74 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.34,23.87 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.89,22.33 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 65.14,22.40 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 66.77,19.23 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 67.82,18.03 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 67.06,14.43 < 15 |only if walking
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Dun Morogh/0 65.79,12.22 < 10 |only if walking
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Dun Morogh/0 65.58,10.85 < 10 |only if walking
Jump onto the small hill and be full health before jumping |goto Dun Morogh/0 65.75,10.05 < 10 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 66.95,9.91 < 15 |only if walking
Continue following the arrow exactly |goto Wetlands/0 25.52,68.63 < 15 |only if walking |notravel
Continue following the arrow exactly |goto Wetlands/0 17.77,67.76 < 15 |only if walking |notravel
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Wetlands/0 17.05,67.44 < 15 |only if walking |notravel
Be full health and jump towards the arrow exactly |goto Wetlands/0 16.63,65.19 < 10 |only if walking |notravel
Be full health and jump towards the arrow exactly |goto Wetlands/0 16.14,64.41 < 10 |only if walking |notravel
There are two crocodiles in the water and murlocs to your left. Take your time and wait for a good window before crossing. |goto Wetlands/0 14.97,63.97 < 20 |only if walking |notravel
Follow the arrow exactly to reach Menethil Harbor |goto Wetlands/0 12.62,60.96 < 30 |q 3524 |future |next "Post_Menethil_Skip" |only if walking |notravel
|tip You can watch a video of us doing the route if want to be extra safe by clicking here:
Click Here To Copy The Video Link |popuptext www.youtube.com/watch?v=g5Aak-n_XJk
|only if hardcore
step
label "Safe_Route"
Enter the water in Westfall and swim north along the coast to Menethil Harbor in the Wetlands |goto Westfall 54.32,9.30 < 50 |c |q 963 |future
|only if hardcore
step
Swim along the coast to Menethil Harbor in the Wetlands |goto Wetlands 9.37,61.86 < 40 |c |q 963 |future |notravel
|tip This is a long swim (30+ minutes), but it is very safe with no enemies along the way.
|tip There is virtually no risk of dying, unlike other methods.
|tip As you swim north, stay close enough to the cliffs to avoid getting too fatigued.
|tip Once you reach Baradin Bay, near Menethil Harbor, swim through the middle of the bay in the parts that don't make you fatigued.
|only if hardcore
step
label "Post_Menethil_Skip"
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Dwarf & Gnome Starter (1-13)",{
image=ZGV.IMAGESDIR.."Dun Morogh",
condition_suggested=function() return raceclass{'Dwarf','Gnome'} and level <= 12 end,
condition_suggested_race=function() return raceclass{'Dwarf','Gnome'} end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Darkshore (13-17)",
hardcore = true,
},[[
step
_NOTE:_
Save All Linen Cloth You Find
|tip As you quest in Elwynn Forest, save all Linen Cloth you find.
|tip Be careful not to accidentally sell them to a vendor.
|tip You will need ~70 Linen Cloth when you are level 10-11.
|tip You will use them to create your wand, which will be a powerful weapon for you.
|tip However, if you are confident you will be able to buy a wand from the Auction House (if this isn't a new or populated server), you can ignore this. |only if not selfmade
Click Here to Continue |confirm |q 364 |future
|only if Priest
step
talk Sten Stoutarm##658
accept Dwarven Outfitters##179 |goto Dun Morogh 29.93,71.20
step
Kill Wolf enemies around this area
'|kill Ragged Young Wolf##705, Ragged Timber Wolf##704
collect 8 Tough Wolf Meat##750 |q 179/1 |goto Dun Morogh 30.14,74.59
You can find more around [26.93,75.75]
step
talk Sten Stoutarm##658
turnin Dwarven Outfitters##179 |goto Dun Morogh 29.93,71.20
accept Simple Rune##3106 |goto Dun Morogh 29.93,71.20		|only Dwarf Warrior
accept Encrypted Rune##3109 |goto Dun Morogh 29.93,71.20		|only Dwarf Rogue
accept Hallowed Rune##3110 |goto Dun Morogh 29.93,71.20		|only Dwarf Priest
accept Consecrated Rune##3107 |goto Dun Morogh 29.93,71.20		|only Dwarf Paladin
accept Etched Rune##3108 |goto Dun Morogh 29.93,71.20		|only Dwarf Hunter
accept Glyphic Memorandum##3114 |goto Dun Morogh 29.93,71.20	|only Gnome Mage
accept Simple Memorandum##3112 |goto Dun Morogh 29.93,71.20	|only Gnome Warrior
accept Tainted Memorandum##3115 |goto Dun Morogh 29.93,71.20	|only Gnome Warlock
accept Encrypted Memorandum##3113 |goto Dun Morogh 29.93,71.20	|only Gnome Rogue
accept Coldridge Valley Mail Delivery##233 |goto Dun Morogh 29.93,71.20
step
talk Balir Frosthammer##713
accept A New Threat##170 |goto Dun Morogh 29.71,71.25
stickystart "Kill_Rockjaw_Troggs"
stickystart "Kill_Burly_Rockjaw_Troggs"
step
label "Kill_Rockjaw_Troggs"
kill 6 Rockjaw Trogg##707 |q 170/1 |goto Dun Morogh 30.65,74.94
|tip These are typically more rare, prioritize them where possible.
step
label "Kill_Burly_Rockjaw_Troggs"
kill 6 Burly Rockjaw Trogg##724 |q 170/2 |goto Dun Morogh 30.65,74.94
step
talk Balir Frosthammer##713
turnin A New Threat##170 |goto Dun Morogh 29.71,71.25
|tip Kill any enemies on your way to the turnin to save on grinding later
stickystart "Hunter_Ammo_1"
step
label "Hunter_Ammo_1"
talk Adlin Pridedrift##829
Visit the vendor |vendor Adlin Pridedrift##829 |goto Dun Morogh/0 30.09,71.57 |q 233
collect 800 Light Shot##2516 |goto Dun Morogh/0 30.09,71.57 |only if Dwarf Hunter
|tip Restock on ammo before you head out. |only if Dwarf Hunter
step
talk Talin Keeneye##714
turnin Coldridge Valley Mail Delivery##233 |goto Dun Morogh 22.60,71.43
accept Coldridge Valley Mail Delivery##234 |goto Dun Morogh 22.60,71.43
accept The Boar Hunter##183 |goto Dun Morogh 22.60,71.43
step
kill 12 Small Crag Boar##708 |q 183/1 |goto Dun Morogh 21.52,71.91
step
talk Talin Keeneye##714
turnin The Boar Hunter##183 |goto Dun Morogh 22.60,71.43
step
talk Grelin Whitebeard##786
turnin Coldridge Valley Mail Delivery##234 |goto Dun Morogh 25.08,75.71
|tip Kill any enemies on your way to the turnin to save on grinding later.
step
talk Nori Pridedrift##12738
accept Scalding Mornbrew Delivery##3364 |goto Dun Morogh 24.98,75.96
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk
talk Felix Whindlebolt##8416
|tip He walks around this area inside the building.
|tip Hurry, you have a timed quest.
accept A Refugee's Quandary##3361 |goto Dun Morogh 28.51,67.67
step
talk Durnan Furcutter##836
|tip Inside the building.
|tip You want to be level 4 by the time you turn in this quest, grind mobs en route if you are not. |only if level < 4
turnin Scalding Mornbrew Delivery##3364 |goto Dun Morogh 28.77,66.37
accept Bring Back the Mug##3365 |goto Dun Morogh 28.77,66.37
step
talk Thran Khorman##912
|tip Inside the building.
|tip Train your class spells.
turnin Simple Rune##3106 |goto Dun Morogh 28.83,67.24
accept The Lost Rune##77655 |goto Dun Morogh 28.83,67.24 |only if ZGV.IsClassicSoD
|only if Dwarf Warrior
step
talk Solm Hargrin##916
|tip Inside the building.
|tip Train your class spells.
turnin Encrypted Rune##3109 |goto Dun Morogh 28.37,67.51
accept Thrice Stolen##77658 |goto Dun Morogh 28.37,67.51 |only if ZGV.IsClassicSoD
|only if Dwarf Rogue
step
talk Branstock Khalder##837
|tip Inside the building.
|tip Train your class spells.
turnin Hallowed Rune##3110 |goto Dun Morogh 28.60,66.39
accept Meditation on the Light##77661 |goto Dun Morogh 28.60,66.39 |only if ZGV.IsClassicSoD
|only if Dwarf Priest
step
Gain the Meditation on the Light Buff |complete hasbuff(410935) |goto Dun Morogh 28.92,66.42 |q 77661
|tip Target the Altar of the Light.
|tip It looks like a stone pedastal inside the building.
|tip Use the "/kneel" emote while standing next to it.
|tip You will gain a buff that allows you to learn Priest runes.
|only if Dwarf Priest and ZGV.IsClassicSoD
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar")
click Rockjaw Footlocker##405633
collect Memory of a Troubled Acolyte##205951 |goto Dun Morogh 26.73,72.55 |q 77661
|only if Dwarf Priest and ZGV.IsClassicSoD
step
use the Memory of a Troubled Acolyte##205951
Learn Spell: Engrave Gloves - Penance |q 77661/1
|only if Dwarf Priest and ZGV.IsClassicSoD
step
talk Bromos Grummner##926
|tip Inside the building.
|tip Train your class spells.
turnin Consecrated Rune##3107 |goto Dun Morogh 28.83,68.33
accept Relics of the Light##77657 |goto Dun Morogh 28.83,68.33 |only if ZGV.IsClassicSoD
|only if Dwarf Paladin
step
_NOTE:_
Learn the Judgement Ability
|tip Make sure to learn the Judgement ability from your class trainer.
|tip You will need it to get the rune.
Click Here to Continue |confirm |q 77657
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
talk Thorgas Grimson##895
|tip Inside the building.
|tip Consider not training any spells, you will need 4s 14c for a big weapon upgrade when you leave this zone.
turnin Etched Rune##3108 |goto Dun Morogh 29.18,67.46
accept Trek Through the Caves##77660 |goto Dun Morogh 29.18,67.46 |only if ZGV.IsClassicSoD
|only if Dwarf Hunter
step
talk Thran Khorman##912
|tip Inside the building.
|tip Train your class spells.
turnin Simple Memorandum##3112 |goto Dun Morogh 28.83,67.24
accept The Lost Rune##77656 |goto Dun Morogh 28.83,67.24 |only if ZGV.IsClassicSoD
|only if Gnome Warrior
step
talk Solm Hargrin##916
|tip Inside the building.
|tip Train your class spells.
turnin Encrypted Memorandum##3113 |goto Dun Morogh 28.37,67.51
accept Thrice Stolen##77659 |goto Dun Morogh 28.37,67.51 |only if ZGV.IsClassicSoD
|only if Gnome Rogue
step
talk Marryk Nurribit##944
|tip Inside the building.
|tip Train your class spells.
turnin Glyphic Memorandum##3114 |goto Dun Morogh 28.71,66.36
accept Spell Research##77667 |goto Dun Morogh 28.71,66.37 |only if ZGV.IsClassicSoD
|only if Gnome Mage
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar")
click Rockjaw Footlocker##405633
collect Spell Notes: CALE ENCI##203751 |goto Dun Morogh 26.73,72.55 |q 77667
|only if Gnome Mage and ZGV.IsClassicSoD
step
use the Spell Notes: CALE ENCI##203751
Learn: Engrave Gloves - Ice Lance |q 77667/1
|only if Gnome Mage and ZGV.IsClassicSoD
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar")
talk Alamar Grimm##460
|tip Upstairs inside the building.
|tip Train your class spells.
turnin Tainted Memorandum##3115 |goto Dun Morogh 28.65,66.14
accept Beginnings##1599 |goto Dun Morogh 28.65,66.14
accept Stolen Power##77666 |goto Dun Morogh 28.65,66.14 |only if ZGV.IsClassicSoD
|only if Gnome Warlock
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar")
click Rockjaw Footlocker##405633
collect Rune of Haunting##205230 |goto Dun Morogh 26.73,72.55 |q 77666
|only if Gnome Warlock and ZGV.IsClassicSoD
step
use the Rune of Haunting##205230
Learn Engrave Gloves - Haunt |q 77666/1
|only if Gnome Warlock and ZGV.IsClassicSoD
step
Leave the building |goto Dun Morogh 28.79,69.07 < 10 |walk |only if subzone("Anvilmar")
talk Nori Pridedrift##12738
turnin Bring Back the Mug##3365 |goto Dun Morogh 24.98,75.96
step
talk Grelin Whitebeard##786
accept The Troll Cave##182 |goto Dun Morogh 25.08,75.71
stickystart "Kill_Frostmane_Troll_Whelps"
step
Enter the cave |goto Dun Morogh 26.78,79.83 < 15 |walk
Follow the path |goto Dun Morogh 28.00,81.05 < 10 |walk
kill Frostmane Novice##946+
|tip Inside the cave.
|tip There's not very many of them, and they can be spread out inside the cave.
|tip Keep an eye out for ranged attackers while in the cave, as it's easy to be overwhelmed. |only if hardcore
collect 3 Feather Charm##6753 |q 1599/1 |goto Dun Morogh 28.73,82.58
You can find more around: |notinsticky
[Dun Morogh 29.34,81.50]
[Dun Morogh 30.15,82.34]
[Dun Morogh 30.49,81.05]
|only if Gnome Warlock
stickystop "Kill_Frostmane_Troll_Whelps"
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk
talk Alamar Grimm##460
|tip Upstairs inside the building.
turnin Beginnings##1599 |goto Dun Morogh 28.65,66.14
turnin Stolen Power##77666 |goto Dun Morogh 28.65,66.14 |only if ZGV.IsClassicSoD
|only if Gnome Warlock
step
Summon Your Imp |complete warlockpet("Imp") |q 218
|tip Use the "Summon Imp" ability.
|only if Gnome Warlock and not warlockpet("Imp")
step
talk Wren Darkspring##6376
|tip Upstairs inside the building.
buy Grimoire of Blood Pact (Rank 1)##16321 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Blood Pact (Rank 1)##16321
Teach Your Imp Blood Pact (Rank 1) |learnpetspell Blood Pact##6307 |goto Dun Morogh 28.80,66.16
|only if Gnome Warlock
stickystart "Learn_Engrave_Gloves_Victory_Rush_Dwarf_Warrior"
stickystart "Learn_Engrave_Gloves_Victory_Rush_Gnome_Warrior"
stickystart "Kill_Frostmane_Troll_Whelps"
step
kill Frostmane Troll Whelp##706+
collect Libram of Judgement##205420 |goto Dun Morogh 21.04,76.30 |q 77657
You can find more around: |notinsticky
[Dun Morogh 22.77,79.78]
[Dun Morogh 26.81,79.90]
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
Equip the Libram of Judgement |equipped Libram of Judgement##205420 |q 77657
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
kill Frostmane Troll Whelp##706+
|tip Use your "Seal of Righteousness" ability, and then use your "Judgement" ability on them.
|tip You will gain a buff.
|tip Repeat this process until you have 10 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Dun Morogh 26.78,79.83 |q 77657
|tip Inside and outside the cave. |notinsticky
You can find more outside the cave around: |notinsticky
[22.78,79.72]
[21.02,76.15]
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
use the Libram of Judgement##205420
Learn the Spell: Engrave Gloves - Crusader Strike |q 77657/1
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
Leave the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if subzone("Anvilmar")
click Felix's Box
collect Felix's Box##10438 |q 3361/1 |goto Dun Morogh 20.88,76.07
|tip Grind enemies between each of Felix's parts to reduce a grind later.
step
click Felix's Chest
collect Felix's Chest##16313 |q 3361/2 |goto Dun Morogh 22.78,80.00
|tip Grind enemies between each of Felix's parts to reduce a grind later.
step
click Felix's Bucket of Bolts
collect Felix's Bucket of Bolts##16314 |q 3361/3 |goto Dun Morogh 26.33,79.27
|tip Grind enemies between each of Felix's parts to reduce a grind later.
step
label "Learn_Engrave_Gloves_Victory_Rush_Dwarf_Warrior"
Kill Frostmane enemies around this area
|tip They look like trolls.
|tip Inside and outside the cave.
collect Rune of Victory Rush##204806 |n
use the Rune of Victory Rush##204806
Learn: Engrave Gloves - Victory Rush |q 77655/1 |goto Dun Morogh 26.79,79.88
|only if Dwarf Warrior and ZGV.IsClassicSoD
step
label "Learn_Engrave_Gloves_Victory_Rush_Gnome_Warrior"
Kill Frostmane enemies around this area
|tip They look like trolls.
|tip Inside and outside the cave.
collect Rune of Victory Rush##204806 |n
use the Rune of Victory Rush##204806
Learn: Engrave Gloves - Victory Rush |q 77656/1 |goto Dun Morogh 26.79,79.88
|only if Gnome Warrior and ZGV.IsClassicSoD
step
label "Kill_Frostmane_Troll_Whelps"
kill 14 Frostmane Troll Whelp##706 |q 182/1 |goto Dun Morogh 26.78,79.83
|tip Inside and outside the cave. |notinsticky
You can find more outside the cave around: |notinsticky
[Dun Morogh 22.78,79.72]
[Dun Morogh 21.02,76.15]
step
Leave the cave |goto Dun Morogh 26.78,79.83 < 15 |walk |only if subzone("Coldridge Valley") and _G.IsIndoors()
talk Grelin Whitebeard##786
turnin The Troll Cave##182 |goto Dun Morogh 25.08,75.71
accept The Stolen Journal##218 |goto Dun Morogh 25.08,75.71
step
Enter the cave |goto Dun Morogh 26.80,79.86 < 15 |walk
Follow the path |goto Dun Morogh 27.73,80.71 < 10 |walk
Follow the path down |goto Dun Morogh 28.13,80.11 < 10 |walk
Continue down the path |goto Dun Morogh 29.06,78.87 < 10 |walk
|tip Watch for patrols and respawns while inside the cave. |only if hardcore
kill Grik'nir the Cold##808
|tip Inside the cave.
collect Grelin Whitebeard's Journal##2004 |q 218/1 |goto Dun Morogh 30.49,80.16
step
click Frostmane Loot Chest
|tip Inside the cave, up on a ledge.
collect Rune of the Chimera##206168 |goto Dun Morogh 30.78,80.06
|only if Dwarf Hunter and ZGV.IsClassicSoD
step
use the Rune of the Chimera##206168
Learn Engrave Gloves - Chimera Shot |q 77660/1
|only if Dwarf Hunter and ZGV.IsClassicSoD
step
click Frostmane Loot Cache##405628
|tip Inside the cave, up on a ledge.
collect Rune of Shadowstrike##204795 |goto Dun Morogh 30.78,80.06 |q 77658
|only if Dwarf Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn Engrave Gloves - Shadowstrike |q 77658/1
|only if Dwarf Rogue and ZGV.IsClassicSoD
step
click Frostmane Loot Cache##405628
|tip Inside the cave, up on a ledge.
collect Rune of Shadowstrike##204795 |goto Dun Morogh 30.78,80.06 |q 77659
|only if Gnome Rogue and ZGV.IsClassicSoD
step
use the Rune of Shadowstrike##204795
Learn Engrave Gloves - Shadowstrike |q 77659/1
|only if Gnome Rogue and ZGV.IsClassicSoD
step
Leave the cave |goto Dun Morogh 26.78,79.83 < 15 |walk |only if subzone("Coldridge Valley") and _G.IsIndoors()
talk Grelin Whitebeard##786
turnin The Stolen Journal##218 |goto Dun Morogh 25.08,75.71
accept Senir's Observations##282 |goto Dun Morogh 25.08,75.71
step
Kill enemies around this area
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while in the area.  |only if hardcore
|tip Getting this far into level 5 will allow you to reach level 6 when you head to the next town.
|tip This is important, so you can visit your class trainer before leaving the starter area.
ding 5,2200 |goto Dun Morogh 26.78,79.83
step
Grind enemies until you have 4 Silver |complete _G.GetMoney() >= 4 |goto Dun Morogh 26.78,79.83
|tip We will use this to buy a big weapon upgrade after leaving the starting zone.
|only if Dwarf Hunter
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Dun Morogh 26.78,79.83 |q 3361
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 29.55,69.83 |q 3361 |zombiewalk
|only if not hardcore
step
Enter the building |goto Dun Morogh 28.79,69.05 < 10 |walk
talk Felix Whindlebolt##8416
|tip He walks around this area inside the building.
turnin A Refugee's Quandary##3361 |goto Dun Morogh 28.55,67.65
step
talk Thorgas Grimson##895
|tip Inside the building.
turnin Trek Through the Caves##77660 |goto Dun Morogh 29.18,67.46
|only if Dwarf Hunter and ZGV.IsClassicSoD
step
talk Bromos Grummner##926
|tip Inside the building.
turnin Relics of the Light##77657 |goto Dun Morogh 28.83,68.33
|only if Dwarf Paladin and ZGV.IsClassicSoD
step
talk Solm Hargrin##916
|tip Outside, in the stables behind the the building.
turnin Thrice Stolen##77658 |goto Dun Morogh 50.31,39.92
|only if Dwarf Rogue and ZGV.IsClassicSoD
step
talk Solm Hargrin##916
|tip Outside, in the stables behind the the building.
turnin Thrice Stolen##77659 |goto Dun Morogh 50.31,39.92
|only if Gnome Rogue and ZGV.IsClassicSoD
step
talk Thran Khorman##912
|tip Inside the building.
turnin The Lost Rune##77655 |goto Dun Morogh 28.83,67.24
|only if Dwarf Warrior and ZGV.IsClassicSoD
step
talk Thran Khorman##912
|tip Inside the building.
turnin The Lost Rune##77656 |goto Dun Morogh 28.83,67.24
|only if Gnome Warrior and ZGV.IsClassicSoD
step
talk Marryk Nurribit##944
|tip Inside the building.
turnin Spell Research##77667 |goto Dun Morogh 28.71,66.37
|only if Gnome Mage and ZGV.IsClassicSoD
step
talk Branstock Khalder##837
|tip Inside the building.
turnin Meditation on the Light##77661 |goto Dun Morogh 28.60,66.39
|only if Dwarf Priest and ZGV.IsClassicSoD
step
Leave the building |goto Dun Morogh 28.79,69.05 < 10 |walk |only if subzone("Anvilmar")
talk Mountaineer Thalos##1965
turnin Senir's Observations##282 |goto Dun Morogh 33.48,71.84
accept Senir's Observations##420 |goto Dun Morogh 33.48,71.84
step
talk Hands Springsprocket##6782
accept Supplies to Tannok##2160 |goto Dun Morogh 33.85,72.24
stickystart "Collect_Chunks_Of_Boar_Meat"
stickystart "Collect_Crag_Boar_Ribs"
step
Enter the tunnel |goto Dun Morogh 34.12,71.51 < 10 |only if walking and subzone("Coldridge Pass")
Leave the tunnel and follow the road |goto Dun Morogh 35.67,65.93 < 10 |only if walking and subzone("Coldridge Pass")
talk Hegnar Rumbleshot##1243
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step. Stock up on ammo while you're as well, however.
Visit the Vendor |vendor Hegnar Rumbleshot##1243 |goto Dun Morogh 40.68,65.13 |q 384 |future
|only if Hunter and itemcount(2509) == 0
step
Enter the tunnel |goto Dun Morogh 34.12,71.51 < 10 |only if walking and subzone("Coldridge Pass")
Leave the tunnel and follow the road |goto Dun Morogh 35.67,65.93 < 10 |only if walking and subzone("Coldridge Pass")
talk Senir Whitebeard##1252
turnin Senir's Observations##420 |goto Dun Morogh 46.73,53.83
stickystop "Collect_Chunks_Of_Boar_Meat"
stickystop "Collect_Crag_Boar_Ribs"
step
talk Ragnar Thunderbrew##1267
accept Beer Basted Boar Ribs##384 |goto Dun Morogh 46.83,52.36
step
Enter the building |goto Dun Morogh 46.95,52.04 < 10 |walk
talk Tannok Frosthammer##6806
|tip Inside the building.
turnin Supplies to Tannok##2160 |goto Dun Morogh 47.22,52.19
step
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 384
step
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you afford it.
buy Balanced Throwing Dagger##25872 |n
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 400 |future
|only if Rogue
step
talk Innkeeper Belm##1247
|tip Inside the building.
home Thunderbrew Distillery |goto Dun Morogh 47.38,52.52
|tip Train your level 6 spells while in town.
|tip Stock up on food and drink if you have spare coin after.
step
talk Maxan Anvol##1226
|tip Inside the building.
accept Garments of the Light##5625 |goto Dun Morogh 47.34,52.19
|only if Dwarf Priest
step
Leave the building |goto Dun Morogh 46.95,52.03 < 10 |walk |only if subzone("Thunderbrew Distillery")
Heal and Fortify Mountaineer Dolf |q 5625/1 |goto Dun Morogh 45.81,54.57
|tip Target Mountaineer Dolf.
|tip First, cast your "Lesser Heal (Rank 2)" spell on him.
|tip Second, cast your "Power Word: Fortitude" spell on him.
|only if Dwarf Priest
step
Enter the building |goto Dun Morogh 46.95,52.04 < 10 |walk
talk Maxan Anvol##1226
|tip Inside the building.
turnin Garments of the Light##5625 |goto Dun Morogh 47.34,52.19
|only if Dwarf Priest
step
Leave the building |goto Dun Morogh 46.95,52.03 < 10 |walk |only if subzone("Thunderbrew Distillery")
talk Tharek Blackstone##1872
accept Tools for Steelgrill##400 |goto Dun Morogh 46.02,51.68
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 384
|only if Dwarf Warrior and itemcount(2491) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 384
|only if Gnome Warrior and itemcount(2488) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 384
|only if Paladin and itemcount(2493) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 384
|only if Rogue and itemcount(2494) == 0
stickystart "Collect_Chunks_Of_Boar_Meat"
stickystart "Collect_Crag_Boar_Ribs"
step
talk Pilot Bellowfiz##1378
accept Stocking Jetsteam##317 |goto Dun Morogh 49.43,48.41
step
talk Pilot Stonegear##1377
accept The Grizzled Den##313 |goto Dun Morogh 49.62,48.61
step
talk Beldin Steelgrill##1376
turnin Tools for Steelgrill##400 |goto Dun Morogh 50.44,49.09
step
talk Loslor Rudge##1694
accept Ammo for Rumbleshot##5541 |goto Dun Morogh 50.08,49.42
stickystart "Collect_Thick_Bear_Fur"
step
label "Collect_Chunks_Of_Boar_Meat"
Kill Crag Boar enemies around this area
collect 4 Chunk of Boar Meat##769 |q 317/1 |goto Dun Morogh 48.34,55.70 |future
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[48.37,60.48]
[44.55,65.31]
[42.18,65.32]
step
label "Collect_Crag_Boar_Ribs"
Kill Crag Boar enemies around this area
collect 6 Crag Boar Rib##2886 |q 384/1 |goto Dun Morogh 48.34,55.70 |future
|tip Be careful not to accidentally sell these to a vendor.
You can find more around: |notinsticky
[48.37,60.48]
[44.55,65.31]
[42.18,65.32]
step
label "Collect_Thick_Bear_Fur"
kill Young Black Bear##1128+
collect 2 Thick Bear Fur##6952 |q 317/2 |goto Dun Morogh 49.76,51.15
You can find more around: |notinsticky
[45.18,50.18]
[44.96,56.85]
[42.54,59.61]
[39.44,61.23]
step
click Ammo Crate##176785
collect Rumbleshot's Ammo##13850 |q 5541/1 |goto Dun Morogh 44.14,56.94
step
Kill Wendigo enemies around this area
|tip Inside and outside the cave.
|tip They respawn quickly, so you'll be better staying close to the cave entrance.
collect 8 Wendigo Mane##2671 |q 313/1 |goto Dun Morogh 42.33,54.03
step
Kill enemies around this area
|tip Inside and outside the cave.
|tip They respawn quickly, so you'll be better staying close to the cave entrance.
|tip You should already be level 7, or pretty close.
ding 7 |goto Dun Morogh 42.33,54.03
step
Follow the path up |goto Dun Morogh 40.60,62.56 < 30 |only if walking
talk Hegnar Rumbleshot##1243
turnin Ammo for Rumbleshot##5541 |goto Dun Morogh 40.68,65.13
|tip Stock up on ammo while you're here if needed. |only if Dwarf Hunter
step
talk Hegnar Rumbleshot##1243
buy Ornate Blunderbuss##2509 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Hegnar Rumbleshot##1243 |goto Dun Morogh 40.68,65.13 |q 312 |future
|only if Hunter and itemcount(2509) == 0
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Dun Morogh 42.77,65.72 |q 313
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 47.05,55.10 |q 313 |zombiewalk
|only if not hardcore
step
talk Senir Whitebeard##1252
accept Frostmane Hold##287 |goto Dun Morogh 46.73,53.83
|tip Grind enemies on the way to accept this quest to make a grind step later less tedious.
step
Enter the building |goto Dun Morogh 46.95,52.04 < 10 |walk
talk Innkeeper Belm##1247
|tip Inside the building.
buy Rhapsody Malt##2894 |q 384/2 |goto Dun Morogh 47.38,52.52
step
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 384
step
Leave the building |goto Dun Morogh 46.95,52.04 < 10 |walk |only if subzone("Thunderbrew Distillery")
talk Ragnar Thunderbrew##1267
turnin Beer Basted Boar Ribs##384 |goto Dun Morogh 46.83,52.36
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 317
|only if Dwarf Warrior and itemcount(2491) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 317
|only if Gnome Warrior and itemcount(2488) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 317
|only if Paladin and itemcount(2493) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 317
|only if Rogue and itemcount(2494) == 0
step
talk Pilot Bellowfiz##1378
turnin Stocking Jetsteam##317 |goto Dun Morogh 49.43,48.41
accept Evershine##318 |goto Dun Morogh 49.43,48.41
step
talk Pilot Stonegear##1377
turnin The Grizzled Den##313 |goto Dun Morogh 49.62,48.61
step
Summon Your Imp |complete warlockpet("Imp")
|tip Use the "Summon Imp" ability.
|tip You need to have your Imp active in order to complete the next step.
|only if Gnome Warlock and not warlockpet("Imp")
step
talk Dannie Fizzwizzle##6328
buy Grimoire of Firebolt (Rank 2)##16302 |n
|tip If you can't afford it, skip this step and make sure to buy it later.
use the Grimoire of Firebolt (Rank 2)##16302
Teach Your Imp Firebolt (Rank 2) |learnpetspell Blood Pact##7799 |goto Dun Morogh 47.28,53.67
|only if Gnome Warlock
step
Enter the building |goto Dun Morogh 46.95,52.05 < 10 |walk
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
|tip Stock up on food and water, there's a lot of grinding ahead.
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 412 |future
step
talk Thamner Pol##2326
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Dun Morogh 47.18,52.61
|only if GetMoney() > 150
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats or trams, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 412 |future
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412 |future
|only if Dwarf Warrior and itemcount(2491) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412 |future
|only if Gnome Warrior and itemcount(2488) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412 |future
|only if Paladin and itemcount(2493) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412 |future
|only if Rogue and itemcount(2494) == 0
step
Enter the building |goto Dun Morogh 45.97,48.83 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
accept Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
Follow the path |goto Dun Morogh 39.61,48.01 < 40 |only if walking
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
|tip Go out of your way to grind mobs en route to this quest.
talk Tundra MacGrann##1266
|tip On top of the mountain.
|tip As you travel to him, be careful to avoid the elite yeti that walks around this area.
accept Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
step
Enter the cave |goto Dun Morogh 37.80,53.69 < 20 |walk
click MacGrann's Meat Locker##272
|tip Inside the cave.
|tip Wait for the elite yeti to leave the cave and walk away before you enter the cave.
collect MacGrann's Dried Meats##2667 |q 312/1 |goto Dun Morogh 38.51,53.93
|tip He runs back quickly after he walks down the path a bit.
|tip Try to get into the cave as quick as you can when he leaves it, to give yourself time to run back out safely.
|tip If he attacks you as you leave the cave, just run away.
step
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
talk Tundra MacGrann##1266
|tip On top of the mountain.
turnin Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
step
talk Rejold Barleybrew##1374
|tip Be very careful to jump onto the small hill and not all the way down. |only if hardcore
turnin Evershine##318 |goto Dun Morogh 30.19,45.73
accept A Favor for Evershine##319 |goto Dun Morogh 30.19,45.73
accept The Perfect Stout##315 |goto Dun Morogh 30.19,45.73
|tip Grind enemies en route to these quests.
step
talk Marleth Barleybrew##1375
accept Bitter Rivals##310 |goto Dun Morogh 30.19,45.53
stickystart "Kill_Elder_Crag_Boars"
stickystart "Kill_Snow_Leopards"
step
kill 6 Ice Claw Bear##1196 |q 319/1 |goto Dun Morogh 37.90,42.59
You can find more around: |notinsticky
[34.50,31.74]
[30.71,39.90]
[27.80,48.14]
[28.11,53.97]
step
label "Kill_Elder_Crag_Boars"
kill 8 Elder Crag Boar##1127 |q 319/2 |goto Dun Morogh 34.50,31.74
You can find more around: |notinsticky
[30.71,39.90]
[27.80,48.14]
[28.11,53.97]
step
label "Kill_Snow_Leopards"
kill 8 Snow Leopard##1201 |q 319/3 |goto Dun Morogh 34.50,31.74
You can find more around: |notinsticky
[30.71,39.90]
[27.80,48.14]
[28.11,53.97]
step
Allow Enemies to Kill You
|tip You can do this anywhere near Brewnall Village, it doesn't have to be at this exact location.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Dun Morogh 30.71,39.90 |q 319
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Dun Morogh 47.05,55.10 |q 319 |zombiewalk
|only if not hardcore
step
Enter the building |goto Dun Morogh 46.95,52.05 < 10 |walk
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 319
step
talk Innkeeper Belm##1247
|tip Inside the building.
buy Thunder Ale##2686 |goto Dun Morogh 47.38,52.52 |q 310
step
talk Jarven Thunderbrew##1373
|tip Downstairs inside the building.
accept Distracting Jarven##308 |goto Dun Morogh 47.64,52.66
|only if haveq(310)
step
click Unguarded Thunder Ale Barrel
|tip Downstairs inside the building.
|tip It may take a moment for it to become Unguarded.
turnin Bitter Rivals##310 |goto Dun Morogh 47.70,52.69
accept Return to Marleth##311 |goto Dun Morogh 47.70,52.69
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 319
|only if Dwarf Warrior and itemcount(2491) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 319
|only if Gnome Warrior and itemcount(2488) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 319
|only if Paladin and itemcount(2493) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 319
|only if Rogue and itemcount(2494) == 0
step
Follow the path up |goto Dun Morogh 38.44,42.11 < 15 |only if walking
kill Frostmane Seer##1397+
click Shimmerweed Basket##276+
|tip They look like tan wooden baskets on the ground around this area.
|tip Enemies tend to pull in groups around here. |only if hardcore
|tip Watch for respawns while in the area. |only if hardcore
collect 6 Shimmerweed##2676 |q 315/1 |goto Dun Morogh 40.09,42.44
You can find more around [41.81,35.62]
step
Follow the path |goto Dun Morogh 41.90,47.23 < 40 |only if walking
|tip Grind mobs en route to this turn in. You want to be level 9 for this next quest. |only if level < 9
talk Marleth Barleybrew##1375
turnin Return to Marleth##311 |goto Dun Morogh 30.19,45.53
step
talk Rejold Barleybrew##1374
turnin A Favor for Evershine##319 |goto Dun Morogh 30.19,45.73
accept Return to Bellowfiz##320 |goto Dun Morogh 30.19,45.73
turnin The Perfect Stout##315 |goto Dun Morogh 30.19,45.73
accept Shimmer Stout##413 |goto Dun Morogh 30.19,45.73
step
Kill enemies around this area
|tip You should already be level 9, or very close to it.
|tip You are about to have to complete some quests that can be difficult, so being a level higher will help.
ding 9 |goto Dun Morogh 34.50,31.74
You can find more around: |notinsticky
[30.71,39.90]
[27.80,48.14]
[28.11,53.97]
stickystart "Kill_Frostmane_Headhunters"
step
Enter the cave |goto Dun Morogh 24.84,50.89 < 20 |walk
Follow the path down |goto Dun Morogh 22.61,50.53 < 20 |walk
Fully Explore Frostmane Hold |q 287/2 |goto Dun Morogh 22.79,52.10
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave. |only if hardcore
step
label "Kill_Frostmane_Headhunters"
Follow the path up |goto Dun Morogh 21.78,50.47 < 20 |walk
kill 5 Frostmane Headhunter##1123 |q 287/1 |goto Dun Morogh 24.87,50.90
|tip Inside and outside the cave. |notinsticky
|tip Watch for patrols and respawns while inside the cave. |only if hardcore |notinsticky
stickystart "Collect_Gyromechanic_Gears"
step
Leave the cave |goto Dun Morogh 25.07,50.99 < 20 |walk |only if subzone("Frostmane Hold") and _G.IsIndoors()
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Restabilization Cog##3083 |q 412/1 |goto Dun Morogh 25.64,43.33
step
label "Collect_Gyromechanic_Gears"
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Gyromechanic Gear##3084 |q 412/2 |goto Dun Morogh 25.64,43.33
step
Kill enemies around this area
|tip Getting this far into level 9 will allow you to reach level 10 after turning in quests soon.
|tip You will return to town soon, so it will be a good time to learn your level 10 abilities.
ding 9,4300 |goto Dun Morogh 26.36,47.69
You can find more around: |notinsticky
[29.93,42.60]
|only if not Dwarf Priest
step
ding 10
|only if Dwarf Priest
step
Follow the path up |goto Dun Morogh 30.71,34.33 < 10 |only if walking
Continue up the path |goto Dun Morogh 31.06,32.56 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.43,32.34 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.14,30.50 < 7 |only if walking
Follow the path down |goto Dun Morogh 32.33,28.63 < 15 |only if walking
Follow the path |goto Dun Morogh 32.74,27.11 < 20 |only if walking
Jump to Your Death |havebuff Ghost##8326 |goto Eastern Kingdoms 44.92,51.98 |q 963 |future |notravel
|tip While you are in the Wetlands, keep running north and jump off the cliff.
|tip This is a much easier and faster way to reach Menethil Harbor.
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer Near Menethil Harbor |complete not isdead |goto Wetlands 11.72,43.30 |q 963 |future |zombiewalk
|only if not hardcore
step
Enter Menethil Harbor and the building |goto Wetlands 10.25,56.45 < 10 |walk |only if not subzone("Menethil Keep")
talk Neal Allen##1448
|tip Inside the building.
buy Bronze Tube##4371 |n
|tip If you can afford it.
|tip It may not be for sale, since it's a limited supply item.
|tip This item is needed for a quest later on in Duskwood.
Visit the Vendor |vendor Neal Allen##1448 |goto Wetlands 10.75,56.75 |q 174 |future
|only if not hardcore
step
Leave the building |goto Wetlands 10.25,56.45 < 10 |walk |only if subzone("Menethil Keep")
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
|only if not hardcore
step
talk Kreg Bilmn##1691
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Kreg Bilmn##1691 |goto Dun Morogh 47.19,52.40 |q 412
step
Leave the building |goto Dun Morogh 46.95,52.05 < 10 |walk |only if subzone("Thunderbrew Distillery")
talk Senir Whitebeard##1252
turnin Frostmane Hold##287 |goto Dun Morogh 46.73,53.82
accept The Reports##291 |goto Dun Morogh 46.73,53.82
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Large Axe##2491 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412
|only if Dwarf Warrior and itemcount(2491) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412
|only if Gnome Warrior and itemcount(2488) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Wooden Mallet##2493 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412
|only if Paladin and itemcount(2493) == 0
step
Enter the building |goto Dun Morogh 45.74,51.84 < 10 |walk
talk Grawn Thromwyn##1273
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Grawn Thromwyn##1273 |goto Dun Morogh 45.29,52.19 |q 412
|only if Rogue and itemcount(2494) == 0
step
Enter the building |goto Dun Morogh 45.97,48.84 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
turnin Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
Leave the building |goto Dun Morogh 45.97,48.85 < 10 |walk
talk Pilot Bellowfiz##1378
turnin Return to Bellowfiz##320 |goto Dun Morogh 49.43,48.41
step
_NOTE:_
You Have Access to Stronger Ammo
|tip Now that you're level 10, you can purchase stronger bullets or arrows.
|tip When you restock ammo at vendors, make sure to buy level 10 ammo.
Click Here to Continue |confirm |q 6062 |future
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
accept Taming the Beast##6064 |goto Dun Morogh 45.81,53.03
|only if Dwarf Hunter
step
use the Taming Rod##15911
|tip Use it on a Large Crag Boar around this area.
Tame a Large Crag Boar |q 6064/1 |goto Dun Morogh 48.26,56.81
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6064 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
use the Taming Rod##15913
|tip Use it on a Snow Leopard around this area.
Tame a Snow Leopard |q 6084/1 |goto Dun Morogh 48.68,58.93
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6084 |goto Dun Morogh 45.81,53.04
accept Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
use the Taming Rod##15908
|tip Use it on an Ice Claw Bear around this area.
Tame an Ice Claw Bear |q 6085/1 |goto Dun Morogh 49.06,62.12
You can usually find another one around [50.11,53.57]
|only if Dwarf Hunter
step
talk Grif Wildheart##1231
turnin Taming the Beast##6085 |goto Dun Morogh 45.81,53.04
accept Training the Beast##6086 |goto Dun Morogh 45.81,53.04
|only if Dwarf Hunter
step
Follow the path up |goto Dun Morogh 47.25,41.65 < 30 |only if walking
Enter the building |goto Ironforge 66.34,82.50 < 10 |walk
talk Belia Thundergranite##10090
|tip Inside the building.
turnin Training the Beast##6086 |goto Ironforge 70.87,85.80
|only if Dwarf Hunter
step
_NOTE:_
You Can Now Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Use your "Beast Training" ability to teach your pet abilities.
Click Here to Continue |confirm |q 413
|only if Dwarf Hunter
step
talk Sognar Cliffbeard##5124
|tip He walks around this area.
buy Tough Jerky##117 |n
|tip Buy 20-40, whatever you have money and bag space for.
|tip This will be used to feed your permanent pet soon and keep it Happy, so it deals more damage and gains Loyalty faster.
|tip By keeping your pet Happy and ranking up its Loyalty, it won't run away and abandon you, and will need food less often to stay Happy.
Visit the Vendor |vendor Sognar Cliffbeard##5124 |goto Ironforge 60.54,78.45 |q 413
|only if Dwarf Hunter
step
Run up the stairs and enter the building |goto Ironforge 61.32,88.18 < 7 |walk
talk Buliwyf Stonehand##11865
|tip Inside the building.
|tip This will allow you to equip two-handed maces.								|only if Dwarf Warrior
|tip This will allow you to equip two-handed axes and two-handed maces.						|only if Gnome Warrior
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0 |goto Ironforge 61.17,89.52				|only if Gnome Warrior
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Ironforge 61.17,89.52
|only if Warrior
step
talk Kelomir Ironhand##5121
|tip Inside the building.
buy Giant Mace##1197 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Kelomir Ironhand##5121 |goto Ironforge 62.55,88.71 |q 433 |future
|only if Warrior and itemcount(1197) == 0
step
Enter the building |goto Dun Morogh 46.95,52.06 < 10 |walk
talk Maxan Anvol##1226
|tip Inside the building
accept Desperate Prayer##5637 |goto Dun Morogh 47.34,52.19
|only if Dwarf Priest
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Priest"	|or	|q 433 |future
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Priest"	|or	|q 433 |future
|only if Dwarf Priest
step
label "Create_Wand_Priest"
collect 70 Linen Cloth##2589 |q 433 |future
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Dwarf Priest
step
Enter the building |goto Ironforge 43.84,29.66 < 10 |walk
talk Uthrar Threx##1703
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Ironforge 43.82,27.86 |q 433 |future
|only if Dwarf Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 433 |future
|only if Dwarf Priest
step
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Ironforge 42.94,28.31 |q 433 |future
|only if Dwarf Priest
step
talk Uthrar Threx##1703
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Ironforge 43.82,27.86 |q 433 |future
|only if Dwarf Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 433 |future
|only if Dwarf Priest
step
Enter the building |goto Ironforge 59.73,44.08 < 10 |walk
talk Gimble Thistlefuzz##5157
|tip Upstairs inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Ironforge 59.77,45.45 |q 433 |future
|only if Dwarf Priest
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Tilli Thistlefuzz here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Ironforge 61.03,44.00 |q 433 |future
collect 2 Lesser Magic Essence##10938 |goto Ironforge 61.03,44.00 |q 433 |future
|only if Dwarf Priest
step
talk Tilli Thistlefuzz##5158
|tip Inside the building.
buy Copper Rod##6217 |goto Ironforge 61.03,44.00 |q 433 |future
buy Simple Wood##4470 |goto Ironforge 61.03,44.00 |q 433 |future
|only if Dwarf Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 433 |future
|only if Dwarf Priest
step
talk Gimble Thistlefuzz##5157
|tip Upstairs inside the building.
|tip This should be available with 10 Enchanting.
learn Lesser Magic Wand##14293 |goto Ironforge 59.77,45.45 |q 433 |future
|only if Dwarf Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 433 |future
|only if Dwarf Priest
step
talk Dink##7312 |only if Mage
talk Regnus Thundergranite##5117 |only if Hunter
talk Briarthorn##5172 |only if Warlock
talk Bilban Tosslespanner##5114 |only if Warrior
talk Toldren Deepiron##5143 |only if Priest
talk Brandur Ironhammer##5149 |only if Paladin
talk Fenthwick##5167 |only if Rogue
trainer Dink##7312 |goto Ironforge/0 27.10,8.49 |only if Mage |q 433 |future
trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.86,82.94 |only if Hunter |q 433 |future
trainer Briarthorn##5172 |goto Ironforge/0 50.33,5.70 |only if Warlock |q 433 |future
trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.92,88.39 |only if Warrior |q 433 |future
trainer Fenthwick##5167 |goto Ironforge/0 51.49,15.33 |only if Rogue |q 433 |future
trainer Toldren Deepiron##5143 |goto Ironforge/0 25.19,10.76 |only if Priest |q 433 |future
trainer Brandur Ironhammer##5149 |goto Ironforge/0 23.11,6.14 |only if Paladin |q 433 |future
|tip Inside the building.
|tip Train your spells.
step
Follow the path up |goto Dun Morogh 47.20,41.70 < 20 |only if walking and not zone("Ironforge")
talk Lago Blackwrench##6120
accept The Slaughtered Lamb##1715 |goto Ironforge 47.63,9.26
|only if Gnome Warlock
step
Follow the path |goto Ironforge 72.82,50.18 < 20 |walk
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Ironforge 76.58,51.14 |q 6662 |future
|tip Walk into the swirling portal.
|tip We cannot give you an arrow to follow here as it is inside an instance.
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
|tip We cannot give you an arrow to follow here as it is inside an instance.
accept Deeprun Rat Roundup##6661
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
use Rat Catcher's Flute##17117
|tip Use it on Deeprun Rats around this area.
|tip They look like small grey rats on the ground around this area.
|tip In the Ironforge section of the Deeprun Tram.
Capture #5# Rats |q 6661/1
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
|tip We cannot give you an arrow to follow here as it is inside an instance.
turnin Deeprun Rat Roundup##6661
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
Watch the dialogue
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
accept Me Brother, Nipsy##6662
|only if Gnome Warlock
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the Deeprun Tram from Ironforge to Stormwind City.
talk Nipsy##13018
|tip On the middle platform, near the wall.
|tip In the Stormwind City section of the Deeprun Tram.
turnin Me Brother, Nipsy##6662
|only if Gnome Warlock
step
_NOTE:_
Tame a Winter Wolf
|tip Use your "Tame Beast" ability on a Winter Wolf.
|tip They look like white wolves around this area.
|tip This will be your permanent pet for a little while.
Click Here to Continue |confirm |goto Dun Morogh 51.23,45.55 |q 413
|only if Dwarf Hunter
step
_Inside Deeprun Tram:_
Enter Stormwind City |complete zone("Stormwind City") |q 1715
|tip Walk into the swirling portal.
|only if Gnome Warlock
step
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin The Slaughtered Lamb##1715 |goto Stormwind City 25.26,78.56
accept Surena Caledon##1688 |goto Stormwind City 25.26,78.56
|only Gnome Warlock
step
Leave the building |goto Stormwind City 29.15,74.18 < 10 |walk |only if subzone("The Slaughtered Lamb")
Enter the building |goto Stormwind City 53.44,64.92 < 10 |walk
talk Innkeeper Allison##6740
|tip Inside the building.
home Stormwind City |goto Stormwind City 52.62,65.70
|only if Gnome Warlock
step
Enter the building |goto Elwynn Forest 70.93,80.43 < 10 |walk
kill Surena Caledon##881
|tip Inside the building.
|tip You will pull 3 enemies. Apply DoTs and Wand Surena. Put your pet on Morgan, and fear the third.
|tip Make a healthstone and don't forget to use it if needed.
|tip Morgan does a backstab, don't turn your back to him! |only if hardcore
|tip Don't be afraid to ask for help from people in the area. |only if hardcore
|tip We have a video of us doing this step below if you want to see how it's performed before you pull.
Click Here To Copy The Video Link |popuptext youtu.be/unJ1RuAlDTY
collect Surena's Choker##6810 |q 1688/1 |goto Elwynn Forest 71.02,80.78
|only if Gnome Warlock
step
Enter the building |goto Stormwind City 29.15,74.18 < 10 |walk
talk Gakin the Darkbinder##6122
|tip Downstairs inside the building.
turnin Surena Caledon##1688 |goto Stormwind City 25.26,78.56
accept The Binding##1689 |goto Stormwind City 25.26,78.56
|only Gnome Warlock
step
use the Bloodstone Choker##6928
|tip Use it while standing on the pink symbol on the ground.
|tip Downstairs inside the building, inside the crypt.
kill Summoned Voidwalker##5676 |q 1689/1 |goto Stormwind City 25.11,77.46
|only if Gnome Warlock
step
talk Gakin the Darkbinder##6122
|tip Upstairs inside the building, in the basement above the crypt.
turnin The Binding##1689 |goto Stormwind City 25.25,78.53
|only if Gnome Warlock
step
_NOTE:_
Create Soul Shards
|tip As you follow the guide, use your "Drain Soul" spell as you kill an enemy to get a Soul Shard.
|tip Once you have a Soul Shard, use your "Summon Voidwalker" ability to summon your voidwalker.
|tip It will tank enemies for you, making it easier to kill enemies.
Click Here to Continue |confirm |q 433 |future
|only if Gnome Warlock
step
Leave the building |goto Stormwind City 29.15,74.14 < 10 |c |q 433 |future
|only if Gnome Warlock and subzone("The Slaughtered Lamb")
step
talk Rudra Amberstill##1265
accept Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|tip Only do this quest if you purchased throwing weapons |only if Warrior or Rogue
|tip And you trained Gouge |only if Rogue
|tip And you trained Hamstring |only if Warrior
|tip Skip this step if you aren't comfortable cheesing an elite, you will just need to grind more later. |only if hardcore
|tip We strongly recommend watching the video below before attempting this quest.
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE
|only if not Paladin
step
Aggro Vagash |goto Dun Morogh 62.41,48.08 > 10
|tip He can spawn deep in the cave. Wait for him to come out if you want an easier time.
|tip Follow the arrow and kite him to the fence location.
|tip Hop back and forth over the fence so Vagash can't attack you while you whittle him down.
|tip We strongly recommend watching the video below before attempting this quest.
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE
collect Fang of Vagash##3627 |q 314/1 |goto Dun Morogh 63.90,49.86
|only if not Paladin
step
talk Rudra Amberstill##1265
turnin Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|only if not Paladin
step
label "Skip_Wand_Priest"
talk Senator Mehr Stonehallow##1977
accept The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
accept Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
stickystart "Kill_Rockjaw_Skullthumpers"
stickystart "Collect_Linen_Cloth_Priest"
stickystart "Collect_Linen_Cloth_Paladin"
step
Enter the cave |goto Dun Morogh 70.70,56.49 < 20 |walk
kill 10 Rockjaw Bonesnapper##1117 |q 433/1 |goto Dun Morogh 70.98,54.77
|tip Inside the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
step
label "Kill_Rockjaw_Skullthumpers"
kill 6 Rockjaw Skullthumper##1115 |q 432/1 |goto Dun Morogh 70.70,56.49
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
step
Kill enemies around this area
|tip Inside and outside the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Getting this far into level 10 will allow you to reach level 11 after turning in quests soon.
|tip There aren't enough quests to reach level 11 naturally in Dun Morogh.
|tip This is a longer grind, but is still much faster than traveling far to another zone, like Elwynn Forest, to complete quests.
|tip Being level 11 will allow you to be able to more comfortably complete quests in Loch Modan, which is a much closer zone.
|tip Also, a lot of grey and green weapons drop from these enemies, so grinding them will get you a lot of money to use for weapon upgrades, learning abilities, and buying bags.
ding 10,6400 |goto Dun Morogh 70.70,56.49
You can sell items at Frast Dokner who walks around [68.87,55.96]
step
label "Collect_Linen_Cloth_Priest"
Kill enemies around this area
|tip Inside and outside the cave.
|tip Be sure to check behind you for respawns if inside the cave. |only if hardcore
|tip Also try to keep a clear escape route. |only if hardcore
|tip You are collecting these to make your wand soon.
collect 70 Linen Cloth##2589 |goto Dun Morogh 70.70,56.49 |q 291 |future
|tip Be careful not to accidentally sell these to a vendor.
|only if Priest
step
label "Collect_Linen_Cloth_Paladin"
Kill enemies around this area
|tip Inside and outside the cave.
|tip Be sure to check behind you for respawns if inside the cave. |only if hardcore
|tip Also try to keep a clear escape route. |only if hardcore
|tip You will need these soon for a Paladin class quest.
collect 10 Linen Cloth##2589 |goto Dun Morogh 70.70,56.49 |q 1648 |future
|tip Be careful not to accidentally sell these to a vendor.
|only if Paladin
step
Leave the cave |goto Dun Morogh 70.70,56.49 < 20 |walk |only if subzone("Gol'Bolar Quarry Mine")
Follow the path up |goto Dun Morogh 67.86,57.69 < 20 |only if walking
talk Senator Mehr Stonehallow##1977
turnin The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
turnin Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
step
talk Cook Ghilm##1355
|tip He walks around this area.
|tip You need to have the Cooking profession learned in order to accept a quest soon.
Learn Cooking |skillmax Cooking,75 |goto Dun Morogh 68.38,54.49 |q 419 |future
step
Follow the road |goto Dun Morogh 67.68,52.75 < 40 |only if walking and subzone("Gol'Bolar Quarry")
Follow the road and run through the tunnel |goto Dun Morogh 81.21,42.70 < 10 |only if walking and not subzone("North Gate Outpost")
talk Pilot Hammerfoot##1960
accept The Lost Pilot##419 |goto Dun Morogh 83.89,39.19
step
click A Dwarven Corpse##2059
turnin The Lost Pilot##419 |goto Dun Morogh 79.67,36.17
accept A Pilot's Revenge##417 |goto Dun Morogh 79.67,36.17
step
kill Mangeclaw##1961
|tip He walks around this area.
collect Mangy Claw##3183 |q 417/1 |goto Dun Morogh 78.31,37.76
step
talk Pilot Hammerfoot##1960
turnin A Pilot's Revenge##417 |goto Dun Morogh 83.89,39.19
step
Run through the tunnel |goto Dun Morogh 84.42,31.02 < 10 |only if walking and not zone("Loch Modan")
Enter the building |goto Loch Modan 23.53,17.89 < 10 |walk
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
accept Filthy Paws##307 |goto Loch Modan 24.76,18.40
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
step
_NOTE:_
Tame a Forest Lurker
|tip Use your "Tame Beast" ability on a Forest Lurker.
|tip They look like brown spiders around this area.
|tip This will be your permanent pet for a little while.
Click Here to Continue |confirm |goto Loch Modan 35.69,31.78 |q 307
You can find more around: |notinsticky
[Loch Modan 29.17,23.57]
[Loch Modan 29.43,48.28]
|only if Dwarf Hunter
step
Kill enemies around this area
|tip Getting this far into level 11 will allow you to reach level 12 after turning in quests soon.
|tip You are about to have to complete a quest that can be pretty difficult at level 11, so being a level higher will help.
ding 11,7950 |goto Loch Modan 35.69,31.78 |q 418 |future
You can find more around: |notinsticky
[29.17,23.57]
[29.43,48.28]
stickystop "Collect_Boar_Intestines"
stickystop "Collect_Spider_Ichors"
stickystop "Collect_Bear_Meat"
step
Enter the building |goto Loch Modan 35.23,47.75 < 7 |walk
talk Vidra Hearthstove##1963
|tip Inside the building.
accept Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
step
talk Yanni Stoutheart##1682
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Yanni Stoutheart##1682 |goto Loch Modan 34.76,48.62 |q 416 |future
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
accept Rat Catching##416
accept Mountaineer Stormpike's Task##1339
step
talk Vrok Blunderblast##1469
buy Hunter's Boomstick##2511 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Vrok Blunderblast##1469 |goto Loch Modan 35.83,43.46 |q 307
|only if Hunter and itemcount(2511) == 0
step
Enter the building |goto Loch Modan 37.18,47.09 < 7 |walk
talk Brock Stoneseeker##1681
|tip Downstairs inside the building.
|tip He sometimes walks out near the entrance of the building.
accept Honor Students##6387 |goto Loch Modan 37.02,47.81
|only if Dwarf or Gnome
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
stickystart "Collect_Tunnel_Rat_Ears"
step
click Miners' League Crates##271
|tip They look like piles of brown boxes on the ground around this area inside the mine.
|tip This mine can be dangerous, so try to stay near the entrance and wait for boxes to respawn, if you can, so you can leave quickly when you're finished.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Tunnel Rat Geomancers are casters that deal heavy damage. |only if hardcore
collect 4 Miners' Gear##2640 |q 307/1 |goto Loch Modan 35.48,18.85
step
label "Collect_Tunnel_Rat_Ears"
Leave the mine |goto Loch Modan 35.48,18.85 < 10 |walk |only if subzone("Silver Stream Mine") and _G.IsIndoors()
Kill Tunnel Rat enemies around this area
collect 12 Tunnel Rat Ear##3110 |q 416/1 |goto Loch Modan 24.57,29.79
|tip Watch for patrols and respawns while in the area. |only if hardcore
You can find more around [26.08,43.64]
step
Enter the building |goto Loch Modan 23.53,17.89 < 10 |walk
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
turnin Filthy Paws##307 |goto Loch Modan 24.76,18.40
turnin Mountaineer Stormpike's Task##1339 |goto Loch Modan 24.76,18.40
accept Stormpike's Order##1338 |goto Loch Modan 24.76,18.40
step
label "Collect_Boar_Intestines"
kill Mountain Boar##1190+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Boar Intestines##3172 |goto Loch Modan 36.99,34.36 |q 418 |future
You can find more around [Loch Modan 29.17,23.57]
step
label "Collect_Spider_Ichors"
kill Forest Lurker##1195+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Spider Ichor##3174 |goto Loch Modan 35.69,31.78 |q 418 |future
You can find more around: |notinsticky
[29.17,23.57]
[29.43,48.28]
step
label "Collect_Bear_Meat"
kill Elder Black Bear##1186+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Bear Meat##3173 |goto Loch Modan 35.68,32.10 |q 418 |future
You can find more around: |notinsticky
[30.73,25.86]
[28.66,11.57]
[24.03,25.79]
[27.45,28.54]
[28.09,40.94]
step
talk Vidra Hearthstove##1963
|tip Inside the building.
turnin Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
step
talk Vrok Blunderblast##1469
buy Hunter's Boomstick##2511 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Vrok Blunderblast##1469 |goto Loch Modan 35.83,43.46 |q 416
|only if Hunter and itemcount(2511) == 0
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
turnin Rat Catching##416
step
talk Thorgrum Borrelson##1572
fpath Thelsamar |goto Loch Modan 33.94,50.95
step
talk Thorgrum Borrelson##1572
turnin Honor Students##6387 |goto Loch Modan 33.94,50.95
accept Ride to Ironforge##6391 |goto Loch Modan 33.94,50.95
|only if Dwarf or Gnome
step
Follow the path |goto Ironforge 44.58,49.54 < 10 |walk
talk Senator Barin Redstone##1274
turnin The Reports##291 |goto Ironforge 39.55,57.49
step
Run up the stairs and enter the building |goto Ironforge 49.59,28.51 < 7 |walk
talk Golnir Bouldertoe##4256
|tip Downstairs inside the building.
turnin Ride to Ironforge##6391 |goto Ironforge 51.52,26.30
accept Gryth Thurden##6388 |goto Ironforge 51.52,26.30
|only if Dwarf or Gnome
step
talk Dink##7312 |only if Mage
talk Regnus Thundergranite##5117 |only if Hunter
talk Briarthorn##5172 |only if Warlock
talk Bilban Tosslespanner##5114 |only if Warrior
talk Toldren Deepiron##5143 |only if Priest
talk Brandur Ironhammer##5149 |only if Paladin
talk Fenthwick##5167 |only if Rogue
trainer Dink##7312 |goto Ironforge/0 27.10,8.49 |only if Mage |q 6388
trainer Regnus Thundergranite##5117 |goto Ironforge/0 69.86,82.94 |only if Hunter |q 6388
trainer Briarthorn##5172 |goto Ironforge/0 50.33,5.70 |only if Warlock |q 6388
trainer Bilban Tosslespanner##5114 |goto Ironforge/0 65.92,88.39 |only if Warrior |q 6388
trainer Fenthwick##5167 |goto Ironforge/0 51.49,15.33 |only if Rogue |q 6388
trainer Toldren Deepiron##5143 |goto Ironforge/0 25.19,10.76 |only if Priest |q 6388
trainer Brandur Ironhammer##5149 |goto Ironforge/0 23.11,6.14 |only if Paladin |q 6388
|tip Inside the building.
|tip Train your spells.
step
Enter the building |goto Ironforge 27.30,12.45 < 15 |walk
talk Brandur Ironhammer##5149
|tip Inside the building.
accept Tome of Divinity##2999 |goto Ironforge 23.12,6.14
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin Tome of Divinity##2999 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1645 |goto Ironforge 27.64,12.19 |instant
|only if Dwarf Paladin
step
use the Tome of Divinity##6916
accept The Tome of Divinity##1646
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1646 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1647 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
map Ironforge
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	21.75,51.75	21.97,54.66	22.70,58.39	23.32,61.81	23.72,63.80
path	25.81,67.98	27.55,71.41	31.72,78.27	36.24,81.32	39.82,83.22
path	42.92,84.10
talk John Turner##6175
|tip He walks around this area in a large path.
turnin The Tome of Divinity##1647
accept The Tome of Divinity##1648
|only if Dwarf Paladin
step
map Ironforge
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	21.75,51.75	21.97,54.66	22.70,58.39	23.32,61.81	23.72,63.80
path	25.81,67.98	27.55,71.41	31.72,78.27	36.24,81.32	39.82,83.22
path	42.92,84.10
talk John Turner##6175
|tip He walks around this area in a large path.
|tip You should already have 10 Linen Cloth from earlier in the guide.
turnin The Tome of Divinity##1648
accept The Tome of Divinity##1778
|only if Dwarf Paladin
step
Enter the building |goto Ironforge 27.30,12.45 < 15 |walk
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1778 |goto Ironforge 27.64,12.19
accept The Tome of Divinity##1779 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
talk Muiredon Battleforge##6178
|tip Upstairs inside the building.
turnin The Tome of Divinity##1779 |goto Ironforge 23.53,8.29
accept The Tome of Divinity##1783 |goto Ironforge 23.53,8.29
|only if Dwarf Paladin
step
talk Gryth Thurden##1573
turnin Gryth Thurden##6388 |goto Ironforge 55.51,47.74
accept Return to Brock##6392 |goto Ironforge 55.51,47.74
|only if Dwarf or Gnome
step
Enter the building |goto Loch Modan 37.18,47.09 < 10 |walk
talk Brock Stoneseeker##1681
|tip Downstairs inside the building.
|tip He sometimes walks out near the entrance of the building.
turnin Return to Brock##6392 |goto Loch Modan 37.02,47.81
|only if Dwarf or Gnome
step
Enter the building |goto Loch Modan 35.23,47.74 < 10 |walk
talk Innkeeper Hearthstove##6734
|tip Inside the building.
home Stoutlager Inn |goto Loch Modan 35.53,48.40
step
talk Mountaineer Cobbleflint##1089
accept In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.12
step
Enter the building |goto Loch Modan 23.71,75.47 < 10 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
accept The Trogg Threat##267 |goto Loch Modan 23.23,73.67
stickystart "Kill_Stonesplinter_Troggs"
stickystart "Kill_Stonesplinter_Scouts"
step
Follow the road to the path here |goto Loch Modan 29.32,66.73 < 40 |only if walking and not subzone("Stonesplinter Valley")
Kill Stonesplinter enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
collect 8 Trogg Stone Tooth##2536 |q 267/1 |goto Loch Modan 32.51,73.25
step
label "Kill_Stonesplinter_Troggs"
kill 10 Stonesplinter Trogg##1161 |q 224/1 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
label "Kill_Stonesplinter_Scouts"
kill 10 Stonesplinter Scout##1162 |q 224/2 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
Kill enemies around this area
|tip Getting this far into level 12 will allow you to reach level 13 after turning in quests soon.
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
ding 12,8300 |goto Loch Modan 32.51,73.25
step
Leave Stonesplinter Valley and follow the road |goto Loch Modan 30.57,69.69 < 20 |only if walking and subzone("Stonesplinter Valley")
talk Mountaineer Cobbleflint##1089
turnin In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.13
step
Enter the building |goto Loch Modan 23.71,75.45 < 7 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
turnin The Trogg Threat##267 |goto Loch Modan 23.23,73.67
step
Follow the path up |goto Loch Modan 21.32,68.12 < 20 |only if walking and not subzone("South Gate Outpost")
Run through the tunnel |goto Loch Modan 19.56,62.74 < 10 |only if walking and not subzone("South Gate Outpost")
talk Mountaineer Barleybrew##1959
turnin Shimmer Stout##413 |goto Dun Morogh 86.28,48.81
accept Stout to Kadrell##414 |goto Dun Morogh 86.28,48.81
step
Run through the tunnel |goto Dun Morogh 84.20,51.34 < 10 |only if walking and subzone("South Gate Outpost")
use the Symbol of Life##6866
|tip Use it on Narm Faulk's corpse.
|tip This will resurrect him and allow you to talk to him.
Watch the dialogue
talk Narm Faulk##6177
turnin The Tome of Divinity##1783 |goto Dun Morogh 78.32,58.09
accept The Tome of Divinity##1784 |goto Dun Morogh 78.32,58.09
|only if Dwarf Paladin
step
kill Dark Iron Spy##6123+
collect Dark Iron Script##6847 |q 1784/1 |goto Dun Morogh 77.39,61.27
|only if Dwarf Paladin
step
talk Yanni Stoutheart##1682
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Yanni Stoutheart##1682 |goto Loch Modan 34.76,48.62 |q 414
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
turnin Stout to Kadrell##414
step
Run up the stairs and enter the building |goto Ironforge 61.32,88.18 < 7 |walk
talk Bixi Wobblebonk##13084
|tip Inside the building.
|tip This will allow you to equip thrown weapons.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
Enter the building |goto Ironforge 27.30,12.45 < 15 |only if walking
talk Muiredon Battleforge##6178
|tip Upstairs inside the building.
turnin The Tome of Divinity##1784 |goto Ironforge 23.53,8.29
accept The Tome of Divinity##1785 |goto Ironforge 23.53,8.29
|only if Dwarf Paladin
step
talk Tiza Battleforge##6179
|tip Upstairs inside the building.
turnin The Tome of Divinity##1785 |goto Ironforge 27.64,12.19
|only if Dwarf Paladin
step
Follow the path |goto Ironforge 72.82,50.18 < 20 |walk
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Ironforge 76.97,51.25 |c |q 6661 |future
|tip Walk into the swirling portal.
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
accept Deeprun Rat Roundup##6661
step
_Inside Deeprun Tram:_
use Rat Catcher's Flute##17117
|tip Use it on Deeprun Rats around this area.
|tip They look like small grey rats on the ground around this area.
|tip In the Ironforge section of the Deeprun Tram.
Capture #5# Rats |q 6661/1
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
turnin Deeprun Rat Roundup##6661
step
_Inside Deeprun Tram:_
Watch the dialogue
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
accept Me Brother, Nipsy##6662
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the Deeprun Tram from Ironforge to Stormwind City.
talk Nipsy##13018
|tip On the middle platform, near the wall.
|tip In the Stormwind City section of the Deeprun Tram.
turnin Me Brother, Nipsy##6662
step
_Inside Deeprun Tram:_
Enter Stormwind City |complete zone("Stormwind City") |q 1338
|tip Walk into the swirling portal.
step
talk Furen Longbeard##5413
turnin Stormpike's Order##1338 |goto Stormwind City 58.09,16.53
step
Run through the doorway |goto Stormwind City 74.91,51.56 < 10 |only if walking
Enter the building |goto Stormwind City 77.97,48.19 < 10 |walk
talk Ilsa Corbin##5480
|tip Upstairs inside the building.
accept A Warrior's Training##1638 |goto Stormwind City 78.50,45.71 |or
'|complete completedq(1679) |or
|only if (Dwarf or Gnome) and Warrior
step
Leave the Command Center |goto Stormwind City 74.89,51.59 < 10 |walk |only if subzone("Command Center")
Enter the building |goto Stormwind City 71.66,39.89 < 10 |walk
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26 |or
'|complete completedq(1678) |or
|only if (Dwarf or Gnome) and Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|tip He will attack you immediately after you accept this quest.
|only if (Dwarf or Gnome) and Warrior
step
kill Bartleby##6090
|tip He walks around this area inside the building.
|tip He will eventually surrender.
Beat Bartleby |q 1640/1 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|only if (Dwarf or Gnome) and Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17 |or
'|complete completedq(1678) |or
|only if (Dwarf or Gnome) and Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26 |or
'|complete completedq(1678) |or
|only if (Dwarf or Gnome) and Warrior
step
Enter the building |goto Stormwind City 56.66,57.71 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to equip two-handed swords and staves.
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0 |goto Stormwind City 57.13,57.71
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Stormwind City 57.13,57.71
|only if Warrior
step
Enter the building |goto Stormwind City 56.66,57.71 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to equip two-handed swords.
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Paladin
step
Enter the building |goto Stormwind City 56.66,57.71 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to equip one-handed swords.
Train One-Handed Swords |complete weaponskill("SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Rogue
step
talk Gunther Weller##1289
|tip Inside the building.
buy Cutlass##851 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Gunther Weller##1289 |goto Stormwind City 57.55,57.07 |q 3524 |future
|only if Rogue and itemcount(851) ==0
step
Enter the building |goto Stormwind City 43.04,34.49 < 10 |walk
talk High Priestess Laurena##376
|tip Inside the building.
turnin Desperate Prayer##5635 |goto Stormwind City 38.58,26.01
|only if Dwarf Priest
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Stormwind City 57.13,57.71
|only if Dwarf Priest
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use one-handed swords.
Train One-Handed Swords |complete weaponskill("SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Mage
step
Enter the building |goto Stormwind City 56.66,57.70 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to use staves and one-handed swords.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Stormwind City 57.13,57.71
Train One-Handed Swords |complete weaponskill("SWORD") > 0 |goto Stormwind City 57.13,57.71
|tip By the time you're able to use these, you'll be far away from a vendor that sells them, so we are buying them now.
|only if Warlock
|only if Warlock and subzone("The Slaughtered Lamb")
step
Run up the ramp |goto Stormwind City 62.39,62.31 < 15 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
fpath Stormwind |goto Stormwind City 66.27,62.14
step
_Note_
We are going to Menethil Harbor.
|tip We are heading to Darkshore to quest since quests will get hard here soon.
|tip There is a slow (45 minutes) but safe way, or a fast (10 minutes) but slightly dangerous way that also lets you train spells.
|tip This will be your only chance to train in the next 6-8 levels. |only if Warlock or Paladin or Mage
|tip We have a video to help with the fast route.
I want the fast route.		|confirm	|next "Fast_Route"	|or	|q 3524 |future
I want the slow but safe route.	|confirm	|next "Safe_Route"	|or	|q 3524 |future
|only if hardcore
step
label "Fast_Route"
Head to the path above the frozen lake |goto Dun Morogh/0 58.11,41.94 < 30 |only if walking
Continue up the hill |goto Dun Morogh/0 60.60,44.07 < 10 |only if walking
Jump at the dark part of the mountain to skip up. Watch the video if you need visual help, it can be confusing. |goto Dun Morogh/0 60.72,44.18 < 1 |only if walking
Jump up the hill further |goto Dun Morogh/0 61.03,44.06 < 10 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.03,44.06 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.14,41.38 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 59.51,40.00 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 59.23,39.15 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.29,37.96 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 61.37,32.08 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 62.14,27.43 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.16,25.74 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.34,23.87 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 63.89,22.33 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 65.14,22.40 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 66.77,19.23 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 67.82,18.03 < 15 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 67.06,14.43 < 15 |only if walking
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Dun Morogh/0 65.79,12.22 < 10 |only if walking
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Dun Morogh/0 65.58,10.85 < 10 |only if walking
Jump onto the small hill and be full health before jumping |goto Dun Morogh/0 65.75,10.05 < 10 |only if walking
Continue following the arrow exactly |goto Dun Morogh/0 66.95,9.91 < 15 |only if walking
Continue following the arrow exactly |goto Wetlands/0 25.52,68.63 < 15 |only if walking |notravel
Continue following the arrow exactly |goto Wetlands/0 17.77,67.76 < 15 |only if walking |notravel
You are going to jump down the cliff, you cannot die if you're full health and jump towards the arrow. |goto Wetlands/0 17.05,67.44 < 15 |only if walking |notravel
Be full health and jump towards the arrow exactly |goto Wetlands/0 16.63,65.19 < 10 |only if walking |notravel
Be full health and jump towards the arrow exactly |goto Wetlands/0 16.14,64.41 < 10 |only if walking |notravel
There are two crocodiles in the water and murlocs to your left. Take your time and wait for a good window before crossing. |goto Wetlands/0 14.97,63.97 < 20 |only if walking |notravel
Follow the arrow exactly to reach Menethil Harbor |goto Wetlands/0 12.62,60.96 < 30 |q 3524 |future |next "Post_Menethil_Skip" |only if walking |notravel
|tip You can watch a video of us doing the route if want to be extra safe by clicking here:
Click Here To Copy The Video Link |popuptext www.youtube.com/watch?v=g5Aak-n_XJk
|only if hardcore
step
label "Safe_Route"
Enter the water in Westfall and swim north along the coast to Menethil Harbor in the Wetlands |goto Westfall 54.32,9.30 < 50 |c |q 963 |future
|only if hardcore
step
Swim along the coast to Menethil Harbor in the Wetlands |goto Wetlands 9.37,61.86 < 40 |c |q 963 |future |notravel
|tip This is a long swim (30+ minutes), but it is very safe with no enemies along the way.
|tip There is virtually no risk of dying, unlike other methods.
|tip As you swim north, stay close enough to the cliffs to avoid getting too fatigued.
|tip Once you reach Baradin Bay, near Menethil Harbor, swim through the middle of the bay in the parts that don't make you fatigued.
|only if hardcore
step
label "Post_Menethil_Skip"
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
|only if hardcore
step
Follow the path up |goto Dun Morogh 30.71,34.33 < 10 |only if walking
Continue up the path |goto Dun Morogh 31.06,32.56 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.43,32.34 < 7 |only if walking
Continue up the path |goto Dun Morogh 31.14,30.50 < 7 |only if walking
Follow the path down |goto Dun Morogh 32.33,28.63 < 15 |only if walking
Follow the path |goto Dun Morogh 32.74,27.11 < 20 |only if walking
Jump to Your Death |havebuff Ghost##8326 |goto Eastern Kingdoms 44.92,51.98 |q 963 |future |notravel
|tip While you are in the Wetlands, keep running north and jump off the cliff.
|tip This is a much easier and faster way to reach Menethil Harbor.
|tip We are heading to Darkshore to quest since quests will get hard here soon.
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer Near Menethil Harbor |complete not isdead |goto Wetlands 11.72,43.30 |q 963 |future |zombiewalk
|only if not hardcore
step
Enter Menethil Harbor and the building |goto Wetlands 10.25,56.45 < 10 |walk |only if not subzone("Menethil Keep")
talk Neal Allen##1448
|tip Inside the building.
buy Bronze Tube##4371 |n
|tip If you can afford it.
|tip It may not be for sale, since it's a limited supply item.
|tip This item is needed for a quest later on in Duskwood.
Visit the Vendor |vendor Neal Allen##1448 |goto Wetlands 10.75,56.75 |q 174 |future
|only if not hardcore
step
talk Vesprystus##3838
fpath Rut'theran Village |goto Teldrassil 58.40,94.02
|only if Hunter
step
talk Ilyenia Moonfire##11866
|tip This will allow you to use bows.
Train Bows |complete weaponskill("BOW") > 0 |goto Darnassus 57.56,46.73
|only if Hunter
step
talk Ariyell Skyshadow##4203
buy Laminated Recurve Bow##2507 |n
|tip If you can afford it.
|tip If you have better, skip this step.
|tip Also buy a Small Quiver or Medium Quiver, whichever you can afford.
Visit the Vendor |vendor Ariyell Skyshadow##4203 |goto Darnassus 58.76,44.50 |q 3524 |future
|only if Hunter and itemcount(2507) == 0
step
talk Ilyenia Moonfire##11866
|tip This will allow you to use staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Darnassus 57.56,46.73
|only if Hunter
]])
ZygorGuidesViewer:RegisterGuide("Leveling Guides\\Night Elf Starter (1-13)",{
image=ZGV.IMAGESDIR.."Teldrassil",
condition_suggested=function() return raceclass('NightElf') and level <= 13 end,
condition_suggested_race=function() return raceclass('NightElf') end,
condition_suggested_exclusive=true,
next="Leveling Guides\\Darkshore (13-17)",
hardcore = true,
},[[
step
_NOTE:_
Save All Linen Cloth You Find
|tip As you quest in Teldrassil, save all Linen Cloth you find.
|tip Be careful not to accidentally sell them to a vendor.
|tip You will need ~70 Linen Cloth when you are level 10-11.
|tip You will use them to create your wand, which will be a powerful weapon for you.
|tip However, if you are confident you will be able to buy a wand from the Auction House (if this isn't a new or populated server), you can ignore this. |only if not selfmade
Click Here to Continue |confirm |q 456 |future
|only if Priest
step
_Destroy This Item:_
|tip You won't use it in the Shadowglen starter area.
|tip You will get another one before you need to use it.
trash Hearthstone##6948 |goto Teldrassil 58.69,44.27
|only if not hardcore
step
talk Conservator Ilthalaine##2079
accept The Balance of Nature##456 |goto Teldrassil 58.69,44.27
stickystart "Kill_Young_Thistle_Boars"
step
kill 7 Young Nightsaber##2031 |q 456/1 |goto Teldrassil 61.93,42.02
step
label "Kill_Young_Thistle_Boars"
kill 4 Young Thistle Boar##1984 |q 456/2 |goto Teldrassil 61.93,42.02
step
Grind mobs here until you reach level 3.
|tip It is not recommended to skip this grinding step. The mobs hyper-spawn here and we need this experience later.
ding 3 |goto Teldrassil 61.93,42.02
step
talk Dirania Silvershine##8583
|tip You must be level 2 for this quest to be available. |only if level < 2
accept A Good Friend##4495 |goto Teldrassil 60.90,41.96
step
talk Melithar Staghelm##2077
accept The Woodland Protector##458 |goto Teldrassil 59.93,42.48
step
talk Keina##3589
|tip Inside the building
|tip Sell your goods from grinding.
|tip Restock on ammo |only if Hunter
vendor Keina##3589 |goto Teldrassil/0 59.32,41.12 |q 456
step
talk Conservator Ilthalaine##2079
turnin The Balance of Nature##456 |goto Teldrassil 58.70,44.27
accept The Balance of Nature##457 |goto Teldrassil 58.70,44.27
accept Simple Sigil##3116 |goto Teldrassil 58.70,44.27		|only if NightElf Warrior
accept Encrypted Sigil##3118 |goto Teldrassil 58.70,44.27		|only if NightElf Rogue
accept Hallowed Sigil##3119 |goto Teldrassil 58.70,44.27		|only if NightElf Priest
accept Etched Sigil##3117 |goto Teldrassil 58.70,44.27		|only if NightElf Hunter
accept Verdant Sigil##3120 |goto Teldrassil 58.70,44.27		|only if NightElf Druid
step
Run up the ramp inside the building |goto Teldrassil 59.19,40.00 < 15 |walk
talk Alyissia##3593
|tip Inside the building.
|tip Train your class spells while you are here.
turnin Simple Sigil##3116 |goto Teldrassil 59.63,38.45
accept Amidst the Shadowed Webs##77575 |goto Teldrassil 59.64,38.44 |only if ZGV.IsClassicSoD
|only if NightElf Warrior
step
Run up the ramp |goto Teldrassil 59.97,41.90 < 10 |walk
talk Shanda##3595
|tip Upstairs inside the building.
turnin Hallowed Sigil##3119 |goto Teldrassil 59.17,40.44
accept Meditation on Elune##77574 |goto Teldrassil 59.17,40.44 |only if ZGV.IsClassicSoD
|only if NightElf Priest
step
Gain the Meditation on Elune Buff |complete hasbuff(419307) |goto Teldrassil 59.94,33.07 |q 77574
|tip Use the "/kneel" emote while standing in the moonwell.
|tip You will gain a buff that allows you to learn Priest runes.
|only if NightElf Priest and ZGV.IsClassicSoD
step
use the Memory of a Troubled Acolyte##205951
Learn Spell: Engrave Gloves - Penance |q 77574/1
|only if NightElf Priest and ZGV.IsClassicSoD
step
Run up the ramp |goto Teldrassil 59.97,41.90 < 10 |walk
talk Shanda##3595
|tip Upstairs inside the building.
turnin Meditation on Elune##77574 |goto Teldrassil 59.17,40.44
|only if NightElf Priest and ZGV.IsClassicSoD
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
Enter the building |goto Teldrassil 58.51,40.71 < 10 |walk
talk Ayanna Everstride##3596
|tip Up in the tall tree, inside the building.
turnin Etched Sigil##3117 |goto Teldrassil 58.65,40.45
accept A Hunter's Strength##77568 |goto Teldrassil 58.65,40.45 |only if ZGV.IsClassicSoD
|only if NightElf Hunter and ZGV.IsClassicSoD
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
Enter the building |goto Teldrassil 58.51,40.71 < 10 |walk
talk Mardant Strongoak##3597
|tip Up in the tall tree, inside the building.
|tip Train your class spells.
turnin Verdant Sigil##3120 |goto Teldrassil 58.63,40.29
accept Relics of the Kaldorei##77571 |goto Teldrassil 58.63,40.29 |only if ZGV.IsClassicSoD
|only if NightElf Druid
step
talk Tarindrella##1992
turnin The Woodland Protector##458 |goto Teldrassil 57.83,45.20
accept The Woodland Protector##459 |goto Teldrassil 57.83,45.20
step
talk Gilshalan Windwalker##2082
accept Webwood Venom##916 |goto Teldrassil 57.81,41.65
stickystart "Kill_Mangy_Nightsabers"
stickystart "Kill_Thistle_Boars"
step
label "Kill_Mangy_Nightsabers"
kill 7 Mangy Nightsaber##2032 |q 457/1 |goto Teldrassil 60.12,35.06
You can find more around [62.60,37.94]
step
label "Kill_Thistle_Boars"
kill 7 Thistle Boar##1985 |q 457/2 |goto Teldrassil 60.12,35.06
stickystart "Learn_Engrave_Gloves_Victory_Rush_Night_Elf_Warrior"
stickystart "Collect_Webwood_Venom_Sacs"
step
Follow the path |goto Teldrassil 55.45,32.85 < 20 |only if walking
talk Iverron##8584
turnin A Good Friend##4495 |goto Teldrassil 54.60,32.99
accept A Friend in Need##3519 |goto Teldrassil 54.60,32.99
step
talk Dirania Silvershine##8583
turnin A Friend in Need##3519 |goto Teldrassil 60.90,41.96
accept Iverron's Antidote##3521 |goto Teldrassil 60.90,41.96
step
label "Learn_Engrave_Gloves_Victory_Rush_Night_Elf_Warrior"
kill Webwood Spider##1986+
|tip They look like green spiders.
|tip Inside and outside the cave.
collect Rune of Victory Rush##204806 |n
use the Rune of Victory Rush##204806
Learn: Engrave Gloves - Victory Rush |q 77575/1 |goto Teldrassil 56.78,31.54
|only if NightElf Warrior and ZGV.IsClassicSoD
step
label "Collect_Webwood_Venom_Sacs"
kill Webwood Spider##1986+
|tip Inside and outside the cave.
|tip Watch for respawns while in the area. |only if hardcore
collect 10 Webwood Venom Sac##5166 |q 916/1 |goto Teldrassil 56.80,31.59
step
Allow Enemies to Kill You
|tip Inside and outside the cave.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 56.80,31.59 |q 916
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil 58.72,42.34 |q 916 |zombiewalk
|only if not hardcore
step
talk Gilshalan Windwalker##2082
turnin Webwood Venom##916 |goto Teldrassil 57.81,41.65
accept Webwood Egg##917 |goto Teldrassil 57.81,41.65
step
talk Conservator Ilthalaine##2079
turnin The Balance of Nature##457 |goto Teldrassil 58.70,44.26
step
Run up the ramp inside the building |goto Teldrassil 59.19,40.00 < 15 |walk
talk Alyissia##3593
|tip Inside the building.
turnin Amidst the Shadowed Webs##77575 |goto Teldrassil 59.64,38.44
|only if NightElf Warrior and ZGV.IsClassicSoD
step
Run up the ramp inside the building |goto Teldrassil 59.19,40.00 < 10 |walk
talk Frahun Shadewhisper##3594
|tip Inside the building.
turnin Encrypted Sigil##3118 |goto Teldrassil 59.64,38.66
|only if NightElf Rogue
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
Enter the building |goto Teldrassil 58.51,40.71 < 10 |walk
talk Ayanna Everstride##3596
|tip Up in the tall tree, inside the building.
|tip Consider not training your spells to buy a better bow and more ammo instead.
turnin Etched Sigil##3117 |goto Teldrassil 58.65,40.45
step
_NOTE:_
Learn the Moonfire Ability
|tip Make sure to learn the Moonfire ability from your class trainer.
|tip You will need it to get the rune.
Click Here to Continue |confirm
|only if NightElf Druid and ZGV.IsClassicSoD
step
kill Grellkin##1989+
collect Lunar Idol##208414 |goto Teldrassil 54.33,39.11 |q 77571
|only if NightElf Druid and ZGV.IsClassicSoD
step
Equip the Lunar Idol |equipped Lunar Idol##208414 |q 77571
|only if NightElf Druid and ZGV.IsClassicSoD
step
Kill enemies around this area
|tip Make sure they die while affected by your "Moonfire" ability.
|tip You will gain a buff.
|tip Repeat this process until you have 6 stacks of the Building Inspiration buff.
Gain the Inspired Buff |havebuff Inspired##408828 |goto Teldrassil 55.67,42.46 |q 77571
|only if NightElf Druid and ZGV.IsClassicSoD
step
use the Lunar Idol##208414
Learn Engrave Chest - Fury of Stormrage |q 77571/1
|only if NightElf Druid and ZGV.IsClassicSoD
step
Run up the ramp |goto Teldrassil 57.52,41.62 < 10 |walk
talk Mardant Strongoak##3597
|tip Inside the top of the tree.
turnin Relics of the Kaldorei##77571 |goto Teldrassil 58.63,40.29
|only if NightElf Druid and ZGV.IsClassicSoD
step
click Moonpetal Lily##152095+
|tip They look like tall flowers with orange petals on the ground around this area.
collect 4 Moonpetal Lily##10641 |q 3521/2 |goto Teldrassil 57.72,37.76
stickystart "Collect_Webwood_Ichor"
step
Enter the cave |goto Teldrassil 56.79,31.41 < 20 |walk
Follow the path down |goto Teldrassil 56.83,28.94 < 10 |walk
Follow the path up |goto Teldrassil 55.75,25.49 < 10 |walk
click Webwood Eggs##4406
|tip Upstairs inside the cave.
|tip Watch for respawns while in the area. |only if hardcore
collect Webwood Egg##5167 |q 917/1 |goto Teldrassil 56.80,26.43
step
kill Githyiss the Vile##1994
|tip It looks like a larger green spider.
|tip Upstairs inside the cave.
collect Rune of the Chimera##206168 |n
use the Rune of the Chimera##206168
Learn: Engrave Gloves - Chimera Shot |q 77568/1 |goto Teldrassil 56.65,26.31
|only if NightElf Hunter and ZGV.IsClassicSoD
step
label "Collect_Webwood_Ichor"
kill Webwood Spider##1986+
|tip Inside and outside the cave.
|tip Watch for respawns while in the area. |only if hardcore |notinsticky
collect Webwood Ichor##10640 |q 3521/3 |goto Teldrassil 56.78,31.55
step
kill Grell##1988+
collect 8 Fel Moss##3297 |q 459/1 |goto Teldrassil 56.08,45.83
collect 7 Hyacinth Mushroom##10639 |q 3521/1 |goto Teldrassil 56.08,45.83
You can find more around [54.75,44.01]
step
Run up the large ramp |goto Teldrassil 57.53,41.63 < 15 |only if walking
Enter the building |goto Teldrassil 58.51,40.71 < 10 |walk
talk Ayanna Everstride##3596
|tip Up in the tall tree, inside the building.
turnin A Hunter's Strength##77568 |goto Teldrassil 58.65,40.45
|only if NightElf Hunter and ZGV.IsClassicSoD
step
talk Tarindrella##1992
turnin The Woodland Protector##459 |goto Teldrassil 57.83,45.20
step
talk Gilshalan Windwalker##2082
turnin Webwood Egg##917 |goto Teldrassil 57.81,41.65
accept Tenaron's Summons##920 |goto Teldrassil 57.81,41.65
step
Run up the ramp that wraps around the huge tree and enter the building |goto Teldrassil 59.29,39.09 < 10 |walk
talk Tenaron Stormgrip##3514
|tip At the very top of the tall tree, inside the building.
turnin Tenaron's Summons##920 |goto Teldrassil 59.07,39.45
accept Crown of the Earth##921 |goto Teldrassil 59.07,39.45
step
talk Dirania Silvershine##8583
|tip It is a TIMED quest! You will have 5 minutes to complete it.
turnin Iverron's Antidote##3521 |goto Teldrassil 60.90,41.96
accept Iverron's Antidote##3522 |goto Teldrassil 60.90,41.96
step
use the Crystal Phial##5185
collect Filled Crystal Phial##5184 |q 921/1 |goto Teldrassil 59.94,33.04
|tip Grind enemies on the way to the fountain, we want to be level 6 soon. |only if level < 6
step
talk Iverron##8584
turnin Iverron's Antidote##3522 |goto Teldrassil 54.59,32.99
|tip Grind enemies on the way to Iverron, we want to be level 6 soon. |only if level < 6
step
Allow Enemies to Kill You
|tip Inside and outside the cave.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 56.80,31.59 |q 921
|only if not hardcore and level > 6
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil 58.72,42.34 |q 921 |zombiewalk
|only if not hardcore and level > 6
step
Run up the ramp that wraps around the huge tree |goto Teldrassil 57.54,41.62 < 15 |only if walking
Enter the building |goto Teldrassil 59.29,39.09 < 10 |walk
talk Tenaron Stormgrip##3514
|tip At the very top of the tall tree, inside the building.
turnin Crown of the Earth##921 |goto Teldrassil 59.07,39.45
accept Crown of the Earth##928 |goto Teldrassil 59.07,39.45
step
Run up the ramp |goto Teldrassil 59.96,41.88 < 10 |walk
talk Shanda##3595
|tip Upstairs inside the building.
accept In Favor of Elune##5622 |goto Teldrassil 59.17,40.44
|only if NightElf Priest
step
talk Porthannius##6780
accept Dolanaar Delivery##2159 |goto Teldrassil 61.16,47.64
step
talk Zenn Foulhoof##2150
accept Zenn's Bidding##488 |goto Teldrassil 60.45,56.15
step
talk Syral Bladeleaf##2083
accept Denalan's Earth##997 |goto Teldrassil 56.08,57.73
|tip Go out of your way to kill any enemy on the way, you need them all for quests.
step
talk Athridas Bearmantle##2078
accept A Troubling Breeze##475 |goto Teldrassil 55.95,57.28
step
Enter the building |goto Teldrassil 55.75,57.23 < 10 |walk
talk Laurna Morninglight##3600
|tip Inside the building.
turnin In Favor of Elune##5622 |goto Teldrassil 55.56,56.75
accept Garments of the Moon##5621 |goto Teldrassil 55.56,56.75
|only if NightElf Priest
step
Enter the building |goto Teldrassil 55.75,57.23 < 10 |walk |only if not Priest
talk Tallonkai Swiftroot##3567
|tip At the top of the tower.
accept Twisted Hatred##932 |goto Teldrassil 55.57,56.95
accept The Emerald Dreamcatcher##2438 |goto Teldrassil 55.57,56.95
step
talk Shalomon##3609
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 2438
|only if Warrior and itemcount(2488) == 0
step
talk Jeena Featherbow##3610
|tip Inside the building.
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Jeena Featherbow##3610 |goto Teldrassil 55.89,59.20 |q 2438
|only if Hunter and itemcount(2506) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 2438
|only if Rogue and itemcount(2494) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 2438
|only if Druid and itemcount(2495) == 0
step
talk Innkeeper Keldamyr##6736
|tip Upstairs inside the building.
turnin Dolanaar Delivery##2159 |goto Teldrassil 55.62,59.79
step
talk Innkeeper Keldamyr##6736
home Dolanaar |goto Teldrassil 55.62,59.79
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##928 |goto Teldrassil 56.14,61.71
accept Crown of the Earth##929 |goto Teldrassil 56.14,61.71
step
Heal and Fortify Sentinel Shaya |q 5621/1 |goto Teldrassil 57.24,63.51
|tip Target Sentinel Shaya.
|tip First, cast your "Lesser Heal (Rank 2)" spell on her.
|tip Second, cast your "Power Word: Fortitude" spell on her.
|only if NightElf Priest
step
Enter the building |goto Teldrassil 57.48,60.60 < 10 |walk
talk Malorne Bladeleaf##3604
|tip Inside the building.
Learn Apprentice Herbalism |skillmax Herbalism,75 |goto Teldrassil 57.72,60.64
|tip You need Herbalism, so you can gather 5 Earthroot as you quest in Teldrassil.
|tip You will need the Earthroot for a later class quest.
|tip Once you have the 5 Earthroot, you can abandon Herbalism, if you want to.
|only if Druid
stickystart "Collect_Earthroot_Druid"
step
talk Denalan##2080
|tip He walks around this area.
turnin Denalan's Earth##997 |goto Teldrassil 60.90,68.49
step
Watch the dialogue
talk Denalan##2080
|tip He walks around this area.
accept Timberling Seeds##918 |goto Teldrassil 60.80,68.54
accept Timberling Sprouts##919 |goto Teldrassil 60.80,68.54
stickystart "Collect_Timberling_Seeds"
step
click Timberling Sprout##4608+
|tip They look like green and brown vine balls on the ground around this area.
collect 12 Timberling Sprout##5169 |q 919/1 |goto Teldrassil 59.52,72.20
You can find more around [60.73,65.71]
step
label "Collect_Timberling_Seeds"
kill Timberling##2022+
collect 8 Timberling Seed##5168 |q 918/1 |goto Teldrassil 59.52,72.20
You can find more around [60.73,65.71]
step
talk Denalan##2080
|tip He walks around this area.
turnin Timberling Seeds##918 |goto Teldrassil 60.80,68.54
accept Rellian Greenspyre##922 |goto Teldrassil 60.80,68.54
turnin Timberling Sprouts##919 |goto Teldrassil 60.80,68.54
step
talk Shalomon##3609
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Warrior and itemcount(2488) == 0
step
talk Jeena Featherbow##3610
|tip Inside the building.
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Jeena Featherbow##3610 |goto Teldrassil 55.89,59.20 |q 922
|only if Hunter and itemcount(2506) ==0
step
talk Shalomon##3609
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Rogue and itemcount(2494) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Druid and itemcount(2495) == 0
step
Enter the building |goto Teldrassil 55.75,57.23 < 10 |walk
talk Laurna Morninglight##3600
|tip Inside the building.
turnin Garments of the Moon##5621 |goto Teldrassil 55.56,56.75
|only if NightElf Priest
stickystart "Collect_Strigid_Owl_Feathers"
stickystart "Collect_Nightsaber_Fangs"
stickystart "Collect_Webwood_Spider_Silk"
stickystart "Collect_Small_Spider_Legs"
step
use the Jade Phial##5619
collect Filled Jade Phial##5639 |q 929/1 |goto Teldrassil 63.38,58.08
step
Enter the building |goto Teldrassil 66.23,58.37 < 20 |walk
talk Gaerolas Talvethren##2107
|tip Upstairs inside the building.
|tip Watch for patrols and respawns while in the area. |only if hardcore
turnin A Troubling Breeze##475 |goto Teldrassil 66.26,58.52
accept Gnarlpine Corruption##476 |goto Teldrassil 66.26,58.52
step
Enter the building |goto Teldrassil 67.82,59.46 < 10 |walk
click Tallonkai's Dresser##126158
|tip Inside the building.
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect Emerald Dreamcatcher##8048 |q 2438/1 |goto Teldrassil 68.01,59.63
step
label "Collect_Strigid_Owl_Feathers"
kill Strigid Owl##1995
collect 3 Strigid Owl Feather##3411 |q 488/2 |goto Teldrassil 63.65,53.56
You can find more around: |notinsticky
[65.26,51.94]
[67.49,53.76]
stickystart "Collect_Webwood_Spider_Silk"
step
label "Collect_Nightsaber_Fangs"
kill Nightsaber##2042+
collect 3 Nightsaber Fang##3409 |q 488/1 |goto Teldrassil 62.05,60.06
You can find more around [59.77,62.02]
step
label "Collect_Webwood_Spider_Silk"
kill Webwood Lurker##1998+
collect 3 Webwood Spider Silk##3412 |q 488/3 |goto Teldrassil 60.36,58.07
You can find more around [61.11,54.53]
step
label "Collect_Small_Spider_Legs"
kill Webwood Lurker##1998+
|tip You are collecting these to be able to complete a future quest soon.
collect 7 Small Spider Leg##5465 |goto Teldrassil 60.36,58.07 |q 4161 |future
|tip Be careful not to accidentally sell these to a vendor.
|tip Keep more of these even after this quest finishes, it is one of the few sources of food for your pet later. |only if Hunter
You can find more around [61.11,54.53]
step
Kill enemies around this area
|tip Getting this far into level 7 will allow you to reach level 8 after turning in quests soon.
|tip You are about to return to town, so it will be a good time to learn your level 8 abilities.
ding 7,3600 |goto Teldrassil 60.36,58.07
You can find more around [61.11,54.53]
step
talk Zenn Foulhoof##2150
turnin Zenn's Bidding##488 |goto Teldrassil 60.45,56.15
step
talk Jeena Featherbow##3610
|tip Inside the building.
buy Hornwood Recurve Bow##2506 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Jeena Featherbow##3610 |goto Teldrassil 55.89,59.20 |q 2438
|only if Hunter and itemcount(2506) == 0
step
talk Syral Bladeleaf##2083
accept Seek Redemption!##489 |goto Teldrassil 56.08,57.73
step
talk Athridas Bearmantle##2078
turnin Gnarlpine Corruption##476 |goto Teldrassil 55.95,57.28
step
Enter the building |goto Teldrassil 55.75,57.23 < 10 |walk
talk Aldia##3608
|tip Upstairs inside the building, on the middle level.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Aldia##3608 |goto Teldrassil 55.51,57.15 |q 2438
step
talk Aldia##3608
|tip Upstairs inside the building, on the middle level.
buy Balanced Throwing Dagger##25872 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Aldia##3608 |goto Teldrassil 55.51,57.15 |q 2438
|only if Rogue
step
talk Tallonkai Swiftroot##3567
|tip At the top of the tower.
turnin The Emerald Dreamcatcher##2438 |goto Teldrassil 55.57,56.95
accept Ferocitas the Dream Eater##2459 |goto Teldrassil 55.57,56.95
step
talk Shalomon##3609
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Warrior and itemcount(2488) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Rogue and itemcount(2494) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 922
|only if Druid and itemcount(2495) == 0
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##929 |goto Teldrassil 56.14,61.71
accept Crown of the Earth##933 |goto Teldrassil 56.14,61.71
step
talk Zarrin##6286
|tip You need to have the Cooking profession learned in order to accept a quest here.
Learn Cooking |skillmax Cooking,75 |goto Teldrassil 57.12,61.30 |q 4161 |future
step
talk Zarrin##6286
accept Recipe of the Kaldorei##4161 |goto Teldrassil 57.12,61.30
step
talk Zarrin##6286
turnin Recipe of the Kaldorei##4161 |goto Teldrassil 57.12,61.30
stickystart "Collect_Fel_Cones"
stickystart "Kill_Gnarlpine_Mystics"
step
kill Ferocitas the Dream Eater##7234
collect Gnarlpine Necklace##8049 |q 2459 |goto Teldrassil 69.37,53.40
step
use the Gnarlpine Necklace##8049
collect Tallonkai's Jewel##8050 |q 2459/2
step
label "Kill_Gnarlpine_Mystics"
kill 7 Gnarlpine Mystic##7235 |q 2459/1 |goto Teldrassil 68.96,52.95
|tip Enemies may share spawns around this area. |notinsticky
|tip Watch for respawns while in the area. |only if hardcore |notinsticky
step
label "Collect_Fel_Cones"
click Fel Cone##1673+
|tip They look like small brown balls with green smoke rising out of them at the base of trees around this area.
collect 3 Fel Cone##3418 |q 489/1 |goto Teldrassil 66.72,53.54
You can usually find more around: |notinsticky
[64.78,50.81]
[61.62,53.44]
step
talk Zenn Foulhoof##2150
turnin Seek Redemption!##489 |goto Teldrassil 60.45,56.15
step
Follow the path |goto Teldrassil 56.36,54.20 < 20 |only if walking and not subzone("Fel Rock")
Enter the cave |goto Teldrassil 54.65,52.45 < 20 |walk |only if not subzone("Fel Rock")
Follow the path |goto Teldrassil 53.79,50.64 < 10 |walk
Continue following the path |goto Teldrassil 53.17,49.16 < 10 |walk
kill Lord Melenas##2038
|tip Inside the cave.
|tip He can spawn in multiple locations inside this cave.
|tip If he's not here, search around in the cave until you find him.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Consider joining a party before fighting Lord Melenas |only if hardcore
collect Melenas' Head##5221 |q 932/1 |goto Teldrassil 52.81,50.20
step
Kill enemies around this area
|tip Inside the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Getting this far into level 8 will allow you to reach level 9 after turning in quests soon.
ding 8,4000 |goto Teldrassil 53.69,51.17
step
Allow Enemies to Kill You
|tip Anywhere inside the cave.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 53.69,51.17 |q 932
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil 56.20,63.26 |q 932 |zombiewalk
|only if not hardcore
step
talk Shalomon##3609
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 932
|only if Warrior and itemcount(2488) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 932
|only if Rogue and itemcount(2494) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 932
|only if Druid and itemcount(2495) == 0
step
Enter the building |goto Teldrassil 55.76,57.24 < 10 |walk
talk Byancie##6094
|tip Inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Teldrassil 55.29,56.82
|only if GetMoney() > 150
step
_NOTE:_
Create Bandages in Downtime
|tip While you wait for boats, it's a good time to make bandages and increase your First Aid skill.
|tip You'll need higher skill to make better bandages later, so make sure to level it up as you go.
|tip Keep bandages on hand for another way to heal yourself.
Click Here to Continue |confirm |q 932
step
talk Aldia##3608
|tip Upstairs inside the building, on the middle level.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Aldia##3608 |goto Teldrassil 55.51,57.15 |q 932
step
talk Tallonkai Swiftroot##3567
|tip At the top of the tower.
turnin Twisted Hatred##932 |goto Teldrassil 55.57,56.95
turnin Ferocitas the Dream Eater##2459 |goto Teldrassil 55.57,56.95
step
click Strange Fruited Plant##6751
accept The Glowing Fruit##930 |goto Teldrassil 42.63,76.10
step
use the Tourmaline Phial##5621
collect Filled Tourmaline Phial##5645 |q 933/1 |goto Teldrassil 42.42,67.07
step
Allow Enemies to Kill You
|tip Try to die around this area, or to the east of here, so that you end up in Dolanaar.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 46.87,71.67 |q 933
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil 56.20,63.26 |q 933 |zombiewalk
|only if not hardcore
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##933 |goto Teldrassil 56.14,61.71
accept Crown of the Earth##7383 |goto Teldrassil 56.14,61.71
step
talk Shalomon##3609
|tip Inside the building.
buy Gladius##2488 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 7383
|only if Warrior and itemcount(2488) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Stiletto##2494 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 7383
|only if Rogue and itemcount(2494) == 0
step
talk Shalomon##3609
|tip Inside the building.
buy Walking Stick##2495 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Shalomon##3609 |goto Teldrassil 56.31,59.49 |q 7383
|only if Druid and itemcount(2495) == 0
step
map Teldrassil
path follow strictbounce; loop off; ants straight; dist 40; markers none
path	55.81,58.31	55.50,58.45	54.54,58.48	53.98,58.19	53.59,57.61
path	53.00,57.34	52.68,56.74	52.34,56.44	51.91,56.39	51.60,56.47
path	51.30,56.67	51.00,56.58	50.55,56.09	50.43,55.56	50.50,54.54
path	50.44,54.20	50.20,53.86
talk Moon Priestess Amara##2151
|tip She walks in a large pattern along the road from Dolanaar to Darnassus.
accept The Road to Darnassus##487
step
kill 6 Gnarlpine Ambusher##2152 |q 487/1 |goto Teldrassil 46.22,53.46
|tip Watch for patrols and respawns while in the area. |only if hardcore
step
Leave Ban'ethil Hollow |goto Teldrassil 45.02,52.24 < 20 |only if walking and subzone("Ban'ethil Hollow")
talk Sentinel Arynia Cloudsbreak##3519
accept The Enchanted Glade##937 |goto Teldrassil 38.31,34.36
step
use the Amethyst Phial##18152
collect Filled Amethyst Phial##18151 |q 7383/1 |goto Teldrassil 38.43,34.04
stickystart "Collect_Bloodfeather_Belts"
step
click Strange Fronded Plant##6752
accept The Shimmering Frond##931 |goto Teldrassil 34.60,28.85
step
talk Mist##3568
|tip This is an escort quest.
|tip If she's not here, someone may be escorting her.
|tip Wait until she respawns.
|tip Clear nearby enemies or respawns while waiting. |only if hardcore
accept Mist##938 |goto Teldrassil 31.54,31.61 |noautoaccept
step
label "Collect_Bloodfeather_Belts"
Kill Bloodfeather enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect 6 Bloodfeather Belt##5204 |q 937/1 |goto Teldrassil 34.55,34.99
You can find more around [36.25,38.54]
step
Lead Mist Safely to Sentinel Arynia Cloudsbreak |q 938/1 |goto Teldrassil 38.31,34.36
|tip Mist will follow you as you walk.
|tip Try to hurry, this quest is timed.
step
talk Sentinel Arynia Cloudsbreak##3519
turnin The Enchanted Glade##937 |goto Teldrassil 38.31,34.36
turnin Mist##938 |goto Teldrassil 38.31,34.36
accept Teldrassil##940 |goto Teldrassil 38.31,34.36
step
Kill enemies on the way to Darnassus.
|tip You will be returning to town, so it will be a good time to learn your level 10 abilities.
|tip Watch for patrols and respawns while in the area. |only if hardcore
ding 10 |goto Darnassus 38.19,21.63
step
talk Rellian Greenspyre##3517
turnin Rellian Greenspyre##922 |goto Darnassus 38.19,21.63
|tip Grind enemies on the way to turn in this quest.
accept Tumors##923 |goto Darnassus 38.19,21.63
step
Enter the building |goto Darnassus 35.46,10.59 < 10 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building, on the middle floor.
accept Moonglade##5921 |goto Darnassus 35.37,8.40
|only if NightElf Druid
step
talk Jocaste##4146 |only if Hunter
talk Syurna##4163 |only if Rogue
talk Denatharion##4218 |only if Druid
trainer Jocaste##4146 |goto Darnassus/0 40.40,8.58 |only if Hunter |q 2518
trainer Syurna##4163 |goto Darnassus/0 36.97,21.86 |only if Rogue |q 2518
trainer Denatharion##4218  |goto Darnassus/0 34.74,7.43 |only if Druid |q 2518
|tip In the basement of the tree. |only if Rogue
|tip Train your spells.
step
Enter the building |goto Darnassus 35.46,10.59 < 10 |walk |only if not Druid
talk Arch Druid Fandral Staghelm##3516
|tip He walks around inside the building, at the top.
turnin Teldrassil##940 |goto Darnassus 34.80,9.24
accept Grove of the Ancients##952 |goto Darnassus 34.80,9.24
step
talk Sister Aquinne##7316
accept The Temple of the Moon##2519 |goto Darnassus 28.94,45.82
step
Cross the bridge |goto Darnassus 38.59,48.02 < 20 |only if walking
Enter the building |goto Darnassus 39.02,76.78 < 10 |walk
talk Priestess A'moora##7313
|tip Upstairs inside the building.
turnin The Temple of the Moon##2519 |goto Darnassus 36.64,85.93
accept Tears of the Moon##2518 |goto Darnassus 36.64,85.93
step
talk Jandria##4091
trainer Jandria##4091 |goto Darnassus/0 37.91,82.80  |q 2518
|tip Train your spells.
|only if Priest
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Moonglade##5921 |goto Moonglade 56.21,30.64
accept Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
Follow the path |goto Moonglade 42.47,34.44 < 40 |only if walking
talk Great Bear Spirit##11956
Select _"What do you represent, spirit?"_
Seek Out the Great Bear Spirit and Learn what it Has to Share with You About the Nature of the Bear |q 5929/1 |goto Moonglade 39.11,27.51
|only if NightElf Druid
step
talk Dendrite Starblaze##11802
|tip Upstairs inside the building.
turnin Great Bear Spirit##5929 |goto Moonglade 56.21,30.64
accept Back to Darnassus##5931 |goto Moonglade 56.21,30.64
|only if NightElf Druid
step
talk Kyra Windblade##3598
|tip Inside the building.
accept Elanaria##1684 |goto Teldrassil 56.22,59.20
|only if Warrior
step
_NOTE:_
You Have Access to Stronger Ammo
|tip Now that you're level 10, you can purchase stronger bullets or arrows.
|tip When you restock ammo at vendors, make sure to buy level 10 ammo.
Click Here to Continue |confirm |q 2518
|only if Hunter
step
talk Corithras Moonrage##3515
turnin Crown of the Earth##7383 |goto Teldrassil 56.14,61.71
accept Crown of the Earth##935 |goto Teldrassil 56.14,61.71
step
talk Dazalar##3601
accept Taming the Beast##6063 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
use the Taming Rod##15921
|tip Use it on a Webwood Lurker around this area.
|tip They look like green spiders.
Tame a Webwood Lurker |q 6063/1 |goto Teldrassil 59.81,59.06
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if NightElf Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6063 |goto Teldrassil 56.68,59.49
accept Taming the Beast##6101 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
talk Denalan##2080
|tip He walks around this area.
turnin The Glowing Fruit##930 |goto Teldrassil 60.90,68.49
turnin The Shimmering Frond##931 |goto Teldrassil 60.90,68.49
step
click Sprouted Frond##7510
accept The Sprouted Fronds##2399 |goto Teldrassil 60.90,68.49
step
Allow Enemies to Kill You
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 60.82,70.87 |q 935
|only if not hardcore and not NightElf Hunter
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Teldrassil 56.20,63.26 |q 935 |zombiewalk
|only if not hardcore and not NightElf Hunter
step
use the Taming Rod##15922
|tip Use it on a Nightsaber Stalker around this area.
|tip They look like dark colored tigers.
Tame a Nightsaber Stalker |q 6101/1 |goto Teldrassil 62.40,74.70
|tip Dismiss it after you tame it.
|tip It may attack you after you dismiss it.
|only if NightElf Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6101 |goto Teldrassil 56.68,59.49
accept Taming the Beast##6102 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
use the Taming Rod##15923
|tip Use it on a Strigid Screecher around this area.
|tip They look like grey birds.
Tame a Strigid Screecher |q 6102/1 |goto Teldrassil 43.99,51.16
|only if NightElf Hunter
step
talk Dazalar##3601
turnin Taming the Beast##6102 |goto Teldrassil 56.68,59.49
accept Training the Beast##6103 |goto Teldrassil 56.68,59.49
|only if NightElf Hunter
step
Enter the building |goto Teldrassil 55.76,57.24 < 10 |walk
talk Laurna Morninglight##3600
|tip Inside the building.
accept Returning Home##5629 |goto Teldrassil 55.57,56.75
|only if NightElf Priest
step
map Teldrassil
path follow strictbounce; loop off; ants straight; dist 40; markers none
path	55.81,58.31	55.50,58.45	54.54,58.48	53.98,58.19	53.59,57.61
path	53.00,57.34	52.68,56.74	52.34,56.44	51.91,56.39	51.60,56.47
path	51.30,56.67	51.00,56.58	50.55,56.09	50.43,55.56	50.50,54.54
path	50.44,54.20	50.20,53.86
talk Moon Priestess Amara##2151
|tip She walks in a large pattern along the road from Dolanaar to Darnassus.
turnin The Road to Darnassus##487
step
talk Jannok Breezesong##3599
|tip Inside the building.
accept The Apple Falls##2241 |goto Teldrassil 56.38,60.14
|only if Rogue
step
Allow Enemies to Kill You
|tip You must be close to this area.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 42.77,52.55 |q 2241
|only if Rogue and not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Darnassus 77.67,25.92 |q 2241 |zombiewalk
|only if Rogue and not hardcore
step
Enter the cave in the tree trunk |goto Darnassus 32.12,16.46 < 7 |walk
talk Syurna##4163
|tip Inside the cave.
turnin The Apple Falls##2241 |goto Darnassus 36.99,21.91
accept Destiny Calls##2242 |goto Darnassus 36.99,21.91
|only if Rogue
step
Run up the spiral path and leave the cave |complete not _G.IsIndoors() |goto Darnassus 32.12,16.46 |q 2242
|only if Rogue and subzone("Cenarion Enclave")
step
_NOTE:_
Tame a Strigid Hunter
|tip Use your "Tame Beast" ability on a Strigid Hunter.
|tip They look like grey birds around this area.
|tip This will be your permanent pet for a while.
Click Here to Continue |confirm |goto Teldrassil 45.58,40.56 |q 6103
|only if NightElf Hunter
step
Kill Gnarlpine enemies around this area
|tip You are collecting these to make your wand soon.
collect 70 Linen Cloth##2589 |goto Teldrassil 46.05,53.38 |q 6342 |future
|tip Be careful not to accidentally sell these to a vendor.
|only if Priest
step
Kill Timberling enemies around this area
|tip They look like swamp elementals.
|tip Work your way north along the water as you kill them, the next step is far north.
collect 5 Mossy Tumor##5170 |q 923/1 |goto Teldrassil 42.78,40.96
You can find more around: |notinsticky
[42.70,33.19]
[43.42,28.26]
step
destroy Moss-twined Heart##5179 |goto Teldrassil 48.08,25.10
|tip There is, unfortunately, never a good time to turn this in that is worthwhile.
|only if itemcount(5179) > 0
step
kill Lady Sathrah##7319
|tip She looks like a a grey spider that walks around this area.
|tip She can spawn in multiple locations.
collect Silvery Spinnerets##8344 |q 2518/1 |goto Teldrassil 48.08,25.10
She can also be around: |notinsticky
[47.05,27.71]
[40.82,25.18]
[38.57,26.51]
step
collect Sethir's Journal##7737 |q 2242/1 |goto Teldrassil 37.52,24.29
|tip Stealth and use your "Pickpocket" ability on Sethir the Ancient.
|tip He looks like a purple satyr that sometimes stands here, and walks out onto the huge tree branch nearby.
|tip Be careful to not attack him or be detected, he summons a group of enemies to help him fight.
|only if Rogue
step
label "Collect_Earthroot_Druid"
collect 5 Earthroot##2449 |q 6123 |future
|tip Use Herbalism to gather these as you quest in Teldrassil.
|tip Collect any herbs you come across, because you need Herbalism level 15 to be able to collect Earthroot.
|tip Earthroot nodes can be found in the areas of Teldrassil between Dolanaar and Darnassus, north and south of the road.
|tip Once you collect 5 Earthroot, you can abandon Herbalism, if you want to.
|tip Be careful not to accidentally sell these to a vendor.
|only if Druid
step
Allow Enemies to Kill You
|tip You must be close to this area.
|tip Since you are less than level 11, you will not receive resurrection sickness when you revive.
|tip This basically makes dying have no real penalty at this level.
|tip This will allow you to travel a long distance quickly.
Die on Purpose |complete isdead |goto Teldrassil 36.45,27.73 |q 2518
|only if not hardcore
step
talk Spirit Healer##6491
Select _"Return me to life."_
Resurrect at the Spirit Healer |complete not isdead |goto Darnassus 77.67,25.92 |q 2518 |zombiewalk
|only if not hardcore
step
talk Mydrannul##4241
accept Nessa Shadowsong##6344 |goto Darnassus 70.68,45.38
|only if NightElf
step
talk Mydrannul##4241
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Mydrannul##4241 |goto Darnassus 70.68,45.38 |q 6344
step
talk Elanaria##4088
turnin Elanaria##1684 |goto Darnassus 57.30,34.61
accept Vorlus Vilehoof##1683 |goto Darnassus 57.30,34.61
|only if Warrior
step
Run around the mountain and follow the path up |goto Teldrassil 48.68,62.73 < 15 |only if walking
kill Vorlus Vilehoof##6128
collect Horn of Vorlus##6805 |q 1683/1 |goto Teldrassil 47.25,63.60
|only if Warrior
step
talk Elanaria##4088
turnin Vorlus Vilehoof##1683 |goto Darnassus 57.30,34.61
|only if Warrior
step
talk Ilyenia Moonfire##11866
|tip This will allow you to use staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Darnassus 57.56,46.73
|only if Warrior
step
talk Ariyell Skyshadow##4203
buy Quarter Staff##854 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ariyell Skyshadow##4203 |goto Darnassus 58.76,44.50 |q 6344
|only if Warrior and itemcount(854) == 0
step
talk Ilyenia Moonfire##11866
|tip This will allow you to use staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Darnassus 57.56,46.73
|only if Hunter
step
talk Ariyell Skyshadow##4203
buy Laminated Recurve Bow##2507 |n
|tip If you can afford it.
|tip You can't use it until level 11, but you'll be level 11 soon and it will be a nice instant upgrade.
|tip If you have better, skip this step.
Visit the Vendor |vendor Ariyell Skyshadow##4203 |goto Darnassus 58.76,44.50 |q 6344
|only if Hunter and itemcount(2507) == 0
step
talk Ariyell Skyshadow##4203
buy Medium Quiver##11362 |n
|tip If you can afford it.
Visit the Vendor |vendor Ariyell Skyshadow##4203 |goto Darnassus 58.76,44.50 |q 6344
|only if Hunter and itemcount(11362) == 0
step
Run up the ramp |goto Darnassus 62.61,68.78 < 10 |only if walking
talk Turian##4235
|tip Upstairs inside the building.
buy Keen Throwing Knife##3107 |n
|tip If you can afford it.
|tip If you have better, skip this step.
|tip You will equip it after you reach level 11 soon.
Visit the Vendor |vendor Turian##4235 |goto Darnassus 62.67,65.59 |q 923
|only if Rogue
step
talk Ilyenia Moonfire##11866
|tip This will allow you to use staves.
Train Staves |complete weaponskill("TH_STAFF") > 0 |goto Darnassus 57.56,46.73
|only if Priest
step
_Note:_
Do You Need to Create a Wand?
|tip If you already have a wand, you can skip the next bunch of steps.
|tip Click the line below to select what you want to do.
Yes, Create a Wand		|confirm	|next "Create_Wand_Priest"	|or	|q 923
No, I Already Have a Wand	|confirm	|next "Skip_Wand_Priest"	|or	|q 923
|only if Priest
step
label "Create_Wand_Priest"
collect 70 Linen Cloth##2589 |q 923
|tip You are about to create your wand.
|tip If you need more Linen Cloth, try to buy some from the Auction House. |only if not selfmade
|only if Priest
step
Run up the ramp |goto Darnassus 61.25,23.27 < 10 |only if walking
talk Trianna##11050
|tip Inside the building.
Learn Tailoring |skillmax Tailoring,75 |goto Darnassus 63.55,21.21 |q 923
|only if Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 35 Bolts of Linen Cloth.
collect 35 Bolt of Linen Cloth##2996 |q 923
|only if Priest
step
talk Elynna##4168
|tip Inside the building.
buy 10 Coarse Thread##2320 |goto Darnassus 64.58,21.58 |q 923
|only if Priest
step
talk Trianna##11050
|tip Inside the building.
learn Brown Linen Robe##7623 |goto Darnassus 63.55,21.21 |q 923
|only if Priest
step
Open the Tailoring Profession Window
|tip The Tailoring skill is in the General tab of your spellbook.
|tip Create 10 Brown Linen Robes.
|tip You are about to learn Enchanting and disenchant these.
collect 10 Brown Linen Robe##6238 |q 923
|only if Priest
step
Run up the ramp |goto Darnassus 61.06,10.72 < 10 |only if walking
talk Lalina Summermoon##11070
|tip Inside the building.
Learn Enchanting |skillmax Enchanting,75 |goto Darnassus 58.79,12.74 |q 923
|only if Priest
step
Disenchant the Brown Linen Robes
|tip Use the "Disenchant" ability in the General tab of your spellbook.
|tip If you don't get one of these items from disenchanting, talk to Thaddeus Webb here and try to buy it.
|tip They are limited supply items, so it may not be available to buy.
|tip You can also try to buy it from the Auction House. |only if not selfmade
collect Strange Dust##10940 |goto Darnassus 58.57,14.72 |q 923
collect 2 Lesser Magic Essence##10938 |goto Darnassus 58.57,14.72 |q 923
|only if Priest
step
talk Vaean##4228
|tip Inside the building.
buy Copper Rod##6217 |goto Darnassus 58.57,14.72 |q 923
buy Simple Wood##4470 |goto Darnassus 58.57,14.72 |q 923
|only if Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Runed Copper Rod.
collect Runed Copper Rod##6218 |q 923
|only if Priest
step
talk Lalina Summermoon##11070
|tip Inside the building.
|tip This should be available with 10 Enchanting.
learn Lesser Magic Wand##14293 |goto Darnassus 58.79,12.74 |q 923
|only if Priest
step
Open the Enchanting Profession Window
|tip The Enchanting skill is in the General tab of your spellbook.
|tip Create 1 Lesser Magic Wand.
collect Lesser Magic Wand##11287 |q 923
|only if Priest
step
talk Innkeeper Saelienne##6735
home Craftsmen's Terrace |goto Darnassus/0 67.37,15.72
|tip This is a very important hearthstone, make sure you avoid overriding it until we hearth next.
step
label "Skip_Wand_Priest"
talk Rellian Greenspyre##3517
turnin Tumors##923 |goto Darnassus 38.19,21.64
step
talk Jocaste##4146 |only if Hunter
talk Syurna##4163 |only if Rogue
talk Sildanair##4089 |only if Warrior
talk Denatharion##4218 |only if Druid
talk Jandria##4091 |only if Priest
trainer Jocaste##4146 |goto Darnassus/0 40.40,8.58 |only if Hunter |q 935
trainer Sildanair##4089 |goto Darnassus/0 61.78,42.28 |only if Warrior |q 935
trainer Syurna##4163 |goto Darnassus/0 36.97,21.86 |only if Rogue |q 935
trainer Denatharion##4218  |goto Darnassus/0 34.74,7.43 |only if Druid |q 935
trainer Jandria##4091 |goto Darnassus/0 37.91,82.80 |only if Priest |q 935
|tip In the basement of the tree. |only if Rogue
|tip Train your spells.
step
Enter the cave in the tree trunk |goto Darnassus 32.12,16.46 < 7 |walk
talk Syurna##4163
|tip Inside the cave.
turnin Destiny Calls##2242 |goto Darnassus 36.99,21.91
|only if Rogue
step
Run up the spiral path and leave the cave |complete not _G.IsIndoors() |goto Darnassus 32.12,16.46 |q 935
|only if Rogue and subzone("Cenarion Enclave")
step
Run up the ramp |goto Darnassus 39.62,16.40 < 10 |only if walking
talk Jocaste##4146
|tip Inside the building.
turnin Training the Beast##6103 |goto Darnassus 40.38,8.55
|only if NightElf Hunter
step
_NOTE:_
You Can Now Train Your Pet
|tip Learn pet abilities from Pet Trainers.
|tip Use your "Beast Training" ability to teach your pet abilities.
|tip Make sure you feed your owl as soon as possible so it doesn't run away!!
Click Here to Continue |confirm |q 6344
|only if NightElf Hunter
step
Enter the building |goto Darnassus 35.46,10.59 < 10 |walk
talk Mathrengyl Bearwalker##4217
|tip Upstairs inside the building.
turnin Back to Darnassus##5931 |goto Darnassus 35.38,8.41
accept Body and Heart##6001 |goto Darnassus 35.38,8.41
|only if NightElf Druid
step
Enter the building |goto Darnassus 35.46,10.59 < 10 |walk |only if not Druid
talk Arch Druid Fandral Staghelm##3516
|tip He walks around inside the building, at the top.
turnin Crown of the Earth##935 |goto Darnassus 34.80,9.24
step
Cross the bridge |goto Darnassus 38.59,48.02 < 20 |only if walking
Enter the building |goto Darnassus 39.02,76.78 < 10 |walk
talk Priestess A'moora##7313
|tip Upstairs inside the building.
turnin Tears of the Moon##2518 |goto Darnassus 36.64,85.93
accept Sathrah's Sacrifice##2520 |goto Darnassus 36.64,85.93
step
talk Priestess Alathea##11401
|tip Upstairs inside the building.
turnin Returning Home##5629 |goto Darnassus 39.53,81.18
accept Stars of Elune##5627 |goto Darnassus 39.53,81.18 |instant
|only if NightElf Priest
step
use Sathrah's Sacrifice##8155
|tip Inside the building.
Offer the Sacrifice at the Fountain |q 2520/1 |goto Darnassus 39.21,84.57
step
talk Priestess A'moora##7313
|tip Upstairs inside the building.
turnin Sathrah's Sacrifice##2520 |goto Darnassus 36.64,85.93
step
map Darnassus
path	62.60,56.00	68.60,57.80	66.80,64.60	64.20,70.60	60.20,66.80
path	61.80,60.20
talk Jaeana ##4169
|tip Walking around this area.
buy Tough Jerky##117 |n
|tip Buy up to 20, whatever you have money and bag space for if you weren't able to get many spare Spider Legs.
|tip This will be used to feed your permanent pet and keep it Happy, so it deals more damage and gains Loyalty faster.
|tip By keeping your pet Happy and ranking up its Loyalty, it won't run away and abandon you, and will need food less often to stay Happy.
Visit the Vendor |vendor Jaeana ##4169 |q 433 |future
|only if Hunter
step
talk Nessa Shadowsong##10118
turnin Nessa Shadowsong##6344 |goto Teldrassil 56.25,92.43
accept The Bounty of Teldrassil##6341 |goto Teldrassil 56.25,92.43
|only if NightElf
step
talk Vesprystus##3838
turnin The Bounty of Teldrassil##6341 |goto Teldrassil 58.40,94.01
accept Flight to Auberdine##6342 |goto Teldrassil 58.40,94.01
|only if NightElf
step
talk Laird##4200
|tip Inside the building.
turnin Flight to Auberdine##6342 |goto Darkshore/0 36.77,44.29
|only if NightElf
step
talk Shellei Brondir##1571
fpath Menethil Harbor |goto Wetlands 9.49,59.69
step
_NOTE:_
During the Next Step
|tip You MUST swim to the EXACT location of the next step before logging out.
|tip DO NOT use the stuck service if your character is not in the exact location of the next step.
|tip We are going to use the unstuck feature to teleport to Ironforge.
|tip You can skip this step if you have a warlock or mage friend to help you.
Click Here to Continue |confirm |q 433 |future
step
_NOTE:_
Swim to this EXACT Location |goto Wetlands 3.31,75.90 |notravel
|tip You must be in this EXACT location before proceeding.
Prepare to Use the Support Stuck Service
|tip Push ESC to open game Main Menu.
|tip Select Support
|tip next find the button for Stuck Character service
|tip click Continue
|tip click "Select Character" (from the list)
|tip click Move Character
You will be logged out.
Wait for an email or give it a few minutes to be sure.
You may also log any other character in the meantime.
It is an account service with 4h cooldown.
So you will not be able to repeat it right away on another character of the same account.
|tip After that, login to your character again, and you will be just outside of Ironforge.
Reach the Gates of Ironforge |goto Dun Morogh 53.03,35.71 < 30 |noway |c |q 433 |future
step
talk Gryth Thurden##1573
fpath Ironforge |goto Ironforge 55.50,47.75
step
Run up the stairs and enter the building |goto Ironforge 61.32,88.18 < 7 |walk
talk Buliwyf Stonehand##11865
|tip Inside the building.
|tip This will allow you to equip two-handed axes and two-handed maces.
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0 |goto Ironforge 61.17,89.52
Train Two-Handed Maces |complete weaponskill("TH_MACE") > 0 |goto Ironforge 61.17,89.52
|only if Warrior
step
Enter the building |goto Dun Morogh 45.97,48.83 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
accept Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
talk Senir Whitebeard##1252
accept Frostmane Hold##287 |goto Dun Morogh 46.73,53.83
step
Follow the path |goto Dun Morogh 39.61,48.01 < 40 |only if walking
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
|tip Go out of your way to grind mobs en route to this quest.
talk Tundra MacGrann##1266
|tip On top of the mountain.
|tip As you travel to him, be careful to avoid the elite yeti that walks around this area.
accept Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
step
Enter the cave |goto Dun Morogh 37.80,53.69 < 20 |walk
click MacGrann's Meat Locker##272
|tip Inside the cave.
|tip Wait for the elite yeti to leave the cave and walk away before you enter the cave.
collect MacGrann's Dried Meats##2667 |q 312/1 |goto Dun Morogh 38.51,53.93
|tip He runs back quickly after he walks down the path a bit.
|tip Try to get into the cave as quick as you can when he leaves it, to give yourself time to run back out safely.
|tip If he attacks you as you leave the cave, just run away.
step
Follow the path up |goto Dun Morogh 36.01,51.96 < 15 |only if walking
talk Tundra MacGrann##1266
|tip On top of the mountain.
turnin Tundra MacGrann's Stolen Stash##312 |goto Dun Morogh 34.57,51.65
stickystart "Kill_Frostmane_Headhunters"
step
Enter the cave |goto Dun Morogh 24.84,50.89 < 20 |walk
Follow the path down |goto Dun Morogh 22.61,50.53 < 20 |walk
Fully Explore Frostmane Hold |q 287/2 |goto Dun Morogh 22.79,52.10
|tip Inside the cave.
|tip Watch for patrols and respawns while inside the cave. |only if hardcore
step
label "Kill_Frostmane_Headhunters"
Follow the path up |goto Dun Morogh 21.78,50.47 < 20 |walk
kill 5 Frostmane Headhunter##1123 |q 287/1 |goto Dun Morogh 24.87,50.90
|tip Inside and outside the cave. |notinsticky
|tip Watch for patrols and respawns while inside the cave. |only if hardcore |notinsticky
stickystart "Collect_Gyromechanic_Gears"
step
Leave the cave |goto Dun Morogh 25.07,50.99 < 20 |walk |only if subzone("Frostmane Hold") and _G.IsIndoors()
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Restabilization Cog##3083 |q 412/1 |goto Dun Morogh 25.64,43.33
step
label "Collect_Gyromechanic_Gears"
kill Leper Gnome##1211+
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
collect 8 Gyromechanic Gear##3084 |q 412/2 |goto Dun Morogh 25.64,43.33
step
Leave the building |goto Dun Morogh 46.95,52.05 < 10 |walk |only if subzone("Thunderbrew Distillery")
talk Senir Whitebeard##1252
turnin Frostmane Hold##287 |goto Dun Morogh 46.73,53.82
step
Enter the building |goto Dun Morogh 45.97,48.84 < 10 |walk
talk Razzle Sprysprocket##1269
|tip Inside the building.
turnin Operation Recombobulation##412 |goto Dun Morogh 45.85,49.37
step
talk Rudra Amberstill##1265
accept Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|tip Only do this quest if you purchased throwing weapons |only if Warrior or Rogue
|tip And you trained Gouge |only if Rogue
|tip And you trained Hamstring |only if Warrior
|tip Skip this step if you aren't comfortable cheesing an elite, you will just need to grind more later. |only if hardcore
|tip We strongly recommend watching the video below before attempting this quest.
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE
|only if not Paladin
step
Aggro Vagash |goto Dun Morogh 62.41,48.08 > 10
|tip He can spawn deep in the cave. Wait for him to come out if you want an easier time.
|tip Follow the arrow and kite him to the fence location.
|tip Hop back and forth over the fence so Vagash can't attack you while you whittle him down.
|tip We strongly recommend watching the video below before attempting this quest.
Click Here To Copy The Video Link |popuptext youtu.be/z1BVC3I33qE
collect Fang of Vagash##3627 |q 314/1 |goto Dun Morogh 63.90,49.86
|only if not Paladin
step
talk Rudra Amberstill##1265
turnin Protecting the Herd##314 |goto Dun Morogh 63.08,49.89
|only if not Paladin
step
talk Senator Mehr Stonehallow##1977
accept The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
accept Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
stickystart "Kill_Rockjaw_Skullthumpers"
step
Enter the cave |goto Dun Morogh 70.70,56.49 < 20 |walk
kill 10 Rockjaw Bonesnapper##1117 |q 433/1 |goto Dun Morogh 70.98,54.77
|tip Inside the cave.
|tip Watch for patrols and respawns while in the area. |only if hardcore
step
label "Kill_Rockjaw_Skullthumpers"
kill 6 Rockjaw Skullthumper##1115 |q 432/1 |goto Dun Morogh 70.70,56.49
|tip Inside and outside the cave. |notinsticky
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
step
Leave the cave |goto Dun Morogh 70.70,56.49 < 20 |walk |only if subzone("Gol'Bolar Quarry Mine")
Follow the path up |goto Dun Morogh 67.86,57.69 < 20 |only if walking
talk Senator Mehr Stonehallow##1977
turnin The Public Servant##433 |goto Dun Morogh 68.67,55.97
step
talk Foreman Stonebrow##1254
turnin Those Blasted Troggs!##432 |goto Dun Morogh 69.08,56.33
step
Follow the road |goto Dun Morogh 67.68,52.75 < 40 |only if walking and subzone("Gol'Bolar Quarry")
Follow the road and run through the tunnel |goto Dun Morogh 81.21,42.70 < 10 |only if walking and not subzone("North Gate Outpost")
talk Pilot Hammerfoot##1960
accept The Lost Pilot##419 |goto Dun Morogh 83.89,39.19
step
click A Dwarven Corpse##2059
turnin The Lost Pilot##419 |goto Dun Morogh 79.67,36.17
accept A Pilot's Revenge##417 |goto Dun Morogh 79.67,36.17
step
kill Mangeclaw##1961
|tip He walks around this area.
collect Mangy Claw##3183 |q 417/1 |goto Dun Morogh 78.31,37.76
step
talk Pilot Hammerfoot##1960
turnin A Pilot's Revenge##417 |goto Dun Morogh 83.89,39.19
step
Run through the tunnel |goto Dun Morogh 84.42,31.02 < 10 |only if walking and not zone("Loch Modan")
Enter the building |goto Loch Modan 23.53,17.89 < 10 |walk
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
accept Filthy Paws##307 |goto Loch Modan 24.76,18.40
step
_NOTE:_
Tame a Forest Lurker
|tip Abandon your current pet.
|tip This pet doesn't eat fish.
|tip Feed it extra meat that you find during the next few steps.
|tip Use your "Tame Beast" ability on a Forest Lurker.
|tip They look like brown spiders around this area.
|tip This will be your permanent pet for a little while.
Click Here to Continue |confirm |goto Loch Modan 35.69,31.78 |q 307
You can find more around: |notinsticky
[Loch Modan 29.17,23.57]
[Loch Modan 29.43,48.28]
|only if NightElf Hunter
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
step
Enter the building |goto Loch Modan 35.23,47.75 < 7 |walk
talk Vidra Hearthstove##1963
|tip Inside the building.
accept Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
stickystop "Collect_Boar_Intestines"
stickystop "Collect_Spider_Ichors"
stickystop "Collect_Bear_Meat"
step
talk Yanni Stoutheart##1682
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Yanni Stoutheart##1682 |goto Loch Modan 34.76,48.62 |q 416 |future
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
accept Rat Catching##416
accept Mountaineer Stormpike's Task##1339
|tip This won't be available if you've picked up Stormpike's Order. |only if haveq(1338)
stickystart "Collect_Boar_Intestines"
stickystart "Collect_Spider_Ichors"
stickystart "Collect_Bear_Meat"
stickystart "Collect_Tunnel_Rat_Ears"
step
click Miners' League Crates##271+
|tip They look like piles of brown boxes on the ground around this area inside the mine.
|tip This mine can be dangerous, so try to stay near the entrance and wait for boxes to respawn, if you can, so you can leave quickly when you're finished.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Tunnel Rat Geomancers are casters that deal heavy damage. |only if hardcore
collect 4 Miners' Gear##2640 |q 307/1 |goto Loch Modan 35.48,18.85
step
label "Collect_Tunnel_Rat_Ears"
Leave the mine |goto Loch Modan 35.48,18.85 < 10 |walk |only if subzone("Silver Stream Mine") and _G.IsIndoors()
Kill Tunnel Rat enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore
collect 12 Tunnel Rat Ear##3110 |q 416/1 |goto Loch Modan 24.57,29.79
You can find more around [26.08,43.64]
step
Enter the building |goto Loch Modan 23.53,17.89 < 10 |walk
talk Mountaineer Stormpike##1343
|tip Upstairs inside the building.
turnin Filthy Paws##307 |goto Loch Modan 24.76,18.40
turnin Mountaineer Stormpike's Task##1339 |goto Loch Modan 24.76,18.40
accept Stormpike's Order##1338 |goto Loch Modan 24.76,18.40
step
label "Collect_Boar_Intestines"
kill Mountain Boar##1190+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Boar Intestines##3172 |goto Loch Modan 36.99,34.36 |q 418 |future
You can find more around [Loch Modan 29.17,23.57]
step
label "Collect_Spider_Ichors"
kill Forest Lurker##1195+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Spider Ichor##3174 |goto Loch Modan 35.69,31.78 |q 418 |future
You can find more around: |notinsticky
[29.17,23.57]
[29.43,48.28]
step
label "Collect_Bear_Meat"
kill Elder Black Bear##1186+
|tip Kill the other types of enemies around this area for extra xp. |notinsticky
collect 3 Bear Meat##3173 |goto Loch Modan 35.68,32.10 |q 418 |future
You can find more around: |notinsticky
[30.73,25.86]
[28.66,11.57]
[24.03,25.79]
[27.45,28.54]
[28.09,40.94]
step
talk Yanni Stoutheart##1682
|tip Inside the building.
|tip If you can afford it, and you need more bag space, buy bags.
Visit the Vendor |vendor Yanni Stoutheart##1682 |goto Loch Modan 34.76,48.62 |q 1338
step
talk Vidra Hearthstove##1963
|tip Inside the building.
turnin Thelsamar Blood Sausages##418 |goto Loch Modan 34.83,49.28
step
map Loch Modan
path follow strictbounce; loop off; ants straight; dist 20; markers none
path	32.67,49.72	33.27,49.16	33.86,48.37	34.30,47.64	34.91,47.05
path	35.56,46.76	36.09,46.37	37.11,46.01	37.32,45.60	37.37,44.45
path	37.29,43.33	36.73,41.98
talk Mountaineer Kadrell##1340
|tip He walks around this area.
turnin Rat Catching##416
step
talk Thorgrum Borrelson##1572
fpath Thelsamar |goto Loch Modan 33.94,50.95
step
talk Mountaineer Cobbleflint##1089
accept In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.12
step
Enter the building |goto Loch Modan 23.71,75.47 < 10 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
accept The Trogg Threat##267 |goto Loch Modan 23.23,73.67
stickystart "Kill_Stonesplinter_Troggs"
stickystart "Kill_Stonesplinter_Scouts"
step
Follow the road to the path here |goto Loch Modan 29.32,66.73 < 40 |only if walking and not subzone("Stonesplinter Valley")
Kill Stonesplinter enemies around this area
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore
collect 8 Trogg Stone Tooth##2536 |q 267/1 |goto Loch Modan 32.51,73.25
step
label "Kill_Stonesplinter_Troggs"
kill 10 Stonesplinter Trogg##1161 |q 224/1 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
label "Kill_Stonesplinter_Scouts"
kill 10 Stonesplinter Scout##1162 |q 224/2 |goto Loch Modan 32.51,73.25
|tip Watch for patrols and respawns while in the area. |only if hardcore |notinsticky
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore |notinsticky
step
Leave Stonesplinter Valley and follow the road |goto Loch Modan 30.57,69.69 < 20 |only if walking and subzone("Stonesplinter Valley")
talk Mountaineer Cobbleflint##1089
turnin In Defense of the King's Lands##224 |goto Loch Modan 22.07,73.13
step
Enter the building |goto Loch Modan 23.71,75.45 < 7 |walk
talk Captain Rugelfuss##1092
|tip Upstairs inside the building.
turnin The Trogg Threat##267 |goto Loch Modan 23.23,73.67
step
Grind mobs in the area
|tip We will hearth back to Darnassus and train our level 14 spells soon.
|tip Watch for patrols and respawns while in the area. |only if hardcore
|tip Enemies tend to bunch together, so be prepared for adds. |only if hardcore
ding 14 |goto Loch Modan 32.51,73.25
step
Run up the stairs and enter the building |goto Ironforge 61.32,88.18 < 7 |walk
talk Bixi Wobblebonk##13084
|tip Inside the building.
|tip This will allow you to equip thrown weapons.
Train Thrown |complete weaponskill("THROWN") > 0 |goto Ironforge 62.23,89.62
|only if Warrior
step
Follow the path |goto Ironforge 72.82,50.18 < 20 |walk
Enter the Deeprun Tram |complete subzone("Deeprun Tram") |goto Ironforge 76.97,51.25 |c |q 6662 |future
|tip Walk into the swirling portal.
|only if Warrior or Rogue
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
accept Deeprun Rat Roundup##6661
|only if Warrior or Rogue
step
_Inside Deeprun Tram:_
use Rat Catcher's Flute##17117
|tip Use it on Deeprun Rats around this area.
|tip They look like small grey rats on the ground around this area.
|tip In the Ironforge section of the Deeprun Tram.
Capture #5# Rats |q 6661/1
|only if Warrior or Rogue
step
_Inside Deeprun Tram:_
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
turnin Deeprun Rat Roundup##6661
|only if Warrior or Rogue
step
_Inside Deeprun Tram:_
Watch the dialogue
talk Monty##12997
|tip On the middle platform, near the wall.
|tip In the Ironforge section of the Deeprun Tram.
accept Me Brother, Nipsy##6662
|only if Warrior or Rogue
step
_Inside Deeprun Tram:_
Ride the Tram
|tip Ride the Deeprun Tram from Ironforge to Stormwind City.
talk Nipsy##13018
|tip On the middle platform, near the wall.
|tip In the Stormwind City section of the Deeprun Tram.
turnin Me Brother, Nipsy##6662
|only if Warrior or Rogue
step
Inside Deeprun Tram:_
Enter Stormwind City |complete zone("Stormwind City") |q 1338
|tip Walk into the swirling portal.
|only if Warrior or Rogue
step
talk Furen Longbeard##5413
turnin Stormpike's Order##1338 |goto Stormwind City 58.09,16.53
|only if Warrior or Rogue
step
Run through the doorway |goto Stormwind City 74.91,51.56 < 10 |only if walking
Enter the building |goto Stormwind City 77.97,48.19 < 10 |walk
talk Ilsa Corbin##5480
|tip Upstairs inside the building.
accept A Warrior's Training##1638 |goto Stormwind City 78.50,45.71
|only if NightElf Warrior
step
Leave the Command Center |goto Stormwind City 74.89,51.59 < 10 |walk |only if subzone("Command Center")
Enter the building |goto Stormwind City 71.66,39.89 < 10 |walk
talk Harry Burlguard##6089
|tip Inside the building.
turnin A Warrior's Training##1638 |goto Stormwind City 74.25,37.26
accept Bartleby the Drunk##1639 |goto Stormwind City 74.25,37.26
|only if NightElf Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Bartleby the Drunk##1639 |goto Stormwind City 73.83,37.17
accept Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
|tip He will attack you immediately after you accept this quest.
|only if NightElf Warrior
step
kill Bartleby##6090
|tip He walks around this area inside the building.
|tip He will eventually surrender.
Beat Bartleby |q 1640/1 |goto Stormwind City 73.83,37.17
|only if NightElf Warrior
step
talk Bartleby##6090
|tip He walks around this area inside the building.
turnin Beat Bartleby##1640 |goto Stormwind City 73.83,37.17
accept Bartleby's Mug##1665 |goto Stormwind City 73.83,37.17
|only if NightElf Warrior
step
talk Harry Burlguard##6089
|tip Inside the building.
turnin Bartleby's Mug##1665 |goto Stormwind City 74.25,37.26
|only if NightElf Warrior
step
Enter the building |goto Stormwind City 56.66,57.71 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to equip two-handed swords.
Train Two-Handed Swords |complete weaponskill("TH_SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Warrior
step
talk Gunther Weller##1289
|tip Inside the building.
buy Quarter Staff##854 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Gunther Weller##1289 |goto Stormwind City 57.55,57.07 |q 963 |future
|only if Warrior and itemcount(854) == 0
step
Enter the building |goto Stormwind City 56.66,57.71 < 10 |walk
talk Woo Ping##11867
|tip Inside the building.
|tip This will allow you to equip one-handed swords.
Train One-Handed Swords |complete weaponskill("SWORD") > 0 |goto Stormwind City 57.13,57.71
|only if Rogue
step
talk Gunther Weller##1289
|tip Inside the building.
buy Cutlass##851 |n
|tip If you can afford it.
|tip If you have better, skip this step.
Visit the Vendor |vendor Gunther Weller##1289 |goto Stormwind City 57.55,57.07 |q 963 |future
|only if Rogue and itemcount(851) == 0
step
Run up the ramp |goto Stormwind City 62.39,62.31 < 15 |only if walking
talk Dungar Longdrink##352
|tip Inside the building.
fpath Stormwind |goto Stormwind City 66.27,62.14
|only if Warrior or Rogue
step
talk Chief Archaeologist Greywhisker##2912
|tip He's outside the temple
accept Trouble In Darkshore?##730 |goto Darnassus 31.40, 83.20
step
talk Jocaste##4146 |only if Hunter
talk Syurna##4163 |only if Rogue
talk Sildanair##4089 |only if Warrior
talk Denatharion##4218 |only if Druid
talk Jandria##4091 |only if Priest
trainer Jocaste##4146 |goto Darnassus/0 40.40,8.58 |only if Hunter |q 730
trainer Sildanair##4089 |goto Darnassus/0 61.78,42.28 |only if Warrior |q 730
trainer Syurna##4163 |goto Darnassus/0 36.97,21.86 |only if Rogue |q 730
trainer Denatharion##4218  |goto Darnassus/0 34.74,7.43 |only if Druid |q 730
trainer Jandria##4091 |goto Darnassus/0 37.91,82.80 |only if Priest |q 730
|tip In the basement of the tree. |only if Rogue
|tip Train your spells.
]])
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Darkshore (13-17)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Loch Modan (17-18)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Redridge Mountains (18-20)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Darkshore (20-22)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (22-23)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (23-24)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (24-24)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Wetlands (24-25)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Duskwood (25-27)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Redridge Mountains (27-28)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Wetlands (28-29)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stonetalon Mountains (29-29)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Ashenvale (29-30)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Wetlands (30-31)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Duskwood (31-32)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (32-32)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Hillsbrad Foothills (32-33)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands (33-33)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (33-33)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Thousand Needles (33-34)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (34-34)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (34-35)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Duskwood (35-35)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Desolace (35-37)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (37-38)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Swamp of Sorrows (38-39)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Alterac Mountains (39-39)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Arathi Highlands (39-40)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Dustwallow Marsh (40-40)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Desolace (40-41)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Badlands (41-42)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (42-43)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Swamp of Sorrows (43-43)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (43-44)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Stranglethorn Vale (44-45)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (45-48)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (48-49)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\The Hinterlands (49-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Tanaris (50-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (50-50)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Searing Gorge (50-51)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Blasted Lands (51-51)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (51-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Azshara (52-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood (52-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (52-52)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood Part 1 (52-53)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Feralas (53-53)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Azshara (53-54)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Un'Goro Crater (54-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood Part 2 (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Felwood Part 3 (55-55)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (55-56)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (56-56)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Burning Steppes (56-57)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (57-57)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Eastern Plaguelands (57-58)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Western Plaguelands (58-59)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Winterspring (59-59)")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Rogue Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Mage Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Paladin Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Warlock Class Quests")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Extra Zones\\Westfall")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Blood Frenzy [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Consumed by Rage [Wetlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Devastate [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Endless Rage [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Endless Rage [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Endless Rage [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Flagellation [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault [Ironforge]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault [Stormwind City]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Frenzied Assault [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Furious Thunder [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Quick Strike [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Quick Strike [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Raging Blow [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Single-Minded Fury")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Victory Rush (Dwarf Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Victory Rush (Gnome Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Victory Rush (Human Only) [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Victory Rush (Night Elf Only) [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warrior\\Warbringer [The Barrens]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Aegis [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Aegis [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Avenger's Shield [Redridge Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Beacon of Light")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Crusader Strike (Human Only) [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Crusader Strike (Dwarf Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Divine Sacrifice [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Divine Storm")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Aura Mastery [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Hand of Reckoning [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Hand of Reckoning [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Hallowed Ground [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Hallowed Ground [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Inspiration Exemplar [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Inspiration Exemplar [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Rebuke [Stormwind City]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Divine Light [Stormwind City]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Enlightened Judgements [Arathi Highlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Guarded by the Light [Alterac Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Infusion of Light")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Sacred Shield")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Sheath of Light")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\The Art of War")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Hammer of the Righteous")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Fanaticism")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Improved Sanctuary")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Wrath")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Purifying Power")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Improved Hammer of Wrath")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 3 Runes\\Light's Grace")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Shield of Righteousness")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Righteous Vengeance + Shock and Awe + Avenging Wrath")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Exorcist (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Enhanced Blessings (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Seal of Martyrdom (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 4 Runes\\Divine Steed (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Stormwind City]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Ironforge]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Between the Eyes [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Blade Dance [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Blade Dance [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Deadly Brew [Silvepine Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Envenom [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Just a Flesh Wound")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Main Gauche [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Mutilate [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Quick Draw [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Saber Slash [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Human Only) [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Dwarf Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Gnome Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shadowstrike (Night Elf Only) [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Shiv [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Rogue\\Slaughter from the Shadows [Teldrassil]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Dwarf & Human Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Second Meditation Unlock\\Second Meditation Unlock (Night Elf Only)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Circle of Healing [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Homunculi [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Mind Sear")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Dwarf Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Human Only) [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Penanace (Night Elf Only) [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Power Word: Barrier [Redridge Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Prayer of Mending [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Prayer of Mending [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Prayer of Mending [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Serendipity [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shadow Word: Death [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Shared Pain [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Strength of Soul [Ashenvale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Twisted Faith [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Twisted Faith [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Twisted Faith [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Void Plague [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Dispersion [Stranglethorn Vale]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Empowered Renew [Alterac Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Empowered Renew [Thousand Needles]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Burnout [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Enlightenment [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Fingers of Frost [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Ice Lance [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Icy Veins")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Bomb [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Living Flame [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Mass Regeneration [Duskwood]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Regeneration [Westfall]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 3 Runes\\Explorer Imp & Fel Portal Locations")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Arcane Barrage")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Overheat")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Frozen Orb")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 4 Runes\\Expanded Intellect (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Chaos Bolt [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Grace [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Pact [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Demonic Tactics [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Everlasting Affliction")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Human Only) [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Haunt (Gnome Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Incinerate [Redridge Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Lake of Fire [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Master Channeler [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Metamorphosis [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Shadow Bolt Volley [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Elwynn Forest]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Warlock\\Soul Siphon [Dun Morogh]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [Westfall]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Beast Mastery [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Carve [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Night Elf Only) [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Chimera Shot (Dwarf Only) [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Cobra Strikes [Hillsbrad Foothills]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Explosive Shot [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Flanking Strike [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Kill Shot [Stonetalon Mountains]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Lone Wolf [The Barrens]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Dun Morogh]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Master Marksman [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Serpent Spread")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Sniper Training [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Hunter\\Sniper Training [Darkshore]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Fury of Stormrage (Night Elf Only) [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lacerate [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lacerate [Loch Modan]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Lifebloom [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Living Seed [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Mangle [Teldrassil]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Savage Roar [Darkshore]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Skull Bash")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Starsurge [Wetlands]")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Sunfire [Teldrassil]")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Improved Swipe")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Tree of Life")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Starfall")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Deeper Wilds (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Enhanced Restoration (Skill Book)")
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 4 Runes\\Revive (Skill Book)")
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
ZygorGuidesViewer:RegisterGuidePlaceholder("Leveling Guides\\Season of Discovery Events\\Scarlet Insignia / Scarlet Uniform")
