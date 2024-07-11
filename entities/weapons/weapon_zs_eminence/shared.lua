--SWEP.PrintName = "'Eminence' Particle Cannon"
--SWEP.Description = "Fires projectiles fire particle tracers whilst moving."
SWEP.PrintName = " "..translate.Get("wep_eminem")
SWEP.Description = " "..translate.Get("wep_d_eminem")

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.Delay = 0.7
SWEP.Primary.DefaultClip = 10
SWEP.Primary.Damage = 109
SWEP.Primary.NumShots = 2

SWEP.ConeMax = 3
SWEP.ConeMin = 2

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 5

SWEP.ReloadSpeed = 0.75

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.075)

function SWEP:EmitFireSound()
	self:EmitSound("weapons/grenade_launcher1.wav", 75, math.random(67, 74), 0.4)
	self:EmitSound("npc/attack_helicopter/aheli_mine_drop1.wav", 75, 65, 0.8, CHAN_AUTO + 20)
end

function SWEP:EmitReloadSound()
	if IsFirstTimePredicted() then
		self:EmitSound("weapons/ar2/ar2_reload_rotate.wav", 70, 55)
		self:EmitSound("items/battery_pickup.wav", 70, 77, 0.85, CHAN_AUTO)
	end
end

function SWEP:EmitReloadFinishSound()
	if IsFirstTimePredicted() then
		self:EmitSound("weapons/ar2/ar2_reload_push.wav", 70, 70, math.Rand(130, 140))
	end
end
