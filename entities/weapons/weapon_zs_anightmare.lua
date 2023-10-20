AddCSLuaFile()

SWEP.PrintName = "Ancient Nightmare"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 55
SWEP.SlowDownScale = 0.3
SWEP.MeleeDamageVsProps = 33
SWEP.MeleeReach = 32

SWEP.m_IsStealthWeapon = true
SWEP.StealthMeterTick = 0.05
SWEP.LastStealthMeterCheck = 0

function SWEP:Reload()
	self:SecondaryAttack()
end
function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() and (not pl:GetStatus("hshield")) and pl:GetActiveWeapon() and !pl:GetActiveWeapon().ResistDamage and !pl:HasTrinket("toykasoul") and !pl:IsSkillActive(SKILL_ASAVE) then
		local killer = self:GetOwner()
		timer.Simple(0.15, function()
			pl:Kill()
		end)
        
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/barnacle/barnacle_tongue_pull"..math.random(3)..".wav")
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav", 75, 85)
end



if not CLIENT then return end
function SWEP:PreDrawViewModel(vm)
	self:GetOwner():CallZombieFunction0("PrePlayerDraw")
end

function SWEP:PostDrawViewModel(vm)
	self:GetOwner():CallZombieFunction0("PostPlayerDraw")
end
