CLASS.Name = "Bara Pus"
CLASS.TranslationName = "class_barapukepus"

CLASS.Boss = true

CLASS.Hidden = true

CLASS.KnockbackScale = 0

CLASS.FearPerInstance = 1

CLASS.Health = 2120
CLASS.SWEP = "weapon_zs_icepukepus"

CLASS.Model = Model("models/Zombie/Poison.mdl")

CLASS.Speed = 220 --120
CLASS.Points = 40

CLASS.PainSounds = {"NPC_PoisonZombie.Pain"}
CLASS.DeathSounds = {Sound("npc/zombie_poison/pz_call1.wav")}

if SERVER then
function CLASS:ProcessDamage(pl, dmginfo)
	if dmginfo:GetInflictor().IsMelee then
		dmginfo:SetDamage(dmginfo:GetDamage() / 30)
	end
end
end


CLASS.VoicePitch = 0.5

--[[CLASS.ModelScale = 1.5
CLASS.Mass = 200
CLASS.ViewOffset = Vector(0, 0, 75)
CLASS.ViewOffsetDucked = Vector(0, 0, 48)
CLASS.StepSize = 25]]
--[[CLASS.Hull = {Vector(-22, -22, 0), Vector(22, 22, 96)}
CLASS.HullDuck = {Vector(-22, -22, 0), Vector(22, 22, 58)}]]

CLASS.ViewOffset = Vector(0, 0, 50)
CLASS.Hull = {Vector(-16, -16, 0), Vector(16, 16, 64)}
CLASS.HullDuck = {Vector(-16, -16, 0), Vector(16, 16, 35)}

--CLASS.JumpPower = DEFAULT_JUMP_POWER * 1.216

CLASS.BloodColor = BLOOD_COLOR_YELLOW

local math_random = math.random
local math_min = math.min

local ACT_IDLE = ACT_IDLE
local STEPSOUNDTIME_NORMAL = STEPSOUNDTIME_NORMAL
local STEPSOUNDTIME_WATER_FOOT = STEPSOUNDTIME_WATER_FOOT
local STEPSOUNDTIME_ON_LADDER = STEPSOUNDTIME_ON_LADDER
local STEPSOUNDTIME_WATER_KNEE = STEPSOUNDTIME_WATER_KNEE

function CLASS:CalcMainActivity(pl, velocity)
	if velocity:Length2DSqr() <= 1 then
		return ACT_IDLE, -1
	end

	return 1, 2
end

