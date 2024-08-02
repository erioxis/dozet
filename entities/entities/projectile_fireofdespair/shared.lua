ENT.Type = "anim"

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer()
end

function ENT:Initialize()
	self.ModelType = math.random( 1, 21 )
end

ENT.Models = {
	"models/props_c17/canisterchunk01b.mdl",
	"models/props_c17/canisterchunk01c.mdl",
	"models/props_c17/canisterchunk01d.mdl",
	"models/props_c17/canisterchunk01f.mdl",
	"models/props_c17/canisterchunk01g.mdl",
	"models/props_c17/canisterchunk01h.mdl",
	"models/props_c17/canisterchunk01i.mdl",
	"models/props_c17/canisterchunk01k.mdl",
	"models/props_c17/canisterchunk01l.mdl",
	"models/props_c17/canisterchunk01m.mdl",
	"models/props_c17/canisterchunk02b.mdl",
	"models/props_c17/canisterchunk02c.mdl",
	"models/props_c17/canisterchunk02d.mdl",
	"models/props_c17/canisterchunk02e.mdl",
	"models/props_c17/canisterchunk02f.mdl",
	"models/props_c17/canisterchunk02g.mdl",
	"models/props_c17/canisterchunk02h.mdl",
	"models/props_c17/canisterchunk02i.mdl",
	"models/props_c17/canisterchunk02k.mdl",
	"models/props_c17/canisterchunk02l.mdl",
	"models/props_c17/canisterchunk02m.mdl"
}
