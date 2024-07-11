INC_CLIENT()
include("cl_animations.lua")
local categorycolors = {
	[ INVCAT_TRINKETS ] = { COLOR_RED, COLOR_DARKRED },
	[ INVCAT_COMPONENTS ] = { COLOR_BLUE, COLOR_DARKBLUE },
	[ INVCAT_CONSUMABLES ] = { COLOR_YELLOW, Color(75,67,1) },
	[INVCAT_WEAPONS] = {Color(41,39,182),Color(99,173,233)},
	[ INVCAT_ETERNAL ] = {Color(199,198,241),Color(50,147,113)},
}
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
<<<<<<< Updated upstream
=======

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
local colNail = Color(0, 0, 5, 220)
local colText = Color(240, 240, 240, 105)
local colDead = Color(230, 80, 80, 95)

local matGlow = Material("sprites/glow04_noz")
local texDownEdge = surface.GetTextureID("gui/gradient_down")
local surface_DrawTexturedRect = surface.DrawTexturedRect
local surface_SetTexture = surface.SetTexture
local function OldHud(self)
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
local colYel, colCyan = Color(190,177,0), Color(0,177,169)
local iFixed = false
local function NewHud(self)
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
		local vis = math.Clamp((dotsq * dotsq) -0.5, 0, 1)

		if vis < 0.01 then  return end


		cam.IgnoreZ(true)

		cam.Start3D2D(nearest, ang, vis*0.2)
		
			local wid, hei = 150, 6
			local x, y = wid * -0.5 + 2, -120

				y = y + hei + 3
				hei = 8
				x = wid * -0.5 + 2
					local itype = self:GetInventoryItemType()
					if not itype then
						return
					end

					surface.SetDrawColor(0, 0, 0, 255)
					surface_SetTexture(texDownEdge)
					surface_DrawTexturedRect(x-250, y-200, wid*4, hei*30)
					local tab = GAMEMODE.ZSInventoryItemData[itype]
					draw.SimpleText((tab.PrintName or translate.Get("ammo_")), "ZSHUDFontBig", x + 55, y - 150, categorycolors[GAMEMODE:GetInventoryItemType(itype)][1], TEXT_ALIGN_CENTER)
					local owner = self:GetOwner()
					if owner and owner:IsValid() and owner:IsPlayer() then
						draw.SimpleText(owner:Nick(), "ZSHUDFont", x-240, y - 200, colCyan, TEXT_ALIGN_LEFT)
						if owner ~= MySelf and self:GetDTBool(12) then
							draw.SimpleText("САМОДОСТАТОЧНЫЙ", "ZSHUDFont", x+50, y-60, COLOR_DARKRED, TEXT_ALIGN_CENTER)
						end
					end
					local tier =  (tab.Tier or 0) 
					if tier then
						draw.SimpleText(translate.Get('w_tier')..tier, "ZSHUDFont", x+300, y - 200, colCyan, TEXT_ALIGN_CENTER)
					end
		cam.End3D2D()

		cam.IgnoreZ(false)
	end
end
function ENT:Draw()
	if MySelf:GetInfo("zs_nopickuploot") == "1" or MySelf:Team() == TEAM_UNDEAD or MySelf:KeyDown(IN_SPEED) then return end
	if GAMEMODE.NewHud then
		NewHud(self)
	else
		OldHud(self)
	end
end
>>>>>>> Stashed changes
