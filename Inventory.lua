-- Interaction with merchants, handling items in bags

local tinsert,tremove,print,ipairs,pairs,wipe=tinsert,tremove,print,ipairs,pairs,wipe
local CHAIN = ZGV.ChainCall
local L = ZGV.L

ZGV.Inventory = {}
local Inventory = ZGV.Inventory
Inventory.Items = {}

local PlayerName = UnitName("player")


-- Move viewer next to vendor frame if covered by it.
-- Called from vendor goaltype
function Inventory:AttachViewerVendor()
	if not ZGV.db.profile.repositionviewer then return end

	local frame = ZGV.Frame:GetParent()

	if (frame:GetLeft() < MerchantFrame:GetRight()) and (frame:GetTop()<MerchantFrame:GetTop() and frame:GetTop()>MerchantFrame:GetBottom()) then
		ZGV.F.SaveFrameAnchor(frame,"frame_anchor_prevendor")
		frame:ClearAllPoints()
		frame:SetPoint("LEFT",MerchantFrame,"RIGHT")
	end
end

-- Move viewer back to original position
function Inventory:DetachViewerVendor()
	if not ZGV.db.profile.repositionviewer then return end

	if ZGV.db.profile.frame_anchor_prevendor then
		ZGV.F.SetFrameAnchor(ZGV.Frame:GetParent(),ZGV.db.profile.frame_anchor_prevendor)
	end
end

-------------------------------------------------------------------------------
--------- Trash items action button
-------------------------------------------------------------------------------

function Inventory:GetGrayTrashDetails()
	local itemList = {}
	local cheapest
	for bagID=0, NUM_BAG_SLOTS do
		for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do
			local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
			if itemLink then
				local itemID = ZGV.ItemLink.GetItemID(itemLink)
				local itemName, _, itemRarity, _, _, _, _, _, _, itemTexture, itemSellPrice = ZGV:GetItemInfo(itemLink)
				local info = C_Container.GetContainerItemInfo(bagID, bagSlotID)
				if itemRarity==0 and not ZGV.db.char.keptItems[itemID] then
					table.insert(itemList, {bagID, bagSlotID, itemName, itemID, info.stackCount, info.stackCount*itemSellPrice, itemTexture})
				end
			end
		end
	end

	table.sort(itemList, function(a,b) return a[6]<b[6] end)

	return itemList
end

-- Items to keep, at user's request.
function Inventory:addKeptItem(itemID)
	ZGV.db.char.keptItems[itemID]=true
	ZGV.ActionBar:SetActionButtons() -- to refresh 
end


function Inventory:HandleTrashMacro()
	local items = ZGV.Inventory:GetGrayTrashDetails()
	local item = items and items[1]
	if not item then return end

	local mousebutton = GetMouseButtonClicked()
	if mousebutton=="LeftButton" and IsShiftKeyDown() then
		ZGV.Inventory:DestroyItem(item) 
	elseif mousebutton=="RightButton" then
		ZGV.Inventory:addKeptItem(item[4])
	end
end

function Inventory:DestroyItem(object)
	local bagID, bagSlotID, itemName, itemID, count, price, zygor_texture = unpack(object)
	if not (bagID and bagSlotID) then return end
	local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
	if itemLink then
		local BagitemID = ZGV.ItemLink.GetItemID(itemLink)
		if BagitemID==itemID then
			C_Container.PickupContainerItem(bagID, bagSlotID)
			DeleteCursorItem()

			GameTooltip:Hide()
			ZGV.ActionBar.TrashButton.tooltip = L["actionbar_trash_destroying"]
		end
	end
end

-------------------------------------------------------------------------------
--------- Useless items detection
-------------------------------------------------------------------------------

function Inventory:IsTravelItem(itemid)
	if not LibRover and LibRover.data and LibRover.data.portkeys then return false end
	
	for _,item in ipairs(LibRover.data.portkeys) do
		if item.item==itemid then return true end
	end
	return false
