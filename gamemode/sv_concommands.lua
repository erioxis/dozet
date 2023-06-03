function GM:ConCommandErrorMessage(pl, message)
	pl:CenterNotify(COLOR_RED, message)
	pl:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
end

concommand.Add("zs_pointsshopbuy", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected() and sender:IsValidLivingHuman()) or #arguments == 0 then return end
	local usescrap = arguments[3]
	local midwave = GAMEMODE:GetWave() < GAMEMODE:GetNumberOfWaves() / 2 or GAMEMODE:GetWave() == GAMEMODE:GetNumberOfWaves() / 2 and GAMEMODE:GetWaveActive() and CurTime() < GAMEMODE:GetWaveEnd() - (GAMEMODE:GetWaveEnd() - GAMEMODE:GetWaveStart()) / 2
	if sender:IsSkillActive(SKILL_D_LATEBUYER) and not usescrap and midwave then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "late_buyer_warning"))
		return
	end
	if not sender.CanBuy and sender:HasTrinket("vir_pat") and not usescrap then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "vir_pat_warning"))
		return
	end
	local id = arguments[1]
	id = tonumber(id) or id
	local itemtab = FindItem(id)

	if sender:HasTrinket("sin_envy") and (FindItem(id).Tier and FindItem(id).Tier or 1) <= 4 then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "envy_taken"))
		return
	end

	if sender:HasTrinket("sin_pride") and ((FindItem(id).Tier and FindItem(id).Tier or 1) >= 4) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "pride_taken"))
		return
	end

	if not (usescrap or gamemode.Call("PlayerCanPurchase", sender)) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "cant_purchase_right_now"))
		return
	end
	
	if not itemtab or not itemtab.PointShop then return end
	if usescrap and itemtab.DontScrap then return end
	local itemcat = itemtab.Category
	if usescrap and not (itemcat == ITEMCAT_TRINKETS or itemcat == ITEMCAT_AMMO) and not itemtab.CanMakeFromScrap then return end

	local points = usescrap and sender:GetAmmoCount("scrap") or sender:GetPoints()
	local count_or_nil = arguments[2] or 1
	local cost = itemtab.Price * count_or_nil
	if GAMEMODE:IsClassicMode() and itemtab.NoClassicMode then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "cant_use_x_in_classic", itemtab.Name))
		return
	end

	if GAMEMODE.ZombieEscape and itemtab.NoZombieEscape then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "cant_use_x_in_zombie_escape", itemtab.Name))
		return
	end

	if itemtab.SkillRequirement and not sender:IsSkillActive(itemtab.SkillRequirement) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "x_requires_a_skill_you_dont_have", itemtab.Name))
		return
	end

	if itemtab.Tier and GAMEMODE.LockItemTiers and not GAMEMODE.ObjectiveMap and not GAMEMODE.ZombieEscape and not GAMEMODE:IsClassicMode() and GAMEMODE:GetNumberOfWaves() == GAMEMODE.NumberOfWaves and GAMEMODE:GetWave() + (GAMEMODE:GetWaveActive() and 0 or 1) < itemtab.Tier then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "tier_x_items_unlock_at_wave_y", itemtab.Tier, itemtab.Tier))
		return
	end

	if not GAMEMODE:HasItemStocks(id) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "out_of_stock"))
		return
	end
	local arsd = (sender.ArsenalDiscount or 1)
	cost = usescrap and math.ceil(GAMEMODE:PointsToScrap(cost * (sender.ScrapDiscount or 1))) or math.ceil(cost * arsd)

	if points < cost then
		timer.Create("buy"..itemtab.Name.."WARNING", 0.01,1, function()GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, usescrap and "need_to_have_enough_scrap" or "dont_have_enough_points")) end)
		return
	end

	if itemtab.Callback then
		itemtab.Callback( sender, count_or_nil )
	elseif itemtab.SWEP then
		if string.sub(itemtab.SWEP, 1, 6) ~= "weapon" then
			if GAMEMODE:GetInventoryItemType(itemtab.SWEP) == INVCAT_TRINKETS and sender:HasInventoryItem(itemtab.SWEP) then
				return
			else
				sender:AddInventoryItem(itemtab.SWEP)
			end
		elseif sender:HasWeapon(itemtab.SWEP) then
			local stored = weapons.Get(itemtab.SWEP)
			if stored and stored.AmmoIfHas then
				sender:GiveAmmo(stored.Primary.DefaultClip, stored.Primary.Ammo)
			else
				local wep = ents.Create("prop_weapon")
				if wep:IsValid() then
					wep:SetPos(sender:GetShootPos())
					wep:SetAngles(sender:GetAngles())
					wep:SetWeaponType(itemtab.SWEP)
					wep:SetShouldRemoveAmmo(true)
					wep:Spawn()
				end
			end
		else
			local wep = sender:Give(itemtab.SWEP)
			if wep and wep:IsValid() and wep.EmptyWhenPurchased and wep:GetOwner():IsValid() then
				if wep.Primary then
					local primary = wep:ValidPrimaryAmmo()
					if primary then
						sender:RemoveAmmo(math.max(0, wep.Primary.DefaultClip - wep.Primary.ClipSize), primary)
					end
				end
				if wep.Secondary then
					local secondary = wep:ValidSecondaryAmmo()
					if secondary then
						sender:RemoveAmmo(math.max(0, wep.Secondary.DefaultClip - wep.Secondary.ClipSize), secondary)
					end
				end
			end
		end


	else
		return
	end
    local scrapd = sender.ScrapDiscount or 1
	local buy = translate.ClientGet(sender,"ba_chat")
	if usescrap then
		sender:RemoveAmmo(math.ceil( cost ), "scrap")
		sender:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")
		timer.Create(buy..itemtab.Name, 0.01,1, function() sender:PrintTranslatedMessage(HUD_PRINTTALK, usescrap and "created_x_for_y_scrap" ,itemtab.Name, math.ceil(cost)) end)
	else
		sender:TakePoints( cost )
		if sender:IsSkillActive(SKILL_CASHBACK) then
			sender:GiveAmmo(math.ceil(cost*0.2), "scrap")
		end
		sender:SendLua("surface.PlaySound(\"ambient/levels/labs/coinslot1.wav\")")
		timer.Create(buy..itemtab.Name, 0.01,1, function() sender:PrintTranslatedMessage(HUD_PRINTTALK, "purchased_x_for_y_points", itemtab.Name, cost) end)
	end


	GAMEMODE:AddItemStocks(id, -1)

	if usescrap then
		local nearest = sender:NearestRemantler()
		if nearest then
			local owner = nearest.GetObjectOwner and nearest:GetObjectOwner() or nearest:GetOwner()
			if owner:IsValid() and owner ~= sender then
				if not sender:IsSkillActive(SKILL_SAMODOS) then
					local scrapcom = math.ceil(cost / 6)
					nearest:SetScraps(nearest:GetScraps() + scrapcom)
					nearest:GetObjectOwner():GiveAchievementProgress("grem", scrapcom)
					nearest:GetObjectOwner():CenterNotify(COLOR_GREEN, translate.ClientFormat(owner,"remantle_used", scrapcom)..sender:Nick())
				end
			end
		end
	else
		local nearest = sender:NearestArsenalCrateOwnedByOther()
		if nearest then
			local owner = nearest.GetObjectOwner and nearest:GetObjectOwner() or nearest:GetOwner()
			if owner:IsValid() then
				local commission = cost * GAMEMODE.ArsenalCrateCommission
				if commission > 0 then
					owner:AddPoints(commission, nil, nil, true)

					net.Start("zs_commission")
						net.WriteEntity(nearest)
						net.WriteEntity(sender)
						net.WriteFloat(commission)
					net.Send(owner)
				end
			end
		end
	end
