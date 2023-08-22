AddCSLuaFile()

--SWEP.PrintName = "Lamp"
--SWEP.Description = "Обычная лампа но что-то в ней не так"
SWEP.PrintName = translate.Get("wep_lamp")
SWEP.Description = translate.Get("wep_d_lamp")
if CLIENT then
	SWEP.ViewModelFOV = 65
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_interiors/Furniture_Lamp01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.85, -8), angle = Angle(183, 0, 2), size = Vector(1.5, 1.5, 1.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_interiors/Furniture_Lamp01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.837, 1.638, -10), angle = Angle(180, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props_interiors/Furniture_Lamp01a.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.Tier = 1

SWEP.MeleeDamage = 45
SWEP.MeleeRange = 120
SWEP.MeleeSize = 1
SWEP.BlockMultiplierWeapon = 0.5

SWEP.Primary.Delay = 1.3

SWEP.WalkSpeed = SPEED_SLOW

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.4
SWEP.SwingHoldType = "melee"

SWEP.AllowQualityWeapons = true


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
function SWEP:HaveAbility() 
	local float = self:GetDTFloat(6)
	if float>=300 then
		self.NoAbility = true
	end
end
function SWEP:DealThink(dmginfo) 
	if !self.NoAbility then 
		self:SetDTFloat(6,math.min(300,self:GetDTFloat(6)+math.min(50,dmginfo:GetDamage())))
	else
		self:SetDTFloat(6,self:GetDTFloat(6)-50)
		if self:GetDTFloat(6) <= 0 then
			self:SetDTFloat(6,0)
			self.NoAbility = false
		end
		return self.MeleeDamage*(self:GetOwner().MeleeDamageMultiplier or 1)
	end
end
if not CLIENT then return end
	local ablicolor =  Color( 234,45,152)
	function SWEP:DrawHUD()
		self:Draw2DFeature( self:GetDTFloat(6)/300, nil, nil, "weapon_ability_lamp", "ZSHUDFontSmallest", ablicolor, "+menu" )
		self.BaseClass.DrawHUD(self)
	end
	