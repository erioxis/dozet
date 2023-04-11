INC_SERVER()
ENT.NextThinker = 0.2
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
	local dmger = self.Damager
	local lox = dmger:IsSkillActive(SKILL_LOX)
	local see = dmger:IsSkillActive(SKILL_PARASITOID_3)
	local flimsy = dmger:IsSkillActive(SKILL_FLIMSY)
	local who = dmger and dmger:IsValid() and dmger:IsPlayer() and dmger or owner
	if (owner) and not (dmger:GetStatus("rot")) and !owner:GetZombieClassTable().Skeletal and (dmger:GetProgress("parasite_prog") -(dmger:IsSkillActive(SKILL_PARASITOID_2) and 2 or 0)) < CurTime() then
		if dmger and dmger:IsValid() and dmger:IsPlayer() and self.NextThinker <= CurTime() then
			owner:TakeSpecialDamage((self.Damage or 10) * (flimsy and 2.5 or 1) * self:GetDTInt(1),DMG_ACID,who, self, owner:GetPos()+Vector(0,0,math.random(-30,30)), 0)
			if !dmger:IsSkillActive(SKILL_PARASITOID_2) then
				dmger:SetHealth(math.min(dmger:Health() + (self.Damage or 10)*0.1, dmger:GetMaxHealth()))
			else
				dmger:SetBloodArmor(math.min(dmger:GetBloodArmor() + (self.Damage or 10)*0.05, dmger.MaxBloodArmor*2))
			end
			self.NextThinker = CurTime() + 0.4
		end
		if see then
			for _,ent in pairs(ents.FindInSphere(owner:GetPos(),55)) do
				if ent and ent ~= owner and ent:IsValidLivingZombie() and (ent:Team() == TEAM_UNDEAD or ent == who) then
					ent:TakeSpecialDamage((self.Damage or 10) * (flimsy and 2.5 or 1),DMG_ACID,who, self, nil, 0)
				end
			end
		end
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