end)
concommand.Add("zs_anti_pointsshopbuy", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected() and sender:IsValidLivingHuman()) or #arguments == 0 then return end
	local usescrap = arguments[2]
	local sigiled = false
	for _, sigil in pairs(ents.FindInSphere(sender:GetPos(), 200)) do
		if sigil:IsValid() and sigil.AntiSigil then
			sigiled = true
		end
	end
	if !sigiled then GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "no_anti_sigil")) return end
	

	local id = arguments[1]
	--print(id)
	id = tonumber(id) or id
	local itemtab = FindItem(id)
	


	if not (usescrap or gamemode.Call("PlayerCanPurchase", sender)) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "cant_purchase_right_now"))
		return
	end


	if not itemtab or not itemtab.APointShop then return end
	local itemcat = itemtab.Category
	if usescrap and not (itemcat == ITEMCAT_TRINKETS or itemcat == ITEMCAT_AMMO) and not itemtab.CanMakeFromScrap then return end

	local points = usescrap and sender:GetAmmoCount("scrap") or sender:GetPoints()
	local cost = itemtab.Price

	if GAMEMODE:IsClassicMode() and itemtab.NoClassicMode then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "cant_use_x_in_classic", itemtab.Name))
		return
	end

	if GAMEMODE.ZombieEscape and itemtab.NoZombieEscape then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "cant_use_x_in_zombie_escape", itemtab.Name))
		return
	end

	if itemtab.SkillRequirement and not sender:IsSkillActive(itemtab.SkillRequirement) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "x_requires_a_skill_you_dont_have", itemtab.Name))
		return
	end

	if itemtab.Tier and GAMEMODE.LockItemTiers and not GAMEMODE.ObjectiveMap and not GAMEMODE.ZombieEscape and not GAMEMODE:IsClassicMode() and GAMEMODE:GetNumberOfWaves() == GAMEMODE.NumberOfWaves and GAMEMODE:GetWave() + (GAMEMODE:GetWaveActive() and 0 or 1) < itemtab.Tier then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientFormat(sender, "tier_x_items_unlock_at_wave_y", itemtab.Tier, itemtab.Tier))
		return
	end

	if not GAMEMODE:HasItemStocks(id) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "out_of_stock"))
		return
	end
	cost = usescrap and math.ceil(GAMEMODE:PointsToScrap(cost)) or math.ceil(cost)

	if points < cost then
		timer.Create("buy"..itemtab.Name.."WARNING", 0.01,1, function()GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, usescrap and "need_to_have_enough_scrap" or "dont_have_enough_points")) end)
		return
	end

	if itemtab.Callback then
		itemtab.Callback(sender)
	elseif itemtab.SWEP then
		if string.sub(itemtab.SWEP, 1, 6) ~= "weapon" then
			if GAMEMODE:GetInventoryItemType(itemtab.SWEP) == INVCAT_TRINKETS and sender:HasInventoryItem(itemtab.SWEP) then
				return
			else
				sender:AddInventoryItem(itemtab.SWEP)
			end
		elseif sender:HasWeapon(itemtab.SWEP) then
			local stored = weapons.Get(itemtab.SWEP)
			if stored and stored.AmmoIfHas then
				sender:GiveAmmo(stored.Primary.DefaultClip, stored.Primary.Ammo)
			else
				local wep = ents.Create("prop_weapon")
				if wep:IsValid() then
					wep:SetPos(sender:GetShootPos())
					wep:SetAngles(sender:GetAngles())
					wep:SetWeaponType(itemtab.SWEP)
					wep:SetShouldRemoveAmmo(true)
					wep:Spawn()
				end
			end
		else
			local wep = sender:Give(itemtab.SWEP)
			if wep and wep:IsValid() and wep.EmptyWhenPurchased and wep:GetOwner():IsValid() then
				if wep.Primary then
					local primary = wep:ValidPrimaryAmmo()
					if primary then
						sender:RemoveAmmo(math.max(0, wep.Primary.DefaultClip - wep.Primary.ClipSize), primary)
					end
				end
				if wep.Secondary then
					local secondary = wep:ValidSecondaryAmmo()
					if secondary then
						sender:RemoveAmmo(math.max(0, wep.Secondary.DefaultClip - wep.Secondary.ClipSize), secondary)
					end
				end
			end
		end


	else
		return
	end
    local scrapd = sender.ScrapDiscount or 1
	local buy = "Buyed a "
	if usescrap then
		sender:RemoveAmmo(math.ceil(cost), "scrap")
		sender:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")
		timer.Create(buy..itemtab.Name, 0.01,1, function() sender:PrintTranslatedMessage(HUD_PRINTTALK, usescrap and "created_x_for_y_scrap" ,itemtab.Name, math.ceil(cost)) end)
	else
		sender:TakePoints(cost)
		sender:SendLua("surface.PlaySound(\"ambient/levels/labs/coinslot1.wav\")")
		timer.Create(buy..itemtab.Name, 0.01,1, function() sender:PrintTranslatedMessage(HUD_PRINTTALK, "purchased_x_for_y_points", itemtab.Name, cost) end)
	end


	GAMEMODE:AddItemStocks(id, -1)

	if usescrap then
		local nearest = sender:NearestRemantler()
		if nearest then
			local owner = nearest.GetObjectOwner and nearest:GetObjectOwner() or nearest:GetOwner()
			if owner:IsValid() and owner ~= sender then
				if not sender:IsSkillActive(SKILL_SAMODOS) then
					local scrapcom = math.ceil(cost / 6)
					nearest:SetScraps(nearest:GetScraps() + scrapcom)
					nearest:GetObjectOwner():GiveAchievementProgress("grem", scrapcom)
					nearest:GetObjectOwner():CenterNotify(COLOR_GREEN, translate.ClientFormat(owner ,"remantle_used", scrapcom)..sender:Nick())
				end
			end
		end
	else
		local nearest = sender:NearestArsenalCrateOwnedByOther()
		if nearest then
			local owner = nearest.GetObjectOwner and nearest:GetObjectOwner() or nearest:GetOwner()
			if owner:IsValid() then
				local commission = cost * GAMEMODE.ArsenalCrateCommission
				if commission > 0 then
					owner:AddPoints(commission, nil, nil, true)

					net.Start("zs_commission")
						net.WriteEntity(nearest)
						net.WriteEntity(sender)
						net.WriteFloat(commission)
					net.Send(owner)
				end
			end
		end
	end
