INC_SERVER()
ENT.NextThinker = 1
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
	if self:GetOwner():GetZombieClassTable().Boss then self:Remove() return end
	local owner = self:GetOwner()
	local dmger = self.Damager
	local lox = dmger:IsSkillActive(SKILL_LOX)
	local see = dmger:IsSkillActive(SKILL_PARASITOID_3)
	local flimsy = dmger:IsSkillActive(SKILL_FLIMSY)
	local who = dmger and dmger:IsValid() and dmger:IsPlayer() and dmger or owner
	if (owner) and not (dmger:GetStatus("rot")) and !owner:GetZombieClassTable().Skeletal and (dmger:GetProgress("parasite_prog") -(dmger:IsSkillActive(SKILL_PARASITOID_2) and 2 or 0)) < CurTime() then
		owner:TakeSpecialDamage(math.min((lox and owner:Health()*0.05 or owner:Health()*0.01),50) * (flimsy and 2.5 or 1),DMG_ACID,who, self, nil, 0)
		if dmger and dmger:IsValid() and dmger:IsPlayer() and self.NextThinker <= CurTime() then
			if !dmger:IsSkillActive(SKILL_PARASITOID_2) then
				dmger:SetHealth(math.min(dmger:Health() + (lox and owner:Health()*0.1 or owner:Health()*0.02), dmger:GetMaxHealth()))
			else
				dmger:SetBloodArmor(math.min(dmger:GetBloodArmor() + (lox and owner:Health()*0.01 or owner:Health()*0.005), dmger.MaxBloodArmor*2))
			end
			self.NextThinker = CurTime() + 0.33
		end
		if see then
			for _,ent in pairs(ents.FindInSphere(owner:GetPos(),55)) do
				if ent and ent ~= owner and ent:IsValidLivingZombie() and (ent:Team() == TEAM_UNDEAD or ent == who) then
					ent:TakeSpecialDamage(math.min((lox and owner:Health()*0.05 or owner:Health()*0.01),33) * (flimsy and 2.5 or 1),DMG_ACID,who, self, nil, 0)
				end
			end
		end
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
