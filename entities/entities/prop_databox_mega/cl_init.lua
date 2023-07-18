INC_CLIENT()


ENT.ColorModulation = Color(0.3, 0.89, 0.7)
function ENT:Draw()
	
	if MySelf:Team() == TEAM_UNDEAD  then return end
	local drawinfo
	local pos
	local eyepos
	if MySelf:IsValid() then
		pos = self:GetPos()
		eyepos = EyePos()
		drawinfo = eyepos:DistToSqr(pos) <= 262144 and WorldVisible(eyepos, pos)
	end



	self:DrawModel()
	if drawinfo then

	local ang = EyeAngles()
	ang:RotateAroundAxis(ang:Up(), -90)
	ang:RotateAroundAxis(ang:Forward(), 90)

	local nearest = self:WorldSpaceCenter()
	local norm = nearest - eyepos
	norm:Normalize()
	local dot = EyeVector():Dot(norm)

	local dotsq = dot * dot
	local vis = math.Clamp((dotsq * dotsq) - 0.1, 0, 0.1)

	if vis < 0.01 then return end
		cam.IgnoreZ(true)

		cam.Start3D2D(nearest, ang, 0.05 + vis)
		local wid, hei = 150, 6
		local x, y = wid * -0.5 + 2, 0

					draw.SimpleText(translate.Get("barrels_hehe"), "ZSHUDFontBig", x + 55, y - 1000, COLOR_GREEN, TEXT_ALIGN_CENTER)
		cam.End3D2D()

		cam.IgnoreZ(false)
	end
end