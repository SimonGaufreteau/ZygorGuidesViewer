--[[
Name: LibTaxi
Revision: $Rev: 1 $
Author(s): sinus (sinus@sinpi.net)
Description: A library recording all player's currently known/unknown taxi routes. Currently relies on Zygor Guides Viewer for some routines, and not ready for standalone usage.
Dependencies: None
License: Free for non-commercial use, except for Zygor Guides.
]]

local addonname,addon = ...
-- #AUTODOC_NAMESPACE prototype

-- GLOBAL Spoo
local ZGV,LibRover

local hooksecurefunc, UnitLevel, IsControlKeyDown, GetTime, CreateFrame, IsShiftKeyDown, GetMinimapZoneText, UnitGUID
    = hooksecurefunc, UnitLevel, IsControlKeyDown, GetTime, CreateFrame, IsShiftKeyDown, GetMinimapZoneText, UnitGUID

local TaxiGetNodeSlot, NumTaxiNodes, TaxiNodeGetType, GetNumRoutes, TaxiNodeName, TaxiNodePosition, TaxiNodeCost
    = TaxiGetNodeSlot, NumTaxiNodes, TaxiNodeGetType, GetNumRoutes, TaxiNodeName, TaxiNodePosition, TaxiNodeCost

--GLOBAL TaxiFrame,FlightMapFrame


local LIB_MAJOR, LIB_MINOR = "LibTaxi-1.0", 1

---@class LibTaxi
local Lib = LibStub:NewLibrary(LIB_MAJOR, LIB_MINOR)
if not Lib then return end

