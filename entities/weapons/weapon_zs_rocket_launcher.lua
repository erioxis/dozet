AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

--SWEP.PrintName = "DoomStick"
--SWEP.Description = "Ancient weapon,heaven for boomstickers,can burn zombie but less damage."
SWEP.PrintName = ""..translate.Get("wep_rlauncher")
SWEP.Description = ""..translate.Get("wep_d_rlauncher")

if CLIENT then
	SWEP.WElements = {
		["balka1"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "shotgun", pos = Vector(22.274, -2.357, -2.505), angle = Angle(6, -180, -85.254), size = Vector(0.24, 0.35, 0.31), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(-4.622, -0.052, 1.549), angle = Angle(90, 0, 0), size = Vector(0.037, 0.037, 0.037), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(6.144, 0.051, 1.773), angle = Angle(0, -180, -90), size = Vector(0.02, 0.057, 0.07), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "balka1", pos = Vector(1.715, 1.163, 2), angle = Angle(0, 0, -86), size = Vector(1.021, 1.021, 1.021), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["shotgun"] = { type = "Model", model = "models/props_junk/CinderBlock01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.016, 1.258, 0), angle = Angle(0, 0, 0), size = Vector(0.132, 0.132, 0.132), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.VElements = {
		["balka1"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Pump", rel = "", pos = Vector(-1.654, 3.752, 11.788), angle = Angle(-90, 0, 0), size = Vector(0.303, 0.35, 0.35), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+"] = { type = "Model", model = "models/hunter/tubes/tube1x1x1.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(-7.18994, 0.02802, 1.789), angle = Angle(90, 0, 0), size = Vector(0.054, 0.054, 0.054), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1++"] = { type = "Model", model = "models/hunter/triangles/trapezium3x3x1c.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(7.65302, 0.05101, 1.77298), angle = Angle(0, -180, -89.99999), size = Vector(0.02, 0.057, 0.07), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
		["balka1+++"] = { type = "Model", model = "models/hunter/tubes/circle2x2b.mdl", bone = "ValveBiped.Gun", rel = "balka1", pos = Vector(7.68896, -0.17799, 3.18103), angle = Angle(0, 0, 0), size = Vector(0.009, 0.023, 0.074), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_combine/metal_combinebridge001", skin = 0, bodygroup = {} },
		["balka1++++"] = { type = "Model", model = "models/weapons/w_pistol.mdl", bone = "ValveBiped.Pump", rel = "balka1", pos = Vector(2.915, 1.163, 2), angle = Angle(0, 0, -86), size = Vector(1.021, 1.021, 1.021), color = Color(150, 150, 150, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} }
	}
	
end

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadDelay = 0.81

SWEP.Primary.Sound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.Primary.Damage = 133
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 1.2
SWEP.Primary.Rocket = 1

SWEP.Recoil = 7.5

SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.DefaultClip = 30

SWEP.ConeMax = 3
SWEP.ConeMin = 1

SWEP.Tier = 6
SWEP.MaxStock = 2

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.6
SWEP.Knockback = 200

SWEP.PumpActivity = ACT_SHOTGUN_PUMP
SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")



GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.07)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()

	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitSound(self.Primary.Sound)

	local clip = self:Clip1()

	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots * clip, self:GetCone())

	self:TakePrimaryAmmo(clip)
	owner:ViewPunch(clip * 0.5 * self.Recoil * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))

	owner:SetGroundEntity(NULL)
	owner:SetVelocity(-self.Knockback * clip * owner:GetAimVector())

	self.IdleAnimation = CurTime() + self:SequenceDuration()
end
function SWEP:SecondaryAttack()
	if self.Primary.Rocket >= 1 then
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)
	self:EmitSound(self.Primary.Sound)
	self:ShootBullets(self.Primary.Damage * 8, self.Primary.NumShots, self:GetCone())
	self.Primary.Rocket = self.Primary.Rocket - 1
	end
end

SWEP.OnZombieKilled = function(self, zombie, total, dmginfo)
	if math.random(1,5) == 5 then
	self.Primary.Rocket = self.Primary.Rocket + 1
	end
end
