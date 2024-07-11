INC_CLIENT()

local matGlow = Material( "sprites/light_glow02_add" )

ENT.SmokeTimer = 0

function ENT:Draw()
	self:DrawModel()
	local pos = self:GetPos()
	local alt = self:GetDTBool(0)


	render.SetMaterial(matGlow)
	render.DrawSprite(pos, 41, 41, Color( 58, 125, 248, 255 ) )
end

function ENT:Initialize()
	local alt = self:GetDTBool(0)

	--self.AmbientSound = CreateSound(self, "Missile.Ignite")
	--self.AmbientSound:PlayEx(alt and 0.1 or 1, alt and 11 or 2)
end

function ENT:Think()
	local pos = self:GetPos()
	local emitter = ParticleEmitter(pos)
	local alt = self:GetDTBool(0)
	emitter:SetNearClip(24, 32)

	if self.SmokeTimer < CurTime() then
		self.SmokeTimer = CurTime() + (alt and 0.3 or 0.009)

		for i = 1, 2 do
			particle = emitter:Add( "effects/splashwake1", pos + VectorRand() * 10 )
			if particle then
				particle:SetDieTime( math.Rand( 0.11, 0.09 ) )
				particle:SetStartAlpha( math.Rand( 230, 190 ) )
				particle:SetEndAlpha( 0 )
				particle:SetStartSize( 12 )
				particle:SetEndSize( math.Rand( 1, 2 ) )
				particle:SetRoll( math.Rand( 0, 359 ) )
				particle:SetRollDelta( math.Rand( -3, 3 ) )
				particle:SetColor( 215, 210, 255 )
			end
		end

		particle = emitter:Add( "sprites/orangeflare1", pos + VectorRand() * 10 )
		if particle then
			particle:SetDieTime( math.Rand( 0.21, 0.29 ) )
			particle:SetStartAlpha( math.Rand( 230, 190 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 12 )
			particle:SetEndSize( math.Rand( 1, 2 ) )
			particle:SetRoll( math.Rand( 0, 359 ) )
			particle:SetRollDelta( math.Rand( -3, 3 ) )
			particle:SetColor( 255, 250, 255 )
		end



		particle = emitter:Add( "sprites/flamelet" .. math.random(4), pos + VectorRand() * 10 )
		if particle then
			particle:SetDieTime( math.Rand( 0.4, 0.6 ) )
			particle:SetStartAlpha( math.Rand( 50, 40 ) )
			particle:SetEndAlpha( 0 )
			particle:SetStartSize( 9 )
			particle:SetEndSize( math.Rand( 4, 5 ) )
			particle:SetRoll( math.Rand( 0, 359 ) )
			particle:SetRollDelta( math.Rand( -3, 3 ) )
			particle:SetColor( 10, 70, 250 )
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)

	local dlight = DynamicLight(self:EntIndex())
	if dlight then
		dlight.Pos = pos
		dlight.r = 175
		dlight.g = 150
		dlight.b = 255
		dlight.Brightness = 2
		dlight.Size = 100
		dlight.Decay = 300
		dlight.DieTime = CurTime() + 2
	end
end

function ENT:OnRemove()
	local pos = self:GetPos()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)
	local particle
	for i=0, 22 do
		particle = emitter:Add(matGlow, pos)
		if particle then
			particle:SetVelocity(VectorRand() * 775)
			particle:SetDieTime(0.15)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(150)
			particle:SetStartSize(math.Rand(32, 39))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(-0.8, 0.8))
			particle:SetRollDelta(math.Rand(-3, 3))
			particle:SetColor( 55, 0, 255 )
		end
	end


	particle = emitter:Add("sprites/flamelet" .. math.random(4), pos)
	if particle then
		particle:SetVelocity(VectorRand() * 5)
		particle:SetDieTime(0.42)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(127, 129))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(-0.8, 0.8))
		particle:SetRollDelta(math.Rand(-3, 3))
		particle:SetColor( 55, 0, 255 )
	end

	for i=0,2 do
		particle = emitter:Add("sprites/scanner_dots1", pos)
		if particle then
			particle:SetVelocity(VectorRand() * 0)
			particle:SetDieTime(0.65)
			particle:SetStartAlpha(15)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(110, 119))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(-1.6, 1.6))
			particle:SetRollDelta(math.Rand(-6, 6))
			particle:SetColor( 55, 0, 255 )
		end
	end

	for i=1, 25 do
		particle = emitter:Add("effects/splash2", pos)
		if particle then
			particle:SetDieTime(0.6)
			particle:SetColor(18, 55, 128)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(5)
			particle:SetEndSize(0)
			particle:SetStartLength(1)
			particle:SetEndLength(20)
			particle:SetVelocity(VectorRand():GetNormal() * 200)
		end
	end
	
	self:EmitSound("ambient/machines/teleport3.wav", 120, 210, 1.5)
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
