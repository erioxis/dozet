INC_CLIENT()
SWEP.HoldType = "slam"
SWEP.ViewModelFOV = 70
SWEP.ViewModelFlip = false
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_L_Hand"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, 30, -20.479), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_L_UpperArm"] = { scale = Vector(0.01, 0.01, 0.01), pos = Vector(0, -30, 0), angle = Angle(0, 0, 0) },
	["ValveBiped.Bip01_R_Finger0"] = { scale = Vector(1, 1, 1), pos = Vector(0, -1.437, 0), angle = Angle(0, 0, 0) }
}


SWEP.VElements = {
	["knife"] = { type = "Model", model = "models/weapons/w_knife_t.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.905, 3.345, 1.427), angle = Angle(16.908, -35.834, -159.562), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
}


SWEP.ViewModelFOV = 60
SWEP.ViewModelFlip = false

SWEP.Slot = 4
SWEP.SlotPos = 0

function SWEP:ShootBullets()
	local owner = self:GetOwner()
	self:SendWeaponAnim(ACT_VM_THROW)
	owner:DoAttackEvent()
end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end

local colBG = Color(16, 16, 16, 90)
local colWhite = Color(220, 220, 220, 230)

function SWEP:DrawHUD()
	self:DrawWeaponCrosshair()

	if not GAMEMODE:ShouldDraw2DWeaponHUD() then return end

	local screenscale = BetterScreenScale()

	local wid, hei = 180 * screenscale, 64 * screenscale
	local x, y = ScrW() - wid - screenscale * 128, ScrH() - hei - screenscale * 72
	local clip = self:GetPrimaryAmmoCount()

	draw.RoundedBox(16, x, y, wid, hei, colBG)
	draw.SimpleTextBlurry(clip, clip >= 100 and "ZSHUDFont" or "ZSHUDFontBig", x + wid * 0.5, y + hei * 0.5, colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end

function SWEP:PostDrawViewModel(vm)
	if GAMEMODE.WeaponHUDMode == 1 then return end

	local bone = vm:LookupBone("ValveBiped.Bip01_R_Hand")
	if not bone then return end

	local m = vm:GetBoneMatrix(bone)
	if not m then return end

	local pos, ang = m:GetTranslation(), m:GetAngles()

	pos = pos + ang:Up() * -3

	local time = CurTime()
	ang:RotateAroundAxis(ang:Right(), math.sin(time * math.pi) * 20)
	ang:RotateAroundAxis(ang:Up(), time * 180)

	pos = pos + ang:Forward() * 5

	ang:RotateAroundAxis(ang:Right(), 270)
	ang:RotateAroundAxis(ang:Up(), 270)

	local wid, hei = 144, 144
	local x, y = wid * -0.5, hei * -0.5
	local clip = self:GetPrimaryAmmoCount()

	cam.Start3D2D(pos, ang, 0.01)
		draw.RoundedBox(16, x, y, wid, hei, colBG)
		draw.SimpleText(clip, "ZS3D2DFontBig", x + wid * 0.5, y + hei * 0.5, colWhite, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
end
