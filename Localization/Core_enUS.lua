-- These are the main viewer's lines.
local addonName,ZGV = ...

local COLOR_TIP_MOUSE = "|cffddff00"
local COLOR_TIP_HINT = "|cff99ff00"
local COLOR_TIP = "|cff00ff00"
local COLOR_SUG_GUIDE = "|cffffcc40"
local DIR = "Interface\\AddOns\\"..addonName
local SHIFTCLICK = "<<Shift Click>>"

local ColorTalentName = "|cffffff88Z|cffffee66y|cffffdd44g|cffffcc22o|cffffbb00r |cffffaa00Talent A|cffffbb00d|cffffcc22v|cffffdd44i|cffffee66s|cffffff88o|cffffff88r|r"

ZygorGuidesViewer_L("Main", "enUS", function() 
	local f = {

-----------------------------------------------------------------------------------------------------------------
-- global -------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------

	MainFont = DIR.."\\Skins\\OpenSans.TTF",
	MainFontBold = DIR.."\\Skins\\OpenSansB.TTF",
	name = "|cfffe6100Zygor Guides Viewer|r",
	zgname = "|cfffe6100Zygor Guides|r",
	name_plain = "Zygor Guides Viewer",

-----------------------------------------------------------------------------------------------------------------
-- step goals ---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	["stepgoal_abandon"] = "Abandon %s and Other Quests",
	["stepgoal_accept"] = "Accept %s",
	["stepgoal_accept_done"] = "Accepted %s",
	["stepgoal_achieve"] = "Earn the '%s' Achievement",
	["stepgoal_achievesub"] = "Complete '%s' for Achievement '%s'",
	["stepgoal_achievetext"] = "For this Achievement, You Need to %s",
		--stepgoal_activepet
	["stepgoal_appearance"] = "Collect %s Appearance",
	["stepgoal_appearance_done"] = "Collected %s Appearance",
	["stepgoal_arrive"] = "Arrive at %s", -- used by stepgoal fly, unused
	["stepgoal_at"] = "Also at %s",
	["stepgoal_at_suff"] = " (%s)", -- used by goal:GetText to show coordinates
	["stepgoal_avoid"] = "Avoid %s",
	["stepgoal_buy #"] = "Buy %s %s",
	["stepgoal_buy #_done"] = "Bought %s %s",
	["stepgoal_buy"] = "Buy %s",
	["stepgoal_buy_done"] = "Bought %s",
	["stepgoal_cast"] = "Cast %s",
	["stepgoal_extraaction"] = "Cast %s",
	["stepgoal_click"] = "Click %s",
	["stepgoal_click_done"] = "Click %s",
	["stepgoal_click_around"] = "Click %s around this area",
	["stepgoal_clicknpc"] = "Click %s",
	["stepgoal_clicknpc_done"] = "Click %s",
	["stepgoal_clicknpc_around"] = "Click %s around this area",
	["stepgoal_collect #"] = "Collect %s %s",
	["stepgoal_collect #_done"] = "Collected %s %s",
	["stepgoal_collect"] = "Collect %s",
	["stepgoal_collect_done"] = "Collected %s",
		--stepgoal_condition
	["stepgoal_confirm"] = "Click Here to Proceed",
		--stepgoal_count
		--stepgoal_countremains
	["stepgoal_craft #"] = "Craft %s %s",
	["stepgoal_craft #_done"] = "Crafted %s %s",
	["stepgoal_craft"] = "Craft %s",
	["stepgoal_craft_done"] = "Crafted %s",
	["stepgoal_create #"] = "Create %d %s",
	["stepgoal_create"] = "Create %s",
		--stepgoal_debugvar
	["stepgoal_discover"] = "Discover %s%s", -- optional "the ",name
	["stepgoal_ding"] = "Reach Level %s",
	["stepgoal_ding_brief"] = "Reach Level %s",
	["stepgoal_earn #"] = "Earn %s %s",
	["stepgoal_earn #_done"] = "Earned %s %s",
	["stepgoal_earn_done"] = "Earned %s %s",
	["stepgoal_equipped"] = "Equip %s",
		--stepgoal_extraaction
	["stepgoal_farm #"] = "Gather %s %s",
	["stepgoal_farm #_done"] = "Gathered %s %s",
	["stepgoal_farm"] = "Gather %s",
	["stepgoal_farm_done"] = "Gathered %s",
	["stepgoal_ferry"] = "Discover the %s Ferry",
	["stepgoal_fly"] = "Fly to %s",
		--stepgoal_follower
	["stepgoal_fpath"] = "Discover the %s Flight Path",
	["stepgoal_fpath_done"] = "Discover the %s Ferry",
	["stepgoal_fpath_done"] = "Discover the %s Flight Path",
	["stepgoal_get #"] = "Collect %s %s",
	["stepgoal_get #_done"] = "Collected %s %s",
	["stepgoal_get"] = "Collect %s",
	["stepgoal_get_done"] = "Collected %s",
	["stepgoal_get_bank"] = " |cffffbbbb(%s in bank)|r",
	["stepgoal_getrune"] = "Collect %s Rune",
	["stepgoal_goal #"] = "%s %s",
	["stepgoal_goal #_done"] = "Done: %s %s",
	["stepgoal_goal"] = "%s",
	["stepgoal_goal_done"] = "Done: %s",
	["stepgoal_goldcollect #"] = "Collect %s %s",			-- no cap and > 0
	["stepgoal_goldcollect #_done"] = "Collected %s %s",	-- cap > 0.
	["stepgoal_goldcollect"] = "Collect %s",				-- no cap and 0
	["stepgoal_goldcollect_done"] = "Collected %s",		-- cap and cap = 1 or 0
	["stepgoal_goldtracker"] = "Estimated Gold Earned: %s",
		--stepgoal_goto
	["stepgoal_go to"] = "Go to %s", -- used by stepgoal goto
	["stepgoal_go to_leave"] = "Leave %s", -- used by stepgoal goto
	["stepgoal_gotonpc"] = "Find the Nearest %s",
	["stepgoal_havebuff"] = "Gain Buff/Debuff '%s'",
	["stepgoal_havebuilding_active"] = "Finish %s Level %s",
	["stepgoal_havebuilding_building"] = "Build %s Level %s",
	["stepgoal_havebuilding_ready"] = "Wait for %s Level %s to Build",
	["stepgoal_hearth to"] = "Hearth to %s", -- used by stepgoal hearth
	["stepgoal_home"] = "Make %s Inn Your Home",
	["stepgoal_image"] = "Click Here to View the Image",
		--stepgoal_info
	["stepgoal_invehicle"] = "Enter the Vehicle",
		--stepgoal_itemname
	["stepgoal_itemset"] = "Obtain %s %s",
	["stepgoal_itemset_done"] = "Obtained %s %s",
	["stepgoal_itemset_item"] = "Obtain %s Appereance",
	["stepgoal_itemset_item_done"] = "Obtained %s Appereance",
	["stepgoal_kill #"] = "Kill %s %s",
	["stepgoal_kill #_done"] = "Killed %s %s",
	["stepgoal_kill"] = "Kill %s",
	["stepgoal_kill_done"] = "Killed %s",
	["stepgoal_killboss"] = "Defeat %s",
	["stepgoal_killboss_done"] = "Defeated %s",
	["stepgoal_kill_around"] = "Kill %s around this area",
	["stepgoal_bosshp"] = "Reduce %s to %d%% HP",
	["stepgoal_learn"] = "Learn %s",
	["stepgoal_learnmount"] = "Earn the %s Mount",
	["stepgoal_learnpet"] = "Earn the %s Pet",
		--stepgoal_learnpetspell
	["stepgoal_learnspell"] = "Learn the %s Spell",
	["stepgoal_level"] = "Reach Level %s",
	["stepgoal_level_brief"] = "Reach Level %s",
	["stepgoal_level_exp"] = "Reach Level %s and %s XP",
	["stepgoal_level_exp_brief"] = "Reach Level %s and %s XP",
	["stepgoal_level_kill"] = " (%s Kill)",
	["stepgoal_level_kills"] = " (%s Kills)",
	["stepgoal_loadguide"] = "Click Here to Load %s|cffff8032\"%s\"|r Guide",
		--stepgoal_nexttab
		--stepgoal_noautoaccept
	["stepgoal_nobuff"] = "Lose Buff/Debuff '%s'",
	["stepgoal_noquest"] = "Make Sure %s Offers No Quests, or Click Here",
		--stepgoal_notinsticky
	["stepgoal_offtaxi"] = "Arrive at a Flight Point",
		--stepgoal_oncomplete
	["stepgoal_ontaxi"] = "Depart from the Flight Point",
	["stepgoal_outvehicle"] = "Leave the Vehicle",
	["stepgoal_perform_alchemy"] = "Create %s %s",
	["stepgoal_perform_first aid"] = "Create %s %s",
	["stepgoal_perform_enchanting"] = "Cast %s %s",
	["stepgoal_perform_blacksmithing"] = "Forge %s %s",
	["stepgoal_perform_engineering"] = "Construct %s %s",
	["stepgoal_perform_tailoring"] = "Sew %s %s",
	["stepgoal_perform_leatherworking"] = "Sew %s %s",
	["stepgoal_perform_mining"] = "Perform %s %s",
	["stepgoal_perform_inscription"] = "Inscribe %s %s",
	["stepgoal_perform_cooking"] = "Cook %s %s",
	["stepgoal_perform_jewelcrafting"] = "Craft %s %s",
	["stepgoal_petaction"] = "Use Pet Action %s",
	["stepgoal_petlevel"] = "Train %s Pet to Level %s",
	["stepgoal_phase"] = "You've reached the end of content that is currently available to complete for this guide. The game content beyond this point is gated and inaccessible until Blizzard makes another update to unlock additional content.",
	["stepgoal_phase_done"] = "Phase unlocked. Continuing the guide.",
		--stepgoal_petding
		--stepgoal_petspecies
		--stepgoal_playerchoice
	["stepgoal_playertitle"] = "Earn '%s' Title",
		--stepgoal_polish
		--stepgoal_q
		--stepgoal_quest
		--stepgoal_questchoice
	["stepgoal_rep"] = "Reach %s with %s",
	["stepgoal_collectrep_done"] = "Collected Enough %s to Reach %s with %s",
	["stepgoal_collectrep"] = "Collect %s %s to Reach %s with %s",

		--stepgoal_scenariobonus
		--stepgoal_scenarioend
	["stepgoal_scenariogoal #"] = "%s: %s",
	["stepgoal_scenariogoal #_done"] = "Done: %s %s",
	["stepgoal_scenariogoal"] = "%s",
	["stepgoal_scenariogoal_done"] = "Done: %s",
	["stepgoal_scenariogoal_unknown #"] = "Complete %d Scenario Goal(s)",
	["stepgoal_scenariogoal_unknown"] = "Complete a Scenario Goal",
	["stepgoal_scenariostage"] = "Complete Scenario Stage %d",
	["stepgoal_scenariostage_done"] = "Scenario Stage %d Completed",
	["stepgoal_scenariostage_named"] = "Complete Stage %d: %s",
	["stepgoal_scenariostart"] = "Begin %s Scenario",
	["stepgoal_scenariostart_unknown"] = "Begin the Scenario",
	["stepgoal_skill"] = "Achieve %s Level %s",
	["stepgoal_skillmax"] = "Learn %s Profession",
	["stepgoal_skillmax2"] = "Learn the %s Skill", -- pre bfa wording, not used
	["stepgoal_specialtalent"] = "Learn %s Skill from %s.",
	["stepgoal_specialtalentactive"] = "Activate %s Skill from %s.",
		--stepgoal_subzone
	["stepgoal_talk to"] = "Talk to %s", -- used by talk, talknpcs
	["stepgoal_talk to nearest"] = "Talk to the Nearest %s",	--alternative talknpcs text
	["stepgoal_talk_around"] = "Talk to %s around this area",
	["stepgoal_visit_city"] = "Go to the Nearest %s",
	["stepgoal_:"] = ": %s",
	["stepgoal_talk to_done"] = "Talked to %s", -- used by talk, talknpcs
	["stepgoal_visit_city"] = "Go to the Nearest %s",
	["stepgoal_toy"] = "Obtain %s Toy",
	["stepgoal_toy_done"] = "Obtained %s Toy",
	["stepgoal_trash #"] = "%1$s (%2$s)",
	["stepgoal_trash"] = "%1$s",
	["stepgoal_turn in"] = "Turn in %s",
	["stepgoal_turn in_done"] = "Turned in %s",
	["stepgoal_unequipped"] = "Unequip %s",
	["stepgoal_use"] = "Use %s",
	["stepgoal_userune"] = "Engrave %s Rune",
	["stepgoal_vendor"] = "Visit %s's Shop", 
	["stepgoal_vendor_done"] = "Visited %s's Shop", 
	["stepgoal_trainer"] = "Train with %s", 
	["stepgoal_trainer_done"] = "Trained with %s", 
		--stepgoal_walk
		--stepgoal_webheader
		--stepgoal_webimage
		--stepgoal_webinfo
		--stepgoal_worldquestqueue
		--stepgoal_zombiewalk



-----------------------------------------------------------------------------------------------------------------
-- item types ---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	-- Item types and subtypes
	["type_armor"] = C_Item.GetItemClassInfo(Enum.ItemClass.Armor),
		["subtype_armor_miscellaneous"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Generic),
		["subtype_armor_cloth"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Cloth),
		["subtype_armor_leather"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Leather),
		["subtype_armor_mail"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Mail),
		["subtype_armor_plate"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Plate),
		["subtype_armor_cosmetic"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Cosmetic),
		["subtype_armor_shields"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Shield),
		["subtype_armor_librams"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Libram),
		["subtype_armor_idols"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Idol),
		["subtype_armor_totems"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Totem),
		["subtype_armor_sigils"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Armor,Enum.ItemArmorSubclass.Sigil),

	["type_consumable"] = C_Item.GetItemClassInfo(Enum.ItemClass.Consumable) or "Consumable",
		["subtype_consumable_explosives_devices"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 0),
		["subtype_consumable_potion"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 1),
		["subtype_consumable_elixir"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 2),
		["subtype_consumable_flask"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 3),
		["subtype_consumable_food_drink"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 5),
		["subtype_consumable_bandage"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 7),
		["subtype_consumable_other"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 9),
		["subtype_consumable_vantous_runes"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 8),
		["subtype_consumable_item_enhancement"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 6), -- obsolete
		["subtype_consumable_scroll"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable, 4), -- obsolete
		--["subtype_consumable_consumable"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Consumable,)

	["type_container"] = C_Item.GetItemClassInfo(Enum.ItemClass.Container),
		["subtype_container_bag"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 0),
		["subtype_container_herb"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 2),
		["subtype_container_enchanting"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 3),
		["subtype_container_engineering"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 4),
		["subtype_container_gem"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 5),
		["subtype_container_mining"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 6),
		["subtype_container_leatherworking"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 7),
		["subtype_container_inscription"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 8),
		["subtype_container_fishing"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 9),
		["subtype_container_cooking"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Container, 10),

	["type_gem"] = C_Item.GetItemClassInfo(Enum.ItemClass.Gem),


	["type_key"] = C_Item.GetItemClassInfo(Enum.ItemClass.Key),
		["subtype_key_key"] = C_Item.GetItemClassInfo(Enum.ItemClass.Key),

	["type_miscellaneous"] = C_Item.GetItemClassInfo(Enum.ItemClass.Miscellaneous),
		["subtype_miscellaneous_junk"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.Junk),
		["subtype_miscellaneous_reagent"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.Reagent),
		["subtype_miscellaneous_pet"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.CompanionPet),
		["subtype_miscellaneous_holiday"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.Holiday),
		["subtype_miscellaneous_mount"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.Mount),
		["subtype_miscellaneous_other"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Miscellaneous, Enum.ItemMiscellaneousSubclass.Other),

	["type_money"] = "Money",
		-- Wowpedia does not list any subtypes for this type.

	["type_reagent"] = C_Item.GetItemClassInfo(Enum.ItemClass.Reagent),
		["subtype_reagent_reagent"] = C_Item.GetItemClassInfo(Enum.ItemClass.Reagent),

	["type_recipe"] = C_Item.GetItemClassInfo(Enum.ItemClass.Recipe),
		["subtype_recipe_book"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Book),
		["subtype_recipe_leatherworking"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Leatherworking),
		["subtype_recipe_tailoring"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Tailoring),
		["subtype_recipe_engineering"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Engineering),
		["subtype_recipe_blacksmithing"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Blacksmithing),
		["subtype_recipe_alchemy"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe,	 Enum.ItemRecipeSubclass.Alchemy),
		["subtype_recipe_enchanting"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Enchanting),
		["subtype_recipe_jewelcrafting"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Jewelcrafting),
		["subtype_recipe_inscription"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.Inscription),
		["subtype_recipe_cooking"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe,	 Enum.ItemRecipeSubclass.Cooking),
		["subtype_recipe_first_aid"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe, Enum.ItemRecipeSubclass.FirstAid),
		["subtype_recipe_fishing"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Recipe,	 Enum.ItemRecipeSubclass.Fishing),


	["type_quest"] = C_Item.GetItemClassInfo(Enum.ItemClass.Questitem),
		["subtype_quest_quest"] = C_Item.GetItemClassInfo(Enum.ItemClass.Questitem),

	["type_trade_goods"] = C_Item.GetItemClassInfo(Enum.ItemClass.Tradegoods),
		["subtype_trade_goods_cloth"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,5),
		["subtype_trade_goods_leather"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,6),
		["subtype_trade_goods_metal_stone"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,7),
		["subtype_trade_goods_cooking"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,8),
		["subtype_trade_goods_herb"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,9),
		["subtype_trade_goods_enchanting"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,12),
		["subtype_trade_goods_inscription"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,16),
		["subtype_trade_goods_jewelcrafting"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,4),
		["subtype_trade_goods_parts"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,1),
		["subtype_trade_goods_elemental"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,10),
		["subtype_trade_goods_other"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,11),

		["subtype_trade_goods_devices"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,3), --obsolete
		["subtype_trade_goods_explosives"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,2), --obsolete
		["subtype_trade_goods_item_enchantment"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,14), --obsolete
		["subtype_trade_goods_materials"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,13), --obsolete
		["subtype_trade_goods_meat"] = "Meat", --obsolete
		--["subtype_trade_goods_trade_goods"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Tradegoods,), --obsolete

	["type_weapon"] = C_Item.GetItemClassInfo(Enum.ItemClass.Weapon),
		["subtype_weapon_bows"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Bows),
		["subtype_weapon_crossbows"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Crossbow),
		["subtype_weapon_daggers"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Dagger),
		["subtype_weapon_guns"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Guns),
		["subtype_weapon_fishing_poles"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Fishingpole),
		["subtype_weapon_fist_weapons"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Unarmed),
		["subtype_weapon_miscellaneous"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Generic),
		["subtype_weapon_one_handed_axes"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Axe1H) ,
		["subtype_weapon_one_handed_maces"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Mace1H),
		["subtype_weapon_one_handed_swords"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Sword1H),
		["subtype_weapon_polearms"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Polearm),
		["subtype_weapon_staves"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Staff),
		["subtype_weapon_thrown"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Thrown),
		["subtype_weapon_two_handed_axes"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Axe2H),
		["subtype_weapon_two_handed_maces"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Mace2H),
		["subtype_weapon_two_handed_swords"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Sword2H),
		["subtype_weapon_wands"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Wand),
		["subtype_weapon_warglaves"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Weapon, Enum.ItemWeaponSubclass.Warglaive),

		-- Wowpedia: (for the purpose of [equipped: ] these can be used)
		["subtype_weapon_one_hand"] = "One-Hand",
		["subtype_weapon_two_hand"] = "Two-Hand",

	-- Not in Wowpedia, had to create this list.
	["type_glyph"]=C_Item.GetItemClassInfo(Enum.ItemClass.Glyph),
		["subtype_glyph_warrior"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,1),
		["subtype_glyph_paladin"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,2),
		["subtype_glyph_hunter"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,3),
		["subtype_glyph_rogue"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,4),
		["subtype_glyph_priest"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,5),
		["subtype_glyph_shaman"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,7),
		["subtype_glyph_mage"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,8),
		["subtype_glyph_warlock"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,9),
		["subtype_glyph_druid"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,11),
		["subtype_glyph_death_knight"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,6),
		["subtype_glyph_monk"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,10),
		["subtype_glyph_demon_hunter"] = C_Item.GetItemSubClassInfo(Enum.ItemClass.Glyph,12),
	--]=]

