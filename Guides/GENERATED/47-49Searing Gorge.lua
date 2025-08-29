local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\47-49Searing Gorge',
  [[
author TUGs
next GENERATED\\49-51Un_Goro
startlevel 47
step
[O] You will get Fiery Blaze Enchantments along this quest usually,if not, abandon it.
step
Do (Optional): Tremors of the Earth
step
accept Caught!##4449
step
Do: Caught! |q 4449
step
[O]Allthough this is optional,I highly recommend doing this,great XP! Kill Margol the Rager at [G 73.2,76.6]
step
accept The Horn of the Beast##3181
step
turnin Caught!##4449
step
accept Ledger from Tanaris##4450
step
Do: Ledger from Tanaris |q 4450,1
step
accept Suntara Stones##3367
step
Do: Suntara Stones |q 3367
step
turnin Suntara Stones##3367
step
accept Suntara Stones##3368
step
Do: Ledger from Tanaris |q 4450,2
step
accept Divine Retribution##3441
step
turnin Divine Retribution##3441
step
accept The Flawless Flame##3442
step
accept STOLEN: Smithing Tuyere and Lookout's Spyglass##7728
step
accept JOB OPPORTUNITY: Culling the Competition##7729
step
accept Curse These Fat Fingers##7723
step
accept Fiery Menace!##7724
step
accept Incendosaurs? Whateverosaur is More Like It##7727
step
accept What the Flux?##7722
step
This Part is different for groups/solo: Send one person(in solo thats you of course) using his Hearthstone and follow the next steps, the rest of the group starts collecting the Golem Oil and heart of Flame, once someone is done with it (Loot: Free for all helps!) he does the same steps as following
step
use Hearthstone##6948
step
turnin The Horn of the Beast##3181
step
accept Proof of Deed##3182
step
turnin Proof of Deed##3182
step
turnin Suntara Stones##3368
step
accept At Last!##3201
step
accept Dwarven Justice##3371
step
fpath Loch Modan
step
turnin At Last!##3201
step
Do: The Flawless Flame |q 3442
step
turnin The Flawless Flame##3442
step
accept Forging the Shaft##3443
step
Do: STOLEN: Smithing Tuyere and Lookout's Spyglass |q 7728
step
Do: JOB OPPORTUNITY: Culling the Competition |q 7729
step
Do: Curse These Fat Fingers |q 7723
step
Do: Fiery Menace! |q 7724
step
Do: Incendosaurs? Whateverosaur is More Like It |q 7727
step
Grind on the dinosaurs till [XP48]
step
Do (Optional): WANTED: Overseer Maltorius
step
Do: What the Flux? |q 7722
step
Do: Forging the Shaft |q 3443
step
turnin Dwarven Justice##3371
step
turnin Forging the Shaft##3443
step
accept The Flame's Casing##3452
step
Do (Optional): Release Them
step
Do (Optional): The Flame's Casing
step
Do (Optional): Prayer to Elune
step
turnin Curse These Fat Fingers##7723
step
turnin Fiery Menace!##7724
step
turnin Incendosaurs? Whateverosaur is More Like It##7727
step
turnin STOLEN: Smithing Tuyere and Lookout's Spyglass##7728
step
turnin JOB OPPORTUNITY: Culling the Competition##7729
step
turnin What the Flux?##7722
step
accept The Torch of Retribution##3453
step
turnin The Torch of Retribution##3453
step
accept The Torch of Retribution##3454
step
Do: The Torch of Retribution |q 3454
step
turnin The Torch of Retribution##3454
step
accept Squire Maltrake##3462
step
turnin Squire Maltrake##3462
step
accept Set Them Ablaze!##3463
step
Do: Set Them Ablaze! |q 3463
step
Do: TDO:Figure out order or Towers |q 3463
step
Do: TDO:Figure out order or Towers |q 3463
step
Do: TDO:Figure out order or Towers |q 3463
step
turnin Release Them##3372
step
accept Rise, Obsidion!##3566
step
Do: Rise, Obsidion! |q 3566
step
turnin Set Them Ablaze!##3463
step
accept Trinkets...##3481
step
turnin Trinkets...##3481
step
If youre not doing brd, fly to Ironforge and skip to Set hearthstone to Ironforge.
step
Inventory time (sell it all) Were going into BRD soon
step
Run to 48.5,63.8 |goto Searing Gorge 48.5,63.8
step
Die in the lava, no seriously, DIE! There is a quest that you can only obtain whilst dead!
step
Run back to the Blackrock go into the middle part of it.
step
accept Dark Iron Legacy##3801
step
turnin Dark Iron Legacy##3801
step
accept Dark Iron Legacy##3802
step
Get your corpse back
step
Grind until level52
|ding 52
step
Do: Dark Iron Legacy |q 3802
step
turnin Dark Iron Legacy##3802
step
fpath Ironforge
step
turnin Rise, Obsidion!##3566
step
accept Portents of Uldum##2963
step
turnin Portents of Uldum##2963
step
accept Seeing What Happens##2946
step
Buy a Mithril Casing if available
step
home Ironforge
step
fpath Blasted Lands
step
turnin Thadius Grimshade##2990
step
LVL 50 YET? Accept Ragnar Thunderbrew
step
Start Cortellos riddle from the Scroll you got in STV
step
accept Cortello's Riddle##624
step
turnin Cortello's Riddle##624
step
accept Cortello's Riddle##625
step
Do: Ledger from Tanaris |q 4450,4
step
fpath Stranglethorn Vale
step
turnin Rescue OOX-17/TN!##648
step
turnin Rescue OOX-09/HL!##836
step
turnin Rescue OOX-22/FE!##2767
step
turnin An OOX of Your Own##3721
step
If you got [Carefully Folded Note] earlier, start it now,if not get it now and start it
step
Farm on the cats untill [XP49]
step
Take the boat to Ratchet
step
Do: The Stone Circle |q 3444
step
fpath Dustwallow Marsh
step
turnin Cortello's Riddle##625
step
accept Cortello's Riddle##626
step
Do: Ledger from Tanaris |q 4450,3
step
fpath Tanaris
step
turnin Ledger from Tanaris##4450
step
turnin Sprinkle's Secret Ingredient##2641
step
accept Delivery for Marin##2661
step
turnin Delivery for Marin##2661
step
accept Noggenfogger Elixir##2662
step
turnin Noggenfogger Elixir##2662
step
turnin Safety First##1189
step
turnin Zanzil's Mixture and a Fool's Stout##1119
step
accept Get the Gnomes Drunk##1120
step
turnin Get the Gnomes Drunk##1120
step
turnin The Stone Circle##3444
step
accept The Stone Watcher##2954
step
turnin The Stone Watcher##2954
step
Run to 27.1,56.9 |goto Tanaris 27.1,56.9
]]
)
