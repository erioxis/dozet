INC_CLIENT()

SWEP.ViewModelFOV = 70

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false


SWEP.VElements = {
	["baragay"] = { type = "Model", model = "models/player/catpants.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.516, 0.812, -5.775), angle = Angle(8.82, -168.884, -176.604), size = Vector(0.3, 1.406, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["baragay"] = { type = "Model", model = "models/player/catpants.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(6.011, 2.28, -6.038), angle = Angle(8.82, -168.884, -176.604), size = Vector(0.3, 1.406, 0.3), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


local ghostlerp = 0
function SWEP:GetViewModelPosition(pos, ang)
	local owner = self:GetOwner()
	if self:IsSwinging() then
		local rot = self:GetDTInt(10) == 1 and Angle(0, -240, -70) or self.SwingRotation
		local offset = self:GetDTInt(10) == 1 and Vector(-200, 30, -40) or self.SwingOffset
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
