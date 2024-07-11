AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_drone")

SWEP.Base = "weapon_zs_drone"

SWEP.PrintName =  translate.Get("wep_h_drone")
SWEP.Description = translate.Get("wep_d_h_drone")

SWEP.Primary.Ammo = "drone_hauler"

SWEP.DeployClass = "prop_drone_hauler"
SWEP.DeployAmmoType = false
SWEP.ResupplyAmmoType = nil
