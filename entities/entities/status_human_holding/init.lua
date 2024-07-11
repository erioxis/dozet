INC_SERVER()

function ENT:Initialize()
	hook.Add("Move", self, self.Move)

	self:DrawShadow(false)

	local owner = self:GetOwner()
	if owner:IsValid() and owner:IsPlayer() then
		owner.status_human_holding = self

		owner:DrawWorldModel(false)

		local info = GAMEMODE:GetHandsModel(owner)
		if info then
			self:SetModel(info.model)
			self:SetSkin(info.skin)
			self:SetBodyGroups(info.body)
		end

		local wep = owner:GetActiveWeapon()
		if wep:IsValid() then
			wep:SendWeaponAnim(ACT_VM_HOLSTER)
			if wep.SetIronsights then
				wep:SetIronsights(false)
			end
		end
	else
		self:SetModel("models/weapons/c_arms_citizen.mdl")
	end

	local object = self:GetObject()
	if object:IsValid() then
		object.IgnoreMeleeTeam = self:GetOwner():Team()
		object.IgnoreTraces = true
		object.IgnoreBullets = true


		for _, ent in ipairs(ents.FindByClass("logic_pickupdrop")) do
			if ent.EntityToWatch == object:GetName() and ent:IsValid() then
				ent:Input("onpickedup", owner, object, "")
			end
		end

		for _, ent in ipairs(ents.FindByClass("point_propnocollide")) do
			if ent:IsValid() and ent:GetProp() == object then
				ent:Remove()
			end
		end

		local objectphys = object:GetPhysicsObject()
		if objectphys:IsValid() then
			objectphys:AddGameFlag(FVPHYSICS_NO_IMPACT_DMG)
			objectphys:AddGameFlag(FVPHYSICS_NO_NPC_IMPACT_DMG)

			


			self:SetObjectMass(objectphys:GetMass())

			object.PreHoldCollisionGroup = object.PreHoldCollisionGroup or object:GetCollisionGroup()
			object.PreHoldAlpha = object.PreHoldAlpha or object:GetAlpha()
			object.PreHoldRenderMode = object.PreHoldRenderMode or object:GetRenderMode()

			objectphys:AddGameFlag(FVPHYSICS_PLAYER_HELD)
			object._OriginalMass = objectphys:GetMass()

			objectphys:EnableGravity(false)
			objectphys:SetMass(50)
			
			if object:GetOwner() then
				self.OldOwner = object:GetOwner()
			end
			object:SetOwner(object:GetClass() ~= 'prop_databox' and object:GetOwner() or owner)
			if object:GetCollisionGroup() ~= COLLISION_GROUP_WORLD then
				object:SetCollisionGroup(COLLISION_GROUP_WEAPON)
			end
			object:SetRenderMode(RENDERMODE_TRANSALPHA)
			object:SetAlpha(180)

			self.StartX = owner.InputMouseX or 0
			self.StartY = owner.InputMouseY or 0

			local children = object:GetChildren()
			for _, child in pairs(children) do
				if not child:IsValid() then continue end

				child.PreHoldCollisionGroup = child.PreHoldCollisionGroup or child:GetCollisionGroup()
				if child:IsPhysicsModel() then -- Stops child sprites from getting fucked up rendering
					child.PreHoldAlpha = child.PreHoldAlpha or child:GetAlpha()
					child.PreHoldRenderMode = child.PreHoldRenderMode or child:GetRenderMode()

					child:SetAlpha(110)
					child:SetRenderMode(RENDERMODE_TRANSALPHA)
				end

				child:SetCollisionGroup(COLLISION_GROUP_WEAPON)
				child:CollisionRulesChanged()
			end

			object:CollisionRulesChanged()
			

		end
	end
end

local function DoubleCheck(object)
	if not IsValid(object) then return end

	for _, status in ipairs(ents.FindByClass("status_human_holding")) do
		if status:IsValid() and not status.Removing and status:GetObject() == object then
			return
		end
	end

	object.IgnoreMeleeTeam = nil
	object.IgnoreTraces = nil
	object.IgnoreBullets = nil
end

function ENT:OnRemove()
	if self.Removing then return end
	self.Removing = true

	local owner = self:GetOwner()
	if owner:IsValid() then
		--owner.status_human_holding = nil

		owner:DrawWorldModel(true)

		if owner:Alive() and owner:Team() == TEAM_HUMAN then
			local wep = owner:GetActiveWeapon()
			if wep:IsValid() then
				wep:SendWeaponAnim(ACT_VM_DRAW)
			end
		end
	end

	local object = self:GetObject()
	if object:IsValid() then
		object.IgnoreMelee = nil
		object.IgnoreTraces = nil
		object.IgnoreBullets = nil

		timer.Simple(0.1, function() DoubleCheck(object) end)

		local objectphys = object:GetPhysicsObject()
		if objectphys:IsValid() then
			objectphys:ClearGameFlag(FVPHYSICS_PLAYER_HELD)
			objectphys:ClearGameFlag(FVPHYSICS_NO_IMPACT_DMG)
			objectphys:ClearGameFlag(FVPHYSICS_NO_NPC_IMPACT_DMG)
			objectphys:EnableGravity(true)
			if object._OriginalMass then
				objectphys:SetMass(object._OriginalMass)
				object._OriginalMass = nil
			end

			if not self:GetIsHeavy() then
				if not object:GhostAllPlayersInMe(4, true) then
					object:SetCollisionGroup(object.PreHoldCollisionGroup or COLLISION_GROUP_NONE)
				end
				object:SetAlpha(object.PreHoldAlpha or 255)
				object:SetRenderMode(object.PreHoldRenderMode or RENDERMODE_NORMAL)

				local children = object:GetChildren()
				for _, child in pairs(children) do
					if not child:IsValid() then continue end

					child:SetCollisionGroup(child.PreHoldCollisionGroup or COLLISION_GROUP_NONE)
					if child:IsPhysicsModel() then
						child:SetAlpha(child.PreHoldAlpha or 255)
						child:SetRenderMode(child.PreHoldRenderMode or RENDERMODE_NORMAL)
					end

					child:CollisionRulesChanged()
				end
			end
			object:SetOwner((self.OldOwner or NULL))
			object:CollisionRulesChanged()
		end

		object._LastDroppedBy = owner
		object._LastDropped = CurTime()

		for _, ent in ipairs(ents.FindByClass("logic_pickupdrop")) do
			if ent.EntityToWatch == object:GetName() and ent:IsValid() then
				ent:Input("ondropped", owner, object, "")
			end
		end
	end
end

concommand.Add("_zs_rotateang", function(sender, command, arguments)
	local x = tonumbersafe(arguments[1])
	local y = tonumbersafe(arguments[2])

	if x and y then
--		angle:RotateAroundAxis(angle:Right(),ho)
--angle:RotateAroundAxis(angle:Up(),range-(range*2)*((num)/maxNum))
		sender.InputMouseX = math.NormalizeAngle(x)--sender.InputMouseX + math.Clamp(x * 0.02, -180, 180)
		sender.InputMouseY = math.NormalizeAngle(y)--sender.InputMouseY + math.Clamp(y * 0.02, -180, 180) --sender.InputMouseY + math.Clamp(y * 0.02, -180, 180)
		--sender.InputMouseX = math.Clamp(x * 0.02, -180, 180)
		--sender.InputMouseY = math.Clamp(y * 0.02, -180, 180)
	end
end)

function ENT:Think()
	return GLOBAL_ROTATOR(self)
end

