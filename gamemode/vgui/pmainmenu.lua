local function HelpMenuPaint(self)
	Derma_DrawBackgroundBlur(self, self.Created)
	Derma_DrawBackgroundBlur(self, self.Created)
end

local pPlayerModel
local function SwitchPlayerModel(self)
	surface.PlaySound("buttons/button14.wav")
	RunConsoleCommand("cl_playermodel", self.m_ModelName)
	chat.AddText(COLOR_LIMEGREEN, translate.Get("models_changed_to")..tostring(self.m_ModelName))

	pPlayerModel:Close()
end
function MakepPlayerModel()
	if pPlayerModel and pPlayerModel:IsValid() then pPlayerModel:Remove() end

	PlayMenuOpenSound()

	local numcols = 8
	local wid = numcols * 68 + 24
	local hei = 400

	pPlayerModel = vgui.Create("DFrame")
	pPlayerModel:SetSkin("Default")
	pPlayerModel:SetTitle(translate.Get("mm_player_m_select"))
	pPlayerModel:SetSize(wid, hei)
	pPlayerModel:Center()
	pPlayerModel:SetDeleteOnClose(true)

	local list = vgui.Create("DPanelList", pPlayerModel)
	list:StretchToParent(8, 24, 8, 8)
	list:EnableVerticalScrollbar()

	local grid = vgui.Create("DGrid", pPlayerModel)
	grid:SetCols(numcols)
	grid:SetColWide(68)
	grid:SetRowHeight(68)

	for name, mdl in pairs(player_manager.AllValidModels()) do
		local button = vgui.Create("SpawnIcon", grid)
		button:SetPos(0, 0)
		button:SetModel(mdl)
		button.m_ModelName = name
		button.OnMousePressed = SwitchPlayerModel
		grid:AddItem(button)
	end
	grid:SetSize(wid - 16, math.ceil(table.Count(player_manager.AllValidModels()) / numcols) * grid:GetRowHeight())

	list:AddItem(grid)

	pPlayerModel:SetSkin("Default")
	pPlayerModel:MakePopup()
end

function MakepPlayerColor()
	if pPlayerColor and pPlayerColor:IsValid() then pPlayerColor:Remove() end

	PlayMenuOpenSound()

	pPlayerColor = vgui.Create("DFrame")
	pPlayerColor:SetWide(math.min(ScrW(), 500))
	pPlayerColor:SetTitle(" ")
	pPlayerColor:SetDeleteOnClose(true)

	local y = 8

	local label = EasyLabel(pPlayerColor, translate.Get("mm_color"), "ZSHUDFont", color_white)
	label:SetPos((pPlayerColor:GetWide() - label:GetWide()) / 2, y)
	y = y + label:GetTall() + 8

	local lab = EasyLabel(pPlayerColor, translate.Get("mm_player_color"))
	lab:SetPos(8, y)
	y = y + lab:GetTall()

	local colpicker = vgui.Create("DColorMixer", pPlayerColor)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker.UpdateConVars = function(me, color)
		me.NextConVarCheck = SysTime() + 0.2
		RunConsoleCommand("cl_playercolor", color.r / 100 .." ".. color.g / 100 .." ".. color.b / 100)
	end
	local r, g, b = string.match(GetConVar("cl_playercolor"):GetString(), "(%g+) (%g+) (%g+)")
	if r then
		colpicker:SetColor(Color(r * 100, g * 100, b * 100))
	end
	colpicker:SetSize(pPlayerColor:GetWide() - 16, 72)
	colpicker:SetPos(8, y)
	y = y + colpicker:GetTall()

	lab = EasyLabel(pPlayerColor, translate.Get("mm_weapon_color"))
	lab:SetPos(8, y)
	y = y + lab:GetTall()

	colpicker = vgui.Create("DColorMixer", pPlayerColor)
	colpicker:SetAlphaBar(false)
	colpicker:SetPalette(false)
	colpicker.UpdateConVars = function(me, color)
		me.NextConVarCheck = SysTime() + 0.2
		RunConsoleCommand("cl_weaponcolor", color.r / 100 .." ".. color.g / 100 .." ".. color.b / 100)
	end
	r, g, b = string.match(GetConVar("cl_weaponcolor"):GetString(), "(%g+) (%g+) (%g+)")
	if r then
		colpicker:SetColor(Color(r * 100, g * 100, b * 100))
	end
	colpicker:SetSize(pPlayerColor:GetWide() - 16, 72)
	colpicker:SetPos(8, y)
	y = y + colpicker:GetTall()

	pPlayerColor:SetTall(y + 8)
	pPlayerColor:Center()
	pPlayerColor:MakePopup()
end

