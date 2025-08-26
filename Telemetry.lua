local _n,ZGV = ...

---@class Telemetry

--- @alias TelemetryEventType
 ---| 'GUIDES_LOADED' # tabs: array of guides currently loaded, current: current guide
 ---| 'SHARE_STATE' # state: master, slave, party, solo
 ---| 'OPTIONS' # uiscale
 ---| 'WINDOW_STATE' # visible
 ---| 'STARTUP' # 
 ---| 'SHUTDOWN' # 
 ---| 'CLICKED_GOAL' # button: button, goalnum: number of goal
 ---| 'CLICKED_PROGRESSBAR' # 
 ---| 'STEPS_COMPLETED' # interval: time; num: step count
 ---| 'MAINMENU_ITEM' # item: name
 ---| 'ADDITIONALMENU_ITEM' # item: name
 ---| 'BUTTON_CLICKED' # item: name
--

--- @alias TelemetryHookTriggerType
---| "message"
---| "event"

---@alias TelemetryEvent { time:number,event:TelemetryEventType }

---@alias TelemetryHookTrigger { [1]:TelemetryHookTriggerType, [2]:string }
---@class TelemetryHook
 ---@field triggers TelemetryHookTrigger[]
 ---@field func fun(t:Telemetry,event?:string,...):nil
 ---@field autostart boolean
 ---@field init fun(t:Telemetry):nil
 ---@field final fun(t:Telemetry):nil


---@class Telemetry
local Telemetry = {}
ZGV.Telemetry = Telemetry

local T  ---@type TelemetryEvent[]
function Telemetry:Setup()
	ZGV.db.char.telemetry = ZGV.db.char.telemetry or {}  --[[@as TelemetryEvent[] ]]
	T = ZGV.db.char.telemetry 
	setmetatable(T,{__itemname=function(t) return ("%d min ago: %s %s"):format((time()-t.time)/60,t.event,(t.state~=nil and tostring(t.state) or t.num)) end})
	self:Prune()
	self:SetupEvents()
end

local MAX_EVENT_AGE=7*86400
function Telemetry:Prune()
	local now = time()
	while T[1] and now-T[1].time>MAX_EVENT_AGE do tremove(T,1) end
end

--- @param eventType TelemetryEventType
--- @param args table?
--- Records an event.
function Telemetry:AddEvent(eventType,args)
	local event = {time=time(),event=eventType}		---@type TelemetryEvent
	if args then for k,v in pairs(args) do event[k]=v end end
	tinsert(T,event)
end


function Telemetry:SetupEvents()
	for k,hook in ipairs(self.Hooks) do
		if hook.triggers then
			for _,trigger in ipairs(hook.triggers) do
				local typ,name = trigger[1],trigger[2]
				if typ=="message" then ZGV:AddMessageHandler(name,{self,hook.func})
				elseif typ=="event" then ZGV:AddEventHandler(name,{self,hook.func})
				else error("bad trigger type: "..tostring(typ)) end
			end
		end
		if hook.autostart then hook.func(self) end
		if hook.init then hook.init(self) end
	end
end

---@type TelemetryHook[]
Telemetry.Hooks = {
	{ -- STARTUP
		func=function (self)
			self:AddEvent('STARTUP')
		end,
		autostart=true,
	},
	{ -- SHUTDOWN
		triggers={{"event","PLAYER_LOGOUT"}},
		func=function (self)
			self:AddEvent('SHUTDOWN')
		end
	},
	{ -- GUIDES_LOADED
		triggers={{"message","GUIDE_CHANGED"}},
		func=function (self)
			self:AddEvent('GUIDES_LOADED',{
				tabs=ZGV.db.char.tabguides,
				current={title=ZGV.CurrentGuide and ZGV.CurrentGuide.title or "none",step=ZGV.CurrentStepNum or "none"}
			})
		end
	},
	{ -- SHARE_STATE
		triggers={{"message","ZGV_SHAREMODE"},{"event","GROUP_ROSTER_UPDATE"}},
		autostart=true,
		func=function (self)
			local shareState =
				(ZGV.Sync:IsMaster() and "master")
				or (ZGV.Sync:IsSlave() and "slave")
				or (GetNumGroupMembers()>0 and "party")
				or "solo"
			if shareState==self.lastShareState then return end  -- prevent spam when in a raid
			self:AddEvent('SHARE_STATE',{state=shareState})
			self.lastShareState=shareState
		end
	},
	{ -- WINDOW_STATE
		triggers={{"message","WINDOW_SHOWN"}},
		func=function (self)
			local windowState = ZGV.Frame:IsShown()
			if windowState==self.lastWindowState then return end
			self:AddEvent('WINDOW_STATE',{
				state=windowState
			})
			self.lastWindowState=windowState
		end
	},
	{ -- CLICKED_GOAL
		triggers={{"message","CLICKED_GOAL"}},
		func=function (self,ev,button,goalnum)
			self:AddEvent('CLICKED_GOAL',{
				button=button,
				goalnum=goalnum
			})
		end
	},
	{ -- CLICKED_PROGRESSBAR
		triggers={{"message","CLICKED_PROGRESSBAR"}},
		func=function (self,ev,state)
			self:AddEvent('CLICKED_PROGRESSBAR',{
				state=state
			})
		end
	},
	{ -- STEPS_COMPLETED
		triggers={{"message","STEP_COMPLETED"}},
		func=function (self)
			self.stepsCompleted = (self.stepsCompleted or 0)+1

		end,
		init=function (self)
			self.stepsCompleted=0
			local WrapUp = function ()
				self=Telemetry
				if self.stepsCompleted>0 then
					self:AddEvent("STEPS_COMPLETED",{
						num=self.stepsCompleted
					})
					self.stepsCompleted=0
				end
			end
			C_Timer.NewTicker(60,WrapUp)
			ZGV:AddEventHandler("PLAYER_LOGOUT",WrapUp)
		end,
	},
	{ -- OPTIONS
		autostart=true,
		func=function (self)
			self:AddEvent('OPTIONS',{
				uiscale=(GetCVar("useUiScale") or 0)=="1" and ("%2d%%"):format((GetCVar("uiscale") or 0)*100) or "off",
			})
		end
	},
	{ -- MAINMENU_ITEM, ADDITIONALMENU_ITEM
		triggers={{"message","MAINMENU_ITEM"},{"message","ADDITIONALMENU_ITEM"}},
		func=function (self,ev,itemname,state)
			self:AddEvent(ev,{
				item=itemname,
				state=state
			})
		end
	},
	{ -- BUTTON_CLICKED
		triggers={{"message","BUTTON_CLICKED"}},
		func=function (self,ev,itemname,button)
			self:AddEvent('BUTTON_CLICKED',{
				button=button,
				name=itemname,
			})
		end
	}
}


tinsert(ZGV.startups,{"Telemetry",function(self)
	Telemetry:Setup()
end})
