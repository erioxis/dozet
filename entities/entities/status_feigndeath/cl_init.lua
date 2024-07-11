INC_CLIENT()

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

function ENT:OnInitialize()
	
	hook.Add("Move", self, self.Move)
	hook.Add("CreateMove", self, self.CreateMove)
	hook.Add("ShouldDrawLocalPlayer", self, self.ShouldDrawLocalPlayer)
	local owner = self:GetOwner()
	self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 80))

	if owner:IsValid() then
		owner.FeignDeath = self
		owner.NoCollideAll = true
		owner:CollisionRulesChanged()

		self.CommandYaw = owner:GetAngles().yaw
		owner:CallWeaponFunction("KnockedDown", self, false)
		owner:CallZombieFunction("KnockedDown", self, false)
	end
end

function ENT:CreateMove(cmd)
	if MySelf ~= self:GetOwner() then return end

	local ang = cmd:GetViewAngles()
	ang.yaw = self.CommandYaw or ang.yaw
	cmd:SetViewAngles(ang)

	if bit.band(cmd:GetButtons(), IN_JUMP) ~= 0 then
		cmd:SetButtons(cmd:GetButtons() - IN_JUMP)
	end
end

function ENT:ShouldDrawLocalPlayer(pl)
	if pl ~= self:GetOwner() then return end

	return true
end

function ENT:OnRemove()
	local owner = self:GetOwner()
	if owner:IsValid() then
		owner.FeignDeath = nil
		owner.NoCollideAll = owner:Team() == TEAM_UNDEAD and owner:GetZombieClassTable().NoCollideAll
		owner:CollisionRulesChanged()
	end
end

function ENT:DrawTranslucent()
	local owner = self:GetOwner()
	if MySelf ~= owner then return end

	local pos = owner:GetPos() + EyeAngles():Right() * 32
	local col = table.Copy(COLOR_GREEN)
	if self:GetState() == 1 then
		col.a = math.max(self:GetStateEndTime() - CurTime(), 0) * 255
	else
		col.a = (1 - math.max(self:GetStateEndTime() - CurTime(), 0)) * 255
	end
	local ang = owner:GetAngles()
	ang.pitch = 0
	ang.roll = 0

	cam.IgnoreZ(true)
	cam.Start3D2D(pos, ang, 0.1)
		draw.SimpleTextBlur(translate.Get("press_sprint_to_get_up"), "ZS3D2DFont2Small", 0, 0, col, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	cam.End3D2D()
	cam.IgnoreZ(false)
end
function ENT:Think()
	local ct = CurTime()
	local owner = self:GetOwner()
	if owner:IsValid() and 0 < owner:Health() then
		local rag = owner:GetRagdollEntity()
		if rag and rag:IsValid() then
			local endtime = self:GetDTFloat(1)
			if endtime - 0.65 <= ct then
				local delta = math.max(0.01, endtime - ct)
				for i = 0, rag:GetPhysicsObjectCount() do
					local translate = owner:TranslatePhysBoneToBone(i%4)
					if translate and 0 < translate then
						local pos, ang = owner:GetBonePosition(translate)
						if pos and ang then
							local phys = rag:GetPhysicsObjectNum(i%4)
							if phys and phys:IsValid() then
								phys:Wake()
								phys:ComputeShadowControl({secondstoarrive = delta, pos = pos, angle = ang, maxangular = 1000, maxangulardamp = 10000, maxspeed = 5000, maxspeeddamp = 1000, dampfactor = 0.85, teleportdistance = 100, deltatime = FrameTime()})
							end
						end
					end
				end
			else
				local phys = rag:GetPhysicsObject()
				if phys and phys:IsValid() then
					phys:Wake()
					phys:ComputeShadowControl({secondstoarrive = 0.05, pos = owner:GetPos() + Vector(0,0,16), angle = rag:GetPhysicsObject():GetAngles(), maxangular = 2000, maxangulardamp = 10000, maxspeed = 5000, maxspeeddamp = 1000, dampfactor = 0.85, teleportdistance = 200, deltatime = FrameTime()})
				end
			end
		end
	end

	self:NextThink(ct)
	return true
end

function ENT:Draw()
end