end

local blacklist = {
	[2901] = true,  -- mining pick
	[1819] = true,  -- gouging pick
	[5956] = true,  -- blacksmith hammer
	[6367] = true,  -- big iron fishing pole
	[19970] = true, -- arcanite fishing pole
	[6365] = true,  -- strong fishing pole
	[6256] = true,  -- fishing pole
	[6366] = true,  -- darkwood fishing pole
	[12225] = true, -- blump family fishing pole
	[7005] = true,  -- skinning knife
	[2709] = true,  -- pips skinner
	[9901] = true,  -- zulian slicer
}

-- Returns items deemed to be unusable.
function Inventory:GetUnusableItems()
	local Upgrades = ZGV.ItemScore.Upgrades
	local itemsList = {}
	local onlyscan
	Upgrades:ScanBagsForUpgrades(onlyscan)
	--Upgrades:ScanBagsForUpgradesForAlts()

	for bagID=0, NUM_BAG_SLOTS do
		for bagSlotID=1,C_Container.GetContainerNumSlots(bagID) do repeat
			if not (C_Container and C_Container.GetContainerItemEquipmentSetInfo and C_Container.GetContainerItemEquipmentSetInfo(bagID,bagSlotID)) then -- don't sell equipment sets
				local itemLink = C_Container.GetContainerItemLink(bagID,bagSlotID)
				if itemLink then
					local itemdetails = ZGV.ItemScore:GetItemDetails(itemLink)
					if not itemdetails then break end  --continue
					local stripped_itemlink = ZGV.ItemScore.strip_link(itemLink)
					local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture, itemSellPrice = ZGV:GetItemInfo(itemLink)

					local isSoulbound = ZGV.IsItemBound(bagID, bagSlotID)
					local id = ZGV.ItemLink.GetItemID(itemLink)

					local isUpgrade,_,_,_,rejectedUpgrade = Upgrades:IsUpgrade(stripped_itemlink)
					--isUpgrade = isUpgrade or Upgrades:IsUpgradeForAlt(stripped_itemlink)
					isUpgrade = isUpgrade or Upgrades:IsUpgradeForOffspec(stripped_itemlink)

					local fam,fmax=0,0
					if id then fam,fmax = ZGV.ItemScore.Upgrades:GetItemUniqueness(id) end
					
					if id	and ((isSoulbound  and not (isUpgrade or rejectedUpgrade=="rejected")) or (itemRarity==1 and not isUpgrade))		-- sell non-upgrades that are bound or white
						and (itemSellPrice or 0) > 0								-- that have sell price
						and (itemdetails.class==Enum.ItemClass.Weapon or itemdetails.class==Enum.ItemClass.Armor) -- are weapon/armor
						and ((not ZGV.db.char.keptItems) or ZGV.db.char.keptItems[id]==nil)			-- not blacklisted by user
						and (not blacklist[id])									-- nor by us
						and itemRarity<5									-- and don't even look at legendaries
						and fam~=473										-- or their precursors
						and not Inventory:IsTravelItem(id)							-- or item used by travel system
					then
						local item = {}
						item.ID=id
						item.bagID=bagID
						item.bagSlotID=bagSlotID
						item.itemName=itemName
						item.itemLink=itemLink
						item.itemQuality=itemRarity
						table.insert(itemsList, item)
					end
				end
			end
		until true  end
	end
	table.sort(itemsList,function(a,b) return a.itemName<b.itemName end)
	
	return itemsList
end


-------------------------------------------------------------------------------
--------- Gray items vendor selling
-------------------------------------------------------------------------------

function Inventory:SetUpGreySellButton()
	if self.greysellbutton then return end
	self.greysellbutton = CHAIN(CreateFrame("Button", "ZygorGuidesViewerSellButton", MerchantFrame, "UIPanelButtonTemplate"))
		:SetPoint("TOPLEFT", 60, -30)
		:SetWidth(100)
		:SetText(L['loot_sellgreybutton'])
		:SetScript("OnClick",Inventory.SellGreyItems)
	.__END
