AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")


SWEP.PrintName = translate.Get("wep_supply")
SWEP.Description = translate.Get("wep_d_supply")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "Python"
	SWEP.HUD3DPos = Vector(0.85, 0, -2.5)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "revolver"

SWEP.ViewModel = "models/weapons/c_357.mdl"
SWEP.WorldModel = "models/weapons/w_357.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Sound = Sound("Weapon_357.Single")
SWEP.Primary.Delay = 1
SWEP.Primary.Damage = 1
SWEP.Primary.NumShots = 1

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.Gesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_PISTOL
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.Tier = 2

SWEP.ConeMax = 0
SWEP.ConeMin = 0
SWEP.BounceMulti = 2

SWEP.IronSightsPos = Vector(-4.65, 4, 0.25)
SWEP.IronSightsAng = Vector(0, 0, 1)


function SWEP.BulletCallback(attacker, tr, dmginfo)
	dmginfo:SetDamage(1)
	if tr.HitSky and SERVER then
		local ent = ents.Create('prop_airdrop')
		if ent:IsValid() then
			ent:SetPos(tr.HitPos-Vector(0,0,15))
			ent:Spawn()
			attacker:GetActiveWeapon():Remove()
		end
	end
end




