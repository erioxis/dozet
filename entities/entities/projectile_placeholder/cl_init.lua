INC_CLIENT()

ENT.NextEmit = 0

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:DrawShadow(false)
end
local matGlow = Material("sprites/light_glow02_add")
local matWhite = Material("models/debug/debugwhite")
function ENT:Draw()

end
