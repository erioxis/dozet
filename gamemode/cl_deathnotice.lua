if not killicon.GetFont then
	local OldAddFont = killicon.AddFont
	local OldAdd = killicon.Add

	local storedfonts = {}
	local storedicons = {}

	function killicon.AddFont(sClass, sFont, sLetter, cColor)
		cColor = cColor or color_white
		storedfonts[sClass] = {sFont, sLetter, cColor}
		return OldAddFont(sClass, sFont, sLetter, cColor)
	end
	local colors = {[INNATE_TYPE_BOUNTY] = Color(154,0,126),
	[INNATE_TYPE_SERRATE] = Color(172,0,06),
	[INNATE_TYPE_ICE] = Color(0,92,229),
	[INNATE_TYPE_FIRE] = Color(192,71,34),
	[INNATE_TYPE_PULSE] = Color(0,18,154)
	}

	function killicon.Add(sClass, sTexture, cColor)
		cColor = cColor or color_white
		storedicons[sClass] = {sTexture, cColor}
		return OldAdd(sClass, sTexture, cColor)
	end

	function killicon.AddAlias(sClass, sBaseClass)
		if storedfonts[sBaseClass] then
			return killicon.AddFont(sClass, storedfonts[sBaseClass][1], storedfonts[sBaseClass][2], storedfonts[sBaseClass][3])
		elseif storedicons[sBaseClass] then
			return killicon.Add(sClass, storedicons[sBaseClass][1], storedicons[sBaseClass][2])
		end
	end

	function killicon.Get(sClass)
		return killicon.GetFont(sClass) or killicon.GetIcon(sClass)
	end
	local checked = {}
	function killicon.GetFont(sClass) 
		if !checked[sClass] and storedfonts[sClass] then
			local wep = weapons.Get(sClass) 
			checked[sClass] = true
			storedfonts[sClass][3] = 
			storedfonts[sClass] and 
			color_white ~= storedfonts[sClass][3] and storedfonts[sClass][3] or wep and wep.InnateDamageType and colors[wep.InnateDamageType] or color_white
		end
		return storedfonts[sClass]
	end
	function killicon.GetIcon(sClass)
		if !checked[sClass] and storedicons[sClass] then
			local wep = weapons.Get(sClass) 
			checked[sClass] = true
			storedicons[sClass][2] = 
			storedicons[sClass] and 
			color_white ~= storedicons[sClass][2] and storedicons[sClass][2] or wep and wep.InnateDamageType and colors[wep.InnateDamageType] or color_white
		end
		return storedicons[sClass]
	end
end

killicon.AddFont("default", "zsdeathnoticecs", "C")
killicon.AddFont("suicide", "zsdeathnoticecs", "C")
killicon.AddFont("player", "zsdeathnoticecs", "C")
killicon.AddFont("worldspawn", "zsdeathnoticecs", "C")
killicon.AddFont("func_move_linear", "zsdeathnoticecs", "C")
killicon.AddFont("func_rotating", "zsdeathnoticecs", "C")
killicon.AddFont("trigger_hurt", "zsdeathnoticecs", "C")

killicon.AddFont("prop_physics", "zsdeathnotice", "9")
killicon.AddFont("prop_physics_respawnable", "zsdeathnotice", "9")
killicon.AddFont("prop_physics_multiplayer", "zsdeathnotice", "9")
killicon.AddFont("func_physbox", "zsdeathnotice", "9")
killicon.AddFont("weapon_smg1", "zsdeathnotice", "/")
killicon.AddFont("weapon_357", "zsdeathnotice", ".")
killicon.AddFont("weapon_ar2", "zsdeathnotice", "2")
killicon.AddFont("crossbow_bolt", "zsdeathnotice", "1")
killicon.AddFont("weapon_shotgun", "zsdeathnotice", "0")
killicon.AddFont("weapon_zs_rgun", "zsdeathnotice", "0", Color(0,61,194))
killicon.AddFont("rpg_missile", "zsdeathnotice", "3")
killicon.AddFont("npc_grenade_frag", "zsdeathnotice", "4")
killicon.AddFont("weapon_pistol", "zsdeathnotice", "-")
killicon.AddFont("prop_combine_ball", "zsdeathnotice", "8")
killicon.AddFont("grenade_ar2", "zsdeathnotice", "7")
killicon.AddFont("weapon_stunstick", "zsdeathnotice", "!")
killicon.AddFont("weapon_slam", "zsdeathnotice", "*")
killicon.AddFont("weapon_crowbar", "zsdeathnotice", "6")

killicon.Add("headshot", "zombiesurvival/killicons/zs_headshot")
killicon.Add("redeem", "killicon/redeem_v2")


