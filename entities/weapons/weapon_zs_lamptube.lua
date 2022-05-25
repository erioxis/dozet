AddCSLuaFile()

--SWEP.PrintName = "Lamp"
--SWEP.Description = "Обычная лампа но что-то в ней не так"
SWEP.PrintName = ""..translate.Get("wep_lampt")
SWEP.Description = ""..translate.Get("wep_d_lamp")
if CLIENT then

	SWEP.ViewModelFOV = 70
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.ViewModelBoneMods = {}
	SWEP.IronSightsPos = Vector(0.24, 0, 5.72)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.VElements = {
		["lampa"] = { type = "Model", model = "models/props_c17/gaspipes006a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.378, 1.66782, -5.37), angle = Angle(0.629, -3.096, -3.22), size = Vector(1.085, 1.085, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["lampa+"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.262, 3.384, -17.519), angle = Angle(161.87199, 24.906, -6.792), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["lampa"] = { type = "Model", model = "models/props_c17/gaspipes006a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.616, 1.603, -3.518), angle = Angle(0.629, -3.096, -3.22), size = Vector(1.085, 1.085, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["lampa+"] = { type = "Model", model = "models/props_c17/lampshade001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.332, 3.518, -16.261), angle = Angle(161.87199, 24.906, -6.792), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_stunbaton.mdl"
SWEP.UseHands = true
SWEP.Tier = 3
SWEP.HoldType = "melee"

SWEP.DamageType = DMG_CLUB

SWEP.MeleeDamage = 81
SWEP.MeleeRange = 108
SWEP.MeleeSize = 1
SWEP.BlockMultiplierWeapon = 0.25

SWEP.Primary.Delay = 1.1

SWEP.WalkSpeed = SPEED_SLOW

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.4
SWEP.SwingHoldType = "melee"

SWEP.AllowQualityWeapons = true
SWEP.DismantleDiv = 2

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.1)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 80, math.Rand(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_solid_impact_hard"..math.random(4, 5)..".wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end
