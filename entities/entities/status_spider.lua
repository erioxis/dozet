AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"


function ENT:Think()
	local owner = self:GetOwner()

	if owner:Team() == TEAM_UNDEAD and SERVER then
		self:Remove()
		return
	end

	local activeweapon = owner:GetActiveWeapon()
	owner.SpiderMechanism = activeweapon:IsValid() and activeweapon.IsSpider
	self:NextThink(CurTime() + 1)
	return true
end
