function GM:PreOnSigilCorrupted(ent, dmginfo)
end

function GM:OnSigilCorrupted(ent, dmginfo)
	net.Start("zs_sigilcorrupted")
		net.WriteUInt(self:NumCorruptedSigils(), 8)
	net.Broadcast()
end

function GM:PreOnSigilUncorrupted(ent, dmginfo)
end

function GM:OnSigilUncorrupted(ent, dmginfo)
	net.Start("zs_sigiluncorrupted")
		--net.WriteUInt(self:NumCorruptedSigils(), 8)
	net.Broadcast()
end

local function SortDistFromLast(a, b)
	return a.d < b.d
end

local validity_trace = {
	start = Vector(0, 0, 0), endpos = Vector(0, 0, 0), mins = Vector(-18, -18, 0), maxs = Vector(18, 18, 2), mask = MASK_SOLID_BRUSHONLY
}
function GM:CreateSigils(secondtry, rearrange,corrupted)
	local alreadycreated = self:NumSigils()

	if self.ZombieEscape or self.ObjectiveMap
	or self:IsClassicMode() or self.PantsMode or self:IsBabyMode() then
		self:SetUseSigils(false)
		return
	end

	if alreadycreated >= self.MaxSigils and not rearrange and not corrupted then return end

	local nodes = {}

	-- Maybe the mapper made some!
	local vec
	local mapplacednodes = ents.FindByClass("info_sigilnode")
	if #mapplacednodes > 0 and !self.ProfilerIsPreMade then -- or maybe they're a twit
		for _, placednode in pairs(mapplacednodes) do
			nodes[#nodes + 1] = {v = placednode:GetPos(), en = placednode}
		end
	else
		-- Copy from profile
		for _, node in pairs(self.ProfilerNodes) do
			-- Check to see if this node is stuck in something.
			validity_trace.start:Set(node)
			validity_trace.start.z = node.z + 1
			validity_trace.endpos:Set(node)
			validity_trace.endpos.z = node.z + 73
			if util.TraceHull(validity_trace).Hit then
				print("bad sigil node at", node)
			else
				vec = Vector(0, 0, 0)
				vec:Set(node)
				nodes[#nodes + 1] = {v = vec}
			end
		end
	end

	--[[if secondtry then
		local needed = self.MaxSigils - #nodes - alreadycreated
		if needed > 0 then
			-- We seem to be missing some nodes...
			-- This might happen if nobody seeds the map and the round begins.
			for i = 1, needed do
				local spawns = team.GetSpawnPoint(TEAM_HUMAN)
				if #spawns > 0 then
					local spawnid = math.random(#spawns)
					local spawn = spawns[spawnid]

					nodes[#nodes + 1] = {v = spawn:GetPos()}
					spawn.Disabled = true
				end
			end
		end
	end]]

	local spawns = team.GetSpawnPoint(TEAM_UNDEAD)
	for i = 1 + ((rearrange or corrupted) and 0 or alreadycreated), self.MaxSigils do
		local id
		local sigs = ents.FindByClass("prop_obj_sigil")
		local numsigs = #sigs
		if rearrange then
			for _, sig in pairs(sigs) do
				sig.NodePos = Vector(99999, 99999, 99999)
			end
		end

		local force
		for _, n in pairs(nodes) do
			if n.en and n.en.ForceSpawn then
				force = n
			end

			n.d = 999999

			if numsigs == 0 then
				for __, spawn in pairs(spawns) do
					n.d = math.min(n.d, n.v:Distance(spawn:GetPos() or self:GetRandomPosition(self:GetRandomPoint_Mesh())))
				end
			else
				for __, sig in pairs(sigs) do
					n.d = math.min(n.d, n.v:Distance(sig.NodePos or self:GetRandomPosition(self:GetRandomPoint_Mesh())))
				end
			end

			local tr = util.TraceLine({start = n.v + Vector(0, 0, 8), endpos = n.v + Vector(0, 0, 512), mask = MASK_SOLID_BRUSHONLY})
			n.d = n.d * (2 - tr.Fraction)
		end

		-- Sort the nodes by their distances.
		table.sort(nodes, SortDistFromLast)

		-- Now select a node using an exponential weight.
		-- We use a random float between 0 and 1 and use exponential on it.
		-- This way we're much more likely to get a lower index but a higher index is still possible.
		id = math.Rand(0, 0.7) ^ 0.3
		id = math.Clamp(math.ceil(id * #nodes), 1, #nodes)
		if force then
			id = table.KeyFromValue(nodes, force)
		end

		-- Remove the chosen point from the temp table and make the sigil.
		local node = nodes[id]
		if node then
			local point = node.v
			table.remove(nodes, id)

			local ent = rearrange and sigs[i] or ents.Create("prop_obj_sigil")
			if ent:IsValid() then
				ent:SetPos(point)
				if not rearrange then
					ent:Spawn()
				end
				ent:SetSigilCorrupted(corrupted)
				ent.NaturallySpawned = true
				ent.NodePos = point
			end
		end
	end

	self:SetUseSigils(self:NumSigils() > 0)
end
function GM:GetRandomPoint_Mesh()
	if !D3bot.MapNavMesh then return 1,Vector(0,0,0) end
	local pos = Vector(0,0,0)
	local safenum = 0
	local saved = 1
	while true do
		local rand = math.random(1,#D3bot.MapNavMesh.NodeById)
		safenum = safenum + 1
		if D3bot.MapNavMesh.NodeById[rand] then
			pos = D3bot.MapNavMesh.NodeById[rand].Pos
			saved = rand
			break
		end
		if safenum > 25 then
			break
		end
	end
	return saved, pos
end
function GM:GetRandomPosition(saved, pos)
	if !D3bot.MapNavMesh then return Vector(0,0,0) end
	local node = D3bot.MapNavMesh.NodeById[saved]
	if node and node.HasArea then
		local params = node.Params
		if params.AreaYMin then
			pos.Y = pos.Y + math.random(params.AreaYMin-pos.Y,params.AreaYMax-pos.Y)
		end
		if params.AreaXMin then
			pos.X = pos.X + math.random(params.AreaXMin-pos.X,params.AreaXMax-pos.X)
		end
	end
	return pos
end
function GM:CreateRandomObjectPos(class, numbers,wep)
	if !D3bot.MapNavMesh then return end
	for i=1,(numbers or 1) do
		local saved, pos = self:GetRandomPoint_Mesh()
		local ent = ents.Create((class or "prop_obj_anti_sigil"))
		if ent:IsValid() then
			local pos = self:GetRandomPosition(saved, pos)
			if wep then
				ent:SetWeaponType(wep)
				ent.NoLootsForTop = true
			end
			ent:SetPos(Vector(pos.X,pos.Y,pos.Z+4))
		--	Entity(1):SetPos(Vector(pos.X,pos.Y,pos.Z))
			ent.SpawnedOnWave = self:GetWave()
			ent:Spawn()
		end
	end
end

function GM:SetUseSigils(use)
	--if self:GetUseSigils() ~= use then
		self.UseSigils = use
		SetGlobalBool("sigils", use)
	--end
end

function GM:GetUseSigils(use)
	return self.UseSigils
end
