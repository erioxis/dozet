INC_CLIENT()
function ENT:Initialize()
	self:GetOwner().FleshStatus = self
end
ENT.NextEmit = 0.02
local matFlesh = Material("models/flesh")
function ENT:Draw()
	if self:GetDamage() <= 0 then return end
	local owner = self:GetOwner()
	local to2 = self:GetDamage()/self:GetMaxStacks(owner)
	render.ModelMaterialOverride(matFlesh)
	render.SetColorModulation(0.851, 0.137, 0.137)
	for i=0,16 do
		owner:ManipulateBoneScale(i, Vector(1+to2,1+to2,1+to2))
	end
	owner:DrawModel()
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end
function ENT:OnRemove()
	local owner = self:GetOwner()
	for i=0,16 do
		owner:ManipulateBoneScale(i, Vector(1,1,1))
	end
end