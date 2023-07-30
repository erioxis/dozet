INC_SERVER()

SWEP.Primary.Projectile = "projectile_arrow"

function SWEP:EntModify(ent)
end

function SWEP:PhysModify(physobj)
end

function SWEP:ShootBullets(damage, numshots, cone)
	local owner = self:GetOwner()
	self:SendWeaponAnimation()
	owner:DoAttackEvent()

	if self.Recoil > 0 then
		local r = math.Rand(0.8, 1)
		owner:ViewPunch(Angle(r * -self.Recoil, 0, (1 - r) * (math.random(2) == 1 and -1 or 1) * self.Recoil))
	end

	local ssfw, ssup
	if self.SameSpread then
		ssfw, ssup = math.Rand(0, 360), math.Rand(-cone, cone)
	end

	for i = 0,numshots-1 do
		local ent = ents.Create(self.Primary.Projectile)
		if ent:IsValid() then
			ent:SetPos(owner:GetShootPos())
			ent:SetAngles(owner:EyeAngles())
			ent:SetOwner(owner)
			ent.ProjDamage = self.Primary.Damage * (owner.ProjectileDamageMul or 1)
			ent.ProjSource = self
			ent.ShotMarker = i
			ent.Team = owner:Team()

			self:EntModify(ent)
			if owner:IsSkillActive(SKILL_SOMETHING_WRONG) and math.random(1,math.max(1,20-GAMEMODE:GetWave())) == 1 then
				ent._Think = ent.Think
				ent.trg = NULL
				ent.ProjDamage = ent.ProjDamage * 0.9
				ent.Think = function(selfy)
					if !ent.trg:IsValid() then
						local targets = {}
						for _, enemy in pairs(ents.FindInSphere(ent:GetPos(), 1048)) do
							if !enemy:IsValid() then continue end
							target = enemy
							if WorldVisible(ent:LocalToWorld(Vector(0, 0, 30)), enemy:NearestPoint(ent:LocalToWorld(Vector(0, 0, 30))))  then
								if target:IsValidLivingZombie() then 
									targets[(#targets or 0) + 1] = {Health = enemy:Health(), trg = target}
								end
							end
						end
						for k, target1 in pairs(targets) do
							target = target1.trg
							--print( target1.Health)
							if target and target:IsValidLivingZombie() then
								ent.trg = target
								break
							end
						end
					else
						local target = ent.trg
						local targetpos = target:LocalToWorld(target:OBBCenter())
						local direction = (targetpos - ent:GetPos()):GetNormal()
						ent:SetAngles(direction:Angle())
						local phys = ent:GetPhysicsObject()
						phys:SetVelocityInstantaneous(direction * 700 + target:GetVelocity())
						ent.NextHook = CurTime() + 0.11
					end
					ent:_Think()
				end
			end


			if owner:IsSkillActive(SKILL_WHO_AM_I) and math.random(1,math.max(1,12-GAMEMODE:GetWave())) == 1 then
				ent._OnRemove = ent.OnRemove
				ent.ProjDamage = ent.ProjDamage * 0.9
				ent.OnRemove = function()
					local ent1 = ents.Create(self.Primary.Projectile)
					if ent1:IsValid() then
						ent1:SetPos(ent:GetPos()+Vector(0,0,5))
						ent1:SetAngles(owner:EyeAngles())
						ent1:SetOwner(owner)
						ent1.ProjDamage = ent.ProjDamage * 0.7
						ent1.ProjSource = ent
						ent1.Team = owner:Team()
			
						self:EntModify(ent1)

						ent1:Spawn()
						local phys = ent1:GetPhysicsObject()
						if phys:IsValid() then
							phys:Wake()
			
							ent1.PreVel = Angle(math.Rand(-360, -70), math.Rand(0, 360), 0):Forward() * self.Primary.ProjVelocity * (owner.ProjectileSpeedMul or 1) * 0.2
							phys:SetVelocityInstantaneous(ent1.PreVel)
			
							self:PhysModify(phys)
						end
					end
					ent:_OnRemove()
				end
			end
			ent:Spawn()
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()

				local angle = owner:GetAimVector():Angle()
				angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 360))
				angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(-cone, cone))

				ent.PreVel = angle:Forward() * self.Primary.ProjVelocity * (owner.ProjectileSpeedMul or 1)
				phys:SetVelocityInstantaneous(ent.PreVel)

				self:PhysModify(phys)
			end
		end
	end
end
