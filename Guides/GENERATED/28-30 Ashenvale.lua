local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\28-30 Ashenvale',
  [[
author TUGs
next GENERATED\\30-31 Hillsbrad Foothills
startlevel 28
step
accept Lightforge Iron##321
step
accept The Lost Ingots##324
step
Do: The Lost Ingots |q 324
step
accept Blessed Arm##322
step
Take the boat to Auberdine.
step
fpath Ashenvale
step
accept The Howling Vale##1022
step
accept Vile Satyr! Dryads in Danger!##1021
step
accept Kayneth Stillwind##4581
step
accept Fallen Sky Lake##1035
step
Run to 58.6, 55.3 |goto Ashenvale 58.6, 55.3
step
Do: Raene's Cleansing |q 1026
step
Run to 54.3, 32.8 |goto Ashenvale 54.3, 32.8
step
Grind the worgen till youre level[XP29+10000]
step
Do: [QC1022] Go through the cave at[G53,37.58Ashenvale] and loot the tome. (Careful,easy to overpull here,if the Rare it will be pretty hard. But it is doable even as a warrior(Retalition, Intimidating Shout+Bandage etc.).
step
Run to 60.4, 52.5 |goto Ashenvale 60.4, 52.5
step
Run to 50.1, 48.4 |goto Ashenvale 50.1, 48.4
step
turnin Raene's Cleansing##1026
step
accept Raene's Cleansing##1027
step
Do: Raene's Cleansing |q 1027
step
Do: Fallen Sky Lake |q 1035
step
turnin Raene's Cleansing##1027
step
accept Raene's Cleansing##1028
step
turnin Raene's Cleansing##1028
step
Run to 64.4, 43.8 |goto Ashenvale 64.4, 43.8
step
Do: The Tower of Althalaxx |q 1140,1
step
turnin Vile Satyr! Dryads in Danger!##1021
step
accept The Branch of Cenarius##1031
step
The next quest is not as hard as the worgen quest but you are level 29 and the mob is 32. I am able to do it as warrir without Retaliation,Bandage or healthpot. Just pool rage on the previous mob, eat up and kill it fast(I pull from the right through the tree.
step
Do: The Branch of Cenarius |q 1031
step
Do: The Tower of Althalaxx |q 1140,2
step
Grind the worgen till youre level[XP29+30000]
step
turnin Kayneth Stillwind##4581
step
fpath Azshara |goto Azshara 11.9,77.6
step
fpath Astranaar
step
turnin Fallen Sky Lake##1035
step
turnin The Howling Vale##1022
step
accept Velinde Starsong##1037
step
turnin The Branch of Cenarius##1031
step
turnin The Tower of Althalaxx##1140
step
fpath Rut'Theran
step
accept Klockmort's Essentials##2925
step
turnin Velinde Starsong##1037
step
accept Velinde's Effects##1038
step
Do: Velinde's Effects |q 1038
step
turnin Velinde's Effects##1038
step
accept The Barrens Port##1039
step
use Hearthstone##6948
step
accept Lifting the Curse##290
step
accept Fall of Dun Modr##472
step
Do: Lifting the Curse |q 290
step
accept The Eye of Paleth##292
step
If you're in a group, do the follow up ELITE quest Defeat Nek'rosh otherwise skip it.
step
Do (Optional): Defeat Nek'rosh
step
Do: A Noble Brew |q 335,2
step
turnin Fall of Dun Modr##472
step
If you're in a group, accept the follow up ELITE quests A Grim Task and The Dark Iron War otherwise skip it.
step
The next quest requires you to interact with a corpse downstairs. There are 1-3 elites that you might pull. Its easy: use your pet/frost nova/fear to get rid of the adds, interact with the corpse und run up the same way you came down. DO NOT attack the mobs and just run away.
step
accept The Thandol Span##631
step
turnin The Thandol Span##631
step
accept The Thandol Span##632
step
turnin The Thandol Span##632
step
accept The Thandol Span##633
step
Jump off the Bridge to go to [G44.3,92.9Arathi Highlands] and collect the Letter next to the dwarf
step
accept Sully Balloo's Letter##637
step
Do: The Thandol Span |q 633
step
turnin The Thandol Span##633
step
accept Plea To The Alliance##634
step
Do (Optional): A Grim Task
step
Do (Optional): The Dark Iron War
step
fpath Arathi Highlands |goto Arathi Highlands 45.7, 46.1
]]
)
