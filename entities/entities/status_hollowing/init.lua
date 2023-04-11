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
	
	local hollowing = self
	local owner = self:GetOwner()
	if (hollowing) then
		if (hollowing.DieTime <= CurTime()) then
			owner:TakeSpecialDamage(self.maxHallow, DMG_DIRECT, (self.Applier or owner), self)
			hollowing:Remove()
			owner.MasteryHollowing = 0
		end
		if (hollowing.DieTime-CurTime()>self.maxHallow) then
			self.maxHallow = (math.ceil(hollowing.DieTime-CurTime()))
			self:SetDTInt(1,self.maxHallow)
		end
		
	end
	if self:GetStartTime() + self:GetDuration() - CurTime() >= 2000 then
		owner:Kill()
	end


	self:SetDuration(self.DieTime - CurTime() - 2)
	self.DieTime = self.DieTime - 2


end
