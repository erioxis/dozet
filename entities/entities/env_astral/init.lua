INC_SERVER()

function ENT:Initialize()
	self:DrawShadow( false )
	self:SetColor( Color( 255, 255, 255, 255 ) )
	self:PhysicsInit( SOLID_NONE )
end

function ENT:Think()
	local pos = self:GetPos()
	for _, k in ipairs( ents.FindInSphere( pos, 50 ) ) do
		if k:IsValidLivingZombie() then
			if WorldVisible( pos, k:GetPos() ) then
				self:GetOwner():GetActiveWeapon():SetHitStacks( 0 )
			end
		end
	end
end