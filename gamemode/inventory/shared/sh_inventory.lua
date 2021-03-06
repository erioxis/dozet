INVCAT_TRINKETS = 1
INVCAT_COMPONENTS = 2
INVCAT_CONSUMABLES = 3

GM.ZSInventoryItemData = {}
GM.ZSInventoryCategories = {
	[INVCAT_TRINKETS] = "Trinkets",
	[INVCAT_COMPONENTS] = "Components",
	[INVCAT_CONSUMABLES] = "Consumables"
}
GM.ZSInventoryPrefix = {
	[INVCAT_TRINKETS] = "trin",
	[INVCAT_COMPONENTS] = "comp",
	[INVCAT_CONSUMABLES] = "cons"
}

GM.Assemblies = {}
GM.Breakdowns = {}

function GM:GetInventoryItemType(item)
	for typ, aff in pairs(self.ZSInventoryPrefix) do
		if string.sub(item, 1, 4) == aff then
			return typ
		end
	end

	return -1
end

local index = 1
function GM:AddInventoryItemData(intname, name, description, weles, tier, stocks, icon)
	local datatab = {PrintName = name, DroppedEles = weles, Tier = tier, Description = description, Stocks = stocks, Index = index, Icon = icon}
	self.ZSInventoryItemData[intname] = datatab
	self.ZSInventoryItemData[index] = datatab

	index = index + 1
end



