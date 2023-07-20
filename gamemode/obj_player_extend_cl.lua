local meta = FindMetaTable("Player")

function meta:FloatingScore(victim, effectname, frags, flags)
	if MySelf == self then
		gamemode.Call("FloatingScore", victim, effectname, frags, flags)
	end
end

function meta:FixModelAngles(velocity)
	local eye = self:EyeAngles()
	self:SetLocalAngles(eye)
	self:SetRenderAngles(eye)
	self:SetPoseParameter("move_yaw", math.NormalizeAngle(velocity:Angle().yaw - eye.y))
end


function meta:RemoveAllStatus(bSilent, bInstant)
end

function meta:RemoveStatus(sType, bSilent, bInstant, sExclude)
end

function meta:HasWon()
	return self:Team() == TEAM_HUMAN and self:GetObserverMode() == OBS_MODE_ROAMING
end


function meta:GetStatus(sType)	
	local ent = self["status_"..sType]
	if ent and ent:IsValid() and ent:GetOwner() == self then return ent end
end

function meta:GiveStatus(sType, fDie)
end

function meta:KnockDown(time)
end

local ViewHullMins = Vector(-8, -8, -8)
local ViewHullMaxs = Vector(8, 8, 8)
function meta:GetThirdPersonCameraPos(origin, angles)
	local allplayers = player.GetAll()
	local tr = util.TraceHull({start = origin, endpos = origin + angles:Forward() * -math.max(36, self:Team() == TEAM_UNDEAD and self:GetZombieClassTable().CameraDistance or self:BoundingRadius()), mask = MASK_SHOT, filter = allplayers, mins = ViewHullMins, maxs = ViewHullMaxs})
	return tr.HitPos + tr.HitNormal * 3
end

function meta:IsFriend()
	return self.m_IsFriend
end

timer.Create("checkfriend", 5, 0, function()
	-- This probably isn't the fastest function in the world so I cache it.
	for _, pl in pairs(player.GetAll()) do
		pl.m_IsFriend = pl:GetFriendStatus() == "friend"
	end
end)

if not meta.SetGroundEntity then
	function meta:SetGroundEntity(ent) end
end

if not meta.Kill then
	function meta:Kill() end
end

if not meta.HasWeapon then
	function meta:HasWeapon(class)
		for _, wep in pairs(self:GetWeapons()) do
			if wep:GetClass() == class then return true end
		end

		return false
	end
end

function meta:SetMaxHealth(num)
	self:SetDTInt(0, math.ceil(num))
end

meta.OldGetMaxHealth = FindMetaTable("Entity").GetMaxHealth
function meta:GetMaxHealth()
	return self:GetDTInt(0)
end

function meta:DoHulls(classid, teamid)
	teamid = teamid or self:Team()
	classid = classid or self:GetZombieClass()

	if teamid == TEAM_UNDEAD then
		self:SetIK(false)

		local classtab = GAMEMODE.ZombieClasses[classid]
		if classtab then
			local scale = (self:IsChampion() and (self:GetChampion() == CHAMP_SMOL and 0.75 or self:GetChampion() == CHAMP_BIG and 1.3 or 1.1) or 1)
			if classtab.ModelScale then
			    if self.m_Gigachad then
					self:SetModelScale(classtab.ModelScale * 1.5 * scale, 0)
				else
					self:SetModelScale(classtab.ModelScale * scale, 0)
				end
			elseif self:GetModelScale() ~= DEFAULT_MODELSCALE then
			    if self.m_Gigachad then
					self:SetModelScale(1.5 * scale, 0)
				else
					self:SetModelScale(DEFAULT_MODELSCALE * scale, 0)
				end
			end
			--if lp and lp:IsValid() and lp == self then
				if self.OutFitPac then
					self:RemovePACPart(self.OutFitPac)
					self.OutFitPac = nil 
				end
				if classtab.Pac3Out then
					pac.SetupENT(self)
					self:AttachPACPart(classtab.Pac3Out)
					self.OutFitPac = classtab.Pac3Out
				end
			--end
			if not classtab.Hull or not classtab.HullDuck then
				self:ResetHull()
			end
			if classtab.ViewOffset then
				self:SetViewOffset(classtab.ViewOffset * scale)
			elseif self:GetViewOffset() ~= DEFAULT_VIEW_OFFSET then
				self:SetViewOffset(DEFAULT_VIEW_OFFSET * scale)
			end
			if classtab.ViewOffsetDucked then
				self:SetViewOffsetDucked(classtab.ViewOffsetDucked * scale)
			elseif self:GetViewOffsetDucked() ~= DEFAULT_VIEW_OFFSET_DUCKED then
				self:SetViewOffsetDucked(DEFAULT_VIEW_OFFSET_DUCKED * scale)
			end
			if classtab.HullDuck then
				self:SetHullDuck(classtab.HullDuck[1], classtab.HullDuck[2])
			end
			if classtab.Hull then
				self:SetHull(classtab.Hull[1], classtab.Hull[2])
			end
			if classtab.StepSize then
				self:SetStepSize(classtab.StepSize)
			elseif self:GetStepSize() ~= DEFAULT_STEP_SIZE then
				self:SetStepSize(DEFAULT_STEP_SIZE)
			end
			if classtab.JumpPower then
				self:SetJumpPower(classtab.JumpPower * scale)
			elseif self:GetJumpPower() ~= DEFAULT_JUMP_POWER then
				self:SetJumpPower(DEFAULT_JUMP_POWER * scale)
			end
			if classtab.Gravity then
				self:SetGravity(classtab.Gravity)
			elseif self:GetGravity() ~= 1 then
				self:SetGravity(1)
			end

			if classtab.ClientsideModelScale then
				self.ClientsideModelScale = Vector(1, 1, 1) * classtab.ClientsideModelScale
				local m = Matrix()
				m:Scale(self.ClientsideModelScale)
				self:EnableMatrix("RenderMultiply", m)
			end
			self.NoCollideAll = classtab.NoCollideAll or (classtab.ModelScale or 1) ~= DEFAULT_MODELSCALE
			--self.NoCollideInside = classtab.NoCollideInside or (classtab.ModelScale or 1) ~= DEFAULT_MODELSCALE
			self.AllowTeamDamage = classtab.AllowTeamDamage
			self.NeverAlive = classtab.NeverAlive
			self.KnockbackScale = classtab.KnockbackScale
			local phys = self:GetPhysicsObject()
			if phys:IsValid() then
				phys:SetMass(classtab.Mass or DEFAULT_MASS)
			end
		end
	else
		self:SetIK(true)

		self:ResetHull()
		self:SetViewOffset(Vector(0, 0, 64))
		self:SetViewOffsetDucked(Vector(0, 0, 32))
		self:SetModelScale(1 * (GAMEMODE.ObjectiveMap and 1 or (self.ScaleModel or 1))) 
		self:SetStepSize(DEFAULT_STEP_SIZE)
		self:SetJumpPower(DEFAULT_JUMP_POWER)
		self:SetGravity(1)

		if self.ClientsideModelScale then
			self.ClientsideModelScale = nil
			self:DisableMatrix("RenderMultiply")
		end
		if self.OutFitPac then
			self:RemovePACPart(self.OutFitPac)
			self.OutFitPac = nil 
		end
		self.NoCollideAll = nil
		--self.NoCollideInside = nil
		self.AllowTeamDamage = nil
		self.NeverAlive = nil
		self.KnockbackScale = nil
		local phys = self:GetPhysicsObject()
		if phys:IsValid() then
			phys:SetMass(DEFAULT_MASS)
		end
	end
