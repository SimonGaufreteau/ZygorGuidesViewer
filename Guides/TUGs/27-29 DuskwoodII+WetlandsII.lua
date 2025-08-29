local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\27-29 DuskwoodII+WetlandsII',
  [[
	author TUGs
	next TUGs\\29-30 AshenvaleII
	startlevel 27
step //1
TODO: Add Locations for Wetlands Custom Quests.
step //2
..accept Worgen in the Woods##173
step //3
..turnin The Shadowy Figure##262
step //4
..accept The Shadowy Search Continues##265
step //5
..turnin The Night Watch##57
step //6
..accept The Night Watch##58
step //7
..accept The Legend of Stalvan##98
step //8
..turnin The Shadowy Search Continues##265
step //9
..accept Inquire at the Inn##266
step //10
..turnin Inquire at the Inn##266
step //11
..accept Finding the Shadowy Figure##453
step //12
..turnin Zombie Juice##158
step //13
..accept Gather Rot Blossom##156
step //14
.get 1 Tear of Tilloa|q 335/1
step //15

step //16
..turnin Worgen in the Woods##173
step //17
..turnin Life in Death##26314
step //18
..accept Life in Death##26314
step //19
.get 8 Rot Blossom|q 156/1
step //20
..turnin Gather Rot Blossoms##156
step //21
..accept Juice Delivery##159
step //22
..accept The Cursed Crew##289
step //23
..accept Golem Gyroscope##26279
step //24
..accept War Banners##464
step //25
..accept Don't Kill The Messenger##26284
step //26
..turnin Reclaiming Goods##281
step //27
..accept The Search Continues##284
step //28
..turnin The Search Continues##284
step //29
..accept Search More Hovels##285
step //30
..turnin Search More Hovels##285
step //31
..accept Return the Statuette##286
step //32
ding 28
step //33
.kill 13 Cursed Sailor|q 289/1
.kill 5 Cursed Marine|q 289/2
.get 1 Snellig's Snuffbox|q 289/3
step //34
.get 6 Giant Crocolisk Skin|q 471/1
step //35
.kill 12 Fen Creeper|q 275/1
step //36
goal Burndural messenger Healed|q 26284/1
step //37
.get 8 Dragonmaw War Banner|q 464/1
step //38
..turnin Golem Gyroscope##26279
step //39
..accept Golem Gyroscope##26280
step //40
.get 2 Gyroscope|q 26280/1
step //41
..turnin Golem Gyroscope##26280
step //42
..accept Golem Gyroscope##26281
step //43
goal Fix the Golem at Angus' Farm.|q 26281/1
step //44
..turnin Golem Gyroscope##26281
step //45
..turnin Apprentice's Duty##471
step //46
..turnin Return the Statuette##286
step //47
..turnin The Cursed Crew##289
step //48
..accept The Cursed Crew##290
step //49
..turnin Don't Kill The Messenger##26284
step //50
..turnin War Banners##464
step //51
..accept Gujek's Gambit##465
step //52
..turnin The Cursed Crew##290
step //53
..accept The Eye of Paleth##292
step //54
..turnin Gujek's Gambit##465
step //55
..turnin Blisters on The Land##275
step //56
The next quest might kill you once,run in crowd control the 2 elites and turn in the quest and run away immediately. (You need to interact with the corpse downstairs)
step //57
..accept The Thandol Span##631
step //58
..turnin The Thandol Span##631
step //59
..accept The Thandol Span##632
step //60
..turnin The Thandol Span##632
step //61
..accept The Thandol Span##633
step //62
Jump off the Bridge to go to [G44.3,92.9Arathi Highlands] and collect the Letter next to the dwarf
step //63
..accept ##637
step //64
goal Cache of Explosives Destroyed|q 633/1
step //65
..turnin ##633
step //66
..accept ##634
step //67
..turnin ##634
step //68
use Hearthstone##6948
step //69
..turnin The Eye of Paleth##292
step //70
..accept Cleansing the Eye##293
step //71
Take the boat to Auberdine, fly to Astranaar
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
