-- This profile gets rid of exploitable doors.

hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, door in ipairs(ents.FindByClass("func_door_rotating")) do
		door:Fire("open", "", 0)
		door:Fire("kill", "", 1)
	end
end)
