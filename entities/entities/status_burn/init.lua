INC_SERVER()
function ENT:SetDie(fTime)
	if fTime == 0 or not fTime then
		self.DieTime = 0
	elseif fTime == -1 then
		self.DieTime = 999999999
	else
		self.DieTime = CurTime() + fTime
		self:SetDuration(fTime)
	end
end


function ENT:Think()

	local owner = self:GetOwner()
	local lox = owner:IsSkillActive(SKILL_LOX)

	local dmg = (lox and math.Clamp((owner:GetMaxHealth() / 150) * 2, 2, 50) or math.Clamp(owner:GetMaxHealth() / 150, 1, 50))

	owner:TakeSpecialDamage(dmg, DMG_BURN, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager:Team() ~= owner:Team() and self.Damager or owner, self, nil,0)
	self:AddDamage(-dmg)
	owner:AddLegDamageExt(dmg, owner, owner, SLOWTYPE_FLAME)

	self:NextThink(CurTime() + 0.15)
	if self.DieTime <= CurTime() then
		self:Remove()
	end
	return true
end
