local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\44-45Feralas',
  [[
author TUGs
next GENERATED\\45-46Tanaris
startlevel 44
step
fpath Feralas
step
accept The Mark of Quality##2821
step
home Feralas
step
accept Jonespyre's Request##3787
step
accept The Ruins of Solarsal##2866
step
accept The Missing Courier##4124
step
accept In Search of Knowledge##2939
step
accept The High Wilderness##2982
step
accept The Missing Courier##4125
step
accept Return to Feathermoon Stronghold##2867
step
accept Against the Hatecrest##3130
step
accept Against the Hatecrest##2869
step
accept Against Lord Shalzaru##2870
step
Do: Against Lord Shalzaru |q 2870
step
accept Boat Wreckage##4127
step
Do: Screecher Spirits |q 3520
step
use Hearthstone##6948
step
accept The Knife Revealed##4129
step
accept Psychometric Reading##4130
step
accept The Woodpaw Gnolls##4131
step
Do: The Mark of Quality |q 2821
step
Do: The High Wilderness |q 2982
step
accept Freedom for All Creatures##2969
step
Do: Freedom for All Creatures |q 2969
step
accept Doling Justice##2970
step
Do: Doling Justice |q 2970
step
accept Doling Justice##2972
step
accept The Writhing Deep##4135
step
You got a questitem in your inventory:
step
Run to 73.2,63.9 |goto Feralas 73.2,63.9
step
Run to 72.3,64.2 |goto Feralas 72.3,64.2
step
accept Freed from the Hive##4265
step
Do: Freed from the Hive |q 4265
step
You should have found the Chicken quest by now, Accept it now
step
accept Find OOX-22/FE!##2766
step
accept Rescue OOX-22/FE!##2767
step
Do: Rescue OOX-22/FE! |q 2767
step
accept A Hero's Welcome##4266
step
accept Rise of the Silithid##4267
step
accept Delivering the Relic##2871
step
fpath Darnassus
]]
)
