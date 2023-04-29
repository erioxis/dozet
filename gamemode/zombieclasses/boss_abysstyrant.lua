CLASS.Base = "boss_nightmare"

CLASS.Name = "Abyss Tyrant"
CLASS.TranslationName = "class_abysstyrant"
CLASS.Description = "desc_abysstyrant"
CLASS.Help = "ctrl_abysstyrant"

CLASS.SuperBoss = true

CLASS.Hidden = true
CLASS.Boss = true

CLASS.Variations = {}

CLASS.Model = Model( "models/player/skeleton.mdl" )
CLASS.OverrideModel = false

CLASS.NoFallDamage = true
CLASS.NoFallSlowdown = true

CLASS.SWEP = "weapon_zs_abyssaxez"
CLASS.Health = 4500
CLASS.Speed = 135
CLASS.Points = 600
CLASS.Wave = 8 / 8

CLASS.CanTaunt = true

CLASS.VoicePitch = 0.65
CLASS.FearPerInstance = 1
CLASS.KnockbackScale = 0

local ACT_HL2MP_SWIM_MELEE2 		= 	ACT_HL2MP_SWIM_MELEE2
local ACT_HL2MP_IDLE_CROUCH_MELEE2 = 	ACT_HL2MP_IDLE_CROUCH_MELEE2
local ACT_HL2MP_WALK_CROUCH_MELEE2 = 	ACT_HL2MP_WALK_CROUCH_MELEE2
local ACT_HL2MP_IDLE_MELEE2 		= 	ACT_HL2MP_IDLE_MELEE2
local ACT_HL2MP_RUN_ZOMBIE 		= 	ACT_HL2MP_RUN_ZOMBIE
local ACT_HL2MP_RUN_MELEE2 		= 	ACT_HL2MP_RUN_MELEE2

CLASS.ModelScale = 1.23
CLASS.Hull = { Vector( -16, -16, 0 ), Vector( 16, 16, 72 ) }
CLASS.HullDuck = { Vector( -16, -16, 0 ), Vector( 16, 16, 36 ) }
CLASS.ViewOffset = DEFAULT_VIEW_OFFSET * CLASS.ModelScale
CLASS.ViewOffsetDucked = DEFAULT_VIEW_OFFSET_DUCKED * CLASS.ModelScale
CLASS.StepSize = 10
CLASS.Mass = DEFAULT_MASS * CLASS.ModelScale * 4

CLASS.OnDeathDistance = 250

CLASS.ResistFlame = true
CLASS.ResistFrost = true
CLASS.ResistToxin = true

local math_random = math.random
local math_Rand = math.Rand
local math_min = math.min
local math_ceil = math.ceil
local CurTime = CurTime

function CLASS:CalculateGiveStack( dmg )
	return dmg / ( self.Health * 0.1 * GAMEMODE:GetBalance() )
end

function CLASS:ProcessDamage( pl, dmginfo )


	if SERVER then
		if bit.band( dmginfo:GetDamageType(), DMG_ALWAYSGIB ) ~= 0 then
			dmginfo:SetDamage( dmginfo:GetDamage() * 0.65 )
		elseif bit.band( dmginfo:GetDamageType(), DMG_ACID ) ~= 0 then
			dmginfo:SetDamage( 0 )
		elseif bit.band( dmginfo:GetDamageType(), DMG_DROWN ) ~= 0 then
			dmginfo:SetDamage( 0 )
		elseif bit.band( dmginfo:GetDamageType(), DMG_BURN ) ~= 0 then 
			dmginfo:SetDamage( 0 )
		end
	end
	return dmginfo
end

function CLASS:PlayDeathSound(pl)
		local sndname = "zombies/bully_attack"..math.random(7)..".wav"
		for i = 1, 10 do
			timer.Simple(0.02 * i,
				function() if pl:IsValid() then pl:EmitSound(sndname, 100, 55 - i*4, 1, CHAN_AUTO) end
			end)
		end

		local sndname1 = "npc/stalker/breathing3.wav"
		for i = 1, 10 do
			timer.Simple(0.02 * i,
				function() if pl:IsValid() then pl:EmitSound(sndname1, 100, 65 - i*6, 0.5, CHAN_AUTO) end
			end)
		end

		local sndname2 = "zombies/archangel_fly"..math.random(2)..".wav"
		for i = 1, 10 do
			timer.Simple(0.01 * i,
				function() if pl:IsValid() then pl:EmitSound(sndname2, 100, 55 - i*3, 1, CHAN_AUTO) end
			end)
		end
	return true
end

function CLASS:PlayPainSound(pl)
	local sndname = "zombies/archangel_pain_0"..math.random(6)..".wav"
		for i = 1, 4 do
			timer.Simple(0.03 * i,
				function() if pl:IsValid() then pl:EmitSound(sndname, 100, math.random(55, 65) + i*6, 0.8, CHAN_AUTO) end
			end)
		end	
		local sndname = "npc/combine_soldier/pain"..math.random(3)..".wav"
		for i = 1, 6 do
			timer.Simple(0.04 * i,
				function() if pl:IsValid() then pl:EmitSound(sndname, 75, 65 - i*10, 1, CHAN_AUTO) end
			end)
		end
	pl.NextPainSound = CurTime() + 1.8

	return true
end

