CLASS.Base = "freshdead"

CLASS.Name = "Zombie Dreams"
CLASS.TranslationName = "class_zdreams"
CLASS.Description = "description_zdreams"
CLASS.Help = "controls_zdreams"

CLASS.Wave = 2 / 12

CLASS.Health = 210
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio*0.55

CLASS.UsePlayerModel = true
CLASS.SWEP = "weapon_zs_zombie_dreams"
CLASS.Magical = false
CLASS.Original = false
CLASS.Variations = {"Zombie"}

if SERVER then
	local function DrBomb(pl, pos)
		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("explosion_dream", effectdata, true)
	end

	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
		if attacker ~= pl and not suicide then
			local pos = pl:LocalToWorld(pl:OBBCenter())

			pl:Gib(dmginfo)
			timer.Simple(0, function() DrBomb(pl, pos) end)

			return true
		end
	end
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() and dmginfo:GetInflictor().Magic then
			dmginfo:ScaleDamage(0.35)
		end
		return dmginfo
	end
end

if not CLIENT then return end
local render_SetBlend = render.SetBlend
local render_SetColorModulation = render.SetColorModulation
local render_SetMaterial = render.SetMaterial
local render_DrawSprite = render.DrawSprite
local render_ModelMaterialOverride = render.ModelMaterialOverride
local angle_zero = angle_zero
local LocalToWorld = LocalToWorld
CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(54, 193, 211)
local colGlow = Color(48, 0, 161)
local matGlow = Material("sprites/glow04_noz")
local matBlack = CreateMaterial("shadowlurkersheet", "UnlitGeneric", {["$basetexture"] = "Tools/toolsblack", ["$model"] = 1})
local vecEyeLeft = Vector(5, -3.5, -1)
local vecEyeRight = Vector(5, -3.5, 1)
function CLASS:PrePlayerDraw(pl)
	render.SetBlend(math.max(0.1,(CurTime()%10)/10))
	render.SetColorModulation(0.373, 0.3 + (CurTime()%7)*0.1, 0.914)
end

function CLASS:PostPlayerDraw(pl)
	render.SetBlend(1)
	render.SetColorModulation(1,1,1)
end
function CLASS:PostPlayerDrawOverrideModel(pl)
	render_ModelMaterialOverride(nil)

	if pl == MySelf and not pl:ShouldDrawLocalPlayer() or pl.SpawnProtection then return end

	local pos, ang = pl:GetBonePositionMatrixed(6)
	if pos then
		render_SetMaterial(matGlow)
		render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 12, 12, colGlow)
		render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 12, 12, colGlow)
	end
end

