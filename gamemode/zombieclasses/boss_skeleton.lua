CLASS.Name = "Skeleton"
CLASS.TranslationName = "class_skeleton"
CLASS.Description = "description_skeleton"
CLASS.Help = "controls_skeletal_walker"



CLASS.Boss = true
CLASS.NoSlowdown = true

CLASS.Health = 2500
CLASS.Speed = 150
CLASS.Points = 60


CLASS.CanTaunt = true
CLASS.Weight = 0.99
CLASS.Points = CLASS.Health/GM.SkeletonPointRatio

CLASS.SWEP = "weapon_zs_skeleton"
CLASS.Model = Model("models/player/skeleton.mdl")

CLASS.VoicePitch = 0.8

CLASS.CanFeignDeath = true

CLASS.BloodColor = -1

CLASS.Skeletal = true
CLASS.SkeletalRes = true

CLASS.Unstone = 1

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

function CLASS:KnockedDown(pl, status, exists)
	pl:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD)
end

function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if math_random(2) == 1 then
		pl:EmitSound("npc/barnacle/neck_snap1.wav", 65, math_random(135, 150), 0.27)
	else
		pl:EmitSound("npc/barnacle/neck_snap2.wav", 65, math_random(135, 150), 0.27)
	end

	return true
end

function CLASS:PlayPainSound(pl)
	pl:EmitSound(string_format("npc/metropolice/pain%d.wav", math_random(4)), 65, math_random(70, 75))

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound(string_format("npc/zombie/zombie_die%d.wav", math_random(3)), 75, math_random(122, 128))

	return true
end

--[[function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	if iType == STEPSOUNDTIME_NORMAL or iType == STEPSOUNDTIME_WATER_FOOT then
		return 625 - pl:GetVelocity():Length()
	elseif iType == STEPSOUNDTIME_ON_LADDER then
		return 600
	elseif iType == STEPSOUNDTIME_WATER_KNEE then
		return 750
	end

	return 450
end]]

function CLASS:CalcMainActivity(pl, velocity)
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

	if velocity:Length2DSqr() <= 1 then
		if pl:Crouching() and pl:OnGround() then
			return ACT_HL2MP_IDLE_CROUCH_FIST, -1 --ACT_HL2MP_IDLE_CROUCH_ZOMBIE
		end

		return ACT_HL2MP_IDLE_KNIFE, -1 --ACT_HL2MP_IDLE_ZOMBIE
	end

	if pl:Crouching() and pl:OnGround() then
		return ACT_HL2MP_WALK_CROUCH_KNIFE, -1 --ACT_HL2MP_WALK_CROUCH_ZOMBIE_01 - 1 + math_ceil((CurTime() / 4 + pl:EntIndex()) % 3)
	end

	return ACT_HL2MP_RUN_KNIFE, -1 --ACT_HL2MP_WALK_ZOMBIE_01 - 1 + math_ceil((CurTime() / 4 + pl:EntIndex()) % 3)
end

function CLASS:UpdateAnimation(pl, velocity, maxseqgroundspeed)
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

	local len = velocity:Length()
	if len > 1 then
		--pl:SetPlaybackRate(math_min(len / maxseqgroundspeed * 0.666, 3))
		pl:SetPlaybackRate(math_min(len / maxseqgroundspeed, 3))
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
		if bit_band(dmginfo:GetDamageType(), DMG_BULLET) ~= 0 then
			dmginfo:ScaleDamage(0.5)
		elseif bit_band(dmginfo:GetDamageType(), DMG_SLASH) == 0 and bit_band(dmginfo:GetDamageType(), DMG_CLUB) == 0 then
			dmginfo:ScaleDamage(0.5)
		end
		return dmginfo
	end
end

