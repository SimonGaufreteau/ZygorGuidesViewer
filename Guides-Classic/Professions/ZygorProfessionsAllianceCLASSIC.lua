local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Alliance" then return end
if ZGV:DoMutex("ProfessionsACLASSIC") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Alchemy\\Alchemy (1-300)",{
condition_suggested=function() return skill('Alchemy') > 0 end,
description="This guide will walk you through leveling your Alchemy skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 45.77,78.03 < 7 |walk
talk Tel'Athir##5500
|tip Inside the building.
Train Apprentice Alchemy |skillmax Alchemy,75 |goto Stormwind City 46.25,79.10
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Alchemy |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Alchemy") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Silverleaf_Total"
stickystart "Collect_Briarthorn_Total"
stickystart "Collect_Bruiseweed_Total"
stickystart "Collect_Mageroyal_Total"
stickystart "Collect_Stranglekelp_Total"
stickystart "Collect_Liferoot_Total"
stickystart "Collect_Kingsblood_Total"
step
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Peacebloom##2447 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Silverleaf_Total"
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Silverleaf##765 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Briarthorn_Total"
map Loch Modan
path follow smart; loop on; ants curved; dist 20
path	50.11,70.98	56.14,64.90	60.73,61.95	63.09,57.29	64.59,43.34
path	58.98,33.49	55.48,28.48	53.87,22.04	57.70,16.70	61.33,17.00
path	63.45,23.61	63.96,28.94	67.27,33.55	71.77,36.88	74.64,31.08
path	76.86,42.55	75.17,53.91	77.54,57.68	77.01,64.32	78.39,70.75
path	76.62,73.82	73.00,71.84	67.09,75.89	58.35,76.95	55.16,77.71
path	51.86,73.52
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
collect 100 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
step
label "Collect_Bruiseweed_Total"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 140 |or
step
label "Collect_Mageroyal_Total"
map Loch Modan
path follow smart; loop off; dist 20
path	40.87,42.34	40.99,35.44	40.38,29.51	40.17,23.46	41.23,14.88
path	41.13,12.44	42.83,10.59	46.36,14.30	49.72,14.09	53.28,10.94
path	55.46,15.29	59.73,16.49	61.91,22.17	63.02,31.38	66.61,41.14
path	67.83,45.31	67.40,49.93	64.11,54.95	62.24,59.85	59.35,63.18
path	54.73,67.89	51.47,69.31	48.03,68.82
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 20 Mageroyal##785 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 155 |or
step
label "Collect_Stranglekelp_Total"
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
collect 50 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 210 |or
step
label "Collect_Liferoot_Total"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 185 |or
step
label "Collect_Kingsblood_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Kingsblood##3356 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 185 |or
stickystart "Collect_Wild_Steelbloom_Total"
stickystart "Collect_Sungrass_Total"
stickystart "Collect_Khadgar's_Whisker_Total"
stickystart "Collect_Arthas'_Tears_Total"
stickystart "Collect_Blindweed_Total"
stickystart "Collect_Golden_Sansam_Total"
stickystart "Collect_Mountain_Silversage_Total"
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
collect 60 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Alchemy") >= 265 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 60 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Alchemy") >= 265 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Path_One" |or
step
label "Collect_Wild_Steelbloom_Total"
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
collect 5 Wild Steelbloom##3355 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 215 |or
step
label "Collect_Sungrass_Total"
map Blasted Lands
path follow smart; loop on; ants curved; dist 20
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 90 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Khadgar's_Whisker_Total"
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
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 230 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 230 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Collect_Khadgar's_Whisker_Total" |or
step
label "Collect_Arthas'_Tears_Total"
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
collect 25 Arthas' Tears##8836 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 250 |or
step
label "Collect_Blindweed_Total"
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
collect 50 Blindweed##8839 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Golden_Sansam_Total"
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
collect 50 Golden Sansam##13464 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 300 |or
step
label "Collect_Mountain_Silversage_Total"
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
collect 25 Mountain Silversage##13465 |or
|tip Farm them with Herbalism or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Herbalism. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Alchemy") >= 300 |or
step
Enter the building |goto Un'Goro Crater 45.77,78.03 < 7 |walk
talk Eldraeith##5503
|tip Inside the building.
buy 85 Empty Vial##3371 |goto Un'Goro Crater 46.66,78.64 |or 3
buy 105 Leaded Vial##3372 |goto Un'Goro Crater 46.66,78.64 |or 3
buy 115 Crystal Vial##8925 |goto Un'Goro Crater 46.66,78.64 |or 3
'|complete skill("Alchemy") >= 300 |or
stickystart "Collect_Silverleaf_60"
step
label "Begin_Profession_Leveling"
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Peacebloom##2447 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 60 |or
step
label "Collect_Silverleaf_60"
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 65 Silverleaf##765 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 60 |or
step
Enter the building |goto Stormwind City 45.77,78.03 < 7 |walk
talk Eldraeith##5503
|tip Inside the building.
buy 65 Empty Vial##3371 |goto Stormwind City 46.66,78.64 |or
'|complete skill("Alchemy") >= 60 |or
step
Open Your Alchemy Crafting Panel:
_<Create 65 Minor Healing Potions>_
|tip Save these, you will need them later.
collect 65 Minor Healing Potion##118 |or
'|complete skill("Alchemy") >= 110 |or
step
Open Your Alchemy Crafting Panel:
_<Create Minor Healing Potions>_
|tip You may need to create a few more of these.
|tip Save 65 of these, you will need them later.
|tip Each additional one requires one Peacebloom, one Silverleaf, and one Empty Vial.
Reach Skill 60 in Alchemy |skill Alchemy,60
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 45.77,78.03 < 7 |walk
talk Lilyssia Nightbreeze##5499
|tip Inside the building.
Train Journeyman Alchemy |skillmax Alchemy,150 |goto Stormwind City 46.50,79.67
step
talk Lilyssia Nightbreeze##5499
|tip Inside the building.
Train Lesser Healing Potion |learn Lesser Healing Potion##2337 |goto Stormwind City 46.50,79.67
step
map Loch Modan
path follow smart; loop on; ants curved; dist 20
path	50.11,70.98	56.14,64.90	60.73,61.95	63.09,57.29	64.59,43.34
path	58.98,33.49	55.48,28.48	53.87,22.04	57.70,16.70	61.33,17.00
path	63.45,23.61	63.96,28.94	67.27,33.55	71.77,36.88	74.64,31.08
path	76.86,42.55	75.17,53.91	77.54,57.68	77.01,64.32	78.39,70.75
path	76.62,73.82	73.00,71.84	67.09,75.89	58.35,76.95	55.16,77.71
path	51.86,73.52
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
collect 65 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 110 |or
step
Open Your Alchemy Crafting Panel:
_<Create 65 Lesser Healing Potions>_
Reach Skill 110 in Alchemy |skill Alchemy,110
stickystart "Collect_Bruiseweed_140"
step
map Loch Modan
path follow smart; loop on; ants curved; dist 20
path	50.11,70.98	56.14,64.90	60.73,61.95	63.09,57.29	64.59,43.34
path	58.98,33.49	55.48,28.48	53.87,22.04	57.70,16.70	61.33,17.00
path	63.45,23.61	63.96,28.94	67.27,33.55	71.77,36.88	74.64,31.08
path	76.86,42.55	75.17,53.91	77.54,57.68	77.01,64.32	78.39,70.75
path	76.62,73.82	73.00,71.84	67.09,75.89	58.35,76.95	55.16,77.71
path	51.86,73.52
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
collect 35 Briarthorn##2450 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 140 |or
step
label "Collect_Bruiseweed_140"
map Ashenvale
path follow smart; loop off; dist 20
path	30.47,44.71	27.77,48.81	25.72,50.64	28.38,54.47	34.66,54.20
path	35.41,56.86	34.85,58.62	32.71,59.66	34.71,59.96	38.06,62.62
path	40.48,61.75	39.97,65.16	41.82,64.95	43.85,63.15	47.09,61.20
path	48.42,60.26	49.98,59.22	54.29,60.93	56.36,63.51	57.82,64.38
path	59.14,70.90	60.56,73.42	69.78,74.49	71.98,73.86	74.94,73.92
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 140 |or
'|goto Ashenvale 74.94,73.92 < 20 |noway |c |or
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
collect 35 Bruiseweed##2453 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 140 |or
'|goto Ashenvale 30.47,44.71 < 20 |noway |c |next "Collect_Bruiseweed_140" |or
step
talk Eldraeith##5503
|tip Inside the building.
buy 35 Leaded Vial##3372 |goto Stormwind City 46.66,78.64 |or
'|complete skill("Alchemy") >= 140 |or
step
Enter the building |goto Stormwind City 45.77,78.03 < 7 |walk
talk Lilyssia Nightbreeze##5499
|tip Inside the building.
Train Healing Potion |learn Healing Potion##3447 |goto Stormwind City 46.50,79.67
step
Open Your Alchemy Crafting Panel:
_<Create 35 Healing Potions>_
Reach Skill 140 in Alchemy |skill Alchemy,140
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
talk Ainethil##4160
|tip Inside the building.
Train Expert Alchemy |skillmax Alchemy,225 |goto Darnassus 54.88,24.02
step
talk Ainethil##4160
|tip Inside the building.
Train Lesser Mana Potion |learn Lesser Mana Potion##3173 |goto Darnassus 54.88,24.02
stickystart "Collect_Stranglekelp_155"
step
label "Collect_20_Mageroyal_Loop"
map Loch Modan
path follow smart; loop off; dist 20
path	40.87,42.34	40.99,35.44	40.38,29.51	40.17,23.46	41.23,14.88
path	41.13,12.44	42.83,10.59	46.36,14.30	49.72,14.09	53.28,10.94
path	55.46,15.29	59.73,16.49	61.91,22.17	63.02,31.38	66.61,41.14
path	67.83,45.31	67.40,49.93	64.11,54.95	62.24,59.85	59.35,63.18
path	54.73,67.89	51.47,69.31	48.03,68.82
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 20 Mageroyal##785 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 155 |or
step
map Loch Modan
path follow smart; loop off; dist 20
path	48.03,68.82	51.47,69.31	54.73,67.89	59.35,63.18	62.24,59.85
path	64.11,54.95	67.40,49.93	67.83,45.31	66.61,41.14	63.02,31.38
path	61.91,22.17	59.73,16.49	55.46,15.29	53.28,10.94	49.72,14.09
path	46.36,14.30	42.83,10.59	41.13,12.44	41.23,14.88	40.17,23.46
path	40.38,29.51	40.99,35.44	40.87,42.34
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 20 Mageroyal##785 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 155 |or
'|goto Loch Modan 40.87,42.34 < 20 |noway |c |next "Collect_20_Mageroyal_Loop" |or
step
label "Collect_Stranglekelp_155"
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
collect 20 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 155 |or
'|goto Stranglethorn Vale 38.81,62.94 < 20 |noway |c |or
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
collect 20 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 155 |or
'|goto Stranglethorn Vale 27.56,22.38 < 20 |noway |c |next
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy 20 Empty Vial##3371 |goto Darnassus 55.85,24.47 |or
'|complete skill("Alchemy") >= 155 |or
step
Open Your Alchemy Crafting Panel:
_<Create 20 Lesser Mana Potions>_
Reach Skill 155 in Alchemy |skill Alchemy,155
stickystart "Collect_Kingsblood_185"
step
label "Collect_35_Liferoot_Loop"
map Wetlands
path follow smart; loop off; dist 20
path	39.88,29.56	42.39,32.16	44.42,36.02	50.85,37.60	53.92,41.52
path	55.96,45.32	59.97,50.83	61.97,56.83	64.42,68.06	63.29,74.88
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 185 |or
'|goto Wetlands 63.29,74.88 < 20 |noway |c |or
step
map Wetlands
path follow smart; loop off; dist 20
path	63.29,74.88	64.42,68.06	61.97,56.83	59.97,50.83	55.96,45.32
path	53.92,41.52	50.85,37.60	44.42,36.02	42.39,32.16	39.88,29.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Liferoot##3357 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 185 |or
'|goto Wetlands 39.88,29.56 < 20 |noway |c |next "Collect_35_Liferoot_Loop" |or
step
label "Collect_Kingsblood_185"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 35 Kingsblood##3356 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 185 |or
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy 35 Leaded Vial##3372 |goto Darnassus 55.85,24.47 |or
'|complete skill("Alchemy") >= 185 |or
step
talk Ainethil##4160
|tip Inside the building.
Train Greater Healing Potion |learn Greater Healing Potion##7181 |goto Darnassus 54.88,24.02
step
Open Your Alchemy Crafting Panel:
_<Create 35 Greater Healing Potions>_
Reach Skill 185 in Alchemy |skill Alchemy,185
label "Collect_Stranglekelp_210"
step
label "Collect_30_Goldthorn_Loop"
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
collect 30 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 210 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 30 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 210 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Collect_30_Goldthorn_Loop" |or
step
label "Collect_Stranglekelp_210"
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
collect 30 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 210 |or
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
collect 30 Stranglekelp##3820 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 210 |or
'|goto Stranglethorn Vale 27.56,22.38 < 20 |noway |c |next "Collect_Stranglekelp_210"
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy 30 Leaded Vial##3372 |goto Darnassus 55.85,24.47 |or
'|complete skill("Alchemy") >= 210 |or
step
talk Ainethil##4160
|tip Inside the building.
Train Elixir of Agility |learn Elixir of Agility##11449 |goto Darnassus 54.88,24.02
step
Open Your Alchemy Crafting Panel:
_<Create 30 Elixirs of Agility>_
Reach Skill 210 in Alchemy |skill Alchemy,210
stickystart "Collect_Goldthorn_215"
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
collect 5 Wild Steelbloom##3355 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 215 |or
step
label "Collect_Goldthorn_215"
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
collect 5 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 215 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 5 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 215 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Collect_Goldthorn_215" |or
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy 5 Leaded Vial##3372 |goto Darnassus 55.85,24.47 |or
'|complete skill("Alchemy") >= 215 |or
step
talk Ainethil##4160
|tip Inside the building.
Train Elixir of Greater Defense |learn Elixir of Greater Defense##11450 |goto Darnassus 54.88,24.02
step
Open Your Alchemy Crafting Panel:
_<Create 5 Elixirs of Greater Defense>_
Reach Skill 215 in Alchemy |skill Alchemy,215
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Feralas 32.34,43.69 < 7 |walk
talk Kylanna Windwhisper##7948
|tip Inside the building.
Train Artisan Alchemy |skillmax Alchemy,300 |goto Feralas 32.62,43.78
step
talk Kylanna Windwhisper##7948
|tip Inside the building.
Train Superior Healing Potion |learn Superior Healing Potion##11457 |goto Feralas 32.62,43.78
stickystart "Collect_Khadgar's_Whisker_230"
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
collect 15 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 230 |or
step
label "Collect_Khadgar's_Whisker_230"
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
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 230 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 15 Khadgar's Whisker##3358 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 230 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Collect_Khadgar's_Whisker_230"
step
Enter the building |goto Feralas 32.34,43.69 < 7 |walk
talk Logannas##8157
|tip Inside the building.
buy 15 Crystal Vial##8925 |goto Feralas 32.67,44.03 |or
'|complete skill("Alchemy") >= 230 |or
step
Open Your Alchemy Crafting Panel:
_<Create 15 Superior Healing Potions>_
Reach Skill 230 in Alchemy |skill Alchemy,230
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
collect 25 Arthas' Tears##8836 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 250 |or
step
Enter the building |goto Feralas 32.34,43.69 < 7 |walk
talk Logannas##8157
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Feralas 32.67,44.03 |or
'|complete skill("Alchemy") >= 250 |or
step
talk Kylanna Windwhisper##7948
|tip Inside the building.
Train Elixir of Detect Undead |learn Elixir of Detect Undead##11460 |goto Feralas 32.62,43.78
step
Open Your Alchemy Crafting Panel:
_<Create 25 Elixirs of Detect Undead>_
Reach Skill 250 in Alchemy |skill Alchemy,250
stickystart "Collect_Goldthorn_265"
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
collect 25 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 265 |or
step
label "Collect_Goldthorn_265"
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
collect 25 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 265 |or
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect 25 Goldthorn##3821 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 265 |or
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Collect_Goldthorn_265"
step
Enter the building |goto Feralas 32.34,43.69 < 7 |walk
talk Logannas##8157
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Feralas 32.67,44.03 |or
'|complete skill("Alchemy") >= 265 |or
step
talk Kylanna Windwhisper##7948
|tip Inside the building.
Train Elixir of Greater Agility |learn Elixir of Greater Agility##11467 |goto Feralas 32.62,43.78
step
Open Your Alchemy Crafting Panel:
_<Create 25 Elixirs of Greater Agility>_
Reach Skill 265 in Alchemy |skill Alchemy,265
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy Recipe: Superior Mana Potion##13477 |goto Darnassus 55.85,24.47 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Alchemy") >= 285 |or
step
use the Recipe: Superior Mana Potion##13477
Train Superior Mana Potion |learn Superior Mana Potion##17553
stickystart "Collect_Blindweed_285"
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
collect 50 Sungrass##8838 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 285 |or
step
label "Collect_Blindweed_285"
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
collect 50 Blindweed##8839 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 285 |or
step
talk Ulthir##4226
|tip Downstairs inside the building.
buy 25 Crystal Vial##8925 |goto Darnassus 55.85,24.47 |or
'|complete skill("Alchemy") >= 285 |or
step
Open Your Alchemy Crafting Panel:
_<Create 25 Superior Mana Potions>_
Reach Skill 285 in Alchemy |skill Alchemy,285
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 60.83,37.85 < 7 |walk
talk Evie Whirlbrew##11188
|tip Inside the building.
buy 25 Crystal Vial##8925 |goto Winterspring 60.75,37.78 |or
'|complete skill("Alchemy") >= 300 |or
step
talk Evie Whirlbrew##11188
|tip Inside the building.
buy Recipe: Major Healing Potion##13480 |goto Winterspring 60.75,37.78 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Alchemy") >= 300 |or
step
use the Recipe: Major Healing Potion##13480
Train Major Healing Potion |learn Major Healing Potion##17556 |or
'|complete skill("Alchemy") >= 300 |or
stickystart "Collect_Mountain_Silversage_300"
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
collect 50 Golden Sansam##13464 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 300 |or
step
label "Collect_Mountain_Silversage_300"
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
collect 25 Mountain Silversage##13465 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Alchemy") >= 300 |or
step
Open Your Alchemy Crafting Panel:
_<Create 25 Major Healing Potions>_
Reach Skill 300 in Alchemy |skill Alchemy,300
step
_Congratulations!_
You Reached Skill 300 in Alchemy.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Blacksmithing (1-300)",{
condition_suggested=function() return skill('Blacksmithing') > 0 end,
description="This guide will walk you through leveling your Blacksmithing skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Smith Argus##514
|tip Inside the building.
Train Apprentice Blacksmithing |skillmax Blacksmithing,75 |goto Elwynn Forest 41.71,65.55
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Blacksmithing |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Blacksmithing") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Coarse_Stone_Total"
stickystart "Collect_Copper_Bar_Total"
stickystart "Collect_Silver_Bar_Total"
stickystart "Collect_Bronze_Bar_Total"
stickystart "Collect_Heavy_Stone_Total"
stickystart "Collect_Gold_Bar_Total"
stickystart "Collect_Iron_Bar_Total"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 150 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Blacksmithing") >= 65 |or
step
label "Collect_Coarse_Stone_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 85 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 100 |or
step
label "Collect_Copper_Bar_Total"
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 150 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 110 |or
step
label "Collect_Silver_Bar_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 105 |or
step
label "Collect_Bronze_Bar_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 70 Tin Ore##2771 |n |notinsticky
collect 70 Copper Ore##2770 |n |notinsticky
|tip Use your mining skill to create Bronze Bars. |notinsticky
|tip You can pick up copper along this path as well. |notinsticky
collect 140 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 150 |or
step
label "Collect_Heavy_Stone_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 90 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 140 |or
step
label "Collect_Gold_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 5 Gold Bar##3577 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 155 |or
step
label "Collect_Iron_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 230 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 190 |or
stickystart "Collect_Solid_Stone_Total"
stickystart "Collect_Mithril_Bar_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Dense_Stone_Total"
stickystart "Collect_Thorium_Bar_Total"
stickystart "Collect_Star_Ruby_Total"
stickystart "Collect_Aquamarine_Total"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 190 Iron Ore##2772 |n
buy 190 Coal##3857 |n
|tip Buy them from a General Trade Supplier.
|tip Use your mining ability to smelt Steel Bars.
collect 190 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Blacksmithing") >= 235 |or
step
label "Collect_Solid_Stone_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 520 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 210 |or
step
label "Collect_Mithril_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 250 Mithril Ore##3858 |n |notinsticky
|tip Smelt the ores into bars at a forge. |notinsticky
collect 250 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 270 |or
step
label "Collect_Mageweave_Cloth_Total"
Kill Dunemaul enemies around this area |notinsticky
collect 60 Mageweave Cloth##4338 |goto Tanaris 40.50,55.50 |or
|tip Farm them from humanoid mobs or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them from humanoid mobs. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 225 |or
step
label "Collect_Dense_Stone_Total"
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
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 20 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 260 |or
step
label "Collect_Thorium_Bar_Total"
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
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 750 Thorium Ore##10620 |n |notinsticky
|tip Smelt the ores into bars at a forge. |notinsticky
collect 750 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 300 |or
step
label "Collect_Star_Ruby_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 31 Star Ruby##7910 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These are an uncommon drop. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 300 |or
step
label "Collect_Aquamarine_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area |notinsticky
|tip Track them on your minimap with "Find Minerals". |notinsticky
collect 5 Aquamarine##7909 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These are an uncommon drop. |notinsticky
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Blacksmithing") >= 300 |or
step
talk Edna Mullby##1286
|tip Inside the building.
buy 35 Green Dye##2605 |goto Stormwind City/0 58.23,60.52 |or
'|complete skill("Blacksmithing") >= 165 |or
step
label "Begin_Profession_Leveling"
talk Tharynn Bouden##66
buy Blacksmith Hammer##5956 |goto Elwynn Forest/0 41.82,67.17 |or
|tip Save this, you will need it later.
'|complete skill("Blacksmithing") >= 300 |or
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 40 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 30 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 40 Rough Sharpening Stones>_
|tip You may need to create a few more or less of these.
|tip Each additional Rough Sharpening Stone requires one Rough Stone.
Reach Skill 30 in Blacksmithing |skill Blacksmithing,30
step
talk Smith Argus##514
|tip Inside the building.
Train Rough Grinding Stone |learn Rough Grinding Stone##3320 |goto Elwynn Forest 41.71,65.55
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 110 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 65 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 55 Rough Grinding Stones>_
|tip You may need to create a few more or less of these.
|tip Each additional Rough Grinding Stone requires two Rough Stone.
|tip Save 10 of these, you will need them later.
Reach Skill 65 in Blacksmithing |skill Blacksmithing,65
step
talk Smith Argus##514
|tip Inside the building.
Train Coarse Sharpening Stone |learn Coarse Sharpening Stone##2665 |goto Elwynn Forest 41.71,65.55
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 75 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 25 Coarse Sharpening Stone>_
|tip You may need to create a few more or less of these.
|tip Each additional Coarse Sharpening Stone requires one Coarse Stone.
Reach Skill 75 in Blacksmithing |skill Blacksmithing,75
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Rotgath Stonebeard##10276
Train Journeyman Blacksmithing |skillmax Blacksmithing,150 |goto Ironforge 52.36,42.55
step
talk Rotgath Stonebeard##10276
Train Coarse Grinding Stone |learn Coarse Grinding Stone##3326 |goto Ironforge 52.36,42.55
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 90 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 30 Coarse Grinding Stones>_
collect 30 Coarse Grinding Stone##3478 |or
'|complete skill("Blacksmithing") >= 101 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create Coarse Grinding Stones>_
|tip You may need to create a few more of these.
|tip Each additional Coarse Grinding Stone requires two Coarse Stone.
|tip Save 30 of these, you will need them later.
Reach Skill 90 in Blacksmithing |skill Blacksmithing,90
step
talk Rotgath Stonebeard##10276
Train Runed Copper Belt |learn Runed Copper Belt##2666 |goto Ironforge 52.36,42.55
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 100 Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 100 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 100 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 10 Runed Copper Belts>_
|tip Stand next to an anvil.
Reach Skill 100 in Blacksmithing |skill Blacksmithing,100 |goto Ironforge 52.36,42.55
step
talk Rotgath Stonebeard##10276
Train Silver Rod |learn Silver Rod##7818 |goto Ironforge 52.36,42.55
stickystart "Collect_Rough_Grinding_Stone_105"
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Silver Ore##2775 |n
|tip Smelt the ores into bars at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 105 |or
step
label "Collect_Rough_Grinding_Stone_105"
collect 10 Rough Grinding Stone##3470 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 105 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 5 Silver Rods>_
|tip Stand next to an anvil.
|tip Inside the building.
Reach Skill 105 in Blacksmithing |skill Blacksmithing,105 |goto Ironforge 52.36,42.55
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 50 Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 50 Copper Bar##2840 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 110 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 5 Runed Copper Belts>_
|tip Stand next to an anvil.
Reach Skill 110 in Blacksmithing |skill Blacksmithing,110 |goto Ironforge 52.36,42.55
step
talk Rotgath Stonebeard##10276
Train Rough Bronze Leggings |learn Rough Bronze Leggings##2668 |goto Ironforge 52.36,42.55
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 45 Copper Ore##2770 |or
|tip Save the ore if you're farming yourself.
collect 90 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 125 |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 45 Tin Ore##2771 |n
|tip Combine these with the Copper Ore from the previous step for Bronze Bars.
collect 90 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 125 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 15 Rough Bronze Leggings>_
|tip Stand next to an anvil.
Reach Skill 125 in Blacksmithing |skill Blacksmithing,125 |goto Ironforge 52.36,42.55
step
talk Rotgath Stonebeard##10276
Train Heavy Grinding Stone |learn Heavy Grinding Stone##3337 |goto Ironforge 52.36,42.55
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 90 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 140 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 30 Heavy Grinding Stones>_
collect 30 Heavy Grinding Stone##3486 |or
'|complete skill("Blacksmithing") >= 151 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create Heavy Grinding Stones>_
|tip You may need to create a few more of these.
|tip Each additional Heavy Grinding Stone requires three Heavy Stone.
|tip Save 30 of these, you will need them later.
Reach Skill 140 in Blacksmithing |skill Blacksmithing,140
step
talk Rotgath Stonebeard##10276
Train Patterned Bronze Bracers |learn Patterned Bronze Bracers##2672 |goto Ironforge 52.36,42.55
stickystart "Collect_Coarse_Grinding_Stone_150"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Copper Ore##2770 |or
|tip Save the ore if you're farming yourself.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 150 |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Tin Ore##2771 |n
|tip Combine these with the Copper Ore from the previous step for Bronze Bars.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 150 |or
step
label "Collect_Coarse_Grinding_Stone_150"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 20 Coarse Grinding Stone##3478 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 150 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 10 Patterned Bronze Bracers>_
|tip Stand next to an anvil.
Reach Skill 150 in Blacksmithing |skill Blacksmithing,150 |goto Ironforge 52.36,42.55
step
Reach Level 20 |ding 20
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
talk Bengus Deepforge##4258
Train Expert Blacksmithing |skillmax Blacksmithing,225 |goto Ironforge 52.55,41.46
step
talk Bengus Deepforge##4258
Train Golden Rod |learn Golden Rod##14379 |goto Ironforge 52.55,41.46
stickystart "Collect_Coarse_Grinding_Stone_155"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Gold Ore##2776 |n
|tip Smelt the ores into bars at a forge.
collect 5 Gold Bar##3577 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 155 |or
step
label "Collect_Coarse_Grinding_Stone_155"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 10 Coarse Grinding Stone##3478 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 155 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 5 Golden Rods>_
|tip Stand next to an anvil.
Reach Skill 155 in Blacksmithing |skill Blacksmithing,155 |goto Ironforge 52.55,41.46
step
talk Bengus Deepforge##4258
Train Green Iron Leggings |learn Green Iron Leggings##3506 |goto Ironforge 52.55,41.46
stickystart "Collect_Heavy_Grinding_Stone_165"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 80 Iron Ore##2772 |n
|tip Smelt the ores into bars at a forge.
collect 80 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 165 |or
step
label "Collect_Heavy_Grinding_Stone_165"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 10 Heavy Grinding Stone##3486 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 165 |or
step
Enter the building |goto Ironforge 43.85,29.81 < 7 |walk
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 35 Green Dye##2605 |goto Ironforge 42.96,28.32 |or
'|complete skill("Blacksmithing") >= 165 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 10 Green Iron Leggings>_
|tip Stand next to an anvil.
Reach Skill 165 in Blacksmithing |skill Blacksmithing,165 |goto Ironforge 52.55,41.46
step
talk Bengus Deepforge##4258
Train Green Iron Bracers |learn Green Iron Bracers##3501 |goto Ironforge 52.55,41.46
stickystart "Collect_Green_Dye_190"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 150 Iron Ore##2772 |n
|tip Smelt the ores into bars at a forge.
collect 150 Iron Bar##3575 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 190 |or
step
label "Collect_Green_Dye_190"
collect 25 Green Dye##2605
|tip You purchased these in a previous step.
'|complete skill("Blacksmithing") >= 190 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 25 Green Iron Bracers>_
|tip Stand next to an anvil.
Reach Skill 190 in Blacksmithing |skill Blacksmithing,190 |goto Ironforge 52.55,41.46
step
talk Bengus Deepforge##4258
Train Golden Scale Bracers |learn Golden Scale Bracers##7223 |goto Ironforge 52.55,41.46
stickystart "Collect_Heavy_Grinding_Stone_200"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 50 Iron Ore##2772 |n
buy 50 Coal##3857 |n
|tip Buy them from a General Trade Supplier.
|tip Smelt the ores into bars at a forge.
collect 50 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 200 |or
step
label "Collect_Heavy_Grinding_Stone_200"
collect 20 Heavy Grinding Stone##3486 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 200 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 10 Golden Scale Bracers>_
|tip Stand next to an anvil.
|tip If you intend to choose the Armorsmith specialization, keep 6 of these.
Reach Skill 200 in Blacksmithing |skill Blacksmithing,200 |goto Ironforge 52.55,41.46
step
talk Bengus Deepforge##4258
Train Solid Grinding Stone |learn Solid Grinding Stone##9920 |goto Ironforge 52.55,41.46
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 520 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 210 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 130 Solid Grinding Stones>_
|tip Save these, you will need them later.
collect 130 Solid Grinding Stone##7966 |or
'|complete skill("Blacksmithing") >= 225 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create Solid Grinding Stones>_
|tip You may need to make a few more of these.
|tip Each additional Solid Grinding Stone requires four Solid Stone.
|tip Save 130 these, you will need them later.
Reach Skill 210 in Blacksmithing |skill Blacksmithing,210
step
talk Bengus Deepforge##4258
Train Heavy Mithril Gauntlet |learn Heavy Mithril Gauntlet##9928 |goto Ironforge 52.55,41.46
stickystart "Collect_Mageweave_Cloth_225"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 90 Mithril Ore##3858 |n
|tip Smelt the ores into bars at a forge.
collect 90 Mithril Bar##3860 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 225 |or
step
label "Collect_Mageweave_Cloth_225"
Kill Dunemaul enemies around this area
collect 60 Mageweave Cloth##4338 |goto Tanaris 40.50,55.50 |or
|tip Farm them from humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
'|complete skill("Blacksmithing") >= 225 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 15 Heavy Mithril Gauntlets>_
|tip Stand next to an anvil.
Reach Skill 225 in Blacksmithing |skill Blacksmithing,225 |goto Ironforge 52.55,41.46
step
Reach Level 35 |ding 35
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stranglethorn Vale 28.95,75.33 < 5 |walk
talk Brikk Keencraft##2836
|tip Inside the building.
Train Artisan Blacksmithing |skillmax Blacksmithing,300 |goto Stranglethorn Vale 28.99,75.55
step
talk Brikk Keencraft##2836
|tip Inside the building.
Train Steel Plate Helm |learn Steel Plate Helm##9935 |goto Stranglethorn Vale 28.99,75.55
stickystart "Collect_Solid_Grinding_Stone_235"
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 140 Iron Ore##2772 |n
buy 140 Coal##3857 |n
|tip Buy them from a General Trade Supplier.
|tip Smelt the ores into bars at a forge.
collect 140 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 235 |or
step
label "Collect_Solid_Grinding_Stone_235"
collect 10 Solid Grinding Stone##7966 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 235 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 10 Steel Plate Helms>_
|tip Stand next to an anvil.
|tip Inside the building.
|tip If you intend to choose the Armorsmith specialization, keep 4 of these.
Reach Skill 235 in Blacksmithing |skill Blacksmithing,235 |goto Stranglethorn Vale 28.95,75.53
step
collect Plans: Mithril Spurs##7989 |or
|tip Purchase this from the auction house. |only if not selfmade
'|complete skill("Blacksmithing") >= 255 |or
step
use the Plans: Mithril Spurs##7989
Learn Mithril Spurs |learn Mithril Spurs##9964
stickystart "Collect_Solid_Grinding_Stone_250"
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 80 Mithril Ore##3858 |n
|tip Smelt the ores into bars at a forge.
collect 80 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 250 |or
step
label "Collect_Solid_Grinding_Stone_250"
collect 60 Solid Grinding Stone##7966 |or
|tip You created these in a previous step.
'|complete skill("Blacksmithing") >= 250 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 20 Mithril Spurs>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each addtional Mithril Spur requires four Mithril Bars and three Solid Grinding Stones.
|tip Solid Grinding Stones require four Solid Stone.
Reach Skill 250 in Blacksmithing |skill Blacksmithing,250 |goto Ironforge 52.55,41.46
step
talk Brikk Keencraft##2836
|tip Inside the building.
Train Dense Sharpening Stone |learn Dense Sharpening Stone##16641 |goto Stranglethorn Vale 28.99,75.55
step
collect 20 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 260 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 20 Dense Sharpening Stones>_
|tip You may need to create a few more or less of these.
|tip Each addtional Dense Sharpening Stone requires one Dense Stone.
Reach Skill 260 in Blacksmithing |skill Blacksmithing,260
stickystart "Collect_Solid_Grinding_Stone_270"
step
collect 80 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 270 |or
step
label "Collect_Solid_Grinding_Stone_270"
collect 60 Solid Grinding Stone##7966 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 270 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 20 Mithril Spurs>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each addtional Mithril Spur requires four Mithril Bars and three Solid Grinding Stones.
|tip Solid Grinding Stones require four Solid Stone.
Reach Skill 270 in Blacksmithing |skill Blacksmithing,270 |goto Ironforge 52.55,41.46
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can accept the next quests.
|tip Use the leveling guides to accomplish this.
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
collect 540 Thorium Ore##10620 |n
|tip Smelt the ores into bars at a forge.
collect 540 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
|tip You will need 20 for a quest, and at least 520 for the the next recipe.
'|complete skill("Blacksmithing") >= 295 |or
step
talk Derotain Mudsipper##14567
accept A Blue Light Bargain##7652 |goto Tanaris 51.38,28.67
step
talk Derotain Mudsipper##14567
accept Imperial Plate Bracer##7655 |goto Tanaris 51.38,28.67
step
collect 20 Thorium Bar##12359 |q 7655/1
|tip You collected these in a previous step.
step
talk Derotain Mudsipper##14567
turnin Imperial Plate Bracer##7655 |goto Tanaris 51.38,28.67
step
use the Plans: Imperial Plate Bracers##12690
Learn Imperial Plate Bracers |learn Imperial Plate Bracers##16649
stickystart "Collect_Star_Ruby_295"
step
collect 520 Thorium Bar##12359 |or
|tip You collected these in a previous step.
'|complete skill("Blacksmithing") >= 295 |or
step
label "Collect_Star_Ruby_295"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 26 Star Ruby##7910 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 295 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 26 Imperial Plate Bracers>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Imperial Plate Bracer requires twenty Thorium Bars and one Star Ruby.
Reach Skill 295 in Blacksmithing |skill Blacksmithing,295 |goto Ironforge 52.55,41.46
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
collect 210 Thorium Ore##10620 |n
|tip Smelt the ores into bars at a forge.
collect 210 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
|tip You will need 40 for a quest, and at least 170 for the the next recipe.
'|complete skill("Blacksmithing") >= 300 |or
step
talk Derotain Mudsipper##14567
accept Imperial Plate Boots##7654 |goto Tanaris 51.38,28.67
step
collect 40 Thorium Bar##12359 |q 7654/1
|tip You collected these in a previous step.
step
talk Derotain Mudsipper##14567
turnin Imperial Plate Boots##7654 |goto Tanaris 51.38,28.67
step
use the Plans: Imperial Plate Boots##12700
Learn Imperial Plate Boots |learn Imperial Plate Boots##16657
stickystart "Collect_Star_Ruby_300"
stickystart "Collect_Aquamarine_300"
step
collect 170 Thorium Bar##12359 |or
|tip You collected these in a previous step.
'|complete skill("Blacksmithing") >= 300 |or
step
label "Collect_Star_Ruby_300"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Star Ruby##7910 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 300 |or
step
label "Collect_Aquamarine_300"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Aquamarine##7909 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Blacksmithing") >= 300 |or
step
Open Your Blacksmithing Crafting Panel:
_<Create 5 Imperial Plate Boots>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Imperial Plate Boots requires thirty four Thorium Bars, one Aquamarine and one Star Ruby.
Reach Skill 300 in Blacksmithing |skill Blacksmithing,300 |goto Tanaris 51.39,28.71
step
_Congratulations!_
You Reached Skill 300 in Blacksmithing.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Cooking (1-300)",{
condition_suggested=function() return skill('Cooking') > 0 end,
description="This guide will walk you through leveling your Cooking skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 71.64,39.92 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
talk Stephen Ryback##5482
|tip Downstairs inside the building.
Train Apprentice Cooking |skillmax Cooking,75 |goto Stormwind City 75.60,37.04
step
kill Stonetusk Boar##113
collect 55 Chunk of Boar Meat##769 |or |goto Elwynn Forest 41.81,87.22
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
You can find more around this area [32.96,84.95]
'|complete skill("Cooking") >= 50 |or
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire inside the building.
_<Create 55 Roasted Boar Meat>_
Reach Skill 50 in Cooking |skill Cooking,50 |goto Elwynn Forest 44.37,66.08
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 71.64,39.92 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
talk Stephen Ryback##5482
|tip Downstairs inside the building.
Train Journeyman Cooking |skillmax Cooking,150 |goto Stormwind City 75.60,37.04
step
Enter the building |goto Loch Modan 35.23,47.74 < 5 |walk
talk Drac Roughcut##1465
|tip Inside the building.
buy Recipe: Smoked Bear Meat##6892 |n
use the Recipe: Smoked Bear Meat##6892
Train Smoked Bear Meat |learn Smoked Bear Meat##8607 |goto Loch Modan 35.57,49.15
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
collect 30 Bear Meat##3173 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 80 |or
step
Enter the building |goto Stormwind City 71.64,39.92 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 30 Smoked Bear Meat>_
Reach Skill 80 in Cooking |skill Cooking,80 |goto Stormwind City 75.97,36.50
step
talk Stephen Ryback##5482
|tip Downstairs inside the building.
Train Boiled Clams |learn Boiled Clams##6499 |goto Stormwind City 75.60,37.04
step
Kill Murloc enemies around this area
|tip They are found all along the coastline.
collect Small Barnacled Clam##5523 |n
use the Small Barnacled Clam##5523
collect 40 Clam Meat##5503 |goto Westfall 37.26,15.67 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 110 |or
step
Enter the building |goto Stormwind City 71.64,39.92 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
talk Erika Tate##5483
|tip Downstairs inside the building.
buy 40 Refreshing Spring Water##159 |goto Stormwind City 76.06,36.76
'|complete skill("Cooking") >= 110 |or
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 40 Boiled Clams>_
Reach Skill 110 in Cooking |skill Cooking,110 |goto Stormwind City 75.97,36.50
step
talk Stephen Ryback##5482
|tip Downstairs inside the building.
Train Crab Cake |learn Crab Cake##2544 |goto Stormwind City 75.60,37.04
step
label "Collect_30_Crawler_Meat"
map Westfall
path follow smart; loop off; dist 20
path	51.32,9.67	49.06,10.01	44.72,8.70	41.78,10.34	38.85,13.51
path	36.20,18.29	33.45,22.08	31.88,24.30
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect 30 Crawler Meat##2674 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 130 |or
'|goto Westfall 31.88,24.30 < 20 |noway |c |or
step
map Westfall
path follow smart; loop off; dist 20
path	31.88,24.30	33.45,22.08	36.20,18.29	38.85,13.51	41.78,10.34
path	44.72,8.70	49.06,10.01	51.32,9.67
Kill Crawler enemies around this area
collect 30 Crawler Meat##2674 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 130 |or
'|goto Westfall 51.32,9.67 < 20 |noway |c |next "Collect_30_Crawler_Meat" |or
step
Enter the building |goto Stormwind City 71.64,39.92 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
talk Erika Tate##5483
|tip Downstairs inside the building.
buy 30 Mild Spice##2678 |goto Stormwind City 76.06,36.76
'|complete skill("Cooking") >= 130 |or
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 30 Crab Cakes>_
Reach Skill 130 in Cooking |skill Cooking,130 |goto Stormwind City 75.97,36.50
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Follow the path down |goto Ashenvale 51.22,58.21 < 20 |only if walking
Enter the building |goto Ashenvale 50.12,66.48 < 10 |walk
talk Shandrina##3955
|tip Inside the building.
buy Expert Cookbook##16072 |n
use the Expert Cookbook##16072
Train Expert Cooking |skillmax Cooking,225 |goto Ashenvale 49.48,67.09
step
Enter the building |goto Stormwind City 71.71,39.83 < 5 |walk
talk Kendor Kabonka##340
|tip Upstairs inside the building.
buy Recipe: Curiously Tasty Omelet##3682 |n
use the Recipe: Curiously Tasty Omelet##3682
Train Curiously Tasty Omelet |learn Curiously Tasty Omelet##3376 |goto Stormwind City 74.69,36.51
step
map Wetlands
path follow smart; loop on; dist 20
path	20.63,48.84	21.22,52.36	22.52,55.60	23.52,53.14	24.47,52.25
path	24.33,49.93	26.28,48.80	26.45,47.06	27.37,45.66	23.64,46.15
path	22.34,50.55
Kill Raptor enemies around this area
collect 50 Raptor Egg##3685 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 175 |or
step
Enter the building |goto Stormwind City 71.71,39.83 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
talk Erika Tate##5483
|tip Downstairs inside the building.
buy 50 Hot Spices##2692 |goto Stormwind City 76.06,36.76
'|complete skill("Cooking") >= 175 |or
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 50 Curiously Tasty Omelets>_
Reach Skill 175 in Cooking |skill Cooking,175 |goto Stormwind City 75.97,36.50
step
talk Hammon Karwn##2810
buy Recipe: Roast Raptor##12228 |n
use the Recipe: Roast Raptor##12228
Train Roast Raptor |learn Roast Raptor##15855 |goto Arathi Highlands 46.49,47.41
step
label "Collect_60_Raptor_Flesh"
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	30.64,25.20	30.40,23.48	31.45,23.06	31.36,21.37	30.71,18.47
path	29.83,16.33	28.80,16.28	27.47,16.45	26.82,17.50	26.75,15.82
path	25.58,15.93	23.70,15.50
Kill Raptor enemies around this area
collect 60 Raptor Flesh##12184 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 225 |or
'|goto Stranglethorn Vale 23.70,15.50 < 20 |noway |c |or
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	23.70,15.50	25.58,15.93	26.75,15.82	26.82,17.50	27.47,16.45
path	28.80,16.28	29.83,16.33	30.71,18.47	31.36,21.37	31.45,23.06
path	30.40,23.48	30.64,25.20
Kill Raptor enemies around this area
collect 60 Raptor Flesh##12184 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 225 |or
'|goto Stranglethorn Vale 30.64,25.20 < 20 |noway |c |next "Collect_60_Raptor_Flesh" |or
step
Run up the stairs |goto Ironforge 57.55,37.38 < 5 |only if walking
Enter the building |goto Ironforge 59.42,37.75 < 5 |walk
talk Emrul Riknussun##5160
|tip Downstairs inside the building.
buy 60 Hot Spices##2692 |goto Ironforge 59.88,37.37
'|complete skill("Cooking") >= 225 |or
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Potbelly Stove.
|tip Inside the building.
_<Create 60 Roast Raptors>_
Reach Skill 225 in Cooking |skill Cooking,225 |goto Ironforge 75.95,36.52
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
map The Hinterlands
path	follow smart;	loop on;	ants curved;	dist 30
path	44.80,59.32	47.13,56.54	50.76,57.53	55.91,52.30	59.36,53.56
path	62.11,54.23	61.51,46.51	57.53,46.76	51.91,41.76	47.07,45.83
path	41.96,47.60	44.40,54.54
Kill Owlbeast enemies around this area
|tip Follow the path and kill them as you find them.
collect 12 Giant Egg##12207 |q 6610 |future
|tip You can also purchase them from the Auction House. |only if not selfmade
step
Enter the building |goto Ironforge 59.33,37.84 < 7 |walk
talk Daryl Riknussun##5159
accept I Know A Guy...##6612 |goto Ironforge 60.08,36.43
step
Enter the building |goto Dustwallow Marsh 67.83,47.76 < 10 |walk
talk Dwane Wertle##4891
|tip Inside the building.
buy 20 Alterac Swiss##8932 |goto Dustwallow Marsh 68.17,47.35 |q 6610 |future
|tip It may be cheaper on the Auction House. |only if not selfmade
step
Enter the building |goto Tanaris 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin I Know A Guy...##6612 |goto Tanaris 52.63,28.11
accept Clamlette Surprise##6610 |goto Tanaris 52.63,28.11
step
kill Steeljaw Snapper##14123+
|tip They look like turtles.
collect Big-mouth Clam##7973+ |n
use the Big-mouth Clam##7973+
collect 10 Zesty Clam Meat##7974 |q 6610/2 |goto Tanaris 67.75,22.96 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
You can find more around:
[67.09,18.71]
[67.51,26.30]
[67.68,29.49]
step
Enter the building |goto Tanaris 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin Clamlette Surprise##6610 |goto Tanaris 52.63,28.11
step
Train Artisan Cook |skillmax Cooking,300 |goto Tanaris 52.63,28.11
|tip You will learn this automatically.
step
Enter the building |goto Winterspring 61.32,38.72 < 5 |walk
talk Himmik##11187
|tip Inside the building.
buy Recipe: Monster Omelet##16110 |n
use the Recipe: Monster Omelet##16110
Train Monster Omelet |learn Monster Omelet##15933 |goto Winterspring 61.33,39.16
step
Leave the building |goto Winterspring 61.32,38.72 < 5 |walk
Enter the building |goto Winterspring 61.33,37.36 < 5 |walk
talk Qia##11189
|tip Inside the building.
buy 120 Soothing Spices##3713 |goto Winterspring 61.20,37.21
'|complete skill("Cooking") >= 275	 |or
step
map The Hinterlands
path	follow smart;	loop on;	ants curved;	dist 30
path	44.80,59.32	47.13,56.54	50.76,57.53	55.91,52.30	59.36,53.56
path	62.11,54.23	61.51,46.51	57.53,46.76	51.91,41.76	47.07,45.83
path	41.96,47.60	44.40,54.54
Kill Owlbeast enemies along this path
collect 60 Giant Egg##12207 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 275 |or
step
Enter the building |goto Stormwind City 71.71,39.83 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 60 Monster Omelets>_
Reach Skill 275 in Cooking |skill Cooking,275 |goto Stormwind City 75.97,36.50
step
Follow the path |goto Tanaris 61.03,26.14 < 50 |only if walking
Enter the building |goto Tanaris 66.66,22.20 < 5 |walk
talk Gikkix##8137
|tip Inside the building.
buy Recipe: Poached Sunscale Salmon##13946 |n
use the Recipe: Poached Sunscale Salmon##13946
Train Poached Sunscale Salmon |learn Poached Sunscale Salmon##18244 |goto Tanaris 66.64,22.08
step
Fish in the Open Water
collect 35 Raw Sunscale Salmon##13760 |goto Feralas 62.39,52.49 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("Cooking") >= 300	 |or
step
Enter the building |goto Stormwind City 71.71,39.83 < 5 |walk
Run down the stairs |goto Stormwind City 74.90,37.61 < 5 |walk
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 35 Poached Sunscale Salmon>_
Reach Skill 300 in Cooking |skill Cooking,300 |goto Stormwind City 75.97,36.50
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Cooking + Fishing (1-300)",{
condition_suggested=function() return (skill('Cooking') > 0) or (skill('Fishing') > 0) end,
description="This guide will walk you through leveling both your Cooking and Fishing skills from 1-300, together.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
talk Tharynn Bouden##66
buy Fishing Pole##6256 |goto Elwynn Forest 41.82,67.16 |or
|tip You need to be able to equip a fishing pole in order to fish.
'|complete skill("Fishing") >= 300 |or
step
talk Tharynn Bouden##66
buy 10 Shiny Bauble##6529 |goto Elwynn Forest 41.82,67.16 |or
'|complete skill("Fishing") >= 75 |or
step
talk Lee Brown##1651
Train Apprentice Fishing |skillmax Fishing,75 |goto Elwynn Forest 47.61,62.32
step
Fish in the Water
|tip Use the "Fishing" skill in your spell book.
|tip Equip the Fishing Pole in your bags.
|tip Save the fish you catch, to cook later.
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 75 in Fishing |skill Fishing,75 |goto Elwynn Forest 47.68,62.52
step
talk Lee Brown##1651
|tip You must be at least level 10 before you can train journeyman skills.
|tip Use the leveling guides to accomplish this.
Train Journeyman Fishing |skillmax Fishing,150 |goto Elwynn Forest 47.61,62.32
step
Enter the building |goto Elwynn Forest 42.94,65.65 < 7 |walk
talk Tomas##1430
|tip Inside the building.
Train Apprentice Cooking |skillmax Cooking,75 |goto Elwynn Forest 44.37,65.99
step
Leave the building |goto Elwynn Forest 42.99,65.65 < 7 |walk
talk Tharynn Bouden##66
buy Recipe: Brilliant Smallfish##6325 |n
use the Recipe: Brilliant Smallfish##6325
Train Brilliant Smallfish |learn Brilliant Smallfish##7751 |goto Elwynn Forest 41.82,67.16
step
talk Tharynn Bouden##66
buy Recipe: Longjaw Mud Snapper##6328 |goto Elwynn Forest 41.82,67.16
|tip Save this for later.
step
talk Catherine Leland##5494
buy Recipe: Bristle Whisker Catfish##6330 |goto Stormwind City 45.77,58.58 |or
|tip Save this for later.
'|complete skill("Cooking") >= 175 |or
step
Fish in the Water
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 130 in Fishing |skill Fishing,130 |goto Stormwind City 45.97,58.54
collect 55 Raw Brilliant Smallfish##6291 |goto Stormwind City 45.97,58.54 |or
'|complete skill("Cooking") >= 50 |or
step
label "Collect_Raw_Longjaw_Mud_Snapper_"
Fish in the Open Water
collect 60 Raw Longjaw Mud Snapper##6289 |goto Stormwind City 45.97,58.54 |or
'|complete skill("Cooking") >= 100 |or
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 71.65,39.88 < 5 |walk
Run down the stairs |goto Stormwind City 74.87,37.66 < 5 |walk
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 55 Brilliant Smallfish>_
Reach Skill 50 in Cooking |skill Cooking,50 |goto Stormwind City 75.96,36.54
step
use the Recipe: Longjaw Mud Snapper##6328
|tip You should have this from earlier in the guide.
Train Longjaw Mud Snapper |learn Longjaw Mud Snapper##7753
step
talk Stephen Ryback##5482
|tip Downstairs inside the building.
Train Journeyman Cooking |skillmax Cooking,150 |goto Stormwind City 75.60,37.04
step
Open Your Cooking Crafting Panel:
|tip Stand next to the Warm Fire.
|tip Downstairs inside the building.
_<Create 60 Longjaw Mud Snappers>_
Reach Skill 100 in Cooking |skill Cooking,100 |goto Stormwind City 75.96,36.54
step
use the Recipe: Bristle Whisker Catfish##6330
Train Bristle Whisker Catfish |learn Bristle Whisker Catfish##7755
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Run down the ramp |goto Stranglethorn Vale 28.04,76.53 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 27.47,77.09 < 5 |walk
talk Old Man Heming##2626
|tip Inside the building.
buy Expert Fishing - The Bass and You##16083 |n
use Expert Fishing - The Bass and You##16083
Train Expert Fishing |skillmax Fishing,225 |goto Stranglethorn Vale 27.42,77.16
step
talk Old Man Heming##2626
|tip Inside the building.
buy 20 Bright Baubles##6532 |goto Stranglethorn Vale 27.42,77.16 |or
'|complete skill("Fishing") >= 225 |or
step
Enter the building |goto Stranglethorn Vale 28.11,74.99 < 10 |walk
talk Kelsey Yance##2664
|tip Inside the building.
buy Recipe: Mithril Head Trout##17062 |goto Stranglethorn Vale 28.23,74.34
buy Recipe: Filet of Redgill##13941 |goto Stranglethorn Vale 28.23,74.34
|tip Save these for later.
step
Enter the building |goto Ashenvale 35.64,51.01 < 10 |only if walking
talk Haljan Oakheart##3962
|tip Inside the building.
buy Flint and Tinder##4471 |goto Ashenvale 34.85,50.87 |only if itemcount(4471) < 1
|tip You need to have Flint and Tinder in your bags to be able to create Basic Campfires to cook with.
buy 10 Simple Wood##4470 |goto Ashenvale 34.85,50.87 |only if itemcount(4470) < 15 and skill("Cooking") < 300
|tip You will use one of these each time you create a Basic Campfire to cook with.
step
Follow the path down |goto Ashenvale 51.22,58.21 < 20 |only if walking
Enter the building |goto Ashenvale 50.12,66.48 < 10 |walk
talk Shandrina##3955
|tip Inside the building.
buy Expert Cookbook##16072 |goto Ashenvale 49.48,67.09
|only if skillmax("Cooking") < 225
|tip Save this for later.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 205 in Fishing |skill Fishing,205 |goto Ashenvale 48.90,68.23
collect 150 Raw Bristle Whisker Catfish##6308 |goto Ashenvale 48.90,68.23 |or
'|complete skill("Cooking") >= 175 |or
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 25 Bristle Whisker Catfish>_
Reach Skill 125 in Cooking |skill Cooking,125 |goto Ashenvale 48.80,67.66
step
use the Expert Cookbook##16072
Train Expert Cooking |skillmax Cooking,225
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 125 Bristle Whisker Catfish>_
Reach Skill 175 in Cooking |skill Cooking,175 |goto Ashenvale 48.80,67.66
step
use the Recipe: Mithril Head Trout##17062
Train Mithril Head Trout |learn Mithril Head Trout##20916
step
Enter the building |goto Dustwallow Marsh 65.99,45.20 < 7 |walk
talk Craig Nollward##4894
|tip Inside the building.
buy 20 Alterac Swiss##8932 |goto Dustwallow Marsh 66.90,45.26 |q 6610 |future
|tip It may be cheaper on the Auction House. |only if not selfmade
|tip Save these for later.
step
Leave the building |goto Dustwallow Marsh 65.99,45.20 < 7 |walk
Cross the bridge and follow the road |goto Dustwallow Marsh 64.30,45.63 < 20 |only if walking
Fish in the Water
|tip Save any Raw Mithril Head Trout you catch.
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 225 in Fishing |skill Fishing,225 |goto Dustwallow Marsh 59.12,36.84
step
Reach Level 35 |ding 35
|tip You must be at least this level before you can accept the quest in the next step.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Ironforge 47.60,7.35 < 7 |walk
talk Grimnur Stonebrand##5161
|tip Upstairs inside the building.
accept I Got Nothin' Left!##6609 |goto Ironforge 48.07,6.91
step
Cross the water |goto Dustwallow Marsh 66.54,55.09 < 30 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
turnin I Got Nothin' Left!##6609 |goto Dustwallow Marsh 58.55,60.21
accept Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Feralas Ahi##16967 |q 6607/1 |goto Feralas 62.38,52.50 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Sar'theris Striker##16968 |q 6607/3 |goto Desolace 38.96,22.70 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Misty Reed Mahi Mahi##16970 |q 6607/2 |goto Swamp of Sorrows 90.45,73.47 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Savage Coast Blue Sailfin##16969 |q 6607/4 |goto Stranglethorn Vale 24.58,65.80 |or
|tip You will eventually catch one.
step
Cross the water |goto Dustwallow Marsh 66.54,55.09 < 30 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
turnin Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
Train Artisan Fishing |skillmax Fishing,300 |goto Dustwallow Marsh 58.55,60.21
|tip You will learn this automatically.
step
Cross the water |goto Dustwallow Marsh 66.54,55.09 < 15 |only if walking
Cross the bridge and follow the road |goto Dustwallow Marsh 64.30,45.63 < 20 |only if walking
Fish in the Water
|tip Save any Raw Mithril Head Trout you catch.
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 255 in Fishing |skill Fishing,255 |goto Dustwallow Marsh 59.12,36.84
collect 60 Raw Mithril Head Trout##8365 |goto Dustwallow Marsh 59.12,36.84 |or
'|complete skill("Cooking") >= 225 |or
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 60 Mithril Head Trout>_
Reach Skill 225 in Cooking |skill Cooking,225 |goto Dustwallow Marsh 59.08,37.04
step
use the Recipe: Filet of Redgill##13941
Train Filet of Redgill |learn Filet of Redgill##18241
step
Enter the building |goto Tanaris 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
accept Clamlette Surprise##6610 |goto Tanaris 52.63,28.11
step
kill Steeljaw Snapper##14123+
|tip They look like turtles.
collect Big-mouth Clam##7973+ |n
use the Big-mouth Clam##7973+
collect 10 Zesty Clam Meat##7974 |q 6610/2 |goto Tanaris 67.75,22.96 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
You can find more around:
[67.09,18.71]
[67.51,26.30]
[67.68,29.49]
step
map The Hinterlands
path	follow smart;	loop on;	ants curved;	dist 30
path	44.80,59.32	47.13,56.54	50.76,57.53	55.91,52.30	59.36,53.56
path	62.11,54.23	61.51,46.51	57.53,46.76	51.91,41.76	47.07,45.83
path	41.96,47.60	44.40,54.54
Kill Owlbeast enemies
|tip Follow the path and kill them as you find them.
collect 12 Giant Egg##12207 |q 6610/1 |or
|tip You can also purchase them from the Auction House. |only if not selfmade
step
Enter the building |goto Stormwind City 59.96,64.18 < 5 |walk
talk Ben Trias##4981
|tip Inside the building.
buy 20 Alterac Swiss##8932 |q 6610/3 |goto Stormwind City 60.33,63.42
|tip It may be cheaper on the Auction House. |only if not selfmade
step
Enter the building |goto Tanaris 52.38,27.91 < 5 |walk
talk Dirge Quikcleave##8125
|tip Inside the building.
turnin Clamlette Surprise##6610 |goto Tanaris 52.63,28.11
Train Artisan Cook |skillmax Cooking,300 |goto Tanaris 52.63,28.11
|tip You will learn this automatically.
step
Follow the path |goto Tanaris 61.03,26.14 < 50 |only if walking
Enter the building |goto Tanaris 66.66,22.20 < 5 |walk
talk Gikkix##8137
|tip Inside the building.
buy Recipe: Spotted Yellowtail##13939 |n
use the Recipe: Spotted Yellowtail##13939
Train Spotted Yellowtail |learn Spotted Yellowtail##18238 |goto Tanaris 66.64,22.08
step
talk Gikkix##8137
|tip Inside the building.
|tip Buy these recipes and save them for later.
buy Recipe: Nightfin Soup##13945 |goto Tanaris 66.64,22.08
buy Recipe: Poached Sunscale Salmon##13946 |goto Tanaris 66.64,22.08
step
talk Vivianna##7947
|tip Inside the building.
buy 20 Bright Baubles##6532 |goto Feralas 31.30,43.46 |or
'|complete skill("Cooking") >= 300 |or
stickystart "Collect_Raw_Redgill"
stickystart "Collect_Raw_Sunscale_Salmon_Nightfin_Snapper"
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 300 in Fishing |skill Fishing,300 |goto Feralas 62.39,52.49
collect 20 Raw Mithril Head Trout##8365 |goto Feralas 62.39,52.49 |or
'|complete skill("Cooking") >= 250 |or
step
label "Collect_Raw_Redgill"
Fish in the Water							|notinsticky
use the Bright Baubles##6532+						|notinsticky
|tip Use it on your Fishing Pole.					|notinsticky
|tip These will allow you to catch fish easier.				|notinsticky
|tip Try to keep one of these active whenever you are fishing.		|notinsticky
collect 50 Raw Redgill##13758 |goto Feralas 62.39,52.49 |or
'|complete skill("Cooking") >= 280 |or
step
label "Collect_Raw_Sunscale_Salmon_Nightfin_Snapper"
Fish in the Water							|notinsticky
use the Bright Baubles##6532+						|notinsticky
|tip Use it on your Fishing Pole.					|notinsticky
|tip These will allow you to catch fish easier.				|notinsticky
|tip Try to keep one of these active whenever you are fishing.		|notinsticky
Catch Either These Fish:
|tip Depending on the server time when you are fishing, you will likely find one of these fish much easier.
|tip Just collect the fish you find faster, you don't need both.
collect 35 Raw Nightfin Snapper##13759 |goto Feralas 62.39,52.49 |or
collect 35 Raw Sunscale Salmon##13760 |goto Feralas 62.39,52.49 |or
'|complete skill("Cooking") >= 300 |or
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 20 Mithril Headed Trout>_
Reach Skill 235 in Cooking |skill Cooking,235 |goto Feralas 62.34,52.70
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 50 Filets of Redgill>_
Reach Skill 275 in Cooking |skill Cooking,275 |goto Feralas 62.34,52.70
step
use the Recipe: Nightfin Soup##13945
learn Nightfin Soup##18243
step
use the Recipe: Poached Sunscale Salmon##13946
learn Poached Sunscale Salmon##18244
step
_Create a Basic Campfire_
|tip Use the "Basic Campfire" skill in your spell book.
Open Your Cooking Crafting Panel:
|tip Stand next to the Basic Campfire.
_<Create 35 Poached Sunscale Salmon or Nightfin Soup>_
|tip The recipe you use will depend on which fish you caught easier in an earlier step.
|tip Cook whichever of these fish you have.
Reach Skill 300 in Cooking |skill Cooking,300 |goto Feralas 62.34,52.70
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Chunk of Boar Meat",{
hardcore = true,
},[[
step
kill Stonetusk Boar##113
collect Chunk of Boar Meat##769 |n |goto Elwynn Forest 41.81,87.22
You can find more around this area [32.96,84.95]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Small Egg",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Stringy Wolf Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Small Spider Leg",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crag Boar Rib",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Spider Ichor",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Coyote Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Boar Intestines",{
hardcore = true,
},[[
step
label "Path_One"
map Westfall
path follow smart; loop off; dist 20
path	62.45,42.12	61.05,38.49	59.20,30.20	58.69,26.18	58.85,22.18
path	55.99,22.99	53.72,26.55	51.15,26.31	48.14,25.64	47.04,19.68
path	44.81,17.52	42.78,19.23	41.83,24.14	41.27,26.78	42.70,31.93
path	39.81,33.77	36.63,30.63	34.38,34.44	33.43,38.91	35.02,42.09
path	38.51,42.85
Kill Boar enemies along this path
collect Boar Intestines##3172 |n
'|goto Westfall 38.51,42.85 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	38.51,42.85	35.02,42.09	33.43,38.91	34.38,34.44	36.63,30.63
path	39.81,33.77	42.70,31.93	41.27,26.78	41.83,24.14	42.78,19.23
path	44.81,17.52	47.04,19.68	48.14,25.64	51.15,26.31	53.72,26.55
path	55.99,22.99	58.85,22.18	58.69,26.18	59.20,30.20	61.05,38.49
path	62.45,42.12
Kill Boar enemies along this path
collect Boar Intestines##3172 |n
'|goto Westfall 62.45,42.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Stringy Vulture Meat",{
hardcore = true,
},[[
step
label "Path_One"
map Westfall
path follow smart; loop off; dist 20
path	62.45,42.12	61.05,38.49	59.20,30.20	58.69,26.18	58.85,22.18
path	55.99,22.99	53.72,26.55	51.15,26.31	48.14,25.64	47.04,19.68
path	44.81,17.52	42.78,19.23	41.83,24.14	41.27,26.78	42.70,31.93
path	39.81,33.77	36.63,30.63	34.38,34.44	33.43,38.91	35.02,42.09
path	38.51,42.85
Kill Vulture enemies along this path
collect Stringy Vulture Meat##729 |n
'|goto Westfall 38.51,42.85 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	38.51,42.85	35.02,42.09	33.43,38.91	34.38,34.44	36.63,30.63
path	39.81,33.77	42.70,31.93	41.27,26.78	41.83,24.14	42.78,19.23
path	44.81,17.52	47.04,19.68	48.14,25.64	51.15,26.31	53.72,26.55
path	55.99,22.99	58.85,22.18	58.69,26.18	59.20,30.20	61.05,38.49
path	62.45,42.12
Kill Vulture enemies along this path
collect Stringy Vulture Meat##729 |n
'|goto Westfall 62.45,42.12 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Strider Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Kodo Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Murloc Eye",{
hardcore = true,
},[[
step
Kill Murloc enemies around this area
|tip They spawn all along the coast, so you can move down to get more.
collect Murloc Eye##730 |n |goto Westfall 55.73,9.49
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Bear Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Goretusk Snout",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Goretusk Liver",{
hardcore = true,
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
collect Goretusk Liver##723 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crawler Meat",{
hardcore = true,
},[[
step
map Westfall
path follow smart; loop off; dist 20
path	51.32,9.67	49.06,10.01	44.72,8.70	41.78,10.34	38.85,13.51
path	36.20,18.29	33.45,22.08	31.88,24.30
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Meat##2674 |n
'|goto Westfall 31.88,24.30 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	31.88,24.30	33.45,22.08	36.20,18.29	38.85,13.51	41.78,10.34
path	44.72,8.70	49.06,10.01	51.32,9.67
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Meat##2674 |n
'|goto Westfall 51.32,9.67 < 20 |noway |c
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crawler Claw",{
hardcore = true,
},[[
step
map Westfall
path follow smart; loop off; dist 20
path	51.32,9.67	49.06,10.01	44.72,8.70	41.78,10.34	38.85,13.51
path	36.20,18.29	33.45,22.08	31.88,24.30
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Claw##2675 |n
'|goto Westfall 31.88,24.30 < 20 |noway |c
step
map Westfall
path follow smart; loop off; dist 20
path	31.88,24.30	33.45,22.08	36.20,18.29	38.85,13.51	41.78,10.34
path	44.72,8.70	49.06,10.01	51.32,9.67
Kill Crawler enemies around this area
|tip You can find more further down the coast.
collect Crawler Claw##2675 |n
'|goto Westfall 51.32,9.67 < 20 |noway |c
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Clam Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Boar Ribs",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Crocolisk Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tough Condor Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Soft Frenzy Flesh",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raw Loch Frenzy",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Murloc Fin",{
hardcore = true,
},[[
step
map Ashenvale
path follow smart; loop on; ants curved; dist 20
path	20.90,40.21	21.33,41.92	21.06,43.30	20.66,44.48	19.75,43.65
path	19.08,42.84	18.81,41.34	18.96,40.20	19.58,41.07
Kill Saltspittle enemies around this area
collect Murloc Fin##1468 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Lean Wolf Flank",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Big Bear Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Egg",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Thunder Lizard Tail",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tangy Clam Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tender Crocolisk Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Lion Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Stag Meat",{
hardcore = true,
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
'|goto Stonetalon Mountains 39.49,6.04 < 20 |noway |c
step
map Stonetalon Mountains
path follow smart; loop off; dist 20
path	39.49,6.04	40.73,6.34	40.29,8.62	39.94,10.54	39.42,12.31
path	40.17,15.24	41.50,15.94	43.26,16.08	44.13,17.21	44.66,19.95
path	44.95,22.28	45.77,24.36	46.38,25.94	46.84,28.49	46.91,32.12
path	48.15,33.61	49.75,34.63	50.21,36.84
Kill Courser enemies along this path
collect Stag Meat##5471 |n
'|goto Stonetalon Mountains 50.21,36.84 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Gooey Spider Leg",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Mystery Meat",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Red Wolf Meat",{
hardcore = true,
},[[
step
map The Hinterlands
path follow smart; loop on; ants curved; dist 20
path	16.99,49.54	14.76,51.94	16.34,54.97	19.20,54.81	21.00,55.69
path	22.67,53.75	24.13,52.68	22.29,51.46	20.61,50.68	19.10,49.49
kill Mangy Silvermane##2923+
collect Red Wolf Meat##12203 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Turtle Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Tiger Meat",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Raptor Flesh",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Buzzard Wing",{
hardcore = true,
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
Kill Dread enemies around this area
collect Buzzard Wing##3404 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Cooking\\Farming Guides\\Giant Clam Meat",{
hardcore = true,
},[[
step
click Giant Clam##2744+
|tip They look like large shells underwater around this area.
|tip Elixirs of Water Breathing are very helpful while farming these.
collect Giant Clam Meat##4655 |n |goto Stranglethorn Vale 26.75,26.88
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Water",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Only Plague Ravagers and Blighted Surges will drop this item.
collect Essence of Water##7080 |n |goto Eastern Plaguelands 61.65,81.13
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Living Essence",{
hardcore = true,
},[[
step
Kill Tar enemies around this area
collect Living Essence##12803 |n |goto Un'Goro Crater 46.46,17.23
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Fire",{
hardcore = true,
},[[
step
Follow the path up |goto Un'Goro Crater 52.06,42.40 < 10 |only if walking
Kill enemies around this area
collect Essence of Fire##7078 |n |goto Un'Goro Crater 49.32,48.31
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Air",{
hardcore = true,
},[[
step
kill Dust Stormer##11744+
collect Essence of Air##7082 |n |goto Silithus 31.69,18.15
|tip These have a low drop rate.
You can find more around [21.34,29.92]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Earth",{
hardcore = true,
},[[
step
kill Desert Rumbler##11746+
collect Essence of Earth##7076 |n |goto Silithus 22.37,11.12
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Essence of Undeath",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Heart of the Wild",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Ichor of Undeath",{
hardcore = true,
},[[
step
Kill Highborne enemies around this area
collect Ichor of Undeath##7972 |n |goto Winterspring 52.59,40.68
|tip These have a low drop rate.
You can find more around: |notinsticky
[53.62,42.09]
[56.02,44.24]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Heart of Fire",{
hardcore = true,
},[[
step
Kill Entropic enemies around this area
collect Heart of Fire##7077 |n |goto Felwood 40.92,40.34
|tip These have a low drop rate.
You can find more around [42.51,37.87]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Globe of Water",{
hardcore = true,
},[[
step
kill Toxic Horror##7132+
collect Globe of Water##7079 |n |goto Felwood 49.48,23.46
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Core of Earth",{
hardcore = true,
},[[
step
kill Desert Rumbler##11746+
collect Core of Earth##7075 |n |goto Silithus 22.94,12.29
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Breath of Wind",{
hardcore = true,
},[[
step
kill Dust Stormer##11744+
collect Breath of Wind##7081 |n |goto Silithus 31.69,18.15
|tip These have a low drop rate.
You can find more around [21.34,29.92]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Fire",{
hardcore = true,
},[[
step
kill Burning Exile##2760+
collect Elemental Fire##7068 |n |goto Arathi Highlands 24.80,29.95
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Earth",{
hardcore = true,
},[[
step
Follow the path up |goto Badlands 46.37,77.20
kill Rock Elemental##92+
collect Elemental Earth##7067 |n |goto Badlands 43.30,84.24
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Water",{
hardcore = true,
},[[
step
kill Cresting Exile##2761+
collect Elemental Water##7070 |n |goto Arathi Highlands 66.70,29.91
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Elements\\Farming Guides\\Elemental Air",{
hardcore = true,
},[[
step
kill Thundering Exile##2762+
collect Elemental Air##7069 |n |goto Arathi Highlands 52.03,50.77
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Enchanting (1-300)",{
condition_suggested=function() return skill('Enchanting') > 0 end,
description="This guide will walk you through leveling your Enchanting skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 43.68,63.87 < 5 |walk
talk Betty Quin##11068
|tip Inside the building.
Train Apprentice Enchanting |skillmax Enchanting,75 |goto Stormwind City 43.11,63.71
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Enchanting |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Enchanting") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Soul_Dust_Total"
stickystart "Collect_Vision_Dust_Total"
stickystart "Collect_Dream_Dust_Total"
stickystart "Collect_Illusion_Dust_Total"
step
cast Disenchant##13262
collect 157 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 5-25 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Soul_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 60 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-35 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 165 |or
step
label "Collect_Vision_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 278 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 250 |or
step
label "Collect_Dream_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 440 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 46-55 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 294 |or
step
label "Collect_Illusion_Dust_Total"
cast Disenchant##13262 |notinsticky
collect 50 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 56-60 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 300 |or
stickystart "Collect_Lesser_Astral_Essence_Total"
stickystart "Collect_Greater_Astral_Essence_Total"
stickystart "Collect_Lesser_Mystic_Essence_Total"
stickystart "Collect_Greater_Mystic_Essence_Total"
stickystart "Collect_Greater_Eternal_Essence_Total"
step
cast Disenchant##13262
collect 12 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting. |only if selfmade
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Enchanting") >= 110 |or
step
label "Collect_Lesser_Astral_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 25 Lesser Astral Essence##10998 |or
|tip Disenchant level 21-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 21-25 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 135 |or
step
label "Collect_Greater_Astral_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 2 Greater Astral Essence##11082 |or
|tip Disenchant level 26-30 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-30 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 151 |or
step
label "Collect_Lesser_Mystic_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 20 Lesser Mystic Essence##11134 |or
|tip Disenchant level 31-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 31-35 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 185 |or
step
label "Collect_Greater_Mystic_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 2 Greater Mystic Essence##11135 |or
|tip Disenchant level 36-40 uncommon (green) items with Enchanting or purchase them from the auction house.
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Greater_Eternal_Essence_Total"
cast Disenchant##13262 |notinsticky
collect 4 Greater Eternal Essence##16203 |or
|tip Disenchant level 51-56 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 51-56 uncommon (green) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 295 |or
stickystart "Collect_Golden_Rod_Total"
stickystart "Collect_Truesilver_Rod_Total"
stickystart "Collect_Arcanite_Rod_Total"
step
collect 1 Silver Rod##6338 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |only if not selfmade
|tip Create it with Blacksmithing. |only if selfmade
|tip It requires 1 Silver bar and 2 Rough Grinding Stones to craft.
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Golden_Rod_Total"
collect Golden Rod##11128 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |notinsticky |only if not selfmade
|tip Create it with Blacksmithing. |notinsticky |only if selfmade
|tip It requires 1 Gold Bar and 2 Coarse Grinding Stones to craft. |notinsticky
'|complete skill("Enchanting") >= 156 |or
step
label "Collect_Truesilver_Rod_Total"
collect Truesilver Rod##11144 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |notinsticky |only if not selfmade
|tip Create it with Blacksmithing. |notinsticky |only if selfmade
|tip It requires 1 Truesilver Bar and 1 Heavy Grinding Stones to craft. |notinsticky
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Arcanite_Rod_Total"
collect Arcanite Rod##16206 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |notinsticky |only if not selfmade
|tip Create it with Blacksmithing. |notinsticky |only if selfmade
|tip It takes 3 Arcanite Bars and 1 Dense Grinding Stone to craft. |notinsticky
'|complete skill("Enchanting") >= 295 |or
stickystart "Collect_Iridescent_Pearl_Total"
stickystart "Collect_Black_Pearl_Total"
stickystart "Collect_Golden_Pearl_Total"
stickystart "Collect_Purple_Lotus_Total"
stickystart "Collect_Small_Brilliant_Shard_Total"
stickystart "Collect_Large_Brilliant_Shard_Total"
step
collect 1 Shadowgem##1210 |or
|tip Farm it with Mining or purchase it from the auction house. |only if not selfmade
|tip Farm it with Mining. |only if selfmade
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Iridescent_Pearl_Total"
collect 1 Iridescent Pearl##5500 |or
|tip Farm it using the "Iridescent Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Iridescent Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 156 |or
step
label "Collect_Black_Pearl_Total"
collect Black Pearl##7971 |or
|tip Farm it using the "Black Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Black Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Golden_Pearl_Total"
collect Golden Pearl##13926 |or
|tip Farm it using the "Golden Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Golden Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Purple_Lotus_Total"
collect 40 Purple Lotus##8831 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Enchanting") >= 265 |or
step
label "Collect_Small_Brilliant_Shard_Total"
collect 4 Small Brilliant Shard##14343 |or
|tip Disenchant level 46-51 rare (blue) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 46-51 rare (blue) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Large_Brilliant_Shard_Total"
collect 2 Large Brilliant Shard##14344 |or
|tip Disenchant level 51-60 rare (blue) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 51-60 rare (blue) items with Enchanting. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Enchanting") >= 295 |or
step
label "Begin_Profession_Leveling"
talk Jessara Cordell##1318
|tip Inside the building.
buy Copper Rod##6217 |goto Stormwind City 42.81,64.39 |or 3
buy Strange Dust##10940 |goto Stormwind City 42.81,64.39 |or 3
buy Lesser Magic Essence##10938 |goto Stormwind City 42.81,64.39 |or 3
|tip These are limited supply items that can also be purchased from the auction house. |only if not selfmade
|tip These are limited supply items. |only if selfmade
'|complete skill("Enchanting") >= 2 |or
step
Open Your Enchanting Crafting Panel:
_<Create 1 Runed Copper Rod>_
|tip Save this, you will need it later.
Reach Skill 2 in Enchanting |skill Enchanting,2
step
cast Disenchant##13262
collect 95 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 5-25 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 75 |or
step
Open Your Enchanting Crafting Panel:
_<Create 75 Enchant Bracer - Minor Health>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Minor Health enchant requires one Strange Dust.
Reach Skill 75 in Enchanting |skill Enchanting,75
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 43.68,63.87 < 5 |walk
talk Lucan Cordell##1317
|tip Inside the building.
Train Journeyman Enchanting |skillmax Enchanting,150 |goto Stormwind City 42.94,64.64
step
talk Lucan Cordell##1317
|tip Inside the building.
Train Enchant Bracer - Minor Stamina |learn Enchant Bracer - Minor Stamina##7457 |goto Stormwind City 42.94,64.64
step
Open Your Enchanting Crafting Panel:
_<Create 20 Enchant Bracer - Minor Health>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Minor Health enchant requires one Strange Dust.
Reach Skill 90 in Enchanting |skill Enchanting,90
step
cast Disenchant##13262
collect 30 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 5-25 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 90 |or
step
Open Your Enchanting Crafting Panel:
_<Create 10 Enchant Bracer - Minor Stamina>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
Reach Skill 100 in Enchanting |skill Enchanting,100
step
Enter the building |goto Stormwind City 43.68,63.87 < 5 |walk
talk Lucan Cordell##1317
|tip Inside the building.
Train Runed Silver Rod |learn Runed Silver Rod##7795 |goto Stormwind City 42.94,64.64
stickystart "Collect_Greater_Magic_Essence_101"
stickystart "Collect_Silver_Rod_101"
stickystart "Collect_Shadowgem_101"
step
cast Disenchant##13262
collect 6 Strange Dust##10940 |or
|tip Disenchant level 5-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 5-25 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Greater_Magic_Essence_101"
cast Disenchant##13262 |notinsticky
collect 3 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting. |only if selfmade
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Silver_Rod_101"
collect 1 Silver Rod##6338 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |only if not selfmade
|tip Create it with Blacksmithing. |only if selfmade
|tip It requires 1 Silver bar and 2 Rough Grinding Stones to craft.
'|complete skill("Enchanting") >= 101 |or
step
label "Collect_Shadowgem_101"
collect 1 Shadowgem##1210 |or
|tip Farm it with Mining or purchase it from the auction house. |only if not selfmade
|tip Farm it with Mining. |only if selfmade
'|complete skill("Enchanting") >= 101 |or
step
Open Your Enchanting Crafting Panel:
_<Create 1 Runed Silver Rod>_
|tip Save this, you will need it later.
Reach Skill 101 in Enchanting |skill Enchanting,101
step
talk Lucan Cordell##1317
|tip Inside the building.
Train Greater Magic Wand |learn Greater Magic Wand##14807 |goto Stormwind City 42.94,64.64
step
cast Disenchant##13262
collect 9 Greater Magic Essence##10939 |or
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 9-15 uncommon (green) armor and level 9-25 uncommon (green) weapons with Enchanting. |only if selfmade
|tip You can combine 3 Lesser Magic Essences to create 1 Greater Magic Essence.
'|complete skill("Enchanting") >= 110 |or
step
Enter the building |goto Stormwind City 43.68,63.87 < 5 |walk
talk Jessara Cordell##1318
|tip Inside the building.
buy 9 Simple Wood##4470 |goto Stormwind City 42.81,64.39 |or
'|complete skill("Enchanting") >= 110 |or
step
Open Your Enchanting Crafting Panel:
_<Create 9 Greater Magic Wands>_
Reach Skill 110 in Enchanting |skill Enchanting,110
step
Enter the building |goto Ashenvale 35.64,50.99 < 10 |walk
talk Dalria##3954
|tip Inside the building.
buy Formula: Enchant Cloak - Minor Agility##11039 |goto Ashenvale 35.12,52.12 |or 2
buy Formula: Enchant Bracer - Lesser Strength##11101 |goto Ashenvale 35.12,52.12 |or 2
|tip These are limited supply items that can also be purchased from the auction house. |only if not selfmade
|tip These are limited supply items. |only if selfmade
'|complete skill("Enchanting") >= 165 |or
step
use the Formula: Enchant Cloak - Minor Agility##11039
Train Enchant Cloak - Minor Agility |learn Enchant Cloak - Minor Agility##13419
step
cast Disenchant##13262
collect 25 Lesser Astral Essence##10998 |or
|tip Disenchant level 21-25 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 21-25 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 135 |or
step
Open Your Enchanting Crafting Panel:
_<Create 25 Enchant Cloak - Minor Agility>_
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
Reach Skill 135 in Enchanting |skill Enchanting,135
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Expert Enchanting |skillmax Enchanting,225 |goto Elwynn Forest 64.93,70.71
step
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Enchant Bracer - Lesser Stamina |learn Enchant Bracer - Lesser Stamina##13501 |goto Elwynn Forest 64.93,70.71
step
cast Disenchant##13262
collect 40 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-35 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 155 |or
step
Open Your Enchanting Crafting Panel:
_<Create 20 Enchant Bracer - Lesser Stamina>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
Reach Skill 155 in Enchanting |skill Enchanting,155
step
use the Formula: Enchant Bracer - Lesser Strength##11101
|tip You purchased this in a previous step.
Train Enchant Bracer - Lesser Strength |learn Enchant Bracer - Lesser Strength##13536
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Runed Golden Rod |learn Runed Golden Rod##13628 |goto Elwynn Forest 64.92,70.71
stickystart "Collect_Soul_Dust_151"
stickystart "Collect_Golden_Rod_151"
stickystart "Collect_Iridescent_Pearl_151"
step
cast Disenchant##13262
collect 2 Greater Astral Essence##11082 |or
|tip Disenchant level 26-30 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-30 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 156 |or
step
label "Collect_Soul_Dust_151"
cast Disenchant##13262 |notinsticky
collect 2 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-35 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 156 |or
step
label "Collect_Golden_Rod_151"
collect Golden Rod##11128 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |only if not selfmade
|tip Create it with Blacksmithing. |only if selfmade
|tip It requires 1 Gold Bar and 2 Coarse Grinding Stones to craft.
'|complete skill("Enchanting") >= 156 |or
step
label "Collect_Iridescent_Pearl_151"
collect 1 Iridescent Pearl##5500 |or
|tip Farm it using the "Iridescent Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Iridescent Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 156 |or
step
Open Your Enchanting Crafting Panel:
_<Create 1 Runed Golden Rod>_
|tip Save this, you will need it later.
Reach Skill 156 in Enchanting |skill Enchanting,156
step
cast Disenchant##13262
collect 18 Soul Dust##11083 |or
|tip Disenchant level 26-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 26-35 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 165 |or
step
Open Your Enchanting Crafting Panel:
_<Create 9 Enchant Bracer - Lesser Strength>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
Reach Skill 165 in Enchanting |skill Enchanting,165
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Enchant Bracer - Spirit |learn Enchant Bracer - Spirit##13642 |goto Elwynn Forest 64.92,70.71
step
cast Disenchant##13262
collect 20 Lesser Mystic Essence##11134 |or
|tip Disenchant level 31-35 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 31-35 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 185 |or
step
Open Your Enchanting Crafting Panel:
_<Create 20 Enchant Bracer - Spirit>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
Reach Skill 185 in Enchanting |skill Enchanting,185
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Enchant Bracer - Strength |learn Enchant Bracer - Strength##13661 |goto Elwynn Forest 64.92,70.71
step
cast Disenchant##13262
collect 15 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 200 |or
step
Open Your Enchanting Crafting Panel:
_<Create 15 Enchant Bracer - Strength>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
Reach Skill 200 in Enchanting |skill Enchanting,200
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Runed Truesilver Rod |learn Runed Truesilver Rod##13702 |goto Elwynn Forest 64.92,70.71
stickystart "Collect_Greater_Mystic_Essence_201"
stickystart "Collect_Truesilver_Rod_201"
stickystart "Collect_Black_Pearl_201"
step
cast Disenchant##13262
collect 2 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Greater_Mystic_Essence_201"
collect 2 Greater Mystic Essence##11135 |or
|tip Disenchant level 36-40 uncommon (green) items with Enchanting or purchase them from the auction house.
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Truesilver_Rod_201"
collect Truesilver Rod##11144 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |only if not selfmade
|tip Create it with Blacksmithing. |only if selfmade
|tip It requires 1 Truesilver Bar and 1 Heavy Grinding Stones to craft.
'|complete skill("Enchanting") >= 201 |or
step
label "Collect_Black_Pearl_201"
collect Black Pearl##7971 |or
|tip Farm it using the "Black Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Black Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 201 |or
step
Open Your Enchanting Crafting Panel:
_<Create 1 Runed Truesilver Rod>_
|tip Save this, you will need it later.
Reach Skill 201 in Enchanting |skill Enchanting,201
step
cast Disenchant##13262
collect 35 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 220 |or
step
Open Your Enchanting Crafting Panel:
_<Create 35 Enchant Bracer - Strength>_
|tip Place then enchant on a bracer slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' bracers to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Strength enchant requires one Vision Dust.
Reach Skill 220 in Enchanting |skill Enchanting,220
step
Enter the building |goto Elwynn Forest 64.42,69.12 < 7 |walk
talk Kitta Firewind##11072
|tip Upstairs inside the building, at the top.
Train Enchant Cloak - Greater Defense |learn Enchant Cloak - Greater Defense##13746 |goto Elwynn Forest 64.92,70.71
step
cast Disenchant##13262
collect 15 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 225 |or
step
Open Your Enchanting Crafting Panel:
_<Create 5 Enchant Cloak - Greater Defense>_
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
Reach Skill 225 in Enchanting |skill Enchanting,225
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
stickystart "Collect_Gold"
step
cast Disenchant##13262
collect 211 Vision Dust##11137 |or
|tip Disenchant level 36-45 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 36-45 uncommon (green) items with Enchanting. |only if selfmade
|tip You are about to go into the Uldaman dungeon, where the only Artisan Enchanting trainer is located.
|tip You need to have enough materials to reach at least 250 skill in Enchanting.
|tip You'll want to get this done in one trip.
'|complete skill("Enchanting") >= 250 |or
step
label "Collect_Gold"
Collect 11g 79s |complete _G.GetMoney() >= 117900
|tip You need 11g 79s to train Artisan Enchanting and all of the recipes the Artisan Enchanting trainer can teach you.
|tip She is inside Uldaman, so you'll want to get this done in one trip.
'|complete skill("Enchanting") >= 250 |or
step
_Enter the Uldaman Dungeon:_
|tip Use the back door entrance at this location.
|tip Enter the cave and follow the path to the swirling portal.
|tip Unless you are already level 60, you will need a group to help you through the dungeon.
|tip Try to put together a group of friends who are okay waiting on you for a few minutes inside the dungeon.
|tip They will be helping you to the Artisan Enchanting trainer, and waiting for you to level up your Enchanting skill.
Click Here After Entering the Uldaman Dungeon |confirm |goto Badlands 65.05,43.45
'|complete skill("Enchanting") >= 250 |or
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
|tip Follow the arrow in the image below to locate her.
|tip She will only appear once you've killed all of the scorpion enemies near her location.
How to Find Her |image text,Professions_Enchanting_Master_Enchanter_Annora_Uldaman,1024,1024,808,660
|tip Click the line above to display an image.
Train Artisan Enchanting |skillmax Enchanting,300
step
cast Disenchant##13262
collect 36 Vision Dust##11137 |or
|tip You collected these in a previous step.
'|complete skill("Enchanting") >= 230 |or
step
Open Your Enchanting Crafting Panel:
_<Create 12 Enchant Cloak - Greater Defense>_
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Greater Defense enchant requires three Vision Dust.
Reach Skill 230 in Enchanting |skill Enchanting,230
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Boots - Stamina |learn Enchant Boots - Stamina##13836
step
cast Disenchant##13262
collect 25 Vision Dust##11137 |or
|tip You collected these in a previous step.
'|complete skill("Enchanting") >= 235 |or
step
Open Your Enchanting Crafting Panel:
_<Create 5 Enchant Boots - Stamina>_
|tip Place then enchant on a boot slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' boots to make some profit while increasing your skill level.
Reach Skill 235 in Enchanting |skill Enchanting,235
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Chest - Superior Health |learn Enchant Chest - Superior Health##13858
step
cast Disenchant##13262
collect 150 Vision Dust##11137 |or
|tip You collected these in a previous step.
'|complete skill("Enchanting") >= 250 |or
step
Open Your Enchanting Crafting Panel:
_<Create 25 Enchant Chest - Superior Health>_
|tip Place then enchant on a chest slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' chest to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Superior Health enchant requires six Vision Dust.
Reach Skill 250 in Enchanting |skill Enchanting,250
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Chest - Superior Mana |learn Enchant Chest - Superior Mana##13917
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Shield - Greater Spirit |learn Enchant Shield - Greater Spirit##13905
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Boots - Agility |learn Enchant Boots - Agility##13935
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant 2H Weapon - Greater Impact |learn Enchant 2H Weapon - Greater Impact##13937
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Bracer - Greater Strength |learn Enchant Bracer - Greater Strength##13939
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Chest - Stats |learn Enchant Chest - Stats##13942
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Weapon - Greater Striking |learn Enchant Weapon - Greater Striking##13943
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchant Gloves - Minor Haste |learn Enchant Gloves - Minor Haste##13948
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchanted Leather |learn Enchanted Leather##17181
step
talk Annora##11073
|tip Inside the Uldaman dungeon.
Train Enchanted Thorium |learn Enchanted Thorium##17180
step
_Leave the Uldaman Dungeon:_
|tip You are now done with Enchanting inside the Uldaman dungeon.
|tip You can leave at any time.
Click Here After Leaving the Uldaman Dungeon |confirm
'|complete skill("Enchanting") >= 265 |or
step
talk Kania##15419
|tip Upstairs inside the building.
buy Formula: Lesser Mana Oil##20754 |goto Silithus 52.00,39.60 |or
'|complete skill("Enchanting") >= 265 |or
step
use the Formula: Lesser Mana Oil##20754
Learn Lesser Mana Oil |learn Lesser Mana Oil##25135
stickystart "Collect_Purple_Lotus_265"
step
cast Disenchant##13262
collect 60 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 46-55 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 265 |or
step
label "Collect_Purple_Lotus_265"
collect 40 Purple Lotus##8831 |or
|tip Farm them with Herbalism or purchase them from the auction house. |only if not selfmade
|tip Farm them with Herbalism. |only if selfmade
'|complete skill("Enchanting") >= 265 |or
step
talk Mythrin'dir##4229
|tip Inside the building.
buy 20 Crystal Vial##8925 |goto Darnassus 60.96,17.67 |or
'|complete skill("Enchanting") >= 265 |or
step
Open Your Enchanting Crafting Panel:
_<Create 20 Lesser Mana Oil>_
|tip You may need to make a few more or less of these.
|tip Each additional Lesser Mana Oil requires three Dream Dust, two Purple Lotus, and one Crystal Vial.
Reach Skill 265 in Enchanting |skill Enchanting,265
step
talk Mythrin'dir##4229
|tip Inside the building.
buy Formula: Enchant Shield - Greater Stamina##16217 |goto Darnassus 60.96,17.67 |or
|tip This is a limited supply item that cannot be purchased from the auction house.
|tip If he doesn't have it for sale, you will have to wait.
'|complete skill("Enchanting") >= 294 |or
step
use the Formula: Enchant Shield - Greater Stamina##16217
Learn Enchant Shield - Greater Stamina |learn Enchant Shield - Greater Stamina##20017
step
cast Disenchant##13262
collect 300 Dream Dust##11176 |or
|tip Disenchant level 46-55 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 46-55 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 294 |or
step
Open Your Enchanting Crafting Panel:
_<Create 30 Enchant Shield - Greater Stamina>_
|tip Place then enchant on a shield slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' shield to make some profit while increasing your skill level.
|tip You may need to make a few more or less of these.
|tip Each additional Greater Stamina enchant requires ten Dream Dust.
Reach Skill 294 in Enchanting |skill Enchanting,294
step
Follow the road |goto Moonglade 40.25,37.05 < 30 |only if walking
talk Lorelae Wintersong##12022
|tip Inside the building.
buy Formula: Enchant Cloak - Superior Defense##16224 |goto Moonglade 48.24,40.14 |or 2
buy Formula: Runed Arcanite Rod##16243 |goto Moonglade 48.24,40.14 |or 2
|tip These are limited supply items that can also be purchased from the auction house. |only if not selfmade
|tip These are limited supply items. |only if selfmade
'|complete skill("Enchanting") >= 300 |or
step
use the Formula: Enchant Cloak - Superior Defense##16224
Learn Enchant Cloak - Superior Defense |learn Enchant Cloak - Superior Defense##20015
step
use the Formula: Runed Arcanite Rod##16243
Learn Runed Arcanite Rod |learn Runed Arcanite Rod##20051
stickystart "Collect_Greater_Eternal_Essence_295"
stickystart "Collect_Small_Brilliant_Shard_295"
stickystart "Collect_Large_Brilliant_Shard_295"
stickystart "Collect_Arcanite_Rod_295"
stickystart "Collect_Golden_Pearl_295"
step
cast Disenchant##13262
collect 10 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 56-60 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Greater_Eternal_Essence_295"
collect 4 Greater Eternal Essence##16203 |or
|tip Disenchant level 51-56 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 51-56 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Small_Brilliant_Shard_295"
collect 4 Small Brilliant Shard##14343 |or
|tip Disenchant level 46-51 rare (blue) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 46-51 rare (blue) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Large_Brilliant_Shard_295"
collect 2 Large Brilliant Shard##14344 |or
|tip Disenchant level 51-60 rare (blue) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 51-60 rare (blue) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Arcanite_Rod_295"
collect Arcanite Rod##16206 |or
|tip Create it with Blacksmithing or purchase it from the auction house. |only if not selfmade
|tip Create it with Blacksmithing. |only if selfmade
|tip It takes 3 Arcanite Bars and 1 Dense Grinding Stone to craft.
'|complete skill("Enchanting") >= 295 |or
step
label "Collect_Golden_Pearl_295"
collect Golden Pearl##13926 |or
|tip Farm it using the "Golden Pearl" farming guide or purchase it from the Auction House. |only if not selfmade
|tip Farm it using the "Golden Pearl" farming guide. |only if selfmade
'|complete skill("Enchanting") >= 295 |or
step
Open Your Enchanting Crafting Panel:
_<Create 1 Runed Arcanite Rod>_
|tip Save this, you will need it later.
Reach Skill 295 in Enchanting |skill Enchanting,295
step
cast Disenchant##13262
collect 40 Illusion Dust##16204 |or
|tip Disenchant level 56-60 uncommon (green) items with Enchanting or purchase them from the auction house. |only if not selfmade
|tip Disenchant level 56-60 uncommon (green) items with Enchanting. |only if selfmade
'|complete skill("Enchanting") >= 300 |or
step
Open Your Enchanting Crafting Panel:
_<Create 5 Enchant Cloak - Superior Defense>_
|tip Place then enchant on a cloak slot item, either equipped or in your inventory.
|tip You may be able to use it on other players' cloak to make some profit while increasing your skill level.
Reach Skill 300 in Enchanting |skill Enchanting,300
step
_Congratulations!_
You Reached Skill 300 in Enchanting.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Strange Dust",{
hardcore = true,
},[[
step
Disenchant level 5-20 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Small Glimmering Shards instead of Strange Dust.
collect Strange Dust##10940 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Magic Essence",{
hardcore = true,
},[[
step
Disenchant level 3-12 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Strange Dust instead of Lesser Magic Essence.
collect Lesser Magic Essence##10938 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Magic Essence",{
hardcore = true,
},[[
step
Disenchant level 9-21 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Strange Dust instead of Greater Magic Essence.
|tip You can turn 3 Lesser Magic Essences into a Greater Magic Essence.
collect Greater Magic Essence##10939 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Eternal Essence",{
hardcore = true,
},[[
step
Disenchant level 40-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Dream Dust instead of Lesser Eternal Essence.
collect Lesser Eternal Essence##16202 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Eternal Essence",{
hardcore = true,
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Illusion Dust instead of Greater Eternal Essence.
|tip You can turn 3 Lesser Eternal Essences into a Greater Eternal Essence.
collect Greater Eternal Essence##16203 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Small Brilliant Shard",{
hardcore = true,
},[[
step
Disenchant level 38-50 blue and green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Dream Dust instead of Small Brilliant Shards.
collect Small Brilliant Shard##14343 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Large Brilliant Shard",{
hardcore = true,
},[[
step
Disenchant level 50-58 blue weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may very rarely get Nexus Crystals instead of Large Brilliant Shards.
collect Large Brilliant Shard##14344 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Illusion Dust",{
hardcore = true,
},[[
step
Disenchant level 45-60 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
|tip You may sometimes get Greater Eternal Essence instead of Illusion Dust.
collect Illusion Dust##16204 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Astral Essence",{
hardcore = true,
},[[
step
Disenchant level 20-25 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Lesser Astral Essence##10998 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Astral Essence",{
hardcore = true,
},[[
step
Disenchant level 20-30 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Greater Astral Essence##11082 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Soul Dust",{
hardcore = true,
},[[
step
Disenchant level 25-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Soul Dust##11083 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Mystic Essence",{
hardcore = true,
},[[
step
Disenchant level 30-35 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Lesser Mystic Essence##11134 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Mystic Essence",{
hardcore = true,
},[[
step
Disenchant level 35-40 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Greater Mystic Essence##11135 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Vision Dust",{
hardcore = true,
},[[
step
Disenchant level 35-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Vision Dust##11137 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Nether Essence",{
hardcore = true,
},[[
step
Disenchant level 40-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Lesser Nether Essence##11174 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Nether Essence",{
hardcore = true,
},[[
step
Disenchant level 45-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Greater Nether Essence##11175 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Dream Dust",{
hardcore = true,
},[[
step
Disenchant level 45-55 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Dream Dust##11176 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Greater Nether Essence",{
hardcore = true,
},[[
step
Disenchant level 45-50 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Greater Nether Essence##11175 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Enchanting\\Farming Guides\\Lesser Nether Essence",{
hardcore = true,
},[[
step
Disenchant level 40-45 green weapons and armor
|tip You can disenchant old gear or buy some off the Auction House. |only if not selfmade
|tip You can disenchant old gear. |only if selfmade
collect Lesser Nether Essence##11174 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Engineering (1-300)",{
condition_suggested=function() return skill('Engineering') > 0 end,
description="This guide will walk you through leveling your Engineering skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Sprite Jumpsprocket##11026
Train Apprentice Engineering |skillmax Engineering,75 |goto Stormwind City/0 54.56,7.92
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Engineering |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Engineering") >= 300 |next "Begin_Profession_Leveling" |only if default |or
'|complete skill("Engineering") >= 315 |next "Begin_Profession_Leveling" |only if Gnome |or
stickystart "Collect_Coarse_Stone_Total"
stickystart "Collect_Heavy_Stone_Total"
stickystart "Collect_Dense_Stone_Total"
stickystart "Collect_Moss_Agate_Total"
stickystart "Collect_Medium_Leather_Total"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Engineering") >= 30 |only if default |or
'|complete skill("Engineering") >= 45 |only if Gnome |or
step
label "Collect_Coarse_Stone_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 95 |only if default |or
'|complete skill("Engineering") >= 110 |only if Gnome |or
step
label "Collect_Heavy_Stone_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 146 |only if default |or
'|complete skill("Engineering") >= 161 |only if Gnome |or
step
label "Collect_Solid_Stone_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 120 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 195 |only if default |or
'|complete skill("Engineering") >= 210 |only if Gnome |or
step
label "Collect_Dense_Stone_Total"
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
collect 70 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 260 |only if default |or
'|complete skill("Engineering") >= 275 |only if Gnome |or
step
label "Collect_Moss_Agate_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 10 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Mining. |notinsticky |only if selfmade
|tip These are an uncommon drop.
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 135 |only if default |or
'|complete skill("Engineering") >= 150 |only if Gnome |or
step
label "Collect_Medium_Leather_Total"
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect 15 Medium Leather##2319 |goto Hillsbrad Foothills 46.12,31.76 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 160 |only if default |or
'|complete skill("Engineering") >= 175 |only if Gnome |or
stickystart "Collect_Silver_Bar_Total"
stickystart "Collect_Bronze_Bar_Total"
stickystart "Collect_Steel_Bar_Total"
stickystart "Collect_Mithril_Bar_Total"
stickystart "Collect_Thorium_Bar_Total"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 66 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
label "Collect_Silver_Bar_Total"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Silver Ore##2775 |n
|tip Smelt the ores into bars at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 105 |only if default |or
'|complete skill("Engineering") >= 120 |only if Gnome |or
step
label "Collect_Bronze_Bar_Total"
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Copper Ore##2770 |or
|tip If you are farming Copper, save them for the next step.
collect 120 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Tin Ore##2771 |n
|tip Smelt the Copper and Tin Ores into Bronze Bars at a forge.
collect 120 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Steel_Bar_Total"
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 4 Iron Ore##2772 |n
buy 4 Coal##3857 |n
|tip Buy them from a General Trade Supplier.
|tip Smelt the ores into bars at a forge.
collect 4 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 300 or itemcount(10498) >= 1 |only if default |or
'|complete skill("Engineering") >= 315 or itemcount(10498) >= 1 |only if Gnome |or
step
label "Collect_Mithril_Bar_Total"
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 161 Mithril Ore##3858 |n
|tip Smelt the ores into bars at a forge.
collect 161 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 238 |only if default |or
'|complete skill("Engineering") >= 253 |only if Gnome |or
step
label "Collect_Thorium_Bar_Total"
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
collect 225 Thorium Ore##10620 |n
|tip Smelt the ores into bars at a forge.
collect 225 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Create them with Mining. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 300 |only if default |or
'|complete skill("Engineering") >= 315 |only if Gnome |or
stickystart "Collect_Wool_Cloth_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Runecloth_Total"
step
Kill enemies around this area
|tip Be sure to enter the mine as well.
collect 50 Linen Cloth##2589 |goto Westfall 44.55,25.01 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 5-20 humanoid mobs. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Engineering") >= 100 |only if default |or
'|complete skill("Engineering") >= 115 |only if Gnome |or
step
label "Collect_Wool_Cloth_Total"
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect 60 Wool Cloth##2592 |goto Redridge Mountains 36.22,9.93 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
You can find more inside the cave at [33.21,6.91]
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Mageweave_Cloth_Total"
Kill Dunemaul enemies around this area
collect 20 Mageweave Cloth##4338 |goto Tanaris 40.50,55.50 |or
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 38-50 humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 216 |only if default |or
'|complete skill("Engineering") >= 231 |only if Gnome |or
step
label "Collect_Runecloth_Total"
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect 35 Runecloth##14047 |goto Burning Steppes 42.17,35.64 |or
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 50+ humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Engineering") >= 285 |only if default |or
'|complete skill("Engineering") >= 300 |only if Gnome |or
step
label "Begin_Profession_Leveling"
talk Tharynn Bouden##66
buy Blacksmith Hammer##5956 |goto Elwynn Forest/0 41.82,67.17 |or
|tip Save this, you will need it later.
'|complete skill("Engineering") >= 300 |only if default |or
'|complete skill("Engineering") >= 315 |only if Gnome |or
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Rough Stone##2835 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Engineering") >= 30 |only if default |or
'|complete skill("Engineering") >= 45 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 60 Rough Blasting Powder>_
collect 60 Rough Blasting Powder##4357 |or
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Rough Blasting Powder>_
|tip Save 60 of these, you will need them later.
Reach Skill 30 in Engineering |skill Engineering,30 |only if default |or
Reach Skill 45 in Engineering |skill Engineering,45 |only if Gnome |or
step
talk Sprite Jumpsprocket##11026
Train Handful of Copper Bolts |learn Handful of Copper Bolts##3922 |goto Stormwind City/0 54.56,7.92
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 30 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 50 |only if default |or
'|complete skill("Engineering") >= 65 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 30 Handful of Copper Bolts>_
|tip Stand next to an anvil.
|tip Save these, you will need them later.
collect 30 Handful of Copper Bolts##4359 |goto Elwynn Forest/0 41.61,65.88 |or
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Handful of Copper Bolts>_
|tip Stand next to an anvil.
|tip Save 30 of these, you will need them later.
|tip You may need to make a few more of these.
|tip Each additional Handful of Copper Bolts requires 1 copper bar.
Reach Skill 50 in Engineering |skill Engineering,50 |goto Elwynn Forest/0 41.61,65.88 |only if default |or
Reach Skill 65 in Engineering |skill Engineering,65 |goto Elwynn Forest/0 41.61,65.88 |only if Gnome |or
step
talk Sprite Jumpsprocket##11026
Train Arclight Spanner |learn Arclight Spanner##7430 |goto Stormwind City/0 54.56,7.92
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 6 Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 6 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 51 or itemcount(6219) < 1 |only if default |or
'|complete skill("Engineering") >= 66 or itemcount(6219) < 1 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 1 Arclight Spanner>_
|tip Stand next to an anvil.
|tip Save this, you will need it later.
Reach Skill 51 in Engineering |skill Engineering,51 |goto Elwynn Forest/0 41.61,65.88 |only if default |or
Reach Skill 66 in Engineering |skill Engineering,66 |goto Elwynn Forest/0 41.61,65.88 |only if Gnome |or
step
talk Sprite Jumpsprocket##11026
Train Rough Copper Bomb |learn Rough Copper Bomb##3923 |goto Stormwind City/0 54.56,7.92
stickystart "Collect_Handful_of_Copper_Bolts_75"
stickystart "Collect_Copper_Bar_75"
stickystart "Collect_Linen_Cloth_75"
step
collect 60 Rough Blasting Powder##4357 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
label "Collect_Handful_of_Copper_Bolts_75"
collect 30 Handful of Copper Bolts##4359 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
label "Collect_Copper_Bar_75"
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Copper Ore##2770 |n
|tip Smelt the ores into bars at a forge.
collect 30 Copper Bar##2840 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
label "Collect_Linen_Cloth_75"
Kill enemies around this area
|tip Be sure to enter the mine as well.
collect 30 Linen Cloth##2589 |goto Westfall 44.55,25.01 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 5-20 humanoid mobs. |only if selfmade
'|complete skill("Engineering") >= 75 |only if default |or
'|complete skill("Engineering") >= 90 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 30 Rough Copper Bombs>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Rough Copper Bomb requires 2 Rough Blasting Powder, 1 Handful of Copper Bolts, 1 Copper Bar, and 1 Linen Cloth.
Reach Skill 75 in Engineering |skill Engineering,75 |goto Elwynn Forest/0 41.61,65.88 |only if default |or
Reach Skill 90 in Engineering |skill Engineering,90 |goto Elwynn Forest/0 41.61,65.88 |only if Gnome |or
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Lilliam Sparkspindle##5518
Train Journeyman Engineering |skillmax Engineering,150 |goto Stormwind City/0 54.81,7.59
step
talk Lilliam Sparkspindle##5518
Train Coarse Blasting Powder |learn Coarse Blasting Powder##3929 |goto Stormwind City/0 54.81,7.59
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 60 Coarse Stone##2836 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Engineering") >= 95 |only if default |or
'|complete skill("Engineering") >= 110 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 60 Coarse Blasting Powder>_
|tip Save these, you will need them later.
collect 60 Coarse Blasting Powder##4364 |or
'|complete skill("Engineering") >= 100 |only if default |or
'|complete skill("Engineering") >= 115 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Coarse Blasting Powder>_
|tip Save 60 of these, they will be used in a later schematic.
Reach Skill 95 in Engineering |skill Engineering,95 |only if default |or
Reach Skill 110 in Engineering |skill Engineering,110 |only if Gnome |or
step
talk Trixie Quikswitch##11029
|tip Inside the building.
Train Coarse Dynamite |learn Coarse Dynamite##3931 |goto Ironforge 67.48,42.91
stickystart "Collect_Linen_Cloth_100"
step
collect 60 Coarse Blasting Powder##4364 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 100 |only if default |or
'|complete skill("Engineering") >= 115 |only if Gnome |or
step
label "Collect_Linen_Cloth_100"
Kill enemies around this area
|tip Be sure to enter the mine as well.
collect 20 Linen Cloth##2589 |goto Westfall 44.55,25.01 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 5-20 humanoid mobs. |only if selfmade
'|complete skill("Engineering") >= 100 |only if default |or
'|complete skill("Engineering") >= 115 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 20 Coarse Dynamite>_
|tip You may need to create a few more or less of these.
|tip Each additional Coarse Dynamite requires 3 Coarse Blasting Powder and 1 Linen Cloth.
Reach Skill 100 in Engineering |skill Engineering,100 |only if default |or
Reach Skill 115 in Engineering |skill Engineering,115 |only if Gnome |or
step
talk Trixie Quikswitch##11029
|tip Inside the building.
Train Silver Contact |learn Silver Contact##3973 |goto Ironforge 67.48,42.91
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 5 Silver Ore##2775 |n
|tip Smelt the ores into bars at a forge.
collect 5 Silver Bar##2842 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 105 |only if default |or
'|complete skill("Engineering") >= 120 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 5 Silver Contacts>_
Reach Skill 105 in Engineering |skill Engineering,105 |only if default |or
Reach Skill 120 in Engineering |skill Engineering,120 |only if Gnome |or
step
talk Trixie Quikswitch##11029
|tip Inside the building.
Train Bronze Tube |learn Bronze Tube##3938 |goto Ironforge 67.48,42.91
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Copper Ore##2770 |or
|tip If you are farming Copper, save them for the next step.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 125 |only if default |or
'|complete skill("Engineering") >= 140 |only if Gnome |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 25 Tin Ore##2771 |n
|tip Smelt the Copper and Tin Ores into Bronze Bars at a forge.
collect 50 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 125 |only if default |or
'|complete skill("Engineering") >= 140 |only if Gnome |or
step
talk Gearcutter Cogspinner##5175
|tip Inside the building.
buy 25 Weak Flux##2880 |goto Ironforge 67.85,42.51
'|complete skill("Engineering") >= 125 |only if default |or
'|complete skill("Engineering") >= 140 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 10 Bronze Tubes>_
|tip Stand next to an anvil.
|tip Save these, you will need them later.
collect 10 Bronze Tube##4371 |goto Ironforge 49.83,44.12 |or
'|complete skill("Engineering") >= 135 |only if default |or
'|complete skill("Engineering") >= 150 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 15 Bronze Tubes>_
|tip Stand next to an anvil.
|tip Save 10 of these, you will need them later.
|tip You may need to create a few more or less of these.
|tip Each additional Bronze Tube requires 2 Bronze Bars and 1 Weak Flux.
Reach Skill 125 in Engineering |skill Engineering,125 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 140 in Engineering |skill Engineering,140 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
talk Trixie Quikswitch##11029
|tip Inside the building.
Train Standard Scope |learn Standard Scope##3978 |goto Ironforge 67.48,42.91
stickystart "Collect_Moss_Agate_135"
step
collect 10 Bronze Tube##4371 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 135 |only if default |or
'|complete skill("Engineering") >= 150 |only if Gnome |or
step
label "Collect_Moss_Agate_135"
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 10 Moss Agate##1206 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
|tip This is an uncommon drop.
'|complete skill("Engineering") >= 135 |only if default |or
'|complete skill("Engineering") >= 150 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 10 Standard Scopes>_
Reach Skill 135 in Engineering |skill Engineering,135 |only if default |or
Reach Skill 150 in Engineering |skill Engineering,150 |only if Gnome |or
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Expert Engineering |skillmax Engineering,225 |goto Ironforge 68.46,43.56
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Heavy Blasting Powder |learn Heavy Blasting Powder##3945 |goto Ironforge 68.46,43.56
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Whirring Bronze Gizmo |learn Whirring Bronze Gizmo##3942 |goto Ironforge 68.46,43.56
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 30 Heavy Stone##2838 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Engineering") >= 146 |only if default |or
'|complete skill("Engineering") >= 161 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 30 Heavy Blasting Powder>_
|tip Save these, you will need them later.
collect 30 Heavy Blasting Powder##4377 |or
'|complete skill("Engineering") >= 146 |only if default |or
'|complete skill("Engineering") >= 161 |only if Gnome |or
stickystart "Collect_Wool_Cloth_Gizmo"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Copper Ore##2770 |or
|tip If you are farming Copper, save them for the next step.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Tin Ore##2771 |n
|tip Smelt the Copper and Tin Ores into Bronze Bars at a forge.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Wool_Cloth_Gizmo"
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect 15 Wool Cloth##2592 |goto Redridge Mountains 36.22,9.93 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
You can find more inside the cave at [33.21,6.91]
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 15 Whirring Bronze Gizmos>_
|tip Stand next to an anvil.
|tip Save these, you will need them later.
collect 15 Whirring Bronze Gizmo##4375 |goto Ironforge 49.83,44.12 |or
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Whirring Bronze Gizmos>_
|tip Stand next to an anvil.
|tip Save 15 of these, you will need them later.
|tip You may need to create a few more or less of these.
|tip Each additional Whirring Bronze Gizmo requires 2 Bronze Bars and 1 Wool Cloth.
Reach Skill 150 in Engineering |skill Engineering,150 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 165 in Engineering |skill Engineering,165 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Bronze Framework |learn Bronze Framework##3953 |goto Ironforge 68.46,43.56
stickystart "Collect_Medium_Leather_Framework"
stickystart "Collect_Wool_Cloth_Framework"
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Copper Ore##2770 |or
|tip If you are farming Copper, save them for the next step.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 15 Tin Ore##2771 |n
|tip Smelt the Copper and Tin Ores into Bronze Bars at a forge.
collect 30 Bronze Bar##2841 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Medium_Leather_Framework"
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
collect 15 Medium Leather##2319 |goto Hillsbrad Foothills 46.12,31.76 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Engineering") >= 160 |only if default |or
'|complete skill("Engineering") >= 175 |only if Gnome |or
step
label "Collect_Wool_Cloth_Framework"
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect 15 Wool Cloth##2592 |goto Redridge Mountains 36.22,9.93 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
You can find more inside the cave at [33.21,6.91]
'|complete skill("Engineering") >= 160 |only if default |or
'|complete skill("Engineering") >= 175 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 15 Bronze Frameworks>_
|tip Save these, you will need them later.
collect 15 Bronze Framework##4382 |or
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Bronze Frameworks>_
|tip Save 15 of these, you will need them later.
Reach Skill 160 in Engineering |skill Engineering,160 |only if default |or
Reach Skill 175 in Engineering |skill Engineering,175 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Explosive Sheep |learn Explosive Sheep##3955 |goto Ironforge 68.46,43.56
stickystart "Collect_Whirring_Bronze_Gizmo_175"
stickystart "Collect_Bronze_Framework_175"
stickystart "Collect_Wool_Cloth_175"
step
collect 30 Heavy Blasting Powder##4377 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Whirring_Bronze_Gizmo_175"
collect 15 Whirring Bronze Gizmo##4375 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Bronze_Framework_175"
collect 15 Bronze Framework##4382 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
label "Collect_Wool_Cloth_175"
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect 30 Wool Cloth##2592 |goto Redridge Mountains 36.22,9.93 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
You can find more inside the cave at [33.21,6.91]
'|complete skill("Engineering") >= 175 |only if default |or
'|complete skill("Engineering") >= 190 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 15 Explosive Sheep>_
|tip Stand next to an anvil.
|tip Save 5 of these if you intend to specialize in Goblin Engineering later.
Reach Skill 175 in Engineering |skill Engineering,175 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 190 in Engineering |skill Engineering,190 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Gyromatic Micro-Adjustor |learn Gyromatic Micro-Adjustor##12590 |goto Ironforge 68.46,43.56
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect 4 Iron Ore##2772 |n
buy 4 Coal##3857 |n
|tip Buy them from a General Trade Supplier.
|tip Smelt the ores into bars at a forge.
collect 4 Steel Bar##3859 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 300 or itemcount(10498) >= 1 |only if default |or
'|complete skill("Engineering") >= 315 or itemcount(10498) >= 1 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 1 Gyromatic Micro-Adjustor>_
|tip Stand next to an anvil.
|tip Save this, you will need it later.
collect 1 Gyromatic Micro-Adjustor##10498 |goto Ironforge 49.83,44.12 |or
'|complete skill("Engineering") >= 300 |only if default |or
'|complete skill("Engineering") >= 315 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Solid Blasting Powder |learn Solid Blasting Powder##12585 |goto Ironforge 68.46,43.56
step
collect 120 Solid Stone##7912 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Engineering") >= 195 |only if default |or
'|complete skill("Engineering") >= 210 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 60 Solid Blasting Powder>_
|tip Save these, you will need them later.
collect 60 Solid Blasting Powder##10505 |or
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Solid Blasting Powder>_
|tip Save 60 of these, you will need them later.
|tip You may need to create a few more of these.
|tip Each additional Solid Blasting Powder requires 2 Solid Stone.
Reach Skill 195 in Engineering |skill Engineering,195 |only if default |or
Reach Skill 210 in Engineering |skill Engineering,210 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Mithril Tube |learn Mithril Tube##12589 |goto Ironforge 68.46,43.56
step
collect 21 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 200 |only if default |or
'|complete skill("Engineering") >= 215 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 7 Mithril Tubes>_
|tip Stand next to an anvil.
|tip You  may need to create a few more or less of these.
|tip Each additional Mithril Tube requires 3 Mithril Bars.
|tip Save 6 of these if you intend to specialize in Gnomish Engineering later.
Reach Skill 200 in Engineering |skill Engineering,200 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 215 in Engineering |skill Engineering,215 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
Train Unstable Trigger |learn Unstable Trigger##12591 |goto Ironforge 68.46,43.56
stickystart "Collect_Mithril_Bar_216"
stickystart "Collect_Mageweave_Cloth_216"
step
collect 20 Solid Blasting Powder##10505 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 216 |only if default |or
'|complete skill("Engineering") >= 231 |only if Gnome |or
step
label "Collect_Mithril_Bar_216"
collect 20 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 216 |only if default |or
'|complete skill("Engineering") >= 231 |only if Gnome |or
step
label "Collect_Mageweave_Cloth_216"
collect 20 Mageweave Cloth##4338 |or
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 38-50 humanoid mobs. |only if selfmade
'|complete skill("Engineering") >= 216 |only if default |or
'|complete skill("Engineering") >= 231 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 20 Unstable Triggers>_
|tip Stand next to an anvil.
|tip Save these, you will need them later.
collect 20 Unstable Trigger##10560 |goto Ironforge 49.83,44.12 |or
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Unstable Triggers>_
|tip Stand next to an anvil.
|tip Save 20 of these, you will need them later.
|tip You may need to create a few more or less of these.
|tip Each additional Unstable Trigger requires 1 Solid Blasting Powder, 1 Mithril Bar, and 1 Mageweave Cloth.
Reach Skill 216 in Engineering |skill Engineering,216 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 231 in Engineering |skill Engineering,231 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Buzzek Bracketswing##8736
Train Artisan Engineering |skillmax Engineering,300 |goto Tanaris 52.34,27.72
step
talk Buzzek Bracketswing##8736
Train Mithril Casing |learn Mithril Casing##12599 |goto Tanaris 52.34,27.72
step
collect 120 Mithril Bar##3860 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 238 |only if default |or
'|complete skill("Engineering") >= 253 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 40 Mithril Casings>_
|tip Stand next to an anvil.
|tip Save these, you will need them later.
collect 40 Mithril Casing##10561 |goto Tanaris 51.40,28.72 |or
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create Mithril Casings>_
|tip Stand next to an anvil.
|tip Save 40 of these, you will need them later.
|tip You may need to create a few more or less of these.
|tip Each additional Mithril Casing requires 3 Mithril Bars.
Reach Skill 238 in Engineering |skill Engineering,238 |goto Tanaris 51.40,28.72 |only if default |or
Reach Skill 253 in Engineering |skill Engineering,253 |goto Tanaris 51.40,28.72 |only if Gnome |or
step
talk Buzzek Bracketswing##8736
Train Hi-Explosive Bomb |learn Hi-Explosive Bomb##12619 |goto Tanaris 52.34,27.72
stickystart "Collect_Unstable_Trigger_250"
stickystart "Collect_Mithril_Casing_250"
step
collect 40 Solid Blasting Powder##10505 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
label "Collect_Unstable_Trigger_250"
collect 20 Unstable Trigger##10560 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
label "Collect_Mithril_Casing_250"
collect 40 Mithril Casing##10561 |or
|tip You created these in a previous step.
'|complete skill("Engineering") >= 250 |only if default |or
'|complete skill("Engineering") >= 265 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 20 Hi-Explosive Bombs>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Hi-Explosive Bomb requires 2 Solid Blasting Powders, 1 Unstable Trigger, and 1 Mithril Casing.
Reach Skill 250 in Engineering |skill Engineering,250 |goto Tanaris 51.40,28.72 |only if default |or
Reach Skill 265 in Engineering |skill Engineering,265 |goto Tanaris 51.40,28.72 |only if Gnome |or
step
talk Buzzek Bracketswing##8736
Train Dense Blasting Powder |learn Dense Blasting Powder##19788 |goto Tanaris 52.34,27.72
step
collect 70 Dense Stone##12365 |or
|tip Farm them with Mining or purchase them from the auction house. |only if not selfmade
|tip Farm them with Mining. |only if selfmade
'|complete skill("Engineering") >= 260 |only if default |or
'|complete skill("Engineering") >= 275 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 35 Dense Blasting Powder>_
|tip You may need to create a few more or less of these.
|tip Each additional Dense Blasting Powder requires 2 Dense Stone.
Reach Skill 260 in Engineering |skill Engineering,260 |only if default |or
Reach Skill 275 in Engineering |skill Engineering,275 |only if Gnome |or
step
talk Gearcutter Cogspinner##5175
|tip Inside the building.
buy Schematic: Thorium Widget##16042 |goto Ironforge 67.84,42.50 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Engineering") >= 285 |only if default |or
'|complete skill("Engineering") >= 300 |only if Gnome |or
step
use the Schematic: Thorium Widget##16042
Train Thorium Widget |learn Thorium Widget##19791
stickystart "Collect_Runecloth_285"
step
collect 105 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 285 |only if default |or
'|complete skill("Engineering") >= 300 |only if Gnome |or
step
label "Collect_Runecloth_285"
collect 35 Runecloth##14047 |or
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 50+ humanoid mobs. |only if selfmade
'|complete skill("Engineering") >= 285 |only if default |or
'|complete skill("Engineering") >= 300 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 35 Thorium Widget>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Thorium Widget requires 3 Thorium Bar and 2 Runecloth.
Reach Skill 285 in Engineering |skill Engineering,285 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 300 in Engineering |skill Engineering,300 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 60.86,38.51 < 5 |walk
talk Xizzer Fizzbolt##11185
|tip Inside the building.
buy Schematic: Thorium Tube##16047 |goto Winterspring 60.81,38.60 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Engineering") >= 300 |only if default |or
'|complete skill("Engineering") >= 315 |only if Gnome |or
step
use the Schematic: Thorium Tube##16047
Train Thorium Tube |learn Thorium Tube##19795
step
collect 120 Thorium Bar##12359 |or
|tip Create them with Mining or purchase them from the auction house. |only if not selfmade
|tip Create them with Mining. |only if selfmade
'|complete skill("Engineering") >= 300 |only if default |or
'|complete skill("Engineering") >= 315 |only if Gnome |or
step
Open Your Engineering Crafting Panel:
_<Create 20 Thorium Tubes>_
|tip Stand next to an anvil.
|tip You may need to create a few more or less of these.
|tip Each additional Thorium Tube requires 6 Thorium Bars.
Reach Skill 300 in Engineering |skill Engineering,300 |goto Ironforge 49.83,44.12 |only if default |or
Reach Skill 315 in Engineering |skill Engineering,315 |goto Ironforge 49.83,44.12 |only if Gnome |or
step
_Congratulations!_
You Reached Skill 300 in Engineering. |only if default
You Reached Skill 315 in Engineering. |only if Gnome
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\First Aid\\First Aid (1-300)",{
condition_suggested=function() return skill('First Aid') > 0 end,
description="This guide will walk you through leveling your First Aid skill from 1-300.",
hardcore = true,
},[[
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Apprentice First Aid |skillmax First Aid,75 |goto Ironforge 55.09,58.26
step
collect 50 Linen Cloth##2589 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 40 |or
step
Open Your First Aid Crafting Panel:
_<Create 50 Linen Bandages>_
Reach Skill 40 First in Aid |skill First Aid,40
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Heavy Linen Bandage |learn Heavy Linen Bandage##3276 |goto Ironforge 55.09,58.26
step
collect 80 Linen Cloth##2589 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 70 |or
step
Open Your First Aid Crafting Panel:
_<Create 40 Heavy Linen Bandages>_
Reach Skill 70 First in Aid |skill First Aid,70
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Journeyman First Aid |skillmax First Aid,150 |goto Ironforge 55.09,58.26
step
collect 50 Linen Cloth##2589 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 80 |or
step
Open Your First Aid Crafting Panel:
_<Create 25 Heavy Linen Bandages>_
Reach Skill 80 First in Aid |skill First Aid,80
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Wool Bandage |learn Wool Bandage##3277 |goto Ironforge 55.09,58.26
step
collect 60 Wool Cloth##2592 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 115 |or
step
Open Your First Aid Crafting Panel:
_<Create 60 Wool Bandages>_
Reach Skill 115 First in Aid |skill First Aid,115
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Heavy Wool Bandage |learn Heavy Wool Bandage##3278 |goto Ironforge 55.09,58.26
step
collect 110 Wool Cloth##2592 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 150 |or
step
Open Your First Aid Crafting Panel:
_<Create 55 Heavy Wool Bandages>_
Reach Skill 150 First in Aid |skill First Aid,150
step
Enter the building |goto Ironforge 55.18,57.31 < 5 |walk
talk Nissa Firestone##5150
|tip Upstairs inside the building.
Train Silk Bandage |learn Silk Bandage##7928 |goto Ironforge 55.09,58.26
step
Follow the path |goto Arathi Highlands 26.07,55.71 < 15 |only if walking
Continue following the path |goto Arathi Highlands 25.54,60.06 < 15 |only if walking
Continue following the path |goto Arathi Highlands 23.02,59.86 < 20 |c
|only if skillmax("First Aid") < 225
step
Cross the bridge |goto Arathi Highlands 25.62,58.14 < 10 |only if walking
talk Deneb Walker##2805
buy Expert First Aid - Under Wraps##16084 |n
use the Expert First Aid - Under Wraps##16084
Train Expert First Aid |skillmax First Aid,225 |goto Arathi Highlands 26.97,58.83
step
talk Deneb Walker##2805
buy Manual: Heavy Silk Bandage##16112 |goto Arathi Highlands 26.97,58.83
buy Manual: Mageweave Bandage##16113 |goto Arathi Highlands 26.97,58.83
|tip Save these for later.
step
collect 50 Silk Cloth##4306 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 180 |or
step
Open Your First Aid Crafting Panel:
_<Create 50 Silk Bandages>_
Reach Skill 180 First in Aid |skill First Aid,180
step
use Manual: Heavy Silk Bandage##16112
Train Heavy Silk Bandage |learn Heavy Silk Bandage##7929
step
collect 90 Silk Cloth##4306 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 210 |or
step
Open Your First Aid Crafting Panel:
_<Create 45 Heavy Silk Bandages>_
Reach Skill 210 First in Aid |skill First Aid,210
step
use Manual: Mageweave Bandage##16113
Train Mageweave Bandage |learn Mageweave Bandage##10840
step
collect 30 Mageweave Cloth##4338 |or
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
'|complete skill("First Aid") >= 225 |or
step
Open Your First Aid Crafting Panel:
_<Create 30 Mageweave Bandages>_
Reach Skill 225 First in Aid |skill First Aid,225
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
_Collect These Items:_
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 96 Mageweave Cloth##4338 |or
'|complete skill("First Aid") >= 260 |or
step
label "Collect_Runecloth_"
collect 85 Runecloth##14047 |or
'|complete skill("First Aid") >= 300 |or
'|complete skill("First Aid") >= 300 |or
step
Enter the building |goto Dustwallow Marsh 67.80,47.66 < 7 |walk
talk Doctor Gustaf VanHowzen##12939
|tip Inside the building.
accept Triage##6624 |goto Dustwallow Marsh 67.76,48.97
step
use the Triage Bandage##16991
|tip Use it on the injured NPC's on the beds nearby inside the building.
|tip You must use the Triage Bandage to heal them before they die.
|tip If too many die you will fail the quest.
|tip Press "Ctrl+V" to show their health bars to make it easier.
|tip Try to heal them by priority, in this order:
|tip Critically Injured
|tip Badly Injured
|tip Injured Patients
Save #15# Patients |q 6624/1 |goto Dustwallow Marsh 67.76,48.97
|tip If you fail, just abandon the quest and try again.
step
talk Doctor Gustaf VanHowzen##12939
|tip Inside the building.
turnin Triage##6624 |goto Dustwallow Marsh 67.76,48.97
Train Artisan First Aid |skillmax First Aid,300 |goto Dustwallow Marsh 67.76,48.97
|tip You will learn this automatically.
step
Open Your First Aid Crafting Panel:
_<Create 30 Mageweave Bandages>_
Reach Skill 240 First in Aid |skill First Aid,240
step
talk Doctor Gustaf VanHowzen##12939
|tip Inside the building.
Select _"Teach me how to create and apply a Heavy Mageweave Bandage, Doctor."_
Train Heavy Mageweave Bandage |learn Heavy Mageweave Bandage##10841 |goto Dustwallow Marsh 67.76,48.97
step
Open Your First Aid Crafting Panel:
_<Create 33 Heavy Mageweave Bandages>_
Reach Skill 260 First in Aid |skill First Aid,260
step
talk Doctor Gustaf VanHowzen##12939
|tip Inside the building.
Select _"Teach me how to create and apply a Runecloth Bandage, Doctor."_
Train Runecloth Bandage |learn Runecloth Bandage##18629 |goto Dustwallow Marsh 67.76,48.97
step
Open Your First Aid Crafting Panel:
_<Create 45 Runecloth Bandages>_
Reach Skill 290 First in Aid |skill First Aid,290
step
talk Doctor Gustaf VanHowzen##12939
|tip Inside the building.
Select _"Teach me how to create and apply a Heavy Runecloth Bandage, Doctor."_
Train Heavy Runecloth Bandage |learn Heavy Runecloth Bandage##18630 |goto Dustwallow Marsh 67.76,48.97
step
Open Your First Aid Crafting Panel:
_<Create 20 Heavy Runecloth Bandages>_
Reach Skill 300 First in Aid |skill First Aid,300
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Fishing (1-300)",{
condition_suggested=function() return skill('Fishing') > 0 end,
description="This guide will walk you through leveling your Fishing skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Arnold Leland##5493
Train Apprentice Fishing |skillmax Fishing,75 |goto Stormwind City 45.64,58.43
step
talk Catherine Leland##5494
buy Fishing Pole##6256 |goto Stormwind City 45.77,58.58 |or
|tip You need to be able to equip a fishing pole in order to fish.
'|complete skill("Fishing") >= 300 |or
step
talk Catherine Leland##5494
buy 10 Shiny Bauble##6529 |goto Stormwind City 45.77,58.58 |or
|tip These will allow you to catch fish easier.
'|complete skill("Fishing") >= 55 |or
step
Fish in the Water
|tip Use the "Fishing" skill in your spell book.
|tip Equip the Fishing Pole in your bags.
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 55 in Fishing |skill Fishing,55 |goto Elwynn Forest 33.70,62.97
step
talk Catherine Leland##5494
buy Strong Fishing Pole##6365 |goto Stormwind City 45.77,58.58
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House. |only if not selfmade
|tip If you can't get one, you can skip this step.
step
Fish in the Water
|tip Equip the "Strong Fishing Pole", if you were able to get one.
use the Shiny Bauble##6529+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 75 in Fishing |skill Fishing,75 |goto Stormwind City 45.96,58.53
step
talk Arnold Leland##5493
Train Journeyman Fishing |skillmax Fishing,150 |goto Stormwind City 45.64,58.43
step
talk Catherine Leland##5494
buy 10 Nightcrawlers##6530 |goto Stormwind City 45.77,58.58 |or
|tip These will allow you to catch fish easier.
'|complete skill("Fishing") >= 150 |or
step
Fish in the Water
use the Nightcrawlers##6530+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 150 in Fishing |skill Fishing,150 |goto Redridge Mountains 29.69,56.28
step
Run down the ramp |goto Stranglethorn Vale 28.04,76.53 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 27.47,77.09 < 5 |walk
talk Old Man Heming##2626
|tip Inside the building.
buy Expert Fishing - The Bass and You##16083 |n
use Expert Fishing - The Bass and You##16083
Train Expert Fishing |skillmax Fishing,225 |goto Stranglethorn Vale 27.42,77.16
step
talk Old Man Heming##2626
|tip Inside the building.
buy 20 Bright Baubles##6532 |goto Stranglethorn Vale 27.42,77.16 |or
'|complete skill("Fishing") >= 225 |or
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 225 in Fishing |skill Fishing,225 |goto Stranglethorn Vale 27.64,76.67
step
Reach Level 35 |ding 35
|tip You must be at least this level before you can accept the quest in the next step.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Ironforge 47.60,7.35 < 7 |walk
talk Grimnur Stonebrand##5161
|tip Upstairs inside the building.
accept I Got Nothin' Left!##6609 |goto Ironforge 48.07,6.91
step
Cross the water |goto Dustwallow Marsh 66.54,55.09 < 30 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
turnin I Got Nothin' Left!##6609 |goto Dustwallow Marsh 58.55,60.21
accept Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Feralas Ahi##16967 |q 6607/1 |goto Feralas 62.38,52.50 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Sar'theris Striker##16968 |q 6607/3 |goto Desolace 38.96,22.70 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Misty Reed Mahi Mahi##16970 |q 6607/2 |goto Swamp of Sorrows 90.45,73.47 |or
|tip You will eventually catch one.
step
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
collect Savage Coast Blue Sailfin##16969 |q 6607/4 |goto Stranglethorn Vale 24.58,65.80 |or
|tip You will eventually catch one.
step
Cross the water |goto Dustwallow Marsh 66.54,55.09 < 30 |only if walking
talk Nat Pagle##12919
|tip On a small island in the water.
turnin Nat Pagle, Angler Extreme##6607 |goto Dustwallow Marsh 58.55,60.21
Train Artisan Fishing |skillmax Fishing,300 |goto Dustwallow Marsh 58.55,60.21
|tip You will learn this automatically.
step
talk Catherine Leland##5494
buy 20 Bright Baubles##6532 |goto Stormwind City 45.77,58.58 |or
'|complete skill("Fishing") >= 300 |or
step
Follow the path |goto The Hinterlands 18.57,53.61 < 50 |only if walking
Continue following the path |goto The Hinterlands 28.61,53.02 < 30 |only if walking
Fish in the Water
use the Bright Baubles##6532+
|tip Use it on your Fishing Pole.
|tip These will allow you to catch fish easier.
|tip Try to keep one of these active whenever you are fishing.
Reach Skill 300 in Fishing |skill Fishing,300 |goto The Hinterlands 29.50,47.82
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Brilliant Smallfish",{
hardcore = true,
},[[
step
Fish in the open water
collect Raw Brilliant Smallfish##6291 |n |goto Elwynn Forest 33.59,63.52
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Slitherskin Mackerel",{
hardcore = true,
},[[
step
Fish in the open water
collect Raw Slitherskin Mackerel##6303 |n |goto Teldrassil 56.25,93.72
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Rainbow Fin Albacore",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Rainbow Fin Albacore##6361 |n |goto Wetlands 9.32,61.63
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Longjaw Mud Snapper",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Longjaw Mud Snapper##6289 |n |goto Stormwind City 45.37,57.54
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Sagefish",{
hardcore = true,
},[[
step
Fish from Sagefish Schools in the water around this area
collect Raw Sagefish##21071 |n |goto Hillsbrad Foothills 62.51,43.06
|tip Follow the river north for more schools.
|tip You will need level 100 Fishing to catch these.
You can find more around [69.87,13.66]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Bristle Whisker Catfish",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Bristle Whisker Catfish##6308 |n |goto Stormwind City 45.37,57.54
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Mithril Head Trout",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Mithril Head Trout##8365 |n |goto Dustwallow Marsh 59.95,34.54
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Rockscale Cod",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Rockscale Cod##6362 |n |goto Stranglethorn Vale 26.22,73.57
|tip You will need level 130 Fishing to catch these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Fishing\\Farming Guides\\Raw Sunscale Salmon",{
hardcore = true,
},[[
step
Fish in the Open Water
collect Raw Sunscale Salmon##13760 |n |goto Feralas 62.39,52.49
|tip You will need level 205 Fishing to catch these.
|tip This fish can only be caught during the day; they cannot be caught between midnight and 6 AM server time.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Herbalism (1-300)",{
condition_suggested=function() return skill('Herbalism') > 0 end,
description="This guide will walk you through leveling your Herbalism skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
talk Tannysa##5566
Train Apprentice Herbalism |skillmax Herbalism,75 |goto Stormwind City 44.74,77.11
step
map Elwynn Forest
path	follow smart;	loop on;	ants curved;	dist 30
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Reach Skill 50 in Herbalism |skill Herbalism,50
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Elwynn Forest
path	follow smart;	loop on;	ants curved;	dist 30
path	37.69,50.56	37.74,52.72	40.46,52.58	44.68,49.88	47.75,50.98
path	50.11,53.78	51.22,59.12	53.58,60.05	55.86,57.19	58.11,58.67
path	61.20,55.26	63.90,54.16	65.95,58.60	68.39,54.25	67.30,49.51
path	66.94,46.11	64.93,39.76	68.35,38.37	73.03,36.59	78.22,39.11
path	80.09,41.77	81.52,47.88	81.14,54.53	84.76,60.10	88.26,63.13
path	89.58,67.45	86.13,79.13	83.85,81.99	79.68,75.80	74.93,72.40
path	71.73,71.92	66.40,71.08	64.94,72.55	60.59,74.44	58.98,78.43
path	55.19,81.63	51.23,81.44	50.22,73.66	44.38,68.40	42.59,67.01
path	39.55,56.74
Reach Skill 75 in Herbalism |skill Herbalism,75
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Tannysa##5566
Train Journeyman Herbalism |skillmax Herbalism,150 |goto Stormwind City 44.74,77.11
step
map Loch Modan
path	follow smart;	loop on;	ants curved;	dist 30
path	40.49,37.53	40.59,34.21	40.62,31.51	42.55,17.23	47.47,22.19
path	50.74,28.53	55.34,27.94	56.36,15.76	62.98,23.92	65.54,30.38
path	68.61,50.11	63.36,56.97	56.49,65.33	49.71,69.45	42.94,61.42
path	40.69,53.45	38.36,47.24	35.90,38.71
Reach Skill 115 in Herbalism |skill Herbalism,115
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Reach Skill 140 in Herbalism |skill Herbalism,140
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
step
talk Tannysa##5566
Train Expert Herbalism |skillmax Herbalism,225 |goto Stormwind City 44.74,77.11
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	46.75,25.55	51.58,29.02	56.21,30.36	59.67,33.23	62.46,34.02
path	61.92,38.94	58.55,43.68	56.51,48.27	44.88,34.82	41.25,33.98
path	35.44,31.57	31.52,36.24	26.99,34.94	18.37,36.35	13.78,37.41
path	14.84,33.80	18.22,32.79	19.10,26.35	21.55,27.19	24.28,28.73
path	27.93,30.36	32.61,27.99	35.45,24.60	38.43,23.41	40.84,24.23
Reach Skill 160 in Herbalism |skill Herbalism,160
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Swamp of Sorrows
path	follow smart;	loop on;	ants curved;	dist 30
path	20.50,54.53	16.62,58.22	15.71,65.71	12.68,68.05	10.73,63.62
path	12.41,55.83	15.50,47.83	18.39,45.92	22.07,39.95	28.92,38.70
path	33.28,38.90	38.62,34.97	47.12,33.93	51.82,34.91	51.62,41.06
path	44.78,45.30	37.49,50.34	33.07,52.19	27.05,54.68	22.47,57.13
Reach Skill 205 in Herbalism |skill Herbalism,205
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
|tip Watch out for horde guards along the main road.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
talk Tannysa##5566
Train Artisan Herbalism |skillmax Herbalism,300 |goto Stormwind City 44.74,77.11
step
map Blasted Lands
path	follow smart;	loop on;	ants curved;	dist 30
path	59.95,26.91	63.87,32.24	62.52,37.16	61.93,40.77	63.59,47.87
path	60.16,47.06	56.61,47.07	52.58,50.11	48.61,51.34	45.83,49.50
path	46.56,43.37	45.38,37.03	44.55,26.43	45.95,23.01	49.76,23.71
path	51.28,26.22	52.49,31.62	51.40,36.19	53.41,38.07	55.97,36.24
path	57.46,32.43	58.67,28.99
Reach Skill 275 in Herbalism |skill Herbalism,275
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
|tip You won't be able to gather Sungrass until level 230 Herbalism.
|tip You Won't be able to gather Gromsblood until level 250 Herbalism.
step
map Azshara
path	follow smart;	loop on;	ants curved;	dist 30
path	44.24,35.76	44.97,34.08	45.34,30.56	45.01,27.72	44.00,22.97
path	44.61,20.55	45.91,19.60	48.17,18.74	50.79,18.10	52.77,19.45
path	53.43,20.10	54.10,20.23	56.85,20.66	59.23,18.80	61.89,16.89
path	64.79,17.01	66.41,15.27	69.57,16.37	71.70,16.63	73.96,18.69
path	75.86,21.19	76.87,24.70	79.46,24.05	79.40,26.62	77.14,28.54
path	74.71,29.28	71.72,29.19	69.51,28.09	67.74,26.09	64.29,23.93
path	61.47,23.67	59.32,24.37	56.53,25.81	54.31,28.58	52.61,32.17
path	49.37,31.47	46.94,31.71
Reach Skill 285 in Herbalism |skill Herbalism,285
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
step
map Eastern Plaguelands
path	follow smart;	loop on;	ants curved;	dist 30
path	63.32,54.67	67.59,55.28	72.06,54.50	75.06,53.69	77.43,53.29
path	78.36,55.80	79.17,59.16	80.07,63.69	80.31,67.80	78.88,71.68
path	76.88,73.45	75.52,74.46	74.76,76.67	72.94,78.41	68.81,75.52
path	66.81,76.30	65.03,73.91	64.71,69.43	63.81,66.25	63.25,64.01
path	63.98,59.07
Reach Skill 300 in Herbalism |skill Herbalism,300
|tip Click herbs as you follow the path around this area.
|tip Track them on your minimap with "Find Herbs".
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Silverleaf",{
hardcore = true,
},[[
step
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect Silverleaf##765 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Peacebloom",{
hardcore = true,
},[[
step
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	35.16,58.15	35.80,61.90	34.96,66.91	35.08,70.72	34.97,74.55
path	31.26,76.29	29.39,72.28	26.34,77.16	26.78,84.53	26.01,88.87
path	28.95,85.90	31.32,84.53	34.00,86.31	35.63,87.61	40.33,90.30
path	42.44,85.05	42.33,79.53	44.78,75.63	57.19,75.30	61.71,78.02
path	64.64,80.21	66.96,82.28	71.53,82.34	74.86,79.96	85.15,82.86
path	88.50,76.38	87.13,70.90	86.64,64.81	83.70,60.88	78.23,58.27
path	74.68,59.68	70.59,61.28	67.25,64.47	63.72,65.35	60.60,62.03
path	56.21,61.31	51.67,60.44	49.08,59.49	44.65,55.81	42.02,54.40
path	39.16,55.56
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
collect Peacebloom##2447 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Earthroot",{
hardcore = true,
},[[
step
map Elwynn Forest/0
path follow smart; loop on; ants curved; dist 20
path	37.69,50.56	37.74,52.72	40.46,52.58	44.68,49.88	47.75,50.98
path	50.11,53.78	51.22,59.12	53.58,60.05	55.86,57.19	58.11,58.67
path	61.20,55.26	63.90,54.16	65.95,58.60	68.39,54.25	67.30,49.51
path	66.94,46.11	64.93,39.76	68.35,38.37	73.03,36.59	78.22,39.11
path	80.09,41.77	81.52,47.88	81.14,54.53	84.76,60.10	88.26,63.13
path	89.58,67.45	86.13,79.13	83.85,81.99	79.68,75.80	74.93,72.40
path	71.73,71.92	66.40,71.08	64.94,72.55	60.59,74.44	58.98,78.43
path	55.19,81.63	51.23,81.44	50.22,73.66	44.38,68.40	42.59,67.01
path	39.55,56.74
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 15 Herbalism to collect these.
collect Earthroot##2449 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mageroyal",{
hardcore = true,
},[[
step
label "Path_One"
map Loch Modan
path follow smart; loop off; dist 20
path	40.87,42.34	40.99,35.44	40.38,29.51	40.17,23.46	41.23,14.88
path	41.13,12.44	42.83,10.59	46.36,14.30	49.72,14.09	53.28,10.94
path	55.46,15.29	59.73,16.49	61.91,22.17	63.02,31.38	66.61,41.14
path	67.83,45.31	67.40,49.93	64.11,54.95	62.24,59.85	59.35,63.18
path	54.73,67.89	51.47,69.31	48.03,68.82
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 50 Herbalism to collect these.
collect Mageroyal##785 |n
'|goto Loch Modan 48.03,68.82 < 20 |noway |c
step
map Loch Modan
path follow smart; loop off; dist 20
path	48.03,68.82	51.47,69.31	54.73,67.89	59.35,63.18	62.24,59.85
path	64.11,54.95	67.40,49.93	67.83,45.31	66.61,41.14	63.02,31.38
path	61.91,22.17	59.73,16.49	55.46,15.29	53.28,10.94	49.72,14.09
path	46.36,14.30	42.83,10.59	41.13,12.44	41.23,14.88	40.17,23.46
path	40.38,29.51	40.99,35.44	40.87,42.34
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 50 Herbalism to collect these.
collect Mageroyal##785 |n
'|goto Loch Modan 40.87,42.34 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Stranglekelp",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Briarthorn",{
hardcore = true,
},[[
step
map Loch Modan
path follow smart; loop on; ants curved; dist 20
path	50.11,70.98	56.14,64.90	60.73,61.95	63.09,57.29	64.59,43.34
path	58.98,33.49	55.48,28.48	53.87,22.04	57.70,16.70	61.33,17.00
path	63.45,23.61	63.96,28.94	67.27,33.55	71.77,36.88	74.64,31.08
path	76.86,42.55	75.17,53.91	77.54,57.68	77.01,64.32	78.39,70.75
path	76.62,73.82	73.00,71.84	67.09,75.89	58.35,76.95	55.16,77.71
path	51.86,73.52
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect Briarthorn##2450 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Swiftthistle",{
hardcore = true,
},[[
step
map Loch Modan
path follow smart; loop on; ants curved; dist 20
path	50.11,70.98	56.14,64.90	60.73,61.95	63.09,57.29	64.59,43.34
path	58.98,33.49	55.48,28.48	53.87,22.04	57.70,16.70	61.33,17.00
path	63.45,23.61	63.96,28.94	67.27,33.55	71.77,36.88	74.64,31.08
path	76.86,42.55	75.17,53.91	77.54,57.68	77.01,64.32	78.39,70.75
path	76.62,73.82	73.00,71.84	67.09,75.89	58.35,76.95	55.16,77.71
path	51.86,73.52
Click herbs as you follow the path around this area
|tip Briarthorn can share a spawn with other herbs in the area, so pick them all.
|tip Swiftthistle has a chance to be gathered from Briarthorn and Mageroyal.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 70 Herbalism to collect these.
collect Swiftthistle##2452 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Bruiseweed",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wild Steelbloom",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Grave Moss",{
hardcore = true,
},[[
step
Click herbs around this area
|tip Track them on your minimap with "Find Herbs".
|tip They spawn in this small area.
|tip You will need level 120 Herbalism to collect these.
collect Grave Moss##3369 |n |goto Wetlands 44.07,26.40
You can find more inside the crypt at [44.27,25.39]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Kingsblood",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Liferoot",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Fadeleaf",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Goldthorn",{
hardcore = true,
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
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Khadgar's Whisker",{
hardcore = true,
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
|tip You will need level 185 Herbalism to collect these.
collect Khadgar's Whisker##3358 |n
'|goto Stranglethorn Vale 31.79,52.55 < 20 |noway |c
step
map Stranglethorn Vale
path follow smart; loop off; dist 20
path	33.43,55.29	33.15,56.95	31.66,58.87	31.13,61.25	30.56,63.99
path	30.40,67.21
Click herbs as you follow the path around this area
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 185 Herbalism to collect these.
collect Khadgar's Whisker##3358 |n
'|goto Stranglethorn Vale 30.40,67.21 < 20 |noway |c |next "Path_One"
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wintersbite",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Wildvine",{
hardcore = true,
},[[
step
Kill Vilebranch Enemies around this area
collect Wildvine##8153 |n |goto The Hinterlands 47.57,66.46
|tip They have a 10% chance to be gathered from Purple Lotus around the Altar.
|tip Track them on your minimap with "Find Herbs".
|tip You will need level 210 Herbalism to collect these.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Firebloom",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Purple Lotus",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Arthas' Tears",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Sungrass",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Blindweed",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Ghost Mushroom",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Gromsblood",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Golden Sansam",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Dreamfoil",{
hardcore = true,
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
|tip You will need level 270 Herbalism to collect these.
collect Dreamfoil##13463 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Mountain Silversage",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Plaguebloom",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Icecap",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Herbalism\\Farming Guides\\Black Lotus",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Leatherworking (1-300)",{
condition_suggested=function() return skill('Leatherworking') > 0 end,
description="This guide will walk you through leveling your Leatherworking skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Gretta Finespindle##1466
|tip Downstairs inside the building.
Train Apprentice Leatherworking |skillmax Leatherworking,75 |goto Ironforge 38.82,32.86
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Leatherworking |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Leatherworking") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Light_Leather_Total"
stickystart "Collect_Medium_Leather_Total"
stickystart "Collect_Heavy_Hide_Total"
stickystart "Collect_Heavy_Leather_Total"
stickystart "Collect_Thick_Leather_Total"
stickystart "Collect_Rugged_Leather_Total"
step
collect 57 Ruined Leather Scraps##2934 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Leatherworking") >= 20 |or
step
label "Collect_Light_Leather_Total"
collect 375 Light Leather##2318 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 125 |or
step
label "Collect_Medium_Leather_Total"
collect 352 Medium Leather##2319 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 155 |or
step
label "Collect_Heavy_Hide_Total"
collect 20 Heavy Hide##4235 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 171 |or
step
label "Collect_Heavy_Leather_Total"
collect 215 Heavy Leather##4234 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 200 |or
step
label "Collect_Thick_Leather_Total"
collect 643 Thick Leather##4304 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 260 |or
step
label "Collect_Rugged_Leather_Total"
collect 384 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |notinsticky |only if not selfmade
|tip Farm them with Skinning. |notinsticky |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Leatherworking") >= 300 |or
step
label "Begin_Profession_Leveling"
collect 57 Ruined Leather Scraps##2934 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
'|complete skill("Leatherworking") >= 20 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 19 Light Leather>_
|tip Save these, you will need them later.
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
collect 19 Light Leather##2318 |or
'|complete skill("Leatherworking") >= 20 |or
step
Open Your Leatherworking Crafting Panel:
_<Create Light Leather>_
|tip Save 19 of these, you will need them later.
|tip You can also use 20 Light Leather to make 20 Light Armor Kits.
Reach Skill 20 in Leatherworking |skill Leatherworking,20
step
collect 40 Light Leather##2318 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 45 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 40 Light Armor Kits>_
|tip You may need to create a few more or less of these.
|tip Each additional Light Armor Kit requires 1 Light Leather.
Reach Skill 45 in Leatherworking |skill Leatherworking,45
step
collect 42 Light Leather##2318 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 55 |or
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy 21 Coarse Thread##2320 |goto Ironforge 39.62,34.47 |or
'|complete skill("Leatherworking") >= 55 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 21 Handstitched Leather Cloaks>_
|tip You may need to create a few more or less of these.
|tip Each additional Handstitched Leather Cloak requires 2 Light Leather and 1 Coarse Thread.
Reach Skill 55 in Leatherworking |skill Leatherworking,55
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Fimble Finespindle##5127
|tip Downstairs inside the building.
Train Journeyman Leatherworking |skillmax Leatherworking,150 |goto Ironforge 40.23,33.66
step
talk Gretta Finespindle##1466
|tip Downstairs inside the building.
Train Embossed Leather Gloves |learn Embossed Leather Gloves##3756 |goto Ironforge 38.84,32.85
step
collect 165 Light Leather##2318 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 100 |or
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy 180 Coarse Thread##2320 |goto Ironforge 39.62,34.47 |or
|tip Save these, you will need them later.
'|complete skill("Leatherworking") >= 100 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 55 Embossed Leather Gloves>_
|tip You may need to create a few more or less of these.
|tip Each additional Embossed Leather Glove requires 3 Light Leather and 2 Coarse Thread.
Reach Skill 100 in Leatherworking |skill Leatherworking,100
step
talk Fimble Finespindle##5127
|tip Downstairs inside the building.
Train Fine Leather Belt |learn Fine Leather Belt##3763 |goto Ironforge 40.23,33.66
step
collect 210 Light Leather##2318 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 125 |or
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy 70 Coarse Thread##2320 |goto Ironforge 39.62,34.47 |or
|tip You bought these in a previous step.
'|complete skill("Leatherworking") >= 125 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 35 Fine Leather Belts>_
|tip You may need to create a few more or less of these.
|tip Each additional Fine Leather Belt requires 6 Light Leather and 2 Coarse Thread.
Reach Skill 125 in Leatherworking |skill Leatherworking,125
step
talk Fimble Finespindle##5127
|tip Downstairs inside the building.
Train Dark Leather Boots |learn Dark Leather Boots##2167 |goto Ironforge 40.23,33.66
step
collect 72 Medium Leather##2319 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 137 |or
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy 36 Fine Thread##2321 |goto Ironforge 39.62,34.47 |or 2
buy 18 Gray Dye##4340 |goto Ironforge 39.62,34.47 |or 2
'|complete skill("Leatherworking") >= 137 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 18 Dark Leather Boots>_
|tip You may need to create a few more or less of these.
|tip Each additional Dark Leather Boot requires 4 Medium Leather, 2 Fine Thread, and 1 Gray Dye.
Reach Skill 137 in Leatherworking |skill Leatherworking,137
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Expert Leatherworking |skillmax Leatherworking,225 |goto Darnassus 64.43,21.54
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Dark Leather Pants |learn Dark Leather Pants##7135 |goto Darnassus 64.43,21.54
step
collect 240 Medium Leather##2319 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 150 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 20 Fine Thread##2321 |goto Darnassus 63.70,22.28 |or 2
buy 20 Gray Dye##4340 |goto Darnassus 63.70,22.28 |or 2
'|complete skill("Leatherworking") >= 150 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 20 Dark Leather Pants>_
|tip You may need to create a few more or less of these.
|tip Each additional Dark Leather Pant requires 12 Medium Leather, 1 Fine Thread, and 1 Gray Dye.
Reach Skill 150 in Leatherworking |skill Leatherworking,150
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Heavy Leather |learn Heavy Leather##20649 |goto Darnassus 64.43,21.54
step
collect 40 Medium Leather##2319 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 155 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 8 Heavy Leather>_
|tip You may need to create a few more or less of these.
|tip Each additional Heavy Leather requires 5 Medium Leather.
Reach Skill 155 in Leatherworking |skill Leatherworking,155
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Cured Heavy Hide |learn Cured Heavy Hide##3818 |goto Darnassus 64.43,21.54
step
collect 20 Heavy Hide##4235 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 171 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 60 Salt##4289 |goto Darnassus 63.70,22.28 |or
'|complete skill("Leatherworking") >= 171 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 20 Cured Heavy Hides>_
|tip Save these, you will need them later.
collect 20 Cured Heavy Hide##4236 |or
'|complete skill("Leatherworking") >= 171 |or
step
Open Your Leatherworking Crafting Panel:
_<Create Cured Heavy Hides>_
|tip Save 20 of these, you will need them later.
|tip You may need to create a few more of these.
|tip Each additional Cured Heavy Hide requires 1 Heavy Hide and 3 Salt.
Reach Skill 165 in Leatherworking |skill Leatherworking,165
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Heavy Armor Kit |learn Heavy Armor Kit##3780 |goto Darnassus 64.43,21.54
step
collect 95 Heavy Leather##4234 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 180 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 39 Fine Thread##2321 |goto Darnassus 63.70,22.28 |or
|tip Save these, you will need them later.
'|complete skill("Leatherworking") >= 180 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 19 Heavy Armor Kits>_
|tip You may need to create a few more of these.
|tip Each additional Heavy Armor Kit requires 5 Heavy Leather and 1 Fine Thread.
Reach Skill 180 in Leatherworking |skill Leatherworking,180
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Barbaric Shoulders |learn Barbaric Shoulders##7151 |goto Darnassus 64.43,21.54
stickystart "Collect_Cured_Heavy_Hide_190"
step
collect 80 Heavy Leather##4234 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 190 |or
step
label "Collect_Cured_Heavy_Hide_190"
collect 10 Cured Heavy Hide##4236 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 190 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 20 Fine Thread##2321 |goto Darnassus 63.70,22.28 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 190 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 10 Barbaric Shoulders>_
Reach Skill 190 in Leatherworking |skill Leatherworking,190
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Guardian Gloves |learn Guardian Gloves##7156 |goto Darnassus 64.43,21.54
stickystart "Collect_Cured_Heavy_Hide_200"
step
collect 40 Heavy Leather##4234 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 200 |or
step
label "Collect_Cured_Heavy_Hide_200"
collect 10 Cured Heavy Hide##4236 |or
|tip You created these in a previous step.
'|complete skill("Leatherworking") >= 200 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 15 Silken Thread##4291 |goto Darnassus 63.70,22.28 |or
|tip Save these, you will need them later.
'|complete skill("Leatherworking") >= 200 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 10 Guardian Gloves>_
Reach Skill 200 in Leatherworking |skill Leatherworking,200
step
talk Telonis##4212
|tip Upstairs inside the building.
Train Thick Armor Kit |learn Thick Armor Kit##10487 |goto Darnassus 64.43,21.54
step
collect 25 Thick Leather##4304 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 205 |or
step
talk Saenorion##4225
|tip Upstairs inside the building.
buy 5 Silken Thread##4291 |goto Darnassus 63.70,22.28 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 205 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 5 Thick Armor Kits>_
Reach Skill 205 in Leatherworking |skill Leatherworking,205
step
Reach Level 35 |ding 35
|tip You must be at least this level before you can learn the next rank of this profession.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto The Hinterlands 14.17,45.22 < 20 |walk
Run down the stairs |goto The Hinterlands 13.18,43.43 < 5 |walk
talk Drakk Stonehand##11097
|tip Downstairs inside the building.
Train Artisan Leatherworking |skillmax Leatherworking,300 |goto The Hinterlands 13.39,43.48
step
talk Drakk Stonehand##11097
|tip Downstairs inside the building.
Train Nightscape Headband |learn Nightscape Headband##10507 |goto The Hinterlands 13.39,43.48
step
collect 200 Thick Leather##4304 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 235 |or
step
talk Nioma##8160
|tip Downstairs inside the building.
buy 166 Silken Thread##4291 |goto The Hinterlands 13.30,43.37 |or
|tip Save these, you will need them later.
'|complete skill("Leatherworking") >= 235 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 40 Nightscape Headbands>_
|tip You may need to make a few more or less of these.
|tip Each additional Nightscape Headband requires 5 Thick Leather and 2 Silken Thread.
Reach Skill 235 in Leatherworking |skill Leatherworking,235
step
talk Drakk Stonehand##11097
|tip Downstairs inside the building.
Train Nightscape Pants |learn Nightscape Pants##10548 |goto The Hinterlands 13.39,43.48
step
collect 210 Thick Leather##4304 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 250 |or
step
talk Nioma##8160
|tip Downstairs inside the building.
buy 60 Silken Thread##4291 |goto The Hinterlands 13.30,43.37 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 250 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 15 Nightscape Pants>_
Reach Skill 250 in Leatherworking |skill Leatherworking,250
step
talk Drakk Stonehand##11097
|tip Downstairs inside the building.
Train Nightscape Boots |learn Nightscape Boots##10558 |goto The Hinterlands 13.39,43.48
step
collect 208 Thick Leather##4304 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 260 |or
step
talk Nioma##8160
|tip Downstairs inside the building.
buy 26 Heavy Silken Thread##8343 |goto The Hinterlands 13.30,43.37 |or
|tip You purchased these in a previous step.
'|complete skill("Leatherworking") >= 260 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 13 Nightscape Boots>_
|tip You may need to make a few more or less of these.
|tip Each additional Nightscape Boot requires 16 Thick Leather and 2 Heavy Silken Thread.
Reach Skill 260 in Leatherworking |skill Leatherworking,260
step
talk Leonard Porter##12942
buy Pattern: Wicked Leather Gauntlets##15725 |goto Western Plaguelands 43.00,84.20 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Leatherworking") >= 290 |or
step
talk Leonard Porter##12942
buy 33 Black Dye##2325 |goto Western Plaguelands 43.00,84.20 |or 2
buy 33 Rune Thread##14341 |goto Western Plaguelands 43.00,84.20 |or 2
'|complete skill("Leatherworking") >= 290 |or
step
use the Pattern: Wicked Leather Gauntlets##15725
Learn Wicked Leather Gauntlets |learn Wicked Leather Gauntlets##19049
step
collect 264 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 290 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 33 Wicked Leather Gauntlets>_
|tip You may need to make a few more or less of these.
|tip Each additional Wicked Leather Gauntlet requires 8 Rugged Leather, 1 Black Dye, and 1 Rune Thread.
Reach Skill 290 in Leatherworking |skill Leatherworking,290
step
Follow the path up |goto Felwood 43.08,21.31 < 20 |only if walking
kill Jadefire Trickster##7107+
collect Pattern: Wicked Leather Headband##15744 |goto Felwood 42.00,18.87 |or
|tip This pattern might take a while to farm.
|tip It can also be purchased from the auction house. |only if not selfmade
You can find more Jadefire Tricksters around:
[Felwood 42.87,15.20]
[Felwood 39.53,20.61]
'|complete skill("Leatherworking") >= 300 or knowsrecipe(19071) |or
step
use the Pattern: Wicked Leather Headband##15744
Train Wicked Leather Headband |learn Wicked Leather Headband##19071
step
collect 120 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Leatherworking") >= 300 |or
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy 10 Black Dye##2325 |goto Ironforge 39.62,34.47 |or 2
buy 10 Rune Thread##14341 |goto Ironforge 39.62,34.47 |or 2
'|complete skill("Leatherworking") >= 55 |or
step
Open Your Leatherworking Crafting Panel:
_<Create 10 Wicked Leather Headbands>_
Reach Skill 300 in Leatherworking |skill Leatherworking,300
step
_Congratulations!_
You Reached Skill 300 in Leatherworking.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Lockpicking\\Lockpicking (1-300)",{
condition_suggested=function() return skill('Lockpicking') > 0 end,
description="This guide will walk you through leveling your Lockpicking skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 20 |ding 20
|tip You must be at least level 16 before you can learn Lockpicking.
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 20 to reach level 100 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
talk Osborne the Night Man##918
Train Pick Lock |learn Pick Lock##1804 |goto Stormwind City 74.64,52.82
step
Enter the building |goto Stormwind City 74.75,53.72 < 7 |only if walking
Enter the building |goto Stormwind City 77.12,58.02 < 7 |walk
talk Renzik "The Shiv"##6946
|tip Upstairs inside the building.
accept Redridge Rendezvous##2281 |goto Stormwind City 75.76,60.36
step
talk Lucius##6966
turnin Redridge Rendezvous##2281 |goto Redridge Mountains 28.06,52.04
|tip Save the Thieves' Tools you get as a reward.
|tip You must keep Thieves' Tools in your bags to be able to pick locks.
accept Alther's Mill##2282 |goto Redridge Mountains 28.06,52.04
step
Follow the road |goto Redridge Mountains 33.21,47.22 < 30 |only if walking
Follow the path |goto Redridge Mountains 43.36,37.56 < 30 |only if walking
click Practice Lockbox##178244+
|tip Inside the building.
Reach Skill 100 in Lockpicking |skill Lockpicking,100 |goto Redridge Mountains 51.99,45.19
step
click Lucius's Lockbox##121264
|tip Inside the building.
collect Token of Thievery##7871 |q 2282/1 |goto Redridge Mountains 52.04,44.69 |or
step
Follow the road |goto Redridge Mountains 42.87,37.52 < 30 |only if walking
talk Lucius##6966
turnin Alther's Mill##2282 |goto Redridge Mountains 28.06,52.04
step
Reach Level 30 |ding 30
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 30 to reach level 150 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
map Ashenvale
path	follow smart;	loop on;	ants curved;	dist 30
path	11.90,30.15	12.87,31.05	13.79,30.52	15.42,28.31	15.15,25.13
path	15.82,19.58	15.51,16.55	13.56,14.91	11.15,13.42	12.00,15.83
path	13.22,16.26	14.17,16.22	15.09,17.10	14.04,19.81	14.75,21.67
path	14.41,23.32	13.04,24.29	12.29,25.73	11.68,25.84	11.48,26.97
path	11.75,28.81
click Waterlogged Footlocker##179487+
|tip They look like small yellow and brown wooden chests on the ground around this area.
Reach Skill 150 in Lockpicking |skill Lockpicking,150
step
Reach Level 40 |ding 40
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 40 to reach level 200 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Badlands 43.03,30.08 < 20 |walk
Run up the stairs |goto Badlands 39.62,27.22 < 5 |c
|tip You can also farm under the water in Desolace with Water Breathing.
|tip There are boxes off the coast at 35.02,21.03
'|complete skill("Lockpicking") >= 200 |or
step
click Battered Footlocker##179490+
|tip They look like small wooden chests upstairs inside the building.
|tip You can also farm under the water in Desolace with Water Breathing.
|tip There are boxes off the coast at 35.02,21.03
Reach Skill 175 in Lockpicking |skill Lockpicking,175 |goto Badlands 40.49,28.01
You can find more at: |notinsticky
[41.29,29.31]
[41.44,29.95]
[41.37,26.17]
step
Jump down and follow the path |goto Badlands 42.29,27.96 < 5 |walk
Run down the stairs |goto Badlands 42.17,26.73 < 5 |c |walk
|tip You can also farm under the water in Desolace with Water Breathing.
|tip There are boxes off the coast at 35.02,21.03
'|complete skill("Lockpicking") >= 200 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests downstairs inside the building.
|tip You can also farm under the water in Desolace with Water Breathing.
|tip There are boxes off the coast at 35.02,21.03
Reach Skill 200 in Lockpicking |skill Lockpicking,200 |goto Badlands 41.08,27.42
You can find more at: |notinsticky
[40.73,28.07]
[40.81,28.68]
[42.30,28.40]
step
Reach Level 50 |ding 50
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 50 to reach level 250 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Follow the path down |goto Searing Gorge 63.41,38.52 < 10 |only if walking
Run up the ramp |goto Searing Gorge 46.75,53.52 < 15 |only if walking
Enter the cave |goto Searing Gorge 41.38,53.89 < 7 |c
'|complete skill("Lockpicking") >= 250 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests on the ground around this area inside the cave, in the lower section.
|tip You can also try to pickpocket enemies around this area to get Sturdy Junkboxes to unlock.
Reach Skill 225 in Lockpicking |skill Lockpicking,225 |goto Searing Gorge 38.44,50.83
You can find more at: |notinsticky
[Searing Gorge 38.00,45.87]
Through the Quarry Gate at [Searing Gorge 37.82,44.31]
[Searing Gorge 40.40,38.18]
[Searing Gorge 40.73,31.16]
[Searing Gorge 42.28,29.47]
[Searing Gorge 39.07,24.44]
step
Run up the ramp |goto Searing Gorge 44.22,24.36 < 7 |walk
Follow the path |goto Searing Gorge 42.47,30.78 < 7 |c
'|complete skill("Lockpicking") >= 250 |or
step
click Dented Footlocker##179492+
|tip They look like small wooden chests on the ground around this area inside the cave, in the upper section.
|tip You can also try to pickpocket enemies around this area to get Sturdy Junkboxes to unlock.
Reach Skill 250 in Lockpicking |skill Lockpicking,250 |goto Searing Gorge 42.90,31.18
You can find more around: |notinsticky
[43.93,30.88]
[45.77,28.35]
[46.88,25.68]
step
Reach Level 60 |ding 60
|tip You are able to gain 5 levels of Lockpicking for each level your character gains.
|tip You need to be at least level 60 to reach level 300 Lockpicking in a few steps.
|tip Use the leveling guides to accomplish this.
step
Follow the path up |goto Searing Gorge 33.53,75.22 < 20 |only if walking
Enter Blackrock Mountain |goto Searing Gorge 34.76,83.98
|tip The waypoint arrow will stop working after you enter the doors.
|tip Once you enter through the huge doors, take the first left you come to.
|tip Walk up onto the large chain and follow it to the island in the middle of the lava.
|tip Run down the stairs and follow the path to another large chain.
|tip Walk across the large chain and follow the path into the Grinding Quarry.
|tip Once in the Grinding Quarry, follow the path northwest through the tunnel to find the dungeon portal entrance.
Click Here After Entering the Blackrock Depths Dungeon |confirm
'|complete skill("Lockpicking") >= 300 |or
step
_Inside the Blackrock Depths Dungeon:_
|tip Pick the following locks inside the dungon.
|tip You can also pickpocket enemies inside the dungeon to get Strong Junkboxes and Heavy Junkboxes to unlock.
|tip
|tip Lock #1: Once inside the dungeon, immediately turn left, pick the locked door and walk through it.
|tip Lock #2: Up ahead, on the right, pick the locked door and walk through it.
|tip Lock #3: Up ahead, on the left, pick the locked door and walk through it.
|tip Lock #4: Straight ahead, under the huge gear, pick the Shadowforge Lock.
|tip
|tip After you pick these 4 locks, leave the dungeon the way you came.
|tip Outside the dungeon portal, right-click your player portrait.
|tip Select "Reset all instances" and re-enter the dungeon to repeat this process.
Reach Skill 300 in Lockpicking |skill Lockpicking,300
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Mining (1-300)",{
condition_suggested=function() return skill('Mining') > 0 end,
description="This guide will walk you through leveling your Mining skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train Apprentice professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.41,16.18 < 5 |walk
talk Gelman Stonehand##5513
|tip Upstairs inside the building.
Train Apprentice Mining |skillmax Mining,75 |goto Stormwind City 51.19,17.31
step
talk Brooke Stonebraid##5514
|tip Inside the building.
buy Mining Pick##2901 |goto Stormwind City 51.02,16.86
|tip You must have a Mining Pick in your bags to be able to gather ore.
step
map Elwynn Forest
path	follow smart;	loop on;	ants curved;	dist 10
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Reach Skill 65 in Mining |skill Mining,65
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Copper Ore from skill level 1-47 for additional points.
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Stormwind City 52.41,16.18 < 5 |walk
talk Gelman Stonehand##5513
|tip Upstairs inside the building.
Train Journeyman Mining |skillmax Mining,150 |goto Stormwind City 51.19,17.31
step
map Wetlands
path	follow smart;	loop on;	ants curved;	dist 10
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Reach Skill 125 in Mining |skill Mining,125
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Bronze Bars with leftover Tin and Copper Bars from skill level 65-90 for additional points.
|tip You can smelt Silver Ore from skill level 75-112 for additional points.
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Run up the stairs |goto Ironforge 51.88,29.67 < 7 |walk
Enter the building |goto Ironforge 49.57,28.51 < 5 |walk
talk Geofram Bouldertoe##4254
|tip Downstairs inside the building.
Train Expert Mining |skillmax Mining,225 |goto Ironforge 50.00,26.29
step
map Arathi Highlands
path	follow smart;	loop on;	ants curved;	dist 30
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Reach Skill 175 in Mining |skill Mining,175
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Iron Ore from skill level 125-135 for additional points.
|tip You can smelt Gold Ore from skill level 155-184 for additional points.
step
map Badlands
path	follow smart;	loop on;	ants curved;	dist 30
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Reach Skill 200 in Mining |skill Mining,200
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
|tip You can smelt Gold Ore from skill level 155-184 for additional points.
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 51.88,29.67 < 7 |walk
Enter the building |goto Ironforge 49.57,28.51 < 5 |walk
talk Geofram Bouldertoe##4254
|tip Downstairs inside the building.
Train Artisan Mining |skillmax Mining,300 |goto Ironforge 50.00,26.29
step
map Badlands
path	follow smart;	loop on;	ants curved;	dist 30
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Reach Skill 230 in Mining |skill Mining,230
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
step
map Un'Goro Crater
path	follow smart;	loop on;	ants curved;	dist 30
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
Reach Skill 300 in Mining |skill Mining,300
|tip Click ore as you follow the path around this area.
|tip Track them on your minimap with "Find Minerals".
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Copper Ore",{
hardcore = true,
},[[
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Copper Ore##2770 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Rough Stone",{
hardcore = true,
},[[
step
map Elwynn Forest
path follow smart; loop on; ants curved; dist 20
path	30.84,52.85	31.66,56.55	30.70,59.27	33.97,61.71	32.67,69.74
path	34.82,71.77	38.65,70.47	41.90,72.73	38.79,78.16	36.73,83.14
path	38.86,85.10	40.47,81.19	42.54,75.73	43.46,72.43	45.88,71.66
path	48.66,72.57	50.67,73.61	52.16,76.22	51.59,81.68	50.51,84.27
path	52.44,85.57	54.07,81.63	55.50,80.65	57.18,77.77	59.76,76.99
path	64.90,71.42	66.82,69.10	70.81,68.32	75.97,68.43	74.95,64.93
path	73.11,60.29	76.43,54.83	77.84,50.88	75.35,46.25	73.10,46.01
path	71.20,49.01	71.93,55.39	68.33,54.29	67.11,57.66	65.88,58.62
path	65.45,55.47	63.86,53.92	61.15,54.32	59.49,56.50	57.71,57.94
path	55.65,58.04	53.51,57.94	52.34,58.34	51.04,58.74	49.28,57.01
path	50.05,53.17	48.15,51.19	47.15,49.29	43.66,49.22	41.39,51.02
path	39.84,53.01	36.99,52.64	34.92,51.69	35.76,48.57	34.85,46.74
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
collect Rough Stone##2835 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Tin Ore",{
hardcore = true,
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect Tin Ore##2771 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Coarse Stone",{
hardcore = true,
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect these.
collect Coarse Stone##2836 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Silver Ore",{
hardcore = true,
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 75 Mining to collect these.
collect Silver Ore##2775 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Moss Agate",{
hardcore = true,
},[[
step
map Wetlands
path follow smart; loop on; ants curved; dist 20
path	34.74,16.82	36.33,18.75	39.75,20.23	43.44,23.27	46.05,22.77
path	48.20,23.86	49.91,23.03	53.21,23.66	55.80,22.78	57.30,23.64
path	58.74,23.33	60.36,21.58	61.25,24.78	63.07,26.13	64.55,28.11
path	63.58,30.34	64.11,33.78	65.20,39.01	67.23,42.83	71.03,45.91
path	70.92,50.14	67.86,53.66	67.02,56.69	66.31,60.65	66.18,65.59
path	67.37,73.31	59.48,72.47	57.49,74.14	56.16,78.29	54.13,78.16
path	54.29,74.22	54.19,68.98	56.08,60.41	56.30,58.46	55.28,53.86
path	53.93,48.40	52.05,43.80	48.11,40.65	44.62,39.47	42.08,40.16
path	38.66,37.95	34.42,38.78
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 65 Mining to collect Tin Ore nodes and 75 to collect Silver Ore nodes.
collect Moss Agate##1206 |n
|tip These are a rare drop from Tin and Silver Ore nodes.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Iron Ore",{
hardcore = true,
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Iron Ore##2772 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Heavy Stone",{
hardcore = true,
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 125 Mining to collect these.
collect Heavy Stone##2838 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Gold Ore",{
hardcore = true,
},[[
step
map Arathi Highlands
path follow smart; loop on; ants curved; dist 20
path	76.64,42.59	75.00,44.93	72.65,48.07	70.58,55.05	69.99,58.40
path	72.92,59.03	72.28,63.63	72.78,66.86	71.75,66.15	69.15,72.54
path	67.17,70.90	63.52,73.55	59.48,74.71	59.32,70.74	56.16,71.89
path	50.82,78.41	47.96,82.44	42.53,80.75	43.02,77.16	40.39,71.86
path	37.95,67.63	38.52,68.50	33.94,66.02	34.59,61.64	33.70,56.77
path	33.45,53.94	33.65,50.19	35.00,47.28	32.96,46.68	31.68,45.41
path	32.34,42.64	31.42,41.24	25.23,43.10	20.94,39.12	20.02,35.80
path	19.12,33.36	22.43,31.28	23.48,24.90	26.93,20.65	28.65,14.18
path	28.96,16.96	31.62,18.63	30.96,20.36	33.19,21.23	36.35,24.61
path	39.97,25.62	40.21,28.79	43.97,30.51	45.70,33.02	48.08,33.60
path	49.78,36.76	52.14,36.11	52.75,31.99	54.80,33.13	58.19,32.50
path	58.02,34.22	59.94,35.97	62.25,32.06	64.69,35.58	64.49,26.56
path	66.77,27.64	70.39,27.07	70.47,30.74	71.07,38.63
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 155 Mining to collect these.
collect Gold Ore##2776 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Mithril Ore",{
hardcore = true,
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Mithril Ore##3858 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Solid Stone",{
hardcore = true,
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 175 Mining to collect these.
collect Solid Stone##7912 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Truesilver Ore",{
hardcore = true,
},[[
step
map Badlands
path follow smart; loop on; ants curved; dist 20
path	26.84,74.76	25.28,78.53	19.71,81.32	14.75,83.82	12.50,85.54
path	7.98,80.56	6.30,74.40	8.68,67.97	17.19,68.54	15.13,72.43
path	17.19,77.39	21.25,75.06	25.11,72.08
Click ore as you follow the path around this area
|tip Track them on your minimap with "Find Minerals".
|tip You will need level 230 Mining to collect these.
collect Truesilver Ore##7911 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Dark Iron Ore",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Thorium Ore",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Dense Stone",{
hardcore = true,
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
collect Dense Stone##12365 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Guardian Stone",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Mining\\Farming Guides\\Elementium Ore",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Skinning (1-300)",{
condition_suggested=function() return skill('Skinning') > 0 end,
description="This guide will walk you through leveling your Skinning skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 before you can learn professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Balthus Stoneflayer##6291
|tip Downstairs inside the building.
Train Apprentice Skinning |skillmax Skinning,75 |goto Ironforge 39.86,32.51
step
talk Bombus Finespindle##5128
|tip Downstairs inside the building.
buy Skinning Knife##7005 |goto Ironforge 39.61,34.47
|tip You must have a Skinning Knife in your bags to be able to skin enemies.
step
map Dun Morogh
path follow loose;	loop;	ants curved;	dist 30
path	43.96,46.88		40.38,47.16		36.62,45.87		32.97,48.03
path	28.87,48.65		29.08,43.33		32.55,37.52		39.71,31.71
path	43.35,31.77		44.37,36.99
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 75 in Skinning |skill Skinning,75
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to become a Journeyman in a profession.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Balthus Stoneflayer##6291
|tip Downstairs inside the building.
Train Journeyman Skinning |skillmax Skinning,150 |goto Ironforge 39.86,32.51
step
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 125 in Skinning |skill Skinning,125 |goto Loch Modan 54.84,37.76
You can find more around: |notinsticky
[Loch Modan 63.58,38.31]
[Loch Modan 74.11,40.81]
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Balthus Stoneflayer##6291
|tip Downstairs inside the building.
Train Expert Skinning |skillmax Skinning,225 |goto Ironforge 39.86,32.51
step
Follow the path |goto Wetlands 10.80,54.98 < 15 |only if walking
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 165 in Skinning |skill Skinning,165 |goto Wetlands 22.16,53.53
You can find more around: |notinsticky
[Wetlands 25.11,46.89]
[Wetlands 28.92,43.39]
step
Kill enemies around this area
|tip Skin their corpses.
|tip The spiders won't be skinnable.
Reach Skill 180 in Skinning |skill Skinning,180 |goto Arathi Highlands 40.94,47.87
step
Kill enemies around this area
|tip Skin their corpses.
|tip The spiders won't be skinnable.
Reach Skill 225 in Skinning |skill Skinning,225 |goto Arathi Highlands 52.20,67.24
You can find more around [47.81,77.26]
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Run up the stairs |goto Ironforge 41.98,33.37 < 7 |only if walking
Enter the building |goto Ironforge 40.36,35.48 < 5 |walk
talk Balthus Stoneflayer##6291
|tip Downstairs inside the building.
Train Artisan Skinning |skillmax Skinning,300 |goto Ironforge 39.86,32.51
step
Run up the ramp |goto Feralas 30.92,43.22 < 7 |only if walking
Ride the boat or swim across |goto Feralas 31.03,39.87 < 20 |only if walking
Follow the path up |goto Feralas 47.09,44.45 < 20 |only if walking
Follow the road |goto Feralas 48.76,45.17 < 30 |only if walking
Follow the path |goto Feralas 54.31,51.36 < 30 |only if walking
Kill Feral Scar enemies around this area
|tip They look like yetis.
|tip You can find more through the tunnel.
|tip Skin their corpses.
Reach Skill 260 in Skinning |skill Skinning,260 |goto Feralas 55.21,56.38
step
Follow the road |goto Feralas 54.86,51.34 < 30 |only if walking
Continue following the road |goto Feralas 50.21,49.70 < 30 |only if walking
Follow the path |goto Feralas 48.29,38.07 < 30 |only if walking
Kill enemies around this area
|tip Skin their corpses.
Reach Skill 300 in Skinning |skill Skinning,300 |goto Feralas 49.99,33.16
You can find more around: |notinsticky
[51.94,31.89]
[49.59,28.55]
[46.15,23.56]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Green Whelp Scale",{
hardcore = true,
},[[
step
Kill Whelp enemies around this area
|tip Skin their corpses.
|tip You will need level 170 Skinning to collect these.
collect Green Whelp Scale##7392 |n |goto Swamp of Sorrows 13.29,64.20
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Black Whelp Scale",{
hardcore = true,
},[[
step
kill Black Dragon Whelp##441+
|tip Skin their corpses.
|tip You will need level 70 Skinning to collect these.
collect Black Whelp Scale##7286 |n |goto Redridge Mountains 34.85,69.67
You can find more around: |notinsticky
[29.64,74.26]
[46.74,77.01]
[57.29,75.08]
[66.62,76.17]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Ruined Leather Scraps",{
hardcore = true,
},[[
step
kill Stonetusk Boar##113+
|tip Skin their corpses.
collect Ruined Leather Scraps##2934 |n |goto Elwynn Forest 41.58,86.96
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Light Leather",{
hardcore = true,
},[[
step
kill Stonetusk Boar##113+
|tip Skin their corpses.
collect Light Leather##2318 |n |goto Elwynn Forest 41.58,86.96
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thin Kodo Leather",{
hardcore = true,
},[[
step
map The Barrens
path follow smart; loop on; ants curved; dist 20
path	48.32,63.77	46.77,67.86	47.33,72.51	48.23,76.23	48.03,80.88
path	44.76,80.45	44.63,73.81	45.67,69.12	45.20,64.63	46.23,61.11
Kill Kodo enemies as you follow the path around this area
|tip They walk in packs around this area.
|tip Thunderheads and Stormhides won't drop this item.
collect Thin Kodo Leather##5082 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Light Hide",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Slimy Murloc Scale",{
hardcore = true,
},[[
step
Kill Vile Fin enemies around this area
collect Slimy Murloc Scale##5784 |n |goto Silverpine Forest 78.30,30.76
You can find more around: |notinsticky
[80.06,28.45]
[73.54,17.09]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Medium Leather",{
hardcore = true,
},[[
step
Kill Yeti enemies around this area
|tip Skin their corpses.
|tip You can find more inside the cave.
|tip You will need level 155 Skinning to collect these.
collect Medium Leather##2319 |n |goto Hillsbrad Foothills 46.12,31.76
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Medium Hide",{
hardcore = true,
},[[
step
kill Blackened Basilisk##4044+
|tip Skin their corpses.
|tip You will need level 115 Skinning to collect these.
collect Medium Hide##4232 |n |goto Stonetalon Mountains 44.88,41.82
|tip These have a low drop rate.
You can find more around [36.49,48.50]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Leather",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Raptor Hide",{
hardcore = true,
},[[
step
Kill Highland enemies around this area
collect Raptor Hide##4461 |n |goto Arathi Highlands 52.39,67.61
You can find more around [47.28,78.85]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Hide",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Heavy Hide##4235 |n |goto The Hinterlands 16.19,50.97
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Turtle Scale",{
hardcore = true,
},[[
step
kill Steeljaw Snapper##14123+
|tip Skin their corpses.
|tip You will need level 210 Skinning to collect these.
collect Turtle Scale##8167 |n |goto Tanaris 67.22,25.77
You can find more around: |notinsticky
[67.57,28.82]
[67.85,35.25]
[68.10,39.75]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Murloc Scale",{
hardcore = true,
},[[
step
Kill Mirefin enemies around this area
collect Thick Murloc Scale##5785 |n |goto Dustwallow Marsh 58.78,9.45
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Leather",{
hardcore = true,
},[[
step
Kill Ravasaur enemies around this area
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect Thick Leather##4304 |n |goto Un'Goro Crater 67.37,72.59
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Thick Hide",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Only beast enemies will be skinnable.
|tip Skin their corpses.
|tip You will need level 245 Skinning to collect these.
collect Thick Hide##8169 |n |goto Un'Goro Crater 67.37,72.59
|tip These have a low drop rate.
You can find more around: |notinsticky
[65.75,64.16]
[70.21,55.33]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Worn Dragonscale",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Skin their corpses.
|tip You will need level 205 Skinning to collect these.
collect Worn Dragonscale##8165 |n |goto Dustwallow Marsh 44.75,66.19
|tip These have a low drop rate.
You can find more around [44.71,74.76]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Scorpid Scale",{
hardcore = true,
},[[
step
Kill Scorpid enemies around this area
|tip Skin their corpses.
|tip You will need level 215 Skinning to collect these.
collect Scorpid Scale##8154 |n |goto Tanaris 50.93,42.32
You can find more around: |notinsticky
[50.33,48.18]
[44.99,44.85]
[39.08,34.58]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Devilsaur Leather",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Rugged Leather",{
hardcore = true,
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Leather##8170 |n |goto Winterspring 66.43,44.38
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Warbear Leather",{
hardcore = true,
},[[
step
kill Diseased Grizzly##1816+
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Warbear Leather##15419 |n |goto Western Plaguelands 56.81,63.63
|tip These have a low drop rate.
You can find more around: |notinsticky
[58.69,58.24]
[57.20,52.78]
[61.55,52.23]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Green Dragonscale",{
hardcore = true,
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
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Blue Dragonscale",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Any Draconic or Blue enemy.
|tip These are level 50-54 Elite enemies.
|tip Skin their corpses.
|tip You will need level 250 Skinning to collect these.
collect Blue Dragonscale##15415 |n |goto Azshara 36.21,75.55
|tip These have a low drop rate.
You can find more around: |notinsticky
[41.63,77.37]
[42.89,82.91]
[39.79,83.98]
[37.50,80.60]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Rugged Hide",{
hardcore = true,
},[[
step
Kill Ice Thistle enemies around this area
|tip You can find more inside the cave.
|tip Skin their corpses.
|tip You will need level 275 Skinning to collect these.
collect Rugged Hide##8171 |n |goto Winterspring 66.43,44.38
|tip These have a low drop rate.
You can find more inside the cave at [67.67,41.72]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Black Dragonscale",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Most of the enemies around this area are Elite.
|tip Skin their corpses.
|tip You will need level 260 Skinning to collect these.
collect Black Dragonscale##15416 |n |goto Burning Steppes 91.30,35.07
|tip These have a low drop rate.
You can find more around [90.73,53.59]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Heavy Scorpid Scale",{
hardcore = true,
},[[
step
Kill Stonelash enemies around this area
|tip Skin their corpses.
|tip You will need level 270 Skinning to collect these.
collect Heavy Scorpid Scale##15408 |n |goto Silithus 31.40,38.23
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Core Leather",{
hardcore = true,
},[[
step
Enter the Molten Core Raid:
Kill Ancient Core Hounds and Magmadar
|tip They are trash mobs found throughout the raid and the second raid boss.
|tip Skin their corpses.
|tip Level 61's require 305 Skinning, level 62's require 310 Skinning, and bosses require 315 Skinning.
collect Core Leather##17012 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Scale of Onyxia",{
hardcore = true,
},[[
step
Enter the Onyxia's Lair Raid:
kill Onyxia##10184
|tip Skin its corpse.
|tip You will need level 315 Skinning to collect these.
collect Scale of Onyxia##15410 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Red Dragonscale",{
hardcore = true,
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
You can find more around: |notinsticky
[87.95,64.81]
[82.51,70.50]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Primal Bat Leather",{
hardcore = true,
},[[
step
Primal Bat Leather is currently unobtainable in Classic
It is dropped from High Priestess Jeklik in the Zul'Gurub raid
Zul'Gurub will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Primal Tiger Leather",{
hardcore = true,
},[[
step
Primal Tiger Leather is currently unobtainable in Classic
It is dropped from High Priest Thekal in the Zul'Gurub raid
Zul'Gurub will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Skinning\\Farming Guides\\Dreamscale",{
hardcore = true,
},[[
step
Dreamscale is currently unobtainable in Classic
They are dropped from the four Green Dragon world bosses
They will not be added to Classic until Phase 4
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Tailoring (1-300)",{
condition_suggested=function() return skill('Tailoring') > 0 end,
description="This guide will walk you through leveling your Tailoring skill from 1-300.",
hardcore = true,
},[[
step
Reach Level 5 |ding 5
|tip You must be at least level 5 to train professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Ironforge 43.88,29.71 < 5 |walk
talk Uthrar Threx##1703
|tip Inside the building.
Train Apprentice Tailoring |skillmax Tailoring,75 |goto Ironforge 43.81,27.86
step
Click Here if You Would Like to Collect All Materials First |confirm |next |or
_Or_
Click Here to Collect Materials as You Level or Resume Leveling Tailoring |confirm |next "Begin_Profession_Leveling" |or
'|complete skill("Tailoring") >= 300 |or |next "Begin_Profession_Leveling"
stickystart "Collect_Wool_Cloth_Total"
stickystart "Collect_Silk_Cloth_Total"
stickystart "Collect_Mageweave_Cloth_Total"
stickystart "Collect_Runecloth_Total"
stickystart "Collect_Rugged_Leather_Total"
step
collect 204 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 5-20 humanoid mobs. |only if selfmade
|tip These totals are approximate.
|tip You may need slightly more or less than the indicated amount.
'|complete skill("Tailoring") >= 50 |or
step
label "Collect_Wool_Cloth_Total"
collect 135 Wool Cloth##2592 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 100 |or
step
label "Collect_Silk_Cloth_Total"
collect 804 Silk Cloth##4306 |or
|tip Farm them from level 28-40 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 28-40 humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 146 |or
step
label "Collect_Mageweave_Cloth_Total"
collect 500 Mageweave Cloth##4338 |or
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 38-50 humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 185 |or
step
label "Collect_Runecloth_Total"
collect 1235 Runecloth##14047 |or
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 50+ humanoid mobs. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 260 |or
step
label "Collect_Rugged_Leather_Total"
collect 110 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
|tip These totals are approximate. |notinsticky
|tip You may need slightly more or less than the indicated amount. |notinsticky
'|complete skill("Tailoring") >= 300 |or
step
label "Begin_Profession_Leveling"
collect 204 Linen Cloth##2589 |or
|tip Farm them from level 5-20 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 5-20 humanoid mobs. |only if selfmade
'|complete skill("Tailoring") >= 50 |or
step
Open Your Tailoring Crafting Panel:
_<Create 102 Bolts of Linen Cloth>_
|tip Save these, you will need them later.
collect 102 Bolt of Linen Cloth##2996 |or
'|complete skill("Tailoring") >= 51 |or
step
Open Your Tailoring Crafting Panel:
_<Create Bolts of Linen Cloth>_
|tip Save 102 of these, you will need them later.
|tip You may need to make a few more of these.
|tip Each additional Bolt of Linen Cloth requires 2 Linen Cloth.
Reach Skill 45 in Tailoring |skill Tailoring,45
step
talk Uthrar Threx##1703
|tip Inside the building.
Train Linen Belt |learn Linen Belt##8776 |goto Ironforge 43.81,27.86
step
collect 40 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 70 |or
step
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 40 Coarse Thread##2320 |goto Ironforge 42.94,28.31 |or
|tip Save these, you will need them later.
'|complete skill("Tailoring") >= 70 |or
step
Open Your Tailoring Crafting Panel:
_<Create 40 Linen Belts>_
|tip You may need to make a few more of these.
|tip Each additional Linen Belt requires 1 Bolt of Linen Cloth and 1 Coarse Thread.
Reach Skill 70 in Tailoring |skill Tailoring,70
step
talk Uthrar Threx##1703
|tip Inside the building.
Train Reinforced Linen Cape |learn Reinforced Linen Cape##2397 |goto Ironforge 43.81,27.86
step
collect 10 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 75 |or
step
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 15 Coarse Thread##2320 |goto Ironforge 42.94,28.31 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 75 |or
step
Open Your Tailoring Crafting Panel:
_<Create 5 Reinforced Linen Capes>_
Reach Skill 75 in Tailoring |skill Tailoring,75
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to train Journeyman professions.
|tip Use the leveling guides to accomplish this.
step
talk Jormund Stonebrow##5153
|tip Inside the building.
Train Journeyman Tailoring |skillmax Tailoring,150 |goto Ironforge 43.15,29.35
step
talk Jormund Stonebrow##5153
|tip Inside the building.
Train Bolt of Woolen Cloth |learn Bolt of Woolen Cloth##2964 |goto Ironforge 43.15,29.35
step
collect 135 Wool Cloth##2592 |or
|tip Farm them from level 16-30 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 16-30 humanoid mobs. |only if selfmade
'|complete skill("Tailoring") >= 100 |or
step
Open Your Tailoring Crafting Panel:
_<Create 45 Bolts of Woolen Cloth>_
|tip Save these, you will need them later.
collect 45 Bolt of Woolen Cloth##2997 |or
'|complete skill("Tailoring") >= 106 |or
step
Open Your Tailoring Crafting Panel:
_<Create 45 Bolts of Woolen Cloth>_
|tip Save 45 of these, you will need them later.
|tip You may need to make a few more of these.
|tip Each additional Bolt of Woolen Cloth requires 3 Wool Cloth.
Reach Skill 100 in Tailoring |skill Tailoring,100
step
talk Jormund Stonebrow##5153
|tip Inside the building.
Train Simple Kilt |learn Simple Kilt##12046 |goto Ironforge 43.15,29.35
step
collect 52 Bolt of Linen Cloth##2996 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 110 |or
step
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 43 Fine Thread##2321 |goto Ironforge 42.94,28.31 |or
|tip Save these, you will need them later.
'|complete skill("Tailoring") >= 110 |or
step
Open Your Tailoring Crafting Panel:
_<Create 13 Simple Kilts>_
|tip You may need to make a few more of these.
|tip Each additional Simple Kilt requires 4 Bolts of Linen Cloth and 1 Fine Thread.
Reach Skill 110 in Tailoring |skill Tailoring,110
step
talk Jormund Stonebrow##5153
|tip Inside the building.
Train Double-stitched Woolen Shoulders |learn Double-stitched Woolen Shoulders##3848 |goto Ironforge 43.15,29.35
step
collect 45 Bolt of Woolen Cloth##2997 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 125 |or
step
talk Poranna Snowbraid##5154
|tip Inside the building.
buy 30 Fine Thread##2321 |goto Ironforge 42.94,28.31 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 125 |or
step
Open Your Tailoring Crafting Panel:
_<Create 15 Double-stitched Woolen Shoulders>_
Reach Skill 125 in Tailoring |skill Tailoring,125
step
Reach Level 20 |ding 20
|tip You must be at least level 20 to train Expert professions.
|tip Use the leveling guides to accomplish this.
|only if not ZGV.IsClassicSoD
step
Reach Level 26 |ding 26
|tip For Season of Discovery, you must be at least level 26 to train Expert professions.
|only if ZGV.IsClassicSoD
step
Enter the building |goto Stormwind City 44.54,73.90 < 5 |walk
talk Georgio Bolero##1346
|tip Inside the building.
Train Expert Tailoring |skillmax Tailoring,225 |goto Stormwind City 43.17,73.55
step
talk Georgio Bolero##1346
|tip Inside the building.
Train Bolt of Silk Cloth |learn Bolt of Silk Cloth##3839 |goto Stormwind City 43.17,73.55
step
collect 804 Silk Cloth##4306 |or
|tip Farm them from level 28-40 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 28-40 humanoid mobs. |only if selfmade
'|complete skill("Tailoring") >= 146 |or
step
Open Your Tailoring Crafting Panel:
_<Create 201 Bolts of Silk Cloth>_
|tip Save these, you will need them later.
collect 201 Bolt of Silk Cloth##4305 |or
'|complete skill("Tailoring") >= 146 |or
step
Open Your Tailoring Crafting Panel:
_<Create Bolts of Silk Cloth>_
|tip Save 201 of these, you will need them later.
Reach Skill 145 in Tailoring |skill Tailoring,145
step
Enter the building |goto Stormwind City 44.54,73.90 < 5 |walk
talk Georgio Bolero##1346
|tip Inside the building.
Train Azure Silk Hood |learn Azure Silk Hood##8760 |goto Stormwind City 43.17,73.55
step
collect 36 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 160 |or
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 18 Fine Thread##2321 |goto Stormwind City 43.26,74.08 |or 2
buy 36 Blue Dye##6260 |goto Stormwind City 43.26,74.08 |or 2
'|complete skill("Tailoring") >= 160 |or
step
Open Your Tailoring Crafting Panel:
_<Create 18 Azure Silk Hoods>_
|tip You may need to create a few mor or less of these.
|tip Each additional Azure Silk Hood requires 2 Bolts of Silk Cloth, 2 Blue Dye, and 1 Fine Thread.
Reach Skill 160 in Tailoring |skill Tailoring,160
step
talk Georgio Bolero##1346
|tip Inside the building.
Train Silk Headband |learn Silk Headband##8762 |goto Stormwind City 43.17,73.55
step
collect 30 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 170 |or
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 20 Fine Thread##2321 |goto Stormwind City 43.26,74.08 |or
'|complete skill("Tailoring") >= 170 |or
step
Open Your Tailoring Crafting Panel:
_<Create 10 Silk Headbands>_
Reach Skill 170 in Tailoring |skill Tailoring,170
step
talk Georgio Bolero##1346
|tip Inside the building.
Train Formal White Shirt |learn Formal White Shirt##3871 |goto Stormwind City 43.17,73.55
step
collect 15 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 175 |or
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 10 Bleach##2324 |goto Stormwind City 43.26,74.08 |or 2
buy 5 Fine Thread##2321 |goto Stormwind City 43.26,74.08 |or 2
'|complete skill("Tailoring") >= 175 |or
step
Open Your Tailoring Crafting Panel:
_<Create 5 Formal White Shirts>_
Reach Skill 175 in Tailoring |skill Tailoring,175
step
talk Georgio Bolero##1346
|tip Inside the building.
Train Bolt of Mageweave |learn Bolt of Mageweave##3865 |goto Stormwind City 43.17,73.55
step
collect 500 Mageweave Cloth##4338 |or
|tip Farm them from level 38-50 humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 38-50 humanoid mobs. |only if selfmade
'|complete skill("Tailoring") >= 185 |or
step
Open Your Tailoring Crafting Panel:
_<Create 100 Bolts of Mageweave>_
|tip Save these, you will need them later.
collect 100 Bolt of Mageweave##4339 |or
'|complete skill("Tailoring") >= 186 |or
step
Open Your Tailoring Crafting Panel:
_<Create Bolts of Mageweave>_
|tip Save 100 of these, you will need them later.
Reach Skill 185 in Tailoring |skill Tailoring,185
step
Enter the building |goto Stormwind City 44.54,73.90 < 5 |walk
talk Georgio Bolero##1346
|tip Inside the building.
Train Crimson Silk Vest |learn Crimson Silk Vest##8791 |goto Stormwind City 43.17,73.55
step
collect 80 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 205 |or
step
talk Alexandra Bolero##1347
|tip Inside the building.
buy 40 Fine Thread##2321 |goto Stormwind City 43.26,74.08 |or 2
buy 40 Red Dye##2604 |goto Stormwind City 43.26,74.08 |or 2
'|complete skill("Tailoring") >= 205 |or
step
Open Your Tailoring Crafting Panel:
_<Create 20 Crimson Silk Vests>_
Reach Skill 205 in Tailoring |skill Tailoring,205
step
Reach Level 35 |ding 35
|tip You must be at least level 35 to train Artisan professions.
|tip Use the leveling guides to accomplish this.
step
Enter the building |goto Dustwallow Marsh 66.12,51.55 < 5 |walk
talk Timothy Worthington##11052
|tip Upstairs inside the building.
|tip You must be at least level 40 to train artisan skills.
|tip Use the leveling guides to accomplish this.
Train Artisan Tailoring |skillmax Tailoring,300 |goto Dustwallow Marsh 66.18,51.81
step
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Crimson Silk Pantaloons |learn Crimson Silk Pantaloons##8799 |goto Dustwallow Marsh 66.18,51.81
step
collect 40 Bolt of Silk Cloth##4305 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 215 |or
step
talk Helenia Olden##4897
|tip Inside the building.
buy 30 Red Dye##2604 |goto Dustwallow Marsh 66.44,51.46 |or 2
buy 30 Silken Thread##4291 |goto Dustwallow Marsh 66.44,51.46 |or 2
'|complete skill("Tailoring") >= 215 |or
step
Open Your Tailoring Crafting Panel:
_<Create 15 Crimson Silk Pantaloons>_
Reach Skill 215 in Tailoring |skill Tailoring,215
step
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Orange Mageweave Shirt |learn Orange Mageweave Shirt##12061 |goto Dustwallow Marsh 66.18,51.81
step
collect 5 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 220 |or
step
talk Vizzklick##6568
buy 5 Orange Dye##6261 |goto Tanaris 51.01,27.36 |or 2
buy 5 Heavy Silken Thread##8343 |goto Tanaris 51.01,27.36 |or 2
'|complete skill("Tailoring") >= 220 |or
step
Open Your Tailoring Crafting Panel:
_<Create 5 Orange Mageweave Shirts>_
Reach Skill 220 in Tailoring |skill Tailoring,220
step
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Black Mageweave Gloves |learn Black Mageweave Gloves##12053 |goto Dustwallow Marsh 66.18,51.81
step
collect 20 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 230 |or
step
talk Helenia Olden##4897
|tip Inside the building.
buy 20 Heavy Silken Thread##8343 |goto Dustwallow Marsh 66.44,51.46 |or
'|complete skill("Tailoring") >= 230 |or
step
Open Your Tailoring Crafting Panel:
_<Create 10 Black Mageweave Gloves>_
Reach Skill 230 in Tailoring |skill Tailoring,230
step
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Black Mageweave Headband |learn Black Mageweave Headband##12072 |goto Dustwallow Marsh 66.18,51.81
step
collect 75 Bolt of Mageweave##4339 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 250 |or
step
talk Helenia Olden##4897
|tip Inside the building.
buy 50 Heavy Silken Thread##8343 |goto Dustwallow Marsh 66.44,51.46 |or
'|complete skill("Tailoring") >= 250 |or
step
Open Your Tailoring Crafting Panel:
_<Create 25 Black Mageweave Headbands>_
|tip You may need to create a few more or less of these.
|tip Each additional Black Mageweave Headband requires 3 Bolts of Mageweave and 2 Heavy Silken Thread.
Reach Skill 250 in Tailoring |skill Tailoring,250
step
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Bolt of Runecloth |learn Bolt of Runecloth##18401 |goto Dustwallow Marsh 66.18,51.81
step
collect 1235 Runecloth##14047 |or
|tip Farm them from level 50+ humanoid mobs or purchase them from the auction house. |only if not selfmade
|tip Farm them from level 50+ humanoid mobs. |only if selfmade
'|complete skill("Tailoring") >= 260 |or
step
Open Your Tailoring Crafting Panel:
_<Create 247 Bolts of Runecloth>_
|tip Save these, you will need them later.
collect 247 Bolt of Runecloth##14048 |or
'|complete skill("Tailoring") >= 261 |or
step
Open Your Tailoring Crafting Panel:
_<Create Bolts of Runecloth>_
|tip Save 247 of these, you will need them later.
Reach Skill 260 in Tailoring |skill Tailoring,260
step
Enter the building |goto Dustwallow Marsh 66.12,51.55 < 5 |walk
talk Timothy Worthington##11052
|tip Upstairs inside the building.
Train Runecloth Belt |learn Runecloth Belt##18402 |goto Dustwallow Marsh 66.18,51.81
step
collect 75 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 280 |or
step
talk Vizzklick##6568
buy 63 Rune Thread##14341 |goto Tanaris 51.01,27.36 |or
|tip Save these, you will need them later.
'|complete skill("Tailoring") >= 280 |or
step
Open Your Tailoring Crafting Panel:
_<Create 25 Runecloth Belts>_
|tip You may need to create a few more or less of these.
|tip Each additional Runecloth Belt requires 3 Bolts of Runecloth and 1 Rune Thread.
Reach Skill 280 in Tailoring |skill Tailoring,280
step
Enter the building |goto Winterspring 61.33,37.35 < 5 |walk
talk Qia##11189
|tip Inside the building.
buy Pattern: Runecloth Bag##14468 |goto Winterspring 61.20,37.21 |or 2
buy Pattern: Runecloth Gloves##14481 |goto Winterspring 61.20,37.21 |or 2
|tip These are limited supply items that can also be purchased from the auction house. |only if not selfmade
|tip These are limited supply items. |only if selfmade
Click Here After Purchasing Pattern: Runecloth Bag |confirm |or 2
|tip Click if the Pattern: Runecloth Gloves is not available.
'|complete skill("Tailoring") >= 300 or knowsrecipe(18405) |or
step
use the Pattern: Runecloth Bag##14468
Learn Runecloth Bag |learn Runecloth Bag##18405
stickystart "Collect_Rugged_Leather_290"
step
collect 90 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 290 |or
step
label "Collect_Rugged_Leather_290"
collect 36 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Tailoring") >= 290 |or
step
talk Elynna##4168
|tip Inside the building.
buy 18 Rune Thread##14341 |goto Darnassus 64.20,21.40 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 290 |or
step
Open Your Tailoring Crafting Panel:
_<Create 18 Runecloth Bags>_
|tip You may need to create a few more or less of these.
|tip Each additional Runecloth Bag requires 5 Bolts of Runecloth, 2 Rugged Leather, and 1 Rune Thread.
Reach Skill 290 in Tailoring |skill Tailoring,290
step
Enter the building |goto Winterspring 61.33,37.35 < 5 |walk
talk Qia##11189
|tip Inside the building.
buy Pattern: Runecloth Gloves##14481 |goto Winterspring 61.20,37.21 |or
|tip This is a limited supply item that can also be purchased from the auction house. |only if not selfmade
|tip This is a limited supply item. |only if selfmade
'|complete skill("Tailoring") >= 300 or knowsrecipe(18417) |or
step
use the Pattern: Runecloth Gloves##14481
Learn Runecloth Gloves |learn Runecloth Gloves##18417
stickystart "Collect_Rugged_Leather_300"
step
collect 80 Bolt of Runecloth##14048 |or
|tip You created these in a previous step.
'|complete skill("Tailoring") >= 300 |or
step
label "Collect_Rugged_Leather_300"
collect 74 Rugged Leather##8170 |or
|tip Farm them with Skinning or purchase them from the auction house. |only if not selfmade
|tip Farm them with Skinning. |only if selfmade
'|complete skill("Tailoring") >= 300 |or
step
talk Elynna##4168
|tip Inside the building.
buy 18 Rune Thread##14341 |goto Darnassus 64.20,21.40 |or
|tip You purchased these in a previous step.
'|complete skill("Tailoring") >= 300 |or
step
Open Your Tailoring Crafting Panel:
_<Create 20 Runecloth Gloves>_
|tip You may need to create a few more or less of these.
|tip Each additional Runecloth Glove requires 4 Bolts of Runecloth, 4 Rugged Leather, and 1 Rune Thread.
Reach Skill 300 in Tailoring |skill Tailoring,300
step
_Congratulations!_
You Reached Skill 300 in Tailoring.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Linen Cloth",{
hardcore = true,
},[[
step
Kill enemies around this area
|tip Be sure to enter the mine as well.
collect Linen Cloth##2589 |n |goto Westfall 44.55,25.01
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Wool Cloth",{
hardcore = true,
},[[
step
Follow the road up |goto Redridge Mountains 35.71,43.17 < 15 |only if walking
Continue following the road |goto Redridge Mountains 47.06,30.39 < 15 |only if walking
Follow the path up |goto Redridge Mountains 40.87,15.00 < 10 |only if walking
Kill Blackrock enemies around this area
collect Wool Cloth##2592 |n |goto Redridge Mountains 36.22,9.93
You can find more inside the cave at [33.21,6.91]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Silk Cloth",{
hardcore = true,
},[[
step
Kill Galak enemies around this area
|tip You can find more inside the cave.
collect Silk Cloth##4306 |n |goto Thousand Needles 44.01,37.41
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Mageweave Cloth",{
hardcore = true,
},[[
step
Kill Dunemaul enemies around this area
collect Mageweave Cloth##4338 |n |goto Tanaris 40.50,55.50
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Runecloth",{
hardcore = true,
},[[
step
Kill Blackrock enemies around this area
|tip You can find more inside the building.
collect Runecloth###14047 |n |goto Burning Steppes 42.17,35.64
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Felcloth",{
hardcore = true,
},[[
step
Kill Jadefire enemies around this area
collect Felcloth##14256 |n |goto Felwood 37.17,67.00
You can find more around [32.71,66.66]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Mooncloth",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Spider's Silk",{
hardcore = true,
},[[
step
Enter the cave |goto Wetlands 52.79,62.90 < 20 |walk
Kill enemies around this area
|tip Inside the cave.
collect Spider's Silk##3182 |n |goto Wetlands 48.51,60.67
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Thick Spider's Silk",{
hardcore = true,
},[[
step
Follow the path up |goto Eastern Plaguelands 77.56,47.20 < 10 |only if walking
Kill Crypt enemies around this area
|tip You can find more inside the nearby crypt buildings.
collect Thick Spider's Silk##4337 |n |goto Eastern Plaguelands 83.60,42.07
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Shadow Silk",{
hardcore = true,
},[[
step
kill Deathstrike Tarantula##769+
collect Shadow Silk##10285 |n |goto Swamp of Sorrows 58.74,62.39
|tip These have a low drop rate.
You can find more around [66.70,68.65]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Tailoring\\Farming Guides\\Ironweb Spider Silk",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Righteous Orb",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Demonic Rune",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Dark Rune",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Sharp Claw",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Ogre Tannin",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Small Venom Sac",{
hardcore = true,
},[[
step
map Redridge Mountains
path follow smart; loop on; ants curved; dist 20
path	51.04,41.76	53.70,43.86	53.45,46.07	55.68,47.30	57.57,44.98
path	55.62,41.71	53.83,37.42	51.30,38.07
Kill tarantula enemies around this area
collect Small Venom Sac##1475 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Huge Venom Sac",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Iridescent Pearl",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Black Pearl",{
hardcore = true,
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
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Golden Pearl",{
hardcore = true,
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
collect Golden Pearl##13926 |n
|tip These have a low drop rate.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Giant Egg",{
hardcore = true,
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
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Dropped\\Farming Guides\\Zesty Clam Meat",{
hardcore = true,
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
collect Zesty Clam Meat##7974 |n
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline",{
condition_suggested=function() return skill('Blacksmithing') >= 200 end,
description="This guide will walk you through completing the Armorsmith questline for the Blacksmithing profession.",
hardcore = true,
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 245 Blacksmithing |skill Blacksmithing,245
|tip You must be at least this level with your Blacksmithing profession before you can create some of the item needed in this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
talk Grumnus Steelshaper##5164
accept The Art of the Armorsmith##5283 |goto Ironforge 49.97,42.81
step
talk Bengus Deepforge##4258
learn Heavy Grinding Stone##3337 |goto Ironforge 52.53,41.47
learn Golden Scale Bracers##7223 |goto Ironforge 52.53,41.47
learn Solid Grinding Stone##9920 |goto Ironforge 52.53,41.47
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 30 Steel Bar##3859 |q 2758 |future
collect 36 Heavy Stone##2838 |q 2758 |future
step
Open Your Blacksmithing Crafting Panel:
_<Create 12 Heavy Grinding Stones>_
collect 12 Heavy Grinding Stone##3486 |q 2758 |future
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 6 Golden Scale Bracers>_
collect 6 Golden Scale Bracers##6040 |goto Ironforge 49.83,44.12 |q 2758 |future
step
talk Hank the Hammer##7798
accept The Origins of Smithing##2758 |goto Stormwind City 56.00,15.41
step
talk Hank the Hammer##7798
turnin The Origins of Smithing##2758 |goto Stormwind City 56.00,15.41
accept In Search of Galvan##2759 |goto Stormwind City 56.00,15.41
step
use the Plans: Golden Scale Gauntlets##9367
learn Golden Scale Gauntlets##11643
step
Run up the ramp |goto Stranglethorn Vale 27.85,76.75 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.40,75.77 < 7 |only if walking
talk McGavan##7794
turnin In Search of Galvan##2759 |goto Stranglethorn Vale 28.87,75.42
accept The Mithril Order##2760 |goto Stranglethorn Vale 28.87,75.42
step
Enter the building |goto Stranglethorn Vale 28.95,75.34 < 5 |walk
talk Brikk Keencraft##2836
|tip Inside the building.
learn Heavy Mithril Breastplate##9959 |goto Stranglethorn Vale 28.99,75.55
learn Mithril Coif##9961 |goto Stranglethorn Vale 28.99,75.55
learn Heavy Mithril Boots##9968 |goto Stranglethorn Vale 28.99,75.55
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 40 Iron Bar##3575 |q 2761 |future
collect 120 Mithril Bar##3860 |q 2763 |future
collect 5 Truesilver Bar##6037 |q 2762 |future
collect 4 Citrine##3864 |q 2763 |future
step
Enter the tunnel |goto Stranglethorn Vale 27.95,73.61 < 10 |only if walking
Leave the tunnel |goto Stranglethorn Vale 29.59,72.46 < 10 |only if walking
Follow the road |goto Stranglethorn Vale 30.96,71.70 < 30 |only if walking
Continue following the road |goto Stranglethorn Vale 33.46,55.53 < 30 |only if walking
Continue following the road |goto Stranglethorn Vale 36.15,48.91 < 30 |only if walking
Follow the path |goto Stranglethorn Vale 44.00,26.14 < 30 |only if walking
Follow the path up |goto Stranglethorn Vale 47.03,22.84 < 15 |only if walking
talk Galvan the Ancient##7802
turnin The Mithril Order##2760 |goto Stranglethorn Vale 50.62,20.48
accept Smelt On, Smelt Off##2761 |goto Stranglethorn Vale 50.62,20.48
accept The Great Silver Deceiver##2762 |goto Stranglethorn Vale 50.62,20.48
accept The Art of the Imbue##2763 |goto Stranglethorn Vale 50.62,20.48
step
talk Galvan the Ancient##7802
turnin Smelt On, Smelt Off##2761 |goto Stranglethorn Vale 50.62,20.48
turnin The Great Silver Deceiver##2762 |goto Stranglethorn Vale 50.62,20.48
turnin The Art of the Imbue##2763 |goto Stranglethorn Vale 50.62,20.48
accept Expert Blacksmith!##2765 |goto Stranglethorn Vale 50.62,20.48
step
Watch the dialogue
Watch Galvan Work |q 2765/1 |goto Stranglethorn Vale 50.57,20.37
step
talk Galvan the Ancient##7802
turnin Expert Blacksmith!##2765 |goto Stranglethorn Vale 50.57,20.37
accept Galvan's Finest Pupil##2764 |goto Stranglethorn Vale 50.57,20.37
step
use the Plans: Ornate Mithril Pants##7983
learn Ornate Mithril Pants##9945
step
use the Plans: Ornate Mithril Gloves##7984
learn Ornate Mithril Gloves##9950
step
use the Plans: Ornate Mithril Shoulder##7985
learn Ornate Mithril Shoulders##9952
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 114 Mithril Bar##3860 |q 2773 |future
collect 3 Truesilver Bar##6037 |q 2773 |future
collect Aquamarine##7909 |q 2772 |future
collect 8 Solid Stone##7912 |q 2773 |future
collect 14 Thick Leather##4304 |q 2772 |future
|tip If you have the Skinning profession, you can gather this.
collect 18 Mageweave Cloth##4338 |q 2773 |future
step
talk Trenton Lighthammer##7804
turnin Galvan's Finest Pupil##2764 |goto Tanaris 51.42,28.75
accept A Good Head On Your Shoulders##2771 |goto Tanaris 51.42,28.75
accept The World At Your Feet##2772 |goto Tanaris 51.42,28.75
accept The Mithril Kid##2773 |goto Tanaris 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
_<Create 2 Solid Grinding Stones>_
collect 2 Solid Grinding Stone##7966 |q 2773
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Mithril Coifs>_
collect 2 Mithril Coif##7931 |q 2771/1 |goto Tanaris 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Ornate Mithril Shoulders>_
collect Mithril Coif##7931 |q 2771/2 |goto Tanaris 51.42,28.75
step
talk Trenton Lighthammer##7804
turnin A Good Head On Your Shoulders##2771 |goto Tanaris 51.42,28.75
learn Ornate Mithril Helm##9980 |goto Tanaris 51.42,28.75
|tip You will learn this automatically.
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Heavy Mithril Boots>_
collect 2 Heavy Mithril Boots##7933 |q 2772/1 |goto Tanaris 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Ornate Mithril Pants>_
collect Ornate Mithril Pants##7926 |q 2771/2 |goto Tanaris 51.42,28.75
step
talk Trenton Lighthammer##7804
turnin The World At Your Feet##2772 |goto Tanaris 51.42,28.75
learn Ornate Mithril Boots##9979 |goto Tanaris 51.42,28.75
|tip You will learn this automatically.
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Heavy Mithril Breastplate>_
collect 2 Heavy Mithril Breastplate##7930 |q 2773/1 |goto Tanaris 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Ornate Mithril Gloves>_
collect Ornate Mithril Gloves##7927 |q 2773/2 |goto Tanaris 51.42,28.75
step
talk Trenton Lighthammer##7804
turnin The Mithril Kid##2773 |goto Tanaris 51.42,28.75
learn Ornate Mithril Breastplate##9972 |goto Tanaris 51.42,28.75
|tip You will learn this automatically.
step
talk Trenton Lighthammer##7804
accept Did You Lose This?##3321 |goto Tanaris 51.42,28.75
step
Watch the dialogue
Watch Trenton Work |q 3321/1 |goto Tanaris 51.42,28.76
step
talk Trenton Lighthammer##7804
turnin Did You Lose This?##3321 |goto Tanaris 51.42,28.76
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather most these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 108 Mithril Bar##3860 |q 5283
collect 18 Truesilver Bar##6037 |q 5283
collect 2 Aquamarine##7909 |q 5283
collect 28 Solid Stone##7912 |q 5283
collect 4 Black Pearl##7971 |q 5283
collect Heart of Fire##7077 |q 5283
collect 8 Thick Leather##4304 |q 5283
|tip If you have the Skinning profession, you can gather this.
step
Open Your Blacksmithing Crafting Panel:
_<Create 7 Solid Grinding Stones>_
collect 7 Solid Grinding Stone##7966 |q 5283
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 4 Ornate Mithril Helms>_
collect 4 Ornate Mithril Helm##7937 |q 5283/1 |goto Ironforge 49.83,44.12
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Ornate Mithril Boots>_
collect 2 Ornate Mithril Boots##7936 |q 5283/2 |goto Ironforge 49.83,44.12
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Ornate Mithril Breastplate>_
collect Ornate Mithril Breastplate##7935 |q 5283/3 |goto Ironforge 49.83,44.12
step
talk Grumnus Steelshaper##5164
turnin The Art of the Armorsmith##5283 |goto Ironforge 49.98,42.82
learn Armorsmith##9788 |goto Ironforge 49.98,42.82
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become a Blacksmithing Armorsmith.
Learn Plans From Grumnus Steelshaper at [Ironforge 49.98,42.82]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline",{
condition_suggested=function() return skill('Blacksmithing') >= 200 end,
description="This guide will walk you through completing the Weaponsmith questline for the Blacksmithing profession.",
hardcore = true,
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 230 Blacksmithing |skill Blacksmithing,230
|tip You must be at least this level with your Blacksmithing profession before you can create some of the item needed in this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
talk Ironus Coldsteel##11146
accept The Way of the Weaponsmith##5284 |goto Ironforge 50.33,43.55
step
Run up the ramp |goto Stranglethorn Vale 27.85,76.75 < 7 |only if walking
Follow the path |goto Stranglethorn Vale 28.40,75.77 < 7 |only if walking
Enter the building |goto Stranglethorn Vale 28.95,75.34 < 5 |walk
talk Brikk Keencraft##2836
|tip Inside the building.
learn Heavy Grinding Stone##3337 |goto Stranglethorn Vale 28.99,75.55
learn Solid Grinding Stone##9920 |goto Stranglethorn Vale 28.99,75.55
learn Heavy Mithril Axe##9993 |goto Stranglethorn Vale 28.99,75.55
learn Big Black Mace##10001 |goto Stranglethorn Vale 28.99,75.55
step
Leave the building |goto Stranglethorn Vale 44.39,93.07 < 5 |walk
Jump down and enter the building |goto Stranglethorn Vale 44.31,93.11 < 5 |walk
talk Zarena Cromwind##2482
|tip Inside the building.
buy Plans: Moonsteel Broadsword##12163 |n
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House. |only if not selfmade
use the Plans: Moonsteel Broadsword##12163
learn Moonsteel Broadsword##3496 |goto Stranglethorn Vale 44.28,93.09
step
Run up the ramp |goto Stranglethorn Vale 44.02,92.76 < 7 |only if walking
Enter the tunnel |goto Stranglethorn Vale 27.95,73.61 < 10 |only if walking
Leave the tunnel |goto Stranglethorn Vale 29.59,72.46 < 10 |only if walking
Follow the road |goto Stranglethorn Vale 30.96,71.70 < 30 |only if walking
Continue following the road |goto Stranglethorn Vale 33.46,55.53 < 30 |only if walking
Continue following the road |goto Stranglethorn Vale 36.15,48.91 < 30 |only if walking
Continue following the road |goto Stranglethorn Vale 43.93,28.59 < 30 |only if walking
Follow the path down |goto Stranglethorn Vale 35.20,14.73 < 30 |only if walking
talk Jaquilina Dramet##2483
buy Plans: Massive Iron Axe##12164 |n
|tip This is a limited supply item.
|tip If she doesn't have it for sale, check the Auction House. |only if not selfmade
use the Plans: Massive Iron Axe##12164
learn Massive Iron Axe##3498 |goto Stranglethorn Vale 35.75,10.66
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 32 Steel Bar##3859 |q 5284
collect 56 Mithril Bar##3860 |q 5284
collect 56 Iron Bar##3575 |q 5284
collect 16 Gold Bar##3577 |q 5284
collect 48 Heavy Stone##2838 |q 5284
collect 16 Solid Stone##7912 |q 5284
collect 4 Citrine##3864 |q 5284
collect 2 Black Pearl##7971 |q 5284
collect 8 Shadowgem##1210 |q 5284
collect 12 Lesser Moonstone##1705 |q 5284
collect 28 Heavy Leather##4234 |q 5284
|tip If you have the Skinning profession, you can gather this.
collect 4 Thick Leather##4304 |q 5284
|tip If you have the Skinning profession, you can gather this.
step
talk Thurgrum Deepforge##4259
buy 16 Strong Flux##3466 |goto Ironforge 51.72,42.80 |q 5284
step
Open Your Blacksmithing Crafting Panel:
_<Create 4 Solid Grinding Stones>_
collect 4 Solid Grinding Stone##7966 |q 5284
step
Open Your Blacksmithing Crafting Panel:
_<Create 16 Heavy Grinding Stones>_
collect 16 Heavy Grinding Stone##3486 |q 5284
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 4 Moonsteel Broadswords>_
collect 4 Moonsteel Broadsword##3853 |q 5284/1 |goto Ironforge 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 4 Massive Iron Axes>_
collect 4 Massive Iron Axe##3855 |q 5284/2 |goto Ironforge 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Heavy Mithril Axes>_
collect 2 Heavy Mithril Axe##7941 |q 5284/3 |goto Ironforge 51.42,28.75
step
Open Your Blacksmithing Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Big Black Maces>_
collect 2 Big Black Mace##7945 |q 5284/4 |goto Ironforge 51.42,28.75
step
talk Ironus Coldsteel##11146
turnin The Way of the Weaponsmith##5284 |goto Ironforge 50.33,43.55
learn Weaponsmith##9787 |goto Ironforge 50.33,43.55
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become a Blacksmithing Weaponsmith.
Learn Plans From Ironus Coldsteel at [Ironforge 50.33,43.55]
|tip You can continue your specialization by choosing from 3 paths:
|tip Master Axesmith
|tip Master Hammersmith
|tip Master Swordsmith
|tip Search the guide menu for the title above to find the questline guide associated with it.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline",{
description="This guide will walk you through completing the Master Axesmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
hardcore = true,
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Kilram##11192
|tip Inside the building.
accept Snakestone of the Shadow Huntress##5306 |goto Winterspring 61.30,37.07
step
kill Shadow Hunter Vosh'gajin##9236
|tip She is a boss inside the Lower Blackrock Spire dungeon.
|tip Use the "Lower Blackrock Spire" dungeon guide to accomplish this.
collect Vosh'gajin's Snakestone##13352 |q 5306/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Kilram##11192
|tip Inside the building.
turnin Snakestone of the Shadow Huntress##5306 |goto Winterspring 61.30,37.07
step
talk Kilram##11192
|tip Inside the building.
Select _"Please teach me how to become an axesmith, Kilram."_
learn Master Axesmith##17041 |goto Winterspring 61.30,37.07
step
Reach Level 275 Blacksmithing |skill Blacksmithing,275
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Dawn's Edge##12821
learn Dawn's Edge##16970
step
_Congratulations!_
|tip You have become a Master Axesmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline",{
description="This guide will walk you through completing the Master Hammersmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
hardcore = true,
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Lilith the Lithe##11191
|tip Inside the building.
accept Sweet Serenity##5305 |goto Winterspring 61.33,37.13
step
kill Crimson Hammersmith##11120
|tip He is a boss inside the Main Gate section of the Stratholme dungeon.
|tip Use the "Stratholme" dungeon guide to accomplish this.
collect Crimson Hammersmith's Apron##13351 |q 5305/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Lilith the Lithe##11191
|tip Inside the building.
turnin Sweet Serenity##5305 |goto Winterspring 61.33,37.13
step
talk Lilith the Lithe##11191
|tip Inside the building.
Select _"Please teach me how to become a hammersmith, Lilith."_
learn Master Hammersmith##17040 |goto Winterspring 61.33,37.13
step
Reach Level 280 Blacksmithing |skill Blacksmithing,280
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Enchanted Battlehammer##12824
learn Enchanted Battlehammer##16973
step
_Congratulations!_
|tip You have become a Master Hammersmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline",{
description="This guide will walk you through completing the Master Swordsmith questline to continue Weaponsmith specialization for the Blacksmithing profession.",
hardcore = true,
},[[
step
_NOTE ABOUT BLACKSMITHING SPECIALIZATION:_
|tip You can only have one Blacksmithing specialization.
|tip Additionally, you cannot change your specialization without unlearning the Blacksmithing profession, and leveling it up again.
|tip We recommend looking into the different options for Armorsmith and Weaponsmith Blacksmithing before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip Most of the items you can create with the specializations are BoE, so you could also buy them from the AH or other players, but some of them are BoP and you would need to craft them to use them.
|tip If you change specializations, you will still be able to use the items you create.
Click Here to Continue |confirm
step
learn Weaponsmith##9787
|tip You must become a Weaponsmith before you can begin this questline.
|tip Use the "Weaponsmith Questline" guide to accomplish this.
step
Reach Level 50 |ding 50
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 250 Blacksmithing |skill Blacksmithing,250
|tip You must be at least this level with your Blacksmithing profession before you can begin this questline.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Seril Scourgebane##11193
|tip Inside the building.
accept Corruption##5307 |goto Winterspring 61.33,37.19
step
kill Black Guard Swordsmith##11121
|tip He is a boss inside the Service Gate section of the Stratholme dungeon.
|tip Use the "Stratholme" dungeon guide to accomplish this.
collect Insignia of the Black Guard##13350 |q 5307/1
step
Follow the path |goto Winterspring 60.56,38.20 < 7 |only if walking
Enter the building |goto Winterspring 61.33,37.36 < 7 |walk
talk Seril Scourgebane##11193
|tip Inside the building.
turnin Corruption##5307 |goto Winterspring 61.33,37.19
step
talk Seril Scourgebane##11193
|tip Inside the building.
Select _"Please teach me how to become a swordsmith, Seril."_
learn Master Swordsmith##17039 |goto Winterspring 61.33,37.19
step
Reach Level 280 Blacksmithing |skill Blacksmithing,280
|tip You must be at least this level with your Blacksmithing profession before you can learn the plans in the next step.
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
step
use the Plans: Blazing Rapier##12825
learn Blazing Rapier##16978
step
_Congratulations!_
|tip You have become a Master Swordsmith.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Blacksmithing\\Specialization\\How to Change Blacksmithing Specialization",{
description="This guide will walk you through changing your Blacksmithing profession specialization.",
hardcore = true,
},[[
step
_NOTE:_
|tip You MUST fully complete the questline for either Armorsmith or Weaponsmith before you can switch specializations.
Click Here to Continue |confirm
step
Unlearn Blacksmithing |complete skill("Blacksmithing") == 0
|tip Press "K" to open your Skills tab.
|tip You must completely unlearn the Blacksmithing profession to be able to switch your specialization.
step
Reach Level 40 |ding 40
|tip Use the Leveling guides to accomplish this.
|tip You must be at least level 30 to be able to start the questlines to choose an Blacksmithing specialization.
step
Reach Level 200 Blacksmithing |complete skill("Blacksmithing") >= 200
|tip Use the "Blacksmithing (1-300)" guide to accomplish this.
|tip You must be at least level 200 Blacksmithing to be able to start the questlines to choose an Blacksmithing specialization.
step
Follow the path |goto Tanaris 64.90,22.54 < 30 |only if walking
Enter the building |goto Tanaris 65.41,18.56 < 7 |walk
click Book "Soothsaying for Dummies"
|tip Inside the building.
|tip Choose the dialogue option that matches what you want to do.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline",{
condition_suggested=function() return skill('Engineering') >= 200 end,
description="This guide will walk you through completing the Gnomish Engineering questline for the Engineering profession.",
hardcore = true,
},[[
step
_NOTE ABOUT GNOMISH ENGINEERING:_
|tip You cannot specialize in both Gnomish and Goblin Engineering.
|tip Additionally, you cannot change your specialization without unlearning the Engineering profession, and leveling it up again.
|tip We recommend looking into the differences between Gnomish and Goblin Engineering before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip You can create some of the most desirable Bind On Pickup trinkets for a specialization, unlearn Engineering to level it up again to learn the other specialization.
|tip If you change specializations, you will still be able to use the items you create, unless they specifically require Gnomish Engineering to use it.
Click Here to Continue |confirm
step
Reach Level 30 |ding 30
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 200 Engineering |skill Engineering,200
|tip You must be at least level 200 with your Engineering profession before you can begin this questline.
|tip Use the "Engineering (1-300)" guide to accomplish this.
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
accept Gnome Engineering##3632 |goto Ironforge 68.46,43.56
step
talk Tinkmaster Overspark##7944
turnin Gnome Engineering##3632 |goto Ironforge 69.56,50.31
accept The Pledge of Secrecy##3640 |goto Ironforge 69.56,50.31
step
use Overspark's Pledge of Secrecy##10793
collect Overspark's Signed Pledge##11283 |q 3640/1
step
talk Tinkmaster Overspark##7944
turnin The Pledge of Secrecy##3640 |goto Ironforge 69.56,50.31
accept Show Your Work##3641 |goto Ironforge 69.56,50.31
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
learn Bronze Framework##3953 |goto Ironforge 68.47,43.56
learn Gold Power Core##12584 |goto Ironforge 68.47,43.56
learn Iron Strut##3958 |goto Ironforge 68.47,43.56
learn Gyrochronatom##3961 |goto Ironforge 68.47,43.56
learn Advanced Target Dummy##3965 |goto Ironforge 68.47,43.56
step
talk Gearcutter Cogspinner##5175
|tip Inside the building.
buy Weak Flux##2880 |goto Ironforge 67.85,42.51
step
Enter the building |goto Stranglethorn Vale 28.11,74.99 < 7 |walk
talk Mazk Snipeshot##2685
|tip Inside the building.
buy Schematic: Accurate Scope##13310
|tip This is a limited supply item.
|tip If he doesn't have it for sale, check the Auction House. |only if not selfmade
use the Schematic: Accurate Scope##13310
learn Accurate Scope##3979 |goto Stranglethorn Vale 28.50,75.12
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 18 Mithril Bar##3860 |q 3641
collect 6 Bronze Bar##2841 |q 3641
collect Jade##1529 |q 3641
collect Citrine##3864 |q 3641
collect 6 Iron Bar##3575 |q 3641
collect Gold Bar##3577 |q 3641
collect 2 Medium Leather##2319 |q 3641
|tip If you have the Skinning profession, you can gather this.
collect 8 Heavy Leather##4234 |q 3641
|tip If you have the Skinning profession, you can gather this.
collect 2 Wool Cloth##2592 |q 3641
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 6 Mithril Tubes>_
collect 6 Mithril Tube##10559 |q 3641/1 |goto Ironforge 49.83,44.12
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Bronze Tube>_
collect Bronze Tube##4371 |goto Ironforge 49.83,44.12 |q 3641
step
Open Your Engineering Crafting Panel:
_<Create 1 Accurate Scope>_
collect Accurate Scope##4407 |q 3641/2
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Iron Struts>_
collect 2 Iron Strut##4387 |goto Ironforge 49.83,44.12 |q 3641
step
Open Your Engineering Crafting Panel:
_<Create 2 Bronze Frameworks>_
collect 2 Bronze Framework##4382 |q 3641
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 1 Gold Power Core>_
|tip This schematic will give you 3 of these.
collect 2 Gold Power Core##10558 |goto Ironforge 49.83,44.12 |q 3641
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Gyrochronatoms>_
collect 2 Gyrochronatom##4389 |goto Ironforge 49.83,44.12 |q 3641
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 2 Advanced Target Dummies>_
collect 2 Advanced Target Dummy##4392 |q 3641/3 |goto Ironforge 49.83,44.12
step
talk Tinkmaster Overspark##7944
turnin Show Your Work##3641 |goto Ironforge 69.56,50.31
step
_Congratulations!_
|tip You have earned your Gnome Engineer Membership Card.
|tip This card allows you to learn Gnomish Engineering schematics from Tinkmaster Overspark.
|tip This item will last for 14 days of in-game play time.
|tip The time will not count down when you are logged out, so it will last a long time.
|tip You can only learn Gnomish Engineering schematics while you have this item in your bags.
|tip When the time runs out, you can renew the card, if you need to.
|tip Use the "Gnomish Engineering Card Renewal" guide to renew the card.
Learn Schematics From Tinkmaster Overspark at [Ironforge 69.56,50.31]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Gnomish Engineering\\Gnome Engineer Membership Card Renewal",{
description="This guide will walk you through renewing your Gnome Engineer Membership Card, as well as using the Gnome Engineer's Renewal Gifts to collect rare schematics.",
hardcore = true,
},[[
step
talk Tinkmaster Overspark##7944
accept Membership Card Renewal##3647 |goto Ironforge 69.56,50.33
|tip You must have the Gnomish Engineering specialization to be able to complete this quest.
|tip This quest requires 2 gold to complete.
|tip This will keep your Gnome Engineer Membership Card active for another 14 days of played time.
step
collect Gnome Engineer's Renewal Gift##11423 |n
|tip You will receive one of these in your mailbo 24 hours after renewing your membership card.
|tip You can destroy and renew your membership card repeatedly, if you want more of them to open.
|tip You don't need to wait for the card to expire on its own.
use the Gnome Engineer's Renewal Gift##11423
|tip These will contain some Engineer crafting supplies.
|tip The rare schematic for the "Lil' Smoky" pet also has a chance to be inside.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline",{
condition_suggested=function() return skill('Engineering') >= 200 end,
description="This guide will walk you through completing the Goblin Engineering questline for the Engineering profession.",
hardcore = true,
},[[
step
_NOTE ABOUT GOBLIN ENGINEERING:_
|tip You cannot specialize in both Gnomish and Goblin Engineering.
|tip Additionally, you cannot change your specialization without unlearning the Engineering profession, and leveling it up again.
|tip We recommend looking into the differences between Gnomish and Goblin Engineering before you choose which to pursue, depending on your personal play style and the specific items you want to create.
|tip You can create some of the most desirable Bind On Pickup trinkets for a specialization, unlearn Engineering to level it up again to learn the other specialization.
|tip If you change specializations, you will still be able to use the items you create, unless they specifically require Goblin Engineering to use it.
Click Here to Continue |confirm
step
Reach Level 30 |ding 30
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 200 Engineering |skill Engineering,200
|tip You must be at least level 200 with your Engineering profession before you can begin this questline.
|tip Use the "Engineering (1-300)" guide to accomplish this.
step
talk Springspindle Fizzlegear##5174
|tip Inside the building.
accept Goblin Engineering##4181 |goto Ironforge 68.46,43.56
step
Enter the building |goto Tanaris 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin Goblin Engineering##4181 |goto Tanaris 52.48,27.33
accept The Pledge of Secrecy##3638 |goto Tanaris 52.48,27.33
step
use Nixx's Pledge of Secrecy##10792
collect Nixx's Signed Pledge##11270 |q 3638/1
step
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin The Pledge of Secrecy##3638 |goto Tanaris 52.48,27.33
accept Show Your Work##3639 |goto Tanaris 52.48,27.33
step
_Collect These Items:_
|tip If you have the Mining profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 30 Iron Bar##3575 |q 3639
collect 40 Heavy Stone##2838 |q 3639
collect 2 Silver Bar##2842 |q 3639
collect 20 Solid Stone##7912 |q 3639
collect 10 Silk Cloth##4306 |q 3639
collect 20 Bronze Bar##2841 |q 3639
collect 5 Medium Leather##2319 |q 3639
|tip If you have the Skinning profession, you can gather this.
collect 20 Wool Cloth##2592 |q 3639
step
talk Buzzek Bracketswing##8736
learn Big Iron Bomb##3967 |goto Tanaris 52.34,27.72
learn Solid Dynamite##12586 |goto Tanaris 52.34,27.72
learn Explosive Sheep##3955 |goto Tanaris 52.34,27.72
learn Solid Blasting Powder##12585 |goto Tanaris 52.34,27.72
learn Bronze Framework##3953 |goto Tanaris 52.34,27.72
learn Heavy Blasting Powder##3945 |goto Tanaris 52.34,27.72
learn Whirring Bronze Gizmo##3942 |goto Tanaris 52.34,27.72
learn Silver Contact##3973 |goto Tanaris 52.34,27.72
step
Open Your Engineering Crafting Panel:
_<Create 40 Heavy Blasting Powder>_
collect 40 Heavy Blasting Powder##4377 |q 3639
step
Open Your Engineering Crafting Panel:
_<Create 2 Silver Contacts>_
|tip This schematic will give you 5 of these.
collect 10 Silver Contact##4404 |q 3639
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 10 Big Iron Bombs>_
|tip This schematic will give you 2 of these.
collect 20 Big Iron Bomb##4394 |q 3639/1 |goto Tanaris 51.40,28.72
step
Open Your Engineering Crafting Panel:
_<Create 10 Solid Blasting Powder>_
collect 10 Solid Blasting Powder##10505 |q 3639
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 10 Solid Dynamite>_
|tip This schematic will give you 2 of these.
collect 20 Solid Dynamite##10507 |q 3639/2 |goto Tanaris 51.40,28.72
step
Open Your Engineering Crafting Panel:
_<Create 5 Bronze Frameworks>_
collect 5 Bronze Framework##4382 |q 3639
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 5 Whirring Bronze Gizmos>_
collect 5 Whirring Bronze Gizmo##4375 |goto Tanaris 51.40,28.72 |q 3639
step
Open Your Engineering Crafting Panel:
|tip Stand next to the anvil.
_<Create 5 Explosive Sheep>_
collect 5 Explosive Sheep##4384 |q 3639/3 |goto Tanaris 51.40,28.72
step
Enter the building |goto Tanaris 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
turnin Show Your Work##3639 |goto Tanaris 52.48,27.33
step
_Congratulations!_
|tip You have earned your Goblin Engineer Membership Card.
|tip This card allows you to learn Goblin Engineering schematics from Nixx Sprocketspring.
|tip This item will last for 14 days of in-game play time.
|tip The time will not count down when you are logged out, so it will last a long time.
|tip You can only learn Goblin Engineering schematics while you have this item in your bags.
|tip When the time runs out, you can renew the card, if you need to.
|tip Use the "Goblin Engineering Card Renewal" guide to renew the card.
Learn Schematics From Nixx Sprocketspring at [Tanaris 52.48,27.33]
|tip Inside the building.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineer Membership Card Renewal",{
description="This guide will walk you through renewing your Goblin Engineer Membership Card, as well as using the Goblin Engineer's Renewal Gifts to collect rare schematics.",
hardcore = true,
},[[
step
Enter the building |goto Tanaris 52.39,27.30 < 5 |walk
talk Nixx Sprocketspring##8126
|tip Inside the building.
accept Membership Card Renewal##3644 |goto Tanaris 52.48,27.33
|tip You must have the Goblin Engineering specialization to be able to complete this quest.
|tip This quest requires 2 gold to complete.
|tip This will keep your Goblin Engineer Membership Card active for another 14 days of played time.
step
collect Goblin Engineer's Renewal Gift##11422 |n
|tip You will receive one of these in your mailbo 24 hours after renewing your membership card.
|tip You can destroy and renew your membership card repeatedly, if you want more of them to open.
|tip You don't need to wait for the card to expire on its own.
use the Goblin Engineer's Renewal Gift##11422
|tip These will contain some Engineer crafting supplies.
|tip The rare schematic for the "Pet Bombling" pet also has a chance to be inside.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Engineering\\Specialization\\How to Change Engineering Specialization",{
description="This guide will walk you through changing your Engineering profession specialization.",
hardcore = true,
},[[
step
_NOTE:_
|tip You MUST fully complete the questline for either Gnomish Engineering or Goblin engineering before you can switch specializations.
|tip You must have obtained either the Gnome Engineer Membership Card or Goblin Engineer Membership Card, or it won't let you switch.
Click Here to Continue |confirm
step
Unlearn Engineering |complete skill("Engineering") == 0
|tip Press "K" to open your Skills tab.
|tip You must completely unlearn the Engineering profession to be able to switch your specialization.
step
Reach Level 30 |ding 30
|tip Use the Leveling guides to accomplish this.
|tip You must be at least level 30 to be able to start the questlines to choose an Engineering specialization.
step
Reach Level 200 Engineering |complete skill("Engineering") >= 200
|tip Use the "Engineering (1-300)" guide to accomplish this.
|tip You must be at least level 200 Engineering to be able to start the questlines to choose an Engineering specialization.
step
Follow the path |goto Tanaris 64.90,22.54 < 30 |only if walking
Enter the building |goto Tanaris 65.41,18.56 < 7 |walk
click Book "Soothsaying for Dummies"
|tip Inside the building.
|tip Choose the dialogue option that matches what you want to do.
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline",{
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Dragonscale Leatherworking questline for the Leatherworking profession.",
hardcore = true,
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 225 Leatherworking |skill Leatherworking,225
|tip You must be at least this level with your Leatherworking profession before you can begin this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
stickystart "Learn_Tough_Scorpid_Gloves"
step
kill Wastewander Bandit##5618+
collect Pattern: Tough Scorpid Breastplate##8395 |n
|tip You can also purchase this from the Auction House, if you don't want to grind for it. |only if not selfmade
use the Pattern: Tough Scorpid Breastplate##8395
learn Tough Scorpid Breastplate##10525 |goto Tanaris 60.30,24.02
You can find more Wastewander Bandits around:
[Tanaris 63.62,31.49]
step
label "Learn_Tough_Scorpid_Gloves"
kill Wastewander Thief##5616+
collect Pattern: Tough Scorpid Gloves##8398 |n
|tip You can also purchase this from the Auction House, if you don't want to grind for it. |only if not selfmade
use the Pattern: Tough Scorpid Gloves##8398
learn Tough Scorpid Gloves##10542 |goto Tanaris 60.30,24.02
You can find more Wastewander Thieves around:
[Tanaris 63.62,31.49]
step
_Collect These Items:_
|tip If you have the Skinning profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 36 Thick Leather##4304 |q 5141 |future
collect 40 Scorpid Scale##8154 |q 5141 |future
collect 10 Worn Dragonscale##8165 |q 5141 |future
|tip These are skinned from Dragonkin enemies and bosses inside the Temple of Atal'Hakkar (Sunken Temple) dungeon.
step
Enter the building |goto Darkshore 37.77,41.35 < 10 |walk
talk Valdaron##4189
|tip Inside the building.
buy 12 Silken Thread##4291 |goto Darkshore 38.15,40.60 |q 5141 |future
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Tough Scorpid Gloves>_
collect 2 Tough Scorpid Gloves##8204 |q 5141 |future
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Tough Scorpid Breastplates>_
collect 2 Tough Scorpid Breastplate##8203 |q 5141 |future
step
Follow the road |goto Azshara 15.68,75.85 < 30 |only if walking
Follow the path |goto Azshara 27.65,59.62 < 30 |only if walking
Continue following the path |goto Azshara 33.85,62.14 < 30 |only if walking
Continue following the path |goto Azshara 35.14,65.45 < 30 |only if walking
talk Peter Galen##7866
accept Dragonscale Leatherworking##5141 |goto Azshara 37.59,65.42
step
talk Peter Galen##7866
turnin Dragonscale Leatherworking##5141 |goto Azshara 37.59,65.42
learn Dragonscale Leatherworking##10656 |goto Azshara 37.59,65.42
|tip You will learn this automatically.
step
_Congratulations!_
|tip You have become a Dragonscale Leatherworker.
Learn Patterns From Peter Galen at [Azshara 37.59,65.42]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline",{
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Elemental Leatherworking questline for the Leatherworking profession.",
hardcore = true,
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 225 Leatherworking |skill Leatherworking,225
|tip You must be at least this level with your Leatherworking profession before you can begin this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
step
_Collect These Items:_
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 2 Heart of Fire##7077 |q 5144 |future
collect 2 Globe of Water##7079 |q 5144 |future
collect 2 Core of Earth##7075 |q 5144 |future
collect 2 Breath of Wind##7081 |q 5144 |future
step
talk Sarah Tanner##7868
accept Elemental Leatherworking##5144 |goto Searing Gorge 63.56,75.97
step
talk Sarah Tanner##7868
turnin Elemental Leatherworking##5144 |goto Searing Gorge 63.56,75.97
step
_Congratulations!_
|tip You have become an Elemental Leatherworker.
Learn Patterns From Sarah Tanner at [Searing Gorge 63.56,75.97]
]])
ZygorGuidesViewer:RegisterGuide("Profession Guides\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline",{
condition_suggested=function() return skill('Leatherworking') >= 225 end,
description="This guide will walk you through completing the Tribal Leatherworking questline for the Leatherworking profession.",
hardcore = true,
},[[
step
_NOTE ABOUT LEATHERWORKING SPECIALIZATION:_
|tip You can only have one Leatherworking specialization.
|tip Additionally, you cannot change your specialization without unlearning the Leatherworking profession, and leveling it up again.
|tip We recommend looking into the different options for Dragonscale, Elemental, and Tribal Leatherworking before you choose which to pursue, depending on your personal play style and the specific items you want to create.
Click Here to Continue |confirm
step
Reach Level 40 |ding 40
|tip You must be at least this level before you can begin this questline.
|tip Use the Leveling guides to accomplish this.
step
Reach Level 235 Leatherworking |skill Leatherworking,235
|tip You must be at least this level with your Leatherworking profession before you can creature some of the patterns needed for this questline.
|tip Use the "Leatherworking (1-300)" guide to accomplish this.
step
Enter the building |goto The Hinterlands 14.17,45.22 < 20 |walk
Run down the stairs |goto The Hinterlands 13.18,43.43 < 5 |walk
talk Drakk Stonehand##11097
|tip Downstairs inside the building.
learn Cured Thick Hide##10482 |goto The Hinterlands 13.39,43.48
learn Thick Armor Kit##10487 |goto The Hinterlands 13.39,43.48
learn Nightscape Headband##10507 |goto The Hinterlands 13.39,43.48
learn Nightscape Tunic##10499 |goto The Hinterlands 13.39,43.48
learn Turtle Scale Bracers##10518 |goto The Hinterlands 13.39,43.48
learn Turtle Scale Breastplate##10511 |goto The Hinterlands 13.39,43.48
learn Turtle Scale Helm##10552 |goto The Hinterlands 13.39,43.48
learn Nightscape Boots##10558 |goto The Hinterlands 13.39,43.48
learn Nightscape Pants##10548 |goto The Hinterlands 13.39,43.48
step
_Collect These Items:_
|tip If you have the Skinning profession, you can gather these.
|tip Search the guide menu for the item(s) to use the farming guides.
|tip You can also purchase them from the Auction House. |only if not selfmade
collect 214 Thick Leather##4304 |q 2851 |future
collect 112 Turtle Scale##8167 |q 2852 |future
collect 11 Wildvine##8153 |q 5143 |future
|tip If you have the Herbalism profession, you can gather these.
collect 2 Cured Thick Hide##8172 |q 5143 |future
step
talk Pratt McGrubben##7852
buy Pattern: Turtle Scale Gloves##8385 |n
|tip This is a limited supply item.
|tip If he doesn't have it for sale, check the Auction House. |only if not selfmade
use the Pattern: Turtle Scale Gloves##8385
learn Turtle Scale Gloves##10509 |goto Feralas 30.63,42.71
step
talk Pratt McGrubben##7852
accept Wild Leather Armor##2847 |goto Feralas 30.63,42.71
step
talk Pratt McGrubben##7852
turnin Wild Leather Armor##2847 |goto Feralas 30.63,42.71
accept Wild Leather Shoulders##2848 |goto Feralas 30.63,42.71
accept Wild Leather Vest##2849 |goto Feralas 30.63,42.71
accept Wild Leather Helmet##2850 |goto Feralas 30.63,42.71
accept Wild Leather Boots##2851 |goto Feralas 30.63,42.71
accept Wild Leather Leggings##2852 |goto Feralas 30.63,42.71
step
talk Pratt McGrubben##7852
buy 22 Silken Thread##4291 |goto Feralas 30.63,42.71 |q 2852
buy 12 Heavy Silken Thread##8343 |goto Feralas 30.63,42.71 |q 2852
step
Open Your Leatherworking Crafting Panel:
_<Create 6 Thick Armor Kits>_
collect 6 Thick Armor Kit##8173 |q 2848/1
step
talk Pratt McGrubben##7852
turnin Wild Leather Shoulders##2848 |goto Feralas 30.63,42.71
step
use the Pattern: Wild Leather Shoulders##8403
learn Wild Leather Shoulders##10529
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Turtle Scale Breastplates>_
collect 2 Turtle Scale Breastplate##8189 |q 2849/1
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Turtle Scale Gloves>_
collect 2 Turtle Scale Gloves##8187 |q 2849/2
step
talk Pratt McGrubben##7852
turnin Wild Leather Vest##2849 |goto Feralas 30.63,42.71
step
use the Pattern: Wild Leather Vest##8404
learn Wild Leather Vest##10544
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Nightscape Tunics>_
collect 2 Nightscape Tunic##8175 |q 2850/1
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Nightscape Headbands>_
collect 2 Nightscape Headband##8176 |q 2850/2
step
talk Pratt McGrubben##7852
turnin Wild Leather Helmet##2850 |goto Feralas 30.63,42.71
step
use the Pattern: Wild Leather Helmet##8405
learn Wild Leather Helmet##10546
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Nightscape Pants>_
collect 2 Nightscape Pants##8193 |q 2851/1
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Nightscape Boots>_
collect 2 Nightscape Boots##8197 |q 2851/2
step
talk Pratt McGrubben##7852
turnin Wild Leather Boots##2851 |goto Feralas 30.63,42.71
step
use the Pattern: Wild Leather Boots##8406
learn Wild Leather Boots##10566
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Turtle Scale Helms>_
collect 2 Turtle Scale Helm##8191 |q 2852/1
step
Open Your Leatherworking Crafting Panel:
_<Create 2 Turtle Scale Bracers>_
collect 2 Turtle Scale Bracers##8198 |q 2852/2
step
talk Pratt McGrubben##7852
turnin Wild Leather Leggings##2852 |goto Feralas 30.63,42.71
step
use the Pattern: Wild Leather Leggings##8407
learn Wild Leather Leggings##10572
step
talk Pratt McGrubben##7852
accept Master of the Wild Leather##2853 |goto Feralas 30.63,42.71
step
talk Telonis##4212
|tip Upstairs inside the building.
turnin Master of the Wild Leather##2853 |goto Darnassus 64.43,21.54
step
use the Pattern: Wild Leather Cloak##8408
learn Wild Leather Cloak##10574
step
Open Your Leatherworking Crafting Panel:
_<Create 1 Wild Leather Vest>_
collect Wild Leather Vest##8211 |q 5143 |future
step
Open Your Leatherworking Crafting Panel:
_<Create 1 Wild Leather Helmet>_
collect Wild Leather Helmet##8214 |q 5143 |future
step
talk Caryssia Moonhunter##7870
accept Tribal Leatherworking##5143 |goto Feralas 89.42,46.55
step
talk Caryssia Moonhunter##7870
turnin Tribal Leatherworking##5143 |goto Feralas 89.42,46.55
step
_Congratulations!_
|tip You have become a Tribal Leatherworker.
Learn Patterns From Caryssia Moonhunter at [Feralas 89.42,46.55]
]])
