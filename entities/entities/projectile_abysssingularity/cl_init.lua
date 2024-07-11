INC_CLIENT()
ENT.TrailPositions = nil
local matGlow = Material("effects/blueblackflash")

local matTrail = Material("effects/yellowflare")
local matTrail2 = Material("effects/splashwake3")
local colTrail = Color(70, 25, 255)
local matGlow1 = Material("effects/yellowflare")

function ENT:Initialize()
	self:SetModelScale(0.2, 0)
	self:SetMaterial("models/shadertest/vertexlitselfillummaskenvmaptex")
	self:SetColor(Color(25, 25, 255))
	self:DrawShadow(false)

	self.Trailing = CurTime() + 0.25
	self.TrailPositions = {}
end

function ENT:Draw()
	render.SetMaterial(matTrail)
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i+1] then
			colTrail.a = 255 - 255 * (i/#self.TrailPositions)

			render.DrawBeam(self.TrailPositions[i], self.TrailPositions[i+1], 1, 1, 0, colTrail)
		end
		render.ModelMaterialOverride(matWhite)
		render.SetColorModulation(0.1, 0.4, 1555)
		self:DrawModel()
		render.SetColorModulation(1, 1, 1)
		render.ModelMaterialOverride(nil)

		render.SetMaterial(matTrail2)
		for i=1, #self.TrailPositions do
			if self.TrailPositions[i+1] then
				colTrail.a = 255 - 255 * (i/#self.TrailPositions)

				render.DrawBeam(self.TrailPositions[i], self.TrailPositions[i+1], 1, 1, 0, colTrail)
			end
		end
	end
		local velo = self:GetVelocity()
		local heading = velo:GetNormal() * -1.3
		local pos = self:GetPos() + heading * -10
		for i=1, 8 do
			local dir = (VectorRand() + heading):GetNormal()
			render.DrawBeam(pos, pos + dir * 24, 8, i, 2 + i, Color(9, 12, 255))
		end

		render.SetMaterial(matGlow1)
		render.DrawSprite(pos, 75, 75, Color(255, 250, 255, 255))
end
function ENT:OnRemove()
	local pos = self:GetPos()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)
	local particle
	for i=0, 25 do
		particle = emitter:Add(matGlow, pos)
		local vec_wow = VectorRand() * 575
		if particle then
			particle:SetVelocity(vec_wow * 2)
			particle:SetGravity(-vec_wow * 2)
			particle:SetDieTime(3)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(7, 9))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(-0.8, 0.8))
			particle:SetRollDelta(math.Rand(-3, 3))
			particle:SetColor(45, 55, 30)
		end
	end
	for i=1, 125 do
		particle = emitter:Add("sprites/light_glow02_add", pos)
		if particle then
			particle:SetVelocity(VectorRand():GetNormal() * 550)
			particle:SetDieTime(math.Rand(2.35, 2.7))
			particle:SetStartAlpha(130)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(15, 19))
			particle:SetEndSize(1)
			particle:SetRoll(math.Rand(0, 359))
			particle:SetRollDelta(math.Rand(-3, 3))
			particle:SetAirResistance(250)
			particle:SetCollide(true)
			particle:SetBounce(2)
			particle:SetColor(125, 155, 255)
			particle:SetGravity(Vector(0,0,-400))
		end
	end
	for i=0,25 do
		particle = emitter:Add("particles/smokey", pos)
		local vec_wow = VectorRand() * 55
		if particle then
			particle:SetVelocity(vec_wow * 2)
			particle:SetGravity(-vec_wow * 2)
			particle:SetDieTime(1.9)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(math.Rand(127, 129))
			particle:SetEndSize(0)
			particle:SetRoll(math.Rand(-0.8, 0.8))
			particle:SetRollDelta(math.Rand(-3, 3))
			particle:SetColor(45, 75, 250)
		end
	end
	for i=1, 35 do
		particle = emitter:Add(matGlow, pos)
		if particle then
			particle:SetDieTime(2)
			particle:SetColor(255, 130, 0)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(5)
			particle:SetEndSize(0)
			particle:SetStartLength(1)
			particle:SetEndLength(15)
			particle:SetVelocity(VectorRand():GetNormal() * 200)
		end
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function ENT:Think()
	table.insert(self.TrailPositions, 1, self:GetPos())
	if self.TrailPositions[24] then
		table.remove(self.TrailPositions, 24)
	end

	local dist = 0
	local mypos = self:GetPos()
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i]:DistToSqr(mypos) > dist then
			self:SetRenderBoundsWS(self.TrailPositions[i], mypos, Vector(16, 16, 16))
			dist = self.TrailPositions[i]:DistToSqr(mypos)
		end
	end
end

