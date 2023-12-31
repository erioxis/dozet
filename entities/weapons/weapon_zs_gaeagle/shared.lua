AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Gauss Eagle'"
--SWEP.Description = "Big damage for first shoot,less damage for last shot.(More clip = more damage!!!)" --SWEP.Description = "This high-powered handgun has the ability to pierce through multiple zombies. The bullet's power decreases by half which each zombie it hits."
SWEP.PrintName = translate.Get("wep_gaeagle")
SWEP.Description = translate.Get("wep_d_gaeagle")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 55

	SWEP.HUD3DBone = "v_weapon.Deagle_Slide"
	SWEP.HUD3DPos = Vector(-1, 0, 1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015

	SWEP.IronSightsPos = Vector(-6.35, 5, 1.7)
end

SWEP.PointsMultiplier = 0.8
SWEP.Base = "weapon_zs_base"
SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}
SWEP.Primary.Sound = Sound("Weapon_Deagle.Single")
SWEP.Primary.Damage = 98
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.66
SWEP.Primary.KnockbackScale = 2
SWEP.MaxStock = 1
SWEP.Primary.ClipSize = 12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 3.4
SWEP.ConeMin = 1.25

SWEP.ReloadSpeed = 0.3

SWEP.FireAnimSpeed = 1.8

SWEP.Tier = 7

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 2)
function SWEP:SetHitStacks( stacks )
	self:SetDTFloat( 11, stacks )
end

function SWEP:GetHitStacks()
	return self:GetDTFloat( 11 )
end
function SWEP.BulletCallback(at,tr,dmginfo)
	local wep = dmginfo:GetInflictor()
	local hitent = tr.Entity
	if hitent:IsValidLivingZombie() then
		wep:SetHitStacks(wep:GetHitStacks()+1)
	end
	at:GetActiveWeapon().BaseClass.BulletCallback(at, tr, dmginfo)
end
function SWEP:ShootBullets(dmg, numbul, cone)
	dmg = dmg + dmg * (20 * self:Clip1() / self.Primary.ClipSize)

	BaseClass.ShootBullets(self, dmg, numbul, cone)
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	local owner = self:GetOwner()
	if owner:GetAmmoCount("pulse") < 30 then return end
	local owm = (owner.M_FireDelay or 1)
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay() * (1 * owm))
	local extramulti = 1
	if owner:HasTrinket("supasm") and (self.Tier or 1) <= 2  then
		extramulti = 1.25
	end


	self:EmitFireSound()
	self:TakeAmmo()
	owner:SetAmmo(math.max(0,owner:GetAmmoCount("pulse")-30),"pulse")
	self:ShootBullets(self.Primary.Damage * (self:GetPrimaryClipSize() >= 12 and owner:IsSkillActive(SKILL_LAST_AMMO) and 0.75 or self:GetPrimaryClipSize() <= 11 and owner:IsSkillActive(SKILL_LAST_AMMO) and 1.5 + ((self:GetPrimaryClipSize()) * 0.01) or 1) * (extramulti or 1), self.Primary.NumShots, self:GetCone())
	self:SetShotgunHeat(CurTime()+(self.ShotGunHeatTimeMul or 1.2))
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

