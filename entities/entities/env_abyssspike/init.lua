INC_SERVER()

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetModel("models/props_wasteland/rockcliff06i.mdl")
	self:PhysicsInit(SOLID_NONE)

	self:Explode()

	self:Fire("kill", "", 1)
end

function ENT:Explode()
	local pos = self:GetPos()
	local owner = self:GetOwner()
	local rad = 105
	for _, ent in pairs(util.BlastAlloc(self, owner, pos + Vector(0, 0, 25), rad)) do
		if ent:IsValidLivingZombie() then
			ent:GiveStatus( "rockflesh", 0.2, owner )
			ent:GiveStatus( "dimvision_unknown", 2.4, owner )
			ent:TakeSpecialDamage( 125, DMG_SHOCK, owner, owner, pos )
		end
	end
end
