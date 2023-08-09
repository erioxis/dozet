INC_SERVER()
SWEP.Primary.Projectile = "projectile_sis_proj"

function SWEP:EntModify(ent)
end

function SWEP:PhysModify(physobj)
end

function SWEP:ToDie(damage, numshots, cone)
	local owner = self:GetOwner()
	owner:DoAttackEvent()
	owner.LastRangedAttack = CurTime()

	local ssfw, ssup
	if self.SameSpread then
		ssfw, ssup = math.Rand(0, 360), math.Rand(0,0)
	end
	if self:IsValid() and owner:IsValid() and self:GetJudge() then
		local pos = owner:GetPos()
		local pushvel = owner:GetEyeTrace().Normal * 0 + (owner:GetAngles():Forward()*4500)
		owner:SetGroundEntity(nil)
		owner:SetLocalVelocity( pushvel)
		owner:SetGravity(0.6)
		owner:SetFriction(0.5)
		owner:GodEnable()
		timer.Simple( 0.25, function() 
			if self:IsValid() and owner:IsValid() and owner:IsPlayer() and owner:Alive() then 
				owner:SetLocalVelocity(Vector(0,0,0))
				owner:SetGravity(1)
				owner:SetFriction(1)
				if owner:IsValid() then
					util.BlastDamagePlayer(self, owner, owner:GetPos(), 126, 80, DMG_ALWAYSGIB)
				end
				local effectdata = EffectData()
				effectdata:SetOrigin(owner:GetPos())
				effectdata:SetNormal(self:GetUp() * -1)
			util.Effect("decal_scorch", effectdata)
				owner:GodDisable()
				--owner:SetMoveType(MOVETYPE_NONE)
				--owner:SetLocalVelocity(Vector(0,0,0))
				for i=1, 2 do
					ParticleEffect("dusty_explosion_rockets", owner:GetPos(), angle_zero)
				end
			end 
		end)

	end
	if !self:GetDiePower() then
		local ent = (self:GetJudge() and  ents.Create("prop_gibs") or ents.Create(self.Primary.Projectile))
		if ent:IsValid() then
			if !self:GetJudge() or self:GetObed() then
				ent:SetPos(owner:GetShootPos())
				ent:SetAngles(owner:EyeAngles())
				ent:SetOwner(owner)
				ent.ProjDamage = 60 
				ent.ProjSource = self
				ent.ShotMarker = i
				ent.Team = owner:Team()
				if self:GetObed() then
					ent:SetModel("models/props_c17/oildrum001_explosive.mdl")
				end
			end

			self:EntModify(ent)
			if !self:GetJudge() then
				ent:Spawn()
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
	else
		owner:EmitSound(Sound("zombiesurvival/sp_begone"..(math.random(1,2) == 2 and 2 or "")..".wav"))
		timer.Create("DieCombo", 0.64,5 , function() self:PrimaryAttack((math.random(1,2) == 2 and true or nil)) 
			timer.Create("Push", 0.1, 1 , function()
				owner:GodEnable()
				local pos = owner:GetPos()
				local pushvel = owner:GetEyeTrace().Normal * 0 + (owner:GetAngles():Forward()*5500)
				owner:SetLocalVelocity( pushvel)

			end)
			timer.Create("EndPush1", 0.25, 1 , function()
				owner:SetLocalVelocity(Vector(0,0,0))
				owner:GodDisable()
			end)
			timer.Create("EndPush", 0.68, 1 , function()
				owner:GodEnable()
				util.BlastDamagePlayer(self, owner, owner:GetPos(), 126, 50, DMG_ALWAYSGIB)
				owner:GodDisable()
				local effectdata = EffectData()
				effectdata:SetOrigin(owner:GetPos())
				effectdata:SetNormal(self:GetUp() * -1)
			util.Effect("decal_scorch", effectdata)
				ParticleEffect("dusty_explosion_rockets", owner:GetPos(), angle_zero)
				if owner:Health() <= 3000 then
					self:DoShoot()
				end
			end)
		end)
	end
end
function SWEP:DoShoot()
	local owner = self:GetOwner()
	for i = 0,1 do
		local ent = ents.Create(self.Primary.Projectile)
		if ent:IsValid() then
			if !self:GetJudge() then
				ent:SetPos(owner:GetShootPos())
				ent:SetAngles(owner:EyeAngles())
				ent:SetOwner(owner)
				ent.ProjDamage = 60 
				ent.ProjSource = self
				ent.ShotMarker = i
				ent.Team = owner:Team()
			end

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
