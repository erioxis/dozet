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
			owner:SetHealth(owner:Health() - self.maxHallow)
			hollowing:Remove()
		end
		if (hollowing.DieTime-CurTime()>self.maxHallow) then
			self.maxHallow = hollowing.DieTime-CurTime()
		end
		
	end

	self.timer = self.timer + 1
	if self.timer >= self.maxTimer then
		self.DieTime = self.DieTime - 1
		self.timer = 0
		self:SetDuration(self.DieTime - CurTime())
	end

end
