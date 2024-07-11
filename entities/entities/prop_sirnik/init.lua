INC_SERVER()

ENT.DieTime = 0
ENT.IgnoreEnt = NULL 
ENT.NextIgnoreUse = 0

function ENT:Initialize()
	self.ObjHealth = 625

	if self.DieTime == 0 then
		self.DieTime = CurTime() + 750
	end

	self:SetModel("models/3lectronux/cheese_cut"..math.random(1, 3)..".mdl")
	self:SetModelScale(1)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(VectorRand():GetNormalized() * math.Rand(2000, 5000))
		phys:AddAngleVelocity(VectorRand() * 360)
	end
end


function ENT:KeyValue(key, value)
	key = string.lower(key)
	if key == "gibtype" then
		value = tonumber(value)
		if not value then return end

		self:SetGibType(value)
	elseif key == "lifetime" then
		value = tonumber(value)
		if not value then return end

		if value <= 0 then
			self.DieTime = -1
		else
			self.DieTime = CurTime() + value
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 or dmginfo:GetAttacker():IsValidLivingHuman() then return end

	self:TakePhysicsDamage(dmginfo)

	self.ObjHealth = self.ObjHealth - dmginfo:GetDamage()
	if self.ObjHealth <= 0 and not self.Destroyed then
		self.Destroyed = true
		self.DieTime = 0
	end
end

function ENT:Think()
	if self.DieTime >= 0 and self.DieTime <= CurTime() then
		self:Remove()
	end
end



function ENT:StartTouch(ent)
	if self.IgnoreEnt == ent and self.NextIgnoreUse >= CurTime() then return end
	if self.DieTime ~= 0 and ent:IsValidLivingHuman() then
		ent.CheeseCount = (ent.CheeseCount or 0) + 1
		self:Remove()
		timer.Simple(0.1, function() ent:GiveAchievementProgress('cheese_mouse',1) end)
		timer.Simple(0.25, function() 		ent:GiveAchievementProgress('cheese_shmich',1)end)
	end
end
function ENT:OnRemove()
	self:EmitSound("zombiesurvival/eat1.ogg", 60, math.random(40, 150))
end
