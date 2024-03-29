INC_CLIENT()

function ENT:Initialize()
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 72))

	self.AmbientSound = CreateSound(self, "npc/scanner/scanner_scan_loop2.wav")
	self.AmbientSound:Play()

	self.PixVis = util.GetPixelVisibleHandle()
	self.Trailing = CurTime() + 0.15
	self.TrailPositions = {}
	hook.Add("CreateMove", self, self.CreateMove)
	hook.Add("ShouldDrawLocalPlayer", self, self.ShouldDrawLocalPlayer)
	hook.Add("CalcView", self, self.CalcView)

	local ent, matrix = ClientsideModel("models/weapons/w_IRifle.mdl")
	if ent:IsValid() then
		ent:SetParent(self)
		ent:SetOwner(self)
		ent:SetLocalPos(vector_origin)
		ent:SetLocalAngles(angle_zero)
		ent:SetMaterial("phoenix_storms/torpedo")
		ent:SetColor(Color(150, 150, 150))

		matrix = Matrix()
		matrix:Scale(Vector(0.9, 0.65, 0.65))
		ent:EnableMatrix("RenderMultiply", matrix)

		ent:Spawn()
		self.GunAttachment = ent
	end
end
local angle = Angle(0,0,0)
function ENT:Think()
	self.AmbientSound:PlayEx(0.5, math.Clamp(75 + self:GetVelocity():Length() * 0.5, 75, 150))
	table.insert(self.TrailPositions, 1, self:GetPos()+angle:Right()*96)
	angle.yaw = angle.yaw + 90
	if self.TrailPositions[1] then
		table.remove(self.TrailPositions, 60)
	end

	local dist = 0
	local mypos = self:GetPos()
	for i=1, #self.TrailPositions do
		if self.TrailPositions[i]:DistToSqr(mypos) > dist then
			self:SetRenderBoundsWS(self.TrailPositions[i], mypos, Vector(16, 16, 16))
			dist = self.TrailPositions[i]:DistToSqr(mypos)
		end
	end
end

function ENT:DrawTranslucent()
	local atch = self.GunAttachment
	if atch and atch:IsValid() then
		local ang = self:GetGunAngles()
		ang:RotateAroundAxis(ang:Up(), 180)

		atch:SetPos(self:GetRedLightPos() + ang:Forward() * -12 + ang:Right() * 1 + ang:Up() * -5)
		atch:SetAngles(ang)

		atch:SetNoDraw(self:GetObjectOwner() == MySelf and self:BeingControlled())
	end

	self.BaseClass.DrawTranslucent(self)
end

function ENT:OnRemove()
	self.AmbientSound:Stop()

	if self.GunAttachment and self.GunAttachment:IsValid() then
		self.GunAttachment:Remove()
	end
end
