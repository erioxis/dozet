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
	local who = self:GetDTEntity(11)
	if ent ~= self:GetOwner() or !who:IsValid() or who:Team() ~= self:GetOwner():Team() or who == self:GetOwner() then return end
	local dmg = dmginfo:GetDamage()
	who:TakeSpecialDamage(dmg * 0.4,DMG_DIRECT,dmginfo:GetAttacker(),dmginfo:GetInflictor())
	dmginfo:SetDamage(dmg * 0.5)
	if who:IsValidLivingHuman() then
		local hpperpoint = GAMEMODE.MedkitPointsPerHealth
		local points = dmginfo:GetDamage() / hpperpoint
		who.DefenceDamage = (who.DefenceDamage or 0) + dmginfo:GetDamage()
		who:AddPoints(math.min(10,points))
	end
end