INC_CLIENT()

ENT.NextEmit = 0.02
local matBeam = Material( "trails/electric" )
function ENT:Draw()
   if MySelf:KeyDown(IN_SPEED) or MySelf ~= owner then return end
   local owner = self:GetOwner()
    render.SetColorModulation(0.45, 0.46, 0.01)

    if WorldVisible( EyePos(), owner:GetPos() ) then
        local distance = MySelf:GetPos():Distance( owner:GetPos() )
        local alpha = 255
        local at = owner:GetPos():ToScreen()

        local ang = Angle( 0, 0, 0 )
        local up = Vector( 0, 0, 1 )
        local ringpos = owner:GetPos() + Vector( 0, 0, 26 )
        local frametime = FrameTime() * 500
        local ringsize = 128

        render.SetMaterial( matBeam )
        render.StartBeam( 19 )
        for i=1, 19 do
            render.AddBeam( ringpos + ang:Forward() * ringsize, 10, 10, Color( 255, 255, 255, 255 ) )
            ang:RotateAroundAxis( up, 20 )
        end
            
        render.EndBeam()
    end
end
