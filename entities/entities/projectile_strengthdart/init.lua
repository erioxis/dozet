INC_SERVER()
ENT.Heal = 10
function ENT:Hit(vHitPos, vHitNormal, eHitEntity, vOldVelocity)
	if self:GetHitTime() ~= 0 then return end
	local owner = self:GetOwner()
	self:SetDTEntity(5,self:GetOwner())
	local oldowner = self:GetDTEntity(5)
	if owner:IsValid() and owner:IsSkillActive(SKILL_PHIK) and eHitEntity:IsPlayer() then
		self:Remove()
		local source = self:ProjectileDamageSource()
		local who = ents.FindInBoxRadius(self:GetPos(), 57)
		for _, pl in pairs(who) do
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), pl:NearestPoint(self:LocalToWorld(Vector(0, 0, 10)))) then
				if pl:IsPlayer() and (pl:GetStatus("rot")) then return end
				if pl:IsValidLivingZombie() and pl ~= owner then
					local alt = self:GetDTBool(0)
					pl:TakeSpecialDamage(self.Heal * 1.2 /#who * (owner.MedicHealMul or 1), DMG_ACID,owner, owner:GetActiveWeapon(), nil, 0)
					pl:PoisonDamage(12, owner, self)
					local status = pl:GiveStatus(alt and "zombiestrdebuff" or "zombiedartdebuff")
					status.DieTime = CurTime() + (self.BuffDuration or 10)
					status.Applier = owner
				end
			end
		end
	end
	self:SetHitTime(CurTime())

	self:Fire("kill", "", 0.04)

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = (vHitNormal or Vector(0, 0, -1)) * -1

	self:SetSolid(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)

	self:SetPos(vHitPos + vHitNormal)

	local alt = self:GetDTBool(0)
	if eHitEntity:IsValid() then
		self:AttachToPlayer(vHitPos, eHitEntity)

		if eHitEntity:IsPlayer() and eHitEntity:Team() ~= TEAM_UNDEAD then
			local strstatus = eHitEntity:GiveStatus(alt and "medrifledefboost" or "strengthdartboost", (alt and 2 or 1) * (self.BuffDuration or 10))
			strstatus.Applier = owner

			local txt = alt and translate.Get("buff_mdart") or translate.Get("buff_bdart")

			net.Start("zs_buffby")
				net.WriteEntity(owner)
				net.WriteString(txt)
			net.Send(eHitEntity)

			net.Start("zs_buffwith")
				net.WriteEntity(eHitEntity)
				net.WriteString(txt)
			net.Send(owner)

			eHitEntity:GiveStatus("healdartboost", (self.BuffDuration or 10)/2)
		else
			self:DoRefund(owner)
		end
	else
		self:DoRefund(owner)
	end

	self:SetAngles(vOldVelocity:Angle())

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
		if eHitEntity:IsValid() then
			effectdata:SetEntity(eHitEntity)
		else
			effectdata:SetEntity(NULL)
		end
	util.Effect(alt and "hit_healdart2" or "hit_strengthdart", effectdata)
	if oldowner:IsSkillActive(SKILL_PHIK) then
		self:Remove()
	end
end
