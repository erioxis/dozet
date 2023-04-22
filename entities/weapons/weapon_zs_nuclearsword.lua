AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base 			= 	"weapon_zs_basemelee"

SWEP.PrintName 		= 	""
SWEP.Description 	= 	""

SWEP.Slot 			= 	0
SWEP.SlotPos 		= 	0

	SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
	SWEP.HUD3DPos = Vector(-0.7, -1, -7)
	SWEP.HUD3DAng = Angle(180, -90, 90)
	SWEP.HUD3DScale = 0.045
SWEP.Hidden = true
SWEP.ViewModel 		= 	"models/weapons/c_crowbar.mdl"
SWEP.WorldModel 	= 	"models/weapons/w_crowbar.mdl"
SWEP.UseHands 		= 	true

SWEP.HoldType 		= 	"melee2"
if CLIENT then
	SWEP.ViewModelFOV = 70
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

SWEP.VElements = {
	["nuclearsword"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.986, 1.677, 1.549), angle = Angle(0, 0, 0), size = Vector(0.268, 0.268, 0.268), color = Color(55, 255, 55, 225), surpresslightning = false, material = "effects/combinedisplay001b", skin = 0, bodygroup = {} },
	["nuclearsword+"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.105, 1.728, -1.102), angle = Angle(-90.522, 0, -24.269), size = Vector(0.245, 0.523, 0.523), color = Color(0, 255, 46, 255), surpresslightning = false, material = "effects/combinedisplay001b", skin = 0, bodygroup = {} },
	["nuclearsword+++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.563, 2.901, -4.803), angle = Angle(-52.044, 145.49, -94.335), size = Vector(1.08, 0.363, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["nuclearsword++++"] = { type = "Model", model = "models/items/item_item_crate_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.897, 2.753, -10.723), angle = Angle(-6.167, 64.285, 81.65), size = Vector(0.043, 0.245, 0.114), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++"] = { type = "Model", model = "models/items/item_item_crate_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.885, 2.338, -11.341), angle = Angle(-6.167, 64.285, 90.914), size = Vector(0.039, 0.218, 0.143), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++"] = { type = "Model", model = "models/gibs/wood_gib01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.878, 2.062, -5.63), angle = Angle(-90.697, 154.074, 90.186), size = Vector(0.093, 0.577, 0.72), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.105, 0.69, -4.672), angle = Angle(-52.044, -35.993, -94.335), size = Vector(1.08, 0.363, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["nuclearsword++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.246, 2.769, -32.578), angle = Angle(-159.536, -35.354, 90.181), size = Vector(0.377, 0.689, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.191, 5.41, -32.869), angle = Angle(-159.536, 149.449, 90.181), size = Vector(0.377, 0.689, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.979, 4.162, -36.086), angle = Angle(88.573, 149.449, 90.181), size = Vector(0.28, 0.252, 0.074), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.507, 3.085, -26.264), angle = Angle(88.573, 149.449, 90.181), size = Vector(0.896, 0.638, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.94, 5.008, -16.151), angle = Angle(168.279, 145.447, 90.084), size = Vector(0.377, 1.161, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.596, 4.33, -19.393), angle = Angle(-15.671, 149.449, 90.181), size = Vector(0.25, 0.535, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.041, 4.587, -30.671), angle = Angle(174.789, 149.449, 90.181), size = Vector(0.377, 0.483, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.801, 0.333, -16.421), angle = Angle(179.442, -35.576, 90.084), size = Vector(0.377, 1.161, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.092, 2.45, -17.855), angle = Angle(-166.599, -35.576, 90.084), size = Vector(0.3, 0.782, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.983, 0.273, -23.646), angle = Angle(177.067, -35.576, 90.084), size = Vector(0.094, 0.796, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.88, 4.245, -25.609), angle = Angle(-64.336, -35.576, 90.084), size = Vector(0.231, 0.144, 0.017), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.256, 1.151, -19.576), angle = Angle(177.067, -35.576, 90.084), size = Vector(0.144, 0.133, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.668, 2.726, -33.942), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.234, 5.622, -25.358), angle = Angle(180, -35.576, 90.084), size = Vector(0.202, 0.217, 0.017), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.529, 2.532, -6.052), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.396, 3.158, -12.658), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.504, 1.378, -15.641), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.855, 3.174, -20.385), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.585, 2.661, -24.098), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.657, 5.38, -30.254), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.016, 0.016, 0.016), color = Color(55, 255, 55, 225), surpresslightning = false, material = "effects/screenwarp", skin = 0, bodygroup = {} },
	["nucs"] = { type = "Sprite", sprite = "sprites/animglow02", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.456, 1.562, -6.485), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 20), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.41, 2.079, -10.714), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs++"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.828, 3.131, -25.014), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+++"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.138, 4.007, -34.885), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs++++"] = { type = "Sprite", sprite = "effects/combinemuzzle1", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.75, 2.811, -27.644), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 25), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+++++"] = { type = "Sprite", sprite = "models/effects/splode_sheet", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.306, 2.131, -20.703), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 19), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true}
}


