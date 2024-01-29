AddCSLuaFile()

SWEP.PrintName = "Solemnvow"
SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.PrintName = translate.Get('wep_solemnvow')
SWEP.Description = translate.Get('wep_d_solemnvow')

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.HUD3DBone = "v_weapon.slide_right"
	SWEP.HUD3DPos = Vector(1, 0.1, -1)
	SWEP.HUD3DScale = 0.015

	SWEP.VElements = {
		["pistol_r"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.988, 1.138, 0.631), angle = Angle(-90, 90, 0), size = Vector(1.291, 1.291, 1.291), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(0.215, 0.659, 0), angle = Angle(180, -180, 0), size = Vector(1.178, 0.744, 1.202), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(4.148, 5.972, 0.055), angle = Angle(180, 90.431, -90.334), size = Vector(3.028, 1.212, 2.579), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(4.924, 5.972, 0), angle = Angle(180, 90.431, -90.334), size = Vector(3.048, 1.244, 0.59), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "v_weapon.slide_right", rel = "", pos = Vector(-0.312, -0.547, 0.514), angle = Angle(88.658, 180, -90), size = Vector(3.028, 1.212, 2.579), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(5.922, 3.929, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.085, 0.016, 0.017), color = Color(93, 92, 92, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.493, 0, 1.024), angle = Angle(-180, 180, 0), size = Vector(0.045, 0.024, 0.018), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.075, 0.795, -0.046), angle = Angle(-52.432, -90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.075, -0.795, -0.046), angle = Angle(-52.432, 90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(-7.552, 0, 2.887), angle = Angle(-90.188, 180, 0), size = Vector(0.041, 0.076, 0.061), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "v_weapon.trigger_right", rel = "", pos = Vector(-0.197, -0.239, 0.88), angle = Angle(88.46, 90.676, 0), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(1.885, 4.037, 0), angle = Angle(0, 109.295, 180), size = Vector(0.416, 0.339, 0.339), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(2.908, 1.108, -0.399), angle = Angle(90.817, 90, 0), size = Vector(1.291, 1.291, 1.291), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(4.148, 5.972, 0.055), angle = Angle(180, 90.431, -90.334), size = Vector(3.028, 1.212, 2.579), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(1.885, 4.037, 0), angle = Angle(0, 109.295, 180), size = Vector(0.416, 0.339, 0.339), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(4.924, 5.972, 0), angle = Angle(180, 90.431, -90.334), size = Vector(3.048, 1.244, 0.59), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(5.922, 3.929, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.085, 0.016, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(0.215, 0.659, 0), angle = Angle(-180, 180, 90.18), size = Vector(1.178, 0.744, 1.202), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "v_weapon.trigger_left", rel = "", pos = Vector(0.113, -0.256, 0.816), angle = Angle(88.46, 90.676, 0), size = Vector(0.035, 0.035, 0.035), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.075, 0.795, -0.046), angle = Angle(-52.432, -90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.075, -0.795, -0.046), angle = Angle(-52.432, 90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(-7.552, 0, 2.887), angle = Angle(-90.188, 180, 0), size = Vector(0.041, 0.076, 0.061), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.493, 0, 1.024), angle = Angle(-180, 180, 0), size = Vector(0.045, 0.024, 0.018), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++++++"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "v_weapon.magazine_left", rel = "", pos = Vector(0.33, 2.243, -0.08), angle = Angle(-90.082, 90.676, 0), size = Vector(0.341, 0.264, 0.445), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++++++"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "v_weapon.magazine_right", rel = "", pos = Vector(-0.007, 2.163, 0.08), angle = Angle(-90.082, 90.676, 0), size = Vector(0.341, 0.264, 0.445), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++++++++"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(5.751, 10.41, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.333, 0.333, 0.333), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++++++++"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(5.751, 10.41, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.333, 0.333, 0.333), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["suda"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "v_weapon.slide_left", rel = "", pos = Vector(0.449, -0.299, 0.34), angle = Angle(92.082, 180, -90), size = Vector(3.028, 1.212, 2.579), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["pistol_r"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.988, 1.138, 0.631), angle = Angle(-90, 90, 0), size = Vector(1.291, 1.291, 1.291), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(0.215, 0.659, 0), angle = Angle(180, -180, 0), size = Vector(1.178, 0.744, 1.202), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(4.148, 5.972, 0.055), angle = Angle(180, 90.431, -90.334), size = Vector(3.028, 1.212, 2.579), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(4.924, 5.972, 0), angle = Angle(180, 90.431, -90.334), size = Vector(3.048, 1.244, 0.59), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.355, 1.23, -3.928), angle = Angle(180, -0.738, 0), size = Vector(3.028, 1.212, 2.579), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(5.922, 3.929, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.085, 0.016, 0.017), color = Color(93, 92, 92, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.493, 0, 1.024), angle = Angle(-180, 180, 0), size = Vector(0.045, 0.024, 0.018), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.075, 0.795, -0.046), angle = Angle(-52.432, -90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(0.075, -0.795, -0.046), angle = Angle(-52.432, 90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "suda", pos = Vector(-7.552, 0, 2.887), angle = Angle(-90.188, 180, 0), size = Vector(0.041, 0.076, 0.061), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(6.559, 1.705, 2.626), angle = Angle(0, 0, 180), size = Vector(0.035, 0.035, 0.035), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(1.885, 4.037, 0), angle = Angle(0, 109.295, 180), size = Vector(0.416, 0.339, 0.339), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(2.908, 1.108, -0.399), angle = Angle(90, 90, 0), size = Vector(1.291, 1.291, 1.291), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(4.148, 5.972, 0.055), angle = Angle(180, 90.431, -90.334), size = Vector(3.028, 1.212, 2.579), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(1.885, 4.037, 0), angle = Angle(0, 109.295, 180), size = Vector(0.416, 0.339, 0.339), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(4.924, 5.972, 0), angle = Angle(180, 90.431, -90.334), size = Vector(3.048, 1.244, 0.59), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(5.922, 3.929, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.085, 0.016, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(0.215, 0.659, 0), angle = Angle(-180, 180, 90.18), size = Vector(1.178, 0.744, 1.202), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_mortar01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.987, 1.195, -2.297), angle = Angle(0, 0, 0), size = Vector(0.035, 0.035, 0.035), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.075, 0.795, -0.046), angle = Angle(-52.432, -90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/citadel_pods.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.075, -0.795, -0.046), angle = Angle(-52.432, 90, 0), size = Vector(0.006, 0.019, 0.006), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(-7.552, 0, 2.887), angle = Angle(-90.188, 180, 0), size = Vector(0.041, 0.076, 0.061), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++++"] = { type = "Model", model = "models/props_combine/combine_barricade_med02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++", pos = Vector(0.493, 0, 1.024), angle = Angle(-180, 180, 0), size = Vector(0.045, 0.024, 0.018), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["pistol_r+++++++++++++++++++++++++"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r++++++++++++", pos = Vector(5.751, 10.41, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.333, 0.333, 0.333), color = Color(91, 91, 91, 255), surpresslightning = false, material = "phoenix_storms/metalset_1-2", skin = 0, bodygroup = {} },
		["pistol_r++++++++++++++++++++++++++"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "pistol_r", pos = Vector(5.751, 10.41, 0), angle = Angle(-180, 90.313, -90), size = Vector(0.333, 0.333, 0.333), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["suda"] = { type = "Model", model = "models/alyx_emptool_prop.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(9.001, 1.175, 4.742), angle = Angle(180, 180, 0), size = Vector(3.028, 1.212, 2.579), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "duel"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.UseHands = true

SWEP.Primary.Damage = 120
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.31

SWEP.HeadshotMulti = 2

SWEP.Astral = false

SWEP.PhasingSpeed = 0

SWEP.Tier = 6

SWEP.WalkSpeed = SPEED_FASTEST

SWEP.TracerName = "tracer_solemnvow"

SWEP.Primary.ClipSize = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 150

SWEP.Recoil = 5

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.1, 1 )
GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.1, 1 )

