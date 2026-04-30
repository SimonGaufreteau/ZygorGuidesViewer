# Zygor Guide Syntax Reference

This document describes the syntax used to write Zygor leveling guides, based on the actual guide files in this project.
DISCLAIMER : THIS DOCUMENT WAS MOSTLY AI GENERATED BASED ON A ANALYSIS OF THE CURRENT GUIDES (over 20k lines of guides)

## Overall Structure

Guide content is embedded inside Lua files as `[[ ]]` multiline strings passed to `RegisterGuide()`:

```lua
ZygorGuidesViewer:RegisterGuide(
  'Leveling Guides\\Human Starter (1-15)',   -- guide path/name
  {                                           -- options table
    image = ZGV.IMAGESDIR .. 'Elwynn Forest',
    condition_suggested = function() return raceclass('Human') and level <= 12 end,
    condition_suggested_race = function() return raceclass('Human') end,
    condition_suggested_exclusive = true,
    next = 'Leveling Guides\\Darkshore (13-17)',
    hardcore = true,
  },
  [[
step
-- guide content here
]])
```

### RegisterGuide Options

| Option | Description |
|--------|-------------|
| `image` | Background image for the guide |
| `condition_suggested` | Function returning whether this guide should be suggested |
| `condition_suggested_race` | Function returning whether this guide matches the player's race |
| `condition_suggested_exclusive` | If `true`, only suggest this guide (not others) |
| `next` | Path to the next guide in the chain |
| `hardcore` | If `true`, guide is available in hardcore mode |

## Steps

A guide is a sequence of **steps**. Each step starts with the `step` keyword on its own line. Everything until the next `step` keyword belongs to that step.

```
step
talk Deputy Willem##823
accept A Threat Within##783 |goto Elwynn Forest 48.17,42.95
step
kill 10 Kobold Vermin##6 |q 7/1 |goto Elwynn Forest 47.49,36.15
```

A step can be empty (just `step` followed by another `step`).

## Lines

Each line inside a step is one of:

1. **Action line** — starts with an action keyword or free text, optionally followed by pipe directives
2. **Directive-only line** — starts with `|` (a pipe directive with no action)
3. **Stickystart / Label** — special step flow control
4. **Path line** — pathing instructions
5. **Comment** — starts with `//`

## ID References

The `Name##ID` pattern is used everywhere to reference game objects:

```
talk Deputy Willem##823           -- NPC with ID 823
accept A Threat Within##783       -- Quest with ID 783
collect Powers of the Void##6785  -- Item with ID 6785
learnspell Immolate##348          -- Spell with ID 348
click Equipment Box##164662+      -- Object with ID 164662 (+ means multiple)
```

### Edge Cases

- **Trailing `+`**: `kill Defias Thug##38+` — the `+` after the ID means "kill multiple" or "repeatable click"
- **`object=` prefix**: `click Xabraxxis' Demon Bag##object=177624` — explicit object type
- **Text name instead of numeric ID**: `talk Cavindra##Cavindra` — sometimes the ID is a name
- **Empty ID**: `click Termite Barrel##` — `##` with nothing after it
- **`#` in the name**: `collect Secret Note #3##12768` — single `#` is valid in item names, only `##` is the separator

## Line-Start Actions

These keywords start a line and are followed by text/ID references:

### Quest Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `accept` | Accept a quest | `accept A Threat Within##783` |
| `turnin` | Turn in a quest | `turnin Wolves Across the Border##33` |

### NPC Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `talk` | Talk to an NPC | `talk Deputy Willem##823` |
| `kill` | Kill enemies | `kill 10 Kobold Vermin##6` |
| `buy` | Buy from a vendor | `buy Gladius##2488` |
| `bank` | Deposit into bank | `bank Zhevra Hooves##5086` |

