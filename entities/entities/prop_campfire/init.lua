INC_SERVER()

local function RefreshRepFieldOwners(pl)
	for _, ent in ipairs(ents.FindByClass("prop_campfire")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:ClearObjectOwner()
		end
	end
end
hook.Add("PlayerDisconnected", "cad.PlayerDisconnected", RefreshRepFieldOwners)
hook.Add("OnPlayerChangedTeam", "cad.OnPlayerChangedTeam", RefreshRepFieldOwners)

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
	
	self:NextThink(CurTime())
end
function ENT:SetObjectHealth(health)
	self:SetDTFloat(1, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true

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
				ent:SetAmmoType("pulse")
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
	end
end

function ENT:AltUse(activator, tr)
end

function ENT:OnPackedUp(pl)
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
		return
	end


	local pos = self:LocalToWorld(Vector(0, 0, 30))
	local count = 0


	for _, hitent in pairs(player.FindInSphere(pos, self.MaxDistance*(self:GetObjectHealth()/self:GetMaxObjectHealth()))) do
		if not hitent:IsValid() or hitent == self or not WorldVisible(pos, hitent:NearestPoint(pos)) then
			continue
		end	
		if hitent:IsValidLivingHuman() then
			hitent:GiveStatus('warm',5)
			hitent:RemoveStatus('frost')
			count = count + 1
		end
	end

	self:NextThink(CurTime() + 1)
	return true
end
