local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\33-36 Desolace',
  [[
author TUGs
next GENERATED\\36-37Arathi
startlevel 33
step
accept Vahlarriel's Search##1437
step
accept Strange Alliance##1382
step
accept Centaur Bounty##1387
step
accept The Karnitol Shipwreck##1454
step
accept Reagents for Reclaimers Inc.##1458
step
fpath Desolace |goto Desolace 65,10
step
home Desolace
step
accept Vahlarriel's Search##1465
step
Do: Reagents for Reclaimers Inc. |q 1458
step
accept Vahlarriel's Search##1438
step
accept Reagents for Reclaimers Inc.##1459
step
Kill all Scorpions/Aged Kodos you find from now on
step
Do: Reagents for Reclaimers Inc. |q 1459
step
accept Bone Collector##5501
step
Run to 67.2, 74.4 |goto Desolace 67.2, 74.4
step
Kill Magram Centaurs for Strange Alliances (Farm untill youre friendly with Gelkis) and Centaur Bounty
step
Do: Strange Alliance |q 1382
step
Do: Centaur Bounty |q 1387
step
accept Kodo Roundup##5561
step
Do: Kodo Roundup |q 5561
step
Do: Bone Collector |q 5501
step
Do: Reagents for Reclaimers Inc. |q 1459
step
accept Raid on the Kolkar##1384
step
use Hearthstone##6948
step
Do: Raid on the Kolkar |q 1384
step
accept The Karnitol Shipwreck##1455
step
accept Sceptre of Light##5741
step
accept Search for Tyranis##1439
step
Do: Sceptre of Light |q 5741
step
Do: Search for Tyranis |q 1439
step
NEXT ACCEPT IS ESCORT,WAIT IF YOURE IN GRP!
step
accept Return to Vahlarriel##1440
step
accept The Karnitol Shipwreck##1456
step
accept Book of the Ancients##6027
step
Do: The Karnitol Shipwreck |q 1456
step
Do: Book of the Ancients |q 6027
step
use Hearthstone##6948
step
accept The Karnitol Shipwreck##1457
step
accept Stealing Supplies##1370
step
Do: Stealing Supplies |q 1370
step
accept Ongeku##1373
step
Run to 41.3,93.0 |goto Desolace 41.3,93.0
step
Run to 47.5,30.3 |goto Feralas 47.5,30.3
step
Run to 47.3,37.5 |goto Feralas 47.3,37.5
step
fpath Feralas |goto Feralas 30.24,43.24
step
fpath The Barrens
step
accept Goblin Sponsorship##1180
step
accept Parts for Kravel##1112
step
accept Passage to Booty Bay##1040
step
Take the boat to Booty Bay
step
accept Goblin Sponsorship##1181
step
accept The Caravan Road##1041
step
home Stranglethorn Vale
step
accept Singing Blue Shards##605
step
accept Supplies to Private Thorsen##198
step
accept Investigate the Camp##201
step
accept Bloodscalp Ears##189
step
accept Hostile Takeover##213
step
accept Goblin Sponsorship##1182
step
accept The Stone of the Tides##578
step
accept Supply and Demand##575
step
Do: Hostile Takeover |q 213
step
They key for the chest is ontop of the oil rig
step
Do: Goblin Sponsorship |q 1182
step
Do: Raptor Mastery |q 195
step
Do: Tiger Mastery |q 188
step
You dont have to finish the Bloodscalp ears now
step
Do: Bloodscalp Ears |q 189
step
accept Raptor Mastery##196
step
Do: Supply and Demand |q 575
step
Run to 26,17 |goto Stranglethorn Vale 26,17
step
Do: Singing Blue Shards |q 605
step
Do: Bloodscalp Ears |q 189
step
Finish the Bloodscalp ears now
step
Do: The Stone of the Tides |q 578
step
use Hearthstone##6948
step
accept Goblin Sponsorship##1183
step
fpath Duskwood
step
accept The Carevin Family##1042
step
accept The Scythe of Elune##1043
step
Do: The Scythe of Elune |q 1043
step
accept Answered Questions##1044
step
fpath Stormwind City
step
accept Malin's Request##690
step
fpath Ironforge
step
accept Further Mysteries##525
step
accept Ironband Wants You!##707
step
accept The Lost Dwarves##2398
step
accept Reclaimed Treasures##1360
step
fpath Hillsbrad Foothills
step
accept Crushridge Bounty##500
step
accept Dark Council##537
step
accept Noble Deaths##512
step
If youre in a groupe:EMPTY INVENTORY! Dungeon Farm ahead
step
home Hillsbrad Foothills
step
Do: Crushridge Bounty |q 500
step
Do (Optional): The Perenolde Tiara
step
Do: Dark Council |q 537
step
Do: Noble Deaths |q 512
step
Grind until level38
|ding 38
step
use Hearthstone##6948
step
fpath Wetlands
step
accept The Missing Diplomat##1249
step
Do: The Missing Diplomat |q 1249
]]
)
