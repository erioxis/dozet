INC_CLIENT()

--ENT.Contents = "EMPTY"

function ENT:Initialize()
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 128))
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
end

local vOffset = Vector(11.75, 0, 13)
local vOffset2 = Vector(-12.75, 0, 13)
local aOffset = Angle(0, 90, 90)
local aOffset2 = Angle(0, 270, 90)

function ENT:RenderInfo(pos, ang, owner)
	cam.Start3D2D(pos, ang, 0.055)
		self:Draw3DHealthBar(math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1), nil, 570, 0.85)
		draw.SimpleText("КАЗИНО", "ZS3D2DFont2Big", 0, 290, COLOR_GRAY, TEXT_ALIGN_CENTER)
		draw.SimpleText("СТОИМОСТЬ - "..self:GetDTFloat(22), "ZS3D2DFont2", 0, 200, COLOR_GRAY, TEXT_ALIGN_CENTER)
		for i=1,5 do
			draw.SimpleText(self:GetDTInt(6+i), "ZS3D2DFont2", -150+50*i, -50, COLOR_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	cam.End3D2D()
end

function ENT:Draw()
	self:DrawModel()

	if not MySelf:IsValid() or MySelf:Team() ~= TEAM_HUMAN then return end

	local owner = self:GetObjectOwner()
	self:RenderInfo(self:LocalToWorld(vOffset), self:LocalToWorldAngles(aOffset), owner)
	self:RenderInfo(self:LocalToWorld(vOffset2), self:LocalToWorldAngles(aOffset2), owner)
end

net.Receive("zs_remantlercontent", function(length)
	local ent = net.ReadEntity()
	local readstring = net.ReadString()

	ent.WepClass = readstring ~= "" and readstring or nil
	ent.Contents = readstring ~= "" and weapons.Get(readstring).PrintName or "EMPTY"
end)
