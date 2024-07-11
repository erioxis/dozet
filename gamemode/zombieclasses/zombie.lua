CLASS.Name = "Zombie"
CLASS.TranslationName = "class_zombie"
CLASS.Description = "description_zombie"
CLASS.Help = "controls_zombie"

CLASS.BetterVersion = "Eradicator"

CLASS.Wave = 0
CLASS.Unlocked = true
CLASS.IsDefault = true
CLASS.Order = 0

<<<<<<< Updated upstream
CLASS.Health = 310
CLASS.Speed = 175
CLASS.Revives = true

=======
CLASS.Health = 200
CLASS.Speed = 195
CLASS.Revives = true
CLASS.Variations = {"Pyro", "Gore Blaster Zombie", "Chem Burster", "Eraditor", "Eradicator", "Zombie Legs", "Zombie Dreams", "Dreaming Zombie","Stoney","Mimic Zombie"}
CLASS.Original = true

CLASS.DynamicHealth = 1
CLASS.Weight = 0.95
>>>>>>> Stashed changes
CLASS.CanTaunt = true

CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio

CLASS.SWEP = "weapon_zs_zombie"

CLASS.Model = Model("models/player/zombie_classic_hbfix.mdl")

CLASS.PainSounds = {"npc/zombie/zombie_pain1.wav", "npc/zombie/zombie_pain2.wav", "npc/zombie/zombie_pain3.wav", "npc/zombie/zombie_pain4.wav", "npc/zombie/zombie_pain5.wav", "npc/zombie/zombie_pain6.wav"}
CLASS.DeathSounds = {"npc/zombie/zombie_die1.wav", "npc/zombie/zombie_die2.wav", "npc/zombie/zombie_die3.wav"}

CLASS.VoicePitch = 0.65

CLASS.CanFeignDeath = true

local CurTime = CurTime
local math_random = math.random
local math_ceil = math.ceil
local math_Clamp = math.Clamp
local math_min = math.min
local math_max = math.max
local ACT_HL2MP_ZOMBIE_SLUMP_RISE = ACT_HL2MP_ZOMBIE_SLUMP_RISE
local ACT_HL2MP_SWIM_PISTOL = ACT_HL2MP_SWIM_PISTOL
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE
local ACT_HL2MP_IDLE_CROUCH_ZOMBIE = ACT_HL2MP_IDLE_CROUCH_ZOMBIE
local ACT_HL2MP_IDLE_ZOMBIE = ACT_HL2MP_IDLE_ZOMBIE
local ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 = ACT_HL2MP_WALK_CROUCH_ZOMBIE_01
local ACT_HL2MP_WALK_ZOMBIE_01 = ACT_HL2MP_WALK_ZOMBIE_01
local GESTURE_SLOT_ATTACK_AND_RELOAD = GESTURE_SLOT_ATTACK_AND_RELOAD
local PLAYERANIMEVENT_ATTACK_PRIMARY = PLAYERANIMEVENT_ATTACK_PRIMARY
local ACT_GMOD_GESTURE_RANGE_ZOMBIE = ACT_GMOD_GESTURE_RANGE_ZOMBIE
local ACT_INVALID = ACT_INVALID
local PLAYERANIMEVENT_RELOAD = PLAYERANIMEVENT_RELOAD
local ACT_GMOD_GESTURE_TAUNT_ZOMBIE = ACT_GMOD_GESTURE_TAUNT_ZOMBIE
local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_FOOT
local HITGROUP_HEAD = HITGROUP_HEAD
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG
local DMG_ALWAYSGIB = DMG_ALWAYSGIB
local DMG_BURN = DMG_BURN
local DMG_CRUSH = DMG_CRUSH
local bit_band = bit.band

function CLASS:KnockedDown(pl, status, exists)
	pl:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD)
end

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

-- Sound scripts are LITERALLY 100x slower than raw file input. Test it yourself if you don't believe me.
--[[function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 then
		if math_random() < 0.15 then
			pl:EmitSound("Zombie.ScuffLeft")
		else
			pl:EmitSound("Zombie.FootstepLeft")
		end
	else
		if math_random() < 0.15 then
			pl:EmitSound("Zombie.ScuffRight")
		else
			pl:EmitSound("Zombie.FootstepRight")
		end
	end

	return true
end]]

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
	local revive = pl.Revive
	if revive and revive:IsValid() then
		return ACT_HL2MP_ZOMBIE_SLUMP_RISE, -1
	end

	local feign = pl.FeignDeath
	if feign and feign:IsValid() then
		if feign:GetDirection() == DIR_BACK then
			return 1, pl:LookupSequence("zombie_slump_rise_02_fast")
		end

		return ACT_HL2MP_ZOMBIE_SLUMP_RISE, -1
	end

	if pl:WaterLevel() >= 3 then
		return ACT_HL2MP_SWIM_PISTOL, -1
	end

	local wep = pl:GetActiveWeapon()
	if wep:IsValid() and wep.IsMoaning and wep:IsMoaning() then
		return ACT_HL2MP_RUN_ZOMBIE, -1
	end

	if velocity:Length2DSqr() <= 1 then
		if pl:Crouching() and pl:OnGround() then
			return ACT_HL2MP_IDLE_CROUCH_ZOMBIE, -1
		end

		return ACT_HL2MP_IDLE_ZOMBIE, -1
	end

	if pl:Crouching() and pl:OnGround() then
		return ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 - 1 + math_ceil((CurTime() / 4 + pl:EntIndex()) % 3), -1
	end

	return ACT_HL2MP_WALK_ZOMBIE_01 - 1 + math_ceil((CurTime() / 3 + pl:EntIndex()) % 3), -1
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local revive = pl.Revive
	if revive and revive:IsValid() then
		pl:SetCycle(0.4 + (1 - math_Clamp((revive:GetReviveTime() - CurTime()) / revive.AnimTime, 0, 1)) * 0.6)
		pl:SetPlaybackRate(0)
		return true
	end

	local feign = pl.FeignDeath
	if feign and feign:IsValid() then
		if feign:GetState() == 1 then
			pl:SetCycle(1 - math_max(feign:GetStateEndTime() - CurTime(), 0) * 0.666)
		else
			pl:SetCycle(math_max(feign:GetStateEndTime() - CurTime(), 0) * 0.666)
		end
		pl:SetPlaybackRate(0)
		return true
	end

	local len2d = velocity:Length()
	if len2d > 1 then
		local wep = pl:GetActiveWeapon()
		if wep:IsValid() and wep.IsMoaning and wep:IsMoaning() then
			pl:SetPlaybackRate(math_min(len2d / maxseqgroundspeed, 3))
		else
			pl:SetPlaybackRate(math_min(len2d / maxseqgroundspeed * 0.666, 3))
		end
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

