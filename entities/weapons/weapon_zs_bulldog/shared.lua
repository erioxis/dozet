--SWEP.PrintName = "'Eminence' Particle Cannon"
--SWEP.Description = "Fires projectiles fire particle tracers whilst moving."
SWEP.PrintName = translate.Get("wep_bulldog")
SWEP.Description = translate.Get("wep_d_bulldog")

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.Delay = 0.9
SWEP.Primary.DefaultClip = 3
SWEP.Primary.Damage = 199
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 3
SWEP.ConeMin = 2

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 5

SWEP.ReloadSpeed = 0.75

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.075)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_bulldog_r1"), translate.Get("wep_d_bulldog_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.33
	wept.ReloadSpeed = wept.ReloadSpeed * 1.3
	wept.Primary.Delay = wept.Primary.Delay * 0.5
	wept.WalkSpeed = SPEED_VERYSLOW
	wept.Primary.NumShots = 3
	wept.FireAnimSpeed = 0.22
	wept.ConeMax = 7
	wept.ConeMin = 3
	if SERVER then
		wept.EntModify = function(self, ent)
			ent.Minidogs = true
		end
	end
end)

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
