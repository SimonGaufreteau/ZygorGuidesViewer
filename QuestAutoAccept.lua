local name,ZGV = ...

local _G=_G
local L = ZGV.L

ZGV.QuestAuto = {}
local QuestAuto = ZGV.QuestAuto

local tmp_no_autoquest
local function hook_DeclineQuest()
	tmp_no_autoquest=time()
end

local do_not_automate_these_quests = {
	[10552]=1, --Scryers
	[10551]=1, --Aldors
}

tinsert(ZGV.startups,{"QAA setup",function()
	-- quest auto turnin/accept
	ZGV:AddEventHandler("GOSSIP_SHOW",function(...) return QuestAuto:Gossip(...) end)
	ZGV:AddEventHandler("QUEST_GREETING",function(...) return QuestAuto:Greeting(...) end)
	ZGV:AddEventHandler("QUEST_DETAIL",function(...) return QuestAuto:Detail(...) end)
	ZGV:AddEventHandler("QUEST_PROGRESS",function(...) return QuestAuto:Progress(...) end)
	ZGV:AddEventHandler("QUEST_COMPLETE",function(...) return QuestAuto:Complete(...) end)
	ZGV:AddEventHandler("QUEST_FINISHED",function(...) return QuestAuto:Finished(...) end)
	ZGV:AddEventHandler("QUEST_ACCEPTED",function(...) return QuestAuto:Accepted(...) end)

	hooksecurefunc("DeclineQuest",hook_DeclineQuest)
	ZGV:ScheduleRepeatingTimer(ZGV.QuestAuto.Retry,2)
end})

function QuestAuto:Debug(s,...)
	return ZGV:Debug("&qauto "..s,...)
end

local function questAutoLockedout()
	if IsAltKeyDown() then return true end
	if tmp_no_autoquest and time()-tmp_no_autoquest<10 then
		tmp_no_autoquest=nil
		return true
	end
	local id = GetQuestID()
	if id and do_not_automate_these_quests[id] then 
		return true
	end

	return false
end

local function goalValidAccept(goal)
	if (goal.action=="accept" or goal.autoacceptany) and not goal.noautoaccept and (goal:GetStatus()=="incomplete" or goal:GetStatus()=="passive") then
		return true
	else
		return false
	end
end

local function getCurrentStepGoals()
	local results = {}
	for _,goal in ipairs(ZGV.CurrentStep.goals) do
		table.insert(results,goal)
	end
	
	for si,step in ipairs(ZGV:GetStickiesAt(ZGV.CurrentStep.num)) do
		if not step:IsComplete() then
			for gi,goal in ipairs(step.goals) do table.insert(results,goal) end
		end
	end
	return results
end

function QuestAuto:Retry()
	if not (ZGV.db.profile.autoacceptturnin or ZGV.db.profile.autoacceptturninall or ZGV.db.profile.questitemselector or ZGV.db.profile.autoselectitem) then return end

	if QuestFrameAcceptButton and QuestFrameAcceptButton:IsVisible() then 
		QuestAuto.Detail(ZGV)
		return 
	end
	if QuestFrameCompleteQuestButton and QuestFrameCompleteQuestButton:IsVisible() and QuestFrameCompleteQuestButton:IsEnabled() and (GetNumQuestChoices()==0 or ZGV.db.profile.autoselectitem) then 
		QuestAuto.Complete(ZGV)
		return
	end
	if QuestFrameCompleteButton and QuestFrameCompleteButton:IsVisible() and QuestFrameCompleteButton:IsEnabled() and (GetNumQuestChoices()==0 or ZGV.db.profile.autoselectitem) then 
		QuestAuto.Progress(ZGV)
		return
	end

	if QuestFrame and QuestFrame.GreetingPanel and QuestFrame.GreetingPanel:IsVisible() then
		QuestAuto.Gossip(ZGV)
	end
	if GossipFrame and GossipFrame.GreetingPanel and GossipFrame.GreetingPanel:IsVisible() then
		QuestAuto.Gossip(ZGV)
	end

end

