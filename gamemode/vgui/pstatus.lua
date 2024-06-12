local function StatusButtonDoClick(self)
	local swep = self.SWEP
	if swep then
		pStatuss:SetStatusViewerSWEP(self.SWEP)
	end
end

local function SetStatusViewerSWEP(self, status)
	local sts = GAMEMODE.Statuses
	if self.Viewer then
		if self.Viewer:IsValid() then
			self.Viewer:Remove()
		end
		self.Viewer = nil
	end

	local wid, hei = self:GetWide() * 0.6 - 16, self:GetTall() - self.ViewerY - 8
	local screenscale = BetterScreenScale()

	local viewer = vgui.Create("DPanel", self)
	viewer:SetPaintBackground(false)
	viewer:SetSize(wid, hei)
	viewer:SetPos(self:GetWide() - viewer:GetWide() - 8, self.ViewerY)
	self.Viewer = viewer

	if not status then return end

	GAMEMODE:CreateItemViewerGenericElems(viewer)

	viewer.m_Title:SetText(translate.Get("s_"..sts[status].Name))
	viewer.m_Title:PerformLayout()

	local desctext = translate.Get("s_"..sts[status].Name.."_d") or ""
	if sts[status].Icon then

		local ki = killicon.Get(("status_"..sts[status].Name)) or killicon.Get("weapon_zs_cursed")

		viewer.m_AmmoIcon:SetImage(ki[1])
		viewer.m_AmmoIcon:SetImageColor(sts[status].Color)

		viewer.m_AmmoIcon:SetVisible(true)
	else
		viewer.m_AmmoType:SetText("")
		viewer.m_AmmoIcon:SetVisible(false)
	end
	viewer.m_VBG:SetVisible(true)

	viewer.m_Desc:MoveBelow(viewer.m_VBG, 8)
	viewer.m_Desc:SetFont("ZSBodyTextFontBig")
	viewer.m_Desc:SetText(desctext)

end

