function ZGV:GetQuest(indexortitle)
	local link,title
	if (type(indexortitle)=="number") then
		local title,_,_,_,_,_,freq,id = GetQuestLogTitle(indexortitle)
		return id,title,freq
	else
		for i = 1, 50, 1 do
			local title,_,_,_,_,_,freq,id = GetQuestLogTitle(i)
			if title == indexortitle then
				ZGV:Debug(("GetQuest: id of quest '%s' = %d"):format(indexortitle,id))
				return id,title,freq
			end
		end
		ZGV:Debug(("GetQuest: id of quest '%s' unknown!"):format(indexortitle))
	end
end

function ZGV:QuestTracking_CacheQuestLog(from)
	-- TODO: Check why this triggers too often
	self:Debug("&events Caching quest log from %s",from or "-somewhere-")

	if not self.loading_screen_disabled then return end
	--self:Debug('CacheQuestLog')
	--if not zone or zone=='' then return nil end

	--if 1 then self:Debug('**BREAK**'); return end
	--[[
	local time = GetTime()
	if time - self.QuestCacheTime < 1 then
		self.QuestCacheUndertimeRepeats = self.QuestCacheUndertimeRepeats + 1
		if self.QuestCacheUndertimeRepeats > 10 then return end
	else
		-- overtime; everything in order.
		self.QuestCacheUndertimeRepeats = 0
		self.QuestCacheTime = time
	end
	--]]

	--self:Debug("CacheQuestLog starts --> (after ".. (time - self.QuestCacheTime)..")")

	--local iNumEntries, iNumQuests = GetNumQuestLogEntries() -- this SUCKS. Entries can be muddled by collapsing the quest log, and NumQuests is useless anyway.

	local oldquests=self.quests
	self.quests = {}

	--local selected = GetQuestLogSelection()

	local newquests = {}

	local logbyid = {}

	local nc=0

	--local numEntries, numQuests = GetNumQuestLogEntries();
	for i = 1,99 do  -- because collapsing affects numEntries, while hidden quests are still readable
		local sQuestLogTitleText, iQuestLevel, iSuggestedGroup, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory = GetQuestLogTitle(i)

		if not sQuestLogTitleText then break end

		if not isHeader and sQuestLogTitleText and questID then
			sQuestLogTitleText = sQuestLogTitleText:gsub(" ?\[[0-9D\+]+\] ?","") -- fix for [12] level display
			
			local quest = self.questsbyid[questID] or {}

			quest.title = sQuestLogTitleText
			quest.text,quest.summary = GetQuestLogQuestText(i)
			quest.level = iQuestLevel
			quest.tagnum = GetQuestLogQuestType(i) --will return a number.[0] = "", [1] = "Group", [41] = "PvP",[62] = "Raid", [81] = "Dungeon", [83] = "Legendary",[ 85] = "Heroic",[98] = "Scenario", [102] = "Account",
			--quest.objective = obj
			--quest.description = desc
			quest.complete = (isComplete==1)
			quest.failed = (isComplete==-1)
			quest.daily = (frequency==LE_QUEST_FREQUENCY_DAILY)
			quest.weekly = (frequency==LE_QUEST_FREQUENCY_WEEKLY)
			quest.bounty = isBounty
			quest.goals = self:GetQuestLeaderBoards(i,questID)
			quest.id = questID
			quest.index = tonumber(i)
			local was_in_log = quest.inlog  -- could be true, if taken from questsbyid
			quest.inlog = true

			tinsert(self.quests,quest)
			logbyid[questID]=quest

			if (not self.questsbyid[questID] or not was_in_log) and not self.recentlyAcceptedQuests[questID] then
				table.insert(newquests,quest)
				self.questsbyid[questID]=quest
			end

			nc=nc+1

		end
	end

	--table.wipe(self.questsbyid)
	for qid,q in pairs(self.questsbyid) do
		q.inlog = not not logbyid[qid]
	end

	--[[
	for qi,q in pairs(self.quests) do
		if q.id then
			self.questsbyid[q.id]=q
		else
			self:Print("Quest '"..q.title.."' has no ID! What the hell?")
		end
	end
	--]]

	--self:Debug("&quest cacheQuestLog "..(from and "from "..from.." " or "").."cached "..nc.." quests ("..#oldquests.." old, "..#newquests.." new)")

	-- any abandoned?
	if #oldquests>0 then
		for qi,q in pairs(oldquests) do
			if not self.questsbyid[q.id] and not self.completedQuests[q.id] then
				self.recentlyAcceptedQuests[q.id]=nil
				self.recentlyAcceptedQuests[q.title]=nil

				self:LostQuestEvent(q.title,q.id,q.complete)

				if q.id==self.recentAbandonedQuestID then
					self:AbandonedQuestEvent(q.title,q.id,q.daily)
				end
				if q.id==self.recentCompletedQuestID --[[and q.title==self.recentCompletedQuestTitle--]] then  --maybe not needed...
					self:CompletedQuestEvent(q.title,q.id,q.daily)
				end

				-- keep the lost in a 3-second temporary buffer; if the CHAT_MSG_SYSTEM announcing completion happens AFTER the quest is announced lost from the log, its handler below will need the quest's to properly register the quest's completion.
				self.recentlyLostQuests[q.title]=q.id
				self:ScheduleTimer(function() ZGV.recentlyLostQuests[q.title]=nil end, 3.0)
			end
			--[[
			if self.recentlyCompletedQuests[q.title] then
				self.db.char.completedQuests[q.title]=true
			end
			-- chat parsing already fired CompletedQuestEvent, sorry
			if q.id and self.recentlyCompletedQuests[q.id] then
				self.db.char.completedQuests[q.id]=true
				if q.daily then
					self.db.char.completedDailies[q.id]=time()
				end
			end
			--]]

			-- NOT to rely on .complete - a quest could be complete AND get abandoned, which would result in false-completion.
		end
		--self.recentlyCompletedQuests = {}
	end

	self.recentAbandonedQuestID = nil

	-- Now, handle the news.
	for i,q in ipairs(newquests) do
		self:NewQuestEvent(q.title,q.id)
	end

	if self.DEBUG_QUEST_ID then local q=ZGV.questsbyid[self.DEBUG_QUEST_ID]  DevTools_Dump({title=q.title,complete=q.complete,inlog=q.inlog,goals=q.goals}) end

	return self.quests
end

local function concat_keys(array,joiner)
	local temp = {}
	for i,v in pairs(array) do
		table.insert(temp,i)
	end
	return table.concat(temp,joiner or ",")
end

function ZGV:MarkUselessQuests()
	ZGV:Debug("MarkUselessQuests starts")
	local all_futures = {}

	-- get all future guides for all of user tabs
	for tabnum,guidedata in pairs(ZGV.db.char.tabguides) do
		local guide = ZGV:GetGuideByTitle(guidedata.title)
		if guide then
			ZGV:Debug("MarkUselessQuests guide in tab %s",guide.title)
			all_futures[guide.title] = true
			local guidefuture = guide:GetFutureGuides()
			for i,v in pairs(guidefuture) do all_futures[i] = v end
		end
	end
	ZGV:Debug("MarkUselessQuests future guides: %s",concat_keys(all_futures,","))
	local strings = ""
	for qi,quest in ipairs(self.quests) do
		local valid_quest = false

		-- check if guides for given quest are in our future
		local future_chains = ZGV.QuestDB:GetChainFuture(quest.id,true)
		ZGV:Debug("MarkUselessQuests quest %d future: %s",quest.id,concat_keys(future_chains,","))

		for qf,_ in pairs(future_chains) do
			local _,guidesforquest = ZGV.QuestDB:GetGuidesForQuest(qf)
			for guide,_ in pairs(guidesforquest) do
				if all_futures[guide] then 
					ZGV:Debug("MarkUselessQuests %d found in %s",qf,guide)
					valid_quest = true
					break
				end
			end
			if valid_quest then break end
		end
		quest.tagnum = GetQuestLogQuestType(i) --will return a number.[0] = "", [1] = "Group", [41] = "PvP",[62] = "Raid", [81] = "Dungeon", [83] = "Legendary",[ 85] = "Heroic",[98] = "Scenario", [102] = "Account",

		-- if not, and it is not special (daily, weekly, bounty, account wide, legendary, 89?), mark it as useless
		quest.useless = not valid_quest and not quest.daily and not quest.weekly and not quest.bounty and not (quest.tagnum==102) and not (quest.tagnum==83) and not (quest.tagnum==89)
		ZGV:Debug("MarkUselessQuests %d is useless %s",quest.id,quest.useless and "yes" or "no")
		if quest.useless then strings = strings .. quest.title .. "\n" end
		--print(quest.title,quest.useless)
	end
	ZGV:Debug("MarkUselessQuests ends")
	return strings
end

function ZGV:AbandonUselessQuests()
	for qi,quest in ipairs(self.quests) do
		if quest.useless then
			SelectQuestLogEntry(quest.index)
			SetAbandonQuest()
			AbandonQuest()
		end
	end
end
