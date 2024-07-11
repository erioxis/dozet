GM.BeatSetHumanDefault = "defaulthuman"
GM.BeatSetZombieDefault = "defaultzombiev2"

GM.ItemCategoryIcons = {
	[ITEMCAT_GUNS] = "icon16/gun.png",
	[ITEMCAT_AMMO] = "icon16/box.png",
	[ITEMCAT_MELEE] = "icon16/cog.png",
	[ITEMCAT_TOOLS] = "icon16/wrench.png",
	[ITEMCAT_DEPLOYABLES] = "icon16/package.png",
	[ITEMCAT_OTHER] = "icon16/world.png",
<<<<<<< Updated upstream
	[ITEMCAT_TRINKETS] = "icon16/ruby.png" --[[,
	[ITEMCAT_RETURNS] = "icon16/user_delete.png"]]
=======
	[ITEMCAT_TRINKETS] = "icon16/ruby.png", 
	[ITEMCAT_SPECIAL] = "icon16/user_delete.png",
	[ITEMCAT_MAGIC] = "icon16/user_delete.png",
	[ITEMCAT_MODULES] = "icon16/ruby.png",
>>>>>>> Stashed changes
}

GM.RemortColors = {
	[9] = COLOR_TAN,
	[8] = COLOR_BROWN,
	[7] = COLOR_RPINK,
	[6] = COLOR_RPURPLE,
	[5] = COLOR_CYAN,
	[4] = COLOR_GREEN,
	[3] = COLOR_YELLOW,
	[2] = COLOR_RORANGE,
	[1] = COLOR_RED
}

GM.SpeedToText = {
	[SPEED_NORMAL] = "Normal",
	[SPEED_SLOWEST] = "Very Slow",
	[SPEED_SLOWER] = "Quite Slow",
	[SPEED_SLOW] = "Slow",
	[SPEED_FAST] = "Fast",
	[SPEED_FASTER] = "Quite Fast",
	[SPEED_FASTEST] = "Very Fast",
	[SPEED_VKID] = "Dudeeee",
	[-1] = "Ultra Slow",
}

GM.AmmoToPurchaseNames = {
	["pistol"] = "pistolammo",
	["buckshot"] = "shotgunammo",
	["smg1"] = "smgammo",
	["ar2"] = "assaultrifleammo",
	["357"] = "rifleammo",
	["pulse"] = "pulseammo",
	["XBowBolt"] = "crossbowammo",
	["impactmine"] = "impactmine",
	["chemical"] = "chemical"
}

GM.WeaponStatBarVals = {
	{"MeleeDamage", "Damage", 2, 140, false},
	{"MeleeRange", "Range", 30, 100, false},
	{"MeleeSize", "Size", 0.2, 3, false},

	{"Damage", "Damage", 1, 105, false, "Primary"},
	{"Delay", "Attack Delay", 0.05, 2, true, "Primary"},
	{"ClipSize", "Clip Size", 1, 35, false, "Primary"},

<<<<<<< Updated upstream
	{"ConeMin", "Min Spread", 0, 5, true},
	{"ConeMax", "Max Spread", 1.5, 7, true},
	{"WalkSpeed", "Move Speed", 200, 250, false}
=======
	{"ConeMin",  trs("p_min_spr"), 0, 5, true},
	{"ConeMax",  trs("p_max_spr"), 1, 7, true},
	{"ReloadSpeed", trs("p_r_speed"), 0.05, 3, true, "Primary"},
	{"BlockMultiplierWeapon",trs("p_block_m"),0,1,false},
	{"WalkSpeed", trs("p_msp"), 200, 350, false}
>>>>>>> Stashed changes
}

GM.LifeStatsLifeTime = 5

GM.RewardIcons = {}
GM.RewardIcons["weapon_zs_barricadekit"] = "models/props_debris/wood_board05a.mdl"