end)
concommand.Add("zs_mutationshop_click", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected()) or #arguments == 0 then return end

	--[[for _, pl in pairs(player.GetAll(TEAM_HUMAN)) do
		if LASTHUMAN then
		sender:CenterNotify(COLOR_RED, translate.ClientGet(sender, "cant_buy_mutations"))
		sender:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		return
		end
	end]]

	if  gamemode.Call("ZombieCanPurchase", sender) or sender:Team() == TEAM_HUMAN then
		sender:CenterNotify(COLOR_RED, translate.ClientGet(sender, "cant_buy_mutations"))
		sender:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		return
	end

	local cost
	local hasalready = {}
	local tokens = sender:GetTokens()

	for _, id in pairs(arguments) do
		local tab = FindMutation(id)
		if tab and not hasalready[id] then
			if tab.Worth and tab.Callback then
				cost = tab.Worth
				hasalready[id] = true

			end
		end
	end

	if cost > tokens then return end

	local itemtab
	local id = arguments[1]
	local num = tonumber(id)

	if num then
		itemtab = GAMEMODE.Mutations[num]
	else
		for i, tab in pairs(GAMEMODE.Mutations) do
			if tab.Signature == id then
				itemtab = tab
				break
			end
		end
	end

	if itemtab.Worth then
	
		local tokens = sender:GetTokens()
		local cost = itemtab.Worth
		
		cost = math.ceil(cost)

		if tokens < cost  then
			sender:CenterNotify(COLOR_RED, translate.ClientGet(sender, "you_dont_have_enough_btokens"))
			sender:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
			return
		end
		itemtab.Callback(sender)
		sender:TakeTokens(cost)
		sender:PrintTranslatedMessage(HUD_PRINTTALK, "purchased_x_for_y_btokens", itemtab.Name, cost )
		sender:SendLua("surface.PlaySound(\"ambient/levels/labs/coinslot1.wav\")")
		sender.UsedMutations = sender.UsedMutations or { }
		table.insert( sender.UsedMutations, itemtab.Signature )
	end

	net.Start("zs_mutations_table")
		net.WriteTable(sender.UsedMutations)
	net.Send(sender)

