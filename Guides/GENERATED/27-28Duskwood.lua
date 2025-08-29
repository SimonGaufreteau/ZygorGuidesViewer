local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\27-28Duskwood',
  [[
author TUGs
next GENERATED\\28-30 Ashenvale
startlevel 27
step
fpath Stormwind City
step
Get your level 26 spells at your trainer
|only if Warrior,Hunter,Rogue
step
accept Tinkmaster Overspark##2923
step
Get your level 26 spells at your trainer
|only if Paladin,Priest,Druid,Warlock
step
accept A Noble Brew##335
step
Get your level 26 spells at your trainer
|only if Mage
step
turnin A Scroll from Mauren##1075
step
turnin A Donation of Wool##7791
step
fpath Duskwood
step
Do: A Noble Brew |q 335,1
step
Buy Food&Water and repair.
step
accept The Night Watch##57
step
accept Worgen in the Woods##173
step
accept Look To The Stars##174
step
turnin Look To The Stars##174
step
accept Look To The Stars##175
step
turnin Look To The Stars##175
step
accept Look To The Stars##177
step
Do: Look To The Stars |q 177
step
Run to 65.0, 46.3 |goto Duskwood 65.0, 46.3
step
Do: Worgen in the Woods |q 173
step
turnin Worgen in the Woods##173
step
accept Worgen in the Woods##221
step
turnin Look To The Stars##177
step
accept Look To The Stars##181
step
Do: Worgen in the Woods |q 221
step
Grind until level28
|ding 28
step
turnin Sven's Revenge##95
step
accept Sven's Camp##230
step
turnin Eight-Legged Menaces##245
step
Do: The Totem of Infliction |q 101,2
step
turnin Return to Jitters##240
step
Do: The Night Watch |q 57
step
turnin Deliver the Thread##157
step
accept Zombie Juice##158
step
accept The Weathered Grave##225
step
turnin Sven's Camp##230
step
accept The Shadowy Figure##262
step
Run to 56.4,52.6 |goto Westfall 56.4,52.6
step
fpath Duskwood
step
turnin The Shadowy Figure##262
step
accept The Shadowy Search Continues##265
step
turnin The Night Watch##57
step
accept The Night Watch##58
step
turnin The Shadowy Search Continues##265
step
accept Inquire at the Inn##266
step
turnin The Weathered Grave##225
step
accept Morgan Ladimore##227
step
turnin Morgan Ladimore##227
step
turnin Inquire at the Inn##266
step
accept Finding the Shadowy Figure##453
step
turnin Zombie Juice##158
step
accept Gather Rot Blossoms##156
step
turnin Worgen in the Woods##221
step
Do: Gather Rot Blossoms |q 156
step
turnin Gather Rot Blossoms##156
step
accept Juice Delivery##159
step
fpath Westfall
step
accept Return to Sven##268
step
turnin Juice Delivery##159
step
accept Ghoulish Effigy##133
step
Do: The Night Watch |q 58
step
Do: Ghoulish Effigy |q 133
step
Do: The Totem of Infliction |q 101
step
turnin Ghoulish Effigy##133
step
accept Ogre Thieves##134
step
accept Proving Your Worth##323
step
Do: Proving Your Worth |q 323
step
accept Seeking Wisdom##269
step
Run to 56.4,52.6 |goto Westfall 56.4,52.6
step
fpath Stormwind
step
Do (Optional): Items of Some Consequence
step
accept The Missing Diplomat##1274
step
accept The Doomed Fleet##270
step
turnin The Missing Diplomat##1274
step
accept The Missing Diplomat##1241
step
turnin The Missing Diplomat##1241
step
accept The Missing Diplomat##1242
step
turnin The Missing Diplomat##1242
step
accept The Missing Diplomat##1243
step
use Hearthstone##6948
]]
)
