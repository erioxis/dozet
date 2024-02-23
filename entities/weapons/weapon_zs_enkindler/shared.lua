--SWEP.PrintName = "'Enkindler' Fire Mine Layer"
--SWEP.Description = "A mine layer that lays mines that ignite zombies."
SWEP.PrintName = ""..translate.Get("wep_darkek")
SWEP.Description = ""..translate.Get("wep_d_darkek")
SWEP.Slot = 4
SWEP.SlotPos = 0

SWEP.Base = "weapon_zs_baseproj"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/c_rpg.mdl"
SWEP.WorldModel = "models/weapons/w_rocket_launcher.mdl"

SWEP.ViewModelFOV = 60

SWEP.Primary.Sound = Sound("weapons/grenade_launcher1.wav")
SWEP.Primary.Delay = 0.3

SWEP.Primary.Damage = 210
SWEP.Primary.ClipSize = 4
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "impactmine"
SWEP.Primary.DefaultClip = 16

SWEP.ReloadSound = Sound("weapons/ar2/ar2_reload.wav")

SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.WalkSpeed = SPEED_SLOWEST * 0.9

SWEP.UseHands = true

SWEP.MaxMines = 5

SWEP.Tier = 6

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MAXIMUM_MINES, 1)

function SWEP:CanPrimaryAttack()
	if self.BaseClass.CanPrimaryAttack(self) then
		local c = 0
		for _, ent in ipairs(ents.FindByClass("projectile_impactmine_kin")) do
			if (CLIENT or ent.CreateTime + 300 > CurTime()) and ent:GetOwner() == self:GetOwner() then
				c = c + 1
			end
		end

		if c >= self.MaxMines then return false end

		return true
	end

	return false
end

function SWEP:CanSecondaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetReloadFinish() > 0 then return false end

	return self:GetNextSecondaryFire() <= CurTime()
end

function SWEP:SecondaryAttack()
	if not self:CanSecondaryAttack() then return end

	self:SetNextSecondaryFire(CurTime() + 0.1)

	local owner = self:GetOwner()
	local hitpos = owner:CompensatedMeleeTrace(2048, 1, nil, nil, false).HitPos

	if SERVER then
		for _, ent in pairs(ents.FindInSphere(hitpos, 24)) do
			if ent:GetClass() == "projectile_impactmine_kin" and ent:GetOwner() == owner then
				local mine = ents.Create("prop_ammo")
				if mine:IsValid() then
					mine:SetAmmo(1)
					mine:SetAmmoType("impactmine")
					mine:SetPos(ent:GetStartPos())
					mine:SetAngles(ent:GetAngles())
					mine:Spawn()
				end

				if owner:IsValidLivingHuman() then
					mine.NoPickupsTime = CurTime() + 15
					mine.NoPickupsOwner = owner
				end

				ent:Remove()
			end
		end
	end
end


function SWEP:EmitFireSound()
	self:EmitSound(self.Primary.Sound, 65, math.random(107, 113), 0.6)
end

function SWEP:EmitReloadSound()
	if IsFirstTimePredicted() then
		self:EmitSound(self.ReloadSound, 60, 110, 0.5, CHAN_WEAPON + 21)
	end
end
