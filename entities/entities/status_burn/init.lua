INC_SERVER()

function ENT:Think()
<<<<<<< Updated upstream
	local owner = self:GetOwner()

	if self:GetDamage() <= 0 or owner:WaterLevel() > 0 or not owner:Alive() or (owner:Team() == self.Damager:Team() and owner ~= self.Damager) then
=======
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
>>>>>>> Stashed changes
		self:Remove()
		return
	end

	local dmg = math.Clamp(self:GetDamage(), 3, 2)

	owner:TakeSpecialDamage(dmg, DMG_BURN, self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager:Team() ~= owner:Team() and self.Damager or owner, self)
	self:AddDamage(-dmg)

	self:NextThink(CurTime() + 0.5)
	return true
end
