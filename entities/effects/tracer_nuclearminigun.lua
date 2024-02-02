EFFECT.Speed = 3800
EFFECT.Length = 155
EFFECT.Trace = Material( "models/roller/rollermine_glow" )
EFFECT.Halo = Material( "sprites/glow04_noz" )
EFFECT.FlyBy = "ambient/machines/spinup.wav"

function EFFECT:Init( data )

	self.WeaponEnt = data:GetEntity()
	self.Position = data:GetStart()
	self.Attachment = data:GetAttachment()
	self.StartPos = data:GetOrigin()

	self.EndPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment )
	self.Parent = data:GetEntity()
	
	self.Entity:SetRenderBoundsWS( self.StartPos, self.EndPos )

	local diff = ( self.EndPos - self.StartPos )
	
	self.Normal = diff:GetNormal()
	self.StartTime = 0
	self.LifeTime = ( diff:Length() + self.Length ) / self.Speed

end
function EFFECT:Think( )
	self.LifeTime = self.LifeTime - FrameTime()
	self.StartTime = self.StartTime + FrameTime()
	
	return self.LifeTime > 0
end

function EFFECT:GetTracerOrigin( data )
	if ( CLIENT ) then
		local start = data:GetStart()

		if( bit.band( data:GetFlags(), TRACER_FLAG_USEATTACHMENT ) == TRACER_FLAG_USEATTACHMENT ) then
			local entity = data:GetEntity()
			
			if( !IsValid( entity ) ) then 
				return start 
			end
			
			if( !game.SinglePlayer() and entity:IsEFlagSet( EFL_DORMANT ) ) then 
				return start 
			end
			
			if( entity:IsWeapon() and entity:IsCarriedByLocalPlayer() ) then
				local pl = entity:GetOwner()
				if( IsValid( pl ) ) then
					local vm = pl:GetViewModel()
					if( IsValid( vm ) and not MySelf:ShouldDrawLocalPlayer() ) then
						entity = vm
					else 					
						if( entity.WorldModel ) then
							entity:SetModel( entity.WorldModel )
						end
					end
				end
			end

			local attachment = entity:GetAttachment( data:GetAttachment() )
			if( attachment ) then
				start = attachment.Pos
			end

		end
		
		return start
	end
end

function EFFECT:Render()
	local endDistance = self.Speed * self.LifeTime
	local startDistance = endDistance - self.Length
	
	startDistance = math.max( 0, startDistance )
	endDistance = math.max( 0, endDistance )
	
	local startPos = self.StartPos + self.Normal * startDistance * -2
	local endPos = self.StartPos + self.Normal * endDistance * 1

	render.SetMaterial( self.Trace )
	render.DrawBeam( startPos, endPos, 2, 0, 1, Color( 25, 255, 25, 255 ) )	
	render.SetMaterial( self.Halo )
	render.DrawBeam( startPos, endPos, 5, 0, 1, Color( 15, 255, 5, 255 ) )
	render.SetMaterial( self.Halo )
	render.DrawSprite( self.EndPos, 35, 35, Color( 25, 255, 25, 18 ) )
end