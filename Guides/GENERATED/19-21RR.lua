local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\19-21RR',
  [[
author TUGs
next GENERATED\\21-22Ashenvale
startlevel 19
step
turnin Stormpike's Order##1338
step
accept The Corruption Abroad##3765
step
home Stormwind City
step
fpath Stormwind City |goto Stormwind City 66.2, 62.4
|only if Nightelf,Gnome,Dwarf
step
fpath Redridge Mountains
|only if Human
step
accept Encroaching Gnolls##244
step
turnin Encroaching Gnolls##244
step
accept Assessing the Threat##246
step
fpath Redridge Mountains |goto Redridge Mountains 30.6,59.4
|only if Nightelf,Gnome,Dwarf
step
accept Blackrock Menace##20
step
accept The Lost Tools##125
step
accept The Price of Shoes##118
step
accept Messenger to Stormwind##120
step
accept Hilary's Necklace##3741
step
accept A Free Lunch##129
step
Do: Hilary's Necklace |q 3741
step
Kill as many Mongrels as you can at [G17,65]
step
turnin A Free Lunch##129
step
accept Visit the Herbalist##130
step
Do: Assessing the Threat |q 246
step
Do: The Lost Tools |q 125
step
Run to 70.6, 79.1 |goto Redridge Mountains 70.6, 79.1
step
Do: Blackrock Menace |q 20
step
Grind until level20
|ding 20
step
use Hearthstone##6948
step
turnin The Price of Shoes##118
step
accept Return to Verner##119
step
turnin Messenger to Stormwind##120
step
accept Messenger to Stormwind##121
step
Get your level 20 spells at your trainer
step
accept Yorus Barleybrew##1698
|only if Warrior
step
fpath Redridge Mountains
step
turnin Assessing the Threat##246
step
turnin Blackrock Menace##20
step
turnin The Lost Tools##125
step
accept The Everstill Bridge##89
step
turnin Return to Verner##119
step
accept A Baying of Gnolls##124
step
turnin Hilary's Necklace##3741
step
turnin Messenger to Stormwind##121
step
turnin Visit the Herbalist##130
step
accept Delivering Daffodils##131
step
turnin Delivering Daffodils##131
step
home Redridge Mountains
step
turnin Yorus Barleybrew##1698
step
Do [QC124- ][QC89 A Baying of Gnolls,The Everstill Bridge]
step
turnin A Baying of Gnolls##124
step
turnin The Everstill Bridge##89
step
Grind until level20+19800
|ding 20+19800
step
fpath Wetlands
step
turnin The Absent Minded Prospector##942
step
Take the boat to Auberdine.
]]
)
