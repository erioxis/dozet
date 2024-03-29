INC_SERVER()

function ENT:Initialize()
	self.DeathTime = CurTime() + 30

	self:SetModel("models/props_junk/watermelon01.mdl") 
--	self:SetMaterial("models/headcrab_classic/headcrabsheet")
	self:SetModelScale(0.4)
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetColor(Color(20, 20, 20, 135))
	self:SetupGenericProjectile(true)
end

function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local owner = self:GetOwner()
	if not IsValid( owner ) then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)

	if eHitEntity:IsValidLivingPlayer() and gamemode.Call( "PlayerShouldTakeDamage", eHitEntity, owner ) then
		eHitEntity:GiveStatus( "dimvision", 3, owner )
		eHitEntity:GiveStatus( "sickness", 2, owner )
		eHitEntity:SetLocalVelocity( ( owner:WorldSpaceCenter() - eHitEntity:GetPos() ) * 4 )
		eHitEntity:AddLegDamage( 9 )
		eHitEntity:AddArmDamage( 9 )
	end

	local effectdata = EffectData()
		effectdata:SetOrigin( vHitPos )
		effectdata:SetNormal( vHitNormal )
	util.Effect( "hit_fleshdark", effectdata )
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data

	self:NextThink(CurTime())
end
