INC_SERVER()

SWEP.MoanDelay = 3
function SWEP:ApplyMeleeDamage(ent, trace, damage)
	self.BaseClass.ApplyMeleeDamage(self, ent, trace, damage)
	if ent and ent:IsValidLivingHuman() then
		timer.Simple(0, function() ent:GiveStatus('necrosis',35):SetDTInt(1, -25) end)
	end
end
