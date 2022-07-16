--SWEP.PrintName = "'Spinfusor' Pulse Disc Launcher"
--SWEP.Description = "Launches pulse projectiles that react on walls, sending energy back in the direction they travelled."
SWEP.PrintName = ""..translate.Get("wep_zenithmega")
SWEP.Description = ""..translate.Get("wep_d_zenithmega")

SWEP.Slot = 3
SWEP.SlotPos = 0

SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false

sound.Add(
{
	name = "Weapon_Slayer.Single",
	channel = CHAN_AUTO,
	volume = 1,
	soundlevel = 100,
	pitch = {125, 135},
	sound = {"weapons/physcannon/superphys_launch2.wav", "weapons/physcannon/superphys_launch3.wav"}
})

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "crossbow"

SWEP.ViewModel = "models/weapons/c_crossbow.mdl"
SWEP.WorldModel = "models/weapons/w_crossbow.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Damage = 621
SWEP.Primary.Delay = 0.12
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.Sound = Sound("Weapon_Slayer.Single")

SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 30
SWEP.RequiredClip = 3

SWEP.NumShots = 3

SWEP.ReloadSpeed = 0.9

SWEP.Recoil = 3

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.ConeMax = 5
SWEP.ConeMin = 2

SWEP.Tier = 7
SWEP.MaxStock = 2

SWEP.FireAnimSpeed = 0.65

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	
	if not self:GetOwner():HasTrinket("altevesoul") then
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
	elseif self:GetOwner():HasTrinket("altevesoul") and self:GetOwner():Health() < 50 then
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay() * 0.33)
	else
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
	end
	lmao = math.random(200,2000)
						zenithprojectiles = {
							"projectile_flakbomb",
							"projectile_biorifle",
							"projectile_crymam",
							"projectile_arrow_mini",
							"projectile_disc_razor",
							"projectile_emi",
							"projectile_banana",
							"projectile_melon",
							"projectile_rocket",
							"projectile_grenade_bouncy"
						}
	zenith = zenithprojectiles[math.random(1, #zenithprojectiles)]
	self.Primary.Projectile = zenith
	self.Primary.ProjVelocity = lmao
	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:EmitReloadSound()
	if IsFirstTimePredicted() then
		self:EmitSound("weapons/ar2/ar2_reload.wav", 75, 100, 1, CHAN_WEAPON + 21)
		self:EmitSound("weapons/smg1/smg1_reload.wav", 75, 100, 1, CHAN_WEAPON + 22)
	end
end

util.PrecacheSound("weapons/ar2/ar2_reload.wav")
util.PrecacheSound("weapons/smg1/smg1_reload.wav")
