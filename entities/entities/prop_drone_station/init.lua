INC_SERVER()
local function RefreshRemantlerOwners(pl)
	for _, ent in pairs(ents.FindByClass("prop_drone_station")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:SetObjectOwner(NULL)
		end
	end
end
hook.Add("PlayerDisconnected", "DroneStation.PlayerDisconnected", RefreshRemantlerOwners)
hook.Add("OnPlayerChangedTeam", "DroneStation.OnPlayerChangedTeam", RefreshRemantlerOwners)

function ENT:Initialize()
	self.Contents = {}
	self.NextUse = {}

	self:SetModel("models/props_lab/powerbox01a.mdl")
	self:SetUseType(SIMPLE_USE)
	
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_PROJECTILE)
	self:SetCustomCollisionCheck(true)

	self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end

	self:CollisionRulesChanged()

	self:SetMaxObjectHealth(200)
	self:SetObjectHealth(self:GetMaxObjectHealth())
end

function ENT:SetObjectHealth(health)
	self:SetDTFloat(0, health)
	if health <= 0 and not self.Destroyed then
		self.Destroyed = true
		local ent = ents.Create("prop_physics")
		if ent:IsValid() then
			ent:SetModel(self:GetModel())
			ent:SetMaterial(self:GetMaterial())
			ent:SetAngles(self:GetAngles())
			ent:SetPos(self:GetPos())
			ent:SetSkin(self:GetSkin() or 0)
			ent:SetColor(self:GetColor())
			ent:Spawn()
			ent:Fire("break", "", 0)
			ent:Fire("kill", "", 0.1)
		end

		local pos = self:LocalToWorld(self:OBBCenter())

		local effectdata = EffectData()
			effectdata:SetOrigin(pos)
		util.Effect("Explosion", effectdata, true, true)
	end
end

function ENT:OnTakeDamage(dmginfo)
	self:TakePhysicsDamage(dmginfo)

	local attacker = dmginfo:GetAttacker()
	if not (attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		self:SetObjectHealth(self:GetObjectHealth() - dmginfo:GetDamage())
		self:ResetLastBarricadeAttacker(attacker, dmginfo)
	end
end

function ENT:AltUse(activator, tr)
	self:PackUp(activator)
end

function ENT:OnPackedUp(pl)
	pl:GiveEmptyWeapon("weapon_zs_drone_station")
	pl:GiveAmmo(1, "drone_s")

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth(), self:GetScraps())

	self:Remove()
end
ENT.NextUseTrinket  = 0

local function OnIn(self,new,rem)
	--print(self.TrinketsIn[new], new)
	if new == "trinket_defensive_module" then
		self:SetMaxObjectHealth(self:GetMaxObjectHealth()+50)
	elseif new == "trinket_module_resnya" then
		self:SetDTInt(12,math.min(5,self.TrinketsIn[new]))
	elseif new == "trinket_module_bounty" then
		self.CanUseModifiers = true
	elseif new == "trinket_module_handler" then
		self._OldAcc = self._OldAcc or self.Acceleration
		self.Acceleration = self._OldAcc  * (1 + 0.05 * math.min(10,self.TrinketsIn[new]))
	elseif new == "trinket_module_extreme" then
		self.AmmoUsagesStacks = math.min(3,self.TrinketsIn[new])
	elseif new == "trinket_module_nanite" then
		self.Nanites = self.TrinketsIn[new]
	end
	self._OnRemove = self._OnRemove or self.OnRemove
	self.OnRemove = function()
		for k,v in pairs(self.TrinketsIn) do
			for i=1,v do
				local ent = ents.Create("prop_invitem")
				if ent:IsValid() then
					ent:SetInventoryItemType(k)
					ent:Spawn()
					ent:SetPos(self:GetPos())
					ent:SetOwner(self:GetOwner())
					ent.DroppedTime = CurTime()
				end
			end
		end
		self:_OnRemove()
	end
	if !self.Think2 then
		self.Think2 = self.Think
		self.NextResnyaaa = CurTime() + 2
		self.NextAmmoGive = 0
		self.NextRepairSelf = 0
		self.Think = function(bruh)
			local intd = self:GetDTInt(12)
			local inte	= self.AmmoUsagesStacks
			local intnanite = self.Nanites
			local owner = self:GetObjectOwner()
			if self.NextResnyaaa < CurTime() and intd > 0 then
				for k,v in pairs(ents.FindInBoxRadius(self:GetPos(),128)) do
					if v:IsValidLivingZombie() then
						v:TakeDamage(70*intd,owner,self)
						self:EmitSound("physics/metal/sawblade_stick3.wav", 70, 250)
					end
				end
				self.NextResnyaaa = CurTime() + 1
			end
			if inte and inte > 0 and self.NextAmmoGive < CurTime() and owner:GetAmmoCount(self.AmmoType) > 1*inte then
				local ammotype = self.AmmoType
				local curammo = self:GetAmmo()
			
				local togive = math.min(3+1*inte, owner:GetAmmoCount(ammotype), self.MaxAmmo - curammo)
				if togive > 0 then
					self:SetAmmo(curammo + togive)
					owner:RemoveAmmo(togive, ammotype)
				end
				self.NextGiveAmmo = CurTime() + 1-0.25*inte
			end
			if intnanite and intnanite > 0 and self.NextRepairSelf < CurTime() then
				self:SetObjectHealth(math.min(self:GetMaxObjectHealth(),self:GetObjectHealth() + 3*intnanite))
				self.NextRepairSelf = CurTime() + 2
			end
			bruh:Think2()
		end
	end
end
local drones = {['prop_drone_hauler'] = true ,['prop_drone']  = true  ,['prop_drone_healer']  = true ,['prop_drone_pulse']  = true }
function ENT:Think()
	if self.Destroyed then
		self:Remove()
	end
	if self.NextUseTrinket > CurTime() then return end
	for k,v in pairs(ents.FindInBoxRadius(self:GetPos(),128)) do
	
		local drone = self:GetDTEntity(11)
		if drones[v:GetClass()] and v:GetParent() ~= self and  !drone:IsValid()  then
			v:SetParent(self)
			v.TrinketsIn = v.TrinketsIn or {}
			v.OnUpdateTrinkets = OnIn
			v:SetPos(self:GetForward()*30+Vector(0,0,12))
			self:SetDTEntity(11, v)
			
		end
	end
end

function ENT:Use(activator, caller)
	if activator:Team() ~= TEAM_HUMAN or not activator:Alive() then return end

	local uid = activator:UniqueID()
	if self.NextUse[uid] and CurTime() < self.NextUse[uid] then return end
	self.NextUse[uid] = CurTime() + 0.75

	local owner = self:GetObjectOwner()
	if not owner:IsValid() then
		self:SetObjectOwner(activator)
		self:GetObjectOwner():SendDeployableClaimedMessage(self)
		return
	end
	if !self:GetDTEntity(11):IsValid() then return end
	if activator == owner and self:GetScraps() > 0 then
		local amount = self:GetScraps()
		self:SetScraps(0)

		net.Start("zs_ammopickup")
			net.WriteUInt(amount, 16)
			net.WriteString("scrap")
		net.Send(activator)

		activator:GiveAmmo(amount, "scrap")

		self.NextUse[uid] = CurTime() + 0.05
		return
	end
	activator:SendLua("GAMEMODE:OpenDroneMenu(MySelf:NearestDS())")
end

