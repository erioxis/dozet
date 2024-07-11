INC_SERVER()

ENT.NextBlip = 0
ENT.NextBananas = 0
ENT.BananasSpawn = 0
ENT.WaveSave = 0

function ENT:Initialize()
	self.CreateTime = CurTime()

	self:SetModel("models/weapons/w_c4_planted.mdl")
	timer.Simple(0, function()  if self:IsValid() then self:SetPos(self:GetPos()+Vector(0,0,16)) end end)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)

	if dmginfo:GetDamage() <= 0 then return end

	if not self.Exploded and dmginfo:GetDamage() >= 60 and dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker():Team() == TEAM_UNDEAD then
		self:Remove()
	end
end



function ENT:Think()
	if self.WaveSave ~=  GAMEMODE:GetWave() then
		self.WaveSave = GAMEMODE:GetWave()
	end
	if CurTime() > self.NextBananas then
		local d = ents.Create("prop_banana")
		if d and d:IsValid() then
			d:SetPos(self:GetPos() + Vector(0,0,20))
			d:Spawn()
			d:SetHP(32)
			d:SetTime(CurTime()+12)
			d.DieTime = CurTime() + 11
			timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(VectorRand(-300,300)) end )
		end
		self.NextBananas =  CurTime()+(GAMEMODE:GetWaveStart() + GAMEMODE:GetWaveOneLength() + (self.WaveSave - 1) * GAMEMODE.TimeAddedPerWave)/12
	end
	self:NextThink(CurTime()+0.1)
	return true
end

function ENT:OnPackedUp(pl)
end
