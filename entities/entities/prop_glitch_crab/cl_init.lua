INC_CLIENT()

function ENT:Initialize()
	timer.Simple(0, function(arguments)
		self:SetModel("models/headcrabclassic.mdl")
	end)
	self:SetModelScale(0.5, 0)
	self:UseClientSideAnimation(true)
end
local EmitSounds = {
	Sound("npc/headcrab/alert1.wav"),
	Sound("npc/headcrab/attack1.wav"),
	Sound("npc/headcrab/attack3.wav"),
	Sound("npc/headcrab/attack2.wav"),
	Sound("npc/headcrab/die1.wav"),
	Sound("npc/headcrab/die2.wav"),
	Sound("npc/headcrab/pain3.wav"),
	Sound("npc/headcrab/pain2.wav"),
	Sound("npc/headcrab/pain1.wav")
}

function ENT:Think()
	if self.DoEmitNextFrame then
		self.DoEmitNextFrame = nil
		self:EmitSound(EmitSounds[math.random(#EmitSounds)], 65, math.random(95, 105))
	end
	self:SetSequence(2)
	self:SetCycle(CurTime())
end

function ENT:Draw()
	render.SetColorModulation(0.259, 0.251, 0.58)
	render.SuppressEngineLighting(true)
	self:DrawModel()
	render.SetColorModulation(1, 1, 1)
	render.SuppressEngineLighting(false)
	if math.random(1,500) == 1 then
		self.DoEmitNextFrame = true
	end
end
