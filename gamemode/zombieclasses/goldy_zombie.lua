CLASS.Base = "freshdead"

CLASS.Name = "Golden Zombie"
CLASS.TranslationName = "class_gd"
CLASS.Description = "description_gd"
CLASS.Help = "controls_gd"


CLASS.Health = 1000
CLASS.Points = 500

CLASS.UsePlayerModel = true
CLASS.SWEP = "weapon_zs_zgold"
CLASS.Hidden = true


if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() then
			dmginfo:SetDamage(math.min(dmginfo:GetDamage(),60))
		end
	end
	function CLASS:PostOnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
		pl:SetZombieClass(GAMEMODE.DefaultZombieClass)
	end

end

if not CLIENT then return end
local matSkin = Material("models/debug/debugwhite")
CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(231, 201, 31)

function CLASS:PrePlayerDraw(pl)
	render.SetColorModulation(0.722, 0.675, 0.055)
	render.ModelMaterialOverride(matSkin)
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end


