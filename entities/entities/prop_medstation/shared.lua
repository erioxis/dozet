ENT.Type = "anim"
ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

ENT.CanPackUp = true
ENT.PackUpTime = 3
ENT.MaxAmmo = 450 -- 10 minutes of repair time when fully loaded.
ENT.HealValue = 14
ENT.MaxDistance = 110

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true

ENT.IgnoreBullets = true

ENT.IsBarricadeObject = false
ENT.AlwaysGhostable = true

function ENT:GetObjectHealth()
	return self:GetDTFloat(1)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(2, health)
end

function ENT:GetMaxObjectHealth()
	return self:GetDTFloat(2)
end

function ENT:GetNextRepairPulse()
	return self:GetDTFloat(0)
end

function ENT:SetNextRepairPulse(time)
	self:SetDTFloat(0, time)
end

function ENT:SetObjectOwner(owner)
	self:SetDTEntity(0, owner)
end

function ENT:GetObjectOwner()
	return self:GetDTEntity(0)
end

function ENT:SetAmmo(ammo)
	self:SetDTInt(0, ammo)
end

function ENT:GetAmmo()
	return self:GetDTInt(0)
end

function ENT:SetAlt(boolean)
	self:SetDTBool(0, boolean)
end

function ENT:GetAlt()
	return self:GetDTBool(0)
end


function ENT:ClearObjectOwner()
	self:SetObjectOwner(NULL)
end
function ENT:HitByWrench(wep, owner, tr)
	if owner and owner == self:GetObjectOwner() and wep:GetBlockState() and wep:GetClass() == 'weapon_zs_wrench'  then
		self:SetAlt(!self:GetAlt())
	end
	return false
end