GM.CrosshairColor = Color(CreateClientConVar("zs_crosshair_colr", "255", true, false):GetInt(), CreateClientConVar("zs_crosshair_colg", "255", true, false):GetInt(), CreateClientConVar("zs_crosshair_colb", "255", true, false):GetInt(), CreateClientConVar("zs_crosshair_cola", "220", true, false):GetInt())
GM.CrosshairColor2 = Color(CreateClientConVar("zs_crosshair_colr2", "220", true, false):GetInt(), CreateClientConVar("zs_crosshair_colg2", "0", true, false):GetInt(), CreateClientConVar("zs_crosshair_colb2", "0", true, false):GetInt(), CreateClientConVar("zs_crosshair_cola2", "220", true, false):GetInt())
cvars.AddChangeCallback("zs_crosshair_colr", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor.r = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_colg", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor.g = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_colb", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor.b = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_cola", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor.a = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_colr2", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor2.r = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_colg2", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor2.g = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_colb2", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor2.b = tonumber(newvalue) or 255 end)
cvars.AddChangeCallback("zs_crosshair_cola2", function(cvar, oldvalue, newvalue) GAMEMODE.CrosshairColor2.a = tonumber(newvalue) or 255 end)

GM.FilmMode = CreateClientConVar("zs_filmmode", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_filmmode", function(cvar, oldvalue, newvalue)
	GAMEMODE.FilmMode = tonumber(newvalue) == 1

	gamemode.Call("EvaluateFilmMode")
end)

CreateClientConVar("zs_noredeem", "0", true, true)

CreateClientConVar("zs_shield_radius", "0", true, false)
cvars.AddChangeCallback("zs_shield_radius", function(cvar, oldvalue, newvalue)
	local ent = MySelf:NearestShit()
	net.Start('zs_shield_abuse')
		net.WriteString('range')
		net.WriteEntity(ent)
		net.WriteUInt(newvalue, 24)
	net.SendToServer()
end)
CreateClientConVar("zs_shield_x", "0", true, false)
cvars.AddChangeCallback("zs_shield_x", function(cvar, oldvalue, newvalue)
	local ent = MySelf:NearestShit()
	net.Start('zs_shield_abuse')
		net.WriteString('x_yaw')
		net.WriteEntity(ent)
		net.WriteUInt(newvalue, 24)
	net.SendToServer()
end)
CreateClientConVar("zs_shield_y", "0", true, false)
cvars.AddChangeCallback("zs_shield_y", function(cvar, oldvalue, newvalue)
	local ent = MySelf:NearestShit()
	net.Start('zs_shield_abuse')
		net.WriteString('y_yaw')
		net.WriteEntity(ent)
		net.WriteUInt(newvalue, 24)
	net.SendToServer()
end)
CreateClientConVar("zs_shield_z", "0", true, false)
cvars.AddChangeCallback("zs_shield_z", function(cvar, oldvalue, newvalue)
	local ent = MySelf:NearestShit()
	net.Start('zs_shield_abuse')
		net.WriteString('z_yaw')
		net.WriteEntity(ent)
		net.WriteUInt(newvalue, 24)
	net.SendToServer()
end)

CreateClientConVar("zs_alwaysvolunteer", "0", true, true)
CreateClientConVar("zs_nobosspick", "0", true, true)
CreateClientConVar("zs_nousetodeposit", "0", true, true)
<<<<<<< Updated upstream
CreateClientConVar("zs_nopickupprops", "0", true, true)

=======
CreateClientConVar("zs_mge_phrases", "0", true, true)


CreateClientConVar("zs_nopickupprops", "0", true, true)
CreateClientConVar("zs_nopickuploot", "0", true, true)
CreateClientConVar("zs_nodiscord", "0", true, true)
CreateClientConVar("zs_nohperc", "0", true, true)
CreateClientConVar("zs_voice_n", "0", true, true)

CreateClientConVar("zs_ammoslider", 0, true, false)
GM.FixTheLag = CreateClientConVar("zs_fixthelag", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_fixthelag", function(cvar, oldvalue, newvalue)
	GAMEMODE.FixTheLag = tonumber(newvalue) == 1
end)
>>>>>>> Stashed changes
GM.DisableScopes = CreateClientConVar("zs_disablescopes", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_disablescopes", function(cvar, oldvalue, newvalue)
	GAMEMODE.DisableScopes = tonumber(newvalue) == 1
end)
<<<<<<< Updated upstream
=======
GM.RGB_HP = CreateClientConVar("zs_rgb_ura", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_rgb_ura", function(cvar, oldvalue, newvalue)
	GAMEMODE.RGB_HP = tonumber(newvalue) == 1
end)

