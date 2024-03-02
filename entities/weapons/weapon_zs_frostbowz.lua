AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_base" )
SWEP.Base 			= 	"weapon_zs_base"

SWEP.ViewModel = Model("models/weapons/c_smg1.mdl")
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.HoldType = "smg"
SWEP.ZombieCanPickup = true
if CLIENT then
	SWEP.Slot = 3
	SWEP.SlotPos = 0

	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 89

	SWEP.IronSightsPos = Vector(-2.88, -6.95, 1.58)
	SWEP.IronSightsAng = Vector(0, 0, -25.764)

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_L_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -12.142, 25.265) },
		["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0, 1.588, -4.326), angle = Angle(-15.552, -5.414, 17.639) },
		["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(-15.095, -18.257, 0) },
		["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -1.381, -28.699) },
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(3.573, 15.907, 0) },
		["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -16.869, 0) },
		["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -13.854, 0) },
		["ValveBiped.Bip01_R_Finger4"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -24.085, 0) },
		["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(7.91, -14.001, 36.275) },
		["ValveBiped.Bip01_R_UpperArm"] = { scale = Vector(1, 1, 1), pos = Vector(0.277, -2.622, 0.909), angle = Angle(-1.402, -0.459, 0) }
	}

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.286, 1.246, 3.792), angle = Angle(0, 0, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.274, 0.141, -2.217), angle = Angle(180, -8.929, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.39, 0.308, -2.356), angle = Angle(180, -180, 0), size = Vector(0.031, 0.031, 0.041), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.536, 0.505, 0.499), angle = Angle(180, -85.502, 0), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.387, 0.16, 4.38), angle = Angle(180, 76.545, -171.28999), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.63, 0.271, 6.221), angle = Angle(180, 76.545, -167.70399), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.732, 0.399, 6.76), angle = Angle(180, 76.545, -160.48599), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-1.173, 0.24, 6.287), angle = Angle(180, 76.545, 39.114), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.199, 0.486, 1.372), angle = Angle(180, -73.129, -1.725), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.613, 0.206, 6.115), angle = Angle(180, -73.129, -19.716), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk03.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.748, -0.169, 5.909), angle = Angle(180, -73.129, -32.273), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.588, 0.048, 5.513), angle = Angle(-150.76199, -20.717, 0), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.559, 0.839, 1.188), angle = Angle(-170.188, -26.781, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.392, 0.021, 0.796), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-1.099, 0.437, 5.81), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.356, 0.524, 0.773), angle = Angle(-171.774, 130.785, -0.75), size = Vector(0.034, 0.034, 0.025), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-0.845, -0.042, 5.985), angle = Angle(-150.21899, 0, 0), size = Vector(0.034, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_spawnchunk001b.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-2.363, -0.333, 7.599), angle = Angle(-180, -90.601, -112.303), size = Vector(0.034, 0.074, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-2.16, 0.185, 8.027), angle = Angle(-143.972, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-4.364, 0.017, 10.895), angle = Angle(36.032, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-2.711, -0.006, 9.288), angle = Angle(57.779, 2.528, -180), size = Vector(0.045, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(-2.246, 0.094, 8.171), angle = Angle(2.936, -89.76, -140.02299), size = Vector(0.025, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.612, 0.662, 3.114), angle = Angle(-7.801, 90.566, 155.40601), size = Vector(0.055, 0.044, 0.064), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.274, 0.141, -2.217), angle = Angle(180, -8.929, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.63, 0.271, 6.221), angle = Angle(180, 76.545, -167.70399), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.732, 0.399, 6.76), angle = Angle(180, 76.545, -160.48599), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-1.173, 0.24, 6.287), angle = Angle(180, 76.545, 39.114), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.199, 0.486, 1.372), angle = Angle(180, -73.129, -1.725), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.613, 0.206, 6.115), angle = Angle(180, -73.129, -19.716), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk03.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.748, -0.169, 5.909), angle = Angle(180, -73.129, -32.273), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.588, 0.048, 5.513), angle = Angle(-150.76199, -20.717, 0), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.559, 0.839, 1.188), angle = Angle(-170.188, -26.781, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.392, 0.021, 0.796), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-1.099, 0.437, 5.81), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.356, 0.524, 0.773), angle = Angle(-171.774, 130.785, -0.75), size = Vector(0.034, 0.034, 0.025), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-0.845, -0.042, 5.985), angle = Angle(-150.21899, 0, 0), size = Vector(0.034, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_spawnchunk001b.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-2.363, -0.333, 7.599), angle = Angle(-180, -90.601, -112.303), size = Vector(0.034, 0.074, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-2.16, 0.185, 8.027), angle = Angle(-143.972, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-4.364, 0.017, 10.895), angle = Angle(36.032, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-2.711, -0.006, 9.288), angle = Angle(57.779, 2.528, -180), size = Vector(0.045, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(-2.246, 0.094, 8.171), angle = Angle(2.936, -89.76, -140.02299), size = Vector(0.025, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base2", pos = Vector(0.612, 0.662, 3.114), angle = Angle(-7.801, 90.566, 155.40601), size = Vector(0.055, 0.044, 0.064), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.536, 0.505, 0.499), angle = Angle(180, -85.502, 0), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.39, 0.308, -2.356), angle = Angle(180, -180, 0), size = Vector(0.031, 0.031, 0.041), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "base", pos = Vector(0.387, 0.16, 4.38), angle = Angle(180, 76.545, -171.28999), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base2"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.026, 2.015, 0.935), angle = Angle(-19.548, 0, 180), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["dotestrela"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-4.635, 4, 3.699), angle = Angle(0, 0, 0), size = Vector(0.074, 0.074, 0.074), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["strela"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk08.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(47.586, 3.154, 3.84), angle = Angle(-90, -0.827, 0), size = Vector(0.04, 0.04, 0.391), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["titsdown"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-4.635, 4, -0.6361), angle = Angle(0, 0, 0), size = Vector(0.074, 0.074, 0.074), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["titsdown+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-5.806, 1.969, -7.839), angle = Angle(-10.976, 4.848, 175.782), size = Vector(0.074, 0.074, 0.074), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["titsup"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-2.635, 4, 6.63613), angle = Angle(0, 0, 0), size = Vector(0.074, 0.074, 0.074), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["titsup+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-2.025, 1.244, 15.052), angle = Angle(-10.99, 4.878, 175.813), size = Vector(0.074, 0.074, 0.074), color = Color(255, 255, 255, 0), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	 
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(14.441, 1.188, -2.655), angle = Angle(0, 0, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.274, 0.141, -2.217), angle = Angle(180, -8.929, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.39, 0.308, -2.356), angle = Angle(180, -180, 0), size = Vector(0.031, 0.031, 0.041), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.536, 0.505, 0.499), angle = Angle(180, -85.502, 0), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.387, 0.16, 4.38), angle = Angle(180, 76.545, -171.28999), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.63, 0.271, 6.221), angle = Angle(180, 76.545, -167.70399), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.732, 0.399, 6.76), angle = Angle(180, 76.545, -160.48599), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-1.173, 0.24, 6.287), angle = Angle(180, 76.545, 39.114), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.199, 0.486, 1.372), angle = Angle(180, -73.129, -1.725), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.613, 0.206, 6.115), angle = Angle(180, -73.129, -19.716), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.748, -0.169, 5.909), angle = Angle(180, -73.129, -32.273), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.588, 0.048, 5.513), angle = Angle(-150.76199, -20.717, 0), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.559, 0.839, 1.188), angle = Angle(-170.188, -26.781, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.392, 0.021, 0.796), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-1.099, 0.437, 5.81), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.356, 0.524, 0.773), angle = Angle(-171.774, 130.785, -0.75), size = Vector(0.034, 0.034, 0.025), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.845, -0.042, 5.985), angle = Angle(-150.21899, 0, 0), size = Vector(0.034, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_spawnchunk001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-2.363, -0.333, 7.599), angle = Angle(-180, -90.601, -112.303), size = Vector(0.034, 0.074, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-2.16, 0.185, 8.027), angle = Angle(-143.972, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-4.364, 0.017, 10.895), angle = Angle(36.032, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-2.711, -0.006, 9.288), angle = Angle(57.779, 2.528, -180), size = Vector(0.045, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-2.246, 0.094, 8.171), angle = Angle(2.936, -89.76, -140.02299), size = Vector(0.025, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.612, 0.662, 3.114), angle = Angle(-7.801, 90.566, 155.40601), size = Vector(0.055, 0.044, 0.064), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.274, 0.141, -2.217), angle = Angle(180, -8.929, 0), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.63, 0.271, 6.221), angle = Angle(180, 76.545, -167.70399), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.732, 0.399, 6.76), angle = Angle(180, 76.545, -160.48599), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-1.173, 0.24, 6.287), angle = Angle(180, 76.545, 39.114), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.199, 0.486, 1.372), angle = Angle(180, -73.129, -1.725), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.613, 0.206, 6.115), angle = Angle(180, -73.129, -19.716), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.748, -0.169, 5.909), angle = Angle(180, -73.129, -32.273), size = Vector(0.041, 0.041, 0.04), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.588, 0.048, 5.513), angle = Angle(-150.76199, -20.717, 0), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.559, 0.839, 1.188), angle = Angle(-170.188, -26.781, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.392, 0.021, 0.796), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-1.099, 0.437, 5.81), angle = Angle(-179.457, -180, 2.817), size = Vector(0.031, 0.021, 0.02), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.356, 0.524, 0.773), angle = Angle(-171.774, 130.785, -0.75), size = Vector(0.034, 0.034, 0.025), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk06.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-0.845, -0.042, 5.985), angle = Angle(-150.21899, 0, 0), size = Vector(0.034, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_spawnchunk001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-2.363, -0.333, 7.599), angle = Angle(-180, -90.601, -112.303), size = Vector(0.034, 0.074, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-2.16, 0.185, 8.027), angle = Angle(-143.972, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-4.364, 0.017, 10.895), angle = Angle(36.032, 2.528, -180), size = Vector(0.035, 0.034, 0.044), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-2.711, -0.006, 9.288), angle = Angle(57.779, 2.528, -180), size = Vector(0.045, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-2.246, 0.094, 8.171), angle = Angle(2.936, -89.76, -140.02299), size = Vector(0.025, 0.034, 0.054), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk07.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(0.612, 0.662, 3.114), angle = Angle(-7.801, 90.566, 155.40601), size = Vector(0.055, 0.044, 0.064), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.536, 0.505, 0.499), angle = Angle(180, -85.502, 0), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base+++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.39, 0.308, -2.356), angle = Angle(180, -180, 0), size = Vector(0.031, 0.031, 0.041), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base++++++++++++++++++++++++++++++++++++++++++++"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.387, 0.16, 4.38), angle = Angle(180, 76.545, -171.28999), size = Vector(0.041, 0.041, 0.061), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["base2"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.403, 0.396, -3.453), angle = Angle(-18.793, 2.134, 180), size = Vector(0.025, 0.025, 0.065), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["strela"] = { type = "Model", model = "models/props_debris/concrete_column001a_chunk08.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(58.027, 2.062, -20.88), angle = Angle(-109.55099, -11.206, -10.005), size = Vector(0.04, 0.04, 0.519), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["titseva"] = { type = "Model", model = "models/props_debris/wood_chunk01e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base2", pos = Vector(-6.173, 0.123, 7.645), angle = Angle(-11.227, 0, 0), size = Vector(0.053, 0.053, 0.123), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["titseva+"] = { type = "Model", model = "models/props_debris/wood_chunk01e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "titseva", pos = Vector(0, 0, -6.428), angle = Angle(180, -96, 0), size = Vector(0.053, 0.053, 0.077), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["titseva++"] = { type = "Model", model = "models/props_debris/wood_chunk01e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-5.927, 0.241, 7.645), angle = Angle(-11.227, 22.1, 0), size = Vector(0.053, 0.053, 0.123), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} },
		["titseva+++"] = { type = "Model", model = "models/props_debris/wood_chunk01e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "titseva++", pos = Vector(0, 0, -6.428), angle = Angle(180, -96, 0), size = Vector(0.053, 0.053, 0.077), color = Color(0, 140, 255, 255), surpresslightning = false, material = "models/shadertest/shader2", skin = 0, bodygroup = {} }
	}

