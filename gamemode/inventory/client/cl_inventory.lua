GM.ZSInventory = {}

INVCAT_TRINKETS = 1
INVCAT_COMPONENTS = 2
INVCAT_CONSUMABLES = 3
<<<<<<< Updated upstream
=======
INVCAT_WEAPONS = 4
INVCAT_ETERNAL = 5

>>>>>>> Stashed changes

local meta = FindMetaTable("Player")
function meta:GetInventoryItems()
	return GAMEMODE.ZSInventory
end

function meta:HasInventoryItem(item)
	return GAMEMODE.ZSInventory[item] and GAMEMODE.ZSInventory[item] > 0
end
local strsub = string.sub
function meta:HasInventoryItemQ(item)
	local newi = ""
	local newi2 = ""
	local newi3 = ""
	local newi4 = ""
	local newi5 = ""

	if  strsub(item ,#item-1,#item-1) ~= "q" then
		newi = item.."_q1"
		newi2 = item.."_q2"
		newi3 = item.."_q3"
		newi4 = item.."_q4"
		newi5 = item.."_q5"
	else
		newi = strsub(item ,0,#item-1)..(tonumber(strsub(item ,#item,#item))+1)
		newi2 = strsub(item ,0,#item-1)..(tonumber(strsub(item ,#item,#item))+2)
		newi3 = strsub(item ,0,#item-1)..(tonumber(strsub(item ,#item,#item))+3)
		newi4 = strsub(item ,0,#item-1)..(tonumber(strsub(item ,#item,#item))+4)
		newi5 = strsub(item ,0,#item-1)..(tonumber(strsub(item ,#item,#item))+5)
	end
	local inventory = GAMEMODE.ZSInventory
	return inventory[newi] and inventory[newi] > 0 or  inventory[newi2] and inventory[newi2] > 0 or  inventory[newi3] and inventory[newi3] > 0 or  inventory[newi4] and inventory[newi4] > 0 or  inventory[newi5] and inventory[newi5] > 0
end

net.Receive("zs_inventoryitem", function()
	local item = net.ReadString()
	local count = net.ReadInt(8)
	local prevcount = GAMEMODE.ZSInventory[item] or 0

	GAMEMODE.ZSInventory[item] = count

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		if count > prevcount then
			GAMEMODE:InventoryAddGridItem(item, GAMEMODE:GetInventoryItemType(item))
		else
			GAMEMODE:InventoryRemoveGridItem(item)
		end
	end

	if MySelf and MySelf:IsValid() then
		MySelf:ApplyTrinkets()
	end
end)
<<<<<<< Updated upstream
=======
net.Receive("zs_openbounty", function()
	local items = net.ReadTable()
	GAMEMODE:OpenBounty(items)
end)

>>>>>>> Stashed changes

net.Receive("zs_wipeinventory", function()
	GAMEMODE.ZSInventory = {}

	if GAMEMODE.InventoryMenu and GAMEMODE.InventoryMenu:IsValid() then
		GAMEMODE:InventoryWipeGrid()
	end

	MySelf:ApplyTrinkets()
end)

local function TryCraftWithComponent(me)
	net.Start("zs_trycraft")
		net.WriteString(me.Item)
		net.WriteString(me.WeaponCraft)
	net.SendToServer()
end
<<<<<<< Updated upstream
=======
local function TryGetItemWithComponent(me)
	net.Start("zs_trygetitem")
		net.WriteString(me.Item)
	net.SendToServer()
end
local function ActivateTrinket(me, pl)
	net.Start("zs_activate_trinket")
		net.WriteString(me.Item)
		net.WriteEntity(MySelf)
	net.SendToServer()
end
local function UpgradeTrinket(me, pl)
	local sir = me.Item
	net.Start("zs_upgrade_trinket")
		net.WriteString(sir)
		net.WriteEntity(MySelf)
	net.SendToServer()
	local newi = ""
	if  strsub(sir ,#sir-1,#sir-1) ~= "q" then
		newi = sir.."_q1"
	else
		newi = strsub(sir ,0,#sir-1)..(tonumber(strsub(sir ,#sir,#sir))+1)
	end
	timer.Simple(0, function()	
		for item,v in pairs(GAMEMODE.InventoryMenu.Grids[ GAMEMODE:GetInventoryItemType(newi) ]:GetItems()) do
	
			if newi == v.Item then
				v:DoClick()
			end
		end
	end)
end
local function GiveDroneTrinket(me, pl)
	net.Start("zs_drone_trinket")
		net.WriteString(me.Item)
		net.WriteEntity(MySelf)
	net.SendToServer()
end
>>>>>>> Stashed changes

function GM:ItemPanelDoClick()
	local item = self.Item
	if not item then return end

	local category, sweptable = self.Category
	if category == INVCAT_WEAPONS then
		sweptable = weapons.Get(item)
	else
		sweptable = GAMEMODE.ZSInventoryItemData[item]
	end

	local viewer = GAMEMODE.m_InvViewer
	local screenscale = BetterScreenScale()

	if self.On then
		if viewer and viewer:IsValid() then
			viewer:SetVisible(false)
		end

		self.On = false

		GAMEMODE.InventoryMenu.SelInv = false
		GAMEMODE:DoAltSelectedItemUpdate()
		return
	else
		for _, v in pairs(self:GetParent():GetChildren()) do
			v.On = false
		end
		self.On = true

		GAMEMODE.InventoryMenu.SelInv = item
<<<<<<< Updated upstream
=======
		if category == INVCAT_WEAPONS then 
			local ent
			for k,v in pairs(MySelf:GetWeapons()) do
				if item == v:GetClass() then
					ent = v
					break
				end
			end
			if ent and ent:IsValid() then
				input.SelectWeapon(ent)
			end
			GAMEMODE.InventoryMenu.SelInv = nil
		end
		GAMEMODE.InventoryMenu.Category = category

>>>>>>> Stashed changes
		GAMEMODE:DoAltSelectedItemUpdate()
	end

	GAMEMODE:CreateInventoryInfoViewer()

	viewer = GAMEMODE.m_InvViewer
	viewer.m_Title:SetText(sweptable.PrintName)
	viewer.m_Title:PerformLayout()

	local desctext = sweptable.Description or ""
	if category == INVCAT_WEAPONS then
		viewer.ModelPanel:SetModel(sweptable.WorldModel)
		local mins, maxs = viewer.ModelPanel.Entity:GetRenderBounds()
		viewer.ModelPanel:SetCamPos(mins:Distance(maxs) * Vector(1.15, 0.75, 0.5))
		viewer.ModelPanel:SetLookAt((mins + maxs) / 2)
		viewer.m_VBG:SetVisible(true)

		if sweptable.NoDismantle then
			desctext = desctext .. "\nCannot be dismantled for scrap."
		end

		viewer.m_Desc:MoveBelow(viewer.m_VBG, 8)
		viewer.m_Desc:SetFont("ZSBodyTextFont")

		local canammo = false
		if sweptable.Primary then
			local ammotype = sweptable.Primary.Ammo
			if GAMEMODE.AmmoToPurchaseNames[ammotype] then
				canammo = true
			end
		end

		if canammo and GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)] then
			viewer.m_AmmoType:SetText(GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)])
			viewer.m_AmmoType:PerformLayout()
		else
			viewer.m_AmmoType:SetText("")
		end
	else
		viewer.ModelPanel:SetModel("")
		viewer.m_VBG:SetVisible(false)

		viewer.m_Desc:MoveBelow(viewer.m_Title, 20)
		viewer.m_Desc:SetFont("ZSBodyTextFontBig")

		viewer.m_AmmoType:SetText("")
	end
	viewer.m_Desc:SetText(desctext)

	GAMEMODE:ViewerStatBarUpdate(viewer, category ~= INVCAT_WEAPONS, sweptable)

	for i = 1, 3 do
		local crab, cral = viewer.m_CraftBtns[i][1], viewer.m_CraftBtns[i][2]

		crab:SetVisible(false)
		cral:SetVisible(false)
	end
	local hihi = viewer.m_ActivateButton
	hihi[1]:SetVisible(false)
	hihi[2]:SetVisible(false)
	local clip = viewer.m_ClipButton
	clip[1]:SetVisible(false)
	clip[2]:SetVisible(false)
	local doubled = viewer.m_UpgradeButton
	doubled[1]:SetVisible(false)
	doubled[2]:SetVisible(false)
	local drone = viewer.m_Drones
	drone[1]:SetVisible(false)
	drone[2]:SetVisible(false)
	if sweptable.OnlyDrones then
		local g,bl = doubled[1],doubled[2]
		g.Item = item
		g:SetPos( viewer:GetWide() / 2 - g:GetWide() / 2, ( viewer:GetTall() - 99 * screenscale ) )
		g.DoClick = GiveDroneTrinket
		g:SetVisible(true)
		bl:SetText( translate.Format("give_to_drone"))
		bl:SetFont("ZSBodyTextFont")
		bl:SetPos( g:GetWide() / 2 - bl:GetWide() / 2, ( g:GetTall() * 0.5 - bl:GetTall() * 0.5 ) )
		bl:SetContentAlignment( 5 )
		bl:SetVisible( true )
	end
	if sweptable.Upgradable then
		local g,bl = doubled[1],doubled[2]
		g.Item = item
		g:SetPos( viewer:GetWide() / 2 - g:GetWide() / 2, ( viewer:GetTall() - 99 * screenscale ) )
		g.DoClick = UpgradeTrinket
		g:SetVisible(true)
		if !sweptable.NeedForUpgrade then
			bl:SetText( translate.Format("upgrade_inv",math.Round(GAMEMODE:GetUpgradeScrap(sweptable,(sweptable.QualityTier or 0)+1)*0.65)))
			bl:SetFont("ZSBodyTextFont")
		else
			bl:SetText( translate.Format("upgrade_inv_hard",math.Round(GAMEMODE:GetUpgradeScrap(sweptable,(sweptable.QualityTier or 0)+1)*0.65),GAMEMODE.ZSInventoryItemData[sweptable.NeedForUpgrade].PrintName))
			bl:SetFont("ZS3D2DFontSuperTiny")
		end
		bl:SetPos( g:GetWide() / 2 - bl:GetWide() / 2, ( g:GetTall() * 0.5 - bl:GetTall() * 0.5 ) )
		bl:SetContentAlignment( 5 )
		bl:SetVisible( true )
	end

	local assembles = {}
	for k,v in pairs(GAMEMODE.Assemblies) do
		if v[1] == item then
			assembles[v[2]] = k
		end
	end

	local count = 0
	for k,v in pairs(assembles) do
		count = count + 1

<<<<<<< Updated upstream
		local crab, cral = viewer.m_CraftBtns[count][1], viewer.m_CraftBtns[count][2]
		local iitype = GAMEMODE:GetInventoryItemType(k) ~= -1
=======
		local crab, cral = viewer.m_CraftBtns[ count ][ 1 ], viewer.m_CraftBtns[ count ][ 2 ]
		local iitype = GAMEMODE:GetInventoryItemType( k ) == 4
>>>>>>> Stashed changes

		crab.Item = item
		crab.WeaponCraft = k
		crab.DoClick = TryCraftWithComponent
		crab:SetPos(viewer:GetWide() / 2 - crab:GetWide() / 2, (viewer:GetTall() - 33 * screenscale) - (count - 1) * 33 * screenscale)
		crab:SetVisible(true)

<<<<<<< Updated upstream
		cral:SetText((iitype and GAMEMODE.ZSInventoryItemData[k] or weapons.Get(k)).PrintName)
		cral:SetPos(crab:GetWide() / 2 - cral:GetWide() / 2, (crab:GetTall() * 0.5 - cral:GetTall() * 0.5))
		cral:SetContentAlignment(5)
		cral:SetVisible(true)
=======
		cral:SetText( ( iitype and weapons.Get( k ) or  GAMEMODE.ZSInventoryItemData[ k ]).PrintName )
		cral:SetPos( crab:GetWide() / 2 - cral:GetWide() / 2, ( crab:GetTall() * 0.5 - cral:GetTall() * 0.5 ) )
		cral:SetContentAlignment( 5 )
		cral:SetVisible( true )
>>>>>>> Stashed changes
	end

	if count > 0 then
		viewer.m_CraftWith:SetPos(viewer:GetWide() / 2 - viewer.m_CraftWith:GetWide() / 2, (viewer:GetTall() - 33 * screenscale) - 33 * count * screenscale)
		viewer.m_CraftWith:SetContentAlignment(5)
		viewer.m_CraftWith:SetVisible(true)
	else
		viewer.m_CraftWith:SetVisible(false)
	end
<<<<<<< Updated upstream
=======
	
	if category == INVCAT_CONSUMABLES and MySelf:GetChargesActive() >= (item.BountyNeed or 0) then
		local g,bl = hihi[1],hihi[2]
		viewer.m_Activate.Item = item
		g.Item = item
		g:SetPos( viewer:GetWide() / 2 - g:GetWide() / 2, ( viewer:GetTall() - 66 * screenscale ) )
		g.DoClick = ActivateTrinket
		g:SetVisible(true)

		bl:SetText( translate.Get("activate_inv") )
		bl:SetPos( g:GetWide() / 2 - bl:GetWide() / 2, ( g:GetTall() * 0.5 - bl:GetTall() * 0.5 ) )
		bl:SetContentAlignment( 5 )
		bl:SetVisible( true )

		local g,bl = clip[1],clip[2]
		g:SetPos( viewer:GetWide() / 2 - g:GetWide() / 2, ( viewer:GetTall() - 33 * screenscale ) )
		g.DoClick = function(arguments)
			MySelf.LastClipedTrinket = 	item
		end
		g:SetVisible(true)

		bl:SetText( translate.Get("clip_activate") )
		bl:SetPos( g:GetWide() / 2 - bl:GetWide() / 2, ( g:GetTall() * 0.5 - bl:GetTall() * 0.5 ) )
		bl:SetContentAlignment( 5 )
		bl:SetVisible( true )
		if input.IsMouseDown(MOUSE_RIGHT) then
			viewer.m_Activate.DoClick = ActivateTrinket(viewer.m_Activate,MySelf)
		end
		
		viewer.m_Activate:SetVisible(false)
	end
	if category == INVCAT_WEAPONS then
		GAMEMODE:ViewerStatBarUpdate( viewer, true, sweptable )
	end
	GAMEMODE:SupplyItemViewerDetail( viewer, sweptable, { SWEP = self.Item }, category == INVCAT_WEAPONS )
>>>>>>> Stashed changes
end
local categorycolors = {
<<<<<<< Updated upstream
	[INVCAT_TRINKETS] = {COLOR_RED, COLOR_DARKRED},
	[INVCAT_COMPONENTS] = {COLOR_BLUE, COLOR_DARKBLUE},
	[INVCAT_CONSUMABLES] = {COLOR_YELLOW, COLOR_DARKYELLOW}
}
local colBG = Color(10, 10, 10, 252)
local colBGH = Color(200, 200, 200, 5)
local function ItemPanelPaint(self, w, h)
	draw.RoundedBox(2, 0, 0, w, h, (self.Depressed or self.On) and categorycolors[self.Category][1] or categorycolors[self.Category][2])
	draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBG)
	if self.On or self.Hovered then
		draw.RoundedBox(2, 2, 2, w - 4, h - 4, colBGH)
=======
	[ INVCAT_TRINKETS ] = { COLOR_RED, COLOR_DARKRED },
	[ INVCAT_COMPONENTS ] = { COLOR_BLUE, COLOR_DARKBLUE },
	[ INVCAT_CONSUMABLES ] = { COLOR_YELLOW, Color(75,67,1) },
	[ INVCAT_WEAPONS ] = {Color(41,39,182),Color(99,173,233)},
	[ INVCAT_ETERNAL ] = {Color(199,198,241),Color(50,147,113)}
}
local colBG = Color( 10, 10, 10, 252 )
local colBGH = Color( 200, 200, 200, 5 )
local blur = Material( "pp/blurscreen" )
local function TrinketPanelPaint( self, w, h )
	if categorycolors[ self.Category ] then
		draw.RoundedBox( 2, 0, 0, w, h, ( self.Depressed or self.On or self.Category == INVCAT_CONSUMABLES and input.IsMouseDown(MOUSE_RIGHT) ) and categorycolors[ self.Category ][ 1 ] or categorycolors[ self.Category ][ 2 ]  )
	end

	if self.Category == INVCAT_CONSUMABLES and input.IsMouseDown(MOUSE_RIGHT) and !(self.Hovered or self.On) and self.SWEP.BountyNeed and self.SWEP.BountyNeed >= 1 then
		colBG = HSVToColor(CurTime()*90 % 360, 1, 1)
		colBG.a = 252
	else
		colBG = Color( 10, 10, 10, 252 )
	end
	draw.RoundedBox( 2, 2, 2, w - 4, h - 4, colBG )
	if self.On or self.Hovered  then
		draw.RoundedBox( 2, 2, 2, w - 4, h - 4, colBGH )
	end

	if self.SWEP then
		--MySelf:GetChargesActive() >= (item.BountyNeed or 1)
		local txt = ""
		if self.SWEP.BountyNeed and self.SWEP.BountyNeed >= 1 then
			txt = ":"..self.SWEP.BountyNeed
		end
		draw.SimpleText( self.SWEP.PrintName..txt, "ZSHUDFontTiny", w/2, h/2, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
>>>>>>> Stashed changes
	end

	return true
end

function GM:CreateInventoryInfoViewer()
	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(true)
		return
	end

	local leftframe = self.InventoryMenu
	local viewer = vgui.Create("DFrame")

	local screenscale = BetterScreenScale()

	viewer:SetDeleteOnClose(false)
	viewer:SetTitle(" ")
	viewer:SetDraggable(false)
	if viewer.btnClose and viewer.btnClose:IsValid() then viewer.btnClose:SetVisible(false) end
	if viewer.btnMinim and viewer.btnMinim:IsValid() then viewer.btnMinim:SetVisible(false) end
	if viewer.btnMaxim and viewer.btnMaxim:IsValid() then viewer.btnMaxim:SetVisible(false) end

	viewer:SetSize(leftframe:GetWide() / 1.25, leftframe:GetTall())
	viewer:MoveRightOf(leftframe, 32)
	viewer:MoveAbove(leftframe, -leftframe:GetTall())
	self.m_InvViewer = viewer

	self:CreateItemViewerGenericElems(viewer)

	local craftbtns = {}
	for i = 1, 3 do
		local craftb = vgui.Create("DButton", viewer)
		craftb:SetText("")
		craftb:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
		craftb:SetVisible(false)

		local namelab = EasyLabel(craftb, "...", "ZSBodyTextFont", COLOR_WHITE)
		namelab:SetWide(craftb:GetWide())
		namelab:SetVisible(false)

		craftbtns[i] = {craftb, namelab}
	end
	viewer.m_CraftBtns = craftbtns

<<<<<<< Updated upstream
	local craftwith = EasyLabel(viewer, "Craft With...", "ZSBodyTextFontBig", COLOR_WHITE)
	craftwith:SetSize(viewer:GetWide() / 1.15, 27 * screenscale)
	craftwith:SetVisible(false)
	viewer.m_CraftWith = craftwith
=======
	local activate = vgui.Create( "DButton", viewer )
	activate:SetText( "" )
	activate:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	activate:SetVisible(false)

	local namelab = EasyLabel( activate, "Activate", "ZSBodyTextFont", COLOR_WHITE )
	namelab:SetWide( activate:GetWide() )
	namelab:SetVisible( false )

	viewer.m_ActivateButton = {activate,namelab}

	local activate = vgui.Create( "DButton", viewer )
	activate:SetText( "" )
	activate:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	activate:SetVisible(false)

	local namelab = EasyLabel( activate, "Clip in Q", "ZSBodyTextFont", COLOR_WHITE )
	namelab:SetWide( activate:GetWide() )
	namelab:SetVisible( false )

	viewer.m_ClipButton = {activate,namelab}

	local activate = vgui.Create( "DButton", viewer )
	activate:SetText( "" )
	activate:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	activate:SetVisible(false)

	local namelab = EasyLabel( activate, "Give for drone", "ZSBodyTextFont", COLOR_WHITE )
	namelab:SetWide( activate:GetWide() )
	namelab:SetVisible( false )

	viewer.m_Drones = {activate,namelab}

	
	local activate2 = vgui.Create( "DButton", viewer )
	activate2:SetText( "" )
	activate2:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	activate2:SetVisible(false)

	local namelab2 = EasyLabel( activate2, "Upgrade", "ZSBodyTextFont", COLOR_WHITE )
	namelab2:SetWide( activate2:GetWide() )
	namelab2:SetVisible( false )

	viewer.m_UpgradeButton = {activate2,namelab2}

	local craftwith = EasyLabel( viewer, "Craft With...", "ZSBodyTextFontBig", COLOR_WHITE )
	craftwith:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	craftwith:SetVisible( false )
	viewer.m_CraftWith = craftwith
	local itemwith = EasyLabel( viewer, "Get item...", "ZSBodyTextFontBig", COLOR_WHITE )
	itemwith:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	itemwith:SetVisible( false )
	viewer.m_ItemWith = itemwith
	local act = vgui.Create( "DButton", viewer )
	act:SetText("Activate")
	act:SetSize( viewer:GetWide() / 1.15, 27 * screenscale )
	act:SetVisible(false)
	viewer.m_Activate = act


>>>>>>> Stashed changes
end

local NumToRomanNumeral = {
	"I", "II", "III", "IV", "V", "VI"
}

function GM:InventoryAddGridItem(item, category)
	local screenscale = BetterScreenScale()
	local grid = self.InventoryMenu.Grid

<<<<<<< Updated upstream
	local itempan = vgui.Create("DButton")
	itempan:SetText("")
	itempan:SetSize(64 * screenscale, 64 * screenscale)
	itempan.Paint = ItemPanelPaint
	itempan.DoClick = ItemPanelDoClick
	itempan.Item = item
	itempan.Category = category

	grid:AddItem(itempan)
	grid:SortByMember("Category")

	local mdlframe = vgui.Create("DPanel", itempan)
	mdlframe:SetSize(60 * screenscale, 30 * screenscale)
	mdlframe:Center()
	mdlframe:SetMouseInputEnabled(false)
	mdlframe.Paint = function() end
=======

	if grid and grid:IsValid() then
		local itempan = vgui.Create("DButton")
		itempan:SetText( "" )
		itempan.Paint = TrinketPanelPaint

		itempan.Item = item
		if category == INVCAT_WEAPONS then
			itempan.SWEP =  weapons.Get(item)
		else
			itempan.SWEP =  self.ZSInventoryItemData[ item ]
		end
		itempan.DoClick = self.ItemPanelDoClick
		itempan.DoRightClick = function()
			local menu = DermaMenu(itempan)
			menu:AddOption(translate.Get("drop_item"), function() 
				if category == INVCAT_WEAPONS then
					local ent
					for k,v in pairs(MySelf:GetWeapons()) do
						if item == v:GetClass() then
							ent = v
							break
						end
					end
					if ent and ent:IsValid() then
						input.SelectWeapon(ent)
					end
					GAMEMODE.InventoryMenu.SelInv = nil
					timer.Simple(0, function()	RunConsoleCommand("zsdropweapon")  end)
					return 
				end  
				RunConsoleCommand("zsdropweapon",  item) 
			end)
			menu:AddOption(translate.Get("give_item"), function() 
				if category == INVCAT_WEAPONS then 

						local ent
						for k,v in pairs(MySelf:GetWeapons()) do
							if item == v:GetClass() then
								ent = v
								break
							end
						end
						if ent and ent:IsValid() then
							input.SelectWeapon(ent)
						end
						GAMEMODE.InventoryMenu.SelInv = nil
					timer.Simple(0, function()	RunConsoleCommand("zsgiveweapon")  end)
					return 
				end  
				RunConsoleCommand("zsgiveweapon",  item) 
			end)
			menu:AddOption(translate.Get("di_hud"), function() 
				if category == INVCAT_WEAPONS then 

						local ent
						for k,v in pairs(MySelf:GetWeapons()) do
							if item == v:GetClass() then
								ent = v
								break
							end
						end
						if ent and ent:IsValid() then
							input.SelectWeapon(ent)
						end
						GAMEMODE.InventoryMenu.SelInv = nil
					timer.Simple(0, function()	RunConsoleCommand("zs_dismantle")  end)
					return 
				end  
				RunConsoleCommand("zs_dismantle",  item) 
			end)
			if category == INVCAT_CONSUMABLES then
				
				menu:AddOption(translate.Get("s_activate"), function() 
					net.Start("zs_activate_trinket")
					net.WriteString(item)
					net.WriteEntity(MySelf)
				net.SendToServer()
				end)
			end
			menu:Open()
		end
		itempan.Category = category
	--itempan.Name = itempan.SWEP.PrintName or "AAA"

		grid:AddItem( itempan )
		grid:SortByMember( "Category" )
		--grid:SortByMember( "Item" )
		--for k, v in SortedPairs(grid:GetItems()) do
			--grid:
		--end
		if itempan.SWEP.Stackable or category == INVCAT_ETERNAL then
			local meh = 0
			local mehin = {}
			for k,v in pairs(grid:GetItems()) do
				if (v.SWEP.Stackable or category == INVCAT_ETERNAL) and v.Item == itempan.Item then
					v:SetTooltip(GAMEMODE.ZSInventory[itempan.Item])
				end
			end
		end
>>>>>>> Stashed changes

	local trintier = EasyLabel(itempan, "", "ZSHUDFontSmaller", COLOR_WHITE)
	trintier:CenterHorizontal(0.8)
	trintier:CenterVertical(0.8)

<<<<<<< Updated upstream
	if category == INVCAT_TRINKETS then
		local tier = GAMEMODE.ZSInventoryItemData[item].Tier or 1
		trintier:SetText(NumToRomanNumeral[tier])
		trintier:SizeToContents()
		trintier:CenterHorizontal(0.8)
		trintier:CenterVertical(0.8)
	end

	local kitbl = killicon.Get(category == INVCAT_TRINKETS and "weapon_zs_trinket" or "weapon_zs_craftables")
	if kitbl then
		self:AttachKillicon(kitbl, itempan, mdlframe)
=======
		local trintier = EasyLabel( itempan, "", "ZSHUDFontSmaller", COLOR_WHITE )
		trintier:CenterHorizontal( 0.8 )
		trintier:CenterVertical( 0.8 )
		
		--print(item)
		local icon = category == INVCAT_WEAPONS and item or GAMEMODE.ZSInventoryItemData[item].Icon and GAMEMODE.ZSInventoryItemData[item].Icon..(table.HasValue({"q1","q2","q3","q4","q5"},strsub(item ,#item-1,#item)) and "_"..strsub(item ,#item-1,#item) or "") or "weapon_zs_trinket"
		--print(icon)
		local kitbl = killicon.Get((category ~= INVCAT_COMPONENTS) and icon or "weapon_zs_craftables")
		if kitbl then
			self:AttachKillicon(kitbl, itempan, mdlframe)
			local icn = itempan.m_Icon
			if IsValid(icn) then
				icn:SetAlpha(120)
				icn:SetZPos(-36001)
			end
		end
>>>>>>> Stashed changes
	end
end

function GM:InventoryRemoveGridItem(item)
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		if v.Item == item then
			grid:RemoveItem(v)
			break
		end
	end
	grid:SortByMember("Category")

	if self.InventoryMenu.SelInv == item then
		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(false)
		end

		self.InventoryMenu.SelInv = nil
		self:DoAltSelectedItemUpdate()
	end
end

function GM:InventoryWipeGrid()
	local grid = self.InventoryMenu.Grid
	for k, v in pairs(grid:GetChildren()) do
		grid:RemoveItem(v)
	end

	if self.m_InvViewer and self.m_InvViewer:IsValid() then
		self.m_InvViewer:SetVisible(false)
	end

	self.InventoryMenu.SelInv = nil
	self:DoAltSelectedItemUpdate()
end
function GM:UpdateWeapons()
	local countw = #MySelf:GetWeapons()
	if !self.InventoryMenu.Grids[INVCAT_WEAPONS]:GetItems() then return end
	for k, v in pairs( self.InventoryMenu.Grids[INVCAT_WEAPONS]:GetItems() ) do
		if #self.InventoryMenu.Grids[INVCAT_WEAPONS]:GetItems() > 0 then
			if !MySelf:GetWeapons()[v.Item] then
				self:InventoryRemoveGridItem(v.Item)
			end
			
		end
	end
	for k, v in pairs(MySelf:GetWeapons()) do
		local delete = false
		for _, v2 in pairs( self.InventoryMenu.Grids[INVCAT_WEAPONS]:GetItems() ) do
			if v2.Item == v:GetClass() then  delete = true continue end
		end
		if delete then continue end
		if countw > 0 then
			--for i = 1, countw do
			self:InventoryAddGridItem( v:GetClass(), INVCAT_WEAPONS )
			--end
		end
	end
end

<<<<<<< Updated upstream
function GM:OpenInventory()
	if self.InventoryMenu and self.InventoryMenu:IsValid() then
		self.InventoryMenu:SetVisible(true)

		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible(true)
=======
local NextRefresh = 0
local RefreshTime = 0.1
local function GetTargetEntIndex()
	return GAMEMODE.HumanMenuLockOn and GAMEMODE.HumanMenuLockOn:IsValid() and GAMEMODE.HumanMenuLockOn:EntIndex() or 0
end

function GM:OpenInventory()
	if self.InventoryMenu and self.InventoryMenu:IsValid() then
		self.InventoryMenu:SetVisible( true )
	--	self.InventoryMenu:Remove()
		if self.Inv_NearestFrame and self.Inv_NearestFrame:IsValid() then
			self.Inv_NearestFrame:SetVisible( true )
		--	self.Inv_NearestFrame:Remove()
		end

		if self.m_InvViewer and self.m_InvViewer:IsValid() and self.InventoryMenu.SelInv then
			self.m_InvViewer:SetVisible( true )
		--	self.m_InvViewer:Remove()
>>>>>>> Stashed changes
		end
		return
	end

	local screenscale = BetterScreenScale()
<<<<<<< Updated upstream
	local wid, hei = math.max(400, math.min(ScrW(), 400) * screenscale), math.min(ScrH(), 370) * screenscale
=======
	local w, h = 900 * screenscale, 700 * screenscale
>>>>>>> Stashed changes

	local frame = vgui.Create("DFrame")
	frame:SetSize(wid, hei)
	frame:CenterHorizontal(0.385)
	frame:CenterVertical(0.25)
	frame:SetDeleteOnClose(false)
	frame:SetTitle(" ")
	frame:SetDraggable(false)

	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible(false) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible(false) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible(false) end

	self.InventoryMenu = frame

<<<<<<< Updated upstream
	local topspace = vgui.Create("DPanel", frame)
	topspace:SetWide(wid - 16)
=======
	if frame.btnClose and frame.btnClose:IsValid() then frame.btnClose:SetVisible( false ) end
	if frame.btnMinim and frame.btnMinim:IsValid() then frame.btnMinim:SetVisible( false ) end
	if frame.btnMaxim and frame.btnMaxim:IsValid() then frame.btnMaxim:SetVisible( false ) end

		local hpstat = vgui.Create("DEXChangingLabel", frame)

		hpstat:SetFont("ZSHUDFontTiny")
		hpstat:SetChangeFunction(function()
			return 	hpstat:SetText(translate.Get("charges_active")..MySelf:GetChargesActive()) 
					
		end, true)
		hpstat:SetTextColor(Color(216,95,95))
		hpstat:SetContentAlignment(8)
		hpstat:Dock(TOP)
		hpstat:SizeToContents()

		

	local topspace = vgui.Create( "DPanel", frame )
	topspace:Dock( TOP )
	topspace:DockMargin( 4 * screenscale, 4 * screenscale, 4 * screenscale, 4 * screenscale )
	topspace:SetTall( 40 * screenscale )
	topspace:SetMouseInputEnabled( false )
>>>>>>> Stashed changes

	local title = EasyLabel(topspace, "Inventory", "ZSHUDFontSmall", COLOR_WHITE)
	title:CenterHorizontal()

<<<<<<< Updated upstream
	local _, y = title:GetPos()
	topspace:SetTall(y + title:GetTall() + 2)
	topspace:AlignTop(8)
	topspace:CenterHorizontal()

	local invListPanel = vgui.Create("DScrollPanel", frame)
	invListPanel:Dock( FILL )
	local sbar = invListPanel:GetVBar()
	sbar.Enabled = true
	invListPanel:DockMargin(0, topspace:GetTall() + 8, 0, 0)
	invListPanel:InvalidateParent(true)
=======
	local title = EasyLabel( topspace, translate.Get( "inv_title" ), "ZSHUDFontSmall", COLOR_WHITE )
	title:Dock( FILL )
	title:SetContentAlignment( 5 )
	



	local invprop = vgui.Create( "DPropertySheet", frame )
	invprop:Dock( FILL )
	invprop:SetWide( frame:GetWide() - 320 * screenscale )
	invprop:DockMargin( 2 * screenscale, 2 * screenscale, 2 * screenscale, 2 * screenscale )
	
	for i, con in ipairs( self.ZSInventoryCategories ) do
		local itemframe = vgui.Create( "DScrollPanel", invprop )
		itemframe:Dock( FILL )
		itemframe:DockMargin( 4 * screenscale, 4 * screenscale, 4 * screenscale, 4 * screenscale )
>>>>>>> Stashed changes

	local invgrid = vgui.Create("DGrid", invListPanel)
	invgrid:SetSize(invListPanel:GetWide() - sbar:GetWide(), invListPanel:GetTall())
	invgrid:SetCols(5)
	invgrid:SetColWide((70 + (invgrid:GetWide() - 70*5) / 4) * screenscale)
	invgrid:SetRowHeight(70 * screenscale)
	frame.Grid = invgrid

<<<<<<< Updated upstream
	for item, count in pairs(self.ZSInventory) do
		if count > 0 then
=======
		itemframe.Grid = invgrid

		self.InventoryMenu.Grids[ i ] = invgrid

		invprop:AddSheet( con, itemframe )
	end

	self.InventoryMenu.Grid = invprop:GetActiveTab():GetPanel().Grid

	local scroller = invprop:GetChildren()[ 1 ]
	local dragbase = scroller:GetChildren()[ 1 ]
	local tabs = dragbase:GetChildren()
	
	self:ConfigureMenuTabs( tabs, 32 * screenscale, function( tab )
		self.InventoryMenu.Grid = tab:GetPanel().Grid
	end )

	for item, count in pairs( self.ZSInventory ) do
		if count > 0 and MySelf:HasInventoryItem(item) then
>>>>>>> Stashed changes
			for i = 1, count do
				self:InventoryAddGridItem(item, self:GetInventoryItemType(item))
			end
		end
	end
	invgrid:SortByMember("Category")

<<<<<<< Updated upstream
	frame:MakePopup()
=======

	self:CreateItemInfoViewer( frame, invprop, topspace, bottomspace )
	self:CreateInventoryElements()
	local xd = 0
	for k,v in pairs(self.AmmoResupply) do
		local ki = killicon.Get(self.AmmoIcons[k])
		if !ki then continue end
		local checkbutton = vgui.Create("DImageButton",frame)
		checkbutton:SetImage(ki[1])
		if ki[2] then checkbutton:SetColor(MySelf.ResupplyChoice == k and Color(197,167,16) or ki[2]) end
		xd = xd + 1
		checkbutton:SetSize(32* screenscale,32* screenscale)
		checkbutton:SetTooltip(self.AmmoNames[k])
		checkbutton:SetPos( 16 *  screenscale+ 500* screenscale,48 * xd  * screenscale+60* screenscale)

		local sel =  vgui.Create("DEXChangingLabel", frame)
		sel:SetChangeFunction(function()
			return MySelf:GetAmmoCount(k)
		end, true)
		sel:SetContentAlignment(5)
		sel:SetFont("ZSHUDFontTiniest")
		sel:SetPos( 16 * screenscale+ 534* screenscale, 48 * xd  * screenscale+63* screenscale)
		for i=1,2 do
			local gb = vgui.Create("DImageButton",frame)
			gb:SetImage((i == 1  and "icon16/user_go.png" or "icon16/box.png"))
			gb:SizeToContents()
			gb.DoClick = function(me)
				if i == 1 then
					RunConsoleCommand("zsgiveammo", k, GetTargetEntIndex())
				else
					RunConsoleCommand("zsdropammo", k)
				end
			end
			gb:SetPos( 16 * i * screenscale+ 500* screenscale,48 * xd  * screenscale+93* screenscale)
			gb.DontCount = true
			gb.NoWide = true
		end
		--x = x - checkbutton:GetWide() - 8
		checkbutton.DoClick = function(me)
			if MySelf.ResupplyChoice == k then
				MySelf.ResupplyChoice = nil
				RunConsoleCommand("zs_resupplyammotype", "default")
			else
				MySelf.ResupplyChoice = k
				RunConsoleCommand("zs_resupplyammotype", k)
				
			end
			local col = Color(249,236,93)
			if MySelf.ResupplyChoice ~= k then
				col =  ki[2]
			end
			for k,v in pairs(self.AmmoButtons) do 
				v:SetColor(killicon.Get(self.AmmoIcons[k])[2])
			end
			me:SetColor(col)
		end
		if !self.AmmoButtons[k] then
			self.AmmoButtons[k] = checkbutton
		end
		
	end
>>>>>>> Stashed changes
end
