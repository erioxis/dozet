INC_CLIENT()

ENT.NextEmit = 0.1
local matFlesh = Material("effects/fire_cloud2")

local function GetMuzzlePos( wep, attachment )
	if !wep.VElements or !wep.VElements['barrel2'] then return wep:GetOwner() end
	return wep.VElements['barrel2'].modelEnt 
end

function ENT:Draw()
	local owner = self:GetOwner()
	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local wep = owner:GetActiveWeapon()
	if !GetMuzzlePos(wep,1) or !GetMuzzlePos(wep,1):IsValid() then return end
	local pos = GetMuzzlePos(wep,1):GetPos() - Vector(0,12,12)

	local emitter = ParticleEmitter(pos) 
	emitter:SetNearClip(16, 24)
	
	for i = 1, 32 do
		local rand = VectorRand() 
		particle = emitter:Add("effects/fire_embers"..math.random(1,3), pos + rand*4 )
		particle:SetVelocity(owner:GetAimVector()*900)
		particle:SetDieTime(math.Rand(0.4,0.7))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(22)
		particle:SetEndSize(22)
		particle:SetGravity(Vector(0,0,0))
		particle:SetAirResistance(120)
		if wep.Deathtrue then
			particle:SetColor(255, 255, 255)
		else
			particle:SetColor(0, 120, 255)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
