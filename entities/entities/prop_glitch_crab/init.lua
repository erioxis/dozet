INC_SERVER()


ENT.Created = 0
ENT.trg = NULL
function ENT:Initialize()
	self:SetModel("models/hunter/blocks/cube025x025x025.mdl")
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(1, 0)
	self:PhysicsInit(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
	end
	self.DieTime = CurTime() + 8
	self.LastPhysicsUpdate = UnPredictedCurTime()
end
function compare(a,b)
	return a.Health < b.Health
  end
function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	local attacker = dmginfo:GetAttacker()
	if dmginfo:GetDamage() >= 1 and not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD) then
		self:Destroy()
	end
end
function ENT:Think()
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end
	if self.DieTime < CurTime() then
		self:Destroy()
	end
	if !self.trg:IsValid() then
		local targets = {}
		for _, ent in pairs(player.FindInSphere(self:GetPos(), 1048)) do
			if !ent:IsValid() then continue end
			target = ent
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 5)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 5))))  then
				if target:IsValidLivingHuman() then 
					targets[(#targets or 0) + 1] = {Health = ent:Health() + (ent:GetBloodArmor() or 1)/2, trg = target}
				end
			end
		end
		table.sort(targets, compare)
		for k, target1 in pairs(targets) do
			target = target1.trg
			--print( target1.Health)
			if target and target:IsValidLivingHuman() then
				self.trg = target
				break
			end
		end
	else
		local target = self.trg
		if target:IsValidLivingZombie() then self:Remove() end
		local targetpos = target:LocalToWorld(target:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		local ang = direction:Angle()
		ang.pitch = 0
		self:SetAngles(ang)
		local phys = self:GetPhysicsObject()
		
		direction.z = 0
		--phys:SetVelocityInstantaneous(phys:GetVelocity()+direction * 190)
		phys:SetVelocity(direction * 300 + (math.random(1,250) == 1 and Vector(0,0,500) or Vector(0,0,0)))
	end
	self:NextThink(CurTime()+0.1)
	return true
end
function ENT:Hit(vHitPos, vHitNormal, ent)
	if !ent:IsValid() then return end
	ent:TakeDamage(3,self:GetOwner() or self,self)
	self:Destroy()
end
function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
function ENT:Destroy()
	if self.Destroyed then return end
	self.Destroyed = true

	util.Blood(self:GetPos(), 5, Vector(0, 0, 1), 100, true)

	self:Fire("kill", "", 0.01)
end


function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
