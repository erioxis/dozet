INC_SERVER()

function ENT:PlayerSet(pPlayer, bExists)
	self.Attackers = {}

	pPlayer.Poison = self

	self:NextThink(CurTime() + 2)
end

function ENT:Think()
	local owner = self:GetOwner()

	if self:GetDamage() <= 0 --[[or owner:Team() ~= TEAM_HUMAN]] then
		self:Remove()
		return
	end

	local attackers = self.Attackers
	local damage = math.min(self.DamagePerTick, self:GetDamage()) * (owner:IsValidLivingZombie() and 2 or 1)
	local attacker = self

	-- Whoever has the most amount of remaining damage should get this credit.
	local mostd = 0
	for a, d in pairs(attackers) do
		if (a:IsValidZombie() or owner:IsValidLivingZombie()) and d > mostd then
			attacker = a
			mostd = d
		end
	end
	-- Uhhh... just pick the first one in the list then.
	if attacker == self then
		for a, d in pairs(attackers) do
			if a:IsValidZombie() or owner:IsValidLivingZombie() then
				attacker = a
				break
			end
		end
	end

	owner:EmitSound("player/pl_pain"..math.random(5, 7)..".wav")
	self:AddDamage(-damage)

	if attackers[attacker] then
		attackers[attacker] = attackers[attacker] - damage
	end

	if self:GetDamage() >= owner:Health() then
		owner:TakeSpecialDamage(self:GetDamage()*0.75, DMG_ACID, attacker, self)
		self:Remove()
	end

	self:NextThink(CurTime() + 2 / (owner:IsValidLivingZombie() and 0.5 or owner.PoisonSpeedMul or 1))
	return true
end
