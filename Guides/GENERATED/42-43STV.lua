local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\42-43STV',
  [[
author TUGs
next GENERATED\\43-44Tanaris
startlevel 42
step
accept Venture Company Mining##600
step
accept Zanzil's Secret##621
step
accept Up to Snuff##587
step
accept Tran'rek##2864
step
accept Skullsplitter Tusks##209
step
accept The Bloodsail Buccaneers##604
step
accept Akiris by the Bundle##617
step
accept Voodoo Dues##609
step
accept Stoley's Debt##2872
step
accept Keep An Eye Out##576
step
Keep an eye out for the Bottle Quest(along the beach)
step
Do: The Bloodsail Buccaneers |q 604
step
Do: Up to Snuff |q 587
step
Do: Keep An Eye Out |q 576
step
Farm 4-10 Bars on the non casting pirates here
step
Do: Akiris by the Bundle |q 617
step
Farm 3-4 Bars on the naga
step
turnin Akiris by the Bundle##617
step
accept Akiris by the Bundle##623
step
accept Whiskey Slim's Lost Grog##580
step
turnin Up to Snuff##587
step
turnin The Bloodsail Buccaneers##604
step
accept The Bloodsail Buccaneers##608
step
Buy all missing pages of Stranglethorn 1,4,6,8,10,11,14,16,18,20,21,24,25,26,27
step
turnin Keep An Eye Out##576
step
Grind till [XP43] on the pirates then kill all captains on the boats nearby
step
Get Cortellos Riddle (can spawn on all 3 boats on the LOWER level)
step
Do: The Bloodsail Buccaneers |q 608
step
Do: Zanzil's Secret |q 621
step
Do: Voodoo Dues |q 609
step
Do (Optional): Raptor Mastery
step
Do (Optional): Excelsior
step
Do (Optional): Raptor Mastery
step
Turnin all STV Pages
step
Do (Optional): Big Game Hunter
step
In grp: Do both following quests in split groups
step
Do: Venture Company Mining |q 600
step
Do: Skullsplitter Tusks |q 209
step
use Hearthstone##6948
step
Take the Boat to Ratchet
step
fpath Dustwallow Marsh
step
fpath Tanaris
step
accept Back to Booty Bay##1118
step
accept Safety First##1188
step
accept Keeping Pace##1190
step
Wait untill Rizzle Brassbolts leaves the building.
step
accept Rizzle's Schematics##1194
]]
)
