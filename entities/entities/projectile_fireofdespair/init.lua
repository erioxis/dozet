INC_SERVER()

function ENT:Initialize()
	timer.Simple( 0, function() self:SetModel( self.Models[ self.ModelType ] ) end)
	self:PhysicsInitSphere(1)
	self:SetSolid( SOLID_NONE )
	self:SetModelScale( math.random() + 0.5 )
	self:SetupGenericProjectile(false)

	self.NextShoot = CurTime() + 2.7 + math.random()
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	local phys = self:GetPhysicsObject()

	if IsValid( phys ) then
		phys:SetVelocityInstantaneous( phys:GetVelocity() * .35 )
		phys:SetAngleVelocityInstantaneous( phys:GetAngleVelocity() * .3 )
	end

	if self.Exploded then
		self:Remove()
	end
	
	if CurTime() > self.NextShoot then
		local pos = self:GetPos()
		local owner = self:GetOwner()
		local source = self:ProjectileDamageSource()

		util.BlastDamagePlayer( source, owner, pos, 80, self.ProjDamage, DMG_BURN, self.ProjTaper)
		for i, target in ipairs( ents.FindInSphere( pos, 80 ) ) do
			if target and target:IsValidLivingZombie() then
				target:AddLegDamageExt( math.random( 2, 4 ), owner, source, SLOWTYPE_FLAME )
			end
		end

		self:EmitSound( "weapons/underwater_explode" .. math.random( 3, 4 ) .. ".wav", 75, math.random( 120, 135 ) )

		local effectdata = EffectData()
			effectdata:SetOrigin( self:GetPos() )
		util.Effect("explosion_fireofdespair", effectdata)

		self:Fire( "kill", "", 0 )
	end
end

function ENT:OnRemove()
	self:Hit(self:GetPos(), Vector(0, 0, 1), NULL)
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	self:Explode()
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
	util.Effect("explosion_fireofdespair", effectdata)

	self:EmitSound("weapons/mortar/mortar_explode3.wav", 100, 150)
end

function ENT:PhysicsCollide(data, phys)
	self:Explode()
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local effectdata = EffectData()
		effectdata:SetOrigin( self:GetPos() )
	util.Effect("explosion_fireofdespair", effectdata)

	self:EmitSound("weapons/mortar/mortar_explode3.wav", 100, 150)
end