GM.Size_HPBar = CreateClientConVar("zs_hp_bar_size", "300", true, false):GetFloat()
cvars.AddChangeCallback("zs_hp_bar_size", function(cvar, oldvalue, newvalue)
	GAMEMODE.Size_HPBar = tonumber(newvalue)
end)
GM.Size_BABar = CreateClientConVar("zs_ba_bar_size", "240", true, false):GetFloat()
cvars.AddChangeCallback("zs_ba_bar_size", function(cvar, oldvalue, newvalue)
	GAMEMODE.Size_BABar = tonumber(newvalue)
end)

GM.DisableCMenu = CreateClientConVar("zs_disablecustommenu", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_disablecustommenu", function(cvar, oldvalue, newvalue)
	GAMEMODE.DisableCMenu = tonumber(newvalue) == 1
end)
GM.DisableNode = CreateClientConVar("zs_disablenode", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_disablenode", function(cvar, oldvalue, newvalue)
	GAMEMODE.DisableNode = tonumber(newvalue) == 1
end)
GM.NewbieMode = CreateClientConVar("zs_nb_mode", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_nb_mode", function(cvar, oldvalue, newvalue)
	GAMEMODE.NewbieMode = tonumber(newvalue) == 1
end)
GM.DontShowNB = CreateClientConVar("zs_dont_show", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_dont_show", function(cvar, oldvalue, newvalue)
	GAMEMODE.DontShowNB = tonumber(newvalue) == 0
end)
GM.AddDesc = CreateClientConVar("zs_adddesc", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_adddesc", function(cvar, oldvalue, newvalue)
	GAMEMODE.AddDesc = tonumber(newvalue) == 1
end)
GM.DisableNode2 = CreateClientConVar("zs_disablesprite", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_disablesprite", function(cvar, oldvalue, newvalue)
	GAMEMODE.DisableNode2 = tonumber(newvalue) == 1
end)
GM.MCSeconds = CreateClientConVar("zs_ms_mss", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_ms_mss", function(cvar, oldvalue, newvalue)
	GAMEMODE.MCSeconds = tonumber(newvalue) == 1
end)
GM.OneClickSkill = CreateClientConVar("zs_blockunable", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_blockunable", function(cvar, oldvalue, newvalue)
	GAMEMODE.OneClickSkill = tonumber(newvalue) == 1
end)
GM.ShowElol = CreateClientConVar("zs_show_e_lol", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_show_e_lol", function(cvar, oldvalue, newvalue)
	GAMEMODE.ShowElol = tonumber(newvalue) == 1
end)



GM.FontPL = CreateClientConVar("zs_font", "", true, false):GetString()
cvars.AddChangeCallback("zs_font", function(cvar, oldvalue, newvalue)
	GAMEMODE.FontPL = newvalue
	gamemode.Call("CreateFonts")
end)


GM.ShowPercDmg = CreateClientConVar("zs_show_dmg_in_perc", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_show_dmg_in_perc", function(cvar, oldvalue, newvalue)
	GAMEMODE.ShowPercDmg = tonumber(newvalue) == 1
end)
>>>>>>> Stashed changes

GM.GoofyAhhHud = CreateClientConVar("zs_goofy_ahh_hud", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_goofy_ahh_hud", function(cvar, oldvalue, newvalue)
	GAMEMODE.GoofyAhhHud = tonumber(newvalue) == 1
	GAMEMODE.HealthHUD:Remove()
	GAMEMODE.HealthHUD = vgui.Create(GAMEMODE.GoofyAhhHud and 'ZSHealthArea2' or "ZSHealthArea")
end)


