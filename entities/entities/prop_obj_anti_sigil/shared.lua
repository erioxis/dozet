ENT.Type = "anim"


ENT.AntiSigil = true
ENT.Sigil = true

ENT.ModelScale = 0.85

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true
ENT.IsBarricadeObject = true
ENT.IgnoreBullets = false
function ENT:ShouldNotCollide(ent)
	return true
end