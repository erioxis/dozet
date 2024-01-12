
SWEP.PrintName = translate.Get("wep_rray")
SWEP.Description = translate.Get("wep_d_rray")

SWEP.Base = "weapon_zs_base"

SWEP.HoldType = "shotgun"

SWEP.ViewModel = "models/weapons/c_shotgun.mdl"
SWEP.WorldModel = "models/weapons/w_shotgun.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.UseHands = true

SWEP.Primary.Delay = 0.1

SWEP.Primary.ClipSize = 30
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "pulse"
GAMEMODE:SetupDefaultClip(SWEP.Primary)
SWEP.HealStrength = 22
SWEP.ConeMax = 0
SWEP.ConeMin = 0

SWEP.Tier = 4
SWEP.MaxStock = 3

SWEP.HealRange = 300

SWEP.WalkSpeed = SPEED_SLOWER
SWEP.FireAnimSpeed = 0.24

GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_HEALRANGE, 100, 1)
GAMEMODE:SetPrimaryWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.07)

function SWEP:Initialize()
	self.BaseClass.Initialize(self)

	self.ChargeSound = CreateSound(self, "ambient/energy/zap"..math.random(1,9)..".wav")
end

function SWEP:Holster()
	self.ChargeSound:Stop()

	return self.BaseClass.Holster(self)
end

function SWEP:OnRemove()
	self.ChargeSound:Stop()
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	local owner = self:GetOwner()

	local trtbl = owner:CompensatedPenetratingMeleeTrace(self.HealRange, 2, nil, nil, true)
	local ent
	for _, tr in pairs(trtbl) do
		local test = tr.Entity
		if test and test:IsValid() then
			hitent = test
            
			break
		end
	end

	if not hitent or self:GetDTEntity(10):IsValid() then return end
	
	if hitent:IsNailed() and SERVER then
		local healstrength = self.HealStrength * (owner.RepairRateMul or 1)
		local oldhealth = hitent:GetBarricadeHealth()
		if oldhealth <= 0 or oldhealth >= hitent:GetMaxBarricadeHealth() or hitent:GetBarricadeRepairs() <= 0.01 then return end

		hitent:SetBarricadeHealth(math.min(hitent:GetMaxBarricadeHealth(), hitent:GetBarricadeHealth() + math.min(hitent:GetBarricadeRepairs(), healstrength)))
		local healed = hitent:GetBarricadeHealth() - oldhealth
		hitent:SetBarricadeRepairs(math.max(hitent:GetBarricadeRepairs() - healed, 0))
		self:SetDTEntity(10, hitent)
		self:SetNextPrimaryFire(CurTime() + 1)
		gamemode.Call("PlayerRepairedObject", owner, hitent, healed, self)
	elseif hitent.GetObjectHealth and SERVER then
		-- Taking the nil tr parameter for granted for now
		local healstrength = self.HealStrength * (owner.RepairRateMul or 1)
		local oldhealth = hitent:GetObjectHealth()
		if oldhealth <= 0 or oldhealth >= hitent:GetMaxObjectHealth() or hitent.m_LastDamaged and CurTime() < hitent.m_LastDamaged + 4 then
		return
		end

		hitent:SetObjectHealth(math.min(hitent:GetMaxObjectHealth(), hitent:GetObjectHealth() + healstrength/2))
		healed = hitent:GetObjectHealth() - oldhealth
		self:SetDTEntity(10, hitent)
		self:SetNextPrimaryFire(CurTime() + 1)
		gamemode.Call("PlayerRepairedObject", owner, hitent, healed, self)
		hitent:EmitSound("npc/dog/dog_servo"..math.random(7, 8)..".wav", 70, math.random(100, 105))

		local effectdata = EffectData()
			effectdata:SetOrigin(hitent:GetPos())
			effectdata:SetNormal((self:GetPos() - hitent:GetPos()):GetNormalized())
			effectdata:SetMagnitude(1)
		util.Effect("nailrepaired", effectdata, true, true)
	elseif hitent:IsValidLivingZombie() then
		if SERVER then
			hitent:TakeDamage(self.HealStrength * (owner.RepairRateMul or 1), self:GetOwner(),self)
		end
		self:SetDTEntity(10, hitent)
		self:SetNextPrimaryFire(CurTime() + 1)
	end
end

function SWEP:CanPrimaryAttack()
	if self:GetPrimaryAmmoCount() <= 0 then
		return false
	end

	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or self:GetDTEntity(10):IsValid() then return false end

	return self:GetNextPrimaryFire() <= CurTime()
end

function SWEP:Reload()
end

function SWEP:Think()
	self.BaseClass.Think(self)

	self:CheckHealRay()
end

function SWEP:StopHealing()
	self:SetDTEntity(10, NULL)
	self:SetNextPrimaryFire(CurTime() + 0.75)
	self:EmitSound("ambient/energy/zap"..math.random(1,9)..".wav", 125, 60)
	self.ChargeSound:Stop()
end

