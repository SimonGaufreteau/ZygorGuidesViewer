local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\1-6Northshire',
  [[
author TUGs
next GENERATED\\6-9ElwynnForest
startlevel 1
step
accept A Threat Within##783
step
turnin A Threat Within##783
step
accept Kobold Camp Cleanup##7
step
accept Eagan Peltskinner##5261
step
turnin Eagan Peltskinner##5261
step
accept Wolves Across the Border##33
step
Do [QC33- ][QC7]
step
turnin Wolves Across the Border##33
step
Sell your items at Brother Danil [G47.6, 41.6 Elwynn Forest].
step
[A Warlock,Mage] Buy 10 Water
step
turnin Kobold Camp Cleanup##7
step
accept Investigate Echo Ridge##15
step
accept Simple Letter##3100
|only if Warrior
step
accept Consecrated Letter##3101
|only if Paladin
step
accept Tainted Letter##3105
|only if Warlock
step
accept Glyphic Letter##3104
|only if Mage
step
accept Brotherhood of Thieves##18
step
accept The Stolen Tome##1598
|only if Warlock
step
turnin Tainted Letter##3105
|only if Warlock
step
Do: The Stolen Tome |q 1598
|only if Warlock
step
Do: Brotherhood of Thieves |q 18
step
turnin Brotherhood of Thieves##18
step
accept Milly Osworth##3903
step
accept Bounty on Garrick Padfoot##6
step
Sell your items at Brother Danil [G47.6, 41.6 Elwynn Forest].
step
turnin Consecrated Letter##3101
|only if Paladin
step
turnin The Stolen Tome##1598
|only if Warlock
step
turnin Glyphic Letter##3104
|only if Mage
step
turnin Simple Letter##3100
|only if Warrior
step
Get your level 4 spells at your trainer
step
Do: Investigate Echo Ridge |q 15
step
turnin Milly Osworth##3903
step
accept Milly's Harvest##3904
step
Do [QC3904- ][QC6]
step
Grind until level5
|ding 5
step
use Hearthstone##6948
step
turnin Bounty on Garrick Padfoot##6
step
turnin Investigate Echo Ridge##15
step
accept Skirmish at Echo Ridge##21
step
Do: Skirmish at Echo Ridge |q 21
step
turnin Milly's Harvest##3904
step
accept Grape Manifest##3905
step
turnin Skirmish at Echo Ridge##21
step
accept Report to Goldshire##54
step
turnin Grape Manifest##3905
step
accept Rest and Relaxation##2158
]]
)
