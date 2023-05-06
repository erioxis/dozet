AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base 			= 	"weapon_zs_basemelee"

SWEP.PrintName 		= 	""
SWEP.Description 	= 	""

SWEP.Secondary.ClipSize 		= 	0
SWEP.Secondary.DefaultClip 		= 	0
SWEP.Secondary.Ammo 			= 	"dummy"
SWEP.Secondary.Automatic 		=	 true

SWEP.OriginalMeleeDamage = SWEP.MeleeDamage

SWEP.Slot 			= 	0
SWEP.SlotPos 		= 	0
if CLIENT then
SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DPos = Vector(0, -1, -7)
SWEP.HUD3DAng = Angle(180, -90, 90)
SWEP.HUD3DScale = 0.065

SWEP.UseHands 		= 	true

SWEP.HoldType 		= 	"melee2"
	SWEP.ViewModelFOV = 71
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

SWEP.VElements = {
	["blade1"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(10.605, 0, -0.394), angle = Angle(0, 0, 0), size = Vector(1.299, 1.149, 1.036), color = Color(63, 8, 136, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["blade2"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-14.16, 1.792, -6.565), angle = Angle(0, 0, -90), size = Vector(1.549, 6.589, 0.873), color = Color(62, 0, 133, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["fdsgf"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(10.982, -1.071, -0.514), angle = Angle(90, 0, 0), size = Vector(0.144, 0.144, 0.527), color = Color(39, 0, 82, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glw"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-8.129, 0, 0), size = { x = 28.488, y = 28.488 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.207, 1.304, -0.219), size = { x = 39.986, y = 39.986 }, color = Color(76, 8, 155, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(19.152, 0, 0), size = { x = 35.273, y = 35.273 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade1", pos = Vector(22.038, 0, 0), size = { x = 25.401, y = 25.401 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-11.728, 0, 0), size = { x = 29.563, y = 29.563 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-3.014, 0, 0), size = { x = 30.581, y = 30.581 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(5.443, 0, 0), size = { x = 27.604, y = 27.604 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(3.605, 4.047, 0.773), size = { x = 31.601, y = 31.601 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(-2.168, 3.704, 0.451), size = { x = 31.601, y = 31.601 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["midaxe"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-21.404, 0, -1.336), angle = Angle(90, 0, 0), size = Vector(0.25, 0.25, 0.226), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanity"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.74, 1.307, -12.678), angle = Angle(90, 0, 0), size = Vector(1.726, 0.317, 0.4), color = Color(68, 3, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-17.275, 0, 0.708), angle = Angle(-66.639, 0, 0), size = Vector(0.052, 0.052, 0.052), color = Color(83, 5, 172, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-11.275, -0.5, 0.508), angle = Angle(-96.639, 0, 0), size = Vector(0.022, 0.042, 0.082), color = Color(86, 5, 172, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-15.025, 1.037, -0.649), angle = Angle(-90, 0, 0), size = Vector(0.103, 0.103, 0.103), color = Color(45, 4, 91, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-9.214, 0, 1.098), angle = Angle(90, 0, 0), size = Vector(0.141, 0.141, 0.776), color = Color(68, 4, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-5.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.171, 1.098), color = Color(52, 2, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-4.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.371, 2.098), color = Color(52, 2, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["singularity"] = { type = "Model", model = "models/effects/combineball.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "sanity", pos = Vector(-14.4, 1.286, -3.839), angle = Angle(0, 90, 0), size = Vector(0.398, 0.398, 0.324), color = Color(156, 77, 246, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["blade1"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(4.932, 0, -0.375), angle = Angle(0, 0, 0), size = Vector(0.86, 1.169, 0.915), color = Color(42, 2, 89, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["blade2"] = { type = "Model", model = "models/gibs/furniture_gibs/furnituretable001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.289, 2.079, -6.7), angle = Angle(0, 0, -90), size = Vector(1.146, 6.401, 1.256), color = Color(51, 0, 110, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["fdsgf"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(10.982, -1.071, -0.514), angle = Angle(90, 0, 0), size = Vector(0.144, 0.144, 0.527), color = Color(39, 0, 82, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["glw"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-8.129, 0, 0), size = { x = 38.488, y = 38.488 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.207, 1.304, -0.219), size = { x = 49.986, y = 49.986 }, color = Color(76, 8, 155, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(19.152, 0, 0), size = { x = 25.273, y = 25.273 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade1", pos = Vector(22.038, 0, 0), size = { x = 35.401, y = 35.401 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-11.728, 0, 0), size = { x = 29.563, y = 29.563 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-3.014, 0, 0), size = { x = 30.581, y = 30.581 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(5.443, 0, 0), size = { x = 27.604, y = 27.604 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["glw+++++++"] = { type = "Sprite", sprite = "sprites/glow07", bone = "ValveBiped.Bip01_R_Hand", rel = "blade2", pos = Vector(1.37, 3.322, 1.281), size = { x = 22.653, y = 22.653 }, color = Color(100, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["midaxe"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-21.404, 0, -1.336), angle = Angle(90, 0, 0), size = Vector(0.25, 0.25, 0.226), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanity"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.177, 1.728, -8.789), angle = Angle(99.818, 0, 0), size = Vector(1.726, 0.317, 0.4), color = Color(68, 3, 142, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-17.275, 0, 0.708), angle = Angle(-66.639, 0, 0), size = Vector(0.052, 0.052, 0.052), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityd++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-15.025, 1.037, -0.649), angle = Angle(-90, 0, 0), size = Vector(0.103, 0.103, 0.103), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-9.214, 0, 1.098), angle = Angle(90, 0, 0), size = Vector(0.141, 0.141, 0.776), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["sanityda+"] = { type = "Model", model = "models/props_debris/concrete_chunk04a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "sanity", pos = Vector(-5.362, 0, -0.835), angle = Angle(-90, 0, 0), size = Vector(0.141, 0.171, 1.098), color = Color(63, 0, 127, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/combine_dropship.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(3.851, -2.827, 0), angle = Angle(0, -14.48, 90.464), size = Vector(0.037, 0.037, 0.037), color = Color(146, 0, 255, 255), surpresslightning = false, material = "models/effects/splode1_sheet", skin = 0, bodygroup = {} },
	["element_name+"] = { type = "Model", model = "models/combine_dropship.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-9.214, -3.415, 0), angle = Angle(180, 14.024, 90), size = Vector(0.037, 0.037, 0.037), color = Color(155, 0, 255, 255), surpresslightning = false, material = "models/effects/splode1_sheet", skin = 0, bodygroup = {} },
	["element_name++"] = { type = "Model", model = "models/mortarsynth.mdl", bone = "ValveBiped.Bip01_Spine2", rel = "", pos = Vector(0.486, 2.273, 0), angle = Angle(-0.413, 0, 90), size = Vector(0.289, 0.289, 0.289), color = Color(155, 0, 255, 255), surpresslightning = false, material = "models/effects/splode1_sheet", skin = 0, bodygroup = {} },
	["element_name+++"] = { type = "Model", model = "models/mortarsynth.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(4.583, 4.263, -0.131), angle = Angle(180, 21.969, 90), size = Vector(0.198, 0.198, 0.198), color = Color(10, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["element_name++++"] = { type = "Model", model = "models/mortarsynth.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(7.651, 1.486, -0.011), angle = Angle(180, 76.87, 90), size = Vector(0.198, 0.198, 0.198), color = Color(10, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["element_name+++++"] = { type = "Model", model = "models/mortarsynth.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(3.463, -3.619, 0.14), angle = Angle(180, -148.088, 90), size = Vector(0.198, 0.198, 0.198), color = Color(10, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["element_name++++++"] = { type = "Model", model = "models/mortarsynth.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(7.808, -2.125, 0.116), angle = Angle(180, 144.703, 90), size = Vector(0.198, 0.198, 0.198), color = Color(10, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["element_name++++++++"] = { type = "Model", model = "models/effects/splode.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-0.713, -2.241, -0.205), angle = Angle(79.583, -76.738, -90.127), size = Vector(0.014, 0.014, 0.014), color = Color(140, 0, 255, 218), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name+++++++++"] = { type = "Model", model = "models/props_combine/breentp_rings.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-0.758, -3.5, -0.038), angle = Angle(79.583, -76.738, -90.127), size = Vector(0.027, 0.027, 0.027), color = Color(140, 0, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["new++"] = { type = "Model", model = "models/gibs/shield_scanner_gib4.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(2.065, 3.223, -0.005), angle = Angle(-11.386, -180, 119.379), size = Vector(0.957, 0.957, 0.957), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++"] = { type = "Model", model = "models/gibs/shield_scanner_gib4.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(2.226, 3.167, 0.075), angle = Angle(15.604, 180, 101.38), size = Vector(0.957, 0.957, 0.957), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_2.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(2.638, 4.572, 0.217), angle = Angle(10.593, -88.425, -86.797), size = Vector(0.349, 0.349, 0.349), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++"] = { type = "Model", model = "models/gibs/shield_scanner_gib4.mdl", bone = "ValveBiped.Bip01_Head1", rel = "", pos = Vector(2.065, 3.223, -0.005), angle = Angle(176.19, 3.661, -72.477), size = Vector(0.957, 0.957, 0.957), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++++"] = { type = "Model", model = "models/weapons/w_bugbait.mdl", bone = "ValveBiped.Bip01_R_Thigh", rel = "", pos = Vector(7.26, -0.166, -0.371), angle = Angle(180, 0, -90.199), size = Vector(4.946, 1.408, 1.408), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++++"] = { type = "Model", model = "models/weapons/w_bugbait.mdl", bone = "ValveBiped.Bip01_L_Thigh", rel = "", pos = Vector(9.862, -0.174, 0.342), angle = Angle(180, 0, -90.199), size = Vector(4.946, 1.408, 1.408), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++++++"] = { type = "Model", model = "models/weapons/w_bugbait.mdl", bone = "ValveBiped.Bip01_R_UpperArm", rel = "", pos = Vector(5.097, -0.174, 0.342), angle = Angle(180, 0, -90.199), size = Vector(3.417, 1.408, 1.408), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++++++"] = { type = "Model", model = "models/weapons/w_bugbait.mdl", bone = "ValveBiped.Bip01_L_UpperArm", rel = "", pos = Vector(5.097, -0.174, 0.342), angle = Angle(180, 0, -90.199), size = Vector(3.417, 1.408, 1.408), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++++++++"] = { type = "Model", model = "models/props_combine/stasisfield.mdl", bone = "ValveBiped.Bip01_Spine", rel = "", pos = Vector(3.72, -1.706, 0.354), angle = Angle(-75.502, 90.5, 90.505), size = Vector(0.01, 0.01, 0.01), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++++++++"] = { type = "Model", model = "models/props_combine/combine_teleport_2.mdl", bone = "ValveBiped.Bip01_Spine", rel = "", pos = Vector(-6.571, -2.109, 0.703), angle = Angle(2.417, 90.5, 90.505), size = Vector(0.017, 0.017, 0.017), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++++++++++"] = { type = "Model", model = "models/props_combine/stasisfield.mdl", bone = "ValveBiped.Bip01_Spine", rel = "", pos = Vector(3.72, -1.706, 0.354), angle = Angle(-75.502, 90.5, 90.505), size = Vector(0.01, 0.01, 0.01), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++++++++++"] = { type = "Model", model = "models/props_combine/combine_teleport_2.mdl", bone = "ValveBiped.Bip01_Spine1", rel = "", pos = Vector(-4.822, -1.681, 0.521), angle = Angle(2.417, 90.5, 90.505), size = Vector(0.017, 0.017, 0.017), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new++++++++++++++"] = { type = "Model", model = "models/props_lab/teleportgate.mdl", bone = "ValveBiped.Bip01_R_Forearm", rel = "", pos = Vector(4.977, 1.348, 0), angle = Angle(180, 90.89, 176.337), size = Vector(0.126, 0.126, 0.126), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["new+++++++++++++++"] = { type = "Model", model = "models/props_lab/teleportgate.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(4.977, 0.712, 0), angle = Angle(180, 90.89, 0.791), size = Vector(0.126, 0.126, 0.126), color = Color(140, 0, 255, 255), surpresslightning = false, material = "models/shadertest/envball_3", skin = 0, bodygroup = {} },
	["element_name++++++++++"] = { type = "Model", model = "models/effects/splode.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-0.532, -3.046, 0.05), angle = Angle(79.583, -76.738, 90), size = Vector(0.014, 0.014, 0.014), color = Color(140, 0, 255, 218), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
end
SWEP.ViewModel 		= 	"models/weapons/c_crowbar.mdl"
SWEP.WorldModel 	= 	"models/weapons/w_crowbar.mdl"
SWEP.Tier = 7

SWEP.MeleeType 					=	"axe"

SWEP.Hidden 					=	true

SWEP.StaminaTake 				=	0

SWEP.MeleeDamage 				= 	52
SWEP.OriginalMeleeDamage 		= 	52
SWEP.MeleeRange 				= 	87
SWEP.MeleeSize 					= 	7

SWEP.SwingRotation 				= 	Angle( 30, -20, 10 )
SWEP.SwingOffset 				= 	Vector( 0, -30, 0 )
SWEP.Primary.Delay 				= 	1
SWEP.SwingTime					=	0.6
SWEP.SwingHoldType 				= 	"melee2"

SWEP.ShiftTime 					=	CurTime()

SWEP.MeleeSplash 				=	true

SWEP.NextReload 				=	CurTime()

SWEP.OnMeleeHit 				=	0
SWEP.PostOnMeleeHit				=	CurTime()

SWEP.AllowQualityWeapons 		= 	true

function SWEP:SetHitStacks( stacks )
	self:SetDTFloat( 11, stacks )
end

function SWEP:GetHitStacks()
	return self:GetDTFloat( 11 )
end

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "physics/concrete/boulder_impact_hard3.wav")
	self.ChargeSound2 = CreateSound(self, "physics/concrete/boulder_impact_hard4.wav")
end

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if not hitent:IsPlayer() then
		self.MeleeDamage = 65
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	self.MeleeDamage = self.OriginalMeleeDamage
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextAttack()

	local owner = self:GetOwner()

	if self.SwingTime == 0 then
		self:MeleeSwing()
	else
		self:StartSwinging()
		local sndname = "zombie/archangel_attack"..math.random(4)..".wav"
		local sndname2 = "npc/zombie_poison/pz_throw3.wav"
		for i = 1, 5 do
			timer.Simple(0.02 * i,
				function() if owner:IsValid() then owner:EmitSound(sndname, 100, math.random(75, 85) - i*5, 1, CHAN_AUTO)
				owner:EmitSound(sndname2, 100, math.random(25, 35) - i*6, 0.3, CHAN_AUTO) end
			end)
		end
	end
end

function SWEP:PlaySwingSound()
	self:GetOwner():EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 55, 65 ) )
	self:GetOwner():EmitSound( "npc/scanner/scanner_nearmiss"..math.random(2)..".wav", 75, math.random( 145, 155 ) )
end

function SWEP:PlayHitSound()
	self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, math.random(20,35) )
	self:GetOwner():EmitSound( "weapons/melee/golf club/golf_hit-0" .. math.random( 4 ) .. ".ogg", 100, 30 )
	self:GetOwner():EmitSound( "zombie/punch.wav", 100, 110 )
end

function SWEP:SecondaryAttack()
    local owner = self:GetOwner()
	if owner:KeyDown(IN_ATTACK2) and self.BlockTrue and self:GetHitStacks() >= 1 then
		self.Secondary.Automatic = false
	    owner:EmitSound("npc/metropolice/pain1.wav", 75, 45, 0.8)
	    owner:EmitSound( "zombie/pound_wall.wav", 100, 60 )
	    owner:EmitSound( "zombie/pound_wall.wav", 100, 10 )
	    owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(60, 80))
	    owner:EmitSound("ambient/alarms/klaxon1.wav", 75, 45, 0.7)
		self.ChargeSound:PlayEx( 1, 255 ) 
		self.ChargeSound2:PlayEx( 1, 15, 0.4 )
		self:SetCharge(CurTime())
		owner:GiveStatus("zomstrenght", 8)
		owner:GiveStatus("zomdefence", 8)
		local boost = owner:GiveStatus( "adrenalineamp", 8 )
		if boost and boost:IsValid() then
			boost:SetSpeed( 165 )
		end
		self:SetNextAttack(true)
		self:StartSwinging(true)
		self:SetHitStacks( 0 )

		local sndname = "zombie/archangel_fly"..math.random(2)..".wav"
			for i = 1, 4 do
				timer.Simple(0.02 * i,
					function() if owner:IsValid() then owner:EmitSound(sndname, 100, math.random(65, 75) - i*6, 0.6, CHAN_AUTO) end
				end)
			end
				if not self:IsCharging() then
				self.Secondary.Automatic = true
			self:SetCharge(0)
		end

	end
end

function SWEP:MeleeSwing()
	local charg = self:IsCharging()
	local owner = self:GetOwner()
	owner:DoAnimationEvent( ACT_MP_ATTACK_STAND_PRIMARYFIRE )
	if ( charg ) then		
		local effectdata = EffectData()
			effectdata:SetOrigin(owner:GetPos() + Vector(0,0,45))
		util.Effect("explosion_abyssaxe", effectdata)
	end

	if ( SERVER ) then

		if ( charg ) then
			owner:SetLocalVelocity( Vector( 0, 0, 400 ) )
			self.Secondary.Automatic = true
			for i = 1, 16 do
				timer.Simple( ( 0.23 + 0.02 * i ) + ( i > 8 and 0.2 or 0 ), function()
					local ent = ents.Create("projectile_abysstyrant")
					if ent:IsValid() then
						ent:SetPos( owner:GetShootPos() )

						local angle = Angle( 0,  0 + 45 * i, 0 )
						ent:SetAngles( angle )

						ent:SetOwner( owner )

						owner:EmitSound( ")npc/barnacle/barnacle_gulp1.wav", 75, math.random( 145, 155 ) )

						ent.ProjDamage = self.MeleeDamage * 0.075 * ( owner.AbilityDamageMul or 1 ) * ( owner.ProjectileDamageMul or 1 )
						ent.ProjSource = self
						ent.Team = owner:Team()

						ent:Spawn()

						local phys = ent:GetPhysicsObject()
						if phys:IsValid() then
							phys:Wake()

							angle = Angle( 0,  0 + 45 * i, 0 )
							--angle:RotateAroundAxis( angle:Forward(), math.Rand( 0, 360 ) )

							phys:SetVelocityInstantaneous( i > 8 and angle:Forward() * 555 or angle:Forward() * 135 )
						end
					end
				end)
			end
			timer.Simple( 1, function()
				owner:SetLocalVelocity( Vector( 0, 0, -4250 ) )
				timer.Simple( 0.75, function()
					owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(40, 60))
				end)
			end)
		end
	end

	if self:GetOwner():IsValid() and self:GetHitStacks() >= 1 and self.Secondary.Automatic == false then
		self.ChargeSound:PlayEx(0.8, 180)
		self.ChargeSound2:PlayEx(0.8, 180)
	end
	self.BaseClass.MeleeSwing( self )
end

local function DoFleshThrow(pl, wep)
	if pl:IsValid() and pl:Alive() and wep:IsValid() then
		--pl:ResetSpeed()
		pl.LastRangedAttack = CurTime()

		local startpos = pl:GetPos()
		startpos.z = pl:GetShootPos().z
		local heading = pl:GetAimVector()
		local ent = ents.Create("projectile_abysssingularity")
		if ent:IsValid() then
			ent:SetPos(startpos + heading * 8)
			ent:SetAngles(AngleRand())
			ent:SetOwner(pl)
			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:SetVelocityInstantaneous(heading * 850)
				phys:AddAngleVelocity(VectorRand() * 265)
			end
		end

		pl:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav", 72, math.random(140, 150))
		pl:EmitSound("npc/manhack/grind1.wav", 72, math.random(40, 50))

	end
end

function SWEP:Reload()
	local time = CurTime()
	if time < self:GetNextPrimaryFire() or time < self:GetNextSecondaryFire() or time < self.NextReload then return end

	local owner = self:GetOwner()

	owner:DoAnimationEvent(ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE)
	owner:EmitSound("zombie/toxicshade_death.wav", 100, math.random(105,100))
	local sndname = "zombie/archangel_attack"..math.random(4)..".wav"
	local sndname2 = "npc/zombie_poison/pz_throw3.wav"
	for i = 1, 15 do
		timer.Simple(0.02 * i,
			function() if owner:IsValid() then owner:EmitSound(sndname, 100, math.random(75, 85) - i*3, 1, CHAN_AUTO)
			owner:EmitSound(sndname2, 100, math.random(25, 35) - i*1, 0.3, CHAN_AUTO) end
		end)
	end
	--self:GetOwner():SetSpeed(1)
	self:SetNextSecondaryFire(time + 1.6)
	self:SetNextPrimaryFire(time + self.Primary.Delay)
	self.NextReload = time + 50
	if ( SERVER ) then
		timer.Simple(0.05, function() DoFleshThrow(owner, self) end)
	end
end

function SWEP:Think()
    local owner = self:GetOwner()
	local ang = owner:EyeAngles()
	local pos =  owner:GetPos()
	local aim = owner:GetAimVector()
	local vec_wow = Vector( 0, 0, 455 ) + aim * 525
	if owner:KeyDown(IN_SPEED) and CurTime() > self.ShiftTime then
		util.ScreenShake(pos, 7, 185, 1, 560)
		owner:SetVelocity( vec_wow )
		owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(40, 60) )
		timer.Simple(0.1, function() self.IsGrounding = false end)
		self.ShiftTime = CurTime() + 7
		owner:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_HL2MP_SWIM_MELEE2, true)
		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
			effectdata:SetNormal(pos)
		util.Effect("voidmarrow", effectdata)
		util.Effect("explosion_abyssjump", effectdata)
	end
	if not owner:OnGround() and not self.IsGrounding then
		owner:SetVelocity( aim * 2.5  )
	end
	if not self.IsGrounding and owner:OnGround() then
		util.BlastDamagePlayer(self, owner, pos, 185, 18 + math.max( 1 + ( ( math.abs( owner:GetVelocity().x ) + math.abs( owner:GetVelocity().y ) ) /25 ), 0) , DMG_CLUB)
		self.IsGrounding = true
		for k, v in ipairs( ents.FindInBoxRadius( pos, 185 ) ) do
			if v:IsValid() and not v:IsValidLivingZombie() then
				v:SetVelocity( ( pos - v:GetPos() ) * 4 + Vector( 0, 0, 125 ) )
			end
			if v:IsValidLivingHuman() then
				v:GiveStatus( "enfeeble", 1, owner )
				v:GiveStatus( "bloodysickness", 2, owner )
				v:GiveStatus( "slow", 3, owner )
				v:GiveStatus( "numbness", .1, owner )
			end
		end
		owner:EmitSound("physics/concrete/boulder_impact_hard"..math.random(1, 4)..".wav", 100, math.random(40, 60) )
		owner:EmitSound("physics/metal/metal_box_impact_bullet"..math.random(1, 3)..".wav", 100, math.random(40, 60) )
		owner:EmitSound("physics/concrete/concrete_break"..math.random(2,3)..".wav", 75, math.random(55, 65), 0.8)
		util.ScreenShake(pos, 7, 185, 1, 560)
		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
			effectdata:SetNormal(pos)
		util.Effect("gore_blast", effectdata)
		util.Effect("explosion_chainburster", effectdata)
		util.Effect("RagdollImpact", effectdata)
	end
	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
		if self:IsCharging() then
			self:SetCharge(0)
		end
	end

    if self:GetHitStacks() >= 1 then
       	self.UpperDamage = true
    elseif self:GetHitStacks() <= 0 then
       	self.UpperDamage = false
		self.ChargeSound:Stop()
		self.ChargeSound2:Stop()
     end
    self.BaseClass.Think(self)
end	

function SWEP:StartSwinging(secondary)
	local owner = self:GetOwner()

	local armdelay = owner:GetMeleeSpeedMul()
	self:SetSwingEnd(CurTime() + (secondary and self.SwingTimeSecondary or self.SwingTime) * (owner.MeleeSwingDelayMul or 1) * armdelay)
	if secondary then self:SetCharge(CurTime()) end
end

function SWEP:IsCharging()
	return self:GetCharge() > 0
end

function SWEP:SetCharge(charge)
	self:SetDTFloat(1, charge)
end

function SWEP:GetCharge()
	return self:GetDTFloat(1)
end

if not CLIENT then return end
local matSheet = Material("models/headcrab_black/blackcrab_sheet")
function SWEP:DrawWorldModel()
	local time = UnPredictedCurTime() * 4
	local size = math.sin(time)
	local vec = Vector(0.014 + 0.001 * math.sin(time), 0.014 + 0.001 * math.sin(time * 2), 0.014 + 0.001 * math.sin(time * 1.5))
	local vec2 = Vector(0.027 + 0.005 * math.sin(time), 0.027 + 0.005 * math.sin(time * 2), 0.027 + 0.005 * math.sin(time * 1.5))
	self.WElements["element_name++++++++"].size = vec
	self.WElements["element_name+++++++++"].size = vec2
	self.WElements["element_name++++++++++"].size = vec
	self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
        render.SetBlend(1)
    end
    local time = UnPredictedCurTime()
	for k, v in pairs( self.VElements ) do
		for i = 1,3 do
			local vec_time = time * ( v.size[i] and v.size[i]*2.5 or 1 )
			v.pos[i] = ( k == "blade1" or k == "sanity" ) and v.pos[i] or v.pos[i] + 0.02 * ( i == 2 and math.sin(time * i * 2) or math.cos(time * i) )
			if v.angle then
				v.angle[i] = ( k == "blade1" or k == "sanity" ) and v.angle[i] or v.angle[i] + -0.06 * math.sin(time * i)
			end
		end
	end
	if self.HUD3DPos and GAMEMODE:ShouldDraw3DWeaponHUD() then
        local pos, ang = self:GetHUD3DPos(vm)
        if pos then
            self:Draw3DHUD(vm, pos, ang)
        end
    end
end

function SWEP:GetHUD3DPos(vm)
	local bone = vm:LookupBone(self.HUD3DBone)
	if not bone then return end

	local m = vm:GetBoneMatrix(bone)
	if not m then return end

	local pos, ang = m:GetTranslation(), m:GetAngles()

	if self.ViewModelFlip then
		ang.r = -ang.r
	end

	local offset = self.HUD3DPos
	local aoffset = self.HUD3DAng

	pos = pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z

	if aoffset.yaw ~= 0 then ang:RotateAroundAxis(ang:Up(), aoffset.yaw) end
	if aoffset.pitch ~= 0 then ang:RotateAroundAxis(ang:Right(), aoffset.pitch) end
	if aoffset.roll ~= 0 then ang:RotateAroundAxis(ang:Forward(), aoffset.roll) end

	return pos, ang
end

function SWEP:Draw2DHUD()
	local ablicolor = Color( 75 * math.max(self:GetHitStacks(), 0.1), 15 * math.max(self:GetHitStacks(), 0.5), 255 * math.min(self:GetHitStacks(), 0.65) )
	self:Draw2DFeature( self:GetHitStacks(), nil, nil, "weapon_ability_abyssaxe_2d", "ZSHUDFontSmallest", ablicolor )
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 120, 200
	local x, y = wid * -0.6, hei * -0.5
	local ablicolor = Color( 75 * math.max(self:GetHitStacks(), 0.1), 15 * math.max(self:GetHitStacks(), 0.5), 255 * math.min(self:GetHitStacks(), 0.65) )

	cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
			self:Draw3DFeatureHorizontal( vm, pos, ang, self:GetHitStacks(), nil, nil, "weapon_ability_abyssaxe_3d", "ZSHUDFont", ablicolor )
	cam.End3D2D()
end

function SWEP:DrawHUD()
	local screenscale = BetterScreenScale()
	local owner = self:GetOwner()
	local matGlow = Material("models/effects/comball_sphere")
	local wid, hei = ScrW() * 0.18, ScrH() * 0.03
	local x, y = ScrW() - wid - screenscale * 64, ScrH() - hei - screenscale * 32


	surface.SetDrawColor( Color( 25, 255, 25, 16 ) )
	surface.SetMaterial( matGlow )
	surface.DrawTexturedRect( x, y, wid, hei )

	surface.SetDrawColor( 0, 0, 0, 70 )
	surface.DrawRect( x, y, wid, hei )

	local color = Color( 145 + ( self.NextReload - CurTime() ) * 1.5, 45 + ( self.NextReload - CurTime() ) * 13, 250 - ( self.NextReload - CurTime() ), 255 )
	local nextpuk = self.NextReload - CurTime()
	local nextpuke = math.ceil( self.NextReload - CurTime() )
	if nextpuke > 0 then
		draw.SimpleText( nextpuke, "ZSHUDFontSmallest", x + wid - ScrW() * 0.008, y - hei + 10, color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT )
	end

	local widx = math.Clamp( wid * nextpuk / 50, 0, wid )

	surface.SetDrawColor( color )
	surface.SetMaterial( matSheet )
	surface.DrawRect( x, y, widx, hei )

	x, y, wid, hei = x * 1.01, y * 1.005, wid * 0.91, hei * 0.7
	nextpuk = self.ShiftTime - CurTime()
	nextpuke = math.ceil( self.ShiftTime - CurTime() )

	color = Color( 145 - ( self.ShiftTime - CurTime() ) * 10, 45 + ( self.ShiftTime - CurTime() ) * 13, ( self.ShiftTime - CurTime() ) * 30, 255 )

	if nextpuke > 0 then
		draw.SimpleText( nextpuke, "ZSHUDFontSmallest", x + wid - ScrW() * 0.008, y - hei + 50, color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT )
	end

	surface.SetDrawColor( 0, 0, 0, 70 )
	surface.DrawRect( x, y, wid, hei )

	widx = math.Clamp( wid * nextpuk / 7, 0, wid )

	surface.SetDrawColor( color )
	surface.SetMaterial( matSheet )
	surface.DrawRect( x, y, widx, hei )

	self.BaseClass.DrawHUD( self )
end