end)

concommand.Add("zs_dismantle", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected() and sender:IsValidLivingHuman()) then return end

	local invitem, itypecat, potinv
	if #arguments > 0 then
		invitem = arguments[1]
	end

	if invitem and not sender:HasInventoryItem(invitem) then return end
	local active = sender:GetActiveWeapon()
	local contents, wtbl = active:GetClass()
	if not invitem then
		wtbl = weapons.Get(contents)
		if wtbl.RemoveOnGive then return end
		if wtbl.NoDismantle or not (wtbl.AllowQualityWeapons and !wtbl.CanDismantle or wtbl.PermitDismantle) then
			GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "cannot_dismantle"))
			return
		end

		if wtbl.AmmoIfHas and sender:GetAmmoCount(wtbl.Primary.Ammo) == 0 and active:Clip1() == 0 then
			sender:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
			return
		end
		--if sender:IsSkillActive(SKILL_COPPER) and math.random(1,10) == 1 and GAMEMODE:GetItemStocks(id) ~= -1 then
		--	GAMEMODE:AddItemStocks(id, 1)
		--end
		potinv = GAMEMODE.Breakdowns[contents]
	else
		itypecat = GAMEMODE:GetInventoryItemType(invitem)
		if itypecat ~= INVCAT_TRINKETS or GAMEMODE.ZSInventoryItemData[invitem].PermitDismantle then
			GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "cannot_dismantle"))
			return
		end

		potinv = GAMEMODE.Breakdowns[invitem]
	end

	local scrap = GAMEMODE:GetDismantleScrap(wtbl or GAMEMODE.ZSInventoryItemData[invitem], invitem,sender)
	if sender:IsSkillActive(SKILL_COPPER) then
		sender:SetPoints(sender:GetPoints()+scrap*0.4)
		scrap = scrap * 0.6
	end
	net.Start("zs_ammopickup")
		net.WriteUInt(scrap, 16)
		net.WriteString("scrap")
	net.Send(sender)
	sender:GiveAmmo(scrap, "scrap")

	if invitem then
		sender:TakeInventoryItem(invitem)
	else
		sender:GetActiveWeapon():EmptyAll(true)

		if wtbl and wtbl.AmmoIfHas then
			sender:RemoveAmmo(1, wtbl.Primary.Ammo)
		end

		sender:StripWeapon(contents)
		sender:UpdateAltSelectedWeapon()
	end



	if potinv and potinv.Result then
		sender:AddInventoryItem(potinv.Result)

		net.Start("zs_invitem")
			net.WriteString(potinv.Result)
		net.Send(sender)
	end
end)

concommand.Add("zs_upgrade", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected() and sender:IsValidLivingHuman()) then return end
	if sender:HasTrinket("flower_g") then sender:TakeInventoryItem("trinket_flower_g")  return end
	if not sender:NearRemantler() then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "need_to_be_near_remantler"))
		return
	end

	local nearest = sender:NearestRemantler()
	local contents = sender:GetActiveWeapon():GetClass()
	local contentstbl = weapons.Get(contents)
	local contentsqua = contentstbl.QualityTier
	local desiredqua = contentsqua and contentsqua + 1 or 1

	local branch = contentstbl.Branch
	if not contentsqua and #arguments > 0 then
		branch = tonumber(arguments[1])
	end

	if not (nearest and nearest:IsValid() and contents) then return end

	local wtbl = weapons.Get(contents)
	local scrapcost = math.floor(GAMEMODE:GetUpgradeScrap(wtbl, desiredqua) * (sender.ScrapDiscount or 1))

	if wtbl.AmmoIfHas and sender:GetAmmoCount(wtbl.Primary.Ammo) == 0 then
		sender:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		return
	end

	if sender:GetAmmoCount("scrap") < scrapcost then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "need_to_have_enough_scrap"))
		return
	end

	local upgclass = GAMEMODE:GetWeaponClassOfQuality(not contentsqua and contents or contentstbl.BaseQuality, desiredqua, branch)
	local classtbl = weapons.Get(upgclass)
	if not classtbl then return end

	if sender:HasWeapon(upgclass) then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "remantle_cannot"))
		return
	end

	local upgname = classtbl.PrintName
	sender:CenterNotify(COLOR_CYAN, translate.ClientGet(sender, "remantle_success"), color_white, " "..upgname)
	sender:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")
	sender:RemoveAmmo(scrapcost, "scrap")

	local wep = sender:GiveEmptyWeapon(upgclass)
	if wep and wep:IsValid() then
		sender:GetActiveWeapon():EmptyAll(true)
		sender:SelectWeapon(upgclass)
		sender:StripWeapon(contents)
		sender:UpdateAltSelectedWeapon()

		if wtbl.AmmoIfHas then
			sender:RemoveAmmo(1, wtbl.Primary.Ammo)
		end
		if wep.AmmoIfHas then
			sender:GiveAmmo(1, wep.Primary.Ammo)
		end

		net.Start("zs_remantleconf")
		net.Send(sender)
		sender:GiveAchievementProgress("darvinupdate", 1)

	end

	local owner = nearest.GetObjectOwner and nearest:GetObjectOwner() or nearest:GetOwner()
	if owner:IsValid() and owner ~= sender then
		local scrapcom = math.ceil(scrapcost * 0.13)
		nearest:SetScraps(nearest:GetScraps() + scrapcom)
		nearest:GetObjectOwner():GiveAchievementProgress("grem", scrapcom)
		nearest:GetObjectOwner():CenterNotify(COLOR_GREEN, translate.ClientFormat(owner,"remantle_used", scrapcom)..sender:Nick())
	end
