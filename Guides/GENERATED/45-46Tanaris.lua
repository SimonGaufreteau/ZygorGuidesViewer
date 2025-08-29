local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\45-46Tanaris',
  [[
author TUGs
next GENERATED\\46-47Hinterlands
startlevel 45
step
accept Favored of Elune?##3661
step
accept Feralas: A History##2940
step
accept The Borrower##2941
step
use Hearthstone##6948
step
fpath Tanaris
step
accept The Super Snapper FX##2944
step
accept Gadgetzan Water Survey##992
step
Do: Gadgetzan Water Survey |q 992
step
Grind until level48
|ding 48
step
use Hearthstone##6948
step
accept The Sunken Temple##3445
step
fpath Tanaris
step
accept The Thirsty Goblin##2605
step
accept The Dunemaul Compound##5863
step
accept Thistleshrub Valley##3362
step
turnin Gadgetzan Water Survey##992
step
accept Noxious Lair Investigation##82
step
turnin The Sunken Temple##3445
step
accept The Stone Circle##3444
step
accept Gahz'ridian##3161
step
Do: The Dunemaul Compound |q 5863
step
Do: Noxious Lair Investigation |q 82
step
Do: Gahz'ridian |q 3161
step
Do: The Thirsty Goblin |q 2605
step
Do: Thistleshrub Valley |q 3362
step
You should have found the chicken beacon quest by now
step
accept Find OOX-17/TN!##351
step
accept Tooga's Quest##1560
step
Escort quest inv,if youre in a group, dont accept the follow before everyone has turned in!
step
turnin Find OOX-17/TN!##351
step
accept Rescue OOX-17/TN!##648
step
Do: Rescue OOX-17/TN! |q 648
step
turnin Tooga's Quest##1560
step
turnin The Dunemaul Compound##5863
step
turnin The Thirsty Goblin##2605
step
accept In Good Taste##2606
step
turnin In Good Taste##2606
step
accept Sprinkle's Secret Ingredient##2641
step
turnin Noxious Lair Investigation##82
step
accept The Scrimshank Redemption##10
step
turnin Thistleshrub Valley##3362
step
turnin Gahz'ridian##3161
step
Run to 55,70 |goto Tanaris 55,70
step
Run to 54.2,72.9 |goto Tanaris 54.2,72.9
step
Run to 56.3,72.2 |goto Tanaris 56.3,72.2
step
Do: The Scrimshank Redemption |q 10
step
turnin The Scrimshank Redemption##10
step
accept Insect Part Analysis##110
step
turnin Insect Part Analysis##110
step
accept Insect Part Analysis##113
step
turnin Insect Part Analysis##113
step
accept Rise of the Silithid##162
step
fpath Duskwallow Marsh
step
Take the Boat to Wetlands
step
fpath Stormwind City
step
turnin In Search of The Temple##1448
step
accept To The Hinterlands##1449
step
fpath Hillsbrad Foothills
]]
)
