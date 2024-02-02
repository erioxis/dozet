AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base = "weapon_zs_basemelee"

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = true

SWEP.PrintName = translate.Get('wep_fireofdespair')
SWEP.Description = translate.Get('wep_d_fireofdespair')

SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DPos = Vector(0, -1, -7)
SWEP.HUD3DAng = Angle(180, -90, 90)
SWEP.HUD3DScale = 0.055

SWEP.InnateDamageType = INNATE_TYPE_FIRE
SWEP.InnateDamageMul = 0.2

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
if CLIENT then
	SWEP.ViewModelFOV = 76
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["handle"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.161, 1.508, -5.759), angle = Angle(0, 31.504, 0), size = Vector(0.416, 0.416, 3.721), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+"] = { type = "Model", model = "models/props_wasteland/prison_lamp001c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -2.464), angle = Angle(0, 0, 0), size = Vector(0.293, 0.293, 0.165), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++"] = { type = "Model", model = "models/props_c17/lampShade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.305), angle = Angle(180, 0, 0), size = Vector(0.156, 0.156, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++"] = { type = "Model", model = "models/props_phx/gears/bevel9.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.127), angle = Angle(0, 0, 0), size = Vector(0.323, 0.323, 0.165), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++++"] = { type = "Model", model = "models/props_phx/mechanics/medgear.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.079), angle = Angle(0, 0, 0), size = Vector(0.045, 0.045, 0.672), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 11.454), angle = Angle(180, 0, 0), size = Vector(0.027, 0.027, 0.027), color = Color(90, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 11.141), angle = Angle(-169.75301, -87.216, -59.324), size = Vector(0.052, 0.052, 0.052), color = Color(90, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 0, 0), size = Vector(0.08, 0.08, 0.029), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
		["handle++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 0, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/comball_sphere", skin = 0, bodygroup = {} },
		["handle+++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 180, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/comball_sphere", skin = 0, bodygroup = {} },
		["handle++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 180, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 178, 0, 255), surpresslightning = true, material = "effects/tvscreen_noise002a", skin = 0, bodygroup = {} },
		["handle+++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.729), angle = Angle(0, 180, 0), size = Vector(0.085, 0.085, 0.035), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_c17/frostedglass_01a", skin = 0, bodygroup = {} },
		["handle++++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.729), angle = Angle(0, 90, 0), size = Vector(0.085, 0.085, 0.035), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_c17/frostedglass_01a", skin = 0, bodygroup = {} },
		["mbblade"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 0, 0), size = Vector(0.102, 0.102, 1.554), color = Color(199, 88, 41, 255), surpresslightning = true, material = "models/shadertest/vertexlitselfilluminatedtexture", skin = 0, bodygroup = {} },
		["mbblade+"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 63.327, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/ivy01", skin = 0, bodygroup = {} },
		["mbblade++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 0, 0), size = Vector(0.105, 0.105, 1.584), color = Color(255, 255, 255, 0), surpresslightning = true, material = "", skin = 0, bodygroup = {} },
		["mbblade+++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 65.316, 0), size = Vector(0.118, 0.118, 1.584), color = Color(255, 0, 0, 65), surpresslightning = true, material = "models/effects/comball_tape", skin = 0, bodygroup = {} },
		["mbblade++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -174.45, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/tree_deciduous_01a_lod", skin = 0, bodygroup = {} },
		["mbblade+++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -100.698, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/cattails", skin = 0, bodygroup = {} },
		["mbblade++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 180, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 212), surpresslightning = true, material = "models/props_foliage/ivy01", skin = 0, bodygroup = {} },
		["mbblade+++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 81.337, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/tree_deciduous_01a_lod-leaves", skin = 0, bodygroup = {} },
		["mbblade++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 79.884, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 0, 0, 255), surpresslightning = true, material = "decals/decal_paintsplatterpink_model", skin = 0, bodygroup = {} },
		["mbblade+++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -116.92, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "decals/decal_birdpoop004", skin = 0, bodygroup = {} },
		["mbblade++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -15.213, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 97, 0, 255), surpresslightning = true, material = "decals/extinguish1model", skin = 0, bodygroup = {} },
		["mbblade+++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 65.316, 0), size = Vector(0.108, 0.108, 1.584), color = Color(197, 125, 0, 255), surpresslightning = true, material = "effects/tvscreen_noise002a", skin = 0, bodygroup = {} },
		["mbblade+++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 147.049, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/ihvtest_tree/temp_treebranch01a", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["handle"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.161, 1.508, -5.759), angle = Angle(0, 31.504, 0), size = Vector(0.416, 0.416, 3.721), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+"] = { type = "Model", model = "models/props_wasteland/prison_lamp001c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -2.464), angle = Angle(0, 0, 0), size = Vector(0.293, 0.293, 0.165), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++"] = { type = "Model", model = "models/props_c17/lampShade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.305), angle = Angle(180, 0, 0), size = Vector(0.156, 0.156, 0.054), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++"] = { type = "Model", model = "models/props_phx/gears/bevel9.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.127), angle = Angle(0, 0, 0), size = Vector(0.323, 0.323, 0.165), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++++"] = { type = "Model", model = "models/props_phx/mechanics/medgear.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.079), angle = Angle(0, 0, 0), size = Vector(0.045, 0.045, 0.672), color = Color(80, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++++"] = { type = "Model", model = "models/mechanics/wheels/wheel_extruded_48.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 11.454), angle = Angle(180, 0, 0), size = Vector(0.027, 0.027, 0.027), color = Color(90, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 11.141), angle = Angle(-169.75301, -87.216, -59.324), size = Vector(0.052, 0.052, 0.052), color = Color(90, 80, 80, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["handle+++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 0, 0), size = Vector(0.08, 0.08, 0.029), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
		["handle++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 0, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/comball_sphere", skin = 0, bodygroup = {} },
		["handle+++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 180, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/effects/comball_sphere", skin = 0, bodygroup = {} },
		["handle++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.677), angle = Angle(0, 180, 0), size = Vector(0.081, 0.081, 0.03), color = Color(255, 178, 0, 255), surpresslightning = true, material = "effects/tvscreen_noise002a", skin = 0, bodygroup = {} },
		["handle+++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.729), angle = Angle(0, 180, 0), size = Vector(0.085, 0.085, 0.035), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_c17/frostedglass_01a", skin = 0, bodygroup = {} },
		["handle++++++++++++"] = { type = "Model", model = "models/XQM/Rails/gumball_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, 12.729), angle = Angle(0, 90, 0), size = Vector(0.085, 0.085, 0.035), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/props_c17/frostedglass_01a", skin = 0, bodygroup = {} },
		["mbblade"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 0, 0), size = Vector(0.102, 0.102, 1.554), color = Color(199, 88, 41, 255), surpresslightning = true, material = "models/shadertest/vertexlitselfilluminatedtexture", skin = 0, bodygroup = {} },
		["mbblade+"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 63.327, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/ivy01", skin = 0, bodygroup = {} },
		["mbblade++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 0, 0), size = Vector(0.105, 0.105, 1.584), color = Color(255, 255, 255, 0), surpresslightning = true, material = "", skin = 0, bodygroup = {} },
		["mbblade+++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 65.316, 0), size = Vector(0.118, 0.118, 1.584), color = Color(255, 0, 0, 65), surpresslightning = true, material = "models/effects/comball_tape", skin = 0, bodygroup = {} },
		["mbblade++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -174.45, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/tree_deciduous_01a_lod", skin = 0, bodygroup = {} },
		["mbblade+++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -100.698, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/cattails", skin = 0, bodygroup = {} },
		["mbblade++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 180, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 212), surpresslightning = true, material = "models/props_foliage/ivy01", skin = 0, bodygroup = {} },
		["mbblade+++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 81.337, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/props_foliage/tree_deciduous_01a_lod-leaves", skin = 0, bodygroup = {} },
		["mbblade++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 79.884, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 0, 0, 255), surpresslightning = true, material = "decals/decal_paintsplatterpink_model", skin = 0, bodygroup = {} },
		["mbblade+++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -116.92, 0), size = Vector(0.108, 0.108, 1.584), color = Color(0, 0, 0, 255), surpresslightning = true, material = "decals/decal_birdpoop004", skin = 0, bodygroup = {} },
		["mbblade++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, -15.213, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 97, 0, 255), surpresslightning = true, material = "decals/extinguish1model", skin = 0, bodygroup = {} },
		["mbblade+++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 65.316, 0), size = Vector(0.108, 0.108, 1.584), color = Color(197, 125, 0, 255), surpresslightning = true, material = "effects/tvscreen_noise002a", skin = 0, bodygroup = {} },
		["mbblade+++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "handle", pos = Vector(0, 0, -3.279), angle = Angle(180, 147.049, 0), size = Vector(0.108, 0.108, 1.584), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/ihvtest_tree/temp_treebranch01a", skin = 0, bodygroup = {} }
	}
end

SWEP.Tier = 6

SWEP.MeleeType = "other"

SWEP.MeleeDamage = 512
SWEP.MeleeRange = 120
SWEP.MeleeSize = 7

SWEP.Primary.Delay = 1.1

SWEP.SwingRotation = Angle( 30, -20, 10 )
SWEP.SwingOffset = Vector( 0, -30, 0 )
SWEP.SwingTime = 1.2
SWEP.SwingTimeSecondary = 1.7
SWEP.SwingHoldType = "melee"

SWEP.CanPierce = true

SWEP.WalkSpeed = SPEED_SLOW

SWEP.AllowQualityWeapons = true

SWEP.Ability = true
SWEP.AbilityText = "despair"
SWEP.AbilityColor = Color( 255, 165, 0 )
SWEP.AbilityMax = SWEP.MeleeDamage * 10

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05 )


function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "weapons/irifle/irifle_fire2.wav")
	self.ChargeSound2 = CreateSound(self, "weapons/physcannon/energy_sing_explosion2.wav")
end

function SWEP:PlaySwingSound()
	self:GetOwner():EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 135, 145 ) )
	self:GetOwner():EmitSound( "npc/scanner/scanner_nearmiss"..math.random(2)..".wav", 75, math.random( 185, 195 ) )
end

function SWEP:PlayHitSound()
	self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, math.random(70,85) )
end

function SWEP:DealThink(dmginfo, ent)
    local owner = self:GetOwner()
    ent:GiveStatus( "burn", math.random( 5, 15 ), owner )
    ent:AddLegDamageExt( 6, owner, self, SLOWTYPE_FLAME )
end

function SWEP:HaveAbility()
	
	local owner = self:GetOwner()
	self:StartSwinging( true )
	timer.Simple( 1.7, function()
		if not ( IsValid( self ) or IsValid( owner ) ) then return end
		owner:EmitSound( "ambient/explosions/explode_" .. math.random( 1, 9 ) .. ".wav", 75, math.random( 195, 220 ) )
		owner:EmitSound( "ambient/explosions/explode_" .. math.random( 1, 9 ) .. ".wav", 75, math.random( 215, 230 ) )
		owner:GiveStatus( "burn", 15, self )
		if SERVER then
			for i = 1, math.random( 9, 11 ) do
				local ent = ents.Create( "projectile_fireofdespair" )
				if IsValid( ent ) then
					ent:SetPos( owner:GetShootPos() )

					angle = owner:GetAimVector():Angle()
					ent:SetAngles( angle )
					ent:SetOwner( owner )

					ent.ProjDamage = self.MeleeDamage * 0.7 * ( owner.AbilityDamageMul or 1 ) * ( owner.ProjectileDamageMul or 1 )
					ent.ProjSource = self
					ent.ModelType = math.random( 1, 21 )
					ent.Team = owner:Team()

					ent:Spawn()

					local phys = ent:GetPhysicsObject()
					if IsValid( phys ) then
						phys:Wake()

						angle = owner:GetAimVector():Angle()
						angle:RotateAroundAxis(angle:Forward(), math.Rand(-37, 37))
						angle:RotateAroundAxis(angle:Up(), math.Rand(-27, 27))

						phys:SetVelocityInstantaneous( angle:Forward() * 850 * ( owner.ProjectileSpeedMul or 1 ) )
						phys:SetAngleVelocityInstantaneous( VectorRand() * 360 )
					end
				end
			end
		end
	end)
end

function SWEP:Think()
	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
		if self:IsCharging() then
			self:SetCharge( 0 )
		end
	end
	
	self.BaseClass.Think( self )
end	

function SWEP:StartSwinging(secondary)
	local owner = self:GetOwner()

	local armdelay = owner:GetMeleeSpeedMul()
	self:SetSwingEnd( CurTime() + ( secondary and self.SwingTimeSecondary or self.SwingTime ) * ( secondary and 1 or ( ( owner.MeleeSwingDelayMul or 1 ) * armdelay ) ) )
	if secondary then self:SetCharge( CurTime() ) end
end

function SWEP:IsCharging()
	return self:GetCharge() > 0
end

function SWEP:SetCharge( charge )
	self:SetDTFloat( 1, charge )
end

function SWEP:GetCharge()
	return self:GetDTFloat( 1 )
end