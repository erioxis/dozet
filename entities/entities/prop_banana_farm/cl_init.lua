INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_BOTH

function ENT:Initialize()
	local matrix = Matrix()
	matrix:Scale(Vector(0.87, 1, 1.2))
	self:EnableMatrix( "RenderMultiply", matrix )
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 128))


	cmodel = ClientsideModel("models/props/de_dust/palm_tree_trunk.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, 55)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, -0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetColor(arcscolor)
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(0.1, 0.1, 0.1))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcOne = cmodel
	end

	cmodel = ClientsideModel("models/hunter/plates/plate075x075.mdl",RENDERGROUP_OPAQUE)
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(5,5,-8)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetMaterial("models/skeleton/skeleton_decomp")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(0.74, 0.9, 8))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcTwo = cmodel
	end
	cmodel = ClientsideModel("models/props/de_dust/palm_tree_head_skybox.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, 56)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(0.5, 0.5, 0.5))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.ArcThree = cmodel
	end
	cmodel = ClientsideModel("models/props/cs_militia/wndw01_breakable_frame.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(-0, 0, -0)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(-90, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		--cmodel:SetColor(arcscolor)
	--	cmodel:SetMaterial("models/shiny")
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		matrix = Matrix()
		matrix:Scale(Vector(3, .5, .3))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.Bochka = cmodel
	end

end
local matNature = Material("nature/dirtfloor006a")
function ENT:Draw()
end

function ENT:OnRemove()



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
