GM.Skills = {}
GM.SkillModifiers = {}
GM.SkillFunctions = {}
GM.SkillModifierFunctions = {}
GM.UpgradableSkills = {}

function GM:AddSkill(id, name, description, x, y, connections, tree, level)
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
	skill.Level = level

	self.Skills[id] = skill

	return skill
end


-- Use this after all skills have been added. It assigns dynamic IDs!
function GM:AddTrinket(name, swepaffix, pairedweapon, veles, weles, tier, description, status, stocks, icon, models)
	local skill = {Connections = {}}

	skill.Name = name
	skill.Trinket = swepaffix
	skill.Status = status

	local datatab = {PrintName = name, DroppedEles = weles, Tier = tier, Description = description, Status = status, Stocks = stocks, Icon = icon, PacModels = models}

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
TREE_BRANCH_ELEMENTS = 12


TREE_RESNYA = 13
TREE_DOSET = 14
TREE_OLD_GOD = 15

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
--Custom
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
SKILL_FREEAMMO = 271
SKILL_BLOODLIFE = 272
SKILL_TORMENT7 = 273
SKILL_AVOID_BLOCK = 275
SKILL_CAN_EATER = 276
SKILL_MEDICBOOSTER = 277
SKILL_VAMPIRISM = 278
SKILL_D_CURSEDTRUE = 279
SKILL_TORMENT8 = 280
SKILL_SINS = 281
SKILL_HELPLIFER = 282
SKILL_ANTINEGR = 283
SKILL_CQARMOR = 284
SKILL_CHEESE2 = 285
SKILL_OMEGA = 286
SKILL_DOSETHELP = 287
SKILL_BLOODYMAN = 288
SKILL_FREESKILL = 289
SKILL_FREESKILL1 = 290
SKILL_FREESKILL2 = 291
SKILL_DEADINSIDE = 292
SKILL_SKYHELP = 293
SKILL_TRUEBLOCK = 294
SKILL_GOODATTACK = 295
SKILL_VKID2 = 296
SKILL_FREEPOINT1 = 297
SKILL_FREEPOINT2 = 298
SKILL_FREEPOINT3 = 299
SKILL_FREEPOINT4 = 300
SKILL_BLOODBUFF = 301
SKILL_JUSTICE = 302
SKILL_DEFENDBLOOD = 303
SKILL_SELFSAVER = 304
SKILL_ASAVE = 305
SKILL_NANOPEL = 306
SKILL_MOREDAMAGE = 307
SKILL_PITCHER2 = 308
SKILL_SECONDCHANCE = 309
SKILL_DONATE13 = 310
SKILL_COMBOHEAL = 311
SKILL_DUALHEAL = 312
SKILL_DONATE14 = 313
SKILL_FOREVERALONE = 314
SKILL_GIGACHAD = 315
SKILL_XPMULGOOD = 316
SKILL_SKILLFORGODS = 317
SKILL_SECRET = 318
SKILL_WYRDREC = 319
SKILL_SECRET2 = 320
SKILL_DEBUFF = 321
SKILL_CHEESE3 = 322
SKILL_SAMODOS = 323
SKILL_FOODHEALS = 324
SKILL_SEEAURA = 325
SKILL_DONATE15 = 326
SKILL_PARASITOID = 327
SKILL_PREMIUM = 328
SKILL_CREDIT = 329
SKILL_POGO = 330
SKILL_LOX = 331
SKILL_AMULET_1 = 332
SKILL_INVISIBLE_MAN = 333
SKILL_INF_POWER = 334
SKILL_AMULET_2 = 335
SKILL_AMULET_3 = 336
SKILL_PHIK = 337
SKILL_AMULET_4 = 338
SKILL_QUE_PRO = 339
SKILL_NFINGERS = 340
SKILL_SFINGERS = 341
SKILL_D_FINGERS = 342
SKILL_AMULET_5 = 343
SKILL_SEX_IS_REAL = 344
SKILL_SECRET_VI = 345
SKILL_SECRET_VII = 346
SKILL_GOD_HEART = 347
SKILL_JUSTICE_2 = 348
SKILL_BLOODYFISTS = 349
SKILL_AMULET_6 = 350
SKILL_MOBILIZED = 351
SKILL_LAST_MAN = 352
SKILL_BATTLER6 = 353
SKILL_BARA_CURSED = 354
SKILL_SOUL_TRADE = 355
SKILL_LAST_AMMO = 356
SKILL_AMULET_7 = 357
SKILL_AMULET_8 = 358
SKILL_AMULET_9 = 359
SKILL_AMULET_10 = 360
SKILL_AMULET_11 = 361
SKILL_AMULET_12 = 362
SKILL_COOL_MED = 363
SKILL_FLOWER = 364
SKILL_ABYSSFLOWER = 365
SKILL_BUG_GET = 366
SKILL_HELPER = 367
SKILL_THE_CADER = 368
SKILL_DONATE16 = 369
SKILL_ELEMENTAL_BUFF = 370
SKILL_BERSERK = 371
SKILL_SECRET_VIII = 372
SKILL_MADNESS = 373
SKILL_CQBOOTS = 374
SKILL_AMULET_13 = 375
SKILL_AMULET_14 = 376
SKILL_INDUCTOR_ISSUE = 377
SKILL_ATTACHMENT_CURSE = 378
SKILL_HEHE = 379
SKILL_CONISSUE = 380
SKILL_N_FRIEND = 381
SKILL_HAHA = 382
SKILL_HIHI = 383
SKILL_DOUBLE_ISSUE = 384
SKILL_DOUBLE_EXPLOSIVE = 385
SKILL_DOUBLE_EXPLOSIVE_ALT = 386
SKILL_CURSED_ALT = 387
SKILL_CRYO_LASER = 388
SKILL_FREE_WAY = 389
SKILL_ABSOLUTE = 390
SKILL_CHEESE_PIE = 391
SKILL_MORE_INFO = 392
SKILL_MAGIC_MYSTERY = 393
SKILL_USEFULL = 394
SKILL_ANATOMY = 395
SKILL_RESNYA = 396
SKILL_OLD_GOD = 397
SKILL_DOSET = 398
SKILL_RESNYA1 = 399
SKILL_OLD_GOD1 = 400
SKILL_DOSET1 = 401
SKILL_GENIUS = 402
SKILL_ANTI_DEVO = 403
SKILL_SLOWCOACH = 404
SKILL_CURSE_OF_MISS = 405
SKILL_RESNYA2 = 406
SKILL_OLD_GOD2 = 407
SKILL_DOSET2 = 408
SKILL_100_PERC = 409
SKILL_BLOODHACK = 410
SKILL_HEALMODULE = 411
SKILL_VIP = 412
SKILL_CIRCULATION1 = 413
SKILL_CIRCULATION2 = 414
SKILL_STONEBLOOD = 415
SKILL_AMULET_15 = 416
SKILL_GODHEART = 417





SKILLMOD_HEALTH = 1
SKILLMOD_SPEED = 2
SKILLMOD_WORTH = 3
SKILLMOD_BLOODARMOR = 4
SKILLMOD_PIECE_OF_AMULET = 5
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
SKILLMOD_FALLDAMAGE_THRESHOLD_MUL = 28
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
SKILLMOD_RES_AMMO_MUL = 106
SKILLMOD_HEALTHMUL = 107
SKILLMOD_SPOINT = 108
SKILLMOD_SCALEMODEL = 109
SKILLMOD_M_DMG = 110
SKILLMOD_M_REG = 111
SKILLMOD_ADD_STATUS = 112
SKILLMOD_FALLDAMAGE_RECOVERY_MUL = 113
SKILLMOD_FIRE_DELAY = 114
SKILLMOD_ELEMENTAL_MUL = 115
SKILLMOD_ATT_CHANCE = 116
SKILLMOD_IND_DMG_TAKEN = 117
SKILLMOD_IND_CHANCE = 118
SKILLMOD_HEADSHOT_MUL = 119
SKILLMOD_DMG_TAKEN = 120

local GOOD = "^"..COLORID_GREEN
local BAD = "^"..COLORID_RED
local NEUTRAL = "^"..COLORID_GRAY
local PURPLE = "^"..COLORID_PURPLE
--
local d = GM:AddSkill(SKILL_RESNYA, translate.Get("skill_resnya"), GOOD..translate.Get("skill_resnya_d1")..GOOD..translate.Get("skill_resnya_d2"),
																22,			-6,					{SKILL_NONE}, TREE_RESNYA)
