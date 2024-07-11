ENT.Type = "anim"

ENT.DamageMul = 1
ENT.ProjDamage = 220
ENT.Minidogs = nil
function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN or ent == self.NoCollideHim
end

util.PrecacheModel("models/Gibs/HGIBS.mdl")
util.PrecacheSound("weapons/physcannon/physcannon_pickup.wav")

