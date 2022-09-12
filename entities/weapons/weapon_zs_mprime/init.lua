INC_SERVER()
SWEP.Primary.Projectile = "projectile_mprime_proj"

function SWEP:EntModify(ent)
end

function SWEP:PhysModify(physobj)
end

function SWEP:ToDie(damage, numshots, cone)
	local owner = self:GetOwner()
	owner:DoAttackEvent()


	local ssfw, ssup
	if self.SameSpread then
		ssfw, ssup = math.Rand(0, 360), math.Rand(0,0)
	end

	for i = 0,1 do
		local ent = ents.Create(self.Primary.Projectile)
		if ent:IsValid() then
			ent:SetPos(owner:GetShootPos())
			ent:SetAngles(owner:EyeAngles())
			ent:SetOwner(owner)
			ent.ProjDamage = 60 
			ent.ProjSource = self
			ent.ShotMarker = i
			ent.Team = owner:Team()

			self:EntModify(ent)
			ent:Spawn()
			if self:GetJudge() then
				ent:Remove()
			end
			if self:IsValid() and owner:IsValid() and self:GetJudge() then
				local pos = owner:GetPos()
				local pushvel = owner:GetEyeTrace().Normal * 0 + (owner:GetAngles():Forward()*4500)
				owner:SetGroundEntity(nil)
				owner:SetLocalVelocity( pushvel)
				self:GetOwner():SetGravity(0.6)
				self:GetOwner():SetFriction(0.5)
				timer.Simple( 0.25, function() 
					if self:IsValid() and self:GetOwner():IsValid() and self:GetOwner():IsPlayer() and self:GetOwner():Alive() then 
						owner:SetLocalVelocity(Vector(0,0,0))
						self:GetOwner():SetGravity(1)
						self:GetOwner():SetFriction(1)
						if owner:IsValid() then
							util.BlastDamagePlayer(self, owner, owner:GetPos(), 126, 80, DMG_ALWAYSGIB)
						end
						local effectdata = EffectData()
						effectdata:SetOrigin(owner:GetPos())
						effectdata:SetNormal(self:GetUp() * -1)
					util.Effect("decal_scorch", effectdata)
					owner:TakeDamage(1160, owner, self)
						--self:GetOwner():SetMoveType(MOVETYPE_NONE)
						--self:GetOwner():SetLocalVelocity(Vector(0,0,0))
						for i=1, 2 do
							ParticleEffect("dusty_explosion_rockets", owner:GetPos(), angle_zero)
						end
					end 
				end)
		
			end

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()

				local angle = owner:GetAimVector():Angle()
				angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 360))
				angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(0, 0))

				ent.PreVel = angle:Forward() * 2600 * (owner.ProjectileSpeedMul or 1)
				phys:SetVelocityInstantaneous(ent.PreVel)

				self:PhysModify(phys)
			end
		end
	end
end
