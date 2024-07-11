INC_SERVER()


function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetModel("models/props_wasteland/medbridge_post01.mdl")
	self:PhysicsInitBox(Vector(-16.285, -16.285, -0.29) * self.ModelScale, Vector(16.285, 16.285, 104.29) * self.ModelScale)
	self:SetUseType(SIMPLE_USE)
	
	
	
	self:SetCollisionGroup(COLLISION_GROUP_INTERACTIVE)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end
end

function ENT:Use(pl)
	if pl:IsValid() and !pl:IsValidLivingZombie() then
		pl:SendLua("GAMEMODE:OpenAArsenalMenu()")
	end
end


function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
