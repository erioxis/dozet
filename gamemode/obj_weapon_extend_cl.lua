local meta = FindMetaTable("Weapon")

function meta:DrawWeaponCrosshair()
	if GetConVar("crosshair"):GetInt() ~= 1 then return end

	self:DrawCrosshairCross()
	self:DrawCrosshairDot()
end

local ironsightscrosshair = CreateClientConVar("zs_ironsightscrosshair", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_ironsightscrosshair", function(cvar, oldvalue, newvalue)
	ironsightscrosshair = tonumber(newvalue) == 1
end)
local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0,0,0)
function meta:DrawStaminaBar()
	local lp = MySelf
	if lp:GetStamina() < 100 then
		local health = math.max(lp:GetStamina(), 0)
		local healthperc = math.Clamp(health / 100, 0.01, 1)
		local x = ScrW() * 0.45
		local y = ScrH() * 0.78
		local screenscale = BetterScreenScale()
		local wid, hei = 250 * screenscale, 30 * screenscale
		if lp:IsValid() then
	 
			colHealth.r = 255/healthperc
			colHealth.g = 255 * healthperc
			colHealth.b = 0
	
			local subwidth = healthperc * wid
			local sup = (lp:IsSkillActive(SKILL_SAHA) and 0.5 or 0.33)
			surface.SetDrawColor(0, 0, 0, 230)
			surface.DrawRect(x, y, wid, hei)
			surface.SetAlphaMultiplier(0.3)
			surface.SetDrawColor((healthperc < sup and 120 or 0), (healthperc < sup and  50 or 0), 0,120)
			surface.DrawRect(x, y, wid*sup, hei)
			surface.SetAlphaMultiplier(1)
			
	
			surface.SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface.SetTexture(texDownEdge)
			surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface.SetMaterial(matGlow)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)

			surface.SetMaterial(matGlow)
			surface.SetDrawColor(255, 255, 255, 255)
			surface.DrawTexturedRect(x + 2 +  wid*0.33 - 6.5, y + 1 - hei/2, 4, hei * 2)
			local phantomwidth = (health == 100 and 0 or wid)
			draw.SimpleTextBlurry(math.Round(lp:GetStamina()).."%" , "ZSHUDFontSmall", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

		end
	end
end
--local CrossHairScale = 1
local matGrad = Material("VGUI/gradient-r")
local function DrawLine(x, y, rot)
	local thickness = GAMEMODE.CrosshairThickness

	rot = 270 - rot
	surface.SetMaterial(matGrad)
	surface.SetDrawColor(0, 0, 0, GAMEMODE.CrosshairColor.a)
	surface.DrawTexturedRectRotated(x, y, 14, math.max(4 * thickness, 2 + 2 * thickness), rot)
	surface.SetDrawColor(GAMEMODE.CrosshairColor)
	surface.DrawTexturedRectRotated(x, y, 12, 2 * thickness, rot)
end
local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local NoParasite = surface.GetTextureID("zombiesurvival/killicons/bleed")
local colHealth = Color(0, 0, 0, 240)
local baserot = 0
function meta:DrawCrosshairCross()
	local x = ScrW() * 0.5
	local y = ScrH() * 0.5

	local ironsights = self.GetIronsights and self:GetIronsights()

	local cone = self:GetCone()

	if cone <= 0 or ironsights and not ironsightscrosshair then return end

	--cone = ScrH() / 76.8 * cone
	cone = ScrH() * 0.0003125 * cone
	cone = cone * 90 / MySelf:GetFOV()

	--CrossHairScale = cone --math.Approach(CrossHairScale, cone, FrameTime() * math.max(5, math.abs(CrossHairScale - cone) * 0.02))

	local midarea = 40 * cone --CrossHairScale

	local vel = MySelf:GetVelocity()
	local len = vel:LengthSqr()
	vel:Normalize()
	if GAMEMODE.NoCrosshairRotate then
		baserot = GAMEMODE.CrosshairOffset
	else
		baserot = math.NormalizeAngle(baserot + vel:Dot(EyeAngles():Right()) * math.min(10, len / 40000))
	end
	local firedelay = MySelf:GetActiveWeapon():GetNextPrimaryFire() - CurTime() 
		local scrW1 = ScrW()
		local scrH1 = ScrH()
		local width1 = 200
		local height1 = 20
		local x1, y1 = ScrW() * 0.5 , ScrH() * 0.5
		local screenscale = BetterScreenScale()
		local lp = MySelf
		local ratio = (MySelf:GetActiveWeapon().Primary.Delay or 1) / firedelay
		surface.DrawCircle(x1, y1, 38 * cone, 5, 35 * ratio * 0.5, 5, 255 * ratio * 0.4)
		local ratio = ((CurTime()-((MySelf:GetActiveWeapon().Primary.Delay or 1) + MySelf:GetActiveWeapon():GetNextPrimaryFire() - MySelf:GetActiveWeapon():GetFireDelay()))) * 100
		if ratio/100+0.11 <= 0 and MySelf:GetActiveWeapon() and !MySelf:GetActiveWeapon().IsMelee then
			draw.SimpleTextBlurry(-math.Round(ratio)/100-0.11, "ZSHUDFontTiny",x1-70 * math.max(1.004,cone), y1+10 * math.max(1.004,cone), Color(255,255,255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
		end
		if MySelf:IsSkillActive(SKILL_VAMPIRISM) then
			local screenscale = BetterScreenScale()
			local prog = lp:GetNWFloat("vampirism_progress",value)
			local healthperc = math.Clamp(prog  / 1200, 0, 1)
			local wid, hei = 100 * screenscale, 18 * screenscale
	
			colHealth.r = 255 * healthperc
			colHealth.g = 120
			colHealth.b = 122

			local y = y + 35 *  screenscale
			local subwidth = healthperc * wid
			draw.SimpleTextBlurry(math.Round(prog) , "ZSHUDFontSmallest", x + wid + 18 * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)

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
		end


	local ang = Angle(0, 0, baserot)
	for i=0, 359, 360 / GAMEMODE.CrosshairLines do
		ang.roll = baserot + i
		local p = ang:Up() * midarea
		DrawLine(math.Round(x + p.y), math.Round(y + p.z), ang.roll)
	end
end
local NoParasite2 = surface.GetTextureID("zombiesurvival/killicons/weapon_zs_scythe2")
function meta:DrawCrosshairDot()
	local x = ScrW() * 0.5
	local y = ScrH() * 0.5
	local thickness = GAMEMODE.CrosshairThickness
	local size = 4 * thickness
	local hsize = size/2
	local firedelay = MySelf:GetActiveWeapon():GetNextPrimaryFire() - CurTime() 
	local ratio = (MySelf:GetActiveWeapon().IsMelee and MySelf:GetActiveWeapon().MeleeDelay or 1) / firedelay
	surface.DrawCircle(x, y, 10, 5 * ratio * 0.2, 35 * ratio * 0.5, 5, 255 * ratio * 0.4)
	surface.SetDrawColor(GAMEMODE.CrosshairColor2)
	surface.DrawRect(x - hsize, y - hsize, size, size)
	surface.SetDrawColor(0, 0, 0, GAMEMODE.CrosshairColor2.a)
	surface.DrawOutlinedRect(x - hsize, y - hsize, size, size)

	if GAMEMODE.LastOTSBlocked and MySelf:Team() == TEAM_HUMAN and GAMEMODE:UseOverTheShoulder() then
		GAMEMODE:DrawCircle(x, y, 8, COLOR_RED)
	end
	if (MySelf:IsSkillActive(SKILL_PARASITOID) or MySelf:IsSkillActive(SKILL_CAN_EATER)) and MySelf:GetProgress("parasite_prog") > CurTime() then
		local screenscale = BetterScreenScale()
		local wid, hei = 32 * screenscale, 32 * screenscale

		colHealth.r = 255 
		colHealth.g = 120
		colHealth.b = 122

		draw.SimpleTextBlurry(math.Round((MySelf:GetProgress("parasite_prog")-CurTime())*100)/100 , "ZSHUDFontSmallest", x + wid  * screenscale, y + 8 * screenscale, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)


		surface.SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 255)
		surface.SetTexture(NoParasite)
		surface.DrawTexturedRect(x, y , 32, hei)
		surface.SetDrawColor(colHealth.r * 0.2, colHealth.g * 1.2, colHealth.b*2, 255)
		surface.SetTexture(NoParasite2)
		surface.DrawTexturedRect(x, y , 32, hei)
	end
	if MySelf.StaminaHAHA then
		self:DrawStaminaBar()
	end
end

local matScope = Material("zombiesurvival/scope")
function meta:DrawRegularScope()
	local scrw, scrh = ScrW(), ScrH()
	local size = math.min(scrw, scrh)
	surface.SetMaterial(matScope)
	surface.SetDrawColor(255, 255, 255, 255)
	surface.DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, size)
	surface.SetDrawColor(0, 0, 0, 255)
	if scrw > size then
		local extra = (scrw - size) * 0.5
		surface.DrawRect(0, 0, extra, scrh)
		surface.DrawRect(scrw - extra, 0, extra, scrh)
	end
	if scrh > size then
		local extra = (scrh - size) * 0.5
		surface.DrawRect(0, 0, scrw, extra)
		surface.DrawRect(0, scrh - extra, scrw, extra)
	end
end

local texGradientU = Material("vgui/gradient-u")
local texGradientD = Material("vgui/gradient-d")
local texGradientR = Material("vgui/gradient-r")
function meta:DrawFuturisticScope()
	local scrw, scrh = ScrW(), ScrH()
	local size = math.min(scrw, scrh)
	local hw,hh = scrw * 0.5, scrh * 0.5
	local screenscale = BetterScreenScale()
	local gradsize = math.ceil(size * 0.14)
	local line = 38 * screenscale

	for i=0,6 do
		local rectsize = math.floor(screenscale * 44) + i * math.floor(130 * screenscale)
		local hrectsize = rectsize * 0.5
		surface.SetDrawColor(0,145,255,math.max(35,25 + i * 30)/2)
		surface.DrawOutlinedRect(hw-hrectsize,hh-hrectsize,rectsize,rectsize)
	end
	if scrw > size then
		local extra = (scrw - size) * 0.5
		for i=0,12 do
			surface.SetDrawColor(0,145,255, math.max(10,255 - i * 21.25)/2)
			surface.DrawLine(hw,i*line,hw,i*line+line)
			surface.DrawLine(hw,scrh-i*line,hw,scrh-i*line-line)
			surface.DrawLine(i*line+extra,hh,i*line+line+extra,hh)
			surface.DrawLine(scrw-i*line-extra,hh,scrw-i*line-line-extra,hh)
		end
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, extra, scrh)
		surface.DrawRect(scrw - extra, 0, extra, scrh)
	end
	if scrh > size then
		local extra = (scrh - size) * 0.5
		for i=0,12 do
			surface.SetDrawColor(0,145,255, math.max(10,255 - i * 21.25)/2)
			surface.DrawLine(hw,i*line+extra,hw,i*line+line+extra)
			surface.DrawLine(hw,scrh-i*line-extra,hw,scrh-i*line-line-extra)
			surface.DrawLine(i*line,hh,i*line+line,hh)
			surface.DrawLine(scrw-i*line,hh,scrw-i*line-line,hh)
		end
		surface.SetDrawColor(0, 0, 0, 255)
		surface.DrawRect(0, 0, scrw, extra)
		surface.DrawRect(0, scrh - extra, scrw, extra)
	end

	surface.SetMaterial(texGradientU)
	surface.SetDrawColor(0,0,0,255)
	surface.DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, gradsize)
	surface.SetMaterial(texGradientD)
	surface.DrawTexturedRect((scrw - size) * 0.5, scrh - (scrh - size) * 0.5 - gradsize, size, gradsize)
	surface.SetMaterial(texGradientR)
	surface.DrawTexturedRect(scrw - (scrw - size) * 0.5 - gradsize, (scrh - size) * 0.5, gradsize, size)
	surface.DrawTexturedRectRotated((scrw - size) * 0.5 + gradsize / 2, (scrh - size) * 0.5 + size / 2, gradsize, size, 180)
