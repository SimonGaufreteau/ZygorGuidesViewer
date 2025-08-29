local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\46-47Hinterlands',
  [[
author TUGs
next GENERATED\\47-49Searing Gorge
startlevel 46
step
Run to 84.8,31.9 |goto Hillsbrad Foothills 84.8,31.9
step
turnin To The Hinterlands##1449
step
accept Gryphon Master Talonaxe##1450
step
turnin Gryphon Master Talonaxe##1450
step
accept Witherbark Cages##2988
step
accept Troll Necklace Bounty##2880
step
accept Skulk Rock Clean-up##2877
step
home The Hinterlands
step
Do: Favored of Elune? |q 3661
step
Do: Witherbark Cages |q 2988
step
Grind on the trolls untill youre [XP47]
step
Do: Troll Necklace Bounty |q 2880
step
Do: Witherbark Cages |q 2988
step
Do: Sprinkle's Secret Ingredient |q 2641
step
Do: Skulk Rock Clean-up |q 2877
step
turnin Troll Necklace Bounty##2880
step
turnin Skulk Rock Clean-up##2877
step
turnin Witherbark Cages##2988
step
accept The Altar of Zul##2989
step
Do: The Altar of Zul |q 2989
step
You should have found the chicken beacon quest by now
step
accept Find OOX-09/HL!##485
step
turnin Find OOX-09/HL!##485
step
accept Rescue OOX-09/HL!##836
step
Do: Rescue OOX-09/HL! |q 836
step
Do: The Super Snapper FX |q 2944
step
Do: Whiskey Slim's Lost Grog |q 580
step
Grind 3-4 bars on the turtles
step
use Hearthstone##6948
step
turnin The Altar of Zul##2989
step
fpath Loch Modan
step
home Loch Modan
step
Run to 46.9,78.4 |goto Loch Modan 46.9,78.4
]]
)
