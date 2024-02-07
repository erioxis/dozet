AddCSLuaFile()

SWEP.Base = "weapon_zs_zombie"

SWEP.PrintName = ""
SWEP.ViewModel 				= 	Model("models/weapons/v_zombiearms.mdl")
SWEP.WorldModel 			= 	"models/weapons/w_crowbar.mdl"

function SWEP:Initialize()
	if CLIENT then
		self:Anim_Initialize()
	end
end

if CLIENT then
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

SWEP.VElements = {
	["element_name"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-0.514, 0.054, 1.664), angle = Angle(-97.573, 4.368, -2.901), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-0.473, -1.716, 1.264), angle = Angle(116.259, 3.881, -177.79), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-0.501, 0.444, 1.669), angle = Angle(-98.763, 179.567, 173.042), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.499, 1.779, -2.668), angle = Angle(-162.471, -62.093, -65.226), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.502, -1.058, -1.844), angle = Angle(142.21, -79.171, -81.292), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-1.548, -0.471, -2.195), angle = Angle(-141.258, 94.791, -99.68), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(-7.044, 1.088, 0.171), angle = Angle(-166.592, -73.695, 96.557), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(7.067, 1.205, -4.667), angle = Angle(-169.833, 74.037, -87.198), size = Vector(0.321, 0.142, 0.982), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["element_name+"] = { type = "Model", model = "models/gibs/Antlion_gib_Large_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.257, -0.63, -0.281), angle = Angle(131.628, -68.482, -114.645), size = Vector(0.108, 0.104, 0.291), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.203, 0.796, -2.056), angle = Angle(-3.993, -101.638, 134.115), size = Vector(0.108, 0.104, 0.418), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.111, 2.63, 0.875), angle = Angle(118.571, -86.826, 120.668), size = Vector(0.057, 0.104, 0.418), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(2.921, 2.101, 2.173), angle = Angle(142.162, -96.288, 91.412), size = Vector(0.083, 0.041, 0.418), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++"] = { type = "Model", model = "models/gibs/manhack_gib06.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(3.624, 4.32, 1.187), angle = Angle(135.147, -98.888, -25.576), size = Vector(0.522, 0.522, 1.097), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(8.218, 3.397, -0.798), angle = Angle(-0.132, -22.799, 162.41), size = Vector(2.002, 0.575, 0.569), color = Color(108, 108, 108, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++"] = { type = "Model", model = "models/gibs/antlion_gib_small_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.112, 2.015, -0.7), angle = Angle(-13.407, -22.334, 131.078), size = Vector(1.501, 0.541, 0.215), color = Color(108, 108, 108, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_1.mdl", bone = "ValveBiped.Bip01_L_Hand", rel = "", pos = Vector(5.767, 1.728, 1.016), angle = Angle(-172.862, -43.521, -91.949), size = Vector(0.384, 0.105, 0.105), color = Color(108, 108, 108, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++"] = { type = "Model", model = "models/gibs/strider_gib1.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(12.397, -0.112, 0.108), angle = Angle(-165.842, -13.429, -61.916), size = Vector(0.463, 0.172, 0.244), color = Color(108, 108, 108, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Neck1", rel = "", pos = Vector(-3.648, 3.467, 1.44), angle = Angle(-120.375, -97.502, -132.243), size = Vector(0.05, 0.05, 0.245), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "ValveBiped.Bip01_L_Forearm", rel = "", pos = Vector(9.479, 0.291, -0.758), angle = Angle(-25.401, -129.178, -105.371), size = Vector(0.206, 0.206, 0.206), color = Color(108, 108, 108, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_2.mdl", bone = "ValveBiped.Bip01_R_Forearm", rel = "", pos = Vector(8.741, 0.943, -1.417), angle = Angle(-7.258, -178.969, -175.577), size = Vector(0.75, 0.193, 0.193), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_wing.mdl", bone = "ValveBiped.Bip01_R_UpperArm", rel = "", pos = Vector(4.328, 0.811, -1.762), angle = Angle(169.555, 76.021, -11.035), size = Vector(0.165, 0.165, 0.165), color = Color(255, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Neck1", rel = "", pos = Vector(-1.793, 3.385, -1.991), angle = Angle(-79.161, -117.694, -133.26), size = Vector(0.05, 0.05, 0.245), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_R_UpperArm", rel = "", pos = Vector(1.182, 0.785, -0.487), angle = Angle(11.784, -97.655, 179.05), size = Vector(0.075, 0.075, 0.127), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_L_UpperArm", rel = "", pos = Vector(-0.207, 0.217, 0.677), angle = Angle(-174.398, -19.348, 175.24), size = Vector(0.075, 0.075, 0.127), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_2.mdl", bone = "ValveBiped.Bip01_Neck1", rel = "", pos = Vector(-1.778, 0.175, -0.101), angle = Angle(-3.078, -179.887, 102.084), size = Vector(0.654, 0.418, 0.083), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Neck1", rel = "", pos = Vector(-2.503, 0.734, 4.724), angle = Angle(116.857, -28.622, -141.426), size = Vector(0.075, 0.075, 0.151), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Neck1", rel = "", pos = Vector(-0.652, 1.424, -5.433), angle = Angle(79.355, -32.618, -132.178), size = Vector(0.075, 0.075, 0.151), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_large_3.mdl", bone = "ValveBiped.Bip01_Spine1", rel = "", pos = Vector(1.539, 0.759, 0.173), angle = Angle(15.578, -101.82, -120.671), size = Vector(0.104, 0.574, 0.168), color = Color(76, 76, 76, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-0.101, -1.469, 4.395), angle = Angle(147.328, 36.092, 72.742), size = Vector(0.075, 0.075, 0.305), color = Color(89, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(-0.417, -2.54, -2.731), angle = Angle(103.317, 32.601, 81.119), size = Vector(0.075, 0.075, 0.305), color = Color(102, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++++++++++"] = { type = "Model", model = "models/roller_spikes.mdl", bone = "ValveBiped.Bip01_Spine2", rel = "", pos = Vector(3.63, -3.612, -0.055), angle = Angle(-176.413, -7.595, -93.045), size = Vector(0.326, 0.174, 0.15), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/headcrab_classic/headcrabsheet", skin = 0, bodygroup = {} },
	["element_name++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(3.082, -0.295, -1.05), angle = Angle(103.317, 32.601, 81.119), size = Vector(0.075, 0.075, 0.078), color = Color(102, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} },
	["element_name+++++++++++++++++++++++++"] = { type = "Model", model = "models/hunter/misc/cone1x1.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(2.599, 0.518, 1.667), angle = Angle(-179.719, 25.311, 77.24), size = Vector(0.075, 0.075, 0.078), color = Color(89, 0, 0, 255), surpresslightning = false, material = "models/headcrab_black/blackcrab_sheet", skin = 0, bodygroup = {} }
}

SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(5.142, 0.108, 3.233), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger01"] = { scale = Vector(2, 2, 2), pos = Vector(0, 2.269, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger02"] = { scale = Vector(1.016, 1.016, 1.016), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(9.315, 0.18, 0), angle = Angle(-22.189, -14.353, -1.859) },
	["ValveBiped.Bip01_L_Finger11"] = { scale = Vector(1.444, 1.444, 1.444), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger12"] = { scale = Vector(2, 2, 2), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger2"] = { scale = Vector(2.05, 2.05, 2.05), pos = Vector(7.445, 0, 0), angle = Angle(-17.592, -5.95, 5.431) },
	["ValveBiped.Bip01_L_Finger21"] = { scale = Vector(2, 2, 2), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_Finger3"] = { scale = Vector(1.996, 1.996, 1.996), pos = Vector(6.594, 0, 0), angle = Angle(-3.267, 0, 0) },
	["ValveBiped.Bip01_L_Finger32"] = { scale = Vector(1.236, 1.236, 1.236), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },

	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(5.142, 0.108, 3.233), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger01"] = { scale = Vector(2, 2, 2), pos = Vector(0, 2.269, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger02"] = { scale = Vector(1.016, 1.016, 1.016), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger1"] = { scale = Vector(1, 1, 1), pos = Vector(9.315, 0.18, 0), angle = Angle(-22.189, -14.353, -1.859) },
	["ValveBiped.Bip01_R_Finger11"] = { scale = Vector(1.444, 1.444, 1.444), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger12"] = { scale = Vector(2, 2, 2), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger2"] = { scale = Vector(2.05, 2.05, 2.05), pos = Vector(7.445, 0, 0), angle = Angle(-17.592, -5.95, 5.431) },
	["ValveBiped.Bip01_R_Finger21"] = { scale = Vector(2, 2, 2), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger3"] = { scale = Vector(1.996, 1.996, 1.996), pos = Vector(6.594, 0, 0), angle = Angle(-3.267, 0, 0) },
	["ValveBiped.Bip01_R_Finger32"] = { scale = Vector(1.236, 1.236, 1.236), pos = Vector(0, 0, 0), angle = Angle(0, 0, 0) },
}

end

SWEP.MeleeDamage = 47.5
SWEP.BleedDamage = 15

SWEP.Secondary.Automatic = false
SWEP.Secondary.Delay = 14
SWEP.Primary.Delay = 1.1

SWEP.ProjectileType = "projectile_poisonflesh"
SWEP.ProjectileBullets = 4
SWEP.ProjectileThrow = 510
SWEP.ProjectileNextThrow  = 4.8

if CLIENT then
	function SWEP:DrawHUD()
		local screenscale = BetterScreenScale()
		local owner = self:GetOwner()

		local wid, hei = ScreenWidth * 0.2, ScreenHeight * 0.03
		local x, y = ScreenWidth - wid - screenscale * 64, ScreenHeight - hei - screenscale * 32

		surface.SetDrawColor( 0, 0, 0, 155 )
		surface.DrawRect( x, y, wid, hei )

		local color = Color( 105, 0, 20, 255 )
		local nextexp = self:GetNextBleedsplosion() - CurTime()
		local nextexpo = math.ceil( self:GetNextBleedsplosion() - CurTime() )
		if nextexpo > 0 then
			draw.SimpleText( translate.Format( "bloodvoid_explosion_reload_x", nextexpo ) , "ZSHUDFontSmallest", x + wid, y - hei + 10, color, TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT )
		end

		local widx = math.Clamp( wid * nextexp / self.Secondary.Delay, 0, wid )

		surface.SetDrawColor( color )
		surface.DrawRect( x + 2, y + 2, widx - 4, hei - 4 )
	end
end

function SWEP:ApplyMeleeDamage(ent, trace, damage)
	if SERVER and isplayer( ent ) then
		local owner = self:GetOwner()
		ent:GiveStatus( "dimvision", 4, self:GetOwner() )
		ent:AddBleedDamage( self.BleedDamage, self:GetOwner() )
	end

	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
end

function SWEP:SecondaryAttack()
	if CurTime() < self:GetNextBleedsplosion() then return end
	local owner = self:GetOwner()
	owner:GiveStatus( "zomdefence", 5, self:GetOwner() )

		local sndname = "zombies/bully_pain"..math.random(5)..".wav"
		for i = 1, 7 do
			timer.Create("secondarysound1" .. i, 0.04 * i, 1, function()
				if IsValid( owner ) then
					owner:EmitSound(sndname, 75, 135 + i*10, 0.4, CHAN_AUTO) 
				end
			end)
		end

		local sndname1 = "npc/stalker/breathing3.wav"
		for i = 1, 9 do
			timer.Create("secondarysound2" .. i, 0.04 * i, 1, function() 
				if IsValid( owner ) then 
					owner:EmitSound(sndname1, 75, 135 + i*7, 0.9, CHAN_AUTO) 
				end
			end)
		end

	owner:EmitSound( "npc/antlion_guard/angry" .. math.random( 3 ) .. ".wav", 100, math.random( 100, 110 ) )
	owner:EmitSound( "zombies/archangel_attack" .. math.random( 4 ) .. ".wav", 100, math.random( 125, 130 ) )
	owner:EmitSound( "zombies/archangel_attack" .. math.random( 4 ) .. ".wav", 100, math.random( 115, 120 ) )
	owner:EmitSound( "zombies/archangel_attack" .. math.random( 4 ) .. ".wav", 100, math.random( 105, 90 ) )

	local pl = self:GetOwner()
	local pos = pl:GetPos()

	util.ScreenShake( pos, 2, 2, 3, 10 )

	local center = pl:WorldSpaceCenter()

	if SERVER then

		for _, ent in ipairs( ents.FindInSphere( center, 170 ) ) do
			if ent:IsValidLivingHuman() and WorldVisible( ent:WorldSpaceCenter(), center ) then
				ent:GiveStatus( "dimvision", 2, pl )
				ent:TakeSpecialDamage( 6, DMG_BURN, pl, self )
				ent:SetLocalVelocity( ( center - ent:GetPos() ) * 4 )
				ent:AddBleedDamage( 18, pl )
			end
		end

	end

	local effectdata = EffectData()
		effectdata:SetOrigin( pos )
		effectdata:SetNormal( pl:GetUp() )
		effectdata:SetEntity( pl )
	util.Effect("explosion_blood", effectdata, nil, true)	

	local effectdata = EffectData()
		effectdata:SetOrigin( pos )
		effectdata:SetNormal( pl:GetUp() )
		effectdata:SetEntity( pl )
	util.Effect("explosion_voiddead", effectdata, nil, true)

	self:SetNextBleedsplosion( CurTime() + self.Secondary.Delay )
end

function SWEP:SetNextBleedsplosion( time )
	self:SetDTFloat( 1, time )
end

function SWEP:GetNextBleedsplosion()
	return self:GetDTFloat( 1 )
end

local function DoFleshThrow1(pl, wep)
	if IsValid( pl ) and pl:Alive() and IsValid( wep ) then
		pl:ResetSpeed()
		pl.LastRangedAttack = CurTime()

		if SERVER then
			local startpos = pl:GetShootPos()
			local aimang = pl:EyeAngles()
			local ang

			for i = 1, 11 do
				ang = Angle( aimang.p, aimang.y, aimang.r )
				ang:RotateAroundAxis( ang:Up(), math.random( 2, -2 ) * i )
				ang:RotateAroundAxis( ang:Right(), math.random( 2, -2 ) * i )

				local ent = ents.Create( "projectile_ghoulvoid" )
				if IsValid( ent ) then
					ent:SetPos(startpos)
					ent:SetOwner(pl)
					ent:Spawn()

					local phys = ent:GetPhysicsObject()
					if IsValid( phys ) then
						phys:SetVelocityInstantaneous( ang:Forward() * wep.ProjectileThrow * 0.65 )
					end
				end
			end

			pl:EmitSound(string.format("physics/body/body_medium_break%d.wav", math.random(2, 4)), 72, math.Rand(85, 95))
		end
	end
end

local function DoFleshThrow(pl, wep)
	if IsValid( pl ) and pl:Alive() and IsValid( wep ) then
		pl:ResetSpeed()
		pl.LastRangedAttack = CurTime()

		if SERVER then
			local startpos = pl:GetShootPos()
			local aimang = pl:EyeAngles()
			local ang

			for i = 1, wep.ProjectileBullets do
				ang = Angle( aimang.p, aimang.y, aimang.r )
				ang:RotateAroundAxis( ang:Up(), math.random( 2 ) * i )
				ang:RotateAroundAxis( ang:Right(), math.random( 2 ) * i )

				local ent = ents.Create( wep.ProjectileType )
				if IsValid( ent ) then
					ent:SetPos(startpos)
					ent:SetOwner(pl)
					ent:Spawn()

					local phys = ent:GetPhysicsObject()
					if IsValid( phys ) then
						phys:SetVelocityInstantaneous( ang:Forward() * wep.ProjectileThrow )
					end
				end
			end

			pl:EmitSound(string.format("physics/body/body_medium_break%d.wav", math.random(2, 4)), 72, math.Rand(85, 95))
		end
	end
end

function SWEP:Reload()
	local owner = self:GetOwner()
	if CurTime() < self:GetNextPrimaryFire() or CurTime() < self:GetNextSecondaryFire() or IsValid(owner.FeignDeath) then return end

	self:SetNextSecondaryFire( CurTime() + self.ProjectileNextThrow )
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	owner:DoZombieEvent()

	local sndname = "npc/fast_zombie/leap1.wav"
	for i = 1, 8 do
		timer.Create("reloadsound1" .. i, 0.04 * i, 1,
			function() if IsValid( owner ) then owner:EmitSound(sndname, 74, 175 - i*17, 1, CHAN_AUTO) end
		end)
	end		
	local sndname1 = "npc/strider/creak%d.wav"
	for i = 1, 8 do
		timer.Create("reloadsound2" .. i, 0.04 * i, 1,
			function() if IsValid( owner ) then owner:EmitSound(sndname1, 74, 155 + i*8, 1, CHAN_AUTO) end
		end)
	end

	owner:EmitSound("npc/fast_zombie/leap1.wav", 74, math.Rand(110, 130))
	owner:EmitSound("zombies/toxic_bomber_pain"..math.random(3)..".wav", 74, math.Rand(110, 130), 0.2)
	owner:EmitSound(string.format("physics/body/body_medium_break%d.wav", math.random(2, 4)), 74, math.Rand(85, 95))
	self:SendWeaponAnim(ACT_VM_HITCENTER)
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	timer.Simple(0.65, function() DoFleshThrow(owner, self) end)
	timer.Simple(0.35, function() DoFleshThrow1(owner, self) end)
end

function SWEP:StartMoaning()
end

function SWEP:StopMoaning()
end

function SWEP:IsMoaning()
	return false
end

function SWEP:PlayIdleSound()
	local owner = self:GetOwner()
	owner:EmitSound(string.format("npc/strider/creak%d.wav", math.random(4)), 70, math.random(95, 105))
	owner:EmitSound("zombies/bully_loop.wav", 70, math.random(65, 70))
	owner:EmitSound("zombies/bully_loop.wav", 70, math.random(55, 60))
	owner:EmitSound("zombies/bully_loop.wav", 70, math.random(35, 40))
end

function SWEP:PlayAlertSound()
	local owner = self:GetOwner()
	owner:EmitSound("npc/stalker/breathing3.wav", 70, math.random(110, 120))
	owner:EmitSound("zombies/archangel_fly"..math.random(2)..".wav", 70, math.random(80, 90))
end

function SWEP:PlayAttackSound()
	local owner = self:GetOwner()
		local sndname = "npc/metropolice/pain"..math.random(4)..".wav"
		for i = 1, 8 do
			timer.Create("attacksound1" .. i, 0.04 * i, 1,
				function() if IsValid( owner ) then owner:EmitSound(sndname, 74, 85 + i*17, 1, CHAN_AUTO) end
			end)
		end		
		local sndname1 = "npc/fast_zombie/leap1.wav"
		for i = 1, 5 do
			timer.Create("attacksound2" .. i, 0.04 * i, 1,
				function() if IsValid( owner ) then owner:EmitSound(sndname1, 74, 85 - i*6, 1, CHAN_AUTO) end
			end)
		end	
	owner:EmitSound("npc/fast_zombie/wake1.wav", 74, math.random(55, 45))
end

function SWEP:OnRemove()
	if IsValid( self:GetOwner() ) then
		self:StopMoaning()
	end
	for i = 1, 10 do
		timer.Remove("attacksound2" .. i)
		timer.Remove("attacksound1" .. i)
		timer.Remove("reloadsound2" .. i)
		timer.Remove("reloadsound1" .. i)
		timer.Remove("secondarysound2" .. i)
		timer.Remove("secondarysound1" .. i)
	end
	if CLIENT then
		self:Anim_Holster()
	end

	return true
end

if not CLIENT then return end

local matSheet = Material("models/humans/female/bloody/citizen_sheet")

function SWEP:PreDrawViewModel(vm, wep, pl)
	render.ModelMaterialOverride(matSheet)
	render.SetColorModulation( 0.45, 0.45, 0.5 )
end

function SWEP:PostDrawViewModel(vm, wep, pl)
	render.ModelMaterialOverride(nil)
	render.SetColorModulation( 1, 1, 1 )
end
