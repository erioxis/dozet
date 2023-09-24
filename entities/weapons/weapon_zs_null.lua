AddCSLuaFile()

SWEP.PrintName = "null"
SWEP.Description = "null"

SWEP.ViewModel = Model("models/weapons/v_pza.mdl")
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "knife"

SWEP.DamageType = DMG_SLASH

SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/props_junk/glassbottle01a_chunk01a.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.AutoSwitchFrom	= true

SWEP.MeleeDamage = 21
SWEP.MeleeRange = 81
SWEP.MeleeSize = 0.875
SWEP.Tier = 1

SWEP.WalkSpeed = SPEED_FASTEST

SWEP.Primary.Delay = 0.09

SWEP.HitDecal = "Manhackcut"

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
SWEP.MissGesture = SWEP.HitGesture

SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.MissAnim = ACT_VM_PRIMARYATTACK

SWEP.NoHitSoundFlesh = true

SWEP.NoGlassWeapons = true

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav")
end

function SWEP:PlayHitSound()
	local owner = self:GetOwner()
	owner:EmitSound("npc/combine_soldier/die"..math.random(1,3)..".wav", 75, math.random(70,75), 0.5)
	owner:EmitSound("npc/combine_soldier/die"..math.random(1,3)..".wav", 75, math.random(78,90), 0.5)
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/glass/glass_bottle_break2.wav")
end

function SWEP:OnMeleeHit(hitent, hitflesh)
	if hitent:IsValid() and SERVER then
		timer.Simple(0, function() self:GetOwner():StripWeapon(self:GetClass()) end)
	end
end
