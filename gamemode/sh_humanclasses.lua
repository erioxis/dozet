GM.RevertableZombieClasses = {}

function GM:HumanIsClassUnlocked(classname)
	local classtab = self.HumanClasses[classname]
	if not classtab then return false end

	if classtab.Boss then return true end

	if classtab.IsClassUnlocked then
		local ret = classtab:IsClassUnlocked()
		if ret ~= nil then return ret end
	end

	if classtab.Locked then return false end

	return classtab.Unlocked
	or classtab.Wave and self:GetWave() >= classtab.Wave
	or classtab.Wave and not self:GetWaveActive() and self:GetWave() + 1 >= classtab.Wave
	or classtab.Sanity and self:GetUseSigils() and self:NumSigilsCorrupted() / self.MaxSigils >= classtab.Sanity
	--or classtab.Sanity and self:GetUseSigils() and self:GetSigilsDestroyed() / self.MaxSigils >= classtab.Sanity
end


local function ReorderHumanClassesSort(a, b)
	if (a.Order or b.Order) and a.Order ~= b.Order then
		return (a.Order or 255) < (b.Order or 255)
	end

	if (a.Wave or b.Wave) and a.Wave ~= b.Wave then
		return (a.Wave or 255) < (b.Wave or 255)
	end

	return a.Name < b.Name
end


function GM:RegisterHumanClass(name, tab)
	local gm = GAMEMODE or GM

	if tab.Wave then tab.Wave = math.floor(tab.Wave * self.NumberOfWaves) end
	table.insert(gm.HumanClasses, tab)
	tab.Index = #gm.HumanClasses
	if CLIENT then
		tab.Icon = tab.Icon or "zombiesurvival/killicons/genericundead"
	end

	if tab.IsDefault then
		gm.DefaultHumanClasses = tab.Index
	end

	tab.TranslationName = tab.TranslationName or tab.Name
	tab.Points = tab.Points or 0

	gm.HumanClasses[name] = tab
end

function GM:RevertHumanClasses()
	self.HumanClasses = table.Copy(self.RevertableHumanClasses)
end
function GM:ReorderHumanClasses()
	table.sort(self.HumanClasses, ReorderHumanClassesSort)
	for k, v in pairs(self.HumanClasses) do
		if type(k) == "number" then
			self.HumanClasses[v.Name] = v
			v.Index = k

			if v.IsDefault then
				self.DefaultHumanClass = k
			end
		end
	end
end


function GM:RegisterHumanClasses()
	self.HumanClasses = {}
	self.DefaultHumanClasses = self.DefaultHumanClasses or 1

	local included = {}

	local classfiles, classdirectories = file.Find(self.FolderName.."/gamemode/humanclasses/*", "LUA")
	table.sort(classfiles)
	table.sort(classdirectories)

	for i, filename in ipairs(classfiles) do
		if string.sub(filename, -4) == ".lua" then -- Just in case
			HCLASS = {}

			AddCSLuaFile("humanclasses/"..filename)
			include("humanclasses/"..filename)

			if HCLASS.Name then
				self:RegisterHumanClass(HCLASS.Name, HCLASS)
			else
				ErrorNoHalt("HCLASS "..filename.." has no 'Name' member!")
			end

			included[filename] = HCLASS
			HCLASS = nil
		end
	end

	for i, foldername in ipairs(classdirectories) do
		local basefn = "humanclasses/"..foldername.."/"

		HCLASS = {}
		if CLIENT then
			include(basefn.."client.lua")
		end
		if SERVER then
			AddCSLuaFile(basefn.."client.lua")
			include(basefn.."server.lua")
		end

		if HCLASS.Name then
			self:RegisterHumanClass(HCLASS.Name, HCLASS)
		else
			ErrorNoHalt("HCLASS "..foldername.." has no 'Name' member!")
		end

		included[foldername..".lua"] = HCLASS
		HCLASS = nil
	end

	for k, v in pairs(self.HumanClasses) do
		local base = v.Base
		if base then
			base = base..".lua"
			if included[base] then
				local old_BetterVersion = v.BetterVersion
				local old_Infliction = v.Infliction
				local old_Hidden = v.Hidden
				local old_Unlocked = v.Unlocked
				local old_Disabled = v.Disabled
				local old_Order = v.Order
				local old_IsDefault = v.IsDefault

				table.Inherit(v, included[base])

				-- Don't inherit these.
				v.BetterVersion = old_BetterVersion
				v.Infliction = old_Infliction
				v.Hidden = old_Hidden
				v.Unlocked = old_Unlocked
				v.Disabled = old_Disabled
				v.Order = old_Order
				v.IsDefault = old_IsDefault
			else
				ErrorNoHalt("HCLASS "..tostring(v.Name).." uses base class "..base.." but it doesn't exist!")
			end
		end

		if v.Unlocked or v.Wave == 0 then
			v.UnlockedNotify = true
		end
	end

	for k, v in pairs(self.HumanClasses) do
		if v.BetterVersion and self.HumanClasses[v.BetterVersion] then
			self.HumanClasses[v.BetterVersion].BetterVersionOf = v.Name
		end
	end

	self:ReorderHumanClasses()

	self.RevertableHumanClasses = table.Copy(self.HumanClasses)
end

if not GAMEMODE or (GAMEMODE and not GAMEMODE.HumanClasses) then
	GM:RegisterHumanClasses()
end
