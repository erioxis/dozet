AddCSLuaFile()

SWEP.Base = "weapon_zs_base"

SWEP.PrintName = "Dash"

if CLIENT then
	SWEP.ViewModelFOV = 80

	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_junk/watermelon01_chunk02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1, 4, -3), angle = Angle(-45, -70, -80), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_junk/watermelon01_chunk02a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5, 1, -3), angle = Angle(0, 0, 0), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props_junk/watermelon01_chunk02a.mdl"

SWEP.Primary.Ammo = "smg1"

SWEP.Tier = 2


SWEP.FoodHealth = 100
SWEP.FoodEatTime = 0.1

SWEP.Primary.ClipSize = 1
SWEP.ReloadSpeed = 2
SWEP.Primary.Delay = 0.15

SWEP.Knockback = -522

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()

	local clip = self:Clip1()

	self:TakePrimaryAmmo(clip)
	owner:ViewPunch(clip * 0.5 * Angle(math.Rand(-0.1, -0.1), math.Rand(-0.1, 0.1), 0))

	owner:SetGroundEntity(NULL)
	owner:SetVelocity(-self.Knockback * clip * owner:GetAimVector())
	owner:GiveStatus("dimvision",5)
	owner:GiveStatus("rot",3)


end
