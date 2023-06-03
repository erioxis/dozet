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
local trs = translate.Get
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
SKILL_ACTIVATE_THIS = 418
SKILL_PACIFISMIUM = 419
SKILL_DONATE17 = 420
SKILL_DONATE18 = 421
SKILL_CRESCENDO1 = 422
SKILL_CRESCENDO2 = 423
SKILL_CRESCENDO3 = 424
SKILL_AMULET_16 = 425
SKILL_HYPERCOAGULATION = 426
SKILL_RESNYATOST = 427
SKILL_TOY_BEST_FRIEND = 428
SKILL_PURGATORY = 429
SKILL_SECRET_9 = 430 -- maybe LATER
SKILL_STAMINA = 431
SKILL_STAMINLESS1 = 432
SKILL_STAMINLESS2 = 433
SKILL_STAMINLESS3 = 434
SKILL_SHINNING_HIT = 435
SKILL_BIRD_EYE = 436
SKILL_LEUKEMIA = 437
SKILL_X_GEN = 438
SKILL_SAHA = 439
SKILL_FAST_EYE = 440
SKILL_HOLE_OF_HELL = 441
SKILL_SAUL_GOODMAN = 442
SKILL_GREEDNESS = 443
SKILL_DOUBLE = 444
SKILL_PARASITE = 445
SKILL_AUTOAIM = 446
SKILL_KEEPER_HEART = 447
SKILL_GIER_II = 448
SKILL_DRONE_IN_T = 449
SKILL_EXPLOIT = 450
SKILL_EXPLOIT_BUG = 451
SKILL_VOR = 452
SKILL_MOTHER = 453
SKILL_PARASITOID_2 = 454
SKILL_PARASITOID_3 = 455
SKILL_FLIMSY = 456
SKILL_MOB_II = 457
SKILL_SSS = 458
SKILL_ANTIVOR = 459
SKILL_BADBUYER = 460
SKILL_SISUS_PRIME = 461
SKILL_AMULET_17 = 463
SKILL_NO_BALANCE = 464
SKILL_DEVOURER = 465
SKILL_ULTIMATE_TORMENT = 466
SKILL_LIVER_TRUE = 467
SKILL_COPPER = 468
SKILL_WORTHINESS5 = 469
SKILL_CASHBACK = 470
SKILL_M_CHAINS = 471





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
SKILLMOD_HP_PER_WAVE = 121
SKILLMOD_SP_PER_WAVE = 122
SKILLMOD_STAMINA_ADD = 123
SKILLMOD_STAMINA_USE = 124
SKILLMOD_C_USE = 125
SKILLMOD_RES_EFFECTIVNESS = 126
SKILLMOD_THROWER_DAMAGE = 127
SKILLMOD_DEBUFF_TIME = 128

local GOOD = "^"..COLORID_GREEN
local BAD = "^"..COLORID_RED
local NEUTRAL = "^"..COLORID_GRAY
local PURPLE = "^"..COLORID_PURPLE
--
local d = GM:AddSkill(SKILL_RESNYA, trs("skill_resnya"), GOOD..trs("skill_resnya_d1")..GOOD..trs("skill_resnya_d2"),
																22,			-6,					{SKILL_NONE}, TREE_RESNYA)
