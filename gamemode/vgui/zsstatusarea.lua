function statusValueFunction(statusname)
	return function(self, lp)
		local status = lp:GetStatus(statusname)
		if status and status:IsValid() then
			return math.max(status:GetStartTime() + status:GetDuration() - CurTime(), 0)
		end

		return 0
	end
end


local PANEL = {}

PANEL.StatusPanels = {}

function PANEL:Init()
	self:DockMargin(0, 0, 0, 0)
	self:DockPadding(0, 0, 0, 0)

	self.StatusPanels = {}

	for _, statusdisp in pairs(GAMEMODE.Statuses) do
		status = vgui.Create("ZSStatus", self)
		status:SetAlpha(240)
		status:SetColor(statusdisp.Color)
		status:SetMemberName(translate.Get("s_"..statusdisp.Name))
		status.GetMemberValue = statusdisp.ValFunc
		if status.ValFunc2 then
			status.GetMemberValue2 = statusdisp.ValFunc2
		end
		status.GetMemberMaxValue = statusdisp.MaxValueFunc
		status.MemberMaxValue = statusdisp.Max
		status.Icon = statusdisp.Icon
		status.PercentageCap = statusdisp.PercentageCap
		status.CodeName = statusdisp.Name
		status:Dock(LEFT)

		table.insert(self.StatusPanels, status)
	end

	self:ParentToHUD()
	self:InvalidateLayout()
end

function PANEL:PerformLayout()
	local w = 0
	for _, child in pairs(self:GetChildren()) do
		w = w + child:GetWide()
	end

	self:SetSize(w, BetterScreenScale() * 400)

	self:AlignLeft(math.max(0, ScrW() * 0.01))
	self:CenterVertical(0.92)
end

function PANEL:Think()
	local lp = LocalPlayer()
	if lp:IsValid() then
		for _, panel in pairs(self.StatusPanels) do
			panel:StatusThink(lp)
		end
	end
end

vgui.Register("ZSStatusArea", PANEL, "Panel")

PANEL = {}

PANEL.MemberValue = 0
PANEL.MemberValue2 = 0
PANEL.LerpMemberValue = 0
PANEL.LerpMemberValue2 = 0
PANEL.MemberMaxValue = 100
PANEL.MemberName = "Unnamed"
PANEL.CodeName = "Lol none"

function PANEL:SetColor(col) self.m_Color = col end
function PANEL:GetColor() return self.m_Color end
function PANEL:SetMemberName(n) self.MemberName = n end
function PANEL:GetMemberName() return self.MemberName end

function PANEL:Init()
	self:SetColor(Color(255, 255, 255))
	self:SetTall(BetterScreenScale() * 68)
	self:SetWide(BetterScreenScale() * 120)
end

function PANEL:StatusThink(lp)
	if self.GetMemberValue then
		self.MemberValue = self:GetMemberValue(lp) or self.MemberValue
	end
	--if self.GetMemberValue2 then
	--	self.MemberValue2 = self:GetMemberValue2(lp) or self.MemberValue2
	--end
	if self.GetMemberMaxValue then
		self.MemberMaxValue = self:GetMemberMaxValue(lp) or self.MemberMaxValue
	end

	if self.MemberValue > self.LerpMemberValue then
		self.LerpMemberValue = self.MemberValue
	elseif self.MemberValue < self.LerpMemberValue then
		self.LerpMemberValue = math.Approach(self.LerpMemberValue, self.MemberValue, FrameTime() * 30)
	end



	if self.MemberValue < 0.1 and self:GetWide() ~= 0 then
		self:SetWide(0)
		self:GetParent():InvalidateLayout()
	elseif self.MemberValue > 0.1 and self:GetWide() == 0 then
		self:SetWide(BetterScreenScale() * 65)
		self:GetParent():InvalidateLayout()
	end
end