-----------------------------------------------------------------------------------------------------------------
-- additional itemscore patterns --------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	SPELL_DAMAGE_DONE_HOLY =   ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL1_CAP),
	SPELL_DAMAGE_DONE_FIRE =   ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL2_CAP),
	SPELL_DAMAGE_DONE_NATURE = ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL3_CAP),
	SPELL_DAMAGE_DONE_FROST =  ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL4_CAP),
	SPELL_DAMAGE_DONE_SHADOW = ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL5_CAP),
	SPELL_DAMAGE_DONE_ARCANE = ("Increases damage done by %s spells and effects by up to ([0-9]+)."):format(SPELL_SCHOOL6_CAP),

	SPELL_DAMAGE_DONE_HOLY2 =   "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL1_CAP)),
	SPELL_DAMAGE_DONE_FIRE2 =   "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL2_CAP)),
	SPELL_DAMAGE_DONE_NATURE2 = "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL3_CAP)),
	SPELL_DAMAGE_DONE_FROST2 =  "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL4_CAP)),
	SPELL_DAMAGE_DONE_SHADOW2 = "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL5_CAP)),
	SPELL_DAMAGE_DONE_ARCANE2 = "([+-]+)([0-9]+) "..(SINGLE_DAMAGE_TEMPLATE:format(SPELL_SCHOOL6_CAP)),

	SPELL_DAMAGE_DONE_HOLY3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL1_CAP,STAT_SPELLDAMAGE),
	SPELL_DAMAGE_DONE_FIRE3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL2_CAP,STAT_SPELLDAMAGE),
	SPELL_DAMAGE_DONE_NATURE3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL3_CAP,STAT_SPELLDAMAGE),
	SPELL_DAMAGE_DONE_FROST3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL4_CAP,STAT_SPELLDAMAGE),
	SPELL_DAMAGE_DONE_SHADOW3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL5_CAP,STAT_SPELLDAMAGE),
	SPELL_DAMAGE_DONE_ARCANE3 = ("([+-]+)([0-9]+) %s %s"):format(SPELL_SCHOOL6_CAP,STAT_SPELLDAMAGE),

	BLOCK =	"Increases your block rating by ([0-9]+).",
	BLOCK2 = "Increases your chance to block attacks with a shield by ([0-9]+)%%.",
	CRIT = "Increases your critical strike rating by ([0-9]+).",
	CRIT2 = "Improves your chance to get a critical strike by ([0-9]+)%%.",
	CRIT_SPELL = "Increases your spell critical strike rating by ([0-9]+).",
	CRIT_SPELL2 = "Improves your chance to get a critical strike with spells by ([0-9]+)%%.",
	DEFENSE_SKILL = "Increased Defense ([+-]+)([0-9]+).",
	DODGE = "Increases your chance to dodge an attack by ([0-9]+)%%.",
	FERAL_ATTACK_POWER = "([+-]+)([0-9]+) Attack Power in Cat, Bear, and Dire Bear forms only.",
	HIT = "Increases your hit rating by ([0-9]+).",
	HIT2 = "Improves your chance to hit by ([0-9]+)%%.",
	HIT_SPELL = "Increases your spell hit rating by ([0-9]+).",
	HIT_SPELL2 = "Improves your chance to hit with spells by ([0-9]+)%%.",
	PARRY = "Increases your chance to parry an attack by ([0-9]+)%%.",
	SPELL_HEAL_DAMAGE = "Increases damage and healing done by magical spells and effects by up to ([0-9]+).",
	SPELL_PENETRATION = "Increases your spell penetration by ([0-9]+).",
	SPELL_PENETRATION2 = "Decreases the magical resistances of your spell targets by ([0-9]+).",

