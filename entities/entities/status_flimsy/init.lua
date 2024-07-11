INC_SERVER()

function ENT:SetDie(fTime)
	if fTime == 0 or not fTime then
		self.DieTime = 0
	elseif fTime == -1 then
		self.DieTime = 999999999
	else
		self.DieTime = CurTime() + fTime
		self:SetDuration(fTime)
	end
end
function ENT:EntityTakeDamage(ent, dmginfo)
	local attacker = dmginfo:GetAttacker()
	local owner = self:GetOwner()
	if ent ~= owner and attacker:IsValidLivingZombie() then return end
	
	if math.random(10) == 5 and table.Count(owner:GetInventoryItems()) > 1  then
		local use = {}
		for item,v in pairs(owner:GetInventoryItems()) do
			local g = table.HasValue(string.Explode("_",item), "curse")
			if item ~= nouse and string.len(item) >= 5 and !g then
				table.insert(use, #use + 1,item)
			end
		end
		local drop = table.Random(use)
		local droped = owner:DropInventoryItemByType(drop)
		if droped:IsValid() then
			droped:SetPos(owner:GetPos()+Vector(0,0,30))
			timer.Simple(0.1, function() droped:GetPhysicsObject():SetVelocity(VectorRand(-500,500)) end )
			owner:CenterNotify(COLOR_RED, translate.ClientFormat(owner, "droped_x", GAMEMODE.ZSInventoryItemData[drop].PrintName))
		end
	end
end
