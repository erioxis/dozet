INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
local matBeam = Material("Effects/laser1", "smooth")
function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetRenderBounds(Vector(-128, -128, -128), Vector(128, 128, 200))

	self:SetModelScaleVector(Vector(1, 1, 1) * self.ModelScale)

	self.AmbientSound = CreateSound(self, "ambient/atmosphere/tunnel1.wav")
end

function ENT:Think()
	if EyePos():DistToSqr(self:GetPos()) <= 4900000 then -- 700^2
		self.AmbientSound:PlayEx(0.33, 75)
	else
		self.AmbientSound:Stop()
	end
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

ENT.NextEmit = 0
ENT.Rotation = math.random(360)

local matWhite = Material("models/debug/debugwhite")
local matGlow = Material("sprites/light_glow02_add")

local cDrawWhite = Color(78, 46, 223)
local cDraw = Color(138, 231, 125)

local math_sin = math.sin
local math_cos = math.cos
local math_abs = math.abs
local cam_Start3D = cam.Start3D
local cam_End3D = cam.End3D
local render_SetBlend = render.SetBlend
local render_ModelMaterialOverride = render.ModelMaterialOverride
local render_SetColorModulation = render.SetColorModulation
local render_SuppressEngineLighting = render.SuppressEngineLighting
local render_DrawQuadEasy = render.DrawQuadEasy
local render_DrawSprite = render.DrawSprite

function ENT:DrawTranslucent()
	self:RemoveAllDecals()

	local scale = self.ModelScale

	local curtime = CurTime()
	local sat = math_abs(math_sin(curtime))
	local colsat = sat * 0.125
	local eyepos = EyePos()
	local eyeangles = EyeAngles()
	local forwardoffset = 16 * scale * self:GetForward()
	local rightoffset = 16 * scale * self:GetRight()
	local radius = (180 + math_cos(sat) * 40) * scale
	local whiteradius = (122 + math_sin(sat) * 32) * scale
	local up = self:GetUp()
	local spritepos = self:GetPos() + up
	local spritepos2 = self:WorldSpaceCenter()
	local ColorD = HSVToColor(CurTime()*90 % 360, 0.7, 0.7)

	ColorD.r = ColorD.r/270 
	ColorD.g = ColorD.g/270 
	ColorD.b = ColorD.b/270 
	render_SuppressEngineLighting(true)
	render_SetColorModulation(ColorD.r ^ 0.5, ColorD.g ^ 0.5, ColorD.b ^ 0.2)

	self:SetModelScaleVector(Vector(1, 1, 1) * scale)

	self:DrawModel()

	render_SetColorModulation(ColorD.r, ColorD.g, ColorD.b)

	render_ModelMaterialOverride(matWhite)
	render_SetBlend(0.7)

	self:DrawModel()

	render_SetColorModulation(ColorD.r, ColorD.g, ColorD.b)

	self:SetModelScaleVector(Vector(0.1, 0.1, 0.9) * scale)
	render_SetBlend(0.2)
	cam_Start3D(eyepos + forwardoffset + rightoffset, eyeangles)
	self:DrawModel()
	cam_End3D()
	cam_Start3D(eyepos + forwardoffset - rightoffset, eyeangles)
	self:DrawModel()
	cam_End3D()
	cam_Start3D(eyepos - forwardoffset + rightoffset, eyeangles)
	self:DrawModel()
	cam_End3D()
	cam_Start3D(eyepos - forwardoffset - rightoffset, eyeangles)
	self:DrawModel()
	cam_End3D()
	self:SetModelScaleVector(Vector(1, 1, 1) * scale)

	render_SetBlend(0.8)
	render_ModelMaterialOverride()
	render_SuppressEngineLighting(false)
	render_SetColorModulation(1, 1, 1)

	self.Rotation = self.Rotation + FrameTime() * 5
	if self.Rotation >= 360 then
		self.Rotation = self.Rotation - 360
	end

	cDraw.r = ColorD.r * 255
	cDraw.g = ColorD.g * 255
	cDraw.b = ColorD.b * 255
	cDrawWhite.r = 255
	cDrawWhite.g = cDrawWhite.r
	cDrawWhite.b = cDrawWhite.r

	render.SetMaterial(matGlow)
	if not corrupt then
		render_DrawQuadEasy(spritepos, up, whiteradius, whiteradius, cDrawWhite, self.Rotation)
		render_DrawQuadEasy(spritepos, up * -1, whiteradius, whiteradius, cDrawWhite, self.Rotation)
	end
	render_DrawQuadEasy(spritepos, up, radius, radius, cDraw, self.Rotation)
	render_DrawQuadEasy(spritepos, up * -1, radius, radius, cDraw, self.Rotation)
	render_DrawSprite(spritepos2, radius, radius * 2, cDraw)

	if curtime < self.NextEmit then return end
	self.NextEmit = curtime + 0.05

	local offset = VectorRand()
	offset.z = 0
	offset:Normalize()
	offset = math.Rand(-32, 32) * scale * offset
	offset.z = 1
	local pos = self:LocalToWorld(offset)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(24, 32)

	local particle = emitter:Add("sprites/glow04_noz", pos)
	particle:SetDieTime(math.Rand(1.5, 4))
	particle:SetVelocity(Vector(0, 0, math.Rand(32, 64) * scale))
	particle:SetStartAlpha(0)
	particle:SetEndAlpha(255)
	particle:SetStartSize(math.Rand(2, 4) * 1 * scale)
	particle:SetEndSize(0)
	particle:SetRoll(math.Rand(0, 360))
	particle:SetRollDelta(math.Rand(-1, 1))
	particle:SetColor(ColorD.r * 255, ColorD.g * 255, ColorD.b * 255)
	particle:SetCollide(true)

	emitter:Finish() emitter = nil collectgarbage("step", 64)
	
end
