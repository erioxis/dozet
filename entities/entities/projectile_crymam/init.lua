INC_SERVER()

ENT.Ticks = 30
ENT.Damage = 54
ENT.LegDamage = 71
ENT.PointsMultiplier = 0.5

function ENT:AcceptInput(name, activator, caller, arg)
	if name ~= "corrode" then return end

	self.Ticks = self.Ticks - 1

	local owner = self:GetOwner()
	if not owner:IsValidLivingHuman() then owner = self end

	local vPos = self:GetPos()

	if self.PointsMultiplier then
		POINTSMULTIPLIER = self.PointsMultiplier
	end

	for _, ent in pairs(ents.FindInSphere(vPos, self.Radius)) do
		if ent and (ent:IsValidLivingPlayer() and (ent:Team() == TEAM_UNDEAD or ent == owner)) and WorldVisible(vPos, ent:NearestPoint(vPos)) then
			if owner:IsValidLivingHuman() then
				ent:EmitSound("physics/glass/glass_impact_bullet"..math.random(4)..".wav", 70, 85)
				ent:TakeSpecialDamage(self.Damage, DMG_DROWN, owner, self)
				ent:AddLegDamageExt(self.LegDamage, owner, self, SLOWTYPE_COLD)
			end
		end
	end

	if self.PointsMultiplier then
		POINTSMULTIPLIER = nil
	end

	if self.Ticks > 0 then
		self:Fire("corrode", "", self.TickTime)
	end

	return true
end
