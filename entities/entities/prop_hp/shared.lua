ENT.Type = "anim"

ENT.NoNails = true

function ENT:HumanHoldable(pl)
	return false
end
function ENT:SetHP(value)
	self:SetDTInt(10, value)
end
function ENT:GetHP(value)
	return self:GetDTInt(10)
end
function ENT:SetTime(value)
	self:SetNWInt("dapizda", value)
end
function ENT:GetTime(value)
	return 	self:GetNWInt("dapizda", 1)
end