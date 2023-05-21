--SWEP.PrintName = "'Hephaestus' Tau Cannon"
--SWEP.Description = "Also known as the Gauss Gun. Launches tau projectiles at incredibly high speeds."
SWEP.PrintName = translate.Get("wep_tau")
SWEP.Description = translate.Get("wep_d_tau")

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_physics.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.Primary.Sound = Sound("weapons/gauss/fire1.wav")
SWEP.Primary.Damage = 45.85
SWEP.Primary.NumShots = 1
SWEP.Primary.Delay = 0.2

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pulse"
SWEP.Primary.DefaultClip = 30

SWEP.ConeMax = 3
SWEP.ConeMin = 1.5

SWEP.HeadshotMulti = 1.5

SWEP.ChargeDelay = 0.12
SWEP.RemoveOnGive = true

SWEP.Tier = 7

local branch = GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_tau_f1"), translate.Get("wep_d_tau_f1"), function(wept)
	wept.Primary.Delay = wept.Primary.Delay * 2.6
	wept.Primary.Damage = wept.Primary.Damage * 2
	wept.BulletCallback = function(attacker, tr, dmginfo)

			local originaldmg = dmginfo:GetDamage()
			dmginfo:SetDamage(attacker:GetActiveWeapon().Primary.Damage * 0.3)
			if tr.Hit and SERVER then
				local ent = ents.Create("prop_electricfield")
				if ent:IsValid() then
					ent:SetPos(tr.HitPos)
					ent:SetOwner(attacker)
					ent:Spawn()
				end
				for _, ent in pairs(ents.FindInSphere(tr.HitPos, 48)) do
					if ent and ent:IsValid() then
						local nearest = ent:NearestPoint(tr.HitPos)
						if TrueVisibleFilters(tr.HitPos, nearest, dmginfo:GetInflictor(), ent) && ent != attacker then
							ent:TakeSpecialDamage(originaldmg * 2, DMG_SHOCK, attacker, dmginfo:GetInflictor(), nearest)
						end
					end
				end
			end
			local ent = tr.Entity
			local effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
				util.Effect("explosion_lightning", effectdata)
			effectdata:SetNormal(tr.HitNormal)		
			effectdata:SetMagnitude(2)
			effectdata:SetScale(1)
				util.Effect("cball_explode", effectdata)		


		return {impact = false}
	end
end)
SWEP.WalkSpeed = SPEED_SLOW
SWEP.FireAnimSpeed = 1

SWEP.TracerName = "tracer_heph"

function SWEP:TakeAmmo()
	self:TakeCombinedPrimaryAmmo(1)

	if CLIENT then
		self.LastVel = 7
	end
end

function SWEP:Reload()
end

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "weapons/gauss/chargeloop.wav")
end

function SWEP:CanPrimaryAttack()
	if self:GetPrimaryAmmoCount() <= 0 then
		return false
	end

	if self:GetCharging() or self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:SecondaryAttack()
	if not self:CanPrimaryAttack() or self:GetCharging() then return end

	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())
	self:SetLastChargeTime(CurTime())
	self:TakeAmmo()
	self:SetCharging(true)
end

function SWEP.BulletCallback(attacker, tr, dmginfo)
	return {impact = false}
end

function SWEP:CheckCharge()
	if self:GetCharging() then
		local owner = self:GetOwner()
		if not owner:KeyDown(IN_ATTACK2) then
			self:EmitFireSound()

			self.FireAnimSpeed = 0.3
			self:ShootBullets(self.Primary.Damage * self:GetGunCharge(), self.Primary.NumShots, self:GetCone())
			self.IdleAnimation = CurTime() + self:SequenceDuration()
			self.FireAnimSpeed = 1

			owner:SetGroundEntity(NULL)
			owner:SetVelocity(-34 * self:GetGunCharge() * owner:GetAimVector())

			self:SetNextPrimaryFire(CurTime() + self:GetFireDelay() * 4)
			self:SetCharging(false)
			self:SetLastChargeTime(CurTime())
			self:SetGunCharge(0)
		elseif self:GetGunCharge() < 13 and self:GetPrimaryAmmoCount() ~= 0 and self:GetLastChargeTime() + self.ChargeDelay < CurTime() then
			self:SetGunCharge(self:GetGunCharge() + 1)
			self:SetLastChargeTime(CurTime())
			self:TakeAmmo()
		end

		self.ChargeSound:PlayEx(1, math.min(255, 47 + self:GetGunCharge() * 16))
	else
		self.ChargeSound:Stop()
	end
end

function SWEP:SetLastChargeTime(lct)
	self:SetDTFloat(8, lct)
end

function SWEP:GetLastChargeTime()
	return self:GetDTFloat(8)
end

function SWEP:SetGunCharge(charge)
	self:SetDTInt(1, charge)
end

function SWEP:GetGunCharge(charge)
	return self:GetDTInt(1)
end

function SWEP:SetCharging(charge)
	self:SetDTBool(1, charge)
end

function SWEP:GetCharging()
	return self:GetDTBool(1)
end

function SWEP:EmitFireSound()
	local deduct = self:GetCharging() and 100 - self:GetGunCharge() or 100
	local owner = self:GetOwner()

	self:EmitSound("weapons/gauss/fire1.wav", 75, deduct, 0.9)
	timer.Simple(0.2, function()
		if self:IsValid() and owner:IsValid() and not owner:KeyDown(IN_ATTACK) then
			self:EmitSound("weapons/zs_heph/electro"..math.random(4,6)..".wav", 75, deduct, 0.75, CHAN_WEAPON + 20)
		end
	end)
end
function SWEP:Holster()
	if SERVER then
		self:GetOwner():StripWeapon(self:GetClass())
	end
	return false
end

