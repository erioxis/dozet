AddCSLuaFile()

SWEP.PrintName = "Combine"

SWEP.Base = "weapon_zs_zombie"

if CLIENT then
	SWEP.ViewModelFOV = 39
	SWEP.ShowWorldModel = false
	SWEP.VElements = {

	}
	SWEP.WElements = {
		["zs_1"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-27.17, 0, 13.082), angle = Angle(-97.358, -180, 0), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = Model("models/weapons/v_pza.mdl")
SWEP.WorldModel = "models/weapons/w_shot_xm1014.mdl"

SWEP.MeleeReach = 78
SWEP.MeleeForceScale = 1.45
SWEP.MeleeSize = 4.5
SWEP.Primary.Delay = 1.35
SWEP.MeleeDamage = 38
SWEP.AlertDelay = 3.2

SWEP.SwingAnimSpeed = 0.58






function SWEP:PlayIdleSound()
	self:GetOwner():EmitSound("npc/combine_gunship/gunship_moan.wav", 70, math.random(85, 95))
end

SWEP.PlayAlertSound = SWEP.PlayIdleSound

function SWEP:PlayAttackSound()
	self:GetOwner():EmitSound("npc/antlion_guard/angry"..math.random(3)..".wav", 75, math.random(80, 85))
end





if not CLIENT then return end

function SWEP:ViewModelDrawn()
	render.SetColorModulation(1, 1, 1)
end

function SWEP:PreDrawViewModel(vm)
	render.SetColorModulation(1, 0.9, 0.6)
end
