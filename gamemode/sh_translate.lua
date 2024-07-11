-- Translation library by William Moodhe
-- Feel free to use this in your own addons.
<<<<<<< Updated upstream
-- See the languages folder to add your own languages.
=======
>>>>>>> Stashed changes

translate = {}

local Languages = {}
local Translations = {}
local AddingLanguage
local DefaultLanguage = "en"
local CurrentLanguage = DefaultLanguage

if CLIENT then
<<<<<<< Updated upstream
	-- Need to make a new convar since gmod_language isn't sent to server.
	CreateClientConVar("gmod_language_rep", "en", false, true)

	timer.Create("checklanguagechange", 1, 0, function()
		CurrentLanguage = GetConVar("gmod_language"):GetString()
		if CurrentLanguage ~= GetConVar("gmod_language_rep"):GetString() then
			-- Let server know our language changed.
			RunConsoleCommand("gmod_language_rep", CurrentLanguage)
		end
	end)
=======
    -- Need to make a new convar since gmod_language isn't sent to server.
    CreateClientConVar("gmod_language_rep", "en", false, true)

    CurrentLanguage = GetConVarString("gmod_language")

    timer.Create("checklanguagechange", 1, 0, function()
        CurrentLanguage = GetConVarString("gmod_language")
        if CurrentLanguage ~= GetConVarString("gmod_language_rep") then
            -- Let server know our language changed.
            RunConsoleCommand("gmod_language_rep", CurrentLanguage)
        end
    end)
>>>>>>> Stashed changes
end

function translate.GetLanguages()
	return Languages
end

function translate.GetLanguageName(short)
	return Languages[short]
end

function translate.GetTranslations(short)
	return Translations[short] or Translations[DefaultLanguage]
end

function translate.AddLanguage(short, long)
	Languages[short] = long
	Translations[short] = Translations[short] or {}
	AddingLanguage = short
end

function translate.AddTranslation(id, text)
	if not AddingLanguage or not Translations[AddingLanguage] then return end

	Translations[AddingLanguage][id] = text
end

<<<<<<< Updated upstream
function translate.Get(id)
	return translate.GetTranslations(CurrentLanguage)[id] or translate.GetTranslations(DefaultLanguage)[id] or ("@"..id.."@")
end

function translate.Format(id, ...)
	return string.format(translate.Get(id), ...)
end

if SERVER then
	function translate.ClientGet(pl, ...)
		CurrentLanguage = pl:GetInfo("gmod_language_rep")
		return translate.Get(...)
	end

	function translate.ClientFormat(pl, ...)
		CurrentLanguage = pl:GetInfo("gmod_language_rep")
		return translate.Format(...)
	end

=======
local function translateGet(id)
	return translate.GetTranslations(CurrentLanguage)[id] or translate.GetTranslations(DefaultLanguage)[id] or ("@"..id.."@")
end

local function translateFormat(id, ...)
	return string.format(translateGet(id), ...)
end

if SERVER then
	function translate.Get(id)
		CurrentLanguage = DefaultLanguage
		return translateGet(id)
	end
	
	function translate.ClientGet(pl, ...)
		CurrentLanguage = pl:GetInfo("gmod_language_rep")
		return translateGet(...)
	end
	
	function translate.Format(id, ...)
		CurrentLanguage = DefaultLanguage
		return translateFormat(id, ...)
	end
	
	function translate.ClientFormat(pl, ...)
		CurrentLanguage = pl:GetInfo("gmod_language_rep")
		return translateFormat(...)
	end
	
>>>>>>> Stashed changes
	function PrintTranslatedMessage(printtype, str, ...)
		for _, pl in pairs(player.GetAll()) do
			pl:PrintMessage(printtype, translate.ClientFormat(pl, str, ...))
		end
	end
end

if CLIENT then
<<<<<<< Updated upstream
	function translate.ClientGet(_, ...)
		return translate.Get(...)
	end
	function translate.ClientFormat(_, ...)
		return translate.Format(...)
	end
end

for i, filename in pairs(file.Find(GM.FolderName.."/gamemode/languages/*.lua", "LUA")) do
=======
	function translate.Get(id)
		return translateGet(id) 
	end
	function translate.HasTranslate(id)
		return  string.Explode("",translateGet(id))[1] ~= "@"
	end
	
	function translate.ClientGet(_, ...)
		return translateGet(...)
	end
	
	function translate.Format(id, ...)
		return translateFormat(id, ...)
	end
	
	function translate.ClientFormat(_, ...)
		return translateFormat(...)
	end
end

for i, filename in pairs(file.Find(GM.FolderName.. "/gamemode/languages/*.lua", "LUA")) do
>>>>>>> Stashed changes
	LANGUAGE = {}
	AddCSLuaFile("languages/"..filename)
	include("languages/"..filename)
	for k, v in pairs(LANGUAGE) do
		translate.AddTranslation(k, v)
	end
	LANGUAGE = nil
end

local meta = FindMetaTable("Player")
if not meta then return end

function meta:PrintTranslatedMessage(hudprinttype, translateid, ...)
	if ... ~= nil then
		self:PrintMessage(hudprinttype, translate.ClientFormat(self, translateid, ...))
	else
		self:PrintMessage(hudprinttype, translate.ClientGet(self, translateid))
	end
<<<<<<< Updated upstream
end
=======
end
>>>>>>> Stashed changes
