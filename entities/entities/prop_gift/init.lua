INC_SERVER()

ENT.DieTime = 0
ENT.IgnoreEnt = NULL 
ENT.NextIgnoreUse = 0

function ENT:Initialize()
	self.ObjHealth = 625

	if self.DieTime == 0 then
		self.DieTime = CurTime() + 750
	end

	local modelid
	if self.m_GibType then
		modelid = self.m_GibType
	else
		modelid = math.random(#GAMEMODE.HumanGibs)
	end
	self:SetModel("models/Items/item_item_crate.mdl")
	self:SetModelScale(1)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	self:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	self:SetTrigger(true)
	self:SetColor(Color(238, 24, 24))
	GAMEMODE:TopNotify(COLOR_GREEN,{killicon = "weapon_zs_arsenalcrate"},translate.Get("gift_s"))
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
		phys:ApplyForceCenter(VectorRand():GetNormalized() * math.Rand(2000, 5000))
		phys:AddAngleVelocity(VectorRand() * 360)
	end
	for _, ent in pairs(ents.FindInSphere(self:GetPos(), 256)) do
		if ent:IsValidLivingHuman() then
			self.IgnoreEnt = ent
			break
		end
	end
	self.NextIgnoreUse = CurTime() + 5
end

function ENT:SetGibType(id)
	self.m_GibType = math.Clamp(math.ceil(id), 1, #GAMEMODE.HumanGibs)
end

function ENT:KeyValue(key, value)
	key = string.lower(key)
	if key == "gibtype" then
		value = tonumber(value)
		if not value then return end

		self:SetGibType(value)
	elseif key == "lifetime" then
		value = tonumber(value)
		if not value then return end

		if value <= 0 then
			self.DieTime = -1
		else
			self.DieTime = CurTime() + value
		end
	end
end

function ENT:OnTakeDamage(dmginfo)
	if dmginfo:GetDamage() <= 0 or dmginfo:GetAttacker():IsValidLivingHuman() then return end

	self:TakePhysicsDamage(dmginfo)

	self.ObjHealth = self.ObjHealth - dmginfo:GetDamage()
	if self.ObjHealth <= 0 and not self.Destroyed then
		self.Destroyed = true
		self.DieTime = 0
	end
end

function ENT:Think()
	if self.DieTime >= 0 and self.DieTime <= CurTime() then
		self:Remove()
	end
	self:SetColor(Color(238, 24, 24))
end



function ENT:StartTouch(ent)
	if self.IgnoreEnt == ent and self.NextIgnoreUse >= CurTime() then return end
	if self.DieTime ~= 0 and ent:IsValidLivingHuman() then
		self.DieTime = 0
		ent:GiveAchievementProgress("gift_is_good", 1)
		ent:GiveAchievementProgress("gift_collector", 1)
		local gift = math.random(1,7)
		local random = math.random(50,5000)
		if gift == 1 then
			ent:AddZSXP(random)
			gift = "XP"
		elseif gift == 2 then
			random = random/10
			ent:SetPoints(ent:GetPoints() + random)
			gift = "POINTS"
		elseif gift == 3 then
			random = random/7
			ent:SetHealth(ent:Health() + random)
			gift = "HP"
		elseif gift == 4 then
			random = random/10
			ent:GiveStatus("strengthdartboost", random)
			gift = "DAMAGE BUFF"
		elseif gift == 5 then
			random = 1
			local food = GAMEMODE.Food[math.random(#GAMEMODE.Food)]
			ent:Give(food)
			gift = weapons.Get(food).PrintName
		elseif gift == 6 and ent:GetActiveWeapon():GetClass() ~= "weapon_zs_sigil_port" and (ent:GetActiveWeapon().FoodHealth or 0) < 1 then
			random = random/6
			ent:GiveAmmo(random, (ent:GetActiveWeapon() and !ent:GetActiveWeapon().IsMelee and ent:GetActiveWeapon().Primary.Ammo or "scrap"), true)
			local ammotype = (GAMEMODE.AmmoNames[ent:GetActiveWeapon().Primary.Ammo] or !ent:GetActiveWeapon().IsMelee and ent:GetActiveWeapon().Primary.Ammo or ent:GetActiveWeapon().IsMelee and "scrap")
			gift = (translate.ClientGet(ent,string.lower(string.Implode("",string.Explode(" ","ammo_"..ammotype)) or ammotype)))
			net.Start("zs_ammopickup")
				net.WriteUInt(random, 16)
				net.WriteString(ammotype)
			net.Send(ent)
		else
			local weapon = {
				"weapon_zs_plank",
				"weapon_zs_pushbroom",
				"weapon_zs_bulldog",
				"weapon_zs_bulldog_q1",
				"weapon_zs_shovel",
				"weapon_zs_pulserifle",
				"weapon_zs_toxicshooter",
				"weapon_zs_zenith",
				"weapon_zs_zenith_q2",
				"weapon_zs_m4",
				"weapon_zs_pollutor",
				"weapon_zs_sawedoff",
				"weapon_zs_minelayer",
				"weapon_zs_relsous",
				"weapon_zs_quasar",
				"weapon_zs_inferno",
				"weapon_zs_binocle",
				"weapon_zs_keyboard",
				"weapon_zs_icelux",
				"weapon_zs_scythe",
				"weapon_zs_plank_q1",
				"weapon_zs_pushbroom_q1",
				"weapon_zs_shovel_q1",
				"weapon_zs_pulserifle_q1",
				"weapon_zs_toxicshooter_q2",
				"weapon_zs_toxicshooter_r2",
				"weapon_zs_m4_q1",
				"weapon_zs_pollutor_q1",
				"weapon_zs_sawedoff_q1",
				"weapon_zs_minelayer_q1",
				"weapon_zs_relsous_q1",
				"weapon_zs_inferno_q1",
				"weapon_zs_binocle_q1",
				"weapon_zs_keyboard_q1",
				"weapon_zs_baramelee_xmas",
				"weapon_zs_scythe_q1"
			}
			local drop = table.Random(weapon)
			ent:Give(drop)
			gift = weapons.Get(drop).PrintName
			random = 1
		end
		print(string.format("[ZS GIFT] Player %s (%s) earned gift with %s and contained %s!", ent:Name(), ent:SteamID(), gift, random))
		GAMEMODE:TopNotify(COLOR_GREEN,{killicon = "weapon_zs_resupplybox"},translate.ClientFormat(ent,"gift_taken", ent:Name(), gift, random))
		self:EmitSound("buttons/lever"..math.random(1,8)..".wav")
    elseif self.DieTime ~= 0 and ent:IsValidLivingZombie() and !ent:IsBot() and !ent:GetZombieClassTable().AllowTeamDamage then
		self.DieTime = 0
		local random = math.random(50,5000)
		local gift = math.random(1,100)
		if gift <= 75 then
			if math.random(1,2) == 1 then
				ent:AddZSXP(random)
				gift = "XP"
			else
				ent:SetHealth(ent:Health() + random)
				gift = "HP"
			end
		elseif gift >= 85 and gift <= 95 then
			gamemode.Call( "SpawnBossZombie", ent)
			gift = "BOSS"
			random = 1
		elseif gift > 95 and random > 450 and !(ent:GetZombieClassTable().Boss or ent:GetZombieClassTable().DemiBoss) then
			ent:Redeem()
			gift = "REDEEM"
			random = 1
		else
			gamemode.Call( "SpawnDemiBossZombie", ent)
			gift = "DEMI-BOSS"
			random = 1
		end
		print(string.format("[ZS GIFT] Zombie Player %s (%s) earned gift with %s and contained %s!", ent:Name(), ent:SteamID(), gift, random))
		GAMEMODE:TopNotify(COLOR_GREEN,{killicon = "nest"},translate.ClientFormat(ent,"gift_taken", ent:Name(), gift, random))
		self:EmitSound("buttons/lever"..math.random(1,8)..".wav")
	end
end
function ENT:OnRemove()
	GAMEMODE:TopNotify(COLOR_RED,{killicon = "weapon_zs_arsenalcrate"},translate.Get("gift_r"))
end
