
ENT.Type = "anim"
ENT.Base = "status__base"
ENT.Ephemeral = true



function ENT:AddDamage(damage)
	self:SetDamage(self:GetDamage() + damage)
end
function ENT:Initialize()
	self:DrawShadow(false)
	if self:GetDTFloat(1) == 0 then
		self:SetDTFloat(1, CurTime())
	end
end
function ENT:GetMaxStacks(pl)
	if pl:HasTrinket("jacobsoul") or !pl or !IsValid(pl) then
		return 99999
	end
	return pl:GetMaxHealth()/2 
end
function ENT:SetDamage(damage)
	self:SetDTFloat(0, math.min(self:GetMaxStacks(self:GetOwner()), damage))
end

function ENT:GetDamage()
	return self:GetDTFloat(0)
end