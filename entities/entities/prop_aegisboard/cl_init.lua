INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
end
local matRefract = Material("models/spawn_effect")
function ENT:Draw()
	if render.SupportsPixelShaders_2_0() and MySelf:Team() == TEAM_HUMAN then 

		render.UpdateRefractTexture()

		matRefract:SetFloat("$refractamount", 0.01)
		--matRefract:SetFloat("$bluramount", 20.3)
		 

		render.ModelMaterialOverride(matRefract)
		self:DrawModel()
		render.ModelMaterialOverride(0)
	end
	if MySelf:IsValid() and MySelf:Team() == TEAM_HUMAN then
		local percentage = math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1)
		local ang = self:GetAngles()
		ang:RotateAroundAxis(ang:Up(), 270)
		ang:RotateAroundAxis(ang:Right(), 90)
		ang:RotateAroundAxis(ang:Forward(), 270)
		local vPos = self:GetPos()
		local vOffset = self:GetForward() * self:OBBMaxs().x
		local name
		local owner = self:GetObjectOwner()
		if owner:IsValidHuman() then
			name = owner:Name()
		end
		render.SetBlend(0.3)
		self:DrawModel()
		render.SetBlend(1)

		cam.Start3D2D(vPos + vOffset, ang, 0.05)
			self:Draw3DHealthBar(percentage, name)
		cam.End3D2D()

		ang:RotateAroundAxis(ang:Right(), 180)

		cam.Start3D2D(vPos - vOffset, ang, 0.05)
			self:Draw3DHealthBar(percentage, name)
		cam.End3D2D()
	end
	if MySelf:Team() ~= TEAM_HUMAN then
		self:DrawModel()
	end
end