end

SWEP.Slot = 3
SWEP.SlotPos = 0
SWEP.Tier = 3
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.ReloadSpeed = 1.2

SWEP.Primary.Projectile = ""

SWEP.Recoil = 0

SWEP.WalkSpeed = SPEED_FASTEST

SWEP.ConeBow = 4.4

function SWEP:SetCharge(charge)
	self:SetDTFloat(1, math.min( charge, 1 ) )
end

function SWEP:GetCharge()
	return self:GetDTFloat(1)
end

function SWEP:Initialize()
	self.BaseClass.Initialize( self )

	self.ChargeSound = CreateSound(self, "physics/plaster/ceiling_tile_scrape_smooth_loop1.wav")
	self.ChargeSound2 = CreateSound(self, "weapons/zs_frostbow/releasing.mp3")
	self.ChargeSound3 = CreateSound(self, "ambient/levels/citadel/zapper_loop2.wav")
end

function SWEP:ShootBullets(damage, numshots, cone)
	if !SERVER then return end
	local owner = self:GetOwner()
	for i = 0,numshots-1 do
		local ent = ents.Create( "projectile_frostarrowz" )
		if ent:IsValid() then
			ent:SetPos(owner:GetShootPos())
			ent:SetAngles( owner:EyeAngles() )
			ent:SetOwner(owner)
			ent.ProjDamage = self.Primary.BowDmg * ( owner.ProjectileDamageMul or 1 )
			ent.LegDamage = self.Primary.BowDmg * ( owner.ProjectileDamageMul or 1 ) * 0.2
			ent.ProjSource = self
			ent.ShotMarker = i
			ent.Team = owner:Team()

			--self:EntModify(ent)
			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()

				local angle = owner:GetAimVector():Angle()
				angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 360))
				angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(-cone, cone))

				ent.PreVel = angle:Forward() * self.Primary.ProjVelocity * (owner.ProjectileSpeedMul or 1)
				phys:SetVelocityInstantaneous( ent.PreVel + owner:GetVelocity() )

				--self:PhysModify(phys)
			end
		end
	end
