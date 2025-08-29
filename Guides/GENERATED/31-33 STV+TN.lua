local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\31-33 STV+TN',
  [[
author TUGs
next GENERATED\\32 Gnomeregan
startlevel 31
step
fpath Duskwood
step
turnin The Totem of Infliction##101
step
turnin The Missing Diplomat##1243
step
accept The Missing Diplomat##1244
step
home Duskwood
step
turnin The Night Watch##58
step
fpath Westfall
step
turnin Armed and Ready##325
step
If you are in a group, do the follow-up elite quest Morbent Fel, otherwise skip it.
step
Do: The Missing Diplomat |q 1244
step
Do: Ogre Thieves |q 134
step
Do: Look To The Stars |q 181
step
accept The Second Rebellion##203
step
accept Welcome to the Jungle##583
step
accept Raptor Mastery##194
step
accept Tiger Mastery##185
step
accept Panther Mastery##190
step
Do: Tiger Mastery |q 185
step
accept Tiger Mastery##186
step
Do: Panther Mastery |q 190
step
Do: Tiger Mastery |q 186
step
Do: The Second Rebellion |q 203
step
accept Tiger Mastery##187
step
accept Panther Mastery##191
step
Do: Panther Mastery |q 191
step
Grind on the Tigers/Panthers till [XP31+47600]
step
accept Krazek's Cookery##210
step
Run to 34.78, 51.33 |goto Stranglethorn Vale 34.78, 51.33
step
Die and rezz at Ghosthealer.
step
accept The Haunted Isle##616
step
fpath Stranglethorn Vale |goto Stranglethorn Vale 27.4,77.6
step
Take the Boat to Ratchet
step
fpath The Barrens |goto The Barrens 63.0, 37.2
step
Run to 31.8,23.5 |goto Thousand Needles 31.8,23.5
step
fpath Feralas |goto Feralas 89.5,45.9
step
accept Hardened Shells##1105
step
accept Salt Flat Venom##1104
step
accept Rocket Car Parts##1110
step
accept Wharfmaster Dizzywig##1111
step
accept Hemet Nesingwary##5762
step
accept Load Lightening##1176
step
accept A Bump in the Road##1175
step
Do [QC1176-][QC1105-][QC1110-][QC1104-][QC1175 Load Lightening,Hardened Shells,Rocket Car Parts,Salt Flat Venom,A bumb in the Road]
step
Grind till [XP33]
step
turnin Reassignment##563
step
accept Worgen in the Woods##222
step
Do: The Legend of Stalvan |q 98
step
turnin The Legend of Stalvan##98
step
Do: The Missing Diplomat |q 1244
step
use Hearthstone##6948
step
turnin Worgen in the Woods##222
step
accept Worgen in the Wood##223
step
turnin Look To The Stars##181
step
turnin Worgen in the Wood##223
step
turnin The Missing Diplomat##1244
step
accept The Missing Diplomat##1245
step
fpath Westfall
step
accept The Missing Diplomat##1246
step
accept The Missing Diplomat##1447
step
Do: The Missing Diplomat |q 1447
step
accept The Missing Diplomat##1247
step
accept The Missing Diplomat##1248
step
accept Costly Menace##564
step
accept Syndicate Assassins##505
step
Do: A King's Tribute |q 689
step
Do: Syndicate Assassins |q 505
step
Do: Costly Menace |q 564
step
accept Foreboding Plans##510
step
accept Encrypted Letter##511
step
use Hearthstone##6948
step
accept Letter to Stormpike##514
step
accept Further Mysteries##525
step
accept Reclaimers' Business in Desolace##1453
step
Do: Tiger Mastery |q 187
step
Do: Raptor Mastery |q 194
]]
)
