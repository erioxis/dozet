INC_SERVER()
SWEP.Primary.Projectile = "projectile_medicrifle"
function SWEP:Think()
	self:CheckSpool()

	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end
end
