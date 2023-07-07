AddCSLuaFile()

--SWEP.PrintName = "'Goset' Glock 3"
--SWEP.Description = "Fires 2 shots at once. Not very accurate, but very damaging up close."
SWEP.PrintName = translate.Get("wep_arikus")
SWEP.Description = translate.Get("wep_d_arikus")

SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 50
	SWEP.ViewModelFlip = false

	SWEP.HUD3DPos = Vector(5, 0.25, -0.8)
	SWEP.HUD3DAng = Angle(90, 0, 0)
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["e1+"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.0899, 1.076, 1.73499), angle = Angle(15, -0.426, -179.99998), size = Vector(0.038, 0.029, 0.089), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/Gibs/HGIBS_spine.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-1.128, 0.023, 1.608), angle = Angle(0, 90, -8.548), size = Vector(0.933, 0.368, 0.368), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-0.462, -0.001, 2.354), angle = Angle(0, 90, -180), size = Vector(0.018, 0.044, 0.095), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-1.53998, 0, 1.18402), angle = Angle(0, 0, 180), size = Vector(0.08, 0.022, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-1.29803, 0, 1.91104), angle = Angle(0, 0, 180), size = Vector(0.075, 0.024, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-0.92706, 0, 2.629), angle = Angle(0, 0, 180), size = Vector(0.067, 0.021, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-0.95703, 0, 3.332), angle = Angle(0.773, 0, -180), size = Vector(0.067, 0.02, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-0.80792, 0, 3.86002), angle = Angle(4.829, 0, -180), size = Vector(0.059, 0.018, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/gibs/metal_gib1.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(4.98895, 0, 4.13602), angle = Angle(0, 90, -15), size = Vector(0.237, 1.05, 0.308), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(4.83899, 0, 5.50903), angle = Angle(-74.99999, 0, 90.00001), size = Vector(0.436, 0.9, 1.64), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(2.85101, 0.005, 4.42404), angle = Angle(62.741, -180, 89.99998), size = Vector(0.285, 0.448, 2.087), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(8.07697, 0.077, 6.67603), angle = Angle(71.33099, -180, 0.002), size = Vector(0.003, 0.003, 0.007), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(1.59802, -0.312, 5.78903), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med01a.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(8.71301, 0, 5.98004), angle = Angle(17.781, 180, 0), size = Vector(0.001, 0.006, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_02.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(9.565, 0, 6.44305), angle = Angle(14.411, -0.806, 127.20501), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++"] = { type = "Model", model = "models/props_phx/trains/double_wheels.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(1.17999, -0.533, 5.54507), angle = Angle(75, 180, -89.99999), size = Vector(0.008, 0.008, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(1.86395, -0.313, 5.86102), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(3.49194, -0.312, 6.29703), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(3.73395, -0.313, 6.36203), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(5.31995, -0.313, 6.78598), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(5.54395, -0.313, 6.84702), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(7.16895, -0.311, 7.28198), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.011), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(7.43793, -0.314, 7.35504), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.01), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(9.20996, -0.31601, 7.82904), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(9.42804, -0.316, 7.88803), angle = Angle(0, 90, 165), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(0.24591, -0.314, 5.01501), angle = Angle(0, 90, -15), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(0.53296, -0.315, 5.08603), angle = Angle(0, 90, -15), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(1.02399, -0.429, 5.104), angle = Angle(-56.32, 0, 90), size = Vector(0.014, 0.023, 0.286), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(-0.33905, -0.429, 4.88403), angle = Angle(75, -180, -90), size = Vector(0.014, 0.023, 0.286), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_phx/trains/double_wheels.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(0.573, -0.549, 5.12802), angle = Angle(75, 180, -89.99999), size = Vector(0.008, 0.008, 0.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/tprotato1.mdl", bone = "v_weapon.deagle_parent", rel = "e1+", pos = Vector(9.22101, 0, 5.45105), angle = Angle(-65.064, 0, -179.99998), size = Vector(0.018, 0.006, 0.037), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e2"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "v_weapon.deagle_trigger", rel = "e1+", pos = Vector(1.83, 0, 4.046), angle = Angle(0, 90, -29.579), size = Vector(0.175, 0.062, 0.043), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["e3"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0, 0.159, -1.532), angle = Angle(0, 0, -90), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 0.23108, -0.02798), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++"] = { type = "Model", model = "models/Gibs/HGIBS.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.313, -0.87097, 0.61301), angle = Angle(-10, 90, 0), size = Vector(0.235, 0.235, 0.235), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 1.54297, 0.397), angle = Angle(0, 0, -17.141), size = Vector(0.004, 0.009, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 1.37903, 0.342), angle = Angle(0, 0, -17.141), size = Vector(0.004, 0.009, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 3.35303, 0.40503), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 3.59497, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 10.89404, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.001, 5.43201, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.002, 5.71399, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(1e-05, 7.53406, 0.42603), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.001, 7.80304, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 9.62402, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 9.86993, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(0, 11.15204, 0.42601), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x7.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.316, 6.43005, 0.69403), angle = Angle(0, 0, 179.99998), size = Vector(0.015, 0.029, 0.066), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.315, 1.00995, 0.45901), angle = Angle(0, 0, 179.99998), size = Vector(0.015, 0.045, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x6.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.315, -0.6629, 1.02501), angle = Angle(0, 0, 90), size = Vector(0.018, 0.018, 0.042), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.316, 10.51099, 1.724), angle = Angle(0, 0, 179.99998), size = Vector(0.216, 0.042, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++++++++++++++++++"] = { type = "Model", model = "models/props_animated_breakable/smokestack_gib_10.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.31599, 5.36096, 1.00702), angle = Angle(-70.00001, 1e-05, 90.00001), size = Vector(0.006, 0.006, 0.031), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.616, -1.39203, 0.68602), angle = Angle(0, 0, 90), size = Vector(0.008, 0.008, 0.008), color = Color(177, 255, 236, 255), surpresslightning = true, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++++++++++++"] = { type = "Model", model = "models/props_phx/trains/track_64.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.315, -0.01294, 1.42401), angle = Angle(0, -89.99999, 0), size = Vector(0.02, 0.003, 0.026), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "v_weapon.deagle_slide", rel = "e3", pos = Vector(-0.017, -1.39099, 0.686), angle = Angle(0, 0, 90), size = Vector(0.008, 0.008, 0.008), color = Color(177, 255, 236, 255), surpresslightning = true, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e4"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "ValveBiped.clip", rel = "", pos = Vector(-0.316, 0.303, -0.383), angle = Angle(0, 0, 0), size = Vector(0.02, 0.09, 0.042), color = Color(177, 255, 236, 255), surpresslightning = true, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["e1+"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.956, 1.083, 1.587), angle = Angle(165, -180, 0), size = Vector(0.038, 0.029, 0.089), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/Gibs/HGIBS_spine.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-1.128, 0.023, 1.608), angle = Angle(0, 90, -8.548), size = Vector(0.933, 0.368, 0.368), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.462, -0.001, 2.354), angle = Angle(0, 90, 180), size = Vector(0.018, 0.044, 0.095), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-1.54, 0, 1.184), angle = Angle(0, 0, -180), size = Vector(0.08, 0.022, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-1.298, 0, 1.911), angle = Angle(0, 0, -180), size = Vector(0.075, 0.024, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.927, 0, 2.629), angle = Angle(0, 0, -180), size = Vector(0.067, 0.021, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.957, 0, 3.332), angle = Angle(0.773, 0, 180), size = Vector(0.067, 0.02, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/props_lab/teleportring.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.808, 0, 3.86), angle = Angle(4.829, 0, -180), size = Vector(0.059, 0.018, 0.029), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/gibs/metal_gib1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(4.989, 0, 4.136), angle = Angle(0, 90, -15), size = Vector(0.237, 1.05, 0.308), color = Color(231, 231, 231, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++++++++++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(4.839, 0, 5.509), angle = Angle(-75, 0, 90), size = Vector(0.436, 0.9, 1.64), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1+++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(2.851, 0.005, 4.424), angle = Angle(62.741, 180, 90), size = Vector(0.285, 0.448, 2.087), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(8.077, 0.077, 6.676), angle = Angle(71.331, 180, 0.002), size = Vector(0.003, 0.003, 0.007), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++"] = { type = "Model", model = "models/gibs/helicopter_brokenpiece_02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(9.565, 0, 6.443), angle = Angle(14.411, -0.806, 127.205), size = Vector(0.094, 0.094, 0.094), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1+++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(1.024, -0.429, 5.104), angle = Angle(-56.32, 0, 90), size = Vector(0.014, 0.023, 0.286), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e1++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/geometric/hex05x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.339, -0.429, 4.884), angle = Angle(75, 180, -90), size = Vector(0.014, 0.023, 0.286), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(0.185, -0.327, 5.168), angle = Angle(0, 90, -15), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 0.231, -0.028), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++"] = { type = "Model", model = "models/Gibs/HGIBS.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.313, -0.871, 0.613), angle = Angle(-10, 90, 0), size = Vector(0.235, 0.235, 0.235), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 1.543, 0.397), angle = Angle(0, 0, -17.141), size = Vector(0.004, 0.009, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 1.379, 0.342), angle = Angle(0, 0, -17.141), size = Vector(0.004, 0.009, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 3.353, 0.405), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 3.595, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 10.894, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.001, 5.432, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.002, 5.714, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 7.534, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.001, 7.803, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 9.624, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 9.87, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3++++++++++++++"] = { type = "Model", model = "models/perftest/ground_objects8k.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(0, 11.152, 0.426), angle = Angle(0, 0, 0), size = Vector(0.004, 0.011, 0.015), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e3+++++++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x7.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.316, 6.43, 0.694), angle = Angle(0, 0, -180), size = Vector(0.015, 0.029, 0.066), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.315, 1.01, 0.459), angle = Angle(0, 0, -180), size = Vector(0.015, 0.045, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/tube1x1x6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.315, -0.663, 1.025), angle = Angle(0, 0, 90), size = Vector(0.018, 0.018, 0.042), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3++++++++++++++++++"] = { type = "Model", model = "models/xqm/jettailpiece1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.316, 10.511, 1.724), angle = Angle(0, 0, -180), size = Vector(0.216, 0.042, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e3+++++++++++++++++++"] = { type = "Model", model = "models/props_animated_breakable/smokestack_gib_10.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e3", pos = Vector(-0.316, 5.361, 1.007), angle = Angle(-70, 0, 90), size = Vector(0.006, 0.006, 0.031), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/gibs/metalgibs/metal_gibs", skin = 0, bodygroup = {} },
		["e4"] = { type = "Model", model = "models/hunter/misc/sphere1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1+", pos = Vector(-0.24, 0, 2.181), angle = Angle(0, -90, 90), size = Vector(0.02, 0.09, 0.042), color = Color(177, 255, 236, 255), surpresslightning = true, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = "zombiesurvival/magnum_shoot.wav"
SWEP.Primary.Damage = 109
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.9
SWEP.TracerName = "tracer_spectrum"

SWEP.Primary.ClipSize = 7
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 2
SWEP.ConeMin = 0.7

SWEP.Tier = 4
SWEP.Pierces = 99 
SWEP.IronSightsPos = Vector(-5.75, 10, 2.7)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.05, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.03, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1, 1)

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if SERVER  and  ent then
		local entus = ents.Create("projectile_arikus")
		local vec = Vector(0, 0, 5)
		entus:SetPos(tr.HitPos+vec)
		entus:SetOwner(attacker)
		entus.ProjDamage = dmginfo:GetDamage()
		entus.NoCollideHim = ent
		local trg 
		for _, target in pairs(ents.FindInSphere(tr.HitPos, 308)) do
			if WorldVisible(entus:LocalToWorld(vec), ent:NearestPoint(entus:LocalToWorld(vec))) then
				if target:IsValidLivingZombie() and target ~= ent then
					trg = target
					break
				end
			end
		end
		if !trg then
			trg = ent
		end
		entus.Target = trg
		entus:Spawn()
	end
end
function SWEP:ShootBullets(dmg, numbul, cone)
	local owner = self:GetOwner()
	self:SendWeaponAnimation()
	owner:DoAttackEvent()

	local dir = owner:GetAimVector()
	local dirang = dir:Angle()
	local start = owner:GetShootPos()

	dirang:RotateAroundAxis(dirang:Forward(), util.SharedRandom("bulletrotate1", 0, 360))
	dirang:RotateAroundAxis(dirang:Up(), util.SharedRandom("bulletangle1", -cone, cone))

	dir = dirang:Forward()
	local tr = owner:CompensatedPenetratingMeleeTrace(4092, 0.01, start, dir)
	local ent

	local dmgf = function(i) return dmg * (1 - 0.2 * i) end

	owner:LagCompensation(true)
	for i, trace in ipairs(tr) do
		if not trace.Hit then continue end
		if i > self.Pierces - 1 then break end

		ent = trace.Entity

		if ent and ent:IsValid() then
			owner:FireBulletsLua(trace.HitPos, dir, 0, numbul, dmgf(i-1), nil, self.Primary.KnockbackScale, "", self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
		end
	end
	owner:FireBulletsLua(start, dir, cone, numbul, 0, nil, self.Primary.KnockbackScale, self.TracerName, self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
	owner:LagCompensation(false)
end