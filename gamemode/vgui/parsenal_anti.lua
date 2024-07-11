local function pointslabelThink(self)
	local points = MySelf:GetPoints()
	if self.m_LastPoints ~= points then
		self.m_LastPoints = points

		self:SetText(translate.Get("spendpoints")..points)
		self:SizeToContents()
	end
end

hook.Add("Think", "AntiArsenalMenuThink", function()
	local pan = GAMEMODE.AArsenalInterface
	if pan and pan:IsValid() and pan:IsVisible() then
		local mx, my = gui.MousePos()
		local x, y = pan:GetPos()
		if mx < x - 16 or my < y - 16 or mx > x + pan:GetWide() + 16 or my > y + pan:GetTall() + 16 then
			pan:SetVisible(false)
		end
	end
end)


local function ArsenalMenuCenterMouse(self)
	local x, y = self:GetPos()
	local w, h = self:GetSize()
	gui.SetMousePos(x + w / 2, y + h / 2)
end


local function CanBuy(item, pan)
	if item.NoClassicMode and GAMEMODE:IsClassicMode() then
		return false
	end

	if item.Tier and GAMEMODE.LockItemTiers and not GAMEMODE.ZombieEscape and not GAMEMODE.ObjectiveMap and not GAMEMODE:IsClassicMode() then
		if not GAMEMODE:GetWaveActive() then -- We can buy during the wave break before hand.
			if GAMEMODE:GetWave() + 1 < item.Tier then
				return false
			end
		elseif GAMEMODE:GetWave() < item.Tier then
			return false
		end
	end

	if item.MaxStock and not GAMEMODE:HasItemStocks(item.Signature) then
		return false
	end
	if not pan.NoPoints and MySelf:GetPoints() < math.ceil(item.Price) then
		return false
	elseif pan.NoPoints and MySelf:GetAmmoCount("scrap") < math.ceil(GAMEMODE:PointsToScrap(item.Price * (MySelf.ScrapDiscount or 1))) then
		return false
	end

	return true
end


local function ItemPanelThink(self)
	local itemtab = FindItem(self.ID)
	if itemtab then
		local newstate = CanBuy(itemtab, self)
		if newstate ~= self.m_LastAbleToBuy then
			self.m_LastAbleToBuy = newstate
			if newstate then
				self.NameLabel:SetTextColor(COLOR_WHITE)
				self.NameLabel:InvalidateLayout()
			else
				self.NameLabel:SetTextColor(COLOR_RED)
				self.NameLabel:InvalidateLayout()
			end
		end


		if self.StockLabel then
			local stocks = GAMEMODE:GetItemStocks(self.ID)
			if stocks ~= self.m_LastStocks then
				self.m_LastStocks = stocks

				self.StockLabel:SetText(stocks.." remaining")
				self.StockLabel:SizeToContents()
				self.StockLabel:AlignRight(10)
				self.StockLabel:SetTextColor(stocks > 0 and COLOR_GRAY or COLOR_RED)
				self.StockLabel:InvalidateLayout()
			end
		end
	end
end

local colBG = Color(20, 20, 20)
local function ItemPanelPaint(self, w, h)
	if self.Hovered or self.On then
		local outline
		if self.m_LastAbleToBuy then
			outline = self.Depressed and COLOR_GREEN or COLOR_DARKGREEN
		else
			outline = self.Depressed and COLOR_RED or COLOR_DARKRED
		end

		draw.RoundedBox(8, 0, 0, w, h, outline)
	end

	if self.ShopTabl.SWEP and MySelf:HasInventoryItem(self.ShopTabl.SWEP) then
		draw.RoundedBox(8, 2, 2, w - 4, h - 4, COLOR_RORANGE)
	end

	draw.RoundedBox(2, 4, 4, w - 8, h - 8, colBG)

	return true
end





