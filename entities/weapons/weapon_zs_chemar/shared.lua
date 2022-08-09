--SWEP.PrintName = "'Pollutor' Acid Rifle"
--SWEP.Description = "Launches acidic projectiles that have a chance to remove damage resistance"
SWEP.PrintName = translate.Get("wep_chemar")
SWEP.Description = translate.Get("wep_d_chemar")

SWEP.Base = "weapon_zs_baseproj"


SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/v_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.Delay = 0.32
SWEP.Primary.DefaultClip = 12
SWEP.Primary.Damage = 22
SWEP.Primary.NumShots = 1

SWEP.ConeMax = 2
SWEP.ConeMin = 0.3

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 1

SWEP.FireAnimSpeed = 0.4

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.009)

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Scorch' Napalm Pisol", "Chance to ignite instead of corrode at the cost of damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.60

	if SERVER then
		wept.EntModify = function(self, ent)
			ent:SetDTInt(5, 1)
		end
	end
end)
branch.Colors = {Color(255, 160, 50), Color(215, 120, 50), Color(175, 100, 40), Color(161, 26, 26)}
branch.NewNames = {"Hot", "Searing", "Torching", "Lava", "HotHeart"}

branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, "'Glaze' Cryo Pistol", "Launches cryoblobs that slow zombies down at the cost of damage", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.5

	if SERVER then
		wept.EntModify = function(self, ent)
			ent:SetDTInt(5, 2)
		end
	end
end)
branch.Colors = {Color(50, 160, 255), Color(50, 130, 215), Color(40, 115, 175), Color(0, 35, 65)}
branch.NewNames = {"Cold", "Arctic", "Glacial", "Fridge", "Cooljack"}

function SWEP:EmitFireSound()
	self:EmitSound("^weapons/mortar/mortar_fire1.wav", 70, math.random(88, 92), 0.65)
	self:EmitSound("npc/barnacle/barnacle_gulp2.wav", 70, 70, 0.85, CHAN_AUTO + 20)
end
