ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self.Seed = math.Rand(0, 10)

	hook.Add("Move", self, self.Move)

	if CLIENT then
		hook.Add("Draw", self, self.Draw)
	end
end

function ENT:SetEndTime(time)
	self:SetDTFloat(0, time)
end

function ENT:GetEndTime()
	return self:GetDTFloat(0)
end

function ENT:SetStartTime(time)
	self:SetDTFloat(1, time)
end

function ENT:GetStartTime()
	return self:GetDTFloat(1)
end

function ENT:GetPower()
	local curtime = CurTime()
	local power = math.min(1, curtime - self:GetStartTime())
	if power == 1 then
		power = math.min(1, self:GetEndTime() - curtime)
	end

	return power
end

function ENT:Move(pl, move)
	if pl ~= self:GetOwner() then return end

	move:SetMaxSpeed( move:GetMaxSpeed() * .1 )
	move:SetMaxClientSpeed( move:GetMaxClientSpeed() * .1 )
end

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
