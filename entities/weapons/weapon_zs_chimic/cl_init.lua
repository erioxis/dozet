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
	["arch"] = { type = "Model", model = "models/props_trainstation/Ceiling_Arch001a.mdl", bone = "Python", rel = "", pos = Vector(0, 5, 2.5), angle = Angle(0, 0, -90), size = Vector(0.125, 0.125, 0.125), color = Color(142, 104, 61, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_holder"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrel", pos = Vector(0, -2.3, 0), angle = Angle(0, 90, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["drum"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "arch", pos = Vector(0, 5, 0), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 1.299), color = Color(180, 191, 63, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["valve2_train_amnyam"] = { type = "Model", model = "models/xeon133/slider/slider_12x12x48.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "valve2_train", pos = Vector(0, -2.5, -1.25), angle = Angle(0, 90, 0), size = Vector(0.125, 0.125, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["valve2"] = { type = "Model", model = "models/props_pipes/valve002.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "arch", pos = Vector(0, -5.252, 6.164), angle = Angle(90, 0, 90), size = Vector(0.1, 0.1, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_pipes/pipe01_straight01_long.mdl", bone = "Python", rel = "arch", pos = Vector(0, 11.199, 6), angle = Angle(0, 0, 0), size = Vector(0.25, 0.25, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["drum_lid+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "drum", pos = Vector(0, 0, 4.5), angle = Angle(-90, 0, 0), size = Vector(0.578, 0.522, 0.524), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_holder+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrel", pos = Vector(0, -3.3, 0), angle = Angle(0, 90, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["valve"] = { type = "Model", model = "models/props_pipes/valve001.mdl", bone = "Cylinder", rel = "", pos = Vector(-1, 0, 0), angle = Angle(0, -90, -90), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["drum_lid"] = { type = "Model", model = "models/props_pipes/pipe02_connector01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "drum", pos = Vector(0, 0, -4.5), angle = Angle(-90, 0, 0), size = Vector(0.486, 0.375, 0.375), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_pipe"] = { type = "Model", model = "models/props_pipes/pipe02_lcurve02_short.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "barrel", pos = Vector(0, -3.5, -2.5), angle = Angle(180, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["valve2_train"] = { type = "Model", model = "models/props_trainstation/train005.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "valve2", pos = Vector(1, 0, 4), angle = Angle(0, 90, -90), size = Vector(0.025, 0.025, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drum_holder"] = { type = "Model", model = "models/props_pipes/pipe01_straight01_short.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "drum", pos = Vector(0, 0, 0.5), angle = Angle(0, 0, 90), size = Vector(1, 0.224, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drum+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "drum", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1.399), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_combine/health_charger_glass", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["arch"] = { type = "Model", model = "models/props_trainstation/Ceiling_Arch001a.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(0, 0.899, 6.5), angle = Angle(0, 0, -95), size = Vector(0.125, 0.125, 0.125), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel_holder1+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(0, -3.3, 0), angle = Angle(0, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["drum_lid1"] = { type = "Model", model = "models/props_pipes/pipe02_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drum", pos = Vector(0, 0, -4.5), angle = Angle(-90, 0, 0), size = Vector(0.486, 0.375, 0.375), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drum"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "arch", pos = Vector(-0.801, 5, 0), angle = Angle(0, 0, 0), size = Vector(0.899, 0.899, 1.299), color = Color(180, 191, 63, 255), surpresslightning = true, material = "models/debug/debugwhite", skin = 0, bodygroup = {} },
	["drum_lid1+"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drum", pos = Vector(0, 0, 4.5), angle = Angle(90, 0, 0), size = Vector(0.578, 0.522, 0.524), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["valve2"] = { type = "Model", model = "models/props_pipes/valve002.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "arch", pos = Vector(-0.801, -5.252, 6.164), angle = Angle(90, 0, 90), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["valve2_train"] = { type = "Model", model = "models/props_trainstation/train005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "valve2", pos = Vector(1.5, 0, 6), angle = Angle(0, 90, -90), size = Vector(0.025, 0.025, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["barrel"] = { type = "Model", model = "models/props_pipes/pipe01_straight01_long.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "arch", pos = Vector(-0.9, 11.199, 5.199), angle = Angle(0, 0, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["barrel_pipe"] = { type = "Model", model = "models/props_pipes/pipe02_lcurve02_short.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(0, -3.5, -2.5), angle = Angle(180, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["valve"] = { type = "Model", model = "models/props_pipes/valve001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "arch", pos = Vector(-2, -2, 4.699), angle = Angle(-90, 0, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 1, bodygroup = {} },
	["valve_filler"] = { type = "Model", model = "models/props_pipes/pipe03_straight01_short.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "valve", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.131, 0.054, 0.119), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["barrel_holder1"] = { type = "Model", model = "models/props_pipes/pipe01_connector01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "barrel", pos = Vector(0, -2.3, 0), angle = Angle(0, 90, 0), size = Vector(0.15, 0.15, 0.15), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 2, bodygroup = {} },
	["valve2_train_trashcan"] = { type = "Model", model = "models/xeon133/slider/slider_12x12x48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "valve2", pos = Vector(2.4, 0, 2.5), angle = Angle(90, 0, 0), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_pipes/GutterMetal01a", skin = 0, bodygroup = {} },
	["drum_holder"] = { type = "Model", model = "models/props_pipes/pipe01_straight01_short.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drum", pos = Vector(0, 0, 0.5), angle = Angle(0, 0, 90), size = Vector(1, 0.224, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["drum+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "drum", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(1, 1, 1.399), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_combine/health_charger_glass", skin = 0, bodygroup = {} }
	}