INC_SERVER()


ENT.IgnoreEnt = NULL 
ENT.NextIgnoreUse = 0

function ENT:Initialize()
	self:SetModel("models/Items/item_item_crate.mdl")
	self:SetModelScale(2)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)
	self:SetColor(Color(160, 136, 37))
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(Vector(0,0,-20000))
	end

end

function ENT:SetGibType(id)
	self.m_GibType = math.Clamp(math.ceil(id), 1, #GAMEMODE.HumanGibs)
end

function ENT:KeyValue(key, value)
	key = string.lower(key)
	if key == "gibtype" then
		value = tonumber(value)
		if not value then return end

		self:SetGibType(value)
	end
end

function ENT:StartTouch(ent)
	if self.NextIgnoreUse >= CurTime() then return end
	if  ent:IsValidLivingHuman() then
		local taked = ""
		if math.random(1,10) == 1 then
			ent:AddInventoryItem("cons_bounty")
				net.Start("zs_invitem")
				net.WriteString("cons_bounty")
			net.Send(ent)	
			taked = "Награда"
			if ent:GetResupplyAmmoType() == "battery" then
				ent.MedicalBounty = ent.MedicalBounty + 1
				taked = "Мед."..taked
			end
		end
		if math.random(1,2) == 2 or ent:GetMastery('gunner') > 3 then
			local ammo = (ent:GetActiveWeapon() and ent:GetResupplyAmmoType() or "scrap")
			local aaaa = math.Round(GAMEMODE.AmmoCache[ammo]*(GAMEMODE:GetWave()+1)/3)
			ent:GiveAmmo(aaaa,ammo)
			local ammotype = (GAMEMODE.AmmoNames[ent:GetResupplyAmmoType()] or ent:GetResupplyAmmoType())
			taked = taked.."/"..(translate.ClientGet(ent,string.lower(string.Implode("",string.Explode(" ","ammo_"..ammotype)) or ammotype))).."("..aaaa..")"
		end
		if math.random(1,5) == 1 then
					ent:AddInventoryItem("cons_soul_picka")
					net.Start("zs_invitem")
					net.WriteString("cons_soul_picka")
				net.Send(ent)	
			taked = taked.."/Получил Жетон Души"
		end
		if ent:GetMastery('medic') > 3 and math.random(1,10) == 1 then
			ent:AddInventoryItem("cons_bounty")
			net.Start("zs_invitem")
				net.WriteString("cons_bounty")
			net.Send(ent)	
			ent.MedicalBounty = ent.MedicalBounty + 1
			taked =  taked.."/Мед.Награда"
		end
		if math.random(1,9) == 1 then
			local rand = math.random(100,1000)
			ent:AddZSXP(rand,true)
			taked = taked.."/Получил "..rand.." ОД"
		end
		PrintTranslatedMessage(HUD_PRINTTALK,"from_supply_taked_a",ent:Nick(),taked)
		self:Remove()
	end
end
