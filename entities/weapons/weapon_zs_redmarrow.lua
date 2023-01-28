AddCSLuaFile()

if CLIENT then
	SWEP.PrintName = "Red Marrow"
end

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 55
SWEP.MeleeDamageShielded = 1700
SWEP.MeleeDelay = 0.74
SWEP.MeleeDamageVsProps = 43

function SWEP:MeleeHit(ent, trace, damage, forcescale)
	local owner = self:GetOwner()
	if ent:IsPlayer() and (not ent:GetStatus("hshield")) and ent:GetTimerBERS() < CurTime() and ent:HasTrinket("antibaracat") then
		ent:Kill()
	end
	if ent:IsPlayer() and owner:GetStatus("redmarrow") and !(ent:GetStatus("hshield")) and !owner.Zmainer then
		damage = self.MeleeDamageShielded
	end
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end
	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:Reload()
	self:SecondaryAttack()
end


function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/fast_zombie/fz_scream1.wav", 75, math.random(60,70), 0.5)
	self:GetOwner():EmitSound("npc/fast_zombie/fz_scream1.wav", 75, math.random(70,80), 0.5)
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:GetOwner():EmitSound("npc/combine_soldier/die"..math.random(1,3)..".wav", 75, math.random(70,75), 0.5)
	self:GetOwner():EmitSound("npc/combine_soldier/die"..math.random(1,3)..".wav", 75, math.random(78,90), 0.5)
end

if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

local matSheet = Material("Models/flesh")
function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSheet)
end
