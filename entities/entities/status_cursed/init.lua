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
local function kill(pl,who)
	pl:SetTimerBERS(0)
	pl:GodDisable()
	pl:TakeSpecialDamage(1000,DMG_DIRECT,(who.Inflictor or who),who)
end
function ENT:Think()
	self:EmitSound("npc/stalker/breathing3.wav", 30, 85)
	local owner = self:GetOwner()
	if owner:IsSkillActive(SKILL_UPLOAD) then return self:Remove() end
	local cursed = owner:GetStatus("cursed")
	local holly = owner:GetStatus("holly")
	local time = CurTime()
	if self.DieTime <= time then
		self:Remove()
	end
	if (cursed.DieTime >= time + 1200) then kill(owner,self) end
	if not owner:HasTrinket("a_flower") then
		if not (holly) then
			if (cursed) and not owner:IsSkillActive(SKILL_UPLOAD) then
				if (cursed.DieTime >= time + 100 * (owner.CurseMultiplier or 1) +(owner.ClanMelee and 50 or 0)) and not owner:IsSkillActive(SKILL_CURSEDHEALTH) then
					kill(owner,self)
				elseif (cursed.DieTime >= time + (owner:GetMaxHealth() * 2) * (owner.CurseMultiplier or 1) +(owner.ClanMelee and 50 or 0)) and owner:IsSkillActive(SKILL_CURSEDHEALTH) then
					kill(owner,self)
				end
			end
		end
	end
end