end

function SWEP:PrimaryAttack()
	self:SetCharge( self:GetCharge() + 0.01 )
	--self:GetOwner():EmitSound( "npc/barnacle/barnacle_bark1.wav", 70, 50 * self:GetCharge() )
	self.ChargeSound:PlayEx( 0.15, self:GetCharge() * 25 )
	self.ChargeSound2:PlayEx( 1, self:GetCharge() * 160 )
	self.ChargeSound3:PlayEx( .15, self:GetCharge() * 20 )
end

function SWEP:Think()
	self.BaseClass.Think( self )

	local charge = self:GetCharge()
	local owner = self:GetOwner()
	self.ConeBow = 3.1 * ( 1.3 - charge )
	self.ConeMin, self.ConeMax = self.ConeBow * 0.75, self.ConeBow
	if not owner:KeyDown( IN_ATTACK ) and charge > 0 then
		self:SetCharge( 0 )
		self.ChargeSound:Stop()
		self.ChargeSound2:Stop()
		self.ChargeSound3:Stop()
		if charge < .4 then return end
		owner:EmitSound( "weapons/zs_frostbow/shot.mp3", 70, 55 + 50 * charge )
		self.Primary.ProjVelocity = 1600 * charge^1.5
		self.Primary.BowDmg = self.Primary.Damage * charge
		self:ShootBullets( self.Primary.BowDmg, 1, self.ConeBow )
	end
