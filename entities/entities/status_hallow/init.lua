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
	owner:TakeSpecialDamage(1, DMG_ACID, owner, self)
	if (hallow) then
		if (hallow.DieTime >= CurTime() + 100 * (owner.CurseMultiplier or 1)) then
			owner:TakeSpecialDamage(maxHallow, DMG_ACID, owner, self)
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
