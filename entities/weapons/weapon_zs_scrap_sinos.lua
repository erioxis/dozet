AddCSLuaFile()

SWEP.PrintName = translate.Get("wep_sinos_scrap")
SWEP.Description = translate.Get("wep_sinos_scrap_d")



if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["da"] = { type = "Model", model = "models/props_c17/canisterchunk02l.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.957, 15.396, -17.684), angle = Angle(-43.607, 10.216, 38.892), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da+"] = { type = "Model", model = "models/props_c17/gaspipes006a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.621, 5.743, -8.792), angle = Angle(-165.993, -20.716, 18.632), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da++"] = { type = "Model", model = "models/props_lab/pipesystem03c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.232, 7.478, -15.105), angle = Angle(-49.121, 176.44901, 27.484), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da+++"] = { type = "Model", model = "models/props_lab/pipesystem02e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.403, 5.897, -14.651), angle = Angle(-6.285, 159.584, 22.629), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da++++"] = { type = "Model", model = "models/props_lab/pipesystem01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.847, 4.957, -8.918), angle = Angle(-175.44701, 0, 22.642), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da+++++"] = { type = "Model", model = "models/props_wasteland/barricade001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.5, 8.231, -11.856), angle = Angle(72.548, 99.196, 39.528), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da++++++"] = { type = "Model", model = "models/props_wasteland/cafeteria_table001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.328, -3.132, -14.961), angle = Angle(15.928, -45.4, -8.071), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da+++++++"] = { type = "Model", model = "models/props_wasteland/gear01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.995, 3.957, -7.404), angle = Angle(136.60899, -92.753, -19.173), size = Vector(0.443, 0.123, 0.443), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["da"] = { type = "Model", model = "models/props_c17/canisterchunk02l.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(11.957, 15.396, -17.684), angle = Angle(-43.607, 10.216, 38.892), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da+"] = { type = "Model", model = "models/props_c17/gaspipes006a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.621, 5.743, -8.792), angle = Angle(-165.993, -20.716, 18.632), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da++"] = { type = "Model", model = "models/props_lab/pipesystem03c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.232, 7.478, -15.105), angle = Angle(-49.121, 176.44901, 27.484), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da+++"] = { type = "Model", model = "models/props_lab/pipesystem02e.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.403, 5.897, -14.651), angle = Angle(-6.285, 159.584, 22.629), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da++++"] = { type = "Model", model = "models/props_lab/pipesystem01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.847, 4.957, -8.918), angle = Angle(-175.44701, 0, 22.642), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "cs_havana/metal01", skin = 0, bodygroup = {} },
		["da+++++"] = { type = "Model", model = "models/props_wasteland/barricade001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.5, 8.231, -11.856), angle = Angle(72.548, 99.196, 39.528), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da++++++"] = { type = "Model", model = "models/props_wasteland/cafeteria_table001a_chunk03.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(9.328, -3.132, -14.961), angle = Angle(15.928, -45.4, -8.071), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["da+++++++"] = { type = "Model", model = "models/props_wasteland/gear01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.995, 3.957, -7.404), angle = Angle(136.60899, -92.753, -19.173), size = Vector(0.443, 0.123, 0.443), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.ModelScale = 0.8
SWEP.UseHands = true
SWEP.BoxPhysicsMin = Vector(-0.5764, -2.397225, -20.080572) * SWEP.ModelScale
SWEP.BoxPhysicsMax = Vector(0.70365, 2.501825, 19.973375) * SWEP.ModelScale

SWEP.MeleeDamage = 85
SWEP.MeleeRange = 43
SWEP.InnateDamageType = INNATE_TYPE_SERRATE
SWEP.InnateDamageMul = 1.4
SWEP.InnateSerrateRandom = 5
SWEP.MeleeSize = 2
SWEP.Primary.Delay = 0.24
SWEP.BlockMultiplierWeapon = 0.78
SWEP.Tier = 4

SWEP.WalkSpeed = SPEED_FASTER


SWEP.HoldType = "melee2"


SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 0.4)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav")
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/metal/metal_sheet_impact_bullet"..math.random(2)..".wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_impact_bullet"..math.random(5)..".wav")
end

