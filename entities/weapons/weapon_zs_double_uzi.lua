AddCSLuaFile()
SWEP.PrintName = translate.Get("wep_dual_uzi")
SWEP.Description = translate.Get("wep_d_dual_uzi")


SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 80

	SWEP.HUD3DBone = "v_weapon.slide_right"
	SWEP.HUD3DPos = Vector(2, 0.1, -1)
	SWEP.HUD3DScale = 0.015
	SWEP.ViewModelFlip = false

	SWEP.ViewModelBoneMods = {
		["v_weapon.elite_left"] = { scale = Vector(0.104, 0.104, 0.104), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["v_weapon.magazine_left"] = { scale = Vector(1.352, 1.352, 1.352), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["v_weapon.slide_left"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["v_weapon.trigger_left"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	}

	SWEP.SCKMaterials = {}

	--SWEP.IronSightsPos = Vector(1.28, 0, 0.56)
	SWEP.IronSightsAng = Vector(0, 0, 0)

	SWEP.VElements = {
		["left_uzi10+"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0.478, -2.704, -2.286), angle = Angle(-159.773, -90, 0), size = Vector(0.009, 0.009, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi6"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.683, -2.534, -1.66), angle = Angle(76.239, 90, -90), size = Vector(0.009, 0.013, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["Left_uzi12+"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.897, -2.383, -2.264), angle = Angle(-103.761, 90, -90), size = Vector(0.034, 0.032, 0.037), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi10"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0.478, -2.704, -2.286), angle = Angle(0, 0, -20.407), size = Vector(0.009, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi4"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle360.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -3.132, 3.808), angle = Angle(0, 0, -12.888), size = Vector(0.014, 0.014, 0.275), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["Left_uzi11++"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.694, -0.635, -1.849), angle = Angle(76.239, 90, -90), size = Vector(1.037, 0.037, 0.035), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi16"] = { type = "Model", model = "models/mechanics/gears2/vert_18t1.mdl", bone = "v_weapon.slide_left", rel = "", pos = Vector(0, -1.007, -2.728), angle = Angle(0, 0, -90), size = Vector(0.012, 0.012, 0.03), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi20"] = { type = "Model", model = "models/props_phx/rt_screen.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.848, -2.346, -0.253), angle = Angle(0, 0, 76.251), size = Vector(0.009, 0.029, 0.017), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi3"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -3.077, -0.036), angle = Angle(0, 0, 76.239), size = Vector(0.028, 0.16, 0.607), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi7"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.684, -2.257, -2.791), angle = Angle(-13.761, 90, -90), size = Vector(0.009, 0.009, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi2+"] = { type = "Model", model = "models/mechanics/solid_steel/box_beam_4.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, 1.85, 0.027), angle = Angle(0, 0, -10), size = Vector(0.079, 0.009, 0.146), color = Color(135, 135, 135, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi17"] = { type = "Model", model = "models/mechanics/solid_steel/plank_4.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -2.945, 0.05), angle = Angle(0, 0, 76.251), size = Vector(0.009, 0.027, 0.009), color = Color(70, 70, 70, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi8"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0.69, -2.714, -2.912), angle = Angle(13.76, -90, 0), size = Vector(0.079, 0.028, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi21"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_u_4.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0, -3.329, 3.391), angle = Angle(-112.083, -90, 0), size = Vector(0.043, 0.01, 0.059), color = Color(175, 175, 175, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi5+"] = { type = "Model", model = "models/props_c17/canister01a.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -3.125, 3.529), angle = Angle(0, 0, 167.113), size = Vector(0.068, 0.068, 0.075), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi"] = { type = "Model", model = "models/mechanics/solid_steel/box_beam_4.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(0, -0.102, 0.146), angle = Angle(0, 0, 13.748), size = Vector(0.079, 0.074, 0.146), color = Color(135, 135, 135, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi9"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0.69, -2.711, -2.925), angle = Angle(20.746, -90, 0), size = Vector(0.025, 0.028, 0.202), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi3+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_plate1x1.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -3.077, -0.036), angle = Angle(0, 0, 76.239), size = Vector(0.028, 0.16, 0.607), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi6+"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.683, -2.534, -1.66), angle = Angle(76.239, 90, -90), size = Vector(0.009, 0.013, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi21+"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_u_4.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0, -3.329, 3.391), angle = Angle(-112.083, -90, 0), size = Vector(0.043, 0.01, 0.059), color = Color(175, 175, 175, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi10++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.437, -2.704, -2.284), angle = Angle(-20.407, 90, 0), size = Vector(0.009, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi20+"] = { type = "Model", model = "models/props_phx/rt_screen.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.843, -1.793, -0.157), angle = Angle(180, 0, -76.252), size = Vector(0.009, 0.029, 0.017), color = Color(100, 100, 100, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi19+"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.magazine_right", rel = "", pos = Vector(-0.29, 0.3, -1.043), angle = Angle(0, 0, 95.247), size = Vector(0.103, 0.032, 0.043), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi10+++++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.478, -2.704, -2.286), angle = Angle(-159.773, -90, 0), size = Vector(0.009, 0.009, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi18+"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box_4.mdl", bone = "v_weapon.magazine_right", rel = "", pos = Vector(0.014, -0.872, 0.114), angle = Angle(0, 0, -75.473), size = Vector(0.01, 0.018, 0.246), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi15"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box90_4.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -2.865, 0.136), angle = Angle(103.748, -90, 45), size = Vector(0.018, 0.009, 0.009), color = Color(230, 230, 230, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi2"] = { type = "Model", model = "models/mechanics/solid_steel/box_beam_4.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, 1.85, 0.027), angle = Angle(0, 0, -10), size = Vector(0.079, 0.009, 0.146), color = Color(135, 135, 135, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["left_uzi10++++++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.437, -2.704, -2.284), angle = Angle(-20.407, 90, 0), size = Vector(0.009, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi14+"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.trigger_right", rel = "left_uzi+", pos = Vector(0.241, -0.934, 1.585), angle = Angle(90, 90, -90), size = Vector(0.009, 0.019, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi10+++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.437, -2.704, -2.283), angle = Angle(-180, 0, 20.406), size = Vector(0.009, 0.009, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi5"] = { type = "Model", model = "models/props_c17/canister01a.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -3.125, 3.529), angle = Angle(0, 0, 167.113), size = Vector(0.068, 0.068, 0.075), color = Color(85, 85, 85, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi15+"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box90_4.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -2.865, 0.136), angle = Angle(103.748, -90, 45), size = Vector(0.018, 0.009, 0.009), color = Color(230, 230, 230, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi16+"] = { type = "Model", model = "models/mechanics/gears2/vert_18t1.mdl", bone = "v_weapon.slide_right", rel = "", pos = Vector(-0, -1.007, -2.728), angle = Angle(0, 0, -90), size = Vector(0.012, 0.012, 0.03), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["Left_uzi11+++"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.689, -2.099, 4.15), angle = Angle(-76.24, -90, -90), size = Vector(1.042, 0.037, 0.035), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["Left_uzi11"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(-0.694, -0.635, -1.849), angle = Angle(76.239, 90, -90), size = Vector(1.037, 0.037, 0.035), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi13+"] = { type = "Model", model = "models/mechanics/robotics/claw.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -0.663, 1.799), angle = Angle(15, -90, -90), size = Vector(0.059, 0.05, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi13"] = { type = "Model", model = "models/mechanics/robotics/claw.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0, -0.663, 1.799), angle = Angle(15, -90, -90), size = Vector(0.059, 0.05, 0.1), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi19"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.magazine_left", rel = "", pos = Vector(-0.29, 0.3, -1.043), angle = Angle(0, 0, 95.247), size = Vector(0.103, 0.032, 0.043), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi9+"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.69, -2.711, -2.925), angle = Angle(20.746, -90, 0), size = Vector(0.025, 0.028, 0.202), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi10++++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.478, -2.704, -2.286), angle = Angle(0, 0, -20.407), size = Vector(0.009, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi18"] = { type = "Model", model = "models/mechanics/solid_steel/sheetmetal_box_4.mdl", bone = "v_weapon.magazine_left", rel = "", pos = Vector(0.014, -0.872, 0.114), angle = Angle(0, 0, -75.473), size = Vector(0.01, 0.018, 0.246), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Left_uzi12"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.889, -2.383, -2.264), angle = Angle(-103.761, 90, -90), size = Vector(0.034, 0.032, 0.037), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi8+"] = { type = "Model", model = "models/phxtended/bar1x.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(-0.69, -2.714, -2.912), angle = Angle(13.76, -90, 0), size = Vector(0.079, 0.028, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi7+"] = { type = "Model", model = "models/phxtended/tri1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.684, -2.257, -2.791), angle = Angle(-13.761, 90, -90), size = Vector(0.009, 0.009, 0.028), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi14"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve.mdl", bone = "v_weapon.trigger_left", rel = "left_uzi", pos = Vector(0.241, -0.934, 1.585), angle = Angle(90, 90, -90), size = Vector(0.009, 0.019, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi10+++++++"] = { type = "Model", model = "models/phxtended/trieq1x1x1solid.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0.437, -2.704, -2.283), angle = Angle(-180, 0, 20.406), size = Vector(0.009, 0.009, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi4+"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle360.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -3.132, 3.808), angle = Angle(0, 0, -12.888), size = Vector(0.014, 0.014, 0.275), color = Color(100, 100, 100, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi17+"] = { type = "Model", model = "models/mechanics/solid_steel/plank_4.mdl", bone = "v_weapon.elite_right", rel = "left_uzi+", pos = Vector(0, -2.945, 0.05), angle = Angle(0, 0, 76.251), size = Vector(0.009, 0.027, 0.009), color = Color(70, 70, 70, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} },
		["left_uzi+"] = { type = "Model", model = "models/mechanics/solid_steel/box_beam_4.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(0, 0.061, 0.001), angle = Angle(0, 0, 13.748), size = Vector(0.079, 0.074, 0.146), color = Color(135, 135, 135, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Left_uzi11+"] = { type = "Model", model = "models/phxtended/bar1x45a.mdl", bone = "v_weapon.elite_left", rel = "left_uzi", pos = Vector(0.689, -2.099, 4.15), angle = Angle(-76.24, -90, -90), size = Vector(1.042, 0.037, 0.035), color = Color(200, 200, 200, 255), surpresslightning = false, material = "phoenix_storms/iron_rails", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
	}
	
	

end
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "duel"

SWEP.ViewModel = "models/weapons/v_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pist_elite.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_MAC10.Single")
SWEP.Primary.Damage = 37
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.036
SWEP.Tier = 4

SWEP.Primary.ClipSize = 70
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.DefaultClip = 70

SWEP.ConeMax = 22
SWEP.ConeMin = 7

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
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
