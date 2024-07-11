AddCSLuaFile("shared.lua")
include("shared.lua")

function CLASS:OnSpawned(pl)
	for i=1,5 do
		pl["bloodth"..i] = true
	end
end
