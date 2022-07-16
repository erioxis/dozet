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
			owner:TakeSpecialDamage(self.maxHallow, DMG_DIRECT, owner, self)
			hollowing:Remove()
			owner.MasteryHollowing = 0
		end
		if (hollowing.DieTime-CurTime()>self.maxHallow) then
			self.maxHallow = (math.ceil(hollowing.DieTime-CurTime()))
		end
		
	end


	if self.timer >= self.maxTimer then
		self.DieTime = self.DieTime - 5
		self.timer = 1
		self:SetDuration(self.DieTime - CurTime())
	end

end