end)

concommand.Add("worthrandom", function(sender, command, arguments)
	if sender:IsValid() and sender:IsConnected() and gamemode.Call("PlayerCanCheckout", sender) then
		gamemode.Call("GiveRandomEquipment", sender)
	end
end)

concommand.Add("worthcheckout", function(sender, command, arguments)
	if not (sender:IsValid() and sender:IsConnected()) or #arguments == 0 then return end

	if not gamemode.Call("PlayerCanCheckout", sender) then
		sender:CenterNotify(COLOR_RED, translate.ClientGet(sender, "cant_use_worth_anymore"))
		return
	end

	local cost = 0
	local hasalready = {}

	for _, id in pairs(arguments) do
		id = tonumber(id) or id

		local tab = FindStartingItem(id)
		if tab and not hasalready[id] and (not tab.SkillRequirement or sender:IsSkillActive(tab.SkillRequirement)) then
			cost = cost + tab.Price
			hasalready[id] = true
		end
	end
	if cost > GAMEMODE.StartingWorth + (sender.ExtraStartingWorth or 0) then return end
	hasalready = {}

	for _, id in pairs(arguments) do
		id = tonumber(id) or id

		local tab = FindStartingItem(id)
		if tab and not hasalready[id] then
			if tab.SkillRequirement and not sender:IsSkillActive(tab.SkillRequirement) then
				sender:PrintMessage(HUD_PRINTTALK, translate.ClientFormat(sender, "x_requires_a_skill_you_dont_have", tab.Name))
			elseif tab.NoClassicMode and GAMEMODE:IsClassicMode() then
				sender:PrintMessage(HUD_PRINTTALK, translate.ClientFormat(sender, "cant_use_x_in_classic_mode", tab.Name))
			elseif tab.Callback then
				tab.Callback(sender)
				hasalready[id] = true
			elseif tab.SWEP then

				sender:StripWeapon(tab.SWEP) -- "Fixes" players giving each other empty weapons to make it so they get no ammo from the Worth menu purchase.
				if GAMEMODE.ZSInventoryItemData[tab.SWEP] then
					sender:AddInventoryItem(tab.SWEP)
				else
					sender:Give(tab.SWEP)
				end
				hasalready[id] = true
			end
		end
	end

	if table.Count(hasalready) > 0 then
		GAMEMODE.CheckedOut[sender:UniqueID()] = true
	end

	gamemode.Call("RemoveDuplicateAmmo", sender)
end)

concommand.Add("zsdropweapon", function(sender, command, arguments)
	local currentwep = sender:GetActiveWeapon()
	if sender:HasTrinket("curse_dropping") then
		sender:Kill()
		sender:TakeInventoryItem("curse_dropping")
		
	end
	if sender:HasTrinket("curse_point") and sender:GetPoints() > 0 then
		sender:SetPoints(sender:GetPoints() * 0.75)
		sender:TakeInventoryItem("trinket_curse_point")
		return
	end
	if sender:HasTrinket("hurt_curse") then
		sender:TakeDamage(60)
		sender:TakeInventoryItem("hurt_curse")
	end
	if sender:HasTrinket("un_curse") then
		sender:SetHealth(1)
		sender:TakeInventoryItem("un_curse")
	end
	if sender:HasTrinket("curse_faster") then
		sender.zKills = sender.zKills + 50
		sender:TakeInventoryItem("curse_faster")
	end
	if sender:HasTrinket("curse_slow") then
		sender:TakeDamage(100)
		sender:TakeInventoryItem("curse_slow")
		
	end
	if sender:HasTrinket("curse_heart") then
		sender:TakeDamage(sender:Health()  * 0.5)
		sender:TakeInventoryItem("curse_heart")
		
	end
	if sender:HasTrinket("curse_fragility") then
		sender.LuckAdd = sender.LuckAdd - 6
		sender:TakeInventoryItem("curse_fragility")
	end
	if sender:HasTrinket("curse_unknown") then
		local c = NULL
		for k,v in pairs(ents.GetAll()) do
			if v:GetClass() == "info_player_zombie*" or v:GetClass() == "info_player_undead*" or v:GetClass() == "info_player_start" then
				c = v 
				break
			end
		end
		timer.Simple(1, function() if c:IsValid() then sender:SetPos(c:GetPos())  end end)
	end
	if sender:HasTrinket("curse_ponos") then
		sender:TakeInventoryItem("curse_ponos")
		timer.Create("ponosx10", 0.5, 10, function() sender:SetVelocity(VectorRand() * math.random(200,1700)) 
			sender:EmitSound("ambient/water/water_spray3.wav",120,45, 122)
		end)
		sender:GiveAchievement("ponos")
	end
	if GAMEMODE.ZombieEscape then
		local hwep, zwep = sender:GetWeapon("weapon_elite"), sender:GetWeapon("weapon_knife")
		if hwep and hwep:IsValid() then
			sender:DropWeapon(hwep)
		elseif zwep and zwep:IsValid() then
			sender:DropWeapon(zwep)
		end

		return
	end

	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) or CurTime() < (sender.NextWeaponDrop or 0) or GAMEMODE.ZombieEscape then return end
	sender.NextWeaponDrop = CurTime() + 0.15

	local invitem
	if #arguments > 0 then
		invitem = arguments[1]
	end
	if invitem and not sender:HasInventoryItem(invitem) then return end
	if invitem == "trinket_a_flower" then sender:TakeInventoryItem("trinket_a_flower")  return end
	if sender:HasTrinket("flower_g") then sender:TakeInventoryItem("trinket_flower_g")  return end
	if invitem == "trinket_flower" then 	sender:TakeInventoryItem("trinket_flower") return end
	if invitem == "trinket_clever" then  return end
	if (currentwep and currentwep:IsValid() and currentwep).RemoveOnGive then return end
	if invitem or (currentwep and currentwep:IsValid()) then
		local ent = invitem and sender:DropInventoryItemByType(invitem) or sender:DropWeaponByType(currentwep:GetClass())
		if ent and ent:IsValid() then
			local shootpos = sender:GetShootPos()
			local aimvec = sender:GetAimVector()
			ent:SetPos(util.TraceHull({start = shootpos, endpos = shootpos + aimvec * 32, mask = MASK_SOLID, filter = sender, mins = Vector(-2, -2, -2), maxs = Vector(2, 2, 2)}).HitPos)
			ent:SetAngles(sender:GetAngles())
		end
	end
	sender:SetProgress(CurTime() +2,"giveditem")
