INC_CLIENT()

include("animations.lua")

SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 60

SWEP.Slot = 0
SWEP.SlotPos = 0

function SWEP:TranslateFOV(fov)
	return GAMEMODE.FOVLerp * fov
end



function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:DrawHUD()
	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()

	if self.BlockTrue == true and self:GetOwner():GetInfo("zs_blockposition") == "0" then
		
	
	local wid, hei = 10, 900
	local x, y = ScrW() + wid - 960, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")
	if self.Block == 1 then
	draw.SimpleText(""..translate.Get("blockistrue"), "ZSHUDFontSmall", x + wid, texty, COLOR_GREEN, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(""..translate.Get("blockisfalse"), "ZSHUDFontSmall", x + wid, texty, COLOR_RED, TEXT_ALIGN_CENTER)
	end
elseif self.BlockTrue == true and self:GetOwner():GetInfo("zs_blockposition") == "1" then
	local widC, heiC = self:GetOwner():GetInfo("zs_block_func"), self:GetOwner():GetInfo("zs_x_block_func")
	local xC, yC = ScrW() - widC - self:GetOwner():GetInfo("zs_block_func") , ScrH() - self:GetOwner():GetInfo("zs_x_block_func")
	local textyC = yC - 8 - draw.GetFontHeight("ZSHUDFontSmall")
	if self.Block == 1 then
	draw.SimpleText(""..translate.Get("blockistrue"), "ZSHUDFontSmall", xC + widC, textyC, COLOR_GREEN, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(""..translate.Get("blockisfalse"), "ZSHUDFontSmall", xC + widC, textyC, COLOR_RED, TEXT_ALIGN_CENTER)
	end
end
end


--[[function SWEP:DrawHUD()
	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	if self.BlockTrue == true then
	self:DrawCrosshairDot()
	local wid, hei = 384, 16
	local x, y = ScrW() - wid - 32, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")
	if self.Block == 1 then
	draw.SimpleText(""..translate.Get("blockistrue"), "ZSHUDFontSmall", x + wid, texty, COLOR_GREEN, TEXT_ALIGN_RIGHT)
	else
		draw.SimpleText(""..translate.Get("blockisfalse"), "ZSHUDFontSmall", x + wid, texty, COLOR_RED, TEXT_ALIGN_RIGHT)
	end
end]]






function SWEP:OnRemove()
	self:Anim_OnRemove()
end

function SWEP:ViewModelDrawn()
	self:Anim_ViewModelDrawn()
end

function SWEP:PreDrawViewModel(vm)
	if self.ShowViewModel == false then
		render.SetBlend(0)
	end
end

function SWEP:PostDrawViewModel(vm)
	if self.ShowViewModel == false then
		render.SetBlend(1)
	end
end

function SWEP:DrawWorldModel()
	local owner = self:GetOwner()
	if owner:IsValid() and (owner.ShadowMan or owner.SpawnProtection) then return end

	self:Anim_DrawWorldModel()
end

local ghostlerp = 0
function SWEP:GetViewModelPosition(pos, ang)
	local owner = self:GetOwner()
	if self:IsSwinging() then
		local rot = self.SwingRotation
		local offset = self.SwingOffset
		local armdelay = owner:GetMeleeSpeedMul()
		local swingtime = self.SwingTime * (owner.MeleeSwingDelayMul or 1) * armdelay

		ang = Angle(ang.pitch, ang.yaw, ang.roll) -- Copy

		local swingend = self:GetSwingEnd()
		local delta = swingtime - math.Clamp(swingend - CurTime(), 0, swingtime)
		local power = CosineInterpolation(0, 1, delta / swingtime)

		if power >= 0.9 then
			power = (1 - power) ^ 0.4 * 2
		end

		pos = pos + offset.x * power * ang:Right() + offset.y * power * ang:Forward() + offset.z * power * ang:Up()

		ang:RotateAroundAxis(ang:Right(), rot.pitch * power)
		ang:RotateAroundAxis(ang:Up(), rot.yaw * power)
		ang:RotateAroundAxis(ang:Forward(), rot.roll * power)
	end

	if owner:GetBarricadeGhosting() then
		ghostlerp = math.min(1, ghostlerp + FrameTime() * 4)
	elseif ghostlerp > 0 then
		ghostlerp = math.max(0, ghostlerp - FrameTime() * 5)
	end

	if ghostlerp > 0 then
		pos = pos + 3.5 * ghostlerp * ang:Up()
		ang:RotateAroundAxis(ang:Right(), -30 * ghostlerp)
	end

	return pos, ang
end
