AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"

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
	if attacker then
		self.Damager = attacker
	end
end

function ENT:SetDamage(damage)
	self.Damage = damage
end
