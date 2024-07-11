AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base = "weapon_zs_basemelee"

SWEP.PrintName = translate.Get("wep_refraction")
SWEP.Description = translate.Get("wep_d_refraction")

SWEP.Secondary.ClipSize = 0
SWEP.Secondary.DefaultClip = 0
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = true

SWEP.Slot = 0
SWEP.SlotPos = 0

SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DPos = Vector(0, -1, -7)
SWEP.HUD3DAng = Angle(180, -90, 90)
SWEP.HUD3DScale = 0.055

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
if CLIENT then
	SWEP.ViewModelFOV = 71
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_c17/column02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.193, 1.281, -16.145), angle = Angle(0, -15.812, 0), size = Vector(0.049, 0.049, 0.039), color = Color(195, 195, 195, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2.351), angle = Angle(0, 0, 0), size = Vector(0.144, 0.144, 0.017), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.416), angle = Angle(0, 0, 0), size = Vector(0.104, 0.104, 0.017), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2.574), angle = Angle(0, 0, 0), size = Vector(0.114, 0.114, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 24.65), angle = Angle(0, 0, 0), size = Vector(0.094, 0.094, 0.008), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+++++"] = { type = "Model", model = "models/props_trainstation/clock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 2.609, -0.407), angle = Angle(171.983, 90, 0), size = Vector(0.053, 0.202, 0.02), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_trainstation/clock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -2.609, -0.407), angle = Angle(-171.983, 90, 0), size = Vector(0.053, 0.202, 0.02), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["mbability"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 0), surpresslightning = false, material = "effects/breenscreen_static01_", skin = 0, bodygroup = {} },
		["molot"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -2.078), angle = Angle(0, 0, 0), size = Vector(0.499, 0.499, 0.499), color = Color(0, 0, 0, 0), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0.1, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.1, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.1, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(-0.1, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0.1, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0.1, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 255), surpresslightning = false, material = "effects/strider_pinch_dudv", skin = 0, bodygroup = {} },
		["molot+++++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 72), surpresslightning = false, material = "effects/flashlight/view", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_c17/column02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.193, 1.281, -16.145), angle = Angle(0, -15.812, 0), size = Vector(0.049, 0.049, 0.039), color = Color(195, 195, 195, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2.351), angle = Angle(0, 0, 0), size = Vector(0.144, 0.144, 0.017), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.416), angle = Angle(0, 0, 0), size = Vector(0.104, 0.104, 0.017), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 2.574), angle = Angle(0, 0, 0), size = Vector(0.114, 0.114, 0.017), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++++"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 24.65), angle = Angle(0, 0, 0), size = Vector(0.094, 0.094, 0.008), color = Color(255, 255, 255, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base+++++"] = { type = "Model", model = "models/props_trainstation/clock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 2.609, -0.407), angle = Angle(171.983, 90, 0), size = Vector(0.053, 0.202, 0.02), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["base++++++"] = { type = "Model", model = "models/props_trainstation/clock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -2.609, -0.407), angle = Angle(-171.983, 90, 0), size = Vector(0.053, 0.202, 0.02), color = Color(150, 150, 150, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["mbability"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 0), surpresslightning = false, material = "effects/breenscreen_static01_", skin = 0, bodygroup = {} },
		["molot"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+"] = { type = "Model", model = "models/Combine_Helicopter/helicopter_bomb01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -2.078), angle = Angle(0, 0, 0), size = Vector(0.499, 0.499, 0.499), color = Color(0, 0, 0, 0), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.1, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.1, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.1, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-0.1, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.1, -0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot+++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.1, 0.1, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(0, 0, 0, 255), surpresslightning = false, material = "shadertest/vertextexturetest", skin = 0, bodygroup = {} },
		["molot++++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 255), surpresslightning = false, material = "effects/strider_pinch_dudv", skin = 0, bodygroup = {} },
		["molot+++++++++++"] = { type = "Model", model = "models/props_junk/wood_crate001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, -8.289), angle = Angle(0, 0, 0), size = Vector(0.577, 0.32, 0.268), color = Color(255, 255, 255, 72), surpresslightning = false, material = "effects/flashlight/view", skin = 0, bodygroup = {} }
	}
end

SWEP.Tier = 3

SWEP.MeleeType = "mace"

SWEP.MeleeDamage = 130
SWEP.MeleeRange = 79
SWEP.MeleeSize = 4

SWEP.Primary.Delay = 1.4

SWEP.SwingRotation = Angle( 30, -20, 10 )
SWEP.SwingOffset = Vector( 0, -30, 0 )
SWEP.SwingTime = 0.8
SWEP.SwingHoldType = "melee"

SWEP.WalkSpeed = SPEED_SLOW

SWEP.AllowQualityWeapons = true

SWEP.Ability = true
SWEP.AbilityText = "refraction"
SWEP.AbilityColor = Color( 100, 55, 55, 255 )
SWEP.AbilityMax = SWEP.MeleeDamage * 2

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05 )

