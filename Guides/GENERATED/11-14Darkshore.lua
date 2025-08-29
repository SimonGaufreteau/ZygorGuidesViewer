local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\11-14Darkshore',
  [[
author TUGs
next GENERATED\\14-17Loch Modan
startlevel 11
step
turnin Flight to Auberdine##6342
|only if Nightelf
step
accept Return to Nessa##6343
|only if Nightelf
step
accept Buzzbox 827##983
step
accept Washed Ashore##3524
step
fpath Darkshore |goto Darkshore 36.3,45.6
|only if Dwarf,Gnome,Human
step
Do: Buzzbox 827 |q 983
step
Do: Washed Ashore |q 3524
step
Farm till youre level[XP12+1300] on the crabs/murlocs
step
turnin Buzzbox 827##983
step
accept Buzzbox 411##1001
step
turnin Washed Ashore##3524
step
accept Washed Ashore##4681
step
accept For Love Eternal##963
step
Do: Washed Ashore |q 4681
step
Do: Buzzbox 411 |q 1001
step
Run to 37, 41 |goto Darkshore 37, 41
step
accept Bashal'Aran##954
step
accept Tools of the Highborne##958
step
accept Plagued Lands##2118
step
accept How Big a Threat?##984
step
Run to 46.2, 31 |goto Darkshore 46.2, 31
step
Do: Plagued Lands |q 2118
step
Do: Body and Heart |q 6001
|only if Druid
step
turnin Bashal'Aran##954
step
accept Bashal'Aran##955
step
Do: Bashal'Aran |q 955
step
turnin Bashal'Aran##955
step
accept Bashal'Aran##956
step
Do: Bashal'Aran |q 956
step
turnin Bashal'Aran##956
step
accept Bashal'Aran##957
step
turnin Plagued Lands##2118
step
accept Cleansing of the Infected##2138
step
accept The Red Crystal##4811
step
accept Cave Mushrooms##947
step
turnin Washed Ashore##4681
step
Do: [QC4811] at [G47.3,48.7Darkshore]
step
accept The Fall of Ameth'Aran##953
step
Do [QC953- ][QC963- ][QC958- ][QC957]
step
Grind until level13
|ding 13
step
turnin The Fall of Ameth'Aran##953
step
Go South of Ameth 'Aran and kill as many Rabid Thistle Bears as possible, afterwards go to around [G38,60]. You should find 6-10 to kill, that will do for now.
step
accept Beached Sea Turtle##4722
step
Do: [QC984] at [G39, 54.1Darkshore]
step
turnin Beached Sea Turtle##4722
step
turnin For Love Eternal##963
step
turnin The Red Crystal##4811
step
accept As Water Cascades##4812
step
Fill the water tube at the nearby moonwell
step
turnin How Big a Threat?##984
step
accept How Big a Threat?##985
step
accept Thundris Windweaver##4761
step
accept The Tower of Althalaxx##965
step
accept Deep Ocean, Vast Sea##982
step
turnin Tools of the Highborne##958
step
turnin Thundris Windweaver##4761
step
accept The Cliffspring River##4762
step
Do: How Big a Threat? |q 985
step
Grind until level14
|ding 14
step
turnin As Water Cascades##4812
step
accept The Fragments Within##4813
step
turnin Bashal'Aran##957
step
accept Beached Sea Creature##4723
step
Do: Deep Ocean, Vast Sea |q 982
step
turnin Buzzbox 411##1001
step
accept Buzzbox 323##1002
step
accept Beached Sea Turtle##4725
step
Start killing all Moonstalkers and Rabid Thistle Bears you see!
step
Run to 50.7,24.8 |goto Darkshore 50.7,24.8
step
Jump into the water.
step
Run to 50.8, 25.3 |goto Darkshore 50.8, 25.3
step
Do: The Cliffspring River |q 4762
step
accept Beached Sea Turtle##4727
step
turnin The Tower of Althalaxx##965
step
accept The Tower of Althalaxx##966
step
Many classes CAN NOT do this quest properly(Warriors especially) if you cant, DONT WORRY, you can do it later!!!(just cancel it, I will make you accept it again)
step
Do: The Tower of Althalaxx |q 966
step
turnin The Tower of Althalaxx##966
step
accept The Tower of Althalaxx##967
step
Do: Cleansing of the Infected |q 2138
step
Do: Cave Mushrooms |q 947
step
Do: Buzzbox 323 |q 1002
step
turnin Buzzbox 323##1002
step
accept Buzzbox 525##1003
step
Die on Purpose and rezz at the spirit healer. Yes this gives a 5min debuff, but it wont matter.
step
turnin Cleansing of the Infected##2138
step
turnin How Big a Threat?##985
step
accept A Lost Master##986
step
turnin Deep Ocean, Vast Sea##982
step
turnin The Cliffspring River##4762
step
turnin The Fragments Within##4813
step
turnin Cave Mushrooms##947
step
accept Onu##948
step
turnin Beached Sea Turtle##4727
step
turnin Beached Sea Turtle##4725
step
turnin Beached Sea Creature##4723
step
[A Nightelf]As a Nightelf you have to do the Wetlands run now all the way to Ironforge, Get the Flightpaths in Wetlands,Loch Modan and Ironforge itself
step
home Ironforge
|only if Nightelf
step
use Hearthstone##6948
|only if Dwarf,Gnome,Human
step
Buy lvl 15 Food/Water (I recommend 30-40 each)
]]
)
