INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT
ENT.NextEmit = 0

function ENT:SetAttachEntity(ent, physbone1, physbone2)
	self.m_AttachEntity = ent
end

function ENT:OnRemove()
	local normal = self:GetForward() * -1
	local pos = self:GetPos() + normal

	sound.Play("physics/metal/metal_box_impact_bullet"..math.random(1, 3)..".wav", pos, 75, math.random(90, 110))

	local grav = Vector(0, 0, -300)

	local emitter = ParticleEmitter(pos)
	emitter:SetNearClip(22, 32)
	for i=1, math.random(32, 48) do
		local vNormal = (VectorRand() * 0.6 + normal):GetNormalized()
		local particle = emitter:Add("effects/spark", pos + vNormal)
		particle:SetVelocity(vNormal * math.Rand(16, 100))
		particle:SetDieTime(math.Rand(0.5, 1))
		particle:SetStartAlpha(255)
		particle:SetEndAlpha(255)
		particle:SetStartSize(math.Rand(0.4, 1.5))
		particle:SetEndSize(0)
		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-8, 8))
		particle:SetCollide(true)
		particle:SetBounce(0.8)
		particle:SetGravity(grav)
	end
	emitter:Finish() emitter = nil collectgarbage("step", 64)
end

local matExpert = Material("zombiesurvival/padlock.png")
local matHeart = Material("icon16/heart.png")
local matWhite = Material("models/debug/debugwhite")
local matDef = Material("zombiesurvival/defense.png")
local colNail = Color(0, 0, 5, 220)
local colText = Color(240, 240, 240, 105)
local colDead = Color(230, 80, 80, 95)
local colDef = Color(90, 49, 252, 255)
function ENT:Draw()--[[
]]

	local cader = false
	local parent = self:GetParent()
	if not parent:IsValid() or RealTime() == parent.LastNailInfoDraw then
		if MySelf:Team() == TEAM_HUMAN then
			render.ModelMaterialOverride(matWhite)
			local mu = math.Clamp(self:GetNailHealth() / self:GetMaxNailHealth(), 0, 1)
			local green = mu * 200
			render.SetColorModulation((200 - green)/255, green/255, 0.05)
			render.SuppressEngineLighting(true)
			self:DrawModel()
			render.SuppressEngineLighting(false)
			render.ModelMaterialOverride(nil)
		end
		return
	end

	local drawinfo
	local myteam
	local pos
	local eyepos
	if MySelf:IsValid() then
		myteam = MySelf:Team()
		pos = self:GetPos()
		eyepos = EyePos()
		if myteam == TEAM_HUMAN or myteam == TEAM_SPECTATOR then
			drawinfo = (GAMEMODE.AlwaysShowNails or MySelf:KeyDown(IN_SPEED) or GAMEMODE.TraceTargetNoPlayers == self:GetParent()) and eyepos:DistToSqr(pos) <= 262144 and WorldVisible(eyepos, pos)
		elseif myteam == TEAM_UNDEAD then
			drawinfo = GAMEMODE.TraceTargetNoPlayers == self:GetParent()
		end
	end
	if myteam == TEAM_HUMAN then
		render.ModelMaterialOverride(matWhite)
		local mu = math.Clamp(self:GetNailHealth() / self:GetMaxNailHealth(), 0, 1)
		local green = mu * 200
		render.SetColorModulation((200 - green)/255, green/255, 0.05)
		render.SuppressEngineLighting(true)
		self:DrawModel()
		render.SuppressEngineLighting(false)
		render.ModelMaterialOverride(nil)
	end

	local nhp = self:GetNailHealth()
	local mnhp = self:GetMaxNailHealth()
	if nhp/mnhp < 0.35 and CurTime() > self.NextEmit then
		local normal = self:GetForward() * -1
		local epos = self:GetPos() + normal

		sound.Play("physics/metal/metal_box_impact_bullet"..math.random(1, 3)..".wav", pos, 58, math.random(210, 240))

		local emitter = ParticleEmitter(epos)
		emitter:SetNearClip(22, 32)
		for i=1, math.random(6, 12) do
			local vNormal = (VectorRand() * 0.6 + normal):GetNormalized()
			local particle = emitter:Add("effects/spark", epos + vNormal)
			particle:SetDieTime(math.Rand(0.1, 0.2))
			particle:SetGravity(Vector(math.random(-5, 5), math.random(-5, 5), math.random(1, 3)):GetNormal() * 50)
			particle:SetStartAlpha(100)
			particle:SetEndAlpha(0)
			particle:SetStartSize(4)
			particle:SetEndSize(1)
			particle:SetStartLength(10)
			particle:SetEndLength(0)
			particle:SetColor(165, 188, 0)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-20, 20))
		end
		emitter:Finish() emitter = nil collectgarbage("step", 64)

		self.NextEmit = CurTime() + math.Rand(4.2, 5.8)
	end

	if drawinfo then
		parent.LastNailInfoDraw = RealTime()

		local displayowner = self:GetDTString(0)
		local redname = false
		local expert = false
		local hcolor = COLOR_WHITE

		local deployer = self:GetOwner()
		if displayowner == "" then
			displayowner = nil

			if deployer:IsValid() then
				displayowner = deployer:Name()
				if deployer:Team() == TEAM_HUMAN and deployer:Alive() then
					local rlvl = deployer:GetZSRemortLevel()
					expert = rlvl > 0

					if expert then
						local rlvlmod, hlvl = math.floor((rlvl % 40) / 4), 0
						for rlvlr, rcolor in pairs(GAMEMODE.RemortColors) do
							if rlvlmod >= rlvlr and rlvlr >= hlvl then
								hlvl = rlvlr
								hcolor = rcolor
							end
						end
					end
				else
					displayowner = "(DEAD) "..displayowner
					redname = true
				end
			end
		end

		local ang = EyeAngles()
		ang:RotateAroundAxis(ang:Up(), -90)
		ang:RotateAroundAxis(ang:Forward(), 90)

		local nearest = parent:WorldSpaceCenter() 
		local norm = nearest - eyepos
		norm:Normalize()
		local dot = EyeVector():Dot(norm)

		local dotsq = dot * dot
		local vis = math.Clamp((dotsq * dotsq) - 0.1, 0, 1)

		if vis < 0.01 then return end

		cam.IgnoreZ(true)

		cam.Start3D2D(nearest, ang, 0.1)
			local scale = false
			local wid, hei = 150, 6
			local x, y = wid * -0.5 + 2, 0

			local validfriend = deployer:IsValidLivingHuman() and deployer.ZSFriendAdded

			if validfriend or expert then
				surface.SetMaterial(validfriend and matHeart or matExpert)
				surface.SetDrawColor(hcolor.r, hcolor.g, hcolor.b, 240 * vis)
				surface.DrawTexturedRect(
					x - (validfriend and 24 or 32),
					y - (validfriend and 0 or 5),
					validfriend and 16 or 24,
					validfriend and 16 or 24
				)
			end
			if MySelf:GetEyeTrace().Entity == parent then
				scale = true
				if GAMEMODE.NewbieMode and myteam ~= TEAM_UNDEAD then

					draw.SimpleText(translate.Format("press_z_or_b", input.LookupBinding("+undo") or "B"), "ZS3D2DUnstyleSmaller", x + 25, y - 90,  COLOR_WHITE, TEXT_ALIGN_CENTER)
				end
			end
			if GAMEMODE.NewbieMode and myteam ~= TEAM_UNDEAD and self:GetNailHealth() < self:GetMaxNailHealth() * 0.5 then
				for k,v in pairs(MySelf:GetWeapons()) do
					if v.HealStrength and v.HealStrength > 0.8 and self:GetRepairs() > 10 then
						cader = true
					end
				end
				draw.SimpleText((cader and  translate.Get("repair_this_nb") or translate.Get("run_danger_nb")), "ZS3D2DUnstyleSmaller", x + 25, y - 120,  (cader and COLOR_BLUE or COLOR_RED), TEXT_ALIGN_CENTER)
			end

			if self:GetMaxRepairs() > 0 or self:GetMaxNailHealth() > 0 then
				local repairs = self:GetRepairs()
				local mrps = self:GetMaxRepairs()

				surface.SetDrawColor(0, 0, 0, 210 * vis)
				surface.DrawRect(x - 1, y, mrps/5 + mrps/50 + 1, hei)

				for i = 0, repairs, 100 do
					local val = math.Clamp(repairs - i, 0, 100)

					surface.SetDrawColor(100, 170, 215, 240 * vis)
					surface.DrawRect(x + 1 + i/5 + i/50, y + 1, val/5, hei - 2)


				end

				local mu = math.Clamp(nhp / mnhp, 0, 1)
				local green = mu * 200
				colNail.r = 200 - green
				colNail.g = green
				colNail.a = 240 * vis

				y = y + hei + 3
				hei = 8
				x = wid * -0.5 + 2

				surface.SetDrawColor(0, 0, 0, 210 * vis)
				surface.DrawRect(x - 1, y, mnhp/5 + mnhp/50 + 2, hei)

				for i = 0, nhp, 200 do
					local val = math.Clamp(nhp - i, 0, 200)

					surface.SetDrawColor(colNail)
					surface.DrawRect(x + 1 + i/5 + i/50, y + 1, val/5, hei - 2)
				end

				if displayowner then
					local col = redname and colDead or colText
					col.a = 125 * vis
					if scale then 
						x = x * 3
						y = y * 2
					end
					colNail.r = 255 - green
					draw.SimpleText(displayowner, "ZS3D2DUnstyleSmallest", 0, y + 20, col, TEXT_ALIGN_CENTER)
					draw.SimpleText(math.floor(nhp) .. "/" .. math.floor(self:GetMaxNailHealth()), (scale and "ZS3D2DUnstyleSmaller" or "ZS3D2DUnstyleNail"), x + 25, y - 30,  colNail, TEXT_ALIGN_CENTER)
					draw.SimpleText(math.floor(repairs) .. "/" .. math.floor(mrps), (scale and "ZS3D2DUnstyleSmaller" or  "ZS3D2DUnstyleNail"), x + 25, y - 50, COLOR_CYAN, TEXT_ALIGN_CENTER)
				end
			end
			if self:GetDTBool(12) then
				surface.SetMaterial(matDef)
				surface.SetDrawColor(33, 33, 166)
				surface.DrawTexturedRect(
					x - 100,
					y - 64,
					64,
					64
				)
				x = x - 64
			end
			if self:GetDTBool(13) then
				surface.SetMaterial(matDef)
				surface.SetDrawColor(205, 104, 235)
				surface.DrawTexturedRect(
					x - 100,
					y - 64,
					64,
					64
				)
				x = x - 64
			end
			if self:GetDTBool(14) then
				surface.SetMaterial(matDef)
				surface.SetDrawColor(160, 25, 25)
				surface.DrawTexturedRect(
					x - 100,
					y - 64,
					64,
					64
				)
			end
		cam.End3D2D()

		cam.IgnoreZ(false)
	end

end
function ENT:Think()
end