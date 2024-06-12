SWEP.ViewModel = "models/weapons/v_axe/v_axe.mdl"
SWEP.WorldModel = "models/weapons/w_axe.mdl"

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"
SWEP.Primary.Delay = 1

SWEP.MeleeDamage = 30
SWEP.MeleeRange = 65
SWEP.MeleeSize = 1.5
SWEP.MeleeKnockBack = 0

SWEP.Secondary.ClipSize = 1
SWEP.Secondary.DefaultClip = 1
SWEP.Secondary.Ammo = "dummy"
SWEP.Secondary.Automatic = true
SWEP.BlockTrue = true
SWEP.IgnoreNiggers = false
SWEP.Move = true
SWEP.ParryTiming = nil
SWEP.StaminaUse = 13
SWEP.BlockMultiplierWeapon = 0.3


SWEP.Block = false

SWEP.WalkSpeed = SPEED_FAST

SWEP.IsMelee = true
SWEP.MeleeFlagged = false
SWEP.zKills = 0

SWEP.HoldType = "melee"
SWEP.SwingHoldType = "grenade"

SWEP.DamageType = DMG_SLASH

SWEP.BloodDecal = "Blood"
SWEP.HitDecal = "Impact.Concrete"

SWEP.HitAnim = ACT_VM_HITCENTER
SWEP.MissAnim = ACT_VM_MISSCENTER

SWEP.SwingTime = 0
SWEP.SwingRotation = Angle(0, 0, 0)
SWEP.SwingOffset = Vector(0, 0, 0)

SWEP.AllowQualityWeapons = false





SWEP.Weight = 4

local MAT_FLESH = MAT_FLESH
local MAT_BLOODYFLESH = MAT_BLOODYFLESH
local MAT_ANTLION = MAT_ANTLION
local MAT_ALIENFLESH = MAT_ALIENFLESH



function SWEP:Initialize()
	GAMEMODE:DoChangeDeploySpeed(self)
	self:SetWeaponHoldType(self.HoldType)
	self:SetWeaponSwingHoldType(self.SwingHoldType)

	if CLIENT then
		self:Anim_Initialize()
	end
end

function SWEP:SetBlock(bool)
   self:SetDTBool(31, bool)
end
function SWEP:GetBlockState()
	return self:GetDTBool(31)
end
function SWEP:SetChargeBlock(bool)
	self:SetDTBool(30, bool)
 end
 function SWEP:GetChargeBlock()
	return self:GetDTBool(30)
 end

function SWEP:SetupDataTables()
	self:NetworkVar("Int", 0, "PowerCombo")
end

function SWEP:SetWeaponSwingHoldType(t)
	local old = self.ActivityTranslate
	self:SetWeaponHoldType(t)
	local new = self.ActivityTranslate
	self.ActivityTranslate = old
	self.ActivityTranslateSwing = new
end
function SWEP.BulletCallback(la,lap,lawo)
end
function SWEP:Deploy()
	gamemode.Call("WeaponDeployed", self:GetOwner(), self)
	self.IdleAnimation = CurTime() + self:SequenceDuration()

	return true
end

function SWEP:Think()
	if self.IdleAnimation and self.IdleAnimation <= CurTime() then
		self.IdleAnimation = nil
		self:SendWeaponAnim(ACT_VM_IDLE)
	end
	if self.BlockTrue then
		if self:GetChargeBlock() and self:GetOwner():KeyReleased(IN_ATTACK2) then
			self:SetBlock(false)
			self:SetHoldType(self.HoldType)
			self:SetWeaponSwingHoldType(self.SwingHoldType)
			self:SetChargeBlock(false) 
			self.ParryTiming = false
		end
	end

	if self:IsSwinging() and self:GetSwingEnd() <= CurTime() then
		self:StopSwinging()
		self:MeleeSwing()
	end
