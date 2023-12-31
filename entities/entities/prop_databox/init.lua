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
	local basemul = (self.SpawnedOnWave or 1)
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 148)) do

		
		if ent and "prop_databox_mega" == ent:GetClass() and own:IsValidLivingHuman() then
			own:AddZSXP(5 + 0.55 * own:GetZSLevel() + 3*basemul)
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			own:AddPoints(3)
			if math.random(1,3) == 1 then
				self:Remove()
				own:AddZSXP(300 + 5 * own:GetZSLevel()+ 10*basemul)
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
				ent.BarrelDestroyed = 	ent.BarrelDestroyed + 1
				ent:OnBarrelDestroyed()
			end
		elseif ent and "prop_obj_sigil" == ent:GetClass() and own:IsValidLivingHuman() then
			own:AddZSXP(5 + 0.43 * own:GetZSLevel() + 2*basemul)
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			if math.random(1,10) == 1 then
				self:Remove()
				if !own:HasTrinket("driller_q5") and math.random(1,20*(own:HasTrinket("driller_q3") and 1.5 or own:HasTrinket("driller_q4") and 2.2 or 1)-math.min(16,math.Round(GAMEMODE:GetBalance()/5))) == 1 then
					own:TakeSpecialDamage(own:Health()*0.33,DMG_DIRECT,self,self)
					own:SendLua("GAMEMODE:CenterNotify(COLOR_RED, translate.Format('trap_barrel',20-math.min(4,math.Round(GAMEMODE:GetBalance()/5))))")
					return
				end
				own:AddZSXP(200 + 5 * own:GetZSLevel()+ 8*basemul)
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
			end
		elseif ent and "prop_obj_anti_sigil" == ent:GetClass() and own:IsValidLivingHuman() then
			local ef = EffectData()
			ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			if math.random(1,4) == 1 then
				self:Remove()
				if !own:HasTrinket("driller_q5") and math.random(1,4) == 1 then
					own:TakeSpecialDamage(own:Health()*0.33,DMG_DIRECT,self,self)
					own:SendLua("GAMEMODE:CenterNotify(COLOR_RED, translate.Format('trap_barrel',4))")
					return
				end
				local ef = EffectData()
				ef:SetOrigin(self:LocalToWorld(Vector(0,0,25)))
				ef:SetAttachment(2)
				util.Effect("explosion_golden",ef)
				own:GiveAchievementProgress("dataminer",1)
				ent.GiveNextSoul = (ent.GiveNextSoul or 0) + 1
				if ent.GiveNextSoul > 2 then
					ent.GiveNextSoul = 0 
					local drop = "cons_soul_picka"
					local pos = self:LocalToWorld(self:OBBCenter())
					local soul = ents.Create("prop_invitem")
					if soul:IsValid() then
						soul:SetPos(pos)
						soul:SetAngles(AngleRand())
						soul:SetInventoryItemType(drop)
						soul:SetOwner(own)
						soul:Spawn()
						local phys = soul:GetPhysicsObject()
						if phys:IsValid() then
							phys:Wake()
							phys:SetVelocityInstantaneous(VectorRand():GetNormalized() * math.Rand(24, 100))
							phys:AddAngleVelocity(VectorRand() * 200)
						end
					end
				end
			end
		end
	end
	self.NextThinkA = CurTime() + 0.8 /(own.DrillPowerBarrel or 1)
end