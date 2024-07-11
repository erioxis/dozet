AddCSLuaFile()

SWEP.PrintName = "'Peashooter' Handgun"
SWEP.Description = "У него меньше урон чем у обычного пистолета,но обладая свойством тратить половину патрон он покрывает свой недостаток."

SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 60
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.p228_Slide"
	SWEP.HUD3DPos = Vector(-0.88, 0.35, 1)
	SWEP.HUD3DAng = Angle(0, 0, 0)
	SWEP.HUD3DScale = 0.015
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
SWEP.UseHands = true
--models/weapons/w_pist_p228.mdl
SWEP.Primary.Sound = Sound("Weapon_P228.Single")
<<<<<<< Updated upstream
SWEP.Primary.Damage = 19.3
=======
SWEP.Primary.Damage = 10.5
>>>>>>> Stashed changes
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.14

SWEP.Primary.ClipSize = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
SWEP.Primary.ClipMultiplier = 12/18 * 2 -- Battleaxe/Owens have 12 clip size, but this has half ammo usage
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 4
SWEP.ConeMin = 0.75

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
<<<<<<< Updated upstream
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Peashooter' Auto Handgun", "Fully automatic, increased clip size at the cost of accuracy", function(wept)
=======
GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_pshooter_r1"), translate.Get("wep_d_pshooter_r1"), function(wept)
>>>>>>> Stashed changes
	wept.Primary.Delay = 0.11
	wept.Primary.Automatic = true
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 1.25)

	wept.ConeMin = 2
end)

SWEP.IronSightsPos = Vector(-6, -1, 2.25)

function SWEP:SetAltUsage(usage)
	self:SetDTBool(1, usage)
end

function SWEP:GetAltUsage()
	return self:GetDTBool(1)
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitFireSound()

	local altuse = self:GetAltUsage()
	if not altuse then
		self:TakeAmmo()
	end
	self:SetAltUsage(not altuse)

	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

if not CLIENT then return end

function SWEP:GetDisplayAmmo(clip, spare, maxclip)
	local minus = self:GetAltUsage() and 0 or 1
	return math.max(0, (clip * 2) - minus), spare * 2, maxclip * 2
end
