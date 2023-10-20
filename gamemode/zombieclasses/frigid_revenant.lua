CLASS.Base = "shadow_walker"

CLASS.Name = "Frigid Revenant"
CLASS.TranslationName = "class_frigid_revenant"
CLASS.Description = "description_frigid_revenant"
CLASS.Help = "controls_frigid_revenant"

CLASS.SWEP = "weapon_zs_frigidrevenant"
CLASS.Original = false
CLASS.Variations = {}

CLASS.Wave = 4 / 6

CLASS.Health = 470
CLASS.Speed = 180

CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio

CLASS.ResistFrost = true

CLASS.Skeletal = true
if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
		if attacker:IsPlayer() and dmginfo:GetDamage() < 100 and inflictor.IsMelee and attacker ~= pl then
			attacker:GiveAchievement("niggerbruh")
		end
		pl.DeadZombied = nil
		pl.DeadXD = nil
		return true
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		local attacker = dmginfo:GetAttacker()
		if dmginfo:GetInflictor().IgnoreNiggers then
			dmginfo:SetDamage(math.min(dmginfo:GetDamage(),50))
		end
		if attacker and attacker ~= pl and dmginfo:GetInflictor() and dmginfo:GetInflictor().IsMelee and not dmginfo:GetInflictor().IgnoreNiggers then
			if attacker:IsValidLivingHuman() and !attacker:GetActiveWeapon().ResistDamage then
				attacker:TakeSpecialDamage(dmginfo:GetDamage() * 0.05, DMG_GENERIC, pl, pl)
				local cursed = attacker:GetStatus("cursed")
				if (cursed) then 
					attacker:AddCursed(pl, 5 + ((attacker:GetZSRemortLevel()+1) or 1)/6,nil,nil,true)
				else
					attacker:AddCursed(pl, 5+ ((attacker:GetZSRemortLevel()+1) or 1)/6)
				end
				if dmginfo:GetInflictor().OneTapDevo then
					local cursed = attacker:GetStatus("cursed")
					if (cursed) then 
						attacker:AddCursed(pl,  50 ,nil,nil,true)
					else
						attacker:AddCursed(pl, 50)
					end
				end
			end
			dmginfo:SetDamage(((attacker:IsValidLivingHuman() and attacker:IsSkillActive(SKILL_AMULET_12) or attacker:IsValidLivingHuman() and attacker:GetActiveWeapon().ResistDamage) and 0 or 5))
		end
		if dmginfo:GetDamage() >= pl:Health() and !pl.DeadZombied then
			pl.DeadZombied = true 
			pl.DeadXD = true
			timer.Simple(1.5, function() pl.DeadXD = nil end)
		end
		if pl.DeadXD then
			dmginfo:SetDamage(0)
		end
		return dmginfo
	end
end
if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/skeletal_walker"
CLASS.IconColor = Color(50, 90, 135)

local render_SetBlend = render.SetBlend
local render_SetColorModulation = render.SetColorModulation
local render_SetMaterial = render.SetMaterial
local render_DrawSprite = render.DrawSprite
local render_ModelMaterialOverride = render.ModelMaterialOverride
local angle_zero = angle_zero
local LocalToWorld = LocalToWorld

local colGlow = Color(200, 175, 255)
local matGlow = Material("sprites/glow04_noz")
local matBlack = CreateMaterial("shadowlurkersheet", "UnlitGeneric", {["$basetexture"] = "Tools/toolsblack", ["$model"] = 1})
local vecEyeLeft = Vector(5, -3.5, -1)
local vecEyeRight = Vector(5, -3.5, 1)

function CLASS:PrePlayerDraw(pl)
	render_SetBlend(0.85)
	render_SetColorModulation(0.6, 0.3, 0.8)
end

function CLASS:PostPlayerDraw(pl)
	render_SetBlend(1)
	render_SetColorModulation(1, 1, 1)
end

function CLASS:PrePlayerDrawOverrideModel(pl)
	render_ModelMaterialOverride(matBlack)
end

function CLASS:PostPlayerDrawOverrideModel(pl)
	render_ModelMaterialOverride(nil)

	if pl == MySelf and not pl:ShouldDrawLocalPlayer() or pl.SpawnProtection then return end

	local pos, ang = pl:GetBonePositionMatrixed(6)
	if pos then
		render_SetMaterial(matGlow)
		render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 10, 0.5, colGlow)
		render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 4, 4, colGlow)
		render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 10, 0.5, colGlow)
		render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 4, 4, colGlow)
	end
end