killicon.Add("weapon_zs_baramelee", "zombiesurvival/killicons/weapon_zs_baramelee")
killicon.Add("weapon_zs_baramelee_xmas", "zombiesurvival/killicons/weapon_zs_baramelee")
killicon.Add("weapon_zs_baracat", "zombiesurvival/killicons/fast_legs", Color(34, 0, 34))
killicon.Add("weapon_zs_redbad", "zombiesurvival/killicons/skeletal_walker", Color(34, 139, 34))
killicon.Add("weapon_zs_zombie", "zombiesurvival/killicons/zombie")
killicon.Add("weapon_zs_zombie_gore_blaster", "zombiesurvival/killicons/zombie", Color(255, 0, 0))
killicon.Add("weapon_zs_skeleton", "zombiesurvival/killicons/skeletal_walker")
killicon.Add("weapon_zs_skeletallurker", "zombiesurvival/killicons/skeletal_lurker")
killicon.Add("weapon_zs_freshdead", "zombiesurvival/killicons/fresh_dead")
killicon.Add("weapon_zs_agiledead", "zombiesurvival/killicons/fresh_dead")
killicon.Add("weapon_zs_classiczombie", "zombiesurvival/killicons/fresh_dead")
killicon.Add("weapon_zs_superzombie", "zombiesurvival/killicons/fresh_dead")
killicon.Add("weapon_zs_zombietorso", "zombiesurvival/killicons/torso")
killicon.Add("weapon_zs_fastzombietorso", "zombiesurvival/killicons/fast_torso")
killicon.Add("weapon_zs_fastzombietorso_slingshot", "zombiesurvival/killicons/fast_torso", Color(163, 94, 99))
killicon.Add("weapon_zs_shadowlurker", "zombiesurvival/killicons/skeletal_lurker", Color(20, 20, 20))
killicon.Add("weapon_zs_shadowwalker", "zombiesurvival/killicons/skeletal_walker", Color(50, 50, 50))
killicon.Add("weapon_zs_zombielegs", "zombiesurvival/killicons/legs")
killicon.Add("weapon_zs_fastzombielegs", "zombiesurvival/killicons/fast_legs")
killicon.Add("weapon_zs_asskicker", "zombiesurvival/killicons/legs")
killicon.Add("weapon_zs_shitslapper", "zombiesurvival/killicons/torso")
killicon.Add("weapon_zs_nightmare", "zombiesurvival/killicons/nightmare2")
killicon.Add("weapon_zs_anightmare", "zombiesurvival/killicons/ancient_nightmare")
killicon.Add("weapon_zs_pukepus", "zombiesurvival/killicons/pukepus")
killicon.Add("weapon_zs_ticklemonster", "zombiesurvival/killicons/tickle")
killicon.Add("weapon_zs_crow", "zombiesurvival/killicons/crow")
killicon.Add("weapon_zs_fastzombie", "zombiesurvival/killicons/fastzombie")
killicon.Add("weapon_zs_fastzombie_slingshot", "zombiesurvival/killicons/fastzombie", Color(163, 94, 99))
killicon.Add("weapon_zs_poisonzombie", "zombiesurvival/killicons/poisonzombie")
killicon.Add("weapon_zs_wildpoisonzombie", "zombiesurvival/killicons/poisonzombie", Color(190, 240, 0))
killicon.Add("weapon_zs_chemzombie", "zombiesurvival/killicons/chemzombie")
killicon.Add("weapon_zs_ghoul", "zombiesurvival/killicons/ghoul")
killicon.Add("weapon_zs_chilledghoul", "zombiesurvival/killicons/ghoul", Color(20, 20, 250))
killicon.Add("weapon_zs_elderghoul", "zombiesurvival/killicons/ghoul", Color(170, 220, 0))
killicon.Add("dummy_chemzombie", "zombiesurvival/killicons/chemzombie")
killicon.Add("weapon_zs_wraith", "zombiesurvival/killicons/wraithv2")
killicon.Add("weapon_zs_headcrab", "zombiesurvival/killicons/headcrab")
killicon.Add("weapon_zs_doomcrab", "zombiesurvival/killicons/headcrab", Color(25, 25, 25))
killicon.Add("weapon_zs_fastheadcrab", "zombiesurvival/killicons/fastheadcrab")
killicon.Add("weapon_zs_bloodsucker_headcrab", "zombiesurvival/killicons/fastheadcrab", Color(175, 100, 100))
killicon.Add("weapon_zs_poisonheadcrab", "zombiesurvival/killicons/poisonheadcrab")
killicon.Add("weapon_zs_barbedheadcrab", "zombiesurvival/killicons/poisonheadcrab", Color(236, 218, 0))
killicon.Add("projectile_poisonspit", "zombiesurvival/killicons/projectile_poisonspit")
killicon.Add("projectile_poisonflesh", "zombiesurvival/killicons/projectile_poisonflesh")
killicon.Add("projectile_poisonpuke", "zombiesurvival/killicons/pukepus")
killicon.Add("weapon_zs_special_wow", "sprites/glow04_noz")
killicon.Add("weapon_zs_coolwisp", "sprites/glow04_noz", Color(0, 180, 255))
killicon.Add("projectile_wispball", "sprites/glow04_noz")
killicon.Add("weapon_zs_fleshcreeper", "zombiesurvival/killicons/fleshcreeper")
killicon.Add("weapon_zs_bloatedzombie", "zombiesurvival/killicons/bloatedzombie")
killicon.Add("weapon_zs_vilebloatedzombie", "zombiesurvival/killicons/bloatedzombie", Color(10, 94, 0))
killicon.Add("weapon_zs_gigagorechild", "zombiesurvival/killicons/gigagorechild")
killicon.Add("weapon_zs_gorechild", "zombiesurvival/killicons/gorechild")
killicon.Add("weapon_zs_gigashadowchild", "zombiesurvival/killicons/gigagorechild", Color(0, 0, 0))
killicon.Add("weapon_zs_shadowgorechild", "zombiesurvival/killicons/gorechild", Color(0, 0, 0))
killicon.Add("weapon_zs_shade", "zombiesurvival/killicons/shadev2", Color(0, 50, 255))
killicon.Add("weapon_zs_bonemesh", "zombiesurvival/killicons/bonemesh")
killicon.Add("projectile_bonemesh", "zombiesurvival/killicons/projectile_bonemesh")
killicon.Add("projectile_doomcrab", "zombiesurvival/killicons/projectile_bonemesh", Color(30, 30, 30))
killicon.Add("weapon_zs_redmarrow", "zombiesurvival/killicons/skeletal_walker", Color(255,0,0))
killicon.Add("weapon_zs_lacerator", "zombiesurvival/killicons/lacerator")
killicon.Add("weapon_zs_lacerator_charging", "zombiesurvival/killicons/lacerator", Color(180, 45, 0))
killicon.Add("weapon_zs_toxic_charger", "zombiesurvival/killicons/lacerator", Color(25, 191, 0))
killicon.Add("weapon_zs_devourer", "zombiesurvival/killicons/devourer")
killicon.Add("projectile_devourer", "zombiesurvival/killicons/devourer")
killicon.Add("weapon_zs_frostshade", "zombiesurvival/killicons/shadev2", Color(0, 190, 255))
killicon.Add("projectile_shadeice", "zombiesurvival/killicons/projectile_shadeice")
killicon.Add("status_frostshadeshield", "zombiesurvival/killicons/shadev2", Color(0, 190, 255))
killicon.Add("weapon_zs_eradicator", "zombiesurvival/killicons/poisonzombie", Color(66, 0, 0))
killicon.Add("weapon_zs_howler", "zombiesurvival/killicons/howler")
killicon.Add("weapon_zs_extinctioncrab", "zombiesurvival/killicons/fastheadcrab", Color(100, 20, 0))
killicon.Add("projectile_extinctioncrab", "zombiesurvival/killicons/fastheadcrab", Color(100, 20, 0))
killicon.Add("weapon_zs_frigidrevenant", "zombiesurvival/killicons/skeletal_walker", Color(50, 90, 135))
killicon.Add("weapon_zs_skelesham", "zombiesurvival/killicons/skeletal_walker", Color(220, 200, 150))
killicon.Add("weapon_zs_tormentedwraith", "zombiesurvival/killicons/wraithv2", Color(190, 255, 190))
killicon.Add("weapon_zs_noxiousghoul", "zombiesurvival/killicons/ghoul", Color(230, 130, 190))
killicon.Add("nest", "zombiesurvival/nest.png")


killicon.Add("weapon_zs_katana", "zombiesurvival/killicons/weapon_zs_katana")
killicon.Add("weapon_zs_murasama", "zombiesurvival/killicons/weapon_zs_katana", Color(194, 12, 12))
killicon.Add("weapon_zs_muramasa", "zombiesurvival/killicons/weapon_zs_katana", Color(47, 0, 255))
killicon.Add("weapon_zs_lamptube", "zombiesurvival/killicons/weapon_zs_lamptube")
killicon.Add("weapon_zs_rapir", "zombiesurvival/killicons/weapon_zs_rapir")

