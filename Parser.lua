local me = ZygorGuidesViewer
if not me then
  return
end
local ZGV = me

local L = ZygorGuidesViewer_L('Main')

local BZL = me.BZL
local BZR = me.BZR

local table, string, tonumber, ipairs, pairs, setmetatable, tinsert =
  table, string, tonumber, ipairs, pairs, setmetatable, tinsert

--[[
local function split (s,t)
	local l = {n=0}
	local f = function (s)
		l.n = l.n + 1
		l[l.n] = s
	end
	local p = "%s*(.-)%s*"..t.."%s*"
	s = string.gsub(s,"^%s+","")
	s = string.gsub(s,"%s+$","")
	s = string.gsub(s,p,f)
	l.n = l.n + 1
	l[l.n] = string.gsub(s,"(%s%s*)$","")
	return l
end
--]]

-- me.actionmeta = {
--   goto = { skippable = true },
--   fpath = { skippable = true },
--   home = { skippable = true },
--   hearth = { skippable = true },
-- }

local function split(str, sep)
  local fields = {}
  str = str .. sep
  local tinsert = tinsert
  str:gsub('(.-)' .. sep, function(c)
    tinsert(fields, c)
  end)
  return fields
end

function me:ParseMapXYDist(text)
  local map, x, y, dist, _
  --Map, X, Y, Dist
  _, _, map, x, y, dist = string.find(text, '^(.+),([0-9%.]+),([0-9%.]+),([0-9%.]+)$')
  --X, Y, Dist
  if not _ then
    _, _, x, y, dist = string.find(text, '^([0-9%.]+),([0-9%.]+),([0-9%.]+)$')
  end
  --Map, X, Y
  if not _ then
    _, _, map, x, y = string.find(text, '^(.+),([0-9%.]+),([0-9%.]+)$')
  end
  --X, Y
  if not _ then
    _, _, x, y = string.find(text, '^([0-9%.]+),([0-9%.]+)$')
  end
  --Dist
  if not _ then
    _, _, dist = string.find(text, '^([0-9%.]+)$')
  end

  --Map, X, Y, Dist
  if not _ then
    _, _, map, x, y = string.find(text, '^([^,]+) ([0-9%.]+),([0-9%.]+).*$')
  end
  -- I dontn know if this was just a guide typo
  if not _ then
    _, _, map, x, y = string.find(text, '^(.+), ([0-9%.]+),([0-9%.]+).*$')
  end
  --Map Only
  if not _ then
    map = text
  end

  x = tonumber(x)
  y = tonumber(y)

  if map then
    -- Subzone shenanigans we dont respect
    if map:find('/') then
      map = split(map, '/')[1]
    end

    --ewhhh
    if map:find(',') then
      --print(text)
      --print(map)
    end
  end

  --	if x then x=x/100 end
  --	if y then y=y/100 end
  --	if dist then dist=dist/100 or 0.2 end
  if not dist then
    dist = 0.2
  end
  if map and #map < 5 then
    map = nil
  end

  return map, x, y, dist
end

function me:ParseID(str)
  local name, id, nid, obj
  name, id = str:match('(.*)##([0-9/]*)')
  if not name then
    id = str:match('^([0-9/]*)$')
  end
  if id then
    nid, obj = id:match('([0-9]*)/([0-9]*)')
    if nid then
      id = nid
    end
  end
  if id then
    id = tonumber(id)
  end
  if obj then
    obj = tonumber(obj)
  end
  if not name and not id then
    name = str
  end
  return name, id, obj
end

--- parse just the header, until the first 'step' tag. No chunking, just header data extraction.
function me:ParseHeader(text)
  if not text then
    return {}
  end
  local guides = {}
  local index = 1

  text = text .. '\n'

  local linecount = 0

  local header = {}

  while index < #text do
    local st, en, line = string.find(text, '(.-)\n', index)
    if not en then
      break
    end
    index = en + 1

    linecount = linecount + 1
    if linecount > 100000 then
      return nil, linecount, 'More than 100000 lines!?'
    end

    line = line:gsub('^[%s	]+', '')
    line = line:gsub('[%s	]+$', '')
    line = line:gsub('//.*$', '')
    line = line:gsub('||', '|')

    local cmd, params = line:match('([^%s]*)%s?(.*)')

    if cmd then
      if cmd == 'step' then
        break
      else
        header[cmd] = params
      end
    end
  end

  if header['guide'] then
    header['title'] = header['guide']
    header['guide'] = nil
  end

  return header
end

--The entire condition env pains me and the elseifchains in general do too but unless someone wants to rework them it stays.