function MakepStatuss(silent)
	local sts = GAMEMODE.Statuses
	if not silent then
		PlayMenuOpenSound()
	end

	if pStatuss then
		pStatuss:SetAlpha(0)
		pStatuss:AlphaTo(255, 0.15, 0)
		pStatuss:SetVisible(true)
		pStatuss:MakePopup()
		return
	end

	local added = {}

	local weps = {}

	for k, v in pairs(sts) do
		if  !added[k] then
			weps[#weps + 1] = k
			added[k] = true
		end
	end

	local screenscale = BetterScreenScale()
	local wid, hei = math.min(ScrW(), 700) * screenscale, math.min(ScrH(), 700) * screenscale
	local tabhei = 24 * screenscale

	local frame = vgui.Create("DFrame")
	frame:SetDeleteOnClose(false)
	frame:SetSize(wid, hei)
	frame:SetTitle(" ")
	frame:Center()
	frame.SetStatusViewerSWEP = SetStatusViewerSWEP
	pStatuss = frame

	local y = 8

	local title = EasyLabel(frame, translate.Get("mm_s_base"), "ZSHUDFont", color_white)
	title:SetPos(wid * 0.5 - title:GetWide() * 0.5, y)
	y = y + title:GetTall() + 8

	local propertysheet = vgui.Create("DPropertySheet", frame)

	propertysheet:SetSize(wid * 0.4 - 8, hei - title:GetTall() - 32 * screenscale)
	propertysheet:MoveBelow(title, 16 * screenscale)
	propertysheet:SetPadding(1)

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	local sheet = propertysheet:AddSheet("Status", tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.StatussTree = tree


	local scroller = propertysheet:GetChildren()[1]
	local dragbase = scroller:GetChildren()[1]
	local tabs = dragbase:GetChildren()

	GAMEMODE:ConfigureMenuTabs(tabs, tabhei)

	frame.ViewerY = y

	for _, wep in pairs(weps) do
		local wepnode
		local wepn = translate.Get("s_"..sts[wep].Name)
		if wepn then
			wepnode = frame.StatussTree:AddNode(wepn)
		else
			wepnode = frame.StatussTree:AddNode(wep)
		end
		wepnode.SWEP = wep
		wepnode.DoClick = StatusButtonDoClick
	end

	frame:SetStatusViewerSWEP()

	MakepStatuss(true)
end
function GM:CreateNBNO()
	if GAMEMODE.DontShowNB then return end
	local scr = BetterScreenScale()
    local panel = vgui.Create("DFrame")
    panel:SetSize(500*scr, 500*scr)
    panel:SetTitle(translate.Get("newbie_text"))
    panel:Center()
    panel:MakePopup()
	panel:ShowCloseButton(true)


    local difficultyLabel = vgui.Create("DLabel", panel)
    difficultyLabel:SetPos(25*scr, -100*scr)
    difficultyLabel:SetSize(500*scr, 460*scr)
    difficultyLabel:SetWrap(true)

	difficultyLabel:SetText(translate.Get("something_new"))

	check = vgui.Create("DCheckBoxLabel", panel)
	check:SetText(translate.Get("op_dont_show"))
	check:SetConVar("zs_dont_show")
	check:SizeToContents()
	check:SetPos(350*scr,480*scr)

end
local colBG = Color( 10, 10, 10, 252 )
local colBGH = Color( 200, 200, 200, 5 )
local blur = Material( "pp/blurscreen" )
local categorycolors = {
	[ INVCAT_TRINKETS ] = { COLOR_RED, COLOR_DARKRED },
	[ INVCAT_COMPONENTS ] = { COLOR_BLUE, COLOR_DARKBLUE },
	[ INVCAT_CONSUMABLES ] = { COLOR_YELLOW, Color(75,67,1) },
	[INVCAT_WEAPONS] = {Color(41,39,182),Color(99,173,233)}
}
local function TrinketPanelPaint( self, w, h )
	if categorycolors[ self.Category ] then
		draw.RoundedBox( 2, 0, 0, w, h, ( self.Depressed or self.On) and Color(80,80,80) or categorycolors[self.Category][1]   )
	end

	draw.RoundedBox( 2, 2, 2, w - 4, h - 4, colBG )
	if self.On or self.Hovered  then
		draw.RoundedBox( 2, 2, 2, w - 4, h - 4, colBGH )
	end

	if self.SWEP then
		draw.SimpleText( self.SWEP.PrintName, "ZSHUDFontTiny", w/2, h/8, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )	
		--local txt = self.SWEP.Description 

		--draw.DrawText( txt, "ZSBodyTextFontBig", w/2.2, h/3, Color( 255, 255, 255 ), TEXT_ALIGN_CENTER)	
	end

	return true
end
local function ItemPanelDoClick(self)
	net.Start("zs_bounty_add")
	net.WriteString(self.Item)
	net.SendToServer()
	self.Owner:Close()

end
local function InventoryAdd( item, category, i, self,custom, big)
	local screenscale = BetterScreenScale()
	local grid = GAMEMODE:GetInventoryItemType( item )


	if grid then
		local itempan = vgui.Create("DButton", self)
		itempan:SetText( "" )
		itempan.Paint = TrinketPanelPaint

		itempan.Owner = self
		itempan.Item = item
		itempan.SWEP =  custom or GAMEMODE.ZSInventoryItemData[ item ]
		itempan.DoClick = ItemPanelDoClick
		itempan.Category = category
		itempan:Center()
		itempan:SetSize(250 * screenscale * (big and 0.9 or 1),400 * screenscale)
		itempan:SetPos(290 * screenscale * (big and 0.8 or 1) * i - 200 * screenscale,itempan:GetY()-180*screenscale)

		local desc = vgui.Create("DLabel", itempan)
		desc:SetSize(250 * screenscale * (big and 0.9 or 1),400 * screenscale)
		desc:SetFont("ZSHUDFontTiny")
		desc:SetWrap(true)

		desc:SetText(itempan.SWEP.Description)

		local mdlframe = vgui.Create("DPanel", itempan)
		mdlframe:SizeToContents()
		mdlframe:Center()
		mdlframe:SetPos(400 * screenscale * i,screenscale*0.5)
		mdlframe:SetMouseInputEnabled( false )
		mdlframe.Paint = function() end

		local trintier = EasyLabel( itempan, translate.Get("w_tier")..(itempan.SWEP.Tier or 0), "ZSHUDFontSmaller", COLOR_WHITE )
		trintier:CenterHorizontal( 0.8 )
		trintier:CenterVertical( 0.9 )
		

		
		local icon = category == INVCAT_WEAPONS and item or itempan.SWEP.Icon or "weapon_zs_trinket"
		local kitbl = killicon.Get((category ~= INVCAT_COMPONENTS) and icon or "weapon_zs_craftables")
		if kitbl then
			GAMEMODE:AttachKillicon(kitbl, itempan, mdlframe)
		end
		
	end
end
local d = {"headshoter", "ind_buffer",  "ultra_at", "pearl","broken_world"}
function GM:OpenBounty(table2)
	local scr = BetterScreenScale()
    local panel = vgui.Create("DFrame")
	local big = false
	if #table2 > 4 then
		big = true
	end
    panel:SetSize(320*scr*(#table2) * (big and 0.77 or 1), 500*scr)
    panel:SetTitle("Select bounty")
    panel:Center()
    panel:MakePopup()
	panel:SetDraggable(false)

	if !table2 then
		table2 = d 
	end
	if isnumber(table2[1]) then
		InventoryAdd("2",INVCAT_TRINKETS,1,panel,{Tier = 1,PrintName = translate.Get("bounty_1"),Description = ""})
		if table2[1] > 4 then
			InventoryAdd("1",INVCAT_TRINKETS,2,panel,{Tier = 2,PrintName = translate.Get("bounty_2"),Description = ""})
			if table2[1] == 9 then
				InventoryAdd("3",INVCAT_TRINKETS,3,panel,{Tier = 3,PrintName = translate.Get("bounty_3"),Description = ""})
			end
		end
		return
	end
	for i=1,#table2 do
		if GAMEMODE.ZSInventoryItemData[table2[i]] and GAMEMODE.ZSInventoryItemData[table2[i]].Bounty then
			InventoryAdd(table2[i],INVCAT_TRINKETS,i,panel)
		else
			InventoryAdd("trinket_"..table2[i],INVCAT_TRINKETS,i,panel, false, big)
		end
	end

   	--local difficultyLabel = vgui.Create("DLabel", panel)
    --difficultyLabel:SetPos(25*scr, -100*scr)
   	--difficultyLabel:SetSize(500*scr, 460*scr)
	--difficultyLabel:SetWrap(true)

	--difficultyLabel:SetText(translate.Get("something_new"))

	--check = vgui.Create("DCheckBoxLabel", panel)
	----check:SetText(translate.Get("op_dont_show"))
---	check:SetConVar("zs_dont_show")
	--check:SizeToContents()
	--check:SetPos(350*scr,480*scr)

end