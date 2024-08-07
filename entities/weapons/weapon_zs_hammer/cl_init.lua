INC_CLIENT()

SWEP.ViewModelFOV = 75

function SWEP:DrawHUD()
	if GetGlobalBool("classicmode") then return end

	local screenscale = BetterScreenScale()

	surface.SetFont("ZSHUDFont")
	local nails = self:GetPrimaryAmmoCount()
	local text = translate.Format("nails_x", nails)
	local nTEXW, nTEXH = surface.GetTextSize(text)

	draw.SimpleTextBlurry(text, "ZSHUDFont", ScrW() - nTEXW * 0.75 - 32 * screenscale, ScrH() - nTEXH * 2.6, nails > 0 and COLOR_LIMEGREEN or COLOR_RED, TEXT_ALIGN_CENTER)
	if GAMEMODE.NewbieMode then
		draw.SimpleTextBlurry(translate.Get("alt_item_hammer"), "ZSHUDFont", ScrW() - nTEXW * 0.1 - 32 * screenscale, ScrH() - nTEXH * 4.4, input.IsButtonDown(KEY_LALT) and COLOR_RED or COLOR_LIMEGREEN, TEXT_ALIGN_RIGHT)
		draw.SimpleTextBlurry(translate.Get("rmb_item_hammer"), "ZSHUDFont", ScrW() - nTEXW * 0.1 - 32 * screenscale, ScrH() - nTEXH *3.8, input.IsMouseDown(MOUSE_RIGHT) and COLOR_RED or COLOR_LIMEGREEN, TEXT_ALIGN_RIGHT)
		draw.SimpleTextBlurry(translate.Get("fix_item_hammer"), "ZSHUDFont", ScrW() - nTEXW * 0.1 - 32 * screenscale, ScrH() - nTEXH * 3.2, input.IsButtonDown(KEY_LSHIFT) and COLOR_RED or COLOR_LIMEGREEN, TEXT_ALIGN_RIGHT)
		if input.IsButtonDown(KEY_LALT) then
			draw.SimpleTextBlurry(translate.Get("fixed_2_item_hammer"), "ZSHUDFont", ScrW() - nTEXW * 0.1 - 32 * screenscale, ScrH() - nTEXH * 5, input.IsMouseDown(MOUSE_RIGHT) and COLOR_RED or COLOR_LIMEGREEN, TEXT_ALIGN_RIGHT)
			draw.SimpleTextBlurry(translate.Get("fixed_1_item_hammer"), "ZSHUDFont", ScrW() - nTEXW * 0.1 - 32 * screenscale, ScrH() - nTEXH * 5.6, input.IsButtonDown(KEY_R) and COLOR_RED or COLOR_LIMEGREEN, TEXT_ALIGN_RIGHT)
		end
	end

	if GetConVar("crosshair"):GetInt() ~= 1 then return end
	self:DrawCrosshairDot()
end