end

local loot_sellgreyitems_blacklist = { -- some items are breaking auto sell for some reason. blacklist them
	[158178]=true, -- mangled-tortollan-scroll
	[167873]=true, -- remnant-of-the-void
}

local function loot_sellgreyitems_thread() --Auto Sell Grey Items
	local attempt = 0
	while true do
		if not MerchantFrame:IsVisible() then ZGV:Print("Selling of grey items interrupted. Results may not be accurate.") break end
		local grays = 0
		for bag=0, NUM_BAG_SLOTS do
			for slot=1, C_Container.GetContainerNumSlots(bag) do
				if not MerchantFrame:IsVisible() then break end
				local itemID=C_Container.GetContainerItemID(bag,slot)
				if itemID  then
					local itemInfo = C_Container.GetContainerItemInfo(bag,slot)
					if not loot_sellgreyitems_blacklist[itemID] then
						local price=select(11,ZGV:GetItemInfo(itemID))
						--local classID=select(12,ZGV:GetItemInfo(itemID))
						if itemInfo.quality==0 then -- and classID~=Enum.ItemClass.Questitem 
							grays = grays + 1
							if price > 0 then
								C_Container.UseContainerItem(bag,slot) -- Will use an item and since vendor is open, will sell the item.
								coroutine.yield()
							end
						end
					end
				end
			end
			coroutine.yield()
		end
		attempt = attempt + 1
		if grays == 0 then break end
		if attempt == 50 then break end
	end
	
	-- report and exit
	if not MerchantFrame:IsVisible() then ZGV:Print("Selling of grey items interrupted. Results may not be accurate.") end
	if Inventory.SellingGreyTotal>0 then
		for i,v in pairs(Inventory.SellingGreyStatus) do
			ZGV:Print(v)
		end
		ZGV:Print(L['loot_sellgreys_total']:format(GetMoneyString(Inventory.SellingGreyTotal)))
	end
end

Inventory.SellingGreyStatus = {}
function Inventory:SellGreyItems() --Auto Sell Grey Items
	table.wipe(Inventory.SellingGreyStatus)
	Inventory.SellingGreyTotal=0

	-- gather info
	for bag=0, NUM_BAG_SLOTS do
		for slot=1, C_Container.GetContainerNumSlots(bag) do
			local item=C_Container.GetContainerItemID(bag,slot)
			if item  then
				local itemInfo = C_Container.GetContainerItemInfo(bag,slot)
				if itemInfo.quality==0 and not noValue then
					local price=select(11,ZGV:GetItemInfo(item))
					local classID=select(12,ZGV:GetItemInfo(item))
					if itemInfo.quality==0 and classID~=Enum.ItemClass.Questitem and price > 0 then
						table.insert(Inventory.SellingGreyStatus,L['loot_sellgreys_sold']:format(itemInfo.hyperlink,itemInfo.stackCount,GetMoneyString(price*itemInfo.stackCount)))
						Inventory.SellingGreyTotal = Inventory.SellingGreyTotal + price*itemInfo.stackCount
					end
				end
			end
		end
	end

	-- work
	Inventory.SellingGreyThread = coroutine.create(loot_sellgreyitems_thread)
	Inventory.SellingGreyTimer = ZGV:ScheduleRepeatingTimer(function()
		local ok,ret = coroutine.resume(Inventory.SellingGreyThread)
		if coroutine.status(Inventory.SellingGreyThread)=="dead" then 
			ZGV:CancelTimer(Inventory.SellingGreyTimer) 
		end
	end,
	0.1)
end

-------------------------------------------------------------------------------
--------- Buy guide items
-------------------------------------------------------------------------------

function Inventory:FindItemsToBuyDelayed(delay) 
	ZGV:CancelTimer(Inventory.FindeItemsTimer)
	Inventory.FindeItemsTimer = ZGV:ScheduleTimer(function() Inventory:FindItemsToBuy() end,delay or 0.1)