killicon.Add("weapon_zs_classic", "zombiesurvival/killicons/weapon_zs_classix")
killicon.Add("weapon_zs_clastix", "zombiesurvival/killicons/weapon_zs_classix")
killicon.Add("weapon_zs_classixx", "zombiesurvival/killicons/weapon_zs_classix", Color(230, 188, 190))
killicon.Add("prop_gunturret", "zombiesurvival/killicons/weapon_zs_gunturret2")
killicon.Add("prop_gunturret_assault", "zombiesurvival/killicons/weapon_zs_assaultturret.png")
killicon.Add("prop_gunturret_buckshot", "zombiesurvival/killicons/weapon_zs_gunturret_buckshot")
killicon.Add("prop_gunturret_rocket", "zombiesurvival/killicons/weapon_zs_gunturret_rocket")
killicon.Add("prop_gunturret_super", "zombiesurvival/killicons/weapon_zs_gunturret_rocket")
killicon.AddFont("weapon_zs_gunturretcontrol", "zsdeathnotice", "*")
killicon.Add("weapon_zs_gunturret", "zombiesurvival/killicons/weapon_zs_gunturret2")
killicon.Add("weapon_zs_gunturret_assault", "zombiesurvival/killicons/weapon_zs_assaultturret.png")
killicon.Add("weapon_zs_gunturret_buckshot", "zombiesurvival/killicons/weapon_zs_gunturret_buckshot")
killicon.Add("weapon_zs_gunturret_rocket", "zombiesurvival/killicons/weapon_zs_gunturret_rocket")
killicon.AddFont("projectile_zsgrenade", "zsdeathnotice", "4")
killicon.Add("projectile_proxymine", "zombiesurvival/killicons/weapon_zs_proxymine")
killicon.AddFont("weapon_zs_grenade", "zsdeathnotice", "4")
killicon.AddFont("weapon_zs_zegrenade", "zsdeathnotice", "4")
killicon.Add("weapon_zs_holy_grenade", "zombiesurvival/killicons/weapon_zs_holy_grenade", Color(255, 238, 0))
killicon.Add("projectile_h_grenade", "zombiesurvival/killicons/weapon_zs_holy_grenade", Color(255, 238, 0))
killicon.Add("weapon_zs_proxymine", "zombiesurvival/killicons/weapon_zs_proxymine")
killicon.Add("weapon_zs_detpack", "zombiesurvival/killicons/weapon_zs_detpack2")
killicon.Add("prop_detpack", "zombiesurvival/killicons/weapon_zs_detpack2")
killicon.Add("weapon_zs_detpackremote", "zombiesurvival/killicons/weapon_zs_detpack2")
killicon.AddFont("weapon_zs_stubber", "zsdeathnoticecs", "n")
killicon.AddFont("weapon_zs_zestubber", "zsdeathnoticecs", "n")
killicon.AddFont("weapon_zs_hunter", "zsdeathnoticecs", "r")
killicon.Add("weapon_zs_spinfusor", "zombiesurvival/killicons/weapon_zs_spinfusor2")
killicon.Add("projectile_disc", "zombiesurvival/killicons/weapon_zs_spinfusor")
killicon.Add("weapon_zs_zenith", "zombiesurvival/killicons/weapon_zs_spinfusor2")
killicon.Add("weapon_zs_zenithmega", "zombiesurvival/killicons/weapon_zs_spinfusor2")
killicon.AddFont("weapon_zs_tosser", "zsdeathnotice", "/")
killicon.Add("weapon_zs_hurricane", "zombiesurvival/killicons/weapon_zs_hurricane2")
killicon.AddFont("weapon_zs_owens", "zsdeathnotice", "-")
killicon.AddFont("weapon_zs_battleaxe", "zsdeathnoticecs", "y")
killicon.AddFont("weapon_zs_zebattleaxe", "zsdeathnoticecs", "y")
killicon.AddFont("weapon_zs_boomstick", "zsdeathnotice", "0")
killicon.AddFont("weapon_zs_doomstick", "zsdeathnotice", "0")
killicon.AddFont("weapon_zs_rocket_launcher", "zsdeathnotice", "0")
killicon.Add("weapon_zs_lowers", "zombiesurvival/killicons/weapon_zs_lowers1")
killicon.Add("weapon_zs_annabelle", "zombiesurvival/killicons/weapon_zs_annabelle2")
killicon.AddFont("weapon_zs_zeboomstick", "zsdeathnotice", "0")
killicon.AddFont("weapon_zs_silencer", "zsdeathnoticecs", "d")
killicon.AddFont("weapon_zs_zesilencer", "zsdeathnoticecs", "d")
killicon.Add("weapon_zs_blaster", "zombiesurvival/killicons/weapon_zs_blaster")
killicon.Add("weapon_zs_sawedoff", "zombiesurvival/killicons/weapon_zs_sawedoff2")
killicon.AddFont("weapon_zs_eraser", "zsdeathnoticecs", "u")
killicon.AddFont("weapon_zs_zeeraser", "zsdeathnoticecs", "u")
killicon.Add("weapon_zs_tempest", "zombiesurvival/killicons/weapon_zs_tempest")
killicon.Add("weapon_zs_zetempest", "zombiesurvival/killicons/weapon_zs_tempest")
killicon.AddFont("weapon_zs_sweepershotgun", "zsdeathnoticecs", "k")
killicon.Add("weapon_zs_oberon", "zombiesurvival/killicons/weapon_zs_oberon2")
killicon.AddFont("weapon_zs_zesweeper", "zsdeathnoticecs", "k")
killicon.AddFont("weapon_zs_barricadekit", "zsdeathnotice", "3")
killicon.AddFont("weapon_zs_pumpkinlayer", "zsdeathnotice", "3")
killicon.AddFont("weapon_zs_bulletstorm", "zsdeathnoticecs", "m")
killicon.AddFont("weapon_zs_zebulletstorm", "zsdeathnoticecs", "m")
killicon.AddFont("weapon_zs_crossbow", "zsdeathnotice", "1")
killicon.AddFont("projectile_arrow", "zsdeathnotice", "1")
killicon.Add("projectile_arrow_mini", "zombiesurvival/killicons/weapon_zs_artemis3")
killicon.Add("weapon_zs_artemis", "zombiesurvival/killicons/weapon_zs_artemis3")
killicon.AddFont("weapon_zs_deagle", "zsdeathnoticecs", "f")
killicon.AddFont("weapon_zs_zedeagle", "zsdeathnoticecs", "f")
killicon.AddFont("weapon_zs_glock3", "zsdeathnoticecs", "c")
killicon.AddFont("weapon_zs_chemar", "zsdeathnoticecs", "c")
killicon.AddFont("weapon_zs_binocle", "zsdeathnoticecs", "c")
killicon.AddFont("weapon_zs_zeglock", "zsdeathnoticecs", "c")
killicon.AddFont("weapon_zs_magnum", "zsdeathnotice", ".")
killicon.AddFont("weapon_zs_overmagnum", "zsdeathnotice", ".")
killicon.AddFont("weapon_zs_piercer", "zsdeathnotice", ".")
killicon.AddFont("weapon_zs_bogger", "zsdeathnotice", ".")
killicon.Add("weapon_zs_novacolt", "zombiesurvival/killicons/weapon_zs_novacolt2")
killicon.AddFont("weapon_zs_gaeagle", "zsdeathnoticecs", "f")
killicon.AddFont("weapon_zs_peashooter", "zsdeathnoticecs", "a")
killicon.AddFont("weapon_zs_smg", "zsdeathnoticecs", "x")
killicon.AddFont("weapon_zs_zesmg", "zsdeathnoticecs", "x")
killicon.AddFont("weapon_zs_swissarmyknife", "zsdeathnoticecs", "j")
killicon.AddFont("weapon_zs_zeknife", "zsdeathnoticecs", "j")
killicon.AddFont("weapon_zs_uzi", "zsdeathnoticecs", "l")
killicon.AddFont("weapon_zs_inferno", "zsdeathnoticecs", "e")
killicon.AddFont("weapon_zs_zeinferno", "zsdeathnoticecs", "e")
killicon.AddFont("weapon_zs_m4", "zsdeathnoticecs", "w")
killicon.AddFont("weapon_zs_m5", "zsdeathnoticecs", "w", Color(0, 220, 220))
killicon.AddFont("weapon_zs_m6", "zsdeathnoticecs", "w", Color(55, 220, 20))
killicon.AddFont("weapon_zs_m6_alt", "zsdeathnoticecs", "w", Color(255, 0, 20))
killicon.AddFont("weapon_zs_zem4", "zsdeathnoticecs", "w")
killicon.AddFont("weapon_zs_reaper", "zsdeathnoticecs", "q")
killicon.AddFont("weapon_zs_balance", "zsdeathnoticecs", "q", Color(255,191,127))
killicon.AddFont("weapon_zs_crackler", "zsdeathnoticecs", "t")
killicon.AddFont("weapon_zs_pulserifle", "zsdeathnotice", "2")
killicon.AddFont("weapon_zs_akbar", "zsdeathnoticecs", "b")
killicon.AddFont("weapon_zs_zeakbar", "zsdeathnoticecs", "b")
killicon.AddFont("weapon_zs_ender", "zsdeathnoticecs", "v")
killicon.AddFont("weapon_zs_redeemers", "zsdeathnoticecs", "s")
killicon.AddFont("weapon_zs_double_uzi", "zsdeathnoticecs", "s")
killicon.AddFont("weapon_zs_smorning", "zsdeathnoticecs", "s")
killicon.AddFont("weapon_zs_juggernaut", "zsdeathnoticecs", "z")
killicon.AddFont("weapon_zs_auto_turret", "zsdeathnoticecs", "z", Color(0,175,116))
killicon.AddFont("weapon_zs_amigo", "zsdeathnoticecs", "A")
killicon.AddFont("weapon_zs_zeamigo", "zsdeathnoticecs", "A")
killicon.Add("weapon_zs_gluon", "zombiesurvival/killicons/weapon_zs_gluon2")
killicon.Add("weapon_zs_aspirant", "zombiesurvival/killicons/weapon_zs_aspirant2")
killicon.AddFont("weapon_zs_flashbomb", "zsdeathnoticecs", "P")
killicon.AddFont("projectile_flashbomb", "zsdeathnoticecs", "P")
killicon.Add("weapon_zs_slugrifle", "zombiesurvival/killicons/weapon_zs_slugrifle2")
killicon.Add("weapon_zs_z9000", "zombiesurvival/killicons/weapon_zs_z9000")
killicon.Add("weapon_zs_waraxe", "zombiesurvival/killicons/weapon_zs_waraxe2")
killicon.Add("weapon_zs_fracture", "zombiesurvival/killicons/weapon_zs_fracture2")
killicon.Add("weapon_zs_molotov", "zombiesurvival/killicons/weapon_zs_molotov2")
killicon.Add("projectile_zsmolotov", "zombiesurvival/killicons/weapon_zs_molotov2")
killicon.Add("env_molotovflame", "zombiesurvival/killicons/weapon_zs_molotov2")
killicon.Add("weapon_zs_scar", "zombiesurvival/killicons/weapon_zs_scar2")
killicon.Add("weapon_zs_quasar", "zombiesurvival/killicons/weapon_zs_quasar2")
killicon.Add("weapon_zs_inquisitor", "zombiesurvival/killicons/weapon_zs_inquisitor2")
killicon.Add("projectile_arrow_inq", "zombiesurvival/killicons/weapon_zs_inquisitor2")
killicon.Add("weapon_zs_longarm", "zombiesurvival/killicons/weapon_zs_longarm2")
killicon.AddFont("weapon_zs_minelayer", "zsdeathnotice", "3")
killicon.Add("projectile_impactmine", "zombiesurvival/killicons/impact_mine")
killicon.Add("projectile_impactmine_kin", "zombiesurvival/killicons/weapon_zs_enkindlermine.png")
killicon.Add("weapon_zs_jackhammer", "zombiesurvival/killicons/weapon_zs_jackhammer2")
killicon.AddFont("weapon_zs_quicksilver", "zsdeathnoticecs", "i")
killicon.AddFont("weapon_zs_zequicksilver", "zsdeathnoticecs", "i")
killicon.Add("weapon_zs_zeus", "zombiesurvival/killicons/weapon_zs_zeus")
killicon.Add("weapon_zs_charon", "zombiesurvival/killicons/weapon_zs_charon3")
killicon.Add("weapon_zs_slinger", "zombiesurvival/killicons/weapon_zs_slinger")
killicon.Add("weapon_zs_novablaster", "zombiesurvival/killicons/weapon_zs_novablaster2")
killicon.Add("weapon_zs_nome", "zombiesurvival/killicons/weapon_zs_novablaster2")
killicon.Add("weapon_zs_colossus", "zombiesurvival/killicons/weapon_zs_colossus3")
killicon.Add("weapon_zs_relsous", "zombiesurvival/killicons/weapon_zs_colossus3")
killicon.Add("weapon_zs_drill", "zombiesurvival/killicons/weapon_zs_colossus3")
killicon.Add("weapon_zs_biotic_grl", "zombiesurvival/killicons/weapon_zs_biotic_grl")
killicon.Add("weapon_zs_corgasgrenade", "zombiesurvival/killicons/weapon_zs_corgasgrenade2")
killicon.Add("projectile_corgasgrenade", "zombiesurvival/killicons/weapon_zs_corgasgrenade2")
killicon.Add("weapon_zs_crygasgrenade", "zombiesurvival/killicons/weapon_zs_corgasgrenade2", Color(0, 220, 220))
killicon.Add("projectile_crygasgrenade", "zombiesurvival/killicons/weapon_zs_corgasgrenade2", Color(0, 220, 220))
killicon.Add("weapon_zs_bloodshotbomb", "zombiesurvival/killicons/weapon_zs_corgasgrenade2", Color(220, 0, 0))
killicon.Add("weapon_zs_arikus", "zombiesurvival/killicons/weapon_zs_arikus.png", Color(0, 220, 220))
killicon.Add("weapon_zs_broadside", "zombiesurvival/killicons/weapon_zs_broadside2")
killicon.Add("weapon_zs_tithonus", "zombiesurvival/killicons/weapon_zs_tithonus2")
killicon.Add("weapon_zs_seditionist", "zombiesurvival/killicons/weapon_zs_seditionist2")
killicon.Add("weapon_zs_hyena", "zombiesurvival/killicons/weapon_zs_hyena")
killicon.Add("weapon_zs_barrage", "zombiesurvival/killicons/weapon_zs_barrage")
killicon.Add("weapon_zs_rlauncher", "zombiesurvival/killicons/weapon_zs_barrage")
killicon.Add("weapon_zs_hephaestus", "zombiesurvival/killicons/weapon_zs_heph")
killicon.Add("weapon_zs_innervator", "zombiesurvival/killicons/weapon_zs_innervator2")
killicon.Add("weapon_zs_cosmos", "zombiesurvival/killicons/weapon_zs_cosmos2")
killicon.Add("weapon_zs_blareduct", "zombiesurvival/killicons/weapon_zs_blareduct2")
killicon.Add("weapon_zs_cinderrod", "zombiesurvival/killicons/weapon_zs_blareduct2")
killicon.Add("weapon_zs_shroud", "zombiesurvival/killicons/weapon_zs_shroud2")
killicon.Add("weapon_zs_stabber", "zombiesurvival/killicons/weapon_zs_stabber")
killicon.Add("weapon_zs_bulwark", "zombiesurvival/killicons/weapon_zs_bulwark2")
killicon.Add("weapon_zs_med_bulwark", "zombiesurvival/killicons/weapon_zs_bulwark2")
killicon.Add("weapon_zs_deathdealers", "zombiesurvival/killicons/weapon_zs_deathdealers")
killicon.Add("weapon_zs_galestorm", "zombiesurvival/killicons/weapon_zs_galestorm")
killicon.Add("weapon_zs_battlerifle", "zombiesurvival/killicons/weapon_zs_battlerifle")
killicon.Add("weapon_zs_eminence", "zombiesurvival/killicons/weapon_zs_eminence")
killicon.Add("weapon_zs_bulldog", "zombiesurvival/killicons/weapon_zs_eminence")
killicon.Add("weapon_zs_gladiator", "zombiesurvival/killicons/weapon_zs_gladiator")
killicon.Add("weapon_zs_medicrifle", "zombiesurvival/killicons/weapon_zs_convalescence")
killicon.Add("weapon_zs_ripper", "zombiesurvival/killicons/weapon_zs_ripper")
killicon.Add("weapon_zs_smelter", "zombiesurvival/killicons/weapon_zs_flakcannon")
killicon.Add("weapon_zs_avelyn", "zombiesurvival/killicons/weapon_zs_avelyn")
killicon.Add("weapon_zs_asmd", "zombiesurvival/killicons/weapon_zs_asmd")
killicon.Add("weapon_zs_antidoteshot", "zombiesurvival/killicons/weapon_zs_purger.png")
killicon.Add("weapon_zs_onyx", "zombiesurvival/killicons/weapon_zs_onyx.png")
killicon.Add("weapon_zs_enkindler", "zombiesurvival/killicons/weapon_zs_enkindler.png")
killicon.Add("weapon_zs_renegade", "zombiesurvival/killicons/weapon_zs_renegade.png")
killicon.Add("weapon_zs_healingray", "zombiesurvival/killicons/weapon_zs_healingray.png")
killicon.Add("weapon_zs_hammerray", "zombiesurvival/killicons/weapon_zs_healingray.png")
killicon.Add("weapon_zs_proliferator", "zombiesurvival/killicons/weapon_zs_proliferator.png")
killicon.Add("weapon_zs_pollutor", "zombiesurvival/killicons/weapon_zs_proliferator.png")
killicon.Add("weapon_zs_popluttar", "zombiesurvival/killicons/weapon_zs_proliferator.png", Color(70, 101, 11))
killicon.Add("weapon_zs_plasmatik", "zombiesurvival/killicons/weapon_zs_cosmos2", Color(70, 120, 160))
killicon.Add("weapon_zs_crymam", "zombiesurvival/killicons/weapon_zs_hyena", Color(70, 130, 180))
killicon.Add("weapon_zs_cryman", "zombiesurvival/killicons/weapon_zs_hyena", Color(70, 130, 180))
killicon.AddFont("weapon_zs_smgstick", "zsdeathnoticecs", "x")
killicon.Add("weapon_zs_toxicshooter", "zombiesurvival/killicons/weapon_zs_seditionist2", Color(0, 63, 25))
killicon.Add("weapon_zs_megaray", "zombiesurvival/killicons/weapon_zs_healingray.png", Color(70, 130, 180))
killicon.Add("weapon_zs_marksman", "zombiesurvival/killicons/weapon_zs_marksman")

