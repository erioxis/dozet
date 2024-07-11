AddCSLuaFile()

SWEP.Base = "weapon_zs_basefood"

SWEP.PrintName = "Nuclear Solyanka"

if CLIENT then
	SWEP.VElements = {
		["element_name"] = { type = "Model", model = "models/props_c17/metalpot001a.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(2.013, 2.013, -0.5), angle = Angle(0, -70, -180), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(2.013, 2.013, -2.014), angle = Angle(0, -70, -180), size = Vector(0.09, 0.09, 0.09), color = Color(141, 232, 62), surpresslightning = false, material = "models/cs_italy/light_orange", skin = 0, bodygroup = {} },
		["element_name++"] = { type = "Model", model = "models/props_debris/prison_wallchunk001a.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(4.025, 1.006, -2.5), angle = Angle(83.774, -108.68, -180), size = Vector(0.05, 0.05, 0.05), color = Color(95, 236, 114), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/props_debris/prison_wallchunk001c.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(1.013, 1, -2.5), angle = Angle(83.774, 54.34, -180), size = Vector(0.05, 0.05, 0.05), color = Color(105, 235, 76), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/Gibs/Fast_Zombie_Torso.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(-1.007, 8.05, -1.007), angle = Angle(-72.454, -117.737, -180), size = Vector(0.1, 0.1, 0.1), color = Color(128, 241, 93), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["bon"] = { type = "Model", model = "", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0, 3.038, -1.219), angle = Angle(2.194, 14.913, 11.456), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["element_name"] = { type = "Model", model = "models/props_c17/metalpot001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(2.013, 2.013, -0.5), angle = Angle(0, -70, -180), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/mechanics/wheels/wheel_speed_72.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(2.013, 2.013, -2.014), angle = Angle(0, -70, -180), size = Vector(0.09, 0.09, 0.09), color = Color(201, 38, 38, 255), surpresslightning = false, material = "models/cs_italy/light_orange", skin = 0, bodygroup = {} },
		["element_name++"] = { type = "Model", model = "models/props_debris/prison_wallchunk001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(4.025, 1.006, -2.5), angle = Angle(83.774, -108.68, -180), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
		["element_name+++"] = { type = "Model", model = "models/props_lab/Ladel.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(2.013, 6.038, -6.039), angle = Angle(20.377, -70, -180), size = Vector(0.449, 0.449, 0.449), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/props_debris/prison_wallchunk001c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(1.013, 1, -2.5), angle = Angle(83.774, 54.34, -180), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/Gibs/Fast_Zombie_Torso.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "bon", pos = Vector(-1.007, 8.05, -1.007), angle = Angle(-72.454, -117.737, -180), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/flesh", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_grenade.mdl"
SWEP.WorldModel = "models/props_junk/garbage_takeoutcarton001a.mdl"

SWEP.Primary.Ammo = "foodsolyanka"

SWEP.FoodHealth = -20
SWEP.FoodEatTime = 1

SWEP.WalkSpeed = 120
function SWEP:PostEat()
	local owner = self:GetOwner()
	owner:GiveStatus("death",30)
	owner:GodEnable()
end