if SERVER then

	local function DropBossWeapon( self, drop )
		local inv = string.sub( drop, 1, 4 ) ~= "weap"

		local pos = self:LocalToWorld( self:OBBCenter() )
		local ent = ents.Create( inv and "prop_invitem" or "prop_weapon" )
		if ent:IsValid() then
			ent:SetPos( pos )
			ent.NeverRemove = true
			ent:SetAngles( AngleRand() )

			if inv then ent:SetInventoryItemType( drop ) else
				ent:SetWeaponType( drop )
			end

			ent:Spawn()

			local phys = ent:GetPhysicsObject()
			if phys:IsValid() then
				phys:Wake()
				phys:SetVelocityInstantaneous( VectorRand():GetNormalized() * math.Rand( 24, 100 ) )
				phys:AddAngleVelocity( VectorRand() * 200 )
			end
		end
	end

	function CLASS:OnSpawned( pl )
		pl:CreateAmbience( "abysstyrantambience" )
	end

	function CLASS:ScalePlayerDamage( pl, hitgroup, dmginfo )
		return true
	end

	function CLASS:IgnoreLegDamage( pl, dmginfo )
		return true
	end

	function CLASS:OnKilled( pl, attacker, inflictor, suicide, headshot, dmginfo )
		local fakedeath = pl:FakeDeath( 235, self.ModelScale )
		if fakedeath and fakedeath:IsValid() then
			fakedeath:SetModel( self.Model )
		end

		local vPos = inflictor:GetPos()
		for _, inf in ipairs( ents.FindInBoxRadius( vPos, self.OnDeathDistance ) ) do
			if inf and inf:IsValidLivingHuman() and WorldVisible( vPos, inf:NearestPoint( vPos ) ) then
				inf:SetBloodArmor( 0 )
				inf:GiveStatus( "dimvision", 3 )
				inf:GiveStatus( "frightened", 7 )
				inf:GiveStatus( "bloodysickness", 9 )
				--inf:SetBloodArmor(inf.MaxBloodArmor)
			end
		end

		DropBossWeapon( self, "weapon_zs_abyssaxe" )
		
		return true
	end

end

function CLASS:CalcMainActivity(pl, velocity)
	if pl:WaterLevel() >= 3 then
		return ACT_HL2MP_SWIM_MELEE2, -1
	end

	if pl:Crouching() and pl:OnGround() then
		if velocity:Length2DSqr() <= 1 then
			return ACT_HL2MP_IDLE_CROUCH_MELEE2, -1
		end

		return ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 - 1 + math_ceil((CurTime() / 4 + pl:EntIndex()) % 3), -1
	end

	return ACT_HL2MP_WALK_MELEE2, -1
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
		pl:DoZombieAttackAnim(ACT_MP_ATTACK_STAND_PRIMARYFIRE)
		return ACT_INVALID
	elseif event == PLAYERANIMEVENT_RELOAD then
		pl:AnimRestartGesture(GESTURE_SLOT_ATTACK_AND_RELOAD, ACT_GMOD_GESTURE_TAUNT_ZOMBIE, true)
		return ACT_INVALID
	end
end

local MuscularBones = {
["ValveBiped.Bip01_R_Upperarm"] 	= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_R_Forearm"] 		= Vector( 1.5, 1.2, 1.2 ),
["ValveBiped.Bip01_L_Upperarm"] 	= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_L_Forearm"] 		= Vector( 1.5, 1.2, 1.2 ),
["ValveBiped.Bip01_L_Hand"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_R_Hand"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_L_Thigh"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_R_Thigh"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_L_Calf"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_R_Calf"] 		= Vector( 1, 2, 2 ),
["ValveBiped.Bip01_L_Foot"] 		= Vector( 1, 1.2, 1.2 ),
["ValveBiped.Bip01_R_Foot"] 		= Vector( 1, 1.2, 1.2 ),
}
--local SpineBones = {"ValveBiped.Bip01_Spine2", "ValveBiped.Bip01_Spine4", "ValveBiped.Bip01_Spine1", "ValveBiped.Bip01_Neck1"}

function CLASS:BuildBonePositions( pl, event )

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine4" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 1.2, 2.2, 2.2 ) )
	end

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine2" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 1.2, 1.4, 1.4 ) )
	end

	local boneid = pl:LookupBone( "ValveBiped.Bip01_Spine" )
	if boneid and boneid > -1 then
		pl:ManipulateBoneScale( boneid, Vector( 1.2, 0.8, 0.8 ) )
	end

	for bonename, newscale in pairs( MuscularBones ) do
	local boneid = pl:LookupBone( bonename )
		if boneid and boneid > 0 then
			pl:ManipulateBoneScale( boneid, newscale )
		end
	end
end

if CLIENT then
	CLASS.Icon = "zombiesurvival/killicons/terrormare"
	CLASS.PrevImage = "zombiesurvival/previos/terrormare"

	local render_ModelMaterialOverride = render.ModelMaterialOverride
	local render_SetColorModulation = render.SetColorModulation
	local matSkin = Material( "effects/flashlight/caustics" )
	function CLASS:PrePlayerDraw( pl )
		render_ModelMaterialOverride( matSkin )
		render_SetColorModulation( 5, 0, 65 )
	end

	function CLASS:PostPlayerDraw( pl )
		render_ModelMaterialOverride( nil )
		render_SetColorModulation( 1, 1, 1 )
	end
end
