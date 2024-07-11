AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")
local steeringratio = 0.8
ENT.NextResnya = 0
function ENT:Think()
	local owner = self:GetOwner()

	if self:GetTime() <= 0 then
		self:Remove()
		return
	end
	self:AddTime(-0.1)
	self:NextThink(CurTime() + 0.1)
	return true
end