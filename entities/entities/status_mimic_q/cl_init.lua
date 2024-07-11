INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:OnInitialize()
	
	hook.Add("Move", self, self.Move)
	hook.Add("CreateMove", self, self.CreateMove)
	local owner = self:GetOwner()

	if owner:IsValid() then
		owner.NoCollideAll = true
		owner:CollisionRulesChanged()

	end
end

function ENT:CreateMove(cmd)
	if MySelf ~= self:GetOwner() then return end
	if bit.band(cmd:GetButtons(), IN_JUMP) ~= 0 then
		cmd:SetButtons(cmd:GetButtons() - IN_JUMP)
	end
end


function ENT:OnRemove()
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner.NoCollideAll = owner:Team() == TEAM_UNDEAD and owner:GetZombieClassTable().NoCollideAll
		owner:CollisionRulesChanged()
	end
end

