function MakepOptions()
	PlayMenuOpenSound()

	if pOptions then
		pOptions:SetAlpha(0)
		pOptions:AlphaTo(255, 0.15, 0)
		pOptions:SetVisible(true)
		pOptions:MakePopup()
		return
	end

	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 800)
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	pOptions = Window

	local y = 8

	local label = EasyLabel(Window, "", "ZSScoreBoardSubTitle", color_white) -- translate.Get("mm_options")
	label:SetPos(wide * 0.5 - label:GetWide() * 0.1, y)
	label:SetZPos(4)
	y = y + label:GetTall() + 8
	local sheet = vgui.Create( "DPropertySheet", Window )
	sheet:Dock( FILL )


	local list = vgui.Create("DPanelList", pOptions)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)
	gamemode.Call("AddExtraOptions", list, Window)

	local list3 = vgui.Create("DPanelList", pOptions)
	list3:EnableVerticalScrollbar()
	list3:EnableHorizontal(false)
	list3:SetSize(wide - 24, tall - y - 12)
	list3:SetPos(12, y)
	list3:SetPadding(8)
	list3:SetSpacing(4)
	gamemode.Call("AddExtraOptions", list3, Window)


	local list2 = vgui.Create("DPanelList", pOptions)
	list2:EnableVerticalScrollbar()
	list2:EnableHorizontal(false)
	list2:SetSize(wide - 24, tall - y - 12)
	list2:SetPos(12, y)
	list2:SetPadding(8)
	list2:SetSpacing(4)
	gamemode.Call("AddExtraOptions", list2, Window)

	local list4 = vgui.Create("DPanelList", pOptions)
	list4:EnableVerticalScrollbar()
	list4:EnableHorizontal(false)
	list4:SetSize(wide - 24, tall - y - 12)
	list4:SetPos(12, y)
	list4:SetPadding(8)
	list4:SetSpacing(4)
	gamemode.Call("AddExtraOptions", list4, Window)


		
	
	local panel2 = vgui.Create( "DPanel", sheet )
	panel2.Paint = function( self, w, h ) list:SetVisible(true) list2:SetVisible(false)	 list3:SetVisible(false) list4:SetVisible(false) end 
	sheet:AddSheet( translate.Get('old_op'), panel2, "icon16/ruby.png" )

	local panel3 = vgui.Create( "DPanel", sheet )
	panel3.Paint = function( self, w, h )  list:SetVisible(false) list2:SetVisible(false) list3:SetVisible(true) list4:SetVisible(false) end 
	sheet:AddSheet( translate.Get('custom_op'), panel3, "icon16/wand.png" )

	local panel1 = vgui.Create( "DPanel", sheet )
	panel1.Paint = function( self, w, h )  list:SetVisible(false) list2:SetVisible(true) list3:SetVisible(false)  list4:SetVisible(false) end 
	sheet:AddSheet( translate.Get('new_op'), panel1, "icon16/box.png" )

	local panel4 = vgui.Create( "DPanel", sheet )
	panel4.Paint = function( self, w, h )  list:SetVisible(false) list2:SetVisible(false) list3:SetVisible(false) list4:SetVisible(true)  end 
	sheet:AddSheet( translate.Get('optim_op'), panel4, "icon16/wrench.png" )




	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_naildisplay"))
	check:SetConVar("zs_alwaysshownails")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_ozu"))
	check:SetConVar("zs_fixthelag")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_knockdown_camera"))
	check:SetConVar("zs_thirdpersonknockdown")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_mge"))
	check:SetConVar("zs_mge_phrases")
	check:SizeToContents()
	list3:AddItem(check)


	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_bezombie"))
	check:SetConVar("zs_alwaysvolunteer")
	check:SizeToContents()
	list:AddItem(check)
	


	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_show_dmgp"))
	check:SetConVar("zs_show_dmg_in_perc")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_d_esc"))
	check:SetConVar("zs_disablecustommenu")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_show_node"))
	check:SetConVar("zs_disablenode")
	check:SizeToContents()
	check:SetTooltip(translate.Get("op_show_node_tool"))
	list2:AddItem(check)

	
	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_ms_mss"))
	check:SetConVar("zs_ms_mss")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_rgb_hp"))
	check:SetConVar("zs_rgb_ura")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_nb_mode"))
	check:SetConVar("zs_nb_mode")
	check:SizeToContents()
	list2:AddItem(check)


	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_adddesc"))
	check:SetTooltip(translate.Get("op_adddesc_ms"))
	check:SetConVar("zs_adddesc")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_voice"))
	check:SetConVar("zs_voice_n")
	check:SizeToContents()
	list2:AddItem(check)



	
	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_show_node"))
	check:SetConVar("zs_disablesprite")
	check:SizeToContents()
	check:SetTooltip(translate.Get("op_show_sprite_tool"))
	list2:AddItem(check)
	
	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(12, 40)
	slider:SetConVar("zs_x_y")
	slider:SetText(translate.Get("op_xy"))
	slider:SizeToContents()
	list3:AddItem(slider)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_alwaysquickbuy"))
	check:SetConVar("zs_alwaysquickbuy")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_suicidechange"))
	check:SetConVar("zs_suicideonchange")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_redeem"))
	check:SetConVar("zs_noredeem")
	check:SizeToContents()
	list:AddItem(check)
	local check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_nodiscord"))
	check:SetConVar("zs_nodiscord")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_deposit"))
	check:SetConVar("zs_nousetodeposit")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_showdeployable"))
	check:SetConVar("zs_show_deployable_info")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_noproppickup"))
	check:SetConVar("zs_nopickupprops")
	check:SizeToContents()
	list:AddItem(check)
	
	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_nolootpickup"))
	check:SetConVar("zs_nopickuploot")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_noironsights"))
	check:SetConVar("zs_noironsights")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_nocrosshairrotate"))
	check:SetConVar("zs_nocrosshairrotate")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_disablescopes"))
	check:SetConVar("zs_disablescopes")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_xpdisplay"))
	check:SetConVar("zs_drawxp")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_nofloatingscore"))
	check:SetConVar("zs_nofloatingscore")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_hidepacks"))
	check:SetConVar("zs_hidepacks")
	check:SizeToContents()
	list2:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_donthidefriends"))
	check:SetConVar("zs_showfriends")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_drawscore"))
	check:SetConVar("zs_ironsightscrosshair")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_musicon"))
	check:SetConVar("zs_beats")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_lhmusic"))
	check:SetConVar("zs_playmusic")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_postprocc"))
	check:SetConVar("zs_postprocessing")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_filmgrain"))
	check:SetConVar("zs_filmgrain")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_colormod"))
	check:SetConVar("zs_colormod")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_painflash"))
	check:SetConVar("zs_drawpainflash")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_fonteffect"))
	check:SetConVar("zs_fonteffects")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_humanaura"))
	check:SetConVar("zs_auras")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_indicators"))
	check:SetConVar("zs_damagefloaters")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_movroll"))
	check:SetConVar("zs_movementviewroll")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_beaconind"))
	check:SetConVar("zs_messagebeaconshow")
	check:SizeToContents()
	list4:AddItem(check)


	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_snow"))
	check:SetConVar("zs_showsnow")
	check:SizeToContents()
	list4:AddItem(check)
	

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_filmmod"))
	check:SetConVar("zs_filmmode")
	check:SizeToContents()
	list3:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_viewmodels"))
	check:SetConVar("zs_hideviewmodels")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_noboss"))
	check:SetConVar("zs_nobosspick")
	check:SizeToContents()
	list:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_dmgindicator_wall"))
	check:SetConVar("zs_damagefloaterswalls")
	check:SizeToContents()
	list4:AddItem(check)
	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_color_c"))
	check:SetConVar("mat_colorcorrection")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_mcore"))
	check:SetConVar("gmod_mcore_test")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_show_e"))
	check:SetConVar("zs_show_e_lol")
	check:SizeToContents()
	list4:AddItem(check)

	check = vgui.Create("DCheckBoxLabel", Window)
	check:SetText(translate.Get("op_1click"))
	check:SetConVar("zs_blockunable")
	check:SizeToContents()
	list3:AddItem(check)




	list3:AddItem(EasyLabel(Window, "Weapon HUD display style", "DefaultFontSmall", color_white))
	local dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Display in 3D")
	dropdown:AddChoice("Display in 2D")
	dropdown:AddChoice("Display both")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_weaponhudmode", value == "Display both" and 2 or value == "Display in 2D" and 1 or 0)
	end
	dropdown:SetText(GAMEMODE.WeaponHUDMode == 2 and "Display both" or GAMEMODE.WeaponHUDMode == 1 and "Display in 2D" or "Display in 3D")
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)

	list3:AddItem(EasyLabel(Window, "Health target display style", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Health|Max Health")
	dropdown:AddChoice("Health amount")
	dropdown:AddChoice("Health %")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_healthtargetdisplay", value == "Health %" and 3 or value == "Health amount" and 1 or 2)
	end
	dropdown:SetText(GAMEMODE.HealthTargetDisplay == 1 and "Health amount" or GAMEMODE.HealthTargetDisplay == 3 and "Health %" or "% of health")
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)

	list3:AddItem(EasyLabel(Window, "ULTRAKILL Style meter(In developing!)", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("None")
	dropdown:AddChoice("YES!")
	dropdown:AddChoice("In work...")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_ultrakill_style", value == "YES!" and 1 or value == "In work..." and 1 or 0)
	end
	dropdown:SetText(GAMEMODE.NoStyle and "NO" or "YES")
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)


	list3:AddItem(EasyLabel(Window, "Font", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice("Open Sans Condensed")
	dropdown:AddChoice("Ghoulish Fright")
	dropdown:AddChoice("PixelMplus10")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_font", value == "Open Sans Condensed" and "Open Sans Condensed" or value == "Ghoulish Fright" and "Ghoulish Fright" or value == "PixelMplus10" and "PixelMplus10" or "Open Sans Condensed")
	end
	dropdown:SetText(GAMEMODE.FontPL or "")
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)

	list:AddItem(EasyLabel(Window, "Prop rotation snap angle", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	dropdown:AddChoice(translate.Get("op_deg_no"))
	dropdown:AddChoice("15 angles")
	dropdown:AddChoice("30 angles")
	dropdown:AddChoice("45 angles")
	dropdown:AddChoice("90 angles")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_proprotationsnap", value == "15 angles" and 15 or value == "30 angles" and 30 or value == "45 angles" and 45 or value == "90 angles" and 90 or value)
	end
	dropdown:SetText(GAMEMODE.PropRotationSnap == 15 and "15"..translate.Get("op_deg")
		or GAMEMODE.PropRotationSnap == 30 and "30"..translate.Get("op_deg")
		or GAMEMODE.PropRotationSnap == 45 and "45"..translate.Get("op_deg")
		or GAMEMODE.PropRotationSnap == 90 and "90"..translate.Get("op_deg")
		or translate.Get("op_deg_no"))
	dropdown:SetTextColor(color_white)
	list:AddItem(dropdown)

	list3:AddItem(EasyLabel(Window, "Human ambient beat set", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	for setname in pairs(GAMEMODE.Beats) do
		if setname ~= GAMEMODE.BeatSetHumanDefualt then
			dropdown:AddChoice(setname)
		end
	end
	dropdown:AddChoice("none")
	dropdown:AddChoice("default")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_beatset_human", value)
	end
	dropdown:SetText(GAMEMODE.BeatSetHuman == GAMEMODE.BeatSetHumanDefault and "default" or GAMEMODE.BeatSetHuman)
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)

	list3:AddItem(EasyLabel(Window, "Zombie ambient beat set", "DefaultFontSmall", color_white))
	dropdown = vgui.Create("DComboBoxEx", Window)
	dropdown:SetMouseInputEnabled(true)
	for setname in pairs(GAMEMODE.Beats) do
		if setname ~= GAMEMODE.BeatSetZombieDefualt then
			dropdown:AddChoice(setname)
		end
	end
	dropdown:AddChoice("none")
	dropdown:AddChoice("default")
	dropdown.OnSelect = function(me, index, value, data)
		RunConsoleCommand("zs_beatset_zombie", value)
	end
	dropdown:SetText(GAMEMODE.BeatSetZombie == GAMEMODE.BeatSetZombieDefault and "default" or GAMEMODE.BeatSetZombie)
	dropdown:SetTextColor(color_white)
	list3:AddItem(dropdown)

	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("zs_sound_volume_wep")
	slider:SetText(translate.Get("op_svolume"))
	slider:SizeToContents()
	list3:AddItem(slider)
	

	
	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(10, 400)
	slider:SetConVar("zs_hp_bar_size")
	slider:SetText(translate.Get("op_hpbar_size"))
	slider:SizeToContents()
	list3:AddItem(slider)-- 300

	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(10, 340)
	slider:SetConVar("zs_ba_bar_size")
	slider:SetText(translate.Get("op_babar_size"))-- 240
	slider:SizeToContents()
	list3:AddItem(slider)
	

	local slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(2, 8)
	slider:SetConVar("zs_crosshairlines")
	slider:SetText("Crosshair lines")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 90)
	slider:SetConVar("zs_crosshairoffset")
	slider:SetText("Crosshair offset")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0.5, 2)
	slider:SetConVar("zs_crosshairthickness")
	slider:SetText("Crosshair thickness")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0.5, 3)
	slider:SetConVar("zs_dmgnumberscale")
	slider:SetText("Damage number size")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 3)
	slider:SetConVar("zs_dmgnumberspeed")
	slider:SetText("Damage number speed")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0.2, 3.5)
	slider:SetConVar("zs_dmgnumberlife")
	slider:SetText("Damage number lifetime")
	slider:SizeToContents()
	list3:AddItem(slider)


	
	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 255)
	slider:SetConVar("zs_alpha_p")
	slider:SetText("Alpha for particles (2)(F3)")
	slider:SizeToContents()
	list3:AddItem(slider)
	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 255)
	slider:SetConVar("zs_alpha_b")
	slider:SetText("Alpha for particles (1)(F3)")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 255)
	slider:SetConVar("zs_bg_alpha")
	slider:SetText("Background alpha for f3")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0, 255)
	slider:SetConVar("zs_filmgrainopacity")
	slider:SetText("Film grain")
	slider:SizeToContents()
	list2:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0.7, 2.6)
	slider:SetConVar("zs_interfacesize")
	slider:SetText("Interface/HUD scale")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(2)
	slider:SetMinMax(0, 1)
	slider:SetConVar("zs_ironsightzoom")
	slider:SetText("Ironsight zoom scale")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 100)
	slider:SetConVar("zs_beatsvolume")
	slider:SetText("Music volume")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(1)
	slider:SetMinMax(0.1, 4)
	slider:SetConVar("zs_proprotationsens")
	slider:SetText("Prop rotation sensitivity")
	slider:SizeToContents()
	list:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, GAMEMODE.TransparencyRadiusMax)
	slider:SetConVar("zs_transparencyradius")
	slider:SetText("Transparency radius")
	slider:SizeToContents()
	list3:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, GAMEMODE.TransparencyRadiusMax)
	slider:SetConVar("zs_transparencyradius3p")
	slider:SetText("Transparency radius in third person")
	slider:SizeToContents()
	list3:AddItem(colpicker)
	list3:AddItem(EasyLabel(Window, "F3 Background Color"))
	local colpicker = vgui.Create("DColorMixer", Window)	
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_bg_col_r")
	colpicker:SetConVarG("zs_bg_col_g")
	colpicker:SetConVarB("zs_bg_col_b")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)
	list3:AddItem(slider)
	list3:AddItem(EasyLabel(Window, "Health Color"))
	local colpicker = vgui.Create("DColorMixer", Window)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_rhealth")
	colpicker:SetConVarG("zs_ghealth")
	colpicker:SetConVarB("zs_bhealth")
	colpicker:SetTall(72)

	list3:AddItem(colpicker)
	list3:AddItem(EasyLabel(Window, "Blood armor color"))
	local colpicker = vgui.Create("DColorMixer", Window)	
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_rblood")
	colpicker:SetConVarG("zs_gblood")
	colpicker:SetConVarB("zs_bblood")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)



	list3:AddItem(EasyLabel(Window, "Crosshair primary color"))
	local colpicker = vgui.Create("DColorMixer", Window)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_crosshair_colr")
	colpicker:SetConVarG("zs_crosshair_colg")
	colpicker:SetConVarB("zs_crosshair_colb")
	colpicker:SetConVarA("zs_crosshair_cola")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(Window, "Crosshair secondary color"))
	colpicker = vgui.Create("DColorMixer", Window)
	colpicker:SetAlphaBar(true)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_crosshair_colr2")
	colpicker:SetConVarG("zs_crosshair_colg2")
	colpicker:SetConVarB("zs_crosshair_colb2")
	colpicker:SetConVarA("zs_crosshair_cola2")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(Window, "Health aura color - Full health"))
	colpicker = vgui.Create("DColorMixer", Window)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_auracolor_full_r")
	colpicker:SetConVarG("zs_auracolor_full_g")
	colpicker:SetConVarB("zs_auracolor_full_b")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	list3:AddItem(EasyLabel(Window, "Health aura color - No health"))
	colpicker = vgui.Create("DColorMixer", Window)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker:SetConVarR("zs_auracolor_empty_r")
	colpicker:SetConVarG("zs_auracolor_empty_g")
	colpicker:SetConVarB("zs_auracolor_empty_b")
	colpicker:SetTall(72)
	list3:AddItem(colpicker)

	Window:SetAlpha(0)
	Window:AlphaTo(255, 0.15, 0)
	Window:MakePopup()
end
