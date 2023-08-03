CLASS.Base = "zombie"

CLASS.Name = "Cosmic Zombie"
CLASS.TranslationName = "class_cosmic_zombie"
CLASS.Description = "description_cosmic_zombie"
CLASS.Help = "controls_cosmic_zombie"


CLASS.Wave = 4 / 12

CLASS.Health = 415
CLASS.Speed = 199
CLASS.Revives = false
CLASS.Original = false
CLASS.Weight = 1
CLASS.Points = CLASS.Health/GM.HumanoidZombiePointRatio/2

CLASS.SWEP = "weapon_zs_zombie_cosmic"

function CLASS:PlayPainSound(pl)
	pl:EmitSound("npc/zombie/zombie_pain"..math.random(6)..".wav", 75, math.random(87, 92))

	pl.NextPainSound = CurTime() + .5

	return true
end

function CLASS:PlayDeathSound(pl)
	pl:EmitSound("npc/zombie/zombie_die"..math.random(3)..".wav", 70, math.random(87, 92))

	return true
end

if SERVER then

function CLASS:ReviveCallback(pl, attacker, dmginfo)
	return false
end
local function compare(a,b)
	return a > b
end
function CLASS:ProcessDamage(pl, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if #player.GetHumans() < 5 or !attacker:IsPlayer() then return false end
	local top = {}
	for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
		if v and v:IsValid() then
			top[#top+1] = v:GetMScore()
		end
	end
	table.sort(top,compare)
	local attackerscore = attacker:GetMScore() 
	local dmg = dmginfo:GetDamage()
	if attackerscore == top[1] then
		dmginfo:SetDamage(math.min(50,dmg))
	elseif attackerscore == top[2] then
		dmginfo:ScaleDamage(0.25)
		dmginfo:SetDamage(math.min(150,dmg))
	else
		dmginfo:ScaleDamage(2)
	end
	return dmginfo
end
function CLASS:OnSpawned(pl)
	pl:SetRenderMode(RENDERMODE_TRANSALPHA)
end

function CLASS:SwitchedAway(pl)
	pl:SetRenderMode(RENDERMODE_NORMAL)
end

end

if not CLIENT then return end

CLASS.Icon = "zombiesurvival/killicons/zombie"
CLASS.IconColor = Color(92, 76, 194)

local matSkin = Material("effects/flashlight/caustics")
CLASS.Pac3Out = {[1] = {
	["children"] = {
		[1] = {
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
				["Name"] = "",
				["Angles"] = Angle(-8.9777326583862, -29.64630317688, -10.781820297241),
				["DoubleFace"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 96.1,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(5, 4, 60),
				["Alpha"] = 1,
				["LodOverride"] = -1,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "effects/flashlight/caustics",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "maw",
				["Color"] = Vector(6, 0, 76),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(0.0372314453125, -0.25909423828125, -1.0191912651062),
				["NoTextureFiltering"] = false,
				["AlternativeScaling"] = false,
				["Hide"] = false,
				["Translucent"] = false,
				["Scale"] = Vector(1, 1, 1),
				["ClassName"] = "model",
				["EditorExpand"] = true,
				["Size"] = 0.05,
				["ModelFallback"] = "",
				["AngleOffset"] = Angle(0, 0, 0),
				["TextureFilter"] = 1,
				["Model"] = "models/props_combine/headcrabcannister01a.mdl",
				["UniqueID"] = "8b4120ef455ba731b44ec119fca0120d144e27861da1b30bcd527e4256457f2c",
			},
		},
		[2] = {
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
				["Name"] = "",
				["Angles"] = Angle(-56.805641174316, -6.9275512695313, -21.475400924683),
				["DoubleFace"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 96.1,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(5, 4, 60),
				["Alpha"] = 1,
				["LodOverride"] = -1,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "effects/flashlight/caustics",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "left forearm",
				["Color"] = Vector(6, 0, 76),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(1.6213989257813, -0.39724731445313, 1.66162109375),
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
				["TextureFilter"] = 1,
				["Model"] = "models/props_combine/headcrabcannister01a.mdl",
				["UniqueID"] = "f866f43eaab99eca580a9d319695a173dd32725ab43729d5497d9f59646ada8c",
			},
		},
		[3] = {
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
				["Name"] = "",
				["Angles"] = Angle(-55.305099487305, -65.894660949707, -152.2409362793),
				["DoubleFace"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 1.2,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(5, 4, 60),
				["Alpha"] = 1,
				["LodOverride"] = -1,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "effects/flashlight/caustics",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "right forearm",
				["Color"] = Vector(255, 255, 255),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(1.0908660888672, -0.551513671875, 1.0819702148438),
				["NoTextureFiltering"] = false,
				["AlternativeScaling"] = false,
				["Hide"] = false,
				["Translucent"] = false,
				["Scale"] = Vector(1, 1, 2.5999999046326),
				["ClassName"] = "model",
				["EditorExpand"] = false,
				["Size"] = 0.05,
				["ModelFallback"] = "",
				["AngleOffset"] = Angle(0, 0, 0),
				["TextureFilter"] = 1,
				["Model"] = "models/props_wasteland/medbridge_post01.mdl",
				["UniqueID"] = "644b8cb5a5ba202cc63b0b05a6cbf54ffafa4749aabf19c0367efd3122406431",
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
				["Angles"] = Angle(-22.895336151123, -110.39967346191, -33.646465301514),
				["DoubleFace"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["BlurLength"] = 0,
				["OwnerEntity"] = false,
				["Brightness"] = 104.3,
				["DrawOrder"] = 0,
				["BlendMode"] = "",
				["TintColor"] = Vector(255, 255, 255),
				["Alpha"] = 1,
				["LodOverride"] = -1,
				["TargetEntityUID"] = "",
				["BlurSpacing"] = 0,
				["UsePlayerColor"] = false,
				["Material"] = "effects/flashlight/caustics",
				["UseWeaponColor"] = false,
				["EyeAngles"] = false,
				["UseLegacyScale"] = false,
				["Bone"] = "head",
				["Color"] = Vector(0, 132, 241),
				["Fullbright"] = false,
				["BoneMerge"] = false,
				["IsDisturbing"] = false,
				["Position"] = Vector(0.43170166015625, -2.2254943847656, -0.35906982421875),
				["NoTextureFiltering"] = false,
				["AlternativeScaling"] = false,
				["Hide"] = false,
				["Translucent"] = false,
				["Scale"] = Vector(1, 1, 1),
				["ClassName"] = "model",
				["EditorExpand"] = false,
				["Size"] = 0.3,
				["ModelFallback"] = "",
				["AngleOffset"] = Angle(0, 0, 0),
				["TextureFilter"] = 1,
				["Model"] = "models/Gibs/HGIBS_spine.mdl",
				["UniqueID"] = "c399b49ef499a78550402eebadd77014d1111dad2220a62f65d30f639366e821",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "d7881d04b8eb027575113e4c8820d7f60755567059f7d8d26d9faf26d755f697",
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
function CLASS:PrePlayerDraw(pl)
	render.ModelMaterialOverride(matSkin)
	render.SetBlend(math.max(0.2,math.sin(CurTime()%8)*2))
	render.SetColorModulation(0.11, 0.278, 0.667)
end

function CLASS:PostPlayerDraw(pl)
	render.ModelMaterialOverride()
	render.SetBlend(1)
	render.SetColorModulation(1, 1, 1)
end
