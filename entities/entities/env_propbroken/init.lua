INC_SERVER()

ENT.DieTime = 0

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetSolid(SOLID_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetModelScale(1.03, 0)

	self.DieTime = CurTime() + 10
end

function ENT:AttachTo(ent)
	if IsValid(ent) and ent:GetModel() ~= "models/error.mdl" then
		self:SetModel(ent:GetModel())
		self:SetSkin(ent:GetSkin() or 0)
		self:SetPos(ent:GetPos())
		self:SetAngles(ent:GetAngles())
		self:SetAlpha(ent:GetAlpha())
		self:SetOwner(ent)
		self:SetParent(ent)
		ent._BARRICADEBROKEN = self
		self.NoCollideProp = true
	else
		self:Fire("kill", "", 1)
	end
end
local function BackwardsEnums( enumname ) -- Helper function to build our table of values.
	local backenums = {}

	for k, v in pairs( _G ) do
		if isstring(k) and string.find( k, "^" .. enumname ) then
			backenums[ v ] = k
		end
	end

	return backenums
end

local MAT = BackwardsEnums( "MAT_" )

function ENT:Think()
	if CurTime() >= self.DieTime and not self.Broken then
		self.Broken = true

		local ent = self:GetParent()
		if ent:IsValid() then
			if ent:GetPhysicsObject():IsValid() then
				ent:GetPhysicsObject():EnableMotion(false)
			end
			ent:Fire("break", "", 15)
			ent:Fire("kill", "", 15.1)

			local effectdata = EffectData()
				effectdata:SetOrigin(ent:WorldSpaceCenter())
			util.Effect("Explosion", effectdata)
		end

		self:Remove()
	end
--	print(MAT[self:GetParent():GetMaterialType()] )

end
--[[
				local ent = ents.Create("env_propbroken")
				if ent:IsValid() then
					ent:Spawn()
					ent:AttachTo(table.Random(ents.FindByClass("prop_physics")))
				end

]]
function ENT:OnRemove()
	if MAT[self:GetParent():GetMaterialType()] == "MAT_METAL" then
		local g = ents.Create("prop_ammo")
		g:SetPos(self:GetPos())
		g:Spawn()
		g:SetAmmoType("scrap")
		g:SetAmmo(math.random(1,25))
	end
end