function QuestAuto:Gossip()
	if not (ZGV.db.profile.autoacceptturnin or ZGV.db.profile.autoacceptturninall) then return end
	if questAutoLockedout() then return end

	local questsaccept=C_GossipInfo.GetAvailableQuests()
	local queststurnin=C_GossipInfo.GetActiveQuests()

	-- order matters, so lets check goals first to see if there is anything to accept or turn in
	if ZGV.db.profile.autoacceptturnin and ZGV.CurrentStep then
		for _,goal in ipairs(getCurrentStepGoals()) do
			if goalValidAccept(goal) then
				for qnum,questInfo in ipairs(questsaccept) do
					if (goal.questid==questInfo.questID) or (goal.autoacceptany and goal.autoacceptany[questInfo.questID]) then
						C_GossipInfo.SelectAvailableQuest(questInfo.questID)
						return true
					end
				end
			end

			if (goal.action=="turnin" and goal:GetStatus()=="incomplete") or (goal.autoturninany) then
				for qnum, questInfo in ipairs(queststurnin) do
					if (goal.questid == questInfo.questID) or (goal.autoturninany and goal.autoturninany[questInfo.questID] and questInfo.isComplete) then
						C_GossipInfo.SelectActiveQuest(questInfo.questID)
						return true
					end
				end
			end
		end
	end

	-- then if we have blanket permissions, accept and turnin everything else
	if ZGV.db.profile.autoacceptturnin and ZGV.db.profile.autoacceptturninall then
		for qnum,questInfo in ipairs(queststurnin) do
			local zygorquest = ZGV.quests[questInfo.questID]
			if zygorquest and zygorquest.complete or questInfo.isComplete then
				self:Debug("Turning in quest in gossip: %s", questInfo.title)
				C_GossipInfo.SelectActiveQuest(questInfo.questID)
				return true
			end
		end

		for qnum,questInfo in ipairs(questsaccept) do
--			if not questInfo.isTrivial then
				self:Debug("Opening any quest in gossip: #%d %s",qnum,questInfo.title)
				C_GossipInfo.SelectAvailableQuest(questInfo.questID)
				return true
--			end
		end
	end
end


function QuestAuto:Detail()
	if questAutoLockedout() then return end

	if not (ZGV.db.profile.autoacceptturnin or ZGV.db.profile.autoacceptturninall) then return end

	if ZGV.db.profile.autoacceptturnin and ZGV.db.profile.autoacceptturninall then -- everything and the kitchen sink
		-- normal quest
		QuestDetailAcceptButton_OnClick()
		-- instant quest
		if QuestInfoFrame.itemChoice then 
			GetQuestReward(max(QuestInfoFrame.itemChoice,1)) 
		else 
			self:Debug("no itemChoice") 
		end
		return true
	end

	if ZGV.db.profile.autoacceptturnin then
		local questID = GetQuestID()
		if not ZGV.CurrentStep then return end

		if C_QuestLog.IsOnQuest(questID) then
			-- we are already on that quest, starters get accepted without click, so we just need to dismiss the frame as viewer already moved to next step
			QuestDetailAcceptButton_OnClick()
			return
		end

		for i,goal in ipairs(getCurrentStepGoals()) do
			if goalValidAccept(goal) then
				if (goal.questid==questID) or (goal.autoacceptany and goal.autoacceptany[questID]) then
					-- normal quest
					self:Debug("Accepting quest as guide")
					QuestDetailAcceptButton_OnClick()

					-- instant quest
					if QuestInfoFrame.itemChoice then 
						GetQuestReward(max(QuestInfoFrame.itemChoice,1)) 
					else 
						self:Debug("no itemChoice") 
					end
					return true
				end
			end
		end
	end
	return false
end

function QuestAuto:Progress()
	if questAutoLockedout() then return end
	if not IsQuestCompletable() then return end

	if ZGV.db.profile.autoacceptturnin and ZGV.db.profile.autoacceptturninall then -- no need to test stuff, everything is good
		self:Debug("Completing quest, because autoacceptturninall.")
		ZGV:ScheduleTimer(function() 
			CompleteQuest()
		end,0)
		return true
	end

	if not ZGV.CurrentStep then return end
	local id = GetQuestID()

	if ZGV.db.profile.autoacceptturnin or (GetNumQuestChoices() > 1 and ZGV.db.profile.autoselectitem) then
		for i,goal in ipairs(getCurrentStepGoals()) do
			if (goal.quest and goal.quest.id==id)  or (goal.autoturninany and goal.autoturninany[id]) then
				self:Debug("Completing quest, because guide or autoselect.")
				ZGV:ScheduleTimer(function() 
					CompleteQuest()
				end,0)
				return true
			end
		end
	end
end

local function getRewardButton(id)
	for i,button in ipairs(QuestInfoFrame.rewardsFrame.RewardButtons) do
		if button:GetID()==id then return(button) end
	end
end
local function selectReward(id)
	QuestInfoFrame.itemChoice = id  -- in case we don't find a button to click, sanity
	local button = getRewardButton(id)  if not button then return end
	QuestInfoItem_OnClick(button)
end