end)


concommand.Add("zsemptyclip", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end

	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) then return end

	sender.NextEmptyClip = sender.NextEmptyClip or 0
	if sender.NextEmptyClip <= CurTime() then
		sender.NextEmptyClip = CurTime() + 0.1

		local wep = sender:GetActiveWeapon()
		if wep:IsValid() and (not wep.NoMagazine and not wep.AmmoIfHas or wep.AllowEmpty) then
			local primary = wep:ValidPrimaryAmmo()
			if primary and 0 < wep:Clip1() then
				sender:GiveAmmo(wep:Clip1(), primary, true)
				wep:SetClip1(0)
			end
			local secondary = wep:ValidSecondaryAmmo()
			if secondary and 0 < wep:Clip2() then
				sender:GiveAmmo(wep:Clip2(), secondary, true)
				wep:SetClip2(0)
			end
		end
	end
end)
concommand.Add("zs_d_focusing", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end

	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN and sender:IsSkillActive(SKILL_AMULET_4)) then return end
	local pl = sender
	if !pl:IsCarrying() and pl.LastHealedFocus <= CurTime() and pl.MaxBloodArmor * 0.3 <= pl:GetBloodArmor() and pl:GetBloodArmor() >= 12 then
		pl:SetBloodArmor(math.min((pl.MaxBloodArmor * 0.3) + pl:GetBloodArmor() * 0.3, pl:GetBloodArmor() * 0.3))
		pl:EmitSound("items/smallmedkit1.wav", 50)
		pl:SetHealth(math.min(pl:GetMaxHealth() * 0.1 + pl:Health(), pl:GetMaxHealth()))
		pl.LastHealedFocus = CurTime() + 1
		for _, pl3 in pairs(ents.FindInSphere(pl:GetPos(), 128 * pl:GetModelScale())) do
			if pl3:IsValidLivingHuman() and pl:IsSkillActive(SKILL_FOODHEALS) then
				pl:HealPlayer(pl3, pl:Health() * 0.1)
			end
		end
	end
end)


function GM:TryGetLockOnTrace(sender, arguments)
	local ent
	local dent = Entity(tonumbersafe(arguments[2] or 0) or 0)
	if GAMEMODE:ValidMenuLockOnTarget(sender, dent) then
		ent = dent
	end

	if not ent then
		ent = sender:MeleeTrace(48, 2, nil, nil, true).Entity
	end

	return ent
end

concommand.Add("zsgiveammo", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end
	if sender:HasTrinket("curse_dropping") then
		sender:Kill()
		
	end


	if not sender:IsValid() or not sender:Alive() or sender:Team() ~= TEAM_HUMAN then return end

	local ammotype = arguments[1]
	if not ammotype or #ammotype == 0 or not GAMEMODE.AmmoCache[ammotype] then return end

	local count = sender:GetAmmoCount(ammotype)
	if count <= 0 then
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "no_spare_ammo_to_give"))
		return
	end

	local ent = GAMEMODE:TryGetLockOnTrace(sender, arguments)
	if ent and ent:IsValidLivingHuman() then
		local desiredgive = math.min(count, GAMEMODE.AmmoCache[ammotype])
		if desiredgive >= 1 then

			if ent:IsSkillActive(SKILL_SAMODOS) then 
				GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "have_skill_samodos")) 
				return
			end

			sender:RemoveAmmo(desiredgive, ammotype)
			ent:GiveAmmo(desiredgive, ammotype)

			if CurTime() >= (sender.NextGiveAmmoSound or 0) then
				sender.NextGiveAmmoSound = CurTime() + 1
				sender:PlayGiveAmmoSound()
			end

			sender:RestartGesture(ACT_GMOD_GESTURE_ITEM_GIVE)

			net.Start("zs_ammogive")
				net.WriteUInt(desiredgive, 16)
				net.WriteString(ammotype)
				net.WriteEntity(ent)
			net.Send(sender)

			net.Start("zs_ammogiven")
				net.WriteUInt(desiredgive, 16)
				net.WriteString(ammotype)
				net.WriteEntity(sender)
			net.Send(ent)
			sender:SetProgress(CurTime() +2,"giveditem")
			return
		end

    else
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "no_person_in_range")) 
    end
end)

