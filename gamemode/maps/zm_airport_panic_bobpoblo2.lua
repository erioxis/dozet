-- This profile gets rid of exploitable doors and teleporters.

hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, door in ipairs(ents.FindByClass("func_door_rotating")) do
		door:Fire("open", "", 0)
		door:Fire("kill", "", 1)
	end

	for _, ent in ipairs(ents.FindByClass("trigger_teleport")) do
		ent:Remove()
	end
end)
