AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Eraser' Tactical Pistol"
--SWEP.Description = "Damage increases as remaining bullets decrease."
SWEP.PrintName = translate.Get("wep_marksman")
SWEP.Description = translate.Get("wep_d_marksman")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {}
SWEP.IronSightsPos = Vector(0.2, 0, -0.24)
SWEP.IronSightsAng = Vector(0, 0, 0)

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
	["Основание1+++++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "Рукоять1", pos = Vector(-1.4, 0.041, 6.56), angle = Angle(0, 90, 35.8), size = Vector(0.078, 0.012, 0.062), color = Color(156, 227, 152, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
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

end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"


SWEP.UseHands = true

SWEP.Primary.Sound = Sound("weapons/ar2/npc_ar2_altfire.wav")
SWEP.Primary.Damage = 66
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.15

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.ReloadSpeed = 1
SWEP.HeadshotMulti = 2.4

SWEP.TripleMoney = nil
SWEP.JNumber = 1

SWEP.Tier = 4

SWEP.IronSightsPos = Vector(-5.95, 0, 2.5)
function SWEP:SetCharge(number)
	self:SetDTFloat(11, number)
end
function SWEP:GetCharge()
	return self:GetDTFloat(11)
end

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_HEADSHOT_MULTI, 0.07)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_marksman_r1"), translate.Get("wep_d_marksman_r1"), function(wept)
	wept.ConeMax = wept.ConeMax * 1.7
	wept.ConeMin = wept.ConeMin * 2.1
	wept.Primary.Damage = wept.Primary.Damage * 0.2
	wept.HeadshotMulti = wept.HeadshotMulti * 0.8
	wept.TripleMoney = true
    wept.Primary.NumShots = 3
end)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, translate.Get("wep_marksman_s1"), translate.Get("wep_d_marksman_s1"), function(wept)
	wept.ConeMax = wept.ConeMax * 1.7
	wept.ConeMin = wept.ConeMin * 2.1
	wept.Primary.Damage = wept.Primary.Damage * 1
	wept.HeadshotMulti = wept.HeadshotMulti * 2
	wept.SecondaryAttack = function(self)
		self:SetNextSecondaryFire(CurTime() + 4)
		self:SetCharge(0)
		timer.Simple(4, function() if SERVER then self:SetCharge(2) end end)
		
		if SERVER then
	
		local owner = self:GetOwner()
		 local ent = ents.Create("projectile_moneyauto")
		if ent:IsValid() then
			for i = 1, self.Primary.NumShots do
			ent:SetPos(owner:GetShootPos())
			ent:SetAngles(owner:EyeAngles())
			ent:SetOwner(owner)
			ent.ProjDamage = self.Primary.Damage * (owner.ProjectileDamageMul or 1)
			ent.ProjSource = self
			ent.ShotMarker = i
			ent.Team = owner:Team()
			if self.TripleMoney then
				ent.DamageMul = 3
			end
			self:EmitSound("physics/metal/metal_barrel_impact_soft"..math.random(1,4)..".wav")
	
			self:EntModify(ent)
			ent:Spawn()
	
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				ent:SetGravity(20000)
	
				local angle = owner:GetAimVector():Angle()
				angle:RotateAroundAxis(angle:Forward(), ssfw or math.random(0,10))
				angle:RotateAroundAxis(angle:Up(), ssup or math.random(0,10))
	
				ent.PreVel = angle:Forward() * 520 * (owner.ProjectileSpeedMul or 1)
				phys:SetVelocityInstantaneous(ent.PreVel)
	
	
				self:PhysModify(phys)
			end
		end
		end
		end
	end
end)
branch.Colors = {Color(122, 50, 255), Color(233, 161, 255), Color(136, 8, 255), Color(111, 0, 255), Color(42, 4, 102)}
branch.NewNames = {translate.Get("wep_mark_colorq1"), translate.Get("wep_mark_colorq2"), translate.Get("wep_mark_colorq3"), translate.Get("wep_mark_colorq4"), translate.Get("wep_mark_colorq5")}


function SWEP:EmitFireSound()
	self:EmitSound("weapons/fiveseven/fiveseven-1.wav", 75, 80 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 30, 0.8, 21)
	self:EmitSound(self.Primary.Sound, 75, 130 + (1 - (self:Clip1() / self.Primary.ClipSize)) * 70, 0.75, 22)
end

function SWEP:ShootBullets(dmg, numbul, cone)
	dmg = dmg + dmg * (1 - self:Clip1() / self.Primary.ClipSize)

	BaseClass.ShootBullets(self, dmg, numbul, cone)
end
function SWEP:EntModify(ent)
end

function SWEP:PhysModify(physobj)
end
function SWEP:SecondaryAttack()
	self:SetNextSecondaryFire(CurTime() + 4)
	self:SetCharge(0)
	timer.Simple(4, function() if SERVER then self:SetCharge(2) end end)
	
	if SERVER then

	local owner = self:GetOwner()
 	local ent = ents.Create("projectile_money")
	owner:SetPoints(owner:GetPoints() * 0.95)
	if ent:IsValid() then
		for i = 1, self.Primary.NumShots do
		ent:SetPos(owner:GetShootPos())
		ent:SetAngles(owner:EyeAngles())
		ent:SetOwner(owner)
		ent.ProjDamage = self.Primary.Damage * (owner.ProjectileDamageMul or 1)
		ent.ProjSource = self
		ent.ShotMarker = i
		ent.Team = owner:Team()
		if self.TripleMoney then
			ent.DamageMul = 3
		end
		self:EmitSound("physics/metal/metal_barrel_impact_soft"..math.random(1,4)..".wav")

		self:EntModify(ent)
		ent:Spawn()

		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()
			ent:SetGravity(20000)

			local angle = owner:GetAimVector():Angle()
			angle:RotateAroundAxis(angle:Forward(), ssfw or math.random(0,10))
			angle:RotateAroundAxis(angle:Up(), ssup or math.random(0,10))

			ent.PreVel = angle:Forward() * 520 * (owner.ProjectileSpeedMul or 1)
			phys:SetVelocityInstantaneous(ent.PreVel)


			self:PhysModify(phys)
		end
	end
	end
	end
end
if CLIENT then
	local rad,cos,sin,abs = math.rad, math.cos, math.sin, math.abs
    function DrawHollowCircle(x, y, inRadius, exRadius, startAng, endAng, color)
        startAng = (startAng > endAng and endAng) or startAng
        
        for i = startAng, endAng do
           	surface.SetDrawColor(color)
            surface.DrawTexturedRectRotated(x + (cos(rad(i))*(abs(exRadius-inRadius))), y + -(sin(rad(i))*(abs(exRadius-inRadius))), exRadius, 3, i)
        end
    end
	local texGradDown = surface.GetTextureID("VGUI/gradient_down")
	function SWEP:DrawHUD()
		local scrW = ScrW()
		local scrH = ScrH()
		local width = 205
		local height = 0
		local x, y = (ScrW()- width)*0.56 , (ScrH() - height)*0.5
		if self.BaseClass.DrawHUD then
			self.BaseClass.DrawHUD(self)
		end
	    if self:GetCharge() > 0 then
			color = Color(72,255,0)
		elseif self:GetCharge() == 0 then
			color = Color(255,255,255)
		end
		DrawHollowCircle(ScrW() * 0.9, ScrH()/1.3, 50, 50, 0, 180, color)
	end
end



