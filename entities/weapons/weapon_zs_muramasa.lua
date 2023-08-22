AddCSLuaFile()


SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 75
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-6.467, -2.515, 2.515), angle = Angle(0, 0, 0) }
}
SWEP.CanDismantle = true
SWEP.SCKMaterials = {"cs_assault/concretefloor026a",}

SWEP.IronSightsPos = Vector(0.64, 0, 4.76)
SWEP.IronSightsAng = Vector(0, 0, 0)
qual = math.Round(util.SharedRandom(SysTime(), 1, 6))
if qual == 2 then
    dada = "qual_1"
	SWEP.Primary.Delay = 0.3
	SWEP.SwingTime = 0.11
	SWEP.MeleeDamage = 56
	SWEP.MeleeRange = 89
elseif qual == 3 then
dada = "qual_2"
SWEP.Primary.Delay = 0.40
SWEP.MeleeDamage = 52
SWEP.SwingTime = 0.2
SWEP.MeleeRange = 77
elseif qual == 4 then
dada = "qual_3"
SWEP.MeleeRange = 56
SWEP.MeleeDamage = 44
SWEP.SwingTime = 0.07
SWEP.Primary.Delay = 0.33
elseif qual == 5 then
dada = "qual_4"
SWEP.MeleeRange = 101
SWEP.MeleeDamage = 66
SWEP.Primary.Delay = 0.6
SWEP.SwingTime = 0.2
elseif qual == 6 then
	dada = "qual_5"
	SWEP.MeleeDamage = 33
	SWEP.SwingTime = 0.09
	SWEP.MeleeRange = 77
	SWEP.Primary.Delay = 0.4
else
	dada = "qual_0"
	SWEP.MeleeDamage = 44
    SWEP.MeleeRange = 55
	SWEP.Primary.Delay = 0.35
	SWEP.SwingTime = 0.1
end
--print(dada)
SWEP.PrintName = translate.Get(dada)..translate.Get("wep_muramasa")
SWEP.Description = translate.Get("wep_d_muramasa")..translate.Get(dada)
if CLIENT then
	SWEP.VElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.485, 2.614, 2.876), angle = Angle(0, 0, -89.521), size = Vector(0.626, 0.331, 0.256), color = Color(74, 70, 70, 255), surpresslightning = false, material = "cs_assault/concretefloor026a", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.515, 2.458, -26.795), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(76, 0, 255, 248), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.695, 2.216, 2.505), angle = Angle(0, 0, -89.521), size = Vector(0.5, 0.305, 0.384), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.601, 2.219, -22.263), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(119, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

      SWEP.ShowViewModel = false
      SWEP.ShowWorldModel = false

end

SWEP.Base = "weapon_zs_basemelee"

SWEP.Tier = 2
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 0
SWEP.BlockMultiplierWeapon = 1
SWEP.WalkSpeed = 220


SWEP.SwingRotation = Angle(0, -80, -40)
SWEP.SwingOffset = Vector(10, 80, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = false

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end


function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= -90 then
		self.m_BackStabbing = true
		self.MeleeDamage = self.MeleeDamage * 8
	end
end
function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.MeleeDamage / 8
	end
end