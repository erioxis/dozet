AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include("shared.lua")

ENT.NextHurt = 0
ENT.DieTime = 0
ENT.NextEffect = 0
function ENT:Initialize()
	self:DrawShadow(false)
	self:SetModel("models/hunter/misc/shell2x2.mdl")
	self:PhysicsInit(SOLID_NONE)
	self:SetUseType(SIMPLE_USE)
	self:SetColor(Color(155, 208, 255, 255))
	self:SetModelScale(2,math.random(0.3,0.9))
	if self.DieTime == 0 then
		self.DieTime = CurTime() + self.LifeTime
	end
end

function ENT:Think()
	local owner = self:GetOwner()
	if CurTime() >= self.NextHurt then 
		for _, pl in pairs(ents.FindInSphere(self:GetPos(), 68 * self:GetModelScale() )) do
			if pl:IsPlayer() and owner:IsPlayer() and pl:Team() != owner:Team() and pl:Alive() then
				pl:TakeSpecialDamage(self.HurtTick, DMG_SHOCK, owner, self, self:GetPos(), self:GetPos())
				self.TotalHurt = self.TotalHurt - self.HurtTick
			end
		end
		self:EmitSound("ambient/energy/zap"..math.random(5, 9)..".wav", 75, math.Rand(90, 110))
		self.NextHurt = CurTime() + 0.11
	end
	if CurTime() >= self.NextEffect then
		local effectdata = EffectData()
			effectdata:SetEntity(self)
			effectdata:SetMagnitude(11)
			effectdata:SetScale(5)
			util.Effect("TeslaHitBoxes", effectdata)
		self.NextEffect = CurTime() + 0.1
	end
	if self.DieTime >= 0 and self.DieTime <= CurTime() or self.TotalHurt <= 0 then
		self:Remove()
	end
	
	local pos = self:GetPos()
	
	for _, ent in pairs(ents.FindInSphere(pos, 76 * self:GetModelScale())) do
		local class = ent:GetClass()
		local ownsitem = not ent.NoPickupsOwner or ent.NoPickupsOwner == owner
		local droppedrecent = not ent.DroppedTime or ent.DroppedTime + 4 < CurTime()

		if ent and ent:IsValid() and self.Classes[class] and WorldVisible(pos, ent:NearestPoint(pos)) and droppedrecent and ownsitem then
			local phys = ent:GetPhysicsObject()
			local dir = (pos - ent:NearestPoint(pos)):GetNormalized()
			phys:ApplyForceCenter((phys:GetMass() or 1) * self.Force * dir)
			ent:SetPhysicsAttacker(owner, 4)

		end
		if ent:IsPlayer() and ent:Team() == TEAM_UNDEAD then
			if not ent:GetZombieClassTable().Boss then
				if ent:Health() < 120 * GAMEMODE:GetWave() then
					local dir = (pos - ent:NearestPoint(pos)):GetNormalized()
			  	 	ent:SetVelocity(self.Force * dir * 0.45)
					ent:SetPhysicsAttacker(owner, 4)
				end
			end
		end
	end
	self:NextThink(CurTime() + self.ForceDelay)
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end