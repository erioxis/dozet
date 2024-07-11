INC_SERVER()

function SWEP:Think()
	self:CheckSpool()

	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end
end
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:GetOwner().LastRangedAttack = CurTime()
	if not self:GetSpooling() then
		self:SetSpooling(true)
		self:EmitSound("ambient/machines/spinup.wav", 75, 65)
		self:GetOwner():ResetSpeed()

		self:SetNextPrimaryFire(CurTime() + 0.75)
	else
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

		self:EmitFireSound()
		self:TakeAmmo()
		self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end

