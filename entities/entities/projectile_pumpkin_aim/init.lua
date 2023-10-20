INC_SERVER()

ENT.NextWaterDamage = 0

function ENT:Initialize()
	self:SetModel(self.Model)
	self:SetUseType(SIMPLE_USE)

	self:PhysicsInit(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(self.Mass)
		phys:EnableDrag(false)
		phys:EnableMotion(true)
		phys:Wake()
		phys:SetBuoyancyRatio(0.8)
		phys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)

		local Constraint = ents.Create("phys_keepupright")
		Constraint:SetAngles(Angle(0, 0, 0))
		Constraint:SetKeyValue("angularlimit", 5)
		Constraint:SetPhysConstraintObjects(phys, phys)
		Constraint:Spawn()
		Constraint:Activate()
		self:DeleteOnRemove(Constraint)
	end

	self:StartMotionController()

	self:SetMaxObjectHealth(self.MaxHealth)
	self:SetObjectHealth(self:GetMaxObjectHealth())

	self.LastThink = CurTime()
	self.DieTime = CurTime()+7

	self.NextTouch = {}

	self:SetBodygroup(1, 1)
	self:SetBodygroup(2, 1)
	self:SetSequence(1)
	self:SetPlaybackRate(1)
	self:UseClientSideAnimation(true)

	local ent = ents.Create("fhb")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:SetParent(self)
		ent:SetOwner(self)
		ent.Size = self.HitBoxSize
		ent:Spawn()
		ent.IgnoreMelee = false
	end

	ent = ents.Create("env_projectedtexture")
	if ent:IsValid() then
		ent:SetPos(self:GetRedLightPos())
		ent:SetAngles(self:GetRedLightAngles())
		ent:SetKeyValue("enableshadows", 0)
		ent:SetKeyValue("farz", 400)
		ent:SetKeyValue("nearz", 8)
		ent:SetKeyValue("lightfov", 80)
		local owner = self:GetOwner()
		if owner:IsValid() and owner:IsPlayer() then
			local vcol = owner:GetPlayerColor()
			if vcol then
				if vcol == vector_origin then
					vcol.x = 1 vcol.y = 1 vcol.z = 1
				end
				vcol:Normalize()
				vcol = (vcol * 2 + Vector(1, 1, 1)) / 3
				vcol.x = math.Clamp(math.ceil(vcol.x * 255), 0, 255)
				vcol.y = math.Clamp(math.ceil(vcol.y * 255), 0, 255)
				vcol.z = math.Clamp(math.ceil(vcol.z * 255), 0, 255)
				ent:SetKeyValue("lightcolor", vcol.x.." "..vcol.y.." "..vcol.z.." "..255)
			else
				ent:SetKeyValue("lightcolor", "200 220 255 255")
			end
		else
			ent:SetKeyValue("lightcolor", "200 220 255 255")
		end
		ent:SetParent(self)
		ent:Spawn()
		ent:Input("SpotlightTexture", NULL, NULL, "effects/flashlight001")
	end

	self:SetCustomCollisionCheck(true)
	self:CollisionRulesChanged()

	hook.Add("SetupPlayerVisibility", self, self.SetupPlayerVisibility)
end

function ENT:SetupPlayerSkills()
	self:SetObjectOwner(self:GetOwner())
	local owner = self:GetOwner()
	local newmaxhealth = self.MaxHealth
	local currentmaxhealth = self:GetMaxObjectHealth()
	local defaults = scripted_ents.Get(self:GetClass())
	local hitdamage = defaults.HitDamage
	local maxspeed = defaults.MaxSpeed
	local acceleration = defaults.Acceleration
	local loaded = false

	if owner:IsValid() then
		newmaxhealth = 1
		hitdamage = self.ProjDamage or 300
		maxspeed = maxspeed * (owner.ControllableSpeedMul or 1)
		acceleration = acceleration 
	end

	newmaxhealth = math.ceil(newmaxhealth)

	self:SetMaxObjectHealth(newmaxhealth)
	self:SetObjectHealth(self:GetObjectHealth() / currentmaxhealth * newmaxhealth)

	self.HitDamage = hitdamage
	self.MaxSpeed = maxspeed
	self.Acceleration = acceleration

end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)

	if health <= 0 then
		self:Destroy()
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	local attacker = dmginfo:GetAttacker()
	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then return end

	self:TakePhysicsDamage(dmginfo)

	if dmginfo:GetDamageType() == DMG_ACID then
		dmginfo:SetDamage(dmginfo:GetDamage() * 2)
	end

	self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())


	local effectdata = EffectData()
		effectdata:SetOrigin(self:NearestPoint(dmginfo:GetDamagePosition()))
		effectdata:SetNormal(VectorRand():GetNormalized())
		effectdata:SetMagnitude(4)
		effectdata:SetScale(1.33)
	util.Effect("sparks", effectdata)
end


function ENT:PhysicsCollide(data, phys)
	self.HitData = data
	self:NextThink(CurTime())
end

function ENT:OnPackedUp(pl)
	self:Remove()
end

