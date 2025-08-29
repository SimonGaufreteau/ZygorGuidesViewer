local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\38Dustwallow Marsh',
  [[
author TUGs
next GENERATED\\39STV
startlevel 38Dustwallow Marsh
step
fpath Wetlands
step
Take the Boat to Theramore
step
fpath Dustwallow Marsh |goto Dustwallow Marsh 67,51
step
fpath Tanaris
step
accept Delivery to the Gnomes##1114
step
accept Martek the Exiled##1106
step
accept The Rumormonger##1115
step
accept The Eighteenth Pilot##1186
step
accept Razzeric's Tweaking##1187
step
Run to 51,29 |goto Tanaris 51,29
step
fpath Dustwallow Marsh
step
Buy 3 Soothing Spices at [G 66,51Dustwallow Marsh]
step
accept They Call Him Smiling Jim##1282
step
accept The Missing Diplomat##1265
step
home Dustwallow Marsh
step
Run to 60.1,40.7 |goto Dustwallow Marsh 60.1,40.7
step
accept The Missing Diplomat##1266
step
accept Soothing Spices##1218
step
accept Jarl Needs Eyes##1206
step
accept The Orc Report##1219
step
accept Stinky's Escape##1222
step
Do: Stinky's Escape |q 1222
step
accept The Missing Diplomat##1324
step
Do: The Missing Diplomat |q 1324
step
accept The Missing Diplomat##1267
step
Do: Jarl Needs Eyes |q 1206
step
Grind till [XP38]
step
accept Hungry!##1177
step
accept Suspicious Hoofprints##1284
step
accept Lieutenant Paval Reethe##1252
step
accept The Black Shield##1253
step
Do: Razzeric's Tweaking |q 1187
step
use Hearthstone##6948
step
accept Captain Vimes##1220
step
accept The Black Shield##1319
step
accept Lieutenant Paval Reethe##1259
step
accept Daelin's Men##1285
step
accept The Deserters##1286
step
accept The Black Shield##1320
step
Do: Hungry! |q 1177
step
accept The Deserters##1287
step
fpath Ratchet
step
Take the boat to Booty bay
]]
)
