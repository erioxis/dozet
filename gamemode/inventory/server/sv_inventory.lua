local meta = FindMetaTable("Player")

function meta:AddInventoryItem(item)
	if not GAMEMODE:IsInventoryItem(item) then return false end

	self.ZSInventory[item] = self.ZSInventory[item] and self.ZSInventory[item] + 1 or 1

	if GAMEMODE:GetInventoryItemType(item) == INVCAT_TRINKETS then
		self:ApplyTrinkets()
	end
	if item == "trinket_clever" then
		self:GiveAchievement("bruhwtf")
	end
	--[[
				if self.OutFitPac then
					self:RemovePACPart(self.OutFitPac)
					self.OutFitPac = nil 
				end
				if classtab.Pac3Out then
					pac.SetupENT(self)
					self:AttachPACPart(classtab.Pac3Out)
					self.OutFitPac = classtab.Pac3Out
				end

	]]
	if GAMEMODE.ZSInventoryItemData[item].PacModels then
		net.Start("zs_item_pac")
			net.WriteString(item)
			net.WriteEntity(self)
			net.WriteBool(false)
		net.Send(self)
	end

	net.Start("zs_inventoryitem")
		net.WriteString(item)
		net.WriteInt(self.ZSInventory[item], 5)
	net.Send(self)

	return true
end
function meta:UpgradeInventoryItem(item)
	if not GAMEMODE:IsInventoryItem(item) then return false end

	self.ZSInventory[item] = self.ZSInventory[item] and self.ZSInventory[item] + 1 or 1

	if GAMEMODE:GetInventoryItemType(item) == INVCAT_TRINKETS then
		self:ApplyTrinkets()
	end

	net.Start("zs_upgradeitem")
		net.WriteString(item)
		net.WriteInt(self.ZSInventory[item], 5)
	net.Send(self)

	return true
end

function meta:TakeInventoryItem(item)
	if not self:HasInventoryItem(item) then return false end

	local setnil = self.ZSInventory[item] == 1
	self.ZSInventory[item] = self.ZSInventory[item] - 1

	if setnil then
		self.ZSInventory[item] = nil
	end
	if GAMEMODE.ZSInventoryItemData[item].PacModels then
		net.Start("zs_item_pac")
			net.WriteString(item)
			net.WriteEntity(self)
			net.WriteBool(true)
		net.Send(self)
	end
	if GAMEMODE:GetInventoryItemType(item) == INVCAT_TRINKETS then
		self:ApplyTrinkets()
	end

	net.Start("zs_inventoryitem")
		net.WriteString(item)
		net.WriteInt(self.ZSInventory[item] or 0, 5)
	net.Send(self)

	return true -- Return true aka item was taken
end

function meta:WipePlayerInventory()
	if not self.ZSInventory or table.Count(self.ZSInventory) == 0 then return end

	self.ZSInventory = {}
	self:ApplyTrinkets()

	net.Start("zs_wipeinventory")
	net.Send(self)
end

net.Receive("zs_trycraft", function(len, pl)
	local component = net:ReadString()
	local weapon = net:ReadString()

	pl:TryAssembleItem(component, weapon)
end)
net.Receive("zs_trygetitem", function(len, pl)
	local component = net:ReadString()

	pl:TryTakeItem(component)
end)
net.Receive("zs_activate_trinket", function(len, pl)
	local trinket = net.ReadString()
	local pl = net.ReadEntity()
	local callback = GAMEMODE.ZSInventoryItemData[trinket].Bounty
	if pl:HasInventoryItem(trinket) and callback and GAMEMODE.ZSInventoryItemData[trinket].BountyNeed <= pl:GetChargesActive() then
		callback(pl)
		pl:SetChargesActive(pl:GetChargesActive()-GAMEMODE.ZSInventoryItemData[trinket].BountyNeed)
	end
end)

function meta:TryAssembleItem(component, heldclass)
	local heldwep, desiassembly = self:GetWeapon(heldclass)
	local heldwepiitype = GAMEMODE:GetInventoryItemType(heldclass) ~= -1

	if heldwepiitype then
		if not self:HasInventoryItem(heldclass) then
			self:CenterNotify(COLOR_RED, "You don't have the item to craft this with.")
			self:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
			return
		end
	else
		if not heldwep or not heldwep:IsValid() then
			self:CenterNotify(COLOR_RED, "You don't have the weapon to craft this with.")
			self:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
			return
		end
	end

	for assembly, reqs in pairs(GAMEMODE.Assemblies) do
		local reqcomp, reqweapon = reqs[1], reqs[2]
		if reqcomp == component and reqweapon == heldclass then
			desiassembly = assembly
			break
		end

	end

	if not desiassembly then
		self:CenterNotify(COLOR_RED, "You can't make anything with this component and your currently held weapon.")
		self:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		return
	end

	local invitemresult = GAMEMODE:GetInventoryItemType(desiassembly) ~= -1

	local desitable
	if invitemresult then
		if not self:TakeInventoryItem(component) then return end

		self:AddInventoryItem(desiassembly)
		self:CenterNotify(COLOR_LIMEGREEN, translate.ClientGet(self, "crafting_successful"), color_white, "   ("..GAMEMODE.ZSInventoryItemData[desiassembly].PrintName..")")
		if desiassembly == "trinket_toykasoul" then
			self:GiveAchievement("soul")
		end
	else
		desitable = weapons.Get(desiassembly)
		if (not desitable.AmmoIfHas and self:HasWeapon(desiassembly)) or not self:TakeInventoryItem(component) then return end
		if desiassembly == "weapon_zs_sigil_port_a" then
			self:GiveAchievement("anti_sigil")
		end
		if desitable.AmmoIfHas then
			self:GiveAmmo(1, desitable.Primary.Ammo)
		end
		self:GiveEmptyWeapon(desiassembly)
		self:SelectWeapon(desiassembly)
		self:UpdateAltSelectedWeapon()

		self:CenterNotify(COLOR_LIMEGREEN, translate.ClientGet(self, "crafting_successful"), color_white, "   ("..desitable.PrintName..")")
	end

	if heldwepiitype then
		self:TakeInventoryItem(heldclass)
	else
		heldwep:EmptyAll(true)
		if heldwep.AmmoIfHas then
			self:RemoveAmmo(1, heldwep.Primary.Ammo)
		end
		self:StripWeapon(heldclass)
	end
	self:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")

	GAMEMODE.StatTracking:IncreaseElementKV(STATTRACK_TYPE_WEAPON, desiassembly, "Crafts", 1)
