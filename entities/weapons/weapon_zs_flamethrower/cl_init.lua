INC_CLIENT()

local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colYellow = Color(220, 220, 0, 230)
local colWhite = Color(220, 220, 220, 230)
local colAmmo = Color(255, 255, 255, 230)
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.VElements = {
	["e"] = { type = "Model", model = "models/hunter/tubes/tube1x1x8.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, 0, -12.741), angle = Angle(0, 0, 0), size = Vector(0.024, 0.024, 0.073), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 2.076), angle = Angle(0, 0, 0), size = Vector(0.026, 0.026, 0.052), color = Color(68, 68, 68, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, -0.651, 8.246), angle = Angle(0, 0, 90), size = Vector(0.417, 0.746, 0.137), color = Color(68, 68, 68, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++"] = { type = "Model", model = "models/props_vehicles/carparts_muffler01a.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0.134, 1.035, -6.507), angle = Angle(90, 180, 0), size = Vector(0.245, 0.245, 0.245), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 14.419), angle = Angle(0, 0, 0), size = Vector(0.029, 0.029, 0.283), color = Color(218, 218, 118, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0.9, 0, 17.98), angle = Angle(88, 180, -180), size = Vector(0.878, 0.878, 0.878), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(-0.082, 2.179, 7.624), angle = Angle(0, 90, 0), size = Vector(0.605, 0.404, 0.169), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 2.179, 12.264), angle = Angle(0.015, 90, 180), size = Vector(0.605, 0.482, 0.171), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++"] = { type = "Model", model = "models/xeon133/racewheel/race-wheel-35.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 1.897, 9.956), angle = Angle(0, 0, 90), size = Vector(0.071, 0.44, 0.071), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e+++++++++"] = { type = "Model", model = "models/hunter/tubes/tube4x4x2to2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 21.042), angle = Angle(0, 0, -180), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 21.923), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 22.4), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 22.887), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 0, 21.772), angle = Angle(0, 0, 0), size = Vector(0.372, 0.372, 0.576), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 1.062, 20.598), angle = Angle(0, 0, 180), size = Vector(0.021, 0.021, 0.041), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 3.236, 24.2), angle = Angle(0, 0, -150), size = Vector(0.021, 0.021, 0.031), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 3.169, 28.367), angle = Angle(0, 0, 180), size = Vector(0.021, 0.021, 0.031), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.021, 0.021, 0.012), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.012, 0.012, 0.268), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Gun", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.012, 0.012, 0.268), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Sprite", sprite = "zombiesurvival/killicons/burn", bone = "ValveBiped.Bip01_Spine4", rel = "e++++++++++++++++++", pos = Vector(0.116, 0.614, -1.202), size = { x = 1.928, y = 1.928 }, color = Color(0, 80, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}
SWEP.WElements = {
	["e"] = { type = "Model", model = "models/hunter/tubes/tube1x1x8.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.924, 1.173, -5.703), angle = Angle(0, -90, -99.376), size = Vector(0.024, 0.024, 0.073), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 2.076), angle = Angle(0, 0, 0), size = Vector(0.026, 0.026, 0.052), color = Color(68, 68, 68, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, -0.651, 8.246), angle = Angle(0, 0, 90), size = Vector(0.417, 0.746, 0.137), color = Color(68, 68, 68, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++"] = { type = "Model", model = "models/props_vehicles/carparts_muffler01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0.134, 1.035, -6.507), angle = Angle(90, 180, 0), size = Vector(0.245, 0.245, 0.245), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 14.419), angle = Angle(0, 0, 0), size = Vector(0.029, 0.029, 0.283), color = Color(218, 218, 118, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0.9, 0, 17.98), angle = Angle(88, 180, -180), size = Vector(0.878, 0.878, 0.878), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(-0.082, 2.179, 7.624), angle = Angle(0, 90, 0), size = Vector(0.605, 0.404, 0.169), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++"] = { type = "Model", model = "models/props_canal/mattpipe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 2.179, 12.264), angle = Angle(0.015, 90, 180), size = Vector(0.605, 0.482, 0.171), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++"] = { type = "Model", model = "models/xeon133/racewheel/race-wheel-35.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 1.897, 9.956), angle = Angle(0, 0, 90), size = Vector(0.071, 0.44, 0.071), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e+++++++++"] = { type = "Model", model = "models/hunter/tubes/tube4x4x2to2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 21.042), angle = Angle(0, 0, -180), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 21.923), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 22.4), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 22.887), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++"] = { type = "Model", model = "models/Items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 0, 21.772), angle = Angle(0, 0, 0), size = Vector(0.372, 0.372, 0.576), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 1.062, 20.598), angle = Angle(0, 0, 180), size = Vector(0.021, 0.021, 0.041), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 3.236, 24.2), angle = Angle(0, 0, -150), size = Vector(0.021, 0.021, 0.031), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 3.169, 28.367), angle = Angle(0, 0, 180), size = Vector(0.021, 0.021, 0.031), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.021, 0.021, 0.012), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e++++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.012, 0.012, 0.268), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["e+++++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(0, 2.378, 29.617), angle = Angle(0, 0, 150), size = Vector(0.012, 0.012, 0.268), color = Color(178, 130, 0, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Sprite", sprite = "zombiesurvival/killicons/burn", bone = "ValveBiped.Bip01_R_Hand", rel = "e++++++++++++++++++", pos = Vector(0, 0.737, -1.032), size = { x = 1.928, y = 1.928 }, color = Color(0, 80, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false}
}

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
