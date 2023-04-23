AddCSLuaFile()

SWEP.PrintName = translate.Get("wep_medkit")
SWEP.Description = translate.Get("wep_d_medkit")
SWEP.Slot = 4
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFOV = 57
	SWEP.ViewModelFlip = false

	SWEP.BobScale = 2
	SWEP.SwayScale = 1.5
end

SWEP.Base = "weapon_zs_base"

SWEP.WorldModel = "models/weapons/w_medkit.mdl"
SWEP.ViewModel = "models/weapons/c_medkit.mdl"
SWEP.UseHands = true

SWEP.Heal = 14
SWEP.Primary.Delay = 6.3

SWEP.Primary.ClipSize = 30
SWEP.Primary.DefaultClip = 150
SWEP.Primary.Ammo = "Battery"

SWEP.UltraCharge = 0

SWEP.Secondary.DelayMul = 13 / SWEP.Primary.Delay
SWEP.Secondary.HealMul = 11 / SWEP.Heal

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.HealRange = 36
SWEP.UltraDa = 1

SWEP.Combo = 0

SWEP.NoMagazine = true
SWEP.AllowQualityWeapons = true


SWEP.HoldType = "slam"

GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_HEALCOOLDOWN, -0.8)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_HEALRANGE, 4, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_HEALING, 1.5)
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, ""..translate.Get("wep_medkit_r1"), ""..translate.Get("wep_d_medkit_r1"), function(wept)
	wept.FixUsage = true
	wept.Primary.Delay = wept.Primary.Delay * 1.5
end)
branch.Colors = {Color(255, 160, 50), Color(215, 120, 50), Color(175, 100, 40), Color(10, 115, 15), Color(36, 32, 32)}
branch.NewNames = {translate.Get("wep_r_1"), translate.Get("wep_r_2"), translate.Get("wep_r_3"), translate.Get("wep_r_4"), translate.Get("wep_r_5")}
local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 2, ""..translate.Get("wep_medkit_f1"), ""..translate.Get("wep_d_medkit_f1"), function(wept)
	wept.BloodHeal = true
	wept.Primary.Delay = wept.Primary.Delay * 0.5
	wept.Heal = wept.Heal * 0.3
