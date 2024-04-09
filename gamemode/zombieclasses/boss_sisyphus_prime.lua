CLASS.Name = "Sisyphis Prime"
CLASS.TranslationName = "class_sprime"
CLASS.Description = "description_sprime"
CLASS.Help = "controls_sprime"

CLASS.Boss = true

CLASS.KnockbackScale = 0

CLASS.FearPerInstance = 1

CLASS.CanTaunt = true

CLASS.Hidden = true
CLASS.Wave = 8 / 12
CLASS.HealthMax = 750

CLASS.Points = 40

CLASS.SWEP = "weapon_zs_sis_prime"

CLASS.Model = Model("models/ultrakill/enemies/sisyphusprime/sisyphusprimepm.mdl")


CLASS.Health = 9000
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
--local math_ceil = math.ceil
local math_min = math.min
local math_max = math.max
local string_format = string.format
local bit_band = bit.band
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
if SERVER then
	function CLASS:OnSpawned(pl)
		--pl:CreateAmbience("minosprime_amb")
		pl.NoOneShot = true
		timer.Simple(20, function() if pl:IsValid() then pl.NoOneShot = false end end)
	end
end


function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	return GAMEMODE.BaseClass.PlayerStepSoundTime(GAMEMODE.BaseClass, pl, iType, bWalking) * 1.8
end

function CLASS:PlayDeathSound(pl)
	--pl:EmitSound("zombiesurvival/mp_dead.wav", 100, 100)
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
		dmginfo:SetDamage(dmginfo:GetDamage()*0.75)
		return dmginfo
	end

	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
		local fakedeath = pl:FakeDeath(234, self.ModelScale)
		if pl.NoOneShot then
			local pos = pl:GetPos()
			if attacker and attacker:IsValid() and attacker ~= pl then
				attacker.BerserkerCharge = false
				attacker.LetalSave = false
				attacker:TakeInventoryItem('trinket_lazarussoul')
			end

		end
		pl:SetZombieClass(GAMEMODE.DefaultZombieClass)
		return true
	end
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/prime_minos"
