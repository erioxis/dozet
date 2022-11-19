
SWEP.PrintName = translate.Get("wep_biotic_grl")
SWEP.Description = translate.Get("wep_d_biotic_grl")
SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Delay = 0.55
SWEP.Primary.ClipSize = 68
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.DefaultClip = 8
SWEP.Primary.Damage = 45

SWEP.ConeMin = 0.5
SWEP.ConeMax = 0.9

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 6




function SWEP:EmitFireSound()
	self:EmitSound("weapons/ar2/ar2_altfire.wav", 70, math.random(112, 120), 0.50)
	self:EmitSound("weapons/physcannon/superphys_launch1.wav", 70, math.random(145, 155), 0.5, CHAN_AUTO + 20)
end
