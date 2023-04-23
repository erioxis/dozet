AddCSLuaFile()

SWEP.PrintName = "Gore Blaster Zombie"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 23
SWEP.MeleeDamageVsProps = 32

SWEP.AlertDelay = 2.75

function SWEP:Reload()
	self:SecondaryAttack()
end
function SWEP:SecondaryAttack()
	if self:GetNextSecondaryFire() >= CurTime() then return end
	self.BaseClass.SecondaryAttack(self)
	if self:GetOwner():GetZombieClassTable().Magical and SERVER then
		local ented = {} -- * (!ent:IsPlayer() and 10 or 1)
		local taped = 1
		for _, ent in pairs(ents.FindInSphere(self:GetOwner():GetPos(), 76)) do
			if ent:IsValid() and ent ~= self:GetOwner() and !ented[ent] and taped <= 3 then
				ent:TakeDamage(self.MeleeDamage * 0.5 * taped, self:GetOwner(), self)
				ented[ent] = true
				taped = taped + 1
			end
		end
	end
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
		if ent:IsSkillActive(SKILL_MAGIC) then
			damage = damage * 6
		end
		if math.random(1,6) == 2 then
			ent:GiveStatus("portal",1)
		end
	end
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(0.129, 0.725, 0.906)
end
