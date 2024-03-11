local function WeaponButtonDoClick(self)
	local swep = self.SWEP
	if swep then
		pWeapons:SetWeaponViewerSWEP(self.SWEP, self.Category, self.Comps)
	end
end

local function SetWeaponViewerSWEP(self, swep, category, comps)
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
	if not swep then return end

	local sweptable = weapons.Get(swep) or GAMEMODE.ZSInventoryItemData[swep] or swep
	if not sweptable then return end

	GAMEMODE:CreateItemViewerGenericElems(viewer)

	viewer.m_Title:SetText(sweptable.PrintName)
	viewer.m_Title:PerformLayout()

	local desctext = sweptable.Description or ""

	viewer.ModelPanel:SetModel(sweptable.WorldModel or "")
	local mins, maxs = Vector(1,1,1),Vector(1,1,1)
	if viewer.ModelPanel.Entity and viewer.ModelPanel.Entity:GetRenderBounds() then
		mins, maxs = viewer.ModelPanel.Entity:GetRenderBounds()
	end
	viewer.ModelPanel:SetCamPos(mins:Distance(maxs) * Vector(1.15, 0.75, 0.5))
	viewer.ModelPanel:SetLookAt((mins + maxs) / 3)
	viewer.m_VBG:SetVisible(true)

	if sweptable.NoDismantle then
		desctext = desctext .. "\nCannot be dismantled for scrap."
	end
	if GAMEMODE.Breakdowns[swep] then
		desctext = desctext ..translate.Get("on_dismantle_give")..GAMEMODE.ZSInventoryItemData[GAMEMODE.Breakdowns[swep].Result].PrintName
	end

	viewer.m_Desc:MoveBelow(viewer.m_VBG, 8)
	viewer.m_Desc:SetFont("ZSBodyTextFont")
	viewer.m_Desc:SetText(desctext)
	if self.ButtonGive then
		self.ButtonGive:MoveBelow(viewer.m_Desc)
		self.ButtonGive:SetFont("ZSHUDFont")
		self.ButtonGive.DoClick = function(arguments)
			net.Start("zs_admin_give_t")
			net.WriteString(swep.SWEP or swep)
			net.SendToServer()
		end
	end

	GAMEMODE:ViewerStatBarUpdate(viewer, category ~= ITEMCAT_GUNS and category ~= ITEMCAT_MELEE, sweptable)
	if GAMEMODE:HasPurchaseableAmmo(sweptable) and GAMEMODE.AmmoNames[string.lower(sweptable.Primary.Ammo)] then
		local lower = string.lower(sweptable.Primary.Ammo)

		viewer.m_AmmoType:SetText(GAMEMODE.AmmoNames[lower])
		viewer.m_AmmoType:PerformLayout()

		local ki = killicon.Get(GAMEMODE.AmmoIcons[lower])

		viewer.m_AmmoIcon:SetImage(ki[1])
		if ki[2] then viewer.m_AmmoIcon:SetImageColor(ki[2]) end

		viewer.m_AmmoIcon:SetVisible(true)
	else
		viewer.m_AmmoType:SetText("")
		viewer.m_AmmoIcon:SetVisible(false)
	end

	if not viewer.m_Recipe1 then
		local recipe = EasyLabel(viewer, "", "ZSBodyTextFont", COLOR_TAN)
		recipe:SetContentAlignment(8)
		recipe:SetSize(viewer:GetWide(), 16 * screenscale)
		recipe:MoveBelow(viewer.ItemStatBars[6], 20)
		viewer.m_Recipe1 = recipe
	end

	if not viewer.m_Recipe2 then
		local recipe = EasyLabel(viewer, "", "ZSBodyTextFont", COLOR_TAN)
		recipe:SetContentAlignment(8)
		recipe:SetSize(viewer:GetWide(), 16 * screenscale)
		recipe:MoveBelow(viewer.m_Recipe1, 20)
		viewer.m_Recipe2 = recipe
	end

	viewer.m_Recipe1:SetText(comps and (
		GAMEMODE.ZSInventoryItemData[comps[1]].PrintName or weapons.Get(comps[1]).PrintName
		or "") or "")

	viewer.m_Recipe2:SetText(comps and (
		weapons.Get(comps[2]) and weapons.Get(comps[2]).PrintName or GAMEMODE.ZSInventoryItemData[comps[2]].PrintName
		or "")or "")