end



function Inventory:FindItemsToBuy()
	ZGV.NotificationCenter:RemoveEntry("goldbuy")

	if not (ZGV.db.profile.autobuy and ZGV.db.profile.enable_vendor_tools) then return end
	if not (MerchantFrame and MerchantFrame:IsVisible()) then return end
	if not ZGV.CurrentStep then return end

	local goals=ZGV.CurrentStep.goals
	local totalCost,neededSlots = 0,0
	local id

	self.ItemsToBuy = self.ItemsToBuy or {}
	wipe(self.ItemsToBuy)

	-- get list of needed items from current step
	for _,goal in ipairs(ZGV.CurrentStep.goals) do while(1) do
		-- is incomplete buy
		if goal.action~="buy" or goal.status=="complete" or (goal.condition_visible and not goal.condition_visible()) then break end	
		if not goal.targetid then break end

		--local complete, possible, done, needed = goal:IsComplete()
		local done, needed = goal.got, goal.count

		self.ItemsToBuy[goal.targetid] = self.ItemsToBuy[goal.targetid] or {amount=0, name=goal.target, itemid=goal.targetid}
		
		self.ItemsToBuy[goal.targetid].amount = self.ItemsToBuy[goal.targetid].amount + (needed - (done or 0))
		break
	end end

	ZGV:Debug("Trying to find items to buy")

	-- calculate space needed and find items at vendor
	for index=1,GetMerchantNumItems() do while(1) do 
		local merchItemName,_,costForOne,merchantStack,numAvail = GetMerchantItemInfo(index)
		local itemlink = GetMerchantItemLink(index)
		local itemid = itemlink and ZGV.ItemLink.GetItemID(itemlink)
		if not itemid then break end

		local item = self.ItemsToBuy[itemid]
		if not item then break end

		local maxStack = GetMerchantItemMaxStack(index)
		-- 

			-- do not do what the line that was removed was doing. bad juju. 
		if item.amount%maxStack == 0 then 
			neededSlots = neededSlots + floor(item.amount/maxStack)
		else 
			neededSlots = neededSlots + floor(item.amount/maxStack) + 1 
		end

		if costForOne==0 then break end -- item is not buyable with gold. abort
		if numAvail~=-1 and numAvail < item.amount then ZGV:Print(L['loot_autobuynostock']:format(name,item.amount)) return end
		
		totalCost = totalCost + item.amount*(costForOne/merchantStack)

		self.ItemsToBuy[itemid].index = index
		self.ItemsToBuy[itemid].maxStack = maxStack
		break
	end end
	if totalCost <= 0 then return end -- items dont exist in this step or are of a different type than gold
	
	ZGV:Debug("Found items")

	local playerMoney = GetMoney()
	if playerMoney >= totalCost then
		ZGV:Debug("Trying to buy items")
		local title,itemtext = L["notifcenter_loot_text"],""
		for name,item in pairs(self.ItemsToBuy) do 
			if item.index then
				itemtext = "|n"..itemtext..item.name.." x |cffff0000"..item.amount.."|r" 
			end
		end
		local text = L['loot_autobuyframetext']:format(itemtext,ZGV.GetMoneyString(totalCost))
		ZGV.NotificationCenter:AddEntry("goldbuy",title,text,{special=true, specialtext="Buy items", forcemode="detailed", displaytime=9999, transient=true, anchor={"LEFT",MerchantFrame,"RIGHT",0,0}})
	elseif playerMoney < totalCost then
		ZGV:Print(L['loot_autobuypoor']:format(ZGV.GetMoneyString(totalCost)))
	end
end

