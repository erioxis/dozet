CLASS.Name = "Toxical Charger"
CLASS.TranslationName = "class_txlacerator_charging"
CLASS.Description = "description_txlacerator_charging"
CLASS.Help = "controls_txlacerator_charging"

CLASS.Model = Model("models/player/zombie_lacerator2.mdl")

CLASS.Wave = 4 / 6

CLASS.Health = 1200
CLASS.Speed = 220

CLASS.Pac3Out = {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["Skin"] = 0,
				["Invert"] = false,
				["LightBlend"] = 1,
				["CellShade"] = 0,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Passes"] = 1,
				["Name"] = "",
				["Angles"] = Angle(3.7643110752106, 2.2716060357197e-06, 9.7199837512107e-08),
				["DoubleFace"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 0.6,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(0, 0, 0),
				["Alpha"] = 1,
				["LodOverride"] = -1,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "chest",
				["Color"] = Vector(62, 217, 0),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(-6.8680648803711, 0, -16.844289779663),
				["NoTextureFiltering"] = false,
				["AlternativeScaling"] = false,
				["Hide"] = false,
				["Translucent"] = false,
				["Scale"] = Vector(1, 1, 1),
				["ClassName"] = "model",
				["EditorExpand"] = false,
				["Size"] = 0.55,
				["ModelFallback"] = "",
				["AngleOffset"] = Angle(0, 0, 0),
				["TextureFilter"] = 3,
				["Model"] = "models/props_c17/oildrum001_explosive.mdl",
				["UniqueID"] = "bdaa8d15241fb10db082346d7b5d519d9bc9a329a13461e2351a22be7f199ae5",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "b05cbdd308bc67564007975c93107735e5ecbe647d2e3691c545567175f46833",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "токсичный таран",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
},}

CLASS.SWEP = "weapon_zs_toxic_charger"

CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 58)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 32)}
CLASS.ViewOffset = Vector(0, 0, 50)
CLASS.ViewOffsetDucked = Vector(0, 0, 24)

CLASS.Points = CLASS.Health/GM.NoHeadboxZombiePointRatio

CLASS.VoicePitch = 0.75

local math_random = math.random
local math_min = math.min
local CurTime = CurTime
local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_KNEE
local ACT_ZOMBIE_LEAP_START = ACT_ZOMBIE_LEAP_START
local ACT_ZOMBIE_LEAPING = ACT_ZOMBIE_LEAPING
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
local ACT_HL2MP_RUN_ZOMBIE_FAST = ACT_HL2MP_RUN_ZOMBIE_FAST
local ACT_GMOD_GESTURE_TAUNT_ZOMBIE = ACT_GMOD_GESTURE_TAUNT_ZOMBIE
local ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL = ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL
local ACT_HL2MP_RUN_CHARGING = ACT_HL2MP_RUN_CHARGING
local ACT_INVALID = ACT_INVALID

function CLASS:Move(pl, mv)
	local wep = pl:GetActiveWeapon()
	if wep.Move and wep:Move(mv) then
		return true
	end

	if mv:GetForwardSpeed() <= 0 then
		mv:SetMaxSpeed(math_min(mv:GetMaxSpeed(), 140))
		mv:SetMaxClientSpeed(math_min(mv:GetMaxClientSpeed(), 140))
	end
end

function CLASS:ScalePlayerDamage(pl, hitgroup, dmginfo)
	return true
end

