AddCSLuaFile()

if CLIENT then

	SWEP.Slot = 3
	SWEP.SlotPos = 0

	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.HUD3DBone = "v_weapon.awm_parent"
	SWEP.HUD3DPos = Vector(-1.25, -3.5, -16)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.02
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["something_i_don't_know_about1"] = { type = "Model", model = "models/props_phx/construct/metal_wire1x2b.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.062, 1.362, 5.785), angle = Angle(0, 0, 0), size = Vector(0.024, 0.036, 0.038), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["something_i_don't_know_about1+"] = { type = "Model", model = "models/hunter/plates/plate1x2.mdl", bone = "ValveBiped.square", rel = "something_i_don't_know_about1", pos = Vector(0, -0.819, 0.08), angle = Angle(0, 0, 0), size = Vector(0.018, 0.032, 0.021), color = Color(120, 255, 243, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["something_i_don't_know_about1++"] = { type = "Model", model = "models/props_phx/construct/metal_wire1x2b.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.062, 1.362, 5.785), angle = Angle(0, 0, 0), size = Vector(0.024, 0.036, 0.038), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Дуло"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(6.297, 0.044, 5.013), angle = Angle(0, 0, 90), size = Vector(0.127, 0.072, 0.361), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Дуло+"] = { type = "Model", model = "models/mechanics/robotics/d3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(4.061, 0, 6.599), angle = Angle(0, 0, 90), size = Vector(0.073, 0.073, 0.086), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Дуло++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(3.473, 0, 5.549), angle = Angle(0, 90, -90), size = Vector(0.028, 0.049, 0.115), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Дуло+++"] = { type = "Model", model = "models/props_phx/construct/glass/glass_angle90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(3.289, -0.768, 3.791), angle = Angle(0, 180, -90), size = Vector(0.028, 0.028, 0.44), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Дуло++++"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(5.894, 0, 3.603), angle = Angle(0, -90, 0), size = Vector(0.028, 0.11, 0.141), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание1"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-2.245, 0, 6.837), angle = Angle(0, 0, 90), size = Vector(0.145, 0.167, 0.333), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Основание1++"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.628, 0.05, 5.412), angle = Angle(0, -90, 90), size = Vector(0.08, 0.08, 0.055), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание1+++"] = { type = "Model", model = "models/hunter/plates/plate075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.451, -0.126, 6.302), angle = Angle(-54.685, -180, 180), size = Vector(0.031, 0.026, 0.028), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание1++++"] = { type = "Model", model = "models/hunter/plates/plate075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.215, -0.126, 6.088), angle = Angle(-54.685, -180, 180), size = Vector(0.033, 0.027, 0.236), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["Основание1+++++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-3.4, -1, 8,46), angle = Angle(0, 90, 35.8), size = Vector(0.078, 0.012, 0.062), color = Color(156, 227, 152, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание1++++++"] = { type = "Model", model = "models/props_junk/CinderBlock01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.497, 0.041, 6.452), angle = Angle(-35.8, 0, 0), size = Vector(0.01, 0.069, 0.039), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.square", rel = "Основание2++++", pos = Vector(0, 0, 0.317), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2++"] = { type = "Model", model = "models/valgaming/weapons/sw500_cylinder.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0, -1.434, -4.542), angle = Angle(0, -57.032, -90), size = Vector(1.455, 1.226, 1.455), color = Color(150, 150, 150, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Основание2+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.372, 0, 5.792), angle = Angle(90, 0, 0), size = Vector(0.022, 0.016, 0.073), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание2++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.235, 0.025, -2.573), angle = Angle(0, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2+++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0, 0.075, -2.651), angle = Angle(0, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2++++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.square", rel = "Основание2+++++++", pos = Vector(-0.228, 0, 0), angle = Angle(0, -90, 90), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2+++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0.004, -0.036, -2.274), angle = Angle(90, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.square", rel = "Основание2+++++", pos = Vector(0, 0, 0.32), angle = Angle(90, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2+++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.square", rel = "Основание2+++++++++++", pos = Vector(0, 0, 0.32), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2++++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.square", rel = "Основание2++++++++++++", pos = Vector(0, 0, 0.317), angle = Angle(-90, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2+++++++++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.181, 0.039, -2.462), angle = Angle(0, 89, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = false, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2++++++++++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.108, 0.326, -2.761), angle = Angle(0, 90, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Прицел1"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.square", rel = "Рукоять1", pos = Vector(8.539, 0, 7.041), angle = Angle(0, 0, 0), size = Vector(0.016, 0.02, 0.015), color = Color(208, 208, 208, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Прицел1+"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "ValveBiped.square", rel = "Рукоять1", pos = Vector(-0.197, -0.393, 7.04), angle = Angle(0, 0, 0), size = Vector(0.013, 0.007, 0.015), color = Color(208, 208, 208, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Прицел1++"] = { type = "Model", model = "models/hunter/triangles/1x1x1.mdl", bone = "ValveBiped.square", rel = "Рукоять1", pos = Vector(-0.196, 0.48, 7.04), angle = Angle(0, -180, 0), size = Vector(0.013, 0.009, 0.015), color = Color(208, 208, 208, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Рукоять1"] = { type = "Model", model = "models/weapons/w_pist_deagle.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0, 5.519, -3.49), angle = Angle(90, -90, 0), size = Vector(0.954, 0.848, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["smthing"] = { type = "Model", model = "models/hunter/plates/plate1x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(7.603, 0.028, 4.122), angle = Angle(0, -90, -90), size = Vector(0.019, 0.028, 0.01), color = Color(129, 255, 243, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Дуло"] = { type = "Model", model = "models/hunter/plates/plate1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(5.193, 0.044, 4.146), angle = Angle(0, 0, 90), size = Vector(0.102, 0.059, 0.361), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание1"] = { type = "Model", model = "models/hunter/triangles/025x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.788, 0, 5.979), angle = Angle(0, 0, 90), size = Vector(0.118, 0.167, 0.333), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Основание1+"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.154, 0.041, 5.44), angle = Angle(0, 90, 33.962), size = Vector(0.049, 0.014, 0.046), color = Color(156, 227, 152, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание1++"] = { type = "Model", model = "models/props_junk/propane_tank001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.228, 0.05, 4.602), angle = Angle(0, -90, 90), size = Vector(0.08, 0.08, 0.055), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание1+++"] = { type = "Model", model = "models/hunter/plates/plate075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.061, -0.126, 5.263), angle = Angle(-54.685, 180, -180), size = Vector(0.033, 0.027, 0.109), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metalbox2", skin = 0, bodygroup = {} },
		["Основание2"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(0.047, 0.627, 5.02), angle = Angle(0, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2+"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.332, 0.631, 4.082), angle = Angle(-90, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2++"] = { type = "Model", model = "models/valgaming/weapons/sw500_cylinder.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(0.577, 0, 4.49), angle = Angle(-23.557, 90, 0), size = Vector(1.608, 1.2, 1.608), color = Color(150, 150, 150, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["Основание2+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.372, 0, 4.509), angle = Angle(90, 0, 0), size = Vector(0.022, 0.016, 0.073), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/metal_plate", skin = 0, bodygroup = {} },
		["Основание2++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.372, -0.834, 4.461), angle = Angle(-90, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2+++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.401, -0.328, 5.207), angle = Angle(-90, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2++++++"] = { type = "Model", model = "models/props_phx/wheels/wooden_wheel1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.332, 0.558, 4.994), angle = Angle(-90, 0, 0), size = Vector(0.016, 0.016, 0.016), color = Color(0, 242, 255, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
		["Основание2+++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-0.031, -0.841, 4.466), angle = Angle(0, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2++++++++"] = { type = "Model", model = "models/mechanics/robotics/a1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(0.047, 0.627, 4.077), angle = Angle(0, 0, 0), size = Vector(0.025, 0.058, 0.055), color = Color(210, 210, 210, 255), surpresslightning = false, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2+++++++++"] = { type = "Model", model = "models/props_junk/CinderBlock01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.083, 0.044, 5.59), angle = Angle(-35.8, 0, 0), size = Vector(0.01, 0.069, 0.039), color = Color(0, 0, 0, 255), surpresslightning = true, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Основание2++++++++++"] = { type = "Model", model = "models/hunter/plates/plate075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.164, -0.116, 5.353), angle = Angle(-54, -180, 180), size = Vector(0.031, 0.026, 0.028), color = Color(0, 0, 0, 255), surpresslightning = true, material = "phoenix_storms/concrete1", skin = 0, bodygroup = {} },
		["Рукоять1"] = { type = "Model", model = "models/weapons/w_pist_deagle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.997, 1.684, 0.644), angle = Angle(-180, -180, 0), size = Vector(0.778, 1, 0.821), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	function SWEP:PostDrawViewModel(vm, pl, wep)
		if self.HUD3DPos and GAMEMODE:ShouldDraw3DWeaponHUD() then
			local pos, ang = self:GetHUD3DPos(vm)
			if pos then
				self:Draw3DHUD(vm, pos, ang)
			end
		end
		local veles = self.VElements
	
		local col1, col2 = Color(60 * self:GetChargePerc() , 255, 0, math.Clamp(255 * self:GetChargePerc() + 20, 0, 255)), Color(21, 255, 0)
		veles["Основание1+++++"].color = col1
	end
	

end
SWEP.PrintName = translate.Get("wep_piercer")
SWEP.Description = translate.Get("wep_d_piercer")


SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true
SWEP.ShowViewModel = false
SWEP.ReloadSound = Sound("Weapon_AWP.ClipOut")
SWEP.Primary.Sound = Sound("Weapon_357.Single")
SWEP.Primary.Damage = 81
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.5

SWEP.Primary.ProjVelocity = 20000

SWEP.Primary.ClipSize = 5
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.DefaultClip = 15
SWEP.Recoil = 1.4
SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW
SWEP.ReloadGesture = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN
SWEP.NoScaleToLessPlayers = true
SWEP.Ricoshot = nil

SWEP.ConeMax = 0.001
SWEP.ConeMin = 0
SWEP.MovingConeOffset = 0.04
SWEP.ReloadSpeed = 2.1
SWEP.Tier = 3
SWEP.Knick = nil

SWEP.IronSightsPos = Vector(-5, -40, 3)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.WalkSpeed = SPEED_SLOWEST
SWEP.Traced = nil
SWEP.Traced2 = nil

SWEP.TracerName = "tracer_comsniper"
SWEP.ChargeSound = "items/suitchargeok1.wav"
SWEP.LastCharge = 0
SWEP.LastOverchargeAlarm = 0
SWEP.Pierces = 4

SWEP.m_HasDifferingDmgValues = true
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_piercer_r1"), translate.Get("wep_d_piercer_r1"), function(wept)
	wept.Primary.Delay = 0.71
	wept.Primary.Damage = wept.Primary.Damage * 0.25
	wept.Ricoshot = true
	wept.Primary.ClipSize = 1
	wept.Pierces = 1
end)
function SWEP:ShootBullets(dmg, numbul, cone)
	if self.Ricoshot then 
		if self.BaseClass.ShootBullets then
			self.BaseClass.ShootBullets(self, dmg, numbul, cone)
		end
		return
	end
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

	local dmgf = function(i) return dmg * (1 + 0.1 * i) end

	owner:LagCompensation(true)
	for i, trace in ipairs(tr) do
		if not trace.Hit then continue end
		if i > self.Pierces - 1 then break end
		ent = trace.Entity
		if trace.Hit and self.Traced then
			ent:TakeSpecialDamage(self.Primary.Damage, DMG_ALWAYSGIB, self:GetOwner(), self)
			ent:TakeSpecialDamage(self.Primary.Damage, DMG_ALWAYSGIB, self:GetOwner(), self)
			ent:TakeSpecialDamage(self.Primary.Damage, DMG_ALWAYSGIB, self:GetOwner(), self)
		elseif trace.Hit and self.Traced2 then
			ent:TakeSpecialDamage(self.Primary.Damage, DMG_ALWAYSGIB, self:GetOwner(), self)
			ent:TakeSpecialDamage(self.Primary.Damage, DMG_ALWAYSGIB, self:GetOwner(), self)
		end

		if ent and ent:IsValid() then
			owner:FireBulletsLua(trace.HitPos, dir, 0, numbul, dmgf(i-1), nil, self.Primary.KnockbackScale,  self.TracerName, self.BulletCallback, self.Primary.HullSize, nil, self.Primary.MaxDistance, nil, self)
		end
	end
	owner:LagCompensation(false)
end
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	
	if not self:GetOwner():HasTrinket("altevesoul") then
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
elseif self:GetOwner():HasTrinket("altevesoul") and self:GetOwner():Health() < 50 then
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay() * 0.33)
else
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
end
    self.TracerName = nil
    self.Knick = true
	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets((self.Ricoshot and self.Primary.Damage * 1.6) or self.Primary.Damage * 0.6, self.Primary.NumShots, self:GetCone(), true)
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
function SWEP:SetupDataTables()
	self:NetworkVar("Float", 5, "ChargePerc")
	self:NetworkVar("Bool", 5, "IsCharging")
	self:NetworkVar("Bool", 4, "HasOverCharged")
	self:NetworkVar("Int", 4, "OverchargeGraces")
	if self.BaseClass.SetupDataTables then
		self.BaseClass.SetupDataTables(self)
	end
end
function SWEP:Deploy()
	self:SetOverchargeGraces(5)
	self:SetChargePerc(0)
	self:SetIsCharging(false)
	self:SetHasOverCharged(false)
	return self.BaseClass.Deploy(self)
end


function SWEP:SecondaryAttack()
	if not self:CanSecondaryAttack() or self:GetIsCharging() then return end
	self:SetNextSecondaryFire(CurTime() + self.Primary.Delay)
	if not self:GetIsCharging() then
		self:SetIsCharging(true)
	end
end

function SWEP:Think()
	local owner = self:GetOwner()

	local dir = owner:GetAimVector()
	local dirang = dir:Angle()
	local start = owner:GetShootPos()

	dirang:RotateAroundAxis(dirang:Forward(), util.SharedRandom("bulletrotate1", 0, 360))
	dirang:RotateAroundAxis(dirang:Up(), util.SharedRandom("bulletangle1", 0, 0))

	dir = dirang:Forward()
	local tr = owner:CompensatedPenetratingMeleeTrace(4092, 0.01, start, dir)
	local ent
	local dmg = self.Primary.Damage
	local dmgf = function(i) return dmg * (1 + 0.1 * i) end
	for i, trace in ipairs(tr) do
		ent = trace.Entity
		if ent:IsValidLivingZombie() then
			if i == 1 then
				self.Traced = true
			elseif i == 2 then
				self.Traced2 =  true
				self.Traced = nil
			else
				self.Traced =  nil
				self.Traced2 =  nil
			end
		end
	end

	if self:GetIsCharging() then
		if owner:KeyReleased(IN_ATTACK2) or owner:GetBarricadeGhosting() then
			local nextshotdelay = 0.25
			if self:GetChargePerc() > 0.2 and not owner:GetBarricadeGhosting() then
				self.Knick = nil
				self.TracerName = "tracer_comsniper"
				self:TakeAmmo()
				self:EmitFireSound()
				self:ShootBullets((self.Ricoshot and (self.Primary.Damage*math.Clamp(self:GetChargePerc(), 0, 1)) * 5 or (self.Primary.Damage*math.Clamp(self:GetChargePerc(), 0, 2) * 3)), self.Primary.NumShots, self:GetCone())
				nextshotdelay = self.Primary.Delay
			end
			self:SetChargePerc(0)
			self:SetIsCharging(false)
			self:SetHasOverCharged(false)
			self.IdleAnimation = CurTime() + self:SequenceDuration()
			self:SetNextPrimaryFire(CurTime() + nextshotdelay)
		elseif self:GetChargePerc() < 1 then
			if self.LastCharge <= CurTime() then
				self:SetChargePerc(math.Clamp(self:GetChargePerc() + 0.1, 0, 1))
				self:EmitSound(self.ChargeSound, 65, 70+30*self:GetChargePerc() * 3, 1 + (1 * self:GetChargePerc()), CHAN_WEAPON)
				self.LastCharge = CurTime() + 0.3
			end	
		else
			if not self:GetHasOverCharged() then 
				self:SetOverchargeGraces(5)
				self:SetHasOverCharged(true)
			elseif self:GetHasOverCharged() then
				if self.LastOverchargeAlarm <= CurTime() then
					self:EmitSound("npc/attack_helicopter/aheli_damaged_alarm1.wav", 45, 130, 1, CHAN_ITEM)
					self:SetOverchargeGraces(self:GetOverchargeGraces()-1)
					self.LastOverchargeAlarm = CurTime() + 0.5
				end
				if self:GetOverchargeGraces() <= 0 then
					self:SetHasOverCharged(false)
					self:TakeAmmo()
					self:SetChargePerc(0)
					self:SetIsCharging(false)
					self.IdleAnimation = CurTime() + self:SequenceDuration()
					self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
					self:GetOwner():TakeSpecialDamage(60, DMG_DISSOLVE, self:GetOwner(), self)
					local effectdata = EffectData()
						effectdata:SetOrigin(self:GetPos())
					util.Effect("Explosion", effectdata, true, true)
				end
			end
		end
	end
	self.BaseClass.Think(self)
end

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if SERVER and ent and ent:IsValidLivingZombie() then
		dmginfo:SetDamageForce(attacker:GetUp() * 7000 + attacker:GetForward() * 25000)
		for _, pl in pairs(ents.FindInSphere(ent:GetPos(), 230)) do
			if not attacker:GetActiveWeapon().Knick then
			if pl:IsValidLivingZombie() and pl ~= ent and attacker:GetActiveWeapon().Ricoshot then
				pl:TakeSpecialDamage(dmginfo:GetDamage() * 5, DMG_ALWAYSGIB, attacker, attacker:GetActiveWeapon())
				break
			end
		end
		end
	end
end


function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound, 75, 100,1,CHAN_WEAPON)
end

function SWEP:IsScoped()
	return self:GetIronsights() and self.fIronTime and self.fIronTime + 0.25 <= CurTime()
end


if CLIENT then

	function SWEP:TranslateFOV(fov)
		return GAMEMODE.FOVLerp * fov * (1-0.03*math.Clamp(self:GetChargePerc(), 0, 1))
	end
	SWEP.IronsightsMultiplier = 0.25
	function SWEP:GetViewModelPosition(pos, ang)
		if self:IsScoped() then
			return pos + ang:Up() * 256, ang
		end

		return self.BaseClass.GetViewModelPosition(self, pos, ang)
	end
	function SWEP:CalcViewModelView(vm, oldpos, oldang, pos, ang)
		pos, ang = self.BaseClass.CalcViewModelView(self, vm, oldpos, oldang, pos, ang)
		return pos+VectorRand(-0.1,0.1)*math.Clamp(self:GetChargePerc(), 0, 1),ang
	end
	local matScope = Material("zombiesurvival/scope")
	function SWEP:DrawHUDBackground()
		if self:IsScoped() then
			local scrw, scrh = ScrW(), ScrH()
			local size = math.min(scrw, scrh)
			surface.SetMaterial(matScope)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, size)
			surface.SetDrawColor(0, 0, 0, 255)
			if scrw > size then
				local extra = (scrw - size) * 0.5
				surface.DrawRect(0, 0, extra, scrh)
				surface.DrawRect(scrw - extra, 0, extra, scrh)
			end
			if scrh > size then
				local extra = (scrh - size) * 0.5
				surface.DrawRect(0, 0, scrw, extra)
				surface.DrawRect(0, scrh - extra, scrw, extra)
			end
		end
	end
	local texGradDown = surface.GetTextureID("VGUI/gradient_down")
	function SWEP:DrawHUD()
		local scrW = ScrW()
		local scrH = ScrH()
		local width = 200
		local height = 30
		local x, y = (ScrW()- width)*0.5 , (ScrH() - height)*0.75
		local ratio = math.Clamp(self:GetChargePerc(), 0, 1)
		if ratio > 0 then
			surface.SetDrawColor(5, 5, 5, 180)
			surface.DrawRect(x, y, width, height)
			surface.SetDrawColor(255, 0, 0, 180)
			surface.SetTexture(texGradDown)
			surface.DrawTexturedRect(x, y, width*ratio, height)
			surface.SetDrawColor(255, 0, 0, 180)
			surface.DrawOutlinedRect(x - 1, y - 1, width + 2, height + 2)
		end
		if self.BaseClass.DrawHUD then
			self.BaseClass.DrawHUD(self)
		end
	end
	function SWEP:ViewModelDrawn()
		self:Anim_ViewModelDrawn()
		if self:GetIsCharging() and not self:IsScoped() then
			self:DrawLaser()
		end
	end

	function SWEP:DrawWorldModel()
		local owner = self:GetOwner()
		if owner:IsValid() and owner.ShadowMan then return end
		self:Anim_DrawWorldModel()
		if self:GetIsCharging() then
			self:DrawLaser()
		end
	end
	SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

	function SWEP:GetMuzzlePos( weapon, attachment )
		if(!IsValid(weapon)) then return end
		local origin = weapon:GetPos()
		local angle = weapon:GetAngles()
		if weapon:IsWeapon() and weapon:IsCarriedByLocalPlayer() then
			if( IsValid( weapon:GetOwner() ) && GetViewEntity() == weapon:GetOwner() ) then
				local viewmodel = weapon:GetOwner():GetViewModel()
				if( IsValid( viewmodel ) ) then
					weapon = viewmodel
				end
			end
		end
		local attachment = weapon:GetAttachment( attachment or 1 )
		if( !attachment ) then
			return origin, angle
		end
		return attachment.Pos, attachment.Ang
	end
	
	local matBeam = Material("trails/laser")
	local matGlow = Material("sprites/glow04_noz")
	function SWEP:DrawLaser() 
		local endpos = nil 
		local startpos = nil
		local td = {}
			td.start = self:GetOwner():EyePos()
			td.mask = MASK_SHOT
			td.filter = {}
			table.Add(td.filter, {self:GetOwner()})
			table.Add(td.filter, {self:GetOwner():GetActiveWeapon()})
			table.Add(td.filter, team.GetPlayers(self:GetOwner():Team()))
			td.endpos = td.start + self:GetOwner():EyeAngles():Forward()*10000
			table.Add(td.filter, {self})
		local tr = util.TraceLine(td)
		local endpos = tr.Hit and tr.HitPos
		startpos = self:GetMuzzlePos( self, 1 )
		if not startpos or not endpos then return end
		render.SetMaterial(matGlow)
		render.DrawSprite( endpos, 4, 4, Color(36, 167, 255,255))
		render.SetMaterial(matBeam)  
		render.DrawBeam( startpos,endpos, 16, 0, 1, Color(36, 167, 255,45*math.Clamp(self:GetChargePerc(), 0, 1)) )
	end
end