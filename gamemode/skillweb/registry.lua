GM.Skills = {}
GM.SkillModifiers = {}
GM.SkillFunctions = {}
GM.SkillModifierFunctions = {}

function GM:AddSkill(id, name, description, x, y, connections, tree)
	local skill = {Connections = table.ToAssoc(connections or {})}

	if CLIENT then
		skill.x = x
		skill.y = y

		-- TODO: Dynamic skill descriptions based on modifiers on the skill.

		skill.Description = description
	end

	if #name == 0 then
		name = "Skill "..id
		skill.Disabled = true
	end

	skill.Name = name
	skill.Tree = tree

	self.Skills[id] = skill

	return skill
end

-- Use this after all skills have been added. It assigns dynamic IDs!
function GM:AddTrinket(name, swepaffix, pairedweapon, veles, weles, tier, description, status, stocks)
	local skill = {Connections = {}}

	skill.Name = name
	skill.Trinket = swepaffix
	skill.Status = status

	local datatab = {PrintName = name, DroppedEles = weles, Tier = tier, Description = description, Status = status, Stocks = stocks}

	if pairedweapon then
		skill.PairedWeapon = "weapon_zs_t_" .. swepaffix
	end

	self.ZSInventoryItemData["trinket_" .. swepaffix] = datatab
	self.Skills[#self.Skills + 1] = skill

	return #self.Skills, self.ZSInventoryItemData["trinket_" .. swepaffix]
end

-- I'll leave this here, but I don't think it's needed.
function GM:GetTrinketSkillID(trinketname)
	for skillid, skill in pairs(GM.Skills) do
		if skill.Trinket and skill.Trinket == trinketname then
			return skillid
		end
	end
end

function GM:AddSkillModifier(skillid, modifier, amount)
	self.SkillModifiers[skillid] = self.SkillModifiers[skillid] or {}
	self.SkillModifiers[skillid][modifier] = (self.SkillModifiers[skillid][modifier] or 0) + amount
end

function GM:AddSkillFunction(skillid, func)
	self.SkillFunctions[skillid] = self.SkillFunctions[skillid] or {}
	table.insert(self.SkillFunctions[skillid], func)
end

function GM:SetSkillModifierFunction(modid, func)
	self.SkillModifierFunctions[modid] = func
end

function GM:MkGenericMod(modifiername)
	return function(pl, amount) pl[modifiername] = math.Clamp(amount + 1.0, 0.0, 1000.0) end
end

-- These are used for position on the screen
TREE_HEALTHTREE = 1
TREE_SPEEDTREE = 2
TREE_SUPPORTTREE = 3
TREE_BUILDINGTREE = 4
TREE_MELEETREE = 5
TREE_GUNTREE = 6
TREE_POINTTREE = 7
TREE_ANCIENTTREE = 8
TREE_DEFENSETREE = 9
TREE_DONATETREE = 10
TREE_USELESSTREE = 11

-- Dummy skill used for "connecting" to their trees.
SKILL_NONE = 0

--[[
SKILL_U_AMMOCRATE = 0 -- Unlock alternate arsenal crate that only sells cheap ammo (remove from regular?)
SKILL_U_DECOY = 0 -- "Unlock: Decoy", "Unlocks purchasing the Decoy\nZombies believe it is a human\nCan be destroyed\nExplodes when destroyed"

SKILL_OVERCHARGEFLASHLIGHT = 0 -- Your flashlight now produces a blinding flash that stuns zombies\nYour flashlight now breaks after one use

Unlock: Explosive body armor - Allows you to purchase explosive body armor, which knocks back both you and nearby zombies when you fall below 25 hp.
Olympian - +50% throw power\nsomething bad
Unlock: Antidote Medic Gun - Unlocks purchasing the Antidote Medic Gun\nTarget poison damage resistance +100%\nTarget immediately cleansed of all debuffs\nTarget is no longer healed or hastened
]]

-- unimplemented

SKILL_SPEED1 = 1
SKILL_SPEED2 = 2
SKILL_SPEED3 = 3
SKILL_SPEED4 = 4
SKILL_SPEED5 = 5
SKILL_BACKPEDDLER = 18
SKILL_LOADEDHULL = 20
SKILL_REINFORCEDHULL = 21
SKILL_REINFORCEDBLADES = 22
SKILL_AVIATOR = 23
SKILL_U_BLASTTURRET = 24
SKILL_TWINVOLLEY = 26
SKILL_TURRETOVERLOAD = 27
SKILL_LIGHTCONSTRUCT = 34
SKILL_QUICKDRAW = 39
SKILL_QUICKRELOAD = 41
SKILL_VITALITY2 = 45
SKILL_BARRICADEEXPERT = 77
SKILL_BATTLER1 = 48
SKILL_BATTLER2 = 49
SKILL_BATTLER3 = 50
SKILL_BATTLER4 = 51
SKILL_BATTLER5 = 52
SKILL_HEAVYSTRIKES = 53
SKILL_COMBOKNUCKLE = 62
SKILL_U_CRAFTINGPACK = 64
SKILL_JOUSTER = 65
SKILL_SCAVENGER = 67
SKILL_U_ZAPPER_ARC = 68
SKILL_ULTRANIMBLE = 70
SKILL_D_FRAIL = 71
SKILL_U_MEDICCLOUD = 72
SKILL_SMARTTARGETING = 73
SKILL_GOURMET = 76
SKILL_BLOODARMOR = 79
SKILL_REGENERATOR = 80
SKILL_SAFEFALL = 83
SKILL_VITALITY3 = 84
SKILL_TANKER = 86
SKILL_U_CORRUPTEDFRAGMENT = 87
SKILL_WORTHINESS3 = 78
SKILL_WORTHINESS4 = 88
SKILL_FOCUS = 40
SKILL_WORTHINESS1 = 42
SKILL_WORTHINESS2 = 43
SKILL_WOOISM = 46
SKILL_U_DRONE = 28
SKILL_NANITECLOUD = 29
SKILL_STOIC1 = 6
SKILL_STOIC2 = 7
SKILL_STOIC3 = 8
SKILL_STOIC4 = 9
SKILL_STOIC5 = 10
SKILL_SURGEON1 = 11
SKILL_SURGEON2 = 12
SKILL_SURGEON3 = 13
SKILL_HANDY1 = 14
SKILL_HANDY2 = 15
SKILL_HANDY3 = 16
SKILL_MOTIONI = 17
SKILL_PHASER = 19
SKILL_TURRETLOCK = 25
SKILL_HAMMERDISCIPLINE = 30
SKILL_FIELDAMP = 31
SKILL_U_ROLLERMINE = 32
SKILL_HAULMODULE = 33
SKILL_TRIGGER_DISCIPLINE1 = 35
SKILL_TRIGGER_DISCIPLINE2 = 36
SKILL_TRIGGER_DISCIPLINE3 = 37
SKILL_D_PALSY = 38
SKILL_EGOCENTRIC = 44
SKILL_D_HEMOPHILIA = 47
SKILL_LASTSTAND = 54
SKILL_D_NOODLEARMS = 55
SKILL_GLASSWEAPONS = 56
SKILL_CANNONBALL = 57
SKILL_D_CLUMSY = 58
SKILL_CHEAPKNUCKLE = 59
SKILL_CRITICALKNUCKLE = 60
SKILL_KNUCKLEMASTER = 61
SKILL_D_LATEBUYER = 63
SKILL_VITALITY1 = 66
SKILL_TAUT = 69
SKILL_INSIGHT = 74
SKILL_GLUTTON = 75
SKILL_D_WEAKNESS = 81
SKILL_PREPAREDNESS = 82
SKILL_D_WIDELOAD = 85
SKILL_FORAGER = 89
SKILL_LANKY = 90
SKILL_PITCHER = 91
SKILL_BLASTPROOF = 92
SKILL_MASTERCHEF = 93
SKILL_SUGARRUSH = 94
SKILL_U_STRENGTHSHOT = 95
SKILL_STABLEHULL = 96
SKILL_LIGHTWEIGHT = 97
SKILL_AGILEI = 98
SKILL_U_CRYGASGREN = 99
SKILL_SOFTDET = 100
SKILL_STOCKPILE = 101
SKILL_ACUITY = 102
SKILL_VISION = 103
SKILL_U_ROCKETTURRET = 104
SKILL_RECLAIMSOL = 105
SKILL_ORPHICFOCUS = 106
SKILL_IRONBLOOD = 107
SKILL_BLOODLETTER = 108
SKILL_HAEMOSTASIS = 109
SKILL_SLEIGHTOFHAND = 110
SKILL_AGILEII = 111
SKILL_AGILEIII = 112
SKILL_BIOLOGYI = 113
SKILL_BIOLOGYII = 114
SKILL_BIOLOGYIII = 115
SKILL_FOCUSII = 116
SKILL_FOCUSIII = 117
SKILL_EQUIPPED = 118
SKILL_SURESTEP = 119
SKILL_INTREPID = 120
SKILL_CARDIOTONIC = 121
SKILL_BLOODLUST = 122
SKILL_SCOURER = 123
SKILL_LANKYII = 124
SKILL_U_ANTITODESHOT = 125
SKILL_DISPERSION = 126
SKILL_MOTIONII = 127
SKILL_MOTIONIII = 128
SKILL_D_SLOW = 129
SKILL_BRASH = 130
SKILL_CONEFFECT = 131
SKILL_CIRCULATION = 132
SKILL_SANGUINE = 133
SKILL_ANTIGEN = 134
SKILL_INSTRUMENTS = 135
SKILL_HANDY4 = 136
SKILL_HANDY5 = 137
SKILL_TECHNICIAN = 138
SKILL_BIOLOGYIV = 139
SKILL_SURGEONIV = 140
SKILL_DELIBRATION = 141
SKILL_DRIFT = 142
SKILL_WARP = 143
SKILL_LEVELHEADED = 144
SKILL_ROBUST = 145
SKILL_STOWAGE = 146
SKILL_TRUEWOOISM = 147
SKILL_UNBOUND = 148
SKILL_FOUR_IN_ONE = 149
SKILL_CHEESE = 150
SKILL_CARRIER = 151
SKILL_NULLED = 152
SKILL_OVERHAND = 153
SKILL_SIGILOL = 154
SKILL_UNSIGIL = 155
SKILL_SOULNET = 156
SKILL_GLASSMAN = 165
SKILL_THREE_IN_ONE = 188
SKILL_BANDOLIER = 200
SKILL_CURSEDTRINKETS = 201
SKILL_DONATE1 = 203
SKILL_BLOODLOST = 210
SKILL_ABUSE = 218
SKILL_HAMMERDISCIPLINE1 = 220
SKILL_HAMMERDISCIPLINE2 = 221
SKILL_LANKYIII = 226
SKILL_MECHANIC = 227
SKILL_CURSECURE = 228
SKILL_VKID = 235
SKILL_SOY = 236
SKILL_HAMMERDOOR = 240
SKILL_DAMAGER = 256
SKILL_CURSEDHEALTH = 257
SKILL_FOLGA = 258
SKILL_BLESSEDROD = 259
SKILL_UPLOAD = 261
SKILL_HOLY_MANTLE = 262
SKILL_BOUNTYKILLER = 264
SKILL_LIVER = 265
SKILL_LUCKY_UNLIVER = 266
SKILL_NOSEE = 267
SKILL_XPHUNTER = 270

SKILLMOD_HEALTH = 1
SKILLMOD_SPEED = 2
SKILLMOD_WORTH = 3
SKILLMOD_FALLDAMAGE_THRESHOLD_MUL = 4
SKILLMOD_FALLDAMAGE_RECOVERY_MUL = 5
SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL = 6
SKILLMOD_FOODRECOVERY_MUL = 7
SKILLMOD_FOODEATTIME_MUL = 8
SKILLMOD_JUMPPOWER_MUL = 9
SKILLMOD_RELOADSPEED_MUL = 11
SKILLMOD_DEPLOYSPEED_MUL = 12
SKILLMOD_UNARMED_DAMAGE_MUL = 13
SKILLMOD_UNARMED_SWING_DELAY_MUL = 14
SKILLMOD_MELEE_DAMAGE_MUL = 15
SKILLMOD_HAMMER_SWING_DELAY_MUL = 16
SKILLMOD_CONTROLLABLE_SPEED_MUL = 17
SKILLMOD_CONTROLLABLE_HANDLING_MUL = 18
SKILLMOD_CONTROLLABLE_HEALTH_MUL = 19
SKILLMOD_MANHACK_DAMAGE_MUL = 20
SKILLMOD_BARRICADE_PHASE_SPEED_MUL = 21
SKILLMOD_MEDKIT_COOLDOWN_MUL = 22
SKILLMOD_MEDKIT_EFFECTIVENESS_MUL = 23
SKILLMOD_REPAIRRATE_MUL = 24
SKILLMOD_TURRET_HEALTH_MUL = 25
SKILLMOD_TURRET_SCANSPEED_MUL = 26
SKILLMOD_TURRET_SCANANGLE_MUL = 27
SKILLMOD_BLOODARMOR = 28
SKILLMOD_MELEE_KNOCKBACK_MUL = 29
SKILLMOD_SELF_DAMAGE_MUL = 30
SKILLMOD_AIMSPREAD_MUL = 31
SKILLMOD_POINTS = 32
SKILLMOD_POINT_MULTIPLIER = 33
SKILLMOD_FALLDAMAGE_DAMAGE_MUL = 34
SKILLMOD_MANHACK_HEALTH_MUL = 35
SKILLMOD_DEPLOYABLE_HEALTH_MUL = 36
SKILLMOD_DEPLOYABLE_PACKTIME_MUL = 37
SKILLMOD_DRONE_SPEED_MUL = 38
SKILLMOD_DRONE_CARRYMASS_MUL = 39
SKILLMOD_MEDGUN_FIRE_DELAY_MUL = 40
SKILLMOD_RESUPPLY_DELAY_MUL = 41
SKILLMOD_FIELD_RANGE_MUL = 42
SKILLMOD_FIELD_DELAY_MUL = 43
SKILLMOD_DRONE_GUN_RANGE_MUL = 44
SKILLMOD_HEALING_RECEIVED = 45
SKILLMOD_RELOADSPEED_PISTOL_MUL = 46
SKILLMOD_RELOADSPEED_SMG_MUL = 47
SKILLMOD_RELOADSPEED_ASSAULT_MUL = 48
SKILLMOD_RELOADSPEED_SHELL_MUL = 49
SKILLMOD_RELOADSPEED_RIFLE_MUL = 50
SKILLMOD_RELOADSPEED_XBOW_MUL = 51
SKILLMOD_RELOADSPEED_PULSE_MUL = 52
SKILLMOD_RELOADSPEED_EXP_MUL = 53
SKILLMOD_MELEE_ATTACKER_DMG_REFLECT = 54
SKILLMOD_PULSE_WEAPON_SLOW_MUL = 55
SKILLMOD_MELEE_DAMAGE_TAKEN_MUL = 56
SKILLMOD_POISON_DAMAGE_TAKEN_MUL = 57
SKILLMOD_BLEED_DAMAGE_TAKEN_MUL = 58
SKILLMOD_MELEE_SWING_DELAY_MUL = 59
SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL = 60
SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL = 61
SKILLMOD_MELEE_POWERATTACK_MUL = 62
SKILLMOD_KNOCKDOWN_RECOVERY_MUL = 63
SKILLMOD_MELEE_RANGE_MUL = 64
SKILLMOD_SLOW_EFF_TAKEN_MUL = 65
SKILLMOD_EXP_DAMAGE_TAKEN_MUL = 66
SKILLMOD_FIRE_DAMAGE_TAKEN_MUL = 67
SKILLMOD_PROP_CARRY_CAPACITY_MUL = 68
SKILLMOD_PROP_THROW_STRENGTH_MUL = 69
SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL = 70
SKILLMOD_VISION_ALTER_DURATION_MUL = 71
SKILLMOD_DIMVISION_EFF_MUL = 72
SKILLMOD_PROP_CARRY_SLOW_MUL = 73
SKILLMOD_BLEED_SPEED_MUL = 74
SKILLMOD_MELEE_LEG_DAMAGE_ADD = 75
SKILLMOD_SIGIL_TELEPORT_MUL = 76
SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT = 77
SKILLMOD_POISON_SPEED_MUL = 78
SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL = 79
SKILLMOD_EXP_DAMAGE_RADIUS = 80
SKILLMOD_MEDGUN_RELOAD_SPEED_MUL = 81
SKILLMOD_WEAPON_WEIGHT_SLOW_MUL = 82
SKILLMOD_FRIGHT_DURATION_MUL = 83
SKILLMOD_IRONSIGHT_EFF_MUL = 84
SKILLMOD_BLOODARMOR_DMG_REDUCTION = 85
SKILLMOD_BLOODARMOR_MUL = 86
SKILLMOD_BLOODARMOR_GAIN_MUL = 87
SKILLMOD_LOW_HEALTH_SLOW_MUL = 88
SKILLMOD_PROJ_SPEED = 89
SKILLMOD_SCRAP_START = 90
SKILLMOD_ENDWAVE_POINTS = 91
SKILLMOD_ARSENAL_DISCOUNT = 92
SKILLMOD_CLOUD_RADIUS = 93
SKILLMOD_CLOUD_TIME = 94
SKILLMOD_PROJECTILE_DAMAGE_MUL = 95
SKILLMOD_EXP_DAMAGE_MUL = 96
SKILLMOD_TURRET_RANGE_MUL = 97
SKILLMOD_AIM_SHAKE_MUL = 98
SKILLMOD_MEDDART_EFFECTIVENESS_MUL = 99
SKILLMOD_DAMAGE = 100
SKILLMOD_SCRAPDISCOUNT = 101
SKILLMOD_XP = 102
SKILLMOD_LUCK = 103
SKILLMOD_CURSEM = 104
SKILLMOD_BLOCKMULTIPLIER = 105

local GOOD = "^"..COLORID_GREEN
local BAD = "^"..COLORID_RED
local NEUTRAL = "^"..COLORID_GRAY
local PURPLE = "^"..COLORID_PURPLE
--

-- Health Tree
GM:AddSkill(SKILL_STOIC1, ""..translate.Get("skill_stoici_0"), GOOD..""..translate.Get("skill_stoici_d1")..BAD..""..translate.Get("skill_stoici_d2"),
																-4,			-6,					{SKILL_NONE, SKILL_STOIC2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC2, ""..translate.Get("skill_stoicii_0"), GOOD..""..translate.Get("skill_stoicii_d1")..BAD..""..translate.Get("skill_stoicii_d2"),
																-4,			-4,					{SKILL_STOIC3, SKILL_VITALITY1, SKILL_REGENERATOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC3, ""..translate.Get("skill_stoiciii_0"), GOOD..""..translate.Get("skill_stoiciii_d1")..BAD..""..translate.Get("skill_stoiciii_d2"),
																-3,			-2,					{SKILL_STOIC4}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC4, ""..translate.Get("skill_stoiciv_0"), GOOD..""..translate.Get("skill_stoiciv_d1")..BAD..""..translate.Get("skill_stoiciv_d2"),
																-3,			0,					{SKILL_STOIC5}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC5, ""..translate.Get("skill_stoicv_0"), GOOD..""..translate.Get("skill_stoicv_d1")..BAD..""..translate.Get("skill_stoicv_d2"),
																-3,			2,					{SKILL_BLOODARMOR, SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_HEMOPHILIA, ""..translate.Get("skill_hemoplilia_0"), GOOD..""..translate.Get("skill_hemoplilia_d1")..GOOD..""..translate.Get("skill_hemoplilia_d2")..BAD..""..translate.Get("skill_hemoplilia_d3"),
																4,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GLUTTON,  ""..translate.Get("skill_glutton_0"), GOOD.. ""..translate.Get("skill_glutton_d1")..GOOD.. ""..translate.Get("skill_glutton_d2")..GOOD.. ""..translate.Get("skill_glutton_d3")..BAD.. ""..translate.Get("skill_glutton_d4"),
																3,			-2,					{SKILL_GOURMET, SKILL_BLOODARMOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_PREPAREDNESS, ""..translate.Get("skill_prepadnes_0"), GOOD..""..translate.Get("skill_prepadnes_d"),
																4,			-6,					{SKILL_NONE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GOURMET, ""..translate.Get("skill_gurman_0"), GOOD..""..translate.Get("skill_gurman_d1")..BAD..""..translate.Get("skill_gurman_d2"),
																4,			-4,					{SKILL_PREPAREDNESS, SKILL_VITALITY1}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_HAEMOSTASIS, ""..translate.Get("skill_haemostasis_0"), GOOD..""..translate.Get("skill_haemostasis_d1")..BAD..""..translate.Get("skill_haemostasis_d2")..GOOD..""..translate.Get("skill_haemostasis_d3"),
																4,			6,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLETTER, ""..translate.Get("skill_bloodlet_0"), GOOD..""..translate.Get("skill_bloodlet_d1")..BAD..""..translate.Get("skill_bloodlet_d2"),
																0,			4,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_REGENERATOR, ""..translate.Get("skill_regen_0"), GOOD..""..translate.Get("skill_regen_d1")..BAD..""..translate.Get("skill_regen_d2"),
																-5,			-2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_NULLED, ""..translate.Get("skill_regen1_0"), GOOD..""..translate.Get("skill_regen1_d1"),
			                                                   	-5,			0,					{SKILL_REGENERATOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODARMOR, ""..translate.Get("skill_bloodarmor_0"), GOOD..translate.Get("skill_bloodarmor_d1") ..BAD..translate.Get("skill_bloodarmor_d2"),
																2,			2,					{SKILL_IRONBLOOD, SKILL_BLOODLETTER, SKILL_D_HEMOPHILIA}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_IRONBLOOD, ""..translate.Get("skill_ironblood_0"), GOOD..translate.Get("skill_ironblood_d1") ..GOOD..translate.Get("skill_ironblood_d2") ..BAD..translate.Get("skill_ironblood_d3"),
																2,			4,					{SKILL_HAEMOSTASIS, SKILL_CIRCULATION}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_WEAKNESS, ""..translate.Get("skill_d_weakness_0"), GOOD..""..translate.Get("skill_d_weakness_d1")..GOOD..""..translate.Get("skill_d_weakness_d2")..BAD..""..translate.Get("skill_d_weakness_d3")..BAD..""..translate.Get("skill_d_weakness_d4"),
																1,			-1,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY1, ""..translate.Get("skill_vitalityi_0"), GOOD..translate.Get("skill_vitalityi_d1"),
																0,			-4,					{SKILL_VITALITY2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY2, ""..translate.Get("skill_vitalityii_0"), GOOD..translate.Get("skill_vitalityii_d1"),
																0,			-2,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY3, ""..translate.Get("skill_vitalityiii_0"), GOOD..translate.Get("skill_vitalityiii_d1"),
																0,			-0,					{SKILL_D_WEAKNESS}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE, ""..translate.Get("skill_cheese_0"), GOOD..translate.Get("skill_cheese_d1"),
																1,			1,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_TANKER, ""..translate.Get("skill_tanker_0"), GOOD..""..translate.Get("skill_tanker_d1")..BAD..""..translate.Get("skill_tanker_d2"),
																-5,			4,					{SKILL_LIVER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_LIVER,  ""..translate.Get("skill_curse_0"), BAD..""..translate.Get("skill_curse_d1")..GOOD..""..translate.Get("skill_curse_d2")..GOOD..""..translate.Get("skill_curse_d3")..GOOD.."+30"..translate.Get("worth"),
																-5,			5,					{SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_HEALTH, 30)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_FORAGER, ""..translate.Get("skill_f_0"), GOOD..""..translate.Get("skill_f_d1")..BAD..""..translate.Get("skill_f_d2"),
																5,			-2,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_SUGARRUSH, ""..translate.Get("skill_srush_0"), GOOD..""..translate.Get("skill_srush_d1")..BAD..""..translate.Get("skill_srush_d2"),
																4,			0,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION, ""..translate.Get("skill_cir_0"), GOOD..""..translate.Get("skill_cir_d1"),
																4,			4,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_SANGUINE, ""..translate.Get("skill_san_0"), GOOD..""..translate.Get("skill_san_d1")..BAD..""..translate.Get("skill_san_d2"),
																6,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ANTIGEN, ""..translate.Get("skill_agen_0"), GOOD..""..translate.Get("skill_agen_d1")..BAD..""..translate.Get("skill_agen_d2"),
																-2,			4,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_DAMAGER, ""..translate.Get("skill_bhealth_0"), GOOD..""..translate.Get("skill_bhealth_d1")..BAD..""..translate.Get("skill_bhealth_d2"),
																-2,			5,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
-- Speed Tree
GM:AddSkill(SKILL_SPEED1, translate.Get("skill_speed").."I", GOOD.."+5"..translate.Get("speed")..BAD.."-4"..translate.Get("health"),
																-4,			6,					{SKILL_NONE, SKILL_SPEED2}, TREE_SPEEDTREE)
SKILL_DODGE = 263
GM:AddSkill(SKILL_DODGE, ""..translate.Get("skill_dodge"), GOOD..""..translate.Get("skill_dodge_d1")..GOOD..""..translate.Get("skill_dodge_d2")..BAD.."-50"..translate.Get("speed"),
																-3,			1,					{SKILL_SPEED2}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_DODGE, SKILLMOD_SPEED, -50)

GM:AddSkill(SKILL_SPEED2, translate.Get("skill_speed").."II", GOOD.."+5"..translate.Get("speed")..BAD.."-7"..translate.Get("health"),
																-4,			4,					{SKILL_SPEED3, SKILL_PHASER, SKILL_SPEED2, SKILL_U_CORRUPTEDFRAGMENT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED3, translate.Get("skill_speed").."III", GOOD.."+6"..translate.Get("speed")..BAD.."-6"..translate.Get("health"),
																-4,			2,					{SKILL_SPEED4}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED4, translate.Get("skill_speed").."IV", GOOD.."+11"..translate.Get("speed")..BAD.."-8"..translate.Get("health"),
																-4,			0,					{SKILL_SPEED5, SKILL_SAFEFALL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED5, translate.Get("skill_speed").."V", GOOD.."+10"..translate.Get("speed")..BAD.."-11"..translate.Get("health"),
																-4,			-2,					{SKILL_ULTRANIMBLE, SKILL_BACKPEDDLER, SKILL_MOTIONI, SKILL_CARDIOTONIC, SKILL_UNBOUND}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEI, translate.Get("skill_agile").."I", GOOD.."+4%"..translate.Get("jump")..BAD.."-2"..translate.Get("speed"),
																4,			6,					{SKILL_NONE, SKILL_AGILEII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEII, translate.Get("skill_agile").."II", GOOD.."+5%"..translate.Get("jump")..BAD.."-3"..translate.Get("speed"),
																4,			2,					{SKILL_AGILEIII, SKILL_WORTHINESS3}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEIII, translate.Get("skill_agile").."III", GOOD.."+6%"..translate.Get("jump")..BAD.."-4"..translate.Get("speed"),
																4,			-2,					{SKILL_SAFEFALL, SKILL_ULTRANIMBLE, SKILL_SURESTEP, SKILL_INTREPID, SKILL_VKID, SKILL_NOSEE}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_VKID, ""..translate.Get("skill_vkid"), GOOD.."+30%"..translate.Get("jump")..GOOD.."+60"..translate.Get("speed")..GOOD..""..translate.Get("skill_vkid_d")..BAD.."-50"..translate.Get("health"),
																4,			-3,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_SLOW, ""..translate.Get("skill_slow"), GOOD..""..translate.Get("skill_slow_d1")..GOOD..""..translate.Get("skill_slow_d2")..BAD..""..translate.Get("skill_slow_d3")..BAD..""..translate.Get("skill_slow_d4"),
																0,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_NOSEE, ""..translate.Get("skill_cursevision_0"), GOOD..""..translate.Get("skill_cursevision_d1")..GOOD..""..translate.Get("skill_cursevision_d2")..BAD..""..translate.Get("skill_cursevision_d3"),
																6.5,			-2,					{SKILL_AGILEIII}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_SPEED, 50)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_MOTIONI, ""..translate.Get("skill_motion1"), GOOD..""..translate.Get("skill_motion_d_all"),
																-2,			-2,					{SKILL_MOTIONII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONII, ""..translate.Get("skill_motion2"), GOOD..""..translate.Get("skill_motion_d_all"),
																-1,			-1,					{SKILL_MOTIONIII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONIII, ""..translate.Get("skill_motion3"), GOOD..""..translate.Get("skill_motion_d_all"),
																0,			-2,					{SKILL_D_SLOW}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_BACKPEDDLER, ""..translate.Get("skill_backpeddler"), GOOD..""..translate.Get("skill_backpeddler_d1")..BAD..""..translate.Get("skill_backpeddler_d2")..BAD..""..translate.Get("skill_backpeddler_d3"),
																-6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_PHASER, ""..translate.Get("skill_phaser"), GOOD.."+15%"..translate.Get("barricadespeed")..BAD.."+15%"..translate.Get("sigilteleport"),
																-1,			4,					{SKILL_D_WIDELOAD, SKILL_DRIFT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_DRIFT, ""..translate.Get("skill_drifter"), GOOD.."+5%"..translate.Get("barricadespeed"),
																1,			3,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_WARP, ""..translate.Get("skill_warp"), GOOD.."-5%"..translate.Get("sigilteleport"),
																2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SIGILOL, ""..translate.Get("skill_s_inf"), GOOD.."+300%"..translate.Get("barricadespeed")..BAD.."+100%"..translate.Get("sigilteleport"),
																2,			4,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDTRINKETS, ""..translate.Get("skill_cursedd"), GOOD..""..translate.Get("skill_cursed")..BAD..""..translate.Get("skill_cursed")..GOOD..""..translate.Get("skill_cursed"),
																2,		    5,					{SKILL_SIGILOL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDHEALTH, ""..translate.Get("skill_mda"), GOOD..""..translate.Get("skill_mda_d")..BAD.."-25%"..translate.Get("m_curse"),
																1,		    4.5,					{SKILL_CURSEDTRINKETS}, TREE_SPEEDTREE)





GM:AddSkill(SKILL_SAFEFALL, ""..translate.Get("skill_sfall"), GOOD..""..translate.Get("skill_sfall_d1")..GOOD..""..translate.Get("skill_sfall_d2")..BAD..""..translate.Get("skill_sfall_d3"),
																0,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_WIDELOAD, ""..translate.Get("skill_wideroad_0"), GOOD.."+20"..translate.Get("worth")..GOOD.."-20%"..translate.Get("res_delay")..BAD..""..translate.Get("skill_wideroad_d1"),
																1,			1,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_U_CORRUPTEDFRAGMENT, ""..translate.Get("skill_sigil_corrupt_0"), GOOD..""..translate.Get("skill_sigil_corrupt_d0"),
																-2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ULTRANIMBLE, ""..translate.Get("skill_salostealer"), GOOD.."+30"..translate.Get("speed")..BAD.."-10"..translate.Get("health"),
																0,			-6,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_WORTHINESS3, translate.Get("worthness").."III", GOOD.."+10"..translate.Get("worth")..BAD.."-3"..translate.Get("start_points"),
																6,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SURESTEP, ""..translate.Get("skill_step_0"), GOOD..""..translate.Get("skill_step_d0")..BAD.."-4"..translate.Get("speed"),
																6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_INTREPID, ""..translate.Get("skill_int_0"), GOOD..""..translate.Get("skill_int_d0")..BAD.."-4"..translate.Get("speed"),
																6,			-4,					{SKILL_ROBUST}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ROBUST, "Robust", GOOD.."-6% movement speed reduction with heavy weapons",
																5,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CARDIOTONIC, "Cardiotonic", GOOD.."Hold shift to run whilst draining blood armor\n"..BAD.."-12"..translate.Get("speed")..BAD.."-20% blood armor damage absorption\nSprinting grants +40 move speed",
																-6,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_UNBOUND, "Unbound", GOOD.."-60% reduced delay from switching weapons affecting movement speed\n"..BAD.."-4"..translate.Get("speed"),
																-4,			-4,					{}, TREE_SPEEDTREE)
-- Medic Tree
GM:AddSkill(SKILL_SURGEON1, translate.Get("skill_surg").."I", GOOD.."-6%"..translate.Get("med_cool"),
																-4,			6,					{SKILL_NONE, SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON2, translate.Get("skill_surg").."II", GOOD.."-9%"..translate.Get("med_cool"),
																-3,			3,					{SKILL_WORTHINESS4, SKILL_SURGEON3}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON3, translate.Get("skill_surg").."III", GOOD.."-11%"..translate.Get("med_cool"),
																-2,			0,					{SKILL_U_MEDICCLOUD, SKILL_D_FRAIL, SKILL_SURGEONIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEONIV, translate.Get("skill_surg").."IV", GOOD.."-21%"..translate.Get("med_cool"),
																-2,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYI, translate.Get("skill_bio").."I", GOOD.."+8%"..translate.Get("med_effect"),
																4,			6,					{SKILL_NONE, SKILL_BIOLOGYII}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYII, translate.Get("skill_bio").."II", GOOD.."+13%"..translate.Get("med_effect"),
																3,			3,					{SKILL_BIOLOGYIII, SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIII, translate.Get("skill_bio").."III", GOOD.."+18%"..translate.Get("med_effect"),
																2,			0,					{SKILL_U_MEDICCLOUD, SKILL_U_ANTITODESHOT, SKILL_BIOLOGYIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIV, translate.Get("skill_bio").."IV", GOOD.."+21%"..translate.Get("med_effect"),
																2,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_D_FRAIL, "Debuff: Frail", GOOD.."-33%"..translate.Get("med_cool")..GOOD.."+33%"..translate.Get("med_effect")..BAD.."Cannot be healed above 44% health",
																-4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_MEDICCLOUD, "Unlock: Medic Cloud Bomb", GOOD.."Unlocks purchasing the Medic Cloud Bomb\nSlowly heals all humans inside the cloud",
																0,			-2,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_SMARTTARGETING, "Smart Targeting", GOOD.."Medical weapon darts lock onto targets with right click\n"..BAD.."+75% medic tool fire delay\n"..BAD.."-30% healing effectiveness on medical darts",
																0,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_RECLAIMSOL, "Recoverable Solution", GOOD.."60% of wasted medical dart ammo is returned to you\n"..BAD.."+150% medic tool fire delay\n"..BAD.."-40% medic tool reload speed\n"..BAD.."Cannot speed boost full health players",
																0,			4,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_STRENGTHSHOT, "Unlock: Strength Shot Gun", GOOD.."Unlocks purchasing the Strength Shot Gun\nTarget damage +25% for 10 seconds\nExtra damage is given to you as points\nTarget is not healed",
																0,			0,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_WORTHINESS4, "Worthiness IV", GOOD.."+10 starting worth\n"..BAD.."-3 starting points",
																-5,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_ANTITODESHOT, "Unlock: Antidote Handgun", GOOD.."Unlocks purchasing the Antidote Handgun\nFires piercing blasts that heal poison greatly\nCleanses statuses from targets with a small point gain\nDoes not heal health",
																4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_DISPERSION, "Dispersion", GOOD.."+15% cloud bomb radius\n"..BAD.."-10% cloud bomb time",
																0,			-4,					{}, TREE_SUPPORTTREE)

-- Defence Tree
GM:AddSkill(SKILL_HANDY1, "Handy I", GOOD.."+5% repair rate",
																-5,			-6,					{SKILL_NONE, SKILL_HANDY2}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY2, "Handy II", GOOD.."+6% repair rate",
																-5,			-4,					{SKILL_HANDY3, SKILL_U_BLASTTURRET, SKILL_LOADEDHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY3, "Handy III", GOOD.."+8% repair rate",
																-5,			-1,					{SKILL_TAUT, SKILL_HAMMERDISCIPLINE, SKILL_D_NOODLEARMS, SKILL_HANDY4}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY4, "Handy IV", GOOD.."+11% repair rate",
																-3,			1,					{SKILL_HANDY5}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY5, "Handy V", GOOD.."+13% repair rate",
																-3,			3,					{SKILL_OVERHAND}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_OVERHAND, "OverHandy", GOOD.."+25% repair rate\n"..BAD.."+15% swing delay",
																-3,			4,					{SKILL_HANDY5}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE, "Hammer Discipline I", GOOD.."-5% swing delay with the Carpenter Hammer",
																0,			1,					{SKILL_BARRICADEEXPERT}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE1, "Hammer Discipline II", GOOD.."-10% swing delay with the Carpenter Hammer",
																0,			0,					{SKILL_HAMMERDISCIPLINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE2, "Hammer Discipline III", GOOD.."-15% swing delay with the Carpenter Hammer",
																0,			-1,					{SKILL_HAMMERDISCIPLINE1}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BARRICADEEXPERT, "Reinforcer", GOOD.."Props hit with a hammer in the last 7 seconds take 8% less damage\n"..GOOD.."Gain points from protected props\n"..BAD.."+20% swing delay with the Carpenter Hammer",
																0,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_LOADEDHULL, "Loaded Hull", GOOD.."Controllables explode when destroyed, dealing explosive damage\n"..BAD.."-10% Controllable health",
																-2,			-4,					{SKILL_REINFORCEDHULL, SKILL_REINFORCEDBLADES, SKILL_AVIATOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDHULL, "Reinforced Hull", GOOD.."+25% Controllable health\n"..BAD.."-20% Controllable handling\n"..BAD.."-20% Controllable speed",
																-2,			-2,					{SKILL_STABLEHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STABLEHULL, "Stable Hull", GOOD.."Controllables are immune to high speed impacts\n"..BAD.."-20% Controllable speed",
																0,			-3,					{SKILL_U_DRONE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDBLADES, "Reinforced Blades", GOOD.."+25% Manhack damage\n"..BAD.."-15% Manhack health",
																0,			-5,					{SKILL_MECHANIC}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_MECHANIC, "Mechanic", GOOD.."-15% Scrap cost\n"..BAD.."-15% Arsenal Discount",
																0,			-6,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_AVIATOR, "Aviator", GOOD.."+40% Controllable speed and handling\n"..BAD.."-25% Controllable health",
																-4,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_BLASTTURRET, "Unlock: Blast Turret", GOOD.."Unlocks purchasing the Blast Turret\nFires buckshot instead of SMG ammo\nDamage is higher close up\nCannot scan for targets far away",
																-8,			-4,					{SKILL_TURRETLOCK, SKILL_TWINVOLLEY, SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TURRETLOCK, "Turret Lock", "-90% turret scan angle\n"..BAD.."-90% turret target lock angle",
																-6,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TWINVOLLEY, "Twin Volley", GOOD.."Fire twice as many bullets in manual turret mode\n"..BAD.."+100% turret ammo usage in manual turret mode\n"..BAD.."+50% turret fire delay in manual turret mode",
																-10,		-5,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TURRETOVERLOAD, "Turret Overload", GOOD.." +100% Turret scan speed\n"..BAD.."-30% Turret range",
																-8,			-2,					{SKILL_INSTRUMENTS}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_DRONE, "Unlock: Pulse Drone", GOOD.."Unlocks the Pulse Drone Variant\nFires short range pulse projectiles instead of bullets",
																2,			-3,					{SKILL_HAULMODULE, SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_NANITECLOUD, "Nanite", GOOD.."+12% Repair rate",
																3,			1,					{SKILL_HAMMERDISCIPLINE,SKILL_JEW}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkillModifier(SKILL_NANITECLOUD, SKILLMOD_REPAIRRATE_MUL, 0.12)
SKILL_JEW = 237
GM:AddSkill(SKILL_JEW, "Jew", GOOD.."+25% Arsenal discount and scrap discount\n+50 Start points\n"..BAD.."-5 Points every time when you get a LOOT",
																3,			2,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
																
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_POINTS, 50)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_ARSENAL_DISCOUNT, -0.25)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_SCRAPDISCOUNT, -0.25)
GM:AddSkill(SKILL_FIELDAMP, "Field Amplifier", GOOD.."-20% zapper and repair field delay\n"..BAD.."-40% zapper and repair field range",
																6,			4,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TECHNICIAN, "Field Technician", GOOD.." +3% zapper and repair field range\n"..GOOD.."-3% zapper and repair field delay",
																4,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROLLERMINE, "Unlock: Rollermine", GOOD.."Unlocks purchasing Rollermines\nRolls along the ground, shocking zombies and dealing damage",
																3,			-5,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAULMODULE, "Unlock: Hauling Drone", GOOD.."Unlocks the Hauling Drone\nRapidly transports props and items but cannot attack",
																2,			-1,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_LIGHTCONSTRUCT, "Light Construction", GOOD.."-25% deployable pack time\n"..BAD.."-25% deployable health",
																8,			-1,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOCKPILE, "Stockpiling", GOOD.."Collect twice as much from resupplies\n"..BAD.."2x resupply box delay",
																8,			-3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_ACUITY, "Supplier's Acuity", GOOD.."Locate nearby resupply boxes if behind walls\n"..GOOD.."Locate nearby unplaced resupply boxes on players through walls\n"..GOOD.."Locate nearby resupply packs through walls",
																6,			-3,					{SKILL_INSIGHT, SKILL_STOCKPILE, SKILL_U_CRAFTINGPACK, SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_VISION, "Refiner's Vision", GOOD.."Locate nearby remantlers if behind walls\n"..GOOD.."Locate nearby unplaced remantlers on players through walls",
																6,			-6,					{SKILL_NONE, SKILL_ACUITY}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROCKETTURRET, "Unlock: Rocket Turret", GOOD.."Unlocks purchasing the Rocket Turret\nFires explosives instead of SMG ammo\nDeals damage in a radius\nHigh tier deployable",
																-8,			-0,					{SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSIGHT, "Buyer's Insight", GOOD.."+2% Arsenal Discount\n"..GOOD.."Locate nearby unplaced arsenal crates on players through walls\n"..GOOD.."Locate nearby arsenal packs through walls",
																6,			-0,					{SKILL_NANITECLOUD, SKILL_U_ZAPPER_ARC, SKILL_LIGHTCONSTRUCT, SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_U_ZAPPER_ARC, "Unlock: Arc Zapper", GOOD.."Unlocks purchasing the Arc Zapper\nZaps zombies that get nearby, and jumps in an arc\nMid tier deployable and long cooldown\nRequires a steady upkeep of pulse ammo",
																6,			2,					{SKILL_FIELDAMP, SKILL_TECHNICIAN}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_D_LATEBUYER, "Debuff: Late Buyer", GOOD.."+20 starting Worth\n"..GOOD.."66% arsenal discount\n"..BAD.."Unable to use points at arsenal crates until the second half of the round",
																8,			1,					{SKILL_HAMMERDOOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDOOR, "Door destroyer 3000", GOOD.."Door take 350 damage when hit them with hammer\n"..BAD.."+10% Hammer swing delay",
																8,			3,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_HAMMERDOOR, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.10)
GM:AddSkill(SKILL_CARRIER, "Carrier", GOOD.."+100% Speed when you take prop\n"..BAD.."-50% Deployable health\n"..BAD.."-50% Deployable packtime",
																9,			2,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_CRAFTINGPACK, "Unlock: Crafting Pack", GOOD.."Unlocks purchasing the Sawblade component\n"..GOOD.."Unlocks purchasing the Electrobattery component\n"..GOOD.."Unlocks purchasing the CPU Parts component",
																4,			-1,					{}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TAUT, "Taut", GOOD.."Damage does not make you drop props\n"..BAD.."+40% prop carrying slow down",
																-5,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_D_NOODLEARMS, "Debuff: Noodle Arms", GOOD.."+5 starting Worth\n"..GOOD.."+1 starting scrap\n"..BAD.."Unable to pick up objects",
																-7,			2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSTRUMENTS, "Instruments", GOOD.."+5% turret range",
																-10,		-3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOWAGE, 	"Stowage", GOOD.."Resupply usages build up when you're not there\n"..BAD.."-15% resupply delay",
																4,			-3,					{SKILL_NANITES}, TREE_BUILDINGTREE)
SKILL_NANITES = 241
GM:AddSkill(SKILL_NANITES, 	"Nanites", GOOD.."Props hit with a hammer take only 20% damage for 0.3 secs\n"..BAD.."-10% repair strenght",
																4,			-4,					{SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_NANITES, SKILLMOD_REPAIRRATE_MUL, -0.10)
GM:AddSkill(SKILL_FOLGA, 	"Rigid Foil", GOOD.."Reduces damage received by 5",
																4,			-5.5,					{SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BLESSEDROD, 	"Blessed Rod", GOOD.."Reduces damage received by 12\n But only if damage higher than 30\n"..GOOD.."+15% Max Curse\n"..BAD.."+6% Melee damage taken",
																4,			-7,					{SKILL_FOLGA}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.06)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_CURSEM, 0.15)


-- Gunnery Tree

GM:AddSkill(SKILL_UNSIGIL, "Uncorrupter", GOOD.."+24% Reload speed\n"..GOOD.."+15% Bullet Damage\n"..BAD.."-80% Melee damage",
																0,			2,					{SKILL_LEVELHEADED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_UNSIGIL, SKILLMOD_DAMAGE, 0.15)
SKILL_PHOENIX = 260
GM:AddSkill(SKILL_PHOENIX, "Phoenix", GOOD.."Instead of death, it can redeem\nOnly once",
																0,			6,					{SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE1, "Trigger Discipline I", GOOD.."+2% weapon reload speed and 3% Bullet damage\n"..GOOD.."+2% weapon draw speed\n"..BAD.."-9% Melee damage",
																-5,			6,					{SKILL_TRIGGER_DISCIPLINE2, SKILL_NONE}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE2, "Trigger Discipline II", GOOD.."+3% weapon reload speed and 5% Bullet damage\n"..GOOD.."+3% weapon draw speed\n"..BAD.."-13% Melee Damage",
																-4,			3,					{SKILL_TRIGGER_DISCIPLINE3, SKILL_D_PALSY, SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE3, "Trigger Discipline III", GOOD.."+4% weapon reload speed and 9% Bullet damage\n"..GOOD.."+4% weapon draw speed\n"..BAD.."-18% Melee damage",
																-3,			0,					{SKILL_QUICKRELOAD, SKILL_QUICKDRAW, SKILL_WORTHINESS1, SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_DAMAGE, 0.03)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_DAMAGE, 0.09)
GM:AddSkill(SKILL_D_PALSY, "Debuff: Palsy", GOOD.."+10 starting Worth\n"..GOOD.."-3% resupply delay\n"..BAD.."Aiming ability reduced when health is low",
																0,			4,					{SKILL_LEVELHEADED,SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkill(SKILL_LEVELHEADED, "Level Headed", GOOD.."-5% reduced effect of aim shake effects",
																-2,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_QUICKDRAW, "Quick Draw", GOOD.."+65% weapon draw speed\n"..BAD.."-15% weapon reload speed",
																0,			1,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUS, "Focus I", GOOD.."+11% tighter aiming reticule\n"..GOOD.."+1% Bullet Damage\n"..BAD.."-3% weapon reload speed",
																5,			6,					{SKILL_NONE, SKILL_FOCUSII}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSII, "Focus II", GOOD.."+9% tighter aiming reticule\n"..GOOD.."+3% Bullet Damage\n"..BAD.."-7% weapon reload speed",
																4,			3,					{SKILL_FOCUSIII, SKILL_SCAVENGER, SKILL_D_PALSY, SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSIII, "Focus III", GOOD.."+12% tighter aiming reticule\n"..GOOD.."+5% Bullet Damage\n"..BAD.."-6% weapon reload speed",
																3,			0,					{SKILL_EGOCENTRIC, SKILL_WOOISM, SKILL_ORPHICFOCUS, SKILL_SCOURER}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_DAMAGE, 0.01)
GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_DAMAGE, 0.03)
GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_DAMAGE, 0.05)
SKILL_ARSVOID = 238
GM:AddSkill(SKILL_ARSVOID, "Arsenal Void", GOOD.."Can give random weapon in end wave\nLuck can increase chance of drop\n"..GOOD.."+15% Bullet Damage\n"..BAD.."-20% Arsenal Discount",
																6,			-4,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_DAMAGE, 0.15)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_ARSENAL_DISCOUNT, 0.15)
SKILL_GUNSLINGER = 252
GM:AddSkill(SKILL_GUNSLINGER, "Gunslinger", GOOD.."+15% Accuracy\n"..GOOD.."+15% Bullet Damage\n"..BAD.."-30% Melee damage\n"..BAD.."-50% Melee range",
																0,			5,					{SKILL_D_PALSY, SKILL_PHOENIX}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_DAMAGE, 0.15)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_AIMSPREAD_MUL, -0.15)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_DAMAGE_MUL, -0.30)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_RANGE_MUL, -0.50)
GM:AddSkill(SKILL_BOUNTYKILLER, "Bounty", GOOD.."On kill give 5 xp\n"..BAD.."-15% Bullet Damage",
																1,			6,					{SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BOUNTYKILLER, SKILLMOD_DAMAGE, -0.15)


GM:AddSkill(SKILL_QUICKRELOAD, "Quick Reload", GOOD.."+10% weapon reload speed\n"..BAD.."-25% weapon draw speed",
																-5,			1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_SLEIGHTOFHAND, "Sleight of Hand", GOOD.."+10% weapon reload speed\n"..BAD.."-5% tighter aiming reticule",
																-5,			-2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_BANDOLIER, "Bandolier", GOOD.."Give specific buff for reload speed for every weapon and passive +5%\n+13% For Assault;+9% To Explosive\n+21% To Pistol;+11% to Pulse\n+20% To Rifle;+44% For Shotgun\n+12% To SMG;+9% To crossbow",
																-6,			-1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_U_CRYGASGREN, "Unlock: Cryo Gas Grenade", GOOD.."Unlocks purchasing the Cryo Gas Grenade\nVariant of the Corrosive Gas Grenade\nCryo gas deals a bit of damage over time\nZombies are slowed in the effect",
																2,			-3,					{SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkill(SKILL_SOFTDET, "Soft Detonation", GOOD.."-40% explosive damage taken\n"..BAD.."-10% explosive damage radius",
																0,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_ORPHICFOCUS, "Orphic Focus", GOOD.."90% spread while ironsighting\n"..GOOD.."+2% tighter aiming reticule\n"..BAD.."110% spread at any other time\n"..BAD.."-6% reload speed",
																5,			-1,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkill(SKILL_DELIBRATION, "Delibration", GOOD.."+3% tighter aiming reticule\n"..GOOD.."+1% Bullet damage",
																6,			-3,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_DELIBRATION, SKILLMOD_DAMAGE, 0.01)
GM:AddSkill(SKILL_EGOCENTRIC, "Egocentric", GOOD.."-15% damage vs. yourself\n"..BAD.."-5 health",
																0,			-1,					{SKILL_BLASTPROOF}, TREE_GUNTREE)
GM:AddSkill(SKILL_BLASTPROOF, "Blast Proof", GOOD.."-40% damage vs. yourself\n"..BAD.."-10% reload speed\n"..BAD.."-12% weapon draw speed",
																0,			-3,					{SKILL_SOFTDET, SKILL_CANNONBALL, SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_WOOISM, "Zeal", GOOD.."-50% speed reduction from being ironsighted\n"..BAD.."-25% accuracy bonus from ironsighting",
																5,			1,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCAVENGER, "Scavenger's Eyes", GOOD.."See nearby weapons, ammo, and items through walls",
																7,			4,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_PITCHER, "Pitcher", GOOD.."+10% object throw and thrown weapon velocity",
																6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_EQUIPPED, "Alacrity", GOOD.."Your starting item can be a random special trinket",
																-6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_WORTHINESS1, "Worthiness I", GOOD.."+10 starting worth\n"..BAD.."-3 starting points",
																-4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CANNONBALL, "Cannonball", "-25% projectile speed\n"..GOOD.."+3% projectile damage",
																-2,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCOURER, "Scourer", GOOD.."Earn end of wave points as scrap\n"..BAD.."Earn no end of wave points",
																4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CONEFFECT, "Concentrated Effect", GOOD.."+5% explosive damage\n"..BAD.."-20% explosive damage radius",
																2,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRUEWOOISM, "Wooism", GOOD.."No accuracy penalty from moving or jumping\n"..BAD.."No accuracy bonus from crouching or ironsighting",
																7,			0,					{}, TREE_GUNTREE)

-- Melee Tree
GM:AddSkill(SKILL_WORTHINESS2, "Worthiness II", GOOD.."+10 starting worth\n"..BAD.."-3 starting points",
																4,			0,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER1, "Battler I", GOOD.."+3% melee damage\n"..BAD.."-2% weapon reload speed",
																-6,			-6,					{SKILL_BATTLER2, SKILL_NONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER2, "Battler II", GOOD.."+6% melee damage\n"..BAD.."-4% weapon reload speed",
																-6,			-4,					{SKILL_BATTLER3, SKILL_LIGHTWEIGHT}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER3, "Battler III", GOOD.."+8% melee damage\n"..BAD.."-9% weapon reload speed",
																-4,			-2,					{SKILL_BATTLER4, SKILL_LANKY, SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER4, "Battler IV", GOOD.."+9% melee damage\n"..BAD.."-13% weapon reload speed",
																-2,			0,					{SKILL_BATTLER5, SKILL_MASTERCHEF, SKILL_D_CLUMSY}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER5, "Battler V", GOOD.."+10% melee damage\n"..BAD.."-16% weapon reload speed",
																0,			2,					{SKILL_GLASSWEAPONS, SKILL_BLOODLUST}, TREE_MELEETREE)
GM:AddSkill(SKILL_LASTSTAND, "Last Stand", GOOD.."Double melee damage when below 25% health\n"..BAD.."0.85x melee weapon damage at any other time",
																0,			6,					{SKILL_ABUSE}, TREE_MELEETREE)
GM:AddSkill(SKILL_ABUSE, "Last abuse", GOOD.."+10% Melee damage\n"..GOOD.."Have chance to double end wave points,luck can increase chance\n"..BAD.."25% Max health for heal",
																0,			7,					{SKILL_CURSECURE}, TREE_MELEETREE)
GM:AddSkill(SKILL_CURSECURE, "Curse Cure", GOOD.."-15 Curse when you get hit\n"..BAD.."-20% max curse\n"..BAD.."Instead of a curse, you get rot",
																0,			8,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_SOULNET, "Soul Eater", GOOD.."In Start Gave random soul\n"..GOOD.."Gave +6% Damage for scythe\n"..BAD.."-10% melee damage",
																0,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
GM:AddSkill(SKILL_GLASSWEAPONS, "Glass Weapons", GOOD.."3.5x melee weapon damage vs. zombies\n"..BAD.."Your melee weapons have a 50% chance to break when hitting a zombie",
																2,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_GLASSMAN, "Glass Touch", GOOD.."You Deal x2.3 Melee Damage\n"..BAD.."You Take x3 Damage",
																3,			5,					{SKILL_GLASSWEAPONS}, TREE_MELEETREE)
GM:AddSkill(SKILL_D_CLUMSY, "Debuff: Clumsy", GOOD.."+20 starting Worth\n"..GOOD.."+10 starting points\n"..BAD.."Very easy to be knocked down",
																-2,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_CHEAPKNUCKLE, "Cheap Tactics", GOOD.."Slow targets when striking with a melee weapon from behind\n"..BAD.."-10% melee range",
																4,			-2,					{SKILL_HEAVYSTRIKES, SKILL_WORTHINESS2}, TREE_MELEETREE)
GM:AddSkill(SKILL_CRITICALKNUCKLE, "Critical Knuckle", GOOD.."Knockback when using unarmed strikes\n"..BAD.."-25% unarmed strike damage\n"..BAD.."+25% time before next unarmed strike",
																6,			-2,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_KNUCKLEMASTER, "Knuckle Master", GOOD.."+75% unarmed strike damage\n"..GOOD.."Movement speed is no longer slower when using unarmed strikes\n"..BAD.."+35% time before next unarmed strike",
																6,			-6,					{SKILL_NONE, SKILL_COMBOKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_COMBOKNUCKLE, "Combo Knuckle", GOOD.."Next unarmed strike is 2x faster if hitting something\n"..BAD.."Next unarmed attack is 2x slower if not hitting something",
																6,			-4,					{SKILL_CHEAPKNUCKLE, SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_HEAVYSTRIKES, "Heavy Strikes", GOOD.."+100% melee knockback\n"..BAD.."8% of melee damage dealt is reflected back to you\n"..BAD.."100% reflected if using unarmed strikes",
																2,			0,					{SKILL_BATTLER5, SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkill(SKILL_JOUSTER, "Jouster", GOOD.."+30% melee damage\n"..BAD.."-90% melee knockback\n"..BAD.."-50% Bullet Damage",
																2,			2,					{SKILL_BLOODLOST,SKILL_SOY}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_DAMAGE, -0.50)
GM:AddSkill(SKILL_SOY, "Soy hits", GOOD.."-50% melee swing impact delay\n"..BAD.."-50% Melee damage\n",
																3,			3,					{SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_MELEE_DAMAGE_MUL, -0.50)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.50)
																
GM:AddSkill(SKILL_BLOODLOST, "Bloodlust", GOOD.."+25% Damage Multiplier for  6 secs if take damage\n"..BAD.."-30 health",
																3,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKY, "Lanky I", GOOD.."+10% melee range\n"..BAD.."-15% melee damage",
																-4,			0,					{SKILL_LANKYII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYII, "Lanky II", GOOD.."+10% melee range\n"..BAD.."-15% melee damage",
																-4,			2,					{SKILL_LANKYIII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYIII, "Lanky III", GOOD.."+10% melee range\n"..BAD.."-15% melee damage",
																-4,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_MASTERCHEF, "Master Chef", GOOD.."Zombies hit by culinary weapons in the past second have a chance to drop food items on death\n"..BAD.."-10% melee damage",
																0,			-3,					{SKILL_BATTLER4}, TREE_MELEETREE)
GM:AddSkill(SKILL_LIGHTWEIGHT, "Lightweight", GOOD.."+6 movement speed with a melee weapon equipped\n"..BAD.."-20% melee damage",
																-6,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_BLOODLUST, "Phantom Rage", "Gain phantom health equal to half the damage taken from zombies\nLose phantom health equal to any healing received\nPhantom health decreases by 5 per second\n"..GOOD.."Heal 25% of damage done with melee from remaining phantom health\n"..BAD.."-50% healing received",
																-2,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRASH, "Brash", GOOD.."-16% melee swing impact delay\n"..BAD.."-15 speed on melee kill for 10 seconds",
																6,			0,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_FOUR_IN_ONE, "2 in 1", GOOD.."-9% melee swing impact delay\n"..BAD.."-7 health",
																-2,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_THREE_IN_ONE, "3 in 1", GOOD.."-16% melee swing impact delay\n"..BAD.."-10 health",
            													-3,			-3,					{SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
SKILL_LONGARM = 222					
GM:AddSkill(SKILL_LONGARM, "Longarm", GOOD.."-7% melee swing impact delay\n"..GOOD.."+2% Melee range\n"..BAD.."-7% Reload speed",
																-3,			-4,					{SKILL_THREE_IN_ONE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_RANGE_MUL, 0.02)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.07)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_RELOADSPEED_MUL, -0.07)
SKILL_FISTING = 223				
GM:AddSkill(SKILL_FISTING, "Fisting", GOOD.."+25% Unarmed melee damage mul\n"..GOOD.."-15% Unarmed swing delay\n"..BAD.."-25% Melee damage\n"..BAD.."+15% Melee swing impact delay",
																8,			-2,					{SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_DAMAGE_MUL, 0.50)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_SWING_DELAY_MUL, -0.30)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_SWING_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_DAMAGE_MUL, -0.25)
SKILL_MELEEFAN = 224				
GM:AddSkill(SKILL_MELEEFAN, "True Melee", BAD.."-350% Unarmed melee damage\n"..GOOD.."+45% Melee damage\n"..GOOD.."-15% Melee swing impact delay\n"..BAD.."-50% Bullet Damage",
																9,			-3,					{SKILL_FISTING}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_UNARMED_DAMAGE_MUL, -3.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.15)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_DAMAGE_MUL, 0.45)
SKILL_OPM = 225				
GM:AddSkill(SKILL_OPM, "One Punch Man", GOOD.."+350% Unarmed melee damage\n"..BAD.."-35% Melee damage\n"..BAD.."+150% time before next unarmed strike ",
																9,			-5,					{SKILL_MELEEFAN}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_DAMAGE_MUL, 3.50)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_SWING_DELAY_MUL, 3)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_MELEE_DAMAGE_MUL, -0.35)




SKILL_POINTI = 157
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_POINT_MULTIPLIER, 0.02)
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTI, "Point I", GOOD.."+0.15 Luck,+2% Point MUL\n The quality system increases the chances of getting a better soul",
																0,			0,					{SKILL_NONE}, TREE_POINTTREE)
SKILL_POINTII = 158
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_POINT_MULTIPLIER, 0.03)
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTII, "Point II", GOOD.."+0.15 Luck,+3% Point MUL",
																-0.5,			-1,					{SKILL_POINTI}, TREE_POINTTREE)
SKILL_POINTIII = 159
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_POINT_MULTIPLIER, 0.05)
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTIII, "Point III", NEUTRAL.."+0.15 Luck\n"..GOOD.."+5% Point MUL",
																-1,			-2,					{SKILL_POINTII}, TREE_POINTTREE)
SKILL_POINTIIII = 160
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_POINT_MULTIPLIER, 0.07)
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_LUCK, 0.40)
GM:AddSkill(SKILL_POINTIIII, "Pointer", NEUTRAL.."+0.40 Luck\n"..GOOD.."+7% Point MUL\n" ..GOOD.. "+5 Start Points",
																-2,			-3,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTD = 248
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_POINT_MULTIPLIER, -0.25)
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_LUCK, -0.5)
GM:AddSkill(SKILL_POINTD, "Double trouble", BAD.."-0.5 luck\n"..GOOD.."Can double points\n" ..BAD.. "-25% Points multiplier",
																-3.5,			-3,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_POINTFUL = 219
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_POINT_MULTIPLIER, 0.1)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_XP, -0.25)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_WORTH, -25)
GM:AddSkill(SKILL_POINTFUL, "Pointful", BAD.."-25% Xp multiplier\n"..BAD.."-25 Worth\n"..GOOD.."+10% Point MUL\n" ..GOOD.. "+10 Start Points",
																-2,			0,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTMEGA = 242
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_XP, -0.05)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_WORTH, 25)
GM:AddSkill(SKILL_POINTMEGA, "Megapoint", BAD.."-5% Xp multiplier\n"..GOOD.."+25 Worth\n"..BAD.."-10% Point MUL\n" ..GOOD.. "+50 Start Points",
																-2,			1,					{SKILL_POINTFUL}, TREE_POINTTREE)
	SKILL_LUCK = 161
	GM:AddSkillModifier(SKILL_LUCK, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK, "Luck", GOOD.."+0.5 luck",
																-2,			-5,					{SKILL_POINTIIII}, TREE_POINTTREE)
SKILL_LUCK1 = 243
GM:AddSkillModifier(SKILL_LUCK1, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK1, "Luck I", GOOD.."+0.5 luck",
									                    		-2,			-6,					{SKILL_LUCK}, TREE_POINTTREE)
SKILL_LUCK2 = 244
GM:AddSkillModifier(SKILL_LUCK2, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK2, "Luck II", GOOD.."+0.5 luck",
									                    		-3,			-7,					{SKILL_LUCK1}, TREE_POINTTREE)
SKILL_LUCK3 = 245
GM:AddSkillModifier(SKILL_LUCK3, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK3, "Luck III", GOOD.."+0.5 luck",
									                    		-3,			-8,					{SKILL_LUCK2}, TREE_POINTTREE)
SKILL_LUCK4 = 246
GM:AddSkillModifier(SKILL_LUCK4, SKILLMOD_LUCK, 1)
GM:AddSkill(SKILL_LUCK4, "Luck IV", GOOD.."+1 luck",
																-4,			-8,					{SKILL_LUCK3}, TREE_POINTTREE)		
GM:AddSkill(SKILL_XPHUNTER, "XP hunter", GOOD.."Give 5xp if wave ended\n Based on current wave",
																-4,			-10,					{SKILL_LUCK4}, TREE_POINTTREE)		
SKILL_ULUCK = 247
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_LUCK, 5)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_RESUPPLY_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_POINT_MULTIPLIER, -0.15)
GM:AddSkill(SKILL_ULUCK, "Ultra lucky", GOOD.."+5 luck\n"..BAD.."-15% Point multiplier\n"..BAD.."+15% Ressuply delay",
																-4,			-6,					{SKILL_LUCK4}, TREE_POINTTREE)														
SKILL_LUCKE = 162
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_LUCK, 2)	
GM:AddSkill(SKILL_LUCKY_UNLIVER, "The luck stacker", GOOD.."+2 luck per wave\n" ..BAD.. "-10% max health per wave",
	1,			-3,					{SKILL_LUCKE}, TREE_POINTTREE)
GM:AddSkill(SKILL_LUCKE, "Luckiest", NEUTRAL.."+2 luck\n" ..BAD.. "-10% Points MUL",
	1,			-2,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_BLUCK = 163
	GM:AddSkillModifier(SKILL_BLUCK, SKILLMOD_POINT_MULTIPLIER, 0.01)
GM:AddSkill(SKILL_BLUCK, "Quad", GOOD.."Better quality system\n" ..BAD.. "-3% Points Multiplier",
	2,			-2.75,					{SKILL_LUCKE}, TREE_POINTTREE)
	SKILL_PILLUCK = 164
	GM:AddSkillModifier(SKILL_PILLUCK, SKILLMOD_LUCK, -35)
GM:AddSkill(SKILL_PILLUCK, "Lucky Pill", GOOD.."On kill give 0.05 luck\n"..BAD.."-35 luck",
	-1,			-4,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_DUDEE = 166
	GM:AddSkillModifier(SKILL_DUDEE, SKILLMOD_LUCK, 2)
GM:AddSkill(SKILL_DUDEE, "Lucky man", GOOD.."+2 Luck\n",
	2,			-5,					{SKILL_LUCKE,SKILL_WORTHINESS4}, TREE_POINTTREE)

	SKILL_BADTRIP = 167
	GM:AddSkillModifier(SKILL_BADTRIP, SKILLMOD_POINT_MULTIPLIER, 0.10)
	GM:AddSkill(SKILL_BADTRIP, "Bad Trip", GOOD.."+10% Points multiplier\n" ..BAD.. "System of Quality does not work",
		2,			-6,					{SKILL_DUDEE}, TREE_POINTTREE)
		SKILL_SCAM = 168
		GM:AddSkillModifier(SKILL_SCAM, SKILLMOD_POINT_MULTIPLIER, 0.10)
		GM:AddSkill(SKILL_SCAM, "Scam", GOOD.."+10% Points Multiplier \n" ..BAD.. "Quality is worse",
			3,			-8,					{SKILL_BADTRIP}, TREE_POINTTREE)
			SKILL_SOLARUZ = 169
			GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_POINT_MULTIPLIER, 0.30)
			GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.40)
			GM:AddSkill(SKILL_SOLARUZ, "Debuff:Deadly Fortuna", PURPLE.."+30% Points Multiplicator \n" ..BAD.. "+40% damage taken melee",
				3,			-9,					{SKILL_SCAM}, TREE_POINTTREE)
SKILL_ANCK = 170
GM:AddSkill(SKILL_ANCK, "Ancient knowledge", PURPLE.."Learn The Ancient knowledge \n" ..BAD.. "The cost of knowledge",
					0,			0,					{SKILL_SOLARUZ}, TREE_ANCIENTTREE)
SKILL_ANCK1 = 171
GM:AddSkill(SKILL_ANCK1, "Ancient Volume 1", PURPLE.."Learn The Ancient knowledge\n You know only 50%",
					0,			-1,					{SKILL_ANCK}, TREE_ANCIENTTREE)
SKILL_ANCK2 = 172
GM:AddSkill(SKILL_ANCK2, "Ancient Volume 2", PURPLE.."You Know 100%!",
					0,			-2,					{SKILL_ANCK1}, TREE_ANCIENTTREE)

SKILL_STRICTE = 173
GM:AddSkillModifier(SKILL_STRICTE, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkill(SKILL_STRICTE, "Stricte praecepta", PURPLE.."+ 5% Melee damage!",
					1,			-4,					{SKILL_ANCK2}, TREE_ANCIENTTREE)
SKILL_VERUS = 174
GM:AddSkillModifier(SKILL_VERUS, SKILLMOD_MANHACK_DAMAGE_MUL, 0.33)
GM:AddSkillModifier(SKILL_VERUS, SKILLMOD_MANHACK_HEALTH_MUL, 0.33)
GM:AddSkill(SKILL_VERUS, "Verus", PURPLE.."Better  +33% manhack!",
					-1,			-4,					{SKILL_ANCK2}, TREE_ANCIENTTREE)
SKILL_PIGNUS = 175
GM:AddSkillModifier(SKILL_PIGNUS, SKILLMOD_TURRET_SCANSPEED_MUL, 0.33)
GM:AddSkillModifier(SKILL_PIGNUS, SKILLMOD_TURRET_HEALTH_MUL, 0.33)
GM:AddSkillModifier(SKILL_PIGNUS, SKILLMOD_TURRET_RANGE_MUL, 0.33)
GM:AddSkill(SKILL_PIGNUS, "Pignus", PURPLE.."Better turrets!All stats up by 33%",
					-1,			-5,					{SKILL_VERUS}, TREE_ANCIENTTREE)
SKILL_STRENGHT = 176
GM:AddSkillModifier(SKILL_STRENGHT, SKILLMOD_MELEE_DAMAGE_MUL, 0.1)
GM:AddSkill(SKILL_STRENGHT, "Strongman", PURPLE.."+10% Melee damage!",
					1,			-5,					{SKILL_STRICTE}, TREE_ANCIENTTREE)
SKILL_EX = 177
GM:AddSkill(SKILL_EX, "Exsecrandus", PURPLE.."USELESS!",
					0,			-6,					{SKILL_PIGNUS,SKILL_STRENGHT}, TREE_ANCIENTTREE)
SKILL_EX2 = 178					
GM:AddSkill(SKILL_EX2, "Scientia", PURPLE.."Science!",
					0,			-7,					{SKILL_EX}, TREE_ANCIENTTREE)
					SKILL_ANIMA = 179		
GM:AddSkillModifier(SKILL_ANIMA, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
GM:AddSkillModifier(SKILL_ANIMA, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.10)			
GM:AddSkill(SKILL_ANIMA, "Fines de anima", PURPLE.."+15% melee damage\n" ..BAD.."+10% Melee damage taken!",
					-3,			-7,					{SKILL_EX2}, TREE_ANCIENTTREE)
	SKILL_MERCUS = 184
					GM:AddSkillModifier(SKILL_MERCUS, SKILLMOD_RESUPPLY_DELAY_MUL, -0.10)			
					GM:AddSkill(SKILL_MERCUS, "Mortiferum Pompam", PURPLE.."-10% Ressuply Delay",
										-4,			-7,					{SKILL_ANIMA}, TREE_ANCIENTTREE)
SKILL_SIGILIBERATOR = 180	
GM:AddSkillModifier(SKILL_SIGILIBERATOR, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 2)		
GM:AddSkill(SKILL_SIGILIBERATOR, "Liberator", PURPLE.."x3 damage\n" ..BAD.."x3 damage taken",
										-3,			-9,					{SKILL_EX2}, TREE_ANCIENTTREE)
										SKILL_DEATH = 181	
GM:AddSkillModifier(SKILL_DEATH, SKILLMOD_MEDKIT_COOLDOWN_MUL, 0.2)
GM:AddSkillModifier(SKILL_DEATH, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.2)		
GM:AddSkill(SKILL_DEATH, "Morieris", PURPLE.."Better medicine\n" ..BAD.."+20% Medkit Cooldown\n"..PURPLE.."+20% Medkit effectiveness",
										-3,			-8,					{SKILL_EX2}, TREE_ANCIENTTREE)
										SKILL_ALLPOWER = 182
GM:AddSkillModifier(SKILL_ALLPOWER, SKILLMOD_REPAIRRATE_MUL, 0.10)		
GM:AddSkill(SKILL_ALLPOWER, "Cunctipotens", PURPLE.."Better cades\n" ..PURPLE.."+10% Repair Mul",
					-4,			-8,					{SKILL_DEATH}, TREE_ANCIENTTREE)
SKILL_ANCIENT = 183
GM:AddSkillModifier(SKILL_ANCIENT, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.10)
GM:AddSkillModifier(SKILL_ANCIENT, SKILLMOD_MELEE_DAMAGE_MUL, 0.2)		
GM:AddSkill(SKILL_ANCIENT, "Adventum Antiqua", PURPLE.."+20% Damage melee\n" ..BAD.."+10% Damage taken mul",
					-4,			-9,					{SKILL_SIGILIBERATOR}, TREE_ANCIENTTREE)
					SKILL_CLASSIX1 = 185	
GM:AddSkill(SKILL_CLASSIX1, "Classical scientia mundi", PURPLE.."Random bloodarmor",
					-5,			-8,					{SKILL_ALLPOWER}, TREE_ANCIENTTREE)
SKILL_MAGIC = 255
GM:AddSkill(SKILL_MAGIC, "Magic", PURPLE.."Open a usage of magic\n",
					-6,			-8,					{SKILL_CLASSIX1}, TREE_ANCIENTTREE)
				
SKILL_BLOODMARY = 186
GM:AddSkill(SKILL_BLOODMARY, "Sanguinum Messis", PURPLE.."Regenerate blood armor",
										-5,			-9,					{SKILL_ANCIENT}, TREE_ANCIENTTREE)
										SKILL_TRUEPOWER = 187
GM:AddSkill(SKILL_TRUEPOWER, "Future Knowledge Vol.3", PURPLE.."Cost Of Knowledge",
																				-5,			-10,					{SKILL_BLOODMARY}, TREE_ANCIENTTREE)
																														SKILL_HEARTS = 202
GM:AddSkill(SKILL_HEARTS, "Ancient Hearts", PURPLE.."Unlock Heart Trinkets",
																				-5,			-11,					{SKILL_TRUEPOWER,SKILL_NANOMACHINES}, TREE_ANCIENTTREE)
SKILL_NANOMACHINES = 239
GM:AddSkill(SKILL_NANOMACHINES, "Nanotech", PURPLE.."+10% Bullet damage\n"..PURPLE.."+50% DMG reflect",
																				-6,			-12,					{SKILL_HEARTS}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_DAMAGE, 0.10)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 0.5)
SKILL_DEFEND = 190
GM:AddSkill(SKILL_DEFEND, "Defender of the Sigil I", GOOD.."You get 2% less damage\n"..BAD.."Speed -1",
				                                                            	-0.25,			-0.5,					{SKILL_NONE}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_SPEED, -1)

--Tormented SKill
SKILL_TORMENT1 = 229
GM:AddSkill(SKILL_TORMENT1, "Torment I", GOOD.."+15% Xp Multiplier\n"..BAD.."-30 Speed\n"..BAD.."-15% Bullet Damage\n",
				                                                            	1,			26,					{SKILL_NONE}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_DAMAGE, -0.15)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_XP, 0.15)
SKILL_TORMENT2 = 230
GM:AddSkill(SKILL_TORMENT2, "Torment II", GOOD.."+15% Xp Multiplier\n"..BAD.."-15% Melee damage\n"..BAD.."-15 Health\n",
				                                                            	1,			27,					{SKILL_TORMENT1,SKILL_SLAVEC}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_XP, 0.15)
SKILL_SLAVEC = 251
GM:AddSkill(SKILL_SLAVEC, "Chains of time", GOOD.."Have chance to 10% to give defend buff\n"..GOOD.."+20 speed\n"..BAD.."-15 Health\n",
				                                                            	2,			27,					{SKILL_TORMENT2}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_SPEED, 20)
SKILL_TORMENT3 = 231
GM:AddSkill(SKILL_TORMENT3, "Torment III", GOOD.."+50% Xp Multiplier\n"..BAD.."+50% Ressuply delay\n"..BAD.."-5% Points multiplier\n",
				                                                            	1,			28,					{SKILL_TORMENT2}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_POINT_MULTIPLIER, -0.05)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_RESUPPLY_DELAY_MUL, 0.5)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_XP, 0.50)
SKILL_TORMENT4 = 232
GM:AddSkill(SKILL_TORMENT4, "Torment IV", GOOD.."+100% Xp Multiplier\n"..BAD.."-50% Damage of all weapon\n",
				                                                            	1,			29,					{SKILL_TORMENT3}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_MELEE_DAMAGE_MUL, -0.5)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_XP, 1)
SKILL_TORMENT5 = 233
GM:AddSkill(SKILL_TORMENT5, "Torment V", GOOD.."+15% Xp Multiplier\n"..BAD.."+15% Melee damage taken mul\n",
				                                                            	2,			29,					{SKILL_TORMENT4}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.15)
GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_XP, 0.15)
SKILL_TORMENT6 = 253
GM:AddSkill(SKILL_TORMENT6, "Torment VI", GOOD.."+30% Xp Multiplier\n"..BAD.."-50% Repair rate and -50% Medtool effectiveness",
				                                                            	3,			30,					{SKILL_TORMENT5}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_REPAIRRATE_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_XP, 0.30)
SKILL_DEATHCURSE = 234
GM:AddSkill(SKILL_DEATHCURSE, "Curse cleaning", GOOD.."+15% Xp Multiplier\n"..GOOD.."Eating food blesses you, forgiving your curse\nIf you cursed and eat food give 35 seconds of defence\n"..BAD.."-30% Max curse\n"..BAD.."+30% time to eat food",
				                                                            	2,			30,					{SKILL_TORMENT5}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_XP, 0.15)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_CURSEM, -0.30)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_FOODEATTIME_MUL, 0.30)
--Defend skills

SKILL_DEFEND1 = 191
GM:AddSkill(SKILL_DEFEND1, "Defender of the Sigil II", GOOD.."You get 2% less damage\n"..BAD.."Speed -2",
				                                                            	0.75,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_SPEED, -2)
SKILL_DEFEND2 = 192
GM:AddSkill(SKILL_DEFEND2, "Defender of the Sigil III", GOOD.."You get 3% less damage\n"..BAD.."Speed -4",
				                                                            	1.5,			1,					{SKILL_DEFEND1}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.03)
GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_SPEED, -4)
SKILL_DEFEND3 = 193
GM:AddSkill(SKILL_DEFEND3, "Defender of the Sigil IV", GOOD.."You get 4% less damage\n"..BAD.."Speed -6",
				                                                            	1.5,			2,					{SKILL_DEFEND2}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_SPEED, -6)
SKILL_DEFEND4 = 194
GM:AddSkill(SKILL_DEFEND4, "Defender of the Sigil V", GOOD.."You get 6% less damage\n"..BAD.."Speed -12",
				                                                            	0.75,			3,					{SKILL_DEFEND3}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_SPEED, -12)
SKILL_DEFEND5 = 195
GM:AddSkill(SKILL_DEFEND5, "Defender of the Sigil VI", GOOD.."You get 9% less damage\n"..BAD.."Speed -16",
				                                                            	0,			3.5,					{SKILL_DEFEND4}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.09)
GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_SPEED, -16)
SKILL_DEFENDER = 196
GM:AddSkill(SKILL_DEFENDER, "Defender of Humans", GOOD.."You get 4% less damage\n"..BAD.."Melee damage multiplier 0.96x",
				                                                            	-1.5,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_MUL, -0.04)
SKILL_DEFENDEROFM = 197
GM:AddSkill(SKILL_DEFENDEROFM, "Defender of Monsters", BAD.."You get 5% more damage\n"..GOOD.."Melee damage multiplier 1.05x",
				                                                            	-2,			1,					{SKILL_DEFENDER}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
SKILL_HEAVY = 254
GM:AddSkill(SKILL_HEAVY, "Heavy", GOOD.."-10% Melee damage taken\n"..BAD.."-30 speed\n"..BAD.."-50% Jump power mul",
				                                                            	-3,		    0.5,					{SKILL_DEFENDEROFM}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.1)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_JUMPPOWER_MUL, -0.5)
SKILL_TTIMES = 249
GM:AddSkill(SKILL_TTIMES, "Tougher Times", GOOD.."Have 20% Chance to block damage\n"..BAD.."+15% Melee damage taken",
				                                                            	-3,			1.5,					{SKILL_TRIP,SKILL_TTIMES1}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.15)
SKILL_TTIMES1 = 250
GM:AddSkill(SKILL_TTIMES1, "Tough Times", GOOD.."-7% Melee damage taken\n",
				                                                            	-4,			2,					{SKILL_TTIMES}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.07)
SKILL_TRIP = 198
GM:AddSkill(SKILL_TRIP, "Wall curse", GOOD.."-23% Damage taken\n"..GOOD.."+50% Max curse\n"..BAD.."Melee damage multiplier 0.88x\n"..BAD.."-70 Speed\nCurse can't end",
				                                                            	-2,			2,					{SKILL_DEFENDEROFM,SKILL_TTIMES}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.23)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_MUL, -0.12)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_SPEED, -70)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_CURSEM, 0.5)
GM:AddSkill(SKILL_HOLY_MANTLE, ""..translate.Get("skill_holymantle"), GOOD..""..translate.Get("skill_holymantle_d1"),
				                                                            	-4,			3,					{SKILL_TTIMES}, TREE_DEFENSETREE)
SKILL_MERIS = 199
GM:AddSkill(SKILL_MERIS, "Meris", GOOD.."-10% Damage taken\n"..BAD.."-20% Melee damage!",
				                                                            	-1,			3.5,					{SKILL_TRIP}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_UPLOAD, "Later", GOOD.."You will take damage later\n-50% Later damage\n"..BAD.."If HOLLOW more than 800 you take 500 damage",
				                                                            	-1,			5,					{SKILL_MERIS}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)
GM:AddSkill(SKILL_DONATE1, "Donate I", GOOD.."-3% Damage taken\n"..GOOD.."+2% Melee damage! Thank Null",
				                                                            	21,			20,					{SKILL_NONE}, TREE_DONATETREE)

GM:AddSkillModifier(SKILL_DONATE1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.03)
GM:AddSkillModifier(SKILL_DONATE1, SKILLMOD_MELEE_DAMAGE_MUL, 0.02)


SKILL_DONATE2 = 204
GM:AddSkill(SKILL_DONATE2, "Donate II", GOOD.."+5 Blood armor\n"..GOOD.."-5% Poison Speed!Thank Null",
				                                                            	20,			21,					{SKILL_DONATE1}, TREE_DONATETREE)

GM:AddSkillModifier(SKILL_DONATE2, SKILLMOD_BLOODARMOR, 5)
GM:AddSkillModifier(SKILL_DONATE2, SKILLMOD_POISON_SPEED_MUL, -0.05)
SKILL_HELPFORPROJECT = 205
GM:AddSkill(SKILL_HELPFORPROJECT, "Donate", GOOD.."Donate if you want to get new skills\n"..BAD.."+1 skill for every donate",
				                                                            	20,			20,					{}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_HELPFORPROJECT, SKILLMOD_BLOODARMOR, 1)
SKILL_DONATE3 = 206
GM:AddSkill(SKILL_DONATE3, "Donate III", GOOD.."+50% For XP\n"..BAD.."THX Chayok",
				                                                            	20,			22,					{SKILL_DONATE2}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE3, SKILLMOD_XP, 0.50)
SKILL_DONATE4 = 207
GM:AddSkill(SKILL_DONATE4, "Donate IV", GOOD.."+10% Reload Speed\n"..BAD.."THX cheetus and null",
				                                                            	21,			23,					{SKILL_DONATE3}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE4, SKILLMOD_RELOADSPEED_MUL, 0.10)
SKILL_DONATE5 = 208
GM:AddSkill(SKILL_DONATE5, "Donate V", GOOD.."Sale by 6%\n"..BAD.."Thx ivan36099",
				                                                            	22,			23,					{SKILL_DONATE4}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE5, SKILLMOD_ARSENAL_DISCOUNT, -0.03)
SKILL_DONATE6 = 209
GM:AddSkill(SKILL_DONATE6, "Donate VI", GOOD.."+15% To blood armor convert\n"..BAD.."THX Null",
				                                                            	22,			24,					{SKILL_DONATE5}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE6, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.15)
SKILL_DONATE7 = 211
GM:AddSkill(SKILL_DONATE7, "Donate VII", GOOD.."+20% Hammer repair mul\n"..BAD.."THX chayok01 and null",
				                                                            	21,			24,					{SKILL_DONATE6}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE7, SKILLMOD_REPAIRRATE_MUL, 0.20)
SKILL_DONATE8 = 212
GM:AddSkill(SKILL_DONATE8, "Donate VIII", GOOD.."+21% Reload speed\n"..GOOD.."thx shepard",
				                                                            	21,			25,					{SKILL_DONATE7}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE8, SKILLMOD_RELOADSPEED_MUL, 0.21)
SKILL_DONATE9 = 213
GM:AddSkill(SKILL_DONATE9, "Donate IX", GOOD.."+15 Health\n"..GOOD.."thx shepard",
				                                                            	20,			25,					{SKILL_DONATE8}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE9, SKILLMOD_HEALTH, 15)
SKILL_DONATE10 = 214
GM:AddSkill(SKILL_DONATE10, "Donate X", GOOD.."+20 Worth\n"..GOOD.."thx shepard",
				                                                            	21,			26,					{SKILL_DONATE9}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE10, SKILLMOD_WORTH, 20)
SKILL_DONATE11 = 268
GM:AddSkill(SKILL_DONATE11, "Donate XI", GOOD.."+30% Max curse\n"..GOOD.."THX for Bro3!",
				                                                            	23,			27,					{SKILL_DONATE10}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE11, SKILLMOD_CURSEM, 0.3)
SKILL_DONATE12 = 269
GM:AddSkill(SKILL_DONATE12, "Donate XII", GOOD.."+% Bullet damage\n"..GOOD.."Donate for unlocking!",
				                                                            	22,			28,					{SKILL_DONATE12}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE12, SKILLMOD_DAMAGE, 0.2)

SKILL_CHALLENGER1 = 215
GM:AddSkill(SKILL_CHALLENGER1, "Challenger I", GOOD.."+20 Health,+1 luck,+5% Sale, help for challenges!\n"..GOOD.."Can use in any challenge",
				                                                            	25,			26,					{SKILL_NONE, SKILL_CHALLENGER2}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_CHALLENGER1, SKILLMOD_LUCK, 1)																				
GM:AddSkillModifier(SKILL_CHALLENGER1, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(SKILL_CHALLENGER1, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
SKILL_CHALLENGER2 = 216
GM:AddSkill(SKILL_CHALLENGER2, "Challenger II", GOOD.."+20% Reload speed\n"..GOOD.."Can use in any challenge",
				                                                            	25,			24,					{SKILL_CHALLENGER1}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_CHALLENGER2, SKILLMOD_RELOADSPEED_MUL, 0.2)
SKILL_CHALLENGER3 = 217
GM:AddSkill(SKILL_CHALLENGER3, "Challenger III", GOOD.."+100% XP Multiplier\n"..GOOD.."Can use in any challenge",
				                                                            	25,			20,					{}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_CHALLENGER3, SKILLMOD_XP, 1)
--Skill for high-remort
SKILL_USELESS_1 = 500
GM:AddSkill(SKILL_USELESS_1, "Useless 1", GOOD.."+5% XP MUL",
				                                                            	0,			0,					{SKILL_NONE}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_1, SKILLMOD_XP, 0.05)
SKILL_USELESS_2 = 501
GM:AddSkill(SKILL_USELESS_2, "Useless 2", GOOD.."+5 Health",
				                                                            	0,			1,					{SKILL_USELESS_1}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_2, SKILLMOD_HEALTH, 5)
SKILL_USELESS_3 = 502
GM:AddSkill(SKILL_USELESS_3, "Useless 3", GOOD.."+2% Arsenal discount",
				                                                            	1,			2,					{SKILL_USELESS_2}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_3, SKILLMOD_ARSENAL_DISCOUNT, -0.02)
SKILL_USELESS_4 = 503
GM:AddSkill(SKILL_USELESS_4, "Useless 4", GOOD.."+5 speed",
				                                                            	2,			2,					{SKILL_USELESS_3}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_4, SKILLMOD_SPEED, 5)
SKILL_USELESS_5 = 504
GM:AddSkill(SKILL_USELESS_5, "Useless 5", GOOD.."+6% Max curse",
				                                                            	1,			3,					{SKILL_USELESS_4}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_5, SKILLMOD_CURSEM, 0.06)
SKILL_USELESS_6 = 505
GM:AddSkill(SKILL_USELESS_6, "Useless 6", GOOD.."+5 Health",
				                                                            	1,			4,					{SKILL_USELESS_5}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_6, SKILLMOD_HEALTH, 5)
SKILL_USELESS_7 = 506
GM:AddSkill(SKILL_USELESS_7, "Useless 7", GOOD.."+5 worth",
				                                                            	2,			4,					{SKILL_USELESS_6}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_7, SKILLMOD_WORTH, 5)
SKILL_USELESS_8 = 507
GM:AddSkill(SKILL_USELESS_8, "Useless 8", GOOD.."+8 starting scrap",
				                                                            	2,			5,					{SKILL_USELESS_7}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_8, SKILLMOD_SCRAP_START, 8)
SKILL_USELESS_9 = 508
GM:AddSkill(SKILL_USELESS_9, "Useless 9", GOOD.."+20% manhack health",
				                                                            	4,			3,					{SKILL_USELESS_8}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_9, SKILLMOD_MANHACK_HEALTH_MUL, 0.2)
SKILL_USELESS_10 = 509
GM:AddSkill(SKILL_USELESS_10, "Useless 10", GOOD.."+9 speed",
				                                                            	4,			2,					{SKILL_USELESS_9}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_10, SKILLMOD_SPEED, 9)
SKILL_USELESS_11 = 510
GM:AddSkill(SKILL_USELESS_11, "Useless 11", GOOD.."-10% knockdown time",
				                                                            	3,		    1,					{SKILL_USELESS_10}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_11, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.1)
SKILL_USELESS_12 = 511
GM:AddSkill(SKILL_USELESS_12, "Useless 12", GOOD.."+5% Bullet damage",
				                                                            	3,		    0,					{SKILL_USELESS_11}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_12, SKILLMOD_DAMAGE, 0.05)
SKILL_USELESS_13 = 512
GM:AddSkill(SKILL_USELESS_13, "Useless 13", GOOD.."+5% Melee damage",
				                                                            	2,		    -1,					{SKILL_USELESS_12}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_13, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
SKILL_USELESS_14 = 513
GM:AddSkill(SKILL_USELESS_14, "Useless 14", GOOD.."-5% Melee damage taken mul\n You have TOO MUCH USELESS SKILL POINTS???",
				                                                            	1,		    -1,					{SKILL_USELESS_13}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_14, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)
SKILL_USELESS_15 = 514
GM:AddSkill(SKILL_USELESS_15, "Useless 15", GOOD.."+10% Block damage multiplier",
				                                                            	1,		    -2,					{SKILL_USELESS_14}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_15, SKILLMOD_BLOCKMULTIPLIER, -0.10)







GM:AddSkillModifier(SKILL_BLOODLOST, SKILLMOD_HEALTH, -30)
GM:AddSkillModifier(SKILL_ABUSE, SKILLMOD_MELEE_DAMAGE_MUL, 0.1)
GM:AddSkillFunction(SKILL_ABUSE, function(pl, active)
	pl:SetDTBool(DT_PLAYER_BOOL_FRAIL, active)
end)





GM:SetSkillModifierFunction(SKILLMOD_SPEED, function(pl, amount)
	pl.SkillSpeedAdd = amount
end)
GM:SetSkillModifierFunction(SKILLMOD_LUCK, function(pl, amount)
	pl.Luck = amount
end)


GM:SetSkillModifierFunction(SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, function(pl, amount)
	pl.MedicHealMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDKIT_COOLDOWN_MUL, function(pl, amount)
	pl.MedicCooldownMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)


GM:SetSkillModifierFunction(SKILLMOD_WORTH, function(pl, amount)
	pl.ExtraStartingWorth = amount
end)

GM:SetSkillModifierFunction(SKILLMOD_FALLDAMAGE_THRESHOLD_MUL, function(pl, amount)
	pl.FallDamageThresholdMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, function(pl, amount)
	pl.FallDamageSlowDownMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FOODEATTIME_MUL, function(pl, amount)
	pl.FoodEatTimeMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_JUMPPOWER_MUL, function(pl, amount)
	pl.JumpPowerMul = math.Clamp(amount + 1.0, 0.0, 10.0)

	if SERVER then
		pl:ResetJumpPower()
	end
end)
GM:SetSkillModifierFunction(SKILLMOD_DAMAGE, function(pl, amount)
	pl.BulletMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DEPLOYSPEED_MUL, function(pl, amount)
	pl.DeploySpeedMultiplier = math.Clamp(amount + 1.0, 0.05, 100.0)

	for _, wep in pairs(pl:GetWeapons()) do
		GAMEMODE:DoChangeDeploySpeed(wep)
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR, function(pl, amount)
	local oldarmor = pl:GetBloodArmor()
	local oldcap = pl.MaxBloodArmor or 20
	local new = 20 + math.Clamp(amount, -20, 1000)

	pl.MaxBloodArmor = new

	if SERVER then
		if oldarmor > oldcap then
			local overcap = oldarmor - oldcap
			pl:SetBloodArmor(pl.MaxBloodArmor + overcap)
		else
			pl:SetBloodArmor(pl:GetBloodArmor() / oldcap * new)
		end
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplier = math.Clamp(amount + 1.0, 0.05, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_MUL, function(pl, amount)
	pl.MeleeDamageMultiplier = math.Clamp(amount + 1.0, 0.0, 100.0)
end)


GM:SetSkillModifierFunction(SKILLMOD_SELF_DAMAGE_MUL, function(pl, amount)
	pl.SelfDamageMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_KNOCKBACK_MUL, function(pl, amount)
	pl.MeleeKnockbackMultiplier = math.Clamp(amount + 1.0, 0.0, 10000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_UNARMED_DAMAGE_MUL, function(pl, amount)
	pl.UnarmedDamageMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_UNARMED_SWING_DELAY_MUL, function(pl, amount)
	pl.UnarmedDelayMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BARRICADE_PHASE_SPEED_MUL, function(pl, amount)
	pl.BarricadePhaseSpeedMul = math.Clamp(amount + 1.0, 0.05, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_HAMMER_SWING_DELAY_MUL, function(pl, amount)
	pl.HammerSwingDelayMul = math.Clamp(amount + 1.0, 0.01, 1.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_REPAIRRATE_MUL, function(pl, amount)
	pl.RepairRateMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_AIMSPREAD_MUL, function(pl, amount)
	pl.AimSpreadMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDGUN_FIRE_DELAY_MUL, function(pl, amount)
	pl.MedgunFireDelayMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MEDGUN_RELOAD_SPEED_MUL, function(pl, amount)
	pl.MedgunReloadSpeedMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DRONE_GUN_RANGE_MUL, function(pl, amount)
	pl.DroneGunRangeMul = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_HEALING_RECEIVED, function(pl, amount)
	pl.HealingReceived = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_PISTOL_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierPISTOL = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_SMG_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierSMG1 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_ASSAULT_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierAR2 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_SHELL_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierBUCKSHOT = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_RIFLE_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplier357 = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_XBOW_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierXBOWBOLT = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_PULSE_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierPULSE = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_EXP_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplierIMPACTMINE = math.Clamp(amount + 1.0, 0.0, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, function(pl, amount)
	pl.BarbedArmor = math.Clamp(amount, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PULSE_WEAPON_SLOW_MUL, function(pl, amount)
	pl.PulseWeaponSlowMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.MeleeDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_POISON_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.PoisonDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.BleedDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_SWING_DELAY_MUL, function(pl, amount)
	pl.MeleeSwingDelayMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, function(pl, amount)
	pl.MeleeDamageToBloodArmorMul = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, function(pl, amount)
	pl.MeleeMovementSpeedOnKill = math.Clamp(amount, -15, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_POWERATTACK_MUL, function(pl, amount)
	pl.MeleePowerAttackMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_KNOCKDOWN_RECOVERY_MUL, function(pl, amount)
	pl.KnockdownRecoveryMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_RANGE_MUL, function(pl, amount)
	pl.MeleeRangeMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_SLOW_EFF_TAKEN_MUL, function(pl, amount)
	pl.SlowEffTakenMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.ExplosiveDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_FIRE_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.FireDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_CURSEM, function(pl, amount)
	pl.CurseMultiplier = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROP_CARRY_CAPACITY_MUL, function(pl, amount)
	pl.PropCarryCapacityMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PROP_THROW_STRENGTH_MUL, function(pl, amount)
	pl.ObjectThrowStrengthMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL, function(pl, amount)
	pl.PhysicsDamageTakenMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_VISION_ALTER_DURATION_MUL, function(pl, amount)
	pl.VisionAlterDurationMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DIMVISION_EFF_MUL, function(pl, amount)
	pl.DimVisionEffMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_XP, function(pl, amount)
	GAMEMODE.HumanXPMulti = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_PROP_CARRY_SLOW_MUL, function(pl, amount)
	pl.PropCarrySlowMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLEED_SPEED_MUL, function(pl, amount)
	pl.BleedSpeedMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_LEG_DAMAGE_ADD, function(pl, amount)
	pl.MeleeLegDamageAdd = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_SIGIL_TELEPORT_MUL, function(pl, amount)
	pl.SigilTeleportTimeMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOCKMULTIPLIER, function(pl, amount)
	pl.BlockMultiplier = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, function(pl, amount)
	pl.BarbedArmorPercent = math.Clamp(amount, 0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_POISON_SPEED_MUL, function(pl, amount)
	pl.PoisonSpeedMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)


GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, GM:MkGenericMod("ProjDamageTakenMul"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_RADIUS, GM:MkGenericMod("ExpDamageRadiusMul"))
GM:SetSkillModifierFunction(SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, GM:MkGenericMod("WeaponWeightSlowMul"))
GM:SetSkillModifierFunction(SKILLMOD_FRIGHT_DURATION_MUL, GM:MkGenericMod("FrightDurationMul"))
GM:SetSkillModifierFunction(SKILLMOD_IRONSIGHT_EFF_MUL, GM:MkGenericMod("IronsightEffMul"))
GM:SetSkillModifierFunction(SKILLMOD_MEDDART_EFFECTIVENESS_MUL, GM:MkGenericMod("MedDartEffMul"))

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_DMG_REDUCTION, function(pl, amount)
	pl.BloodArmorDamageReductionAdd = amount
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_MUL, function(pl, amount)
	local mul = math.Clamp(amount + 1.0, 0.0, 1000.0)

	pl.MaxBloodArmorMul = mul

	local oldarmor = pl:GetBloodArmor()
	local oldcap = pl.MaxBloodArmor or 20
	local new = pl.MaxBloodArmor * mul

	pl.MaxBloodArmor = new

	if SERVER then
		if oldarmor > oldcap then
			local overcap = oldarmor - oldcap
			pl:SetBloodArmor(pl.MaxBloodArmor + overcap)
		else
			pl:SetBloodArmor(pl:GetBloodArmor() / oldcap * new)
		end
	end
end)

GM:SetSkillModifierFunction(SKILLMOD_BLOODARMOR_GAIN_MUL, GM:MkGenericMod("BloodarmorGainMul"))
GM:SetSkillModifierFunction(SKILLMOD_LOW_HEALTH_SLOW_MUL, GM:MkGenericMod("LowHealthSlowMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJ_SPEED, GM:MkGenericMod("ProjectileSpeedMul"))

GM:SetSkillModifierFunction(SKILLMOD_ENDWAVE_POINTS, function(pl,amount)
	pl.EndWavePointsExtra = math.Clamp(amount, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_ARSENAL_DISCOUNT, GM:MkGenericMod("ArsenalDiscount"))
GM:SetSkillModifierFunction(SKILLMOD_SCRAPDISCOUNT, GM:MkGenericMod("ScrapDiscount"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_RADIUS, GM:MkGenericMod("CloudRadius"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_TIME, GM:MkGenericMod("CloudTime"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_MUL, GM:MkGenericMod("ExplosiveDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_MUL, GM:MkGenericMod("ProjectileDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_TURRET_RANGE_MUL, GM:MkGenericMod("TurretRangeMul"))
GM:SetSkillModifierFunction(SKILLMOD_AIM_SHAKE_MUL, GM:MkGenericMod("AimShakeMul"))


GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_ASSAULT_MUL, 0.13)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_EXP_MUL, 0.09)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_PISTOL_MUL, 0.21)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_PULSE_MUL, 0.11)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_RIFLE_MUL, 0.20)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_SHELL_MUL, 0.44)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_SMG_MUL, 0.12)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_XBOW_MUL, 0.09)
GM:AddSkillModifier(SKILL_BANDOLIER, SKILLMOD_RELOADSPEED_MUL, 0.05)

GM:AddSkillModifier(SKILL_SPEED1, SKILLMOD_SPEED, 5)
GM:AddSkillModifier(SKILL_SPEED1, SKILLMOD_HEALTH, -4)

GM:AddSkillModifier(SKILL_SPEED2, SKILLMOD_SPEED, 5)
GM:AddSkillModifier(SKILL_SPEED2, SKILLMOD_HEALTH, -7)

GM:AddSkillModifier(SKILL_SPEED3, SKILLMOD_SPEED, 6)
GM:AddSkillModifier(SKILL_SPEED3, SKILLMOD_HEALTH, -6)

GM:AddSkillModifier(SKILL_SPEED4, SKILLMOD_SPEED, 11)
GM:AddSkillModifier(SKILL_SPEED4, SKILLMOD_HEALTH, -8)

GM:AddSkillModifier(SKILL_SPEED5, SKILLMOD_SPEED, 10)
GM:AddSkillModifier(SKILL_SPEED5, SKILLMOD_HEALTH, -11)

GM:AddSkillModifier(SKILL_STOIC1, SKILLMOD_HEALTH, 4)
GM:AddSkillModifier(SKILL_STOIC1, SKILLMOD_SPEED, -5)

GM:AddSkillModifier(SKILL_STOIC2, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_STOIC2, SKILLMOD_SPEED, -7)

GM:AddSkillModifier(SKILL_STOIC3, SKILLMOD_HEALTH, 6)
GM:AddSkillModifier(SKILL_STOIC3, SKILLMOD_SPEED, -9)

GM:AddSkillModifier(SKILL_STOIC4, SKILLMOD_HEALTH, 8)
GM:AddSkillModifier(SKILL_STOIC4, SKILLMOD_SPEED, -11)

GM:AddSkillModifier(SKILL_STOIC5, SKILLMOD_HEALTH, 11)
GM:AddSkillModifier(SKILL_STOIC5, SKILLMOD_SPEED, -10)

GM:AddSkillModifier(SKILL_VITALITY1, SKILLMOD_HEALTH, 1)
GM:AddSkillModifier(SKILL_VITALITY2, SKILLMOD_HEALTH, 3)
GM:AddSkillModifier(SKILL_VITALITY3, SKILLMOD_HEALTH, 7)
GM:AddSkillModifier(SKILL_CHEESE, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(SKILL_CHEESE, SKILLMOD_SPEED, 10)

GM:AddSkillModifier(SKILL_MOTIONI, SKILLMOD_SPEED, 5)
GM:AddSkillModifier(SKILL_MOTIONII, SKILLMOD_SPEED, 5)
GM:AddSkillModifier(SKILL_MOTIONIII, SKILLMOD_SPEED, 5)

GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_AIMSPREAD_MUL, -0.11)
GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_RELOADSPEED_MUL, -0.03)

GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_AIMSPREAD_MUL, -0.09)
GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_RELOADSPEED_MUL, -0.07)

GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_AIMSPREAD_MUL, -0.12)
GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_RELOADSPEED_MUL, -0.06)

GM:AddSkillModifier(SKILL_ORPHICFOCUS, SKILLMOD_RELOADSPEED_MUL, -0.06)
GM:AddSkillModifier(SKILL_ORPHICFOCUS, SKILLMOD_AIMSPREAD_MUL, -0.02)

GM:AddSkillModifier(SKILL_DELIBRATION, SKILLMOD_AIMSPREAD_MUL, -0.03)

GM:AddSkillModifier(SKILL_WOOISM, SKILLMOD_IRONSIGHT_EFF_MUL, -0.25)

GM:AddSkillModifier(SKILL_GLUTTON, SKILLMOD_HEALTH, 7)

GM:AddSkillModifier(SKILL_TANKER, SKILLMOD_HEALTH, 60)
GM:AddSkillModifier(SKILL_TANKER, SKILLMOD_SPEED, -40)

GM:AddSkillModifier(SKILL_ULTRANIMBLE, SKILLMOD_HEALTH, -10)
GM:AddSkillModifier(SKILL_ULTRANIMBLE, SKILLMOD_SPEED, 30)

GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_SELF_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_SELF_DAMAGE_MUL, -0.40)
GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_RELOADSPEED_MUL, -0.10)
GM:AddSkillModifier(SKILL_BLASTPROOF, SKILLMOD_DEPLOYSPEED_MUL, -0.12)

GM:AddSkillModifier(SKILL_SURGEON1, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.06)
GM:AddSkillModifier(SKILL_SURGEON2, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.09)
GM:AddSkillModifier(SKILL_SURGEON3, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.11)
GM:AddSkillModifier(SKILL_SURGEONIV, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.21)

GM:AddSkillModifier(SKILL_BIOLOGYI, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.08)
GM:AddSkillModifier(SKILL_BIOLOGYII, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.13)
GM:AddSkillModifier(SKILL_BIOLOGYIII, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.18)
GM:AddSkillModifier(SKILL_BIOLOGYIV, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.21)

GM:AddSkillModifier(SKILL_HANDY1, SKILLMOD_REPAIRRATE_MUL, 0.05)
GM:AddSkillModifier(SKILL_HANDY2, SKILLMOD_REPAIRRATE_MUL, 0.06)
GM:AddSkillModifier(SKILL_HANDY3, SKILLMOD_REPAIRRATE_MUL, 0.08)
GM:AddSkillModifier(SKILL_HANDY4, SKILLMOD_REPAIRRATE_MUL, 0.11)
GM:AddSkillModifier(SKILL_HANDY5, SKILLMOD_REPAIRRATE_MUL, 0.13)

GM:AddSkillModifier(SKILL_OVERHAND, SKILLMOD_REPAIRRATE_MUL, 0.25)
GM:AddSkillModifier(SKILL_OVERHAND, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.10)

GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_WORTH, 30)
GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_ENDWAVE_POINTS, 20)
GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_SPEED, -68.75)
GM:AddSkillModifier(SKILL_D_SLOW, SKILLMOD_JUMPPOWER_MUL, -0.2)


GM:AddSkillModifier(SKILL_GOURMET, SKILLMOD_FOODEATTIME_MUL, 2.0)
GM:AddSkillModifier(SKILL_GOURMET, SKILLMOD_FOODRECOVERY_MUL, 4.0)

GM:AddSkillModifier(SKILL_SUGARRUSH, SKILLMOD_FOODRECOVERY_MUL, -0.35)

GM:AddSkillModifier(SKILL_BATTLER1, SKILLMOD_MELEE_DAMAGE_MUL, 0.01)
GM:AddSkillModifier(SKILL_BATTLER2, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER3, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER4, SKILLMOD_MELEE_DAMAGE_MUL, 0.07)
GM:AddSkillModifier(SKILL_BATTLER5, SKILLMOD_MELEE_DAMAGE_MUL, 0.09)
GM:AddSkillModifier(SKILL_SOULNET, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

GM:AddSkillModifier(SKILL_BATTLER1, SKILLMOD_RELOADSPEED_MUL, -0.02)
GM:AddSkillModifier(SKILL_BATTLER2, SKILLMOD_RELOADSPEED_MUL, -0.04)
GM:AddSkillModifier(SKILL_BATTLER3, SKILLMOD_RELOADSPEED_MUL, -0.09)
GM:AddSkillModifier(SKILL_BATTLER4, SKILLMOD_RELOADSPEED_MUL, -0.13)
GM:AddSkillModifier(SKILL_BATTLER5, SKILLMOD_RELOADSPEED_MUL, -0.16)

GM:AddSkillModifier(SKILL_GLASSMAN, SKILLMOD_MELEE_DAMAGE_MUL, 2.3)
GM:AddSkillModifier(SKILL_GLASSMAN, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 2)

GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_MELEE_DAMAGE_MUL, 0.3)
GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_MELEE_KNOCKBACK_MUL, -0.9)

GM:AddSkillModifier(SKILL_QUICKDRAW, SKILLMOD_DEPLOYSPEED_MUL, 0.65)
GM:AddSkillModifier(SKILL_QUICKDRAW, SKILLMOD_RELOADSPEED_MUL, -0.01)

GM:AddSkillModifier(SKILL_QUICKRELOAD, SKILLMOD_RELOADSPEED_MUL, 0.10)
GM:AddSkillModifier(SKILL_QUICKRELOAD, SKILLMOD_DEPLOYSPEED_MUL, -0.15)

GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_RELOADSPEED_MUL, 0.30)
GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_AIMSPREAD_MUL, 0.5)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_RELOADSPEED_MUL, 0.02)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_DEPLOYSPEED_MUL, 0.02)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_RELOADSPEED_MUL, 0.03)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_DEPLOYSPEED_MUL, 0.03)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_RELOADSPEED_MUL, 0.04)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_DEPLOYSPEED_MUL, 0.04)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_MELEE_DAMAGE_MUL, -0.09)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_MELEE_DAMAGE_MUL, -0.13)

GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_MELEE_DAMAGE_MUL, -0.18)

GM:AddSkillModifier(SKILL_UNSIGIL, SKILLMOD_RELOADSPEED_MUL, 0.26)
GM:AddSkillModifier(SKILL_UNSIGIL, SKILLMOD_MELEE_DAMAGE_MUL, -0.8)

GM:AddSkillModifier(SKILL_PHASER, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.15)
GM:AddSkillModifier(SKILL_PHASER, SKILLMOD_SIGIL_TELEPORT_MUL, 0.15)

GM:AddSkillModifier(SKILL_DRIFT, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.05)

GM:AddSkillModifier(SKILL_WARP, SKILLMOD_SIGIL_TELEPORT_MUL, -0.05)

GM:AddSkillModifier(SKILL_SIGILOL, SKILLMOD_SIGIL_TELEPORT_MUL, 1)
GM:AddSkillModifier(SKILL_SIGILOL, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 3)

GM:AddSkillModifier(SKILL_HAMMERDISCIPLINE, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.05)
GM:AddSkillModifier(SKILL_HAMMERDISCIPLINE1, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.10)
GM:AddSkillModifier(SKILL_HAMMERDISCIPLINE2, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.15)
GM:AddSkillModifier(SKILL_BARRICADEEXPERT, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.2)

GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_RECOVERY_MUL, -0.2)
GM:AddSkillModifier(SKILL_SAFEFALL, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, 0.1)

GM:AddSkillModifier(SKILL_BACKPEDDLER, SKILLMOD_SPEED, -3)
GM:AddSkillFunction(SKILL_BACKPEDDLER, function(pl, active)
	pl.NoBWSpeedPenalty = active
end)

GM:AddSkillModifier(SKILL_D_CLUMSY, SKILLMOD_WORTH, 20)
GM:AddSkillModifier(SKILL_D_CLUMSY, SKILLMOD_POINTS, 10)
GM:AddSkillFunction(SKILL_D_CLUMSY, function(pl, active)
	pl.IsClumsy = active
end)

GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_SCRAP_START, 10)
GM:AddSkillFunction(SKILL_D_NOODLEARMS, function(pl, active)
	pl.NoObjectPickup = active
end)

GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_RESUPPLY_DELAY_MUL, -0.03)
GM:AddSkillFunction(SKILL_D_PALSY, function(pl, active)
	pl.HasPalsy = active
end)

GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_WORTH, 30)
GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_SCRAP_START, 16)
GM:AddSkillFunction(SKILL_D_HEMOPHILIA, function(pl, active)
	pl.HasHemophilia = active
end)

GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_WORTH, 30)
GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_ARSENAL_DISCOUNT, -0.66)

GM:AddSkillFunction(SKILL_TAUT, function(pl, active)
	pl.BuffTaut = active
end)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, 0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_HEALTH_MUL, -0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_PROP_CARRY_SLOW_MUL, -1)

GM:AddSkillModifier(SKILL_BLOODARMOR, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_HAEMOSTASIS, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.16)

GM:AddSkillModifier(SKILL_REGENERATOR, SKILLMOD_HEALTH, -6)

GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_WORTH, 60)
GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_ENDWAVE_POINTS, 15)
GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_HEALTH, -60)
GM:AddSkillModifier(SKILL_D_WEAKNESS, SKILLMOD_MELEE_DAMAGE_MUL, -0.3)

GM:AddSkillModifier(SKILL_D_WIDELOAD, SKILLMOD_WORTH, 20)
GM:AddSkillModifier(SKILL_D_WIDELOAD, SKILLMOD_RESUPPLY_DELAY_MUL, -0.20)
GM:AddSkillFunction(SKILL_D_WIDELOAD, function(pl, active)
	pl.NoGhosting = active
end)

