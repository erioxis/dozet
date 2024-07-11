INC_CLIENT()

ENT.Dinged = true

function ENT:Initialize()
	self:SetRenderBounds(Vector(-72, -72, -72), Vector(72, 72, 128))
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
end

local vOffset = Vector(24, 0, 0)
local vOffset2 = Vector(-6, 0, 0)
local aOffset = Angle(0, 90, 90)


function ENT:Think()
	if MySelf:IsValid() and MySelf:Team() == TEAM_HUMAN then
		local nextuse = MySelf.NextFridgeUse or 0
		if self.Dinged then
			if CurTime() < nextuse then
				self.Dinged = false
			end
		elseif CurTime() >= nextuse then
			self.Dinged = true

			self:EmitSound("zombiesurvival/ding.ogg")
		end
	end

	self:NextThink(CurTime() + 0.5)
	return true
end

function ENT:RenderInfo(pos, ang, owner)
	cam.Start3D2D(pos, ang, 0.055)
		draw.SimpleText(translate.Get("fridge"), "ZS3D2DFont2", 0, -130, (MySelf.NextFridgeUse or 0) <= CurTime() and COLOR_GREEN or COLOR_DARKRED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		local caches = (MySelf.FridgeCaches or 0)

		local timeremain = math.ceil(math.max(0, (MySelf.NextFridgeUse or 0) - CurTime()))
		if MySelf.NextFridgeUse then
			draw.SimpleText(timeremain > 0 and timeremain or translate.Get("ready"), "ZS3D2DFont2", 0, -60, (MySelf.NextFridgeUse or 0) <= CurTime() and COLOR_GREEN or COLOR_DARKRED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
		draw.SimpleText(caches .. (translate.Get("uleft")), "ZS3D2DFont2Small", 0, 0, caches > 0 and COLOR_GREEN or COLOR_DARKRED, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

		self:Draw3DHealthBar(math.Clamp(self:GetObjectHealth() / self:GetMaxObjectHealth(), 0, 1), nil, 190)

		if owner:IsValid() and owner:IsPlayer() then
			draw.SimpleText("("..owner:ClippedName()..")", "ZS3D2DFont2Small", 0, 30, owner == MySelf and COLOR_LBLUE or COLOR_GRAY, TEXT_ALIGN_CENTER)
		end
	cam.End3D2D()
end

function ENT:Draw()
	self:DrawModel()

	if not MySelf:IsValid() or MySelf:Team() ~= TEAM_HUMAN then return end

	local owner = self:GetObjectOwner()
	local ang = self:LocalToWorldAngles(aOffset)

	self:RenderInfo(self:LocalToWorld(vOffset), ang, owner)
end

net.Receive("zs_nextfridgeuse", function(length)
	MySelf.NextFridgeUse = net.ReadFloat()
end)

net.Receive("zs_fridgecaches", function(length)
	MySelf.FridgeCaches = net.ReadInt(12)
	if net.ReadBool() and MySelf.FridgeCaches then
		GAMEMODE:CenterNotify({killicon = "weapon_zs_resupplybox"},Color(0,(150 * MySelf.FridgeCaches)%255,(25* MySelf.FridgeCaches)%255),translate.Format("caches_f_x_ready", MySelf.FridgeCaches),{killicon = "weapon_zs_resupplybox"})
	end
end)
