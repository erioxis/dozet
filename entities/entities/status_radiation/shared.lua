AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"
ENT.Damager = nil
ENT.Ephemeral = true

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self.BaseClass.Initialize(self)
end

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
function ENT:AddDamage(damage, attacker)
	local owner = self:GetOwner()
	self:SetDamage(self:GetDamage() + damage)
	if attacker then
		self.Damager = attacker
	end
end