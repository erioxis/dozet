INVCAT_TRINKETS = 1
INVCAT_COMPONENTS = 2
INVCAT_CONSUMABLES = 3
INVCAT_WEAPONS = 4

GM.ZSInventoryItemData = {}
GM.ZSInventoryCategories = {
	[INVCAT_TRINKETS] = translate.Get("vgui_trin"),
	[INVCAT_COMPONENTS] =  translate.Get("vgui_comp"),
	[INVCAT_CONSUMABLES] = translate.Get("vgui_cons"),
	[INVCAT_WEAPONS] = translate.Get("vgui_weap")
}
GM.ZSInventoryPrefix = {
	[INVCAT_TRINKETS] = "trin",
	[INVCAT_COMPONENTS] = "comp",
	[INVCAT_CONSUMABLES] = "cons",
	[INVCAT_WEAPONS] = "weap"
}

GM.Assemblies = {}
GM.TakeItem = {}
GM.Breakdowns = {}

function GM:GetInventoryItemType(item)
	--print(type(item))
--	if type(item) == "Weapon" then
		--item = item:GetClass()
	--end
	for typ, aff in pairs(self.ZSInventoryPrefix) do
		if string.sub(item, 1, 4) == aff then
			return typ
		end
	end

	return -1
end

local index = 1
function GM:AddInventoryItemData(intname, name, description, weles, tier, stocks, icon, bounty, b2)
	local datatab = {PrintName = name, DroppedEles = weles, Tier = tier, Description = description, Stocks = stocks, Index = index, Icon = icon, Bounty = bounty, BountyNeed = b2}
	self.ZSInventoryItemData[intname] = datatab
	self.ZSInventoryItemData[index] = datatab

	index = index + 1
	return self.ZSInventoryItemData[intname]
end



function GM:AddWeaponBreakdownRecipe(weapon, result)
	local datatab = {Result = result, Index = index}
	self.Breakdowns[weapon] = datatab
	for i = 1, 5 do
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
GM.Assemblies["weapon_zs_avelyn"]								= {"trinket_ammovestiii",	"weapon_zs_charon"}
GM.Assemblies["weapon_zs_waraxe"] 								= {"comp_modbarrel", 		"weapon_zs_glock3"}
GM.Assemblies["weapon_zs_bust"] 								= {"comp_busthead", 		"weapon_zs_plank"}
GM.Assemblies["weapon_zs_sawhack"] 								= {"comp_sawblade", 		"weapon_zs_axe"}
--GM.Assemblies["weapon_zs_bloodhack"] 							= {"comp_sawblade", 		"weapon_zs_manhack"}
GM.Assemblies["weapon_zs_megamasher"] 							= {"comp_propanecan", 		"weapon_zs_sledgehammer"}
GM.Assemblies["weapon_zs_electrohammer"] 						= {"comp_electrobattery",	"weapon_zs_hammer"}
GM.Assemblies["weapon_zs_novablaster"] 							= {"comp_basicecore",		"weapon_zs_magnum"}
GM.Assemblies["weapon_zs_tithonus"] 							= {"comp_contaecore",		"weapon_zs_oberon"}
GM.Assemblies["weapon_zs_fracture"] 							= {"comp_pumpaction",		"weapon_zs_sawedoff"}
GM.Assemblies["weapon_zs_seditionist"] 							= {"comp_focusbarrel",		"weapon_zs_deagle"}
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
GM.Assemblies["trinket_electromagnet"]							= {"comp_electrobattery",	"trinket_magnet"}
GM.Assemblies["trinket_projguide"]								= {"comp_cpuparts",			"trinket_targetingvisori"}
GM.Assemblies["trinket_projwei"]								= {"comp_busthead",			"trinket_projguide"}
GM.Assemblies["trinket_controlplat"]							= {"comp_cpuparts",			"trinket_mainsuite"}
GM.Assemblies["weapon_zs_classixx"]				 		    	= {"comp_scoper",			"weapon_zs_classic"}
GM.Assemblies["comp_scoper"]						        	= {"trinket_classixsoul_a",	"trinket_classixsoul"}
GM.Assemblies["weapon_zs_cryman"] 				     			= {"comp_gaussframe",		"weapon_zs_hyena"}
GM.Assemblies["trinket_invalid"]						        	= {"trinket_classil",	"trinket_analgestic"}
GM.Assemblies["weapon_zs_m5"]						        	= {"comp_sacred_soul",	"weapon_zs_m4"}
GM.Assemblies["weapon_zs_m6_alt"]						        	= {"trinket_altcainsoul",	"weapon_zs_m6"}
--GM.Assemblies["trinket_aposoul"]				        	= {"trinket_targetingvisori",	"trinket_blanksoul"}
GM.Assemblies["trinket_greedsoul"]						        	= {"trinket_salevoy_q3",	"trinket_blanksoul"}
GM.Assemblies["trinket_evesoul"]						        	= {"trinket_bloodpack",	"trinket_blanksoul"}
GM.Assemblies["weapon_zs_singurhammer"] 						= {"trinket_electromagnet",	"weapon_zs_electrohammer"}
GM.Assemblies["weapon_zs_megaray"] 						= {"trinket_soulmedical",	"weapon_zs_healingray"}
GM.Assemblies["weapon_zs_manhack_saw"] 						= {"trinket_aposoul",	"weapon_zs_manhack"}
GM.Assemblies["weapon_zs_katana"] 						= {"trinket_altbetsoul",	"weapon_zs_teslorer"}
GM.Assemblies["trinket_lotteryticket"] 						= {"comp_ticket",	"trinket_greedeye"}
GM.Assemblies["trinket_mysteryticket"] 						= {"comp_ticket",	"trinket_greedsoul"}
GM.Assemblies["trinket_soulrepairman"] 						= {"trinket_soulmedical",	"weapon_zs_hammer"}
GM.Assemblies["trinket_soulmedical"] 						= {"trinket_curse_dropping",	"trinket_altisaacsoul"}
GM.Assemblies["trinket_toykasoul"] 						= {"trinket_toysoul",	"weapon_zs_loy_q4"}
GM.Assemblies["weapon_zs_envy_hammer"] 						= {"trinket_sin_envy",	"weapon_zs_singurhammer"}
--Собирание душ из осколков
GM.Assemblies["trinket_soulrepairman"] 						= {"comp_soul_dosei",	"comp_soul_alt_h"}
GM.Assemblies["trinket_soulmedical"] 						= {"comp_soul_dosei",	"comp_soul_health"}
GM.Assemblies["trinket_betsoul"] 						= {"comp_soul_health",	"comp_soul_health"}
GM.Assemblies["trinket_magdalenesoul"] 						= {"comp_soul_health",	"comp_soul_alt_h"}
GM.Assemblies["trinket_aposoul"] 						= {"comp_soul_hack",	"comp_soul_status"}
GM.Assemblies["trinket_lilithsoul"] 						= {"comp_soul_status",	"comp_soul_hack"}
GM.Assemblies["trinket_whysoul"] 						= {"comp_soul_godlike",	"comp_soul_dosei"}
GM.Assemblies["trinket_darksoul"] 						= {"comp_soul_dd",	"comp_soul_booms"}
GM.Assemblies["trinket_eriosoul"] 						= {"comp_soul_dd",	"comp_soul_melee"}
GM.Assemblies["comp_soul_emm"] 						= {"comp_soul_dd",	"weapon_zs_sigilfragment"}
GM.Assemblies["comp_soul_emm2"] 						= {"comp_soul_dosei",	"comp_soul_godlike"}
GM.Assemblies["comp_soul_emm3"] 						= {"comp_soul_emm2",	"comp_soul_emm"}
GM.Assemblies["weapon_zs_sigil_port_a"] 						= {"trinket_altcainsoul","comp_soul_emm3"}

