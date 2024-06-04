AddCSLuaFile()

SWEP.PrintName = "Gold Zombus"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 60

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


function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if SERVER and ent:IsValidLivingHuman() then
		for k,v in pairs(ent:GetInventoryItems()) do
			if GAMEMODE:GetInventoryItemType(k) == INVCAT_ETERNAL then continue end
			ent:TakeInventoryItem(k)
			ent:AddInventoryItem("trinket_sin_ego")
		end
		ent:TakePoints(100)
		ent:AddZSXP(-200)
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
