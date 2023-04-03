INC_CLIENT()

include("animations.lua")

SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false
SWEP.ViewModelFOV = 60

SWEP.Slot = 0
SWEP.SlotPos = 0
SWEP.HUD3DBone = "ValveBiped.Bip01_R_Hand"
SWEP.HUD3DAng = Angle(180, 0, 0)
SWEP.HUD3DPos = Vector(4, -1.5, -3)
function SWEP:TranslateFOV(fov)
	return GAMEMODE.FOVLerp * fov
end



function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

function SWEP:DrawHUD()
		
	local wid, hei = 10, 900
	local x, y = ScrW() + wid - 960, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")
	if self.BlockTrue then
		if self:GetOwner():IsSkillActive(SKILL_TRUEBLOCK) and not self.ParryTiming then
			draw.SimpleText("PARRY!", "ZSHUDFontSmall", x + wid, texty - 25, COLOR_RED, TEXT_ALIGN_CENTER)
		elseif self:GetOwner():IsSkillActive(SKILL_TRUEBLOCK) and self.ParryTiming then
			draw.SimpleText("PARRY!", "ZSHUDFontSmall", x + wid, texty - 25, COLOR_GREEN, TEXT_ALIGN_CENTER)
		end
	end
	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end







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
function SWEP:GetHUD3DPos(vm)
	local bone = vm:LookupBone(self.HUD3DBone)
	if not bone then return end

	local m = vm:GetBoneMatrix(bone)
	if not m then return end

	local pos, ang = m:GetTranslation(), m:GetAngles()

	if self.ViewModelFlip then
		ang.r = -ang.r
	end

	local offset = self.HUD3DPos
	local aoffset = self.HUD3DAng

	pos = pos + ang:Forward() * offset.x + ang:Right() * offset.y + ang:Up() * offset.z

	if aoffset.yaw ~= 0 then ang:RotateAroundAxis(ang:Up(), aoffset.yaw) end
	if aoffset.pitch ~= 0 then ang:RotateAroundAxis(ang:Right(), aoffset.pitch) end
	if aoffset.roll ~= 0 then ang:RotateAroundAxis(ang:Forward(), aoffset.roll) end

	return pos, ang
end

local ghostlerp = 0
local ghostlerp1 = 0
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
	if not self:GetBlockState() then
		ghostlerp1 = math.max(0, ghostlerp1 - FrameTime() * 3)
	elseif self:GetBlockState() then
		ghostlerp1 = math.min(1, ghostlerp1 + FrameTime() * 2)
	end

	if ghostlerp > 0 then
		pos = pos + 3.5 * ghostlerp * ang:Up()
		ang:RotateAroundAxis(ang:Right(), -30 * ghostlerp)
	end
	if ghostlerp1 > 0 then
		pos = pos - 3.5 * ghostlerp1 * ang:Up()
		ang:RotateAroundAxis(ang:Right(), 20 * ghostlerp1)
		ang:RotateAroundAxis(ang:Forward(), 20 * ghostlerp1)
	end

	return pos, ang
end
