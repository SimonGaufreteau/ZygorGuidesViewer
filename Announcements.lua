local name,ZGV = ...

local tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil=tinsert,tremove,print,ipairs,pairs,wipe,floor,ceil

local Announce = {}
ZGV.Announcements = Announce

local L = ZGV.L
local FONT=ZGV.Font
local FONTBOLD=ZGV.FontBold
local ui = ZGV.UI
local SkinData = ui.SkinData
local CHAIN = ZGV.ChainCall

function Announce:Initialise()
	ZGV:AddEventHandler("PLAYER_LEVEL_UP",function() Announce:SendMessage() end)
end

function Announce:FormatTime(seconds)
	local days = seconds / 86400
	local hours = seconds % 86400 / 3600
	local minutes = seconds % 3600 / 60

	if days >= 1 then
		return ("%01d days %01d hours %01d minutes"):format(days,hours,minutes)
	elseif hours >= 1 then
		return ("%01d hours %01d minutes"):format(hours,minutes)
	else
		return ("%01d minutes"):format(minutes)
	end
end


function Announce:FormatMessage()
	local timeplayed = ZGV.db.char.timeperlevel
	local levelfrom = UnitLevel("player")
	local levelto = UnitLevel("player") + 1

	local message = ("{triangle} Zygor Guides: I just leveled up from %s to %s! (%s)"):format(levelfrom,levelto,Announce:FormatTime(timeplayed[levelfrom]))

	return message
end

function Announce:SendMessage()
	if not ZGV.db.profile.spam_levelup then return end

	local message = Announce:FormatMessage()
		
	if ZGV.db.profile.spam_levelup_emote then SendChatMessage(message, "EMOTE") end
	if ZGV.db.profile.spam_levelup_party then SendChatMessage(message, "PARTY") end
	if ZGV.db.profile.spam_levelup_guild then SendChatMessage(message, "GUILD") end

end

tinsert(ZGV.startups,{"Announcements startup",function(self)
	Announce:Initialise()
end})