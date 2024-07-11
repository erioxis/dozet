INC_SERVER()

local vector_origin = vector_origin
ENT.NextThink1 = 2
function ENT:Initialize()
	self:SetModel("models/props_trainstation/trainstation_clock001.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:SetupGenericProjectile(false)
	self:SetColor(Color(252,217,61, 120))
	self:SetAlpha(60)
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav", math.random(2,255), math.random(1,50))

	self.DieTime = CurTime() + 4
	self.LastPhysicsUpdate = UnPredictedCurTime()
end
function ENT:OnRicoShot() 
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav")
	return ent == self and true or ent ~= self and false
end
function ENT:DoRicochet(dmg, ent)
	owner = self:GetOwner()
	util.SpriteTrail( self, 0, Color( 144,61,252), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
	if ent == self then return ent end
	ent.DamageMul = ent.DamageMul * 4
	ent.DieTime = CurTime() + 12
end
function ENT:DoBackShot(dmginfo, attacker)
	owner = self:GetOwner()
	util.SpriteTrail( self, 0, Color( 252,61,61), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
	owner:TakeDamage(dmginfo * 2, attacker, self)
	pos = owner:GetPos()
	pos.z = 5
	self:SetPos(pos)
end
function ENT:DoRicoShot(ent, pos, melee, dmginfo, attacker)
	local owner = self:GetOwner()
	if ent and ent:IsValid() and ent:IsPlayer() and ent:IsValidLivingZombie() or ent.AllowSelfRicoShot then
		if not ent.AllowSelfRicoShot then
			ent:TakeDamage(math.min(750 * self.DamageMul,(dmginfo * 2) * self.DamageMul), attacker, attacker:GetActiveWeapon())
			if (not melee) then
				timer.Simple(0.95, function() if self:IsValid() then self:Remove() end end)
				
				util.SpriteTrail( self, 0, Color( 61,252,109), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
				timer.Simple(0.05, function() self:SetPos(pos) end)
			elseif melee then
				self:SetPos(pos)
				pos.z = 5
				timer.Simple(0.05, function()  self:SetPos(pos) end)
				self.DieTime = CurTime() + 5
				self.DamageMul = self.DamageMul * 2
				self:SetVelocity(pos)
				util.SpriteTrail( self, 0, Color( 252,217,61 ), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
				local target = attacker

				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()
		
				self:SetAngles(direction:Angle())
		
				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 2000)
			end
		else
			ent:DoRicochet((dmginfo * 2) * self.DamageMul, ent)
		end
	elseif ent and ent:IsValid() and ent:IsPlayer() and attacker:IsValidLivingZombie() then
		self:DoBackShot(dmginfo, attacker)	
	end
	self:OnRicoShot()
end

function ENT:Think()
	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:Remove()
	end
	if CurTime() >= self.NextThink1 then 
	for _, ent in pairs(player.FindInSphere(self:GetPos(), 348)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
			if target:IsValidLivingZombie()  then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()

				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 500)
				target:TakeDamage((self.ProjDamage * self.DamageMul) * 0.35, self:GetOwner(), self)
				break
			end
		end
	end
		self.NextThink1 = CurTime() + 0.1
	end

end
function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end
local owner = self:GetOwner()
	local attacker = dmginfo:GetAttacker()
	local pos = self:GetPos()
	local dmginfotrue = dmginfo:GetDamage()

	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
		for _, ent in pairs(ents.FindInSphere(pos, 1048)) do
			if WorldVisible(self:LocalToWorld(Vector(0, 0, 30)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 30)))) then
				if not attacker:GetActiveWeapon().IsMelee then
					self:DoRicoShot(ent, ent:GetPos(), nil, dmginfotrue, attacker)
				elseif attacker:GetActiveWeapon().IsMelee then
					self:DoRicoShot(ent, ent:GetPos(), true, dmginfotrue, attacker)
				elseif attacker:IsValidLivingZombie() then
					self:DoBackShot(dmginfotrue, attacker)
				end
			end
		end
	elseif attacker:IsValidLivingZombie() and attacker:IsValid() and attacker:IsPlayer() then
		self:DoBackShot(dmginfotrue, attacker)
	end
	
end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
end
