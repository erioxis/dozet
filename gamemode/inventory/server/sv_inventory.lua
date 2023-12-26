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
		net.WriteInt(self.ZSInventory[item], 8)
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
		net.WriteInt(self.ZSInventory[item] or 0, 8)
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
local demiboss = {
	"comp_soul_alt_h",
	"comp_soul_health",
	"comp_soul_status",
	"comp_soul_melee", 
	"comp_soul_hack",
	"comp_soul_godlike","comp_soul_godlike",
	"comp_soul_dd","comp_soul_dd",
	"comp_soul_booms",
	"comp_soul_dosei","comp_soul_dosei"

}
net.Receive("zs_bounty_add", function(len, pl)
	if !pl:HasInventoryItem(pl.LastUsedTrinket) then return end
	local item = net.ReadString()
	pl.GetBounty = nil
	pl.MedicalBounty = nil
	pl.SeededBounty = nil
	pl.SeededSouls = nil
	pl.NextThinkAboutTrade = (pl.NextThinkAboutTrade or 1) + 10
	pl:TakeInventoryItem(pl.LastUsedTrinket)
	if item == "1" then
		pl:AddPoints(200)
		return
	elseif item == "2" then
		for i=1,3 do
			local p = demiboss[math.random(1,#demiboss)]
			pl:AddInventoryItem(p)
			net.Start("zs_invitem")
			net.WriteString(p)
		net.Send(pl)
		end
		return
	elseif item == "3" then
		pl:AddZSXP(3600,true)
		return
	end
	pl:AddInventoryItem(item)
	net.Start("zs_invitem")
	net.WriteString(item)
net.Send(pl)
end)
function GM:OnTrinketActivate(trinket, pl) 
	pl.LastUsedTrinket = trinket
end

net.Receive("zs_trygetitem", function(len, pl)
	local component = net:ReadString()

	pl:TryTakeItem(component)
end)
local function UseActive(pl,trin,uses,callback)
		callback(pl)
		if GAMEMODE.ZSInventoryItemData[trin].BountyNeed ~= 0 then
			pl.LastCall = trin
		end
end
net.Receive("zs_activate_trinket", function(len, pl)
	local trinket = net.ReadString()
	local pl = net.ReadEntity()
	local callback = GAMEMODE.ZSInventoryItemData[trinket].Bounty
	local uses = GAMEMODE.ZSInventoryItemData[trinket].BountyNeed*(pl.ChargesUse or 1)
	if pl:HasInventoryItem(trinket) and callback and uses <= pl:GetChargesActive() or pl:HasInventoryItem(trinket) and callback and GAMEMODE.ZSInventoryItemData[trinket].BountyNeed == 0 then
		if pl:IsSkillActive(SKILL_DOUBLE) and math.random(1,4) == 1 then
			uses = 0
		end
		pl:SetChargesActive(pl:GetChargesActive()-uses)
		for i=1,(pl:HasTrinket("acum") and 2 or 1) do
			UseActive(pl,trinket,uses,callback)
		end
	end
	gamemode.Call("OnTrinketActivate", trinket, pl)
end)
local function OnIn(self,new,rem)
	--print(self.TrinketsIn[new], new)
	if new == "trinket_defensive_module" then
		self:SetMaxObjectHealth(self:GetMaxObjectHealth()+50)
	elseif new == "trinket_module_resnya" then
		self:SetDTInt(12,math.min(5,self.TrinketsIn[new]))
	elseif new == "trinket_module_bounty" then
		self.CanUseModifiers = true
	elseif new == "trinket_module_handler" then
		self._OldAcc = self._OldAcc or self.Acceleration
		self.Acceleration = self._OldAcc  * (1 + 0.05 * math.min(10,self.TrinketsIn[new]))
	elseif new == "trinket_module_extreme" then
		self.AmmoUsagesStacks = math.min(3,self.TrinketsIn[new])
	elseif new == "trinket_module_nanite" then
		self.Nanites = self.TrinketsIn[new]
	end
	self._OnRemove = self._OnRemove or self.OnRemove
	self.OnRemove = function()
		for k,v in pairs(self.TrinketsIn) do
			for i=1,v do
				local ent = ents.Create("prop_invitem")
				if ent:IsValid() then
					ent:SetInventoryItemType(k)
					ent:Spawn()
					ent:SetPos(self:GetPos())
					ent:SetOwner(self:GetOwner())
					ent.DroppedTime = CurTime()
				end
			end
		end
		self:_OnRemove()
	end
	if !self.Think2 then
		self.Think2 = self.Think
		self.NextResnyaaa = CurTime() + 2
		self.NextAmmoGive = 0
		self.NextRepairSelf = 0
		self.Think = function(bruh)
			local intd = self:GetDTInt(12)
			local inte	= self.AmmoUsagesStacks
			local intnanite = self.Nanites
			local owner = self:GetObjectOwner()
			if self.NextResnyaaa < CurTime() and intd > 0 then
				for k,v in pairs(ents.FindInBoxRadius(self:GetPos(),128)) do
					if v:IsValidLivingZombie() then
						v:TakeDamage(70*intd,owner,self)
						self:EmitSound("physics/metal/sawblade_stick3.wav", 70, 250)
					end
				end
				self.NextResnyaaa = CurTime() + 1
			end
			if inte and inte > 0 and self.NextAmmoGive < CurTime() and owner:GetAmmoCount(self.AmmoType) > 1*inte then
				local ammotype = self.AmmoType
				local curammo = self:GetAmmo()
			
				local togive = math.min(3+1*inte, owner:GetAmmoCount(ammotype), self.MaxAmmo - curammo)
				if togive > 0 then
					self:SetAmmo(curammo + togive)
					owner:RemoveAmmo(togive, ammotype)
				end
				self.NextGiveAmmo = CurTime() + 1-0.25*inte
			end
			if intnanite and intnanite > 0 and self.NextRepairSelf < CurTime() then
				self:SetObjectHealth(math.min(self:GetMaxObjectHealth(),self:GetObjectHealth() + 3*intnanite))
				self.NextRepairSelf = CurTime() + 2
			end
			bruh:Think2()
		end
	end
end
local drones = {['prop_drone_hauler'] = true ,['prop_drone']  = true  ,['prop_drone_healer']  = true ,['prop_drone_pulse']  = true }
net.Receive("zs_drone_trinket", function(len, pl)
	local trinket = net.ReadString()
	local pl = net.ReadEntity()
	local data = GAMEMODE.ZSInventoryItemData[trinket]
	if data.OnlyDrones then
		for k,v in pairs(ents.FindInBoxRadius(pl:GetPos(),256)) do

			if drones[v:GetClass()] and v:GetObjectOwner() == pl  then
				v.TrinketsIn = v.TrinketsIn or {}
				v.TrinketsIn[trinket] = v.TrinketsIn[trinket] and v.TrinketsIn[trinket] + 1 or 1
				v._OnRemove = v._OnRemove or v.OnRemove
				v.OnUpdateTrinkets = OnIn
				v:OnUpdateTrinkets(trinket)
				pl:TakeInventoryItem(trinket)
				break
			end
		end
	end
end)
net.Receive("zs_upgrade_trinket", function(len, pl)
	local item = net.ReadString()
	local pl = net.ReadEntity()
	local tbl = GAMEMODE.ZSInventoryItemData[item]
	if  pl:HasInventoryItemQ(item) or !pl:HasInventoryItem(item) then pl:SendLua("surface.PlaySound(\"buttons/button10.wav\")") return end
	local newi = ""
	if  string.sub(item ,#item-1,#item-1) ~= "q" then
		newi = item.."_q1"
	else
		newi = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+1)
	end
--	print(newi)
	local cost = GAMEMODE:GetUpgradeScrap(tbl,(tonumber(string.sub(item ,#item,#item)) and tonumber(string.sub(item ,#item,#item))+1 or 1))
--	print(cost)
	if cost > pl:GetAmmoCount("scrap") or tbl.NeedForUpgrade and !pl:HasInventoryItem(tbl.NeedForUpgrade) then 
		GAMEMODE:ConCommandErrorMessage(pl, translate.ClientGet(pl, "need_to_have_enough_scrap"))
		return 
	end
	pl:SendLua("surface.PlaySound(\"buttons/lever"..math.random(5)..".wav\")")
	pl:RemoveAmmo(cost, "scrap")
--	print(GAMEMODE:GetUpgradeScrap(GAMEMODE.ZSInventoryItemData[item],tonumber(string.sub(item ,#item,#item)) or 2))
	pl:AddInventoryItem(newi)
	pl:TakeInventoryItem(item)
end)

function meta:TryAssembleItem(component, heldclass)
	local heldwep, desiassembly = self:GetWeapon(heldclass)
	local heldwepiitype = GAMEMODE:GetInventoryItemType(heldclass) ~= 4

	if heldwepiitype then
		if not self:HasInventoryItem(heldclass) then
			self:CenterNotify(COLOR_RED, translate.ClientGet(self, "inv_dont_have_s"))
			self:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
			return
		end
	else
		if not heldwep or not heldwep:IsValid() then
			self:CenterNotify(COLOR_RED, translate.ClientGet(self, "inv_dont_have_w"))
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

	local invitemresult = GAMEMODE:GetInventoryItemType(desiassembly) ~= 4

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

	if GAMEMODE:GetInventoryItemType(itype) == INVCAT_TRINKETS and (plyr:HasInventoryItem(itype) or plyr:HasInventoryItemQ(itype)) then
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
function meta:HasInventoryItemQ(item)
	local newi = ""
	local newi2 = ""
	local newi3 = ""
	local newi4 = ""
	local newi5 = ""

	if  string.sub(item ,#item-1,#item-1) ~= "q" then
		newi = item.."_q1"
		newi2 = item.."_q2"
		newi3 = item.."_q3"
		newi4 = item.."_q4"
		newi5 = item.."_q5"
	else
		newi = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+1)
		newi2 = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+2)
		newi3 = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+3)
		newi4 = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+4)
		newi5 = string.sub(item ,0,#item-1)..(tonumber(string.sub(item ,#item,#item))+5)
	end
	return self.ZSInventory[newi] or  self.ZSInventory[newi2] or  self.ZSInventory[newi3] or  self.ZSInventory[newi4] or  self.ZSInventory[newi5]
end
