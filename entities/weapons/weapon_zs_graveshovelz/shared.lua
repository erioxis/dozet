SWEP.Base = "weapon_zs_graveshovel"
SWEP.ZombieOnly = false

SWEP.MeleeDamage = 32
SWEP.MeleeKnockBack = 160

SWEP.Primary.Delay = 0.46
SWEP.BlockTrue = false
SWEP.CanPickup = true

SWEP.ViewModel = Model("models/weapons/c_crowbar.mdl")
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"

AccessorFuncDT(SWEP, "HookTime", "Float", 1)
GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.054)

function SWEP:SecondaryAttack()
	if CurTime() < self:GetNextPrimaryFire() or CurTime() < self:GetNextSecondaryFire() then return end

	self:SetNextSecondaryFire(CurTime() + 0.45 + (self.Primary.Delay * 0.5))
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay)

	self:SetSwingAnimTime(CurTime() + 0.3)

	self:GetOwner():DoReloadEvent()

	self:EmitSound("npc/headcrab_poison/ph_poisonbite3.wav", 75, 46)

	self:SetHookTime(CurTime() + 0.35)
end

function SWEP:Think()
	if self:GetHookTime() > 0 and CurTime() >= self:GetHookTime() then
		self:SetHookTime(0)

		self:EmitSound("physics/flesh/flesh_squishy_impact_hard"..math.random(2, 4)..".wav", 72, math.random(70, 83))
		

		if SERVER then
			self:ThrowHook()
		end
	end

	return self.BaseClass.Think(self)
end

function SWEP:Reload()
	self.BaseClass.SecondaryAttack(self)
end

function SWEP:CheckMoaning()
end

function SWEP:StopMoaningSound()
end

function SWEP:StartMoaningSound()
end

function SWEP:PlayHitSound()
	self:EmitSound("npc/zombie/claw_strike"..math.random(3)..".wav", 75, 80, nil, CHAN_AUTO)
end

function SWEP:PlayMissSound()
	self:EmitSound("npc/zombie/claw_miss"..math.random(2)..".wav", 75, 80, nil, CHAN_AUTO)
end

function SWEP:PlayAttackSound()
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/antlion_guard/angry"..math.random(3)..".wav", 75, 140)
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:SetSwingAnimTime(time)
	self:SetDTFloat(3, time)
end

function SWEP:GetSwingAnimTime()
	return self:GetDTFloat(3)
end

function SWEP:StartSwinging()
	self.BaseClass.StartSwinging(self)
	self:SetSwingAnimTime(CurTime() + 1)
end