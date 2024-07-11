INC_CLIENT()

ENT.NextEmit = 0.02
function ENT:Initialize()
	self:GetOwner().RegenStatus = self
end
