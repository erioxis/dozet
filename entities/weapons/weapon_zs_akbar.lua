AddCSLuaFile()

--SWEP.PrintName = "'Akbar' Assault Rifle"
--SWEP.Description = "Reliable assault rifle with a very fast reload speed. Not quite as accurate as other assault rifles, but still precise enough nonetheless."
SWEP.PrintName = ""..translate.Get("wep_akbar")
SWEP.Description = ""..translate.Get("wep_d_akbar")
SWEP.Slot = 2
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.AK47_Parent"
	SWEP.HUD3DPos = Vector(-1, -4.5, -4)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_rif_ak47.mdl"
SWEP.WorldModel = "models/weapons/w_rif_ak47.mdl"
SWEP.UseHands = true

SWEP.ReloadSound = Sound("Weapon_AK47.Clipout")
SWEP.Primary.Sound = Sound("Weapon_AK47.Single")
SWEP.Primary.Damage = 21.75
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.12
SWEP.MultiplierOfShots = 1

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "ar2"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 2.65
SWEP.ConeMin = 1.275

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 3

SWEP.IronSightsPos = Vector(-6.6, 20, 3.1)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.344)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.172)
function SWEP:SecondaryAttack()
if self.Primary.Ammo == "357" then
	timer.Simple(0.5,function()
		self:TakeAmmo()
		self.Primary.Ammo = "ar2"
	end)
else
	timer.Simple(0.5,function()
		self:TakeAmmo()
		self.Primary.Ammo = "357"
	end)
end
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
owner = self:GetOwner()
	self:EmitFireSound()
	if SERVER and self.Primary.Ammo == "ar2" then
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage + (6 * self.MultiplierOfShots), self.Primary.NumShots, self:GetCone())
	self.MultiplierOfShots = self.MultiplierOfShots + 1
	if self.MultiplierOfShots >= 5 then
		self.MultiplierOfShots = self.MultiplierOfShots - 4
	end
    elseif SERVER and self.Primary.Ammo == "357" then
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage * 2, self.Primary.NumShots, self:GetCone())
	end
end