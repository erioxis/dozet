AddCSLuaFile()

SWEP.PrintName = "Gore Blaster Zombie"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 22
SWEP.BleedDamageMul = 20 / SWEP.MeleeDamage
SWEP.MeleeDamageVsProps = 21

SWEP.AlertDelay = 2.75

function SWEP:Reload()
	self:SecondaryAttack()
end

function SWEP:PlayAttackSound()
	self:EmitSound("npc/zombie/zo_attack"..math.random(2)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_alert"..math.random(3)..".wav", 70, math.random(87, 92))
end

function SWEP:PlayIdleSound()
	self:GetOwner():EmitSound("npc/zombie/zombie_voice_idle"..math.random(14)..".wav", 70, math.random(87, 92))
end

function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if SERVER and ent:IsPlayer() then
		local bleed = ent:GiveStatus("bleed")
		if bleed and bleed:IsValid() then
			bleed:AddDamage(damage * self.BleedDamageMul)
			bleed.Damager = self:GetOwner()
		end
		if ent:GetBloodArmor() >= 1 then
			ent:SetBloodArmor(ent:GetBloodArmor() * 0.5)
			self:GetOwner():SetHealth(self:GetOwner():Health() + ent:GetBloodArmor())
			self:GetOwner():SetZArmor(ent:GetBloodArmor() * 0.5 + self:GetOwner():GetZArmor())
			self.MeleeDamage = self.MeleeDamage + ent:GetBloodArmor() *0.2
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(1, 0, 0)
end