end)
branch.Colors = {Color(255, 160, 50), Color(215, 120, 50), Color(175, 100, 40), Color(10, 115, 15), Color(36, 32, 32)}
branch.NewNames = {"Bloody", "Bloodlust", "Blood-shed", "Biggy blood", "Blud"}

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	GAMEMODE:DoChangeDeploySpeed(self)
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end


	local owner = self:GetOwner()
	if  owner:IsSkillActive(SKILL_FOREVERALONE) then return end
	local trtbl = owner:CompensatedPenetratingMeleeTrace(self.HealRange, 2, nil, nil, true)
	local ent
	for _, tr in pairs(trtbl) do
		local test = tr.Entity
		if test and test:IsValidLivingHuman() and (!self.BloodHeal and gamemode.Call("PlayerCanBeHealed", test) or self.BloodHeal and test:GetBloodArmor()< (test.MaxBloodArmor or 35)+100) then
			ent = test

			break
		end
	end

	if not ent then return end

	local multiplier = self.MedicHealMul or 1
	local cooldownmultiplier = self.MedicCooldownMul or 1
	local healed = 15
	if !self.BloodHeal then
		 healed = owner:HealPlayer(ent, owner:HasTrinket("pr_bloodpack") and self.Heal * math.max(1, self.Combo / 3) or math.min(self:GetCombinedPrimaryAmmo(), self.Heal * math.max(1, self.Combo / 3)))
	end
		timer.Create("ComboReset", 15, 1, function() 
			self.Combo = 0
		end)


	local totake = self.FixUsage and 15 or math.ceil(healed / multiplier)

	if totake > 0 then
		if owner:IsSkillActive(SKILL_MEDICBOOSTER) then
			self.UltraCharge = self.UltraCharge + 1
		end
		if self.UltraCharge >= 4 and owner:IsSkillActive(SKILL_MEDICBOOSTER) then
		    ent:GiveStatus("strengthdartboost",30)
			ent:GiveStatus("medrifledefboost",30)
			ent:GiveStatus("holly",30)
			self.UltraCharge = 0
	    end
		if owner:IsSkillActive(SKILL_COMBOHEAL) and self.Combo ~= 26 then
		   self.Combo = self.Combo + 1
		end
		if owner:HasTrinket("mediiii") and math.random(5) == 5 and SERVER and !self.BloodHeal then
			ent:AddPoisonDamage(math.random(12), owner)
		end
		if owner:HasTrinket("pr_barapaw") and math.random(3) == 3 and SERVER then
			ent:GiveStatus("knockdown", 1.5)
		end
		if owner:IsSkillActive(SKILL_WYRDREC) and SERVER and math.random(100) < (60 * ((ent.BleedDamageTakenMul or 1) * (ent.BleedSpeedMul or 1))) then
			ent:AddBleedDamage(math.random(15,30), ent)
		end
	
		local cursed = ent:GetStatus("cursed")
		if (cursed) and SERVER then 
			ent:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() - 5)
			owner:AddPoints(2)
		end
		if self.BloodHeal == true and SERVER then
			ent:SetBloodArmor(math.min(ent.MaxBloodArmor + 100, ent:GetBloodArmor() + self.Heal * 3))
			ent.BuffedArmor = math.min(ent.MaxBloodArmor + 100, (ent.BuffedArmor or 1) + self.Heal * 3)
			ent.WhoBuffed = owner
		end
		if not owner:IsSkillActive(SKILL_DUALHEAL) then
		self:SetNextCharge(CurTime() + self.Primary.Delay * math.min(1, healed / self.Heal) * cooldownmultiplier)
		elseif owner:IsSkillActive(SKILL_DUALHEAL) and self.UltraDa ~= 2 then
		self:SetNextCharge(CurTime() + self.Primary.Delay * math.min(1, healed / self.Heal) * cooldownmultiplier)
			self.UltraDa = 2
		elseif owner:IsSkillActive(SKILL_DUALHEAL) and self.UltraDa ~= 1 then
			self:SetNextCharge(0)
			self.UltraDa = 1
		end
		if owner:IsSkillActive(SKILL_WYRDREC) and !self.BloodHeal  then
			timer.Simple( 0.1, function() owner:HealPlayer(ent, math.random(1,13)) end)
		end
		owner.NextMedKitUse = self:GetNextCharge()
		if not owner:HasTrinket("pr_bloodpack") or self:GetPrimaryAmmoCount() >= 1 then
			self:TakeCombinedPrimaryAmmo(totake)
		elseif self:GetPrimaryAmmoCount() <= 0 and owner:HasTrinket("pr_bloodpack") and SERVER then
			owner:TakeDamage(totake)
		elseif self:GetPrimaryAmmoCount() >= 1 and owner:HasTrinket("pr_bloodpack") then
			self:TakeCombinedPrimaryAmmo(totake)
		end

		self:EmitSound("items/medshot4.wav")

		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

		owner:DoAttackEvent()
		self.IdleAnimation = CurTime() + self:SequenceDuration()

	end

end

