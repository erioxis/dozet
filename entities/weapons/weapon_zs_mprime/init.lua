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
