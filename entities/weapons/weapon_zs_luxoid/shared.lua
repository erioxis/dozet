--SWEP.PrintName = "Luxoid"
--SWEP.Description = "Ancient Luxoid. Secondary attack unleashes a powerful swing, creating an icy explosion when aimed at the ground. Slows zombie movement and attack speed."
SWEP.PrintName = translate.Get("wep_luxoid")
SWEP.Description = translate.Get("wep_d_luxod")
SWEP.Base = "weapon_zs_basemelee"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"

SWEP.InnateDamageType = INNATE_TYPE_ICE
SWEP.InnateDamageMul = 0

SWEP.MeleeDamage = 144
SWEP.MeleeRange = 83
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 61

SWEP.MeleeDamageSecondaryMul = 1.2
SWEP.MeleeKnockBackSecondaryMul = 3

SWEP.Primary.Delay = 0.79
SWEP.Secondary.Delay = SWEP.Primary.Delay * 1.5

SWEP.WalkSpeed = SPEED_SLOWER

SWEP.HitAnim = ACT_VM_MISSCENTER
SWEP.PointsMultiplier = 1
SWEP.SwingRotation = Angle(60, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 0.62
SWEP.SwingHoldType = "melee"

SWEP.SwingTimeSecondary = 0.66

SWEP.Tier = 5
SWEP.MaxStock = 2

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.07)

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "weapons/physcannon/energy_sing_flyby2.wav")
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

function SWEP:PlaySwingSound()
	self:EmitSound("nox/sword_miss.ogg", 75, math.random(40, 45))
end

function SWEP:PlayHitSound()
	self:EmitSound("nox/frotchet_test1.ogg", 75, math.random(95, 105))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_bloody_break.wav", 80, math.random(95, 105))
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

GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_luxoid_r1"), translate.Get("wep_d_luxoid_r1"), function(wept)
	wept.Primary.Delay = wept.Primary.Delay * 0.66
	wept.MeleeDamage = wept.MeleeDamage * 0.45
	wept.PointsMultiplier = 0.6
	wept.Secondary.Delay = wept.Primary.Delay * 2
	wept.MeleeDamageSecondaryMul = 1.4
	
	wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
		local minushp = -zombie:Health()
		if killer:IsValid() and minushp > 10 then
			local pos = zombie:GetPos()

			timer.Simple(0.15, function()
				util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 72, minushp, DMG_ALWAYSGIB, 0.92)
			end)

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata, true, true)
		end
	end
end)