function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if not self:CanPrimaryAttack() or not gamemode.Call("PlayerCanBeHealed", owner) then return end
	if owner:IsSkillActive(SKILL_PREMIUM) then return end

	local multiplier = self.MedicHealMul or 1
	local cooldownmultiplier = self.MedicCooldownMul or 1
	local healed = owner:HealPlayer(owner, math.min(self:GetCombinedPrimaryAmmo(), self.Heal * self.Secondary.HealMul))
	local totake = self.FixUsage and 10 or math.ceil(healed / multiplier)

	if totake > 0 then
		self:SetNextCharge(CurTime() + self.Primary.Delay * self.Secondary.DelayMul * math.min(1, healed / self.Heal * self.Secondary.HealMul) * cooldownmultiplier)
		owner.NextMedKitUse = self:GetNextCharge()

		self:TakeCombinedPrimaryAmmo(totake)

		self:EmitSound("items/smallmedkit1.wav")

		self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

		owner:DoAttackEvent()
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
end

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)

	self.IdleAnimation = CurTime() + self:SequenceDuration()

	if CLIENT then
		hook.Add("PostPlayerDraw", "PostPlayerDrawMedical", GAMEMODE.PostPlayerDrawMedical)
		GAMEMODE.MedicalAura = true
	end

	return true
end

function SWEP:Holster()
	if CLIENT and self:GetOwner() == MySelf then
		hook.Remove("PostPlayerDraw", "PostPlayerDrawMedical")
		GAMEMODE.MedicalAura = false
	end

	return true
end

function SWEP:OnRemove()
	if CLIENT and self:GetOwner() == MySelf then
		hook.Remove("PostPlayerDraw", "PostPlayerDrawMedical")
		GAMEMODE.MedicalAura = false
	end
end

function SWEP:Reload()
end

function SWEP:SetNextCharge(tim)
	self:SetDTFloat(0, tim)
end

function SWEP:GetNextCharge()
	return self:GetDTFloat(0)
end


function SWEP:CanPrimaryAttack()
	local owner = self:GetOwner()
	if owner:IsHolding() or owner:GetBarricadeGhosting() then return false end
	if self:GetPrimaryAmmoCount() <= 0 then
		if owner:HasTrinket("pr_bloodpack") and owner:Health() >= owner:GetMaxHealth() * 0.25 then
			return self:GetNextCharge() <= CurTime() and (owner.NextMedKitUse or 0) <= CurTime()
		end
		self:EmitSound("items/medshotno1.wav")
		self:SetNextCharge(CurTime() + 0.75)
		owner.NextMedKitUse = self:GetNextCharge()
		return false
	end

	return self:GetNextCharge() <= CurTime() and (owner.NextMedKitUse or 0) <= CurTime()
end

if not CLIENT then return end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

local texGradDown = surface.GetTextureID("VGUI/gradient_down")
function SWEP:DrawHUD()
	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 32, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

	local timeleft = self:GetNextCharge() - CurTime()
	if 0 < timeleft then
		surface.SetDrawColor(5, 5, 5, 180)
		surface.DrawRect(x, y, wid, hei)

		surface.SetDrawColor(50, 255, 50, 180)
		surface.SetTexture(texGradDown)
		surface.DrawTexturedRect(x, y, math.min(1, timeleft / math.max(self.Primary.Delay, self.Primary.Delay * self.Secondary.DelayMul)) * wid, hei)

		surface.SetDrawColor(50, 255, 50, 180)
		surface.DrawOutlinedRect(x, y, wid, hei)
	end

	draw.SimpleText(self.PrintName, "ZSHUDFontSmall", x, texty, COLOR_GREEN, TEXT_ALIGN_LEFT)

	local charges = self:GetPrimaryAmmoCount()
	combo = self.Combo
		if combo > 0 then
			draw.SimpleText("Combo:"..combo, "ZSHUDFontSmall", x, texty * 0.95, COLOR_GREEN, TEXT_ALIGN_LEFT)
		end
	if charges > 0 then
		draw.SimpleText(charges, "ZSHUDFontSmall", x + wid, texty, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	else
		draw.SimpleText(charges, "ZSHUDFontSmall", x + wid, texty, COLOR_DARKRED, TEXT_ALIGN_RIGHT)
	end

	if GetConVar("crosshair"):GetInt() == 1 then
		self:DrawCrosshairDot()
	end
end

