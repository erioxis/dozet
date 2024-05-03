local PANEL = {}

local matGlow = Material("sprites/glow04_noz")
texDownEdge = surface.GetTextureID("gui/gradient_down")
local colHealth = Color(0, 0, 0, 240)
local function ContentsPaint(self, w, h)
	local lp = MySelf
	if lp:IsValid() then
		local screenscale = BetterScreenScale()
		local health = math.max(lp:GetBloodArmor(), 0)
		local healthperc = math.Clamp(health / 100, 0, 1)
		local wid, hei = 100 * screenscale, 18 * screenscale
 
		colHealth.r = (lp:GetInfo("zs_rhealth") + healthperc) * 100
		colHealth.g = lp:GetInfo("zs_ghealth") - healthperc
		colHealth.b = lp:GetInfo("zs_bhealth")

		local x = 18 * screenscale
		local y = 65 * screenscale

		local subwidth = healthperc * wid
		draw.SimpleTextBlurry(health, "ZSHUDFontSmall", 8, self:GetTall() - 92, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)

		surface.SetDrawColor(0, 0, 0, 230)
		surface.DrawRect(x, y, wid, hei)

		surface.SetDrawColor(colHealth.r * 1, colHealth.g * 0.2, colHealth.b, 40)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2, y + 1, subwidth - 4, hei - 2)
		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 30)
		surface.DrawRect(x + 2, y + 1, subwidth - 4, hei - 2)

		surface.SetMaterial(matGlow)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x + 2 + subwidth - 6, y + 1 - hei/2, 4, hei * 2)
		local phantomwidth = (health == 100 and 0 or wid) * (lp:GetActiveWeapon().IsMelee and (lp:GetActiveWeapon().MeleeDamage/100) * 0.25 or 0)

		colHealth.r = 210
		colHealth.g = 120
		colHealth.b = 70
		
		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 255)
		surface.SetTexture(texDownEdge)
		surface.DrawTexturedRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		surface.SetDrawColor(colHealth.r, colHealth.g, colHealth.b, 30)
		surface.DrawRect(x + 2 + subwidth - 4, y + 1, phantomwidth, hei - 2)
		colHealth.r = 100
		colHealth.g = 120
		colHealth.b = 70
		local maxhp = lp:GetMaxHealth()
		local hp = lp:Health()
		if hp > maxhp then
			draw.SimpleTextBlurry(hp.."/"..maxhp, "ZSHUDFont", 16, self:GetTall() - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		else
			draw.SimpleTextBlurry(hp, "ZSHUDFont", 16, self:GetTall() - 12, colHealth, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM)
		end
	end
end
function PANEL:Init()
	self:DockMargin(0, 0, 0, 0)
	self:DockPadding(0, 0, 0, 0)

	self.HealthModel = vgui.Create("ZSHealthModelPanel", self)
	self.HealthModel:Dock(LEFT)

	local contents = vgui.Create("Panel", self)
	contents:Dock(FILL)
	contents.Paint = ContentsPaint
	


	self:ParentToHUD()
	self:InvalidateLayout()
end

function PANEL:PerformLayout()
	local screenscale = BetterScreenScale()

	self:SetSize(screenscale * 350, screenscale * 156)

	self.HealthModel:SetWide(screenscale * 120)

	self:AlignLeft(screenscale * 24)
	self:AlignBottom(screenscale * 24)
end
local matGlow = Material("sprites/glow04_noz")
local texSideEdge = surface.GetTextureID("gui/gradient")
function PANEL:Paint()
	local lp = LocalPlayer()
	if lp:IsValid() and GAMEMODE.UseModelHealthBar then
		local health = math.max(lp:Health(), 0)
		local healthperc = math.Clamp(health / lp:GetMaxHealthEx(), 0, 1)
		local barghost = lp:IsBarricadeGhosting()
		colHealth.r = (1 - healthperc) * 180
		colHealth.g = healthperc * 180
		colHealth.b = 0		
		local screenscale = BetterScreenScale()		
		local wid, hei = 24 * screenscale, 156 * screenscale



		local x = (self.HealthModel:GetWide() - wid - 16)

		local subhei = healthperc * hei
		if barghost then
			surface.SetDrawColor(60, 60, 255, 255)
			surface.DrawRect(x-5, 0, wid+10, hei)		
		end
		surface.SetDrawColor(0, 0, 0, 150)
		surface.DrawRect(x ,0, wid, hei)

		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 160)
		surface.SetTexture(texSideEdge)
		surface.DrawTexturedRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)
		surface.SetDrawColor(colHealth.r * 0.6, colHealth.g * 0.6, colHealth.b, 230)
		surface.DrawRect(x + 2, 2+(hei-subhei), wid - 4, subhei - 4)

		surface.SetMaterial(matGlow)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(x + 1 - wid/2 , hei-subhei+1, wid*2, 4)
		
		surface.SetDrawColor(60, 60, 60, 240)
		surface.DrawOutlinedRect(x-1, -1, wid+2, hei+2,3)
	end
