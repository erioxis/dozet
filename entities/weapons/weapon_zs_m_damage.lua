AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = translate.Get("wep_m_damage")
SWEP.Description = translate.Get("wep_d_m_damage")

if CLIENT then
	
	SWEP.ViewModelFOV = 70
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.ViewModelBoneMods = {}
	SWEP.IronSightsPos = Vector(6.04, 0, -0.88)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	SWEP.VElements = {
		["bruh"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(12.639, -0.416, -4.85), size = { x = 1, y = 1 }, color = Color(21, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["bruh+"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(9.038, -3.201, -5.22), size = { x = 1, y = 1 }, color = Color(140, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["yes1"] = { type = "Model", model = "models/props_c17/gravestone_cross001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.118, 0.86, -3.346), angle = Angle(-177.62399, -138.11301, -2.264), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["ys2"] = { type = "Model", model = "models/props_c17/hospital_railing_160_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.912, -0.255, -2.21), angle = Angle(-86.72, -12.952, 5.312), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["bruh"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.639, -0.416, -4.85), size = { x = 1, y = 1 }, color = Color(21, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["bruh+"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.142, 8.331, -13.975), size = { x = 1, y = 1 }, color = Color(140, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["yes1"] = { type = "Model", model = "models/props_c17/gravestone_cross001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.118, 0.86, -3.346), angle = Angle(-177.62399, -138.11301, -2.264), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["ys2"] = { type = "Model", model = "models/props_c17/hospital_railing_160_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.912, -0.255, -2.21), angle = Angle(-86.72, -12.952, 5.312), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
end
SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_stunbaton.mdl"

SWEP.Base = "weapon_zs_basemagic"

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
SWEP.Tier = 5
SWEP.HitDecal = "Manhackcut"
SWEP.Primary.Damage = 121
SWEP.ArmorRegen = 2

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

function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if not owner:IsSkillActive(SKILL_MAGIC) then return end
	
	
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then

		if not owner:IsValid() then return end
		if owner:GetBloodArmor() < owner.MaxBloodArmor then
			self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
			if SERVER then
		        owner:SetBloodArmor(math.min(owner:GetBloodArmor() + self.ArmorRegen) * (owner.MagicRegen or 1))
		    end
		if owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor() then
			owner:GiveStatus("strengthdartboost", 20)
			if SERVER then
			    owner:SetBloodArmor(math.min(owner:GetBloodArmor() - self.Primary.ArmorBleed) * (owner.MagicRegen or 1))
			end
		end
	end
end
end