function Inventory:BuyItems()
	local items = {}
	for i,v in pairs(Inventory.ItemsToBuy) do table.insert(items,v) end
	table.sort(items,function(a,b) return (a.index or 0)>(b.index or 0) end)

	for name,item in ipairs(items) do
		if item.index then
			while item.amount > 0 do
				local buyAmount = item.amount

				if item.amount > item.maxStack then
					buyAmount = item.maxStack
				end
				if buyAmount<=0 then return end
				BuyMerchantItem(item.index,buyAmount)
				item.amount=item.amount-buyAmount
			end
		end
	end
	wipe(self.ItemsToBuy) -- wipe table after we are done
end


-------------------------------------------------------------------------------
--------- Free space in bags indicator
-------------------------------------------------------------------------------

function Inventory:SetUpBagspaceText()
	Inventory.BagSpaceText = CHAIN(MainMenuBarBackpackButton:CreateFontString(nil,"OVERLAY"))
		:SetPoint("BOTTOMRIGHT",-1,3)
		:SetHeight(13)
		:SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE")
		:SetText("")
	.__END
	Inventory.BagSpaceTextBG = CHAIN(MainMenuBarBackpackButton:CreateTexture(nil,"OVERLAY"))
		:SetPoint("LEFT")
		:SetPoint("RIGHT")
		:SetPoint("BOTTOM",0,3)
		:SetHeight(12)
		:SetTexture(ZGV.SKINSDIR.."white")
		:SetVertexColor(0,0,0,0.5)
	.__END

end

function Inventory:UpdateBagspaceText()
	if not ZGV.db.profile.showbagspace then
		Inventory.BagSpaceText:Hide()
		Inventory.BagSpaceTextBG:Hide()
		return
	end

	Inventory.BagSpaceText:Show()
	Inventory.BagSpaceTextBG:Show()

	local total,free = 0,0
	for bag=0,NUM_BAG_SLOTS do
		total = total + C_Container.GetContainerNumSlots(bag)
		free = free + C_Container.GetContainerNumFreeSlots(bag)
	end

	if free>10 then
		Inventory.BagSpaceText:SetFont("Fonts\\ARIALN.TTF",14,"OUTLINE")
	else
		Inventory.BagSpaceText:SetFont("Fonts\\ARIALN.TTF",16,"OUTLINE")
	end

	Inventory.BagSpaceText:SetText(free)
end





-------------------------------------------------------------------------------
--------- Recording of bag items
-------------------------------------------------------------------------------

local function recordbankbag(bagnum)
	local savedinventory = Inventory.Bankdata[PlayerName]
	for i=1,C_Container.GetContainerNumSlots(bagnum) do
		local link = C_Container.GetContainerItemLink(bagnum,i)
		local itemInfo = C_Container.GetContainerItemInfo(bagnum, i)
		if link then
			local _, _, _, _, _, classID, subclassID = C_Item.GetItemInfoInstant(link)

			link = ZGV.ItemLink.StripBlizzExtras(link,true)
			link = link:gsub("%[",""):gsub("%]","")
			table.insert(savedinventory,("item^%d^%d^%d^%d^%s^%d^%d"):format(bagnum,i,itemInfo.stackCount,itemInfo.iconFileID,link,classID,subclassID))
		end
	end
	local slots = C_Container.GetContainerNumSlots(bagnum)
	local free = C_Container.GetContainerNumFreeSlots(bagnum)

	return slots,free
end

Inventory.BankSlots = {-1,6,7,8,9,10,11,12}
if not ZGV.IsRetail then Inventory.BankSlots = {-1,6,7,8,9,10,11} end