end

vgui.Register("ZSHealthArea2", PANEL, "Panel")

local PANEL = {}

PANEL.ModelLow = 0
PANEL.ModelHigh = 72
PANEL.Health = 100
PANEL.BarricadeGhosting = 0

function PANEL:Init()
	self:SetAnimSpeed(0)
	self:SetFOV(55)
end

local function LowestAndHighest(ent)
	local lowest
	local highest

	local basepos = ent:GetPos()
	for i=0, ent:GetBoneCount() - 1 do
		local bonepos, boneang = ent:GetBonePosition(i)
		if bonepos and bonepos ~= basepos then
			if lowest == nil then
				lowest = bonepos.z
				highest = bonepos.z
			else
				lowest = math.min(lowest, bonepos.z)
				highest = math.max(highest, bonepos.z)
			end
		end
	end

	highest = (highest or 1) + ent:GetModelScale() * 8

	return lowest or 0, highest
end

function PANEL:Think()
	local lp = LocalPlayer()
	if lp:IsValid() then
		self.Health = math.Clamp(lp:Health() / lp:GetMaxHealthEx(), 0, 1)
		self.BarricadeGhosting = math.Approach(self.BarricadeGhosting, lp:IsBarricadeGhosting() and 1 or 0, FrameTime() * 5)

		local model = lp:GetModel()
		local ent = self.Entity
		if not ent or not ent:IsValid() or model ~= ent:GetModel() then
			if IsValid(self.OverrideEntity) then
				self.OverrideEntity:Remove()
				self.OverrideEntity = nil
			end

			self:SetModel(model)
		end

		local overridemodel = lp.status_overridemodel
		if overridemodel and overridemodel:IsValid() then
			if IsValid(self.Entity) and not IsValid(self.OverrideEntity) then
				self.OverrideEntity = ClientsideModel(overridemodel:GetModel(), RENDER_GROUP_OPAQUE_ENTITY)
				if IsValid(self.OverrideEntity) then
					self.OverrideEntity:SetPos(self.Entity:GetPos())
					self.OverrideEntity:SetParent(self.Entity)
					self.OverrideEntity:AddEffects(bit.bor(EF_BONEMERGE, EF_BONEMERGE_FASTCULL))
					self.OverrideEntity:SetNoDraw(true)
				end
			end
		elseif self.OverrideEntity and self.OverrideEntity:IsValid() then
			self.OverrideEntity:Remove()
			self.OverrideEntity = nil
		end

		ent = self.Entity
		if ent and ent:IsValid() then
			ent:SetSequence(lp:GetSequence())

			ent:SetPoseParameter("move_x", lp:GetPoseParameter("move_x") * 2 - 1)
			ent:SetPoseParameter("move_y", lp:GetPoseParameter("move_y") * 2 - 1)
			ent:SetCycle(lp:GetCycle())

			local modellow, modelhigh = LowestAndHighest(ent)
			self.ModelLow = math.Approach(self.ModelLow, modellow, FrameTime() * 256)
			self.ModelHigh = math.Approach(self.ModelHigh, modelhigh, FrameTime() * 256)
			self.ModelHigh = math.max(self.ModelLow + 1, self.ModelHigh)
		end
	end