local trs = translate.Get
local function funcofvoid(pl, nouse)
	local use = {}
	for item,v in pairs(pl:GetInventoryItems()) do
		local g = table.HasValue(string.Explode("_",item), "curse")
		if item ~= nouse and string.len(item) >= 7 and !g then
			table.insert(use, #use + 1,item)
		end
	end
	if #use <= 1 then return end
	local toeat = table.Random(use)
	local use2 = {}
	local data = GAMEMODE.ZSInventoryItemData
	for item,v in pairs(data) do
		local g = table.HasValue(string.Explode("_",item), "curse")
		if item ~= nouse and (data[item].Tier or 1) == (data[toeat].Tier or 1) and string.len(item) >= 7 and !g then
			table.insert(use2, #use2 + 1,item)
		end
	end
	if #use2 <= 1 then return end
	pl:TakeInventoryItem(toeat)
	local gived = table.Random(use2)
	pl:AddInventoryItem(gived)
	net.Start("zs_trinketcorrupt")
		net.WriteString(toeat)
		net.WriteString(gived)
	net.Send(pl)
end
local function funcofd1(pl, nouse)
	local use = {}
	for item,v in pairs(pl:GetInventoryItems()) do
		if item ~= nouse and string.len(item) >= 7  then
			table.insert(use, #use + 1,item)
		end
		
	end
	if #use <= 1 then return end
	local toeat = table.Random(use)
	local use2 = {}
	local data = GAMEMODE.ZSInventoryItemData
	for item,v in pairs(data) do
		if item ~= nouse and (data[item].Tier or 1) == (data[toeat].Tier or 1) and string.len(item) >= 7 then
			table.insert(use2, #use2 + 1,item)
		end
	end
	if #use2 <= 1 then return end
	
	local gived = table.Random(use2)
	if table.HasValue(string.Explode("_",toeat), "curse") then
		local g = GAMEMODE.Curses[math.random(1,#GAMEMODE.Curses)]
		pl:AddInventoryItem(g)
		net.Start("zs_invitem")
			net.WriteString(g)
		net.Send(pl)
	elseif math.random(1,10) ~= 1 then
		pl:AddInventoryItem(toeat)
		net.Start("zs_invitem")
		net.WriteString(toeat)
	net.Send(pl)
	else
		pl:AddInventoryItem(gived)
		net.Start("zs_invitem")
		net.WriteString(gived)
	net.Send(pl)
	end

end
GM:AddInventoryItemData("cons_void",		trs("c_void"),			trs("c_void_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	funcofvoid(pl, "cons_void")
end,3)
local upvec = Vector(0,0,10)
GM:AddInventoryItemData("cons_recall",		trs("c_recall"),			trs("c_recall_d"),								"models/props_c17/trappropeller_lever.mdl", 1, nil, nil, function(pl) 
	local clone = pl.Clonehehe
	if clone and clone:IsValid() then
		clone:SetPos(pl:GetPos()+upvec)
	end
end,0)
GM:AddInventoryItemData("cons_deadly_vit",		trs("c_deadly_vit"),			trs("c_deadly_vit_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	for k,v in pairs(pl:GetStatuses()) do
		local class = v:GetClass()
		local tab = GAMEMODE.Statuses[string.sub(class,8,#class)]
		if v and v:IsValid() then
			v:AddDie(tab and tab.Debuff and -75 or -25)
		end
	end
end,5)
GM:AddInventoryItemData("cons_idol",		trs("c_idol"),			trs("c_idol_d").." I",								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	print(":)")
end,5)
GM:AddInventoryItemData("cons_xmas_goodness",		trs("c_new_year"),			trs("c_new_year_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	local droped = ents.Create("prop_gift")
	droped:SetPos(pl:GetPos()+Vector(0,0,70))
	droped:Spawn()
end,1)
local tbleternal = {"headshoter", "ind_buffer", "ultra_at", "pearl","broken_world","whysoul","altevesoul","lucky_chance","acum","driller","mirror_of_god","module_mirror"} 
local medet = {	"pr_gold",
"pr_barapaw",
"pr_chamomile",
"pr_bloodpack",
"soulmedical"}
local sinse = {	"sin_wrath",
"sin_gluttony",
"sin_sloth",
"sin_envy",
"sin_pride",
"sin_ego",
"sin_lust"}
local quecader = {	"troyaksoul",
"nanite_nails",
"useself",
"illegalmechanism",
"soulmedical"}
GM:AddInventoryItemData("cons_bounty",		trs("c_bounty"),			trs("c_bounty_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	local tbl = tbleternal
	if pl:IsSkillActive(SKILL_SINS_2) then
		table.Add(tbl,sinse)
	end
	if pl.MedicalBounty > 0 then
		tbl = medet
	end
	if pl.CadersBounties > 0 then
		tbl = quecader
	end
	local tries = 0
	local need = pl.SeededBounty or {}
	while #need < 3 do
		local item = tbl[math.random(1,#tbl)]
		if !table.HasValue(need,item)  and !(pl:HasTrinket(item) or pl:HasInventoryItemQ("trinket_"..item)) then 
			need[#need+1] = item
		end
		tries = tries + 1
		if #need > 2 or tries > 20 then
			break
		end
	end

	pl.SeededBounty = #need > 0 and need or {math.random(1,9)}
	net.Start("zs_openbounty")
	net.WriteTable(pl.SeededBounty)
	net.Send(pl)
end,0)
local pick =  {
	"altjudassoul",  -- 2
	"altsamsonsoul",  -- 3
	"alt_slight_soul",
	"slight_soul",
	"altevesoul",  -- 4
	"jacobsoul",  -- 5
	"altisaacsoul",  -- 6
	"altmagdalenesoul",  -- 7
	"altlilithsoul",  -- 8
	"alteriosoul", -- 10 
	"altaposoul",  --14
	"altbetsoul",  --15
	"altlostsoul",  --16
	"altgreedsoul",  --17
	"altcainsoul",   --18
	"altlazarussoul",	-- 19
	"altforsoul", -- 20
	"altsoul",-- 21
	"soulalteden", -- 22
	"altchayok", --23
	"altdarksoul", -- 24
	"bleaksoul",  -- 1
	"spiritess",  -- 2
	"samsonsoul",  -- 3
	"evesoul",  -- 4
	"soul_lime",
	"jacobjesausoul",  -- 5
	"isaacsoul",  -- 6
	"magdalenesoul",  -- 7
	"lilithsoul",  -- 8
	"whysoul",  -- 9
	"blanksoul", -- 10
	"classixsoul",  -- 11
	"darksoul",  --12
	"eriosoul",  --13
	"aposoul",  --14
	"betsoul",  --15
	"lostsoul",  --16
	"greedsoul",  --17
	"cainsoul",   --18
	"lazarussoul",	-- 19
	"forsoul",  -- 20
	"starsoul",  -- 21
	"teasoul",  -- 22
	"sugersoul",  -- 23
	"nulledsoul",  -- 24
	"soulmedical",  -- 25
	"lampsoul",  -- 26
	"classixsoul_a",
	"nulledsoul_alt",
	"lehasoul",  -- 26
	"troyaksoul",
	"troyaksoul_a"
}
GM:AddInventoryItemData("cons_soul_picka",		trs("c_soul_picka"),			trs("c_soul_picka_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 

	local need = pl.SeededSouls or {}
	local tries = 0
	if #need < 2 then
		while #need < 3 or tries < 20 do
			local item = pick[math.random(1,#pick)]
			if !table.HasValue(need,item) and !(pl:HasTrinket(item) or pl:HasInventoryItemQ("trinket_"..item)) then 
				need[#need+1] = item
			end
			tries = tries + 1
			if #need > 2 or tries > 20 then
				break
			end
		end
	end
	pl.SeededSouls = need
	net.Start("zs_openbounty")
		net.WriteTable(need)
	net.Send(pl)
end,0)
GM:AddInventoryItemData("cons_wildcard",		trs("c_wildcard"),			trs("c_wildcard_d"),								"models/props_c17/trappropeller_lever.mdl", 4, nil, nil, function(pl) 
	local lcall = pl.LastCall or "cons_void"
	local callback = GAMEMODE.ZSInventoryItemData[lcall].Bounty
	local n = 1
	if math.random(1,20) == 5 then
		n = 3
	end
	local uses = GAMEMODE.ZSInventoryItemData[lcall].BountyNeed*0.5*(pl.ChargesUse or 1)
	for i=1,n do
		timer.Simple(i*0.1, function()
			if pl:HasInventoryItem(lcall) and callback and uses <= pl:GetChargesActive() then
				callback(pl)
				if pl:IsSkillActive(SKILL_DOUBLE) and math.random(1,4) == 1 then
					uses = 0
				end
				if n == 2 then
					pl:TakeInventoryItem("cons_wildcard")
				end
			end
		end)
	end
	pl:SetChargesActive(pl:GetChargesActive()-uses)
end,0)
GM:AddInventoryItemData("cons_flame_p",		trs("c_flame_p"),			trs("c_flame_p_d"),								"models/props_c17/trappropeller_lever.mdl", 1, nil, nil, function(pl) 
	if pl:HasWeapon("weapon_zs_molotov") then pl:GiveAmmo(1, "molotov") return end
	pl:Give("weapon_zs_molotov")
end,3)
GM:AddInventoryItemData("cons_grandma_vase",		trs("c_grandma"),			trs("c_grandma_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	local droped = ents.Create("projectile_purgatory_soul")
	droped:SetPos(pl:GetPos()+Vector(0,0,70))
	droped:Spawn()
	droped.TimeToDash = CurTime() + 0.3
	droped.DamageToDeal = 350
	droped:SetOwner(pl)
	if math.randomr(1,100,1,pl) == 1 then
		for i=1,9 do
			local droped = ents.Create("projectile_purgatory_soul")
			droped:SetPos(pl:GetPos()+Vector(0,0,70))
			droped:Spawn()
			droped.TimeToDash = CurTime() + 0.3 + 0.7 * i
			droped.DamageToDeal = 350
			droped:SetOwner(pl)
		end
	end
end,1)
GM:AddInventoryItemData("cons_devolver",		trs("c_devo"),			trs("c_devo_d"),								"models/props_c17/trappropeller_lever.mdl", 8, nil, nil, function(pl) 
	for k,v in pairs(ents.FindInBoxRadius(pl:GetPos(),100)) do
		if v:IsValid() and v:GetClass() == "prop_invitem" then
			local inv = v:GetInventoryItemType()
			local tbl = GAMEMODE.ZSInventoryItemData[inv]
			local d = string.Explode(" " ,string.lower(tbl.PrintName))
			if (table.HasValue(d, "soul") or pl:IsSkillActive(SKILL_SISYS_ROCK) and table.HasValue(d, "sin")) then
				if tbl.Tier then
					pl:SetPoints(pl:GetPoints()+30*(tbl.Tier or 1))
				end
				v:Remove()
			end
		end
	end
end,8)
GM:AddInventoryItemData("cons_black_hole",		trs("c_bhole"),			trs("c_bhole_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	local droped = ents.Create("projectile_succubus_test")
	droped:SetPos(pl:GetPos()+Vector(0,0,70))
	droped:Spawn()
	droped:SetOwner(pl)
	--droped:SetParent(pl)
end,4)
GM:AddInventoryItemData("cons_minos",		trs("c_minos"),			trs("c_minos_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(owner) 
	local ent = ents.Create("projectile_mprime_proj_act")
	if ent:IsValid() then
		ent:SetPos(owner:GetShootPos())
		ent:SetAngles(owner:EyeAngles())
		ent:SetOwner(owner)
		ent.ProjDamage = 320 
		ent.ProjSource = owner
		ent.ShotMarker = i
		ent.Team = owner:Team()

		ent:Spawn()

		local phys = ent:GetPhysicsObject()
		if phys:IsValid() then
			phys:Wake()

			local angle = owner:GetAimVector():Angle()
			angle:RotateAroundAxis(angle:Forward(), ssfw or math.Rand(0, 360))
			angle:RotateAroundAxis(angle:Up(), ssup or math.Rand(0, 0))

			ent.PreVel = angle:Forward() * 2600 * (owner.ProjectileSpeedMul or 1)
			phys:SetVelocityInstantaneous(ent.PreVel)
		end
	end
end,2)
GM:AddInventoryItemData("cons_d4",		"D4",			trs("c_d4_d"),								 {
	["d4_p1"] = { type = "Model", model = "models/phxtended/trieq2x2x2solid.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.435, 2.438, -4.36), angle = Angle(0, 0, 0), size = Vector(0.123, 0.123, 0.123), color = Color(13, 116, 0, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1+"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.114, -4.167, -4.41), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.37, 2.911, -2.547), angle = Angle(0, 0, 0), size = Vector(0.223, 0, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1+++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.791, 2.61, 1.556), angle = Angle(0, 0, 0), size = Vector(0.223, 0, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-2.881, -1.172, -0.716), angle = Angle(0, 0, 0), size = Vector(0, 0.323, 0.323), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1+++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.389, -0.009, -4.41), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1++++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.32, -4.983, -1.441), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1+++++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(-0.087, -0.071, -4.577), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1++++++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(0.785, -2.728, 2.274), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1+++++++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.131, -1.581, -1.363), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} },
	["d4_p1++++++++++"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.973, -1.118, 1.82), angle = Angle(0, 0, 0), size = Vector(0.223, 0.223, 0.223), color = Color(27, 51, 24, 255), surpresslightning = true, material = "plastic/plasticwall001a", skin = 0, bodygroup = {} }
}, 3, nil, nil, function(pl) 
	for i=1,10 do
		funcofvoid(pl, "cons_d4")
	end
end,12)
GM:AddInventoryItemData("cons_d1",		"D1",			trs("c_d1_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	funcofd1(pl, "cons_d1")
end,4)
GM:AddInventoryItemData("cons_gausscard",		trs("c_gausscard"),			trs("c_gausscard_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	pl:Give("weapon_zs_gauss_card_r5")
	timer.Simple(10, function() pl:StripWeapon("weapon_zs_gauss_card_r5") end)
end,10)
GM:AddInventoryItemData("cons_sack_of_trinkets",		trs("c_sack_of_trinkets"),			trs("c_sack_of_trinkets_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl)
	local use2 = {} 
	local data = GAMEMODE.ZSInventoryItemData
	for item,v in pairs(data) do
		local g = table.HasValue(string.Explode("_",item), "curse")
		if item ~= nouse and !pl:HasInventoryItem(item) and string.len(item) >= 5 and !g and  (data[item].Tier or 1) <= 3 and !pl:HasInventoryItemQ(item) then
			table.insert(use2, #use2 + 1,item)
		end
	end
	local bl = table.Random(use2)
	pl:AddInventoryItem(bl)
	net.Start("zs_invitem")
		net.WriteString(bl)
	net.Send(pl)
end,10)
GM:AddInventoryItemData("cons_friendship",		trs("c_friendship"),			trs("c_friendship_d"),								"models/props_c17/trappropeller_lever.mdl", 1, nil, nil, function(pl) 
	local humans = team.GetPlayers(TEAM_HUMAN)
	local tabled = {}
	local count = 0
	
	for i = 1, #humans do
	  local human = humans[i]
	  if human:Health() < human:GetMaxHealth() then
		tabled[count] = human
		count = count + 1
	  end
	end
	
	if count < 1 then return end
	
	local healed = NULL
	for i = 1, 2 do
	  local index = math.random(count)
	  local heal = tabled[index]
	
	  if healed == heal then
		tabled[index] = tabled[count]
		tabled[count] = nil
		count = count - 1
	
		index = math.random(count)
		heal = tabled[index]
	  end
	
	  if heal and heal:IsValid() then
		healed = heal
		pl:HealPlayer(heal, 20)
		heal:SetBloodArmor(heal.MaxBloodArmor + 20)
		if pl ~= heal then
		  pl:AddPoints(2)
		end
	  end
	end
end,2)
GM:AddInventoryItemData("cons_chaos",		trs("c_chaos"),			trs("c_chaos_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	local use2 = {}
--	if pl.UsesChaosCard then pl:AddChargesActive(5) return end
	local data = GAMEMODE.ZSInventoryItemData
	for item,v in pairs(GAMEMODE.GetActiveTrinkets) do
		if item ~= "cons_chaos" and item ~= "cons_wildcard" and data[item].Bounty and data[item].BountyNeed then
			table.insert(use2, #use2 + 1,item)
		end
	end
	pl.UsesChaosCard = true
	for i=1,5 do
		local trinket = use2[math.random(#use2)]
		pl:SendLua('local p = GAMEMODE.ZSInventoryItemData['..trinket..'].PrintName GAMEMODE:CenterNotify({killicon = "weapon_zs_craftables"}, " ", COLOR_RORANGE, translate.Format("trinket_activated", p))')
		local callback = data[trinket].Bounty
		callback(pl)
		--print(trinket)
	end
end,5)
GM:AddInventoryItemData("cons_dust",		trs("c_dust"),			trs("c_dust_d"),								"models/props_c17/trappropeller_lever.mdl", 1, nil, nil, function(pl) 
	pl:GiveStatus("portal",10)
end,2)
GM:AddInventoryItemData("cons_pill_unk",		trs("c_pill"),			trs("c_pill_d"),								"models/props_c17/trappropeller_lever.mdl", 2, nil, nil, function(pl) 
	if math.random(1,3) ~= 1 then
		pl:TakeDamage(pl:Health()*0.25, pl, pl) 
	else 
		local melee = (pl:GetActiveWeapon() and pl:GetActiveWeapon().IsMelee or false)
		local ammo = (!melee and pl:GetResupplyAmmoType() or "scrap")
		pl:GiveAmmo((melee and 5 or 20),ammo) 
	end
end,2)
GM:AddInventoryItemData("cons_mantle",		trs("c_mantle"),			trs("c_mantle_d"),								"models/props_c17/trappropeller_lever.mdl", 2, nil, nil, function(pl) 
	pl.HolyMantle = pl.HolyMantle+1
end,3)
GM:AddInventoryItemData("cons_necronomicon_q1",		trs("c_necronomicon"),			trs("c_necronomicon_d"),								"models/props_c17/trappropeller_lever.mdl", 2, nil, nil, function(pl) 
	for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
		timer.Simple(0.3, function() v:TakeSpecialDamage(250,DMG_DIRECT,pl,pl) end)
		pl:EmitSound("ambient/atmosphere/thunder1.wav", 50, 500, 0.5)
	end
	if math.random(1,100) <= 10 then pl:TakeInventoryItem("cons_necronomicon_q1") pl:AddInventoryItem("cons_necronomicon") end
end,2)
local dcad = GM:AddInventoryItemData("cons_necronomicon",		trs("c_necronomicon"),			trs("c_necronomicon_broke_d"),								"models/props_c17/trappropeller_lever.mdl", 2, nil, nil, function(pl) 
	local z = 0
	for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
		if z >= 3 then break end
		if !(v:GetZombieClassTable().Boss or v:GetZombieClassTable().DemiBoss) then
			timer.Simple(0.1, function() v:TakeSpecialDamage(250,DMG_DIRECT,pl,pl) end)
			z = z + 1
			pl:EmitSound("ambient/atmosphere/thunder1.wav", 50, 500, 0.5)
		end
	end
	if math.random(1,100) <= 10 then pl:TakeInventoryItem("cons_necronomicon") end
end,1)
dcad.Upgradable = true
dcad.NeedForUpgrade = "comp_soul_dosei"
dcad.Tier = 4

GM:AddInventoryItemData("cons_timer",		trs("c_timer"),			trs("c_timer_d"),								"models/props_c17/trappropeller_lever.mdl", 3, nil, nil, function(pl) 
	if GAMEMODE.ObjectiveMap then return end
	gamemode.Call(
		gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
		(gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) + (math.random(1,3) == 3 and -15 or 15)
	)
end,6)
GM:AddInventoryItemData("comp_key",		trs("c_key"),			trs("c_key_d"),								"models/props_c17/trappropeller_lever.mdl",6)
GM:AddInventoryItemData("comp_modbarrel",		trs("c_modbarrel"),			trs("c_modbarrel_d"),								"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_burstmech",		trs("c_burstmech"),			trs("c_burstmech_d"),										"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_basicecore",		trs("c_basicecore"),		trs("c_basicecore_d"),	"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_busthead",		trs("c_busthead"),			trs("c_busthead_d"),								"models/props_combine/breenbust.mdl")
GM:AddInventoryItemData("comp_sawblade",		trs("c_sawblade"),			trs("c_sawblade_d"),								"models/props_junk/sawblade001a.mdl")
GM:AddInventoryItemData("comp_propanecan",		trs("c_propanecan"),		trs("c_propanecan_d"),				"models/props_junk/propane_tank001a.mdl")
GM:AddInventoryItemData("comp_electrobattery",	trs("c_electrobattery"),	trs("c_electrobattery_d"),								"models/items/car_battery01.mdl")
GM:AddInventoryItemData("comp_hungrytether",	"Hungry Tether",			"A hungry tether from a devourer that comes from a devourer rib.",								"models/gibs/HGIBS_rib.mdl")
GM:AddInventoryItemData("comp_contaecore",		trs("c_contaecore"),	trs("c_contaecore_d"),							"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_pumpaction",		trs("c_pumpaction"),	trs("c_pumpaction_d"),										"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_focusbarrel",		trs("c_focusbarrel"),		trs("c_focusbarrel_d"),		"models/props_c17/trappropeller_lever.mdl")
GM:AddInventoryItemData("comp_gaussframe",		"Gauss Frame",				"A highly advanced gauss frame. It's almost alien in design, making it hard to use.",			"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_metalpole",		"Metal Pole",				"Long metal pole that could be used to attack things from a distance.",							"models/props_c17/signpole001.mdl")
GM:AddInventoryItemData("comp_salleather",		"Salvaged Leather",			"Pieces of leather that are hard enough to make a nasty impact.",								"models/props_junk/shoe001.mdl")
GM:AddInventoryItemData("comp_gyroscope",		"Gyroscope",				"A metal gyroscope used to calculate orientation.",												"models/maxofs2d/hover_rings.mdl")
GM:AddInventoryItemData("comp_reciever",		trs("c_reciever"),					trs("c_reciever_d"),					"models/props_lab/reciever01b.mdl")
GM:AddInventoryItemData("comp_cpuparts",		trs("c_cpuparts"),				trs("c_cpuparts_d"),																"models/props_lab/harddrive01.mdl")
GM:AddInventoryItemData("comp_launcher",		trs("c_launcher"),			trs("c_launcher_d"),															"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_launcherh",		trs("c_launcherh"),		trs("c_launcherh_d"),												"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_shortblade",		trs("c_shortblade"),				trs("c_shortblade_d"),												"models/weapons/w_knife_t.mdl")
GM:AddInventoryItemData("comp_multibarrel",		trs("c_multibarrel"),		trs("c_multibarrel_d"),							"models/props_lab/pipesystem03a.mdl")
GM:AddInventoryItemData("comp_holoscope",		trs("c_holoscope"),		trs("c_holoscope_d"),												{
	["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.273, 1.728, -0.843), angle = Angle(74.583, 180, 0), size = Vector(2.207, 0.105, 0.316), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c1ombine/tprotato1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.492, -1.03, 0), angle = Angle(0, -78.715, 90), size = Vector(0.03, 0.02, 0.032), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} }
})
GM:AddInventoryItemData("comp_scoper",		"Scopy",		"Heh for classix.",												{
	["base"] = { type = "Model", model = "models/props_c17/utilityconnecter005.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.273, 1.728, -0.843), angle = Angle(74.583, 180, 0), size = Vector(2.207, 0.105, 0.316), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_combine/tprotato1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0.492, -1.03, 0), angle = Angle(0, -78.715, 90), size = Vector(0.03, 0.02, 0.032), color = Color(50, 50, 66, 255), surpresslightning = false, material = "models/props_pipes/pipeset_metal02", skin = 0, bodygroup = {} }
})
local soulrec = {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(167, 23, 167), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}
GM:AddInventoryItemData("comp_linearactuator",	"Linear Actuator",			"A linear actuator from a shell holder. Requires a heavy base to mount properly.",				"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_pulsespool",		"Pulse Spool",				"Used to inject more pulse power to a system. Could be used to stabilise something.",			"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_flak",			"Flak Chamber",				"An internal chamber for projecting heated scrap.",												"models/weapons/w_rocket_launcher.mdl")
GM:AddInventoryItemData("comp_precision",		"Precision Chassis",		"A suite setup for rewarding precise shots on moving targets.",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_mommy",		"Mommy",		"Mom from Cryman.",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_sacred_soul",		"Sacred Soul",		"This sacred cartridge...",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_bloodhack",		"Bloody Hack",		"djasnndwhadjajs||daw...",									"models/Items/combine_rifle_cartridge01.mdl")
GM:AddInventoryItemData("comp_ticket",		trs("c_ticket"),		trs("c_ticket_d"),									"models/props_c17/paper01.mdl")
--Осколки душ
GM:AddInventoryItemData("comp_soul_hack",		"Piece of soul(HACK)",		"Blank soul of hacks things", soulrec)
GM:AddInventoryItemData("comp_soul_melee",		"Piece of soul(MELEE)",		"Blank soul of melee things", soulrec)
GM:AddInventoryItemData("comp_soul_status",		"Piece of soul(STATUS)",		"Blank soul of status things", soulrec)
GM:AddInventoryItemData("comp_soul_health",		"Piece of soul(HEALTH)",		"Blank soul of health things", soulrec)
GM:AddInventoryItemData("comp_soul_alt_h",		"Piece of soul(ALTERNATIVE HEALTH)",		"Blank soul of ALT health things", soulrec)
GM:AddInventoryItemData("comp_soul_godlike",		"Piece of soul(GOD LIKE)",		"Blank soul of GODLIKE! things", soulrec)
GM:AddInventoryItemData("comp_soul_dosei",		"Piece of soul(DOSEI)",		"Blank soul of dosei things", soulrec)
GM:AddInventoryItemData("comp_soul_dd",		"Piece of soul(BIG MANS)",		"Blank soul of big mans things", soulrec)
GM:AddInventoryItemData("comp_soul_booms",		"Piece of soul(BOOMS)",		"Blank soul of booms things", soulrec)

GM:AddInventoryItemData("comp_soul_emm",		"Piece of Anti-Sigil",		"Ermmmm", soulrec)
GM:AddInventoryItemData("comp_soul_emm2",		"Piece of sigil???",		"Worth", soulrec)
GM:AddInventoryItemData("comp_soul_emm3",		"*23LskdNhx3796SDhnHadj",		"27^39j4nHndk0890-2=23+3nH\nsjDnhfgjgyrjb", soulrec)

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
trinket, trinketwep = GM:AddTrinket(trs("t_lticket"), "lotteryticket", false, hpveles, hpweles, 2, trs("t_d_lticket"), nil, nil, "weapon_zs_special_trinket")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_mticket"), "mysteryticket", false, hpveles, hpweles, 5, trs("t_d_mticket"), nil, nil, "weapon_zs_special_trinket")
trinketwep.PermitDismantle = true
-- Health Trinkets

trinket, trinketwep = GM:AddTrinket(trs("t_gasmask"), "gasmask", false, hpveles, hpweles, 4, trs("t_d_gasmask"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.1)
trinket, trinketwep = GM:AddTrinket(trs("t_healthpack"), "vitpackagei", false, hpveles, hpweles, 2, trs("t_d_healthpack"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.09)
trinketwep.PermitDismantle = true

GM:AddTrinket(trs("t_bloodgrass"), "bloodgrass", false, hpveles, hpweles, 4, trs("t_d_bloodgrass"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddTrinket(trs("t_antidevo"), "antidevo", false, hpveles, hpweles, 2, trs("t_d_antidevo"), nil, nil, "weapon_zs_defence_trinket_d")


GM:AddTrinket(trs("t_acum"), "acum", false, nil, "models/items/car_battery01.mdl", 5, trs("t_d_acum"), nil, nil, "weapon_zs_special_trinket")

trinket = GM:AddTrinket(trs("t_vbank"), "vitpackageii", false, hpveles, hpweles, 2, trs("t_d_vbank"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 20)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, -0.03)

trinket = GM:AddTrinket(trs("t_truepill"), "pills", false, hpveles, hpweles, 2, trs("t_d_truepill"), nil, 15, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.11)
--trinket = GM:AddTrinket("Damage", "damage222", false, hpveles, hpweles, 4, "+10% damage melee ")
--GM:AddWeaponModifier(trinket, WEAPON_MODIFIER_DAMAGE, 3)

trinket = GM:AddTrinket(trs("t_a_flower"), "a_flower", false, hpveles, hpweles, 5, trs("t_d_a_flower"), nil, 15, "weapon_zs_melee_trinket")

trinket = GM:AddTrinket(trs("t_richeye"), "greedeye", false, hpveles, hpweles, 3, trs("t_d_richeye"), nil, nil, "weapon_zs_special_trinket", {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["Skin"] = 0,
						["UniqueID"] = "62f09606e93a91ba4c42b4f77cfe4c0458874690b0103bd13e71fb2e47dea9f9",
						["NoLighting"] = false,
						["AimPartName"] = "",
						["IgnoreZ"] = false,
						["AimPartUID"] = "",
						["Materials"] = "",
						["Name"] = "cube025x025x025",
						["LevelOfDetail"] = 0,
						["NoTextureFiltering"] = false,
						["PositionOffset"] = Vector(1.5, 0, 0),
						["IsDisturbing"] = false,
						["EyeAngles"] = false,
						["DrawOrder"] = 0,
						["TargetEntityUID"] = "",
						["Alpha"] = 1,
						["Material"] = "models/debug/debugwhite",
						["Invert"] = false,
						["ForceObjUrl"] = false,
						["Bone"] = "head",
						["Angles"] = Angle(0, 0, 0),
						["AngleOffset"] = Angle(0, 0, 0),
						["BoneMerge"] = false,
						["Color"] = Vector(1, 1, 0),
						["Position"] = Vector(0, 0.80000001192093, 0.12999999523163),
						["ClassName"] = "model2",
						["Brightness"] = 0.6,
						["Hide"] = false,
						["NoCulling"] = false,
						["Scale"] = Vector(10.39999961853, 0.20000000298023, 0.80000001192093),
						["LegacyTransform"] = false,
						["EditorExpand"] = false,
						["Size"] = 0.025,
						["ModelModifiers"] = "",
						["Translucent"] = false,
						["BlendMode"] = "",
						["EyeTargetUID"] = "",
						["Model"] = "models/hunter/blocks/cube025x025x025.mdl",
					},
				},
			},
			["self"] = {
				["Skin"] = 0,
				["UniqueID"] = "dd8f0a0dd9a0fde373e4c04a14e0e7bd423e01745e99332ddfd985bdf9b3dacc",
				["NoLighting"] = false,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Materials"] = "",
				["Name"] = "",
				["LevelOfDetail"] = 0,
				["NoTextureFiltering"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["EyeAngles"] = false,
				["DrawOrder"] = 0,
				["TargetEntityUID"] = "",
				["Alpha"] = 1,
				["Material"] = "",
				["Invert"] = false,
				["ForceObjUrl"] = false,
				["Bone"] = "eyes",
				["Angles"] = Angle(90, 180, 180),
				["AngleOffset"] = Angle(0, 0, 0),
				["BoneMerge"] = false,
				["Color"] = Vector(1, 1, 0),
				["Position"] = Vector(1.1000000238419, 1.5, 0),
				["ClassName"] = "model2",
				["Brightness"] = 3,
				["Hide"] = false,
				["NoCulling"] = false,
				["Scale"] = Vector(0.69999998807907, 0.69999998807907, 3),
				["LegacyTransform"] = false,
				["EditorExpand"] = true,
				["Size"] = 0.025,
				["ModelModifiers"] = "",
				["Translucent"] = false,
				["BlendMode"] = "",
				["EyeTargetUID"] = "",
				["Model"] = "models/props_phx/construct/glass/glass_angle360.mdl",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "fac50a0ad260b8caa8cd5fa308a13bd2e41e45d2996d038a18ce7e5e1604f0e1",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "dsadasdada2",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
}})
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 20)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, 0.05)

trinket = GM:AddTrinket(trs("t_bara"), "classil", true, hpveles, hpweles, 4, trs("t_d_bara"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 60)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 0.09)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, -5)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.35)

trinket, trinketwep = GM:AddTrinket(trs("t_bloodpack"), "bloodpack", false, hpveles, hpweles, 2, trs("t_d_bloodpack"), nil, 15, "weapon_zs_defence_trinket_d")
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(trs("t_bloodpacki"), "cardpackagei", false, hpveles, hpweles, 2, trs("t_d_bloodpacki"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.07)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(trs("t_bloodpackii"), "cardpackageii", false, hpveles, hpweles, 3, trs("t_d_bloodpackii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.12)

GM:AddTrinket(trs("t_regimp"), "regenimplant", false, hpveles, hpweles, 3, trs("t_d_regimp"), nil, nil, "weapon_zs_defence_trinket")
GM:AddTrinket(trs("t_longgrip"), "longgrip", false, hpveles, hpweles, 3, trs("t_d_longgrip"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, 0.10)

trinket, trinketwep = GM:AddTrinket(trs("t_bioclean"), "biocleanser", false, hpveles, hpweles, 2, trs("t_d_bioclean"), nil, nil, "weapon_zs_special_trinket")
trinketwep.PermitDismantle = true

GM:AddSkillModifier(GM:AddTrinket(trs("t_cutset"), "cutlery", false, hpveles, hpweles, nil, trs("t_d_cutset"), nil, nil, "weapon_zs_defence_trinket", "Lol"), SKILLMOD_FOODEATTIME_MUL, -0.8)
trinket, trinketwep = GM:AddTrinket(trs("t_killer"), "killer", false, hpveles, hpweles, 2, trs("t_d_killer"), nil, nil, "weapon_zs_melee_trinket_d")
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
trinket, trinketwep = GM:AddTrinket("Сало", "salo", false, mveles, mweles, 2, "Доигрались хохлы?")

trinketwep.PermitDismantle = true
-- Melee Trinkets

description = trs("t_d_box")
trinket = GM:AddTrinket(trs("t_box"), "boxingtraining", false, mveles, mweles, nil, description, nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_UNARMED_SWING_DELAY_MUL, -0.25)
GM:AddSkillFunction(trinket, function(pl, active) pl.BoxingTraining = active end)

trinket, trinketwep = GM:AddTrinket(trs("t_momentsup"), "momentumsupsysii", false, mveles, mweles, 2, trs("t_d_momentsup"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_KNOCKBACK_MUL, 0.10)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(trs("t_momentsupi"), "momentumsupsysiii", false, mveles, mweles, 3, trs("t_d_momentsupi"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.13)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_KNOCKBACK_MUL, 0.12)

trinket, trinketwep = GM:AddTrinket(trs("t_hemoad"), "hemoadrenali", false, mveles, mweles, 1, trs("t_d_hemoad_d1"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.03)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.02)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_hemoad").." +1", "hemoadrenali_q1", false, mveles, mweles, 1, trs("t_d_hemoad_d2"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.07)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_hemoad").." +2", "hemoadrenali_q2", false, mveles, mweles, 2, trs("t_d_hemoad_d3"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.12)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_hemoad").." +3", "hemoadrenali_q3", false, mveles, mweles, 3, trs("t_d_hemoad_d4"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.16)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.07)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_hemoad").." +4", "hemoadrenali_q4", false, mveles, mweles, 5, trs("t_d_hemoad_d5"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.05)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, 20)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_hemoad").." +5", "hemoadrenali_q5", false, mveles, mweles, 7, trs("t_d_hemoad_d6"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.25)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, 40)




trinket = GM:AddTrinket(trs("t_damager"), "damage222", false, mveles, mweles, 3, trs("t_d_damager"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, 0.90)

trinket = GM:AddTrinket(trs("t_termia"), "flashlo", false, mveles, mweles, 3, trs("t_d_termia"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, 55)


trinket = GM:AddTrinket(trs("t_athermia"), "sharpkt", false, mveles, mweles, 4, trs("t_d_athermia"), nil, nil, "weapon_zs_melee_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_MOVEMENTSPEED_ON_KILL, -280)

GM:AddSkillModifier(GM:AddTrinket(trs("t_gaunt"), "powergauntlet", false, mveles, mweles, 3, trs("t_d_gaunt"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_POWERATTACK_MUL, 0.45)

GM:AddSkillModifier(GM:AddTrinket(trs("t_fkit"), "sharpkit", false, mveles, mweles, 2, trs("t_d_fkit"), nil, nil, "weapon_zs_melee_trinket"), SKILLMOD_MELEE_DAMAGE_MUL, 0.05)


GM:AddTrinket(trs("t_skit"), "sharpstone", false, mveles, mweles, 3, trs("t_d_skit"), nil, nil, "weapon_zs_melee_trinket")
local cursesoul = { ["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(139,0,255,150), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(139,0,255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(139,0,255, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }}
--curses
trinket, trinketwep = GM:AddTrinket(trs("t_curse_dropping"), "curse_dropping", false, nil, cursesoul, 3, trs("t_d_curse_dropping"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_hurt_curse"), "hurt_curse", false, nil,cursesoul, 3,trs("t_d_hurt_curse"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_uncurse"), "un_curse", false, nil,cursesoul, 3, trs("t_d_uncurse"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_CURSEM, -0.70)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_faster"), "curse_faster", false, nil,cursesoul, 3, trs("t_d_curse_faster"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_slow"), "curse_slow", false, nil, cursesoul, 3, trs("t_d_curse_slow"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -80)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_heart"), "curse_heart", false, nil, cursesoul, 3, trs("t_d_curse_heart"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -80)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_fragility"), "curse_fragility", false, nil, cursesoul, 3, trs("t_d_curse_fragility"), nil, nil, "weapon_zs_cursed")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.50)
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_ponos"), "curse_ponos", false, nil, cursesoul, 3, trs("t_d_curse_ponos"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_un"), "curse_unknown", false, nil, cursesoul, 3, trs("t_d_curse_un"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_point"), "curse_point", false, nil, cursesoul, 3, trs("t_d_curse_point"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true 
trinketwep.Stackable = true
trinket, trinketwep = GM:AddTrinket(trs("t_curse_ancient"), "curse_eye", false, nil, cursesoul, 3, trs("t_d_curse_ancient"), nil, nil, "weapon_zs_cursed")
trinketwep.PermitDismantle = true

--perfomance
GM:AddSkillModifier(GM:AddTrinket( trs("t_adrenaline"), "adrenaline", false, pveles, pweles, nil, trs("t_d_adrenaline"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_JUMPPOWER_MUL, 0.01)
GM:AddSkillModifier(GM:AddTrinket( trs("t_ass"), "ass", false, pveles, pweles, nil,  trs("t_d_ass"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_HEALTH, 6)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, 0.02)
trinket = GM:AddTrinket(trs("t_sarmband"), "supraband", false, pveles, pweles, 1, trs("t_d_sarmband"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.04)
trinket = GM:AddTrinket("Engineer Gaming", "engineer", false, pveles, pweles, 1, trs("t_d_egaming"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, 0.12)
trinket = GM:AddTrinket("Scout Gaming", "scout", false, pveles, pweles, 2, trs("t_d_sgaming"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 10)
trinket = GM:AddTrinket(trs("t_bhammer"), "brokenhammer", false, pveles, pweles, 3, trs("t_d_bhammer"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL,  0.10)

trinket = GM:AddTrinket(trs("t_flower"), "flower", false, pveles, pweles, 3, trs("t_d_flower"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.4)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.5)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.5)


trinket = GM:AddTrinket(trs("t_flower_g"), "flower_g", false, pveles, pweles, 3, trs("t_d_flower_g"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 1.25)

-- Special Trinkets
GM:AddTrinket(trs("t_otank"), "oxygentank", true, nil, {
	["base"] = { type = "Model", model = "models/props_c17/canister01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 3, -1), angle = Angle(180, 0, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, nil, trs("t_d_otank"), "oxygentank", nil, nil, "weapon_zs_special_trinket")

GM:AddSkillModifier(GM:AddTrinket(trs("t_aframe"), "acrobatframe", false, pveles, pweles, nil, trs("t_d_aframe"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_JUMPPOWER_MUL, 0.08)

trinket = GM:AddTrinket(trs("t_nightglass"), "nightvision", true, pveles, pweles, 2, trs("t_d_nightglass"), nil, nil, "weapon_zs_special_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_DIMVISION_EFF_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_FRIGHT_DURATION_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_VISION_ALTER_DURATION_MUL, -0.2)
GM:AddSkillFunction(trinket, function(pl, active)
	if CLIENT and pl == MySelf and GAMEMODE.m_NightVision and not active then
		surface.PlaySound("items/nvg_off.wav")
		GAMEMODE.m_NightVision = false
	end
end)
trinket = GM:AddTrinket(trs("t_godmirror"), "mirror_of_god", nil, pveles, pweles, 2, trs("t_d_godmirror"), nil, nil, "weapon_zs_special_trinket_d")
GM:AddSkillFunction(trinket, function(pl, active)
	if SERVER then
		if active and !(pl.Clonehehe and pl.Clonehehe:IsValid()) then
			local clone = ents.Create('projectile_succubus_full')
			clone:Spawn()
			clone:SetOwner(pl)
			clone.Weapon = "weapon_zs_peashooter"
			pl.Clonehehe = clone
			pl:AddInventoryItem('cons_recall')
		elseif !active then
			if pl.Clonehehe and pl.Clonehehe:IsValid() then
				pl.Clonehehe:Remove()
				pl:TakeInventoryItem('cons_recall')
			end
		end
	end
end)

trinket = GM:AddTrinket(trs("t_whole"), "portablehole", false, pveles, pweles, nil, trs("t_d_whole"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYSPEED_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.03)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.01)

trinket, trinketwep = GM:AddTrinket(trs("t_driller"), "driller", false, pveles, pweles, 2, trs("t_d_driller"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.1)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_driller").."+1", "driller_q1", false, pveles, pweles, 2, trs("t_d_driller_2"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.17)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_driller").."+2", "driller_q2", false, pveles, pweles, 2, trs("t_d_driller_3"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.25)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_driller").."+3", "driller_q3", false, pveles, pweles, 2, trs("t_d_driller_4"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.45)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_driller").."+4", "driller_q4", false, pveles, pweles, 2, trs("t_d_driller_5"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.6)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_driller").."+5", "driller_q5", false, pveles, pweles, 2, trs("t_d_driller_6"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_DRILL_POWER_BARREL, 0.7)


trinket = GM:AddTrinket(trs("t_agility"), "pathfinder", false, pveles, pweles, 2, trs("t_d_agility"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.55)
GM:AddSkillModifier(trinket, SKILLMOD_SIGIL_TELEPORT_MUL, -0.45)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.1)

trinket = GM:AddTrinket(trs("t_galvanka"), "analgestic", false, pveles, pweles, 3, trs("t_d_galvanka"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_SLOW_EFF_TAKEN_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.20)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYSPEED_MUL, 0.25)
trinket = GM:AddTrinket(trs("t_invalid"), "invalid", false, pveles, pweles, 3, trs("t_d_invalid"), nil, nil, "weapon_zs_craftables")
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, -0.5)


GM:AddSkillModifier(GM:AddTrinket(trs("t_ammovesti"), "ammovestii", false, ammoveles, ammoweles, 2, trs("t_d_ammovesti"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.07)
GM:AddSkillModifier(GM:AddTrinket(trs("t_ammovestii"), "ammovestiii", false, ammoveles, ammoweles, 4, trs("t_d_ammovestii"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.11)
GM:AddSkillModifier(GM:AddTrinket(trs("t_ammovestiiii"), "sammovest", false, ammoveles, ammoweles, 4, trs("t_d_ammovestinf"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.16)
GM:AddSkillModifier(GM:AddTrinket(trs("t_ammovestiii"), "classix", false, book, bookw, 4,trs("t_d_ammovestinf"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_RELOADSPEED_MUL, 0.16)

GM:AddTrinket(trs("t_autor"), "autoreload", false, ammoveles, ammoweles, 2, trs("t_d_autor"), nil, nil, "weapon_zs_shot_trinket")
GM:AddTrinket(trs("t_gg_nomi"), "gg_nomi", false, ammoveles, ammoweles, 4, trs("t_d_gg_nomi"), nil, nil, "weapon_zs_shot_trinket")

-- Offensive Implants
trinket, trinketwep = GM:AddTrinket(trs("t_targeti"), "targetingvisori", false, oveles, oweles, 2, trs("t_d_targeti"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.06)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_targeti").."+1", "targetingvisori_q1", false, oveles, oweles, 2, trs("t_d_targetii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.15)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_targeti").."+2", "targetingvisori_q2", false, oveles, oweles, 2, trs("t_d_targetq2"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.2)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_targeti").."+3", "targetingvisori_q3", false, oveles, oweles, 2, trs("t_d_targetq3"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.3)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_targeti").."+4", "targetingvisori_q4", false, oveles, oweles, 2, trs("t_d_targetq4"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.35)
GM:AddSkillModifier(trinket, SKILLMOD_HEADSHOT_MUL, 0.15)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_targeti").."+5", "targetingvisori_q5", false, oveles, oweles, 4, trs("t_d_targetq5"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.4)
GM:AddSkillModifier(trinket, SKILLMOD_AIM_SHAKE_MUL, -0.22)
GM:AddSkillModifier(trinket, SKILLMOD_HEADSHOT_MUL, 0.25)
GM:AddSkillFunction(trinket, function(pl, active) pl.TargetLocus = active end)


GM:AddTrinket(trs("t_targetiii"), "refinedsub", false, oveles, oweles, 4, trs("t_d_targetiii"), nil, nil, "weapon_zs_shot_trinket")


GM:AddSkillModifier(GM:AddTrinket(trs("t_pulsebooster"), "pulseampi", false, oveles, oweles, nil, trs("t_d_pulsebooster"), nil, nil, "weapon_zs_shot_trinket"), SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.14)

trinket = GM:AddTrinket(trs("t_pulseboosteri"), "pulseampii", false, oveles, oweles, 3, trs("t_d_pulseboosteri"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.22)

trinket = GM:AddTrinket(trs("t_pboom"), "resonance", false, oveles, oweles, 4, trs("t_d_pboom"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, -0.11)

trinket = GM:AddTrinket(trs("t_cryoinductor"), "cryoindu", false, oveles, oweles, 4, trs("t_d_cryoinductor"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(trs("t_extendedmag"), "extendedmag", false, oveles, oweles, 3, trs("t_d_extendedmag"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(trs("t_pulseboosterii"), "pulseimpedance", false, oveles, oweles, 5, trs("t_d_pulseboosterii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillFunction(trinket, function(pl, active) pl.PulseImpedance = active end)
GM:AddSkillModifier(trinket, SKILLMOD_PULSE_WEAPON_SLOW_MUL, 0.24)

trinket = GM:AddTrinket(trs("t_crabstompers"), "curbstompers", false, oveles, oweles, 2, trs("t_d_crabstompers"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, -0.25)

GM:AddTrinket(trs("t_abbiuld"), "supasm", false, oveles, oweles, 5, trs("t_d_abbiuld"), nil, nil, "weapon_zs_shot_trinket")

trinket = GM:AddTrinket(trs("t_olymp"), "olympianframe", false, oveles, oweles, 2, trs("t_d_olymp"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 3)
GM:AddSkillModifier(trinket, SKILLMOD_PROP_CARRY_SLOW_MUL, -0.25)
GM:AddSkillModifier(trinket, SKILLMOD_WEAPON_WEIGHT_SLOW_MUL, -0.35)


-- Defensive Trinkets
trinket, trinketwep = GM:AddTrinket(trs("t_defender"), "kevlar", false, develes, deweles, 2, trs("t_d_defender"), nil, nil, "weapon_zs_defence_trinket_d")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.01)
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(trs("t_defenderi"), "barbedarmor", false, develes, deweles, 3, trs("t_d_defenderi"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, 11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.04)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 3)

trinket = GM:AddTrinket(trs("t_antitoxin"), "antitoxinpack", false, develes, deweles, 2, trs("t_d_antitoxin"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.17)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_SPEED_MUL, -0.4)

trinket = GM:AddTrinket(trs("t_hemostatis"), "hemostasis", false, develes, deweles, 2, trs("t_d_hemostatis"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_SPEED_MUL, -0.6)

trinket = GM:AddTrinket(trs("t_defenderii"), "eodvest", false, develes, deweles, 4, trs("t_d_defenderii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.35)
GM:AddSkillModifier(trinket, SKILLMOD_FIRE_DAMAGE_TAKEN_MUL, -0.50)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.13)

trinket = GM:AddTrinket(trs("t_ffframe"), "featherfallframe", false, develes, deweles, 3, trs("t_d_ffframe"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_DAMAGE_MUL, -0.65)
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_THRESHOLD_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_FALLDAMAGE_SLOWDOWN_MUL, -0.75)

trinket = GM:AddTrinket(trs("t_fire_ind"), "fire_ind", false, develes, deweles, 3, trs("t_d_fire_ind"), nil, nil, "weapon_zs_special_trinket")


trinketwep.PermitDismantle = true

local eicev = {
	["base"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.339, 2.697, -2.309), angle = Angle(4.558, -34.502, -72.395), size = Vector(0.5, 0.5, 0.5), color = Color(0, 137, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

local eicew = {
	["base"] = { type = "Model", model = "models/gibs/glass_shard04.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.556, 2.519, -1.468), angle = Angle(0, -5.844, -75.974), size = Vector(0.5, 0.5, 0.5), color = Color(0, 137, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}
local shield = {
[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
						[1] = {
							["children"] = {
							},
							["self"] = {
								["DrawOrder"] = 0,
								["UniqueID"] = "27c539367fcda1046dd5e5ab8b613aa757b6ccc6b8c4b83e7b50ca28b2cd885c",
								["TargetEntityUID"] = "",
								["AimPartName"] = "",
								["Bone"] = "head",
								["BlendMode"] = "",
								["Position"] = Vector(0, 0, 25),
								["AimPartUID"] = "",
								["NoTextureFiltering"] = false,
								["Hide"] = false,
								["Name"] = "",
								["Translucent"] = false,
								["IgnoreZ"] = false,
								["Angles"] = Angle(-90, 0, 0),
								["AngleOffset"] = Angle(0, 0, 0),
								["PositionOffset"] = Vector(0, 0, 0),
								["IsDisturbing"] = false,
								["ClassName"] = "clip2",
								["EyeAngles"] = false,
								["EditorExpand"] = false,
							},
						},
					},
					["self"] = {
						["Skin"] = 0,
						["UniqueID"] = "9a87528647432f7db67534b9c4f42a25e99e700e509014c283fee91ba2ff0a49",
						["NoLighting"] = false,
						["AimPartName"] = "",
						["IgnoreZ"] = false,
						["AimPartUID"] = "",
						["Materials"] = "",
						["Name"] = "",
						["LevelOfDetail"] = 0,
						["NoTextureFiltering"] = false,
						["PositionOffset"] = Vector(0, 0, 0),
						["IsDisturbing"] = false,
						["EyeAngles"] = false,
						["DrawOrder"] = 0,
						["TargetEntityUID"] = "",
						["Alpha"] = 1,
						["Material"] = "",
						["Invert"] = false,
						["ForceObjUrl"] = false,
						["Bone"] = "head",
						["Angles"] = Angle(0, 0, 0),
						["AngleOffset"] = Angle(0, 0, 0),
						["BoneMerge"] = false,
						["Color"] = Vector(1, 1, 1),
						["Position"] = Vector(2.4000000953674, 0, -20),
						["ClassName"] = "model2",
						["Brightness"] = 1,
						["Hide"] = false,
						["NoCulling"] = false,
						["Scale"] = Vector(1, 1, 1),
						["LegacyTransform"] = false,
						["EditorExpand"] = true,
						["Size"] = 0.45,
						["ModelModifiers"] = "",
						["Translucent"] = false,
						["BlendMode"] = "",
						["EyeTargetUID"] = "",
						["Model"] = "models/props_c17/signpole001.mdl",
					},
				},
			},
			["self"] = {
				["Skin"] = 1,
				["UniqueID"] = "9bb1f6f49a243ffcef55e1a978995896a8bd62ce038dd3c1f3e3e6ad4d4fb258",
				["NoLighting"] = false,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Materials"] = "",
				["Name"] = "",
				["LevelOfDetail"] = 0,
				["NoTextureFiltering"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["EyeAngles"] = false,
				["DrawOrder"] = 0,
				["TargetEntityUID"] = "",
				["Alpha"] = 1,
				["Material"] = "",
				["Invert"] = false,
				["ForceObjUrl"] = false,
				["Bone"] = "spine 2",
				["Angles"] = Angle(0, -90, -90),
				["AngleOffset"] = Angle(0, 0, 0),
				["BoneMerge"] = false,
				["Color"] = Vector(1, 1, 1),
				["Position"] = Vector(0, -2.4000000953674, 0),
				["ClassName"] = "model2",
				["Brightness"] = 1,
				["Hide"] = false,
				["NoCulling"] = false,
				["Scale"] = Vector(1, 1, 1.1000000238419),
				["LegacyTransform"] = false,
				["EditorExpand"] = true,
				["Size"] = 0.25,
				["ModelModifiers"] = "skin=1;",
				["Translucent"] = false,
				["BlendMode"] = "",
				["EyeTargetUID"] = "",
				["Model"] = "models/props_c17/oildrum001.mdl",
			},
		},
		[2] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["DrawOrder"] = 0,
						["UniqueID"] = "cb8769a9041b1c1e0bfd0e71a753d6c250c65367c933fface4913ef821220893",
						["Axis"] = "",
						["Input"] = "time",
						["TargetPartUID"] = "",
						["InputMultiplier"] = 1,
						["RootOwner"] = false,
						["TargetEntityUID"] = "",
						["ZeroEyePitch"] = false,
						["ClassName"] = "proxy",
						["ResetVelocitiesOnHide"] = true,
						["VelocityRoughness"] = 10,
						["Max"] = 10,
						["Pow"] = 1,
						["EditorExpand"] = false,
						["AffectChildren"] = false,
						["Min"] = 2,
						["Hide"] = false,
						["Name"] = "",
						["VariableName"] = "Brightness",
						["Offset"] = 0,
						["PlayerAngles"] = false,
						["Additive"] = false,
						["InputDivider"] = 1,
						["IsDisturbing"] = false,
						["OutputTargetPartUID"] = "",
						["Function"] = "sin",
						["Expression"] = "",
					},
				},
			},
			["self"] = {
				["Skin"] = 0,
				["UniqueID"] = "9fe4a8756276e4196a7b5045ccb086c98a7f259cb1d52f0d9b0731e3a6fd1157",
				["NoLighting"] = true,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Materials"] = "",
				["Name"] = "",
				["LevelOfDetail"] = 0,
				["NoTextureFiltering"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["EyeAngles"] = false,
				["DrawOrder"] = 0,
				["TargetEntityUID"] = "",
				["Alpha"] = 0.5,
				["Material"] = "phoenix_storms/gear",
				["Invert"] = false,
				["ForceObjUrl"] = false,
				["Bone"] = "chest",
				["Angles"] = Angle(0, 90, 0),
				["AngleOffset"] = Angle(0, 0, 0),
				["BoneMerge"] = false,
				["Color"] = Vector(0, 0.75, 1),
				["Position"] = Vector(-2, 0, -4.6999998092651),
				["ClassName"] = "model2",
				["Brightness"] = 6.0318553352169,
				["Hide"] = false,
				["NoCulling"] = false,
				["Scale"] = Vector(2, 2, 4.0999999046326),
				["LegacyTransform"] = false,
				["EditorExpand"] = true,
				["Size"] = 1.05,
				["ModelModifiers"] = "",
				["Translucent"] = true,
				["BlendMode"] = "",
				["EyeTargetUID"] = "",
				["Model"] = "models/pac/default.mdl",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "fac50a0ad260b8caa8cd5fa308a13bd2e41e45d2996d038a18ce7e5e1604f0e1",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "33333",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
},}
GM:AddTrinket(trs("t_iceshield"), "iceburst", false, eicev, eicew, nil, trs("t_d_iceshield"), nil, nil, "weapon_zs_special_trinket", shield)

GM:AddSkillModifier(GM:AddTrinket(trs("t_fdfe"), "forcedamp", false, develes, deweles, 2,trs("t_d_fdfe"), nil, nil, "weapon_zs_special_trinket"), SKILLMOD_PHYSICS_DAMAGE_TAKEN_MUL, -0.33)

GM:AddSkillFunction(GM:AddTrinket(trs("t_necro"), "necrosense", false, develes, deweles, 2, trs("t_d_necro"), nil, nil, "weapon_zs_special_trinket"), function(pl, active) pl:SetDTBool(DT_PLAYER_BOOL_NECRO, active) end)

trinket, trinketwep = GM:AddTrinket(trs("t_reactf"), "reactiveflasher", false, develes, deweles, 2, trs("t_d_reactf"), nil, nil, "weapon_zs_special_trinket_d")
trinketwep.PermitDismantle = true

trinket = GM:AddTrinket(trs("t_defenderiii"), "composite", false, develes, deweles, 4, trs("t_d_defenderiii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.16)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, -0.07)

trinket, trinketwep = GM:AddTrinket(trs("t_ttimes"), "ttimes", false, develes, deweles, 5, trs("t_d_ttimes"), nil, nil, "weapon_zs_defence_trinket")
trinketwep.Upgradable = true
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active  end)
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -1)
trinket, trinketwep = GM:AddTrinket(trs("t_ttimes").."+1", "ttimes_q1", false, develes, deweles, 5, trs("t_d_ttimes_q1"), nil, nil, "weapon_zs_defence_trinket")
trinketwep.Upgradable = true
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -2)
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active   end)
trinket, trinketwep = GM:AddTrinket(trs("t_ttimes").."+2", "ttimes_q2", false, develes, deweles, 5, trs("t_d_ttimes_q2"), nil, nil, "weapon_zs_defence_trinket")
trinketwep.Upgradable = true
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -3)
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active end)
trinket, trinketwep = GM:AddTrinket(trs("t_ttimes").."+3", "ttimes_q3", false, develes, deweles, 5, trs("t_d_ttimes_q3"), nil, nil, "weapon_zs_defence_trinket")
trinketwep.Upgradable = true
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -4)
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active end)
trinket, trinketwep = GM:AddTrinket(trs("t_ttimes").."+4", "ttimes_q4", false, develes, deweles, 5, trs("t_d_ttimes_q4"), nil, nil, "weapon_zs_defence_trinket")
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_dd"
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -5)
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active  end)
trinket, trinketwep = GM:AddTrinket(trs("t_ttimes").."+5", "ttimes_q5", false, develes, deweles, 5, trs("t_d_ttimes_q5"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillFunction(trinket, function(pl, active) pl.TTimesHihi = active   end)
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_TAKEN_N, -6)



trinket = GM:AddTrinket(trs("t_defenderiiii"), "toysite", false, develes, deweles, 4, trs("t_d_defenderiiii"), nil, nil, "weapon_zs_defence_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.06)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_TAKEN_MUL, -0.21)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TO_BLOODARMOR_MUL, 0.05)

-- Support Trinkets
trinket, trinketwep = GM:AddTrinket(trs("t_arspack"), "arsenalpack", false, {
	["base"] = { type = "Model", model = "models/Items/item_item_crate.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, {
	["base"] = { type = "Model", model = "models/Items/item_item_crate.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, 4, trs("t_d_arspack"), "arsenalpack", 3)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(trs("t_ammopack"), "resupplypack", true, nil, {
	["base"] = { type = "Model", model = "models/Items/ammocrate_ar2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, -1), angle = Angle(0, -90, 180), size = Vector(0.35, 0.35, 0.35), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}, 4, trs("t_d_ammopack"), "resupplypack", 3)
trinketwep.PermitDismantle = true

GM:AddTrinket(trs("t_magnet"), "magnet", true, supveles, supweles, nil, trs("t_d_magnet"), "magnet")
GM:AddTrinket(trs("t_smagnet"), "electromagnet", true, supveles, supweles, nil, trs("t_d_smagnet"), "magnet_electro")
local ego = {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["FollowAnglesOnly"] = false,
						["DrawOrder"] = 0,
						["InvertHideMesh"] = false,
						["TargetEntityUID"] = "",
						["AimPartName"] = "",
						["FollowPartUID"] = "",
						["Bone"] = "head",
						["ScaleChildren"] = false,
						["UniqueID"] = "8c1169ef99a6512f3ce54407061c3ec1f439a94fc787099a5368f096d1f5b1e8",
						["MoveChildrenToOrigin"] = false,
						["Position"] = Vector(0, 0, 0),
						["AimPartUID"] = "",
						["Angles"] = Angle(0, 0, 0),
						["Hide"] = false,
						["Name"] = "",
						["Scale"] = Vector(1, 1, 1),
						["EditorExpand"] = false,
						["ClassName"] = "bone3",
						["Size"] = 0,
						["PositionOffset"] = Vector(0, 0, 0),
						["IsDisturbing"] = false,
						["AngleOffset"] = Angle(0, 0, 0),
						["EyeAngles"] = false,
						["HideMesh"] = false,
					},
				},
				[2] = {
					["children"] = {
					},
					["self"] = {
						["FollowAnglesOnly"] = false,
						["DrawOrder"] = 0,
						["InvertHideMesh"] = false,
						["TargetEntityUID"] = "",
						["AimPartName"] = "",
						["FollowPartUID"] = "",
						["Bone"] = "spine 2",
						["ScaleChildren"] = false,
						["UniqueID"] = "cc5a83a70d711cfb9e5e03cd3dde1391344f68aaf244cd4166990bc40dc6617b",
						["MoveChildrenToOrigin"] = false,
						["Position"] = Vector(0, 0, 0),
						["AimPartUID"] = "",
						["Angles"] = Angle(0, 0, 0),
						["Hide"] = false,
						["Name"] = "",
						["Scale"] = Vector(1, 1, 1),
						["EditorExpand"] = false,
						["ClassName"] = "bone3",
						["Size"] = 0.9,
						["PositionOffset"] = Vector(0, 0, 0),
						["IsDisturbing"] = false,
						["AngleOffset"] = Angle(0, 0, 0),
						["EyeAngles"] = false,
						["HideMesh"] = false,
					},
				},
				[3] = {
					["children"] = {
					},
					["self"] = {
						["FollowAnglesOnly"] = false,
						["DrawOrder"] = 0,
						["InvertHideMesh"] = false,
						["TargetEntityUID"] = "",
						["AimPartName"] = "",
						["FollowPartUID"] = "",
						["Bone"] = "spine",
						["ScaleChildren"] = false,
						["UniqueID"] = "45221b39467182f09b0cf2c426c6c3c8556121081d283fcf845f6706770ed058",
						["MoveChildrenToOrigin"] = false,
						["Position"] = Vector(0, 0, 0),
						["AimPartUID"] = "",
						["Angles"] = Angle(0, 0, 0),
						["Hide"] = false,
						["Name"] = "",
						["Scale"] = Vector(1, 1, 1),
						["EditorExpand"] = false,
						["ClassName"] = "bone3",
						["Size"] = 0.925,
						["PositionOffset"] = Vector(0, 0, 0),
						["IsDisturbing"] = false,
						["AngleOffset"] = Angle(0, 0, 0),
						["EyeAngles"] = false,
						["HideMesh"] = false,
					},
				},
			},
			["self"] = {
				["Skin"] = 0,
				["UniqueID"] = "8451e19aed0489f61d1199a49702f424540c2238d608d7238307a58450190214",
				["NoLighting"] = false,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Materials"] = "",
				["Name"] = "",
				["LevelOfDetail"] = 0,
				["NoTextureFiltering"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["EyeAngles"] = false,
				["DrawOrder"] = 0,
				["TargetEntityUID"] = "",
				["Alpha"] = 1,
				["Material"] = "phoenix_storms/gear",
				["Invert"] = false,
				["ForceObjUrl"] = false,
				["Bone"] = "head",
				["Angles"] = Angle(0, 0, 0),
				["AngleOffset"] = Angle(0, 0, 0),
				["BoneMerge"] = true,
				["Color"] = Vector(1, 1, 1),
				["Position"] = Vector(0, 0, 0),
				["ClassName"] = "model2",
				["Brightness"] = 1,
				["Hide"] = false,
				["NoCulling"] = false,
				["Scale"] = Vector(1, 1, 1),
				["LegacyTransform"] = false,
				["EditorExpand"] = true,
				["Size"] = 1.375,
				["ModelModifiers"] = "",
				["Translucent"] = false,
				["BlendMode"] = "",
				["EyeTargetUID"] = "",
				["Model"] = "models/player/soldier_stripped.mdl",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "fac50a0ad260b8caa8cd5fa308a13bd2e41e45d2996d038a18ce7e5e1604f0e1",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "adsgryfghfhhg",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
},
}
trinket, trinketwep = GM:AddTrinket(trs("t_exoskelet"), "loadingex", false, supveles, supweles, 2, trs("t_d_exoskelet"), nil, nil, "weapon_zs_help_trinket", ego)
GM:AddSkillModifier(trinket, SKILLMOD_PROP_CARRY_SLOW_MUL, -0.55)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_PACKTIME_MUL, -0.2)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS, 2)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket(trs("t_blueprints"), "blueprintsi", false, supveles, supweles, 2, trs("t_d_blueprints"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL, 0.10)
trinketwep.PermitDismantle = true

GM:AddSkillModifier(GM:AddTrinket(trs("t_ablueprints"), "blueprintsii", false, supveles, supweles, 4, trs("t_d_ablueprints"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_REPAIRRATE_MUL, 0.20)

trinket, trinketwep = GM:AddTrinket(trs("t_medi"), "processor", false, supveles, supweles, 2, trs("t_d_medi"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.02)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.09)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_medi").."+1", "processor_q1", false, supveles, supweles, 2, trs("t_d_medi_q1"), nil, nil, "weapon_zs_help_trinket")
trinketwep.Upgradable = true
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.12)
trinket, trinketwep = GM:AddTrinket(trs("t_medi").."+2", "processor_q2", false, supveles, supweles, 2, trs("t_d_medi_q2"), nil, nil, "weapon_zs_help_trinket")
trinketwep.Upgradable = true
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.22)
trinket, trinketwep = GM:AddTrinket(trs("t_medi").."+3", "processor_q3", false, supveles, supweles, 2, trs("t_d_medi_q3"), nil, nil, "weapon_zs_help_trinket")
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_health"
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.09)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.30)
trinket, trinketwep = GM:AddTrinket(trs("t_medi").."+4", "processor_q4", false, supveles, supweles, 2, trs("t_d_medi_q4"), nil, nil, "weapon_zs_help_trinket")
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_dd"
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.43)
trinket, trinketwep = GM:AddTrinket(trs("t_medi").."+5", "processor_q5", false, supveles, supweles, 2, trs("t_d_medi_q5"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_MEDGUN_FIRE_DELAY_MUL, -0.55)


trinket, trinketwep = GM:AddTrinket(trs("t_remedy"), "remedy", false, supveles, supweles, 2, trs("t_d_remedy"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.05)
trinketwep.Upgradable = true
trinket, trinketwep = GM:AddTrinket(trs("t_remedy").."+1", "remedy_q1", false, supveles, supweles, 3, trs("t_d_remedy_q1"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.11)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_health"
trinket, trinketwep =GM:AddTrinket(trs("t_remedy_q2").."+2", "remedy_q2", false, supveles, supweles, 4, trs("t_d_remedy_q2"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.25)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_alt_h"
trinket, trinketwep =GM:AddTrinket(trs("t_remedy_q3_5").."+3", "remedy_q3", false, supveles, supweles, 4, trs("t_d_remedy_q3"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.28)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_alt_h"
trinket, trinketwep = GM:AddTrinket(trs("t_remedy_q3_5").."+4", "remedy_q4", false, supveles, supweles, 4, trs("t_d_remedy_q4"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.38)
GM:AddSkillFunction(trinket, function(pl, active)
	pl.RemedyRegen = active
end)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_alt_h"
trinket, trinketwep = GM:AddTrinket(trs("t_remedy_q3_5").."+5", "remedy_q5", false, supveles, supweles, 5, trs("t_d_remedy_q5"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.45)
GM:AddSkillFunction(trinket, function(pl, active)
	pl.RemedyRegen = active
end)

trinket, trinketwep = GM:AddTrinket(trs("t_useself"), "useself", false, supveles, supweles, 3, trs("t_d_useself"), nil, nil, "ammo_nail")



trinket,trinketwep = GM:AddTrinket(trs("t_sale"), "salevoy", false, pveles, pweles, 2, trs("t_d_sale"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.03)
trinketwep.Upgradable = true
trinket,trinketwep = GM:AddTrinket(trs("t_sale").."+1", "salevoy_q1", false, pveles, pweles, 2, trs("t_d_sale_q1"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.07)
trinketwep.Upgradable = true
trinket,trinketwep = GM:AddTrinket(trs("t_sale").."+2", "salevoy_q2", false, pveles, pweles, 2, trs("t_d_sale_q2"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.12)
trinketwep.Upgradable = true
trinket,trinketwep = GM:AddTrinket(trs("t_sale").."+3", "salevoy_q3", false, pveles, pweles, 2, trs("t_d_sale_q3"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.18)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "trinket_greedsoul"
trinket,trinketwep = GM:AddTrinket(trs("t_sale").."+4", "salevoy_q4", false, pveles, pweles, 2, trs("t_d_sale_q4"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.22)
trinketwep.Upgradable = true
trinketwep.NeedForUpgrade = "comp_soul_dosei"
trinket = GM:AddTrinket(trs("t_sale").."+5", "salevoy_q5", false, pveles, pweles, 2, trs("t_d_sale_q5"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.3)





trinket = GM:AddTrinket(trs("t_deploi"), "mainsuite", false, supveles, supweles, 2, trs("t_d_deploi"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_DELAY_MUL, -0.07)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_RANGE_MUL, 0.1)

trinket = GM:AddTrinket(trs("t_deploii"), "controlplat", false, supveles, supweles, 2, trs("t_d_deploii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_HEALTH_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_CONTROLLABLE_SPEED_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.50)

trinket = GM:AddTrinket(trs("t_proji"), "projguide", false, supveles, supweles, 2, trs("t_d_proji"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PROJ_SPEED, 1.6)

trinket = GM:AddTrinket(trs("t_projii"), "projwei", false, supveles, supweles, 2, trs("t_d_projii"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_PROJ_SPEED, -0.5)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.2)

local ectov = {
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.381, 2.617, 2.062), angle = Angle(180, 12.243, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = Color(0, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

local ectow = {
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.506, 1.82, 1.758), angle = Angle(-164.991, 19.691, 8.255), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = Color(0, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}

trinket = GM:AddTrinket(trs("t_chemicals"), "reachem", false, ectov, ectow, 3, trs("t_d_chemicals"), nil, nil, "weapon_zs_shot_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_MUL, 0.4)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.3)


trinket = GM:AddTrinket(trs("t_deploiii"), "opsmatrix", false, supveles, supweles, 4, trs("t_d_deploiii"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_DELAY_MUL, -0.13)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_RANGE_MUL, 0.85)
trinket = GM:AddTrinket(trs("t_hateme"), "hateome", false, supveles, supweles, 4, trs("t_d_hateme"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, -0.4)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 1.8)
-- Super Trinkets
trinket = GM:AddTrinket(trs("t_smanifest"), "sman", false, supveles, supweles, 5, trs("t_d_smanifest"))
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.16)
trinket = GM:AddTrinket(trs("t_protutor"), "stutor", false, book, bookw, 5, trs("t_d_protutor"))
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.10)
trinket = GM:AddTrinket(trs("t_gstore"), "gstore", false, supveles, supweles, 5, trs("t_d_gstore"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.15)
trinket = GM:AddTrinket(trs("t_fblueprints"), "futureblu", false, supveles, supweles, 5, trs("t_d_fblueprints"))
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL, 0.30)
trinket = GM:AddTrinket(trs("t_kbook"), "knowbook", false, book, bookw, 5, trs("t_d_kbook"))
GM:AddSkillModifier(trinket,  SKILLMOD_RESUPPLY_DELAY_MUL, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
trinket = GM:AddTrinket(trs("t_bloodlust"), "bloodlust", false, book, bookw, 5, trs("t_d_bloodlust"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_POWERATTACK_MUL, 0.50)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -10)
trinket = GM:AddTrinket(trs("t_adbat"), "adbat", false, supveles, supweles, 5, trs("t_d_adbat"))
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_PULSE_MUL, 0.33)
trinket = GM:AddTrinket(trs("t_mecharm"), "marm", false, supveles, supweles, 5, trs("t_d_mecharm"))
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.22)
local sshield = {[1] = {
	["children"] = {
		[1] = {
			["children"] = {
				[1] = {
					["children"] = {
					},
					["self"] = {
						["Skin"] = 0,
						["UniqueID"] = "62f09606e93a91ba4c42b4f77cfe4c0458874690b0103bd13e71fb2e47dea9f9",
						["NoLighting"] = false,
						["AimPartName"] = "",
						["IgnoreZ"] = false,
						["AimPartUID"] = "",
						["Materials"] = "",
						["Name"] = "cube025x025x025",
						["LevelOfDetail"] = 0,
						["NoTextureFiltering"] = false,
						["PositionOffset"] = Vector(1.5, 0, 0),
						["IsDisturbing"] = false,
						["EyeAngles"] = false,
						["DrawOrder"] = 0,
						["TargetEntityUID"] = "",
						["Alpha"] = 1,
						["Material"] = "models/debug/debugwhite",
						["Invert"] = false,
						["ForceObjUrl"] = false,
						["Bone"] = "head",
						["Angles"] = Angle(0, 0, 0),
						["AngleOffset"] = Angle(0, 0, 0),
						["BoneMerge"] = false,
						["Color"] = Vector(1, 1, 0),
						["Position"] = Vector(0, 0.80000001192093, 0.12999999523163),
						["ClassName"] = "model2",
						["Brightness"] = 0.6,
						["Hide"] = false,
						["NoCulling"] = false,
						["Scale"] = Vector(10.39999961853, 0.20000000298023, 0.80000001192093),
						["LegacyTransform"] = false,
						["EditorExpand"] = false,
						["Size"] = 0.025,
						["ModelModifiers"] = "",
						["Translucent"] = false,
						["BlendMode"] = "",
						["EyeTargetUID"] = "",
						["Model"] = "models/hunter/blocks/cube025x025x025.mdl",
					},
				},
			},
			["self"] = {
				["Skin"] = 0,
				["UniqueID"] = "dd8f0a0dd9a0fde373e4c04a14e0e7bd423e01745e99332ddfd985bdf9b3dacc",
				["NoLighting"] = false,
				["AimPartName"] = "",
				["IgnoreZ"] = false,
				["AimPartUID"] = "",
				["Materials"] = "",
				["Name"] = "",
				["LevelOfDetail"] = 0,
				["NoTextureFiltering"] = false,
				["PositionOffset"] = Vector(0, 0, 0),
				["IsDisturbing"] = false,
				["EyeAngles"] = false,
				["DrawOrder"] = 0,
				["TargetEntityUID"] = "",
				["Alpha"] = 1,
				["Material"] = "",
				["Invert"] = false,
				["ForceObjUrl"] = false,
				["Bone"] = "eyes",
				["Angles"] = Angle(90, 180, 180),
				["AngleOffset"] = Angle(0, 0, 0),
				["BoneMerge"] = false,
				["Color"] = Vector(1, 1, 0),
				["Position"] = Vector(1.1000000238419, 1.5, 0),
				["ClassName"] = "model2",
				["Brightness"] = 3,
				["Hide"] = false,
				["NoCulling"] = false,
				["Scale"] = Vector(0.69999998807907, 0.69999998807907, 3),
				["LegacyTransform"] = false,
				["EditorExpand"] = true,
				["Size"] = 0.025,
				["ModelModifiers"] = "",
				["Translucent"] = false,
				["BlendMode"] = "",
				["EyeTargetUID"] = "",
				["Model"] = "models/props_phx/construct/glass/glass_angle360.mdl",
			},
		},
	},
	["self"] = {
		["DrawOrder"] = 0,
		["UniqueID"] = "fac50a0ad260b8caa8cd5fa308a13bd2e41e45d2996d038a18ce7e5e1604f0e1",
		["Hide"] = false,
		["TargetEntityUID"] = "",
		["EditorExpand"] = true,
		["OwnerName"] = "self",
		["IsDisturbing"] = false,
		["Name"] = "ad213312",
		["Duplicate"] = false,
		["ClassName"] = "group",
	},
},
}
trinket = GM:AddTrinket(trs("t_sshield"), "sshield", false, supveles, supweles, 5, trs("t_d_sshield"), nil,nil,nil, sshield)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.05)
trinket = GM:AddTrinket(trs("t_antibaracat"), "antibaracat", false, supveles, supweles, 5, trs("t_d_antibaracat"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.5)
trinket = GM:AddTrinket(trs("t_auto_magazine"), "ultra_mag", false, book, bookw, 5, trs("t_d_auto_magazine"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.15)
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_MUL, -0.85)
GM:AddSkillModifier(trinket, SKILLMOD_FIRE_DELAY, -0.25)

--Special Trinkets
trinket = GM:AddTrinket(trs("t_nheart"), "nulledher", false, supveles, supweles, 4, trs("t_d_nheart"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 20)
trinket = GM:AddTrinket(trs("t_voidheart"), "voidheart", false, supveles, supweles, 4, trs("t_d_voidheart"))
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.15)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20)
trinket = GM:AddTrinket(trs("t_kheart"), "kheart", false, supveles, supweles, 4, trs("t_d_kheart"))
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -15)
GM:AddSkillModifier(trinket, SKILLMOD_DMG_TAKEN, 0.1)

local sss = SysTime()
local d = math.Round(util.SharedRandom("d1",1,5, sss))
local skill1 =  util.SharedRandom("skill1",-0.2,0.5, sss)
local skill2 =  math.Round(util.SharedRandom("skill3",-30,70, sss))
local skill3 = util.SharedRandom("skill2",-0.32,0.5, sss)
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
--print(skill1.." "..skill2.." "..skill3.." "..d)
end
trinket = GM:AddTrinket(trs("t_cursedtrinket"), "cursedtrinket", false, supveles, supweles, 4, (isnumber(tonumber(skill1)) and skill1* 100 or skill1)..trs(skill1d)..skill2..trs(skill2d)..(isnumber(tonumber(skill3)) and skill3* 100 or skill3)..trs(skill3d)..trs("t_d_cursedtrinket"))
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
trinket = GM:AddTrinket(trs("t_fire_at"), "fire_at", false, supveles, supweles, 2, trs("t_d_fire_at"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.1)
trinket = GM:AddTrinket(trs("t_pulse_at"), "pulse_at", false, supveles, supweles, 2, trs("t_d_pulse_at"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.1)
trinket = GM:AddTrinket(trs("t_acid_at"), "acid_at", false, supveles, supweles, 2, trs("t_d_acid_at"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.1)
trinket = GM:AddTrinket(trs("t_separate_at"), "separate_at", false, supveles, supweles, 2, trs("t_d_separate_at"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.04)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.04)
trinket = GM:AddTrinket(trs("t_ultra_at"), "ultra_at", false, supveles, supweles, 2, trs("t_d_ultra_at"))
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -0.1)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.1)
trinket = GM:AddTrinket(trs("t_cham_at"), "cham_at", false, supveles, supweles, 2, trs("t_d_cham_at"))
trinket = GM:AddTrinket(trs("t_cham_storm"), "cham_storm", false, develes, deweles, 3, trs("t_d_cham_storm"), nil, nil, "weapon_zs_special_trinket")
trinket = GM:AddTrinket(trs("t_clever"), "clever", false, develes, deweles, 5, trs("t_d_clever"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 32)

trinket = GM:AddTrinket(trs("t_hp_up"), "hp_up", false, develes, deweles, 5, trs("t_d_hp_up"), nil, nil, "weapon_zs_special_trinket")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 20)




GM:AddSkillModifier(GM:AddTrinket(trs("t_headshoter"), "headshoter", false, supveles, supweles, 2, trs("t_d_headshoter"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_HEADSHOT_MUL, 0.3)
GM:AddSkillModifier(GM:AddTrinket(trs("t_pearl"), "pearl", false, supveles, supweles, 3, trs("t_d_pearl"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_BUFF_TIME, 0.1)
GM:AddTrinket(trs("t_broken_world"), "broken_world", false, supveles, supweles, 3, trs("t_d_broken_world"), nil, nil, "weapon_zs_help_trinket")
GM:AddTrinket(trs("t_missluck"), "lucky_chance", false, supveles, supweles, 3, trs("t_d_missluck"), nil, nil, "weapon_zs_help_trinket")
GM:AddSkillModifier(GM:AddTrinket(trs("t_ind_buffer"), "ind_buffer", false, {
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.381, 2.617, 2.062), angle = Angle(180, 12.243, 0), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = HSVToColor((CurTime() * 60 + (2 * 5)) % 360, 1, 1), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
},{
	["base"] = { type = "Model", model = "models/props_junk/glassjug01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.506, 1.82, 1.758), angle = Angle(-164.991, 19.691, 8.255), size = Vector(0.6, 0.6, 0.6), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["base+"] = { type = "Model", model = "models/props_c17/oildrum001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(0, 0, 4.07), angle = Angle(180, 12.243, 0), size = Vector(0.123, 0.123, 0.085), color = HSVToColor((CurTime() * 60 + (2 * 5)) % 360, 1, 1), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
} , 2, trs("t_d_ind_buffer"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_ELEMENTAL_MUL, 0.3)
-- ???
GM:AddSkillModifier(GM:AddTrinket(trs("t_manifesti"), "acqmanifest", false, supveles, supweles, 2, trs("t_d_manifesti"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_RESUPPLY_DELAY_MUL, -0.03)
GM:AddSkillModifier(GM:AddTrinket(trs("t_manifestii"), "promanifest", false, supveles, supweles, 4, trs("t_d_manifestii"), nil, nil, "weapon_zs_help_trinket"), SKILLMOD_RESUPPLY_DELAY_MUL, -0.07)

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

GM:AddTrinket("Soul of Judas", "bleaksoul", false, blcorev, blcorew, 3, "Blinds and knocks zombies away when attacked\nRecharges every 15 seconds\nОслепляет и откидывает назад зомби(Которые атаковали вас)\n Перезарядка каждые 15 сек\n Q:2", nil, nil, "weapon_zs_soul")

trinket = GM:AddTrinket("Soul of ???", "spiritess", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "+22% jump height\n+22% К силе прыжка.", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.22)

trinket = GM:AddTrinket("Soul of Erwa", "soulmedical", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 2.3097 }, color = Color(0, 35, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.949, 0.349, 0.349), color = Color(20, 20, 20, 255), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1, "+15% к силе аптечки,-15% к кулдауну аптечки\n+15% Med Effectiveness,-15% Cooldown medkit.\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.15)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.15)
trinket = GM:AddTrinket("True soul of Erwa", "soulrepairman", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 2.3097 }, color = Color(24, 253, 24, 248), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 24, 224), nocull = false, additive = false, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.949, 0.349, 0.349), color = Color(22, 0, 100), surpresslightning = false, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1, "+50%"..trs("repair"), nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL,  0.50)

trinket = GM:AddTrinket("Samson Soul", "samsonsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 5, 11, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3,"Вы наносите на 10% больше урона мили оружием и получаете в 30% раз больше урона от яда и кровотока.\nYou deal to 10% more melee damage and take by 30% more poison and blood damage\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, 0.30)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)

trinket = GM:AddTrinket("Soul of sBluelight", "slight_soul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 204, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(43, 5, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(37, 122, 192), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"-50% Получаемого урона от огня и +25% элементального урона.\n-50% Fire damage taken and +25% Elemental damage\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_ELEMENTAL_MUL, 0.25)
GM:AddSkillModifier(trinket, SKILLMOD_FIRE_DAMAGE_TAKEN_MUL, -0.50)

trinket = GM:AddTrinket("Soul of alt sBluelight", "alt_slight_soul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 204, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(43, 5, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(37, 122, 192), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Еврей забирает на 75% меньше поинтов!\nJew take on 75% less points!\n Q:3", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Eve", "evesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Вы наносите на 22% меньше урона мили оружием но яд и кровотечение наносит на 88% меньше урона.\n-22% melee damage but you take by -88% damage from effects\n Q:2", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.88)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.88)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.22)

trinket = GM:AddTrinket("Soul of Jacob&Jesau", "jacobjesausoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1,"Вы не сможете получать поинты после волны но теперь вы получаете на 10% больше поинтов.\nYou now don't take point's per wave,+10% point multiplier \n Q:5", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS , -9999)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.1)

trinket = GM:AddTrinket("Soul of Isaac", "isaacsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(34, 120, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(115, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Дает всего по немногу,дает 10 хп,перезарядка быстрее на 8%,вы получаете на 4% больше поинтов\n+10 hp,Reload speed by 8%,+4% point multiplier \n Q:2", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.04)

trinket = GM:AddTrinket("Soul of Minos Prime", "soul_lime", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 9.697, y = 9.697 }, color = Color(34, 120, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 20, y = 20 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.449, 0.449, 0.449), color = Color(115, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4,"-50% Получаемого урона от миноса прайма или сисуса и +20% урона когда у вас скин V1\n-50% Damage taken from Minos Prime or Sisus and +20% Damage when you have skin of V1 \n Q:2", nil, nil, "weapon_zs_soul")

trinket = GM:AddTrinket("Soul of Magdalene", "magdalenesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 60, 90, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3,"Дает  30 здоровья и 40 кровавой брони,но вы на 40 единицы медленее\n +30 hp,+40 blood armor,-40 speed \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 30)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -40)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 40)

trinket = GM:AddTrinket("Soul of Lilith", "lilithsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4,"Дает большой бафф к туррелям и дронам с амуницией,аммуниция идет быстрее на 5%\nНа 30% больше хп у всех установок,туррели имеют в 50% больше хп и скорость сканирования на 40% больше\n Give huge buff for turrets and drones\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_HEALTH_MUL, 0.3)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_HEALTH_MUL, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_SCANSPEED_MUL, 0.4)
trinket = GM:AddTrinket("Soul of Eden", "whysoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 20, y = 20 }, color = Color(0, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(11, 20, 110, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5," Дает баффы всех нормальным душ(души досетовцев не считаються) но в меньшем маштабе и дает еще их дебаффы,не копирует душу лоста,лазаря и форготена\ngives a buff of normal souls but worse, debuffs too!(does not include Doset-souls and soul Of lazarus,forgotten and lost) \nQ:Ultimate ", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_DRONE_CARRYMASS_MUL, 0.03)
GM:AddSkillModifier(trinket, SKILLMOD_FIELD_RANGE_MUL, 0.05)
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.04)
GM:AddSkillModifier(trinket, SKILLMOD_DEPLOYABLE_HEALTH_MUL, 0.02)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_HEALTH_MUL, 0.1)
GM:AddSkillModifier(trinket, SKILLMOD_TURRET_SCANSPEED_MUL, 0.09)
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, -10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 17)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 30)
GM:AddSkillModifier(trinket, SKILLMOD_ENDWAVE_POINTS , -25)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.05)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_BLEED_DAMAGE_TAKEN_MUL, -0.11)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.03)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, -0.02)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.13)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.01)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.07)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.06) 
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.07) 
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.01)
trinket = GM:AddTrinket("Blank Soul", "blanksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 211, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 210, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5,"Пустая душа поглощает 5% урона по вам\nblank soul absorb 5% damage to you \n Q:0 ", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_DMG_TAKEN, -0.05)

trinket = GM:AddTrinket(" Soul of Classix", "classixsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(5, 25, 211, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(5, 0, 25, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(155, 110, 15, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Классикс одарил вас силой бомбежки! Перезарядка винтовок на быстрее 56% и лучше точность на 20%\n+56% reload speed for snipers and +20% accuracy\n Q:0"), nil, nil, "weapon_zs_soul"
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_RIFLE_MUL, 0.56)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.20)
trinket = GM:AddTrinket(" Soul of Alt Classix", "classixsoul_a", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(5, 25, 211, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(5, 0, 25, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(155, 110, 15, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Великий покой.Полная опустошенность.+33% К урону кулаков благодаря мастерству.\nFull peace.Absolute hollow.+33% Fists damage.\n Q:0", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_UNARMED_DAMAGE_MUL, 0.33)


trinket = GM:AddTrinket("Soul of Darkness", "darksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(21, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "+20% К радиусу взрыву,+20% К урону от взрыва,-20% урона по себе\n -20% Self-damage,+20% Explosive radius,+20% Explosive Damage\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_TAKEN_MUL, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.2)
trinket = GM:AddTrinket("Soul of Azazel", "eriosoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 165, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "На 10% больше урон от мили!-20 хп и -10 кровавой брони.\n Melee damage multiplier 1.10x! -20 hp -10 blood armor\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -10) 
trinket = GM:AddTrinket("Soul of Appolyon", "aposoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(30, 111, 51, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 105, 20, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Манхаки стали еще лучше! На 30% больше хп и на 20% больше урон.\n Manhack is better,+30% Hp and +20% damage for manhacks\n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.3) 
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.2) 
trinket = GM:AddTrinket("Soul of Bethany", "betsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(120, 200, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5, "Больше никакой кровавой брони(навсегда)...Только обычное хп и хороший хил по ней!Хил по вам в 200% лучше и дает 220 хп,убирает 10 проклятья за каждый полученный  удар\n+220 hp,No more blood armor(PERMA EFFECT)\n+200% Heal received,-10 curse when you get hit\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 220) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -1000) 
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 2) 
trinket = GM:AddTrinket("Soul of Lost", "lostsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 20, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 95), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "Быстрее двигаешься через пропы,но ты получаешь в 90% раза больше урона!Вы быстрее на 30 единиц\nYou move faster through prop,+30 speed,+2 luck\n90% Damage taken mul,+2 luck \nQ:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.90) 
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 30)
trinket = GM:AddTrinket("Soul of Keeper", "greedsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(21, 255, 1, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(120, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Ваша жадность дает 5% скидку и +9% к поинтам\n Sale by 5%,+9% Point Multiplier\n Q:5", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.09)
trinket = GM:AddTrinket("Soul of Cain", "cainsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 155, 9, 55), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(125, 0, 255, 100), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 155), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Ускоряет амуницию на 5% и дает удачу в казино\n-5% Ressuply Delay and give luck in casino\n Q:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.05)
trinket = GM:AddTrinket("Soul of Lazarus", "lazarussoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 0, 195), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(125, 0, 255, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Лазарь защищает вас всей своей душой\nsave you if you have 20% health,gave 100% blood(Heal only with hemostasis)", nil, nil, "weapon_zs_soul")
trinket = GM:AddTrinket("Soul of Forgotten", "forsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "Вы лучше бьете  мили оружием!,но вы не сможете нормально атаковать другим оружием\nBetter melee but you can't use other weapon exlude melee weapon \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 12)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, 40)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, -0.44)

trinket = GM:AddTrinket("Soul of Sussy Stragus", "starsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(9, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Дает 55 скорости отнимая 10% дамага\n +55 speed,-10% Melee damage\n Q:lmao", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.10)

trinket = GM:AddTrinket("Soul of Toy", "toysoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(0, 0, 0, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 0, 0, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(82, 19, 124, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5, "Душа Тоя???Невозможно.Большая уязвимость к баракотам,дает 100 скорости,чинильная станция лучше на 100%,вы не взорветесь!Хотя смысл все объяснять?\n+400% Knockdown time but you very STRONG\n Q:One For All ", nil, nil, "weapon_zs_soul")
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
GM:AddSkillModifier(trinket, SKILLMOD_KNOCKDOWN_RECOVERY_MUL, 40)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 15)
trinket = GM:AddTrinket("Soul of Toyka", "toykasoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(61, 0, 230, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(95, 51, 216, 189), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(82, 19, 124, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5, "Душа бочкобога и дизбалансобога!Минус только один - стрелять запрещено\nSoul of gods of explosive barrels and disbalance god, minus only 1 - Fire is gone\n Q:Disbalance", nil, nil, "weapon_zs_soulalt")
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
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, -55)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT, 60)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_ATTACKER_DMG_REFLECT_PERCENT, 3)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.10)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 15)
trinket = GM:AddTrinket("Soul of Tea", "teasoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(10, 23, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Дает 40 скорости,+15% К силе прыжка\n +40 speed,+15% Jump power\n Q:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 40)
GM:AddSkillModifier(trinket, SKILLMOD_JUMPPOWER_MUL, 0.15)
trinket = GM:AddTrinket("Soul of Sugger", "sugersoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 25), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "+10% К мили урону,-2% получаемого урона\n +10% for melee damage,-2% Damage taken mul\n Q:1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.10)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
trinket = GM:AddTrinket("Soul of N3ll", "nulledsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(90, 90, 90), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 25), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(70, 65, 133, 9), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "+20% К мuли урону,+12% п0лучаемого ур0на,+12% к п0луч1ем0му хиллу,ск3дк1 в 6%\n +20% f0r meleE damAge,+12% Damag3 tak3n mul,+12% Heal rec3ived,s1l3 by 6%\n Q:Ultimate", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.20)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.06)
trinket = GM:AddTrinket("Soul of Alt Null", "nulledsoul_alt", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(90, 90, 90), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(255, 255, 255, 25), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(70, 65, 133, 9), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Нуллу не лень и он эффективно добавляет +7% к урону\n+7% Clear damage\n Q:2", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE_ALL, 0.07)
trinket = GM:AddTrinket("Soul of Shitus", "lampsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(10, 255, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(29, 53, 104), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(226, 226, 19, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "+30% Мили ренжа fdkosfdskffsk лампа\n +30% Melee range\n Q:4", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, 0.30)
trinket = GM:AddTrinket("Soul of botyara(leha)", "lehasoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 7.697, y = 7.697 }, color = Color(255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(3, 26, 75), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(226, 19, 19, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1, "Мидас быстро заражает тринкеты пока не сожрут эту душу!\nMidas very fast corrupt trinkets while have this soul!\n Q:-1", nil, nil, "weapon_zs_soul")

trinket, soul = GM:AddTrinket("Soul of Troy", "troyaksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 1.697, y = 1.697 }, color = Color(94, 94, 94), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(172, 172, 172), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(126, 126, 126, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "-7 удачи,+35% Сила починки, -15% к времени перед следующим удара молотка\n-7 Luck,+35% Repair rate,-25% swing delay with the Carpenter Hammer \n Q:3", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, -7)
GM:AddSkillModifier(trinket, SKILLMOD_REPAIRRATE_MUL, 0.35)
GM:AddSkillModifier(trinket, SKILLMOD_HAMMER_SWING_DELAY_MUL, -0.15)
trinket, soul = GM:AddTrinket("Soul of Alt Troy", "troyaksoul_a", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 1.697, y = 1.697 }, color = Color(94, 94, 94), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(172, 172, 172), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(126, 126, 126, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "Двойной прыжок.\nDouble Jump.\n Q:3", nil, nil, "weapon_zs_soulalt")
trinket, soul = GM:AddTrinket("Soul of Clown", "clownsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 1.697, y = 1.697 }, color = Color(30, 214, 153), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(9, 0, 61), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(83, 165, 50, 150), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Получаемый урон не выше 30\n Max dmg taken = 30\n Q:Pro", nil, nil, "weapon_zs_soul")








--Alt Souls 






trinket = GM:AddTrinket("Soul of Alt Darkness", "altdarksoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(0, 255, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(21, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Бафф к хилу\nBuff to heal\n Q:3", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.3)
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.3)

GM:AddTrinket("Soul of Alter Judas", "altjudassoul", false, blcorev, blcorew, 1, "If health lower than 20% give buffs\nЕсли здоровье ниже 20% то дает баффы\n Q:2", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Alt ???", "altsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 255, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1, "+22% К радиусу взрыва\n+22% Explosion radius.\n Q:-2", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_EXP_DAMAGE_RADIUS, 0.22)

trinket = GM:AddTrinket("Soul of Alt Eden", "soulalteden", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(4, 8, 255, 208), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(165, 39, 39), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(26, 201, 245), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 5, "Chaos never change,give random status every random damage\nХаос никогда не меняется,дает рандомный статус при накоплениее рандомного урона\n Q:D20", nil, nil, "weapon_zs_soulalt")

trinket = GM:AddTrinket("Soul of Alt Tea", "altchayok", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 17.697, y = 17.697 }, color = Color(255, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10, y = 10 }, color = Color(10, 23, 35, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "+10 скорости но под конец волны скорость умножается на кол-во волн\n +10 Speed,on endwave multiple speed on wave count\n Q:1", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 10)


trinket = GM:AddTrinket("Alt Samson Soul", "altsamsonsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 5, 11, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3,"Нанесение или получение урона добавляет вам ярость,мед винтовка понизит вашу ярость.\nDealing or taking damage adds to your rage,Medical rifle removes the RAGE\n Q:3", nil, nil, "weapon_zs_soulalt")


trinket, soul = GM:AddTrinket("Soul of Alt Eve", "altevesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(0, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4,"Удваивает кол-во выстрелов,+34% к задержке выстрелов.\nDouble bullets for ricochets or shoots,+15% fire delay\n Q:4", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_FIRE_DELAY, 0.34)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, 0.50)
GM:AddSkillFunction(trinket, function(pl, active)
	pl.AltEve = active
end)

trinket, soul = GM:AddTrinket("Soul of Jacob", "jacobsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1,"Убирает лимит к регенерации и ускоряет ее когда вы у сигила,а если нет - убирает регенерацию\nNo Limit for regeneration and speed up them when near a sigil.If not - remove regen\n Q:5", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_REGEN_SPEED, 0.5)

trinket, soul = GM:AddTrinket("Soul of Alt Isaac", "altisaacsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(34, 120, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(115, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3,"Забыт\nForgotten\n Q:2", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 10)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.08)
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.04)


trinket, soul = GM:AddTrinket("Soul of Alt Magdalene", "altmagdalenesoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 60, 90, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 5, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 0, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"Дает  200 здоровья и 40 кровавой брони,-15% мили урона,медленно умираете\n +200 hp,+40 blood armor,-15% Melee damage,slowly dying \n Q:3", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 200)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 40)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -0.15)


trinket, soul = GM:AddTrinket("Soul of Alt Lilith", "altlilithsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(87, 4, 28), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2,"МАНХАК\n Manhack\n Q:4", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_DAMAGE_MUL, 0.5)
GM:AddSkillModifier(trinket, SKILLMOD_MANHACK_HEALTH_MUL, 0.8)





trinket, soul = GM:AddTrinket("Soul of Alt Azazel", "alteriosoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 0, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(255, 165, 00, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 255, 0, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "На 60% больше урон от мили!-20 хп и -10 кровавой брони,-60% мили ренжа.\n Melee damage multiplier 1.60x! -20 hp -10 blood armor,-60% Melee range\n Q:-1", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, 0.60)
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -20) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, -10) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_RANGE_MUL, -0.6) 

trinket, soul = GM:AddTrinket("Soul of Alt Appolyon", "altaposoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(30, 111, 51, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 105, 20, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 3, "Проджектайлы сильнее.\n Better Projectile damage\n Q:3", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_PROJECTILE_DAMAGE_MUL, 0.5) 

trinket, soul = GM:AddTrinket("Soul of Alt Bethany", "altbetsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(33, 33, 31, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(120, 200, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Больше никакого хп!...Только кровка и хороший хил по хп!\n-999 HP hp,+320 blood armor\n+100% Heal received\n Q:4", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, -999) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 320) 
GM:AddSkillModifier(trinket, SKILLMOD_HEALING_RECEIVED, 2) 
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR_DMG_REDUCTION, 1) 

trinket, soul = GM:AddTrinket("Soul of Alt Lost", "altlostsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(255, 255, 255, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 255, 20, 125), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(255, 30, 255, 95), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 1, "Быстрее двигаешься через пропы,но ты получаешь в 1000% раза больше урона и +6 к удачи!Вы быстрее на 50 единиц\nYou move faster through prop,+50 speed\n1000% Damage taken mul and +6 luck \nQ:1", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 100) 
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, 10) 
GM:AddSkillModifier(trinket, SKILLMOD_SPEED, 50)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, 6)

trinket, soul = GM:AddTrinket("Soul of Alt Keeper", "altgreedsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(21, 255, 1, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(120, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Ваша жадность дае 25% к поинтам и -20 удачи\n+25% Point Multiplier,-20 luck\n Q:5", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_POINT_MULTIPLIER, 0.25)
GM:AddSkillModifier(trinket, SKILLMOD_LUCK, -20)

trinket, soul = GM:AddTrinket("Soul of Alt Cain", "altcainsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(9, 155, 9, 55), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(125, 0, 255, 100), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 255, 155), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Искажает другие души\nCorrupt Souls\n Q:Alt", nil, nil, "weapon_zs_soulalt")

trinket, soul = GM:AddTrinket("Soul of Alt Lazarus", "altlazarussoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(9, 0, 0, 195), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(125, 0, 255, 0), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 0, 5, 255), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 2, "Возрождает вас 1 раз!\nRedeem you once.\n Q:Alt", nil, nil, "weapon_zs_soulalt")

trinket, soul = GM:AddTrinket("Soul of Alt Forgotten", "altforsoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(2, 0, 61), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "Бьете хуже мили оружием!Вы сможете нормально атаковать другим оружием и наносить больше урона\nmelee is dead! you can use other weapon \n Q:Alt", nil, nil, "weapon_zs_soulalt")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_MUL, -1.20)
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.25)
GM:AddSkillModifier(trinket, SKILLMOD_RELOADSPEED_MUL, 0.12)
GM:AddSkillModifier(trinket, SKILLMOD_DAMAGE, 0.10)

trinket, soul = GM:AddTrinket("Soul of Beregod", "barasoul", false, nil, {
	["black_core_2"] = { type = "Sprite", sprite = "effects/splashwake3", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 10.697, y = 10.697 }, color = Color(2, 0, 61), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core_2+"] = { type = "Sprite", sprite = "effects/splashwake1", bone = "ValveBiped.Bip01_R_Hand", rel = "black_core", pos = Vector(0, 0.1, -0.201), size = { x = 30, y = 30 }, color = Color(0, 0, 255, 255), nocull = false, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
	["black_core"] = { type = "Model", model = "models/dav0r/hoverball.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4, 2, 0), angle = Angle(0, 0, 0), size = Vector(0.349, 0.349, 0.349), color = Color(55, 55, 5, 100), surpresslightning = true, material = "models/shiny", skin = 0, bodygroup = {} }
}, 4, "+25 хп,+20% к опыту,+35 кровавой брони\n+25 HP,+20% XP Mul,+35 blood armor\n Q:-1", nil, nil, "weapon_zs_soul")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 25)
GM:AddSkillModifier(trinket, SKILLMOD_XP, 0.2)
GM:AddSkillModifier(trinket, SKILLMOD_BLOODARMOR, 35)





-- Starter Trinkets

trinket, trinketwep = GM:AddTrinket("Armband", "armband", false, mveles, mweles, nil, "-20% melee swing impact delay\n-2% melee damage taken\n-20% Скорости атаки\n-2% Получаемого мили урона")
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_SWING_DELAY_MUL, -0.2)
GM:AddSkillModifier(trinket, SKILLMOD_MELEE_DAMAGE_TAKEN_MUL, -0.02)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Condiments", "condiments", false, supveles, supweles, nil, "+90% recovery from food\n-20% time to eat food\n -20% К времени поедания\n +90% к лечению от еды")
GM:AddSkillModifier(trinket, SKILLMOD_FOODRECOVERY_MUL, 0.90)
GM:AddSkillModifier(trinket, SKILLMOD_FOODEATTIME_MUL, -0.20)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Escape Manual", "emanual", false, develes, deweles, nil, "+90% phasing speed\n-12% low health slow intensity\n +90% К скорости передвижения в фазе\n -12% к эффективности замедления от лоу хп")
GM:AddSkillModifier(trinket, SKILLMOD_BARRICADE_PHASE_SPEED_MUL, 0.90)
GM:AddSkillModifier(trinket, SKILLMOD_LOW_HEALTH_SLOW_MUL, -0.12)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Aiming Aid", "aimaid", false, develes, deweles, nil, "+5% tighter aiming reticule\n-7% reduced effect of aim shake effects\n+5% К аккуратности стрельбы\n-6% К силе трясения экрана")
GM:AddSkillModifier(trinket, SKILLMOD_AIMSPREAD_MUL, -0.05)
GM:AddSkillModifier(trinket, SKILLMOD_AIM_SHAKE_MUL, -0.06)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Vitamin Capsules", "vitamins", false, hpveles, hpweles, nil, "+8 maximum health\n-32% poison damage taken\n +8 к макс хп\n-32% Получаемого урона от яда")
GM:AddSkillModifier(trinket, SKILLMOD_HEALTH, 8)
GM:AddSkillModifier(trinket, SKILLMOD_POISON_DAMAGE_TAKEN_MUL, -0.32)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Welfare Shield", "welfare", false, hpveles, hpweles, nil, "-12% resupply delay\n-20% self damage taken\n-12% К времени амуниции\n-20% Получаемого урона по себе")
GM:AddSkillModifier(trinket, SKILLMOD_RESUPPLY_DELAY_MUL, -0.12)
GM:AddSkillModifier(trinket, SKILLMOD_SELF_DAMAGE_MUL, -0.20)
trinketwep.PermitDismantle = true

trinket, trinketwep = GM:AddTrinket("Chemistry Set", "chemistry", false, hpveles, hpweles, nil, "+13% medic tool effectiveness\n+100% cloud bomb time\n +13% К эффективности мед иснтрументам\n+100% К времени действия облачных бомб")
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.13)
GM:AddSkillModifier(trinket, SKILLMOD_CLOUD_TIME, 1)
trinketwep.PermitDismantle = true

--Sins
trinket = GM:AddTrinket(trs("t_sin_greed"), "sin_greed", false, supveles, supweles, 1, trs("t_d_sin_greed"))
trinket = GM:AddTrinket(trs("t_sin_sloth"), "sin_sloth", false, supveles, supweles, 1, trs("t_d_sin_sloth"))
trinket = GM:AddTrinket(trs("t_sin_wrath"), "sin_wrath", false, supveles, supweles, 1, trs("t_d_sin_wrath"))
GM:AddSkillModifier(trinket, SKILLMOD_DMG_TAKEN, 1.5)
trinket = GM:AddTrinket(trs("t_sin_gluttony"), "sin_gluttony", false, supveles, supweles, 1, trs("t_d_sin_gluttony"))
trinket = GM:AddTrinket(trs("t_sin_pride"), "sin_pride", false, supveles, supweles, 1, trs("t_d_sin_pride"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.15)
trinket = GM:AddTrinket(trs("t_sin_envy"), "sin_envy", false, supveles, supweles, 1, trs("t_d_sin_envy"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.15)
trinket = GM:AddTrinket(trs("t_sin_lust"), "sin_lust", false, supveles, supweles, 1, trs("t_d_sin_lust"))

trinket, trinketwep = GM:AddTrinket(trs("t_ego"), "sin_ego", false, supveles, supweles, 1, trs("t_d_ego"))
trinketwep.Stackable = true
GM:AddSkillModifier(trinket, SKILLMOD_SCRAPDISCOUNT, 0.75)

trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
GM:AddSkillModifier(trinket, SKILLMOD_ARSENAL_DISCOUNT, -0.10)
--[[trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))
trinket = GM:AddTrinket(trs("t_vir_pat"), "vir_pat", false, supveles, supweles, 1, trs("t_d_vir_pat"))]]

--Мед премия
trinket = GM:AddTrinket(trs("t_pr_gold"), "pr_gold", false, supveles, supweles, 4, trs("t_d_pr_gold"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.22)
trinket = GM:AddTrinket(trs("t_pr_barapaw"), "pr_barapaw", false, supveles, supweles, 4, trs("t_d_pr_barapaw"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.44)
trinket = GM:AddTrinket(trs("t_pr_chamomile"), "pr_chamomile", false, supveles, supweles, 4, trs("t_d_pr_chamomile"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_EFFECTIVENESS_MUL, 0.55)
trinket = GM:AddTrinket(trs("t_pr_bloodpack"), "pr_bloodpack", false, supveles, supweles, 4, trs("t_d_pr_bloodpack"))
GM:AddSkillModifier(trinket, SKILLMOD_MEDKIT_COOLDOWN_MUL, -0.32)



local placeholder = {
	["perf"] = { type = "Model", model = "models/props_lab/binderblue.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1.5, -2), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}
trinket, trinketwep = GM:AddTrinket(trs("t_defensive_module"), "defensive_module", false, placeholder, placeholder, 4, trs("t_d_defensive_module"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_balance"), "module_balance", false, placeholder, placeholder, 4, trs("t_d_module_balance"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_resnya"), "module_resnya", false, placeholder, placeholder, 4, trs("t_d_module_resnya"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_bounty"), "module_bounty", false, placeholder, placeholder, 4, trs("t_d_module_bounty"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_handler"), "module_handler", false, placeholder, placeholder, 4, trs("t_d_module_handler"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_extreme"), "module_extreme", false, placeholder, placeholder, 4, trs("t_d_module_extreme"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_nanite"), "module_nanite", false, placeholder, placeholder, 4, trs("t_d_module_nanite"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true
trinket, trinketwep = GM:AddTrinket(trs("t_module_mirror"), "module_mirror", false, placeholder, placeholder, 4, trs("t_d_module_mirror"), nil, nil, "weapon_zs_special_trinket")
trinketwep.OnlyDrones = true


trinket = GM:AddTrinket( trs( "t_illegalmechanism" ), "illegalmechanism", false, supveles, supweles, 4, trs( "t_d_illegalmechanism" ) )
GM:AddSkillModifier( trinket, SKILLMOD_ILLEGALMECHANISM, 1 )
GM:AddSkillModifier( trinket, SKILLMOD_DEPLOYABLE_HEALTH_MUL, -0.1 )