AddCSLuaFile()
<<<<<<< Updated upstream

SWEP.PrintName = "Keyboard"
SWEP.Description = "You overfilled by fury and shields!."

=======
SWEP.PrintName = translate.Get("wep_keyboard")
SWEP.Description = translate.Get("wep_d_keyboard")
>>>>>>> Stashed changes

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -45.715, 0) },
		["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, -49.524, 0) }
	}
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/computer01_keyboard.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.091, 4.4, -7.728), angle = Angle(180, -82.842, 80.794), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/computer01_keyboard.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 4.091, -8.636), angle = Angle(180, -60.341, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props_c17/computer01_keyboard.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 32
SWEP.MeleeRange = 61
SWEP.MeleeSize = 0.8

SWEP.Primary.Delay = 0.56

SWEP.SwingTime = 0.45
SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingHoldType = "grenade"

SWEP.AllowQualityWeapons = true
SWEP.DismantleDiv = 2

function SWEP:OnZombieKilled(zombie, total, dmginfo)
	local killer = self:GetOwner()

	if killer:IsValid() then
		killer:GiveStatus("medrifledefboost", 3) 
		killer:GiveStatus("strengthdartboost", 4)
<<<<<<< Updated upstream
		killer:GiveStatus("bleed")
		end
=======
		killer:GiveStatus("keyboard", 7)
	end	
end
function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if SERVER and ent:IsPlayer() then
		local gt = ent:GiveStatus("enfeeble", damage * self.EnfeebleDurationMul)
		if gt and gt:IsValid() then
			gt.Applier = self:GetOwner()
		end

		ent:GiveStatus("dimvision", 3)

		local bleed = ent:GiveStatus("bleed")
		if bleed and bleed:IsValid() then
			bleed:AddDamage(self.BleedDamage)
			bleed.Damager = self:GetOwner()
		end
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
>>>>>>> Stashed changes
end


GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.075)

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/keyboard/keyboard_hit-0"..math.random(4)..".ogg")
end