function CLASS:DoesntGiveFear(pl)
	return pl.FeignDeath and pl.FeignDeath:IsValid()
end

if SERVER then
	function CLASS:AltUse(pl)
		pl:StartFeignDeath()
	end

	function CLASS:ProcessDamage(pl, dmginfo)
		local damage = dmginfo:GetDamage()
		if damage >= 70 or damage < pl:Health() then return end

		local attacker, inflictor = dmginfo:GetAttacker(), dmginfo:GetInflictor()
		if attacker == pl or not attacker:IsPlayer() or inflictor.IsMelee or inflictor.NoReviveFromKills then return end

		local hitgroup = pl:LastHitGroup()
		if pl:WasHitInHead() or pl:GetStatus("shockdebuff") or hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then return end

		local dmgtype = dmginfo:GetDamageType()
		if bit_band(dmgtype, DMG_ALWAYSGIB) ~= 0 or bit_band(dmgtype, DMG_BURN) ~= 0 or bit_band(dmgtype, DMG_CRUSH) ~= 0 then return end

		if pl.FeignDeath and pl.FeignDeath:IsValid() then return end

		if CurTime() < (pl.NextZombieRevive or 0) then return end
		pl.NextZombieRevive = CurTime() + 3

		dmginfo:SetDamage(0)
		pl:SetHealth(10)

		local status = pl:GiveStatus("revive_slump")
		if status then
			status:SetReviveTime(CurTime() + 2.25)
			status:SetReviveHeal(10)
		end

		return dmginfo
	end


	function CLASS:ReviveCallback(pl, attacker, dmginfo)
		if not pl:ShouldReviveFrom(dmginfo) then return false end

		local classtable = math_random(3) == 3 and GAMEMODE.ZombieClasses["Zombie Legs"] or GAMEMODE.ZombieClasses["Zombie Torso"]
		if classtable then
			pl:RemoveStatus("overridemodel", false, true)
			local deathclass = pl.DeathClass or pl:GetZombieClass()
			pl:SetZombieClass(classtable.Index)
			pl:DoHulls(classtable.Index, TEAM_UNDEAD)
			pl.DeathClass = deathclass

			pl:EmitSound("physics/flesh/flesh_bloody_break.wav", 100, 75)

			if classtable == GAMEMODE.ZombieClasses["Zombie Torso"] then
				local ent = ents.Create("prop_dynamic_override")
				if ent:IsValid() then
					ent:SetModel(Model("models/Zombie/Classic_legs.mdl"))
					ent:SetPos(pl:GetPos())
					ent:SetAngles(pl:GetAngles())
					ent:Spawn()
					ent:Fire("kill", "", 1.5)
				end
			end

			pl:Gib()
			pl.Gibbed = nil

			timer.Simple(0, function()
				if pl:IsValid() then
					pl:SecondWind()
				end
			end)
			--net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(1,20)*0.2),text = "CUT OFF!",score = 50}) net.Send(attacker) 
			return true
		end

		return false
	end

	function CLASS:OnSecondWind(pl)
		pl:EmitSound("npc/zombie/zombie_voice_idle"..math_random(14)..".wav", 100, 85)
	end
end

if CLIENT then
	CLASS.Icon = "zombiesurvival/killicons/zombie"
	if !GM.Halloween then return end
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
					["Angles"] = Angle(-34.385143280029, -45.711170196533, 7.0863647460938),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 1,
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
					["Bone"] = "head",
					["Color"] = Vector(255, 255, 255),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(0.0001220703125, -3.8178100585938, -6.5268135070801),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 1,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/draganm_custom/pumpkin_pack/jackolantd_02.mdl",
					["UniqueID"] = "d8f40c35587e1db45840af4812990695c85ef5e253df09f7d6175fa628fdcc36",
				},
			},
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "d2452eac269309aae9d8df4bd2f0f7ca0527f37ebc28c86259c0dea83b23605f",
			["Hide"] = false,
			["TargetEntityUID"] = "",
			["EditorExpand"] = true,
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "тойка вирус",
			["Duplicate"] = false,
			["ClassName"] = "group",
		},
	},
	}
end
