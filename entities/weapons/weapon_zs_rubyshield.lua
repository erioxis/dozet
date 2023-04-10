AddCSLuaFile()
SWEP.PrintName = translate.Get("wep_rshield")
SWEP.Description = translate.Get("wep_d_rshield")

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/props_c17/utilityconnecter002.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.806, 0.558, 0.08), angle = Angle(-180, 120, -90), size = Vector(0.408, 0.408, 0.408), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/props_lab/pipesystem03c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 1.753), angle = Angle(0, 0, 0), size = Vector(1.31, 2.079, 1.31), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-3.119, 17.154, -3.391), angle = Angle(0, 90, -180), size = Vector(0.483, 0.345, 0.631), color = Color(194, 0, 2, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(3.047, 17.154, -3.39), angle = Angle(0, 0, 180), size = Vector(0.344, 0.483, 0.631), color = Color(194, 0, 3, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/geometric/hex025x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.015, 14.711, -2.442), angle = Angle(0, 0, 180), size = Vector(0.173, 0.231, 0.631), color = Color(194, 0, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/gibs/furniture_gibs/furniture_vanity01a_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0.068, -3.342), angle = Angle(-90, 90, 0), size = Vector(1.586, 0.828, 1.159), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -1.485, -4.337), angle = Angle(0, 0, 0), size = Vector(0.339, 0.23, 0.04), color = Color(194, 0, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 12.634, -3.397), angle = Angle(0, 0, 0), size = Vector(0.35, 0.192, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["e1+++++++++"] = { type = "Model", model = "models/props_c17/gravestone_coffinpiece001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 4.285, -3.489), angle = Angle(0, 90, -180), size = Vector(0.181, 0.232, 0.094), color = Color(255, 255, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
	}
end
SWEP.WElements = {
	["e1"] = { type = "Model", model = "models/props_c17/utilityconnecter002.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(2.75, -5.525, -2.262), angle = Angle(-180, 6, 30), size = Vector(0.408, 0.408, 0.408), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
	["e1+"] = { type = "Model", model = "models/props_lab/pipesystem03c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 1.753), angle = Angle(0, 0, 0), size = Vector(1.31, 2.079, 1.31), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
	["e1+++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-5.065, 15.191, -3.391), angle = Angle(0, 90, -180), size = Vector(0.635, 0.395, 0.631), color = Color(194, 0, 0), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(5.114, 15.153, -3.39), angle = Angle(0, 0, 180), size = Vector(0.395, 0.635, 0.631), color = Color(194, 0, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++"] = { type = "Model", model = "models/gibs/furniture_gibs/furniture_vanity01a_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -1.289, -3.342), angle = Angle(-90, 90, 0), size = Vector(1.691, 1.006, 1.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e1+++++++"] = { type = "Model", model = "models/hunter/misc/roundthing2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -2.158, -4.337), angle = Angle(0, 0, 0), size = Vector(0.42, 0.229, 0.04), color = Color(194, 0, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 9.628, -3.397), angle = Angle(0, 0, 0), size = Vector(0.433, 0.246, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
	["e1++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.15, 3.494, -6.443), angle = Angle(-7.706, 0.352, -176.384), size = Vector(0.214, 0.457, 0.45), color = Color(194, 10, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+++++++++++"] = { type = "Model", model = "models/hunter/triangles/075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1++++++++++", pos = Vector(-1.076, 6.549, 0.6), angle = Angle(0.815, -1.395, 179.556), size = Vector(0.097, 0.56, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.2, 3.494, -6.443), angle = Angle(-9.204, -180, -4), size = Vector(0.214, 0.457, 0.45), color = Color(194, 10, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.037, 3.249, -6.312), angle = Angle(-6.862, 0.664, -8.642), size = Vector(0.213, 0.24, 0.55), color = Color(0194, 10, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++++++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.032, 3.286, -6.263), angle = Angle(-9.087, 179.638, -171.201), size = Vector(0.213, 0.24, 0.55), color = Color(194, 10, 194, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+++++++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(3.518, 4.839, -6.135), angle = Angle(-9.087, 179.638, -171.201), size = Vector(0.16, 0.06, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++++++++++++"] = { type = "Model", model = "models/hunter/triangles/075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.892, 8.263, -5.895), angle = Angle(-8.662, 90, 7.394), size = Vector(0.186, 0.088, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+++++++++++++++++"] = { type = "Model", model = "models/hunter/triangles/075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1++++++++++++", pos = Vector(-1.275, 6.61, -0.654), angle = Angle(-1.156, 0.3, -179.381), size = Vector(0.097, 0.56, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1++++++++++++++++++"] = { type = "Model", model = "models/hunter/triangles/075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(1.064, 8.336, -5.837), angle = Angle(-9.087, 90, 171.5), size = Vector(0.186, 0.087, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} },
	["e1+++++++++++++++++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-3.522, 4.81, -6.338), angle = Angle(-6.862, 0.664, -8.642), size = Vector(0.16, 0.06, 0.3), color = Color(255, 250, 0, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
}

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.ResistDamage = true

SWEP.MeleeDamage = 18
SWEP.MeleeSize = 2.75

SWEP.Primary.Delay = 2

SWEP.BlockTrue = false

SWEP.WalkSpeed = SPEED_SLOW
SWEP.Tier = 5

SWEP.AllowQualityWeapons = true

function SWEP:CanPrimaryAttack() 
	return false
end