SWEP.WElements = {
	["nuclearsword"] = { type = "Model", model = "models/items/combine_rifle_ammo01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.163, 1.463, 1.633), angle = Angle(0, 0, 0), size = Vector(0.268, 0.268, 0.268), color = Color(55, 255, 55, 225), surpresslightning = false, material = "effects/combinedisplay001b", skin = 0, bodygroup = {} },
	["nuclearsword+"] = { type = "Model", model = "models/items/crossbowrounds.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.105, 1.728, -1.102), angle = Angle(-90.522, 0, -24.269), size = Vector(0.245, 0.523, 0.523), color = Color(55, 255, 55, 225), surpresslightning = false, material = "effects/combinedisplay001b", skin = 0, bodygroup = {} },
	["nuclearsword+++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.563, 2.901, -4.803), angle = Angle(-52.044, 145.49, -94.335), size = Vector(1.08, 0.363, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["nuclearsword++++"] = { type = "Model", model = "models/items/item_item_crate_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.897, 2.753, -10.723), angle = Angle(-6.167, 64.285, 81.65), size = Vector(0.043, 0.245, 0.114), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++"] = { type = "Model", model = "models/items/item_item_crate_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.885, 2.338, -11.341), angle = Angle(-6.167, 64.285, 90.914), size = Vector(0.039, 0.218, 0.143), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++"] = { type = "Model", model = "models/gibs/wood_gib01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.878, 2.062, -5.63), angle = Angle(-90.697, 154.074, 90.186), size = Vector(0.093, 0.577, 0.72), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++"] = { type = "Model", model = "models/gibs/metal_gib5.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.105, 0.69, -4.672), angle = Angle(-52.044, -35.993, -94.335), size = Vector(1.08, 0.363, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["nuclearsword++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.246, 2.769, -32.578), angle = Angle(-159.536, -35.354, 90.181), size = Vector(0.377, 0.689, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.191, 5.41, -32.869), angle = Angle(-159.536, 149.449, 90.181), size = Vector(0.377, 0.689, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.979, 4.162, -36.086), angle = Angle(88.573, 149.449, 90.181), size = Vector(0.28, 0.252, 0.074), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.507, 3.085, -26.264), angle = Angle(88.573, 149.449, 90.181), size = Vector(0.896, 0.638, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.94, 5.008, -16.151), angle = Angle(168.279, 145.447, 90.084), size = Vector(0.377, 1.161, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.596, 4.33, -19.393), angle = Angle(-15.671, 149.449, 90.181), size = Vector(0.25, 0.535, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.041, 4.587, -30.671), angle = Angle(174.789, 149.449, 90.181), size = Vector(0.377, 0.483, 0.118), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.801, 0.333, -16.421), angle = Angle(179.442, -35.576, 90.084), size = Vector(0.377, 1.161, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.092, 2.45, -17.855), angle = Angle(-166.599, -35.576, 90.084), size = Vector(0.3, 0.782, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.983, 0.273, -23.646), angle = Angle(177.067, -35.576, 90.084), size = Vector(0.094, 0.796, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.88, 4.245, -25.609), angle = Angle(-64.336, -35.576, 90.084), size = Vector(0.231, 0.144, 0.017), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.256, 1.151, -19.576), angle = Angle(177.067, -35.576, 90.084), size = Vector(0.144, 0.133, 0.179), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.668, 2.726, -33.942), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++"] = { type = "Model", model = "models/gibs/glass_shard02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.234, 5.622, -25.358), angle = Angle(180, -35.576, 90.084), size = Vector(0.202, 0.217, 0.017), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.529, 2.532, -6.052), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.396, 3.158, -12.658), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.504, 1.378, -15.641), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.855, 3.174, -20.385), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword+++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.585, 2.661, -24.098), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.008, 0.008, 0.008), color = Color(55, 255, 55, 225), surpresslightning = false, material = "models/effects/splode_sheet", skin = 0, bodygroup = {} },
	["nuclearsword++++++++++++++++++++++++++++"] = { type = "Model", model = "models/effects/splodeglass.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.657, 5.38, -30.254), angle = Angle(66.719, -35.576, 90.084), size = Vector(0.016, 0.016, 0.016), color = Color(55, 255, 55, 225), surpresslightning = false, material = "effects/screenwarp", skin = 0, bodygroup = {} },
	["nucs"] = { type = "Sprite", sprite = "sprites/animglow02", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.456, 1.562, -6.485), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 20), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.41, 2.079, -10.714), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs++"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.828, 3.131, -25.014), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+++"] = { type = "Sprite", sprite = "effects/strider_muzzle", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.138, 4.007, -34.885), size = { x = 50, y = 50 }, color = Color(38, 255, 0, 33), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs++++"] = { type = "Sprite", sprite = "effects/combinemuzzle1", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.75, 2.811, -27.644), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 25), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true},
	["nucs+++++"] = { type = "Sprite", sprite = "models/effects/splode_sheet", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.306, 2.131, -20.703), size = { x = 24.569, y = 50 }, color = Color(38, 255, 0, 19), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = true}
}


