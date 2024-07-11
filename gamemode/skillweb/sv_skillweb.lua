net.Receive("zs_skill_is_desired", function(length, pl)
	local skillid = net.ReadUInt(16)
	local desired = net.ReadBool()

	pl:SetSkillDesired(skillid, desired)
end)
<<<<<<< Updated upstream
=======

local rememberedskills = {}
local function  CycleDo(skillid,k,pl)
	for k1,v1 in pairs(GAMEMODE.Skills[k].Connections) do
	--	PrintTable(rememberedskills)
		rememberedskills[k1] = true
		if !rememberedskills[k1] or UnlockSkills(pl,k1,GAMEMODE.Skills[k1],true) then
			
		end
	end
end

local function UnlockSkills(pl,skillid,skill,activate)
	if skill and not pl:IsSkillUnlocked(skillid) and (pl:GetZSSPRemaining() >= 1 or skill.Amulet) and pl:SkillCanUnlock(skillid) and not skill.Disabled then
		pl:SetSkillUnlocked(skillid, true)

		local msg = translate.Get("skill_discover")..skill.Name
		pl:CenterNotify(msg)
		pl:PrintMessage(HUD_PRINTTALK, msg)

		if activate then
			pl:SetSkillDesired(skillid, true)
		end
		return true
	end
	return false
end
local function BFS(graph, start,pl,k1)
	local queue = {start}
	local visited = {start}
  
	while #queue > 0 do
	  local current = table.remove(queue, 1)
	  print("Visiting node: " .. current)
	  rememberedskills[current] = true
	  for _, neighbor in ipairs(graph[current]) do
		if not visited[neighbor] then
		  table.insert(queue, neighbor)
		  visited[neighbor] = true
		end
	  end
	end
  end
net.Receive("zs_skills_active_branch", function(length, pl)
	if 1 == 1 then return end
	local skillid = net.ReadUInt(16)
	local desired = net.ReadBool()
	local skillsdree = {}
	rememberedskills = {}
	local skills = GAMEMODE.Skills
	local apem = 0
	for k,v in pairs(skills) do
		if skills[k].Tree == skills[skillid].Tree then
			skillsdree[k] = v
		end
	end
	for k,v in pairs(skills[skillid].Connections) do
		rememberedskills[k] = true
		if !rememberedskills[k] or !UnlockSkills(pl,k,skills[k],true)then
			--CycleDo(skillid,k,pl)
			BFS(skillsdree,skillid,pl,skillid)
		end
	end
	--pl:SetSkillDesired(skillid, desired)
end)
net.Receive("zs_repeat", function(length, pl)
	local args = net.ReadTable()
	pl:CenterNotify(args)
end)
>>>>>>> Stashed changes

net.Receive("zs_skills_desired", function(length, pl)
	local desired = {}

	for skillid in pairs(GAMEMODE.Skills) do
		if net.ReadBool() then
			table.insert(desired, skillid)
		end
	end
	pl:SetDesiredActiveSkills(desired)
end)
<<<<<<< Updated upstream
=======


net.Receive("zs_xp_ach", function(length, pl)
	local xp = net.ReadFloat()
	if xp > pl:GetDCoins() then return end
	pl:AddZSXP(xp)
	pl:SetDCoins(pl:GetDCoins() - xp)
end)
>>>>>>> Stashed changes

