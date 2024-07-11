SWEP.Base = "weapon_zs_wraith"
DEFINE_BASECLASS("weapon_zs_wraith")

SWEP.PrintName = "Tormented SPY"

SWEP.MeleeDelay = 0.3
SWEP.MeleeReach = 48
SWEP.MeleeSize = 4.5
SWEP.MeleeDamage = 231
SWEP.MeleeAnimationDelay = 0
SWEP.MeleeDamageVsProps = 22

SWEP.Secondary.Delay = 0.88

SWEP.ViewModel = Model("models/weapons/v_pza.mdl")
SWEP.WorldModel = ""

AccessorFuncDT(SWEP, "Tormented", "Float", 1)
function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:PrimaryAttack()
	local owner = self:GetOwner()
	if CurTime() < self:GetNextPrimaryFire() then return end

	local armdelay = owner:GetMeleeSpeedMul() * ((CurTime() < self:GetTormented() + 2) and 0.75 or 1)
	self:SetNextPrimaryFire(CurTime() + self.Primary.Delay * armdelay)

	self.MeleeDelay = 0.6
	self.MeleeDamage = 251
	self:StartSwinging()
end


function SWEP:SecondaryAttack()
	local owner = self:GetOwner()
	if CurTime() < self:GetNextPrimaryFire() then return end

	local armdelay = owner:GetMeleeSpeedMul() * ((CurTime() < self:GetTormented() + 2) and 0.75 or 1)
	self:SetNextPrimaryFire(CurTime() + self.Secondary.Delay * armdelay)

	self.MeleeDelay = 0.3
	self.MeleeDamage = 31
	self:StartSwinging(true)
end

function SWEP:StartSwinging(secondary)
	if not IsFirstTimePredicted() then return end

	local owner = self:GetOwner()
	local armdelay = owner:GetMeleeSpeedMul()

	self.MeleeAnimationMul = 1 / armdelay
	if self.MeleeAnimationDelay then
		self.NextAttackAnim = CurTime() + self.MeleeAnimationDelay * armdelay
	else
		self:SendAttackAnim()
	end

	if not secondary then
		self:DoSwingEvent()
	else
		owner:DoAnimationEvent(ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE)
	end

	self:PlayAttackSound(secondary)

	self:StopMoaning()

	if self.FrozenWhileSwinging then
		self:GetOwner():SetSpeed(1)
	end

	if self.MeleeDelay > 0 then
		self:SetSwingEndTime(CurTime() + self.MeleeDelay * armdelay)

		local trace = owner:CompensatedMeleeTrace(self.MeleeReach, self.MeleeSize)
		if trace.HitNonWorld and not trace.Entity:IsPlayer() then
			trace.IsPreHit = true
			self.PreHit = trace
		end

		self.IdleAnimation = CurTime() + (self:SequenceDuration() + (self.MeleeAnimationDelay or 0)) * armdelay
	else
		self:Swung()
	end
end
function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	if hitent:IsValid() and hitent:IsPlayer() and not self.m_BackStabbing and math.abs(hitent:GetForward():Angle().yaw - self:GetOwner():GetForward():Angle().yaw) <= 90 then
		self.m_BackStabbing = true
		self.MeleeDamage = self.MeleeDamage * 10
	end
end
function SWEP:PostOnMeleeHit(hitent, hitflesh, tr)
	if self.m_BackStabbing then
		self.m_BackStabbing = false

		self.MeleeDamage = self.MeleeDamage / 10
	end
end

function SWEP:PlayAttackSound(secondary)
	if secondary then
		self:EmitSound("npc/fast_zombie/wake1.wav", 75, 125, 0.75)
		self:EmitSound("npc/antlion/attack_single2.wav", 75, 215, 0.75, CHAN_AUTO)
	else
		BaseClass.PlayAttackSound(self)
	end
end

function SWEP:PlayHitSound()
	if self.MeleeDamage > 20 then
		self:EmitSound("ambient/machines/slicer"..math.random(4)..".wav", 75, 80, nil, CHAN_AUTO)
	else
		self:EmitSound("npc/fast_zombie/claw_strike"..math.random(3)..".wav", 70, 80, nil, CHAN_AUTO)
	end
end
