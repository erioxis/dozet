--ЭТОТ КОД ВОЙДЕТ В ИСТОРИЮ!
local random_opt = math.random
local function GetPlayers()
    local cgg = {}
    for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
        if !v:IsSkillActive(SKILL_BARA_CURSED) then
            cgg[k] = v
        end
    end
    return cgg
end
GM.Events6500 = {
	function()
		for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
            v:GodEnable()
            timer.Simple(7, function(arguments)
                v:GodDisable()
            end)
        end
        
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ СДЕЛАТЬ ВСЕХ ЗОМБИ БЕССМЕРТНЫМИ НА 7 СЕКУНД." )
		return true
	end,
    function()
		for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
            v:SetZArmor(v:GetZArmor() + v:GetMaxHealth()*0.5)
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ВЫДАТЬ ДОСЕЕВЦАМ БРОНЮ." )
		return true
	end,
    function()
		for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('stunned',7)
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ...ОГЛУШИТЬ ЛЮДЕЙ ЗА ИХ ГРЕХИ!" )
		return true
	end,
    function()
		for k,v in ipairs(ents.FindByClass('prop_databox')) do
            if v then
                v:Remove()
            end
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ УДАЛИТЬ БОЧКИ С ДАННЫМИ!" )
		return true
	end,
   --[[ function()
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ СМЕНИТЬ КАРТУ!" )
        for i=1,5 do
            timer.Simple(i, function(arguments)
                PrintMessage( HUD_PRINTTALK, "СМЕНА КАРТЫ ЧЕРЕЗ "..6-i.."..." )
            end)
        end
        timer.Simple(7, function(arguments)
            PrintMessage( HUD_PRINTTALK, "ХЕХЕ ПРЕРВАЛ СМЕНУ КАРТЫ!" )
        end)
		return true
	end, Просто спамит в чат.]] 
    function()
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ВСЕХ ТЕЛЕПОРТИРОВАТЬ НА НАТУРАЛЬНЫЙ СИГИЛ!если он есть...Иначе поставит 15 хп.")
        local huh = ents.FindByClass('prop_obj_sigil')
        local sigil = huh[random_opt(1,#huh)]
        if !sigil.NaturallySpawned then 
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:SetHealth(15)
            end
           return false
        end
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:SetPos(sigil.NodePos or sigil:GetPos())
        end
		return true
	end,
    function(time)
        GAMEMODE.NextThinkDirector = time + 120
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ устал колдовать...ОН ВЕРНЕТСЯ!")
		return true
	end,
    function(time, rage)
        timer.Create('barabog_hihi_'..time, 0.7,5,function(arguments)
            GAMEMODE:DirectorThink(CurTime(),rage)
        end)
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ ЗОЛ!ОН НАКОЛДОВАЛ 5 СОБЫТИЙ!")
		return true
	end,
    function(time, rage)
        if GAMEMODE.ObjectiveMap  or GAMEMODE:GetWave() == 12 then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) - 60
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ И СОКРАТИЛ ВОЛНУ!")
		return true
	end,
    function(time, rage)
        if GAMEMODE.ObjectiveMap  or GAMEMODE:GetWave() == 12 then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) + 60
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ И ПРОДЛИЛ ВОЛНУ!!")
		return true
	end,
    function(time, rage)
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('knockdown',5/(math.max(0.1,v.KnockdownRecoveryMul or 1)))
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ОТОРВАТЬ НОГИ ВЫЖИВШИМ!(ХЕХЕ ВАМ ВОССТАНОВИТ,НО НЕ СКОРО)")
		return true
	end,
}
GM.Events11500 = {
    function(time, rage)
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('knockdown',15/(math.max(0.1,v.KnockdownRecoveryMul or 1)))
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ОТОРВАТЬ НОГИ ВЫЖИВШИМ!")
		return true
	end,
    function(time, rage)
        if GAMEMODE.ObjectiveMap or GAMEMODE:GetWave() == 12 then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) + 120
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ В ПОЛНУЮ МОЩЬ И ПРОДЛИЛ ВОЛНУ!")
		return true
	end,
    function(time, rage)
        if GAMEMODE.ObjectiveMap or GAMEMODE:GetWave() == 12 then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) - 120
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ В ПОЛНУЮ МОЩЬ И СОКРАТИЛ ВОЛНУ!")
		return true
	end, 
    function(time, rage)
        timer.Create('barabog_hihi_'..time, 0.7,10,function(arguments)
            GAMEMODE:DirectorThink(CurTime(),6550)
        end)
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ ОЧEНЬ ЗОЛ!ОН НАКОЛДОВАЛ 10 СЛАБЫХ СОБЫТИЙ!")
		return true
	end,
    function()
		for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('stunned',15)
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ СТУКНУЛ ДУБИНОЙ ПО ЛБУ ЛЮДЕЙ!" )
		return true
	end,
    function()
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ВСЕХ ТЕЛЕПОРТИРОВАТЬ НА НАТУРАЛЬНЫЙ СИГИЛ!А ЕСЛИ НЕТУ - ТО УБЬЕТ.")
        local huh = ents.FindByClass('prop_obj_sigil')
        local truesigils = {}
        for k,v in pairs(huh) do
            if v.NaturallySpawned then
                truesigils[#truesigils+1] = v
            end
        end
        local sigil = truesigils[random_opt(1,#truesigils)]
        if !sigil.NaturallySpawned then 
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:Kill()
            end
           return false
        end
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:SetPos(sigil.NodePos or v:GetPos())
        end
		return true
	end,
    function(time)
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ НEМНОГО ОТДОХНУТЬ!")--много
        GAMEMODE.NextThinkDirector = time + 210
		return true
	end,
    function(time)
        PrintMessage( HUD_PRINTTALK, "ХEХE РEШИЛ ПОДДEРЖАТЬ ЛЮДEЙ,ДАВ ИМ...АИРДРОПЫ!")
        GAMEMODE:CreateRandomObjectPos("prop_airdrop", 3)
		return false
	end,
    function(time, rage)
        local randers = {}
        local stock = 0
        local rand
        for i=1,3 do
            rand = random_opt(1,7)
            randers[#randers + 1] = rand
            stock = stock + rand
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ СЫГРАЛ В КАЗИНО И ВЫБИЛ - "..randers[1]..randers[2]..randers[3])
        if stock == 21 then
            PrintMessage( HUD_PRINTTALK, "JACKPOT - ЛЮДИ ПОЛУЧАТ 20 СОБЫТИЙ!")
            timer.Create("barahous"..rand..randers[2].."Ы",0.5, 20, function() GAMEMODE:DirectorThink(CurTime(),rage) end)
        elseif stock > 14 then
            PrintMessage( HUD_PRINTTALK, "ЛАДНО,БАРАБОГ ПРОСТО ВОЗЬМЕТ У ВАС 30% ПОИНТОВ!")
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:SetPoints(v:GetPoints()*0.7)
            end
        elseif stock > 7 then
            PrintMessage( HUD_PRINTTALK, "ЛАДНО,БАРАБОГ ПРОСТО ВОЗЬМЕТ У ВАС 15% ПОИНТОВ!")
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:SetPoints(v:GetPoints()*0.85)
            end
        else
            PrintMessage( HUD_PRINTTALK, "БАРАБОГ НЕ ВЫБИЛ СОБЫТИЙ((((")
        end
		return false
	end,
}
GM.Events35000 = {
    function(time, rage)
        local randers = {}
        local stock = 0
        local rand
        for i=1,3 do
            rand = random_opt(1,7)
            randers[#randers + 1] = rand
            stock = stock + rand
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ СЫГРАЛ В КАЗИНО И ВЫБИЛ - "..randers[1]..randers[2]..randers[3])
        if stock == 21 then
            PrintMessage( HUD_PRINTTALK, "JACKPOT - ЛЮДИ ПОЛУЧАТ 30 СОБЫТИЙ!")
            timer.Create("barahous"..rand..randers[2].."Ы",0.5, 30, function() GAMEMODE:DirectorThink(CurTime(),12000) end)
        elseif stock > 9 then
            PrintMessage( HUD_PRINTTALK, "ЛАДНО,БАРАБОГ ПРОСТО ВОЗЬМЕТ У ВАС 50% ПОИНТОВ!")
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:SetPoints(v:GetPoints()*0.5)
            end
        elseif stock > 5 then
            PrintMessage( HUD_PRINTTALK, "ЛАДНО,БАРАБОГ ПРОСТО ВОЗЬМЕТ У ВАС 25% ПОИНТОВ!")
            for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
                v:SetPoints(v:GetPoints()*0.75)
            end
        else
            PrintMessage( HUD_PRINTTALK, "БАРАБОГ НЕ ВЫБИЛ СОБЫТИЙ((((")
            return false
        end
		return true
	end,
    function(time)
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ ЗОЛ!")--много
        GAMEMODE.NextThinkDirector = time - 50
		return true
	end,
    function(time, rage)
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('knockdown',25/(math.max(0.1,v.KnockdownRecoveryMul or 1)))
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ПРОКЛЯСТЬ НОГИ ВЫЖИВШИМ!")
		return true
	end,
    function(time, rage)
        for k,v in pairs(GetPlayers(TEAM_HUMAN)) do
           local items = v:GetInventoryItems()
           local i = 0
           local save = {}
           for k2,v2 in pairs(items) do
                if  GAMEMODE:GetInventoryItemType(k2) == INVCAT_ETERNAL then continue end
                i = i + 1
                save[i] = k2
           end
           local trinket = save[math.random(1,i)]
           if trinket then
            v:SendLua('GAMEMODE:CenterNotify(COLOR_RED, "У вас спиздили: "..GAMEMODE.ZSInventoryItemData["'..trinket..'"].PrintName)')
            v:TakeInventoryItem(trinket)
           end
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ УКРАСТЬ 1 ТРИНКЕТ У ВСЕХ ИГРОКОВ!")
		return true
	end,
    function()
		for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
            v:GodEnable()
            timer.Simple(13, function(arguments)
                v:GodDisable()
            end)
        end
        
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ СДЕЛАТЬ ВСЕХ ЗОМБИ БЕССМЕРТНЫМИ НА 13 СЕКУНД." )
		return true
	end,

}
function GM:DirectorThink(time, rage)
	local mapmul = self.DirectorMAP or 0
	mapmul = mapmul + 1
    rage = rage * mapmul
	if rage > 35000  then
        local rand = random_opt(1,#self.Events35000)
		local func = self.Events35000[rand]
		return func(time, rage)
    elseif rage > 11500 then
        local rand = random_opt(1,#self.Events11500)
		local func = self.Events11500[rand]
		return func(time, rage)
    elseif rage > 6500  then
        local rand = random_opt(1,#self.Events6500)
		local func = self.Events6500[rand]
		return func(time, rage)
    end
end