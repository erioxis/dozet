AddCSLuaFile()

SWEP.Slot = 3
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.ReloadDelay = 0.45

SWEP.Primary.Sound = Sound("Weapon_M3.Single")
SWEP.Primary.Damage = 8
SWEP.Primary.NumShots = 6
SWEP.Primary.Delay = 1
SWEP.ShotGunHeat = true

SWEP.Primary.ClipSize = 6
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 7
SWEP.ConeMin = 5.25

SWEP.WalkSpeed = SPEED_SLOW

SWEP.ReloadActivity = ACT_VM_RELOAD
SWEP.PumpActivity = ACT_SHOTGUN_RELOAD_FINISH
SWEP.ReloadStartActivity = ACT_SHOTGUN_RELOAD_START
SWEP.ReloadStartGesture = ACT_HL2MP_GESTURE_RELOAD_SHOTGUN

function SWEP:SecondaryAttack()
end



function SWEP:StartReloading()
	local delay = self:GetReloadDelay()
	self:SetDTFloat(3, CurTime() + delay)
	self:SetDTBool(2, true) -- force one shell load
	self:SetNextPrimaryFire(CurTime() + math.max(self.Primary.Delay, delay))

	self:GetOwner():DoReloadEvent()

	if self.ReloadStartActivity then
		self:SendWeaponAnim(self.ReloadStartActivity)
		self:ProcessReloadAnim()
	end
end





