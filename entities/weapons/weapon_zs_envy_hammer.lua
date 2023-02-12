AddCSLuaFile()

--SWEP.PrintName = "Singularity hammer"
SWEP.PrintName = translate.Get("wep_sin_envy")
SWEP.Description = translate.Get("wep_d_sin_envy")

if CLIENT then
	SWEP.HoldType = "pistol"
	SWEP.ViewModelFOV = 70
	SWEP.ViewModelFlip = false
	SWEP.ViewModel = "models/weapons/v_hammer/c_hammer.mdl"
	SWEP.WorldModel = "models/weapons/w_pistol.mdl"
	SWEP.ShowViewModel = true
	SWEP.ShowWorldModel = true
end
SWEP.ViewModelBoneMods = {
	["SphereGizmo03"] = { scale = Vector(0.323, 0.323, 0.323), pos = Vector(0, 0, 0), angle = Angle(122, 0, 0) }
}
SWEP.Base = "weapon_zs_hammer"

SWEP.MeleeDamage = 1
SWEP.HealStrength = 5

SWEP.ViewModel = "models/weapons/v_hammer/c_hammer.mdl"
SWEP.WorldModel = "models/weapons/w_hammer.mdl"

SWEP.AllowQualityWeapons = false

