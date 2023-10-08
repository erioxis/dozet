CLASS.Name = "Giga-Tim"
CLASS.TranslationName = "class_tim"
CLASS.Description = "description_tim"
CLASS.Help = "controls_tim"

CLASS.Boss = true

CLASS.KnockbackScale = 0

CLASS.FearPerInstance = 1

CLASS.CanTaunt = true

CLASS.Hidden = false
CLASS.GigaTim = true

CLASS.Points = 40

CLASS.Model = Model("models/Gigabreen/Gigabreen.mdl")

CLASS.WeaponsWave = {
	"weapon_zs_devourer", -- 1
	"weapon_zs_slime", -- 2
	"weapon_zs_butcherknifez", -- 3
	"weapon_zs_hammer_x", --  4
	"weapon_zs_energyswordz",-- 5
	"weapon_zs_crowbar", --  6
	"weapon_zs_energyswordz_dasher", -- 7
	"weapon_zs_bust_z",-- 8
	"weapon_zs_mprime",-- 9
	"weapon_zs_luxoidz",-- 10
	"weapon_zs_loy_z"-- 11
}


CLASS.Health = 1200
CLASS.Speed = 175

CLASS.VoicePitch = 0.65

CLASS.ModelScale = 1
CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 72)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 36)}
CLASS.ViewOffset = DEFAULT_VIEW_OFFSET * CLASS.ModelScale
CLASS.ViewOffsetDucked = DEFAULT_VIEW_OFFSET_DUCKED * CLASS.ModelScale
CLASS.StepSize = 25
CLASS.Mass = DEFAULT_MASS * CLASS.ModelScale

local math_random = math.random
local math_min = math.min
local math_ceil = math.ceil
local CurTime = CurTime

local DIR_BACK = DIR_BACK
local ACT_INVALID = ACT_INVALID
local ACT_HL2MP_SWIM_PISTOL = ACT_HL2MP_SWIM_PISTOL
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE
local ACT_GMOD_GESTURE_TAUNT_ZOMBIE = ACT_GMOD_GESTURE_TAUNT_ZOMBIE
local DMG_BULLET = DMG_BULLET
local ACT_HL2MP_ZOMBIE_SLUMP_RISE = ACT_HL2MP_ZOMBIE_SLUMP_RISE
local ACT_HL2MP_SWIM_PISTOL = ACT_HL2MP_SWIM_PISTOL
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_IDLE_ZOMBIE = ACT_HL2MP_IDLE_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
local ACT_HL2MP_WALK_ZOMBIE_01 = ACT_HL2MP_WALK_ZOMBIE_01


function CLASS:ScalePlayerDamage(pl, hitgroup, dmginfo)
	return true
end



function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	return GAMEMODE.BaseClass.PlayerStepSoundTime(GAMEMODE.BaseClass, pl, iType, bWalking) * 1.8
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound("npc/antlion_guard/antlion_guard_die"..math_random(2)..".wav", 100, math_random(80, 90))

	return true
end

function CLASS:PlayPainSound(pl)
	pl:EmitSound("npc/combine_gunship/gunship_pain.wav", 75, math_random(85, 95))
	pl.NextPainSound = CurTime() + 1.5

	return true
end

local StepSounds = {
	"npc/zombie/foot1.wav",
	"npc/zombie/foot2.wav",
	"npc/zombie/foot3.wav"
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)

	pl:EmitSound(StepSounds[math_random(#StepSounds)], 77, 50)

	if iFoot == 0 then
		pl:EmitSound("^npc/strider/strider_step4.wav", 90, math_random(95, 115))
	else
		pl:EmitSound("^npc/strider/strider_step5.wav", 90, math_random(95, 115))
	end

	return true
end




if SERVER then
	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetInflictor().IsMelee then
			dmginfo:SetDamage(0)
		end
	end
	return dmginfo
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/giga_tim"
