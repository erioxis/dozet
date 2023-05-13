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