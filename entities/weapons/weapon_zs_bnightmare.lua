AddCSLuaFile()

SWEP.PrintName = "Bloody Nightmare"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 21
SWEP.BleedDamage = 120
SWEP.SlowDownScale = 19
SWEP.MeleeDamageVsProps = 40
SWEP.EnfeebleDurationMul = 10 / SWEP.MeleeDamage
SWEP.NextBleed = 0

function SWEP:Reload()
	self:SecondaryAttack()
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/barnacle/barnacle_tongue_pull"..math.random(3)..".wav")
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav")
end

function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if SERVER and ent:IsPlayer() then 	
		if (ent:GetStatus("bleed")) then
			damage = damage * math.max(0.6, ent:GetStatus("bleed"):GetDamage()/33)
		end
	if ent:IsSkillActive(SKILL_CQARMOR) then self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage*3) return end
		local gt = ent:GiveStatus("enfeeble", damage * self.EnfeebleDurationMul)
		if gt and gt:IsValid() then
			gt.Applier = self:GetOwner()
		end

		if self.NextBleed%2 == 1 then
			local bleed = ent:GiveStatus("bleed")
			if bleed and bleed:IsValid() then
				bleed:AddDamage(self.BleedDamage)
				bleed.Damager = self:GetOwner()
			end
		end
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

local matSheet = Material("Models/Charple/Charple1_sheet")
function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSheet)
end
