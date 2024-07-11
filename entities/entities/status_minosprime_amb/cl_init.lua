INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_NONE

function ENT:Initialize()
	self:DrawShadow(false)

	self.AmbientSound = CreateSound(self, "zombiesurvival/ambiance_order_minos.mp3")
	self.AmbientSound:PlayEx(2, 100)
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

function ENT:Think()
	owner = self:GetOwner()
	if owner:IsValid() then
		local wep = owner:GetActiveWeapon()
		self.AmbientSound:PlayEx(1, 100 + math.sin(RealTime()))
	end
end

function ENT:Draw()
end
