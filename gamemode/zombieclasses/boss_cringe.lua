CLASS.Name = "The Cringe+"
CLASS.TranslationName = "class_cringe"
CLASS.Description = "description_the_tickle_monster"
CLASS.Help = "controls_the_tickle_monster"


CLASS.KnockbackScale = 0
CLASS.Wave = 11 / 12
--[[CLASS.Pac3Out =  {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["DrawOrder"] = 0,
				["UniqueID"] = "6531e91f464e71e52f39ed8d1ae6d157545a77aee4025a955a26e3a65c656aca",
				["TargetEntityUID"] = "",
				["IgnoreZ"] = false,
				["BlurX"] = 64.2,
				["SphericalSize"] = -64.4,
				["AffectChildren"] = false,
				["Passes"] = 35.2,
				["Name"] = "",
				["IsDisturbing"] = false,
				["Amount"] = 1.3,
				["ClassName"] = "halo",
				["BlurY"] = 2,
				["Shape"] = 1,
				["Color"] = Vector(57, 23, 229),
				["EditorExpand"] = false,
				["Additive"] = true,
				["Hide"] = false,
			},
		},
		[2] = {
			["children"] = {
			},
			["self"] = {
				["Skin"] = 0,
				["Invert"] = false,
				["LightBlend"] = 1,
				["CellShade"] = 0,
				["AimPartName"] = "",
				["IgnoreZ"] = true,
				["AimPartUID"] = "",
				["Passes"] = 0.9,
				["Name"] = "",
				["Angles"] = Angle(-12.302355766296, 62.394065856934, 97.595199584961),
				["DoubleFace"] = true,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 1.7,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(0, 0, 0),
				["Alpha"] = 0.925,
				["LodOverride"] = -0.6,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "spine 2",
				["Color"] = Vector(192, 0, 250),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(-6.6866455078125, -6.3800277709961, 27.375244140625),
				["NoTextureFiltering"] = false,
				["AlternativeScaling"] = false,
				["Hide"] = false,
				["Translucent"] = true,
				["Scale"] = Vector(1, 1, 1),
				["ClassName"] = "model",
				["EditorExpand"] = false,
				["Size"] = 0.85,
				["ModelFallback"] = "",
				["AngleOffset"] = Angle(0, 0, 0),
				["TextureFilter"] = 3,
				["Model"] = "models/gman_high.mdl",
				["UniqueID"] = "b20033d44f01ac7489098cd55ff4e73a5ac52773ee4c3571887a7e5aff34c074",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "12245f8801468715e0b9c1827d913de8b480287308c0b32e128c851ef4538aed",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "мой костюм",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
},
}]]

CLASS.Health = 7000
CLASS.Speed = 120
CLASS.Hidden = false

CLASS.FearPerInstance = 1
CLASS.NoSlowdown = true

CLASS.CanTaunt = true

CLASS.SWEP = "weapon_zs_cringe"

CLASS.Model = Model("models/player/zombie_classic_hbfix.mdl")
CLASS.OverrideModel = Model("models/player/zombie_fast.mdl")

CLASS.VoicePitch = 0.8

CLASS.PainSounds = {"npc/zombie/zombie_pain1.wav", "npc/zombie/zombie_pain2.wav", "npc/zombie/zombie_pain3.wav", "npc/zombie/zombie_pain4.wav", "npc/zombie/zombie_pain5.wav", "npc/zombie/zombie_pain6.wav"}
CLASS.DeathSounds = {"npc/zombie/zombie_die1.wav", "npc/zombie/zombie_die2.wav", "npc/zombie/zombie_die3.wav"}

CLASS.ViewOffset = Vector(0, 0, 80)
CLASS.ViewOffsetDucked = Vector(0, 0, 50)
CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 86)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 48)}

local math_random = math.random
local bit_band = bit.band
local math_Approach = math.Approach
local math_min = math.min
local math_ceil = math.ceil
local math_Clamp = math.Clamp
local CurTime = CurTime

local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_KNEE
local ACT_HL2MP_SWIM_PISTOL = ACT_HL2MP_SWIM_PISTOL
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE

