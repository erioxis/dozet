INC_CLIENT()

ENT.Sound1 = Sound("ambient/levels/labs/teleport_preblast_suckin1.wav")
ENT.Sound2 = Sound("ambient/levels/labs/teleport_mechanism_windup3.wav")
ENT.ParticleMaterial = "sprites/glow04_noz"
local w, h = 320, 256
local x, y = -w / 2, -h / 2
local rt = GetRenderTarget("prop_obj_sigil", w * 2, h * 2)
local matRT = Material("prop_obj_sigil")
local CamPos = Vector(6, -2, 0)
local LightPos = Vector(7.4, 8, 3)
local LightPos2 = Vector(7.4, 8, 1)
local CamAng = Angle(0, 90, 90)
local CamScale = 0.05

local matGlow = Material("sprites/glow04_noz")
function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 80))

	local owner = self:GetOwner()

	self.TeleportingSound = CreateSound(self, self.Sound1)
	self.TeleportingSound2 = CreateSound(self, self.Sound2)
	if owner:IsValid() and owner == MySelf then
		self.TeleportingSound:PlayEx(1, 100 / (owner.SigilTeleportTimeMul or 1))
		self.TeleportingSound2:PlayEx(0.22, 245)
	end

	if self:GetStartTime() == 0 then
		self:SetStartTime(CurTime())
	end
	hook.Add("ShouldDrawLocalPlayer", self, self.ShouldDrawLocalPlayer)
	hook.Add("CalcView", self, self.CalcView)
	owner.SigilTeleport = self
end

function ENT:OnRemove()
	self.TeleportingSound:Stop()
	self.TeleportingSound2:Stop()
end

function ENT:Think()

	local owner = self:GetOwner()
	if owner ~= LocalPlayer() then return end

	local sigil = self:GetTargetSigil()
	if not sigil or not sigil:IsValid() then return end

	local ownerpos = owner:GetPos()
	local sigilpos = sigil:GetPos()
	local dir = sigilpos - ownerpos
	dir:Normalize()

	local aa, bb = owner:WorldSpaceAABB()
	local startpos = Vector(math.Rand(aa.x, bb.x), math.Rand(aa.y, bb.y), math.Rand(aa.z, bb.z))

	local emitter = ParticleEmitter(startpos)
	emitter:SetNearClip(24, 32)

	local particle = emitter:Add(self.ParticleMaterial, startpos)
	particle:SetDieTime(math.Rand(1.5, 4))
	particle:SetVelocity(dir * math.min(1400, ownerpos:Distance(sigilpos)))
	particle:SetStartAlpha(100)
	particle:SetEndAlpha(255)
	particle:SetStartSize(math.Rand(1, 2))
	particle:SetEndSize(0)
	particle:SetRoll(math.Rand(0, 360))
	particle:SetRollDelta(math.Rand(-2, 2))
	if math.random(4) ~= 1 then
		self:SetParticleColor(particle)
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)

	self:NextThink(CurTime() + 0.05)
	return true
end

function ENT:SetParticleColor(particle)
	particle:SetColor(38, 102, 255)
end
local CamData = {x = 0, y = 0, w = h * 2, h = h * 2, drawhud = false, drawmonitors = false, drawviewmodel = false, aspectratio = w / h}
--[[function ENT:Draw()
	--if !MySelf:KeyDown(IN_DUCK) then return end
	local camera = self:GetTargetSigil()
	if not camera:IsValid() then return end


	local camangs = camera:GetAngles()
	camangs:RotateAroundAxis(camera:GetRight(), 90)
	camangs:RotateAroundAxis(camera:GetUp(), -180)
	camangs:RotateAroundAxis(camera:GetForward(), 180)
	local owner = self:GetOwner()
	CamData.origin = camera:GetPos()
	CamData.angles = camangs --self:GetTargetSigil():GetAngles()
	local originalRT = render.GetRenderTarget()
	render.SetRenderTarget(rt)
	render.RenderView(CamData)
	--render.DrawTextureToScreen(render.GetRenderTarget())
	render.SetRenderTarget(originalRT)
	
end]]
--[[function ENT:Draw()
	if !MySelf:KeyDown(IN_DUCK) then return end
	local dist = EyePos():DistToSqr(self:GetPos())
	if dist < 9000 then
		local bpos, bang = self:LocalToWorld(CamPos), self:LocalToWorldAngles(CamAng)

		cam.Start3D2D(bpos, bang, CamScale)
		cam.IgnoreZ(true)
		surface.SetDrawColor(255, 255, 255, 255)

		local camera =  self:GetTargetSigil()
		if camera:IsValid() then
			matRT:SetTexture("$basetexture", rt)
			render.DrawTextureToScreen( rt )
		end

		cam.End3D2D()
	end

	render.SetMaterial(matGlow)
	render.DrawSprite(self:LocalToWorld(LightPos), 3, 3, COLOR_DARKBLUE)
	render.DrawSprite(self:LocalToWorld(LightPos2), 2, 2, COLOR_HURT)
end]]
function ENT:ShouldDrawLocalPlayer(pl)
	if self:GetOwner() ~= LocalPlayer() then return end
	if !self:GetOwner():KeyDown(IN_DUCK) then return end
	return true
end
local ViewHullMins = Vector(-4, -4, -4)
local ViewHullMaxs = Vector(4, 4, 4)
function ENT:CalcView(pl, origin, angles, fov, znear, zfar)
	if self:GetOwner() ~= pl then return end

	if !self:GetOwner():KeyDown(IN_DUCK) then return end

	local filter = player.GetAll()
	filter[#filter + 1] = self
	local tr = util.TraceHull({start = self:GetTargetSigil():GetPos() + Vector(0,0,64), endpos = self:GetTargetSigil():GetPos(), mask = MASK_SHOT, filter = filter, mins = ViewHullMins, maxs = ViewHullMaxs})

	return {origin = tr.HitPos + tr.HitNormal * 3}
end
