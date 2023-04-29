CLASS.Base = "freshdead"

CLASS.Name = "Stoney"
CLASS.TranslationName = "class_stoney"
CLASS.Description = "description_stoney"
CLASS.Help = "controls_stoney"

CLASS.Wave = 6 / 12
CLASS.Speed = 40
CLASS.Health = 425
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio

CLASS.Model = Model("models/player/zombie_classic_hbfix.mdl")
CLASS.Stoney = true
CLASS.SWEP = "weapon_zs_zombie_s"
CLASS.Original = false
CLASS.Variations = {"Zombie"}
CLASS.ElementalDebuff = 0
if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
		return true
	end
	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() then
			if pl:GetActiveWeapon() and pl:GetActiveWeapon().IsSwinging and !pl:GetActiveWeapon():IsSwinging() then
				dmginfo:SetDamage(0)
			end
		end
		return dmginfo
	end
end

if not CLIENT then return end
local matSkin = Material("models/debug/debugwhite")
CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(175, 73, 26)

function CLASS:PrePlayerDraw(pl)
	if pl:GetActiveWeapon() and pl:GetActiveWeapon().IsSwinging and !pl:GetActiveWeapon():IsSwinging() then
		
		render.SetColorModulation(0.431, 0.431, 0.431)
		render.ModelMaterialOverride(matSkin)
	end
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end