local function ItemPanelDoClick(self)
	local shoptbl = self.ShopTabl
	local viewer = self.NoPoints and GAMEMODE.RemantlerInterface.TrinketsFrame.Viewer or GAMEMODE.AArsenalInterface.Viewer

	if not shoptbl then return end
	local sweptable = GAMEMODE.ZSInventoryItemData[shoptbl.SWEP] or weapons.Get(shoptbl.SWEP)

	if not sweptable or GAMEMODE.AlwaysQuickBuy then
		RunConsoleCommand("zs_anti_pointsshopbuy", self.ID, self.NoPoints and "scrap")
		return
	end

	for _, v in pairs(self:GetParent():GetChildren()) do
		v.On = false
	end
	self.On = true

	GAMEMODE:SupplyItemViewerDetail(viewer, sweptable, shoptbl)

	local screenscale = BetterScreenScale()
	local canammo = GAMEMODE:HasPurchaseableAmmo(sweptable)

	local purb = viewer.m_PurchaseB
	purb.ID = self.ID

	purb.DoClick = function() RunConsoleCommand("zs_anti_pointsshopbuy", self.ID, self.NoPoints and "scrap") end
	purb:SetPos(canammo and viewer:GetWide() / 4 - viewer:GetWide() / 8 - 20 or viewer:GetWide() / 4, viewer:GetTall() - 64 * screenscale)
	purb:SetVisible(true)

	local purl = viewer.m_PurchaseLabel
	purl:SetPos(purb:GetWide() / 2 - purl:GetWide() / 2, purb:GetTall() * 0.35 - purl:GetTall() * 0.3)
	purl:SetVisible(true)

	local ppurbl = viewer.m_PurchasePrice
	local price = self.NoPoints and math.ceil(GAMEMODE:PointsToScrap(shoptbl.Worth)) or math.ceil(shoptbl.Worth)
	ppurbl:SetText(price .. (self.NoPoints and " Scrap" or " Points"))
	ppurbl:SizeToContents()
	ppurbl:SetPos(purb:GetWide() / 2 - ppurbl:GetWide() / 2, purb:GetTall() * 0.75 - ppurbl:GetTall() * 0.5)
	ppurbl:SetVisible(true)
	ppurbl:Refresh()

	purb = viewer.m_AmmoB
	if canammo then
		purb.AmmoType = GAMEMODE.AmmoToPurchaseNames[sweptable.Primary.Ammo]
		purb.DoClick = function() RunConsoleCommand("zs_anti_pointsshopbuy", "ps_"..purb.AmmoType) end
	end
	purb:SetPos(viewer:GetWide() * (3/4) - purb:GetWide() / 2, viewer:GetTall() - 64 * screenscale)
	purb:SetVisible(canammo)

	purl = viewer.m_AmmoL
	purl:SetPos(purb:GetWide() / 2 - purl:GetWide() / 2, purb:GetTall() * 0.35 - purl:GetTall() * 0.5)
	purl:SetVisible(canammo)

	ppurbl = viewer.m_AmmoPrice
	price = 9
	ppurbl:SetText(price .. " Points")
	ppurbl:SizeToContents()
	ppurbl:SetPos(purb:GetWide() / 2 - ppurbl:GetWide() / 2, purb:GetTall() * 0.75 - ppurbl:GetTall() * 0.5)
	ppurbl:SetVisible(canammo)
end

local function ArsenalMenuThink(self)
end


