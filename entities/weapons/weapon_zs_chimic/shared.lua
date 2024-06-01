
SWEP.PrintName = translate.Get("wep_chimic")
SWEP.Description = translate.Get("wep_d_chemic")

SWEP.Base = "weapon_zs_baseproj"


SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/v_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 100
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.Delay = 0.05
SWEP.Primary.DefaultClip = 100
SWEP.Primary.Damage = 133
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 2
SWEP.ConeMin = 0.3

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 4

SWEP.FireAnimSpeed = 0.4

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.005)

function SWEP:SendWeaponAnimation()
end


function SWEP:EmitFireSound()
	self:EmitSound("^weapons/mortar/mortar_fire1.wav", 70, math.random(88, 92), 0.65)
	self:EmitSound("npc/barnacle/barnacle_gulp2.wav", 70, 70, 0.85, CHAN_AUTO + 20)
end
