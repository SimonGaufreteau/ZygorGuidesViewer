local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\53-53Winterspring',
  [[
author TUGs
next GENERATED\\55-55BS
startlevel 53
step
fpath Winterspring
step
Do: Threat of the Winterfall |q 5082
step
Do: Winterfall Activity |q 6241
step
Farm on the furbolgs to the north till [XP54]
step
Do: Threat of the Winterfall |q 5082
step
Do: Winterfall Activity |q 6241
step
Do: Threat of the Winterfall |q 5082
step
accept Winterfall Firewater##5083
step
turnin Threat of the Winterfall##5082
step
turnin Winterfall Firewater##5083
step
turnin The New Springs##980
step
accept Falling to Corruption##5084
step
accept Strange Sources##4842
step
Do: Moontouched Wildkin |q 978
step
turnin Winterfall Activity##6241
step
turnin Falling to Corruption##5084
step
accept Mystery Goo##5085
step
Do: Silver Heart |q 4084
step
turnin Silver Heart##4084
step
use Hearthstone##6948
step
fpath Ruth'Theran
step
turnin Moontouched Wildkin##978
step
accept Find Ranshalla##979
step
fpath Winterspring
step
accept Enraged Wildkin##6604
step
turnin Starfall##5250
step
accept The Ruins of Kel'Theril##5244
step
turnin Enraged Wildkin##6604
step
turnin The Ruins of Kel'Theril##5244
step
accept Troubled Spirits of Kel'Theril##5245
step
accept Enraged Wildkin##4861
step
Do: Troubled Spirits of Kel'Theril |q 5245
step
Do: TODO: Add specific questparts |q 5245
step
Do: TODO: Add specific questparts |q 5245
step
Do: TODO: Add specific questparts |q 5245
step
turnin Mystery Goo##5085
step
turnin Enraged Wildkin##4861
step
accept Enraged Wildkin##4863
step
turnin Enraged Wildkin##4863
step
accept Enraged Wildkin##4864
step
Do: Enraged Wildkin |q 4864
step
Do: Enraged Wildkin |q 4864
step
turnin Find Ranshalla##979
step
accept Guardians of the Altar##4901
step
Do: Guardians of the Altar |q 4901
step
Run to 60,73.3 |goto Winterspring 60,73.3
step
turnin Enraged Wildkin##4864
step
turnin Strange Sources##4842
step
use Hearthstone##6948
step
fpath Ruth'Theran
step
turnin Guardians of the Altar##4901
step
accept Wildkin of Elune##4902
step
turnin Wildkin of Elune##4902
step
fpath Darkshore
step
Take the boat to Wetlands
step
fpath Ironforge
step
accept The Smoldering Ruins of Thaurissan##3702
step
Do: The Smoldering Ruins of Thaurissan |q 3702
step
turnin The Smoldering Ruins of Thaurissan##3702
step
accept The Smoldering Ruins of Thaurissan##3701
step
fpath Redridge
]]
)
