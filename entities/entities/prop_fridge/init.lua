INC_SERVER()

local function RefreshFridgeOwners(pl)
	for _, ent in pairs(ents.FindByClass("prop_fridge")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:SetObjectOwner(NULL)
		end
	end
end
hook.Add("PlayerDisconnected", "Fridge.PlayerDisconnected", RefreshFridgeOwners)
hook.Add("OnPlayerChangedTeam", "Fridge.OnPlayerChangedTeam", RefreshFridgeOwners)

function ENT:Initialize()
	self:SetModel("models/props_c17/furniturefridge001a.mdl")

	self:SetUseType(SIMPLE_USE)
	self:SetPlaybackRate(1)
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	
    self:PhysicsInit(SOLID_VPHYSICS)

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)
	end
	self:SetPos(self:GetPos()+Vector(0,0,20))
	self:SetMaxObjectHealth(350)
	self:SetObjectHealth(self:GetMaxObjectHealth())
end

function ENT:KeyValue(key, value)
	key = string.lower(key)
	if key == "maxcratehealth" then
		value = tonumber(value)
		if not value then return end

		self:SetMaxObjectHealth(value)
	elseif key == "cratehealth" then
		value = tonumber(value)
		if not value then return end

		self:SetObjectHealth(value)
	end
end

function ENT:AcceptInput(name, activator, caller, args)
	if name == "setcratehealth" then
		self:KeyValue("cratehealth", args)
		return true
	elseif name == "setmaxcratehealth" then
		self:KeyValue("maxcratehealth", args)
		return true
	end
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true

		if self:GetObjectOwner():IsValidLivingHuman() then
			self:GetObjectOwner():SendDeployableLostMessage(self)
		end
		if self:GetObjectOwner():IsSkillActive(SKILL_EXPLOIT) and math.random(1,4) == 1 then
			if math.random(1,3) ~= 1 then
				self:GetObjectOwner():Give("weapon_zs_remantler")
			else
				self:GetObjectOwner():Give("weapon_zs_resupplybox")
			end
		end
		local ent = ents.Create("prop_physics")
		if ent:IsValid() then
			ent:SetModel(self:GetModel())
			ent:SetMaterial(self:GetMaterial())
			ent:SetAngles(self:GetAngles())
			ent:SetPos(self:GetPos())
			ent:SetSkin(self:GetSkin() or 0)
			ent:SetColor(self:GetColor())
			ent:Spawn()
			ent:Fire("break", "", 0)
			ent:Fire("kill", "", 0.1)
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	self:TakePhysicsDamage(dmginfo)

	local attacker = dmginfo:GetAttacker()
	if not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())
		self:ResetLastBarricadeAttacker(attacker, dmginfo)
	end
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnPackedUp(pl)
	pl:GiveEmptyWeapon("weapon_zs_fridge")
	pl:GiveAmmo(1, "fridge")

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth())

	self:Remove()
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
	elseif self.Close and CurTime() >= self.Close then
		self.Close = nil
		self:ResetSequence("open")
		self:EmitSound("items/ammocrate_close.wav")
	end
end

function ENT:Use(activator, caller)
	if activator:Team() ~= TEAM_HUMAN or not activator:Alive() then return end

	if not self:GetObjectOwner():IsValid() then
		self:SetObjectOwner(activator)
		self:GetObjectOwner():SendDeployableClaimedMessage(self)
	end
	if (activator.FridgeCaches or 0) <= 0 then
		activator:CenterNotify(COLOR_RED, translate.ClientGet(activator, "no_ammo_here"))
		return
	end
	local owner = self:GetObjectOwner()
	local food = GAMEMODE.Food[math.random(1,#GAMEMODE.Food)]
	local m = 0
	while activator:HasWeapon(food) do
		food =  GAMEMODE.Food[math.random(1,#GAMEMODE.Food)]
		m = m + 1
		if m == 10 then
			break
		end
	end
	activator.FridgeCaches = (activator.FridgeCaches or 1) - 1

	net.Start("zs_fridgecaches")
		net.WriteInt(activator.FridgeCaches, 12)
		net.WriteBool(false)
	net.Send(activator)
	if owner ~= activator then
		owner:AddPoints(3)
	end
	activator:Give(food)
	if  not self.Close then
		self:ResetSequence("close")
		self:EmitSound("items/ammocrate_open.wav")
	end
	self.Close = CurTime() + 3
end
