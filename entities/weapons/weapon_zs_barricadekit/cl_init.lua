INC_CLIENT()

SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false

function SWEP:DrawHUD()
	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 64, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFont")

	local charges = self:GetOwner():GetPoints()
	local chargesb = self:GetPrimaryAmmoCount()
	local chargetxt = "(SECONDARY ATTACK)Boards: " .. chargesb
	local costp = (35 * ((GAMEMODE:GetWave() + GAMEMODE:GetWave() * 0.2) * 2) + 35)
	if charges >= costp then
		draw.SimpleText("COST "..costp.." POINTS", "ZSHUDFont", x + wid, texty, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	else
		draw.SimpleText("DON'T HAVE ENOUGHT POINTS", "ZSHUDFont", x + wid, texty, COLOR_DARKRED, TEXT_ALIGN_RIGHT)
	end
	if chargesb >= 0 then
		draw.SimpleText(chargetxt, "ZSHUDFont", x + wid, texty - 40, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	else
		draw.SimpleText(chargetxt, "ZSHUDFont", x + wid, texty - 40, COLOR_DARKRED, TEXT_ALIGN_RIGHT)
	end

	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end

function SWEP:Deploy()
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:GetViewModelPosition(pos, ang)
	return pos, ang
end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:PrimaryAttack()
end

function SWEP:Think()
	if self:GetOwner():KeyDown(IN_ATTACK2) then
		self:RotateGhost(FrameTime() * 60)
	end
	if self:GetOwner():KeyDown(IN_RELOAD) then
		self:RotateGhost(FrameTime() * -60)
	end
end

local nextclick = 0
local kityaw = CreateClientConVar("zs_barricadekityaw", 90, false, true)
function SWEP:RotateGhost(amount)
	if nextclick <= RealTime() then
		surface.PlaySound("npc/headcrab_poison/ph_step4.wav")
		nextclick = RealTime() + 0.3
	end
	RunConsoleCommand("zs_barricadekityaw", math.NormalizeAngle(kityaw:GetFloat() + amount))
end