function ENT:PhysicsSimulate(phys, frametime)
	phys:Wake()

	local owner = self:GetOwner()
	if not owner:IsValid() or self.DisableControlUntil and CurTime() < self.DisableControlUntil then return SIM_NOTHING end

	local vel = phys:GetVelocity()
	local movedir = Vector(0, 0, 0)
	local eyeangles = owner:SyncAngles()
	local aimangles = owner:EyeAngles()

	local trace = {mask = MASK_HOVER, filter = self, start = self:GetPos()}
	local tr, tr2

	if self:BeingControlled() then
		trace.endpos = trace.start - Vector(0, 0, self.HoverHeight * 0.1)
		tr = util.TraceLine(trace)

		movedir = movedir + aimangles:Forward()*4
		if owner:KeyDown(IN_MOVERIGHT) then
			movedir = movedir + aimangles:Right()*5
		end
		--self:TakeDamage(10)
		if owner:KeyDown(IN_MOVELEFT) then
			movedir = movedir - aimangles:Right()*5
		end
		if owner:KeyDown(IN_BULLRUSH) then
			movedir = movedir + Vector(0, 0, 0.5)
		end
		if owner:KeyDown(IN_GRENADE1) then
			movedir = movedir - Vector(0, 0, 0.5)
		end
		trace.endpos = trace.start + Vector(0, 0, self.HoverHeight * 0.5)
		tr2 = util.TraceLine(trace)

		if tr.Hit and not tr2.Hit then
			movedir.z = 0.5
		end
	end

	if movedir == vector_origin then
		vel = vel * (1 - frametime * self.IdleDrag)
	else
		movedir:Normalize()

		vel = vel + frametime * self.Acceleration * 10 * movedir
	end

	if vel:Length() > self.MaxSpeed then
		vel:Normalize()
		vel = vel * self.MaxSpeed
	end

	if movedir == vector_origin and vel:Length() <= self.HoverSpeed then
		trace.endpos = trace.start + Vector(0, 0, self.HoverHeight * -2)
		tr = util.TraceLine(trace)

		local hoverdir = (trace.start - tr.HitPos):GetNormalized()
		local hoverfrac = (0.5 - tr.Fraction) * 2
		vel = vel + frametime * hoverfrac * self.HoverForce * hoverdir
	end

	phys:EnableGravity(false)
	phys:SetAngleDragCoefficient(10000)
	phys:SetVelocityInstantaneous(vel)

	local diff = math.AngleDifference(eyeangles.yaw, phys:GetAngles().yaw)
	local z = math.Clamp(diff, -32, 32) * frametime * 10
	local curz = phys:GetAngleVelocity().z
	z = z - curz * (frametime * math.min(1, math.abs(z - curz) ^ 2 * 0.02))

	phys:AddAngleVelocity(Vector(0, 0, z))

	self:SetPhysicsAttacker(owner)

	return SIM_NOTHING
end

function ENT:Destroy()
	if self.Destroyed then return end
	self.Destroyed = true

	local epicenter = self:LocalToWorld(self:OBBCenter())

	local effectdata = EffectData()
		effectdata:SetOrigin(epicenter)
		effectdata:SetNormal(Vector(0,0,0))
	util.Effect("hit_pumpkin", effectdata)

end

ENT.PhysDamageImmunity = 0
function ENT:Think()
	if self.Destroyed then
		if not self.CreatedDebris then
			self.CreatedDebris = true

			local ent = ents.Create("prop_physics")
			if ent:IsValid() then
				ent:SetPos(self:GetPos())
				ent:SetAngles(self:GetAngles())
				ent:SetModel(self:GetModel())
				ent:Spawn()
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:SetVelocityInstantaneous(self:GetVelocity())
				end

				ent:Fire("break")
				ent:Fire("kill", "", 0.05)
			end
		end

		self:Remove()
		return
	end
	if self.DieTime < CurTime() then
		self:TakeDamage(1)
	end
	local owner = self:GetOwner() or self:GetOwner()
	if owner:IsValid() then
		self:SetPhysicsAttacker(owner)

		if not owner:Alive() or owner:Team() ~= TEAM_HUMAN then
			self:Destroy()
			return
		end
	else
		self:Destroy()
		return
	end

	if self:WaterLevel() >= 2 and CurTime() >= self.NextWaterDamage then
		self.NextWaterDamage = CurTime() + 0.2

		self:TakeDamage(10)
	end

	local data = self.HitData
	if data then
		self.HitData = nil
		self:ThreadSafePhysicsCollide(data)
	end
end

function ENT:ThreadSafePhysicsCollide(data)
	local owner = self:GetOwner()
	if not owner:IsValidLivingHuman() then return end

	local hitflesh = false
	local hitentity = false
	local ent = data.HitEntity

	if ent and ent:IsValid() and CurTime() >= (self.NextTouch[ent] or 0) then
		ent:TakeSpecialDamage(self.ProjDamage, DMG_CLUB, owner, self)
		self:TakeDamage(1)
	end

	if hitentity then return end

	local dir = (self:GetPos() - data.HitPos):GetNormalized()

	if data.Speed > self.HoverSpeed then
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:AddVelocity(dir * self.BounceVelocity)
		end
	end
end


function ENT:SetupPlayerVisibility(pl)
	if pl ~= self:GetOwner() then return end

	AddOriginToPVS(self:GetPos())
end
