INC_SERVER()

ENT.NextHeal = 0
ENT.Hook = false
ENT.OldMaterial = ""
ENT.OldModel = ""
function ENT:OnInitialize()
	hook.Add("Move", self, self.Move)
end

function ENT:PlayerSet(pPlayer, bExists)
	pPlayer.FeignDeath = self
	pPlayer:SetCollisionGroup(COLLISION_GROUP_DEBRIS_TRIGGER)
	pPlayer:AnimResetGestureSlot(GESTURE_SLOT_ATTACK_AND_RELOAD)
	self.OldMaterial = pPlayer:GetMaterial()
--	self.OldModel = pPlayer:GetModel()
	if !pPlayer.BaraCat then
		timer.Simple(1.5, function()
			pPlayer:CreateRagdoll()
			timer.Simple(0.1, function()
				pPlayer:DrawWorldModel( false )
				pPlayer:DrawShadow( false )
				pPlayer:Fire( "alpha", 0, 0 )
				if pPlayer:GetMaterial() ~= "models/effects/vol_light001" then 
					pPlayer:SetMaterial( "models/effects/vol_light001" )
				else
					pPlayer:SetMaterial( "" )
				end
			end)
		end)
	end

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
	local owner = self:GetOwner()

	if owner:IsValid() then
		if self:GetStateEndTime() <= fCurTime and self:GetState() == 1 or not owner:Alive() or owner:Team() ~= TEAM_UNDEAD or not owner:GetZombieClassTable().CanFeignDeath then

			self:Remove()
			return
		end
		if fCurTime >= self.NextHeal then
			self.NextHeal = fCurTime + 0.25

			if owner:Health() < owner:GetMaxHealth() and not owner:GetZombieClassTable().Boss then
				owner:SetHealth(math.min(owner:GetMaxHealth(), owner:Health() + math.min(owner:GetMaxHealth() * 0.035, 3)))
			end
		end
	end

	self:NextThink(fCurTime)
	return true
end

function ENT:OnRemove()
	local parent = self:GetOwner()
	if parent:IsValid() then
		parent.FeignDeath = nil
		if parent:GetRagdollEntity():IsValid() then
			parent:GetRagdollEntity():Remove()
		end
		parent:DrawWorldModel(true)
		parent:DrawShadow(true)
	--	parent:SetModel(self.OldModel or parent:GetModel())
		parent:Fire( "alpha", 255, 0 )
		parent:TemporaryNoCollide(true)
		parent:SetMaterial( self.OldMaterial or parent:GetMaterial())
	end
end
