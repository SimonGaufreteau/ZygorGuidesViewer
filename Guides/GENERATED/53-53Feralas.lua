local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end
ZygorGuidesViewer:RegisterGuide(
  'GENERATED\\53-53Feralas',
  [[
author TUGs
next GENERATED\\53-53Winterspring
startlevel 53
step
fpath Feralas
step
accept Improved Quality##7733
step
accept The Stave of Equinex##2879
step
turnin Return to Troyas##2943
step
turnin A Visit to Gregan##4142
step
accept The Giant Guardian##2844
step
Do: The Videre Elixir |q 3909
step
You can actually trick-jump in the back.
step
Do: The Stave of Equinex |q 2879
step
Do: The Stave of Equinex |q 2879
step
turnin The Giant Guardian##2844
step
The follow quest is a really annoying escort, I skip it usually.
step
Do: The Stave of Equinex |q 2879
step
Use the Stave in your Inventory
step
turnin The Stave of Equinex##2879
step
accept The Morrow Stone##2942
step
turnin The Videre Elixir##3909
step
Do: Improved Quality |q 7733
step
turnin Improved Quality##7733
step
If you found [Pristine Yeti Hide] on the yeti quest, Accept it now.
step
turnin Pristine Yeti Hide##7735
step
turnin The Morrow Stone##2942
step
use Hearthstone##6948
step
turnin Cleansing Felwood##4101
step
turnin Collection of the Corrupt Water##5157
step
accept Seeking Spiritual Aid##5158
step
turnin Flute of Xavaric##939
step
accept Felbound Ancients##4441
step
turnin Further Corruption##4906
step
turnin Verifying the Corruption##5156
step
turnin The Videre Elixir##3909
step
accept Meet at the Grave##3912
step
turnin Trouble in Winterspring!##6603
step
accept Threat of the Winterfall##5082
step
Farm on the furbolgs to the north till [XP53]
step
accept Duke Nicholas Zverenhoff##6030
step
accept The Everlook Report##6028
step
fpath Ratchet
step
accept Volcanic Activity##4502
step
turnin Seeking Spiritual Aid##5158
step
accept Cleansed Water Returns to Felwood##5159
step
fpath Tanaris
step
turnin March of the Silithid##4493
step
At [G 53.9,29.1Tanaris] use your Videre Elixir and STAY DEAD!!!
step
turnin Meet at the Grave##3912
step
accept A Grave Situation##3913
step
resurrect
step
turnin A Grave Situation##3913
step
accept Linken's Sword##3914
step
accept Super Sticky##4504
step
accept Bungle in the Jungle##4496
step
fpath Un'Goro
step
turnin Linken's Sword##3914
step
accept A Gnome's Assistance##3941
step
turnin A Gnome's Assistance##3941
step
accept Linken's Memory##3942
step
accept Lost!##4492
step
accept Chasing A-Me 01##4243
step
Do: Super Sticky |q 4504
step
accept Finding the Source##974
step
Do: Volcanic Activity |q 4502
step
Do: Finding the Source |q 974
step
Do: Bungle in the Jungle |q 4496
step
accept The Mighty U'cha##4301
step
turnin Finding the Source##974
step
accept The New Springs##980
step
ESCORTQUEST INC! (make sure all people turn in before accepting)
step
turnin Lost!##4492
step
accept A Little Help From My Friends##4491
step
turnin A Little Help From My Friends##4491
step
turnin Chasing A-Me 01##4243
step
accept Chasing A-Me 01##4244
step
turnin Chasing A-Me 01##4244
step
Do: The Mighty U'cha |q 4301
step
accept Chasing A-Me 01##4245
step
turnin Chasing A-Me 01##4245
step
turnin The Mighty U'cha##4301
step
fpath Tanaris
step
turnin Super Sticky##4504
step
turnin Bungle in the Jungle##4496
step
fpath Ratchet
step
turnin Volcanic Activity##4502
step
use Hearthstone##6948
step
fpath Darkshore
step
home Darkshore
step
fpath Ruth'Theran
step
accept Moontouched Wildkin##978
step
Do: Felbound Ancients |q 4441
step
fpath Ashenvale
step
turnin Cleansed Water Returns to Felwood##5159
step
turnin Felbound Ancients##4441
step
turnin Further Corruption##4906
step
turnin Linken's Memory##3942
step
accept Silver Heart##4084
step
accept Purified!##4442
step
turnin Purified!##4442
step
Run to 62.5,24.2 |goto Felwood 62.5,24.2
]]
)
