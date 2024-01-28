INC_CLIENT()
ENT.NextEmit = 0
local function getrandombonepos( pl, i )
	local bone = pl:GetBoneMatrix( i )

	return bone and bone:GetTranslation() or pl:GetShootPos()
end

function ENT:OnRemove()
	self.AmbientSound:Stop()
end

function ENT:Think()
	local owner = self:GetOwner()
	if owner:IsValid() then
		self.AmbientSound:PlayEx( 1, 245 + math.sin( RealTime() * 10 ) * 10 )
	end
end

function ENT:Draw()
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist or owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.1

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)

	for i = 1, 4 do
		local particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 6)
		if particle then
			particle:SetDieTime( math.Rand( 2, 2.4 ) )
			particle:SetStartAlpha(65)
			particle:SetEndAlpha(0)
			particle:SetStartSize( 12 )
			particle:SetEndSize(0)
			particle:SetGravity( Vector( 0, 0, 145 ) )
			particle:SetAirResistance( 30 )
			particle:SetVelocity( VectorRand() * 12 + owner:GetVelocity() )
			particle:SetStartLength( 5 )
			particle:SetEndLength( 25 )
			particle:SetColor( 145, 185, 255 )
		end
	end

	for i = 0, 25 do
		pos = getrandombonepos( owner, i )
		particle = emitter:Add("sprites/glow04_noz", pos )
		if particle then
			particle:SetDieTime( math.Rand( 2.15, 2.35 ) )
			particle:SetStartSize( math.Rand( 1, 2 ) )
			particle:SetEndSize( 0 )
			particle:SetColor( 255,255,255 )
			particle:SetStartAlpha( 125 )
			particle:SetEndAlpha( 0 )
			particle:SetAirResistance( 30 )
			particle:SetRoll( math.random( 0, 360 ) )
			particle:SetGravity( Vector( 0, 0, -15 ) + owner:GetVelocity() * .1 )
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

local matSkin = Material( "shadertest/unlitsinglecolordetail" )
function ENT:PrePlayerDraw(pl)
	if pl ~= self:GetOwner() then return end
	render.ModelMaterialOverride( matSkin )
	render.SetColorModulation( 0.1, 0.25, 0.4 )
	render.SetBlend( 0.2 )
end

function ENT:PostPlayerDraw(pl)
	if pl ~= self:GetOwner() then return end
	render.ModelMaterialOverride()
	render.SetColorModulation(1, 1, 1)
	render.SetBlend( 1 )
end