SWEP.PrintName = "'Cryman' Crygas"
SWEP.Description = "Die NOW"

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Delay = 0.1
SWEP.Primary.ClipSize = 3
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.DefaultClip = 3
SWEP.Primary.Damage = 23

SWEP.ConeMin = 0.0001
SWEP.ConeMax = 0.0001

SWEP.WalkSpeed = SPEED_SLOW

<<<<<<< Updated upstream
SWEP.Tier = 5
=======
SWEP.Tier = 6
>>>>>>> Stashed changes

SWEP.MaxBombs = 10

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Lynx' Better crygas", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 1.2
	if SERVER then
		wept.EntModify = function(self, ent)
			self:SetNextSecondaryFire(CurTime() + 0.2)
			ent:SetDTBool(0, true)
		end
	end
	if CLIENT then
		wept.VElements.clipbase.color = Color(30, 95, 150)
	end
end)

function SWEP:CanPrimaryAttack()
	if self.BaseClass.CanPrimaryAttack(self) then
		local c = 0
		for _, ent in ipairs(ents.FindByClass("projectile_crygas")) do
			if ent:GetOwner() == self:GetOwner() then
				c = c + 1
			end
		end

		if c >= self.MaxBombs then return false end

		return true
	end

	return false
end

function SWEP:EmitFireSound()
	self:EmitSound("weapons/ar2/ar2_altfire.wav", 70, math.random(112, 120), 0.50)
	self:EmitSound("weapons/physcannon/superphys_launch1.wav", 70, math.random(145, 155), 0.5, CHAN_AUTO + 20)
end
