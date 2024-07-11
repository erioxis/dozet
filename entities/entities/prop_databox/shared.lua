ENT.Type = "anim"
ENT.Base = "prop_baseoutlined"

ENT.NoNails = true

function ENT:HumanHoldable(pl)
	return true
end
function ENT:ShouldNotCollide(ent)
	return true
end