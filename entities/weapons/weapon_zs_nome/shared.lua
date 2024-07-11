<<<<<<< Updated upstream
SWEP.PrintName = "'Nomer' Pulse Revolver"
SWEP.Description = "STONE."
=======
--SWEP.PrintName = "'Nomer' Pulse Revolver"
--SWEP.Description = "STONE."
SWEP.PrintName = translate.Get("wep_nome")
SWEP.Description = translate.Get("wep_d_nome")
>>>>>>> Stashed changes

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("Weapon_357.Single")
SWEP.Primary.Delay = 0.9
SWEP.Primary.Damage = 100
SWEP.Primary.NumShots = 1

SWEP.Primary.ClipSize = 15
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 15

SWEP.RequiredClip = 15

SWEP.ConeMax = 3.5
SWEP.ConeMin = 1.75

SWEP.WalkSpeed = SPEED_SLOW

SWEP.IronSightsPos = Vector(-4.65, 4, 0.25)
SWEP.IronSightsAng = Vector(0, 0, 1)

SWEP.Tier = 2

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.7, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.4, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Novx' Pulse Revolver", "Fires two projectiles in a wavy formation", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 1.5
	wept.Primary.ProjVelocity = 450
	wept.Primary.NumShots = 2
	wept.Primary.ClipSize = 70
	wept.SameSpread = true
	if SERVER then
		wept.EntModify = function(self, ent)
			ent:SetDTBool(0, true)
			ent.Branch = true
		end
	end
end)

function SWEP:EmitFireSound()
	self:EmitSound("weapons/stunstick/alyx_stunner2.wav", 72, 219, 0.75)
	self:EmitSound("weapons/physcannon/superphys_launch1.wav", 72, 208, 0.65, CHAN_AUTO)
end
