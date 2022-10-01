SWEP.Base = "weapon_zs_baseproj"

SWEP.PrintName = "Flamethrower"

SWEP.Primary.Delay = 4

SWEP.ViewModel = "models/weapons/v_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

SWEP.NextPuke = 0
SWEP.PukeLeft = 0
SWEP.Primary.Damage = 12
SWEP.Primary.Ammo = "chemical"
SWEP.NextAmmoTake = 0
SWEP.RequiredClip = 1
function SWEP:Initialize()
	self.BaseClass.Initialize(self)
end
function SWEP:CanPrimaryAttack()
	if self:GetOwner():GetAmmoCount("chemical") < 1 then
		return false
	end
	return self:GetNextPrimaryFire() <= CurTime()
end
function SWEP:PrimaryAttack()
	if !self:GetOwner():KeyDown(IN_ATTACK) and self:CanPrimaryAttack() then return end
	local owner = self:GetOwner()
	self.PukeLeft = 80
	if self:GetOwner():GetAmmoCount("chemical") >= 1 then
		owner:EmitSound("ambient/fire/gascan_ignite1.wav")
		owner:EmitSound("ambient/fire/ignite.wav")
		owner:EmitSound("ambient/fire/mtov_flame2.wav")
	end
end
function SWEP:Reload()
end
function SWEP:SecondaryAttack()
end