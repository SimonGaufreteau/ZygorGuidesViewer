local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\6-9Gnome',
  [[
author TUGs
next GENERATED\\9-11Gnome
startlevel 6
step
Go through the tunnel, afterwards kill EVERY boar on your way to the tavern!
step
turnin ##420
step
home Dun Morogh
step
turnin ##2160
step
accept ##400
step
accept ##317
step
accept ##313
step
accept ##5541
step
turnin ##400
step
Stocking Jetsteam is your NR 1 Priority now, GO OUT OF YOUR WAY to kill bears and boars!
step
Do:  |q 313
step
Grind until level7
|ding 7
step
Do:  |q 5541
step
Do:  |q 317
step
turnin ##5541
step
accept ##287
step
accept ##384
step
turnin ##384
step
turnin ##317
step
accept ##318
step
turnin ##313
step
accept ##312
step
For the next part you do NOT need to kill the yeti. Wait until he leaves - this might take up to 5minutes- the cave(if he is in there) and then loot the chest and run out immediately!
step
Do:  |q 312
step
turnin ##312
step
turnin ##318
step
accept ##319
step
accept ##310
step
Do:  |q 319
step
Run to 30.9,36.5 |goto Dun Morogh 30.9,36.5
step
Run to 31.1,31.2 |goto Dun Morogh 31.1,31.2
step
Run to 32.8,29.1 |goto Dun Morogh 32.8,29.1
step
Run to 32.9, 27.5 |goto Dun Morogh 32.9, 27.5
step
There is a hill infront of you, that gets you into The Great Sea(Above your minimap). Go ontop of that.
step
Jump to your death towards north, Rezz up at the Spirit Healer.
step
Run to 10.05, 55.7 |goto Wetlands 10.05, 55.7
|only if Dwarf
step
use Hearthstone##6948
step
Downstairs there is a Dwarf protecting the Barrel, Give him the Thunder Ale(if he isnt there,someone else has done this and you can interact with the barrel immediately and drink the Ale yourself!)
step
turnin ##310
step
accept ##311
step
turnin ##384
step
turnin ##319
step
accept ##320
step
turnin ##311
step
Do:  |q 287
step
MAKE SURE YOU GOT THE EXPLORATION part of "Frostmane Hold". Die on purpose and rezz up! If youre a pserver player: dieing IN the cave gets you to Kharanos not the starting area!
step
turnin ##287
step
accept ##291
step
turnin ##320
]]
)
