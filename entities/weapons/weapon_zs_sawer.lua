AddCSLuaFile()
DEFINE_BASECLASS( "weapon_zs_basemelee" )
SWEP.Base = "weapon_zs_basemelee"

SWEP.Slot = 1
SWEP.SlotPos = 0

SWEP.PrintName = translate.Get('wep_sawer')
SWEP.Description = translate.Get('wep_d_sawer')

SWEP.ViewModel = "models/weapons/cstrike/c_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.UseHands = true

SWEP.HoldType = "knife"

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 60
	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false

	SWEP.VElements = {
		["blade+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.043, 0, -7.791), angle = Angle(-90, 180, 0), size = Vector(0.229, 0.002, 0.04), color = Color(165, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade++"] = { type = "Model", model = "models/mechanics/gears2/pinion_80t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.799, 0, -8.028), angle = Angle(-90, 180, -90), size = Vector(0.034, 0.04, 0.011), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade+++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.252, 0, -7.756), angle = Angle(-90, 180, 0), size = Vector(0.229, 0.003, 0.029), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade+++++"] = { type = "Model", model = "models/hunter/triangles/025x025mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.63, 0, -12.538), angle = Angle(-28.082, 180, 90), size = Vector(0.125, 0.066, 0.024), color = Color(165, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade++++++"] = { type = "Model", model = "models/hunter/triangles/025x025mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.729, -0.001, -12.356), angle = Angle(-28.082, 180, 90), size = Vector(0.095, 0.05, 0.026), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.98, 1.189, -0.301), angle = Angle(0, 0, 0), size = Vector(0.421, 0.218, 1.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/blood3", skin = 0, bodygroup = {} },
		["element_name++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/bloodstain_003b", skin = 0, bodygroup = {} },
		["element_name+++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 3.657), angle = Angle(180, 0, 0), size = Vector(0.505, 0.262, 0.07), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, -3.138), angle = Angle(0, 90, 0), size = Vector(0.128, 0.168, 0.168), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/blood3", skin = 0, bodygroup = {} },
		["element_name++++++"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, -3.138), angle = Angle(0, 90, 0), size = Vector(0.13, 0.17, 0.17), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/bloodstain_003", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["blade+"] = { type = "Model", model = "models/hunter/blocks/cube075x075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.043, 0, -7.791), angle = Angle(-90, 180, 0), size = Vector(0.229, 0.002, 0.04), color = Color(165, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade++"] = { type = "Model", model = "models/mechanics/gears2/pinion_80t1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.799, 0, -8.028), angle = Angle(-90, 180, -90), size = Vector(0.034, 0.04, 0.011), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade+++"] = { type = "Model", model = "models/hunter/blocks/cube075x075x075.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.252, 0, -7.756), angle = Angle(-90, 180, 0), size = Vector(0.229, 0.003, 0.029), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade+++++"] = { type = "Model", model = "models/hunter/triangles/025x025mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.63, 0, -12.538), angle = Angle(-28.082, 180, 90), size = Vector(0.125, 0.066, 0.024), color = Color(165, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["blade++++++"] = { type = "Model", model = "models/hunter/triangles/025x025mirrored.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(-0.729, -0.001, -12.356), angle = Angle(-28.082, 180, 90), size = Vector(0.095, 0.05, 0.026), color = Color(255, 0, 0, 255), surpresslightning = false, material = "metal2", skin = 0, bodygroup = {} },
		["element_name"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.98, 1.189, -1.043), angle = Angle(0, 0, 0), size = Vector(0.421, 0.218, 1.012), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name+"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(180, 0, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/blood3", skin = 0, bodygroup = {} },
		["element_name++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(0, 180, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/bloodstain_003b", skin = 0, bodygroup = {} },
		["element_name+++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 3.657), angle = Angle(180, 0, 0), size = Vector(0.505, 0.262, 0.07), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name++++"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, -3.138), angle = Angle(0, 90, 0), size = Vector(0.128, 0.168, 0.168), color = Color(255, 255, 255, 255), surpresslightning = false, material = "models/props_wasteland/fence_sheet01", skin = 0, bodygroup = {} },
		["element_name+++++"] = { type = "Model", model = "models/props_junk/PopCan01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.422, 0.219, 1.013), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/blood3", skin = 0, bodygroup = {} },
		["element_name++++++"] = { type = "Model", model = "models/props_combine/breenclock.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "element_name", pos = Vector(0, 0, -3.138), angle = Angle(0, 90, 0), size = Vector(0.13, 0.17, 0.17), color = Color(255, 255, 255, 255), surpresslightning = false, material = "decals/bloodstain_003", skin = 0, bodygroup = {} }
	}

	SWEP.ViewModelBoneMods = {
		["v_weapon.Knife_Handle"] = { scale = Vector(1, 1, 1), pos = Vector(0, 0, -0.424), angle = Angle(0, 0, 0) }
	}

end

SWEP.Tier = 5

SWEP.MeleeType = "knife"

