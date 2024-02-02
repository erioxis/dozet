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
	self:NextThink(CurTime())
	if self.DieTime <= CurTime() then
		self:Remove()
	end
	return true
end
