AddCSLuaFile()

SWEP.PrintName = "Butcher Knife"
SWEP.Description = "A very fast swinging butcher knife, capable of mincing zombies very quickly up close."

if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_lab/cleaver.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, -1), angle = Angle(90, 0, 0), size = Vector(0.8, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_lab/cleaver.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1, -3.182), angle = Angle(90, 0, 0), size = Vector(0.8, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	function SWEP:PostDrawViewModel(vm, pl, wep)
		local veles = self.VElements
		local tbl = {}
		for k,v in pairs(self.VElements) do
			if k == "base" then
				local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,0)
				veles[k].color = clr
			end
		end
		if self:GetClip() - 0.2 <= CurTime() then
			for k,v in pairs(self.VElements) do
				if k == "base"  then
					local clr = Color(veles[k].color.r,veles[k].color.g,veles[k].color.b,255)
					veles[k].color = clr
				end
			end
		end
	end
end
SWEP.UsedNewWeapons = true 
if !SWEP.UsedNewWeapons then
	SWEP.Base = "weapon_zs_basemelee"
	DEFINE_BASECLASS("weapon_zs_basemelee")
	SWEP.MeleeDamage = 45
else
	SWEP.Base = "weapon_zs_basemelee_modified"
	DEFINE_BASECLASS("weapon_zs_basemelee_modified")
	SWEP.MeleeDamage = 15
	SWEP.OverPosition =  Vector(0,0,3)
	SWEP.Additionalism =  Vector(-1,-2,-3)
	SWEP.Attacks_Per_Swung = 3
end
<<<<<<< Updated upstream

SWEP.Base = "weapon_zs_basemelee"

=======
>>>>>>> Stashed changes
SWEP.DamageType = DMG_SLASH

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true
SWEP.NoDroppedWorldModel = true
--[[SWEP.BoxPhysicsMax = Vector(8, 1, 4)
SWEP.BoxPhysicsMin = Vector(-8, -1, -4)]]
<<<<<<< Updated upstream

SWEP.MeleeDamage = 31
SWEP.MeleeRange = 44
SWEP.MeleeSize = 0.566
SWEP.Primary.Delay = 0.5

=======
SWEP.MeleeRange = 49
SWEP.MeleeSize = 0.666
SWEP.Primary.Delay = 0.46 
>>>>>>> Stashed changes
SWEP.WalkSpeed = SPEED_FAST

SWEP.UseMelee1 = true

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.MissGesture = SWEP.HitGesture

SWEP.HitDecal = "Manhackcut"
SWEP.HitAnim = ACT_VM_MISSCENTER

SWEP.Tier = 2

SWEP.AllowQualityWeapons = true
SWEP.Culinary = true
SWEP.NextKick = 0

<<<<<<< Updated upstream
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.06)
=======
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.04)
function SWEP:GetClip()
	return self:GetNWFloat(3)
end
function SWEP:SetClip(d)
	self:SetNWFloat(3, d)
end
function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() then return false end 
	if self:GetClip() >= CurTime() then return false end
	return self:GetNextPrimaryFire() <= CurTime() and not self:IsSwinging()
end
>>>>>>> Stashed changes

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav", 72, math.Rand(85, 95))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/knife/knife_hitwall1.wav", 72, math.Rand(75, 85))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_squishy_impact_hard"..math.random(4)..".wav")
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	--[[if hitent:IsValid() and hitent:IsPlayer() and hitent:Health() <= 0 then
		-- Dismember closest limb to tr.HitPos
	end]]
end
<<<<<<< Updated upstream

=======
function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if self.NextKick <= CurTime() and self:GetOwner():IsSkillActive(SKILL_RESNYA1) then
		local tr = self:GetOwner():CompensatedMeleeTrace(1222, 1)
		if owner:IsSkillActive(SKILL_CURSE_OF_MISS) and math.random(1,2) == 1 and SERVER then
			GAMEMODE:BlockFloater(owner, NULL, tr.HitPos, 1)
			self:SetPowerCombo(0)
			self.BaseClass.SecondaryAttack(self)
			return
		end
		 
		self:SetClip(CurTime() + 1.5)
		self:PrimaryAttack()
		self.NextKick = CurTime() + 2
		self:PlayHitSound()
		if tr.Entity then
			local ent =tr.Entity 
			if ent:IsPlayer() and ent:IsValidLivingZombie() then
				self.IsMelee = false
				if SERVER then
					ent:AddBleedDamage(self.MeleeDamage * 1.24, self:GetOwner())
					ent:TakeDamage(self.MeleeDamage*0.8,self:GetOwner(),self)
				else
					self:PlayHitFleshSound()
				end
				self.IsMelee = true
			end
		end
		return
	end
	self.BaseClass.SecondaryAttack(self)
end
>>>>>>> Stashed changes
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= 90 then
		self.m_BackStabbing = true
		self.MeleeDamage = self.MeleeDamage * 3
	end
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.MeleeDamage / 3
	end
end

