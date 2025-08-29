local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\6-9ElwynnForest',
  [[
author TUGs
next GENERATED\\11-14Darkshore
startlevel 6
step
accept Kobold Candles##60
step
home Elwynn Forest
step
turnin Rest and Relaxation##2158
step
turnin Report to Goldshire##54
step
accept The Fargodeep Mine##62
step
accept Gold Dust Exchange##47
step
Kill all Boars(especially good on the fields you will go to) for 4x Chunk of Boar Meat
step
accept Young Lovers##106
step
Well be crossing the Kobold mine 4 times now->Kill 2-3 Kobolds each time you do, to get some quest items already.
step
accept Princess Must Die!##88
step
accept Lost Necklace##85
step
turnin Young Lovers##106
step
accept Speak with Gramma##111
step
turnin Speak with Gramma##111
step
accept Note to William##107
step
turnin Lost Necklace##85
step
accept Pie for Billy##86
step
turnin Pie for Billy##86
step
accept Back to Billy##84
step
turnin Back to Billy##84
step
accept Goldtooth##87
step
Do [QC62- ][QC47- ][QC60- ][QC87]
step
Die and rezz at Ghosthealer
step
Turn on your Aura.
|only if Paladin
step
turnin The Fargodeep Mine##62
step
accept The Jasperlode Mine##76
step
Run to 41.5,65.8 |goto Elwynn Forest 41.5,65.8
|only if Warrior,Paladin
step
Get your level 6 spells at your trainer
|only if Warrior,Paladin
step
turnin Gold Dust Exchange##47
step
accept A Fishy Peril##40
step
turnin A Fishy Peril##40
step
accept Further Concerns##35
step
turnin Note to William##107
step
accept Collecting Kelp##112
step
turnin Kobold Candles##60
step
accept Shipment to Stormwind##61
step
Get your level 6 spells at your trainer
|only if Warlock,Mage,Priest,Rogue
step
[A Paladin,Mage,Warlock] Buy 20 Milk and as many 6 Slot Bags as you can.
|only if Paladin,Mage,Warlock
step
[A Warrior,Rogue] Buy 20 Food(lvl5) and as many 6 Slot Bags as you can.
|only if Warrior,Rogue
step
Do: Collecting Kelp |q 112
step
Do: The Jasperlode Mine |q 76
step
Die on the Campfire nearby[G64.5,56.6Elwynn Forest] and rezz at Ghosthealer.
step
Turn on your Aura.
|only if Paladin
step
Repair your gear and sell grey items at Rallic Finn [G83.3, 66.1Elwynn Forest]
step
accept A Bundle of Trouble##5545
step
turnin Further Concerns##35
step
accept Find the Lost Guards##37
step
accept Protect the Frontier##52
step
turnin Find the Lost Guards##37
step
accept Discover Rolf's Fate##45
step
Do [QC5545- ][QC52]
step
turnin Discover Rolf's Fate##45
step
accept Report to Thomas##71
step
turnin A Bundle of Trouble##5545
step
turnin Protect the Frontier##52
step
turnin Report to Thomas##71
step
accept Deliver Thomas' Report##39
step
Do (Optional): Princess Must Die!
step
This can be done solo by most classes by so called "Fence hopping". You Attack/Frostbolt/Shadowbolt, you jump the fence and repeat. Its pretty hard and you can learn it by killing defias/bears/boars first. Doing it vs Princes and her 2 escorts is even harder,MOST PEOPLE wont be able to do this!!! Otherwise: skip it as mentioned.
step
Run to [G84.4, 76.5Elwynn Forest] for Ridgepoint Tower exploring experience.
step
Run to [G9.8, 75.6Redridge Mountains] and die to the spiders and rezz up in Redridge.
step
Turn on your Aura.
|only if Paladin
step
Run to [G25.1,57.0Redridge Mountains] for Lake Everstill exploring experience.
step
fpath Redridge Mountains |goto Redridge Mountains 30.6, 59.4
step
use Hearthstone##6948
step
Get your level 8 spells at your trainer
|only if Mage,Warlock,Priest,Rogue
step
turnin Collecting Kelp##112
step
accept The Escape##114
step
turnin The Jasperlode Mine##76
step
turnin Deliver Thomas' Report##39
step
The next quest "Elmore's Task" is shown in Redridge Mountains. Just enter the Blacksmith in Goldshire. It's there instead.
step
accept Elmore's Task##1097
step
Get your level 8 spells at your trainer
|only if Paladin,Warrior
step
turnin The Escape##114
step
turnin Princess Must Die!##88
step
turnin Goldtooth##87
step
turnin Shipment to Stormwind##61
step
turnin Elmore's Task##1097
step
accept Stormpike's Delivery##353
step
Take the Tram to Ironforge
step
fpath Ironforge |goto Ironforge 55.5,47.8
step
home Ironforge
]]
)
