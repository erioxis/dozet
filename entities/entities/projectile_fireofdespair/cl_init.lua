INC_CLIENT()

ENT.NextEmit = 0

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetCustomCollisionCheck(true)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)

	self.AmbientSound = CreateSound(self, "ambient/explosions/citadel_end_explosion1.wav")
end

function ENT:Think()
	self.AmbientSound:PlayEx( 1, math.random( 40, 70 ) )
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

local matGlow = Material("particle/smokestack")
local matWhite = Material("effects/strider_bulge_dx60")
function ENT:Draw()
	render.ModelMaterialOverride(matWhite)
	render.SetColorModulation(120, 27 * math.random(), 0)
	render.SuppressEngineLighting(true)
	self:DrawModel()
	render.SuppressEngineLighting(false)
	render.ModelMaterialOverride(nil)

	local pos = self:GetPos()

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(12, 16)

	local base_ang = (self:GetVelocity() * -1):Angle()
	local ang = Angle()

	for i=1, 4 do
		ang:Set(base_ang)
		ang:RotateAroundAxis(ang:Right(), math.Rand(-30, 30))
		ang:RotateAroundAxis(ang:Up(), math.Rand(-30, 30))

		local particle = emitter:Add("effects/muzzleflash" .. math.random( 1, 4 ), pos + VectorRand() * 7 )
		if particle then
			particle:SetDieTime(.7)
			particle:SetVelocity(ang:Forward() * math.Rand(2, 4) + VectorRand():GetNormal() * 75)
			particle:SetGravity( Vector( 0, 0, math.random( 50, 100 ) ) )
			particle:SetColor(255, math.Rand( 150, 195 ), 25)
			particle:SetAirResistance(250)
			particle:SetStartAlpha(115)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(7, 9))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-1, 1))
		end
	end

	particle = emitter:Add( "sprites/flamelet" .. math.random( 1, 5 ), pos + VectorRand() * 4 )
	if particle then
		particle:SetDieTime(.7)
		particle:SetVelocity(ang:Forward() * math.Rand(2, 4) + VectorRand():GetNormal() * 75)
		particle:SetGravity( Vector( 0, 0, math.random( 50, 100 ) ) )
		particle:SetColor(155, math.Rand( 100, 155 ), 0)
		particle:SetAirResistance(250)
		particle:SetStartAlpha(15)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(7, 9))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-1, 1))
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