end
function SWEP:Move(mv)
	if self:GetBlockState() and mv:KeyDown(IN_ATTACK2) and not self:GetOwner():GetBarricadeGhosting() then
		mv:SetMaxSpeed(50)
		mv:SetMaxClientSpeed(50)	
		mv:SetSideSpeed(mv:GetSideSpeed() * 0.5)
	end
end
function SWEP:SecondaryAttack()
	if self.BlockTrue then
	if self:GetNextSecondaryFire() <= CurTime() and not self:GetOwner():IsHolding() then
		self:SetBlock(true)
		self:SetHoldType("revolver")
		self:SetWeaponSwingHoldType("revolver")
		self:SetChargeBlock(true) 
		self.Block = true
		timer.Create("trueparrydead1",0.35,1, function() 
			if !self:IsValid() or !self:GetOwner():IsValid() then return false end
			self.ParryTiming = false
		end)
		timer.Create("trueparry",0.25,1, function() 
			if !self:IsValid() or !self:GetOwner():IsValid() then return false end
			self.ParryTiming = true
		end)
		self:SetNextSecondaryFire(CurTime() + 0.75)
	end

end
end



function SWEP:Reload()
    self.Block = nil
	self:SetBlock(false)
	return false
end

function SWEP:CanPrimaryAttack()
	if self:GetOwner():IsHolding() or self:GetOwner():GetBarricadeGhosting() or (self:GetOwner()[self:GetClass().."NOMELEE"] or 0) > CurTime() then return false end
	return self:GetNextPrimaryFire() <= CurTime() and not self:IsSwinging()
end

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav")
end

function SWEP:PlayStartSwingSound()
end

function SWEP:PlayHitSound()
	self:EmitSound("weapons/melee/golf club/golf_hit-0"..math.random(4)..".ogg")
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/body/body_medium_break"..math.random(2, 4)..".wav")
end

function SWEP:PrimaryAttack()
	if not self:CanPrimaryAttack() then return end

	self:SetNextAttack()
	

	if self.SwingTime == 0 then
		self:MeleeSwing()
	else
		self:StartSwinging()
	end
end

function SWEP:SetNextAttack()
	local owner = self:GetOwner()
	local armdelay = owner:GetMeleeSpeedMul()
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay * armdelay)
end

function SWEP:Holster()
	if (self:GetOwner():GetStatus("sticky")) then return false end
	self.SwingingTrue = false
	if CurTime() >= self:GetSwingEnd() then
		if CLIENT then
			self:Anim_Holster()
		end

		return true
	end
	if self.Block then
		self:SetBlock(false)
	end
	return false

end

function SWEP:StartSwinging()
	local owner = self:GetOwner()
	if self:GetBlockState() then
		self.ParryTiming = false
	end
	if owner.StaminaHAHA then
		owner:AddStamina(-(self.StaminaUse or 13))
	end


	if self.StartSwingAnimation then
		self:SendWeaponAnim(self.StartSwingAnimation)
		self.IdleAnimation = CurTime() + self:SequenceDuration()
	end
	self.SwingingTrue = true
	owner:ResetSpeed()
	self:PlayStartSwingSound()

	local armdelay = owner:GetMeleeSpeedMul()
	self:SetSwingEnd(CurTime() + self.SwingTime * (owner.MeleeSwingDelayMul or 1) * armdelay)
end

function SWEP:DoMeleeAttackAnim()
	self:GetOwner():DoAttackEvent()
end
local function BaseSwungEffect(self, tr, owner)
	if not tr.Hit then
		if self.MissAnim then
			self:SendWeaponAnim(self.MissAnim)
		end
		if tr.Entity and tr.Entity:IsValid() then
			if !WorldVisible(tr.Entity:GetPos(), owner:EyePos()) then
				return true
			end

		end
		self.IdleAnimation = CurTime() + self:SequenceDuration()
		self:PlaySwingSound()

		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end

		if self.PostOnMeleeMiss then self:PostOnMeleeMiss(tr) end

		return true
	end
