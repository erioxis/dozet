AddCSLuaFile()

--SWEP.PrintName = "Axe"
SWEP.PrintName = translate.Get("wep_m_wind")
SWEP.Description = translate.Get("wep_d_m_wind")

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["bruh"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(12.639, -0.416, -4.85), size = { x = 1, y = 1 }, color = Color(21, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["bruh+"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_Spine4", rel = "", pos = Vector(9.038, -3.201, -5.22), size = { x = 1, y = 1 }, color = Color(140, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["yes1"] = { type = "Model", model = "models/props_c17/gravestone_cross001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.118, 0.86, -3.346), angle = Angle(-177.62399, -138.11301, -2.264), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["ys2"] = { type = "Model", model = "models/props_c17/hospital_railing_160_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.912, -0.255, -2.21), angle = Angle(-86.72, -12.952, 5.312), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	 
	SWEP.WElements = {
		["bruh"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.639, -0.416, -4.85), size = { x = 1, y = 1 }, color = Color(21, 0, 255, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["bruh+"] = { type = "Sprite", sprite = "particles/fire_glow", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(5.142, 8.331, -13.975), size = { x = 1, y = 1 }, color = Color(140, 0, 0, 255), nocull = true, additive = true, vertexalpha = true, vertexcolor = true, ignorez = false},
		["yes1"] = { type = "Model", model = "models/props_c17/gravestone_cross001a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.118, 0.86, -3.346), angle = Angle(-177.62399, -138.11301, -2.264), size = Vector(0.1, 0.1, 0.1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["ys2"] = { type = "Model", model = "models/props_c17/hospital_railing_160_01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.912, -0.255, -2.21), angle = Angle(-86.72, -12.952, 5.312), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemagic"

SWEP.ViewModel = "models/weapons/c_stunstick.mdl"
SWEP.WorldModel = "models/props/cs_militia/axe.mdl"
SWEP.UseHands = true

SWEP.HoldType = "melee2"
SWEP.ArmorRegen = 1

SWEP.Tier = 2
SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.71
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
SWEP.SwingHoldType = "melee"
SWEP.PointsMultiplier = 1
SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = true

function SWEP:EmitFireSound()
	self:EmitSound("ambient/wind/wind_hit"..math.random(1,3)..".wav",nil,150)
end

SWEP.ArmorRegen = 1
SWEP.Primary.ArmorBleed = 50
function SWEP.BulletCallback(attacker, tr)
	local hitent = tr.Entity
	if hitent:IsValidLivingZombie() and  gamemode.Call("PlayerShouldTakeDamage", hitent, attacker) then
		local targetpos = hitent:LocalToWorld(hitent:OBBCenter()) 
		local direction = (targetpos - attacker:GetPos()):GetNormal() 
		hitent:SetLocalVelocity(direction*2100)
	end
end

function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if not owner:IsValid() then return end
	if not owner:IsSkillActive(SKILL_MAGIC) then return end

	if not self:CanPrimaryAttack() then return end

	
	 if owner:GetBloodArmor() > 0 and self.Primary.ArmorBleed <= owner:GetBloodArmor() then
	self:SetNextPrimaryFire(CurTime() + 12)
	self:EmitFireSound()
	if SERVER then
		owner:SetBloodArmor(owner:GetBloodArmor() - self.Primary.ArmorBleed * (owner.MagicDamage or 1) * 10)
		timer.Create("Wind_Mashup",0.1,10, function() self:ShootBullets(self.Primary.Damage + (owner:GetBloodArmor() * 1.6) * (owner.MagicDamage or 1), self.Primary.NumShots, self:GetCone()) end)
	end
	self.IdleAnimation = CurTime() + self:SequenceDuration()
	elseif owner:GetBloodArmor() < self.Primary.ArmorBleed then
		self:SetNextPrimaryFire(CurTime() + self:GetFireDelay())

			self:EmitFireSound()
			self:ShootBullets(math.min(self.Primary.Damage + (owner:GetBloodArmor() * 2.5) * (owner.MagicDamage or 1),1920), self.Primary.NumShots, self:GetCone())
			self.IdleAnimation = CurTime() + self:SequenceDuration()
			if SERVER then
				owner:TakeDamage(self.Primary.ArmorBleed)
			end
		end
	
end
function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	local pos = owner:GetPos()
	if not owner:IsSkillActive(SKILL_MAGIC) then return end
	if self.Primary.ArmorBleed < owner:GetBloodArmor() and IsFirstTimePredicted() then
		for k,v in pairs(ents.FindInBoxRadius(pos,500)) do
			if v:IsValidLivingZombie() then
				local targetpos = v:LocalToWorld(v:OBBCenter()) 
				local direction = (targetpos - pos):GetNormal() 
				v:SetLocalVelocity(direction*(100+owner:GetBloodArmor()*4))
				if SERVER then
					owner:SetBloodArmor(0)
				end
			end
		end
	end
end


