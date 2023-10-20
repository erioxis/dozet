AddCSLuaFile()

SWEP.PrintName = translate.Get("wep_pumpkin")
SWEP.Description = translate.Get("wep_d_pumpkin")

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50
	SWEP.ShowViewModel = true
	SWEP.ShowWorldModel = false

	SWEP.ViewModelBoneMods = {
		["ValveBiped.cube1"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube2"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube3"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
		["ValveBiped.cube"] = { scale = Vector(0.009, 0.009, 0.009), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) }
	}
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/draganm_custom/pumpkin_pack/pumpkind_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.091, 1.1, 0), angle = Angle(100, 0, 50), size = Vector(0.292, 0.292, 0.292), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/draganm_custom/pumpkin_pack/pumpkind_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.181, 2.273, -0.456), angle = Angle(-43.978, 27.614, 70.568), size = Vector(0.379, 0.379, 0.379), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basethrown"

SWEP.ViewModel = "models/weapons/c_bugbait.mdl"
SWEP.WorldModel = "models/draganm_custom/pumpkin_pack/pumpkind_01.mdl"

SWEP.Primary.Ammo = "stone"
SWEP.Primary.Damage = 120

SWEP.ThrownProjectile = "projectile_pumpkin"
SWEP.ThrowAngVel = 360
SWEP.ThrowVel = 900