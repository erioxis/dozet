hook.Add("InitPostEntityMap", "Adding", function()
	

	for _, ent in ipairs(ents.FindByClass("item_ammo_crate")) do ent:Remove() end

	for _, ent in ipairs(ents.FindByClass("prop_physics*")) do
		if ent:GetPos().z < -300 then
			ent:Remove()
		end
	end
end)
