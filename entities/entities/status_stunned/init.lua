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
	local owner = self:GetOwner()
	if owner:IsBot() then
		owner:Freeze(true)
	else
		owner:SetSpeed(10)
	end
	if self.DieTime < CurTime() then
		if owner:IsBot() then
			owner:Freeze(false)
		else
			owner:ResetSpeed()
		end
		self:Remove()
	end
	self:NextThink(CurTime()+0.1)
end

