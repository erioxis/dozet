CLASS.Name = "Void Dead"
CLASS.TranslationName = "class_voiddead"
CLASS.Description = "description_voiddead"
CLASS.Help = "controls_voiddead"

CLASS.Boss = true

CLASS.Model = Model( "models/player/corpse1.mdl" )
CLASS.OverrideModel = Model( "models/player/skeleton.mdl" )
CLASS.NoHideMainModel = true

CLASS.SWEP = "weapon_zs_voiddead"
CLASS.Health = 6300
CLASS.Speed = 250
CLASS.Wave = 9 / 12
CLASS.Points = 210
CLASS.ModelScale = 1.05

CLASS.VoicePitch = 0.65
CLASS.FearPerInstance = 1
CLASS.KnockbackScale = 0

CLASS.CanTaunt = true
CLASS.Hidden = true
CLASS.ResistBleed = true
CLASS.ResistFrost = true
CLASS.ResistFlame = true
CLASS.ResistToxin = true

if SERVER then
	function CLASS:OnSpawned(pl)
		pl:CreateAmbience("voiddeadambience")
	end
end


function CLASS:PlayPainSound(pl)

		local sndname = "npc/combine_soldier/pain"..math.random(3)..".wav"
		for i = 1, 6 do
			timer.Simple(0.04 * i,
				function() if IsValid( pl ) then pl:EmitSound(sndname, 75, 65 + i*10, 0.9, CHAN_AUTO) end
			end)
		end

		local sndname1 = "zombies/archangel_pain_0"..math.random(6)..".wav"
		for i = 1, 6 do
			timer.Simple(0.04 * i,
				function() if IsValid( pl ) then pl:EmitSound(sndname1, 75, 45 + i*6, 0.4, CHAN_AUTO) end
			end)
		end	

		local sndname2 = "zombies/archangel_attack"..math.random(4)..".wav"
		for i = 1, 3 do
			timer.Simple(0.04 * i,
				function() if IsValid( pl ) then pl:EmitSound(sndname2, 75, 65 - i*5, 0.4, CHAN_AUTO) end
			end)
		end


	pl.NextPainSound = CurTime() + 0.95
	return true
end


function CLASS:PlayDeathSound(pl)
	pl:EmitSound("zombies/archangel_fly2.wav", 75, 55, 0.6)
	pl:EmitSound("zombies/archangel_fly2.wav", 75, 45, 0.6)
	pl:EmitSound("zombies/archangel_fly2.wav", 75, 65, 0.6)
	pl:EmitSound("zombies/archangel_fly1.wav", 75, 55, 0.6)
	pl:EmitSound("zombies/archangel_fly1.wav", 75, 45, 0.6)
	pl:EmitSound("zombies/archangel_fly1.wav", 75, 35, 0.6)

	return true
end
local math_random = math.random
local math_min = math.min
local CurTime = CurTime

local ACT_HL2MP_SWIM_MELEE = ACT_HL2MP_SWIM_MELEE
local ACT_HL2MP_IDLE_CROUCH_MELEE = ACT_HL2MP_IDLE_CROUCH_MELEE
local ACT_HL2MP_WALK_CROUCH_MELEE = ACT_HL2MP_WALK_CROUCH_MELEE
local ACT_HL2MP_IDLE_MELEE = ACT_HL2MP_IDLE_MELEE
local ACT_HL2MP_RUN_ZOMBIE = ACT_HL2MP_RUN_ZOMBIE
local ACT_HL2MP_RUN_MELEE = ACT_HL2MP_RUN_MELEE

