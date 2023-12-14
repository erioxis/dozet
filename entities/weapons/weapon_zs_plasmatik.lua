AddCSLuaFile()
DEFINE_BASECLASS("weapon_zs_base")

--SWEP.PrintName = "'Plasmatik' Улучшенная версия"
--SWEP.Description = "Плазма пушка."
SWEP.PrintName = ""..translate.Get("wep_plasmatik")
SWEP.Description = ""..translate.Get("wep_d_plasmatik")

SWEP.Slot = 2
SWEP.SlotPos = 0

SWEP.VElements = {
	["v_10"] = { type = "Model", model = "models/props_combine/combine_fence01a.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0.958, 1, 5.431), angle = Angle(-2.362, -6.198, -179.508), size = Vector(0.05, 0.05, 0.05), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["v_11"] = { type = "Model", model = "models/props_combine/combine_emitter01.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.09, 0.5, -0.004), angle = Angle(-84.399, 0.4, 11.6), size = Vector(0.123, 0.123, 0.123), color = Color(255, 0, 0, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} },
	["v_12"] = { type = "Model", model = "models/props_combine/combine_barricade_bracket01b.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.133, -1, -0.004), angle = Angle(92.83, 174.34, -172.075), size = Vector(0.123, 0.123, 0.123), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["v_8"] = { type = "Model", model = "models/props_combine/combine_mine01.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(-0.821, 0, -0.015), angle = Angle(167.431, -106.277, 87.061), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["v_9"] = { type = "Model", model = "models/props_combine/combinethumper001a.mdl", bone = "ValveBiped.square", rel = "", pos = Vector(0.284, 0, 14.1), angle = Angle(-5.934, -1.203, 176.12601), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
SWEP.WElements = {
	["element_nam2"] = { type = "Model", model = "models/props_combine/combine_emitter01.mdl", bone = "ValveBiped.Bip01_R_Finger0", rel = "", pos = Vector(4.025, -3.019, -3.019), angle = Angle(144.13, 71.259, 116.716), size = Vector(0.1, 0.1, 0.1), color = Color(255, 0, 0, 255), surpresslightning = true, material = "", skin = 0, bodygroup = {} },
	["element_name"] = { type = "Model", model = "models/props_combine/combine_mine01.mdl", bone = "ValveBiped.Anim_Attachment_RH", rel = "", pos = Vector(0, -2.013, 2.642), angle = Angle(73.795, 129.05701, -129.05701), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["element_name1"] = { type = "Model", model = "models/props_combine/combinethumper002.mdl", bone = "ValveBiped.Bip01_R_Finger2", rel = "", pos = Vector(5.772, -3.971, -3.175), angle = Angle(-23.673, -47.636, -84.851), size = Vector(0.02, 0.02, 0.02), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}



SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "pistol"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = true
SWEP.CSMuzzleFlashes = false

SWEP.ReloadSound = Sound("Weapon_SMG1.Reload")
SWEP.Primary.Sound = Sound("Airboat.FireGunHeavy")
SWEP.Primary.Damage = 46
SWEP.Primary.NumShots = 3
SWEP.Primary.Delay = 0.44
SWEP.Culinary = true
SWEP.RequiredClip = 3

SWEP.Primary.ClipSize = 28
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pulse"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 4
SWEP.ConeMin = 0.4

SWEP.WalkSpeed = SPEED_SLOW

SWEP.IronSightsPos = Vector(-3, 1, 1)

SWEP.Tier = 6
SWEP.MaxStock = 2

SWEP.PointsMultiplier = GAMEMODE.PulsePointsMultiplier

SWEP.TracerName = "AR2Tracer"

SWEP.FireAnimSpeed = 0.4
SWEP.LegDamage = 5

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.014, 1)


function SWEP.BulletCallback(attacker, tr, dmginfo)
	local ent = tr.Entity
	if ent:IsValidZombie() then
		local activ = attacker:GetActiveWeapon()
		ent:AddLegDamageExt(activ.LegDamage, attacker, activ, SLOWTYPE_PULSE)
	end

	if IsFirstTimePredicted() then
		util.CreatePulseImpactEffect(tr.HitPos, tr.HitNormal)
	end
	attacker:GetActiveWeapon().BaseClass.BulletCallback(attacker, tr, dmginfo)
end
