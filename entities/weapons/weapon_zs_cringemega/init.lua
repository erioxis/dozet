INC_SERVER()

function SWEP:Think()
	local pl = self:GetOwner()

	if self.PukeLeft > 0 and CurTime() >= self.NextPuke then
		self.PukeLeft = self.PukeLeft - 6
		self.NextEmit = CurTime() + 0.1
		pl.LastRangedAttack = CurTime()

		local ent = ents.Create(self.PukeLeft % 6 == 1 and "projectile_ghoulfleshpuke" or "projectile_poisonpuke")
		if ent:IsValid() then
			ent:SetPos(pl:EyePos())
			ent:SetOwner(pl)
			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				local ang = pl:EyeAngles()
				ang:RotateAroundAxis(ang:Forward(), math.Rand(-1, 1))
				ang:RotateAroundAxis(ang:Up(), math.Rand(-2, 2))
				phys:SetVelocityInstantaneous(ang:Forward() * math.Rand(1000, 1200))
			end
		end
	end

	self:NextThink(CurTime())
	return true
end

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:AddCursed(self:GetOwner(), 100,nil,nil,true)
		end
		if (not cursed) then 
			pl:AddCursed(pl:GetOwner(), 40)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end