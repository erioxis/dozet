SWEP.ZombieOnly = false
SWEP.IsMelee = true
SWEP.IsCrow = true

SWEP.ViewModel = "models/weapons/v_knife_t.mdl"
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"

SWEP.MeleeDamage = 3
SWEP.DamageType = DMG_CLUB

SWEP.MeleeDamage = 40
SWEP.MeleeRange = 50
SWEP.MeleeSize = 1.15

SWEP.UseMelee1 = true

SWEP.HitGesture = ACT_HL2MP_GESTURE_RANGE_ATTACK_MELEE
SWEP.MissGesture = SWEP.HitGesture

SWEP.SwingRotation = Angle(30, -30, -30)
SWEP.SwingTime = 0.3
SWEP.SwingHoldType = "grenade"


function SWEP:Initialize()
	self:HideViewAndWorldModel()
	local owner = self:GetOwner()
	if owner:Team() == TEAM_HUMAN then
		owner:GiveAchievement("crowhunter")
	end
end

function SWEP:OnRemove()
	local owner = self:GetOwner()
	if owner and owner:IsValid() then
		if owner.Flapping then
			owner:StopSound("NPC_Crow.Flap")
		end
		owner.Flapping = nil
	end
end
SWEP.Holster = SWEP.OnRemove

function SWEP:SetPeckEndTime(time)
	self:SetDTFloat(0, time)
end

function SWEP:GetPeckEndTime()
	return self:GetDTFloat(0)
end

function SWEP:IsPecking()
	return CurTime() < self:GetPeckEndTime()
end

