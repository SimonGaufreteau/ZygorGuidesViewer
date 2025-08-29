local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\1-10 Nightelf',
  [[
author TUGs
next GENERATED\\11-14Darkshore
startlevel 1
step
accept ##456
step
Do:  |q 456
step
Grind until level2+500
|ding 2+500
step
turnin ##456
step
accept ##3120
|only if Druid
step
accept ##3117
|only if Hunter
step
accept ##457
step
accept ##458
step
accept ##4495
step
Do:  |q 457
step
turnin ##4495
step
accept ##3519
step
use Hearthstone##6948
step
turnin ##457
step
turnin ##458
step
accept ##459
step
turnin ##3519
step
accept ##3521
step
Buy: [CI2512,400 Rough Arrow][A Hunter] from [G59.3, 41.1 Teldrassil] Keina.
step
Sell [V] at[G59.3, 41.1 Teldrassil] Keina.
step
accept ##916
step
turnin ##3120
|only if Druid
step
Do [QC3521- ][QC459]
step
Do:  |q 916
step
[A Hunter] Make sure you got 2s 71c ("Bag Money"+ Sellable Grey items). Equipment is usually worth just 2-4 copper and stackables like "Snapped Spider Limb" and "Snapped Spider Limb"30c+.
|only if Hunter
step
Die and Rezz
step
turnin ##459
step
turnin ##916
step
accept ##917
step
Buy: [CI2506,1 Hornwood Recurve Bow][A Hunter] from [G59.3, 41.1 Teldrassil] Keina. If you cant efford it yet, just buy it later.
|only if Hunter
step
turnin ##3521
step
accept ##3522
step
Run to 57.5, 41.6 |goto Teldrassil 57.5, 41.6
|only if Hunter
step
[A Hunter] Run up the tree.
|only if Hunter
step
turnin ##3117
step
[T] [A Hunter] Train "Serpent Sting".
step
turnin ##3522
step
Do:  |q 917
step
Grind until level6
|ding 6
step
Die and Rezz
step
Sell [V] at[G59.3, 41.1 Teldrassil] Keina.
step
turnin ##917
step
accept ##920
step
[T] [A Hunter] Train "Arcane Shot".
step
turnin ##920
step
accept ##921
step
Do:  |q 921
step
turnin ##921
step
accept ##928
step
accept ##2159
step
Kill all spiders you see now, we need 7 small Spider Legs!
step
accept ##488
step
Do:  |q 488
step
Collect [CI5465,7 Small Spider Leg] now.
step
Learn cooking at [G57.0, 61.2 Teldrassil] at Zarrin.
step
accept ##4161
step
turnin ##4161
step
turnin ##928
step
accept ##929
step
[A Druid] Buy [CI2495,1 Walking Stick] from Shalomon [G56.3, 59.5 Teldrassil].
|only if Druid
step
turnin ##2159
step
home Teldrassil
step
accept ##997
step
accept ##475
step
accept ##2438
step
accept ##932
step
turnin ##488
step
Fill the Jade Phial at the moonwell at [G63,58Teldrassil]. Tick this step manually if you did so.
step
turnin ##475
step
accept ##476
step
Do:  |q 2438
step
Grind until level7+2500
|ding 7+2500
step
turnin ##997
step
accept ##918
step
accept ##919
step
Do [QC918- ][QC919]
step
turnin ##918
step
turnin ##919
step
accept ##922
step
Die on purpose
step
turnin ##929
step
accept ##933
step
accept ##489
step
accept ##487
step
turnin ##476
step
turnin ##2438
step
accept ##2459
step
Do [QC932- ][QC489- ][QC487]
step
Grind until level9
|ding 9
step
Fill the Phial at [G42,67Teldrassil]
step
accept ##930
step
Die on purpose
step
turnin ##933
step
accept ##7383
step
turnin ##489
step
Do:  |q 2459
step
Die on purpose
step
turnin ##932
step
turnin ##2459
step
turnin ##487
step
accept ##937
step
Fill the Phial at [G38,34Teldrassil]
step
Do:  |q 937
step
accept ##931
step
turnin ##937
step
accept ##940
step
use Hearthstone##6948
step
turnin ##7383
step
accept ##935
step
turnin ##930
step
turnin ##931
step
turnin ##2399
step
Die on purpose
step
accept ##6063
|only if Hunter
step
Do:  |q 6063
|only if Hunter
step
turnin ##6063
|only if Hunter
step
accept ##6101
|only if Hunter
step
Do:  |q 6101
|only if Hunter
step
turnin ##6101
|only if Hunter
step
accept ##6102
|only if Hunter
step
Do:  |q 6102
|only if Hunter
step
turnin ##6102
|only if Hunter
step
accept ##6103
|only if Hunter
step
Get a pet you like. [A Hunter]
|only if Hunter
step
accept ##6344
step
turnin ##922
step
turnin ##935
step
turnin ##940
step
accept ##952
step
turnin ##6103
|only if Hunter
step
Teleport to Ruth'theran
step
turnin ##6344
step
accept ##6341
step
turnin ##6341
step
accept ##6342
step
fpath Auberdine
]]
)
