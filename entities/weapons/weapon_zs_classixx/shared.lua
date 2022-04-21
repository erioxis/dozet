--SWEP.PrintName = "CLASSIXXXXX"
--SWEP.Description = "Свежая струя говна в тебя летит."
SWEP.PrintName = " "..translate.Get("wep_classixx")
SWEP.Description = " "..translate.Get("wep_d_classixx")
SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "ar2"

SWEP.ViewModel = "models/weapons/cstrike/c_snip_awp.mdl"
SWEP.WorldModel = "models/weapons/w_snip_awp.mdl"
SWEP.UseHands = true
SWEP.ShowViewModel = true
SWEP.ShowWorldModel = true
SWEP.UseHands = true

SWEP.Primary.Damage = 309
SWEP.Primary.NumShots = 3
SWEP.Primary.Delay = 0.6
SWEP.Primary.KnockbackScale = 0.1
SWEP.Primary.MaxDistance = 2028

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "357"
GAMEMODE:SetupDefaultClip(SWEP.Primary)

SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.Tier = 7
SWEP.MaxStock = 3

SWEP.HeatBuildShort = 0.10
SWEP.HeatBuildLong = 0.045
SWEP.HeatVentShort = 0.16
SWEP.HeatVentLong = 0.13
SWEP.HeatDecayShort = 0.1
SWEP.HeatDecayLong = 0.05
SWEP.HeatInitialLong = 0.05

SWEP.WalkSpeed = SPEED_SLOWEST * 1.5
SWEP.FireAnimSpeed = 0.27
SWEP.FireSoundPitch = 125

SWEP.TracerName = "tracer_gluon"



function SWEP:Initialize()
	self.FiringSound = CreateSound(self, "Weapon_Hunter.Single")
	self.FiringSound:SetSoundLevel(85)
	if CLIENT then self.VentingSound = CreateSound(self, "ambient/levels/labs/teleport_alarm_loop1.wav") end

	self.BaseClass.Initialize(self)
end

function SWEP:Deploy()
	local owner = self:GetOwner()
	if not self.PostOwner then
		self.PostOwner = owner
	end
	local timediff = owner.GluonInactiveTime and CurTime() - owner.GluonInactiveTime or 0
	self:SetShortHeat(math.Clamp((owner.ShortGluonHeat or 0) - timediff * self.HeatDecayShort, 0, 1))
	self:SetLongHeat(math.Clamp((owner.LongGluonHeat or 0) - timediff * self.HeatDecayLong, 0, 1))

	if self:GetLongHeat() > 0.5 then
		self:SetGunState(2)
		self:EmitSound("Weapon_AWP.ClipOut")
	end

	return self.BaseClass.Deploy(self)
end

function SWEP:Holster()
	self:EndGluonState()

	return self.BaseClass.Holster(self)
end

function SWEP:OnRemove()
	self.BaseClass.OnRemove(self)
	self:EndGluonState()
end

function SWEP:EmitStartFiringSound()
	self:EmitSound("ambient/machines/teleport1.wav", 75, 210)
end

function SWEP:GluonDamage()
	return self.Primary.Damage
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end
	self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

	-- Move this to DT vars because predicted at high pings
	local altuse = self:GetAltUsage()
	if altuse then
		self:TakeCombinedPrimaryAmmo(1)
	end
	self:SetAltUsage(not altuse)

	self:ShootBullets(self:GluonDamage(), self.Primary.NumShots, self:GetCone())
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	if self:GetGunState() ~= 1 then
		if IsFirstTimePredicted() then
			self:EmitStartFiringSound()
			self:GetOwner():ViewPunch(Angle(math.Rand(-2, 2), math.Rand(-2, 2), math.Rand(-5, 5)))
		end

		-- We prevent a bit of tapping fire by doing this.
		self:SetLongHeat(math.min(self:GetLongHeat() + self.HeatInitialLong, 1))
		self:SetGunState(1)
	end
end

