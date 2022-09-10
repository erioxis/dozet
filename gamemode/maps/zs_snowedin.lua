hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in pairs(ents.FindByClass("info_player_zombie")) do 
		if ent:IsValid() then
			local pos = ent:GetPos()
			pos.z = pos.z - 35
			ent:SetPos(pos)
		end
	
	end
	for _, ent in pairs(ents.FindByClass("info_player_undead")) do 
		if ent:IsValid() then
			local pos = ent:GetPos()
			pos.z = pos.z - 35
			ent:SetPos(pos)
		end
	end
end)
