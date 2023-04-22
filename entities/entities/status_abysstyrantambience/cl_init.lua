INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_NONE

ENT.NextEmit = 0
ENT.ParticleTimer = 0

function ENT:Initialize()
	self:DrawShadow(false)

	self.AmbientSound = CreateSound(self, "zombies/archangel_loop.wav")
	self.AmbientSound:PlayEx(0.55, 25)
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

function ENT:Think()
	local owner = self:GetOwner()
	if owner:IsValid() then
		local wep = owner:GetActiveWeapon()
		if wep:IsValid() and wep.IsSwinging and wep:IsSwinging() then
			self.AmbientSound:Stop()
		else
			self.AmbientSound:PlayEx(0.55, 25 + math.sin(RealTime()))
		end
	end
end

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
	local wep = owner:GetActiveWeapon()
	if wep.IsGrounding then return end
	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.08

	local pos = owner:GetPos()
	local pos1
	local emitter = ParticleEmitter(self:GetPos())
	emitter:SetNearClip(24, 32)

	for i = 0, 45 do
		pos1 = GetRandomBonePos(owner)
		local even = ( i%2 == 0 )
		local particle = emitter:Add("sprites/light_glow02_add", pos1)
		local vecrand = VectorRand() * 2
		if particle then
			particle:SetDieTime(math.Rand(3.5, 4))
			particle:SetStartSize(math.Rand(2, 5))
			particle:SetEndSize(0)
			particle:SetColor(125,15,even and 255 or 0)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetVelocity(vecrand)
			particle:SetRoll(math.random(0, 360))
			particle:SetRollDelta(math.random(5, -5))
			particle:SetGravity(-vecrand)
		end		
	end


	emitter:Finish() emitter = nil collectgarbage("step", 64)
end