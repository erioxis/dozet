INC_SERVER()

local function RefreshRepFieldOwners(pl)
	for _, ent in ipairs(ents.FindByClass("prop_medstation*")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:ClearObjectOwner()
		end
	end
end
hook.Add("PlayerDisconnected", "MedField.PlayerDisconnected", RefreshRepFieldOwners)
hook.Add("OnPlayerChangedTeam", "MedField.OnPlayerChangedTeam", RefreshRepFieldOwners)

function ENT:Initialize()
	self:SetModel("models/props_combine/combinethumper001a.mdl")
	self:SetModelScale(0.05, 0)
	self:PhysicsInitBox(Vector(-12.29, -12.29, 0), Vector(12.29, 12.29, 90.13))
	self:SetCollisionBounds(Vector(-12.29, -12.29, 0), Vector(12.29, 12.29, 90.13))
	self:SetCollisionGroup(COLLISION_GROUP_WORLD) -- I decided to make them not collide.
	self:SetUseType(SIMPLE_USE)

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("metal")
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetMaxObjectHealth(150)
	self:SetObjectHealth(self:GetMaxObjectHealth())
end
function ENT:SetObjectHealth(health)
	self:SetDTFloat(1, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true

		if self:GetObjectOwner():IsValidLivingHuman() then
			self:GetObjectOwner():SendDeployableLostMessage(self)
		end
		if self:GetObjectOwner():IsSkillActive(SKILL_EXPLOIT) and math.random(1,4) == 1 then
			self:GetObjectOwner():Give("weapon_zs_medstation")
		end
		local ent = ents.Create("prop_physics")
		if ent:IsValid() then
			ent:SetModel(self:GetModel())
			ent:SetMaterial(self:GetMaterial())
			ent:SetAngles(self:GetAngles())
			ent:SetPos(self:GetPos())
			ent:SetSkin(self:GetSkin() or 0)
			ent:SetColor(self:GetColor())
			ent:Spawn()
			ent:Fire("break", "", 0)
			ent:Fire("kill", "", 0.1)
		end

		local pos = self:LocalToWorld(self:OBBCenter())

		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("Explosion", effectdata, true, true)

		local amount = math.ceil(self:GetAmmo() * 0.5)
		while amount > 0 do
			local todrop = math.min(amount, 50)
			amount = amount - todrop
			ent = ents.Create("prop_ammo")
			if ent:IsValid() then
				local heading = VectorRand():GetNormalized()
				ent:SetAmmoType("battery")
				ent:SetAmmo(todrop)
				ent:SetPos(pos + heading * 8)
				ent:SetAngles(VectorRand():Angle())
				ent:Spawn()

				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:ApplyForceOffset(heading * math.Rand(8000, 32000), pos)
				end
			end
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 then return end

	self:TakePhysicsDamage(dmginfo)

	local attacker = dmginfo:GetAttacker()
	if not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())
		self:ResetLastBarricadeAttacker(attacker, dmginfo)
	end
end

function ENT:Use(activator, caller)
	if self.Removing or not activator:IsPlayer() or self:GetMaterial() ~= "" then return end

	if activator:Team() == TEAM_HUMAN then
		if self:GetObjectOwner():IsValid() then
			if activator:GetInfo("zs_nousetodeposit") == "0" or activator == self:GetObjectOwner() then
				local curammo = self:GetAmmo()
				local togive = math.min(math.min(55, activator:GetAmmoCount("battery")), self.MaxAmmo - curammo)
				if togive > 0 then
					self:SetAmmo(curammo + togive)
					activator:RemoveAmmo(togive, "battery")
					activator:RestartGesture(ACT_GMOD_GESTURE_ITEM_GIVE)
					self:EmitSound("npc/scanner/combat_scan1.wav", 60, 250)
				end
			end
		else
			self:SetObjectOwner(activator)
			self:GetObjectOwner():SendDeployableClaimedMessage(self)
		end
	end
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnPackedUp(pl)
	pl:GiveEmptyWeapon(self.SWEP)
	pl:GiveAmmo(1, "medstation")

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth())
	pl:GiveAmmo(self:GetAmmo(), "battery")

	self:Remove()
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
		return
	end

	if CurTime() < self:GetNextRepairPulse() or self:GetAmmo() <= 0 or not self:GetObjectOwner():IsValidLivingHuman() then return end

	local pos = self:LocalToWorld(Vector(0, 0, 30))
	local count = 0
	local owner = self:GetObjectOwner()
	local totalheal = self.HealValue * (owner.MedicHealMul or 1)
	local vPos = self:GetPos()
	local target, lowesthp = nil, 9999
	for _, hitent in pairs(player.FindInSphere(pos, self.MaxDistance)) do
		local p = hitent:GetPos()
		if  hitent:IsValidLivingHuman() and gamemode.Call("PlayerCanBeHealed", hitent) then
			if p:DistToSqr(vPos) < 16384 and WorldVisible(vPos, hitent:NearestPoint(vPos)) then --128^2
				local hp = hitent:Health()
				if hp < hitent:GetMaxHealth() and lowesthp > hp then
					target, lowesthp = hitent, hp
				end
			end
		end
	end

	local healed = false

    if target and target:GetMaxHealth() > target:Health() and target:IsPlayer() and target:IsValidLivingHuman() and !(target:IsSkillActive(SKILL_ABUSE) or target:IsSkillActive(SKILL_D_FRAIL)) and (target.NextMedStation or 1) < CurTime()  then
		target:EmitSound("npc/dog/dog_servo"..math.random(7, 8)..".wav", 70, math.random(100, 105))
			
		owner:HealPlayer(target, totalheal)
		local effectdata = EffectData()
			effectdata:SetOrigin((target:NearestPoint(vPos) + target:WorldSpaceCenter()) / 2)
			effectdata:SetEntity(target)
		util.Effect("hit_healdart", effectdata, true, true)
		self:SetAmmo(self:GetAmmo() - totalheal/3)
		count = count + 1
		self:SetSequence(0)
		if owner ~= target then
			owner.PointQueue = owner.PointQueue + 0.6
		end
	end

	if count > 0 then
		self:SetNextRepairPulse(CurTime() + 0.8)
	end

	self:NextThink(self:GetNextRepairPulse())
	return true
end
