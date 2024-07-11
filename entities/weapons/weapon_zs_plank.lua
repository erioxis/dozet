AddCSLuaFile()

SWEP.PrintName = translate.Get("wep_plank")


if CLIENT then
	SWEP.ViewModelFOV = 55
	SWEP.ViewModelFlip = false

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base"] = { type = "Model", model = "models/props_debris/wood_chunk03a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.363, 1.363, -11.365), angle = Angle(180, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	SWEP.WElements = {
		["base"] = { type = "Model", model = "models/props_debris/wood_chunk03a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(2.273, 1.363, -12.273), angle = Angle(180, 90, 0), size = Vector(0.5, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/props_debris/wood_chunk03a.mdl"
SWEP.ModelScale = 0.7
SWEP.UseHands = true
SWEP.BoxPhysicsMin = Vector(-0.5764, -2.397225, -20.080572) * SWEP.ModelScale
SWEP.BoxPhysicsMax = Vector(0.70365, 2.501825, 19.973375) * SWEP.ModelScale

SWEP.MeleeDamage = 16
SWEP.MeleeRange = 64
SWEP.MeleeSize = 2
SWEP.Primary.Delay = 0.28

SWEP.WalkSpeed = SPEED_FASTER

SWEP.UseMelee1 = true

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.MissGesture = SWEP.HitGesture

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 0.4)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/knife/knife_slash"..math.random(2)..".wav")
end

function SWEP:PlayHitSound()
	self:EmitSound("physics/wood/wood_plank_impact_hard"..math.random(5)..".wav")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_impact_bullet"..math.random(5)..".wav")
end

function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() then
		local combo = self:GetDTInt(2)
		local owner = self:GetOwner()
		local armdelay = owner:GetMeleeSpeedMul()
		self:SetNextPrimaryFire(CurTime() + math.max(0.2, self.Primary.Delay * (1 - combo / 20)) * armdelay)

		self:SetDTInt(2, combo + 1)
	end
end

function SWEP:PostOnMeleeMiss(tr)
	self:SetDTInt(2, 0)
end

GAMEMODE:AddNewRemantleBranch(SWEP, 1, translate.Get("wep_plank_r1"), translate.Get("wep_plank_d_r1"), function(wept)
	wept.MeleeDamage = wept.MeleeDamage * 0.8
	wept.BleedDamage = wept.MeleeDamage * 2
	wept.PlayerHitUtil = function(self, owner, damage, hitent, dmginfo)
		hitent:MeleeViewPunch(damage*0.1)
		local bleed = hitent:GetStatus("bleed")
		if SERVER then
			hitent:GiveAchievement("bleedmode")
		end
		if bleed and bleed:IsValid() then
			bleed:AddDamage(wept.BleedDamage*.65)
			bleed.Damager = owner
		else
			local stat = hitent:GiveStatus("bleed")
			if stat and stat:IsValid() then
				stat:SetDamage(wept.BleedDamage)
				stat.Damager = owner
			end
		end
	end
	wept.OnMeleeHit = function(self, hitent, hitflesh, tr)
		if self:GetOwner():GetBleedDamage() > 1 then
			self.MeleeDamage = wept.MeleeDamage * 1.5
		end
	end

	wept.PostOnMeleeHit = function(self, hitent, hitflesh, tr)
		if hitent:IsValid() and hitent:IsPlayer() then
			local combo = self:GetDTInt(2)
			local owner = self:GetOwner()
			local armdelay = owner:GetMeleeSpeedMul()
			self:SetNextPrimaryFire(CurTime() + math.max(0.2, self.Primary.Delay * (1 - combo / 20)) * armdelay)
	
			self:SetDTInt(2, combo + 1)
		end
		self.MeleeDamage = wept.MeleeDamage
	end

end)