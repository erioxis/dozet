ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	if GAMEMODE.RoundEnded then return false end
	return ent:IsValidLivingPlayer() and ent:Team() == TEAM_UNDEAD
end