end
local function BaseSwung(self, tr, owner)
	local damagemultiplier = owner:Team() == TEAM_HUMAN and owner.MeleeDamageMultiplier or 1 --(owner.BuffMuscular and owner:Team()==TEAM_HUMAN) and 1.2 or 1
	if owner:IsSkillActive(SKILL_LASTSTAND) then
		if owner:Health() <= owner:GetMaxHealth() * 0.25 then
			damagemultiplier = damagemultiplier * 2
		else
			damagemultiplier = damagemultiplier * 0.85
		end
	end
	if owner.StaminaHAHA and owner:IsSkillActive(SKILL_SAHA) then
		if owner:GetStamina() <= 50 then
			damagemultiplier = damagemultiplier * 1.33
		end
	end
	if owner:IsSkillActive(SKILL_CURSE_OF_MISS) and math.random(1,3) == 1 and SERVER then
		GAMEMODE:BlockFloater(owner, NULL, tr.HitPos, 1)
		self:SetPowerCombo(0)
		owner.MissTimes = (owner.MissTimes or 0) + 1
		if owner.MissTimes >= 10 then
			owner:GiveAchievement("koso")
		end
		return
	end
	owner.MissTimes = 0
	 
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
local function doemit( self, pos )
	if SERVER or !pos then return end
    local dsh = 2
    local emitter = ParticleEmitter( pos )
    emitter:SetNearClip(24, 32)
    local particle = emitter:Add("effects/blood2", pos )
    if particle then
        particle:SetDieTime(1)
        particle:SetStartSize( math.Rand( 1, 2 ) + ( dsh * 1.5 ) )
        particle:SetEndSize(0)
        particle:SetColor( math.random( 255 ), 140, 255 )
        particle:SetStartAlpha( 255 )
        particle:SetEndAlpha( 50 )
        particle:SetRoll( math.random( 0, 360 ) )
        particle:SetGravity( Vector( 0, 0, 0 ) )
    end

end
SWEP.Attacks_Per_Swung = 4
local vector_base = Vector(0,0,0)
function SWEP:MeleeSwing()
	local owner = self:GetOwner()
	local aps = self.Attacks_Per_Swung or 0

	--if SERVER and aps > 0  then owner:StartDamageNumberSession() end

	local distance = (self.MeleeRange * (owner.MeleeRangeMul or 1))/(aps+1)
	
	if owner.StaminaHAHA then
		owner:AddStamina(-(self.StaminaUse or 13)*0.4)
	end
	self.SwingingTrue = false
	owner:ResetSpeed()
	self:DoMeleeAttackAnim()

	local up, right, forward = owner:GetUp(),owner:GetRight(),owner:GetForward()

	local newpos = self.LastHitPos or owner:GetShootPos()
	local ovious = self.OverPosition or vector_base
	local additional = self.Additionalism or vector_base
	local rotate = right*ovious[1]+forward*ovious[2]+up*ovious[3]
	local addling = right*additional[1]+forward*additional[2]+up*additional[3]
	for i=0,aps do
		rotate = rotate + addling
		local tr = owner:CompensatedMeleeTrace_Modified(distance, self.MeleeSize, i, (owner:GetShootPos()+right*distance*-(i-1) + (forward*distance*((i > math.Round(aps/2) and (-i+aps/1.5)+i/2 or i)))+forward*distance*(aps/2))+rotate, right)
		--print(tr.HitPos)
		self.LastHitPos = tr.HitPos
		newpos = tr.HitPos
		
		doemit(self, self.LastHitPos)
		if BaseSwungEffect(self, tr, owner) then continue  end
		
		BaseSwung(self, tr, owner)
	end
	local tr2 = owner:CompensatedMeleeTrace_Modified(distance*(aps+1), self.MeleeSize)
	doemit(self, tr2.HitPos)
	self.LastHitPos = nil
	if !BaseSwungEffect(self, tr2, owner) then 	BaseSwung(self, tr2, owner)  end