end

function meta:BaseDrawWeaponSelection(x, y, wide, tall, alpha)
	local ammotype1 = self:ValidPrimaryAmmo()
	local ammotype2 = self:ValidSecondaryAmmo()

	--killicon.Draw(x + wide * 0.5, y + tall * 0.5, self:GetClass(), 255)
	-- Doesn't work with pngs...
	local ki = killicon.Get(self:GetClass())
	local cols = ki and ki[#ki] or ""

	if ki and #ki == 3 then
		draw.SimpleText(ki[2], ki[1] .. "ws", x + wide * 0.5, y + tall * 0.5 + 18 * BetterScreenScale(), Color(cols.r, cols.g, cols.b, alpha), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	elseif ki then
		local material = Material(ki[1])
		local wid, hei = material:Width(), material:Height()

		surface.SetMaterial(material)
		surface.SetDrawColor(cols.r, cols.g, cols.b, alpha )
		surface.DrawTexturedRect(x + wide * 0.5 - wid * 0.5, y + tall * 0.5 - hei * 0.5, wid, hei)
	end

	draw.SimpleTextBlur(self:GetPrintName(), "ZSHUDFontSmaller", x + wide * 0.5, y + tall * 0.15, COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	if ammotype1 then
		local total = self:GetPrimaryAmmoCount()
		local inclip = self:Clip1()
		if inclip >= 0 then
			if self.Primary and self.Primary.ClipSize and self.Primary.ClipSize == 1 then
				draw.SimpleTextBlur("["..total.."]", "ZSHUDFontSmaller", x + wide * 0.05, y + tall * 0.8, total == 0 and COLOR_RED or color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM_REAL)
			else
				draw.SimpleTextBlur("["..inclip.." / ".. total - inclip .."]", "ZSHUDFontSmaller", x + wide * 0.05, y + tall * 0.8, total == 0 and COLOR_RED or inclip == 0 and COLOR_YELLOW or color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM_REAL)
			end
		end
	end

	if ammotype2 then
		local total = self:GetSecondaryAmmoCount()
		local inclip = self:Clip2()
		if inclip >= 0 then
			if self.Secondary and self.Secondary.ClipSize and self.Secondary.ClipSize == 1 then
				draw.SimpleTextBlur("["..total.."]", "ZSHUDFontSmaller", x + wide * 0.95, y + tall * 0.8, total == 0 and COLOR_RED or color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM_REAL)
			else
				draw.SimpleTextBlur("["..inclip.." / ".. total - inclip .."]", "ZSHUDFontSmaller", x + wide * 0.95, y + tall * 0.8, total == 0 and COLOR_RED or inclip == 0 and COLOR_YELLOW or color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM_REAL)
			end
		end
	end

	return true
end

local function empty() end
function meta:HideWorldModel()
	self:DrawShadow(false)
	self.DrawWorldModel = empty
	self.DrawWorldModelTranslucent = empty
end

local function HiddenViewModel(self, pos, ang)
	return pos + ang:Forward() * -256, ang
end
function meta:HideViewModel()
	self.GetViewModelPosition = HiddenViewModel
end
