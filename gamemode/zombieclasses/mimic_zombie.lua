CLASS.Base = "zombie"

CLASS.Name = "Mimic Zombie"
CLASS.TranslationName = "class_mimic_zombie"
CLASS.Description = "description_mimic_zombie"
CLASS.Help = "controls_mimic_zombie"


CLASS.Wave = 6 / 12

CLASS.Health = 500
CLASS.Speed = 210
CLASS.Revives = false
CLASS.Original = false
CLASS.Weight = 1
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio/2

CLASS.CanFeignDeath = false

CLASS.SWEP = "weapon_zs_zombie_mimic"

function CLASS:PlayPainSound(pl)
	pl:EmitSound("npc/zombie/zombie_pain"..math.random(6)..".wav", 75, math.random(87, 92))

	pl.NextPainSound = CurTime() + .5

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound("npc/zombie/zombie_die"..math.random(3)..".wav", 70, math.random(87, 92))

	return true
end

if SERVER then

function CLASS:ReviveCallback(pl, attacker, dmginfo)
	return false
end
function CLASS:OnSpawned(pl)
	pl:SetRenderMode(RENDERMODE_TRANSALPHA)
end

function CLASS:SwitchedAway(pl)
	pl:SetDTEntity(12,nil)
	pl:SetRenderMode(RENDERMODE_NORMAL)
end

end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(122, 44, 92)

local matSkin = Material("effects/flashlight/caustics")

function CLASS:PrePlayerDraw(pl)
	render.ModelMaterialOverride(matSkin)
	render.SetColorModulation(0.098, 0.584, 0.024)
end

function CLASS:PostPlayerDraw(pl)
	render.ModelMaterialOverride()
	render.SetColorModulation(1, 1, 1)
end
