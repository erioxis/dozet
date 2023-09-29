INC_CLIENT()

function ENT:PrePlayerDraw(pl)
	if pl ~= self:GetOwner() then return end

	local b = 1 - math.abs(math.sin((CurTime() + self:EntIndex()) * 3)) * 0.2
	render.SetColorModulation(0.1, 0.1, b)
end

function ENT:PostPlayerDraw(pl)
	if pl ~= self:GetOwner() then return end

	render.SetColorModulation(1, 1, 1)
end

function ENT:GetPower()
	return math.Clamp(self:GetStartTime() + (self:GetDuration() - CurTime()), 0, 1)
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
