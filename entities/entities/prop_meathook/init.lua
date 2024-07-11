INC_SERVER()

ENT.NextDamage = 0
ENT.TicksLeft = 10

function ENT:Initialize()
	self:SetModel("models/props_junk/meathook001a.mdl")
	self:SetSolid(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:AddEFlags(EFL_SETTING_UP_BONES)
end

function ENT:Drop()

		local owner = self:GetOwner()
		if owner:IsValidHuman() then
			owner:Give(self.BaseWeapon)
		end

	self:Remove()
end

function ENT:Think()
	local parent = self:GetParent()
	if parent:IsValid() and parent:IsPlayer() then
		if parent:Alive() and parent:Team() == TEAM_UNDEAD and self.TicksLeft >= 1 and not parent.SpawnProtection then
			if CurTime() >= self.NextDamage then
				local owner = self:GetOwner()

				self.NextDamage = CurTime() + 0.35
				self.TicksLeft = self.TicksLeft - 1

				if self.Weaken then
					local status = parent:GiveStatus("zombiestrdebuff", nil, owner)
					status.DieTime = CurTime() + 0.45
				end

				util.Blood((parent:NearestPoint(self:GetPos()) + parent:WorldSpaceCenter()) / 2, math.random(4, 9), Vector(0, 0, 1), 100)
				parent:TakeSpecialDamage(self.BleedPerTick, DMG_SLASH, owner, self)
			end
		else
			self:Drop()
		end
	else
		self:Remove()
	end
end
