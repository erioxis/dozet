INC_SERVER()


ENT.CleanupPriority = 1
ENT.NextThinkA = 0
function ENT:Initialize()
	self.ObjHealth = 200
	self.Forced = self.Forced or false
	self.NeverRemove = self.NeverRemove or false
	self.NextThinkA = 0
	self:SetModel("models/props_c17/oildrum001.mdl")

	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:SetColor(Color(180,120,17))

	self:SetUseType(SIMPLE_USE)

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("material")
		phys:EnableMotion(not self.Restrained)
		phys:SetMass(145)
		phys:Wake()
	end

end
function ENT:Think()
	if self.NextThinkA > CurTime() then return end
	local own = self:GetOwner()
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 148)) do

		if ent and "prop_databox_mega" == ent:GetClass() and own:IsValidLivingHuman() then
			own:AddZSXP(5 + 0.55 * own:GetZSLevel() + 3*(self.SpawnedOnWave or 1))
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			own:AddPoints(3)
			if math.random(1,3) == 1 then
				self:Remove()
				own:AddZSXP(300 + 5 * own:GetZSLevel()+ 10*(self.SpawnedOnWave or 1))
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
				ent.BarrelDestroyed = 	ent.BarrelDestroyed + 1
				ent:OnBarrelDestroyed()
			end
		elseif ent and "prop_obj_sigil" == ent:GetClass() and own:IsValidLivingHuman() then
			own:AddZSXP(5 + 0.43 * own:GetZSLevel() + 2*(self.SpawnedOnWave or 1))
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			if math.random(1,10) == 1 then
				self:Remove()
				if math.random(1,20-math.min(16,math.Round(GAMEMODE:GetBalance()/5))) == 1 then
					own:TakeSpecialDamage(own:Health()*0.33,DMG_DIRECT,self,self)
					own:SendLua("GAMEMODE:CenterNotify(COLOR_RED, translate.Format('trap_barrel',20-math.min(4,math.Round(GAMEMODE:GetBalance()/5))))")
					return
				end
				own:AddZSXP(200 + 5 * own:GetZSLevel()+ 8*(self.SpawnedOnWave or 1))
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
			end
		end
	end
	self.NextThinkA = CurTime() + 1.2
end