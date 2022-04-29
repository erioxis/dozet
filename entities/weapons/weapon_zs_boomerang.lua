AddCSLuaFile()

--SWEP.PrintName = "Harpoon MEGA"
--SWEP.Description = "MEGAAAA."
SWEP.PrintName = ""..translate.Get("wep_boomer")
SWEP.Description = ""..translate.Get("wep_d_boomer")

if CLIENT then
	SWEP.ViewModelFOV = 60

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(10.778, 0, 0) },
		["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(0.825, 0.825, 0.825), pos = Vector(-0.719, 0, 0), angle = Angle(0, 32.335, 0) },
		["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(-0.359, 0, 0), angle = Angle(0, -12.934, 0) },
		["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(1, 1, 1), pos = Vector(0, -0.719, 0), angle = Angle(-19.401, 0, 0) }
	}
	

	SWEP.VElements = {
		["boomerang"] = { type = "Model", model = "models/props_c17/truss03a.mdl", bone = "ValveBiped.Bip01_R_Finger4", rel = "", pos = Vector(3.119, 3.797, -1.822), angle = Angle(-179.164, 72.453, -75.066), size = Vector(0.05, 0.05, 0.025), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["boomerang+"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_R_Finger4", rel = "", pos = Vector(2.206, 2.444, -6.237), angle = Angle(-175.10201, -97.057, -71.32), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["boomerang++"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_R_Finger4", rel = "", pos = Vector(1.366, 4.462, -6.224), angle = Angle(-175.10201, -97.057, -71.32), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["boomerang+++"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_R_Finger4", rel = "", pos = Vector(3.206, 0.616, 2.688), angle = Angle(-175.10201, -97.057, -71.32), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["boomerang++++"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_R_Finger4", rel = "", pos = Vector(1.353, 4.121, 2.026), angle = Angle(-175.10201, -97.057, -71.32), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
	}
	
	
end

SWEP.Base = "weapon_zs_basemelee"
SWEP.UseHands = true
SWEP.HoldType = "grenade"

SWEP.DamageType = DMG_SLASH

SWEP.ViewModel = "models/weapons/v_grenade.mdl"
SWEP.WorldModel = "models/weapons/w_bugbait.mdl"




SWEP.MeleeDamage = 134
SWEP.MeleeRange = 51
SWEP.MeleeSize = 1.6
SWEP.MaxStock = 2
SWEP.Primary.Delay = 1.98

SWEP.Tier = 5

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.SwingRotation = Angle(0, -90, -60)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.6
SWEP.SwingHoldType = "grenade"

SWEP.HitAnim = ACT_VM_MISSCENTER

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.15, 1)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_sheet_impact_bullet"..math.random(2)..".wav", 70, math.random(90, 95))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("weapons/knife/knife_hit"..math.random(4)..".wav", 80, math.random(80, 85))
end

function SWEP:SecondaryAttack()
	if not self:CanPrimaryAttack() then return end
	local owner = self:GetOwner()
	local tr = owner:TraceLine(60)
	if tr.HitWorld or (tr.Entity:IsValid() and not tr.Entity:IsPlayer()) then return end
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	self:SendWeaponAnim(ACT_VM_MISSCENTER)
	owner:DoAnimationEvent(ACT_HL2MP_GESTURE_RANGE_ATTACK_GRENADE)

	self.NextDeploy = CurTime() + 0.75

	if SERVER then
		local ent = ents.Create("projectile_harpoon_tega1")
		if ent:IsValid() then
			ent:SetPos(owner:GetShootPos())
			ent:SetAngles(owner:EyeAngles())
			ent:SetOwner(owner)
			ent.ProjDamage = 134
			ent.BaseWeapon = self:GetClass()
			ent:Spawn()
			ent.Team = owner:Team()
			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous(self:GetOwner():GetAimVector() * 30 * (owner.ObjectThrowStrengthMul or 1))
			end
		end

		owner:StripWeapon(self:GetClass())
	end
end