GM:AddSkillFunction(SKILL_WOOISM, function(pl, active)
	pl.Wooism = active
end)

GM:AddSkillFunction(SKILL_ORPHICFOCUS, function(pl, active)
	pl.Orphic = active
end)

GM:AddSkillModifier(SKILL_WORTHINESS1, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_WORTHINESS2, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_WORTHINESS3, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_WORTHINESS4, SKILLMOD_WORTH, 10)

GM:AddSkillModifier(SKILL_KNUCKLEMASTER, SKILLMOD_UNARMED_SWING_DELAY_MUL, 0.35)
GM:AddSkillModifier(SKILL_KNUCKLEMASTER, SKILLMOD_UNARMED_DAMAGE_MUL, 0.75)

GM:AddSkillModifier(SKILL_CRITICALKNUCKLE, SKILLMOD_UNARMED_DAMAGE_MUL, -0.25)
GM:AddSkillModifier(SKILL_CRITICALKNUCKLE, SKILLMOD_UNARMED_SWING_DELAY_MUL, 0.25)

GM:AddSkillModifier(SKILL_SMARTTARGETING, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, 0.75)
GM:AddSkillModifier(SKILL_SMARTTARGETING, SKILLMOD_MEDDART_EFFECTIVENESS_MUL, -0.3)

