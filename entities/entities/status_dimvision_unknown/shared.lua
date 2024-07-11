ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self:DrawShadow(false)

end

function ENT:OnRemove()
	self.BaseClass.OnRemove(self)

	self:GetOwner().DimVision = nil
end

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
