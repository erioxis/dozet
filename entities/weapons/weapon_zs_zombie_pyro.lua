AddCSLuaFile()

SWEP.PrintName = "Gore Blaster Zombie"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 12
SWEP.BurnDamageMul = 20 / SWEP.MeleeDamage
SWEP.MeleeDamageVsProps = 44

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
		local bleed = ent:GiveStatus("burn", 1)
		if bleed and bleed:IsValid() then
			bleed:AddDamage(damage * self.BurnDamageMul)
			bleed.Damager = self:GetOwner()
		end
		if ent:GetZombieClassTable().FireBuff then
			ent:Kill()
		end
	end
	if SERVER and !ent:IsPlayer() and math.random(1,9) == 3 then
		ent:Ignite(10)
		local attacker = self:GetOwner()
		for __, fire in pairs(ents.FindByClass("entityflame")) do
			if fire:IsValid() and fire:GetParent() == ent then
				fire:SetOwner(attacker)
				fire:SetPhysicsAttacker(attacker)
				fire.AttackerForward = attacker
			end
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(0.906, 0.773, 0.165)
end
