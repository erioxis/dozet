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
	if ent ~= self:GetOwner() or !who:IsValid() or who:Team() ~= self:GetOwner():Team() or who == self:GetOwner() or !IsValid(dmginfo) then return end
	local dmg = dmginfo:GetDamage()
	local type = dmginfo:GetDamageType()
	local attacker = dmginfo:GetAttacker()
	local inflictor = dmginfo:GetInflictor()
	timer.Simple(0.05, function() who:TakeSpecialDamage(dmg * 0.4, type,attacker,inflictor) end)
	dmg = dmg * 0.6
	dmginfo:SetDamage(dmg)
	if who:IsValidLivingHuman() then
		dmg = dmginfo:GetDamage() - dmg
		local hpperpoint = GAMEMODE.MedkitPointsPerHealth
		local points = dmg / hpperpoint
		who.DefenceDamage = (who.DefenceDamage or 0) + dmg
		who:AddPoints(math.min(10,points))
	end
end