### Item Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `collect` | Collect/loot an item | `collect 8 Tough Wolf Meat##750` |
| `use` | Use an item | `use Hearthstone##6948` |
| `trash` | Destroy an item | `trash Hearthstone##6948` |
| `click` | Click a world object | `click Bundle of Wood##176793+` |
| `equip` | Equip an item | `equip Goggles of Gem Hunting##5888` |

### Spell Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `learnspell` | Learn a spell from a trainer | `learnspell Battle Shout##6673` |
| `learn` | Learn a recipe/profession | `learn Brown Linen Robe##7623` |

### Movement Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `home` | Set hearthstone location | `home Stormwind City` |
| `fpath` | Discover a flight path | `fpath Stormwind` |

### Other Actions

| Keyword | Description | Example |
|---------|-------------|---------|
| `ding` | Reach a level | `ding 3` or `ding 3,1150` (level + XP) |

### Free Text

Any line that doesn't start with a keyword or `|` is treated as free text (an instruction to the player):

```
Enter the building |goto Elwynn Forest 48.31,41.99 < 10 |walk
Kill enemies around this area
Follow the road |goto Elwynn Forest 47.05,47.69 < 20 |only if walking
Sell your trash |vendor Godric Rothgar##1213 |q 15
Click Here to Continue |confirm
Summon Your Imp |complete warlockpet("Imp") |q 18 |future
Die on Purpose |complete isdead |goto Tirisfal Glades 26.84,59.41
Hearth to Booty Bay |goto Stranglethorn Vale 26.87,77.01 |noway |c
Train Two-Handed Axes |complete weaponskill("TH_AXE") > 0
```

### Text Formatting

Use `_text_` for emphasis (displayed as italic/bold in-game):

```
_Destroy This Item:_
_NOTE:_
_Inside Deeprun Tram:_
Select _"Train me."_ |gossip 95665
```

## Pipe Directives

Directives start with `|` and modify the behavior of the line. Multiple directives can be chained on a single line.

### `|goto` — Location

Sets the waypoint arrow to a location.

```
|goto Elwynn Forest 48.17,42.95
|goto Elwynn Forest/0 47.69,41.42       -- /0 is the map floor
|goto Stormwind City 55.68,59.72 < 10   -- < 10 = completion radius
```

### `|q` — Quest Reference

Links the line to a quest objective.

```
|q 783                -- quest ID
|q 7/1                -- quest ID / objective number
|q 6661/1             -- complete when objective 1 of quest 6661 is done
```

### `|only if` / `|only` — Conditions

Makes the line or step conditional.

**On its own line** (step-level condition — applies to the entire step):
```
step
learnspell Battle Shout##6673 |goto Elwynn Forest 50.24,42.28
|only if Warrior
```

**Inline** (line-level condition — applies only to that line):
```
accept Stolen Power##77621 |goto Elwynn Forest 49.87,42.65 |only if ZGV.IsClassicSoD
```

**Important**: `|only if` on its own line = step condition. `|only if` at the end of a content line = line condition. This distinction matters when editing guides.

#### Condition Expressions

Conditions support Lua-like boolean expressions:

```
|only if Warrior
|only if Human Warlock
|only if not Warlock
|only if (Warrior or Warlock) and level <= 2
|only if haveq(62) or haveq(87)
|only if completedq(1886)
|only if itemcount(2488) == 0
|only if subzone("Jasperlode Mine") and _G.IsIndoors()
|only if not zone("Loch Modan")
|only if guideflag("DMflag")
|only if walking
|only if hardcore
|only if ZGV.IsClassicSoD
```

**Available variables**: `Warrior`, `Paladin`, `Priest`, `Mage`, `Warlock`, `Rogue`, `Hunter`, `Druid`, `Shaman`, `Human`, `Dwarf`, `Gnome`, `NightElf`, `Orc`, `Troll`, `Tauren`, `Scourge`, `Undead`, `level`, `hardcore`, `selfmade`, `walking`, `isdead`

**Available functions**: `haveq(ID)`, `readyq(ID)`, `completedq(ID)`, `itemcount(ID)`, `subzone("name")`, `zone("name")`, `guideflag("name")`, `warlockpet("type")`, `raceclass("Race")`, `_G.IsIndoors()`

