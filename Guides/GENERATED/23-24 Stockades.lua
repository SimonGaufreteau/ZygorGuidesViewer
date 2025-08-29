local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\23-24 Stockades',
  [[
author TUGs
next GENERATED\\24-25Ashenvale
startlevel 23
step
accept Quell The Uprising##387
step
accept The Stockade Riots##391
step
accept The Color of Blood##388
step
fpath Duskwood
step
accept Crime and Punishment##377
step
fpath Redridge Mountains
step
accept What Comes Around...##386
step
Do the dungeon
step
Do: Quell The Uprising |q 387
step
Do: The Stockade Riots |q 391
step
Do: The Color of Blood |q 388
step
Do: Crime and Punishment |q 377
step
Do: What Comes Around... |q 386
step
turnin Quell The Uprising##387
step
turnin The Stockade Riots##391
step
accept The Curious Visitor##392
step
turnin The Curious Visitor##392
step
accept Shadow of the Past##393
step
turnin The Color of Blood##388
step
turnin Shadow of the Past##393
step
accept Look to an Old Friend##350
step
turnin Look to an Old Friend##350
step
accept Infiltrating the Castle##2745
step
turnin Infiltrating the Castle##2745
step
accept Items of Some Consequence##2746
step
We will turn in the other 2 dungeons quests in the next guide.
]]
)
