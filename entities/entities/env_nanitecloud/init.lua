INC_SERVER()

ENT.TickTime = 1
ENT.Ticks = 10
ENT.HealPower = 30

function ENT:Initialize()
	local owner = self:GetOwner()

	self:DrawShadow(false)
	self.Ticks = math.floor(self.Ticks * (owner:IsValidLivingHuman() and owner.CloudTime or 1))

	self:Fire("heal", "", self.TickTime)
	self:Fire("kill", "", self.TickTime * self.Ticks + 0.01)
end

function ENT:AcceptInput(name, activator, caller, arg)
	if name ~= "heal" then return end

	self.Ticks = self.Ticks - 1

	local owner = self:GetOwner()
	if not owner:IsValidLivingHuman() then owner = self end

	local pos = self:GetPos()
	local totalheal = self.HealPower * (self:GetOwner().RepairRateMul or 1)

	for _, hitent in pairs(ents.FindInSphere(pos, self.Radius * (owner.CloudRadius or 1))) do
		if not hitent:IsValid() or hitent == self or not WorldVisible(pos, hitent:NearestPoint(pos)) then
			continue
		end

		local healed = false

		if hitent:IsNailed() then
			local oldhealth = hitent:GetBarricadeHealth()
			hitent:SetBarricadeRepairs(math.Clamp(hitent:GetBarricadeRepairs() + totalheal, 0,hitent:GetMaxBarricadeRepairs()*1.15))
		end
	end

	if self.Ticks > 0 then
		self:Fire("heal", "", self.TickTime)
	end

	return true
end
