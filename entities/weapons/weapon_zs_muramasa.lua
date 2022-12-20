AddCSLuaFile()


SWEP.HoldType = "melee"
SWEP.ViewModelFOV = 75
SWEP.ViewModelFlip = false
SWEP.ViewModel = "models/weapons/c_crowbar.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.ShowViewModel = false
SWEP.ShowWorldModel = false
SWEP.ViewModelBoneMods = {
	["ValveBiped.Bip01_Spine4"] = { scale = Vector(1, 1, 1), pos = Vector(-6.467, -2.515, 2.515), angle = Angle(0, 0, 0) }
}

SWEP.SCKMaterials = {"cs_assault/concretefloor026a",}

SWEP.IronSightsPos = Vector(0.64, 0, 4.76)
SWEP.IronSightsAng = Vector(0, 0, 0)
qual = math.random(1,6)
if qual == 2 then
    dada = "qual_1"
	SWEP.Primary.Delay = 0.28
	SWEP.SwingTime = 0.07
	SWEP.MeleeDamage = 66
	SWEP.MeleeRange = 89
elseif qual == 3 then
dada = "qual_2"
SWEP.Primary.Delay = 0.40
SWEP.MeleeDamage = 52
SWEP.SwingTime = 0.16
SWEP.MeleeRange = 77
elseif qual == 4 then
dada = "qual_3"
SWEP.MeleeRange = 56
SWEP.MeleeDamage = 44
SWEP.SwingTime = 0.07
SWEP.Primary.Delay = 0.33
elseif qual == 5 then
dada = "qual_4"
SWEP.MeleeRange = 101
SWEP.MeleeDamage = 66
SWEP.Primary.Delay = 0.39
SWEP.SwingTime = 0.12
elseif qual == 6 then
	dada = "qual_5"
	SWEP.MeleeDamage = 44
	SWEP.SwingTime = 0.09
	SWEP.MeleeRange = 77
	SWEP.Primary.Delay = 0.35
else
	dada = "qual_0"
	SWEP.MeleeDamage = 76
    SWEP.MeleeRange = 77
	SWEP.Primary.Delay = 0.35
	SWEP.SwingTime = 0.09
end

SWEP.PrintName = translate.Get(dada)..translate.Get("wep_muramasa")
SWEP.Description = translate.Get("wep_d_muramasa")..translate.Get(dada)
if CLIENT then
	SWEP.VElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.485, 2.614, 2.876), angle = Angle(0, 0, -89.521), size = Vector(0.626, 0.331, 0.256), color = Color(74, 70, 70, 255), surpresslightning = false, material = "cs_assault/concretefloor026a", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.515, 2.458, -26.795), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(76, 0, 255, 248), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.695, 2.216, 2.505), angle = Angle(0, 0, -89.521), size = Vector(0.5, 0.305, 0.384), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.601, 2.219, -22.263), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(119, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

      SWEP.ShowViewModel = false
      SWEP.ShowWorldModel = false

end

SWEP.Base = "weapon_zs_basemelee"

SWEP.Tier = 2
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 0
SWEP.BlockMultiplierWeapon = 1
SWEP.WalkSpeed = 220


SWEP.SwingRotation = Angle(0, -80, -40)
SWEP.SwingOffset = Vector(10, 80, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"

SWEP.AllowQualityWeapons = false

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_RANGE, 3)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(65, 70))
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end


function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= -90 then
		self.m_BackStabbing = true
		self.MeleeDamage = self.MeleeDamage * 8
	end
end
function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.MeleeDamage / 8
	end
end
function SWEP:MeleeSwing()
	local owner = self:GetOwner()
	if self.Block == 1 then 
		return 
        false
	end
	--owner:GiveStatus("muramasa",2)

	self:DoMeleeAttackAnim()

	local tr = owner:CompensatedMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)

	if not tr.Hit then
		if self.MissAnim then
			self:SendWeaponAnim(self.MissAnim)
		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()
		self:PlaySwingSound()

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end

		if self.PostOnMeleeMiss then self:PostOnMeleeMiss(tr) end

		return
	end

	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end
	
    --[[if owner:IsSkillActive(SKILL_BLOODLOST) then
	function OnZombieKilled() then
			 local reaperstatus1 = owner:GiveStatus("bloodlust", 10)
			 if reaperstatus1 and reaperstatus1:IsValid() then
				reaperstatus1:SetDTInt(1, math.min(reaperstatus1:GetDTInt(1) + 1, 10))
			 end
		 end
	end
end]]
	


	local hitent = tr.Entity
	local hitflesh = tr.MatType == MAT_FLESH or tr.MatType == MAT_BLOODYFLESH or tr.MatType == MAT_ANTLION or tr.MatType == MAT_ALIENFLESH

	if self.HitAnim then
		self:SendWeaponAnim(self.HitAnim)
	end
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	if hitflesh then
		util.Decal(self.BloodDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self:PlayHitFleshSound()

		if SERVER then
			self:ServerHitFleshEffects(hitent, tr, damagemultiplier)
		end

		if not self.NoHitSoundFlesh then
			self:PlayHitSound()
		end
	else
		--util.Decal(self.HitDecal, tr.HitPos + tr.HitNormal, tr.HitPos - tr.HitNormal)
		self:PlayHitSound()
	end

	if self.OnMeleeHit and self:OnMeleeHit(hitent, hitflesh, tr) then
		return
	end

	if SERVER then
		self:ServerMeleeHitEntity(tr, hitent, damagemultiplier)
	end

	self:MeleeHitEntity(tr, hitent, damagemultiplier)

	if self.PostOnMeleeHit then self:PostOnMeleeHit(hitent, hitflesh, tr) end

	if SERVER then
		self:ServerMeleePostHitEntity(tr, hitent, damagemultiplier)
	end
end
