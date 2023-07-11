function GM:RenderScreenspaceEffects()
end
local math_Clamp = math.Clamp
local math_Round = math.Round
GM.PostProcessingEnabled = CreateClientConVar("zs_postprocessing", 1, true, false):GetBool()
cvars.AddChangeCallback("zs_postprocessing", function(cvar, oldvalue, newvalue)
	GAMEMODE.PostProcessingEnabled = tonumber(newvalue) == 1
end)

GM.FilmGrainEnabled = CreateClientConVar("zs_filmgrain", 1, true, false):GetBool()
cvars.AddChangeCallback("zs_filmgrain", function(cvar, oldvalue, newvalue)
	GAMEMODE.FilmGrainEnabled = tonumber(newvalue) == 1
end)

GM.FilmGrainOpacity = CreateClientConVar("zs_filmgrainopacity", 50, true, false):GetInt()
cvars.AddChangeCallback("zs_filmgrainopacity", function(cvar, oldvalue, newvalue)
	GAMEMODE.FilmGrainOpacity = math_Clamp(tonumber(newvalue) or 0, 0, 255)
end)

GM.ColorModEnabled = CreateClientConVar("zs_colormod", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_colormod", function(cvar, oldvalue, newvalue)
	GAMEMODE.ColorModEnabled = tonumber(newvalue) == 1
end)

GM.Auras = CreateClientConVar("zs_auras", 1, true, false):GetBool()
cvars.AddChangeCallback("zs_auras", function(cvar, oldvalue, newvalue)
	GAMEMODE.Auras = tonumber(newvalue) == 1
end)

GM.AuraColorEmpty = Color(CreateClientConVar("zs_auracolor_empty_r", 255, true, false):GetInt(), CreateClientConVar("zs_auracolor_empty_g", 0, true, false):GetInt(), CreateClientConVar("zs_auracolor_empty_b", 0, true, false):GetInt(), 255)
GM.AuraColorFull = Color(CreateClientConVar("zs_auracolor_full_r", 20, true, false):GetInt(), CreateClientConVar("zs_auracolor_full_g", 255, true, false):GetInt(), CreateClientConVar("zs_auracolor_full_b", 20, true, false):GetInt(), 255)

cvars.AddChangeCallback("zs_auracolor_empty_r", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorEmpty.r = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)

cvars.AddChangeCallback("zs_auracolor_empty_g", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorEmpty.g = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)

cvars.AddChangeCallback("zs_auracolor_empty_b", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorEmpty.b = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)

cvars.AddChangeCallback("zs_auracolor_full_r", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorFull.r = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)

cvars.AddChangeCallback("zs_auracolor_full_g", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorFull.g = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)

cvars.AddChangeCallback("zs_auracolor_full_b", function(cvar, oldvalue, newvalue)
	GAMEMODE.AuraColorFull.b = math_Clamp(math.ceil(tonumber(newvalue) or 0), 0, 255)
end)


local DrawColorModify = DrawColorModify
local DrawSharpen = DrawSharpen
local EyePos = EyePos
local TEAM_HUMAN = TEAM_HUMAN
local TEAM_UNDEAD = TEAM_UNDEAD
local render_SetMaterial = render.SetMaterial
local render_DrawSprite = render.DrawSprite
local render_SetLightingMode = render.SetLightingMode
local math_Approach = math.Approach
local FrameTime = FrameTime
local CurTime = CurTime
local math_sin = math.sin
local math_min = math.min
local math_max = math.max
local math_abs = math.abs
local team_GetPlayers = team.GetPlayers

local FullBright = false

