AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = ""..translate.Get("wep_katana")
SWEP.Description = ""..translate.Get("wep_d_katana")
if CLIENT then
	SWEP.VElements = {
		["vip"] = { type = "Model", model = "models/props_combine/combine_light001a.mdl", bone = "ValveBiped.Bip01_R_Finger12", rel = "", pos = Vector(1.147, 1.172, -5.23), angle = Angle(-5.622, 19.182, -4.884), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vipb+"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "ValveBiped.Bip01_R_Finger0", rel = "", pos = Vector(11.005, 18.847, -0.634), angle = Angle(-176.105, -149.41499, -90.581), size = Vector(0.013, 0.013, 0.04), color = Color(0, 208, 255, 48), surpresslightning = true, material = "models/shadertest/shader4", skin = 0, bodygroup = {} },
		["vipb++"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "ValveBiped.Bip01_R_Finger0", rel = "", pos = Vector(12.101, 16.895, -3.883), angle = Angle(158.241, 32.894, 82.554), size = Vector(0.01, 0.01, 0.04), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["vip"] = { type = "Model", model = "models/props_combine/combine_light001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.748, 1.715, -4.306), angle = Angle(-5.047, 18.762, -5.15), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vipa"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket02b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.727, 2.95, -2.713), angle = Angle(-142.505, -21.131, -46.133), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vipb++"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.009, 2.243, -12.547), angle = Angle(178.731, 125.721, -10.284), size = Vector(0.01, 0.01, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["vipb+1"] = { type = "Model", model = "models/props_combine/combineinnerwall001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.009, 4.243, -22.547), angle = Angle(178.731, 125.721, -10.284), size = Vector(0.013, 0.013, 0.04), color = Color(0, 208, 255, 106), surpresslightning = true, material = "models/shadertest/shader4", skin = 0, bodygroup = {} }
	}
	
	

      SWEP.ShowViewModel = false
      SWEP.ShowWorldModel = false

end

SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_stunbaton.mdl"


SWEP.HoldType = "melee2"
SWEP.Tier = 7
SWEP.MeleeDamage = 231
SWEP.MeleeRange = 156
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 0

SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.59
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = true

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
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= 90 then
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