concommand.Add("zsgiveweapon", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end
	if sender:HasTrinket("curse_dropping") then
		sender:Kill()
		sender:TakeInventoryItem("curse_dropping")
		return
	end
	if sender:HasTrinket("curse_point") and sender:GetPoints() > 0 then
		sender:SetPoints(sender:GetPoints() * 0.75)
		sender:TakeInventoryItem("curse_point")
		return
	end
	if sender:HasTrinket("hurt_curse") then
		sender:TakeDamage(60)
		sender:TakeInventoryItem("hurt_curse")
		return
	end
	if sender:HasTrinket("un_curse") then
		sender:SetHealth(1)
		sender:TakeInventoryItem("un_curse")
		return
	end
	if sender:HasTrinket("curse_faster") then
		sender.zKills = sender.zKills + 50
		sender:TakeInventoryItem("curse_faster")
		return
	end
	if sender:HasTrinket("curse_slow") then
		sender:TakeDamage(100)
		sender:TakeInventoryItem("curse_slow")
		return
		
	end
		if sender:HasTrinket("curse_heart") then
		sender:TakeDamage(sender:Health())
		sender:TakeInventoryItem("curse_heart")
		
	end
	if sender:HasTrinket("curse_ponos") then
		sender:TakeInventoryItem("curse_ponos")
		timer.Create("ponosx10", 0.5, 10, function() sender:SetVelocity(VectorRand() * math.random(200,1700)) end)
		sender:GiveAchievement("ponos")
		return
	end
	if sender:HasTrinket("curse_unknown") then
		local c = NULL
		for k,v in pairs(ents.GetAll()) do
			if v:GetClass() == "info_player_zombie*" or v:GetClass() == "info_player_undead*" or v:GetClass() == "info_player_start" then
				c = v 
				break
			end
		end
		timer.Simple(1, function() if c:IsValid() then sender:SetPos(c:GetPos())  end end)
		return
	end

	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) then return end

	local invitem
	if #arguments > 0 then
		invitem = arguments[2]
	end
	
	if invitem and not sender:HasInventoryItem(invitem) then return end
	if invitem == "trinket_a_flower" then sender:TakeInventoryItem("trinket_a_flower")  return end
	if sender:HasTrinket("flower_g") then sender:TakeInventoryItem("trinket_flower_g")  return end
	if invitem == "trinket_flower" then sender:TakeInventoryItem("trinket_flower")  return end
	if invitem == "trinket_clever" then  return end
	if invitem and string.sub(invitem, 9, 11) == "sin" then return end
	

	local currentwep = sender:GetActiveWeapon()
	if (currentwep and currentwep:IsValid() and currentwep).RemoveOnGive then return end
	if not invitem and not IsValid(currentwep) then return end

	local ent = GAMEMODE:TryGetLockOnTrace(sender, arguments)
	if ent and ent:IsValidLivingHuman() and ent:IsSkillActive(SKILL_SAMODOS) then 
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "have_skill_samodos")) 
		return
	end
	if ent and ent:IsValidLivingHuman() then
		if not invitem then
			if ent:HasWeapon(currentwep:GetClass()) then
				GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "person_has_weapon"))
			else
				sender:GiveWeaponByType(currentwep, ent, false)
			end
		else
			sender:GiveInventoryItemByType(invitem, ent)
		end
	else
		GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "no_person_in_range"))
	end
	sender:SetProgress(CurTime() +2,"giveditem")
end)

concommand.Add("zsgiveweaponclip", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end


	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) then return end
	if sender:HasTrinket("curse_dropping") then
		sender:Kill()
	end
	if sender:HasTrinket("curse_point") and sender:GetPoints() > 0 then
		sender:SetPoints(sender:GetPoints() * 0.75)
		sender:TakeInventoryItem("curse_point")
		return
	end
	if sender:HasTrinket("flower_g") then sender:TakeInventoryItem("trinket_flower_g")  return end
	if invitem == "trinket_clever" then  return end


	local currentwep = sender:GetActiveWeapon()
	if currentwep and currentwep:IsValid() then
		if currentwep.RemoveOnGive then return end
		local ent = GAMEMODE:TryGetLockOnTrace(sender, arguments)
		if ent:IsSkillActive(SKILL_SAMODOS) then 
			GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "have_skill_samodos")) 
			return
		end
		if ent and ent:IsValidLivingHuman() then
			if not ent:HasWeapon(currentwep:GetClass()) then
				sender:GiveWeaponByType(currentwep, ent, true)
			else
				GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "person_has_weapon"))
			end
		else
			GAMEMODE:ConCommandErrorMessage(sender, translate.ClientGet(sender, "no_person_in_range"))
		end
	end
