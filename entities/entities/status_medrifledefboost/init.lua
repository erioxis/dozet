INC_SERVER()

if SERVER then
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
end

function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if ent ~= self:GetOwner() then return end

	if attacker:IsPlayer() and attacker:IsValidZombie() then
		local protect = 0.66

		local dmgfraction = dmginfo:GetDamage() * protect
		dmginfo:SetDamage(dmginfo:GetDamage() * (1 - protect))

		local hpperpoint = GAMEMODE.MedkitPointsPerHealth
		local points = (dmgfraction / hpperpoint) * 0.2

		if self.Applier and self.Applier:IsPlayer() and self.Applier:IsValidLivingHuman() and not self:GetOwner():IsSkillActive(SKILL_SIGILIBERATOR) then
			self.Applier.DefenceDamage = (self.Applier.DefenceDamage or 0) + dmgfraction
			self.Applier:AddPoints(points)
		end
	end
end
