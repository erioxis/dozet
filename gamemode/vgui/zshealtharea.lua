local PANEL = {}

local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0, 0, 0, 240)
local function ContentsPaint(self, w, h)
	local lp = MySelf
	if lp:IsValid() then
		local gp = (((lp:GetZSRemortLevel() / 4) or 0) + (lp.AmuletPiece or 0)) < 0 and lp:Team() == TEAM_HUMAN
		local screenscale = BetterScreenScale()
		local health = lp:Health()
		local healthperc = math.Clamp(health / lp:GetMaxHealthEx(), 0, 1)
		local wid, hei = 300 * screenscale, 18 * screenscale
 
		colHealth.r = (lp:GetInfo("zs_rhealth") + healthperc) * 100
		colHealth.g = lp:GetInfo("zs_ghealth") - healthperc
		colHealth.b = lp:GetInfo("zs_bhealth")

		local x = 18 * screenscale
		local y = 115 * screenscale

		local subwidth = healthperc * wid
		if health > lp:GetMaxHealthEx() then
			health = lp:GetMaxHealthEx().." (+"..health-lp:GetMaxHealthEx()..")"
		end
		draw.SimpleTextBlurry(health..(gp and " x"..((((lp:GetZSRemortLevel() / 4) or 0) + (lp.AmuletPiece or 0))-2)*-1 or ""), ((gp or string.len(health) >= 13) and "ZSHUDFontSmall"or"ZSHUDFont"), x + wid + 18 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

		surface.SetDrawColor(0, 0, 0, 230)
		surface.DrawRect(x, y, wid, hei)

		surface.SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
		surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

		surface.SetMaterial(matGlow)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)

		local phantomhealth = math.max(lp:GetPhantomHealth(), 0)
		healthperc = math.Clamp(phantomhealth / lp:GetMaxHealthEx(), 0, 1)

		colHealth.r = 100
		colHealth.g = 50
		colHealth.b = 70
		local phantomwidth = healthperc * wid

		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 40)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
		surface.DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		if gp then
			surface.SetDrawColor(255, 31, 206, 50)
			surface.SetTexture(texDownEdge)
			surface.DrawTexturedRect(x, y, wid, hei * 2)
			surface.SetDrawColor(194, 12, 155, 50)
			surface.DrawRect(x, y, wid, hei * 2)
		end

		if lp:Team() == TEAM_HUMAN then
			local bloodarmor = lp:GetBloodArmor()
			if bloodarmor > 0 then
				x = 78 * screenscale
				y = 142 * screenscale
				wid, hei = 240 * screenscale, 14 * screenscale

				healthperc = math.Clamp(bloodarmor / (math.Round(lp.MaxBloodArmor) or 25), 0, 1)
				colHealth.r = lp:GetInfo("zs_rblood") + healthperc * 2.5
				colHealth.g = lp:GetInfo("zs_gblood")
				colHealth.b = (lp:GetInfo("zs_bblood") - healthperc) * 50

				subwidth = healthperc * wid

				draw.SimpleTextBlurry(bloodarmor.."/"..math.Round(lp.MaxBloodArmor), "ZSHUDFontSmall", x + wid + 12 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				surface.SetDrawColor(0, 0, 0, 230)
				surface.DrawRect(x, y, wid, hei)

				surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
				surface.SetTexture(texDownEdge)
				surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
				surface.SetDrawColor(colHealth.r * 0.5, colHealth.g * 0.5, colHealth.b, 30)
				surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

				surface.SetMaterial(matGlow)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
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
				healthperc = 1

				subwidth = healthperc * wid

				draw.SimpleTextBlurry(bloodarmor, "ZSHUDFontSmall", x + wid + 12 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

				surface.SetDrawColor(0, 0, 0, 230)
				surface.DrawRect(x, y, wid, hei)

				surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
				surface.SetTexture(texDownEdge)
				surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
				surface.SetDrawColor(colHealth.r * 0.5, colHealth.g * 0.5, colHealth.b, 30)
				surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

				surface.SetMaterial(matGlow)
				surface.SetDrawColor(255, 255, 255, 255)
				surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
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
		local healthperc = math.Clamp(health / 100, 0, 1)
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

		surface.SetDrawColor(0, 0, 0, 230)
		surface.DrawRect(x, y, wid, hei)

		surface.SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
		surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

		surface.SetMaterial(matGlow)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
		local phantomwidth = (health == 100 and 0 or wid) * (lp:GetActiveWeapon().IsMelee and (lp:GetActiveWeapon().MeleeDamage/100) * 0.25 or 0)

		colHealth.r = 210
		colHealth.g = 120
		colHealth.b = 70
		
		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 255)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
		surface.DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
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

	surface.SetDrawColor(0, 0, 0, 180)
	surface.DrawRect(0, y, w * 0.4, h + 1)
	surface.SetMaterial(matGradientLeft)
	surface.DrawTexturedRect(w * 0.4, y, w * 0.6, h + 1)

	--surface.DrawLine(0, y, w, y)
	surface.SetDrawColor(0, 0, 0, 250)
	surface.SetMaterial(matGradientLeft)
	surface.DrawTexturedRect(0, y, w, 1)
--[[	local lp = LocalPlayer()
	if lp:IsValid() and !GAMEMODE.UseModelHealthBar then
		local health = math.max(lp:Health(), 0)
		local healthperc =  math.Clamp(health / lp:GetMaxHealthEx(), 0, 1)
		local barghost = lp:IsBarricadeGhosting()
		colHealth.r = (1 - healthperc) * 180
		colHealth.g = healthperc * 180
		colHealth.b = 0		
		local screenscale = BetterScreenScale()		
		local wid, hei = 24 * screenscale, 156 * screenscale

		local x = (self.HealthModel:GetWide() - wid - 16)

		local subhei = healthperc * hei
		if barghost then
			surface.SetDrawColor(60, 60, 255, 255)
			surface.DrawRect(x-5, 0, wid+10, hei)		
		end
		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(x ,0, wid, hei)

		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
		surface.SetTexture(texSideEdge)
		surface.DrawTexturedRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)
		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 230)
		surface.DrawRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)

		surface.SetMaterial(matGlow)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x + 1 - wid/2 , hei-subhei+1, wid*2, 4)
		
		surface.SetDrawColor(60, 60, 60, 240)
		surface.DrawOutlinedRect(x-1, -1, wid+2, hei+2,3)
	end]]
	return true
end

vgui.Register("ZSHealthArea", PANEL, "Panel")