ZGV.ConditionEnv = {
  _G = _G,
  -- variables needing update
  level = 1,
  ZGV = ZGV,
  races = {
    'NightElf',
    'Dwarf',
    'Human',
    'Gnome',
    'Draenei',
    'Worgen',
    'Orc',
    'Troll',
    'Scourge',
    'Tauren',
    'BloodElf',
    'Goblin',
    'Undead',
    'Scourge',
  },
  classes = {},
  factions = { 'Alliance', 'Horde', 'Neutral' },

  _Setup = function(self)
    -- Register all kinds of literals for simple "only if" checks
    local function registerLiteral(s, num)
      self[s:gsub("[ %.,%-']", '')] = num
    end

    -- reputation 'constants'
    for standing, num in pairs(ZGV.StandingNamesEngRev) do
      ZGV.ConditionEnv[standing] = num
    end

    -- Store class constants
    for cl, _ in pairs(ZGV.ClassToNumber) do
      tinsert(self.classes, cl:sub(1, 1):upper() .. cl:lower():sub(2))
    end
    local pcl = select(2, UnitClass('player')):lower()
    for i, cl in ipairs(self.classes) do
      local cl2 = cl:lower()
      registerLiteral(cl, pcl == cl2)
    end

    -- Store race constants
    local pra = select(2, UnitRace('player'))
    for i, ra in ipairs(self.races) do
      --print(ra.." is? "..pra)
      registerLiteral(ra, pra == ra)
    end

    ZGV.ConditionEnv.Undead = ZGV.ConditionEnv.Undead and ZGV.ConditionEnv.Undead
      or ZGV.ConditionEnv.Scourge

    -- Store faction constants
    local pfa = UnitFactionGroup('player')
    for i, fa in ipairs(self.factions) do
      registerLiteral(fa, pfa == fa)
    end

    setmetatable(ZGV.ConditionEnv, {
      __index = function(table, key)
        if key == 'hardcore' then
          return false --already covered due to nil
        elseif key == 'isdead' then
          return UnitIsDeadOrGhost('player')
        elseif key == 'selfmade' then
          return false
        elseif key == 'walking' then
          return not IsFlying()
        else
          print(tostring(key) .. ' Condition not found, may be a typo in the guide')
          table[key] = 0
        end
      end,
    })
  end,

  _Update = function()
    ZGV.ConditionEnv.level = UnitLevel('player')
    if ZGV.db.char.fakelevel and ZGV.db.char.fakelevel > 0 then
      ZGV.ConditionEnv.level = ZGV.db.char.fakelevel
    end
  end,

  itemcount = function(...)
    local total = 0
    local count = select('#', ...)
    for i = 1, count do
      total = total + GetItemCount(select(i, ...))
    end
    return total
  end,

  -- independent data feeds
  rep = function(faction)
    local rep = ZGV:GetReputation(faction)
    return 0
  end,

  Hated = -42000,
  Hostile = -6000,
  Unfriendly = -3000,
  NeutralRep = 0,
  Friendly = 3000,
  Honored = 6000,
  Revered = 12000,
  Exalted = 21000,

  skill = function(skill)
    return ZGV:GetSkill(skill).level
  end,

  hasbuff = function(query, count)
    local aura = C_UnitAuras.GetPlayerAuraBySpellID(tonumber(query))
    if aura and (aura.applications or 0) >= (count or 0) then
      return true
    end
    return false
  end,

  warlockpetids = {
    felhunter = 417,
    voidwalker = 1860,
    succubus = 1863,
    imp = 416,
  },

  warlockpet = function(id)
    if type(id) == 'string' then
      id = ZGV.ConditionEnv.warlockpetids[id:lower()]
    end

    return ZGV.GetUnitId('pet') == id
  end,

  haveq = function(...)
    local count = select('#', ...)
    for i = 1, count do
      local id = select(i, ...)
      if tonumber(id) then
        local q = ZGV.questsbyid[id]
        if q and q.inlog then
          return true
        end
      else
        for _, qid in ipairs(ParseRanges(id)) do
          local q = ZGV.questsbyid[qid]
          if q and q.inlog then
            return true
          end
        end
      end
    end
    return false
  end,

  completedq = function(...)
    local count = select('#', ...)
    for i = 1, count do
      local id = select(i, ...)
      if tonumber(id) then -- just quest
        if C_QuestLog.IsQuestFlaggedCompleted(id) then
          return true
        end
      else
        if id:match('-') then -- range of quests
          for _, qid in ipairs(ParseRanges(id)) do
            if C_QuestLog.IsQuestFlaggedCompleted(qid) then
              return true
            end
          end
        else -- quest/objective
          local _, id, obj = ParseID(id)
          local qcomplete = C_QuestLog.IsQuestFlaggedCompleted(id)
          if qcomplete then
            return true
          end
          if not obj then
            return false
          end
          local q = ZGV.questsbyid[id]
          if not q then
            return false
          end
          if q.complete then
            return true
          end
          if not q.goals or not q.goals[obj] then
            return false
          end
          return q.goals[obj].complete
        end
      end
    end

    return false
  end,

  subzone = function(name)
    local minizone = GetMinimapZoneText()
    local engname = BZR[minizone] or minizone or ''
    return engname == name
  end,

  zone = function(targetZone)
    return GetZoneText():lower() == targetZone:lower()
  end,

  knowspell = function(spellid)
    return IsSpellKnown(spellid)
  end,

  C_Container = ZGV.Retrofit.C_Container,

  GetMoney = function()
    return GetMoney()
  end,

  GetItemCooldown = GetItemCooldown,

  readyq = function(...)
    local count = select('#', ...)
    for i = 1, count do
      local id = select(i, ...)
      local q = ZGV.questsbyid[id]
      return q and q.complete and q.inlog
    end
    return false
  end,

  weaponskill = function(name)
    for i = 1, GetNumSkillLines() do
      local skillName, _, _, skillRank, numTempPoints, skillModifier, skillMaxRank, isAbandonable, stepCost, rankCost, minLevel, skillCostType =
        GetSkillLineInfo(i)
      local skillTag = ZGV.ItemScore.SkillNamesRev[skillName]

      if skillTag == name then
        return skillRank
      end
    end
    return 0
  end,

  guideflag = function(flag)
    return ZGV.db.char.guideflags[flag] == true
  end,
}

