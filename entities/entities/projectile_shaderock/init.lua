INC_SERVER()

function ENT:Initialize()
	self:SetModel("models/props_wasteland/rockgranite03b.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetCustomCollisionCheck(true)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(20)
		phys:EnableMotion(true)
		phys:Wake()
	end
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, ent)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if ent:IsValid() then
		if not ent:IsPlayer() or (ent:IsPlayer() and ent:Team() ~= TEAM_UNDEAD) then
<<<<<<< Updated upstream
			ent:TakeSpecialDamage(34 * (ent.PhysicsDamageTakenMul or 1), DMG_GENERIC, owner, self)
=======
			ent:TakeSpecialDamage(34 * (ent.PhysicsDamageTakenMul or 1),DMG_DIRECT, owner, self)
>>>>>>> Stashed changes
		end
	end
	if owner.m_Shade_Stone then
		local pos = self:GetPos()
		owner:LagCompensation(true)	
		for i=1,17 do
			local rand = (pos-owner:EyePos()):GetNormalized() +VectorRand()
			if i%2 ~= 0 then
				self:FireBulletsLua(pos, rand, 0, 1, math.random(3,9), owner, 0, "tracer_rico", self.BulletCallback, 1, nil, 128, nil, self)
				self:FireBulletsLua(pos, rand, 0, 1, math.random(1,3), owner, 0, "", self.BulletCallback, 1, nil, 1028, nil, self)
			else
			timer.Simple(0, function()
					local soke = ents.Create("projectile_stone")
					soke:Spawn()
					soke:SetPos(pos+Vector(0,0,10+4*i))
					local phys = soke:GetPhysicsObject()
					if phys:IsValid() then
						phys:ApplyForceOffset(rand*math.random(290,400), pos)
					end
					soke.Damage = 12
					soke:SetOwner(owner)
					soke.Team = TEAM_UNDEAD
				end)	
			end
		end
		owner:LagCompensation(false)
	end
	if !owner.m_Shade_Stone then
		local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("hit_shadestone", effectdata)
		util.Effect("hit_stone", effectdata)
	end
end

function ENT:PhysicsCollide(data, phys)
	if self.Control:IsValid() then return end

	self.PhysicsData = data
	self:NextThink(CurTime())
end
