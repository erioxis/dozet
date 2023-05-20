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
		draw.SimpleText(translate.Get("weapon_remantler"), "ZS3D2DFont2", 0, -50, COLOR_GREEN, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		if owner:IsValid() and owner:IsPlayer() then
			draw.SimpleText(owner:ClippedName(), "ZS3D2DFont2", 0, 160, owner == MySelf and COLOR_LBLUE or COLOR_GRAY, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		self:Draw3DHealthBar(math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1), nil, 570, 0.85)
		local wep = MySelf:GetActiveWeapon()
		--isnumber(tonumber(string.sub(wep:GetClass(),#wep:GetClass(),#wep:GetClass())))
		local number = wep and tonumber(string.sub(wep:GetClass(),#wep:GetClass(),#wep:GetClass())) or 0
		if wep and GAMEMODE:GetUpgradeScrap(wep, number+1) and number ~= 5 then
			local scost = math.floor(GAMEMODE:GetUpgradeScrap(wep, number+1) * (MySelf.ScrapDiscount or 1))
			if  MySelf:KeyDown(IN_DUCK) and MySelf:KeyDown(IN_SPEED) then
				local plc = 0
				for i=number,5 do
					plc = plc + math.floor(GAMEMODE:GetUpgradeScrap(wep, i) * (MySelf.ScrapDiscount or 1))
				end
				scost = plc
			end
			draw.SimpleText(translate.Get("scrap_for_upg")..scost, "ZS3D2DFont2Small", 0, 260, scost <= MySelf:GetAmmoCount("scrap") and COLOR_BLUE or COLOR_RED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end


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
	self:RenderInfo(self:LocalToWorld(vOffset2), self:LocalToWorldAngles(aOffset2), owner)
end

net.Receive("zs_remantlercontent", function(length)
	local ent = net.ReadEntity()
	local readstring = net.ReadString()

	ent.WepClass = readstring ~= "" and readstring or nil
	ent.Contents = readstring ~= "" and weapons.Get(readstring).PrintName or "EMPTY"
end)
