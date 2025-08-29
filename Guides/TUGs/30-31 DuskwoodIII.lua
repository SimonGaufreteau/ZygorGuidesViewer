local ZygorGuidesViewer = ZygorGuidesViewer
if not ZygorGuidesViewer then
  return
end
--TRIAL if ZygorGuidesViewer.AllianceInstalled then return end
if UnitFactionGroup('player') ~= 'Alliance' then
  return
end

ZygorGuidesViewer:RegisterGuide(
  'TUGs\\30-31 DuskwoodIII',
  [[
	author TUGs
	next TUGs\\31-32 Hillsbrad Foothills
	startlevel 30
step //1
'Fly to: Duskwood
step //2
..accept Look To The Stars##181
step //3
..turnin The Missing Diplomat##1243
step //4
..accept The Missing Diplomat##1244
step //5
.get 1 Mistmantle Family Ring|q 98/1
step //6
..turnin The Legend of Stalvan##98
step //7
..accept Worgen in the Woods##221
step //8
.kill 12 Nightbane Dark Runner|q 221/1
step //9
..turnin Worgen in the Woods##221
step //10
..accept Worgen in the Woods##222
step //11
.kill 8 Nightbane Vile Fang|q 222/1
.kill 8 Nightbane Tainted One|q 222/2
step //12
XXXX 1
step //13
..turnin Juice Delivery##159
step //14
..accept Ghoulish Effigy##133
step //15
.kill 20 Plague Spreader|q 58/1
.get 7 Ghoul Rib|q 133/1
.get 10 Ghoul Fang|q 101/1
step //16
..turnin Ghoulish Effigy##133
step //17
..accept Ogre Thieves##134
step //18
XXXX 1
step //19
.get 1 Ogre's Monocle|q 181/1
step //20
.get 1 Defias Docket|q 1244/1
step //21
..turnin Finding the Shadowy Figure##453
step //22
..accept Return to Sven##268
step //23
..turnin Return to Sven##268
step //24
..accept Proving Your Worth##323
step //25
XXXX Kill Stuff
step //26
..turnin Proving Your Worth##323
step //27
..accept Seeking Wisdom##269
step //28
..accept The Weathered Grave##225
step //29
..turnin Ogre Thieves##134
step //30
ding 31
step //31
..accept Note to the Mayor##160
step //32
goto Westfall,
step //33
'Fly to: Duskwood
step //34
..turnin Look To The Stars##181
step //35
..turnin The Totem of Infliction##101
step //36
..turnin The Night Watch##58
step //37
..turnin The Weathered Grave##225
step //38
..accept Morgan Ladimore##227
step //39
..turnin Note to the Mayor##160
step //40
..accept Translate Abercrombie's Note##251
step //41
..turnin Translate Abercrombie's Note##251
step //42
..accept Wait for Sirra to Finish##401
step //43
..turnin Wait for Sirra to Finish##401
step //44
..accept Translation to Ello##252
step //45
..turnin Translation to Ello##252
step //46
..turnin Morgan Ladimore##227
step //47
..turnin Worgen in the Woods##222
step //48
..accept Worgen in the Woods##223
step //49
..turnin Worgen in the Woods##223
step //50
..turnin Life in Death##26314
step //51
..turnin The Missing Diplomat##1244
step //52
..accept The Missing Diplomat##1245
]]
)

--TRIAL ZygorGuidesViewer:RegisterGuide("Zygor's Alliance Leveling Guides\\Main Guide (13-20)",[[
--TRIAL 	author support@zygorguides.com
--TRIAL 	step //1
--TRIAL 		' Thank you for trying the Zygor Guides Version 2.0 Leveling Guides Demo.  Please visit ZygorGuides.com to purchase the complete in-game Version 2.0 leveling guides.  Take care
--TRIAL 		level 13
--TRIAL ]])
ZygorGuidesViewer.AllianceInstalled = true --!TRIAL
