INC_SERVER()

ENT.NextWaterDamage = 0
local util_TraceLine = util.TraceLine
local util_TraceHull = util.TraceHull
function ENT:Initialize()
	self:SetModel("models/combine_scanner.mdl")
	self:SetUseType(SIMPLE_USE)

	self:PhysicsInitBox(Vector(-30, -17, -14.15), Vector(18.29, 11.86, 15))
	self:PhysicsInit(SOLID_VPHYSICS)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("metal")
		phys:SetMass(75)
		phys:EnableDrag(false)
		phys:EnableMotion(true)
		phys:Wake()
		phys:SetBuoyancyRatio(0.8)
		phys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)

		local Constraint = ents.Create("phys_keepupright")
		Constraint:SetAngles(Angle(0, 0, 0))
		Constraint:SetKeyValue("angularlimit", 2)
		Constraint:SetPhysConstraintObjects(phys, phys)
		Constraint:Spawn()
		Constraint:Activate()
		self:DeleteOnRemove(Constraint)
	end

	self:StartMotionController()

	self:SetMaxObjectHealth(self.MaxHealth)
	self:SetObjectHealth(self:GetMaxObjectHealth())

	self.LastThink = CurTime()

	self:SetSequence(2)
	self:SetPlaybackRate(1)
	self:UseClientSideAnimation(true)
	self:SetCustomCollisionCheck(true)
	self:CollisionRulesChanged()

	hook.Add("SetupPlayerVisibility", self, self.SetupPlayerVisibility)
end

function ENT:SetupPlayerSkills()
	local owner = self:GetObjectOwner()
	local newmaxhealth = self.MaxHealth
	local currentmaxhealth = self:GetMaxObjectHealth()
	local defaults = scripted_ents.Get(self:GetClass())
	local maxspeed = defaults.MaxSpeed
	local acceleration = defaults.Acceleration
	local healmul = 1
	local loaded = false

	if owner:IsValid() then
		newmaxhealth = newmaxhealth * (owner.ControllableHealthMul or 1)
		maxspeed = maxspeed * owner:GetTotalAdditiveModifier("ControllableSpeedMul", "DroneSpeedMul")
		acceleration = acceleration * (owner.ControllableHandlingMul or 1)
		healmul = healmul * (owner.HealingReceived or 1)
		loaded = owner:IsSkillActive(SKILL_LOADEDHULL)
	end

	newmaxhealth = math.ceil(newmaxhealth)

	self:SetMaxObjectHealth(newmaxhealth)
	self:SetObjectHealth(self:GetObjectHealth() / currentmaxhealth * newmaxhealth)

	self.MaxSpeed = maxspeed
	self.Acceleration = acceleration
	self.CarryMass = carrymass

	if loaded then
		if not IsValid(self.LoadedProp) then
			local ent = ents.Create("prop_dynamic_override")
			if ent:IsValid() then
				ent:SetModel("models/props_junk/propane_tank001a.mdl")
				ent:SetModelScale(0.65, 0)
				ent:SetParent(self)
				ent:SetOwner(self)
				ent:SetLocalPos(Vector(-5, 0, -6.5))
				ent:SetLocalAngles(Angle(-40, 0, 0))
				ent:Spawn()

				self.LoadedProp = ent
			end
		end
	elseif IsValid(self.LoadedProp) then
		self.LoadedProp:Remove()
	end
end






local function CheckFHB(tr)
	if tr.Entity.FHB and tr.Entity:IsValid() then
		tr.Entity = tr.Entity:GetParent()
	end
end
local function MeleeTraceFilter(ent)
	if ent == temp_attacker 
	or ent.IgnoreMelee
	or not temp_override_team and ent.IgnoreMeleeTeam
	or temp_pen_ents[ent] then
		return false
	end

	return true
end
local function InvalidateCompensatedTrace(tr, start, distance)
	-- Need to do this or people with 300 ping will be hitting people across rooms
	if tr.Entity:IsValid() and tr.Entity:IsPlayer() and tr.HitPos:DistToSqr(start) > distance * distance + 144 then -- Give just a little bit of leeway
		tr.Hit = false
		tr.HitNonWorld = false
		tr.Entity = NULL
	end
