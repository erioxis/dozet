INC_CLIENT()

local matGlow = Material("sprites/light_glow02_add")

function ENT:Initialize()
	self:SetModelScale(0.2, 0)
	self:SetColor(Color(255, 255, 100))
	self:DrawShadow(false)
end


