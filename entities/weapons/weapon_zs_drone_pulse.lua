AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_drone")

SWEP.Base = "weapon_zs_drone"

SWEP.PrintName = translate.Get("wep_p_drone")
SWEP.Description = translate.Get("wep_d_p_drone")

SWEP.Primary.Ammo = "pulse_cutter"

SWEP.DeployClass = "prop_drone_pulse"
SWEP.DeployAmmoType = "pulse"
SWEP.ResupplyAmmoType = "pulse"
