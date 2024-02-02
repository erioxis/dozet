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

function ENT:EntityTakeDamage( ent, dmginfo )
	local attacker = dmginfo:GetAttacker()
	if ent ~= self:GetOwner() then return end
	local wep = ent:GetActiveWeapon()
	if wep.PrintName4 == "Solemnvow" then
		wep:SetHitStacks( wep:GetHitStacks() - dmginfo:GetDamage() * .1 )
	end

	dmginfo:SetDamage( 0 )
end
