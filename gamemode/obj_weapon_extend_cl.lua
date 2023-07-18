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
local x_y = CreateClientConVar("zs_x_stamina", "0", true, false):GetFloat()
cvars.AddChangeCallback("zs_x_stamina", function(cvar, oldvalue, newvalue)
	x_y = tonumber(newvalue)
end)
local y_s = CreateClientConVar("zs_y_stamina", "0", true, false):GetFloat()
cvars.AddChangeCallback("zs_y_stamina", function(cvar, oldvalue, newvalue)
	y_s = tonumber(newvalue)
end)
local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0,0,0)
local olds = 100
local apr = math.Approach
local surface_SetDrawColor = surface.SetDrawColor
local surface_DrawRect = surface.DrawRect
local surface_DrawTexturedRect = surface.DrawTexturedRect
function meta:DrawStaminaBar()
	local lp = MySelf

	if lp:GetStamina() < 100 then
		local x = ScrW() * 0.45 + (x_y)
		local y = ScrH() * 0.78 + (y_s)
		local screenscale = BetterScreenScale()
		local wid, hei = 250 * screenscale, 30 * screenscale
		if lp:IsValid() then
			local health = apr(olds,math.max(lp:GetStamina(), 0),1.5)
		
			local healthperc = math.Clamp(health / 100, 0.01, 1)
	 
			colHealth.r = 255/healthperc
			colHealth.g = 255 * healthperc
			colHealth.b = 0
	
			local subwidth = healthperc * wid
			local sup = (lp:IsSkillActive(SKILL_SAHA) and 0.5 or 0.33)
			surface_SetDrawColor(0, 0, 0, 230)
			surface_DrawRect(x, y, wid, hei)
			surface.SetAlphaMultiplier(0.3)
			surface_SetDrawColor((healthperc < sup and 120 or 0), (healthperc < sup and  50 or 0), 0,120)
			surface_DrawRect(x, y, wid*sup, hei)
			surface.SetAlphaMultiplier(1)
			
	
			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface.SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)
	
			surface.SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, 255)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)

			surface.SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, 255)
			surface_DrawTexturedRect(x + 2 +  wid*0.33 - 6.5, y + 1 - hei/2, 4, hei * 2)
			local phantomwidth = (health == 100 and 0 or wid)
			draw.SimpleTextBlurry((math.Round(olds*100)/100).."%" , "ZSHUDFontSmall", x, y - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
			--olds = math.MoveTowards(olds,math.max(lp:GetStamina(), 0),0.1)
			olds = apr(olds,math.max(lp:GetStamina(), 0),0.45)
		end
	end
end
local function DrawNew(text,sup,wid,x, y, col,time,count)
	if time then
		col.a = 255 * math.max(0.1,((time-CurTime()-0.5)/2))
	end

	draw.SimpleText("+ "..text..(count and " x"..count or "") , "ZSHUDFontTiny", x, y*1.07+((sup-1)*25), col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

end
local colors = {
	Color(255, 255, 255),
	Color(59, 15, 15),
	Color(0, 176, 220),
	Color(220, 0, 0),
	Color(16, 16, 16),
	Color(189, 40, 40),
	Color(71, 30, 184),
	Color(184, 30, 125),
	Color(231, 243, 62)
}
local text = {
	"Eugh",
	"Dead",
	"COOL!",
	"Bloody!",
	"Agent of Style",
	"Salut",
	"Supreme Style",
	"SSSHitstorm",
	"GOD OF ZS"
}
local colHealth = Color(1,1,1,255)
function meta:DrawStyle()
end
--local CrossHairScale = 1
local matGrad = Material("VGUI/gradient-r")
local function DrawLine(x, y, rot)
	local thickness = GAMEMODE.CrosshairThickness

	rot = 270 - rot
	surface.SetMaterial(matGrad)
	surface_SetDrawColor(0, 0, 0, GAMEMODE.CrosshairColor.a)
	surface.DrawTexturedRectRotated(x, y, 14, math.max(4 * thickness, 2 + 2 * thickness), rot)
	surface_SetDrawColor(GAMEMODE.CrosshairColor)
	surface.DrawTexturedRectRotated(x, y, 12, 2 * thickness, rot)
end
local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local NoParasite = surface.GetTextureID("zombiesurvival/killicons/bleed")
local colHealth = Color(0, 0, 0, 240)
local baserot = 0
local function drawCringeCircle(x,y,radius, seg)
	local cir = {}

	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end

	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )

	surface.DrawPoly( cir )

end
--drawCringeCircle(xd,yd,16, math.sin( CurTime() ) * 20 + 25)
function meta:DrawCrosshairCross()
	local x = ScrW() * 0.5
	local y = ScrH() * 0.5

	local ironsights = self.GetIronsights and self:GetIronsights()

	local cone = self:GetCone()

	if cone <= 0 or ironsights and not ironsightscrosshair then return end

	--cone = ScrH() / 76.8 * cone
	cone = ScrH() * 0.0003125 * cone
	cone = cone * 90 / MySelf:GetFOV()

	--CrossHairScale = cone --apr(CrossHairScale, cone, FrameTime() * math.max(5, math.abs(CrossHairScale - cone) * 0.02))

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
		local x1, y1 = scrW1 * 0.5 , scrH1 * 0.5
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

			surface_SetDrawColor(0, 0, 0, 230)
			surface_DrawRect(x, y, wid, hei)

			surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
			surface.SetTexture(texDownEdge)
			surface_DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
			surface_SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
			surface_DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

			surface.SetMaterial(matGlow)
			surface_SetDrawColor(255, 255, 255, 255)
			surface_DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
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
	surface_SetDrawColor(GAMEMODE.CrosshairColor2)
	surface_DrawRect(x - hsize, y - hsize, size, size)
	surface_SetDrawColor(0, 0, 0, GAMEMODE.CrosshairColor2.a)
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


		surface_SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 255)
		surface.SetTexture(NoParasite)
		surface_DrawTexturedRect(x, y , 32, hei)
		surface_SetDrawColor(colHealth.r * 0.2, colHealth.g * 1.2, colHealth.b*2, 255)
		surface.SetTexture(NoParasite2)
		surface_DrawTexturedRect(x, y , 32, hei)
	end
	if MySelf.StaminaHAHA then
		self:DrawStaminaBar()
	end
	self:DrawStyle()
