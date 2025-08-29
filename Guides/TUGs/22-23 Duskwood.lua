local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\22-23 Duskwood',
  [[
	author TUGs
	next TUGs\\23-24 Stockades
	startlevel 22
step //1
use Hearthstone##6948
step //2
'Buy 1Stormwind Seasoning Herbs at Stormwind City|goto Stormwind City,69,72
step //3
'Buy 1Red Rose at Stormwind City|goto Stormwind City,69,72
step //4
'Learn your spells at your trainer
step //5
'Fly to: Redridge Mountains
step //6
Run to Duskwood
step //7
..accept The Legend of Stalvan##66
step //8
..accept The Totem of Infliction##101
step //9
..fpath Duskwood
step //10
If it is in stock - and you dont have one yet-: Buy a Bronzetube at [G78,48.3Duskwood]
step //11
If you dont have the bronzetube yet, skip the Look to the stars-quest. Youll get a last chance soon.
step //12
..accept Look To The Stars##174
step //13
..turnin Look To The Stars##174
step //14
..accept Look To The Stars##175
step //15
..accept Raven Hill##163
step //16
..accept Deliveries to Sven##164
step //17
..accept The Hermit##165
step //18
..accept The Night Watch##56
step //19
..turnin The Legend of Stalvan##66
step //20
..accept The Legend of Stalvan##67
step //21
goto Duskwood,78,52
step //22
..accept Life in Death##26313
step //23
Kill as many spiders as possible for the venom and collect as many flowers for Life In Death, you dont need to focus on the skeleton fingers, you will get plenty. You do NOT need to finish ANY of the 3 mentioned quests.
step //24
..turnin Look To The Stars##175
step //25
..accept Look To The Stars##177
step //26
.get Mary's Looking Glass|q 177/1
.kill 8 Skeletal Warrior|q 56/1
.kill 6 Skeletal Mage|q 56/2
step //27
..turnin Look To The Stars##177
step //28
..turnin The Night Watch##56
step //29
..accept The Night Watch##57
step //30
goto Duskwood,
step //31
..accept Until Death Do Us Part##26320
step //32
goto Stranglethorn Vale,36,4
step //33
..accept Eight-Legged Menaces##245
step //34
goto Stranglethorn Vale,38,4
'Get the Flightpath
step //35
..turnin Raven Hill##163
step //36
..accept Jitters' Growling Gut##5
step //37
..turnin Deliveries to Sven##164
step //38
..accept Sven's Revenge##95
step //39
..accept Wolves at Our Heels##226
step //40
KEEP your Gooey Spider Legs and 10 Lean Wolf Flanks.Whilst grinding east for the spider and wolf quests do the next 2steps (TurnIn The Hermit and Accept Supplies from Darkshire)
step //41
.kill 12 Starving Dire Wolf|q 226/1
.kill 8 Rabid Dire Wolf|q 226/2
.kill 15 Pygmy Venom Web Spider|q 245/1
.get 10 Glistening Spider Silk|q 26320/1
.get 7 Pristine Pearl|q 26320/2
.get 8 Brightwood Bloom|q 26313/1
'Get 6 Gooey Spider Legs
step //42
..turnin The Hermit##165
step //43
..accept Supplies from Darkshire##148
step //44
..turnin Wolves at Our Heels##226
step //45
..turnin The Legend of Stalvan##67
step //46
..accept The Legend of Stalvan##68
step //47
..turnin Messenger to Westfall##143
step //48
..accept Messenger to Westfall##144
step //49
'Fly to: Duskwood
step //50
..turnin Supplies from Darkshire##148
step //51
..accept Ghost Hair Thread##149
step //52
..turnin Jitters' Growling Gut##5
step //53
..accept Dusky Crab Cakes##93
step //54
..turnin The Legend of Stalvan##68
step //55
..accept The Legend of Stalvan##69
step //56
..turnin Until Death Do Us Part##26320
step //57
..accept Until Death Do Us Part##26321
step //58
..turnin Until Death Do Us Part##26321
step //59
..accept Until Death Do Us Part##26322
step //60
goal Place the letter to Faye in her home.|q 26322/1
step //61
..turnin Until Death Do Us Part##26322
step //62
..accept Until Death Do Us Part##26323
step //63
goal Wait for Faye to arrive.|q 26323/1
step //64
..turnin Until Death Do Us Part##26323
step //65
..accept Until Death Do Us Part##26324
step //66
goal Put Jack Archer out of his misery.|q 26324/1
.get Jacks Finished Necklace|q 26324/2
step //67
..turnin Until Death Do Us Part##26324
step //68
..turnin Life in Death##26313
step //69
..accept Life in Death##26314
step //70
..turnin Ghost Hair Thread##149
step //71
..accept Return the Comb##154
step //72
..turnin Return the Comb##154
step //73
..accept Deliver the Thread##157
step //74
If it is in stock - and you dont have one yet-: Buy a Bronzetube at [G78,48.3Duskwood]. If you dont get it here, we will buy it on the auctionhouse now.
step //75
use Hearthstone##6948
step //76
..turnin The Legend of Stalvan##69
step //77
..accept The Legend of Stalvan##70
step //78
Go upstairs and loot the Box.
step //79
Buy at the auction house now: 1 Bronze tube, 5 Great Goretuks Snout, 5 Tough Condor Meat, 5 Crisp Spider Meat and 8 Murloc Fin.
step //80
'Buy 1Bronze Tube at the auction house.
step //81
'Buy 8Murloc Fin at the auction house.
step //82
'Buy 5Great Goretusk Snout at the auction house.
step //83
'Buy 5Tough Condor Meat at the auction house.
step //84
'Buy 5Crisp Spider Meat at the auction house.
step //85
..turnin The Legend of Stalvan##70
step //86
..accept The Legend of Stalvan##72
step //87
..turnin The Legend of Stalvan##72
step //88
..accept The Legend of Stalvan##74
step //89
The next guide will include stockades and the Elite quests in Redridge. If you are not going to do theses quests, skip to: 23-24 Redridge.
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
