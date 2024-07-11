
hook.Add("InitPostEntityMap", "Adding", function()
	local ent = ents.Create("prop_static")
	if ent:IsValid() then
		ent:SetModel("models/props_c17/oildrum001_explosive.mdl")
		ent:SetPos(Vector(-617.658447, 106.287331, 32.79797))
		ent:Spawn()
	end
	
end)
