hook.Add("InitPostEntityMap", "MapProfile", function()
	for _, ent in ipairs(ents.FindByClass("func_physbox")) do ent:Remove() end
end)
