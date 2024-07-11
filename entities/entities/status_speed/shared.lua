ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	self.Seed = math.Rand(0, 10)

	hook.Add("Move", self, self.Move)

	if CLIENT then
		hook.Add("Draw", self, self.Draw)
	end
end

function ENT:Move(pl, move)
	if pl ~= self:GetOwner() then return end

	local speedffect = 80

	move:SetMaxSpeed(move:GetMaxSpeed() + speedffect)
	move:SetMaxClientSpeed(move:GetMaxClientSpeed() + speedffect)
end

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
