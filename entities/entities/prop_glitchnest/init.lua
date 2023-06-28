INC_SERVER()

ENT.NextDecay = 0
ENT.BuildsThisTick = 0
ENT.ZombieConstruction = true
ENT.NKiller = NULL
ENT.NextThinkAboutBruh = 5
ENT.NextThinkAboutBruh2 = 2
ENT.Crabs = 3
ENT.NextUpdateCrabs = 0

function ENT:Initialize()
	self:SetModel("models/props_wasteland/antlionhill.mdl")
	self:PhysicsInitBox(Vector(-18, -18, 0), Vector(18, 18, 36))
	self:SetCollisionBounds(Vector(-18, -18, 0), Vector(18, 18, 36))
	self:SetSolid(SOLID_VPHYSICS)

	self:SetModelScale(0.2, 0)
	self:SetUseType(SIMPLE_USE)
	self:DrawShadow(false)

	self:SetCustomCollisionCheck(true)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)

	self:ManipulateBoneScale(0, self.ModelScale)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("flesh")
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetNestHealth(self.MaxHealth)

	self.LastBuild = CurTime()
end

function ENT:BuildUp()
	if CurTime() ~= self.LastBuildTime then
		self.LastBuildTime = CurTime()
		self.BuildsThisTick = 0
	end

	if self:GetNestLastDamaged() + 1 > CurTime() then return end

	if self.BuildsThisTick < 3 then
		self.BuildsThisTick = self.BuildsThisTick + 1

		self:SetNestHealth(math.min(self:GetNestHealth() + FrameTime() * self:GetNestMaxHealth() * 0.3, self:GetNestMaxHealth()))
	end
end

