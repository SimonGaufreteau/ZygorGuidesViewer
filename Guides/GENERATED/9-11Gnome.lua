local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\9-11Gnome',
  [[
author TUGs
next GENERATED\\11-14Darkshore
startlevel 9
step
Do (Optional): 
step
accept ##433
step
accept ##432
step
Do [QC433- ][QC432]
step
Farm till youre level[XP9+4500]
step
turnin ##432
step
turnin ##433
step
accept ##419
step
turnin ##419
step
accept ##417
step
Do:  |q 417
step
turnin ##417
step
Run to 79.4, 49.9 |goto Dun Morogh 79.4, 49.9
step
Run to 80.4, 49.7 |goto Dun Morogh 80.4, 49.7
step
Run to 81.5, 50.1 |goto Dun Morogh 81.5, 50.1
step
Run to 83.1, 49.5 |goto Dun Morogh 83.1, 49.5
step
Slowly fall to the ledge infront of you, and then to the ground. Pass the Bunker on the left and kill the 2-3 boars on the way.
step
accept ##224
step
accept ##267
step
fpath Loch Modan |goto Loch Modan 33.9,51
|only if Hunter
step
fpath Ironforge
|only if Hunter
step
accept ##6064
|only if Hunter
step
Do:  |q 6064
|only if Hunter
step
turnin ##6064
|only if Hunter
step
accept ##6084
|only if Hunter
step
Do:  |q 6084
|only if Hunter
step
turnin ##6084
|only if Hunter
step
accept ##6085
|only if Hunter
step
Do:  |q 6085
|only if Hunter
step
turnin ##6085
|only if Hunter
step
accept ##6086
|only if Hunter
step
[A Hunter]Tame a pet you like.I highly recommend a boar. Charge that deals more dmg and roots and as its a charge it can attack earlier->More aggro!
|only if Hunter
step
turnin ##6086
|only if Hunter
step
[A Hunter]Feed your pet and [T] Train your own and your pets skills.
|only if Hunter
step
fpath Loch Modan
|only if Hunter
step
Do:  |q 224
step
Do:  |q 267
step
turnin ##224
step
accept ##237
step
turnin ##267
step
fpath Loch Modan |goto Loch Modan 33.9,51
step
home Loch Modan
|only if Dwarf
step
accept ##6387
|only if Dwarf, Gnome
step
accept ##1339
step
turnin ##353
|only if Human
step
turnin ##1339
step
accept ##307
step
Do:  |q 307
step
turnin ##307
step
accept ##1338
step
turnin ##6387
|only if Dwarf, Gnome
step
accept ##6391
|only if Dwarf, Gnome
step
fpath Ironforge
|only if Dwarf, Gnome
step
turnin ##6391
|only if Dwarf, Gnome
step
accept ##6388
|only if Dwarf, Gnome
step
[A Warlock,Warrior,Hunter,Mage,Rogue] [T] Get your Level 10 skills at your trainer.
|only if Warlock
step
[A Paladin] [T] Get your Level 10 skills at your trainer. Run to [G24.6,4.5Ironforge]
|only if Paladin
step
accept ##1715
|only if Warlock
step
home Ironforge
|only if Dwarf, Gnome
step
Run to 30.9,36.5 |goto Dun Morogh 30.9,36.5
|only if Human
step
Run to 31.1,31.2 |goto Dun Morogh 31.1,31.2
|only if Human
step
Run to 32.8,29.1 |goto Dun Morogh 32.8,29.1
|only if Human
step
Run to 32.9, 27.5 |goto Dun Morogh 32.9, 27.5
|only if Human
step
[A Human] There is a hill infront of you, that gets you into The Great Sea (Above your minimap). Go ontop of that.
|only if Human
step
[A Human] Jump to your death towards north, Rezz up at the Spirit Healer.
|only if Human
step
Turn on your Aura.
|only if Paladin
step
Run to [G10.5, 55.7Wetlands][A Human] for Menethil Keep exploring experience.
|only if Human
step
turnin ##6388
|only if Dwarf, Gnome
step
fpath Wetlands
|only if Dwarf, Gnome
step

|only if Human
step
Take the ship to Darkshore
]]
)