killicon.Add("weapon_zs_energysword", "zombiesurvival/killicons/weapon_zs_energysword.png")
killicon.Add("weapon_zs_energysword_dasher", "zombiesurvival/killicons/weapon_zs_energysword.png")
killicon.Add("weapon_zs_loy", "zombiesurvival/killicons/weapon_zs_axe")
killicon.Add("weapon_zs_solemnvow", "zombiesurvival/killicons/weapon_zs_solemnvow.png")
killicon.Add("weapon_zs_silence", "zombiesurvival/killicons/weapon_zs_silence.png", Color(68,220,130))
killicon.Add("weapon_zs_sawer", "zombiesurvival/killicons/weapon_zs_sawer.png", Color(192,0,195))
killicon.Add("weapon_zs_fireofdespair", "zombiesurvival/killicons/weapon_zs_fireofdespair.png", Color(167,33,0))
killicon.Add("weapon_zs_nuclearminigun", "zombiesurvival/killicons/weapon_zs_nuclearminigun", Color(174,255,68))
killicon.Add("weapon_zs_refraction", "zombiesurvival/killicons/weapon_zs_refraction.png")
killicon.Add("projectile_refraction", "zombiesurvival/killicons/weapon_zs_refraction.png")
killicon.Add("weapon_zs_axe", "zombiesurvival/killicons/weapon_zs_axe")
killicon.Add("weapon_zs_sawhack", "zombiesurvival/killicons/weapon_zs_sawhack.png")
killicon.Add("weapon_zs_keyboard", "zombiesurvival/killicons/weapon_zs_keyboard")
killicon.Add("weapon_zs_sledgehammer", "zombiesurvival/killicons/weapon_zs_sledgehammer")
killicon.Add("weapon_zs_megamasher", "zombiesurvival/killicons/weapon_zs_megamasher2")
killicon.Add("weapon_zs_speed", "zombiesurvival/killicons/weapon_zs_megamasher2")
killicon.AddFont("weapon_zs_luxshade", "zsdeathnotice", "6")
killicon.Add("weapon_zs_fryingpan", "zombiesurvival/killicons/weapon_zs_fryingpan")
killicon.Add("weapon_zs_pot", "zombiesurvival/killicons/weapon_zs_pot")
killicon.Add("weapon_zs_plank", "zombiesurvival/killicons/weapon_zs_plank")
killicon.Add("weapon_zs_hammer", "zombiesurvival/killicons/weapon_zs_hammer2")
killicon.Add("weapon_zs_envy_hammer", "zombiesurvival/killicons/weapon_zs_hammer2")
killicon.Add("weapon_zs_shovel", "zombiesurvival/killicons/weapon_zs_shovel")
killicon.Add("weapon_zs_hook", "zombiesurvival/killicons/weapon_zs_hook2")
killicon.Add("weapon_zs_meattenderizer", "zombiesurvival/killicons/weapon_zs_meattenderizer2")
killicon.Add("weapon_zs_lamp", "zombiesurvival/killicons/weapon_zs_lamp")
killicon.Add("weapon_zs_pipe", "zombiesurvival/killicons/weapon_zs_pipe")
killicon.Add("weapon_zs_pipemega", "zombiesurvival/killicons/weapon_zs_pipe")
killicon.Add("weapon_zs_wrench", "zombiesurvival/killicons/weapon_zs_wrench")
killicon.AddFont("weapon_zs_icelux", "zsdeathnotice", "6")
killicon.AddFont("weapon_zs_stunbaton", "zsdeathnotice", "!")
killicon.Add("weapon_zs_bust", "zombiesurvival/killicons/weapon_zs_bust2")
killicon.Add("weapon_zs_butcherknife", "zombiesurvival/killicons/weapon_zs_butcherknife2")
killicon.Add("weapon_zs_butcherknifez", "zombiesurvival/killicons/butcher")
killicon.Add("weapon_zs_electrohammer", "zombiesurvival/killicons/weapon_zs_electrohammer")
killicon.Add("weapon_zs_singurhammer", "zombiesurvival/killicons/weapon_zs_electrohammer", Color(120, 10, 10))
killicon.Add("prop_meathook", "zombiesurvival/killicons/weapon_zs_hook2")
killicon.Add("weapon_zs_kongolaxe", "zombiesurvival/killicons/weapon_zs_kongolaxe2")
killicon.Add("weapon_zs_luxoid", "zombiesurvival/killicons/weapon_zs_kongolaxe2", Color(70, 120, 160))
killicon.Add("weapon_zs_fists", "zombiesurvival/killicons/weapon_zs_fists")
killicon.Add("weapon_zs_harpoon", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("weapon_zs_harpoon_mega", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("weapon_zs_harpoon_te", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.AddFont("projectile_luxrock", "zsdeathnotice", "6")
killicon.AddFont("projectile_shadeluxoid", "zsdeathnotice", "6", Color(70, 120, 160))
killicon.Add("prop_harpoon", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("projectile_harpoon", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("weapon_zs_ice_nail", "zombiesurvival/killicons/weapon_zs_ice_nail")
killicon.Add("projectile_harpoon_te", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("projectile_harpoon_tega", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("weapon_zs_harpoon_mega", "zombiesurvival/killicons/weapon_zs_harpoon2")
killicon.Add("weapon_zs_frotchet", "zombiesurvival/killicons/weapon_zs_frotchet")
killicon.Add("env_protrusionspike", "zombiesurvival/killicons/env_protrusionspike")
killicon.Add("weapon_zs_longsword", "zombiesurvival/killicons/weapon_zs_longsword2")
killicon.Add("weapon_zs_rebarmace", "zombiesurvival/killicons/weapon_zs_rebarmace2")
killicon.Add("weapon_zs_executioner", "zombiesurvival/killicons/weapon_zs_executioner2")
killicon.Add("weapon_zs_brassknuckles", "zombiesurvival/killicons/weapon_zs_brassknuckles")
killicon.Add("weapon_zs_powerfists", "zombiesurvival/killicons/weapon_zs_powerfist.png")
killicon.Add("weapon_zs_powerfists_t7", "zombiesurvival/killicons/weapon_zs_powerfist.png")
killicon.Add("weapon_zs_ladel", "zombiesurvival/killicons/weapon_zs_ladel")
killicon.Add("weapon_zs_glassbottle", "zombiesurvival/killicons/glass_bottle")
killicon.Add("weapon_zs_crackedbottle", "zombiesurvival/killicons/glass_bottle")
killicon.Add("weapon_zs_graveshovel", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_graveshovelz", "zombiesurvival/killicons/butcher", Color(100, 0, 220)) -- temp killicon
killicon.Add("weapon_zs_m_heal", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_m_wind", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_magicwand", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_m_damage", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_m_boom", "zombiesurvival/killicons/weapon_zs_graveshovel")
killicon.Add("weapon_zs_pushbroom", "zombiesurvival/killicons/weapon_zs_broom")
killicon.Add("weapon_zs_scythe", "zombiesurvival/killicons/weapon_zs_scythe2")
killicon.Add("weapon_zs_syx", "zombiesurvival/killicons/weapon_zs_scythe2")
killicon.Add("weapon_zs_teslorer", "zombiesurvival/killicons/weapon_zs_teslorer")
killicon.Add("weapon_zs_kobaldshield", "zombiesurvival/killicons/weapon_zs_koboldshield")
killicon.Add("weapon_zs_rubyshield", "zombiesurvival/killicons/weapon_zs_koboldshield", Color(197, 91, 247))
killicon.Add("weapon_zs_nuclearsword", "zombiesurvival/killicons/weapon_zs_nuclearsword", Color(26, 135, 7))

killicon.Add("weapon_zs_flamethrower", "zombiesurvival/killicons/weapon_zs_flamethrower")
killicon.Add("weapon_zs_scythe_death", "zombiesurvival/killicons/weapon_zs_scythe_death")
killicon.Add("weapon_zs_stone", "zombiesurvival/killicons/weapon_zs_stone")
killicon.Add("projectile_stone", "zombiesurvival/killicons/weapon_zs_stone")
killicon.Add("projectile_shaderock", "zombiesurvival/killicons/weapon_zs_stone")
killicon.Add("weapon_zs_medicalkit", "zombiesurvival/killicons/weapon_zs_medkit")
killicon.Add("weapon_zs_medicgun", "zombiesurvival/killicons/weapon_zs_medicgun2")
killicon.Add("projectile_healdart", "zombiesurvival/killicons/weapon_zs_medicgun2")
killicon.Add("weapon_zs_strengthshot", "zombiesurvival/killicons/weapon_zs_medicgun2", Color(255, 50, 50))
killicon.Add("weapon_zs_arsenalcrate", "zombiesurvival/killicons/weapon_zs_arsenalcrate")
killicon.Add("weapon_zs_remantler", "zombiesurvival/killicons/weapon_zs_remantler2.png")
killicon.Add("weapon_zs_drone_station", "zombiesurvival/killicons/weapon_zs_remantler2.png")
killicon.Add("weapon_zs_fridge", "zombiesurvival/killicons/weapon_zs_fridge.png")
killicon.Add("weapon_zs_tv", "zombiesurvival/killicons/weapon_zs_tv.png")
killicon.Add("weapon_zs_barricadekit", "zombiesurvival/killicons/weapon_zs_barricadekit")
killicon.Add("weapon_zs_boardpack", "zombiesurvival/killicons/weapon_zs_boardpack")
killicon.Add("weapon_zs_normalpack", "zombiesurvival/killicons/weapon_zs_boardpack")
killicon.Add("weapon_zs_manhack", "zombiesurvival/killicons/weapon_zs_manhack")
killicon.Add("prop_manhack", "zombiesurvival/killicons/weapon_zs_manhack")
killicon.AddFont("weapon_zs_manhackcontrol", "zsdeathnotice", "*")
killicon.Add("weapon_zs_manhack_saw", "zombiesurvival/killicons/weapon_zs_manhack_saw")
killicon.Add("prop_manhack_saw", "zombiesurvival/killicons/weapon_zs_manhack_saw")
killicon.AddFont("weapon_zs_manhackcontrol_saw", "zsdeathnotice", "*")
killicon.Add("weapon_zs_messagebeacon", "zombiesurvival/killicons/weapon_zs_messagebeacon")
killicon.Add("prop_messagebeacon", "zombiesurvival/killicons/weapon_zs_messagebeacon")
killicon.Add("weapon_zs_oxygentank", "zombiesurvival/killicons/weapon_zs_oxygentank")
killicon.Add("weapon_zs_resupplybox", "zombiesurvival/killicons/weapon_zs_resupplybox")
killicon.Add("weapon_zs_spotlamp", "zombiesurvival/killicons/weapon_zs_spotlamp")
killicon.Add("prop_spotlamp", "zombiesurvival/killicons/weapon_zs_spotlamp")
killicon.Add("prop_drone", "zombiesurvival/killicons/weapon_zs_drone3.png")
killicon.Add("weapon_zs_drone", "zombiesurvival/killicons/weapon_zs_drone3.png")
killicon.Add("prop_drone_hauler", "zombiesurvival/killicons/weapon_zs_haulerdrone.png")
killicon.Add("prop_drone_healer", "zombiesurvival/killicons/weapon_zs_haulerdrone.png", Color(142, 255, 50))
killicon.Add("weapon_zs_drone_hauler", "zombiesurvival/killicons/weapon_zs_haulerdrone.png")
killicon.Add("weapon_zs_drone_healer", "zombiesurvival/killicons/weapon_zs_haulerdrone.png", Color(34, 250, 26))
killicon.Add("prop_drone_pulse", "zombiesurvival/killicons/weapon_zs_drone_pulse.png")
killicon.Add("weapon_zs_drone_pulse", "zombiesurvival/killicons/weapon_zs_drone_pulse.png")
killicon.Add("prop_rollermine", "zombiesurvival/killicons/weapon_zs_rollermine.png")
killicon.Add("weapon_zs_rollermine", "zombiesurvival/killicons/weapon_zs_rollermine.png")
killicon.AddFont("weapon_zs_dronecontrol", "zsdeathnotice", "*")
killicon.AddFont("weapon_zs_rollerminecontrol", "zsdeathnotice", "*")
killicon.Add("weapon_zs_mediccloudbomb", "zombiesurvival/killicons/weapon_zs_mediccloudbomb")
killicon.Add("weapon_zs_nanitecloudbomb", "zombiesurvival/killicons/weapon_zs_mediccloudbomb", Color(255, 50, 255))
killicon.Add("weapon_zs_repairfield", "zombiesurvival/killicons/weapon_zs_repairfield")
killicon.Add("weapon_zs_medstation", "zombiesurvival/killicons/weapon_zs_repairfield", Color(34, 250, 26))
killicon.Add("weapon_zs_ffemitter", "zombiesurvival/killicons/weapon_zs_ffemitter")
killicon.Add("weapon_zs_zapper", "zombiesurvival/killicons/weapon_zs_zapper")
killicon.Add("prop_zapper", "zombiesurvival/killicons/weapon_zs_zapper")
killicon.Add("weapon_zs_zapper_arc", "zombiesurvival/killicons/weapon_zs_dynamo")
killicon.Add("prop_zapper_arc", "zombiesurvival/killicons/weapon_zs_dynamo")
killicon.Add("weapon_zs_f_banana", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_water", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_milk", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_orange", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_soda", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_watermelon", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_f_takeout", "zombiesurvival/killicons/food")
killicon.Add("weapon_zs_sigilfragment", "zombiesurvival/killicons/sigil_fragment")
killicon.Add("weapon_zs_sigil_port", "zombiesurvival/killicons/sigil_fragment")
killicon.Add("curse_of_sigil", "zombiesurvival/killicons/sigil_fragment", Color(142,0,0))
killicon.Add("weapon_zs_corruptedfragment", "zombiesurvival/killicons/sigil_fragment", Color(50, 255, 50))
killicon.Add("weapon_zs_scrap_sinos", "zombiesurvival/killicons/weapon_zs_sinos_scrap.png")

killicon.Add("weapon_zs_trinket", "zombiesurvival/killicons/weapon_zs_trinket")
killicon.Add("weapon_zs_craftables", "zombiesurvival/killicons/weapon_zs_craftables")
killicon.Add("weapon_zs_craftingpack", "zombiesurvival/killicons/weapon_zs_craftables")
killicon.Add("weapon_zs_camera", "zombiesurvival/killicons/weapon_zs_camera")
killicon.Add("weapon_zs_f_dash", "zombiesurvival/speed_up.png")
local colorsp = {
	{Color(235, 110, 165), Color(172, 111, 105)},
	{Color(120, 90, 175), Color(35, 110, 245)},
	{Color(160, 3, 5), Color(0, 100, 100)},
	{Color(180, 3, 5), Color(0, 166, 200)},
	{Color(255, 0, 0), Color(30, 100, 200)}
}
for i=1,6 do
	killicon.Add("weapon_zs_defence_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/defense.png",colorsp[i] and colorsp[i][1])
	killicon.Add("weapon_zs_special_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/speed_up.png",colorsp[i] and colorsp[i][1])
	killicon.Add("weapon_zs_melee_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/reaper.png",colorsp[i] and colorsp[i][1])
	killicon.Add("weapon_zs_shot_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/bullet.png",colorsp[i] and colorsp[i][1])
	killicon.Add("weapon_zs_help_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/healty.png",colorsp[i] and colorsp[i][1])
	killicon.Add("weapon_zs_mecha_trinket"..(colorsp[i] and "_q"..i or ""), "zombiesurvival/wrench.png",colorsp[i] and colorsp[i][1])

	killicon.Add("weapon_zs_defence_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/defense.png",colorsp[i] and colorsp[i][2])
	killicon.Add("weapon_zs_special_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/speed_up.png",colorsp[i] and colorsp[i][2])
	killicon.Add("weapon_zs_melee_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/reaper.png",colorsp[i] and colorsp[i][2])
	killicon.Add("weapon_zs_shot_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/bullet.png",colorsp[i] and colorsp[i][2])
	killicon.Add("weapon_zs_help_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/healty.png",colorsp[i] and colorsp[i][2])
	killicon.Add("weapon_zs_mecha_trinket"..(colorsp[i] and "_r"..i or ""), "zombiesurvival/wrench.png",colorsp[i] and colorsp[i][2])
end	




killicon.Add("weapon_zs_soul", "zombiesurvival/money.png")

killicon.Add("weapon_zs_soulalt", "zombiesurvival/money.png", Color(255, 0, 195, 56))

killicon.Add("projectile_money", "zombiesurvival/money.png")
killicon.Add("projectile_moneyauto", "zombiesurvival/money.png")
killicon.Add("projectile_markcoin", "zombiesurvival/money.png")



killicon.Add("status_death", "zombiesurvival/reaper.png", Color(51, 51, 51))
killicon.Add("weapon_zs_cursed", "zombiesurvival/reaper.png", Color(255, 1, 255))
killicon.Add("weapon_zs_defence_trinket_d", "zombiesurvival/defense.png", Color(255, 0, 0))
killicon.Add("weapon_zs_melee_trinket_d", "zombiesurvival/defense.png", Color(255, 0, 0))
killicon.Add("weapon_zs_special_trinket_d", "zombiesurvival/speed_up.png", Color(255, 0, 0))

killicon.Add("status_bleed", "zombiesurvival/bleed.png", Color(255, 0, 0))
killicon.Add("status_serrated", "zombiesurvival/bleed.png", Color(113, 0, 0))
killicon.Add("status_rot", "zombiesurvival/rot.png", Color(255, 0, 0))
killicon.Add("status_cursed", "zombiesurvival/cursed.png", Color(255, 0, 0))
killicon.Add("status_enfeeb", "zombiesurvival/infeeble.png", Color(255, 0, 0))
killicon.Add("status_poison", "zombiesurvival/poison.png")
killicon.Add("status_curse", "zombiesurvival/cursed.png")
killicon.Add("status_dim_vision", "zombiesurvival/dim_vision.png")
killicon.Add("status_world", "zombiesurvival/dim_vision.png")
killicon.Add("status_slow", "zombiesurvival/slow.png")
killicon.Add("status_speed", "zombiesurvival/slow.png")
killicon.Add("status_speed2", "zombiesurvival/speed_up.png")
killicon.Add("status_frost", "zombiesurvival/frost.png")
killicon.Add("status_fright", "zombiesurvival/tremors.png")
killicon.Add("status_sickness", "zombiesurvival/sickness.png")
killicon.Add("status_dosei_inf", "zombiesurvival/sickness.png")
killicon.Add("status_knockdown", "zombiesurvival/knock_down.png")
killicon.Add("status_strength", "zombiesurvival/strength_shot.png")
killicon.Add("status_sticky", "zombiesurvival/strength_shot.png", Color(69, 230, 77))
killicon.Add("status_adrenaline", "zombiesurvival/speed_up.png")
killicon.Add("status_keyboard", "zombiesurvival/speed_up.png")
killicon.Add("status_holly", "zombiesurvival/cursed.png")
killicon.Add("status_defence", "zombiesurvival/defense.png")
killicon.Add("status_sigildef", "zombiesurvival/defense.png")
killicon.Add("status_renegade", "zombiesurvival/headshot_stacks.png")
killicon.Add("status_target", "zombiesurvival/headshot_stacks.png")
killicon.Add("status_bloodlust", "zombiesurvival/bleed.png")
killicon.Add("status_bloodrage", "zombiesurvival/bleed.png")
killicon.Add("status_hollow", "zombiesurvival/hallow.png")
killicon.Add("status_mantle", "zombiesurvival/defense.png")

killicon.Add("env_fire", "zombiesurvival/killicons/burn")
killicon.Add("entityflame", "zombiesurvival/killicons/burn")
killicon.Add("status_burn", "zombiesurvival/killicons/burn", Color(255, 99, 27))

killicon.Add("ammo_pistol", "zombiesurvival/killicons/pistol_ammo_icon", Color(255, 255, 200))
killicon.Add("ammo_shotgun", "zombiesurvival/killicons/shotgun_ammo_icon", Color(255, 140, 120))
killicon.Add("ammo_pulse", "zombiesurvival/killicons/pulse_ammo_icon", Color(150, 200, 255))
killicon.Add("ammo_rifle", "zombiesurvival/killicons/rifle_ammo_icon_2", Color(200, 200, 155))
killicon.Add("ammo_scrap", "zombiesurvival/killicons/scrap_ammo_icon", Color(150, 150, 150))
killicon.Add("ammo_smg", "zombiesurvival/killicons/smg_ammo_icon_2", Color(180, 180, 255))
killicon.Add("ammo_explosive", "zombiesurvival/killicons/explosive_ammo_icon_2", Color(250, 150, 50))
killicon.Add("ammo_chemical", "zombiesurvival/killicons/chemical_ammo_icon", Color(170, 250, 90))
killicon.Add("ammo_assault", "zombiesurvival/killicons/assault_rifle_ammo_icon", Color(200, 250, 200))
killicon.Add("ammo_bolts", "zombiesurvival/killicons/bolts_ammo_icon_2", Color(230, 230, 100))
killicon.Add("ammo_medpower", "zombiesurvival/killicons/medpower_ammo_icon")
killicon.Add("ammo_nail", "zombiesurvival/killicons/nail_ammo_icon_2")
killicon.Add("prop_nail", "zombiesurvival/killicons/nail_ammo_icon_2")

net.Receive("zs_crow_kill_crow", function(length)
	local victim = net.ReadString()
	local attacker = net.ReadString()

	GAMEMODE:TopNotify(attacker, " ", {killicon = "weapon_zs_crow"}, " ", victim)
end)

net.Receive("zs_pl_kill_pl", function(length)
	local victim = net.ReadEntity()
	local attacker = net.ReadEntity()

	local inflictor = net.ReadString()

	local victimteam = net.ReadUInt(8)
	local attackerteam = net.ReadUInt(8)

	local headshot = net.ReadBit() == 1

	if victim:IsValid() and attacker:IsValid() then
		local attackername = attacker:Name()
		local victimname = victim:Name()

		if victim == MySelf then
			if victimteam == TEAM_HUMAN then
				gamemode.Call("LocalPlayerDied", attackername)
			end
		elseif attacker == MySelf then
			if attacker:Team() == TEAM_UNDEAD then
				gamemode.Call("FloatingScore", victim, "floatingscore_und", 1, 0)
			end
		end

		victim:CallZombieFunction5("OnKilled", attacker, attacker, attacker == victim, headshot, DamageInfo())

		MsgC(team.GetColor(attackerteam), attackername, (attacker:GetZombieClassTable().Boss and COLOR_RED or color_white),translate.Get("dn_killed"), team.GetColor(victimteam), victimname, color_white, translate.Get("killed_by_with"), COLOR_YELLOW, inflictor, "\n")

		
		GAMEMODE:TopNotify(attacker, " ", {killicon = inflictor, headshot = headshot}, " ", victim)
	end
end)

net.Receive("zs_pls_kill_pl", function(length)
	local victim = net.ReadEntity()
	local attacker = net.ReadEntity()
	local assister = net.ReadEntity()

	local inflictor = net.ReadString()

	local victimteam = net.ReadUInt(8)
	local attackerteam = net.ReadUInt(8)

	local headshot = net.ReadBit() == 1

	if victim:IsValid() and attacker:IsValid() and assister:IsValid() then
		local victimname = victim:Name()
		local attackername = attacker:Name()
		local assistername = assister:Name()

		if victim == MySelf and victimteam == TEAM_HUMAN then
			gamemode.Call("LocalPlayerDied", attackername.." and "..assistername)
		end

		victim:CallZombieFunction5("OnKilled", attacker, attacker, attacker == victim, headshot, DamageInfo())

		MsgC(team.GetColor(attackerteam), attackername, " and ", team.GetColor(attackerteam), assistername, color_white,translate.Get("dn_killed"), team.GetColor(victimteam), victimname, color_white, translate.Get("killed_by_with"), COLOR_YELLOW, inflictor, "\n")

		GAMEMODE:TopNotify(attacker, " and ", assister, " ", {killicon = inflictor, headshot = headshot}, " ", victim)
	end
end)

net.Receive("zs_pl_kill_self", function(length)
	local victim = net.ReadEntity()
	local victimteam = net.ReadUInt(8)

	if victim:IsValid() then
		if victim == MySelf and victimteam == TEAM_HUMAN then
			gamemode.Call("LocalPlayerDied")
		end

		victim:CallZombieFunction5("OnKilled", victim, victim, true, false, DamageInfo())

		local victimname = victim:Name()

		MsgC(team.GetColor(victimteam), victimname, color_white, translate.Get("killed_by_suicide"), "\n")

		GAMEMODE:TopNotify({killicon = "suicide"}, " ", victim)
	end
end)


net.Receive("zs_playerredeemed", function(length)
	local pl = net.ReadEntity()

	if pl:IsValid() then
		GAMEMODE:TopNotify(translate.Format("x_redeemed", pl:Name()), " ", {killicon = "redeem"})

		if pl == MySelf then
			GAMEMODE:CenterNotify(COLOR_CYAN, translate.Get("you_redeemed"))

			util.WhiteOut(3)
			pl.KnockedDown = nil
			pl.KnockedDownD = nil
		end
	end
end)

net.Receive("zs_death", function(length)
	local victim = net.ReadEntity()
	local inflictor = net.ReadString()
	local attacker = "#" .. net.ReadString()
	local victimteam = net.ReadUInt(8)

	if victim:IsValid() then
		if victim == MySelf and victimteam == TEAM_HUMAN then
			gamemode.Call("LocalPlayerDied")
		end

		victim:CallZombieFunction5("OnKilled", attacker, NULL, attacker == victim, false, DamageInfo())

		local victimname = victim:Name()

		MsgC(team.GetColor(victimteam), victimname, color_white, translate.Get("killed_by"), COLOR_YELLOW, attacker, color_white, translate.Get("killed_by_with"), COLOR_YELLOW, inflictor, "\n")

		GAMEMODE:TopNotify(COLOR_RED, attacker, " ", {deathicon = inflictor}, " ", victim)
	end
end)