GM:AddSkillModifier(SKILL_RESNYA, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
d.DontUnlock = SKILL_OLD_GOD
d.DontUnlock2 = SKILL_DOSET
local d = GM:AddSkill(SKILL_DOSET, translate.Get("skill_doset"), GOOD..translate.Get("skill_doset_d1")..GOOD..translate.Get("skill_doset_d2"),
																22,			-4,					{SKILL_NONE}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET, SKILLMOD_LUCK, 1)
d.DontUnlock = SKILL_OLD_GOD
d.DontUnlock2 = SKILL_RESNYA
local d = GM:AddSkill(SKILL_OLD_GOD, translate.Get("skill_old_g"), GOOD..translate.Get("skill_old_g_d1")..GOOD..translate.Get("skill_old_g_d2"),
																22,			-2,					{SKILL_NONE}, TREE_OLD_GOD)
GM:AddSkillModifier(SKILL_OLD_GOD, SKILLMOD_M_DMG, 0.3)
GM:AddSkillModifier(SKILL_OLD_GOD, SKILLMOD_M_REG, 0.3)
d.DontUnlock = SKILL_DOSET
d.DontUnlock2 = SKILL_RESNYA


GM:AddSkill(SKILL_RESNYA1, translate.Get("skill_resnya1"), GOOD..translate.Get("skill_resnya1_d1")..GOOD..translate.Get("skill_resnya1_d2"),
																24,			-6,					{SKILL_RESNYA}, TREE_RESNYA)
GM:AddSkill(SKILL_DOSET1, translate.Get("skill_doset1"), GOOD..translate.Get("skill_doset1_d1")..GOOD..translate.Get("skill_doset1_d2"),
																24,			-4,					{SKILL_DOSET}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET1, SKILLMOD_ELEMENTAL_MUL, 0.1)
GM:AddSkill(SKILL_OLD_GOD1, translate.Get("skill_old1_g"), GOOD..translate.Get("skill_old_g1_d1")..GOOD..translate.Get("skill_old_g1_d2"),
																24,			-2,					{SKILL_OLD_GOD}, TREE_OLD_GOD)

GM:AddSkill(SKILL_RESNYA2, translate.Get("skill_resnya2"), GOOD..translate.Get("skill_resnya2_d1")..BAD..translate.Get("skill_resnya2_d2"),
																26,			-6,					{SKILL_RESNYA1}, TREE_RESNYA)
GM:AddSkillModifier(SKILL_RESNYA2, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.2)
GM:AddSkill(SKILL_DOSET2, translate.Get("skill_doset2"), GOOD..translate.Get("skill_doset2_d1")..BAD..translate.Get("skill_doset2_d2"),
																26,			-4,					{SKILL_DOSET1}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET2, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)
GM:AddSkillModifier(SKILL_DOSET2, SKILLMOD_DMG_TAKEN, -0.1)
GM:AddSkill(SKILL_OLD_GOD2, translate.Get("skill_old_g2"), GOOD..translate.Get("skill_old_g2_d1")..BAD..translate.Get("skill_old_g2_d2"),
																26,			-2,					{SKILL_OLD_GOD1}, TREE_OLD_GOD)
GM:AddSkillModifier(SKILL_OLD_GOD2, SKILLMOD_DAMAGE, -0.25)
-- Health Tree
GM:AddSkill(SKILL_STOIC1, translate.Get("skill_stoici_0"), GOOD..translate.Get("skill_stoici_d1")..BAD..translate.Get("skill_stoici_d2"),
																-4,			-6,					{SKILL_NONE, SKILL_STOIC2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC2, translate.Get("skill_stoicii_0"), GOOD..translate.Get("skill_stoicii_d1")..BAD..translate.Get("skill_stoicii_d2"),
																-4,			-4,					{SKILL_STOIC3, SKILL_VITALITY1, SKILL_REGENERATOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC3, translate.Get("skill_stoiciii_0"), GOOD..translate.Get("skill_stoiciii_d1")..BAD..translate.Get("skill_stoiciii_d2"),
																-3,			-2,					{SKILL_STOIC4}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC4, translate.Get("skill_stoiciv_0"), GOOD..translate.Get("skill_stoiciv_d1")..BAD..translate.Get("skill_stoiciv_d2"),
																-3,			0,					{SKILL_STOIC5}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC5, translate.Get("skill_stoicv_0"), GOOD..translate.Get("skill_stoicv_d1")..BAD..translate.Get("skill_stoicv_d2"),
																-3,			2,					{SKILL_BLOODARMOR, SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_HEMOPHILIA, translate.Get("skill_hemoplilia_0"), GOOD..translate.Get("skill_hemoplilia_d1")..GOOD..translate.Get("skill_hemoplilia_d2")..BAD..translate.Get("skill_hemoplilia_d3"),
																4,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GLUTTON,  translate.Get("skill_glutton_0"), GOOD.. translate.Get("skill_glutton_d1")..GOOD.. translate.Get("skill_glutton_d2")..GOOD.. translate.Get("skill_glutton_d3")..BAD.. translate.Get("skill_glutton_d4"),
																3,			-2,					{SKILL_GOURMET, SKILL_BLOODARMOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_PREPAREDNESS, translate.Get("skill_prepadnes_0"), GOOD..translate.Get("skill_prepadnes_d"),
																4,			-6,					{SKILL_NONE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GOURMET, translate.Get("skill_gurman_0"), GOOD..translate.Get("skill_gurman_d1")..BAD..translate.Get("skill_gurman_d2"),
																4,			-4,					{SKILL_PREPAREDNESS, SKILL_VITALITY1}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_HAEMOSTASIS, translate.Get("skill_haemostasis_0"), GOOD..translate.Get("skill_haemostasis_d1")..BAD..translate.Get("skill_haemostasis_d2")..GOOD..translate.Get("skill_haemostasis_d3"),
																4,			6,					{SKILL_STONEBLOOD}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STONEBLOOD, translate.Get("skill_stoneblood"), GOOD..translate.Get("skill_stoneblood_d1"),
																4,			5,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLETTER, translate.Get("skill_bloodlet_0"), GOOD..translate.Get("skill_bloodlet_d1")..BAD..translate.Get("skill_bloodlet_d2"),
																0,			4,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_REGENERATOR, translate.Get("skill_regen_0"), GOOD..translate.Get("skill_regen_d1")..BAD..translate.Get("skill_regen_d2"),
																-5,			-2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_NULLED, translate.Get("skill_regen1_0"), GOOD..translate.Get("skill_regen1_d1"),
			                                                   	-5,			0,					{SKILL_REGENERATOR}, TREE_HEALTHTREE)
.Hidden = true	
GM:AddSkill(SKILL_BLOODARMOR, translate.Get("skill_bloodarmor_0"), GOOD..translate.Get("skill_bloodarmor_d1") ..BAD..translate.Get("skill_bloodarmor_d2"),
																2,			2,					{SKILL_IRONBLOOD, SKILL_BLOODLETTER, SKILL_D_HEMOPHILIA}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_IRONBLOOD, translate.Get("skill_ironblood_0"), GOOD..translate.Get("skill_ironblood_d1") ..GOOD..translate.Get("skill_ironblood_d2") ..BAD..translate.Get("skill_ironblood_d3"),
																2,			4,					{SKILL_HAEMOSTASIS, SKILL_CIRCULATION}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_WEAKNESS, translate.Get("skill_d_weakness_0"), GOOD..translate.Get("skill_d_weakness_d1")..GOOD..translate.Get("skill_d_weakness_d2")..BAD..translate.Get("skill_d_weakness_d3")..BAD..translate.Get("skill_d_weakness_d4"),
																1,			-1,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY1, translate.Get("skill_vitalityi_0"), GOOD..translate.Get("skill_vitalityi_d1"),
																0,			-4,					{SKILL_VITALITY2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY2, translate.Get("skill_vitalityii_0"), GOOD..translate.Get("skill_vitalityii_d1"),
																0,			-2,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY3, translate.Get("skill_vitalityiii_0"), GOOD..translate.Get("skill_vitalityiii_d1"),
																0,			-0,					{SKILL_D_WEAKNESS}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODBUFF, translate.Get("skill_bbuff"), GOOD..translate.Get("skill_bbuff_d1")..BAD.."-20"..translate.Get("barmor"),
																-1,			1,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.25)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.25)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_BLOODARMOR, -20)
GM:AddSkill(SKILL_DEBUFF, translate.Get("skill_dbuff"), BAD..translate.Get("skill_dbuff_d1")..GOOD.."+60"..translate.Get("barmor"),
																-1.50,			0,					{SKILL_BLOODBUFF}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, 0.50)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, 0.75)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_BLOODARMOR, 60)
GM:AddSkill(SKILL_CHEESE, translate.Get("skill_cheese_0"), GOOD..translate.Get("skill_cheese_d1"),
																1,			1,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE2, translate.Get("skill_cheese_0").." II", GOOD..translate.Get("skill_cheese_d2"),
																0,			1,					{SKILL_CHEESE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE3, translate.Get("skill_cheese_0").." III", GOOD..translate.Get("skill_cheese_d3"),
																0,			3,					{SKILL_CHEESE2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE_PIE, translate.Get("skill_cheesepie"), GOOD.."+7"..translate.Get("barmor"),
																-2,			3,					{SKILL_CHEESE3}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_CHEESE_PIE, SKILLMOD_BLOODARMOR, 7)
GM:AddSkill(SKILL_TANKER, translate.Get("skill_tanker_0"), GOOD..translate.Get("skill_tanker_d1")..BAD..translate.Get("skill_tanker_d2"),
																-5,			4,					{SKILL_LIVER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ABSOLUTE, translate.Get("skill_abs"), translate.Get("skill_abs_d"),
																-5,			3,					{SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_LIVER,  translate.Get("skill_curse_0"), BAD..translate.Get("skill_curse_d1")..GOOD..translate.Get("skill_curse_d2")..GOOD..translate.Get("skill_curse_d3")..GOOD.."+30"..translate.Get("worth"),
																-5,			5,					{SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_HEALTH, 30)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_FORAGER, translate.Get("skill_f_0"), GOOD..translate.Get("skill_f_d1")..BAD..translate.Get("skill_f_d2"),
																5,			-2,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_JUSTICE, translate.Get("skill_justice"), GOOD.."-8%"..translate.Get("res_delay"),
																6,			-1,					{SKILL_FORAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_JUSTICE, SKILLMOD_RESUPPLY_DELAY_MUL, -0.08)
GM:AddSkill(SKILL_JUSTICE_2, translate.Get("skill_justice2"), GOOD.."+9%"..translate.Get("res_ammo")..BAD.."+10%"..translate.Get("res_delay"),
																6,			0,					{SKILL_JUSTICE}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_JUSTICE_2, SKILLMOD_RESUPPLY_DELAY_MUL, 0.1)	
GM:AddSkillModifier(SKILL_JUSTICE_2, SKILLMOD_RES_AMMO_MUL, 0.09)			
GM:AddSkill(SKILL_SUGARRUSH, translate.Get("skill_srush_0"), GOOD..translate.Get("skill_srush_d1")..BAD..translate.Get("skill_srush_d2"),
																4,			0,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION, translate.Get("skill_cir_0"), GOOD..translate.Get("skill_cir_d1"),
																4,			4,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION1, translate.Get("skill_cir_0").." II", GOOD.."+3"..translate.Get("barmor"),
																6,			6,					{SKILL_CIRCULATION,SKILL_CIRCULATION2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION2, translate.Get("skill_cir_0").." III", GOOD.."+3"..translate.Get("barmor"),
																4,			8,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_SANGUINE, translate.Get("skill_san_0"), GOOD..translate.Get("skill_san_d1")..BAD..translate.Get("skill_san_d2"),
																6,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODYMAN, translate.Get("skill_bloodyman"), GOOD.."+130"..translate.Get("barmor")..BAD.."-100"..translate.Get("health"),
																7,			3,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_MADNESS, translate.Get("skill_madness"), GOOD..translate.Get("skill_madness_d1")..BAD..translate.Get("skill_madness_d2"),
																7,			4,					{SKILL_BLOODYMAN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ANTIGEN, translate.Get("skill_agen_0"), GOOD..translate.Get("skill_agen_d1")..BAD..translate.Get("skill_agen_d2"),
																-2,			4,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_DAMAGER, translate.Get("skill_bhealth_0"), GOOD..translate.Get("skill_bhealth_d1")..BAD..translate.Get("skill_bhealth_d2"),
																-2,			5,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLIFE, translate.Get("skill_blife_0"), GOOD.."+50"..translate.Get("barmor")..BAD.."-60"..translate.Get("health")..NEUTRAL..translate.Get("skill_blife_d1"),
																-2,			6,					{SKILL_DAMAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_HEALTH, -60)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_BLOODARMOR, 50)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_MELEE_DAMAGE_MUL, -0.25)
GM:AddSkill(SKILL_CAN_EATER, translate.Get("skill_cani_0"), BAD.."-33"..translate.Get("health")..GOOD..translate.Get("skill_cani_d1"),
																0,			5,					{SKILL_DAMAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_CAN_EATER, SKILLMOD_HEALTH, -33)
-- Speed Tree
GM:AddSkill(SKILL_SPEED1, translate.Get("skill_speed").."I", GOOD.."+5"..translate.Get("speed")..BAD.."-4"..translate.Get("health"),
																-4,			6,					{SKILL_NONE, SKILL_SPEED2}, TREE_SPEEDTREE)
SKILL_DODGE = 263
GM:AddSkill(SKILL_DODGE, translate.Get("skill_dodge"), GOOD..translate.Get("skill_dodge_d1")..GOOD..translate.Get("skill_dodge_d2")..BAD.."-25"..translate.Get("speed"),
																-3,			1,					{SKILL_SPEED2}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_DODGE, SKILLMOD_SPEED, -25)

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
GM:AddSkill(SKILL_VKID, translate.Get("skill_vkid"), GOOD.."+30%"..translate.Get("jump")..GOOD.."+60"..translate.Get("speed")..GOOD..translate.Get("skill_vkid_d")..BAD.."-50"..translate.Get("health"),
																4,			-3,					{SKILL_VKID2}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_VKID2, translate.Get("skill_vkid2"), GOOD.."+30%"..translate.Get("jump")..GOOD.."+15"..translate.Get("speed")..GOOD..translate.Get("skill_vkid_d")..BAD.."-25"..translate.Get("health"),
																4,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_SLOW, translate.Get("skill_slow"), GOOD..translate.Get("skill_slow_d1")..GOOD..translate.Get("skill_slow_d2")..BAD..translate.Get("skill_slow_d3")..BAD..translate.Get("skill_slow_d4"),
																0,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_NOSEE, translate.Get("skill_cursevision_0"), GOOD..translate.Get("skill_cursevision_d1")..GOOD..translate.Get("skill_cursevision_d2")..BAD..translate.Get("skill_cursevision_d3"),
																6.5,			-2,					{SKILL_AGILEIII}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_SPEED, 50)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_MOTIONI, translate.Get("skill_motion1"), GOOD..translate.Get("skill_motion_d_all"),
																-2,			-2,					{SKILL_MOTIONII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONII, translate.Get("skill_motion2"), GOOD..translate.Get("skill_motion_d_all"),
																-1,			-1,					{SKILL_MOTIONIII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONIII, translate.Get("skill_motion3"), GOOD..translate.Get("skill_motion_d_all"),
																0,			-2,					{SKILL_D_SLOW}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_BACKPEDDLER, translate.Get("skill_backpeddler"), GOOD..translate.Get("skill_backpeddler_d1")..BAD..translate.Get("skill_backpeddler_d2")..BAD..translate.Get("skill_backpeddler_d3"),
																-6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_PHASER, translate.Get("skill_phaser"), GOOD.."+15%"..translate.Get("barricadespeed")..BAD.."+15%"..translate.Get("sigilteleport"),
																-1,			4,					{SKILL_D_WIDELOAD, SKILL_DRIFT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_LAST_MAN, translate.Get("skill_last_man"), GOOD..translate.Get("skill_last_man_d1")..BAD..translate.Get("skill_last_man_d2"),
																-2,			5,					{SKILL_PHASER}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_DRIFT, translate.Get("skill_drifter"), GOOD.."+5%"..translate.Get("barricadespeed"),
																1,			3,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_WARP, translate.Get("skill_warp"), GOOD.."-5%"..translate.Get("sigilteleport"),
																2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SIGILOL, translate.Get("skill_s_inf"), GOOD.."+300%"..translate.Get("barricadespeed")..BAD.."+100%"..translate.Get("sigilteleport"),
																2,			4,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDTRINKETS, translate.Get("skill_cursedd"), GOOD..translate.Get("skill_cursed")..BAD..translate.Get("skill_cursed")..GOOD..translate.Get("skill_cursed"),
																2,		    5,					{SKILL_SIGILOL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDHEALTH, translate.Get("skill_mda"), GOOD..translate.Get("skill_mda_d")..BAD.."-25%"..translate.Get("m_curse"),
																1,		    4.5,					{SKILL_CURSEDTRINKETS}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_OMEGA, translate.Get("skill_omega"), BAD..translate.Get("skill_omega_d1")..GOOD.."+50%"..translate.Get("m_curse"),
																0,		    5,					{SKILL_CURSEDHEALTH}, TREE_SPEEDTREE)





GM:AddSkill(SKILL_SAFEFALL, translate.Get("skill_sfall"), GOOD..translate.Get("skill_sfall_d1")..GOOD..translate.Get("skill_sfall_d2")..BAD..translate.Get("skill_sfall_d3"),
																0,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_WIDELOAD, translate.Get("skill_wideroad_0"), GOOD.."+20"..translate.Get("worth")..GOOD.."-20%"..translate.Get("res_delay")..BAD..translate.Get("skill_wideroad_d1"),
																1,			1,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_U_CORRUPTEDFRAGMENT, translate.Get("skill_sigil_corrupt_0"), GOOD..translate.Get("skill_sigil_corrupt_d0"),
																-2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ULTRANIMBLE, translate.Get("skill_salostealer"), GOOD.."+30"..translate.Get("speed")..BAD.."-10"..translate.Get("health"),
																0,			-6,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_POGO, translate.Get("skill_pogo"), translate.Get("skill_pogo_d1")..GOOD..translate.Get("skill_pogo_d2")..BAD.."-45%"..translate.Get("jump"),
																0,			-7,					{SKILL_ULTRANIMBLE}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_POGO, SKILLMOD_JUMPPOWER_MUL, -0.45)
GM:AddSkill(SKILL_WORTHINESS3, translate.Get("worthness").."III", GOOD.."+10"..translate.Get("worth")..BAD.."-3"..translate.Get("start_points"),
																6,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SURESTEP, translate.Get("skill_step_0"), GOOD..translate.Get("skill_step_d0")..BAD.."-4"..translate.Get("speed"),
																6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_INTREPID, translate.Get("skill_int_0"), GOOD..translate.Get("skill_int_d0")..BAD.."-4"..translate.Get("speed"),
																6,			-4,					{SKILL_ROBUST}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ROBUST,  translate.Get("skill_rob_0"), GOOD.. translate.Get("skill_rob_d0"),
																5,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CARDIOTONIC,translate.Get("skill_cardi_0"), GOOD..translate.Get("skill_cardi_d0")..BAD.."-12"..translate.Get("speed")..BAD..translate.Get("skill_cardi_d1"),
																-6,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_UNBOUND,translate.Get("skill_unbound_0"), GOOD..translate.Get("skill_unbound_d0")..BAD.."-4"..translate.Get("speed"),
																-4,			-4,					{SKILL_SLOWCOACH}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SLOWCOACH,translate.Get("skill_scoach"), GOOD..translate.Get("skill_scoach_d1")..BAD.."-8"..translate.Get("speed"),
																-4,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_SLOWCOACH, SKILLMOD_SPEED,-8)
-- Medic Tree
GM:AddSkill(SKILL_SURGEON1, translate.Get("skill_surg").."I", GOOD.."-6%"..translate.Get("med_cool"),
																-4,			6,					{SKILL_NONE, SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON2, translate.Get("skill_surg").."II", GOOD.."-9%"..translate.Get("med_cool"),
																-3,			3,					{SKILL_WORTHINESS4, SKILL_SURGEON3}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_COOL_MED, translate.Get("skill_cool_med"), GOOD..translate.Get("skill_cool_med_d1")..BAD.."-25%"..translate.Get("med_effect"),
																-1,			3,					{SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_FLOWER, translate.Get("skill_flower"), GOOD..translate.Get("skill_flower_d1")..BAD..translate.Get("skill_flower_d2"),
																-1,			1,					{SKILL_COOL_MED}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_HEALMODULE, translate.Get("skill_hmod"), GOOD..translate.Get("skill_hmod_d1"),
																-1,			-0.5,					{SKILL_FLOWER}, TREE_SUPPORTTREE)
GM:AddSkillModifier(SKILL_FLOWER, SKILLMOD_POINT_MULTIPLIER, -0.25)
local d = GM:AddSkill(SKILL_ABYSSFLOWER, translate.Get("skill_aflower"), GOOD..translate.Get("skill_aflower_d1")..BAD..translate.Get("skill_aflower_d2"),
																-1,			0.5,					{SKILL_FLOWER}, TREE_SUPPORTTREE)
d.RemortReq = 46
--d.Disabled = true
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
GM:AddSkill(SKILL_D_FRAIL,  translate.Get("skill_frail"), GOOD.."-33%"..translate.Get("med_cool")..GOOD.."+33%"..translate.Get("med_effect")..BAD..translate.Get("skill_frail_d1"),
																-4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_MEDICBOOSTER,  translate.Get("skill_boostermed"), BAD.."+33%"..translate.Get("med_cool")..GOOD..translate.Get("skill_boostermed_d1"),
																-4,			-3,					{SKILL_D_FRAIL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_MEDICCLOUD, translate.Get("skill_u_medcloud"), GOOD..translate.Get("skill_u_medcloud_d1"),
																0,			-2,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_DUALHEAL, translate.Get("skill_dualheal"), GOOD..translate.Get("skill_dualheal_d1")..BAD..translate.Get("skill_dualheal_d2"),
																-1,			-3,					{SKILL_U_MEDICCLOUD}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_FOODHEALS, translate.Get("skill_fheals"), GOOD..translate.Get("skill_fheals_d1")..BAD..translate.Get("skill_fheals_d2"),
																-2,			-4,					{SKILL_DUALHEAL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SMARTTARGETING, translate.Get("skill_starget"), GOOD..translate.Get("skill_starget_d1")..BAD..translate.Get("skill_starget_d2")..BAD..translate.Get("skill_starget_d3"),
																0,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_RECLAIMSOL, translate.Get("skill_rec_sol"), GOOD..translate.Get("skill_rec_sol_d1")..BAD..translate.Get("skill_rec_sol_d2")..BAD..translate.Get("skill_rec_sol_d3")..BAD..translate.Get("skill_rec_sol_d4"),
																0,			4,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_STRENGTHSHOT, translate.Get("skill_sshot"), GOOD..translate.Get("skill_sshot_d1"),
																0,			0,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_WORTHINESS4, translate.Get("worthness").."IV", GOOD.."+10"..translate.Get("worth")..BAD.."-3"..translate.Get("start_points"),
																-5,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_ANTITODESHOT, translate.Get("skill_u_antidote"), GOOD..translate.Get("skill_u_antidote_d1"),
																4,			-2,					{SKILL_PREMIUM}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_PREMIUM, translate.Get("skill_premium"), GOOD..translate.Get("skill_premium_d1")..BAD..translate.Get("skill_premium_d2"),
																3,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_DISPERSION, translate.Get("skill_disp"), GOOD..translate.Get("skill_disp_d1")..BAD..translate.Get("skill_disp_d2"),
																0,			-4,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_COMBOHEAL, translate.Get("skill_comboheal"), GOOD..translate.Get("skill_comboheal_d1")..BAD..translate.Get("skill_comboheal_d2"),
																0,			-5,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_PHIK, translate.Get("skill_phik"), GOOD..translate.Get("skill_phik_d1")..BAD..translate.Get("skill_phik_d2"),
																-2,			-5,					{SKILL_COMBOHEAL}, TREE_SUPPORTTREE)
--.Disabled = true
GM:AddSkill(SKILL_FOREVERALONE, translate.Get("skill_foreveralone"), GOOD..translate.Get("skill_foreveralone_d1")..BAD..translate.Get("skill_foreveralone_d2"),
																-1,			-6,					{SKILL_COMBOHEAL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_WYRDREC, translate.Get("skill_wyrdrec"), GOOD..translate.Get("skill_wyrdrec_d1")..BAD..translate.Get("skill_wyrdrec_d2"),
																-2,			-7,					{SKILL_FOREVERALONE}, TREE_SUPPORTTREE)
--.DontUnlock = SKILL_HANDY1

-- Defence Tree
GM:AddSkill(SKILL_HANDY1, translate.Get("skill_handy").."I", GOOD.."+5%"..translate.Get("repair"),
																-5,			-6,					{SKILL_NONE, SKILL_HANDY2}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY2, translate.Get("skill_handy").."II", GOOD.."+6%"..translate.Get("repair"),
																-5,			-4,					{SKILL_HANDY3, SKILL_U_BLASTTURRET, SKILL_LOADEDHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY3, translate.Get("skill_handy").."III", GOOD.."+8%"..translate.Get("repair"),
																-5,			-1,					{SKILL_TAUT, SKILL_HAMMERDISCIPLINE, SKILL_D_NOODLEARMS, SKILL_HANDY4}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY4, translate.Get("skill_handy").."IV", GOOD.."+11%"..translate.Get("repair"),
																-3,			1,					{SKILL_HANDY5,SKILL_SKYHELP}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_SKYHELP, translate.Get("skill_skyhelp"), GOOD.."+40"..translate.Get("start_points")..BAD..translate.Get("skill_skyhelp_d1"),
																-1,			2,					{SKILL_HANDY4}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY5, translate.Get("skill_handy").."V", GOOD.."+13%"..translate.Get("repair"),
																-4,			3,					{SKILL_OVERHAND}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_OVERHAND, translate.Get("skill_ohandy"), GOOD.."+25%"..translate.Get("repair")..BAD.."+15%"..translate.Get("hammerd"),
																-3,			4,					{SKILL_HANDY5}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE, translate.Get("skill_h_disp").."I", GOOD.."-5%"..translate.Get("hammerd"),
																0,			1,					{SKILL_BARRICADEEXPERT}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE1, translate.Get("skill_h_disp").."II", GOOD.."-10%"..translate.Get("hammerd"),
																0,			0,					{SKILL_HAMMERDISCIPLINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE2, translate.Get("skill_h_disp").."III", GOOD.."-15%"..translate.Get("hammerd"),
																0,			-1,					{SKILL_HAMMERDISCIPLINE1}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BARRICADEEXPERT, translate.Get("skill_rein"), GOOD..translate.Get("skill_rein_d1")..GOOD..translate.Get("skill_rein_d2")..BAD.."+20%"..translate.Get("hammerd"),
																0,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_LOADEDHULL, translate.Get("skill_l_hull"), GOOD..translate.Get("skill_l_hull_d1")..BAD..translate.Get("skill_l_hull_d2"),
																-2,			-4,					{SKILL_REINFORCEDHULL, SKILL_REINFORCEDBLADES, SKILL_AVIATOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDHULL, translate.Get("skill_r_hull"), GOOD..translate.Get("skill_r_hull_d1")..BAD..translate.Get("skill_r_hull_d2")..BAD..translate.Get("skill_r_hull_d3"),
																-2,			-2,					{SKILL_STABLEHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BARA_CURSED, translate.Get("skill_baracurse"), GOOD..translate.Get("skill_baracurse_d1")..BAD..translate.Get("skill_baracurse_d2"),
																-2,			-0.5,					{SKILL_REINFORCEDHULL,SKILL_BLOODHACK}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BLOODHACK, translate.Get("skill_bloodhack"), GOOD..translate.Get("skill_bloodhack_d1")..BAD..translate.Get("skill_bloodhack_d2"),
																-2,			0,					{SKILL_REINFORCEDHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STABLEHULL, translate.Get("skill_s_hull"), GOOD..translate.Get("skill_s_hull_d1")..BAD..translate.Get("skill_r_hull_d3"),
																0,			-3,					{SKILL_U_DRONE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDBLADES, translate.Get("skill_r_blade"), GOOD..translate.Get("skill_r_blade_d1")..BAD..translate.Get("skill_r_blade_d2"),
																0,			-5,					{SKILL_MECHANIC}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_MECHANIC, translate.Get("skill_mech"), GOOD.."-15%"..translate.Get("s_cost")..BAD.."-15%"..translate.Get("sale"),
																0,			-6,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_AVIATOR, translate.Get("skill_avi"), GOOD..translate.Get("skill_avi_d1")..BAD..translate.Get("skill_avi_d2"),
																-4,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_BLASTTURRET, translate.Get("skill_u_blast"), GOOD..translate.Get("skill_u_blast_d1"),
																-8,			-4,					{SKILL_TURRETLOCK, SKILL_TWINVOLLEY, SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TURRETLOCK, translate.Get("skill_blockturret"), translate.Get("skill_blockturret_d1")..BAD..translate.Get("skill_blockturret_d2"),
																-6,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TWINVOLLEY, translate.Get("skill_t_vol"), GOOD..translate.Get("skill_t_vol_d1")..BAD..translate.Get("skill_t_vol_d2")..BAD..translate.Get("skill_t_vol_d3"),
																-10,		-5,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TURRETOVERLOAD, translate.Get("skill_t_over"), GOOD..translate.Get("skill_t_over_d1")..BAD..translate.Get("skill_t_over_d2"),
																-8,			-2,					{SKILL_INSTRUMENTS}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_DRONE, translate.Get("skill_u_pulse_drone"), GOOD..translate.Get("skill_u_pulse_d1"),
																2,			-3,					{SKILL_HAULMODULE, SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_NANITECLOUD, translate.Get("skill_nanite_r"), GOOD.."+12%"..translate.Get("repair"),
																3,			1,					{SKILL_HAMMERDISCIPLINE,SKILL_JEW}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkillModifier(SKILL_NANITECLOUD, SKILLMOD_REPAIRRATE_MUL, 0.12)
SKILL_JEW = 237
GM:AddSkill(SKILL_JEW, translate.Get("skill_jew"), GOOD..translate.Get("skill_jew_d1")..GOOD..translate.Get("skill_jew_d2")..BAD..translate.Get("skill_jew_d3"),
																3,			2,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
																
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_ARSENAL_DISCOUNT, -0.10)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_SCRAPDISCOUNT, -0.10)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_RES_AMMO_MUL, 0.15)
GM:AddSkillModifier(SKILL_SAMODOS, SKILLMOD_SCRAPDISCOUNT, -0.25)
GM:AddSkill(SKILL_GENIUS, translate.Get("skill_genius"), GOOD..translate.Get("skill_genius_d1")..BAD..translate.Get("skill_genius_d2"),
																3,			4,					{SKILL_JEW}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_FIELDAMP, translate.Get("skill_field_amp"), GOOD..translate.Get("skill_field_amp_d1")..BAD..translate.Get("skill_field_amp_d2"),
																6,			4,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TECHNICIAN, translate.Get("skill_field_tech"), GOOD..translate.Get("skill_field_tech_d1")..GOOD..translate.Get("skill_field_tech_d2"),
																4,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROLLERMINE, translate.Get("skill_u_rmine"), GOOD..translate.Get("skill_u_rmine_d1"),
																3,			-5,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAULMODULE, translate.Get("skill_u_hdrone"), GOOD..translate.Get("skill_u_hdrone_d1"),
																2,			-1,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_SAMODOS, translate.Get("skill_samodos"), GOOD..translate.Get("skill_samodos_d1")..BAD..translate.Get("skill_samodos_d2"),
																2,			3,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_LIGHTCONSTRUCT, translate.Get("skill_light_c"), GOOD..translate.Get("skill_light_c_d1")..BAD..translate.Get("skill_light_c_d2"),
																8,			-1,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOCKPILE, translate.Get("skill_stock2"), GOOD..translate.Get("skill_stock2_d1")..BAD..translate.Get("skill_stock2_d2"),
																8,			-3,					{SKILL_FREEAMMO}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_FREEAMMO, translate.Get("skill_f_ammo"), GOOD..translate.Get("skill_f_ammo_d1"),
																9,			-4,					{SKILL_STOCKPILE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_ACUITY, translate.Get("skill_vision_ammo"), GOOD..translate.Get("skill_vision_ammo_d1"),
																6,			-3,					{SKILL_INSIGHT, SKILL_STOCKPILE, SKILL_U_CRAFTINGPACK, SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_VISION, translate.Get("skill_vision_r"), GOOD..translate.Get("skill_vision_r_d1"),
																6,			-6,					{SKILL_NONE, SKILL_ACUITY}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROCKETTURRET, translate.Get("skill_u_rturret"), GOOD..translate.Get("skill_u_rturret_d1"),
																-8,			-0,					{SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSIGHT, translate.Get("skill_vision_ar"), BAD.."+2%"..translate.Get("sale")..GOOD..translate.Get("skill_vision_ar_d1"),
																6,			-0,					{SKILL_NANITECLOUD, SKILL_U_ZAPPER_ARC, SKILL_LIGHTCONSTRUCT, SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ZAPPER_ARC, translate.Get("skill_u_arc_z"), GOOD..translate.Get("skill_u_arc_z_d1"),
																6,			2,					{SKILL_FIELDAMP, SKILL_TECHNICIAN}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_D_LATEBUYER, translate.Get("skill_d_lbuyer"), GOOD.."+30"..translate.Get("worth")..GOOD.."-13%"..translate.Get("sale")..BAD..translate.Get("skill_d_lbuyer_d1"),
																8,			1,					{SKILL_HAMMERDOOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDOOR, translate.Get("skill_dd_3"), GOOD..translate.Get("skill_dd_3_d1")..BAD.."+10%"..translate.Get("hammerd"),
																8,			3,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_HAMMERDOOR, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.10)
GM:AddSkill(SKILL_CARRIER, translate.Get("skill_carrier"), GOOD..translate.Get("skill_carrier_d1")..BAD..translate.Get("skill_carrier_d2")..BAD..translate.Get("skill_carrier_d3"),
																9,			2,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_CRAFTINGPACK, translate.Get("skill_u_craftpack"), GOOD..translate.Get("skill_u_craftpack_d1"),
																4,			-1,					{}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TAUT, translate.Get("skill_taut"), GOOD.. translate.Get("skill_taut_d1")..BAD.. translate.Get("skill_taut_d2"),
																-5,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_D_NOODLEARMS, translate.Get("skill_noodle"), GOOD.."+10"..translate.Get("worth")..GOOD..translate.Get("skill_noodle_d1")..GOOD.."+35%"..translate.Get("repair")..BAD..translate.Get("skill_noodle_d2"),
																-7,			2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSTRUMENTS, translate.Get("skill_instruments"), GOOD..translate.Get("skill_instruments_d1"),
																-10,		-3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOWAGE, 	translate.Get("skill_stowage"), GOOD..translate.Get("skill_stowage_d1")..BAD..translate.Get("skill_stowage_d2"),
																4,			-3,					{SKILL_NANITES}, TREE_BUILDINGTREE)
SKILL_NANITES = 241
GM:AddSkill(SKILL_NANITES, 	translate.Get("skill_nanite_r"), GOOD..translate.Get("skill_nanite_buff")..BAD.."-10%"..translate.Get("repair"),
																4,			-4,					{SKILL_STOWAGE,SKILL_THE_CADER }, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_THE_CADER, 	translate.Get("skill_cader_r"), BAD..translate.Get("skill_cader_buff")..GOOD.."+50%"..translate.Get("repair"),
																4,			-4.5,					{SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_NANITES, SKILLMOD_REPAIRRATE_MUL, -0.10)
GM:AddSkillModifier(SKILL_THE_CADER, SKILLMOD_REPAIRRATE_MUL, 0.50)
GM:AddSkill(SKILL_FOLGA, translate.Get("skill_foil"), GOOD..translate.Get("skill_foil_d1"),
																4,			-5.5,					{SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BLESSEDROD, translate.Get("skill_brod"), GOOD..translate.Get("skill_brod_d1")..GOOD.."+15%"..translate.Get("m_curse")..BAD.."+6%"..translate.Get("meleedamagetaken"),
																4,			-7,					{SKILL_FOLGA}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.06)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_CURSEM, 0.15)
GM:AddSkill(SKILL_GIGACHAD, translate.Get("skill_gigachad"), GOOD..translate.Get("skill_gigachad_d1"),
																4,			-8,					{SKILL_BLESSEDROD}, TREE_BUILDINGTREE)


-- Gunnery Tree
GM:AddSkill(SKILL_FREESKILL, translate.Get("skill_freeskill"), GOOD.."+3"..translate.Get("spoint"),
																-9,			10,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 8
GM:AddSkillModifier(SKILL_FREESKILL, SKILLMOD_SPOINT, 4)
GM:AddSkill(SKILL_FREESKILL1, translate.Get("skill_freeskill"), GOOD.."+5"..translate.Get("spoint"),
																-9,			9,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 24
GM:AddSkillModifier(SKILL_FREESKILL1, SKILLMOD_SPOINT, 6)
GM:AddSkill(SKILL_FREESKILL2, translate.Get("skill_freeskill"), GOOD.."+8"..translate.Get("spoint"),
																-9,			8,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 80
GM:AddSkillModifier(SKILL_FREESKILL2, SKILLMOD_SPOINT, 8)
GM:AddSkill(SKILL_SKILLFORGODS, "SECRET I", GOOD.."You find this!Reward is free 3 skill points!",
																-70,			65,					{SKILL_NONE}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_SKILLFORGODS, SKILLMOD_SPOINT, 4)
GM:AddSkillModifier(SKILL_SECRET, SKILLMOD_SPOINT, 7)
GM:AddSkillModifier(SKILL_SECRET2, SKILLMOD_SPOINT, 4)

local d = GM:AddSkill(SKILL_AMULET_1, translate.Get("skill_amulet_1"), GOOD.. translate.Get("skill_amulet_1_d1"),
																-20,			-9,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 3												
GM:AddSkillModifier(SKILL_AMULET_1, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_1, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_2, translate.Get("skill_amulet_2"), GOOD.. translate.Get("skill_amulet_2_d1"),
																-20,			-8,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 4													
GM:AddSkillModifier(SKILL_AMULET_2, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_2, SKILLMOD_PIECE_OF_AMULET, -4)
local d = GM:AddSkill(SKILL_AMULET_3, translate.Get("skill_amulet_3"), BAD.. translate.Get("skill_amulet_3_d1"),
																-20,			-10,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = -3													
GM:AddSkillModifier(SKILL_AMULET_3, SKILLMOD_SPOINT, -3)
GM:AddSkillModifier(SKILL_AMULET_3, SKILLMOD_PIECE_OF_AMULET, 3)
local d = GM:AddSkill(SKILL_AMULET_4, translate.Get("skill_amulet_4"), GOOD.. translate.Get("skill_amulet_4_d1"),
																-20,			-12,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 3													
GM:AddSkillModifier(SKILL_AMULET_4, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_4, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_5, translate.Get("skill_amulet_5"), GOOD.. translate.Get("skill_amulet_5_d1"),
																-20,			-13,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true			
d.AmuletCost = 2												
GM:AddSkillModifier(SKILL_AMULET_5, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_5, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_6, translate.Get("skill_amulet_6"), GOOD.. translate.Get("skill_amulet_6_d1"),
																-20,			-14,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 1											
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_LUCK, 2.5)
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_PIECE_OF_AMULET, -1)
local d = GM:AddSkill(SKILL_AMULET_7, translate.Get("skill_amulet_7"), GOOD.. translate.Get("skill_amulet_7_d1"),
																-23,			-7,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 3											
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_MELEE_DAMAGE_MUL, 0.25)
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_8, translate.Get("skill_amulet_8"), GOOD.. translate.Get("skill_amulet_8_d1"),
																-23,			-8,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2											
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_HEALTH, 20)
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_9, translate.Get("skill_amulet_9"), GOOD.. translate.Get("skill_amulet_9_d1"),
																-23,			-9,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2											
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_BLOODARMOR, 35)
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_10, translate.Get("skill_amulet_10"), BAD.. translate.Get("skill_amulet_10_d1"),
																-23,			-10,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = -5											
GM:AddSkillModifier(SKILL_AMULET_10, SKILLMOD_SPOINT, -7)
GM:AddSkillModifier(SKILL_AMULET_10, SKILLMOD_PIECE_OF_AMULET, 5)
local d = GM:AddSkill(SKILL_AMULET_11, translate.Get("skill_amulet_11"), GOOD.. translate.Get("skill_amulet_11_d1"),
																-23,			-11,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 5											
GM:AddSkillModifier(SKILL_AMULET_11, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_11, SKILLMOD_PIECE_OF_AMULET, -5)
local d = GM:AddSkill(SKILL_AMULET_12, translate.Get("skill_amulet_12"), GOOD..translate.Get("skill_amulet_12_d2") ..BAD..translate.Get("skill_amulet_12_d1"),
																-23,			-12,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = -5		
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.5)
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_REPAIRRATE_MUL, 0.33)									
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_SPOINT, 5)
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_PIECE_OF_AMULET, 5)
local d = GM:AddSkill(SKILL_AMULET_13, translate.Get("skill_amulet_13"),  GOOD..translate.Get("skill_amulet_13_d1"),
																-23,			-13,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.33)									
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_PIECE_OF_AMULET, -2)
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_14, translate.Get("skill_amulet_14"),  GOOD..translate.Get("skill_amulet_14_d1"),
																-23,			-14,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 5								
GM:AddSkillModifier(SKILL_AMULET_14, SKILLMOD_PIECE_OF_AMULET, -5)
GM:AddSkillModifier(SKILL_AMULET_14, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_15, translate.Get("skill_amulet_15"),  GOOD..translate.Get("skill_amulet_15_d1"),
																-23,			-15,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2				
GM:AddSkillModifier(SKILL_AMULET_15, SKILLMOD_PIECE_OF_AMULET, -2)
GM:AddSkillModifier(SKILL_AMULET_15, SKILLMOD_SPOINT, 1)



GM:AddSkill(SKILL_QUE_PRO, translate.Get("skill_quepro"), GOOD.."-10000%"..translate.Get("xpmul"),
																-40,			-10,					{SKILL_NONE}, TREE_GUNTREE)
.QuePro = true														


GM:AddSkill(SKILL_UNSIGIL, translate.Get("skill_uncorrupt"), GOOD.."+24%"..translate.Get("r_speed")..GOOD.."+6%"..translate.Get("b_damage")..BAD.."-80%"..translate.Get("meleedamage"),
																0,			2,					{SKILL_LEVELHEADED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_UNSIGIL, SKILLMOD_DAMAGE, 0.06)
SKILL_PHOENIX = 260
GM:AddSkill(SKILL_PHOENIX, translate.Get("skill_phoenix"), GOOD..translate.Get("skill_phoenix_d1")..BAD.."-30%"..translate.Get("meleedamage")..BAD.."-30%"..translate.Get("b_damage"),
																0,			6,					{SKILL_GUNSLINGER}, TREE_GUNTREE)
local d = GM:AddSkill(SKILL_SECRET_VI, "Secret VI", GOOD.."+5 Skill Points",
																-2,			3,					{SKILL_NONE}, TREE_GUNTREE)
d.Hidden = true	
d.Hidden1 = true	
local rand = math.random(2,50)
local d = GM:AddSkill(SKILL_SECRET_VIII, "Secret VIII", GOOD.."+10 Skill Points\nYou can!",
																-2,			rand,					{SKILL_NONE}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_SECRET_VIII, SKILLMOD_SPOINT, 11)
d.Hidden = true	
d.Hidden1 = true
local d = GM:AddSkill(SKILL_SECRET_VII, "ᅠ ᅠ ᅠ", GOOD.."+5 Skill Points\nSecret VII",
				                                                            	25,			20.1,					{SKILL_NONE}, TREE_DONATETREE)
d.Hidden = true	
d.Hidden1 = true	

local d = GM:AddSkill(SKILL_GOD_HEART, translate.Get("skill_godheart"), GOOD..translate.Get("skill_godheart_d1"),
				                                                            	-14,			16,					{}, TREE_DONATETREE)
d.RemortReq = 64
d.LevelReq = 99
d.AmuletCost = -4		
local d = GM:AddSkill(SKILL_GODHEART, translate.Get("skill_godheart"), GOOD..translate.Get("skill_godheart2_d1"),
				                                                            	-14,			99,					{}, TREE_DONATETREE)
d.RemortReq = 256
d.AmuletCost = 4					
GM:AddSkillModifier(SKILL_GODHEART, SKILLMOD_SPOINT, -4)
GM:AddSkillModifier(SKILL_GODHEART, SKILLMOD_CURSEM, -99)
d.AlwaysActive = true
d.Hidden = true	
local d = GM:AddSkill(SKILL_VIP, translate.Get("skill_vip"), GOOD..translate.Get("skill_vip_d1"),
				                                                            	-14,			14,					{}, TREE_DONATETREE)								
GM:AddSkillModifier(SKILL_VIP, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_VIP, SKILLMOD_XP, 0.25)

d.AlwaysActive = true
d.Amulet = true	
d.Vip1 = true
GM:AddSkillModifier(SKILL_SECRET_VI, SKILLMOD_SPOINT, 5)
GM:AddSkillModifier(SKILL_SECRET_VII, SKILLMOD_SPOINT, 5)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE1, translate.Get("skill_t_d").."I", GOOD.."+2%"..translate.Get("r_speed")..GOOD.."+1%"..translate.Get("b_damage")..GOOD.."+2%"..translate.Get("w_draw")..BAD.."-9%"..translate.Get("meleedamage"),
																-5,			6,					{SKILL_TRIGGER_DISCIPLINE2, SKILL_NONE}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE2, translate.Get("skill_t_d").."II", GOOD.."+3%"..translate.Get("r_speed")..GOOD.."+2%"..translate.Get("b_damage")..GOOD.."+3%"..translate.Get("w_draw")..BAD.."-13%"..translate.Get("meleedamage"),
																-4,			3,					{SKILL_TRIGGER_DISCIPLINE3, SKILL_D_PALSY, SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE3, translate.Get("skill_t_d").."III", GOOD.."+4%"..translate.Get("r_speed")..GOOD.."+3%"..translate.Get("b_damage")..GOOD.."+4%"..translate.Get("w_draw")..BAD.."-18%"..translate.Get("meleedamage"),
																-3,			0,					{SKILL_QUICKRELOAD, SKILL_QUICKDRAW, SKILL_WORTHINESS1, SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_DAMAGE, 0.01)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_DAMAGE, 0.02)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_DAMAGE, 0.03)
GM:AddSkill(SKILL_D_PALSY, translate.Get("skill_d_palsy"), GOOD.."+20"..translate.Get("worth")..GOOD.."-15%".. translate.Get("res_delay")..BAD..translate.Get("skill_d_palsy_d2"),
																0,			4,					{SKILL_LEVELHEADED,SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkill(SKILL_LEVELHEADED, translate.Get("skill_l_headed"), GOOD..translate.Get("skill_l_headed_d1"),
																-2,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_QUICKDRAW, translate.Get("skill_quick_d"), GOOD.."+65%"..translate.Get("w_draw")..BAD.."-15%"..translate.Get("r_speed"),
																0,			1,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUS, translate.Get("skill_focus").."I", GOOD.."+11%"..translate.Get("w_ac")..GOOD.."+1%"..translate.Get("b_damage")..BAD.."-3%"..translate.Get("r_speed"),
																5,			6,					{SKILL_NONE, SKILL_FOCUSII}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSII, translate.Get("skill_focus").."II", GOOD.."+9%"..translate.Get("w_ac")..GOOD.."+3%"..translate.Get("b_damage")..BAD.."-7%"..translate.Get("r_speed"),
																4,			3,					{SKILL_FOCUSIII, SKILL_SCAVENGER, SKILL_D_PALSY, SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSIII, translate.Get("skill_focus").."III", GOOD.."+12%"..translate.Get("w_ac")..GOOD.."+3"..translate.Get("b_damage")..BAD.."-6%"..translate.Get("r_speed"),
																3,			0,					{SKILL_EGOCENTRIC, SKILL_WOOISM, SKILL_ORPHICFOCUS, SKILL_SCOURER}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_DAMAGE, 0.01)
GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_DAMAGE, 0.03)
GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_DAMAGE, 0.03)
SKILL_ARSVOID = 238
GM:AddSkill(SKILL_ARSVOID, translate.Get("skill_ars_void"), GOOD..translate.Get("skill_ars_void_d1")..GOOD.."+5%"..translate.Get("b_damage")..BAD.."+12%"..translate.Get("sale"),
																6,			-4,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_ARSENAL_DISCOUNT, 0.12)
SKILL_GUNSLINGER = 252
GM:AddSkill(SKILL_GUNSLINGER, translate.Get("skill_gunslinger"), GOOD.."+10%"..translate.Get("w_ac")..GOOD.."+15%"..translate.Get("b_damage")..BAD.."-30%"..translate.Get("meleedamage")..BAD.."-50%"..translate.Get("m_range"),
																0,			5,					{SKILL_D_PALSY, SKILL_PHOENIX}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_DAMAGE, 0.10)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_AIMSPREAD_MUL, -0.15)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_DAMAGE_MUL, -0.30)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_RANGE_MUL, -0.50)
GM:AddSkill(SKILL_BOUNTYKILLER, translate.Get("skill_bounty"), GOOD..translate.Get("skill_bounty_d1")..BAD.."-15%"..translate.Get("b_damage"),
																1,			6,					{SKILL_GUNSLINGER, SKILL_VAMPIRISM}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BOUNTYKILLER, SKILLMOD_DAMAGE, -0.15)
GM:AddSkill(SKILL_VAMPIRISM, translate.Get("skill_vampirism"), GOOD..translate.Get("skill_vampirism_d1")..BAD.."-25%"..translate.Get("b_damage"),
																1,		    7,					{SKILL_BOUNTYKILLER, SKILL_LOX}, TREE_GUNTREE)
GM:AddSkill(SKILL_LOX, translate.Get("skill_lox"), GOOD..translate.Get("skill_lox_d1")..BAD..translate.Get("skill_lox_d2"),
																2,		    6,					{SKILL_VAMPIRISM}, TREE_GUNTREE)
.Hidden = true
GM:AddSkillModifier(SKILL_LOX, SKILLMOD_ADD_STATUS, 1)
GM:AddSkillModifier(SKILL_ABSOLUTE, SKILLMOD_ADD_STATUS, -0.05)
GM:AddSkillModifier(SKILL_VAMPIRISM, SKILLMOD_DAMAGE, -0.25)
GM:AddSkill(SKILL_D_CURSEDTRUE, translate.Get("skill_d_truecurse"), BAD.."-100%"..translate.Get("m_curse")..GOOD.."+35"..translate.Get("health")..GOOD.."+40"..translate.Get("speed")..GOOD.."+15%"..translate.Get("r_speed"),
																2,		    8,					{SKILL_VAMPIRISM}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_CURSEM, -1)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_SPEED, 40)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_HEALTH, 35)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_RELOADSPEED_MUL, 0.15)




GM:AddSkill(SKILL_QUICKRELOAD, translate.Get("skill_q_r"), GOOD.."+10%"..translate.Get("r_speed")..BAD.."-25%"..translate.Get("w_draw"),
																-5,			1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_SLEIGHTOFHAND, translate.Get("skill_s_hand"), GOOD.."+10%"..translate.Get("r_speed")..BAD.."-5%"..translate.Get("w_ac"),
																-5,			-2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_BANDOLIER, translate.Get("skill_bandolier"), GOOD..translate.Get("skill_bandolier_d1"),
																-6,			-1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_U_CRYGASGREN, translate.Get("skill_u_cryogas"), GOOD..translate.Get("skill_u_cryogas_d1"),
																2,			-3,					{SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkill(SKILL_SOFTDET, translate.Get("skill_sdeton"), GOOD.."-40%"..translate.Get("exp_damage_t")..BAD.."-10%"..translate.Get("exp_damage"),
																0,			-5,					{SKILL_ELEMENTAL_BUFF}, TREE_GUNTREE)
GM:AddSkill(SKILL_ELEMENTAL_BUFF, translate.Get("skill_ell_buff"), BAD.."+20%"..translate.Get("exp_damage_t")..GOOD..translate.Get("skill_ell_buff_d1"),
																0,			-6,					{SKILL_INDUCTOR_ISSUE,SKILL_ATTACHMENT_CURSE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_INDUCTOR_ISSUE, translate.Get("skill_ind_issue"), BAD..translate.Get("skill_ind_issue_d1")..GOOD..translate.Get("skill_ind_issue_d2"),
																0,			-7,					{SKILL_DOUBLE_ISSUE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_ISSUE, translate.Get("skill_d_issue"), GOOD..translate.Get("skill_d_issue_d1")..BAD..translate.Get("skill_d_issue_d2"),
																1,			-8,					{SKILL_DOUBLE_EXPLOSIVE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_EXPLOSIVE, translate.Get("skill_d_exp"), GOOD..translate.Get("skill_d_exp_d1")..BAD..translate.Get("skill_d_exp_d2"),
																1,			-9,					{SKILL_DOUBLE_EXPLOSIVE_ALT, SKILL_CURSED_ALT}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_EXPLOSIVE_ALT, translate.Get("skill_d_exp2"), GOOD..translate.Get("skill_d_exp2_d1")..BAD..translate.Get("skill_d_exp2_d2"),
																0,			-10,					{SKILL_CRYO_LASER}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_CRYO_LASER, translate.Get("skill_cryo_laser"), GOOD..translate.Get("skill_cryo_laser_d1")..BAD..translate.Get("skill_cryo_laser_d2"),
																0,			-11,					{}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_CURSED_ALT, translate.Get("skill_at_curse2"), GOOD..translate.Get("skill_at_curse2_d1")..BAD..translate.Get("skill_at_curse2_d2"),
																2,			-10.5,					{}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_ATTACHMENT_CURSE, translate.Get("skill_at_curse"), BAD..translate.Get("skill_at_curse_d1")..GOOD..translate.Get("skill_at_curse_d2"),
																-2.5,			-6,					{SKILL_HEHE, SKILL_CONISSUE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_CONISSUE, translate.Get("skill_conissue"), GOOD..translate.Get("skill_conissue_d1")..BAD..translate.Get("skill_conissue_d2"),
																-2.5,			-7,					{SKILL_N_FRIEND}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_N_FRIEND, translate.Get("skill_nature_fs"), GOOD..translate.Get("skill_nature_fs_d1")..BAD..translate.Get("skill_nature_fs_d2"),
																-1.5,			-8,					{SKILL_100_PERC}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_100_PERC, translate.Get("skill_100_perc"), GOOD..translate.Get("skill_100_perc_d1")..BAD..translate.Get("skill_100_perc_d2"),
																-1.5,			-9,					{}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HEHE, translate.Get("skill_just_buff"), GOOD..translate.Get("skill_just_buff_d1"),
																-2.5,			-5,					{SKILL_HAHA}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HAHA, translate.Get("skill_haha"), GOOD..translate.Get("skill_haha_d1"),
																-3.5,			-4,					{SKILL_HIHI}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HIHI, translate.Get("skill_hihi"), GOOD..translate.Get("skill_hihi_d1"),
																-2,			-4.2,					{SKILL_NONE}, TREE_BRANCH_ELEMENTS)



GM:AddSkill(SKILL_ORPHICFOCUS, translate.Get("skill_orfocus"), GOOD..translate.Get("skill_orfocus_d1")..GOOD.."+2%"..translate.Get("w_ac")..BAD..translate.Get("skill_orfocus_d2")..BAD.."-6%"..translate.Get("r_speed"),
																5,			-1,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkill(SKILL_DELIBRATION, translate.Get("skill_deli"), GOOD.."+3%"..translate.Get("w_ac")..GOOD.."+1%"..translate.Get("b_damage"),
																6,			-3,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_DELIBRATION, SKILLMOD_DAMAGE, 0.01)
GM:AddSkill(SKILL_EGOCENTRIC, translate.Get("skill_ego"), GOOD.."-15%"..translate.Get("self_d")..BAD.."-5"..translate.Get("health"),
																0,			-1,					{SKILL_BLASTPROOF}, TREE_GUNTREE)
GM:AddSkill(SKILL_BLASTPROOF, translate.Get("skill_bproof"), GOOD.."-40%"..translate.Get("self_d")..BAD.."-10%"..translate.Get("r_speed")..BAD.."-12%"..translate.Get("w_draw")..translate.Get("hagilore"),
																0,			-3,					{SKILL_SOFTDET, SKILL_CANNONBALL, SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_WOOISM, translate.Get("skill_ziga"), GOOD..translate.Get("skill_ziga_d1")..BAD..translate.Get("skill_ziga_d2"),
																5,			1,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCAVENGER, translate.Get("skill_eyes"), GOOD.. translate.Get("skill_eyes_d1"),
																7,			4,					{SKILL_BUG_GET}, TREE_GUNTREE)
GM:AddSkill(SKILL_BUG_GET, translate.Get("skill_shooter_fast"), GOOD.. translate.Get("skill_shooter_fast_d1")..BAD.."-15%"..translate.Get("b_damage"),
																7,			3,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BUG_GET, SKILLMOD_FIRE_DELAY, -0.15)
GM:AddSkillModifier(SKILL_BUG_GET, SKILLMOD_DAMAGE, -0.15)
GM:AddSkill(SKILL_PITCHER, translate.Get("skill_pitcher"), GOOD..translate.Get("skill_pitcher_d1"),
																6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_PITCHER2, translate.Get("skill_pitcher2"), GOOD..translate.Get("skill_pitcher2_d1").."-15%"..translate.Get("b_damage"),
																7,			1,					{SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_EQUIPPED, translate.Get("skill_alacraty"), GOOD.. translate.Get("skill_alacraty_d1"),
																-6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_MOBILIZED, translate.Get("skill_mobile"), GOOD.. translate.Get("skill_mobile_d1")..BAD..translate.Get("skill_mobile_d2"),
																-7,			1,					{SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_MOBILIZED, SKILLMOD_LUCK, -1)
GM:AddSkill(SKILL_WORTHINESS1, translate.Get("worthness"), GOOD.."+10"..translate.Get("worth")..BAD.."-3"..translate.Get("start_points"),
																-4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CANNONBALL, translate.Get("skill_cannonball"), translate.Get("skill_cannonball_d1")..GOOD..translate.Get("skill_cannonball_d2"),
																-2,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCOURER, translate.Get("skill_scourer"), GOOD..translate.Get("skill_scourer_d1")..BAD..translate.Get("skill_scourer_d2"),
																4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CONEFFECT, translate.Get("skill_concetrate"), GOOD..translate.Get("skill_concetrate_d1")..BAD.."-20%"..translate.Get("exp_r"),
																2,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_LAST_AMMO, translate.Get("skill_last_ammo"), GOOD..translate.Get("skill_last_ammo_d1")..BAD..translate.Get("skill_last_ammo_d2"),
																2,			-6,					{SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRUEWOOISM, translate.Get("skill_wooism"), GOOD..translate.Get("skill_wooism_d1")..BAD..translate.Get("skill_wooism_d2"),
																7,			0,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_DEADINSIDE, translate.Get("skill_dinside"), BAD..translate.Get("skill_dinside_d1")..GOOD..translate.Get("skill_dinside_d2"),
																7,			-2,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_NFINGERS, translate.Get("skill_nfingers"), GOOD..translate.Get("skill_nfingers_d1")..BAD.."-10%"..translate.Get("res_ammo"),
																8,			-4,					{SKILL_DEADINSIDE}, TREE_GUNTREE)
GM:AddSkill(SKILL_SFINGERS, translate.Get("skill_sfingers"), GOOD..translate.Get("skill_sfingers_d1")..BAD.."-25%"..translate.Get("res_ammo"),
																8,			-5,					{SKILL_NFINGERS}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_NFINGERS, SKILLMOD_RES_AMMO_MUL, -0.10)
GM:AddSkillModifier(SKILL_SFINGERS, SKILLMOD_RES_AMMO_MUL, -0.25)
GM:AddSkill(SKILL_D_FINGERS, translate.Get("skill_dfingers"), BAD..translate.Get("skill_dfingers_d1"),
																9,			-6,					{SKILL_SFINGERS}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_D_FINGERS, SKILLMOD_DAMAGE, 0.45)

-- Melee Tree
GM:AddSkill(SKILL_WORTHINESS2, translate.Get("worthness").."II", GOOD.."+10"..translate.Get("worth")..BAD.."-3"..translate.Get("start_points"),
																4,			0,					{}, TREE_MELEETREE)

GM:AddSkill(SKILL_AVOID_BLOCK, translate.Get("skill_xpdamage"), GOOD..translate.Get("skill_xpdamage_d1")..BAD.."-25%"..translate.Get("b_mul"),
																5,			1,					{SKILL_WORTHINESS2}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_AVOID_BLOCK, SKILLMOD_BLOCKMULTIPLIER, 0.25)
GM:AddSkill(SKILL_BATTLER1, translate.Get("skill_battler").."I", GOOD.."+3%"..translate.Get("meleedamage")..BAD.."-2%"..translate.Get("r_speed"),
																-6,			-6,					{SKILL_BATTLER2, SKILL_NONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER2, translate.Get("skill_battler").."II", GOOD.."+6%"..translate.Get("meleedamage")..BAD.."-4%"..translate.Get("r_speed"),
																-6,			-4,					{SKILL_BATTLER3, SKILL_LIGHTWEIGHT}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER3, translate.Get("skill_battler").."III", GOOD.."+8%"..translate.Get("meleedamage")..BAD.."-9%"..translate.Get("r_speed"),
																-4,			-2,					{SKILL_BATTLER4, SKILL_LANKY, SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER4, translate.Get("skill_battler").."IV", GOOD.."+9%"..translate.Get("meleedamage")..BAD.."-13%"..translate.Get("r_speed"),
																-2,			0,					{SKILL_BATTLER5, SKILL_MASTERCHEF, SKILL_D_CLUMSY}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER5, translate.Get("skill_battler").."V", GOOD.."+13%"..translate.Get("meleedamage")..BAD.."-16%"..translate.Get("r_speed"),
																0,			2,					{SKILL_GLASSWEAPONS, SKILL_BLOODLUST}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER6, translate.Get("skill_battler").."VI", GOOD.."+16%"..translate.Get("meleedamage")..BAD.."-33%"..translate.Get("r_speed"),
																0,			0,					{SKILL_BATTLER5}, TREE_MELEETREE)
GM:AddSkill(SKILL_LASTSTAND, translate.Get("skill_laststand"), GOOD..translate.Get("skill_laststand_d1")..BAD..translate.Get("skill_laststand_d2"),
																0,			6,					{SKILL_ABUSE}, TREE_MELEETREE)
.RemortReq = 4
GM:AddSkill(SKILL_ABUSE, translate.Get("skill_lastabuse"), GOOD.."+10%"..translate.Get("meleedamage")..GOOD..translate.Get("skill_lastabuse_d1")..BAD..translate.Get("skill_lastabuse_d2"),
																0,			7,					{SKILL_CURSECURE}, TREE_MELEETREE)
GM:AddSkill(SKILL_CURSECURE, translate.Get("skill_cursecure"), GOOD..translate.Get("skill_cursecure_d1")..GOOD.."+20%"..translate.Get("m_curse")..BAD..translate.Get("skill_cursecure_d2"),
																0,			8,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_SOULNET, translate.Get("skill_souleater"), GOOD..translate.Get("skill_souleater_d1")..BAD.."-10%"..translate.Get("meleedamage"),
																0,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
.RemortReq = 4
GM:AddSkill(SKILL_GLASSWEAPONS, translate.Get("skill_glassweapon"), GOOD..translate.Get("skill_glassweapon_d1")..BAD..translate.Get("skill_glassweapon_d2"),
																2,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_GLASSMAN, translate.Get("skill_glassman"), GOOD.."+230%"..translate.Get("meleedamage")..BAD.."+200%"..translate.Get("meleedamagetaken"),
																3,			5,					{SKILL_GLASSWEAPONS}, TREE_MELEETREE)
GM:AddSkill(SKILL_D_CLUMSY,  translate.Get("skill_d_clumsy"), GOOD.."+20"..translate.Get("worth")..GOOD.."+10"..translate.Get("start_points")..BAD..translate.Get("skill_d_clumsy_d1"),
																-2,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_CHEAPKNUCKLE, translate.Get("skill_cheapt"), GOOD..translate.Get("skill_cheapt_d1")..BAD.."-10%"..translate.Get("m_range"),
																4,			-2,					{SKILL_HEAVYSTRIKES, SKILL_WORTHINESS2}, TREE_MELEETREE)
GM:AddSkill(SKILL_CRITICALKNUCKLE, translate.Get("skill_critknuckle"), GOOD..translate.Get("skill_critknuckle_d1")..BAD.."-25%"..translate.Get("fist_damage")..BAD.."+25% "..translate.Get("fist_delay"),
																6,			-2,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_KNUCKLEMASTER, translate.Get("skill_knuckmaster"), GOOD.."+75%"..translate.Get("fist_damage")..GOOD..translate.Get("skill_knuckmaster_d1")..BAD.."+35%"..translate.Get("fist_delay"),
																6,			-6,					{SKILL_NONE, SKILL_COMBOKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_COMBOKNUCKLE, translate.Get("skill_combohits"), GOOD..translate.Get("skill_combohits_d1")..BAD..translate.Get("skill_combohits_d2"),
																6,			-4,					{SKILL_CHEAPKNUCKLE, SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_HEAVYSTRIKES, translate.Get("skill_hknucke"), GOOD.."+90%"..translate.Get("melee_knock")..GOOD..translate.Get("skill_hknucke_d1")..BAD.."-50%"..translate.Get("meleedamage"),
																2,			0,					{SKILL_BATTLER5, SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkill(SKILL_JOUSTER, translate.Get("skill_jouster"), GOOD.."+15%"..translate.Get("meleedamage")..BAD.."-90%"..translate.Get("melee_knock")..BAD.."-50%"..translate.Get("b_damage"),
																2,			2,					{SKILL_BLOODLOST,SKILL_SOY}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_DAMAGE, -0.50)
GM:AddSkill(SKILL_SOY, translate.Get("skill_soy"), GOOD.."-50%"..translate.Get("m_delay")..BAD.."-50%"..translate.Get("meleedamage"),
																3,			3,					{SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_MELEE_DAMAGE_MUL, -0.50)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.50)
																
GM:AddSkill(SKILL_BLOODLOST, translate.Get("skill_bloodlust"), GOOD..translate.Get("skill_bloodlust_d1")..BAD.."-30"..translate.Get("health"),
																3,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_PARASITOID, translate.Get("skill_parasitoid"), GOOD..translate.Get("skill_parasitoid_d1")..BAD.."-45"..translate.Get("barmor"),
																4,			2,					{SKILL_BLOODLOST}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKY, translate.Get("skill_lanky").."I", GOOD.."+10%"..translate.Get("m_range")..BAD.."-5%"..translate.Get("meleedamage"),
																-4,			0,					{SKILL_LANKYII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYII, translate.Get("skill_lanky").."II", GOOD.."+10%"..translate.Get("m_range")..BAD.."-6%"..translate.Get("meleedamage"),
																-4,			2,					{SKILL_LANKYIII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYIII, translate.Get("skill_lanky").."III", GOOD.."+10%"..translate.Get("m_range")..BAD.."-7%"..translate.Get("meleedamage"),
																-4,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_MASTERCHEF, translate.Get("skill_mchef"), GOOD..translate.Get("skill_mchef_d1")..BAD.."-10%"..translate.Get("meleedamage"),
																0,			-3,					{SKILL_BATTLER4,SKILL_CURSE_OF_MISS}, TREE_MELEETREE)
GM:AddSkill(SKILL_CURSE_OF_MISS, translate.Get("skill_curse_of_bruh"), GOOD.."+35%"..translate.Get("meleedamage")..BAD..translate.Get("skill_curse_of_bruh_d1"),
																0,			-2,					{}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_CURSE_OF_MISS, SKILLMOD_MELEE_DAMAGE_MUL, 0.35)
GM:AddSkill(SKILL_LIGHTWEIGHT, translate.Get("skill_lweight"), GOOD..translate.Get("skill_lweight_d1")..BAD.."-20%"..translate.Get("meleedamage"),
																-6,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_BLOODLUST,  translate.Get("skill_phantomhealth"), translate.Get("skill_phantomhealth_d1")..GOOD..translate.Get("skill_phantomhealth_d2"),
																-2,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
GM:AddSkill(SKILL_HELPER,  translate.Get("skill_helper"), GOOD..translate.Get("skill_helper_d1")..BAD..translate.Get("skill_helper_d2"),
																-3,			5,					{SKILL_BLOODLUST}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRASH, translate.Get("skill_brash"), GOOD.."-16%"..translate.Get("m_delay")..BAD..translate.Get("skill_brash_d1"),
																6,			0,					{SKILL_TRUEBLOCK}, TREE_MELEETREE)
GM:AddSkill(SKILL_TRUEBLOCK, translate.Get("skill_trueblock"), BAD.."-15%"..translate.Get("meleedamage")..GOOD..translate.Get("skill_trueblock_d1"),
																7,			1,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_SECRET, "ᅠ ᅠ ᅠ", BAD.."Secret II,well I give 6 skill points for you",
																7,			1.05,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_FOUR_IN_ONE, "2 in 1", GOOD.."-9%"..translate.Get("m_delay")..BAD.."-7"..translate.Get("health"),
																-2,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_THREE_IN_ONE, "3 in 1", GOOD.."-16%"..translate.Get("m_delay")..BAD.."-10"..translate.Get("health"),
            													-3,			-3,					{SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
SKILL_LONGARM = 222					
GM:AddSkill(SKILL_LONGARM, translate.Get("skill_longarm"), GOOD.."-7%"..translate.Get("m_delay")..GOOD.."+2%"..translate.Get("m_range")..BAD.."-7%"..translate.Get("r_speed"),
																-3,			-4,					{SKILL_THREE_IN_ONE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_RANGE_MUL, 0.02)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.07)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_RELOADSPEED_MUL, -0.07)
SKILL_FISTING = 223				
GM:AddSkill(SKILL_FISTING, translate.Get("skill_fisting"), GOOD.."+25%"..translate.Get("fist_damage")..GOOD.."-15%"..translate.Get("fist_delay")..BAD.."-25%"..translate.Get("meleedamage")..BAD.."+15%"..translate.Get("m_delay"),
																8,			-2,					{SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_DAMAGE_MUL, 0.50)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_SWING_DELAY_MUL, -0.30)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_SWING_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_DAMAGE_MUL, -0.25)
GM:AddSkill(SKILL_GOODATTACK, translate.Get("skill_goodattack"), BAD.."-15%"..translate.Get("fist_damage")..GOOD..translate.Get("skill_goodattack_d1"),
																8,			-3.5,					{SKILL_FISTING}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_GOODATTACK, SKILLMOD_UNARMED_DAMAGE_MUL, -0.15)
SKILL_MELEEFAN = 224				
GM:AddSkill(SKILL_MELEEFAN, translate.Get("skill_truemelee"), BAD.."-350%"..translate.Get("fist_damage")..GOOD.."+45%"..translate.Get("meleedamage")..GOOD.."-15%"..translate.Get("m_delay")..BAD.."-50%"..translate.Get("b_damage"),
																9,			-3,					{SKILL_FISTING}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_UNARMED_DAMAGE_MUL, -3.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.15)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_DAMAGE_MUL, 0.45)
SKILL_OPM = 225				
GM:AddSkill(SKILL_OPM, translate.Get("skill_opm"), GOOD.."+350%"..translate.Get("fist_damage")..BAD.."-35%"..translate.Get("meleedamage")..BAD.."+150%"..translate.Get("fist_delay"),
																9,			-5,					{SKILL_MELEEFAN}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_DAMAGE_MUL, 3.50)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_SWING_DELAY_MUL, 3)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_MELEE_DAMAGE_MUL, -0.35)




SKILL_POINTI = 157
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_POINT_MULTIPLIER, 0.02)
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTI, translate.Get("skill_point").."I", GOOD.."+0.15"..translate.Get("luck")..GOOD.."+2%"..translate.Get("p_mul"),
																0,			0,					{SKILL_NONE}, TREE_POINTTREE)
SKILL_POINTII = 158
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_POINT_MULTIPLIER, 0.02)
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTII, translate.Get("skill_point").."II", GOOD.."+0.15"..translate.Get("luck")..GOOD.."+2%"..translate.Get("p_mul"),
																-0.5,			-1,					{SKILL_POINTI}, TREE_POINTTREE)
SKILL_POINTIII = 159
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_POINT_MULTIPLIER, 0.03)
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTIII, translate.Get("skill_point").."III", NEUTRAL.."+0.15"..translate.Get("luck")..GOOD.."+3%"..translate.Get("p_mul"),
																-1,			-2,					{SKILL_POINTII}, TREE_POINTTREE)
SKILL_POINTIIII = 160
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_POINT_MULTIPLIER, 0.04)
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_LUCK, 0.40)
GM:AddSkill(SKILL_POINTIIII, translate.Get("skill_point").."IV", NEUTRAL.."+0.40"..translate.Get("luck")..GOOD.."+4%"..translate.Get("p_mul") ..GOOD.. "+5"..translate.Get("start_points"),
																-2,			-3,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTD = 248
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_POINT_MULTIPLIER, -0.10)
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_LUCK, -0.9)
GM:AddSkill(SKILL_POINTD, translate.Get("skill_dtrouble"), BAD.."-0.9"..translate.Get("luck")..GOOD..translate.Get("skill_lastabuse_d1") ..BAD.. "-10%"..translate.Get("p_mul"),
																-3.5,			-3,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_POINTFUL = 219
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_POINT_MULTIPLIER, 0.1)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_XP, -0.25)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_WORTH, -25)
	GM:AddSkillModifier(SKILL_QUE_PRO, SKILLMOD_XP, -100)
GM:AddSkill(SKILL_POINTFUL, translate.Get("skill_pointful"), BAD.."-25%"..translate.Get("xpmul")..BAD.."-25"..translate.Get("worth")..GOOD.."+10%"..translate.Get("p_mul") ..GOOD.. "+10"..translate.Get("start_points"),
																-2,			0,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTMEGA = 242
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_XP, -0.05)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_WORTH, 25)
GM:AddSkill(SKILL_POINTMEGA,  translate.Get("skill_megapoint"), BAD.."-5%"..translate.Get("xpmul")..GOOD.."+25"..translate.Get("worth")..BAD.."-10%"..translate.Get("p_mul") ..GOOD.. "+50"..translate.Get("start_points"),
																-2,			1,					{SKILL_POINTFUL}, TREE_POINTTREE)
	SKILL_LUCK = 161
	GM:AddSkillModifier(SKILL_LUCK, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK, translate.Get("skill_luck"), GOOD.."+0.5"..translate.Get("luck"),
																-2,			-5,					{SKILL_POINTIIII}, TREE_POINTTREE)
SKILL_LUCK1 = 243
GM:AddSkillModifier(SKILL_LUCK1, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK1, translate.Get("skill_luck").."I", GOOD.."+0.5"..translate.Get("luck"),
									                    		-2,			-6,					{SKILL_LUCK}, TREE_POINTTREE)
SKILL_LUCK2 = 244
GM:AddSkillModifier(SKILL_LUCK2, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK2, translate.Get("skill_luck").."II", GOOD.."+0.5"..translate.Get("luck"),
									                    		-3,			-7,					{SKILL_LUCK1}, TREE_POINTTREE)
SKILL_LUCK3 = 245
GM:AddSkillModifier(SKILL_LUCK3, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK3, translate.Get("skill_luck").."III", GOOD.."+0.5"..translate.Get("luck"),
									                    		-3,			-8,					{SKILL_LUCK2}, TREE_POINTTREE)
SKILL_LUCK4 = 246
GM:AddSkillModifier(SKILL_LUCK4, SKILLMOD_LUCK, 1)
GM:AddSkill(SKILL_LUCK4, translate.Get("skill_luck").."IV", GOOD.."+1"..translate.Get("luck"),
																-4,			-8,					{SKILL_LUCK3}, TREE_POINTTREE)		
GM:AddSkill(SKILL_XPHUNTER, translate.Get("skill_bonusxp"), GOOD..translate.Get("skill_bonusxp_d1"),
																-4,			-10,					{SKILL_LUCK4}, TREE_POINTTREE)		
SKILL_ULUCK = 247
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_LUCK, 5)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_RESUPPLY_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_POINT_MULTIPLIER, -0.15)
GM:AddSkill(SKILL_ULUCK, translate.Get("skill_ultraluck"), GOOD.."+5"..translate.Get("luck")..BAD.."-15%"..translate.Get("p_mul")..BAD.."+15%"..translate.Get("res_delay"),
																-4,			-6,					{SKILL_LUCK4}, TREE_POINTTREE)														
SKILL_LUCKE = 162
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_LUCK, 2)	
GM:AddSkill(SKILL_LUCKY_UNLIVER, translate.Get("skill_luckstacker"), GOOD..translate.Get("skill_luckstacker_d1")..BAD..translate.Get("skill_luckstacker_d2"),
	1,			-3,					{SKILL_LUCKE}, TREE_POINTTREE)
GM:AddSkill(SKILL_LUCKE, translate.Get("skill_badluck"), NEUTRAL.."+2"..translate.Get("luck")..BAD.. "-10%"..translate.Get("p_mul"),
	1,			-2,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_BLUCK = 163
	GM:AddSkillModifier(SKILL_BLUCK, SKILLMOD_LUCK, -5)
GM:AddSkill(SKILL_BLUCK, translate.Get("skill_quad"), GOOD..translate.Get("skill_quad_d1") ..BAD.. "-5"..translate.Get("luck"),
	2,			-2.75,					{SKILL_LUCKE}, TREE_POINTTREE)
GM:AddSkill(SKILL_CREDIT, translate.Get("skill_credit"), GOOD..translate.Get("skill_credit_d1")..GOOD.."+25"..translate.Get("worth")..BAD.."-7%"..translate.Get("sale")..BAD..translate.Get("skill_credit_d2"),
	3,			-4,					{SKILL_BLUCK}, TREE_POINTTREE)
GM:AddSkillModifier(SKILL_CREDIT, SKILLMOD_WORTH, 25)
GM:AddSkillModifier(SKILL_CREDIT, SKILLMOD_ARSENAL_DISCOUNT, 0.07)
	SKILL_PILLUCK = 164
	GM:AddSkillModifier(SKILL_PILLUCK, SKILLMOD_LUCK, -5)
GM:AddSkill(SKILL_PILLUCK, translate.Get("skill_pillluck"), GOOD..translate.Get("skill_pillluck_d1")..BAD.."-5"..translate.Get("luck"),
	-1,			-4,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_DUDEE = 166
	GM:AddSkillModifier(SKILL_DUDEE, SKILLMOD_LUCK, 2)
GM:AddSkill(SKILL_DUDEE, translate.Get("skill_toyluck"), GOOD.."+2"..translate.Get("luck"),
	2,			-5,					{SKILL_LUCKE,SKILL_WORTHINESS4}, TREE_POINTTREE)

	SKILL_BADTRIP = 167
	GM:AddSkillModifier(SKILL_BADTRIP, SKILLMOD_POINT_MULTIPLIER, 0.01)
	GM:AddSkill(SKILL_BADTRIP, translate.Get("skill_badtrip"), GOOD.."+1%"..translate.Get("p_mul"),
		2,			-6,					{SKILL_DUDEE}, TREE_POINTTREE)
	GM:AddSkill(SKILL_SINS, translate.Get("skill_sins"), GOOD..translate.Get("skill_sins_d1"),
		1,			-6,					{SKILL_BADTRIP}, TREE_POINTTREE)
.RemortReq = 6
SKILL_SCAM = 168
GM:AddSkillModifier(SKILL_SCAM, SKILLMOD_POINT_MULTIPLIER, 0.01)
GM:AddSkill(SKILL_SCAM, "Scam", GOOD.."+1%"..translate.Get("p_mul")..BAD.. "On kill curses with 1.5% chance(GIVE SPECIAL CURSE)",
			3,			-8,					{SKILL_BADTRIP}, TREE_POINTTREE)
SKILL_SOLARUZ = 169
GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_POINT_MULTIPLIER, 0.10)
GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.40)
GM:AddSkill(SKILL_SOLARUZ, "Debuff:Deadly Fortuna", PURPLE.."+10% Points Multiplicator \n" ..BAD.. "+40% damage taken melee",
				3,			-9,					{SKILL_SCAM}, TREE_POINTTREE)
SKILL_ANCK = 170
GM:AddSkill(SKILL_ANCK, "Ancient knowledge", PURPLE.."Learn The Ancient knowledge \n" ..BAD.. "The cost of knowledge",
					0,			0,					{SKILL_SOLARUZ}, TREE_ANCIENTTREE)
.LevelReq = 50
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
GM:AddSkillModifier(SKILL_STRENGHT, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkill(SKILL_STRENGHT, "Strongman", PURPLE.."+5% Melee damage!",
					1,			-5,					{SKILL_STRICTE}, TREE_ANCIENTTREE)
SKILL_EX = 177
GM:AddSkill(SKILL_EX, "Exsecrandus", PURPLE.."USELESS!",
					0,			-6,					{SKILL_PIGNUS,SKILL_STRENGHT}, TREE_ANCIENTTREE)
SKILL_EX2 = 178					
GM:AddSkill(SKILL_EX2, "Scientia", PURPLE.."Science!",
					0,			-7,					{SKILL_EX}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_SEX_IS_REAL, "Reality", PURPLE.."Sex is real\n"..PURPLE.."+5 Sex Points",
					0,			-8,					{SKILL_EX2}, TREE_ANCIENTTREE)
.RemortReq = 32
GM:AddSkillModifier(SKILL_SEX_IS_REAL, SKILLMOD_SPOINT, 5)	
					SKILL_ANIMA = 179		
GM:AddSkillModifier(SKILL_ANIMA, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
GM:AddSkillModifier(SKILL_ANIMA, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.03)			
GM:AddSkill(SKILL_ANIMA, "Fines de anima", PURPLE.."+5% melee damage\n" ..BAD.."+3% Melee damage taken!",
					-3,			-7,					{SKILL_EX2}, TREE_ANCIENTTREE)
	SKILL_MERCUS = 184
					GM:AddSkillModifier(SKILL_MERCUS, SKILLMOD_RESUPPLY_DELAY_MUL, -0.10)			
					GM:AddSkill(SKILL_MERCUS, "Mortiferum Pompam", PURPLE.."-10% Ressuply Delay",
										-4,			-6,					{SKILL_ANIMA}, TREE_ANCIENTTREE)
					GM:AddSkill(SKILL_NANOPEL, "Napoleon", PURPLE.."-35% Model scale",
										-6,			-7,					{SKILL_MERCUS}, TREE_ANCIENTTREE)
SKILL_SIGILIBERATOR = 180	
GM:AddSkillModifier(SKILL_SIGILIBERATOR, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.5)		
GM:AddSkill(SKILL_SIGILIBERATOR, "Liberator", PURPLE.."x1.45 damage\n" ..BAD.."+50% damage taken",
										-3,			-8.3,					{SKILL_EX2}, TREE_ANCIENTTREE)
										SKILL_DEATH = 181	
GM:AddSkillModifier(SKILL_DEATH, SKILLMOD_MEDKIT_COOLDOWN_MUL, 0.2)
GM:AddSkillModifier(SKILL_DEATH, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.2)		
GM:AddSkill(SKILL_DEATH, "Morieris", PURPLE.."Better medicine\n" ..BAD.."+20% Medkit Cooldown\n"..PURPLE.."+20% Medkit effectiveness",
										-3,			-7.5,					{SKILL_EX2}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_HELPLIFER, "Chance", PURPLE.."Can save from fatal hit\n10% Chance\nOn upgrade chance is 50%",
										2,			-7,					{SKILL_EX2}, TREE_ANCIENTTREE,0)
.CanUpgrade = 2
GM:AddSkill(SKILL_INF_POWER, "Dozei Core", PURPLE.."-50% Damage.\nExtra-damage for every skills you unlocked\n+0.6% damage per skill",
										4,			-5,					{SKILL_HELPLIFER}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_SOUL_TRADE, "[TRADE]Soul", PURPLE.."Sell Your Soul For Toy.\n"..PURPLE.."+20% Point Mul",
										4,			-7,					{SKILL_HELPLIFER}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_SEEAURA, "Ancient vision", PURPLE.."You can see zombie aura",
										2,			-8.5,					{SKILL_HELPLIFER}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_INVISIBLE_MAN, "Anti-Vision", PURPLE.."Zombie can't see you aura",
										2,			-9.5,					{SKILL_SEEAURA}, TREE_ANCIENTTREE)
										SKILL_ALLPOWER = 182
GM:AddSkillModifier(SKILL_ALLPOWER, SKILLMOD_REPAIRRATE_MUL, 0.10)		
GM:AddSkill(SKILL_ALLPOWER, "Cunctipotens", PURPLE.."Better cades\n" ..PURPLE.."+10% Repair Mul",
					-4,			-7.3,					{SKILL_DEATH}, TREE_ANCIENTTREE)
SKILL_ANCIENT = 183
GM:AddSkillModifier(SKILL_ANCIENT, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.03)
GM:AddSkillModifier(SKILL_ANCIENT, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)		
GM:AddSkill(SKILL_ANCIENT, "Adventum Antiqua", PURPLE.."+5% Damage melee\n" ..BAD.."+3% Damage taken mul",
					-4,			-9.5,					{SKILL_SIGILIBERATOR}, TREE_ANCIENTTREE)
					SKILL_CLASSIX1 = 185	
GM:AddSkill(SKILL_CLASSIX1, "Classical scientia mundi", PURPLE.."Random bloodarmor",
					-5,			-8.5,					{SKILL_ALLPOWER}, TREE_ANCIENTTREE)
SKILL_MAGIC = 255
GM:AddSkill(SKILL_MAGIC, "Magic", PURPLE.."Open a usage of magic\n",
					-6,			-8,					{SKILL_CLASSIX1}, TREE_ANCIENTTREE)
GM:AddSkill(SKILL_MAGIC_MYSTERY, "Master", PURPLE.."+25% Magic damage\n",
					-7,			-9,					{SKILL_MAGIC}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_MAGIC_MYSTERY, SKILLMOD_M_DMG, 0.25)
GM:AddSkill(SKILL_USEFULL, "Use...FULL", PURPLE.."+9% Magic blood armor regeneration\n",
					-7,			-10,					{SKILL_MAGIC_MYSTERY}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_USEFULL, SKILLMOD_M_REG, 0.09)
GM:AddSkill(SKILL_ANATOMY, "Knowledge of anatomy", PURPLE.."+10% Headshot damage\n",
					-7,			-11,					{SKILL_USEFULL}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_ANATOMY, SKILLMOD_HEADSHOT_MUL, 0.10)
GM:AddSkill(SKILL_MORE_INFO, "See the invisible", PURPLE.."Show more information about zombie\n",
					-7,			-7.5,					{SKILL_MAGIC}, TREE_ANCIENTTREE).LevelReq = 76
GM:AddSkill(SKILL_FREE_WAY, "Way", PURPLE.."Useless?\n",
					-6,			-9,					{SKILL_MAGIC, SKILL_NONE}, TREE_ANCIENTTREE)
.RemortReq = 32
				
SKILL_BLOODMARY = 186
GM:AddSkill(SKILL_BLOODMARY, "Sanguinum Messis", PURPLE.."Regenerate blood armor",
										-3,			-9,					{SKILL_ANCIENT}, TREE_ANCIENTTREE)
										SKILL_TRUEPOWER = 187
GM:AddSkill(SKILL_TRUEPOWER, "Future Knowledge Vol.3", PURPLE.."Cost Of Knowledge",
																				-4,			-10,					{SKILL_BLOODMARY}, TREE_ANCIENTTREE)
																														SKILL_HEARTS = 202
GM:AddSkill(SKILL_HEARTS, "Ancient Hearts", PURPLE.."Unlock Heart Trinkets",
																				-5,			-11,					{SKILL_TRUEPOWER,SKILL_NANOMACHINES}, TREE_ANCIENTTREE)
SKILL_NANOMACHINES = 239
GM:AddSkill(SKILL_NANOMACHINES, "Anci-tech", PURPLE.."+5% Bullet damage\n"..PURPLE.."+50% DMG reflect",
																				-6,			-12,					{SKILL_HEARTS}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 0.5)
SKILL_MYTHRIL = 274
GM:AddSkill(SKILL_MYTHRIL, "Mythril armor", PURPLE.."+30% Xp multiplier\n"..PURPLE.."+4% Chance to take XP Instead of damage",
																				-7,			-13,					{SKILL_NANOMACHINES}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_MYTHRIL, SKILLMOD_XP, 0.30)
SKILL_DEFEND = 190
GM:AddSkill(SKILL_DEFEND, translate.Get("skill_sdefender").."I", GOOD.."-2%"..translate.Get("meleedamagetaken")..BAD.."-1"..translate.Get("speed"),
				                                                            	-0.25,			-0.5,					{SKILL_NONE}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_SPEED, -1)

--Tormented SKill
SKILL_TORMENT1 = 229
GM:AddSkill(SKILL_TORMENT1, translate.Get("skill_torment").."I", GOOD.."+5%"..translate.Get("xpmul")..BAD.."-30"..translate.Get("speed")..BAD.."-15%"..translate.Get("b_damage"),
				                                                            	1,			26,					{SKILL_NONE}, TREE_ANCIENTTREE)
.RemortReq = 2
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_DAMAGE, -0.15)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_XP, 0.05)
SKILL_TORMENT2 = 230
GM:AddSkill(SKILL_TORMENT2, translate.Get("skill_torment").."II", GOOD.."+5%"..translate.Get("xpmul")..BAD.."-15%"..translate.Get("meleedamage")..BAD.."-15"..translate.Get("health"),
				                                                            	1,			27,					{SKILL_TORMENT1}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_XP, 0.05)
SKILL_SLAVEC = 251
GM:AddSkill(SKILL_SLAVEC, translate.Get("skill_cot"), GOOD..translate.Get("skill_cot_d1")..GOOD.."+20"..translate.Get("speed")..BAD.."-15"..translate.Get("health"),
																				1.5,			5,					{SKILL_DOSETHELP, SKILL_BERSERK}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_SPEED, 20)
GM:AddSkill(SKILL_BERSERK, translate.Get("skill_ultra_r"), GOOD..translate.Get("skill_ultra_r_d1")..BAD..translate.Get("skill_ultra_r_d2")..BAD..translate.Get("skill_ultra_r_d3"),
																				1.5,			6,					{}, TREE_DEFENSETREE)
SKILL_TORMENT3 = 231
GM:AddSkill(SKILL_TORMENT3, translate.Get("skill_torment").."III", GOOD.."+15%"..translate.Get("xpmul")..BAD.."+50%"..translate.Get("res_delay")..BAD.."-5%"..translate.Get("p_mul").."Secret III(+2 skill points)",
				                                                            	1,			28,					{SKILL_TORMENT2}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_POINT_MULTIPLIER, -0.05)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_RESUPPLY_DELAY_MUL, 0.5)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_XP, 0.15)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_SPOINT, 3)
SKILL_TORMENT4 = 232
GM:AddSkill(SKILL_TORMENT4, translate.Get("skill_torment").."IV", GOOD.."+35%"..translate.Get("xpmul")..BAD..translate.Get("skill_torment_d1"),
				                                                            	1,			29,					{SKILL_TORMENT3}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_MELEE_DAMAGE_MUL, -0.5)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_XP, 0.35)
SKILL_TORMENT5 = 233
GM:AddSkill(SKILL_TORMENT5, translate.Get("skill_torment").."V", GOOD.."+5%"..translate.Get("xpmul")..BAD.."+15%"..translate.Get("meleedamagetaken"),
				                                                            	2,			28.5,					{SKILL_TORMENT4}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.15)
GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_XP, 0.05)
SKILL_TORMENT6 = 253
GM:AddSkill(SKILL_TORMENT6, translate.Get("skill_torment").."VI", GOOD.."+10%"..translate.Get("xpmul")..BAD..translate.Get("skill_torment_d2"),
				                                                            	3,			30,					{SKILL_TORMENT5}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_REPAIRRATE_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_XP, 0.10)
SKILL_DEATHCURSE = 234
GM:AddSkill(SKILL_DEATHCURSE, translate.Get("skill_ccleaning"), GOOD.."+15%"..translate.Get("xpmul")..GOOD..translate.Get("skill_ccleaning_d1")..BAD.."-30%"..translate.Get("m_curse")..BAD..translate.Get("skill_ccleaning_d2"),
				                                                            	3,			-1,					{SKILL_DEFENDBLOOD}, TREE_DEFENSETREE)		
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_XP, 0.15)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_CURSEM, -0.30)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_FOODEATTIME_MUL, 0.30)
GM:AddSkill(SKILL_TORMENT7, translate.Get("skill_torment").."VII", GOOD.."+55%"..translate.Get("xpmul")..BAD..translate.Get("skill_torment_d3")..BAD.."-25%"..translate.Get("sale")..BAD..translate.Get("skill_torment_d2"),
				                                                            	2,			31,					{SKILL_TORMENT6,SKILL_TORMENT8}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_XP, 0.55)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_MELEE_DAMAGE_MUL, -0.30)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_DAMAGE, -0.30)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_LUCK, -5)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_HEALTH, -45)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_SPEED, -55)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_ARSENAL_DISCOUNT, 0.25)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_REPAIRRATE_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT7, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.50)
GM:AddSkill(SKILL_TORMENT8,translate.Get("skill_torment").."VIII", GOOD.."+15%"..translate.Get("xpmul")..BAD.."-50"..translate.Get("health"),
				                                                            	3,			32,					{SKILL_TORMENT7}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT8, SKILLMOD_HEALTH, -50)
GM:AddSkillModifier(SKILL_TORMENT8, SKILLMOD_XP, 0.15)
GM:AddSkill(SKILL_FREEPOINT1,translate.Get("skill_freexp").."I", GOOD.."+1%"..translate.Get("xpmul"),
				                                                            	4,			33,					{SKILL_TORMENT8}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT1, SKILLMOD_XP, 0.01)
GM:AddSkill(SKILL_FREEPOINT2,translate.Get("skill_freexp").."II", GOOD.."+3%"..translate.Get("xpmul"),
				                                                            	5,			32,					{SKILL_FREEPOINT1}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT2, SKILLMOD_XP, 0.03)
GM:AddSkill(SKILL_FREEPOINT3,translate.Get("skill_freexp").."III", GOOD.."+4%"..translate.Get("xpmul"),
				                                                            	6,			34,					{SKILL_FREEPOINT2}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT3, SKILLMOD_XP, 0.04)
GM:AddSkill(SKILL_FREEPOINT4,translate.Get("skill_freexp").."IV", GOOD.."+6%"..translate.Get("xpmul"),
				                                                            	6,			35,					{SKILL_FREEPOINT3}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT4, SKILLMOD_XP, 0.06)
GM:AddSkill(SKILL_XPMULGOOD, translate.Get("skill_xpmulgood"), GOOD..translate.Get("skill_xpmulgood_d1")..BAD..translate.Get("skill_xpmulgood_d2"),
				                                                            	6,			36,					{SKILL_FREEPOINT4}, TREE_ANCIENTTREE)

--Defend skills

SKILL_DEFEND1 = 191
GM:AddSkill(SKILL_DEFEND1, translate.Get("skill_sdefender").."II", GOOD.."-2%"..translate.Get("meleedamagetaken")..BAD.."-2"..translate.Get("speed"),
				                                                            	0.75,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_SPEED, -2)
SKILL_DEFEND2 = 192
GM:AddSkill(SKILL_DEFEND2,translate.Get("skill_sdefender").."III", GOOD.."-3%"..translate.Get("meleedamagetaken")..BAD.."-4"..translate.Get("speed"),
				                                                            	1.5,			1,					{SKILL_DEFEND1}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.03)
GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_SPEED, -4)
GM:AddSkill(SKILL_DEFENDBLOOD,translate.Get("skill_blooddefender"), GOOD..translate.Get("skill_blooddefender_d1")..BAD..translate.Get("skill_blooddefender_d2"),
				                                                            	3,			0,					{SKILL_DEFEND2, SKILL_DEATHCURSE}, TREE_DEFENSETREE)
SKILL_DEFEND3 = 193
GM:AddSkill(SKILL_DEFEND3, translate.Get("skill_sdefender").." IV", GOOD.."-4%"..translate.Get("meleedamagetaken")..BAD.."-6"..translate.Get("speed"),
				                                                            	1.5,			2,					{SKILL_DEFEND2}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_DOSETHELP, translate.Get("skill_dosethelp"), GOOD..translate.Get("skill_dosethelp_d1")..BAD.."-25"..translate.Get("speed"),
				                                                            	1.5,			4,					{SKILL_DEFEND2}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_SPEED, -6)
GM:AddSkillModifier(SKILL_DOSETHELP, SKILLMOD_SPEED, -25)
SKILL_DEFEND4 = 194
GM:AddSkill(SKILL_DEFEND4, translate.Get("skill_sdefender").."V", GOOD.."-6%"..translate.Get("meleedamagetaken")..BAD.."-12"..translate.Get("speed"),
				                                                            	0.75,			3,					{SKILL_DEFEND3}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_SPEED, -12)
SKILL_DEFEND5 = 195
GM:AddSkill(SKILL_DEFEND5, translate.Get("skill_sdefender").."VI", GOOD.."-9%"..translate.Get("meleedamagetaken")..GOOD.."+15%"..translate.Get("knockdown_r")..BAD.."-16"..translate.Get("speed"),
				                                                            	0,			3.5,					{SKILL_DEFEND4}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.09)
GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_SPEED, -16)
GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.15)
SKILL_DEFENDER = 196
GM:AddSkill(SKILL_DEFENDER, translate.Get("skill_hdef"), GOOD.."-4%"..translate.Get("meleedamagetaken")..BAD.."-4%"..translate.Get("meleedamage"),
				                                                            	-1.5,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_MUL, -0.04)
SKILL_DEFENDEROFM = 197
GM:AddSkill(SKILL_DEFENDEROFM, translate.Get("skill_mdef"), BAD.."5%"..translate.Get("meleedamagetaken")..GOOD.."+5%"..translate.Get("meleedamage"),
				                                                            	-2,			1,					{SKILL_DEFENDER}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
SKILL_HEAVY = 254
GM:AddSkill(SKILL_HEAVY, translate.Get("skill_heavy"), GOOD.."-10%"..translate.Get("meleedamagetaken")..BAD.."-30"..translate.Get("speed")..GOOD.."+33%"..translate.Get("knockdown_r")..BAD.."-50%"..translate.Get("jump"),
				                                                            	-3,		    0.5,					{SKILL_DEFENDEROFM}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.1)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_JUMPPOWER_MUL, -0.5)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.33)
SKILL_TTIMES = 249
GM:AddSkill(SKILL_TTIMES, translate.Get("skill_ttimes"), GOOD..translate.Get("skill_ttimes_d1")..BAD.."+5%"..translate.Get("meleedamagetaken"),
				                                                            	-3,			1.5,					{SKILL_TRIP,SKILL_TTIMES1}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
SKILL_TTIMES1 = 250
GM:AddSkill(SKILL_TTIMES1, translate.Get("skill_ttime"), GOOD.."-7%"..translate.Get("meleedamagetaken"),
				                                                            	-4,			2,					{SKILL_TTIMES}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.07)
SKILL_TRIP = 198
GM:AddSkill(SKILL_TRIP, translate.Get("skill_cursewall"), GOOD.."-33%"..translate.Get("meleedamagetaken")..GOOD.."+50% "..translate.Get("m_curse")..BAD.."-12%"..translate.Get("meleedamage")..BAD.."-70"..translate.Get("speed"),
				                                                            	-2,			2,					{SKILL_DEFENDEROFM,SKILL_TTIMES}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.33)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_MUL, -0.12)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_SPEED, -70)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_CURSEM, 0.5)
GM:AddSkill(SKILL_HOLY_MANTLE, translate.Get("skill_holymantle"), GOOD..translate.Get("skill_holymantle_d1"),
				                                                            	-4,			3,					{SKILL_TTIMES}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_SELFSAVER, translate.Get("skill_selfsaver"), GOOD..translate.Get("skill_selfsaver_d1")..BAD.."-35"..translate.Get("speed"),
				                                                            	-3,			4,					{SKILL_HOLY_MANTLE}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_BLOODYFISTS, translate.Get("skill_bloodyfists"), GOOD..translate.Get("skill_bloodyfists_d1")..BAD..translate.Get("skill_bloodyfists_d2"),
				                                                            	-5,			4,					{SKILL_SELFSAVER}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_BLOODYFISTS, SKILLMOD_UNARMED_DAMAGE_MUL, -0.20)
GM:AddSkill(SKILL_ASAVE, translate.Get("skill_ancientsave"), GOOD..translate.Get("skill_ancientsave_d1")..BAD.."-55"..translate.Get("speed"),
				                                                            	-4,			5,					{SKILL_SELFSAVER}, TREE_DEFENSETREE)
SKILL_MERIS = 199
GM:AddSkill(SKILL_MERIS, translate.Get("skill_meris"), GOOD.."-10%"..translate.Get("meleedamagetaken")..BAD.."-20%"..translate.Get("meleedamage"),
				                                                            	-1,			3.5,					{SKILL_TRIP}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_UPLOAD, translate.Get("skill_later"), GOOD..translate.Get("skill_later_d1")..BAD..translate.Get("skill_later_d2"),
				                                                            	-1,			5,					{SKILL_MERIS}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_ANTINEGR, translate.Get("skill_antinegr"), GOOD..translate.Get("skill_antinegr_d1")..BAD..translate.Get("skill_antinegr_d2"),
				                                                            	-1,			6,					{SKILL_UPLOAD}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_MOREDAMAGE, translate.Get("skill_moredamage"), GOOD..translate.Get("skill_moredamage_d1")..BAD.."+35%"..translate.Get("meleedamagetaken"),
				                                                            	0,			7,					{SKILL_ANTINEGR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_MOREDAMAGE, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.35)
GM:AddSkillModifier(SKILL_MOREDAMAGE, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.25)
GM:AddSkill(SKILL_ANTI_DEVO, translate.Get("skill_adevo"), GOOD..translate.Get("skill_adevo_d1")..BAD..translate.Get("skill_adevo_d2"),
				                                                            	1,			7,					{SKILL_MOREDAMAGE}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_ANTI_DEVO, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.25)
GM:AddSkillModifier(SKILL_ANTI_DEVO, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.07)
GM:AddSkill(SKILL_SECONDCHANCE, translate.Get("skill_schance"), GOOD..translate.Get("skill_schance_d1"),
				                                                            	0,			8,					{SKILL_MOREDAMAGE}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_CQARMOR, translate.Get("skill_cqarmor"), GOOD..translate.Get("skill_cqarmor_d1")..BAD..translate.Get("skill_cqarmor_d2"),
				                                                            	-2,			7,					{SKILL_ANTINEGR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_CQARMOR, SKILLMOD_DMG_TAKEN, -0.25)
GM:AddSkill(SKILL_CQBOOTS, translate.Get("skill_cboots"), GOOD..translate.Get("skill_cboots_d1")..BAD..translate.Get("skill_cboots_d2"),
				                                                            	-2,			8,					{SKILL_CQARMOR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_CQBOOTS, SKILLMOD_DMG_TAKEN, 0.10)

GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)
GM:AddSkill(SKILL_DONATE1, "Donate I", GOOD.."-3% Damage taken\n"..GOOD.."+2% Melee damage! Thank Null\n",
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
GM:AddSkill(SKILL_DONATE12, "Donate XII", GOOD.."+10% Bullet damage\n"..GOOD.."Thx TTo3oR!",
				                                                            	22,			28,					{SKILL_DONATE11}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE12, SKILLMOD_DAMAGE, 0.10)
GM:AddSkill(SKILL_DONATE13, "Donate XIII", GOOD.."-35% Scale model\n"..GOOD.."Thx chayok",
				                                                            	23,			29,					{SKILL_DONATE12}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE13, SKILLMOD_SCALEMODEL, -0.35)
GM:AddSkill(SKILL_DONATE14, "Donate XIV", GOOD.."+6% Magic Damage and +5% blood armor regen from magic\n"..GOOD.."Thx for Белый Рыцарь",
				                                                            	23,			30,					{SKILL_DONATE13}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE14, SKILLMOD_M_DMG, 0.06)
GM:AddSkillModifier(SKILL_DONATE14, SKILLMOD_M_REG, 0.05)
GM:AddSkill(SKILL_DONATE15, "Donate XV", GOOD.."+10 speed\n"..GOOD.."Thx for normal gay",
				                                                            	21,			28,					{SKILL_DONATE14}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE15, SKILLMOD_SPEED, 10)
GM:AddSkill(SKILL_DONATE16, "Donate XVI", GOOD.."+5% Bullet Damage\n"..GOOD.."Thx for MarioL",
				                                                            	20,			26,					{SKILL_DONATE15}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE16, SKILLMOD_DAMAGE, 0.05)


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
GM:AddSkill(SKILL_SECRET2, "Secret V", GOOD.."Good thing, +3 spoints",
				                                                            	-22,			-53,					{SKILL_NONE}, TREE_USELESSTREE)
.HiddenU = true
SKILL_USELESS_1 = 500
GM:AddSkill(SKILL_USELESS_1, "Useless 1", GOOD.."+5% XP MUL",
				                                                            	0,			0,					{SKILL_NONE}, TREE_USELESSTREE)
.RemortReq = 16
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
GM:AddSkill(SKILL_USELESS_12, "Useless 12", GOOD.."+1% Bullet damage",
				                                                            	3,		    0,					{SKILL_USELESS_11}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_12, SKILLMOD_DAMAGE, 0.01)
SKILL_USELESS_13 = 512
GM:AddSkill(SKILL_USELESS_13, "Useless 13", GOOD.."+1% Melee damage",
				                                                            	2,		    -1,					{SKILL_USELESS_12}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_13, SKILLMOD_MELEE_DAMAGE_MUL, 0.01)
SKILL_USELESS_14 = 513
GM:AddSkill(SKILL_USELESS_14, "Useless 14", GOOD.."-5% Melee damage taken mul\n You have TOO MUCH USELESS SKILL POINTS???",
				                                                            	1,		    -1,					{SKILL_USELESS_13}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_14, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)
SKILL_USELESS_15 = 514
GM:AddSkill(SKILL_USELESS_15, "Useless 15", GOOD.."+10% Block damage multiplier",
				                                                            	1,		    -2,					{SKILL_USELESS_14}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_15, SKILLMOD_BLOCKMULTIPLIER, -0.10)
SKILL_USELESS_16 = 515
GM:AddSkill(SKILL_USELESS_16, "Useless 16", GOOD.."-10% Medkit Cooldown",
				                                                            	0,		    -2,					{SKILL_USELESS_15}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_16, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.10)
SKILL_USELESS_17 = 516
GM:AddSkill(SKILL_USELESS_17, "Useless 17", GOOD.."meh take this,+7 skills points(secret iv?)",
				                                                            	-2,		    -2,					{SKILL_USELESS_16}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_17, SKILLMOD_SPOINT, 8)
SKILL_USELESS_18 = 517
GM:AddSkill(SKILL_USELESS_18, "Useless 18", GOOD.."-15% Dimvision effectiveness",
				                                                            	-3,		    -1,					{SKILL_USELESS_17}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_18, SKILLMOD_DIMVISION_EFF_MUL, -0.15)
SKILL_USELESS_19 = 518
GM:AddSkill(SKILL_USELESS_19, "Useless 19", GOOD.."+20% Medic Heal Mul",
				                                                            	-3,		    -0,					{SKILL_USELESS_18}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_19, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.20)
SKILL_USELESS_20 = 519
GM:AddSkill(SKILL_USELESS_20, "Useless 20", GOOD.."+5 spoints",
				                                                            	-4,		    -0,					{SKILL_USELESS_19}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_20, SKILLMOD_SPOINT, 5)
SKILL_USELESS_21 = 520
GM:AddSkill(SKILL_USELESS_21, "Useless 21", GOOD.."+9% Sale",
				                                                            	-4,		    1,					{SKILL_USELESS_20}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_21, SKILLMOD_ARSENAL_DISCOUNT, -0.09)







GM:AddSkillModifier(SKILL_BLOODLOST, SKILLMOD_HEALTH, -30)
GM:AddSkillModifier(SKILL_ABUSE, SKILLMOD_MELEE_DAMAGE_MUL, 0.1)
GM:AddSkillFunction(SKILL_ABUSE, function(pl, active)
	pl:SetDTBool(DT_PLAYER_BOOL_LABUSE, active)
end)

GM:SetSkillModifierFunction(SKILLMOD_ELEMENTAL_MUL, function(pl, amount)
	pl.ElementalMul = math.Clamp(amount + 1.0, 0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_ATT_CHANCE, function(pl, amount)
	pl.AttChance = math.Clamp(amount + 1.0, 0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_IND_CHANCE, function(pl, amount)
	pl:SetNW2Float(12,math.Clamp(amount + 1.0, 0, 1000.0))
end)
GM:SetSkillModifierFunction(SKILLMOD_IND_DMG_TAKEN, function(pl, amount)
	pl.IndDamageTaken = math.Clamp(amount + 1.0, 0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_ADD_STATUS, function(pl, amount)
	pl.AdditionalStatusTime = math.Clamp(amount + 1.0, 0, 1000.0)
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
GM:AddSkillModifier(SKILL_COMBOHEAL, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.35)
GM:AddSkillModifier(SKILL_FOREVERALONE, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.66)
GM:AddSkillModifier(SKILL_DUALHEAL, SKILLMOD_MEDKIT_COOLDOWN_MUL, 0.5)

GM:SetSkillModifierFunction(SKILLMOD_MEDKIT_COOLDOWN_MUL, function(pl, amount)
	pl.MedicCooldownMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_M_REG, function(pl, amount)
	pl.MagicRegen = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_HEADSHOT_MUL, function(pl, amount)
	pl.HeadshotMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_M_DMG, function(pl, amount)
	pl.MagicDamage = math.Clamp(amount + 1.0, 0.0, 1000.0)
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
GM:SetSkillModifierFunction(SKILLMOD_SPOINT, function(pl, amount)
	pl.SkillPoints = math.Clamp(amount + 0, 0, 1000.0)
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
	local new = 20 + math.Clamp(amount, 0, 1000)

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
GM:SetSkillModifierFunction(SKILLMOD_HEALTHMUL, GM:MkGenericMod("HealthMul"))

GM:SetSkillModifierFunction(SKILLMOD_RELOADSPEED_MUL, function(pl, amount)
	pl.ReloadSpeedMultiplier = math.Clamp(amount + 1.0, 0.05, 100.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_MELEE_DAMAGE_MUL, function(pl, amount)
	pl.MeleeDamageMultiplier = math.Clamp(amount + 1.0, 0.0, 100.0)
end)


GM:SetSkillModifierFunction(SKILLMOD_SELF_DAMAGE_MUL, function(pl, amount)
	pl.SelfDamageMul = math.Clamp(amount + 1.0, 0.05, 100.0)
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
GM:SetSkillModifierFunction(SKILLMOD_DMG_TAKEN, function(pl, amount)
	pl.DamageTakenMul = math.Clamp(amount + 1.0 - (pl.ClanMelee and 0.2 or 0), 0.05, 100.0) 
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
	pl.MeleeDamageTakenMul = math.Clamp(amount + 1.0, 0.05, 1000.0)
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
GM:SetSkillModifierFunction(SKILLMOD_RES_AMMO_MUL, function(pl, amount)
	pl.RessuplyMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_DIMVISION_EFF_MUL, function(pl, amount)
	pl.DimVisionEffMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_XP, function(pl, amount)
	pl.XPMulti = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_PROP_CARRY_SLOW_MUL, function(pl, amount)
	pl.PropCarrySlowMul = math.Clamp(amount + 1.0, 0.0, 1000.0)
end)

GM:SetSkillModifierFunction(SKILLMOD_PIECE_OF_AMULET, function(pl, amount)
	pl.AmuletPiece = math.Clamp(amount, -999, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_BLEED_SPEED_MUL, function(pl, amount)
	pl.BleedSpeedMul = math.Clamp(amount + 1.0, 0.1, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_FIRE_DELAY, function(pl, amount)
	pl.M_FireDelay = math.Clamp(amount + 1.0, 0.1, 1000.0)
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
GM:SetSkillModifierFunction(SKILLMOD_SCALEMODEL, function(pl, amount)
	pl.ScaleModel = math.Clamp(amount + 1.0 - (pl.ClanMich and 0.25 or 0), 0.06, 1000.0)
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
GM:SetSkillModifierFunction(SKILLMOD_ARSENAL_DISCOUNT, function(pl, amount)
	pl.ArsenalDiscount = math.Clamp(amount + 1.0, 0.05, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_SCRAPDISCOUNT, GM:MkGenericMod("ScrapDiscount"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_RADIUS, GM:MkGenericMod("CloudRadius"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_TIME, GM:MkGenericMod("CloudTime"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_MUL, GM:MkGenericMod("ExplosiveDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_MUL, GM:MkGenericMod("ProjectileDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_TURRET_RANGE_MUL, GM:MkGenericMod("TurretRangeMul"))
GM:SetSkillModifierFunction(SKILLMOD_AIM_SHAKE_MUL, GM:MkGenericMod("AimShakeMul"))

GM:AddSkillModifier(SKILL_PITCHER2, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.30)

GM:AddSkillModifier(SKILL_PITCHER2, SKILLMOD_DAMAGE, -0.15)


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
GM:AddSkillModifier(SKILL_CHEESE2, SKILLMOD_HEALTH, 15)
GM:AddSkillModifier(SKILL_CHEESE2, SKILLMOD_SPEED, 15)

GM:AddSkillModifier(SKILL_CHEESE3, SKILLMOD_HEALTH, 5)
GM:AddSkillModifier(SKILL_CHEESE3, SKILLMOD_SPEED, 3)

GM:AddSkillModifier(SKILL_BLOODYMAN, SKILLMOD_HEALTH, -100)
GM:AddSkillModifier(SKILL_BLOODYMAN, SKILLMOD_BLOODARMOR, 130)

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

GM:AddSkillModifier(SKILL_CQARMOR, SKILLMOD_SCALEMODEL, 0.2)
GM:AddSkillModifier(SKILL_NANOPEL, SKILLMOD_SCALEMODEL, -0.15)

GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_SELF_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_EGOCENTRIC, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_SELFSAVER, SKILLMOD_SELF_DAMAGE_MUL, -0.25)
GM:AddSkillModifier(SKILL_SELFSAVER, SKILLMOD_SPEED, -35)

GM:AddSkillModifier(SKILL_ASAVE, SKILLMOD_SPEED, -55)

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

GM:AddSkillModifier(SKILL_COOL_MED, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.25)

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

GM:AddSkillModifier(SKILL_FOODHEALS, SKILLMOD_FOODRECOVERY_MUL, -0.35)


GM:AddSkillModifier(SKILL_BATTLER1, SKILLMOD_MELEE_DAMAGE_MUL, 0.03)
GM:AddSkillModifier(SKILL_BATTLER2, SKILLMOD_MELEE_DAMAGE_MUL, 0.06)
GM:AddSkillModifier(SKILL_BATTLER3, SKILLMOD_MELEE_DAMAGE_MUL, 0.08)
GM:AddSkillModifier(SKILL_BATTLER4, SKILLMOD_MELEE_DAMAGE_MUL, 0.09)
GM:AddSkillModifier(SKILL_BATTLER5, SKILLMOD_MELEE_DAMAGE_MUL, 0.13)
GM:AddSkillModifier(SKILL_BATTLER6, SKILLMOD_MELEE_DAMAGE_MUL, 0.16)
GM:AddSkillModifier(SKILL_SOULNET, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

GM:AddSkillModifier(SKILL_BATTLER1, SKILLMOD_RELOADSPEED_MUL, -0.02)
GM:AddSkillModifier(SKILL_BATTLER2, SKILLMOD_RELOADSPEED_MUL, -0.04)
GM:AddSkillModifier(SKILL_BATTLER3, SKILLMOD_RELOADSPEED_MUL, -0.09)
GM:AddSkillModifier(SKILL_BATTLER4, SKILLMOD_RELOADSPEED_MUL, -0.13)
GM:AddSkillModifier(SKILL_BATTLER5, SKILLMOD_RELOADSPEED_MUL, -0.16)
GM:AddSkillModifier(SKILL_BATTLER6, SKILLMOD_RELOADSPEED_MUL, -0.33)

GM:AddSkillModifier(SKILL_GLASSMAN, SKILLMOD_MELEE_DAMAGE_MUL, 2.3)
GM:AddSkillModifier(SKILL_GLASSMAN, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 2)

GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
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
GM:AddSkillFunction(SKILL_D_CLUMSY, function(pl, active)
	pl.IsClumsy = active
end)

GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_REPAIRRATE_MUL, 0.35)
GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_WORTH, 10)
GM:AddSkillModifier(SKILL_D_NOODLEARMS, SKILLMOD_SCRAP_START, 25)
GM:AddSkillFunction(SKILL_D_NOODLEARMS, function(pl, active)
	pl.NoObjectPickup = active
end)

GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_WORTH, 20)
GM:AddSkillModifier(SKILL_D_PALSY, SKILLMOD_RESUPPLY_DELAY_MUL, -0.15)
GM:AddSkillFunction(SKILL_D_PALSY, function(pl, active)
	pl.HasPalsy = active
end)

GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_WORTH, 30)
GM:AddSkillModifier(SKILL_D_HEMOPHILIA, SKILLMOD_SCRAP_START, 16)
GM:AddSkillFunction(SKILL_D_HEMOPHILIA, function(pl, active)
	pl.HasHemophilia = active
end)

GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_WORTH, 30)
GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_ARSENAL_DISCOUNT, -0.13)

GM:AddSkillModifier(SKILL_STOCKPILE, SKILLMOD_RES_AMMO_MUL, 0.50)

GM:AddSkillModifier(SKILL_FREEAMMO, SKILLMOD_RES_AMMO_MUL, 0.05)

GM:AddSkillFunction(SKILL_TAUT, function(pl, active)
	pl.BuffTaut = active
end)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, 0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_HEALTH_MUL, -0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_PROP_CARRY_SLOW_MUL, -1)

GM:AddSkillModifier(SKILL_BLOODARMOR, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_HAEMOSTASIS, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.16)
GM:AddSkillModifier(SKILL_STONEBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.03)

GM:AddSkillModifier(SKILL_DEFENDBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -1)

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

GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_MELEE_DAMAGE_MUL, -0.05)
GM:AddSkillModifier(SKILL_LANKY, SKILLMOD_MELEE_RANGE_MUL, 0.1)

GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_MELEE_DAMAGE_MUL, -0.06)
GM:AddSkillModifier(SKILL_LANKYII, SKILLMOD_MELEE_RANGE_MUL, 0.1)


GM:AddSkillModifier(SKILL_LANKYIII, SKILLMOD_MELEE_DAMAGE_MUL, -0.07)
GM:AddSkillModifier(SKILL_LANKYIII, SKILLMOD_MELEE_RANGE_MUL, 0.1)

GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.33)
GM:AddSkillModifier(SKILL_D_FRAIL, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.33)
GM:AddSkillFunction(SKILL_D_FRAIL, function(pl, active)
	pl:SetDTBool(DT_PLAYER_BOOL_FRAIL, active)
end)
GM:AddSkillModifier(SKILL_MEDICBOOSTER, SKILLMOD_MEDKIT_COOLDOWN_MUL, 0.33)

GM:AddSkillModifier(SKILL_MASTERCHEF, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

GM:AddSkillModifier(SKILL_LIGHTWEIGHT, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)

GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_JUMPPOWER_MUL, 0.04)
GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_SPEED, -2)

GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_JUMPPOWER_MUL, 0.05)
GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_SPEED, -3)

GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_JUMPPOWER_MUL, 0.06)
GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_SOUL_TRADE, SKILLMOD_POINT_MULTIPLIER, 0.2)

GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_RADIUS, 0.10)
GM:AddSkillModifier(SKILL_SOFTDET, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.4)

GM:AddSkillModifier(SKILL_ELEMENTAL_BUFF, SKILLMOD_EXP_DAMAGE_TAKEN_MUL,0.2)
GM:AddSkillModifier(SKILL_ELEMENTAL_BUFF, SKILLMOD_ELEMENTAL_MUL,0.1)
GM:AddSkillModifier(SKILL_ELEMENTAL_BUFF, SKILLMOD_ATT_CHANCE,-0.1)

GM:AddSkillModifier(SKILL_CONISSUE, SKILLMOD_ELEMENTAL_MUL,0.45)
GM:AddSkillModifier(SKILL_CONISSUE, SKILLMOD_ATT_CHANCE,0.5)

GM:AddSkillModifier(SKILL_ATTACHMENT_CURSE, SKILLMOD_ELEMENTAL_MUL,0.15)

GM:AddSkillModifier(SKILL_HEHE, SKILLMOD_ELEMENTAL_MUL,0.03)
GM:AddSkillModifier(SKILL_HAHA, SKILLMOD_ATT_CHANCE,-0.03)
GM:AddSkillModifier(SKILL_HIHI, SKILLMOD_IND_DMG_TAKEN,-0.06)

GM:AddSkillModifier(SKILL_INDUCTOR_ISSUE, SKILLMOD_ELEMENTAL_MUL,-0.25)
GM:AddSkillModifier(SKILL_INDUCTOR_ISSUE, SKILLMOD_ATT_CHANCE,-0.25)
--SKILL_CURSED_ALT
GM:AddSkillModifier(SKILL_CURSED_ALT,  SKILLMOD_ATT_CHANCE,0.3)
GM:AddSkillModifier(SKILL_DOUBLE_ISSUE, SKILLMOD_ATT_CHANCE,0.4)

GM:AddSkillModifier(SKILL_DOUBLE_EXPLOSIVE, SKILLMOD_IND_CHANCE,1)
GM:AddSkillModifier(SKILL_DOUBLE_EXPLOSIVE, SKILLMOD_ELEMENTAL_MUL,0.6)

GM:AddSkillModifier(SKILL_DOUBLE_EXPLOSIVE_ALT, SKILLMOD_IND_CHANCE,-0.2)
GM:AddSkillModifier(SKILL_DOUBLE_EXPLOSIVE_ALT, SKILLMOD_ELEMENTAL_MUL,-0.4)


GM:AddSkillModifier(SKILL_CRYO_LASER, SKILLMOD_IND_CHANCE, 0.35)

GM:AddSkillModifier(SKILL_N_FRIEND, SKILLMOD_ELEMENTAL_MUL,-0.25)
GM:AddSkillModifier(SKILL_N_FRIEND, SKILLMOD_IND_DMG_TAKEN,-0.33)

GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.65)
GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_MUL, -0.3)

GM:AddSkillModifier(SKILL_BLOODLETTER, SKILLMOD_BLOODARMOR_GAIN_MUL, 1)

GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_SURESTEP, SKILLMOD_SLOW_EFF_TAKEN_MUL, -0.35)

GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_SPEED, -4)
GM:AddSkillModifier(SKILL_INTREPID, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.35)

GM:AddSkillModifier(SKILL_UNBOUND, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_CHEAPKNUCKLE, SKILLMOD_MELEE_RANGE_MUL, -0.1)

GM:AddSkillModifier(SKILL_HEAVYSTRIKES, SKILLMOD_MELEE_KNOCKBACK_MUL, 0.9)

GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJ_SPEED, -0.25)
GM:AddSkillModifier(SKILL_CANNONBALL, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.35)

GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_RADIUS, -0.2)
GM:AddSkillModifier(SKILL_CONEFFECT, SKILLMOD_EXP_DAMAGE_MUL, 0.05)

GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_SPEED, -12)
GM:AddSkillModifier(SKILL_CARDIOTONIC, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.2)

GM:AddSkillFunction(SKILL_SCOURER, function(pl, active)
	pl.Scourer = active
end)

GM:AddSkillModifier(SKILL_DISPERSION, SKILLMOD_CLOUD_RADIUS, 0.15)
GM:AddSkillModifier(SKILL_DISPERSION, SKILLMOD_CLOUD_TIME, -0.1)

GM:AddSkillModifier(SKILL_TRUEBLOCK, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)

GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.16)
GM:AddSkillModifier(SKILL_BRASH, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, -15)

GM:AddSkillModifier(SKILL_FOUR_IN_ONE, SKILLMOD_HEALTH, -7)
GM:AddSkillModifier(SKILL_FOUR_IN_ONE, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.09)

GM:AddSkillModifier(SKILL_THREE_IN_ONE, SKILLMOD_HEALTH, -10)
GM:AddSkillModifier(SKILL_THREE_IN_ONE, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.16)

GM:AddSkillModifier(SKILL_CIRCULATION, SKILLMOD_BLOODARMOR, 1)
GM:AddSkillModifier(SKILL_CIRCULATION1, SKILLMOD_BLOODARMOR, 3)
GM:AddSkillModifier(SKILL_CIRCULATION2, SKILLMOD_BLOODARMOR, 3)

GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_BLOODARMOR, 11)
GM:AddSkillModifier(SKILL_SANGUINE, SKILLMOD_HEALTH, -9)

GM:AddSkillModifier(SKILL_MADNESS, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.15)

GM:AddSkillModifier(SKILL_ANTIGEN, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.05)
GM:AddSkillModifier(SKILL_ANTIGEN, SKILLMOD_HEALTH, -3)

GM:AddSkillModifier(SKILL_DAMAGER, SKILLMOD_HEALTH, 50)

GM:AddSkillModifier(SKILL_INSTRUMENTS, SKILLMOD_TURRET_RANGE_MUL, 0.05)

GM:AddSkillModifier(SKILL_LEVELHEADED, SKILLMOD_AIM_SHAKE_MUL, -0.05)

GM:AddSkillModifier(SKILL_ROBUST, SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, -0.06)

GM:AddSkillModifier(SKILL_TAUT, SKILLMOD_PROP_CARRY_SLOW_MUL, 0.4)

GM:AddSkillModifier(SKILL_TURRETOVERLOAD, SKILLMOD_TURRET_RANGE_MUL, -0.3)

GM:AddSkillModifier(SKILL_STOWAGE, SKILLMOD_RES_AMMO_MUL, -0.15)
GM:AddSkillFunction(SKILL_STOWAGE, function(pl, active)
	pl.Stowage = active
end)

GM:AddSkillFunction(SKILL_TRUEWOOISM, function(pl, active)
	pl.TrueWooism = active
end)


GM:AddSkillModifier(SKILL_MECHANIC, SKILLMOD_SCRAPDISCOUNT, -0.15)
GM:AddSkillModifier(SKILL_MECHANIC, SKILLMOD_ARSENAL_DISCOUNT, 0.15)


GM:AddSkillModifier(SKILL_CURSECURE, SKILLMOD_CURSEM, 0.20)
GM:AddSkillModifier(SKILL_CURSECURE, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)

GM:AddSkillModifier(SKILL_INSIGHT, SKILLMOD_ARSENAL_DISCOUNT, 0.02)
GM:AddSkillModifier(SKILL_ACUITY, SKILLMOD_ARSENAL_DISCOUNT, -0.03)

GM:AddSkillModifier(SKILL_VKID, SKILLMOD_JUMPPOWER_MUL, 0.30)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_HEALTH, -50)

GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_JUMPPOWER_MUL, 0.30)
GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_SPEED, 15)
GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_HEALTH, -25)

GM:AddSkillModifier(SKILL_CURSEDHEALTH, SKILLMOD_CURSEM, -0.25)
