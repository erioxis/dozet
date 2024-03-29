ENT.Type = "anim"
ENT.Base = "status__base"
ENT.Damager = nil
ENT.Ephemeral = true

function ENT:Initialize()
	self:DrawShadow(false)
	if self:GetDTFloat(1) == 0 then
		self:SetDTFloat(1, CurTime())
	end
	
	hook.Add("Move", self, self.Move)

end

function ENT:AddDamage(damage, attacker)
	local owner = self:GetOwner()
	if damage > 0 and owner:IsValid() and owner.BleedDamageTakenMul then
		damage = damage * owner.BleedDamageTakenMul
	end

	self:SetDamage(self:GetDamage() + damage)
	if attacker then
		self.Damager = attacker
	end
end

function ENT:SetDamage(damage)
	self:SetDTFloat(0, math.min(GAMEMODE.MaxBleedDamage or 1000, damage))
end
function ENT:Move(pl, move)
	if pl == self:GetOwner() and self:GetOwner():GetStatus("redmarrow") then 

		local speedffect = 220

		move:SetMaxSpeed(move:GetMaxSpeed() + speedffect)
		move:SetMaxClientSpeed(move:GetMaxClientSpeed() + speedffect)
	end
end

function ENT:GetDamage()
	return self:GetDTFloat(0)
end