end
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	local ent = hitent
	if IsFirstTimePredicted() then
		local owner = self:GetOwner()
		if owner.StaminaHAHA then
			owner:AddStamina(-(self.StaminaUse or 13)*0.3)
		end
		if owner:IsSkillActive(SKILL_CURSECURE) and ent:IsPlayer() and SERVER  then
			local count = 0
			for _, ent in pairs(ents.FindInSphere(tr.HitPos, 97)) do
				if ent:IsValid() and ent:IsPlayer() and ent ~= owner and ent:IsValidLivingZombie() then
					count = count + 1
				end
			end
			effectdata = EffectData()
			effectdata:SetOrigin(tr.HitPos)
			effectdata:SetNormal(Vector(0, 0, 1))
			effectdata:SetMagnitude(5)
			effectdata:SetScale(1.5)
		util.Effect("HelicopterMegaBomb", effectdata, true, true)

			for i = 1, math.random(3) do
				for _, ent in pairs(ents.FindInSphere(tr.HitPos, 97)) do
					if ent:IsValid() and ent:IsPlayer() and ent ~= owner and ent:IsValidLivingZombie() then
						ent:TakeDamage((self.MeleeDamage*0.35*(owner.MeleeDamageMultiplier or 1))/count, owner, self)
					end
				end
			end
		end
	end
end
function SWEP:PlayerHitUtil(owner, damage, hitent, dmginfo)
	local block = self:GetBlockState()
	local damage = block and damage * 0.4 or damage
	if owner:IsSkillActive(SKILL_PARASITOID) and SERVER and not block and not self.NoParasits then
		local parasite = hitent:GiveStatus("parasitoid", 3)
		if parasite and parasite:IsValid() then
			parasite:AddDamage(6, owner)
			parasite.Damage = self.MeleeDamage*0.05*(owner.MeleeDamageMultiplier or 1)
			parasite:SetDTInt(1,parasite:GetDTInt(1)+1)
			--net.Start("zs_update_style") net.WriteTable({time = CurTime()+3+(math.random(10,20)*0.2),text = Format("PARASITED A %s!",hitent:Nick()),score = 10,color = Color(177,34,177)}) net.Send(owner) 
		end
	end
	if owner:IsSkillActive(SKILL_HELPER) and SERVER and block then
		hitent:GiveStatus("target", 10,owner)
	end
	if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
		self:SetPowerCombo(self:GetPowerCombo() + 1)

		damage = damage + damage * (owner.MeleePowerAttackMul - 1) * (self:GetPowerCombo()/4)
		dmginfo:SetDamage(damage)

		if self:GetPowerCombo() >= 4 then
			self:SetPowerCombo(0)
			if SERVER then
				local pitch = math.Clamp(math.random(90, 110) + 15 * (1 - damage/45), 50 , 200)
				owner:EmitSound("npc/strider/strider_skewer1.wav", 75, pitch)
			end
		end
	end

	hitent:MeleeViewPunch(damage * (self.MeleeViewPunchScale or 1))
	if hitent:IsHeadcrab() then
		damage = damage * 2
		dmginfo:SetDamage(damage)
	end
end
function SWEP:OnZombieKilled()
	owner = self:GetOwner()
	if owner:IsSkillActive(SKILL_BLOODLOST) then
		local reaperstatus1 = owner:GiveStatus("reaper", 10)
		if reaperstatus1 and reaperstatus1:IsValid() then
			reaperstatus1:SetDTInt(1, math.min(reaperstatus1:GetDTInt(1) + 1, 50))
		end
	end
end

