INC_CLIENT()

ENT.Pulsed = true
ENT.CModels = {}
local matBeam = Material( "trails/electric" )

function ENT:Initialize()
	self:SetModelScale(0, 0)


	local cmodel = ClientsideModel("models/props_debris/concrete_chunk03a.mdl")
	if cmodel:IsValid() then
		cmodel:SetPos(self:LocalToWorld(Vector(0, 0, -3)))
		cmodel:SetAngles(self:LocalToWorldAngles(Angle(0, 0, 0)))
		cmodel:SetSolid(SOLID_NONE)
		cmodel:SetMoveType(MOVETYPE_NONE)
		cmodel:SetParent(self)
		cmodel:SetOwner(self)

		local matrix = Matrix()
		matrix:Scale(Vector(1, 1, 1))
		cmodel:EnableMatrix( "RenderMultiply", matrix )

		cmodel:Spawn()

		self.CModel = cmodel
	end
	local ang = Angle( 0, 0, 0 )
	local up = Vector( 0, 0, 1 )
	for i=1,8 do
		local cmodel = ClientsideModel("models/props_docks/dock01_pole01a_128.mdl")
		if cmodel:IsValid() then
			cmodel:SetPos(self:LocalToWorld(Vector(0, 0, -7)+ ang:Forward()))
			ang:RotateAroundAxis( up,45 )
			cmodel:SetAngles(self:LocalToWorldAngles(ang+Angle(90, 0, 110)))
			cmodel:SetSolid(SOLID_NONE)
			cmodel:SetMoveType(MOVETYPE_NONE)
			cmodel:SetParent(self)
			cmodel:SetOwner(self)

			local matrix = Matrix()
			matrix:Scale(Vector(0.4, 0.4, 0.3))
			cmodel:EnableMatrix( "RenderMultiply", matrix )

			cmodel:Spawn()

			self.CModels[#self.CModels+1] = cmodel
		end
	end

end

function ENT:DrawTranslucent()
	self:DrawModel()
    if WorldVisible( EyePos(), self:GetPos() ) and  MySelf:KeyDown(IN_SPEED) then
        local distance = MySelf:GetPos():Distance( self:GetPos() )
        local alpha = 255
        local at = self:GetPos():ToScreen()
        local ang = Angle( 0, 0, 0 )
        local up = Vector( 0, 0, 1 )
        local ringpos = self:GetPos()
        local ringsize = self.MaxDistance*(self:GetObjectHealth()/self:GetMaxObjectHealth())
        render.SetMaterial( matBeam )
        render.StartBeam( 19 )
        for i=1, 19 do
            render.AddBeam( ringpos + ang:Forward() * ringsize, 10, 10, Color( 162, 52, 4))
            ang:RotateAroundAxis( up, 20 )
        end
            
        render.EndBeam()
    end
end

function ENT:Think()
	if MySelf:IsValid() then
		if self.Pulsed then
			if CurTime() < self:GetNextRepairPulse() then
				self.Pulsed = false
			end
		elseif CurTime() >= self:GetNextRepairPulse() then
			self.Pulsed = true
		end
	end
	local emitter = ParticleEmitter(self:GetPos())
	emitter:SetNearClip(24, 32)
	local particle = emitter:Add("effects/yellowflare", self:GetPos()+VectorRand(-10,10))
	particle:SetVelocity(Vector(math.Rand(1,20),math.Rand(1,20),math.Rand(1,20)))
	particle:SetDieTime(math.Rand(0.75, 1.25))
	particle:SetStartAlpha(255)
	particle:SetEndAlpha(0)
	particle:SetStartSize(5)
	particle:SetEndSize(20)
	particle:SetColor(251,112,2)
	particle:SetRoll(math.Rand(180, 360))
	particle:SetRollDelta(math.Rand(-4, 4))
	particle:SetGravity(Vector(0, 0, 190))
	particle:SetAirResistance(50)
	
	emitter:Finish()

	self:NextThink(CurTime() + 0.1)
	return true
end

function ENT:OnRemove()

	if self.CModel and self.CModel:IsValid() then
		self.CModel:Remove()
	end
	for k,v in pairs(self.CModels) do
		if v and v:IsValid() then
			v:Remove()
		end
	end
end
