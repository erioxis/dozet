AddCSLuaFile()

SWEP.PrintName = "Kongol Axe"
SWEP.Description = "A very heavy greataxe with no other special properties other than sheer damage output."

if CLIENT then
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
end

<<<<<<< Updated upstream:entities/weapons/weapon_zs_kongolaxe.lua
SWEP.Base = "weapon_zs_basemelee"
=======
	SWEP.ArchiveV = SWEP.VElements
	function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
		self:BaseDrawWeaponSelection(x, y, w, h, alpha)
	end
>>>>>>> Stashed changes:entities/weapons/weapon_zs_kongolaxe/cl_init.lua

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

<<<<<<< Updated upstream:entities/weapons/weapon_zs_kongolaxe.lua
SWEP.MeleeDamage = 150
SWEP.MeleeRange = 75
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 350

SWEP.Primary.Delay = 1.3

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.SwingRotation = Angle(60, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.6
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.Tier = 4
SWEP.MaxStock = 3

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.13)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(40, 45))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg", 75, math.random(70, 75))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_bloody_break.wav", 80, math.random(95, 105))
end
=======
		local defleft = !self:GetDTBool(6) and (self:GetPerc() or 0) or math.Round(self:GetDTFloat(11)-CurTime())
			surface.SetDrawColor(5, 5, 115, 180)
		surface.DrawRect(x, y, wid, hei)
	if self:GetDTBool(6) then

		surface.SetDrawColor(61, 230, 49, 180)
		surface.SetTexture(surface.GetTextureID("VGUI/gradient_down"))
		surface.DrawTexturedRect(x, y, math.min((self:GetDTFloat(11)-CurTime())/7,1) * wid, hei)
		draw.SimpleText("GOD!", "ZSHUDFontSmall", x, texty-32, COLOR_GREEN, TEXT_ALIGN_LEFT)
		
	else
		surface.SetDrawColor(250, 55, 0, 180)
		surface.SetTexture(surface.GetTextureID("VGUI/gradient_down"))
		surface.DrawTexturedRect(x, y, math.min(defleft/100,1) * wid, hei)
	end

			surface.SetDrawColor(50, 155, 50, 180)
			surface.DrawOutlinedRect(x, y, wid, hei)
	
		draw.SimpleText(defleft, "ZSHUDFontSmall", x, texty, COLOR_GREEN, TEXT_ALIGN_LEFT)
		if defleft >= 25 then
			local binded = input.LookupBinding("+menu")
			draw.SimpleText((binded or translate.Format("no_find_x_bind","+menu")), "ZSHUDFontSmall", x+384/2-(binded and 0 or 170), y-24-(binded and 0 or 100), COLOR_GREEN, TEXT_ALIGN_CENTER)
		end
		if GetConVar("crosshair"):GetInt() == 1 then
			self:DrawCrosshairDot()
		end
	end
	function SWEP:PostDrawViewModel(vm, pl, wep)
		if  self:GetDTBool(6) then
			local bruh = 3
			local veles = self.VElements
			for k,v in pairs(self.VElements) do
					local clr = Color(veles[k].color.r *bruh,veles[k].color.g * bruh,veles[k].color.b *bruh)
					veles[k].color = clr
			end
		else
			local veles = self.VElements
			local archive = self.ArchiveV
			for k,v in pairs(self.VElements) do
					local clr = archive[k].color
					veles[k].color = clr
			end
		end
	end
	SWEP.OverPosition =  Vector(0,0,36)
	SWEP.Additionalism =  Vector(5,1,-12)
	
SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.MissAnim = ACT_VM_MISSCENTER
>>>>>>> Stashed changes:entities/weapons/weapon_zs_kongolaxe/cl_init.lua
