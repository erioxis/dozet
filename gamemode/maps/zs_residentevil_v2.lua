hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("prop_physics*")) do ent:GetPhysicsObject():EnableMotion(true) end
end)
