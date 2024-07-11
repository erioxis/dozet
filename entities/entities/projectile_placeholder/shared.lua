ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return true
end

util.PrecacheModel("models/Combine_Helicopter/helicopter_bomb01.mdl")