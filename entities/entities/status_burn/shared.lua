
AddCSLuaFile()
ENT.Type = "anim"
ENT.Base = "status__base"


ENT.Ephemeral = true
AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self:DrawShadow(false)
	if self:GetDTFloat(1) == 0 then
		self:SetDTFloat(1, CurTime())
	end
end



function ENT:AddDamage(damage)
	self:SetDamage(self:GetDamage() + damage)
end

function ENT:SetDamage(damage)
	self:SetDTFloat(0, math.min(50, damage))
end

function ENT:GetDamage()
	return self:GetDTFloat(0)
end
function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end