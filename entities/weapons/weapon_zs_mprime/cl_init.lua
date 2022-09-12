INC_CLIENT()
function SWEP:DrawHUD()
		
	local wid, hei = 10, 900
	local x, y = ScrW() + wid - 960, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")
	if !self:GetJudge() then
		draw.SimpleText("Judge Mode", "ZSHUDFontSmall", x + wid, texty - 25, COLOR_RED, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText("Judge Mode", "ZSHUDFontSmall", x + wid, texty - 25, COLOR_GREEN, TEXT_ALIGN_CENTER)
	end

	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end

