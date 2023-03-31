AddCSLuaFile()

SWEP.Base = "weapon_zs_fistz"

--SWEP.PrintName = "Power Fists"
--SWEP.Description = "A pair of power fists. They are slower than conventional fist combat, but pack a hefty pulse powered punch."
SWEP.PrintName = translate.Get("wep_powerfists7")
SWEP.Description =translate.Get("wep_d_powerfists7")
if CLIENT then
	SWEP.HoldType = "fist"
	SWEP.ViewModelFOV = 70
	SWEP.ViewModelFlip = false
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_L_Forearm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(13.965, 0, 0) },
		["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(10.564, 0, -4.177), angle = Angle(0, 0, 0) },
		["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(2.932, -0.156, 1.138), angle = Angle(0, 15.57, -9.151) }
	}
	
	SWEP.SCKMaterials = {"metal/imetal003", "metal/citadel_metalwall078a",}
	
	SWEP.IronSightsPos = Vector(3.8, 0, 1.88)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["right_hand"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0.985, 2.139), angle = Angle(1.304, 0, 180), size = Vector(0.01, 0.01, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 10"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7", pos = Vector(0.025, 0.216, 0), angle = Angle(0, 168.258, 0), size = Vector(0.033, 0.011, 0.016), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/spawn_effect2", skin = 0, bodygroup = {} },
		["right_hand 10+"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7+", pos = Vector(0.249, 0.22, 0), angle = Angle(0, 162.064, 0), size = Vector(0.023, 0.013, 0.016), color = Color(127, 255, 0, 255), surpresslightning = false, material = "models/props_combine/tpballglow", skin = 0, bodygroup = {} },
		["right_hand 12"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01", rel = "right_hand 7", pos = Vector(-7.218, -1.627, 0.06), angle = Angle(0, 168.041, 180), size = Vector(0.163, 0.022, 0.02), color = Color(210, 210, 210, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 12+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01", rel = "right_hand 7+", pos = Vector(-7.218, -1.627, 0.06), angle = Angle(0, 168.041, 180), size = Vector(0.163, 0.022, 0.02), color = Color(181, 115, 51, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 13"] = { type = "Model", model = "models/items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(0.678, 0, 2.44), angle = Angle(91.065, -180, 0), size = Vector(0.271, 0.271, 0.271), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 13+"] = { type = "Model", model = "models/items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(0.678, 0, 2.44), angle = Angle(91.065, -180, 0), size = Vector(0.271, 0.271, 0.271), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 14"] = { type = "Model", model = "models/gibs/scanner_gib01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(2.561, 0, 1.931), angle = Angle(-55.652, 0, 0), size = Vector(0.109, 0.133, 0.133), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 14+"] = { type = "Model", model = "models/gibs/scanner_gib01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(2.561, 0, 1.931), angle = Angle(-55.652, 0, 0), size = Vector(0.109, 0.133, 0.133), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 15"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(2.97, 0.837, 0.867), angle = Angle(0, 0, -90), size = Vector(0.147, 0.163, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 15+"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(2.97, 0.837, 0.867), angle = Angle(0, 0, -90), size = Vector(0.147, 0.163, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 16"] = { type = "Model", model = "models/props_combine/breentp_rings.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(3.012, 0, 0.915), angle = Angle(0, 0, 90), size = Vector(0.006, 0.006, 0.006), color = Color(127, 255, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 16+"] = { type = "Model", model = "models/props_combine/breentp_rings.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(3.012, 0, 0.915), angle = Angle(0, 0, 90), size = Vector(0.006, 0.006, 0.006), color = Color(127, 255, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 2"] = { type = "Model", model = "models/props_phx/construct/metal_tube.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(0.27, 0.068, 3.964), angle = Angle(45, -18.445, 0), size = Vector(0.019, 0.019, 0.035), color = Color(193, 193, 193, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 2+"] = { type = "Model", model = "models/props_phx/construct/metal_tube.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(0.27, 0.068, 3.964), angle = Angle(45, -18.445, 0), size = Vector(0.019, 0.019, 0.035), color = Color(193, 193, 193, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 3"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(-0.155, -0.038, 3.822), angle = Angle(-72.368, -18.445, 0), size = Vector(0.005, 0.005, 0.07), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 3+"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(-0.155, -0.038, 3.822), angle = Angle(-72.368, -18.445, 0), size = Vector(0.005, 0.005, 0.07), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 4"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(0.082, 0.018, 2.036), angle = Angle(180, -66.128, -90), size = Vector(0.05, 0.047, 0.05), color = Color(161, 161, 161, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 4+"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(0.082, 0.018, 2.036), angle = Angle(180, -66.128, -90), size = Vector(0.05, 0.047, 0.05), color = Color(161, 161, 161, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 5"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01", rel = "right_hand", pos = Vector(-0.002, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.01), color = Color(131, 131, 131, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 5+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01", rel = "right_hand+", pos = Vector(-0.002, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.01), color = Color(131, 131, 131, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 6"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "ValveBiped.Bip01", rel = "right_hand", pos = Vector(6.9, 2.3, 4.133), angle = Angle(116.538, -18.5, 90), size = Vector(0.046, 0.197, 0.001), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/spawn_effect2", skin = 0, bodygroup = {} },
		["right_hand 6+"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "ValveBiped.Bip01", rel = "right_hand+", pos = Vector(6.9, 2.3, 4.133), angle = Angle(116.538, -18.5, 90), size = Vector(0.046, 0.197, 0.001), color = Color(127, 255, 0, 255), surpresslightning = false, material = "models/props_combine/tpballglow", skin = 0, bodygroup = {} },
		["right_hand 7"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(7.815, 2.648, 6.32), angle = Angle(13.609, -19, -90), size = Vector(0.002, 0.002, 0.002), color = Color(225, 242, 0, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 7+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(7.815, 2.648, 6.32), angle = Angle(13.609, -19, -90), size = Vector(0.002, 0.002, 0.002), color = Color(225, 242, 0, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 8"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(7.536, 2.526, 6.398), angle = Angle(-72.326, -19, 0), size = Vector(0.004, 0.004, 0.004), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 8+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(7.536, 2.526, 6.398), angle = Angle(-72.326, -19, 0), size = Vector(0.004, 0.004, 0.004), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 9"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7", pos = Vector(-7.66, -1.67, 0.059), angle = Angle(0, -102.009, -180), size = Vector(0.046, 0.172, 0.02), color = Color(210, 210, 210, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 9+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7+", pos = Vector(-7.66, -1.67, 0.059), angle = Angle(0, -102.009, -180), size = Vector(0.046, 0.172, 0.02), color = Color(184, 115, 51, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand+"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.181, 1.159, -1.934), angle = Angle(0, 42.996, 0), size = Vector(0.01, 0.01, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["right_hand"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 0.985, 1.6), angle = Angle(1.304, 0, 180), size = Vector(0.01, 0.01, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 10"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7", pos = Vector(0.025, 0.216, 0), angle = Angle(0, 168.258, 0), size = Vector(0.033, 0.011, 0.016), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/spawn_effect2", skin = 0, bodygroup = {} },
		["right_hand 10+"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7+", pos = Vector(0.249, 0.22, 0), angle = Angle(0, 162.064, 0), size = Vector(0.023, 0.013, 0.016), color = Color(127, 255, 0, 255), surpresslightning = false, material = "models/props_combine/tpballglow", skin = 0, bodygroup = {} },
		["right_hand 12"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7", pos = Vector(-7.218, -1.627, 0.06), angle = Angle(0, 168.041, 180), size = Vector(0.163, 0.022, 0.02), color = Color(210, 210, 210, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 12+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7+", pos = Vector(-7.218, -1.627, 0.06), angle = Angle(0, 168.041, 180), size = Vector(0.163, 0.022, 0.02), color = Color(181, 115, 51, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 13"] = { type = "Model", model = "models/items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(0.678, 0, 2.44), angle = Angle(91.065, -180, 0), size = Vector(0.271, 0.271, 0.271), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 13+"] = { type = "Model", model = "models/items/combine_rifle_cartridge01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(0.678, 0, 2.44), angle = Angle(91.065, -180, 0), size = Vector(0.271, 0.271, 0.271), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 14"] = { type = "Model", model = "models/gibs/scanner_gib01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(2.561, 0, 1.931), angle = Angle(-55.652, 0, 0), size = Vector(0.109, 0.133, 0.133), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 14+"] = { type = "Model", model = "models/gibs/scanner_gib01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(2.561, 0, 1.931), angle = Angle(-55.652, 0, 0), size = Vector(0.109, 0.133, 0.133), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 15"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(2.97, 0.837, 0.867), angle = Angle(0, 0, -90), size = Vector(0.147, 0.163, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 15+"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(2.97, 0.837, 0.867), angle = Angle(0, 0, -90), size = Vector(0.147, 0.163, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 16"] = { type = "Model", model = "models/props_combine/breentp_rings.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2", pos = Vector(3.012, 0, 0.915), angle = Angle(0, 0, 90), size = Vector(0.006, 0.006, 0.006), color = Color(127, 255, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 16+"] = { type = "Model", model = "models/props_combine/breentp_rings.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 2+", pos = Vector(3.012, 0, 0.915), angle = Angle(0, 0, 90), size = Vector(0.006, 0.006, 0.006), color = Color(127, 255, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["right_hand 2"] = { type = "Model", model = "models/props_phx/construct/metal_tube.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(0.27, 0.068, 3.964), angle = Angle(45, -18.445, 0), size = Vector(0.019, 0.019, 0.035), color = Color(193, 193, 193, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 2+"] = { type = "Model", model = "models/props_phx/construct/metal_tube.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(0.27, 0.068, 3.964), angle = Angle(45, -18.445, 0), size = Vector(0.019, 0.019, 0.035), color = Color(193, 193, 193, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 3"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(-0.155, -0.038, 3.822), angle = Angle(-72.368, -18.445, 0), size = Vector(0.005, 0.005, 0.07), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 3+"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(-0.155, -0.038, 3.822), angle = Angle(-72.368, -18.445, 0), size = Vector(0.005, 0.005, 0.07), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 4"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(0.082, 0.018, 2.036), angle = Angle(180, -66.128, -90), size = Vector(0.05, 0.047, 0.05), color = Color(161, 161, 161, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 4+"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(0.082, 0.018, 2.036), angle = Angle(180, -66.128, -90), size = Vector(0.05, 0.047, 0.05), color = Color(161, 161, 161, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 5"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(-0.002, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.01), color = Color(131, 131, 131, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 5+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(-0.002, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.01, 0.01, 0.01), color = Color(131, 131, 131, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 6"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(6.9, 2.3, 4.133), angle = Angle(116.538, -18.5, 90), size = Vector(0.046, 0.197, 0.001), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/spawn_effect2", skin = 0, bodygroup = {} },
		["right_hand 6+"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(6.9, 2.3, 4.133), angle = Angle(116.538, -18.5, 90), size = Vector(0.046, 0.197, 0.001), color = Color(127, 255, 0, 255), surpresslightning = false, material = "models/props_combine/tpballglow", skin = 0, bodygroup = {} },
		["right_hand 7"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(7.815, 2.648, 6.32), angle = Angle(13.609, -19, -90), size = Vector(0.002, 0.002, 0.002), color = Color(225, 242, 0, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 7+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(7.815, 2.648, 6.32), angle = Angle(13.609, -19, -90), size = Vector(0.002, 0.002, 0.002), color = Color(225, 242, 0, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 8"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand", pos = Vector(7.536, 2.526, 6.398), angle = Angle(-72.326, -19, 0), size = Vector(0.004, 0.004, 0.004), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 8+"] = { type = "Model", model = "models/props_phx/construct/metal_angle360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand+", pos = Vector(7.536, 2.526, 6.398), angle = Angle(-72.326, -19, 0), size = Vector(0.004, 0.004, 0.004), color = Color(163, 163, 163, 255), surpresslightning = false, material = "metal/citadel_metalwall078a", skin = 0, bodygroup = {} },
		["right_hand 9"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7", pos = Vector(-7.66, -1.67, 0.059), angle = Angle(0, -102.009, -180), size = Vector(0.046, 0.172, 0.02), color = Color(210, 210, 210, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand 9+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "right_hand 7+", pos = Vector(-7.66, -1.67, 0.059), angle = Angle(0, -102.009, -180), size = Vector(0.046, 0.172, 0.02), color = Color(184, 115, 51, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} },
		["right_hand+"] = { type = "Model", model = "models/props_phx/construct/concrete_pipe01.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.394, 1.151, -1.8), angle = Angle(0, 42.996, 0), size = Vector(0.01, 0.01, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal/imetal003", skin = 0, bodygroup = {} }
	}
end

SWEP.WalkSpeed = SPEED_FAST
SWEP.UseHands = true

SWEP.ViewModel = "models/weapons/c_arms_hev.mdl"
SWEP.WorldModel = "models/weapons/v_sledgehammer/v_sledgehammer.mdl"

SWEP.Weight = 4

SWEP.MeleeDamage = 88
SWEP.LegDamage = 22
SWEP.HitDistance = 77

SWEP.Unarmed = true

SWEP.Undroppable = false
SWEP.NoPickupNotification = false
SWEP.NoDismantle = false

SWEP.NoGlassWeapons = false

SWEP.AllowQualityWeapons = true
SWEP.SwingSound = Sound( "weapons/zs_power/power1.ogg" )
SWEP.HitSound = Sound( "weapons/zs_power/power4.wav" )

SWEP.FistKnockback = true
SWEP.MeleeKnockBack = 0

SWEP.Primary.Delay = 1.2

SWEP.Tier = 6

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, 0.11, 1)

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() then
		util.CreatePulseImpactEffect(tr.HitPos, tr.HitNormal)

		if hitent:IsPlayer() then
			hitent:AddLegDamageExt(self.LegDamage, self:GetOwner(), self, SLOWTYPE_PULSE)
			hitent:EmitSound("Weapon_StunStick.Melee_Hit")
			hitent:AttachmentDamage(self.LegDamage*2, self:GetOwner(), self, SLOWTYPE_PULSE)
			local cursed5 = hitent:GetStatus("hollowing")
			if (cursed5) then 
				hitent:AddHallow(self:GetOwner(),cursed5.DieTime - CurTime() + (self.LegDamage * 1.5))
			end
			if (not cursed5) then 
				hitent:AddHallow(self:GetOwner(),self.LegDamage * 3)
			end
		end
	end
end
