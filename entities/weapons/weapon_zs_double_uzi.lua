AddCSLuaFile()

--SWEP.PrintName = "'Redeemers' Dual Handguns"
SWEP.PrintName = translate.Get("wep_dual_uzi")
SWEP.Description = translate.Get("wep_d_dual_uzi")


SWEP.Slot = 1
SWEP.SlotPos = 0

if CLIENT then
	SWEP.ViewModelFlip = false
	SWEP.ViewModelFOV = 50

	SWEP.HUD3DBone = "v_weapon.slide_right"
	SWEP.HUD3DPos = Vector(1, 0.1, -1)
	SWEP.HUD3DScale = 0.015
	SWEP.HoldType = "pistol"
	SWEP.ViewModelFlip = false
	SWEP.ViewModelBoneMods = {}

	SWEP.SCKMaterials = {}

	SWEP.IronSightsPos = Vector(1.28, 0, 0.56)
	SWEP.IronSightsAng = Vector(0, 0, 0)

	SWEP.VElements = {
		["UZI1"] = { type = "Model", model = "models/weapons/w_smg_mac10.mdl", bone = "v_weapon.elite_right", rel = "", pos = Vector(-0.963, 2.711, -0.066), angle = Angle(90.24, -0.726, -98.804), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["UZI1+"] = { type = "Model", model = "models/weapons/w_smg_mac10.mdl", bone = "v_weapon.elite_left", rel = "", pos = Vector(0.523, 3.304, 0.485), angle = Angle(83.774, 180, 95.094), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
	}
	
	

end
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = true
SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "duel"

SWEP.ViewModel = "models/weapons/cstrike/c_pist_elite.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("Weapon_MAC10.Single")
SWEP.Primary.Damage = 33
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.04

SWEP.Primary.ClipSize = 60
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "smg1"
SWEP.Primary.DefaultClip = 250

SWEP.ConeMax = 8
SWEP.ConeMin = 4

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	if self:GetOwner():Team() == TEAM_UNDEAD then return end
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	self:EmitFireSound()
	self:TakeAmmo()
	self:ShootBullets(self.Primary.Damage, self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()
end

function SWEP:SecondaryAttack()
end


function SWEP:SendWeaponAnimation()
	self:SendWeaponAnim(self:Clip1() % 2 == 0 and ACT_VM_PRIMARYATTACK or ACT_VM_SECONDARYATTACK)
end

if not CLIENT then return end

function SWEP:GetTracerOrigin()
	local owner = self:GetOwner()
	if owner:IsValid() then
		local vm = owner:GetViewModel()
		if vm and vm:IsValid() then
			local attachment = vm:GetAttachment(self:Clip1() % 2 + 3)
			if attachment then
				return attachment.Pos
			end
		end
	end
end
