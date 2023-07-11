INC_SERVER()

ENT.PointsMultiplier = 1.66

function ENT:Initialize()
	if self:GetDTInt(5) ~= 1 and IsValid(self) then self:Fire("kill", "", 2)  end 

	self:SetModel("models/dav0r/hoverball.mdl")
	self:PhysicsInitSphere(2)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:SetupGenericProjectile(false)
	self.LastPhysicsUpdate = UnPredictedCurTime()
	self.Bounces = -3
end

local vecDown = Vector()
function ENT:PhysicsUpdate(phys)
	self:ProjectileTraceAhead(phys)

	local dt = UnPredictedCurTime() - self.LastPhysicsUpdate
	self.LastPhysicsUpdate = UnPredictedCurTime()

	vecDown.z = dt * -200 * ((self.Damagedt or 1)+1<= CurTime() and 1 or -8)
	phys:AddVelocity(vecDown)
end

function ENT:OnRemove()
	local effectdata = EffectData()
		effectdata:SetOrigin(self.HitData and self.HitData.HitPos or self:GetPos())
		effectdata:SetNormal(self.HitData and self.HitData.HitNormal or Vector(0, 0, 0))
	util.Effect("hit_tithonus", effectdata)
end

function ENT:PhysicsCollide(data, phys)
	if self.HitData then return end
	if self:GetDTInt(5) == 1 then
		if self.Bounces <= 1 and data.HitEntity and (data.HitEntity:IsPlayer() or data.HitEntity:IsWorld()) then
			local normal = data.OurOldVelocity:GetNormalized()
			phys:SetVelocityInstantaneous((2 * data.HitNormal * 1.1 * data.HitNormal:Dot(normal * -0.5) + normal) * 1200)
			self:SetupGenericProjectile(true)
	
			self:EmitSound("ambient/levels/citadel/weapon_disintegrate3.wav", 70, 210)
	
			self.Bounces = self.Bounces + 1
			self.ProjDamage = self.ProjDamage * 1.8
		else
			self.HitData = data
		end
	else
		self.HitData = data
	end
	self:NextThink(CurTime())
end

function ENT:Think()
	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	if math.Round(math.abs(self:GetPhysicsObject():GetVelocity().z+self:GetPhysicsObject():GetVelocity().y+self:GetPhysicsObject():GetVelocity().x)) <= 119 then self:Remove() return end
	if self:GetDTInt(5) == 1 and self.Bounces <= 1 and self.Touched and (self.Damagedt or 1) <= CurTime() then
		self.Damagedt = CurTime()+0.1

		local tr = self.Touched

		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end
		self:DealProjectileTraceDamage(self.ProjDamage or 77, tr, owner)
		--net.Start("zs_update_style") net.WriteTable({time = CurTime()+0.3+(math.random(2,10)*0.1),text = "BOUNCE PROJECTILE",score = 3,color = Color(50,163,60)}) net.Send(self:GetOwner()) 
		if tr.Entity:IsPlayer() then
			tr.Entity:AddLegDamageExt(5.5, owner, source, SLOWTYPE_PULSE)
		end
		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end

		util.Blood(tr.Entity:WorldSpaceCenter(), math.max(0, 15), -self:GetForward(), math.Rand(100, 300), true)
		self.Touched = nil
		return
	end
	if self.Touched and not self.Damaged then
		self.Damaged = true

		local tr = self.Touched

		if self.PointsMultiplier then
			POINTSMULTIPLIER = self.PointsMultiplier
		end
		self:DealProjectileTraceDamage(self.ProjDamage or 77, tr, owner)
		if tr.Entity:IsPlayer() then
			tr.Entity:AddLegDamageExt(5.5, owner, source, SLOWTYPE_PULSE)
		end
		if self.PointsMultiplier then
			POINTSMULTIPLIER = nil
		end

		util.Blood(tr.Entity:WorldSpaceCenter(), math.max(0, 15), -self:GetForward(), math.Rand(100, 300), true)

		self:Remove()
	elseif self.HitData then
		self:Remove()
	end
end
