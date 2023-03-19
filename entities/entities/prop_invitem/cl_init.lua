INC_CLIENT()
include("cl_animations.lua")

ENT.ColorModulation = Color(1, 0.5, 0)

function ENT:Think()
	local itype = self:GetInventoryItemType()
	if itype ~= self.LastInvItemType then
		self.LastInvItemType = itype

		self:RemoveModels()

		local invdata = GAMEMODE.ZSInventoryItemData[itype]
		local droppedeles = invdata.DroppedEles

		if invdata then
			--local showmdl = --weptab.ShowWorldModel or not self:LookupBone("ValveBiped.Bip01_R_Hand") and not weptab.NoDroppedWorldModel
			self.ShowBaseModel = not istable(droppedeles)--weptab.ShowWorldModel == nil and true or showmdl

			if istable(droppedeles) then
				self.WElements = table.FullCopy(droppedeles)
				self:CreateModels(self.WElements)
			end

			self.ColorModulation = self.ColorModulation
			self.PropWeapon = true
		end
	end
end

function ENT:OnRemove()
	self:RemoveModels()
end

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
local colNail = Color(0, 0, 5, 220)
local colText = Color(240, 240, 240, 105)
local colDead = Color(230, 80, 80, 95)
function ENT:Draw()
	if MySelf:GetInfo("zs_nopickuploot") == "1" or MySelf:Team() == TEAM_UNDEAD or MySelf:KeyDown(IN_SPEED) then return end
	local drawinfo
	local myteam
	local pos
	local eyepos
	if MySelf:IsValid() then
		myteam = MySelf:Team()
		pos = self:GetPos()
		eyepos = EyePos()
		if myteam == TEAM_HUMAN or myteam == TEAM_SPECTATOR then
			drawinfo = (not MySelf:KeyDown(IN_SPEED) or GAMEMODE.TraceTargetNoPlayers == self:GetParent()) and eyepos:DistToSqr(pos) <= 262144 and WorldVisible(eyepos, pos)
		elseif myteam == TEAM_UNDEAD then
			drawinfo = false
		end
	end



	if drawinfo then

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
					local itype = self:GetInventoryItemType()
					if not itype then
						return
					end
					--local item = GAMEMODE:GetInventoryItemType(itype)
					draw.SimpleText((GAMEMODE.ZSInventoryItemData[itype].PrintName or translate.Get("ammo_")), "ZSHUDFontBig", x + 55, y - 150, COLOR_CYAN, TEXT_ALIGN_CENTER)
					if self:GetOwner() and self:GetOwner():IsValid() and self:GetOwner():IsPlayer() then
						draw.SimpleText(self:GetOwner():Nick(), "ZSHUDFont", x + 55, y - 200, COLOR_CYAN, TEXT_ALIGN_CENTER)
					end
		cam.End3D2D()

		cam.IgnoreZ(false)
	end

end
