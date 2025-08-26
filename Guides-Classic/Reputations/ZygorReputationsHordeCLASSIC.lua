local ZygorGuidesViewer=ZygorGuidesViewer
if not ZygorGuidesViewer then return end
if UnitFactionGroup("player")~="Horde" then return end
if ZGV:DoMutex("ReputationsHCLASSIC") then return end
ZygorGuidesViewer.GuideMenuTier = "CLA"
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Bloodsail Buccaneers",{
},[[
step
_NOTE:_
About Bloodsail Buccaneers Reputation
|tip To {o}increase your reputation{} with the {o}Bloodsail Buccaneers{}, you {o}must be at War with Booty Bay{} and the {o}Steamwheedle Cartel{}.
|tip You can {o}increase your reputation{} with the {o}Steamwheedle Cartel{} afterwards, but it's a {o}long grind{}.
|tip Make sure you are {o}ready to be at war{} with the {o}goblins{} for some time.
|tip It takes around {o}2300 Booty Bay Guard kills{} to get enough rep to unlock the {o}Bloodsail Outfit and Admiral Hat{}, then {o}thousands more{} to regain {o}Booty Bay{} reputation.
Best Time to Grind
|tip If you are {o}not in a hurry{}, the {o}best time{} to grind this reputation is {o}New Year's Eve{}.
|tip The {o}Booty Bay goblins{} will be {o}drunk{} and {o}won't fight back{}.
Click Here to Continue |confirm
step
_NOTE:_
Go to War with Booty Bay
|tip Press {o}U{} to open your reputation panel.
|tip Select the {o}Booty Bay{} reputation, and mark the {o}At War{} checkbox.
Click Here to Continue |confirm
step
kill Booty Bay Bruiser##4624+
|tip This is the {o}safest location{} to grind if you are {o}solo{}.
|tip There are {o}4 patrolling guards{} that you can {o}kill one at a time{}.
|tip If you kill the {o}patrolling guards quickly{}, go inside the {o}Blacksmithing Houses{} and {o}attack civilians{} to {o}spawn more guards{}.
|tip To get the {o}Admiral's Hat{}, you must be {o}Hated with Booty Bay{}.
|tip You {o}can't keep{} both {o}reputations Friendly{} at the {o}same time{}.
Reach Hated Reputation with Booty Bay |complete rep('Booty Bay') == Hated |goto Stranglethorn Vale/0 28.77,74.70
Reach Friendly Reputation with the Bloodsail Buccaneers Faction |complete rep('Bloodsail Buccaneers') == Friendly |goto Stranglethorn Vale/0 28.77,74.70
step
talk "Pretty Boy" Duncan##2545
|tip He gets {o}killed for a quest{}.
|tip If he's {o}not here{}, wait for him to {o}respawn{}.
accept Avast Ye, Scallywag##1036 |goto Stranglethorn Vale/0 27.60,69.60
step
talk Fleet Master Firallon##2546
|tip Inside the ship, on the {o}middle floor{}.
|tip You must be {o}Hated with Booty Bay{}.
accept Dressing the Part##9272 |goto Stranglethorn Vale/0 30.60,90.60
turnin Avast Ye, Scallywag##1036 |goto Stranglethorn Vale/0 30.60,90.60
accept Avast Ye, Admiral!##4621 |goto Stranglethorn Vale/0 30.60,90.60
step
kill Baron Revilgaz##2496 |q 4621/1 |goto Stranglethorn Vale/0 27.12,76.97
kill Fleet Master Seahorn##2487 |q 4621/2 |goto Stranglethorn Vale/0 27.12,76.97
|tip On the {o}top floor{} of the building, {o}outside{} on the {o}balcony{}.
step
talk Fleet Master Firallon##2546
|tip Inside the ship, on the {o}middle floor{}.
turnin Avast Ye, Admiral!##4621 |goto Stranglethorn Vale/0 30.60,90.60
step
Congratulations!
|tip You {o}unlocked{} all of the {o}rewards{} for the {o}Bloodsail Buccaneer{} faction.
|tip There are {o}no rewards{} for reaching {o}Exalted{} reputation with the {o}Bloodsail Buccaneer{} faction.
|tip Click the {o}line below{} to begin {o}repairing{} your {o}reputaiton{} with the {o}Steamwheedle Cartel{}.
Load the Steamwheedle Cartel Guide |loadguide "Reputation\\Steamwheedle Cartel"
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Brood of Nozdormu",{
},[[
step
_NOTE:_
About Brood of Nozdormu Reputation
|tip This {o}reputation{} can be {o}earned{} by running the {o}Ahn'Qiraj raid (40 man){}.
Click Here to Continue |confirm
step
_Inside the Ahn'Qiraj Raid:_
Kill enemies throughout the raid
|tip You will {o}collect items{} that can be {o}turned in for Brood of Nozdormu reputation{}.
|tip {o}Don't turn them in{} until you reach {o}at least 2999/3000 Neutral{} reputation.
|tip {o}Killing enemies{} in the raid {o}gives reputation{} until that point, so it's best to {o}save the items{} until later.
collect Ancient Qiraji Artifact##21230+ |n
|tip {o}Any enemies{} can drop these.
collect Qiraji Lord's Insignia##21229+ |n
|tip {o}Bosses{} drop these.
Reach _2999/3000 Neutral_ Reputation with Brood of Nozdormu |complete repval('Brood of Nozdormu','Neutral') >= 2999
step
_Inside the Ahn'Qiraj Raid:_
use the Ancient Qiraji Artifact##21230+
|tip Accept the {o}Secrets of the Qiraji{} quest.
talk Andorgos##15502
|tip Turn in the {o}repeatable quest{}.
|tip {o}Repeat this process{} until you have no more {o}Ancient Qiraji Artifacts{}.
Click Here to Continue |confirm
|only if not rep('Brood of Nozdormu') == Exalted
step
talk Kandrostrasz##15503
accept Mortal Champions##8579
|only if not completedq(8579)
step
talk Kandrostrasz##15503
turnin Mortal Champions##8579
|only if not completedq(8579)
step
label "Collect_Rep_items"
_Inside the Ahn'Qiraj Raid:_
Kill enemies throughout the raid
|tip You will {o}collect items{} that can be {o}turned in for Brood of Nozdormu reputation{}.
collect Ancient Qiraji Artifact##21230+ |n
|tip {o}Any enemies{} can drop these.
collect Qiraji Lord's Insignia##21229+ |n
|tip {o}Bosses{} drop these.
Click Here to Continue |confirm
|only if not rep('Brood of Nozdormu') == Exalted
step
_Inside the Ahn'Qiraj Raid:_
use the Ancient Qiraji Artifact##21230+
|tip Accept the {o}Secrets of the Qiraji{} quest.
talk Andorgos##15502
|tip Turn in the {o}repeatable quest{}.
|tip {o}Repeat this process{} until you have no more {o}Ancient Qiraji Artifacts{}.
Click Here to Continue |confirm
|only if not rep('Brood of Nozdormu') == Exalted
step
talk Kandrostrasz##15503
|tip Accept and turn in the {o}Mortal Champions{} quest.
|tip This is a {o}repeatable quest{}.
|tip You {o}must have{} a {o}Qiraji Lord's Insignia{} item to be {o}able to complete{} this quest.
Click Here to Continue |confirm
|only if not rep('Brood of Nozdormu') == Exalted
step
Routing Guide	|complete rep('Brood of Nozdormu') < Exalted	|or	|next "Collect_Rep_items"
Routing Guide	|complete rep('Brood of Nozdormu') == Exalted	|or	|next "Exalted"
step
label "Exalted"
Reach Exalted Reputation with the Brood of Nozdormu Faction |complete rep('Brood of Nozdormu') == Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Cenarion Circle",{
},[[
_NOTE:_
About Cenarion Circle Reputation
|tip You can gain reputation {o}two ways{}.
|tip Killing enemies inside the {o}Ahn'Qiraj raid (20 man){} or killing {o}Twilight Cultists in Silithus{}.
|tip The {o}Ahn'Qiraj (20 man){} method takes roughly {o}3 months{} to reach {o}Exalted{}.
|tip The {o}Silithus method is much faster{}, and is the method this guide uses.
Click Here to Continue |confirm
step
Kill Twilight enemies around this area
|tip {o}Group up{} with nearby players, if you can, to {o}make the grind easier{}.
collect Encrypted Twilight Text##20404+ |n
|tip {o}Save{} any of these you find, you will {o}turn them in later{}.
Reach Honored Reputation with the Cenarion Circle Faction |complete rep("Cenarion Circle") >= Honored |goto Silithus/0 66.60,17.80
You can find more around: |notinsticky
[26.80,34.60]
[40.20,44.60]
[20.40,85.60]
step
talk Bor Wildmane##15306
accept Secret Communication##8318 |goto Silithus 48.57,37.78
step
Kill Twilight enemies around this area
|tip {o}Group up{} with nearby players, if you can, to {o}make the grind easier{}.
collect 10 Encrypted Twilight Text##20404 |q 8318/1 |goto Silithus/0 66.60,17.80
You can find more around: |notinsticky
[26.80,34.60]
[40.20,44.60]
[20.40,85.60]
step
talk Bor Wildmane##15306
turnin Secret Communication##8318 |goto Silithus 48.57,37.78
step
_NOTE:_
Complete Quests in Silithus
|tip At this point, {o}quests in Silithus{} are a {o}reliable source of reputation{}.
|tip Use the {o}Silithus leveing guide{} to accomplish this.
Click Here to Continue |confirm
|only if not rep('Cenarion Circle') == Exalted
step
Kill Twilight enemies around this area
|tip {o}Group up{} with nearby players, if you can, to {o}make the grind easier{}.
collect Encrypted Twilight Text##20404+ |n
|tip You can turn in {o}stacks of 10{} for reputation.
|tip Each {o}stack of 10{} is worth {o}100 reputation{} until Exalted. |only if not Human
|tip Each {o}stack of 10{} is worth {o}110 reputation{} until Exalted. |only if Human
|tip You can {o}buy these from the Auction House{}, if you {o}have gold{} and want to {o}save time{}.
Reach Exalted Reputation with the Cenarion Circle Faction |complete rep("Cenarion Circle") >= Exalted |goto Silithus/0 66.60,17.80
You can find more around: |notinsticky
[26.80,34.60]
[40.20,44.60]
[20.40,85.60]
|tip
Turn in Encrypted Twilight Texts to Bor Wildmane at [Silithus 48.57,37.78]
|tip He offers an {o}Encrypted Twilight Texts{} quest that is {o}repeatable{}.
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Gelkis & Magram Centaur Clans",{
},[[
step
About Centaur Clans Reputation
|tip There are  {o}two centaur clans{} you can earn reputation with: {o}Gelkis Clan Centaur{} and {o}Magram Clan Centaur{}.
|tip You can only {o}earn reputation{} with {o}one clan at a time{}.
|tip The {o}maximum reputation{} with each is {o}Revered{}, and there are {o}no reputation rewards{}, so it's {o}personal preference{}.
Choose Your Clan
|tip Click the {o}line below{} for the {o}clan you want{} to earn reputation with.
Gelkis Clan Centaur	|confirm	|or	|next "Gelkis"
Magram Clan Centaur	|confirm	|or	|next "Magram"
step
label "Gelkis"
Kill Magram enemies around this area
|tip They look like {o}centaurs{}.
Reach _11999/20000 Honored_ Reputation with the Glekis Clan Centaur Faction |complete repval('Gelkis Clan Centaur', 'Honored') >= 11999 |goto Desolace/0 70.90,75.30
step
talk Captain Pentigast##5396
accept Strange Alliance##1382 |goto Desolace 66.66,10.93
|only if Alliance
step
talk Gurda Wildmane##5412
accept Gelkis Alliance##1368 |goto Desolace 56.29,59.68
|only if Horde
step
talk Uthek the Wise##5397
turnin Strange Alliance##1382 |goto Desolace 36.23,79.25	|only if Alliance
turnin Gelkis Alliance##1368 |goto Desolace 36.23,79.25		|only if Horde
|next "Revered"
step
label "Magram"
Kill Gelkis enemies around this area
|tip They look like {o}centaurs{}.
Reach _11999/20000 Honored_ Reputation with the Magram Clan Centaur Faction |complete repval('Magram Clan Centaur', 'Honored') >= 11999 |goto Desolace/0 37.40,85.30
step
talk Captain Pentigast##5396
accept Brutal Politics##1385 |goto Desolace 66.66,10.93
|only if Alliance
step
talk Gurda Wildmane##5412
accept Magram Alliance##1367 |goto Desolace 56.29,59.68
|only if Horde
step
talk Warug##5398
turnin Brutal Politics##1385 |goto Desolace 74.97,68.16		|only if Alliance
turnin Magram Alliance##1367 |goto Desolace 74.97,68.16		|only if Horde
|next "Revered"
step
label "Revered"
Reach Exalted Reputation with the Gelkis Clan Centaur Faction |complete rep('Gelkis Clan Centaur') == Revered |only if rep('Gelkis Clan Centaur') == Revered
Reach Exalted Reputation with the Magram Clan Centaur Faction |complete rep('Magram Clan Centaur') == Revered |only if rep('Magram Clan Centaur') == Revered
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Hydraxian Waterlords",{
},[[
step
_NOTE:_
Attune to Molten Core
|tip Use the {o}Blackrock Depths{} dungeon guide to accomplish this.
Click Here to Continue |confirm
step
_Inside the Molten Core Raid:_
Kill enemies throughout the raid
|tip Use the {o}Molten Core{} raid guide to accomplish this.
|tip You will have to {o}clear the raid many times{}.
|tip You can only become {o}Exalted{} by killing the {o}Golemagg the Incinerator{} or {o}Ragnaros{} bosses.
|tip Otherwise, the {o}max{} reputation is {o}20999/21000 Revered{}.
Reach Exalted Reputation with the Hydraxian Waterlords Faction |complete rep('Hydraxian Waterlords') == Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Ravenholdt",{
},[[
step
_NOTE:_
About Ravenholdt Reputation
|tip You will have to {o}kill around 4200 enemies{} to reach _11,999/12,000 Honored_ reputation.
|tip After that, you will need to {o}collect roughly 1200 Heavy Junkboxes{}.
|tip You will need a {o}Rogue{} to {o}help you{} collect the boxes. |only if not Rogue
|tip There are {o}no rewards{} for this reputation.
Click Here to Continue |confirm
step
Kill Syndicate enemies around this area
|tip They look like {o}humans{}.
Reach _11,999/12,000 Honored_  Reputation with the Ravenholdt Faction |complete repval('Ravenholdt','Honored') >= 11999  |goto Arathi Highlands 27.10,30.60
You can find more around [Arathi Highlands 19.50,61.50]
step
_Inside the Blackrock Spire Dungeon:_
Find a Rogue to Help You
|tip Find a {o}Rogue{} to {o}pickpocket enemies{} inside the {o}Blackrock Spire{} dungeon.
|tip The {o}Rogue{} can {o}give you the Heavy Junkboxes{} they pickpocket.
|tip You can also try to {o}purchase Heavy Junkboxes{} in major city {o}Trade Chat{}, paying either {o}by mail or in person{}.
|tip The {o}Heavy Junkboxes{} need {o}at least 1 item{} left in them to count.
collect Heavy Junkbox##16885+ |n
|tip Every 5 junkboxes you turn in, you get 75 repututation.
Collect Enough Heavy Junkboxes to Reach Exalted |repcollect Heavy Junkbox##16885,5,75,Ravenholdt,Exalted
|tip This step will complete {o}when you have enough{}.
step
talk Fahrad##6707
|tip Upstairs in the building, {o}outside on the balcony{}.
|tip Complete the {o}Junkboxes Needed{} quest {o}repeatedly{}.
Reach Exalted Reputation with the Ravenholdt Faction |complete rep("Ravenholdt") >= Exalted |goto Alterac Mountains 84.45,80.32
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Steamwheedle Cartel",{
},[[
step
talk Zorbin Fandazzle##14637
accept Zapped Giants##7003 |goto Feralas 44.81,43.42
step
use Zorbin's Ultra-Shrinker##18904
|tip Use it on {o}Wave Striders{}.
|tip They look like {o}tall green giants{} that walk {o}on the shore{} and {o}in the water{}.
|tip This {o}quest item{} only lasts for {o}2 hours{}.
|tip If you {o}need a new one{}, {o}abandon{} the quest and {o}accept it again{} from the {o}goblin{} in the {o}previous guide step{}.
|tip The {o}water elementals{} nearby are {o}immune to frost damage{}.	|only if hardcore
kill Zapped Wave Strider##14638+
collect 15 Miniaturization Residue##18956 |q 7003/1 |goto Feralas 44.38,50.11
You can find more around: |notinsticky
[46.63,59.79]
[45.36,67.94]
[40.03,37.38]
[36.09,33.74]
step
talk Zorbin Fandazzle##14637
turnin Zapped Giants##7003 |goto Feralas 44.81,43.42
step
label "Again_With_The_Zapped_Giants"
talk Zorbin Fandazzle##14637
accept Again With the Zapped Giants##7725 |goto Feralas 44.81,43.42
|only if not rep("Steamwheedle Cartel") == Exalted
step
use Zorbin's Ultra-Shrinker##18904
|tip Use it on {o}Wave Striders{}.
|tip They look like {o}tall green giants{} that walk {o}on the shore{} and {o}in the water{}.
|tip This {o}quest item{} only lasts for {o}2 hours{}.
|tip If you {o}need a new one{}, {o}abandon{} the quest and {o}accept it again{} from the {o}goblin{} in the {o}previous guide step{}.
|tip The {o}water elementals{} nearby are {o}immune to frost damage{}.	|only if hardcore
kill Zapped Wave Strider##14638+
collect 10 Miniaturization Residue##18956 |q 7725/1 |goto Feralas 44.38,50.11
You can find more around: |notinsticky
[46.63,59.79]
[45.36,67.94]
[40.03,37.38]
[36.09,33.74]
|only if not rep("Steamwheedle Cartel") == Exalted
step
talk Zorbin Fandazzle##14637
turnin Again With the Zapped Giants##7725 |goto Feralas 44.81,43.42
|only if not rep('Steamwheedle Cartel') == Exalted
step
Routing Guide	|complete rep('Steamwheedle Cartel') < Exalted	|or	|next "Again_With_The_Zapped_Giants"
Routing Guide	|complete rep('Steamwheedle Cartel') == Exalted	|or	|next "Exalted"
step
label "Exalted"
Reach Exalted Reputation with the Steamwheedle Cartel Faction |complete rep('Steamwheedle Cartel') == Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Timbermaw Hold",{
},[[
step
_NOTE:_
About Timbermaw Hold Reputation
|tip We recommend working on Wintersaber Trainers reputation first (or alongside Timbermaw Hold reputation).
|tip You need to {o}grind thousands of Furbolgs{} for {o}Wintersaber Trainers{} reputation, which will {o}naturally raise your Timbermaw Hold reputation{}.
Click Here to Continue |confirm
step
talk Grazle##11554
accept Timbermaw Ally##8460 |goto Felwood 50.93,85.01
stickystart "Kill_Deadwood_Pathfinders"
stickystart "Kill_Deadwood_Gardeners"
step
kill 6 Deadwood Warrior##7153 |q 8460/1 |goto Felwood 48.32,92.99
|tip Be careful of {o}enemies grouped in camps{}, they {o}may attack together{}.	|only if hardcore
|tip {o}Deadwood Gardeners{} may {o}reduce the healing on you{}.			|only if hardcore
|tip {o}Deadwood Pathfinders{} are {o}ranged attackers{}.				|only if hardcore
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
label "Kill_Deadwood_Pathfinders"
kill 6 Deadwood Pathfinder##7155 |q 8460/2 |goto Felwood 48.32,92.99
|tip Be careful of {o}enemies grouped in camps{}, they {o}may attack together{}.	|only if hardcore |notinsticky
|tip {o}Deadwood Gardeners{} may {o}reduce the healing on you{}.			|only if hardcore |notinsticky
|tip {o}Deadwood Pathfinders{} are {o}ranged attackers{}.				|only if hardcore |notinsticky
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
label "Kill_Deadwood_Gardeners"
kill 6 Deadwood Gardener##7154 |q 8460/3 |goto Felwood 48.32,92.99
|tip Be careful of {o}enemies grouped in camps{}, they {o}may attack together{}.	|only if hardcore |notinsticky
|tip {o}Deadwood Gardeners{} may {o}reduce the healing on you{}.			|only if hardcore |notinsticky
|tip {o}Deadwood Pathfinders{} are {o}ranged attackers{}.				|only if hardcore |notinsticky
You can find more around: |notinsticky
[46.51,88.13]
[48.77,89.62]
step
talk Grazle##11554
turnin Timbermaw Ally##8460 |goto Felwood 50.93,85.02
accept Speak to Nafien##8462 |goto Felwood 50.93,85.02
step
talk Nafien##15395
|tip Up on the cliff, follow the road.
turnin Speak to Nafien##8462 |goto Felwood 64.77,8.13
accept Deadwood of the North##8461 |goto 64.77,8.13
stickystart "Kill_Deadwood_Avengers"
stickystart "Kill_Deadwood_Shamans"
step
kill 6 Deadwood Den Watcher##7156 |q 8461/1 |goto Felwood 63.08,8.82
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
label "Kill_Deadwood_Avengers"
kill 6 Deadwood Avenger##7157 |q 8461/2 |goto Felwood 63.08,8.82
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
label "Kill_Deadwood_Shamans"
kill 6 Deadwood Shaman##7158 |q 8461/3 |goto Felwood 63.08,8.82
You can find more around: |notinsticky
[60.37,8.40]
[60.18,6.14]
[62.67,12.48]
step
Kill Deadwood enemies around this area
|tip They look like {o}furbolgs{}.
Reach Unfriendly Reputation with the Timbermaw Hold Faction |complete rep('Timbermaw Hold') >= Unfriendly |goto Felwood/0 63.08,8.82
step
talk Nafien##15395
|tip Up on the cliff, follow the road.
|tip {o}Don't{} turn in any {o}Deadwood Headdress Feathers{} yet.
turnin Deadwood of the North##8461 |goto 64.77,8.13
accept Speak to Salfa##8465 |goto 64.77,8.13
step
Enter the tunnel to leave Felwood |goto Felwood 65.13,8.01 < 15 |only if walking |only if not zone("Winterspring")
Leave the tunnel to enter Winterspring |goto Felwood 68.40,5.84 < 15 |only if walking |only if not zone("Winterspring") |notravel
talk Salfa##11556
turnin Speak to Salfa##8465 |goto Winterspring 27.74,34.50
accept Winterfall Activity##8464 |goto Winterspring 27.74,34.50
stickystart "Kill_Winterfall_Ursas"
stickystart "Kill_Winterfall_Den_Watchers"
step
kill 8 Winterfall Shaman##7441 |q 8464/1 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.
step
label "Kill_Winterfall_Den_Watchers"
kill 8 Winterfall Den Watcher##7442 |q 8464/2 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.	|notinsticky
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.			|notinsticky
step
label "Kill_Winterfall_Ursas"
kill 8 Winterfall Ursa##7440 |q 8464/3 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.	|notinsticky
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.			|notinsticky
You may find more on top of the mountain ridge around [65.53,37.66]
step
talk Salfa##11556
turnin Winterfall Activity##8464 |goto Winterspring 27.74,34.50
step
use the Deadwood Ritual Totem##20741
accept Deadwood Ritual Totem##8470
|only if itemcount(20741) > 0
step
Enter the tunnel to leave Winterspring |goto Felwood 68.22,5.56 < 15 |only if walking |only if not zone("Felwood")
talk Kernda##11558
|tip He looks like a {o}grey furbolg{}.
|tip He walks around {o}inside the tunnel near this location{o} and the {o}tunnel leading north{}.
turnin Deadwood Ritual Totem##8470 |goto Felwood 65.37,2.42
|only if haveq(8470) or completedq(8470)
step
talk Nafien##15395
|tip Turn in any {o}Deadwood Headdress Feathers{} you have.
|tip He offers a {o}Feathers for Nafien{} quest that is {o}repeatable{}.
Turn In All of Your Deadwood Headdress Feathers |complete itemcount(21377) < 5
step
Kill Winterfall enemies around this area
|tip They look like {o}furbolgs{}.
collect Winterfall Spirit Beads##21383+ |n
|tip {o}Save{} any {o}Winterfall Spirit Beads{} you find.
|tip We will turn them in {o}after you reach Revered{} reputation.
Reach Revered Reputation with the Timbermaw Hold Faction |complete rep('Timbermaw Hold') >= Revered |goto Winterspring 67.30,36.36
You can find more around: |notinsticky
[Winterspring 40.56,43.08]
[Winterspring 31.54,37.12]
step
Kill Winterfall enemies around this area
|tip They look like {o}furbolgs{}.
collect Winterfall Spirit Beads##21383+ |n
|tip Every 5 beads you turn in, you get 50 repututation.
Collect Enough Winterfall Spirit Beads to Reach Exalted |repcollect Winterfall Spirit Beads##21383,5,50,Timbermaw Hold,Exalted |goto Winterspring 67.30,36.36
|tip This step will complete {o}when you have enough{}.
You can find more around: |notinsticky
[Winterspring 40.56,43.08]
[Winterspring 31.54,37.12]
step
talk Salfa##11556
|tip Turn in any {o}Winterfall Spirit Beads{} you have.
|tip He offers a {o}Beads for Salfa{} quest that is {o}repeatable{}.
Reach Exalted Reputation with the Timbermaw Hold Faction |complete rep("Timbermaw Hold") >= Exalted |goto Winterspring 27.74,34.50
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Thorium Brotherhood",{
},[[
step
_NOTE:_
About Thorium Brotherhood Reputation
|tip {o}Earning reputation{} with this faction can be {o}expensive{} or {o}very time consuming{}.
|tip {o}Most steps{} require use of the {o}Auction House{} or {o}grinding thousands of materials{}.
|tip {o}Honored to Exalted{} will need a {o}lot of gold{} or {o}help from a guild{}, as it requires {o}materials from Molten Core{}.
Click Here to Continue |confirm
step
talk Hansel Heavyhands##14627
accept Curse These Fat Fingers##7723 |goto Searing Gorge 38.57,27.80
accept Fiery Menace!##7724 |goto Searing Gorge 38.57,27.80
accept Incendosaurs? Whateverosaur is More Like It##7727 |goto Searing Gorge 38.57,27.80
step
talk Master Smith Burninate##14624
accept What the Flux?##7722 |goto Searing Gorge/0 38.77,28.50
step
click Wanted/Missing/Lost & Found##179827
accept STOLEN: Smithing Tuyere and Lookout's Spyglass##7728 |goto Searing Gorge 37.63,26.53
accept JOB OPPORTUNITY: Culling the Competition##7729 |goto Searing Gorge 37.63,26.53
stickystart "Collect_Smithing_Tuyere"
stickystart "Kill_Greater_Lava_Spiders"
stickystart "Kill_Heavy_War_Golems"
step
kill Dark Iron Lookout##8566+
|tip They are around the watch towers on the cliff surrounding the huge pit.
collect Lookout's Spyglass##18960 |q 7728/2 |goto Searing Gorge 33.03,53.44
You can find more around: |notinsticky
[Searing Gorge 35.40,59.82]
[Searing Gorge 43.47,63.52]
[Searing Gorge 52.47,57.97]
step
label "Collect_Smithing_Tuyere"
kill Dark Iron Steamsmith##5840+
|tip They have a roughly 5 minute respawn time.
|tip Work on the other quests around this area while waiting for them to respawn.
collect Smithing Tuyere##18959 |q 7728/1 |goto Searing Gorge 39.13,49.64
You can find more around [Searing Gorge 42.86,51.59]
step
label "Kill_Greater_Lava_Spiders"
kill 20 Greater Lava Spider##5858 |q 7724/1 |goto Searing Gorge 28.78,44.44
You can find more around: |notinsticky
[Searing Gorge 29.23,55.00]
[Searing Gorge 29.51,72.50]
step
label "Kill_Heavy_War_Golems"
kill 20 Heavy War Golem##5854 |q 7723/1	|goto Searing Gorge 32.42,49.43
You can find more around: |notinsticky
[Searing Gorge 37.02,42.98]
[Searing Gorge 47.99,38.64]
step
Jump down onto the metal walkway here |goto Searing Gorge 49.32,43.74 < 15 |only if walking
Enter the cave |goto Searing Gorge/0 49.58,45.49 < 15 |c
|only if not (subzone("The Slag Pit") and _G.IsIndoors())
step
Cross the bridge |goto Searing Gorge/0 44.45,37.35 < 20 |walk
click Secret Plans: Fiery Flux##179826
|tip It looks like an {o}unrolled scroll on a bench{}.
|tip Inside the cave.
|tip {o}Overseer Maltorius{} can be a {o}very deadly{} enemy, so you {o}may need help{} with this.
click Secret Plans: Fiery Flux##179826 |q 7722/1 |goto Searing Gorge/0 40.39,35.73
step
Jump down from the bridge inside the cave |goto Searing Gorge 47.73,41.92 < 15 |walk
kill 20 Incendosaur##9318 |q 7727/1 |goto Searing Gorge 51.73,37.16
|tip Inside the cave.
You can find more around: |notinsticky
[Searing Gorge 50.37,24.75]
[Searing Gorge 45.03,21.73]
step
Leave the cave |goto Searing Gorge 47.52,46.46 < 15 |walk |only if (subzone("The Slag Pit") and _G.IsIndoors())
talk Hansel Heavyhands##14627
turnin Curse These Fat Fingers##7723 |goto Searing Gorge 38.59,27.81
turnin Fiery Menace!##7724 |goto Searing Gorge 38.59,27.81
turnin Incendosaurs? Whateverosaur is More Like It##7727 |goto Searing Gorge 38.59,27.81
step
talk Taskmaster Scrange##14626
turnin STOLEN: Smithing Tuyere and Lookout's Spyglass##7728 |goto Searing Gorge 38.98,27.51
turnin JOB OPPORTUNITY: Culling the Competition##7729 |goto Searing Gorge 38.98,27.51
step
talk Master Smith Burninate##14624
turnin What the Flux?##7722 |goto Searing Gorge/0 38.77,28.50
step
Jump down onto the metal walkway here |goto Searing Gorge 49.32,43.74 < 15 |only if walking
Enter the cave |goto Searing Gorge/0 49.58,45.49 < 15 |c
|only if not (subzone("The Slag Pit") and _G.IsIndoors()) and rep('Thorium Brotherhood') < Friendly
step
Jump down from the bridge inside the cave |goto Searing Gorge 47.73,41.92 < 15 |walk
kill Incendosaur##9318+
|tip Inside the cave.
repcollect Incendosaur Scale##18944,2,25,Thorium Brotherhood,Friendly |goto Searing Gorge 51.73,37.16
|tip Inside the cave.
You can find more around: |notinsticky
[Searing Gorge 50.37,24.75]
[Searing Gorge 45.03,21.73]
|only if rep('Thorium Brotherhood') < Friendly
step
_NOTE:_
Farm or Buy Items
|tip You will be completing a {o}repeatable quest{} to reach {o}Friendly{} reputation.
|tip You will need to either {o}farm items{}, or {o}buy them from the Auction House{} to {o}save a lot of time{}.
Choose Which Item to Collect
|tip There are {o}3 options of items{} to {o}farm or buy{}.
|tip You {o}only need one{} of the items, so {o}pick the one{} you can get {o}cheapest and fastest{}.
|tip The items to choose from are:
repcollect Heavy Leather##4234,10,25,Thorium Brotherhood,Friendly	|or
repcollect Iron Bar##3575,4,25,Thorium Brotherhood,Friendly		|or
repcollect Kingsblood##3356,4,25,Thorium Brotherhood,Friendly		|or
|only if rep('Thorium Brotherhood') < Friendly
step
talk Master Smith Burninate##14624
|tip Buy the amount of {o}Coal{} you need to reach {o}Friendly{} reputation.
buy Coal##3857+ |n
repcollect Coal##3857,1,25,Thorium Brotherhood,Friendly |goto Searing Gorge 38.80,28.51
|only if rep('Thorium Brotherhood') < Friendly
step
talk Master Smith Burninate##14624
|tip Complete the {o}repeatable quest{} he offers that you {o}have the items for{}.
Reach Friendly Reputation with the Thorium Brotherhood Faction |complete rep ('Thorium Brotherhood') >= Friendly |goto Searing Gorge 38.80,28.51
step
repcollect Dark Iron Residue##18945,4,25,Thorium Brotherhood,Honored
|tip You can {o}collect{} these from {o}killing enemies{} in the {o}Blackrock Depths{} dungeon.
|tip You can also {o}buy it from the Auction House{}, and it's usually cheap{}.
|only if rep('Thorium Brotherhood') < Honored
step
talk Master Smith Burninate##14624
|tip Complete the {o}Gaining Acceptance{} quest {o}repeatedly{}.
Reach Honored Reputation with the Thorium Brotherhood Faction |complete rep ('Thorium Brotherhood') >= Honored |goto Searing Gorge 38.80,28.51
step
_NOTE:_
Farm or Buy Items
|tip You will be completing a {o}repeatable quest{} to reach {o}Exalted{} reputation.
|tip You will need to either {o}farm items{}, or {o}buy them from the Auction House{} to {o}save a lot of time{}.
Choose Which Item to Collect
|tip There are {o}5 options of items{} to {o}farm or buy{}.
|tip You {o}only need one{} of the items, so {o}pick the one{} you can get {o}cheapest and fastest{}.
|tip The items to choose from are:
repcollect Dark Iron Ore##11370,10,50,Thorium Brotherhood,Exalted		|or
repcollect Fiery Core##17010,1,200,Thorium Brotherhood,Exalted			|or
repcollect Lava Core##17011,1,200,Thorium Brotherhood,Exalted			|or
repcollect Blood of the Mountain##11382,1,200,Thorium Brotherhood,Exalted	|or
repcollect Core Leather##17012,2,150,Thorium Brotherhood,Exalted		|or
|only if rep('Thorium Brotherhood') < Exalted
step
_Inside the Blackrock Depths Dungeon:_
talk Lokhtos Darkbargainer##12944
|tip In the Grim Guzzler (bar area) inside {o}Blackrock Depths{}.
|tip Complete the {o}repeatable quest{} he offers that you {o}have the items for{}.
Reach Exalted Reputation with the Thorium Brotherhood Faction |complete rep ('Thorium Brotherhood') >= Exalted
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Wintersaber Trainers",{
},[[
step
_NOTE:_
About Wintersaber Trainers Reputation
|tip This is one of the {o}longest reputation grinds in the game{}, be prepared to {o}kill a lot of enemies{}.
Click Here to Continue |confirm
step
label "Accept_Frostsaber_Provisions"
talk Rivern Frostwind##10618
|tip On top of the huge rock.
accept Frostsaber Provisions##4970 |goto Winterspring 49.94,9.84
|tip You will complete this {o}quest repeatedly{} until you reach {o}1500/300 Neutral{} reputation.
|only if repval('Wintersaber Trainers','Neutral') < 1500
stickystart "Collect_Chillwind_Meat"
step
Kill Shardtooth enemies around this area
|tip They look like {o}bears{}.
|tip You can find them {o}all around this area{}.
collect 5 Shardtooth Meat##12622 |q 4970/1 |goto Winterspring 58.00,19.00
|tip We recommend being {o}solo{}, since the {o}item isn't shared{} amongst party members.
|only if haveq(4970)
step
label "Collect_Chillwind_Meat"
Kill Chillwind enemies around this area
|tip They look like {o}chimeras{}.
|tip You can find them {o}all around this area{}. |notinsticky
collect 5 Chillwind Meat##12623 |q 4970/2 |goto Winterspring 58.00,19.00
|tip We recommend being {o}solo{}, since the {o}item isn't shared{} amongst party members. |notinsticky
|only if haveq(4970)
step
talk Rivern Frostwind##10618
|tip On top of the huge rock.
turnin Frostsaber Provisions##4970 |goto Winterspring 49.94,9.84
|only if haveq(4970) or completedq(4970)
step
Routing Guide	|complete repval('Wintersaber Trainers','Neutral') < 1500	|or	|next "Accept_Frostsaber_Provisions"
Routing Guide	|complete repval('Wintersaber Trainers','Neutral') >= 1500	|or
step
talk Salfa##11556
accept Winterfall Activity##8464 |goto Winterspring 27.74,34.50
|only if rep('Wintersaber Trainers') < Exalted
stickystart "Kill_Winterfall_Ursas"
stickystart "Kill_Winterfall_Den_Watchers"
step
kill 8 Winterfall Shaman##7441 |q 8464/1 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.
|only if haveq(8464)
step
label "Kill_Winterfall_Den_Watchers"
kill 8 Winterfall Den Watcher##7442 |q 8464/2 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.	|notinsticky
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.			|notinsticky
|only if haveq(8464)
step
label "Kill_Winterfall_Ursas"
kill 8 Winterfall Ursa##7440 |q 8464/3 |goto Winterspring 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.	|notinsticky
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.			|notinsticky
You may find more on top of the mountain ridge around [65.53,37.66]
|only if haveq(8464)
step
talk Salfa##11556
turnin Winterfall Activity##8464 |goto Winterspring 27.74,34.50
|only if haveq(8464) or completedq(8464)
step
label "Accept_Winterfall_Intrusion_Or_Rampaging_Giants"
talk Rivern Frostwind##10618
|tip On top of the huge rock.
|tip {o}Choose the quest{} you want to complete.
accept Winterfall Intrusion##5201	|goto Winterspring 49.94,9.84		|or	|next "Winterfall_Intrusion"
|tip This is the {o}best repeatable quest{} to do until {o}Exalted{}.
|tip It's {o}fast{}, can be done in a {o}group{}, makes a {o}lot of gold{}, and gets {o}Timbermaw Hold reputation{} at the same time.
|tip Save any {o}Winterfall Prayer Beads{} you find, to turn in later for {o}Timbermaw Hold{} reputation. |only if rep("Timbermaw Hold") < Exalted
accept Rampaging Giants##5981		|goto Winterspring 49.94,9.84		|or	|next "Rampaging_Giants"
|tip If {o}Winterfell Village{} has {o}too many players{} trying to kill the same enemies, it {o}may be better{} to accept this quest.
|tip This quest is {o}slower and less efficient{}, and should {o}only{} be done as a {o}backup{}.
|tip The {o}giants are elite{} and you {o}may need a group{}.
|only if rep('Wintersaber Trainers') < Exalted
stickystart "Kill_Winterfall_Ursa_5201"
step
label "Winterfall_Intrusion"
kill 8 Winterfall Shaman##7441 |q 5201/1 |goto 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.
|only if haveq(5201)
step
label "Kill_Winterfall_Ursa_5201"
kill 8 Winterfall Ursa##7440 |q 5201/2 |goto 67.03,35.57
|tip They {o}share spawn points{} with the {o}other Winterfall enemies{}.	|notinsticky
|tip {o}Kill the other types{} also, to {o}get more to spawn{}.			|notinsticky
You may find more on top of the mountain ridge around [65.53,37.66]
|only if haveq(5201)
stickystart "Kill_Frostmaul_Preservers"
step
label "Rampaging_Giants"
kill 4 Frostmaul Giant##7428 |q 5981/1 |goto Winterspring 62.19,68.75
|tip They look like {o}rock giants{}.
|tip They can spawn {o}above and inside the canyon{}.
The path down into the canyon starts at [Winterspring 58.88,63.65]
|only if haveq(5981)
step
label "Kill_Frostmaul_Preservers"
kill 4 Frostmaul Preserver##7429 |q 5981/2 |goto Winterspring 62.19,68.75
|tip They look like {o}rock giants{}. |notinsticky
|tip They can spawn {o}above and inside the canyon{}. |notinsticky
The path down into the canyon starts at [Winterspring 58.88,63.65]
|only if haveq(5981)
step
label "Turnin_Quests"
talk Rivern Frostwind##10618
|tip On top of the huge rock.
turnin Winterfall Intrusion##5201 |goto Winterspring 49.94,9.84 |only if haveq(5201) or completedq(5201)
turnin Rampaging Giants##5981 |goto Winterspring 49.94,9.84 |only if haveq(5981) or completedq(5981)
|only if rep('Wintersaber Trainers') < Exalted
step
Routing Guide	|complete rep('Wintersaber Trainers') < Exalted		|or	|next "Accept_Winterfall_Intrusion_Or_Rampaging_Giants"
Routing Guide	|complete rep('Wintersaber Trainers') == Exalted	|or	|next "Exalted"
step
label "Exalted"
talk Rivern Frostwind##10618
|tip On top of the huge rock.
buy Reins of the Winterspring Frostsaber##13086 |goto Winterspring 49.94,9.84
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Darkspear Trolls",{
},[[
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
|tip You need to complete the {o}initial cloth quests{} to unlock the {o}repeatable Runecloth quest{}.
collect 60 Wool Cloth##2592		|q 7833		|future		|only if not completedq(7833)
collect 60 Silk Cloth##4306		|q 7834		|future		|only if not completedq(7834)
collect 60 Mageweave Cloth##4338	|q 7835		|future		|only if not completedq(7835)
collect 60 Runecloth##14047		|q 7836		|future		|only if not completedq(7836)
|only if not completedq(7833) and not completedq(7834) and not completedq(7835) and not completedq(7836)
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Wool##7833 |goto Orgrimmar 37.70,87.90 |instant
|only if not completedq(7833)
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Silk##7834 |goto Orgrimmar 37.70,87.90 |instant
|only if not completedq(7834)
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Mageweave##7835 |goto Orgrimmar 37.70,87.90 |instant
|only if not completedq(7835)
step
talk Vehena##14727
|tip Inside the building.
accept A Donation of Runecloth##7836 |goto Orgrimmar 37.70,87.90 |instant
|only if not completedq(7836)
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
repcollect Runecloth##14047,20,50,Darkspear Trolls,Exalted
|only if rep("Darkspear Trolls") < Exalted
step
talk Vehena##14727
|tip Inside the building.
|tip {o}Repeatedly complete the {o}Additional Runecloth{} quest.
Reach Exalted Reputation with the Darkspear Trolls Faction |complete rep("Darkspear Trolls") == Exalted |goto Orgrimmar 37.70,87.90
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Orgrimmar",{
},[[
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
|tip You need to complete the {o}initial cloth quests{} to unlock the {o}repeatable Runecloth quest{}.
collect 60 Wool Cloth##2592		|q 7826		|future		|only if not completedq(7826)
collect 60 Silk Cloth##4306		|q 7827		|future		|only if not completedq(7827)
collect 60 Mageweave Cloth##4338	|q 7831		|future		|only if not completedq(7831)
collect 60 Runecloth##14047		|q 7824		|future		|only if not completedq(7824)
|only if not completedq(7826) and not completedq(7827) and not completedq(7831) and not completedq(7824)
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Wool##7826 |goto Orgrimmar 63.60,51.23 |instant
|only if not completedq(7826)
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Silk##7827 |goto Orgrimmar 63.60,51.23 |instant
|only if not completedq(7827)
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Mageweave##7831 |goto Orgrimmar 63.60,51.23 |instant
|only if not completedq(7831)
step
talk Rashona Straglash##14726
|tip Inside the building.
accept A Donation of Runecloth##7824 |goto Orgrimmar 63.60,51.23 |instant
|only if not completedq(7824)
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
repcollect Runecloth##14047,20,50,Orgrimmar,Exalted
|only if rep("Orgrimmar") < Exalted
step
talk Rashona Straglash##14726
|tip Inside the building.
|tip {o}Repeatedly complete the {o}Additional Runecloth{} quest.
Reach Exalted Reputation with the Orgrimmar Faction |complete rep("Orgrimmar") == Exalted |goto Orgrimmar 63.60,51.23
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Thunder Bluff",{
},[[
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
|tip You need to complete the {o}initial cloth quests{} to unlock the {o}repeatable Runecloth quest{}.
collect 60 Wool Cloth##2592		|q 7820		|future		|only if not completedq(7820)
collect 60 Silk Cloth##4306		|q 7821		|future		|only if not completedq(7821)
collect 60 Mageweave Cloth##4338	|q 7822		|future		|only if not completedq(7822)
collect 60 Runecloth##14047		|q 7823		|future		|only if not completedq(7823)
|only if not completedq(7820) and not completedq(7821) and not completedq(7822) and not completedq(7823)
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Wool##7820 |goto Thunder Bluff 43.05,42.72 |instant
|only if not completedq(7820)
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Silk##7821 |goto Thunder Bluff 43.05,42.72 |instant
|only if not completedq(7821)
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Mageweave##7822 |goto Thunder Bluff 43.05,42.72 |instant
|only if not completedq(7822)
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
accept A Donation of Runecloth##7823 |goto Thunder Bluff 43.05,42.72 |instant
|only if not completedq(7823)
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
repcollect Runecloth##14047,20,50,Thunder Bluff,Exalted
|only if rep("Thunder Bluff") < Exalted
step
talk Rumstag Proudstrider##14728
|tip Inside the building.
|tip {o}Repeatedly complete the {o}Additional Runecloth{} quest.
Reach Exalted Reputation with the Thunder Bluff Faction |complete rep("Thunder Bluff") == Exalted |goto Thunder Bluff 43.05,42.72
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Undercity",{
},[[
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
|tip You need to complete the {o}initial cloth quests{} to unlock the {o}repeatable Runecloth quest{}.
collect 60 Wool Cloth##2592		|q 7813		|future		|only if not completedq(7813)
collect 60 Silk Cloth##4306		|q 7814		|future		|only if not completedq(7814)
collect 60 Mageweave Cloth##4338	|q 7817		|future		|only if not completedq(7817)
collect 60 Runecloth##14047		|q 7818		|future		|only if not completedq(7818)
|only if not completedq(7813) and not completedq(7814) and not completedq(7822) and not completedq(7818)
step
talk Ralston Farnsley##14729
accept A Donation of Wool##7813 |goto Undercity 71.66,29.23 |instant
|only if not completedq(7813)
step
talk Ralston Farnsley##14729
accept A Donation of Silk##7814 |goto Undercity 71.66,29.23 |instant
|only if not completedq(7814)
step
talk Ralston Farnsley##14729
accept A Donation of Mageweave##7817 |goto Undercity 71.66,29.23 |instant
|only if not completedq(7817)
step
talk Ralston Farnsley##14729
accept A Donation of Runecloth##7818 |goto Undercity 71.66,29.23 |instant
|only if not completedq(7818)
step
_NOTE:_
Farm or Buy Cloth
|tip {o}Farm{} the following {o}cloth{}, or purchase them from the {o}Auction House{}.
repcollect Runecloth##14047,20,50,Undercity,Exalted
|only if rep("Undercity") < Exalted
step
talk Ralston Farnsley##14729
|tip {o}Repeatedly complete the {o}Additional Runecloth{} quest.
Reach Exalted Reputation with the Undercity Faction |complete rep("Undercity") == Exalted |goto Undercity 71.66,29.23
]])
ZygorGuidesViewer:RegisterGuide("Reputation Guides\\Reputations\\Argent Dawn",{
description="Temp",
},[[
step
It Is Advised to Have a Dedicated Group For This
|tip The best rep farm by far is doing Stratholme and Scholomance.
|tip If you don't, the reputation grind is basically just killing mobs for Scourgestones.
|tip 800 Minion's Scourgestones is by default 1,000 reputation.
|tip 400 Invader's Scorgestones is by default 1,000 reputation.
|tip 40 Corrupted Scourgestones is by default 1,000 reputation.
|tip Without a group, you will be grinding enemies in the Plaguelands zones for Minion and Invader stones.
|tip Corrupted stones only come from bosses in dungeons.
|tip It is also advised to save any quests from the Argent Dawn that you haven't completed until Revered.
|tip You gain reputation from killing enemies in Stratholme and Scholomance until Honored, so it is recommended to save your Scourgestones until Honored.
Click Here to Continue |confirm |or
'|complete rep("Argent Dawn") == Exalted |next "Finish" |or
step
talk Argent Officer Garush##10839
accept Argent Dawn Commission##5503 |goto Tirisfal Glades 83.19,68.45 |instant |or
'|complete rep("Argent Dawn") >= Friendly |or
step
Equip the Argent Dawn Commission
|tip Wearing it will allow Scourgestones to drop from undead enemies in Eastern/Westernplaguelands, Scholomance and Stratholme.
Trade Rates for Argent Valor Token:
|tip You need 20 Minion's Scourgestones for 1.
|tip Minion's Scourgestones drop from undead enemies level 50 and up.
|tip You need 10 Invader's Scourgestones for 1.
|tip Invader's Scourgestones drop from undead enemies level 53 and up.
|tip You need 1 Corruptor's Scourgestone for 1.
|tip Corruptor's Scourgestone drops from undead bosses, typically found in Scholomance and Stratholme.
Gain the Argent Dawn Commission Buff |havebuff Argent Dawn Commission##17670 |or
'|complete rep("Argent Dawn") >= Friendly |or
stickystart "Equip_The_Argent_Dawn_Commission"
step
Kill Undead enemies around this area
collect Minion's Scourgestones##12840 |n
|tip You need 20 Minion's Scourgestones per turn in.
collect Invader's Scourgestones##12841 |n
|tip You need 10 Invader's Scourgestones per turn in.
|tip Save any Scourgestones you collect for later.
Reach Friendly Reputation with the Argent Dawn |complete rep("Argent Dawn") == Friendly |goto Western Plaguelands/0 36.97,57.26
You Can Find More Around:
[Western Plaguelands/0 46.55,53.24]
|tip Enemies at the above coordinates tend to be around level 52-54.
[Western Plaguelands/0 52.84,66.29]
|tip Enemies at the above coordinates tend to be around level 54-56.
[62.78,58.75]
|tip Enemies at the above coordinates tend to be around level 56-58.
step
Kill Undead enemies around this area
collect Minion's Scourgestones##12840 |n
|tip You need 20 Minion's Scourgestones per turn in.
collect Invader's Scourgestones##12841 |n
|tip You need 10 Invader's Scourgestones per turn in.
|tip Save any Scourgestones you collect for later.
Reach 3,000 Reputation into Friendly with the Argent Dawn |complete rep("Argent Dawn","Friendly") >= 3000 |goto Western Plaguelands/0 36.97,57.26
|tip Normal enemies stop giving reputation at this point.
You Can Find More Around:
[Western Plaguelands/0 46.55,53.24]
|tip Enemies at the above coordinates tend to be around level 52-54.
[Western Plaguelands/0 52.84,66.29]
|tip Enemies at the above coordinates tend to be around level 54-56.
[62.78,58.75]
|tip Enemies at the above coordinates tend to be around level 56-58.
step
label "Honor_Loop_Pre_11999"
Kill Undead enemies around this area
collect Minion's Scourgestones##12840 |n
|tip You need 20 Minion's Scourgestones per turn in.
collect Invader's Scourgestones##12841 |n
|tip You need 10 Invader's Scourgestones per turn in.
Reach Honored Reputation with the Argent Dawn |complete rep("Argent Dawn") == Honored |goto Western Plaguelands/0 36.97,57.26 |or
You Can Find More Around:
[Western Plaguelands/0 46.55,53.24]
|tip Enemies at the above coordinates tend to be around level 52-54.
[Western Plaguelands/0 52.84,66.29]
|tip Enemies at the above coordinates tend to be around level 54-56.
[62.78,58.75]
|tip Enemies at the above coordinates tend to be around level 56-58.
|tip If you have a group ready, you can also kill Elite Undead Enemies in the dungeons Scholomance and Stratholme for reputation.
Click Here When You're Ready to Turn-in |confirm |or
stickystop "Equip_The_Argent_Dawn_Commission"
step
talk Argent Officer Garush##10839
|tip Turn in all Scourgestone quests you can.
collect Argent Dawn Valor Token##12844 |n
use the Argent Dawn Valor Token##12844
|tip You'll get 25 rep per token.
Reach Honored Reputation with the Argent Dawn |complete rep("Argent Dawn") == Honored |goto Tirisfal Glades 83.19,68.45 |or
Click Here to Return to Farming |confirm |next "Honor_Loop_Pre_11999" |or
stickystart "Equip_The_Argent_Dawn_Commission"
step
label "Revered_Loop"
Kill Undead enemies around this area
collect Minion's Scourgestones##12840 |n
|tip You need 20 Minion's Scourgestones per turn in.
collect Invader's Scourgestones##12841 |n
|tip You need 10 Invader's Scourgestones per turn in.
Reach 11,999 Reputation into Honored with the Argent Dawn |complete rep("Argent Dawn","Honored") >= 11999 |goto Western Plaguelands/0 36.97,57.26 |or
|tip Elite enemies stop giving reputation at this point.
'|complete rep("Argent Dawn") == Revered |or
You Can Find More Around:
[Western Plaguelands/0 46.55,53.24]
|tip Enemies at the above coordinates tend to be around level 52-54.
[Western Plaguelands/0 52.84,66.29]
|tip Enemies at the above coordinates tend to be around level 54-56.
[62.78,58.75]
|tip Enemies at the above coordinates tend to be around level 56-58.
|tip If you have a group ready, you can also kill Elite Undead Enemies in the dungeons Scholomance and Stratholme for reputation.
Click Here When You're Ready to Turn-in |confirm |or
stickystop "Equip_The_Argent_Dawn_Commission"
step
talk Argent Officer Garush##10839
|tip Turn in all Scourgestone quests you can.
collect Argent Dawn Valor Token##12844 |n
use the Argent Dawn Valor Token##12844
|tip You'll get 25 rep per token.
Reach Revered Reputation with the Argent Dawn |complete rep("Argent Dawn") == Revered |goto Tirisfal Glades 83.19,68.45 |or
Click Here to Return to Farming |confirm |next "Revered_Loop" |or
step
At This Point, Only Scourgestones and Bosses From Dungeons Award Reputation
|tip Without a group, you will be grinding Scourgestones.
Click Here To Continue |confirm |or
'|complete rep("Argent Dawn") == Exalted |next "Finish" |or
stickystart "Equip_The_Argent_Dawn_Commission"
step
label "Exalted_Loop"
Kill Undead enemies around this area
collect Minion's Scourgestones##12840 |n
|tip You need 20 Minion's Scourgestones per turn in.
collect Invader's Scourgestones##12841 |n
|tip You need 10 Invader's Scourgestones per turn in.
Reach 11,999 Reputation into Honored with the Argent Dawn |complete rep("Argent Dawn","Honored") >= 11999 |goto Western Plaguelands/0 36.97,57.26 |or
|tip Elite enemies stop giving reputation at this point.
'|complete rep("Argent Dawn") == Revered |or
You Can Find More Around:
[Western Plaguelands/0 46.55,53.24]
|tip Enemies at the above coordinates tend to be around level 52-54.
[Western Plaguelands/0 52.84,66.29]
|tip Enemies at the above coordinates tend to be around level 54-56.
[62.78,58.75]
|tip Enemies at the above coordinates tend to be around level 56-58.
|tip If you have a group ready, enter Scholomance and Stratholme for Corrupted Scourgestones.
Reach Exalted Reputation with the Argent Dawn |complete rep("Argent Dawn") == Exalted |or
Click Here When You're Ready to Turn-in |confirm |or
stickystop "Equip_The_Argent_Dawn_Commission"
step
talk Argent Officer Garush##10839
|tip Turn in all Scourgestone quests you can.
collect Argent Dawn Valor Token##12844 |n
use the Argent Dawn Valor Token##12844
|tip You'll get 25 rep per token.
Reach Exalted Reputation with the Argent Dawn |complete rep("Argent Dawn") == Exalted |goto Tirisfal Glades 83.19,68.45 |or
Click Here to Return to Farming |confirm |next "Exalted_Loop" |or
step
label "Finish"
Congratulations!
You've Earned Exalted with the Argent Dawn Reputation
step
label "Equip_The_Argent_Dawn_Commission"
Equip the Argent Dawn Commission
|tip Wearing it will allow Scourgestones to drop from undead enemies in Eastern/Westernplaguelands, Scholomance and Stratholme.
Gain the Argent Dawn Commission Buff |havebuff Argent Dawn Commission##17670
]])
--@@
