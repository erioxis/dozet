AddCSLuaFile()

--SWEP.PrintName = "Push Broom"
--SWEP.Description = "BrooooooooooOOOOOOOOOOOOOM!"
SWEP.PrintName = ""..translate.Get("wep_pushbroom")
SWEP.Description = ""..translate.Get("wep_d_pushbroom")
if CLIENT then
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/pushbroom.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 0.5, 8), angle = Angle(-65, -90, 90), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/pushbroom.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, 5), angle = Angle(247, 90, 283), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 66
SWEP.MeleeRange = 120
SWEP.MeleeSize = 1.7
SWEP.MeleeKnockBack = 90

SWEP.Primary.Delay = 1.05

SWEP.Tier = 2

SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.6
SWEP.SwingHoldType = "melee"

SWEP.AllowQualityWeapons = true
SWEP.DismantleDiv = 2

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.08, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3, 1)
function SWEP:MeleeSwing()
	local owner = self:GetOwner()
	local tr = owner:CompensatedMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)
	if tr.Hit then
		local pos = owner:GetPos()
		local trpos = tr.HitPos
		if math.floor(trpos.z) == math.floor(pos.z) and math.random(1,100) == 1 then
			owner:Say("Ы")
		end
	end
	self.BaseClass.MeleeSwing(self)
end
function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 80, math.Rand(60, 65))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/wood/wood_plank_impact_hard"..math.random(4)..".wav", 75, math.random(75, 80))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/wood/wood_plank_impact_hard"..math.random(4)..".wav", 75, math.random(75, 80))
end
