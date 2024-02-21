AddCSLuaFile()

--SWEP.PrintName = "'Ender' Automatic Shotgun"
--SWEP.Description = "Relatively accurate, clip loaded, automatic shotgun."
SWEP.PrintName = translate.Get("wep_ender")
SWEP.Description = translate.Get("wep_d_ender")
SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "v_weapon.galil"
	SWEP.HUD3DPos = Vector(1, 0, 6)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/cstrike/c_rif_galil.mdl"
SWEP.WorldModel = "models/weapons/w_rif_galil.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Galil.Single")
SWEP.Primary.Damage = 9.34
SWEP.Primary.NumShots = 8
SWEP.Primary.Delay = 0.55

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 5.625
SWEP.ConeMin = 4.875

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.Tier = 3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.303, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.21, 1)


function SWEP:SecondaryAttack()
end
