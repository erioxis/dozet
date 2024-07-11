AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Binocle' Hand AWP"
--SWEP.Description = "How."
SWEP.PrintName = translate.Get("wep_binocle")
SWEP.Description = translate.Get("wep_d_binocle")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 50
	SWEP.ViewModelFlip = false

	SWEP.HUD3DBone = "v_weapon.Glock_Slide"
	SWEP.HUD3DPos = Vector(5, 0.25, -0.8)
	SWEP.HUD3DAng = Angle(90, 0, 0)
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_glock18.mdl"
SWEP.WorldModel = "models/weapons/w_pist_glock18.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_Glock.Single")
SWEP.Primary.Damage = 45
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.5

SWEP.Primary.ClipSize = 7
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pistol"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 1
SWEP.ConeMin = 0.1

SWEP.Tier = 3

SWEP.IronSightsPos = Vector(-5.75, 10, 2.7)

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.9, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MIN_SPREAD, -0.5, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1, 1)

function SWEP:IsScoped()
	return self:GetIronsights() and self.fIronTime and self.fIronTime + 0.25 <= CurTime()
end

if CLIENT then
	SWEP.IronsightsMultiplier = 0.25

	function SWEP:GetViewModelPosition(pos, ang)
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			return pos + ang:Up() * 256, ang
		end

		return BaseClass.GetViewModelPosition(self, pos, ang)
	end

	function SWEP:DrawHUDBackground()
		if GAMEMODE.DisableScopes then return end

		if self:IsScoped() then
			self:DrawRegularScope()
		end
	end
end