local StepLeftSounds = {
	"npc/fast_zombie/foot1.wav",
	"npc/fast_zombie/foot2.wav"
}
local StepRightSounds = {
	"npc/fast_zombie/foot3.wav",
	"npc/fast_zombie/foot4.wav"
}
function CLASS:PlayerFootstep( pl, vFootPos, iFoot, strSoundName, fVolume, pFilter )
	if iFoot == 0 then
		pl:EmitSound(StepLeftSounds[math_random(#StepLeftSounds)], 70)
	else
		pl:EmitSound(StepRightSounds[math_random(#StepRightSounds)], 70)
	end

	return true
end

if SERVER then
	function CLASS:ProcessDamage(pl, dmginfo)
		if bit.band( dmginfo:GetDamageType(), DMG_BULLET ) ~= 0 then
			dmginfo:SetDamage( dmginfo:GetDamage() * 0.85 )
		end
	end
end

function CLASS:CalcMainActivity( pl, velocity )
	if pl:WaterLevel() >= 3 then
		return ACT_HL2MP_SWIM_PISTOL, -1
	end

	if pl:WaterLevel() >= 3 then
		return ACT_HL2MP_SWIM_PISTOL, -1
	end

	local len = velocity:Length2DSqr()
	if len <= 1 then
		if pl:Crouching() and pl:OnGround() then
			return ACT_HL2MP_IDLE_CROUCH_FIST, -1
		end

		return ACT_HL2MP_IDLE_KNIFE, -1
	end

	if pl:Crouching() and pl:OnGround() then
		return ACT_HL2MP_WALK_CROUCH_KNIFE, -1
	end

	if len < 2800 then
		return ACT_HL2MP_WALK_KNIFE, -1
	end

	return ACT_HL2MP_RUN_KNIFE, -1
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
	local len2d = velocity:Length2D()
	if len2d > 0.5 then
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
	end
end

local lefthand = {
	"ValveBiped.Bip01_L_UpperArm",
	"ValveBiped.Bip01_L_Forearm",
	"ValveBiped.Bip01_L_Hand"
}


local lefthandid = {
	14,
	15,
	16
}

function CLASS:BuildBonePositions( pl )
	local boneid = pl:LookupBone( "ValveBiped.Bip01_Head1" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 0.1, 0.1, 0.1 ) )
	end

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine4" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 0.2, 0.2, 0.2 ) )
	end

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine2" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 0.15, 0.15, 0.15 ) )
	end

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 0.05, 0.05, 0.05 ) )
	end
end


function CLASS:ManipulateOverrideModel( pl, overridemodel )
	overridemodel:ManipulateBoneScale( 6, Vector( 10, 10, 10 ) )
	overridemodel:ManipulateBoneScale( 4, Vector( 5, 5, 5 ) )
	overridemodel:ManipulateBoneScale( 3, Vector( 5, 5, 5 ) )
	overridemodel:ManipulateBoneScale( 1, Vector( 5, 5, 5 ) )
end

 if (CLIENT) then
	local matSkin1 = Material( "effects/tvscreen_noise001a" )

 	local render_SetMaterial = render.SetMaterial
	local render_DrawSprite = render.DrawSprite
	local angle_zero = angle_zero
	local LocalToWorld = LocalToWorld

	local colGlow = Color(5, 5, 5)
	local matGlow = Material("sprites/glow04_noz")
	local vecEyeLeft = Vector(4, -4.6, -1)
	local vecEyeRight = Vector(4, -4.6, 1)
	local matSkin = Material( "models/humans/male/bloody/citizen_sheet" )

	function CLASS:PrePlayerDraw( pl )
		render.ModelMaterialOverride( matSkin )
		render.SetColorModulation( 0.65, 0.65, 0.7 )
	end

	function CLASS:PostPlayerDraw( pl )
		render.ModelMaterialOverride( nil )
		render.SetColorModulation( 1, 1, 1 )

		if pl == MySelf and not pl:ShouldDrawLocalPlayer() or pl.SpawnProtection then return end

		local pos, ang = pl:GetBonePositionMatrixed(6)
		if pos then
			render_SetMaterial(matGlow)
			render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 10, 0.5, colGlow)
			render_DrawSprite(LocalToWorld(vecEyeLeft, angle_zero, pos, ang), 3, 3, colGlow)
			render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 10, 0.5, colGlow)
			render_DrawSprite(LocalToWorld(vecEyeRight, angle_zero, pos, ang), 3, 3, colGlow)
		end

	end

end
