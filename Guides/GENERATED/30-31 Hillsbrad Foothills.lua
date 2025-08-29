local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\30-31 Hillsbrad Foothills',
  [[
author TUGs
next GENERATED\\31-33 STV+TN
startlevel 30
step
fpath Hillsbrad Foothills |goto Hillsbrad Foothills 49.4,52.4
step
accept Hints of a New Plague?##659
step
accept Down the Coast##536
step
Do: Down the Coast |q 536
step
Grind on the Murlocs till [XP30+25000]
step
accept Farren's Proof##559
step
Do: Farren's Proof |q 559
step
Grind on the Murlocs till [XP30+35000]
step
accept Farren's Proof##560
step
accept Farren's Proof##561
step
accept Stormwind Ho!##562
step
Do: Stormwind Ho! |q 562
step
Grind on the Murlocs till [XP30+45500]
step
accept Reassignment##563
step
use Hearthstone##6948
step
accept Cleansing the Eye##293
step
fpath Ironforge
step
turnin Sully Balloo's Letter##637
step
accept Sara Balloo's Plea##683
step
turnin Sara Balloo's Plea##683
step
accept A King's Tribute##686
step
turnin A King's Tribute##686
step
accept A King's Tribute##689
step
accept The Brassbolts Brothers##1179
step
Get your level 30 spells at your trainer
|only if Warrior,Hunter
step
turnin Tinkmaster Overspark##2923
step
turnin Klockmort's Essentials##2925
step
turnin A Donation of Wool##7807
step
turnin An Old Colleague##1072
step
Take the train to stormwind.
step
turnin Blessed Arm##322
step
accept Armed and Ready##325
step
turnin Cleansing the Eye##293
step
Get your level 30 spells at your trainer
|only if Paladin,Priest
step
turnin A Noble Brew##335
step
accept A Noble Brew##336
step
Get your level 30 spells at your trainer
|only if Warlock,Mage,Warrior
step
If you have 60 silk already: TurnIn: [QT7793] A Donation of silk at: [G44.3, 73.9 Stormwind City]
]]
)
