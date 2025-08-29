local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\59-60BS',
  [[
author TUGs
startlevel 59
step
turnin The Smoldering Ruins of Thaurissan##3701
step
accept Kharan Mighthammer##4341
step
turnin Ragnar Thunderbrew##4128
step
accept Hurley Blackbreath##4126
step
fpath Stormwind City
step
turnin Better Late Than Never##5022
step
accept Good Natured Emma##5048
step
turnin Good Natured Emma##5048
step
accept Good Luck Charm##5050
step
fpath Redridge
step
fpath Burning Steppes
step
accept The Good Stuff##4286
step
Do: The True Masters |q 4224
step
accept The Heart of the Mountain##4123
step
accept Ogre Head On A Stick = Party##3825
step
Do: Ogre Head On A Stick = Party |q 3825
step
accept A Taste of Flame##4024
step
turnin Ogre Head On A Stick = Party##3825
step
accept Overmaster Pyron##4262
step
If youre not 60 by now there are basically 2 options: Finish the Winterspring quests or do a Full BRD run (and Stratholme/Scholo if thats still not enough)
]]
)
