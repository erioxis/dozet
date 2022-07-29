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

SWEP.VElements = {
	["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.485, 2.614, 2.876), angle = Angle(0, 0, -89.521), size = Vector(0.626, 0.331, 0.256), color = Color(74, 70, 70, 255), surpresslightning = false, material = "cs_assault/concretefloor026a", skin = 0, bodygroup = {} },
	["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.515, 2.458, -26.795), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}

SWEP.WElements = {
	["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.695, 2.216, 2.505), angle = Angle(0, 0, -89.521), size = Vector(0.5, 0.305, 0.384), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
	["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.601, 2.219, -22.263), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
}


SWEP.PrintName = ""..translate.Get("wep_murasama")
SWEP.Description = ""..translate.Get("wep_d_murasama")
if CLIENT then
	SWEP.VElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.485, 2.614, 2.876), angle = Angle(0, 0, -89.521), size = Vector(0.626, 0.331, 0.256), color = Color(74, 70, 70, 255), surpresslightning = false, material = "cs_assault/concretefloor026a", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(1.515, 2.458, -26.795), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["hand"] = { type = "Model", model = "models/props_junk/wood_pallet001a_chunka1.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.695, 2.216, 2.505), angle = Angle(0, 0, -89.521), size = Vector(0.5, 0.305, 0.384), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["sword"] = { type = "Model", model = "models/props_junk/vent001_chunk6.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.601, 2.219, -22.263), angle = Angle(0, -103.084, 89.944), size = Vector(0.5, 2.743, 0.237), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

      SWEP.ShowViewModel = false
      SWEP.ShowWorldModel = false

end

SWEP.Base = "weapon_zs_basemelee"

SWEP.Tier = 7
SWEP.MeleeDamage = 999
SWEP.MeleeRange = 177
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 0
SWEP.MaxStock = 2
SWEP.BlockMultiplierWeapon = 0.75

SWEP.WalkSpeed = SPEED_FAST

SWEP.SwingTime = 0.10
SWEP.SwingRotation = Angle(0, -20, -40)
SWEP.SwingOffset = Vector(10, 0, 0)
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
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= 90 then
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

function SWEP:GetTracesNumPlayers(traces)
	local numplayers = 0

	local ent
	for _, trace in pairs(traces) do
		ent = trace.Entity
		if ent and ent:IsValidPlayer() then
			numplayers = numplayers + 1
		end
	end

	return numplayers
end


function SWEP:GetDamage(numplayers, basedamage)
	basedamage = basedamage or self.MeleeDamage

	if numplayers then
		return basedamage * math.Clamp(1.25 - numplayers * 0.25, 0.5, 1)
	end

	return basedamage
end

function SWEP:MeleeSwing()
	local owner = self:GetOwner()
	local damage = DamageInfo()

	owner:DoAttackEvent()
	self:SendWeaponAnim(self.MissAnim)
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	local hit = false
	local tr = owner:CompensatedPenetratingMeleeTrace(self.MeleeRange * (owner.MeleeRangeMul or 1), self.MeleeSize)
	local damage = self:GetDamage(self:GetTracesNumPlayers(tr))
	local ent

	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end


	for _, trace in ipairs(tr) do
		if not trace.Hit then continue end

		ent = trace.Entity

		hit = true

		local hitflesh = trace.MatType == MAT_FLESH or trace.MatType == MAT_BLOODYFLESH or trace.MatType == MAT_ANTLION or trace.MatType == MAT_ALIENFLESH

		if hitflesh then
			util.Decal(self.BloodDecal, trace.HitPos + trace.HitNormal, trace.HitPos - trace.HitNormal)

			if SERVER then
				self:ServerHitFleshEffects(ent, trace, damagemultiplier)
			end

		end

		if ent and ent:IsValid() then
			if SERVER then
				self:ServerMeleeHitEntity(trace, ent, damagemultiplier)
			end

			self:MeleeHitEntity(trace, ent, damagemultiplier, damage)

			if SERVER then
				self:ServerMeleePostHitEntity(trace, ent, damagemultiplier)
			end

			if owner.GlassWeaponShouldBreak then break end
		end
	end

	if hit then
		self:PlayHitSound()

	else
		self:PlaySwingSound()


		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end
	if SERVER and not owner:IsSkillActive(SKILL_MELEEFAN) or SERVER and not owner:Nick() == "Jetstream Sam" then
	owner:TakeDamage((owner:Health() * 0.01) + 1)
	owner:SetHealth(owner:Health() * 0.9)
	end
end