local tierscale = {["0tier"] = 1,["1tier"] = 1.05,["2tier"] = 1.09,["3tier"] = 1.15,["4tier"] = 1.12, ["5tier"] = 1.09, ["6tier"] = 1.05, ["7tier"] = 1}
function SWEP:PostHitUtil(owner, hitent, dmginfo, tr, vel)
	if self.PointsMultiplier then
		POINTSMULTIPLIER = self.PointsMultiplier
	end
	if owner:IsSkillActive(SKILL_RESNYA2) then
		dmginfo:ScaleDamage(tierscale[tostring((self.Tier or 1)).."tier"])
	end
	hitent:DispatchTraceAttack(dmginfo, tr, owner:GetAimVector())
	if self.PointsMultiplier then
		POINTSMULTIPLIER = nil
	end


	if vel then
		hitent:SetLocalVelocity(vel)
	end

	-- Perform our own knockback vs. players
	if hitent:IsPlayer() then
		local knockback = self.MeleeKnockBack * (owner.MeleeKnockbackMultiplier or 1)
		if knockback > 0 then
			hitent:ThrowFromPositionSetZ(tr.StartPos, knockback, nil, true)
		end

		if owner.MeleeLegDamageAdd and owner.MeleeLegDamageAdd > 0 then
			hitent:AddLegDamage(owner.MeleeLegDamageAdd)
		end
	end

	local effectdata = EffectData()
	effectdata:SetOrigin(tr.HitPos)
	effectdata:SetStart(tr.StartPos)
	effectdata:SetNormal(tr.HitNormal)
	util.Effect("RagdollImpact", effectdata)
	if not tr.HitSky then
		effectdata:SetSurfaceProp(tr.SurfaceProps)
		effectdata:SetDamageType(self.DamageType)
		effectdata:SetHitBox(tr.HitBox)
		effectdata:SetEntity(hitent)
		util.Effect("Impact", effectdata)
	end

	if self.MeleeFlagged then self.IsMelee = nil end
end

function SWEP:MeleeHitEntity(tr, hitent, damagemultiplier)
	if not IsFirstTimePredicted() then return end

	if self.MeleeFlagged then self.IsMelee = true end

	local owner = self:GetOwner()

	if SERVER then
		if hitent:IsPlayer() then
			local wep = hitent:GetActiveWeapon() 
			if wep and wep.IsSwinging and wep:IsSwinging() then
				hitent.IdealHit = true 
				timer.Create("Parry_a_"..hitent:Nick(),5,1,function() if hitent:IsValid() then hitent.IdealHit = false end end)
			end
			if owner:IsSkillActive(SKILL_GLASSWEAPONS) then
				damagemultiplier = damagemultiplier * 3.5
				owner.GlassWeaponShouldBreak = not owner.GlassWeaponShouldBreak
			end
		end
		if owner.ShineAndHit and hitent.IdealHit then
			damagemultiplier = damagemultiplier * 1.4
		end
	end

	local damage = (self.MeleeDamage * damagemultiplier) * (self:GetBlockState() and 0.4 or 1)
	local dmginfo = DamageInfo()
	dmginfo:SetDamagePosition(tr.HitPos)
	dmginfo:SetAttacker(owner)
	dmginfo:SetInflictor(self)
	dmginfo:SetDamageType(self.DamageType)
	dmginfo:SetDamage(damage)
	dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 50 * owner:GetAimVector())

	local vel
	if hitent:IsPlayer() then
		self:PlayerHitUtil(owner, damage, hitent, dmginfo)

		if SERVER then
			hitent:SetLastHitGroup(tr.HitGroup)
			if tr.HitGroup == HITGROUP_HEAD then
				hitent:SetWasHitInHead()
			end

			if hitent:WouldDieFrom(damage, tr.HitPos) then
				dmginfo:SetDamageForce(math.min(self.MeleeDamage, 50) * 400 * owner:GetAimVector())
			end
		end

		vel = hitent:GetVelocity()
	else
		if owner.MeleePowerAttackMul and owner.MeleePowerAttackMul > 1 then
			self:SetPowerCombo(0)
		end
	end

	self:PostHitUtil(owner, hitent, dmginfo, tr, vel)
end



function SWEP:StopSwinging()
	self:SetSwingEnd(0)
end

function SWEP:IsSwinging()
	return self:GetSwingEnd() > 0
