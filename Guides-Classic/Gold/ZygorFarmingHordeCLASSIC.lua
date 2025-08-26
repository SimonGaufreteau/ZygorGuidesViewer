local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("GoldFarmH") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Linen Cloth",{
items={{2589,30}},
},[[
step
Follow the path |goto Orgrimmar 52.00,57.84 < 15 |only if walking
Follow the path down |goto Orgrimmar 56.07,41.08 < 10 |only if walking
Enter the Ragefire Chasm dungeon |goto Orgrimmar 52.75,48.86 < 7 |c
|tip You may need a group for this.
step
Kill Ragefire enemies throughout the dungeon
collect Linen Cloth##2589 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Wool Cloth",{
meta={goldtype="route",levelreq={15,60}},
items={{2592,60}},
maps={"The Barrens"},
},[[
step
Follow the path up |goto The Barrens 62.21,7.28 < 15 |only if walking
Kill Venture Co. enemies around this area
|tip You can find more inside the mine.
collect Wool Cloth##2592 |n |goto The Barrens 60.91,3.82
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
maps={"Mulgore"},
},[[
step
Fish in the open water
collect Raw Brilliant Smallfish##6291 |n |goto Mulgore 48.60,52.66
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Chunk of Boar Meat",{
meta={goldtype="route",levelreq={1,60}},
items={{769,100}},
maps={"Durotar"},
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	46.24,14.08	48.40,14.33	50.51,15.71	52.85,17.40	54.84,19.11
path	55.64,21.23	56.27,24.65	56.55,26.49	56.33,30.28	54.76,33.37
path	53.53,36.24	54.76,39.35	52.82,40.55	51.94,42.55	50.48,43.99
path	48.46,44.47	47.22,43.35	45.66,40.85	45.03,36.20	43.31,33.15
path	41.31,32.48	39.48,33.32	37.75,32.49	36.98,29.96	37.26,26.34
path	37.94,23.38	40.00,20.80	40.35,17.61	42.55,17.05	44.72,17.22
path	45.61,15.87
Kill Boar enemies around this area
collect Chunk of Boar Meat##769 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Small Egg",{
meta={goldtype="route",levelreq={1,60}},
items={{6889,60}},
maps={"Mulgore"},
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	57.20,68.00	58.60,64.20	60.00,59.80	56.60,57.80	57.60,55.00
path	58.40,52.80	57.60,48.60	56.60,45.40	53.80,45.80	51.40,43.00
path	51.00,40.40	52.40,38.20	52.20,34.40	49.20,36.20	47.20,41.60
path	45.40,42.80	42.40,39.60	42.40,43.40	38.00,41.40	35.00,41.40
path	36.60,45.80	41.60,48.60	42.80,53.00	43.60,49.60	46.60,50.20
path	48.09,53.39	51.19,58.92	53.62,62.28
Kill Swoop enemies along this path
collect Small Egg##6889 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Stringy Wolf Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{2672,80}},
maps={"Silverpine Forest"},
},[[
step
map Silverpine Forest
path follow smart; loop on; ants curved; dist 20
path	64.90,7.27	63.14,8.68	61.24,9.07	59.01,9.39	56.46,12.40
path	55.03,13.55	55.37,15.22	54.37,17.49	52.98,20.62	54.78,20.98
path	55.66,17.34	57.17,15.48	58.55,14.33	60.27,13.04	61.93,11.75
path	64.00,11.52	65.79,10.72	67.99,8.47	69.34,5.89	68.36,5.26
path	66.45,5.26
Kill Worg enemies along this path
collect Stringy Wolf Meat##2672 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Slitherskin Mackerel",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6303,160}},
maps={"Durotar"},
},[[
step
Fish in the open water
collect Raw Slitherskin Mackerel##6303 |n |goto Durotar 56.41,10.85
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Meaty Bat Wing",{
meta={goldtype="route",levelreq={5,60}},
items={{12223,80}},
maps={"Tirisfal Glades"},
},[[
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	64.52,58.29	68.11,58.97	70.15,60.79	71.25,63.52	72.94,65.59
path	74.00,67.56	75.53,71.12	77.00,71.91	78.54,72.64	80.23,70.82
path	80.86,69.37	81.43,67.07	80.77,64.43	79.73,62.26	78.26,61.18
path	77.34,58.92	75.89,58.68	74.47,58.56	73.14,59.41	72.26,58.06
path	71.57,55.68	71.47,53.36	71.31,50.97	71.66,48.19	72.37,45.90
path	73.28,43.98	72.95,41.87	72.59,39.15	73.34,37.59	73.67,35.63
path	73.64,33.78	71.70,33.07	69.78,33.42	68.94,35.29	66.23,38.84
path	64.99,41.00	63.82,44.53	63.73,47.67	63.23,49.86	63.49,52.65
path	63.93,55.31
Kill Bat enemies along this path
collect Meaty Bat Wing##12223 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Scorpid Stinger",{
meta={goldtype="route",levelreq={5,60}},
items={{5466,100}},
maps={"Durotar"},
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	55.71,43.99	57.16,43.98	58.12,44.91	58.09,48.54	58.89,50.96
path	56.22,51.84	54.48,53.49	54.37,56.23	54.31,59.37	54.36,61.46
path	54.51,63.85	54.66,66.01	55.50,68.23	56.41,69.98	57.97,72.01
path	57.45,74.19	56.73,76.45	55.27,77.20	53.46,74.65	52.13,74.16
path	52.68,71.08	51.40,67.70	51.79,65.36	51.61,61.69	52.62,60.65
path	52.78,58.81	52.26,56.13	51.76,53.68	52.33,52.11	51.49,48.96
path	52.65,45.64	53.80,45.65
Kill Scorpid enemies along this path
collect Scorpid Stinger##5466 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Coyote Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{2673,60}},
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
Kill Coyote enemies along this path
collect Coyote Meat##2673 |n
'|goto Westfall 38.49,42.87 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	38.49,42.87	35.02,42.09	33.43,38.91	34.38,34.44	36.63,30.63
path	39.81,33.77	42.70,31.93	41.27,26.78	41.83,24.14	42.78,19.23
path	44.81,17.52	47.04,19.68	48.14,25.64	51.15,26.31	53.72,26.55
path	55.99,22.99	58.85,22.18	58.69,26.18	59.20,30.20	61.05,38.49
path	62.45,42.12
Kill Coyote enemies along this path
collect Coyote Meat##2673 |n
'|goto Westfall 62.45,42.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Strider Meat",{
meta={goldtype="route",levelreq={10,60}},
items={{5469,40}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	50.96,33.84	50.83,35.21	51.97,35.71	52.46,36.54	53.32,35.09
path	54.26,32.99	54.44,31.66	53.72,30.07	53.77,28.08	53.65,25.69
path	54.61,23.90	55.67,22.62	56.41,22.14	57.27,22.41	59.45,22.00
path	59.26,20.30	57.93,20.24	56.88,20.58	55.55,20.63	53.98,21.25
path	53.33,18.82	52.45,17.05	52.24,15.14	51.72,13.33	50.04,13.39
path	48.57,13.22	47.25,14.30	48.85,14.14	50.65,16.09	51.04,17.22
path	51.13,19.62	51.56,21.35	51.27,22.82	50.14,22.90	49.10,23.29
path	48.26,24.37	47.22,25.47	46.18,27.62	45.98,30.46	45.05,32.14
path	44.23,34.84	44.88,36.86	44.87,38.28	44.26,39.76	45.05,41.47
path	46.55,43.95	47.19,42.91	49.21,41.46	49.88,39.03	50.32,36.85
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
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Crawler Meat, Crawler Claw",{
meta={goldtype="route",levelreq={10,60}},
items={{2674,40},{2675,48}},
maps={"Darkshore"},
},[[
step
label "Path_One"
map Darkshore
path follow smart; loop off; dist 20
path	35.96,73.13	35.83,71.48	36.59,68.95	36.82,66.80	36.11,65.18
path	36.51,62.47	36.74,60.50	36.04,59.12	36.82,57.15	36.79,54.53
path	36.54,51.15	36.02,48.06	35.72,45.49	35.81,42.27	36.81,38.70
path	36.70,37.48	37.20,36.08	37.26,34.68	40.29,31.37	41.98,32.18
path	42.41,30.58	42.19,28.01	41.82,24.43	42.48,21.08	43.39,21.15
path	44.84,21.63	45.89,20.38	47.44,20.79	48.98,21.11	50.35,21.96
path	52.16,20.84
Kill Crawler enemies along this path
collect Crawler Meat##2674 |n
collect Crawler Claw##2675 |n
'|goto Darkshore 52.16,20.84 < 20 |noway |c
step
map Darkshore
path follow smart; loop off; dist 20
path	52.16,20.84	50.35,21.96	48.98,21.11	47.44,20.79	45.89,20.38
path	44.84,21.63	43.39,21.15	42.48,21.08	41.82,24.43	42.19,28.01
path	42.41,30.58	41.98,32.18	40.29,31.37	37.26,34.68	37.20,36.08
path	36.70,37.48	36.81,38.70	35.81,42.27	35.72,45.49	36.02,48.06
path	36.54,51.15	36.79,54.53	36.82,57.15	36.04,59.12	36.74,60.50
path	36.51,62.47	36.11,65.18	36.82,66.80	36.59,68.95	35.83,71.48
path	35.96,73.13
Kill Crawler enemies along this path
collect Crawler Meat##2674 |n
collect Crawler Claw##2675 |n
'|goto Darkshore 35.96,73.13 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Clam Meat",{
meta={goldtype="route",levelreq={20,60}},
items={{5503,60}},
maps={"Ashenvale"},
},[[
step
Kill enemies around this area
collect Small Barnacled Clam##5523 |n
use the Small Barnacled Clam##5523
collect Clam Meat##5503 |n |goto Ashenvale 11.51,28.67
You can find more around here [13.09,25.61]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Rainbow Fin Albacore",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6361,60}},
maps={"The Barrens"},
},[[
step
Fish in the Open Water
collect Raw Rainbow Fin Albacore##6361 |n |goto The Barrens 63.19,38.19
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raw Longjaw Mud Snapper",{
meta={goldtype="route",skillreq={fishing=1},levelreq={5,60}},
items={{6289,120}},
maps={"Orgrimmar"},
},[[
step
Fish in the Open Water
collect Raw Longjaw Mud Snapper##6289 |n |goto Orgrimmar 69.75,30.12
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
meta={goldtype="route",levelreq={25,60}},
items={{3730,40}},
maps={"Ashenvale"},
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	67.73,62.23	68.83,60.63	69.27,58.70
path	69.88,56.41	71.18,53.99	72.63,51.81	74.28,49.70	74.97,48.67
path	74.99,48.18	73.68,47.08	72.40,48.18	71.65,49.37	70.31,50.39
path	69.21,51.00	67.86,50.22	66.80,48.23	66.33,46.31	65.37,44.10
path	64.04,43.77	62.76,44.57	63.03,46.48	64.54,48.42	63.80,53.72
path	64.12,55.74	64.34,58.42	65.19,59.98	66.42,61.67	65.60,63.39
Kill Bear enemies around this area
collect Big Bear Meat##3730 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Raptor Egg",{
meta={goldtype="route",levelreq={35,60}},
items={{3685,100}},
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
collect Raptor Egg##3685 |n
'|goto Stranglethorn Vale 23.70,15.50 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect Raptor Egg##3685 |n
'|goto Stranglethorn Vale 30.64,25.20 < 20 |noway |c |next "Path_One"
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
meta={goldtype="route",levelreq={25,60}},
items={{5504,60}},
maps={"Hillsbrad Foothills"},
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	23.74,64.84	24.78,66.48	25.16,70.22	27.62,72.13	29.97,72.75
path	32.48,72.00	34.29,68.67	36.49,68.49	39.57,68.88	42.36,68.25
path	44.91,66.23	46.75,64.48	49.03,64.21	51.79,63.89	53.48,64.06
path	54.48,61.39	55.38,62.11	55.73,64.18	57.86,68.24	59.21,72.14
path	61.40,75.49	64.60,77.38	65.64,80.33	66.91,85.51
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Tangy Clam Meat##5504 |n
'|goto Hillsbrad Foothills 66.91,85.51 < 20 |noway |c
step
map Hillsbrad Foothills
path follow smart; loop off; dist 20
path	66.91,85.51	65.64,80.33	64.60,77.38	61.40,75.49	59.21,72.14
path	57.86,68.24	55.73,64.18	55.38,62.11	54.48,61.39	53.48,64.06
path	51.79,63.89	49.03,64.21	46.75,64.48	44.91,66.23	42.36,68.25
path	39.57,68.88	36.49,68.49	34.29,68.67	32.48,72.00	29.97,72.75
path	27.62,72.13	25.16,70.22	24.78,66.48	23.74,64.84
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Tangy Clam Meat##5504 |n
'|goto Hillsbrad Foothills 23.74,64.84 < 20 |noway |c |next "Path_One"
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
items={{6308,44}},
maps={"Orgrimmar"},
},[[
step
Fish in the Open Water
collect Raw Bristle Whisker Catfish##6308 |n |goto Orgrimmar 69.75,30.12
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Farming\\Gooey Spider Leg",{
meta={goldtype="route",levelreq={20,60}},
items={{2251,64}},
maps={"Ashenvale"},
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	31.27,48.10	31.83,50.03	32.77,52.46	34.17,53.58	35.11,55.05
path	35.48,56.68	34.99,58.60	33.81,59.29	32.26,59.26	30.39,58.91
path	29.06,57.28	29.40,55.20	28.00,55.67	27.45,53.31	26.08,51.85
path	24.96,50.29	25.87,46.65	26.74,48.07	28.74,48.35
kill Wildthorn Stalker##3819+
collect Gooey Spider Leg##2251 |n
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
kill Snapjaw##2408+
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
kill Snapjaw##2408+
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
meta={goldtype="route",skillreq={fishing=130},levelreq={20,60}},
items={{8365,80}},
maps={"Desolace"},
},[[
step
Fish in the Open Water
collect Raw Mithril Head Trout##8365 |n |goto Desolace 21.47,74.18
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
collect Raw Sunscale Salmon##13760 |n |goto Feralas 75.58,44.52
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
meta={goldtype="route",levelreq={55,60}},
items={{5635,4}},
maps={"Stonetalon Mountains"},
},[[
step
map Stonetalon Mountains
path follow smart; loop on; ants curved; dist 20
path	30.53,61.76	29.56,62.49	28.35,65.01	28.28,68.00	28.78,71.03
path	29.83,73.09	31.72,73.02	33.54,71.99	35.31,71.79	35.63,68.95
path	36.03,66.45	36.02,64.80	34.83,62.63	33.70,60.85	32.02,60.86
Kill enemies around this area
collect Sharp Claw##5635 |n
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
meta={goldtype="route",levelreq={55,60}},
items={{5635,8}},
maps={"Silverpine Forest"},
},[[
step
Enter the mine |goto Silverpine Forest 35.64,13.54 < 20 |walk
Kill enemies around this area
|tip Inside the mine.
|tip You can find more outside the mine.
collect Small Venom Sac##1475 |n |goto Silverpine Forest 35.38,8.06
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
meta={goldtype="route",levelreq={30,60}},
items={{5635,1}},
maps={"Hillsbrad Foothills"},
},[[
step
label "Path_One"
map Hillsbrad Foothills
path follow smart; loop off; ants curved; dist 20
path	23.74,64.84	24.78,66.48	25.16,70.22	27.62,72.13	29.97,72.75
path	32.48,72.00	34.29,68.67	36.49,68.49	39.57,68.88	42.36,68.25
path	44.91,66.23	46.75,64.48	49.03,64.21	51.79,63.89	53.48,64.06
path	54.48,61.39	55.38,62.11	55.73,64.18	57.86,68.24	59.21,72.14
path	61.40,75.49	64.60,77.38	65.64,80.33	66.91,85.51
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Iridescent Pearl##5500 |n
|tip These have a low drop rate.
'|goto Hillsbrad Foothills 66.91,85.51 < 20 |noway |c
step
map Hillsbrad Foothills
path follow smart; loop off; ants curved; dist 20
path	66.91,85.51	65.64,80.33	64.60,77.38	61.40,75.49	59.21,72.14
path	57.86,68.24	55.73,64.18	55.38,62.11	54.48,61.39	53.48,64.06
path	51.79,63.89	49.03,64.21	46.75,64.48	44.91,66.23	42.36,68.25
path	39.57,68.88	36.49,68.49	34.29,68.67	32.48,72.00	29.97,72.75
path	27.62,72.13	25.16,70.22	24.78,66.48	23.74,64.84
Kill enemies along this path
collect Thick-shelled Clam##5524 |n
use the Thick-shelled Clam##5524
collect Iridescent Pearl##5500 |n
|tip These have a low drop rate.
'|goto Hillsbrad Foothills 23.74,64.84 < 20 |noway |c |next "Path_One"
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
