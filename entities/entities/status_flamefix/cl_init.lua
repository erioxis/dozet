INC_CLIENT()

ENT.NextEmit = 0.1
local matFlesh = Material("effects/fire_cloud2")

local function GetMuzzlePos( weapon, attachment )
	if(!IsValid(weapon)) then return end
	local origin = weapon:GetPos()
	local angle = weapon:GetAngles()
	if weapon:IsWeapon() and weapon:IsCarriedByLocalPlayer() then
		if( IsValid( weapon:GetOwner() ) && GetViewEntity() == weapon:GetOwner() ) then
			local viewmodel = weapon:GetOwner():GetViewModel()
			if( IsValid( viewmodel ) ) then
				weapon = viewmodel
			end
		end
	end
	local attachment = weapon:GetAttachment( attachment or 1 )
	if( !attachment ) then
		return origin, angle
	end
	return attachment.Pos - Vector(-12,0,12), attachment.Ang
end

function ENT:Draw()
	local owner = self:GetOwner()
	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.05

	local wep = owner:GetActiveWeapon()
	local pos = GetMuzzlePos(wep,1)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)
	
	for i = 1, 12 do
		local rand = VectorRand() 
		rand.z = 0
		particle = emitter:Add("effects/fire_embers"..math.random(1,3), pos + rand*12 )
		particle:SetVelocity(owner:GetForward()*1400)
		particle:SetDieTime(math.Rand(0.4,0.7))
		particle:SetStartAlpha(230)
		particle:SetEndAlpha(0)
		particle:SetStartSize(22)
		particle:SetEndSize(22)
		particle:SetGravity(Vector(0,0,0))
		particle:SetAirResistance(430)
		if wep.Deathtrue then
			particle:SetColor(255, 255, 255)
		else
			particle:SetColor(0, 80, 255)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
