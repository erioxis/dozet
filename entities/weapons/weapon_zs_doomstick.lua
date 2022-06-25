AddCSLuaFile()

SWEP.Base = "weapon_zs_baseshotgun"

--SWEP.PrintName = "DoomStick"
--SWEP.Description = "Ancient weapon,heaven for boomstickers,can burn zombie but less damage."
SWEP.PrintName = ""..translate.Get("wep_doomstick")
SWEP.Description = ""..translate.Get("wep_d_doomstick")

if CLIENT then
	SWEP.VElements = {
		["doomstick_2"] = { type = "Model", model = "models/props_c17/oildrum001_explosive.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(0.518, 0.518, 8.831), angle = Angle(0, 0, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "point", skin = 0, bodygroup = {} },
		["doomstick_3"] = { type = "Model", model = "models/props_c17/utilitypolemount01a.mdl", bone = "ValveBiped.Pump", rel = "", pos = Vector(0.518, -6.753, -1.558), angle = Angle(-10.52, 0, 0), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["doomstick_1"] = { type = "Model", model = "models/props_c17/gasmeter002a.mdl", bone = "ValveBiped.Gun", rel = "", pos = Vector(1.557, 6.752, 0), angle = Angle(0, 0, 0), size = Vector(0.172, 0.172, 0.172), color = Color(0, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["doomstick_1"] = { type = "Model", model = "models/props_c17/gasmeter002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(17.142, 1.557, -5.715), angle = Angle(0, 100, 0), size = Vector(0.1, 0.1, 0.1), color = Color(0, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["doomstick_2"] = { type = "Model", model = "models/props_c17/oildrum001_explosive.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(27.531, 1.557, -6.753), angle = Angle(82.986, 0, 0), size = Vector(0.09, 0.09, 0.09), color = Color(255, 255, 255, 255), surpresslightning = false, material = "point", skin = 0, bodygroup = {} },
		["doomstick_3"] = { type = "Model", model = "models/props_c17/utilitypolemount01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(15.064, 0.518, -10), angle = Angle(-180, 94.675, 78.311), size = Vector(0.107, 0.107, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.ReloadDelay = 0.81

SWEP.Primary.Sound = Sound("weapons/shotgun/shotgun_dbl_fire.wav")
SWEP.Primary.Damage = 44
SWEP.Primary.NumShots = 9
SWEP.Primary.Delay = 1.2

SWEP.Recoil = 7.5

SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "buckshot"
SWEP.Primary.DefaultClip = 30

SWEP.ConeMax = 11.5
SWEP.ConeMin = 10

SWEP.Tier = 7
SWEP.MaxStock = 1

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.6
SWEP.Knockback = 200

SWEP.PumpActivity = ACT_SHOTGUN_PUMP
SWEP.PumpSound = Sound("Weapon_Shotgun.Special1")
SWEP.ReloadSound = Sound("Weapon_Shotgun.Reload")



GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.07)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, ""..translate.Get("wep_doomstick_r1"), ""..translate.Get("wep_d_doomstick_r1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 20
	wept.ReloadSpeed = wept.ReloadSpeed * 1.9
	wept.Primary.Delay = wept.Primary.Delay * 1.5
	wept.Knockback = 510
	wept.WalkSpeed = SPEED_SLOW
	wept.ConeMax = 2
    wept.ConeMin = 0.2
	wept.Primary.NumShots = 1
	wept.Primary.ClipSize = 1
end)

branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, ""..translate.Get("wep_doomstick_f1"), ""..translate.Get("wep_d_doomstick_f1"), function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 2
	wept.Primary.NumShots = 6
	wept.Primary.Delay = 0.29
	wept.Knockback = wept.Knockback * 1.1
	wept.FireAnimSpeed = 0.55
end)
branch.Colors = {Color(50, 160, 255), Color(50, 130, 215), Color(40, 115, 175), Color(40, 0, 175)}
branch.NewNames = {"Clocker", "Brocker", "Mlocker", "Krelocker", "Lochet"}

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

SWEP.BulletCallback = function(attacker, tr, dmginfo)
	local ent = tr.Entity
	if SERVER and math.random(100) == 1 and ent:IsValidLivingZombie() then
		ent:Ignite(120)
		for __, fire in pairs(ents.FindByClass("entityflame")) do
			if fire:IsValid() and fire:GetParent() == ent then
				fire:SetOwner(attacker)
				fire:SetPhysicsAttacker(attacker)
				fire.AttackerForward = attacker
			end
		end
	end
end
