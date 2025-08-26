local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("AGear") then return end
if not ZygorGuidesViewer.ItemScore then return end
ZygorGuidesViewer.ItemScore.Items["Classic Dungeons\\TheStockade"] = {
dungeonmap=717, normal=1,
{ boss="1666", name="Kam Deepfury",
ALL={
2280,
},
},
{ boss="1720", name="Bruegal Ironknuckle",
ALL={
3228,
2941,
2942,
},
},
}
