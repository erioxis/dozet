hook.Add("InitPostEntityMap", "DestroyTHurts", function()
	for _, ent in ipairs(ents.FindByClass("trigger_hurt")) do
		ent:Remove()
	end
end)
