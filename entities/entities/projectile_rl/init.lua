INC_SERVER()

ENT.LifeTime = 3

function ENT:Initialize()
	self:SetModel("models/combine_helicopter/helicopter_bomb01.mdl")
	self:SetColor(Color(255, 255, 0))
	self:PhysicsInitSphere(3)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetModelScale(0.2, 0)
	self:DrawShadow(false)
	self:SetupGenericProjectile(false)

	self.Bounces = 0
	self.ExplodeTime = CurTime() + self.LifeTime
	self.Grace = CurTime() + 0.1
	self.Core = true
end

function ENT:Think()
	if self.ExplodeTime <= CurTime() then
		self:Explode(self:GetPos())
	end
	local owner = self:GetOwner() 
	if self:GetDTInt(5) == 1 and owner and owner:IsPlayer() and owner:KeyDown(IN_ATTACK2) and !self.Vel then
		self.Vel = self:GetPhysicsObject():GetVelocity()
		self:GetPhysicsObject():SetVelocity(Vector(0,0,0))
	end
	if self:GetDTInt(5) == 1 and self.Vel and owner and owner:IsPlayer() and !owner:KeyDown(IN_ATTACK2) then
		local vel = self.Vel
		timer.Simple(0.5, function() self:GetPhysicsObject():SetVelocity(vel) end)
		self.Vel = nil
	end
	if self.PhysicsData then
		if self.Bounces <= 0 or self.PhysicsData.HitEntity:IsPlayer() or self.PhysicsData.HitEntity.ZombieConstruction then
			self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal, self.PhysicsData.HitEntity)
		end
		local phys = self.PhysicsData.PhysObject
		if phys:IsValid() then
			local hitnormal = self.PhysicsData.HitNormal
			local vel = self.PhysicsData.OurOldVelocity
			local normal = vel:GetNormalized()
			phys:SetVelocityInstantaneous((2 * hitnormal * hitnormal:Dot(normal * -1) + normal) * vel:Length() * 0.8)
		end
		if CurTime() >= self.Grace then
			self.Bounces = self.Bounces -1
		end
		self.PhysicsData = nil
	end
	self:NextThink(CurTime())
	return true
end

function ENT:Explode(hitpos, hitnormal, hitent, boom)
	if self.Exploded then return end
	self.Exploded = true
	local jump = false
	local owner = self:GetOwner()
	local used = false
	if owner:IsValidLivingHuman() then
		local source = self:ProjectileDamageSource()
		for k,v in pairs(ents.FindInSphere(self:GetPos(),120)) do
			if v == owner then jump = true owner:SetVelocity(v:GetVelocity()+Vector(0,0,310)) break end
			if v:IsPlayer() and v ~= owner and v:Team() == TEAM_UNDEAD then
				v:SetVelocity(v:GetVelocity()+Vector(0,0,330))
				v:AddLegDamage(55)
				if !v:OnGround() then
					v:TakeDamage((self.ProjDamage or 29) * 3,owner,self)
				end
				used = true
			end
		end

		if !jump then
			util.BlastDamagePlayer(source, owner, hitpos, 81 * (hitent and hitent:OnGround() and 1 or 3), (self.ProjDamage or 29) * (hitent and hitent:OnGround() and 1 or 3), DMG_ALWAYSGIB, 0.95)
			if (hitent and hitent:IsPlayer() and !hitent:OnGround() or boom) and self:GetDTInt(6) < 1 then
				--net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "AIRBOOM!",score = 90,color = Color(196,196,196)}) net.Send(owner) 
				local edata = EffectData()
				edata:SetOrigin(self:GetPos())
				edata:SetNormal(Vector(0,0,5))
				util.Effect("explosion_airboom",edata)
				if boom then
					--net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "AUTO-BOOM!",score = 200,color = Color(247,218,53)}) net.Send(owner) 
				end
			end
		end
	end
	self:EmitSound(")weapons/explode5.wav", 80, 130)
	self:Remove()
end
function ENT:OnTakeDamage(dmginfo)
	self:Explode(self:GetPos(),nil,nil,true)
	self:SetVelocity(Vector(0,0,0))
end

function ENT:PhysicsCollide(data, physobj)
	self.PhysicsData = data
	self:NextThink(CurTime())
end
