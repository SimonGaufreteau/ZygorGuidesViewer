local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("GoldFarmA") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Linen Cloth",{
meta={goldtype="route",levelreq={10,60}},
items={{2589,80}},
maps={"Westfall"},
},[[
step
Kill enemies around this area
|tip Be sure to enter the mine as well.
collect Linen Cloth##2589 |n |goto Westfall 44.55,25.01
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Wool Cloth",{
meta={goldtype="route",levelreq={20,60}},
items={{2592,80},{2589,32}},
maps={"Redridge Mountains"},
},[[
step
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect Wool Cloth##2592 |n |goto Redridge Mountains 36.22,9.93
You can find more inside the cave at [33.21,6.91]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Silk Cloth",{
meta={goldtype="route",levelreq={20,60}},
items={{4306,60},{2592,20}},
maps={"Thousand Needles"},
},[[
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect Silk Cloth##4306 |n |goto Thousand Needles 44.01,37.41
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Mageweave Cloth",{
meta={goldtype="route",levelreq={45,60}},
items={{4338,60}},
maps={"Tanaris"},
},[[
step
Kill Dunemaul enemies around this area
collect Mageweave Cloth##4338 |n |goto Tanaris 40.50,55.50
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Runecloth",{
meta={goldtype="route",levelreq={50,60}},
items={{14047,48}},
maps={"Western Plaguelands"},
},[[
step
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect Runecloth###14047 |n |goto Burning Steppes 42.17,35.64
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Felcloth",{
meta={goldtype="route",levelreq={50,60}},
items={{14256,10},{4338,60}},
maps={"Felwood"},
},[[
step
Kill Jadefire enemies around this area
collect Felcloth##14256 |n |goto Felwood 37.17,67.00
You can find more around [32.71,66.66]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Mooncloth",{
},[[
step
label "Farm_Felcloth"
Kill Jadefire enemies around this area
collect Felcloth##14256 |n |goto Felwood 37.17,67.00
Click here to transmute Felcloth into Mooncloth |confirm
|tip It only takes 2 Felcloth to make a Mooncloth, but it requires a rare Tailoring pattern and has a 4 day cooldown.
step
Open Your Tailoring Crafting Panel:
_<Create Mooncloth>_
|tip This spell has a 4 day cooldown.
collect Mooncloth##14342 |n |goto Ashenvale 60.19,72.90
Click here to farm more Felcloth |confirm |next "Farm_Felcloth"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Spider's Silk",{
meta={goldtype="route",levelreq={20,60}},
items={{3182,12},{1081,40}},
maps={"Wetlands"},
},[[
step
Enter the cave |goto Wetlands 52.79,62.90 < 20 |walk
Kill enemies around this area
|tip Inside the cave.
collect Spider's Silk##3182 |n |goto Wetlands 48.51,60.67
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Thick Spider's Silk",{
meta={goldtype="route",levelreq={58,60}},
items={{4337,8},{14047,28}},
maps={"Eastern Plaguelands"},
},[[
step
Follow the path up |goto Eastern Plaguelands 77.56,47.20 < 10 |only if walking
Kill Crypt enemies around this area
|tip You can find more inside the nearby crypt buildings.
collect Thick Spider's Silk##4337 |n |goto Eastern Plaguelands 83.60,42.07
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Shadow Silk",{
meta={goldtype="route",levelreq={38,60}},
items={{10285,16},{4337,20}},
maps={"Swamp of Sorrows"},
},[[
step
kill Deathstrike Tarantula##769+
collect Shadow Silk##10285 |n |goto Swamp of Sorrows 58.74,62.39
|tip These have a low drop rate.
You can find more around [66.70,68.65]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Ironweb Spider Silk",{
meta={goldtype="route",levelreq={55,60}},
items={{14227,6}},
maps={"Silithus"},
},[[
step
kill Sand Skitterer##11738+
collect Ironweb Spider Silk##14227 |n |goto Silithus 56.25,26.22
|tip These have a low drop rate.
You can find more around: |notinsticky
[54.15,18.47]
[63.01,18.18]
[64.31,29.61]
[38.69,34.85]
[35.71,30.35]
[35.29,20.57]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Brilliant Smallfish",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6291,100},{6289,40}},
maps={"Elwynn Forest"},
},[[
step
Fish in the open water
collect Raw Brilliant Smallfish##6291 |n |goto Elwynn Forest 33.59,63.52
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Chunk of Boar Meat",{
meta={goldtype="route",levelreq={1,60}},
items={{769,120}},
maps={"Elwynn Forest"},
},[[
step
kill Stonetusk Boar##113
collect Chunk of Boar Meat##769 |n |goto Elwynn Forest 41.81,87.22
You can find more around this area [32.96,84.95]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Small Egg",{
meta={goldtype="route",levelreq={10,60}},
items={{6889,100}},
maps={"Darkshore"},
},[[
step
map Darkshore
path follow smart; loop on; dist 20
path	42.54,49.69	42.84,48.54	43.76,47.68	44.83,47.93	46.07,49.39
path	46.23,50.98	45.59,52.40	44.96,53.22	44.69,54.49	43.84,53.83
path	43.01,53.12	42.10,54.15	41.70,53.04	41.80,50.80	41.19,48.45
Kill Moonkin enemies along this path
collect Small Egg##6889 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Small Spider Leg",{
meta={goldtype="route",levelreq={5,60}},
items={{5465,100}},
maps={"Teldrassil"},
},[[
step
map Teldrassil
path follow smart; loop on; dist 20
path	61.26,54.48	59.86,54.83	58.84,56.13	57.82,55.52	56.99,57.22
path	55.71,58.31	54.17,58.29	51.90,56.43	51.01,57.05	51.06,58.72
path	51.50,61.70	51.21,65.25	51.97,66.36	53.49,68.85	53.68,66.50
path	54.51,65.63	55.15,63.62	56.43,62.23	57.59,61.30	58.39,61.25
path	59.64,62.24	61.03,61.51	62.34,60.71	62.85,58.55	62.70,56.22
path	62.20,55.24
kill Webwood Lurker##1998+
collect Small Spider Leg##5465 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Stringy Wolf Meat",{
meta={goldtype="route",levelreq={5,60}},
items={{2672,100}},
maps={"Dun Morogh"},
},[[
step
map Dun Morogh
path follow smart; loop on; dist 20
path	48.83,44.33	49.91,45.80	51.35,45.50	52.65,45.75	54.52,46.88
path	53.16,48.13	52.07,50.43	50.38,52.50	49.29,54.64	48.27,55.36
path	47.24,53.86	46.41,52.12	46.05,49.96	44.75,48.06	42.48,47.21
path	40.23,47.20	38.74,46.65	36.95,45.83	35.43,45.11	34.49,44.49
path	32.83,46.26	31.94,47.31	30.21,46.67	30.51,44.36	31.98,42.52
path	33.05,39.49	36.17,37.53	37.64,35.53	38.86,32.48	41.00,31.62
path	43.08,31.61	44.32,33.52	44.37,37.07	45.30,40.37
Kill Wolf enemies along this path
collect Stringy Wolf Meat##2672 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Slitherskin Mackerel",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6303,160}},
maps={"Teldrassil"},
},[[
step
Fish in the open water
collect Raw Slitherskin Mackerel##6303 |n |goto Teldrassil 56.25,93.72
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Crag Boar Rib",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{2886,68}},
maps={"Dun Morogh"},
},[[
step
map Dun Morogh
path follow smart; loop on; dist 20
path	48.31,47.26	50.56,47.82	52.50,48.96	51.18,50.98	50.25,52.44
path	49.29,54.42	48.28,56.64	48.54,58.79	48.34,61.32	47.52,63.19
path	45.85,63.76	45.37,63.31	46.29,61.25	46.73,58.19	46.92,56.16
path	46.51,54.00	46.40,50.75	47.10,49.38	47.15,47.78
Kill Boar enemies along this path
collect Crag Boar Rib##2886 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Spider Ichor",{
meta={goldtype="route",levelreq={13,60}},
items={{3174,48}},
maps={"Loch Modan"},
},[[
step
label "Path_One"
map Loch Modan
path follow smart; loop off; dist 20
path	27.50,18.10	30.27,19.59	29.15,24.55	29.84,29.06	32.14,30.71
path	35.13,29.65	37.20,31.58	36.37,35.45	35.03,38.40	33.26,40.88
path	32.40,45.35	33.05,47.42	34.34,51.88	36.47,52.74	39.14,50.95
path	39.83,54.29	42.01,58.27	44.93,63.94	49.35,69.89	52.66,69.99
path	55.03,68.30	57.07,65.55	60.01,64.00	63.50,65.52	64.87,60.86
path	65.69,52.00	68.27,52.19	71.58,51.39	74.71,49.53	75.51,45.81
path	76.80,40.70	76.45,36.95	76.44,33.17	72.32,36.15	69.02,35.67
path	64.80,30.93	62.26,24.80	60.72,21.63	60.32,16.09	57.40,15.76
path	56.11,17.39
Kill Lurker enemies along this path
collect Spider Ichor##3174 |n
'|goto Loch Modan 56.11,17.39 < 20 |noway |c
step
map Loch Modan
path follow smart; loop off; dist 20
path	56.11,17.39	57.40,15.76	60.32,16.09	60.72,21.63	62.26,24.80
path	64.80,30.93	69.02,35.67	72.32,36.15	76.44,33.17	76.45,36.95
path	76.80,40.70	75.51,45.81	74.71,49.53	71.58,51.39	68.27,52.19
path	65.69,52.00	64.87,60.86	63.50,65.52	60.01,64.00	57.07,65.55
path	55.03,68.30	52.66,69.99	49.35,69.89	44.93,63.94	42.01,58.27
path	39.83,54.29	39.14,50.95	36.47,52.74	34.34,51.88	33.05,47.42
path	32.40,45.35	33.26,40.88	35.03,38.40	36.37,35.45	37.20,31.58
path	35.13,29.65	32.14,30.71	29.84,29.06	29.15,24.55	30.27,19.59
path	27.50,18.10
Kill Lurker enemies along this path
collect Spider Ichor##3174 |n
'|goto Loch Modan 27.50,18.10 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Coyote Meat, Boar Intestines, Stringy Vulture Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{2673,60},{3172,40},{729,24}},
maps={"Westfall"},
},[[
step
label "Path_One"
map Westfall
path follow smart; loop off; dist 20
path	62.45,42.12	61.05,38.49	59.20,30.20	58.69,26.18	58.85,22.18
path	55.99,22.99	53.72,26.55	51.15,26.31	48.14,25.64	47.04,19.68
path	44.81,17.52	42.78,19.23	41.83,24.14	41.27,26.78	42.70,31.93
path	39.81,33.77	36.63,30.63	34.38,34.44	33.43,38.91	35.02,42.09
path	38.49,42.87
Kill enemies along this path
collect Coyote Meat##2673 |n
|tip These are only dropped by Coyote enemies.
collect Boar Intestines##3172 |n
|tip These are only dropped by Boar enemies.
collect Stringy Vulture Meat##729 |n
|tip These are only dropped by Vulture enemies.
'|goto Westfall 38.49,42.87 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	38.49,42.87	35.02,42.09	33.43,38.91	34.38,34.44	36.63,30.63
path	39.81,33.77	42.70,31.93	41.27,26.78	41.83,24.14	42.78,19.23
path	44.81,17.52	47.04,19.68	48.14,25.64	51.15,26.31	53.72,26.55
path	55.99,22.99	58.85,22.18	58.69,26.18	59.20,30.20	61.05,38.49
path	62.45,42.12
Kill enemies along this path
collect Coyote Meat##2673 |n
|tip These are only dropped by Coyote enemies.
collect Boar Intestines##3172 |n
|tip These are only dropped by Boar enemies.
collect Stringy Vulture Meat##729 |n
|tip These are only dropped by Vulture enemies.
'|goto Westfall 62.45,42.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Strider Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{5469,60}},
maps={"Darkshore"},
},[[
step
map Darkshore
path follow smart; loop on; dist 20
path	41.72,45.81	42.40,44.51	43.58,42.34	44.66,42.12	46.20,41.09
path	47.32,40.10	47.90,39.85	48.42,38.69	48.61,37.31	48.50,35.08
path	48.73,33.75	49.68,32.60	50.53,30.20	50.70,28.40	50.02,26.68
path	49.23,25.39	48.00,23.46	46.94,23.20	45.63,23.60	44.92,25.24
path	44.27,27.17	43.90,29.44	43.88,31.28	43.81,33.32	42.75,34.53
path	41.64,34.45	40.24,33.90	39.53,35.70	39.27,37.38	39.07,39.41
path	39.65,40.83	40.30,42.11	39.99,44.14	38.96,46.50	39.25,47.99
path	40.57,48.26
Kill Strider enemies along this path
collect Strider Meat##5469 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Kodo Meat",{
meta={goldtype="route",levelreq={20,60}},
items={{5467,30}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	46.73,67.35	46.61,69.24	46.70,71.56	46.79,75.01	46.84,79.96
path	45.00,78.85	44.87,75.78	45.31,72.93	45.54,70.61	45.76,68.23
path	45.93,66.82
Kill Kodo enemies along this path
collect Kodo Meat##5467 |n
|tip Thunderheads will not drop this item.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Murloc Eye",{
meta={goldtype="route",levelreq={10,60}},
items={{730,60}},
maps={"Westfall"},
},[[
step
Kill Murloc enemies around this area
|tip They spawn all along the coast, so you can move down to get more.
collect Murloc Eye##730 |n |goto Westfall 55.73,9.49
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Bear Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{3173,60}},
maps={"Darkshore"},
},[[
step
map Darkshore
path follow smart; loop on; ants curved; dist 20
path	45.52,35.10	46.86,35.15	47.88,33.99	48.82,34.11	49.47,33.15
path	49.81,31.71	49.00,30.97	48.64,29.50	49.29,27.40	48.64,27.07
path	48.40,25.88	48.18,24.49	47.62,23.22	46.59,22.69	45.54,23.42
path	44.37,23.40	44.27,24.98	43.83,26.43	44.32,27.91	43.94,29.27
path	44.78,30.11	45.40,31.46	44.78,32.44	43.97,32.76	42.43,32.68
path	41.39,33.60	41.66,35.17	42.07,37.43	42.42,39.82	43.17,41.92
path	44.41,42.90	45.25,43.21	45.48,41.84
Kill Bear enemies along this path
collect Bear Meat##3173 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Goretusk Snout, Goretusk Liver",{
meta={goldtype="route",levelreq={10,60}},
items={{731,48},{723,52}},
maps={"Westfall"},
},[[
step
map Westfall
path follow smart; loop on; dist 20
path	54.77,43.68	52.06,43.69	49.12,42.27	45.09,41.88	43.96,44.88
path	41.67,44.84	39.02,39.33	39.16,34.42	35.06,35.23	33.65,38.77
path	34.88,42.29	35.10,44.27	37.31,45.80	39.99,48.75	42.97,53.04
path	41.95,57.70	39.61,60.26	40.13,64.84	42.23,64.99	45.21,63.19
path	46.83,61.93	47.60,58.82	49.94,58.52	51.66,61.20	54.37,59.63
path	56.14,55.00	55.49,50.62	55.02,47.55
Kill Goretusk enemies along this path
collect Goretusk Snout##731 |n
collect Goretusk Liver##723 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Crawler Meat, Crawler Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{2674,48},{2675,40}},
maps={"Westfall"},
},[[
step
map Westfall
path follow smart; loop off; dist 20
path	51.32,9.67	49.06,10.01	44.72,8.70	41.78,10.34	38.85,13.51
path	36.20,18.29	33.45,22.08	31.88,24.30
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Meat##2674 |n
collect Crawler Claw##2675 |n
'|goto Westfall 31.88,24.30 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	31.88,24.30	33.45,22.08	36.20,18.29	38.85,13.51	41.78,10.34
path	44.72,8.70	49.06,10.01	51.32,9.67
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Meat##2674 |n
collect Crawler Claw##2675 |n
'|goto Westfall 51.32,9.67 < 20 |noway |c
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Clam Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{5503,52}},
maps={"Westfall"},
},[[
step
Kill Murloc enemies around this area
|tip They are found all along the coastline.
collect Small Barnacled Clam##5523 |n
use the Small Barnacled Clam##5523
collect Clam Meat##5503 |n |goto Westfall 37.26,15.67
|tip They are inside of the Small Barnacled Clams.
You can find more around here [31.16,26.10]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Boar Ribs",{
meta={goldtype="route",levelreq={10,60}},
items={{2677,30}},
maps={"Loch Modan"},
},[[
step
label "Path_One"
map Loch Modan
path follow smart; loop off; dist 20
path	27.50,18.10	30.27,19.59	29.15,24.55	29.84,29.06	32.14,30.71
path	35.13,29.65	37.20,31.58	36.37,35.45	35.03,38.40	33.26,40.88
path	32.40,45.35	33.05,47.42	34.34,51.88	36.47,52.74	39.14,50.95
path	39.83,54.29	42.01,58.27	44.93,63.94	49.35,69.89	52.66,69.99
path	55.03,68.30	57.07,65.55	60.01,64.00	63.50,65.52	64.87,60.86
path	65.69,52.00	68.27,52.19	71.58,51.39	74.71,49.53	75.51,45.81
path	76.80,40.70	76.45,36.95	76.44,33.17	72.32,36.15	69.02,35.67
path	64.80,30.93	62.26,24.80	60.72,21.63	60.32,16.09	57.40,15.76
path	56.11,17.39
Kill Boar enemies along this path
collect Boar Ribs##2677 |n
'|goto Loch Modan 56.11,17.39 < 20 |noway |c
step
map Loch Modan
path follow smart; loop off; dist 20
path	56.11,17.39	57.40,15.76	60.32,16.09	60.72,21.63	62.26,24.80
path	64.80,30.93	69.02,35.67	72.32,36.15	76.44,33.17	76.45,36.95
path	76.80,40.70	75.51,45.81	74.71,49.53	71.58,51.39	68.27,52.19
path	65.69,52.00	64.87,60.86	63.50,65.52	60.01,64.00	57.07,65.55
path	55.03,68.30	52.66,69.99	49.35,69.89	44.93,63.94	42.01,58.27
path	39.83,54.29	39.14,50.95	36.47,52.74	34.34,51.88	33.05,47.42
path	32.40,45.35	33.26,40.88	35.03,38.40	36.37,35.45	37.20,31.58
path	35.13,29.65	32.14,30.71	29.84,29.06	29.15,24.55	30.27,19.59
path	27.50,18.10
Kill Boar enemies along this path
collect Boar Ribs##2677 |n
'|goto Loch Modan 27.50,18.10 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Crocolisk Meat",{
meta={goldtype="route",levelreq={12,60}},
items={{2924,44}},
maps={"Loch Modan"},
},[[
step
label "Path_One"
map Loch Modan
path follow smart; loop off; dist 20
path	59.07,58.33	61.96,54.52	62.60,51.20	62.93,48.10	61.85,44.72
path	59.99,41.23	58.93,39.15	56.80,39.21	54.29,41.28	52.90,36.82
path	56.38,35.56	58.29,34.14	57.78,30.70	58.28,23.79	56.87,21.44
Kill Crocolisk enemies along this path
collect Crocolisk Meat##2924 |n
'|goto Loch Modan 56.87,21.44 < 20 |noway |c
step
map Loch Modan
path follow smart; loop off; dist 20
path	56.87,21.44	58.28,23.79	57.78,30.70	58.29,34.14	56.38,35.56
path	52.90,36.82	54.29,41.28	56.80,39.21	58.93,39.15	59.99,41.23
path	61.85,44.72	62.93,48.10	62.60,51.20	61.96,54.52	59.07,58.33
Kill Crocolisk enemies along this path
collect Crocolisk Meat##2924 |n
'|goto Loch Modan 59.07,58.33 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Rainbow Fin Albacore",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6361,80}},
maps={"Wetlands"},
},[[
step
Fish in the Open Water
collect Raw Rainbow Fin Albacore##6361 |n |goto Wetlands 9.32,61.63
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Longjaw Mud Snapper",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6289,100}},
maps={"Stormwind City"},
},[[
step
Fish in the Open Water
collect Raw Longjaw Mud Snapper##6289 |n |goto Stormwind City 45.37,57.54
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Tough Condor Meat",{
meta={goldtype="route",levelreq={18,60}},
items={{1080,12}},
maps={"Redridge Mountains"},
},[[
step
label "Path_One"
map Redridge Mountains
path follow smart; loop off; dist 20
path	40.90,39.07	42.13,33.74	45.43,30.76	48.37,31.50	49.98,33.27
path	51.31,34.71	54.57,38.75	56.34,40.65	58.08,41.06	61.81,39.87
path	65.27,42.43
Kill Condor enemies along this path
collect Tough Condor Meat##1080 |n
'|goto Redridge Mountains 65.27,42.43 < 20 |noway |c
step
map Redridge Mountains
path follow smart; loop off; dist 20
path	62.49,39.72	59.22,40.52	56.35,41.43	57.19,45.31	55.36,45.91
path	52.71,42.81	50.52,41.90	49.25,41.66	46.85,37.78	44.32,37.81
path	42.56,37.84	39.61,39.63
Kill Condor enemies along this path
collect Tough Condor Meat##1080 |n
'|goto Redridge Mountains 39.61,39.63 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Soft Frenzy Flesh",{
meta={goldtype="route",levelreq={10,60}},
items={{5468,60}},
maps={"Darkshore"},
},[[
step
map Darkshore
path follow smart; loop on; dist 20
path	34.24,60.68	31.91,61.15	33.77,66.17	33.07,67.99	32.05,71.24
path	31.26,73.36	32.40,75.21	32.04,77.87	34.60,77.45	34.68,74.58
path	34.79,72.62	35.34,70.00	35.82,66.96	35.50,65.25	35.59,62.93
path	35.54,60.26
kill Coastal Frenzy##2174+
|tip They are underwater along this path.
collect Soft Frenzy Flesh##5468 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Loch Frenzy",{
meta={goldtype="route",levelreq={10,60}},
items={{6317,60}},
maps={"Loch Modan"},
},[[
step
map Loch Modan
path follow smart; loop on; dist 20
path	44.56,30.72	44.43,24.86	44.40,19.25	47.08,17.29	50.60,16.64
path	52.93,18.26	55.24,22.03	56.79,25.41	56.33,29.61	52.70,31.04
path	49.85,32.36	46.69,32.19
kill Loch Frenzy##1193+
|tip They are underwater along this path.
collect Raw Loch Frenzy##6317 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Murloc Fin",{
meta={goldtype="route",levelreq={18,60}},
items={{1468,64},{730,60},{5503,64}},
maps={"Ashenvale"},
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	20.90,40.21	21.33,41.92	21.06,43.30	20.66,44.48	19.75,43.65
path	19.08,42.84	18.81,41.34	18.96,40.20	19.58,41.07
Kill Saltspittle enemies around this area
collect Murloc Fin##1468 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Lean Wolf Flank",{
meta={goldtype="route",levelreq={17,60}},
items={{1015,16}},
maps={"Duskwood"},
},[[
step
label "Path_One"
map Duskwood
path follow smart; loop off; dist 20
path	63.16,28.80	64.53,25.32	66.25,22.72	68.11,20.39	65.79,19.10
path	63.93,18.00	61.85,17.35	61.24,19.93	59.17,22.31	57.44,22.15
path	55.99,19.56	54.52,17.35	52.93,14.73	51.60,17.10	50.35,19.66
path	49.58,17.59	48.56,16.46	46.52,16.89	44.73,18.76	43.31,20.29
path	41.58,18.79	39.78,19.76	37.72,19.38	36.39,21.44	37.40,24.54
path	35.14,24.60	32.82,24.47	31.96,27.24	29.31,27.36	27.36,26.54
path	25.34,27.61	22.46,25.92	20.45,25.75	18.66,23.98	16.18,27.47
path	14.08,27.45	12.25,30.98	10.25,32.63
Kill Wolf enemies around this area
collect Lean Wolf Flank##1015 |n
'|goto Duskwood 10.25,32.63 < 20 |noway |c
step
map Duskwood
path follow smart; loop off; dist 20
path	10.25,32.63	12.25,30.98	14.08,27.45	16.18,27.47	18.66,23.98
path	20.45,25.75	22.46,25.92	25.34,27.61	27.36,26.54	29.31,27.36
path	31.96,27.24	32.82,24.47	35.14,24.60	37.40,24.54	36.39,21.44
path	37.72,19.38	39.78,19.76	41.58,18.79	43.31,20.29	44.73,18.76
path	46.52,16.89	48.56,16.46	49.58,17.59	50.35,19.66	51.60,17.10
path	52.93,14.73	54.52,17.35	55.99,19.56	59.17,22.31	61.24,19.93
path	61.85,17.35	63.93,18.00	65.79,19.10	68.11,20.39	66.25,22.72
path	64.53,25.32	63.16,28.80
Kill Wolf enemies around this area
collect Lean Wolf Flank##1015 |n
'|goto Duskwood 63.16,28.80 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Sagefish",{
meta={goldtype="route",skillreq={fishing=100},levelreq={30,60}},
items={{21071,120}},
maps={"Hillsbrad Foothills"},
},[[
step
Fish from Sagefish Schools in the water around this area
collect Raw Sagefish##21071 |n |goto Hillsbrad Foothills 62.51,43.06
|tip Follow the river north for more schools.
|tip You will need level 100 Fishing to catch these.
You can find more around [69.87,13.66]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Big Bear Meat",{
meta={goldtype="route",levelreq={20,60}},
items={{3730,60}},
maps={"Hillsbrad Foothills"},
},[[
step
map Hillsbrad Foothills
path follow smart; loop on; dist 20
path	38.33,38.22	38.83,41.84	40.63,44.03	42.02,47.77	43.74,49.21
path	44.53,52.30	48.19,47.24	53.47,48.86	54.78,44.77	56.02,39.61
path	53.80,34.79	52.80,31.91	50.32,32.11	48.17,34.26	45.68,36.53
path	43.61,37.51	41.05,36.09	37.81,33.55
Kill Bear enemies around this area
collect Big Bear Meat##3730 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raptor Egg",{
meta={goldtype="route",levelreq={20,60}},
items={{3685,40}},
maps={"Wetlands"},
},[[
step
map Wetlands
path follow smart; loop on; dist 20
path	20.63,48.84	21.22,52.36	22.52,55.60	23.52,53.14	24.47,52.25
path	24.33,49.93	26.28,48.80	26.45,47.06	27.37,45.66	23.64,46.15
path	22.34,50.55
Kill Raptor enemies around this area
collect Raptor Egg##3685 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Thunder Lizard Tail",{
meta={goldtype="route",levelreq={20,60}},
items={{5470,60}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	46.58,56.30	48.58,57.05	48.69,58.20	48.80,59.11	48.24,60.56
path	48.43,62.12	48.27,63.65	47.64,65.24	46.80,67.81	46.67,68.85
path	46.58,71.45	47.01,73.09	46.67,74.29	47.26,75.11	47.86,75.81
path	48.51,76.74	49.30,77.70	48.91,78.77	47.66,80.13	46.53,79.48
path	44.91,79.17	44.65,78.42	44.58,76.68	44.47,75.54	44.75,74.17
path	45.56,72.50	45.56,70.73	45.79,69.01	46.03,66.53	45.23,64.79
path	45.30,63.46	46.25,61.69	46.94,60.01	47.00,58.41
Kill Thunderhead enemies around this area
collect Thunder Lizard Tail##5470 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Tangy Clam Meat",{
meta={goldtype="route",levelreq={20,60}},
items={{5504,40}},
maps={"Wetlands"},
},[[
step
map Wetlands
path follow smart; loop on; dist 20
path	15.21,40.13	17.36,39.06	19.36,38.16	22.88,37.14	24.91,36.76
path	24.41,33.77	23.10,33.59	21.34,34.34	19.64,31.98	18.24,31.36
path	16.84,29.42	15.14,30.74	14.96,33.33	14.32,35.71	13.91,38.13
path	14.03,40.90
Kill Bluegill enemies around this area
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Tangy Clam Meat##5504 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Tender Crocolisk Meat",{
meta={goldtype="route",levelreq={35,60}},
items={{3667,60}},
maps={"Dustwallow Marsh"},
},[[
step
label "Path_One"
map Dustwallow Marsh
path follow smart; loop off; dist 20
path	42.01,28.23	41.27,30.48	40.81,32.17	39.51,33.86	38.27,35.06
path	39.30,36.33	40.52,36.90	41.08,38.12	42.23,39.13	42.29,41.27
path	40.44,41.83	39.76,43.93	39.29,45.36	38.51,45.82	37.54,46.50
path	36.53,47.94	35.50,49.39	36.60,52.40	38.28,53.98	40.81,54.72
path	41.62,55.99	40.68,58.48	40.53,61.02
Kill Drywallow enemies along this path
collect Tender Crocolisk Meat##3667 |n
'|goto Dustwallow Marsh 40.53,61.02 < 20 |noway |c
step
map Dustwallow Marsh
path follow smart; loop off; dist 20
path	40.53,61.02	40.68,58.48	41.62,55.99	40.81,54.72	38.28,53.98
path	36.60,52.40	35.50,49.39	36.53,47.94	37.54,46.50	38.51,45.82
path	39.29,45.36	39.76,43.93	40.44,41.83	42.29,41.27	42.23,39.13
path	41.08,38.12	40.52,36.90	39.30,36.33	38.27,35.06	39.51,33.86
path	40.81,32.17	41.27,30.48	42.01,28.23
Kill Drywallow enemies along this path
collect Tender Crocolisk Meat##3667 |n
'|goto Dustwallow Marsh 42.01,28.23 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Lion Meat",{
meta={goldtype="route",levelreq={25,60}},
items={{3731,28}},
maps={"Hillsbrad Foothills"},
},[[
step
map Hillsbrad Foothills
path follow smart; loop on; ants curved; dist 20
path	53.45,35.50	54.82,31.40	50.85,30.94	48.73,31.20	47.14,34.19
path	44.82,36.37	42.94,35.61	40.84,34.75	37.39,30.82	38.60,37.24
path	39.02,42.97	41.37,42.61	42.89,40.98	44.43,45.21	47.44,44.25
path	50.74,47.10	53.15,47.46	55.37,44.48	54.69,42.88	56.10,41.00
path	56.82,37.61
kill Starving Mountain Lion##2384+
collect Lion Meat##3731 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Stag Meat",{
meta={goldtype="route",levelreq={20,60}},
items={{5471,40}},
maps={"Stonetalon Mountains"},
},[[
step
label "Path_One"
map Stonetalon Mountains
path follow smart; loop off; dist 20
path	50.21,36.84	49.75,34.63	48.15,33.61	46.91,32.12	46.84,28.49
path	46.38,25.94	45.77,24.36	44.95,22.28	44.66,19.95	44.13,17.21
path	43.26,16.08	41.50,15.94	40.17,15.24	39.42,12.31	39.94,10.54
path	40.29,8.62	40.73,6.34	39.49,6.04
Kill Courser enemies along this path
collect Stag Meat##5471 |n
'|goto Stonetalon Mountains 39.49,6.04 < 30 |noway |c
step
map Stonetalon Mountains
path follow smart; loop off; dist 20
path	39.49,6.04	40.73,6.34	40.29,8.62	39.94,10.54	39.42,12.31
path	40.17,15.24	41.50,15.94	43.26,16.08	44.13,17.21	44.66,19.95
path	44.95,22.28	45.77,24.36	46.38,25.94	46.84,28.49	46.91,32.12
path	48.15,33.61	49.75,34.63	50.21,36.84
Kill Courser enemies along this path
collect Stag Meat##5471 |n
'|goto Stonetalon Mountains 50.21,36.84 < 30 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Bristle Whisker Catfish",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6308,48}},
maps={"Stormwind City"},
},[[
step
Fish in the Open Water
collect Raw Bristle Whisker Catfish##6308 |n |goto Stormwind City 45.37,57.54
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Gooey Spider Leg",{
meta={goldtype="route",levelreq={17,60}},
items={{2251,80}},
maps={"Duskwood"},
},[[
step
label "Path_One"
map Duskwood
path follow smart; loop off; dist 20
path	75.39,23.25	75.70,20.27	72.81,20.02	68.45,21.26	66.04,20.18
path	64.38,23.56	62.25,25.40	58.25,19.25	55.59,20.51	53.13,20.33
path	50.65,16.19	48.36,17.34	46.63,16.65
Kill Spider enemies along this path
collect Gooey Spider Leg##2251 |n
'|goto Duskwood 46.63,16.65 < 20 |noway |c
step
map Duskwood
path follow smart; loop off; dist 20
path	46.63,16.65	48.36,17.34	50.65,16.19	53.13,20.33	55.59,20.51
path	58.25,19.25	62.25,25.40	64.38,23.56	66.04,20.18	68.45,21.26
path	72.81,20.02	75.70,20.27	75.39,23.25
Kill Spider enemies along this path
collect Gooey Spider Leg##2251 |n
'|goto Duskwood 75.39,23.25 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Mystery Meat, Buzzard Wing",{
meta={goldtype="route",levelreq={35,60}},
items={{12037,28},{3404,32}},
maps={"Desolace"},
},[[
step
map Desolace
path follow smart; loop on; ants curved; dist 20
path	51.29,44.72	53.48,47.10	55.33,46.17	57.48,48.07	58.96,47.63
path	60.75,46.43	62.24,44.62	63.57,45.94	63.27,49.13	61.69,55.00
path	61.88,58.44	62.94,65.32	61.88,68.70	62.74,70.12	63.61,72.54
path	61.39,75.80	59.53,76.20	60.04,79.61	59.47,82.26	56.81,86.32
path	54.85,86.07	52.40,86.59	50.42,87.94	48.11,87.57	44.00,86.02
path	41.14,82.82	42.54,77.20	43.81,73.09	42.57,70.49	41.77,66.08
path	42.23,61.68	42.51,57.62	43.63,55.03	43.45,50.95	41.83,49.60
path	41.89,45.46	45.18,40.98	45.64,38.42	48.07,39.13	50.82,41.52
Kill enemies around this area
collect Mystery Meat##12037 |n
collect Buzzard Wing##3404 |n
|tip These are only dropped by Dread enemies.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Red Wolf Meat",{
meta={goldtype="route",levelreq={40,60}},
items={{12203,40}},
maps={"The Hinterlands"},
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	16.99,49.54	14.76,51.94	16.34,54.97	19.20,54.81	21.00,55.69
path	22.67,53.75	24.13,52.68	22.29,51.46	20.61,50.68	19.10,49.49
kill Mangy Silvermane##2923+
collect Red Wolf Meat##12203 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Turtle Meat",{
meta={goldtype="route",levelreq={30,60}},
items={{3712,40}},
maps={"Hillsbrad Foothills"},
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	55.45,57.43	56.82,50.74	58.10,47.76	59.58,47.03	61.27,45.60
path	61.69,42.44	63.66,39.71	66.35,38.58	67.91,34.65	68.11,31.05
path	68.53,27.79	68.76,23.80	68.71,17.57	69.11,12.97	71.53,8.15
map Alterac Mountains
path	73.57,66.04	77.21,62.35	79.49,58.40	81.26,54.60	84.17,52.70
path	87.28,49.70	90.76,47.21
Kill Snapjaw enemies along this path
collect Turtle Meat##3712 |n
'|goto Alterac Mountains 90.76,47.21 < 20 |noway |c
step
map Alterac Mountains
path follow smart; loop off; dist 20
path	90.76,47.21	87.28,49.70	84.17,52.70	81.26,54.60	79.49,58.40
path	77.21,62.35	73.57,66.04
map Hillsbrad Foothills
path	71.53,8.15	69.11,12.97	68.71,17.57	68.76,23.80	68.53,27.79
path	68.11,31.05	67.91,34.65	66.35,38.58	63.66,39.71	61.69,42.44
path	61.27,45.60	59.58,47.03	58.10,47.76	56.82,50.74	55.45,57.43
Kill Snapjaw enemies along this path
collect Turtle Meat##3712 |n
'|goto Hillsbrad Foothills 55.45,57.43 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Tiger Meat",{
meta={goldtype="route",levelreq={30,60}},
items={{12202,40}},
maps={"Stranglethorn Vale"},
},[[
step
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	37.17,11.59	36.03,11.59	35.04,11.61	33.93,9.90	32.59,9.49
path	31.34,8.40	31.71,9.95	32.62,10.51	33.06,11.72	33.88,12.60
path	34.58,13.61	35.43,12.75	36.60,13.36	37.41,14.77	38.14,14.47
path	38.22,13.67	38.39,12.20	39.14,10.33	39.08,9.00	37.71,9.37
Kill Tiger enemies around this area
collect Tiger Meat##12202 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raptor Flesh",{
meta={goldtype="route",levelreq={30,60}},
items={{12184,40}},
maps={"Stranglethorn Vale"},
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect Raptor Flesh##12184 |n
'|goto Stranglethorn Vale 23.70,15.50 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect Raptor Flesh##12184 |n
'|goto Stranglethorn Vale 30.64,25.20 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Mithril Head Trout",{
meta={goldtype="route",skillreq={fishing=130},levelreq={30,60}},
items={{8365,60}},
maps={"Dustwallow Marsh"},
},[[
step
Fish in the Open Water
collect Raw Mithril Head Trout##8365 |n |goto Dustwallow Marsh 59.95,34.54
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Rockscale Cod",{
meta={goldtype="route",skillreq={fishing=130},levelreq={20,60}},
items={{6362,100}},
maps={"Stranglethorn Vale"},
},[[
step
Fish in the Open Water
collect Raw Rockscale Cod##6362 |n |goto Stranglethorn Vale 26.22,73.57
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Giant Clam Meat",{
meta={goldtype="route",levelreq={35,60}},
items={{4655,16},{4611,28}},
maps={"Stranglethorn Vale"},
},[[
step
click Giant Clam##2744+
|tip They look like large shells underwater around this area.
|tip Elixirs of Water Breathing are very helpful while farming these.
collect Giant Clam Meat##4655 |n |goto Stranglethorn Vale 26.75,26.88
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Sunscale Salmon",{
meta={goldtype="route",skillreq={fishing=205},levelreq={40,60}},
items={{13760,24}},
maps={"Feralas"},
},[[
step
Fish in the Open Water
collect Raw Sunscale Salmon##13760 |n |goto Feralas 62.39,52.49
|tip You will need level 205 Fishing to catch these.
|tip This fish can only be caught during the day; they cannot be caught between midnight and 6 AM server time.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Essence of Water",{
meta={goldtype="route",levelreq={55,60}},
items={{7080,6},{7070,4}},
maps={"Eastern Plaguelands"},
},[[
step
Kill enemies around this area
|tip Only Plague Ravagers and Blighted Surges will drop this item.
collect Essence of Water##7080 |n |goto Eastern Plaguelands 61.65,81.13
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Living Essence",{
meta={goldtype="route",levelreq={50,60}},
items={{12803,6}},
maps={"Un'Goro Crater"},
},[[
step
Kill Tar enemies around this area
collect Living Essence##12803 |n |goto Un'Goro Crater 46.46,17.23
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Essence of Fire",{
meta={goldtype="route",levelreq={50,60}},
items={{7078,6}},
maps={"Un'Goro Crater"},
},[[
step
Follow the path up |goto Un'Goro Crater 52.06,42.40 < 10 |only if walking
Kill enemies around this area
collect Essence of Fire##7078 |n |goto Un'Goro Crater 49.32,48.31
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Essence of Air, Breath of Wind, Elemental Air",{
meta={goldtype="route",levelreq={55,60}},
items={{7082,6},{7081,4},{7069,4}},
maps={"Silithus"},
},[[
step
kill Dust Stormer##11744+
collect Essence of Air##7082 |n |goto Silithus 31.69,18.15
collect Breath of Wind##7081 |n |goto Silithus 31.69,18.15
collect Elemental Air##7069 |n |goto Silithus 31.69,18.15
|tip These have a low drop rate.
You can find more around [21.34,29.92]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Essence of Earth, Core of Earth",{
meta={goldtype="route",levelreq={55,60}},
items={{7076,6},{7075,6},{7912,40},{8150,24}},
maps={"Silithus"},
},[[
step
kill Desert Rumbler##11746+
collect Essence of Earth##7076 |n |goto Silithus 22.37,11.12
collect Core of Earth##7075 |n |goto Silithus 22.37,11.12
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Essence of Undeath",{
meta={goldtype="route",levelreq={55,60}},
items={{12808,4}},
maps={"Western Plaguelands"},
},[[
step
Follow the path |goto Western Plaguelands 56.61,78.55 < 10 |only if walking
Continue following the path |goto Western Plaguelands 68.58,80.14 < 10 |only if walking
Run up the stairs |goto Western Plaguelands 69.94,74.00 < 7 |only if walking
Enter the building |goto Eastern Kingdoms 52.79,26.43 < 7 |walk
click Scholomance Door |goto Eastern Kingdoms 52.75,26.41 < 5 |walk
Enter the Scholomance dungeon |goto Eastern Kingdoms 52.70,26.38 < 5 |c
step
Kill enemies throughout the dungeon
collect Essence of Undeath##12808 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Heart of the Wild",{
meta={goldtype="route",levelreq={55,60}},
items={{10286,4}},
maps={"Western Plaguelands"},
},[[
step
Enter the cave |goto Western Plaguelands 64.78,38.69 < 5 |walk
Kill enemies around this area
|tip Inside the cave.
|tip Rotting Behemoths and Decaying Horrors can drop Heart of the Wild.
|tip The enemies share spawn points, so killing the oozes will spawn more elemental enemies.
collect Heart of the Wild##10286 |n |goto Western Plaguelands 61.43,36.20
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Ichor of Undeath",{
meta={goldtype="route",levelreq={55,60}},
items={{7972,20}},
maps={"Winterspring"},
},[[
step
Kill Highborne enemies around this area
collect Ichor of Undeath##7972 |n |goto Winterspring 52.59,40.68
|tip These have a low drop rate.
You can find more around: |notinsticky
[53.62,42.09]
[56.02,44.24]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Heart of Fire",{
meta={goldtype="route",levelreq={50,60}},
items={{7077,6},{7067,8}},
maps={"Felwood"},
},[[
step
Kill Entropic enemies around this area
collect Heart of Fire##7077 |n |goto Felwood 40.92,40.34
|tip These have a low drop rate.
You can find more around [42.51,37.87]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Globe of Water",{
meta={goldtype="route",levelreq={50,60}},
items={{7079,6},{7080,4}},
maps={"Felwood"},
},[[
step
kill Toxic Horror##7132+
collect Globe of Water##7079 |n |goto Felwood 49.48,23.46
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Elemental Fire",{
meta={goldtype="route",levelreq={35,60}},
items={{7068,8}},
maps={"Arathi Highlands"},
},[[
step
kill Burning Exile##2760+
collect Elemental Fire##7068 |n |goto Arathi Highlands 24.80,29.95
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Elemental Earth, Deeprock Salt, Solid Stone",{
meta={goldtype="route",levelreq={40,60}},
items={{7067,8},{8150,40},{7912,40}},
maps={"Badlands"},
},[[
step
Follow the path up |goto Badlands 46.37,77.20
kill Rock Elemental##92+
collect Elemental Earth##7067 |n |goto Badlands 43.30,84.24
collect Deeprock Salt##8150 |n |goto Badlands 43.30,84.24
collect Solid Stone##7912 |n |goto Badlands 43.30,84.24
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Elemental Water",{
meta={goldtype="route",levelreq={35,60}},
items={{7070,8}},
maps={"Arathi Highlands"},
},[[
step
kill Cresting Exile##2761+
collect Elemental Water##7070 |n |goto Arathi Highlands 66.70,29.91
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Elemental Air",{
meta={goldtype="route",levelreq={35,60}},
items={{7069,16}},
maps={"Arathi Highlands"},
},[[
step
kill Thundering Exile##2762+
collect Elemental Air##7069 |n |goto Arathi Highlands 52.03,50.77
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Righteous Orb",{
meta={goldtype="route",levelreq={55,60}},
items={{12811,1}},
},[[
step
Enter the Stratholme Dungeon
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
Make your way to the Crusaders' Square
|tip It will be to the left of the rat gate.
Kill Crimson enemies around this area
|tip All Crimson enemies in The Scarlet Bastion have a chance to drop the orb.
collect Righteous Orb##12811 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Demonic Rune",{
meta={goldtype="route",levelreq={55,60}},
items={{12662,4}},
maps={"Felwood"},
},[[
step
Follow the path up |goto Felwood 38.44,59.39 < 20 |only if walking
Continue following the path |goto Felwood 37.63,60.96 < 20 |only if walking
Continue following the path |goto Felwood 36.04,61.32 < 20 |only if walking
Enter the building |goto Felwood 35.39,58.61 < 20 |walk
Kill Jaedenar enemies around this area
collect Demonic Rune##12662 |n |goto Felwood 37.61,54.67
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Dark Rune",{
meta={goldtype="route",levelreq={55,60}},
items={{20520,4}},
},[[
step
Enter the Scholomance Dungeon
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
Kill enemies around this area
|tip Scholomance Necromancers and Scholomance Dark Summoners are the only enemies besides bosses that will drop them.
collect Dark Rune##20520 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Sharp Claw",{
meta={goldtype="route",levelreq={27,60}},
items={{5635,4}},
maps={"Wetlands"},
},[[
step
Follow the path up |goto Wetlands 66.98,40.59 < 20 |only if walking
Continue up the path |goto Wetlands 67.64,39.88 < 20 |only if walking
Enter the cave |goto Wetlands 69.33,34.86 < 20 |walk
Kill Razormaw enemies around this area
|tip Inside the cave.
collect Sharp Claw##5635 |n |goto Wetlands 70.42,29.50
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Ogre Tannin",{
meta={goldtype="route",levelreq={58,60}},
items={{18240,1}},
},[[
step
Enter the Dire Maul West Dungeon Entrance
|tip You will need to join and form a group for this.
Click Here Once You Have Entered the Dungeon |confirm
step
click Ogre Tannin Basket##179499
|tip It will be up the ramp past the broken trap.
|tip Once up the first ramp, it will be in the far northwest corner of the room.
|tip Only one person will be able to loot it.
collect Ogre Tannin##18240 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Small Venom Sac",{
meta={goldtype="route",levelreq={25,60}},
items={{1475,8}},
maps={"Redridge Mountains"},
},[[
step
map Redridge Mountains
path follow smart; loop on; ants curved; dist 20
path	51.04,41.76	53.70,43.86	53.45,46.07	55.68,47.30	57.57,44.98
path	55.62,41.71	53.83,37.42	51.30,38.07
Kill Tarantula enemies around this area
collect Small Venom Sac##1475 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Huge Venom Sac",{
meta={goldtype="route",levelreq={55,60}},
items={{19441,6}},
maps={"Silithus"},
},[[
step
map Silithus
path follow smart; loop on; ants curved; dist 20
path	54.03,30.39	56.79,33.30	59.06,30.91	61.29,30.65	63.54,31.68
path	66.19,30.35	65.86,26.61	64.78,22.29	63.17,18.92	61.66,15.66
path	60.22,13.51	58.24,13.36	56.02,11.72	54.46,13.22	52.99,12.72
path	51.43,13.97	49.68,16.23	51.34,19.02	51.78,22.20	52.37,25.34
path	52.30,29.17	52.30,29.17
Kill enemies around this area
collect Huge Venom Sac##19441 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Iridescent Pearl",{
meta={goldtype="route",levelreq={23,60}},
items={{5500,1}},
maps={"Wetlands"},
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	15.21,40.13	17.36,39.06	19.36,38.16	22.88,37.14	24.91,36.76
path	24.41,33.77	23.10,33.59	21.34,34.34	19.64,31.98	18.24,31.36
path	16.84,29.42	15.14,30.74	14.96,33.33	14.32,35.71	13.91,38.13
path	14.03,40.90
Kill Bluegill enemies around this area
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Iridescent Pearl##5500 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Black Pearl, Golden Pearl, Zesty Clam Meat",{
meta={goldtype="route",levelreq={50,60}},
items={{7971,2},{13926,2},{7974,40}},
maps={"The Hinterlands"},
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	77.17,61.30	76.67,63.69	75.25,66.52	74.76,70.67	76.93,70.62
path	78.28,68.54	78.37,65.51	79.09,61.95	80.38,59.45	81.70,56.06
path	81.78,52.32	80.30,55.82	79.00,57.73
Kill Snapjaw enemies around this area
collect Big-mouth Clam##7973 |n
use the Big-mouth Clam##7973
collect Black Pearl##7971 |n
collect Golden Pearl##13926 |n
|tip These have a low drop rate.
collect Zesty Clam Meat##7974 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Giant Egg",{
meta={goldtype="route",levelreq={50,60}},
items={{12207,12}},
maps={"Tanaris"},
},[[
step
Kill Roc enemies around this area
|tip They are found all around the zone.
collect Giant Egg##12207 |n |goto Tanaris 49.30,36.17
You can find more around: |notinsticky
[45.55,38.57]
[44.01,40.45]
[47.27,46.81]
]])
