local Goal = ZGV.GoalProto
local GOALTYPES = ZGV.GOALTYPES

-- returns: current, needed, remaining
function Goal.GetQuestGoalData(questid,objnum,count)
	local questdata,goaldata,goalcountnow,goalcountneeded,remaining
	questdata=ZGV.questsbyid[questid]
	if not questdata or not questdata.inlog or not objnum then return end

	-- quest-goal completion display; lame 0/5
	goaldata = questdata.goals[objnum]
	if not goaldata then return end

	goalcountneeded = min(count or 9999,goaldata.needed or 9999)
	goalcountnow = goaldata.num
	remaining = goalcountneeded-goalcountnow
	if remaining<=0 then remaining=goalcountneeded end

	return goalcountnow,goalcountneeded,remaining
end


GOALTYPES['learnmount'] = GOALTYPES['get']
GOALTYPES['learnpet'] = GOALTYPES['get']

GOALTYPES['accept'].iscomplete = function(self)
	local quest = ZGV.questsbyid[self.questid]
	local complete = (ZGV.completedQuests[self.questid] and not self.repeatablequest)
	    or (ZGV.recentlyCompletedQuests[self.questid] or ZGV.recentlyCompletedQuests[self.quest])
	    or (quest and quest.inlog)

	return complete, complete or (ZGV.QuestDB:IsQuestPossible(self.questid)==ZGV.QuestDB.VALID_NOW)     --[[or ZGV.recentlyAcceptedQuests[id] --]]
end

GOALTYPES['earn'] = GOALTYPES['get'] -- no currency tabs in classic

function Goal:IsValidRole()
	local role,role2 = self.grouprole,self.grouprole2

	if role=="DPS" or role2=="DPS" then return true end
	if ZGV.ItemScore.playeristank and role=="TANK" or role2=="TANK" then return true end
	if ZGV.ItemScore.playerishealer and role=="HEALER" or role2=="HEALER" then return true end

	return false
end