end
local melee_trace = {filter = MeleeTraceFilter, mask = MASK_SOLID, mins = Vector(), maxs = Vector()}
function ENT:CompensatedMeleeTrace(distance, size, start, dir, hit_team_members, override_team)
	start = start or self:GetShootPos()
	dir = dir or self:GetAimVector()
	local owner = self:GetObjectOwner()
	owner:LagCompensation(true)
	local tr = self:MeleeTrace(distance, size, start, dir, hit_team_members, override_team)
	CheckFHB(tr)
	owner:LagCompensation(false)

	InvalidateCompensatedTrace(tr, start, distance)

	return tr
end
function ENT:PenetratingMeleeTrace(distance, size, start, dir, hit_team_members)
	start = start or self:GetShootPos()
	dir = dir or self:GetAimVector()
	hit_team_members = hit_team_members or GAMEMODE.RoundEnded
	local owner = self:GetObjectOwner()
	local tr, ent

	temp_attacker = owner
	temp_attacker_team = owner
	temp_pen_ents = {}
	melee_trace.start = start
	melee_trace.endpos = start + dir * distance
	melee_trace.mask = MASK_SOLID
	melee_trace.mins.x = -size
	melee_trace.mins.y = -size
	melee_trace.mins.z = -size
	melee_trace.maxs.x = size
	melee_trace.maxs.y = size
	melee_trace.maxs.z = size
	melee_trace.filter = hit_team_members and MeleeTraceFilterFFA or MeleeTraceFilter

	local t = {}
	local onlyhitworld
	for i=1, 50 do
		tr = util_TraceLine(melee_trace)

		if not tr.Hit then
			tr = util_TraceHull(melee_trace)
		end

		if not tr.Hit then break end

		if tr.HitWorld then
			table.insert(t, tr)
			break
		end

		if onlyhitworld then break end

		CheckFHB(tr)

		ent = tr.Entity
		if ent:IsValid() then
			if not ent:IsPlayer() then
				melee_trace.mask = MASK_SOLID_BRUSHONLY
				onlyhitworld = true
			end

			table.insert(t, tr)
			temp_pen_ents[ent] = true
		end
	end

	temp_pen_ents = {}

	return t, onlyhitworld
end

function ENT:CompensatedPenetratingMeleeTrace(distance, size, start, dir, hit_team_members)
	start = start or self:GetPos()
	dir = dir or self:GetGunAngles()
	local owner = self:GetObjectOwner()
	owner:LagCompensation(true)
	local t = self:PenetratingMeleeTrace(distance, size, start, dir, hit_team_members)
	owner:LagCompensation(false)

	for _, tr in pairs(t) do
		InvalidateCompensatedTrace(tr, start, distance)
	end

	return t
end
function ENT:FireTurret(src, dir)
	if self:GetNextFire() <= CurTime() then
		local curammo = self:GetAmmo()
		if curammo > 0 then
			local owner = self:GetObjectOwner()
			self:SetNextFire(CurTime() + 0.15 * (1-(self.ReducedCD or 0)))

			owner:LagCompensation(true)


			local trtbl = self:CompensatedPenetratingMeleeTrace(122, 1, src, dir, true)
			local ent
			for _, tr in pairs(trtbl) do
				local test = tr.Entity
				if test and test:IsValidLivingHuman() and gamemode.Call("PlayerCanBeHealed", test) then
					ent = test
		
					break
				end
			end
		
			if not ent or self:GetDTEntity(10):IsValid() then return end
					if  owner:IsSkillActive(SKILL_FOREVERALONE) then return end
			self:SetAmmo(curammo - 12)
			owner:HealPlayer(ent, 7)
			self:SetDTEntity(10, ent)
			self:EmitSound("items/medshot4.wav", 75, 80)
			owner:LagCompensation(false)
		else
			self:SetNextFire(CurTime() + 2)
			self:EmitSound("npc/turret_floor/die.wav")
		end
	end
end

