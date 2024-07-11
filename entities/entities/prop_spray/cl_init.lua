INC_CLIENT()

ENT.ColorModulation = Color(1, 0.5, 0)

function ENT:Think()
end

function ENT:OnRemove()
end

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
local colNail = Color(0, 0, 5, 220)
local colText = Color(240, 240, 240, 105)
local colDead = Color(230, 80, 80, 95)
function ENT:Draw()
	if !MySelf:KeyDown(IN_SPEED) then return end
	local myteam
	local pos
	local eyepos


		local redname = false
		local expert = false
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

				y = y + hei + 3
				hei = 8
				x = wid * -0.5 + 2
					local col = redname and colDead or colText
					col.a = 125 * vis
					draw.SimpleText("Spray by "..self:GetOwner():Nick(), "ZSHUDFontBig", x + 55, y - 150, COLOR_CYAN, TEXT_ALIGN_CENTER)
		cam.End3D2D()

		cam.IgnoreZ(false)


end
