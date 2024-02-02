INC_CLIENT()

ENT.NextEmit = 0

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetCustomCollisionCheck(true)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self.Growth = CurTime() + 3

	self.AmbientSound = CreateSound( self, "music/radio1.mp3" )
	
end

function ENT:Think()
	if IsFirstTimePredicted() then
		local ent = self:GetOwner()
		self:SetModel( ent:GetModel() )
		if self.Growth < CurTime() then
			self:SetModelScale( self:GetModelScale() + .03 )
		end
	end
	self.AmbientSound:PlayEx( 1, 60 )
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

local matGlow = Material("effects/fluttercore_gmod")
local matWhite = Material("effects/strider_bulge_dudv")
function ENT:Draw()
	render.ModelMaterialOverride(matWhite)
	render.SetBlend(1)
	render.SuppressEngineLighting(true)
	self:DrawModel()
	render.SuppressEngineLighting(false)
	render.ModelMaterialOverride(nil)

	local pos = self:GetPos()

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.005

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(12, 16)

	local base_ang = (self:GetVelocity() * -1):Angle()
	local ang = Angle()
	for i=1, 2 do
		ang:Set(base_ang)
		ang:RotateAroundAxis(ang:Right(), math.Rand(-30, 30))
		ang:RotateAroundAxis(ang:Up(), math.Rand(-30, 30))

		local particle = emitter:Add( matGlow, pos + VectorRand() * 15 )
		if particle then
			particle:SetDieTime(1)
			particle:SetVelocity(ang:Forward() * math.Rand(2, 14) + VectorRand():GetNormal() * 95)
			particle:SetColor(95, 95, 95)
			particle:SetAirResistance(24)
			particle:SetStartAlpha(120)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(12, 24))
			particle:SetEndSize(0)
			particle:SetGravity(Vector(0, 0, 20))
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-9, 9))
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
