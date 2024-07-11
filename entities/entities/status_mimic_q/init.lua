INC_SERVER()

ENT.NextHeal = 0
ENT.Hook = false
ENT.OldMaterial = ""
ENT.OldModel = ""
function ENT:OnInitialize()
	hook.Add("Move", self, self.Move)
end

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)


--	self.OldModel = pPlayer:GetModel()
	pPlayer:DrawShadow( false )

	if pPlayer:KeyDown(IN_BACK) then
		self:SetDirection(DIR_BACK)
	elseif pPlayer:KeyDown(IN_MOVERIGHT) then
		self:SetDirection(DIR_RIGHT)
	elseif pPlayer:KeyDown(IN_MOVELEFT) then
		self:SetDirection(DIR_LEFT)
	else
		self:SetDirection(DIR_FORWARD)
	end
end

function ENT:Think()
	local fCurTime = CurTime()
	if self:GetStateEndTime() <= fCurTime or not self:GetOwner():Alive() then

		self:Remove()
		return
	end
	self:NextThink(fCurTime)
	return true
end

function ENT:OnRemove()
	local parent = self:GetOwner()
	if parent:IsValid() then
		parent:DrawShadow(true)
		parent:TemporaryNoCollide(true)
	end
end