local StepSounds = {
	"npc/zombie_poison/pz_left_foot1.wav"
}
local ScuffSounds = {
	"npc/zombie_poison/pz_right_foot1.wav"
}
function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if iFoot == 0 and math_random() < 0.333 then
		pl:EmitSound(ScuffSounds[math_random(#ScuffSounds)], 80, 90)
	else
		pl:EmitSound(StepSounds[math_random(#StepSounds)], 80, 90)
	end

	return true
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return (365 - pl:GetVelocity():Length()) * 1.5
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 450
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 600
	end

	return 200
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local len2d = velocity:Length2D()
	if len2d > 1 then
		pl:SetPlaybackRate(math_min(len2d / maxseqgroundspeed * 0.5, 3))
	else
		pl:SetPlaybackRate(0.5)
	end

	return true
end

if SERVER then
	function CLASS:OnSpawned(pl)
		pl:CreateAmbience("pukepusambience")
	end
end

local BonesToZero = {
	"ValveBiped.Bip01_L_UpperArm",
	"ValveBiped.Bip01_L_Forearm",
	"ValveBiped.Bip01_L_Hand",
	"ValveBiped.Bip01_L_Finger1",
	"ValveBiped.Bip01_L_Finger11",
	"ValveBiped.Bip01_L_Finger12",
	"ValveBiped.Bip01_L_Finger2",
	"ValveBiped.Bip01_L_Finger21",
	"ValveBiped.Bip01_L_Finger22",
	"ValveBiped.Bip01_L_Finger3",
	"ValveBiped.Bip01_L_Finger31",
	"ValveBiped.Bip01_L_Finger32",
	"ValveBiped.Bip01_R_UpperArm",
	"ValveBiped.Bip01_R_Forearm",
	"ValveBiped.Bip01_R_Hand",
	"ValveBiped.Bip01_R_Finger1",
	"ValveBiped.Bip01_R_Finger11",
	"ValveBiped.Bip01_R_Finger12",
	"ValveBiped.Bip01_R_Finger2",
	"ValveBiped.Bip01_R_Finger21",
	"ValveBiped.Bip01_R_Finger22",
	"ValveBiped.Bip01_R_Finger3",
	"ValveBiped.Bip01_R_Finger31",
	"ValveBiped.Bip01_R_Finger32"
}
function CLASS:BuildBonePositions(pl)
	for _, bone in pairs(BonesToZero) do
		local boneid = pl:LookupBone(bone)
		if boneid and boneid > 0 then
			pl:ManipulateBoneScale(boneid, vector_tiny)
		end
	end
end

local function CreateFlesh(pl, damage, damagepos, damagedir)
	damage = math.min(damage, 120)

	pl:EmitSound(string.format("physics/body/body_medium_break%d.wav", math.random(2, 4)), 74, 125 - damage * 0.50)

	if SERVER then
		damagepos = pl:LocalToWorld(damagepos)

		for i=1, math.max(1, math.floor(damage / 12)) do
			local ent = ents.Create("projectile_poisonflesh")
			if ent:IsValid() then
				local heading = (damagedir + VectorRand() * 0.3):GetNormalized()
				ent:SetPos(damagepos + heading)
				ent:SetOwner(pl)
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:Wake()
					phys:SetVelocityInstantaneous(math.min(325, 100 + damage ^ math.Rand(1.15, 1.25)) * heading)
				end
			end
		end
	end
end

function CLASS:ProcessDamage(pl, dmginfo)
	local attacker, damage = dmginfo:GetAttacker(), dmginfo:GetDamage()
	if attacker ~= pl and damage >= 5 and damage < pl:Health() and CurTime() >= (pl.m_NextPukeEmit or 0) then
		pl.m_NextPukeEmit = CurTime() + 0.3

		local pos = pl:WorldToLocal(dmginfo:GetDamagePosition())
		local norm = dmginfo:GetDamageForce():GetNormalized() * -1
		timer.Simple(0, function()
			if pl:IsValid() then
				CreateFlesh(pl, damage, pos, norm)
			end
		end)
	end
end

if SERVER then
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo, assister)
		local pos = pl:WorldToLocal(dmginfo:GetDamagePosition())
		local norm = dmginfo:GetDamageForce():GetNormalized() * -1
		timer.Simple(0, function()
			if pl:IsValid() then
				CreateFlesh(pl, 300, pos, norm)
			end
		end)
	end
end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/pukepus"
CLASS.IconColor = Color(0, 7, 70)

local colGlow = Color(32, 89, 248)
local matGlow = Material("sprites/glow04_noz")
local vecEyeLeft = Vector(4, -4.6, -1)
local vecEyeRight = Vector(4, -4.6, 1)


local matSkin = Material("zombiesurvival/baracat")
function CLASS:PrePlayerDraw(pl)
	render.SetColorModulation(0.106, 0.588, 0.914)
	render.ModelMaterialOverride(matSkin)
end

function CLASS:PostPlayerDraw(pl)
	render.SetColorModulation(1, 1, 1)
	render.ModelMaterialOverride()

	if pl == MySelf and not pl:ShouldDrawLocalPlayer() or pl.SpawnProtection then return end

	local id = pl:LookupBone("ValveBiped.Bip01_Head1")
	if id and id > 0 then
		local pos, ang = pl:GetBonePositionMatrixed(id)
		if pos then
			render_SetMaterial(matGlow)
			render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 4, 4, colGlow)
			render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 4, 4, colGlow)
		end
	end
end