GM:AddSkillModifier(SKILL_RECLAIMSOL, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, 1.5)
GM:AddSkillModifier(SKILL_RECLAIMSOL, SKILLMOD_MEDGUN_RELOAD_SPEED_MUL, -0.4)

GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_MELEE_RANGE_MUL, 0.1)

GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_MELEE_RANGE_MUL, 0.1)


GM:AddSkillModifier(SKILL_LANKYIII, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_LANKYIII, SKILLMOD_MELEE_RANGE_MUL, 0.1)

GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.33)
GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.33)
GM:AddSkillFunction(SKILL_D_FRAIL, function(pl, active)
	pl:SetDTBool(DT_PLAYER_BOOL_FRAIL, active)
end)

GM:AddSkillModifier(SKILL_MASTERCHEF, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

GM:AddSkillModifier(SKILL_LIGHTWEIGHT, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)

GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_JUMPPOWER_MUL, 0.04)
GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_SPEED, -2)

GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_JUMPPOWER_MUL, 0.05)
GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_SPEED, -3)

GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_JUMPPOWER_MUL, 0.06)
GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_RADIUS, 0.10)
GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.6)

GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.65)
GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_MUL, -0.3)

GM:AddSkillModifier(SKILL_BLOODLETTER, SKILLMOD_BLOODARMOR_GAIN_MUL, 1)

GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SLOW_EFF_TAKEN_MUL, -0.35)

GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.35)

GM:AddSkillModifier(SKILL_UNBOUND, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_CHEAPKNUCKLE, SKILLMOD_MELEE_RANGE_MUL, -0.1)

GM:AddSkillModifier(SKILL_HEAVYSTRIKES, SKILLMOD_MELEE_KNOCKBACK_MUL, 1)

GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJ_SPEED, -0.25)
GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.03)

GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_RADIUS, -0.2)
GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_MUL, 0.05)

GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_SPEED, -12)
GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.2)

GM:AddSkillFunction(SKILL_SCOURER, function(pl, active)
	pl.Scourer = active
end)

GM:AddSkillModifier(SKILL_DISPERSION, SKILLMOD_CLOUD_RADIUS, 0.15)
GM:AddSkillModifier(SKILL_DISPERSION, SKILLMOD_CLOUD_TIME, -0.1)

GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.16)
GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, -15)

GM:AddSkillModifier(SKILL_FOUR_IN_ONE, SKILLMOD_HEALTH, -7)
GM:AddSkillModifier(SKILL_FOUR_IN_ONE, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.09)

GM:AddSkillModifier(SKILL_THREE_IN_ONE, SKILLMOD_HEALTH, -10)
GM:AddSkillModifier(SKILL_THREE_IN_ONE, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.16)

