AddCSLuaFile()

SWEP.PrintName = translate.Get("control_drone")
SWEP.Description = "Controller for your Drone."
SWEP.Slot = 4
SWEP.SlotPos = 0

if CLIENT then
	SWEP.BobScale = 0.5
	SWEP.SwayScale = 0.5
end

SWEP.ViewModel = "models/weapons/c_slam.mdl"
SWEP.WorldModel = "models/weapons/w_slam.mdl"
SWEP.UseHands = true

SWEP.Primary.Delay = 0
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"

SWEP.Secondary.Delay = 0
SWEP.Secondary.Heal = 10

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.WalkSpeed = SPEED_FAST

SWEP.NoMagazine = true
SWEP.Undroppable = true
SWEP.NoPickupNotification = true

SWEP.HoldType = "slam"

SWEP.NoDeploySpeedChange = true
SWEP.NoTransfer = true
SWEP.AutoSwitchFrom	= false

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
	self:SetDeploySpeed(10)
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	if SERVER then
		for _, ent in ipairs(ents.FindByClass("prop_drone*")) do
			if ent:IsValid() and ent:GetObjectOwner() == self:GetOwner() then
				return
			end
		end

		self:GetOwner():StripWeapon(self:GetClass())
	end
end

function SWEP:GetResupplyAmmoType()
	local owner = self:GetOwner()
	if owner:IsValid() and owner.DroneControlAmmo then
		return owner.DroneControlAmmo
	end
	return "smg1"
end

function SWEP:PrimaryAttack()
end

function SWEP:SecondaryAttack()
	if IsFirstTimePredicted() then
		self:SetDTBool(0, not self:GetDTBool(0))

		if CLIENT then
			MySelf:EmitSound(self:GetDTBool(0) and "buttons/button17.wav" or "buttons/button19.wav", 0)
		end
	end
end

function SWEP:Reload()
end

function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)

	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:Holster()
	self:SetDTBool(0, false)

	return true
end

if not CLIENT then return end

function SWEP:DrawWeaponSelection(x, y, w, h, alpha)
	self:BaseDrawWeaponSelection(x, y, w, h, alpha)
end
function SWEP:DrawHUD()
	self:Draw2DHUD()
end
local texGradDown = surface.GetTextureID("VGUI/gradient_down")
function SWEP:Draw2DHUD()
	local owner = self:GetOwner()
	if owner:IsSkillActive(SKILL_MOTHER) then
		local wid, hei = 384, 16
		local x, y = ScrW() - wid - 32, ScrH() - hei - 72
		local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")

	
		draw.SimpleText("Мин", "ZSHUDFontSmall", x + wid -120, texty, COLOR_GREEN, TEXT_ALIGN_LEFT)
	
		local charges = 0
		for k,v in ipairs(ents.FindByClass('prop_rollermine_exp')) do
			if v:GetObjectOwner() == owner then
				charges = charges + 1
			end
		end
		draw.SimpleText(charges, "ZSHUDFontSmall", x + wid, texty, charges > 0 and COLOR_GREEN or COLOR_DARKRED, TEXT_ALIGN_RIGHT)

	
	end
end
