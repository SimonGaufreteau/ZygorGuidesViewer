local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\36-37Arathi',
  [[
author TUGs
next GENERATED\\38Dustwallow Marsh
startlevel 36
step
fpath Arathi Highlands
step
accept Northfold Manor##681
step
accept Worth Its Weight in Gold##691
step
accept The Princess Trapped##642
step
Do: The Princess Trapped |q 642
step
Grind till youre 36 and 3/4
step
accept Stones of Binding##651
step
Do: Stones of Binding |q 651
step
accept Hints of a New Plague?##658
step
Keep an eye out for the Forsaken Courier
step
Do: Worth Its Weight in Gold |q 691
step
Do: Stones of Binding |q 651
step
accept Wand over Fist##693
step
Do: Wand over Fist |q 693
step
Grind till [XP37]
step
Do: Stones of Binding |q 651
step
Do: Northfold Manor |q 681
step
Do (Optional): Wanted! Marez Cowl
step
Do (Optional): Wanted! Otto and Falconcrest
step
Do (Optional): Stromgarde Badges
step
Do (Optional): Trelane's Defenses
step
accept Dangerous!##567
step
accept Hints of a New Plague?##660
step
Do: Hints of a New Plague? |q 660
step
accept Hints of a New Plague?##661
step
Do (Optional): Attack on the Tower
step
use Hearthstone##6948
]]
)
