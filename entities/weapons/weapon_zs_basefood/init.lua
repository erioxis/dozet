INC_SERVER()

function SWEP:Eat()
	local owner = self:GetOwner()

	if owner:IsSkillActive(SKILL_SUGARRUSH) then
		local boost = owner:GiveStatus("adrenalineamp", 14)
		
		if boost and boost:IsValid() then
			boost:SetSpeed(35)
		end
	end
	if owner:IsSkillActive(SKILL_DEATHCURSE) then
		local cursed = owner:GetStatus("cursed")
		if (cursed) then 
			owner:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() - 900)
			owner:GiveStatus("medrifledefboost", 35)
		end

	end
	if owner:HasTrinket("sin_gluttony") then
		debuff = math.random(1,6)
		if debuff == 1 then
			owner:GiveStatus("medrifledefboost", 15)
		elseif debuff == 2 then
			owner:GiveStatus("rot", 3)
		elseif debuff == 3 then
			owner:GiveStatus("frost", 15)
		elseif debuff == 4 then
			owner:AddPoisonDamage(15, self)
		elseif debuff == 5 then
			owner:GiveStatus("reaper", 70)
		else
			owner:GiveStatus("status_strengthdartboost", 70)
		end
	end
	if owner:IsSkillActive(SKILL_FOODHEALS) then
		for _, pl in pairs(ents.FindInSphere(owner:GetPos(), 128 * self:GetModelScale())) do
            if pl:IsValidLivingHuman() then
				owner:HealPlayer(pl, self.FoodHealth * (owner.FoodRecoveryMul or 1))
			end
		end
	end

	local max = owner:IsSkillActive(SKILL_D_FRAIL) and math.floor(owner:GetMaxHealth() * 0.25) or owner:GetMaxHealth()

	if owner:IsSkillActive(SKILL_GLUTTON) then
		local healing = self.FoodHealth * (owner.FoodRecoveryMul or 1)

		owner:SetBloodArmor(math.min(owner:GetBloodArmor() + (math.min(30, healing) * owner.BloodarmorGainMul), owner.MaxBloodArmor + (40 * owner.MaxBloodArmorMul)))
	else
		local healing = self.FoodHealth * (owner:GetTotalAdditiveModifier("FoodRecoveryMul", "HealingReceived") - (owner:GetPhantomHealth() > 0.5 and 0.5 or 0))

		owner:SetHealth(math.min(owner:Health() + healing, max))
		owner:SetPhantomHealth(math.max(0, math.floor(owner:GetPhantomHealth() - healing)))
	end

	self:TakePrimaryAmmo(1)
	if self:GetPrimaryAmmoCount() <= 0 then
		owner:StripWeapon(self:GetClass())
	end
end

