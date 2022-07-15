INC_SERVER()

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.Bleed = self
end

function ENT:Think()
	local owner = self:GetOwner()

	if self:GetDamage() <= 0 then
		self:Remove()
		return
	end

	local dmg = math.Clamp(self:GetDamage(), 1, 2)
	if not owner:IsSkillActive(SKILL_DEFENDBLOOD) then
	owner:TakeDamage(dmg, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner, self)
		self:AddDamage(-dmg)
	elseif owner:IsSkillActive(SKILL_DEFENDBLOOD) then
		owner:SetHealth(owner:Health() + dmg)
		self:AddDamage(-dmg)
	end

	local dir = VectorRand()
	dir:Normalize()
	util.Blood(owner:WorldSpaceCenter(), 3, dir, 32)

	local moving = owner:GetVelocity():LengthSqr() >= 19600 --140^2
	local ticktime = (moving and 0.65 or 1.3)/(owner.BleedSpeedMul or 1)
	self:NextThink(CurTime() + ticktime)
	return true
end
