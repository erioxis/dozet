
SWEP.PrintName = translate.Get("wep_rl")
SWEP.Description = translate.Get("wep_d_rl")
SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "smg"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_ump45.mdl"
SWEP.WorldModel = "models/weapons/w_smg_ump45.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.Delay = 0.7
SWEP.Primary.DefaultClip = 4
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1



SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 3
SWEP.MaxStock = 2

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_rl_r1"), translate.Get("wep_d_rl_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.55
	if SERVER then
		wept.EntModify = function(self, ent)
			ent:SetDTInt(5, 1)
		end
	end
end)

function SWEP:EmitFireSound()
	self:EmitSound("weapons/grenade_launcher1.wav", 70, math.random(118, 124), 0.3)
	self:EmitSound("npc/attack_helicopter/aheli_mine_drop1.wav", 70, 100, 0.7, CHAN_AUTO + 20)
end