function Inventory:RecordBank()
	local savedinventory = Inventory.Bankdata[PlayerName]
	table.wipe(savedinventory)

	local total_free,total_slots = 0,0
	local NUM_BAG_SLOTS = ZGV.IsRetail and 5 or NUM_BAG_SLOTS -- retail NBS is not updated to understand reagent bank

	for index,bagnum in ipairs(Inventory.BankSlots) do
		local slot = C_Container.ContainerIDToInventoryID(NUM_BAG_SLOTS + index-1)
		local bagtexture = GetInventoryItemTexture("player",slot)
		local baglink = GetInventoryItemLink("player",slot)
		local slots,free = recordbankbag(bagnum)

		total_free = total_free + free
		total_slots = total_slots + slots

		if bagnum == -1 then -- bank does not have a default icon for main frame, so lets put map tracking icon here
			bagtexture=136453
			baglink = "Bank"
		end
		if baglink then
			baglink = baglink:gsub("%[",""):gsub("%]","")
			table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(bagnum,bagtexture,slots,free,baglink))
		end
	end

	-- reagent bank
	if IsReagentBankUnlocked and IsReagentBankUnlocked() then
		local bagnum = -3
		local slots,free = recordbankbag(bagnum)
		local baglink = "Reagent Bank"
		table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(bagnum,136453,slots,free,baglink))
	end

	-- warband bank
	if ZGV.IsRetail then
		local tabDataFetched = C_Bank.FetchPurchasedBankTabData(Enum.BankType.Account)
		for _,tabData in ipairs(tabDataFetched) do
			local slots,free = recordbankbag(tabData.ID)
			table.insert(savedinventory,("bag^%d^%d^%d^%d^%s"):format(tabData.ID,tabData.icon,slots,free,ACCOUNT_BANK_PANEL_TITLE.." "..tabData.name))
		end
	end

	table.insert(savedinventory,("meta^%d^%d^%d"):format(time(),total_slots,total_free))
	ZGV:SendMessage("INVENTORY_BANK_UPDATED")
end

function Inventory:CharacterBankKnown()
	if Inventory.Bankdata[PlayerName] and Inventory.Bankdata[PlayerName][1] then return true end
	return false
end

local temp,names = {},{}
function Inventory:ParseBank(ident)
	table.wipe(temp)
	table.wipe(names)
	if not ident then return temp end
	if not Inventory.Bankdata then return temp end -- too soon, you called us too soon

	if ident=="*" then
		for n,_ in pairs(Inventory.Bankdata) do
			table.insert(names,n)
		end
	else
		table.insert(names,ident)
	end

	for _,character in ipairs(names) do
		local entries = Inventory.Bankdata[character]
		if not entries then return temp end

		temp[character] = {}
		
		for _,line in ipairs(entries) do
			local type,arg1,arg2,arg3,arg4,arg5,arg6,arg7 = strsplit("^",line)
			if type=="item" then
				local bag=tonumber(arg1)
				local slot=tonumber(arg2)
				local name = arg5:match(".*%|h(.*)%|h.*")
				temp[character][bag] = temp[character][bag] or {}
				temp[character][bag][slot] = {type="item", link=arg5, name=name, icon=tonumber(arg4), count=tonumber(arg3), class=tonumber(arg6), subclass=tonumber(arg7), bag=bag, slot=slot, owner=character}
			elseif type=="bag" then
				local bag = tonumber(arg1)
				temp[character][bag] = temp[character][bag] or {}
				temp[character][bag].bag = {type="bag", link=arg5, name=name, texture=tonumber(arg2), slots=tonumber(arg3), free=tonumber(arg4), bag=bag, owner=character}
			elseif type=="meta" then
				local timestamp = tonumber(arg1)
				local total_slots = tonumber(arg2)
				local total_free = tonumber(arg3)
				local timeobj = C_DateAndTime.GetCalendarTimeFromEpoch(timestamp*1000000)  -- seconds to microseconds
				local timestamp = FormatShortDate(timeobj.monthDay, timeobj.month, timeobj.year) .. " " .. GameTime_GetFormattedTime(timeobj.hour, timeobj.minute, true)

				temp[character].timestamp = timestamp
				temp[character].total_slots = total_slots
				temp[character].total_free = total_free	
			end
		end
		temp[character].character = name
	end
	return temp
end

