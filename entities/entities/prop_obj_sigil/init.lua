INC_SERVER()

ENT.HealthLock = 0
ENT.Immune = false

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetModel("models/props_wasteland/medbridge_post01.mdl")
	self:PhysicsInitBox(Vector(-16.285, -16.285, -0.29) * self.ModelScale, Vector(16.285, 16.285, 104.29) * self.ModelScale)
	self:SetUseType(SIMPLE_USE)
	
	
	
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end
	if GAMEMODE:GetWave() <= 7 then
		self.Immune = true
	end

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetSigilHealthBase(self.MaxHealth)
	self:SetSigilHealthRegen(self.HealthRegen)
	self:SetSigilLastDamaged(0)

	local ent = ents.Create("prop_prop_blocker")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:SetOwner(self)
		--ent:SetParent(self) -- Prevents collisions
		self:DeleteOnRemove(ent)
	end
	--[[local ent = ents.Create("prop_dynamic")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetModel("models/dav0r/hoverball.mdl")
		ent:SetCollisionGroup( COLLISION_GROUP_WORLD )
		ent:PhysicsInit(SOLID_NONE)
		ent:Spawn()
		ent:SetModelScale(104)
		ent:DrawShadow(false)
		ent:SetRenderFX(kRenderFxDistort)
		ent:SetOwner(self)
		--ent:SetParent(self) -- Prevents collisions
		self:DeleteOnRemove(ent)
	end]]
end

function ENT:Use(pl)
	if pl.NextSigilTPTry and pl.NextSigilTPTry >= CurTime() then return end
	local sigilsc = 0
	for _, ent in pairs(ents.GetAll()) do 
		if ent:GetClass() == "prop_obj_sigil" then
			sigilsc = sigilsc + 1
		end
	end
	if  sigilsc > 5 then 
		pl:GiveAchievement("happy")
	end
	if pl:Team() == TEAM_HUMAN and pl:Alive() and not self:GetSigilCorrupted() or pl:Team() == TEAM_UNDEAD and pl:Alive() and self:GetSigilCorrupted() then
		local tpexist = pl:GetStatus("sigilteleport")
		if tpexist and tpexist:IsValid() then return end

		if GAMEMODE:NumUncorruptedSigils() >= 2 or pl:Team() == TEAM_UNDEAD and GAMEMODE:NumCorruptedSigils() >= 2 then
			local status = pl:GiveStatus("sigilteleport")
			if status:IsValid() then
				status:SetFromSigil(self)
				status:SetEndTime(CurTime() + 3 * (pl.SigilTeleportTimeMul or 1))
				pl:GiveAchievement("waytobest")

				pl.NextSigilTPTry = CurTime() + 2
			end
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if self:GetSigilHealth() <= 0 or dmginfo:GetDamage() <= 0 then return end
	local attacker = dmginfo:GetAttacker()
	if  attacker:IsPlayer() and  attacker:GetZombieClassTable().BaraCat or dmginfo:GetInflictor() and dmginfo:GetInflictor():GetClass() == "weapon_zs_fistz"  then return end

	if attacker:IsValid() and attacker:IsPlayer() and dmginfo:GetDamage() > 2 and CurTime() >= self.HealthLock then
		if self:CanBeDamagedByTeam(attacker:Team()) then
			if attacker:Team() == TEAM_HUMAN then
				local dmgtype = dmginfo:GetDamageType()
				if bit.band(dmgtype, DMG_SLASH) ~= 0 or bit.band(dmgtype, DMG_CLUB) ~= 0 or bit.band(dmgtype, DMG_BULLET) ~= 0 and attacker:IsSkillActive(SKILL_UNSIGIL)  then
					dmginfo:SetDamage(dmginfo:GetDamage() * 0.5 * (attacker:IsSkillActive(SKILL_UNSIGIL) and 0.1 or 1))
				else
					dmginfo:SetDamage(0)
					return
				end
			end

			local oldhealth = self:GetSigilHealth()
			self:SetSigilLastDamaged(CurTime())
			self:SetSigilHealthBase(oldhealth - dmginfo:GetDamage())

			if self:GetSigilHealth() <= 0 then
				if self:GetSigilCorrupted() then
					gamemode.Call("PreOnSigilUncorrupted", self, dmginfo)
					self:SetSigilCorrupted(false)
					self:SetSigilLastDamaged(0)
					gamemode.Call("OnSigilUncorrupted", self, dmginfo)
					attacker:GiveAchievementProgress("cleaner", 1)
				else
					gamemode.Call("PreOnSigilCorrupted", self, dmginfo)
					self.HealthLock = CurTime() + 4
					self:SetSigilCorrupted(true)
					self:SetSigilLastDamaged(0)
					gamemode.Call("OnSigilCorrupted", self, dmginfo)
					if !self.Immune then self:Remove() return end
				end
			end
		elseif attacker:Team() == TEAM_UNDEAD then
			self.HealthLock = CurTime() + 2.1
		end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
function ENT:Think()
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), math.Clamp(948 / (GAMEMODE:GetWave() * 0.33),163,948))) do
		if ent ~= self and ent:IsValidLivingHuman() and not self:GetSigilCorrupted() and ent.PlayerReady then
           ent:GiveStatus("sigildef", 2)
		elseif ent ~= self and ent:IsValidLivingZombie() and self:GetSigilCorrupted() then
			ent:GiveStatus("corruptsigildef", 2)
		end
	end
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 128)) do
		if ent and table.HasValue({"prop_physics","prop_physics_multiplayer"},ent:GetClass()) and ent ~= self then
			local targetpos = self:LocalToWorld(self:OBBCenter())
			local direction = (targetpos - ent:GetPos()):GetNormal()
			local phys = ent.GetPhysicsObject and ent:GetPhysicsObject() or ent
			if phys:IsValid() then
				phys:SetVelocity(direction * -50)
			end
		end
	end
end
function ENT:OnRemove()
	local efc = EffectData()
	efc:SetOrigin(self:GetPos())
	util.Effect("sigildestruction",efc)
end

