local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("GoldGathH") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Silverleaf, Peacebloom",{
meta={goldtype="route",skillreq={herbalism=1},levelreq={1,60}},
items={{765,140},{2447,120}},
maps={"Tirisfal Glades"},
},[[
step
map Tirisfal Glades
path follow smart; loop on; ants curved; dist 20
path	51.54,54.24	50.24,56.05	47.60,53.12	45.65,51.89	46.96,47.83
path	44.74,46.19	42.79,42.59	41.45,40.79	39.11,40.30	38.92,43.20
path	38.50,46.14	36.48,47.41	34.54,48.14	32.02,48.17	31.72,50.34
path	33.92,51.19	37.36,51.84	38.60,52.08	39.77,54.03	40.68,58.21
path	40.92,60.80	41.92,63.49	44.02,65.29	46.57,66.37	49.11,67.48
path	50.44,66.83	51.57,64.64	54.10,62.49	56.28,59.15	56.53,55.12
path	53.81,53.15	52.04,54.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect Silverleaf##765 |n
collect Peacebloom##2447 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Earthroot",{
meta={goldtype="route",skillreq={herbalism=15},levelreq={1,60}},
items={{2449,100},{765,100},{2447,100}},
maps={"Mulgore"},
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	35.22,70.19	34.72,69.90	34.64,69.25	35.05,67.37	35.10,65.67
path	35.38,64.19	34.56,61.98	34.63,60.89	35.38,59.65	35.01,57.60
path	35.05,55.60	34.60,54.40	35.32,52.91	35.58,51.19	34.88,50.64
path	33.77,49.73	32.70,49.04	32.14,48.91	31.52,50.19	31.00,49.69
path	31.08,48.09	32.13,47.39	33.51,47.41	34.36,46.94	35.20,44.68
path	34.43,43.11	33.13,43.15	31.31,42.10	31.75,40.60	32.81,40.41
path	33.40,40.69	34.14,40.11	34.71,38.48	34.60,36.52	34.37,34.32
path	33.86,32.15	32.88,30.48	31.85,28.84	29.70,27.05	29.25,25.10
path	29.00,23.41	29.26,20.35	31.05,19.76	31.99,19.31
map Thunder Bluff
path	23.68,3.44
map Mulgore
path	35.83,16.33	37.25,14.62	37.67,13.01	36.13,11.11	36.32,9.79
path	37.09,9.17	37.49,8.53	38.02,6.70	38.55,5.62	40.57,7.25
path	41.31,8.18	43.97,8.03	45.51,7.75	46.82,7.87	49.28,7.68
path	51.05,7.59	51.78,6.21	52.70,5.77	53.38,6.31	53.54,8.26
path	53.54,9.93	54.76,10.71	55.59,11.47	56.19,13.30	56.21,15.43
path	56.29,17.33	56.79,17.57	58.54,19.03	61.01,20.23	61.68,22.64
path	61.70,24.57	61.59,26.52	59.66,28.70	58.69,29.74	57.38,32.58
path	56.76,35.28	56.29,38.79	55.97,41.45	56.40,44.45	57.81,45.95
path	59.46,47.55	60.18,48.65	61.45,49.77	62.52,50.79	62.84,53.00
path	62.45,55.44	64.26,58.39	65.89,62.05	67.11,65.93	66.53,67.72
path	65.00,69.39	62.70,70.68	60.50,70.76	59.01,71.17	57.31,73.31
path	56.02,74.71	55.63,74.45	54.91,73.38	53.42,73.82	52.01,71.26
path	51.02,70.96	49.19,72.26	47.46,72.23	45.51,71.36	44.21,71.55
path	41.73,73.67	39.26,74.40	37.01,73.52
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 15 Herbalism to collect these.
collect Earthroot##2449 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Mageroyal",{
meta={goldtype="route",skillreq={herbalism=50},levelreq={10,60}},
items={{785,24},{2450,12},{2447,30}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.15,37.73	58.67,39.28	59.28,40.67	61.05,41.62	61.87,41.98
path	61.83,43.50	61.73,44.93	62.46,45.59	62.55,47.02	61.37,48.53
path	61.16,49.91	60.17,50.20	58.92,50.02	56.90,50.43	56.86,47.77
path	56.42,45.86	55.99,45.25	56.38,43.40	56.07,41.87	55.04,41.51
path	54.83,42.75	54.03,43.67	53.18,45.13	52.20,45.76	48.47,46.84
path	46.80,43.94	43.45,40.70	43.61,38.41	41.90,37.41	42.70,35.52
path	42.16,33.03	39.72,31.26	39.93,29.78	40.90,27.82	42.44,25.74
path	45.14,25.67	46.02,24.49	45.83,22.32	45.17,21.63	44.47,21.60
path	43.39,20.61	41.18,19.63	40.38,15.78	43.73,15.53	48.89,13.63
path	53.28,14.18	55.37,9.81	57.33,9.22	58.34,7.44	60.18,7.56
path	62.69,8.90	62.42,11.56	62.31,16.47	61.10,19.72	59.62,20.88
path	58.10,21.14	57.12,23.28	58.85,25.07	60.26,28.59	60.58,31.18
path	60.20,34.14	59.26,36.84
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 50 Herbalism to collect these.
collect Mageroyal##785 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Stranglekelp",{
meta={goldtype="route",skillreq={herbalism=85},levelreq={30,60}},
items={{3820,40}},
maps={"Stranglethorn Vale"},
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	27.56,22.38	28.55,26.38	30.37,30.98	33.88,33.36	30.36,35.99
path	27.70,38.32	26.24,42.31	26.20,47.90	22.96,47.20	21.86,51.72
path	22.04,55.91	25.74,57.13	23.90,60.72	23.70,64.65	26.18,68.29
path	23.58,75.22	24.21,79.36	25.98,84.41	31.39,83.70	33.23,80.90
path	34.46,76.56	37.38,68.78	38.81,62.94
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect Stranglekelp##3820 |n
'|goto Stranglethorn Vale 38.81,62.94 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	38.81,62.94	37.38,68.78	34.46,76.56	33.23,80.90	31.39,83.70
path	25.98,84.41	24.21,79.36	23.58,75.22	26.18,68.29	23.70,64.65
path	23.90,60.72	25.74,57.13	22.04,55.91	21.86,51.72	22.96,47.20
path	26.20,47.90	26.24,42.31	27.70,38.32	30.36,35.99	33.88,33.36
path	30.37,30.98	28.55,26.38	27.56,22.38
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip They are underwater along the path.
|tip Bring Water Walking Potions.
|tip You will need level 85 Herbalism to collect these.
collect Stranglekelp##3820 |n
'|goto Stranglethorn Vale 27.56,22.38 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Briarthorn, Swiftthistle",{
meta={goldtype="route",skillreq={herbalism=70},levelreq={1,60}},
items={{2450,24},{2452,40},{2447,28},{785,20},{2449,20}},
maps={"Silverpine Forest"},
},[[
step
label "Path_One"
map Silverpine Forest
path follow smart; loop off; dist 20
path	49.04,32.38	49.42,35.61	49.42,37.96	49.76,40.18	50.52,43.34
path	52.66,43.16	54.51,44.07	52.79,45.65	51.98,49.91	52.04,52.85
path	51.86,56.81	52.43,59.23	51.75,62.42	54.26,63.98	55.27,61.88
path	56.68,60.37	58.05,62.07	56.16,64.50	54.77,66.89	54.34,71.81
path	54.65,74.35	56.82,76.43	59.65,77.20	61.93,77.46	64.26,78.75
path	66.96,79.79
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect Briarthorn##2450 |n
collect Swiftthistle##2452 |n
'|goto Silverpine Forest 66.96,79.79 < 20 |noway |c
step
map Silverpine Forest
path follow smart; loop off; dist 20
path	66.96,79.79	64.26,78.75	61.93,77.46	59.65,77.20	56.82,76.43
path	54.65,74.35	54.34,71.81	54.77,66.89	56.16,64.50	58.05,62.07
path	56.68,60.37	55.27,61.88	54.26,63.98	51.75,62.42	52.43,59.23
path	51.86,56.81	52.04,52.85	51.98,49.91	52.79,45.65	54.51,44.07
path	52.66,43.16	50.52,43.34	49.76,40.18	49.42,37.96	49.42,35.61
path	49.04,32.38
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect Briarthorn##2450 |n
collect Swiftthistle##2452 |n
'|goto Silverpine Forest 49.04,32.38 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Bruiseweed",{
meta={goldtype="route",skillreq={herbalism=100},levelreq={20,60}},
items={{2453,32}},
maps={"Ashenvale"},
},[[
step
label "Bruiseweed_1"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect Bruiseweed##2453 |n
'|goto Ashenvale 74.94,73.92 < 20 |noway |c
step
map Ashenvale
path follow smart; loop off; dist 20
path	74.94,73.92	71.98,73.86	69.78,74.49	60.56,73.42	59.14,70.90
path	57.82,64.38	56.36,63.51	54.29,60.93	49.98,59.22	48.42,60.26
path	47.09,61.20	43.85,63.15	41.82,64.95	39.97,65.16	40.48,61.75
path	38.06,62.62	34.71,59.96	32.71,59.66	34.85,58.62	35.41,56.86
path	34.66,54.20	28.38,54.47	25.72,50.64	27.77,48.81	30.47,44.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 100 Herbalism to collect these.
collect Bruiseweed##2453 |n
'|goto Ashenvale 30.47,44.71 < 20 |noway |c |next "Bruiseweed_1"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Wild Steelbloom",{
meta={goldtype="route",skillreq={herbalism=115},levelreq={30,60}},
items={{3355,40}},
maps={"Stranglethorn Vale"},
},[[
step
map Stranglethorn Vale
path follow smart; loop on; ants curved; dist 20
path	35.19,24.89	34.15,16.96	32.35,17.29	29.81,16.22	28.04,17.47
path	25.80,17.04	23.47,14.43	23.84,13.79	26.85,13.53	26.47,10.74
path	26.96,10.08	26.83,8.41	28.93,7.53	31.07,9.11	33.66,7.50
path	35.36,6.91	37.47,8.17	40.26,7.17	42.31,8.80	43.43,9.07
path	44.02,6.96	46.87,7.20	49.23,10.26	46.15,12.93	46.18,15.78
path	48.55,20.93	49.87,26.32	48.46,42.77	46.45,44.95	42.29,44.37
path	39.61,44.79	38.13,35.79
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 115 Herbalism to collect these.
collect Wild Steelbloom##3355 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Grave Moss",{
meta={goldtype="route",skillreq={herbalism=120},levelreq={35,60}},
items={{3369,20}},
maps={"Desolace"},
},[[
step
Click herbs around this area
|tip Track them on your minimap with "Find Herbs".
|tip They spawn in this small area.
|tip You will need level 120 Herbalism to collect these.
collect Grave Moss##3369 |n |goto Desolace 54.10,61.43
You can find more around this area [50.23,57.64]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Kingsblood",{
meta={goldtype="route",skillreq={herbalism=125},levelreq={20,60}},
items={{3356,48}},
maps={"Wetlands"},
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 125 Herbalism to collect these.
collect Kingsblood##3356 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Liferoot",{
meta={goldtype="route",skillreq={herbalism=150},levelreq={20,60}},
items={{3357,20}},
maps={"Wetlands"},
},[[
step
label "Path_One"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect Liferoot##3357 |n
'|goto Wetlands 63.29,74.88 < 20 |noway |c
step
map Wetlands
path follow smart; loop off; dist 20
path	63.29,74.88	64.42,68.06	61.97,56.83	59.97,50.83	55.96,45.32
path	53.92,41.52	50.85,37.60	44.42,36.02	42.39,32.16	39.88,29.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 150 Herbalism to collect these.
collect Liferoot##3357 |n
'|goto Wetlands 39.88,29.56 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Fadeleaf",{
meta={goldtype="route",skillreq={herbalism=160},levelreq={20,60}},
items={{3818,60}},
maps={"Swamp of Sorrows"},
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	20.50,54.53	16.62,58.22	15.71,65.71	12.68,68.05	10.73,63.62
path	12.41,55.83	15.50,47.83	18.39,45.92	22.07,39.95	28.92,38.70
path	33.28,38.90	38.62,34.97	47.12,33.93	51.82,34.91	51.62,41.06
path	44.78,45.30	37.49,50.34	33.07,52.19	27.05,54.68	22.47,57.13
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip Watch out for horde guards along the main road.
|tip You will need level 160 Herbalism to collect these.
collect Fadeleaf##3818 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Goldthorn, Khadgar's Whisker",{
meta={goldtype="route",skillreq={herbalism=170},levelreq={30,60}},
items={{3821,60},{3358,32}},
maps={"Stranglethorn Vale"},
},[[
step
label "Path_One"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.73,67.93	31.34,65.94	31.29,63.30	33.47,59.16	34.72,58.50
path	35.99,56.40	34.16,54.11	33.67,52.84	34.22,50.55	35.98,48.96
path	36.98,48.70	39.98,44.91	40.43,43.96	40.36,42.07	41.34,40.39
path	43.07,37.30	43.31,39.18	43.52,40.25	44.37,39.85	44.49,41.37
path	44.53,43.67	45.58,43.90	46.54,43.36	47.13,43.87	47.84,42.42
path	47.79,40.43	49.03,37.60	48.82,36.22	49.70,31.42	49.45,29.64
path	50.03,27.63	50.56,26.44	49.98,23.97	47.47,22.67	46.33,24.57
path	44.74,25.50	43.42,26.50	40.87,28.82	40.14,32.21	38.73,33.10
path	36.97,34.22	36.66,38.10	36.42,41.03	34.95,40.76	33.81,39.53
path	31.73,42.03	30.29,43.54	28.79,44.84	28.04,47.89	27.69,50.35
path	29.34,52.92	29.92,54.14	31.79,52.55
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect Goldthorn##3821 |n
collect Khadgar's Whisker##3358 |n
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 170 Herbalism to collect these.
collect Goldthorn##3821 |n
collect Khadgar's Whisker##3358 |n
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Wintersbite",{
meta={goldtype="route",skillreq={herbalism=195},levelreq={30,60}},
items={{3819,40}},
maps={"Alterac Mountains"},
},[[
step
label "Path_One"
map Alterac Mountains
path follow smart; loop off; dist 20
path	36.21,70.12	38.50,71.59	42.34,67.24	40.46,63.73	45.07,62.49
path	49.57,60.07	50.10,56.20	49.14,51.29	45.91,45.67	47.02,42.14
path	46.73,38.06	44.90,32.01
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 195 Herbalism to collect these.
collect Wintersbite##3819 |n
'|goto Alterac Mountains 44.90,32.01 < 20 |noway |c
step
map Alterac Mountains
path follow smart; loop off; dist 20
path	44.90,32.01	46.73,38.06	47.02,42.14	45.91,45.67	49.14,51.29
path	50.10,56.20	49.57,60.07	45.07,62.49	40.46,63.73	42.34,67.24
path	38.50,71.59	36.21,70.12
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 195 Herbalism to collect these.
collect Wintersbite##3819 |n
'|goto Alterac Mountains 36.21,70.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Wildvine",{
meta={goldtype="route",skillreq={herbalism=210},levelreq={45,60}},
items={{8153,20}},
maps={"The Hinterlands"},
},[[
step
Kill Vilebranch Enemies around this area
collect Wildvine##8153 |n |goto The Hinterlands 47.57,66.46
|tip They have a 10% chance to be gathered from Purple Lotus around the Altar.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 210 Herbalism to collect these.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Firebloom",{
meta={goldtype="route",skillreq={herbalism=205},levelreq={45,60}},
items={{4625,60}},
maps={"Blasted Lands"},
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 205 Herbalism to collect these.
collect Firebloom##4625 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Purple Lotus",{
meta={goldtype="route",skillreq={herbalism=210},levelreq={45,60}},
items={{8831,48}},
maps={"Azshara"},
},[[
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	13.44,76.03	13.49,73.41	13.96,72.13	15.04,72.61	16.67,72.10
path	18.11,69.50	19.30,63.70	19.72,61.12	21.39,60.74	24.79,58.76
path	25.63,56.77	25.97,53.77	24.66,50.64	25.95,49.40	27.49,50.93
path	29.47,52.59	30.30,54.30	32.31,55.35	32.55,57.96	31.89,60.78
path	34.71,61.62	35.79,60.81	36.20,59.43	36.50,57.60	38.27,56.97
path	38.93,60.17	38.62,62.10	37.62,63.76	37.16,67.40	36.65,71.52
path	36.55,73.48	35.12,76.04	32.98,79.88	31.50,80.61	28.68,80.41
path	25.35,79.42	24.06,79.46	19.93,77.32	18.50,79.02	16.39,79.69
path	14.67,79.40
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 210 Herbalism to collect these.
collect Purple Lotus##8831 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Arthas' Tears",{
meta={goldtype="route",skillreq={herbalism=220},levelreq={50,60}},
items={{8836,20}},
maps={"Western Plaguelands"},
},[[
step
map Western Plaguelands
path follow smart; loop on; ants curved; dist 20
path	38.46,71.59	40.21,70.25	41.92,68.36	43.65,67.66	43.55,64.99
path	42.58,61.73	44.99,61.15	45.83,59.71	47.54,60.16	48.88,62.22
path	50.20,63.25	51.12,65.36	51.20,68.70	52.77,69.69	54.81,66.60
path	55.29,62.85	56.78,59.81	58.67,58.12	58.67,58.12	61.36,51.95
path	59.63,51.59	56.24,51.02	55.02,49.73	53.44,46.46	51.12,44.12
path	49.07,42.44	46.93,39.92	46.45,37.04	47.66,35.14	49.62,33.23
path	48.75,31.25	48.00,31.04	46.53,31.70	44.60,32.62	43.64,35.30
path	44.60,37.79	45.12,41.59	45.73,46.00	45.79,47.79	43.94,50.26
path	40.48,52.81	39.18,52.53	38.68,53.52	35.80,54.28	34.28,55.75
path	33.16,57.76	33.14,59.71	32.83,61.21	33.06,63.79	34.28,66.60
path	36.12,68.62	37.31,71.53
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 220 Herbalism to collect these.
collect Arthas' Tears##8836 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Sungrass, Firebloom",{
meta={goldtype="route",skillreq={herbalism=230},levelreq={45,60}},
items={{8838,40},{4625,32}},
maps={"Blasted Lands"},
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 230 Herbalism to collect these.
collect Sungrass##8838 |n
collect Firebloom##4625 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Blindweed, Fadeleaf",{
meta={goldtype="route",skillreq={herbalism=235},levelreq={35,60}},
items={{8839,60},{3818,60}},
maps={"Swamp of Sorrows"},
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	23.34,47.48	26.00,39.24	28.21,37.10	31.38,35.00	36.11,36.48
path	38.30,35.54	40.98,35.26	42.49,39.06	44.13,40.53	46.07,41.10
path	46.56,38.70	49.85,36.00	52.70,36.48	54.71,36.25	57.38,33.20
path	58.78,30.30	62.57,29.33	66.36,28.36	68.29,25.21	69.20,20.52
path	69.38,15.92	72.73,13.20	76.51,14.32	78.04,18.24	81.03,21.94
path	82.49,25.63	82.43,31.77	82.80,37.29	86.93,38.06	88.09,44.02
path	88.14,49.77	85.09,53.96	86.43,57.71	84.56,62.68	84.28,67.90
path	81.40,71.41	78.10,69.78	76.69,64.12	78.72,58.47	80.88,55.22
path	81.42,48.27	81.70,43.61	79.06,40.69	77.48,38.74	76.64,34.28
path	73.75,33.11	70.93,33.86	68.69,31.71	65.67,35.50	61.30,37.56
path	58.02,38.46	54.71,41.87	53.10,42.33	49.93,42.29	47.27,43.26
path	44.52,45.19	42.66,47.65	39.83,49.22	36.79,51.04	33.83,51.96
path	29.04,54.25
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 235 Herbalism to collect these.
collect Blindweed##8839 |n
collect Fadeleaf##3818 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Ghost Mushroom, Wildvine",{
meta={goldtype="route",skillreq={herbalism=245},levelreq={45,60}},
items={{8845,28},{8153,20}},
maps={"The Hinterlands"},
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	57.75,46.26	59.21,44.51	59.83,40.90	57.54,38.67	55.82,38.52
path	54.48,40.89	54.34,43.82	55.65,46.02
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 245 Herbalism to collect these.
|tip They spawn inside of the cave along this path as well as outside of it.
collect Ghost Mushroom##8845 |n
collect Wildvine##8153 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Gromsblood, Sungrass, Firebloom",{
meta={goldtype="route",skillreq={herbalism=250},levelreq={45,60}},
items={{8846,28},{8838,40},{4625,32}},
maps={"Blasted Lands"},
},[[
step
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 250 Herbalism to collect these.
collect Gromsblood##8846 |n
collect Sungrass##8838 |n
collect Firebloom##4625 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Golden Sansam, Dreamfoil",{
meta={goldtype="route",skillreq={herbalism=260},levelreq={45,60}},
items={{13464,40},{13463,28}},
maps={"Azshara"},
},[[
step
map Azshara
path follow smart; loop on; ants curved; dist 20
path	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97	44.61,20.55
path	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45	53.43,20.10
path	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89	64.79,17.01
path	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69	75.86,21.19
path	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54	74.71,29.28
path	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93	61.47,23.67
path	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17	49.37,31.47
path	46.94,31.71
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 260 Herbalism to collect these.
collect Golden Sansam##13464 |n
collect Dreamfoil##13463 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Mountain Silversage",{
meta={goldtype="route",skillreq={herbalism=280},levelreq={50,60}},
items={{13465,20}},
maps={"Un'Goro Crater"},
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	69.50,80.51	66.73,78.96	62.06,80.45	60.17,83.38	57.90,84.92
path	56.43,85.63	52.59,86.79	50.45,85.64	47.59,86.84	44.06,85.48
path	40.43,83.69	37.58,82.20	36.74,80.02	34.35,78.80	30.60,79.47
path	29.81,78.29	29.45,73.80	29.51,71.95	30.47,70.66	30.12,68.78
path	26.87,68.47	26.22,63.87	24.35,55.86	24.60,51.19	24.66,49.08
path	24.29,47.04	24.87,40.95	26.12,37.25	26.47,32.27	28.16,29.95
path	29.28,30.78	30.53,29.41	29.59,24.96	30.56,20.83	33.11,20.72
path	34.48,21.20	36.41,20.34	38.57,16.60	42.23,16.10	44.74,14.15
path	48.26,13.20	49.78,17.80	51.76,16.54	52.14,13.12	54.40,13.42
path	56.79,14.48	59.79,16.53	62.08,16.53	63.95,19.36	65.85,21.43
path	66.83,23.10	67.79,22.98	68.24,20.16	70.91,20.97	71.45,25.67
path	71.86,28.59	74.60,32.13	74.81,36.14	76.10,40.85	76.77,46.27
path	76.23,50.57	76.85,54.91	75.63,60.70	74.66,64.47	74.30,69.24
path	71.82,70.72	70.92,71.71	71.15,74.12	70.59,75.37	70.92,79.06
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 280 Herbalism to collect these.
collect Mountain Silversage##13465 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Plaguebloom",{
meta={goldtype="route",skillreq={herbalism=285},levelreq={50,60}},
items={{13466,20},{13463,16}},
maps={"Eastern Plaguelands"},
},[[
step
map Eastern Plaguelands
path follow smart; loop on; ants curved; dist 20
path	63.32,54.67	67.59,55.28	72.06,54.50	75.06,53.69	77.43,53.29
path	78.36,55.80	79.17,59.16	80.07,63.69	80.31,67.80	78.88,71.68
path	76.88,73.45	75.52,74.46	74.76,76.67	72.94,78.41	68.81,75.52
path	66.81,76.30	65.03,73.91	64.71,69.43	63.81,66.25	63.25,64.01
path	63.98,59.07
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 285 Herbalism to collect these.
collect Plaguebloom##13466 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Icecap",{
meta={goldtype="route",skillreq={herbalism=285},levelreq={50,60}},
items={{13467,28},{13465,12}},
maps={"Winterspring"},
},[[
step
map Winterspring
path follow smart; loop on; ants curved; dist 20
path	51.15,36.38	49.02,37.97	47.29,38.82	46.26,37.85	44.98,36.98
path	43.34,37.35	42.00,36.66	40.04,36.95	37.55,36.29	37.03,38.50
path	37.04,40.67	36.22,41.42	34.89,40.49	32.81,37.93	31.53,36.07
path	29.97,36.02	29.97,39.23	29.90,42.23	30.63,44.36	31.61,44.78
path	32.31,44.29	34.16,43.86	34.79,42.97	35.73,43.41	36.55,44.20
path	37.95,44.18	40.05,43.83	41.97,43.60	43.29,44.09	44.44,42.87
path	45.25,41.37	45.82,40.53	46.38,39.95	47.29,40.48	48.43,42.60
path	49.89,44.73	50.67,45.63	52.44,46.41	53.08,44.56	53.42,43.72
path	55.09,43.38	56.62,42.13	57.86,40.63	58.81,39.07	58.04,36.73
path	56.38,36.22	54.08,33.77
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 290 Herbalism to collect these.
collect Icecap##13467 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Black Lotus",{
meta={goldtype="route",skillreq={herbalism=285},levelreq={50,60}},
items={{13468,4}},
maps={"Burning Steppes"},
},[[
step
label "Path_One"
map Burning Steppes
path follow smart; loop off; dist 20
path	75.56,48.10	67.51,44.35	65.55,42.14	64.07,37.82	63.48,37.82
path	60.30,40.06	49.65,36.46	46.29,34.47	43.06,33.76	41.88,37.36
path	41.46,40.03	42.68,42.14	42.11,43.86	39.76,44.39	35.84,48.89
path	33.34,55.11	31.73,57.80	27.13,61.16	25.14,54.29	22.87,50.09
path	18.10,44.02	15.47,40.51	15.42,34.23	15.35,30.51
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 300 Herbalism to collect these.
collect Black Lotus##13468 |n
|tip These are extremely rare.
|tip Pick other herbs on the path to have a chance to spawn them.
'|goto Burning Steppes 15.35,30.51 < 20 |noway |c
step
map Burning Steppes
path follow smart; loop off; dist 20
path	15.35,30.51	15.42,34.23	15.47,40.51	18.10,44.02	22.87,50.09
path	25.14,54.29	27.13,61.16	31.73,57.80	33.34,55.11	35.84,48.89
path	39.76,44.39	42.11,43.86	42.68,42.14	41.46,40.03	41.88,37.36
path	43.06,33.76	46.29,34.47	49.65,36.46	60.30,40.06	63.48,37.82
path	64.07,37.82	65.55,42.14	67.51,44.35	75.56,48.10
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 300 Herbalism to collect these.
collect Black Lotus##13468 |n
|tip These are extremely rare.
|tip Pick other herbs on the path to have a chance to spawn them.
'|goto Burning Steppes 75.56,48.10 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Copper Ore, Rough Stone",{
meta={goldtype="route",skillreq={mining=1},levelreq={1,60}},
items={{2770,160},{2835,100}},
maps={"Durotar"},
},[[
step
map Durotar
path follow smart; loop on; ants curved; dist 20
path	50.96,17.00	52.99,18.09	54.60,19.05	55.40,21.06	55.71,23.38
path	56.28,25.33	55.89,27.78	54.64,27.62	55.10,30.09	58.12,29.94
path	55.62,32.75	55.97,36.63	55.71,40.53	57.32,42.00	59.26,41.50
path	57.59,43.98	55.27,48.14	50.81,48.20	48.51,43.33	47.83,39.78
path	46.87,34.69	45.55,32.24	45.61,27.19	46.52,23.35	48.07,21.59
path	49.70,21.37	49.54,18.59
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
collect Rough Stone##2835 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Silver Ore, Tin Ore, Coarse Stone, Moss Agate",{
meta={goldtype="route",skillreq={mining=65},levelreq={30,60}},
items={{2775,12},{2771,60},{2836,48},{2770,100},{2835,52}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	59.10,40.30	60.19,40.99	61.84,40.54	62.14,43.04	62.65,46.75
path	61.30,50.02	60.46,50.11	58.76,50.43	56.82,51.16	55.42,52.22
path	53.50,52.61	53.16,56.18	51.94,57.54	50.38,58.57	49.34,61.86
path	47.74,65.34	49.23,69.53	48.13,71.47	48.25,74.69	49.98,75.97
path	49.97,78.84	48.59,80.24	48.26,82.33	46.66,83.76	46.10,86.08
path	44.27,84.64	42.70,82.63	41.20,79.51	44.09,78.36	43.80,75.03
path	43.88,73.08	42.35,72.24	41.90,68.97	43.39,69.35	45.54,68.99
path	45.03,65.70	43.83,62.98	43.15,60.77	43.09,56.64	43.61,52.80
path	41.37,48.89	42.58,47.61	41.37,44.96	43.42,44.79	43.15,42.53
path	43.28,39.61	42.28,38.89	41.58,37.21	42.55,35.50	42.04,33.21
path	45.13,32.85	46.58,30.52	46.71,28.37	48.20,28.72	49.48,31.40
path	50.44,34.37	52.43,34.60	56.90,37.50	58.56,39.33
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect Tin Ore and 75 to collect Silver Ore.
collect Silver Ore##2775 |n
collect Tin Ore##2771 |n
collect Coarse Stone##2836 |n
collect Moss Agate##1206 |n
|tip These are a rare drop from Tin and Silver Ore.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Iron Ore, Gold Ore, Heavy Stone",{
meta={goldtype="route",skillreq={mining=125},levelreq={30,60}},
items={{2772,100},{2776,12},{2838,80}},
maps={"Arathi Highlands"},
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	78.66,36.13	77.36,41.29	75.00,44.93	72.65,48.07	70.58,55.05
path	69.99,58.40	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15
path	69.15,72.54	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74
path	56.16,71.89	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16
path	40.39,71.86	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64
path	33.70,56.77	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68
path	31.68,45.41	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12
path	20.02,35.80	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65
path	28.65,14.18	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23
path	36.35,24.61	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02
path	48.08,33.60	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13
path	58.19,32.50	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58
path	64.49,26.56	66.77,27.64	70.39,27.07	70.47,30.74	72.89,30.09
path	76.73,29.48	76.70,33.68	79.56,35.45
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect Iron Ore and 155 to collect Gold Ore.
collect Iron Ore##2772 |n
collect Gold Ore##2776 |n
collect Heavy Stone##2838 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Mithril Ore, Truesilver Ore, Solid Stone",{
meta={goldtype="route",skillreq={mining=175},levelreq={40,60}},
items={{3858,100},{7911,12},{7912,60},{2772,40}},
maps={"Badlands"},
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect Mithril Ore and 230 to collect Truesilver Ore.
collect Mithril Ore##3858 |n
collect Truesilver Ore##7911 |n
collect Solid Stone##7912 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Dark Iron Ore",{
meta={goldtype="route",skillreq={mining=230},levelreq={50,60}},
items={{11370,40},{10620,12},{12365,12},{3858,16},{7912,28}},
maps={"Burning Steppes"},
},[[
step
map Burning Steppes
path follow smart; loop on; ants curved; dist 20
path	47.24,33.58	57.79,36.68	60.09,40.49	60.24,30.28	62.87,24.54
path	64.47,23.32	65.45,24.20	64.95,33.28	71.55,39.13	79.50,25.16
path	93.16,52.72	85.24,62.18	74.63,61.27	74.12,55.90	68.15,59.00
path	64.92,57.85	62.02,54.94	47.51,59.50	43.25,60.21
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
|tip These are a rare spawn.
|tip However, they can be found more consistently inside the Blackrock Depths dungeon and Molten Core raid.
collect Dark Iron Ore##11370 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Thorium Ore, Dense Stone",{
meta={goldtype="route",skillreq={mining=245},levelreq={50,60}},
items={{10620,20},{12365,28}},
maps={"Un'Goro Crater"},
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	66.46,78.95	64.56,79.71	61.79,84.21	59.34,84.18	57.63,86.04
path	54.50,86.69	51.13,86.82	48.27,87.30	45.98,86.58	42.89,85.00
path	40.79,83.52	37.91,83.14	36.77,80.17	33.58,79.05	30.40,79.61
path	28.89,76.98	28.97,71.52	26.00,67.67	25.93,63.53	24.59,58.51
path	23.95,53.04	24.40,48.21	23.89,44.76	24.71,41.12	26.26,36.59
path	26.62,31.21	28.29,29.47	29.59,25.66	29.89,20.92	33.32,20.67
path	36.29,20.47	38.67,16.00	41.73,15.77	43.32,14.12	46.94,13.03
path	49.79,13.83	52.84,12.88	56.31,14.04	59.61,16.58	62.25,16.02
path	64.19,19.90	65.99,21.01	68.51,20.26	71.19,20.89	71.21,23.75
path	71.75,28.19	74.76,32.46	75.06,37.15	76.32,43.15	76.67,48.32
path	77.05,53.09	76.56,57.02	75.35,61.97	74.66,68.05	72.92,70.46
path	71.39,73.80	71.00,79.21	68.32,79.90
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 245 Mining to collect these.
collect Thorium Ore##10620 |n
collect Dense Stone##12365 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Guardian Stone",{
meta={goldtype="route",levelreq={60,60}},
items={{12809,8}},
maps={"Un'Goro Crater"},
},[[
step
map Un'Goro Crater
path follow smart; loop on; ants curved; dist 20
path	40.24,18.78	37.48,20.20	33.48,23.57	40.40,25.92	43.96,29.92
path	44.56,36.72	43.43,40.74	44.16,43.79	48.24,41.64	51.27,39.78
path	56.65,39.87	54.16,36.20	55.85,31.39	57.79,26.10	56.20,21.10
path	56.97,14.88	53.59,13.78	51.39,17.24	48.13,13.45
Kill Stone Guardians as you follow the path around this area
|tip These are level 60-61 Elite enemies.
collect Guardian Stone##12809 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Elementium Ore",{
hideif=not ZGV.IsClassicSoM
},[[
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98 < 7 |walk
Run up the chain |goto Eastern Kingdoms 48.73,63.79 < 5 |walk
Jump down here |goto Eastern Kingdoms 48.77,63.67 < 5 |walk
Follow the path up |goto Eastern Kingdoms 48.83,63.66 < 5 |walk
Enter the building |goto Eastern Kingdoms 48.91,63.92 < 5 |walk
click Orb of Command##179879 |goto Eastern Kingdoms 48.92,64.47
Teleport to Blackwing Lair |goto Blackwing Lair 0.00,0.00 < 1000 |noway |c
|tip You must be attuned to enter the raid.
step
Inside the Blackwing Lair Raid:
kill Blackwing Technician##13996+
collect Elementium Ore##18562 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Strange Dust",{
},[[
step
Disenchant level 5-20 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Small Glimmering Shards instead of Strange Dust.
collect Strange Dust##10940 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lesser Magic Essence",{
},[[
step
Disenchant level 3-12 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Strange Dust instead of Lesser Magic Essence.
collect Lesser Magic Essence##10938 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Greater Magic Essence",{
},[[
step
Disenchant level 9-21 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Strange Dust instead of Greater Magic Essence.
|tip You can turn 3 Lesser Magic Essences into a Greater Magic Essence.
collect Greater Magic Essence##10939 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lesser Eternal Essence",{
},[[
step
Disenchant level 40-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Dream Dust instead of Lesser Eternal Essence.
collect Lesser Eternal Essence##16202 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Greater Eternal Essence",{
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Illusion Dust instead of Greater Eternal Essence.
|tip You can turn 3 Lesser Eternal Essences into a Greater Eternal Essence.
collect Greater Eternal Essence##16203 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Small Brilliant Shard",{
},[[
step
Disenchant level 38-50 blue and green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Dream Dust instead of Small Brilliant Shards.
collect Small Brilliant Shard##14343 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Large Brilliant Shard",{
},[[
step
Disenchant level 50-58 blue weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may very rarely get Nexus Crystals instead of Large Brilliant Shards.
collect Large Brilliant Shard##14344 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Illusion Dust",{
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
|tip You may sometimes get Greater Eternal Essence instead of Illusion Dust.
collect Illusion Dust##16204 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lesser Astral Essence",{
},[[
step
Disenchant level 20-25 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Astral Essence##10998 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Greater Astral Essence",{
},[[
step
Disenchant level 20-30 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Astral Essence##11082 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Soul Dust",{
},[[
step
Disenchant level 25-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Soul Dust##11083 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lesser Mystic Essence",{
},[[
step
Disenchant level 30-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Mystic Essence##11134 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Greater Mystic Essence",{
},[[
step
Disenchant level 35-40 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Mystic Essence##11135 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Vision Dust",{
},[[
step
Disenchant level 35-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Vision Dust##11137 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Dream Dust",{
},[[
step
Disenchant level 45-55 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Dream Dust##11176 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Greater Nether Essence",{
},[[
step
Disenchant level 45-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Greater Nether Essence##11175 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Lesser Nether Essence",{
},[[
step
Disenchant level 40-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House.
collect Lesser Nether Essence##11174 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Green Whelp Scale, Heavy Leather, Medium Leather",{
meta={goldtype="route",skillreq={skinning=170},levelreq={35,60}},
items={{7392,28},{4234,44},{2319,36}},
maps={"Swamp of Sorrows"},
},[[
step
Kill Whelp enemies around this area
|tip Skin their corpses.
|tip You will need level 170 Skinning to collect these.
collect Green Whelp Scale##7392 |n |goto Swamp of Sorrows 13.29,64.20
|tip These have a low drop rate.
collect Heavy Leather##4234 |n |goto Swamp of Sorrows 13.29,64.20
collect Medium Leather##2319 |n |goto Swamp of Sorrows 13.29,64.20
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Black Whelp Scale, Light Leather",{
meta={goldtype="route",skillreq={skinning=70},levelreq={15,60}},
items={{7286,66},{2318,120}},
maps={"Redridge Mountains"},
},[[
step
kill Black Dragon Whelp##441+
|tip Skin their corpses.
|tip You will need level 70 Skinning to collect these.
collect Black Whelp Scale##7286 |n |goto Redridge Mountains 34.85,69.67
|tip These have a low drop rate.
collect Light Leather##2318 |n |goto Redridge Mountains 34.85,69.67
You can find more around: |notinsticky
[29.64,74.26]
[46.74,77.01]
[57.29,75.08]
[66.62,76.17]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Light Leather, Ruined Leather Scraps",{
meta={goldtype="route",skillreq={skinning=1},levelreq={5,60}},
items={{2318,60},{2934,80}},
maps={"Durotar"},
},[[
step
Kill enemies around this area
|tip Skin their corpses.
collect Light Leather##2318 |n |goto Durotar 43.89,17.49
collect Ruined Leather Scraps##2934 |n |goto Durotar 43.89,17.49
You can find more around [39.47,17.22]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Thin Kodo Leather",{
meta={goldtype="route",levelreq={10,60}},
items={{5082,20}},
maps={"Mulgore"},
},[[
step
map Mulgore
path follow smart; loop on; ants curved; dist 20
path	36.83,37.11	40.70,41.79	47.76,36.77	51.48,25.17	49.44,17.26
path	43.79,16.61	35.19,17.28	31.28,20.42	34.20,31.05
Kill Kodo enemies as you follow the path around this area
collect Thin Kodo Leather##5082 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Light Hide, Light Leather",{
meta={goldtype="route",skillreq={skinning=100},levelreq={20,60}},
items={{783,8},{2318,52},{2319,36}},
maps={"The Barrens"},
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	48.32,63.77	46.77,67.86	47.33,72.51	48.23,76.23	48.03,80.88
path	44.76,80.45	44.63,73.81	45.67,69.12	45.20,64.63	46.23,61.11
Kill enemies as you follow the path around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 100 Skinning to collect these.
collect Light Hide##783 |n
|tip These have a low drop rate.
collect Light Leather##2318 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Slimy Murloc Scale",{
meta={goldtype="route",levelreq={16,60}},
items={{5784,32}},
maps={"Silverpine Forest"},
},[[
step
Kill Vile Fin enemies around this area
collect Slimy Murloc Scale##5784 |n |goto Silverpine Forest 78.30,30.76
You can find more around: |notinsticky
[80.06,28.45]
[73.54,17.09]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Medium Leather, Heavy Leather",{
meta={goldtype="route",skillreq={skinning=155},levelreq={30,60}},
items={{2319,80},{4234,48}},
maps={"Hillsbrad Foothills"},
},[[
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect Medium Leather##2319 |n |goto Hillsbrad Foothills 46.12,31.76
collect Heavy Leather##4234 |n |goto Hillsbrad Foothills 46.12,31.76
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Medium Hide, Medium Leather, Light Leather",{
meta={goldtype="route",skillreq={skinning=115},levelreq={20,60}},
items={{4232,8},{2319,48},{2318,40}},
maps={"Stonetalon Mountains"},
},[[
step
kill Blackened Basilisk##4044+
|tip Skin their corpses.
|tip You will need level 115 Skinning to collect these.
collect Medium Hide##4232 |n |goto Stonetalon Mountains 44.88,41.82
|tip These have a low drop rate.
collect Medium Leather##2319 |n |goto Stonetalon Mountains 44.88,41.82
collect Light Leather##2318 |n |goto Stonetalon Mountains 44.88,41.82
You can find more around [36.49,48.50]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Heavy Leather",{
meta={goldtype="route",skillreq={skinning=185},levelreq={35,60}},
items={{4234,100}},
maps={"Dustwallow Marsh"},
},[[
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 185 Skinning to collect these.
collect Heavy Leather##4234 |n |goto Dustwallow Marsh 40.73,58.37
You can find more around: |notinsticky
[43.35,50.06]
[40.42,41.57]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Raptor Hide",{
meta={goldtype="route",levelreq={35,60}},
items={{4461,40}},
maps={"Arathi Highlands"},
},[[
step
Kill Highland enemies around this area
collect Raptor Hide##4461 |n |goto Arathi Highlands 52.39,67.61
You can find more around [47.28,78.85]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Heavy Hide, Heavy Leather, Thick Leather",{
meta={goldtype="route",skillreq={skinning=205},levelreq={40,60}},
items={{4235,8},{4234,60},{4304,40}},
maps={"The Hinterlands"},
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Heavy Hide##4235 |n |goto The Hinterlands 16.19,50.97
|tip These have a low drop rate.
collect Heavy Leather##4234 |n |goto The Hinterlands 16.19,50.97
collect Thick Leather##4304 |n |goto The Hinterlands 16.19,50.97
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Turtle Scale, Heavy Leather, Thick Leather",{
meta={goldtype="route",skillreq={skinning=210},levelreq={40,60}},
items={{8167,66},{4234,60},{4304,56}},
maps={"Tanaris"},
},[[
step
kill Steeljaw Snapper##14123+
|tip Skin their corpses.
|tip You will need level 210 Skinning to collect these.
collect Turtle Scale##8167 |n |goto Tanaris 67.22,25.77
collect Heavy Leather##4234 |n |goto Tanaris 67.22,25.77
collect Thick Leather##4304 |n |goto Tanaris 67.22,25.77
You can find more around: |notinsticky
[67.57,28.82]
[67.85,35.25]
[68.10,39.75]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Thick Murloc Scale",{
meta={goldtype="route",levelreq={35,60}},
items={{5785,25}},
maps={"Dustwallow Marsh"},
},[[
step
Kill Mirefin enemies around this area
collect Thick Murloc Scale##5785 |n |goto Dustwallow Marsh 58.78,9.45
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Thick Hide, Thick Leather",{
meta={goldtype="route",skillreq={skinning=245},levelreq={46,60}},
items={{8169,8},{4304,56}},
maps={"Un'Goro Crater"},
},[[
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 245 Skinning to collect these.
collect Thick Hide##8169 |n |goto Un'Goro Crater 67.37,72.59
|tip These have a low drop rate.
collect Thick Leather##4304 |n |goto Un'Goro Crater 67.37,72.59
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Worn Dragonscale, Thick Leather, Heavy Leather",{
meta={goldtype="route",skillreq={skinning=205},levelreq={40,60}},
items={{8165,8},{4304,52},{4234,44}},
maps={"Dustwallow Marsh"},
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Worn Dragonscale##8165 |n |goto Dustwallow Marsh 44.75,66.19
|tip These have a low drop rate.
collect Thick Leather##4304 |n |goto Dustwallow Marsh 44.75,66.19
collect Heavy Leather##4234 |n |goto Dustwallow Marsh 44.75,66.19
You can find more around [44.71,74.76]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Scorpid Scale, Thick Leather, Heavy Leather",{
meta={goldtype="route",skillreq={skinning=215},levelreq={40,60}},
items={{8154,60},{4304,36},{4234,32}},
maps={"Tanaris"},
},[[
step
Kill Scorpid enemies around this area
|tip Skin their corpses.
|tip You will need level 215 Skinning to collect these.
collect Scorpid Scale##8154 |n |goto Tanaris 50.93,42.32
collect Thick Leather##4304 |n |goto Tanaris 50.93,42.32
collect Heavy Leather##4234 |n |goto Tanaris 50.93,42.32
You can find more around: |notinsticky
[50.33,48.18]
[44.99,44.85]
[39.08,34.58]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Devilsaur Leather",{
meta={goldtype="route",skillreq={skinning=270},levelreq={55,60}},
items={{15417,8}},
maps={"Un'Goro Crater"},
},[[
step
Kill Devilsaur enemies around this area
|tip Skin their corpses.
|tip These are level 54-56 Elite enemies.
|tip It is recommended you clear the area of other enemies before fighting the Devilsaur.
|tip You will need level 270 Skinning to collect these.
collect Devilsaur Leather##15417 |n |goto Un'Goro Crater 34.25,38.82
You can find more around: |notinsticky
[40.02,62.25]
[57.66,70.17]
[71.30,51.78]
[68.80,26.05]
[31.30,25.52]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Rugged Leather",{
meta={goldtype="route",skillreq={skinning=275},levelreq={55,60}},
items={{8170,60},{8169,12},{4304,44}},
maps={"Winterspring"},
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Leather##8170 |n |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Warbear Leather, Rugged Leather",{
meta={goldtype="route",skillreq={skinning=275},levelreq={55,60}},
items={{15419,12},{8170,60}},
maps={"Western Plaguelands"},
},[[
step
kill Diseased Grizzly##1816+
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Warbear Leather##15419 |n |goto Western Plaguelands 56.81,63.63
collect Rugged Leather##8170 |n |goto Western Plaguelands 56.81,63.63
|tip These have a low drop rate.
You can find more around: |notinsticky
[58.69,58.24]
[57.20,52.78]
[61.55,52.23]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Green Dragonscale, Thick Leather, Heavy Leather",{
meta={goldtype="route",skillreq={skinning=205},levelreq={40,60}},
items={{15412,8},{4304,48},{4234,36}},
maps={"Swamp of Sorrows"},
},[[
step
map Swamp of Sorrows
path follow smart; loop on; ants curved; dist 20
path	62.18,45.70	59.82,53.60	60.80,60.65	64.62,64.44	68.89,66.20
path	74.52,68.02	79.17,61.93	80.05,53.73	76.69,40.89	70.03,38.01
path	63.28,40.82
Kill Dragonkin enemies around this area as you follow the path
|tip Any Scalebane, Wyrmkin, Green or Dragonkin enemy.
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Green Dragonscale##15412 |n
|tip These have a low drop rate.
collect Thick Leather##4304 |n
collect Heavy Leather##4234 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Blue Dragonscale, Rugged Leather, Thick Leather",{
meta={goldtype="route",skillreq={skinning=250},levelreq={50,60}},
items={{15415,4},{8170,40},{4304,16}},
maps={"Azshara"},
},[[
step
Kill enemies around this area
|tip Any Draconic or Blue enemy.
|tip These are level 50-54 Elite enemies.
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect Blue Dragonscale##15415 |n |goto Azshara 36.21,75.55
|tip These have a low drop rate.
collect Rugged Leather##8170 |n |goto Azshara 36.21,75.55
collect Thick Leather##4304 |n |goto Azshara 36.21,75.55
You can find more around: |notinsticky
[41.63,77.37]
[42.89,82.91]
[39.79,83.98]
[37.50,80.60]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Rugged Hide, Rugged Leather, Thick Leather",{
meta={goldtype="route",skillreq={skinning=275},levelreq={55,60}},
items={{8171,8},{8170,52},{4304,48}},
maps={"Winterspring"},
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Hide##8171 |n |goto Winterspring 66.43,44.38
|tip These have a low drop rate.
collect Rugged Leather##8170 |n |goto Winterspring 66.43,44.38
collect Thick Leather##4304 |n |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Black Dragonscale, Rugged Leather",{
meta={goldtype="route",skillreq={skinning=260},levelreq={50,60}},
items={{15416,4},{8170,60}},
maps={"Burning Steppes"},
},[[
step
Kill enemies around this area
|tip Most of the enemies around this area are Elite.
|tip Skin their corpses.
|tip You will need level 260 Skinning to collect these.
collect Black Dragonscale##15416 |n |goto Burning Steppes 91.30,35.07
|tip These have a low drop rate.
collect Rugged Leather##8170 |n |goto Burning Steppes 91.30,35.07
You can find more around [90.73,53.59]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Heavy Scorpid Scale, Rugged Leather",{
meta={goldtype="route",skillreq={skinning=270},levelreq={55,60}},
items={{15408,32},{8170,40}},
maps={"Silithus"},
},[[
step
Kill Stonelash enemies around this area
|tip Skin their corpses.
|tip You will need level 270 Skinning to collect these.
collect Heavy Scorpid Scale##15408 |n |goto Silithus 31.40,38.23
collect Rugged Leather##8170 |n |goto Silithus 31.40,38.23
You can find more around: |notinsticky
[26.71,43.66]
[34.12,45.88]
[39.13,52.28]
[42.85,58.57]
[47.97,61.32]
[46.67,70.30]
[45.02,83.62]
[40.32,81.44]
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Core Leather",{
meta={goldtype="route",skillreq={skinning=300},levelreq={60,60}},
items={{17012,4}},
},[[
step
Enter the Molten Core Raid:
Kill Ancient Core Hounds and Magmadar
|tip They are trash mobs found throughout the raid and the second raid boss.
|tip Skin their corpses.
|tip Level 61's require 305 Skinning, level 62's require 310 Skinning, and bosses require 315 Skinning.
collect Core Leather##17012 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Scale of Onyxia",{
meta={goldtype="route",skillreq={skinning=300},levelreq={60,60}},
items={{15410,2}},
},[[
step
Enter the Onyxia's Lair Raid:
kill Onyxia##10184
|tip Skin its corpse.
|tip You will need level 315 Skinning to collect these.
collect Scale of Onyxia##15410 |n
]])
ZygorGuidesViewer:RegisterGuide("GOLD\\Gathering\\Red Dragonscale, Rugged Leather",{
meta={goldtype="route",skillreq={skinning=300},levelreq={55,60}},
items={{15414,8},{8170,60}},
maps={"Wetlands"},
},[[
step
Follow the path up |goto Wetlands 74.18,47.32 < 20 |only if walking
Kill Dragonkin enemies around this area
|tip These are level 57-62 Elite enemies.
|tip Skin their corpses.
|tip You will need level 300 Skinning to collect these.
|tip Level 61's require 305 Skinning and level 62's require 310 Skinning.
collect Red Dragonscale##15414 |n |goto Wetlands 86.54,51.83
|tip These have a low drop rate.
collect Rugged Leather##8170 |n |goto Wetlands 86.54,51.83
You can find more around: |notinsticky
[87.95,64.81]
[82.51,70.50]
]])
