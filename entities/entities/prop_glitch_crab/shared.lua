ENT.Type = "anim"

ENT.NoNails = true
ENT.MinionSpawn = true

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_UNDEAD or ent:GetClass() == 'prop_glitch_crab'
end

util.PrecacheModel("models/hunter/blocks/cube025x025x025.mdl")
util.PrecacheModel("models/headcrabclassic.mdl")
AccessorFuncDT(ENT, "Settled", "Bool", 0)
