INC_CLIENT()

ENT.Pulsed = true
local matBeam = Material( "trails/electric" )

function ENT:Initialize()
	self:SetModelScale(0.5, 0)

	self.AmbientSound = CreateSound(self, "npc/scanner/combat_scan_loop4.wav")
	self.AmbientSound:SetSoundLevel(55)

	local cmodel = ClientsideModel("models/props_wasteland/buoy01.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, -11)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetColor(Color(81, 238, 34))
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		local matrix = Matrix()
		matrix:Scale(Vector(0.6, 0.6, 0.02))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.CModel = cmodel
	end
end


function ENT:OnRemove()
	self.AmbientSound:Stop()

	if self.CModel and self.CModel:IsValid() then
		self.CModel:Remove()
	end
end
