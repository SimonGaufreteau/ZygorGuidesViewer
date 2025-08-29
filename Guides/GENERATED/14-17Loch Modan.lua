local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\14-17Loch Modan',
  [[
author TUGs
next GENERATED\\17-19Darkshore
startlevel 14
step
Get your level 14 spells at your trainer
step
accept Tome of Divinity##2999
|only if Paladin
step
turnin Tome of Divinity##2999
step
[A Paladin]You just got a QuestItem Tome of Divinity. Accept the Quest.
step
accept The Tome of Divinity##1646
|only if Paladin
step
turnin The Tome of Divinity##1646
|only if Paladin
step
accept The Tome of Divinity##1647
|only if Paladin
step
turnin The Tome of Divinity##1647
|only if Paladin
step
accept The Tome of Divinity##1648
|only if Paladin
step
[A Paladin]If you dont have 10 Linen Cloth, just buy it from the auction house, its always cheap.
|only if Paladin
step
turnin The Tome of Divinity##1648
|only if Paladin
step
accept The Tome of Divinity##1778
|only if Paladin
step
turnin The Tome of Divinity##1778
|only if Paladin
step
accept The Tome of Divinity##1779
|only if Paladin
step
turnin The Tome of Divinity##1779
|only if Paladin
step
accept The Tome of Divinity##1783
|only if Paladin
step
accept Find Bingles##2039
step
accept Return to Brock##6392
|only if Dwarf, Gnome
step
fpath Loch Modan
step
accept Ironband's Excavation##436
step
turnin Return to Brock##6392
|only if Dwarf, Gnome
step
accept In Defense of the King's Lands##224
|only if Nightelf
step
accept The Trogg Threat##267
|only if Nightelf
step
Do: In Defense of the King's Lands |q 224
|only if Nightelf
step
turnin In Defense of the King's Lands##224
|only if Nightelf
step
accept In Defense of the King's Lands##237
step
Do: In Defense of the King's Lands |q 237
step
Do: The Trogg Threat |q 267
|only if Nightelf
step
turnin In Defense of the King's Lands##237
step
turnin The Trogg Threat##267
|only if Nightelf
step
accept In Defense of the King's Lands##263
step
Do: The Tome of Divinity |q 1783
|only if Paladin
step
turnin Ironband's Excavation##436
step
accept Gathering Idols##297
step
accept Excavation Progress Report##298
step
accept A Hunter's Boast##257
step
Do: A Hunter's Boast |q 257
step
turnin A Hunter's Boast##257
step
accept A Hunter's Challenge##258
step
Do: A Hunter's Challenge |q 258
step
turnin A Hunter's Challenge##258
step
accept Crocolisk Hunting##385
step
turnin Find Bingles##2039
step
accept Bingles' Missing Supplies##2038
step
Do: Crocolisk Hunting |q 385
step
Do: Bingles' Missing Supplies |q 2038
step
Do: In Defense of the King's Lands |q 263
step
accept A Dark Threat Looms##250
step
turnin A Dark Threat Looms##250
step
accept A Dark Threat Looms##199
step
turnin A Dark Threat Looms##199
step
turnin Bingles' Missing Supplies##2038
step
turnin Crocolisk Hunting##385
step
Do: Gathering Idols |q 297
step
Grind until level17+500
|ding 17+500
step
turnin Gathering Idols##297
step
Die on purpose and rezz up.
step
turnin Excavation Progress Report##298
step
accept Report to Ironforge##301
step
turnin In Defense of the King's Lands##263
step
use Hearthstone##6948
step
Get your level 16 spells at your trainer
step
turnin Report to Ironforge##301
step
fpath Wetlands
step
Take the boat to Darkshore
]]
)