function SWEP:SetAbility( a )
	self:SetDTFloat( 11, a )
end

function SWEP:GetAbility()
	return self:GetDTFloat( 11 )
end

function SWEP:PlaySwingSound()
	self:GetOwner():EmitSound( "weapons/iceaxe/iceaxe_swing1.wav", 75, math.random( 135, 145 ) )
	self:GetOwner():EmitSound( "npc/scanner/scanner_nearmiss"..math.random(2)..".wav", 75, math.random( 75, 85 ) )
end

function SWEP:PlayHitSound()
	self:GetOwner():EmitSound( "ambient/machines/slicer" .. math.random( 4 ) .. ".wav", 75, math.random(40,45) )
end

function SWEP:OnHitEntityOverride( ent, dmginfo )
	if ent:IsValidLivingZombie() then
		self:SetAbility( math.min( 1, self:GetAbility() + dmginfo:GetDamage() * 0.0045 ) )
	end
end

function SWEP:HaveAbility()
	if self:GetAbility() >= 1 then
		local ent = ents.Create( "projectile_refraction" )
		if ent:IsValid() then
			local owner = self:GetOwner()
			ent:SetPos( owner:GetPos() )

			local angle = owner:GetAngles()
			ent:SetAngles( angle )

			ent:SetOwner( owner )

			ent.ProjDamage = self.MeleeDamage * 3 * ( owner.AbilityDamageMul or 1 ) * ( owner.ProjectileDamageMul or 1 )
			ent.ProjSource = self
			ent.Team = self:GetOwner():Team()
			ent.Vec = angle:Forward() * 75 * ( owner.ProjectileSpeedMul or 1 )

			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()

				phys:SetVelocityInstantaneous( angle:Forward() * 75 * ( owner.ProjectileSpeedMul or 1 ) )
			end
		end
	end

end

if not CLIENT then return end

local function getsinusoid( x )
	return ( math.sin( math.tan( x ) * math.cos( x ) * 2.9 ) + math.sin( x * .33 ) + math.cos( x * .25 ) ) * 45
end

function SWEP:DrawWorldModel()
	local time = UnPredictedCurTime()
	self.WElements[ "mbability" ].color = Color( getsinusoid( math.sin( time ) * 5 ), getsinusoid( time * 3 ), getsinusoid( math.cos( time ) ), self:GetAbility() * 75 )
	self.BaseClass.DrawWorldModel(self)
end
SWEP.DrawWorldModelTranslucent = SWEP.DrawWorldModel

function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
        render.SetBlend(1)
    end
    local time = UnPredictedCurTime()
	self.VElements[ "mbability" ].color = Color( getsinusoid( math.sin( time ) * 25 ), getsinusoid( time * 15 ), getsinusoid( math.cos( time ) * 5 ), self:GetAbility() * 75 )
end