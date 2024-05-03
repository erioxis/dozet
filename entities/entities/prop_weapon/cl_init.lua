INC_CLIENT()
include("cl_animations.lua")

ENT.ColorModulation = Color(0.15, 0.8, 1)

function ENT:Think()
	local class = self:GetWeaponType()
	if class ~= self.LastWeaponType then
		self.LastWeaponType = class

		self:RemoveModels()

		local weptab = weapons.Get(class)
		if weptab then
			local showmdl = weptab.ShowWorldModel or not self:LookupBone("ValveBiped.Bip01_R_Hand") and not weptab.NoDroppedWorldModel
			self.ShowBaseModel = weptab.ShowWorldModel == nil and true or showmdl

			if weptab.WElements then
				self.WElements = table.FullCopy(weptab.WElements)
				self:CreateModels(self.WElements)
			end

			self.ColorModulation = weptab.DroppedColorModulation or self.ColorModulation
			self.PropWeapon = true
			self.QualityTier = weptab.QualityTier
			self.Branch = weptab.Branch
			self.BranchData = weptab.Branches and weptab.Branches[self.Branch]
		end
	end
end

function ENT:OnRemove()
	self:RemoveModels()
end
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

		local class = self:GetWeaponType()
		local weptab = weapons.Get(class)
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
					--local item = GAMEMODE:GetInventoryItemType(itype)
					draw.SimpleText((weptab.PrintName or translate.Get("ammo_")), "ZSHUDFontBig", x + 55, y - 150, COLOR_CYAN, TEXT_ALIGN_CENTER)
					if self:GetOwner() and self:GetOwner():IsValid() and self:GetOwner():IsPlayer() then
						draw.SimpleText(self:GetOwner():Nick(), "ZSHUDFont", x + 55, y - 200, COLOR_CYAN, TEXT_ALIGN_CENTER)
					end
		cam.End3D2D()

		cam.IgnoreZ(false)
	end
end
local colYel, colCyan = Color(190,177,0), Color(0,177,169)
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

		local class = self:GetWeaponType()
		local weptab = weapons.Get(class)
		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)
		local mins = self:OBBMaxs()
		mins.x = 0
		mins.y = 0
		local nearest = self:WorldSpaceCenter() + mins
		local norm = nearest - eyepos
		norm:Normalize()
		local dot = EyeVector():Dot(norm)

		local dotsq = dot * dot
		local vis = math.Clamp((dotsq * dotsq) - 0.1, 0, 1)

		if vis < 0.01 then return end

		cam.IgnoreZ(true)
		
		cam.Start3D2D(nearest, ang, vis*0.12)
			local wid, hei = 150, 6
			local x, y = wid * -0.5 + 2, -120

				y = y + hei + 3
				hei = 8
				x = wid * -0.5 + 2

				
				surface.SetDrawColor(0, 0, 0, 255)
				surface_SetTexture(texDownEdge)
				surface_DrawTexturedRect(x-250, y-200, wid*4, hei*30)
					local tier =  (weptab.Tier or 0) 
					draw.SimpleText((weptab.PrintName or translate.Get("ammo_")), "ZSHUDFontBig", x + 55, y - 150, COLOR_WHITE, TEXT_ALIGN_CENTER)
					local owner = self:GetOwner()
					if owner and owner:IsValid() and owner:IsPlayer() then
						draw.SimpleText(owner:Nick(), "ZSHUDFont", x-240, y - 200, colCyan, TEXT_ALIGN_LEFT)
						if owner ~= MySelf and self:GetDTBool(12) then
							draw.SimpleText("САМОДОСТАТОЧНЫЙ", "ZSHUDFont", x+50, y-60, COLOR_DARKRED, TEXT_ALIGN_CENTER)
						end
					end
					if tier then
						draw.SimpleText(translate.Get('w_tier')..tier, "ZSHUDFont", x+300, y - 200, (tier > 6 and HSVToColor(CurTime()*180 % 360, 1, 1)) or colCyan, TEXT_ALIGN_CENTER)
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
--[[function ENT:Draw()

	self:DrawModel()
	
	local ent = self
	
	local mins = ent:OBBMins()
	local maxs = ent:OBBMaxs()
	local startpos = ent:GetPos()
	local dir = ent:GetUp()
	local len = 42

	local tr = util.TraceHull( {
		start = startpos,
		endpos = startpos + dir * len,
		maxs = maxs,
		mins = mins,
		filter = ent
	} )
	
	render.DrawLine( tr.HitPos, startpos + dir * len, color_white, true )
	render.DrawLine( startpos, tr.HitPos, Color( 0, 0, 255 ), true )
	
	local clr = color_white
	if ( tr.Hit ) then
		clr = Color( 255, 0, 0 )
	end

	render.DrawWireframeBox( startpos, Angle( 0, 0, 0 ), mins, maxs, Color( 255, 255, 255 ), true )
	render.DrawWireframeBox( tr.HitPos, Angle( 0, 0, 0 ), mins, maxs, clr, true )

end]]