-----------------------------------------------------------------------------------------------------------------
-- options ---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------


	opt_group_cover = "Executables",
		opt_execconfig = "Standalone Config",
		opt_options = "Show settings",
		opt_profiler = "Profiler (caution!)",
		opt_debug = "Debug mode",
		opt_debugflag = "Set debug flags",
		opt_debugflags = "Set debug flags",
		opt_show = "Show viewer",
		opt_hide = "Hide viewer",
		opt_detectpet = "Detect pet",
		opt_way = "Set a destination waypoint",
		opt_questid = "Search by quest id",
		opt_tabs_icon = "Use icons in tabs",
		opt_briefopentime = "Brief expansion delay",
		opt_briefclosetime = "Brief collapse delay",
		--opt_dispmodepri
		opt_share_masterslave = "Share guide step with Zygor Basic users",
		opt_share_masterslave_none = "Disabled",
		opt_share_masterslave_master = "Master (shares)",
		opt_share_masterslave_slave = "Slave (receives)",
		opt_enable_vendor_tools = "Enable Vendor Tools",
		opt_showgreyvalue = "Show value of grays",
		opt_autobuyframe = "Confirm before buying",
		opt_im_prefer_repair = "Only find repair vendors",
		opt_autotrackquests = "Automatically track guide quests [DEBUG]",
		opt_audiocues = "Audible direction cues",
		opt_minimapzoom = "Automatic minimap zooming",
		--opt_share_target

	opt_group_display = "Guide Viewer",
		opt_enable_viewer = "Enable Viewer",
		opt_windowlocked = "Lock viewer",
		opt_hidetracker = "Hide objective tracker",
		opt_hidetracker_desc = "Hide WoW quest objective tracker when Zygor is visible",
		opt_hideexptracker = "Hide experience bar",
		opt_hideexptracker_desc = "Hide WoW experience bar when Zygor is visible and set to show exp progress bar",
		opt_skinstyle = "Viewer skin:",
		opt_opacitytoggle = "Enable Transparency",
		opt_opacity = "Viewer opacity",
		opt_opacity_low = "Low",
		opt_opacity_high = "High",
		opt_opacitymenu = "Guide Menu opacity",
		opt_opacity_low = "Low",
		opt_opacity_high = "High",
		opt_framescale_s = "Viewer size:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_fontsize_s = "Font size:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_resizeup = "Flip viewer upside-down",
		opt_hideincombat = "Hide viewer during combat",
		opt_hideincombat_desc = "Hide all guide windows when entering combat, if your screen gets too cramped.",
		opt_hidebarincombat = "Hide Action Bar during combat",
		opt_repositionviewer = "Keep Viewer visible when interacting with vendor windows",
		opt_repositionviewer_desc = "Keep Viewer visible when interacting with vendor windows that guide instructs you to open",
		opt_progress = "Show progress bar",
		opt_showmapbutton = "Show Zygor button on mini-map",
		opt_resetwindow = "Reset windows",
		opt_widgets = "Zygor Widgets",
		opt_widgetfloatopacity = "Widgets opacity",
		opt_widgetfloatscale_s = "Widgets size",

	opt_group_stepdisplay = "Step Display",
		opt_showcountsteps = "Number of steps shown:",
		opt_showcountsteps_all = "All",
		opt_fixedheight = "Enable manual vertical step resizing",
		opt_header_skip_optional = "Optional goals:",
		opt_showvendor = "Show optional vendor steps",
		opt_showvendor_desc = "Additional steps will be shown suggesting you vendor items at optimized points in the guide.",
		opt_showtrainer = "Show optional trainer steps",
		opt_showtrainer_desc = "Additional steps will be shown suggesting you train spells at optimized points in the guide.",
		opt_skipoptional = "Skip optional goals",
		opt_showinlinetravel = "Show travel directions",
		opt_stepdisplay_dungeon = "Dungeons",
		opt_showallroles = "Show strategies for all roles",
		opt_showallroles_desc = "Displays dungeon boss strategies for all roles (DPS, tank, healer), not just yours.",
		opt_showallroles_descwarnnone = "|cffffa500Note:|r |cffffdd88 You don't have a group role assigned at this moment. Switching this option now won't have any apparent effect.",
		opt_showallroles = "Show strategies for all roles",
		opt_showallroles_desc = "Displays dungeon boss strategies for all roles (DPS, tank, healer), not just yours.",
		opt_skiphome = "Skip steps that require setting your hearthstone to a specific inn.",
		opt_skiptaxi = "Skip steps that point you to flightmasters to discover a new flight path.",

	opt_group_share = "Sync & Share",
		opt_sync_enabled = "Enable Sync & Share features",
		opt_sync_snap = "Sync party progress",
		opt_share_masterslave = "Share guide step with Zygor Basic users",
		opt_share_masterslave_none = "Disabled",
		opt_share_masterslave_master = "Master (shares)",
		opt_share_masterslave_slave = "Slave (receives)",

	opt_group_automation = "Automation",
		opt_header_automation_quests = "Quests",
		opt_autoacceptturnin = "Auto-accept and Turn-in guide quests",
		opt_autoacceptturninall = "All quests",
		opt_autoacceptturninall = "All quests",
		opt_autoacceptturninall_desc = "Auto-accept or turn in ANY quest encountered, even if not following a guide.",
		opt_header_automation_travel = "Travel",
		opt_autotaxi = "Automatically take suggested flight paths",
		opt_header_automation_inventory = "Inventory",
		opt_autobuy = "Automatically buy guide items",
		opt_showgreysellbutton = "Enable \"Sell Grays\" button",
		opt_autosell = "Automatically sell gray items",
		opt_autosellother = "Suggest items I can safely sell to vendors.",
		opt_autorepair = "Repair automatically",
		opt_autorepair_ownonly = "Auto-repair using my own money only",
		opt_autorepair_ownandguild = "Auto-repair using my own money if possible, otherwise use guild money",
		opt_autorepair_guildandown = "Auto-repair using guild money if possible, otherwise use my own money",
		opt_autorepair_manual = "Do not auto-repair",
		opt_autorepair_notinguild = "You are not currently in a guild.\nGuild repairs will not work, but you can still auto-repair using your own money.",
		opt_autorepair_nopermission = "Your current guild rank does not allow guild repairs.\nYou can still auto-repair using your own money.",
		opt_header_others = "Others",
		opt_autoskipcutscenes = "Auto-skip cutscenes",
		opt_autogossip = "Automatically select dialog options",

	opt_group_actionbuttons = "Action Buttons",
		opt_enable_actionbuttons = "Enable Action Buttons",
		opt_enable_actionbar = "Enable Action Bar",
		opt_actionbar_scale_s = "Action Bar Scale",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_actionbar_types_title = "Button types:",
		opt_actionbar_quest = "Quest actions",
		opt_actionbar_talk = "Talk to NPC",
		opt_actionbar_kill = "Kill enemy",
		opt_actionbar_trash = "Delete cheapest item from bags",
		opt_targetonclick = "Add raid marker to NPCs when selected with action buttons",

	opt_group_travelsystem = "Waypoint Arrow",
		opt_arrowshow = "Enable Waypoint Arrow",
		opt_arrowfreeze = "Lock arrow",
		opt_arrowalpha = "Opacity",
		opt_arrowscale_s = "Arrow size:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_arrowfontsize_s = "Arrow text size:",
		opt_framescale_s_small = "Small",
		opt_framescale_s_large = "Large",
		opt_arrowoutline = "Add outline to arrow text",
		opt_arrowskin = "Arrow style",
		opt_arrowskinselect = "Arrow style",
		opt_arrowunit = "Unit of measurement",
		opt_travelsystem_enable_title = "Travel System",
		opt_pathfinding = "Enable Travel System",
		opt_travelmethods_title = "Travel methods",
		opt_travelavoidportals = "Avoid portals",
		opt_travelusehs = "Use Hearthstones",
		opt_traveluseitems = "Use items",
		opt_travelusespells = "Use spells",
		opt_travelprefertaxi = "Prefer flight paths",
		opt_pathfinding_comfort = "Prefer relaxed routing",
		opt_pathfinding_comfort_desc = "Travel prefer methods with lower user interaction rather than ones where you must actively control your character. With this off, speed will be favored at all costs.",
		--opt_pathfinding_comfort = "Travel comfort preference",
		--opt_pathfinding_comfort_speed = "Speed",
		--opt_pathfinding_comfort_comfort = "Comfort",

		opt_travelmode = "Travel mode",
		opt_travelmode_1 = "Direct",
		opt_travelmode_1_desc = "This will disable all special modes of travel and directly beeline to your destination.",
		opt_travelmode_2 = "Simple",
		opt_travelmode_2_desc = "This will restrict the travel system to only using flights, ships, trams, zeppelins, select portals/items, and will prefer those methods of travel when available.",
		--opt_travelmode_3 = "Balanced",
		--opt_travelmode_3_desc = "This will use all available methods of travel (including spells, items) but prefer hands off methods of travel (like flight paths) when possible.",
		opt_travelmode_3 = "Advanced",
		opt_travelmode_3_desc = "This will try to reach your destination in the fastest way possible using all methods of travel. This may mean having you fly directly there on your mounts or using routes that seem strange. Only recommended for advanced users.",
		opt_travelmode_4 = "Custom",
		opt_travelmode_4_desc = "Manually mix and match travel options to create your own custom preset.",
		opt_travelprefertaxi = "Prefer flight paths",
		opt_travelprefertaxi_desc = "",
		opt_travelprefertaxi_pathfinding_comfort = "Try using single travel",
		opt_travelprefertaxi_pathfinding_comfort_desc = "",


	opt_group_maps = "Maps",
		opt_maps_general_title = "General Map Enhancements",
		opt_maplines_enabled = "Enable ant trails",
		opt_maplines = "Ant trail style:",
		opt_maplines_ants = "Ant trails",
		opt_maplines_solid = "Solid lines",
		opt_maps_world_title = "World Map Enhancements",
		opt_foglight = "Reveal entire map",
		opt_mapicons = "Show map markers",
		opt_poienabled = "Show points of interest",
		opt_poisize = "Points of Interest size",
		opt_framescale_s_small = "Small",
		opt_framescale_s_normal = "Normal",
		opt_framescale_s_large = "Large",
		opt_poialphatoggle = "Enable icon transparency",
		opt_poishow = "Points of Interest Types:",
		opt_poishow_rare = "Rare spawns",
		opt_poishow_rare = "Rare spawns",
		opt_poishow_rare_desc = "",
		opt_poishow_treasure = "Treasures",
		opt_poishow_treasure = "Treasures",
		opt_poishow_treasure_desc = "",
		opt_poitype = "Points of Interest Display Mode:",
		opt_poitype = "Points of Interest Display Mode:",
		opt_poitype_quick = "Quickly accessed",
		opt_poitype_complete = "Completionist Mode",
		opt_worldquestenable = "Enable Zygor World Quest Planner",
		opt_worldquestlocal = "Prioritize current zone world quests in queue",
		opt_worldquestlocal_desc = "All queued World Quests in current zone will be completed before moving to the next zone.",
		opt_worldquestmap = "Load World Quest guides when clicking World Quest icons",
		opt_maps_taxi_title = "Flight map",
		opt_highlighttaxi = "Highlight suggested flight paths",
		opt_maps_dungeon_title = "Dungeon Map Enhancements",
		opt_preview = "Enable Zygor Dungeon Map",
		opt_preview_desc = "Use Map Preview in dungeons.\nDisplays a customizable map to help with navigation due to addon limitations preventing use of the waypoint arrow inside dungeons.",
		opt_preview_scale = "Scale:",
		opt_preview_scale_small = "Small",
		opt_preview_scale_normal = "Medium",
		opt_preview_scale_full = "Full",
		opt_preview_alpha = "Opacity:",
		opt_preview_alpha_low = "Low",
		opt_preview_alpha_normal = "Medium",
		opt_preview_alpha_high = "High",
		opt_preview_duration = "Preview duration:",
		opt_preview_duration_perm = "No duration",
		opt_preview_duration_3 = "3s",
		opt_preview_duration_5 = "5s",
		opt_preview_duration_10 = "10s",
		opt_preview_control = "Preview control:",
		opt_preview_control_manual = "Manual",
		opt_preview_control_step = "Automatically activate on each step",
		opt_preview_control_stepnc = "Automatically activate on each step, hide in combat",

	opt_group_gear = "Gear",
		opt_gear_title = "Gear Advisor",
		opt_autogear = "Enable Gear Advisor",
		opt_autogear_desc = "This feature will suggest new item upgrades to equip when you obtain them.",
		opt_autogear_max = "Disable Gear Advisor on max level characters",
		opt_autogear_finder = "Enable Gear Finder",
		opt_autogear_finder_desc = "Adds a new tab to character panel that displays potential item upgrades you can obtain from dungeons.",
		opt_questitemselector = "Highlight recommended quest rewards",
		opt_autoselectitem = "Auto-select quest rewards",
		opt_autoselectitem_desc = "The suggested reward is selected for you. You'll still have to click 'Complete Quest', or enable automatic turn-ins in the Automation options.",
		opt_autogear_keepheirlooms = "Do not replace heirloom items",
		opt_autogearauto = "Auto-equip suggested gear upgrades",
		opt_itemscore_tooltips = "Enable Zygor Item Score Tooltips",
		opt_itemscore_tooltips_azerite = "Display Azerite Power info",
		opt_gear_sources = "Gear Finder:",
		opt_gear_sources_dungeons = "Dungeon sources",
		--opt_gear_1 -- uses blizzard system strings
		--opt_gear_2  -- uses blizzard system strings
		--opt_gear_23 -- uses blizzard system strings
		--opt_gear_24 -- uses blizzard system strings
		opt_gear_23_plus = "Mythic upgrade level",
		opt_gear_sources_raids = "Raid sources",
		--opt_gear_17 -- uses blizzard system strings
		--opt_gear_14 -- uses blizzard system strings
		--opt_gear_15 -- uses blizzard system strings
		--opt_gear_16 -- uses blizzard system strings
		opt_clearnotupgrades = "Clear declined items",
		opt_itemscore_ae_clearednotupgrade = "Cleared the items that were not upgrades previously.", -- printed message
		opt_markupgrades = "Highlight upgrades in bags",
		opt_upgradebest = "Type",
		opt_upgradeslot = "Slot",
		opt_upgrademarker = "Style",
		opt_autogearpopup = "Show popups for new upgrades",
		opt_badupgradehotkey = "Use a hotkey for reporting incorrect upgrade suggestions",
		opt_hotkey1 = "First key",
		opt_hotkey2 = "Second key (optional)",
		opt_hotclick = "Click",

	opt_group_itemscore = "Item Score",
		opt_itemscore_warning = "Here you can adjust the stat weights used by the Gear Advisor to suggest item upgrades.|nThis is an advanced feature so only adjust these values if you know what you're doing.",
		opt_gear_score_class = "Class",
		--opt_gear_selected_class -- displayed as empty string
		opt_gear_score_spec = "Specialisation",
		--opt_gear_selected_spec -- displayed as empty string
		opt_gear_maxGem = "Socket empty sockets:",
		opt_gear_maxGem_desc = "Zygor will score empty sockets using best gem available. Select maximum gem quality you want to use.",
		--opt_gear_selected_class -- displayed as empty string
		--opt_gear_selected_build -- displayed as empty string
		opt_gearshowallstats = "Show all stats",
		opt_gearimport = "Process data for %s %s",
		opt_gearexport = "Export",
		opt_gear_score_offspec = "Score offspec items for this spec",
		opt_gear_custom_active = "You are using customised settings",
		opt_gear_select_set_active = "You are using %s as your active build",
		opt_gear_select_set_inactive = "Click here to select %s as your active build",

	opt_group_gold = "Gold Guide",
		opt_goldimport = "Import",
		opt_gold_format = "Gold display format:",
		opt_gold_format = "Gold display format:",
		opt_gold_format_desc = "Change the way gold values are displayed within\n\nthe Gold and Auctions part of the Zygor Guides addon.",
		opt_gold_auctions_title = "Auction Tools",
		opt_auction_enable = "Enable Auction Tools",
		opt_autoscan = "Auto-scan when auction panel is opened",
		opt_quickscan = "Enable quicker scans (Caution)",
		opt_quickscan_desc = "Reduce scan times by excluding battle pets and gear variants.",
		opt_quickscan_warning = "Warning: You are using quicker scans method. \nIt reduces scan times, but excludes battle pets and gear variants.",
		opt_auction_autoshow_tab = "Default to Zygor Sell tab when opening Auction House panel.",
		opt_smartstack = "Enable smart stacks",
		opt_gold_ahscanintensity = "Auction scanning speed:",
		opt_gold_ahscanintensity_desc = "Too intense scans can overload the game's servers.\nIf you experience disconnections when performing a scan, lower this value.\nYour scans will be slower, but less likely to disconnect.",
		opt_gold_ahscanintensity_low = "Slow",
		opt_gold_ahscanintensity_default = "Normal",
		opt_gold_ahscanintensity_high = "Fast",
		opt_gold_reset_hidden = "Reset auction tools hidden items",
		opt_gold_tooltips_show = "Enable Gold Guide Item Tooltips",
		opt_gold_tooltips_out = "Tooltip display mode:",
		opt_gold_tooltips_out = "Tooltip display mode:",
		opt_gold_tooltips_out_desc = "Zygor can show additional information in item tooltips. Use this setting to change how much information is shown.",
		opt_gold_tooltips_out_none = "None",
		opt_gold_tooltips_out_simple = "Simple",
		opt_gold_tooltips_out_dynamic = "Dynamic",
		opt_gold_tooltips_out_full = "Full",

	opt_group_notification = "Notifications",
		opt_nc_enable = "Enable Notification System",
		opt_nc_size = "Notification Size",
		--opt_n_popup_toast = "Use Toast Notifications",
		opt_nc_duration = "Notification Duration",
		opt_nc_position = "Notification Position",
		--opt_n_topcenter = "Top center",
		opt_nc_right = "Right",
		opt_nc_left = "Left",
		opt_nc_lastpos = "User positioned",
		opt_nc_showall = "Show Advanced Settings",

		opt_nc_types = "Notification Types",
		--opt_n_popup_guides = "Next Guide Suggestions",
		opt_nc_dungeon = "Dungeon Guide Suggestions",
		opt_nc_gear = "Gear Suggestions",
		opt_nc_gear_max = "Disable gear suggestions on max level characters",
		--opt_n_popup_gear_offspec = "Upgrades for offspec",
		--opt_n_popup_gear_alt = "Upgrades for alts",
		opt_nc_monk = "Monk Daily Reset",
		opt_nc_pet = "Creature Detector",
	--	opt_n_popup_wq = "Show world quest popup",
		opt_nc_skills = "Class Skill Reminder",
		opt_nc_welcome = "Welcome Message",
		opt_nc_general = "Latest Updates",
		opt_nc_orientation = "Startup Orientation Reminder",
		opt_nc_dailyquest = "Daily Quest Reset",
		opt_nc_worldquest = "Weekly Quest Reset",
		opt_nc_creatures = "Creature Detector",
		opt_nc_events = "Seasonal Events",
		opt_nc_riding = "Riding Skill",
		opt_nc_cutscenes = "Skipped cutscenes and cinematics",

		opt_nc_skillstitle = "Class Skill Reminder Settings",
		opt_nc_size_compact = "Compact",
		opt_nc_size_detailed = "Detailed",

		opt_group_notify = "In the detailed view, notify me of:",
		--opt_n_popup_skills = "Essential Skills",
		opt_nc_skills_optional = "Optional skills",
		opt_nc_skills_future = "Future skills",

		opt_nc_skillstriggertitle = "Class Skill Reminder Triggers",
		opt_nc_skills_login = "Logging in",
		opt_nc_skills_level = "Earning a new level",
		opt_nc_skills_town = "Entering a capital city",
		opt_nc_skills_trainer = "Talking to class trainer",
		opt_nc_skills_dist = "When near a class trainer",
		opt_nc_skills_clear = "Clear blocked skills",

		opt_nc_sendtonc = "Send All Notifications to Notification Center",
		opt_nc_markseen = "Mark All Notifications as Seen",
		opt_nc_hidewhenclosed = "Hide Notifications When Viewer is Closed",
		
		--opt_n_popup_toast_desc = "When possible, notifications are displayed as a temporary toast notification with relevant prompts to take action. If no action is taken, the toast will fade away and a record of the notification will be stored in the Notification Center for later retrieval.",
		opt_nc_duration_desc = "Sets the time the toast message will be displayed before fading. Note: All messages will be stored in Notification Center regardless of setting.",
		opt_nc_sendtonc_desc = "This will disable all toasts and other popups from showing and send them straight to the Notification Center for later viewing.",
		opt_nc_markseen_desc = "This will treat all incoming notifications as seen and not add the orange ring around the Zygor button when notifications are sent to the Notification Center.",
		opt_nc_size_desc = "Changes how much detail is shown in the toast message. In Compact mode, you'll only see the basic toast description. In Detailed mode, you’ll see an additional tip with more details.",
		opt_nc_welcome_desc = "A welcome message that only appears on first time use.",
		opt_nc_general_desc = "A message that appears on version updates when important updates have been made",
		opt_nc_orientation_desc = "A message that appears when you are missing data needed to improve Zygor performance",
		opt_nc_dailyquest_desc = "A message that notifies you when Daily Quests have reset",
		opt_nc_worldquest_desc = "A message that notifies you when Weekly Quests have reset",
		opt_nc_events_desc = "A message that notifies you when a new seasonal event has started",

	opt_group_extras = "Extras",
		opt_chat_title = "Chat",
		opt_noisy = "Show Zygor chat messages",
		opt_analyzereps = "Show detailed reputation gains",
		opt_petbattleframe = "Enable Pet Battle Info Panel",
		opt_talenton = "Enable Talent Advisor",
		opt_beta_use_chains = "[BETA] Use quest chains",
		opt_showbagspace = "Show free bags space",
		opt_showbagspace_desc = "Show counter with free and total bag space over the backpack icon",
		opt_ratings = "Enable guide rating",
		opt_mouseovermarkers = "Show Zygor target markers on mouse over",

	opt_group_talentsystem = "Talent Advisor",
		-- rest is pulled from L("zta")

	opt_group_profile = "Profiles",
		opt_profile_description = "Profiles allow you to save your Zygor addon settings and have different or the same settings across multiple characters. Profiles are automatically updated when changes are made.",
		opt_profile_current = "Current profile: ",
		opt_profile_default = "Use this profile on all characters",
		opt_profile_reset = "Reset to Defaults",
		opt_profile_manage = "Manage Profiles:",
		--opt_newprofiletext
		opt_newprofile = "New Profile",
		--opt_deleteprofiletext
		opt_deleteprofile = "Delete Profile",
		opt_wipe_settings = "Wipe Settings",
		opt_wipe_settings_desc2 = "Completely clear out Zygor Guides' settings, for all characters on this account.|n|cffff8800Warning: this operation is permanent.|r|n|cffddff00Hold |cffffff00Shift|r when clicking the button to confirm.",
		opt_wipe_settings_desc = "Completely clear out Zygor Guides' settings, for all characters on this account.|n|cffff8800Warning: this operation is permanent.|r|n|cff00ff00Hold |cff88ff00Shift|r when clicking the button to confirm.",
		opt_widgetsbackup = "Backup and restore widget settings",
		opt_widgetsimport = "Restore",
		opt_widgetsexport = "Backup",

	opt_group_about = "About",
		opt_about_desc1 = "Zygor Guides Viewer",
		opt_about_desc2 = "© 2022 Zygor Guides",
		opt_about_desc3 = "All Rights Reserved",
		opt_about_desc4 = "Version %s.",
		opt_tech_support_header = "Technical Support",
		opt_tech_support = "For assistance please contact please visit |cffff8800zygorguides.com/support|r.",
		opt_report = "Create a bug report",
		opt_mv_enabled = "Enable Model Viewer",
		opt_mv_rotation = "Rotate models",
		opt_mv_slideshow = "Slide show",
		opt_mv_reset = "Reset windows",






