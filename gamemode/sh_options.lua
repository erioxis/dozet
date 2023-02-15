GM.ZombieEscapeWeaponsPrimary = {
	"weapon_zs_zeakbar",
	"weapon_zs_zesweeper",
	"weapon_zs_zesmg",
	"weapon_zs_zeinferno",
	"weapon_zs_zestubber",
	"weapon_zs_zebulletstorm",
	"weapon_zs_zesilencer",
	"weapon_zs_zequicksilver",
	"weapon_zs_zeamigo",
	"weapon_zs_zem4",
	"weapon_zs_zeboomstick"
}

GM.ZombieEscapeWeaponsSecondary = {
	"weapon_zs_zedeagle",
	"weapon_zs_zebattleaxe",
	"weapon_zs_zeeraser",
	"weapon_zs_zeglock",
	"weapon_zs_zetempest"
}
GM.HintsFromASigil = {
	"ahint_1",
	"ahint_2",
	"ahint_3",
	"ahint_4",
	"ahint_5",
	"ahint_6",
	"ahint_7",
	"ahint_8",
	"ahint_9",
	"ahint_10",
	"ahint_11",
	"ahint_12",
	"ahint_13",
	"ahint_14",
	"ahint_15",
	"ahint_16",
}

-- Change this if you plan to alter the cost of items or you severely change how Worth works.
-- Having separate cart files allows people to have separate loadouts for different servers.
GM.CartFile = "zscarts_dozet.txt"
GM.SkillLoadoutsFile = "zsskloadouts.txt"



ITEMCAT_GUNS = 1
ITEMCAT_AMMO = 2
ITEMCAT_MELEE = 3
ITEMCAT_TOOLS = 4
ITEMCAT_DEPLOYABLES = 5
ITEMCAT_TRINKETS = 6
ITEMCAT_OTHER = 7
ITEMCAT_SPECIAL = 8
ITEMCAT_MAGIC = 9

ITEMCAT_MUTATIONS = 1
ITEMCAT_MUTATIONS_BOSS = 2



ITEMSUBCAT_TRINKETS_DEFENSIVE = 1
ITEMSUBCAT_TRINKETS_OFFENSIVE = 2
ITEMSUBCAT_TRINKETS_MELEE = 3
ITEMSUBCAT_TRINKETS_PERFOMANCE = 4
ITEMSUBCAT_TRINKETS_SUPPORT = 5
ITEMSUBCAT_TRINKETS_SPECIAL = 6
ITEMSUBCAT_TRINKETS_SUPER = 7




GM.ItemCategories = {
	[ITEMCAT_GUNS] = translate.Get("pshop_w"),
	[ITEMCAT_AMMO] = translate.Get("pshop_ammo"),
	[ITEMCAT_MELEE] = translate.Get("pshop_melee"),
	[ITEMCAT_TOOLS] = translate.Get("pshop_tools"),
	[ITEMCAT_DEPLOYABLES] = translate.Get("pshop_dep"),
	[ITEMCAT_TRINKETS] = translate.Get("pshop_trinkets"),
	[ITEMCAT_OTHER] = translate.Get("pshop_other"),
	[ITEMCAT_SPECIAL] = translate.Get("skill_lul"),
	[ITEMCAT_MAGIC]	= translate.Get("pshop_magic")


}
GM.MutItemCategories = {
	[ITEMCAT_MUTATIONS]	 = translate.Get("pshop_mut"),
	[ITEMCAT_MUTATIONS_BOSS]	= translate.Get("pshop_b_mut")
}

GM.ItemSubCategories = {
	[ITEMSUBCAT_TRINKETS_DEFENSIVE] = translate.Get("t_subcat_def"),
	[ITEMSUBCAT_TRINKETS_OFFENSIVE] = translate.Get("t_subcat_off"),
	[ITEMSUBCAT_TRINKETS_MELEE] = translate.Get("t_subcat_mel"),
	[ITEMSUBCAT_TRINKETS_PERFOMANCE] = translate.Get("t_subcat_per"),
	[ITEMSUBCAT_TRINKETS_SUPPORT] = translate.Get("t_subcat_sup"),
	[ITEMSUBCAT_TRINKETS_SPECIAL] = translate.Get("t_subcat_spc"),
	[ITEMSUBCAT_TRINKETS_SUPER] = translate.Get("t_subcat_spr")

}

