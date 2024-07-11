INC_SERVER()
function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetupGenericProjectile(false)
	self.trg = NULL
	timer.Simple(0, function() self:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end)
	self.DieTime = CurTime() + 9
	--self.TimeToDash = CurTime() + 1
	--self:Fire("kill", "", 4.75)
end

function ENT:Think()
	if self.PhysicsData and self.PhysicsData.HitEntity then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end
	if self.TimeToDash <= CurTime() then
		self:Dash()
	end
--	self:EmitSound("purg_ghostdash"..math.random(1,3)..".wav", 70, math.random(125, 135))
	if self.Exploded or self.DieTime < CurTime() then
		self:Remove()
	end
end
function compare(a,b)
	return a.Health > b.Health
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
	util.Effect("explosion_save_eye", effectdata)
end

function ENT:PhysicsCollide(data, phys)
	if not self:HitFence(data, phys) then
		self.PhysicsData = data
	end

	self:NextThink(CurTime())
end
function ENT:Dash()
	if !self.trg:IsValid() then
		local targets = {}
		for _, ent in pairs(player.FindInSphere(self:GetPos(), 1048)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10))))  then
				if target:IsValidLivingZombie() and !target:GetZombieClassTable().CrowDa  then 
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
	else
		self.DieTime = self.DieTime + 0.3
		self:EmitSound("zombiesurvival/purg_ghostdash"..math.random(1,3)..".wav", 100, nil,100)
		local target = self.trg
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		self:SetAngles(direction:Angle())
		local phys = self:GetPhysicsObject()
		phys:SetVelocityInstantaneous(direction * 500 + target:GetVelocity())
		self.TimeToDash = CurTime() + 0.4
	end
end
