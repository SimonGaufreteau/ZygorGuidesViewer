local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\17-19Darkshore',
  [[
author TUGs
next GENERATED\\19-21Deadmines
startlevel 17
step
accept The Absent Minded Prospector##729
step
accept WANTED: Murkdeep!##4740
step
accept Fruit of the Sea##1138
step
accept Beached Sea Creature##4728
step
Do: Fruit of the Sea |q 1138
step
accept Beached Sea Creature##4730
step
The next 3 sea creatures are harder to get,especially as lvl 17warrior, but its doable, pull them ONE BY ONE! (You could also do it later if you die)
step
accept Beached Sea Turtle##4731
step
accept Beached Sea Turtle##4732
step
accept Beached Sea Creature##4733
step
Whilst going towards the next quest, kill all Moonstalker Sires you see.
step
accept One Shot. One Kill.##5713
step
Do: One Shot. One Kill. |q 5713
step
Do: A Lost Master |q 986
step
Do [QC986- ][QC1003]
step
turnin Buzzbox 525##1003
step
turnin Onu##948
step
accept The Master's Glaive##944
step
You got a phial from Onu, use it once you have entered the Masters Glaive and put it on the ground
step
turnin The Master's Glaive##944
step
accept The Twilight Camp##949
step
turnin The Twilight Camp##949
step
accept Return to Onu##950
step
ESCORT QUEST COMING,TURN OFF AUTO TURNIN/ACCEPT IF YOURE IN A GROUP!
step
accept Therylune's Escape##945
step
Do: Therylune's Escape |q 945
step
There is a RARE quest drop - Book: The Powers Below - in the pit, I never got it regularly EVER(I only got it when the escort dryad wasnt there and I was grinding mobs till she spawns). Accept it if you got it.
step
accept The Powers Below##968
step
ESCORT QUEST COMING,TURN OFF AUTO TURNIN/ACCEPT IF YOURE IN A GROUP! 

This escort quest is REALLY hard but has 3 follow ups, so make sure to do this(ask in general chat etc).

Tip: Make Remtravel pull, or he will just continue walking, BUT he is NOT TANKY, take the aggro as soon as he is engaged! Even I fail this(if I am solo) sometimes and Remtravel dies.Just grind on the Golems until he respawns.
step
turnin The Absent Minded Prospector##729
step
accept The Absent Minded Prospector##731
step
Do: The Absent Minded Prospector |q 731
step
turnin Return to Onu##950
step
accept Mathystra Relics##951
step
Careful, there will be multiple waves with 2-3Murlocs each, kill the last murloc per wave away from the fire,eat/drink up and pull the next wave OR get a group! If you cant manage to do it,just skip it.
step
Run to 36.4, 75.6 |goto Darkshore 36.4, 75.6
step
Do: WANTED: Murkdeep! |q 4740
step
turnin Beached Sea Turtle##4731
step
turnin Beached Sea Creature##4728
step
turnin Beached Sea Creature##4730
step
turnin Beached Sea Creature##4733
step
turnin Beached Sea Turtle##4732
step
turnin Fruit of the Sea##1138
step
turnin WANTED: Murkdeep!##4740
step
accept The Blackwood Corrupted##4763
step
Fill the bowl provided with water in the moonwell in Auberdine.
step
accept Tharnariun's Hope##2139
step
turnin A Lost Master##986
step
accept A Lost Master##993
step
Do: Tharnariun's Hope |q 2139
step
Do: The Blackwood Corrupted |q 4763
step
accept The Tower of Althalaxx##966
step
Do: The Tower of Althalaxx |q 966
step
turnin The Tower of Althalaxx##966
step
accept The Tower of Althalaxx##967
step
Do: Mathystra Relics |q 951
step
Grind until level19+4200
|ding 19+4200
step
Die on purpose and rezz up.
step
turnin Tharnariun's Hope##2139
step
turnin The Blackwood Corrupted##4763
step
Take the boat to Darnassus
step
fpath Teldrassil |goto Teldrassil 58.4,94
step
use Hearthstone##6948
step
Get your level 18 spells at your trainer
step
turnin The Powers Below##968
step
accept Speak with Shoni##2041
step
Take the Train to Stormwind.
step
If it is in stock: Buy a Bronzetube at [G55.3,7.1Stormwind City]
step
turnin Speak with Shoni##2041
]]
)
