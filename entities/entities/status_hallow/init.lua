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
	local hallow = self
	local owner = self:GetOwner()
	if (hallow) then
		if (hallow.DieTime <= CurTime()) then
			owner:TakeSpecialDamage(self.maxHallow, DMG_ACID, owner, self)
			hallow:Remove()
		end
		if (hallow.DieTime-CurTime()>self.maxHallow) then
			self.maxHallow = hallow.DieTime-CurTime()
		end
		print(self.maxHallow)
	end

	if self.DieTime <= CurTime() then
		self:Remove()
	end
end
