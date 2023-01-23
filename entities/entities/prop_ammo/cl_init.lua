INC_CLIENT()

ENT.ColorModulation = Color(0.25, 1, 0.25)
function ENT:Draw()
	if MySelf:GetInfo("zs_nopickuploot") == "1" or MySelf:Team() == TEAM_UNDEAD or MySelf:KeyDown(IN_SPEED) then return end
	local drawinfo
	local myteam
	local pos
	local eyepos
	if MySelf:IsValid() then
		myteam = MySelf:Team()
		pos = self:GetPos() + Vector(0,0,10)
		eyepos = EyePos()
		if myteam == TEAM_HUMAN or myteam == TEAM_SPECTATOR then
			drawinfo = (GAMEMODE.AlwaysShowNails or not MySelf:KeyDown(IN_SPEED) or GAMEMODE.TraceTargetNoPlayers == self:GetParent()) and eyepos:DistToSqr(pos) <= 262144 and WorldVisible(eyepos, pos)
		elseif myteam == TEAM_UNDEAD then
			drawinfo = GAMEMODE.TraceTargetNoPlayers == self:GetParent()
		end
	end



	if drawinfo and self:IsValid() then

		local hcolor = COLOR_WHITE



		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)

		local nearest = self:WorldSpaceCenter()
		local norm = nearest - eyepos
		norm:Normalize()
		local dot = EyeVector():Dot(norm)

		local dotsq = dot * dot
		local vis = math.Clamp((dotsq * dotsq) - 0.1, 0, 1)

		if vis < 0.01 then return end

		cam.IgnoreZ(true)

		cam.Start3D2D(nearest, ang, 0.1)
			local wid, hei = 150, 6
			local x, y = wid * -0.5 + 2, 0

				y = y + hei - 28
				hei = 8
				x = wid * -0.5 + 2

                    local ammotype = self:GetAmmoType()
                    ammotype = GAMEMODE.AmmoNames[ammotype] or ammotype
                    ammotype = translate.Get(string.lower(string.Implode("",string.Explode(" ","ammo_"..ammotype))))
					draw.SimpleText(ammotype.." x"..self:GetAmmo(), "ZSHUDFontBig", x + 55, y - 150, COLOR_CYAN, TEXT_ALIGN_CENTER)
		cam.End3D2D()

		cam.IgnoreZ(false)
	end

end