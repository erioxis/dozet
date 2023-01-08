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
	local owner = self:GetOwner()
	local dmger = self.Damager
	local lox = dmger:IsSkillActive(SKILL_LOX)
	if (owner) and not (dmger:GetStatus("rot")) and !owner:GetZombieClassTable().Skeletal and (owner:GetProgress("parasite_prog")) < CurTime() then
		owner:TakeSpecialDamage((lox and owner:Health()*0.05 or owner:Health()*0.01),DMG_ACID,dmger and dmger:IsValid() and dmger:IsPlayer() and dmger or owner, self, nil, 0)
		if dmger and dmger:IsValid() and dmger:IsPlayer() and self.NextThinker <= CurTime() then
			dmger:SetHealth(math.min(dmger:Health() + (lox and owner:Health()*0.1 or owner:Health()*0.02), dmger:GetMaxHealth()))
			self.NextThinker = CurTime() + 0.33
		end
	end
	if self.DieTime <= CurTime() then
		self:Remove()
	end
end

function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if attacker ~= self:GetOwner() then return end

	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD then
		local dmg = dmginfo:GetDamage()
		dmginfo:SetDamage(dmg * 3)
	end
end
