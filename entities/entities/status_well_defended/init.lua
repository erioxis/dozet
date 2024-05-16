INC_SERVER()

if SERVER then
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
end
local tableofstatus =  {"death","knockdown","flimsy"}
function ENT:OnRemove()
	local st =	self:GetOwner():GiveRandomStatus(math.random(5,35))

	if st and st:IsValid() and st.AddDamage then
		st:AddDamage(math.random(15,50), self.Damager or self.Applier, tableofstatus)
	end
end
function ENT:Think(arguments)
	if self.DieTime <= CurTime() then
		local stack = self:GetDTInt(1)
		if stack > 0 then
			self:OnRemove()
			local rand = math.random(5,15)
			self:SetDie(rand)
			self:SetStartTime(CurTime())
			self:SetDTInt(1,stack-1)
		else
			self:Remove()
		end
	end
end