-----------------------------------------------------------------------------------------------------------------
-- code files ---------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	-- Achievement ---------------------------------------------------------------------------------------------------
		achieveframe_button = "|cffffff00Click|cff00ff00 to load the guide for the '|cffffff00%s|cff00ff00' achievement.",

	-- Actionbar
		actionbar_trash = "Shift click to destroy:|n|cff9d9d9d%d %s|r worth %s|nRight click to skip this item|n",
		actionbar_trash_more_header = "|nMore deletable items:|n",
		actionbar_trash_more = "|cff9d9d9d%d %s|r  - %s|n",
		actionbar_trash_destroying = "Destroying selected item",
		actionbar_trash_nothing = "No items found for deletion",

	-- Auctiontools-View ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide_short = "No trend data for this realm. ",
		gold_app_no_scan_data_short = "Current prices unknown.",
		gold_app_no_servertrends_short = "No trend data for this realm. ",
		gold_app_old_scan_data_short = "Scan to update.",
		gold_app_old_servertrends_short = "Trend data is out of date (%s). ",

	-- BugReport ---------------------------------------------------------------------------------------------------
		bugreport_bugtype = "Select Bug Type",
		bugreport_button_save = "Save Report",
		bugreport_button_view = "View",
		bugreport_description = "Please describe the issue you experienced in as much detail as possible.",
		bugreport_header = "Uh oh....did something go wrong?",
		bugreport_info = "If you can reproduce the issue, what exactly needs to be done for it to happen?",
		bugreport_step_message = "Let us know of any errors, issues, or suggestions you have for this step.",
		bugreport_step_message_addon = "Please describe the problem you are having with this part of the addon and any info you can provide on how to reproduce the issue.",
		bugreport_step_message_gear = "Please explain why you feel the scoring of %s is not valid.",
		bugreport_step_submit = "Submit",
		bugreport_step_title = "User Feedback",
		bugreport_step_tooltip = "Report an issue you're having with the guide or addon.",
		bugreport_step_tooltip2 = "|cff00ff00Comments are uploaded via Zygor Client when you log out.|r",
		bugreport_step_type = "Please select a feedback type:",
		bugreport_step_default = "|cff959d95Click to pick a value.",
		bugreport_step_component = "Please select a component:",
		bugreport_step_comp_guideviewer = "Guide Viewer",
		bugreport_step_comp_share = "    Share Feature",
		bugreport_step_comp_guidemenu = "Guide Menu",
		bugreport_step_comp_featured = "    Featured Section",
		bugreport_step_comp_widgets = "    Widgets",
		bugreport_step_comp_travel = "Travel Directions",
		bugreport_step_comp_findNPC = "    Find NPC/Object",
		bugreport_step_comp_notifications = "Notifications",
		bugreport_step_comp_gearsuggestion = "Gear Suggestions",
		bugreport_step_comp_gearfinder = "Gear Finder",
		bugreport_step_comp_auctiontools = "Auction Tools",
		bugreport_step_comp_poi = "Points of Interest",
		bugreport_step_comp_talentadvisor = "Talent Advisor",
		bugreport_step_comp_settings = "Settings",
		bugreport_step_comp_other = "Other",
		bugreport_step_severity = "Tell us how severe the issue is:",
		bugreport_step_severity0 = "|cff959d95Click to select the most accurate summary of the issue.",
		bugreport_step_severity1 = "Issue prevents entire feature from working.",
		bugreport_step_severity2 = "Issue prevents some functionality but can be worked around.",
		bugreport_step_severity3 = "Issue is a minor and doesn't impact use.",
		bugreport_step_nofeed = "|cffff8888Please provide feedback in the input box.",
		bugreport_step_nocomponent = "|cffff8888Please select a component",
		bugreport_step_noseverity = "|cffff8888Please select the issue severity",
		bugreport_step_addoninfo = "|cffff8888Please add the missing information.",
		report_noauthor = "|cffff8888(no address available)|r",
		report_notitle = "|cffff8888(unnamed guide)|r",

	-- CreatureDetector ---------------------------------------------------------------------------------------------------
		detector_tooltip_click = "<<Click>> to open the corresponding guide.",
		detector_tooltip_hunter_click = "<<Click>> to open the list of guides.",
		notifcenter_pet_text = "|c%s%s|r detected.",
		notifcenter_pet_title = "Creature Detector",
		report_nomount_dialog = "|cffff8888Zygor Guides Mount Detector|r\n\nThat player is either unmounted, or we don't know the mount they are using.\n\nYou could help us improve the guides by performing a 'scan' of the player and reporting it to us.\n\nAre you positive the target is mounted?",
		report_nopet_dialog = "|cffff8888Zygor Guides Pet Detector|r\n\nThe target is either not a pet or we don't know the pet you have targeted.\n\nYou could help us improve the guides by reporting this exact pet to us.\n\nAre you positive the target is a pet?",
		--This mount is not available.
		--This pet is not available.
		notifcenter_mount_detected = "|c%s%s|r detected. ",
		notifcenter_pet_detected = "|c%s%s|r detected. \n|cffc4c4c4You already own this pet.",
		notifcenter_new_unit_detected = "|c%s%s|r detected.",
		notifcenter_guideload =  "You have already completed this guide. Load anyway?",
		notifcenter_guideload2 = "You have already collected |c%s%s|r. \n\nWould you still like to load the guide?",
		notifcenter_guideload3 = "|c%s%s|r detected.\n\nWould you still like to load the guide?",
		notifcenter_alreadyhas_load = "Load",
		notifcenter_alreadyhas_ignore = "Ignore",
		mountframe_button = "|cffffff00Click|cff00ff00 to load the guide for the '|cffffff00%s|cff00ff00' mount.",

		notifcenter_cd_creature_title = "%s detected",
		notifcenter_cd_hunterpet_text = "Click to open guide for obtaining this.",
		notifcenter_cd_hunterpet_owned = "|n|cffc4c4c4You already own this hunter pet.",

		notifcenter_cd_pet_text = "Click to open guide for obtaining this.",
		notifcenter_cd_pet_owned = "|n|cffc4c4c4You already own this pet.",

		notifcenter_cd_mount_text = "Click to open guide for obtaining this.",
		notifcenter_cd_mount_owned = "|n|cffc4c4c4You already own this mount.",



	-- CreatureViewer ---------------------------------------------------------------------------------------------------
		model_viewer_no_model = "No model",
		tooltip_modelviewer_default_desc = "|cffffff00Right-Click|cff00ff00 to return the viewer to the default position",
		tooltip_modelviewer_lock_desc = "|cffffff00Click|cff00ff00 to lock viewer relatively to main frame",
		tooltip_modelviewer_locked = "Model Viewer is Locked",
		tooltip_modelviewer_unlock_desc = "|cffffff00Click|cff00ff00 to move viewer",
		tooltip_modelviewer_unlocked = "Model Viewer is Unlocked",

	-- ErrorLogger ---------------------------------------------------------------------------------------------------
		static_caption = "|TInterface\\Addons\\"..addonName.."\\Skins\\zygorlogo:25:100|t\n \n",
		static_error = "Oh no! ZygorGuides have crashed!\n\nIt's strongly recommended to generate a bug report now, and copy and paste it manually onto the zygorguides.com forum.\n\nWould you like to generate the report?",

	-- Functions  ---------------------------------------------------------------------------------------------------
		cinematic_cancelled = "Cinematic auto-skipped.\n(You can change this in Zygor Settings).",
		cinematic_cancelled_short = "Cinematic auto-skipped.",

	-- Floating Toasts
		toasts_creature_new = "|c%s%s|r |c%s%s|r detected.",
		toasts_creature_owned = "|c%s%s|r |c%s%s|r detected.\n|cffc4c4c4You already own this |c%s%s|r.",

	-- Goal ---------------------------------------------------------------------------------------------------
		completion_count = "(%s)",
		completion_ding = "(%s%%)",
		completion_goal = "(%s/%s)",
		completion_goal_ord = "(%s of %s)",
		completion_perc = "(%s%%)",
		completion_level = "(%s%%%s)",
		completion_petding = "(%s%%)",
		completion_rep = "(%s)",
		coords = "%d,%d",
		goalshare_brand = "Zygor's Dungeon and Raid Tips:",
		grind_popup_text = "We add these to try to keep you at a good level to:\n |T"..DIR.."\\Skins\\white:8:8:0:-5:8:8:0:8:0:8:254:97:0|t    Be able to |cfffe6100accept new quests|cffffffff.\n |T"..DIR.."\\Skins\\white:8:8:0:-5:8:8:0:8:0:8:254:97:0|t    |cfffe6100Comfortably|cffffffff kill higher level enemies.\nYou can treat these as |cfffe6100optional|cffffffff and skip them, if you wish, but you may encounter difficulties later in the guide.\nIf that happens, grind at that point, or (if possible) run some dungeons to catch up with the guide.",
		grind_popup_title = "This is a |cfffe6100grind step|cffffffff.",
		map_coords = "%s %d,%d",
		players_garrison_1 = "%s's Outpost",
		players_garrison_2 = "%s's Fort",
		players_garrison_3 = "%s's Garrison",
		questtitle = "'%s'",
		questtitle_part = "'%s' (part %s)",

	-- Goldguide-Auctions ---------------------------------------------------------------------------------------------------
	--[[
		type_armor = C_Item.GetItemClassInfo(Enum.ItemClass.Armor),
		type_consumable = C_Item.GetItemClassInfo(Enum.ItemClass.Consumable) or "Consumable",
		type_trade_goods = C_Item.GetItemClassInfo(Enum.ItemClass.Tradegoods),
		type_weapon = C_Item.GetItemClassInfo(Enum.ItemClass.Weapon),
	--]]

	-- Goldguide-Core ---------------------------------------------------------------------------------------------------
		gold_auctions_error_noresults = "No profitable auctions found.",
		gold_crafting_error_noprofessions = "You don't have a crafting profession.\nYou need to learn Alchemy, Blacksmithing, Engineering, Inscription, \nJewelcrafting, Tailoring, or Leatherworking.",
		gold_crafting_error_noresults = "No profitable crafted items were found for your selected professions.",
		gold_crafting_error_recipesnotcached = "No recipes were found for your profession.\nPlease open tradeskills window.",
		gold_farming_error_noitemtype = "No farmable %s items were found for your level.",
		gold_farming_error_noresults = "No farmable items were found for your level.",
		gold_gathering_error_all_noprofessions = "You have not learned any Gathering profession.\n\nYou need to learn Skinning, Herbalism, Fishing or Mining.",
		gold_gathering_error_one_noresults = "No gathering routes for %s were found to be profitable and in demand at this moment.",
		gold_gathering_error_one_noskillin = "You have not learned %s.",
		gold_gathering_error_one_noskillin_skills = "\n\nYour gathering professions are: %s",
		gold_gathering_error_one_nothing = "No gathering routes for your professions were found to be profitable and in demand at this moment.\n\nYour gathering professions are: %s",
		gold_gathering_error_prof = "%s (%d)",
		gold_gathering_no_results = "You do not meet the requirements for this section.\nYou must have a Gathering profession: Skinning, Herbalism, and/or Mining.",
		gold_general_open_window1 = "\nIf you already know it, please open that skills Professions window",
		gold_general_open_window2 = "\nIf you already know more, please open that skills Professions window",

	-- Goldguide-Help ---------------------------------------------------------------------------------------------------
		gold_12_header = "05 ) Browsing the guide list",
		gold_12_sum = "You can also view more details by hovering over any of the item in the list. This will show you all the farmable items and calculations used to rank each guide. Try it now, then click the Next button when you're ready to proceed.",
		gold_13_header = "05-2) Select a guide",
		gold_13_sum = "To select a guide you want to use click the orange guide picker button, or double click the entire row to load the guide. Go ahead and select a guide from the list now to continue.",
		gold_14_header = "6) Follow the guide instructions",
		gold_1_header = "01) Talk to an Auctioneer",
		gold_1_sum = "The first thing you need to do is scan the auction house so you have the latest pricing data. We've just set a waypoint for you, so follow the arrow to be taken to the nearest Auctioneer, then speak with them and select Sell tab to begin the scanning process.",
		gold_3_header = "03) Open the Gold Guide Menu",
		gold_3_sum = "You can bring up the Gold Guide menu by clicking this gold button here. Go ahead and try it now!",
		gold_4_header = "04 ) Browsing the guide list",
		gold_4_sum = "This section will show you all the items you can farm with several columns of information to help you choose the best one. Lets take a look at how to read each column:",
		gold_appraisebutton_header = "02) Scan the Auction House",
		gold_appraisebutton_sum = "If Quick Scan is not available at the moment (Scan button is grayed out), you can use Appraise function to update prices of all items listed inn Inventory tab.",
		gold_auc_add_header = "05-2) Select the item",
		gold_auc_add_sum = "To select the investment you want to use click the orange guide picker button, or double click the entire row to add the item to Auction Tools Shopping List. Go ahead and select an item from the list now to continue.",
		gold_auc_amt_header = "4c) Amount",
		gold_auc_amt_sum = "The Amount column shows how many items will you be buying.",
		gold_auc_browse_header = "05 ) Browsing the guide list",
		gold_auc_browse_sum = "You can also view more details by hovering over any of the item in the list. This will show you the details of all auctions you will need to buy out, and the profit you can make after selling items after each buyout step.",
		gold_auc_cost_header = "4d) Cost",
		gold_auc_cost_sum = "The Cost column shows how much gold will you be spending to buy out needed auctions.",
		gold_auc_filter_header = "4h) Filter",
		gold_auc_filter_sum = "You can control what type of items are shown in the list using the Filter drop down.",
		gold_auc_gain_header = "4f) Gain",
		gold_auc_gain_sum = "The Gain column shows percentage of profit you will make on that investment.",
		gold_auc_mode_header = "4g) Mode",
		gold_auc_mode_sum = "You can switch between three different modes of display: Easy, Advanced and Expert. In Easy Mode, only best investments are shown. Advanced mode shows all good investments. In expert mode, all investments that have a chance to turn profitable are displayed.",
		gold_auc_profit_header = "4e) Profit",
		gold_auc_profit_sum = "The Profit column shows how much profit will you make after selling bought out items using our suggested price.",
		gold_auc_status_header = "4b) Status",
		gold_auc_status_sum = "The Status column shows projected risk of this investment. \n |cff00ff00Green dot|cffffffff - Great investment.\n |cffffff00Yellow dot|cffffffff - Good investment.\n |cffff0000Red dot|cffffffff - Risky investment.\n",
		gold_auc_title_header = "4a) Item",
		gold_auc_title_sum = "The Item column shows which item you will be investing in.",
		gold_basic_1_header = "01) Always make sure your guide is up to date",
		gold_basic_1_sum = "Every realm (server) in World of Warcraft has a unique and ever changing economy. In order for Zygor's Gold and Auctions guide to work properly it needs to see how your servers market changes over time.  This information is gathered by Zygor outside of the game and is delivered to you via the Zygor Guides Client. Make sure you've configured your servers in the client options under WoW Gold Guide.",
		gold_basic_2_header = "02) Perform a fresh scan before using the guide",
		gold_basic_2_sum = "In addition to keeping your guides updated via the Zygor Guides Client you will also need to perform a fresh scan of your servers auction house to make sure you have current pricing information. To do this, simply talk to any Auctioneer in the game and Zygor's auto-scan feature should start scanning your server. You can also manually scan the server by pressing the Scan button on the Auction Tools.",
		gold_basic_3_header = "03) Select a gold making method",
		gold_basic_3_sum = "Once your guides are up to date and you've performed a recent scan you're ready to go. To access the Gold Guide go to the Guide Selection Menu and select Gold. This will bring up the Gold Guide Menu which has 5 different ways you can make gold. Under each method there will be a list of guides available to you displayed along with important data to help you choose the best guide. Click the Load guide button once you've made your decision.",
		gold_basic_4_header = "04) Complete the required gold making activities and profit!",
		gold_basic_4_sum = "Once the guide has loaded simply follow the instructions displayed on the Guide Viewer to begin making gold. Every guide will require you to perform different tasks like completing quests, or buying/farming/crafting items to sell on the Auction House, but in the end, permitting you've followed these instructions, you should make a profit.|n|nNote: Although Zygor's Gold and Auctions guide is pretty reliable and should make you money most of the time the WoW marketplace is an unpredictable place which means occasionally some items might expire before selling (especially using Expert mode or the more advanced methods). It's important to remain patient and remember that you might just need to relist your items to get them to sell. Also, all estimated values shown are based on the rates of a level 90 character.",
		gold_basic_5_header = "05) Go forth and build your wealth",
		gold_basic_5_sum = "Congratulations! You now know enough to begin using Zygor's Gold and Auctions guide. Click exit to go back to the tutorial index and begin learning how to use the various gold making methods and tools found in Zygor's Gold and Auctions guide.",
		gold_crafting_cost_header = "4c) Crafting cost",
		gold_crafting_cost_sum = "The Crafting cost column shows the lowest calculated cost of crafting this item using components bought on AH, and farmed when component is not buyable.",
		gold_crafting_mode_header = "4e) Mode",
		gold_crafting_mode_sum= "You can switch between two different modes of display: Easy and Expert. In Easy Mode, only items that you can craft right now, using components bought on Auction House are shown. Crafts that you do not know the recipe for are hidden, as well as any items with components not available on auction house. If you would like these items to be included you should use Expert Mode.",
		gold_crafting_profit_header = "4d) Profit",
		gold_crafting_profit_sum = "The Profit column displays estimated profit when created item is sold on AH.",
		gold_crafting_rows_header = "05 ) Browsing the guide list",
		gold_crafting_mode_sum = "You can switch between two different modes of display: Easy and Expert. In Easy Mode, only items that you can craft right now, using components bought on Auction House are shown. Crafts that you do not know the recipe for are hidden, as well as any items with components not available on auction house. If you would like these items to be included you should use Expert Mode.",
		gold_crafting_status_header = "4b) Status",
		gold_crafting_status_sum = "The Status column shows the status of selected craft. \n |cffffff00Yellow dot|cffffffff - You do not know the recipe to craft this item.\n |cffff0000Red dot|cffffffff - Not all components for this item are available at AH at this time.\n |cff00ff00Green dot|cffffffff - You know the recipe, and can buy all components on AH right now.\n",
		gold_crafting_title_header = "4a) Item name",
		gold_crafting_title_sum = "The Item name column shows which item you will be making.",
		gold_est_header = "4f) Estimated gold",
		gold_est_sum = "The Limit column shows an adjusted estimate of the gold that can be earned farming this item when demand is lower than the hourly drop rate. Generally, this is the max amount of the item you can safely farm before you risk flooding the market.",
		gold_farming_14_sum = "Now follow the instructions displayed on the Guide Viewer below. This will lead you to the best location in the game to farm the desired item/s. As you collect items the guide will show you the estimated amount of gold you are earning in real time. When you're done farming click the link at the bottom of the step to be taken to the nearest Auctioneer where you can use the built in Auction Tools to post your items.\n\nThis completes the Farming walkthrough.\n\nClick here to view the Auction Tools walkthrough.",
		gold_filter_header = "4h) Filter",
		gold_filter_sum = "You can control what type of items are shown in the list using the Filter drop down.",
		gold_gathering_14_sum = "Now follow the instructions displayed on the Guide Viewer below. This will lead you to the best location in the game to farm the desired item/s. As you collect items the guide will show you the estimated amount of gold you are earning in real time. When you're done farming click the link at the bottom of the step to be taken to the nearest Auctioneer where you can use the built in Auction Tools to post your items.\n\nThis completes the Gathering walkthrough.\n\nClick here to view the Auction Tools walkthrough.",
		gold_item_header = "4b) Item",
		gold_item_sum = "The Item column tells you the name of the item or items to be farmed in this guide.",
		gold_mode_header = "4g) Mode",
		gold_mode_sum = "You can switch between two different modes of display: Easy and Expert. In Easy Mode, all items with Low Demand will be hidden. Low Demand items can still be profitable, even most profitable, but might not sell as reliably or as quickly as higher Demand items. If you would like these items to be included you should use Expert Mode.",
		gold_no_header = "4a) No.",
		gold_no_sum = "The No. column shows you what number Zygor has ranked this item in terms of overall profitably. The items are listed in descending order with the most profitable items at the top.",
		gold_rate_header = "4d) Rate",
		gold_rate_sum = "The Gold column shows the estimated amount of gold that can be earned per hour when using this guide. This is determined by the multiplying the frequency of drops by the current market price of the items.\n\nNote: All values are based on the gathering rate of a level 90 character. ",
		gold_scanbutton_header = "02) Scan the Auction House",
		gold_scanbutton_sum = "If you disabled autoscanning, press Scan to update auction house data. When the scanning is complete click Next to continue.",
		gold_scantime_header = "02) Scan the Auction House",
		gold_scantime_sum = "This status of the scanning process will be shown at the bottom of the Auction Tools panel. Once the scan is complete it will show a timestamp allowing you to see when the last scan occured.",
		gold_time_header = "4e) Time",
		gold_time_sum= "The Time column shows estimated time you will spend running this guide.",
		gold_zone_header = "4c) Zone",
		gold_zone_sum= "The Zone column shows which area you will be visiting when using this guide.",

	-- Goldguide-View ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide = "You don't have the full Gold Guide installed. No trend data is available.",
		gold_app_no_scan_data = "Current prices unknown. Please scan the Auction House to collect data.",
		gold_app_no_servertrends = "No trend data for this realm. Speak with an Auctioneer and Scan to update.",
		gold_app_old_scan_data = "Speak with an Auctioneer and Scan to update.",
		gold_app_old_servertrends = "Trend data is out of date (%s). Speak with an Auctioneer and Scan to update.",
		gold_clicktosort_asc = "Click to sort by: %s |cff44ff00(ascending)",
		gold_clicktosort_desc = "Click to sort by: %s |cff44ff00(descending)",
		gold_expertmode_easylabel = "Easy",
		gold_expertmode_easytooltip = "Only show items which should sell fast.",
		gold_expertmode_expertlabel = "Expert",
		gold_expertmode_experttooltip = "Show both fast- and slow-selling items.\nYou may end up with merchandise selling for days.",
		gold_expertmode_generictooltip = "Set investment mode.",

	-- Guide ---------------------------------------------------------------------------------------------------
		guide_dungpop_tip = SHIFTCLICK.." to block this dungeon\nfrom being suggested again.",
		guide_monkpop_tip = SHIFTCLICK.." to block monk dailies\nfrom being suggested again.",
		macro_acc = "account tab",
		macro_both = "both account and character tabs",
		macro_char = "character tab",
		macro_status_no = "Macro is not installed.",
		macro_status_yes = "Macro is installed under %s.",
		message_errorloading_brief = "|cffff4444Error|r loading guide |cffaaffaa%s|r",
		message_errorloading_critical = "|cffff4444CRITICAL Error|r loading guide |cffaaffaa%s|r\nError: %s\nLine: %d\nData: %s",
		message_errorloading_full = "|cffff4444Error|r loading guide |cffaaffaa%s|r\nline: %s   step: %s\ncode:|cffffeeaa%s |cffff0000<=====|cffff8800 %s|r",
		notifcenter_dungeon_text = "Load Dungeon guide for: %s%s|r",
		notifcenter_dungeon_title = "Dungeons Guide",
		notifcenter_gen_popup_tooltip = "<<Click>> to open this pop-up again.",
		notifcenter_monk_text = "Load Monk guide for: %s%s|r",
		notifcenter_monk_title = "Monk Daily",
		notifcenter_mount_text = "Mount Training Available",
		notifcenter_mount_title = "Riding Training",
		notifcenter_nextguide_text = "Next suggested guide: %s%s|r",
		notifcenter_nextguide_title = "Smart Injection System",
		notifcenter_previous_text = "Would you like to return to the guide you were previously using: %s",
		notifcenter_previous_title = "Previous Guide",
		notifcenter_reload_text = "Pop-up to reload your guides",
		notifcenter_toast_dungeon = "A guide is available for this Dungeon\n|cff861cb3%s|r",
		static_accept = "Accept",
		static_badguide = "The selected guide:\n|cffffee00%s|r\n is |cffffbbaaimproper|r for your character.\n|cffff6644%s|r\n\nDo you really want to load it?",
		static_caption = "|TInterface\\Addons\\"..addonName.."\\Skins\\zygorlogo:25:100|t\n \n",
		static_loadguide = "Would you like to load the guide:\n\n%s",
		static_loadmountguide = "You've reached the level required to obtain a %s riding skill. Would you like to load the guide for obtaining it?",
		nc_loadmountguide = "%s riding skill available.",
		static_nextguide = "You're now ready to proceed to:\n\n%s",
		static_nextguide2 = "You're now ready to proceed to:\n",
		static_nextguide_turnins = "Let me turn my quests in first",
		static_pandareload = "Would you like to reload\nso that you may view all of your guides?",

		pandariaremix_not_tuned = "This is the Retail version of this guide. MoP Remix has introduced changes that may have affected this guide. We've made it available to Remix users but you may run into issues. Our team is working to update all guides as needed.\nClick to confirm",

	-- GuideMenu ---------------------------------------------------------------------------------------------------
		guidebeta = " (BETA)",
		guidedev = " |cffff0000(DEV)|r",
		guidedevpart = " |cffff0000(DEV parts)|r",
		guidehardcore = " |cfffe6100(Hardcore)|r",
		guidemenu_guidetooltips_loadguide = "Load Guide",
		guidemenu_guidetooltips_showquests = "Show guides for this quest",
		guidemenu_section_favourites = "Favorites",
		guidemenu_section_recent = "Recent",
		guidemenu_section_search = "Search",
		guidemenu_section_search_results = "Search: %d results",
		guidemenu_section_search_titleresults = "Search '%s': %d result%s",
		guidemenu_section_search_noresults = "|cffA8A5A5Couldn't find what you were looking for?",
		guidemenu_section_search_request = "Request a guide for \"|c%s%s|r\"",
		guidemenu_section_search_submitted = "Guide request submitted.",
		guidemenu_section_search_submitted_chat = "Request submission saved for upload.",
		guidemenu_section_suggested = "Suggested",
		guidemenu_missing_message = "Zygor Elite guide.|nNot in trial.",

	-- GuideMenu-View ---------------------------------------------------------------------------------------------------
		guidemenu_guidetooltips_favourite = "Mark as favorite",
		guidemenu_guidetooltips_loadguide = "Load Guide",
		guidemenu_missing_guide = "This guide is either missing or you're using the trial version",
		opt_gmcolorcode = "Color code icons to show guide difficulty/status",
		opt_gmusecheck = "Use checkmark icon for completed guides.",
		opt_gmhidecompleted = "Hide completed and outleveled guides.",
		opt_gmnumrecent = "Number of Recent guides to show:",
		opt_gmstarsuggested = "Use star icon for Suggested guides",
		opt_gmsuggesttypes = "Suggest guides for:",
		opt_gmsuggestleveling = "Leveling",
		opt_gmsuggestdungeons = "Dungeons",
		opt_gmsuggestdailies = "Dailies",
		opt_gmsuggestevents = "Events",
		opt_gmsuggestprofessions = "Professions",
		opt_gmsuggestpets = "Pets/Mounts",
		opt_gmsuggestreputations = "Reputations",
		opt_gmsuggesttitles = "Titles",
		opt_gmsuggestachievements = "Achievements",
		guidemenu_missing_popup = "Zygor Elite guide|nNot in trial.",


	-- InventoryManager ---------------------------------------------------------------------------------------------------
		notifcenter_inventory_manager_title = "Inventory Manager",
		im_ar_repairamount = "Repaired all items for ",
		im_ar_guild = " using your guild bank allowance.",
		im_ar_cannotar="Could not auto-repair. Not enough money.",
		im_ar_cannotar2="Could not auto-repair. Not enough money or guild bank allowance.",
		im_ar_noguildrepairs="Could not auto-repair. Not enough money and your guild rank is not allowed to use guild bank repairs.",

	-- InventoryManager-ReminderPopup ---------------------------------------------------------------------------------------------------
		--notifcenter_inventory_manager_title

	-- Item-GearFinder ---------------------------------------------------------------------------------------------------
		frame_selectguide = "Add new guide tab",
		frame_selectguide_left = "<<Left-click>>: open the guide selection window.",

	-- Item-Quest ---------------------------------------------------------------------------------------------------
		itemscore_questitem1 = "Would you like to equip",
		itemscore_questitem2 = "for the current quest?",
		itemscore_questitem3 = "since the quest item is no longer needed?",
		notifcenter_gear_title = "Gear Upgrade Equipped",
		--notifcenter_gen_popup_tooltip
		notifcenter_quest_text = "Quest Item action required",

	-- Item-Upgrades ---------------------------------------------------------------------------------------------------
		itemscore_ae_accept = "Equip",
		itemscore_ae_decline = "Decline",
		itemscore_ae_equip = "Equipped %s",
		itemscore_ae_equip1 = " You have a new upgrade:",
		itemscore_ae_equip2 = " You have a new upgrade:",
		itemscore_ae_over = " over %s",
		itemscore_ae_report_tip = SHIFTCLICK.." to generate a report\nif you think this suggestion is wrong.",
		itemscore_ae_replaces = "replaces",
		notifcenter_gear_equipped = "%s equipped to the |cffffff00%s|r slot",
		notifcenter_gear_text = "New Upgrade Available",
		notifcenter_gear_pop_one = "You have a new upgrade available",
		notifcenter_gear_pop_many = "You have %d upgrades available",
		notifcenter_gear_pop_review = "Click to review.",
		notifcenter_gear_bags_one = "You have a new upgrade available",
		notifcenter_gear_bags_many = "You have %d new upgrades available",
		notifcenter_gear_bags_review = "Click to view in bags.",

		--notifcenter_gear_title
		--notifcenter_gen_popup_tooltip
		--zgname
		itemscore_alts_accept = "Remind me",
		itemscore_alts_decline = "Ignore",
		itemscore_alts_itemfound = "An upgrade have been found for your alts:\n",


	-- Loot ---------------------------------------------------------------------------------------------------
		loot_autobuyframetext = "%s|n|nTotal Cost = %s|nThese items are needed for your current guide.",
		loot_autobuynoroom = "Not enough room for %d stacks.",
		loot_autobuynostock = "%s x |cffffdd00%d|r are not available at this time.",
		loot_autobuynotavail = "|cffffee66 %s not available at this vendor or is out of stock.",
		loot_autobuynotmoney = "%s does not use gold to buy. Please purchase it yourself.",
		loot_autobuypoor = "You do not have enough money to buy all items. |cffffdd00%s|r is needed.",
		loot_greyframe_maintext = "Total value of gray items",
		loot_sellgreybutton = "Sell Grays",
		loot_sellgreys_sold = "Sold %s x |cffffdd00%d|r for |cffffdd00%s|r",
		loot_sellgreys_total = "Total income: %s",
		--notifcenter_gen_popup_tooltip
		notifcenter_loot_text = "Zygor Shopping List",

	-- MacroGuide ---------------------------------------------------------------------------------------------------
		macro_error_bars_full = "The action bars are full, please	make some space.",
		macro_error_combat = "You are in combat, cannot create a macro.",
		macro_error_overflow = "Too much %smacros, remove some and retry please.",
		macro_tooltip = COLOR_TIP_MOUSE.."Drag|r to put onto your action bar|n"..COLOR_TIP_MOUSE.."Click|r to test",

	-- MapCoords ---------------------------------------------------------------------------------------------------
		menu_map_poidisable = "Disable Points of Interest System",
		menu_map_poidisable_desc = "Disable the ability to see Points of Interest on your map and mini-map.",
		menu_map_poienabled = "Show points of interest",
		menu_map_poienabled_desc = "Enable the ability to see Points of Interest on your map and mini-map.",
		menu_map_poioptions = "Show POI options",
		menu_map_poishow = "Points of Interest Types:",
		menu_map_poishow_achievement = "Achievements",
		menu_map_poishow_battlepet = "Battle pets",
		menu_map_poishow_rare = "Rare spawns",
		menu_map_poishow_treasure = "Treasures",
		menu_map_poitype = "Points of Interest Display Mode:",
		menu_map_poitype_complete = "Completionist Mode",
		menu_map_poitype_desc = "Filter which POIs are shown on the map by how difficult they are to access.\n\nQuickly accessed will only show POI's that you can quickly and easily reach, and Completionist will show all POIs.",
		menu_map_poitype_quick = "Quickly accessed",

	-- NotificationCenter ---------------------------------------------------------------------------------------------------
		notifcenter_no_entries = "You have no notifications.",
		notifcenter_reset = "Remove all notifications.",
		notifcenter_warning_notarget = "No target.",
		notifcenter_warning_noskill = "Required skill not available.",

	-- Parser ---------------------------------------------------------------------------------------------------
		coords = "%d,%d",

	-- PetBattle ---------------------------------------------------------------------------------------------------
		petframe_button = "|cffffff00Click|cff00ff00 to load the guide for the '|cffffff00%s|cff00ff00' pet.",
		static_caption = "|TInterface\\Addons\\"..addonName.."\\Skins\\zygorlogo:25:100|t\n \n",

	-- POI -------------------------------------------------------------------------------------------------------
		poi_load = "|cffffaa00Click to open guide|r",

	-- Pointer ---------------------------------------------------------------------------------------------------
		dist_km = "%.1f km",
		dist_m = "%d m",
		dist_yd = "%d yd",
		pointer_arrow_itemcooldown = "Wait |cffaaff00%s|r for |cffffaa00%s|r cooldown",
		pointer_arrow_itemuse = "Use |cffffaa00%s|r",
		pointer_arrow_noflightdata = "|cff88bbff(Flight connections unknown. Attempting best route.)|r",
		pointer_arrowmenu_arrowheader = "Arrow options",
		pointer_arrowmenu_findnearest = "Find NPC/Object",
		pointer_arrowmenu_forcecomfort = "Switch to comfort route",
		pointer_arrowmenu_forcespeed = "Switch to speed route",

		pointer_arrowmenu_relaxed = "Prefer relaxed routing",
		pointer_arrowmenu_relaxed_desc = "Travel prefer methods with lower user interaction rather than ones where you must actively control your character. With this off, speed will be favored at all costs.",

		pointer_arrowmenu_freeze = "Make non-interactive",
		pointer_arrowmenu_freeze_desc = "You'll have to make it interactive again\nin the Zygor options screen,\nunder Navigation.",
		pointer_arrowmenu_hide = "Disable arrow",
		pointer_arrowmenu_hide_desc = "You'll have to enable it again\nin the Zygor options screen,\nunder Navigation.",
		pointer_arrowmenu_options = "More options...",
		pointer_arrowmenu_removeway = "Clear waypoint",
		pointer_arrowmenu_reset = "Reset route settings",
		pointer_arrowmenu_route_destination = "%s %d,%d",
		pointer_arrowmenu_route_destination_guide = "(Guide step waypoint)",
		pointer_arrowmenu_route_destination_manual = "(Custom waypoint)",
		pointer_arrowmenu_route_destinationtitle = "Current destination:",
		pointer_arrowmenu_route_disable = "Disable travel routes",
		pointer_arrowmenu_route_disable_desc = "Use straight line waypointing.",
		pointer_arrowmenu_route_enable = "Find shortest travel routes",
		pointer_arrowmenu_route_enable_desc = "Automatically find the shortest possible route to destination.",
		pointer_arrowmenu_route_est = "|cffccddeeEstimated time: |r%d:%02d",
		pointer_arrowmenu_route_node1 = "|cff8899aa%d. |cfff8fdff%s",
		pointer_arrowmenu_route_node = "|cff8899aa%d. |cffaabbcc%s",
		pointer_arrowmenu_route_retry = "Re-check route",
		pointer_arrowmenu_route_retry_desc = "Make sure this is still the best possible route.",
		pointer_arrowmenu_route_stitle = "Options for this route",
		pointer_arrowmenu_route_travelroutetitle = "Travel System route:",
		pointer_arrowmenu_scale = "Scale",
		pointer_arrowmenu_settings = "Settings",
		pointer_arrowmenu_use_hearth = "Use hearthstones",
		pointer_arrowmenu_use_item_teleports = "Use teleport items",
		pointer_arrowmenu_use_mage_teleport = "Use teleport spells",
		pointer_arrowmenu_report = "|cffff4330?   |cffffffffReport improper route",
		pointer_arrowmenu_report2 = "Report improper route",
		pointer_arrowmenu_report_desc = "Open the Feedback menu to send a report if you think this route is incorrect.",
		pointer_missing_taxi_data = "|cffeeeecc\nMissing flight data. Open a flight master's map for improved directions.",
		pointer_close_map = "(close map)",
		pointer_corpselabel = "Corpse",
		pointer_floors_default = "(on another floor)",
		pointer_preview_hide = "Click to hide Map Preview",
		pointer_preview_show = "Click to show Map Preview",
		pointer_reequip_item = "Equipped %s for you.",
		waypoint_step = "Step %s",
		waypoint_tip_clearmanual = "<<Shift-click>>: remove user waypoint",
		waypoint_tip_distance = "Distance: %s",

	-- QuestAutoAccept ---------------------------------------------------------------------------------------------------
		autocomplete_turnin = "Turning in quest.",
		autocomplete_turnin_fail = "Will not pick a reward automatically.",

	-- QuestDB ---------------------------------------------------------------------------------------------------
		questframe_button = "|cffffff00Click|cff00ff00 to find the guide for '|cffffff00%s|cff00ff00' quest.",
		sis_complete = " |cfffe6100SIS:|cffffffff Skipping completed steps",
		sis_dialog_button_catchup_best = "Find best starting point in the guides and take me through any needed pre-quests.",
		sis_dialog_button_catchup_cancel = "Cancel current quest catchup.",
		sis_dialog_button_catchup_curent = "Take me through the needed pre-quests for the current guide only.",
		sis_dialog_button_cleanup = "Abandon any leveling quests that are no longer needed.",
		sis_dialog_header = "Smart Injection System",
		sis_dialog_subheader_catchup = "Quest Catchup",
		sis_dialog_subheader_cleanup = "Quest Cleanup",
		sis_irrelevant = " |cfffe6100SIS:|cffffffff Skipping irrelevant steps",
		sis_level = " |cfffe6100SIS:|cffffffff Completing required step goal",
		sis_progress = " |cfffe6100SIS:|cffffffff Completing quest in progress",
		sis_required = " |cfffe6100SIS:|cffffffff Required pre-quest",
		sis_skipping = " |cfffe6100SIS:|cffffffff Skipping not needed quest",
		sis_start = " |cfffe6100SIS:|cffffffff Suggested starting point",

	-- QuestTracking ---------------------------------------------------------------------------------------------------
		static_abandonquests = "These quests are not continued in the current guide:\n\n%s\nYou're safe to abandon them in your Quest Log.",
		static_abandonquests_butabandon = "Abandon all",
		static_abandonquests_butignore = "Ignore",
		static_abandonquests_none = "All your quests are dailies or valid for the current guide.\nThere is nothing to abandon.",

	-- Scan ---------------------------------------------------------------------------------------------------
		gold_app_no_goldguide_tooltip = "You don't have the full Gold Guide installed. No trend data is available.",
		gold_app_no_scan_data_tooltip = "Current prices unknown. Please scan the Auction House to collect data.",
		gold_app_no_servertrends_tooltip = "No trend data for this realm. Speak with an Auctioneer and Scan to update.",
		gold_app_old_scan_data_tooltip = "Speak with an Auctioneer and Scan to update.",
		gold_app_old_servertrends_tooltip = "Trend data is out of date (%s). Speak with an Auctioneer and Scan to update.",
		gold_app_trend_tooltip = "Trend data is created from AH scans. Scan daily to improve data quality",

	-- Skills ---------------------------------------------------------------------------------------------------
		notifcenter_skill_text = "%s skills available.",
		skills_more = "And more...",
		skills_mode_count = "+%d more",
		skills_new = "You have new class skills available:",
		skills_nothing = "You have no new class skills available.",
		skills_trainer = "Find trainer",
		skills_trainer_pet = "Find pet trainer",
		skills_essential = "Essential",
		skills_optional = "Optional",
		skills_future = "Future",
		skills_hide = "- hide extra skills",

	-- Notifications ---------------------------------------------------------------------------------------------------
		nc_toggleviewer = "Toggle guide window",
		nc_reset = "Clear all notifications",
		nc_settings = "Configure",
		notifcenter_generic_title = "Other",
		static_accept = "Accept",
		static_decline = "Decline",
		static_minimize_tip = "Send to Notification Center.",
		static_settings_tip = "Configure settings.",

	-- Step ---------------------------------------------------------------------------------------------------
		goalshare_brand = "Zygor's Dungeon and Raid Tips:",

	-- Sync ---------------------------------------------------------------------------------------------------
		share_button_reinvite = "Reinvite",
		share_button_stop = "Stop",
		share_invite_master = "Do you want to start sharing the guide:|n|n|cffffee88%s|r|n|nwith your party?|n|n%s",
		share_invite_master_party_manyzygors = "Note: only %s in your party are using Zygor Guides and will be able to use your shared guide.",
		share_invite_master_party_onezygor = "Note: only %s in your party is using Zygor Guides and will be able to use your shared guide.",
		share_invite_master_stop_or_reinvite = "Do you want to reinvite %s,\n\nor to stop sharing your guide?",
		share_invite_master_stop_or_reinvite_with = "Do you want to reinvite %s,\n\nor to stop sharing your guide with %s?",
		share_invite_received = "|cffffff88%s|r would like to share the following guide with you:|n|n|cffffff88%s|r|n|nBy accepting, a new tab will open in which steps from this guide will be shared with you.",
		share_invite_slaveinitiated = "|cffffff88%s|r is sharing the following guide:|n|n|cffffff88%s|r|n|nDo you want to join?|n|nBy accepting, a new tab will open in which steps from this guide will be shared with you.",
		share_nowarnagain = "Don't warn me again.",
		share_party_and = " and ",
		share_party_comma = ", ",
		share_party_none = "none",
		share_tooltip_currentslaves = "|cffaaaaaaCurrent users: %s",
		share_tooltip_noparty = "|cffff4400(you're not in a party now.)|r",
		share_tooltip_nozygor = "|cffff4400(no-one else in your party is using Zygor Guides.)|r",
		share_tooltip_startmaster = "<<Click>>: share your guide with party members",
		share_tooltip_startslave = "<<Click>>: join a guide shared by |cffddff00%s|r",
		share_tooltip_stopmaster = "<<Click>>: stop sharing your guide",
		share_tooltip_stopmaster_or_reinvite = "<<Click>>: manage your sharing mode",
		share_tooltip_stopslave = "<<Click>>: stop using |cffddff00%s|r's shared guide",
		share_tooltip_title = "Guide Sharing",
		sync_ahead = "|cff88ff88%s: Ahead (%d)|r", -- name, count
		sync_behind = "|cffff8888%s: Behind (%d)|r", -- name, count

	-- Tabs ---------------------------------------------------------------------------------------------------
		frame_selectguide = "Add new guide tab",
		frame_selectguide_left = "<<Left-click>>: open the guide selection window.",
		tabs_guide_new = "Click here to open guide in new tab",
		tabs_guide_switch = "Click here to switch to tab with this guide",
		tabsmenu_new_guide = "Open a new guide",
		tabsmenu_suggested = "Suggested guides:",
		tabsmenu_recent = "Recent guides:",

	-- Tutorial ---------------------------------------------------------------------------------------------------
		guidetutorial_backbutton = "Back",
		guidetutorial_donebutton = "Done",
		guidetutorial_exit = "Exit",
		guidetutorial_next = "Next",
		guidetutorial_progresstip2 = "This will track your progress by how many steps there are in a guide.",
		guidetutorial_progresstip3 = "This will track your progress by how close you are to out-leveling the currently loaded guide and being told you can move on to the next guide.",
		guidetutorial_progresstiplevel = "Track By Level",
		guidetutorial_progresstipstep = "Track By Step",

	-- ViewerFrame ---------------------------------------------------------------------------------------------------
		frame_guide_complete = "Guide complete!",
		frame_guide_progress = "Guide progress: %d%%",

		frame_guide_step = "Step: %d/%d",
		frame_guide_stepscompleted = "Steps Completed: %d/%d",
		frame_guide_stepsprogress = "Guide progress: %d%%",

		frame_guide_quests = "Quests: %d/%d",
		frame_guide_questscompleted = "Quests Completed: %d/%d",
		frame_guide_questsprogress = "Guide progress: %d%%",

		frame_guide_exp = "Exp: %d/%d",
		frame_guide_expcompleted = "Exp: %d/%d",
		frame_guide_expprogress = "Level progress: %d%%",

		frame_helpbutton = "Help",
		frame_helpbutton_desc = "<<Click>> to run the tutorial.",
		frame_minright = "<<Right-click>> to set number of steps",
		frame_reportbutton = "Bug Report",
		frame_reportbutton_desc = "<<Click>> to generate a detailed error or suggestion report.",
		frame_settings = "Options",
		frame_settings1 = "<<Click>>: set options",
		frame_settings2 = "<<Right-click>> to enter configuration",
		frame_SISButton = "Smart Injection System",
		frame_stepnav_next = "Next step",
		frame_stepnav_next_click = "<<Click>>: skip one step",
		frame_stepnav_next_right = "<<Right-click>>: fast-forward to next incomplete step",
		frame_stepnav_nextquest = "Next step for quest %s",
		frame_stepnav_nextquest_click = "<<Click>>: skip to next step for this quest",
		frame_stepnav_nextquest_right = "<<Right-click>>: fast-forward to next incomplete step for this quest",
		frame_stepnav_prev = "Previous step",
		frame_stepnav_prev_click = "<<Click>>: backtrack one step",
		frame_stepnav_prev_ctrl = "<<Ctrl-click>>: return to start of guide",
		frame_stepnav_prev_right = "<<Right-click>>: rewind to last incomplete step",
		menu_EnableTransparency = "Enable Transparency",
		menu_GuideMenu = "Guide Menu",
		menu_Startup = "Startup Guide Wizard",
		menu_LockViewer = "Lock Viewer",
		menu_QuestCleanup = "Quest Cleanup",
		menu_Reload = "Reload",
		menu_Reset = "Reset window",
		menu_Settings = "Settings",
		menu_TravelLines = "Show Travel Lines",
		menu_ShowSkills = "Show Skill Reminder",
		pointer_arrowmenu_findnearest = "Find NPC/Object",
		step_level = "|cffaaccaaLevel: |cffcceecc%s|cffaaccaa|r ",
		step_num = "|cffaaaaaa%s|cff888888.|r ",
		stepbeta = "(Beta content)",
		stepdev = "(Dev content)",
		stepcollapsed = "(step collapsed)",
		stepreq = "(Only %s)",
		stepreqnot = "not %s",
		stepreqor = " or ",
		viewer_special_loading = "Loading...",
		viewer_special_select = "Welcome to Zygor Guides.\n|cfffe6100Click here|r to load a guide.",
		viewer_special_rate = "You have reached the end of the guide. How would you rate the |c%s%s|r guide?",
		viewer_special_rateexp = "Please tell us your thoughts on this guide.",
		viewer_special_cancel = "Cancel",
		viewer_special_popup = "Please rate the |c%s%s|r guide.",
		viewer_special_rate_next = "You have reached the end of the guide.\n|cfffe6100Click here|r to load the |c%s%s|r guide.",
		viewer_special_rate_menu = "You have reached the end of the guide.\n|cfffe6100Click here|r to load a guide.",
		viewer_special_scorecheck = "Please rate the guide before submitting feedback",
		viewer_special_badscore = "|cfffe6100Please tell us how we could improve this guide.",
		viewer_special_toggle = "Don't show this dialog again",
		viewer_special_senttopopup = "You have reached the end of the guide.\nStep content sent to popup.",
		viewer_special_cancelled_rate = "You have reached the end of the guide.\n\n|cfffe6100Click here|r to rate this guide.",
		viewer_special_cancelled_next = "|cfffe6100Click here|r to load the next suggested guide ( |c%s%s|r ).",
		viewer_special_cancelled_menu = "|cfffe6100Click here|r to load a guide.",
		viewer_special_endguide = "You have reached the end of the guide.",
		viewer_special_selectfirst = "Please select a rating first.",
		viewer_special_amazing = "Good",
		viewer_special_average = "Okay",
		viewer_special_bad = "Bad",

	-- Whowhere
		whowhere_walks = "(walks around this area)",

	-- WorldQuests ---------------------------------------------------------------------------------------------------
		tabs_world_quest_new = "Click here to open the guide for this world quest",
		wqp_col_FACTION = "FACTION",
		wqp_col_NAME = "NAME",
		wqp_col_REWARDS = "REWARDS",
		wqp_col_TIME = "TIME",
		wqp_col_ZONE = "ZONE",
		wqp_filter_Faction = "Faction",
		wqp_filter_Reward = "Reward",
		wqp_filter_Type = "Type",
		wqp_no_guide = "A guide for this World Quest\nhas not been added yet.",
		wqp_only_selected = "Show only selected",
		wqp_quests_selected = "%d Quests Selected",
		wqp_showing_queue = "No quests in this zone. Showing your queue.",
		wqp_start_queue = "Start queued quests",

	-- ZygorGuidesViewer ---------------------------------------------------------------------------------------------------
		binding_next = "Next Step",
		binding_prev = "Previous Step",
		binding_togglewindow = "Show Guide Window",
		binding_waypoint_next = "Cycle multiple waypoints",
		binding_waypoint_prev = "Cycle multiple waypoints backwards",
		dialog_endguide = "You've reached the end of the current guide.",
		dialog_nextguide = "You've reached the end of the current guide.\n\nThe next guide is:\n|cffff8800%s|r\n\nWould you like to proceed?",
		dialog_endtrial = "You've reached the end of the trial.",
		guide_notloaded = "|cff0000ff- none loaded -",
		guide_notselected = "- select a guide -",
		guidepicker_achievements = "Achievements",
		guidepicker_dalies = "Dailies",
		guidepicker_dungeon = "Dungeons",
		guidepicker_events = "Events",
		guidepicker_gear = "Gear",
		guidepicker_gold = "Gold",
		guidepicker_leveling = "Leveling",
		guidepicker_loremaster = "Loremaster",
		guidepicker_macros = "Macros",
		guidepicker_pets = "Pets & Mounts",
		guidepicker_professions = "Professions",
		guidepicker_recent = "RECENT:",
		guidepicker_reps = "Reputations",
		guidepicker_searchresults = "Search results:",
		guidepicker_suggested = "Suggested guides",
		guidepicker_titles = "Titles",
		loading_guides = "|c888888ff(loading guides: %d%%)",
		menu_last_entry = "%s |cffaaaaaastep|r %d",
		message_errorloading_brief = "|cffff4444Error|r loading guide |cffaaffaa%s|r",
		message_errorloading_full = "|cffff4444Error|r loading guide |cffaaffaa%s|r\nline: %s   step: %s\ncode:|cffffeeaa%s |cffff0000<=====|cffff8800 %s|r",
		message_loadedguide = "Activated guide: |cffaaffaa%s|r",
		message_missingguide = "|cffff4444Missing|r guide: |cffaaffaa%s|r",
		qmenu_border_restore = "Switch to full mode",
		qmenu_border_restore_desc = "Switch to \"Full Mode\", showing guide window controls.",
		qmenu_close = "- Cancel -",
		qmenu_goal = "Goal: %s",
		qmenu_goal_complete = "Mark as Complete",
		qmenu_goal_complete_desc = "Click to mark this goal as complete (or incomplete).|n|cff998800Use this if the addon cannot properly detect completion.",
		qmenu_goal_creature = "View creature",
		qmenu_goal_creature_data = "View creature: %s",
		qmenu_goal_creature_desc = "See how '%s' looks like.",
		qmenu_goal_waypoint = "Waypoint: %s, %.1f;%.1f",
		qmenu_goal_waypoint_desc = "Click to set your waypoint to these coordinates.",
		qmenu_quest = "Quest: %s",
		qmenu_quest_complete = "Complete",
		qmenu_quest_complete_desc = "Click to mark this quest as incomplete. This will be remembered until you log off, or the server sends a newly updated completion list.",
		qmenu_quest_complete_in_desc = "Manually mark this quest as complete. This will be remembered until you log off, or the server sends a newly updated completion list.",
		qmenu_quest_complete_in_tip = "This quest is incomplete.",
		qmenu_quest_complete_tip = "This quest is complete.",
		qmenu_quest_info = "Show quest chain",
		qmenu_quest_info_desc = "Display quest chain information and the level to which this quest belongs.|n|cffaaaaaaShift-click|cff998800 to view in text-copy mode.",
		qmenu_quest_lightheaded = "View quest in LightHeaded",
		qmenu_quest_lightheaded_desc = "View detailed quest information in the LightHeaded addon.|n|cffaaaaaaShift-click|cff998800 to view in text-copy mode.",
		qmenu_quest_openlog = "Open log with quest",
		qmenu_quest_openlog_desc = "Open the quest's description in your log.",
		qmenu_quest_openmap = "Show quest on map",
		qmenu_quest_openmap_desc = "Display the quest's location on the map.",
		qmenu_quest_watched = "Watch quest",
		qmenu_quest_watched_desc = "Toggle watching this quest using the built-in quest objective tracker.",
		qmenu_share_allgrouproles = "Share this step's tips",
		qmenu_shareto = "Share tips to:",
		qmenu_shareto_party = "/party",
		qmenu_shareto_raid = "/raid",
		qmenu_shareto_say = "/say",
		qmenu_step = "Step %s (level %s)",
		qmenu_step_skip = "Skip this step",
		qmenu_step_skip_desc = "Skip to the next step, assuming this step as complete.",
		static_badguide = "The selected guide:\n|cffffee00%s|r\n is |cffffbbaaimproper|r for your character.\n|cffff6644%s|r\n\nDo you really want to load it?",
		static_caption = "|TInterface\\Addons\\"..addonName.."\\Skins\\zygorlogo:25:100|t\n \n",
		static_help = "Help and tutorial system|ncoming soon.",
		static_sis = "|cffffff88Smart Injection System|r|n|nThis feature will attempt to find the best spot in the guides for you to start.|nIt will reset your dynamic progress settings, load the starting guide for level 1 of your race/class, and start skipping forward until it finds quests worth completing.|n|nIf your character is high-level, you'll mostly see the guide zip past |cff88ff88green|r (completed) or |cff88aaffblue|r (low-level) steps.|n|nIf it stops at a seemingly low-level quest, it's usually a good idea to trust the guide and complete the quest, as it might start a long chain reaching to your level.|n|nIt might stop at flight path pickups, it's up to you to verify if they're really unknown to your character.|n|nSo... Ready for the ride?",
		welcome_guides = "%d guides are loaded.",
		tooltip_waypoint = COLOR_TIP_MOUSE.."Click|r"..COLOR_TIP.." to set waypoint: |cffffaa00%s|r",
		tooltip_waypoint_coords = "Location: |cffffaa00%s|r",

	-- ZygorMapIcon ---------------------------------------------------------------------------------------------------
		minimap_tooltip = COLOR_TIP_MOUSE.."(Left-Click)|r Notifications|n"..COLOR_TIP_MOUSE.."(Right-Click)|r Toggle Viewer",
		minimap_tooltip_ex1 = COLOR_TIP_MOUSE.."Ctrl+Alt+Right-click|r to start profiling|n",
		minimap_tooltip_ex2 = COLOR_TIP_MOUSE.."Ctrl+Alt+Right-click|r to stop profiling|n",

	-- Home screen widgets ---------------------------------------------------------------------------------------------------
		widgets_menu_configon = "Enter config mode",
		widgets_menu_configoff = "Exit config mode",
		widgets_menu_remove = "Remove all home screen widgets",
		widgets_menu_removefree = "Remove all game widgets",
		widgets_menu_lockfree = "Lock game widgets",
		widgets_menu_unlockfree = "Unlock game widgets",
		widgets_menu_exitadd = "Cancel",

		widget_uncapped = "No cap",
		widget_capped_general = "%s/%s",
		widget_capped_weekly = "Weekly %s/%s",

		widget_renown_name = "Covenant Renown",
		widget_renown_description = "Displays current and maximum renown level",
		widget_renown_header = "Covenant renown:",
		widget_renown_format = "%s/%s",

		widget_valor_name = "Valor points",
		widget_valor_description = "Displays current and maximum valor points",
		widget_valor_header = "Valor points:",
		widget_valor_format = "%s/%s",

		widget_conquest_name = "Conquest points",
		widget_conquest_description = "Displays current and maximum conquest points",
		widget_conquest_header = "Conquest points:",
		widget_conquest_format = "%s/%s",

		widget_dailyreset_name = "Daily reset",
		widget_dailyreset_description = "Shows time until daily reset",
		widget_dailyreset_header = "Daily reset in:",

		widget_weeklyreset_name = "Weekly reset",
		widget_weeklyreset_description = "Shows time until weekly reset",
		widget_weeklyreset_header = "Weekly reset in:",

		widget_mythicplus_name = "Mythic+ Affixes",
		widget_mythicplus_description = "Displays current Mythic+ affixes",
		widget_mythicplus_header = "Mythic+ affixes:",

		widget_callings_name = "Covenant Callings",
		widget_callings_description = "Displays active Covenant Callings",
		widget_callings_header = "Covenant callings:",
		widget_callings_empty = "No callings active.",

		widget_worldevents_name = "World Events",
		widget_worldevents_description = "Displays ongoing world events",
		widget_worldevents_header = "World events:",
		widget_worldevents_empty = "No ongoing world events.",

		widget_token_name = "WoW Token prices",
		widget_token_description = "Displays current wow token price and changes over last 3 months.",
		widget_token_header = "WoW Token Price:",
		widget_token_popup_current = "Current price: %s",
		widget_token_popup_low = "Lowest price: %s",
		widget_token_popup_high = "Highest price: %s",
		widget_token_popup_history = "Price history (90 days)",

		widget_worldbosses_name = "World bosses",
		widget_worldbosses_description = "Shows active world bosses",
		widget_worldbosses_header = "World bosses:",
		widget_worldbosses_empty = "No world bosses active.",

		widget_assaults_name = "Covenant assaults",
		widget_assaults_description = "Displays active Covenant Assaults",
		widget_assaults_header = "Covenant assaults",
		widget_assaults_empty = "No assaults active",
		widget_assaults_locked = "You have not unlocked assaults yet",
		widget_assaults_complete = "%s Assault completed",
		widget_assaults_next = "Next assault in %s",
		widget_assaults_remains = "%s left",

		widget_guidesuggest_name = "Suggested guides",
		widget_guidesuggest_description = "Displays guides suggested for you.",
		widget_guidesuggest_header = "Suggested guides",
		widget_guidesuggest_empty = "No suggested guides",

		widget_guidehistory_name = "Guides History",
		widget_guidehistory_description = "Displays last 5 used guides",
		widget_guidehistory_header = "Guides History",
		widget_guidehistory_empty = "Guides History is empty",

		widget_timeplayed_name = "Level tracker",
		widget_timeplayed_description = "Displays time played on each level",
		widget_timeplayed_header = "Level tracker",
		widget_timeplayed_line = "|cffaaaaaaLevel %s:|r %s",
		widget_timeplayed_unknown = "|cffaaaaaaLevel %s:|r unknown",
		widget_timeplayed_notyet = "|cffaaaaaaLevel %s:|r",
		widget_timeplayed_total = "|cffaaaaaaTotal to level %s:|r %s",
		widget_timeplayed_played = "|cffaaaaaaTotal time played:|r %s",

		widget_bank_name = "Bank",
		widget_bank_description = "Shows last seen bank content for current character and alts",
		widget_bank_header = "Player bank",
		widget_bank_header_detailed = "Bank content for %s",
		widget_bank_bankbag = "%d slots %s (%d free)",
		widget_bank_bankbag_owner = "%s's %d slots %s (%d free)",
		widget_bank_bankitem = "%d %s",
		widget_bank_space = "%d slots, %d free",
		widget_bank_nodata = "No data\nAccess your bank to update",
		widget_bank_allcharsfaction = "All %s %s characters",
		widget_bank_allchars = "All %s characters",

		widget_zygormessage_name = "Zygor Bulletin",
		widget_zygormessage_description = "Shows news and updates about Zygor",
		widget_zygormessage_header = "Zygor Bulletin",

		widget_notablequests_name = "Notable Quests",
		widget_notablequests_description = "Shows active world quests worth special attention",
		widget_notablequests_header = "Notable Quests:",
		widget_notablequests_empty = "No notable quests active.",

		widget_gold_name = "Gold tracker",
		widget_gold_description = "Displays your gold earning and spendings.",
		widget_gold_header = "Gold tracker",
		widget_gold_startmoney = "Starting gold: %s",
		widget_gold_spent = "Gold spent: %s",
		widget_gold_gain = "Gold gained: %s",
		widget_gold_now = "Current gold: %s",
		widget_gold_today_startmoney = "Starting: %s",
		widget_gold_today_spent = "Gained: %s",
		widget_gold_today_gain = "Spent: %s",
		widget_gold_today_now = "Current: %s",
		widget_gold_today = "Today",
		widget_gold_week = "Last week",
		widget_gold_month = "Last month",
		widget_gold_year = "Last year",
		widget_gold_todaychange = "Todays Earnings:",
		widget_gold_weekchange = "Weekly Earnings:",

		widget_dragonbane_name = "Dragonbane keep",
		widget_dragonbane_description = "Shows Dragonbane Keep status",
		widget_dragonbane_empty = "Keep assault not active",
		widget_dragonbane_timer = "Next siege in:",
		widget_dragonbane_locked = "You have not unlocked Dragonbane keep yet.",

		widget_grandhunt_name = "Grand Hunts",
		widget_grandhunt_description = "Shows grand hunt location and time",
		widget_grandhunt_empty = "No grand hunt",
		widget_grandhunt_noparty = "No hunting party",
		widget_grandhunt_generic = "Hunting party",
		widget_grandhunt_locked = "You have not unlocked grand hunts yet.",
		
		widget_feast_name = "Community feast",
		widget_feast_description = "Shows community feast status",
		widget_feast_next = "Next feast in:",
		widget_feast_locked = "You have not unlocked community feast yet.",

		widget_dragonrace_name = "Dragonracing",
		widget_dragonrace_description = "Shows multiplayer dragon races status",
		widget_dragonrace_locked = "You have not unlocked dragon races yet.",
}
-----------------------------------------------------------------------------------------------------------------
-- colour coding ------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	for k,v in pairs(f) do
		if type(v)=="string" then  f[k]=v:gsub("<<(.-)>>",COLOR_TIP_MOUSE.."%1"..COLOR_TIP)  end
	end
	return f
