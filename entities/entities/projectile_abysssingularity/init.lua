INC_SERVER()

ENT.LifeTime = 3

function ENT:Initialize()
	self.DieTime = CurTime() + 3

	self:SetModel("models/roller.mdl")
	self:SetMaterial("models/shadertest/vertexlitselfillummaskenvmaptex")
	self:SetColor(Color(25, 25, 255))
	self:PhysicsInitSphere(3)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:DrawShadow(false)
	self:SetupGenericProjectile(true)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:Wake()
		phys:SetMass(4)
		phys:SetMaterial("metal")
	end

	self.ExplodeTime = CurTime() + self.LifeTime
end

function ENT:Think()
	if self.DieTime <= CurTime() then
		self:Explode()

		self:Remove()
	end

	if self and self:IsValid() then
		local owner = self:GetOwner()
		for k, v in ipairs( ents.FindInBoxRadius( self:GetPos(), 250 ) ) do
			if v:IsValidLivingHuman() or v:IsNailed() then
				v:SetVelocity( ( self.Entity:GetPos() - v:GetPos() ) * 0.9 * ( v.GravitationEffTakenMul or 1 ) )
				v:TakeSpecialDamage( ( ( v:IsNailed() and 4 or 2 ) - self.Entity:GetPos():Distance( v:GetPos() )^0.2 ) + ( v:IsNailed() and 2 or 1 ) , DMG_GENERIC, owner, self )
				if v:IsValidLivingHuman() then
					v:GiveStatus("sickness", 0.4, owner)
					v:GiveStatus("slow", 0.4, owner)
				end
			end
		end

		local effectdata = EffectData()
			effectdata:SetOrigin(self:GetPos())
			effectdata:SetNormal(self:GetPos())
		util.Effect("death_shade", effectdata)
		util.Effect("explosion_emi", effectdata)
	end
end


function ENT:Explode()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
		effectdata:SetNormal(self:GetPos())
	util.Effect("explosion_shockcore", effectdata)

	self.Exploded = true
end

function ENT:PhysicsCollide( data, phys )
	if data.HitEntity:IsValid() then
		self.Entity:SetParent(data.HitEntity)
	else
		self.Entity:SetMoveType( MOVETYPE_NONE ) 
	end
end
