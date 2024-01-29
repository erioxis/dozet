local function ScrapLabelThink(self)
	local scrap = MySelf:GetAmmoCount("scrap")
	if self.m_LastScrap ~= scrap then
		self.m_LastScrap = scrap

		self:SetText(translate.Get("rem_cost_i_u")..scrap)
		self:SizeToContents()
	end
end

local function SelectedInv()
	return GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu.SelInv
end

local function DismantleClick()
	Derma_Query("Dismantle weapon? This cannot be reversed.", "Confirm Dissassembling Weapon",
	"Dismantle", function()
		RunConsoleCommand("zs_dismantle", SelectedInv())

		GAMEMODE.DronesMenu:Close()
		GAMEMODE.DronesMenu = nil
	end,
	"Cancel", function()
	end)
end

hook.Add("Think", "DronesMenuMenuThink", function()
	local pan = GAMEMODE.DronesMenu
	if pan and pan:IsValid() and pan:IsVisible() then
		local mx, my = gui.MousePos()
		local x, y = pan:GetPos()
		if mx < x - 16 or my < y - 16 or mx > x + pan:GetWide() + 16 or my > y + pan:GetTall() + 16 then
			pan:SetVisible(false)
		end
	end
end)

local function RemantlerCenterMouse(self)
	local x, y = self:GetPos()
	local w, h = self:GetSize()
	gui.SetMousePos(x + w / 2, y + h / 2)
end

-- Miniature version of the skill tree code
local PANEL = {}
local hovquality
local hovbranch

AccessorFunc( PANEL, "vCamPos",			"CamPos" )
AccessorFunc( PANEL, "fFOV",			"FOV" )
AccessorFunc( PANEL, "vLookatPos",		"LookAt" )
AccessorFunc( PANEL, "aLookAngle",		"LookAng" )
AccessorFunc( PANEL, "colAmbientLight",	"AmbientLight" )

PANEL.CreationTime = 0

function PANEL:Init()
	local node
	local screenscale = BetterScreenScale()
	self:DockMargin(0, 0, 0, 0)
	self:DockPadding(0, 0, 0, 0)
	self:Dock(FILL)
	self:InvalidateLayout()
end

function PANEL:PerformLayout()
	local screenscale = BetterScreenScale()

	self.Top:AlignTop(4)
	self.Top:CenterHorizontal()

	self.Bottom:AlignBottom(10 * screenscale)
	self.Bottom:CenterHorizontal()
end

function PANEL:SetDirectionalLight(iDirection, color)
end
function PANEL:Paint(w, h)
	return true
end

net.Receive("zs_remantleconf_v2", function()
	if not (GAMEMODE.DronesMenu and GAMEMODE.DronesMenu:IsValid() and hovquality and hovbranch) then return end
end)

function PANEL:OnMousePressed(mc)
end

vgui.Register("ZSRemantlePathDrones", PANEL, "Panel")

