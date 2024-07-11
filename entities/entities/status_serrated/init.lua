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
	local owner = self:GetOwner()
	local validowner = self.Damager and self.Damager:IsValid() and self.Damager:IsPlayer() and self.Damager or owner
	local lox = validowner:IsSkillActive(SKILL_LOX)
	local marry =  validowner:IsSkillActive(SKILL_BLOODMARY)
	if self:GetDamage() <= 0 or owner:GetZombieClassTable().Skeletal then
		self:Remove()
		return
	end
	
	local dmg = 6 * self:GetDamage()

	owner.NoBleedStack = true
	dmg = dmg * (marry and 1.2 or 1) * (lox and 2 or 1)
	if validowner:HasTrinket('spinel') then
		validowner:SetProgress(validowner:GetProgress('spinprog')+dmg,'spinprog')
		
		if owner:SpinelInduction(validowner) then
			self:Remove()
		end
	end
	owner:TakeSpecialDamage(dmg,DMG_CLUB, validowner, self,nil,0)
	owner.NoBleedStack = false


	local dir = VectorRand()
	dir:Normalize()
	util.Blood(owner:WorldSpaceCenter(), 3, dir, 32)

	local moving = owner:GetVelocity():LengthSqr() >= 19600 --140^2 
	local ticktime = (moving and 0.78 or 1.3)/(owner.BleedSpeedMul or 1) * (owner:IsValidLivingZombie() and 0.4 or 1)
	self:NextThink(CurTime() + ticktime)
	if self.DieTime < CurTime() then
		self:Remove()
	end
	return true
end
