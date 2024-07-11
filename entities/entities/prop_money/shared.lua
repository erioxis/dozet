ENT.Type = "anim"

ENT.NoNails = true
util.PrecacheModel("models/props_trainstation/trainstation_clock001.mdl")
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