function ENT:Use()
end
function ENT:ShootGovnom(pl)
	if pl then 
		local targetpos = pl:LocalToWorld(pl:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		local pos = self:GetPos()
		local owner = self:GetNestOwner()
		timer.Simple(0.1, function()
			for i=1,math.random(3,7) do
				local ent = ents.Create("projectile_poisonflesh")
				if ent:IsValid() then
					ent:SetPos(pos+Vector(0,0,20))
					ent:SetOwner(owner)
					ent:Spawn()

					local phys = ent:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetVelocityInstantaneous(direction  * math.Rand(300, 500) + VectorRand(-200,300))
					end
				end
			end
		end)
		if self.Crabs < 1 then return end
		local ent = ents.Create("prop_glitch_crab")
		if ent:IsValid() then
			ent:SetOwner(owner)
			ent:Activate()
			ent:Spawn()
			ent:SetPos(pos+Vector(0,0,10))
			ent.trg = pl
			self.Crabs = self.Crabs - 1
		end
		return
	end
	local max = 0
	for k,v in pairs(ents.FindInBoxRadius(self:GetPos(), 300)) do
		if v:IsValidLivingZombie() or !v:IsPlayer() or max > 3 then continue end
		max = max + 1
		local targetpos = v:LocalToWorld(v:OBBCenter())
		local direction = (targetpos - self:GetPos()):GetNormal()
		for i=1,8 do
			local ent = ents.Create("projectile_poisonflesh")
			if ent:IsValid() then
				ent:SetPos(self:GetPos()+Vector(0,0,10))
				ent:SetOwner(table.Random(team.GetPlayers(TEAM_UNDEAD)))
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:SetVelocityInstantaneous(direction  * math.Rand(300, 500) + VectorRand(-200,300))
				end
			end
		end
	end
end
function ENT:Think()
	if not self:GetNestBuilt() then
		local time = CurTime()
		if time >= self.LastBuild + 3 and time >= self.NextDecay then
			self.NextDecay = time + 1

			self:TakeDamage(5)
		end
	end
	if self.NextThinkAboutBruh < CurTime() then 
		self.NextThinkAboutBruh = CurTime() + 5
		self:ShootGovnom()
	end
	if self.NextUpdateCrabs < CurTime() then
		self.NextUpdateCrabs = CurTime() + 0.5
		self.Crabs = math.min(self.Crabs + 1,20)
	end
	if self.NextThinkAboutBruh2 < CurTime() then 
		self.NextThinkAboutBruh2 = CurTime() + 4
		local max = 0
		for i=1,15 do
			local rand = math.random(1,50)
			local ent = ents.Create(rand ~= 1 and i % 3 == 1 and "projectile_ghoulfleshpuke" or rand ~= 1 and "projectile_poisonflesh" or "projectile_bonemesh")
			if ent:IsValid() then
				ent:SetPos(self:GetPos()+Vector(0,0,30))
				ent:SetOwner(rand ~= 1 and table.Random(team.GetPlayers(TEAM_UNDEAD)) or  self:GetNestOwner())
				ent:Spawn()
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					local direction = VectorRand(-200,300)
					phys:SetVelocityInstantaneous(Angle(math.Rand(-85, -70), math.Rand(0, 360), 0):Forward() * math.Rand(100, 500))
				end
			end
		end
	end
end
function ENT:OnSpawnInMe(pl)
	pl:GiveStatus("zomdefence",30)
	pl:GiveStatus("chains",30)
	pl:SetHealth(pl:Health()*1.5)
end
function ENT:OnTakeDamage(dmginfo)
	if self:GetNestHealth() <= 0 or dmginfo:GetDamage() <= 0 then return end

	local attacker = dmginfo:GetAttacker()
	if attacker:IsPlayer() then
		self.NKiller = attacker
	end
	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD then
		local owner = self:GetNestOwner()
		if !(attacker:GetZombieClassTable().Name == "Flesh Creeper" or attacker:GetZombieClassTable().Name == "Glitch Creeper")  then
			return
		end

		if owner and owner:IsValidZombie() and owner ~= attacker and not attacker:IsAdmin() and (owner:GetZombieClassTable().Name == "Flesh Creeper" or  attacker:GetZombieClassTable().Name ~= "Glitch Creeper" ) and owner:Alive() and owner:GetPos():DistToSqr(self:GetPos()) <= 589824 then --768^2
			attacker:CenterNotify(COLOR_RED, translate.ClientFormat(attacker, "x_has_built_this_nest_and_is_still_around", owner:Name()))
			return
		end

		-- Disabled. Small maps can be limited to 1 nest due to their layout and it can result in an indestructible nest that hampers zombie progress.
		--[[if #ents.FindByClass(self:GetClass()) == 1 and not attacker:IsAdmin() and owner ~= attacker then
			attacker:CenterNotify(COLOR_RED, translate.ClientGet(attacker, "no_other_nests"))
			return
		end]]
	end

	local damage = dmginfo:GetDamage() * (dmginfo:GetInflictor().FlyingControllable and 0.05 or dmginfo:GetInflictor().IsMelee and 2 or 0.2)
	if self:GetNestBuilt() and attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
		local points = damage / self:GetNestMaxHealth() * 8

		attacker.PointQueue = attacker.PointQueue + points

		local pos = self:GetPos()
		pos.z = pos.z + 32

		attacker.LastDamageDealtPos = pos
		attacker.LastDamageDealtTime = CurTime()
	end

	self:SetNestHealth(self:GetNestHealth() - damage)
	self:SetNestLastDamaged(CurTime())
	if attacker and attacker:IsValidLivingHuman() then
		self:ShootGovnom(attacker)
	end
	if self:GetNestHealth() <= 0 then
		if self:GetNestBuilt() and attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
			--attacker:AddPoints(5)
			attacker.NestsDestroyed = attacker.NestsDestroyed + 1
		end

		gamemode.Call("NestDestroyed", self, attacker)

		self:Destroy()
	end
end

function ENT:Destroy()
	self.Destroyed = true

	local pos = self:WorldSpaceCenter()
    
	local effectdata = EffectData()
		effectdata:SetEntity(self)
		effectdata:SetOrigin(pos)
	util.Effect("gib_player", effectdata, true, true)

	util.Blood(pos, 100, self:GetUp(), 256)


	self:Fire("kill", "", 0.01)
end

function ENT:OnRemove()
	if self.Destroyed and self:GetNestBuilt() then
		for _, pl in pairs(team.GetPlayers(TEAM_UNDEAD)) do
			pl:CenterNotify(COLOR_RED, translate.ClientFormat(pl, "nest_destroyed", name))
		end
		for _, pl in pairs(player.GetAll()) do
			if self.NKiller:IsValid() and self.NKiller:IsPlayer() then
				pl:TopNotify(COLOR_YELLOW ,{killicon = "nest"},translate.ClientGet(pl,"nest_destroyed_killicon"),{killicon = (self.NKiller:GetActiveWeapon():GetClass() or "nest")}, self.NKiller)
			end
		end


		local pos = self:WorldSpaceCenter()
		for i=1, 8 do
			local ent = ents.CreateLimited("prop_playergib")
			if ent:IsValid() then
				ent:SetPos(pos + VectorRand() * 12)
				ent:SetAngles(VectorRand():Angle())
				ent:SetGibType(math.random(3, #GAMEMODE.HumanGibs))
				ent:Spawn()
			end
		end
		for i=1,30 do
			local rand = math.random(1,50)
			local ent = ents.Create(rand ~= 1 and i % 3 == 1 and "projectile_ghoulfleshpuke" or rand ~= 1 and "projectile_poisonflesh" or "projectile_bonemesh")
			if ent:IsValid() then
				ent:SetPos(self:GetPos()+Vector(0,0,30))
				ent:SetOwner(rand ~= 1 and table.Random(team.GetPlayers(TEAM_UNDEAD)) or  self:GetNestOwner())
				ent:Spawn()
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					local direction = VectorRand(-200,300)
					phys:SetVelocityInstantaneous(Angle(math.Rand(-85, -70), math.Rand(0, 360), 0):Forward() * math.Rand(100, 500))
				end
			end
		end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