end

function SWEP:GetCone()
	local owner = self:GetOwner()

	local statuscone = ( owner:GetStatus( "coneeff" ) and owner:GetStatus( "coneeff" ):GetCone() or 1 )

	local basecone = self.ConeMin * statuscone
	local conedelta = ( self.ConeMax * statuscone ) - basecone

	local orphic = not owner.Orphic and 1 or self:GetIronsights() and 0.9 or 1.1
	local tiervalid = (self.Tier or 1) <= 3
	local spreadmul = (owner.AimSpreadMul or 1) - ((tiervalid and owner:HasTrinket("refinedsub")) and 0.27 or 0)

	if owner.TrueWooism then
		return (basecone + conedelta * 0.5 ^ self.ConeRamp) * spreadmul * orphic
	end

	if not owner:OnGround() or self.ConeMax == basecone then return self.ConeMax end

	local multiplier = math.min(owner:GetVelocity():Length() / self.WalkSpeed, 1)

	local ironsightmul = 0.25 * (owner.IronsightEffMul or 1)
	local ironsightdiff = 0.25 - ironsightmul
	multiplier = multiplier + ironsightdiff

	if not owner:Crouching() then multiplier = multiplier + 1 end
	if not self:GetIronsights() then multiplier = multiplier + ironsightmul end

	return (basecone + conedelta * (self.FixedAccuracy and 0.6 or multiplier) ^ self.ConeRamp) * spreadmul * orphic
