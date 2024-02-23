INC_SERVER()

local function RefreshDetpackOwners(pl)
	for _, ent in ipairs(ents.FindByClass("prop_teleport")) do
		if ent:IsValid() and ent:GetOwner() == pl then
			ent:SetOwner(NULL)
		end
	end
end


function ENT:Initialize()
	self.CreateTime = CurTime()

	self:SetModel("models/weapons/w_c4_planted.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
end
function ENT:Think()
	if (self.nextm or 1) <= CurTime() then
		local d = ents.Create("prop_money")
		if d:IsValid() then
			d:SetPos(self:GetPos()+Vector(0,0,20))
			d:Spawn()
			d:SetHP(10)
			d:SetTime(CurTime()+14)
			d.DieTime = CurTime() + 13.5
		end
		self.nextm = CurTime() + 20
	end
end
