local name,ZGV = ...

local Guide = { }
local GuideFuncs = {}

local L = ZGV.L

local table,string,tonumber,ipairs,pairs,setmetatable = table,string,tonumber,ipairs,pairs,setmetatable
local IsQuestFlaggedCompleted = C_QuestLog.IsQuestFlaggedCompleted

local CHAIN = ZGV.ChainCall

local OnOpen=nil -- it's used in notification registrations, but not initialized..?

ZGV.GuideProto = Guide
ZGV.GuideFuncs = GuideFuncs
local GuideProto_mt = { __index=Guide }

---@param title string
---@param header GuideHeader
---@param data string
function Guide:New(title,header,data)
	local path,tit = title:match("^(.*)\\+(.-)$")
	if not path then path=title end
	local guidetype = path:match("^(.-)\\") or path 

	if not data then header,data={},header end

	if type(header.hideif)=="boolean" and header.hideif then return nil end
	if type(header.hideif)=="function" then
		setfenv(header.hideif,ZGV.Parser.ConditionEnv)
		local isOK,ret = pcall(header.hideif)
		if isOK then
			if ret then return nil end
		else
			ZGV:Error("Error calling 'hideif' for guide:\n"..title.."\nError: "..ret)
		end
	end

	if type(header.next)=="function" then
		setfenv(header.next,ZGV.Parser.ConditionEnv)
		local isOK,ret = pcall(header.next)
		if isOK then  header.next=ret  else  ZGV:Error("Invalid 'next' function in guide:\n"..title.."\nError: "..ret)  end
	end

	if header.id then
		if ZGV.RegisteredGuidesByIdent[header.id] then
			ZGV:Error(title,"Ident ",header.id," is already registered by",ZGV.RegisteredGuidesByIdent[header.id])
		end
		ZGV.RegisteredGuidesByIdent[header.id] = title
	end

	local filepath = debugstack(2):gsub(".*@",""):gsub('"]:'," line "):gsub(': in main chunk\n',""):gsub("Interface/AddOns/",""):gsub("\\","\\ "):gsub("_","_ ")

	if ZGV.IsClassicHardcore and not header.hardcore then
		-- append there be dragons warning
		data = "step\nThis guide has not been optimized for Hardcore servers and its instructions may result in the death of your character.  If you understand this and are willing to risk a death and restart:  Click here to continue.|confirm\n"..data
	elseif not ZGV.IsClassicHardcore and header.only_hardcore then
		-- skip only_hardcore guides
		return nil
	elseif not ZGV.IsClassicHardcore and header.hardcore then
		header.hardcore=false
		header.hardcore__off=true
	end


	if ZGV.IsClassicCATA and not header.cataready then
		-- append there be dragons warning
		data = "step\nThis is the Retail version of this guide. Cataclysm Classic is running an older version of Cataclysm than Retail and its differences may affect this guide. Based on customer feedback, we've made this guide available to Cataclysm Classic users, but you may run into issues. Our team is working to properly update all guides for Cataclysm Classic.\nClick here to continue.|confirm\n"..data
	end

	--if (not not ZGV.IsPandariaRemix)~=(not not header.pandariaremix) then
	--	return nil -- don't load non remix guides on remix realms, and keep remix off regular
	--end

	---@type Guide
	local guide = {
		title=title,
		title_short=tit or title,
		rawdata=data,
		headerdata=header,
		num=#ZGV.registeredguides+1,
		parsed=nil,
		fully_parsed=nil,
		type=guidetype,
		subtype=ZGV.GuideMenuTier,
		devonly=ZGV.DevGuides,
		filepath=filepath,
		guidepath=path
	}

	if not path:find("SHARED") and ZGV:NeedsAnimatedPopup(guide) then -- guides with fancy popups are loaded from said popups
		ZGV.AnimatePopup = true
	  --return nil
	end


	ZGV.RegisteredGuidesTitles[title]=true


	setmetatable(guide,GuideProto_mt)

	return guide
end

Guide.Types = {
	LEVELING = 1,
	LOREMASTER = 2,
 	DAILIES = 3,
	EVENTS = 4,
	DUNGEONS = 5,
	GEAR = 5,
	PROFESSIONS = 6,
	ACHIEVEMENTS = 7,
	GOLD = 8,
	PETSMOUNTS = 9,
	TITLES = 10,
	REPUTATIONS = 11,
	MACROS = 12,
	TEST = 13,
	MISC = 14,
	}
Guide.SubTypes = {
	TRI = 0,
	CAT = 1,
	MOP = 2,
	WOD = 3,
	LEG = 4,
	BFA = 5,
	SHA = 6,
	DRA = 7,

	CLA = 1,
	BCC = 2,
	WLK = 3,
	}
Guide.Sides = {
	A = 1,
	H = 2,
	}


function Guide:If_Complete_achieveid()
	if not self.headerdata.achieveid then return false,false end
	for i,achieveid in ipairs(self.headerdata.achieveid) do if not ZGV.Parser.ConditionEnv.achieved(achieveid) then return false end end
	return true
end

function Guide:If_Complete_mounts()
	if not self.headerdata.mounts then return false,false end
	for i,mountid in ipairs(self.headerdata.mounts) do if not ZGV.Parser.ConditionEnv.hasmount(mountid) then return false end end
	return true
end

function Guide:If_Complete_pets()
	if not self.headerdata.pet then return false,false end
	if type(self.headerdata.pet)=="table" then
		for i,petid in ipairs(self.headerdata.pet) do if not ZGV.Parser.ConditionEnv.haspet(petid) then return false end end
	else
		return ZGV.Parser.ConditionEnv.haspet(tonumber(self.headerdata.pet))
	end
	return true
end

