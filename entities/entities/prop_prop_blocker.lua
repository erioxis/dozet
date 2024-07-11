AddCSLuaFile()

ENT.Type = "anim"

ENT.IgnoreMelee = true
ENT.IgnoreBullets = true
ENT.IgnoreTraces = true
ENT.Sigil = true

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetNoDraw(true)


	self:SetCustomCollisionCheck(true)
	self:CollisionRulesChanged()
	--self:SetCollisionGroup(COLLISION_GROUP_DEBRIS)

	if SERVER then
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end
	end
end

function ENT:ShouldNotCollide(ent)
	return true
end
