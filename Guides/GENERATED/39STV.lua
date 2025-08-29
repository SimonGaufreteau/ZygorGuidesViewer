local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\39STV',
  [[
author TUGs
next GENERATED\\40-40Badlands
startlevel 39STV
step
accept The Bloodsail Buccaneers##595
step
accept Scaring Shaky##606
step
home Stranglethorn Vale
step
accept Dream Dust in the Swamp##1116
step
accept Water Elementals##601
step
accept Some Assembly Required##577
step
accept The Bloodsail Buccaneers##597
step
Do: Scaring Shaky |q 606
step
Run to 30.5,53.9 |goto Stranglethorn Vale 30.5,53.9
step
Do: Panther Mastery |q 192
step
Grind till [XP39] at [G42.9,36Stranglethorn Vale]
step
Do: Raptor Mastery |q 196
step
Do: Some Assembly Required |q 577
step
Do: Water Elementals |q 601
step
use Hearthstone##6948
step
accept The Bloodsail Buccaneers##599
step
fpath Stormwind City
]]
)
