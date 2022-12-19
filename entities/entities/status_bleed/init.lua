INC_SERVER()

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.Bleed = self
end

function ENT:Think()
	local owner = self:GetOwner()
	local lox = self.Damager and self.Damager:IsPlayer() and self.Damager:IsSkillActive(SKILL_LOX)
	if self:GetDamage() <= 0 or owner:GetZombieClassTable().Skeletal then
		self:Remove()
		return
	end

	local dmg = (lox and math.Clamp(self:GetDamage() * 2, 2, 8) or math.Clamp(self:GetDamage(), 1, 4))
	if not owner:IsSkillActive(SKILL_DEFENDBLOOD) then
		owner:TakeDamage(dmg + self:GetDamage() * 0.01, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner, self)
		self:AddDamage(-dmg - self:GetDamage() * 0.01)
	elseif owner:IsSkillActive(SKILL_DEFENDBLOOD)then
		owner:SetHealth(math.min(owner:Health() + (dmg * 2) + self:GetDamage() * 0.01,2000))
		self:AddDamage(-dmg - self:GetDamage() * 0.01)
	end

	local dir = VectorRand()
	dir:Normalize()
	util.Blood(owner:WorldSpaceCenter(), 3, dir, 32)

	local moving = owner:GetVelocity():LengthSqr() >= 19600 --140^2
	local ticktime = (moving and 0.65 or 1.3)/(owner.BleedSpeedMul or 1)
	self:NextThink(CurTime() + ticktime)
	return true
end
