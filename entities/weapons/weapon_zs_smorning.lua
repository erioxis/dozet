AddCSLuaFile()

--SWEP.PrintName = "'Redeemers' Dual Handguns"
SWEP.PrintName = ""..translate.Get("wep_smorning")
SWEP.Description = ""..translate.Get("wep_d_smorning")

SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.slide_right"
	SWEP.HUD3DPos = Vector(1, 0.1, -1)
	SWEP.HUD3DScale = 0.015
	SWEP.VElements = {
		["балка1"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(2.05798, -6e-05, -0.00507), angle = Angle(89.99601, 89.99997, 0), size = Vector(0.019, 0.022, 0.426), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(-1.754, -0.00012, 1.05603), angle = Angle(74.99997, 4e-05, -3e-05), size = Vector(0.079, 0.039, 0.099), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(0.583, 0.003, 1.048), angle = Angle(0, 0, 90), size = Vector(0.11, 0.05, 0.106), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(2.058, 0, -0.005), angle = Angle(90.004, 0, 90), size = Vector(0.019, 0.022, 0.426), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(-1.754, 0, 1.056), angle = Angle(75, 0, 0), size = Vector(0.079, 0.039, 0.099), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(3.396, 0.003, 5.267), angle = Angle(-15, 0, 90), size = Vector(0.022, 0.217, 0.425), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(4.467, 0, 3.564), angle = Angle(-15, 0, 90), size = Vector(0.025, 0.241, 0.484), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(3.76199, -9e-05, 4.11804), angle = Angle(-14.99999, 0, 90.00005), size = Vector(0.01, 0.226, 0.484), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка1++++++++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(0.583, 0, 1.353), angle = Angle(0, 0, 90), size = Vector(0.11, 0.05, 0.106), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(3.396, 0.003, 5.267), angle = Angle(-15, 0, 90), size = Vector(0.022, 0.217, 0.425), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(4.467, 0, 3.564), angle = Angle(-15, 0, 90), size = Vector(0.025, 0.241, 0.484), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "начало1", pos = Vector(3.762, 0, 4.118), angle = Angle(-15, 0, 90), size = Vector(0.01, 0.226, 0.484), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка2"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(2.46603, -3e-05, -2.06201), angle = Angle(0, 0, 0), size = Vector(0.057, 0.031, 0.276), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка2+"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(1.60199, -3e-05, -0.78595), angle = Angle(0, 0, 0), size = Vector(0.031, 0.031, 0.219), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка2++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "начало1+", pos = Vector(1.84702, -6e-05, -1.37585), angle = Angle(0, 0, 0), size = Vector(0.031, 0.031, 0.188), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка2+++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.Bip01_L_Forearm", rel = "начало1", pos = Vector(2.466, 0, -2.062), angle = Angle(0, 0, 0), size = Vector(0.057, 0.031, 0.276), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка2++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.Bip01_L_Forearm", rel = "начало1", pos = Vector(1.847, 0, -0.786), angle = Angle(0, 0, 0), size = Vector(0.031, 0.031, 0.219), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка2+++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.Bip01_L_Forearm", rel = "начало1", pos = Vector(1.847, 0, -1.376), angle = Angle(0, 0, 0), size = Vector(0.031, 0.031, 0.188), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка3"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(-0.855, -1.258, -0.702), angle = Angle(0, 0, 0), size = Vector(0.019, 0.019, 0.469), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3+"] = { type = "Model", model = "models/maxofs2d/hover_plate.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0, -5.713, 0), angle = Angle(0, 0, -90), size = Vector(0.075, 0.093, 0.226), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка3++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0, -6.164, 0), angle = Angle(0, 0, -90), size = Vector(0.014, 0.014, 0.014), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3+++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0.156, -1.382, 0.734), angle = Angle(0, 0, 180), size = Vector(0.019, 0.019, 0.493), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3++++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(-0.855, -1.258, -0.702), angle = Angle(0, 0, 0), size = Vector(0.019, 0.019, 0.469), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка3+++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0, -6.164, 0), angle = Angle(0, 0, -90), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка3++++++"] = { type = "Model", model = "models/maxofs2d/hover_plate.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0, -5.713, 0), angle = Angle(0, 0, -90), size = Vector(0.075, 0.093, 0.226), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка3+++++++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0.156, -1.382, 0.733), angle = Angle(0, 0, 180), size = Vector(0.019, 0.019, 0.493), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка4"] = { type = "Model", model = "models/hunter/misc/platehole1x1d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0.42, -5.644, 0), angle = Angle(-180, -90, 0), size = Vector(0.026, 0.042, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0.234, 0.041, 0), angle = Angle(-180, -73.66, 0), size = Vector(0.015, 0.015, 0.487), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(-0.586, -0.956, 0), angle = Angle(-180, 0, 0), size = Vector(0.021, 0.021, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0.234, 1.495, 0), angle = Angle(-180, 170.513, 0), size = Vector(0.01, 0.01, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(-1.064, -4.315, 0), angle = Angle(-180, -138.451, 0), size = Vector(0.015, 0.015, 0.437), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(-0.586, -5.034, 0), angle = Angle(-180, 0, 0), size = Vector(0.02, 0.034, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(-1.066, -4.312, 0), angle = Angle(-180, -90, 0), size = Vector(0.015, 0.015, 0.437), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++++++"] = { type = "Model", model = "models/hunter/misc/platehole1x1d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0.42, -5.644, 0), angle = Angle(-180, -90, 0), size = Vector(0.026, 0.042, 0.487), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_L_parent", rel = "балка1++++++++++", pos = Vector(0.234, 0.041, 0), angle = Angle(-180, -73.66, 0), size = Vector(0.015, 0.015, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(-0.586, -0.956, 0), angle = Angle(-180, 0, 0), size = Vector(0.021, 0.021, 0.487), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(-1.064, -4.315, 0), angle = Angle(-180, -138.451, 0), size = Vector(0.015, 0.015, 0.437), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(-0.586, -5.034, 0), angle = Angle(-180, 0, 0), size = Vector(0.02, 0.034, 0.488), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(-1.066, -4.312, 0), angle = Angle(-180, -90, 0), size = Vector(0.015, 0.015, 0.437), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка4+++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++", pos = Vector(0.234, 1.495, 0), angle = Angle(-180, 170.513, 0), size = Vector(0.01, 0.01, 0.487), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка5++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++++++", pos = Vector(0.214, 3.481, 0), angle = Angle(0, 0, 0), size = Vector(0.029, 0.029, 0.489), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5+++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++++++", pos = Vector(-0.945, 2.655, 0), angle = Angle(0, 45, 0), size = Vector(0.04, 0.04, 0.487), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++++++", pos = Vector(-0.029, 3.236, 0), angle = Angle(0, 45, 0), size = Vector(0.01, 0.025, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5+++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.m9a1_R_parent", rel = "балка1++++++++++", pos = Vector(0.321, -1.115, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.194, 0.489), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.elite_right", rel = "начало1+", pos = Vector(5.082, -0.002, 4.544), angle = Angle(14.978, -180, -90), size = Vector(0.01, 0.194, 0.487), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5++++++++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0.02, -3.865, 0.08), angle = Angle(-90, 90, -90), size = Vector(0.028, 0.028, 0.489), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5+++++++++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0.02, -2.684, 0.909), angle = Angle(-45, 90, -90), size = Vector(0.041, 0.041, 0.489), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0.02, -3.616, 0.334), angle = Angle(-45, -90, -90), size = Vector(0.01, 0.025, 0.496), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка6"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.magazine_right", rel = "", pos = Vector(0.486, -4.075, 0.058), angle = Angle(-63.528, 89.422, 89.579), size = Vector(0.011, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка6+"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(-0.66962, 1.53302, -0.47809), angle = Angle(89.99979, -26.46306, 0), size = Vector(0.066, 0.426, 0.133), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка6++"] = { type = "Model", model = "models/props_c17/gravestone_coffinpiece002a.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(-0.34692, 0.80566, -0.13895), angle = Angle(7e-05, -116.46304, -0.00014), size = Vector(0.03, 0.03, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/black_brushes", skin = 0, bodygroup = {} },
		["балка6+++"] = { type = "Model", model = "models/hunter/plates/plate025.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(-0.078, 0.252, -0.039), angle = Angle(0, 153.537, 0), size = Vector(0.031, 0.097, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/road", skin = 0, bodygroup = {} },
		["балка6++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(-0.05377, 0.33594, 0.00406), angle = Angle(0.0001, 63.65693, -0.00016), size = Vector(0.01, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка6+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(-0.11951, 0.30209, 0.00104), angle = Angle(0.00011, 63.53692, -179.99989), size = Vector(0.01, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка6++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.elite_left", rel = "балка6", pos = Vector(0.09137, 0.04419, 3e-05), angle = Angle(0.00025, 127.07392, -179.99997), size = Vector(0.011, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка7"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.485, -1.615, 0.025), angle = Angle(-61.583, 90, 90), size = Vector(0.011, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка7+"] = { type = "Model", model = "models/hunter/blocks/cube025x025x025.mdl", bone = "v_weapon.magazine_left", rel = "", pos = Vector(0.033, -2.075, 0), angle = Angle(-0.187, 0.201, -0.008), size = Vector(0.066, 0.426, 0.133), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка7++"] = { type = "Model", model = "models/props_c17/gravestone_coffinpiece002a.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.354, -0.716, 0.021), angle = Angle(-180, 90, -90), size = Vector(0.03, 0.03, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/black_brushes", skin = 0, bodygroup = {} },
		["балка7+++"] = { type = "Model", model = "models/hunter/plates/plate025.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.484, -1.437, 0.024), angle = Angle(90, 90, 90), size = Vector(0.031, 0.097, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/road", skin = 0, bodygroup = {} },
		["балка7++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.486, -1.343, -0.016), angle = Angle(0, 90, 90), size = Vector(0.01, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка7+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.486, -1.34, 0.056), angle = Angle(0, 90, -90), size = Vector(0.01, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["балка7++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2c.mdl", bone = "v_weapon.elite_right", rel = "балка7+", pos = Vector(-0.484, -1.615, 0.001), angle = Angle(63.537, 90, -90), size = Vector(0.011, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["начало1"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(0, -0.275, -0.837), angle = Angle(16.778, 90, 0), size = Vector(0.143, 0.035, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0.01498, -0.271, -1.14203), angle = Angle(16.77799, 89.99998, 2e-05), size = Vector(0.143, 0.035, 0.079), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "v_weapon.elite_left", rel = "начало1", pos = Vector(2.616, 0, 2.698), angle = Angle(-105, -1.5, 0), size = Vector(0.795, 0.579, 0.803), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1+++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "v_weapon.elite_left", rel = "начало1+", pos = Vector(2.61598, -6e-05, 2.698), angle = Angle(-75, 178.49995, 179.99992), size = Vector(0.795, 0.579, 0.803), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["балка1"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(2.058, 0, -0.005), angle = Angle(89.996, 90, 0), size = Vector(0.019, 0.022, 0.426), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(-1.754, 0, 1.056), angle = Angle(75, 0, 0), size = Vector(0.079, 0.039, 0.099), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(0.583, 0.003, 1.048), angle = Angle(0, 0, 90), size = Vector(0.11, 0.05, 0.106), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(2.058, 0, -0.005), angle = Angle(90.004, 0, 90), size = Vector(0.019, 0.022, 0.426), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(-1.754, 0, 1.056), angle = Angle(75, 0, 0), size = Vector(0.079, 0.039, 0.099), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(3.396, 0.003, 5.267), angle = Angle(-15, 0, 90), size = Vector(0.022, 0.217, 0.425), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(4.467, 0, 3.564), angle = Angle(-15, 0, 90), size = Vector(0.025, 0.241, 0.484), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(3.762, 0, 4.118), angle = Angle(-15, 0, 90), size = Vector(0.01, 0.226, 0.484), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка1++++++++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(0.583, 0, 1.353), angle = Angle(0, 0, 90), size = Vector(0.11, 0.05, 0.106), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(3.396, 0.003, 5.267), angle = Angle(-15, 0, 90), size = Vector(0.022, 0.217, 0.425), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка1++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(4.467, 0, 3.564), angle = Angle(-15, 0, 90), size = Vector(0.025, 0.241, 0.484), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["балка1+++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(3.762, 0, 4.118), angle = Angle(-15, 0, 90), size = Vector(0.01, 0.226, 0.484), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++++++", pos = Vector(-0.855, -1.258, -0.702), angle = Angle(0, 0, 0), size = Vector(0.019, 0.019, 0.469), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++++++", pos = Vector(0, -5.701, 0), angle = Angle(0, 0, -90), size = Vector(0.014, 0.014, 0.014), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3+++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++++++", pos = Vector(0.156, -1.382, 0.734), angle = Angle(0, 0, 180), size = Vector(0.019, 0.019, 0.493), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["балка3++++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++", pos = Vector(-0.855, -1.258, -0.702), angle = Angle(0, 0, 0), size = Vector(0.019, 0.019, 0.469), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка3+++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++", pos = Vector(0, -5.689, -0.064), angle = Angle(0, 0, -90), size = Vector(0.014, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка3+++++++"] = { type = "Model", model = "models/hunter/geometric/para1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++", pos = Vector(0.156, -1.382, 0.733), angle = Angle(0, 0, 180), size = Vector(0.019, 0.019, 0.493), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["балка5++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++++++", pos = Vector(-0.029, 3.236, 0), angle = Angle(0, 45, 0), size = Vector(0.01, 0.025, 0.49), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5+++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "балка1++++++++++", pos = Vector(0.321, -1.115, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.194, 0.489), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["балка5++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(5.082, -0.002, 4.544), angle = Angle(14.978, -180, -90), size = Vector(0.01, 0.194, 0.487), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["начало1"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.244, 0.771, 0.72), angle = Angle(103.861, 161.39101, 3.297), size = Vector(0.143, 0.035, 0.079), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.978, 1.251, -1.541), angle = Angle(-81.377, -11.845, 1.8), size = Vector(0.143, 0.035, 0.079), color = Color(44, 44, 44, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1", pos = Vector(2.616, 0, 2.698), angle = Angle(-105, -1.5, 0), size = Vector(0.795, 0.579, 0.803), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["начало1+++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "начало1+", pos = Vector(2.616, 0, 2.698), angle = Angle(-75, 178.5, 180), size = Vector(0.795, 0.579, 0.803), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "duel"
SWEP.ShowWorldModel = false
SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.UseHands = true
SWEP.Souleater = 1
SWEP.Tier = 6

SWEP.Primary.Sound = Sound("Weapon_ELITE.Single")
SWEP.Primary.Damage = 47
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.DefaultClip = 150

SWEP.ConeMax = 2.75
SWEP.ConeMin = 2.1
SWEP.MultiplierOfShots = 0


GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_smorning_r1"), translate.Get("wep_d_smorning_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.50

	wept.BulletCallback = function(attacker, tr, dmginfo)
		local ent = tr.Entity
		if SERVER and math.random(7) == 1 and ent:IsValidLivingZombie() then
			ent:GiveStatus("hollowing",300)
			attacker:SetHealth(math.min(attacker:GetMaxHealth(), attacker:Health() + (attacker:GetMaxHealth() * 1.11))) 
		end
	end 
	
	if SERVER then
		return
	else
	wept.VElements["балка1+"].color = Color(230, 150, 100)
	wept.VElements["балка1++"].color = Color(230, 150, 100)
	wept.VElements["балка1+++"].color = Color(230, 150, 100)
	wept.VElements["балка1++++"].color = Color(230, 150, 100)
	wept.WElements["балка1+"].color = Color(230, 150, 100)
	wept.WElements["балка1++"].color = Color(230, 150, 100)
	wept.WElements["балка1+++"].color = Color(230, 150, 100)
	wept.WElements["балка1++++"].color = Color(230, 150, 100)
	wept.VElements["балка1+++++"].color = Color(230, 150, 100)
	wept.VElements["балка1++++++"].color = Color(230, 150, 100)
	wept.VElements["балка1+++++++"].color = Color(230, 150, 100)
	wept.VElements["балка1++++++++"].color = Color(230, 150, 100)
	wept.WElements["балка1"].color = Color(230, 150, 100)
	end
end)
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitFireSound()
	self.IdleAnimation = CurTime() + self:SequenceDuration()
	if SERVER then
		self:TakeAmmo()
		self:ShootBullets(self.Primary.Damage + (self.Primary.Damage * self.MultiplierOfShots / 4), self.Primary.NumShots, self:GetCone())
		self.MultiplierOfShots = self.MultiplierOfShots + 1
	end
	if self.MultiplierOfShots >= 5 then
		self.MultiplierOfShots = self.MultiplierOfShots - 4
	end
end

function SWEP:SecondaryAttack()
end


function SWEP:SendWeaponAnimation()
	self:SendWeaponAnim(self:Clip1() % 2 == 0 and ACT_VM_PRIMARYATTACK or ACT_VM_SECONDARYATTACK)
end


if not CLIENT then return end

function SWEP:GetTracerOrigin()
	local owner = self:GetOwner()
	if owner:IsValid() then
		local vm = owner:GetViewModel()
		if vm and vm:IsValid() then
			local attachment = vm:GetAttachment(self:Clip1() % 2 + 3)
			if attachment then
				return attachment.Pos
			end
		end
	end
end

