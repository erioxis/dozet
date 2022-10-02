AddCSLuaFile()

SWEP.Base = "weapon_zs_base"

--SWEP.PrintName = " 'Infernu,' Infinity gun"
--SWEP.Description = "Stop what?."
SWEP.PrintName = ""..translate.Get("wep_smgstick")
SWEP.Description = ""..translate.Get("wep_d_smgstick")

if CLIENT then
	SWEP.HUD3DBone = "ValveBiped.Gun"
	SWEP.HUD3DPos = Vector(1.65, 0, -8)
	SWEP.HUD3DScale = 0.025

	SWEP.ViewModelFlip = false
end

SWEP.ViewModel = "models/weapons/cstrike/c_smg_mp5.mdl"
SWEP.WorldModel = "models/weapons/w_smg_mp5.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadDelay = 1.3

SWEP.Primary.Sound = Sound("Weapon_MP5Navy.Single")
SWEP.Primary.Damage = 22
SWEP.Primary.NumShots = 2
SWEP.Primary.Delay = 0.43

SWEP.Recoil = 7.5

SWEP.Primary.ClipSize = 1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"


SWEP.ConeMax = 5
SWEP.ConeMin = 1

SWEP.Tier = 3

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.07
SWEP.Knockback = 121



GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.04)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_smgstick_r1"), translate.Get("wep_d_smgstick_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 0.5
	wept.ReloadSpeed = wept.ReloadSpeed * 2
	wept.Primary.Delay = wept.Primary.Delay * 0.6
	wept.Knockback = 177
	wept.WalkSpeed = SPEED_SLOW
end)


function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitSound(self.Primary.Sound)

	local clip = self:Clip1()

	self:ShootBullets((owner:IsSkillActive(SKILL_SFINGERS) and self.Eater and self.Primary.Damage *2 or self.Primary.Damage), self.Primary.NumShots, self:GetCone())

	owner:SetHealth(owner:Health() - 1)
	
	owner:ViewPunch( 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))

	owner:SetGroundEntity(NULL)
	owner:SetVelocity(-self.Knockback *  owner:GetAimVector())

	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
