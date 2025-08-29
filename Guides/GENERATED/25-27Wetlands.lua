local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\25-27Wetlands',
  [[
author TUGs
next GENERATED\\27-28Duskwood
startlevel 25
step
Buy: [CI2594,1 Flagon of Dwarven Honeymead] from Innkeeper Helbrek
step
turnin The Absent Minded Prospector##942
step
accept The Absent Minded Prospector##943
step
accept The Third Fleet##288
step
turnin The Third Fleet##288
step
accept The Cursed Crew##289
step
accept The Greenwarden##463
step
accept Claws from the Deep##279
step
accept Young Crocolisk Skins##484
step
accept War Banners##464
step
accept Digging Through the Ooze##470
step
accept In Search of The Excavation Team##305
step
Kill Young Crocolisks from now on for their skin.
step
Do: Claws from the Deep |q 279
step
Run to 34.1, 40.8 |goto Wetlands 34.1, 40.8
step
accept Ormer's Revenge##294
step
turnin In Search of The Excavation Team##305
step
accept In Search of The Excavation Team##306
step
Do: The Absent Minded Prospector |q 943,2
step
accept Uncovering the Past##299
step
Do [QC294- ][QC484]
step
Grind until level26
|ding 26
step
turnin Ormer's Revenge##294
step
accept Ormer's Revenge##295
step
Do [QC295- ][QC299]
step
turnin Ormer's Revenge##295
step
accept Ormer's Revenge##296
step
turnin Uncovering the Past##299
step
Run to 31.99,48.68 |goto Wetlands 31.99,48.68
step
Run to 31.15,49.05 |goto Wetlands 31.15,49.05
step
Run to 32.41,50.92 |goto Wetlands 32.41,50.92
step
Do: Ormer's Revenge |q 296
step
turnin Ormer's Revenge##296
step
Do: The Absent Minded Prospector |q 943
step
Do: War Banners |q 464
step
accept Daily Delivery##469
step
turnin The Greenwarden##463
step
accept Tramping Paws##276
step
Do: Tramping Paws |q 276
step
turnin Tramping Paws##276
step
accept Fire Taboo##277
step
Do: Fire Taboo |q 277
step
Do: Digging Through the Ooze |q 470
step
Grind the slimes till youre level[XP26+34000]
step
turnin Fire Taboo##277
step
use Hearthstone##6948
step
turnin The Absent Minded Prospector##943
step
turnin Claws from the Deep##279
step
accept Reclaiming Goods##281
step
turnin Daily Delivery##469
step
turnin Young Crocolisk Skins##484
step
accept Apprentice's Duties##471
step
turnin War Banners##464
step
accept Nek'rosh's Gambit##465
step
turnin Digging Through the Ooze##470
step
turnin In Search of The Excavation Team##306
step
turnin Reclaiming Goods##281
step
accept The Search Continues##284
step
turnin The Search Continues##284
step
accept Search More Hovels##285
step
turnin Search More Hovels##285
step
accept Return the Statuette##286
step
Do: The Cursed Crew |q 289
step
Do: Apprentice's Duties |q 471
step
turnin Apprentice's Duties##471
step
turnin Return the Statuette##286
step
turnin The Cursed Crew##289
]]
)
