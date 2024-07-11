ENT.Type = "anim"
ENT.Base = "status__base"


AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end

function ENT:Initialize()
	self.BaseClass.Initialize(self)
	
	if CLIENT then
		hook.Add("Draw", self, self.Draw)
	end
end
