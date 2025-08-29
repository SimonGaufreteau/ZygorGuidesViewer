local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\55-55BS',
  [[
author TUGs
next GENERATED\\56-56WPL
startlevel 55
step
accept Extinguish the Firegut##3823
step
accept FIFTY! YEP!##4283
step
accept Broodling Essence##4726
step
accept Tablet of the Seven##4296
step
Do: The Smoldering Ruins of Thaurissan |q 3701
step
Do: Tablet of the Seven |q 4296
step
Do: Extinguish the Firegut |q 3823
step
Do: Broodling Essence |q 4726
step
Do (Optional): Dragonkin Menace
step
turnin Broodling Essence##4726
step
turnin Tablet of the Seven##4296
step
turnin Extinguish the Firegut##3823
step
accept Gor'tesh the Brute Lord##3824
step
Do: Gor'tesh the Brute Lord |q 3824
step
Do: FIFTY! YEP! |q 4283
step
turnin FIFTY! YEP!##4283
step
turnin Gor'tesh the Brute Lord##3824
step
fpath Redridge Mountains
step
fpath Stormwind City
step
Do (Optional): The True Masters
step
accept A Call to Arms: The Plaguelands!##5066
]]
)