### `|tip` — Tooltip/Hint

Displays a hint to the player. Does not affect step completion.

```
|tip Inside the building.
|tip You will need 10 copper.
|tip They look like small grey rats on the ground around this area.
```

Tips can have directives after them:
```
|tip Make sure to step quite a bit back. |only if hardcore
|tip Enemies near huts will likely pull in groups. |only if hardcore |notinsticky
```

### `|complete` — Completion Condition

Custom completion expression (Lua):

```
|complete warlockpet("Imp")
|complete isdead
|complete not isdead
|complete weaponskill("TH_AXE") > 0
|complete hasbuff(410935)
```

### `|vendor` / `|trainer` — NPC Interaction

Opens the vendor/trainer window:

```
|vendor Godric Rothgar##1213
|trainer Woo Ping##461
```

### `|skillmax` — Profession/Skill Training

```
|skillmax First Aid,75
|skillmax Tailoring,75
|skillmax Enchanting,75
```

### `|havebuff` / `|nobuff` — Buff Checks

```
|havebuff Ghost##8326
|havebuff Sapta Sight##8898
|nobuff Touch of Zanzil##9991
```

### `|confirm` — Manual Confirmation

Requires the player to click to continue. Optionally sets a guide flag:

```
|confirm
|confirm DMflag          -- sets guideflag("DMflag") when clicked
```

### `|gossip` — Dialogue Selection

Selects a dialogue option:

```
|gossip 95665
|gossip 98050
```

### Flow Modifiers

| Directive | Description |
|-----------|-------------|
| `|walk` | Show walking path instead of arrow |
| `|future` | Quest may not be available yet |
| `|notinsticky` | Don't show in sticky step display |
| `|noautoaccept` | Don't auto-accept the quest |
| `|notravel` | Don't suggest travel routes |
| `|nohearth` | Don't suggest using hearthstone |
| `|noway` | Don't show "no path" warning |
| `|instant` | Step completes instantly |
| `|sticky` | Step stays visible while doing other steps |
| `|zombiewalk` | Walking path for ghost/dead state |
| `|noordinal` | Don't show step number |
| `|or` | Alternative completion (any of the `|or` lines completes the step) |
| `|next` | Override the next guide |
| `|c` | Generic completion flag |
| `|n` | NPC reference |

### Other Directives

| Directive | Description | Example |
|-----------|-------------|---------|
| `|popuptext` | Show a popup with text/URL | `\|popuptext youtu.be/SEATloEvXAM` |
| `|loadguide` | Switch to another guide | `\|loadguide Leveling Guides\\Darkshore (13-17)` |
| `|learnpetspell` | Learn a pet spell | `\|learnpetspell Firebolt##7799` |
| `|kill` | Kill requirement (as directive) | `\|kill Goldtooth##327` |
| `|accept` | Accept quest (as directive) | `\|accept Quest##ID` |
| `|talk` | Talk to NPC (as directive) | `\|talk NPC##ID` |
| `|ding` | Level requirement (as directive) | `\|ding 5` |
| `|count` | Count requirement | `\|count 5` |
| `|stickyif` | Conditional sticky | `\|stickyif haveq(1097)` |
| `|skill` | Skill check | `\|skill Fishing` |

## Stickystart / Label

Used to group steps that should be done simultaneously. A `stickystart` marks the beginning of a sticky group, and `label` marks where the group ends and normal flow resumes.

```
step
stickystart "Collect_Gold_Dust"
stickystart "Collect_Large_Candles"
kill Kobold Tunneler##475+
collect 4 Gold Dust##5055 |q 47/1 |goto Elwynn Forest 34.66,79.72
step
-- other steps here...
step
label "Collect_Gold_Dust"
-- this step appears when the stickystart group is active
step
label "Collect_Large_Candles"
-- this step too
```

