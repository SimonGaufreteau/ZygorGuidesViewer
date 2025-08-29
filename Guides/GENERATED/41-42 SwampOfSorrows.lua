local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\41-42 SwampOfSorrows',
  [[
author TUGs
next GENERATED\\42-43STV
startlevel 41
step
fpath Stormwind City
step
accept In Search of The Temple##1448
step
accept Vital Supplies##1477
step
fpath Duskwood
step
turnin Vital Supplies##1477
step
accept Encroaching Wildlife##1396
step
Do: Dream Dust in the Swamp |q 1116
step
Do: Encroaching Wildlife |q 1396
step
turnin Encroaching Wildlife##1396
step
accept The Lost Caravan##1421
step
Kill Noboru the Cudgel to get Noboru's Cudgel. This is a grey item,but if you rightclick it, it starts a quest. Its only an OPTIONAL quest though
step
accept Noboru the Cudgel##1392
step
turnin Noboru the Cudgel##1392
step
accept Draenethyst Crystals##1389
step
Do: Draenethyst Crystals |q 1389
step
Do: Ongeku |q 1373
step
Do: The Lost Caravan |q 1421
step
accept Galen's Escape##1393
step
Do: Galen's Escape |q 1393
step
turnin Galen's Escape##1393
step
turnin Draenethyst Crystals##1389
step
turnin The Lost Caravan##1421
step
accept Driftwood##1398
step
Run to 56.2,76.6 |goto Swamp of Sorrows 56.2,76.6
step
Do: Driftwood |q 1398
step
After done with the wood, farm 3-4 bars on the murlocs
step
turnin Driftwood##1398
step
accept Deliver the Shipment##1425
step
turnin Deliver the Shipment##1425
step
fpath Stranglethorn Vale
step
home Stranglethorn Vale
step
turnin Dream Dust in the Swamp##1116
step
accept Rumors for Kravel##1117
step
Take the Boat to Ratchet
step
fpath Desolace
step
accept Down the Scarlet Path##261
step
accept Ghost-o-plasm Round Up##6134
step
turnin Ongeku##1373
step
accept Khan Jehn##1374
step
Do: Down the Scarlet Path |q 261
step
Do: Ghost-o-plasm Round Up |q 6134
step
Grind on the skeletons untill youre [XP42]
step
Do: Khan Jehn |q 1374
step
turnin Khan Jehn##1374
step
accept Khan Hratha##1380
step
Do: Khan Hratha |q 1380
step
turnin Khan Hratha##1380
step
turnin Ghost-o-plasm Round Up##6134
step
turnin Down the Scarlet Path##261
step
use Hearthstone##6948
]]
)
