SWEP.Base = "weapon_zs_base"
DEFINE_BASECLASS( "weapon_zs_base" )
SWEP.HoldType = "shotgun"

SWEP.PrintName = translate.Get("wep_nminigun")
SWEP.Description = translate.Get("wep_d_nminigum")

SWEP.Slot = 2
SWEP.SlotPos = 0

SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 75

SWEP.HUD3DBone = "Base"
SWEP.HUD3DPos = Vector(8, -8, -4)
SWEP.HUD3DAng = Angle( 180, 0, -90 )
SWEP.HUD3DScale = 0.1

SWEP.NoClipReload = true

SWEP.VElements = {
	["bar"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(0, -2.704, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(-2.608, 0.159, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(0, 3.17, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(2.471, 0.159, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(-1.864, -2.013, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(-1.811, 2.532, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(1.924, -2.013, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrels", pos = Vector(1.924, 2.532, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["barrels"] = { type = "Model", model = "models/Mechanics/gears2/vert_18t1.mdl", bone = "Base", rel = "", pos = Vector(1.562, 2.605, 1.34), angle = Angle(0, 0, 0), size = Vector(0.221, 0.221, 0.221), color = Color(178, 178, 178, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["barrels+"] = { type = "Model", model = "models/Mechanics/gears2/vert_18t1.mdl", bone = "Base", rel = "barrels", pos = Vector(0, 0, 5.306), angle = Angle(0, 0, 0), size = Vector(0.221, 0.221, 0.298), color = Color(195, 195, 195, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["barrels++"] = { type = "Model", model = "models/Mechanics/gears2/gear_48t1.mdl", bone = "Base", rel = "barrels", pos = Vector(0, 0, 16.106), angle = Angle(0, 0, 0), size = Vector(0.093, 0.093, 0.621), color = Color(165, 165, 165, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ddd"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-14.87, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.059, 0.059, 0.314), color = Color(95, 95, 95, 255), surpresslightning = false, material = "models/combine_advisor/body9", skin = 0, bodygroup = {} },
	["ddd+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-7.193, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.057, 0.057, 2.444), color = Color(89, 255, 0, 255), surpresslightning = false, material = "models/props_lab/warp_sheet", skin = 0, bodygroup = {} },
	["ddd++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, -0.498), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 3.861), color = Color(0, 255, 63, 255), surpresslightning = false, material = "models/props_lab/warp_sheet", skin = 0, bodygroup = {} },
	["ddd+++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.104), color = Color(99, 99, 99, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ddd++++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, 12.114), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.104), color = Color(116, 116, 116, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ddd+++++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, -0.498), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 3.861), color = Color(0, 255, 63, 53), surpresslightning = false, material = "effects/flashlight/caustics", skin = 0, bodygroup = {} },
	["dfdf"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-3.281, -1.902, 0.012), angle = Angle(0, 90, 0), size = Vector(0.324, 0.324, 0.324), color = Color(116, 116, 116, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dfdf+"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-3.281, 2.453, 0.012), angle = Angle(0, -90, 0), size = Vector(0.324, 0.324, 0.324), color = Color(108, 88, 88, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dffd"] = { type = "Model", model = "models/props_lab/reciever01d.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(3.813, 0, -0.01), angle = Angle(0, 90, 0), size = Vector(0.62, 0.62, 0.62), color = Color(74, 74, 74, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dffd+"] = { type = "Model", model = "models/props_lab/reciever01d.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(3.813, 0.639, 0.23), angle = Angle(0, -90, 0), size = Vector(0.62, 0.62, 0.62), color = Color(87, 85, 85, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dsad"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-15.073, 0, 0), angle = Angle(90, 180, 0), size = Vector(0.061, 0.061, 0.293), color = Color(72, 72, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["fdsf"] = { type = "Model", model = "models/hunter/tubes/tubebend1x1x90.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, 12.354), angle = Angle(0, 90, 0), size = Vector(0.065, 0.065, 0.041), color = Color(82, 82, 82, 255), surpresslightning = false, material = "models/props_combine/combine_cell_supports", skin = 0, bodygroup = {} },
	["fdsf+"] = { type = "Model", model = "models/hunter/tubes/tubebend1x1x90.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "liqud", pos = Vector(0, 0, 0.159), angle = Angle(-180, 90, 0), size = Vector(0.065, 0.065, 0.041), color = Color(110, 110, 110, 255), surpresslightning = false, material = "models/props_combine/combine_cell_supports", skin = 0, bodygroup = {} },
	["filter"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-2.846, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.375, 0.375, 0.284), color = Color(109, 109, 109, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ghguh"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(0, 0, 0), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-4.193, -0.042, 0.03), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(4.218, 0, 0), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(3.46, 0, 0), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh++++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-4.77, 0.564, 0.698), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+++++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-0.601, 0, 0), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["hand"] = { type = "Model", model = "models/props_wasteland/cafeteria_bench001a_chunk05.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-20.427, 0.008, -15.407), angle = Angle(180, 90, -90), size = Vector(0.237, 0.395, 0.572), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["hand+"] = { type = "Model", model = "models/props_wasteland/cafeteria_bench001a_chunk05.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(11.274, 0.008, -3.84), angle = Angle(180, 90, 0), size = Vector(0.186, 0.805, 0.674), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["handle"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_base.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(1.23, -8.525, -2.006), angle = Angle(90, 0, 0), size = Vector(0.469, 0.368, 0.246), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["liqud"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(-6.34, 0, 3.776), angle = Angle(90, 180, 0), size = Vector(0.029, 0.029, 0.259), color = Color(133, 133, 133, 255), surpresslightning = false, material = "models/combine_advisor/mask", skin = 0, bodygroup = {} },
	["nuclearminigunhaha"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "Base", rel = "", pos = Vector(1.96, 2.612, -8.242), angle = Angle(90, -90, 0), size = Vector(0.165, 0.165, 0.165), color = Color(85, 85, 85, 255), surpresslightning = false, material = "models/combine_advisor/body9", skin = 0, bodygroup = {} },
	["nuclearminigunhaha+"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "Base", rel = "nuclearminigunhaha", pos = Vector(0, 0, -4.803), angle = Angle(180, 0, 0), size = Vector(0.165, 0.165, 0.059), color = Color(191, 191, 191, 255), surpresslightning = false, material = "models/combine_advisor/camera", skin = 0, bodygroup = {} },
	["nuclearminigunhaha++"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "Base", rel = "nuclearminigunhaha", pos = Vector(-13.728, 0, -6.238), angle = Angle(180, 0, 0), size = Vector(0.165, 0.1, 0.064), color = Color(187, 187, 187, 255), surpresslightning = false, material = "models/combine_advisor/camera", skin = 0, bodygroup = {} },
	["yeah"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "nuclearminigunhaha", pos = Vector(8.376, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.109, 0.109, 0.032), color = Color(182, 182, 182, 255), surpresslightning = false, material = "models/combine_advisor/camera", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["bar"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(0, -2.704, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(-2.608, 0.159, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(0, 3.17, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(2.471, 0.159, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(-1.864, -2.013, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(-1.811, 2.532, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar++++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(1.924, -2.013, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["bar+++++++"] = { type = "Model", model = "models/Mechanics/gears2/gear_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(1.924, 2.532, 9.222), angle = Angle(0, 0, 0), size = Vector(0.05, 0.05, 3.354), color = Color(145, 145, 145, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["barrels"] = { type = "Model", model = "models/Mechanics/gears2/vert_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(30.629, 2.122, -4.164), angle = Angle(-92.762, 0, 0), size = Vector(0.221, 0.221, 0.221), color = Color(109, 109, 109, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["barrels+"] = { type = "Model", model = "models/Mechanics/gears2/vert_18t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(0, 0, 5.306), angle = Angle(0, 0, 0), size = Vector(0.221, 0.221, 0.298), color = Color(36, 36, 36, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["barrels++"] = { type = "Model", model = "models/Mechanics/gears2/gear_48t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrels", pos = Vector(0, 0, 16.106), angle = Angle(0, 0, 0), size = Vector(0.093, 0.093, 0.621), color = Color(36, 36, 36, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["ddd"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-14.87, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.059, 0.059, 0.314), color = Color(109, 109, 109, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ddd+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-7.193, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.057, 0.057, 2.444), color = Color(0, 255, 63, 255), surpresslightning = false, material = "models/props_lab/warp_sheet", skin = 0, bodygroup = {} },
	["ddd++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "liqud", pos = Vector(0, 0, -0.498), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 3.861), color = Color(0, 255, 63, 255), surpresslightning = false, material = "models/props_lab/warp_sheet", skin = 0, bodygroup = {} },
	["ddd+++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "liqud", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.104), color = Color(109, 109, 109, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ddd++++"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "liqud", pos = Vector(0, 0, 12.114), angle = Angle(0, 0, 0), size = Vector(0.028, 0.028, 0.104), color = Color(109, 109, 109, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["dfdf"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-3.281, -1.902, 0.012), angle = Angle(0, 90, 0), size = Vector(0.324, 0.324, 0.324), color = Color(109, 109, 109, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dfdf+"] = { type = "Model", model = "models/props_lab/reciever01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-3.281, 2.453, 0.012), angle = Angle(0, -90, 0), size = Vector(0.324, 0.324, 0.324), color = Color(109, 109, 109, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dffd"] = { type = "Model", model = "models/props_lab/reciever01d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(3.813, 0, -0.01), angle = Angle(0, 90, 0), size = Vector(0.62, 0.62, 0.62), color = Color(87, 85, 85, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dffd+"] = { type = "Model", model = "models/props_lab/reciever01d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(3.813, 0.639, 0.23), angle = Angle(0, -90, 0), size = Vector(0.62, 0.62, 0.62), color = Color(87, 85, 85, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["dsad"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-15.073, 0, 0), angle = Angle(90, 180, 0), size = Vector(0.061, 0.061, 0.293), color = Color(72, 72, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["fdsf"] = { type = "Model", model = "models/hunter/tubes/tubebend1x1x90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "liqud", pos = Vector(0, 0, 12.354), angle = Angle(0, 90, 0), size = Vector(0.065, 0.065, 0.041), color = Color(109, 109, 109, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["fdsf+"] = { type = "Model", model = "models/hunter/tubes/tubebend1x1x90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "liqud", pos = Vector(0, 0, 0.159), angle = Angle(-180, 90, 0), size = Vector(0.065, 0.065, 0.041), color = Color(109, 109, 109, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["filter"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-2.846, 0, 0), angle = Angle(90, 0, 0), size = Vector(0.375, 0.375, 0.284), color = Color(109, 109, 109, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
	["ghguh"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(0, 0, 0), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-5.442, 0, 0), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(4.218, 0, 0), angle = Angle(0, 0, -38.392), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(3.46, 0, 0), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh++++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-5.716, 0, 0), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["ghguh+++++"] = { type = "Model", model = "models/maxofs2d/hover_propeller.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-0.601, 0, 0), angle = Angle(0, 0, 38.12), size = Vector(0.194, 0.194, 0.194), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
	["hand"] = { type = "Model", model = "models/props_wasteland/cafeteria_bench001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-20.427, 0.008, -15.407), angle = Angle(180, 90, -90), size = Vector(0.237, 0.395, 0.572), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["hand+"] = { type = "Model", model = "models/props_wasteland/cafeteria_bench001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(11.274, 0.008, -3.84), angle = Angle(180, 90, 0), size = Vector(0.186, 0.805, 0.674), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["handle"] = { type = "Model", model = "models/props_wasteland/light_spotlight01_base.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(1.23, -8.525, -2.006), angle = Angle(90, 0, 0), size = Vector(0.469, 0.368, 0.246), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["liqud"] = { type = "Model", model = "models/props_phx/construct/metal_wire_angle360x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-6.34, 0, 3.776), angle = Angle(90, 180, 0), size = Vector(0.029, 0.029, 0.259), color = Color(72, 72, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["nuclearminigunhaha"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(20.971, 2.612, -4.606), angle = Angle(180, -180, 0), size = Vector(0.165, 0.165, 0.165), color = Color(109, 109, 109, 255), surpresslightning = false, material = "models/combine_advisor/body9", skin = 0, bodygroup = {} },
	["nuclearminigunhaha+"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(0, 0, -4.803), angle = Angle(180, 0, 0), size = Vector(0.165, 0.165, 0.059), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["nuclearminigunhaha++"] = { type = "Model", model = "models/props_wasteland/laundry_washer003.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(-13.728, 0, -6.238), angle = Angle(180, 0, 0), size = Vector(0.165, 0.1, 0.064), color = Color(72, 72, 72, 255), surpresslightning = false, material = "models/props_lab/labturret_sheet", skin = 0, bodygroup = {} },
	["yeah"] = { type = "Model", model = "models/props_wasteland/laundry_washer001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "nuclearminigunhaha", pos = Vector(8.376, 0, 0), angle = Angle(-90, 0, 0), size = Vector(0.109, 0.109, 0.032), color = Color(72, 72, 72, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Tier = 6

SWEP.LastVel = 0
SWEP.TracerName = "tracer_nuclearminigun"

SWEP.ViewModel = "models/weapons/c_physcannon.mdl"
SWEP.WorldModel = "models/weapons/w_physics.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true
SWEP.NextRadiation = 0

SWEP.Primary.Damage = 110
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.23

SWEP.Primary.ClipSize = 600
SWEP.RequiredClip = 4
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Secondary.Automatic = true

SWEP.Recoil = 3

SWEP.SpoolDelay = 0.17

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.769 )
GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.656 )

SWEP.WalkSpeed = SPEED_SLOWEST * 0.75
SWEP.FireAnimSpeed = 0.3
SWEP.NextNuclear = 0

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "ambient/machines/spin_loop.wav")
	self.ChargeSound2 = CreateSound(self, "ambient/levels/citadel/many_pods_loop1_adpcm.wav")
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	local owner = self:GetOwner()
	if not self:GetSpooling() then
		self:SetSpooling(true)
		owner:EmitSound("ambient/machines/spinup.wav", 75, 65)
		owner:EmitSound("ambient/machines/spinup.wav", 75, 255, 0.3)
		owner:ResetSpeed()

		self:SetNextPrimaryFire(CurTime() + 0.75)
	else
		self:SetNextPrimaryFire( CurTime() + ( self.AltDowngrade and self:GetFireDelay() * 2 or self:GetFireDelay() ) )
		
		self:EmitFireSound()
		self:TakeAmmo()
		self:ShootBullets( self.Primary.Damage, self.Primary.NumShots, self:GetCone() )
		if self.NextNuclear < CurTime() and SERVER then
			self.NextNuclear = CurTime() + 4
			local cursed = owner:GetStatus("radiation")
			if (cursed) then 
				cursed:SetDTInt(1,cursed:GetDTInt(1)+3)
			end
			
			if (not cursed) then 
				local p = owner:GiveStatus("radiation",4.2)
				p:SetDTInt(1,1)
			end
		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end

function SWEP:SecondaryAttack()
	if not self:CanSecondaryAttack() then return end

	if not self:GetSpooling() then
		self:SetSpooling(true)
		self:EmitSound("ambient/machines/spinup.wav", 75, 65)
		self:GetOwner():ResetSpeed()

		self:SetNextPrimaryFire(CurTime() + 0.75)
	else
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end

function SWEP:TakeAmmo()
	self:TakeCombinedPrimaryAmmo( 1, true )
end

function SWEP:CanPrimaryAttack()
	if self:GetPrimaryAmmoCount() <= 0 then
		return false
	end

	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:CanSecondaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:GetWalkSpeed()
	return self.BaseClass.GetWalkSpeed(self) * (self:GetSpooling() and 0.5 or 1)
end

function SWEP:EmitFireSound()
	self:GetOwner():EmitSound("weapons/m249/m249-1.wav", 75, math.random(86, 89) + 50 * self:GetSpool(), 0.25)
	self:GetOwner():EmitSound("npc/barnacle/barnacle_gulp2.wav", 75, math.random(86, 89) + 50 * self:GetSpool(), 0.65)
	self:GetOwner():EmitSound("ambient/levels/labs/electric_explosion1.wav", 75, math.random(245, 255) + 50 * self:GetSpool(), 0.65)
	self:GetOwner():EmitSound("weapons/zs_bfg10k/fire.ogg", 75, math.random(222, 229) + 50 * self:GetSpool(), 0.7)
end

local hitdata = EffectData()
function SWEP.BulletCallback( attacker, tr, dmginfo )
	local ent = tr.Entity
	local wep = attacker:GetActiveWeapon()
	dmginfo:ScaleDamage(1-(wep:GetFireDelay() == 0.06 and 0 or wep:GetFireDelay()*3))
	wep.NextRadiation = wep.NextRadiation + 1
	if ent:IsValidLivingZombie() and wep.NextRadiation > 75 and SERVER then
		local g = ent:GiveStatus("radiation",2)
		g:SetDTInt(1,1)
		g.Damager = attacker
		wep.NextRadiation = 0
	end

	if CLIENT and ( attacker == MySelf or GAMEMODE.PlayerEffects ) then
		hitdata:SetOrigin( tr.HitPos )
		hitdata:SetNormal( tr.HitNormal )
		util.Effect( "explosion_nuclearminigun", hitdata )
	end
end


function SWEP:Reload()
end

function SWEP:Holster()
	self.ChargeSound:Stop()
	self.ChargeSound2:Stop()

	return self.BaseClass.Holster(self)
end

function SWEP:OnRemove()
	self.ChargeSound:Stop()
	self.ChargeSound2:Stop()
end

function SWEP:SetSpool(spool)
	self:SetDTFloat(9, spool)
end

function SWEP:GetSpool()
	return self:GetDTFloat(9)
end

function SWEP:SetSpooling(isspool)
	self:SetDTBool(1, isspool)
end

function SWEP:GetSpooling()
	return self:GetDTBool(1)
end

function SWEP:GetFireDelay()
	return math.max(self.BaseClass.GetFireDelay( self ) - ( self:GetSpool() * self.SpoolDelay ),0.06)
end

function SWEP:CheckSpool()
	if self:GetSpooling() then
		if not self:GetOwner():KeyDown(IN_ATTACK) and not self:GetOwner():KeyDown(IN_ATTACK2) then
			self:SetSpooling(false)
			self:GetOwner():ResetSpeed()
			self:SetNextPrimaryFire(CurTime() + 0.75)
			self:EmitSound("ambient/machines/spindown.wav", 75, 150)
		else
			self:SetSpool(math.min(self:GetSpool() + FrameTime() * 0.2, 1))
		end

		self.ChargeSound:PlayEx(1, math.min(255, 45 + self:GetSpool() * 55))
		self.ChargeSound2:PlayEx(1, math.min(255, 35 + self:GetSpool() * 25))
	else
		self:SetSpool(math.max(0, self:GetSpool() - FrameTime() * 0.36))
		self.ChargeSound:Stop()
		self.ChargeSound2:Stop()
	end
end
if SERVER then
	function SWEP:Think()
		self:CheckSpool()

		if self.IdleAnimation and self.IdleAnimation <= CurTime() then
			self.IdleAnimation = nil
			self:SendWeaponAnim(ACT_VM_IDLE)
		end
	end
end
if not CLIENT then return end

function SWEP:Think()
	self:CheckSpool()
end
local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colWhite = Color(220, 220, 220, 230)
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local matGradientRight = CreateMaterial("gradient-r", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-r", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
local colBG = Color(16, 16, 16, 90)
local colRed = Color(220, 0, 0, 230)
local colYellow = Color(220, 220, 0, 230)
local colWhite = Color(220, 220, 220, 230)
local colAmmo = Color(255, 255, 255, 230)
local function GetAmmoColor(clip, maxclip)
	if clip == 0 then
		colAmmo.r = 255 colAmmo.g = 0 colAmmo.b = 0
	else
		local sat = clip / maxclip
		colAmmo.r = 255
		colAmmo.g = sat ^ 0.3 * 255
		colAmmo.b = sat * 255
	end
end

function SWEP:GetDisplayAmmo(clip, spare, maxclip)
	if self.RequiredClip ~= 1 then
		clip = math.floor(clip / self.RequiredClip)
		spare = math.floor(spare / self.RequiredClip)
		maxclip = math.ceil(maxclip / self.RequiredClip)
	end

	if self.AmmoUse then
		clip = math.floor(clip / self.AmmoUse)
		spare = math.floor(spare / self.AmmoUse)
		maxclip = math.ceil(maxclip / self.AmmoUse)
	end

	return clip, spare, maxclip
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 128, 64
	local x, y = wid * -0.6, hei * -0.5
	local spare = self:GetPrimaryAmmoCount()

	cam.Start3D2D(pos, ang, self.HUD3DScale / 2)
		surface.SetDrawColor( 0, 0, 0, 150 )
		surface.DrawRect( x, y, wid, hei )

		draw.SimpleTextBlurry(spare, spare >= 1000 and "ZS3D2DFontSmall" or "ZS3D2DFont", x + wid * 0.5, y + hei * 0.5, spare == 0 and colRed or colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end

local ghostlerp = 0
function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
	local Offset = self.IronSightsPos
	if self.IronSightsAng then
		ang = Angle(ang.p, ang.y, ang.r)
		ang:RotateAroundAxis(ang:Right(), self.IronSightsAng.x)
		ang:RotateAroundAxis(ang:Up(), self.IronSightsAng.y)
		ang:RotateAroundAxis(ang:Forward(), self.IronSightsAng.z)
	end

	pos = pos + Offset.x * ang:Right() + Offset.y * ang:Forward() + Offset.z * ang:Up()

	if not self:GetSpooling() then
		ghostlerp = math.min(1, ghostlerp + FrameTime() * 1)
	elseif ghostlerp > 0 then
		ghostlerp = math.max(0, ghostlerp - FrameTime() * 1.5)
	end

	if ghostlerp > 0 then
		pos = pos - 35.5 * ghostlerp * ang:Up()
		self.HUD3DAng = Angle( 180, 0, -90 * ghostlerp )
		ang:RotateAroundAxis(ang:Right(), 70 * ghostlerp)
	end

	local VElementes = self.VElements
	local WElementes = self.WElements
	local var = ( self:GetNextPrimaryFire()+2 ) - CurTime()
	if VElementes then
		VElementes[ "barrels" ].angle = VElementes["barrels"].angle + Angle( 0, var > 0 and 3 * var * self:GetSpool() or 3 * self:GetSpool(), 0 )
	end

	if WElementes then
		WElementes[ "barrels" ].angle = WElementes["barrels"].angle + Angle( 0, 0, 0 )
	end

	return pos, ang
end
