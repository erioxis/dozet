CLASS.Base = "freshdead"

CLASS.Name = "Omega Stoney"
CLASS.TranslationName = "class_o_stoney"
CLASS.Description = "description_o_stoney"
CLASS.Help = "controls_o_stoney"

CLASS.Boss = true
CLASS.Speed = 55
CLASS.Health = 2000
CLASS.Points = 35
CLASS.GigaTim = true
CLASS.Model = Model("models/player/kleiner.mdl")
CLASS.Stoney = true
CLASS.SWEP = "weapon_zs_megamasher_z"
CLASS.ElementalDebuff = 0
local bit_band = bit.band
if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
		return true
	end
	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() then
			if bit.band(dmginfo:GetDamageType(),(pl.LastDMGType or DMG_BULLET)) ~= 0 then
				dmginfo:SetDamage(dmginfo:GetDamage()*0.1)
			end
		end
	end
end

if not CLIENT then return end
local matSkin = Material("models/debug/debugwhite")
CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(110, 110, 110)

function CLASS:PrePlayerDraw(pl)
	if pl:GetActiveWeapon() and pl:GetActiveWeapon().IsSwinging and !pl:GetActiveWeapon():IsSwinging() then
		
		render.SetColorModulation(0.275, 0.275, 0.275)
		render.ModelMaterialOverride(matSkin)
	end
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end