end

SWEP.Tier = 8

SWEP.MeleeType = "sword"

SWEP.MeleeDamage = 1254
SWEP.MeleeRange = 86
SWEP.MeleeSize = 7

SWEP.Primary.Delay = 0.82

SWEP.SwingRotation = Angle( 30, -20, 10 )
SWEP.SwingOffset = Vector( 0, -30, 0 )
SWEP.SwingTime = 0.6
SWEP.SwingHoldType = "melee"

SWEP.CanPierce = true

SWEP.WalkSpeed = SPEED_FAST

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05 )
GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_STAMINA_EFFECTIVE, -0.03 )

function SWEP:SetHitStacks( stacks )
	self:SetDTFloat( 11, stacks )
end

function SWEP:GetHitStacks()
	return self:GetDTFloat( 11 )
end

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "ambient/explosions/explode_"..math.random(1,5)..".wav")
	self.ChargeSound2 = CreateSound(self, "npc/scanner/scanner_electric1.wav")
end

function SWEP:PlaySwingSound()
	self:EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 65, 85 ) )
end

function SWEP:PlayHitSound()
	self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 65 )
	self:GetOwner():EmitSound( "zombies/punch.wav", 75, math.random( 140,150 ) )
end

function SWEP:ExplodeSelf( self, owner )
	local pos = owner:GetPos()

	if SERVER then
		owner:GodEnable()
	end

	util.BlastDamageEx( self, owner, pos, 255, 10650 * ( owner.AblityDamageMul or 1 ), DMG_ALWAYSGIB )
	for _, ent in pairs( ents.FindInBoxRadius( pos, 255 )) do
		if ent:IsValid() and ent:IsValidLivingZombie() then
			ent:AddLegDamageExt( 25, owner, source, SLOWTYPE_ACID )
			ent:GiveStatus( "slow", 5, owner )
			ent:GiveStatus( "numbness", 2, owner )
			ent:GiveStatus( "dimvision_unknown", 5, owner )
		end
	end

	owner:EmitSound( "ambient/explosions/citadel_end_explosion2.wav", 100, 255 )
	owner:EmitSound( "ambient/energy/whiteflash.wav", 100, 55 )
	owner:EmitSound( "ambient/materials/roust_crash2.wav", 100, 35 )

	local effectdata = EffectData()
		effectdata:SetOrigin( owner:GetPos() )
		effectdata:SetStart( owner:GetAimVector() )
	util.Effect("explosion_toxin", effectdata)
	util.Effect("explosion_heirapp", effectdata)

	if SERVER then
		owner:GodDisable()
	end

	self:SetHitStacks( 0 )
end


