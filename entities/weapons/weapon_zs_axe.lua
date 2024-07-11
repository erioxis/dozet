AddCSLuaFile()

SWEP.PrintName = "Baxe"
SWEP.Description = "Balance."

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props/cs_militia/axe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.299, -4), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props/cs_militia/axe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.399, -4), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
<<<<<<< Updated upstream
=======
	
	function SWEP:PostDrawViewModel(vm, pl, wep)
		local veles = self.VElements
	
		local col1 = self:GetOwner():GetWeaponColor():ToColor()
		veles["base"].color = col1
		local weles = self.WElements
		weles["base"].color = col1
	end
>>>>>>> Stashed changes
end
SWEP.UsedNewWeapons = true 

if !SWEP.UsedNewWeapons then
	SWEP.Base = "weapon_zs_basemelee"
	DEFINE_BASECLASS("weapon_zs_basemelee")
	SWEP.MeleeDamage = 45
else
	SWEP.Base = "weapon_zs_basemelee_modified"
	DEFINE_BASECLASS("weapon_zs_basemelee_modified")
	SWEP.MeleeDamage = 53/3
	SWEP.OverPosition =  {8,5,11}
	SWEP.Additionalism =  {-1,-1.3,-6}
	SWEP.StaminaUse = 12	
	
	SWEP.HitAnim = ACT_VM_MISSCENTER
	SWEP.MissAnim = ACT_VM_MISSCENTER
end

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.MeleeDamage = 71
SWEP.MeleeRange = 71
SWEP.MeleeSize = 1.71
SWEP.MeleeKnockBack =  71

SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.71
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
