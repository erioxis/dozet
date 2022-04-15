SWEP.PrintName = "'Crymam' MOM"
SWEP.Description = "Die NOW"
SWEP.PrintName = " "..translate.Get("wep_crymam")
SWEP.Description = " "..translate.Get("wep_d_crymam")
SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_smg_p90.mdl"
SWEP.WorldModel = "models/weapons/w_smg_p90.mdl"
SWEP.UseHands = true

SWEP.CSMuzzleFlashes = false

SWEP.Primary.Delay = 0.03
SWEP.Primary.ClipSize = 19
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.DefaultClip = 19
SWEP.Primary.Damage = 18

SWEP.ConeMin = 0.0001
SWEP.ConeMax = 0.0001

SWEP.WalkSpeed = SPEED_SLOW

SWEP.Tier = 5

SWEP.MaxBombs = 3

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_RELOAD_SPEED, 0.1)
GAMEMODE:AddNewRemantleBranch(SWEP, 1, "'Lynx'", "'Better damage but less max bombs'", function(wept)
	wept.Primary.Damage = wept.Primary.Damage * 3
	if SERVER then
		wept.EntModify = function(self, ent)
			self:SetNextSecondaryFire(CurTime() + 0.2)
			ent:SetDTBool(0, true)
		end
	end
	wept.MaxBombs = 3
	if CLIENT then
		wept.VElements.clipbase.color = Color(30, 95, 150)
	end
end)

function SWEP:CanPrimaryAttack()
	if self.BaseClass.CanPrimaryAttack(self) then
		local c = 0
		for _, ent in pairs(ents.FindByClass("projectile_crymam")) do
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
