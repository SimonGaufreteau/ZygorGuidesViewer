local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\49-51Un_Goro',
  [[
author TUGs
next GENERATED\\52-53Felwood
startlevel 49
step
accept The Apes of Un'Goro##4289
step
accept The Fare of Lar'korwi##4290
step
Get 7 Crystals each(Blue,Green,Yellow,Red) and A Mangled Journal from the raptors
step
accept It's a Secret to Everybody##3844
step
turnin It's a Secret to Everybody##3844
step
accept It's a Secret to Everybody##3845
step
Do: The Fare of Lar'korwi |q 4290
step
Grind till level 49 and 50% on plants around [G67.7,30.7Un'Goro Crater]
step
turnin The Fare of Lar'korwi##4290
step
accept The Scent of Lar'korwi##4291
step
Do: The Scent of Lar'korwi |q 4291
step
turnin The Scent of Lar'korwi##4291
step
accept The Bait for Lar'korwi##4292
step
The following quest can be hard, you could skip it untill youre back to Un'Goro again
step
Do: The Bait for Lar'korwi |q 4292
step
turnin It's a Secret to Everybody##3845
step
accept It's a Secret to Everybody##3908
step
fpath Un'Goro Crater |goto Un'Goro Crater 45.2,5.8
step
turnin Williden's Journal##3884
step
accept Expedition Salvation##3881
step
accept Alien Ecology##3883
step
accept Roll the Bones##3882
step
accept Crystals of Power##4284
step
turnin Crystals of Power##4284
step
accept The Northern Pylon##4285
step
accept The Western Pylon##4288
step
accept The Eastern Pylon##4287
step
accept Beware of Pterrordax##4501
step
accept Muigin and Larion##4141
step
accept Shizzle's Flyer##4503
step
Plenty of stuff to kill alongside here, so you DONT HAVE TO do them in the order here now. Do the following quests in order,ive put the KILLQUESTS after (so that you do them alongside)
step
Do: The Northern Pylon |q 4285
step
Do: The Apes of Un'Goro |q 4289
step
Grind till [XP50] on the flowers
step
Do: Expedition Salvation |q 3881
step
Do: The Eastern Pylon |q 4287
step
turnin The Apes of Un'Goro##4289
step
turnin The Bait for Lar'korwi##4292
step
Run to 50.4,78.8 |goto Un'Goro Crater 50.4,78.8
step
Run to 48.7,85.2 |goto Un'Goro Crater 48.7,85.2
step
Do: Alien Ecology |q 3883
step
Do: Expedition Salvation |q 3881
step
Do: The Western Pylon |q 4288
step
Finish all kill/collect quests
step
Do: Shizzle's Flyer |q 4503
step
Do: Muigin and Larion |q 4141
step
Do: Beware of Pterrordax |q 4501
step
turnin Shizzle's Flyer##4503
step
turnin Muigin and Larion##4141
step
accept A Visit to Gregan##4142
step
turnin Beware of Pterrordax##4501
step
turnin Roll the Bones##3882
step
turnin Alien Ecology##3883
step
turnin Expedition Salvation##3881
step
turnin The Northern Pylon##4285
step
turnin The Western Pylon##4288
step
turnin The Eastern Pylon##4287
step
accept Making Sense of It##4321
step
turnin Making Sense of It##4321
step
Grind till [XP51]
step
use Hearthstone##6948
step
fpath Wetlands
step
Take the boat to Auberdine.
step
fpath Ruth'Theran
step
turnin Favored of Elune?##3661
step
turnin The Super Snapper FX##2944
step
accept Return to Troyas##2943
step
accept Starfall##5250
step
turnin Rise of the Silithid##162
step
accept March of the Silithid##4493
step
fpath Ashenvale
step
home Ashenvale
]]
)
