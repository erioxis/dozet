INC_CLIENT()

SWEP.HUD3DBone = "v_weapon.ump45_Release"
SWEP.HUD3DPos = Vector(-1.6, -4, 5)
SWEP.HUD3DAng = Angle(0, 0, 0)
SWEP.HUD3DScale = 0.02


SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}

SWEP.SCKMaterials = {}

SWEP.IronSightsPos = Vector(-1.4, 0, 0.04)
SWEP.IronSightsAng = Vector(0, 0, 0)

SWEP.VElements = {
	["toxic1"] = { type = "Model", model = "models/props_combine/combine_light001a.mdl", bone = "v_weapon.Glock_Slide", rel = "", pos = Vector(2.941, 0.329, 0.385), angle = Angle(-13.891, 87.132, -95.12), size = Vector(0.1, 0.1, 0.1), color = Color(0, 255, 8, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["toxic1+"] = { type = "Model", model = "models/props_combine/combine_emitter01.mdl", bone = "v_weapon.Glock_Slide", rel = "", pos = Vector(2.518, -0.569, 0.29), angle = Angle(-180, 4.528, 180), size = Vector(0.1, 0.1, 0.1), color = Color(235, 216, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["toxic1"] = { type = "Model", model = "models/props_combine/combine_light001a.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(0.13, -3.99, 2.411), angle = Angle(180, 110.943, 180), size = Vector(0.1, 0.1, 0.1), color = Color(0, 255, 8, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


