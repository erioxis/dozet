AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_drone")

SWEP.Base = "weapon_zs_drone"

SWEP.PrintName =  translate.Get("wep_he_drone")
SWEP.Description = translate.Get("wep_d_he_drone")

SWEP.Primary.Ammo = "drone_healer"

SWEP.DeployClass = "prop_drone_healer"
SWEP.DeployAmmoType = "Battery"
SWEP.ResupplyAmmoType = "Battery"
