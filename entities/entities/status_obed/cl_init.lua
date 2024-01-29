INC_CLIENT()

ENT.NextEmit = 0.02
local matBeam = Material( "trails/electric" )
local color = Color(39,255,15)
function ENT:Draw()
    local owner = self:GetOwner()
   if MySelf:KeyDown(IN_SPEED) or MySelf ~= owner then return end
    render.SetColorModulation(0.45, 0.46, 0.01)

        local alpha = 255
        local at = owner:GetPos():ToScreen()

        local ang = Angle( 0, CurTime()*120, 0 )
        local up = Vector( 0, 0, 1 )
        local ringpos = owner:GetPos() + Vector( 0, 0, 26 )
        local frametime = FrameTime() * 500
        local ringsize = 128

        render.SetMaterial( matBeam )
        render.StartBeam( 19 )
        for i=1, 19 do
            render.AddBeam( ringpos + ang:Forward() * ringsize, 10, 10, color)
            ang:RotateAroundAxis( up, 20 )
        end
            
        render.EndBeam()

end