GM.IronsightZoomScale = math.Clamp(CreateClientConVar("zs_ironsightzoom", 1, true, false):GetFloat(), 0, 1)
cvars.AddChangeCallback("zs_ironsightzoom", function(cvar, oldvalue, newvalue)
	GAMEMODE.IronsightZoomScale = math.Clamp(tonumber(newvalue) or 1, 0, 1)
end)
GM.X_Y_Skill = math.Clamp(CreateClientConVar("zs_x_y", 20, true, false):GetFloat(), 12, 45)
cvars.AddChangeCallback("zs_x_y", function(cvar, oldvalue, newvalue)
	GAMEMODE.X_Y_Skill = math.Clamp(tonumber(newvalue) or 20, 12, 45)
end)

<<<<<<< Updated upstream
=======
GM.Alpha_P = math.Clamp(CreateClientConVar("zs_alpha_p", 90, true, false):GetFloat(), 0, 1)
cvars.AddChangeCallback("zs_alpha_p", function(cvar, oldvalue, newvalue)
	GAMEMODE.Alpha_P = math.Clamp(tonumber(newvalue) or 1, 0, 1)
end)
GM.SoundVolume = math.Clamp(CreateClientConVar("zs_sound_volume_wep", 1, true, true):GetFloat(), 0, 1)
cvars.AddChangeCallback("zs_sound_volume_wep", function(cvar, oldvalue, newvalue)
	GAMEMODE.SoundVolume = math.Clamp(tonumber(newvalue) or 1, 0, 1)
	net.Start("zs_soundbruh")
		net.WriteFloat(GAMEMODE.SoundVolume)
	net.SendToServer()
end)


GM.Alpha_B = math.Clamp(CreateClientConVar("zs_alpha_b", 30, true, false):GetFloat(), 0, 255)
cvars.AddChangeCallback("zs_alpha_b", function(cvar, oldvalue, newvalue)
	GAMEMODE.Alpha_B = math.Clamp(tonumber(newvalue) or 1, 0, 255)
end)


GM.BG_AL = math.Clamp(CreateClientConVar("zs_bg_alpha", 252, true, false):GetFloat(), 0, 255)
cvars.AddChangeCallback("zs_bg_alpha", function(cvar, oldvalue, newvalue)
	GAMEMODE.BG_AL = math.Clamp(tonumber(newvalue) or 252, 0, 255)
end)
GM.BG_R = math.Clamp(CreateClientConVar("zs_bg_col_r", 0, true, false):GetFloat(), 0, 255)
cvars.AddChangeCallback("zs_bg_col_r", function(cvar, oldvalue, newvalue)
	GAMEMODE.BG_R = math.Clamp(tonumber(newvalue) or 0, 0, 255)
end)
GM.BG_G = math.Clamp(CreateClientConVar("zs_bg_col_g", 0, true, false):GetFloat(), 0, 255)
cvars.AddChangeCallback("zs_bg_col_g", function(cvar, oldvalue, newvalue)
	GAMEMODE.BG_G = math.Clamp(tonumber(newvalue) or 0, 0, 255)
end)
GM.BG_B = math.Clamp(CreateClientConVar("zs_bg_col_b", 0, true, false):GetFloat(), 0, 255)
cvars.AddChangeCallback("zs_bg_col_b", function(cvar, oldvalue, newvalue)
	GAMEMODE.BG_B = math.Clamp(tonumber(newvalue) or 0, 0, 255)
end)

>>>>>>> Stashed changes
GM.ThirdPersonKnockdown = CreateClientConVar("zs_thirdpersonknockdown", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_thirdpersonknockdown", function(cvar, oldvalue, newvalue)
	GAMEMODE.ThirdPersonKnockdown = tonumber(newvalue) == 1
end)

GM.SuicideOnChangeClass = CreateClientConVar("zs_suicideonchange", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_suicideonchange", function(cvar, oldvalue, newvalue)
	GAMEMODE.SuicideOnChangeClass = tonumber(newvalue) == 1
end)

GM.BeatsEnabled = CreateClientConVar("zs_beats", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_beats", function(cvar, oldvalue, newvalue)
	GAMEMODE.BeatsEnabled = tonumber(newvalue) == 1
end)

