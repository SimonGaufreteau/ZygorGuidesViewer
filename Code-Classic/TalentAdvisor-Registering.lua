local _,ZGV=...
local ZTA=ZGV.ZTA
if not ZTA then return end



function ZTA:RegisterBuild (class,title,statweights,build,glyphs,options)
	local build = {title=title,build=build,glyphs=glyphs,statweights=statweights,buildKey=class.." "..title}
	local pettype = class:match("^PET (.+)")
	if pettype then build.pettype=pettype:upper() else build.class=class end

	if options then
		build.suggested = options.suggested
		build.tooltip = options.tooltip
	end
	build.displayname = title..(build.suggested and " |cfffe6100[Zygor Suggested]|r" or "")

	table.insert(self.registeredBuilds,build)
end

-- remove class-specific builds or any pets for non-hunters
function ZTA:PruneRegisteredBuilds()
	--self:Print("Pruning!")
	if self.registeredBuildsPruned then return nil end

	local _,myclass = UnitClass("player")
	if not myclass then return end


	local pruned,total=0,0
	for i=#self.registeredBuilds,1,-1 do
		local build = self.registeredBuilds[i]
		if (build.class and build.class~=myclass)
		or (build.title:find("debug") and not self.db.profile.debug)
		then
			table.remove(self.registeredBuilds,i)
			pruned=pruned+1
		end
		total=total+1
	end
	
	self:Debug("Pruned builds other than |cffffffff%s|r, %d/%d gone",myclass,pruned,total)

	for class,talents in pairs(self.TalentsToNumbers) do
		if class~=myclass then
			self.TalentsToNumbers[class]=nil
		end
	end

	self.registeredBuildsPruned = true
end

function ZTA:ParseBlizzardTalents(bliz,pet)
	self:Debug("Parsing Blizzard build")
	local build = {}

	for tab,talent in self.talentpairs(false,pet) do
		if #bliz==0 then break end
		local rank = tonumber(strsub(bliz,1,1))
		bliz = strsub(bliz,2)
		for i=1,rank do table.insert(build,{tab,talent}) end
	end

	return build
end

function ZTA:ParseTableTalents(text)
	UIParentLoadAddOn("Blizzard_TalentUI")
	self:Debug("Parsing table build")

	local _,class = UnitClass("player")

	local build = {}

	-- Create a spell-to-talenttab lookup table, to be able to check if player/pet.
	-- Serves as a "DoesPlayerHaveTalent(id)".

	local lookup = {}
	local name,link,id
	local count=0
	for tab,talent in self.talentpairs(false) do
		--[[
		link = GetTalentLink(tab,talent,false,pet)
		if link then
			id = tonumber(link:match("talent:(%d+)"))
			lookup[id]={tab,talent}
			count=count+1
		end
		--]]
		local name,texture,_,_,_,_,_,_ = GetTalentInfo(tab,talent)
		if name then
			lookup[texture]={tab,talent}
			count=count+1
		end

		--[[
		name = GetTalentInfo(tab,talent,false,pet)
		if name then
			link = GetTalentLink(tab,talent,false,pet)
			id = tonumber(link:match("talent:(%d+)"))
			--lookup[name]={tab,talent}
			lookup[id]={tab,talent}
			count=count+1
		end
		]]
	end

	if count==0 then
		return nil,"Unable to access talent info, wtf"
	else
		self:Debug(count.." talents cached for lookup")
	end

	-- Verify if player/pet has all the named talents.
	-- To do that, look up spell IDs gathered above and check if they have them or not.

	for i=1,#text do
		--if TalentsToNumbers[text[i]]
		local a,b = string.match(text[i],"(.+)|(.+)")
		if not a then a=text[i] end
		a=self.TalentsToNumbers[class][a]
		if b then a=self.TalentsToNumbers[class][a] end
		a=a or b
		local tree,index = strsplit(",",a or "")  tree=tonumber(tree)  index=tonumber(index)

		if tree and index then
			table.insert(build,{tree,index})
		else
			return nil,("Unknown talent(s): '"..text[i].."' at line "..i..".")
		end
	end
	return build
end

function ZTA:ParseLines(text,multi)
	local table={}
	local index=1
	local st,en
	text = text .. "\n"
	local count
	local spec
	while (index<#text) do
		st,en,line=string.find(text,"(.-)\n",index)
		if not en then break end
		index = en + 1
		line = line:gsub("//.*$",""):gsub("%-%-.*$","")  -- comments away
		line = line:gsub("^[%s	]+",""):gsub("[%s	]+$","")  -- whitespace away
		line = line:gsub("||","|")
		line = line:gsub("/[0-9]+","")  -- /3 are just fluff, remove

		if line:find("spec=") then
			spec=line:match("Spec=(.+)")
		else
			if multi then
				local co,ln = line:match("([1-9]+)[%s%*x]+(.+)")
				if co then
					count=co
					line=ln
				else
					count=1
				end
			else
				count=1
			end
			if (#line>0) then
				for i=1,count do tinsert(table,line) end
			end
		end
	end
	return table,spec
end

function ZTA:ParseTextTalents(text,pet)
	local table,spec = self:ParseLines(text,true)
	return self:ParseTableTalents(table,pet,spec)
end

function ZTA:DumpBuild(num)
	local s = ""
	for i=1,#self.registeredBuilds[num].build do
		local tab,talent = unpack(self.registeredBuilds[num].build[i])
		s = s .. ((#s>0) and "," or "") .. "{"..tab..","..talent.."}"
	end
	self:Print("  ZygorTalentAdvisor:RegisterBuild(\""..(self.registeredBuilds[num].class or "PET "..self.registeredBuilds[num].pettype).."\",\""..self.registeredBuilds[num].title.."\",{"..s.."})")
end


function ZTA:DumpTalentSpells(pet)  -- builds TalentsToNumbers as above.  
	--assert(ZGV,"ZGV required for display.")

	local s = ""
	local _,myclass
	if not pet then _,myclass = UnitClass("player") else _,myclass = GetTalentTabInfo(1,false,pet) end
	s = "	[\""..myclass.."\"]={\n"
	if pet then s = s .. "		[\"pet\"]=1,\n" end
	for tab=1,GetNumTalentTabs(false,pet) do
		local id,tabname = GetTalentTabInfo(tab,false,pet)
		--s = s .. "	[\""..tabname.."\"]={\n"
		for talent=1,GetNumTalents(tab,false,pet) do
			local name,texture = GetTalentInfo(tab,talent,false,pet)
			local link = GetTalentLink and GetTalentLink(tab,talent,false,pet)
			if link then
				local _,_,id = link:find("talent:([0-9]+)")
				s = s .. "		[\""..name.."\"]="..id..",\n"
			else
				-- shit, classic, use textures..?
				--s = s .. "		-- no link for "..tab..","..talent.."\n"
				s = s .. "		[\""..name.."\"]="..texture..",\n"
			end
		end
		if tab<GetNumTalentTabs(false,pet) then s = s .. "\n" end
	end
	s = s .. "	},\n"
	if ZGV and ZGV.ShowDump then
		ZGV:ShowDump(s,"Talent data:")
	else
		print(s)
	end
	
end