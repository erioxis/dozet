function EFFECT:Init( data )
	self.Position = data:GetStart()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()

	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self.EndPos = data:GetOrigin()

	self.Life = 0

	self:SetRenderBoundsWS( self.StartPos, self.EndPos )
end

function EFFECT:Think( )
	self.Life = self.Life + FrameTime() * 6 -- Effect should dissipate before the next one.
	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )

	return self.Life < 1
end

local beammat = Material("trails/physbeam")
local glowmat = Material("sprites/light_glow02_add")
function EFFECT:Render()
	local texcoord = math.Rand( 0, 1 )

	local norm = (self.StartPos - self.EndPos) * self.Life
	local dir = (self.StartPos - self.EndPos):Angle()
	local dfwd = dir:Forward()
	local dup = dir:Up()
	local drgt = dir:Right()
	local nlen = norm:Length()

	local prevspinpos = self.StartPos
	local alpha = 1 - self.Life

	local emitter = ParticleEmitter(self.EndPos)
	emitter:SetNearClip(24, 32)

	local particle = emitter:Add("effects/spark", self.EndPos - (self.EndPos - self.StartPos) * math.Rand(0, 1))
	local vel = VectorRand():GetNormal() * 120
	particle:SetDieTime(0.2)
	particle:SetColor(50,20,220)
	particle:SetStartAlpha(250)
	particle:SetEndAlpha(0)
	particle:SetStartSize(2)
	particle:SetEndSize(0)
	particle:SetVelocity(vel)
	particle:SetGravity(vel * -1.5)

	emitter:Finish() emitter = nil collectgarbage("step", 64)

	render.SetMaterial(beammat)
	for i = 0, nlen, 32 do
		if i > 704 then break end -- Limit the range on the spin beam effect...otherwise might be expensive.

		local set = i - CurTime() * 15

		local basebeampos = self.StartPos - dfwd * i
		local spinbeampos = basebeampos + dup * math.sin(set) * 6 + drgt * math.cos(set) * 6

		if i == 704 then spinbeampos = basebeampos end -- Tie the spin back into the main beam at the end of the spin beams

		render.DrawBeam(prevspinpos, spinbeampos, 10, texcoord + i, texcoord + nlen / 128 + i, Color(42, 35, 43, 255 * alpha))

		prevspinpos = spinbeampos
	end

	for i = 0, 4 do
		render.DrawBeam(self.StartPos + VectorRand(), self.EndPos + VectorRand(), 6, texcoord, texcoord + nlen / 128, Color(79, 69, 217, 255 * alpha))
	end
	render.DrawBeam(self.StartPos, self.EndPos, 18, texcoord, texcoord + nlen / 128, Color(0, 11, 92, 250 * alpha))

	render.SetMaterial(glowmat)
	render.DrawSprite(self.StartPos, 50, 50, Color(23, 64, 197, 178 * alpha))
	render.DrawSprite(self.EndPos, 50, 50, Color(19, 78, 160, 178 * alpha))
end
