AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)


function ENT:Initialize()
	self.BaseClass.Initialize(self)
end
function ENT:Think(arguments)
	if CLIENT then return end
	if !self:GetOwner() or !self:GetOwner():IsValid() then
		self:Remove()
	end
end
