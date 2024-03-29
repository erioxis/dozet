INC_SERVER()
function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.RegenStatus = self
end
function ENT:Think()

	if self:GetDamage() <= 0 then
		self:Remove()
		return
	end
	local applier = self.Applier
	local owner = self:GetOwner()
	if owner:HasTrinket("jacobsoul") and !owner:GetStatus("sigildef") then
		self:SetDamage(0)
		self:Remove()
		return 
	end
	local mhp = owner:GetMaxHealth()
	local hp = owner:Health()
	if mhp > hp then
		if !(applier and applier:IsValidLivingHuman()) then
			owner:SetHealth(math.min(mhp,hp+1))
		else
			applier:HealPlayer(owner,1)
		end
		self:SetDamage(self:GetDamage()-1)
	end
	self:NextThink(CurTime()+0.75/(owner.RegenFastingMul or 1))
	return true
end
