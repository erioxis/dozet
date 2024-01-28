function EFFECT:Init( data )
	self.Position = data:GetStart() + (VectorRand() * 4)
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()

	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self.EndPos = data:GetOrigin()

	self.Life = 0

	self:SetRenderBoundsWS( self.StartPos, self.EndPos )
end

function EFFECT:Think( )
	self.Life = self.Life + FrameTime() * 0.4 -- Effect should dissipate before the next one.
	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )

	return self.Life < 1
end

local beammat = Material("trails/smoke")
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

	for i = 0,8 do
		local particle = emitter:Add("effects/blueflare1", self.EndPos - (self.EndPos - self.StartPos) * math.Rand(0, 1))
		if particle then
			local vel = VectorRand():GetNormal() * 65
			particle:SetDieTime(0.4)
			particle:SetColor(250,210,250)
			particle:SetStartAlpha(200)
			particle:SetEndAlpha(0)
			particle:SetStartSize(1)
			particle:SetEndSize(0)
			particle:SetVelocity(vel)
			particle:SetGravity(vel * -1.7)
			particle:SetRoll(math.random(360))
		end
	end	
	for i = 0,7 do
		local particle = emitter:Add("effects/fleck_glass"..math.random(1, 3), self.EndPos - (self.EndPos - self.StartPos) * math.Rand(0, 1))
		if particle then
			local vel = VectorRand():GetNormal() * 65
			particle:SetDieTime(0.4)
			particle:SetColor(250,210,250)
			particle:SetStartAlpha(200)
			particle:SetEndAlpha(0)
			particle:SetStartSize(1)
			particle:SetEndSize(0)
			particle:SetVelocity(vel)
			particle:SetGravity(vel * -1.7)
			particle:SetRoll(math.random(360))
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)

	render.SetMaterial(beammat)
	for i = 0, nlen, 32 do
		if i > 704 then break end -- Limit the range on the spin beam effect...otherwise might be expensive.

		local set = i - CurTime() * 12

		local basebeampos = self.StartPos - dfwd * i
		local spinbeampos = basebeampos + dup * math.sin(set) * 2 + drgt * math.cos(set) * 2

		if i == 704 then spinbeampos = basebeampos end -- Tie the spin back into the main beam at the end of the spin beams

		render.DrawBeam(prevspinpos, spinbeampos, 18, texcoord + i, texcoord + nlen / 128 + i, Color(40, 40, 40, 145 * alpha))

		prevspinpos = spinbeampos
	end


	render.DrawBeam(self.StartPos, self.EndPos, 15, texcoord, texcoord + nlen / 128, Color(10, 10, 10, 55 * alpha))
	render.DrawBeam(self.StartPos, self.EndPos, 3, texcoord, texcoord + nlen / 128, Color(10, 10, 10, 255 * alpha))
end
