AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = ""..translate.Get("wep_m_heal")

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
end

SWEP.Base = "weapon_zs_basemagic"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.ArmorRegen = 1


SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.71
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = true



function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if not owner:IsValid() then return end

	if not self:CanPrimaryAttack() then return end

end
function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if not owner:IsSkillActive(SKILL_MAGIC) then return end
	
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then
		self:SetIronsights(true)
		if not owner:IsValid() then return end
		if owner:GetBloodArmor() < owner.MaxBloodArmor then
		owner:SetBloodArmor(math.min(owner:GetBloodArmor() + self.ArmorRegen))
		end
local healmax = owner:IsSkillActive(SKILL_D_FRAIL) and math.floor(owner:GetMaxHealth() * 0.44) or owner:GetMaxHealth()
local healmax = owner:IsSkillActive(SKILL_ABUSE) and math.floor(owner:GetMaxHealth() * 0.25) or owner:GetMaxHealth()
		if owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor() and owner:Health() < math.min(healmax, owner:GetMaxHealth() * 0.9) then
			owner:SetHealth(owner:Health() + self.Primary.ArmorBleed)
			owner:SetBloodArmor(math.min(owner:GetBloodArmor() - self.Primary.ArmorBleed))
		end
	end

end


