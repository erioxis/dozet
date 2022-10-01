-- FOR ONE TIME: PLY_STEAM_ID, ACHIEVEMENT_ID
-- FOR PROGRESS: PLY_STEAM_ID, ACHIEVEMENT_ID, PROGRESS
local PLAYER = FindMetaTable("Player")
-- Create SQL table
sql.Query("CREATE TABLE IF NOT EXISTS lhns_achievements_onetime (SteamID STRING, AchievementID STRING)")
sql.Query("CREATE TABLE IF NOT EXISTS lhns_achievements_progress (SteamID STRING, AchievementID STRING, Progress INT)")

function GM:PlayerNotifyAchievement(ply, id)
    net.Start("HNS.AchievementsGet")
    net.WriteEntity(ply)
    net.WriteString(id)
    net.Broadcast()
end

-- Get player achievements from SQL (I'd say this is fairly expensive to do)
function PLAYER:ProcessAchievements()
    self.Achs = {}
    -- Store count
    local completed = 0

    -- Get from SQL
    for id, ach in pairs(GAMEMODE.Achievements) do
        local result = sql.Query("SELECT * FROM lhns_achievements_" .. (ach.Goal and "progress" or "onetime") .. " WHERE SteamID = '" .. self:SteamID() .. "' AND AchievementID = '" .. id .. "'")

        -- Result will return nil if there's no sql entry
        if result then
            -- If we have a goal, we'll check for progress
            if ach.Goal then
                result = result[1]
                result.Progress = tonumber(result.Progress)
                -- Store progress
                self.Achs[id] = result.Progress

                -- Check for completion
                if self.Achs[id] >= ach.Goal then
                    completed = completed + 1
                end
            else
                -- If we get a result on an achievement with no goal, achievement was achieved
                self.Achs[id] = true
                completed = completed + 1
            end
        end
    end
    net.Start("HNS.AchievementsProgress")
    net.WriteString(util.TableToJSON(self.Achs))
    net.Send(self)
end

-- For one time achievements
function PLAYER:GiveAchievement(id)
    -- Check if achievement was already earned
    if self.Achs[id] then return end
    -- Insert into SQL
    sql.Query("INSERT INTO lhns_achievements_onetime VALUES('" .. self:SteamID() .. "', '" .. id .. "')")
    -- Process achievements
    self:ProcessAchievements()
    -- Log
    print(string.format("[ZS] Player %s (%s) earned achievement %s (%s)", self:Name(), self:SteamID(), GAMEMODE.Achievements[id].Name, id))
    self:AddZSXP(GAMEMODE.Achievements[id].Reward or 200)
    PrintMessage(HUD_PRINTTALK, translate.Format("ach_trans", self:Name(), self:SteamID(), GAMEMODE.Achievements[id].Name, id))
    -- Call hook
    hook.Run("HASAchievementEarned", self, id)
end

-- For progressiv eachievements
function PLAYER:GiveAchievementProgress(id, count)
    -- Check if achievement was already earned
    if count == 0 or (self.Achs[id] or 0) >= GAMEMODE.Achievements[id].Goal then return end
    -- Make sure this exists for calculation
    self.Achs[id] = self.Achs[id] or 0

    -- Update or insert values
    if self.Achs[id] > 0 then
        sql.Query("UPDATE lhns_achievements_progress SET SteamID = SteamID, AchievementID = AchievementID, Progress = " .. math.Clamp(self.Achs[id] + count, 0, GAMEMODE.Achievements[id].Goal) .. " WHERE SteamID = '" .. self:SteamID() .. "' AND AchievementID = '" .. id .. "'")
    else
        sql.Query("INSERT INTO lhns_achievements_progress VALUES('" .. self:SteamID() .. "', '" .. id .. "', " .. math.Clamp(count, 0, GAMEMODE.Achievements[id].Goal) .. ")")
    end

    -- Cache
    self.Achs[id] = self.Achs[id] + count
    -- Log
    --print(string.format("[ZS] Player %s (%s) has new achievement progress on %s (%s): %s/%s", self:Name(), self:SteamID(), GAMEMODE.Achievements[id].Name, id, self.Achs[id], GAMEMODE.Achievements[id].Goal))

    -- If we earned the achievement
    if self.Achs[id] >= GAMEMODE.Achievements[id].Goal then
        GAMEMODE:PlayerNotifyAchievement(self, id)
        self:AddZSXP(GAMEMODE.Achievements[id].Reward or 200)
        PrintMessage(HUD_PRINTTALK, translate.Format("ach_trans", self:Name(), self:SteamID(), GAMEMODE.Achievements[id].Name, id))
        -- Run hook
        hook.Run("HASAchievementEarned", self, id)
    end

    -- Update
    self:ProcessAchievements()
end

-- HERE COMES THE LOGIC!... I took it from a previous recoding attempt, back when I separated a function from its perenthesis
hook.Add("PlayerSpawn", "HNS.Achievements", function(ply)
    -- Setup
    ply.HWTime = 0
    ply.TauntsSingle = 0
end)

local lastSecond = 0
hook.Add("PlayerSay", "HNS.Achievements", function(ply, text)
    local playerInput = string.Explode( " ", text )

    -- Magic words
    if string.lower(text) == "секрет" or string.lower(text) == "secret" then
        ply:GiveAchievement("ticklefight")
    end
    if string.lower(text) == "fuck you" or string.lower(text) == "stfu" or string.lower(text) == "ты еблан" or string.lower(text) == "хуйня сервер" then
        ply:GiveAchievement("blyat")
    end
    
end)