end

if not CLIENT then return end

local stable = {
	"strela";
	"titseva";
	"titseva+";
	"titseva++";
	"titseva+++";
}

local function doemit( self, pos )
    if math.random() < .98 then return end
    local dsh = self:GetCharge()
    local emitter = ParticleEmitter( pos )
    emitter:SetNearClip(24, 32)
    local particle = emitter:Add("effects/blood2", pos + VectorRand():GetNormalized() * 2 )
    if particle then
        particle:SetDieTime( math.Rand( 0.65, 0.95 ) + ( dsh * 3 ) )
        particle:SetStartSize( math.Rand( 1, 2 ) + ( dsh * 1.5 ) )
        particle:SetEndSize(0)
        particle:SetColor( math.random( 255 ), 140, 255 )
        particle:SetStartAlpha( 5 + ( dsh * 2 ) )
        particle:SetEndAlpha( 0 )
        particle:SetRoll( math.random( 0, 360 ) )
        particle:SetGravity( Vector( 0, 0, -math.Rand( 30, 60 ) ) + VectorRand() * 1.5 )
    end

end
local colTrail = Color(10, 140, 255)
local matTrail = Material("cable/rope")
function SWEP:DrawWorldModel()
	local time = UnPredictedCurTime()
	for k, v in pairs( self.WElements ) do
		local topos, toang = self:GetBoneOrientation( self.WElements, v, self:GetOwner() ) 
        doemit( self, topos + toang:Forward() * v.pos.x + toang:Right() * v.pos.y + toang:Up() * v.pos.z )
		for i = 1,3 do
			v.pos[i] = v.pos[i] + 0.0019 / ( ( v.size[i] and v.size[i]*15 or 1 ) ) * ( math.cos(time * i  * ( string.len( k ) ^ 0.3 )) )  * ( string.len( k ) ^ 0.3 )
		end
	end
	self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel
