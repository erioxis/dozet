INC_SERVER()


function ENT:Initialize()
	self:SetModel("models/weapons/w_bugbait.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid( SOLID_NONE )
	self:SetModelScale( 1 )
	self:SetupGenericProjectile(false)

	self:EmitSound( string.format( "ambient/wind/wind_snippet%d.wav", math.random( 1, 5 ) ), 70, math.random( 245, 255 ) )
	self:Fire("kill", "", 7)
	self.Growth = CurTime() + 3

	self.ZombieTbl = {}
end

function ENT:Think()
	if IsFirstTimePredicted() then
		local ent = self:GetOwner()
		self:SetModel( ent:GetModel() )
		self:SetSequence( ent:GetSequence() )
		if self.Growth < CurTime() then
			self:SetModelScale( self:GetModelScale() + .03 )
		end
	end

	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.Exploded then
		self:Remove()
	end

	if self:GetPhysicsObject() then
		self:GetPhysicsObject():SetVelocityInstantaneous( self.Vec )
	end

	local pos = self:GetPos()
	local owner = self:GetOwner()

	if not owner:IsValidLivingHuman() then self:Fire("kill", "", 0) end

	local center = self:GetOwner():WorldSpaceCenter()

	local count = 0
	local attacking = false
	for k, v in ipairs( ents.FindInSphere( pos, 50 ) ) do
		if v:IsValidLivingZombie() and not table.HasValue( self.ZombieTbl, v ) then
			count = count + 1
			table.insert( self.ZombieTbl, v )
			attacking = true
			timer.Simple( count * .6, function()
				if IsValid( self ) then
					attacking = false
					v:SetEyeAngles( ( pos - v:GetPos() ):Angle() )
					v:TakeSpecialDamage( ( self.ProjDamage or 666 ), DMG_DISSOLVE, owner, owner, pos )
					self:SetSequence( ACT_GMOD_GESTURE_RANGE_ZOMBIE )
					self:EmitSound( "npc/zombie/claw_strike"..math.random(3)..".wav", 75, math.random( 86, 96 ) )
				end
			end)
		end
	end

	if not attacking then
		self:SetSequence( owner:GetSequence() )
	end
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
	local owner = self:GetOwner()
	local pos = self:GetPos()
	for i = 1, 4 do
		timer.Simple( i*.1, function() 
			local effectdata = EffectData()
				effectdata:SetOrigin( pos )
				effectdata:SetNormal( pos + Vector( 0, 0, 80 - 10 * i ) + VectorRand() * i )
			util.Effect("explosion_darkcore", effectdata)
		end)
	end
	self:EmitSound("ambient/wind/windgust.wav", 100, math.random( 250, 255 ) )
end
