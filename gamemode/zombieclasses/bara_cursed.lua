CLASS.Base = "baracat"

CLASS.Name = "Cursed Baracat"
CLASS.TranslationName = "class_cbaracat"
CLASS.Description = "description_cbaracat"
CLASS.Help = "controls_cbaracat"
CLASS.OverrideModel = nil
CLASS.Model = Model("models/player/catpants.mdl")
CLASS.Variations = {}
CLASS.Original = false

CLASS.Weight = 0.6
CLASS.Wave = 5 / 12



CLASS.KnockbackScale = 0
CLASS.BaraCat = true
CLASS.FearPerInstance = 1
CLASS.NoFallDamage = true
CLASS.NoFallSlowdown = true
CLASS.NoSlowdown = true

CLASS.Points = 2

CLASS.Pac3Out = {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["Jiggle"] = false,
				["DrawOrder"] = 0,
				["UniqueID"] = "cfa31c4d1e3cab7f0f720d1c1c69589a80c0201ed95b4871779079035a891f6a",
				["TargetEntityUID"] = "",
				["AimPartName"] = "",
				["FollowPartUID"] = "",
				["Bone"] = "right calf",
				["ScaleChildren"] = false,
				["AngleOffset"] = Angle(0, 0, 0),
				["MoveChildrenToOrigin"] = false,
				["Position"] = Vector(0, 0, 0),
				["AimPartUID"] = "",
				["Angles"] = Angle(2.561321025496e-06, -1.7075473124351e-06, 168.5846862793),
				["Hide"] = false,
				["Name"] = "",
				["Scale"] = Vector(1, 1, 1),
				["EditorExpand"] = true,
				["ClassName"] = "bone",
				["Size"] = 0.425,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["AlternativeBones"] = true,
				["EyeAngles"] = false,
				["FollowAnglesOnly"] = false,
			},
		},
		[2] = {
			["children"] = {
			},
			["self"] = {
				["Jiggle"] = false,
				["DrawOrder"] = 0,
				["UniqueID"] = "26225e4fe8ead9428718f06430fc7919218ef90ae606283d40b688a303ae2d0b",
				["TargetEntityUID"] = "",
				["AimPartName"] = "",
				["FollowPartUID"] = "",
				["Bone"] = "left calf",
				["ScaleChildren"] = false,
				["AngleOffset"] = Angle(0, 0, 0),
				["MoveChildrenToOrigin"] = false,
				["Position"] = Vector(0, 0, 0),
				["AimPartUID"] = "",
				["Angles"] = Angle(2.561321025496e-06, -1.7075473124351e-06, 168.5846862793),
				["Hide"] = false,
				["Name"] = "",
				["Scale"] = Vector(1, 1, 1),
				["EditorExpand"] = false,
				["ClassName"] = "bone",
				["Size"] = 0.425,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["AlternativeBones"] = true,
				["EyeAngles"] = false,
				["FollowAnglesOnly"] = false,
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "f3c8d1e8df2fb30c02f4fdc1d7136aabe765e90253b33aaee203d3599f94cccc",
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
}

CLASS.SWEP = "weapon_zs_baracat"

CLASS.Health = 120
CLASS.Speed = 500
CLASS.JumpPower = 720



CLASS.ModelScale = 0.5
CLASS.Hull = {Vector(-12, -12, 0), Vector(12, 12, 32)}
CLASS.HullDuck = {Vector(-12, -12, 0), Vector(12, 12, 32)}
CLASS.ViewOffset = Vector(0, 0, 32 * CLASS.ModelScale)
CLASS.ViewOffsetDucked = Vector(0, 0, 32 * CLASS.ModelScale)
CLASS.StepSize = 35
CLASS.CrouchedWalkSpeed = 1
CLASS.Mass = DEFAULT_MASS * 12

CLASS.NoCollideAll = true


CLASS.CanFeignDeath = false

CLASS.CantDuck = true


CLASS.BloodColor = -1


if SERVER then
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
		if attacker and attacker:IsValidLivingHuman() then
			attacker:TakeSpecialDamage(dmginfo:GetDamage()*0.05, dmginfo:GetDamageType(),pl,pl)
		end
		return true
	end
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	return GAMEMODE.BaseClass.PlayerStepSoundTime(GAMEMODE.BaseClass, pl, iType, bWalking) * 0.4
end

CLASS.Icon =  "zombiesurvival/baracat"
