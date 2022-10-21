AddCSLuaFile()

--SWEP.PrintName = "'ToxicShooter' Handgun"
--SWEP.Description = "Тратит половину своих токсичных патрон имеет хороший токсичный уронн"
SWEP.PrintName = ""..translate.Get("wep_toxicshooter")
SWEP.Description = ""..translate.Get("wep_d_toxicshooter")

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

SWEP.VElements = {
	["base"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2.11, -2), angle = Angle(0, -90, -97), size = Vector(0.4, 0.4, 0.4), color = Color(135, 20, 245, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_p228.mdl"
SWEP.WorldModel = "models/weapons/w_pist_p228.mdl"
SWEP.UseHands = true
--models/weapons/w_pist_p228.mdl
SWEP.Primary.Sound = Sound("Weapon_P228.Single")
SWEP.Primary.Damage = 36
SWEP.Primary.NumShots = 2
SWEP.Primary.Delay = 0.33
SWEP.Tier = 4
SWEP.Primary.ClipSize = 13
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "chemical"
SWEP.Primary.ClipMultiplier = 12 * 2 -- Battleaxe/Owens have 12 clip size, but this has half ammo usage

SWEP.ConeMax = 4
SWEP.ConeMin = 0.75

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_CLIP_SIZE, 1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, ""..translate.Get("wep_toxicshooter_r1"), ""..translate.Get("wep_d_toxicshooter_r1"), function(wept)
	wept.Primary.Delay = 0.243
	wept.Primary.Automatic = true
	wept.Primary.ClipSize = math.floor(wept.Primary.ClipSize * 1.25)

	wept.ConeMin = 2
	
		wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
		local minushp = (-zombie:Health() or -20)
		if killer:IsValid() and minushp > -20 then
			local pos = zombie:GetPos()

			timer.Simple(0.15, function()
				
				util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 72, minushp, DMG_ALWAYSGIB, 1)
			end)

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata, true, true)
		end
	end
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
