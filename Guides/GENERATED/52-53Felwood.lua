local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\52-53Felwood',
  [[
author TUGs
next GENERATED\\53-53Feralas
startlevel 52
step
accept Cleansing Felwood##4101
step
accept Timbermaw Ally##8460
step
accept Forces of Jaedenar##5155
step
accept The Corruption of the Jadefire##4421
step
accept Verifying the Corruption##5156
step
Do: Timbermaw Ally |q 8460
step
Grind 4-5 Bars on the Furbolgs here
step
turnin Timbermaw Ally##8460
step
accept Speak to Nafien##8462
step
Do: The Corruption of the Jadefire |q 4421
step
Grind 4-5 Bars on the Satyrs or the slimes around the nearby pond
step
Do: Forces of Jaedenar |q 5155
step
Grind 4-5 Bars on the Jaedenar or the slimes around the nearby pond
step
turnin The Corruption of the Jadefire##4421
step
accept Further Corruption##4906
step
turnin Forces of Jaedenar##5155
step
accept Collection of the Corrupt Water##5157
step
Do: Collection of the Corrupt Water |q 5157
step
Grind till [XP52]
step
Do: Verifying the Corruption |q 5156
step
Do: Further Corruption |q 4906
step
accept Flute of Xavaric##939
step
Do: Flute of Xavaric |q 939
step
Do: Cleansing Felwood |q 4101
step
fpath Felwood |goto Felwood 62.5,24.2
step
turnin Speak to Nafien##8462
step
accept Deadwood of the North##6221
step
Do: Deadwood of the North |q 6221
step
turnin Deadwood of the North##6221
step
Run to 66.3,2.9 |goto Felwood 66.3,2.9
step
accept Winterfall Activity##6241
step
turnin It's a Secret to Everybody##3908
step
accept The Videre Elixir##3909
step
accept Trouble in Winterspring!##6603
step
accept Sister Pamela##5601
step
fpath Winterspring |goto Winterspring 61.4,38.8
]]
)