GM.DamageNumberThroughWalls = CreateClientConVar("zs_damagefloaterswalls", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_damagefloaterswalls", function(cvar, oldvalue, newvalue)
	GAMEMODE.DamageNumberThroughWalls = tonumber(newvalue) == 1
end)

GM.BeatsVolume = math.Clamp(CreateClientConVar("zs_beatsvolume", 80, true, false):GetInt(), 0, 100) / 100
cvars.AddChangeCallback("zs_beatsvolume", function(cvar, oldvalue, newvalue)
	GAMEMODE.BeatsVolume = math.Clamp(tonumber(newvalue) or 0, 0, 100) / 100
end)

GM.CrosshairLines = math.Clamp(CreateClientConVar("zs_crosshairlines", 4, true, false):GetInt(), 2, 8)
cvars.AddChangeCallback("zs_crosshairlines", function(cvar, oldvalue, newvalue)
	GAMEMODE.CrosshairLines = math.Clamp(tonumber(newvalue) or 4, 2, 8)
end)

GM.CrosshairOffset = math.Clamp(CreateClientConVar("zs_crosshairoffset", 0, true, false):GetInt(), 0, 90)
cvars.AddChangeCallback("zs_crosshairoffset", function(cvar, oldvalue, newvalue)
	GAMEMODE.CrosshairOffset = math.Clamp(tonumber(newvalue) or 0, 0, 90)
end)

GM.NewHud = CreateClientConVar("zs_newhud_inv", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_newhud_inv", function(cvar, oldvalue, newvalue)
	GAMEMODE.NewHud = newvalue == "1"
end)

GM.CrosshairThickness = math.Clamp(CreateClientConVar("zs_crosshairthickness", 1, true, false):GetFloat(), 0.5, 2)
cvars.AddChangeCallback("zs_crosshairthickness", function(cvar, oldvalue, newvalue)
	GAMEMODE.CrosshairThickness = math.Clamp(tonumber(newvalue) or 1, 0.5, 2)
end)

GM.PropRotationSensitivity = math.Clamp(CreateClientConVar("zs_proprotationsens", 1, true, false):GetFloat(), 0.1, 8)
cvars.AddChangeCallback("zs_proprotationsens", function(cvar, oldvalue, newvalue)
	GAMEMODE.PropRotationSensitivity = math.Clamp(tonumber(newvalue) or 1, 0.1, 12)
end)

GM.PropRotationSnap = math.Clamp(CreateClientConVar("zs_proprotationsnap", 0, true, false):GetInt(), 0, 90)
cvars.AddChangeCallback("zs_proprotationsnap", function(cvar, oldvalue, newvalue)
	GAMEMODE.PropRotationSnap = math.Clamp(tonumber(newvalue) or 0, 0, 90)
end)

GM.DamageNumberScale = math.Clamp(CreateClientConVar("zs_dmgnumberscale", 1, true, false):GetFloat(), 0.5, 2)
cvars.AddChangeCallback("zs_dmgnumberscale", function(cvar, oldvalue, newvalue)
	GAMEMODE.DamageNumberScale = math.Clamp(tonumber(newvalue) or 1, 0.5, 2)
end)

GM.DamageNumberSpeed = math.Clamp(CreateClientConVar("zs_dmgnumberspeed", 1, true, false):GetFloat(), 0, 5)
cvars.AddChangeCallback("zs_dmgnumberspeed", function(cvar, oldvalue, newvalue)
	GAMEMODE.DamageNumberSpeed = math.Clamp(tonumber(newvalue) or 1, 0, 5)
end)

GM.DamageNumberLifetime = math.Clamp(CreateClientConVar("zs_dmgnumberlife", 1, true, false):GetFloat(), 0.2, 1.5)
cvars.AddChangeCallback("zs_dmgnumberlife", function(cvar, oldvalue, newvalue)
	GAMEMODE.DamageNumberLifetime = math.Clamp(tonumber(newvalue) or 1, 0.2, 1.5)
end)

