INC_CLIENT()

SWEP.ViewModelFOV = 70

SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true

SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false


SWEP.VElements = {
	["e1"] = { type = "Model", model = "models/player/catpants.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.69, 1.5, -3.376), angle = Angle(0, 180, -180), size = Vector(0.5, 1.5, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e1+"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.95782, 9e-05, 21.17896), angle = Angle(0, 0, 0), size = Vector(0.048, 0.115, 0.115), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1++"] = { type = "Model", model = "models/hunter/misc/shell2x2a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.97504, 6e-05, 21.17898), angle = Angle(0, 0, 0), size = Vector(0.045, 0.115, 0.115), color = Color(184, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1+++"] = { type = "Model", model = "models/hunter/tubes/tubebend2x2x90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-1.00702, -2.51196, 23.973), angle = Angle(0, 0, -61.32), size = Vector(0.032, 0.049, 0.034), color = Color(184, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1++++"] = { type = "Model", model = "models/hunter/misc/shell2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-1.023, -5.471, 21.976), angle = Angle(0, 0, -74.339), size = Vector(0.037, 0.037, 0.037), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1+++++"] = { type = "Model", model = "models/hunter/tubes/tubebendoutsidesquare2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.678, -0.5, 17.975), angle = Angle(0, 90, 90), size = Vector(0.122, 0.184, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["e1"] = { type = "Model", model = "models/player/catpants.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.69, 1.5, -3.376), angle = Angle(0, 180, -180), size = Vector(0.5, 1.5, 0.4), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["e1+"] = { type = "Model", model = "models/hunter/tubes/tube2x2x025.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.958, 0, 21.179), angle = Angle(0, 0, 0), size = Vector(0.048, 0.115, 0.115), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1++"] = { type = "Model", model = "models/hunter/misc/shell2x2a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-0.975, 0, 21.179), angle = Angle(0, 0, 0), size = Vector(0.045, 0.115, 0.115), color = Color(184, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1+++"] = { type = "Model", model = "models/hunter/tubes/tubebend2x2x90.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-1.007, -2.512, 23.973), angle = Angle(0, 0, -61.32), size = Vector(0.032, 0.049, 0.034), color = Color(184, 0, 0, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1++++"] = { type = "Model", model = "models/hunter/misc/shell2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(-1.023, -5.471, 21.976), angle = Angle(0, 0, -74.339), size = Vector(0.037, 0.037, 0.037), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/Fender_white", skin = 0, bodygroup = {} },
	["e1+++++"] = { type = "Model", model = "models/hunter/tubes/tubebendoutsidesquare2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "e1", pos = Vector(0.678, -0.5, 17.975), angle = Angle(0, 90, 90), size = Vector(0.122, 0.184, 0.029), color = Color(255, 255, 255, 255), surpresslightning = false, material = "phoenix_storms/mat/mat_phx_metallic", skin = 0, bodygroup = {} }
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