function Inventory:ParseBankSummary()
	if not (Inventory.BankContent and Inventory.BankContent[PlayerName]) then return {} end
	local summary = {}

	for bag,bagdata in pairs(Inventory.BankContent[PlayerName]) do
		if tonumber(bag) then
			for slot,slotdata in pairs(bagdata) do
				if tonumber(slot) then
					summary[slotdata.link] = (summary[slotdata.link] or 0) + slotdata.count
				end
			end
		end
	end

	return summary
end

function Inventory:CountBank(itemid)
	local found = 0
	for itemlink,count in pairs(Inventory.BankSummary) do
		if itemid == ZGV.ItemLink.GetItemID(itemlink) then
			found = found + count
		end
	end
	return found
end


-------------------------------------------------------------------------------
--------- Autorepair
-------------------------------------------------------------------------------

function Inventory:AutoRepair()
	if CanMerchantRepair() then
		local zgvgoldneeded = GetRepairAllCost()
		local zgvmoneyheld = GetMoney()
		local zgvcangbrepair = CanGuildBankRepair()
		local zgvgbankamount = GetGuildBankWithdrawMoney()

		if zgvgoldneeded==0 or ZGV.db.profile.autorepair==1 then return end
		if ZGV.db.profile.autorepair==2 or (not IsInGuild() and ZGV.db.profile.autorepair>2) then
			if (zgvgoldneeded <=zgvmoneyheld) then								---Use own money: has money
				RepairAllItems()
				ZGV:Print(L['im_ar_repairamount']..ZGV.GetMoneyString(zgvgoldneeded)..".")
			else																---Use own money: no money
				ZGV:Print(L['im_ar_cannotar'])
			end
		elseif ZGV.db.profile.autorepair==3 then
			if zgvcangbrepair and (zgvgbankamount >= zgvgoldneeded) then			---Use guild money, then own: can guild repair
				RepairAllItems(1)
				ZGV:Print(L['im_ar_repairamount']..ZGV.GetMoneyString(zgvgoldneeded)..L['im_ar_guild'])
			elseif zgvgoldneeded <=zgvmoneyheld then								---Use guild money, then own: cannot guild repair but has money
				RepairAllItems()
				ZGV:Print(L['im_ar_repairamount']..ZGV.GetMoneyString(zgvgoldneeded)..".")
			elseif not zgvcangbrepair then ZGV:Print(L['im_ar_noguildrepairs'])		---Use guild money, then own: no money, guild not allowed
			else																---Use guild money, then own: no guild, no money
				ZGV:Print(L['im_ar_cannotar2'])
			end
		elseif ZGV.db.profile.autorepair==4 then
			if zgvgoldneeded <=zgvmoneyheld then									---Use own money, then guild: has money
				RepairAllItems()
				ZGV:Print(L['im_ar_repairamount']..ZGV.GetMoneyString(zgvgoldneeded)..".")
			elseif zgvcangbrepair and (zgvgbankamount >= zgvgoldneeded) then		---Use own money, then guild: no money but has guild
				RepairAllItems(1)
				ZGV:Print(L['im_ar_repairamount']..ZGV.GetMoneyString(zgvgoldneeded)..L['im_ar_guild'])
			elseif not zgvcangbrepair then ZGV:Print(L['im_ar_noguildrepairs'])		---Use own money, then guild: no money, guild not allowed
			else																---Use own money, then guild: no money, no guild
				ZGV:Print(L['im_ar_cannotar2'])
			end
		end
	end
end

