--ЭТОТ КОД ВОЙДЕТ В ИСТОРИЮ!
GM.Events6500 = {
	function()
		for k,v in pairs(team.GetPlayers(TEAM_UNDEAD)) do
            v:GodEnable()
            timer.Simple(5, function(arguments)
                v:GodDisable()
            end)
        end
        
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ СДЕЛАТЬ ВСЕХ ЗОМБИ БЕССМЕРТНЫМИ НА 5 СЕКУНД." )
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
		for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('stunned',7)
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ...ОГЛУШИТЬ ЛЮДЕЙ ЗА ИХ ГРЕХИ!" )
		return true
	end,
    function()
		for k,v in pairs(ents.FindByClass('prop_databox')) do
            if v then
                v:Remove()
            end
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ УДАЛИТЬ БОЧКИ С ДАННЫМИ!" )
		return true
	end,
    function()
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
	end,
    function()
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ВСЕХ ТЕЛЕПОРТИРОВАТЬ НА НАТУРАЛЬНЫЙ СИГИЛ!если он есть...Иначе поставит 15 хп.")
        local huh = ents.FindByClass('prop_obj_sigil')
        local sigil = huh[math.random(1,#huh)]
        if !sigil.NodePos then 
            for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
                v:SetHealth(15)
            end
           return false
        end
        for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
            v:SetPos(sigil.NodePos)
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
        if GAMEMODE.ObjectiveMap then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) - 60
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ И СОКРАТИЛ ВОЛНУ!")
		return true
	end,
    function(time, rage)
        if GAMEMODE.ObjectiveMap then return false end
        gamemode.Call(
            gamemode.Call( "GetWaveActive" ) and "SetWaveEnd" or "SetWaveStart",
            (gamemode.Call( "GetWaveActive" )  and gamemode.Call( "GetWaveEnd" ) or  gamemode.Call( "GetWaveStart" )) + 60
        )
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ИСПОЛЬЗОВАТЬ СВОИ ЧАСЫ И ПРОДЛИЛ ВОЛНУ!!")
		return true
	end,
    function(time, rage)
        for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
            v:GiveStatus('knockdown',10/(math.max(0.1,v.KnockdownRecoveryMul or 1)))
        end
        PrintMessage( HUD_PRINTTALK, "БАРАБОГ РЕШИЛ ОТОРВАТЬ НОГИ ВЫЖИВШИМ!(ХЕХЕ ВАМ ВОССТАНОВИТ,НО НЕ СКОРО)")
		return true
	end,
}
GM.Events11500 = {
	
}
GM.Events35000 = {
	
}
function GM:DirectorThink(time, rage)
	local mapmul = self.DirectorMAP or 0
	mapmul = mapmul + 1
    rage = rage * mapmul
	if rage > 35000  then
        local rand = math.random(1,#self.Events35000)
		local func = self.Events35000[rand]
		return func(time, rage)
    elseif rage > 11500 then
        local rand = math.random(1,#self.Events11500)
		local func = self.Events11500[rand]
		return func(time, rage)
    elseif rage > 6500  then
        local rand = math.random(1,#self.Events6500)
		local func = self.Events6500[rand]
		return func(time, rage)
    end
end