function GM:AddShopAItem(list, i, tab, issub, nopointshop)
	local screenscale = BetterScreenScale()

	local nottrinkets = tab.Category ~= ITEMCAT_TRINKETS
	local missing_skill = tab.SkillRequirement and not MySelf:IsSkillActive(tab.SkillRequirement)
	local wid = 280

	local itempan = vgui.Create("DButton")
	itempan:SetText("")
	itempan:SetSize(wid * screenscale, (nottrinkets and 100 or 60) * screenscale)
	itempan.ID = tab.Signature or i
	itempan.NoPoints = nopointshop
	itempan.ShopTabl = tab
	itempan.Think = ItemPanelThink
	itempan.Paint = ItemPanelPaint
	itempan.DoClick = ItemPanelDoClick
	itempan.DoRightClick = function()
		local menu = DermaMenu(itempan)
		menu:AddOption(translate.Get("buy"), function() RunConsoleCommand("zs_anti_pointsshopbuy", itempan.ID, itempan.NoPoints and "scrap") end)
		menu:Open()
	end

	list:AddItem(itempan)
	if nottrinkets then
		local mdlframe = vgui.Create("DPanel", itempan)
		mdlframe:SetSize(wid/2 * screenscale, 100/2 * screenscale)
		mdlframe:SetPos(wid/4 * screenscale, 100/5 * screenscale)
		mdlframe:SetMouseInputEnabled(false)
		mdlframe.Paint = function() end

		local kitbl = killicon.Get(GAMEMODE.ZSInventoryItemData[tab.SWEP] and "weapon_zs_craftables" or tab.SWEP or tab.Model)
		if kitbl then
			self:AttachKillicon(kitbl, itempan, mdlframe, tab.Category == ITEMCAT_AMMO, missing_skill)
		elseif tab.Model then
			if tab.Model then
				local mdlpanel = vgui.Create("DModelPanel", mdlframe)
				mdlpanel:SetSize(mdlframe:GetSize())
				mdlpanel:SetModel(tab.Model)
				local mins, maxs = mdlpanel.Entity:GetRenderBounds()
				mdlpanel:SetCamPos(mins:Distance(maxs) * Vector(0.75, 0.75, 0.5))
				mdlpanel:SetLookAt((mins + maxs) / 2)
			end
		end
	end

	if tab.SWEP or tab.Countables then
		local counter = vgui.Create("ItemAmountCounter", itempan)
		counter:SetItemID(i)
	end

	local name = tab.Name or ""
	local namelab = EasyLabel(itempan, name, "ZSHUDFontTiniest", COLOR_WHITE)
	namelab:SetPos(12 * screenscale, itempan:GetTall() * (nottrinkets and 0.8 or 0.7) - namelab:GetTall() * 0.44)
	if missing_skill then
		namelab:SetAlpha(30)
	end
	itempan.NameLabel = namelab

	local alignri = (issub and (220 + 32) or (nopointshop and 32 or 20)) * screenscale

	local pricelabel = EasyLabel(itempan, "", "ZSHUDFontTiny")
	if missing_skill then
		pricelabel:SetTextColor(COLOR_RED)
		pricelabel:SetText(GAMEMODE.Skills[tab.SkillRequirement].Name)
	else
		local points = math.ceil(tab.Price)
		local price = tostring(points)
		if nopointshop then
			price = tostring(math.ceil(self:PointsToScrap(tab.Price * (MySelf.ScrapDiscount or 1))))
		end
		pricelabel:SetText(price..(nopointshop and " Scrap" or " Points"))
	end
	pricelabel:SizeToContents()
	pricelabel:AlignRight(alignri)
		pricelabel:Refresh()

	if tab.MaxStock then
		local stocklabel = EasyLabel(itempan, tab.MaxStock..""..translate.Get("remaining"), "ZSHUDFontTiny")
		stocklabel:SizeToContents()
		stocklabel:AlignRight(alignri)
		stocklabel:SetPos(itempan:GetWide() - stocklabel:GetWide(), itempan:GetTall() * 0.45 - stocklabel:GetTall() * 0.5)
		itempan.StockLabel = stocklabel
	end
	pricelabel:SetPos(
		itempan:GetWide() - pricelabel:GetWide() - 12 * screenscale,
		itempan:GetTall() * (nottrinkets and 0.15 or 0.3) - pricelabel:GetTall() * 0.5
	)

	if missing_skill or tab.NoClassicMode and isclassic or tab.NoZombieEscape and GAMEMODE.ZombieEscape then
		itempan:SetAlpha(160)
	end

	if not nottrinkets and tab.SubCategory then
		local catlabel = EasyLabel(itempan, GAMEMODE.ItemSubCategories[tab.SubCategory], "ZSBodyTextFont")
		catlabel:SizeToContents()
		catlabel:SetPos(10, itempan:GetTall() * 0.3 - catlabel:GetTall() * 0.4)
	end

	return itempan
end

function GM:ConfigureMenuTabs(tabs, tabhei, callback)
	local screenscale = BetterScreenScale()

	for _, tab in pairs(tabs) do
		tab:SetFont(screenscale > 0.85 and "ZSHUDFontTiny" or "DefaultFontAA")
		tab.GetTabHeight = function()
			return tabhei
		end

		tab.PerformLayout = function(me)
			me:ApplySchemeSettings()

			if not me.Image then return end
			me.Image:SetPos(7, me:GetTabHeight()/2 - me.Image:GetTall()/2 + 3)
			me.Image:SetImageColor(Color(255, 255, 255, not me:IsActive() and 155 or 255))
		end
		tab.DoClick = function(me)
			me:GetPropertySheet():SetActiveTab(me)

			if callback then callback(tab) end
		end
	end
end



MENU_POINTSHOPA = 4