function Inventory.OnEvent(self, event)
	if event=="BAG_UPDATE_DELAYED" then
		Inventory:FindItemsToBuyDelayed() 
		Inventory:UpdateBagspaceText()
	elseif event=="MERCHANT_SHOW" then
		Inventory:SetUpGreySellButton()
		Inventory.greysellbutton:SetShown(ZGV.db.profile.showgreysellbutton)

		if ZGV.db.profile.autosell and ZGV.db.profile.enable_vendor_tools then Inventory:SellGreyItems() end
		--if ZGV.db.profile.autosellother and ZGV.db.profile.enable_vendor_tools then Inventory:SellUnusableItems() end

		Inventory.FindItemsToBuyMissedNames = false
		ZGV:ScheduleTimer(function()  -- MERCHANT_SHOW now fires before MerchantFrame is visible, delay till next onupdate
			Inventory:FindItemsToBuyDelayed() 
			Inventory:AutoRepair()
		end,0)
	elseif event=="MERCHANT_UPDATE" then
		Inventory:FindItemsToBuyDelayed(1) 	
	elseif event=="MERCHANT_CLOSED" then
		table.wipe(Inventory.ItemsToBuy)
		ZGV.NotificationCenter:RemoveEntry("goldbuy")
	elseif event=="BANKFRAME_OPENED" then
		Inventory:RecordBank()
	elseif event=="BANKFRAME_CLOSED" then
		Inventory.BankContent = Inventory:ParseBank(PlayerName)
		Inventory.BankSummary = Inventory:ParseBankSummary()
	elseif event=="BAG_UPDATE" then
		if BankFrame and BankFrame:IsVisible() then
			Inventory:RecordBank()
		end
	elseif event=="ZGV_STEP_FINALISED" or event=="ZGV_GOAL_COMPLETED" or event=="ZGV_GOAL_UNCOMPLETED" then
		Inventory:FindItemsToBuyDelayed() 
	end
end



tinsert(ZGV.startups,{"InventoryManager setup",function(self)
	ZGV.db.char.keptItems = ZGV.db.char.keptItems or {}
	if ZGV.IsRetail then
		Inventory.Bankdata = ZGV.db.realm.bankdata
	else
		Inventory.Bankdata = ZGV.db.factionrealm.bankdata
	end

	Inventory.Bankdata[PlayerName] = Inventory.Bankdata[PlayerName] or {}

	ZGV:AddEventHandler("MERCHANT_SHOW",Inventory.OnEvent)
	ZGV:AddEventHandler("MERCHANT_CLOSED",Inventory.OnEvent)
	ZGV:AddEventHandler("MERCHANT_UPDATE",Inventory.OnEvent)
	ZGV:AddEventHandler("BANKFRAME_OPENED",Inventory.OnEvent)
	ZGV:AddEventHandler("BANKFRAME_CLOSED",Inventory.OnEvent)
	ZGV:AddEventHandler("BAG_UPDATE",Inventory.OnEvent)
	ZGV:AddEventHandler("BAG_UPDATE_DELAYED",Inventory.OnEvent)
	ZGV:AddEventHandler("PLAYERBANKSLOTS_CHANGED",Inventory.OnEvent)
	ZGV:AddEventHandler("MAIL_SHOW",Inventory.OnEvent)

	Inventory:SetUpBagspaceText()
	Inventory:UpdateBagspaceText()

	Inventory.ItemsToBuy = {}

	ZGV:AddMessageHandler("ZGV_STEP_FINALISED",Inventory.OnEvent)
	ZGV:AddMessageHandler("ZGV_GOAL_COMPLETED",Inventory.OnEvent)
	ZGV:AddMessageHandler("ZGV_GOAL_UNCOMPLETED",Inventory.OnEvent)

	Inventory.BankContent = Inventory:ParseBank(PlayerName)
	Inventory.BankSummary = Inventory:ParseBankSummary()

	ZGV:SendMessage("INVENTORY_STARTUP_DONE")
end})

local invslots = {'AmmoSlot','BackSlot','Bag0Slot','Bag1Slot','Bag2Slot','Bag3Slot','ChestSlot','FeetSlot','Finger0Slot','Finger1Slot','HandsSlot','HeadSlot','LegsSlot','MainHandSlot','NeckSlot','SecondaryHandSlot','ShirtSlot','ShoulderSlot','TabardSlot','Trinket0Slot','Trinket1Slot','WaistSlot','WristSlot'}
if not ZGV.IsRetail then table.insert(invslots,'RangedSlot') end
ZGV.Inventory.InvSlots = invslots
