INC_CLIENT()
	SWEP.ViewModelFOV = 65
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base2+++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.519, 14, 0), angle = Angle(0, 90, -90), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base2"] = { type = "Model", model = "models/props_phx/gibs/wooden_wheel2_gib2.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(2, 15.074, -1.5), angle = Angle(0, -45, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/props/cs_militia/axe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.299, -4), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base2++++"] = { type = "Model", model = "models/props_phx/construct/metal_angle180.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 15.064, -1), angle = Angle(0, 180, 0), size = Vector(0.2, 0.2, 0.5), color = Color(255, 255, 255, 35), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
		["base2++"] = { type = "Model", model = "models/props_phx/gibs/wooden_wheel2_gib2.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(2.049, 15.064, -1.52), angle = Angle(0, -80, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base2+"] = { type = "Model", model = "models/props_phx/construct/metal_angle180.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 15.064, -1), angle = Angle(0, 180, 0), size = Vector(0.2, 0.2, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props/cs_militia/axe.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.299, -4), angle = Angle(0, 0, 90), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base2+++"] = { type = "Model", model = "models/props_phx/misc/iron_beam1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.519, 14, 0), angle = Angle(0, 90, -90), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base2"] = { type = "Model", model = "models/props_phx/gibs/wooden_wheel2_gib2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.699, 15.074, -1.5), angle = Angle(0, -45, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base2++++"] = { type = "Model", model = "models/props_phx/construct/metal_angle180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 15.064, -1), angle = Angle(0, 180, 0), size = Vector(0.2, 0.2, 0.5), color = Color(255, 255, 255, 35), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
		["base2++"] = { type = "Model", model = "models/props_phx/gibs/wooden_wheel2_gib2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.75, 15.064, -1.52), angle = Angle(0, -80, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} },
		["base2+"] = { type = "Model", model = "models/props_phx/construct/metal_angle180.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 15.064, -1), angle = Angle(0, 180, 0), size = Vector(0.2, 0.2, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_c17/chairchrome01", skin = 0, bodygroup = {} }
	}

	function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
		self:BaseDrawWeaponSelection(x, y, w, h, alpha)
	end

	function SWEP:DrawHUD()

		local wid, hei = 384, 16
		local x, y = ScrW() - wid - 32, ScrH() - hei - 72
		local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

		defleft = (self:GetPerc() or 0)
			surface.SetDrawColor(5, 5, 115, 180)
		surface.DrawRect(x, y, wid, hei)
	if self.GodMode then

		surface.SetDrawColor(math.random(0,255), math.random(0,55), math.random(0,155), 180)
		surface.SetTexture(surface.GetTextureID("VGUI/gradient_down"))
		surface.DrawTexturedRect(x, y, math.min(defleft * 0.1,1) * wid, hei)
	else
		surface.SetDrawColor(250, 55, 0, 180)
		surface.SetTexture(surface.GetTextureID("VGUI/gradient_down"))
		surface.DrawTexturedRect(x, y, math.min(defleft * 0.1,1) * wid, hei)
	end

			surface.SetDrawColor(50, 155, 50, 180)
			surface.DrawOutlinedRect(x, y, wid, hei)
	
		draw.SimpleText(math.min(10,defleft), "ZSHUDFontSmall", x, texty, COLOR_GREEN, TEXT_ALIGN_LEFT)
		if GetConVar("crosshair"):GetInt() == 1 then
			self:DrawCrosshairDot()
		end
	end

