local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\32 Gnomeregan',
  [[
author TUGs
next GENERATED\\33-36 Desolace
startlevel 32 Gnomeregan
step
home Dun Morogh
step
accept The Brassbolts Brothers##1179
step
accept A King's Tribute##700
step
fpath Ironforge
step
turnin Klockmort's Essentials##2925
step
Next part is optional,as its Gnomeregan, continue with Accept The Brassbolt Brother
]]
)
