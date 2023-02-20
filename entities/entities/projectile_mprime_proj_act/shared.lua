ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN or !ent:IsPlayer()
end

util.PrecacheModel("models/Combine_Helicopter/helicopter_bomb01.mdl")