local StepSounds = {
	"npc/zombie/foot1.wav",
	"npc/zombie/foot2.wav",
	"npc/zombie/foot3.wav"
}
local ScuffSounds = {
	"npc/zombie/foot_slide1.wav",
	"npc/zombie/foot_slide2.wav",
	"npc/zombie/foot_slide3.wav"
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if math_random() < 0.15 then
		pl:EmitSound(ScuffSounds[math_random(#ScuffSounds)], 70)
	else
		pl:EmitSound(StepSounds[math_random(#StepSounds)], 70)
	end

	return true
end

function CLASS:ScalePlayerDamage(pl, hitgroup, dmginfo)
	return true
end

function CLASS:IgnoreLegDamage(pl, dmginfo)
	return true
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return 625 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 600
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 750
	end

	return 450
end

function CLASS:CalcMainActivity(pl, velocity)
	if pl:WaterLevel() >= 3 then
		return ACT_HL2MP_SWIM_PISTOL, -1
	end

	if pl:Crouching() and pl:OnGround() then
		if velocity:Length2DSqr() <= 1 then
			return ACT_HL2MP_IDLE_CROUCH_ZOMBIE, -1
		end

		return ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 - 1 + math_ceil((CurTime() / 4 + pl:EntIndex()) % 3), -1
	end

	return ACT_HL2MP_RUN_ZOMBIE, -1
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local len2d = velocity:Length2D()
	if len2d > 1 then
		pl:SetPlaybackRate(math_min(len2d / maxseqgroundspeed, 3))
	else
		pl:SetPlaybackRate(1)
	end

	return true
end

function CLASS:DoAnimationEvent(pl, event, data)
	if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
		pl:DoZombieAttackAnim(data)
		return ACT_INVALID
	elseif event == PLAYERANIMEVENT_RELOAD then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)
		return ACT_INVALID
	end
end

if SERVER then
	function CLASS:OnSpawned(pl)
		pl:CreateAmbience("ticklemonsterambience")
	end
		function CLASS:ProcessDamage(pl, dmginfo)
			local attacker = dmginfo:GetAttacker()
			local dmg = dmginfo:GetDamage()
			local hp = pl:Health()
			if dmginfo:GetInflictor().IsMelee then
				dmginfo:SetDamage(dmginfo:GetDamage() / 2)
			end
			if bit_band(dmginfo:GetDamageType(), DMG_BULLET) ~= 0 then
				dmginfo:SetDamage(dmginfo:GetDamage() * 0.5)
			elseif bit_band(dmginfo:GetDamageType(), DMG_SLASH) == 0 and bit_band(dmginfo:GetDamageType(), DMG_CLUB) == 0 then
				dmginfo:SetDamage(dmginfo:GetDamage() * 0.5)
			end
	
	
	
	
		end

end



if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/tickle"
CLASS.IconColor = Color(100, 0, 220)

local vecSpineOffset = Vector(8, 0, 0)
local SpineBones = {"ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_Spine4", "ValveBiped.Bip01_Spine3"}
function CLASS:BuildBonePositions(pl)
	for _, bone in pairs(SpineBones) do
		local spineid = pl:LookupBone(bone)
		if spineid and spineid > 0 then
			pl:ManipulateBonePosition(spineid, vecSpineOffset)
		end
	end

	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.GetSwingEndTime then
		local desiredscale
		if wep:GetSwingEndTime() > 0 then
			desiredscale = 2 + (1 - math_Clamp((wep:GetSwingEndTime() - CurTime()) / wep.MeleeDelay, 0, 1)) * 10
		else
			desiredscale = 2
		end
		pl.m_TMArmLength = math_Approach(pl.m_TMArmLength or 2, desiredscale, FrameTime() * 10)

		local larmid = pl:LookupBone("ValveBiped.Bip01_L_Forearm")
		if larmid and larmid > 0 then
			pl:ManipulateBoneScale(larmid, Vector(pl.m_TMArmLength, 2, 2))
		end
		local rarmid = pl:LookupBone("ValveBiped.Bip01_R_Forearm")
		if rarmid and rarmid > 0 then
			pl:ManipulateBoneScale(rarmid, Vector(pl.m_TMArmLength, 2, 2))
		end
	end
end
