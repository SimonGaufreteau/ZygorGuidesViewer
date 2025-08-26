local name,ZGV = ...

ZGV.TooltipScanner = {}
local TS = ZGV.TooltipScanner

if C_TooltipInfo then
	local function parse_data(data)
		local results = {}
		if data then
			for line,linedata in ipairs(data.lines) do
				table.insert(results,linedata.leftText)
				if linedata.rightText and linedata.rightText~="" then
					table.insert(results,linedata.rightText)
				end
			end
		end
		return results
	end
	
	function TS:GetTooltip(itemlink)
		local data = C_TooltipInfo.GetHyperlink(itemlink)
		return parse_data(data)
	end

	function TS:GetQuestLogItem(type,index,quest)
		local data = C_TooltipInfo.GetQuestLogItem(type,index,quest)
		if data then return data.hyperlink end
	end

	function TS:GetSpellTooltip(spellID)
		local data = C_TooltipInfo.GetSpellByID(spellID)
		return parse_data(data)
	end

	function TS:GetUnit(token)
		local data = C_TooltipInfo.GetUnit(token)
		return parse_data(data)
	end
		

else
	local Gratuity = LibStub("LibGratuity-3.0")

	local function parse_data()
		local results = {}
		if Gratuity:NumLines()==0 then return results end

		for num=1,Gratuity:NumLines() do
			local line=Gratuity:GetLine(num)

			if not line then return results,0 end
			if line==RETRIEVING_ITEM_INFO then return results end

			line = line:gsub("|c........",""):gsub("|r","") -- strip color codes, if any

			table.insert(results,line)
		end
		return results
	end

	function TS:GetTooltip(itemlink)
		Gratuity:SetHyperlink(itemlink)
		return parse_data()
	end

	function TS:GetQuestLogItem(type,index,quest)
		Gratuity:SetQuestLogItem(type,index,quest)
		return select(2,Gratuity.vars.tooltip:GetItem())
	end

	function TS:GetUnit(token)
		Gratuity:SetUnit(token)
		return parse_data()
	end

end