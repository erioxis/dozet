AddCSLuaFile()

ENT.Type = "anim"
ENT.Base = "status__base"

ENT.Ephemeral = true

AccessorFuncDT(ENT, "Duration", "Float", 0)
AccessorFuncDT(ENT, "StartTime", "Float", 4)

function ENT:Initialize()
	self.BaseClass.Initialize(self)

	if SERVER then
		self:EmitSound("npc/stalker/breathing3.wav", 70, 85)
	end
end

function ENT:PlayerSet()
	self:SetStartTime(CurTime())
end
