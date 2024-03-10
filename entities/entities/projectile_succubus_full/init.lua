INC_SERVER()
ENT.KnockbackScale = 1
ENT.TimeToDash = 0
function ENT:Initialize()
	timer.Simple(0, function(arguments)
		local owner = self:GetOwner()
		self:SetModel(owner:GetModel())
		self:SetPos(owner:GetPos() + Vector(0,0,4))
		--self:SetParent(owner,2)
		self:PhysicsInitSphere(21)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
		self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(true)
		end
		self.trg = NULL
		if self.BaseClass then
			self.BaseClass.BulletCallback = self.BaseClass.BulletCallback or function(arguments)
			end
		end
	end)
end
local function huy(wep,self,dir)
	local owner = wep:GetOwner()
	if self.Primary.Projectile == "projectile_impactmine" or self.Primary.Projectile == "projectile_impactmine_kin" or self.Primary.Projectile == "projectile_bulldog" or self.Primary.Projectile == "projectile_bomb_sticky" then self:Remove() return end 
	local ssfw, ssup
	if self.SameSpread then
		ssfw, ssup = math.Rand(0, 360), math.Rand(-cone, cone)
	end
	local cone = self.ConeMax
	for i = 0,self.Primary.NumShots-1 do
		local ent = ents.Create(self.Primary.Projectile)
		if ent:IsValid() then
			ent:SetPos(wep:GetPos()+Vector(0,0,10))
			ent:SetAngles(owner:EyeAngles())
			ent:SetOwner(owner)
			ent.ProjDamage = self.Primary.Damage * (owner.ProjectileDamageMul or 1)
			ent.ProjSource = wep
			ent.ShotMarker = i
			ent.Team = owner:Team()

			self.EntModify(wep,ent)
			if owner:IsSkillActive(SKILL_SOMETHING_WRONG) and math.random(1,math.max(1,20-GAMEMODE:GetWave())) == 1 then
				ent._Think = ent.Think
				ent.trg = NULL
				ent.ProjDamage = ent.ProjDamage * 0.9
				ent.Think = function(selfy)
					if !ent.trg:IsValid() then
						local targets = {}
						for _, enemy in pairs(player.FindInSphere(ent:GetPos(), 1048)) do
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
			
						self.EntModify(wep,ent1)

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

				local angle = dir:Angle()
				angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 360))
				angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(-cone, cone))

				ent.PreVel = angle:Forward() * self.Primary.ProjVelocity * (owner.ProjectileSpeedMul or 1) * 3
				phys:SetVelocityInstantaneous(ent.PreVel)

				self:PhysModify(phys)
			end
		end
	end
end
function ENT:ShootBullets(dmg, numbul)
	local owner = self:GetOwner()
	local target = self.trg
	if self:GetWeapon().RemoveOnGive then
		owner:Kill()
		self:Remove()
	end
	if owner and owner:IsValid() and target and target:Team() ~= self:GetOwner():Team() then 
		local wep = self:GetWeapon()
		if wep.Magic and !owner:IsSkillActive(SKILL_MAGIC) then return end
		self:EmitSound(wep.Primary.Sound or "zombiesurvival/purg_ghostdash"..math.random(1,3)..".wav", 100, nil,100)
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		owner:LagCompensation(true)	
		local angle = direction:Angle()
		angle.pitch = 0
		self:SetAngles(angle)
		local phys = self:GetPhysicsObject() 
		if phys then
			phys:SetVelocity(Vector(0,0,0))
		end
		self:SetDTVector(22, direction)

		if !wep.Primary.Projectile  then
			self:FireBulletsLua(self:GetPos()+Vector(0,0,15), direction, ((wep.ConeMax or 1)+1.6)*2.5, numbul, dmg, owner, wep.KnockbackScale, wep.TracerName, !wep.Magic and wep.BulletCallback, 1, nil, 1028, nil, self)
		else
			huy(self,wep,direction)
		end
		owner:LagCompensation(false)
		self.trg = NULL
	end
end
function ENT:GetWeapon()
	return weapons.Get(self.Weapon or "weapon_zs_peashooter")
end
function ENT:SetNextSecondaryFire()
end
function ENT:GetNextSecondaryFire()
end
function ENT:SetHitStacks()
end
function ENT:GetHitStacks()
end
function ENT:GetFireDelay()
end
function compare(a,b)
	return a.Health > b.Health
end
function ENT:Use(user)
	if self:GetOwner() == user and !user:GetActiveWeapon().IsMelee and !self.NoUseLol then
		local wep = user:GetActiveWeapon():GetClass()
		user:StripWeapon(wep)
		user:Give(self.Weapon  or "weapon_zs_peashooter",true)
		self.Weapon = wep
	end
end
ENT.DamageTaked = 0
function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 or dmginfo:GetAttacker() and !dmginfo:GetAttacker():IsValidLivingZombie() then return end
	self.DamageTaked = dmginfo:GetDamage() + self.DamageTaked
	if 	self.DamageTaked  > 350 then
		self.DamageTaked = 0
		self:SetPos(self:GetOwner():GetPos()+Vector(0,0,15))
	end
end
function ENT:Think()
	if self.trg and !self.trg:IsValid() and self.TimeToDash < CurTime() then
		local targets = {}
		for _, ent in pairs(team.GetPlayers(self:GetOwner():Team() == TEAM_HUMAN and TEAM_UNDEAD or TEAM_HUMAN)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10))))  then
				if !(target:GetZombieClassTable().CrowDa or target.SpawnProtection) and target:GetRenderMode() ~= RENDERMODE_TRANSALPHA  then 
					targets[(#targets or 0) + 1] = {Health = ent:Health(), trg = target}
				end
			end
		end
		table.sort(targets, compare)
		for k, target1 in pairs(targets) do
			target = target1.trg
			--print( target1.Health)
			if target and target:IsValidLivingZombie() then
				self.trg = target
				break
			end
		end
	end
	if self.TimeToDash < CurTime() and self:GetOwner():IsValid()  and self.trg and self.trg:IsValid() and self.trg:Team() ~= self:GetOwner():Team() then
		local wep = self:GetWeapon()
		if !wep then return end
		local dmg = 50
		if wep  then
			dmg = (wep.IsMelee and wep.MeleeDamage or wep.Primary.Damage or 50) * 0.66
		end
		self.TimeToDash = CurTime() + (wep.Primary.Delay or 0.5)
		self:ShootBullets(dmg, wep.Primary.NumShots or 1)
	end
	if (self.TimeToDash + 1.1) < CurTime() then
		local target = self:GetOwner()
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		local dist = target:GetPos():DistToSqr(self:GetPos())
		if dist > 1234000 then
			self:SetPos(target:GetPos())
		elseif dist < 34000 then return end 
		local angle = direction:Angle()
		angle.pitch = 0
		self:SetAngles(angle)
		if (self.TimeToDash2 or 1) < CurTime() then
			self.TimeToDash2 = CurTime() + 0.4
			local phys = self:GetPhysicsObject() 
			if phys then
				phys:AddVelocity(direction*420)
			end
		end
		return 
	end
	self:SetSequence(self:GetOwner():GetSequence())
--	self:EmitSound("purg_ghostdash"..math.random(1,3)..".wav", 70, math.random(125, 135))
--	if self.Exploded or self.DieTime < CurTime() then
	---	self:Remove()
	--end
end


function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end

