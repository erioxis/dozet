INC_SERVER()

function ENT:Initialize()
	self.Touched = {}
	self.Damaged = {}

	self:SetModel("models/Items/CrossbowRounds.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetTrigger(true)
	self.LastPhysicsUpdate = UnPredictedCurTime()
	self:SetupGenericProjectile(true)
	self.PostOwner = self:GetOwner()
end
ENT.InnateDamageType = INNATE_TYPE_BOUNTY
ENT.InnateDamageMul = 0.15


local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	local dt = UnPredictedCurTime() - self.LastPhysicsUpdate
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -220
	phys:AddVelocity(vecDown)
end

function ENT:OnRemove()
	if not self.Exploded and not self.PickedUp then
		self:Explode()
	end
end

function ENT:Think()
	if self.Stuck and (not self.Stuck:IsValid() or self.Stuck:IsPlayer() and not self.Stuck:IsValidLivingZombie()) then
		self:Explode()
	end
	if self.Exploded and not self.PickedUp then
		self:Remove()
	end
	if self.PhysicsData then
		self:Hit(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity, self.PhysicsData.OurOldVelocity)
	end

	self:NextThink(CurTime())
	return true
end

function ENT:Hit(vHitPos, vHitNormal, eHitEntity, vOldVelocity)
	self:Explode()
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true

	local type = self:GetDTInt(5)
	self:EmitSound(
		type == 0 and "npc/barnacle/barnacle_gulp2.wav" or
		type == 1 and "ambient/fire/mtov_flame2.wav" or
		"nox/scatterfrost.ogg",
		70, type == 2 and 230 or 120, 0.75, CHAN_WEAPON + 20
	)
	self:EmitSound("vehicles/airboat/pontoon_impact_hard1.wav", 65, 250, 0.5, CHAN_WEAPON + 21)

	local owner = self.PostOwner:IsValid() and self.PostOwner or self:GetOwner()

	if owner:IsValidLivingHuman() then
		local source = self:ProjectileDamageSource()
		local pos = self:GetPos()
		local radius = 66

		local function InflictInRadius(func)
			for _, ent in pairs(util.BlastAlloc(source, owner, pos, radius * (owner.ExpDamageRadiusMul or 1))) do
				if ent:IsValidLivingPlayer() and gamemode.Call("PlayerShouldTakeDamage", ent, owner) then
					func(ent)
				end
			end
		end

		if type ~= 2 and math.random(type == 0 and 9 or 12) == 1 then
			InflictInRadius(function(ent)
				if type == 0 then
					ent.Corrosion = CurTime()
				elseif type == 1 then
					ent:Ignite(5)
					for __, fire in ipairs(ents.FindByClass("entityflame")) do
						if fire:IsValid() and fire:GetParent() == ent then
							fire:SetOwner(owner)
							fire:SetPhysicsAttacker(owner)
							fire.AttackerForward = owner
						end
					end
				end
			end)
		elseif type == 2 then
			POINTSMULTIPLIER = 1.25

			InflictInRadius(function(ent)
				ent:AddLegDamageExt(4, owner, source, SLOWTYPE_COLD)
			end)
		end

		util.BlastDamagePlayer(source, owner, pos, radius, self.ProjDamage or 25, DMG_ALWAYSGIB, 0.4)

		if type == 2 then
			POINTSMULTIPLIER = nil
		end
	end
end

function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
