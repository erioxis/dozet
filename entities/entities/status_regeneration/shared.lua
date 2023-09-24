
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
function ENT:SetDamage(damage)
	local own = self:GetOwner()
	self:SetDTFloat(0, math.min(own:IsValidLivingPlayer() and own:GetMaxHealth()/2 or 100, damage))
end

function ENT:GetDamage()
	return self:GetDTFloat(0)
end