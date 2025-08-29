local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\56-56WPL',
  [[
author TUGs
next GENERATED\\56-59Plaguelands
startlevel 56
step
fpath Western Plaguelands
step
turnin A Call to Arms: The Plaguelands!##5066
step
accept Clear the Way##5092
step
turnin The Everlook Report##6028
step
turnin Argent Dawn Commission##5401
step
turnin Flint Shadowmore##6184
step
accept The Eastern Plagues##6185
step
Do: Clear the Way |q 5092
step
turnin Clear the Way##5092
step
accept All Along the Watchtowers##5097
step
accept The Scourge Cauldrons##5215
step
turnin The Scourge Cauldrons##5215
step
accept Target: Felstone Field##5216
step
Do: All Along the Watchtowers |q 5097
step
Do: TODO: Add specific questparts |q 5097
step
turnin Target: Felstone Field##5216
step
accept Return to Chillwind Camp##5217
step
accept Better Late Than Never##5021
step
turnin Better Late Than Never##5021
step
accept Better Late Than Never##5022
step
Do: TODO: Add specific questparts |q 5097
step
Do: TODO: Add specific questparts |q 5097
step
turnin All Along the Watchtowers##5097
step
turnin Return to Chillwind Camp##5217
step
accept Target: Dalson's Tears##5219
step
turnin Target: Dalson's Tears##5219
step
accept Return to Chillwind Camp##5220
step
turnin Return to Chillwind Camp##5220
step
accept Target: Writhing Haunt##5222
step
accept A Plague Upon Thee##5903
step
turnin Target: Writhing Haunt##5222
step
accept Return to Chillwind Camp##5223
step
accept The Wildlife Suffers Too##4984
step
Do: The Wildlife Suffers Too |q 4984
step
turnin The Wildlife Suffers Too##4984
step
accept The Wildlife Suffers To##4985
step
Do: The Wildlife Suffers To |q 4985
step
turnin The Wildlife Suffers To##4985
step
accept Glyphed Oaken Branch##4986
step
Run to 65.3,86.8 |goto Western Plaguelands 65.3,86.8
step
home The Hinterlands
step
turnin Cortello's Riddle##626
step
use Hearthstone##6948
]]
)