local GearFoley = {
	"npc/combine_soldier/gear1.wav",
	"npc/combine_soldier/gear2.wav",
	"npc/combine_soldier/gear3.wav",
	"npc/combine_soldier/gear4.wav",
	"npc/combine_soldier/gear5.wav",
	"npc/combine_soldier/gear6.wav"
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 then
		pl:EmitSound("npc/antlion_guard/foot_heavy1.wav", 70, math_random(120,133), 0.4)
	else
		pl:EmitSound("npc/antlion_guard/foot_heavy2.wav", 70, math_random(120,133), 0.4)
	end
	pl:EmitSound(GearFoley[math_random(#GearFoley)], 70, 100, 0.6)

	return true
end

function CLASS:IgnoreLegDamage(pl, dmginfo)
	return true
end

function CLASS:PlayPainSound(pl)
	pl:EmitSound("npc/fast_zombie/leap1.wav", 75, math_random(70, 80))

	pl.NextPainSound = CurTime() + .5

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound("npc/zombie/zombie_die"..math_random(3)..".wav",70, math_random(80,85))

	return true
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.GetCharge and wep:GetCharge() > 0 and (iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT) then
		return 640 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return 580 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 400
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 550
	end

	return 250
end
function CLASS:ProcessDamage(pl, dmginfo)
	local wep = pl:GetActiveWeapon()
	if  wep:IsValid() and wep.GetCharge and wep:GetCharge() > 0 then
		dmginfo:ScaleDamage(math.max(0.2,1-wep:GetCharge()))
	end
end
function CLASS:CalcMainActivity(pl, velocity)
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or not wep.GetChargeStart then return end

	if wep:GetChargeStart() > 0 then
		if wep:GetCharge() <= 0 then
			return ACT_ZOMBIE_LEAP_START, -1
		elseif velocity:Length2DSqr() <= 1 then
			return 1, pl:LookupSequence("seq_cower")
		else
			return ACT_HL2MP_RUN_CHARGING, -1
		end
	end

	if not pl:OnGround() or pl:WaterLevel() >= 3 then
		return ACT_ZOMBIE_LEAPING, -1
	end

	if pl:Crouching() then
		return velocity:Length2DSqr() <= 1 and ACT_HL2MP_IDLE_CROUCH_ZOMBIE or ACT_HL2MP_WALK_CROUCH_ZOMBIE_01, -1
	end

	return ACT_HL2MP_RUN_ZOMBIE_FAST, -1
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local wep = pl:GetActiveWeapon()
	if not wep:IsValid() or not wep.GetChargeStart then return end

	local len2d = velocity:Length2D()
	if len2d > 1 then
		pl:SetPlaybackRate(math_min(len2d / maxseqgroundspeed * 0.666, 3))
	else
		pl:SetPlaybackRate(1)
	end

	if wep:GetChargeStart() > 0 and wep:GetCharge() <= 0 then
		pl:SetPlaybackRate(0.25)

		if not pl.m_PrevFrameCycle then
			pl.m_PrevFrameCycle = true
			pl:SetCycle(0)
		end

		return true
	elseif pl.m_PrevFrameCycle then
		pl.m_PrevFrameCycle = nil
	end

	if not pl:OnGround() or pl:WaterLevel() >= 3 then
		pl:SetPlaybackRate(1)

		if pl:GetCycle() >= 1 then
			pl:SetCycle(pl:GetCycle() - 1)
		end

		return true
	end

	return true

end

function CLASS:DoAnimationEvent(pl, event, data)
	if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_RANGE_ZOMBIE_SPECIAL, true)
		return ACT_INVALID
	elseif event == PLAYERANIMEVENT_RELOAD then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)
		return ACT_INVALID
	end
end

if SERVER then return end

CLASS.Icon = "zombiesurvival/killicons/lacerator"
CLASS.IconColor = Color(2, 101, 0)

function CLASS:CreateMove(pl, cmd)
	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.m_ViewAngles and ((wep.GetChargeStart and wep:GetChargeStart() ~= 0) or wep.IsCharging) then
		local maxdiff = FrameTime() * 15
		local mindiff = -maxdiff
		local originalangles = wep.m_ViewAngles
		local viewangles = cmd:GetViewAngles()

		local diff = math.AngleDifference(viewangles.yaw, originalangles.yaw)
		if diff > maxdiff or diff < mindiff then
			viewangles.yaw = math.NormalizeAngle(originalangles.yaw + math.Clamp(diff, mindiff, maxdiff))
		end

		wep.m_ViewAngles = viewangles

		cmd:SetViewAngles(viewangles)
	end
end

function CLASS:PrePlayerDraw(pl)
	render.SetColorModulation(0, 0.275, 0)
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
end