GM:AddSkillModifier(SKILL_RESNYA, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
d.DontUnlock = SKILL_OLD_GOD
d.DontUnlock2 = SKILL_DOSET
local d = GM:AddSkill(SKILL_DOSET, trs("skill_doset"), GOOD..trs("skill_doset_d1")..GOOD..trs("skill_doset_d2"),
																22,			-4,					{SKILL_NONE}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET, SKILLMOD_LUCK, 1)
d.DontUnlock = SKILL_OLD_GOD
d.DontUnlock2 = SKILL_RESNYA
local d = GM:AddSkill(SKILL_OLD_GOD, trs("skill_old_g"), GOOD..trs("skill_old_g_d1")..GOOD..trs("skill_old_g_d2"),
																22,			-2,					{SKILL_NONE}, TREE_OLD_GOD)
GM:AddSkillModifier(SKILL_OLD_GOD, SKILLMOD_M_DMG, 0.3)
GM:AddSkillModifier(SKILL_OLD_GOD, SKILLMOD_M_REG, 0.3)
d.DontUnlock = SKILL_DOSET
d.DontUnlock2 = SKILL_RESNYA


GM:AddSkill(SKILL_RESNYA1, trs("skill_resnya1"), GOOD..trs("skill_resnya1_d1")..GOOD..trs("skill_resnya1_d2"),
																24,			-6,					{SKILL_RESNYA}, TREE_RESNYA)
GM:AddSkill(SKILL_DOSET1, trs("skill_doset1"), GOOD..trs("skill_doset1_d1")..GOOD..trs("skill_doset1_d2"),
																24,			-4,					{SKILL_DOSET}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET1, SKILLMOD_ELEMENTAL_MUL, 0.1)
GM:AddSkill(SKILL_OLD_GOD1, trs("skill_old1_g"), GOOD..trs("skill_old_g1_d1")..GOOD..trs("skill_old_g1_d2"),
																24,			-2,					{SKILL_OLD_GOD}, TREE_OLD_GOD)

GM:AddSkill(SKILL_RESNYA2, trs("skill_resnya2"), GOOD..trs("skill_resnya2_d1")..BAD..trs("skill_resnya2_d2"),
																26,			-6,					{SKILL_RESNYA1}, TREE_RESNYA)
GM:AddSkillModifier(SKILL_RESNYA2, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.2)
GM:AddSkill(SKILL_DOSET2, trs("skill_doset2"), GOOD..trs("skill_doset2_d1")..BAD..trs("skill_doset2_d2"),
																26,			-4,					{SKILL_DOSET1}, TREE_DOSET)
GM:AddSkillModifier(SKILL_DOSET2, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)
GM:AddSkillModifier(SKILL_DOSET2, SKILLMOD_DMG_TAKEN, -0.1)
GM:AddSkill(SKILL_OLD_GOD2, trs("skill_old_g2"), GOOD..trs("skill_old_g2_d1")..BAD..trs("skill_old_g2_d2"),
																26,			-2,					{SKILL_OLD_GOD1}, TREE_OLD_GOD)
GM:AddSkillModifier(SKILL_OLD_GOD2, SKILLMOD_DAMAGE, -0.25)
-- Health Tree
GM:AddSkill(SKILL_STOIC1, trs("skill_stoici_0"), GOOD..trs("skill_stoici_d1")..BAD..trs("skill_stoici_d2"),
																-4,			-6,					{SKILL_NONE, SKILL_STOIC2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC2, trs("skill_stoicii_0"), GOOD..trs("skill_stoicii_d1")..BAD..trs("skill_stoicii_d2"),
																-4,			-4,					{SKILL_STOIC3, SKILL_VITALITY1, SKILL_REGENERATOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC3, trs("skill_stoiciii_0"), GOOD..trs("skill_stoiciii_d1")..BAD..trs("skill_stoiciii_d2"),
																-3,			-2,					{SKILL_STOIC4}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC4, trs("skill_stoiciv_0"), GOOD..trs("skill_stoiciv_d1")..BAD..trs("skill_stoiciv_d2"),
																-3,			0,					{SKILL_STOIC5}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STOIC5, trs("skill_stoicv_0"), GOOD..trs("skill_stoicv_d1")..BAD..trs("skill_stoicv_d2"),
																-3,			2,					{SKILL_BLOODARMOR, SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_HEMOPHILIA, trs("skill_hemoplilia_0"), GOOD..trs("skill_hemoplilia_d1")..GOOD..trs("skill_hemoplilia_d2")..BAD..trs("skill_hemoplilia_d3"),
																4,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GLUTTON,  trs("skill_glutton_0"), GOOD.. trs("skill_glutton_d1")..GOOD.. trs("skill_glutton_d2")..GOOD.. trs("skill_glutton_d3")..BAD.. trs("skill_glutton_d4"),
																3,			-2,					{SKILL_GOURMET, SKILL_BLOODARMOR}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_PREPAREDNESS, trs("skill_prepadnes_0"), GOOD..trs("skill_prepadnes_d"),
																4,			-6,					{SKILL_NONE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GOURMET, trs("skill_gurman_0"), GOOD..trs("skill_gurman_d1")..BAD..trs("skill_gurman_d2"),
																4,			-4,					{SKILL_PREPAREDNESS, SKILL_VITALITY1}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_HAEMOSTASIS, trs("skill_haemostasis_0"), GOOD..trs("skill_haemostasis_d1")..BAD..trs("skill_haemostasis_d2")..GOOD..trs("skill_haemostasis_d3"),
																4,			6,					{SKILL_STONEBLOOD,SKILL_LEUKEMIA}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_LEUKEMIA, trs("skill_leuke"), GOOD..trs("skill_leuke_d2")..BAD..trs("skill_leuke_d1"),
																4,			7,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_X_GEN, trs("skill_x_gen"), GOOD.."+45"..trs("barmor")..BAD..trs("skill_x_gen_d1"),
																2,			7,					{SKILL_LEUKEMIA}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_STONEBLOOD, trs("skill_stoneblood"), GOOD..trs("skill_stoneblood_d1"),
																4,			5,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLETTER, trs("skill_bloodlet_0"), GOOD..trs("skill_bloodlet_d1")..BAD..trs("skill_bloodlet_d2"),
																0,			4,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_REGENERATOR, trs("skill_regen_0"), GOOD..trs("skill_regen_d1")..BAD..trs("skill_regen_d2"),
																-5,			-2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_NULLED, trs("skill_regen1_0"), GOOD..trs("skill_regen1_d1"),
			                                                   	-5,			0,					{SKILL_REGENERATOR}, TREE_HEALTHTREE)
.Hidden = true	
GM:AddSkill(SKILL_BLOODARMOR, trs("skill_bloodarmor_0"), GOOD..trs("skill_bloodarmor_d1") ..BAD..trs("skill_bloodarmor_d2"),
																2,			2,					{SKILL_IRONBLOOD, SKILL_BLOODLETTER, SKILL_D_HEMOPHILIA}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_IRONBLOOD, trs("skill_ironblood_0"), GOOD..trs("skill_ironblood_d1") ..GOOD..trs("skill_ironblood_d2") ..BAD..trs("skill_ironblood_d3"),
																2,			4,					{SKILL_HAEMOSTASIS, SKILL_CIRCULATION}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_D_WEAKNESS, trs("skill_d_weakness_0"), GOOD..trs("skill_d_weakness_d1")..GOOD..trs("skill_d_weakness_d2")..BAD..trs("skill_d_weakness_d3")..BAD..trs("skill_d_weakness_d4"),
																1,			-1,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY1, trs("skill_vitalityi_0"), GOOD..trs("skill_vitalityi_d1"),
																0,			-4,					{SKILL_VITALITY2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY2, trs("skill_vitalityii_0"), GOOD..trs("skill_vitalityii_d1"),
																0,			-2,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_VITALITY3, trs("skill_vitalityiii_0"), GOOD..trs("skill_vitalityiii_d1"),
																0,			-0,					{SKILL_D_WEAKNESS}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODBUFF, trs("skill_bbuff"), GOOD..trs("skill_bbuff_d1")..BAD.."-20"..trs("barmor"),
																-1,			1,					{SKILL_VITALITY3}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.25)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.25)
GM:AddSkillModifier(SKILL_BLOODBUFF, SKILLMOD_BLOODARMOR, -20)
GM:AddSkill(SKILL_DEBUFF, trs("skill_dbuff"), BAD..trs("skill_dbuff_d1")..GOOD.."+60"..trs("barmor"),
																-1.50,			0,					{SKILL_BLOODBUFF}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, 0.50)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, 0.75)
GM:AddSkillModifier(SKILL_DEBUFF, SKILLMOD_BLOODARMOR, 60)
GM:AddSkill(SKILL_CHEESE, trs("skill_cheese_0"), GOOD..trs("skill_cheese_d1"),
																1,			1,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE2, trs("skill_cheese_0").." II", GOOD..trs("skill_cheese_d2"),
																0,			1,					{SKILL_CHEESE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE3, trs("skill_cheese_0").." III", GOOD..trs("skill_cheese_d3"),
																0,			3,					{SKILL_CHEESE2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CHEESE_PIE, trs("skill_cheesepie"), GOOD.."+7"..trs("barmor"),
																-2,			3,					{SKILL_CHEESE3}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_CHEESE_PIE, SKILLMOD_BLOODARMOR, 7)
GM:AddSkill(SKILL_TANKER, trs("skill_tanker_0"), GOOD..trs("skill_tanker_d1")..BAD..trs("skill_tanker_d2"),
																-5,			4,					{SKILL_LIVER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ABSOLUTE, trs("skill_abs"), trs("skill_abs_d"),
																-5,			3,					{SKILL_TANKER}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_LIVER,  trs("skill_curse_0"), BAD..trs("skill_curse_d1")..GOOD..trs("skill_curse_d2")..GOOD..trs("skill_curse_d3")..GOOD.."+30"..trs("worth"),
																-5,			5,					{}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_HEALTH, 30)
GM:AddSkillModifier(SKILL_LIVER, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_LIVER_TRUE,  trs("skill_live"), BAD.."-65"..trs("health")..GOOD..trs("skill_live_d2"),
																-5,			6,					{SKILL_LIVER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_LIVER_TRUE, SKILLMOD_HP_PER_WAVE,15)
GM:AddSkillModifier(SKILL_LIVER_TRUE, SKILLMOD_HEALTH,-65)

GM:AddSkill(SKILL_FORAGER, trs("skill_f_0"), GOOD..trs("skill_f_d1")..BAD..trs("skill_f_d2"),
																5,			-2,					{SKILL_GOURMET}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_JUSTICE, trs("skill_justice"), GOOD.."-8%"..trs("res_delay"),
																6,			-1,					{SKILL_FORAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_JUSTICE, SKILLMOD_RESUPPLY_DELAY_MUL, -0.08)
GM:AddSkill(SKILL_JUSTICE_2, trs("skill_justice2"), GOOD.."+9%"..trs("res_ammo")..BAD.."+10%"..trs("res_delay"),
																6,			0,					{SKILL_JUSTICE}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_JUSTICE_2, SKILLMOD_RESUPPLY_DELAY_MUL, 0.1)	
GM:AddSkillModifier(SKILL_JUSTICE_2, SKILLMOD_RES_AMMO_MUL, 0.09)			
GM:AddSkill(SKILL_SUGARRUSH, trs("skill_srush_0"), GOOD..trs("skill_srush_d1")..BAD..trs("skill_srush_d2"),
																4,			0,					{SKILL_GOURMET,SKILL_HYPERCOAGULATION}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_HYPERCOAGULATION, trs("skill_hp_cog"), GOOD..trs("skill_hp_cog_d1")..BAD..trs("skill_hp_cog_d2"),
																4,			1,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION, trs("skill_cir_0"), GOOD..trs("skill_cir_d1"),
																4,			4,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION1, trs("skill_cir_0").." II", GOOD.."+3"..trs("barmor"),
																6,			6,					{SKILL_CIRCULATION,SKILL_CIRCULATION2}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_CIRCULATION2, trs("skill_cir_0").." III", GOOD.."+3"..trs("barmor"),
																4,			8,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_SANGUINE, trs("skill_san_0"), GOOD..trs("skill_san_d1")..BAD..trs("skill_san_d2"),
																6,			2,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODYMAN, trs("skill_bloodyman"), GOOD.."+130"..trs("barmor")..BAD.."-100"..trs("health"),
																7,			3,					{SKILL_SANGUINE}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_MADNESS, trs("skill_madness"), GOOD..trs("skill_madness_d1")..BAD..trs("skill_madness_d2"),
																7,			4,					{SKILL_BLOODYMAN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_GIER_II, trs("skill_gir"), GOOD..trs("skill_gir_d2")..BAD..trs("skill_gir_d1"),
																7,			5,					{SKILL_MADNESS}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_ANTIGEN, trs("skill_agen_0"), GOOD..trs("skill_agen_d1")..BAD..trs("skill_agen_d2"),
																-2,			4,					{}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_DAMAGER, trs("skill_bhealth_0"), GOOD..trs("skill_bhealth_d1")..BAD..trs("skill_bhealth_d2"),
																-2,			5,					{SKILL_ANTIGEN}, TREE_HEALTHTREE)
GM:AddSkill(SKILL_BLOODLIFE, trs("skill_blife_0"), GOOD.."+50"..trs("barmor")..BAD.."-60"..trs("health")..NEUTRAL..trs("skill_blife_d1"),
																-2,			6,					{SKILL_DAMAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_HEALTH, -60)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_BLOODARMOR, 50)
GM:AddSkillModifier(SKILL_BLOODLIFE, SKILLMOD_MELEE_DAMAGE_MUL, -0.25)
GM:AddSkill(SKILL_CAN_EATER, trs("skill_cani_0"), BAD.."-33"..trs("health")..GOOD..trs("skill_cani_d1"),
																0,			5,					{SKILL_DAMAGER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_CAN_EATER, SKILLMOD_HEALTH, -33)
GM:AddSkill(SKILL_KEEPER_HEART, trs("skill_k_heart"), BAD.."-33"..trs("health")..GOOD..trs("skill_k_heart_d1"),
																1,			6,					{SKILL_CAN_EATER}, TREE_HEALTHTREE)
GM:AddSkillModifier(SKILL_KEEPER_HEART, SKILLMOD_HEALTH, -33)
-- Speed Tree
GM:AddSkill(SKILL_SPEED1, trs("skill_speed").."I", GOOD.."+5"..trs("speed")..BAD.."-4"..trs("health"),
																-4,			6,					{SKILL_NONE, SKILL_SPEED2}, TREE_SPEEDTREE)
SKILL_DODGE = 263
GM:AddSkill(SKILL_DODGE, trs("skill_dodge"), GOOD..trs("skill_dodge_d1")..GOOD..trs("skill_dodge_d2")..BAD.."-25"..trs("speed"),
																-3,			1,					{SKILL_SPEED2}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_DODGE, SKILLMOD_SPEED, -25)

GM:AddSkill(SKILL_SPEED2, trs("skill_speed").."II", GOOD.."+5"..trs("speed")..BAD.."-7"..trs("health"),
																-4,			4,					{SKILL_SPEED3, SKILL_PHASER, SKILL_SPEED2, SKILL_U_CORRUPTEDFRAGMENT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED3, trs("skill_speed").."III", GOOD.."+6"..trs("speed")..BAD.."-6"..trs("health"),
																-4,			2,					{SKILL_SPEED4}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED4, trs("skill_speed").."IV", GOOD.."+11"..trs("speed")..BAD.."-8"..trs("health"),
																-4,			0,					{SKILL_SPEED5, SKILL_SAFEFALL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SPEED5, trs("skill_speed").."V", GOOD.."+10"..trs("speed")..BAD.."-11"..trs("health"),
																-4,			-2,					{SKILL_ULTRANIMBLE, SKILL_BACKPEDDLER, SKILL_MOTIONI, SKILL_CARDIOTONIC, SKILL_UNBOUND}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEI, trs("skill_agile").."I", GOOD.."+4%"..trs("jump")..BAD.."-2"..trs("speed"),
																4,			6,					{SKILL_NONE, SKILL_AGILEII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEII, trs("skill_agile").."II", GOOD.."+5%"..trs("jump")..BAD.."-3"..trs("speed"),
																4,			2,					{SKILL_AGILEIII, SKILL_WORTHINESS3}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_AGILEIII, trs("skill_agile").."III", GOOD.."+6%"..trs("jump")..BAD.."-4"..trs("speed"),
																4,			-2,					{SKILL_SAFEFALL, SKILL_ULTRANIMBLE, SKILL_SURESTEP, SKILL_INTREPID, SKILL_VKID, SKILL_NOSEE}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_VKID, trs("skill_vkid"), GOOD.."+30%"..trs("jump")..GOOD.."+60"..trs("speed")..GOOD..trs("skill_vkid_d")..BAD.."-50"..trs("health"),
																4,			-3,					{SKILL_VKID2}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_VKID2, trs("skill_vkid2"), GOOD.."+30%"..trs("jump")..GOOD.."+15"..trs("speed")..GOOD..trs("skill_vkid_d")..BAD.."-65"..trs("health"),
																4,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_SLOW, trs("skill_slow"), GOOD..trs("skill_slow_d1")..GOOD..trs("skill_slow_d2")..BAD..trs("skill_slow_d3")..BAD..trs("skill_slow_d4"),
																0,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_NOSEE, trs("skill_cursevision_0"), GOOD..trs("skill_cursevision_d1")..GOOD..trs("skill_cursevision_d2")..BAD..trs("skill_cursevision_d3"),
																6.5,			-2,					{SKILL_AGILEIII}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_SPEED, 50)
GM:AddSkillModifier(SKILL_NOSEE, SKILLMOD_WORTH, 30)
GM:AddSkill(SKILL_MOTIONI, trs("skill_motion1"), GOOD..trs("skill_motion_d_all"),
																-2,			-2,					{SKILL_MOTIONII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONII, trs("skill_motion2"), GOOD..trs("skill_motion_d_all"),
																-1,			-1,					{SKILL_MOTIONIII}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_MOTIONIII, trs("skill_motion3"), GOOD..trs("skill_motion_d_all"),
																0,			-2,					{SKILL_D_SLOW}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_BACKPEDDLER, trs("skill_backpeddler"), GOOD..trs("skill_backpeddler_d1")..BAD..trs("skill_backpeddler_d2")..BAD..trs("skill_backpeddler_d3"),
																-6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CRESCENDO1, trs("skill_crescendo").."I", GOOD.."+4 "..trs("hp_per_wave")..BAD.."-3 "..trs("sp_per_wave"),
																-6,			1,					{SKILL_BACKPEDDLER}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CRESCENDO2, trs("skill_crescendo").."II", GOOD.."+4 "..trs("hp_per_wave")..BAD.."-4 "..trs("sp_per_wave"),
																-6,			2,					{SKILL_CRESCENDO1}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ANTIVOR, trs("skill_antivor"), GOOD..trs("skill_antivor_d1")..BAD..trs("skill_antivor_d2"),
																-8,			1,					{SKILL_CRESCENDO2}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CRESCENDO3, trs("skill_crescendo").."III", GOOD.."+4 "..trs("hp_per_wave")..BAD.."-2 "..trs("sp_per_wave"),
																-6,			3,					{SKILL_CRESCENDO2,SKILL_SAUL_GOODMAN}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SAUL_GOODMAN, trs("skill_saul_goodman"), GOOD..trs("skill_saul_goodman_d1")..BAD.."-4%"..trs("xpmul"),
																-6,			4,					{SKILL_CRESCENDO2}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_SAUL_GOODMAN, SKILLMOD_XP, -0.04)
GM:AddSkill(SKILL_GREEDNESS, trs("skill_greedy"), GOOD..trs("skill_greedy_d1")..BAD.."-33%"..trs("p_mul"),
																-5,			3.5,					{SKILL_CRESCENDO2}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_GREEDNESS, SKILLMOD_POINT_MULTIPLIER, -0.33)
GM:AddSkill(SKILL_PHASER, trs("skill_phaser"), GOOD.."+15%"..trs("barricadespeed")..BAD.."+15%"..trs("sigilteleport"),
																-1,			4,					{SKILL_D_WIDELOAD, SKILL_DRIFT}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_LAST_MAN, trs("skill_last_man"), GOOD..trs("skill_last_man_d1")..BAD..trs("skill_last_man_d2"),
																-2,			5,					{SKILL_PHASER}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_DRIFT, trs("skill_drifter"), GOOD.."+5%"..trs("barricadespeed"),
																1,			3,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_WARP, trs("skill_warp"), GOOD.."-5%"..trs("sigilteleport"),
																2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SIGILOL, trs("skill_s_inf"), GOOD.."+300%"..trs("barricadespeed")..BAD.."+100%"..trs("sigilteleport"),
																2,			4,					{SKILL_WARP}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDTRINKETS, trs("skill_cursedd"), GOOD..trs("skill_cursed")..BAD..trs("skill_cursed")..GOOD..trs("skill_cursed"),
																2,		    5,					{SKILL_SIGILOL}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CURSEDHEALTH, trs("skill_mda"), GOOD..trs("skill_mda_d")..BAD.."-25%"..trs("m_curse"),
																1,		    4.5,					{SKILL_CURSEDTRINKETS}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_OMEGA, trs("skill_omega"), BAD..trs("skill_omega_d1")..GOOD.."+50%"..trs("m_curse"),
																0,		    5,					{SKILL_CURSEDHEALTH}, TREE_SPEEDTREE)






GM:AddSkill(SKILL_SAFEFALL, trs("skill_sfall"), GOOD..trs("skill_sfall_d1")..GOOD..trs("skill_sfall_d2")..BAD..trs("skill_sfall_d3"),
																0,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_D_WIDELOAD, trs("skill_wideroad_0"), GOOD.."+20"..trs("worth")..GOOD.."-20%"..trs("res_delay")..BAD..trs("skill_wideroad_d1"),
																1,			1,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_U_CORRUPTEDFRAGMENT, trs("skill_sigil_corrupt_0"), GOOD..trs("skill_sigil_corrupt_d0"),
																-2,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ULTRANIMBLE, trs("skill_salostealer"), GOOD.."+30"..trs("speed")..BAD.."-10"..trs("health"),
																0,			-6,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_POGO, trs("skill_pogo"), trs("skill_pogo_d1")..GOOD..trs("skill_pogo_d2")..BAD.."-45%"..trs("jump"),
																0,			-7,					{SKILL_ULTRANIMBLE}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_POGO, SKILLMOD_JUMPPOWER_MUL, -0.45)
GM:AddSkill(SKILL_WORTHINESS3, trs("worthness").."III", GOOD.."+10"..trs("worth")..BAD.."-6"..trs("start_points"),
																6,			2,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SURESTEP, trs("skill_step_0"), GOOD..trs("skill_step_d0")..BAD.."-4"..trs("speed"),
																6,			0,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_INTREPID, trs("skill_int_0"), GOOD..trs("skill_int_d0")..BAD.."-4"..trs("speed"),
																6,			-4,					{SKILL_ROBUST}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_ROBUST,  trs("skill_rob_0"), GOOD.. trs("skill_rob_d0"),
																5,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_CARDIOTONIC,trs("skill_cardi_0"), GOOD..trs("skill_cardi_d0")..BAD.."-12"..trs("speed")..BAD..trs("skill_cardi_d1"),
																-6,			-4,					{}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_UNBOUND,trs("skill_unbound_0"), GOOD..trs("skill_unbound_d0")..BAD.."-4"..trs("speed"),
																-4,			-4,					{SKILL_SLOWCOACH}, TREE_SPEEDTREE)
GM:AddSkill(SKILL_SLOWCOACH,trs("skill_scoach"), GOOD..trs("skill_scoach_d1")..BAD.."-8"..trs("speed"),
																-4,			-5,					{}, TREE_SPEEDTREE)
GM:AddSkillModifier(SKILL_SLOWCOACH, SKILLMOD_SPEED,-8)
-- Medic Tree
GM:AddSkill(SKILL_SURGEON1, trs("skill_surg").."I", GOOD.."-6%"..trs("med_cool"),
																-4,			6,					{SKILL_NONE, SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEON2, trs("skill_surg").."II", GOOD.."-9%"..trs("med_cool"),
																-3,			3,					{SKILL_WORTHINESS4, SKILL_SURGEON3}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_COOL_MED, trs("skill_cool_med"), GOOD..trs("skill_cool_med_d1")..BAD.."-25%"..trs("med_effect"),
																-1,			3,					{SKILL_SURGEON2}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_FLOWER, trs("skill_flower"), GOOD..trs("skill_flower_d1")..BAD..trs("skill_flower_d2"),
																-1,			1,					{SKILL_COOL_MED}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_HEALMODULE, trs("skill_hmod"), GOOD..trs("skill_hmod_d1"),
																-1,			-0.5,					{SKILL_FLOWER}, TREE_SUPPORTTREE)
GM:AddSkillModifier(SKILL_FLOWER, SKILLMOD_POINT_MULTIPLIER, -0.25)
local d = GM:AddSkill(SKILL_ABYSSFLOWER, trs("skill_aflower"), GOOD..trs("skill_aflower_d1")..BAD..trs("skill_aflower_d2"),
																-1,			0.5,					{SKILL_FLOWER}, TREE_SUPPORTTREE)
--d.Disabled = true
GM:AddSkill(SKILL_SURGEON3, trs("skill_surg").."III", GOOD.."-11%"..trs("med_cool"),
																-2,			0,					{SKILL_U_MEDICCLOUD, SKILL_D_FRAIL, SKILL_SURGEONIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SURGEONIV, trs("skill_surg").."IV", GOOD.."-21%"..trs("med_cool"),
																-2,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYI, trs("skill_bio").."I", GOOD.."+8%"..trs("med_effect"),
																4,			6,					{SKILL_NONE, SKILL_BIOLOGYII}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYII, trs("skill_bio").."II", GOOD.."+13%"..trs("med_effect"),
																3,			3,					{SKILL_BIOLOGYIII, SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIII, trs("skill_bio").."III", GOOD.."+18%"..trs("med_effect"),
																2,			0,					{SKILL_U_MEDICCLOUD, SKILL_U_ANTITODESHOT, SKILL_BIOLOGYIV}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_BIOLOGYIV, trs("skill_bio").."IV", GOOD.."+21%"..trs("med_effect"),
																2,			-3,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_D_FRAIL,  trs("skill_frail"), GOOD.."-33%"..trs("med_cool")..GOOD.."+33%"..trs("med_effect")..BAD..trs("skill_frail_d1"),
																-4,			-2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_MEDICBOOSTER,  trs("skill_boostermed"), BAD.."+33%"..trs("med_cool")..GOOD..trs("skill_boostermed_d1"),
																-4,			-3,					{SKILL_D_FRAIL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_M_CHAINS,  trs("skill_medchains"), BAD.."+25%"..trs("med_cool")..GOOD..trs("skill_medchains_d1"),
																-4,			-4,					{SKILL_MEDICBOOSTER}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_MEDICCLOUD, trs("skill_u_medcloud"), GOOD..trs("skill_u_medcloud_d1"),
																0,			-2,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_DUALHEAL, trs("skill_dualheal"), GOOD..trs("skill_dualheal_d1")..BAD..trs("skill_dualheal_d2"),
																-1,			-3,					{SKILL_U_MEDICCLOUD}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_FOODHEALS, trs("skill_fheals"), GOOD..trs("skill_fheals_d1")..BAD..trs("skill_fheals_d2"),
																-2,			-4,					{SKILL_DUALHEAL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_SMARTTARGETING, trs("skill_starget"), GOOD..trs("skill_starget_d1")..BAD..trs("skill_starget_d2")..BAD..trs("skill_starget_d3"),
																0,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_RECLAIMSOL, trs("skill_rec_sol"), GOOD..trs("skill_rec_sol_d1")..BAD..trs("skill_rec_sol_d2")..BAD..trs("skill_rec_sol_d3")..BAD..trs("skill_rec_sol_d4"),
																0,			4,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_STRENGTHSHOT, trs("skill_sshot"), GOOD..trs("skill_sshot_d1"),
																0,			0,					{SKILL_SMARTTARGETING}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_WORTHINESS4, trs("worthness").."IV", GOOD.."+10"..trs("worth")..BAD.."-6"..trs("start_points"),
																-5,			2,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_U_ANTITODESHOT, trs("skill_u_antidote"), GOOD..trs("skill_u_antidote_d1"),
																4,			-2,					{SKILL_PREMIUM}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_PREMIUM, trs("skill_premium"), GOOD..trs("skill_premium_d1")..BAD..trs("skill_premium_d2"),
																3,			-3,					{SKILL_PACIFISMIUM}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_PACIFISMIUM, trs("skill_paci"), GOOD..trs("skill_paci_d1")..BAD..trs("skill_paci_d2"),
																3,			-4,					{SKILL_ANTIVOR}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_DISPERSION, trs("skill_disp"), GOOD..trs("skill_disp_d1")..BAD..trs("skill_disp_d2"),
																0,			-4,					{}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_COMBOHEAL, trs("skill_comboheal"), GOOD..trs("skill_comboheal_d1")..BAD..trs("skill_comboheal_d2"),
																0,			-5,					{SKILL_DISPERSION}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_PHIK, trs("skill_phik"), GOOD..trs("skill_phik_d1")..BAD..trs("skill_phik_d2"),
																-2,			-5,					{SKILL_COMBOHEAL}, TREE_SUPPORTTREE)
--.Disabled = true
GM:AddSkill(SKILL_FOREVERALONE, trs("skill_foreveralone"), GOOD..trs("skill_foreveralone_d1")..BAD..trs("skill_foreveralone_d2"),
																-1,			-6,					{SKILL_COMBOHEAL}, TREE_SUPPORTTREE)
GM:AddSkill(SKILL_WYRDREC, trs("skill_wyrdrec"), GOOD..trs("skill_wyrdrec_d1")..BAD..trs("skill_wyrdrec_d2"),
																-2,			-7,					{SKILL_FOREVERALONE}, TREE_SUPPORTTREE)
--.DontUnlock = SKILL_HANDY1

-- Defence Tree
GM:AddSkill(SKILL_HANDY1, trs("skill_handy").."I", GOOD.."+5%"..trs("repair"),
																-5,			-6,					{SKILL_NONE, SKILL_HANDY2}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY2, trs("skill_handy").."II", GOOD.."+6%"..trs("repair"),
																-5,			-4,					{SKILL_HANDY3, SKILL_U_BLASTTURRET, SKILL_LOADEDHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY3, trs("skill_handy").."III", GOOD.."+8%"..trs("repair"),
																-5,			-1,					{SKILL_TAUT, SKILL_HAMMERDISCIPLINE, SKILL_D_NOODLEARMS, SKILL_HANDY4}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HANDY4, trs("skill_handy").."IV", GOOD.."+11%"..trs("repair"),
																-3,			1,					{SKILL_HANDY5,SKILL_SKYHELP}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_SKYHELP, trs("skill_skyhelp"), GOOD.."+40"..trs("start_points")..GOOD.."-10%"..trs("sale")..BAD..trs("skill_skyhelp_d1"),
																-1,			2,					{SKILL_HANDY4}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_CASHBACK, trs("skill_cashback"), GOOD..trs("skill_cashback_d1")..BAD.."+20%"..trs("sale"),
																-1,			3,					{SKILL_SKYHELP}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_CASHBACK, SKILLMOD_ARSENAL_DISCOUNT, 0.20)
GM:AddSkill(SKILL_HANDY5, trs("skill_handy").."V", GOOD.."+13%"..trs("repair"),
																-4,			3,					{SKILL_OVERHAND}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_OVERHAND, trs("skill_ohandy"), GOOD.."+25%"..trs("repair")..BAD.."+15%"..trs("hammerd"),
																-3,			4,					{SKILL_HANDY5}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE, trs("skill_h_disp").."I", GOOD.."-5%"..trs("hammerd"),
																0,			1,					{SKILL_BARRICADEEXPERT}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE1, trs("skill_h_disp").."II", GOOD.."-10%"..trs("hammerd"),
																0,			0,					{SKILL_HAMMERDISCIPLINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAMMERDISCIPLINE2, trs("skill_h_disp").."III", GOOD.."-15%"..trs("hammerd"),
																0,			-1,					{SKILL_HAMMERDISCIPLINE1}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BARRICADEEXPERT, trs("skill_rein"), GOOD..trs("skill_rein_d1")..GOOD..trs("skill_rein_d2")..BAD.."+20%"..trs("hammerd"),
																0,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_LOADEDHULL, trs("skill_l_hull"), GOOD..trs("skill_l_hull_d1")..BAD..trs("skill_l_hull_d2"),
																-2,			-4,					{SKILL_REINFORCEDHULL, SKILL_REINFORCEDBLADES, SKILL_AVIATOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDHULL, trs("skill_r_hull"), GOOD..trs("skill_r_hull_d1")..BAD..trs("skill_r_hull_d2")..BAD..trs("skill_r_hull_d3"),
																-2,			-2,					{SKILL_STABLEHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BARA_CURSED, trs("skill_baracurse"), GOOD..trs("skill_baracurse_d1")..BAD..trs("skill_baracurse_d2"),
																-2,			-0.5,					{SKILL_REINFORCEDHULL,SKILL_BLOODHACK}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BLOODHACK, trs("skill_bloodhack"), GOOD..trs("skill_bloodhack_d1")..BAD..trs("skill_bloodhack_d2"),
																-2,			0,					{SKILL_REINFORCEDHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STABLEHULL, trs("skill_s_hull"), GOOD..trs("skill_s_hull_d1")..BAD..trs("skill_r_hull_d3"),
																0,			-3,					{SKILL_U_DRONE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_EXPLOIT, trs("skill_exploit"), GOOD..trs("skill_exploit_d1")..BAD..trs("skill_exploit_d2"),
																0,			-4,					{SKILL_STABLEHULL}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_EXPLOIT_BUG, trs("skill_exploit_bug"), GOOD..trs("skill_exploit_bug_d1")..BAD..trs("skill_exploit_bug_d2"),
																1,			-4.5,					{SKILL_EXPLOIT}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_REINFORCEDBLADES, trs("skill_r_blade"), GOOD..trs("skill_r_blade_d1")..BAD..trs("skill_r_blade_d2"),
																0,			-5,					{SKILL_MECHANIC}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_MECHANIC, trs("skill_mech"), GOOD.."-15%"..trs("s_cost")..BAD.."-15%"..trs("sale"),
																0,			-6,					{SKILL_MOTHER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_MOTHER, trs("skill_moab"), GOOD..trs("skill_moab_d1")..BAD.."+15%"..trs("s_cost"),
																0,			-7,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_AVIATOR, trs("skill_avi"), GOOD..trs("skill_avi_d1")..BAD..trs("skill_avi_d2"),
																-4,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_BLASTTURRET, trs("skill_u_blast"), GOOD..trs("skill_u_blast_d1"),
																-8,			-4,					{SKILL_TURRETLOCK, SKILL_TWINVOLLEY, SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TURRETLOCK, trs("skill_blockturret"), trs("skill_blockturret_d1")..BAD..trs("skill_blockturret_d2"),
																-6,			-2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TWINVOLLEY, trs("skill_t_vol"), GOOD..trs("skill_t_vol_d1")..BAD..trs("skill_t_vol_d2")..BAD..trs("skill_t_vol_d3"),
																-10,		-5,					{SKILL_DRONE_IN_T}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_DRONE_IN_T, trs("skill_drone_t"), GOOD..trs("skill_drone_t_d1")..BAD..trs("skill_drone_t_d2"),
																-11,		-4,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TURRETOVERLOAD, trs("skill_t_over"), GOOD..trs("skill_t_over_d1")..BAD..trs("skill_t_over_d2"),
																-8,			-2,					{SKILL_INSTRUMENTS}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_DRONE, trs("skill_u_pulse_drone"), GOOD..trs("skill_u_pulse_d1"),
																2,			-3,					{SKILL_HAULMODULE, SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_NANITECLOUD, trs("skill_nanite_r"), GOOD.."+12%"..trs("repair"),
																3,			1,					{SKILL_HAMMERDISCIPLINE,SKILL_JEW}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkillModifier(SKILL_NANITECLOUD, SKILLMOD_REPAIRRATE_MUL, 0.12)
SKILL_JEW = 237
GM:AddSkill(SKILL_JEW, trs("skill_jew"), GOOD..trs("skill_jew_d1")..GOOD..trs("skill_jew_d2")..BAD..trs("skill_jew_d3"),
																3,			2,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
																
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_ARSENAL_DISCOUNT, -0.10)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_SCRAPDISCOUNT, -0.10)
GM:AddSkillModifier(SKILL_JEW, SKILLMOD_RES_AMMO_MUL, 0.15)
GM:AddSkillModifier(SKILL_SAMODOS, SKILLMOD_SCRAPDISCOUNT, -0.25)


GM:AddSkill(SKILL_GENIUS, trs("skill_genius"), GOOD..trs("skill_genius_d1")..BAD..trs("skill_genius_d2"),
																3,			4,					{SKILL_JEW}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_FIELDAMP, trs("skill_field_amp"), GOOD..trs("skill_field_amp_d1")..BAD..trs("skill_field_amp_d2"),
																6,			4,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_TECHNICIAN, trs("skill_field_tech"), GOOD..trs("skill_field_tech_d1")..GOOD..trs("skill_field_tech_d2"),
																4,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROLLERMINE, trs("skill_u_rmine"), GOOD..trs("skill_u_rmine_d1"),
																3,			-5,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_HAULMODULE, trs("skill_u_hdrone"), GOOD..trs("skill_u_hdrone_d1"),
																2,			-1,					{SKILL_NANITECLOUD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_SAMODOS, trs("skill_samodos"), GOOD..trs("skill_samodos_d1")..BAD..trs("skill_samodos_d2"),
																2,			3,					{SKILL_NANITECLOUD,SKILL_DEVOURER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_COPPER, trs("skill_copper"), GOOD..trs("skill_copper_d1")..BAD.."+9%"..trs("sale"),
																4,			5,					{SKILL_DEVOURER}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_COPPER, SKILLMOD_ARSENAL_DISCOUNT, 0.09)
GM:AddSkill(SKILL_DEVOURER, trs("skill_devo"), GOOD..trs("skill_devo_d1")..BAD..trs("skill_devo_d2"),
																2,			5,					{}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_DEVOURER, SKILLMOD_C_USE, 0.5)
GM:AddSkill(SKILL_LIGHTCONSTRUCT, trs("skill_light_c"), GOOD..trs("skill_light_c_d1")..BAD..trs("skill_light_c_d2"),
																8,			-1,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOCKPILE, trs("skill_stock2"), GOOD..trs("skill_stock2_d1")..BAD..trs("skill_stock2_d2"),
																8,			-3,					{SKILL_FREEAMMO}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_FREEAMMO, trs("skill_f_ammo"), GOOD..trs("skill_f_ammo_d1"),
																9,			-4,					{SKILL_STOCKPILE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_VOR, trs("skill_vor"), GOOD..trs("skill_vor_d1")..BAD..trs("skill_vor_d2"),
																9,			-2,					{SKILL_FREEAMMO}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_ACUITY, trs("skill_vision_ammo"), GOOD..trs("skill_vision_ammo_d1"),
																6,			-3,					{SKILL_INSIGHT, SKILL_STOCKPILE, SKILL_U_CRAFTINGPACK, SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_VISION, trs("skill_vision_r"), GOOD..trs("skill_vision_r_d1"),
																6,			-6,					{SKILL_NONE, SKILL_ACUITY}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ROCKETTURRET, trs("skill_u_rturret"), GOOD..trs("skill_u_rturret_d1"),
																-8,			-0,					{SKILL_TURRETOVERLOAD}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSIGHT, trs("skill_vision_ar"), BAD.."+2%"..trs("sale")..GOOD..trs("skill_vision_ar_d1"),
																6,			-0,					{SKILL_NANITECLOUD, SKILL_U_ZAPPER_ARC, SKILL_LIGHTCONSTRUCT, SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_ZAPPER_ARC, trs("skill_u_arc_z"), GOOD..trs("skill_u_arc_z_d1"),
																6,			2,					{SKILL_FIELDAMP, SKILL_TECHNICIAN}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_D_LATEBUYER, trs("skill_d_lbuyer"), GOOD.."+30"..trs("worth")..GOOD.."-10%"..trs("sale")..BAD..trs("skill_d_lbuyer_d1"),
																8,			1,					{SKILL_HAMMERDOOR}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BADBUYER, trs("skill_bbuyer"), GOOD.."+100"..trs("worth")..GOOD.."-9%"..trs("sale")..BAD.."-900"..trs("start_points"),
																9,			0,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_BADBUYER, SKILLMOD_WORTH, 100)
GM:AddSkillModifier(SKILL_BADBUYER, SKILLMOD_ARSENAL_DISCOUNT, -0.09)
GM:AddSkill(SKILL_HAMMERDOOR, trs("skill_dd_3"), GOOD..trs("skill_dd_3_d1")..BAD.."+10%"..trs("hammerd"),
																8,			3,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_HAMMERDOOR, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.10)
GM:AddSkill(SKILL_CARRIER, trs("skill_carrier"), GOOD..trs("skill_carrier_d1")..BAD..trs("skill_carrier_d2")..BAD..trs("skill_carrier_d3"),
																9,			2,					{SKILL_D_LATEBUYER}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_U_CRAFTINGPACK, trs("skill_u_craftpack"), GOOD..trs("skill_u_craftpack_d1"),
																4,			-1,					{}, TREE_BUILDINGTREE)
.AlwaysActive = true
GM:AddSkill(SKILL_TAUT, trs("skill_taut"), GOOD.. trs("skill_taut_d1")..BAD.. trs("skill_taut_d2"),
																-5,			3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_D_NOODLEARMS, trs("skill_noodle"), GOOD.."+10"..trs("worth")..GOOD..trs("skill_noodle_d1")..GOOD.."+35%"..trs("repair")..BAD..trs("skill_noodle_d2"),
																-7,			2,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_INSTRUMENTS, trs("skill_instruments"), GOOD..trs("skill_instruments_d1"),
																-10,		-3,					{}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_STOWAGE, 	trs("skill_stowage"), GOOD..trs("skill_stowage_d1")..BAD..trs("skill_stowage_d2"),
																4,			-3,					{SKILL_NANITES}, TREE_BUILDINGTREE)
SKILL_NANITES = 241
GM:AddSkill(SKILL_NANITES, 	trs("skill_nanite_r"), GOOD..trs("skill_nanite_buff")..BAD.."-10%"..trs("repair"),
																4,			-4,					{SKILL_STOWAGE,SKILL_THE_CADER }, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_THE_CADER, 	trs("skill_cader_r"), BAD..trs("skill_cader_buff")..GOOD.."+50%"..trs("repair"),
																4,			-4.5,					{SKILL_STOWAGE}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_NANITES, SKILLMOD_REPAIRRATE_MUL, -0.10)
GM:AddSkillModifier(SKILL_THE_CADER, SKILLMOD_REPAIRRATE_MUL, 0.50)
GM:AddSkill(SKILL_FOLGA, trs("skill_foil"), GOOD..trs("skill_foil_d1"),
																4,			-5.5,					{SKILL_U_ROLLERMINE}, TREE_BUILDINGTREE)
GM:AddSkill(SKILL_BLESSEDROD, trs("skill_brod"), GOOD..trs("skill_brod_d1")..GOOD.."+15%"..trs("m_curse")..BAD.."+6%"..trs("meleedamagetaken"),
																4,			-7,					{SKILL_FOLGA}, TREE_BUILDINGTREE)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.06)
GM:AddSkillModifier(SKILL_BLESSEDROD, SKILLMOD_CURSEM, 0.15)
GM:AddSkill(SKILL_GIGACHAD, trs("skill_gigachad"), GOOD..trs("skill_gigachad_d1"),
																4,			-8,					{SKILL_BLESSEDROD}, TREE_BUILDINGTREE)


-- Gunnery Tree
GM:AddSkill(SKILL_FREESKILL, trs("skill_freeskill"), GOOD.."+3"..trs("spoint"),
																-9,			10,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 8
GM:AddSkillModifier(SKILL_FREESKILL, SKILLMOD_SPOINT, 4)
GM:AddSkill(SKILL_FREESKILL1, trs("skill_freeskill"), GOOD.."+5"..trs("spoint"),
																-9,			9,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 24
GM:AddSkillModifier(SKILL_FREESKILL1, SKILLMOD_SPOINT, 6)
GM:AddSkill(SKILL_FREESKILL2, trs("skill_freeskill"), GOOD.."+8"..trs("spoint"),
																-9,			8,					{SKILL_NONE}, TREE_GUNTREE)
.RemortReq = 80
GM:AddSkillModifier(SKILL_FREESKILL2, SKILLMOD_SPOINT, 8)
GM:AddSkill(SKILL_SKILLFORGODS, "SECRET I", GOOD.."You find this!Reward is free 3 skill points!",
																-70,			65,					{SKILL_NONE}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_SKILLFORGODS, SKILLMOD_SPOINT, 4)
GM:AddSkillModifier(SKILL_SECRET, SKILLMOD_SPOINT, 7)
GM:AddSkillModifier(SKILL_SECRET2, SKILLMOD_SPOINT, 4)

local d = GM:AddSkill(SKILL_AMULET_1, trs("skill_amulet_1"), GOOD.. trs("skill_amulet_1_d1"),
																-20,			-9,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 3												
GM:AddSkillModifier(SKILL_AMULET_1, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_1, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_2, trs("skill_amulet_2"), GOOD.. trs("skill_amulet_2_d1"),
																-20,			-8,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 4													
GM:AddSkillModifier(SKILL_AMULET_2, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_2, SKILLMOD_PIECE_OF_AMULET, -4)
local d = GM:AddSkill(SKILL_AMULET_3, trs("skill_amulet_3"), BAD.. trs("skill_amulet_3_d1"),
																-20,			-10,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = -3													
GM:AddSkillModifier(SKILL_AMULET_3, SKILLMOD_SPOINT, -3)
GM:AddSkillModifier(SKILL_AMULET_3, SKILLMOD_PIECE_OF_AMULET, 3)
local d = GM:AddSkill(SKILL_AMULET_4, trs("skill_amulet_4"), GOOD.. trs("skill_amulet_4_d1"),
																-20,			-12,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true		
d.AmuletCost = 3													
GM:AddSkillModifier(SKILL_AMULET_4, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_4, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_5, trs("skill_amulet_5"), GOOD.. trs("skill_amulet_5_d1"),
																-20,			-13,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true			
d.AmuletCost = 2												
GM:AddSkillModifier(SKILL_AMULET_5, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_5, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_6, trs("skill_amulet_6"), GOOD.. trs("skill_amulet_6_d1"),
																-20,			-14,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 1											
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_LUCK, 2.5)
GM:AddSkillModifier(SKILL_AMULET_6, SKILLMOD_PIECE_OF_AMULET, -1)
local d = GM:AddSkill(SKILL_AMULET_7, trs("skill_amulet_7"), GOOD.. trs("skill_amulet_7_d1"),
																-23,			-7,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 3											
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_MELEE_DAMAGE_MUL, 0.25)
GM:AddSkillModifier(SKILL_AMULET_7, SKILLMOD_PIECE_OF_AMULET, -3)
local d = GM:AddSkill(SKILL_AMULET_8, trs("skill_amulet_8"), GOOD.. trs("skill_amulet_8_d1"),
																-23,			-8,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2											
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_HEALTH, 20)
GM:AddSkillModifier(SKILL_AMULET_8, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_9, trs("skill_amulet_9"), GOOD.. trs("skill_amulet_9_d1"),
																-23,			-9,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2											
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_BLOODARMOR, 35)
GM:AddSkillModifier(SKILL_AMULET_9, SKILLMOD_PIECE_OF_AMULET, -2)
local d = GM:AddSkill(SKILL_AMULET_10, trs("skill_amulet_10"), BAD.. trs("skill_amulet_10_d1"),
																-23,			-10,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = -5											
GM:AddSkillModifier(SKILL_AMULET_10, SKILLMOD_SPOINT, -7)
GM:AddSkillModifier(SKILL_AMULET_10, SKILLMOD_PIECE_OF_AMULET, 5)
local d = GM:AddSkill(SKILL_AMULET_11, trs("skill_amulet_11"), GOOD.. trs("skill_amulet_11_d1"),
																-23,			-11,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 5											
GM:AddSkillModifier(SKILL_AMULET_11, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_AMULET_11, SKILLMOD_PIECE_OF_AMULET, -5)
local d = GM:AddSkill(SKILL_AMULET_12, trs("skill_amulet_12"), GOOD..trs("skill_amulet_12_d2") ..BAD..trs("skill_amulet_12_d1"),
																-23,			-12,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = -5		
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.5)
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_REPAIRRATE_MUL, 0.33)									
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_SPOINT, 5)
GM:AddSkillModifier(SKILL_AMULET_12, SKILLMOD_PIECE_OF_AMULET, 5)
local d = GM:AddSkill(SKILL_AMULET_13, trs("skill_amulet_13"),  GOOD..trs("skill_amulet_13_d1"),
																-23,			-13,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.33)									
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_PIECE_OF_AMULET, -2)
GM:AddSkillModifier(SKILL_AMULET_13, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_14, trs("skill_amulet_14"),  GOOD..trs("skill_amulet_14_d1"),
																-23,			-14,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 5								
GM:AddSkillModifier(SKILL_AMULET_14, SKILLMOD_PIECE_OF_AMULET, -5)
GM:AddSkillModifier(SKILL_AMULET_14, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_15, trs("skill_amulet_15"),  GOOD..trs("skill_amulet_15_d1"),
																-23,			-15,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 2				
GM:AddSkillModifier(SKILL_AMULET_15, SKILLMOD_PIECE_OF_AMULET, -2)
GM:AddSkillModifier(SKILL_AMULET_15, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_16, trs("skill_amulet_16"),  GOOD..trs("skill_amulet_16_d1"),
																-20,			-15,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 3				
GM:AddSkillModifier(SKILL_AMULET_16, SKILLMOD_PIECE_OF_AMULET, -3)
GM:AddSkillModifier(SKILL_AMULET_16, SKILLMOD_SPOINT, 1)
local d = GM:AddSkill(SKILL_AMULET_17, trs("skill_amulet_17"),  GOOD..trs("skill_amulet_17_d1"),
																-20,			-16,					{SKILL_NONE}, TREE_GUNTREE)
d.Amulet = true				
d.AmuletCost = 3				
GM:AddSkillModifier(SKILL_AMULET_17, SKILLMOD_PIECE_OF_AMULET, -3)
GM:AddSkillModifier(SKILL_AMULET_17, SKILLMOD_SPOINT, 1)




GM:AddSkill(SKILL_QUE_PRO, trs("skill_quepro"), GOOD.."-10000%"..trs("xpmul"),
																-40,			-10,					{SKILL_NONE}, TREE_GUNTREE)
.QuePro = true														


GM:AddSkill(SKILL_UNSIGIL, trs("skill_uncorrupt"), GOOD.."+24%"..trs("r_speed")..GOOD.."+6%"..trs("b_damage")..BAD.."-80%"..trs("meleedamage"),
																0,			2,					{SKILL_LEVELHEADED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_UNSIGIL, SKILLMOD_DAMAGE, 0.06)
SKILL_PHOENIX = 260
GM:AddSkill(SKILL_PHOENIX, trs("skill_phoenix"), GOOD..trs("skill_phoenix_d1")..BAD.."-6%"..trs("meleedamage")..BAD.."-6%"..trs("b_damage"),
																0,			6,					{SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkill(SKILL_DOUBLE, trs("skill_double"), GOOD..trs("skill_double_d1")..BAD.."+25%"..trs("c_for_use"),
																-1,			7,					{SKILL_PHOENIX}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_DOUBLE, SKILLMOD_C_USE, 0.25)
GM:AddSkill(SKILL_PARASITE, trs("skill_parasite"), GOOD..trs("skill_parasite_d1")..BAD.."-33%"..trs("b_damage"),
																-1,			8,					{SKILL_DOUBLE,SKILL_AUTOAIM}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_PARASITE, SKILLMOD_DAMAGE, -0.33)
GM:AddSkill(SKILL_AUTOAIM, trs("skill_aim"), GOOD..trs("skill_aim_d1")..BAD..trs("skill_aim_d2"),
																-1,			9,					{}, TREE_GUNTREE)
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
local rand2 = math.random(-20,20)
local rand1 = math.random(-20,20)
local d = GM:AddSkill(SKILL_SECRET_9, "Secret IX", GOOD.."+20 Skill Points\nAhh finded at last...",
																rand2,			rand1,					{SKILL_NONE}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_SECRET_9, SKILLMOD_SPOINT, 21)
d.Hidden = true	
d.Hidden1 = true
local d = GM:AddSkill(SKILL_SECRET_VII, "ᅠ ᅠ ᅠ", GOOD.."+5 Skill Points\nSecret VII",
				                                                            	25,			20.1,					{SKILL_NONE}, TREE_DONATETREE)
d.Hidden = true	
d.Hidden1 = true	

local d = GM:AddSkill(SKILL_GOD_HEART, trs("skill_godheart"), GOOD..trs("skill_godheart_d1"),
				                                                            	-14,			16,					{SKILL_NONE}, TREE_DONATETREE)
d.RemortReq = 64
d.AmuletCost = -4	
GM:AddSkillModifier(SKILL_GOD_HEART, SKILLMOD_PIECE_OF_AMULET, 4)	
local d = GM:AddSkill(SKILL_GODHEART, trs("skill_godheart"), GOOD..trs("skill_godheart2_d1"),
				                                                            	-14,			99,					{SKILL_NONE}, TREE_DONATETREE)
d.RemortReq = 128
d.AmuletCost = 4					
GM:AddSkillModifier(SKILL_GODHEART, SKILLMOD_SPOINT, -4)
GM:AddSkillModifier(SKILL_GODHEART, SKILLMOD_CURSEM, -99)
d.AlwaysActive = true
d.Hidden = true	
local d = GM:AddSkill(SKILL_VIP, trs("skill_vip"), GOOD..trs("skill_vip_d1"),
				                                                            	-14,			14,					{}, TREE_DONATETREE)								
GM:AddSkillModifier(SKILL_VIP, SKILLMOD_SPOINT, 1)
GM:AddSkillModifier(SKILL_VIP, SKILLMOD_XP, 0.25)

d.AlwaysActive = true
d.Amulet = true	
d.Vip1 = true
GM:AddSkillModifier(SKILL_SECRET_VI, SKILLMOD_SPOINT, 5)
GM:AddSkillModifier(SKILL_SECRET_VII, SKILLMOD_SPOINT, 5)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE1, trs("skill_t_d").."I", GOOD.."+2%"..trs("r_speed")..GOOD.."+3%"..trs("b_damage")..GOOD.."+2%"..trs("w_draw")..BAD.."-9%"..trs("meleedamage"),
																-5,			6,					{SKILL_TRIGGER_DISCIPLINE2, SKILL_NONE}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE2, trs("skill_t_d").."II", GOOD.."+3%"..trs("r_speed")..GOOD.."+5%"..trs("b_damage")..GOOD.."+3%"..trs("w_draw")..BAD.."-13%"..trs("meleedamage"),
																-4,			3,					{SKILL_TRIGGER_DISCIPLINE3, SKILL_D_PALSY, SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRIGGER_DISCIPLINE3, trs("skill_t_d").."III", GOOD.."+4%"..trs("r_speed")..GOOD.."+7%"..trs("b_damage")..GOOD.."+4%"..trs("w_draw")..BAD.."-18%"..trs("meleedamage"),
																-3,			0,					{SKILL_QUICKRELOAD, SKILL_QUICKDRAW, SKILL_WORTHINESS1, SKILL_EGOCENTRIC}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE1, SKILLMOD_DAMAGE, 0.03)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE2, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_TRIGGER_DISCIPLINE3, SKILLMOD_DAMAGE, 0.07)
GM:AddSkill(SKILL_D_PALSY, trs("skill_d_palsy"), GOOD.."+20"..trs("worth")..GOOD.."-15%".. trs("res_delay")..BAD..trs("skill_d_palsy_d2"),
																0,			4,					{SKILL_LEVELHEADED,SKILL_GUNSLINGER}, TREE_GUNTREE)
GM:AddSkill(SKILL_LEVELHEADED, trs("skill_l_headed"), GOOD..trs("skill_l_headed_d1"),
																-2,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_QUICKDRAW, trs("skill_quick_d"), GOOD.."+65%"..trs("w_draw")..BAD.."-15%"..trs("r_speed"),
																0,			1,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUS, trs("skill_focus").."I", GOOD.."+11%"..trs("w_ac")..GOOD.."+5%"..trs("b_damage")..BAD.."-3%"..trs("r_speed"),
																5,			6,					{SKILL_NONE, SKILL_FOCUSII}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSII, trs("skill_focus").."II", GOOD.."+9%"..trs("w_ac")..GOOD.."+9%"..trs("b_damage")..BAD.."-7%"..trs("r_speed"),
																4,			3,					{SKILL_FOCUSIII, SKILL_SCAVENGER, SKILL_D_PALSY, SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_FOCUSIII, trs("skill_focus").."III", GOOD.."+12%"..trs("w_ac")..GOOD.."+11%"..trs("b_damage")..BAD.."-6%"..trs("r_speed"),
																3,			0,					{SKILL_EGOCENTRIC, SKILL_WOOISM, SKILL_ORPHICFOCUS, SKILL_SCOURER}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_FOCUS, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_FOCUSII, SKILLMOD_DAMAGE, 0.09)
GM:AddSkillModifier(SKILL_FOCUSIII, SKILLMOD_DAMAGE, 0.11)
SKILL_ARSVOID = 238
GM:AddSkill(SKILL_ARSVOID, trs("skill_ars_void"), GOOD..trs("skill_ars_void_d1")..GOOD.."+5%"..trs("b_damage")..BAD.."+12%"..trs("sale"),
																6,			-4,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_ARSVOID, SKILLMOD_ARSENAL_DISCOUNT, 0.12)
SKILL_GUNSLINGER = 252
GM:AddSkill(SKILL_GUNSLINGER, trs("skill_gunslinger"), GOOD.."+10%"..trs("w_ac")..GOOD.."+15%"..trs("b_damage")..BAD.."-30%"..trs("meleedamage")..BAD.."-50%"..trs("m_range"),
																0,			5,					{SKILL_D_PALSY, SKILL_PHOENIX}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_DAMAGE, 0.10)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_AIMSPREAD_MUL, -0.15)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_DAMAGE_MUL, -0.30)
GM:AddSkillModifier(SKILL_GUNSLINGER, SKILLMOD_MELEE_RANGE_MUL, -0.50)
GM:AddSkill(SKILL_BOUNTYKILLER, trs("skill_bounty"), GOOD..trs("skill_bounty_d1")..BAD.."-15%"..trs("b_damage"),
																1,			6,					{SKILL_GUNSLINGER, SKILL_VAMPIRISM}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BOUNTYKILLER, SKILLMOD_DAMAGE, -0.15)
GM:AddSkill(SKILL_VAMPIRISM, trs("skill_vampirism"), GOOD..trs("skill_vampirism_d1")..BAD.."-25%"..trs("b_damage"),
																1,		    7,					{SKILL_BOUNTYKILLER, SKILL_LOX}, TREE_GUNTREE)
GM:AddSkill(SKILL_LOX, trs("skill_lox"), GOOD..trs("skill_lox_d1")..BAD..trs("skill_lox_d2"),
																2,		    6,					{SKILL_VAMPIRISM}, TREE_GUNTREE)
.Hidden = true
GM:AddSkillModifier(SKILL_LOX, SKILLMOD_ADD_STATUS, 1)
GM:AddSkillModifier(SKILL_ABSOLUTE, SKILLMOD_ADD_STATUS, -0.05)
GM:AddSkillModifier(SKILL_VAMPIRISM, SKILLMOD_DAMAGE, -0.25)
GM:AddSkill(SKILL_D_CURSEDTRUE, trs("skill_d_truecurse"), BAD.."-100%"..trs("m_curse")..GOOD.."+35"..trs("health")..GOOD.."+40"..trs("speed")..GOOD.."+15%"..trs("r_speed"),
																2,		    8,					{SKILL_VAMPIRISM}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_CURSEM, -1)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_SPEED, 40)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_HEALTH, 35)
GM:AddSkillModifier(SKILL_D_CURSEDTRUE, SKILLMOD_RELOADSPEED_MUL, 0.15)




GM:AddSkill(SKILL_QUICKRELOAD, trs("skill_q_r"), GOOD.."+10%"..trs("r_speed")..BAD.."-25%"..trs("w_draw"),
																-5,			1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_SLEIGHTOFHAND, trs("skill_s_hand"), GOOD.."+10%"..trs("r_speed")..BAD.."-5%"..trs("w_ac"),
																-5,			-2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_BANDOLIER, trs("skill_bandolier"), GOOD..trs("skill_bandolier_d1"),
																-6,			-1,					{SKILL_SLEIGHTOFHAND}, TREE_GUNTREE)
GM:AddSkill(SKILL_U_CRYGASGREN, trs("skill_u_cryogas"), GOOD..trs("skill_u_cryogas_d1"),
																2,			-3,					{SKILL_EGOCENTRIC,SKILL_PURGATORY}, TREE_GUNTREE)
--GM:AddSkill(SKILL_BLOODY_BULLETS, trs("skill_bb"), GOOD..trs("skill_bb_d1")..BAD..trs("skill_bb_d2"),
--																2,			-2,					{SKILL_BLOODY_BULLETS}, TREE_GUNTREE) марио передай коту что мне лень деелать этот скииииииллл
GM:AddSkill(SKILL_PURGATORY, trs("skill_purgatory"), GOOD..trs("skill_purgatory_d1")..BAD.."-15%"..trs("b_damage"),
																2,			-4,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_SOFTDET, trs("skill_sdeton"), GOOD.."-40%"..trs("exp_damage_t")..BAD.."-10%"..trs("exp_damage"),
																0,			-5,					{SKILL_ELEMENTAL_BUFF}, TREE_GUNTREE)
GM:AddSkill(SKILL_ELEMENTAL_BUFF, trs("skill_ell_buff"), BAD.."+20%"..trs("exp_damage_t")..GOOD..trs("skill_ell_buff_d1"),
																0,			-6,					{SKILL_INDUCTOR_ISSUE,SKILL_ATTACHMENT_CURSE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_INDUCTOR_ISSUE, trs("skill_ind_issue"), BAD..trs("skill_ind_issue_d1")..GOOD..trs("skill_ind_issue_d2"),
																0,			-7,					{SKILL_DOUBLE_ISSUE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_ISSUE, trs("skill_d_issue"), GOOD..trs("skill_d_issue_d1")..BAD..trs("skill_d_issue_d2"),
																1,			-8,					{SKILL_DOUBLE_EXPLOSIVE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_EXPLOSIVE, trs("skill_d_exp"), GOOD..trs("skill_d_exp_d1")..BAD..trs("skill_d_exp_d2"),
																1,			-9,					{SKILL_DOUBLE_EXPLOSIVE_ALT, SKILL_CURSED_ALT}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_DOUBLE_EXPLOSIVE_ALT, trs("skill_d_exp2"), GOOD..trs("skill_d_exp2_d1")..BAD..trs("skill_d_exp2_d2"),
																0,			-10,					{SKILL_CRYO_LASER}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_CRYO_LASER, trs("skill_cryo_laser"), GOOD..trs("skill_cryo_laser_d1")..BAD..trs("skill_cryo_laser_d2"),
																0,			-11,					{SKILL_HOLE_OF_HELL}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HOLE_OF_HELL, trs("skill_hellhole"), GOOD..trs("skill_hellhole_d1")..BAD..trs("skill_hellhole_d2"),
																0,			-12,					{}, TREE_BRANCH_ELEMENTS)
																--SKILL_HOLE_OF_HELL
GM:AddSkill(SKILL_CURSED_ALT, trs("skill_at_curse2"), GOOD..trs("skill_at_curse2_d1")..BAD..trs("skill_at_curse2_d2"),
																2,			-10.5,					{}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_ATTACHMENT_CURSE, trs("skill_at_curse"), BAD..trs("skill_at_curse_d1")..GOOD..trs("skill_at_curse_d2"),
																-2.5,			-6,					{SKILL_HEHE, SKILL_CONISSUE}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_CONISSUE, trs("skill_conissue"), GOOD..trs("skill_conissue_d1")..BAD..trs("skill_conissue_d2"),
																-2.5,			-7,					{SKILL_N_FRIEND}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_N_FRIEND, trs("skill_nature_fs"), GOOD..trs("skill_nature_fs_d1")..BAD..trs("skill_nature_fs_d2"),
																-1.5,			-8,					{SKILL_100_PERC}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_100_PERC, trs("skill_100_perc"), GOOD..trs("skill_100_perc_d1")..BAD..trs("skill_100_perc_d2"),
																-1.5,			-9,					{}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HEHE, trs("skill_just_buff"), GOOD..trs("skill_just_buff_d1"),
																-2.5,			-5,					{SKILL_HAHA}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HAHA, trs("skill_haha"), GOOD..trs("skill_haha_d1"),
																-3.5,			-4,					{SKILL_HIHI}, TREE_BRANCH_ELEMENTS)
GM:AddSkill(SKILL_HIHI, trs("skill_hihi"), GOOD..trs("skill_hihi_d1"),
																-2,			-4.2,					{SKILL_NONE}, TREE_BRANCH_ELEMENTS)



GM:AddSkill(SKILL_ORPHICFOCUS, trs("skill_orfocus"), GOOD..trs("skill_orfocus_d1")..GOOD.."+2%"..trs("w_ac")..BAD..trs("skill_orfocus_d2")..BAD.."-6%"..trs("r_speed"),
																5,			-1,					{SKILL_DELIBRATION}, TREE_GUNTREE)
GM:AddSkill(SKILL_DELIBRATION, trs("skill_deli"), GOOD.."+3%"..trs("w_ac")..GOOD.."+1%"..trs("b_damage"),
																6,			-3,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_DELIBRATION, SKILLMOD_DAMAGE, 0.01)
GM:AddSkill(SKILL_EGOCENTRIC, trs("skill_ego"), GOOD.."-15%"..trs("self_d")..BAD.."-5"..trs("health"),
																0,			-1,					{SKILL_BLASTPROOF}, TREE_GUNTREE)
GM:AddSkill(SKILL_BLASTPROOF, trs("skill_bproof"), GOOD.."-40%"..trs("self_d")..BAD.."-10%"..trs("r_speed")..BAD.."-12%"..trs("w_draw")..trs("hagilore"),
																0,			-3,					{SKILL_SOFTDET, SKILL_CANNONBALL, SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_WOOISM, trs("skill_ziga"), GOOD..trs("skill_ziga_d1")..BAD..trs("skill_ziga_d2"),
																5,			1,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCAVENGER, trs("skill_eyes"), GOOD.. trs("skill_eyes_d1"),
																7,			4,					{SKILL_BUG_GET}, TREE_GUNTREE)
GM:AddSkill(SKILL_BUG_GET, trs("skill_shooter_fast"), GOOD.. trs("skill_shooter_fast_d1")..BAD.."-15%"..trs("b_damage"),
																7,			3,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BUG_GET, SKILLMOD_FIRE_DELAY, -0.15)
GM:AddSkillModifier(SKILL_BUG_GET, SKILLMOD_DAMAGE, -0.15)
GM:AddSkill(SKILL_PITCHER, trs("skill_pitcher"), GOOD..trs("skill_pitcher_d1"),
																6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_PITCHER2, trs("skill_pitcher2"), GOOD..trs("skill_pitcher2_d1").."-15%"..trs("b_damage"),
																7,			1,					{SKILL_PITCHER}, TREE_GUNTREE)
GM:AddSkill(SKILL_EQUIPPED, trs("skill_alacraty"), GOOD.. trs("skill_alacraty_d1"),
																-6,			2,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_MOBILIZED, trs("skill_mobile"), GOOD.. trs("skill_mobile_d1")..BAD.."-1"..trs("luck"),
																-7,			1,					{SKILL_EQUIPPED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_MOBILIZED, SKILLMOD_LUCK, -1)
--SKILL_MOB_II
GM:AddSkill(SKILL_MOB_II, trs("skill_mobile2"), GOOD.. trs("skill_mobile2_d1")..BAD..trs("skill_mobile2_d2"),
																-7,			0,					{SKILL_MOBILIZED}, TREE_GUNTREE)
GM:AddSkill(SKILL_ACTIVATE_THIS, trs("skill_acrftt"), GOOD.. trs("skill_acrftt_d1")..BAD.."-2"..trs("luck"),
																-7,			3,					{SKILL_MOBILIZED}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_ACTIVATE_THIS, SKILLMOD_LUCK, -2)
GM:AddSkill(SKILL_WORTHINESS1, trs("worthness"), GOOD.."+10"..trs("worth")..BAD.."-6"..trs("start_points"),
																-4,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_CANNONBALL, trs("skill_cannonball"), trs("skill_cannonball_d1")..GOOD..trs("skill_cannonball_d2"),
																-2,			-3,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_SCOURER, trs("skill_scourer"), GOOD..trs("skill_scourer_d1")..BAD..trs("skill_scourer_d2"),
																4,			-3,					{SKILL_BIRD_EYE}, TREE_GUNTREE)
GM:AddSkill(SKILL_BIRD_EYE, trs("skill_deal_eye"), GOOD..trs("skill_deal_eye_d1")..BAD.."-10%"..trs("b_damage"),
																4,			-4,					{}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_BIRD_EYE, SKILLMOD_DAMAGE, -0.10)
GM:AddSkill(SKILL_FAST_EYE, trs("skill_fast_eye"), GOOD..trs("skill_fast_eye_d1")..BAD.."+5%"..trs("f_delay"),
																8,			2,					{SKILL_BUG_GET}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_FAST_EYE, SKILLMOD_FIRE_DELAY, 0.05)
GM:AddSkill(SKILL_CONEFFECT, trs("skill_concetrate"), GOOD..trs("skill_concetrate_d1")..BAD.."-20%"..trs("exp_r"),
																2,			-5,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_LAST_AMMO, trs("skill_last_ammo"), GOOD..trs("skill_last_ammo_d1")..BAD..trs("skill_last_ammo_d2"),
																2,			-6,					{SKILL_CONEFFECT}, TREE_GUNTREE)
GM:AddSkill(SKILL_TRUEWOOISM, trs("skill_wooism"), GOOD..trs("skill_wooism_d1")..BAD..trs("skill_wooism_d2"),
																7,			0,					{}, TREE_GUNTREE)
GM:AddSkill(SKILL_DEADINSIDE, trs("skill_dinside"), BAD..trs("skill_dinside_d1")..GOOD..trs("skill_dinside_d2"),
																7,			-2,					{SKILL_TRUEWOOISM}, TREE_GUNTREE)
GM:AddSkill(SKILL_NFINGERS, trs("skill_nfingers"), GOOD..trs("skill_nfingers_d1")..BAD.."-10%"..trs("res_ammo"),
																8,			-4,					{SKILL_DEADINSIDE}, TREE_GUNTREE)
GM:AddSkill(SKILL_SFINGERS, trs("skill_sfingers"), GOOD..trs("skill_sfingers_d1")..BAD.."-25%"..trs("res_ammo"),
																8,			-5,					{SKILL_NFINGERS}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_NFINGERS, SKILLMOD_RES_AMMO_MUL, -0.10)
GM:AddSkillModifier(SKILL_SFINGERS, SKILLMOD_RES_AMMO_MUL, -0.25)
GM:AddSkill(SKILL_D_FINGERS, trs("skill_dfingers"), BAD..trs("skill_dfingers_d1"),
																9,			-6,					{SKILL_SFINGERS}, TREE_GUNTREE)
GM:AddSkillModifier(SKILL_D_FINGERS, SKILLMOD_DAMAGE, 1)

-- Melee Tree
GM:AddSkill(SKILL_WORTHINESS2, trs("worthness").."II", GOOD.."+10"..trs("worth")..BAD.."-6"..trs("start_points"),
																4,			0,					{}, TREE_MELEETREE)

GM:AddSkill(SKILL_AVOID_BLOCK, trs("skill_xpdamage"), GOOD..trs("skill_xpdamage_d1")..BAD.."-25%"..trs("b_mul"),
																5,			1,					{SKILL_WORTHINESS2}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_AVOID_BLOCK, SKILLMOD_BLOCKMULTIPLIER, 0.25)
GM:AddSkill(SKILL_BATTLER1, trs("skill_battler").."I", GOOD.."+3%"..trs("meleedamage")..BAD.."-2%"..trs("r_speed"),
																-6,			-6,					{SKILL_BATTLER2, SKILL_NONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER2, trs("skill_battler").."II", GOOD.."+6%"..trs("meleedamage")..BAD.."-4%"..trs("r_speed"),
																-6,			-4,					{SKILL_BATTLER3, SKILL_LIGHTWEIGHT}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER3, trs("skill_battler").."III", GOOD.."+8%"..trs("meleedamage")..BAD.."-9%"..trs("r_speed"),
																-4,			-2,					{SKILL_BATTLER4, SKILL_LANKY, SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER4, trs("skill_battler").."IV", GOOD.."+9%"..trs("meleedamage")..BAD.."-13%"..trs("r_speed"),
																-2,			0,					{SKILL_BATTLER5, SKILL_MASTERCHEF, SKILL_D_CLUMSY}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER5, trs("skill_battler").."V", GOOD.."+13%"..trs("meleedamage")..BAD.."-16%"..trs("r_speed"),
																0,			2,					{SKILL_GLASSWEAPONS, SKILL_BLOODLUST}, TREE_MELEETREE)
GM:AddSkill(SKILL_BATTLER6, trs("skill_battler").."VI", GOOD.."+16%"..trs("meleedamage")..BAD.."-33%"..trs("r_speed"),
																0,			0,					{SKILL_BATTLER5}, TREE_MELEETREE)
GM:AddSkill(SKILL_LASTSTAND, trs("skill_laststand"), GOOD..trs("skill_laststand_d1")..BAD..trs("skill_laststand_d2"),
																0,			6,					{SKILL_ABUSE}, TREE_MELEETREE)
.RemortReq = 4
GM:AddSkill(SKILL_ABUSE, trs("skill_lastabuse"), GOOD.."+10%"..trs("meleedamage")..GOOD..trs("skill_lastabuse_d1")..BAD..trs("skill_lastabuse_d2"),
																0,			7,					{SKILL_CURSECURE}, TREE_MELEETREE).RemortReq = 4
GM:AddSkill(SKILL_CURSECURE, trs("skill_cursecure"), GOOD..trs("skill_cursecure_d1")..GOOD.."+20%"..trs("m_curse")..BAD..trs("skill_cursecure_d2"),
																0,			8,					{}, TREE_MELEETREE).RemortReq = 4
GM:AddSkill(SKILL_SOULNET, trs("skill_souleater"), GOOD..trs("skill_souleater_d1")..BAD.."-10%"..trs("meleedamage"),
																0,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
.RemortReq = 4
GM:AddSkill(SKILL_GLASSWEAPONS, trs("skill_glassweapon"), GOOD..trs("skill_glassweapon_d1")..BAD..trs("skill_glassweapon_d2"),
																2,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_GLASSMAN, trs("skill_glassman"), GOOD.."+230%"..trs("meleedamage")..BAD.."+200%"..trs("meleedamagetaken"),
																3,			5,					{SKILL_GLASSWEAPONS}, TREE_MELEETREE)
GM:AddSkill(SKILL_D_CLUMSY,  trs("skill_d_clumsy"), GOOD.."+20"..trs("worth")..GOOD.."+10"..trs("start_points")..BAD..trs("skill_d_clumsy_d1"),
																-2,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_CHEAPKNUCKLE, trs("skill_cheapt"), GOOD..trs("skill_cheapt_d1")..BAD.."-10%"..trs("m_range"),
																4,			-2,					{SKILL_HEAVYSTRIKES, SKILL_WORTHINESS2}, TREE_MELEETREE)
GM:AddSkill(SKILL_CRITICALKNUCKLE, trs("skill_critknuckle"), GOOD..trs("skill_critknuckle_d1")..BAD.."-25%"..trs("fist_damage")..BAD.."+25% "..trs("fist_delay"),
																6,			-2,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_KNUCKLEMASTER, trs("skill_knuckmaster"), GOOD.."+75%"..trs("fist_damage")..GOOD..trs("skill_knuckmaster_d1")..BAD.."+35%"..trs("fist_delay"),
																6,			-6,					{SKILL_NONE, SKILL_COMBOKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_COMBOKNUCKLE, trs("skill_combohits"), GOOD..trs("skill_combohits_d1")..BAD..trs("skill_combohits_d2"),
																6,			-4,					{SKILL_CHEAPKNUCKLE, SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)
GM:AddSkill(SKILL_HEAVYSTRIKES, trs("skill_hknucke"), GOOD.."+90%"..trs("melee_knock")..GOOD..trs("skill_hknucke_d1")..BAD.."-50%"..trs("meleedamage"),
																2,			0,					{SKILL_BATTLER5, SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkill(SKILL_JOUSTER, trs("skill_jouster"), GOOD.."+15%"..trs("meleedamage")..BAD.."-90%"..trs("melee_knock")..BAD.."-50%"..trs("b_damage"),
																2,			2,					{SKILL_BLOODLOST,SKILL_SOY}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_JOUSTER, SKILLMOD_DAMAGE, -0.50)
GM:AddSkill(SKILL_SOY, trs("skill_soy"), GOOD..trs("skill_soy_d1")..BAD.."-75%"..trs("meleedamage"),
																3,			3,					{SKILL_JOUSTER}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_MELEE_DAMAGE_MUL, -0.75)
																
GM:AddSkill(SKILL_BLOODLOST, trs("skill_bloodlust"), GOOD..trs("skill_bloodlust_d1")..BAD.."-30"..trs("health"),
																3,			2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_PARASITOID, trs("skill_parasitoid"), GOOD..trs("skill_parasitoid_d1")..BAD.."-33%"..trs("d_barmor"),
																4,			2,					{SKILL_BLOODLOST}, TREE_MELEETREE).AlwaysActive = true
GM:AddSkillModifier(SKILL_PARASITOID, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.33)
GM:AddSkill(SKILL_PARASITOID_2, trs("skill_parasitoid2"), GOOD..trs("skill_parasitoid2_d1")..BAD..trs("skill_parasitoid2_d2"),
																5,			3,					{SKILL_PARASITOID,SKILL_PARASITOID_3}, TREE_MELEETREE)
GM:AddSkill(SKILL_PARASITOID_3, trs("skill_parasitoid3"), GOOD..trs("skill_parasitoid3_d1")..BAD..trs("skill_parasitoid3_d2"),
																6,			2,					{SKILL_PARASITOID2,SKILL_FLIMSY}, TREE_MELEETREE)
GM:AddSkill(SKILL_FLIMSY, trs("skill_flimsy"), GOOD..trs("skill_flimsy_d1")..BAD..trs("skill_flimsy_d2"),
																6,			4,					{SKILL_PARASITOID3}, TREE_MELEETREE)

GM:AddSkill(SKILL_RESNYATOST, trs("skill_resnyatost"), GOOD..trs("skill_resnyatost_d1")..BAD.."-20%"..trs("meleedamage"),
																4,			4,					{SKILL_SOY}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_RESNYATOST, SKILLMOD_MELEE_DAMAGE_MUL, -0.20)
GM:AddSkill(SKILL_LANKY, trs("skill_lanky").."I", GOOD.."+10%"..trs("m_range")..BAD.."-5%"..trs("meleedamage"),
																-4,			0,					{SKILL_LANKYII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYII, trs("skill_lanky").."II", GOOD.."+10%"..trs("m_range")..BAD.."-6%"..trs("meleedamage"),
																-4,			2,					{SKILL_LANKYIII}, TREE_MELEETREE)
GM:AddSkill(SKILL_LANKYIII, trs("skill_lanky").."III", GOOD.."+10%"..trs("m_range")..BAD.."-7%"..trs("meleedamage"),
																-4,			4,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_MASTERCHEF, trs("skill_mchef"), GOOD..trs("skill_mchef_d1")..BAD.."-10%"..trs("meleedamage"),
																0,			-3,					{SKILL_BATTLER4,SKILL_CURSE_OF_MISS}, TREE_MELEETREE)
GM:AddSkill(SKILL_CURSE_OF_MISS, trs("skill_curse_of_bruh"), GOOD.."+35%"..trs("meleedamage")..BAD..trs("skill_curse_of_bruh_d1"),
																0,			-2,					{}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_CURSE_OF_MISS, SKILLMOD_MELEE_DAMAGE_MUL, 0.35)
GM:AddSkill(SKILL_LIGHTWEIGHT, trs("skill_lweight"), GOOD..trs("skill_lweight_d1")..BAD.."-20%"..trs("meleedamage"),
																-6,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_BLOODLUST,  trs("skill_phantomhealth"), trs("skill_phantomhealth_d1")..GOOD..trs("skill_phantomhealth_d2"),
																-2,			4,					{SKILL_LASTSTAND}, TREE_MELEETREE)
GM:AddSkill(SKILL_HELPER,  trs("skill_helper"), GOOD..trs("skill_helper_d1")..BAD..trs("skill_helper_d2"),
																-3,			5,					{SKILL_BLOODLUST}, TREE_MELEETREE)
GM:AddSkill(SKILL_BRASH, trs("skill_brash"), GOOD.."-16%"..trs("m_delay")..BAD..trs("skill_brash_d1"),
																6,			0,					{SKILL_TRUEBLOCK}, TREE_MELEETREE)
GM:AddSkill(SKILL_TRUEBLOCK, trs("skill_trueblock"), BAD.."-15%"..trs("meleedamage")..GOOD..trs("skill_trueblock_d1"),
																7,			1,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_SECRET, "ᅠ ᅠ ᅠ", BAD.."Secret II,well I give 6 skill points for you",
																7,			1.05,					{SKILL_BRASH}, TREE_MELEETREE)
GM:AddSkill(SKILL_FOUR_IN_ONE, "2 in 1", GOOD.."-9%"..trs("m_delay")..BAD.."-7"..trs("health"),
																-2,			-2,					{}, TREE_MELEETREE)
GM:AddSkill(SKILL_THREE_IN_ONE, "3 in 1", GOOD.."-16%"..trs("m_delay")..BAD.."-10"..trs("health"),
            													-3,			-3,					{SKILL_FOUR_IN_ONE}, TREE_MELEETREE)
SKILL_LONGARM = 222					
GM:AddSkill(SKILL_LONGARM, trs("skill_longarm"), GOOD.."-7%"..trs("m_delay")..GOOD.."+2%"..trs("m_range")..BAD.."-7%"..trs("r_speed"),
																-3,			-4,					{SKILL_THREE_IN_ONE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_RANGE_MUL, 0.02)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.07)
GM:AddSkillModifier(SKILL_LONGARM, SKILLMOD_RELOADSPEED_MUL, -0.07)
SKILL_FISTING = 223				
GM:AddSkill(SKILL_FISTING, trs("skill_fisting"), GOOD.."+25%"..trs("fist_damage")..GOOD.."-15%"..trs("fist_delay")..BAD.."-25%"..trs("meleedamage")..BAD.."+15%"..trs("m_delay"),
																8,			-2,					{SKILL_CRITICALKNUCKLE}, TREE_MELEETREE)

GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_DAMAGE_MUL, 0.50)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_UNARMED_SWING_DELAY_MUL, -0.30)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_SWING_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_FISTING, SKILLMOD_MELEE_DAMAGE_MUL, -0.25)
GM:AddSkill(SKILL_SISUS_PRIME, trs("skill_sisus"), GOOD.. trs("skill_sisus_d1")..BAD.. trs("skill_sisus_d2"),
																8,			-0.5,					{SKILL_FISTING}, TREE_MELEETREE).SPUse = 4
GM:AddSkillModifier(SKILL_SISUS_PRIME, SKILLMOD_DMG_TAKEN, 0.1)
GM:AddSkillFunction(SKILL_SISUS_PRIME, function(pl, active)
	pl.Sisus = active
end)
GM:AddSkill(SKILL_GOODATTACK, trs("skill_goodattack"), BAD.."-15%"..trs("fist_damage")..GOOD..trs("skill_goodattack_d1"),
																8,			-3.5,					{SKILL_FISTING}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_GOODATTACK, SKILLMOD_UNARMED_DAMAGE_MUL, -0.15)
SKILL_MELEEFAN = 224				
GM:AddSkill(SKILL_MELEEFAN, trs("skill_truemelee"), BAD.."-350%"..trs("fist_damage")..GOOD.."+45%"..trs("meleedamage")..GOOD.."-15%"..trs("m_delay")..BAD.."-50%"..trs("b_damage"),
																9,			-3,					{SKILL_FISTING}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_UNARMED_DAMAGE_MUL, -3.50)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.15)
GM:AddSkillModifier(SKILL_MELEEFAN, SKILLMOD_MELEE_DAMAGE_MUL, 0.45)
GM:AddSkill(SKILL_STAMINA, trs("skill_stamina"), GOOD.."+30%"..trs("meleedamage")..BAD..trs("skill_stamina_d1"),
																9,			-1,					{SKILL_MELEEFAN,SKILL_SAHA}, TREE_MELEETREE).AlwaysActive = true
GM:AddSkillModifier(SKILL_STAMINA, SKILLMOD_MELEE_DAMAGE_MUL, 0.30)
GM:AddSkill(SKILL_SAHA, trs("skill_saha"), BAD.."-10%"..trs("meleedamage")..GOOD..trs("skill_saha_d1")..BAD..trs("skill_saha_d2"),
																9,			0,					{}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_SAHA, SKILLMOD_MELEE_DAMAGE_MUL, -0.1)
GM:AddSkill(SKILL_STAMINLESS1, trs("skill_stamina").." I", GOOD..translate.Format("skillmod_n123", "+6%").."\n"..BAD..translate.Format("skillmod_n124", "+6%"),
																11,			-1,					{SKILL_STAMINA}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_STAMINLESS1, SKILLMOD_STAMINA_ADD, 0.06)
GM:AddSkillModifier(SKILL_STAMINLESS1, SKILLMOD_STAMINA_USE, 0.06)
GM:AddSkill(SKILL_STAMINLESS2, trs("skill_stamina").." II", GOOD..translate.Format("skillmod_n123", "+4%").."\n"..BAD..translate.Format("skillmod_n124", "+4%"),
																12,			0,					{SKILL_STAMINLESS1}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_STAMINLESS2, SKILLMOD_STAMINA_ADD, 0.04)
GM:AddSkillModifier(SKILL_STAMINLESS2, SKILLMOD_STAMINA_USE, 0.04)
GM:AddSkill(SKILL_STAMINLESS3, trs("skill_stamina").." III", GOOD..translate.Format("skillmod_n123", "+3%").."\n"..BAD..translate.Format("skillmod_n124", "+3%"),
																13,			-1,					{SKILL_STAMINLESS2}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_STAMINLESS3, SKILLMOD_STAMINA_ADD, 0.03)
GM:AddSkillModifier(SKILL_STAMINLESS3, SKILLMOD_STAMINA_USE, 0.03)
SKILL_OPM = 225				
GM:AddSkill(SKILL_OPM, trs("skill_opm"), GOOD.."+350%"..trs("fist_damage")..BAD.."-35%"..trs("meleedamage")..BAD.."+150%"..trs("fist_delay"),
																9,			-5,					{SKILL_MELEEFAN}, TREE_MELEETREE)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_DAMAGE_MUL, 3.50)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_UNARMED_SWING_DELAY_MUL, 3)
GM:AddSkillModifier(SKILL_OPM, SKILLMOD_MELEE_DAMAGE_MUL, -0.35)




SKILL_POINTI = 157
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_POINT_MULTIPLIER, 0.02)
GM:AddSkillModifier(SKILL_POINTI, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTI, trs("skill_point").."I", GOOD.."+0.15"..trs("luck")..GOOD.."+2%"..trs("p_mul"),
																0,			0,					{SKILL_NONE}, TREE_POINTTREE)
SKILL_POINTII = 158
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_POINT_MULTIPLIER, 0.02)
GM:AddSkillModifier(SKILL_POINTII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTII, trs("skill_point").."II", GOOD.."+0.15"..trs("luck")..GOOD.."+2%"..trs("p_mul"),
																-0.5,			-1,					{SKILL_POINTI}, TREE_POINTTREE)
SKILL_POINTIII = 159
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_POINT_MULTIPLIER, 0.03)
GM:AddSkillModifier(SKILL_POINTIII, SKILLMOD_LUCK, 0.15)
GM:AddSkill(SKILL_POINTIII, trs("skill_point").."III", NEUTRAL.."+0.15"..trs("luck")..GOOD.."+3%"..trs("p_mul"),
																-1,			-2,					{SKILL_POINTII}, TREE_POINTTREE)
SKILL_POINTIIII = 160
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_POINT_MULTIPLIER, 0.04)
	GM:AddSkillModifier(SKILL_POINTIIII, SKILLMOD_LUCK, 0.40)
GM:AddSkill(SKILL_POINTIIII, trs("skill_point").."IV", NEUTRAL.."+0.40"..trs("luck")..GOOD.."+4%"..trs("p_mul") ..GOOD.. "+5"..trs("start_points"),
																-2,			-3,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTD = 248
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_POINT_MULTIPLIER, -0.10)
GM:AddSkillModifier(SKILL_POINTD, SKILLMOD_LUCK, -0.9)
GM:AddSkill(SKILL_POINTD, trs("skill_dtrouble"), BAD.."-0.9"..trs("luck")..GOOD..trs("skill_lastabuse_d1") ..BAD.. "-10%"..trs("p_mul"),
																-3.5,			-3,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_POINTFUL = 219
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_POINT_MULTIPLIER, 0.1)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_XP, -0.25)
	GM:AddSkillModifier(SKILL_POINTFUL, SKILLMOD_WORTH, -25)
	GM:AddSkillModifier(SKILL_QUE_PRO, SKILLMOD_XP, -100)
GM:AddSkill(SKILL_POINTFUL, trs("skill_pointful"), BAD.."-25%"..trs("xpmul")..BAD.."-25"..trs("worth")..GOOD.."+10%"..trs("p_mul") ..GOOD.. "+10"..trs("start_points"),
																-2,			0,					{SKILL_POINTIII}, TREE_POINTTREE)
SKILL_POINTMEGA = 242
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_XP, -0.05)
GM:AddSkillModifier(SKILL_POINTMEGA, SKILLMOD_WORTH, 25)
GM:AddSkill(SKILL_POINTMEGA,  trs("skill_megapoint"), BAD.."-5%"..trs("xpmul")..GOOD.."+25"..trs("worth")..BAD.."-10%"..trs("p_mul") ..GOOD.. "+50"..trs("start_points"),
																-2,			1,					{SKILL_POINTFUL}, TREE_POINTTREE)
	SKILL_LUCK = 161
	GM:AddSkillModifier(SKILL_LUCK, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK, trs("skill_luck"), GOOD.."+0.5"..trs("luck"),
																-2,			-5,					{SKILL_POINTIIII}, TREE_POINTTREE)
SKILL_LUCK1 = 243
GM:AddSkillModifier(SKILL_LUCK1, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK1, trs("skill_luck").."I", GOOD.."+0.5"..trs("luck"),
									                    		-2,			-6,					{SKILL_LUCK}, TREE_POINTTREE)
SKILL_LUCK2 = 244
GM:AddSkillModifier(SKILL_LUCK2, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK2, trs("skill_luck").."II", GOOD.."+0.5"..trs("luck"),
									                    		-3,			-7,					{SKILL_LUCK1}, TREE_POINTTREE)
SKILL_LUCK3 = 245
GM:AddSkillModifier(SKILL_LUCK3, SKILLMOD_LUCK, 0.5)
GM:AddSkill(SKILL_LUCK3, trs("skill_luck").."III", GOOD.."+0.5"..trs("luck"),
									                    		-3,			-8,					{SKILL_LUCK2}, TREE_POINTTREE)
SKILL_LUCK4 = 246
GM:AddSkillModifier(SKILL_LUCK4, SKILLMOD_LUCK, 1)
GM:AddSkill(SKILL_LUCK4, trs("skill_luck").."IV", GOOD.."+1"..trs("luck"),
																-4,			-8,					{SKILL_LUCK3}, TREE_POINTTREE)		
GM:AddSkill(SKILL_XPHUNTER, trs("skill_bonusxp"), GOOD..trs("skill_bonusxp_d1"),
																-4,			-10,					{SKILL_LUCK4}, TREE_POINTTREE)		
SKILL_ULUCK = 247
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_LUCK, 5)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_RESUPPLY_DELAY_MUL, 0.15)
GM:AddSkillModifier(SKILL_ULUCK, SKILLMOD_POINT_MULTIPLIER, -0.15)
GM:AddSkill(SKILL_ULUCK, trs("skill_ultraluck"), GOOD.."+5"..trs("luck")..BAD.."-15%"..trs("p_mul")..BAD.."+15%"..trs("res_delay"),
																-4,			-6,					{SKILL_LUCK4}, TREE_POINTTREE)														
SKILL_LUCKE = 162
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_POINT_MULTIPLIER, -0.1)
GM:AddSkillModifier(SKILL_LUCKE, SKILLMOD_LUCK, 2)	
GM:AddSkill(SKILL_LUCKY_UNLIVER, trs("skill_luckstacker"), GOOD..trs("skill_luckstacker_d1")..BAD.."-5 "..trs("hp_per_wave"),
	1,			-3,					{SKILL_LUCKE}, TREE_POINTTREE)
GM:AddSkill(SKILL_LUCKE, trs("skill_badluck"), NEUTRAL.."+2"..trs("luck")..BAD.. "-10%"..trs("p_mul"),
	1,			-2,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_BLUCK = 163
	GM:AddSkillModifier(SKILL_BLUCK, SKILLMOD_LUCK, -5)
GM:AddSkill(SKILL_BLUCK, trs("skill_quad"), GOOD..trs("skill_quad_d1") ..BAD.. "-5"..trs("luck"),
	2,			-2.75,					{SKILL_LUCKE}, TREE_POINTTREE)
GM:AddSkill(SKILL_CREDIT, trs("skill_credit"), GOOD..trs("skill_credit_d1")..GOOD.."+25"..trs("worth")..BAD.."-7%"..trs("sale")..BAD..trs("skill_credit_d2"),
	3,			-4,					{SKILL_BLUCK}, TREE_POINTTREE)
GM:AddSkillModifier(SKILL_CREDIT, SKILLMOD_WORTH, 25)
GM:AddSkillModifier(SKILL_CREDIT, SKILLMOD_ARSENAL_DISCOUNT, 0.07)
	SKILL_PILLUCK = 164
	GM:AddSkillModifier(SKILL_PILLUCK, SKILLMOD_LUCK, -5)
GM:AddSkill(SKILL_PILLUCK, trs("skill_pillluck"), GOOD..trs("skill_pillluck_d1")..BAD.."-5"..trs("luck"),
	-1,			-4,					{SKILL_POINTIIII}, TREE_POINTTREE)
	SKILL_DUDEE = 166
	GM:AddSkillModifier(SKILL_DUDEE, SKILLMOD_LUCK, 2)
GM:AddSkill(SKILL_DUDEE, trs("skill_toyluck"), GOOD.."+2"..trs("luck"),
	2,			-5,					{SKILL_LUCKE,SKILL_WORTHINESS4}, TREE_POINTTREE)

	SKILL_BADTRIP = 167
	GM:AddSkillModifier(SKILL_BADTRIP, SKILLMOD_POINT_MULTIPLIER, 0.01)
	GM:AddSkill(SKILL_BADTRIP, trs("skill_badtrip"), GOOD.."+1%"..trs("p_mul"),
		2,			-6,					{SKILL_DUDEE}, TREE_POINTTREE)
	GM:AddSkill(SKILL_SINS, trs("skill_sins"), GOOD..trs("skill_sins_d1"),
		1,			-6,					{SKILL_BADTRIP}, TREE_POINTTREE)
.RemortReq = 6
SKILL_SCAM = 168
GM:AddSkillModifier(SKILL_SCAM, SKILLMOD_POINT_MULTIPLIER, 0.01)
GM:AddSkill(SKILL_SCAM, "Scam", GOOD.."+1%"..trs("p_mul")..BAD.. "On kill curses with 1.5% chance(GIVE SPECIAL CURSE)",
			3,			-8,					{SKILL_BADTRIP}, TREE_POINTTREE)
SKILL_SOLARUZ = 169
GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_POINT_MULTIPLIER, 0.15)
GM:AddSkillModifier(SKILL_SOLARUZ, SKILLMOD_DMG_TAKEN, 0.5)
GM:AddSkill(SKILL_SOLARUZ, "Debuff:Deadly Fortuna", PURPLE.."+15% Points Multiplicator \n" ..BAD.. "+50% damage taken",
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
GM:AddSkillModifier(SKILL_SIGILIBERATOR, SKILLMOD_DMG_TAKEN, 0.5)		
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
GM:AddSkill(SKILL_INF_POWER, "Dozei Core", PURPLE.."-50% Damage.\nExtra-damage for every skills you unlocked\n+0.55% damage per skill",
										4,			-5,					{SKILL_NO_BALANCE,SKILL_HELPLIFER}, TREE_ANCIENTTREE).SPUse = 14
GM:AddSkill(SKILL_NO_BALANCE, "Silver bullets", PURPLE.."Sometimes your damage become a DIRECT damage!\n7% Chance",
										2.5,			-3.5,					{}, TREE_ANCIENTTREE).SPUse = 24
GM:AddSkill(SKILL_SOUL_TRADE, "[TRADE]Soul", PURPLE.."Sell Your Soul For Toy.\n"..PURPLE.."+33.3% Point Mul",
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
GM:AddSkill(SKILL_WORTHINESS5, "Worthiness V", PURPLE.."+10 worth\n"..BAD.."-6 points",
																				-5,			-13,					{SKILL_HEARTS}, TREE_ANCIENTTREE)
SKILL_NANOMACHINES = 239
GM:AddSkill(SKILL_NANOMACHINES, "Anci-tech", PURPLE.."+5% Bullet damage\n"..PURPLE.."+50% DMG reflect",
																				-6,			-12,					{SKILL_HEARTS}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_DAMAGE, 0.05)
GM:AddSkillModifier(SKILL_NANOMACHINES, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 0.5)
SKILL_MYTHRIL = 274
GM:AddSkill(SKILL_MYTHRIL, "Mythril armor", PURPLE.."+30% Xp multiplier\n"..PURPLE.."+4% Chance to take XP Instead of damage\n"..BAD.."-25 speed",
																				-7,			-13,					{SKILL_NANOMACHINES,SKILL_ULTIMATE_TORMENT}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_MYTHRIL, SKILLMOD_XP, 0.30)
GM:AddSkillModifier(SKILL_MYTHRIL, SKILLMOD_SPEED, -25)
GM:AddSkill(SKILL_ULTIMATE_TORMENT, "Torment:ULTIMATE", PURPLE.."+40% Xp multiplier\n",
																				-7,			-16,					{}, TREE_ANCIENTTREE).NeedAchievement = "full_curse"
GM:AddSkillModifier(SKILL_ULTIMATE_TORMENT, SKILLMOD_XP, 0.4)
SKILL_DEFEND = 190
GM:AddSkill(SKILL_DEFEND, trs("skill_sdefender").."I", GOOD.."-2%"..trs("meleedamagetaken")..BAD.."-1"..trs("speed"),
				                                                            	-0.25,			-0.5,					{SKILL_NONE}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND, SKILLMOD_SPEED, -1)

--Tormented SKill
SKILL_TORMENT1 = 229
GM:AddSkill(SKILL_TORMENT1, trs("skill_torment").."I", GOOD.."+5%"..trs("xpmul")..BAD.."-30"..trs("speed")..BAD.."-15%"..trs("b_damage"),
				                                                            	1,			26,					{SKILL_NONE}, TREE_ANCIENTTREE)
.RemortReq = 2
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_DAMAGE, -0.15)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_TORMENT1, SKILLMOD_XP, 0.05)
SKILL_TORMENT2 = 230
GM:AddSkill(SKILL_TORMENT2, trs("skill_torment").."II", GOOD.."+5%"..trs("xpmul")..BAD.."-15%"..trs("meleedamage")..BAD.."-15"..trs("health"),
				                                                            	1,			27,					{SKILL_TORMENT1}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_TORMENT2, SKILLMOD_XP, 0.05)
SKILL_SLAVEC = 251
GM:AddSkill(SKILL_SLAVEC, trs("skill_cot"), GOOD..trs("skill_cot_d1")..GOOD.."+20"..trs("speed")..BAD.."-15"..trs("health"),
																				1.5,			5,					{SKILL_DOSETHELP, SKILL_BERSERK}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(SKILL_SLAVEC, SKILLMOD_SPEED, 20)
GM:AddSkill(SKILL_SHINNING_HIT, trs("skill_shine_hit"), GOOD..trs("skill_shine_hit_d1")..BAD.."-20%"..trs("meleedamage"),
																				3,			6,					{SKILL_SLAVEC}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_SHINNING_HIT, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)
GM:AddSkill(SKILL_BERSERK, trs("skill_ultra_r"), GOOD..trs("skill_ultra_r_d1")..BAD..trs("skill_ultra_r_d2")..BAD..trs("skill_ultra_r_d3"),
																				1.5,			6,					{}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_BERSERK, SKILLMOD_DMG_TAKEN, 0.1)
SKILL_TORMENT3 = 231
GM:AddSkill(SKILL_TORMENT3, trs("skill_torment").."III", GOOD.."+15%"..trs("xpmul")..BAD.."+50%"..trs("res_delay")..BAD.."-5%"..trs("p_mul").."Secret III(+2 skill points)",
				                                                            	1,			28,					{SKILL_TORMENT2}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_POINT_MULTIPLIER, -0.05)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_RESUPPLY_DELAY_MUL, 0.5)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_XP, 0.15)
GM:AddSkillModifier(SKILL_TORMENT3, SKILLMOD_SPOINT, 3)
SKILL_TORMENT4 = 232
GM:AddSkill(SKILL_TORMENT4, trs("skill_torment").."IV", GOOD.."+35%"..trs("xpmul")..BAD..trs("skill_torment_d1"),
				                                                            	1,			29,					{SKILL_TORMENT3}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_DAMAGE, -0.50)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_MELEE_DAMAGE_MUL, -0.5)
GM:AddSkillModifier(SKILL_TORMENT4, SKILLMOD_XP, 0.35)
SKILL_TORMENT5 = 233
GM:AddSkill(SKILL_TORMENT5, trs("skill_torment").."V", GOOD.."+5%"..trs("xpmul")..BAD.."+15%"..trs("meleedamagetaken"),
				                                                            	2,			28.5,					{SKILL_TORMENT4}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.15)
GM:AddSkillModifier(SKILL_TORMENT5, SKILLMOD_XP, 0.05)
SKILL_TORMENT6 = 253
GM:AddSkill(SKILL_TORMENT6, trs("skill_torment").."VI", GOOD.."+10%"..trs("xpmul")..BAD..trs("skill_torment_d2"),
				                                                            	3,			30,					{SKILL_TORMENT5}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_REPAIRRATE_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, -0.50)
GM:AddSkillModifier(SKILL_TORMENT6, SKILLMOD_XP, 0.10)
SKILL_DEATHCURSE = 234
GM:AddSkill(SKILL_DEATHCURSE, trs("skill_ccleaning"), GOOD.."+15%"..trs("xpmul")..GOOD..trs("skill_ccleaning_d1")..BAD.."-30%"..trs("m_curse")..BAD..trs("skill_ccleaning_d2"),
				                                                            	3,			-1,					{SKILL_DEFENDBLOOD}, TREE_DEFENSETREE)		
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_XP, 0.15)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_CURSEM, -0.30)
GM:AddSkillModifier(SKILL_DEATHCURSE, SKILLMOD_FOODEATTIME_MUL, 0.30)
GM:AddSkill(SKILL_TORMENT7, trs("skill_torment").."VII", GOOD.."+55%"..trs("xpmul")..BAD..trs("skill_torment_d3")..BAD.."-25%"..trs("sale")..BAD..trs("skill_torment_d2"),
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
GM:AddSkill(SKILL_TORMENT8,trs("skill_torment").."VIII", GOOD.."+15%"..trs("xpmul")..BAD.."-50"..trs("health"),
				                                                            	3,			32,					{SKILL_TORMENT7}, TREE_ANCIENTTREE)

GM:AddSkillModifier(SKILL_TORMENT8, SKILLMOD_HEALTH, -50)
GM:AddSkillModifier(SKILL_TORMENT8, SKILLMOD_XP, 0.15)
GM:AddSkill(SKILL_TOY_BEST_FRIEND,trs("skill_toy"), GOOD..trs("skill_toy_d")..BAD.."-10%"..trs("xpmul"),
																				1,			30,						{SKILL_TORMENT4}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_TOY_BEST_FRIEND, SKILLMOD_XP, -0.10)
GM:AddSkill(SKILL_FREEPOINT1,trs("skill_freexp").."I", GOOD.."+1%"..trs("xpmul"),
				                                                            	4,			33,					{SKILL_TORMENT8}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT1, SKILLMOD_XP, 0.01)
GM:AddSkill(SKILL_FREEPOINT2,trs("skill_freexp").."II", GOOD.."+3%"..trs("xpmul"),
				                                                            	5,			32,					{SKILL_FREEPOINT1}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT2, SKILLMOD_XP, 0.03)
GM:AddSkill(SKILL_FREEPOINT3,trs("skill_freexp").."III", GOOD.."+4%"..trs("xpmul"),
				                                                            	6,			34,					{SKILL_FREEPOINT2}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT3, SKILLMOD_XP, 0.04)
GM:AddSkill(SKILL_FREEPOINT4,trs("skill_freexp").."IV", GOOD.."+6%"..trs("xpmul"),
				                                                            	6,			35,					{SKILL_FREEPOINT3}, TREE_ANCIENTTREE)
GM:AddSkillModifier(SKILL_FREEPOINT4, SKILLMOD_XP, 0.06)
GM:AddSkill(SKILL_XPMULGOOD, trs("skill_xpmulgood"), GOOD..trs("skill_xpmulgood_d1")..BAD..trs("skill_xpmulgood_d2"),
				                                                            	6,			36,					{SKILL_FREEPOINT4}, TREE_ANCIENTTREE)

--Defend skills

SKILL_DEFEND1 = 191
GM:AddSkill(SKILL_DEFEND1, trs("skill_sdefender").."II", GOOD.."-2%"..trs("meleedamagetaken")..BAD.."-2"..trs("speed"),
				                                                            	0.75,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND1, SKILLMOD_SPEED, -2)
SKILL_DEFEND2 = 192
GM:AddSkill(SKILL_DEFEND2,trs("skill_sdefender").."III", GOOD.."-2%"..trs("meleedamagetaken")..BAD.."-3"..trs("speed"),
				                                                            	1.5,			1,					{SKILL_DEFEND1}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
GM:AddSkillModifier(SKILL_DEFEND2, SKILLMOD_SPEED, -3)
GM:AddSkill(SKILL_DEFENDBLOOD,trs("skill_blooddefender"), GOOD..trs("skill_blooddefender_d1")..BAD..trs("skill_blooddefender_d2"),
				                                                            	3,			0,					{SKILL_DEFEND2, SKILL_DEATHCURSE}, TREE_DEFENSETREE)
SKILL_DEFEND3 = 193
GM:AddSkill(SKILL_DEFEND3, trs("skill_sdefender").." IV", GOOD.."-4%"..trs("meleedamagetaken")..BAD.."-6"..trs("speed"),
				                                                            	1.5,			2,					{SKILL_DEFEND2}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_DOSETHELP, trs("skill_dosethelp"), GOOD..trs("skill_dosethelp_d1")..BAD.."-25"..trs("speed"),
				                                                            	1.5,			4,					{SKILL_DEFEND2}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFEND3, SKILLMOD_SPEED, -6)
GM:AddSkillModifier(SKILL_DOSETHELP, SKILLMOD_SPEED, -25)
SKILL_DEFEND4 = 194
GM:AddSkill(SKILL_DEFEND4, trs("skill_sdefender").."V", GOOD.."-4%"..trs("meleedamagetaken")..BAD.."-8"..trs("speed"),
				                                                            	0.75,			3,					{SKILL_DEFEND3}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFEND4, SKILLMOD_SPEED, -8)
SKILL_DEFEND5 = 195
GM:AddSkill(SKILL_DEFEND5, trs("skill_sdefender").."VI", GOOD.."-6%"..trs("meleedamagetaken")..BAD.."-16"..trs("speed"),
				                                                            	0,			3.5,					{SKILL_DEFEND4}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(SKILL_DEFEND5, SKILLMOD_SPEED, -16)
SKILL_DEFENDER = 196
GM:AddSkill(SKILL_DEFENDER, trs("skill_hdef"), GOOD.."-4%"..trs("meleedamagetaken")..BAD.."-4%"..trs("meleedamage"),
				                                                            	-1.5,			0,					{SKILL_DEFEND}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(SKILL_DEFENDER, SKILLMOD_MELEE_DAMAGE_MUL, -0.04)
SKILL_DEFENDEROFM = 197
GM:AddSkill(SKILL_DEFENDEROFM, trs("skill_mdef"), BAD.."5%"..trs("meleedamagetaken")..GOOD.."+5%"..trs("meleedamage"),
				                                                            	-2,			1,					{SKILL_DEFENDER}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
GM:AddSkillModifier(SKILL_DEFENDEROFM, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
SKILL_HEAVY = 254
GM:AddSkill(SKILL_HEAVY, trs("skill_heavy"), GOOD.."-10%"..trs("meleedamagetaken")..BAD.."-30"..trs("speed")..GOOD.."+13%"..trs("knockdown_r")..BAD.."-50%"..trs("jump"),
				                                                            	-3,		    0.5,					{SKILL_DEFENDEROFM}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.1)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_SPEED, -30)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_JUMPPOWER_MUL, -0.5)
GM:AddSkillModifier(SKILL_HEAVY, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.13)
SKILL_TTIMES = 249
GM:AddSkill(SKILL_TTIMES, trs("skill_ttimes"), GOOD..trs("skill_ttimes_d1")..BAD.."+5%"..trs("meleedamagetaken"),
				                                                            	-3,			1.5,					{SKILL_TRIP,SKILL_TTIMES1}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
SKILL_TTIMES1 = 250
GM:AddSkill(SKILL_TTIMES1, trs("skill_ttime"), GOOD.."-4%"..trs("meleedamagetaken"),
				                                                            	-4,			2,					{SKILL_TTIMES}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_TTIMES1, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
SKILL_TRIP = 198
GM:AddSkill(SKILL_TRIP, trs("skill_cursewall"), GOOD.."-33%"..trs("meleedamagetaken")..GOOD.."+50% "..trs("m_curse")..BAD.."-12%"..trs("meleedamage")..BAD.."-70"..trs("speed"),
				                                                            	-2,			2,					{SKILL_DEFENDEROFM,SKILL_TTIMES}, TREE_DEFENSETREE)

GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.33)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_MELEE_DAMAGE_MUL, -0.12)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_SPEED, -70)
GM:AddSkillModifier(SKILL_TRIP, SKILLMOD_CURSEM, 0.5)
GM:AddSkill(SKILL_HOLY_MANTLE, trs("skill_holymantle"), GOOD..trs("skill_holymantle_d1"),
				                                                            	-4,			3,					{SKILL_TTIMES}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_SELFSAVER, trs("skill_selfsaver"), GOOD..trs("skill_selfsaver_d1")..BAD.."-35"..trs("speed"),
				                                                            	-3,			4,					{SKILL_HOLY_MANTLE}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_BLOODYFISTS, trs("skill_bloodyfists"), GOOD..trs("skill_bloodyfists_d1")..BAD..trs("skill_bloodyfists_d2"),
				                                                            	-5,			4,					{SKILL_SELFSAVER}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_BLOODYFISTS, SKILLMOD_UNARMED_DAMAGE_MUL, -0.20)
GM:AddSkill(SKILL_ASAVE, trs("skill_ancientsave"), GOOD..trs("skill_ancientsave_d1")..BAD.."-15"..trs("speed"),
				                                                            	-4,			5,					{SKILL_SELFSAVER}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_SSS, trs("skill_sss"), GOOD..trs("skill_sss_d1")..BAD..trs("skill_sss_d2"),
				                                                            	-4,			7,					{SKILL_ASAVE}, TREE_DEFENSETREE)
SKILL_MERIS = 199
GM:AddSkill(SKILL_MERIS, trs("skill_meris"), GOOD.."-10%"..trs("meleedamagetaken")..BAD.."-15%"..trs("meleedamage")..BAD.."-12%"..trs("b_damage"),
				                                                            	-1,			3.5,					{SKILL_TRIP}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_UPLOAD, trs("skill_later"), GOOD..trs("skill_later_d1")..BAD..trs("skill_later_d2"),
				                                                            	-1,			5,					{SKILL_MERIS}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_ANTINEGR, trs("skill_antinegr"), GOOD..trs("skill_antinegr_d1")..BAD..trs("skill_antinegr_d2"),
				                                                            	-1,			6,					{SKILL_UPLOAD}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_MOREDAMAGE, trs("skill_moredamage"), GOOD..trs("skill_moredamage_d1")..BAD.."+35%"..trs("meleedamagetaken"),
				                                                            	0,			7,					{SKILL_ANTINEGR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_MOREDAMAGE, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.35)
GM:AddSkillModifier(SKILL_MOREDAMAGE, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.25)
GM:AddSkill(SKILL_ANTI_DEVO, trs("skill_adevo"), GOOD..trs("skill_adevo_d1")..BAD..trs("skill_adevo_d2"),
				                                                            	1,			7,					{SKILL_MOREDAMAGE}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_ANTI_DEVO, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.25)
GM:AddSkillModifier(SKILL_ANTI_DEVO, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.07)
GM:AddSkill(SKILL_SECONDCHANCE, trs("skill_schance"), GOOD..trs("skill_schance_d1"),
				                                                            	0,			8,					{SKILL_MOREDAMAGE}, TREE_DEFENSETREE)
GM:AddSkill(SKILL_CQARMOR, trs("skill_cqarmor"), GOOD..trs("skill_cqarmor_d1")..BAD..trs("skill_cqarmor_d2"),
				                                                            	-2,			7,					{SKILL_ANTINEGR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_CQARMOR, SKILLMOD_DMG_TAKEN, -0.25)
GM:AddSkill(SKILL_CQBOOTS, trs("skill_cboots"), GOOD..trs("skill_cboots_d1")..BAD..trs("skill_cboots_d2"),
				                                                            	-2,			8,					{SKILL_CQARMOR}, TREE_DEFENSETREE)
GM:AddSkillModifier(SKILL_CQBOOTS, SKILLMOD_DMG_TAKEN, 0.10)

GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)
GM:AddSkillModifier(SKILL_MERIS, SKILLMOD_DAMAGE, -0.12)
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
GM:AddSkill(SKILL_DONATE3, "Donate III", GOOD.."+10% For XP\n"..BAD.."THX Chayok",
				                                                            	20,			22,					{SKILL_DONATE2}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE3, SKILLMOD_XP, 0.10) -- Донат должен давать лишь маленькое премущество 
SKILL_DONATE4 = 207
GM:AddSkill(SKILL_DONATE4, "Donate IV", GOOD.."+10% Reload Speed\n"..BAD.."THX cheetus and null",
				                                                            	21,			23,					{SKILL_DONATE3}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE4, SKILLMOD_RELOADSPEED_MUL, 0.10)
SKILL_DONATE5 = 208
GM:AddSkill(SKILL_DONATE5, "Donate V", GOOD.."Sale by 3%\n"..BAD.."Thx ivan36099",
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
GM:AddSkill(SKILL_DONATE17, "Donate XVII", GOOD.."-2% Damage taken\n"..GOOD.."Thx for Добрый",
				                                                            	18,			25,					{SKILL_DONATE16}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE17, SKILLMOD_DMG_TAKEN, -0.02)
GM:AddSkill(SKILL_DONATE18, "Donate XVIII", GOOD.."+2.5 luck\n"..GOOD.."Thx for Добрый",
				                                                            	19,			24,					{SKILL_DONATE17}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_DONATE18, SKILLMOD_LUCK, 2.5)


SKILL_CHALLENGER1 = 215
GM:AddSkill(SKILL_CHALLENGER1, "Challenger I", GOOD.."+20 Health,+1 luck, help for challenges!\n"..GOOD.."Can use in any challenge",
				                                                            	25,			26,					{SKILL_NONE, SKILL_CHALLENGER2}, TREE_DONATETREE)
GM:AddSkillModifier(SKILL_CHALLENGER1, SKILLMOD_LUCK, 1)																				
GM:AddSkillModifier(SKILL_CHALLENGER1, SKILLMOD_HEALTH, 10)
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
				                                                            	-22,			-53,					{SKILL_NONE}, TREE_MELEETREE)
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
GM:AddSkill(SKILL_USELESS_3, "Useless 3", GOOD.."+1% Arsenal discount",
				                                                            	1,			2,					{SKILL_USELESS_2}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_3, SKILLMOD_ARSENAL_DISCOUNT, -0.01)
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
GM:AddSkill(SKILL_USELESS_14, "Useless 14", GOOD.."-3% Melee damage taken mul\n You have TOO MUCH USELESS SKILL POINTS???",
				                                                            	1,		    -1,					{SKILL_USELESS_13}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_14, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.03)
SKILL_USELESS_15 = 514
GM:AddSkill(SKILL_USELESS_15, "Useless 15", GOOD.."-10% Damage taken while blocking",
				                                                            	1,		    -2,					{SKILL_USELESS_14}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_15, SKILLMOD_BLOCKMULTIPLIER, -0.10)
SKILL_USELESS_16 = 515
GM:AddSkill(SKILL_USELESS_16, "Useless 16", GOOD.."-10% Medkit Cooldown",
				                                                            	0,		    -2,					{SKILL_USELESS_15}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_16, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.10)
SKILL_USELESS_17 = 516
GM:AddSkill(SKILL_USELESS_17, "Useless 17", GOOD.."meh take this,+4 skills points(secret iv?)",
				                                                            	-2,		    -2,					{SKILL_USELESS_16}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_17, SKILLMOD_SPOINT, 5)
SKILL_USELESS_18 = 517
GM:AddSkill(SKILL_USELESS_18, "Useless 18", GOOD.."-15% Dimvision effectiveness",
				                                                            	-3,		    -1,					{SKILL_USELESS_17}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_18, SKILLMOD_DIMVISION_EFF_MUL, -0.15)
SKILL_USELESS_19 = 518
GM:AddSkill(SKILL_USELESS_19, "Useless 19", GOOD.."+20% Medic Heal Mul",
				                                                            	-3,		    -0,					{SKILL_USELESS_18}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_19, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.20)
SKILL_USELESS_20 = 519
GM:AddSkill(SKILL_USELESS_20, "Useless 20", GOOD.."+2 spoints",
				                                                            	-4,		    -0,					{SKILL_USELESS_19}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_20, SKILLMOD_SPOINT, 2)
SKILL_USELESS_21 = 520
GM:AddSkill(SKILL_USELESS_21, "Useless 21", GOOD.."+1% Sale",
				                                                            	-4,		    1,					{SKILL_USELESS_20}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_21, SKILLMOD_ARSENAL_DISCOUNT, -0.01)
SKILL_USELESS_22 = 521
GM:AddSkill(SKILL_USELESS_22, "Useless 22", GOOD.."-4% Damage taken",
				                                                            	-5,		    1,					{SKILL_USELESS_21}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_22, SKILLMOD_DMG_TAKEN, -0.04)
SKILL_USELESS_23 = 522
GM:AddSkill(SKILL_USELESS_23, "Useless 23", GOOD.."+4% Attachment chance for use",
				                                                            	-5,		    -1,					{SKILL_USELESS_22}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_23, SKILLMOD_ATT_CHANCE, -0.04)
SKILL_USELESS_24 = 523
GM:AddSkill(SKILL_USELESS_24, "Useless 24", GOOD.."+5% Damage vs gods",
				                                                            	-5,		    -2,					{SKILL_USELESS_23}, TREE_USELESSTREE)
SKILL_USELESS_25 = 524
GM:AddSkill(SKILL_USELESS_25, "Useless 25", GOOD.."+2% XP Multiplier",
				                                                            	-5,		    -3,					{SKILL_USELESS_24}, TREE_USELESSTREE)
GM:AddSkillModifier(SKILL_USELESS_25, SKILLMOD_XP, 0.02)






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
GM:SetSkillModifierFunction(SKILLMOD_RES_EFFECTIVNESS, function(pl, amount)
	pl.RessuplyEff = math.Clamp(amount + 1.0, 0.0, 100.0)
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
GM:SetSkillModifierFunction(SKILLMOD_HP_PER_WAVE, function(pl, amount)
	pl.HPPerWave = math.Clamp(amount, -50, 100.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_SP_PER_WAVE, function(pl, amount)
	pl.SPPerWave = math.Clamp(amount, -500, 100.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_STAMINA_ADD, function(pl, amount)
	pl.StaminaAdd = math.Clamp(amount+1, -1, 100.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_STAMINA_USE, function(pl, amount)
	pl.StaminaUse = math.Clamp(amount+1, -1, 100.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_C_USE, function(pl, amount)
	pl.ChargesUse = math.Clamp(amount+1, 0, 100.0)
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
	pl.CurseMultiplier = math.Clamp(amount + 1.0, -10.0, 1000.0)
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
	pl.ArsenalDiscount = math.Clamp(amount + 1.0, 0.15, 1000.0)
end)
GM:SetSkillModifierFunction(SKILLMOD_SCRAPDISCOUNT, GM:MkGenericMod("ScrapDiscount"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_RADIUS, GM:MkGenericMod("CloudRadius"))
GM:SetSkillModifierFunction(SKILLMOD_CLOUD_TIME, GM:MkGenericMod("CloudTime"))
GM:SetSkillModifierFunction(SKILLMOD_EXP_DAMAGE_MUL, GM:MkGenericMod("ExplosiveDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_PROJECTILE_DAMAGE_MUL, GM:MkGenericMod("ProjectileDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_TURRET_RANGE_MUL, GM:MkGenericMod("TurretRangeMul"))
GM:SetSkillModifierFunction(SKILLMOD_AIM_SHAKE_MUL, GM:MkGenericMod("AimShakeMul"))
GM:SetSkillModifierFunction(SKILLMOD_THROWER_DAMAGE, GM:MkGenericMod("ThrowDamageMul"))
GM:SetSkillModifierFunction(SKILLMOD_DEBUFF_TIME, GM:MkGenericMod("AdditionalDebuffTime"))

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


GM:AddSkillModifier(SKILL_VOR, SKILLMOD_RES_EFFECTIVNESS, -0.2)
GM:AddSkillModifier(SKILL_ANTIVOR, SKILLMOD_RES_EFFECTIVNESS, 0.1)

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

GM:AddSkillModifier(SKILL_ASAVE, SKILLMOD_SPEED, -15)

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

GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_RELOADSPEED_MUL, 0.1)
GM:AddSkillModifier(SKILL_SLEIGHTOFHAND, SKILLMOD_AIMSPREAD_MUL, 0.05)

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

GM:AddSkillModifier(SKILL_HYPERCOAGULATION, SKILLMOD_HEALING_RECEIVED, -0.9)
GM:AddSkillFunction(SKILL_HYPERCOAGULATION, function(pl, active)
	pl.HyperCoagulation = active
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
GM:AddSkillModifier(SKILL_D_LATEBUYER, SKILLMOD_ARSENAL_DISCOUNT, -0.10)

GM:AddSkillModifier(SKILL_STOCKPILE, SKILLMOD_RES_AMMO_MUL, 0.50)

GM:AddSkillModifier(SKILL_FREEAMMO, SKILLMOD_RES_AMMO_MUL, 0.05)

GM:AddSkillFunction(SKILL_TAUT, function(pl, active)
	pl.BuffTaut = active
end)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, 0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_DEPLOYABLE_HEALTH_MUL, -0.50)
GM:AddSkillModifier(SKILL_CARRIER, SKILLMOD_PROP_CARRY_SLOW_MUL, -1)

GM:AddSkillModifier(SKILL_EXPLOIT, SKILLMOD_DEPLOYABLE_HEALTH_MUL, -0.33)

GM:AddSkillModifier(SKILL_BLOODARMOR, SKILLMOD_HEALTH, -5)

GM:AddSkillModifier(SKILL_HAEMOSTASIS, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.06)
GM:AddSkillModifier(SKILL_LEUKEMIA, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.25)
GM:AddSkillModifier(SKILL_X_GEN, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.10)
GM:AddSkillModifier(SKILL_X_GEN, SKILLMOD_BLOODARMOR, 45)
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
GM:AddSkillModifier(SKILL_WORTHINESS5, SKILLMOD_WORTH, 10)

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
GM:AddSkillModifier(SKILL_M_CHAINS, SKILLMOD_MEDKIT_COOLDOWN_MUL, 0.25)

GM:AddSkillModifier(SKILL_MASTERCHEF, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

GM:AddSkillModifier(SKILL_LIGHTWEIGHT, SKILLMOD_MELEE_DAMAGE_MUL, -0.2)

GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_JUMPPOWER_MUL, 0.04)
GM:AddSkillModifier(SKILL_AGILEI, SKILLMOD_SPEED, -2)

GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_JUMPPOWER_MUL, 0.05)
GM:AddSkillModifier(SKILL_AGILEII, SKILLMOD_SPEED, -3)

GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_JUMPPOWER_MUL, 0.06)
GM:AddSkillModifier(SKILL_AGILEIII, SKILLMOD_SPEED, -4)

GM:AddSkillModifier(SKILL_SOUL_TRADE, SKILLMOD_POINT_MULTIPLIER, 0.333)

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

GM:AddSkillModifier(SKILL_HOLE_OF_HELL, SKILLMOD_ELEMENTAL_MUL, -0.25)

GM:AddSkillModifier(SKILL_N_FRIEND, SKILLMOD_ELEMENTAL_MUL,-0.25)
GM:AddSkillModifier(SKILL_N_FRIEND, SKILLMOD_IND_DMG_TAKEN,-0.33)

GM:AddSkillModifier(SKILL_IRONBLOOD, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.25)
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

GM:AddSkillModifier(SKILL_SKYHELP, SKILLMOD_ARSENAL_DISCOUNT, -0.1)


GM:AddSkillModifier(SKILL_MOTHER, SKILLMOD_SCRAPDISCOUNT, 0.15)


GM:AddSkillModifier(SKILL_CURSECURE, SKILLMOD_CURSEM, 0.20)
GM:AddSkillModifier(SKILL_CURSECURE, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)

GM:AddSkillModifier(SKILL_INSIGHT, SKILLMOD_ARSENAL_DISCOUNT, 0.02)
GM:AddSkillModifier(SKILL_ACUITY, SKILLMOD_ARSENAL_DISCOUNT, -0.02)

GM:AddSkillModifier(SKILL_VKID, SKILLMOD_JUMPPOWER_MUL, 0.30)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_SPEED, 60)
GM:AddSkillModifier(SKILL_VKID, SKILLMOD_HEALTH, -50)

GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_JUMPPOWER_MUL, 0.30)
GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_SPEED, 15)
GM:AddSkillModifier(SKILL_VKID2, SKILLMOD_HEALTH, -65)

GM:AddSkillModifier(SKILL_CURSEDHEALTH, SKILLMOD_CURSEM, -0.25)
GM:AddSkillModifier(SKILL_CRESCENDO1, SKILLMOD_HP_PER_WAVE, 4)
GM:AddSkillModifier(SKILL_CRESCENDO2, SKILLMOD_HP_PER_WAVE, 4)
GM:AddSkillModifier(SKILL_CRESCENDO3, SKILLMOD_HP_PER_WAVE, 4)

GM:AddSkillModifier(SKILL_CRESCENDO1, SKILLMOD_SP_PER_WAVE, -3)
GM:AddSkillModifier(SKILL_CRESCENDO2, SKILLMOD_SP_PER_WAVE, -4)
GM:AddSkillModifier(SKILL_CRESCENDO3, SKILLMOD_SP_PER_WAVE, -2)

GM:AddSkillModifier(SKILL_SLOWCOACH, SKILLMOD_SP_PER_WAVE, 3)

GM:AddSkillModifier(SKILL_LUCKY_UNLIVER, SKILLMOD_HP_PER_WAVE, -5)


GM:AddSkillFunction(SKILL_RESNYATOST, function(pl, active)
	pl.ResnyaMoment = active
end)
GM:AddSkillFunction(SKILL_TOY_BEST_FRIEND, function(pl, active)
	pl.BestFriend = active
end)
GM:AddSkillModifier(SKILL_PURGATORY, SKILLMOD_DAMAGE, -0.15)
GM:AddSkillFunction(SKILL_PURGATORY, function(pl, active)
	pl.Purgatory = active
end)
GM:AddSkillModifier(SKILL_SOY, SKILLMOD_HAMMER_SWING_DELAY_MUL, 0.5)
GM:AddSkillFunction(SKILL_SOY, function(pl, active)
	pl.SoyMilk = active
end)
GM:AddSkillFunction(SKILL_STAMINA, function(pl, active)
	pl.StaminaHAHA = active
end)
GM:AddSkillFunction(SKILL_SHINNING_HIT, function(pl, active)
	pl.ShineAndHit = active
end)
GM:AddSkillFunction(SKILL_BIRD_EYE, function(pl, active)
	pl.BirdEye = active
end)
GM:AddSkillFunction(SKILL_FAST_EYE, function(pl, active)
	pl.FastEye = active
end)
GM:AddSkillFunction(SKILL_HOLE_OF_HELL, function(pl, active)
	pl.HoleOfHell = active
end)
GM:AddSkillFunction(SKILL_NO_BALANCE, function(pl, active)
	pl.Balance2 = active
end)
GM:AddSkillModifier(SKILL_EXPLOIT_BUG, SKILLMOD_SCRAPDISCOUNT, 0.10)