end

function PANEL:OnRemove()
	if IsValid(self.Entity) then
		self.Entity:Remove()
	end
	if IsValid(self.OverrideEntity) then
		self.OverrideEntity:Remove()
	end
end

local matWhite = Material("models/debug/debugwhite")
local matShadow = CreateMaterial("zshealthhudshadow", "UnlitGeneric", {["$basetexture"] = "decals/simpleshadow", ["$vertexalpha"] = "1", ["$vertexcolor"] = "1"})
local colShadow = Color(20, 20, 20, 230)
function PANEL:Paint()
	local ent = self.OverrideEntity or self.Entity
	if not ent or not ent:IsValid() then return end

	local lp = LocalPlayer()
	if not lp:IsValid() then return end

	local x, y = self:LocalToScreen(0, 0)
	local w, h = self:GetSize()
	local health = self.Health
	local entpos = ent:GetPos()
	local mins, maxs = lp:OBBMins(), lp:OBBMaxs()
	maxs.z = maxs.x * 4.5
	local campos = mins:Distance(maxs) * Vector(0, -0.9, 0.4)
	local lookat = (mins + maxs) / 2
	local ang = (lookat - campos):Angle()
	local modelscale = lp:GetModelScale()
	if ent:GetModelScale() ~= modelscale then
		ent:SetModelScale(modelscale, 0)
	end

	self:LayoutEntity(ent)

	render.ModelMaterialOverride(matWhite)
	render.SuppressEngineLighting(true)
	cam.IgnoreZ(true)

	cam.Start3D(campos - ang:Forward() * 16, ang, self.fFOV * 0.75, x, y, w, h, 5, 4096)
		render.OverrideDepthEnable(true, false)
		render.SetColorModulation(0, 0, self.BarricadeGhosting)
		ent:DrawModel()
		render.OverrideDepthEnable(false)
	cam.End3D()

	cam.Start3D(campos, ang, self.fFOV, x, y, w, h, 5, 4096)

	render.SetMaterial(matShadow)
	render.DrawQuadEasy(entpos, Vector(0, 0, 1), 45, 90, colShadow)

	render.SetLightingOrigin(entpos)
	render.ResetModelLighting(0.2, 0.2, 0.2)
	render.SetModelLighting(BOX_FRONT, 0.8, 0.8, 0.8)
	render.SetModelLighting(BOX_TOP, 0.8, 0.8, 0.8)

	if health == 1 then
		render.SetColorModulation(0, 0.6, 0)
		ent:DrawModel()
	elseif health == 0 then
		render.SetColorModulation(0, 0, 0)
		ent:DrawModel()
	else
		local normal = Vector(0, 0, 1)
		local pos = entpos + Vector(0, 0, self.ModelLow * (1 - health) + self.ModelHigh * health)

		render.EnableClipping(true)

		render.PushCustomClipPlane(normal, normal:Dot(pos))
		render.SetColorModulation(health > 0.5 and 0.6 or (0.7 + math.sin(CurTime() * math.pi * 2) * 0.2), 0, 0)
		ent:DrawModel()
		render.PopCustomClipPlane()

		normal = normal * -1
		render.PushCustomClipPlane(normal, normal:Dot(pos))
		render.SetColorModulation(0, 0.6, 0)
		ent:DrawModel()
		render.PopCustomClipPlane()

		render.EnableClipping(false)
	end

	cam.End3D()

	render.ModelMaterialOverride()
	render.SuppressEngineLighting(false)
	render.SetColorModulation(1, 1, 1)
	cam.IgnoreZ(false)
end

function PANEL:LayoutEntity(ent)
	self:RunAnimation()
end

vgui.Register("ZSHealthModelPanel", PANEL, "DModelPanel")
