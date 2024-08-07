ENT.Type = "anim"

ENT.CanPackUp = true
ENT.PackUpTime = 2
ENT.MaxAmmo = 9999 -- 10 minutes of repair time when fully loaded.

ENT.WrenchRepairMultiplier = 0.5

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true

ENT.IsBarricadeObject = false
ENT.AlwaysGhostable = true

function ENT:GetObjectHealth()
	return self:GetDTFloat(0)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(1, health)
end

function ENT:GetMaxObjectHealth()
	return self:GetDTFloat(1)
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
function ENT:HitByWrench(wep, owner, tr)
	if owner and owner == self:GetObjectOwner() and owner:KeyDown(IN_USE) and wep:GetClass() == 'weapon_zs_wrench'  then
		self:CreateShieldMenu(owner)
	end
	return false
end
function ENT:CreateShieldMenu(owner)
	owner:SendLua('OpenMenuOfShit(MySelf:NearestShit())')
end
