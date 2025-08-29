local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\10-11 DunMorogh+Loch',
  [[
	author TUGs
	next TUGs\\11-15 Darkshore
	startlevel 10
step //1
..accept Protecting the Herd##314
step //2
.get Fang of Vagash|q 314/1
step //3
..turnin Protecting the Herd##314
step //4
..accept Ore for Gumnal##26174
step //5
..accept The Public Servant##433
step //6
..accept Those Blasted Troggs!##432
step //7
.get 10 Rockjaw Beads|q 433/1
.kill 10 Rockjaw Bonesnapper|q 432/1
.kill 10 Rockjaw Skullthumper|q 432/2
.get 10 Kinetic Ore|q 26174/1
step //8
'Grind in the trogg cave till level9+4500xp.
step //9
..turnin The Public Servant##433
step //10
..turnin Those Blasted Troggs!##432
step //11
..accept Ore for Gumnal##26174
step //12
..accept The Lost Pilot##419
step //13
..turnin The Lost Pilot##419
step //14
..accept A Pilot's Revenge##417
step //15
.get Mangy Claw|q 417/1
step //16
..turnin A Pilot's Revenge##417
step //17
goto Dun Morogh,79,50
step //18
goto Dun Morogh,81,49
step //19
goto Dun Morogh,82,50
step //20
goto Dun Morogh,83,49
step //21
..accept In Defense of the King's Lands##224
step //22
..accept The Trogg Threat##267
step //23
..fpath Loch Modan
only Hunter
step //24
'Fly to: Ironforge
only Hunter
step //25
..accept ##6064
only Hunter
step //26

only Hunter
step //27
..turnin ##6064
only Hunter
step //28
..accept ##6084
only Hunter
step //29

only Hunter
step //30
..turnin ##6084
only Hunter
step //31
..accept ##6085
only Hunter
step //32

only Hunter
step //33
..turnin ##6085
only Hunter
step //34
..accept ##6086
only Hunter
step //35
[A Hunter]Tame a pet you like.I highly recommend a boar. Charge that deals more dmg and roots and as its a charge it can attack earlier->More aggro!
only Hunter
step //36
..turnin ##6086
only Hunter
step //37
[A Hunter]Feed your pet and [T] Train your own and your pets skills.
only Hunter
step //38
'Fly to: Loch Modan
only Hunter
step //39
.kill 10 Stonesplinter Trogg|q 224/1
.kill 10 Stonesplinter Scout|q 224/2
.get 8 Trogg Stone Tooth|q 267/1
step //40
..turnin In Defense of the King's Lands##224
step //41
..accept In Defense of the King's Lands##237
step //42
..turnin The Trogg Threat##267
step //43
..fpath Loch Modan
step //44
..accept Mountaineer Stormpike's Task##1339
step //45
..accept A Proper Sendoff##26331
step //46
..turnin Stormpike's Delivery##353
only Human
step //47
..turnin Mountaineer Stormpike's Task##1339
step //48
..accept Stormpike's Order##1338
step //49
..accept Filthy Paws##307
step //50
.get 4 Miners' Gear|q 307/1
step //51
.get Bhondur's Bones|q 26331/1
step //52
ding 12
step //53
'Buy 1Ironwood Maul or Heavy Spiked Mace at Nillen Andemar
only Warrior,Paladin
step //54
..turnin Filthy Paws##307
step //55
use Hearthstone##6948
step //56
..turnin Return to Lewis##6285
only Human
step //57
'Fly to: Stormwind City
only Human
step //58
'Learn your spells at your trainer
step //59
..turnin Stormpike's Order##1338
only Human
step //60
Take the ship to Darkshore
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