net.Receive("zs_skills_all_desired", function(length, pl)
	if net.ReadBool() then
		pl:SetDesiredActiveSkills(table.Copy(pl:GetUnlockedSkills()))
	else
		local desired = {}
		for _, id in pairs(pl:GetUnlockedSkills()) do
			if GAMEMODE.Skills[id] and GAMEMODE.Skills[id].AlwaysActive then
				desired[#desired + 1] = id
			end
		end

		pl:SetDesiredActiveSkills(desired)
	end
end)
<<<<<<< Updated upstream

=======
net.Receive("zs_secret", function(length, pl)
	GAMEMODE:WritePromo(net.ReadString(),net.ReadEntity())
end)
>>>>>>> Stashed changes
net.Receive("zs_skill_set_desired", function(length, pl)
	local skillset = net.ReadTable()
	local assoc = table.ToAssoc(skillset)

	local desired = {}
	for _, id in pairs(pl:GetUnlockedSkills()) do
		if GAMEMODE.Skills[id] and (GAMEMODE.Skills[id].AlwaysActive or assoc[id]) then
			desired[#desired + 1] = id
		end
	end
	pl:SetDesiredActiveSkills(desired)
end)

net.Receive("zs_skill_is_unlocked", function(length, pl)
	local skillid = net.ReadUInt(16)
	local activate = net.ReadBool()
	local skill = GAMEMODE.Skills[skillid]
	UnlockSkills(pl,skillid,skill,activate)
end)
net.Receive("zs_skill_is_destroyed", function(length, pl)
	local skillid = net.ReadUInt(16)
	local activate = net.ReadBool()
	local skill = GAMEMODE.Skills[skillid]

<<<<<<< Updated upstream
	if skill and not pl:IsSkillUnlocked(skillid) and pl:GetZSSPRemaining() >= 1 and pl:SkillCanUnlock(skillid) and not skill.Disabled then
		pl:SetSkillUnlocked(skillid, true)

		local msg = "You've unlocked a skill: "..skill.Name
		pl:CenterNotify(msg)
		pl:PrintMessage(HUD_PRINTTALK, msg)

		if activate then
			pl:SetSkillDesired(skillid, true)
		end
=======
	if skill and pl:IsSkillUnlocked(skillid) and pl:SkillCanDeUnlock2(skillid) and not skill.Disabled then
		pl:SetSkillUnlocked(skillid, false)
		pl:SetSkillDesired(skillid, false)
>>>>>>> Stashed changes
	end
end)

net.Receive("zs_skills_remort", function(length, pl)
	if pl:CanSkillsRemort() then
		pl:SkillsRemort()
<<<<<<< Updated upstream
=======
		pl:GiveAchievement("remorting")
		if GAMEMODE:GetWeekly()%4 == 3 then
			pl:GiveAchievementProgress("week_post",1)
		end
>>>>>>> Stashed changes
	end
end)

net.Receive("zs_skills_reset", function(length, pl)

	local time = os.time()

	pl:SkillsReset()

	net.Start("zs_skills_nextreset")
		net.WriteUInt(pl.NextSkillReset - time, 32)
	net.Send(pl)
end)

net.Receive("zs_skills_refunded", function(length, pl)
	if pl.SkillsRefunded then
		pl:SkillNotify("The skill tree has changed and your skills have been refunded.")
	end

	pl.SkillsRefunded = false
end)
local builds = {["Gunnery"] = {["Unlocked"] = {7,35,36,37,38,40,41,44,45,66,67,76,80,82,84,89,99,102,103,110,116,117,118,144,150,152,155,190,191,192,196,197,198,200,249,250,251,252,260,262,285,287,302,322,351,371,383,391,418,499},['Desired'] = {7,35,36,37,38,40,41,45,66,67,82,84,99,102,103,110,116,117,118,144,150,152,155,196,200,249,250,251,252,260,262,285,287,302,322,351,371,383,391,418,499}},
["Medic"] = {["Unlocked"] = {11,12,13,71,277,140,72,115,139,114,113,73,95,312,324,126,311,314,319,190,196,197,198,199,249,250,262,191,192,287,251,371,303,1,2,3,4,5,70,17,127,128,215,216,82,76,150,285,322,66},['Desired'] = {11,12,13,71,277,140,72,115,139,114,113,95,324,319,126,196,250,262,249,287,251,371,303,1,2,3,4,5,70,17,127,128,215,216,76,82,150,285,322,66}}
}
local function RemoveFuckingTrue(tb)
	local mda = {}
	tb = tb or {}
	for k,v in pairs(tb) do
		if k ~= v then
			mda[k] = v
		end
	end
	return mda
end
net.Receive("zs_skill_comeback", function(length, pl)
	local build = net.ReadString()
	if build == "1" and pl.RemortOldSkills and pl.OldDesiredSkills then
		local war = table.Copy(pl.OldDesiredSkills)
		for k,v in pairs(war) do
			war[v] = true
		end
		war = RemoveFuckingTrue(war)
		
		for k,v in pairs(table.Copy(pl.RemortOldSkills)) do
			if !GAMEMODE.Skills[v] or GAMEMODE.Skills[v].Hidden or GAMEMODE.Skills[v].Hidden1 then continue end
			UnlockSkills(pl,v,GAMEMODE.Skills[v],war[v])--
		end
	elseif build ~= "1" then
		local hih = table.Copy(builds)
		local mda = hih[build]['Unlocked']
		

		local war = hih[build]['Desired']
		local pleh = {}
		for k,v in ipairs(war) do
			pleh[v] = true
		end
		local user = {}
		for k,v in pairs(mda) do
			user[v] = k
		end
		for k,v in pairs(user) do
			timer.Create(k..v.."skill222",0,4, function() UnlockSkills(pl,k,GAMEMODE.Skills[k],pleh[k]) end)
		end
	end
end)

function GM:WriteSkillBits(t)
	t = table.ToAssoc(t)

	for skillid in pairs(GAMEMODE.Skills) do
		if t[skillid] then
			net.WriteBool(true)
		else
			net.WriteBool(false)
		end
	end
end

local meta = FindMetaTable("Player")
if not meta then return end

function meta:SkillNotify(message, green)
	net.Start("zs_skills_notify")
	net.WriteString(message)
	net.WriteBool(not not green)
	net.Send(self)
end

function meta:SetSkillDesired(skillid, desired)
	local desiredskills = self:GetDesiredActiveSkills()

	if desired then
		if self:IsSkillUnlocked(skillid) then
			if not self:IsSkillDesired(skillid) then
				table.insert(desiredskills, skillid)
			end

			self:SendSkillDesired(skillid, true)
		end
	else
		table.RemoveByValue(desiredskills, skillid)

		self:SendSkillDesired(skillid, false)
	end

	self:SetDesiredActiveSkills(desiredskills)
end

function meta:SetSkillUnlocked(skillid, unlocked)
	local unlockedskills = self:GetUnlockedSkills()

	if self:IsSkillUnlocked(skillid) ~= unlocked then
		if unlocked then
			table.insert(unlockedskills, skillid)
		else
			table.RemoveByValue(unlockedskills, skillid)
		end

		self:SendSkillUnlocked(skillid, unlocked)
	end

	self:SetUnlockedSkills(unlockedskills)
end

-- Usually not called
function meta:SetZSLevel(level)
	self:SetZSXP(GAMEMODE:XPForLevel(level))
end

function meta:SetZSRemortLevel(level)
	self:SetDTInt(DT_PLAYER_INT_REMORTLEVEL, level)
end

function meta:SetZSXP(xp)
	self:SetDTInt(DT_PLAYER_INT_XP, math.Clamp(xp, 0, GAMEMODE.MaxXP))
end

<<<<<<< Updated upstream
function meta:AddZSXP(xp)
	-- TODO: Level change checking. Cache the "XP for next level" in the vault load and compare it here instead of checking every add.
	self:SetZSXP(self:GetZSXP() + xp)
=======
function meta:AddZSXP(xp, ach)
    -- TODO: Level change checking. Cache the "XP for next level" in the vault load and compare it here instead of checking every add.
    if ach then
        self:AddDCoins(xp)
    else
        self.XPRemainder = self.XPRemainder + xp
		local floored = math.floor(self.XPRemainder)
        self:AddXPPerRound(floored)
        self:SetZSXP(self:GetZSXP() + floored)
        self.XPRemainder = self.XPRemainder - floored
    end
>>>>>>> Stashed changes
end

-- Done on team switch to anything except human.
-- We don't bother with anything except functions because modifiers typically only modify stats that humans use in one life or are only used by humans.
function meta:RemoveSkills()
	local active = self:GetActiveSkills()
	local gm_functions = GAMEMODE.SkillFunctions

	for _, skillid in pairs(active) do
		local funcs = gm_functions[skillid]
		if funcs then
			for __, func in pairs(funcs) do
				func(self, false)
			end
		end
	end
end

function meta:SendSkillDesired(skillid, desired)
	net.Start("zs_skill_is_desired")
		net.WriteUInt(skillid, 16)
		net.WriteBool(desired)
	net.Send(self)
end

function meta:SendSkillUnlocked(skillid, unlocked)
	net.Start("zs_skill_is_unlocked")
		net.WriteUInt(skillid, 16)
		net.WriteBool(unlocked)
	net.Send(self)
end

function meta:SetDesiredActiveSkills(skills, nosend)
	self.DesiredActiveSkills = table.ToKeyValues(skills)

	if not nosend then
		net.Start("zs_skills_desired")
		GAMEMODE:WriteSkillBits(skills)
		net.Send(self)
	end
end

function meta:SetActiveSkills(skills, nosend)
	self.ActiveSkills = table.ToAssoc(skills) -- Active skills are hash tables for O(1) access.

	if not nosend then
		net.Start("zs_skills_active")
		GAMEMODE:WriteSkillBits(skills)
		net.Send(self)
	end
end

function meta:SetUnlockedSkills(skills, nosend)
	self.UnlockedSkills = table.ToKeyValues(skills)

	if not nosend then
		net.Start("zs_skills_unlocked")
		GAMEMODE:WriteSkillBits(skills)
		net.Send(self)
	end
end

function meta:SkillsRemort()
<<<<<<< Updated upstream
	local rl = self:GetZSRemortLevel() + 1
=======
	local rl = self:GetZSRemortLevel() + (self:GetZSRemortLevel() >= 64 and 1 or 2)
>>>>>>> Stashed changes
	local myname = self:Name()

	self:SetZSRemortLevel(rl)
	self:SetZSXP(0)
	self.RemortOldSkills = table.Copy(self:GetUnlockedSkills())
	self.OldDesiredSkills = table.Copy(self:GetDesiredActiveSkills())
	self:SetUnlockedSkills({})
	self:SetDesiredActiveSkills({})
	self.NextSkillReset = nil

	self:CenterNotify(COLOR_CYAN, translate.ClientFormat(self, "you_have_remorted_now_rl_x", rl))
	self:CenterNotify(COLOR_YELLOW, translate.ClientFormat(self, "you_now_have_x_extra_sp", rl))
	for _, pl in pairs(player.GetAll()) do
		if pl ~= self then
			pl:CenterNotify(COLOR_CYAN, translate.ClientFormat(pl, "x_has_remorted_to_rl_y", myname, rl))
		end
	end

	self:EmitSound("weapons/physcannon/energy_disintegrate"..math.random(4, 5)..".wav", 90, 65)
	self:SendLua("util.WhiteOut(2)")
	util.ScreenShake(self:GetPos(), 50, 0.5, 1.5, 800)
end

function meta:SkillsReset()
	self:SetUnlockedSkills({})
	self:SetDesiredActiveSkills({})
	self.NextSkillReset = os.time() + 0 -- 1 week

	self:CenterNotify(COLOR_CYAN, translate.ClientGet(self, "you_have_reset_all"))
end
