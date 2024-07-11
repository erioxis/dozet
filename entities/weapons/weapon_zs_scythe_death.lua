AddCSLuaFile()

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 70

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.HoldType = "melee2"
	SWEP.ViewModel = "models/melee_anims/c_oren_katana.mdl"
	SWEP.WorldModel = "models/weapons/w_pistol.mdl"
	
	SWEP.SCKMaterials = {}
	
	SWEP.IronSightsPos = Vector(0, 0, -2.53)
	SWEP.IronSightsAng = Vector(0, 0, 0)
	
	SWEP.VElements = {
		["e1"] = { type = "Model", model = "models/props/cs_office/snowman_arm.mdl", bone = "RW_Weapon", rel = "", pos = Vector(2.953, -3.047, 1.267), angle = Angle(73.591, 0, 0), size = Vector(3.505, 3.505, 3.505), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams02", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(7.429, 5.877, 4.398), angle = Angle(0, -112.604, -180), size = Vector(2.512, 2.234, 10.89), color = Color(34, 255, 236, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(7.43, 5.877, 4.398), angle = Angle(0, -112.604, 180), size = Vector(2.512, 2.234, 10.89), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/Gibs/HGIBS.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(12.784, 1.777, 4.366), angle = Angle(0, -90, -90), size = Vector(0.996, 0.996, 0.996), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(16.104, -2.707, 2.288), angle = Angle(0, 145.19099, -59.496), size = Vector(0.166, 0.166, 0.166), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(15.082, -4.588, 1.655), angle = Angle(-1.219, 48.004, -84.225), size = Vector(0.039, 0.025, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(15.144, -1.621, 6.843), angle = Angle(0, -127.143, 74.957), size = Vector(0.166, 0.166, 0.166), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "RW_Weapon", rel = "e1", pos = Vector(13.592, -4.542, 7.57), angle = Angle(-1.219, 48.004, -84.225), size = Vector(0.039, 0.025, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["e1"] = { type = "Model", model = "models/props/cs_office/snowman_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1, 4.467, -3.501), angle = Angle(-111.016, 90, 0), size = Vector(3.505, 3.505, 3.43), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props/CS_militia/roofbeams02", skin = 0, bodygroup = {} },
		["e1+"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(7.429, 5.877, 4.398), angle = Angle(0, -112.604, -180), size = Vector(2.512, 2.234, 10.89), color = Color(34, 255, 236, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
		["e1++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(7.43, 5.877, 4.398), angle = Angle(0, -112.604, 180), size = Vector(2.512, 2.234, 10.89), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/wireframe", skin = 0, bodygroup = {} },
		["e1+++"] = { type = "Model", model = "models/Gibs/HGIBS.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(12.784, 1.777, 4.366), angle = Angle(0, -90, -90), size = Vector(0.996, 0.996, 0.996), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["e1+++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(16.104, -2.707, 2.288), angle = Angle(0, 145.19099, -59.496), size = Vector(0.166, 0.166, 0.166), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(15.082, -4.588, 1.655), angle = Angle(-1.219, 48.004, -84.225), size = Vector(0.039, 0.025, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1+++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(15.144, -1.621, 6.843), angle = Angle(0, -127.143, 74.957), size = Vector(0.166, 0.166, 0.166), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} },
		["e1++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(13.592, -4.542, 7.57), angle = Angle(-1.219, 48.004, -84.225), size = Vector(0.039, 0.025, 0.046), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_animated_breakable/smokestack/brickwall002a", skin = 0, bodygroup = {} }
	}
	
	
end
SWEP.PrintName = translate.Get("wep_ice_nail")
SWEP.Description = translate.Get("wep_d_ice_nail")
function SWEP:PlayHitSound()
	self:EmitSound(( self.FireNail and "ambient/fire/ignite.wav" or "physics/glass/glass_bottle_break"..math.random(1,2)..".wav"), 1215, (self:GetBlockState() and 200 or 2109))
	for i=1,3 do
		timer.Simple(0.09*i, function()	self:EmitSound(( self.FireNail and "ambient/fire/ignite.wav" or "physics/glass/glass_bottle_break"..math.random(1,2)..".wav"), 1215, (self:GetBlockState() and 200/i or 2109/i)) end)
	end
end

function SWEP:PlayHitFleshSound()
	for i=1,3 do
		timer.Simple(0.05*i, function()	self:EmitSound(( self.FireNail and "ambient/fire/ignite.wav" or "physics/glass/glass_bottle_break"..math.random(1,2)..".wav"), 1215, self:GetBlockState() and 200 or 2109) end)
	end
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"
SWEP.ShowWorldModel = false
SWEP.ViewModel = "models/melee_anims/c_oren_katana.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true
SWEP.HitDecal = "Manhackcut"


SWEP.MeleeDamage = 112
SWEP.MeleeRange = 77
SWEP.MeleeSize = 1.6
SWEP.Tier = 4


SWEP.AllowQualityWeapons = true

SWEP.WalkSpeed = SPEED_NORMAL

SWEP.Primary.Delay = 1.2
SWEP.SwingTime = 1.2
SWEP.Secondary.Delay = 10
SWEP.HitAnim = nil
SWEP.MissAnim = nil
SWEP.ChargeSpeed = 1000