function SWEP:Ability( owner, self, pos )
	local ang = owner:EyeAngles()
	ang.pitch = math.Clamp(ang.pitch / 1.2, -1, -2)
	local vel = ( 3155 * math.min(self:GetCharge() + 0.7, 1) * ang:Forward() )
	local vec_nil = Vector(0, 0, 0) + owner:GetAimVector() * 250
	owner:SetGroundEntity(NULL)
	owner:SetLocalVelocity(vel)
	owner:SetAnimation(PLAYER_JUMP)
	timer.Simple( 0.2, function() owner:SetLocalVelocity(vec_nil) end )
	for _, ent in pairs( ents.FindInBoxRadius( pos , 24 )) do
		if ent:IsValid() and ent:IsValidLivingZombie() then 
			owner.NoCollideAll = owner:Team() == TEAM_HUMAN and ent
			owner:CollisionRulesChanged()
			timer.Create("checkcoll", 0.05, 0, function()
				owner.NoCollideAll = nil
				owner:CollisionRulesChanged()
			end)
		end
	end

	for _, ent in pairs(ents.FindInBoxRadius( owner:GetPos(), 24 )) do
		if ent:IsValid() and ent:IsValidLivingZombie() and owner:GetVelocity():LengthSqr() > 25000 then 
			self:SetChargeStart(CurTime() + 0.02)
			owner:EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, 250, 0.3 )
			ent:TakeSpecialDamage( ( math.random( 250, 350 ) + self.MeleeDamage / 750 ) * ( owner.AblityDamageMul or 1 ), DMG_GENERIC, owner, self )
			util.BlastDamageEx( self, owner, pos, 125, 65 * ( owner.AblityDamageMul or 1 ), DMG_ALWAYSGIB )
			local toxin = ent:GiveStatus( "toxin", nil, owner )
			if toxin and toxin:IsValid() then
				toxin:AddDamage( 155, owner )
			end
			local effectdata = EffectData()
				effectdata:SetOrigin( pos )
				effectdata:SetStart( pos )
			util.Effect("explosion_murasame", effectdata)
			util.Effect("explosion_chem", effectdata)

		end
	end
end
SWEP.ReloadTime = CurTime()
function SWEP:ActivateAbility() -- Q KEY
	local owner = self:GetOwner()

	self.AbilityActive = not self.AbilityActive

	if not self.AbilityActive then
		self.SecondaryAttack = self._SecondaryAttack
		self.Reload = self._Reload
	else
		self.SecondaryAttack = function()

			local status = owner:GetStatus("nuclearsword")
			local time = CurTime()
			local pos = owner:GetPos()

			if self.ReloadTime < time and self:GetHitStacks() > 0.25 then
				self.ReloadAutomatic = true
				self.ReloadTime = time + 0.3
				self:SetHitStacks( self:GetHitStacks() - 0.25 )
				owner:GiveStatus("nuclearsword", 0.15 )
				owner:EmitSound( "ambient/energy/whiteflash.wav", 75, 215, 0.7)
				owner:GiveStatus( "immortality", 1 )
				owner:EmitSound(")weapons/explode5.wav", 80, 80, 0.4)
				owner:EmitSound("nox/sword_miss.ogg", 75, 255, 0.7)
				local effectdata = EffectData()
					effectdata:SetOrigin( pos )
					effectdata:SetStart( pos )
				util.Effect("explosion_toxin", effectdata)

				self.ChargeSound:PlayEx( 1, 255 ) 
				self.ChargeSound2:PlayEx( 1, 255, 0.4 )
			end

		end
		self.Reload = function()
			if self:GetHitStacks() >= 1 then
				self:ExplodeSelf( self, owner )
			end
		end
	end
end

function SWEP:OnHitEntityOverride( ent, dmginfo )
	local owner = self:GetOwner()
	if ent:IsValidLivingZombie() then
		ent:AddLegDamageExt( 6, owner, source, SLOWTYPE_ACID )
		self:SetHitStacks( math.min( 1, self:GetHitStacks() + dmginfo:GetDamage() * 0.000025 ) )
	end
end

function SWEP:Think()
	local owner = self:GetOwner()
	local status = owner:GetStatus("nuclearsword")
	local pos = owner:GetPos()

	if status then
		self:Ability( owner, self, pos )
	end

	if self:GetHitStacks() <= 0 then
		self.ChargeSound:Stop()
		self.ChargeSound2:Stop()
	end

	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim( ACT_VM_IDLE )
	end

	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
	end
