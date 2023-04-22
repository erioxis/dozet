INC_SERVER()
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.LifeTime = 3

function ENT:Initialize()
	self:SetModel("models/Gibs/HGIBS.mdl")
	self:PhysicsInitSphere(13)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetModelScale(1.1, 0)
	self:SetCustomCollisionCheck(true)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMass(20)
		phys:SetBuoyancyRatio(0.002)
		phys:EnableMotion(true)
		phys:Wake()
	end

	self:SetMaterial("models/props_wasteland/rockcliff04a")

	self.DeathTime = CurTime() + 30
	self.ExplodeTime = CurTime() + self.LifeTime
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
	end

	if self.DeathTime <= CurTime() then
		self:Remove()
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	local pos = self:GetPos()
	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	util.BlastDamageEx(self, owner, pos, 140, 26, DMG_SLASH)

	local ent = ents.Create("env_abyssspikez")
	if ent:IsValid() then
		ent:SetPos(pos + Vector(0,0,-8) )
		ent:SetOwner(owner)
		ent:Spawn()

		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetVelocityInstantaneous(VectorRand():GetNormalized())
			phys:AddAngleVelocity( VectorRand() * 25 )
		end
	end

end

function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
