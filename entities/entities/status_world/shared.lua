ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self.BaseClass.Initialize(self)



	self:GetOwner().ZaWarudo = self
end

function ENT:OnRemove()
	self.BaseClass.OnRemove(self)

	self:GetOwner().ZaWarudo = nil
end
function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