local texDownEdge = surface.GetTextureID("gui/gradient_down")
function PANEL:Paint(w, h)
	local value = self.LerpMemberValue
	if value <= 0 then return end
	local lp = MySelf

	local col = self:GetColor()
	local max = self.MemberMaxValue

	local y = 0

	y = y + draw.GetFontHeight("ZSBodyTextFont")
	h = h - y

	local boxsize = 42

	surface.SetDrawColor(col.r * 0.8, col.g * 0.8, col.b * 0.8, col.a * 0.75)
	surface.SetTexture(texDownEdge)
	surface.DrawTexturedRect(w/2 - boxsize/2, h/2 - boxsize/2, boxsize, boxsize)
	surface.SetDrawColor(col.r * 0.8, col.g * 0.8, col.b * 0.8, col.a * 0.3)
	surface.DrawRect(w/2 - boxsize/2, h/2 - boxsize/2, boxsize, boxsize)



	local perc = function(add) return math.Clamp((value - max * add) / (max * 0.25), 0, 1) end

	if self.Icon then
		surface.SetMaterial(self.Icon)
		surface.SetDrawColor(col.r * 0.6 + 100, col.g * 0.6 + 100, col.b * 0.6 + 100, col.a * 0.8)
		surface.DrawTexturedRect(w/2 - boxsize/2, h/2 - boxsize/2, boxsize, boxsize)
	end

	surface.SetDrawColor(col)
	surface.DrawRect(
		w/2 + boxsize/2,
		h/2 + boxsize/2 - (boxsize + 2) * perc(0.75),
		2,
		math.ceil((boxsize + 2) * perc(0.75))
	)
	surface.DrawRect(
		w/2 - boxsize/2,
		h/2 + boxsize/2,
		(boxsize + 2) * perc(0.5),
		2
	)
	surface.DrawRect(
		w/2 - boxsize/2 - 2,
		h/2 - boxsize/2,
		2,
		(boxsize + 2) * perc(0.25)
	)
	surface.DrawRect(
		w/2 + boxsize/2 + 2 - (boxsize + 4) * perc(0),
		h/2 - boxsize/2 - 2,
		math.ceil((boxsize + 2) * perc(0)),
		2
	)

	local t1 = math.ceil(value)
	--local t2 = t1
	--if self.MemberValue2 then
	--	t2 = t2.."|"..self.LerpMemberValue2
	--end
	local nm = self:GetMemberName()
	local stat = lp:GetStatus(self.CodeName)
	local valid = stat and stat:IsValid()
	local int = 0
	if valid then
		int = stat:GetDTInt(1)
	end
	local int2 = int
	if self.PercentageCap then
		int2 = int.."%"
		draw.SimpleText(int2, "ZSHUDFontSmallest", w / 2, y + h / 3.5 - boxsize/2 + 5, color_white_alpha230, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		int = 0
	end
	draw.SimpleText(t1..(int ~= 0 and "|"..int2 or ""), ((int ~= 0)  and "ZSHUDFontSmallest" or t1 >= 10000 and "ZSHUDFontSmallest" or "ZSHUDFontSmall"), w / 2, y + h / 2.85 - boxsize/2 + 5, color_white_alpha230, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	if nm then
		draw.SimpleText(nm, (string.len(nm) >= 8 and "ZSHUDFontTiniestStatus2" or "ZSHUDFontTiniestStatus"), w / 2, y + h / 2.5 - boxsize/2 + 5, color_white_alpha230, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

vgui.Register("ZSStatus", PANEL, "Panel")
function GM:CreateDifficultyMenu()
    local difficultyDescriptions = {
        "Описание для сложности 1",
        "Описание для сложности 2",
        "Описание для сложности 3",
        "Описание для сложности 4",
        "Описание для сложности 5",
        "Описание для сложности 6",
        "Описание для сложности 7",
        "Описание для сложности 8",
        "Описание для сложности 9",
        "Описание для сложности 10"
    }

    local panel = vgui.Create("DFrame")
    panel:SetSize(500, 500)
    panel:SetTitle("Выберите уровень сложности")
    panel:Center()
    panel:MakePopup()

    local selectDifficulty = vgui.Create("DComboBox", panel)
    selectDifficulty:SetPos(25, 50)
    selectDifficulty:SetSize(150, 25)

    -- добавляем 10 элементов в выпадающий список
    for i = 1, 10 do
        selectDifficulty:AddChoice("Сложность " .. i)
    end

    local difficultyLabel = vgui.Create("DLabel", panel)
    difficultyLabel:SetPos(25, 100)
    difficultyLabel:SetSize(450, 100)
    difficultyLabel:SetWrap(true)

    local submitButton = vgui.Create("DButton", panel)
    submitButton:SetText("Выбрать")
    submitButton:SetPos(200, 50)
    submitButton:SetSize(75, 25)

    submitButton.DoClick = function()
        local selectedDifficulty = selectDifficulty:GetSelectedID() or 1
        local difficultyName = selectDifficulty:GetSelected()  or 1
        local difficultyDescription = difficultyDescriptions[selectedDifficulty]

        difficultyLabel:SetText("Название сложности: " .. difficultyName .. "\n\n" .. "Описание: " .. difficultyDescription)
        difficultyLabel:SetVisible(true)
    end
end
local faded_black = Color(0, 0, 0, 200)
local function clickClack(self)
	net.Start('zs_mastery_upgrade')
	net.WriteUInt(self.ParentHihi.ClassSelected or 11, 5)
	net.WriteUInt(MySelf:GetDTInt(self.ParentHihi.ClassSelected)+1, 8)
	net.SendToServer()
end
local Masterires = {
	"Ближний бой",
	"Стрелок",
	"Медик",
	"Плотник",
}
function GM:CreateMasteryMenu()
	if MySelf:Team() ~= TEAM_HUMAN then return end
	local desc = {}
    local panel = vgui.Create("DFrame")
    panel:SetSize(500, 500)
    panel:SetTitle("Выберите мастерство(BETA)")
    panel:Center()
    panel:MakePopup()
	self.MasteryLevel = panel

    local selectDifficulty = vgui.Create("DComboBox", panel)
    selectDifficulty:SetPos(25, 50)
    selectDifficulty:SetSize(150, 25)

    -- добавляем 10 элементов в выпадающий список
    for i = 1,#Masterires do
        selectDifficulty:AddChoice(Masterires[i])
    end

    local difficultyLabel = vgui.Create("DLabel", panel)
    difficultyLabel:SetPos(25, 100)
    difficultyLabel:SetSize(450, 100)
    difficultyLabel:SetWrap(true)

	difficultyLabel:SetText('Выбирай!')

    local submitButton = vgui.Create("DButton", panel)
    submitButton:SetText("Выбрать")
    submitButton:SetPos(200, 50)
    submitButton:SetSize(75, 25)

	self.subButton_2 = selectDifficulty

	local upgBut = vgui.Create("DButton", panel)
    upgBut:SetText("Прокачать")
    upgBut:SetPos(300, 50)
    upgBut:SetSize(75, 25)
	upgBut.ParentHihi = panel
	upgBut.DoClick = clickClack

    submitButton.DoClick = function()
        local selectedDifficulty = selectDifficulty:GetSelectedID() or 1
        local difficultyName = selectDifficulty:GetSelected()  or 1
        local difficultyDescription = Masterires[selectedDifficulty]
		local class = 10+selectedDifficulty
		panel.ClassSelected = class
		local tabled2 = self.mastery:GetLevel(class,MySelf:GetDTInt(class)+1)
        difficultyLabel:SetText(tabled2.Desc)
        difficultyLabel:SetVisible(true)
		local comp = tabled2.Components
		local printname = ""
		for k,v in pairs(comp) do
			printname = printname..GAMEMODE.ZSInventoryItemData["eter_"..k].PrintName.." x"..v.."\n"
		end
		for i=1,4 do
			if i == 3 then
				if tabled2.Points <= MySelf:GetPoints() then
					desc[i]:SetTextColor(COLOR_DARKGREEN)
				else
					desc[i]:SetTextColor(COLOR_DARKRED)
				end
			elseif i == 2 then
				if tabled2.XP <= MySelf:GetDCoins() then
					desc[i]:SetTextColor(COLOR_DARKGREEN)
				else
					desc[i]:SetTextColor(COLOR_DARKRED)
				end
			elseif i == 4 then
				local numberofcomp = table.Count(comp)
				local used = 0
				for k,v in pairs(comp) do
					local num = MySelf:GetInventoryItems()["eter_"..k]
					if num and num >= v then
						used = used + 1
					end
				end
				desc[i]:SetTextColor(used ~= numberofcomp and COLOR_DARKRED or COLOR_DARKGREEN) 
			end
			desc[i]:SetText(i == 2 and "ОПЫТА"..":"..tabled2.XP or i == 3 and "Поинтов:"..tabled2.Points or i == 1 and "Стоимость:" or printname)
		end
    end
	for i=1, 4 do
		local skilldesc = vgui.Create("DLabel", panel)
		skilldesc:SetFont("ZSHUDFontTiniest")
		skilldesc:SetTextColor(COLOR_GRAY)
		skilldesc:SetSize(220,120)
		--skilldesc:Dock(BOTTOM)
		skilldesc:SetText('')

		skilldesc:SetPos(skilldesc:GetX()+250,skilldesc:GetY()+40*i+90+50*(i==4 and 2 or 1))
		
		
		table.insert(desc, skilldesc)
	end
	panel.Paint = function(self, w, h)
	    -- Draws a rounded box with the color faded_black stored above.
	    draw.RoundedBox(2, 0, 0, w, h, faded_black)
	    -- Draws text in the color white.
	  --  draw.SimpleText("Derma Frame", "ZS3D2DUnstyleSmaller", 250, 5, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP)
		local howmuch = 50*(GAMEMODE.mastery:GetLevels(panel.ClassSelected or 11) or 0)
		local upgraded = 50*MySelf:GetDTInt(panel.ClassSelected or 11)
		--print(upgraded)
		for i = 0, howmuch, 50 do
			local val = math.Clamp(howmuch - i, 0, 50)

			surface.SetDrawColor(100, 170 * (upgraded <= i and 0 or 1), 215 * (upgraded <= i and 0 or 1), 255)
			surface.DrawRect(w - 450 +  1 + i/5 + i/50, h - 190 , val/5, h/25)


		end
	end
end
function GM:CreateLoreMenu(text)
	local scr = BetterScreenScale()
    local panel = vgui.Create("DFrame")
    panel:SetSize(500*scr, 500*scr)
    panel:SetTitle(text[1])
    panel:Center()
    panel:MakePopup()
	panel:ShowCloseButton(true)


    local difficultyLabel = vgui.Create("DLabel", panel)
    difficultyLabel:SetPos(25*scr, -100*scr)
    difficultyLabel:SetSize(500*scr, 460*scr)
    difficultyLabel:SetWrap(true)
	local huh = string.Explode(";",text[2])
	for k,v in pairs(huh) do
		huh[k] = v.."\n"
	end
	huh = table.concat(huh,"\n")
	difficultyLabel:SetText(huh)

end