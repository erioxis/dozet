INC_SERVER()


ENT.CleanupPriority = 1
ENT.NextThinkA = 0
function ENT:Initialize()
	self.ObjHealth = 200
	self.Forced = self.Forced or false
	self.NeverRemove = self.NeverRemove or false
	self.Restrained = self.Restrained or false
	self.NextThinkA = 0
	self:SetModel("models/props_c17/oildrum001.mdl")

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetColor(Color(180,120,17))

	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("material")
		phys:EnableMotion(not self.Restrained)
		phys:SetMass(45)
		phys:Wake()
	end

end
function ENT:Think()
	if self.NextThinkA > CurTime() then return end
	local own = self:GetOwner()
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 128)) do
		if ent and "prop_obj_sigil" == ent:GetClass() and own:IsValidLivingHuman() then
			own:AddZSXP(15)
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			if math.random(1,10) == 1 then
				self:Remove()
				own:AddZSXP(200)
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
			end
		end
	end
	self.NextThinkA = CurTime() + 1
end