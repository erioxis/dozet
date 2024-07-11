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
	local p = self:GetOwner():GetZombieClassTable()
	if  p.FireBuff or p.ResistFrost then self:Remove() return end
	local owner = self:GetOwner()

	local dmg = math.Clamp(owner:GetMaxHealth() * (owner:IsSkillActive(SKILL_LOX) and 2 or 1) / 50, 1, 250)
	owner:TakeSpecialDamage(dmg, DMG_BURN, self.Damager and self.Damager:IsValidLivingPlayer() and self.Damager or owner, self, nil,0)
	--self:AddDamage(-dmg)
	owner:AddLegDamageExt(dmg, owner, owner, SLOWTYPE_FLAME)
	owner:SetBloodArmor(owner:GetBloodArmor()-dmg)

	self:NextThink(CurTime() + 0.5)
	if self.DieTime <= CurTime() then
		self:Remove()
	end
	return true
end
