AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.AutomaticFrameAdvance = true


function ENT:Initialize()
	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(1)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0)
	self:SetColor(Color(250, 250, 250, 255))

	if self:GetDTBool(0) then
		self:SetModelScale(0.7, 0)
	end

	self:SetupGenericProjectile(false)
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode()
	end

	if self.Exploded then
		local pos = self:GetPos()
		local alt = self:GetDTBool(0)

		if not alt then
			local effectdata = EffectData()
				effectdata:SetOrigin(pos)

			--util.Effect("Explosion", effectdata)
			--util.Effect("explosion_rocket", effectdata)

		else
			self:EmitSound(")weapons/explode5.wav", 10, 10)
		end

		self:Remove()
	end
end

function ENT:Explode()
	if self.Exploded then return end
	self.Exploded = true

	local owner = self:GetOwner()
	if owner:IsValidHuman() then
		local source = self:ProjectileDamageSource()
		local target = self.PhysicsData.HitEntity
		local pos = self:GetPos()
		for k, v in ipairs( ents.FindInBoxRadius( self:GetPos(), 215 ) ) do
			if v:IsValid() and v:IsValidLivingZombie() then
				if math.random() < 0.6 then
					v:GiveStatus( "frost", 2, owner )
					v:AddLegDamageExt( 3, owner, self, SLOWTYPE_COLD )
				end
			end
		end

		util.BlastDamagePlayer( source, owner, pos, 95, self.ProjDamage*1.5, DMG_DROWN, self.ProjTaper )
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
