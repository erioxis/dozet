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
	if self:GetOwner():GetZombieClassTable().FireBuff then return end
	if self:GetOwner():GetZombieClassTable().ResistFrost  then self:Remove() end
	local owner = self:GetOwner()
	local lox = owner:IsSkillActive(SKILL_LOX)

	local dmg = math.Clamp(owner:GetMaxHealth() * (lox and 2 or 1) / 150, 1, 50)
	owner:TakeSpecialDamage(dmg, DMG_BURN, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner, self, nil,0)
	self:AddDamage(-dmg)
	owner:AddLegDamageExt(dmg, owner, owner, SLOWTYPE_FLAME)
	owner:SetBloodArmor(owner:GetBloodArmor()-dmg)

	self:NextThink(CurTime() + 0.15)
	if self.DieTime <= CurTime() then
		self:Remove()
	end
	return true
end
