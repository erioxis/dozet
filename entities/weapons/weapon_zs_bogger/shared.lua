--SWEP.PrintName = "'Eminence' Particle Cannon"
--SWEP.Description = "Fires projectiles fire particle tracers whilst moving."
SWEP.PrintName = translate.Get("wep_bogger")
SWEP.Description = translate.Get("wep_d_bogger")

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("Weapon_357.Single")
SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
SWEP.Primary.Delay = 0.45
SWEP.Primary.DefaultClip = 16
SWEP.Primary.Damage = 44
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 0.6
SWEP.ConeMin = 0.1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 3

SWEP.ReloadSpeed = 1.3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.075)