SWEP.Oldpos = {}
function SWEP:PostDrawViewModel(vm)
    local time = UnPredictedCurTime()
    local charge = self:GetCharge()

    local strelapos, strelaang
    local titsup, titsupang
    local titsdown, titsdownang
    local titsupa, titsupaang
    local titsdowna, titsdownaang
    local ownervm = self:GetOwner():GetViewModel()


	for k, v in pairs( self.VElements ) do
		local pos, ang = self:GetBoneOrientation( self.VElements, v, vm )
		if !self.Oldpos[k] then
			self.Oldpos[k] = {v.pos,v.angle}
		end

		--v.pos = vm:LocalToWorld(pos + ang:Forward() * self.Oldpos[k][1].x + ang:Right() * self.Oldpos[k][1].y + ang:Up() * self.Oldpos[k][1].z )
		ang:RotateAroundAxis(ang:Up(), self.Oldpos[k][2].y)
		ang:RotateAroundAxis(ang:Right(), self.Oldpos[k][2].p)
		ang:RotateAroundAxis(ang:Forward(), self.Oldpos[k][2].r)

		--v.angle = ang
		if not ( charge > 0 and table.HasValue( stable, k ) ) then
			for i = 1,3 do
				v.pos[i] = v.pos[i] + 0.0025 * ( math.cos( time * i * string.len( k ) ^ 0.5 ) ) * ( string.len( k ) ^ 0.87 )
			end
		end
		--v.modelEnt
		if k == "dotestrela" then
			strelapos, strelaang = self:GetBoneOrientation( self.VElements, v, ownervm )
			strelapos = strelapos + strelaang:Forward() * ( v.pos.x - 2 * math.ease.InOutBack( charge ) ) + strelaang:Right() * v.pos.y + strelaang:Up() * v.pos.z
		end

		if k == "titsdown" then
			titsdown, titsdownang = self:GetBoneOrientation( self.VElements, v, ownervm )
			titsdown = titsdown + titsdownang:Forward() * ( v.pos.x - 1 * math.ease.InOutBack( charge ) ) + titsdownang:Right() * v.pos.y + titsdownang:Up() * v.pos.z
		end

		if k == "titsdown+" then
			titsdowna, titsdownaang = self:GetBoneOrientation( self.VElements, v, ownervm )
			titsdowna = titsdowna + titsdownaang:Forward() * v.pos.x + titsdownaang:Right() * v.pos.y + titsdownaang:Up() * v.pos.z
		end

		if k == "titsup" then
			titsup, titsupang = self:GetBoneOrientation( self.VElements, v, ownervm )
			titsup = titsup + titsupang:Forward() * ( v.pos.x - 1 * math.ease.InOutBack( charge ) ) + titsupang:Right() * v.pos.y + titsupang:Up() * v.pos.z
		end

		if k == "titsup+" then
			titsupa, titsupaang = self:GetBoneOrientation( self.VElements, v, ownervm )
			titsupa = titsupa + titsupaang:Forward() * v.pos.x + titsupaang:Right() * v.pos.y + titsupaang:Up() * v.pos.z
		end
		--print( self:GetBoneOrientation( self.VElements, v, ownervm ), k )
		if k == "strela" then
			v.size = Vector(0.04, 0.04, 0.519) * math.ease.InOutBack( charge )
			v.color.a = 255 * charge^3
		else
			local topos, toang = self:GetBoneOrientation( self.VElements, v, ownervm ) 
        	doemit( self, topos + toang:Forward() * v.pos.x + toang:Right() * v.pos.y + toang:Up() * v.pos.z )
		end
	end
	render.SetMaterial(matTrail)
	render.DrawBeam( strelapos, titsup, 0.2, 1, 0, colTrail )
	render.DrawBeam( strelapos, titsdown, 0.2, 1, 0, colTrail )

	render.DrawBeam( titsup, titsupa, 0.2, 1, 0, colTrail )

	render.DrawBeam( titsdown, titsdowna, 0.2, 1, 0, colTrail )

	self.ViewModelBoneMods[ "ValveBiped.Bip01_R_UpperArm" ].pos.x = 0.277 + math.ease.InOutBack( charge ) * 6 + ( charge >= 0.95 and 0.06 * math.ease.InOutElastic( (time * 80)%1 ) or 0 )
	self.ViewModelBoneMods[ "ValveBiped.Bip01_L_UpperArm" ].pos.x = math.ease.InOutBack( charge ) + ( charge >= 0.95 and 0.06 * math.ease.InOutElastic( (time * 80)%1 ) or 0 )

	self.BaseClass.PostDrawViewModel( self, vm )

end

function SWEP:DrawHUD()
	if self:GetReloadFinish() > 0 then
		if GAMEMODE.CrosshairReload then
			self:DrawReloadCircle()
		end
	else
		self:DrawWeaponCrosshair( GAMEMODE.CrosshairStyle )
	end
end