end)

ZygorGuidesViewer_L("Faction", "enUS", function() return {
	["going"] = "%d%% to %s"
} end)


local plurals = {
	Ballista="Ballistas",
	Bark=1,
	Beef=1,
	Briarthorn=1,
	Blood=1,
	Bruiseweed=1,
	Brief="Briefs",
	Cargo=1,
	Child="Children",
	Citizen="Citizens",
	Chutney=1,
	Dirt=1,
	Down=1,
	Dreamfoil=1,
	drunk=1,
	Dust=1,
	Earth=1,
	Felsworn=1,
	Felweed=1,
	Ferocious=1,
	Flesh=1,
	Flour=1,
	Gizmo="Gizmos",
	Glory=1,
	Gromsblood=1,
	Grow=1,
	Harvest=1,
	Heartwood=1,
	Honey=1,
	Ichor=1,
	Infantry=1,
	Insignia=1,
	Kingsblood=1,
	Leather=1,
	Lumber=1,
	Lotus="Lotuses",
	Man="Men",
	Mageroyal=1,
	Meat=1,
	Milk=1,
	Mogu=1,
	mogu=1,
	Mojo=1,
	Nitroglycerin=1,
	Nitrate=1,
	Oil=1,
	Ore=1,
	Port=1,
	Prey=1,
	Pulp=1,
	Rice=1,
	Sap=1,
	Silk=1,
	Snuff=1,
	Spawn=1,
	Stuff=1,
	Supplies=1,
	Talisman="Talismans",
	Tooth="Teeth",
	Topaz=1,
	Truegold=1,
	Venom=1,
	Vermin=1,
	Venison=1,
	Vrykul=1,
	Water=1,
	wildlife=1,
	Witchban=1,
	Worgen=1,
	Wood=1,
	Wolf="Wolves",
	Kodo="Kodos",
	Chef="Chefs",
	Cliff="Cliffs",
}

