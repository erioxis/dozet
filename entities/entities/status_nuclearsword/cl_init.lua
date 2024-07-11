INC_CLIENT()

ENT.NextEmit = 0

local matTrail = Material("sprites/tp_beam001")
local matGlow = Material("sprites/light_glow02_add")
local vector_origin = vector_origin

local function GetRandomBonePos(pl)
	if pl ~= MySelf or pl:ShouldDrawLocalPlayer() then
		local bone = pl:GetBoneMatrix(math.random(0,25))
		if bone then
			return bone:GetTranslation()
		end
	end

	return pl:GetShootPos()
end

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	local col = Color(25,255,15)

		if self:GetOwner():GetVelocity():LengthSqr() > 100 then
		render.SetMaterial(matGlow)
		render.DrawSprite(self:GetOwner():GetPos() + Vector(0,0,47), 0, 0, col)
	end
	render.SetMaterial(matTrail)
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i+1] then
			col.a = 255 - 255 * (i/#self.TrailPositions)
			col = Color(225 - 255 * (i/#self.TrailPositions) ,25 + 255 * (i/#self.TrailPositions) ,15)

			render.DrawBeam(self.TrailPositions[i], self.TrailPositions[i+1], 15, 0.5, 0, col)
		end
	end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.001

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	local pos, aa, bb
	for i = 0, 24 do
		if owner == MySelf and not owner:ShouldDrawLocalPlayer() then
			aa, bb = owner:WorldSpaceAABB()
			pos = Vector(math.Rand(aa.x, bb.x), math.Rand(aa.y, bb.y), math.Rand(aa.z, bb.z))
		else
			pos = GetRandomBonePos(owner)
		end
		
		local particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 3)
		if particle then
			particle:SetDieTime(math.Rand(1.75, 2))
			particle:SetStartSize(4)
			particle:SetEndSize(0)
			particle:SetColor(150,255,150)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetRoll(math.random(0, 360))
			particle:SetRollDelta(math.random(5, -5))
			end
		end

	for i = 1, 15 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
		if particle then
			particle:SetDieTime(1.6)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(0)
			particle:SetStartSize(25)
			particle:SetEndSize(0)
			particle:SetGravity(Vector(0, 0, 75))
			particle:SetAirResistance(300)
			particle:SetColor(10, 250, 10)
		end
	end

	particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
	if particle then
		particle:SetDieTime(1.6)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)
		particle:SetStartSize(5)
		particle:SetEndSize(0)
		particle:SetGravity(Vector(0, 0, 275))
		particle:SetAirResistance(300)
		particle:SetColor(120, 255, 120)
	end

	for i = 1, 12 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
		if particle then
			particle:SetDieTime(2)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(0)
			particle:SetStartSize(5)
			particle:SetEndSize(0)
			particle:SetGravity(Vector(0, 0, -15))
			particle:SetAirResistance(300)
			particle:SetColor(50, 255, 50)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function ENT:Initialize()
	self.Trailing = CurTime() + 0.1
	self.TrailPositions = {}
end

function ENT:Think()
	table.insert(self.TrailPositions, 1, self:GetOwner():GetPos() + Vector(0,0,42) )
	if self.TrailPositions[45] then
		table.remove(self.TrailPositions, 45)
	end

	local dist = 0
	local mypos = self:GetOwner():GetPos() + Vector(0,0,42)
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i]:DistToSqr(mypos) > dist then
			self:GetOwner():SetRenderBoundsWS(self.TrailPositions[i], mypos, Vector(16, 16, 16))
			dist = self.TrailPositions[i]:DistToSqr(mypos)
		end
	end
end
