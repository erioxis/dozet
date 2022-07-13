AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Pill,health up or health down?"

if CLIENT then
	SWEP.ViewModelBoneMods = {
		["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0, 59, 0) },
	}

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props/cs_office/water_bottle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props/cs_office/water_bottle.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.75, 0.75, 0.75), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/props/cs_office/water_bottle.mdl"

SWEP.Primary.Ammo = "foodwater"

SWEP.FoodHealth = 71
SWEP.FoodEatTime = 1
SWEP.FoodIsLiquid = true

function SWEP:Eat()
	local owner = self:GetOwner()

	if owner:IsSkillActive(SKILL_SUGARRUSH) then
		local boost = owner:GiveStatus("adrenalineamp", 14)
		
		if boost and boost:IsValid() then
			boost:SetSpeed(35)
		end
	end
	if owner:IsSkillActive(SKILL_DEATHCURSE) then
		local cursed = owner:GetStatus("cursed")
		if (cursed) then 
			owner:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() - 900)
			owner:GiveStatus("medrifledefboost", 35)
		end

	end
	if owner:HasTrinket("sin_gluttony") then
		debuff = math.random(1,6)
		if debuff == 1 then
			owner:GiveStatus("medrifledefboost", 15)
		elseif debuff == 2 then
			owner:GiveStatus("rot", 3)
		elseif debuff == 3 then
			owner:GiveStatus("frost", 15)
		elseif debuff == 4 then
			owner:AddPoisonDamage(15, self)
		elseif debuff == 5 then
			owner:GiveStatus("reaper", 70)
		else
			owner:GiveStatus("status_strengthdartboost", 70)
		end
	end
	if owner:IsSkillActive(SKILL_PILLUCK) then
	   owner.Luck = owner.Luck + 2
	end

	local max = owner:IsSkillActive(SKILL_D_FRAIL) and math.floor(owner:GetMaxHealth() * 0.25) or owner:GetMaxHealth()

	if owner:IsSkillActive(SKILL_GLUTTON) then
		local healing = self.FoodHealth * (owner.FoodRecoveryMul or 1)

		owner:SetBloodArmor(math.min(owner:GetBloodArmor() + (math.min(30, healing) * owner.BloodarmorGainMul), owner.MaxBloodArmor + (40 * owner.MaxBloodArmorMul)))
	else
		local healing = self.FoodHealth * (owner:GetTotalAdditiveModifier("FoodRecoveryMul", "HealingReceived") - (owner:GetPhantomHealth() > 0.5 and 0.5 or 0))

		owner:SetHealth(math.min(owner:Health() + healing, max))
		owner:SetPhantomHealth(math.max(0, math.floor(owner:GetPhantomHealth() - healing)))
	end

	self:TakePrimaryAmmo(1)
	if self:GetPrimaryAmmoCount() <= 0 then
		owner:StripWeapon(self:GetClass())
	end
end

