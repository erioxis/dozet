local PANEL = {}
local dailyreward = {["Daily1"] = {Goal = 100, Reward = 2500},
["Daily2"] = {Goal = 15000, Reward = 6500},
["Daily3"] = {Goal = 25000, Reward = 3500},
["Daily4"] = {Goal = 10, Reward = 4500},
["Daily5"] = {Goal = 75, Reward = 8500},
["Daily6"] = {Goal = 2, Reward = 8500}

}
local num = 1
local tbl = {Goal = 100, Reward = 2500}
local function DoAchievements()
    local daily = GAMEMODE:GetDaily()
    tbl = dailyreward["Daily"..math.max(1,daily%7)]
    num = math.max(1,daily%7)
        

   --[[self.Achievements["daily"..daily] = {
        Name = translate("challenge_daily"..num),
        Desc = translate("challenge_daily_d"..num),
        Goal = tbl.Goal,
    --    Daily = true,
        Reward = tbl.Reward
    }]]
	GAMEMODE.Achievements["daily_post"].Name = translate.Get("challenge_daily"..num)
	GAMEMODE.Achievements["daily_post"].Desc = translate.Get("challenge_daily_d"..num)
	GAMEMODE.Achievements["daily_post"].Goal = tbl.Goal
	GAMEMODE.Achievements["daily_post"].Daily = true
	GAMEMODE.Achievements["daily_post"].DailyCount = daily
	GAMEMODE.Achievements["daily_post"].Reward = tbl.Reward
    --PrintTable(self.Achievements["daily"..(daily or 1)]) print("daily"..(daily or 1))
end

function PANEL:Init()
    self:SetSize(510, 600)
    self:Center()
    self:MakePopup()
    self:DockPadding(0, 24, 0, 0)
    self:SetTitle("")
    self:ShowCloseButton(false)
    -- New close button
    self.CB = self:Add("DButton")
    self.CB:SetSize(24, 24)
    self.CB:SetPos(486, 0)
    self.CB:SetText("")


    

    self.CB.DoClick = function()
        self:Close()
    end

    self.CB.Paint = function(this, w, h)
        self:ShadowedText("exit", "ZSHUDFontTiniest", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    -- Back button
    self.BB = self:Add("DButton")
    self.BB:SetSize(24, 24)
    self.BB:SetPos(462, 0)
    self.BB:SetText("")


    self.SP = self:Add("DScrollPanel")
    self.SP:Dock(FILL)
    self.SP.VBar:SetHideButtons(true)
    self.SP.VBar.Paint = function() end

    self.SP.VBar.btnGrip.Paint = function(this, w, h)
        surface.SetDrawColor(self:GetTint())
        surface.DrawRect(0, 0, w, h)
    end

    local i = 1
    DoAchievements()
    local count = table.Count(GAMEMODE.Achievements)

    for id, ach in pairs(GAMEMODE.Achievements) do
        local panel = self.SP:Add("DPanel")
        panel:Dock(TOP)
        panel:SetTall(ach.Goal and 80 or 50)

        if ach.Goal then
            panel.Done = (GAMEMODE.AchievementsProgress[id] or 0) >= ach.Goal
        else
            panel.Done = GAMEMODE.AchievementsProgress[id]
        end

        panel.BG = i % 2 + 1 == 1
        panel.Line = i < count

        panel.Paint = function(this, w, h)
            -- BG
            surface.SetDrawColor(self:GetTheme(this.BG and 2 or 1))
            surface.DrawRect(0, 0, w, h)

            if this.Done then
                surface.SetDrawColor(0, 175, 100)
                surface.DrawRect(0, 0, w, h)
            end

            -- Texts
            self:ShadowedText(ach.Name:upper().." -"..translate.Get("xp")..(ach.Reward or ""), "ZSHUDFontTiny", 8, 7, ach.Daily and Color(178, 192, 53) or self:GetTheme(3), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
            self:ShadowedText(ach.Desc, "ZSHUDFontTiniest", 8, 25, self:GetTheme(3), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)

            -- Bars
            if ach.Goal then
                surface.SetDrawColor(self:GetTheme(this.BG and 1 or 2))
                surface.DrawRect(8, 48, w - 16, 24)
                surface.SetDrawColor(self:GetTint())
                surface.DrawRect(8, 48, self:Map(GAMEMODE.AchievementsProgress[id] or 0, 0, ach.Goal, 0, w - 16), 24)
                self:ShadowedText((GAMEMODE.AchievementsProgress[id] or 0) .. "/" .. ach.Goal, "ZSHUDFontTiny", w / 2, 60, self:GetTheme(3), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            if this.Line then
                surface.SetDrawColor(self:GetTheme(3))
                surface.DrawLine(0, h - 1, w, h - 1)
            end
            if this.Reward then
                self:ShadowedText(this.Reward, "ZSHUDFontTiny", w / 2, 10, self:GetTheme(3), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end
        end

        i = i + 1
    end


end

function PANEL:Paint(w, h)
    surface.SetDrawColor(self:GetTheme(1))
    surface.DrawRect(0, 0, w, h)
    surface.SetDrawColor(self:GetTint())
    surface.DrawRect(0, 0, w, 24)
    self:ShadowedText(translate.Get("mm_challenges"), "ZSHUDFontSmall", 8, 12, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
end

-- Should return HiderColor, SeekerColor or Specator color
function PANEL:GetTint()
    if LocalPlayer():Team() == TEAM_HUMAN then
        return Color(145, 156, 253)
    elseif LocalPlayer():Team() == TEAM_UNDEAD then
        return  Color(7, 92, 18)
    else
        return team.GetColor(LocalPlayer():Team())
    end
end

-- Differences between themes
local light = {
    Color(255, 255, 255), -- BG
    Color(175, 175, 175), -- Header
    Color(0, 0, 0), -- Text
}

local dark = {
    Color(25, 25, 25), -- BG
    Color(50, 50, 50), -- Header
    Color(255, 255, 255), -- Text
}

function PANEL:GetTheme(i)
    return dark[i] or Color(0, 0, 0)
end

function PANEL:ShadowedText(text, font, x, y, color, alignx, aligny)
    draw.SimpleText(text, font, x + 1, y + 1, Color(0, 0, 0, 200), alignx, aligny)
    draw.SimpleText(text, font, x, y, color, alignx, aligny)
end

-- https://stackoverflow.com/questions/929103/convert-a-number-range-to-another-range-maintaining-ratio
function PANEL:Map(value, oldMin, oldMax, newMin, newMax)
    return (((value - oldMin) * (newMax - newMin)) / (oldMax - oldMin)) + newMin
end

vgui.Register("ZS.Challenges", PANEL, "DFrame")