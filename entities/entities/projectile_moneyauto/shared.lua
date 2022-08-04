ENT.Type = "anim"

ENT.AllowSelfRicoShot = true
ENT.DamageMul = 1
ENT.ProjDamage = 220
function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_UNDEAD
end

util.PrecacheModel("models/props_trainstation/trainstation_clock001.mdl")
util.PrecacheSound("weapons/physcannon/physcannon_pickup.wav")