function GM:ShowHelp()
	if self.HelpMenu and self.HelpMenu:IsValid() then
		self.HelpMenu:Remove()
	end

	PlayMenuOpenSound()

	local screenscale = BetterScreenScale()
	local menu = vgui.Create("Panel")
	menu:SetSize(screenscale * 420, ScrH())
	menu:Center()
	menu.Paint = HelpMenuPaint
	menu.Created = SysTime()

	local header = EasyLabel(menu, self.Name, "ZSHUDFont")
	header:SetContentAlignment(8)
	header:DockMargin(0, ScrH() * 0.25, 0, 64)
	header:Dock(TOP)

	local buttonhei = 32 * screenscale

	local but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_help"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepHelp() end

	local challenges = vgui.Create("DButton", menu)
	challenges:SetFont("ZSHUDFontSmaller")
	challenges:SetText(translate.Get("mm_challenges"))
	challenges:SetTall(buttonhei)
	challenges:DockMargin(0, 0, 0, 12)
	challenges:DockPadding(0, 12, 0, 12)
	challenges:Dock(TOP)
	challenges.DoClick = function() GAMEMODE:ZSChallenges() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_player_m_select"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepPlayerModel() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_player_color"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepPlayerColor() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_options"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepOptions() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_w_base"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepWeapons() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_s_base"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepStatuss() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_skills"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() GAMEMODE:ToggleSkillWeb() end


--[[	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_skillsz"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() GAMEMODE:ToggleZSkillWeb() end]]

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_zs_v"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() MakepCredits() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_stats"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 0, 0, 12)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() GAMEMODE:Stats() end

	but = vgui.Create("DButton", menu)
	but:SetFont("ZSHUDFontSmaller")
	but:SetText(translate.Get("mm_close"))
	but:SetTall(buttonhei)
	but:DockMargin(0, 24, 0, 0)
	but:DockPadding(0, 12, 0, 12)
	but:Dock(TOP)
	but.DoClick = function() menu:Remove() end

	menu:MakePopup()
end
local exlude = {8,6,16,22,27,30,31,34,118,114,113,101,40,41,43,92,117,116,56,59,63,65,66,98,72,73,79,88 ,78,120,57,58,124,125,128}
local exlude2 = {121,122,32,108,103,91,90}
function GM:Stats()
	if pMakepStats and pMakepStats:IsValid() then
		pMakepStats:Remove()
	end
	MakepStats()
end
local function DoStats(self, list, neg)
	for k,v in pairs(list:GetItems()) do 
		v:Remove()
	end
	local updatetbl = table.ToAssoc(MySelf:GetActiveSkills())
	for i=1,#GAMEMODE.SkillModifierFunctions do
		local i = i or 1
		local remove = false
		local skillmodifiers = {}
		local gm_modifiers = GAMEMODE.SkillModifiers
		for skillid in pairs(updatetbl)  do
			modifiers = gm_modifiers[skillid]
			if modifiers then
				for modid, amount in pairs(modifiers) do
					skillmodifiers[modid] = (skillmodifiers[modid] or 0) + amount
				end
			end
		end
		local d = vgui.Create("DEXChangingLabel", bottom)
		if neg and (skillmodifiers[i] or 0) == 0 then d:Remove() continue end
		local c = skillmodifiers[i] or 0
		if i >= 6 and !table.HasValue(exlude2, i) then
			c = (c*100).."%"
		end
		if (skillmodifiers[i] or 0) > 0 then
			c = "+"..c
		end
		local colorred = table.HasValue(exlude, i) and Color(71,231,119) or Color(238,37,37)
		local colorgreen = table.HasValue(exlude, i) and Color(238,37,37) or Color(71,231,119)
		d:SetChangeFunction(function()
			return translate.Format("skillmod_n"..i,c)
		end, true)
		d:SetChangedFunction(function()
			if (skillmodifiers[i] or 0) < 0 then
				d:SetTextColor(colorred)
			elseif (skillmodifiers[i] or 0) > 0 then
				d:SetTextColor(colorgreen)
			else
				
				d:SetTextColor(Color(255,255,255))
			end
		end)
		local notbl = {10,107,71,75,82,86,87}
		d:SetFont("DefaultFont")
		if !table.HasValue(notbl,i) then
			list:AddItem(d) 
		end
		if table.HasValue(notbl,i) then
			d:Remove()
		end
	end
end
function MakepStats()
	PlayMenuOpenSound()

	if pMakepStats and pMakepStats:IsValid() then
		pMakepStats:Remove()
		pMakepStats = nil
	end
	local g = true
	local p = "only_changes"
	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 800)
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	pMakepStats = Window

	local y = 8


	local label = EasyLabel(Window, translate.Get("pe_another"), "ZSScoreBoardTitle", color_white)
	label:SetPos(wide * 0.5 - label:GetWide() * 0.5, y)
	y = y + label:GetTall() + 8

	local list = vgui.Create("DPanelList", pMakepStats)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)
	
	but = vgui.Create("DButton", list)
	but:SetFont("ZSHUDFontTiniest")
	but:SetText(translate.Get(p))
	but:SizeToContents()
	but:Dock(BOTTOM)
	but:SetTall(26)
	but:DockMargin(0, 0, 0, 0)
	but:DockPadding(0, 0, 0, 0)
	but:Dock(TOP)
	but.DoClick = function()  if g then DoStats(self,list,true) g = !g but:SetText(translate.Get("only_all")) else  DoStats(self,list) g = !g but:SetText(translate.Get(p)) end end
	
	DoStats(self,list)

--EasyLabel(parent, text, font, textcolor)

	Window:SetAlpha(0)
	Window:AlphaTo(255, 0.15, 0)
	Window:MakePopup()
	return Window
end
