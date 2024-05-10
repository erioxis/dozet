local meta = FindMetaTable("Entity")

local M_Player = FindMetaTable("Player")
local P_Team = M_Player.Team

function meta:SetModelScaleVector(vec)
	local bonecount = self:GetBoneCount()
	if bonecount and bonecount > 1 then
		local scale
		if type(vec) == "number" then
			scale = vec
		else
			scale = math.min(vec.x, vec.y, vec.z)
		end
		self._ModelScale = Vector(scale, scale, scale)
		self:SetModelScale(scale, 0)
	else
		if type(vec) == "number" then
			vec = Vector(vec, vec, vec)
		end

		self._ModelScale = vec
		local m = Matrix()
		m:Scale(vec)
		self:EnableMatrix("RenderMultiply", m)
	end
end

if not meta.TakeDamageInfo then
	meta.TakeDamageInfo = function() end
end
if not meta.SetPhysicsAttacker then
	meta.SetPhysicsAttacker = function() end
end

function meta:HealPlayer(pl, amount)
	local healed, rmv = 0, 0

	local health, maxhealth = pl:Health(), pl:GetDTBool(DT_PLAYER_BOOL_FRAIL) and math.floor(pl:GetMaxHealth() * 0.44) or pl:GetMaxHealth()
	local missing_health = maxhealth - health
	local poison = pl:GetPoisonDamage()
	local bleed = pl:GetBleedDamage()

	local multiplier = self.MedicHealMul or 1

	amount = amount * multiplier

	-- Heal bleed first.
	if bleed > 0 then
		rmv = math.min(amount, bleed)
		healed = healed + rmv
		amount = amount - rmv
	end

	-- Heal poison next.
	if poison > 0 and amount > 0 then
		rmv = math.min(amount, poison)
		healed = healed + rmv
		amount = amount - rmv
	end

	-- Then heal missing health.
	if missing_health > 0 and amount > 0 then
		rmv = math.min(amount, missing_health)
		healed = healed + rmv
		amount = amount - rmv
	end

	return healed
end

local y = -50
local maxbarwidth = 560
local barheight = 30
function meta:Draw3DHealthBar(percentage, name, yoffset, widthprop, nameoffset)
	yoffset = yoffset or 0
	local barwidth = maxbarwidth * (widthprop or 1)
	local startx = barwidth * -0.5

	surface.SetDrawColor(0, 0, 0, 220)
	surface.DrawRect(startx, y + yoffset, barwidth, barheight)
	surface.SetDrawColor(255 - percentage * 255, percentage * 255, 0, 220)
	surface.DrawRect(startx + 4, y + 4 + yoffset, barwidth * percentage - 8, barheight - 8)
	surface.DrawOutlinedRect(startx, y + yoffset, barwidth, barheight)

	if name then
		draw.SimpleText(name, "ZS3D2DFont", 0, yoffset + (nameoffset or 0), COLOR_WHITE, TEXT_ALIGN_CENTER)
	end
end

-- Caching

local CachedNails = {}

timer.Create("CacheNails", 0.3333, 0, function()
	CachedNails = {}

	for _, nail in ipairs(ents.FindByClass("prop_nail")) do
		if nail:IsValid() and nail.GetAttachEntity then
			CachedNails[#CachedNails + 1] = nail
			nail.CachedAttachEntity = nail:GetAttachEntity()
			nail.CachedBaseEntity = nail:GetBaseEntity()
		end
	end
end)

function meta:IsNailed()
	if self:IsValid() then -- In case we're the world.
		for _, nail in pairs(CachedNails) do
			if nail.CachedAttachEntity == self or nail.CachedBaseEntity == self then
				return true
			end
		end
	end

	return false
end

function meta:TransAlphaToMe()
	local radius = GAMEMODE.TransparencyRadius / 9
	if radius > 0 and P_Team(MySelf) == TEAM_HUMAN then
		local dist = self:GetPos():DistToSqr(EyePos())
		if dist < radius then
			return math.max(0.1, (dist / radius) ^ 0.5)
		end
	end

	return 1
end

GM.CachedGiftEntities = {}
GM.CachedGift2Entities = {}
timer.Create("CacheGiftEntities", 3, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedGiftEntities = {}

	local gifts = {}
	table.Add(gifts, ents.FindByClass("prop_gift"))


	GAMEMODE.CachedGiftEntities = gifts

	GAMEMODE.CachedGift2Entities = {}

	gifts = {}
	table.Add(gifts, ents.FindByClass("prop_gift_h"))


	GAMEMODE.CachedGift2Entities = gifts
end)
GM.CachedASigilEntities = {}
timer.Create("CacheASigil", 10, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedASigilEntities = {}

	local asigil = {}
	table.Add(asigil, ents.FindByClass("prop_obj_anti_sigil"))


	GAMEMODE.CachedASigilEntities = asigil
end)
GM.CachedAltarsSigilEntities = {}
timer.Create("CacheAltarSigil", 25, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedAltarsSigilEntities = {}

	local asigil = {}
	table.Add(asigil, ents.FindByClass("prop_idols"))


	GAMEMODE.CachedAltarsSigilEntities = asigil
end)

GM.CachedResupplyEntities = {}
timer.Create("CachedResupplyEntities", 0.5, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedResupplyEntities = {}

	local resupents = {}
	table.Add(resupents, ents.FindByClass("prop_resupplybox"))
	table.Add(resupents, ents.FindByClass("status_resupplypack"))

	for _, v in pairs(player.GetAll()) do
		if v ~= MySelf and not v:HasTrinket("resupplypack") and v:HasWeapon("weapon_zs_resupplybox") then
			table.insert(resupents, v)
		end
	end

	GAMEMODE.CachedResupplyEntities = resupents
end)

GM.CachedRemantlerEntities = {}
timer.Create("CachedRemantlerEntities", 0.5, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedRemantlerEntities = {}

	local remanents = {}
	table.Add(remanents, ents.FindByClass("prop_remantler"))

	for _, v in pairs(player.GetAll()) do
		if v ~= MySelf and v:HasWeapon("weapon_zs_remantler") then
			table.insert(remanents, v)
		end
	end

	GAMEMODE.CachedRemantlerEntities = remanents
end)

GM.CachedZSpawns = {}
GM.NextZThink = 0
timer.Create("CachedZSSpawnEntities", 2, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedZSpawns = {}
	local zsspawn = {}
	table.Add(zsspawn, ents.FindByClass("zombiegasses"))

	if GAMEMODE:GetWave() < 4 and !GAMEMODE:GetWaveActive() then
		GAMEMODE.NextZThink = CurTime() + 7
		GAMEMODE.CachedZSpawns= zsspawn
	end
end)

GM.CachedNests = {}
timer.Create("CachedNests", 0.5, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedNests = {}

	local nests = {}
	table.Add(nests, ents.FindByClass("prop_creepernest"))
	table.Add(nests, ents.FindByClass("prop_glitchnest"))

	GAMEMODE.CachedNests = nests
end)

GM.CachedBabies = {}
timer.Create("CachedBabies", 0.5, 0, function()
	if not GAMEMODE then return end
	GAMEMODE.CachedBabies = {}

	local babies = {}
	table.Add(babies, ents.FindByClass("prop_thrownbaby"))
	table.Add(babies, ents.FindByClass("prop_thrownshadowbaby"))

	GAMEMODE.CachedBabies = babies
end)

GM.CachedSigils = {}
timer.Create("CacheSigils", 1, 0, function()
	if not GAMEMODE then return end

	GAMEMODE.CachedSigils = GAMEMODE:GetSigils()
end)
