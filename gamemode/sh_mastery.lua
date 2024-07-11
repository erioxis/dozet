mastery = GM.mastery
for i=11,14 do
    mastery[i] = {}
end
function mastery:GetLevels(class)
    return #self[class]
end
function mastery:AddLevel(class, tabled, level)
    level = level or 1 
    tabled["Level"] = level
    tabled['Desc'] = translate.Get("mastery_desc_"..class..'_'..tabled["Level"])
    self[class][level] = tabled
end
function mastery:GetLevel(class, level)
    return self[class][level]
end

--Мили
mastery:AddLevel(11, {Components = {doseit = 2}, Points = 150,XP = 2500}, 1)
mastery:AddLevel(11, {Components = {doseit = 2, lithum = 1}, Points = 120,XP = 3500}, 2)
mastery:AddLevel(11, {Components = {doseit = 3, lithum = 1}, Points = 0,XP = 1500}, 3)
mastery:AddLevel(11, {Components = {lithum = 1, doseit_2 = 1}, Points = 50,XP = 500}, 4)
mastery:AddLevel(11, {Components = {lithum = 2, doseit_2 = 2}, Points = 150,XP = 1900}, 5)
mastery:AddLevel(11, {Components = {shelon_2 = 1, egurm_2 = 4}, Points = 250,XP = 2500}, 6)
--Стрелок
mastery:AddLevel(12, {Components = {doseit = 1, lithum = 1}, Points = 20,XP = 10500}, 1)
mastery:AddLevel(12, {Components = {doseit = 4, lithum = 1}, Points = 50,XP = 5500}, 2)
mastery:AddLevel(12, {Components = {doseit = 2, lithum = 3}, Points = 60,XP = 1488}, 3)
mastery:AddLevel(12, {Components = {doseit = 2, lithum_2 = 1}, Points = 10,XP = 200}, 4)
mastery:AddLevel(12, {Components = {doseit = 3, lithum_2 = 2}, Points = 0,XP = 5000}, 5)
mastery:AddLevel(12, {Components = {doseit_2 = 2, lithum_2 = 2}, Points = 0,XP = 8000}, 6)
--Медик
mastery:AddLevel(13, {Components = {lithum = 2}, Points = 10,XP = 500}, 1)
mastery:AddLevel(13, {Components = {lithum = 3, egurm = 1}, Points = 20,XP = 1500}, 2)
mastery:AddLevel(13, {Components = {lithum = 4, egurm = 2}, Points = 30,XP = 2500}, 3)
mastery:AddLevel(13, {Components = {lithum = 1, egurm_2 = 1}, Points = 30,XP = 5000}, 4)
mastery:AddLevel(13, {Components = {lithum = 2, egurm_2 = 2}, Points = 50,XP = 0}, 5)
mastery:AddLevel(13, {Components = {lithum_2 = 1, egurm_2 = 2}, Points = 50,XP = 0}, 6)
--Плотник
mastery:AddLevel(14, {Components = {doseit = 3}, Points = 0,XP = 1500}, 1)
mastery:AddLevel(14, {Components = {doseit = 3, egurm = 2}, Points = 0,XP = 500}, 2)
mastery:AddLevel(14, {Components = {doseit = 2, egurm = 3}, Points = 0,XP = 100}, 3)
mastery:AddLevel(14, {Components = {lithum = 2, egurm_2 = 1}, Points = 0,XP = 0}, 4)
mastery:AddLevel(14, {Components = {lithum = 1, egurm_2 = 3}, Points = 0,XP = 0}, 5)
mastery:AddLevel(14, {Components = {shelon_2 = 1, egurm_2 = 2}, Points = 0,XP = 0}, 6)


--net
net.Receive("zs_mastery_upgrade", function(len, pl)
    local class = net.ReadUInt(5)
    local nextlevel = net.ReadUInt(8)
    local ing = mastery:GetLevel(class, nextlevel)

    local comp = ing.Components
    local xp = ing.XP
    local points = ing.Points

    local numberofcomp = table.Count(comp)
    local used = 0


    for k,v in pairs(comp) do
        local num = pl.ZSInventory["eter_"..k]
        if num and num >= v then
            used = used + 1
        end
    end
    if used == numberofcomp and xp <= pl:GetDCoins() and points <= pl:GetPoints() and pl:GetDTInt(class)+1 == nextlevel then
       -- print('yes!')
        for k,v in pairs(comp) do
            for i=1,v do
                pl:TakeInventoryItem("eter_"..k)
            end
        end
        pl:SetPoints(pl:GetPoints()-points)
        pl:AddDCoins(-xp)
        pl:SetDTInt(class, pl:GetDTInt(class)+1)
    end
end)