function SWEP:SetHitStacks( stacks )
	self:SetDTFloat( 9, stacks )
end

function SWEP:GetHitStacks()
	return self:GetDTFloat( 9 )
end

function SWEP:EmitFireSound()
	local owner = self:GetOwner()
	local anal = self.Astral
	owner:EmitSound( "weapons/shotgun/shotgun_dbl_fire7.wav", 60, math.random( 50, 55 ), .7 )
	owner:EmitSound( string.format( "weapons/physcannon/superphys_launch%d.wav", math.random( 1, 4 ) ), 60, math.random( 250, 255 ), anal and 0 or 1, CHAN_WEAPON )
	owner:EmitSound( "weapons/357/357_fire2.wav", 60, math.random( 30, 35 ), .7 )
	if anal then
		owner:EmitSound( "weapons/shotgun/shotgun_dbl_fire.wav", 60, math.random( 50, 55 ), .7 )
		owner:EmitSound( "weapons/airboat/airboat_gun_lastshot1.wav", 60, math.random( 60, 65 ), .7 )
	end
end

function SWEP:EmitReloadSound()
	self:EmitSound( "weapons/crossbow/bolt_load2.wav", 60, math.random( 40, 58 ), 1, CHAN_WEAPON )
end
-- ЭЭЫЭАЭЫЕЭ ПОД БАЗУ ОБИЛКИ
function SWEP:SecondaryAttack()
	if self:GetHitStacks() >= 1 then
		local owner = self:GetOwner()

		owner.NoCollideAll = owner:Team() == TEAM_HUMAN 
		owner:CollisionRulesChanged()

		self.Astral = true
		self.PhasingSpeed = owner.BarricadePhaseSpeedMul
		owner.BarricadePhaseSpeedMul = 10

		if SERVER then
			local pos = owner:GetPos() + Vector( 0, 0, 5 )
			local ent = ents.CreateLimited( "env_astral" )
			if ent:IsValid() then
				ent:SetPos( pos )
				ent:SetModel( owner:GetModel() )
				ent:SetAngles( owner:GetAngles() )
				ent:SetSequence( owner:GetSequence() )
				ent.EyeAnglesSave = owner:EyeAngles()
				ent:Spawn()
				ent:SetOwner( owner )
				self.AstralEnt = ent
			end
		end

		for i = 1, 4 do
			timer.Simple( i * .04, function() owner:EmitSound( "beams/beamstart5.wav", 75, 155 - i * 10, .7 ) end)
			timer.Simple( i * .04, function() owner:EmitSound( "ambient/machines/machine1_hit1.wav", 75, 255 - i * 10, 1 ) end)
		end

		owner:EmitSound( "ambient/machines/thumper_hit.wav", 75, 255 )
		owner:GiveStatus( "astral", 6, self )

		local boost = owner:GiveStatus( "adrenalineamp", 6, self )
		if boost and boost:IsValid() then
			boost:SetSpeed( 115 )
		end

		self:SetHitStacks( 0 )
	end
