INC_CLIENT()

SWEP.DrawCrosshair = false

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)

	return true
end

function SWEP:DrawHUD()
	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end

function SWEP:PrimaryAttack()
end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:Think()
end

local function okclick(self)
	RunConsoleCommand("setmessagebeaconmessage", self:GetParent().Choice, self:GetParent().MessageCus or "FALSE")
	self:GetParent():Close()
end

local function onselect(self, index, value, data)
	if data ~= "MSG" then
		self:GetParent().Choice = data
	else
		local frame = Derma_StringRequest("Напишите сообщения", "Ы", "",
		function(d)
			self:GetParent().MessageCus = d
		end,
		function(d) end,
		"OK", "Cancel")
		frame:GetChildren()[5]:GetChildren()[2]:SetTextColor(Color(128, 128, 128))
	end
end

local Menu
function SWEP:SecondaryAttack()
	if Menu and Menu:IsValid() then
		Menu:SetVisible(true)
		Menu.MessageCus = nil
		return
	end

	Menu = vgui.Create("DFrame")
	Menu:SetDeleteOnClose(false)
	Menu:SetSize(200, 100)
	Menu:SetTitle("Select a message")
	Menu:Center()
	Menu.Choice = 1
	Menu.MessageCus = "FALSE"

	local choice = vgui.Create("DComboBox", Menu)
	for k, v in ipairs(GAMEMODE.ValidBeaconMessages) do
		choice:AddChoice(translate.Get(v), k)
	end
	choice:ChooseOption(GAMEMODE.ValidBeaconMessages[1], 1)
	choice:SizeToContents()
	choice:SetWide(Menu:GetWide() - 16)
	choice:Center()

	choice:AddChoice(translate.Get('my_message'), "MSG")
	choice.OnSelect = onselect

	local ok = EasyButton(Menu, "OK", 8, 4)
	ok:AlignBottom(8)
	ok:CenterHorizontal()
	ok.DoClick = okclick

	Menu:MakePopup()
end