Multiple `stickystart` lines can appear in the same step. The quoted string must match exactly between `stickystart` and `label`.

## Path Lines

Define a pathing route for the player to follow:

```
path follow strictbounce; loop off; ants straight; dist 20; markers none
path follow strict; loop on; ants curved; dist 30
path follow smart; loop on; ants curved; dist 35
```

### Path Options

| Option | Values | Description |
|--------|--------|-------------|
| `follow` | `strict`, `strictbounce`, `smart` | Path following mode |
| `loop` | `on`, `off` | Whether the path loops |
| `ants` | `curved`, `straight` | Arrow style |
| `dist` | number | Completion distance |
| `markers` | `none` | Waypoint marker style |

## Coordinate Formats

### Inline with `|goto`

```
|goto Elwynn Forest 48.17,42.95
|goto Elwynn Forest/0 47.69,41.42    -- with map floor
|goto Elwynn Forest 48.31,41.99 < 10 -- with completion radius
```

### Standalone Waypoints

Bracket coordinates on their own line provide additional waypoints (typically after "You can find more around:"):

```
You can find more around: |notinsticky
[45.82,44.02]
[50.16,45.83]
[52.06,40.29]
```

Or with a zone prefix:

```
You can find more around [Elwynn Forest 51.18,37.25]
```

## Comments

Lines starting with `//` are comments (ignored by the addon):

```
// This is a comment
step
// TODO: verify coordinates
kill Goldtooth##327 |q 87/1
```

## Common Patterns

### Quest Accept + Turn In

```
step
talk Marshal McBride##197
turnin A Threat Within##783 |goto Elwynn Forest 48.92,41.61
accept Kobold Camp Cleanup##7 |goto Elwynn Forest 48.92,41.61
```

### Kill + Collect with Waypoints

```
step
kill Defias Thug##38+ |notinsticky
collect 12 Red Burlap Bandana##752 |q 18/1 |goto Elwynn Forest 56.09,42.35
You can find more around: |notinsticky
[53.20,50.30]
[56.09,42.35]
```

### Class-Specific Steps

```
step
learnspell Battle Shout##6673 |goto Elwynn Forest 50.24,42.28
|only if Warrior
```

### Conditional Lines Within a Mixed Step

```
step
talk Drusilla La Salle##459
turnin Tainted Letter##3105 |goto Elwynn Forest 49.87,42.65
accept Stolen Power##77621 |goto Elwynn Forest 49.87,42.65 |only if ZGV.IsClassicSoD
learnspell Corruption##172 |goto Elwynn Forest 49.87,42.65
|only if Human Warlock
```

Here, `accept Stolen Power` only appears for SoD, while the rest of the step applies to all Human Warlocks.

### Vendor + Quest Combo

```
step
Sell your trash |vendor Godric Rothgar##1213 |q 15 |goto Elwynn Forest/0 47.69,41.42
```

### Death Skip

```
step
Die on Purpose |complete isdead |goto Tirisfal Glades 26.84,59.41
step
Resurrect at the Spirit Healer |complete not isdead |goto Tirisfal Glades 30.85,66.09
```

### Guide Flag (Optional Content)

```
step
Click Here if you'd like to run The Deadmines later |confirm DMflag
|only if not guideflag("DMflag")
```

## Common Mistakes

1. **Missing `step` delimiter** — every block of instructions needs a `step` keyword before it
2. **Wrong `##` separator** — use `##` (double hash) between name and ID, not `#`
3. **`|only if` placement** — on its own line = step condition; inline = line condition. Putting it in the wrong place changes what it applies to
4. **Mismatched `stickystart`/`label`** — the quoted string must match exactly
5. **Missing `|q` reference** — quest-related lines should reference the quest ID so the step knows when it's complete
6. **Coordinates without zone** — `|goto` needs the zone name before coordinates: `|goto Elwynn Forest 48.17,42.95`, not just `|goto 48.17,42.95`
7. **Tabs vs spaces** — both work, but be consistent. The project uses tabs in some places
