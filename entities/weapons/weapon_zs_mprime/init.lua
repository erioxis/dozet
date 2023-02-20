INC_SERVER()
SWEP.Primary.Projectile = "projectile_mprime_proj"

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
				--self:GetOwner():SetMoveType(MOVETYPE_NONE)
				--self:GetOwner():SetLocalVelocity(Vector(0,0,0))
				for i=1, 2 do
					ParticleEffect("dusty_explosion_rockets", owner:GetPos(), angle_zero)
				end
			end 
		end)

	end
	if !self:GetDiePower() then
		local ent = (self:GetJudge() and  ents.Create("prop_playergibs") or ents.Create(self.Primary.Projectile))
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
		owner:EmitSound(Sound("zombiesurvival/mp_prepare"..(math.random(1,2) == 2 and 2 or "")..".ogg"))
		timer.Create("DieCombo", 0.64, 3 , function() self:PrimaryAttack((math.random(1,2) == 2 and true or nil)) 
			timer.Create("Push", 0.05, 1 , function()
				local pos = owner:GetPos()
				local pushvel = owner:GetEyeTrace().Normal * 0 + (owner:GetAngles():Forward()*5500)
				owner:SetLocalVelocity( pushvel)

			end)
			timer.Create("EndPush1", 0.1, 1 , function()
				owner:SetLocalVelocity(Vector(0,0,0))
				if owner:Health() <= 1000 then
					owner:GiveStatus("minoscharge")
				end
			end)
			timer.Create("EndPush", 0.68, 1 , function()
				util.BlastDamagePlayer(self, owner, owner:GetPos(), 126, 50, DMG_ALWAYSGIB)
				local effectdata = EffectData()
				effectdata:SetOrigin(owner:GetPos())
				effectdata:SetNormal(self:GetUp() * -1)
			util.Effect("decal_scorch", effectdata)
				ParticleEffect("dusty_explosion_rockets", owner:GetPos(), angle_zero)
				if owner:Health() <= 1000 then
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
