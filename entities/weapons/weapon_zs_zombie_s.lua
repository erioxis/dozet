AddCSLuaFile()

SWEP.PrintName = "Stoney)"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 32

SWEP.AlertDelay = 2.75

function SWEP:Reload()
	self:SecondaryAttack()
end
function SWEP:PrimaryAttack() 
	self.BaseClass.PrimaryAttack(self)
	self:GetOwner():ResetSpeed()
end
function SWEP:Swung()
	self.BaseClass.Swung(self)
	self:GetOwner():ResetSpeed()
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
local matSkin = Material("models/debug/debugwhite")
function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

function SWEP:PreDrawViewModel(vm)
	if !self:IsSwinging() then
		render.SetColorModulation(0.2, 0.2, 0.2)
		render.ModelMaterialOverride(matSkin)
	end
end
