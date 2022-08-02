INC_SERVER()

local vector_origin = vector_origin

function ENT:Initialize()
	self:SetModel("models/props_trainstation/trainstation_clock001.mdl")
	self:PhysicsInitSphere(13)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:SetupGenericProjectile(false)
	self:SetColor(Color(252,217,61, 120))
	self:SetAlpha(60)


	self.DieTime = CurTime() + 4
	self.LastPhysicsUpdate = UnPredictedCurTime()
end
function ENT:OnRicoShot() 
	self:EmitSound("weapons/physcannon/physcannon_pickup.wav")
	return ent == self and true or ent ~= self and false
end
function ENT:DoRicochet(dmg, ent)
	owner = self:GetOwner()
	util.SpriteTrail( self, 0, Color( 144,61,252), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
	if ent == self then return ent end
	ent.DamageMul = ent.DamageMul * 4
	ent.DieTime = CurTime() + 12
end
function ENT:DoRicoShot(ent, pos, melee, dmginfo)
	local owner = self:GetOwner()
	if ent and ent:IsValid() and ent:IsPlayer() and ent:IsValidLivingZombie() or ent.AllowSelfRicoShot then
		if not ent.AllowSelfRicoShot then
			ent:TakeDamage((dmginfo * 4) * self.DamageMul, owner, owner:GetActiveWeapon())
			if (not melee) then
				timer.Simple(0.95, function() if self:IsValid() then self:Remove() end end)
				
				util.SpriteTrail( self, 0, Color( 252,217,61 ), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
				timer.Simple(0.05, function() self:SetPos(pos) end)
			elseif melee then
				self:SetPos(pos)
				self.DieTime = CurTime() + 5
				self.DamageMul = self.DamageMul * 2
				util.SpriteTrail( self, 0, Color( 252,217,61 ), false, 15, 1, 4, 1 / ( 15 + 1 ) * 0.5, "trails/plasma" )
			end
		else
			ent:DoRicochet((dmginfo * 4) * self.DamageMul, ent)
		end
	end
	self:OnRicoShot()
end


function ENT:Think()
	if self.Exploded then
		self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	elseif self.DieTime < CurTime() then
		self:Remove()
	end

end
function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end
local owner = self:GetOwner()
	local attacker = dmginfo:GetAttacker()
	local pos = self:GetPos()
	local dmginfotrue = dmginfo:GetDamage()

	if attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
		for _, ent in pairs(ents.FindInSphere(pos, 928)) do
			if not attacker:GetActiveWeapon().IsMelee then
				self:DoRicoShot(ent, ent:GetPos(), nil, dmginfotrue)
			else
				self:DoRicoShot(ent, ent:GetPos(), true, dmginfotrue)
			end
		end
	end
end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self:GetPos())
	util.Effect("explosion_bonemesh", effectdata)
end
