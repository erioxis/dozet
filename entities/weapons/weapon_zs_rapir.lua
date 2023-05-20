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
SWEP.Primary.Delay = 0.55
SWEP.SwingTime = 0.21
SWEP.MeleeDamage = 55
SWEP.MeleeRange = 77

SWEP.PrintName = translate.Get("wep_rapir")
SWEP.Description = translate.Get("wep_d_rapir")
if CLIENT then
	SWEP.VElements = {
		["rapier"] = { type = "Model", model = "models/hunter/misc/shell2x2a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3.514, 1.557, -2.715), angle = Angle(11.758, 0, 0), size = Vector(0.014, 0.014, 0.143), color = Color(36, 36, 36, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["rapier+"] = { type = "Model", model = "models/props_c17/canister_propane01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(0, 0, 4.421), angle = Angle(0, 0, 0), size = Vector(0.039, 0.033, 0.039), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "rapier", pos = Vector(0, 0, 0.019), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.028), color = Color(36, 36, 36, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["rapier+++"] = { type = "Model", model = "models/mechanics/robotics/claw.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(2.026, 0, 2.656), angle = Angle(0, 0, 90), size = Vector(0.121, 0.119, 0.096), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier++++"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "rapier", pos = Vector(0, 0, -0.061), angle = Angle(90, -45, 0), size = Vector(0.054, 0.09, 0.09), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier+++++"] = { type = "Model", model = "models/hunter/misc/cone2x2.mdl", bone = "ValveBiped.Bip01_Spine4", rel = "rapier", pos = Vector(0, 0, -0.436), angle = Angle(0, 180, 180), size = Vector(0.01, 0.01, 0.446), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} }
	}
	
	SWEP.WElements = {
		["Iori"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_L_Thigh", rel = "", pos = Vector(1.837, 4.162, 3.754), angle = Angle(-90, 51.964, 0), size = Vector(0.009, 0.012, 0.117), color = Color(36, 36, 36, 255), surpresslightning = false, material = "phoenix_storms/trains/track_beamside", skin = 0, bodygroup = {} },
		["Iori+"] = { type = "Model", model = "models/hunter/misc/cone2x2.mdl", bone = "ValveBiped.Bip01_L_Thigh", rel = "Iori", pos = Vector(0, 0, 0), angle = Angle(0, 0, 0), size = Vector(0.008, 0.011, 0.446), color = Color(195, 195, 195, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["rapier"] = { type = "Model", model = "models/hunter/misc/shell2x2a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(4.659, 1.527, -3.378), angle = Angle(11.758, 0, 0), size = Vector(0.014, 0.014, 0.143), color = Color(36, 36, 36, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["rapier+"] = { type = "Model", model = "models/props_c17/canister_propane01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(-0.001, 0, 4.421), angle = Angle(0, 0, 0), size = Vector(0.039, 0.033, 0.039), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier++"] = { type = "Model", model = "models/hunter/tubes/circle2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(0.001, 0, 0.019), angle = Angle(0, 0, 0), size = Vector(0.014, 0.014, 0.028), color = Color(36, 36, 36, 255), surpresslightning = false, material = "phoenix_storms/middle", skin = 0, bodygroup = {} },
		["rapier+++"] = { type = "Model", model = "models/mechanics/robotics/claw.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(2.026, 0, 2.656), angle = Angle(0, 0, 90), size = Vector(0.121, 0.119, 0.096), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier++++"] = { type = "Model", model = "models/props_c17/pulleywheels_large01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(0, 0, -0.061), angle = Angle(90, -45, 0), size = Vector(0.054, 0.09, 0.09), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} },
		["rapier+++++"] = { type = "Model", model = "models/hunter/misc/cone2x2.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "rapier", pos = Vector(-0.001, 0, -0.436), angle = Angle(0, -180, -180), size = Vector(0.01, 0.01, 0.446), color = Color(145, 145, 145, 255), surpresslightning = false, material = "phoenix_storms/concrete0", skin = 0, bodygroup = {} }
	}

      SWEP.ShowViewModel = false
      SWEP.ShowWorldModel = false

end

SWEP.Base = "weapon_zs_basemelee"
SWEP.WalkSpeed = 210
SWEP.Tier = 3
SWEP.MeleeSize = 3
SWEP.MeleeKnockBack = 0
SWEP.BlockMultiplierWeapon = 1


SWEP.SwingRotation = Angle(0, -80, -40)
SWEP.SwingOffset = Vector(10, 80, 0)
SWEP.SwingHoldType = "melee"

SWEP.HitDecal = "Manhackcut"




function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, 76 * self:GetOwner():GetVelocity():Length() * 0.01 + 25)
	--print(self:GetOwner():GetVelocity():Length() * 0.001)
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end

function SWEP:SetNextAttack()
	local owner = self:GetOwner()
	local armdelay = owner:GetMeleeSpeedMul()
		self:SetNextPrimaryFire(CurTime() + math.Clamp((self.Primary.Delay * armdelay) - owner:GetVelocity():Length() * 0.001, 0.15,5))

end
function SWEP:StartSwinging()
	local owner = self:GetOwner()
	if self.StartSwingAnimation then
		self:SendWeaponAnim(self.StartSwingAnimation)
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
	self:PlayStartSwingSound()

	local armdelay = owner:GetMeleeSpeedMul()
		self:SetSwingEnd(CurTime() + math.Clamp((self.SwingTime * (owner.MeleeSwingDelayMul or 1) * armdelay) - owner:GetVelocity():Length() * 0.001, 0.15,5))

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
	if owner:IsSkillActive(SKILL_CURSE_OF_MISS) and math.random(1,3) == 1 and SERVER then
		GAMEMODE:BlockFloater(owner, NULL, tr.HitPos, 1)
		self:SetPowerCombo(0)
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
