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
local weps = weapons.GetList()
local clear = {}
for _,v in pairs(weps) do
	if (v.Tier or 6) < 5 and (v.Tier or 6) > 2 then
		clear[#clear + 1] = v.ClassName
	end
end

function ENT:StartTouch(ent)
	if self.IgnoreEnt == ent and self.NextIgnoreUse >= CurTime() then return end
	self.DNNCA = ent
	if  ent:IsValidLivingHuman() then
		ent:AddInventoryItem("cons_bounty")
		net.Start("zs_invitem")
		net.WriteString("cons_bounty")
	net.Send(ent)	
		local taked = "Награда"
		if ent:GetResupplyAmmoType() == "battery" then
			ent.MedicalBounty = ent.MedicalBounty + 1
			taked = "Мед."..taked
		end
		if math.random(1,2) == 2 then
			local ammo = (ent:GetActiveWeapon() and ent:GetResupplyAmmoType() or "scrap")
			local aaaa = GAMEMODE.AmmoCache[ammo]*(GAMEMODE:GetWave()+1)
			ent:GiveAmmo(aaaa,ammo)
			local ammotype = (GAMEMODE.AmmoNames[ent:GetResupplyAmmoType()] or ent:GetResupplyAmmoType())
			taked = taked.."|"..(translate.ClientGet(ent,string.lower(string.Implode("",string.Explode(" ","ammo_"..ammotype)) or ammotype))).."("..aaaa..")"
		end
		if math.random(1,3) == 1 then
			local brh = clear[math.random(1,#clear)]
			ent:Give(brh)
		--	print(brh)
			taked = taked.."|"..weapons.Get(brh).PrintName
		end
		if math.random(1,4) == 4 then
			local wrep = math.random(1,4)
			for i=1,wrep do
					ent:AddInventoryItem("cons_soul_picka")
					net.Start("zs_invitem")
					net.WriteString("cons_soul_picka")
				net.Send(ent)	
			end
			taked = taked.."|Получил x"..math.random(1,4).." раз Жетон Души"
		end
		if math.random(1,5) == 5 then
			local rand = math.random(200,900)
			ent:AddZSXP(rand,true)
			taked = taked.."|Получил "..rand.." ОД"
		end
		PrintTranslatedMessage(HUD_PRINTTALK,"from_airdrop_taked_a",ent:Nick(),taked)
		self:Remove()
	end
end
function ENT:OnRemove()
	GAMEMODE:TopNotify(COLOR_RED,{killicon = "weapon_zs_arsenalcrate"},translate.Format("airdrop_t",self.DNNCA and self.DNNCA:Nick() or "basturma"))
end
