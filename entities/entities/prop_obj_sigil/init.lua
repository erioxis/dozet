INC_SERVER()

ENT.HealthLock = 0

function ENT:Initialize()
	self:DrawShadow(false)
	self:SetRenderFX(kRenderFxDistort)

	self:SetModel("models/props_wasteland/medbridge_post01.mdl")
	self:PhysicsInitBox(Vector(-16.285, -16.285, -0.29) * self.ModelScale, Vector(16.285, 16.285, 104.29) * self.ModelScale)
	self:SetUseType(SIMPLE_USE)
	
	
	
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:CollisionRulesChanged()
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:EnableMotion(false)
		end

	self:CollisionRulesChanged()

	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(false)
		phys:Wake()
	end

	self:SetSigilHealthBase(self.MaxHealth)
	self:SetSigilHealthRegen(self.HealthRegen)
	self:SetSigilLastDamaged(0)

	local ent = ents.Create("prop_prop_blocker")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:SetOwner(self)
		--ent:SetParent(self) -- Prevents collisions
		self:DeleteOnRemove(ent)
	end
		local ent = ents.Create("func_arsenalzone")
	if ent:IsValid() then
		ent:SetPos(self:GetPos())
		ent:SetAngles(self:GetAngles())
		ent:Spawn()
		ent:SetOwner(self)
		ent:SetParent(self) -- Prevents collisions
	
	end
end

function ENT:Use(pl)
	if pl.NextSigilTPTry and pl.NextSigilTPTry >= CurTime() then return end

	if pl:Team() == TEAM_HUMAN and pl:Alive() and not self:GetSigilCorrupted() then
		local tpexist = pl:GetStatus("sigilteleport")
		if tpexist and tpexist:IsValid() then return end

		if GAMEMODE:NumUncorruptedSigils() >= 2 then
			local status = pl:GiveStatus("sigilteleport")
			if status:IsValid() then
				status:SetFromSigil(self)
				status:SetEndTime(CurTime() + 1 * (pl.SigilTeleportTimeMul or 1))

				pl.NextSigilTPTry = CurTime() + 2
			end
		end
	end
end
local weapon = {}
for _, wep in pairs(weapons.GetList()) do
	if (wep.Tier or 1) < 6  and !wep.ZombieOnly and !wep.NoMobilized and wep.Primary.DefaultClip and wep.Primary.DefaultClip < 9999 and (wep.Tier or 1) > 3 then
		table.insert( weapon, wep.ClassName )
	end
end
function ENT:OnTakeDamage(dmginfo)
	if self:GetSigilHealth() <= 0 or dmginfo:GetDamage() <= 0 then return end
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	local attacker = dmginfo:GetAttacker()
	if  attacker:IsPlayer() and  (attacker:GetZombieClassTable().BaraCat or attacker:GetZombieClassTable().CanPiz) or dmginfo:GetInflictor() and dmginfo:GetInflictor():GetClass() == "weapon_zs_fistz"  then return end

	if attacker:IsValid() and attacker:IsPlayer() and dmginfo:GetDamage() > 2 and CurTime() >= self.HealthLock then
		if self:CanBeDamagedByTeam(attacker:Team()) then
			if attacker:Team() == TEAM_HUMAN then
				local dmgtype = dmginfo:GetDamageType()
				if bit.band(dmgtype, DMG_SLASH) ~= 0 or bit.band(dmgtype, DMG_CLUB) ~= 0 then
					dmginfo:SetDamage(dmginfo:GetDamage() * 1.6)
				else
					dmginfo:SetDamage(0)
					return
				end
			end
			if attacker.NoLootsFromSigil and  GAMEMODE:GetWave() == 6 then return end

			local oldhealth = self:GetSigilHealth()
			self:SetSigilLastDamaged(CurTime())
			self:SetSigilHealthBase(oldhealth - dmginfo:GetDamage())

			if self:GetSigilHealth() <= 0 then
				if self:GetSigilCorrupted() then
					gamemode.Call("PreOnSigilUncorrupted", self, dmginfo)
					self:SetSigilCorrupted(false)
<<<<<<< Updated upstream
					self:SetSigilHealthBase(self.MaxHealth)
					self:SetSigilLastDamaged(0)
					gamemode.Call("OnSigilUncorrupted", self, dmginfo)
=======
					self:SetSigilLastDamaged(0)
					gamemode.Call("OnSigilUncorrupted", self, dmginfo)
					attacker:GiveAchievementProgress("cleaner", 1)
					if GAMEMODE:GetWave() == 6 and !GAMEMODE:GetWaveActive() and !self.NoMoreLoots  then
						attacker:AddPoints(60)
						local wep = weapon[math.random(1,#weapon)]
						local g = weapons.Get(wep).PrintName
						print(string.format("[ZS SIGIL] Player %s (%s) earned gift of  %s!", attacker:Name(), attacker:SteamID(), g))
						attacker:Give(wep)
						self.NoMoreLoots = true
						attacker.NoLootsFromSigil = true
					end
>>>>>>> Stashed changes
				else
					gamemode.Call("PreOnSigilCorrupted", self, dmginfo)
					self:SetSigilCorrupted(true)
<<<<<<< Updated upstream
					self:SetSigilHealthBase(self.MaxHealth)
=======
>>>>>>> Stashed changes
					self:SetSigilLastDamaged(0)
					gamemode.Call("OnSigilCorrupted", self, dmginfo)
				end
			end
		elseif attacker:Team() == TEAM_UNDEAD then
			self.HealthLock = CurTime() + 1
		end
	end
end

function ENT:UpdateTransmitState()
	return TRANSMIT_ALWAYS
end
<<<<<<< Updated upstream
=======
function ENT:Think()
	for _, ent in pairs(player.FindInSphere(self:GetPos(), math.Clamp(1948 / (GAMEMODE:GetWave() * 0.33),493,1948))) do
		if ent and ent:IsValid() then
			if ent:IsValidLivingHuman() and not self:GetSigilCorrupted() then
				ent:GiveStatus("sigildef", 2)
			elseif ent:IsValidLivingZombie() and self:GetSigilCorrupted() then
				ent:GiveStatus("corruptsigildef", 2)
			end
		end
	end
end
function ENT:OnRemove()
	local efc = EffectData()
	efc:SetOrigin(self:GetPos())
	util.Effect("sigildestruction",efc)
end

>>>>>>> Stashed changes