local ConditionEnv = ZGV.ConditionEnv

local function MakeCondition(cond, forcebool)
  -- replace "Race Class" with "(Race and Class)"
  -- don't try to optimize too much. Race-spec-class and race-class checks must all run before spec-class checks are attempted.
  for i, ra in ipairs(ConditionEnv.races) do
    for j, cl in ipairs(ConditionEnv.classes) do
      cond = cond:gsub('(' .. ra .. ') (' .. cl .. ')', '(%1 and %2)')
      --print("("..ra..") ("..cl..")")
    end
  end

  local s
  if forcebool then
    s = ('_Update()  return not not (%s)'):format(cond)
  else
    s = ('_Update()  return %s'):format(cond)
  end

  --No Clue, lua quirks.
  s = s:gsub('Neutral', 'NeutralRep')

  local fun, err = loadstring(s)

  if fun then
    setfenv(fun, ZGV.ConditionEnv)
  end
  if fun then
    --if s:find("rep") then print(s) end
    fun()
  end
  return fun, err
end

--- parse ONE guide section into usable arrays.
function me:ParseEntry(guidedata)
  text = guidedata.rawdata
  if not text then
    return nil, 'No text!', 0
  end
  local index = 1

  local guide, step

  local prevpathvars = {}
  local prevmap
  local prevlevel = 0

  guide = { ['steps'] = {}, ['quests'] = {} }

  text = text .. '\n'

  --	Parse the extras

  for k, v in pairs(guidedata.extra) do
    guide[k] = v
  end

  local linecount = 0

  local noobsoletequests = {}
  local dailyquests = ZGV.dailyQuests

  local function COLOR_LOC(s)
    return '|cffffee77' .. s .. '|r'
  end

  local _

  local strfind = string.find

  --#Region Stickies
  local open_stickies = {}
  local open_stickies_ord = {}
  local used_stickies = {}
  guide.stickies = nil

  local autolabels = 0
  local autolabel
  local function get_next_autolabel()
    autolabels = autolabels + 1
    autolabel = ('label%03d'):format(autolabels)
    return autolabel
  end
  local function use_autolabel()
    local a = autolabel
    autolabel = nil
    return a
  end

  local function assign_label_from(params)
    local label = params:gsub('^"(.-)"$', '%1') -- strip quotes

    if label == '' or not label then
      return
    end
    if step.label then
      step.extralabels = step.extralabels or {}
      table.insert(step.extralabels, label)
    else
      step.label = label
      autolabel = label
      if open_stickies[label] then
        for i = #open_stickies_ord, 1, -1 do
          if open_stickies_ord[i] == label then -- close it
            ZGV:Debug('&sticky (parser) closing %s', label)
            tremove(open_stickies_ord, i)
          end
        end
        open_stickies[label] = nil
      end
      step.is_sticky = used_stickies[label]
    end
  end
  --#endregion

  --Parse new guide headers

  --print(guide.extra)
  --for i, v in pairs(guide.extra) do
  --     print(i, v)
  --end

  --local debug
  --if text:find("goto The Exodar,44.9,24.2") then debug=true end

  while index < #text do
    local st, en, line = strfind(text, '%s*(.-)%s*\n', index)
    --if debug then print(line) end
    if not en then
      break
    end
    index = en + 1

    linecount = linecount + 1
    if linecount > 100000 then
      return nil, linecount, 'More than 100000 lines!?'
    end

    --Pipes at the start of a line dont work
    line = line:gsub('^|', '.')

    --line = line:gsub("^[%s	]+","")
    --line = line:gsub("[%s	]+$","") --done in the find

    --st,en = strfind(line,"//",1,true)
    --if st then line=line:sub(1,st-1) end
    -- not really faster
    line = line:gsub('//.*$', '')

    local indent
    indent, line = line:match('^(%.*)(.*)')

    line = line:gsub('^%* *', '')

    line = line .. '|'
    local goal = {}

    local chunkcount = 1

    for chunk in line:gmatch('%s*(.-)%s*|+') do
      if chunk:find('%[') then
        chunk = chunk:gsub('%[', '- '):gsub('%]', '')
      end
      chunk = chunk:gsub("^'%s*", "' ")

      chunk = chunk:gsub('^@(%S)', '@ %1')
      --chunk = chunk:gsub("^%s+","")
      --chunk = chunk:gsub("[%s	]+$","")

      local cmd, params = chunk:match('([^%s]*)%s?(.*)')

      -- guide parameters
      if cmd == 'defaultfor' then
        guide[cmd] = params
      elseif cmd == 'next' and not #guide.steps then
        guide[cmd] = params:gsub('\\\\', '\\')
      elseif cmd == 'author' then
        guide[cmd] = params
      elseif cmd == 'description' then
        guide[cmd] = (guide[cmd] and guide[cmd] .. '\n' or '') .. params
      --elseif cmd=="faction" then --unused
      --	guide[cmd]=params
      elseif cmd == 'startlevel' then
        prevlevel = tonumber(params)
      --#region Compat Guide Params, dont work but dont crash either
      elseif cmd == 'suggested' then
        --guide[cmd]=params
      elseif cmd == 'hardcore' then
        --guide[cmd]=params
      elseif cmd == 'image' then
        --guide[cmd]=params
      elseif cmd == 'condition_suggested' then
        --guide[cmd]=params
      elseif cmd == 'condition_suggested_race' then
        --guide[cmd]=params
      elseif cmd == 'condition_suggested_exclusive' then
        --guide[cmd]=params
        --#endregion
      elseif cmd == 'startlevel' then
        prevlevel = tonumber(params)
      elseif cmd == 'step' then
        step = {
          goals = {},
          map = prevmap,
          level = prevlevel,
          num = #guide.steps + 1,
          parentGuide = guide,
        }
        guide.steps[#guide.steps + 1] = step

        setmetatable(step, ZGV.StepProto_mt)

        assign_label_from(params)

        if next(open_stickies) then
          -- record stickies that pertain to this step
          step.sticky_labels = {}

          for i, stickylabel in ipairs(open_stickies_ord) do
            if stickylabel ~= step.label then
              tinsert(step.sticky_labels, stickylabel) -- step is not built yet, naturally.
            end
          end
        end

        wipe(prevpathvars)

      -- step parameters
      elseif cmd == 'level' then
        step[cmd] = params
        prevlevel = tonumber(params)
      elseif cmd == 'title' then
        step[cmd] = params
        if chunkcount > 1 then
          goal[cmd] = params
        end
      elseif cmd == 'map' then
        if BZL[params] then
          params = BZL[params]
        end
        if step then
          step.map = params
        end
        prevmap = params
      elseif cmd == 'stickyif' then
        local fun, err = MakeCondition(params, false)
        if not fun then
          return nil, err, linecount, chunk
        end
        step.sticky_condition_complete_raw = params
        step.sticky_condition_complete = fun
      elseif cmd == 'label' then
        assign_label_from(params)

      -- goal commands
      elseif cmd == 'stickystart' then
        local label = params:gsub('^%s*"(.-)"%s*$', '%1') -- strip quotes
        if label == '' then
          label = get_next_autolabel()
        end
        autolabel = label
        --if not guide.sticky_timetable then guide.sticky_timetable={} end
        --if not guide.sticky_timetable[#guide.steps+1] then guide.sticky_timetable[#guide.steps+1]={} end
        --tinsert(guide.sticky_timetable[#guide.steps+1],{"start",params})
        open_stickies[label] = true
        used_stickies[label] = true
        tinsert(open_stickies_ord, label)
        cmd_parsed = true
      elseif cmd == 'stickystop' then
        local label = params:gsub('^%s*"(.-)"%s*$', '%1') -- strip quotes
        if not label then
          label = use_autolabel()
        end
        autolabel = nil
        if not label then
          return parseerror(
            "stickystop without a label, and none was implictly given (you need a 'stickystart' before)"
          )
        end
        if not open_stickies[label] then
          return parseerror("stickystop with no matching stickystart - need 'stickystart' before")
        end
        open_stickies[label] = nil
        for i = #open_stickies_ord, 1, -1 do
          if open_stickies_ord[i] == label then
            tremove(open_stickies_ord, i)
          end
        end
        cmd_parsed = true
      elseif cmd == 'accept' or cmd == 'turnin' then
        goal.action = goal.action or cmd
        if not params then
          return nil, 'no quest parameter', linecount, chunk
        end
        goal.quest, goal.questid = self:ParseID(params)
        local q, qp = goal.quest:match('^(.-)%s-%((%d+)%)$')
        if q then
          goal.quest, goal.questpart = q, qp
        end
        if not goal.quest and not goal.questid then
          return nil, 'no quest parameter', linecount, chunk
        end

        if goal.questid then
          guide.quests[goal.questid] = step.level
          if not step.level then
            return nil, 'Missing step level information', linecount, chunk
          end
        end
      elseif cmd == 'talk' or cmd == 'vendor' or cmd == 'trainer' then
        goal.action = goal.action or cmd
        if not params then
          return nil, 'no npc', linecount, chunk
        end
        goal.npc, goal.npcid = self:ParseID(params)
        if not goal.npc then
          return nil, 'no npc', linecount, chunk
        end
      elseif cmd == 'goto' or cmd == 'at' then
        goal.action = goal.action or cmd

        local map, x, y, dist = self:ParseMapXYDist(params)

        if BZL[map] then
          map = BZL[map]
        end

        goal.map = map or goal.map or step.map or prevmap
        step.map = goal.map
        prevmap = step.map

        goal.x = x or goal.x
        goal.y = y or goal.y
        goal.dist = dist or goal.dist

        if
          goal.action == 'accept'
          or goal.action == 'turnin'
          or goal.action == 'kill'
          or goal.action == 'get'
          or goal.action == 'talk'
          or goal.action == 'goal'
          or goal.action == 'use'
        then
          goal.autotitle = goal.param or goal.target or goal.quest
        end

        if not goal.map then
          return nil,
            "'" .. cmd .. "' has no map parameter, neither has one been given before.",
            linecount,
            chunk
        end
      elseif cmd == 'kill' or cmd == 'get' or cmd == 'collect' or cmd == 'goal' or cmd == 'buy' then
        goal.action = goal.action or cmd

        -- first, extract the count
        local count, excl, object = params:match('^([0-9]+)(!?) (.*)')
        if not object then
          object = params
        end
        goal.count = tonumber(count) or 1
        if excl == '!' then
          goal.exact = 1
        end

        -- check for plural
        local name, plural = object:match('^(.+)(%+)$')
        if plural then
          goal.plural = true
          object = name
        end

        -- now object##id
        goal.target, goal.targetid = self:ParseID(object)

        -- finally, assume buys are futureproof
        if cmd == 'buy' then
          goal.future = true
        end

        -- something missing?
        if not goal.targetid and not goal.target then
          return nil, 'no parameter', linecount, chunk
        end
        --[[
				if goal.target:match("%+%+") then
					if goal.target:match("%+%+$") then
						goal.target = goal.target:gsub("%+%+","")
						goal.targets = goal.target
					else
						local sing,pl = goal.target:match("(.+)%+%+%+(.+)")
						if not sing or not pl then
							sing = goal.target:gsub("([^%s%+]+)++([^%s%+]+)","%1")
							pl = goal.target:gsub("([^%s%+]+)++([^%s%+]+)","%2")
						end
						goal.target = sing
						goal.targets = pl
					end
				end
				--]]
      elseif cmd == 'from' then
        goal.action = goal.action or cmd
        params = params:gsub(',%s+', ',')
        goal.mobsraw = params
        local mobs = split(params, ',')
        goal.mobspre = mobs
        goal.mobs = {}
        for i, mob in ipairs(mobs) do
          local name, plural = mob:match('^(.+)(%+)$')
          if not plural then
            name = mob
          end

          local nm, id = self:ParseID(name)

          tinsert(goal.mobs, { name = nm, id = id, pl = plural and true or false })
        end
      elseif cmd == 'walk' then
        goal.force_walk = true
      elseif cmd == 'click' then
        goal.target, goal.targetid = self:ParseID(params)
      elseif cmd == 'clicknpc' then
        goal.npc, goal.npcid = self:ParseID(params)
      elseif cmd == 'next' then
        params = params:gsub('^"(.-)"$', '%1')
        if params == '' then
          params = '+1'
        end
        goal.next = params
      elseif cmd == 'popuptext' then
        goal.action = goal.action or cmd
        goal.popuptext = params
      elseif cmd == 'confirm' then
        goal.action = goal.action or cmd
        goal.always = (params == 'always')
        goal.begin = (params == 'begin')
        goal.skip = (params == 'skip')
        goal.flagname = params
        goal.optional = true
        goal.was_clicked = false
      elseif cmd == 'count' then
        --This overrides a collect quests condition to only need X and not full
        goal.count = tonumber(params)
      elseif cmd == 'gossip' then
        --Not needed, guides instruct the user what to select already
      elseif cmd == 'learnspell' then
        goal.action = goal.action or cmd
        goal.spell, goal.spellid = self:ParseID(params)
      elseif cmd == 'learnpetspell' then
        goal.action = goal.action or cmd
        goal.spell, goal.spellid = self:ParseID(params)
      elseif cmd == 'loadguide' then
        goal.action = goal.action or cmd
        params = params:gsub('^"(.-)"$', '%1')
        if params == '' then
          params = '+1'
        end
        goal.next = params
      elseif cmd == 'noautoaccept' then
        goal.noautoaccept = true
      elseif cmd == 'nohearth' then
        step.travelcfg = step.travelcfg or {}
        step.travelcfg['use_hearth'] = false
      elseif cmd == 'noordinal' then
        goal.countord = false
      elseif cmd == 'notravel' then
        goal.waypoint_notravel = true
      elseif cmd == 'path' then
        goal.action = goal.action or cmd
        if not step.hasPath then
          goal.firstPath = true
          step.hasPath = true
        end
        --No point in creating this when questie shows the mobspawn anyway.
        --[[goal.action = goal.action or cmd
				goal.raw = params
				local path=params
				if not step.waypath then step.waypath={follow="loose",loop=true,ants="straight",coords={}} end
				for var,val in pairs(prevpathvars) do step.waypath[var] = val or step.waypath[var] end

				-- remove plusses, trim
				path=path:gsub("^%+%s*","")
				path=path:gsub("%s*[	;]+%s*",";"):gsub("  +",";")
				path=path .. ";"
				for coord in path:gmatch("(.-);") do
					local map,x,y,dist,err = self:ParseMapXYDist(coord)
					if x then
						if err then return parseerror(err) end  -- might happen, if the coords look good but map is bogus.
						local point = {map=map or prevmap or step.map,floor=flr or prevfloor or step.floor,x=x,y=y,dist=dist or step.waypath.dist}
						tinsert(step.waypath.coords,point)
						prevmap,prevfloor = point.map,point.floor
					else
						-- no coords..? maybe a path command, then?
						local var,val = coord:match("^([^%s]+)%s+(.+)$")
						if not val then var,val=coord,1 end
						if val=="off" then val=false end
						if var:sub(1,1)=="<" then
							-- assign something to the last point. This sucks, but CBA to make it any better right now.
							step.waypath.coords[#step.waypath.coords][var:sub(2)] = tonumber(val) or val
						else
							-- plain two-word variable.
							step.waypath[var] = tonumber(val) or val
							prevpathvars[var] = tonumber(val) or val
						end
						if step.waypath.radius then step.waypath.dist=step.waypath.radius end  -- radius=dist
					end
				end

				if step.waypath['use']=="goto" then
					-- physically convert gotos to path!
					local i=1
					while i<=#step.goals do
						local goal=step.goals[i]
						if goal.action=="goto" then
							tinsert(step.waypath.coords,goal)
							tremove(step.goals,i)
							i=i-1
						end
						i=i+1
					end
					step.waypath['loop']=false
				end]]
        --
      elseif cmd == 'popuptext' then
        --TODO: Implement, low prio
      elseif cmd == 'run' then
        goal.action = goal.action or cmd
        return nil, 'run not implemented', linecount, chunk
      elseif cmd == 'zombiewalk' then
        goal.zombiewalk = true
      elseif cmd == 'trash' or cmd == 'bank' or cmd == 'destroy' then
        goal.action = goal.action or 'trash'
        goal.trashitem, goal.trashitemid = self:ParseID(params)
      elseif cmd == 'ding' then
        goal.action = goal.action or cmd

        local splits = split(params, ',')

        if splits[2] then
          --goal.experience = tonumber(splits[2])
          goal.level = tonumber(splits[1])
        else
          goal.level = tonumber(params)
        end

        --print(goal.level)
        --goal.level = tonumber(params)
        if not goal.level then
          return nil, "'ding': invalid level value", linecount, chunk
        end
        prevlevel = goal.level
      elseif cmd == 'equipped' then
        goal.action = goal.action or cmd
        local slot, item = params:match('^([a-zA-Z]+) (.*)')
        --Use the old Slot mechanic if we have a valid Slot
        if slot:find('Slot') then
          slot, _ = GetInventorySlotInfo(slot)
          if not slot then
            return nil, 'equipped needs proper slot'
          end
          if not item then
            return nil, 'equipped needs item'
          end
          goal.slot = slot
          goal.item = item
        else
          -- Parse the itemid and set slot to nil so goal knows about it
          goal.equippeditemid, goal.equippeditemname = self:ParseID(params)
          goal.slot = nil
        end
      elseif cmd == 'hearth' then
        goal.action = goal.action or cmd
        goal.useitem = 'Hearthstone'
        goal.useitemid = 6948
        goal.param = BZL[params]
        goal.force_noway = true
      elseif cmd == 'rep' then
        goal.action = goal.action or cmd
        goal.faction, goal.rep = params:match('(.*),(.*)')
        if type(goal.rep) == 'string' then
          goal.rep = self.StandingNamesEngRev[goal.rep]
        end
        if self.BFL[goal.faction] then
          goal.faction = self.BFL[goal.faction]
        end
      elseif cmd == 'achieve' then
        goal.action = goal.action or cmd
        _, goal.achieveid, goal.achievesub = self:ParseID(params)
      elseif cmd == 'skill' or cmd == 'skillmax' then
        goal.action = goal.action or cmd
        goal.skill, goal.skilllevel = params:match('^(.+),([0-9]+)$')
        goal.skilllevel = tonumber(goal.skilllevel)
        if not goal.skill then
          return nil, "'skill*': no skill found", linecount, chunk
        end
      elseif cmd == 'learn' then
        goal.action = goal.action or cmd
        goal.recipe, goal.recipeid = self:ParseID(params)
        if not goal.recipeid then
          return nil, "'learn': no recipe found", linecount, chunk
        end
      elseif cmd == 'fpath' or cmd == 'home' then
        goal.action = goal.action or cmd
        goal.param = params
        if not goal.param then
          return nil, 'no parameter', linecount, chunk
        end
      elseif cmd == 'havebuff' then
        goal.action = goal.action or cmd
        goal.buff = params
        if not goal.buff then
          return nil, 'no parameter', linecount, chunk
        end
      elseif cmd == 'nobuff' then
        goal.action = goal.action or cmd
        goal.buff = params
        if not goal.buff then
          return nil, 'no parameter', linecount, chunk
        end
      elseif cmd == 'invehicle' then
        goal.action = goal.action or cmd
      elseif cmd == 'outvehicle' then
        goal.action = goal.action or cmd
      elseif cmd == 'condition' or cmd == 'complete' then
        goal.action = goal.action or cmd
        local fun, err = MakeCondition(params, false)
        if not fun then
          return nil, err, linecount, chunk
        end
        goal.condition_complete_raw = params
        goal.condition_complete = fun
      elseif cmd == 'tip' then
        goal.action = 'info'
        goal.info = params
      elseif cmd == 'info' then
        goal.action = goal.action or cmd
        goal.info = params
      -- clickable icon displayers
      elseif cmd == 'cast' then
        goal.action = goal.action or cmd
        goal.castspell, goal.castspellid = self:ParseID(params)
        if not goal.castspell and not goal.castspellid then
          return nil, 'no parameter', linecount, chunk
        end
      elseif cmd == 'petaction' then
        goal.action = goal.action or cmd
        goal.petaction = tonumber(params)
        if not goal.petaction then
          goal.petaction = params
        end
        if not goal.petaction then
          return nil, 'petaction needs an action number', linecount, chunk
        end
      elseif cmd == 'use' then
        goal.action = goal.action or cmd
        goal.useitem, goal.useitemid = self:ParseID(params)
        if not goal.useitem and not goal.useitemid then
          return nil, 'no parameter', linecount, chunk
        end
      elseif cmd == 'script' then
        goal.script = params

      -- conditions
      elseif cmd == 'only' then
        local cond = params:match('^if%s+(.*)$')
        if cond then
          -- condition match
          local subject = goal
          if chunkcount == 1 then
            subject = step
          end

          local fun, err = MakeCondition(cond, true)
          if not fun then
            return nil, err, linecount, chunk
          end

          subject.condition_visible_raw = cond
          subject.condition_visible = fun
        else
          -- race/class match
          if goal.action or goal.text or chunkcount > 1 then
            if not ZGV:RaceClassMatch(split(params, ',')) then
              goal = {}
              break
            end -- skip goal line altogether
          else
            step.requirement = split(params, ',')
          end
        end

      -- extra tags
      elseif cmd == 'notinsticky' then
        goal.notinsticky = true
      elseif cmd == 'autoscript' then
        goal.autoscript = params
      elseif cmd == 'n' then
        goal.force_nocomplete = true
      elseif cmd == 'c' then
        goal.force_complete = true
      elseif cmd == 'noway' then
        goal.force_noway = true
      elseif cmd == 'sticky' then
        goal.force_sticky = true
      elseif cmd == 'future' then
        goal.future = true -- if quest-related, then don't worry if the quest isn't in the log.
      elseif cmd == 'noobsolete' then
        if goal then
          goal.noobsolete = true
          if goal.questid then
            noobsoletequests[goal.questid] = true
          end
        else
          guide.noobsolete = true
        end
      elseif cmd == 'daily' then
        if goal and goal.questid then
          dailyquests[goal.questid] = true
        end
        if #guide.steps == 0 then
          guide.daily = true
        end
      elseif cmd == 'tip' then
        goal.tooltip = params
      elseif cmd == 'image' then
        goal.image = params
      elseif cmd == 'quest' or cmd == 'q' then
        local first = params:match('^(.-),')
        if first then
          params = first
        end
        goal.quest, goal.questid, goal.objnum = self:ParseID(params)
        if not goal.questid then
          return nil, 'no questid in parameter', linecount, chunk
        end
      elseif cmd == 'or' then
        goal.orlogic = params and tonumber(params) or 1
      elseif cmd == 'instant' then -- when we HAVE to use the title, for instant-complete quests.
        if goal.questid then
          ZGV.instantQuests[goal.questid] = true
        end
        goal.usetitle = true
      elseif cmd == 'killcount' then -- use killcounter for non-quest mobs
        goal.usekillcount = true
      elseif #chunk > 1 then -- text
        if #cmd > 2 and cmd:match('^[a-z]') then
          condiss = condiss and condiss or {}
          if condiss[cmd] then
          else
            condiss[cmd] = true
            --print(cmd)
          end
        end
        --params = params:gsub("%[",""):gsub("%]","")
        -- snag coordinates for waypointing, with distance
        local st, en, x, y, d
        st, en = 1, 1

        st, en, x, y, d = params:find('([0-9%.]+),([0-9%.]+)(,([0-9%.]+))?', en)
        if not x then
          -- without distance, perhaps?
          d = 0.2
          st, en, x, y = params:find('([0-9%.]+),([0-9%.]+)', en)
        end

        if x and y then
          goal.x = tonumber(x)
          goal.y = tonumber(y)
          goal.dist = tonumber(d)
          params = params:sub(1, st - 1)
            .. COLOR_LOC(L['coords']:format(x, y))
            .. params:sub(en + 1)
        end

        if goal.x then
          goal.map = prevmap
        end

        goal.text = (cmd == "'") and params or chunk
      end

      chunkcount = chunkcount + 1
      if chunkcount > 20 then
        return nil, 'More than 20 chunks in line', linecount, line
      end
    end

    if goal and next(goal) then
      if not step then
        return nil, "What? Unknown data before first 'step' tag, or what?", linecount, line
      end

      -- so there's something to record? go ahead.

      setmetatable(goal, ZGV.GoalProto_mt)

      goal.parentStep = step
      goal.num = #step.goals + 1

      tinsert(step.goals, goal)

      if not goal.action then
        if goal.x or goal.map then
          goal.action = 'goto'
        elseif goal.text then
          goal.action = 'text'
        end
      end

      if goal.questid and noobsoletequests[goal.questid] then
        goal.noobsolete = true
      end

      if
        (goal.action == 'kill' or goal.action == 'avoid' or goal.action == 'goal')
        and not goal.questid
        and not goal.objnum
        and not goal.criteriaid
        and not goal.achieveid
        and not goal.force_nocomplete
        and not goal.scenario_criteriaid
        and not goal.scenario_stagenum
        and not goal.completeoverrides
      then
        goal.force_nocomplete = true
      end
    end

    if goal then
      goal.indent = #indent
    end
  end

  --We are finished parsing
  -- gather all step labels, round'em up and brand'em
  guide.steplabels = {}
  for si, step in ipairs(guide.steps) do
    local label = step.label
    if label then
      if not guide.steplabels[label] then
        guide.steplabels[label] = {}
      end
      tinsert(guide.steplabels[label], si)
    end
    if step.extralabels then
      for _, extralabel in ipairs(step.extralabels) do
        if not guide.steplabels[extralabel] then
          guide.steplabels[extralabel] = {}
        end
        tinsert(guide.steplabels[extralabel], si)
      end
    end
  end
  -- render sticky refs into their steps
  for sn, step in ipairs(guide.steps) do
    if step.sticky_labels then
      step.stickies = {}
      for i, stickylabel in ipairs(step.sticky_labels) do
        repeat
          if stickylabel ~= step.label then
            local stickynums = guide.steplabels[stickylabel]
            if not stickynums then
              ZGV:Error(
                'Sticky step by that label not found: %s  in  %s  step %d',
                stickylabel,
                guide.title,
                sn
              )
              break
            end
            local stickynum = stickynums[1]
            local stickystep = guide.steps[stickynum]
            if not stickystep then
              ZGV:Error(
                'Sticky step by that label/number not found: %s %s  in  %s',
                stickylabel,
                stickynum,
                guide.title
              )
              break
            end
            tinsert(step.stickies, stickystep)
          end
        until true
      end
    end
  end

  return guide
end
