INC_SERVER()
function SWEP:SecondaryAttack()
	if CurTime() < self:GetNextSecondaryFire() then return end
	local owner = self:GetOwner()
	self:SetNextSecondaryFire(CurTime() + 1)

    local ang = owner:EyeAngles()
    ang.pitch = math.max(-20, ang.pitch)
    
    owner:SetGroundEntity(NULL)
    owner:SetVelocity(1 * 2000 * ang:Forward())
    owner:SetAnimation(PLAYER_JUMP)
end
