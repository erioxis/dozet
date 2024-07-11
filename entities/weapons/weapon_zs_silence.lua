AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
local BaseClassGun = baseclass.Get( "weapon_zs_base" )
SWEP.Base = "weapon_zs_basemelee"

SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.PrintName = translate.Get('wep_silence')
SWEP.Description = translate.Get('wep_d_silence')

SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DPos = Vector(0, -1.2, -3)
SWEP.HUD3DAng = Angle(180, -90, 90)
SWEP.HUD3DScale = 0.055

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
if CLIENT then
    SWEP.ViewModelFOV = 82
    SWEP.ShowViewModel = false
    SWEP.ShowWorldModel = false

end
SWEP.ViewModelBoneMods = {
    ["ValveBiped.Bip01_R_Hand"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, 0), angle = Angle(0.337, 19.408, 0) }
}

SWEP.VElements = {
    ["element_name"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.709, 2.993, -10.152), angle = Angle(0, 55.576, 0), size = Vector(1.137, 1.137, 1.137), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.209, 0.209, 0.209), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.109, 13.037, -18.321), angle = Angle(162.62399, 90, -90), size = Vector(2.774, 1.544, 7.208), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.094, -3.588, 22.489), angle = Angle(0, 180, 0), size = Vector(0.445, 0.445, 1.276), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name++++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.054, -3.462, 30.649), angle = Angle(180, 180, 0), size = Vector(0.41, 0.41, 0.188), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.271, 0.183, 0.183), color = Color(255, 255, 255, 255), surpresslightning = true, material = "shadertest/sphericalenvmap", skin = 0, bodygroup = {} },
    ["element_name++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_eye.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.338, 1.077, -15.481), angle = Angle(103.974, 90, 0), size = Vector(0.23, 0.036, 0.113), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_eye.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.424, 1.127, -15.755), angle = Angle(8.529, 88.806, 0), size = Vector(0.01, 0.072, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/shadertest/vertexlitselfillumenvmappedtexturev2", skin = 0, bodygroup = {} },
    ["element_name++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_medium_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.484, -4.324, -24.46), angle = Angle(-90.788, 180, 180), size = Vector(0.636, 0.657, 0.754), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.276, 0.183, 0.183), color = Color(255, 255, 255, 61), surpresslightning = false, material = "models/xqm/lightlinesred_tool", skin = 0, bodygroup = {} },
    ["element_name++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.288, 0.163, 0.163), color = Color(0, 95, 35, 255), surpresslightning = true, material = "shadertest/unlitsinglecolordetail", skin = 0, bodygroup = {} },
    ["element_name+++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.289, 0.163, 0.163), color = Color(255, 255, 255, 31), surpresslightning = false, material = "models/xqm/lightlinesred_tool", skin = 0, bodygroup = {} },
    ["element_name++++++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.688, 3.647, -15.97), angle = Angle(-169.397, 90, 180), size = Vector(0.057, 0.082, 0.082), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.28, 0.17, 0.17), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.739, 3.432, -14.237), angle = Angle(147.05099, 90, 180), size = Vector(0.033, 0.082, 0.082), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++"] = { type = "Model", model = "models/props_combine/stasisvortex.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.545, 1.548, -12.915), angle = Angle(8.022, 90, 180), size = Vector(0.004, 0.004, 0.006), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.592, -3.595, -14.778), angle = Angle(117.911, 90, 180), size = Vector(0.034, 0.011, 0.027), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++"] = { type = "Model", model = "models/props_c17/oildrumchunk01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.077, 1.511, -19.021), angle = Angle(0, 30.702, -180), size = Vector(0.06, 0.164, 0.086), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.109, 13.037, -18.321), angle = Angle(162.62399, 90, -90), size = Vector(2.794, 1.564, 7.228), color = Color(0, 255, 106, 231), surpresslightning = true, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_medium_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.484, -4.324, -24.46), angle = Angle(-90.788, 180, 180), size = Vector(0.656, 0.658, 0.074), color = Color(0, 255, 63, 40), surpresslightning = false, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++++++"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.709, 2.993, -10.152), angle = Angle(0, 55.576, 0), size = Vector(1.157, 1.157, 1.157), color = Color(0, 255, 89, 10), surpresslightning = false, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0.393, 1.504, -15.525), angle = Angle(0, 0, 0), size = Vector(0.209, 0.209, 0.209), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} }
}
 