function SWEP:TakeAmmo()
	self:TakeCombinedPrimaryAmmo(2)
end

function SWEP:CheckHealRay()
	local ent = self:GetDTEntity(10)
	local owner = self:GetOwner()
	if ent:IsValidLivingZombie() and owner:KeyDown(IN_ATTACK) and
	ent:WorldSpaceCenter():DistToSqr(owner:WorldSpaceCenter()) <= self.HealRange * self.HealRange and self:GetCombinedPrimaryAmmo() > 0 then 
		local effectdata = EffectData()
		effectdata:SetOrigin(ent:WorldSpaceCenter())
		effectdata:SetFlags(3)
		effectdata:SetEntity(self)
		effectdata:SetAttachment(1)
		util.Effect("tracer_hammerray", effectdata)
		if CurTime() > self:GetDTFloat(10) then
			if SERVER then
				ent:TakeSpecialDamage(self.HealStrength * (owner.BulletMul or 1),DMG_BULLET, self:GetOwner(),self)
			end
			self:SetDTFloat(10, CurTime() + 0.36)
			self:TakeAmmo()
		end
		self.ChargeSound:PlayEx(1, 70)
	elseif ent:IsValid() and ent:IsPlayer() then
		self:StopHealing()
	end
	if ent:IsPlayer() then return end
	if ent:IsNailed() and owner:KeyDown(IN_ATTACK) and
		ent:WorldSpaceCenter():DistToSqr(owner:WorldSpaceCenter()) <= self.HealRange * self.HealRange and self:GetCombinedPrimaryAmmo() > 0 then

		if CurTime() > self:GetDTFloat(10) then
			local healstrength = self.HealStrength* (owner.RepairRateMul or 1)
			local oldhealth = ent:GetBarricadeHealth()
			if oldhealth <= 0 or oldhealth >= ent:GetMaxBarricadeHealth() or hitent:GetBarricadeRepairs() <= 0.01 then return end
			self:TakeAmmo()
			self:SetDTFloat(10, CurTime() + 0.36)
			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

			local effectdata = EffectData()
				effectdata:SetOrigin(ent:WorldSpaceCenter())
				effectdata:SetFlags(3)
				effectdata:SetEntity(self)
				effectdata:SetAttachment(1)
			util.Effect("tracer_hammerray", effectdata)
			hitent = ent
			if hitent:IsNailed() and SERVER then
				local healstrength = self.HealStrength * (owner.RepairRateMul or 1)
				local oldhealth = hitent:GetBarricadeHealth()
				if oldhealth <= 0 or oldhealth >= hitent:GetMaxBarricadeHealth() or hitent:GetBarricadeRepairs() <= 0.01 then return end
			
				hitent:SetBarricadeHealth(math.min(hitent:GetMaxBarricadeHealth(), hitent:GetBarricadeHealth() + math.min(hitent:GetBarricadeRepairs(), healstrength)))
				local healed = hitent:GetBarricadeHealth() - oldhealth
				hitent:SetBarricadeRepairs(math.max(hitent:GetBarricadeRepairs() - healed, 0))
				self:SetDTEntity(10, hitent)
				self:SetNextPrimaryFire(CurTime() + 1)
			gamemode.Call("PlayerRepairedObject", owner, hitent, healed, self)
		elseif hitent.GetObjectHealth and SERVER then
			-- Taking the nil tr parameter for granted for now
			local healstrength = self.HealStrength * (owner.RepairRateMul or 1)
	
			local oldhealth = hitent:GetObjectHealth()
			if !(oldhealth <= 0 or oldhealth >= hitent:GetMaxObjectHealth() or hitent.m_LastDamaged and CurTime() < hitent.m_LastDamaged + 4) then
				return
			end
	
			hitent:SetObjectHealth(math.min(hitent:GetMaxObjectHealth(), hitent:GetObjectHealth() + healstrength/2))
			healed = hitent:GetObjectHealth() - oldhealth
			self:SetDTEntity(10, hitent)
			self:SetNextPrimaryFire(CurTime() + 1)
			gamemode.Call("PlayerRepairedObject", owner, hitent, healed, self)
			hitent:EmitSound("npc/dog/dog_servo"..math.random(7, 8)..".wav", 70, math.random(100, 105))
			local effectdata = EffectData()
			effectdata:SetOrigin(ent:WorldSpaceCenter())
			effectdata:SetFlags(3)
			effectdata:SetEntity(self)
			effectdata:SetAttachment(1)
		util.Effect("tracer_hammerray", effectdata)
			local effectdata = EffectData()
				effectdata:SetOrigin(hitent:GetPos())
				effectdata:SetNormal((self:GetPos() - hitent:GetPos()):GetNormalized())
				effectdata:SetMagnitude(1)
			util.Effect("nailrepaired", effectdata, true, true)
			self:TakeAmmo()
			self:SetDTFloat(10, CurTime() + 0.36)
			self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
		end
	end
		self.ChargeSound:PlayEx(1, 70)
	elseif ent:IsValid() then
		self:StopHealing()
	end
end