ENT.PhysDamageImmunity = 1
function ENT:Think()
	if self.Destroyed then
		if not self.CreatedDebris then
			self.CreatedDebris = true

			if self:GetObjectOwner():IsValidLivingHuman() then
				self:GetObjectOwner():SendDeployableLostMessage(self)
			end

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

	local owner = self:GetObjectOwner()
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

	self:CalculateFireAngles()

	if self:GetAmmo() > 0 then
		if self:BeingControlled() and owner:KeyDown(IN_ATTACK) then
			if not self:IsFiring() then self:SetFiring(true) end
			self:FireTurret(self:GetRedLightPos(), self:GetGunAngles():Forward())
			self:CheckHealRay()
		else
			self:SetFiring(false)
		end
	end

	if self:WaterLevel() >= 2 and CurTime() >= self.NextWaterDamage then
		self.NextWaterDamage = CurTime() + 0.2

		self:TakeDamage(10)
	end

	self:NextThink(CurTime())

	local data = self.HitData
	if not data then return true end
	self.HitData = nil

	local ent = data.HitEntity
	if ent and ent:IsValid() then
		local physattacker = ent:GetPhysicsAttacker()
		if physattacker:IsValid() and physattacker:Team() == TEAM_HUMAN then
			self.PhysDamageImmunity = CurTime() + 0.5
		end
	end

	if data.Speed > self.HoverSpeed then
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			local dir = self:GetPos() - data.HitPos
			dir:Normalize()
			phys:AddVelocity(dir * 20)
		end
	end

	if ((not owner:IsSkillActive(SKILL_STABLEHULL) and data.Speed >= self.MaxSpeed * 0.75) or (self.LastShadeLaunch and self.LastShadeLaunch + 2 > CurTime())) and
	 	ent and ent:IsWorld() and CurTime() >= self.PhysDamageImmunity then
		self:TakeDamage(math.Clamp(data.Speed * 0.11, 0, 40))
	end

	return true
end
function ENT:StopHealing()
	self:SetDTEntity(10, NULL)
	self:EmitSound("items/medshotno1.wav", 75, 60)
end

function ENT:CheckHealRay()
	local ent = self:GetDTEntity(10)
	local owner = self:GetObjectOwner()

	if ent:IsValidLivingHuman() and gamemode.Call("PlayerCanBeHealed", ent) and owner:KeyDown(IN_ATTACK) and
		ent:WorldSpaceCenter():DistToSqr(owner:WorldSpaceCenter()) <= 122 * 122 then

		if CurTime() > self:GetDTFloat(10) then
			if owner:HasTrinket("pr_barapaw") and math.random(3) == 3 and SERVER then
				ent:GiveStatus("knockdown", 1.5)
			end
			owner:HealPlayer(ent, 7)
			self:SetDTFloat(10, CurTime() + 0.36)
			if owner:IsSkillActive(SKILL_COOL_MED) then
				ent:GiveStatus("sigildef",3)
			end
			local effectdata = EffectData()
			effectdata:SetStart(self:GetPos())
				effectdata:SetOrigin(ent:WorldSpaceCenter())
				effectdata:SetFlags(3)
				effectdata:SetEntity(self)
				effectdata:SetAttachment(1)
			util.Effect("tracer_healray", effectdata)
			local curammo = self:GetAmmo()
			self:SetAmmo(curammo - 7)
		end
	elseif ent:IsValid() then
		self:StopHealing()
	end
end
function ENT:SetupPlayerVisibility(pl)
	if pl ~= self:GetObjectOwner() then return end

	AddOriginToPVS(self:GetPos())
	AddOriginToPVS(self:GetPos() + pl:GetAimVector() * 1024)
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)

	if health <= 0 and not self.Destroyed then
		self.Destroyed = true
	end
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(1, health)
end

function ENT:SetNextFire(tim)
	self:SetDTFloat(2, tim)
end

function ENT:SetAmmo(ammo)
	self:SetDTInt(0, ammo)
end

function ENT:SetFiring(onoff)
	self:SetDTBool(0, onoff)
end
