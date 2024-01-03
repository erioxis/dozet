AddCSLuaFile()

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.HoldType = "melee2"
	SWEP.ViewModel = "models/melee_anims/c_oren_katana.mdl"
	SWEP.WorldModel = "models/weapons/w_pistol.mdl"
	
	SWEP.SCKMaterials = {}
	
	SWEP.IronSightsPos = Vector(0, 0, -2.53)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	
	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "RW_Weapon", rel = "", pos = Vector(0.16, 0.32, -1.04), angle = Angle(0, 0, 0), size = Vector(0.007, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/black_brushes", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, -4.727), angle = Angle(0, 0, 0), size = Vector(0.007, 0.009, 0.009), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 4.053), angle = Angle(0, 0, 0), size = Vector(0.027, 0.041, 0.167), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 3.603), angle = Angle(0, 0, 0), size = Vector(0.007, 0.009, 0.003), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/hunter/blocks/cube2x2x2.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, 0, 4.521), angle = Angle(0, 0, 0), size = Vector(0.014, 0.018, 0.009), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, -0.398, 4.913), angle = Angle(-90, 0, 0), size = Vector(0.54, 0.016, 0.067), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(0, -0.384, 4.913), angle = Angle(-90, 0, 0), size = Vector(0.54, 0.02, 0.057), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["e1"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.151, 0.635, 1.432), angle = Angle(180, 90, 0), size = Vector(0.007, 0.009, 0.016), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/black_brushes", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, -4.727), angle = Angle(0, 0, 0), size = Vector(0.007, 0.009, 0.009), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 4.053), angle = Angle(0, 0, 0), size = Vector(0.027, 0.041, 0.167), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/hunter/tubes/tube4x4x8.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 3.603), angle = Angle(0, 0, 0), size = Vector(0.007, 0.009, 0.003), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1++++"] = { type = "Model", model = "models/hunter/blocks/cube2x2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, 0, 4.521), angle = Angle(0, 0, 0), size = Vector(0.014, 0.018, 0.009), color = Color(255, 216, 138, 255), surpresslightning = false, material = "phoenix_storms/concrete3", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -0.398, 4.913), angle = Angle(-90, 0, 0), size = Vector(0.54, 0.016, 0.067), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/tubes/circle2x2d.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0, -0.384, 4.913), angle = Angle(-90, 0, 0), size = Vector(0.54, 0.02, 0.057), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} }
	}
	
	
end
SWEP.PrintName = translate.Get("wep_ice_nail")
SWEP.Description = translate.Get("wep_d_ice_nail")
function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")

end


SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"
SWEP.ShowWorldModel = false
SWEP.ViewModel = "models/melee_anims/c_oren_katana.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true
SWEP.HitDecal = "Manhackcut"

SWEP.MeleeDamage = 112
SWEP.MeleeRange = 77
SWEP.MeleeSize = 1.6
SWEP.Tier = 4


SWEP.AllowQualityWeapons = true

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Secondary.Delay = 10
SWEP.StartSwingAnimation = ACT_VM_HITRIGHT
SWEP.HitAnim =  ACT_BIG_FLINCH
SWEP.MissAnim = nil
SWEP.ChargeSpeed = 1000
SWEP.FireNail = false
SWEP.CNail = false

SWEP.Primary.Delay = 0.6
SWEP.SwingTime = 0.4