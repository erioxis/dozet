CLASS.Base = "seeing_zombie"

CLASS.Name = "Dreaming Zombie"
CLASS.TranslationName = "class_zdreams2"
CLASS.Description = "description_zdreams2"
CLASS.Help = "controls_zdreams2"

CLASS.Wave = 7 / 12
CLASS.DynamicHealth = 1.5

CLASS.Model = Model("models/Zombie/Poison.mdl")

CLASS.Health = 600
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio*0.55

CLASS.PainSounds = {"npc/zombie_poison/pz_pain1.wav", "npc/zombie_poison/pz_pain2.wav", "npc/zombie_poison/pz_pain3.wav"}
CLASS.DeathSounds = {"npc/zombie_poison/pz_die1.wav", "npc/zombie_poison/pz_die2.wav"}
CLASS.VoicePitch = 2

CLASS.UsePlayerModel = false
CLASS.SWEP = "weapon_zs_zombie_dreams"
CLASS.Magical = true
CLASS.Original = false
CLASS.Variations = {"Zombie"}

local ACT_IDLE = ACT_IDLE
local ACT_WALK = ACT_WALK
local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_KNEE
local math_random = math.random

function CLASS:CalcMainActivity(pl, velocity)
	if velocity:Length2DSqr() <= 1 then
		return ACT_IDLE, -1
	end

	return ACT_WALK, -1
end

function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 and math_random(3) < 3 then
		pl:EmitSound("npc/zombie_poison/pz_right_foot1.wav")
	else
		pl:EmitSound("npc/zombie_poison/pz_left_foot1.wav")
	end

	return true
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return 365 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 300
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 450
	end

	return 150
end

function CLASS:DoAnimationEvent(pl, event, data)
	if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_MELEE_ATTACK1, true)
		return ACT_INVALID
	end
end
if SERVER then
	function CLASS:ProcessDamage(pl, dmginfo)
		if dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker():IsSkillActive(SKILL_MAGIC) then
			dmginfo:ScaleDamage(0)
		end
	end
end
if CLIENT then
	CLASS.Icon = "zombiesurvival/killicons/poisonzombie"
	CLASS.IconColor = Color(46,208,219)
end

