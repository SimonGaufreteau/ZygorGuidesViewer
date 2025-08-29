local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\1-6 Gnome',
  [[
author TUGs
next GENERATED\\6-9Gnome
startlevel 1
step
accept ##179
step
Do:  |q 179
step
Grind until level2+500
|ding 2+500
step
turnin ##179
step
accept ##233
step
accept ##3112
|only if Warrior
step
accept ##3108
|only if Hunter
step
accept ##3107
|only if Paladin
step
accept ##170
step
Kill Troggs from now on "on the side" dont go too far out of your way to kill them
step
turnin ##233
step
accept ##234
step
accept ##183
step
Kill boars from now on "on the side" dont go too far out of your way to kill them
step
turnin ##234
step
accept ##182
step
Do:  |q 182
step
turnin ##182
step
accept ##218
step
Do:  |q 218
step
Grind until level4+1500
|ding 4+1500
step
turnin ##218
step
accept ##282
step
accept ##3364
step
use Hearthstone##6948
step
turnin ##3107
|only if Paladin
step
accept ##3361
step
turnin ##3112
|only if Warrior
step
turnin ##3108
|only if Hunter
step
turnin ##3364
step
accept ##3365
step
Do:  |q 170
step
Do:  |q 3361,3
step
turnin ##3365
step
Do [QC3361,2- ][QC3361,1- ][QC183]
step
Do:  |q 3361
step
turnin ##183
step
turnin ##3361
step
turnin ##170
step
turnin ##282
step
accept ##420
step
accept ##2160
]]
)
