local name,ZGV=...
ZGV.revision = tonumber(string.sub("$Revision: 34309 $", 12, -3))
ZGV.version = C_AddOns.GetAddOnMetadata(name,"version") .. "." .. ZGV.revision
ZGV.date = string.sub("$Date: $WCDATE$ $", 8, 17)
--$WCNOW$