end

function SWEP:SetSwingEnd(swingend)
	self:SetDTFloat(0, swingend)
end

function SWEP:GetSwingEnd()
	return self:GetDTFloat(0)
end

local ActIndex = {
	[ "pistol" ] 		= ACT_HL2MP_IDLE_PISTOL,
	[ "smg" ] 			= ACT_HL2MP_IDLE_SMG1,
	[ "grenade" ] 		= ACT_HL2MP_IDLE_GRENADE,
	[ "ar2" ] 			= ACT_HL2MP_IDLE_AR2,
	[ "shotgun" ] 		= ACT_HL2MP_IDLE_SHOTGUN,
	[ "rpg" ]	 		= ACT_HL2MP_IDLE_RPG,
	[ "physgun" ] 		= ACT_HL2MP_IDLE_PHYSGUN,
	[ "crossbow" ] 		= ACT_HL2MP_IDLE_CROSSBOW,
	[ "melee" ] 		= ACT_HL2MP_IDLE_MELEE,
	[ "slam" ] 			= ACT_HL2MP_IDLE_SLAM,
	[ "normal" ]		= ACT_HL2MP_IDLE,
	[ "fist" ]			= ACT_HL2MP_IDLE_FIST,
	[ "melee2" ]		= ACT_HL2MP_IDLE_MELEE2,
	[ "passive" ]		= ACT_HL2MP_IDLE_PASSIVE,
	[ "knife" ]			= ACT_HL2MP_IDLE_KNIFE,
	[ "duel" ]      	= ACT_HL2MP_IDLE_DUEL,
	[ "revolver" ]		= ACT_HL2MP_IDLE_REVOLVER,
	[ "camera" ]		= ACT_HL2MP_IDLE_CAMERA
}

function SWEP:SetWeaponHoldType( t )

	t = string.lower( t )
	local index = ActIndex[ t ]


	if ( index == nil ) then
		Msg( "SWEP:SetWeaponHoldType - ActIndex[ \""..t.."\" ] isn't set! (defaulting to normal)\n" )
		t = "normal"
		index = ActIndex[ t ]
	end

	self.ActivityTranslate = {}
	self.ActivityTranslate [ ACT_MP_STAND_IDLE ] 				= index
	self.ActivityTranslate [ ACT_MP_WALK ] 						= index+1
	self.ActivityTranslate [ ACT_MP_RUN ] 						= index+2
	self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] 				= index+3
	self.ActivityTranslate [ ACT_MP_CROUCHWALK ] 				= index+4
	self.ActivityTranslate [ ACT_MP_ATTACK_STAND_PRIMARYFIRE ] 	= index+5
	self.ActivityTranslate [ ACT_MP_ATTACK_CROUCH_PRIMARYFIRE ] = index+5
	self.ActivityTranslate [ ACT_MP_RELOAD_STAND ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_RELOAD_CROUCH ]		 		= index+6
	self.ActivityTranslate [ ACT_MP_JUMP ] 						= index+7
	self.ActivityTranslate [ ACT_RANGE_ATTACK1 ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM_IDLE ] 				= index+8
	self.ActivityTranslate [ ACT_MP_SWIM ] 						= index+9

	-- "normal" jump animation doesn't exist
	if t == "normal" then
		self.ActivityTranslate [ ACT_MP_JUMP ] = ACT_HL2MP_JUMP_SLAM
	end

	-- these two aren't defined in ACTs for whatever reason
	if t == "knife" or t == "melee2" then
		self.ActivityTranslate [ ACT_MP_CROUCH_IDLE ] = nil
	end
end

SWEP:SetWeaponHoldType("melee")

function SWEP:TranslateActivity( act )
	if self:GetSwingEnd() ~= 0 and self.ActivityTranslateSwing[act] then
		return self.ActivityTranslateSwing[act] or -1
	end

	return self.ActivityTranslate and self.ActivityTranslate[act] or -1
end

