INC_SERVER()

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if ent:IsValid() then
		if ent.ClanAvanguard and math.random(100) <= 5 then self:GetOwner():Kill() return end
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
			ent.NextKnockdown = CurTime() + 3.7
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 2200 or 6000, nil, noknockdown)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
