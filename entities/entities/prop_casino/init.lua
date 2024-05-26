INC_SERVER()


function ENT:Initialize()
	self.Contents = {}

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

	self:SetDTFloat(22,25)

	self:SetMaxObjectHealth(200)
	self:SetObjectHealth(self:GetMaxObjectHealth())
end
ENT.NextUse = 0

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



function ENT:Think()
	if self.Destroyed then
		self:Remove()
	end
end

function ENT:Use(activator, caller)
	if activator:Team() ~= TEAM_HUMAN or not activator:Alive() then return end
	if activator:KeyDown(IN_SPEED) then
		self:SetDTFloat(22, math.max(25,(self:GetDTFloat(22)+25)%325))
		return
	end
	local beat = self:GetDTFloat(22)
	local ply = activator
	if (ply.NextCasino or 1) >= CurTime() then
		ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_in_s",math.Round((ply.NextCasino or 1)-CurTime()) )
		return
	end
	if ply:GetPoints() <  beat then
		ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_p")
		return
		
	end
	local time = CurTime()
	self.NextUse = time + 6
	self:SetDTEntity(12, activator)
	self:SetDTFloat(12, time)
	local numbers = {}
	for i=1,5 do
		local rand = math.random(1,7)
		numbers[i] = rand
		self:SetDTInt(6+i, rand)
	end
	local full = 5

	local cain = ply:HasTrinket("cainsoul")
	ply.NextCasino = CurTime() + 60 - (cain and 25 or 0)
	timer.Simple(60 - (cain and 25 or 0), function() 
		if ply:IsValid() then
			ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_ready" )
		end
	end)
	local sum = 0
	for k,v in pairs(numbers) do
		sum = sum + v
	end
	local jackpot = false
	
	if (sum) >= full *6  and (sum) ~= 7*full  then
		local togive = beat*(0.11+full)
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",togive,ply:Nick() )
		ply:SetPoints(ply:GetPoints()+togive)
		jackpot = true
	end
	if (sum) >= full * (5 - (cain and 1 or 0)) and sum < full*(5 - (cain and 2 or 0))  then
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",beat*1.1,ply:Nick() )
		ply:SetPoints(ply:GetPoints()+beat*1.1)
		jackpot = true
	end
	if (sum) == 1*full then
		ply:Kill()
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_snake_eye" )
		ply:GiveAchievement("snake_eye")
	end
	if sum == 7*full and full > 2 then
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_gg" )
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",beat*6*(full/3),ply:Nick() )
		ply:SetPoints(ply:GetPoints()+beat*6*(full/3))
		local wepf_c = {}
		for _, wep in pairs(weapons.GetList()) do
			if (wep.Tier or 1) == 7 and !wep.ZombieOnly and !wep.NoMobilized and wep.Primary.DefaultClip and wep.Primary.DefaultClip < 9999 then
				table.insert( wepf_c, wep.ClassName )
			end
		end
		if beat >= 200 then
			ply:Give(table.Random(wepf_c))
		end
		if full == 5 then
			ply:GiveAchievement("luck_of_all")
		end
		ply:GiveAchievement("casino_gg")
		jackpot = true
	end
	ply:SetPoints(ply:GetPoints()-beat)
	PrintTranslatedMessage( HUD_PRINTTALK, "drop_casino",ply:Nick(), numbers[1],numbers[2] or "слота 2 нeту!",numbers[3] or "слота 3 нeту!",numbers[4] or "слота 4 нeту!",numbers[5] or "слота 5 нeту!",beat )
	MsgC( Color( 255, 0, 0 ), ply:Nick().." throw casino" .. beat)
	if math.random(1,20) == 1 then
		PrintTranslatedMessage( HUD_PRINTTALK, "casino_kaboom",ply:Nick() )
		local edata = EffectData()
			edata:SetOrigin(self:GetPos())
			edata:SetNormal(Vector(0,0,5))
		util.Effect("explosion_airboom",edata)
		self:EmitSound(")weapons/explode5.wav", 80, 130)
		self:Remove()
	end
end

