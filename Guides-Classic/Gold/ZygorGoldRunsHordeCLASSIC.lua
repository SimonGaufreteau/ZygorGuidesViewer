local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("GoldRunsH") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