end

local matScope = Material("zombiesurvival/scope")
function meta:DrawRegularScope()
	local scrw, scrh = ScrW(), ScrH()
	local size = math.min(scrw, scrh)
	surface.SetMaterial(matScope)
	surface_SetDrawColor(255, 255, 255, 255)
	surface_DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, size)
	surface_SetDrawColor(0, 0, 0, 255)
	if scrw > size then
		local extra = (scrw - size) * 0.5
		surface_DrawRect(0, 0, extra, scrh)
		surface_DrawRect(scrw - extra, 0, extra, scrh)
	end
	if scrh > size then
		local extra = (scrh - size) * 0.5
		surface_DrawRect(0, 0, scrw, extra)
		surface_DrawRect(0, scrh - extra, scrw, extra)
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
		surface_SetDrawColor(0,145,255,math.max(35,25 + i * 30)/2)
		surface.DrawOutlinedRect(hw-hrectsize,hh-hrectsize,rectsize,rectsize)
	end
	if scrw > size then
		local extra = (scrw - size) * 0.5
		for i=0,12 do
			surface_SetDrawColor(0,145,255, math.max(10,255 - i * 21.25)/2)
			surface.DrawLine(hw,i*line,hw,i*line+line)
			surface.DrawLine(hw,scrh-i*line,hw,scrh-i*line-line)
			surface.DrawLine(i*line+extra,hh,i*line+line+extra,hh)
			surface.DrawLine(scrw-i*line-extra,hh,scrw-i*line-line-extra,hh)
		end
		surface_SetDrawColor(0, 0, 0, 255)
		surface_DrawRect(0, 0, extra, scrh)
		surface_DrawRect(scrw - extra, 0, extra, scrh)
	end
	if scrh > size then
		local extra = (scrh - size) * 0.5
		for i=0,12 do
			surface_SetDrawColor(0,145,255, math.max(10,255 - i * 21.25)/2)
			surface.DrawLine(hw,i*line+extra,hw,i*line+line+extra)
			surface.DrawLine(hw,scrh-i*line-extra,hw,scrh-i*line-line-extra)
			surface.DrawLine(i*line,hh,i*line+line,hh)
			surface.DrawLine(scrw-i*line,hh,scrw-i*line-line,hh)
		end
		surface_SetDrawColor(0, 0, 0, 255)
		surface_DrawRect(0, 0, scrw, extra)
		surface_DrawRect(0, scrh - extra, scrw, extra)
	end

	surface.SetMaterial(texGradientU)
	surface_SetDrawColor(0,0,0,255)
	surface_DrawTexturedRect((scrw - size) * 0.5, (scrh - size) * 0.5, size, gradsize)
	surface.SetMaterial(texGradientD)
	surface_DrawTexturedRect((scrw - size) * 0.5, scrh - (scrh - size) * 0.5 - gradsize, size, gradsize)
	surface.SetMaterial(texGradientR)
	surface_DrawTexturedRect(scrw - (scrw - size) * 0.5 - gradsize, (scrh - size) * 0.5, gradsize, size)
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
		surface_SetDrawColor(cols.r, cols.g, cols.b, alpha )
		surface_DrawTexturedRect(x + wide * 0.5 - wid * 0.5, y + tall * 0.5 - hei * 0.5, wid, hei)
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

