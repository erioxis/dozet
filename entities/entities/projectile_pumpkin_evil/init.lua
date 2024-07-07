INC_SERVER()

function ENT:Initialize()
	self.DieTime = CurTime() + 30

	self:SetModel("models/draganm_custom/pumpkin_pack/pumpkind_01.mdl")
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetTrigger(true)
	self:SetupGenericProjectile(true)
	self:SetColor(Color(137,12,31))
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal)
	end

	if self.DieTime <= CurTime() then
		self:Remove()
	end
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 512)) do
		target = ent
		if WorldVisible(self:LocalToWorld(Vector(0, 0, 10)), ent:NearestPoint(self:LocalToWorld(Vector(0, 0, 10)))) and (target:IsValidLivingZombie() and !(target:GetZombieClassTable().CrowDa or target.SpawnProtection) or target.CanRicoChet) then
			if target:IsValidLivingZombie() or ent.AllowSelfRicoShot then
				local targetpos = target:LocalToWorld(target:OBBCenter())
				local direction = (targetpos - self:GetPos()):GetNormal()
				self:SetAngles(direction:Angle())

				local phys = self:GetPhysicsObject()
				phys:SetVelocityInstantaneous(direction * 1210)
				break
			end
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	if data.Speed >= 50 then
		self.PhysicsData = data
		self:NextThink(CurTime())
	end
end

function ENT:StartTouch(ent)
	if self.DieTime ~= 0 and ent:IsValidLivingPlayer() then
		local owner = self:GetOwner()
		if not owner:IsValid() then owner = self end

		if ent ~= owner and ent:Team() ~= self.Team then
			ent:EmitSound("weapons/crossbow/hitbod"..math.random(2)..".wav")
			ent:TakeSpecialDamage(self.Damage, DMG_CLUB, owner, self, nil)
			ent:GiveStatus("stunned",6, owner)
			self:Explode()
			--net.Start("zs_update_style") net.WriteTable({time = CurTime()+3+(math.random(1,20)*0.2),text = "UGA-BUGA!",score = 50}) net.Send(owner)
		end
	end
end

function ENT:Explode(hitpos, hitnormal)
	if self.DieTime == 0 then return end
	self.DieTime = 0

	hitpos = hitpos or self:GetPos()
	hitnormal = hitnormal or (self:GetVelocity():GetNormalized() * -1)

	local effectdata = EffectData()
		effectdata:SetOrigin(hitpos)
		effectdata:SetNormal(hitnormal)
	util.Effect("hit_pumpkin", effectdata)

	self:NextThink(CurTime())
end