SWEP.WElements = {
    ["element_name"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.709, 2.993, -10.152), angle = Angle(0, 55.576, 0), size = Vector(1.137, 1.137, 1.137), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.209, 0.209, 0.209), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.109, 13.037, -18.321), angle = Angle(162.62399, 90, -90), size = Vector(2.774, 1.544, 7.208), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.094, -3.588, 22.489), angle = Angle(0, 180, 0), size = Vector(0.445, 0.445, 1.276), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name++++"] = { type = "Model", model = "models/props_lab/jar01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.054, -3.462, 30.649), angle = Angle(180, 180, 0), size = Vector(0.41, 0.41, 0.188), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.271, 0.183, 0.183), color = Color(255, 255, 255, 255), surpresslightning = true, material = "shadertest/sphericalenvmap", skin = 0, bodygroup = {} },
    ["element_name++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_eye.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.338, 1.077, -15.481), angle = Angle(103.974, 90, 0), size = Vector(0.23, 0.036, 0.113), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++"] = { type = "Model", model = "models/gibs/gunship_gibs_eye.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.424, 1.127, -15.755), angle = Angle(8.529, 88.806, 0), size = Vector(0.01, 0.072, 0.107), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/shadertest/vertexlitselfillumenvmappedtexturev2", skin = 0, bodygroup = {} },
    ["element_name++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_medium_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.484, -4.324, -24.46), angle = Angle(-90.788, 180, 180), size = Vector(0.636, 0.657, 0.754), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} },
    ["element_name+++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.276, 0.183, 0.183), color = Color(255, 255, 255, 61), surpresslightning = false, material = "models/xqm/lightlinesred_tool", skin = 0, bodygroup = {} },
    ["element_name++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.288, 0.163, 0.163), color = Color(0, 95, 35, 255), surpresslightning = true, material = "shadertest/unlitsinglecolordetail", skin = 0, bodygroup = {} },
    ["element_name+++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.289, 0.163, 0.163), color = Color(255, 255, 255, 31), surpresslightning = false, material = "models/xqm/lightlinesred_tool", skin = 0, bodygroup = {} },
    ["element_name++++++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.688, 3.647, -15.97), angle = Angle(-169.397, 90, 180), size = Vector(0.057, 0.082, 0.082), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.013, 1.504, -15.525), angle = Angle(0, 180, 0), size = Vector(0.28, 0.17, 0.17), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.739, 3.432, -14.237), angle = Angle(147.05099, 90, 180), size = Vector(0.033, 0.082, 0.082), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++"] = { type = "Model", model = "models/props_combine/stasisvortex.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.545, 1.548, -12.915), angle = Angle(8.022, 90, 180), size = Vector(0.004, 0.004, 0.006), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++"] = { type = "Model", model = "models/props_combine/breen_arm.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.592, -3.595, -14.778), angle = Angle(117.911, 90, 180), size = Vector(0.034, 0.011, 0.027), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++"] = { type = "Model", model = "models/props_c17/oildrumchunk01b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.077, 1.511, -19.021), angle = Angle(0, 30.702, -180), size = Vector(0.06, 0.164, 0.086), color = Color(0, 0, 0, 255), surpresslightning = false, material = "models/mortarsynth/mortar_main", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++++"] = { type = "Model", model = "models/gibs/manhack_gib05.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.109, 13.037, -18.321), angle = Angle(162.62399, 90, -90), size = Vector(2.794, 1.564, 7.228), color = Color(0, 255, 106, 231), surpresslightning = true, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++++"] = { type = "Model", model = "models/gibs/antlion_gib_medium_1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.484, -4.324, -24.46), angle = Angle(-90.788, 180, 180), size = Vector(0.656, 0.658, 0.074), color = Color(0, 255, 63, 40), surpresslightning = false, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name++++++++++++++++++++"] = { type = "Model", model = "models/props_junk/meathook001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.709, 2.993, -10.152), angle = Angle(0, 55.576, 0), size = Vector(1.157, 1.157, 1.157), color = Color(0, 255, 89, 10), surpresslightning = false, material = "shadertest/texturescroll", skin = 0, bodygroup = {} },
    ["element_name+++++++++++++++++++++"] = { type = "Model", model = "models/props_trainstation/trainstation_clock001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0.393, 1.504, -15.525), angle = Angle(0, 0, 0), size = Vector(0.209, 0.209, 0.209), color = Color(40, 40, 40, 255), surpresslightning = false, material = "models/combine_advisor/arm", skin = 0, bodygroup = {} }
}

SWEP.Tier = 6
-- ЫЭЪЪ((((ТОЙКА ПОСТАВЬБ БПЖ СЮДА СОВЙ ТИРР((9(9(
SWEP.MeleeType = "scythe"

SWEP.MeleeDamage = 220
SWEP.MeleeRange = 76
SWEP.MeleeSize = 5

SWEP.OldMeleeRange = 96
SWEP.OldMeleeSize = 7

SWEP.OldPos = Vector( 0, 0, 0 )

SWEP.Primary.Delay = 1

SWEP.SwingRotation = Angle( 30, -20, 10 )
SWEP.SwingOffset = Vector( 0, -30, 0 )
SWEP.SwingTime = 0.6
SWEP.SwingHoldType = "melee"

SWEP.CanPierce = true

SWEP.Dashing = false

SWEP.WalkSpeed = SPEED_SLOW

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.03 )

function SWEP:Initialize()
    self.BaseClass.Initialize(self)

    self.ChargeSound = CreateSound(self, "plats/platform_citadel_ring.wav")
    self.ChargeSound2 = CreateSound(self, "weapons/physcannon/energy_sing_loop4.wav")
end

function SWEP:SetAbility( a )
    self:SetDTFloat( 11, a )
end

function SWEP:GetAbility()
    return self:GetDTFloat( 11 )
end

function SWEP:PlayAttackSound() 
    local owner = self:GetOwner()
    for i = 1, 5 do
        timer.Simple( i * .02, function()
            owner:EmitSound("ambient/machines/catapult_throw.wav", 75, 55 + i * 5, 0.2 )
        end)
    end
end

function SWEP:PlaySwingSound()
    self:GetOwner():EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 35, 45 ) )
    self:PlayAttackSound()
end

function SWEP:PlayHitSound()
    self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, math.random( 70,85 ) * ( self.Dashing and 2 or 1 ), self.Dashing and 0.5 or 0.7 )
    self:PlayAttackSound()
end

function SWEP:SendWeaponAnimation()
    if self:GetIronsights() then
        if SERVER then
            net.Start( "zs_lastsucshot" )
            net.Send( self:GetOwner() )
        end
    else
        self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
        self:GetOwner():GetViewModel():SetPlaybackRate(0.7)
    end
end

function SWEP:Think()
    local owner = self:GetOwner()

    if self.IdleAnimation and self.IdleAnimation <= CurTime() then
        self.IdleAnimation = nil
        self:SendWeaponAnim( ACT_VM_IDLE )
    end

    if self:GetAbility() <= 0 then
        self.ChargeSound:Stop()
        self.ChargeSound2:Stop()
    end
    
    if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
        self:StopSwinging()
        self:MeleeSwing()
    end

    if self.Dashing then
        self.ChargeSound:PlayEx( 1, 125, 1 ) 
        self.ChargeSound2:PlayEx( 1, 255, 1 )
    else
        self.ChargeSound:Stop()
        self.ChargeSound2:Stop()
    end
    BaseClass.Think(self)

end

function SWEP:Holster()
    if CurTime() >= self:GetSwingEnd() and not self:GetOwner():GetStatus( "cyclone" ) and not self.Dashing then
        if CLIENT then
            self:Anim_Holster()
        end

        return true
    end

    return false
end
function SWEP:DealThink( dmginfo, ent)
    if ent:IsValidLivingZombie() then
        self:SetAbility( self.Dashing and 0 or math.min( 1, self:GetAbility() + dmginfo:GetDamage() * 0.000071 ) )
    end
end

local function DoDash( self, owner, zombie )

    local effectdata = EffectData()
        effectdata:SetOrigin( zombie:WorldSpaceCenter() )
        effectdata:SetStart( owner:WorldSpaceCenter() )
        effectdata:SetEntity( owner )
    util.Effect( "tracer_healray", effectdata )

    owner:SetPos( zombie:GetPos() - zombie:GetAimVector() * 50 )

    owner:SetEyeAngles( zombie:EyeAngles() )

    owner:EmitSound( "friends/friend_online.wav", 100, math.random( 245, 255 ) )

    timer.Simple( .02, function()
        zombie:SetLocalVelocity( Vector( 0, 0, 0 ) )
        for i = 1, 2 do
            timer.Simple( .05 * i, function() self:MeleeSwing() end)
        end
    end)
end

local function DoNotDash( self )
    self.Dashing = false
    self.MeleeRange = self.OldMeleeRange
    self.MeleeSize = self.OldMeleeSize
    local owner = self:GetOwner()

    local effectdata = EffectData()
        effectdata:SetOrigin( self.OldPos + Vector( 0, 0, 35 ) )
        effectdata:SetStart( owner:WorldSpaceCenter() )
        effectdata:SetEntity( owner )
    util.Effect( "tracer_healray", effectdata )

    owner:SetPos( self.OldPos )
    if SERVER then
        self:GetOwner():GodDisable() 
    end
end

function SWEP:HaveAbility()
    if self:GetAbility() >= 1 then
        self:SetAbility( 0 )
        local owner = self:GetOwner()
        local pos = owner:GetPos()
        local count = 0

        if SERVER then
            owner:GodEnable()
        end

        self.Dashing = true
        self.MeleeRange = 150
        self.MeleeSize = 25
        self.OldPos = pos
        for v, k in ipairs( ents.FindInSphere( pos, 550 ) ) do
            if k:IsValidLivingZombie() then
                local zpos = k:GetPos()
                count = count + 1

                timer.Simple( count * .2, function()
                    DoDash( self, owner, k ) 
                end)
            end
        end

        timer.Simple( count * .21, function() DoNotDash( self ) end)
            local effectdata = EffectData()
        for i = 1, 10 do
            timer.Simple( i * .05, function() effectdata:SetOrigin( pos + Vector( 0, 0, 5 * i ) ) util.Effect( "explosion_nuclearminigun", effectdata ) end)
        end

        owner:EmitSound("ambient/levels/labs/electric_explosion2.wav", 75, 255, 1)
        for i = 1, 15 do
            timer.Simple( i * .05, function()
                owner:EmitSound("npc/combine_gunship/see_enemy.wav", 75, 25 + i * 15, 1 )
            end)
        end
        owner:EmitSound("npc/scanner/cbot_energyexplosion1.wav", 75, 45, 1)
    end
end

local function getrandombonepos( pl, i )
    local bone = pl:GetBoneMatrix( i )

    return bone and bone:GetTranslation() or pl:GetShootPos()
end

if not CLIENT then return end

local matGradientRight = CreateMaterial("gradient-r", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-r", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
local colbg = Color( 0, 0, 0, 155 )
local colcr = Color( 5, 255, 155, 100 )

local nextWemit = 0
local nextVemit = 0

local function doemit( self, pos, dsh )
    if math.random() < .9 then return end
    local emitter = ParticleEmitter( pos )
    emitter:SetNearClip(24, 32)
    pos = not dsh and pos or getrandombonepos( self:GetOwner(), math.random( 1, 25 ) )
    local particle = emitter:Add("sprites/glow04_noz", pos + VectorRand():GetNormalized() * 10 )
    if particle then
        particle:SetDieTime( math.Rand( 0.25, 0.35 ) * ( dsh and 15 or 1 ) )
        particle:SetStartSize( math.Rand( 5, 7 ) * ( dsh and 3 or 1 ) )
        particle:SetEndSize(0)
        particle:SetColor( 25,255,145 )
        particle:SetStartAlpha( 75 * ( dsh and 2 or 1 ) )
        particle:SetEndAlpha(0)
        particle:SetRoll( math.random( 0, 360 ) )
        particle:SetVelocity( VectorRand():GetNormalized() * 5 * ( dsh and 5 or 1 ) )
    end

    emitter:Finish() emitter = nil collectgarbage("step", 64)
end

function SWEP:DrawWorldModel()
    local time = CurTime()
    for k, v in pairs( self.WElements ) do
        if k then
            local topos, toang = self:GetBoneOrientation( self.WElements, v, self:GetOwner() ) 
            doemit( self, topos + toang:Forward() * v.pos.x + toang:Right() * v.pos.y + toang:Up() * v.pos.z, self.Dashing )
        end
    end
    self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

function SWEP:PostDrawViewModel(vm)
    if self.ShowViewModel == false then
        render.SetBlend(1)
    end

    local time = CurTime()
    for k, v in pairs( self.VElements ) do
        if k then
            local topos, toang = self:GetBoneOrientation( self.VElements, v, self:GetOwner():GetViewModel() ) 
            doemit( self, topos + toang:Forward() * v.pos.x + toang:Right() * v.pos.y + toang:Up() * v.pos.z, self.Dashing )
        end
    end
end

function SWEP:Draw2DHUD( )
    local owner = self:GetOwner()

    local ability = self:GetAbility()
  
    self:Draw2DFeature( self:GetAbility(), nil, nil, "weapon_ability_silence" , "ZSHUDFontSmallest", ability >= 1 and Color( 65, 255, 15 ) or colcr )
end
