AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = translate.Get("wep_axe")

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
	
	function SWEP:PostDrawViewModel(vm, pl, wep)
		local veles = self.VElements
	
		local col1 = self:GetOwner():GetWeaponColor():ToColor()
		veles["base"].color = col1
		local weles = self.WElements
		weles["base"].color = col1
	end
end

SWEP.Base = "weapon_zs_basemelee_modified"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.MeleeDamage = 59/3
SWEP.MeleeRange = 59
SWEP.MeleeSize = 1.59
SWEP.MeleeKnockBack =  59

SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.59
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.Attacks_Per_Swung = 3
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3)

SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.MissAnim = ACT_VM_MISSCENTER

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/knife/knife_hit"..math.random(4)..".wav", 90, math.random(120, 135))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/metal/sawblade_stick"..math.random(1, 3)..".wav")
end
SWEP.OverPosition =  {0,0,11}
SWEP.Additionalism =  {0,-0.8,-11}
SWEP.StaminaUse = 12