end)
concommand.Add("zs_stuck", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end
	if not sender:IsValid() or not sender:Alive() or sender:Team() ~= TEAM_HUMAN or CurTime() < (sender.NextStuckMoment or 0) or sender.Stuckedtrue_C + 3 >= CurTime() or sender:GetVelocity():LengthSqr() >= 900 or !sender.Stuckedtrue then print("useless")return end
	local ent = NULL
	for _, ent1 in pairs(team.GetPlayers(TEAM_HUMAN)) do
		if ent1:IsValid() and ent1:IsPlayer() and ent1 ~= sender and (ent1.CheckedForStuck or 0) <= CurTime() then
			ent = ent1
			ent.CheckedForStuck = CurTime() + 1040
			break
		end
	end
	if ent == NULL then
		for _, ent1 in pairs(ents.GetAll()) do
			if ent1:GetClass() == "prop_obj_sigil" then
				ent = ent1
				break
			end
		end
	end
	if ent:IsValid() then
		sender.NextStuckMoment = CurTime() + (sender.Stuckedtrue_C + 5 >= CurTime() and 120 or 5)
		sender:SetPos(ent:GetPos())
	end
end)
concommand.Add("fear_this", function(sender, command, arguments)
	if arguments[1] == "baracat_sucks" and arguments[2] == "UsePromo" then
		sender:GiveAchievement("baracat_sucks")
	end
end)
concommand.Add("zsdropammo", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end

	if not sender:IsValid() or not sender:Alive() or sender:Team() ~= TEAM_HUMAN or CurTime() < (sender.NextDropClip or 0) then return end

	sender.NextDropClip = CurTime() + 0.2

	local wep = sender:GetActiveWeapon()
	if not wep:IsValid() then return end

	local ammotype = arguments[1] or wep:GetPrimaryAmmoTypeString()
	if GAMEMODE.AmmoNames[ammotype] and GAMEMODE.AmmoCache[ammotype] then
		local ent = sender:DropAmmoByType(ammotype, GAMEMODE.AmmoCache[ammotype] * 2)
		if ent and ent:IsValid() then
			ent:SetPos(sender:EyePos() + sender:GetAimVector() * 8)
			ent:SetAngles(sender:GetAngles())
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous(sender:GetVelocity() * 0.85)
			end
		end
	end
end)

concommand.Add("zs_resupplyammotype", function(sender, command, arguments)
	if GAMEMODE.ZombieEscape then return end

	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) then return end

	local ammotype = arguments[1]
	if not ammotype or #ammotype == 0 or not (ammotype == "default" or GAMEMODE.AmmoResupply[ammotype]) then return end

	sender.ResupplyChoice = ammotype ~= "default" and ammotype or nil
end)

concommand.Add("zs_shitmap_check", function(sender, command, arguments)

	local teleporters = ents.FindByClass("trigger_teleport")
	local buttons = ents.FindByClass("func_button")
	local doors = ents.FindByClass("func_door_rotating")
	table.Add(doors, ents.FindByClass("func_movelinear"))
	local props = ents.FindByClass("prop_physics_multiplayer")
	table.Add(props,  ents.FindByClass("prop_physics"))
	local weapon = ents.FindByClass("prop_weapon")
	local players = ents.FindByClass("player")

	sender:PrintMessage(HUD_PRINTCONSOLE, "Teleports: "..#teleporters.." Buttons: "..#buttons.." Doors: "..#doors.. " Props: "..#props.. " Loots: " ..#weapon.. " Players: " ..#players)
end)

concommand.Add("zs_shitmap_toteleport", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local ent = ents.FindByClass("trigger_teleport")[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)

concommand.Add("zs_shitmap_teleport_on", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	for _, ent in pairs(ents.FindByClass("trigger_teleport")) do
		ent:Fire("enable", "", 0)
	end
end)

concommand.Add("zs_shitmap_teleport_off", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	for _, ent in pairs(ents.FindByClass("trigger_teleport")) do
		ent:Fire("enable", "", 0)
	end
end)

concommand.Add("zs_shitmap_tobutton", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local ent = ents.FindByClass("func_button")[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)

concommand.Add("zs_shitmap_tomover", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local entities = ents.FindByClass("func_door_rotating")
	table.Add(entities, ents.FindByClass("func_movelinear"))
	local ent = entities[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)






concommand.Add("zs_shitmap_detail", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local entities = ents.FindByClass("prop_physics")
	table.Add(entities, ents.FindByClass("prop_physics_multiplayer"))
	local ent = entities[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)

concommand.Add("zs_shitmap_toloot", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local entities = ents.FindByClass("prop_weapon")
	local ent = entities[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)
concommand.Add("zs_shitmap_toplayer", function(sender, command, arguments)
	if not sender:IsSuperAdmin() then return end

	local entities = ents.FindByClass("player")
	local ent = entities[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)

concommand.Add("teleport", function(sender, command, arguments)
	if not (sender:IsValid() and sender:Alive() and sender:Team() == TEAM_HUMAN) then return end

	local entities = ents.FindByClass("prop_teleport")
	local ent = entities[tonumber(arguments[1])]
	if ent then
		sender:SetPos(ent:WorldSpaceCenter())
	end
end)
concommand.Add("zs_addxp", function(sender, command, arguments)
	if sender == nil then return end
	if not sender:IsAdmin() then 
		sender:PrintMessage(HUD_PRINTTALK, translate.ClientFormat(sender, "noadmin"))
		 return end
	print(sender)
	print("attemp to give XP", arguments[1])
	if arguments[1] == nil then return end
	sender:AddZSXP(arguments[1])
	RunConsoleCommand("say", "https://cdn.discordapp.com/attachments/592341195917623315/969447258833682432/unknown.png")

end)
concommand.Add("zs_weapon", function(sender, command, arguments, pl)
	if sender == nil then return end
	if not sender:IsAdmin() then 
		sender:PrintMessage(HUD_PRINTTALK, translate.ClientFormat(sender, "noadmin"))
		return end
	print(sender)
	print("attemp to give weapon",arguments[1])
	if arguments[1] == nil then return end
	RunConsoleCommand("say", "https://cdn.discordapp.com/attachments/592341195917623315/969447258833682432/unknown.png")
	sender:Give(arguments[1])
	sender:AddInventoryItem(arguments[1])
end)

