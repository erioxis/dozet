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

	if attacker:IsPlayer() and attacker:IsValid() and dmginfo:GetInflictor().IsMelee then
		local protect = 0.9
		dmginfo:SetDamage(dmginfo:GetDamage() * (1 - protect))
	else
		local protect = 2.2
		dmginfo:SetDamage(dmginfo:GetDamage() * protect)
	end
end
