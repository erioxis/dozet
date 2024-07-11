AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

SWEP.PrintName = translate.Get("wep_dsg53")
SWEP.Description = translate.Get("wep_d_dsg53")

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.HUD3DBone = "v_weapon.AK47_Parent"
	SWEP.HUD3DPos = Vector(-2.5, -5, -4) 
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015

	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 72
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(8.625, 8.989, 0) },
		["ValveBiped.Bip01_L_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -9.908, 0) },
		["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(-4.666, -0.45, 0.103), angle = Angle(0, 0, 0) },
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 12.588, 0) },
		["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-14.235, -8.961, -7.151) },
		["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -21.115, 0) },
		["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -28.025, 0) },
		["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0.083, 0), angle = Angle(-1.657, -0.982, 0) },
		["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(5.774, -33.521, 0) },
		["ValveBiped.Bip01_R_Finger32"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 17.906, 0) },
		["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(6.436, -38.985, 13.206) },
		["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 2.858, 0), angle = Angle(0, 0, 0) },
		["v_weapon.AK47_Parent"] = { scale = Vector(1, 1, 1), pos = Vector(0.291, -1.249, 1.485), angle = Angle(-5.697, -0.616, 4.511) }
	}

	SWEP.VElements = {
		["CLIP"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "v_weapon.AK47_Clip", rel = "", pos = Vector(0.272, -0.119, 3.707), angle = Angle(1.917, -1.861, -90.365), size = Vector(0.266, 0.266, 0.266), color = Color(131, 147, 193, 255), surpresslightning = false, material = "models/combine_citadel/combine_citadel001", skin = 0, bodygroup = {} },
		["CLIP+"] = { type = "Model", model = "models/mechanics/robotics/claw.mdl", bone = "v_weapon.AK47_Clip", rel = "", pos = Vector(-0.83, 0.717, 4.078), angle = Angle(0.186, -122.786, -1.762), size = Vector(0.092, 0.092, 0.092), color = Color(121, 138, 189, 255), surpresslightning = false, material = "models/combine_citadel/combine_citadel001", skin = 0, bodygroup = {} },
		["element_name"] = { type = "Model", model = "models/hunter/misc/roundthing1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.582, 0.948, -0.124), angle = Angle(2.309, -91.247, 117.021), size = Vector(0.018, 0.027, 0.029), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.098, 1.223, -1.821), angle = Angle(2.621, -180, 1.205), size = Vector(0.88, 0.708, 0.486), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.786, 1.241, 1.32), angle = Angle(2.994, -180, 180), size = Vector(0.88, 0.307, 0.922), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.21, 0.626, -3.915), angle = Angle(90, -90, 180), size = Vector(0.03, 0.108, 0.03), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/Mechanics/robotics/b1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.211, 1.432, -5.002), angle = Angle(-30.262, 180, 179.656), size = Vector(0.032, 0.032, 0.032), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/Mechanics/robotics/b1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.211, 1.292, -4.981), angle = Angle(-30.262, 180, -0.055), size = Vector(0.032, 0.032, 0.032), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++"] = { type = "Model", model = "models/Mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.749, 1.35, -4.63), angle = Angle(-27.077, 180, 179.656), size = Vector(0.032, 0.017, 0.018), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++"] = { type = "Model", model = "models/props_phx/gears/rack9.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.708, 1.381, -3.995), angle = Angle(180, 90.26, -0.055), size = Vector(0.16, 0.263, 0.134), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++"] = { type = "Model", model = "models/mechanics/articulating/arm_base_b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.795, 1.85, -4.685), angle = Angle(180, 90.26, -0.055), size = Vector(0.028, 0.028, 0.028), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++"] = { type = "Model", model = "models/mechanics/articulating/arm2x20d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-5.18, 1.815, -4.245), angle = Angle(180, 88.099, -0.055), size = Vector(0.012, 0.012, 0.012), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++"] = { type = "Model", model = "models/noesis/donut.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-4.14, 1.251, -3.929), angle = Angle(-180, 1.248, 90.231), size = Vector(0.652, 0.09, 0.142), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.642, 1.99, -4.27), angle = Angle(-134.426, 0.035, 90.435), size = Vector(0.034, 0.034, 0.034), color = Color(153, 153, 153, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.358, 1.988, -4.239), angle = Angle(-134.426, 0.035, 90.435), size = Vector(0.034, 0.034, 0.034), color = Color(155, 155, 155, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.705, 1.96, -4.165), angle = Angle(-134.426, 0.035, 90.435), size = Vector(0.034, 0.034, 0.034), color = Color(155, 152, 152, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.447, 1.396, -2.37), angle = Angle(172.001, -2.813, 130.58), size = Vector(0.407, 0.254, 0.254), color = Color(82, 82, 82, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++"] = { type = "Model", model = "models/props_phx/rocket1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.404, 1.355, -3.699), angle = Angle(90.184, -0.477, 180), size = Vector(0.014, 0.014, 0.014), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++"] = { type = "Model", model = "models/props_phx/normal_tire.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.39, 1.289, -3.202), angle = Angle(90.184, -1.361, 180), size = Vector(0.085, 0.059, 0.085), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++"] = { type = "Model", model = "models/props_c17/gravestone004a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.257, 2.035, -4.006), angle = Angle(180, -90.822, 0.697), size = Vector(0.018, 0.018, 0.018), color = Color(155, 152, 152, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++"] = { type = "Model", model = "models/mechanics/robotics/d1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.941, 2.088, -3.379), angle = Angle(6.44, -180, 0.384), size = Vector(0.043, 0.043, 0.043), color = Color(95, 95, 95, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.255, 1.764, -4.088), angle = Angle(-0.58, -90.95, 0.384), size = Vector(0.016, 0.016, 0.016), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-7.219, 1.695, -3.915), angle = Angle(-0.58, -90.95, 0.384), size = Vector(0.016, 0.016, 0.016), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.973, 1.774, -3.672), angle = Angle(-0.58, -90.95, 0.384), size = Vector(0.016, 0.016, 0.016), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.581, 1.825, -4.281), angle = Angle(-0.58, -90.95, 0.384), size = Vector(0.016, 0.016, 0.016), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} }
	}
		
	SWEP.WElements = {
		["BOLT"] = { type = "Model", model = "models/mechanics/gears2/pinion_20t2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.6449999809265, 2.0439999103546, -3.1619999408722), angle = Angle(-179.7619934082, 0.69900000095367, 179.05700683594), size = Vector(0.061999998986721, 0.037000000476837, 0.037000000476837), color = Color(255, 255, 164, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["BOLT+"] = { type = "Model", model = "models/mechanics/roboticslarge/b1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.246000289917, 2.1730000972748, -3.1500000953674), angle = Angle(173.30999755859, 78.383003234863, 18.440000534058), size = Vector(0.014000000432134, 0.018999999389052, 0.014000000432134), color = Color(255, 255, 164, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["CLIP"] = { type = "Model", model = "models/Items/BoxSRounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(8.4689998626709, 1.4170000553131, 1.2929999828339), angle = Angle(-0.3289999961853, -90.111999511719, 180), size = Vector(0.266999989748, 0.266999989748, 0.266999989748), color = Color(171, 192, 255, 255), surpresslightning = false, material = "models/combine_citadel/combine_citadel001", skin = 0, bodygroup = {} },
		["element_name"] = { type = "Model", model = "models/hunter/misc/roundthing1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.6080000400543, 1.2369999885559, 0.0080000003799796), angle = Angle(2.3099999427795, -91.246002197266, 117.02100372314), size = Vector(0.018999999389052, 0.027000000700355, 0.037999998778105), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/Items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.73100000619888, 1.2970000505447, -1.9069999456406), angle = Angle(2.6219999790192, -180, 1.2050000429153), size = Vector(0.88099998235703, 0.70800000429153, 0.48699998855591), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++"] = { type = "Model", model = "models/hunter/misc/roundthing3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.239000082016, 0.61000001430511, -3.9660000801086), angle = Angle(90, -90, 180), size = Vector(0.030999999493361, 0.10800000280142, 0.030999999493361), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/Mechanics/robotics/b1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.2109999656677, 1.432000041008, -5.0019998550415), angle = Angle(-30.261999130249, 180, 179.65600585938), size = Vector(0.032999999821186, 0.032999999821186, 0.032999999821186), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/Mechanics/robotics/b1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.2109999656677, 1.2929999828339, -4.9809999465942), angle = Angle(-30.261999130249, 180, -0.054999999701977), size = Vector(0.032999999821186, 0.032999999821186, 0.032999999821186), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++"] = { type = "Model", model = "models/Mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.74899995327, 1.3509999513626, -4.6290001869202), angle = Angle(-27.076999664307, 180, 179.65600585938), size = Vector(0.032999999821186, 0.017000000923872, 0.018999999389052), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++"] = { type = "Model", model = "models/props_phx/gears/rack9.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.7080001831055, 1.3819999694824, -3.9949998855591), angle = Angle(180, 90.26000213623, -0.054999999701977), size = Vector(0.16099999845028, 0.26300001144409, 0.13400000333786), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++"] = { type = "Model", model = "models/mechanics/articulating/arm_base_b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.795999526978, 1.8509999513626, -4.6840000152588), angle = Angle(180, 90.26000213623, -0.054999999701977), size = Vector(0.028000000864267, 0.028000000864267, 0.028000000864267), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++"] = { type = "Model", model = "models/mechanics/articulating/arm2x20d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-5.1799998283386, 1.8159999847412, -4.2449998855591), angle = Angle(180, 88.099998474121, -0.054999999701977), size = Vector(0.012000000104308, 0.012000000104308, 0.012000000104308), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++"] = { type = "Model", model = "models/noesis/donut.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-4.1399998664856, 1.25100004673, -3.9289999008179), angle = Angle(-180, 1.2480000257492, 90.231002807617), size = Vector(0.65200001001358, 0.090999998152256, 0.14200000464916), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.6410000324249, 1.9900000095367, -4.2690000534058), angle = Angle(-134.42500305176, 0.035999998450279, 90.435997009277), size = Vector(0.034000001847744, 0.034000001847744, 0.034000001847744), color = Color(153, 153, 153, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.3589999675751, 1.9880000352859, -4.2389998435974), angle = Angle(-134.42500305176, 0.035999998450279, 90.435997009277), size = Vector(0.034000001847744, 0.034000001847744, 0.034000001847744), color = Color(155, 155, 155, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++"] = { type = "Model", model = "models/mechanics/solid_steel/crossbeam_4.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.7059998512268, 1.9609999656677, -4.164999961853), angle = Angle(-134.42500305176, 0.035999998450279, 90.435997009277), size = Vector(0.034000001847744, 0.034000001847744, 0.034000001847744), color = Color(155, 152, 152, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.965999603271, 1.152999997139, -2.4679999351501), angle = Angle(157.74200439453, -1.7480000257492, 130.44999694824), size = Vector(0.35600000619888, 0.35600000619888, 0.35600000619888), color = Color(82, 82, 82, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++"] = { type = "Model", model = "models/props_phx/rocket1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.663000106812, 1.3370000123978, -3.9360001087189), angle = Angle(90.184997558594, -0.47699999809265, 180), size = Vector(0.016000000759959, 0.016000000759959, 0.016000000759959), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++"] = { type = "Model", model = "models/props_phx/normal_tire.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.390000343323, 1.2890000343323, -3.2019999027252), angle = Angle(90.184997558594, -1.3600000143051, 180), size = Vector(0.08500000089407, 0.059999998658895, 0.08500000089407), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++"] = { type = "Model", model = "models/props_c17/gravestone004a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.2560000419617, 2.0350000858307, -4.0050001144409), angle = Angle(180, -90.821998596191, 0.69700002670288), size = Vector(0.018999999389052, 0.018999999389052, 0.018999999389052), color = Color(155, 152, 152, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++"] = { type = "Model", model = "models/mechanics/robotics/d1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.941999912262, 2.0889999866486, -3.3789999485016), angle = Angle(6.4400000572205, -180, 0.38400000333786), size = Vector(0.043999999761581, 0.043999999761581, 0.043999999761581), color = Color(95, 95, 95, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-6.2540001869202, 1.7640000581741, -4.0879998207092), angle = Angle(-0.5799999833107, -90.949996948242, 0.38400000333786), size = Vector(0.016000000759959, 0.016000000759959, 0.016000000759959), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-7.2189998626709, 1.6959999799728, -3.914999961853), angle = Angle(-0.5799999833107, -90.949996948242, 0.38400000333786), size = Vector(0.016000000759959, 0.016000000759959, 0.016000000759959), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name+++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.9739999771118, 1.7749999761581, -3.6710000038147), angle = Angle(-0.5799999833107, -90.949996948242, 0.38400000333786), size = Vector(0.016000000759959, 0.016000000759959, 0.016000000759959), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name++++++++++++++++++++++"] = { type = "Model", model = "models/mechanics/roboticslarge/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10.581000328064, 1.8259999752045, -4.2800002098083), angle = Angle(-0.5799999833107, -90.949996948242, 0.38400000333786), size = Vector(0.016000000759959, 0.016000000759959, 0.016000000759959), color = Color(59, 59, 59, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "smg"

SWEP.Tier = 2
SWEP.Hidden = true

SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.UseHands = true
SWEP.ShowWorldModel = false
SWEP.ShowViewModel = false
SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.BobScale = -1.1
SWEP.Recoil	= 0.45
SWEP.Primary.Damage = 35
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.18

SWEP.Primary.ClipSize = 26
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_SMG1
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SMG1

SWEP.ReloadSpeed = 0.85
SWEP.FireAnimSpeed = 1.15

SWEP.HeadshotMulti = 1.5

SWEP.ConeMax = 4
SWEP.ConeMin = 2
SWEP.SSound = 130
SWEP.SSound1 = 135

SWEP.IronSightsPos = Vector(-4.243, -1.953, 4.15)
SWEP.IronSightsAng = Vector(-4.572, 7.354, 0)

SWEP.VMPos = Vector(0, 0, -1.5)

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.3 )
GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.2 )

function SWEP:EmitFireSound()
	self:EmitSound( "weapons/ar550_fire2.wav", 75, math.random( 75, 80 ), 0.5 )
end

function SWEP:SetIronsights(b)
	if self:GetIronsights() ~= b then
		if b then
			self:GetOwner():EmitSound( "weapons/ar550_deploy2.wav", 40, self.SSound )
		else
			self:GetOwner():EmitSound( "weapons/ar550_deploy1.wav", 40, self.SSound )
		end
	end

	self.BaseClass.SetIronsights( self, b )
end