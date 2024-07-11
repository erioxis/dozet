ENT.Type = "anim"

ENT.DamageMul = 1
ENT.ProjDamage = 220
ENT.Minidogs = nil
ENT.Dogs = 1
ENT.UltraMinidogs = nil
ENT.Mash = nil
function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN
end

util.PrecacheModel("models/hunter/misc/sphere075x075.mdl")
util.PrecacheSound("weapons/physcannon/physcannon_pickup.wav")

