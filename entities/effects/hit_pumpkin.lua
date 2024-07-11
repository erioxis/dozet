function EFFECT:Init(data)
	local pos = data:GetOrigin()
	local norm = data:GetNormal() * -1

	sound.Play("physics/flesh/flesh_squishy_impact_hard"..math.random(1,4)..".wav", pos, 77, math.Rand(95, 105))


	local maxbound = Vector(3, 3, 3)
	local minbound = maxbound * -1
	for i=1, 5 do
		local dir = (norm * 2 + VectorRand()) / 3
		dir:Normalize()

		local ent = ClientsideModel("models/draganm_custom/pumpkin_pack/pumpkindg_0"..math.random(11, 16)..".mdl", RENDERGROUP_OPAQUE)
		if ent:IsValid() then
			ent:SetModelScale(math.Rand(0.3, 1), 0)
			ent:SetPos(pos + dir * 6 + Vector(0,0,12))
			ent:PhysicsInitBox(minbound, maxbound)
			ent:SetCollisionBounds(minbound, maxbound)

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:ApplyForceOffset(ent:GetPos() + VectorRand() * 5, dir * math.Rand(300, 800))
			end

			SafeRemoveEntityDelayed(ent, math.Rand(6, 10))
		end
	end
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