function GM:OpenAArsenalMenu()
	if self.AArsenalInterface and self.AArsenalInterface:IsValid() then
		self.AArsenalInterface:SetVisible(true)
		self.AArsenalInterface:CenterMouse()
		self.AArsenalInterface:Refresh()
		return
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 1200) * screenscale, math.min(ScrH(), 800) * screenscale
	local tabhei = 24 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:Center()
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(true)
	frame:Refresh()
	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end
	frame.CenterMouse = ArsenalMenuCenterMouse
	frame.Think = ArsenalMenuThink
	self.AArsenalInterface = frame

	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)

	local title = EasyLabel(topspace, translate.Get("pointshop1"), "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()
	local subtitle = EasyLabel(topspace, "Your little world", "ZSHUDFontTiny", COLOR_WHITE)
	subtitle:CenterHorizontal()
	subtitle:MoveBelow(title, 4)

	local _, y = subtitle:GetPos()
	topspace:SetTall(y + subtitle:GetTall() + 4)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()


	local bottomspace = vgui.Create("DPanel", frame)
	bottomspace:SetWide(topspace:GetWide())

	local pointslabel = EasyLabel(bottomspace, "Points to spend: 0", "ZSHUDFontTiny", COLOR_GREEN)
	pointslabel:AlignTop(4)
	pointslabel:AlignLeft(8)
	pointslabel.Think = pointslabelThink

	local lab = EasyLabel(bottomspace, " ", "ZSHUDFontTiny")
	lab:AlignTop(4)
	lab:AlignRight(4)
	frame.m_SpacerBottomLabel = lab

	_, y = lab:GetPos()
	bottomspace:SetTall(y + lab:GetTall() + 4)
	bottomspace:AlignBottom(8)
	bottomspace:CenterHorizontal()

	local __, topy = topspace:GetPos()
	local ___, boty = bottomspace:GetPos()

	local propertysheet = vgui.Create("DPropertySheet", frame)
	propertysheet:SetSize(wid - 320 * screenscale, boty - topy - 8 - topspace:GetTall())
	propertysheet:MoveBelow(topspace, 4)
	propertysheet:SetPadding(1)
	propertysheet:CenterHorizontal(0.33)
	propertysheet:SetPos(30,12)

	for catid, catname in ipairs(GAMEMODE.ItemCategories) do
		local hasitems = false
		for i, tab in ipairs(GAMEMODE.Items) do
			if tab.Category == catid and tab.PointShop then
				hasitems = true
				break
			end
		end

		if hasitems then
		
			local tabpane = vgui.Create("DPanel", propertysheet)
			tabpane.Paint = function() end
			tabpane.Grids = {}
			tabpane.Buttons = {}

			local usecats = catid == ITEMCAT_GUNS or catid == ITEMCAT_MELEE or catid == ITEMCAT_TRINKETS
			local trinkets = catid == ITEMCAT_TRINKETS
			local offset = 84 * screenscale

			local itemframe = vgui.Create("DScrollPanel", tabpane)
			itemframe:SetSize(propertysheet:GetWide(), propertysheet:GetTall() - (usecats and (32 + offset) or 32))
			itemframe:SetPos(0, usecats and offset or 0)

			local mkgrid = function()
				local list = vgui.Create("DGrid", itemframe)
				list:SetPos(0, 0)
				list:SetSize(propertysheet:GetWide() - 325, propertysheet:GetTall())
				list:SetCols(3)
				list:SetColWide(280 * screenscale)
				list:SetRowHeight((trinkets and 64 or 100) * screenscale)

				return list
			end


			local subcats = GAMEMODE.ItemSubCategories
			if usecats then
				local ind, tbn = 1
				for i = ind, (trinkets and #subcats or 7) do
					local ispacer = trinkets and ((i-1) % 4)+1 or i
					local start = i == (catid == ITEMCAT_GUNS and 2 or ind)
					local trs = translate.Get
					tbn = EasyButton(tabpane, trinkets and subcats[i] or (trs("w_tier") .. i), 1, 8)
					tbn:SetFont(trinkets and "ZSHUDFontSmallest" or "ZSHUDFontSmall")
					tbn:SetAlpha(start and 255 or 70)
					tbn:AlignRight((trinkets and -35 or -15) * screenscale -
						(ispacer - ind) * (ind == 1 and (trinkets and 190 or 110) or 200) * screenscale
					)
					tbn:AlignTop(trinkets and i <= 4 and 0 or trinkets and 32 or 16)
					tbn:SetContentAlignment(8)
					tbn:SizeToContents()
					tbn.DoClick = function(me)
						for k, v in pairs(tabpane.Grids) do
							v:SetVisible(k == i)
							tabpane.Buttons[k]:SetAlpha(k == i and 255 or 70)
						end
					end

					tabpane.Grids[i] = mkgrid()
					tabpane.Grids[i]:SetVisible(start)
					tabpane.Buttons[i] = tbn
				end
			else
				tabpane.Grid = mkgrid()
			end
			local sheet = propertysheet:AddSheet(catname, tabpane, GAMEMODE.ItemCategoryIcons[catid], false, false)
			sheet.Panel:SetPos(50, tabhei + 2)

			for i, tab in ipairs(GAMEMODE.Items) do
				if tab.APointShop and tab.Category == catid then
					self:AddShopAItem(
						trinkets and tabpane.Grids[tab.SubCategory] or tabpane.Grid or tabpane.Grids[tab.Tier or 1],
						i, tab
					)
				end
			end

			local scroller = propertysheet:GetChildren()[1]
			local dragbase = scroller:GetChildren()[1]
			local tabs = dragbase:GetChildren()

			self:ConfigureMenuTabs(tabs, tabhei)
		end
	end

	self:CreateItemInfoViewer(frame, propertysheet, topspace, bottomspace, MENU_POINTSHOPA)

	frame:MakePopup()
	frame:CenterMouse()
end
