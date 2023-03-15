INC_SERVER()

ENT.DieTime = 0

function ENT:Initialize()
	self.ObjHealth = 25
	self.NextUse = CurTime() + 0.4
	if self.DieTime == 0 then
		self.DieTime = CurTime() + GAMEMODE.GibLifeTime
	end


	self:SetModel("models/gibs/HGIBS.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)
	self:SetModelScale(3)
	self:SetColor(Color(238, 24, 24))
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(VectorRand():GetNormalized() * math.Rand(2000, 5000))
		phys:AddAngleVelocity(VectorRand() * 360)
	end
end

function ENT:Think()
	if self.DieTime >= 0 and self.DieTime <= CurTime() then
		self:Remove()
	end
end
function ENT:Use(activator, caller)
	if self:GetOwner() == activator and self.NextUse <= CurTime() then
		activator:SetHealth(math.Clamp(activator:Health() + self:GetHP(),1,activator:GetMaxHealth()))
		if self:GetBA() >= 1 then
			activator:SetBloodArmor(activator:GetBloodArmor() + self:GetBA())
		end
		self:Remove()
	end
end
function ENT:StartTouch(ent)
	if self:GetOwner() == ent and self.NextUse <= CurTime() then
		ent:SetHealth(math.Clamp(ent:Health() + self:GetHP(),1,ent:GetMaxHealth()))
		if self:GetBA() >= 1 then
			ent:SetBloodArmor(ent:GetBloodArmor() + self:GetBA())
		end
		self:Remove()
	end
end

