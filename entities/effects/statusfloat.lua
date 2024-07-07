EFFECT.LifeTime = 3

local TEXT_ALIGN_CENTER = TEXT_ALIGN_CENTER
local TEXT_ALIGN_BOTTOM = TEXT_ALIGN_BOTTOM
local draw = draw
local cam = cam

local Particles = {}


hook.Add("PostDrawTranslucentRenderables", "DrawFloatingStatus", function()
	if #Particles == 0 then return end
	local done = true
	local curtime = CurTime()

	local ang = EyeAngles()
	ang:RotateAroundAxis(ang:Up(), -90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	if GAMEMODE.DamageNumberThroughWalls then
		cam.IgnoreZ(true)
	end
	local tables = GAMEMODE.Statuses
	for _, particle in pairs(Particles) do
		if particle and curtime < (particle.DieTime or 1) then
			done = false
			local class = particle.Bool
			local tab = tables[string.sub(class,8,#class)]
			if !tab then continue end
			local colors = tab.Color

			cam.Start3D2D(particle:GetPos(), ang, 0.1 * GAMEMODE.DamageNumberScale)
				draw.SimpleText(translate.Get("s_"..tab.Name), "ZS3D2DFont2", 100+math.sin(particle.DieTime-CurTime() * math.pi)*200, 0, Color(colors.r, colors.g, colors.b, math.Clamp(particle.DieTime - curtime, 0, 1) * 220), TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)
			cam.End3D2D()
		end
	end

	if GAMEMODE.DamageNumberThroughWalls then
		cam.IgnoreZ(false)
	end

	if done then
		Particles = {}
	end
end)

local gravity = Vector(0, 0, -500)
function EFFECT:Init(data)
	local rand = VectorRand(-33,22)
	rand.z = math.Clamp(rand.z,5,25)
	local pos = data:GetOrigin() + rand
	local Type = data:GetScale()
	local velscal = 0.32

	local vel = VectorRand()
	vel.z = math.Rand(0.7, 0.98)
	vel:Normalize()

	local emitter = ParticleEmitter(pos)
	local particle = emitter:Add("sprites/glow04_noz", pos)
	particle:SetDieTime(3)
	particle:SetStartAlpha(0)
	particle:SetEndAlpha(0)
	particle:SetStartSize(0)
	particle:SetEndSize(0)
	particle:SetCollide(true)
	particle:SetBounce(0.7)
	particle:SetAirResistance(12)
	particle:SetGravity(gravity * -(velscal ^ 2))
	particle:SetVelocity(Vector(0,0,0) * 4 * vel * velscal)
	
	if GAMEMODE.PushAp then
		particle.Bool = GAMEMODE.PushAp
		GAMEMODE.PushAp = nil
	end

	particle.DieTime = CurTime() + 2 * GAMEMODE.DamageNumberLifetime
	particle.Type = Type

	table.insert(Particles, particle)

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function EFFECT:Think()
	return false
end

function EFFECT:Render()
end
