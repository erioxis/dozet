INC_SERVER()

local function RefreshRemantlerOwners(pl)
	for _, ent in pairs(ents.FindByClass("prop_remantler")) do
		if ent:IsValid() and ent:GetObjectOwner() == pl then
			ent:SetObjectOwner(NULL)
		end
	end
end
hook.Add("PlayerDisconnected", "Remantler.PlayerDisconnected", RefreshRemantlerOwners)
hook.Add("OnPlayerChangedTeam", "Remantler.OnPlayerChangedTeam", RefreshRemantlerOwners)

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

		if self:GetObjectOwner():IsValidLivingHuman() then
			self:GetObjectOwner():SendDeployableLostMessage(self)
		end
		if self:GetObjectOwner():IsSkillActive(SKILL_EXPLOIT) and math.random(1,4) == 1 then
			if math.random(1,3) ~= 1 then
				self:GetObjectOwner():Give("weapon_zs_remantler")
			else
				self:GetObjectOwner():Give("weapon_zs_resupplybox")
			end
		end
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
	pl:GiveEmptyWeapon("weapon_zs_remantler")
	pl:GiveAmmo(1, "remantler")

	pl:PushPackedItem(self:GetClass(), self:GetObjectHealth(), self:GetScraps())

	self:Remove()
end

function ENT:Think()
	if self.Destroyed then
		self:Remove()
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

	local currentwep = activator:GetActiveWeapon()
	local currentwepclass = currentwep:GetClass()
	local heldtbl = weapons.Get(currentwepclass)

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
	
	if activator:KeyDown(IN_SPEED) then 
		local s2 = string.sub(currentwepclass,#currentwepclass,#currentwepclass)
		local str = tonumber(s2)
		for i=1,((isnumber(str) or str == nil) and activator:KeyDown(IN_DUCK) and 5-(str==nil and 0 or str) or 1) do 
			activator:SendLua("RunConsoleCommand('zs_upgrade')")
		end 
		return 
	end
	if (heldtbl.AllowQualityWeapons or heldtbl.PermitDismantle) then
		activator:SendLua("surface.PlaySound(\"ambient/misc/shutter1.wav\")")
	end
	activator:SendLua("GAMEMODE:OpenRemantlerMenu(MySelf:NearestRemantler())")
end