function QuestAuto:Complete()
	-- highlight suggested quest reward
	local QuestItem = ZGV.ItemScore.QuestItem
	
	QuestItem:HideQuestRewardGlow()
	
	-- highlight best quest reward?
	if ZGV.db.profile.questitemselector then  --OPT
		local suggestedItemindex,reason = QuestItem:GetQuestRewardIndex()

		if suggestedItemindex == -5 then
			-- quest rewards not ready yet. keep trying
			ZGV:ScheduleTimer(function() QuestAuto:Complete() end,0.1)
			return false
		end

		self:Debug("Quest Reward item: %d picked because: %s",suggestedItemindex,reason)

		if suggestedItemindex then
			QuestItem:ShowQuestRewardGlow(suggestedItemindex,reason)
			
			-- select it?
			if ZGV.db.profile.autoselectitem then  --OPT
				selectReward(suggestedItemindex)
			end
		end
	end
	
	if (ZGV.db.profile.questitemselector and ZGV.db.profile.autoselectitem) and not QuestInfoFrame.itemChoice and GetNumQuestChoices()>0 then
		ZGV:Print(L['autocomplete_turnin_fail'])
		return false
	end

	-- auto-accept? reward selected, or there wasn't a choice?
	if ZGV.db.profile.autoturnin then  --OPT
		-- any reward selected, or no selection needed?
		if tonumber(QuestInfoFrame.itemChoice or 0)>0 or GetNumQuestChoices()<=1 then
			-- make it a valid choice
			local reward = max(QuestInfoFrame.itemChoice or 1,1)
		
			if ZGV.db.profile.autoacceptturninall then  -- let's not be picky   --OPT
				ZGV:Print(L['autocomplete_turnin'])
				GetQuestReward(reward)
			elseif ZGV.CurrentStep then  -- let's be picky
				local id = GetQuestID()
				for i,goal in ipairs(getCurrentStepGoals()) do
					if (goal.quest and goal.quest.id==id) or (goal.autoturninany and goal.autoturninany[id]) then
						ZGV:Print(L['autocomplete_turnin'])
						GetQuestReward(reward)
						break
					end
				end
			end
		end
	end
end


function QuestAuto:Finished()
	ZGV.ItemScore.QuestItem:HideQuestRewardGlow() --Try to hide the glow

	-- goal "noquest" uses these to check when was the last time we accepted a quest.
	ZGV.last_questgiver_id = ZGV.GetTargetId()
	ZGV.last_questgiver_time = GetTime()
end

ZGV.last_questgiver_time=0
function QuestAuto:Accepted()
	-- goal "noquest" uses these to check when was the last time we accepted a quest.
	ZGV.last_questgiver_id = ZGV.GetTargetId()
	ZGV.last_questgiver_time = GetTime()
end









function QuestAuto:Greeting()
	if not (ZGV.db.profile.autoacceptturnin or ZGV.db.profile.autoacceptturninall) then return end
	if questAutoLockedout() then return end

	local questsaccept,questsacceptid={},{}
	for qnum=1,GetNumAvailableQuests() do
		questsaccept[qnum] = GetAvailableTitle(qnum)
		if ZGV.IsRetail then
			local isTrivial, frequency, isRepeatable, isLegendary, questID, isImportant, isMeta = GetAvailableQuestInfo(qnum)
			questsacceptid[qnum] = questID
		end
	end

	local queststurnin,queststurninid={},{}
	for qnum=1,GetNumActiveQuests() do
		queststurnin[qnum] = GetActiveTitle(qnum)
		if ZGV.IsRetail then
			local questID = GetActiveQuestID(qnum)
			queststurninid[qnum] = questID
		end
		
	end



	-- order matters, so lets check goals first to see if there is anything to accept or turn in
	if ZGV.db.profile.autoacceptturnin and ZGV.CurrentStep then
		for _,goal in ipairs(getCurrentStepGoals()) do
			if goalValidAccept(goal) then
				for qnum,questTitle in ipairs(questsaccept) do
					local questID = questsacceptid[qnum]
					if (goal.quest and goal.quest.title==questTitle) or (questID and (goal.questid==questID) or (goal.autoacceptany and goal.autoacceptany[questID])) then
						SelectAvailableQuest(qnum)
						return true
					end
				end
			end

			if (goal.action=="turnin" and goal:GetStatus()=="incomplete") then
				for qnum, questTitle in ipairs(queststurnin) do
					local questID = queststurninid[qnum]
					if (goal.quest and goal.quest.title==questTitle) or (questID and (goal.quest and goal.quest.id==questID) or (goal.autoturninany and goal.autoturninany[questID])) then
						SelectActiveQuest(qnum)
						return true
					end
				end
			end
		end
	end

	-- then if we have blanket permissions, accept and turnin everything else
	if ZGV.db.profile.autoacceptturnin and ZGV.db.profile.autoacceptturninall then
		for qnum,questTitle in ipairs(queststurnin) do
			SelectActiveQuest(qnum)
			return true
		end

		for qnum,questInfo in ipairs(questsaccept) do
			local isTrivial = GetAvailableQuestInfo and GetAvailableQuestInfo(qnum)
			if not isTrivial then
				SelectAvailableQuest(qnum)
				return true
			end
		end
	end
end