function GM:AddWeaponBreakdownRecipe(weapon, result)
	local datatab = {Result = result, Index = index}
	self.Breakdowns[weapon] = datatab
	for i = 1, 3 do
		self.Breakdowns[self:GetWeaponClassOfQuality(weapon, i)] = datatab
		self.Breakdowns[self:GetWeaponClassOfQuality(weapon, i, 1)] = datatab
	end

	self.Breakdowns[#self.Breakdowns + 1] = datatab
end

GM:AddWeaponBreakdownRecipe("weapon_zs_stubber",							"comp_modbarrel")
GM:AddWeaponBreakdownRecipe("weapon_zs_z9000",								"comp_basicecore")
GM:AddWeaponBreakdownRecipe("weapon_zs_blaster",							"comp_pumpaction")
GM:AddWeaponBreakdownRecipe("weapon_zs_novablaster",						"comp_contaecore")
GM:AddWeaponBreakdownRecipe("weapon_zs_waraxe", 							"comp_focusbarrel")
GM:AddWeaponBreakdownRecipe("weapon_zs_innervator",							"comp_gaussframe")
GM:AddWeaponBreakdownRecipe("weapon_zs_swissarmyknife",						"comp_shortblade")
GM:AddWeaponBreakdownRecipe("weapon_zs_owens",								"comp_multibarrel")
GM:AddWeaponBreakdownRecipe("weapon_zs_onyx",								"comp_precision")
GM:AddWeaponBreakdownRecipe("weapon_zs_minelayer",							"comp_launcher")
GM:AddWeaponBreakdownRecipe("weapon_zs_fracture",							"comp_linearactuator")
GM:AddWeaponBreakdownRecipe("weapon_zs_harpoon",							"comp_metalpole")
GM:AddWeaponBreakdownRecipe("weapon_zs_cryman",							"comp_mommy")
GM:AddWeaponBreakdownRecipe("weapon_zs_m5",							"comp_sacred_soul")
GM:AddWeaponBreakdownRecipe("trinket_jacobjesausoul",							"comp_sacred_soul")
GM:AddWeaponBreakdownRecipe("weapon_zs_crymam",							"trinket_toysoul")

-- Assemblies (Assembly, Component, Weapon)


GM.Assemblies["weapon_zs_waraxe"] 								= {"comp_modbarrel", 		"weapon_zs_glock3"}
GM.Assemblies["weapon_zs_bust"] 								= {"comp_busthead", 		"weapon_zs_plank"}
GM.Assemblies["weapon_zs_sawhack"] 								= {"comp_sawblade", 		"weapon_zs_axe"}
GM.Assemblies["weapon_zs_bloodhack"] 							= {"comp_sawblade", 		"weapon_zs_manhack"}
GM.Assemblies["weapon_zs_megamasher"] 							= {"comp_propanecan", 		"weapon_zs_sledgehammer"}
GM.Assemblies["weapon_zs_electrohammer"] 						= {"comp_electrobattery",	"weapon_zs_hammer"}
GM.Assemblies["weapon_zs_novablaster"] 							= {"comp_basicecore",		"weapon_zs_magnum"}
GM.Assemblies["weapon_zs_tithonus"] 							= {"comp_contaecore",		"weapon_zs_oberon"}
GM.Assemblies["weapon_zs_fracture"] 							= {"comp_pumpaction",		"weapon_zs_sawedoff"}
GM.Assemblies["weapon_zs_seditionist"] 							= {"comp_focusbarrel",		"weapon_zs_deagle"}
GM.Assemblies["weapon_zs_molotov"] 								= {"comp_propanecan",		"weapon_zs_glassbottle"}
GM.Assemblies["weapon_zs_blareduct"] 							= {"trinket_ammovestii",	"weapon_zs_megamasher"}
GM.Assemblies["weapon_zs_cinderrod"] 							= {"trinket_classixsoul",		"weapon_zs_blareduct"}
GM.Assemblies["weapon_zs_innervator"] 							= {"comp_electrobattery",	"weapon_zs_jackhammer"}
GM.Assemblies["weapon_zs_hephaestus"] 							= {"comp_gaussframe",		"weapon_zs_tithonus"}
GM.Assemblies["weapon_zs_stabber"] 								= {"comp_shortblade",		"weapon_zs_annabelle"}
GM.Assemblies["weapon_zs_galestorm"] 							= {"comp_multibarrel",		"weapon_zs_uzi"}
GM.Assemblies["weapon_zs_eminence"] 							= {"trinket_ammovestiii",	"weapon_zs_barrage"}
GM.Assemblies["weapon_zs_gladiator"] 							= {"trinket_ammovestiii",	"weapon_zs_sweepershotgun"}
GM.Assemblies["weapon_zs_ripper"]								= {"comp_sawblade",			"weapon_zs_zeus"}
GM.Assemblies["weapon_zs_crymam"]								= {"comp_mommy",	"weapon_zs_cry"}
GM.Assemblies["weapon_zs_cry"]								= {"comp_mommy",	"weapon_zs_cryman"}
GM.Assemblies["weapon_zs_asmd"]									= {"comp_precision",		"weapon_zs_quasar"}
GM.Assemblies["weapon_zs_enkindler"]							= {"comp_launcher",			"weapon_zs_cinderrod"}
GM.Assemblies["weapon_zs_proliferator"]							= {"comp_linearactuator",	"weapon_zs_galestorm"}
GM.Assemblies["weapon_zs_graveshovel"]						 	= {"comp_linearactuator",	"weapon_zs_shovel"}
GM.Assemblies["trinket_superstore"]						  	   = {"trinket_store",	     "trinket_store2"}
GM.Assemblies["trinket_electromagnet"]							= {"comp_electrobattery",	"trinket_magnet"}
GM.Assemblies["trinket_projguide"]								= {"comp_cpuparts",			"trinket_targetingvisori"}
GM.Assemblies["trinket_projwei"]								= {"comp_busthead",			"trinket_projguide"}
GM.Assemblies["trinket_controlplat"]							= {"comp_cpuparts",			"trinket_mainsuite"}
GM.Assemblies["weapon_zs_classixx"]				 		    	= {"trinket_classixsoul",			"weapon_zs_classic"}
GM.Assemblies["trinket_classixsoul"]							= {"comp_cpuparts",			"comp_scoper"}
GM.Assemblies["comp_scoper"]						        	= {"trinket_electromagnet",	"trinket_classix"}
GM.Assemblies["weapon_zs_cryman"] 				     			= {"comp_gaussframe",		"weapon_zs_hyena"}
GM.Assemblies["trinket_invalid"]						        	= {"trinket_classil",	"trinket_analgestic"}
GM.Assemblies["weapon_zs_m5"]						        	= {"comp_sacred_soul",	"weapon_zs_m4"}
GM.Assemblies["trinket_aposoul"]				        	= {"trinket_targetingvisori",	"trinket_blanksoul"}
GM.Assemblies["trinket_greedsoul"]						        	= {"trinket_superstore",	"trinket_blanksoul"}
GM.Assemblies["trinket_evesoul"]						        	= {"trinket_bloodpack",	"trinket_blanksoul"}
GM.Assemblies["weapon_zs_singurhammer"] 						= {"trinket_electromagnet",	"weapon_zs_electrohammer"}
GM.Assemblies["weapon_zs_megaray"] 						= {"trinket_soulmedical",	"weapon_zs_healingray"}
GM.Assemblies["weapon_zs_manhack_saw"] 						= {"trinket_aposoul",	"weapon_zs_manhack"}
GM.Assemblies["weapon_zs_katana"] 						= {"trinket_altbetsoul",	"weapon_zs_teslorer"}
GM.Assemblies["trinket_lotteryticket"] 						= {"comp_ticket",	"trinket_greedeye"}
GM.Assemblies["trinket_mysteryticket"] 						= {"comp_ticket",	"trinket_greedsoul"}
GM.Assemblies["trinket_soulrepairman"] 						= {"trinket_soulmedical",	"weapon_zs_hammer"}
GM.Assemblies["trinket_soulmedical"] 						= {"trinket_curse_dropping",	"trinket_altisaacsoul"}


GM:AddInventoryItemData("comp_modbarrel",		"Modular Barrel",			"A modular barrel suited for pairing up with another gun barrel.",								"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_burstmech",		"Burst Fire Mechanism",		"A mechanism that could be used to make a gun burst fire.",										"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_basicecore",		"Basic Energy Core",		"A small energy core. Needs a weapon with a cylinder mechanism to contain the energy output.",	"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_busthead",		"Bust Head",				"A bust head that could be fitted on to something handle shaped.",								"models/props_combine/breenbust.mdl")
GM:AddInventoryItemData("comp_sawblade",		"Saw Blade",				"A sharp saw blade ready to be fitted onto fast moving objects.",								"models/props_junk/sawblade001a.mdl")
GM:AddInventoryItemData("comp_propanecan",		"Propane Canister",			"A propane canister. With the correct setup, has the potential to ignite things.",				"models/props_junk/propane_tank001a.mdl")
GM:AddInventoryItemData("comp_electrobattery",	"Electrobattery",			"An electrobattery. Could be used to improve repairing motions.",								"models/items/car_battery01.mdl")
--GM:AddInventoryItemData("comp_hungrytether",	"Hungry Tether",			"A hungry tether from a devourer that comes from a devourer rib.",								"models/gibs/HGIBS_rib.mdl")]]
GM:AddInventoryItemData("comp_contaecore",		"Contained Energy Core",	"A contained energy core, that has an internal charging mechanism.",							"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_pumpaction",		"Pump Action Mechanism",	"A standard pump action mechanism from a blaster shotgun.",										"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_focusbarrel",		"Focused Barrel",			"A large focused barrel made from the barrels of the waraxe. Suitable for a handcannon.",		"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_gaussframe",		"Gauss Frame",				"A highly advanced gauss frame. It's almost alien in design, making it hard to use.",			"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_metalpole",		"Metal Pole",				"Long metal pole that could be used to attack things from a distance.",							"models/props_c17/signpole001.mdl")
GM:AddInventoryItemData("comp_salleather",		"Salvaged Leather",			"Pieces of leather that are hard enough to make a nasty impact.",								"models/props_junk/shoe001.mdl")
GM:AddInventoryItemData("comp_gyroscope",		"Gyroscope",				"A metal gyroscope used to calculate orientation.",												"models/maxofs2d/hover_rings.mdl")
GM:AddInventoryItemData("comp_reciever",		"Reciever",					"A radio reciever. Could be used for automation and communication purposes.",					"models/props_lab/reciever01b.mdl")
GM:AddInventoryItemData("comp_cpuparts",		"CPU Parts",				"Parts from a central processor.",																"models/props_lab/harddrive01.mdl")
GM:AddInventoryItemData("comp_launcher",		"Launching Tube",			"A metal tube made to launch objects.",															"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_launcherh",		"Heavy Launching Tube",		"A heavy metal tube made to launch large objects.",												"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_shortblade",		"Short Blade",				"A short metal blade for cutting and stabbing.",												"models/weapons/w_knife_t.mdl")
GM:AddInventoryItemData("comp_multibarrel",		"Multi-Bored Barrel",		"An unusual gun barrel which allows multiple bullets to pass through.",							"models/props_lab/pipesystem03a.mdl")
GM:AddInventoryItemData("comp_holoscope",		"Holographic Scope",		"A holographic weapon sight with magnification.",												{
	["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.273, 1.728, -0.843), angle = Angle(74.583, 180, 0), size = Vector(2.207, 0.105, 0.316), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c1??ombine/tprotato1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.492, -1.03, 0), angle = Angle(0, -78.715, 90), size = Vector(0.03, 0.02, 0.032), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} }
})
GM:AddInventoryItemData("comp_scoper",		"Scopy",		"Heh for classix.",												{
	["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.273, 1.728, -0.843), angle = Angle(74.583, 180, 0), size = Vector(2.207, 0.105, 0.316), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_combine/tprotato1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.492, -1.03, 0), angle = Angle(0, -78.715, 90), size = Vector(0.03, 0.02, 0.032), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} }
})
GM:AddInventoryItemData("comp_linearactuator",	"Linear Actuator",			"A linear actuator from a shell holder. Requires a heavy base to mount properly.",				"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_pulsespool",		"Pulse Spool",				"Used to inject more pulse power to a system. Could be used to stabilise something.",			"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_flak",			"Flak Chamber",				"An internal chamber for projecting heated scrap.",												"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_precision",		"Precision Chassis",		"A suite setup for rewarding precise shots on moving targets.",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_mommy",		"Mommy",		"Mom from Cryman.",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_sacred_soul",		"Sacred Soul",		"This sacred cartridge...",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_bloodhack",		"Bloody Hadck",		"djasnndwhadjajs||daw...",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_ticket",		"Ticket",		"Blank Ticket for anything",									"models/Items/combine_rifle_cartridge01.mdl")

-- Trinkets
local trinket, description, trinketwep
local hpveles = {
	["ammo"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 3.5, 3), angle = Angle(15.194, 80.649, 180), size = Vector(0.6, 0.6, 1.2), color = Color(145, 132, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local hpweles = {
	["ammo"] = { type = "Model", model = "models/healthvial.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 2.5, 3), angle = Angle(15.194, 80.649, 180), size = Vector(0.6, 0.6, 1.2), color = Color(145, 132, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local ammoveles = {
	["ammo"] = { type = "Model", model = "models/props/de_prodigy/ammo_can_02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 3, -0.519), angle = Angle(0, 85.324, 101.688), size = Vector(0.25, 0.25, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local ammoweles = {
	["ammo"] = { type = "Model", model = "models/props/de_prodigy/ammo_can_02.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 2, -1.558), angle = Angle(5.843, 82.986, 111.039), size = Vector(0.25, 0.25, 0.25), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local mveles = {
	["band++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "band", pos = Vector(2.599, 1, 1), angle = Angle(0, -25, 0), size = Vector(0.019, 0.15, 0.15), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["band"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 3, -1), angle = Angle(97.013, 29.221, 0), size = Vector(0.045, 0.045, 0.025), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["band+"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "band", pos = Vector(-2.401, -1, 0.5), angle = Angle(0, 155.455, 0), size = Vector(0.019, 0.15, 0.15), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} }
}
local mweles = {
	["band++"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "band", pos = Vector(2.599, 1, 1), angle = Angle(0, -25, 0), size = Vector(0.019, 0.15, 0.15), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["band+"] = { type = "Model", model = "models/props_junk/harpoon002a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "band", pos = Vector(-2.401, -1, 0.5), angle = Angle(0, 155.455, 0), size = Vector(0.019, 0.15, 0.15), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} },
	["band"] = { type = "Model", model = "models/props_phx/construct/metal_plate_curve360.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.5, 2, -0.5), angle = Angle(111.039, -92.338, 97.013), size = Vector(0.045, 0.045, 0.025), color = Color(55, 52, 51, 255), surpresslightning = false, material = "models/props_pipes/pipemetal001a", skin = 0, bodygroup = {} }
}
local pveles = {
	["perf"] = { type = "Model", model = "models/props_combine/combine_lock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.596, 1.557, -2.597), angle = Angle(5.843, 90, 0), size = Vector(0.25, 0.15, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local pweles = {
	["perf"] = { type = "Model", model = "models/props_combine/combine_lock01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 0.5, -2), angle = Angle(5, 90, 0), size = Vector(0.25, 0.15, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local oveles = {
	["perf"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2, -1.5), angle = Angle(5, 180, 0), size = Vector(0.05, 0.039, 0.07), color = Color(196, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local oweles = {
	["perf"] = { type = "Model", model = "models/props_combine/combine_generator01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2, -1.5), angle = Angle(5, 180, 0), size = Vector(0.05, 0.039, 0.07), color = Color(196, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local develes = {
	["perf"] = { type = "Model", model = "models/props_lab/blastdoor001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.799, 2.5, -5.715), angle = Angle(5, 180, 0), size = Vector(0.1, 0.039, 0.09), color = Color(168, 155, 0, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal", skin = 0, bodygroup = {} }
}
local deweles = {
	["perf"] = { type = "Model", model = "models/props_lab/blastdoor001b.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 2, -5.715), angle = Angle(0, 180, 0), size = Vector(0.1, 0.039, 0.09), color = Color(168, 155, 0, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal", skin = 0, bodygroup = {} }
}
local supveles = {
	["perf"] = { type = "Model", model = "models/props_lab/reciever01c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.299, 2.5, -2), angle = Angle(5, 180, 92.337), size = Vector(0.2, 0.699, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local supweles = {
	["perf"] = { type = "Model", model = "models/props_lab/reciever01c.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.5, -2), angle = Angle(5, 180, 92.337), size = Vector(0.2, 0.699, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local book = {
	["perf"] = { type = "Model", model = "models/props_lab/binderblue.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.5, -2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
local bookw = {
	["perf"] = { type = "Model", model = "models/props_lab/binderblue.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.5, -2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
-- some text
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_lticket"), "lotteryticket", false, hpveles, hpweles, 2, ""..translate.Get("t_d_lticket"), nil, nil, "weapon_zs_special_trinket")

trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_mticket"), "mysteryticket", false, hpveles, hpweles, 5, ""..translate.Get("t_d_mticket"), nil, nil, "weapon_zs_special_trinket")

trinketwep.PermitDismantle = true
-- Health Trinkets
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_healthpack"), "vitpackagei", false, hpveles, hpweles, 2, ""..translate.Get("t_d_healthpack"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.09)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_vbank"), "vitpackageii", false, hpveles, hpweles, 2, ""..translate.Get("t_d_vbank"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 20)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.03)

trinket = GM:AddTrinket(translate.Get("t_truepill"), "pills", false, hpveles, hpweles, 2, translate.Get("t_d_truepill"), nil, 15, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.11)
--trinket = GM:AddTrinket("Damage", "damage222", false, hpveles, hpweles, 4, "+10% damage melee ")
--GM:AddWeaponModifier(trinket, WEAPON_MODIFIER_DAMAGE, 3)


trinket = GM:AddTrinket(""..translate.Get("t_richeye"), "greedeye", false, hpveles, hpweles, 3, ""..translate.Get("t_d_richeye"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 20)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, 0.05)

trinket = GM:AddTrinket(""..translate.Get("t_bara"), "classil", false, hpveles, hpweles, 4, ""..translate.Get("t_d_bara"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 60)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.09)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, -5)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.35)

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_bloodpack"), "bloodpack", false, hpveles, hpweles, 2, ""..translate.Get("t_d_bloodpack"), nil, 15, "weapon_zs_defence_trinket_d")
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_bloodpacki"), "cardpackagei", false, hpveles, hpweles, 2, ""..translate.Get("t_d_bloodpacki"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.07)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_bloodpackii"), "cardpackageii", false, hpveles, hpweles, 3, ""..translate.Get("t_d_bloodpackii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.12)

GM:AddTrinket(""..translate.Get("t_regimp"), "regenimplant", false, hpveles, hpweles, 3, ""..translate.Get("t_d_regimp"), nil, nil, "weapon_zs_defence_trinket")
GM:AddTrinket(""..translate.Get("t_longgrip"), "longgrip", false, hpveles, hpweles, 3, ""..translate.Get("t_d_longgrip"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, 0.10)

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_bioclean"), "biocleanser", false, hpveles, hpweles, 2, ""..translate.Get("t_d_bioclean"), nil, nil, "weapon_zs_special_trinket")
trinketwep.PermitDismantle = true

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_cutset"), "cutlery", false, hpveles, hpweles, nil, ""..translate.Get("t_d_cutset"), nil, nil, "weapon_zs_defence_trinket"), SKILLMOD_FOODEATTIME_MUL, -0.8)
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_killer"), "killer", false, hpveles, hpweles, 2, ""..translate.Get("t_d_killer"), nil, nil, "weapon_zs_melee_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 110)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -50)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.37)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.50)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.21)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket("Status", "via", false, hpveles, hpweles, 2, "Vera Via,bloodoarmoro +50", nil, nil, "weapon_zs_melee_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 50)
trinket, trinketwep = GM:AddTrinket("Status", "via1", false, hpveles, hpweles, 2, "Vera Via,bloodoarmoro +30", nil, nil, "weapon_zs_melee_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 30)
trinket, trinketwep = GM:AddTrinket("Status", "via2", false, hpveles, hpweles, 2, "Vera Via,bloodoarmoro +40", nil, nil, "weapon_zs_melee_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 40)
trinket, trinketwep = GM:AddTrinket("Status", "via3", false, hpveles, hpweles, 2, "Vera Via,bloodoarmoro +10", nil, nil, "weapon_zs_melee_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 10)

--test

-- Hohol
trinket, trinketwep = GM:AddTrinket("????????", "salo", false, mveles, mweles, 2, "???????????????????? ???????????")

trinketwep.PermitDismantle = true
-- Melee Trinkets

description = ""..translate.Get("t_d_box")
trinket = GM:AddTrinket(""..translate.Get("t_box"), "boxingtraining", false, mveles, mweles, nil, description, nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_UNARMED_SWING_DELAY_MUL, -0.25)
GM:AddSkillFunction(trinket, function(pl, active) pl.BoxingTraining = active end)

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_momentsup"), "momentumsupsysii", false, mveles, mweles, 2, ""..translate.Get("t_d_momentsup"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_KNOCKBACK_MUL, 0.10)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_momentsupi"), "momentumsupsysiii", false, mveles, mweles, 3, ""..translate.Get("t_d_momentsupi"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.13)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_KNOCKBACK_MUL, 0.12)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_hemoad"), "hemoadrenali", false, mveles, mweles, nil, ""..translate.Get("t_d_hemoad"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.06)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.02)

trinket = GM:AddTrinket(""..translate.Get("t_hemoadi"), "hemoadrenalii", false, mveles, mweles, 3, ""..translate.Get("t_d_hemoadi"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.13)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, 44)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
trinket = GM:AddTrinket(""..translate.Get("t_damager"), "damage222", false, mveles, mweles, 3, ""..translate.Get("t_d_damager"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, 0.90)

trinket = GM:AddTrinket(""..translate.Get("t_termia"), "flashlo", false, mveles, mweles, 3, ""..translate.Get("t_d_termia"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, 55)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_hemoadii"), "hemoadrenaliii", false, mveles, mweles, 4, ""..translate.Get("t_d_hemoadii"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.22)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.04)
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_athermia"), "sharpkt", false, mveles, mweles, 4, ""..translate.Get("t_d_athermia"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.08)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, -280)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_gaunt"), "powergauntlet", false, mveles, mweles, 3, ""..translate.Get("t_d_gaunt"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_POWERATTACK_MUL, 0.45)

GM:AddTrinket(""..translate.Get("t_fkit"), "sharpkit", false, mveles, mweles, 2, ""..translate.Get("t_d_fkit"), nil, nil, "weapon_zs_melee_trinket")


GM:AddTrinket(""..translate.Get("t_skit"), "sharpstone", false, mveles, mweles, 3, ""..translate.Get("t_d_skit"), nil, nil, "weapon_zs_melee_trinket")
local cursesoul = { ["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(139,0,255,150), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(139,0,255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(139,0,255, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }}
--curses
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_curse_dropping"), "curse_dropping", false, nil, cursesoul, 3, ""..translate.Get("t_d_curse_dropping"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_hurt_curse"), "hurt_curse", false, nil,cursesoul, 3,""..translate.Get("t_d_hurt_curse"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_uncurse"), "uncurse", false, nil,cursesoul, 3, ""..translate.Get("t_d_uncurse"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_CURSEM, -0.70)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_curse_faster"), "curse_faster", false, nil,cursesoul, 3, ""..translate.Get("t_d_curse_faster"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_curse_slow"), "curse_slow", false, nil, cursesoul, 3, ""..translate.Get("t_d_curse_slow"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -80)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_curse_heart"), "curse_heart", false, nil, cursesoul, 3, ""..translate.Get("t_d_curse_heart"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -80)
trinketwep.PermitDismantle = true

--perfomance
GM:AddSkillModifier(GM:AddTrinket( ""..translate.Get("t_adrenaline"), "adrenaline", false, pveles, pweles, nil, ""..translate.Get("t_d_adrenaline"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_JUMPPOWER_MUL, 0.01)
GM:AddSkillModifier(GM:AddTrinket( ""..translate.Get("t_ass"), "ass", false, pveles, pweles, nil,  ""..translate.Get("t_d_ass"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_HEALTH, 6)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, 0.02)
trinket = GM:AddTrinket(""..translate.Get("t_sarmband"), "supraband", false, pveles, pweles, 1, ""..translate.Get("t_d_sarmband"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.04)
trinket = GM:AddTrinket("Engineer Gaming", "engineer", false, pveles, pweles, 1, ""..translate.Get("t_d_egaming"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, 0.12)
trinket = GM:AddTrinket("Scout Gaming", "scout", false, pveles, pweles, 2, ""..translate.Get("t_d_sgaming"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 10)
trinket = GM:AddTrinket(""..translate.Get("t_bhammer"), "brokenhammer", false, pveles, pweles, 3, ""..translate.Get("t_d_bhammer"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL,  0.10)

-- Special Trinkets
GM:AddTrinket(""..translate.Get("t_otank"), "oxygentank", true, nil, {
	["base"] = { type = "Model", model = "models/props_c17/canister01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 3, -1), angle = Angle(180, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, nil, ""..translate.Get("t_d_otank"), "oxygentank", nil, nil, "weapon_zs_special_trinket")

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_aframe"), "acrobatframe", false, pveles, pweles, nil, ""..translate.Get("t_d_aframe"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_JUMPPOWER_MUL, 0.08)

trinket = GM:AddTrinket(""..translate.Get("t_nightglass"), "nightvision", true, pveles, pweles, 2, ""..translate.Get("t_d_nightglass"), nil, nil, "weapon_zs_special_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_DIMVISION_EFF_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_FRIGHT_DURATION_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_VISION_ALTER_DURATION_MUL, -0.2)
GM:AddSkillFunction(trinket, function(pl, active)
	if CLIENT and pl == MySelf and GAMEMODE.m_NightVision and not active then
		surface.PlaySound("items/nvg_off.wav")
		GAMEMODE.m_NightVision = false
	end
end)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_whole"), "portablehole", false, pveles, pweles, nil, ""..translate.Get("t_d_whole"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYSPEED_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.03)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.01)

trinket = GM:AddTrinket(""..translate.Get("t_agility"), "pathfinder", false, pveles, pweles, 2, ""..translate.Get("t_d_agility"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.55)
GM:AddSkillModifier(trinket, SKILLMOD_SIGIL_TELEPORT_MUL, -0.45)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.1)

trinket = GM:AddTrinket(""..translate.Get("t_store"), "store", false, pveles, pweles, 2, ""..translate.Get("t_d_store"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.04)
trinket = GM:AddTrinket(""..translate.Get("t_ustore"), "superstore", false, pveles, pweles, 2, ""..translate.Get("t_d_ustore"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
trinket = GM:AddTrinket(""..translate.Get("t_credit"), "store2", false, pveles, pweles, 2, ""..translate.Get("t_d_credit"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.03)

trinket = GM:AddTrinket(""..translate.Get("t_galvanka"), "analgestic", false, pveles, pweles, 3, ""..translate.Get("t_d_galvanka"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_SLOW_EFF_TAKEN_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYSPEED_MUL, 0.25)
trinket = GM:AddTrinket(""..translate.Get("t_invalid"), "invalid", false, pveles, pweles, 3, ""..translate.Get("t_d_invalid"), nil, nil, "weapon_zs_craftables")
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.5)

trinket = GM:AddTrinket(""..translate.Get("t_credit2"), "kre", false, pveles, pweles, 3, ""..translate.Get("t_d_credit2"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.04)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_ammovesti"), "ammovestii", false, ammoveles, ammoweles, 2, ""..translate.Get("t_d_ammovesti"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.07)
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_ammovestii"), "ammovestiii", false, ammoveles, ammoweles, 4, ""..translate.Get("t_d_ammovestii"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.11)
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_ammovestiiii"), "sammovest", false, ammoveles, ammoweles, 4, ""..translate.Get("t_d_ammovestinf"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.16)
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_ammovestiii"), "classix", false, book, bookw, 4,""..translate.Get("t_d_ammovestinf"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.16)

GM:AddTrinket(""..translate.Get("t_autor"), "autoreload", false, ammoveles, ammoweles, 2, ""..translate.Get("t_d_autor"), nil, nil, "weapon_zs_shot_trinket")

-- Offensive Implants
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_targeti"), "targetingvisori", false, oveles, oweles, nil, ""..translate.Get("t_d_targeti"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_AIMSPREAD_MUL, -0.06)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_targetii"), "targetingvisoriii", false, oveles, oweles, 4, ""..translate.Get("t_d_targetii"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_AIMSPREAD_MUL, -0.11)

GM:AddTrinket(""..translate.Get("t_targetiii"), "refinedsub", false, oveles, oweles, 4, ""..translate.Get("t_d_targetiii"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(""..translate.Get("t_targetiiii"), "aimcomp", false, oveles, oweles, 3, ""..translate.Get("t_d_targetiiii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_AIM_SHAKE_MUL, -0.52)
GM:AddSkillFunction(trinket, function(pl, active) pl.TargetLocus = active end)

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_pulsebooster"), "pulseampi", false, oveles, oweles, nil, ""..translate.Get("t_d_pulsebooster"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.14)

trinket = GM:AddTrinket(""..translate.Get("t_pulseboosteri"), "pulseampii", false, oveles, oweles, 3, ""..translate.Get("t_d_pulseboosteri"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.22)

trinket = GM:AddTrinket(""..translate.Get("t_pboom"), "resonance", false, oveles, oweles, 4, ""..translate.Get("t_d_pboom"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, -0.11)

trinket = GM:AddTrinket(""..translate.Get("t_cryoinductor"), "cryoindu", false, oveles, oweles, 4, ""..translate.Get("t_d_cryoinductor"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(""..translate.Get("t_extendedmag"), "extendedmag", false, oveles, oweles, 3, ""..translate.Get("t_d_extendedmag"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(""..translate.Get("t_pulseboosterii"), "pulseimpedance", false, oveles, oweles, 5, ""..translate.Get("t_d_pulseboosterii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillFunction(trinket, function(pl, active) pl.PulseImpedance = active end)
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.24)

trinket = GM:AddTrinket(""..translate.Get("t_crabstompers"), "curbstompers", false, oveles, oweles, 2, ""..translate.Get("t_d_crabstompers"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, -0.25)

GM:AddTrinket(""..translate.Get("t_abbiuld"), "supasm", false, oveles, oweles, 5, ""..translate.Get("t_d_abbiuld"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(""..translate.Get("t_olymp"), "olympianframe", false, oveles, oweles, 2, ""..translate.Get("t_d_olymp"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 3)
GM:AddSkillModifier(trinket, SKILLMOD_PROP_CARRY_SLOW_MUL, -0.25)
GM:AddSkillModifier(trinket, SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, -0.35)


-- Defensive Trinkets
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_defender"), "kevlar", false, develes, deweles, 2, ""..translate.Get("t_d_defender"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.01)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_defenderi"), "barbedarmor", false, develes, deweles, 3, ""..translate.Get("t_d_defenderi"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, 11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 3)

trinket = GM:AddTrinket(""..translate.Get("t_antitoxin"), "antitoxinpack", false, develes, deweles, 2, ""..translate.Get("t_d_antitoxin"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.17)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_SPEED_MUL, -0.4)

trinket = GM:AddTrinket(""..translate.Get("t_hemostatis"), "hemostasis", false, develes, deweles, 2, ""..translate.Get("t_d_hemostatis"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_SPEED_MUL, -0.6)

trinket = GM:AddTrinket(""..translate.Get("t_defenderii"), "eodvest", false, develes, deweles, 4, ""..translate.Get("t_d_defenderii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.35)
GM:AddSkillModifier(trinket, SKILLMOD_FIRE_DAMAGE_TAKEN_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.13)

trinket = GM:AddTrinket(""..translate.Get("t_ffframe"), "featherfallframe", false, develes, deweles, 3, ""..translate.Get("t_d_ffframe"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_DAMAGE_MUL, -0.65)
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_THRESHOLD_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, -0.75)

trinket = GM:AddTrinket(""..translate.Get("t_supersale"), "stopit", false, develes, deweles, 3, ""..translate.Get("t_d_supersale"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.09)
trinket = GM:AddTrinket(""..translate.Get("t_fire_ind"), "fire_ind", false, develes, deweles, 3, ""..translate.Get("t_d_fire_ind"), nil, nil, "weapon_zs_special_trinket")


trinketwep.PermitDismantle = true

local eicev = {
	["base"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.339, 2.697, -2.309), angle = Angle(4.558, -34.502, -72.395), size = Vector(0.5, 0.5, 0.5), color = Color(0, 137, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

local eicew = {
	["base"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.556, 2.519, -1.468), angle = Angle(0, -5.844, -75.974), size = Vector(0.5, 0.5, 0.5), color = Color(0, 137, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

GM:AddTrinket(""..translate.Get("t_iceshield"), "iceburst", false, eicev, eicew, nil, ""..translate.Get("t_d_iceshield"), nil, nil, "weapon_zs_special_trinket")

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_fdfe"), "forcedamp", false, develes, deweles, 2,""..translate.Get("t_d_fdfe"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL, -0.33)

GM:AddSkillFunction(GM:AddTrinket(""..translate.Get("t_necro"), "necrosense", false, develes, deweles, 2, ""..translate.Get("t_d_necro"), nil, nil, "weapon_zs_special_trinket"), function(pl, active) pl:SetDTBool(DT_PLAYER_BOOL_NECRO, active) end)

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_reactf"), "reactiveflasher", false, develes, deweles, 2, ""..translate.Get("t_d_reactf"), nil, nil, "weapon_zs_special_trinket_d")
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(""..translate.Get("t_defenderiii"), "composite", false, develes, deweles, 4, ""..translate.Get("t_d_defenderiii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.16)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.07)
trinket = GM:AddTrinket(""..translate.Get("t_ttimes"), "ttimes", false, develes, deweles, 5, ""..translate.Get("t_d_ttimes"), nil, nil, "weapon_zs_defence_trinket")



trinket = GM:AddTrinket(""..translate.Get("t_defenderiiii"), "toysite", false, develes, deweles, 4, ""..translate.Get("t_d_defenderiiii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.21)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.05)

-- Support Trinkets
trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_arspack"), "arsenalpack", false, {
	["base"] = { type = "Model", model = "models/Items/item_item_crate.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, {
	["base"] = { type = "Model", model = "models/Items/item_item_crate.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, 4, ""..translate.Get("t_d_arspack"), "arsenalpack", 3)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_ammopack"), "resupplypack", true, nil, {
	["base"] = { type = "Model", model = "models/Items/ammocrate_ar2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, 4, ""..translate.Get("t_d_ammopack"), "resupplypack", 3)
trinketwep.PermitDismantle = true

GM:AddTrinket(""..translate.Get("t_magnet"), "magnet", true, supveles, supweles, nil, ""..translate.Get("t_d_magnet"), "magnet")
GM:AddTrinket(""..translate.Get("t_smagnet"), "electromagnet", true, supveles, supweles, nil, ""..translate.Get("t_d_smagnet"), "magnet_electro")

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_exoskelet"), "loadingex", false, supveles, supweles, 2, ""..translate.Get("t_d_exoskelet"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PROP_CARRY_SLOW_MUL, -0.55)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, -0.2)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 2)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_blueprints"), "blueprintsi", false, supveles, supweles, 2, ""..translate.Get("t_d_blueprints"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL, 0.10)
trinketwep.PermitDismantle = true

GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_ablueprints"), "blueprintsii", false, supveles, supweles, 4, ""..translate.Get("t_d_ablueprints"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_REPAIRRATE_MUL, 0.20)

trinket, trinketwep = GM:AddTrinket(""..translate.Get("t_medi"), "processor", false, supveles, supweles, 2, ""..translate.Get("t_d_medi"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.10)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.6)

trinket = GM:AddTrinket(""..translate.Get("t_medii"), "curativeii", false, supveles, supweles, 3, ""..translate.Get("t_d_medii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.15)

trinket = GM:AddTrinket(""..translate.Get("t_mediii"), "remedy", false, supveles, supweles, 3, ""..translate.Get("t_d_mediii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.3)
trinket = GM:AddTrinket(""..translate.Get("t_mediiii"), "mediiii", false, supveles, supweles, 3, ""..translate.Get("t_d_mediiii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.2)

trinket = GM:AddTrinket(""..translate.Get("t_deploi"), "mainsuite", false, supveles, supweles, 2, ""..translate.Get("t_d_deploi"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_DELAY_MUL, -0.07)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_RANGE_MUL, 0.1)

trinket = GM:AddTrinket(""..translate.Get("t_deploii"), "controlplat", false, supveles, supweles, 2, ""..translate.Get("t_d_deploii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_HEALTH_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_SPEED_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.50)

trinket = GM:AddTrinket(""..translate.Get("t_proji"), "projguide", false, supveles, supweles, 2, ""..translate.Get("t_d_proji"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PROJ_SPEED, 4)

trinket = GM:AddTrinket(""..translate.Get("t_projii"), "projwei", false, supveles, supweles, 2, ""..translate.Get("t_d_projii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PROJ_SPEED, -1)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.6)

local ectov = {
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.381, 2.617, 2.062), angle = Angle(180, 12.243, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = Color(0, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

local ectow = {
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.506, 1.82, 1.758), angle = Angle(-164.991, 19.691, 8.255), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = Color(0, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

trinket = GM:AddTrinket(""..translate.Get("t_chemicals"), "reachem", false, ectov, ectow, 3, ""..translate.Get("t_d_chemicals"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_MUL, 0.4)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.3)


trinket = GM:AddTrinket(""..translate.Get("t_deploiii"), "opsmatrix", false, supveles, supweles, 4, ""..translate.Get("t_d_deploiii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_DELAY_MUL, -0.13)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_RANGE_MUL, 0.85)
trinket = GM:AddTrinket(""..translate.Get("t_hateme"), "hateome", false, supveles, supweles, 4, ""..translate.Get("t_d_hateme"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.4)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 1.8)
-- Super Trinkets
trinket = GM:AddTrinket(""..translate.Get("t_smanifest"), "sman", false, supveles, supweles, 5, ""..translate.Get("t_d_smanifest"))
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.19)
trinket = GM:AddTrinket(""..translate.Get("t_protutor"), "stutor", false, book, bookw, 5, ""..translate.Get("t_d_protutor"))
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.30)
trinket = GM:AddTrinket(""..translate.Get("t_gstore"), "gstore", false, supveles, supweles, 5, ""..translate.Get("t_d_gstore"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.20)
trinket = GM:AddTrinket(""..translate.Get("t_fblueprints"), "futureblu", false, supveles, supweles, 5, ""..translate.Get("t_d_fblueprints"))
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL, 0.30)
trinket = GM:AddTrinket(""..translate.Get("t_kbook"), "knowbook", false, book, bookw, 5, ""..translate.Get("t_d_kbook"))
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.05)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.05)
trinket = GM:AddTrinket(""..translate.Get("t_bloodlust"), "bloodlust", false, book, bookw, 5, ""..translate.Get("t_d_bloodlust"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_POWERATTACK_MUL, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -10)
trinket = GM:AddTrinket(""..translate.Get("t_adbat"), "adbat", false, supveles, supweles, 5, ""..translate.Get("t_d_adbat"))
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_PULSE_MUL, 0.33)
trinket = GM:AddTrinket(""..translate.Get("t_mecharm"), "marm", false, supveles, supweles, 5, ""..translate.Get("t_d_mecharm"))
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.22)
trinket = GM:AddTrinket(""..translate.Get("t_sshield"), "sshield", false, supveles, supweles, 5, ""..translate.Get("t_d_sshield"))
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, -0.06)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
trinket = GM:AddTrinket(""..translate.Get("t_antibaracat"), "antibaracat", false, supveles, supweles, 5, ""..translate.Get("t_d_antibaracat"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.5)

--Special Trinkets
trinket = GM:AddTrinket(""..translate.Get("t_nheart"), "nulledher", false, supveles, supweles, 4, ""..translate.Get("t_d_nheart"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 20)
trinket = GM:AddTrinket(""..translate.Get("t_voidheart"), "voidheart", false, supveles, supweles, 4, ""..translate.Get("t_d_voidheart"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20)
trinket = GM:AddTrinket(""..translate.Get("t_kheart"), "kheart", false, supveles, supweles, 4, ""..translate.Get("t_d_kheart"))
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.25)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.15)
d = math.random(1,5)
skill1 =  math.Rand(-0.5,0.5)
skill2 =  math.random(-30,70)
skill3 = math.Rand(-0.5,0.5)
if d == 1 then
skill1d = "b_damage"
skill2d = "health"
skill3d = "meleedamagetaken"
	elseif d == 2 then
		skill1d = "p_mul"
		skill2d = "speed"
		skill3d = "sale"
	elseif d == 3 then
		skill1d = "res_ammo"
		skill2d = "barmor"
		skill3d = "man_damage"
	elseif d == 4 then
		skill1d = "self_d"
		skill2d = "health"
		skill3d = "meleedamage"
	else
		skill1 = ""
skill2 =  ""
skill3 = ""
skill1d = "qual_0"
skill2d = "qual_0"
skill3d = "qual_0"
end
trinket = GM:AddTrinket(translate.Get("t_cursedtrinket"), "cursedtrinket", false, supveles, supweles, 4, skill1..translate.Get(skill1d)..skill2..translate.Get(skill2d)..skill3..translate.Get(skill3d)..translate.Get("t_d_cursedtrinket"))
if d == 1 then
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, skill1)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, skill2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, skill3)
elseif d == 2 then
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, skill1)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, skill2)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, skill3)
elseif d == 3 then
GM:AddSkillModifier(trinket, SKILLMOD_RES_AMMO_MUL, skill1)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, skill2)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, skill3)
elseif d == 4 then
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, skill1)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, skill2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, skill3)
else
	
end


--Attachment
trinket = GM:AddTrinket(""..translate.Get("t_fire_at"), "fire_at", false, supveles, supweles, 1, ""..translate.Get("t_d_fire_at"))
trinket = GM:AddTrinket(""..translate.Get("t_pulse_at"), "pulse_at", false, supveles, supweles, 1, ""..translate.Get("t_d_pulse_at"))
trinket = GM:AddTrinket(""..translate.Get("t_acid_at"), "acid_at", false, supveles, supweles, 1, ""..translate.Get("t_d_acid_at"))
trinket = GM:AddTrinket(""..translate.Get("t_ultra_at"), "ultra_at", false, supveles, supweles, 1, ""..translate.Get("t_d_ultra_at"))






-- ???
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_manifesti"), "acqmanifest", false, supveles, supweles, 2, ""..translate.Get("t_d_manifesti"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_RESUPPLY_DELAY_MUL, -0.06)
GM:AddSkillModifier(GM:AddTrinket(""..translate.Get("t_manifestii"), "promanifest", false, supveles, supweles, 4, ""..translate.Get("t_d_manifestii"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_RESUPPLY_DELAY_MUL, -0.15)

-- Boss Trinkets

local blcorev = {
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_Spine4", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = true},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Grenade_body", rel = "", pos = Vector(0, 0.5, -1.701), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(20, 20, 20, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} },
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_Spine4", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = true}
}

local blcorew = {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(20, 20, 20, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}
local blcorea = {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 2.3097 }, color = Color(0, 35, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.949, 0.349, 0.349), color = Color(20, 20, 20, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}

GM:AddTrinket("Soul of Judas", "bleaksoul", false, blcorev, blcorew, nil, "Blinds and knocks zombies away when attacked\nRecharges every 15 seconds\n?????????????????? ?? ???????????????????? ?????????? ??????????(?????????????? ?????????????????? ??????)\n ?????????????????????? ???????????? 15 ??????\n Q:2", nil, nil, "weapon_zs_soul")

trinket = GM:AddTrinket("Soul of ???", "spiritess", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+22% jump height\n+22% ?? ???????? ????????????.", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.22)

trinket = GM:AddTrinket("Soul of Erwa", "soulmedical", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 2.3097 }, color = Color(0, 35, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.949, 0.349, 0.349), color = Color(20, 20, 20, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+15% ?? ???????? ??????????????,-15% ???????????? ??????????????\n+15% Med Effectiveness,-15% Cooldown medkit.\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.15)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.15)
trinket = GM:AddTrinket("True soul of Erwa", "soulrepairman", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 2.3097 }, color = Color(24, 253, 24, 248), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 24, 224), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.949, 0.349, 0.349), color = Color(22, 0, 100), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+50%"..translate.Get("repair"), nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL,  0.50)

trinket = GM:AddTrinket("Samson Soul", "samsonsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 5, 11, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???? ???????????????? ???? 10% ???????????? ?????????? ???????? ?????????????? ?? ?????????????????? ?? 30% ?????? ???????????? ?????????? ???? ?????? ?? ??????????????????.\nYou deal to 10% more melee damage and take by 30% more poison and blood damage\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)

trinket = GM:AddTrinket("Soul of Eve", "evesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???? ???????????????? ???? 22% ???????????? ?????????? ???????? ?????????????? ???? ???? ?? ???????????????????????? ?????????????? ???? 88% ???????????? ??????????.\n-22% melee damage but you take by -88% damage from effects\n Q:2", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.88)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.88)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.22)

trinket = GM:AddTrinket("Soul of Jacob&Jesau", "jacobjesausoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???? ???? ?????????????? ???????????????? ???????????? ?????????? ?????????? ???? ???????????? ???? ?????????????????? ???? 20% ???????????? ??????????????.\nYou now don't take point's per wave,+20% point multiplier \n Q:5", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS , -9999)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.20)

trinket = GM:AddTrinket("Soul of Isaac", "isaacsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(34, 120, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(115, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???????? ?????????? ???? ??????????????,???????? 10 ????,?????????????????????? ?????????????? ???? 8%,???? ?????????????????? ???? 4% ???????????? ??????????????\n+10 hp,Reload speed by 8%,+10% point multiplier \n Q:2", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.1)

trinket = GM:AddTrinket("Soul of Magdalene", "magdalenesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 60, 90, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"????????  30 ???????????????? ?? 40 ???????????????? ??????????,???? ???? ???? 40 ?????????????? ????????????????\n +30 hp,+40 blood armor,-40 speed \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 30)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -40)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 40)

trinket = GM:AddTrinket("Soul of Lilith", "lilithsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???????? ?????????????? ???????? ?? ???????????????? ?? ???????????? ?? ??????????????????,?????????????????? ???????? ?????????????? ???? 10%\n???? 30% ???????????? ???? ?? ???????? ????????????????????,?????????????? ?????????? ?? 50% ???????????? ???? ?? ???????????????? ???????????????????????? ???? 40% ????????????\n Give huge buff for turrets and drones\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_HEALTH_MUL, 0.3)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_HEALTH_MUL, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_SCANSPEED_MUL, 0.4)
trinket = GM:AddTrinket("Soul of Eden", "whysoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 20, y = 20 }, color = Color(0, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(11, 20, 110, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil," ???????? ?????????? ???????? ???????????????????? ??????(???????? ???????????????????? ???? ????????????????????) ???? ?? ?????????????? ?????????????? ?? ???????? ?????? ???? ??????????????,???? ???????????????? ???????? ??????????,???????????? ?? ??????????????????\ngives a buff of normal souls but worse, debuffs too!(does not include Doset-souls and soul Of lazarus,forgotten and lost) \nQ:Ultimate ", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_DRONE_CARRYMASS_MUL, 0.03)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.05)
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.07)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_HEALTH_MUL, 0.02)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_HEALTH_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_SCANSPEED_MUL, 0.09)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 17)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 30)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS , -25)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.03)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, -0.02)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.13)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.06) 
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.07) 
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
trinket = GM:AddTrinket("Blank Soul", "blanksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 211, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 210, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???????????? ???????? ?????????????????? 5% ?????????? ???? ??????\nblank soul absorb 5% damage to you \n Q:0 ", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)

trinket = GM:AddTrinket(" Soul of Classix", "classixsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(5, 25, 211, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(5, 0, 25, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(155, 110, 15, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???????????????? ???????????? ?????? ?????????? ????????????????! ?????????????????????? ???????????????? ???? ?????????????? 56% ?? ?????????? ???????????????? ???? 20%\n+56% reload speed for snipers and +20% accuracy\n Q:0"), nil, nil, "weapon_zs_soul"
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_RIFLE_MUL, 0.56)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.20)

trinket = GM:AddTrinket("Soul of Darkness", "darksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(21, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+20% ?? ?????????????? ????????????,+20% ?? ?????????? ???? ????????????,-20% ?????????? ???? ????????\n -20% Self-damage,+20% Explosive radius,+20% Explosive Damage\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.2)
trinket = GM:AddTrinket("Soul of Azazel", "eriosoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 165, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???? 10% ???????????? ???????? ???? ????????!-20 ???? ?? -10 ???????????????? ??????????.\n Melee damage multiplier 1.10x! -20 hp -10 blood armor\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -10) 
trinket = GM:AddTrinket("Soul of Appolyon", "aposoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(30, 111, 51, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 105, 20, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "?????????????? ?????????? ?????? ??????????! ???? 30% ???????????? ???? ?? ???? 20% ???????????? ????????.\n Manhack is better,+30% Hp and +20% damage for manhacks\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.3) 
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.2) 
trinket = GM:AddTrinket("Soul of Bethany", "betsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(120, 200, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????? ?????????????? ???????????????? ??????????(????????????????)...???????????? ?????????????? ???? ?? ?????????????? ?????? ???? ??????!?????? ???? ?????? ?? 200% ?????????? ?? ???????? 220 ????,?????????????? 10 ?????????????????? ???? ???????????? ????????????????????  ????????,-15% ?????????????????????? ???????? ??????????\n+220 hp,No more blood armor(PERMA EFFECT)\n+200% Heal received,-10 curse when you get hit,-15% Melee damage taken\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 220) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -1000) 
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.15) 
trinket = GM:AddTrinket("Soul of Lost", "lostsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 20, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 95), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "?????????????? ???????????????????? ?????????? ??????????,???? ???? ?????????????????? ?? 90% ???????? ???????????? ??????????!???? ?????????????? ???? 100 ????????????\nYou move faster through prop,+210 speed\n122% Damage taken mul \nQ:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.90) 
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 100)
trinket = GM:AddTrinket("Soul of Greed", "greedsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(21, 255, 1, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(120, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? ???????????????? ???????? 5% ???????????? ?? +15% ?? ??????????????\n Sale by 5%,+15% Point Multiplier\n Q:5", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.15)
trinket = GM:AddTrinket("Soul of Cain", "cainsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 155, 9, 55), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(125, 0, 255, 100), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 155), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????????? ???????????????? ???? 19%,???????????? ?? 5%\n-19% Ressuply Delay,Sale by 5%\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.19)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
trinket = GM:AddTrinket("Soul of Lazarus", "lazarussoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 0, 195), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(125, 0, 255, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????? ???????????????? ?????? ???????? ?????????? ??????????\nsave you if you have 20% health,gave 100% blood(Heal only with hemostasis)", nil, nil, "weapon_zs_soul")
trinket = GM:AddTrinket("Soul of Forgotten", "forsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???? ?????????? ??????????  ???????? ??????????????!,???? ???? ???? ?????????????? ?????????????????? ?????????????????? ???????????? ??????????????\nBetter melee but you can't use other weapon exlude melee weapon \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 12)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, 40)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, -0.44)

trinket = GM:AddTrinket("Soul of Sussy Stragus", "starsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? 55 ???????????????? ?????????????? 10% ????????????\n +55 speed,-10% Melee damage\n Q:lmao", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

trinket = GM:AddTrinket("Soul of Toy", "toysoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(82, 19, 124, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? ?????????????????????????????.?????????????? ???????????????????? ?? ??????????????????,???????? 100 ????????????????,?????????????????? ?????????????? ?????????? ???? 100%,???? ???? ????????????????????!???????? ?????????? ?????? ???????????????????\n+400% Knockdown time but you very STRONG\n Q:One For All ", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 100)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 1)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_DELAY_MUL, -1)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -2)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 3)
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_HEALTH_MUL, 2)
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_SPEED_MUL, 0.50)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 10)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -1)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, 60)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 3)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, 4)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 15)
trinket = GM:AddTrinket("Soul of Tea", "teasoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(10, 23, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? 40 ????????????????,+15% ?? ???????? ????????????\n +40 speed,+15% Jump power\n Q:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 40)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.15)
trinket = GM:AddTrinket("Soul of Sugger", "sugersoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 25), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+10% ?? ???????? ??????????,-2% ?????????????????????? ??????????\n +10% for melee damage,-2% Damage taken mul\n Q:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
trinket = GM:AddTrinket("Soul of N3ll", "nulledsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(90, 90, 90), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 25), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(70, 65, 133, 9), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+20% ?? ??u???? ??????????,+12% ??0?????????????????? ????0????,+12% ?? ??0??????1????0???? ??????????,????3????1 ?? 6%\n +20% f0r meleE damAge,+12% Damag3 tak3n mul,+12% Heal rec3ived,s1l3 by 6%\n Q:Ultimate", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.06)
trinket = GM:AddTrinket("Soul of Shitus", "lampsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(10, 255, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(29, 53, 104), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(226, 226, 19, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+30% ???????? ?????????? fdkosfdskffsk ??????????\n +30% Melee range\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, 0.30)










--Alt Souls 






trinket = GM:AddTrinket("Soul of Alt Darkness", "altdarksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(21, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? ?? ????????\nBuff to heal\n Q:3", nil, nil, "weapon_zs_altsoul")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.3)

GM:AddTrinket("Soul of Alter Judas", "altjudassoul", false, blcorev, blcorew, nil, "If health lower than 20% give buffs\n???????? ???????????????? ???????? 20% ???? ???????? ??????????\n Q:2", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Alt ???", "altsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+22% ?? ?????????????? ????????????\n+22% Explosion radius.", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.22)
trinket = GM:AddTrinket("Soul of Alt Eden", "soulalteden", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(4, 8, 255, 208), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(165, 39, 39), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(26, 201, 245), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "On kill give random Dkills,can give -20 Dkills\n?????? ???????????????? ???????? ?????????????????? Dkills ?????? ?????????? ???????? ?? ??????????\n Q:D20", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Alt Tea", "altchayok", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(255, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(10, 23, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "+10 ???????????????? ???? ?????? ?????????? ?????????? ???????????????? ???????????????????? ???? ??????-???? ????????\n +10 Speed,on endwave multiple speed on wave count\n Q:1", nil, nil, "weapon_zs_altsoul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 10)


trinket = GM:AddTrinket("Alt Samson Soul", "altsamsonsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 5, 11, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"?????????????????? ?????? ?????????????????? ?????????? ?????????????????? ?????? ????????????,?????? ???????????????? ?????????????? ???????? ????????????.\nDealing or taking damage adds to your rage,Medical rifle removes the RAGE\n Q:3", nil, nil, "weapon_zs_soulalt")


trinket = GM:AddTrinket("Soul of Alt Eve", "altevesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???????????????? ?????????? ?????????????????????? ?????????????? ???????? ???? ???????? 50.\nFire speed faster if health lower than 50\n Q:2", nil, nil, "weapon_zs_soulalt")


trinket = GM:AddTrinket("Soul of Jacob", "jacobsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"???? ???? ?????????????? ???????????????? ???????????? ?????????? ?????????? ???? ???????????? ???? ?????????????????? ???? 20% ???????????? ??????????????.\nYou now don't take point's per wave,+20% point multiplier \n Q:5", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS , -9999)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.20)

trinket = GM:AddTrinket("Soul of Alt Isaac", "altisaacsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(34, 120, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(115, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"??????????\nForgotten\n Q:2", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.1)

trinket = GM:AddTrinket("Soul of Alt Magdalene", "altmagdalenesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 60, 90, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"????????  200 ???????????????? ?? 40 ???????????????? ??????????,-15% ???????? ??????????,???????????????? ????????????????\n +200 hp,+40 blood armor,-15% Melee damage,slowly dying \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 200)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 40)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)

trinket = GM:AddTrinket("Soul of Alt Lilith", "altlilithsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(87, 4, 28), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil,"????????????\n Manhack\n Q:4", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.8)




trinket = GM:AddTrinket("Soul of Alt Azazel", "alteriosoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 165, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???? 60% ???????????? ???????? ???? ????????!-20 ???? ?? -10 ???????????????? ??????????,-60% ???????? ??????????.\n Melee damage multiplier 1.60x! -20 hp -10 blood armor,-60% Melee range\n Q:3", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.60)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -10) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, -0.6) 
trinket = GM:AddTrinket("Soul of Alt Appolyon", "altaposoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(30, 111, 51, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 105, 20, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????????????????? ??????????????.\n Better Projectile Speed\n Q:3", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_PROJ_SPEED, 2)  
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_MUL, 1) 
trinket = GM:AddTrinket("Soul of Alt Bethany", "altbetsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(33, 33, 31, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(120, 200, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????? ???????????????? ????!...???????????? ???????????? ?? ?????????????? ?????? ???? ????!\n-100 HP hp,+700 blood armor\n+100% Heal received\n Q:4", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -100) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 700) 
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.20) 
trinket = GM:AddTrinket("Soul of Alt Lost", "altlostsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 255, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 255, 20, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 95), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "?????????????? ???????????????????? ?????????? ??????????,???? ???? ?????????????????? ?? 1000% ???????? ???????????? ??????????!???? ?????????????? ???? 500 ????????????\nYou move faster through prop,+500 speed\n1000% Damage taken mul \nQ:1", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 100) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 10) 
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 500)
trinket = GM:AddTrinket("Soul of Alt Greed", "altgreedsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(21, 255, 1, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(120, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????? ???????????????? ???????? 10% ???????????? ?? -25% ?? ??????????????,+2 ??????????+20% ?? ????????????\n Sale by 10%,scrap discount +10%,-25% Point Multiplier,+2 luck\n Q:5", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.10)
GM:AddSkillModifier(trinket, SKILLMOD_SCRAPDISCOUNT, -0.10)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, -0.25)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 2.0)
trinket = GM:AddTrinket("Soul of Alt Cain", "altcainsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(9, 155, 9, 55), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(125, 0, 255, 100), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 155), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "???????????????? ???????????? ????????\nCorrupt Souls\n Q:Alt", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Alt Lazarus", "altlazarussoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(9, 0, 0, 195), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(125, 0, 255, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "?????????????? ??????!\nSave You!\n Q:Alt", nil, nil, "weapon_zs_soulalt")
trinket = GM:AddTrinket("Soul of Alt Forgotten", "altforsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(2, 0, 61), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, nil, "?????????? ???????? ???????? ??????????????!???? ?????????????? ?????????????????? ?????????????????? ???????????? ?????????????? ?? ???????????????? ???????????? ??????????\nmelee is dead! you can use other weapon \n Q:Alt", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -1.20)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.5)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, 0.20)



-- Starter Trinkets

trinket, trinketwep = GM:AddTrinket("Armband", "armband", false, mveles, mweles, nil, "-20% melee swing impact delay\n-16% melee damage taken\n-20% ???????????????? ??????????\n-16% ?????????????????????? ???????? ??????????")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.16)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Condiments", "condiments", false, supveles, supweles, nil, "+90% recovery from food\n-20% time to eat food\n -20% ?? ?????????????? ????????????????\n +90% ?? ?????????????? ???? ??????")
GM:AddSkillModifier(trinket, SKILLMOD_FOODRECOVERY_MUL, 0.90)
GM:AddSkillModifier(trinket, SKILLMOD_FOODEATTIME_MUL, -0.20)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Escape Manual", "emanual", false, develes, deweles, nil, "+90% phasing speed\n-12% low health slow intensity\n +90% ?? ???????????????? ???????????????????????? ?? ????????\n -12% ?? ?????????????????????????? ???????????????????? ???? ?????? ????")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.90)
GM:AddSkillModifier(trinket, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.12)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Aiming Aid", "aimaid", false, develes, deweles, nil, "+5% tighter aiming reticule\n-7% reduced effect of aim shake effects\n+5% ?? ???????????????????????? ????????????????\n-6% ?? ???????? ???????????????? ????????????")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_AIM_SHAKE_MUL, -0.06)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Vitamin Capsules", "vitamins", false, hpveles, hpweles, nil, "+8 maximum health\n-32% poison damage taken\n +8 ?? ???????? ????\n-32% ?????????????????????? ?????????? ???? ??????")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 8)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.32)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Welfare Shield", "welfare", false, hpveles, hpweles, nil, "-12% resupply delay\n-20% self damage taken\n-12% ?? ?????????????? ????????????????\n-20% ?????????????????????? ?????????? ???? ????????")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.12)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.20)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Chemistry Set", "chemistry", false, hpveles, hpweles, nil, "+13% medic tool effectiveness\n+100% cloud bomb time\n +13% ?? ?????????????????????????? ?????? ????????????????????????\n+100% ?? ?????????????? ???????????????? ???????????????? ????????")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.13)
GM:AddSkillModifier(trinket, SKILLMOD_CLOUD_TIME, 1)
trinketwep.PermitDismantle = true

--Sins
trinket = GM:AddTrinket(""..translate.Get("t_sin_greed"), "sin_greed", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_greed"))
trinket = GM:AddTrinket(""..translate.Get("t_sin_sloth"), "sin_sloth", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_sloth"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL , 4)
trinket = GM:AddTrinket(""..translate.Get("t_sin_wrath"), "sin_wrath", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_wrath"))
trinket = GM:AddTrinket(""..translate.Get("t_sin_gluttony"), "sin_gluttony", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_gluttony"))
trinket = GM:AddTrinket(""..translate.Get("t_sin_pride"), "sin_pride", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_pride"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.30)
trinket = GM:AddTrinket(""..translate.Get("t_sin_envy"), "sin_envy", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_envy"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.30)
trinket = GM:AddTrinket(""..translate.Get("t_sin_lust"), "sin_lust", false, supveles, supweles, 1, ""..translate.Get("t_d_sin_lust"))

trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.10)
--[[trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))
trinket = GM:AddTrinket(""..translate.Get("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, ""..translate.Get("t_d_vir_pat"))]]