local matGradientRight = CreateMaterial("gradient-r", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-r", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
function meta:Draw2DFeature( progress, remst, nexst, text, font, color, cenpress, clipif )
	local w, h = 300, 20
	local x, y = ScrW() - w, ScrH() - h
	local alpha = progress >= 1 and math.abs( math.sin( CurTime() * 10 ) ) * 255 or 255 
	local col = Color( color.r, color.g, color.b, alpha )
	
	local wh = math.min( w, progress * w )
	if remst and remst ~= 0 and nexst and progress >= 1 then
		wh = math.min( w, wh * ( remst - CurTime() ) / nexst )
	end

	surface.SetMaterial( matGradientRight )
	surface_SetDrawColor( Color( 0, 0, 0, 200 ) )
	surface_DrawTexturedRect( x, y - 122, w, h + 4 )

	surface.SetMaterial( matGradientRight )
	surface_SetDrawColor( col )
	surface_DrawTexturedRect( x, y - 120, wh, h )

	surface.SetFont( font )
	local wtxt, htxt = surface.GetTextSize( text )

	draw.SimpleText( translate.Get( text ), font, x + w, y - 120 - htxt / 2 + 12, col, TEXT_ALIGN_RIGHT )

	if cenpress and progress >= 1 then
		if clipif and ( self:Clip1() < self:GetMaxClip1() / 2 and ( remst and remst ~= 0 ) ) then return end
			
		local txt, font = translate.Format( "weapon_press_x", string.upper( input.LookupBinding( cenpress ) ) ), "ZSSHUD4Font_30"
		surface.SetFont( font )
		local wid, hei = surface.GetTextSize( txt )

		draw.SimpleText( txt, font, ScrW() / 2 + wid/2, ScrH() / 2 + 60, col, TEXT_ALIGN_RIGHT )
	end
end

function meta:Draw3DFeature( vm, pos, ang, progress, remst, nexst, text, font, color )
	cam.Start3D2D( pos, ang, self.HUD3DScale / 2 )
		local alpha = progress >= 1 and math.abs( math.sin( CurTime() * 10 ) ) * 255 or 255 
		local col = Color( color.r, color.g, color.b, alpha )
		
		local wid2, hei2 = 30, 200
		local x, y = -wid2 - 40, -hei2/2

		local heih = math.min( hei2, progress * hei2 )
		if remst and remst ~= 0 and nexst and progress >= 0 then
			heih = math.min( hei2, heih * ( remst - CurTime() ) / nexst )
		end

		surface_SetDrawColor( Color( 0, 0, 0, 150 ) )
		surface_DrawRect( x - 10 - wid2, y, wid2, hei2 )

		surface_SetDrawColor( col )
		surface_DrawRect( x - 10 - wid2, y, wid2, heih )
		
		draw.SimpleText( translate.Get( text ), font, x + 150 - wid2, y - 50, col, TEXT_ALIGN_RIGHT )
	cam.End3D2D()
end

function meta:Draw3DFeatureHorizontal( vm, pos, ang, progress, remst, nexst, text, font, color )
	cam.Start3D2D( pos, ang, self.HUD3DScale / 2 )
		local alpha = progress >= 1 and math.abs( math.sin( CurTime() * 10 ) ) * 255 or 255 
		local col = Color( color.r, color.g, color.b, alpha )
		
		local wid2, hei2 = 40, 200
		local x, y = -wid2 - 40, -hei2/2

		local heih = math.min( hei2, progress * hei2 )
		if remst and remst ~= 0 and nexst and progress >= 0 then
			heih = math.min( hei2, heih * ( remst - CurTime() ) / nexst )
		end

		surface_SetDrawColor( Color( 0, 0, 0, 150 ) )
		surface_DrawRect( x - 10 - wid2, y, hei2, wid2 )

		surface_SetDrawColor( col )
		surface_DrawRect( x - 10 - wid2, y, heih, wid2 )

		draw.SimpleText( translate.Get( text ), font, x + 190 - wid2, y - 50, col, TEXT_ALIGN_RIGHT )
	cam.End3D2D()
end
