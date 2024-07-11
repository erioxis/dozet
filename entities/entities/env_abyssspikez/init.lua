INC_SERVER()

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetModel("models/props_wasteland/rockcliff06d.mdl")
	self:PhysicsInit(SOLID_NONE)

	self:Explode()

	self:Fire("kill", "", 1)
end

function ENT:Explode()
	local pos = self:GetPos()
	local owner = self:GetOwner()
	local rad = 55

	for _, ent in pairs(util.BlastAlloc(self, owner, pos + Vector(0, 0, rad), rad)) do
		if ent:IsValidLivingHuman() then
			ent:GiveStatus( "rockflesh", 2.8, owner )
			ent:GiveStatus( "dimvision_unknown", 2.8, owner )
			ent:TakeSpecialDamage( math.random( 3, 5 ), DMG_SHOCK, owner, owner, pos )
		elseif not ent:IsValidLivingZombie() then
			ent:TakeSpecialDamage( math.random( 8, 14 ), SLOWTYPE_COLD, owner, self, pos )
		elseif ent:IsValidLivingZombie() then
			owner:AddTokens( 3 )
			ent:GiveStatus( "zomdefence", 7, owner )
		end
	end
end

