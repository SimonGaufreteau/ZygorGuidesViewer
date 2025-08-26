local name,ZGV = ...

-- #GLOBALS ZygorGuidesViewer

local GuideMenu = ZGV.GuideMenu

GuideMenu.Featured={}

table.insert(GuideMenu.Featured,{
	title="Classic", group="cla",
})




if ZGV.IsClassicSoD then
table.insert(GuideMenu.Featured,{
	title="Season of Discovery - Phase 2", group="SoD_Phase2",hideif=not ZGV.IsClassicSoD,
{"section", text=[[LEVELING]]},
        {"banner", image=ZGV.IMAGESDIR.."SODLevelingP2",showcaseonly=true},
	{"content", text=[[Druid Rune Engravings]]},
	{"columns",
	{"item", text=[[**Berserk [Thousand Needles]**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Berserk [Thousand Needles]"},
	{"item", text=[[**Dreamstate [Desolace]**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Dreamstate [Desolace]"},
	{"item", text=[[**Eclipse**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Eclipse"},
	{"item", text=[[**King of the Jungle**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\King of the Jungle"},
	{"item", text=[[**Nourish**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Nourish"},
	{"item", text=[[**Survival Instincts**]], guide="Leveling Guides\\Season of Discovery Runes\\Druid\\Phase 2 Runes\\Survival Instincts"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to strengthen your bond with nature.]]},

	{"content", text=[[Hunter Rune Engravings]]},
	{"columns",
	{"item", text=[[**Dual Wield Specialization [Stranglethorn Vale]**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Dual Wield Specialization [Stranglethorn Vale]"},
	{"item", text=[[**Expose Weakness**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Expose Weakness"},
	{"item", text=[[**Invigoration**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Invigoration"},
	{"item", text=[[**Melee Specialist**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Melee Specialist"},
	{"item", text=[[**Steady Shot [Arathi Highlands]**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Steady Shot [Arathi Highlands]"},
	{"item", text=[[**Trap Launcher**]], guide="Leveling Guides\\Season of Discovery Runes\\Hunter\\Phase 2 Runes\\Trap Launcher"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities in persuit of even bigger game.]]},

	{"content", text=[[Mage Rune Engravings]]},
	{"columns",
	{"item", text=[[**Brain Freeze [Various Zones]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Brain Freeze [Various Zones]"},
	{"item", text=[[**Chronostatic Preservation [Thousand Needles]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Chronostatic Preservation [Thousand Needles]"},
	{"item", text=[[**Frostfire Bolt [Stranglethorn Vale]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Frostfire Bolt [Stranglethorn Vale]"},
	{"item", text=[[**Hot Streak [Alterac Mountains]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Hot Streak [Alterac Mountains]"},
	{"item", text=[[**Missile Barrage [Deadwind Pass]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Missile Barrage [Deadwind Pass]"},
	{"item", text=[[**Spellfrost Bolt [Stranglethorn Vale]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spellfrost Bolt [Stranglethorn Vale]"},
	{"item", text=[[**Spell Power [Various Zones]**]], guide="Leveling Guides\\Season of Discovery Runes\\Mage\\Phase 2 Runes\\Spell Power [Various Zones]"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to improve your mastery of magic.]]},

	{"content", text=[[Paladin Rune Engravings]]},
	{"columns",
	{"item", text=[[**Enlightened Judgements [Arathi Highlands]**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Enlightened Judgements [Arathi Highlands]", faction="A"},
	{"item", text=[[**Guarded by the Light [Alterac Mountains]**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Guarded by the Light [Alterac Mountains]", faction="A"},
	{"item", text=[[**Infusion of Light**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Infusion of Light", faction="A"},
	{"item", text=[[**Sacred Shield**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Sacred Shield", faction="A"},
	{"item", text=[[**Sheath of Light**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\Sheath of Light", faction="A"},
	{"item", text=[[**The Art of War**]], guide="Leveling Guides\\Season of Discovery Runes\\Paladin\\Phase 2 Runes\\The Art of War", faction="A"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to smite foes of the light.]]},

	{"content", text=[[Priest Rune Engravings]]},
	{"columns",
	{"item", text=[[**Dispersion [Stranglethorn Vale]**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Dispersion [Stranglethorn Vale]"},
	{"item", text=[[**Empowered Renew [Alterac Mountains]**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Empowered Renew [Alterac Mountains]"},
	{"item", text=[[**Mind Spike**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Mind Spike"},
	{"item", text=[[**Pain Suppression**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Pain Suppression"},
	{"item", text=[[**Renewed Hope [Desolace]**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Renewed Hope [Desolace]"},
	{"item", text=[[**Spirit of the Redeemer**]], guide="Leveling Guides\\Season of Discovery Runes\\Priest\\Phase 2 Runes\\Spirit of the Redeemer"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to aid your spiritual journey.]]},

	{"content", text=[[Rogue Rune Engravings]]},
	{"columns",
	{"item", text=[[**Master of Subtlety [Stranglethorn Vale]**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Master of Subtlety [Stranglethorn Vale]"},
	{"item", text=[[**Poisoned Knife**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Poisoned Knife"},
	{"item", text=[[**Rolling with the Punches [Thousand Needles]**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Rolling with the Punches [Thousand Needles]"},
	{"item", text=[[**Shadowstep**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shadowstep"},
	{"item", text=[[**Shuriken Toss [Swamp of Sorrows]**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Shuriken Toss [Swamp of Sorrows]"},
	{"item", text=[[**Waylay**]], guide="Leveling Guides\\Season of Discovery Runes\\Rogue\\Phase 2 Runes\\Waylay"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to strike silently from the shadows.]]},

	{"content", text=[[Shaman Rune Engravings]]},
	{"columns",
	{"item", text=[[**Ancestral Awakening**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Ancestral Awakening", faction="H"},
	{"item", text=[[**Decoy Totem**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Decoy Totem", faction="H"},
	{"item", text=[[**Fire Nova**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Fire Nova", faction="H"},
	{"item", text=[[**Maelstrom Weapon**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Maelstrom Weapon", faction="H"},
	{"item", text=[[**Power Surge**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Power Surge", faction="H"},
	{"item", text=[[**Spirit of the Alpha**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Spirit of the Alpha", faction="H"},
	{"item", text=[[**Two-Handed Mastery**]], guide="Leveling Guides\\Season of Discovery Runes\\Shaman\\Phase 2 Runes\\Two-Handed Mastery", faction="H"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to commune with the spirits of nature.]]},

	{"content", text=[[Warlock Rune Engravings]]},
	{"columns",
	{"item", text=[[**Dance of the Wicked [Thousand Needles]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Dance of the Wicked [Thousand Needles]"},
	{"item", text=[[**Demonic Knowledge**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Demonic Knowledge"},
	{"item", text=[[**Grimoire of Synergy**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Grimoire of Synergy"},
	{"item", text=[[**Invocation [Arathi Highlands]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Invocation [Arathi Highlands]"},
	{"item", text=[[**Shadow and Flame**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadow and Flame"},
	{"item", text=[[**Shadowflame [Desolace]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warlock\\Phase 2 Runes\\Shadowflame [Desolace]"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to master command of fel creatures.]]},

	{"content", text=[[Warrior Rune Engravings]]},
	{"columns",
	{"item", text=[[**Blood Surge**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Blood Surge"},
	{"item", text=[[**Enraged Regeneration**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Enraged Regeneration"},
	{"item", text=[[**Focused Rage [Arathi Highlands]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Focused Rage [Arathi Highlands]"},
	{"item", text=[[**Intervene [Thousand Needles]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Intervene [Thousand Needles]"},
	{"item", text=[[**Precise Timing**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Precise Timing"},
	{"item", text=[[**Rallying Cry [Badlands]**]], guide="Leveling Guides\\Season of Discovery Runes\\Warrior\\Phase 2 Runes\\Rallying Cry [Badlands]"},
	}, --columnsend
	{"text", text=[[Acquire powerful new abilities to improve your martial prowess.]]},
}) 
end