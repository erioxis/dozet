INC_CLIENT()

ENT.NextEmit = 0

	--pac.SetupENT(ENT) -- this can also be used in initialize using "self" instead of "ENT"
	
	--function ENT:Initialize()
	--	self:AttachPACPart(outfit)
	--end

	--function ENT:OnRemove()
	--	self:RemovePACPart(outfit)
	--end
	
function ENT:Draw()
	self:DrawModel()

	if CurTime() >= self.NextEmit and self:GetVelocity():LengthSqr() >= 256 then
		self.NextEmit = CurTime() + 0.05

		local pos = self:WorldSpaceCenter()

		local emitter = ParticleEmitter(pos)
		emitter:SetNearClip(16, 24)

		local particle = emitter:Add("sprites/flamelet"..math.random(5), pos)
		particle:SetVelocity(VectorRand():GetNormalized() * math.Rand(8, 16))
		particle:SetDieTime(3)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(255)
		particle:SetStartSize(25)
		particle:SetEndSize(15)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-25, 25))
		particle:SetColor(250, 250, 250)
		particle:SetLighting(true)

		emitter:Finish() emitter = nil collectgarbage("step", 64)
	end
end
function ENT:Initialize()
	GAMEMODE:TopNotify(COLOR_GREEN,{killicon = "weapon_zs_arsenalcrate"},translate.Get("airdrop_s"))
end
