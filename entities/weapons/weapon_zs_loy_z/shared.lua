

--SWEP.PrintName = "Axel"
--SWEP.Description = "The Ancient axe of Toy,Have 1.5x points multiplier.Big Damage for big knockback"
SWEP.PrintName = ""..translate.Get("wep_axel")
SWEP.Description = ""..translate.Get("wep_d_axel")



SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.PointsMultiplier = 1.5
SWEP.Tier = 7
SWEP.MaxStock = 1

SWEP.ZombieCanPickup = true
SWEP.MeleeDamage = 99
SWEP.MeleeDamageVsProps = 30
SWEP.MeleeRange = 71
SWEP.MeleeSize = 1.5
SWEP.MeleeKnockBack = 1000

SWEP.WalkSpeed = 160

SWEP.SwingTime = 0.23
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = false

function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end
function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end
