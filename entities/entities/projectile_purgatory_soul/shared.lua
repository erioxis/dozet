ENT.Type = "anim"
ENT.IgnoreBullets = true
ENT.IgnoreMeleeTeam = TEAM_HUMAN
function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN
end

util.PrecacheModel("models/Combine_Helicopter/helicopter_bomb01.mdl")