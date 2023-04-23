INC_CLIENT()

ENT.NextEmit = 0
local beamcol, matBeam = Color(237, 140, 140), Material("effects/bloodstream")
function ENT:Draw()
	local owner = self:GetOwner()
	local who = self:GetDTEntity(11)
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() or !who:IsValid() or who:Team() ~= owner:Team() then return end
	if owner:GetZombieClassTable().IgnoreTargetAssist then return end

	local ang = Angle( 0, 0, 0 )
	if owner.SpawnProtection then return end
	render.SetMaterial( matBeam )
	render.StartBeam(1)
	render.AddBeam(owner:WorldSpaceCenter(),2,2, Color( 255, 154, 154))
	render.EndBeam()
	render.DrawBeam(owner:WorldSpaceCenter(), who:WorldSpaceCenter(),5,5, 5, beamcol)
	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 0.2

	local pos = owner:WorldSpaceCenter()

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(16, 24)
	local pos2 = who:LocalToWorld(who:OBBCenter())
	local direction = (pos2 - self:GetPos()):GetNormal()
	for i = 1, 2 do
		particle = emitter:Add("sprites/light_glow02_add", pos + VectorRand() * 12)
		if particle then
			particle:SetDieTime(6)
			particle:SetStartAlpha(230)
			particle:SetEndAlpha(0)
			particle:SetStartSize(3)
			particle:SetEndSize(0)
			particle:SetGravity(direction*150)
			particle:SetAirResistance(10)
			particle:SetStartLength(1)
			particle:SetEndLength(125)
			particle:SetColor(220, 10, 20)
		end
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
