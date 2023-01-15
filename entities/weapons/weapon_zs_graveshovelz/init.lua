INC_SERVER()

SWEP.OriginalMeleeDamage = SWEP.MeleeDamage

function SWEP:Deploy()
	self.BaseClass.BaseClass.Deploy(self)
end

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if not hitent:IsPlayer() then
		self.MeleeDamage = 30
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	self.MeleeDamage = self.OriginalMeleeDamage
end

function SWEP:Reload()
	self.BaseClass.SecondaryAttack(self)
end

function SWEP:ThrowHook()
	local owner = self:GetOwner()

	owner.LastRangedAttack = CurTime()

	local ent = ents.Create("projectile_devotoy")
	if ent:IsValid() then
		local ang = owner:EyeAngles()
		ang:RotateAroundAxis(ang:Up(), 90)

		ent:SetPos(owner:GetShootPos())
		ent:SetAngles(ang)
		ent:SetOwner(owner)
		ent:Spawn()

		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:SetVelocityInstantaneous(owner:GetAimVector() * 2150)
		end
	end
end

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsValid() then
		--[[local vel = ent:GetPos() - self:GetOwner():GetPos()
		vel.z = 0
		vel:Normalize()
		vel = vel * 800
		vel.z = 350

		ent:KnockDown()
		ent:SetGroundEntity(NULL)
		ent:SetVelocity(vel)]]
		local noknockdown = true
		if CurTime() >= (ent.NextKnockdown or 0) then
			noknockdown = false
			ent.NextKnockdown = CurTime() + 1
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 600 or 1600, nil, noknockdown)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end