end
local tbleternal = {["headshoter"] = "None", ["ind_buffer"]  = "None", ["ultra_at"] = "None", ["pearl"] = "None",
["broken_world"]  = "None",["whysoul"]  = "None",["altevesoul"]  = "None",["lucky_chance"]  = "None",["acum"]  = "None",["driller"] = "None",["mirror_of_god"] = "None",["module_mirror"] = "None",["spinel"] = "None",
["pr_gold"] = "Medical",
["pr_barapaw"] = "Medical",
["pr_chamomile"] = "Medical",
["pr_bloodpack"] = "Medical",
["cons_medicalbomb"] = "Medical",
["soulmedical"] = "Medical",
["troyaksoul"] = "Cader",
["nanite_nails"] = "Cader",
["useself"] = "Cader",
["illegalmechanism"] = "Cader",
["cons_nanites"] = "Cader",
["gov_blueprints"] = "Cader"
}  
local innatedamage = {[INNATE_TYPE_BOUNTY] = "flag_pink",
[INNATE_TYPE_ICE] = "drink",
[INNATE_TYPE_SERRATE] = "delete",
[INNATE_TYPE_FIRE] = "flag_yellow",
[INNATE_TYPE_PULSE] = "shading",
}

--print(tbleternal['nanite_nails'])
function MakepWeapons(silent)
	if not silent then
		PlayMenuOpenSound()
	end

	if pWeapons and pWeapons:IsValid()  then
		pWeapons:SetAlpha(0)
		pWeapons:AlphaTo(255, 0.15, 0)
		pWeapons:SetVisible(true)
		pWeapons:MakePopup()
		--pWeapons:Remove()
		return
	end

	local added = {}
	local addedcat = {}

	local weps = {}
	local crafts = {}
	local trinkets = {}

	for _, tab in ipairs(GAMEMODE.Items) do
		if tab.SWEP and not added[tab.SWEP] then
			if weapons.Get(tab.SWEP) then
				weps[#weps + 1] = tab.SWEP
				added[tab.SWEP] = true
				addedcat[tab.SWEP] = tab.Category
			elseif GAMEMODE.ZSInventoryItemData[tab.SWEP] then
				trinkets[#trinkets + 1] = tab.SWEP
				added[tab.SWEP] = true
				addedcat[tab.SWEP] = tab.SubCategory
			end
		end
	end

	for wep, comps in pairs(GAMEMODE.Assemblies) do
		if not added[wep] then
			if weapons.Get(wep) then
				crafts[#crafts + 1] = wep
				added[wep] = true
			end
		end
	end
	--[[for k, wep in pairs(GAMEMODE.ZSInventoryItemData) do
		--print(k)
		if not trinkets[wep] and GAMEMODE:GetInventoryItemType(k) == INVCAT_TRINKETS  and !added[wep.PrintName] then
			trinkets[#trinkets + 1] = wep
			added[wep.PrintName] = true
		end
	end]]
	for k, wep in pairs(GAMEMODE.ZSInventoryItemData) do
		if not trinkets[wep] and GAMEMODE:GetInventoryItemType(k)  == INVCAT_COMPONENTS and !added[wep.PrintName] then
			trinkets[#trinkets + 1] = wep
			added[wep.PrintName] = true
		end
	end
	local usables = {}
	for k, wep in pairs(GAMEMODE.ZSInventoryItemData) do
		if not usables[wep] and GAMEMODE:GetInventoryItemType(k)  == INVCAT_CONSUMABLES and !added[wep.PrintName] then
			usables[#usables + 1] = wep
			added[wep.PrintName] = true
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
	frame.SetWeaponViewerSWEP = SetWeaponViewerSWEP
	pWeapons = frame

	local y = 8

	local title = EasyLabel(frame, "Weapon Database", "ZSHUDFont", color_white)
	title:SetPos(wid * 0.5 - title:GetWide() * 0.5, y)
	y = y + title:GetTall() + 8


	local propertysheet = vgui.Create("DPropertySheet", frame)

	propertysheet:SetSize(wid * 0.4 - 8, hei - title:GetTall() - 32 * screenscale)
	propertysheet:MoveBelow(title, 16 * screenscale)
	propertysheet:SetPadding(1)

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	local sheet = propertysheet:AddSheet(translate.Get("node_wep"), tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.WeaponsTree = tree

	tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	sheet = propertysheet:AddSheet(translate.Get("node_craft"), tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.CraftsTree = tree

	local tree = vgui.Create("DTree", propertysheet)
	tree:SetWide(propertysheet:GetWide() - 16)
	local sheet = propertysheet:AddSheet(translate.Get("node_trinket"), tree, nil, false, false)
	sheet.Panel:SetPos(0, tabhei + 2)
	tree:SetIndentSize(4)
	frame.TrinketTree = tree

	local scroller = propertysheet:GetChildren()[1]
	local dragbase = scroller:GetChildren()[1]
	local tabs = dragbase:GetChildren()

	GAMEMODE:ConfigureMenuTabs(tabs, tabhei)

	frame.ViewerY = y
	frame.tierswep = frame.tierswep or {}
	for i=1,7 do
		frame.tierswep[i] = frame.WeaponsTree:AddNode(translate.Get('w_tier')..i)
		frame.tierswep[i].DoClick = function(arguments)
			frame.tierswep[i]:ExpandTo(true)
		end
	end
	
	for _, wep in pairs(weps) do
		local enttab = weapons.Get(wep)
		local wepnode
		if enttab then
			wepnode = frame.tierswep[(enttab.Tier or 1)]:AddNode(enttab.PrintName or wep,  innatedamage[enttab.InnateDamageType] and "icon16/"..innatedamage[enttab.InnateDamageType]..".png")
		else
			wepnode = frame.WeaponsTree:AddNode(wep)
		end
		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = addedcat[wep] or ITEMCAT_GUNS
	end

	for _, wep in pairs(crafts) do
		local enttab = weapons.Get(wep)
		local wepnode
		if enttab then
			wepnode = frame.CraftsTree:AddNode(enttab.PrintName or wep, innatedamage[enttab.InnateDamageType] and "icon16/"..innatedamage[enttab.InnateDamageType]..".png")
		else
			wepnode = frame.CraftsTree:AddNode(wep)
		end
		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = enttab.RequiredClip and ITEMCAT_GUNS or (enttab.Primary.Ammo == "none" and enttab.MeleeRange) and ITEMCAT_MELEE or ITEMCAT_TOOLS
		wepnode.Comps = GAMEMODE.Assemblies[wep]
	end
	frame.trinketwep = frame.trinketwep or {}
	--for i=1,8 do
	--	frame.trinketwep[i] = frame.TrinketTree:AddNode(translate.Get('w_tier')..i)
	--	frame.trinketwep[i].DoClick = function(arguments)
	--		frame.trinketwep[i]:ExpandTo(true)
	--	end
	--end
	for k,v in pairs(GAMEMODE.ItemSubCategories) do
		frame.trinketwep[v] = frame.TrinketTree:AddNode(v)
		frame.trinketwep[v].DoClick = function(arguments)
			frame.trinketwep[v]:ExpandTo(true)
		end
	end
	frame.trinketwep["cons"] = frame.TrinketTree:AddNode(translate.Get('vgui_cons'),'icon16/ruby.png')
	frame.trinketwep["Undefined"] = frame.TrinketTree:AddNode(translate.Get('vgui_comp'),'icon16/tick.png')
	frame.trinketwep["bounty"] = frame.TrinketTree:AddNode(translate.Get('skill_bounty'),'icon16/award_star_gold_1.png')
	for k, wep in pairs(trinkets) do
		local enttab = GAMEMODE.ZSInventoryItemData[wep] or wep
		local wepnode
		wepnode =  frame.trinketwep[(GAMEMODE.ItemSubCategories[addedcat[wep]] or 'Undefined')]:AddNode(enttab.PrintName or wep)

		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = ITEMCAT_TRINKETS
		wepnode.Comps = GAMEMODE.Assemblies[wep]
	end
	for wep,v in pairs(tbleternal) do
		local enttab = GAMEMODE.ZSInventoryItemData["trinket_"..wep] or GAMEMODE.ZSInventoryItemData[wep] or wep
		local wepnode
		wepnode =  frame.trinketwep['bounty']:AddNode(enttab.PrintName or wep, v == "Cader" and 'icon16/wrench.png' or v == "Medical" and 'icon16/pill.png' or "icon16/key.png")

		wepnode.SWEP = GAMEMODE.ZSInventoryItemData["trinket_"..wep] and "trinket_"..wep or wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = ITEMCAT_TRINKETS
		wepnode.Comps = GAMEMODE.Assemblies[wep]
	end
	for k, wep in pairs(usables) do
		local enttab = GAMEMODE.ZSInventoryItemData[wep] or wep
		local wepnode
		wepnode =  frame.trinketwep["cons"]:AddNode(enttab.PrintName or wep)

		wepnode.SWEP = wep
		wepnode.DoClick = WeaponButtonDoClick
		wepnode.Category = ITEMCAT_TRINKETS
		wepnode.Comps = GAMEMODE.Assemblies[wep]
	end
	frame:SetWeaponViewerSWEP()
	if MySelf:IsSuperAdmin() then
		frame.ButtonGive = EasyButton(frame, "Give")
	end

	MakepWeapons(true)
end