function Guide:DoCond(which,...)
	local whichcond = which and self['condition_'..which]
	if which and whichcond then
		-- handle "links": condition_valid="suggested"
		if type(whichcond)=="string" and whichcond~=which and self['condition_'..whichcond] then
			self['condition_'..which]=self['condition_'..whichcond]
		end
		ZGV.Parser.ConditionEnv:_SetLocal(self,nil,nil)
		local isOK,ret = pcall(self['condition_'..which],self,...)
		if isOK then
			return ret,ret and "" or self['condition_'..which..'_msg']
		else
			ZGV:Print("ERROR parsing condition for guide:\n"..self.title.."\n"..(self['condition_'..which.."_raw"] or "(code)").."\nError: "..ret)
			return false,"ERROR: "..(self['condition_'..which..'_msg'] or "")
		end
	end

	-- no condition to check? improvise from attributes...

	if which=="valid" then
		-- Check class/spec compatiblity
		if self.class then
			local lclass,kclass=UnitClass("player")
			if kclass~=self.class then
				local classeslocalized = {}
				if LocalizedClassList then
					classeslocalized = LocalizedClassList(UnitSex("player")==3)
				else
					FillLocalizedClassList(classeslocalized,UnitSex("player")==3)
				end
				return false,classeslocalized[self.class].." class is required." -- TODO localize
			elseif self.spec then
				local GetSpecFunc = GetPrimaryTalentTree or GetSpecialization
				local GetSpecInfoFunc = GetTalentTabInfo or GetSpecializationInfo
				if not self.spec[GetSpecFunc()] then
					local specnames,multiple = "",nil
					for k,v in pairs(self.spec) do
						local _,specname=GetSpecInfoFunc(k)
						if specnames~="" then specnames=specnames..", " multiple=true end
						specnames=specnames..specname
					end
					return false,"Only the following spec"..(multiple and "s are" or " is").." eligible: "..specnames
				end
			end
		end

		if self.startlevel then
			return ZGV:GetPlayerPreciseLevel()>=self.startlevel,"Level "..ZGV.FormatLevel(self.startlevel).." or higher is required."
		end
		-- If above is ok
		return true
	elseif which=="suggested" and self.startlevel and self.type=="LEVELING" then
		local level=ZGV:GetPlayerPreciseLevel()
		return level>=self.startlevel and level<(self.endlevel or 999)
	elseif which=="outleveled" and self.endlevel then 
		return ZGV:GetPlayerPreciseLevel()>=self.endlevel,"Level "..ZGV.FormatLevel(self.endlevel).." passed."
	elseif which=="end" then
		if self.endlevel then
			return ZGV:GetPlayerPreciseLevel()>=self.endlevel,"Level "..ZGV.FormatLevel(self.endlevel).." reached."
		elseif self.headerdata.achieveid then
			return self:If_Complete_achieveid()
		elseif self.headerdata.mounts then
			return self:If_Complete_mounts()
		elseif self.headerdata.pet then
			return self:If_Complete_pets()
		end
	end
end

function Guide:GetStatus(detailed)
	local pass,msg

	pass,msg = self:DoCond("valid")
	if not pass then return "INVALID",msg end

	if detailed and self:GetCompletion()==1 then return "COMPLETE" end

	pass,msg = self:DoCond("outleveled")
	if pass then return "OUTLEVELED",msg end

	pass,msg = self:DoCond("end")
	if pass then return "COMPLETE",msg end

	msg="" -- TODO it's a bug, we ask the end condition and we're reusing its value even if the guide isnt complete

	if self.condition_suggested_raw or self.type=="LEVELING" then
		pass,msg = self:DoCond("suggested")
		if pass then return "SUGGESTED" end
	end

	return "VALID",msg
end

function Guide:GetCompletion(mode)
	self.completionmode = self.completionmode
		or (self.type=="LOREMASTER" and "quests")
		or (self.type=="LEVELING" and "quests")
		or (self.type=="DAILIES" and "quests")
		or (self.type=="ACHIEVEMENTS" and self.headerdata and self.headerdata.achieveid and "achievement")
		or (self.title:match("\\Hunter Pets\\") and "none") -- hunter pets, there is nothing to complete in them
		or (self.type=="DUNGEONS" and "none")
		or (self.headerdata and self.headerdata.mounts and "mounts")
		or (self.headerdata and self.headerdata.pet and "battlepet")
		or (self.headerdata and self.headerdata.playertitle and "playertitle")
		or (type(self.condition_end)=="function" and "function_end")
		or "steps"
	local mode = mode or self.completionmode

	if mode=="macro" then
		local acc=self.macro:MacroExists("account")
		local char=self.macro:MacroExists("character")
		return (acc or char) and 1 or 0,acc,char
	end

	if self.parse_failed then return "error","parsing failed" end

	if mode=="steps" then
		-- request full parsing for those
		if not self.fully_parsed then
			self.need_to_parse=true
			ZGV:Debug("Guide:GetCompletion : '%s' needs parsing for completion type '%s'",self.title,mode)
			return "loading"
		end
	end

	if mode=="none" then
		return "none"
	elseif mode=="level" then
		if not self.startlevel or not self.endlevel then return "error","no starting/ending level set" end
		if self.startlevel==self.endlevel then return ZGV:GetPlayerPreciseLevel() > self.startlevel and 1 or 0 end
		return min(1,max(0,(ZGV:GetPlayerPreciseLevel()-self.startlevel)/(self.endlevel-self.startlevel)))
	elseif mode=="quests" then
		local quests,orquests = self:GetQuests()
		local count,comp = 0,0

		-- mark |or quest groups as completed
		for qid,step in pairs(orquests) do
			if IsQuestFlaggedCompleted(qid) then 
				for i,v in pairs(orquests) do if v==step then orquests[i]=true end end
			end
		end

		for qid,step in pairs(quests) do
			count=count+1
			if IsQuestFlaggedCompleted(qid) or orquests[qid]==true then comp=comp+1 end
		end
		return count>0 and comp/count or 0, comp,count
	elseif mode=="steps" then
		local count,comp = 0,0
		for si,step in ipairs(self.steps) do
			local iscomplete, ispossible = step:IsComplete()
			if step:AreRequirementsMet(nil,"strict") then -- (iscomplete or ispossible) and not step:IsAuxiliary() and 
				count=count+1
				if iscomplete then comp=comp+1 end
			end
		end
		return count>0 and comp/count or 0, comp,count
	elseif mode=="skill" then
		local skill = ZGV.Professions:GetSkill(self.completionparams[1])
		return skill.level/(self.completionparams[2] or 525), skill.level, self.completionparams[2] or 525
	elseif mode=="script" then
		if not self.completionfunc then
			local raw = self.completionraw[2]
			if not raw then ZGV:Print("ERROR parsing guide "..self.title..": bad 'completion' script.") self.completionfunc=function() return 0 end return end
			local func,err = loadstring("return ("..raw..")")
			if err then ZGV:Print("ERROR parsing guide "..self.title..": bad 'completion' script.") self.completionfunc=function() return 0 end return end
			self.completionfunc = func
		end
		local ret = self.completionfunc()
		if type(ret)=="boolean" then ret=ret and 1 or 0 end
		return ret,0,1
	elseif mode=="function_end" then
		local ret = self:condition_end()
		if type(ret)=="boolean" then ret=ret and 1 or 0 end
		return ret,0,1
	elseif mode=="achievement" then
		if not (self.headerdata and self.headerdata.achieveid) then return 0 end -- no achieve to watch for defined

		local _,achieveid = next(self.headerdata.achieveid)
		local numCriteria = GetAchievementNumCriteria(achieveid) or 0 --safety check.
		local crit_completed,crit_needed=0,0
		if numCriteria==0 then
			local _, _, _, completed = GetAchievementInfo(achieveid)
			crit_completed = completed and 1 or 0
			crit_needed = 1
		else
			local comp=0
			for criteria=1,numCriteria do
				local _, _, completed, current,needed = ZGV.Zygor_GetAchievementCriteriaInfo(achieveid, criteria)
				crit_completed = crit_completed + current
				crit_needed = crit_needed + needed
			end
		end
		return crit_completed/crit_needed,crit_completed,crit_needed
	elseif mode=="inventory" then
		return 0

	elseif mode=="mounts" then
		for i,v in pairs(self.headerdata.mounts) do
			if ZGV.Parser.ConditionEnv.hasmount(v) then return 1 end
		end
		return 0
	elseif mode=="battlepet" then
		local c,m = C_PetJournal.GetNumCollectedInfo(self.headerdata.pet)
		if not c then ZGV.BATTLE_PET_ERROR=self end
		return (c and c>0) and 1 or 0
	elseif mode=="playertitle" then
		local pt = self.headerdata.playertitle
		if type(pt)=="number" then return IsTitleKnown(pt) and 1 or 0 end
		if type(pt)=="table" then
			for _,titleid in ipairs(pt) do
				if IsTitleKnown(titleid) then return 1 end
			end
			return 0
		end
		geterrorhandler()("Bad playertitle in guide "..self.title)
		return 0
	end
	-- other completions might not need a full parse.
	return "error","we don't know if this guide completes or not"
