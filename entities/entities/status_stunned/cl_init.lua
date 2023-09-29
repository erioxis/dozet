INC_CLIENT()

ENT.NextEmit = 0
INC_CLIENT()

function ENT:GetPower()
	local time = CurTime()
	--print(math.abs(math.sin(time/2)))
	return math.Clamp(math.Clamp((self:GetStartTime() + self:GetDuration() - CurTime()),0,1)*math.abs(math.sin(time/2)), -1, 1)
end
local colModDimVision = {
	["$pp_colour_colour"] = 1,
	["$pp_colour_brightness"] = 0,
	["$pp_colour_contrast"] = 1,
	["$pp_colour_mulr"]	= 0,
	["$pp_colour_mulg"] = 0,
	["$pp_colour_mulb"] = 0,
	["$pp_colour_addr"] = 0,
	["$pp_colour_addg"] = 0,
	["$pp_colour_addb"] = 0
}

function ENT:RenderScreenspaceEffects()
	if MySelf ~= self:GetOwner() then return end
	local power = self:GetPower()

	colModDimVision["$pp_colour_addb"] = power * 0.5
	colModDimVision["$pp_colour_addg"] = power * 0
	colModDimVision["$pp_colour_addr"] = power * 0.2
	DrawBloom(1 - power, power * 0.5,power *4, power *11, 1, 1, 1, 1, 1)
	DrawColorModify(colModDimVision)
	DrawSharpen(power *6.2,power *120)
	--DrawMaterialOverlay( "pp/sharpen", 1*power )
	--DrawSobel(math.max(0.01,0.6*power))

	
end

function ENT:Draw()
  -- if not MySelf:KeyDown(IN_SPEED) then return end
	local owner = self:GetOwner()
	if not owner:IsValid() or owner == MySelf and not owner:ShouldDrawLocalPlayer() then return end


	if owner.SpawnProtection then return end

	if CurTime() < self.NextEmit then return end
	self.NextEmit = CurTime() + 2.97
	self.StateTRC = !self.StateTRC

	local pos = owner:WorldSpaceCenter()+Vector(0,0,7)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(32, 24)
	local ang = Angle( 0, 0, 0 )
	local up = Vector( 0, 0, 1 )
	for i = 1, 20 do
		particle = emitter:Add("sprites/light_glow02_add", pos + Vector(0,0,self.StateTRC and 0 or 50) + ang:Forward()*18)
		particle:SetDieTime(3)
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(255)
		particle:SetStartSize(self.StateTRC and 1 or 2)
		particle:SetEndSize(self.StateTRC and 2 or 1)
		particle:SetGravity(Vector(0, 0, self.StateTRC and 53 or -53))
		particle:SetAirResistance(300)
		particle:SetStartLength(25)
		particle:SetEndLength(25)
		if i%2 == 0 then
			particle:SetColor(250, 250, 250)
		else
			particle:SetColor((255+50*i)%256, (255+90*i)%256, (255+80*i)%256)
		end
		ang:RotateAroundAxis( up, 20 )
	
	end

	emitter:Finish() emitter = nil collectgarbage("step", 64)
end
