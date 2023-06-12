AddCSLuaFile()

SWEP.PrintName = "Cosmic Zombie"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 36


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


if not CLIENT then return end
local matMat = Material( "effects/flashlight/caustics" )
function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride( nil )
	render.SetColorModulation(1, 1, 1)
end

function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride( matMat )
	render.SetColorModulation(0.506, 0.325, 0.871)
end
