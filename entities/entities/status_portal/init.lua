INC_SERVER()

function ENT:SetDie(fTime)
	if fTime == 0 or not fTime then
		self.DieTime = 0
	elseif fTime == -1 then
		self.DieTime = 999999999
	else
		self.DieTime = CurTime() + fTime
		self:SetDuration(fTime)
	end
end
function ENT:Think()
	self.BaseClass.Think(self)
	if !self.VectoredUse then
		self:SetDTVector(1, self:GetOwner():GetPos())
		self.VectoredUse = true
	end
end
function ENT:OnRemove()
	self.BaseClass.OnRemove(self)
	self:GetOwner():SetPos(self:GetDTVector(1))
end