GM.InterfaceSize = math.Clamp(CreateClientConVar("zs_interfacesize", 1, true, false):GetFloat(), 0.7, 1.5)
cvars.AddChangeCallback("zs_interfacesize", function(cvar, oldvalue, newvalue)
	if not GAMEMODE.EmptyCachedFontHeights then return end --???

	GAMEMODE.InterfaceSize = math.Clamp(tonumber(newvalue) or 1, 0.7, 1.5)

	GAMEMODE:CreateScalingFonts()
	GAMEMODE:EmptyCachedFontHeights()

	local screenscale = BetterScreenScale()

	GAMEMODE.HealthHUD:InvalidateLayout()

	GAMEMODE.GameStatePanel:InvalidateLayout()
	GAMEMODE.GameStatePanel:SetSize(screenscale * 420, screenscale * 110)

	GAMEMODE.TopNotificationHUD:InvalidateLayout()
	GAMEMODE.CenterNotificationHUD:InvalidateLayout()
	GAMEMODE.XPHUD:InvalidateLayout()
	GAMEMODE.StatusHUD:InvalidateLayout()

	GAMEMODE.ArsenalInterface = nil

	GAMEMODE:ScoreboardRebuild()
end)

GM.AlwaysShowNails = CreateClientConVar("zs_alwaysshownails", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_alwaysshownails", function(cvar, oldvalue, newvalue)
	GAMEMODE.AlwaysShowNails = tonumber(newvalue) == 1
end)

GM.AlwaysQuickBuy = CreateClientConVar("zs_alwaysquickbuy", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_alwaysquickbuy", function(cvar, oldvalue, newvalue)
	GAMEMODE.AlwaysQuickBuy = tonumber(newvalue) == 1
end)

GM.NoIronsights = CreateClientConVar("zs_noironsights", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_noironsights", function(cvar, oldvalue, newvalue)
	GAMEMODE.NoIronsights = tonumber(newvalue) == 1
end)
GM.NoStyle = CreateClientConVar("zs_ultrakill_style", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_ultrakill_style", function(cvar, oldvalue, newvalue)
	GAMEMODE.NoStyle = tonumber(newvalue) == 1
end)
GM.NoCrosshairRotate = CreateClientConVar("zs_nocrosshairrotate", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_nocrosshairrotate", function(cvar, oldvalue, newvalue)
	GAMEMODE.NoCrosshairRotate = tonumber(newvalue) == 1
end)

GM.HideViewModels = CreateClientConVar("zs_hideviewmodels", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_hideviewmodels", function(cvar, oldvalue, newvalue)
	GAMEMODE.HideViewModels = tonumber(newvalue) == 1
end)

GM.TransparencyRadiusMax = 2048
GM.TransparencyRadius = 0

GM.TransparencyRadius1p = math.Clamp(CreateClientConVar("zs_transparencyradius", 140, true, false):GetInt(), 0, GM.TransparencyRadiusMax) ^ 2
cvars.AddChangeCallback("zs_transparencyradius", function(cvar, oldvalue, newvalue)
	GAMEMODE.TransparencyRadius1p = math.Clamp(tonumber(newvalue) or 0, 0, GAMEMODE.TransparencyRadiusMax) ^ 2
end)

GM.TransparencyRadius3p = math.Clamp(CreateClientConVar("zs_transparencyradius3p", 140, true, false):GetInt(), 0, GM.TransparencyRadiusMax) ^ 2
cvars.AddChangeCallback("zs_transparencyradius3p", function(cvar, oldvalue, newvalue)
	GAMEMODE.TransparencyRadius3p = math.Clamp(tonumber(newvalue) or 0, 0, GAMEMODE.TransparencyRadiusMax) ^ 2
end)

GM.MovementViewRoll = CreateClientConVar("zs_movementviewroll", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_movementviewroll", function(cvar, oldvalue, newvalue)
	GAMEMODE.MovementViewRoll = tonumber(newvalue) == 1
end)

GM.MessageBeaconShow = CreateClientConVar("zs_messagebeaconshow", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_messagebeaconshow", function(cvar, oldvalue, newvalue)
	GAMEMODE.MessageBeaconShow = tonumber(newvalue) == 1
end)
GM.SnowShow = CreateClientConVar("zs_showsnow", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_showsnow", function(cvar, oldvalue, newvalue)
	GAMEMODE.SnowShow = tonumber(newvalue) == 1
end)