local specials = {
	{'in a duel',1},
	{'Scarlet Crusader slain',"Scarlet Crusaders"},
	{'Citizen of Havenshire slain',"Citizens of Havenshire"},
	{'Garm Invader slain',"Garm Invaders"},
	{'En\'kilah Casualty',"En'kilah mobs"},
	{'(.*) [sS]lain$',"%1"},
	{'(.*) Weed$',"%1 Weeds"},
	{'Smelt ',1},
	{'Miners\' Gear',1},
	{'Miracle%-Grow',1},
}

local wordspecials = {
	['haman$']="hamans",
	['(%a)man$']="%1men",
	['(%a)borne$']=1,
	['(%a)us$']="%1i",
	['%a*[fF]ish$']=1,
	['%a*[cC]loth$']=1,
}

local notverbs = { ['Seed']=1,['Wildseed']=1 }

ZygorGuidesViewer_L("Specials", "enUS", function() return {
	['plural'] = function (word)
			if not word then return end
			-- one-shot special cases
			for i,data in ipairs(specials) do
				if word:match(data[1]) then
					return data[2]==1 and word or word:gsub(data[1],data[2])
				end
			end

			-- breakdown.
			local rest=""
			local preof,postof = word:match("^(.-) of (.+)$")
			if preof then
				word=preof
				rest=" of "..postof
			else
				local obj,verb = word:match("^(.+)( %a-ed)$")
				if obj and not notverbs[verb:sub(2)] then
					word=obj
					rest=verb
				end
			end

			local notlastw,lastw = word:match("^(.+%s)(.-)$")
			if lastw then
				word=lastw
			else
				notlastw=""
			end

			-- got a proper exception for this word?
			if plurals[word] then
				return notlastw .. (plurals[word]==1 and word or plurals[word]) .. rest
			-- well, got a regexp for it?
			else
				for sing,plur in pairs(wordspecials) do
					if word:match(sing) then
						return notlastw .. (plur==1 and word or word:gsub(sing,plur)) .. rest
					end
				end

				--else...

				-- just use language defaults, I guess.
				local last = word:sub(-1)
				if (last=="y" and not word:sub(-2):match("[aeiou]y")) then
					return notlastw .. word:sub(1,-2).."ies" .. rest
				elseif word:sub(-2)=="ff" then
					return notlastw .. word:sub(1,-3).."ves" .. rest
				elseif last=="f" then
					return notlastw .. word:sub(1,-2).."ves" .. rest
				elseif word:sub(-2)=="fe" then
					return notlastw .. word:sub(1,-3).."ves" .. rest
				elseif word:sub(-3)=="ess" then
					return notlastw .. word.."es" .. rest
				elseif word:sub(-2)=="ch" or word:sub(-2)=="sh" then
					return notlastw .. word.."es" .. rest
				elseif last=="x" then
					return notlastw .. word.."es" .. rest
				elseif last=="s" then
					return notlastw .. word .. rest
				elseif last=="o" then
					return notlastw .. word .."es" .. rest
				-- the following is to prevent pluralization of goal items ending with a double-quote
				elseif last=="\"" then
					return notlastw .. word .. rest
					--print(notlastw.."..."..word.."..."..rest)
				else
					return notlastw .. word.."s" .. rest
				end
			end
		end,

	['contract_mobs'] = function(mobs)
			local start,ending

			if not mobs[1].name and type(mobs)=="table" then
				local l=mobs
				mobs={}
				for i=1,#l do mobs[i]={name=l[i]} end
			end

			if mobs[1].name:match("^Echo of") then return nil end

			local common,lastcommon,all
			for i=1,5 do
				common = mobs[1].name:match("^([%a']+" .. (" [%a']+"):rep(i-1) .. ")")
				if not common then break end
				all=true
				for m=2,#mobs do
					if mobs[m].name:find(common)~=1 then
						all=false
						break
					end
				end
				if all then
					lastcommon=common
				else
					break
				end
			end

			if lastcommon then
				return ZygorGuidesViewer_L("Specials")['contract_mobs_start'](lastcommon)
			end

			-- start failed? let's try end.
			lastcommon=nil
			for i=1,5 do
				common = mobs[1].name:match("([%a']+" .. (" [%a']+"):rep(i-1) .. ")$")
				if not common then break end
				all=true
				for m=2,#mobs do
					if mobs[m].name:sub(-#common)~=common then
						all=false
						break
					end
				end
				if all then
					lastcommon=common
				else
					break
				end
			end

			if lastcommon then
				return ZygorGuidesViewer_L("Specials")['contract_mobs_end'](lastcommon)
			end

			--else
			return nil
		end,

	['contract_mobs_start'] = function(s) return s.." mobs" end,
	['contract_mobs_end'] = function(s) return ZygorGuidesViewer_L("Specials")['plural'](s) end,

	['plural_unittest'] = function()
		local function test(s,p)
			local sp = ZygorGuidesViewer_L("Specials").plural(s)
			if sp~=p then print("Pluralization failed: '"..s.."' -> '"..sp.."', should be '"..p.."'") end
		end

		-- specials
		test("Meat","Meat")
		test("Oil of Olaz","Oil of Olaz")
		test("Big Crappers slain","Big Crappers")

		-- word specials
		test("Dead Shaman of Crap","Dead Shamans of Crap")
		test("Eric Cartman","Eric Cartmen")

		-- tails
		test("Knife","Knives")
		test("Flesh","Flesh")
		test("Staff of Doom","Staves of Doom")
		test("Ally of Crap","Allies of Crap")
		test("Dead Priestess","Dead Priestesses")
		test("Bitch","Bitches")
		test("Sex","Sexes")
		test("Kris","Kris")
		test("Jello","Jelloes")
		test("Dog","Dogs")

	end
} end)

ZygorGuidesViewer_L("Specials").plural_unittest()

-- Add lines for any translations needed for:

-- MISC STRINGS

ZygorGuidesViewer_L("G_string", "enUS", function() return {
--	["blabla"] = TRUE,
} end)

local function C_GREEN(s) return "|cff00ff00"..s.."|r" end
local function C_WHITE(s) return "|cffffffff"..s.."|r" end
local function C_RED(s) return "|cffff0000"..s.."|r" end
local function C_GRAY(s) return "|cffaaaaaa"..s.."|r" end
local SLASH = C_GRAY("/")

ZygorGuidesViewer_L("zta", "enUS", function() return {
	['name'] = "Talent Advisor",
	['name_plain'] = "Zygor Talent Advisor",
	['desc'] = "Suggests which talents you should invest your talent points in on each level, for you to level optimally.",

	['opt_enabled'] = "Enable Talent Advisor",

	['opt_build_header'] = "Player build",
	['opt_build'] = "Select a build:",
	['opt_build_desc'] = "The Advisor will keep suggesting talents to pick up as you progress, to ensure this build serves you optimally.",
	['opt_petbuild_header'] = "Pet build",
	['opt_petbuild'] = "Select a build:",
	['opt_petbuild_desc'] = "Select a build for your current pet. Note that pet types differ, you must choose a suitable build.",
	['opt_build_none'] = "|cffbbbbbbNo build selected",
	['opt_force'] = "Allow this build",
	['opt_force_desc'] = "Allow this build. By default, it's wisest to avoid combining incompatible or broken builds. By forcing this, you're taking your own responsibility for what happens - you may end up with a ridiculous build.",
	['opt_talentframe'] = "Talent Interface features",
	['opt_hints'] = "Show advice balloons",
	['opt_hints_desc_nopreview'] = "Show advice as balloons indicating suggested talent upgrades.",
	['opt_hints_desc_preview'] = "Show advice as balloons indicating suggested talent upgrades:\n|cff00ff00+1|r ... |cff00ff00+5|r - upgrade this talent by # points,\n|cffffff00V|r - talent upgraded properly,\n|cffff0000X|r - talent overdone, remove points from it or you'll break the build.",
	['opt_preview'] = "Show selected build's talent ranks",
	['opt_preview_desc'] = "Display final talent ranks, according to the selected build, as numbers in the talent rank boxes:\n"..C_GREEN(0)..SLASH..C_WHITE(2).." - upgrade this talent up to 2 ranks,\n"..C_WHITE(2)..SLASH..C_WHITE(2).." - suggested rank reached,\n"..C_RED(3)..SLASH..C_WHITE(2).." - you have exceeded the suggested rank and broken the build.", --, unless you're in preview mode)
	['opt_popup'] = "What shall we do when new talent points are available?",
	['opt_popup_desc'] = "Talent Advisor can pop up your talents frame or its own advice window, whenever new points are available for spending, or even automatically learn the suggested talents.",
	['opt_popup_0'] = "Nothing",
	['opt_popup_1'] = "Open the talents frame  |cffaaaaaa(for manual learning)|r",
	['opt_popup_2'] = "Open the advice window  |cffaaaaaa(for one-click learning)|r",
	['opt_popup_3'] = "Learn automatically  |cffffdd00(careful!)|r",
	['opt_popup_dock'] = "Dock the advice window onto the Talent Interface",
	['opt_popup_dock_desc'] = "When docked, the advice window appears and disappears with the Talent Interface.\nWhen not docked, it appears independently and can be moved anywhere.\nNote: you can just drag the advice window off the side of the Talent Interface to undock it, or back to dock it again.",


	['opt_petbuild_ferocity'] = "|cffff8888Ferocity|r",
	['opt_petbuild_tenacity'] = "|cffffff88Tenacity|r",
	['opt_petbuild_cunning'] = "|cffff88ffCunning|r",

	['status_badtalent0'] = "You have spent %d points in the talent '%s', while it is not used in the selected build.",
	['status_badtalent'] = "You have spent %d points in the talent '%s', while it only reaches rank %d in the selected build.",
	['status_oootalent'] = "Your talent '%s' is presently rank %d, instead of %d.",

	['status_green'] = "This build fits your character |cff88ff88correctly|r.",
	['status_green_pet'] = "This build fits your pet |cff88ff88correctly|r.",
	['status_yellow'] = "Your current talents match the selected build, but they were chosen |cffeeff44out of suggested order|r. Luckily, you still have enough talent points available to complete the build now.",
	['status_orange'] = "|cffffbb00Warning:|r Your current talents match the selected build, but they were chosen |cffffee44out of order|r and right now you |cffffee44don't|r have enough talent points available to return to the optimal build path. You will need to gain %d more talent point(s) to again develop optimally.",
	['status_red'] = "|cffff0000Error:|r This build |cffff5555doesn't match|r your current talents. If you want to use this build, please reset your talents, or check the 'Allow this build' option to override safety measures.",
	['status_red_forced'] = "|cffff0000Warning:|r This build |cffff5555doesn't match|r your current talents, but we'll try to make the best out of it anyway.|nYou'll miss |cffff5555%d|r talents.",
	['status_black_nopet'] = "|cffff0000Error:|r You do not have a pet active. Unable to activate a pet build.",
	['status_black_badpet'] = "|cffff0000Error:|r This build is incompatible with %s. Choose a %s type build, or change your pet.",
	['status_black_badblizzard'] = "This build contains broken Blizzard-style data.",
	['status_black_brokenbuild'] = "|cffff0000Error:|r |cffffaaaaThis build contains unrecognized talents. It is broken and unusable.|r\n%s",
	['status_black_builderror'] = "|cffff0000Error:|r |cffffaaaaThis build requires %d points in the talent '%s', while only %d are possible! It is broken and unusable|r.",
	['status_black_smallbuild'] = "|cffff0000Error:|r This build has only %d talents in it, while you have already spent %d. This build is either incomplete, or is a 'starting' build and not applicable anymore.",
	['status_black_complete'] = "This build is now complete.\nGo forth and be awesome.",
	['status_black_different'] = "This is a different build, but your character's build is complete.\nYou'll have to reset your talents to use this build.",
	--['status_black_differentspec'] = "This is a build for a '%s' specialization, while you have chosen '%s'.\nYou'll have to reset your talents or dualspec to use this build.",
	['warning_learn1_orange'] = "|cffffbb00Notice:|r\nFor the selected build, |cff5588ff%s|r, it is advised that you learn the %s talent |cffffff55%s|r at this point.\nThe talent you selected is indeed in this build, but it is not recommended at this point yet. Learning talents out of order may result in less than optimal progress.\nAre you sure you wish to learn |cffff5555%s|r now?",
	['warning_learn1_red0'] = "|cffff0000Warning!|r\nFor the selected build, |cff5588ff%s|r, you should |cffff7777never|r learn this talent!\nZygor Talent Advisor will be unable to help you with this build anymore.\nAre you absolutely sure you wish to learn it?",
	['warning_learn1_red'] = "|cffff0000Warning!|r\nFor the selected build, |cff5588ff%s|r, you should |cffff7777never|r exceed rank %s of |cffffff55%s|r.\nZygor Talent Advisor will be unable to help you with this build anymore.\nAre you absolutely sure you wish to do this?",
	['warning_preview_green'] = "|cff00ff00Note:|r These talents match the |cff5588ff%s|r build plan, it is safe to learn them.",
	['warning_preview_orange'] = "|cffffbb00Notice:|r\nThe talents selected in the preview do not quite match the talents suggested for the selected build, |cff5588ff%s|r.\nIf you learn them, you will have to gain %d |1more talent point;more talent points; to again proceed with the build plan.\nAre you sure you wish to learn the talents you selected?",
	['warning_preview_red'] = "|cffff0000Warning!|r\nThe talents selected in the preview |cffff7777will prevent you|r from ever completing the selected build, |cff5588ff%s|r.\nZygor Talent Advisor will be unable to help you with this build anymore.\nAre you absolutely sure you wish to learn them anyway?",
	['warning_preview_black'] = "|cffff0000Warning!|r\nThe build is either broken or doesn't match your specialization.|n|n%s|n|nAre you absolutely sure you wish to learn it anyway?",

	['statusglyph_red'] = "RED glyph status? WTF? Please report this.",
	['statusglyph_orange'] = "You need to remove some of the glyphs you have.",
	['statusglyph_yellow'] = "You need to inscribe some new glyphs, but you'll need to unlock remaining glyph slots to complete the glyph set.",
	['statusglyph_green'] = "You need to inscribe some new glyphs.",
	['statusglyph_gold'] = "Your glyphs are in order, citizen. Proceed.",

	-- popout
	['preview_button'] = "Preview",
	['preview_button_done'] = "Previewed",
	['preview_button_tooltip'] = "Click to use the Talent Preview mode to preview the suggested talents.",

	['learn_button_text'] = "Learn All",
	['learn_button_tooltip'] = "Click to start learning all the suggested talents.",
	['learn_button_abort'] = "Abort",

	['configure_button'] = "Configure",
	['configure_button_tooltip'] = "Click to set up a target build or configure the Advisor.",

	['window_header_buildlabel'] = "Build:",
	['window_header_build'] = "|cffffffff%s|r",
	['window_header_buildnone'] = "none",

	['window_suggestion_nobuild'] = "Click the Configure button below to set up a target build.",
	['window_suggestion_normal'] = "Currently suggested talents:",
	['window_suggestion_none'] = "No suggestions can be made.",
	['window_suggestion_nopoints'] = "You have no talent points available.",
	['window_suggestion_inactivespec'] = "Cannot operate on an inactive specialization.\nPlease switch your view to the current specialization, or activate this one.",
	['window_status_orange'] = "Warning: you're off the suggested build path!|nYou need %d points more than you have.",
	['window_status_red'] = "Warning: this build is not compatible with your talents.",

	--[[
	['window_suggheader1_normal'] = "You have %d talent point(s) available!",
	['window_suggheader1_normal_pet'] = "Your pet has %d talent point(s) available!",
	['window_suggintro_normal'] = "Zygor Talent Advisor suggests that you take the following talent:",

	['window_header_preview'] = "You have %d talent point(s) available!",
	['window_header_preview_pet'] = "Your pet has %d talent point(s) available!",
	['window_intro_preview'] = "Zygor Talent Advisor suggests that you take the following talent:",

	['window_headerdone_preview'] = "All talent points assigned!",
	['window_introdone_preview'] = "Since you're using the talent preview mode, click below to learn your new talents.",

	['window_headernone'] = "You have no talent points available.",
	['window_headernone_pet'] = "Your pet has no talent points available.",
	--]]

	['warning_learn1_yellow'] = "|cffffbb00Notice:|r\nFor the selected build, |cff5588ff%s|r, it is advised that you learn the |cff55ffaa%s|r talent:\n|cffffff55%s|r\n\nThe talent you selected is present in this build, but it is recommended to take it later. Learning talents out of order may result in less than optimal progress.\n\nAre you sure you wish to learn\n|cffff5555%s|r\nat this point?",
	['warning_learn1_red0'] = "|cffff0000Warning!|r\nFor the selected build, |cff5588ff%s|r, you should |cffff7777not|r learn this talent!\n\nAre you absolutely sure you wish to learn it?",
	['warning_learn1_red'] = "|cffff0000Warning!|r\nFor the selected build, |cff5588ff%s|r, you should |cffff7777not|r exceed rank %s of |cffffff55%s|r.\n\nAre you absolutely sure you wish to learn it?",
	['warning_preview_green'] = CONFIRM_LEARN_PREVIEW_TALENTS.."\n\n|cff00ff00Note:|r These talents match the |cff5588ff%s|r build plan, it is safe to learn them.",
	['warning_preview_yellow'] = "|cffffbb00Notice:|r\nThe talents selected in the preview do not quite match the talents suggested for the selected build, |cff5588ff%s|r.\nIf you learn them, you will have to gain %d |1more talent point;more talent points; to again proceed with the build plan.\nAre you sure you wish to learn the talents you selected?",
	['warning_preview_red'] = "|cffff0000Warning!|r\nThe talents selected in the preview |cffff7777will prevent you|r from ever completing the selected build, |cff5588ff%s|r.\n\nAre you absolutely sure you wish to learn them anyway?",
	['warning_preview_black'] = "|cffff0000Warning!|r\nThe build is either broken or doesn't match your specialization.|n|n%s|n|nAre you absolutely sure you wish to learn it anyway?",

	['warning_bulklearn'] = "|cffffff88Z|cffffee66y|cffffdd44g|cffffcc22o|cffffbb00r|r |cffffaa00Talent Advisor|r suggests the following talents for the selected build, '|cff5588ff%s|r':\n\n%s\n"..CONFIRM_LEARN_PREVIEW_TALENTS,

	['tutorial_ZTA1_title'] = "Zygor Talent Advisor: Basics",
	['tutorial_ZTA1_text'] = "The talents you choose for your character are one of the key aspects of World of Warcraft. However, it is often just as crucial to know which talents to concentrate on early, and which ones to leave for later.\n\nZygor Talent Advisor can guide you, level by level, towards achieving specially optimized builds.",
	['tutorial_ZTA2_title'] = "Zygor Talent Advisor: Talent Time",
	['tutorial_ZTA_text'] = "You have talent points available - however, you have not yet chosen a build. You can find build settings under Options - Interface - Addons - Zygor Talent Advisor.",
	['tutorial_ZTA3_title'] = "Zygor Talent Advisor: Suggestion",
	['tutorial_ZTA3_text'] = "You have talent points available, and the Advisor has a suggestion how you should spend them. Open your Talents window (press 'N') and look for hint bubbles: |cff55ff55+1|r, |cff55ff55+2|r, etc.",

	['minimap_tooltip'] = COLOR_TIP_MOUSE.."Click|r to show talent suggestions\n"..COLOR_TIP_MOUSE.."Right-click|r to configure",
	['minimap_tooltip_hunter'] = COLOR_TIP_MOUSE.."Click|r to show talent suggestions\n"..COLOR_TIP_MOUSE.."Shift-click|r to show pet talent suggestions\n"..COLOR_TIP_MOUSE.."Right-click|r to configure",

	['opt_mapbutton'] = "Show minimap button",
	['opt_mapbutton_desc'] = "Show the Zygor Talent Advisor button next to your minimap",

	['pattern_talentgained'] = "^You have gained (%d) talent point",
	['pattern_talentgained_pet'] = "^Your pet has learned a new talent",

	['error_bulklearn_nobuild'] = "You have not selected a build.",
	['error_bulklearn_nosuggestion'] = "No suggestions can be made at this point.",

	['msg_learned'] = "Learned the suggested talents.",
	['msg_learned_talent'] = "Learned the suggested talent: |cff5588ff%s|r",
	['msg_learned_verbose'] = "Learned the suggested talents:",
	['msg_learned_verbose_talent'] = "  %s",

	['opt_report'] = "Create a bug report",
	['opt_report_desc'] = "Create a detailed report of this addon's current status, for debugging purposes.",

	['talenttooltip'] = "Suggested rank for |cff5588ff%s|r build:  %s%s",
	['talenttooltip_overshot'] = "|cffff8800You have %d rank(s) too many for this build!",
	['talenttooltip_undershot'] = "You'll need to put %d rank(s) more in this talent.",
	['talenttooltip_ok'] = "|cff88ff88This talent is at the suggested rank for this build.",
	['talenttooltip_none'] = "|cffffaaaaThis talent is not recommended in this build.",

	['popout_button_tip'] = "The Advisor will suggest talents|nfor you to pick anytime you have|ntalent points to spend.",

	['binding_popout'] = "Show Suggestion Window",

	['glyphsug_title'] = "Suggested glyphs:",
	['glyphtype_0'] = "Prime ",
	['glyphtype_1'] = "Major ",
	['glyphtype_2'] = "Minor ",

	['ta_toggle_icons'] = "Show Zygor talent suggestions",
	['ta_select_suggested'] = "Select Zygor suggested build",
} end)


do return end
--[[
	local overlay =

/run f=ZGV.ChainCall(CreateFrame("FRAME","ZygorGuidesViewerDrawingOverlay",ZygorGuidesViewerPointerOverlay)) :SetSize(1,1) :SetPoint("CENTER") .__END   t=ZGV.ChainCall(f:CreateTexture("ZGVline01", "ARTWORK")) :SetColorTexture(0) :SetSize(100,5) :SetPoint("center") .__END
/run ag=f:CreateAnimationGroup() a=ZGV.ChainCall(ag:CreateAnimation("Rotation")) :SetDegrees(30) :SetDuration(0.01) .__END
--]]