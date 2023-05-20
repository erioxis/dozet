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
function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if ent ~= self:GetOwner() then return end

	if attacker:IsPlayer() and attacker:IsValidZombie() and !ent:IsSkillActive(SKILL_BERSERK) then
		dmginfo:ScaleDamage(0.76)
	end
end

