local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("ReputationsACLASSIC") then return end
ZygorGuidesViewer.GuideMenuTier = "TRI"
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Bloodsail Buccaneers")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Brood of Nozdormu")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Cenarion Circle")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Gelkis & Magram Centaur Clans")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Hydraxian Waterlords")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Ravenholdt")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Steamwheedle Cartel")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Timbermaw Hold")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Thorium Brotherhood")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Wintersaber Trainers")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Darnassus")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Gnomeregan Exiles")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Ironforge")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Stormwind City")
ZygorGuidesViewer:RegisterGuidePlaceholder("Reputation Guides\\Reputations\\Argent Dawn")
