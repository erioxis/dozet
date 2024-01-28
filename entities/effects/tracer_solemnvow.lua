EFFECT.Speed	= 3000
EFFECT.Length	= 155
EFFECT.Trace	= Material( "effects/exit1" )
EFFECT.Halo		= Material( "effects/strider_tracer" )
EFFECT.Muzzle		= Material( "effects/yellowflare" )
EFFECT.FlyBy	= "ambient/machines/spinup.wav"

function EFFECT:Init( data )

	self.Position = data:GetStart()
	self.WeaponEnt = data:GetEntity()
	self.Attachment = data:GetAttachment()

	self.StartPos = data:GetOrigin()
	self.EndPos = self:GetTracerShootPos( self.Position, self.WeaponEnt, self.Attachment ) + ( self.WeaponEnt:Clip1() % 2 == 0 and self.WeaponEnt:GetOwner():GetAimVector():Angle():Right() * -25 or Vector( 0, 0, 0 ) )
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
			
			if( !game.SinglePlayer() && entity:IsEFlagSet( EFL_DORMANT ) ) then 
				return start 
			end
			
			if( entity:IsWeapon() && entity:IsCarriedByLocalPlayer() ) then
				local pl = entity:GetOwner()
				if( IsValid( pl ) ) then
					local vm = pl:GetViewModel()
					if( IsValid( vm ) and not LocalPlayer():ShouldDrawLocalPlayer() ) then
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
	
	local startPos = self.StartPos + self.Normal * startDistance
	local endPos = self.StartPos + self.Normal * endDistance * 1

	local clip = self.WeaponEnt:Clip1() % 2 == 0
	
	local col = clip and Color( 255, 255, 255, 255 ) or Color( 25, 25, 25, 255 )

	render.SetMaterial( self.Trace )
	render.DrawBeam( startPos, endPos, 3, 0, 1, col )
	render.SetMaterial( self.Halo )
	render.DrawBeam( startPos, endPos, 5, 0, 1, col )

	if self.WeaponEnt.Astral then
		col = clip and Color( 255, 25, 255, 255 ) or Color( 25, 25, 255, 255 )
		local texcoord = math.Rand( 0, 1 )
		local norm = (self.StartPos - self.EndPos) * self.LifeTime
		local nlen = norm:Length()
		local inv = 1 - self.LifeTime
		render.SetMaterial( Material( "trails/laser" ) )
		render.DrawBeam( self.StartPos, self.EndPos, 12 * inv, texcoord, texcoord + nlen / 128, col )
	end
end