end	

function SWEP:SetChargeStart(time)
	self:SetDTFloat(1, time)
end

function SWEP:GetChargeStart()
	return self:GetDTFloat(1)
end

function SWEP:GetCharge()
	if self:GetChargeStart() == 0 then return 0 end

	return math.Clamp((CurTime() - self:GetChargeStart()), 0, 1)
end


if not CLIENT then return end

function SWEP:DrawWorldModel()
	local time = UnPredictedCurTime()
	for k, v in pairs( self.WElements ) do
		for i = 1,3 do
			v.pos[i] = ( k == "nuclearsword+" or k == "nuclearsword" or k == "nuclearsword++" or k == "nuclearsword+++" or k == "nuclearsword+++++++" or k == "nuclearsword++++++" ) and v.pos[i] or v.pos[i] + -0.06 * TimedSin(0.1, 0, 1, 18) * ( v.size[i] and 0.4/v.size[i]^0.3 or 1 ) 
			if v.angle then
				v.angle[i] = ( k == "nuclearsword+" or k == "nuclearsword" or k == "nuclearsword++" or k == "nuclearsword+++" or k == "nuclearsword+++++++" or k == "nuclearsword++++++" ) and v.angle[i] or v.angle[i] + -0.075 * TimedSin(0.1, 0, 1, 18) * ( v.size[i] and 0.4/v.size[i]^0.4 or 1 )
			end
		end
	end
	self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel


function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
        render.SetBlend(1)
    end
	for k, v in pairs( self.VElements ) do
		for i = 1,3 do
			v.pos[i] = ( k == "nuclearsword+" or k == "nuclearsword" or k == "nuclearsword++" or k == "nuclearsword+++" or k == "nuclearsword+++++++" or k == "nuclearsword++++++" ) and v.pos[i] or v.pos[i] + -0.02 * TimedSin(0.1, 0, 1, 18) * ( v.size[i] and 0.4/v.size[i]^0.3 or 1 ) 
			if v.angle then
				v.angle[i] = ( k == "nuclearsword+" or k == "nuclearsword" or k == "nuclearsword++" or k == "nuclearsword+++" or k == "nuclearsword+++++++" or k == "nuclearsword++++++" ) and v.angle[i] or v.angle[i] + -0.025 * TimedSin(0.1, 0, 1, 18) * ( v.size[i] and 0.4/v.size[i]^0.4 or 1 )
			end
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

local matGradientRight = CreateMaterial("gradient-r", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-r", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
local colbg = Color( 0, 0, 0, 155 )
local colcr = Color( 55, 255, 55 )
function SWEP:DrawAbility2DHUD( x, y )
	local owner = self:GetOwner()
	
	local w, h = 250, 25
	y = y + 85

	-- horizontal
	surface.SetMaterial( matGradientRight )
	surface.SetDrawColor( colbg )
	surface.DrawRect( x, y, w, h )

	surface.SetMaterial( matGradientRight )
	surface.SetDrawColor( colcr.r, colcr.g, colcr.b, 155 )
	surface.DrawTexturedRect( x, y, w * self:GetHitStacks() - 2, h )

	surface.SetDrawColor( colcr.r, colcr.g, colcr.b, 155 )
	surface.DrawRect( x + ( w * self:GetHitStacks() ) , y, 2, h )

	draw.SimpleText( "(Q) " .. translate.Get( "weapon_ability_nuclearsword_2d" ), "ZSSHUD4Font_20", x + w / 2, y + h / 2 , not self.AbilityActive and Color( 55, 55, 55 ) or colcr, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
end

function SWEP:DrawAbility3DHUD( x, y )
	local wid2, hei2 = 30, 200

	local heih = math.min( hei2, self:GetHitStacks() * hei2 )

	surface.SetDrawColor( Color( 0, 0, 0, 150 ) )
	surface.DrawRect( x - 10 - wid2, y, wid2, hei2 )

	surface.SetDrawColor( colcr )
	surface.DrawRect( x - 10 - wid2, y, wid2, heih )

	draw.SimpleText( translate.Get( "weapon_ability_nuclearsword_3d" ), "ZSSHUD4Font_45", x + 150 - wid2, y - 50, colcr, TEXT_ALIGN_RIGHT )
end