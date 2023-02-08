AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = translate.Get("wep_m_heal")
SWEP.Description = translate.Get("wep_d_m_heal")

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
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

SWEP.Base = "weapon_zs_basemagic"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.ArmorRegen = 1

SWEP.Tier = 5
SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.71
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = true



function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if not self:CanPrimaryAttack() then return end
	if owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor() then
		for _, pl in pairs(ents.FindInSphere(owner:GetPos(), 120)) do
			if pl:IsPlayer() and pl:IsValidLivingHuman() and pl ~= owner then
				owner:HealPlayer(pl, 30 + owner:GetBloodArmor() - self.Primary.ArmorBleed)
				if SERVER then
					owner:SetBloodArmor(math.min(owner:GetBloodArmor() - self.Primary.ArmorBleed))
				end
			end
		end
	end

end
function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if not owner:IsSkillActive(SKILL_MAGIC) then return end
	
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() and self:GetReloadFinish() == 0 then
		if not owner:IsValid() then return end
		self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
		if SERVER then
		if owner:GetBloodArmor() < owner.MaxBloodArmor then
		owner:SetBloodArmor(math.min(owner:GetBloodArmor() + self.ArmorRegen) * (owner.MagicRegen or 1))
		local cursed = owner:GetStatus("cursed")
		if (cursed) then 
			owner:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() - 20)
		end
		end
		local healmax = (owner:IsSkillActive(SKILL_D_FRAIL) or owner:IsSkillActive(SKILL_ABUSE)) and math.floor(owner:GetMaxHealth() * 0.44) or owner:GetMaxHealth()
		if owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor() and owner:Health() < math.min(healmax, owner:GetMaxHealth() * 1) then
			owner:SetHealth(owner:Health() + self.Primary.ArmorBleed + (owner:Health() * 0.10))
			owner:SetBloodArmor(math.min(owner:GetBloodArmor() - self.Primary.ArmorBleed))
		end
	end
end

end