end

function SWEP:EndAstral()
	local owner = self:GetOwner()
	for i = 1, 10 do
		timer.Simple( i * .04, function() if not IsValid( owner ) then return end owner:EmitSound( "beams/beamstart5.wav", 75, 55 + i * 10, 1 ) end)
		timer.Simple( i * .04, function() if not IsValid( owner ) then return end owner:EmitSound( "bambient/machines/machine1_hit1.wav", 75, 155 + i * 10, 1 ) end)
	end

	owner.BarricadePhaseSpeedMul = self.PhasingSpeed
	owner.NoCollideAll = nil
	owner:CollisionRulesChanged()

	if IsValid( self.AstralEnt ) then
		local apos = self.AstralEnt:GetPos()
		local aang = self.AstralEnt.EyeAnglesSave
		local effectdata = EffectData()
			effectdata:SetOrigin( apos )
			effectdata:SetStart( owner:WorldSpaceCenter() )
			effectdata:SetEntity( owner )
		util.Effect( "tracer_facelesscompanion", effectdata )

		owner:SetPos( apos )
		owner:SetEyeAngles( aang )
		self.AstralEnt:Remove()
	end
end

function SWEP:SendWeaponAnimation()
	self:SendWeaponAnim(self:Clip1() % 2 == 0 and ACT_VM_PRIMARYATTACK or ACT_VM_SECONDARYATTACK)
end

function SWEP.BulletCallback( attacker, tr, dmginfo )
	local ent = tr.Entity
	local wept = attacker:GetActiveWeapon()
	local astr = wept.Astral
	if ent:IsValidLivingZombie() then
		local dmg = wept.BaseDamage or wept.Primary.Damage
		wept:SetHitStacks( math.min( wept:GetHitStacks() + dmg * 0.0001 * ( astr and 0 or 1 ), 1 ) )
		
		dmg = dmginfo:GetDamage()
		dmginfo:SetDamage( dmg + ( astr and dmg or 0 ) )
		if astr then
			dmginfo:SetDamage( dmg * 1.25 )
		end
		if SERVER then
			ent:AddLegDamageExt( astr and 6 or 3, attacker, wept, wept:Clip1() % 2 == 0 and SLOWTYPE_PULSE or SLOWTYPE_COLD, dmginfo:GetDamagePosition() )
		end
	end
end

function SWEP:Holster()
	if self.Astral then return false end
	if CLIENT then
		self:Anim_Holster()
	end

	return true
end

function SWEP:Think()
	self.BaseClass.Think( self )
end

function SWEP:Deploy()
	if self:GetOwner():HaveStatus( "astral" ) then return false end

	self.BaseClass.Deploy( self )
end

function SWEP:OnRemove()
	self:EndAstral()

	self.BaseClass.OnRemove( self )
end

if not CLIENT then return end

function SWEP:GetTracerOrigin()
	local owner = self:GetOwner()
	if owner:IsValid() then
		local vm = owner:GetViewModel()
		if vm and vm:IsValid() then
			local attachment = vm:GetAttachment(self:Clip1() % 2 + 3)
			if attachment then
				return attachment.Pos + Vector( 0, 120, 0 )
			end
		end
	end
end

function SWEP:Draw2DHUD()
	self.BaseClass.Draw2DHUD( self )

	self:Draw2DFeature( self:GetHitStacks(), nil, nil, "weapon_ability_astral", "ZSHUDFontSmallest", Color( 255, 100, 255 ) )
end

function SWEP:Draw3DHUD( vm, pos, ang )
	self.BaseClass.Draw3DHUD( self, vm, pos, ang )

	self:Draw3DFeature( vm, pos, ang, self:GetHitStacks(), nil, nil, "weapon_ability_astral", "ZSHUDFontSmallest", Color( 255, 100, 255 ) )
end