end

function meta:GivePenalty(amount)
	surface.PlaySound("ambient/alarms/klaxon1.wav")
end

function meta:SetZombieClass(cl)
	self:CallZombieFunction0("SwitchedAway")

	local classtab =  GAMEMODE.ZombieClasses[cl]
	if classtab then
		self.Class = (classtab.Index or cl)
		self:CallZombieFunction0("SwitchedTo")
	end
end

function meta:GetRateOfPalsy(ft, frightened, health, threshold, gunsway)
	local healthth = health <= threshold and (((threshold - health) / threshold) * 7) or 0

	return ft * (
					(frightened and 14 or healthth) * (MySelf.AimShakeMul or 1) +
					(gunsway and (4 * (MySelf.AimSpreadMul or 1)) or 0)
				)
end

GM.CachedResupplyAmmoType = "scrap"
timer.Create("CacheResupplyAmmoType", 0.3333, 0, function()
	if not GAMEMODE or not MySelf or not MySelf.GetResupplyAmmoType then return end

	GAMEMODE.CachedResupplyAmmoType = MySelf:GetResupplyAmmoType()
end)

net.Receive("zs_penalty", function(length)
	local penalty = net.ReadUInt(16)

	MySelf:GivePenalty(penalty)
end)

net.Receive("zs_dohulls", function(length)
	local ent = net.ReadEntity()
	local classid = net.ReadUInt(8)
	local is_zombie = net.ReadBool()

	if ent:IsValid() then
		ent:DoHulls(classid, is_zombie and TEAM_UNDEAD or TEAM_HUMAN)
	end
end)

net.Receive("zs_zclass", function(length)
	local ent = net.ReadEntity()
	local id = net.ReadUInt(8)

	if ent:IsValidPlayer() then
		ent:SetZombieClass(id)
	end
end)
net.Receive("zs_item_pac", function(length)
	local name = net.ReadString()
	local ent = net.ReadEntity()
	local kill = net.ReadBool()
	--print(name)
	local pac2 = GAMEMODE.ZSInventoryItemData[name].PacModels
	if !pac2 or type(pac2) ~= "table" then return end
	--print(ent:Name())
	if !ent.OutFitPacTrinket then
		ent.OutFitPacTrinket = {}
	end
	if ent.OutFitPacTrinket and ent.OutFitPacTrinket[name] == pac2 and kill then
		ent:RemovePACPart(pac2)
		ent.OutFitPacTrinket[name] = nil 
		--PrintTable(pac2)
	end
	if pac2 and !kill then
		pac.SetupENT(ent)
		ent:AttachPACPart(pac2)
		ent.OutFitPacTrinket[name] = pac2
		--PrintTable(pac2)
	end
end)

net.Receive("zs_floatscore", function(length)
	local victim = net.ReadEntity()
	local effectname = net.ReadString()
	local frags = net.ReadInt(24)
	local flags = net.ReadUInt(8)

	if victim and victim:IsValid() then
		MySelf:FloatingScore(victim, effectname, frags, flags)
	end
end)

net.Receive("zs_floatscore_vec", function(length)
	local pos = net.ReadVector()
	local effectname = net.ReadString()
	local frags = net.ReadInt(24)
	local flags = net.ReadUInt(8)

	MySelf:FloatingScore(pos, effectname, frags, flags)
end)
