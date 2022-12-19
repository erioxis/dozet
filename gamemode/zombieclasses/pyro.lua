CLASS.Base = "freshdead"

CLASS.Name = "Pyro"
CLASS.TranslationName = "class_pyro"
CLASS.Description = "description_pyro"
CLASS.Help = "controls_pyro"

CLASS.Wave = 3 / 12

CLASS.Health = 325
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio

CLASS.UsePlayerModel = true
CLASS.SWEP = "weapon_zs_zombie_pyro"
CLASS.FireBuff = true
CLASS.Original = false
CLASS.Variations = {"Zombie"}

if SERVER then
	function CLASS:OnKilled() end
end
if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() then
			if bit.band(dmginfo:GetDamageType(), DMG_BURN) ~= 0 then
				dmginfo:SetDamage(0)
			elseif bit.band(dmginfo:GetDamageType(), DMG_DROWN) ~= 0 then
				dmginfo:ScaleDamage(2)
			end
		end
	end
end

if not CLIENT then return end
local matSkin = Material("Models/Barnacle/barnacle_sheet")
CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(175, 73, 26)

function CLASS:PrePlayerDraw(pl)
	render.SetColorModulation(0.898, 1, 0, 0.795)
	render.ModelMaterialOverride(matSkin)
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()
end


