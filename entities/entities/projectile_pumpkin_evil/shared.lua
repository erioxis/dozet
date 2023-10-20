ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN or ent.Unstone == 1
end

ENT.Damage = 700

ENT.PointsMultiplier = 1
