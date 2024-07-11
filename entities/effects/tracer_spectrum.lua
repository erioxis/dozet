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
	self.Life = self.Life + FrameTime() * 4-- Effect should dissipate before the next one.
	self.StartPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )

	return self.Life < 1
end

local beammat = Material("trails/electric")
local glowmat = Material("sprites/light_glow02_add")
function EFFECT:Render()
	local texcoord = math.Rand(0, 3)

	local norm = (self.StartPos - self.EndPos) * self.Life
	local nlen = norm:Length()

	local alpha = 1 - self.Life

	render.SetMaterial(beammat)
	for i = 0, 4 do
		render.DrawBeam(self.StartPos, self.EndPos, 4, texcoord, texcoord + nlen / 64, Color(15, 197, 200, 255 * alpha))
	end
	render.DrawBeam(self.StartPos, self.EndPos, 14, texcoord, texcoord + nlen / 64, Color(109, 238, 255, 170 * alpha))

	render.SetMaterial(glowmat)
	render.DrawSprite(self.StartPos,40, 40, Color(124, 255, 238, 148 * alpha))
	render.DrawSprite(self.EndPos, 60, 60, Color(105, 255, 250, 148 * alpha))
end
