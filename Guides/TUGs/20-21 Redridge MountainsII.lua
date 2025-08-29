local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\20-21 Redridge MountainsII',
  [[
	author TUGs
	next TUGs\\21-23 Ashenvale
	startlevel 20
step //1
..accept The Corruption Abroad##3765
step //2
TODO: WL Quest here
step //3
..fpath Stormwind City
only Nightelf,Gnome,Dwarf
step //4
'Fly to: Redridge Mountains
step //5
.kill 10 Redridge Mongrel|q 246/1
.kill 6 Redridge Poacher|q 246/2
step //6
..turnin Assessing the Threat##246
step //7
..accept Blackrock Menace##20
step //8
..turnin Return to Verner##119
step //9
..accept A Baying of Gnolls##124
step //10
..turnin Messenger to Stormwind##121
step //11
..accept Messenger to Westfall##143
step //12
..accept Selling Fish##127
step //13
..turnin Visit the Herbalist##130
step //14
..accept Delivering Daffodils##131
step //15
..turnin Delivering Daffodils##131
step //16
.get 1 Oslow's Toolbox|q 125/1
step //17
.get 10 Spotted Sunfish|q 127/1
step //18
.get 10 Battleworn Axe|q 20/1
step //19
ding 21
step //20
..turnin Blackrock Menace##20
step //21
..turnin The Lost Tools##125
step //22
..accept The Everstill Bridge##89
step //23
.kill 10 Redridge Brute|q 124/1
.kill 8 Redridge Mystic|q 124/2
.get 5 Iron Pike|q 89/1
.get 5 Iron Rivet|q 89/2
step //24
..turnin The Everstill Bridge##89
step //25
..turnin A Baying of Gnolls##124
step //26
..turnin Selling Fish##127
step //27
use Hearthstone##6948
]]
)
ZygorGuidesViewer:RegisterGuide(
  'TUGs\\Darkshore 11-15',
  [[

]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
