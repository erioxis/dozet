INC_SERVER()

local vector_origin = vector_origin
ENT.CanRicoChet = true
function ENT:Initialize()
	self:SetModel("models/props_trainstation/trainstation_clock001.mdl")
	self:PhysicsInitSphere(1.7)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.4, 0.1)
	self:SetupGenericProjectile(true)
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
	owner:TakeDamage(dmginfo * 12, attacker, self)
	pos = owner:GetPos()
	pos.z = 5
	self:SetPos(pos)
end
function ENT:DoRicoShot(ent, pos, melee, dmginfo, attacker)
	local owner = self:GetOwner()
	if ent and ent:IsValid() and ent:IsPlayer() and ent:IsValidLivingZombie() or ent.AllowSelfRicoShot then
		if not ent.AllowSelfRicoShot then
			ent:TakeSpecialDamage((dmginfo * 2) * self.DamageMul, DMG_BULLET, attacker, attacker:GetActiveWeapon())
			if (not melee) then
				timer.Simple(0.95, function() if self:IsValid() then self:Remove() end end)
				
				util.SpriteTrail( self, 0, Color( 61,252,109), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
				timer.Simple(0.05, function() self:SetPos(pos) end)
				if dmginfo <= 300 then
					net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "RICOSHOT",score = 50}) net.Send(attacker) 
				else
					net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "ULTRARICOSHOT",score = 150,color = Color(139,26,133)}) net.Send(attacker) 
				end
			elseif melee then
				net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "FISTFUL OF DOLLAR",score = 50,color = Color(70,181,255)}) net.Send(attacker) 
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
				if attacker:IsValidLivingHuman() then
					self:DoRicoShot(ent, ent:GetPos(), attacker:GetActiveWeapon().IsMelee, dmginfotrue, owner)
				elseif attacker:IsValidLivingZombie() then
					self:DoBackShot(dmginfotrue, attacker)
				end
			end
		end
	elseif attacker:IsValidLivingZombie() and attacker:IsValid() and attacker:IsPlayer() then
		self:DoBackShot(dmginfotrue, attacker)
	end
	
end

