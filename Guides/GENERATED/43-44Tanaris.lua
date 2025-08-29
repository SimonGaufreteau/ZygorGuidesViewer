local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\43-44Tanaris',
  [[
author TUGs
next GENERATED\\44-45Feralas
startlevel 43
step
accept Safety First##1189
step
accept WANTED: Caliph Scorpidsting##2781
step
accept WANTED: Andre Firebeard##2875
step
accept Water Pouch Bounty##1707
step
accept Wastewander Justice##1690
step
Do: Wastewander Justice |q 1690
step
Grind till [XP44]
step
accept Pirate Hats Ahoy!##8365
step
accept Screecher Spirits##3520
step
accept Dancing for Marzipan##8360
step
accept Stoley's Shipment##2873
step
Do: WANTED: Andre Firebeard |q 2875
step
Do: Pirate Hats Ahoy! |q 8365
step
Do: Dancing for Marzipan |q 8360
step
Do: Stoley's Shipment |q 2873
step
Grind 4-10 Bars unless those pesky AoE farming mages are here :D
step
accept More Wastewander Justice##1691
step
Do: More Wastewander Justice |q 1691
step
Do: WANTED: Caliph Scorpidsting |q 2781
step
accept Deliver to MacKinley##2874
step
accept Handle With Care##3022
]]
)