end
function meta:TryTakeItem(component)
	local heldwep, desiassembly = self:GetWeapon(heldclass)

	for assembly, reqs in pairs(GAMEMODE.TakeItem) do
		local reqcomp = reqs[1]
		if reqcomp == component then
			desiassembly = assembly
			break
		end

	end

	if not desiassembly then
		self:CenterNotify(COLOR_RED, "You can't make anything with this component and your currently held weapon.")
		self:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		return
	end

	local invitemresult = GAMEMODE:GetInventoryItemType(desiassembly) ~= -1

	local desitable
	if invitemresult then
		if not self:TakeInventoryItem(component) then return end

		self:AddInventoryItem(desiassembly)
		self:CenterNotify(COLOR_LIMEGREEN, translate.ClientGet(self, "crafting_successful"), color_white, "   ("..GAMEMODE.ZSInventoryItemData[desiassembly].PrintName..")")
	else
		desitable = weapons.Get(desiassembly)
		if (not desitable.AmmoIfHas and self:HasWeapon(desiassembly)) or not self:TakeInventoryItem(component) then return end

		if desitable.AmmoIfHas then
			self:GiveAmmo(1, desitable.Primary.Ammo)
		end
		self:GiveEmptyWeapon(desiassembly)
		self:SelectWeapon(desiassembly)
		self:UpdateAltSelectedWeapon()

		self:CenterNotify(COLOR_LIMEGREEN, translate.ClientGet(self, "crafting_successful"), color_white, "   ("..desitable.PrintName..")")
	end

	if heldwepiitype then
		self:TakeInventoryItem(heldclass)
	end
	self:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")

	GAMEMODE.StatTracking:IncreaseElementKV(STATTRACK_TYPE_WEAPON, desiassembly, "Crafts", 1)
end

function meta:DropInventoryItemByType(itype)
	if GAMEMODE.ZombieEscape then return end
	if not self:HasInventoryItem(itype) then return end

	local ent = ents.Create("prop_invitem")
	if ent:IsValid() then
		ent:SetInventoryItemType(itype)
		ent:Spawn()
		ent:SetOwner(self)
		ent.DroppedTime = CurTime()

		self:TakeInventoryItem(itype)
		self:UpdateAltSelectedWeapon()

		return ent
	end
end

function meta:DropAllInventoryItems()
	local vPos = self:GetPos()
	local vVel = self:GetVelocity()
	local zmax = self:OBBMaxs().z * 0.75
	for invitem, count in pairs(self:GetInventoryItems()) do
		if self:HasTrinket("flower") then
			self:TakeInventoryItem("trinket_flower")
		end
		if self:HasTrinket("flower_g") then
			self:TakeInventoryItem("trinket_flower_g")
		end
		if self:HasTrinket("clever") then
			self:TakeInventoryItem("trinket_clever")
		end
		if self:HasTrinket("a_flower") then
			self:TakeInventoryItem("trinket_a_flower")
		end
		for i = 1, count do
			local ent = self:DropInventoryItemByType(invitem)
			if ent and ent:IsValid() then
				ent:SetPos(vPos + Vector(math.Rand(-16, 16), math.Rand(-16, 16), math.Rand(2, zmax)))
				ent:SetAngles(VectorRand():Angle())
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:AddAngleVelocity(Vector(math.Rand(-720, 720), math.Rand(-720, 720), math.Rand(-720, 720)))
					phys:ApplyForceCenter(phys:GetMass() * (math.Rand(32, 328) * VectorRand():GetNormalized() + vVel))
				end
			end
		end
	end
end

function meta:GiveInventoryItemByType(itype, plyr)
	if GAMEMODE.ZombieEscape then return end
	if not self:HasInventoryItem(itype) then return end

	if GAMEMODE:GetInventoryItemType(itype) == INVCAT_TRINKETS and plyr:HasInventoryItem(itype) then
		self:CenterNotify(COLOR_RED, translate.ClientGet(self, "they_already_have_this_trinket"))
		return
	end

	self:TakeInventoryItem(itype)
	self:UpdateAltSelectedWeapon()

	net.Start("zs_invgiven")
		net.WriteString(itype)
		net.WriteEntity(self)
	net.Send(plyr)

	plyr:AddInventoryItem(itype)
end

function GM:IsInventoryItem(item)
	return self.ZSInventoryItemData[item]
end

function meta:GetInventoryItems()
	return self.ZSInventory
end

function meta:HasInventoryItem(item)
	return self.ZSInventory[item]
end
