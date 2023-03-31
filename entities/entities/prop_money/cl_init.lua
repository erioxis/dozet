INC_CLIENT()

ENT.NextEmit = 0

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
function ENT:Draw()
	
	if self:GetOwner() and self:GetOwner() ~= MySelf or !self:GetOwner() then return end
	local pos
	local eyepos
	if MySelf:IsValid() then
		pos = self:GetPos()
		eyepos = EyePos()
	end



		render.SetBlend(math.abs(math.sin(CurTime() * math.pi  ) * (self:GetNWInt("dapizda")-CurTime())))
		self:DrawModel()
		render.SetBlend(1)


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

		cam.Start3D2D(nearest, ang, 0.15 + vis)
			local wid, hei = 150, 6
			local x, y = wid * -0.5 + 2, 0

				y = y + hei + 3
				hei = 8
				x = wid * -0.5 + 2
					--local item = GAMEMODE:GetInventoryItemType(itype)
					draw.SimpleText(self:GetHP(), "ZSHUDFontBig", x + 55, y - 100, COLOR_YELLOW, TEXT_ALIGN_CENTER)
		cam.End3D2D()

		cam.IgnoreZ(false)

end