end

function Guide:GetCompletionText(mode)
	local mode = mode or self.completionmode
	local comp,a,b,c,d = self:GetCompletion(mode)
	assert(comp) -- Sanity!
	if comp=="loading" then return "...","(loading)" end
	if comp=="error" or type(comp)~="number" then return "?",("(an error occurred: %s)"):format(a or "black magic") end


	if mode=="none" then
		return "-", "This guide does not complete."
	elseif mode=="skill" then
		local skill = ZGV.Professions:GetSkill(self.completionparams[1])
		--return ("%d/%d"):format(a,b), ("%s skill: %d/%d"):format(ZGV.LocaleSkills[self.completionparams[1]],a,b)
		return math.floor(comp*100).."%", ("%s skill: %d/%d"):format(ZGV.Professions.LocaleSkills[self.completionparams[1]],a,b)
	elseif mode=="quests" then
		return math.floor(comp*100).."%", ("Quests completed: %d/%d"):format(a,b)
	elseif mode=="level" then
		-- Changed the rounding to try to get more accurate results.
		-- http://www.zygorguides.com/forum/showthread.php?16059-Experience-Bar-Is-Off&p=93935#post93935
		-- Old equation: (self.endlevel-math.floor(self.endlevel))*20
		-- New equation: floor((self.endlevel-math.floor(self.endlevel))*20+0.05)
		-- ~~ Jeremiah
		return math.floor(comp*100).."%", ("Level %3d (+%d bars) reached: %d%%"):format(self.endlevel,floor((self.endlevel-math.floor(self.endlevel))*20+0.05),math.floor(comp*100)) --- 2015-03-29
	elseif mode=="steps" then
		return math.floor(comp*100).."%", ("Steps completed: %d/%d"):format(a,b)
	elseif mode=="macro" then
		return comp~=0 and "+" or "—",comp~=0 and L["macro_status_yes"]:format((a and b) and L["macro_both"] or (a and L["macro_acc"] or L["macro_char"])) or L["macro_status_no"]
	else
		return math.floor(comp*100).."%", ""
	end
end

function Guide:Load(step)
	ZGV:SetGuide(self,step)
end

function Guide:Unload()
	if ZGV.Tabs:IsGuideTabbed(self) then
		return
	end

	self.steps=nil
	self.fully_parsed=nil
	self.rawdata_full=nil
	collectgarbage("step",100)
end

function Guide:ParseHeader()
	ZGV.Parser:ParseHeader(self)
end

