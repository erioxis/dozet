AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Radius = 700

if CLIENT then return end

ENT.Classes = table.ToAssoc(
	{"prop_ammo", "prop_invitem", "prop_weapon"}
)
ENT.Force = 30
ENT.ForceDelay = 0.1

function ENT:Think()
	local owner = self:GetOwner()

	if owner:Team() == TEAM_UNDEAD then
		self:Remove()
		return
	end

	local activeweapon = owner:GetActiveWeapon()
	if not activeweapon:IsValid() or not activeweapon.IsMagnet then return end

	local pos = self:GetPos()
	for _, ent in pairs(ents.FindInSphere(pos, self.Radius)) do
		local class = ent:GetClass()
		local ownsitem = not ent.NoPickupsOwner or ent.NoPickupsOwner == owner
		local droppedrecent = not ent.DroppedTime or ent.DroppedTime + 4 < CurTime()

		if ent and ent:IsValid() and self.Classes[class] and WorldVisible(pos, ent:NearestPoint(pos)) and droppedrecent and ownsitem then
			local phys = ent:GetPhysicsObject()
			local pos = owner:KeyDown(IN_ATTACK) and owner:GetEyeTrace().HitPos or pos
			local dir = (pos - ent:NearestPoint(pos)):GetNormalized()
			phys:ApplyForceCenter((phys:GetMass() or 2) * self.Force * dir)
			ent:SetPhysicsAttacker(owner, 4)

			if (ent:GetPos() - self:GetPos()):LengthSqr() <= 5600 and ent.GiveToActivator then
				ent:GiveToActivator(owner)
			end
		end
	end

	self:NextThink(CurTime() + self.ForceDelay)
	return true
end
