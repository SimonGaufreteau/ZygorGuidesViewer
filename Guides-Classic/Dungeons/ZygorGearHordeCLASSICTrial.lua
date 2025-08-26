local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("HGear") then return end
if not ZygorGuidesViewer.ItemScore then return end
ZygorGuidesViewer.ItemScore.Items["Classic Dungeons\\Ragefire"] = {
dungeonmap=2437, normal=1,
{ boss="11520", name="Taragaman the Hungerer",
ALL={
14149,
14148,
14145,
},
},
{ boss="11518", name="Jergosh the Invoker",
ALL={
14150,
14147,
14151,
},
},
}