GM:AddSkillModifier(SKILL_CIRCULATION, SKILLMOD_BLOODARMOR, 1)

GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_BLOODARMOR, 11)
GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_HEALTH, -9)

GM:AddSkillModifier(SKILL_ANTIGEN, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.05)
GM:AddSkillModifier(SKILL_ANTIGEN, SKILLMOD_HEALTH, -3)

GM:AddSkillModifier(SKILL_DAMAGER, SKILLMOD_HEALTH, 50)

GM:AddSkillModifier(SKILL_INSTRUMENTS, SKILLMOD_TURRET_RANGE_MUL, 0.05)

GM:AddSkillModifier(SKILL_LEVELHEADED, SKILLMOD_AIM_SHAKE_MUL, -0.05)

GM:AddSkillModifier(SKILL_ROBUST, SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, -0.06)

GM:AddSkillModifier(SKILL_TAUT, SKILLMOD_PROP_CARRY_SLOW_MUL, 0.4)

GM:AddSkillModifier(SKILL_TURRETOVERLOAD, SKILLMOD_TURRET_RANGE_MUL, -0.3)

GM:AddSkillModifier(SKILL_STOWAGE, SKILLMOD_RESUPPLY_DELAY_MUL, 0.05)
GM:AddSkillFunction(SKILL_STOWAGE, function(pl, active)
	pl.Stowage = active
end)

GM:AddSkillFunction(SKILL_TRUEWOOISM, function(pl, active)
	pl.TrueWooism = active
end)


GM:AddSkillModifier(SKILL_MECHANIC, SKILLMOD_SCRAPDISCOUNT, -0.15)
GM:AddSkillModifier(SKILL_MECHANIC, SKILLMOD_ARSENAL_DISCOUNT, 0.15)


GM:AddSkillModifier(SKILL_CURSECURE, SKILLMOD_CURSEM, -0.20)

GM:AddSkillModifier(SKILL_INSIGHT, SKILLMOD_ARSENAL_DISCOUNT, -0.02)

GM:AddSkillModifier(SKILL_VKID, SKILLMOD_JUMPPOWER_MUL, 0.30)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_HEALTH, -50)

GM:AddSkillModifier(SKILL_CURSEDHEALTH, SKILLMOD_CURSEM, -0.25)
