SWEP.PrintName = "GODS OF GODS"

SWEP.Base = "weapon_zs_zombie"

SWEP.MeleeDelay = 0.22
SWEP.MeleeReach = 70
SWEP.MeleeSize = 16
SWEP.MeleeDamage = 200

SWEP.DelayWhenDeployed = true

--[[function SWEP:Move(mv)
	if self:IsSwinging() then
		mv:SetMaxSpeed(50)
		mv:SetMaxClientSpeed(50)
	end
end]]

function SWEP:PrimaryAttack(fromsecondary)
	local n = self:GetNextPrimaryAttack()

	local owner = self:GetOwner()
	if owner:IsOnGround() or owner:WaterLevel() >= 2 or owner:GetMoveType() ~= MOVETYPE_WALK then
		self.BaseClass.PrimaryAttack(self)
	end

	if not fromsecondary and n ~= self:GetNextPrimaryAttack() then
		self:SetDTBool(3, false)
	end
end

function SWEP:SecondaryAttack()
	local n = self:GetNextPrimaryAttack()
	self:PrimaryAttack(true)
	if n ~= self:GetNextPrimaryAttack() then
		self:SetDTBool(3, true)
	end
end

function SWEP:PlayHitSound()
	self:EmitSound("npc/zombie/zombie_pound_door.wav", 77, 65, nil, CHAN_AUTO)
end

function SWEP:PlayAttackSound()
	self:EmitSound("npc/zombie/foot_slide"..math.random(3)..".wav", 77, 65, nil, CHAN_AUTO)
end

function SWEP:Reload()
end

function SWEP:StartMoaning()
end

function SWEP:StopMoaning()
end

function SWEP:IsMoaning()
	return false
end


--https://www.youtube.com/watch?v=HLgaKyehIAw
--[[Коля, коля, тр*хни меня
Коля, коля, тр*хни меня, Коля
Ты моя вселенная, я не могу без тебя
Я хочу, хочу тебя, Кооля
Коля, коля, тр*хни меня
Коля, коля, тр*хни меня, Коля
Ты моя вселенная, я не могу без тебя
Я хочу, хочу тебя, Кооля
Соболев такой прикольный, самый лучший в мире блогер,
никогда не врет в аудитори,
мой любимый Коля,
я хочу чтобы ты был всегда со мною, А,
под луной гулять с тобою за руку - это моя мечта .
Коля, коля, тр*хни меня
Коля, коля, тр*хни меня, Коля
Ты моя вселенная, я не могу без тебя
Я хочу, хочу тебя, Кооля
Коля, коля, тр*хни меня
Коля, коля, тр*хни меня, Коля
Ты моя вселенная, я не могу без тебя
Я хочу, хочу тебя, Кооля
]]