GM.WeaponHUDMode = CreateClientConVar("zs_weaponhudmode", "0", true, false):GetInt()
cvars.AddChangeCallback("zs_weaponhudmode", function(cvar, oldvalue, newvalue)
	GAMEMODE.WeaponHUDMode = tonumber(newvalue) or 0
end)

GM.HealthTargetDisplay = CreateClientConVar("zs_healthtargetdisplay", "0", true, false):GetInt()
cvars.AddChangeCallback("zs_healthtargetdisplay", function(cvar, oldvalue, newvalue)
	GAMEMODE.HealthTargetDisplay = tonumber(newvalue) or 0
end)

GM.DrawPainFlash = CreateClientConVar("zs_drawpainflash", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_drawpainflash", function(cvar, oldvalue, newvalue)
	GAMEMODE.DrawPainFlash = tonumber(newvalue) == 1
end)

GM.ShowDeployableInfo = CreateClientConVar("zs_show_deployable_info", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_show_deployable_info", function(cvar, oldvalue, newvalue)
	GAMEMODE.ShowDeployableInfo = tonumber(newvalue) == 1
end)

GM.DisplayXPHUD = CreateClientConVar("zs_drawxp", "1", true, false):GetBool()
cvars.AddChangeCallback("zs_drawxp", function(cvar, oldvalue, newvalue)
	GAMEMODE.DisplayXPHUD = tonumber(newvalue) == 1
	gamemode.Call("EvaluateFilmMode")
end)

GM.FontEffects = CreateClientConVar("zs_fonteffects", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_fonteffects", function(cvar, oldvalue, newvalue)
	GAMEMODE.FontEffects = tonumber(newvalue) == 1
end)

GM.HidePacks = CreateClientConVar("zs_hidepacks", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_hidepacks", function(cvar, oldvalue, newvalue)
	GAMEMODE.HidePacks = tonumber(newvalue) == 1
end)

GM.AlwaysDrawFriend = CreateClientConVar("zs_showfriends", "0", true, false):GetBool()
cvars.AddChangeCallback("zs_showfriends", function(cvar, oldvalue, newvalue)
	GAMEMODE.AlwaysDrawFriend = tonumber(newvalue) == 1
end)

CreateConVar( "cl_playercolor", "0.24 0.34 0.41", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "The value is a Vector - so between 0-1 - not between 0-255" )
CreateConVar( "cl_weaponcolor", "0.30 1.80 2.10", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "The value is a Vector - so between 0-1 - not between 0-255" )
CreateConVar( "prop_obj_sigil", "0.30 1.80 2.10", { FCVAR_ARCHIVE, FCVAR_USERINFO }, "The value is a Vector - so between 0-1 - not between 0-255" )

GM.BeatSetHuman = CreateClientConVar("zs_beatset_human", "default", true, false):GetString()
cvars.AddChangeCallback("zs_beatset_human", function(cvar, oldvalue, newvalue)
	newvalue = tostring(newvalue)
	if newvalue == "default" then
		GAMEMODE.BeatSetHuman = GAMEMODE.BeatSetHumanDefault
	else
		GAMEMODE.BeatSetHuman = newvalue
	end
end)
if GM.BeatSetHuman == "default" then
	GM.BeatSetHuman = GM.BeatSetHumanDefault
end

GM.BeatSetZombie = CreateClientConVar("zs_beatset_zombie", "default", true, false):GetString()
cvars.AddChangeCallback("zs_beatset_zombie", function(cvar, oldvalue, newvalue)
	newvalue = tostring(newvalue)
	if newvalue == "default" then
		GAMEMODE.BeatSetZombie = GAMEMODE.BeatSetZombieDefault
	else
		GAMEMODE.BeatSetZombie = newvalue
	end
end)
if GM.BeatSetZombie == "default" then
	GM.BeatSetZombie = GM.BeatSetZombieDefault
end

