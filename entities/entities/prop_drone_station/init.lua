INC_SERVER()
local function RefreshRemantlerOwners(pl)
	for _, ent in ipairs(ents.FindByClass("prop_drone_station")) do
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
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetUseType(SIMPLE_USE)

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
	end

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

	local drone = self:GetDTEntity(11)
	if drone:IsValid() then
		
		self.NextUseTrinket = CurTime() + 7
		if drone:GetPhysicsObject() then
			drone:GetPhysicsObject():Wake()
		end
		self:SetDTEntity(11,NULL)
		drone:SetPos(drone:GetObjectOwner():GetPos()+Vector(0,0,6))
	end

	timer.Simple(0, function() self:Remove() end)
end
ENT.NextUseTrinket  = 0

local function OnIn(self,new,rem)
	local tab = GAMEMODE.ZSInventoryItemData[new]
	if tab.FunctionOnConnect then
		tab.FunctionOnConnect(self, new, rem)
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
					ent:SetOwner(self:GetObjectOwner())
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
			self:Think2()
		end
	end
end
local drones = {['prop_drone_hauler'] = true ,['prop_drone']  = true  ,['prop_drone_healer']  = true ,['prop_drone_pulse']  = true,['prop_manhack']  = true,['prop_manhack_saw']  = true}
function ENT:Think()
	if self.Destroyed then
		self:Remove()
	end
	if self.NextUseTrinket > CurTime() then return end
	for k,v in pairs(ents.FindInBoxRadius(self:GetPos(),128)) do
	
		local drone = self:GetDTEntity(11)
		if drones[v:GetClass()] and v:GetParent() ~= self and  !drone:IsValid()  then
			if v:GetPhysicsObject() then
				v:GetPhysicsObject():Sleep()
			end
			v.TrinketsIn = v.TrinketsIn or {}
			v.OnUpdateTrinkets = OnIn
			if v:GetClass() == "prop_manhack" or v:GetClass() == "prop_manhack_saw" then
				v:SetPos(self:GetPos() + self:GetForward()*45+Vector(0,0,26))
			else
				v:SetPos(self:GetPos() + self:GetForward()*30+Vector(0,0,12))
			end
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
	local drone = self:GetDTEntity(11)
	if !drone:IsValid() then return end
	if activator == self:GetDTEntity(11):GetObjectOwner() and activator:KeyDown(IN_SPEED) then
		
		self.NextUseTrinket = CurTime() + 7
		if drone:GetPhysicsObject() then
			drone:GetPhysicsObject():Wake()
		end
		self:SetDTEntity(11,NULL)
		drone:SetPos(drone:GetObjectOwner():GetPos()+Vector(0,0,6))
		return
	end
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

