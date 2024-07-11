ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	if GAMEMODE.RoundEnded then return false end
	return ent:IsPlayer() and ent:Team() ~= TEAM_UNDEAD
end

util.PrecacheModel("models/Gibs/HGIBS.mdl")
