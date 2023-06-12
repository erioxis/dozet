CLASS.Base = "zombie"

CLASS.Name = "Cosmic Zombie"
CLASS.TranslationName = "class_cosmic_zombie"
CLASS.Description = "description_cosmic_zombie"
CLASS.Help = "controls_cosmic_zombie"


CLASS.Wave = 4 / 12

CLASS.Health = 415
CLASS.Speed = 199
CLASS.Revives = false
CLASS.Original = false
CLASS.Weight = 1
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio/2

CLASS.SWEP = "weapon_zs_zombie_cosmic"

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
		dmginfo:ScaleDamage(0.1)
	elseif attacker == top[2] then
		dmginfo:ScaleDamage(0.25)
	else
		dmginfo:ScaleDamage(2)
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

CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(92, 76, 194)

local matSkin = Material("effects/flashlight/caustics")

function CLASS:PrePlayerDraw(pl)
	render.ModelMaterialOverride(matSkin)
	render.SetBlend(math.max(0.2,math.sin(CurTime()%8)*2))
	render.SetColorModulation(0.11, 0.278, 0.667)
end

function CLASS:PostPlayerDraw(pl)
	render.ModelMaterialOverride()
	render.SetBlend(1)
	render.SetColorModulation(1, 1, 1)
end
