INC_CLIENT()

ENT.NextEmit = 0

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:Initialize()
	self:DrawShadow(false)
end
local matGlow = Material("sprites/light_glow02_add")
local matWhite = Material("models/debug/debugwhite")
function ENT:Draw()
	render.ModelMaterialOverride(matWhite)
	render.SetColorModulation(0,0,0)
	render.SuppressEngineLighting(true)
	self:DrawModel()
	render.SuppressEngineLighting(false)
	render.ModelMaterialOverride(nil)
	if MySelf:KeyDown(IN_SPEED) then return end

	local pos = self:GetPos()

	render.SetMaterial(matGlow)
	render.DrawSprite(pos, 64, 64)

	if CurTime() < self.NextEmit then return end
	local where = self:GetDTVector(22)
	self.NextEmit = CurTime() + 0.11

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(12, 16)

	local base_ang = (where):Angle()
	local ang = Angle()
	for i=1, 12 do

		ang:Set(base_ang)
		ang:RotateAroundAxis(ang:Right(), math.Rand(-10, 10))
		ang:RotateAroundAxis(ang:Up(), math.Rand(-10, 10))

		local particle = emitter:Add("sprites/glow04_noz", pos)
		particle:SetDieTime(2)
		if i%6 ~= 0 then
			particle:SetColor(32*(i%5),20*i,255/(i%3),255)
		end
		particle:SetVelocity(ang:Forward() * math.Rand(100, 120))
		particle:SetAirResistance(100)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(math.Rand(2, 4))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-3, 122))
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
