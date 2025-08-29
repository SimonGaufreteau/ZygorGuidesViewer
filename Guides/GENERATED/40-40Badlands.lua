local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\40-40Badlands',
  [[
author TUGs
next GENERATED\\41-41 Uldaman
startlevel 40
step
fpath Loch Modan
step
accept Badlands Reagent Run##2500
step
turnin Ironband Wants You!##707
step
accept Find Agmond##738
step
Kill all Vultures & wolves from now on
step
accept A Dwarf and His Tools##719
step
accept Mirages##718
step
turnin Martek the Exiled##1106
step
accept Indurium##1108
step
accept Barbecued Buzzard Wings##703
step
accept Study of the Elements: Rock##710
step
Do: Study of the Elements: Rock |q 710
step
Grind on the elementals for 6-10 bars
step
turnin Study of the Elements: Rock##710
step
accept Study of the Elements: Rock##711
step
Do: Study of the Elements: Rock |q 711
step
turnin Study of the Elements: Rock##711
step
accept Study of the Elements: Rock##712
step
Do: Mirages |q 718
step
Do: A Dwarf and His Tools |q 719
step
accept A Sign of Hope##720
step
turnin A Dwarf and His Tools##719
step
turnin A Sign of Hope##720
step
turnin Mirages##718
step
accept Scrounging##733
step
Farm more if youre not [XP40] yet
step
accept Tremors of the Earth##732
step
Keep an eye out for Boss Tho'grun
step
turnin Find Agmond##738
step
accept Murdaloc##739
step
Do: Murdaloc |q 739
step
Do: Indurium |q 1108
step
The next quest can be hard for melees, do it later if necessary
step
Do: Study of the Elements: Rock |q 712
step
Do: Tremors of the Earth |q 732
step
Do: Scrounging |q 733
step
turnin Study of the Elements: Rock##712
step
Grind on the elementals for 6-10 bars
step
Do: Badlands Reagent Run |q 2500
step
turnin Barbecued Buzzard Wings##703
step
turnin Indurium##1108
step
accept News for Fizzle##1137
step
turnin Tremors of the Earth##732
step
turnin Scrounging##733
step
turnin Murdaloc##739
step
turnin Badlands Reagent Run##2500
step
If you dont intent to do Uldaman, Grind till 41 and skip to the next guide after
]]
)
