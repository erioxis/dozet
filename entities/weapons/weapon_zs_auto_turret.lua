AddCSLuaFile()

--SWEP.PrintName = "'Juggernaut' M249"
--SWEP.Description = "A light machine gun capable of immense firepower, firing additional red projectiles as it fires."
SWEP.PrintName = ""..translate.Get("wep_jugger")
SWEP.Description = ""..translate.Get("wep_d_jugger")
SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60
	SWEP.VElements = {
		["wire4+"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.781, -3.678, 0.381), angle = Angle(-15.65, 77.08, 0), size = Vector(0.014, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["ammobox2+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(-1.132, 0.193, 1.851), angle = Angle(90, 0, 0), size = Vector(0.056, 0.092, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+++++++++++++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(2.069, 3.349, 2.121), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate10"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.624, -1.356, 0.263), angle = Angle(0, 17.235, 0), size = Vector(0.075, 0.029, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["провод"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(-0.005, -1.071, 0.741), angle = Angle(-75.186, -135.667, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["bullet1++++++++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.751, 3.269, 2.043), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate17(gun)++"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-2.362, 3.322, 0.33), angle = Angle(0, 0, 0), size = Vector(0.074, 0.108, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "model_color", skin = 0, bodygroup = {} },
		["bullet1++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.321, 3.269, 1.437), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate12(trigger)"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.476, 0.085, 0.287), angle = Angle(0, -137.853, 0), size = Vector(0.02, 0.016, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate2++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-1.39, 12.5, 1.009), angle = Angle(45, 0, 0), size = Vector(0.029, 0.423, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(-0.013, 3.269, 1.437), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["bullet1++++++++++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(2.063, 2.239, 2.232), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate3"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-0.371, 2.138, 0.614), angle = Angle(90, 0, 0), size = Vector(0.054, 0.082, 0.164), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["pyramid3"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "metalplate2", pos = Vector(1.651, 0.795, 0), angle = Angle(0, 0, 0), size = Vector(0.039, 0.388, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["ammobox3+"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(1.365, -1.285, 3.799), angle = Angle(-90, 0, 0), size = Vector(0.027, 0.029, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(-0.014, 2.239, 1.552), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate9+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.427, -2.386, 0.564), angle = Angle(0, 27.5, 90), size = Vector(0.075, 0.013, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(1.863, -3.826, 0.6), angle = Angle(90, 0, 25), size = Vector(0.054, 0.034, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["провод+++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.119, -1.211, 1.149), angle = Angle(-57.699, -131.234, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["forbullet1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.118, 2.779, 1.593), angle = Angle(20.798, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["pyramiddown1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "metalplate2", pos = Vector(0.964, 0.816, -1.673), angle = Angle(45, 0, 0), size = Vector(0.101, 0.389, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+++++++++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.316, 2.239, 1.552), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["aккамулятор"] = { type = "Model", model = "models/items/car_battery01.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-1.073, -4.343, 0.612), angle = Angle(-180, 180, -90), size = Vector(0.1, 0.1, 0.1), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["forbullet1+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.799, 2.779, 1.536), angle = Angle(4.335, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["ammobox4"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(-1.214, 0.902, 3.782), angle = Angle(0, 90, 90), size = Vector(0.061, 0.027, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate15(m249)++++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(1.417, 10.293, 0.172), angle = Angle(180, -90, 0), size = Vector(0.045, 0.045, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate8+"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-0.917, -2.915, -0.445), angle = Angle(90, 0, -180), size = Vector(0.014, 0.092, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["провод++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.263, -1.68, 3.411), angle = Angle(-108.977, -128.995, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate15(m249)++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(1.014, 4.355, 0.043), angle = Angle(-180, -90, 0), size = Vector(0.019, 0.019, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire1++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.106, -4.041, 1.156), angle = Angle(-174.06, 43.784, 79.938), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate11(trigger)++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(3.092, 1.317, 0.331), angle = Angle(0, -139.403, 0), size = Vector(0.009, 0.009, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.646, 2.239, 1.57), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate13(m249)"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.513, 3.976, 1.901), angle = Angle(0, 0, 90), size = Vector(0.039, 0.039, 0.039), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate15(m249)"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(2.72, 7.085, 0.679), angle = Angle(90, -2.256, 0), size = Vector(0.028, 0.093, 0.721), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["ammobox5"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "ammobox1", pos = Vector(0.092, -1.239, 3.756), angle = Angle(0, 0, -42), size = Vector(0.054, 0.039, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire2+"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.564, -2.48, 0.37), angle = Angle(-19.074, 95.019, 0), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["ammobox2"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(1.383, 0.193, 1.851), angle = Angle(90, 0, 0), size = Vector(0.056, 0.092, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["forbullet1++++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.689, 2.779, 1.993), angle = Angle(43.557, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate11(trigger)"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(3.253, 0.493, 0.307), angle = Angle(0, -90, 0), size = Vector(0.03, 0.009, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+++++++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.653, 3.269, 1.46), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate10++++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.624, -1.356, 0.8), angle = Angle(0, 17.235, 0), size = Vector(0.075, 0.029, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["провод+++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.479, -1.828, 2.888), angle = Angle(-127.778, -158.855, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate1+++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(1.912, -3.839, 0.6), angle = Angle(90, 0, 25), size = Vector(0.054, 0.034, 0.263), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["forbullet1++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.317, 2.779, 1.536), angle = Angle(4.335, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["m249"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve180.mdl", bone = "v_weapon.receiver", rel = "", pos = Vector(-4.348, -0.489, 0.68), angle = Angle(90, 0, 90), size = Vector(0.074, 0.097, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate14(m249)"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.285, 2.628, 0.214), angle = Angle(-90, 0, 0), size = Vector(0.037, 0.054, 0.588), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["ammobox3"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(-1.214, -1.285, 3.801), angle = Angle(-90, 0, 0), size = Vector(0.027, 0.029, 0.027), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate15(m249)++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(2.561, 7.085, 0.679), angle = Angle(90, -2.256, 0), size = Vector(0.028, 0.093, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["провод++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.358, -1.515, 1.483), angle = Angle(-31.295, -129.745, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate2+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-1.407, 12.5, 0), angle = Angle(-45, 0, 0), size = Vector(0.029, 0.423, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["провод+++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.564, -1.78, 1.838), angle = Angle(-61.767, -126.963, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["ammobox1"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "", pos = Vector(2.53, -0.758, 0.059), angle = Angle(90, 0, 0), size = Vector(0.054, 0.1, 0.171), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["pyramid3+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "metalplate2", pos = Vector(-0.709, 0.816, -2.352), angle = Angle(-90, 180, 0), size = Vector(0.039, 0.388, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1+++++++++++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.572, 3.349, 1.763), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate15(m249)+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(2.184, 4.275, 0.679), angle = Angle(-90, -133.54, 0), size = Vector(0.028, 0.032, 0.507), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate18(m249)"] = { type = "Model", model = "models/props_phx/construct/metal_wire1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.281, 2.786, -0.704), angle = Angle(0, 0, 0), size = Vector(0.009, 0.05, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "model_color", skin = 0, bodygroup = {} },
		["metalplate12(trigger)++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.039, 0.595, 0.287), angle = Angle(0, -128.57, 0), size = Vector(0.02, 0.009, 0.143), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire4++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-1.958, -4.303, 0.085), angle = Angle(-21.414, -23.629, 0), size = Vector(0.017, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["wire1"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.556, -2.427, 0.816), angle = Angle(-153.327, 94.252, 76.509), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate15(m249)+++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(1.014, 4.355, 1.083), angle = Angle(-180, -90, 0), size = Vector(0.019, 0.019, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire2"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.007, -4.236, 0.024), angle = Angle(-8.955, -14.525, 0), size = Vector(0.028, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate9"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.829, -0.661, 0.564), angle = Angle(0, 17.392, 90), size = Vector(0.075, 0.013, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["bullet1+++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.982, 3.269, 1.49), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate2"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-1.336, 12.5, 1.065), angle = Angle(45, 0, 0), size = Vector(0.029, 0.423, 0.029), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate12(trigger)++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.7, 0.349, 0.287), angle = Angle(0, 162.186, 0), size = Vector(0.009, 0.009, 0.143), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire4"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.503, -4.213, 0.264), angle = Angle(-6.894, 46.685, 0), size = Vector(0.014, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate1+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(2.255, -0.527, 0.6), angle = Angle(90, 0, 0), size = Vector(0.054, 0.108, 0.238), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate17(gun)"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.898, 13.185, 1.631), angle = Angle(45, 0, 0), size = Vector(0.025, 0.386, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "model_color", skin = 0, bodygroup = {} },
		["metalplate16(gun)"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.561, 22.607, 0.574), angle = Angle(0, 180, 90), size = Vector(0.017, 0.017, 0.386), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["wire1+++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.01, -4.228, 1.261), angle = Angle(-176.155, -9.259, 81.091), size = Vector(0.032, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["forbullet1+++++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.929, 2.779, 2.209), angle = Angle(9.913, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate11(trigger)+++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.486, 1.46, 0.331), angle = Angle(0, 0, 0), size = Vector(0.019, 0.009, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire3+"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.8, -3.797, 0.8), angle = Angle(-22.403, -96.354, 0), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["ammobox4+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(1.315, 0.902, 3.782), angle = Angle(0, 90, 90), size = Vector(0.061, 0.027, 0.024), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate10+++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.463, -1.925, 0.8), angle = Angle(0, 27.604, 0), size = Vector(0.075, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate10+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(3.463, -1.925, 0.264), angle = Angle(0, 27.604, 0), size = Vector(0.075, 0.014, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["ammobox6"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(0.094, 0.908, 4.25), angle = Angle(0, 0, 0), size = Vector(0.054, 0.063, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["bullet1++++++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.307, 2.239, 1.656), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["wire3"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.48, -4.302, 1.088), angle = Angle(-21.771, -165.267, 0), size = Vector(0.014, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["forbullet1++++++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.437, 2.779, 1.741), angle = Angle(34.296, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate12(trigger)+"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.477, 0.435, 0.287), angle = Angle(0, -105.597, 0), size = Vector(0.02, 0.016, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire1+"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.508, -3.287, 1.067), angle = Angle(-174.06, 80.775, 79.938), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["провод++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.647, -1.892, 2.355), angle = Angle(-88.5, -126.963, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate6"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-0.913, 0.028, -0.002), angle = Angle(0, 0, 180), size = Vector(0.054, 0.089, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["bullet1++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(0.977, 2.263, 1.588), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["провод++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.128, -1.124, 4.203), angle = Angle(-175.204, -81.459, -108.543), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["ammobox7"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(0.09, -2.008, 2.142), angle = Angle(0, 0, 90), size = Vector(0.054, 0.043, 0.054), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate10++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(5.037, -2.086, 0.56), angle = Angle(0, 107.164, 90), size = Vector(0.046, 0.013, 0.092), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["Eye"] = { type = "Model", model = "models/combine_helicopter/helicopter_bomb01.mdl", bone = "v_weapon.Right_Arm", rel = "metalplate6+", pos = Vector(-0.072, -0.145, 0), angle = Angle(0, 0, 0), size = Vector(0.054, 0.054, 0.048), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate7"] = { type = "Model", model = "models/items/battery.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.872, -3.102, 0.583), angle = Angle(0, 136.279, 90), size = Vector(0.1, 0.18, 0.148), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {[2] = 1, [3] = 1} },
		["bullet1++++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.564, 2.239, 1.871), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["bullet1+++++++"] = { type = "Model", model = "models/items/ar2_grenade.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.317, 3.269, 1.546), angle = Angle(0, -90, 0), size = Vector(0.112, 0.086, 0.097), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["metalplate15(m249)+++++++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(1.417, 10.293, 1.315), angle = Angle(180, -90, 0), size = Vector(0.045, 0.045, 0.045), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate1++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(2.194, -0.527, 0.6), angle = Angle(90, 0, 0), size = Vector(0.054, 0.108, 0.026), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["metalplate15(m249)+++++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(1.496, 10.293, 0.679), angle = Angle(90, -45, 0), size = Vector(0.028, 0.059, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate4"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(1.72, -1.3, 0.612), angle = Angle(90, 0, 0), size = Vector(0.054, 0.137, 0.68), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["ammobox8"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.ammobox", rel = "ammobox1", pos = Vector(0.082, 2.308, 2.207), angle = Angle(0, 0, 90), size = Vector(0.054, 0.083, 0.018), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire3++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-1.903, -4.262, 1.24), angle = Angle(8.248, -20.66, 0.54), size = Vector(0.014, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate5"] = { type = "Model", model = "models/items/battery.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.454, -1.782, 0.583), angle = Angle(0, 154.225, 90), size = Vector(0.1, 0.18, 0.148), color = Color(0, 100, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["wire2++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-3.465, -3.345, 0.187), angle = Angle(-3.027, 72.646, 0), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["bullet1++++++++++++++"] = { type = "Model", model = "models/shells/shell_762nato.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.743, 2.239, 2.144), angle = Angle(0, -90, 0), size = Vector(0.509, 0.509, 0.509), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["провод+++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(0.14, -1.497, 3.934), angle = Angle(-117.46, -119.195, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate12(trigger)+++"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(2.523, 0.354, 0.287), angle = Angle(0, -178.28, 0), size = Vector(0.009, 0.009, 0.143), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["wire2+++"] = { type = "Model", model = "models/mechanics/robotics/a2.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-2.984, -4.099, 0.144), angle = Angle(-1.55, 43.145, 0), size = Vector(0.019, 0.009, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate17(gun)+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.895, 13.269, -0.596), angle = Angle(-45, 0, 0), size = Vector(0.025, 0.386, 0.009), color = Color(0, 100, 255, 255), surpresslightning = false, material = "model_color", skin = 0, bodygroup = {} },
		["metalplate8"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-0.253, -2.843, 1.654), angle = Angle(-90, 180, 0), size = Vector(0.014, 0.089, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["провод+"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "v_weapon.Right_Arm", rel = "aккамулятор", pos = Vector(-0.053, -0.865, 0.217), angle = Angle(-57.202, -90, 0), size = Vector(0.025, 0.009, 0.009), color = Color(120, 0, 0, 255), surpresslightning = false, material = "engine/vmtview_background", skin = 0, bodygroup = {} },
		["metalplate13(m249)+"] = { type = "Model", model = "models/props_phx/construct/metal_plate1_tri.mdl", bone = "v_weapon.m249", rel = "m249", pos = Vector(-0.471, 4.195, -0.848), angle = Angle(90, 0, 90), size = Vector(0.039, 0.039, 0.039), color = Color(100, 100, 100, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate11(trigger)+"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "v_weapon.trigger", rel = "m249", pos = Vector(3.006, -0.401, 0.307), angle = Angle(0, -38.542, 0), size = Vector(0.014, 0.009, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["metalplate6+"] = { type = "Model", model = "models/props_phx/construct/metal_dome180.mdl", bone = "v_weapon.Right_Arm", rel = "m249", pos = Vector(-0.913, 0.028, 1.18), angle = Angle(-180, 180, 180), size = Vector(0.054, 0.089, 0.014), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} },
		["forbullet1+++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.bullet1", rel = "m249", pos = Vector(1.44, 2.779, 1.753), angle = Angle(32.147, 0, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 100, 0, 254), surpresslightning = false, material = "metal2a", skin = 0, bodygroup = {} }
	}
	SWEP.HUD3DBone = "v_weapon.m249"
	SWEP.HUD3DPos = Vector(1.4, -1.3, 5)
	SWEP.HUD3DAng = Angle(180, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_mach_m249para.mdl"
SWEP.WorldModel = "models/weapons/w_mach_m249para.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("weapons/m249/m249-1.wav")
SWEP.Primary.Damage = 10
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.08

SWEP.Primary.ClipSize = 90
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_AR2

SWEP.Recoil = 4

SWEP.ConeMax = 6
SWEP.ConeMin = 2.4

SWEP.WalkSpeed = SPEED_SLOWEST
SWEP.ControlWeapon = "weapon_zs_manhackcontrol"

SWEP.Tier = 4
SWEP.MaxStock = 2

SWEP.IronSightsAng = Vector(-1, -1, 0)
SWEP.IronSightsPos = Vector(-3, 4, 3)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
function SWEP:CanPrimaryAttack()
	if self:GetOwner():GetAmmoCount(self.Primary.Ammo) < 1 then
		return false
	end
	return self:GetNextPrimaryFire() <= CurTime()
end
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
function SWEP:SecondaryAttack()
	if !self:CanSecondaryAttack() or CLIENT then return end
	local owner = self:GetOwner()
	local ent = ents.Create("prop_manhack")
	if ent:IsValid() then
		ent:SetPos(owner:GetShootPos())
		ent:Spawn()
		ent:SetObjectOwner(owner)
		ent:SetupPlayerSkills()

		local stored = owner:PopPackedItem(ent:GetClass())
		if stored then
			ent:SetObjectHealth(stored[1])
		end

		ent:EmitSound("WeaponFrag.Throw")
		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			phys:SetVelocityInstantaneous(self:GetOwner():GetAimVector() * 200)
		end

		if not owner:HasWeapon(self.ControlWeapon) then
			owner:Give(self.ControlWeapon)
		end
		owner:SelectWeapon(self.ControlWeapon)

		owner:StripWeapon(self:GetClass())
	end
	self:Remove()
end

function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound)

	if self:Clip1() == 1 then
		self:EmitSound("weapons/sg552/sg552-1.wav", 70, 45, 0.95, CHAN_AUTO)
	end
end

function SWEP:ShootBullets(dmg, numbul, cone)
	local owner = self:GetOwner()

	self:SendWeaponAnimation()
	owner:DoAttackEvent()

	if SERVER and self:GetOwner():GetAmmoCount(self.Primary.Ammo) % 10 == 1 then
		for i = 1, 2 do
			local ent = ents.Create("projectile_juggernaut")
			if ent:IsValid() and rand == 1 then
				ent:SetPos(owner:GetShootPos())

				local angle = owner:GetAimVector():Angle()
				angle:RotateAroundAxis(angle:Up(), 90)
				ent:SetAngles(angle)

				ent:SetOwner(owner)
				ent.ProjDamage = self.Primary.Damage * 0.3 * (owner.ProjectileDamageMul or 1)
				ent.ProjSource = self
				ent.Team = owner:Team()

				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:Wake()

					angle = owner:GetAimVector():Angle()
					angle:RotateAroundAxis(angle:Forward(), math.Rand(0, 360))
					angle:RotateAroundAxis(angle:Up(), math.Rand(-cone/1.5, cone/1.5))
					phys:SetVelocityInstantaneous(angle:Forward() * 700 * (owner.ProjectileSpeedMul or 1))
				end
			end
		end
	end

	owner:LagCompensation(true)
	owner:FireBulletsLua(owner:GetShootPos(), owner:GetAimVector(), cone, numbul, dmg / 1, nil, self.Primary.KnockbackScale, self.TracerName, self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
	owner:LagCompensation(false)
end
