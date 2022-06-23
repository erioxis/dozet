INC_SERVER()

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
		if math.random(7) == 1 and ent:IsPlayer() then
			timer.Simple(3, function()
				ent:Kill()
			end)
		end
		if math.random(30) == 1 and not ent:IsPlayer() then
			ent:Remove()
		end
		local noknockdown = true
		if CurTime() >= (ent.NextKnockdown or 0) then
			noknockdown = false
			ent.NextKnockdown = CurTime() + 12
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 1200 or 3200, nil, noknockdown)
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
