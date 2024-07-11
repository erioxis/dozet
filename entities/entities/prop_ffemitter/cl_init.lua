INC_CLIENT()

function ENT:Initialize()
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 128))
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
end

local vOffset = Vector(-1, 0, 8)
local aOffset = Angle(180, 90, 90)

function ENT:RenderInfo(pos, ang, owner)
	local ammo = self:GetAmmo()

	cam.Start3D2D(pos, ang, 0.075)
		local name = ""
		if owner:IsValid() and owner:IsPlayer() then
			name = owner:ClippedName()
		end

		if ammo > 0 then
			draw.SimpleTextBlurry("["..ammo.." / "..self.MaxAmmo.."]", "ZS3D2DFontSmall", 0, 120, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleTextBlurry(translate.Get("empty"), "ZS3D2DFontSmall", 0, 120, COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		self:Draw3DHealthBar(math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1), name)
	cam.End3D2D()
end

function ENT:Draw()
	self:DrawModel()

	if not MySelf:IsValid() or MySelf:Team() ~= TEAM_HUMAN then return end

	local owner = self:GetObjectOwner()
	local ang = self:LocalToWorldAngles(aOffset)

	self:RenderInfo(self:LocalToWorld(vOffset), ang, owner)
end
function OpenMenuOfShit(ent)
	local Window = vgui.Create("DFrame")
	local wide = math.min(ScrW(), 500)
	local tall = math.min(ScrH(), 800)
	Window:SetSize(wide, tall)
	Window:Center()
	Window:SetTitle(" ")
	Window:SetDeleteOnClose(false)
	Window:MakePopup()
	local y = 8

	local label = EasyLabel(Window, "", "ZSScoreBoardSubTitle", color_white) -- translate.Get("mm_options")
	label:SetPos(wide * 0.5 - label:GetWide() * 0.1, y)
	label:SetZPos(4)
	y = y + label:GetTall() + 8
	local sheet = vgui.Create( "DPropertySheet", Window )
	sheet:Dock( FILL )

	
	local list = vgui.Create("DPanelList", Window)
	list:EnableVerticalScrollbar()
	list:EnableHorizontal(false)
	list:SetSize(wide - 24, tall - y - 12)
	list:SetPos(12, y)
	list:SetPadding(8)
	list:SetSpacing(4)
	gamemode.Call("AddExtraOptions", list, Window)
	
	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 150)
	slider:SetConVar("zs_shield_radius")
	slider:SetText("Дальность щита")
	slider:SizeToContents()
	list:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 360)
	slider:SetConVar("zs_shield_x")
	slider:SetText("X Поворот")
	slider:SizeToContents()
	list:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 360)
	slider:SetConVar("zs_shield_y")
	slider:SetText("Y Поворот")
	slider:SizeToContents()
	list:AddItem(slider)

	slider = vgui.Create("DNumSlider", Window)
	slider:SetDecimals(0)
	slider:SetMinMax(0, 360)
	slider:SetConVar("zs_shield_z")
	slider:SetText("Z Поворот")
	slider:SizeToContents()
	list:AddItem(slider)
end