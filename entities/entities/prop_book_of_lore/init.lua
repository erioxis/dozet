INC_SERVER()

ENT.DieTime = 0

function ENT:Initialize()



	self:SetModel("models/props_lab/binderblue.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetModelScale(3)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
	end
end

function ENT:Think()
end
function ENT:Use(activator, caller)
	if activator:IsValidLivingHuman() and (self.NuhUh or 1) < CurTime() then
--		print(self.KeyValues['WhatDo'][1])
		local who = self.KeyValues['WhatDo'] or {"haha,no","Hihi"}
		net.Start('zs_lore_book')
		net.WriteTable(who)
		net.Send(activator)
		activator:GiveAchievement('read_a_lore') 
		self.NuhUh = CurTime() + 1
		if self.KeyValues['OnAchievement'] then
			activator:GiveAchievement(self.KeyValues['OnAchievement']) 
		end
	end
end

