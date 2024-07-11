INC_SERVER()

ENT.HealthLock = 0

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetModel("models/props_wasteland/medbridge_post01.mdl")
	self:PhysicsInitBox(Vector(-16.285, -16.285, -0.29) * self.ModelScale, Vector(16.285, 16.285, 104.29) * self.ModelScale)
	self:SetUseType(SIMPLE_USE)
	
	
	self:SetSigilCorrupted(true)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end
	GAMEMODE.IdolsAreActive = true

	self:SetSigilHealthBase(self.MaxHealth)
	self:SetSigilHealthRegen(self.HealthRegen)
	self:SetSigilLastDamaged(0)


end

function ENT:Use(pl)
end

function ENT:OnTakeDamage(dmginfo)
	if self:GetSigilHealth() <= 0 or dmginfo:GetDamage() <= 0 then return end
	local attacker = dmginfo:GetAttacker()

	if attacker:IsValid() and attacker:IsPlayer() then
		if attacker:Team() == TEAM_HUMAN  then
			dmginfo:SetDamage(dmginfo:GetDamage()*0.3)

			local oldhealth = self:GetSigilHealth()
			self:SetSigilLastDamaged(CurTime())
			self:SetSigilHealthBase(oldhealth - dmginfo:GetDamage())

			if self:GetSigilHealth() <= 0 then
				self:Remove()
				if #ents.FindByClass('prop_idols') < 2 then
					GAMEMODE.IdolsAreActive = false
				end
			end
		end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
function ENT:OnRemove()
	local efc = EffectData()
	efc:SetOrigin(self:GetPos())
	util.Effect("sigildestruction",efc)
end

