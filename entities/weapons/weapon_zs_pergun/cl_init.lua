INC_CLIENT()

local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colYellow = Color(220, 220, 0, 230)
local colWhite = Color(220, 220, 220, 230)
local colAmmo = Color(255, 255, 255, 230)


function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 180, 200
	local x, y = wid * -0.6, hei * -0.5
	local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
	cam.Start3D2D(pos, ang, self.HUD3DScale / 2)
		draw.RoundedBoxEx(32, x, y, wid, hei, colBG, true, false, true, false)

		draw.SimpleTextBlurry(spare, "ZS3D2DFontBig", x + wid * 0.5, y + hei, Color(COLOR_RED), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
function SWEP:Draw2DHUD()
	local screenscale = BetterScreenScale()

	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local clip = self:Clip1()
	local spare = self:GetOwner():GetAmmoCount(self:GetPrimaryAmmoType())
	local maxclip = self.Primary.ClipSize

	draw.RoundedBox(16, x, y, wid, hei, colBG)


	draw.SimpleTextBlurry(spare,"ZSHUDFontBig", x + wid * (displayspare and 0.25 or 0.5), y + hei * 0.5, Color(220,220,222), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
