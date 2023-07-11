local PANEL = {}

local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0, 0, 0, 240)
local oldh = 100
local oldh2 = 100
local oldb = 35
local math_Apr = math.Approach
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local surface_SetTexture = surface.SetTexture
local math_Clamp = math.Clamp
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_SetMaterial = surface.SetMaterial
local function ContentsPaint(self, w, h)
	local lp = MySelf
	if lp:IsValid() then
		local thealth =lp:Health()
		local gp = (((lp:GetZSRemortLevel() / 4) or 0) + (lp.AmuletPiece or 0)) < 0 and lp:Team() == TEAM_HUMAN
		local screenscale = BetterScreenScale()
		local health2 = 0
		local fast = false
		if oldh2 <= thealth - 50 or  oldh2 <= thealth + 500 or  oldh <= thealth -100 then
			fast = true
		end
		local sin = math.max(0,math.sin(CurTime() * 2))
		local health = math_Apr(oldh,math_Clamp(thealth, 1,lp:GetMaxHealthEx()),1.2 * (lp:Team() ~= TEAM_HUMAN and 20 or 1) * (fast and 40 or 1))
		local healthperc = math_Clamp(health / lp:GetMaxHealthEx(), 0, 1)
		
		local wid, hei = 300 * screenscale, 18 * screenscale
 
		colHealth.r = (lp:GetInfo("zs_rhealth") + healthperc) * 100
		colHealth.g = lp:GetInfo("zs_ghealth") - healthperc
		colHealth.b = lp:GetInfo("zs_bhealth")
		if GAMEMODE.RGB_HP then
			colHealth = HSVToColor(CurTime()*110 % 360, 1, 1)
		end 

		local x = 18 * screenscale
		local y = 115 * screenscale
		local subwidth = healthperc * wid
		if thealth > lp:GetMaxHealthEx() then
			health2 = " (+"..math.Round(math_Apr(oldh2,math.Round(thealth-lp:GetMaxHealthEx()),1.5* (fast and 40 or 1)))..")"
			oldh2 = math_Apr(oldh2,math.Round(thealth-lp:GetMaxHealthEx()),1.5* (fast and 40 or 1))
		end
		if lp:HasTrinket("curse_unknown") then
			health = lp:GetMaxHealthEx() * sin
			subwidth = wid * sin
		end
		local txt = math.Round(health)..(health2 ~= 0 and health2 or "")..(gp and " x"..((((lp:GetZSRemortLevel() / 4) or 0) + (lp.AmuletPiece or 0))-2)*-1 or "")
		draw.SimpleTextBlurry(txt, ((gp or string.len(txt)>= 10) and "ZSHUDFontSmall"or"ZSHUDFont"), x + wid + 18 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

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
		if GAMEMODE.RGB_HP then
			colHealth = HSVToColor(CurTime()*220 % 360, 1, 1)
		end
		local phantomwidth = healthperc * wid

		surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 40)
		surface_SetTexture(texDownEdge)
		surface_DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
		surface_DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		if gp then
			surface_SetDrawColor(255, 31, 206, 50)
			surface_SetTexture(texDownEdge)
			surface_DrawTexturedRect(x, y, wid, hei * 2)
			surface_SetDrawColor(194, 12, 155, 50)
			surface_DrawRect(x, y, wid, hei * 2)
		end
		oldh = math_Apr(oldh,math_Clamp(thealth, 0,lp:GetMaxHealthEx()),0.4 * (lp:Team() ~= TEAM_HUMAN and 20 or 1) * (fast and 40 or 1))
		if lp:Team() == TEAM_HUMAN then
			local bloodarmor = lp:GetBloodArmor()
			local max = (math.Round(lp.MaxBloodArmor) or 25)
			if bloodarmor > 0 then
				if lp:HasTrinket("curse_unknown") then
					bloodarmor = math.Round(max * sin)
					subwidth = math_Clamp(bloodarmor / max, 0, 1) * sin
				end
				x = 78 * screenscale
				y = 142 * screenscale
				wid, hei = 240 * screenscale, 14 * screenscale

				healthperc = math_Clamp(bloodarmor / max, 0, 1)
				colHealth.r = lp:GetInfo("zs_rblood") + healthperc * 2.5
				colHealth.g = lp:GetInfo("zs_gblood")
				colHealth.b = (lp:GetInfo("zs_bblood") - healthperc) * 50
				if GAMEMODE.RGB_HP then
					colHealth = HSVToColor(CurTime()*90 % 360, 1, 1)
				end

				subwidth = healthperc * wid
				draw.SimpleTextBlurry(bloodarmor.."/"..max, "ZSHUDFontSmall", x + wid + 12 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

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
		else
			local bloodarmor = lp:GetZArmor()
			if bloodarmor > 0 then
				x = 78 * screenscale
				y = 142 * screenscale
				wid, hei = 240 * screenscale, 14 * screenscale

				colHealth.r = 0
				colHealth.g = 0
				colHealth.b = 255
	
				if GAMEMODE.RGB_HP then
					colHealth = HSVToColor(CurTime()*120 % 360, 1, 1)
				end

				subwidth = wid

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
	end
end
local matGlow = Material("sprites/glow04_noz")
texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0, 0, 0, 240)
local function ContentsPaint2(self, w, h)
	local lp = MySelf
	if lp:IsValid() then
		local screenscale = BetterScreenScale()
		local health = math.max(lp:GetBloodArmor(), 0)
		local healthperc = math_Clamp(health / 100, 0, 1)
		local wid, hei = 100 * screenscale, 18 * screenscale
 
		colHealth.r = (lp:GetInfo("zs_rhealth") + healthperc) * 100
		colHealth.g = lp:GetInfo("zs_ghealth") - healthperc
		colHealth.b = lp:GetInfo("zs_bhealth")

		local x = 18 * screenscale
		local y = 65 * screenscale

		local subwidth = healthperc * wid
        if lp:GetActiveWeapon().IsMelee then
			draw.SimpleTextBlurry(health.."+"..(lp:GetActiveWeapon().IsMelee and lp:GetActiveWeapon().MeleeDamage * 0.25 or 0), "ZSHUDFontSmall", 8, self:GetTall() - 92, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		else
			draw.SimpleTextBlurry(health, "ZSHUDFontSmall", 8, self:GetTall() - 92, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
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
		local phantomwidth = (health == 100 and 0 or wid) * (lp:GetActiveWeapon().IsMelee and (lp:GetActiveWeapon().MeleeDamage/100) * 0.25 or 0)

		colHealth.r = 210
		colHealth.g = 120
		colHealth.b = 70
		
		surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 255)
		surface_SetTexture(texDownEdge)
		surface_DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		surface_SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
		surface_DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		colHealth.r = 100
		colHealth.g = 120
		colHealth.b = 70
		draw.SimpleTextBlurry(lp:Health(), "ZSHUDFont", 16, self:GetTall() - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
	end
end
function PANEL:Init()
	self:DockMargin(0, 0, 0, 0)
	self:DockPadding(0, 0, 0, 0)

	local contents = vgui.Create("Panel", self)
	contents:Dock(FILL)
	contents.Paint = ContentsPaint

	self:ParentToHUD()
	self:InvalidateLayout()
end

function PANEL:PerformLayout()
	local screenscale = BetterScreenScale()

	self:SetSize(screenscale * 500, screenscale * 168)

		--self.HealthModel:SetWide(screenscale * 120)

	self:AlignLeft()
	self:AlignBottom()
end

local matGradientLeft = CreateMaterial("gradient-l", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-l", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
function PANEL:Paint(w, h)
	local y = h * 0.6
	h = h - y

	surface_SetDrawColor(0, 0, 0, 180)
	surface_DrawRect(0, y, w * 0.4, h + 1)
	surface_SetMaterial(matGradientLeft)
	surface_DrawTexturedRect(w * 0.4, y, w * 0.6, h + 1)

	--surface.DrawLine(0, y, w, y)
	surface_SetDrawColor(0, 0, 0, 250)
	surface_SetMaterial(matGradientLeft)
	surface_DrawTexturedRect(0, y, w, 1)
--[[	local lp = LocalPlayer()
	if lp:IsValid() and !GAMEMODE.UseModelHealthBar then
		local health = math.max(lp:Health(), 0)
		local healthperc =  math_Clamp(health / lp:GetMaxHealthEx(), 0, 1)
		local barghost = lp:IsBarricadeGhosting()
		colHealth.r = (1 - healthperc) * 180
		colHealth.g = healthperc * 180
		colHealth.b = 0		
		local screenscale = BetterScreenScale()		
		local wid, hei = 24 * screenscale, 156 * screenscale

		local x = (self.HealthModel:GetWide() - wid - 16)

		local subhei = healthperc * hei
		if barghost then
			surface_SetDrawColor(60, 60, 255, 255)
			surface_DrawRect(x-5, 0, wid+10, hei)		
		end
		surface_SetDrawColor(0, 0, 0, 150)
		surface_DrawRect(x ,0, wid, hei)

		surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
		surface_SetTexture(texSideEdge)
		surface_DrawTexturedRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)
		surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 230)
		surface_DrawRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)

		surface_SetMaterial(matGlow)
		surface_SetDrawColor(255, 255, 255, 255)
		surface_DrawTexturedRect(x + 1 - wid/2 , hei-subhei+1, wid*2, 4)
		
		surface_SetDrawColor(60, 60, 60, 240)
		surface.DrawOutlinedRect(x-1, -1, wid+2, hei+2,3)
	end]]
	return true
end

vgui.Register("ZSHealthArea", PANEL, "Panel")
