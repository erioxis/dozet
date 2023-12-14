INC_SERVER()
ENT.KnockbackScale = 1
function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_NONE)
	self:SetupGenericProjectile(false)
	self.trg = NULL
	timer.Simple(0, function() self:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end)
	self.DieTime = CurTime() + 30
	--self.TimeToDash = CurTime() + 1
	--self:Fire("kill", "", 4.75)
end
function ENT:ShootBullets(dmg, numbul)
	local owner = self:GetOwner()
	if owner and owner:IsValid() then 
		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end
		self:EmitSound("zombiesurvival/purg_ghostdash"..math.random(1,3)..".wav", 100, nil,100)
		local target = self.trg
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		owner:LagCompensation(true)	
		self:SetDTVector(22, direction)
		self:FireBulletsLua(self:GetPos(), direction, 0, numbul, dmg, owner, self.KnockbackScale, self.TracerName, owner:GetActiveWeapon().BulletCallback, 1, nil, 1028, nil, self)
		owner:LagCompensation(false)
		self.trg = NULL

		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end
	end
end
function compare(a,b)
	return a.Health > b.Health
end
function ENT:Think()
	if !self.trg:IsValid() then
		local targets = {}
		for _, ent in pairs(ents.FindInSphere(self:GetPos(), 1048)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10))))  then
				if target:IsValidLivingZombie() and !(target:GetZombieClassTable().CrowDa or target.SpawnProtection) then 
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
	if self.PhysicsData and self.PhysicsData.HitEntity then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end
	if (self.TimeToDash or 1) <= CurTime() and self.trg:IsValidLivingZombie() then
		local wep = self:GetOwner():GetActiveWeapon()
		local dmg = 50
		if wep and wep:IsValid() then
			dmg = (wep.IsMelee and wep.MeleeDamage or wep.Primary.Damage or 50)*0.25
		end
		self.TimeToDash = CurTime() + 0.33
		self:ShootBullets(dmg, 1)
	end
	
--	self:EmitSound("purg_ghostdash"..math.random(1,3)..".wav", 70, math.random(125, 135))
	if self.Exploded or self.DieTime < CurTime() then
		self:Remove()
	end
end

function ENT:OnRemove()
	self:Hit(self:GetPos(), Vector(0, 0, 1), NULL)
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity)
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	vHitPos = vHitPos or self:GetPos()
	vHitNormal = vHitNormal or Vector(0, 0, 1)
	if eHitEntity and eHitEntity:IsValid() and owner ~= self then
		eHitEntity:TakeSpecialDamage(self.DamageToDeal * (owner.ProjectileDamageMul or 1),DMG_DISSOLVE,owner, self)
	end

	local effectdata = EffectData()
		effectdata:SetOrigin(vHitPos)
		effectdata:SetNormal(vHitNormal)
	util.Effect("explosion_wispball", effectdata)
end

function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end

