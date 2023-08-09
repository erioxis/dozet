ENT.Type = "anim"

ENT.m_NoNailUnfreeze = true
ENT.NoNails = true

ENT.CanPackUp = true
ENT.PackUpTime = 3
ENT.IgnorePackTimeMul = true

ENT.IsBarricadeObject = true
ENT.IgnoreBullets = true
ENT.IgnoreMeleeTeam = TEAM_HUMAN
function ENT:GetObjectHealth()
	return self:GetDTFloat(0)
end

function ENT:SetMaxObjectHealth(health)
	self:SetDTFloat(1, health)
end

function ENT:GetMaxObjectHealth()
	return self:GetDTFloat(1)
end

function ENT:SetObjectOwner(ent)
	self:SetDTEntity(0, ent)
end

function ENT:GetObjectOwner()
	return self:GetDTEntity(0)
end

function ENT:ClearObjectOwner()
	self:SetObjectOwner(NULL)
end

function ENT:HitByWrench(wep, owner, tr)
	return true
end

function ENT:ShouldNotCollide(ent)
	return ent:IsPlayer() and ent:Team() == TEAM_HUMAN or ent:IsProjectile() or table.HasValue({"prop_physics","prop_physics_multiplayer"},ent:GetClass())
end