if CLIENT then
	CLASS.Icon = "zombiesurvival/killicons/skeletal_walker"
	CLASS.Pac3Out = {[1] = {
		["children"] = {
			[1] = {
				["children"] = {
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["LightBlend"] = 2.8,
					["CellShade"] = 0,
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "Halo",
					["Angles"] = Angle(-7, 0.60000002384186, -3.5),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 79.1,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(0, 0, 0),
					["Alpha"] = 0.825,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "head",
					["Color"] = Vector(237, 226, 76),
					["Fullbright"] = true,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(10.114448547363, 6.103515625e-05, 0),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(0.40000000596046, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = true,
					["Size"] = 0.35,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 1.6,
					["Model"] = "models/props_vehicles/tire001c_car.mdl",
					["UniqueID"] = "2c48805ee5c7f092b339373ca413e526657d68eff99fbbf41262b8a6ea7700f3",
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
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "",
					["Angles"] = Angle(0.46574932336807, -15.668445587158, 169.89306640625),
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
					["Bone"] = "left calf",
					["Color"] = Vector(255, 255, 255),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(11.30004119873, 1.1019287109375, -0.11421203613281),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 0.275,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/props_vehicles/carparts_muffler01a.mdl",
					["UniqueID"] = "d282571af7df9cae08bb885f67c7fb2b8951eec001ec9f8d8fe1b6d77236303a",
				},
			},
		
			[3] = {
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
					["Angles"] = Angle(1.8050478696823, 5.7280607223511, -178.30355834961),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 1,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(33, 159, 28),
					["Alpha"] = 1,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "left forearm",
					["Color"] = Vector(23, 144, 14),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(-1.3093719482422, 0.34286499023438, 1.52587890625e-05),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1.3999999761581, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 1,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/Gibs/wood_gib01e.mdl",
					["UniqueID"] = "6aec2e2fedafcf0e8bac09d629f5b0d1b53fd7c29f4051f768a725add59bbd2b",
				},
			},
			[4] = {
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
					["Angles"] = Angle(-5.1906561851501, -7.3946514129639, 145.1199798584),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 1,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(33, 159, 28),
					["Alpha"] = 1,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "right calf",
					["Color"] = Vector(23, 144, 14),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(-1.3093719482422, 0.34286499023438, 1.52587890625e-05),
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
					["Model"] = "models/Gibs/wood_gib01e.mdl",
					["UniqueID"] = "6e7d4808c4b4a884f1c182d7f14fe3574e4b9124f2f546dcae7ae303074bc74f",
				},
			},
			[5] = {
				["children"] = {
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["LightBlend"] = 2.6,
					["CellShade"] = 0,
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "EyeRed1",
					["Angles"] = Angle(0, 0, 0),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 2.6,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(0, 0, 0),
					["Alpha"] = 0.375,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "head",
					["Color"] = Vector(147, 31, 31),
					["Fullbright"] = true,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(4.4035873413086, -2.9977416992188, 1.1705455780029),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 0.05,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/pac/default.mdl",
					["UniqueID"] = "73db2706391db318513035b0602227aa07643e1b519da99915d6c869d1f8ae77",
				},
			},
			[6] = {
				["children"] = {
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["LightBlend"] = 2.6,
					["CellShade"] = 0,
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "EyeInEye",
					["Angles"] = Angle(0, 0, 0),
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
					["Color"] = Vector(35, 116, 35),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(4.4035873413086, -2.9977416992188, 1.1705455780029),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 0.025,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/pac/default.mdl",
					["UniqueID"] = "541265041b709209b75dbb9e64d6e865522750850242958c25e9fbd2fc530d6c",
				},
			},
			[7] = {
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
					["Name"] = "MetaHeart",
					["Angles"] = Angle(0.049507137387991, -85.573265075684, 90.225769042969),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 0.6,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(0, 0, 0),
					["Alpha"] = 0.425,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "spine 4",
					["Color"] = Vector(255, 0, 0),
					["Fullbright"] = false,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(-1.8035888671875, 3.2442321777344, 0.258544921875),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(0.60000002384186, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 1.525,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/Gibs/HGIBS.mdl",
					["UniqueID"] = "fca4a5f07f7324d8acf2cb5644adacd42e8185d5a72eec311ff077638c370e00",
				},
			},
			[8] = {
				["children"] = {
				},
				["self"] = {
					["Skin"] = 0,
					["Invert"] = false,
					["LightBlend"] = 2.6,
					["CellShade"] = 0,
					["AimPartName"] = "",
					["IgnoreZ"] = false,
					["AimPartUID"] = "",
					["Passes"] = 1,
					["Name"] = "EyeRed2",
					["Angles"] = Angle(0, 0, 0),
					["DoubleFace"] = false,
					["PositionOffset"] = Vector(0, 0, 0),
					["BlurLength"] = 0,
					["OwnerEntity"] = false,
					["Brightness"] = 2.6,
					["DrawOrder"] = 0,
					["BlendMode"] = "",
					["TintColor"] = Vector(0, 0, 0),
					["Alpha"] = 0.375,
					["LodOverride"] = -1,
					["TargetEntityUID"] = "",
					["BlurSpacing"] = 0,
					["UsePlayerColor"] = false,
					["Material"] = "",
					["UseWeaponColor"] = false,
					["EyeAngles"] = false,
					["UseLegacyScale"] = false,
					["Bone"] = "head",
					["Color"] = Vector(147, 31, 31),
					["Fullbright"] = true,
					["BoneMerge"] = false,
					["IsDisturbing"] = false,
					["Position"] = Vector(4.4036254882813, -2.9978637695313, -1.3818283081055),
					["NoTextureFiltering"] = false,
					["AlternativeScaling"] = false,
					["Hide"] = false,
					["Translucent"] = false,
					["Scale"] = Vector(1, 1, 1),
					["ClassName"] = "model",
					["EditorExpand"] = false,
					["Size"] = 0.05,
					["ModelFallback"] = "",
					["AngleOffset"] = Angle(0, 0, 0),
					["TextureFilter"] = 3,
					["Model"] = "models/pac/default.mdl",
					["UniqueID"] = "93afd9f936f922972a9ceef5902015234c8f4fa5980b9a9ed640d960a1d4d2db",
				},
			},
		},
		["self"] = {
			["DrawOrder"] = 0,
			["UniqueID"] = "b84247ac184044a964384f0e0069c814018159e4b20bc0417ede0fefca64f702",
			["Hide"] = false,
			["TargetEntityUID"] = "",
			["EditorExpand"] = true,
			["OwnerName"] = "self",
			["IsDisturbing"] = false,
			["Name"] = "скелетик",
			["Duplicate"] = false,
			["ClassName"] = "group",
		},
	},
	}
end
