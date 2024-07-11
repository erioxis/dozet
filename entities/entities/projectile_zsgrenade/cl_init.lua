INC_CLIENT()

ENT.NextTickSound = 0
ENT.LastTickSound = 0
ENT.NextEmit = 0
local matTrail = Material("trails/physbeam")
local colTrail = Color(255, 20, 20)
local vector_origin = vector_origin
function ENT:Initialize()
	self.DieTime = CurTime() + self.LifeTime
	self.Trailing = CurTime() + 0.15
	self.TrailPositions = {}
	self.CreateTime = CurTime()
end

function ENT:Think()
	local curtime = CurTime()

	if curtime >= self.NextEmit then
		self.NextEmit = curtime + 0.05

		local pos = self:GetPos() + self:GetUp() * 8
		local emitter = ParticleEmitter(pos)
		emitter:SetNearClip(16, 24)

		local particle = emitter:Add("particles/smokey", pos)
		particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(2, 14))
		particle:SetDieTime(math.Rand(0.6, 0.74))
		particle:SetStartAlpha(math.Rand(200, 220))
		particle:SetEndAlpha(0)
		particle:SetStartSize(1)
		particle:SetEndSize(math.Rand(8, 10))
		particle:SetRoll(math.Rand(-0.2, 0.2))
		particle:SetColor(50, 50, 50)

		emitter:Finish() emitter = nil collectgarbage("step", 64)
	end

	if curtime >= self.NextTickSound then
		local delta = self.DieTime - curtime

		self.NextTickSound = curtime + math.max(0.2, delta * 0.25)
		self.LastTickSound = curtime
		self:EmitSound("weapons/grenade/tick1.wav", 75, math.Clamp((1 - delta / self.LifeTime) * 160, 100, 160))
	end
	
	table.insert(self.TrailPositions, 1, self:GetPos())
	if self.TrailPositions[255] then
		table.remove(self.TrailPositions, 255)
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

local matGlow = Material("sprites/glow04_noz")
function ENT:Draw()
	self:DrawModel()

	if math.abs(self.LastTickSound - CurTime()) < 0.1 then
		local pos = self:GetPos() + self:GetUp() * 8

		render.SetMaterial(matGlow)
		render.DrawSprite(pos, 16, 16, COLOR_RED)

		local dlight = DynamicLight(self:EntIndex())
		if dlight then
			dlight.Pos = pos
			dlight.r = 255
			dlight.g = 0
			dlight.b = 0
			dlight.Brightness = 0.75
			dlight.Size = 64
			dlight.Decay = 256
			dlight.DieTime = CurTime() + 0.1
		end
	end
	if MySelf ~= self:GetOwner() then return end
	render.SetMaterial(matTrail)
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i+1] then
			colTrail.a = 255 - 255 * (i/#self.TrailPositions)

			render.DrawBeam(self.TrailPositions[i], self.TrailPositions[i+1], 32, 8, 0, colTrail)
		end
	end
end
