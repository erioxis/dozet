INC_CLIENT()

ENT.NextEmit = 0

	--pac.SetupENT(ENT) -- this can also be used in initialize using "self" instead of "ENT"
	
	--function ENT:Initialize()
	--	self:AttachPACPart(outfit)
	--end

	--function ENT:OnRemove()
	--	self:RemovePACPart(outfit)
	--end
	
function ENT:Initialize()
	GAMEMODE:TopNotify(COLOR_GREEN,{killicon = "weapon_zs_arsenalcrate"},translate.Get("gift_h_s"))
end
