include("shared.lua")

local textscreenFonts = textscreenFonts
local screenInfo = {}
local shouldDrawBoth = false

-- Numbers used in conjunction with text width to work out the render bounds
local widthBoundsDivider = 7.9
local heightBoundsDivider = 12.4

-- ENUM type things for faster table indexing
local FONT = 1
local TEXT = 2
local POSX = 3
local POSY = 4
local COL = 5
local LEN = 6
local SIZE = 7
local CAMSIZE = 8
local RAINBOW = 9

-- Make ply:ShouldDrawLocalPlayer() never get called more than once a frame
hook.Add("Think", "ss_should_draw_both_sides", function()
	shouldDrawBoth = LocalPlayer():ShouldDrawLocalPlayer()
end)


-- TODO: https://github.com/Facepunch/garrysmod-issues/issues/3740
-- cvars.AddChangeCallback("ss_enable_rainbow", function(convar_name, value_old, value_new)
-- 	print('ss_enable_rainbow changed: '.. value_new)
-- 	rainbow_enabled = tonumber(value_new)
-- end, "3D2DScreens")

function ENT:Initialize()
	self:SetMaterial("models/effects/vol_light001")
	self:SetRenderMode(RENDERMODE_NONE)
end

local product
local function IsInFront(entPos, plyShootPos, direction)
	product = (entPos.x - plyShootPos.x) * direction.x +
		(entPos.y - plyShootPos.y) * direction.y +
		(entPos.z - plyShootPos.z) * direction.z
	return product < 0
end


-- Draws the 3D2D text with the given positions, angles and data(text/font/col)
local function Draw3D2D(ang, pos, camangle, data, self)
		cam.Start3D2D(pos, camangle, 2 )
			render.PushFilterMin(TEXFILTER.ANISOTROPIC)
			surface.SetFont("ZSHUDFontSmall")
			surface.SetTextPos(self:GetPos().x, self:GetPos().y)
			surface.SetTextColor(HSVToColor((CurTime() * 60 + (2 * 5)) % 360, 1, 1))
			surface.DrawText("By "..self:GetOwner():Nick())
			render.PopFilterMin()
		cam.End3D2D()

end

local plyShootPos, ang, pos, camangle, showFront, data -- Less variables being created each frame
function ENT:DrawTranslucent()
	-- Cache the shoot pos for this frame
	plyShootPos = LocalPlayer():GetShootPos()

	if self:GetPos():DistToSqr(plyShootPos) < 21800 then
		ang = self:GetAngles()
		pos = self:GetPos() + ang:Up()
		camangle = Angle(ang.p, ang.y, ang.r)
		data = screenInfo[self]

		-- Should we draw both screens? (Third person/calview drawing fix)
		if shouldDrawBoth then
			Draw3D2D(ang, pos, camangle, data, self)
			camangle:RotateAroundAxis(camangle:Right(), 180)
			Draw3D2D(ang, pos, camangle, data, self)
		else
			-- Is the front of the screen facing us or the back?
			showFront = IsInFront(pos, plyShootPos, ang:Up())

			-- Draw the front of the screen
			if showFront then
				Draw3D2D(ang, pos, camangle, data, self)
			else
			-- Draw the back of the screen
				camangle:RotateAroundAxis(camangle:Right(), 180)
				Draw3D2D(ang, pos, camangle, data, self)
			end
		end
	end
	self:SetRenderBounds(Vector(-42, -42, -1.75), Vector(42,42, 1.75))
end
