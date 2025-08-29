local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\24-25Ashenvale',
  [[
author TUGs
next GENERATED\\25-27Wetlands
startlevel 24
step
turnin Escape Through Force##994
step
turnin The Absent Minded Prospector##731
step
accept The Absent Minded Prospector##741
step
turnin A Donation of Wool##7792
step
fpath Darnassus
step
turnin The Absent Minded Prospector##741
step
accept The Absent Minded Prospector##942
step
fpath Ashenvale
step
accept Journey to Stonetalon Peak##1056
step
accept Raene's Cleansing##1024
step
accept An Aggressive Defense##1025
step
Buy water/food (I usually stock up to 40 level 15 here, as well as 20 level 25).
step
Run to 41.7, 49.9 |goto Ashenvale 41.7, 49.9
step
Do: Elune's Tear |q 1033
step
Run to 46.8, 49.1 |goto Ashenvale 46.8, 49.1
step
Run to 48.8, 49.3 |goto Ashenvale 48.8, 49.3
step
turnin Raene's Cleansing##1024
step
accept Raene's Cleansing##1026
step
turnin Elune's Tear##1033
step
accept The Ruins of Stardust##1034
step
Do: The Tower of Althalaxx |q 973
step
Do: The Ruins of Stardust |q 1034
step
Do: An Aggressive Defense |q 1025
step
Run to 50.0, 66.6 |goto Ashenvale 50.0, 66.6
step
Sell everything, repair your gear and buy Food.
step
Run to 42.3, 71.0 |goto Ashenvale 42.3, 71.0
step
Go through the cave into Stonetalon Mountains.
step
turnin On Guard in Stonetalon##1070
step
accept On Guard in Stonetalon##1085
step
turnin On Guard in Stonetalon##1085
step
accept A Gnome's Respite##1071
step
accept Super Reaper 6000##1093
step
Do: Super Reaper 6000 |q 1093
step
Do: A Gnome's Respite |q 1071
step
turnin Super Reaper 6000##1093
step
turnin A Gnome's Respite##1071
step
accept An Old Colleague##1072
step
accept A Scroll from Mauren##1075
step
Do: Pridewings of Stonetalon |q 1134
step
turnin Journey to Stonetalon Peak##1056
step
fpath Stonetalon Mountains |goto Stonetalon Mountains 36.45,7.07
step
fpath Ashenvale
step
turnin Pridewings of Stonetalon##1134
step
accept Kayneth Stillwind##4581
step
turnin An Aggressive Defense##1025
step
accept Culling the Threat##1054
step
turnin The Ruins of Stardust##1034
step
turnin The Tower of Althalaxx##973
step
accept The Tower of Althalaxx##1140
step
Run to 31.3,46.9 |goto Ashenvale 31.3,46.9
step
Do: Culling the Threat |q 1054
step
Grind until level25+16000
|ding 25+16000
step
turnin Culling the Threat##1054
step
use Hearthstone##6948
]]
)