function SWEP:CanPrimaryAttack()
	if self:GetPrimaryAmmoCount() <= 0 then
		return false
	end

	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetReloadFinish() > 0 then return false end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP.BulletCallback(attacker, tr, dmginfo)
	dmginfo:SetDamageType(DMG_DISSOLVE)

	if tr.HitWorld then
		util.Decal("FadingScorch", tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
	end

	if attacker:GetActiveWeapon().LegDamage then
		local ent = tr.Entity
		if ent:IsValidZombie() then
			ent:AddLegDamageExt(4.5, attacker, attacker:GetActiveWeapon(), SLOWTYPE_PULSE)
		end
	end

	return {impact = false}
end

function SWEP:Reload()
	if self:GetGunState() == 0 and self:GetLongHeat() ~= 0 then
		self:SetGunState(2)
		self:EmitSound("Weapon_AWP.ClipOut")
	end
end

function SWEP:SecondaryAttack()
end

function SWEP:StopGluonSounds()
	self.FiringSound:Stop()
	if CLIENT then self.VentingSound:Stop() end
end

function SWEP:EndGluonState()
	local owner = self.PostOwner or self:GetOwner()
	if owner:IsValid() then
		owner.ShortGluonHeat = self:GetShortHeat()
		owner.LongGluonHeat = self:GetLongHeat()
		owner.GluonInactiveTime = CurTime()
		owner.GunSway = false
	end

	self:StopGluonSounds()
end

function SWEP:SetGunState(state)
	self:SetDTInt(1, state)
end

function SWEP:GetGunState(state)
	return self:GetDTInt(1)
end

function SWEP:SetAltUsage(usage)
	self:SetDTBool(1, usage)
end

function SWEP:GetAltUsage()
	return self:GetDTBool(1)
end

function SWEP:SetShortHeat(heat)
	self:SetDTFloat(8, heat)
end

function SWEP:GetShortHeat()
	return self:GetDTFloat(8)
end

function SWEP:SetLongHeat(heat)
	self:SetDTFloat(9, heat)
end

function SWEP:GetLongHeat()
	return self:GetDTFloat(9)
end

function SWEP:ManageHeat()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		local frametime = FrameTime()
		if self:GetGunState() == 1 then
			self.FiringSound:PlayEx(1, self.FireSoundPitch + CurTime() % 1)
			self:SetShortHeat(math.min(self:GetShortHeat() + frametime * self.HeatBuildShort, 1))
			self:SetLongHeat(math.min(self:GetLongHeat() + frametime * self.HeatBuildLong, 1))

			if CLIENT then owner.GunSway = true end
		elseif self:GetGunState() == 2 then
			self.FiringSound:Stop()
			if CLIENT then
				owner.GunSway = false
				self.VentingSound:PlayEx(1, 55 + CurTime() % 1)
			end

			local frametimeadj = frametime * self:GetReloadSpeedMultiplier()

			self:SetShortHeat(math.max(self:GetShortHeat() - frametimeadj * self.HeatVentShort, 0))
			self:SetLongHeat(math.max(self:GetLongHeat() - frametimeadj * self.HeatVentLong, 0))
			self:SetNextPrimaryFire(CurTime() + 0.25)

			if self:GetLongHeat() == 0 and self:GetShortHeat() < self.HeatBuildShort then
				self:SetGunState(0)
				self:EmitSound("Weapon_AWP.ClipOut", 65, 90)
			end
		else
			owner.GunSway = false
			self:StopGluonSounds()
			self:SetShortHeat(math.max(self:GetShortHeat() - frametime * self.HeatDecayShort, 0))
			self:SetLongHeat(math.max(self:GetLongHeat() - frametime * self.HeatDecayLong, 0))
		end
	else
		self:StopGluonSounds()
	end
end

function SWEP:Think()
	self.BaseClass.Think(self)

	local overheat = self:GetShortHeat() + self:GetLongHeat() >= 1
	if self:GetGunState() == 1 and CurTime() >= self:GetNextPrimaryFire() + 0.1 or overheat then
		self:SetGunState(overheat and 2 or 0)
		self:SetNextPrimaryFire(CurTime() + 0.15)

		if overheat then
			if self.Overheat then
				self:GetOwner():TakeSpecialDamage(15, DMG_BURN, self:GetOwner(), self)
			end
			self:EmitSound("Weapon_AWP.ClipOut", 75)
		end
		self:EmitSound("Weapon_AWP.ClipOut", 75, 115, 0.9, CHAN_WEAPON + 20)
	end

	self:ManageHeat()
end
