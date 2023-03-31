INC_CLIENT()

function SWEP:DrawHUD()
		
	local wid, hei = 10, 900
	local x, y = ScrW() + wid - 960, ScrH() - hei - 72
	local texty = y - 4 - draw.GetFontHeight("ZSHUDFontSmall")
	if !self:GetJudge() then
		draw.SimpleText(translate.Get("wep_j_mode"), "ZSHUDFontSmall", x + wid, texty - 25, COLOR_RED, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(translate.Get("wep_j_mode"), "ZSHUDFontSmall", x + wid, texty - 25, COLOR_GREEN, TEXT_ALIGN_CENTER)
	end
	if !self:GetDiePower() then
		draw.SimpleText(translate.Get("wep_d_mode"), "ZSHUDFontSmall", x + wid, texty - 45, COLOR_RED, TEXT_ALIGN_CENTER)
	else
		draw.SimpleText(translate.Get("wep_j_mode"), "ZSHUDFontSmall", x + wid, texty - 45, COLOR_GREEN, TEXT_ALIGN_CENTER)
	end
	if self:GetObed() then
		draw.SimpleText(translate.Get("wep_o_mode"), "ZSHUDFontSmall", x + wid, texty - 5, COLOR_GREEN, TEXT_ALIGN_CENTER)
	end

	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end
local matSkin = Material("models/debug/debugwhite")
function SWEP:ViewModelDrawn()
	render.SetColorModulation(1,1,1)
	render.ModelMaterialOverride(0)
	render.SetBlend(1)
end

function SWEP:PreDrawViewModel(vm)
	render.ModelMaterialOverride(matSkin)
	render.SetColorModulation(0.098, 0.502, 0.62)
	render.SetBlend(math.max(0.23,math.abs(math.sin(CurTime() * math.pi))))
end

SWEP.UseHands = false
SWEP.ViewModelFOV = 50
SWEP.BobScale = 2