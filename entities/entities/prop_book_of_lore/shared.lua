ENT.Type = "anim"

ENT.NoNails = true
util.PrecacheModel("models/props_lab/binderblue.mdl")
function ENT:HumanHoldable(pl)
	return false
end
function ENT:SetHP(value)
	self:SetDTInt(10, value)
end
function ENT:GetHP(value)
	return self:GetDTInt(10)
end
function ENT:SetBA(value)
	self:SetDTInt(11, value)
end
function ENT:GetBA(value)
	return self:GetDTInt(11)
end
function ENT:SetTime(value)
	self:SetNWInt("dapizda", value)
end
function ENT:GetTime(value)
	return 	self:GetNWInt("dapizda", 1)
end