do
	Lib.master = { }
	Lib.saved_tables = { }
	Lib.lastRoutesFromCurrent = { }

	Lib.IsClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC
	Lib.IsClassicTBC = WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC
	Lib.IsClassicWOTLK = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
	Lib.IsClassicCATA = WOW_PROJECT_ID == WOW_PROJECT_CATACLYSM_CLASSIC
	Lib.IsClassicMOP = WOW_PROJECT_ID == WOW_PROJECT_MISTS_CLASSIC
	Lib.IsRetail = WOW_PROJECT_ID == WOW_PROJECT_MAINLINE


	local ZONE_ARGUS_KROKUUN = 830
	local ZONE_ARGUS_MACAREE = 882
	local ZONE_ARGUS_ANTORAN = 885
	local ZONE_ARGUS = 994
	local ENUM_CONTINENT_KHAZALGAR = 2274
	local FACTION_SHATARISKYGUARD = 1031

	local ENUM_ACHIEVEMENT_KHAZALGARFLIGHTMASTER = 40430

	-- return three-way node known status.
	-- true = known, obviously.  false = there's a marker indicating the continent is known, but the node is not.  nil = entirely unknown if known :P
	Lib.known_by_continent_mt = { __index=function(t,i)
			if rawget(t,i) then
				return true
			else
				local c = Lib.path2cont[i]
				if rawget(t,c) then
					return false
				else
					return nil
				end
			end
		end
	}

	Lib.path2cont = {}

	---@type {[number]:{[string]:TaxiNode[]}}
	Lib.taxipoints = Lib.taxipoints or addon.LibTaxiData and addon.LibTaxiData.taxipoints

	---@type {[number]:{tag:string,nodeID:number,name:string,comment:string?,faction:string?,taxioperator:TaxiOperator?,neighbors:{[number]:number}}[]}
	Lib.flightcost = Lib.flightcost or addon.LibTaxiData and addon.LibTaxiData.flightcost

	addon.LibTaxiData = nil

	--Lib.TaxiNames_Local = nil
	--Lib.TaxiNames_English = nil

	-- Initialize localization. All taxis are stored as ENGLISH - lookups need pre-translation.
		if Lib.TaxiNames_Local then
			for en,lo in pairs(Lib.TaxiNames_Local) do if lo==1 then Lib.TaxiNames_Local[en]=en end end

			Lib.TaxiNames_English = {}
			for en,lo in pairs(Lib.TaxiNames_Local) do
				Lib.TaxiNames_English[lo]=en
			end

			local mt = { __index = function(t,k)  local v=rawget(t,k)  if not v then print("|cffff4400Taxi |cffff8800"..k.."|r not translated to "..GetLocale()..", please report this to Zygor") return k elseif v==true then return k else return v end  end }
			setmetatable(Lib.TaxiNames_Local,mt)
			setmetatable(Lib.TaxiNames_English,mt)
		else
			local loc_stub = {}
			setmetatable(loc_stub,{ __index = function(t,k)  return k  end } )
			Lib.TaxiNames_Local = loc_stub
			Lib.TaxiNames_English = loc_stub
		end


	local minimap_exceptions = {
		["Trade District"] = "Stormwind",
		["The Great Forge"] = "Ironforge",
		["Terrace of Light"] = "Shattrath City",
		["The Stair of Destiny"] = "Hellfire Peninsula, The Dark Portal",
		["Valley of Strength"] = "Orgrimmar"
	}

	---@diagnostic disable-next-line: undefined-field
	local ERR_NEWTAXIPATH=_G.ERR_NEWTAXIPATH


	local function IterateCZNN(T)
		for c,cont in pairs(T) do
			for z,zone in pairs(cont) do
				for n,node in pairs(zone) do
					coroutine.yield(c,z,n,node)
				end
			end
		end
	end

	local function is_enemy(f1,f2)
		return (f1=="A" and f2=="H") or (f1=="H" and f2=="A")
	end
	Lib.is_enemy=is_enemy


	Lib.errors = {}

	local initialized_continents={}
	function Lib:Startup(newsave)
		ZGV = addon
		LibRover = ZGV.LibRover

		Lib.frame = CreateFrame("Frame", "LibTaxiFrame")
		Lib.frame:RegisterEvent("TAXIMAP_OPENED")
		Lib.frame:RegisterEvent("UI_INFO_MESSAGE")
		Lib.frame:RegisterEvent("UI_ERROR_MESSAGE")
		Lib.frame:RegisterEvent("ADDON_LOADED")
		--Lib.frame:RegisterEvent("UPDATE_FACTION")
		Lib.frame:RegisterEvent("UNIT_FLAGS")
		Lib.frame:RegisterEvent("QUEST_REMOVED")
		if Lib.IsRetail then Lib.frame:RegisterEvent("TAXI_NODE_STATUS_CHANGED") end

		if C_EventUtils.IsEventValid("DISPLAY_EVENT_TOASTS") then Lib.frame:RegisterEvent("DISPLAY_EVENT_TOASTS") end
		if C_EventUtils.IsEventValid("DISPLAY_EVENT_TOAST_LINK") then Lib.frame:RegisterEvent("DISPLAY_EVENT_TOAST_LINK") end

		Lib.frame:SetScript("OnEvent", Lib.OnEvent)

		Lib.MapIDsByName = LibRover.data.MapIDsByName or ZGV.MapIDsByName

		Lib.master=newsave

		Lib:InitializeTaxis()

		setmetatable(newsave,Lib.known_by_continent_mt)
		table.insert(Lib.saved_tables,newsave)

		Lib:CacheTaxiPoints()
		Lib:MergeData()
		Lib:MarkKnownTaxis()
		Lib:ImportTaxiDataFromGame()

		Lib:HookMapChange()
		Lib:HookTaxiAborts()
		Lib:HookTakeTaxiNode()

		Lib:ImportTaxiTimesFromSV()

		Lib.ZGLOGO = "|T"..ZGV.DIR.."\\Skins\\zglogo_single:8:8|t"

		self:Debug("Startup complete.")
	end

	-- two taxi nodes are switching during daily resets
	-- taxi map automatically refreshes knowledge when it is open, but we can also detect them by checking nodes on given map
	local antoran_rotating_nodes = {
		[1993] = true, -- The Veiled Den, Antoran Wastes
		[1992] = true, -- Light's Purchase, Antoran Wastes
	}
	function Lib:UpdateAntoranTaxis()
		-- clear 
		for nodeID in pairs(antoran_rotating_nodes) do
			Lib.master[nodeID]=false
		end
		
		local nodes = C_TaxiMap.GetTaxiNodesForMap(ZONE_ARGUS_ANTORAN)
		-- set
		for _,node in pairs(nodes) do
			if antoran_rotating_nodes[node.nodeID] then
				Lib.master[node.nodeID]=true
			end
		end
	end

	local dragonisles_extra = {2175,2241}
	function Lib:GetMapContinent(mapID)
		local cont = ZGV.GetMapContinent(mapID)
		--if cont==ZONE_ARGUS_KROKUUN or cont==ZONE_ARGUS_MACAREE or cont==ZONE_ARGUS_ANTORAN then cont=ZONE_ARGUS end  -- Argus zones need to have a common continent (not so much for ants!).
		local cont_scan = cont
		if cont==113 then cont_scan=988 end -- wotlk classic needs to be scanned via separate id
		if Lib.IsClassicMOP and cont==101 then cont_scan=102 end -- wotlk classic needs to be scanned via separate id
		if cont==905 then cont_scan=994 end -- argus needs to be scanned via separate id
		if mapID==2346 then cont_scan=2374 end -- undermine has own taxi map
		local extracont
		if cont==1978 then extracont=dragonisles_extra end -- dragonflight needs to have subcontinent scanned
		return cont,cont_scan,extracont
	end		

	function Lib:GetCurrentMapContinent()
		return Lib:GetMapContinent(C_Map.GetBestMapForUnit("player"))
	end

	---@param node1 number
	---@param node2 number
	function Lib:GetTaxiTripTime(node1,node2)
		local node1c=Lib.fc_by_nodeID[node1]
		local node2c=Lib.fc_by_nodeID[node2]

		if not node1c or not node2c then return false,false,"nodes missing" end
		local time = node1c.neighbors and node1c.neighbors[node2]
		if time and time>0 then return time,true end

		local node1n=Lib:FindTaxiByNodeID(node1)  if not node1n then return false,false,"npc 1 missing" end
		local node2n=Lib:FindTaxiByNodeID(node2)  if not node2n then return false,false,"npc 2 missing" end
		local dist = ZGV.MapCoords.Mdist(node1n.m,node1n.x,node1n.y,node2n.m,node2n.x,node2n.y) or 0
		local est = dist * 1.2 / (7*4.5)
		return est,false
	end

	function Lib:PlayerHasKhazAlgarFlightMasterAchievement()
		return select(4,GetAchievementInfo(ENUM_ACHIEVEMENT_KHAZALGARFLIGHTMASTER))
	end


	function Lib:AbortTaxiTiming()
		self:Debug("Aborting taxi timing.")
		Lib.LastTaxi=nil
	end

	local old_ontaxi
	function Lib:PlayerOnOffTaxi(ontaxi)
		if ontaxi == old_ontaxi then return end
		old_ontaxi=ontaxi
		local taxis = LibRover.TaxiWhistlePredictor and LibRover.TaxiWhistlePredictor:FindNearestTaxis()
		if ontaxi then
			if Lib.LastTaxi and (not taxis or not taxis[1] or taxis[1][2]>=50) then 
				local lastnodeid = Lib.LastTaxi.route and Lib.LastTaxi.route[1] and Lib.LastTaxi.route[1].nodeID
				if lastnodeid then
					taxis={{Lib:FindTaxiByNodeID(lastnodeid),1}} 
				end
			end
			if taxis and taxis[1] and taxis[1][1] and taxis[1][2]<50 then
				Lib.traveltime_dep=taxis[1][1]
				Lib.traveltime_time=GetTime()
				Lib:Debug(("Departed from |cff00ff00%s|r to |cff00ff00%s|r, counting taxi trip time."):format(Lib.traveltime_dep.name,Lib.LastTaxi and Lib.LastTaxi.name or "?"))
			else
				Lib:Debug("No idea where we departed from, but counting taxi trip time.")
				Lib.traveltime_time=GetTime()
			end
		else
			if ZGV.DEV or ZGV.db.profile.flash_on_taxi_arrival then FlashClientIcon() end
			if not Lib.traveltime_time then return end
			local triptime = ceil(GetTime()-Lib.traveltime_time)
			if Lib.LastTaxi and (not taxis or not taxis[1] or taxis[1][2]>=50) then taxis={{Lib.LastTaxi.node,1}} end
			if taxis and taxis[1] and taxis[1][2]<50 then
				if not Lib.traveltime_dep then Lib:Debug("Still no idea where we departed from, but it took "..triptime.." s.") return end
				local node_dep,node_arr = Lib.traveltime_dep,taxis[1][1]
				if not node_dep or not node_arr then Lib:Debug("Still no idea where we departed from, but it took "..triptime.." s.") return end

				local fc_array = Lib.fc_by_nodeID
				local dep_ident = node_dep.taxinodeID
				local arr_ident = node_arr.taxinodeID

				if not fc_array[dep_ident] or not fc_array[arr_ident] then Lib:Debug("Unknown departure or arrival point! Update taxi data!") return end

				local s = ("DEV: Travel Time from |cff00ff00%s|r to |cff00ff00%s|r = |cffffff00%d|r seconds, "):format(Lib.traveltime_dep.name,taxis[1][1].name,triptime)

				ZGV.db.global.taxitimes = ZGV.db.global.taxitimes or {}

				if not fc_array[dep_ident].neighbors or not fc_array[dep_ident].neighbors[arr_ident] then
					Lib:Debug(s.."but that's not a known direct route.")
					-- still, remember it for harvesting
					ZGV.db.global.taxitimes[dep_ident.."__"..arr_ident]=triptime
					return
				end

				local oldtime,precise = Lib:GetTaxiTripTime(dep_ident,arr_ident)

				if Lib:GetCurrentMapContinent()==ENUM_CONTINENT_KHAZALGAR and Lib:PlayerHasKhazAlgarFlightMasterAchievement() then -- flight time was 25% reduced
					triptime = triptime * 1.3333
				end

				fc_array[dep_ident].neighbors[arr_ident]=triptime
				ZGV.db.global.taxitimes = ZGV.db.global.taxitimes or {}
				ZGV.db.global.taxitimes[dep_ident.."_"..arr_ident]=triptime
				local reversed

				-- assume reverse route -- no, don't
				--if fc_array[arr_ident].neighbors[dep_ident]==0 then
				--	reversed=true
				--	fc_array[arr_ident].neighbors[dep_ident]=triptime
				--	ZGV.db.global.taxitimes[arr_ident.."_"..dep_ident]=triptime
				--end

				if not precise then s = s .. ("estimate was |cffff8800%d|r s. "):format(oldtime)
				elseif abs(oldtime-triptime)>3 then s = s .. ("was |cffff8800%d|r s. "):format(oldtime)
				else s = s .. "but we knew that."  triptime=nil  end
				if reversed then s = s .. "Reverse trip added, too." end

				if triptime then
					fc_array[dep_ident].neighbors[arr_ident]=triptime
					ZGV.db.global.taxitimes[dep_ident.."_"..arr_ident]=triptime
				end

				Lib:Debug(s)
			else
				Lib:Debug("&taxi No idea where we landed, but it took "..triptime)
			end
			Lib.LastTaxi = nil -- clear last taxi, since we are no longer riding it, and already recorded what we neede. leaving it handing can cause issues with hidden taxis down the road
		end
	end

	function Lib.OnEvent(this, event, arg1,arg2)
		if event == "ADDON_LOADED" and arg1==addonname and not Lib.loaded then
			Lib.loaded=true
			Lib.UpdateAntoranTaxis(this)
		elseif event == "TAXIMAP_OPENED" then
			Lib:DEV_ScanCurrentTaxiNPC()
			Lib:DEV_HookZygorButtons()
			
			Lib:HookTaxiMapPins_Delayed() -- need to give FlightMap time to initialize

			Lib:ScanTaxiMap()
			Lib:RecordLastTaxiSlots()
			Lib:CacheRoutesAsNodeIDs()

			if ZGV.DEV then Lib.HooksForFlightMapFrame:DEV_HighlightIncompletePins() end

			if ZGV then ZGV:ShowWaypoints() end -- Force arrow to re-check itself -- Jeremiah
		
		elseif event == "DISPLAY_EVENT_TOASTS" or event=="DISPLAY_EVENT_TOAST_LINK" then -- link comes first, but sometimes toastInfo is not ready yet, so lets use both
			local toastInfo = C_EventToastManager.GetNextToastToDisplay();
			if toastInfo and toastInfo.eventType == Enum.EventToastEventType.FlightpointDiscovered then
				Lib:LearnCurrentTaxi()
				if LibRover then LibRover:UpdateNow("quiet") end
			end
		
		elseif event == "UI_INFO_MESSAGE" then
			if arg2==ERR_NEWTAXIPATH then
				Lib:LearnCurrentTaxi()
				if ZGV and ZGV.LibRover then ZGV.LibRover:UpdateNow("quiet") end -- Try to force update of arrow ~~ Jeremiah
			end
		
		elseif event == "UI_ERROR_MESSAGE" and arg2==ERR_TAXINOPATHS then
			local node = Lib:LearnCurrentTaxi()
			Lib:MarkNeightboursUnknown(node)
			LibRover:UpdateNow()
		
		--elseif event == "UPDATE_FACTION" then --Faction update is not needed anymore.
			--Lib:MarkKnownByLevels() --Only needs to be ran once after the faction's information has been made available at startup
			--Lib.frame:UnregisterEvent("UPDATE_FACTION")
		elseif event=="UNIT_FLAGS" and arg1=="player" and LibRover.ready then
			local ontaxi = UnitOnTaxi("player")
			Lib:PlayerOnOffTaxi(ontaxi)
		
		elseif event=="QUEST_REMOVED" then
			Lib:MarkKnownTaxis() -- maybe a quest-related taxi just became known

		elseif event=="TAXI_NODE_STATUS_CHANGED" then
			Lib:MarkKnownTaxis()
		end
	end

	local function warn(message)
		local _, ret = pcall(error, message, 3)
		geterrorhandler()(ret)
	end

	local enemyfac = "DON'T PRUNE" or (UnitFactionGroup("player")=="Alliance") and "H" or "A"-- TODO: REMOVE
	function Lib:InitializeTaxis()
		for c,cont in pairs(Lib.taxipoints) do
			for z,zone in pairs(cont) do
				z=LibRover:GetMapByNameFloor(z)
				local n=1
				while n<=#zone do
					local node=zone[n] --[[@as LibRoverTaxiNode]]
					if not node then break end
					if node.faction~=enemyfac then
						Lib.path2cont[node.name] = c
						node.m = z
						node.c = Lib:GetMapContinent(z)
						--node.localname = Lib.translation and Lib.translation[node.taxitag]
						--node.level = LibRover and LibRover.data.ZoneContLev[z].level
						n=n+1
					else
						tremove(zone,n)
					end
				end
			end
		end
	end

	-- Get faction info because Andorhal has separate Horde and Alliance flight points with the same name. ~~ Jeremiah
	local playerF
	local factionEnglish = UnitFactionGroup("player")
	if factionEnglish == "Alliance" then
		playerF = "A"
	elseif factionEnglish == "Horde" then
		playerF = "H"
	end

	local aliases={["Stormwind City"]="Stormwind", ["Theramore Isle"]="Theramore"}
	local findtaxi_cache={}
	function Lib:FindTaxi(name,trim)
		if findtaxi_cache[name] then return findtaxi_cache[name] end
	
		if trim and name then name = name:gsub(", .*","") end  -- trim zone names (in european languages, at least)
		name = aliases[name] or name
		for c,z,n,node in ZGV.CoroPairs(Lib.taxipoints,IterateCZNN) do
			if not is_enemy(playerF,node.faction) and ( 
				node.name==name  -- raw name, pretty rare
				or (not node.namestrict and node.name==(type(name)=="string" and name:gsub(", .*","")))  -- node name with zone appended
			)
			then
				findtaxi_cache[name] = node
				return node
			end
		end
	end

	Lib.fc_by_nodeID = {}
	Lib.fcnames_by_nodeID = {}
	-- cache tag->fcost, tag->fname, nodeID->fcost and nodeID->fname mappings
	function Lib:CacheTaxiNodeIDs()
		self:Debug("Caching taxi node IDs... playerF=%s",playerF)  local t=debugprofilestop()
		-- order flightcosts by tag for quick retrieval
		for cont,conttaxis in pairs(Lib.flightcost) do
			for ti,taxi in pairs(conttaxis) do
				if taxi.nodeID then
					if not is_enemy(taxi.faction,playerF) then
						Lib.fc_by_nodeID[taxi.nodeID] = taxi
					end
					Lib.fcnames_by_nodeID[taxi.nodeID] = taxi.name
				end
			end
		end

		self:Debug("Caching taxi node IDs done, took %.3fms",debugprofilestop()-t)
	end

	---@type {[number]:TaxiNode}
	Lib.fnode_by_nodeID = {}
	-- cache tag->node and nodeID->node mappings
	function Lib:CacheTaxiPoints()
		for c,z,n,node in ZGV.CoroPairs(Lib.taxipoints,IterateCZNN) do
			if not is_enemy(playerF,node.faction) then
				if node.taxinodeID then Lib.fnode_by_nodeID[node.taxinodeID]=node end
				node._zone = z
			end
		end
	end
	
	---@return LibRoverTaxiNode|nil
	function Lib:FindTaxiByNodeID(nodeID)
		nodeID=tonumber(nodeID)
		if not Lib.fnode_by_nodeID[nodeID] then Lib:CacheTaxiPoints() end
		return Lib.fnode_by_nodeID[nodeID]
	end

	---@return BlizzTaxiNodeOnTaxiMap[]
	function Lib:GetAllBlizNodesForCurrentContinent()
		local _,cont,extracont = Lib:GetCurrentMapContinent()
		local taxidata = C_TaxiMap.GetAllTaxiNodes(cont) --[[@as BlizzTaxiNodeOnTaxiMap[] ]]
		if extracont then 
			for _,excont in ipairs(extracont) do
				local extradata = C_TaxiMap.GetAllTaxiNodes(excont) --[[@as BlizzTaxiNodeOnTaxiMap[] ]]
				for i,taxi in pairs(extradata) do table.insert(taxidata,taxi) end
			end
		end
		return taxidata
	end

	--- Returns current map continent's nodes: as they come, by slot on map, and by nodeID.
	---@return BlizzTaxiNodeOnTaxiMap[],{[TaxiSlot]:BlizzTaxiNodeOnTaxiMap},{[TaxiNodeID]:BlizzTaxiNodeOnTaxiMap}
	function Lib:GetBlizNodesByEverything()
		local cont = Lib:GetMapContinent(C_Map.GetBestMapForUnit("player"))

		local taxidata = Lib:GetAllBlizNodesForCurrentContinent()
		
		---@type {[TaxiSlot]:BlizzTaxiNodeOnTaxiMap}
		local taxidata_by_slot = {}
		for i,taxi in ipairs(taxidata) do if taxi.slotIndex then taxidata_by_slot[taxi.slotIndex]=taxi end end

		if (Lib.IsClassicTBC or Lib.IsClassicWOTLK or Lib.IsClassicCATA or Lib.IsClassicMOP) and cont==1945 then
			-- two faction specific nodes in SMV are not reported in GetAllTaxiNodes
			-- we need to add them by hand, filling empty slots in values, since
			-- taxidata_by_slot needs to be continous
			local unused_slot
			local aldor = {name="Altar of Sha'tar",nodeID=140,position={x=0,y=0}}
			local scryers = {name="Sanctum of the Stars",nodeID=159,position={x=0,y=0}}
			for i,v in ipairs(taxidata_by_slot) do unused_slot = i end
			aldor.slotIndex = unused_slot+1
			table.insert(taxidata,aldor)

			for i,v in ipairs(taxidata_by_slot) do unused_slot = i end
			scryers.slotIndex = unused_slot+1
			table.insert(taxidata,scryers)
		end

		local taxidata_by_nodeid = {}
		for i,taxi in ipairs(taxidata) do taxidata_by_nodeid[taxi.nodeID]=taxi end
		
		return taxidata, taxidata_by_slot, taxidata_by_nodeid
	end

	function Lib:ClearAllKnowledge(status)
		for c,cont in pairs(Lib.taxipoints) do
			Lib:ClearContinentKnowledge(c,"all",status)
		end
		if status~=true then table.wipe(Lib.master) end
	end

	-- return: is_known, is_suspicious
	function Lib:IsContinentKnown(cont)
		if not cont then cont=Lib:GetCurrentMapContinent() end

		if not Lib.taxipoints[cont] then return true,false end -- we do not have any taxis on this continent, so don't bother

		if self.master["c_"..(cont or 0)]~=nil then
			return true,false -- return whatever we know
		else
			return false,true
		end
	end

	function Lib:ClearContinentKnowledge(cont,operator,status)
		if not cont then cont=Lib:GetCurrentMapContinent() end

		for z,zone in pairs(Lib.taxipoints[cont]) do
			for n,node in ipairs(zone) do
				if node.factionid~=FACTION_SHATARISKYGUARD
				and (node.taxioperator==operator or operator=="all")
				then
					node.known=status
					if node.taxinodeID then Lib.master[node.taxinodeID]=status end
				end
			end
		end
		Lib.master["c_"..cont]=status
	end

	function Lib:MarkContinentSeen(cont,operator)
		self:Debug("Marking all unseen nodes on continent |cffffffff%d|r as |cff000000unknown|r.",cont)
		if not self.taxipoints[cont] then return end
		for z,zone in pairs(self.taxipoints[cont]) do  for ni,node in ipairs(zone) do
				if node.taxioperator==operator and node.known==nil then self:LearnTaxi(node,false) end
		end  end
		if not operator then
			Lib.master["c_"..cont]=true
		end
	end


	--- Fill .known fields using saved or encoded data.
 	function Lib:MarkKnownTaxis()
		local level = UnitLevel("player")
		local faction = UnitFactionGroup("player")
		for c,cont in pairs(Lib.taxipoints) do
			for z,zone in pairs(cont) do
				local zoneid = self.MapIDsByName[z]
				if type(zoneid)=="table" then zoneid=zoneid[1] end  -- might cause trouble on phased maps :/
				zoneid=ZGV and ZGV.Pointer:SanitizePhase(zoneid)
				
				for n,node in ipairs(zone) do
					if node.taxioperator=="blackcat" and faction=="Alliance" then  --All blackcats are usable by an alliance character
						self:LearnTaxi(node,true)
					elseif node.questKnown then
						self:LearnTaxi(node,C_QuestLog.IsQuestFlaggedCompleted(node.questKnown))
					elseif Lib.master[node.taxinodeID or node.name]~=nil then -- we know it or we know we don't, simplest case
						node.known=Lib.master[node.taxinodeID or node.name]
						if type(node.known)=="string" then node.known=not not node.known end  -- master has tags now, so convert back to boolean
					elseif false and not Lib.master[c] then  -- we didn't scan this continent yet, so let's do some guessing
						-- DON'T GUESS! LibRover will "guess" if it wants to. Leave it as nil (if it wasn't falsified by the continent being seen).

						--[[ if LibRover.data.ZoneContLev[zoneid].level<=level  -- zone is lower level than player, we should know all taxis by now
						  and LibRover.data.ZoneContLev[zoneid].level<85  -- except newer expansions - these are not learned by level
						  then
							if  (node.quest and not ZGV.completedQuests[node.quest]) -- we didn't do the quest
								or (node.factionid and select(3,GetFactionInfoByID(node.factionid))<node.factionstanding) -- we're not esteemed enough
								or (node.condition and not node.condition()) -- condition fail
								or (node.class and select(2,UnitClass("player"))~=node.class) -- we're the wrong class
							then
								node.known = false
							else
								node.known = true
							end
						end --]]

					end
				end
			end
		end
	end

	function Lib:ResetKnowledge()
		Lib:ClearAllKnowledge()
		Lib:MarkKnownTaxis()
		Lib:ImportTaxiDataFromGame()
	end




	function Lib:GetCurrentBlizTaxiFromMap()
		if NumTaxiNodes()==0 then return nil,"no map shown" end
		local taxidata = self:GetAllBlizNodesForCurrentContinent()
		for i,taxi in ipairs(taxidata) do
			if taxi.state==Enum.FlightPathState.Current then
				return taxi
			end
		end
	end

	Lib.lastSlotsToData = {}
	function Lib:RecordLastTaxiSlots()
		self.lastSlotsToData = self.TaxiMapAdapter:GetLastSlotsData()
	end

	-- Scan an open taxi map for (a) node positions, names and "known" status, (b) node connections.
	function Lib:ScanTaxiMap()
		if NumTaxiNodes()==0 then self:Debug("Map not shown, unable to scan."); return end

		local contorg, cont, contextra = self:GetCurrentMapContinent()

		self:Debug("Scanning map for continent %d...",cont)

		local current_bliztaxi = self:GetCurrentBlizTaxiFromMap()
		if not current_bliztaxi then self:Debug("Unable to find current taxi node. Map not open?") return end
		
		local taxinode = self:FindTaxiByNodeID(current_bliztaxi.nodeID)
		if not taxinode then self:Debug("Current taxi nodeID %d %s NOT found in continent %d data! Update please!",current_bliztaxi.nodeID,current_bliztaxi.name,cont) return end
		
		-- switch to a specific operator
		local current_operator = taxinode.taxioperator
		self:Debug("We're on continent %d, and will be flying %s airlines.",cont,current_operator or "default")

		-- Need to clear only the current operator. We have a node now, and its operator, so clear the continent.
		if current_operator=="argusportal" then -- mark Argus portal nodes as NOT known when they're not visible on the map.
			self:ClearContinentKnowledge(cont,current_operator,false)
		end

		-- Normally, all nodes are on the map, just hidden and taxitype=="DISTANT". However, some don't appear until known, and thus need manual unknowing.
		if cont==619 then
			local taxi = Lib:FindTaxiByNodeID(1760)  if taxi then taxi.known=false end  -- Trueshot Lodge
			local taxi = Lib:FindTaxiByNodeID(1815)  if taxi then taxi.known=false end  -- The Dreamgrove
		end

		local new_discovered=0

		local bliztaxidata = Lib:GetAllBlizNodesForCurrentContinent()
		for i,taxi in ipairs(bliztaxidata) do  repeat

			-- check the node itself

			local name = taxi.name
			name = name:gsub(", .*","")  -- trim zone names (in european languages, at least)

			-- EVIL BLIZZARD: "Temple of Karabor" at Draenor 766:315 is THE SAME as "Tranquil Court", but is DISTANT and has zero hops. Kill it and its kin.
			-- NOT ANYMORE. Distant points are now often zero-hopped. This caused MANY points to be skipped.
			--if GetNumRoutes(i)==0 and taxitype=="DISTANT" and TaxiNodeCost(i)==0 then  self:Debug("Taxi "..name.." gets skipped.")  break  end --continue
			
			-- localize node, if that's even used anymore
			local taxinode = Lib:FindTaxiByNodeID(taxi.nodeID)
			local fcdata = Lib.fc_by_nodeID[taxi.nodeID]

			if taxinode then
				--self:Debug("found %s [%s]",taxi.name,taxitag)
				if taxinode.taxioperator == current_operator then
					local known = taxi.state ~= Enum.FlightPathState.Unreachable
					Lib:LearnTaxi(taxinode, known)
					self:Debug("[%d]: %s: %s",taxi.nodeID,known and "|cff88ff88known|r" or "|cffff8888unknown|r",name)
				end

				taxinode.localname = taxinode.localname or name
				--self:Debug("Taxi: "..taxi.taxitag.." "..taxi.name.." ".. taxitype)
			else
				self:Debug("|cffff8888NPC missing in continent %d data: %s [nodeID %d]",cont,name,taxi.nodeID)
				--tinsert(self.errors,("taxi missing in data: %s [%s] [%.5f,%.5f]"):format(name,taxitag,taxix,taxiy))
			end
			
			if not fcdata then
				fcdata = {}
				Lib.flightcost[cont]=Lib.flightcost[cont] or {}
				tinsert(Lib.flightcost[cont],fcdata)
				Lib:Debug(("New taxi point discovered! %s (nodeID %d)"):format(taxi.name,taxi.nodeID))
				new_discovered=new_discovered+1
			end
			fcdata.name = fcdata.name or name
			fcdata.nodeID = fcdata.nodeID or taxi.nodeID

		until true  end

		if ZGV.Pointer.tmp_taxis_assumed then LibRover:UpdateNow() end

		if new_discovered>0 then Lib:Debug("%d new nodes discovered. You may wish to Scan Taxi Map and update the data now.",new_discovered) end

		if ZGV.db.profile.taxi_print_unknowntimes then
			local taxis,taxislots = Lib:GetBlizNodesByEverything()
			for dest=1,NumTaxiNodes() do
				if TaxiIsDirectFlight(dest) and TaxiNodeGetType(dest)=="REACHABLE" then
					local srcSlot = TaxiGetNodeSlot(dest, 1, true)
					local dstSlot = TaxiGetNodeSlot(dest, 1, false)
					local time=Lib.fc_by_nodeID[taxislots[srcSlot].nodeID].neighbors[taxislots[dstSlot].nodeID]
					if not time or time==0 then
						print("|cffffdd00Missing direct time: "..TaxiNodeName(dstSlot))
						if IsControlKeyDown() and IsShiftKeyDown() then TakeTaxiNode(dstSlot) print("Auto-taxiing to ",TaxiNodeName(dstSlot)) break end
					end
				end
			end
		end

		self:MarkContinentSeen(contorg,current_operator)

		self:MergeData()
		self:CacheTaxiNodeIDs()
		self:CacheTaxiPoints()

	end


	function Lib:CacheRoutesAsNodeIDs()
		---@type {[TaxiNodeID]:TaxiNodeID[]}
		self.lastRoutesFromCurrent = {}
		self.lastCurrentSlot = self:GetCurrentTaxiSlot()
		if not self.lastCurrentSlot then return end

		local taxis,taxisbyslots = self:GetBlizNodesByEverything()
		local currentSlot = taxisbyslots[self.lastCurrentSlot]
		if not currentSlot then return end

		self.lastCurrentNodeID = currentSlot.nodeID
		if not self.lastCurrentNodeID  then return end

		for endSlot=1,NumTaxiNodes() do
			if TaxiNodeGetType(endSlot)~="DISTANT" then
				local endNode = taxisbyslots[endSlot]
				if not endNode then return end
				local endNodeID = endNode.nodeID
				Lib.lastRoutesFromCurrent[endNodeID]={self.lastCurrentNodeID}
				for hop = 1, GetNumRoutes(endSlot) do
					local hopSlot = TaxiGetNodeSlot(endSlot, hop, false)
					tinsert(self.lastRoutesFromCurrent[endNodeID],taxisbyslots[hopSlot].nodeID)
				end
			end
		end
	end

	--- Calculated flight time from last CURRENT node to a chosen destination. Valid only soon after viewing a taxi map.
	function Lib:GetTotalFlightTimeTo(destNodeID)
		local totalTime = 0
		local route = Lib.lastRoutesFromCurrent[destNodeID]
		if not route then return false end
		for i=1,#route-1 do
			local t,precise,err = Lib:GetTaxiTripTime(route[i],route[i+1])
			if not t then 
				self:Debug(("No trip time! %s %s %s."):format(tostring(err),route[i],route[i+1]))
				return false
			end
			totalTime=totalTime+t - (#route-2)*2   -- deduct something for taxis passed on a multi-hop path
		end
		return totalTime
	end



	
	

	local function __genOrderedIndex( t )
	    local orderedIndex = {}
	    for key in pairs(t) do
		table.insert( orderedIndex, key )
	    end
	    table.sort( orderedIndex )
	    return orderedIndex
	end

	local function orderedNext(t, state)
		-- Equivalent of the next function, but returns the keys in the alphabetic
		-- order. We use a temporary ordered key table that is stored in the
		-- table being iterated.

		--print("orderedNext: state = "..tostring(state) )
		local key
		if state == nil then
			-- the first time, generate the index
			t.__orderedIndex = __genOrderedIndex( t )
			key = t.__orderedIndex[1]
			return key, t[key]
		end
		-- fetch the next value
		for i = 1,table.getn(t.__orderedIndex) do
			if t.__orderedIndex[i] == state then
				key = t.__orderedIndex[i+1]
			end
		end

		if key then
			return key, t[key]
		end

		-- no more value to return, cleanup
		t.__orderedIndex = nil
		return
	end

	local function ordered_pairs(t)
	    -- Equivalent of the pairs() function on tables. Allows to iterate
	    -- in order
	    return orderedNext, t, nil
	end

	-- unused for now, but workable and fun!
	local function table_dig_pairs(tab,depth,func,keys)
		keys=keys or {}
		if depth==1 then
			for k,v in pairs(tab) do
				table.insert(keys,k)
				table.insert(keys,v)
				func(unpack(keys))
				table.remove(keys)
				table.remove(keys)
			end
		else
			for k,v in pairs(tab) do
				table.insert(keys,k)
				table_dig_pairs(v,depth-1,func,keys)
				table.remove(keys)
			end
		end
	end


	-- Pull "flightcost" data into taxipoints.
	function Lib:MergeData()
		local FC=Lib.flightcost
		if not FC then print("Need flightcosts data") return end

		-- for each taxi NPC find its nodeID and tag.
		for c,z,ni,node in ZGV.CoroPairs(Lib.taxipoints,IterateCZNN) do repeat
			local found
			if not FC[c] then FC[c]={} end
			for fi,fcdata in pairs(FC[c]) do
				if (node.taxinodeID and node.taxinodeID==fcdata.nodeID) -- perfect match by nodeID
				or (not node.taxinodeID -- don't match nodeID-ed nodes by name!
				and fcdata.name:find(node.name,0,true)
				and fcdata.taxioperator==node.taxioperator
				and not is_enemy(fcdata.faction,node.faction))
				then
					found=1
					--if node.taxinodeID then tinsert(Lib.errors,"|cffff8888"..node.name.." got nodeID "..node.taxinodeID.." already! Why reassign to "..fcdata.nodeID.."??") end
					node.taxinodeID = fcdata.nodeID
					break
				end
			end

			if not found then tinsert(Lib.errors,"|cffffff00"..node.name.." ".." ("..z..") (faction:"..(node.faction or "-")..") ["..(node.taxioperator or "").."] didn't get a nodeID, no match found by name in LibTaxi.flightcost") end   -- DEVed prints at 2014-11-12
		until true end

		Lib:CacheTaxiNodeIDs()

		-- for each taxi NPC assign neighbors by tag. LibRover Node uses this for cost calc.
		for c,cont in pairs(Lib.taxipoints) do repeat
			for z,zone in pairs(cont) do
				for ni,node in pairs(zone) do repeat
					if is_enemy(node.faction,playerF) then break end
					if not node.taxinodeID then tinsert(Lib.errors,"Why did "..node.name.." not get a nodeID?") break end
					local fcdata = Lib.fc_by_nodeID[node.taxinodeID]
					if not fcdata then tinsert(Lib.errors,"taxi "..node.name.." id "..node.taxinodeID.." has no fcdata?") break end
					if not fcdata.neighbors then break end

					node.taxicosts = {}
					for neighborid,cost in pairs(fcdata.neighbors) do
						local neighbor = Lib.fnode_by_nodeID[neighborid]
						if neighbor then
							node.taxicosts[neighbor] = cost
						else
							node.taxicosts[neighborid] = cost -- won't be used, but let's keep it just for debugging
						end
					end
				until true end
			end
		until true end
	end

	function Lib:ImportTaxiDataFromGame()
		if not (Lib.IsRetail or Lib.IsClassicMOP) then return end
		local LOCALE = GetLocale()
		Lib.master.translation = Lib.master.translation or {}
		Lib.master.translation[LOCALE] = Lib.master.translation[LOCALE] or {}
		Lib.translation = Lib.master.translation[LOCALE]

		local Alliance,Horde = 2,1
		local badFaction = UnitFactionGroup("player")=="Alliance" and Horde or Alliance

		local conts={ -- maps needing special care
			97, --azuremyst not on kalimdor
			719, --mardum wtf is this even
			1970, --zereth mortis
			2093, --nokhud offensive raid
			2133, --zaralek
			2200, --emerald dream

			2055, -- sepulcher of the first ones
			2298, --nerubar palace raid
			12,
			13,
		}
		for cont,cd in pairs(self.taxipoints) do  conts[#conts+1]=cont  end

		for _,cont in ipairs(conts) do
			local nodes = C_TaxiMap.GetTaxiNodesForMap(cont)  -- slow! use sparingly
			for i,bliznode in ipairs(nodes) do
				if bliznode.faction~=badFaction then
					local taxinode = self:FindTaxiByNodeID(bliznode.nodeID)
					if taxinode then
						if bliznode.name~=taxinode.name then
							bliznode.name = bliznode.name:gsub(", .*","")  -- trim zone names (in european languages, at least)
							taxinode.localname=bliznode.name
						end
						if not bliznode.isUndiscovered then
							self:LearnTaxi(taxinode,not bliznode.isUndiscovered)
							Lib.master["c_"..cont]=true  -- if wow says so, it must be true
						end
					end
				end
			end
		end
	end

	function Lib:ImportTaxiTimesFromSV()
		if not ZGV.db.global.taxitimes then return end
		local loaded=0
		for k,v in pairs(ZGV.db.global.taxitimes) do  if v>0 then
			local id1,id2 = strsplit("_",k)
			id1,id2=tonumber(id1),tonumber(id2)
			if id1 and id2 and Lib.fc_by_nodeID[id1] and Lib.fc_by_nodeID[id2] then
				if (Lib.fc_by_nodeID[id1].neighbors[id2] or 0)==0 then
					Lib.fc_by_nodeID[id1].neighbors[id2]=v
					loaded=loaded+1
				end
				id1,id2=id2,id1
				if (Lib.fc_by_nodeID[id1].neighbors[id2] or 0)==0 then
					Lib.fc_by_nodeID[id1].neighbors[id2]=v
					loaded=loaded+1
				end
			end
		end end
		--ZGV:Print(("DEV: %d taxi trip times are still in SVs, waiting to be saved!"):format(loaded))
	end

	function Lib:GetTaxiByTarget(token)
		local id = ZGV.GetUnitId(token or "target")
		--print("Finding taxi by target: "..tostring(id)) -- DEBUGTAXITARGET
		if not id then return end
		--print("NPC ID: "..tostring(id)) -- DEBUGTAXITARGET
		for c,cont in pairs(Lib.taxipoints) do
			for z,zone in pairs(cont) do
				for ni,node in pairs(zone) do
					if node.npcid==id then return node end
				end
			end
		end
	end

	---@return TaxiSlot?
	function Lib:GetCurrentTaxiSlot()
		local num_nodes = NumTaxiNodes()
		for slot=1,num_nodes do
			if TaxiNodeGetType(slot)=="CURRENT" then return slot end
		end
	end

	function Lib:LearnTaxi(node,learn)
		node.known=learn
		if node.taxinodeID then Lib.master[node.taxinodeID]=learn end
	end
	
	function Lib:LearnCurrentTaxi(if_unlearn)
		local learn=true  if if_unlearn==false then learn=false end
		local node = self:GetTaxiByTarget()
		if node then
			self:LearnTaxi(node,learn)
			self:Debug("%slearned by node, %s",(learn and "" or "un"),node.name)
			return node
		end

		-- NPC not found? try by name (why would this ever happen!?) - Might when we've got new taxis.
		local name = GetMinimapZoneText()
		name = Lib.TaxiNames_English[name]
		if not name then
			self:Debug("|cffff8888Taxi Error: Unknown zone "..GetMinimapZoneText().."|r")
			return
		end
		name = minimap_exceptions[name] or name
		node=self:FindTaxi(name)
		if node then
			self:LearnTaxi(node,learn)
			self:Debug("%slearned by map, node %s, map %s",(learn and "" or "un"),node.name,GetMinimapZoneText())
			return node
		end
		
		self:Debug("Something failed, map is %s, target is %s, but can't find a taxi here",UnitGUID("target"),GetMinimapZoneText())
	end

	function Lib:MarkNeightboursUnknown(node)
		if not node then
			self:Debug("MarkNeightboursUnknown got no node")
			return
		end

		if not node.n then 
			self:Debug("MarkNeightboursUnknown node has no neighbours")
			return
		end

		for _,neigh in pairs(node.n) do
			if neigh[1] and neigh[1].taxinodeID then
				Lib:LearnTaxi(neigh[1],false)
			else
			end
		end
		if not Lib.IsRetail then Lib:MarkContinentSeen(node.c,node.taxioperator) end
	end


	--- Hook OnEnter events on managed taxi map pins. Re-hook on each map opening. Make sure not to hook twice.
	-- run on TAXIMAP_OPENED
	function Lib:HookTaxiMapPins_Delayed()
		C_Timer.After(0,function() self.TaxiMapAdapter:HookPins() end)
		-- /dump LibTaxi.HooksForFlightMapFrame:GetFlightPathDataProvider().slotIndexToPin		

		--if ZGV.IsClassic or ZGV.IsClassicWOTLK then return end
		-- dev function disabled, broken on classic
		--if not ZGV.DEV then return end
		--if ZGV.db.profile.taxi_print_unknowntimes and not 
		--if not self.taxi_tooltip_timer then self.taxi_tooltip_timer = ZGV:ScheduleRepeatingTimer(function() self:FlightMapFrameTimer() end,0.1) end
	end

	function Lib:HookTaxiAborts()
		hooksecurefunc("TaxiRequestEarlyLanding", function()  Lib:AbortTaxiTiming()  end)
		hooksecurefunc("AcceptBattlefieldPort", function()  Lib:AbortTaxiTiming()  end)
		hooksecurefunc(C_SummonInfo, "ConfirmSummon",  function()  Lib:AbortTaxiTiming()  end)
	end

	function Lib:HookTakeTaxiNode()
		hooksecurefunc("TakeTaxiNode",function(destSlot,a,b)
			-- record route taken for time estimation
			Lib:Debug("TakeTaxiNode hook: flying to slot "..destSlot)
			local destData = Lib.lastSlotsToData[destSlot]
			if destData and destData.nodeID then
				Lib:Debug("TakeTaxiNode hook, flying to %s (nodeID %d)",destData.name,destData.nodeID)
				Lib.LastTaxi = {fullname=destData.name,node=Lib:FindTaxiByNodeID(destData.nodeID)}
				if Lib.LastTaxi.node then
					Lib.LastTaxi.name,Lib.LastTaxi.zone = Lib.LastTaxi.node.name,ZGV.GetMapNameByID(Lib.LastTaxi.node.m)
					--Lib.LastTaxi.name,Lib.LastTaxi.zone = Lib.LastTaxi.node.name,(Lib.LastTaxi.node.m and ZGV.GetMapNameByID(Lib.LastTaxi.node.m) or ("(bad map in '"..Lib.LastTaxi.name.."')")) -- just in case? or was it a bad update that broke in here?
				else
					Lib.LastTaxi.name,Lib.LastTaxi.zone = Lib.LastTaxi.fullname:match("(.*), (.*)")
				end
				local time=Lib:GetTotalFlightTimeTo(destData.nodeID)

				Lib.LastTaxi.route = {}
				local route = Lib.lastRoutesFromCurrent[destData.nodeID]
				if route then for i=1,#route do tinsert(Lib.LastTaxi.route,Lib:FindTaxiByNodeID(route[i])) end end
				Lib.LastTaxi.eta = time or -1
				Lib.LastTaxi.departure = GetTime()
				Lib:Debug("TakeTaxiNode hook, estimated time %d",time)
			end
		end)
	end

	function Lib:HookMapChange()
		hooksecurefunc(WorldMapFrame,"OnMapChanged",function() self:UpdateAntoranTaxis() end)
	end


	function Lib:AnyTaxiKnown(...)
		local count = select("#", ...)
		for i = 1, count do
			local nodeid = select(i, ...)
			local node = Lib.fnode_by_nodeID[nodeid]
			if node and node.known then return true end
		end
		return false
	end





	function Lib:Debug(s,...)
		if ZGV and ZGV.db then ZGV:Debug("&LibTaxi "..s,...) end
	end


	
	
	
	
	
	
	
	
	
	
	
	----------------------------------------------------------------
	----------------------------------------------------------------
	----------------------------------------------------------------
	----------------------------------------------------------------
	----------------------------------------------------------------
	----------------------------------------------------------------
	




















	function Lib:DEV_FindNodeIDs(operator,continent)
		local continent = continent or Lib:GetCurrentMapContinent()
		local taxidata = Lib:GetAllBlizNodesForCurrentContinent()

		local taxidata = C_TaxiMap.GetTaxiNodesForMap(continent)

		local count_ided=0
		local count_alreadyided=0
		local count_failed=0
		local failed={}
		print("Grabbing nodeIDs for continent ",continent)

		-- find IDs for nodes that don't have them yet
		for i,taxi in ipairs(taxidata) do
			local taxi_name_strip = taxi.name:gsub(", .*","")

			local found={}
			for ti,taxicost in ipairs(Lib.flightcost[continent]) do
				if (taxicost.name==taxi.name or taxicost.name==taxi_name_strip)and (taxicost.taxioperator==operator) and not is_enemy(taxicost.faction,playerF) then
					found[#found+1]=taxicost
				end
			end
			if #found==0 then print(taxi.name," - NOT FOUND") count_failed=count_failed+1 failed[#failed+1]=taxi.name
			elseif #found>=2 then print(taxi.name," - FOUND MANY:") for ti,foundt in ipairs(found) do print(foundt.tag or "no tag") end count_failed=count_failed+1 failed[#failed+1]=taxi.name
			elseif found[1].nodeID then
				count_alreadyided=count_alreadyided+1
			else
				-- 1 found
				--print(taxi.name," - found ",found[1].tag)
				found[1].nodeID=tonumber(taxi.nodeID)
				count_ided=count_ided+1
			end

		end

		-- count remaining
		local remain={}
		local count_remainall=0
		for cont,taxicont in pairs(Lib.flightcost) do
			for ti,taxi in ipairs(taxicont) do
				if not taxi.nodeID then count_remainall=count_remainall+1 end
				if cont==continent and not is_enemy(taxi.faction,playerF) and not taxi.nodeID then
					tinsert(remain,taxi)
				end
			end
		end

		Lib.TagToNodeID = Lib.TagToNodeID or {}

		for i,v in pairs(Lib.flightcost[continent]) do
			if v.nodeID and v.tag then
				Lib.TagToNodeID[v.tag] = v.nodeID
			end
		end

		print("FAILED: ")  for i,fname in ipairs(failed) do print(fname) end
		print("REMAIN: ",#remain)  for i,taxi in ipairs(remain) do print(taxi.name)  if i>=10 then print("...") break end end
		print(#taxidata," nodes visible, ",count_alreadyided," nodes already IDed, ",count_ided," nodes IDed now, ",count_failed," failed. ",#remain," remain for this continent. ",count_remainall," remain in total.")
		Lib:DEV_DumpFlightCosts(continent)
	end

	---@deprecated
	function Lib:DEV_ConvertCostsToNodeID()
		error("Not supported anymore, need to convert away from tags")
		do return end

		local count_converted=0
		local count_unknown=0
		local count_nonodeid=0
		local count_already=0
		local unique_unknown={}
		local unique_unknown_num=0
		local unique_nonodeid={}
		local unique_nonodeid_num=0

		for contnum,contdata in pairs(self.flightcost) do
			for i,taxi in ipairs(contdata) do
				local new_neighbors={}

				local count_connections_before=0
				local total_cost_before=0
				for tag,cost in pairs(taxi.neighbors or {}) do  total_cost_before=total_cost_before+cost  count_connections_before=count_connections_before+1  end

				for tag,cost in pairs(taxi.neighbors or {}) do
					
					if tonumber(tag) and self.fc_by_nodeID[tag] then
						count_already=count_already+1
						new_neighbors[tag]=cost -- keep it
					else
						local neigh = self.fc_by_tag[contnum][tag]
						if not neigh then
							--print(taxi.name,"has unknown neighbor",tag)
							new_neighbors[tag]=cost -- keep it
							count_unknown=count_unknown+1
							if not unique_unknown[tag] then
								unique_unknown[tag]=cost
								unique_unknown_num=unique_unknown_num+1
							end
						elseif not neigh.nodeID then
							--print(taxi.name,"'s neighbor",tag,"has no nodeID")
							new_neighbors[tag]=cost -- keep it
							count_nonodeid=count_nonodeid+1
							if not unique_nonodeid[tag] then
								unique_nonodeid[tag]=tag.." "..neigh.name
								unique_nonodeid_num=unique_nonodeid_num+1
							end
						else
							new_neighbors[neigh.nodeID]=cost
							count_converted=count_converted+1
						end
					end
				end

				local count_connections_after=0
				local total_cost_after=0
				for tag,cost in pairs(taxi.neighbors or {}) do  total_cost_after=total_cost_after+cost  count_connections_after=count_connections_after+1  end

				if count_connections_before~=count_connections_after then print("|cffff0000ERROR! ",taxi.tag,taxi.name,"had",count_connections_before,"connections, now has",count_connections_after) end
				if total_cost_before~=total_cost_after then print("|cffff0000ERROR! ",taxi.tag,taxi.name,"had",total_cost_before,"costs, now has",total_cost_after) end

				taxi.neighbors=new_neighbors
			end
		end

		local nonodeids = ""
		for tag,tagname in pairs(unique_nonodeid) do nonodeids=nonodeids.." "..tagname.."," end

		print("Converted costs from tag to node ID: ",count_already,"already good,",count_converted,"converted,\n",unique_nonodeid_num,"(",count_nonodeid,") missing nodeID:",nonodeids,"\n",unique_unknown_num,"(",count_unknown,") orphaned:",table.concat(ZGV.TableKeys(unique_unknown),", "))
	end

	function Lib:DEV_FixByDupes()
		-- fix missing dupes
		for contnum,contdata in pairs(Lib.flightcost) do  repeat
			for i,taxi in ipairs(contdata) do
				if taxi.neighbors then
					for id,cost in pairs(taxi.neighbors) do
						if cost==0 and Lib.fc_by_nodeID[id] and Lib.fc_by_nodeID[id].neighbors and Lib.fc_by_nodeID[id].neighbors[taxi.nodeID] and Lib.fc_by_nodeID[id].neighbors[taxi.nodeID]>0 then
							print("fixed",taxi.nodeID,"to",id)
							taxi.neighbors[id]=Lib.fc_by_nodeID[id].neighbors[taxi.nodeID]
						end
					end
				end
			end
		until true end
	end

	-- /run LibTaxi:DumpFlightCosts()
	function Lib:DEV_DumpFlightCosts(onlycont)
		if onlycont==true or not IsShiftKeyDown() then onlycont=Lib:GetCurrentMapContinent() end

		local s=""
		if not onlycont then s="data.flightcost = {\n" end

		for contnum,contdata in ZGV.OrderedPairs(Lib.flightcost) do  repeat
			if onlycont and contnum~=onlycont then break end  --continue
			if ZGV.Testing.FlightCostComments[contnum] then
				s=s.."\n\n\n\n\n"..ZGV.Testing.FlightCostComments[contnum]
			end

			s=s.."["..contnum.."]={\n"
			
			local function namesort(a,b) 
				if a.name==b.name then
					if a.nodeID and b.nodeID then
						return a.nodeID < b.nodeID
					else
						return (a.faction or "")< (b.faction or "")
					end
				else
					return a.name and b.name and a.name<b.name 
				end
			end
			table.sort(contdata,namesort)

			for i,data in ipairs(contdata) do
				s=s.."	{\n"
				
				if data.tag then s=s.."		tag = \""..data.tag.."\",\n" end
				if data.nodeID then s=s.."		nodeID = "..data.nodeID..",\n" end
				s=s.."		name = \""..data.name.."\",\n"
				
				if data.taxioperator then s=s.."		taxioperator = \""..data.taxioperator.."\",\n" end
				if data.faction then s=s.."		faction = \""..data.faction.."\",\n" end
				if data.comment then s=s.."		comment = \""..data.comment.."\",\n" end

				for k,v in pairs(data) do if k~="taxioperator" and k~="faction" and k~="comment" and k~="name" and k~="neighbors" and k~="tag" and k~="nodeID" then print("Odd data key",k) end end
				
				if data.neighbors then
					s=s.."		neighbors = {\n"

					local sorted_neighs={}
					for ntag,cost in pairs(data.neighbors) do tinsert(sorted_neighs,ntag) end
					table.sort(sorted_neighs,ZGV.NumericSafeSort)

					for j,ntag in ipairs(sorted_neighs) do

						local cost = data.neighbors[ntag]
						local name = self.fcnames_by_nodeID[ntag] or (self.TagToNodeID and self.fcnames_by_nodeID[self.TagToNodeID[ntag]])
						local newtag = self.TagToNodeID and self.TagToNodeID[ntag] or tonumber(ntag) and ntag or '"'..ntag..'"'
						s = s .. "			["..newtag.."] = "..cost..", -- " .. (name or "?") .. "\n"
					end
					s=s.."		},\n"
				end
				s=s.."	},\n"
			end
			s=s.."},\n"
		until true end
		if not onlycont then  s=s.."}\n"  end
		ZGV:ShowDump(s,"Paste into LibTaxi/data.lua"..(onlycont and " WHERE APPROPRIATE" or ""))
	end

	function Lib:DEV_ScanCurrentTaxiNPC()
		ZGV.db.global.scannedtaxinpcs = ZGV.db.global.scannedtaxinpcs or {}
		local saved_npcs = ZGV.db.global.scannedtaxinpcs
		-- prune known saved first
		for c,z,n,node in ZGV.CoroPairs(Lib.taxipoints,IterateCZNN) do  if node.npcid then saved_npcs[node.npcid]=nil end  end

		if self:GetTaxiByTarget("npc") then return end -- already known, by target npc ID

		local current_bliztaxi = Lib:GetCurrentBlizTaxiFromMap()
		if not current_bliztaxi then self:Debug("Cannot determine current taxi node. TaxiMap closed?") return end -- no taxi

		local npc_id = ZGV.GetUnitId("npc")
		local x,y,map = LibRover:GetPlayerPosition()
		local npc_name = UnitName("npc")
		saved_npcs[npc_id] = {zone=GetZoneText(),dump=('\t{name="%s",faction="?",npc="%s",npcid=%d,x=%.02f,y=%.02f,taxinodeID=%d},'):format(current_bliztaxi.name:gsub(", .*",""),npc_name,npc_id,x*100,y*100,current_bliztaxi.nodeID)}
		self:Debug("Scanned new Taxi NPC: %d %s for point %d %s",npc_id,npc_name,current_bliztaxi.nodeID,current_bliztaxi.name)
	end

	function Lib:DEV_DumpSavedTaxiNPCs()
		---@type {[string]:string[]}
		local pre_dumps = {} 
		ZGV.db.global.scannedtaxinpcs = ZGV.db.global.scannedtaxinpcs or {}
		local saved_npcs = ZGV.db.global.scannedtaxinpcs
		for npc_id,data in pairs(saved_npcs) do
			pre_dumps[data.zone] = pre_dumps[data.zone] or {}
			pre_dumps[data.zone][#pre_dumps[data.zone]+1]=data.dump
		end
		PDS=pre_dumps
		local final_dump = ""
		for zone,dumps in pairs(pre_dumps) do
			final_dump = final_dump .. ('["%s"] = {\n%s\n},\n'):format(zone,table.concat(dumps,"\n"))
		end
		ZGV:ShowDump(final_dump)
	end

	function Lib:DEV_DumpTaxiByTarget()  -- DEV
		local node = self:GetTaxiByTarget()
		if node then
			print("You're recognized at: "..node.name..", "..(node.known and "a 'known'" or "an 'unknown'").." taxi.")
		else
			print("I have no idea what taxi point you're at.")
		end
	end


	---@deprecated
	function Lib:DEV_TestAllFlights()
		local s = ""

		--local BZ = LibStub("LibBabble-SubZone-3.0")
		--local BZL,BZR = BZ:GetUnstrictLookupTable(),BZ:GetReverseLookupTable()

		for i=1,NumTaxiNodes() do
			local x,y=TaxiNodePosition(i)
			x,y=floor(x*1000),floor(y*1000)
			if x < 100 then x = "0"..x end
			if y < 100 then y = "0"..y end
			local name=TaxiNodeName(i)
			local ttag = x..":"..y


			local tagmatch = Lib:FindTaxiByTag(Lib:GetCurrentMapContinent(),ttag)

			if not tagmatch then
				s = s.."\n"..ttag.." - No tag match - "..i
			end

		end
		ZGV:ShowDump(s)
	end

	function Lib:DEV_CheckNodeMatches()
		local errors = {}

		-- record flightcosts' node IDs, if they're directly linked then skip the name-lookup nonsense
		local nodeids = {}
		for cont,contdata in pairs(self.flightcost) do
			for i,taxi in ipairs(contdata) do
				if taxi.nodeID then nodeids[taxi.nodeID]=taxi end
			end
		end

		local tp_lookup = {}
		for cont,contdata in pairs(self.taxipoints) do
			for zone,zonedata in pairs(contdata) do
				for i,taxi in ipairs(zonedata) do
					if taxi.taxinodeID and nodeids[taxi.taxinodeID] then
						nodeids[taxi.taxinodeID]=true
					else
						local no_npc = (taxi.taxioperator=="argusportal" or taxi.taxioperator=="animaflow" or taxi.taxihidden) -- some taxis don't need npc or npcid
						local fields={"faction","x","y", not no_npc and "npc", not no_npc and "npcid"}
						local missings=0
						for fi,field in ipairs(fields) do if field and not taxi[field] then errors[#errors+1]=taxi.name.." missing field: "..field  missings=missings+1  end end
						local name = taxi.name:gsub(", .*","") -- zone name doesn't matter
						if missings==0 then tp_lookup[cont.."::"..name]=taxi end  -- we're good
					end
				end
			end
		end

		for cont,contdata in pairs(self.flightcost) do
			for i,taxi in ipairs(contdata) do
				if taxi.nodeID and nodeids[taxi.nodeID]==true --[[ already linked --]] then
					-- skip
				else
					local name = taxi.name:gsub(", .*","") -- zone name doesn't matter
					local key = cont.."::"..name
					if tp_lookup[key] then
						tp_lookup[key]=true
					elseif taxi.comment~="removed"
					and name~="Forsaken Forward Command" -- one quest only
					and name~="Starlit Overlook" -- goes away after covenant joined
					and name~="The Summer Terrace" and name~="The Golden Terrace" -- what are these, even?
					then
						errors[#errors+1] = "Missing in 'taxipoints': continent "..cont..", taxi "..name.." ("..key..")"
					end
				end
			end
		end

		for k,taxi in pairs(tp_lookup) do  if taxi~=true and not k:match("424::") --[[ ignore summer/golden terrace ]] then
			errors[#errors+1] = "Missing in 'flightcost': "..k:gsub("::"," - ")
		end end

		if #errors>0 then ZGV:ShowDump(table.concat(errors,"\n"),"LibTaxi problems") end
	end

	-- /run LibTaxi:DeepScanTaxiMap()
	-- /run LibTaxi:DumpFlightCosts()
	-- Called with Dump Taxi Connections button
	function Lib:DEV_DeepScanTaxiMap()  -- DEV FUNCTION
		if NumTaxiNodes()==0 then self:Debug("Map not shown, unable to scan."); return end
		local cont = Lib:GetCurrentMapContinent()
		print("Deep-scanning continent",cont)

		Lib.flightcost[cont] = Lib.flightcost[cont] or {}
		local fccont = Lib.flightcost[cont]

		-- check connections

		local connections=0

		local taxidata,taxidata_by_slot = self:GetBlizNodesByEverything()

		local reachable=1

		local listed={}
		local missingtimes=0

		for dest=1,NumTaxiNodes() do if TaxiNodeGetType(dest)=="REACHABLE" then
			reachable=reachable+1
			local startnode_slot,endnode_slot

			startnode_slot=TaxiGetNodeSlot(dest,1,true)  --[[@as number]]

			local hops = ("%d hops to %s: "):format(GetNumRoutes(dest),TaxiNodeName(dest))

			for hop=1,GetNumRoutes(dest) do

				endnode_slot=TaxiGetNodeSlot(dest,hop,false)  --[[@as number]]

				hops = hops .. (" %d: (slot %d) %s,"):format(hop,endnode_slot,TaxiNodeName(endnode_slot))

				local new
				local startnodeID = taxidata_by_slot[startnode_slot] and taxidata_by_slot[startnode_slot].nodeID
				local fcstart = self.fc_by_nodeID[startnodeID]
				if not fcstart then
					fcstart={name=TaxiNodeName(startnode_slot):gsub(", .*",""),nodeID=startnodeID}
					
					tinsert(fccont,fcstart)
					-- put in cache, too
					if startnodeID then self.fc_by_nodeID[fcstart.nodeID]=fcstart end
					if startnodeID then self.fcnames_by_nodeID[fcstart.nodeID]=fcstart.name end
					hops = hops .. ("|cff00ff00<-NEW START|r ")
				end

				local endnodeID = taxidata_by_slot[endnode_slot] and taxidata_by_slot[endnode_slot].nodeID
				local fcend = self.fc_by_nodeID[endnodeID]
				if fcstart then
					if not fcend then
						fcend={name=TaxiNodeName(endnode_slot):gsub(", .*",""),nodeID=endnodeID}
						tinsert(Lib.flightcost[cont],fcend)
						-- put in cache, too
						if endnodeID then self.fc_by_nodeID[fcend.nodeID]=fcend end
						if endnodeID then self.fcnames_by_nodeID[fcend.nodeID]=fcend.name end
						hops = hops .. ("|cff00ff00<-NEW END|r ")
					end
					local start_ident = fcstart.nodeID
					local end_ident = fcend.nodeID

					fcstart.neighbors = fcstart.neighbors or {}
					if not fcstart.neighbors[end_ident] then new=1 end
					fcstart.neighbors[end_ident] = fcstart.neighbors[end_ident] or 0

					fcend.neighbors = fcend.neighbors or {}
					if not fcend.neighbors[start_ident] then new=1 end
					fcend.neighbors[start_ident] = fcend.neighbors[start_ident] or 0
					if new then
						connections=connections+1
						hops = hops .. ("|cff00ff00<-NEW|r ")
					end

					if (fcstart.neighbors[end_ident]==0 or fcend.neighbors[start_ident]==0) and not listed[start_ident.."_"..end_ident] then
						listed[start_ident.."_"..end_ident]=true
						missingtimes = missingtimes + 1
						hops = hops .. ((" |cffff8800Missing time: |cffffff00%s|r to |cffffff00%s|r|r,"):format(fcstart.name,fcend.name))
						
						-- Auto-scout! Hold CTRL to auto fly to any missing time.
						if hop==1 and TaxiNodeGetType(endnode_slot)=="REACHABLE" and IsControlKeyDown() then print((" |cffff8800Auto-scouting time?: |cffffff00%s|r to |cffffff00%s|r|r,"):format(fcstart.name,fcend.name)) TakeTaxiNode(endnode_slot) return end
					end
				else
					print("unknown connection:",startnode_slot,endnode_slot)
				end

				startnode_slot=endnode_slot
			end

			print(hops)

		end end


		-- Missing hops have now been given the "0" time. Enough to get connections right.

		print(("=== %d nodes, %d reachable, %s new connections, %s missing times. ==="):format(NumTaxiNodes(),reachable,connections>0 and "|cff00ff00"..connections.."|r" or connections,missingtimes>0 and "|cffff0000"..missingtimes.."|r" or missingtimes))
		self:DEV_DumpFlightCosts()
	end


	function Lib:DEV_ViewTaxiMapData()  -- DEV FUNCTION (simple)
		if NumTaxiNodes()==0 then self:Debug("Map not shown, unable to scan."); return end
		local cont = Lib:GetCurrentMapContinent()

		local ret = {}
		local rett = {}

		local taxidata,taxidata_by_slot = self:GetBlizNodesByEverything()
		
		for dest=1,NumTaxiNodes() do repeat
		
			local x,y = TaxiNodePosition(dest)

			local taxitype=TaxiNodeGetType(dest)

			local s

			if not taxidata_by_slot[dest] then s = ("%d. %s (%s) - Sanity fault, not in taxidata!"):format(dest,TaxiNodeName(dest),taxitype) tinsert(ret,s) tinsert(rett,{"?"}) break end
			
			local taxi = Lib:FindTaxiByNodeID(taxidata_by_slot[dest].nodeID)

			local texkit = taxidata_by_slot[dest].textureKitPrefix or ""

			local s = ("%2d. %s%s%s|r [ID |cffff8800%d|r, |cffffdd00%d|r hops, %s, %s)"):format(
				dest,
				    taxitype=="CURRENT" and "|cffbbff88"
				 or taxitype=="REACHABLE" and "|cff00ff00"
				 or taxitype=="DISTANT" and "|cff888888"
				 or "|cffff0000",
				TaxiNodeName(dest),
				    texkit:match("_Ferry") and "|r - |cff88ddffFERRY|r"
				    or (taxi and taxi.taxioperator=="seahorse" and "|r - |cff88ffddSEAHORSE|r")
				 or "",
				taxidata_by_slot[dest].nodeID,
				GetNumRoutes(dest),
				taxitype,
				taxi and (     (TaxiNodeCost(dest)==0 and taxitype=="DISTANT" and "|cff888888DISABLED|r")
					        or (taxi.known==true and "|cff00ff00KNOWN|r")
					        or (taxi.known==false and "|cffff8800UNKNOWN|r")
					        or "|cffff0000???|r")
				     or "|cffff0000NPC NOT FOUND|r"
				)

			tinsert(ret,s)
			tinsert(rett,taxi or {"?"})

		until true end
		-- Missing hops have now been given the "0" time. Enough to get connections right.

		if Spoo then
			local retz = {}
			for i,s in ipairs(ret) do retz[s]=rett[i] end
			Spoo(nil,nil,retz)
		else
			ZGV:ShowDump(table.concat(ret,"\n"),"Taxi data for continent "..cont)
		end
	end

	local zygordevhooked
	function Lib:DEV_HookZygorButtons()
		if not (ZGV and ZGV.DEV) then return end

		local taxiparent = (TaxiFrame and TaxiFrame:IsShown() and TaxiFrame) or (FlightMapFrame and FlightMapFrame:IsShown() and FlightMapFrame)
		if not taxiparent then return end

		if not zygordevhooked then
			hooksecurefunc("TaxiNodeOnButtonEnter",function(button)
				local taxidata,taxidata_by_slot = self:GetBlizNodesByEverything()
				local slot=tonumber(button:GetID())
				local taxix,taxiy = TaxiNodePosition(slot)
				local nodeID = taxidata_by_slot[slot] and taxidata_by_slot[slot].nodeID
				local taxinode = nodeID and self:FindTaxiByNodeID(nodeID)
				self:Debug(("Taxi %d = id %d (%s, npc %s, node #%s)"):format(slot or 0,nodeID or 0,taxinode and taxinode.name or "name?",taxinode and taxinode.npc or "npc?", taxinode and taxinode.num  or  LibRover.nodes.taxi and #LibRover.nodes.taxi>0 and "???"  or  "Travel-not-initialized"))
			end)
			zygordevhooked=true
		end

		taxiparent.ZygorButtonScan = taxiparent.ZygorButtonScan or ZGV.ChainCall(CreateFrame("BUTTON","ZGVLibTaxiButton_in_"..taxiparent:GetName(),taxiparent,"UIPanelButtonTemplate"))
		:SetPoint("TOPRIGHT",taxiparent,"TOPRIGHT",0,-20)
		:SetSize(160,20)
		:SetText("[Z] Dump taxi times")
		:SetScript("OnClick",function() Lib:DEV_DeepScanTaxiMap() end)
		:SetScript("OnEnter",function(self) ZGV.ChainCall(GameTooltip) :ClearAllPoints() :ClearLines() :SetOwner(self,"ANCHOR_BOTTOM") :AddLine("Scan connections from this point, update the connections database|nand display it for copy-pasting.",1,1,1) :AddLine("Hold SHIFT to dump ALL continents |cffff8800(may take time!)|r",1,1,1) :Show()  end)
		:SetScript("OnLeave",function() GameTooltip:Hide() end)
		:SetFrameLevel(100)
		--:RegisterForClicks("AnyUp")
		:Hide()
		.__END

		taxiparent.ZygorButtonDetails = taxiparent.ZygorButtonDetails or ZGV.ChainCall(CreateFrame("BUTTON","ZGVLibTaxiButton_in_"..taxiparent:GetName(),taxiparent,"UIPanelButtonTemplate"))
		:SetPoint("TOPRIGHT",taxiparent,"TOPRIGHT",0,-40)
		:SetSize(160,20)
		:SetText("[Z] View details")
		:SetScript("OnClick",function() Lib:DEV_ViewTaxiMapData() end)
		:SetFrameLevel(100)
		--:RegisterForClicks("AnyUp")
		:Hide()
		.__END

		taxiparent.ZygorButtonNPC = taxiparent.ZygorButtonNPC or ZGV.ChainCall(CreateFrame("BUTTON","ZGVLibTaxiButton_in_"..taxiparent:GetName(),taxiparent,"UIPanelButtonTemplate"))
		:SetPoint("TOPRIGHT",taxiparent,"TOPRIGHT",0,-60)
		:SetSize(160,20)
		:SetText("[Z] Dump NPCs ()")
		:SetScript("OnClick",function() Lib:DEV_DumpSavedTaxiNPCs() end)
		:SetFrameLevel(100)
		--:RegisterForClicks("AnyUp")
		:Hide()
		.__END
		local count=0  for id,data in pairs(ZGV.db.global.scannedtaxinpcs or {}) do count=count+1 end
		taxiparent.ZygorButtonNPC:SetText(("[Z] Dump NPCs (%d)"):format(count))

		if ZGV.db.profile.debug_display then
			taxiparent.ZygorButtonScan:Show()
			taxiparent.ZygorButtonDetails:Show()
			taxiparent.ZygorButtonNPC:Show()
		end

	end

	

	--[[ unused?
		function Lib:MergeTags__()  --unused?
			if not LibRover.data.flightcost then return end  -- shouldn't be any anyway
			for contnum,contdata in ipairs(LibRover.data.flightcost) do
				for tag,taxidata in pairs(contdata) do
					local taxinode = Lib:FindTaxi(taxidata.Name, "trim")
					if not taxinode then
						if ZGV.DEV then print("WHOA. Taxi node not found: ",taxidata.Name) end   -- DEVed prints at 2014-11-12
					else
						taxinode.taxitag = tag
						taxinode.pre_costs = taxidata.Neighbors
					end
				end
			end
		end
	--]]


	--[[ UNUSED? not even for DEV!
		function Lib:DumpNeighborFlights()

			local s = ""

			for i=1,NumTaxiNodes() do
				x,y=TaxiNodePosition(i)
				x,y=floor(x*1000),floor(y*1000)
				if x < 100 then x = "0"..x end
				if y < 100 then y = "0"..y end
				name=TaxiNodeName(i)

				if GetNumRoutes(i)==1 then
					s= s..("		[\""..x..":"..y.."\"]".." = time, --"..name.."\n")
				elseif GetNumRoutes(i)==0 then
					s=("--[\""..x..":"..y.."\"]".." = time, --"..name.."\n".."[\""..x..":"..y.."\"]".." = {\n	[\"name\"] = \""..name.."\",\n	[\"neighbors\"] = {\n")..s
				end
			end
			s=s.."	},\n},"
			ZGV:ShowDump(s,"Paste these into LibTaxi data.lua into data.flightcost")
		end
	--]]

	--[[ UNUSED? not even for DEV!
		function Lib:DumpAllFlights()

			local s = ""

			for i=1,NumTaxiNodes() do
				x,y=TaxiNodePosition(i)
				x,y=floor(x*1000),floor(y*1000)
				if x < 100 then x = "0"..x end
				if y < 100 then y = "0"..x end
				name=TaxiNodeName(i)

				s=s..("--[\""..x..":"..y.."\"]".." = time, --"..name.."\n".."[\""..x..":"..y.."\"]".." = {\n	[\"name\"] = \""..name.."\",\n	[\"neighbors\"] = {\n").."},\n},\n"
			end
			ZGV:ShowDump(s)
		end
	--]]

	--[[
		function Lib:ConvertTag(typ,a,b,c)
			if typ=="raw" then
				return tonumber(("%d:%0d:%0d"):format(a,math.ceil(b*100),math.ceil(c*100)))
			elseif typ=="fme" then
				return a
			end
		end
	--]]

	--[[
		function Lib:TestCurrent()
			for node=1,NumTaxiNodes() do
				local typ=TaxiNodeGetType(node)
				if typ=="CURRENT" then
					local x,y = TaxiNodePosition(node)
					x=Math.floor(
			end
		end
	--]]

	--[=[
		---@deprecated
		function Lib:MarkKnownByLevels() -- OLD, REFURBISHED!
			local level = UnitLevel("player")
			for c,cont in pairs(Lib.taxipoints) do  if not Lib.master[c] then
				for z,zone in pairs(cont) do
					local zoneid = self.MapIDsByName[z]
					if type(zoneid)=="table" then zoneid=zoneid[1] end  -- might cause trouble on phased maps :/
					zoneid=ZGV and ZGV.Pointer:SanitizePhase(zoneid)
					--[[if LibRover.MapLevels[zoneid]<=level  -- zone is lower level than player, we should know all taxis by now
					and LibRover.MapLevels[zoneid]<85  -- Pandaria Zones are not learned by level
					then
						for n,node in ipairs(zone) do
							if node.known==nil then node.known=true	end

							if  (node.quest and not ZGV.completedQuests[node.quest]) -- we didn't do the quest
								or (node.factionid and select(3,GetFactionInfoByID(node.factionid))<node.factionstanding) -- we're not esteemed enough
								or (node.condition and not node.condition()) -- condition fail
								or (node.class and select(2,UnitClass("player"))~=node.class) -- Class only! woo
							then
								node.known = false
							end

							if not node.known then Lib.master[node.name]=false end

							if Lib.master[node.name]==nil then Lib.master[node.name]=true end
						end
					else --]]
						for n,node in ipairs(zone) do
							if node.taxioperator and node.taxioperator=="blackcat" then node.known = true end --All blackcats are usable by an alliance character

							if node.available then
								self:LearnTaxi(node,node.available) --OVERWRITE. If we gave something special so don't worry about the others
							elseif node.achievemissing then
								-- If the player has the achievement, then the node is missing.
								node.missing = select(13,GetAchievementInfo(node.achievemissing)) -- 13 = whether this toon has the achievement.
							elseif Lib.master[node.taxinodeID or node.taxitag or node.name]==false then --if zone is overlevel and for some reason it is false, set it back to nil
								Lib.master[node.taxinodeID or node.taxitag or node.name]=nil
							elseif Lib.master[node.taxinodeID or node.taxitag or node.name]==true then -- we know a flightpath that is over our level
								node.known=true
							end
						end
					--end
				end
			end  end
		end
	--]=]



	_G['LibTaxi']=Lib

end



---@class TaxiMapAdapter
local TaxiMapAdapter = {}
Lib.TaxiMapAdapter = TaxiMapAdapter

function TaxiMapAdapter:GetLastSlotsData()
	if TaxiFrame and TaxiFrame:IsShown() then return Lib.HooksForTaxiFrame:GetLastSlotsData() end
	if FlightMapFrame and FlightMapFrame:IsShown() then return Lib.HooksForFlightMapFrame:GetLastSlotsData() end
end

function TaxiMapAdapter:HookPins()
	if TaxiFrame then Lib.HooksForTaxiFrame:HookButtons() end
	if FlightMapFrame and FlightMapFrame:IsShown() then Lib.HooksForFlightMapFrame:HookPins() end
end






---@class HooksForFlightMapFrame
local HooksForFlightMapFrame = {}
Lib.HooksForFlightMapFrame = HooksForFlightMapFrame

function HooksForFlightMapFrame:GetFlightPathDataProvider()
	if self.FlightPathDataProvider then return self.FlightPathDataProvider end
	if not FlightMapFrame or not FlightMapFrame.dataProviders then return end
	for v,tr in pairs(FlightMapFrame.dataProviders) do  if v.AddFlightNode then  self.FlightPathDataProvider=v  return v end  end
end

function HooksForFlightMapFrame:GetLastSlotsData()
	local taxidata,taxidatabyslot = Lib:GetBlizNodesByEverything()
	return taxidatabyslot or {}
end

local hooked = {}
function HooksForFlightMapFrame:HookPins()
	local flightProvider = self:GetFlightPathDataProvider()
	if not flightProvider then return end

	local slotIndexToPin = flightProvider.slotIndexToPin
	if not slotIndexToPin then return end

	for i,pin in pairs(slotIndexToPin) do
		if not hooked[pin] then
			pin:HookScript("OnEnter",function(...) HooksForFlightMapFrame:FlightMapPinOnEnter(...) end)
			hooked[pin]=true
		end
	end
end

function HooksForFlightMapFrame:GetCurrentFlightMapPin()
	local flightProvider = self:GetFlightPathDataProvider()  if not flightProvider then return end
	local slotIndexToPin = flightProvider.slotIndexToPin
	if not slotIndexToPin then return end

	for i,pin in pairs(slotIndexToPin) do
		if pin.taxiNodeData and pin.taxiNodeData.state==Enum.FlightPathState.Current then return pin end
	end
end

function HooksForFlightMapFrame:FlightMapPinOnEnter(mousePin)
	local flightProvider = self:GetFlightPathDataProvider()  if not flightProvider then return end

	--local currentNodeData = self:FindTaxiByNodeID(currentPin.taxiNodeData.nodeID)
	--if not currentNodeData then Lib:Debug("Can't find current taxi data :( node id "..currentPin.taxiNodeData.nodeID) return end
	local mouseNodeID = mousePin.taxiNodeData.nodeID
	local totaltime = Lib:GetTotalFlightTimeTo(mouseNodeID)

	if totaltime and totaltime>0 then
		GameTooltip:AddLine((Lib.ZGLOGO.." Est. flight time: |cffffffff%d:%02d"):format(totaltime/60,totaltime%60))
	end
	
	if ZGV.DEV then
		local mouseNodeData = Lib:FindTaxiByNodeID(mouseNodeID)
		if not mouseNodeData then Lib:Debug("Can't find mouse taxi data :( node id "..mouseNodeID) return end
	
		local mouseSlot = mousePin.taxiNodeData.slotIndex
		local hops = {}
		---@type {[number]:FlightMapTaxiPin}
		local slotIndexToPin = flightProvider.slotIndexToPin
		if not slotIndexToPin then return end
		
		-- mark unknown lines bold
		for hop = 1, GetNumRoutes(mouseSlot) do
			local sourceSlot = TaxiGetNodeSlot(mouseSlot, hop, true)
			local destinationSlot = TaxiGetNodeSlot(mouseSlot, hop, false)

			local startPin = slotIndexToPin[sourceSlot]
			local destinationPin = slotIndexToPin[destinationSlot]

			if hops[#hops]~=startPin.taxiNodeData.nodeID then tinsert(hops,startPin.taxiNodeData.nodeID) end
			tinsert(hops,destinationPin.taxiNodeData.nodeID)

			-- just checking if we have the nodes in data, we don't actually use any of that here
			local startNode = Lib:FindTaxiByNodeID(startPin.taxiNodeData.nodeID)
			local endNode = Lib:FindTaxiByNodeID(destinationPin.taxiNodeData.nodeID)
			if not startNode then Lib:Debug("What? No start node "..startPin.taxiNodeData.nodeID) return end
			if not endNode then Lib:Debug("What? No end node "..destinationPin.taxiNodeData.nodeID) return end
			if not startNode.taxicosts then Lib:Debug("What? No start node taxicosts? "..startPin.taxiNodeData.nodeID) return end

			local time,isPrecise = Lib:GetTaxiTripTime(startPin.taxiNodeData.nodeID,destinationPin.taxiNodeData.nodeID)
		
			if not isPrecise and not destinationPin.taxiNodeData.isMapLayerTransition then
				if ZGV.db.profile.taxi_print_unknowntimes then print((hop==1 and "|cffffdd00" or "|cffff0000").."Unknown time ["..hop.."]: "..startPin.taxiNodeData.name.." to "..destinationPin.taxiNodeData.name) end

				-- thicken unknown lines
				local lineContainer = flightProvider.backgroundLinePool:Acquire();
				lineContainer.Fill:SetStartPoint("CENTER", startPin);
				lineContainer.Fill:SetEndPoint("CENTER", destinationPin);
				lineContainer.Fill:SetThickness(300)
				lineContainer:Show();
			end
		end

		GameTooltip:AddLine(("|cffffdd00(DEV) Node ID: %d"):format(mousePin.taxiNodeData.nodeID))

		local missingtimes={}
		if mouseNodeData.taxicosts then for node,time in pairs(mouseNodeData.taxicosts) do  if time==0 then  tinsert(missingtimes,type(node)=="table" and node.name or node) end  end  end  --node may stay a number, wtf
		if #missingtimes>0 then GameTooltip:AddLine(("|cffff5500(DEV) Missing times: %d (%s)"):format(#missingtimes,table.concat(missingtimes,", "))) end
	end
	GameTooltip:Show()
end

function HooksForFlightMapFrame:DEV_HighlightIncompletePins()
	local provider = self:GetFlightPathDataProvider() 
	local pins = provider and provider.slotIndexToPin
	if not pins then return end
	for slot,pin in pairs(pins) do
		local node = Lib:FindTaxiByNodeID(pin.taxiNodeData.nodeID)
		if node then
			local missingtimes = 0
			if node.taxicosts then for ni,nt in pairs(node.taxicosts) do if nt==0 then missingtimes=missingtimes+1 end end end
			if missingtimes>0 then pin.Icon:SetVertexColor(1,0,0,1) end
		end
	end
end



---@class HooksForTaxiFrame
local HooksForTaxiFrame = {}
Lib.HooksForTaxiFrame = HooksForTaxiFrame

function HooksForTaxiFrame:GetLastSlotsData()
	local taxidata,taxidatabyslot = Lib:GetBlizNodesByEverything()
	return taxidatabyslot or {}
end

local already_hooked
function HooksForTaxiFrame:HookButtons()
	if already_hooked then return end
	hooksecurefunc("TaxiNodeOnButtonEnter",function(...) HooksForTaxiFrame:ClassicTaxiButtonOnEnter(...) end)
	already_hooked=true
end

---@return Button?
function HooksForTaxiFrame:GetCurrentTaxiMapButton() --Classic
	local currentSlot = Lib:GetCurrentTaxiSlot()
	if currentSlot then return _G['TaxiButton'..currentSlot] end
end

function HooksForTaxiFrame:ClassicTaxiButtonOnEnter(mouseButton)
	local GameTooltip=GameTooltip

	local currentSlot = Lib:GetCurrentTaxiSlot()  if not currentSlot then print("no current taxi slot") return end

	local taxis,taxisbyslots,taxisbynodeid = Lib:GetBlizNodesByEverything()
	local mouseSlot = mouseButton:GetID()
	local mouseNode = taxisbyslots[mouseSlot]

	if not mouseNode then return end

	local totaltime = Lib:GetTotalFlightTimeTo(mouseNode.nodeID)
	if totaltime and totaltime>0 and GameTooltip:IsShown() then
		GameTooltip:AddLine((Lib.ZGLOGO.." Est. flight time: |cffffffff%d:%02d"):format(totaltime/60,totaltime%60))
		GameTooltip:Show()
	end

	if ZGV.DEV then
		local route = Lib.lastRoutesFromCurrent[mouseNode.nodeID]
		if route then
			for hop=1,#route-1 do
				local time,isPrecise = Lib:GetTaxiTripTime(route[hop],route[hop+1])
				if not isPrecise then
					local startNode = taxisbynodeid[route[hop]]
					local endNode = taxisbynodeid[route[hop+1]]
					if ZGV.db.profile.taxi_print_unknowntimes then print((hop==1 and "|cffffdd00" or "|cffff0000").."Unknown time ["..hop.."]: "..startNode.name.." to "..endNode.name) end
				end
			end
		end

		GameTooltip:AddLine(("Node ID: %s, slot %d"):format(mouseNode.nodeID or "?", mouseSlot))
	end
	GameTooltip:Show()
end



---@alias TaxiNodeID number
---@alias TaxiSlot number

---@alias TaxiOperator "blackcat"|"nightsaber"|"ferry"|"seahorse"|"skyguard"|"animaflow"|"ancientwaygate"|"argusportal"|"eternalgateway"|"zerethportal"|"zerethlocus"

---@alias BlizzTaxiNodeState
---|0 -- current
---|1 -- reachable
---|2 -- unreachable

---@class TaxiNode
---@field name string
---@field faction "A"|"H"|"B"
---@field factionid number?
---@field x number
---@field y number
---@field npc string?
---@field npcid number|string?
---@field taxinodeID TaxiNodeID
---@field taxioperator TaxiOperator?
---@field recheck boolean?
---@field cond_fun function?
---@field known_fun function?
---@field quest number?
---@field region string?
---@field taxicosts {[number]:number}?
---@field known boolean?
---@field questknown number?

---@class LibRoverTaxiNode : TaxiNode
---@field m number
---@field x number
---@field y number
	
---@class BlizzVector2D
---@field x number
---@field y number

---@class BlizzTaxiNode
---@field name string
---@field nodeID TaxiNodeID
---@field position BlizzVector2D

---@alias BlizzTaxiNodeOnTaxiMap MapTaxiNodeInfo
----@class BlizzTaxiNodeOnTaxiMap : BlizzTaxiNode
----@field isMapLayerTransition boolean
----@field slotIndex TaxiSlot
----@field state BlizzTaxiNodeState
----@field useSpecialIcon boolean

---@class BlizzTaxiNodeOnWorldMap : BlizzTaxiNode
---@field isUndiscovered boolean
---@field faction number
---@field atlasName string

---@class FlightMapTaxiPin
---@field taxiNodeData BlizzTaxiNodeOnTaxiMap