function Guide:Parse(fully)
	if self.rawdata and (not self.parsed or not self.fully_parsed) then

		
		if (ZGV.IsPandariaRemix and not self.headerdata.pandariaremix) and (not self.headerdata.poiloader) then
			self.rawdata = "step\n"..L["pandariaremix_not_tuned"].."|confirm\n"..self.rawdata
		end

		if self.parse_failed then return end

		local t1=debugprofilestop()

		local lastparsed = {linenum=-2,linedata="-?-"}
		local success,parsed,err,line,stepnum,linedata = ZGV.F.coroutine_safe_pcall(function() return ZGV.Parser:ParseEntry(self,fully,lastparsed) end)  -- ParseEntry may yield, caught in ZGV @coro_startup

		if fully then ZGV:Debug("&startup_parse Parsing guide: %s = %dms (%s)",self.title,debugprofilestop()-t1,coroutine.running() and "thread" or "fg") end

		if not success then
			local err = parsed
			ZGV:Error(L["message_errorloading_critical"]:format(self.title,err,lastparsed.linenum,lastparsed.linedata))
			self.parse_failed = true
			return nil,lastparsed.linenum

		elseif not parsed then
			if err then
				ZGV:Error(L["message_errorloading_full"]:format(self.title,line or 0,stepnum or "?",linedata or "???",err))
			else
				ZGV:Error(L["message_errorloading_brief"]:format(self.title))
			end
			self.parse_failed = true
			return nil,line

		else

			self.parsed = true

			-- parsed!
			--for k,v in pairs(parsed) do self[k]=v end  -- why the hell would we overwrite ourselves..?

			if self.steps and (#self.steps>0) then
				self.fully_parsed = true

				-- cap it with a finisher step
				if not self.headerdata.singlestep and (self.steps[#self.steps].condition_valid or self.steps[#self.steps].requirement) then
					local completion_step = ZGV.StepProto:New {
						num=#self.steps+1,
						parentGuide=self,
						finish=true,
						goals = {}
					}

					local completion_goal = ZGV.GoalProto:New {
						num=1,
						action="",
						text="This guide is now complete.",
						parentStep=completion_step
					}
					
					tinsert(completion_step.goals,completion_goal)
					tinsert(self.steps,completion_step)
				end

				-- gather all step labels, round'em up and brand'em
				self.steplabels={}
				for si,step in ipairs(self.steps) do
					local label=step.label
					if label then
						if not self.steplabels[label] then self.steplabels[label]={} end
						tinsert(self.steplabels[label],si)
					end
					if step.extralabels then
						for _,extralabel in ipairs(step.extralabels) do
							if not self.steplabels[extralabel] then self.steplabels[extralabel]={} end
							tinsert(self.steplabels[extralabel],si)
						end
					end
				end

				-- render sticky refs into their steps
				for sn,step in ipairs(self.steps) do
					if step.sticky_labels then
						step.stickies={}
						for i,stickylabel in ipairs(step.sticky_labels) do repeat
							if stickylabel~=step.label then
								local stickynums = self.steplabels[stickylabel]  if not stickynums then ZGV:Error("Sticky step by that label not found: %s  in  %s  step %d",stickylabel,self.title,sn) break end
								local stickynum=stickynums[1]
								local stickystep = self.steps[stickynum]  if not stickystep then ZGV:Error("Sticky step by that label/number not found: %s %s  in  %s",stickylabel,stickynum,self.title)  break  end
								tinsert(step.stickies,stickystep)
							end
						until true end
					end
				end


				--if ZGV.CLEAR_GUIDE_RAWDATA_AFTER_PARSING then self.rawdata=nil end
				-- DON'T. Guides that are UNloaded have their .steps cleared - they need rawdata to be parsed again!
		
				return true
			end

		end
		
		--self:Debug("Parsed: "..self.title)
	end
end

local guidequests={}
local guideorquests={}
function Guide:GetQuests()
	table.wipe(guidequests)
	table.wipe(guideorquests)


	if ZGV.Quest_Cache and ZGV.Quest_Cache[self.title] then
		for _,questpack in pairs(ZGV.Quest_Cache[self.title]) do
			if type(questpack)=="table" then
				-- if needed, prepare conditions for 
				if questpack.cond_if and not questpack.cond_if_raw then 
					questpack.cond_if_raw = questpack.cond_if
					questpack.cond_if = ZGV.Parser.MakeCondition(questpack.cond_if_raw)
				end

				if (not questpack.cond_if or questpack.cond_if()) then
					if not questpack.ids then
						ZGV:Debug("Guide: wtf, quest with no ids: %s",self.title)
					else
						for quest in pairs(questpack.ids) do
							guidequests[tonumber(quest)] = true
						end
					end
				end
			end
		end
	elseif self.parsed and self.steps then 
		-- if we do not have cache data, and the guide is already loaded, use its steps
		for si,step in ipairs(self.steps) do
			if not step.condition_visible or step.condition_visible() then
				for gi,goal in ipairs(step.goals) do
					if goal:IsVisible() and goal.questid then
						if goal.orlogic then guideorquests[tonumber(goal.questid)]=si end
						guidequests[tonumber(goal.questid)] = si 
					end
				end
			end
		end
	end

	-- TODO handle goal.orlogic once supported by questcache

	-- if we have nothing in cache, that means that guide has no quests, and we return empty arrays
	return guidequests,guideorquests
end

local futureguides={}
function Guide:GetFutureGuides()
	table.wipe(futureguides)

	local guide = ZGV.CurrentGuide
	while guide.next do
		guide = ZGV:GetGuideByTitle(guide.next)
		if not guide then break end
		if futureguides[guide.title] then break end
		futureguides[guide.title] = true
	end

	return futureguides
end

--[=[ -- unused
function Guide:HasProfession() --Real quick and dirty check to see if this profession guide works for us.
	if not self.type == "PROFESSIONS" then return end
	if not self.completionparams then return end
	if not ZGV.Professions.skills then return end

	if ZGV.Professions.skills[self.completionparams[1]] then return true end
end
--]=]

------- hello popup

StaticPopupDialogs['ZYGORGUIDESVIEWER_NEXTGUIDE'] = {
	text = L['static_caption']..L['static_nextguide'],
	button1 = ACCEPT,
	button2 = CANCEL,
	hideOnEscape = 1,
	timeout = 0,
	whileDead = 1,
	OnAccept = function(self) ZGV:SetGuide(self.guide) end,
	OnCancel = function(self) ZGV.db.char.ignoredguides[self.guide.title]=true  end,
}

StaticPopupDialogs['ZYGORGUIDESVIEWER_BADGUIDE'] = {
	text = L['static_caption']..L['static_badguide'],
	button1 = YES,
	button2 = NO,
	hideOnEscape = 1,
	timeout = 0,
	whileDead = 1,
	OnAccept = function(self)  ZGV.db.char.goodbadguides[self.guide.title]=true  ZGV:SetGuide(self.guide,self.step)  end,
	OnCancel = function(self)  ZGV.GuideMenu:OpenGuide(self.guide)  end,
}

function Guide:AdvertiseWithPopup(nodelay,force)
	if ZGV.db.char.guideTurnInsOnly == ZGV.CurrentGuide.title then return end -- do not show the adv if player decided to wrap up already
	if ZGV.db.char.ignoredguides[self.title] then return end
	if ZGV.GuideMenu.MainFrame and ZGV.GuideMenu.MainFrame:IsVisible() and not force then return end  -- do not pop over the guide menu, ffs

	if ZGV.PopupHandler:IsInNC("ZygorSISPopup") then return end -- don't queue multiples of this notification

	if not (ZGV.db.profile.n_popup_enable and ZGV.db.profile.n_popup_guides and ZGV.Frame:IsVisible()) then return end -- If ZGV is hidden then we don't need to be suggesting guides.
	local delay = true
	if nodelay then delay=false end
	if delay and ZGV:IsPlayerInCombat() then
		ZGV.call_after_combat = function() self:AdvertiseWithPopup(true) end
		ZGV:Print("Next guide is ready. Just finish your combat.")
	else
		local dialog = ZGV.PopupHandler:NewPopup("ZygorSISPopup","sis") --Just GC it after we are done, not used enough and have to change the whole thing every time.

		if self.image then
			dialog.tex = CHAIN(dialog:CreateTexture())
				:SetPoint("TOP",dialog.text2,"BOTTOM",0,-3) :SetSize(275,137) :SetTexture(self.image)
			.__END

			dialog.AdjustSize = function(self)
				local offsets = 10 + 10 + 5 --Logo and top + text and buttons + buttons and bottom
				local minWidth = self.acceptbutton:GetWidth() + self.declinebutton:GetWidth() + self.settings:GetWidth() + 55

				local height = offsets + (self.text3checkbox:GetStringHeight()+10) + self.tex:GetHeight() + self.text:GetStringHeight() + self.text2:GetStringHeight() + (self.logo:IsVisible() and self.logo:GetHeight() or 5) + self.acceptbutton:GetHeight() + self.morebutton:GetHeight()
				local width = max(minWidth,self.text:GetStringWidth(),self.text2:GetStringWidth(),self.tex:GetWidth())+50

				self:SetSize(width,height)
			end
		end

		-- text,title,tooltipText,priority,poptime,removetime,quiet = returnMinimizeSettings()

		dialog.returnMinimizeSettings = function(self)
			local notifcationText = L['notifcenter_nextguide_text']:format(ZGV.GuideMenu.STATUS_COLORS[self.guide:GetStatus()].code,self.guide.title_short)
			return "guide",L['notifcenter_nextguide_title'],notifcationText,{guide=self.guide.title, tooltip=L['notifcenter_gen_popup_tooltip']}
		end


		dialog:SetText(L['static_nextguide2'],self.title_short,L['static_nextguide_turnins'])
		-- dialog.text3checkbox:Show()

		CHAIN(dialog.morebutton):Show():SetText("More zones..."):SetSize(110,20)
		dialog.OnMore = function(self)
			ZGV.GuideMenu:Show("Suggested")
		end
		dialog.more_tooltip = "Zones now scale with your player level allowing more freedom to choose where to level.|nClick here to open the Guide Menu and see a list of alternative zones you can level in."

		dialog.OnAccept = function()
			ZGV:Debug("Accepted %s",dialog.guide.title)
			ZGV:ScheduleTimer(function() 
				if not GuideFuncs:IsValid(dialog.guide,dialog.guide.currentstep,"advert") then return end
				ZGV:SetGuide(dialog.guide)
			end, 0) -- wait for next frame, so that this popup is already closed
			--[[
			if dialog.text3checkbox:IsChecked() then
				ZGV.db.char.guideTurnInsOnly = ZGV.CurrentGuide.title 
			else
				ZGV:SetGuide(self.guide) 
				self=nil 
			end
			--]]
			-- ZGV.db.char.forceCleanUp = true
		end
		dialog.accept_tooltip = "Load the suggested guide."

		dialog.OnDecline = function(self) ZGV.db.char.ignoredguides[self.guide.title]=true end
		dialog.decline_tooltip = "No, thank you."

		dialog.guide=self

		dialog:Show()
	end
end

function Guide:LegionPopup(title,message,level)
	if ZGV:IsPlayerInCombat() then
		ZGV.call_after_combat = function() self:LegionPopup(title,message,level) end
		ZGV:Print("Next guide is ready. Just finish your combat.")
	elseif ZGV.PopupHandler then
		local dialog = ZGV.PopupHandler:NewPopup("ZygorLegionPopup","legion") --Just GC it after we are done, not used enough and have to change the whole thing every time.

		if self.image then
			dialog.tex = CHAIN(dialog:CreateTexture())
				:SetPoint("TOP",dialog.text2,"BOTTOM",0,-3) :SetSize(275,115) :SetTexture(self.image)
			.__END

			dialog.AdjustSize = function(self)
				local offsets = 10 + 10 + 5 --Logo and top + text and buttons + buttons and bottom
				local minWidth = self.acceptbutton:GetWidth() + self.declinebutton:GetWidth() + self.settings:GetWidth() + 55

				local height = offsets + (self.text3checkbox:GetStringHeight()+10) + self.tex:GetHeight() + self.text:GetStringHeight() + self.text2:GetStringHeight() + (self.logo:IsVisible() and self.logo:GetHeight() or 5) + self.acceptbutton:GetHeight()
				local width = max(minWidth,self.text:GetStringWidth()+50,self.text2:GetStringWidth(),self.tex:GetWidth()+25)

				self:SetSize(width,height)
			end
		end

		dialog.returnMinimizeSettings = function(self)
			return "guide",title,self.guide.title_short,{guide=self.guide.title}
		end

		dialog:SetText(title,message)

		dialog.OnAccept = function(self) 
			ZGV:SetGuide(self.guide) 
			self=nil 
		end

		dialog.OnDecline = function(self) ZGV.db.char.ignoredguides[self.guide.title]=true self=nil  end

		dialog.guide=self

		dialog:Show()
	end
end

--TODO make sure this isn't redundant a bit inside
function Guide:GetFirstValidStep(start)
	if not self.fully_parsed then return end
	start=start or 1
	local startstep = self:GetStep(start)
	if start~=1 and not startstep then return self:GetFirstValidStep(1) end
	assert(startstep,"GetFirstValidStep: no starting step at 1?? what the hell??")

	-- starting step is good?
	if startstep:AreRequirementsMet() then return startstep end

	-- no? let's go forward...
	local nextvalid = startstep:GetNextValidStep()
	if nextvalid then return nextvalid end

		-- uh-oh! Either we started on an invalid step and there are only invalids to the end... or something went very wrong.
	-- hopefully the FIRST step is good?
	--assert(start>1,"The guide has NO valid steps!?")
	if start~=1 then return self:GetFirstValidStep(1) end  -- restart at 1, maybe that helps

	return self.steps[1]  -- always returns something, or breaks.

	--assert(nextvalid,"The guide has NO valid steps! (after retry at start)")
	--ZGV:Print("No valid steps past "..start.." found. Restarting guide at step 1.")
end

function Guide:GetCurStep()
	return self:GetStep(ZGV.CurrentStepNum)
end

function Guide:GetStep(num_or_label)
	if not self.steps or not self.steplabels then return end
	num_or_label = self.steplabels[num_or_label] or tonumber(num_or_label)
	if type(num_or_label)=="table" then num_or_label=num_or_label[1] end
	--num_or_label = max(1,min(#self.steps, num_or_label))
	return self.steps[num_or_label]
end

function Guide:tostring()
	return self.title_short
end

function Guide:GetParentFolder()
	local path,guide = self.title:match("^(.+)\\(.-)$")
	local _,parent = path:match("^(.+)\\(.-)$")

	return parent,path
end

function Guide:ToggleFavourite()
	if ZGV.db.char.favourites[self.title] then
		ZGV.db.char.favourites[self.title] = nil
	else
		ZGV.db.char.favourites[self.title] = true
	end
end

function Guide:IsFavourite()
	return ZGV.db.char.favourites[self.title]
end

function GuideFuncs:AskReload() --reload after a panda has choosen a faction.
	if not self.ReloadPopup then
		self.ReloadPopup = ZGV.PopupHandler:NewPopup("ZygorReloadPopup","default")

		self.ReloadPopup:SetText(L['static_pandareload'])
		
		function self.ReloadPopup:OnAccept() ReloadUI() end
		function self.ReloadPopup.LayoutFull() end

		self.ReloadPopup.returnMinimizeSettings = function(self)
			return "reload",L['notifcenter_nextguide_title'],L['notifcenter_reload_text']
		end
	end

	self.ReloadPopup:Show()
end

function GuideFuncs:SuggestDungeonGuide(dungeonguide)
	if not ZGV.db.profile.nc_enable or not ZGV.db.profile.nc_dungeon then return end
	local mapid = dungeonguide.mapid

	ZGV:Debug("Suggesting guide %s for dungeon %s",dungeonguide.title,ZGV.GetMapNameByID(mapid))

	if ZGV.CurrentGuide and ZGV.CurrentGuide.type~="DUNGEON" then -- to avoid guides overwriters when player chains dungeons without leaving them (lfg/lfr spam)
		ZGV.db.char.PreDungeonGuide = ZGV.CurrentGuide.title
	end

	local dungeonguides = {}
	for i,dungeonguide in ipairs(ZGV.registeredguides) do
	    if dungeonguide.mapid == mapid then
		table.insert(dungeonguides,dungeonguide)
	    end
	end

	if ZGV.db.profile.zgvhideindungeons and not ZGV.Frame:IsVisible() then
		return
	else
		local guidecount = table.getn(dungeonguides)
		if table.getn(dungeonguides) == 1 then
			local title = string.format("%s Dungeon guide available.",dungeonguide.title_short)
			if ZGV.db.profile.nc_dungeon then ZGV.NotificationCenter:AddEntry("dungeon",title,"View dungeon guide.",{cleartype=true,guide=dungeonguide.title}) end
		elseif table.getn(dungeonguides) > 1 then

			GuideFuncs.MultiDungeon= {}

			for i, dungeonguide in ipairs(dungeonguides) do
				table.insert(GuideFuncs.MultiDungeon,{"list", text=dungeonguides[i].title_short, fontsize = 10, size = "S", onclick=function() ZGV.Tabs:LoadGuideToTab(dungeonguides[i].title) GuideFuncs.MultiDungeonPopup:Hide() end })
			end

			GuideFuncs.MultiDungeonRender = ZGV.Visuals:Render(GuideFuncs.MultiDungeon,290)
			local title = string.format("%s Dungeon guides available.",dungeonguide.title_short)
			if ZGV.db.profile.nc_dungeon then ZGV.NotificationCenter:AddEntry("multidungeon",title,"View dungeon guide.",{cleartype=true,nctext=dungeonguides[1].title_short,object=GuideFuncs.MultiDungeonRender}) end
		end
	end
end

function GuideFuncs:CreateDungeonPopup(object,title)
	if not self.MultiDungeonPopup then
		self.MultiDungeonPopup = ZGV.PopupHandler:NewPopup("DungeonGuideSelect","default")
	end

	local dialog = self.MultiDungeonPopup
	dialog.declinebutton:Hide()
	dialog.acceptbutton:Hide()
	dialog.logo:Show()
	dialog:SetText("Choose the guide you want to load","")
	dialog.AdjustSize = function(self)
		dialog:SetHeight(object:GetHeight() + 45)
		dialog:SetWidth(object:GetWidth() + 20)
	end
	dialog.returnMinimizeSettings = function(self)
		local text = string.format("%s Dungeon guides available.",title)
		return "multidungeon",text,"Dungeon guides available",{object=object,nctext=title}
	end
	
	object:SetParent(dialog)
	object:SetPoint("TOPLEFT",dialog,6,-35)
	object:Show()
	dialog:Show()
	
end

function GuideFuncs:SuggestPreviousGuide(prevguide)
	if not ( ZGV.db.profile.n_popup_enable and ZGV.db.profile.n_popup_guides and ZGV.db.profile.n_popup_dungeon and ZGV.Frame:IsVisible()) then return end

	if not ZGV.db.char.PreDungeonGuide then return end

	local tab = ZGV.Tabs:DoesTabExist(ZGV.db.char.PreDungeonGuide)
	if tab then
		ZGV:Debug("Returning to previous guide after dungeon")
		tab:ActivateGuide()
		ZGV.db.char.PreDungeonGuide=nil
	end

	--[[	
	ZGV:Debug("Suggesting previous guide after dungeon")

	if not self.DungPrevPopup then
		self.DungPrevPopup = ZGV.PopupHandler:NewPopup("ZygorDungeonPopup","dungeon")

		self.DungPrevPopup.OnAccept = function(self)
			ZGV:SetGuide(ZGV.db.profile.previousguide.title,ZGV.db.profile.previousguide.type)
			table.wipe(ZGV.db.profile.previousguide)
		end

		self.DungPrevPopup.OnDecline = function(self) table.wipe(ZGV.db.profile.previousguide) end

		CHAIN(self.DungPrevPopup.declinebutton)
			:HookScript("OnEnter",function(self) CHAIN(GameTooltip):SetOwner(GuideFuncs.DungPrevPopup,"ANCHOR_BOTTOM") :SetText(L['guide_dungpop_tip']) :Show() end)
			:HookScript("OnLeave",function(self) GameTooltip:Hide() end)

		self.DungPrevPopup.returnMinimizeSettings = function(self)
			local notifcationText = L['notifcenter_previous_text']:format(ZGV.GuideMenu.STATUS_COLORS[self.guide:GetStatus()].code,self.guide.title_short)
			local tooltipText = L['notifcenter_gen_popup_tooltip']

			return notifcationText,L['notifcenter_previous_title'],tooltipText,nil,nil,nil,nil,OnOpen,{guide=self.guide}
		end
	end

	for i,guide in ipairs(ZGV.registeredguides) do
		if guide.title == ZGV.db.profile.previousguide.title then
			prevguide = guide
			break
		end
	end

	self.DungPrevPopup:SetText(L['notifcenter_previous_text']:format(prevguide.title_short))
	self.DungPrevPopup.guide=prevguide

	self.DungPrevPopup:Show()
	--]]
end

function GuideFuncs:CheckIfEvent()
	local iname = GetInstanceInfo()
	local isInHoliday

	for i=1,3000 do
		local name, _, _, _, _, _, _, _, _, _, _, _, _, _, isHoliday = GetLFGDungeonInfo(i)
		if iname == name then
			isInHoliday = isHoliday
		end
	end

	if isInHoliday then return true end
end

function GuideFuncs:IsDungeon()
	if not ZGV.guidesloaded then ZGV:ScheduleTimer(function() GuideFuncs:IsDungeon() end,10.0) return end -- Wait for guides to load before we scan them.

	local inInstance, instanceType = IsInInstance()

	if not inInstance or (instanceType~="party" and instanceType~="raid") then
		GuideFuncs:SuggestPreviousGuide()
		return 
	end

	if GuideFuncs:CheckIfEvent() then return end

	local map = ZGV.CurrentMapID or ZGV.GetCurrentMapID()
	local dung = ZGV.db.profile.suggestiondungeonnum[map]
	local day=date():gsub("%s.*","") --Returns a string with date in 00/00/00 format.
	local time=GetTime()

	local found_guide
	for i,guide in ipairs(ZGV.registeredguides) do
		if guide.type == "DUNGEONS" and guide.mapid and guide.mapid == map and
		(not guide.dungeondifficulty or guide.dungeondifficulty==GetDungeonDifficultyID()) then
			local tab = ZGV.Tabs:DoesTabExist(guide.title)
			if tab then  --If they already have the guide loaded.
				if ZGV.CurrentGuide.title~=guide.title then 
					ZGV.db.char.PreDungeonGuide = ZGV.CurrentGuide.title
				end				
				tab:ActivateGuide()
				return
			end

			found_guide = guide
			break
		end
	end


	if found_guide and (not dung or --have not been to this dungeon yet.
		dung.allow and (dung.lastdate~=day or (time-dung.lasttime)>3600)) then--Is it the same day and been more than an hour?
		GuideFuncs:SuggestDungeonGuide(found_guide)
	end
end

function GuideFuncs:MonkQuest(level)
	if not ZGV.db.profile.nc_enable or not ZGV.db.profile.nc_monk then return end

	local monkguide;

	for i,guide in ipairs(ZGV.registeredguides) do -- scan for the monk quest
		if guide.monkquest and guide.monkquest == level then
			if ZGV.CurrentGuide and ZGV.CurrentGuide.title==guide.title then return end --If they already have the guide loaded.
			monkguide=guide
			break
		end
	end

	if not monkguide then return end

	ZGV:Debug("Suggesting guide %s for monks",monkguide.title)

	if ZGV.db.profile.nc_monk then ZGV.NotificationCenter:AddEntry("monkdaily","Monk Daily quests have reset.","View the Monk Daily guide.",{cleartype=true,guide=monkguide.title}) end
	ZGV.db.profile.lastmonkdaily=date():gsub("%s.*","") --Returns a string with date in 00/00/00 format.
end

function GuideFuncs:LearnMountGuideSuggestion(level)
	--if not (ZGV.db.profile.n_popup_enable and ZGV.db.profile.n_popup_guides and ZGV.Frame:IsVisible()) then return end

	local mountGuide = ZGV:GetGuideByTitle("Zygor's Pets & Mounts Guide\\Mount Training") --mmmm nice and hard coded.

	if not mountGuide then ZGV:Debug("No mount guide?!?") return end

	ZGV:Debug("Suggesting guide %s",mountGuide.title)

	local levels = {
		[10] = "Apprentice",
		[20] = "Journeyman",
		[30] = "Expert",
		[40] = "Master"
	}
	
	if ZGV.db.profile.nc_riding then ZGV.NotificationCenter:AddEntry("riding",L['nc_loadmountguide']:format(levels[level]),"Click to run now",{cleartype=true,guide=mountGuide.title}) end
end

function GuideFuncs:IsValid(guide,step,from,special,shared,prevguide)
	if type(guide)=="string" then
		guide = ZGV:GetGuideByTitle(guide)
	end
	if not guide then return false end
	local status,msg = guide:GetStatus()

	if ZGV.db.char.scoredguides[guide.title] == "declined" and status ~= "INVALID" then
		ZGV.db.char.scoredguides[guide.title] = nil
	end

	if status=="INVALID" and not ZGV.db.char.goodbadguides[guide.title] then

	if ZGV.CurrentGuide and ZGV.CurrentStep.score then
		if ZGV.db.char.scoredguides[ZGV.CurrentGuide.next] == -2 then return end
	end

		if ZGV.CurrentGuide and ZGV.CurrentStep.score then
			if ZGV.BugReport.GuideRating.NoRatingFrame then
				ZGV.BugReport.GuideRating.NoRatingFrame:Show()
			else
				ZGV.BugReport.GuideRating:CreateAltFrame()
			end
		end

		self.BadGuidePopup = self.BadGuidePopup or ZGV.PopupHandler:NewPopup("ZygorBadPopup","default")

		self.BadGuidePopup.OnAccept = function(self)
			ZGV.db.char.goodbadguides[guide.title]=true
			if ZGV.BugReport.GuideRating.NoRatingFrame and  ZGV.BugReport.GuideRating.NoRatingFrame:IsVisible() then
				 ZGV.BugReport.GuideRating.NoRatingFrame:Hide()
			end

			if from=="tabs" then
				ZGV.Tabs:LoadGuideToTab(guide.title,step,special,shared)
			elseif from=="guidemenu" then
				ZGV.GuideMenu:ActivateGuide(guide)
			elseif from == "rating" then
				ZGV.Tabs:LoadGuideToTab(guide,nil,nil,nil,prevguide)
			else
				ZGV:SetGuide(guide)
			end
		end

		self.BadGuidePopup.OnDecline = function(self)
			if from == "rating" then
				ZGV.db.char.scoredguides[guide.title] = "declined"
				if not ZGV.BugReport.GuideRating.NoRatingFrame and (not ZGV.BugReport.GuideRating.ZygorPopupOn or not ZGV.BugReport.GuideRating.ZygorPopupOn:IsVisible()) then
					ZGV.BugReport.GuideRating:CreateAltFrame()
				elseif not ZGV.BugReport.GuideRating.ZygorPopupOn or not ZGV.BugReport.GuideRating.ZygorPopupOn:IsVisible() then
					ZGV.BugReport.GuideRating.NoRatingFrame:Show()
				end
			end
		end

		self.BadGuidePopup.noMinimize = 1 --Can not minimize this one

		self.BadGuidePopup:SetText(L['static_badguide']:format(guide.title_short,msg or ""))
		self.BadGuidePopup:Show()
		return false
	end

	return true
end

function GuideFuncs:ToggleViewer()
	local inInstance, instanceType = IsInInstance()

	if inInstance and ZGV.db.profile.zgvhideindungeons then
		if ZGV.Frame:IsVisible() then
			ZGV.NotificationCenter:AddEntry("options","Guide Viewer automatically hidden in dungeon.","Click to change this behavior in settings.",{cleartype=true})
			ZGV:ToggleFrame()
		end
	end
	if not inInstance and ZGV.db.profile.zgvhideindungeons and ZGV.db.profile.showafterdungeons and not ZGV.Frame:IsVisible() then ZGV:ToggleFrame() end
end

function GuideFuncs.OnEvent(self,event,arg1,...)
	if event=="NEUTRAL_FACTION_SELECT_RESULT" then
		GuideFuncs:AskReload() --Panda only
	elseif event=="LOADING_SCREEN_DISABLED" then --Not on zone change because reloading in a dungeon doesn't fire Zone Change.
		GuideFuncs:ToggleViewer()
		--Map doesn't update right away, least it didn't on PEW. LSD might, have not tested.
		ZGV:ScheduleTimer(function() GuideFuncs:IsDungeon() end,3.0) --Let them get in and then ask.
	elseif event == "PLAYER_XP_UPDATE" then
		if select(3,UnitClass("player"))~=10 then return end --Monks only!
		if UnitLevel("player")>=90 then return end -- outleveled the buff

		if IsQuestFlaggedCompleted(31834) and --Second quest done.
		 not IsQuestFlaggedCompleted(31840) and --Daily is available for today?
		 ZGV.db.profile.lastmonkdaily~=date():gsub("%s.*","") then --Don't suggest if it was suggested today already.
			GuideFuncs:MonkQuest(1) -- 1 is the number for the daily
		end
	elseif event == "PLAYER_LEVEL_UP" then
		if select(3,UnitClass("player"))==10 and arg1%5==0 and arg1~=5 and arg1<36 then --Are we a monk? Did we just hit level 10,15..35. Level 5 is bad
			GuideFuncs:MonkQuest(arg1)
		end

		if (arg1<41 and arg1%10==0) then -- Mount Levels: 10,20,30,40
			if arg1==10 then
				if ZGV.InPhase("exilesreach") then return end -- if player started in exiles reach, they will get the mount when they leave isle, don't show popup
				if ZGV:RaceClassMatch("WARLOCK") or ZGV:RaceClassMatch("PALADIN") or ZGV:RaceClassMatch("WORGEN") then return end -- they get basic riding from class or racial skills
			end
			GuideFuncs:LearnMountGuideSuggestion(arg1)
		end
	end
end

function GuideFuncs:RegisterEvents()
	ZGV:AddEventHandler("PLAYER_XP_UPDATE",GuideFuncs.OnEvent)
	ZGV:AddEventHandler("PLAYER_LEVEL_UP",GuideFuncs.OnEvent)
	ZGV:AddEventHandler("LOADING_SCREEN_DISABLED",GuideFuncs.OnEvent)
	if ZGV.IsRetail then ZGV:AddEventHandler("NEUTRAL_FACTION_SELECT_RESULT",GuideFuncs.OnEvent) end
end

function GuideFuncs:IsGuideBanned(title)
	do return false end  -- temporarily remove guide disabling; sinus 2014-01-13 

	if title:match("^PROFESSION") then return true end
	
	if title:match("^DAILIES") then return true end
	
	if title:match("^EVENT") then return true end
	
	if title:match("^LEVELING.*Elwynn") then return false end
	if title:match("^LEVELING.*Dun Morogh") then return false end
	if title:match("^LEVELING.*Teldrassil") then return false end
	if title:match("^LEVELING.*Azuremyst") then return false end
	if title:match("^LEVELING.*Worgen") then return false end
	if title:match("^LEVELING.*Tirisfal") then return false end
	if title:match("^LEVELING.*Durotar") then return false end
	if title:match("^LEVELING.*Mulgore") then return false end
	if title:match("^LEVELING.*Eversong") then return false end
	if title:match("^LEVELING.*Goblin") then return false end
	if title:match("^LEVELING.*Starter") then return false end
	if title:match("^LEVELING.*Wandering Isle") then return false end
	if title:match("^LEVELING.*Death Knight") then return false end
	if title:match("^LEVELING") then return true end
	
	if title:match("^LOREMASTER") then return true end
	
	if title:match("^ACHI.*Celestial Tournament") then return false end
	if title:match("^ACHI.*Celestial Family") then return false end
	if title:match("^ACHI.*Emissary of Ordos") then return false end
	if title:match("^ACHI.*Crazy for Cats") then return false end
	if title:match("^ACHI.*Exploration.*Pandaria.*Timeless.*") then return false end
	if title:match("^ACHI.*Exploration.*Pandaria.*Eyes on the Ground") then return false end
	if title:match("^ACHI.*Exploration.*Pandaria.*Rolo's") then return false end
	if title:match("^ACHI.*Exploration.*Pandaria.*Zarhym") then return false end
	if title:match("^ACHI.*Quest.*Pandaria.*Chapter.*") then return false end
	if title:match("^ACHI.*") then return true end
	
	if title:match("^PET.*Thundering Onyx") then return false end
	if title:match("^PET.*Gu'chi") then return false end
	if title:match("^PET.*Jademist Dancer") then return false end
	if title:match("^PET.*Ashwing Moth") then return false end
	if title:match("^PET.*Azure Crane") then return false end
	if title:match("^PET") then return true end

	if title:match("^TITLES") then return true end

	if title:match("^REPUTATIONS") then return true end
	
	return false
end

tinsert(ZGV.startups,{"Guide: registering events",function(self)
	ZGV.GuideFuncs:RegisterEvents()
	ZGV.Licence:VerifyKeyIntegrity(ZGV.registered_guide_key)
end})

--- TYPES

---@alias GuideType 'LEVELING'|'ACHIEVEMENTS'|'DAILIES'|'DUNGEONS'|'EVENTS'|'GOLD'|'PETSMOUNTS'|'PROFESSIONS'|'REPUTATIONS'|'TITLES'|'TEST'

---@class GuideHeader
---@field author string
---@field description string
---@field condition_suggested function?
---@field condition_valid function?
---@field condition_valid_msg function?
---@field condition_end function?
---@field startlevel number?
---@field next string|function?
---@field id string?
---@field hideif function
---@field only_hardcore boolean
---@field hardcore boolean

---@class Guide
---@field title string
---@field title_short string
---@field type GuideType
---@field headerdata GuideHeader
---@field num integer
---@field parsed? boolean
---@field fully_parsed? boolean
---@field filepath string
---@field guidepath string

