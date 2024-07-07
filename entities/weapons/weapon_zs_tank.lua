AddCSLuaFile()

SWEP.PrintName = "Tank"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDamage = 44
SWEP.SlowDownScale = 0
SWEP.MeleeDamageVsProps = 34

SWEP.AlertDelay = 1

function SWEP:Reload()
	self:SecondaryAttack()
end


function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/combine_gunship/gunship_moan.wav", 75, math.random(70,75))
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:EmitSound("npc/antlion_guard/angry"..math.random(3)..".wav", 75, math.random(75,80))
end
function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	else
		ent:GiveStatus('stunned',3,self:GetOwner())
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end


if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.ModelMaterialOverride(0)
end

local matSheet = Material("Models/charple/charple4_sheet.vtf")
function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSheet)
end

