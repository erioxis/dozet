AddCSLuaFile()

SWEP.PrintName = translate.Get("wep_z9000")
SWEP.Description = translate.Get("wep_d_z9000")
SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60

	SWEP.HUD3DBone = "ValveBiped.square"
	SWEP.HUD3DPos = Vector(1.1, 0.25, -2)
	SWEP.HUD3DScale = 0.015

	SWEP.ShowViewModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/weapons/w_alyx_gun.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7, 2, -4.092), angle = Angle(170, 10, 10), size = Vector(1.1, 1.1, 1.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"

SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_alyx_gun.mdl"
SWEP.UseHands = true

SWEP.InnateDamageType = INNATE_TYPE_PULSE
SWEP.InnateDamageMul = 0.25


SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("weapons/alyx_gun/alyx_shotgun_cock1.wav")
SWEP.Primary.Sound = Sound("weapons/alyx_gun/alyx_gun_fire3.wav")
SWEP.Primary.Damage = 31
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.75

SWEP.Primary.ClipSize = 32
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 50

SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.IronSightsPos = Vector(-5.95, 3, 2.75)
SWEP.IronSightsAng = Vector(-0.15, -1, 2)

SWEP.TracerName = "AR2Tracer"

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAX_SPREAD, -0.25)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.0175, 1)

SWEP.PointsMultiplier = GAMEMODE.PulsePointsMultiplier

function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValidZombie() then
		local wep = attacker:GetActiveWeapon()
		local intd = wep:GetDTInt(6)
		wep:SetDTInt(6,intd+1)
		if intd >= 5 then
			local dmg = dmginfo:GetDamage()
			ent:AddLegDamageExt( dmg * 0.5, attacker,  wep, SLOWTYPE_PULSE)
			if SERVER then
				ent:TakeDamage( dmg * 3, attacker,  wep)
			end
			wep:SetDTInt(6,0)
		end
	end

	if IsFirstTimePredicted() then
		util.CreatePulseImpactEffect(tr.HitPos, tr.HitNormal)
	end
	dmginfo:GetInflictor().BaseClass.BulletCallback(attacker, tr, dmginfo)
end

if !CLIENT then return end
	local ablicolor =  Color( 19,34,174)
	function SWEP:Draw2DHUD()
		self:Draw2DFeature(self:GetDTInt(6)/5, nil, nil, "weapon_ability_z9000", "ZSHUDFontSmallest", ablicolor )
		self.BaseClass.Draw2DHUD(self)
	end
	
	function SWEP:Draw3DHUD(vm, pos, ang)
	
		cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
				self:Draw3DFeatureHorizontal( vm, pos+Vector(0,-1,1), ang, self:GetDTInt(6)/5, nil, nil, "weapon_ability_z9000", "ZSHUDFont", ablicolor )
		cam.End3D2D()
		self.BaseClass.Draw3DHUD(self,vm, pos, ang)
	end
	