local tColorModDead = {
	["$pp_colour_contrast"] = 1.25,
	["$pp_colour_colour"] = 0,
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = -0.02,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local tColorModHuman = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 1,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local tColorModZombie = {
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1.25,
	["$pp_colour_colour"] = 0.5,
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}

local tColorModZombieVision = {
	["$pp_colour_colour"] = 1,
	["$pp_colour_brightness"] = -0.1,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_mulr"]	= 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0,
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,02,
	["$pp_colour_addb"] = 0
}

local tColorModNightVision = {
	["$pp_colour_colour"] = 0.99,
	["$pp_colour_brightness"] = -0.34,
	["$pp_colour_contrast"] = 1.46,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 1,
	["$pp_colour_mulb"] = 0,
	["$pp_colour_addr"] = 0.3,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0
}
local tColorModBers = {
	["$pp_colour_colour"] = 0.99,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1.5,
	["$pp_colour_mulr"] = 1.5,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0,
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0.2
}

local redview = 0
local fear = 0
function GM:_RenderScreenspaceEffects()
	if MySelf.Confusion and MySelf.Confusion:IsValid() then
		MySelf.Confusion:RenderScreenSpaceEffects()
	end

	fear = math_Approach(fear, self:CachedFearPower(), FrameTime())
	local bers = MySelf:GetTimerBERS()
	if bers >= CurTime() and MySelf:IsSkillActive(SKILL_BERSERK) then
		tColorModBers["$pp_colour_addr"] = (0.015 + math_abs(math_sin(CurTime() * 2)) * 0.09) * ((bers - CurTime())/10)
		tColorModBers["$pp_colour_brightness"] = math_min(((bers - CurTime())/10) - 0.3,0.32)
		DrawColorModify(tColorModBers)
	end
	if not self.PostProcessingEnabled then return end

	if self.DrawPainFlash and self.HurtEffect > 0 then
		DrawSharpen(1, math_min(6, self.HurtEffect * 3))
	end


	if self.ColorModEnabled then
		if not MySelf:Alive() and MySelf:GetObserverMode() ~= OBS_MODE_CHASE then
			if not MySelf:HasWon() then
				tColorModDead["$pp_colour_colour"] = (1 - math_min(1, CurTime() - self.LastTimeAlive)) * 0.5
				DrawColorModify(tColorModDead)
			end
		elseif MySelf:Team() == TEAM_UNDEAD then
			if self.m_ZombieVision then
				DrawColorModify(tColorModZombieVision)
			else
				tColorModZombie["$pp_colour_colour"] = math_min(1, 0.25 + math_min(1, (CurTime() - self.LastTimeDead) * 0.5) * 1.75 * fear)

				DrawColorModify(tColorModZombie)
			end
		else
			if self.m_NightVision then
				DrawColorModify(tColorModNightVision)
			else
				local curr = tColorModHuman["$pp_colour_addr"]
				local health = MySelf:Health()
				local maxhealth = MySelf:GetMaxHealth() / 3
				if health <= maxhealth then
					redview = math_Approach(redview, 1 - health / maxhealth, FrameTime() * 0.2)
				elseif 0 < curr then
					redview = math_Approach(redview, 0, FrameTime() * 0.2)
				end

				tColorModHuman["$pp_colour_addr"] = redview * (0.035 + math_abs(math_sin(CurTime() * 2)) * 0.14)
				tColorModHuman["$pp_colour_brightness"] = fear * -0.045
				tColorModHuman["$pp_colour_contrast"] = 1 + fear * 0.15
				tColorModHuman["$pp_colour_colour"] = 1 - fear * 0.725 --0.85

				DrawColorModify(tColorModHuman)
			end
		end
	end
end

function GM:_RenderScene()
	if (self.m_ZombieVision and MySelf:Team() == TEAM_UNDEAD) or (self.m_NightVision and MySelf:Team() == TEAM_HUMAN and not MySelf:GetStatus("dimvision")) then
		render_SetLightingMode(1)
		FullBright = true
	else
		FullBright = false
	end
end

function GM:FullBrightOn()
	if FullBright then
		render_SetLightingMode(1)
	end
end

function GM:FullBrightOff()
	if FullBright then
		render_SetLightingMode(0)
	end
end

hook.Add("PreDrawOpaqueRenderables", "ZFullBright", GM.FullBrightOff)
hook.Add("PreDrawTranslucentRenderables", "ZFullBright", GM.FullBrightOff)
hook.Add("PostDrawTranslucentRenderables", "ZFullBright", GM.FullBrightOn)
hook.Add("PreDrawViewModel", "ZFullBright", GM.FullBrightOff)
hook.Add("RenderScreenspaceEffects", "ZFullBright", GM.FullBrightOff)
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local surface_SetTexture = surface.SetTexture
local surface_SetMaterial = surface.SetMaterial
local surface_DrawTexturedRect = surface.DrawTexturedRect

local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
function GM:DrawInductorIndicators()
	local x = ScrW() * 0.45
	local y = ScrH() * 0.05
	--local base = ScrH() * 0.07

	local lp = MySelf
	if lp:IsValid() then
		local medp = lp:GetProgress('mprog')
		local fired =lp:GetProgress('fprog')
		local pulsed =lp:GetProgress('pprog')
		local bountyd =lp:GetProgress('bprog')
		local icep =lp:GetProgress('iprog')
		local cham =lp:GetProgress('cprog')
		local resnyad =lp:GetProgress('rprog')
	
		local medt = lp:GetPTime('mprog')
		local firet =lp:GetPTime('fprog')
		local pulset =lp:GetPTime('pprog')
		local bountyt =lp:GetPTime('bprog')
		local icet =lp:GetPTime('iprog')
		local chamt =lp:GetPTime('cprog')
		local resnyat =lp:GetPTime('rprog')
		if cham > 0 and chamt >= CurTime() then
			local colHealth = Color(247,229,132)
			local screenscale = BetterScreenScale()
			local health = cham
			local formula = 350* (lp:GetIndChance() or 1)
			local healthperc = math_Clamp(health / formula, 0.01, 1)

			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (chamt-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry(translate.Get("cham_hud")..math_Round(cham).."/"..math_Round(formula) , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
		if fired > 0 and lp:HasTrinket("fire_ind") and firet >= CurTime() then
			local colHealth = lp.HoleOfHell  and Color(65,12,2) or Color(226,62,33)
			local screenscale = BetterScreenScale()
			local health = fired
			local formula = 15 * ((lp:GetActiveWeapon() and (lp:GetActiveWeapon().Tier or 1))+1)
			local formula = formula * (lp:GetIndChance() or 1)
			local healthperc = math_Clamp(health / formula, 0.01, 1)

			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (firet-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry((lp.HoleOfHell and translate.Get("hell_hud") or translate.Get("fi_hud"))..math_Round(fired).."/"..math_Round(formula) , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
		if lp:GetProgress('mprog') > 0 and lp:IsSkillActive(SKILL_PREMIUM) and medt >= CurTime() then

			local colHealth = Color(33,226,43)
			local screenscale = BetterScreenScale()
			local medprogress = 1800
			local healthperc = math_Clamp(medp / medprogress, 0.01, 1)
			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (medt-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry(translate.Get("mg_hud")..math_Round(medp).."/"..medprogress , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
		if icep > 0 and icet >= CurTime() then

			local colHealth = Color(21,213,226)
			local screenscale = BetterScreenScale()
			local health = icep
			local progress = 165 + (35 * ((lp:GetActiveWeapon() and (lp:GetActiveWeapon().Tier or 1))-1) * (lp:GetActiveWeapon().Tier or 1)) * (lp:GetIndChance() or 1)
			local progress = progress * (lp:GetIndChance() or 1)
			local healthperc = math_Clamp(health / progress, 0.01, 1)
			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (icet-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry(translate.Get("ii_hud")..math_Round(icep).."/"..math_Round(progress) , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
		if pulsed > 0 and lp:HasTrinket("resonance") and pulset >= CurTime() then

			local colHealth = lp:IsSkillActive(SKILL_CRYO_LASER) and Color(27,105,207) or Color(61,5,192)
			local screenscale = BetterScreenScale()
			local health = pulsed
			local progress = 20 * GAMEMODE:GetWave() * (lp:GetIndChance() or 1)
			local healthperc = math_Clamp(health / progress, 0.01, 1)
			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (pulset-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry((lp:IsSkillActive(SKILL_CRYO_LASER) and translate.Get("ca_hud") or translate.Get("pc_hud"))..math_Round(pulsed).."/"..math_Round(progress) , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07

		end
		if bountyd > 0 and bountyt >= CurTime() then

			local colHealth = Color(97,255,24)
			local screenscale = BetterScreenScale()
			local health = bountyd
			local progress = 1500 * (MySelf:GetProgress('bprogmul')+1)
			local healthperc = math_Clamp(health / progress, 0.01, 1)
			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (bountyt-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry(translate.Get("bp_hud")..math_Round(bountyd).."/"..progress , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
		if resnyad > 0 and resnyat >= CurTime() then

			local colHealth = Color(145,9,9)
			local screenscale = BetterScreenScale()
			local health = resnyad
			local progress = 1000
			local healthperc = math_Clamp(health / progress, 0.01, 1)
			local wid, hei = 150 * screenscale, 20 * screenscale
	 
			
	
			local subwidth = healthperc * wid
			local fraction = (resnyat-CurTime())/2
			local form = math_Clamp( fraction, 0, 1 )
			colHealth.a = form *255
			surface_SetDrawColor(0, 0, 0, colHealth.a)
			surface_DrawRect(x, y, wid, hei)

			
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface_SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, colHealth.a)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
			draw.SimpleTextBlurry(translate.Get("resnya_hud")..math_Round(resnyad).."/"..progress , "ZSHUDFontTiny", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			y = y + ScrH() * 0.07
		end
	end
end
local matGlow = Material("Sprites/light_glow02_add_noz")
local colHealthEmpty = GM.AuraColorEmpty
local colHealthFull = GM.AuraColorFull
local colHealth = Color(255, 255, 255)
function GM:DrawHumanIndicators()
	if MySelf:Team() ~= TEAM_UNDEAD or not self.Auras or self.m_ZombieVision then return end

	local eyepos = EyePos()
	local range, dist, healthfrac, pos, size
	for _, pl in pairs(team_GetPlayers(TEAM_HUMAN)) do
		range = pl:GetAuraRangeSqr()
		dist = pl:GetPos():DistToSqr(eyepos)
		if pl:Alive() and dist <= range and (not pl:GetDTBool(DT_PLAYER_BOOL_NECRO) or dist >= 27500) then
			healthfrac = math_max(pl:Health(), 0) / pl:GetMaxHealth()
			colHealth.r = math_Approach(colHealthEmpty.r, colHealthFull.r, math_abs(colHealthEmpty.r - colHealthFull.r) * healthfrac)
			colHealth.g = math_Approach(colHealthEmpty.g, colHealthFull.g, math_abs(colHealthEmpty.g - colHealthFull.g) * healthfrac)
			colHealth.b = math_Approach(colHealthEmpty.b, colHealthFull.b, math_abs(colHealthEmpty.b - colHealthFull.b) * healthfrac)

			pos = pl:WorldSpaceCenter()

			render_SetMaterial(matGlow)
			render_DrawSprite(pos, 13, 13, colHealth)
			size = math_sin(self.HeartBeatTime + pl:EntIndex()) * 50 - 21
			if size > 0 then
				render_DrawSprite(pos, size * 1.5, size, colHealth)
				render_DrawSprite(pos, size, size * 1.5, colHealth)
			end
		end
	end
end
function GM:DrawZombieIndicators()
	if MySelf:Team() ~= TEAM_HUMAN or not (MySelf:IsSkillActive(SKILL_SEEAURA) or (MySelf:GetStatus("world"))) or MySelf:KeyDown(IN_SPEED) then return end
	local world = ((MySelf:GetStatus("world")) or MySelf:HasTrinket("broken_world"))
	local matGlow = Material("sprites/glow04_noz")
	local texDownEdge = surface.GetTextureID("gui/gradient_down")
	local colHealth = Color(0, 0, 0, 240)
	local eyepos = EyePos()
	local range, dist, healthfrac, pos, size
	for _, pl in pairs(team_GetPlayers(TEAM_UNDEAD)) do
		if pl:GetStatus("feigndeath") then continue end
		range = pl:GetAuraRangeSqr()/4 * (MySelf:IsSkillActive(SKILL_OLD_GOD2) and 2.5 or 1)
		dist = pl:GetPos():DistToSqr(eyepos)
		if pl:GetRenderMode() == RENDERMODE_TRANSALPHA then continue end
		local lp = pl
		if pl:Alive() and dist <= range then
			healthfrac = math_max(pl:Health(), 0) / pl:GetMaxHealth()
			colHealth.r = math_Approach(colHealthEmpty.r, colHealthFull.r, math_abs(colHealthEmpty.r - colHealthFull.r) * healthfrac)
			colHealth.g = math_Approach(colHealthEmpty.g, colHealthFull.g, math_abs(colHealthEmpty.g - colHealthFull.g) * healthfrac)
			colHealth.b = math_Approach(colHealthEmpty.b, colHealthFull.b, math_abs(colHealthEmpty.b - colHealthFull.b) * healthfrac)

			pos = pl:WorldSpaceCenter()

		local hcolor = COLOR_WHITE
		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		local nearest = pl:WorldSpaceCenter()
		local norm = nearest - eyepos
		norm:Normalize()
		local dot = EyeVector():Dot(norm)
		local dotsq = dot * dot
		local vis = math_Clamp((dotsq * dotsq) - 0.1, 0, 1)
		local wid, hei = 150, 6
		local x, y = wid * -0.5 + 2, 0
				cam.IgnoreZ(true)
				cam.Start3D2D(nearest, ang, 0.1)
				local screenscale = BetterScreenScale()
				local health = lp:Health()
				local healthperc = math_Clamp(health / lp:GetMaxHealthEx(), 0, 1)
				local wid, hei = 300 * screenscale, 18 * screenscale
		 
				colHealth.r = (lp:GetInfo("zs_rhealth") + healthperc) * 100
				colHealth.g = lp:GetInfo("zs_ghealth") - healthperc
				colHealth.b = lp:GetInfo("zs_bhealth")
		
				local x = -16 * screenscale
				local y = 115 * screenscale
		
				local subwidth = healthperc * wid
		
				draw.SimpleTextBlurry(health.."|"..pl:GetMaxHealth(), "ZSHUDFont", x * screenscale, y - 36 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				if world then
					draw.SimpleTextBlurry(lp:GetName(), "ZSHUDFont", x * screenscale, y - 96 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				end
		
				surface_SetDrawColor(0, 0, 0, 230)
				surface_DrawRect(x, y, wid, hei)
		
				surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
				surface_SetTexture(texDownEdge)
				surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
				surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
				surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
		
				surface_SetMaterial(matGlow)
				surface_SetDrawColor(255, 255, 255, 255)
				surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
		
				local phantomhealth = math.max(lp:GetPhantomHealth(), 0)
				healthperc = math_Clamp(phantomhealth / lp:GetMaxHealthEx(), 0, 1)
		
				colHealth.r = 100
				colHealth.g = 50
				colHealth.b = 70
				local phantomwidth = healthperc * wid
		
				surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 40)
				surface_SetTexture(texDownEdge)
				surface_DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
				surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
				surface_DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
						y = y + hei + 3
						hei = 8
						x = wid * -0.5 + 2
		                if pl:GetZombieClassTable().Boss then
							draw.SimpleText("BOSS", "ZSHUDFontBig", x + 55, y - 150, COLOR_CYAN, TEXT_ALIGN_CENTER)
						end
						if MySelf:IsSkillActive(SKILL_MORE_INFO) then
							y = y + 30
							draw.SimpleText(translate.Get(pl:GetZombieClassTable().TranslationName), "ZSHUDFontBig", x + 55, y - 250, COLOR_CYAN, TEXT_ALIGN_CENTER)
							local bloodarmor = lp:GetZArmor()
							if bloodarmor > 0 then
								x = 78 * screenscale
								y = 142 * screenscale
								wid, hei = 240 * screenscale, 14 * screenscale
				
								colHealth.r = 0
								colHealth.g = 0
								colHealth.b = 255
								healthperc = 1
				
								subwidth = healthperc * wid
				
								draw.SimpleTextBlurry(bloodarmor, "ZSHUDFontSmall", x + wid + 12 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
				
								surface_SetDrawColor(0, 0, 0, 230)
								surface_DrawRect(x, y, wid, hei)
				
								surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
								surface_SetTexture(texDownEdge)
								surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
								surface_SetDrawColor(colHealth.r * 0.5, colHealth.g * 0.5, colHealth.b, 30)
								surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
				
								surface_SetMaterial(matGlow)
								surface_SetDrawColor(255, 255, 255, 255)
								surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
							end
						end
							
				cam.End3D2D()
				cam.IgnoreZ(false)
		

			render_SetMaterial(matGlow)
			render_DrawSprite(pos, 13, 13, colHealth)
			size = math_sin(self.HeartBeatTime + pl:EntIndex()) * 50 - 21
			if size > 0 then
				render_DrawSprite(pos, size * 1.5, size, colHealth)
				render_DrawSprite(pos, size, size * 1.5, colHealth)
			end
		end
	end
end

function GM:ToggleZombieVision(onoff)
	if onoff == nil then
		onoff = not self.m_ZombieVision
	end

	if onoff then
		if not self.m_ZombieVision then
			self.m_ZombieVision = true
			MySelf:EmitSound("npc/stalker/breathing3.wav", 0, 230)
		end
	elseif self.m_ZombieVision then
		self.m_ZombieVision = nil
		MySelf:EmitSound("npc/zombie/zombie_pain6.wav", 0, 110)
	end
end

local CModWhiteOut = {
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 1,
	["$pp_colour_mulr"] = 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0
}
local WhiteOutEnd
local WhiteOutFadeTime
local function RenderWhiteOut()
	local dt = math_max(WhiteOutEnd - CurTime(), 0) / WhiteOutFadeTime
	if dt <= 0 then
		WhiteOutEnd = nil
		WhiteOutFadeTime = nil
		hook.Remove("RenderScreenspaceEffects", "WhiteOut")
	else
		local size = 5 + dt * 10
		CModWhiteOut["$pp_colour_brightness"] = dt ^ 2
		DrawBloom(1 - dt, dt * 3, size, size, 1, 1, 1, 1, 1)
		DrawColorModify(CModWhiteOut)
	end
end

function util.WhiteOut(time, fadeouttime)
	time = time or 1

	WhiteOutEnd = math_max(CurTime() + time, WhiteOutEnd or 0)
	WhiteOutFadeTime = math_max(fadeouttime or time, WhiteOutFadeTime or 0)

	hook.Add("RenderScreenspaceEffects", "WhiteOut", RenderWhiteOut)
end


local CModBlackOut = {
	["$pp_colour_addr"] = 1,
	["$pp_colour_addg"] = 1,
	["$pp_colour_addb"] = 1,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_colour"] = 0,
	["$pp_colour_mulr"] = 255,
	["$pp_colour_mulg"] = 255,
	["$pp_colour_mulb"] = 255
}
local BlackOutEnd
local BlackOutFadeTime
local function RenderBlackOut()
	local dt = math_max(BlackOutEnd - CurTime(), 0) / BlackOutFadeTime
	if dt <= 0 then
		BlackOutEnd = nil
		BlackOutFadeTime = nil
		hook.Remove("RenderScreenspaceEffects", "BlackOut")
	else
		local size = 5 + dt * 10
		CModBlackOut["$pp_colour_contrast"] = dt ^ 2
		DrawBloom(1 - dt, dt * 3, size, size, 1, 1, 1, 1, 1)
		CModBlackOut["$pp_colour_mulr"] = dt ^ 2
		CModBlackOut["$pp_colour_mulg"] = dt ^ 3
		CModBlackOut["$pp_colour_mulb"] = dt  / 2
		DrawColorModify(CModBlackOut)
	end
end

function util.BlackOut(time, fadeouttime)
	time = time or 1

	BlackOutEnd = math_max(CurTime() + time, BlackOutEnd or 0)
	BlackOutFadeTime = math_max(fadeouttime or time, BlackOutFadeTime or 0)

	hook.Add("RenderScreenspaceEffects", "BlackOut", RenderBlackOut)
end

