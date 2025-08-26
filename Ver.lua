local name, ZGV = ...
ZGV.revision = tonumber(string.sub("$Revision: 34309 $", 12, -3))
ZGV.version = "2.0." .. ZygorGuidesViewer.revision
ZGV.date = string.sub("$Date: $WCDATE$ $", 8, 17)
--$WCNOW$
