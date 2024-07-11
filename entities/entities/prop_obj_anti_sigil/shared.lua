ENT.Type = "anim"


ENT.AntiSigil = true
ENT.Sigil = true

ENT.ModelScale = 0.6

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true
ENT.IsBarricadeObject = true
ENT.IgnoreBullets = true
ENT.IgnoreMelee = true
function ENT:ShouldNotCollide(ent)
	return true
end