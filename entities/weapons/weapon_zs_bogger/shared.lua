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
SWEP.Primary.Delay = 0.8
SWEP.Primary.DefaultClip = 1
SWEP.Primary.Damage = 41
SWEP.Primary.NumShots = 1
SWEP.PointsMultiplier = 0.45

SWEP.ConeMax = 0.6
SWEP.ConeMin = 0.1
SWEP.RageModer = 0

SWEP.MaxStock = 1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 3

SWEP.ReloadSpeed = 1

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.075)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_bogger_r1"), translate.Get("wep_d_bogger_r1"), function(wept)
	wept.Primary.Delay = wept.Primary.Delay * 5
	wept.Primary.Damage  = wept.Primary.Damage * 0.25
	wept.PointsMultiplier = 0.8
	if SERVER then
		wept.EntModify = function(self, ent)
			ent.RageMode = true
		end
	end

	wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
        wept.RageModer = wept.RageModer + 1
        timer.Create("ultrachad", 12, 1, function() 
            wept.RageModer = 0
        end)
	end
end)
