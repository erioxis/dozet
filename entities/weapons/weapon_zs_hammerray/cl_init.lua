INC_CLIENT()

SWEP.Slot = 3
SWEP.SlotPos = 0

SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 57

SWEP.HUD3DBone = "Base"
SWEP.HUD3DPos = Vector(4, -1, -10)
SWEP.HUD3DAng = Angle(180, 0, 0)
SWEP.HUD3DScale = 0.03
SWEP.VElements = {
	["e"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Pump", rel = "", pos = Vector(2.5, 0.001, -10.68), angle = Angle(90, 0, 0), size = Vector(0.145, 0.677, 0.5), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+"] = { type = "Model", model = "models/mechanics/various/211.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(-19.494, -2.701, -5.066), angle = Angle(0, 0, -90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e++"] = { type = "Model", model = "models/mechanics/robotics/g1.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(-4.387, 0.006, 2.5), angle = Angle(0, -90, 0), size = Vector(0.137, 0.12, 0.16), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++"] = { type = "Model", model = "models/xqm/podremake.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(-0.816, -3.013, 2.5), angle = Angle(0, -90, -90), size = Vector(0.045, 0.045, 0.043), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++"] = { type = "Model", model = "models/props_phx/gears/bevel9.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(4.431, 0, 2.5), angle = Angle(0, 90, -90), size = Vector(0.433, 0.332, 0.309), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(9.198, 0.002, 2.5), angle = Angle(0, 90, -90), size = Vector(0.037, 0.031, 4.65), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++++"] = { type = "Model", model = "models/xqm/afterburner1huge.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(16.638, 0.004, 2.5), angle = Angle(85.75, -90, 90), size = Vector(0.074, 0.074, 0.103), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++++"] = { type = "Model", model = "models/props_phx/gears/bevel12.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(20.105, 0.001, 2.5), angle = Angle(0, 90, 90), size = Vector(0.319, 0.319, 0.421), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++++++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(21.426, 0.004, 1.542), angle = Angle(0, 0, 0), size = Vector(0.193, 0.193, 0.193), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++++++"] = { type = "Model", model = "models/props_phx/construct/wood/wood_wire_angle360x2.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(13.557, 0.001, 2.5), angle = Angle(90, 0, 0), size = Vector(0.033, 0.037, 0.107), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
	["e++++++++++"] = { type = "Model", model = "models/xqm/hydcontrolbox.mdl", bone = "ValveBiped.Pump", rel = "e", pos = Vector(-0.039, -0.093, 0.518), angle = Angle(-180, 0, 0), size = Vector(0.415, 0.415, 0.099), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e1"] = { type = "Model", model = "models/hunter/blocks/cube1x1x1.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0, 0.558, 15.237), angle = Angle(0, 45, -180), size = Vector(0.019, 0.019, 0.262), color = Color(109, 109, 109, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+"] = { type = "Model", model = "models/mechanics/robotics/xfoot.mdl", bone = "ValveBiped.Gun", rel = "e1", pos = Vector(0, 0, -5.276), angle = Angle(0, 0, 0), size = Vector(0.073, 0.073, 0.073), color = Color(109, 109, 109, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["e"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.928, 3.678, -1.796), angle = Angle(-3.354, 0, -90), size = Vector(0.145, 0.677, 0.5), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++"] = { type = "Model", model = "models/mechanics/robotics/g1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(-4.38672, 0.00586, 2.50012), angle = Angle(0, -89.99998, 0), size = Vector(0.137, 0.12, 0.16), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++"] = { type = "Model", model = "models/xqm/podremake.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(-0.81543, -3.0127, 2.5), angle = Angle(0, -89.99998, -90.00002), size = Vector(0.045, 0.045, 0.043), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++"] = { type = "Model", model = "models/props_phx/gears/bevel9.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(4.43164, 0.00024, 2.5), angle = Angle(-1e-05, 89.99998, -90.00001), size = Vector(0.433, 0.332, 0.309), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(9.19824, 0.0022, 2.5), angle = Angle(-1e-05, 89.99998, -90.00001), size = Vector(0.037, 0.031, 4.65), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++++"] = { type = "Model", model = "models/xqm/afterburner1huge.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(16.63867, 0.00391, 2.50012), angle = Angle(85.75001, -90.00005, 90.00005), size = Vector(0.074, 0.074, 0.103), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++++"] = { type = "Model", model = "models/props_phx/gears/bevel12.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(20.10449, 0.00098, 2.5), angle = Angle(1e-05, 89.99998, 90.00001), size = Vector(0.319, 0.319, 0.421), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e++++++++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(21.42578, 0.00391, 1.54211), angle = Angle(0, 0, 0), size = Vector(0.193, 0.193, 0.193), color = Color(0, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e+++++++++"] = { type = "Model", model = "models/props_phx/construct/wood/wood_wire_angle360x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(13.55664, 0.00098, 2.50012), angle = Angle(90, 0, 0), size = Vector(0.033, 0.037, 0.107), color = Color(246, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/concrete2", skin = 0, bodygroup = {} },
	["e++++++++++"] = { type = "Model", model = "models/xqm/hydcontrolbox.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(-0.03906, -0.09302, 0.51807), angle = Angle(1e-05, -180, -180), size = Vector(0.415, 0.415, 0.099), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e1"] = { type = "Model", model = "models/hunter/blocks/cube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e", pos = Vector(25.91699, 0.55688, 2.50012), angle = Angle(-44.99999, 90.00002, -90), size = Vector(0.019, 0.019, 0.262), color = Color(109, 109, 109, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+"] = { type = "Model", model = "models/mechanics/robotics/xfoot.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -5.276), angle = Angle(0, 0, 0), size = Vector(0.073, 0.073, 0.073), color = Color(109, 109, 109, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -3), angle = Angle(0, 0, 0) },
	["Base"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 3), angle = Angle(0, 0, 0) }
}

local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colWhite = Color(220, 220, 220, 230)

function SWEP:Draw2DHUD()
	local screenscale = BetterScreenScale()

	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local spare = self:GetPrimaryAmmoCount()

	draw.RoundedBox(16, x, y, wid, hei, colBG)
	draw.SimpleTextBlurry(spare, spare >= 1000 and "ZSHUDFont" or "ZSHUDFontBig", x + wid * 0.5, y + hei * 0.5, spare == 0 and colRed or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 180, 64
	local x, y = wid * -0.6, hei * -0.5
	local spare = self:GetPrimaryAmmoCount()

	cam.Start3D2D(pos, ang, self.HUD3DScale / 2)
		draw.RoundedBoxEx(32, x, y, wid, hei, colBG, true, false, true, false)
		draw.SimpleTextBlurry(spare, spare >= 1000 and "ZS3D2DFontSmall" or "ZS3D2DFont", x + wid * 0.5, y + hei * 0.5, spare == 0 and colRed or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
