CLASS.Base = "baracat"

CLASS.Name = "Titan Baracat"
CLASS.TranslationName = "class_tbaracat"
CLASS.Description = "description_tbaracat"
CLASS.Help = "controls_tbaracat"
CLASS.Model = Model("models/player/catpants.mdl")
CLASS.OverrideModel = Model("models/player/catpants.mdl")
CLASS.Variations = {}
CLASS.Original = false

CLASS.Weight = 0.6
CLASS.Wave = 7 / 12



CLASS.KnockbackScale = 0
CLASS.BaraCat = true
CLASS.FearPerInstance = 1
CLASS.NoFallDamage = true
CLASS.NoFallSlowdown = true
CLASS.NoSlowdown = true

CLASS.Points = 25

CLASS.SWEP = "weapon_zs_baracat_t"

CLASS.Health = 5000
CLASS.Speed = 270
CLASS.JumpPower = 620

CLASS.Pac3Out = {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
			},
			["self"] = {
				["Jiggle"] = true,
				["DrawOrder"] = 0,
				["UniqueID"] = "a3d66367545819df573e6e2f9a45f2fa935bfe092db64962b6b41dd25f996902",
				["TargetEntityUID"] = "",
				["AimPartName"] = "",
				["FollowPartUID"] = "",
				["Bone"] = "spine",
				["ScaleChildren"] = false,
				["AngleOffset"] = Angle(0, 0, 0),
				["MoveChildrenToOrigin"] = false,
				["Position"] = Vector(-0.74551391601563, 0.488525390625, 1.2925567626953),
				["AimPartUID"] = "",
				["Angles"] = Angle(-1.1072376082666e-06, 0.77967834472656, 3.5218167795392e-06),
				["Hide"] = false,
				["Name"] = "",
				["Scale"] = Vector(1, 1, 1),
				["EditorExpand"] = true,
				["ClassName"] = "bone",
				["Size"] = 1.975,
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
				["Jiggle"] = true,
				["DrawOrder"] = 0,
				["UniqueID"] = "08773204c3056fe3c5c5e0b0a747631a4a87330f37b81cc09544f0260c5e7016",
				["TargetEntityUID"] = "",
				["AimPartName"] = "",
				["FollowPartUID"] = "",
				["Bone"] = "spine 2",
				["ScaleChildren"] = false,
				["AngleOffset"] = Angle(0, 0, 0),
				["MoveChildrenToOrigin"] = false,
				["Position"] = Vector(20.845581054688, 0.78289794921875, 1.2926559448242),
				["AimPartUID"] = "",
				["Angles"] = Angle(-3.4150941701228e-06, 0.77968239784241, 59.406669616699),
				["Hide"] = false,
				["Name"] = "",
				["Scale"] = Vector(1, 1, 1),
				["EditorExpand"] = true,
				["ClassName"] = "bone",
				["Size"] = 1.975,
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
		["UniqueID"] = "bdb6754902caa47625e7c1f4c85a65ac8dfc63e51e028f215621a098730b3779",
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


CLASS.ModelScale = 1
CLASS.Hull = {Vector(-22, -22, 0), Vector(22, 22, 32)}
CLASS.HullDuck = {Vector(-22, -22, 0), Vector(22, 22, 32)}
CLASS.ViewOffset = Vector(0, 0, 32 * CLASS.ModelScale)
CLASS.ViewOffsetDucked = Vector(0, 0, 32 * CLASS.ModelScale)
CLASS.StepSize = 35
CLASS.DamageReduction = 0.85
CLASS.CrouchedWalkSpeed = 1
CLASS.Mass = DEFAULT_MASS * 12

CLASS.NoCollideAll = true


CLASS.CanFeignDeath = false

CLASS.CantDuck = true


CLASS.BloodColor = -1


if SERVER then
	function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
		local fakedeath = pl:FakeDeath(pl:LookupSequence("death_0"..math.random(4)), self.ModelScale)
		if fakedeath and fakedeath:IsValid() then
			fakedeath:SetModel(self.OverrideModel)
			local ang = fakedeath:GetDeathAngles()
			fakedeath:SetPos(fakedeath:GetPos() + ang:Up() * 10)
			ang:RotateAroundAxis(ang:Right(), 90)
			fakedeath:SetDeathAngles(ang)
		end
		local deadpos = pl:GetPos()
		timer.Simple(0, function()	local curclass = pl.DeathClass or pl:GetZombieClass()
			local crowindex = GAMEMODE.ZombieClasses["Baracat"].Index
			pl:SetZombieClass(crowindex)
			pl:DoHulls(crowindex, TEAM_UNDEAD)
			pl.DeathClass = nil
			pl:UnSpectateAndSpawn()
			pl.DeathClass = curclass
			pl:SetPos(deadpos)
		end)
		return true
	end
end

function CLASS:PlayerStepSoundTime(pl, iType, bWalking)
	return GAMEMODE.BaseClass.PlayerStepSoundTime(GAMEMODE.BaseClass, pl, iType, bWalking) * 1.2
end

CLASS.Icon =  "zombiesurvival/baracat"