--[[
Humans select what weapons (or other things) they want to start with and can even save favorites. Each object has a number of 'Worth' points.
Signature is a unique signature to give in case the item is renamed or reordered. Don't use a number or a string number!
A human can only use 100 points (default) when they join. Redeeming or joining late starts you out with a random loadout from above.
SWEP is a swep given when the player spawns with that perk chosen.
Callback is a function called. Model is a display model. If model isn't defined then the SWEP model will try to be used.
swep, callback, and model can all be nil or empty
]]
GM.Items = {}
function GM:AddItem(signature, category, price, swep, name, desc, model, callback)
	local tab = {Signature = signature, Name = name or "?", Description = desc, Category = category, Price = price or 0, SWEP = swep, Callback = callback, Model = model}

	tab.Worth = tab.Price -- compat

	self.Items[#self.Items + 1] = tab
	self.Items[signature] = tab

	return tab
end

function GM:AddAPointShopItem(signature, category, price, swep, name, desc, model, callback)
	local item = self:AddItem("ps_"..signature, category, price, swep, name, desc, model, callback)
	item.APointShop = true

	return item
end

function GM:AddStartingItem(signature, category, price, swep, name, desc, model, callback)
	local item = self:AddItem(signature, category, price, swep, name, desc, model, callback)
	item.WorthShop = true

	return item
end

function GM:AddPointShopItem(signature, category, price, swep, name, desc, model, callback)
	local item = self:AddItem("ps_"..signature, category, price, swep, name, desc, model, callback)
	item.PointShop = true

	return item
end
GM.Mutations = {}

function GM:AddMutation(signature, name, desc, mutcategory, worth, swep, callback, model, worthshop, mutationshop)
	local tab = {Signature = signature, Name = name, Description = desc, MutCategory = mutcategory, Worth = worth or 0, SWEP = swep, Callback = callback, Model = model, WorthShop = worthshop, MutationShop = mutationshop}
	self.Mutations[#self.Mutations + 1] = tab

	return tab
end

function GM:AddMutationItem(signature, name, desc, mutcategory, brains, worth, callback, model)
	return self:AddMutation(signature, name, desc, mutcategory, brains, worth, callback, model, false, true)
end

-- How much ammo is considered one 'clip' of ammo? For use with setting up weapon defaults. Works directly with zs_survivalclips
GM.AmmoCache = {}
GM.AmmoCache["ar2"]							= 70		-- Assault rifles.
GM.AmmoCache["alyxgun"]						= 24		-- Not used.
GM.AmmoCache["pistol"]						= 30		-- Pistols.
GM.AmmoCache["smg1"]						= 65		-- SMG's and some rifles.
GM.AmmoCache["357"]							= 16		-- Rifles, especially of the sniper variety.
GM.AmmoCache["xbowbolt"]					= 10		-- Crossbows
GM.AmmoCache["buckshot"]					= 16		-- Shotguns
GM.AmmoCache["ar2altfire"]					= 1			-- Not used.
GM.AmmoCache["slam"]						= 1			-- Force Field Emitters.
GM.AmmoCache["rpg_round"]					= 1			-- Not used. Rockets?
GM.AmmoCache["smg1_grenade"]				= 1			-- Not used.
GM.AmmoCache["sniperround"]					= 1			-- Barricade Kit
GM.AmmoCache["sniperpenetratedround"]		= 1			-- Remote Det pack.
GM.AmmoCache["grenade"]						= 1			-- Grenades.
GM.AmmoCache["thumper"]						= 1			-- Gun turret.
GM.AmmoCache["gravity"]						= 1			-- Unused.
GM.AmmoCache["battery"]						= 45		-- Used with the Medical Kit.
GM.AmmoCache["gaussenergy"]					= 4		-- Nails used with the Carpenter's Hammer.
GM.AmmoCache["combinecannon"]				= 1			-- Not used.
GM.AmmoCache["airboatgun"]					= 1			-- Arsenal crates.
GM.AmmoCache["striderminigun"]				= 1			-- Message beacons.
GM.AmmoCache["helicoptergun"]				= 1			-- Resupply boxes.
GM.AmmoCache["spotlamp"]					= 1
GM.AmmoCache["manhack"]						= 1
GM.AmmoCache["repairfield"]					= 1
GM.AmmoCache["medstation"]					= 1
GM.AmmoCache["zapper"]						= 1
GM.AmmoCache["pulse"]						= 50
GM.AmmoCache["impactmine"]					= 5
GM.AmmoCache["chemical"]					= 60
GM.AmmoCache["flashbomb"]					= 1
GM.AmmoCache["turret_buckshot"]				= 1
GM.AmmoCache["turret_assault"]				= 1
GM.AmmoCache["sigil_port"]				= 1
GM.AmmoCache["turret_super"]				= 1
GM.AmmoCache["scrap"]						= 4


GM.AmmoResupply = table.ToAssoc({"ar2", "pistol", "smg1", "357", "xbowbolt", "buckshot", "battery", "pulse", "impactmine", "chemical", "gaussenergy", "scrap", "grenade", "sniperround"})

-----------
-- Worth --
-----------

GM:AddStartingItem("pshtr",				ITEMCAT_GUNS,			30,				"weapon_zs_peashooter")
GM:AddStartingItem("btlax",				ITEMCAT_GUNS,			30,				"weapon_zs_battleaxe")
GM:AddStartingItem("owens",				ITEMCAT_GUNS,			30,				"weapon_zs_owens")
GM:AddStartingItem("blstr",				ITEMCAT_GUNS,			30,				"weapon_zs_blaster")
GM:AddStartingItem("tossr",				ITEMCAT_GUNS,			30,				"weapon_zs_tosser")
GM:AddStartingItem("stbbr",				ITEMCAT_GUNS,			30,				"weapon_zs_stubber")
GM:AddStartingItem("crklr",				ITEMCAT_GUNS,			30,				"weapon_zs_crackler")
GM:AddStartingItem("sling",				ITEMCAT_GUNS,			30,				"weapon_zs_slinger")
GM:AddStartingItem("z9000",				ITEMCAT_GUNS,			30,				"weapon_zs_z9000")
GM:AddStartingItem("minelayer",			ITEMCAT_GUNS,			30,				"weapon_zs_minelayer")
GM:AddStartingItem("chemar",			ITEMCAT_GUNS,			15,				"weapon_zs_chemar")



GM:AddStartingItem("2pcp",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_pistol").." (x28)",				nil,		"ammo_pistol",			function(pl) pl:GiveAmmo(28, "pistol", true) end)
GM:AddStartingItem("3pcp",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_pistol").." (x42)",				nil,		"ammo_pistol",			function(pl) pl:GiveAmmo(42, "pistol", true) end)
GM:AddStartingItem("2sgcp",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_buckshot").." (x24)",				nil,		"ammo_shotgun",			function(pl) pl:GiveAmmo(24, "buckshot", true) end)
GM:AddStartingItem("3sgcp",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_buckshot").." (x36)",				nil,		"ammo_shotgun",			function(pl) pl:GiveAmmo(36, "buckshot", true) end)
GM:AddStartingItem("2smgcp",			ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_smg").." (x72)",					nil,		"ammo_smg",				function(pl) pl:GiveAmmo(72, "smg1", true) end)
GM:AddStartingItem("3smgcp",			ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_smg").." (x108)",					nil,		"ammo_smg",				function(pl) pl:GiveAmmo(108, "smg1", true) end)
GM:AddStartingItem("2arcp",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_assaultrifle").." (x64)",		nil,		"ammo_assault",			function(pl) pl:GiveAmmo(64, "ar2", true) end)
GM:AddStartingItem("3arcp",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_assaultrifle").." (x96)",		nil,		"ammo_assault",			function(pl) pl:GiveAmmo(96, "ar2", true) end)
GM:AddStartingItem("2rcp",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_rifle").." (x16)",				nil,		"ammo_rifle",			function(pl) pl:GiveAmmo(16, "357", true) end)
GM:AddStartingItem("3rcp",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_rifle").." (x24)",				nil,		"ammo_rifle",			function(pl) pl:GiveAmmo(24, "357", true) end)
GM:AddStartingItem("2pls",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_pulseshots").." (x60)",				nil,		"ammo_pulse",			function(pl) pl:GiveAmmo(60, "pulse", true) end)
GM:AddStartingItem("3pls",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_pulseshots").." (x90)",				nil,		"ammo_pulse",			function(pl) pl:GiveAmmo(90, "pulse", true) end)
GM:AddStartingItem("xbow1",				ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_bolts").." (x16)",			nil,		"ammo_bolts",			function(pl) pl:GiveAmmo(16, "XBowBolt", true) end)
GM:AddStartingItem("xbow2",				ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_bolts").." (x24)",			nil,		"ammo_bolts",			function(pl) pl:GiveAmmo(24, "XBowBolt", true) end)
GM:AddStartingItem("4mines",			ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_explosives").." (x6)",					nil,		"ammo_explosive",		function(pl) pl:GiveAmmo(6, "impactmine", true) end)
GM:AddStartingItem("6mines",			ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_explosives").." (x9)",					nil,		"ammo_explosive",		function(pl) pl:GiveAmmo(9, "impactmine", true) end)
GM:AddStartingItem("8nails",			ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_nails").." (x9)",						nil, 		"ammo_nail", 			function(pl) pl:GiveAmmo(8, "GaussEnergy", true) end)
GM:AddStartingItem("12nails",			ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_nails").." (x12)",						nil, 		"ammo_nail", 			function(pl) pl:GiveAmmo(12, "GaussEnergy", true) end)
GM:AddStartingItem("60mkit",			ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_medicalsupplies").." (x100)",				nil,		"ammo_medpower",		function(pl) pl:GiveAmmo(100, "Battery", true) end)
GM:AddStartingItem("90mkit",			ITEMCAT_AMMO,			25,				nil,			translate.Get("ammo_medicalsupplies").." (x120)",				nil,		"ammo_medpower",		function(pl) pl:GiveAmmo(120, "Battery", true) end)
GM:AddStartingItem("scrap",		    	ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_scrap").." (x15)",				nil,		"ammo_scrap",		function(pl) pl:GiveAmmo(15, "Scrap", true) end)
GM:AddStartingItem("scraper",			ITEMCAT_AMMO,			30,				nil,			translate.Get("ammo_scrap").." (x25)",				nil,		"ammo_scrap",		function(pl) pl:GiveAmmo(25, "Scrap", true) end)
GM:AddStartingItem("chemical55",		    	ITEMCAT_AMMO,			15,				nil,			translate.Get("ammo_chemicals").." (x55)",				nil,		"ammo_chemical",		function(pl) pl:GiveAmmo(55, "chemical", true) end)
GM:AddStartingItem("chemical95",			ITEMCAT_AMMO,			20,				nil,			translate.Get("ammo_chemicals").." (x95)",				nil,		"ammo_chemical",		function(pl) pl:GiveAmmo(95, "chemical", true) end)



GM:AddStartingItem("brassknuckles",		ITEMCAT_MELEE,			25,				"weapon_zs_brassknuckles").Model = "models/props_c17/utilityconnecter005.mdl"
GM:AddStartingItem("zpaxe",				ITEMCAT_MELEE,			25,				"weapon_zs_axe")
GM:AddStartingItem("stnbtn",			ITEMCAT_MELEE,			25,				"weapon_zs_stunbaton")
GM:AddStartingItem("csknf",				ITEMCAT_MELEE,			10,				"weapon_zs_swissarmyknife")
GM:AddStartingItem("zpplnk",			ITEMCAT_MELEE,			25,				"weapon_zs_plank")
GM:AddStartingItem("zpfryp",			ITEMCAT_MELEE,			25,				"weapon_zs_fryingpan")
GM:AddStartingItem("zpcpot",			ITEMCAT_MELEE,			25,				"weapon_zs_pot")
GM:AddStartingItem("ladel",				ITEMCAT_MELEE,			25,				"weapon_zs_ladel")
GM:AddStartingItem("pipe",				ITEMCAT_MELEE,			25,				"weapon_zs_pipe")
GM:AddStartingItem("hook",				ITEMCAT_MELEE,			25,				"weapon_zs_hook")
GM:AddStartingItem("lamp",				ITEMCAT_MELEE,			25,				"weapon_zs_lamp")

local item
GM:AddStartingItem("medkit",			ITEMCAT_TOOLS,			30,				"weapon_zs_medicalkit")
GM:AddStartingItem("medgun",			ITEMCAT_TOOLS,			55,				"weapon_zs_medicgun")
item =
GM:AddStartingItem("strengthshot",		ITEMCAT_TOOLS,			40,				"weapon_zs_strengthshot")
item.SkillRequirement = SKILL_U_STRENGTHSHOT
item =
GM:AddStartingItem("antidoteshot",		ITEMCAT_TOOLS,			40,				"weapon_zs_antidoteshot")
item.SkillRequirement = SKILL_U_ANTITODESHOT
GM:AddStartingItem("resupplybox",		ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_resupplybox")
.Countables = "prop_resupplybox"
GM:AddStartingItem("remantler",			ITEMCAT_DEPLOYABLES,			20,				"weapon_zs_remantler")
.Countables = "prop_remantler"
item =
GM:AddStartingItem("infturret",			ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_gunturret",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret") pl:GiveAmmo(1, "thumper") pl:GiveAmmo(125, "smg1") end)
item.Countables = "prop_gunturret"
item.NoClassicMode = true
item =
GM:AddStartingItem("blastturret",		ITEMCAT_DEPLOYABLES,			35,				"weapon_zs_gunturret_buckshot",	nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret_buckshot") pl:GiveAmmo(1, "turret_buckshot") pl:GiveAmmo(30, "buckshot") end)
item.Countables = "prop_gunturret_buckshot"
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_BLASTTURRET
item =
GM:AddStartingItem("repairfield",		ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_repairfield",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_repairfield") pl:GiveAmmo(1, "repairfield") pl:GiveAmmo(50, "pulse") end)
item.Countables = "prop_repairfield"
item.NoClassicMode = true
item =
GM:AddStartingItem("zapper",			ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_zapper",				nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_zapper") pl:GiveAmmo(1, "zapper") pl:GiveAmmo(50, "pulse") end)
item.Countables = "prop_zapper"
item.NoClassicMode = true
item =
GM:AddStartingItem("medstation1",		ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_medstation",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_medstation") pl:GiveAmmo(1, "medstation") pl:GiveAmmo(150, "pulse") end)
item.Countables = "prop_medstation"
GM:AddStartingItem("manhack",			ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_manhack").Countables = "prop_manhack"
item =
GM:AddStartingItem("drone",				ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_drone",				nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_drone") pl:GiveAmmo(1, "drone") pl:GiveAmmo(60, "smg1") end)
item.Countables = "prop_drone"
item =
GM:AddStartingItem("pulsedrone",		ITEMCAT_DEPLOYABLES,			20,				"weapon_zs_drone_pulse",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_drone_pulse") pl:GiveAmmo(1, "pulse_cutter") pl:GiveAmmo(60, "pulse") end)
item.Countables = "prop_drone_pulse"
item.SkillRequirement = SKILL_U_DRONE
item =
GM:AddStartingItem("hauldrone",			ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_drone_hauler",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_drone_hauler") pl:GiveAmmo(1, "drone_hauler") end)
item.Countables = "prop_drone_hauler"
item.SkillRequirement = SKILL_HAULMODULE
item =
GM:AddStartingItem("healdrone",			ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_drone_healer",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_drone_healer") pl:GiveAmmo(1, "drone_healer") end)
item.Countables = "prop_drone_healer"
item.SkillRequirement = SKILL_HEALMODULE
item =
GM:AddStartingItem("rollermine",		ITEMCAT_DEPLOYABLES,			35,				"weapon_zs_rollermine",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_rollermine") pl:GiveAmmo(1, "rollermine") end)
item.Countables = "prop_rollermine"
item.SkillRequirement = SKILL_U_ROLLERMINE

GM:AddStartingItem("wrench",			ITEMCAT_TOOLS,			20,				"weapon_zs_wrench").NoClassicMode = true
GM:AddStartingItem("crphmr",			ITEMCAT_TOOLS,			25,				"weapon_zs_hammer").NoClassicMode = true
GM:AddStartingItem("electoh",			ITEMCAT_TOOLS,			45,				"weapon_zs_electrohammer").NoClassicMode = true
GM:AddStartingItem("junkpack",			ITEMCAT_DEPLOYABLES,	30,				"weapon_zs_boardpack")
GM:AddStartingItem("normpack",			ITEMCAT_DEPLOYABLES,	30,				"weapon_zs_normalpack")
GM:AddStartingItem("propanetank",		ITEMCAT_TOOLS,			10,				"comp_propanecan")
GM:AddStartingItem("busthead",			ITEMCAT_TOOLS,			25,				"comp_busthead")
GM:AddStartingItem("sawblade",			ITEMCAT_TOOLS,			25,				"comp_sawblade")
GM:AddStartingItem("cpuparts",			ITEMCAT_TOOLS,			15,				"comp_cpuparts")
GM:AddStartingItem("electrobattery",	ITEMCAT_TOOLS,			35,				"comp_electrobattery")
GM:AddStartingItem("singurhamemer",	        ITEMCAT_TOOLS,			75,				"weapon_zs_singurhammer").NoClassicMode = true

GM:AddStartingItem("msgbeacon",			ITEMCAT_DEPLOYABLES,			10,				"weapon_zs_messagebeacon").Countables = "prop_messagebeacon"
item =
GM:AddStartingItem("ffemitter",			ITEMCAT_DEPLOYABLES,			45,				"weapon_zs_ffemitter",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_ffemitter") pl:GiveAmmo(1, "slam") pl:GiveAmmo(50, "pulse") end)
item.Countables = "prop_ffemitter"
GM:AddStartingItem("barricadekit",		ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_barricadekit")
GM:AddStartingItem("camera",			ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_camera").Countables = "prop_camera"
GM:AddStartingItem("tv",				ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_tv").Countables = "prop_tv"

GM:AddStartingItem("oxtank",			ITEMCAT_TRINKETS,		5,				"trinket_oxygentank").SubCategory =				ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("boxingtraining",	ITEMCAT_TRINKETS,		10,				"trinket_boxingtraining").SubCategory =			ITEMSUBCAT_TRINKETS_MELEE
GM:AddStartingItem("cutlery",			ITEMCAT_TRINKETS,		10,				"trinket_cutlery").SubCategory =				ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddStartingItem("portablehole",		ITEMCAT_TRINKETS,		10,				"trinket_portablehole").SubCategory =			ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("acrobatframe",		ITEMCAT_TRINKETS,		15,				"trinket_acrobatframe").SubCategory=			ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("nightvision",		ITEMCAT_TRINKETS,		15,				"trinket_nightvision").SubCategory =			ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("targetingvisi",		ITEMCAT_TRINKETS,		15,				"trinket_targetingvisori").SubCategory =		ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddStartingItem("pulseampi",			ITEMCAT_TRINKETS,		15,				"trinket_pulseampi").SubCategory =				ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddStartingItem("blueprintsi",		ITEMCAT_TRINKETS,		15,				"trinket_blueprintsi").SubCategory =			ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddStartingItem("loadingframe",		ITEMCAT_TRINKETS,		15,				"trinket_loadingex").SubCategory =				ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("kevlar",			ITEMCAT_TRINKETS,		15,				"trinket_kevlar").SubCategory =					ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddStartingItem("momentumsupsysii",	ITEMCAT_TRINKETS,		15,				"trinket_momentumsupsysii").SubCategory =		ITEMSUBCAT_TRINKETS_MELEE
GM:AddStartingItem("hemoadrenali",		ITEMCAT_TRINKETS,		15,				"trinket_hemoadrenali").SubCategory =			ITEMSUBCAT_TRINKETS_MELEE
GM:AddStartingItem("vitpackagei",		ITEMCAT_TRINKETS,		20,				"trinket_vitpackagei").SubCategory =			ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddStartingItem("processor",			ITEMCAT_TRINKETS,		20,				"trinket_processor").SubCategory =				ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddStartingItem("cardpackagei",		ITEMCAT_TRINKETS,		20,				"trinket_cardpackagei").SubCategory =			ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddStartingItem("bloodpack",			ITEMCAT_TRINKETS,		20,				"trinket_bloodpack").SubCategory =				ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddStartingItem("biocleanser",		ITEMCAT_TRINKETS,		20,				"trinket_biocleanser").SubCategory =			ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("reactiveflasher",	ITEMCAT_TRINKETS,		5,				"trinket_reactiveflasher").SubCategory =		ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("magnet",			ITEMCAT_TRINKETS,		10,				"trinket_magnet").SubCategory =					ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddStartingItem("resupplypack",		ITEMCAT_TRINKETS,		25,				"trinket_resupplypack").SubCategory =			ITEMSUBCAT_TRINKETS_SUPPORT

GM:AddStartingItem("m_w_damager",				ITEMCAT_MAGIC,			75,				"weapon_zs_m_damage")
GM:AddStartingItem("m_w_heal",				ITEMCAT_MAGIC,			75,				"weapon_zs_m_heal")
GM:AddStartingItem("m_w_boom",				ITEMCAT_MAGIC,			75,				"weapon_zs_m_boom")
GM:AddStartingItem("stone",				ITEMCAT_OTHER,			5,				"weapon_zs_stone")
GM:AddStartingItem("grenade",			ITEMCAT_OTHER,			20,				"weapon_zs_grenade")
GM:AddStartingItem("h_o_l_y_grenade",			ITEMCAT_OTHER,			45,				"weapon_zs_holy_grenade")
GM:AddStartingItem("flashbomb",			ITEMCAT_OTHER,			15,				"weapon_zs_flashbomb")
GM:AddStartingItem("betty",				ITEMCAT_OTHER,			10,				"weapon_zs_proxymine")
GM:AddStartingItem("corgasgrenade",		ITEMCAT_OTHER,			40,				"weapon_zs_corgasgrenade")
GM:AddStartingItem("crygasgrenade",		ITEMCAT_OTHER,			35,				"weapon_zs_crygasgrenade").SkillRequirement = SKILL_U_CRYGASGREN
GM:AddStartingItem("detpck",			ITEMCAT_OTHER,			55,				"weapon_zs_detpack").Countables = "prop_detpack"
item =
GM:AddStartingItem("sigfragment",		ITEMCAT_OTHER,			25,				"weapon_zs_sigilfragment")
item.NoClassicMode = true
item =
GM:AddStartingItem("corfragment",		ITEMCAT_OTHER,			35,				"weapon_zs_corruptedfragment")
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_CORRUPTEDFRAGMENT
item =
GM:AddStartingItem("medcloud",			ITEMCAT_OTHER,			25,				"weapon_zs_mediccloudbomb")
item.SkillRequirement = SKILL_U_MEDICCLOUD
item =
GM:AddStartingItem("nanitecloud",		ITEMCAT_OTHER,			25,				"weapon_zs_nanitecloudbomb")

GM:AddStartingItem("bloodshot",			ITEMCAT_OTHER,			35,				"weapon_zs_bloodshotbomb")



------------
-- Points --
------------
--Magic
GM:AddPointShopItem("magicheal",			ITEMCAT_MAGIC,			400,				"weapon_zs_m_heal")
GM:AddPointShopItem("magicdamage",			ITEMCAT_MAGIC,			400,				"weapon_zs_m_damage")
GM:AddPointShopItem("magicboom",			ITEMCAT_MAGIC,			400,				"weapon_zs_m_boom")

-- Tier 1
GM:AddPointShopItem("pshtr",			ITEMCAT_GUNS,			35,				"weapon_zs_peashooter", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_peashooter") end)
GM:AddPointShopItem("btlax",			ITEMCAT_GUNS,			35,				"weapon_zs_battleaxe", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_battleaxe") end)
GM:AddPointShopItem("owens",			ITEMCAT_GUNS,			35,				"weapon_zs_owens", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_owens") end)
GM:AddPointShopItem("blstr",			ITEMCAT_GUNS,			35,				"weapon_zs_blaster", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_blaster") end)
GM:AddPointShopItem("tossr",			ITEMCAT_GUNS,			35,				"weapon_zs_tosser", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_tosser") end)
GM:AddPointShopItem("stbbr",			ITEMCAT_GUNS,			35,				"weapon_zs_stubber", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_stubber") end)
GM:AddPointShopItem("crklr",			ITEMCAT_GUNS,			35,				"weapon_zs_crackler", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_crackler") end)
GM:AddPointShopItem("sling",			ITEMCAT_GUNS,			35,				"weapon_zs_slinger", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_slinger") end)
GM:AddPointShopItem("z9000",			ITEMCAT_GUNS,			35,				"weapon_zs_z9000", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_z9000") end)
GM:AddPointShopItem("minelayer",		ITEMCAT_GUNS,			35,				"weapon_zs_minelayer", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_minelayer") end)
GM:AddPointShopItem("chemar",		ITEMCAT_GUNS,			25,				"weapon_zs_chemar", nil, nil, nil, function(pl) pl:GiveEmptyWeapon("weapon_zs_chemar") end)
-- Tier 2
GM:AddPointShopItem("glock3",			ITEMCAT_GUNS,			65,				"weapon_zs_glock3")
GM:AddPointShopItem("magnum",			ITEMCAT_GUNS,			65,				"weapon_zs_magnum")
GM:AddPointShopItem("eraser",			ITEMCAT_GUNS,			65,				"weapon_zs_eraser")
GM:AddPointShopItem("sawedoff",			ITEMCAT_GUNS,			65,				"weapon_zs_sawedoff")
GM:AddPointShopItem("uzi",				ITEMCAT_GUNS,			65,				"weapon_zs_uzi")
GM:AddPointShopItem("annabelle",		ITEMCAT_GUNS,			65,				"weapon_zs_annabelle")
GM:AddPointShopItem("inquisitor",		ITEMCAT_GUNS,			65,				"weapon_zs_inquisitor")
GM:AddPointShopItem("amigo",			ITEMCAT_GUNS,			65,				"weapon_zs_amigo")
GM:AddPointShopItem("hurricane",		ITEMCAT_GUNS,			65,				"weapon_zs_hurricane")
GM:AddPointShopItem("nome",		        ITEMCAT_GUNS,			65,				"weapon_zs_nome")
GM:AddPointShopItem("popl",		        ITEMCAT_GUNS,			65,				"weapon_zs_popluttar")
GM:AddPointShopItem("relsogun",		        ITEMCAT_GUNS,			65,				"weapon_zs_relsous")
GM:AddPointShopItem("fracture",		        ITEMCAT_GUNS,			65,				"weapon_zs_fracture")
-- Tier 3
GM:AddPointShopItem("emperor",			ITEMCAT_GUNS,			150,				"weapon_zs_bogger")
GM:AddPointShopItem("deagle",			ITEMCAT_GUNS,			150,				"weapon_zs_deagle")
GM:AddPointShopItem("tempest",			ITEMCAT_GUNS,			150,				"weapon_zs_tempest")
GM:AddPointShopItem("ender",			ITEMCAT_GUNS,			150,				"weapon_zs_ender")
GM:AddPointShopItem("shredder",			ITEMCAT_GUNS,			150,				"weapon_zs_smg")
GM:AddPointShopItem("silencer",			ITEMCAT_GUNS,			150,				"weapon_zs_silencer")
GM:AddPointShopItem("hunter",			ITEMCAT_GUNS,			150,				"weapon_zs_hunter")
GM:AddPointShopItem("onyx",				ITEMCAT_GUNS,			150,				"weapon_zs_onyx")
GM:AddPointShopItem("charon",			ITEMCAT_GUNS,			150,				"weapon_zs_charon")
GM:AddPointShopItem("akbar",			ITEMCAT_GUNS,			150,				"weapon_zs_akbar")
GM:AddPointShopItem("oberon",			ITEMCAT_GUNS,			150,				"weapon_zs_oberon")
GM:AddPointShopItem("pollutor",			ITEMCAT_GUNS,			150,				"weapon_zs_pollutor")
GM:AddPointShopItem("smgstick",			ITEMCAT_GUNS,			150,				"weapon_zs_smgstick")
GM:AddPointShopItem("stalker",			ITEMCAT_GUNS,			150,			"weapon_zs_m4")
GM:AddPointShopItem("binocle",			ITEMCAT_GUNS,			150,			"weapon_zs_binocle")
-- Tier 4
GM:AddPointShopItem("longarm",			ITEMCAT_GUNS,			400,			"weapon_zs_longarm")
GM:AddPointShopItem("sweeper",			ITEMCAT_GUNS,			400,			"weapon_zs_sweepershotgun")
GM:AddPointShopItem("jackhammer",		ITEMCAT_GUNS,			400,			"weapon_zs_jackhammer")
GM:AddPointShopItem("bulletstorm",		ITEMCAT_GUNS,			400,			"weapon_zs_bulletstorm")
GM:AddPointShopItem("reaper",			ITEMCAT_GUNS,			400,			"weapon_zs_reaper")
GM:AddPointShopItem("quicksilver",		ITEMCAT_GUNS,			400,			"weapon_zs_quicksilver")
GM:AddPointShopItem("v1altbranch",		ITEMCAT_GUNS,			400,			"weapon_zs_marksman")
GM:AddPointShopItem("artemis",			ITEMCAT_GUNS,			400,			"weapon_zs_artemis")
GM:AddPointShopItem("inferno",			ITEMCAT_GUNS,			400,			"weapon_zs_inferno")
GM:AddPointShopItem("quasar",			ITEMCAT_GUNS,			400,			"weapon_zs_quasar")
GM:AddPointShopItem("barrage",			ITEMCAT_GUNS,			400,			"weapon_zs_barrage")
GM:AddPointShopItem("toxico",			ITEMCAT_GUNS,			400,			"weapon_zs_toxicshooter")
GM:AddPointShopItem("scar",				ITEMCAT_GUNS,			400,			"weapon_zs_scar")
GM:AddPointShopItem("juggernaut",		ITEMCAT_GUNS,		    400,			"weapon_zs_juggernaut")
GM:AddPointShopItem("zenith",		ITEMCAT_GUNS,			400,			"weapon_zs_zenith")
-- Tier 5
GM:AddPointShopItem("piercer",			ITEMCAT_GUNS,			1000,				"weapon_zs_piercer")
GM:AddPointShopItem("slugrifle",		ITEMCAT_GUNS,			1000,			"weapon_zs_slugrifle")
GM:AddPointShopItem("gluon",			ITEMCAT_GUNS,			1000,			"weapon_zs_gluon")
GM:AddPointShopItem("novacolt",			ITEMCAT_GUNS,			1000,			"weapon_zs_novacolt")
GM:AddPointShopItem("bulwark",			ITEMCAT_GUNS,		   1000,			"weapon_zs_bulwark")
GM:AddPointShopItem("colossus",			ITEMCAT_GUNS,			1000,			"weapon_zs_colossus")
GM:AddPointShopItem("renegade",			ITEMCAT_GUNS,			1000,			"weapon_zs_renegade")
GM:AddPointShopItem("crossbow",			ITEMCAT_GUNS,			1000,			"weapon_zs_crossbow")
GM:AddPointShopItem("pulserifle",		ITEMCAT_GUNS,			1000,			"weapon_zs_pulserifle")
GM:AddPointShopItem("spinfusor",		ITEMCAT_GUNS,			1000,			"weapon_zs_spinfusor")
GM:AddPointShopItem("broadside",		ITEMCAT_GUNS,			1000,			"weapon_zs_broadside")
GM:AddPointShopItem("smelter",			ITEMCAT_GUNS,			1000,			"weapon_zs_smelter")
GM:AddPointShopItem("hyena",			ITEMCAT_GUNS,			1000,				"weapon_zs_hyena")
GM:AddPointShopItem("boomstick",		ITEMCAT_GUNS,			1000,			"weapon_zs_boomstick")
GM:AddPointShopItem("bulldog",		ITEMCAT_GUNS,			1000,			"weapon_zs_bulldog")
-- Tier 6 beta
GM:AddPointShopItem("zeus",				ITEMCAT_GUNS,			3000,			"weapon_zs_zeus")
GM:AddPointShopItem("balance_t6",				ITEMCAT_GUNS,			3000,			"weapon_zs_balance")
GM:AddPointShopItem("classixg",			ITEMCAT_GUNS,			3000,			"weapon_zs_classic")
GM:AddPointShopItem("plasmk",			ITEMCAT_GUNS,			3000,			"weapon_zs_plasmatik")
GM:AddPointShopItem("deathdlrs",		ITEMCAT_GUNS,			3000,			"weapon_zs_deathdealers")
GM:AddPointShopItem("rlaucnher",		ITEMCAT_GUNS,			3000,			"weapon_zs_rocket_launcher")
GM:AddPointShopItem("biotic_grl",		ITEMCAT_GUNS,			3000,			"weapon_zs_biotic_grl")
GM:AddPointShopItem("smorning",		ITEMCAT_GUNS,			3000,			"weapon_zs_smorning")
GM:AddPointShopItem("drill",		ITEMCAT_GUNS,			3000,			"weapon_zs_drill")
-- Tier 7
GM:AddAPointShopItem("sacredhh",			ITEMCAT_GUNS,			2250,			"weapon_zs_m6")
GM:AddAPointShopItem("gaysseagle",   	ITEMCAT_GUNS,			2250,			"weapon_zs_gaeagle")
GM:AddAPointShopItem("doomstick",   	ITEMCAT_GUNS,			2250,			"weapon_zs_doomstick")
GM:AddAPointShopItem("zenith2",		ITEMCAT_GUNS,			2250,			"weapon_zs_zenithmega")
GM:AddAPointShopItem("flamethrower",		ITEMCAT_GUNS,			2250,			"weapon_zs_flamethrower")


GM:AddPointShopItem("pistolammo",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_pistol").." (x24)",				nil,									"ammo_pistol",						function(pl) pl:GiveAmmo(25, "pistol", true) end)
GM:AddPointShopItem("shotgunammo",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_buckshot").." (x14)",				nil,									"ammo_shotgun",						function(pl) pl:GiveAmmo(14, "buckshot", true) end)
GM:AddPointShopItem("smgammo",			ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_smg").." (x55)",					nil,									"ammo_smg",							function(pl) pl:GiveAmmo(55, "smg1", true) end)
GM:AddPointShopItem("rifleammo",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_rifle").." (x12)",					nil,									"ammo_rifle",						function(pl) pl:GiveAmmo(12, "357", true) end)
GM:AddPointShopItem("crossbowammo",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_bolts").." (x8)",				nil,									"ammo_bolts",						function(pl) pl:GiveAmmo(8,	"XBowBolt",	true) end)
GM:AddPointShopItem("assaultrifleammo",	ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_assaultrifle").." (x46)",		nil,									"ammo_assault",						function(pl) pl:GiveAmmo(46, "ar2", true) end)
GM:AddPointShopItem("pulseammo",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_pulseshots").." (x35)",				nil,									"ammo_pulse",						function(pl) pl:GiveAmmo(35, "pulse", true) end)
GM:AddPointShopItem("impactmine",		ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_explosives").." (x5)",					nil,									"ammo_explosive",					function(pl) pl:GiveAmmo(5, "impactmine", true) end)
GM:AddPointShopItem("chemical",			ITEMCAT_AMMO,			9,				nil,							translate.Get("ammo_chemicals").." (x35)",			nil,									"ammo_chemical",					function(pl) pl:GiveAmmo(35, "chemical", true) end)
item =
GM:AddPointShopItem("100mkit",			ITEMCAT_AMMO,			10,				nil,							translate.Get("ammo_medicalsupplies").." (x50)",			"50 extra power for the Medical Kit.",	"ammo_medpower",					function(pl) pl:GiveAmmo(50, "Battery", true) end)
item.CanMakeFromScrap = true
GM:AddPointShopItem("nailsz",			ITEMCAT_AMMO,			7,				nil,			translate.Get("ammo_nails").." (x8)",						nil, 		"ammo_nail", 			function(pl) pl:GiveAmmo(8, "GaussEnergy", true) end)

item.NoClassicMode = true
item =
GM:AddPointShopItem("scrap",				ITEMCAT_AMMO,			40,				nil,							translate.Get("ammo_scrap").." (x20)",							"Scrap but is have x15.",					"ammo_scrap",						function(pl) pl:GiveAmmo(20, "Scrap", true) end)
item.DontScrap = true
-- Tier 1
GM:AddPointShopItem("brassknuckles",	ITEMCAT_MELEE,			25,				"weapon_zs_brassknuckles").Model = "models/props_c17/utilityconnecter005.mdl"
GM:AddPointShopItem("knife",			ITEMCAT_MELEE,			25,				"weapon_zs_swissarmyknife")
GM:AddPointShopItem("zpplnk",			ITEMCAT_MELEE,			25,				"weapon_zs_plank")
GM:AddPointShopItem("axe",				ITEMCAT_MELEE,			25,				"weapon_zs_axe")
GM:AddPointShopItem("zpfryp",			ITEMCAT_MELEE,			25,				"weapon_zs_fryingpan")
GM:AddPointShopItem("zpcpot",			ITEMCAT_MELEE,			25,				"weapon_zs_pot")
GM:AddPointShopItem("ladel",			ITEMCAT_MELEE,			25,				"weapon_zs_ladel")
GM:AddPointShopItem("pipe",				ITEMCAT_MELEE,			25,				"weapon_zs_pipe")
GM:AddPointShopItem("stunbaton",		ITEMCAT_MELEE,			25,				"weapon_zs_stunbaton")
GM:AddPointShopItem("hook",				ITEMCAT_MELEE,			25,				"weapon_zs_hook")
GM:AddPointShopItem("syx",				ITEMCAT_MELEE,			25,				"weapon_zs_syx")
-- Tier 2
GM:AddPointShopItem("broom",			ITEMCAT_MELEE,			55,				"weapon_zs_pushbroom")
GM:AddPointShopItem("shovel",			ITEMCAT_MELEE,			55,				"weapon_zs_shovel")
GM:AddPointShopItem("sledgehammer",		ITEMCAT_MELEE,			55,				"weapon_zs_sledgehammer")
GM:AddPointShopItem("butcherknf",		ITEMCAT_MELEE,			55,				"weapon_zs_butcherknife")
GM:AddPointShopItem("keyboard",		    ITEMCAT_MELEE,			25,				"weapon_zs_keyboard")
GM:AddPointShopItem("dash",		    ITEMCAT_MELEE,			55,				"weapon_zs_f_dash")
GM:AddPointShopItem("muramasa",		ITEMCAT_MELEE,			55,				"weapon_zs_muramasa")
GM:AddPointShopItem("esword",		ITEMCAT_MELEE,			55,				"weapon_zs_energysword")
-- Tier 3
GM:AddPointShopItem("longsword",		ITEMCAT_MELEE,			190,				"weapon_zs_longsword")
GM:AddPointShopItem("executioner",		ITEMCAT_MELEE,			190,				"weapon_zs_executioner")
GM:AddPointShopItem("rebarmace",		ITEMCAT_MELEE,			190,				"weapon_zs_rebarmace")
GM:AddPointShopItem("meattenderizer",	ITEMCAT_MELEE,			190,				"weapon_zs_meattenderizer")
GM:AddPointShopItem("iceeluxx",	ITEMCAT_MELEE,			190,				"weapon_zs_icelux")
GM:AddPointShopItem("lamptube",	ITEMCAT_MELEE,			190,				"weapon_zs_lamptube")
GM:AddPointShopItem("rapier",	ITEMCAT_MELEE,			190,				"weapon_zs_rapir")
GM:AddPointShopItem("esword_d",		ITEMCAT_MELEE,			190,				"weapon_zs_energysword_dasher")
GM:AddPointShopItem("lolwers",			ITEMCAT_MELEE,			190,			"weapon_zs_lowers")
-- Tier 4
GM:AddPointShopItem("harpoon",			ITEMCAT_MELEE,			435,				"weapon_zs_harpoon")
GM:AddPointShopItem("graveshvl",		ITEMCAT_MELEE,			435,			"weapon_zs_graveshovel")
GM:AddPointShopItem("kongol",			ITEMCAT_MELEE,			435,			"weapon_zs_kongolaxe")
GM:AddPointShopItem("scythe",			ITEMCAT_MELEE,			435,			"weapon_zs_scythe")
GM:AddPointShopItem("powerfists",		ITEMCAT_MELEE,			435,			"weapon_zs_powerfists")
GM:AddPointShopItem("kshield",		ITEMCAT_MELEE,			435,			"weapon_zs_kobaldshield")
GM:AddPointShopItem("inail",		ITEMCAT_MELEE,			435,			"weapon_zs_ice_nail")
GM:AddPointShopItem("mogilka",			ITEMCAT_MELEE,			435,			"weapon_zs_graveshovelz").SkillRequirement = SKILL_RESNYA1
-- Tier 5
GM:AddPointShopItem("frotchet",			ITEMCAT_MELEE,			1500,			"weapon_zs_frotchet")
GM:AddPointShopItem("luxrockj",			ITEMCAT_MELEE,			435,			"weapon_zs_luxshade")
GM:AddPointShopItem("luxoid",			ITEMCAT_MELEE,			1500,			"weapon_zs_luxoid")
GM:AddPointShopItem("boomerang",		ITEMCAT_MELEE,			1500,			"weapon_zs_boomerang")
GM:AddPointShopItem("pipemega",		ITEMCAT_MELEE,			1500,			"weapon_zs_pipemega")
GM:AddPointShopItem("baragay",			ITEMCAT_MELEE,			1500,			"weapon_zs_baramelee")
-- Tier 6
GM:AddPointShopItem("megahook",			ITEMCAT_MELEE,			2500,			"weapon_zs_harpoon_mega")
GM:AddPointShopItem("teslar",			ITEMCAT_MELEE,			2500,			"weapon_zs_teslorer")
GM:AddPointShopItem("pw7",			ITEMCAT_MELEE,			2500,			"weapon_zs_powerfists_t7")

-- Tier 7
--GM:AddPointShopItem("speed",			ITEMCAT_MELEE,			180600,			"weapon_zs_speed")
GM:AddAPointShopItem("xouryc",			ITEMCAT_MELEE,			2250,			"weapon_zs_loy")
GM:AddAPointShopItem("murasama",			ITEMCAT_MELEE,			2250,			"weapon_zs_murasama")
-- Super Trinkets ------------------------------------------------------------------------------------------------------------------------------------------------
--
GM:AddPointShopItem("futureblu",			ITEMCAT_TRINKETS,		250,				"trinket_futureblu").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("sman",			ITEMCAT_TRINKETS,		450,				"trinket_sman").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("stutor",			ITEMCAT_TRINKETS,		400,				"trinket_stutor").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("gstore",			ITEMCAT_TRINKETS,		340,				"trinket_gstore").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("bloodlu",			ITEMCAT_TRINKETS,		300,				"trinket_bloodlust").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("bclip",			ITEMCAT_TRINKETS,		1000,				"trinket_ultra_mag").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("knowev",			ITEMCAT_TRINKETS,		500,				"trinket_knowbook").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("adbat",			ITEMCAT_TRINKETS,		300,				"trinket_adbat").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("marm",			ITEMCAT_TRINKETS,		350,				"trinket_marm").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("sshield",			ITEMCAT_TRINKETS,		350,				"trinket_sshield").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddPointShopItem("antibcat",			ITEMCAT_TRINKETS,		350,				"trinket_antibaracat").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER



GM:AddPointShopItem("crphmr",			ITEMCAT_TOOLS,			25,				"weapon_zs_hammer",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_hammer") pl:GiveAmmo(5, "GaussEnergy") end)
GM:AddPointShopItem("wrench",			ITEMCAT_TOOLS,			20,				"weapon_zs_wrench").NoClassicMode = true
GM:AddPointShopItem("resupplybox",		ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_resupplybox").Countables = "prop_resupplybox"
GM:AddPointShopItem("remantler",		ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_remantler").Countables = "prop_remantler"
GM:AddPointShopItem("msgbeacon",		ITEMCAT_DEPLOYABLES,			0,				"weapon_zs_messagebeacon").Countables = "prop_messagebeacon"
GM:AddPointShopItem("camera",			ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_camera").Countables = "prop_camera"
GM:AddPointShopItem("tv",				ITEMCAT_DEPLOYABLES,			25,				"weapon_zs_tv").Countables = "prop_tv"
item =
GM:AddPointShopItem("infturret",		ITEMCAT_DEPLOYABLES,			50,				"weapon_zs_gunturret",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret") pl:GiveAmmo(1, "thumper") end)
item.NoClassicMode = true
item.Countables = "prop_gunturret"
item =
GM:AddPointShopItem("blastturret",		ITEMCAT_DEPLOYABLES,			50,				"weapon_zs_gunturret_buckshot",	nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret_buckshot") pl:GiveAmmo(1, "turret_buckshot") end)
item.Countables = "prop_gunturret_buckshot"
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_BLASTTURRET
item =
GM:AddPointShopItem("assaultturret",	ITEMCAT_DEPLOYABLES,			125,			"weapon_zs_gunturret_assault",	nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret_assault") pl:GiveAmmo(1, "turret_assault") end)
item.NoClassicMode = true
item.Countables = "prop_gunturret_assault"
item =
GM:AddPointShopItem("rocketturret",		ITEMCAT_DEPLOYABLES,			125,			"weapon_zs_gunturret_rocket",	nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret_rocket") pl:GiveAmmo(1, "turret_rocket") end)
item.Countables = "prop_gunturret_rocket"
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_ROCKETTURRET
GM:AddPointShopItem("weapon_zs_gunturret_super",		ITEMCAT_DEPLOYABLES,			1000,			"weapon_zs_gunturret_super",	nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret_super") pl:GiveAmmo(1, "turret_super") end)
item.Countables = "prop_gunturret_super"
item.NoClassicMode = true
--GM:AddStartingItem("infturret",			ITEMCAT_DEPLOYABLES,			45,				"weapon_zs_gunturret",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_gunturret") pl:GiveAmmo(1, "thumper") pl:GiveAmmo(125, "smg1") end)
GM:AddPointShopItem("manhack",			ITEMCAT_DEPLOYABLES,			30,				"weapon_zs_manhack").Countables = "prop_manhack"
item =
GM:AddPointShopItem("drone",			ITEMCAT_DEPLOYABLES,			40,				"weapon_zs_drone")
item.Countables = "prop_drone"
item =
GM:AddPointShopItem("medstation",			ITEMCAT_DEPLOYABLES,			70,				"weapon_zs_medstation")
item.Countables = "prop_medstation"
item =
GM:AddPointShopItem("sigil_portable",			ITEMCAT_DEPLOYABLES,			1000,				"weapon_zs_sigil_port")
item.Countables = "prop_obj_sigil"
if GM.NewYear then
	item =
	GM:AddPointShopItem("xmas_tree",			ITEMCAT_DEPLOYABLES,			1000,				"weapon_zs_xmas_tree")
	item.Countables = "prop_xmas_tree"
end
item =
GM:AddPointShopItem("pulsedrone",		ITEMCAT_DEPLOYABLES,			40,				"weapon_zs_drone_pulse")
item.Countables = "prop_drone_pulse"
item.SkillRequirement = SKILL_U_DRONE
item =
GM:AddPointShopItem("hauldrone",		ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_drone_hauler")
item.Countables = "prop_drone_hauler"
item.SkillRequirement = SKILL_HAULMODULE
item =
GM:AddPointShopItem("healdrone",		ITEMCAT_DEPLOYABLES,			15,				"weapon_zs_drone_healer")
item.Countables = "prop_drone_healer"
item.SkillRequirement = SKILL_HEALMODULE
item =
GM:AddPointShopItem("rollermine",		ITEMCAT_DEPLOYABLES,			35,				"weapon_zs_rollermine")
item.Countables = "prop_rollermine"
item.SkillRequirement = SKILL_U_ROLLERMINE

item =
GM:AddPointShopItem("repairfield",		ITEMCAT_DEPLOYABLES,			55,				"weapon_zs_repairfield",		nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_repairfield") pl:GiveAmmo(1, "repairfield") pl:GiveAmmo(30, "pulse") end)
item.Countables = "prop_repairfield"
item.NoClassicMode = true
item =
GM:AddPointShopItem("zapper",			ITEMCAT_DEPLOYABLES,			50,				"weapon_zs_zapper",				nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_zapper") pl:GiveAmmo(1, "zapper") pl:GiveAmmo(30, "pulse") end)
item.Countables = "prop_zapper"
item.NoClassicMode = true
item =
GM:AddPointShopItem("zapper_arc",		ITEMCAT_DEPLOYABLES,			100,			"weapon_zs_zapper_arc",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_zapper_arc") pl:GiveAmmo(1, "zapper_arc") pl:GiveAmmo(30, "pulse") end)
item.Countables = "prop_zapper_arc"
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_ZAPPER_ARC
item =
GM:AddPointShopItem("ffemitter",		ITEMCAT_DEPLOYABLES,			40,				"weapon_zs_ffemitter",			nil,							nil,									nil,											function(pl) pl:GiveEmptyWeapon("weapon_zs_ffemitter") pl:GiveAmmo(1, "slam") pl:GiveAmmo(30, "pulse") end)
item.Countables = "prop_ffemitter"
GM:AddPointShopItem("propanetank",		ITEMCAT_TOOLS,			15,				"comp_propanecan")
GM:AddPointShopItem("busthead",			ITEMCAT_TOOLS,			25,				"comp_busthead")
GM:AddPointShopItem("sawblade",			ITEMCAT_TOOLS,			30,				"comp_sawblade").SkillRequirement = SKILL_U_CRAFTINGPACK
GM:AddPointShopItem("cpuparts",			ITEMCAT_TOOLS,			30,				"comp_cpuparts").SkillRequirement = SKILL_U_CRAFTINGPACK
GM:AddPointShopItem("electrobattery",	ITEMCAT_TOOLS,			40,				"comp_electrobattery").SkillRequirement = SKILL_U_CRAFTINGPACK
GM:AddPointShopItem("ticket",	        ITEMCAT_TOOLS,			20,				"comp_ticket").SkillRequirement = SKILL_U_CRAFTINGPACK
GM:AddPointShopItem("barricadekit",		ITEMCAT_DEPLOYABLES,	20,				"weapon_zs_barricadekit")
GM:AddPointShopItem("medkit",			ITEMCAT_TOOLS,			30,				"weapon_zs_medicalkit")
GM:AddPointShopItem("medgun",			ITEMCAT_TOOLS,			30,				"weapon_zs_medicgun")
item =
GM:AddPointShopItem("strengthshot",		ITEMCAT_TOOLS,			30,				"weapon_zs_strengthshot")
item.SkillRequirement = SKILL_U_STRENGTHSHOT
item =
GM:AddPointShopItem("antidote",			ITEMCAT_TOOLS,			30,				"weapon_zs_antidoteshot")
item.SkillRequirement = SKILL_U_ANTITODESHOT
GM:AddPointShopItem("medrifle",			ITEMCAT_TOOLS,			55,				"weapon_zs_medicrifle")
GM:AddPointShopItem("healray",			ITEMCAT_TOOLS,			190,			"weapon_zs_healingray")
GM:AddPointShopItem("repairray",			ITEMCAT_TOOLS,			220,			"weapon_zs_hammerray")
GM:AddPointShopItem("stone",			ITEMCAT_TOOLS,			5,			"weapon_zs_stone")
GM:AddPointShopItem("bannahuy",			ITEMCAT_TOOLS,			120000,			"weapon_zs_banhammer")

GM:AddAPointShopItem("soul_of_judas",			ITEMCAT_TRINKETS,			125,			"trinket_bleaksoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_spiritess",			ITEMCAT_TRINKETS,			125,			"trinket_spiritess").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddAPointShopItem("soul_of_samsonsoul",			ITEMCAT_TRINKETS,			225,			"trinket_samsonsoul").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddAPointShopItem("soul_of_evesoul",			ITEMCAT_TRINKETS,			220,			"trinket_evesoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_magdalenesoul",			ITEMCAT_TRINKETS,			250,			"trinket_magdalenesoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_jacobjesausoul",			ITEMCAT_TRINKETS,			600,			"trinket_jacobjesausoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddAPointShopItem("soul_of_isaacsoul",			ITEMCAT_TRINKETS,			800,			"trinket_isaacsoul").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddAPointShopItem("soul_of_lilithsoul",			ITEMCAT_TRINKETS,			800,			"trinket_lilithsoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddAPointShopItem("soul_of_whysoul",			ITEMCAT_TRINKETS,			2200,			"trinket_whysoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPER
GM:AddAPointShopItem("soul_of_blanksoul",			ITEMCAT_TRINKETS,			100,			"trinket_blanksoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddAPointShopItem("soul_of_classixsoul",			ITEMCAT_TRINKETS,			200,			"trinket_classixsoul").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddAPointShopItem("soul_of_darksoul",			ITEMCAT_TRINKETS,			500,			"trinket_darksoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddAPointShopItem("soul_of_eriosoul",			ITEMCAT_TRINKETS,			200,			"trinket_eriosoul").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddAPointShopItem("soul_of_aposoul",			ITEMCAT_TRINKETS,			900,			"trinket_aposoul").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddAPointShopItem("soul_of_betsoul",			ITEMCAT_TRINKETS,			900,			"trinket_betsoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_lostsoul",			ITEMCAT_TRINKETS,			500,			"trinket_lostsoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddAPointShopItem("soul_of_greedsoul",			ITEMCAT_TRINKETS,			700,			"trinket_greedsoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddAPointShopItem("soul_of_cainsoul",			ITEMCAT_TRINKETS,			900,			"trinket_cainsoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddAPointShopItem("soul_of_lazarussoul",			ITEMCAT_TRINKETS,			250,			"trinket_lazarussoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_clownsoul",			ITEMCAT_TRINKETS,			590,			"trinket_clownsoul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_forsoul",			ITEMCAT_TRINKETS,			700,			"trinket_forsoul").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddAPointShopItem("soul_of_starsoul",			ITEMCAT_TRINKETS,			1000,			"trinket_starsoul").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddAPointShopItem("soul_of_teasoul",			ITEMCAT_TRINKETS,			1200,			"trinket_teasoul").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddAPointShopItem("soul_of_sugersoul",			ITEMCAT_TRINKETS,			900,			"trinket_sugersoul").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddAPointShopItem("soul_of_nulledsoul",			ITEMCAT_TRINKETS,			900,			"trinket_nulledsoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddAPointShopItem("soul_of_soulmedical",			ITEMCAT_TRINKETS,			300,			"trinket_soulmedical").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddAPointShopItem("soul_of_lampsoul",			ITEMCAT_TRINKETS,			892,			"trinket_lampsoul").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddAPointShopItem("soul_of_barasoul",			ITEMCAT_TRINKETS,			9999,			"trinket_barasoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddAPointShopItem("soul_of_troyaksoul",			ITEMCAT_TRINKETS,			320,			"trinket_troyaksoul").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddAPointShopItem("soul_of_slight_soul",			ITEMCAT_TRINKETS,			600,			"trinket_slight_soul").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddAPointShopItem("soul_of_lehasoul",			ITEMCAT_TRINKETS,			180,			"trinket_lehasoul").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL

GM:AddAPointShopItem("world_card",			ITEMCAT_OTHER,			125,				nil,							translate.Get("s_world"),			translate.Get("s_world_d"),									"status_dim_vision",					function(pl) pl:GiveStatus("world",CurTime()+30) end)
GM:AddAPointShopItem("hint_doset",			ITEMCAT_OTHER,			25,				nil,							translate.Get("ahint"),			translate.Get("ahint"),									"weapon_zs_special_trinket",					function(pl) pl:CenterNotify(COLOR_GREEN, translate.ClientGet(pl,table.Random(GAMEMODE.HintsFromASigil))) end)


GM:AddAPointShopItem("speedx22",			ITEMCAT_MELEE,			8000,			"weapon_zs_speed")
GM:AddAPointShopItem("bannahuyx222",			ITEMCAT_TOOLS,			4500,			"weapon_zs_banhammer")
-- Tier 1
GM:AddPointShopItem("cutlery",			ITEMCAT_TRINKETS,		10,				"trinket_cutlery").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("boxingtraining",	ITEMCAT_TRINKETS,		10,				"trinket_boxingtraining").SubCategory =							ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("hemoadrenali",		ITEMCAT_TRINKETS,		10,				"trinket_hemoadrenali").SubCategory =							ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("oxtank",			ITEMCAT_TRINKETS,		10,				"trinket_oxygentank").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("acrobatframe",		ITEMCAT_TRINKETS,		10,				"trinket_acrobatframe").SubCategory =							ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("portablehole",		ITEMCAT_TRINKETS,		10,				"trinket_portablehole").SubCategory =							ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("magnet",			ITEMCAT_TRINKETS,		10,				"trinket_magnet").SubCategory =									ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("targetingvisi",	ITEMCAT_TRINKETS,		10,				"trinket_targetingvisori").SubCategory =						ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("pulseampi",		ITEMCAT_TRINKETS,		10,				"trinket_pulseampi").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
-- Tier 2
GM:AddPointShopItem("momentumsupsysii",	ITEMCAT_TRINKETS,		15,				"trinket_momentumsupsysii").SubCategory =						ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("sharpkit",			ITEMCAT_TRINKETS,		15,				"trinket_sharpkit").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("sharpkt",			ITEMCAT_TRINKETS,		50,				"trinket_sharpkt").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("nightvision",		ITEMCAT_TRINKETS,		15,				"trinket_nightvision").SubCategory =							ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("loadingframe",		ITEMCAT_TRINKETS,		15,				"trinket_loadingex").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("pathfinder",		ITEMCAT_TRINKETS,		15,				"trinket_pathfinder").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("ammovestii",		ITEMCAT_TRINKETS,		15,				"trinket_ammovestii").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("olympianframe",	ITEMCAT_TRINKETS,		15,				"trinket_olympianframe").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("curbstompers",		ITEMCAT_TRINKETS,		15,				"trinket_curbstompers").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("vitpackagei",		ITEMCAT_TRINKETS,		15,				"trinket_vitpackagei").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("cardpackagei",		ITEMCAT_TRINKETS,		15,				"trinket_cardpackagei").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("forcedamp",		ITEMCAT_TRINKETS,		15,				"trinket_forcedamp").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("supraband",		ITEMCAT_TRINKETS,		15,				"trinket_supraband").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("engineer",		ITEMCAT_TRINKETS,		15,				"trinket_engineer").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("kevlar",			ITEMCAT_TRINKETS,		15,				"trinket_kevlar").SubCategory =									ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("antitoxinpack",	ITEMCAT_TRINKETS,		15,				"trinket_antitoxinpack").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("hemostasis",		ITEMCAT_TRINKETS,		15,				"trinket_hemostasis").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("bloodpack",		ITEMCAT_TRINKETS,		15,				"trinket_bloodpack").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("reactiveflasher",	ITEMCAT_TRINKETS,		15,				"trinket_reactiveflasher").SubCategory =						ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("iceburst",			ITEMCAT_TRINKETS,		15,				"trinket_iceburst").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("biocleanser",		ITEMCAT_TRINKETS,		15,				"trinket_biocleanser").SubCategory =							ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("necrosense",		ITEMCAT_TRINKETS,		15,				"trinket_necrosense").SubCategory =								ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("blueprintsi",		ITEMCAT_TRINKETS,		15,				"trinket_blueprintsi").SubCategory =							ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("processor",		ITEMCAT_TRINKETS,		15,				"trinket_processor").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("acqmanifest",		ITEMCAT_TRINKETS,		15,				"trinket_acqmanifest").SubCategory =							ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("mainsuite",		ITEMCAT_TRINKETS,		15,				"trinket_mainsuite").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("hateome",		ITEMCAT_TRINKETS,		100,				"trinket_hateome").SubCategory =					    		ITEMSUBCAT_TRINKETS_SUPPORT
-- Tier 3
GM:AddPointShopItem("autoreload",		ITEMCAT_TRINKETS,		30,				"trinket_autoreload").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("fire_ind",  	ITEMCAT_TRINKETS,		30,				"trinket_fire_ind").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("reachem",			ITEMCAT_TRINKETS,		30,				"trinket_reachem").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("momentumsupsysiii",ITEMCAT_TRINKETS,		30,				"trinket_momentumsupsysiii").SubCategory =						ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("adrenaline",ITEMCAT_TRINKETS,		30,				"trinket_adrenaline").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("brokenhammer",ITEMCAT_TRINKETS,		30,				"trinket_brokenhammer").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("scout",ITEMCAT_TRINKETS,		30,				"trinket_scout").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("ass",ITEMCAT_TRINKETS,		15,				"trinket_ass").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("longgrip",		ITEMCAT_TRINKETS,		30,				"trinket_longgrip").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("powergauntlet",	ITEMCAT_TRINKETS,		30,				"trinket_powergauntlet").SubCategory =							ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("hemoadrenalii",	ITEMCAT_TRINKETS,		30,				"trinket_hemoadrenalii").SubCategory =							ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("sharpstone",		ITEMCAT_TRINKETS,		30,				"trinket_sharpstone").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("store",	      	ITEMCAT_TRINKETS,		30,				"trinket_store").SubCategory =					     			ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("analgestic",		ITEMCAT_TRINKETS,		30,				"trinket_analgestic").SubCategory =								ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("feathfallframe",	ITEMCAT_TRINKETS,		30,				"trinket_featherfallframe").SubCategory =						ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("aimcomp",			ITEMCAT_TRINKETS,		50,				"trinket_aimcomp").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("pulseampii",		ITEMCAT_TRINKETS,		30,				"trinket_pulseampii").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("extendedmag",		ITEMCAT_TRINKETS,		30,				"trinket_extendedmag").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("vitpackageii",		ITEMCAT_TRINKETS,		30,				"trinket_vitpackageii").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("cardpackageii",	ITEMCAT_TRINKETS,		30,				"trinket_cardpackageii").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("regenimplant",		ITEMCAT_TRINKETS,		30,				"trinket_regenimplant").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("barbedarmor",		ITEMCAT_TRINKETS,		30,				"trinket_barbedarmor").SubCategory =							ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("blueprintsii",		ITEMCAT_TRINKETS,		30,				"trinket_blueprintsii").SubCategory =							ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("curativeii",		ITEMCAT_TRINKETS,		30,				"trinket_curativeii").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("remedy",			ITEMCAT_TRINKETS,		30,				"trinket_remedy").SubCategory =									ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("mediiii",			ITEMCAT_TRINKETS,		30,				"trinket_mediiii").SubCategory =									ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("flashlo",	      	ITEMCAT_TRINKETS,		30,				"trinket_flashlo").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("pills",	      	ITEMCAT_TRINKETS,		30,				"trinket_pills").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("damage222",	      	ITEMCAT_TRINKETS,		30,				"trinket_damage222").SubCategory =								ITEMSUBCAT_TRINKETS_MELEE
-- Tier 4
GM:AddPointShopItem("cham_at",		ITEMCAT_TRINKETS,		50,				"trinket_cham_at").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("fire_at",		ITEMCAT_TRINKETS,		50,				"trinket_fire_at").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("pulse_at",		ITEMCAT_TRINKETS,		50,				"trinket_pulse_at").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("acid_at",		ITEMCAT_TRINKETS,		50,				"trinket_acid_at").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("hemoadrenaliii",	ITEMCAT_TRINKETS,		50,				"trinket_hemoadrenaliii").SubCategory =							ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("ammoband",			ITEMCAT_TRINKETS,		50,				"trinket_ammovestiii").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("resonance",		ITEMCAT_TRINKETS,		50,				"trinket_resonance").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("cryoindu",			ITEMCAT_TRINKETS,		50,				"trinket_cryoindu").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("refinedsub",		ITEMCAT_TRINKETS,		50,				"trinket_refinedsub").SubCategory =								ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("targetingvisiii",	ITEMCAT_TRINKETS,		30,				"trinket_targetingvisoriii").SubCategory =						ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("sammovest",	   ITEMCAT_TRINKETS,		50,				"trinket_sammovest").SubCategory =						ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("eodvest",			ITEMCAT_TRINKETS,		50,				"trinket_eodvest").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("composite",		ITEMCAT_TRINKETS,		50,				"trinket_composite").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("resupplypack",		ITEMCAT_TRINKETS,		50,				"trinket_resupplypack").SubCategory =							ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("promanifest",		ITEMCAT_TRINKETS,		50,				"trinket_promanifest").SubCategory =							ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("opsmatrix",		ITEMCAT_TRINKETS,		50,				"trinket_opsmatrix").SubCategory =								ITEMSUBCAT_TRINKETS_SUPPORT
GM:AddPointShopItem("store2",	        ITEMCAT_TRINKETS,		50,				"trinket_store2").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("kre",	            ITEMCAT_TRINKETS,		50,				"trinket_kre").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("greedeye",	            ITEMCAT_TRINKETS,		50,				"trinket_greedeye").SubCategory =						ITEMSUBCAT_TRINKETS_SPECIAL
GM:AddPointShopItem("antidevo",		ITEMCAT_TRINKETS,		50,				"trinket_antidevo").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
-- Tier 5
GM:AddPointShopItem("cham_storm",		ITEMCAT_TRINKETS,		70,				"trinket_cham_storm").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("gasmask",		ITEMCAT_TRINKETS,		70,				"trinket_gasmask").SubCategory =							ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("supasm",			ITEMCAT_TRINKETS,		70,				"trinket_supasm").SubCategory =									ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("pulseimpedance",	ITEMCAT_TRINKETS,		70,				"trinket_pulseimpedance").SubCategory =							ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("classix",	        ITEMCAT_TRINKETS,		70,				"trinket_classix").SubCategory =							  ITEMSUBCAT_TRINKETS_OFFENSIVE
GM:AddPointShopItem("killer",	        ITEMCAT_TRINKETS,		70,				"trinket_killer").SubCategory =						     	 ITEMSUBCAT_TRINKETS_MELEE
GM:AddPointShopItem("stopit",        	ITEMCAT_TRINKETS,		70,				"trinket_stopit").SubCategory =						ITEMSUBCAT_TRINKETS_PERFOMANCE
GM:AddPointShopItem("classil",	        ITEMCAT_TRINKETS,		70,				"trinket_classil").SubCategory =							  ITEMSUBCAT_TRINKETS_OFFENSIVE 
GM:AddPointShopItem("ttimes",	        ITEMCAT_TRINKETS,		70,				"trinket_ttimes").SubCategory =							  ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("toysite2",		ITEMCAT_TRINKETS,		150,				"trinket_toysite").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
GM:AddPointShopItem("bloodgrass",		ITEMCAT_TRINKETS,		150,				"trinket_bloodgrass").SubCategory =								ITEMSUBCAT_TRINKETS_DEFENSIVE
-- GM:AddPointShopItem("void",	        ITEMCAT_TRINKETS,		70,				"trinket_void").SubCategory =							  ITEMSUBCAT_TRINKETS_OFFENSIVE


  
GM:AddPointShopItem("flashbomb",		ITEMCAT_OTHER,			25,				"weapon_zs_flashbomb")
GM:AddPointShopItem("grenade",			ITEMCAT_OTHER,			35,				"weapon_zs_grenade")
GM:AddPointShopItem("holy_grenade",			ITEMCAT_OTHER,			65,				"weapon_zs_holy_grenade")
GM:AddPointShopItem("betty",			ITEMCAT_OTHER,			35,				"weapon_zs_proxymine")
GM:AddPointShopItem("detpck",			ITEMCAT_OTHER,			40,				"weapon_zs_detpack")
item =
GM:AddPointShopItem("crygasgrenade",	ITEMCAT_OTHER,			20,				"weapon_zs_crygasgrenade")
item.SkillRequirement = SKILL_U_CRYGASGREN
GM:AddPointShopItem("corgasgrenade",	ITEMCAT_OTHER,			45,				"weapon_zs_corgasgrenade")
GM:AddPointShopItem("sigfragment",		ITEMCAT_OTHER,			30,				"weapon_zs_sigilfragment")
GM:AddPointShopItem("antivirus",		ITEMCAT_OTHER,			5000,				"weapon_zs_redeemray")
GM:AddPointShopItem("bloodshot",		ITEMCAT_OTHER,			45,				"weapon_zs_bloodshotbomb")
item =
GM:AddPointShopItem("corruptedfragment",ITEMCAT_OTHER,			55,				"weapon_zs_corruptedfragment")
item.NoClassicMode = true
item.SkillRequirement = SKILL_U_CORRUPTEDFRAGMENT
item =
GM:AddPointShopItem("nanitecloud",		ITEMCAT_OTHER,			40,				"weapon_zs_nanitecloudbomb")
item =
GM:AddPointShopItem("nulledher",		ITEMCAT_SPECIAL,			80,				"trinket_nulledher")
item.SkillRequirement = SKILL_HEARTS
item =
GM:AddPointShopItem("voidheart",		ITEMCAT_SPECIAL,			80,				"trinket_voidheart")
item.SkillRequirement = SKILL_HEARTS
item =
GM:AddPointShopItem("kheart",		ITEMCAT_SPECIAL,			120,				"trinket_kheart")
item.SkillRequirement = SKILL_HEARTS
item =
GM:AddPointShopItem("cursedtrinket",		ITEMCAT_SPECIAL,			120,				"trinket_cursedtrinket")
item.SkillRequirement = SKILL_CURSEDTRINKETS
item =
GM:AddPointShopItem("medicalcloud",			ITEMCAT_OTHER,			35,				"weapon_zs_mediccloudbomb")
item.SkillRequirement = SKILL_U_MEDICCLOUD
--ZS Mutagens
GM:AddMutationItem("m_zombie_health", translate.Get("zshop_alphazomb"), translate.Get("zshop_alphazomb2"), ITEMCAT_MUTATIONS, 150, nil, function(pl) pl.m_HealthMulZS = pl.m_HealthMulZS + 0.2 end, "models/items/healthkit.mdl")
GM:AddMutationItem("m_zombie_health1", translate.Get("zshop_godzomb"), translate.Get("zshop_godzomb2"), ITEMCAT_MUTATIONS, 500, nil, function(pl) pl.m_HealthMulZS = pl.m_HealthMulZS + 0.3 end, "models/player/fatty/fatty.mdl")    
GM:AddMutationItem("m_zombie_zdef", translate.Get("zshop_zdef1"), translate.Get("zshop_def"), ITEMCAT_MUTATIONS, 300, nil, function(pl) pl.m_zombiedef = true end, "models/player/fatty/fatty.mdl")      
GM:AddMutationItem("m_zombie_moan", translate.Get("zshop_zombsprint"), translate.Get("zshop_zombsprint2"), ITEMCAT_MUTATIONS, 400, nil, function(pl) pl.m_Zombie_Moan = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zombie_moanguard", translate.Get("zshop_zombguard"), translate.Get("zshop_zombguard2"), ITEMCAT_MUTATIONS, 1200, nil, function(pl) pl.m_Zombie_MoanGuard = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zombie_bara", translate.Get("zshop_baracurse"), translate.Get("zshop_baracurse_d1"), ITEMCAT_MUTATIONS, 2500, nil, function(pl) pl.m_Zombie_Bara = true end, "models/player/catpants.mdl")
GM:AddMutationItem("m_zombie_hitter", translate.Get("zshop_hit"), translate.Get("zshop_hit_d1"), ITEMCAT_MUTATIONS, 1200, nil, function(pl) pl.m_Zombie_Bara1 = true end, "models/player/catpants.mdl")
GM:AddMutationItem("m_zombie_gigachad", translate.Get("zshop_gigachad"), translate.Get("zshop_gigachad_d1"), ITEMCAT_MUTATIONS, 700, nil, function(pl) pl.m_Gigachad = true pl.m_HealthMulZS = pl.m_HealthMulZS + 0.2 end, "models/player/catpants.mdl")
GM:AddMutationItem("m_zombie_16", translate.Get("zshop_16"), translate.Get("zshop_16_d1"), ITEMCAT_MUTATIONS, 500, nil, function(pl) pl.m_Zombie_16 = true end, "models/player/catpants.mdl")
GM:AddMutationItem("m_why", translate.Get("zshop_why"), translate.Get("zshop_why_d1"), ITEMCAT_MUTATIONS, 600, nil, function(pl) pl.m_Why = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_propcurse", translate.Get("zshop_curseofdeath"), translate.Get("zshop_curseofdeath_d1"), ITEMCAT_MUTATIONS, 800, nil, function(pl) pl.m_PropCurse = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_dxp", translate.Get("zshop_dxp"), translate.Get("zshop_dxp_d1"), ITEMCAT_MUTATIONS, 800, nil, function(pl) pl.m_DoubleXP = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_hreg", translate.Get("zshop_hreg"), translate.Get("zshop_hreg_d1"), ITEMCAT_MUTATIONS, 700, nil, function(pl) pl.m_HealthRegen = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_dclaws", translate.Get("zshop_dclaws"), translate.Get("zshop_dclaws_d1"), ITEMCAT_MUTATIONS, 950, nil, function(pl) pl.m_DeathClaws = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zarmor3", translate.Get("zshop_zarmor3"), translate.Get("zshop_zarmor3_d1"), ITEMCAT_MUTATIONS, 500, nil, function(pl) pl.m_ZArmor2 = true end, "models/player/zombie_classic.mdl")

-- Boss Mutagen
GM:AddMutationItem("m_zombie_health2", translate.Get("zshop_godestzomb"), translate.Get("zshop_godestzomb2"), ITEMCAT_MUTATIONS_BOSS, 1000, nil, function(pl) pl.m_HealthMulZS = pl.m_HealthMulZS + 0.5 end, "models/items/healthkit.mdl")
GM:AddMutationItem("m_zombie_healthcursed", translate.Get("zshop_cursed"), translate.Get("zshop_cursed1"), ITEMCAT_MUTATIONS_BOSS, 900, nil, function(pl) pl.m_HealthMulZS = pl.m_HealthMulZS + 0.4 end, "models/items/healthkit.mdl")      
GM:AddMutationItem("m_shade_damage", translate.Get("zshop_bossphysicshazard"), translate.Get("zshop_bossphysicshazard2"), ITEMCAT_MUTATIONS_BOSS, 550, nil, function(pl) pl.m_Shade_Force = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zmain", translate.Get("zshop_zmain"), translate.Get("zshop_zmain_d1"), ITEMCAT_MUTATIONS_BOSS, 850, nil, function(pl) pl.m_Zmain = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_ezspeed", translate.Get("zshop_ezspeed"), translate.Get("zshop_ezspeed_d1"), ITEMCAT_MUTATIONS_BOSS, 850, nil, function(pl) pl.m_EasySpeed = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_rclaw", translate.Get("zshop_rclaw"), translate.Get("zshop_rclaw_d1"), ITEMCAT_MUTATIONS_BOSS, 1125, nil, function(pl) pl.m_Rot_Claws = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_evo", translate.Get("zshop_evo"), translate.Get("zshop_evo_d1"), ITEMCAT_MUTATIONS_BOSS, 670, nil, function(pl) pl.m_Evo = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zarmor", translate.Get("zshop_zarmor"), translate.Get("zshop_zarmor_d1"), ITEMCAT_MUTATIONS_BOSS, 1210, nil, function(pl) pl.m_ZArmor = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("m_zarmor2", translate.Get("zshop_zarmor2"), translate.Get("zshop_zarmor2_d1"), ITEMCAT_MUTATIONS_BOSS, 900, nil, function(pl) pl.m_ZArmor2 = true end, "models/player/zombie_classic.mdl")
GM:AddMutationItem("redeem_pshop", translate.Get("zshop_red"), translate.Get("zshop_red_d1"), ITEMCAT_MUTATIONS_BOSS, 10000, nil, function(pl) pl:Redeem() pl:GiveAchievement("amnesty") end, "models/player/zombie_classic.mdl")
-- These are the honorable mentions that come at the end of the round.
-- classes


local function genericcallback(pl, magnitude) return pl:Name(), magnitude end
GM.HonorableMentions = {}
GM.HonorableMentions[HM_MOSTZOMBIESKILLED] = {Name = translate.Get("hm_mostkills"), String = translate.Get("hm_mostkills_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTDAMAGETOUNDEAD] = {Name = translate.Get("hm_mostdmg"), String = translate.Get("hm_mostdmg_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTHEADSHOTS] = {Name = translate.Get("hm_headshooter"), String = translate.Get("hm_headshooter_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_PACIFIST] = {Name = translate.Get("hm_pacifist"), String = translate.Get("hm_pacifist_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_MOSTHELPFUL] = {Name = translate.Get("hm_stealed"), String = translate.Get("hm_stealed_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_LASTHUMAN] = {Name = translate.Get("hm_lhuman"), String = translate.Get("hm_lhuman_desc"), Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_OUTLANDER] = {Name = "Adventurer", String = "goes to %s for getting killed %d feet away from a zombie spawn.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_GOODDOCTOR] = {Name = "Good Man 2", String = "goes to %s for healing their team for %d points of health.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_HANDYMAN] = {Name = "Best Cader", String = "goes to %s for getting %d barricade assistance points.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_SCARECROW] = {Name = "Super Autist", String = "goes to %s for killing %d poor crows.", Callback = genericcallback, Color = COLOR_WHITE}
GM.HonorableMentions[HM_MOSTBRAINSEATEN] = {Name = "Killer 1001", String = "by %s, with %d brains eaten.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_MOSTDAMAGETOHUMANS] = {Name = "I wanna to be a BOSS!", String = "goes to %s, with a total of %d damage given to living players.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_LASTBITE] = {Name = "Bite the nigger", String = "goes to %s for ending the round.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_USEFULTOOPPOSITE] = {Name = "Helpful", String = "goes to %s for giving up a whopping %d kills!", Callback = genericcallback, Color = COLOR_RED}
GM.HonorableMentions[HM_STUPID] = {Name = "Childhouse", String = "is what %s is for getting killed %d feet away from a zombie spawn.", Callback = genericcallback, Color = COLOR_RED}
GM.HonorableMentions[HM_SALESMAN] = {Name = "Buy this!Sale is 0%!", String = "is what %s is for having %d points worth of items taken from their arsenal crate.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_WAREHOUSE] = {Name = "Strange man?", String = "describes %s well since they had their resupply boxes used %d times.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_DEFENCEDMG] = {Name = "Defender", String = "goes to %s for protecting humans from %d damage with defence boosts.", Callback = genericcallback, Color = COLOR_WHITE}
GM.HonorableMentions[HM_STRENGTHDMG] = {Name = "Alchemic", String = "is what %s is for boosting players with an additional %d damage.", Callback = genericcallback, Color = COLOR_CYAN}
GM.HonorableMentions[HM_BARRICADEDESTROYER] = {Name = "Zmainer", String = "goes to %s for doing %d damage to barricades.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_NESTDESTROYER] = {Name = "FUCKING NIGGER", String = "goes to %s for destroying %d nests.", Callback = genericcallback, Color = COLOR_LIMEGREEN}
GM.HonorableMentions[HM_NESTMASTER] = {Name = "Good man", String = "goes to %s for having %d zombies spawn through their nest.", Callback = genericcallback, Color = COLOR_LIMEGREEN}

-- Don't let humans use these models because they look like undead models. Must be lower case.
GM.RestrictedModels = {
}

-- If a person has no player model then use one of these (auto-generated).
GM.RandomPlayerModels = {}
for name, mdl in pairs(player_manager.AllValidModels()) do
	if not table.HasValue(GM.RestrictedModels, string.lower(mdl)) then
		table.insert(GM.RandomPlayerModels, name)
	end
end

GM.DeployableInfo = {}
function GM:AddDeployableInfo(class, name, wepclass)
	local tab = {Class = class, Name = name or "?", WepClass = wepclass}

	self.DeployableInfo[#self.DeployableInfo + 1] = tab
	self.DeployableInfo[class] = tab

	return tab
end
GM:AddDeployableInfo("prop_arsenalcrate", 		"Arsenal Crate", 		"weapon_zs_arsenalcrate")
GM:AddDeployableInfo("prop_resupplybox", 		"Resupply Box", 		"weapon_zs_resupplybox")
GM:AddDeployableInfo("prop_remantler", 			"Weapon Remantler", 	"weapon_zs_remantler")
GM:AddDeployableInfo("prop_messagebeacon", 		"Message Beacon", 		"weapon_zs_messagebeacon")
GM:AddDeployableInfo("prop_camera", 			"Camera",	 			"weapon_zs_camera")
GM:AddDeployableInfo("prop_gunturret", 			"Gun Turret",	 		"weapon_zs_gunturret")
GM:AddDeployableInfo("prop_gunturret_assault", 	"Assault Turret",	 	"weapon_zs_gunturret_assault")
GM:AddDeployableInfo("prop_gunturret_buckshot",	"Blast Turret",	 		"weapon_zs_gunturret_buckshot")
GM:AddDeployableInfo("prop_gunturret_rocket",	"Rocket Turret",	 	"weapon_zs_gunturret_rocket")
GM:AddDeployableInfo("prop_gunturret_super",	"Super Turret",	 	"weapon_zs_gunturret_super")
GM:AddDeployableInfo("prop_repairfield",		"Repair Field Emitter",	"weapon_zs_repairfield")
GM:AddDeployableInfo("prop_medstation",		"Medical Station",	"weapon_zs_medstation")
GM:AddDeployableInfo("prop_zapper",				"Zapper",				"weapon_zs_zapper")
GM:AddDeployableInfo("prop_zapper_arc",			"Arc Zapper",			"weapon_zs_zapper_arc")
GM:AddDeployableInfo("prop_ffemitter",			"Force Field Emitter",	"weapon_zs_ffemitter")
GM:AddDeployableInfo("prop_manhack",			"Manhack",				"weapon_zs_manhack")
GM:AddDeployableInfo("prop_manhack_saw",		"Sawblade Manhack",		"weapon_zs_manhack_saw")
GM:AddDeployableInfo("prop_drone",				"Drone",				"weapon_zs_drone")
GM:AddDeployableInfo("prop_drone_pulse",		"Pulse Drone",			"weapon_zs_drone_pulse")
GM:AddDeployableInfo("prop_drone_hauler",		"Hauler Drone",			"weapon_zs_drone_hauler")
GM:AddDeployableInfo("prop_drone_healer",		"Healer Drone",			"weapon_zs_drone_healer")
GM:AddDeployableInfo("prop_rollermine",			"Rollermine",			"weapon_zs_rollermine")
GM:AddDeployableInfo("prop_tv",                   	 "TV",                    	"weapon_zs_tv")
GM:AddDeployableInfo("prop_obj_sigil",                   	 "Sigil",                    	"weapon_zs_sigil_port")
GM:AddDeployableInfo("prop_xmas_tree",                   	 "X-mas Tree",                    	"weapon_zs_xmas_tree")

GM.MaxSigils = 2

GM.DefaultRedeem = CreateConVar("zs_redeem", "3", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "The amount of kills a zombie needs to do in order to redeem. Set to 0 to disable."):GetInt()
cvars.AddChangeCallback("zs_redeem", function(cvar, oldvalue, newvalue)
	GAMEMODE.DefaultRedeem = math.max(0, tonumber(newvalue) or 0)
end)

GM.WaveOneZombies = 0.12--math.Round(CreateConVar("zs_waveonezombies", "0.1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "The percentage of players that will start as zombies when the game begins."):GetFloat(), 2)
-- cvars.AddChangeCallback("zs_waveonezombies", function(cvar, oldvalue, newvalue)
-- 	GAMEMODE.WaveOneZombies = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
-- end)

-- Game feeling too easy? Just change these values!
GM.ZombieSpeedMultiplier = math.Round(CreateConVar("zs_zombiespeedmultiplier", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "Zombie running speed will be scaled by this value."):GetFloat(), 2)
cvars.AddChangeCallback("zs_zombiespeedmultiplier", function(cvar, oldvalue, newvalue)
	GAMEMODE.ZombieSpeedMultiplier = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
end)

-- This is a resistance, not for claw damage. 0.5 will make zombies take half damage, 0.25 makes them take 1/4, etc.
GM.ZombieDamageMultiplier = math.Round(CreateConVar("zs_zombiedamagemultiplier", "1", FCVAR_REPLICATED + FCVAR_ARCHIVE + FCVAR_NOTIFY, "Scales the amount of damage that zombies take. Use higher values for easy zombies, lower for harder."):GetFloat(), 2)
cvars.AddChangeCallback("zs_zombiedamagemultiplier", function(cvar, oldvalue, newvalue)
	GAMEMODE.ZombieDamageMultiplier = math.ceil(100 * (tonumber(newvalue) or 1)) * 0.01
end)

GM.TimeLimit = CreateConVar("zs_timelimit", "25", FCVAR_ARCHIVE + FCVAR_NOTIFY, "Time in minutes before the game will change maps. It will not change maps if a round is currently in progress but after the current round ends. -1 means never switch maps. 0 means always switch maps."):GetInt() * 60
cvars.AddChangeCallback("zs_timelimit", function(cvar, oldvalue, newvalue)
	GAMEMODE.TimeLimit = tonumber(newvalue) or 2500
	if GAMEMODE.TimeLimit ~= -1 then
		GAMEMODE.TimeLimit = GAMEMODE.TimeLimit * 2500
	end
end)

GM.RoundLimit = CreateConVar("zs_roundlimit", "3", FCVAR_ARCHIVE + FCVAR_NOTIFY, "How many times the game can be played on the same map. -1 means infinite or only use time limit. 0 means once."):GetInt()
cvars.AddChangeCallback("zs_roundlimit", function(cvar, oldvalue, newvalue)
	GAMEMODE.RoundLimit = tonumber(newvalue) or 3
end)

-- Static values that don't need convars...

-- Initial length for wave 1.
GM.WaveOneLength = 60

-- Add this many seconds for each additional wave.
GM.TimeAddedPerWave = 30

-- New players are put on the zombie team if the current wave is this or higher. Do not put it lower than 1 or you'll break the game.
GM.NoNewHumansWave = 5

-- Humans can not commit suicide if the current wave is this or lower.
GM.NoSuicideWave = -1

-- How long 'wave 0' should last in seconds. This is the time you should give for new players to join and get ready.
GM.WaveZeroLength = 240

-- Time humans have between waves to do stuff without NEW zombies spawning. Any dead zombies will be in spectator (crow) view and any living ones will still be living.
GM.WaveIntermissionLength = 90

-- Time in seconds between end round and next map.
GM.EndGameTime = 25

-- How many clips of ammo guns from the Worth menu start with. Some guns such as shotguns and sniper rifles have multipliers on this.
GM.SurvivalClips = 4 --2

-- How long do humans have to wait before being able to get more ammo from a resupply box?
GM.ResupplyBoxCooldown = 75

-- Put your unoriginal, 5MB Rob Zombie and Metallica music here.
GM.LastHumanSound = Sound("zombiesurvival/lasthuman.ogg")

-- Sound played when humans all die.
GM.AllLoseSound = Sound("zombiesurvival/music_lose.ogg")

-- Sound played when humans survive.
GM.HumanWinSound = Sound("zombiesurvival/music_win.ogg")

-- Sound played to a person when they die as a human.
GM.DeathSound = Sound("zombiesurvival/human_death_stinger.ogg")

-- Fetch map profiles and node profiles from noxiousnet database?
GM.UseOnlineProfiles = false

-- This multiplier of points will save over to the next round. 1 is full saving. 0 is disabled.
-- Setting this to 0 will not delete saved points and saved points do not "decay" if this is less than 1.
GM.PointSaving = 0

-- Lock item purchases to waves. Tier 2 items can only be purchased on wave 2, tier 3 on wave 3, etc.
-- HIGHLY suggested that this is on if you enable point saving. Always false if objective map, zombie escape, classic mode, or wave number is changed by the map.
GM.LockItemTiers = false

-- Don't save more than this amount of points. 0 for infinite.
GM.PointSavingLimit = 25

-- For Classic Mode
GM.WaveIntermissionLengthClassic = 10
GM.WaveOneLengthClassic = 30
GM.TimeAddedPerWaveClassic = 15

-- Max amount of damage left to tick on these. Any more pending damage is ignored.
GM.MaxRotDamage = 25
GM.MaxBleedDamage = 10000
GM.MaxCurse = 100

-- Give humans this many points when the wave ends.
GM.EndWavePointsBonus = 9

-- Also give humans this many points when the wave ends, multiplied by (wave - 1)
GM.EndWavePointsBonusPerWave = 15
