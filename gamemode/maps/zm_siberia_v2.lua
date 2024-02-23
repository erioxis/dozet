hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("func_door_rotating")) do
		ent:Remove()
	end
end)