local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\19-21Deadmines',
  [[
author TUGs
next GENERATED\\19-21RR
startlevel 19
step
If you do not intent to do deadmines, skip to the next guide!
step
accept Underground Assault##2040
step
turnin Stormpike's Order##1338
step
accept Oh Brother. . .##167
step
accept Collecting Memories##168
step
home Stormwind City
step
fpath Westfall |goto Westfall 56.6, 52.6
step
There is a long questchain for the endboss of deadmines wich gives nice blue gear, but it is not worth it time wise, so I will ONLY include the Accept step for the FIRST quest of the chain. If you dont intend to do it, skip the next Accept-step.
step
accept The Defias Brotherhood##65
step
The first 2 quests are in the cave but before the dungeon.
step
Do: Oh Brother. . . |q 167
step
Do: Collecting Memories |q 168
step
Do the dungeon now. The endboss drops a QuestItem. Accept it.
step
Do: Underground Assault |q 2040
step
accept The Unsent Letter##373
step
use Hearthstone##6948
step
turnin Oh Brother. . .##167
step
turnin Collecting Memories##168
step
turnin Underground Assault##2040
step
turnin The Unsent Letter##373
step
accept Bazil Thredd##389
step
turnin Bazil Thredd##389
]]
)
