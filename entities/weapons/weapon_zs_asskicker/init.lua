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
		local noknockdown = true
		if CurTime() >= (ent.NextKnockdown or 0) then
			noknockdown = false
			ent.NextKnockdown = CurTime() + 12
		end
		ent:ThrowFromPositionSetZ(trace.StartPos, ent:IsPlayer() and 1200 or 3200, nil, noknockdown)
	end
		if math.random(20) == 1 then
			local killer = self:GetOwner()
			timer.Simple(3, function()
				ent:Kill()
			end)
			
		end
		
	
	

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end
