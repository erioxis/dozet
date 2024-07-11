AddCSLuaFile()

SWEP.PrintName = "Ancient Nightmare"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 75
SWEP.SlowDownScale = 0.3

function SWEP:Reload()
	self:SecondaryAttack()
end
<<<<<<< Updated upstream
=======
function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:ApplyMeleeDamage(pl, trace, damage)
	if SERVER and pl:IsPlayer() and (not pl:GetStatus("hshield")) and pl:GetActiveWeapon() and !pl:GetActiveWeapon().ResistDamage then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then 
			pl:AddCursed(self:GetOwner(), cursed.DieTime - CurTime() + 50)
		end
		if (not cursed) then 
			pl:AddCursed(self:GetOwner(), 50)
		end
        
	end
	self.BaseClass.ApplyMeleeDamage(self, pl, trace, damage)
end
>>>>>>> Stashed changes

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/barnacle/barnacle_tongue_pull"..math.random(3)..".wav")
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav", 75, 85)
end

<<<<<<< Updated upstream
=======


>>>>>>> Stashed changes
if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

local matSheet = Material("Models/Charple/Charple1_sheet")
function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSheet)
end
