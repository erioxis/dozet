CLASS.Base = "fast_headcrab"

CLASS.Name = "Cosmic Headcrab"
CLASS.TranslationName = "class_bloodsucker_cosmo"
CLASS.Description = "description_bloodsucker_cosmo"
CLASS.Help = "controls_bloodsucker_cosmo"

CLASS.Wave = 3 / 6

CLASS.Model = Model("models/headcrab.mdl")
CLASS.Variations = {}
CLASS.Original = false
CLASS.SWEP = "weapon_zs_bloodsucker_headcrab"

CLASS.Health = 120

CLASS.DynamicHealth = 0.3

CLASS.Points = CLASS.Health/GM.HeadcrabZombiePointRatio*2
if SERVER then

	local function compare(a,b)
		return a > b
	end
	function CLASS:ProcessDamage(pl, dmginfo)
		if #player.GetHumans() < 5 then return false end
		local top = {}
		for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
			if v and v:IsValid() then
				top[#top+1] = v:GetMScore()
			end
		end
		table.sort(top,compare)
		local attacker = dmginfo:GetAttacker():GetMScore() 
		if attacker == top[1] then
			dmginfo:ScaleDamage(0)
		elseif attacker == top[2] then
			dmginfo:ScaleDamage(0.15)
		else
			dmginfo:ScaleDamage(1.35)
		end
		return dmginfo
	end
	function CLASS:OnSpawned(pl)
		pl:SetRenderMode(RENDERMODE_TRANSALPHA)
	end

	function CLASS:SwitchedAway(pl)
		pl:SetRenderMode(RENDERMODE_NORMAL)
	end

	
end
if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/fastheadcrab"
CLASS.IconColor = Color(100, 106, 175)

local matSkin = Material("effects/flashlight/caustics")
function CLASS:PrePlayerDraw(pl)
	render.ModelMaterialOverride(matSkin)
	render.SetBlend(math.max(0.2,math.sin(CurTime()%4)*2))
	render.SetColorModulation(0.259, 0.753, 0.98)
end

function CLASS:PostPlayerDraw(pl)
	render.ModelMaterialOverride()
	render.SetBlend(1)
	render.SetColorModulation(1, 1, 1)
end
