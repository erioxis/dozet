INC_CLIENT()

local function getsinusoid( x )
	return math.sin( math.tan( x ) * math.cos( x ) * 2.9 ) + math.sin( x * .33 ) + math.cos( x * .25 )
end

function ENT:Think()
	if IsFirstTimePredicted() then
		local ent = self:GetOwner()
		self:SetModel( ent:GetModel() )
		self:SetSequence( ent:GetSequence() )
	end
end

function ENT:DrawTranslucent()
	render.SetBlend( 1 )
	self:DrawModel()
	render.SetBlend( 1 )

	if render.SupportsVertexShaders_2_0() then
		render.PopCustomClipPlane()
		render.EnableClipping(false)
	end
end

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetColor( Color( 255, 255, 255, 165 ) )
end
