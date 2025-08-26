local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("EventsH") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("Events Guides\\Children's Week\\Children's Week Main Questline",{
description="This guide will walk you through the quests for the \"Children's Week\" event.",
condition_end=function() return completedq(5502) end,
hardcore = true,
},[[
step
talk Orphan Matron Battlewail##14451
accept Children's Week##172 |goto Orgrimmar 70.72,25.20
step
use the Orcish Orphan Whistle##18597
_Next to you:_
talk Orcish Orphan##14444
turnin Children's Week##172
accept Lordaeron Throne Room##1800
accept Down at the Docks##910
accept Gateway to the Frontier##911
step
use the Orcish Orphan Whistle##18597
Go to the Docks of Ratchet in The Barrens |q 910/1 |goto The Barrens 62.99,38.08
step
use the Orcish Orphan Whistle##18597
Go to the Mor'shan Rampart in The Barrens |q 911/1 |goto The Barrens 47.84,5.25
step
use the Orcish Orphan Whistle##18597
Go to the Old Lordaeron Throne Room |q 1800/1 |goto Undercity 66.02,36.82
step
use the Orcish Orphan Whistle##18597
_Next to you:_
talk Orcish Orphan##14444
turnin Lordaeron Throne Room##1800
turnin Down at the Docks##910
turnin Gateway to the Frontier##911
accept You Scream, I Scream...##915
accept Cairne's Hoofprint##925
step
talk Alowicious Czervik##14480
buy 1 Tigule and Foror's Strawberry Ice Cream##7228 |goto Orgrimmar 52.23,69.06 |q 915 |future
step
talk Cairne Bloodhoof##3057
Select _"Chief Bloodhoof, this may sound like an odd request..."_
collect Cairne's Hoofprint##18643 |goto Thunder Bluff 60.26,51.69 |q 925
step
use the Orcish Orphan Whistle##18597
_Next to you:_
talk Orcish Orphan##14444
turnin You Scream, I Scream...##915
turnin Cairne's Hoofprint##925
accept A Warden of the Horde##5502
step
talk Orphan Matron Battlewail##14451
turnin A Warden of the Horde##5502 |goto Orgrimmar 70.72,25.20
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Sayge's Fortunes (Elwynn Forest)",{
description="\nReceive a stat buff and have your fortune told by Sayge at the Darkmoon Faire.",
model={491},
hardcore = true,
},[[
step
label "Choose_Fortune"
Choose the buff you would like to receive:
|tip The buff lasts for two hours.
|tip You can have your fortune told every four hours.
|tip NOTE: You will not be able to receive the written fortune and potential quest without an open inventory slot.
+10% Agility |confirm |next "Agility_Buff"
+10% Intelligence |confirm |next "Intelligence_Buff"
+10% Spirit |confirm |next "Spirit_Buff"
+10% Stamina |confirm |next "Stamina_Buff"
+10% Strength |confirm |next "Strength_Buff"
+10% Armor |confirm |next "Armor_Buff"
+25 All Resistances |confirm |next "Resistance_Buff"
+10% Damage |confirm |next "Damage_Buff"
step
label "Agility_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would create some surreptitious means to keep my brother out of the order."_
Gain the "Sayge's Dark Fortune of Agility" Buff |havebuff Sayge's Dark Fortune of Agility##23736 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Intelligence_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I turn over the man to my liege for punishment, as he has broken the law of the land and it is my sworn duty to enforce it."_
Select _"I quietly ignore the insult."_
Gain the "Sayge's Dark Fortune of Intelligence" Buff |havebuff Sayge's Dark Fortune of Intelligence##23766 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Spirit_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I turn over the man to my liege for punishment, as he has broken the law of the land and it is my sworn duty to enforce it."_
Select _"I confront the ruler on his malicious behavior, upholding my liege's honor at the risk of any future diplomacy."_
Gain the "Sayge's Dark Fortune of Spirit" Buff |havebuff Sayge's Dark Fortune of Spirit##23738 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Stamina_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would speak against my brother joining the order, rushing a permanent breech in our relationship."_
Gain the "Sayge's Dark Fortune of Stamina" Buff |havebuff Sayge's Dark Fortune of Stamina##23737 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Strength_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would speak for my brother joining the order, potentially risking the safety of the order."_
Gain the "Sayge's Dark Fortune of Strength" Buff |havebuff Sayge's Dark Fortune of Strength##23735 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Armor_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I risk my own life and free him so that he may prove his innocence."_
Gain the "Sayge's Dark Fortune of Armor" Buff |havebuff Sayge's Dark Fortune of Armor##23767 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Resistance_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I execute him as per my liege's instructions, but doing so in as painless of a way as possible."_
Gain the "Sayge's Dark Fortune of Resistance" Buff |havebuff Sayge's Dark Fortune of Resistance##23769 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Damage_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I execute him as per my liege's instructions, and do it in such a manner that he suffers painfully before he dies as retribution for his crimes against my people."_
Gain the "Sayge's Dark Fortune of Damage" Buff |havebuff Sayge's Dark Fortune of Damage##23768 |goto Elwynn Forest 42.12,69.00 |next "Use_Darkmoon_Faire_Fortune"
step
label "Use_Darkmoon_Faire_Fortune"
talk Sayge##14822
Select _"I'd love to get one of those written fortunes you mentioned!"_
collect 1 Darkmoon Faire Fortune##19422 |goto Elwynn Forest 42.12,69.00
step
use the Darkmoon Faire Fortune##19422
Obtain Your Fortune |complete itemcount(19422) == 0
step
label "Fortune_Told"
You have received your fortune
|tip You can have your fortune told every four hours.
Click Here to Choose Another Fortune |confirm |next "Choose_Fortune" |or
'|complete itemcount(19423) == 1 and not completedq(7937) and level >= 10 |next "Fortune_Awaits_Eastvale" |or
'|complete itemcount(19424) == 1 and not completedq(7938) and level >= 10 |next "Fortune_Awaits_Deadmines" |or
'|complete itemcount(19443) == 1 and not completedq(7944) and level >= 10 |next "Fortune_Awaits_Wailing_Caverns" |or
'|complete itemcount(19452) == 1 and not completedq(7945) and level >= 10 |next "Fortune_Awaits_Palemane_Rock" |or
step
label "Fortune_Awaits_Eastvale"
use Sayge's Fortune #23##19423
accept Your Fortune Awaits You...##7937
step
click Mysterious Eastvale Haystack
turnin Your Fortune Awaits You...##7937 |goto Elwynn Forest 84.79,64.37 |next "Fortune_Told"
step
label "Fortune_Awaits_Deadmines"
use Sayge's Fortune #24##19424
accept Your Fortune Awaits You...##7938
step
click Mysterious Deadmines Chest
|tip Just inside The Deadmines instance before you reach the first Miner.
|tip It may take a minute or two to appear.
turnin Your Fortune Awaits You...##7938 |next "Fortune_Told"
step
label "Fortune_Awaits_Wailing_Caverns"
use Sayge's Fortune #25##19443
accept Your Fortune Awaits You...##7944
step
click Mysterious Wailing Caverns Chest
|tip Just inside the Wailing Caverns instance after the Disciple of Naralex.
|tip It may take a minute or two to appear.
turnin Your Fortune Awaits You...##7944 |next "Fortune_Told"
step
label "Fortune_Awaits_Palemane_Rock"
use Sayge's Fortune #27##19452
accept Your Fortune Awaits You...##7945
step
click Mysterious Tree Stump
turnin Your Fortune Awaits You...##7945 |goto Mulgore 34.99,61.56 |next "Fortune_Told"
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Chronos Turn-Ins (Elwynn Forest)",{
description="\nExchange various Leatherworking crafted items with Chronos for prize tickets at the Darkmoon Faire.",
model={14875},
hardcore = true,
},[[
step
collect 3 Embossed Leather Boots##2309 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Carnival Boots##7881 |goto Elwynn Forest 43.57,70.86 |or
|tip Each turnin requires 3 Embossed Leather Boots and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 3 Toughened Leather Armor##2314 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Carnival Jerkins##7882 |goto Elwynn Forest 43.57,70.86 |or
|tip Each turnin requires 3 Toughened Leather Armors and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 3 Barbaric Harness##5739 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept The World's Largest Gnome!##7883 |goto Elwynn Forest 43.57,70.86 |or
|tip Each turnin requires 3 Barbaric Harnesses and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 1 Turtle Scale Leggings##8185 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Crocolisk Boy and the Bearded Murloc##7884 |goto Elwynn Forest 43.57,70.86 |or
|tip Each turnin requires 1 Turtle Scale Leggings and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 8 Rugged Armor Kit##15564 |q 7885 |future
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
step
talk Chronos##14833
accept Armor Kits##7885 |goto Elwynn Forest 43.57,70.86
step
collect 8 Rugged Armor Kit##15564 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept More Armor Kits##7941 |goto Elwynn Forest 43.57,70.86 |or
|tip From this point on, you can continue turning in Rugged Armor Kits.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 8 Rugged Armor Kits and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Kerri Hicks Turn-Ins (Elwynn Forest)",{
description="\nExchange various Blacksmithing crafted items with Kerri Hicks for prize tickets at the Darkmoon Faire.",
model={14876},
hardcore = true,
},[[
step
collect 10 Coarse Weightstone##3240 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Coarse Weightstone##7889 |goto Elwynn Forest 40.48,69.93 |or
|tip Each turnin requires 10 Coarse Weightstones and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 7 Heavy Grinding Stone##3486 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Heavy Grinding Stone##7890 |goto Elwynn Forest 40.48,69.93 |or
|tip Each turnin requires 7 Heavy Grinding Stones and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 3 Green Iron Bracers##3835 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Green Iron Bracers##7891 |goto Elwynn Forest 40.48,69.93 |or
|tip Each turnin requires 3 Green Iron Bracers and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 1 Big Black Mace##7945 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Big Black Mace##7892 |goto Elwynn Forest 40.48,69.93 |or
|tip Each turnin requires 1 Big Black Mace and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 8 Dense Grinding Stone##12644 |q 7893 |future
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
step
talk Kerri Hicks##14832
accept Rituals of Strength##7893 |goto Elwynn Forest 40.48,69.93
step
collect 8 Dense Grinding Stone##12644 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept More Dense Grinding Stones##7939 |goto Elwynn Forest 40.48,69.93 |or
|tip From this point on, you can continue turning in Dense Grinding Stones.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 8 Dense Grinding Stones and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Rinling Turn-Ins (Elwynn Forest)",{
description="\nExchange various Engineering crafted items with Rinling for prize tickets at the Darkmoon Faire.",
model={14877},
hardcore = true,
},[[
step
collect 5 Copper Modulator##4363 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
|tip They also have a small chance to drop from mobs in the Gnomeregan dungeon.
talk Rinling##14841
accept Copper Modulator##7894 |goto Elwynn Forest 41.71,70.72 |or
|tip Each turnin requires 5 Copper Modulators and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 7 Whirring Bronze Gizmo##4375 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept Whirring Bronze Gizmo##7895 |goto Elwynn Forest 41.71,70.72 |or
|tip Each turnin requires 7 Whirring Bronze Gizmos and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 36 Green Firework##9313 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
|tip They can also be purchased from any Holiday Fireworks Vendor on July 4th.
talk Rinling##14841
accept Green Fireworks##7896 |goto Elwynn Forest 41.71,70.72 |or
|tip Each turnin requires 36 Green Fireworks and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 6 Mechanical Repair Kit##11590 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept Mechanical Repair Kits##7897 |goto Elwynn Forest 41.71,70.72 |or
|tip Each turnin requires 6 Mechanical Repair Kits and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 6 Thorium Widget##15994 |q 7898 |future
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
step
talk Rinling##14841
accept Thorium Widget##7898 |goto Elwynn Forest 41.71,70.72
step
collect 6 Thorium Widget##15994 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept More Thorium Widgets##7942 |goto Elwynn Forest 41.71,70.72 |or
|tip From this point on, you can continue turning in Thorium Widgets.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 6 Thorium Widgets and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Yebb Neblegear Turn-Ins (Elwynn Forest)",{
description="\nExchange various Farmed items with Yebb Neblegear for prize tickets at the Darkmoon Faire.",
model={14856},
hardcore = true,
},[[
step
Kill Savannah enemies around this area
|tip You can find them all over around Crossroads and to its northern area.
collect 5 Small Furry Paw##5134 |goto The Barrens 50.21,21.82 |n
talk Yebb Neblegear##14829
accept Small Furry Paws##7899 |goto Elwynn Forest 40.17,69.53 |or
|tip Each turnin requires 5 Small Furry Paws and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
Kill Ashenvale Bear enemies around this area
|tip You can find them all over between Raynewood Retreat and Splintertree post.
|tip You can also find them east of Satyrn.
collect 5 Torn Bear Pelt##11407 |goto Ashenvale 66.01,60.42 |n
You can find more around [83.81,47.40]
talk Yebb Neblegear##14829
accept Torn Bear Pelts##7900 |goto Elwynn Forest 40.17,69.53 |or
|tip Each turnin requires 5 Torn Bear Pelts and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
Kill Crag Coyote enemies around this area
|tip You can find the all over central and western Badlands.
collect 5 Soft Bushy Tail##4582 |goto Badlands 34.41,65.63 |n
You can find more around [57.00,58.62]
talk Yebb Neblegear##14829
accept Soft Bushy Tails##7901 |goto Elwynn Forest 40.17,69.53 |or
|tip Each turnin requires 5 Soft Bushy Tails and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
Kill Northspring enemies around this area
collect 5 Vibrant Plume##5117 |goto Feralas 40.00,12.61 |n
talk Yebb Neblegear##14829
accept Vibrant Plumes##7902 |goto Elwynn Forest 40.17,69.53 |or
|tip Each turnin requires 5 Vibrant Plumes and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
Kill Stonelash enemies around this area
|tip You can find them all over central and southern Silithus.
collect 10 Glowing Scorpid Blood##19933 |goto Silithus 44.81,54.50 |q 8222 |future
step
talk Yebb Neblegear##14829
accept Glowing Scorpid Blood##8222 |goto Elwynn Forest 40.17,69.53
step
Kill Stonelash enemies around this area
|tip You can find them all over central and southern Silithus.
collect 10 Glowing Scorpid Blood##19933 |goto Silithus 44.81,54.50 |n
talk Yebb Neblegear##14829
accept More Glowing Scorpid Blood##8223 |goto Elwynn Forest 40.17,69.53
|tip From this point on, you can continue turning in Glowing Scorpid Blood.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 10 Glowing Scorpid Blood and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Spawn of Jubjub (Elwynn Forest)",{
description="\nCollect a couple of Dark Iron Ale Mugs from the Grim Guzzler tavern in Blackrock Depths "..
"and offer them to Morja at the Darkmoon Faire to receive your very own Jubjub companion pet.",
condition_end=function() return completedq(7946) end,
model={14938},
hardcore = true,
},[[
step
click Dark Iron Ale Mug##165738
|tip They look like small mugs of ale on tables around the Grim Guzzler tavern in Blackrock Depths.
|tip Clicking two of them is safe but clicking more will anger the bar patrons.
collect 2 Dark Iron Ale Mug##11325 |q 7946 |future
|tip They can also be purchased from Plugger Spazzring in the Grim Guzzler.
|tip They can be purchased from the Auction House if you are lucky enough to find them. |only if not selfmade
step
use the Dark Iron Ale Mug##11325
|tip Place it at Morja's feet.
|tip Be sure you only use one; you will need the other one to turn in the quest.
Wait for Jubjub the frog to hop over to the mug
|tip This may take a couple of minutes.
talk Morja##14871
accept Spawn of Jubjub##7946 |goto Elwynn Forest 43.33,70.29
|tip This quest will be available after Jubjub appears.
step
use the Unhatched Jubling Egg##19462
|tip It will take seven days for the egg to mature enough to hatch.
collect 1 A Jubling's Tiny Home##19450
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Wood Frog (Elwynn Forest)",{
description="\nCatch Flik as he runs all over the Darkmoon Faire grounds and purchase his limited supply "..
"Wood Frog Box for 1 gold.",
model={901},
hardcore = true,
},[[
step
talk Flik##14860
|tip He's a little Orc boy running fast all over the Darkmoon Faire grounds.
|tip You will have to be quick to catch him.
|tip Talking to him will stop him for a short period of time.
buy 1 Wood Frog Box##11027 |goto Elwynn Forest 42.59,70.30
|tip This item costs 1 gold and has a limited quantity of 1.
|tip It respawns in approximately 20 minutes.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Elwynn Forest\\Tree Frog (Elwynn Forest)",{
description="\nCatch Flik as he runs all over the Darkmoon Faire grounds and purchase his "..
"Tree Frog Box for 1 gold.",
model={6295},
hardcore = true,
},[[
step
talk Flik##14860
|tip He's a little Orc boy running fast all over the Darkmoon Faire grounds.
|tip You will have to be quick to catch him.
|tip Talking to him will stop him for a short period of time.
buy 1 Tree Frog Box##11026 |goto Elwynn Forest 42.59,70.30
|tip This item costs 1 gold.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Sayge's Fortunes (Mulgore)",{
description="\nReceive a stat buff and have your fortune told by Sayge at the Darkmoon Faire.",
model={491},
hardcore = true,
},[[
step
label "Choose_Fortune"
Choose the buff you would like to receive:
|tip The buff lasts for two hours.
|tip You can have your fortune told every four hours.
|tip NOTE: You will not be able to receive the written fortune and potential quest without an open inventory slot.
+10% Agility |confirm |next "Agility_Buff"
+10% Intelligence |confirm |next "Intelligence_Buff"
+10% Spirit |confirm |next "Spirit_Buff"
+10% Stamina |confirm |next "Stamina_Buff"
+10% Strength |confirm |next "Strength_Buff"
+10% Armor |confirm |next "Armor_Buff"
+25 All Resistances |confirm |next "Resistance_Buff"
+10% Damage |confirm |next "Damage_Buff"
step
label "Agility_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would create some surreptitious means to keep my brother out of the order."_
Gain the "Sayge's Dark Fortune of Agility" Buff |havebuff Sayge's Dark Fortune of Agility##23736 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Intelligence_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I turn over the man to my liege for punishment, as he has broken the law of the land and it is my sworn duty to enforce it."_
Select _"I quietly ignore the insult."_
Gain the "Sayge's Dark Fortune of Intelligence" Buff |havebuff Sayge's Dark Fortune of Intelligence##23766 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Spirit_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I turn over the man to my liege for punishment, as he has broken the law of the land and it is my sworn duty to enforce it."_
Select _"I confront the ruler on his malicious behavior, upholding my liege's honor at the risk of any future diplomacy."_
Gain the "Sayge's Dark Fortune of Spirit" Buff |havebuff Sayge's Dark Fortune of Spirit##23738 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Stamina_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would speak against my brother joining the order, rushing a permanent breech in our relationship."_
Gain the "Sayge's Dark Fortune of Stamina" Buff |havebuff Sayge's Dark Fortune of Stamina##23737 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Strength_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I confiscate the corn he has stolen, warn him that stealing is a path towards doom and destruction, but I let him go to return to his family."_
Select _"I would speak for my brother joining the order, potentially risking the safety of the order."_
Gain the "Sayge's Dark Fortune of Strength" Buff |havebuff Sayge's Dark Fortune of Strength##23735 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Armor_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I risk my own life and free him so that he may prove his innocence."_
Gain the "Sayge's Dark Fortune of Armor" Buff |havebuff Sayge's Dark Fortune of Armor##23767 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Resistance_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I execute him as per my liege's instructions, but doing so in as painless of a way as possible."_
Gain the "Sayge's Dark Fortune of Resistance" Buff |havebuff Sayge's Dark Fortune of Resistance##23769 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Damage_Buff"
talk Sayge##14822
Choose _"I am ready to discover where my fortune lies!"_
Select _"I slay the man on the spot as my liege would expect me to do, as he is nothing more than a thief and a liar."_
Select _"I execute him as per my liege's instructions, and do it in such a manner that he suffers painfully before he dies as retribution for his crimes against my people."_
Gain the "Sayge's Dark Fortune of Damage" Buff |havebuff Sayge's Dark Fortune of Damage##23768 |goto Mulgore 36.92,38.37 |next "Use_Darkmoon_Faire_Fortune"
step
label "Use_Darkmoon_Faire_Fortune"
talk Sayge##14822
Select _"I'd love to get one of those written fortunes you mentioned!"_
collect 1 Darkmoon Faire Fortune##19422 |goto Mulgore 36.92,38.37
step
use the Darkmoon Faire Fortune##19422
Obtain Your Fortune |complete itemcount(19422) == 0
step
label "Fortune_Told"
You have received your fortune
|tip You can have your fortune told every four hours.
Click Here to Choose Another Fortune |confirm |next "Choose_Fortune" |or
'|complete itemcount(19423) == 1 and not completedq(7937) and level >= 10 |next "Fortune_Awaits_Eastvale" |or
'|complete itemcount(19424) == 1 and not completedq(7938) and level >= 10 |next "Fortune_Awaits_Deadmines" |or
'|complete itemcount(19443) == 1 and not completedq(7944) and level >= 10 |next "Fortune_Awaits_Wailing_Caverns" |or
'|complete itemcount(19452) == 1 and not completedq(7945) and level >= 10 |next "Fortune_Awaits_Palemane_Rock" |or
step
label "Fortune_Awaits_Eastvale"
use Sayge's Fortune #23##19423
accept Your Fortune Awaits You...##7937
step
click Mysterious Eastvale Haystack
turnin Your Fortune Awaits You...##7937 |goto Elwynn Forest 84.79,64.37 |next "Fortune_Told"
step
label "Fortune_Awaits_Deadmines"
use Sayge's Fortune #24##19424
accept Your Fortune Awaits You...##7938
step
click Mysterious Deadmines Chest
|tip Just inside The Deadmines instance before you reach the first Miner.
|tip It may take a minute or two to appear.
turnin Your Fortune Awaits You...##7938 |next "Fortune_Told"
step
label "Fortune_Awaits_Wailing_Caverns"
use Sayge's Fortune #25##19443
accept Your Fortune Awaits You...##7944
step
click Mysterious Wailing Caverns Chest
|tip Just inside the Wailing Caverns instance after the Disciple of Naralex.
|tip It may take a minute or two to appear.
turnin Your Fortune Awaits You...##7944 |next "Fortune_Told"
step
label "Fortune_Awaits_Palemane_Rock"
use Sayge's Fortune #27##19452
accept Your Fortune Awaits You...##7945
step
click Mysterious Tree Stump
turnin Your Fortune Awaits You...##7945 |goto Mulgore 34.99,61.56 |next "Fortune_Told"
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Chronos Turn-Ins (Mulgore)",{
description="\nExchange various Leatherworking crafted items with Chronos for prize tickets at the Darkmoon Faire.",
model={14875},
hardcore = true,
},[[
step
collect 3 Embossed Leather Boots##2309 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Carnival Boots##7881 |goto Mulgore 36.15,35.18 |or
|tip Each turnin requires 3 Embossed Leather Boots and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 3 Toughened Leather Armor##2314 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Carnival Jerkins##7882 |goto Mulgore 36.15,35.18 |or
|tip Each turnin requires 3 Toughened Leather Armors and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 3 Barbaric Harness##5739 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept The World's Largest Gnome!##7883 |goto Mulgore 36.15,35.18 |or
|tip Each turnin requires 3 Barbaric Harnesses and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 1 Turtle Scale Leggings##8185 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept Crocolisk Boy and the Bearded Murloc##7884 |goto Mulgore 36.15,35.18 |or
|tip Each turnin requires 1 Turtle Scale Leggings and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 8 Rugged Armor Kit##15564 |q 7885 |future
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
step
talk Chronos##14833
accept Armor Kits##7885 |goto Mulgore 36.15,35.18
step
collect 8 Rugged Armor Kit##15564 |n
|tip Create them with Leatherworking or purchase them from the Auction House. |only if not selfmade
talk Chronos##14833
accept More Armor Kits##7941 |goto Mulgore 36.15,35.18 |or
|tip From this point on, you can continue turning in Rugged Armor Kits.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 8 Rugged Armor Kits and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Kerri Hicks Turn-Ins (Mulgore)",{
description="\nExchange various Blacksmithing crafted items with Kerri Hicks for prize tickets at the Darkmoon Faire.",
model={14876},
hardcore = true,
},[[
step
collect 10 Coarse Weightstone##3240 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Coarse Weightstone##7889 |goto Mulgore 37.87,39.83 |or
|tip Each turnin requires 10 Coarse Weightstones and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 7 Heavy Grinding Stone##3486 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Heavy Grinding Stone##7890 |goto Mulgore 37.87,39.83 |or
|tip Each turnin requires 7 Heavy Grinding Stones and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 3 Green Iron Bracers##3835 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Green Iron Bracers##7891 |goto Mulgore 37.87,39.83 |or
|tip Each turnin requires 3 Green Iron Bracers and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 1 Big Black Mace##7945 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept Big Black Mace##7892 |goto Mulgore 37.87,39.83 |or
|tip Each turnin requires 1 Big Black Mace and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 8 Dense Grinding Stone##12644 |q 7893 |future
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
step
talk Kerri Hicks##14832
accept Rituals of Strength##7893 |goto Mulgore 37.87,39.83
step
collect 8 Dense Grinding Stone##12644 |n
|tip Create them with Blacksmithing or purchase them from the Auction House. |only if not selfmade
talk Kerri Hicks##14832
accept More Dense Grinding Stones##7939 |goto Mulgore 37.87,39.83 |or
|tip From this point on, you can continue turning in Dense Grinding Stones.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 8 Dense Grinding Stones and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Rinling Turn-Ins (Mulgore)",{
description="\nExchange various Engineering crafted items with Rinling for prize tickets at the Darkmoon Faire.",
model={14877},
hardcore = true,
},[[
step
collect 5 Copper Modulator##4363 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
|tip They also have a small chance to drop from mobs in the Gnomeregan dungeon.
talk Rinling##14841
accept Copper Modulator##7894 |goto Mulgore 37.12,37.31 |or
|tip Each turnin requires 5 Copper Modulators and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
collect 7 Whirring Bronze Gizmo##4375 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept Whirring Bronze Gizmo##7895 |goto Mulgore 37.12,37.31 |or
|tip Each turnin requires 7 Whirring Bronze Gizmos and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
collect 36 Green Firework##9313 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
|tip They can also be purchased from any Holiday Fireworks Vendor on July 4th.
talk Rinling##14841
accept Green Fireworks##7896 |goto Mulgore 37.12,37.31 |or
|tip Each turnin requires 36 Green Fireworks and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
collect 6 Mechanical Repair Kit##11590 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept Mechanical Repair Kits##7897 |goto Mulgore 37.12,37.31 |or
|tip Each turnin requires 6 Mechanical Repair Kits and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
collect 6 Thorium Widget##15994 |q 7898 |future
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
step
talk Rinling##14841
accept Thorium Widget##7898 |goto Mulgore 37.12,37.31
step
collect 6 Thorium Widget##15994 |n
|tip Create them with Engineering or purchase them from the Auction House. |only if not selfmade
talk Rinling##14841
accept More Thorium Widgets##7942 |goto Mulgore 37.12,37.31 |or
|tip From this point on, you can continue turning in Thorium Widgets.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 6 Thorium Widgets and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Yebb Neblegear Turn-Ins (Mulgore)",{
description="\nExchange various Farmed items with Yebb Neblegear for prize tickets at the Darkmoon Faire.",
model={14856},
hardcore = true,
},[[
step
Kill Savannah enemies around this area
|tip You can find them all over around Crossroads and to its northern area.
collect 5 Small Furry Paw##5134 |goto The Barrens 50.21,21.82 |n
talk Yebb Neblegear##14829
accept Small Furry Paws##7899 |goto Mulgore 37.54,39.63 |or
|tip Each turnin requires 5 Small Furry Paws and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 1 Darkmoon Faire Prize Ticket.
|tip You can turn this quest in until you reach 500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 500 |or
step
Reach Level 10 |ding 10
|tip Use the leveling guides to accomplish this.
step
Kill Ashenvale Bear enemies around this area
|tip You can find them all over between Raynewood Retreat and Splintertree post.
|tip You can also find them east of Satyrn.
collect 5 Torn Bear Pelt##11407 |goto Ashenvale 66.01,60.42 |n
You can find more around [83.81,47.40]
talk Yebb Neblegear##14829
accept Torn Bear Pelts##7900 |goto Mulgore 37.54,39.63 |or
|tip Each turnin requires 5 Torn Bear Pelts and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 4 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,100 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1100 |or
step
Reach Level 20 |ding 20
|tip Use the leveling guides to accomplish this.
step
Kill Crag Coyote enemies around this area
|tip You can find the all over central and western Badlands.
collect 5 Soft Bushy Tail##4582 |goto Badlands 34.41,65.63 |n
You can find more around [57.00,58.62]
talk Yebb Neblegear##14829
accept Soft Bushy Tails##7901 |goto Mulgore 37.54,39.63 |or
|tip Each turnin requires 5 Soft Bushy Tails and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 8 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 1,700 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 1700 |or
step
Reach Level 30 |ding 30
|tip Use the leveling guides to accomplish this.
step
Kill Northspring enemies around this area
collect 5 Vibrant Plume##5117 |goto Feralas 40.00,12.61 |n
talk Yebb Neblegear##14829
accept Vibrant Plumes##7902 |goto Mulgore 37.54,39.63 |or
|tip Each turnin requires 5 Vibrant Plumes and grants 100 reputation with the Darkmoon Faire.
|tip Each of these turnins will award 12 Darkmoon Faire Prize Tickets.
|tip You can turn this quest in until you reach 2,500 Neutral reputation.
'|complete repval('Darkmoon Faire','Neutral') >= 2500 |or
step
Reach Level 40 |ding 40
|tip Use the leveling guides to accomplish this.
step
Kill Stonelash enemies around this area
|tip You can find them all over central and southern Silithus.
collect 10 Glowing Scorpid Blood##19933 |goto Silithus 44.81,54.50 |q 8222 |future
step
talk Yebb Neblegear##14829
accept Glowing Scorpid Blood##8222 |goto Mulgore 37.54,39.63
step
Kill Stonelash enemies around this area
|tip You can find them all over central and southern Silithus.
collect 10 Glowing Scorpid Blood##19933 |goto Silithus 44.81,54.50 |n
talk Yebb Neblegear##14829
accept More Glowing Scorpid Blood##8223 |goto Mulgore 37.54,39.63
|tip From this point on, you can continue turning in Glowing Scorpid Blood.
|tip Each of these turnins will award 20 Darkmoon Faire Prize Tickets.
|tip Each turnin requires 10 Glowing Scorpid Blood and grants 100 reputation with the Darkmoon Faire.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Spawn of Jubjub (Mulgore)",{
description="\nCollect a couple of Dark Iron Ale Mugs from the Grim Guzzler tavern in Blackrock Depths "..
"and offer them to Morja at the Darkmoon Faire to receive your very own Jubjub companion pet.",
condition_end=function() return completedq(7946) end,
model={14938},
hardcore = true,
},[[
step
click Dark Iron Ale Mug##165738
|tip They look like small mugs of ale on tables around the Grim Guzzler tavern in Blackrock Depths.
|tip Clicking two of them is safe but clicking more will anger the bar patrons.
collect 2 Dark Iron Ale Mug##11325 |q 7946 |future
|tip They can also be purchased from Plugger Spazzring in the Grim Guzzler.
|tip They can be purchased from the Auction House if you are lucky enough to find them. |only if not selfmade
step
use the Dark Iron Ale Mug##11325
|tip Place it at Morja's feet.
|tip Be sure you only use one; you will need the other one to turn in the quest.
Wait for Jubjub the frog to hop over to the mug
|tip This may take a couple of minutes.
talk Morja##14871
accept Spawn of Jubjub##7946 |goto Mulgore 35.87,35.24
|tip This quest will be available after Jubjub appears.
step
use the Unhatched Jubling Egg##19462
|tip It will take seven days for the egg to mature enough to hatch.
collect 1 A Jubling's Tiny Home##19450
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Wood Frog (Mulgore)",{
description="\nCatch Flik as he runs all over the Darkmoon Faire grounds and purchase his limited supply "..
"Wood Frog Box for 1 gold.",
model={901},
hardcore = true,
},[[
step
talk Flik##14860
|tip He's a little Orc boy running fast all over the Darkmoon Faire grounds.
|tip You will have to be quick to catch him.
|tip Talking to him will stop him for a short period of time.
buy 1 Wood Frog Box##11027 |goto Mulgore 36.72,37.36
|tip This item costs 1 gold and has a limited quantity of 1.
|tip It respawns in approximately 20 minutes.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Darkmoon Faire\\Mulgore\\Tree Frog (Mulgore)",{
description="\nCatch Flik as he runs all over the Darkmoon Faire grounds and purchase his "..
"Tree Frog Box for 1 gold.",
model={6295},
hardcore = true,
},[[
step
talk Flik##14860
|tip He's a little Orc boy running fast all over the Darkmoon Faire grounds.
|tip You will have to be quick to catch him.
|tip Talking to him will stop him for a short period of time.
buy 1 Tree Frog Box##11026 |goto Mulgore 36.72,37.36
|tip This item costs 1 gold.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Hallow's End\\Hallow's End Quests",{
condition_end=function() return completedq(1657) end,
description="\nComplete the quests \"Hallow's End Treats for Spoops!\" and \"Stinking Up Southshore\" for the Hallow's End event.",
hardcore = true,
},[[
step
Reach Level 10 |ding 10
|tip You must be at least level 10 to be able to accept these quests.
|tip Use the Leveling guides to accomplish this.
step
Enter the building |goto Orgrimmar 71.07,23.87 < 5 |walk
talk Spoops##15309
|tip Inside the building.
accept Hallow's End Treats for Spoops!##8312 |goto Orgrimmar 71.44,22.80
step
Enter the building |goto Orgrimmar 54.03,68.94 < 5 |walk
talk Innkeeper Gryshka##6929
|tip Inside the building.
accept Flexing for Nougat##8359 |goto Orgrimmar 54.10,68.40 |complete completedq(8312) or completedq(8359)
step
clicknpc Innkeeper Gryshka##6929
|tip Inside the building.
|tip Target Innkeeper Gryshka and type "/flex" into your chat to perform the Flex emote.
Flex for Inkeeper Gryshka |q 8359/1 |goto Orgrimmar 54.10,68.40 |complete completedq(8312) or completedq("8359/1")
step
talk Innkeeper Gryshka##6929
|tip Inside the building.
turnin Flexing for Nougat##8359 |goto Orgrimmar 54.10,68.40 |complete completedq(8312) or completedq(8359)
collect Orgrimmar Nougat##20493 |q 8312/1
step
Follow the road south |goto Durotar 46.34,18.51 < 20 |only if walking
Continue following the road south |goto Durotar 52.58,45.00 < 20 |only if walking
talk Kali Remik##11814
accept Incoming Gumdrop##8358 |goto Durotar 56.12,74.24 |complete completedq(8312) or completedq(8358)
step
clicknpc Kali Remik##11814
|tip Target Kali Remik and type "/train" into your chat to perform the Train emote.
Do the "Train" for Kali Remik |q 8358/1 |goto Durotar 56.12,74.24 |complete completedq(8312) or completedq("8358/1")
step
talk Kali Remik##11814
turnin Incoming Gumdrop##8358 |goto Durotar 56.12,74.24 |complete completedq(8312) or completedq(8358)
collect Darkspear Gumdrop##20495 |q 8312/2
step
Enter the building |goto Thunder Bluff 44.95,62.12 < 5 |walk
talk Innkeeper Pala##6746
|tip Inside the building.
accept Dancing for Marzipan##8360 |goto Thunder Bluff 45.81,64.71 |complete completedq(8312) or completedq(8360)
step
clicknpc Innkeeper Pala##6746
|tip Inside the building.
|tip Target Innkeeper Pala and type "/dance" into your chat to perform the Dance emote.
Dance for Inkeeper Pala |q 8360/1 |goto Thunder Bluff 45.81,64.71 |complete completedq(8312) or completedq("8360/1")
step
talk Innkeeper Pala##6746
|tip Inside the building.
turnin Dancing for Marzipan##8360 |goto Thunder Bluff 45.81,64.71 |complete completedq(8312) or completedq(8360)
collect Thunder Bluff Marzipan##20497 |q 8312/4
step
talk Innkeeper Norman##6741
accept Chicken Clucking for a Mint##8354 |goto Undercity 67.73,37.88 |complete completedq(8312) or completedq(8354)
step
clicknpc Innkeeper Norman##6741
|tip Target Innkeeper Norman and type "/chicken" into your chat to perform the Chicken emote.
Cluck Like a Chicken for Innkeeper Norman |q 8354/1 |goto Undercity 67.73,37.88 |complete completedq(8312) or completedq("8354/1")
step
talk Innkeeper Norman##6741
turnin Chicken Clucking for a Mint##8354 |goto Undercity 67.73,37.88 |complete completedq(8312) or completedq(8354)
collect Undercity Mint##20491 |q 8312/3
step
Enter the building |goto Orgrimmar 71.07,23.87 < 5 |walk
talk Spoops##15309
|tip Inside the building.
turnin Hallow's End Treats for Spoops!##8312 |goto Orgrimmar 71.44,22.80
step
Reach Level 25 |ding 25
|tip You must be at least level 25 to be able to accept this quest.
|tip Use the Leveling guides to accomplish this.
step
talk Darkcaller Yanka##15197
accept Stinking Up Southshore##1657 |goto Tirisfal Glades 55.57,69.90
step
Avoid Southshore |goto Hillsbrad Foothills 45.12,49.16 < 15 |only if walking
Avoid Southshore guards |goto Hillsbrad Foothills 46.66,58.05 < 7 |only if walking
use Forsaken Stink Bomb Cluster##20387
|tip Use it while standing here to throw stink bombs on the ground.
Toss Stink Bombs into Southshore |q 1657/1 |goto Hillsbrad Foothills 48.42,57.86
step
talk Darkcaller Yanka##15197
turnin Stinking Up Southshore##1657 |goto Tirisfal Glades 55.57,69.90
step
_Congratulations!_
You Completed the "Hallow's End" Event
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Harvest Festival\\Harvest Festival Quest",{
condition_end=function() return completedq(8150) end,
description="\nComplete the quest \"Honoring a Hero\" for the Harvest Festival event.",
hardcore = true,
},[[
step
Reach Level 30 |ding 30
|tip You must be at least level 30 to be able to accept the quest.
|tip Use the Leveling guides to accomplish this.
step
talk Javnir Nashak##15012
accept Honoring a Hero##8150 |goto Durotar 46.10,13.77
step
Follow the path |goto Ashenvale 73.51,63.53 < 15 |only if walking
Continue following the path |goto Ashenvale 75.62,65.88 < 30 |only if walking
Continue following the path |goto Ashenvale 84.20,72.05 < 20 |only if walking
use Grom's Tribute##19851
Place a Tribute at Grom's Monument |goto Ashenvale 82.85,79.04
|confirm |q 8150
step
Follow the path |goto Ashenvale 84.20,72.05 < 20 |only if walking
Follow the path |goto Ashenvale 73.51,63.53 < 15 |only if walking
talk Javnir Nashak##15012
turnin Honoring a Hero##8150 |goto Durotar 46.10,13.77
step
_Congratulations!_
You Completed the "Harvest Festival" Event
|tip You can now use the food at the Harvest Festival table.
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Feast of Winter Veil\\Feast of Winter Veil Quest",{
description="This guide will walk you through the quests for the \"Feast of Winter Veil\" event.",
hardcore = true,
},[[
step
Reach Level 10 |ding 10
|tip You must be at least this level to be able to accept the quest.
|tip Use the Leveling guides to accomplish this.
step
talk Furmund##9550
accept The Reason for the Season##6964 |goto Orgrimmar 50.85,65.26
step
Enter the building |goto Orgrimmar 40.32,36.94 < 7 |walk
talk Sagorne Creststrider##13417
|tip Inside the building.
turnin The Reason for the Season##6964 |goto Orgrimmar 38.66,35.92
accept The Feast of Winter Veil##7061 |goto Orgrimmar 38.66,35.92
step
Leave the building |goto Orgrimmar 40.32,36.94 < 7 |walk
talk Cairne Bloodhoof##3057
|tip Inside the building.
turnin The Feast of Winter Veil##7061 |goto Thunder Bluff 60.30,51.68
step
talk Kaymard Copperpinch##13418
accept Great-father Winter is Here!##6961 |goto Orgrimmar 53.33,66.49
step
talk Great-father Winter##13445
turnin Great-father Winter is Here!##6961 |goto Orgrimmar 52.49,69.18
accept Treats for Great-father Winter##6962 |goto Orgrimmar 52.49,69.18
step
Run up the stairs |goto Orgrimmar 56.34,56.91 < 7 |only if walking
Enter the building |goto Orgrimmar 58.14,53.56 < 7 |walk
talk Zamja##3399
|tip Inside the building.
Learn Apprentice Cooking |skillmax Cooking,75 |goto Orgrimmar 57.40,53.96
step
talk Penney Copperpinch##13420
buy Recipe: Gingerbread Cookie##17200 |n
use the Recipe: Gingerbread Cookie##17200
learn Gingerbread Cookie##21143 |goto Orgrimmar 53.21,65.89
step
collect 5 Small Egg##6889 |q 6962
|tip Search the guide menu and use the farming guide to accomplish this.
|tip You can also buy them from the Auction House. |only if not selfmade
step
talk Penney Copperpinch##13420
buy 5 Holiday Spices##17194 |goto Orgrimmar 53.21,65.89 |q 6962
step
Enter the building |goto Orgrimmar 54.06,68.85 < 7 |walk
Open Your Cooking Crafting Panel:
|tip Stand next to the Mighty Blaze.
|tip Inside the building.
_<Create 5 Gingerbread Cookies>_
collect 5 Gingerbread Cookie##17197 |q 6962/1 |goto Orgrimmar 54.76,68.23
step
talk Barkeep Morag##5611
|tip Inside the building.
buy Ice Cold Milk##1179 |q 6962/2 |goto Orgrimmar 54.64,67.68
step
talk Great-father Winter##13445
turnin Treats for Great-father Winter##6962 |goto Orgrimmar 52.49,69.18
|tip After you turn in this quest, you can then repeat it to get more gifts to open.
step
Reach Level 30 |ding 30
|tip You must be at least this level to be able to accept the quest.
|tip Use the Leveling guides to accomplish this.
step
talk Kaymard Copperpinch##13418
accept Stolen Winter Veil Treats##6963 |goto Orgrimmar 53.33,66.49
step
Follow the path |goto Alterac Mountains 49.56,69.08 < 20 |only if walking
Continue following the path |goto Alterac Mountains 41.83,77.11 < 20 |only if walking
talk Strange Snowman##13636
turnin Stolen Winter Veil Treats##6963 |goto Alterac Mountains 35.44,72.46
accept You're a Mean One...##6983 |goto Alterac Mountains 35.44,72.46
step
kill The Abominable Greench##13602
|tip He looks like a level 36 elite yeti.
|tip If you have trouble, try to find someone to help you.
|tip He can spawn in random places around the "Growless Cave" area.
|tip When he spawns, you will see a red yelled message in your chat.
|tip Just wait around nearby in this area until he spawns.
collect Stolen Treats##17662 |q 6983/1 |goto Alterac Mountains 40.80,67.77
step
talk Kaymard Copperpinch##13418
turnin You're a Mean One...##6983 |goto Orgrimmar 53.33,66.49
accept A Smokywood Pastures Thank You!##6984 |goto Orgrimmar 53.33,66.49
step
talk Great-father Winter##13445
turnin A Smokywood Pastures Thank You!##6984 |goto Orgrimmar 52.49,69.18
step
Reach Level 40 |ding 40
|tip You must be at least this level to be able to accept the quest.
|tip Use the Leveling guides to accomplish this.
step
talk Kaymard Copperpinch##13418
accept Metzen the Reindeer##8746 |goto Orgrimmar 53.33,66.49
step
use the Smokywood Satchel##21315
collect Pouch of Reindeer Dust##21211 |q 8746/2
step
Enter the tunnel |goto Tanaris 68.61,41.45 < 10 |only if walking
Leave the tunnel |goto Tanaris 69.81,42.48 < 10 |only if walking
Follow the path |goto Tanaris 73.18,45.56 < 15 |only if walking
talk Metzen the Reindeer##15664
|tip Inside the building.
Choose _"Sprinkle some of the reindeer dust onto Metzen."_
Find Metzen the Reindeer and Rescue Hime |q 8746/1 |goto Tanaris 73.35,48.07
step
talk Kaymard Copperpinch##13418
turnin Metzen the Reindeer##8746 |goto Orgrimmar 53.33,66.49
step
_Congratulations!_
You Completed the "Feast of Winter Veil" Event
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Lunar Festival\\Lunar Festival Main Questline",{
description="This guide will walk you through the quests for the \"Lunar Festival\" event.",
condition_end=function() return completedq(8862) end,
hardcore = true,
},[[
step
talk Lunar Festival Emissary##15891
accept The Lunar Festival##8873 |goto Orgrimmar 51.00,70.50
step
talk Lunar Festival Harbinger##15895
turnin The Lunar Festival##8873 |goto Orgrimmar 41.60,32.00
accept Lunar Fireworks##8867 |goto Orgrimmar 41.60,32.00
step
talk Lunar Festival Vendor##15898
buy 8 Small Blue Rocket##21558 |q 8867 |goto Orgrimmar 41.30,32.40
buy 2 Blue Rocket Cluster##21571 |q 8867 |goto Orgrimmar 41.30,32.40
stickystart "Fire_Lunar_Fireworks_Clusters"
step
use the Small Blue Rocket##21558
Fire #8# Lunar Fireworks|q 8867/1 |goto Orgrimmar 41.60,32.80
step
label "Fire_Lunar_Fireworks_Clusters"
use the Blue Rocket Cluster##21571
Fire #2# Lunar Fireworks Clusters|q 8867/2 |goto Orgrimmar 41.60,32.80
step
talk Lunar Festival Harbinger##15895
turnin Lunar Fireworks##8867 |goto Orgrimmar 41.60,32.00
accept Valadar Starsong##8883 |goto Orgrimmar 41.60,32.00
step
use the Lunar Festival Invitation##21711 |goto Orgrimmar 41.00,31.00
Go to Moonglade |goto Moonglade |c |q 8883
step
talk Valadar Starsong##15864
turnin Valadar Starsong##8883 |goto Moonglade 53.65,35.26
step
collect 16 Coin of Ancestry##21100
|tip These are awarded by talking to elders around Kalimdor and Eastern Kingdoms.
|tip Use the "Lunar Festival Optimized Elders Path" event guide to collect them.
step
talk Valadar Starsong##15864
accept Festive Lunar Dresses##8864 |goto Moonglade 53.65,35.26
accept Festive Lunar Pant Suits##8865 |goto Moonglade 53.65,35.26
accept Festival Dumplings##8863 |goto Moonglade 53.65,35.26
accept Elune's Candle##8862 |goto Moonglade 53.65,35.26
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Lunar Festival\\Lunar Festival Optimized Elders Path",{
description="This guide will walk you through an optimized path, honoring the elders for the \"Lunar Festival\" event.",
hardcore = true,
},[[
step
Follow the path |goto Western Plaguelands/0 68.61,80.10 < 20 |only if walking
Run up the stairs |goto Western Plaguelands/0 69.94,74.03 < 7 |only if walking
Enter the building |goto Eastern Kingdoms/0 52.79,26.43 < 15 |walk
Run up the stairs |goto Eastern Kingdoms/0 52.73,26.29 < 5 ||walk
Run up the stairs |goto Eastern Kingdoms/0 52.69,26.31 < 5 ||walk
talk Elder Moonstrike##15594
|tip Upstairs on the outer wall of the building.
accept Moonstrike the Elder##8714 |goto Eastern Kingdoms/0 52.72,26.44
step
Jump down here |goto Eastern Kingdoms/0 52.70,26.44 < 7 |walk
Jump Off the Wall |goto Western Plaguelands/0 68.75,73.57 < 500 |c |noway |q 8722 |future
step
talk Elder Meadowrun##15602
accept Meadowrun the Elder##8722 |goto Western Plaguelands/0 65.97,47.82
step
talk Elder Graveborn##15568
accept Graveborn the Elder##8652 |goto Tirisfal Glades/0 61.87,53.84
step
talk Elder Darkcore##15564
accept Darkcore the Elder##8648 |goto Undercity/0 66.63,38.22
step
talk Elder Obsidian##15561
accept Obsidian the Elder##8645 |goto Silverpine Forest/0 44.97,41.14
step
talk Elder Snowcrown##15566
accept Snowcrown the Elder##8650 |goto Eastern Plaguelands/0 81.51,60.52
step
talk Elder Windrun##15592
|tip Inside the building.
accept Windrun the Elder##8688 |goto Eastern Plaguelands/0 39.69,75.40
step
talk Elder Highpeak##15559
accept Highpeak the Elder##8643 |goto The Hinterlands/0 50.00,48.05
step
talk Elder Silvervein##15558
accept Silvervein the Elder##8642 |goto Loch Modan/0 33.33,46.55
step
talk Elder Bronzebeard##15871
accept Bronzebeard the Elder##8866 |goto Ironforge/0 29.19,17.06
step
talk Elder Goldwell##15569
accept Goldwell the Elder##8653 |goto Dun Morogh/0 46.82,51.61
step
talk Elder Ironband##15567
accept Ironband the Elder##8651 |goto Searing Gorge/0 21.29,79.11
step
talk Elder Dawnstrider##15585
accept Dawnstrider the Elder##8683 |goto Burning Steppes/0 64.45,24.06
step
Cross the bridge |goto Burning Steppes/0 76.12,38.03 < 10 |only if walking
talk Elder Rumblerock##15557
accept Rumblerock the Elder##8636 |goto Burning Steppes/0 82.20,46.48
step
talk Elder Stormbrow##15565
accept Stormbrow the Elder##8649 |goto Elwynn Forest/0 39.79,63.67
step
talk Elder Hammershout##15562
accept Hammershout the Elder##8646 |goto Stormwind City/0 21.44,53.91
step
talk Elder Skychaser##15577
|tip Upstairs inside the tower.
accept Skychaser the Elder##8675 |goto Westfall/0 56.63,47.08
step
talk Elder Bellowrage##15563
accept Bellowrage the Elder##8647 |goto Blasted Lands/0 58.75,51.70
step
talk Elder Starglade##15596
accept Starglade the Elder##8716 |goto Stranglethorn Vale/0 53.12,18.48
step
talk Elder Winterhoof##15576
accept Winterhoof the Elder##8674 |goto Stranglethorn Vale/0 27.62,74.25
step
talk Elder Windtotem##15582
accept Windtotem the Elder##8680 |goto The Barrens/0 62.65,36.74
step
talk Elder Moonwarden##15597
accept Moonwarden the Elder##8717 |goto The Barrens/0 51.40,30.68
step
talk Elder High Mountain##15588
accept High Mountain the Elder##8686 |goto The Barrens/0 45.11,57.88
step
talk Elder Bloodhoof##15575
accept Bloodhoof the Elder##8673 |goto Mulgore/0 48.40,53.43
step
Ride the elevator up |goto Thunder Bluff/0 31.75,65.87 < 10 |walk
talk Elder Proudhorn##15580
|tip On Elder Rise.
accept Proudhorn the Elder##8678 |goto Thunder Bluff/0 72.99,23.37
step
talk Elder Grimtotem##15581
accept Grimtotem the Elder##8679 |goto Feralas/0 76.71,37.90
step
talk Elder Mistwalker##15587
|tip In the pit.
accept Mistwalker the Elder##8685 |goto Feralas/0 62.56,31.08
step
talk Elder Bladesing##15599
accept Bladesing the Elder##8719 |goto Silithus/0 48.97,37.66
step
talk Elder Primestone##15570
accept Primestone the Elder##8654 |goto Silithus/0 23.08,11.84
step
talk Elder Thunderhorn##15583
accept Thunderhorn the Elder##8681 |goto Un'Goro Crater/0 50.37,76.16
step
talk Elder Ragetotem##15573
accept Ragetotem the Elder##8671 |goto Tanaris/0 36.30,80.54
step
talk Elder Dreamseer##15586
accept Dreamseer the Elder##8684 |goto Tanaris/0 51.47,27.85
step
talk Elder Morningdew##15604
accept Morningdew the Elder##8724 |goto Thousand Needles/0 79.20,77.05
step
talk Elder Skyseer##15584
accept Skyseer the Elder##8682 |goto Thousand Needles/0 45.42,50.08
step
talk Elder Darkhorn##15579
accept Darkhorn the Elder##8677 |goto Orgrimmar/0 41.11,33.82
step
talk Elder Runetotem##15572
accept Runetotem the Elder##8670 |goto Durotar/0 53.24,43.65
step
talk Elder Skygleam##15600
accept Skygleam the Elder##8720 |goto Azshara/0 72.53,85.08
step
talk Elder Stonespire##15574
accept Stonespire the Elder##8672 |goto Winterspring/0 61.45,37.76
step
talk Elder Brightspear##15606
accept Brightspear the Elder##8726 |goto Winterspring/0 55.62,43.66
step
talk Elder Nightwind##15603
accept Nightwind the Elder##8723 |goto Felwood/0 37.72,53.01
step
talk Elder Riversong##15605
accept Riversong the Elder##8725 |goto Ashenvale/0 35.55,48.91
step
talk Elder Starweave##15601
accept Starweave the Elder##8721 |goto Darkshore/0 36.81,46.75
step
talk Elder Bladeswift##15598
accept Bladeswift the Elder##8718 |goto Darnassus/0 33.47,14.33
step
talk Elder Bladeleaf##15595
accept Bladeleaf the Elder##8715 |goto Teldrassil/0 57.33,60.79
step
talk Elder Wildmane##15578
|tip She is located inside Zul'Farak near the pool that spawns Gaz'Rilla.
|tip You will need to run this dungeon with a group.
accept Wildmane the Elder##8676
step
talk Elder Splitrock##15556
|tip He is located inside Mauradon near the east exit beyond Rotgrip.
|tip He is at the top of a path at the end of the tunnel.
|tip You will need to run this dungeon with a group.
accept Splitrock the Elder##8635
step
talk Elder Starsong##15593
|tip Take the path on the left after entering Sunken Temple.
|tip Go up the spiral staircase and go left again to the large round room.
|tip The elder is in the rear of the alcove on the left.
|tip You will need to run this dungeon with a group.
accept Starsong the Elder##8713
step
talk Elder Morndeep##15549
|tip He is located in the middle of the Ring of Law in Blackrock Depths.
|tip Talking to him will start the event.
|tip You will need to run this dungeon with a group.
accept Morndeep the Elder##8619
step
talk Elder Stonefort##15560
|tip He is located on the left side after crossing the first rope brige in Hordemar City on the way to Omokk in Lower Blackrock Spire.
|tip You will need to run this dungeon with a group.
accept Stonefort the Elder##8644
step
talk Elder Farwhisper##15607
|tip He is located in Stratholme on the Service Entrance (Scarlet) side.
|tip Go left after entering the instance and through the plague rat gate and he will be on the right side.
|tip You will need to run this dungeon with a group.
accept Farwhisper the Elder##8727
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Love is in the Air\\Love is in the Air Quests",{
description="\nThis guide will assist you in completing the quests for the \"Love is in the Air\" event.",
condition_end=function() return completedq(9029) end,
hardcore = true,
},[[
step
talk Fenstad Argyle##16108
accept Dangerous Love##8904 |goto Undercity 66.68,44.70
step
talk Innkeeper Norman##6741
buy 1 Love Token##21815 |goto Undercity 67.75,37.88 |q 8904
buy 1 Cologne Bottle##21833 |goto Undercity 67.75,37.88 |q 8904
buy 1 Perfume Bottle##21829 |goto Undercity 67.75,37.88 |q 8904
step
use the Cologne Bottle##21833
use the Perfume Bottle##21829
Apply Perfume or Cologne |complete hasbuff(26681) or hasbuff(26682) |q 8904
|tip Perfume allows you to give Love Tokens to male NPCs.
|tip Cologne allows you to give Love Tokens to female NPCs.
step
talk Undercity Guardian##5624
|tip Talk to those with a heart above their head.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Undercity##22157
use the Pledge of Friendship: Undercity##22163
collect 1 Guardian's Moldy Card##22145 |q 8904
step
talk Fenstad Argyle##16108
turnin Dangerous Love##8904 |goto Undercity 66.68,44.70
accept Fenstad's Hunch##8979 |goto Undercity 66.68,44.70
step
Run down the ramp |goto Undercity 52.81,77.72
talk Apothecary Zinge##5204
|tip Inside the building.
turnin Fenstad's Hunch##8979 |goto Undercity 50.15,67.98
accept Zinge's Assessment##8980 |goto Undercity 50.15,67.98
step
talk Fenstad Argyle##16108
turnin Zinge's Assessment##8980 |goto Undercity 66.68,44.70
accept Tracing the Source##8982 |goto Undercity 66.68,44.70
step
talk Innkeeper Norman##6741
turnin Tracing the Source##8982 |goto Undercity 67.75,37.88
accept Tracing the Source##8983 |goto Undercity 67.75,37.88
step
talk Mara Rennick##16109
|tip She walks around this area.
turnin Tracing the Source##8983 |goto Undercity 70.66,29.23
accept The Source Revealed##8984 |goto Undercity 70.66,29.23
step
Follow the path up |goto Hillsbrad Foothills 75.50,24.00
Enter the cave |goto Hillsbrad Foothills 77.70,19.40
Run up the hill |goto Alterac Mountains 84.30,84.30
Follow the path up |goto Alterac Mountains 86.10,25.30
talk Apothecary Staffron Lerent##16107
turnin The Source Revealed##8984 |goto Alterac Mountains 89.50,75.50
step
click Fragrant Cauldron
accept A Bubbling Cauldron##9029 |goto Alterac Mountains 89.60,75.70
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Love is in the Air\\Gift Giving",{
description="\nThis guide will assist you in completing the \"Gift Giving\" quest for the \"Love is in the Air\" event.",
hardcore = true,
},[[
step
label "Begin_Guide"
talk Innkeeper Gryshka##6929
|tip Inside the building.
buy 10 Love Token##21815 |goto Orgrimmar 54.10,68.39
buy 1 Cologne Bottle##21833 |goto Orgrimmar 54.10,68.39
buy 1 Perfume Bottle##21829 |goto Orgrimmar 54.10,68.39
step
label "Apply_Perfume_or_Cologne_Orgrimmar"
use the Cologne Bottle##21833
use the Perfume Bottle##21829
Apply Perfume or Cologne |complete hasbuff(26681) or hasbuff(26682)
|tip Perfume allows you to give Love Tokens to male NPCs.
|tip Cologne allows you to give Love Tokens to female NPCs.
step
Talk to Orgrimmar NPCs
|tip Talk to guards around Orgrimmar who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Orgrimmar##22156
use the Pledge of Friendship: Orgrimmar##22161
collect 5 Pledge of Loyalty: Orgrimmar##22123 |goto Orgrimmar 55.92,61.11 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22123) < 5 |next "Apply_Perfume_or_Cologne_Orgrimmar" |or
step
Talk to Orgrimmar NPCs
|tip Talk to guards around Orgrimmar who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Orgrimmar##22156
use the Pledge of Friendship: Orgrimmar##22161
collect 5 Grunt's Card##22142 |goto Orgrimmar 55.92,61.11 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22142) < 5 |next "Apply_Perfume_or_Cologne_Orgrimmar" |or
step
Talk to non-guard NPCs
|tip Talk to NPCs who aren't guards around Orgrimmar who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Gift of Adoration: Orgrimmar##21981
use the Gift of Friendship: Orgrimmar##22170
collect 5 Freshly Baked Pie##22175 |goto Orgrimmar 55.92,61.11 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22175) < 5 |next "Apply_Perfume_or_Cologne_Orgrimmar" |or
step
use the Pledge of Loyalty: Orgrimmar##22123
collect 1 Orgrimmar Pledge Collection##22294
step
use the Grunt's Card##22142
collect 1 Package of Cards##22293
step
use the Freshly Baked Pie##22175
collect 1 Box of Fresh Pies##22292
step
use the Orgrimmar Pledge Collection##22294
collect 1 Orgrimmar Gift Collection##22136
step
label "Apply_Perfume_or_Cologne_Thunder_Bluff"
use the Cologne Bottle##21833
use the Perfume Bottle##21829
Apply Perfume or Cologne |complete hasbuff(26681) or hasbuff(26682)
|tip Perfume allows you to give Love Tokens to male NPCs.
|tip Cologne allows you to give Love Tokens to female NPCs.
step
Talk to Thunder Bluff guard NPCs
|tip Talk to guards around Thunder Bluff who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Thunder Bluff##22158
use the Pledge of Friendship: Thunder Bluff##22162
collect 5 Pledge of Loyalty: Thunder Bluff##22122 |goto Thunder Bluff 43.21,58.70 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22122) < 5 |next "Apply_Perfume_or_Cologne_Thunder_Bluff" |or
step
Talk to Thunder Bluff guard NPCs
|tip Talk to guards around Thunder Bluff who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Thunder Bluff##22158
use the Pledge of Friendship: Thunder Bluff##22162
collect 5 Bluffwatcher's Card##22144 |goto Thunder Bluff 43.21,58.70 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22144) < 5 |next "Apply_Perfume_or_Cologne_Thunder_Bluff" |or
step
Talk to non-guard NPCs
|tip Talk to NPCs who aren't guards around Thunder Bluff who have hearts over their heads.
Select _"Here, I'd like to give you this token of my love."_
use the Gift of Adoration: Thunder Bluff##21980
use the Gift of Friendship: Thunder Bluff##22168
collect 5 Freshly Picked Flowers##22177 |goto Thunder Bluff 43.21,58.70 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22177) < 5 |next "Apply_Perfume_or_Cologne_Thunder_Bluff" |or
step
use the Pledge of Loyalty: Thunder Bluff##22122
collect 1 Thunder Bluff Pledge Collection##22297
step
use the Bluffwatcher's Card##22144
collect 1 Satchel of Cards##22295
step
use the Freshly Picked Flowers##22177
collect 1 Basket of Flowers##22296
step
use the Thunder Bluff Pledge Collection##22297
collect 1 Thunder Bluff Gift Collection##22135
step
label "Apply_Perfume_or_Cologne_Undercity"
use the Cologne Bottle##21833
use the Perfume Bottle##21829
Apply Perfume or Cologne |complete hasbuff(26681) or hasbuff(26682)
|tip Perfume allows you to give Love Tokens to male NPCs.
|tip Cologne allows you to give Love Tokens to female NPCs.
step
Talk to Undercity guard NPCs
|tip Talk to guards around Undercity who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Undercity##22157
use the Pledge of Friendship: Undercity##22163
collect 5 Pledge of Loyalty: Undercity##22121 |goto Undercity 68.07,44.10 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22121) < 5 |next "Apply_Perfume_or_Cologne_Undercity" |or
step
Talk to Undercity guard NPCs
|tip Talk to guards around Undercity who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Pledge of Adoration: Undercity##22157
use the Pledge of Friendship: Undercity##22163
collect 5 Guardian's Moldy Card##22145 |goto Undercity 68.07,44.10 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22145) < 5 |next "Apply_Perfume_or_Cologne_Undercity" |or
step
Talk to non-guard NPCs
|tip Talk to NPCs who aren't guards around Undercity who have hearts over their heads.
|tip If you run out of Love Tokens, talk to the nearest Innkeeper to purchase more.
Select _"Here, I'd like to give you this token of my love."_
use the Gift of Adoration: Undercity##22166
use the Gift of Friendship: Undercity##22172
collect 5 Romantic Poem##22174 |goto Undercity 68.07,44.10 |or
'|complete not hasbuff(26681) and not hasbuff(26682) and itemcount (22174) < 5 |next "Apply_Perfume_or_Cologne_Undercity" |or
step
use the Pledge of Loyalty: Undercity##22121
collect 1 Undercity Pledge Collection##22300
step
use the Guardian's Moldy Card##22145
collect 1 Sheaf of Cards##22299
step
use the Romantic Poem##22174
collect 1 Book of Romantic Poems##22298
step
use the Undercity Pledge Collection##22300
collect 1 Undercity Gift Collection##22134
step
use the Orgrimmar Gift Collection##22136
collect 1 Horde Gift Collection##22263
step
Choose the faction leader you would like to vote for:
|tip Turning in this quest in a capital city votes for that leader.
Sylvanas Windrunner |confirm |next "Vote_Sylvanas_Windrunner"
Thrall |confirm |next "Vote_Thrall"
Cairne Bloodhoof |confirm |next "Vote_Cairne_Bloodhoof"
step
label "Vote_Sylvanas_Windrunner"
Enter the tunnel |goto Undercity 51.86,64.75 < 20 |walk
talk Kwee Q. Peddlefeet##16075
accept Gift Giving##8981 |goto Undercity 55.20,89.96 |next "Final_Step"
step
label "Vote_Thrall"
Enter the building |goto Orgrimmar 40.28,36.93 < 20 |walk
talk Kwee Q. Peddlefeet##16075
|tip Inside the building.
accept Gift Giving##8981 |goto Orgrimmar 32.57,36.80 |next "Final_Step"
step
label "Vote_Cairne_Bloodhoof"
talk Kwee Q. Peddlefeet##16075
|tip Inside the building.
accept Gift Giving##8981 |goto Orgrimmar 38.11,80.50
step
label "Final_Step"
You completed the Gift Giving quest
Click Here to Complete it Again |confirm |next "Begin_Guide"
]])
ZygorGuidesViewer:RegisterGuide("Events Guides\\Midsummer Fire Festival\\Midsummer Fire Festival Quests",{
condition_end=function() return completedq(9339) end,
description="\nComplete the following Midsummer Fire Festival event quests:\n\nThe Festival of Fire\n"..
"Flickering Flames in the Eastern Kingdoms\nFlickering Flames in Kalimdor\nWild Fires in \n"..
"Eastern Kingdoms\nWild Fires in Kalimdor\nA Light in Dark Places\nStealing the Darnassus's\n"..
" Flame\nStealing Stormwind's Flame\nStealing Ironforge's Flame\nA Thief's Reward\n\n"..
"|cffff0000NOTE:|r You will need to be at least level 50 to fully complete this guide.",
hardcore = true,
},[[
step
talk Festival Talespinner##16818
accept The Festival of Fire##9368 |goto Orgrimmar 42.53,34.61
accept Flickering Flames in the Eastern Kingdoms##9389 |goto Orgrimmar 42.53,34.61
accept Flickering Flames in Kalimdor##9388 |goto Orgrimmar 42.53,34.61
step
talk Festival Flamekeeper##16788
accept Wild Fires in the Eastern Kingdoms##9323 |goto Orgrimmar 42.63,34.31
accept Wild Fires in Kalimdor##9322 |goto Orgrimmar 42.63,34.31
accept A Light in Dark Places##9319 |goto Orgrimmar 42.63,34.31 |only if level >= 50
step
click Flame of Orgrimmar
Touch the Flame of Orgrimmar |q 9368/1 |goto Orgrimmar 42.32,34.33
step
click Flame of Azshara
Touch the Flame of Azshara |q 9322/1 |goto Azshara 41.44,43.07
step
click Flame of Winterspring
Touch the Flame of Winterspring |q 9322/4 |goto Winterspring 30.72,43.04
step
click Flame of Darkshore
Touch the Flame of Darkshore |q 9388/3 |goto Darkshore 41.54,90.61
step
Wait for the boat |goto Darkshore 33.23,40.13
Ride the Boat to Teldrassil |goto Teldrassil 54.86,96.72 < 50 |c |noway |q 9388
|tip
Click Here to Skip this Step |confirm
|tip You will have to pass Alliance guards and will become flagged for PvP.
step
click Flame of Darnassus
accept Stealing Darnassus's Flame##9332 |goto Teldrassil 56.63,92.32
|tip
Click Here to Skip this Step |confirm
|tip This step requires you to enter the opposing faction's capital city
|tip If skipped, you will not be able to complete this quest or the "A Thief's Reward" quest.
|only if level >= 50
step
click Flame of Ashenvale
Touch the Flame of Ashenvale |q 9388/1 |goto Ashenvale 64.75,71.61
step
click Flame of Stonetalon
Touch the Flame of Stonetalon |q 9388/4 |goto Stonetalon Mountains 59.54,72.41
step
click Flame of Thunder Bluff
Touch the Flame of Thunder Bluff |q 9368/2 |goto Thunder Bluff 21.30,26.68
step
click Flame of Dire Maul
|tip Inside Dire Maul North, at the top of the staircase following Guard Slip'kik.
|tip You will need the Crescent Key from Dire Maul East to enter the dungeon.
|tip You can also have another player let you in.
Touch the Flame of Dire Maul |q 9319/1 |goto Kalimdor 43.39,66.52
|tip
Click Here to Skip this Dungeon Step |confirm
|tip If skipped, you will not be able to complete the "A Light in Dark Places" quest.
|only if haveq(9319) or completedq(9319)
step
click Flame of Silithus
Touch the Flame of Silithus |q 9322/2 |goto Silithus 78.08,18.90
step
click Flame of Un'Goro
Touch the Flame of Un'Goro |q 9322/3 |goto Un'Goro Crater 70.34,75.99
step
click Flame of the Barrens
Touch the Flame of the Barrens |q 9388/2 |goto The Barrens 59.82,39.27
step
Wait for the boat |goto The Barrens 63.67,38.62
Ride the Boat to Booty Bay |goto Stranglethorn Vale 25.86,73.11 < 50 |c |noway |q 9388
step
click Flame of the Blasted Lands
Touch the Flame of the Blasted Lands |q 9323/1 |goto Blasted Lands 54.01,31.28
step
click Flame of Westfall
Touch the Flame of Westfall |q 9389/3 |goto Westfall 33.99,80.26
step
click Flame of Stormwind
accept Stealing Stormwind's Flame##9330 |goto Stormwind City 38.84,61.44
|tip
Click Here to Skip this Step |confirm
|tip This step requires you to enter the opposing faction's capital city
|tip If skipped, you will not be able to complete this quest or the "A Thief's Reward" quest.
|only if level >= 50
step
click Flame of Searing Gorge
Touch the Flame of Searing Gorge |q 9323/4 |goto Searing Gorge 33.05,73.03
step
Enter Blackrock Mountain |goto Searing Gorge 34.75,84.02 < 10 |walk
Run up the chain |goto Eastern Kingdoms 48.74,63.79 < 10 |walk
Jump down |goto Eastern Kingdoms 48.77,63.67 < 10 |walk
Jump down |goto Eastern Kingdoms 48.89,63.87 < 5 |walk
click Flame of Blackrock Spire
|tip Inside Lower Blackrock Spire on Urok Doomhowl's platform.
Touch the Flame of Blackrock Spire |q 9319/2 |goto Eastern Kingdoms 48.95,63.88
|tip
Click Here to Skip this Dungeon Step |confirm
|tip If skipped, you will not be able to complete the "A Light in Dark Places" quest.
|only if haveq(9319) or completedq(9319)
step
click Flame of Ironforge
accept Stealing Ironforge's Flame##9331 |goto Ironforge 64.24,25.21
|tip
Click Here to Skip this Step |confirm
|tip This step requires you to enter the opposing faction's capital city
|tip If skipped, you will not be able to complete this quest or the "A Thief's Reward" quest.
|only if level >= 50
step
click Flame of the Wetlands
Touch the Flame of the Wetlands |q 9389/4 |goto Wetlands 51.19,16.98
step
click Flame of Hillsbrad
Touch the Flame of Hillsbrad |q 9389/1 |goto Hillsbrad Foothills 54.48,33.89
step
click Flame of Silverpine
Touch the Flame of Silverpine |q 9389/2 |goto Silverpine Forest 54.11,69.74
step
click Flame of the Undercity
Touch the Flame of the Undercity |q 9368/3 |goto Undercity 66.05,36.31
step
click Flame of the Hinterlands
Touch the Flame of the Hinterlands |q 9323/3 |goto The Hinterlands 62.03,53.41
step
click Flame of Scholomance
|tip Inside The Viewing Room with Marduk Blackpool and Vectus.
|tip You will need The Key to Scholomance to enter the dungeon.
|tip You will also need the Viewing Room Key dropped by Rattlegore to enter the Viewing Room.
|tip You can also have another player let you in.
Touch the Flame of Scholomance |q 9319/4 |goto Eastern Kingdoms 52.75,26.41
|tip
Click Here to Skip this Dungeon Step |confirm
|tip If skipped, you will not be able to complete the "A Light in Dark Places" quest.
|only if haveq(9319) or completedq(9319)
step
click Flame of the Plaguelands
Touch the Flame of the Plaguelands |q 9323/2 |goto Eastern Plaguelands 57.50,72.55
step
click Flame of Stratholme
|tip On the live side, just before entering the Scarlet Crusade compound.
Touch the Flame of Stratholme |q 9319/3 |goto Eastern Kingdoms 55.12,17.36
|tip
Click Here to Skip this Dungeon Step |confirm
|tip If skipped, you will not be able to complete the "A Light in Dark Places" quest.
|only if haveq(9319) or completedq(9319)
step
talk Festival Talespinner##16818
turnin The Festival of Fire##9368 |goto Orgrimmar 56.58,92.29
turnin Stealing Darnassus's Flame##9332 |goto Orgrimmar 56.58,92.29 |only if readyq(9332) or completedq(9332)
turnin Stealing Stormwind's Flame##9330 |goto Orgrimmar 56.58,92.29 |only if readyq(9330) or completedq(9330)
turnin Stealing Ironforge's Flame##9331 |goto Orgrimmar 56.58,92.29 |only if readyq(9331) or completedq(9331)
step
talk Festival Talespinner##16818
accept A Thief's Reward##9339 |goto Orgrimmar 56.58,92.29
|only if completedallq(9332,9330,9331)
step
talk Festival Flamekeeper##16788
turnin Flickering Flames in the Eastern Kingdoms##9389 |goto Orgrimmar 56.55,91.98
turnin Flickering Flames in Kalimdor##9388 |goto Orgrimmar 56.55,91.98
turnin Wild Fires in the Eastern Kingdoms##9323 |goto Orgrimmar 56.55,91.98
turnin Wild Fires in Kalimdor##9322 |goto Orgrimmar 56.55,91.98
turnin A Light in Dark Places##9319 |goto Orgrimmar 56.55,91.98 |only if readyq(9319) or completedq(9319)
step
_Congratulations!_
You Completed the "Midsummer Fire Festival" Event.
]])