function GM:OpenDroneMenu(remantler)
	if not (remantler and remantler:IsValid()) or (self.DronesMenu and self.DronesMenu:IsVisible()) then return end
	local mytarget = remantler:GetDTEntity(11)

	if self.DronesMenu and self.DronesMenu:IsValid() and self.DronesMenu.m_WepClass == mytarget then
		self.DronesMenu:SetVisible(true)
		self.DronesMenu:CenterMouse()
		return
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 1000) * screenscale, math.min(ScrH(), 800) * screenscale
	local tabhei = 24 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:Center()
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)
	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end
	frame.CenterMouse = RemantlerCenterMouse
	self.DronesMenu = frame

	frame.m_Remantler = remantler
	frame.m_WepClass = mytarget




	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)

	local title = EasyLabel(topspace, translate.Get("weapon_drone_station"), "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()
	local subtitle = EasyLabel(topspace,  translate.Get("rem_drones_d"), "ZSHUDFontTiny", COLOR_WHITE)
	subtitle:CenterHorizontal()
	subtitle:MoveBelow(title, 4)

	local _, y = subtitle:GetPos()
	topspace:SetTall(y + subtitle:GetTall() + 4)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()

	local bottomspace = vgui.Create("DPanel", frame)
	bottomspace:SetWide(topspace:GetWide())

	local pointslabel = EasyLabel(bottomspace, translate.Get("rem_cost_i_u").."0", "ZSHUDFontTiny", COLOR_GREEN)
	pointslabel:AlignTop(4)
	pointslabel:AlignLeft(8)
	pointslabel.Think = ScrapLabelThink

	local lab = EasyLabel(bottomspace, translate.Get("rep_dis_we"), "ZSHUDFontTiny")
	lab:AlignTop(4)
	lab:AlignRight(4)
	frame.m_AdviceLabel = lab

	_, y = lab:GetPos()
	bottomspace:SetTall(y + lab:GetTall() + 4)
	bottomspace:AlignBottom(8)
	bottomspace:CenterHorizontal()

	local __, topy = topspace:GetPos()
	local ___, boty = bottomspace:GetPos()

	local remprop = vgui.Create("DPropertySheet", frame)
	remprop:SetSize(wid - 8, boty - topy - 8 - topspace:GetTall())
	remprop:MoveBelow(topspace, 4)
	remprop:CenterHorizontal()
	remprop.Paint = function() end
	remprop:SetPadding(0)

	local trinketsframe = vgui.Create("DPanel")
	sheet = remprop:AddSheet(translate.Get("rem_t_modules"),  trinketsframe, GAMEMODE.ItemCategoryIcons[ITEMCAT_MODULES], false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	trinketsframe:SetSize(wid - 16, boty - topy - 8 - topspace:GetTall())
	trinketsframe:SetPaintBackground(false)
	frame.TrinketsFrame = trinketsframe


	local subpropertysheet
		local curframe = trinketsframe

			local tabpane = vgui.Create("DPanel", curframe)
			--tabpane.Paint = function() end
			tabpane.Grids = {}
			tabpane.Buttons = {}
			tabpane:SetSize(curframe:GetWide(), curframe:GetTall())

			local offset = 72 * screenscale
			local itemframe = vgui.Create("DScrollPanel", tabpane)
			itemframe:SetSize(curframe:GetWide(), curframe:GetTall() - offset - 32)
			itemframe:SetPos(0, offset)

			local mkgrid = function()
				local list = vgui.Create("DGrid", itemframe)
				list:SetPos(0, 0)
				list:SetSize(curframe:GetWide() - 312, curframe:GetTall())
				list:SetCols(2)
				list:SetColWide(280 * screenscale)
				list:SetRowHeight(64 * screenscale)

				return list
			end

			local subcats = GAMEMODE.ItemSubCategories
			local tbn
			for j = 1, #subcats do
				local ispacer = ((j-1) % 4)+1

				tbn = EasyButton(tabpane, subcats[j], 8, 4)
				tbn:SetFont("ZS3D2DFontTiny")
				tbn:SetAlpha(j == 1 and 255 or 70)
				tbn:AlignRight(800 * screenscale - (ispacer - 1) * 120 * screenscale)
				tbn:AlignTop(j <= 4 and 2 or 40)
				tbn:SizeToContents()
				tbn.DoClick = function(me)
					for k, v in pairs(tabpane.Grids) do
						v:SetVisible(k == j)
						tabpane.Buttons[k]:SetAlpha(k == j and 255 or 70)
					end
				end

				tabpane.Grids[j] = mkgrid()
				tabpane.Grids[j]:SetVisible(j == 1)
				tabpane.Buttons[j] = tbn
			end

			for j, tab in ipairs(GAMEMODE.Items) do
				if tab.PointShop and tab.Category == ITEMCAT_MODULES then
					self:AddShopItem(tabpane.Grids[tab.SubCategory], j, tab, false, true)
				end
			end
	frame.m_SubProp = subpropertysheet


	self:CreateItemInfoViewer(trinketsframe, frame, topspace, bottomspace, MENU_REMANTLER)

	local scroller = remprop:GetChildren()[1]
	local dragbase = scroller:GetChildren()[1]
	local tabs = dragbase:GetChildren()

	self:ConfigureMenuTabs(tabs, tabhei)


	frame:MakePopup()
	frame:CenterMouse()
end
