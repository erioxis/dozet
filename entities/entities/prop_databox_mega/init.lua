INC_SERVER()


ENT.CleanupPriority = 1
ENT.NextThinkA = 0
ENT.BarrelDestroyed = 0
function ENT:Initialize()
	self.ObjHealth = 200
	self.Forced = self.Forced or false
	self.NeverRemove = self.NeverRemove or false
	self.Restrained = self.Restrained or false
	self.NextThinkA = 0
	self:SetModel("models/props_c17/oildrum001.mdl")
	self:SetModelScale(3.5)

	self:PhysicsInit(SOLID_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetColor(Color(17,180,120))
	timer.Simple(2,function()
		local wepf_c = {}
		for _, wep in pairs(weapons.GetList()) do
			if (wep.Tier or 1) == math.Round(math.Clamp(GAMEMODE:GetWave()/2,1,6)) and !wep.ZombieOnly and !wep.NoMobilized and wep.Primary.DefaultClip and wep.Primary.DefaultClip < 9999 then
				table.insert( wepf_c, wep.ClassName )
			end
		end
		self.Weps = wepf_c
		
	end)

	--local phys = self:GetPhysicsObject()
	--if phys:IsValid() then
		--phys:SetMaterial("material")
		--phys:EnableMotion(false)
		--phys:SetMass(45)
	--	phys:Wake()
	--end

end
function ENT:OnBarrelDestroyed()
	if self.BarrelDestroyed > 4 then
	--	self.BarrelDestroyed  = -99
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:SetMaterial("material")
		phys:EnableMotion(true)
		phys:SetMass(4445)
		phys:Wake()
	end
	local world = self:LocalToWorld(Vector(0,0,25))
		timer.Create("bochka_giga_think", 0.6, 6, function() 
			local ef = EffectData()
			ef:SetOrigin(world)
			ef:SetAttachment(1)
			util.Effect("explosion_golden",ef)
			local wep = ents.Create("prop_weapon")
			if wep:IsValid() then
				wep:SetWeaponType(self.Weps[math.random(1,#self.Weps)])
				wep.NoLootsForTop = true
				wep:SetPos(self:GetPos())
				wep:Spawn()
				local phys = wep:GetPhysicsObject()
				if phys then
					phys:SetVelocityInstantaneous(Angle(math.Rand(-360, -70), math.Rand(0, 360), 0):Forward() * 800 )
				end
			end
		end)
		self:SetModelScale(0,3.9)
		timer.Create("bochka_giga_destroy", 3.9, 1, function() 
			self:Remove()
		end)
	end
end