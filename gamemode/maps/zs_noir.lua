hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("func_door")) do
		ent:Remove()
	end
end)
