SWEP.Base = "weapon_zs_zombie"

SWEP.PrintName = "CRINGE"

SWEP.Primary.Delay = 0.2

SWEP.MeleeDelay = 0.2
SWEP.NextPuke = 2
SWEP.PukeLeft = 11
SWEP.BleedDamage = 11

SWEP.MeleeDamage = 55
SWEP.MeleeDamageVsProps = 22
SWEP.MeleeReach = 111
SWEP.MeleeSize = 3


function SWEP:SecondaryAttack()
	if CurTime() < self:GetNextSecondaryFire() then return end
	local owner = self:GetOwner()
	self:SetNextSecondaryFire(CurTime() + self.Secondary.Delay)

	self.PukeLeft = 11

	owner:EmitSound("npc/barnacle/barnacle_die2.wav")
	owner:EmitSound("npc/barnacle/barnacle_digesting1.wav")
	owner:EmitSound("npc/barnacle/barnacle_digesting2.wav")
end

function SWEP:SecondaryAttack()
end

function SWEP:Reload()
end





function SWEP:MeleeHit(ent, trace, damage, forcescale)
	if not ent:IsPlayer() then
		damage = self.MeleeDamageVsProps
		if ent.Sigil then
			damage = damage + 200
		end
	end
	if ent:IsPlayer() and SERVER then
		ent:SetBloodArmor(0)
	end

	self.BaseClass.MeleeHit(self, ent, trace, damage, forcescale)
end

function SWEP:PlayAlertSound()
	self:GetOwner():EmitSound("npc/barnacle/barnacle_tongue_pull"..math.random(3)..".wav")
end
SWEP.PlayIdleSound = SWEP.PlayAlertSound

function SWEP:PlayAttackSound()
	self:EmitSound("npc/barnacle/barnacle_bark"..math.random(2)..".wav")
end

if not CLIENT then return end

function SWEP:PreDrawViewModel(vm)
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner:CallZombieFunction1("PreRenderEffects", vm)
	end
end

function SWEP:PostDrawViewModel(vm)
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner:CallZombieFunction1("PostRenderEffects", vm)
	end
end
