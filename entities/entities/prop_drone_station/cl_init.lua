INC_CLIENT()

--ENT.Contents = "EMPTY"

local arcscolor = Color(150, 150, 150)
function ENT:Initialize()
	local matrix = Matrix()
	matrix:Scale(Vector(0.87, 1, 1.2))
	self:EnableMatrix( "RenderMultiply", matrix )
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 128))

	self.AmbientSound = CreateSound(self, "ambient/machines/combine_shield_touch_loop1.wav")
	self.AmbientSound:SetSoundLevel(65)


	cmodel = ClientsideModel("models/props_c17/utilityconnecter005.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(15, -12, 18.6)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(90, 0, -70)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetColor(arcscolor)
		cmodel:SetMaterial("models/shiny")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(2, 2.5, 0.25))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcOne = cmodel
	end

	cmodel = ClientsideModel("models/props_c17/utilityconnecter005.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(15, 12, 18.6)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(90, 0, 70)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetColor(arcscolor)
		cmodel:SetMaterial("models/shiny")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(2, 2.5, 0.25))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcTwo = cmodel
	end
	cmodel = ClientsideModel("models/props/cs_office/computer_monitor.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, 20)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		--cmodel:SetColor(arcscolor)
	--	cmodel:SetMaterial("models/shiny")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(1, 1, 1.1))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcThree = cmodel
	end
	cmodel = ClientsideModel("models/props_c17/oildrum001_explosive.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(-12, 7.5, -20)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		--cmodel:SetColor(arcscolor)
	--	cmodel:SetMaterial("models/shiny")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(.3, .3, .3))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.Bochka = cmodel
	end

end
ENT.NextBeam = 0
function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
end

local vOffset = Vector(11.75, 0, 20)
local vOffset2 = Vector(-12.75, 0, 13)
local aOffset = Angle(0, 90, 90)
local aOffset2 = Angle(0, 270, 90)
local beamcol, matBeam = Color(54, 69, 182), Material("trails/electric")
function ENT:RenderInfo(pos, ang, owner)
	cam.Start3D2D(pos, ang, 0.055)
		draw.SimpleText(translate.Get("weapon_drone_station"), "ZS3D2DFont2", 0, -50, COLOR_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if owner:IsValid() and owner:IsPlayer() then
			draw.SimpleText(owner:ClippedName(), "ZS3D2DFont2", 0, 160, owner == MySelf and COLOR_LBLUE or COLOR_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		self:Draw3DHealthBar(math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1), nil, 570, 0.85)
		if owner == MySelf then
			draw.SimpleText(self:GetScraps() .. translate.Get("scram_rem"), "ZS3D2DFont2Big", 0, 290, COLOR_GRAY, TEXT_ALIGN_CENTER)
		end
	cam.End3D2D()
end

function ENT:Draw()
	self:DrawModel()


	if not MySelf:IsValid() or MySelf:Team() ~= TEAM_HUMAN then return end

	local owner = self:GetObjectOwner()
	self:RenderInfo(self:LocalToWorld(vOffset), self:LocalToWorldAngles(aOffset), owner)
	render.SetMaterial( matBeam )
	--render.DrawBeam(self:LocalToWorld(Vector(30, -18, 18.6)), self:LocalToWorld(Vector(30, 18, 18.6)),12,16*math.abs(math.sin(CurTime() * math.pi)), 19*math.abs(math.sin(CurTime() * math.pi)), beamcol)
--	if self.NextBeam > CurTime() then return end
	--self.NextBeam = CurTime() + 0.6
	local rand = math.random(7,8)
	render.StartBeam(rand)
	for i=1,rand do
		render.AddBeam(self:LocalToWorld(Vector(30, -24+(44*i/rand), 18.6 + 4 * ((i == 1 or i == rand )and 0 or 1) * math.Rand(-1.5,1.5))),12,2, beamcol)
	end
	render.EndBeam()
end

net.Receive("zs_remantlercontent", function(length)
	local ent = net.ReadEntity()
	local readstring = net.ReadString()

	ent.WepClass = readstring ~= "" and readstring or nil
	ent.Contents = readstring ~= "" and weapons.Get(readstring).PrintName or "EMPTY"
end)
function ENT:OnRemove()
	self.AmbientSound:Stop()


	if self.ArcOne and self.ArcOne:IsValid() then
		self.ArcOne:Remove()
	end

	if self.ArcTwo and self.ArcTwo:IsValid() then
		self.ArcTwo:Remove()
	end
	if self.ArcThree and self.ArcThree:IsValid() then
		self.ArcThree:Remove()
	end
	if self.Bochka and self.Bochka:IsValid() then
		self.Bochka:Remove()
	end
end
