ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN
end
ENT.IgnoreBullets = true
ENT.IgnoreMeleeTeam = TEAM_HUMAN
util.PrecacheModel("models/weapons/w_grenade.mdl")

util.PrecacheSound("physics/metal/metal_grenade_impact_hard1.wav")
util.PrecacheSound("physics/metal/metal_grenade_impact_hard2.wav")
util.PrecacheSound("physics/metal/metal_grenade_impact_hard3.wav")