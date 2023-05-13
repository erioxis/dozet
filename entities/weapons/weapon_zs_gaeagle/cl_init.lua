INC_CLIENT()
SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = true
SWEP.UseHands = false
SWEP.ViewModel = "models/weapons/v_pist_deagle.mdl"
SWEP.WorldModel = "models/weapons/w_pist_deagle.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.ViewModelBoneMods = {}
SWEP.VElements = {
	["d2"] = { type = "Model", model = "models/props_combine/combine_barricade_med02c.mdl", bone = "v_weapon.Deagle_Parent", rel = "", pos = Vector(-0.601, 2.596, 0), angle = Angle(180, 0, 0), size = Vector(0.019, 0.019, 0.019), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d1"] = { type = "Model", model = "models/props_combine/combine_barricade_short03a.mdl", bone = "v_weapon.Deagle_Parent", rel = "", pos = Vector(-0.301, 3.359, 4.675), angle = Angle(-26.883, -180, -94.676), size = Vector(0.041, 0.041, 0.041), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d4"] = { type = "Model", model = "models/props_combine/weaponstripper.mdl", bone = "v_weapon.Deagle_Slide", rel = "", pos = Vector(-0.601, 0, -2), angle = Angle(-99.351, -180, -180), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["d3"] = { type = "Model", model = "models/props_combine/pipes01_cluster02a.mdl", bone = "v_weapon.Deagle_Parent", rel = "", pos = Vector(-0.519, 2.596, 7.791), angle = Angle(180, -180, 0), size = Vector(0.009, 0.009, 0.009), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
function SWEP:Draw2DHUD()
	local stacks = self:GetOwner():GetAmmoCount("pulse")
	local ablicolor = Color( 0, 255* math.max(stacks, 0.1), 0 * math.min(stacks, 0.65) )
	self:Draw2DFeature( stacks/30, 1, nil, "wep_gaegle_d2", "ZSHUDFontSmallest", ablicolor )
	self.BaseClass.Draw2DHUD(self)
end

function SWEP:Draw3DHUD(vm, pos, ang)
	local wid, hei = 60, 150
	local x, y = wid * -0.5, hei * -0.8
	local stacks = self:GetOwner():GetAmmoCount("pulse")
	local color = Color( 0, 255* math.max(stacks, 0.1), 0 * math.min(stacks, 0.65) )
	pos = pos + Vector(0,0,1)
	ang = ang + Angle(0,0,180)
	cam.Start3D2D( pos, ang, self.HUD3DScale / 6 )
			self:Draw3DFeatureHorizontal( vm, pos, ang, stacks/30, 1, nil, "wep_gaegle_d3", "ZSHUDFont", color )
	cam.End3D2D()
	self.BaseClass.Draw2DHUD(self)
end