SWEP.MeleeDamage = 80
SWEP.OldMeleeDamage = 80
SWEP.MeleeRange = 54
SWEP.MeleeSize = 1.1
SWEP.InnateDamageType = INNATE_TYPE_BOUNTY
SWEP.InnateDamageMul = 0.1

SWEP.Primary.Delay = 0.79

SWEP.WalkSpeed = SPEED_FASTEST
SWEP.HitDecal = "Manhackcut"
SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
SWEP.MissGesture = SWEP.HitGesture
SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.MissAnim = ACT_VM_PRIMARYATTACK

SWEP.NoHitSoundFlesh = true
SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier( SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.05 )

function SWEP:SetAbility( a )
	self:SetDTFloat( 11, a )
end

function SWEP:GetAbility()
	return self:GetDTFloat( 11 )
end

function SWEP:PlaySwingSound()
	self:EmitSound( "weapons/knife/knife_slash" .. math.random( 2 ) .. ".wav", 72, math.Rand( 85, 95 ) )
end

function SWEP:PlayHitSound()
	self:EmitSound( "weapons/knife/knife_hitwall1.wav", 72, math.Rand( 75, 85 ) )
end

function SWEP:PlayHitFleshSound()
	self:EmitSound( "physics/flesh/flesh_squishy_impact_hard" .. math.random( 4 ) .. ".wav" )
	self:EmitSound( "physics/body/body_medium_break" .. math.random( 2, 4 ) .. ".wav" )
end

function SWEP:OnMeleeHit( hitent, hitflesh, tr )
	if hitent:IsPlayer()  and hitent:Team() == TEAM_ZOMBIE then
		hitent:AddArmDamage( 5 )
		if not self.m_BackStabbing and math.abs( hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw ) <= 90 then
			self.m_BackStabbing = true
			self.OldMeleeDamage = self.MeleeDamage
			self.MeleeDamage = self.MeleeDamage * 3
			hitent:AddArmDamage( 10 )
		end
	end
end

function SWEP:PostOnMeleeHit( hitent, hitflesh, tr )
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.OldMeleeDamage
	end
end

function SWEP:DealThink( dmginfo, ent)
	local getabil = self:GetAbility()
	if ent:IsValidLivingZombie() then
		self:SetAbility( math.min( 1, getabil + dmginfo:GetDamage() * 0.0006 ) )
	end
	if getabil >= 1 then
		for i = 1, 5 do
			timer.Simple( .6 * i, function() if IsValid( ent ) then ent:AddArmDamage( 25 ) end end)
		end
		local owner = self:GetOwner()
		ent:GiveStatus( "zombiestrdebuff", 5, owner )
		ent:AddArmDamage( 30 )

		self:EmitSound( "physics/body/body_medium_break" .. math.random( 2, 4 ) .. ".wav" , 100, math.random( 45, 50 ) )
		timer.Simple(0, function() ent:TakeSpecialDamage( self.MeleeDamage, DMG_SLASH, owner, self ) end)
		self:SetAbility( 0 )
	end
end


if SERVER then
	function SWEP:InitializeHoldType()
		self.ActivityTranslate = {}
		self.ActivityTranslate[ ACT_HL2MP_IDLE ] = ACT_HL2MP_IDLE_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_WALK ] = ACT_HL2MP_WALK_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_RUN ] = ACT_HL2MP_RUN_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_IDLE_CROUCH ] = ACT_HL2MP_IDLE_CROUCH_PHYSGUN
		self.ActivityTranslate[ ACT_HL2MP_WALK_CROUCH ] = ACT_HL2MP_WALK_CROUCH_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_GESTURE_RANGE_ATTACK ] = ACT_HL2MP_GESTURE_RANGE_ATTACK_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_GESTURE_RELOAD ] = ACT_HL2MP_GESTURE_RELOAD_KNIFE
		self.ActivityTranslate[ ACT_HL2MP_JUMP ] = ACT_HL2MP_JUMP_KNIFE
		self.ActivityTranslate[ ACT_RANGE_ATTACK1 ] = ACT_RANGE_ATTACK_KNIFE
	end
end

--function SWEP:OnZombieKilled()
--	self:EmitSound( "zombiesurvival/ui/misc2.ogg" )
--end
-- ХЗ ЧТО ЭТО, ДЖЕТ-В===3-БУМ ОСТАВИЛ 

if not CLIENT then return end

local matGradientRight = CreateMaterial("gradient-r", "UnlitGeneric", {["$basetexture"] = "vgui/gradient-r", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1", ["$ignorez"] = "1", ["$nomip"] = "1"})
local colbg = Color( 0, 0, 0, 155 )
local colcr = Color( 75, 25, 25, 100 )
function SWEP:Draw2DHUD( x, y )
	local owner = self:GetOwner()

    local ability = self:GetAbility()
	
	self:Draw2DFeature( ability, nil, nil, "weapon_ability_sawer", "ZSHUDFontSmallest", ability >= 1 and Color( 255, 55, 25 ) or colcr )

end