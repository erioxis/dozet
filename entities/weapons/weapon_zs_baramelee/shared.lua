
SWEP.PrintName = translate.Get("wep_baragay")
SWEP.Description = translate.Get("wep_d_baragay")
SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/v_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_stunbaton.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 2009
SWEP.MeleeRange = 222
SWEP.MeleeSize = 3.5
SWEP.MeleeKnockBack = 122

SWEP.Primary.Delay = 0.9

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.SwingRotation = Angle(0, -120, -70)
SWEP.SwingOffset = Vector(0, 30, -40)
SWEP.SwingTime = 0.97
SWEP.SwingHoldType = "melee"
SWEP.Secondary.Delay = SWEP.Primary.Delay * 1.9

SWEP.MeleeDamageSecondaryMul = 6
SWEP.MeleeKnockBackSecondaryMul = 3
SWEP.SwingTimeSecondary = 0.99

SWEP.Tier = 7
SWEP.MaxStock = 1
SWEP.PointsMultiplier = 0.5
SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.12)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(55, 65))
end


function SWEP:PlayHitSound()
	self:EmitSound("vehicles/v8/vehicle_impact_heavy"..math.random(4)..".wav", 80, math.Rand(95, 105))
end
function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "nox/scatterfrost.ogg")
end

function SWEP:CanSecondaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	return self:GetNextSecondaryFire() <= CurTime() and not self:IsSwinging()
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end

	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
		if self:IsCharging() then
			self:SetCharge(0)
		end
	end

	if self:IsCharging() then
		self.ChargeSound:PlayEx(1, math.min(255, 35 + (CurTime() - self:GetCharge()) * 220))
	else
		self.ChargeSound:Stop()
	end
end

function SWEP:SecondaryAttack()
	if not self:CanPrimaryAttack() or not self:CanSecondaryAttack() then return end
	self:SetNextAttack(true)
	self:StartSwinging(true)
end
function SWEP:SetNextAttack(secondary)
	local owner = self:GetOwner()
	local armdelay = owner:GetMeleeSpeedMul()
	self:SetNextPrimaryFire(CurTime() + (secondary and self.Primary.Delay + 0.23 or self.Primary.Delay) * armdelay)
	self:SetNextSecondaryFire(CurTime() + (secondary and self.Secondary.Delay or self.Primary.Delay) * armdelay)
end


function SWEP:StartSwinging(secondary)
	local owner = self:GetOwner()

	local armdelay = owner:GetMeleeSpeedMul()
	self:SetSwingEnd(CurTime() + (secondary and self.SwingTimeSecondary or self.SwingTime) * (owner.MeleeSwingDelayMul or 1) * armdelay)
	if secondary then self:SetCharge(CurTime()) end
end
function SWEP:IsCharging()
	return self:GetCharge() > 0
end

function SWEP:SetCharge(charge)
	self:SetDTFloat(1, charge)
end

function SWEP:GetCharge()
	return self:GetDTFloat(1)
end


