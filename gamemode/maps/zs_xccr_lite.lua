hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("item_suitcharger")) do ent:Remove() end
end)
