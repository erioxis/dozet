hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("trigger_teleport")) do
		ent:Remove()
	end

	for _, ent in ipairs(ents.FindByClass("trigger_hurt")) do
		ent:Remove()
	end
end)
