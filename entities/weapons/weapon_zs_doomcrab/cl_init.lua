INC_CLIENT()

SWEP.PrintName = "Doom Crab"
SWEP.DrawCrosshair = false

function SWEP:DrawHUD()
	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
	self:Draw2DHUD()
end
local ablicolor =  Color( 250,109,77)
function SWEP:Draw2DHUD()
	self:Draw2DFeature((10+(CurTime()-self:GetDTFloat(6)))/10, nil, nil, "weapon_ability_crabs", "ZSHUDFontSmallest", ablicolor )
end
function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end
SWEP.HaveAbility = true