ENT.Type = "anim"
ENT.Base = "prop_baseoutlined"

ENT.NoNails = true

function ENT:HumanHoldable(pl)
	return pl:KeyDown(GAMEMODE.UtilityKey)
end
function ENT:SetAmmoType(ammotype)
	self:SetModel(GAMEMODE.AmmoModels[string.lower(ammotype)] or "models/Items/BoxMRounds.mdl")
	self:SetNWString(7,ammotype)
end

function ENT:GetAmmoType()
	return self:GetNWString(7)
end

function ENT:SetAmmo(ammo)
	self:SetNWInt(6,tonumber(ammo) or self:GetAmmo())
end
--self:SetNWInt
function ENT:GetAmmo()
	return self:GetNWInt(6)
end
