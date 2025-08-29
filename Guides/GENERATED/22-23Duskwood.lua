local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\22-23Duskwood',
  [[
author TUGs
next GENERATED\\23-24 Redridge
startlevel 22
step
On your way through Duskwood kill spiders for some Gooey Spider legs. It doesnt matter how many you get,even 0 is ok.
step
accept The Legend of Stalvan##66
step
accept The Totem of Infliction##101
step
turnin The Legend of Stalvan##66
step
accept The Legend of Stalvan##67
step
accept The Night Watch##56
step
accept Raven Hill##163
step
accept Deliveries to Sven##164
step
accept The Hermit##165
step
fpath Duskwood |goto Duskwood 77.12,44.17
step
If it is in stock - and you dont have one yet-: Buy a Bronzetube at [G78,48.3Duskwood]
step
Do: The Night Watch |q 56
step
accept Eight-Legged Menaces##245
step
turnin Raven Hill##163
step
accept Jitters' Growling Gut##5
step
turnin Deliveries to Sven##164
step
accept Sven's Revenge##95
step
accept Wolves at Our Heels##226
step
KEEP YOUR Gooey Spider Legs.Whilst grinding east for the spider and wolf quests do the next 2steps (TurnIn The Hermit and Accept Supplies from Darkshire)
step
Do [QC226- ][QC245]
step
turnin The Hermit##165
step
accept Supplies from Darkshire##148
step
turnin Wolves at Our Heels##226
step
turnin Messenger to Westfall##143
step
accept Messenger to Westfall##144
step
accept The Defias Brotherhood##65
step
turnin The Legend of Stalvan##67
step
accept The Legend of Stalvan##68
step
fpath Duskwood
step
turnin Supplies from Darkshire##148
step
accept Ghost Hair Thread##149
step
turnin Jitters' Growling Gut##5
step
accept Dusky Crab Cakes##93
step
turnin The Night Watch##56
step
turnin The Legend of Stalvan##68
step
accept The Legend of Stalvan##69
step
turnin Ghost Hair Thread##149
step
accept Return the Comb##154
step
turnin Return the Comb##154
step
accept Deliver the Thread##157
step
If it is in stock - and you dont have one yet-: Buy a Bronzetube at [G78,48.3Duskwood]. If you dont get it here, we will buy it on the auctionhouse now.
step
fpath Stormwind City
step
turnin The Legend of Stalvan##69
step
accept The Legend of Stalvan##70
step
Go upstairs and loot the Box.
step
Buy at the auction house now: 1 Bronze tube. Gooey Spider Legs (you need 6 total), 5 Great Goretuks Snout, 5 Tough Condor Meat, 5 Crisp Spider Meat and 8 Murloc Fin.
step
Get your level 22 spells at your trainer
step
turnin The Legend of Stalvan##70
step
accept The Legend of Stalvan##72
step
turnin The Legend of Stalvan##72
step
accept The Legend of Stalvan##74
step
The next guide is 23-24 Redridge Mountains. There is another 23-24 guide if you want to do stockades(what I would suggest doing now).
]]
)
