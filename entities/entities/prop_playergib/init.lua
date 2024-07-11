INC_SERVER()

ENT.DieTime = 0

function ENT:Initialize()
	self.ObjHealth = 25
	self.NextUse = 0
	if self.DieTime == 0 then
		self.DieTime = CurTime() + GAMEMODE.GibLifeTime
	end

	local modelid
	if self.m_GibType then
		modelid = self.m_GibType
	else
		modelid = math.random(#GAMEMODE.HumanGibs)
	end
	self:SetModel(GAMEMODE.HumanGibs[modelid])
	if 4 < modelid then
		self:SetMaterial("models/flesh")
	end
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("zombieflesh")
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(VectorRand():GetNormalized() * math.Rand(2000, 5000))
		phys:AddAngleVelocity(VectorRand() * 360)
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
	elseif key == "lifetime" then
		value = tonumber(value)
		if not value then return end

		if value <= 0 then
			self.DieTime = -1
		else
			self.DieTime = CurTime() + value
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	self:TakePhysicsDamage(dmginfo)

	self.ObjHealth = self.ObjHealth - dmginfo:GetDamage()
	if self.ObjHealth <= 0 and not self.Destroyed then
		self.Destroyed = true
		self.DieTime = 0

		util.Blood(self:GetPos(), math.random(2), Vector(0, 0, 1), 100, self:GetDTInt(0), true)
	end
end

function ENT:Think()
	if self.DieTime >= 0 and self.DieTime <= CurTime() then
		self:Remove()
	end
end
<<<<<<< Updated upstream
=======
function ENT:Use(activator, caller)
	if self.NextUse > CurTime() or activator and activator:IsValidLivingHuman() and activator:GetProgress("parasite_prog") >= CurTime() or (activator.NextGibEat or 1) >= CurTime()  then return end
	activator.NextGibEat = CurTime() + 0.2
	if self.DieTime ~= 0 and activator:IsSkillActive(SKILL_CAN_EATER) and not activator:IsSkillActive(SKILL_GLUTTON) and not activator:IsValidLivingZombie() then
		self:TakeDamage(6)
		self:GetPhysicsObject():SetVelocity(VectorRand(50,320))
		self.NextUse = CurTime()+ 0.8
		local mp = activator:IsSkillActive(SKILL_D_FRAIL) and math.floor(activator:GetMaxHealth() * 0.44) or activator:IsSkillActive(SKILL_ABUSE) and math.floor(activator:GetMaxHealth() * 0.25) or activator:GetMaxHealth()
		activator:SetHealth(math.min(mp, activator:Health() + 6))
		local cursed = activator:GetStatus("cursed")
		if (cursed) and activator:IsSkillActive(SKILL_RESNYA) then
			activator:AddCursed(activator, cursed.DieTime - CurTime() - 2)
		end
		for _, pl3 in pairs(player.FindInSphere(activator:GetPos(), 128 * activator:GetModelScale())) do
			if pl3:IsValidLivingHuman() and activator:IsSkillActive(SKILL_FOODHEALS) then
				activator:HealPlayer(pl3, 15)
			end
		end
		self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
		util.Blood(self:GetPos(), math.random(2), Vector(0, 0, 1), 100, self:GetDTInt(0), true)
	elseif self.DieTime ~= 0 and activator:IsSkillActive(SKILL_CAN_EATER) and activator:IsSkillActive(SKILL_GLUTTON)  then
		self.DieTime = 0
		for _, pl in pairs(player.FindInSphere(activator:GetPos(), 128 * activator:GetModelScale())) do
			if pl:IsValidLivingHuman() and activator:IsSkillActive(SKILL_FOODHEALS) then
				pl:SetBloodArmor(math.min(pl.MaxBloodArmor + 10, pl:GetBloodArmor() + 10))
				if pl:GetBloodArmor() < pl.MaxBloodArmor + 10 then
					activator:AddPoints(2)
				end
			end
		end
		activator:SetBloodArmor(math.min(activator.MaxBloodArmor + 40, activator:GetBloodArmor() + 30))
		self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
		util.Blood(self:GetPos(), math.random(2), Vector(0, 0, 1), 100, self:GetDTInt(0), true)
	end
end
>>>>>>> Stashed changes

function ENT:StartTouch(ent)
	if self.DieTime ~= 0 and ent:IsValidLivingZombie() and ent:Health() < ent:GetMaxZombieHealth() and not ent:GetStatus("shockdebuff") --[[and not ent:GetZombieClassTable().Boss]] then
		self.DieTime = 0

		ent:SetHealth(math.min(ent:GetMaxZombieHealth(), ent:Health() + 10))

		self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
		util.Blood(self:GetPos(), math.random(2), Vector(0, 0, 1), 100, self:GetDTInt(0), true)
	end
end
