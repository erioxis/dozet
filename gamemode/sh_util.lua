local string = string
function player.GetAllActive()
	local t = {}

	for _, pl in pairs(player.GetAll()) do
		if not pl:IsSpectator() then
			t[#t + 1] = pl
		end
	end

	return t
end


string.oldupper = string.oldupper or string.upper
string.oldlower = string.oldlower or string.lower
local lowers = {['А']='а',['Б']='б',['В']='в',['Г']='г',['Д']='д',['Е']='е',['Ё']='ё',['Ж']='ж',['З']='з',['И']='и',['Й']='й',['К']='к',['Л']='л',['М']='м',['Н']='н',['О']='о',['П']='п',['Р']='р',['С']='с',['Т']='т',['У']='у',['Ф']='ф',['Х']='х',['Ц']='ц',['Ч']='ч',['Ш']='ш',['Щ']='щ',['Ъ']='ъ',['Ы']='ы',['Ь']='ь',['Э']='э',['Ю']='ю',['Я']='я'}
local uppers = {['а']='А',['б']='Б',['в']='В',['г']='Г',['д']='Д',['е']='Е',['ё']='Ё',['ж']='Ж',['з']='З',['и']='И',['й']='Й',['к']='К',['л']='Л',['м']='М',['н']='Н',['о']='О',['п']='П',['р']='Р',['с']='С',['т']='Т',['у']='У',['ф']='Ф',['х']='Х',['ц']='Ц',['ч']='Ч',['ш']='Ш',['щ']='Щ',['ъ']='Ъ',['ы']='Ы',['ь']='Ь',['э']='Э',['ю']='Ю',['я']='Я'}
function math.MoveTowards(current, target, maxDelta)
	if math.abs(target - current) <= maxDelta then
		return target
	end

	return current + math.Sign(target - current) * maxDelta
end

function math.Sign(num)  
	if num > 0 then
		num = 1
	elseif num < 0 then
		num = -1
	else 
		num = 0
	end

	return num
end
function string.upper( str )
    local result = ''

    for char in string.gmatch( str, '[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*' ) do
        result = result..(uppers[char] or string.oldupper( char ))
    end

    return result
end

function string.lower( str )
    local result = ''

    for char in string.gmatch( str, '[%z\x01-\x7F\xC2-\xF4][\x80-\xBF]*' ) do
        result = result .. ( lowers[char] or string.oldlower( char ) )
    end

    return result
end
function string.findnumeric( str )

	local numeric = string.match( str, '%d+' )
	return tonumber( numeric ) or 1

end
function player.GetAllSpectators()
	local t = {}

	for _, pl in pairs(player.GetAll()) do
		if pl:IsSpectator() then
			t[#t + 1] = pl
		end
	end

	return t
end

function FindStartingItem(id)
	if not id then return false end
	local item = FindItem(id)
	if item and item.WorthShop then return item end
end
function math.randomr(min, max, need, pl, chances)
	local ch = chances
	local rand = min
	if pl then ch = math.Round(math.max(((pl.Luck or 1)/(pl:IsSkillActive(SKILL_BLUCK) and 3 or 5) or 1),1)) end
	for i=1,ch do
		local random = math.random(min,max)
		if random == need then
			rand = need
			break
		else
			rand = random
		end
	end

	return rand
end
function FindItem(id)
	if not id then return false end
	return GAMEMODE.Items[id]
end

function FindMutation(id)
	if not id then return end

	local t

	local num = tonumber(id)
	if num then
		t = GAMEMODE.Mutations[num]
	else
		for i, tab in pairs(GAMEMODE.Mutations) do
			if tab.Signature == id then
				t = tab
				break
			end
		end
	end

	if t and t.MutationShop then return t end
end

-- DEPRECATED behavior. CachedInvisibleEntities and filter tables is nonsense. Move to using functions.
local TrueVisibleTrace = {mask = MASK_SHOT}
function TrueVisible(posa, posb, filter)
	local filt = ents.FindByClass("projectile_*")
	filt = table.Add(filt, SERVER and GAMEMODE.CachedInvisibleEntities or player.GetAll())
	if filter then
		filt[#filt + 1] = filter
	end

	TrueVisibleTrace.start = posa
	TrueVisibleTrace.endpos = posb
	TrueVisibleTrace.filter = filt
	TrueVisibleTrace.mask = MASK_SHOT

	return not util.TraceLine(TrueVisibleTrace).Hit
end

-- DEPRECATED behavior. CachedInvisibleEntities and filter tables is nonsense. Move to using functions.
function TrueVisibleFilters(posa, posb, ...)
	local filt = ents.FindByClass("projectile_*")
	filt = table.Add(filt, SERVER and GAMEMODE.CachedInvisibleEntities or player.GetAll())
	if ... ~= nil then
		filt = table.Add(filt, {...})
	end

	TrueVisibleTrace.start = posa
	TrueVisibleTrace.endpos = posb
	TrueVisibleTrace.filter = filt
	TrueVisibleTrace.mask = MASK_SHOT

	return not util.TraceLine(TrueVisibleTrace).Hit
end

-- Useful macros for the 3 file system
function INC_SERVER()
	AddCSLuaFile("shared.lua")
	AddCSLuaFile("cl_init.lua")
	include("shared.lua")
end

function INC_CLIENT()
	include("shared.lua")
end
INC_CLIENT_NO_SHARED = INC_CLIENT

function INC_SERVER_NO_SHARED()
	AddCSLuaFile("cl_init.lua")
end

function INC_SERVER_NO_CLIENT()
	AddCSLuaFile("shared.lua")
end

-- Just in case you add this by mistake because it does nothing
function INC_SHARED()
end

MASK_SHOT_OPAQUE = bit.bor(MASK_SHOT, CONTENTS_OPAQUE)
-- Literally if photon particles can reach point b from point a.
local LightVisibleTrace = {mask = MASK_SHOT_OPAQUE}
function LightVisible(posa, posb, ...)
	local filter
	if ... ~= nil then
		filter = {...}
	end

	LightVisibleTrace.start = posa
	LightVisibleTrace.endpos = posb
	LightVisibleTrace.filter = filter

	return not util.TraceLine(LightVisibleTrace).Hit
end

local WorldVisibleTrace = {mask = MASK_SOLID_BRUSHONLY}
function WorldVisible(posa, posb)
	WorldVisibleTrace.start = posa
	WorldVisibleTrace.endpos = posb
	return not util.TraceLine(WorldVisibleTrace).Hit
end
function WorldVisiblePos(posa, posb)
	WorldVisibleTrace.start = posa
	WorldVisibleTrace.endpos = posb
	return util.TraceLine(WorldVisibleTrace).HitPos
end

function CosineInterpolation(y1, y2, mu)
	local mu2 = (1 - math.cos(mu * math.pi)) / 2
	return y1 * (1 - mu2) + y2 * mu2
end

function CubicInterpolate(y0, y1, y2, y3, mu)
	local mu2 = mu * mu
	local a0 = y3 - y2 - y0 + y1
	local a1 = y0 - y1 - a0
	local a2 = y2 - y0

	return a0 * mu * mu2 + a1 * mu2 + a2 * mu + y1
end

--[[function CatmullInterpolate(y0, y1, y2, y3, mu)
	local mu2 = mu * mu
	local a0 = -0.5 * y0 + 1.5 * y1 - 1.5 * y2 + 0.5 * y3
	local a1 = y0 - 2.5 * y1 + 2 * y2 - 0.5 * y3
	local a2 = -0.5 * y0 + 0.5 * y2

	return a0 * mu * mu2 + a1 * mu2 + a2 * mu + y1
end]]

function CatmullInterpolate(previous, start, last, nextp, elapsedTime, duration)
		local percentComplete = elapsedTime / duration
		local percentCompleteSquared = percentComplete * percentComplete
		local percentCompleteCubed = percentCompleteSquared * percentComplete

		return previous * (-0.5 * percentCompleteCubed +
								   percentCompleteSquared -
							0.5 * percentComplete) +
				start * (1.5 * percentCompleteCubed +
						   -2.5 * percentCompleteSquared + 1.0) +
				last * (-1.5 * percentCompleteCubed +
							2.0 * percentCompleteSquared +
							0.5 * percentComplete) +
				nextp * (0.5 * percentCompleteCubed -
							0.5 * percentCompleteSquared)
end

function string.AndSeparate(list)
	local length = #list
	if length <= 0 then return "" end
	if length == 1 then return list[1] end
	if length == 2 then return list[1].." and "..list[2] end

	return table.concat(list, ", ", 1, length - 1)..", and "..list[length]
end

function util.SkewedDistance(a, b, skew)
	if a.z > b.z then
		return math.sqrt((b.x - a.x) ^ 2 + (b.y - a.y) ^ 2 + ((a.z - b.z) * skew) ^ 2)
	end

	return a:Distance(b)
end

function util.IsServerOrClient()
	return SERVER and "SERVER" or "CLIENT"
end

function util.Blood(pos, amount, dir, force, noprediction)
	local effectdata = EffectData()
		effectdata:SetOrigin(pos)
		effectdata:SetMagnitude(amount)
		effectdata:SetNormal(dir)
		effectdata:SetScale(math.max(32, force))
	util.Effect("bloodstream", effectdata, nil, noprediction)
end

function util.BlastDamagePlayer(inf, att, center, radius, damage, damagetype, taperfactor, doinddamage)
	if not att:IsValidPlayer() then ErrorNoHalt("[BlastDamagePlayer] Tried to use a nonplayer") end

	util.BlastDamageEx(inf, att, center, radius * (att.ExpDamageRadiusMul or 1), damage * (att.ExplosiveDamageMul or 1), damagetype, taperfactor, doinddamage)
end
function util.BlastDamageElemental(inflictor, attacker, epicenter, radius, damage, element, taperfactor, bool)
	local basedmg = damage

	for _, ent in pairs(ents.FindInSphere(epicenter, radius)) do
		if ent:IsValid() and ent:IsPlayer() then
			local nearest = ent:NearestPoint(epicenter)
			if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:EyePos(), inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:WorldSpaceCenter(), inflictor, attacker, ent) then
				if ent:IsValidLivingHuman() and bool then
					ent:GiveStatus("holly", 5)
				end
				if !bool then
					ent:AttachmentDamage((((radius - nearest:Distance(epicenter)) / radius) * basedmg), attacker, inflictor,element)
				else
					for i=1,4 do
						ent:AttachmentDamage((((radius - nearest:Distance(epicenter)) / radius) * basedmg), attacker, inflictor,i)
					end
				end

				if taperfactor and ent:IsPlayer() then
					basedmg = basedmg * taperfactor
				end
			end
		end
	end
end

-- I had to make this since the default function checks visibility vs. the entitiy's center and not the nearest position.
--[[function util.BlastDamageEx(inflictor, attacker, epicenter, radius, damage, damagetype, taperfactor, bool)
	local basedmg = damage

	for _, ent in pairs(ents.FindInSphere(epicenter, radius)) do
		if ent:IsValid() then
			local nearest = ent:NearestPoint(epicenter)
			if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:EyePos(), inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:WorldSpaceCenter(), inflictor, attacker, ent) then

				ent:TakeSpecialDamage((((radius - nearest:Distance(epicenter)) / radius) * basedmg) * (ent == attacker and bool and (ent.IndDamageTaken or 1) or 1), damagetype, attacker, inflictor, nearest)

				if taperfactor and ent:IsPlayer() then
					basedmg = basedmg * taperfactor
				end
			end
		end
	end
end]]
function util.BlastDamageEx(inflictor, attacker, epicenter, radius, damage, damagetype, taperfactor, bool) -- Clyde V
    local basedmg = damage
    local entList = ents.FindInSphere(epicenter, radius)

    for _, ent in pairs(entList) do
        if ent:IsValid() then
            local entPos, eyePos, centerPos = ent:GetPos(), ent:EyePos(), ent:WorldSpaceCenter()
            local nearest = entPos + (epicenter - entPos):GetNormalized() * entPos:Distance(epicenter)

            if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
                or TrueVisibleFilters(epicenter, eyePos, inflictor, attacker, ent)
                or TrueVisibleFilters(epicenter, centerPos, inflictor, attacker, ent) then

                local specialDamage = ((radius - nearest:Distance(epicenter)) / radius) * basedmg
                if ent == attacker and bool then
                    specialDamage = specialDamage * (ent.IndDamageTaken or 1)
                end
                ent:TakeSpecialDamage(specialDamage, damagetype, attacker, inflictor, nearest)

                if taperfactor and ent:IsPlayer() then
                    basedmg = basedmg * taperfactor
                end
            end
        end
    end
end

function util.BlastDamageExAlloc(inflictor, attacker, epicenter, radius, damage, damagetype)
	local dmg
	local t = {}

	for _, ent in pairs(ents.FindInSphere(epicenter, radius)) do
		if ent:IsValid() then
			local nearest = ent:NearestPoint(epicenter)
			if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:EyePos(), inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:WorldSpaceCenter(), inflictor, attacker, ent) then

				dmg = ((radius - nearest:Distance(epicenter)) / radius) * damage
				ent:TakeSpecialDamage(dmg, damagetype, attacker, inflictor, nearest)

				t[ent] = dmg
			end
		end
	end

	return t
end

function util.BlastAlloc(inflictor, attacker, epicenter, radius)
	local t = {}

	for _, ent in pairs(ents.FindInSphere(epicenter, radius)) do
		if ent:IsValid() then
			local nearest = ent:NearestPoint(epicenter)
			if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:EyePos(), inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:WorldSpaceCenter(), inflictor, attacker, ent) then
				t[#t + 1] = ent
			end
		end
	end

	return t
end

function util.FindValidInSphere(pos, radius)
	local ret = {}

	for _, ent in pairs(util.FindInSphere(pos, radius)) do
		if ent:IsValid() then
			ret[#ret + 1] = ent
		end
	end

	return ret
end

function util.PoisonBlastDamage(inflictor, attacker, epicenter, radius, damage, noreduce, instant)
	for _, ent in pairs(ents.FindInSphere(epicenter, radius)) do
		if ent:IsValid() then
			local nearest = ent:NearestPoint(epicenter)
			if TrueVisibleFilters(epicenter, nearest, inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:EyePos(), inflictor, attacker, ent)
				or TrueVisibleFilters(epicenter, ent:WorldSpaceCenter(), inflictor, attacker, ent) then
				ent:PoisonDamage(((radius - nearest:Distance(epicenter)) / radius) * damage, attacker, inflictor, nil, noreduce, instant)
			end
		end
	end
end

function util.ToMinutesSeconds(seconds)
	local minutes = math.floor(seconds / 60)
	seconds = seconds - minutes * 60

	return string.format("%02d:%02d", minutes, math.floor(seconds))
end

-- More appropriate for count downs. Timer will display 00:01 if less than a second remains and never display 00:00.
function util.ToMinutesSecondsCD(seconds)
	seconds = math.ceil(seconds)
	local minutes = math.floor(seconds / 60)
	seconds = seconds - minutes * 60

	return string.format("%02d:%02d", minutes, seconds)
end

function util.ToMinutesSecondsMilliseconds(seconds)
	local minutes = math.floor(seconds / 60)
	seconds = seconds - minutes * 60

	local milliseconds = math.floor(seconds % 1 * 100)

	return string.format("%02d:%02d.%02d", minutes, math.floor(seconds), milliseconds)
end

function util.RemoveAll(class)
	for _, ent in pairs(ents.FindByClass(class)) do
		ent:Remove()
	end
end

-- Takes a table of false/trues with numbers as the keys, compresses to array of chars (8 bits), in other words a string, for storage in files.
-- The net library already uses the smallest number of bits needed so this is only for storing data.
function util.CompressBitTable(t)
	local buf = ""
	local maxvalue = 0

	t = table.ToAssoc(t)

	for k in pairs(t) do
		if k > maxvalue then maxvalue = k end
	end
	local num_bytes = math.ceil(maxvalue / 8)

	for on_byte = 1, num_bytes do
		local byte = 0

		for bit_slot = 1, 8 do
			if t[bit_slot + 8 * (on_byte - 1)] then
				byte = bit.bor(byte, 2 ^ (bit_slot - 1))
			end
		end

		buf = buf..string.char(byte)
	end

	return buf
end

function util.DecompressBitTable(str, associative)
	local t = {}

	for on_byte = 1, #str do
		local byte = str:sub(on_byte, on_byte):byte()
		for bit_slot = 1, 8 do
			if bit.band(byte, 1) == 1 then
				local v = bit_slot + 8 * (on_byte - 1)
				if associative then
					t[v] = true
				else
					t[#t + 1] = v
				end
			end
			byte = bit.arshift(byte, 1)
		end
	end

	return t
end

function table.IsAssoc(t)
	for _, v in pairs(t) do
		if v == true then
			return true
		end

		return false
	end
end

function table.ToAssoc(t)
	if not table.IsAssoc(t) then
		local t2 = {}

		for k, v in pairs(t) do
			t2[v] = true
		end

		return t2
	end

	return t
end

function table.ToKeyValues(t)
	if table.IsAssoc(t) then
		local t2 = {}

		for k, v in pairs(t) do
			if v then
				t2[#t2 + 1] = k
			end
		end

		return t2
	end

	return t
end

local function TooNear(spawn, tab, dist)
	dist = dist * dist

	local spawnpos = spawn:GetPos()
	for _, ent in pairs(tab) do
		if ent:GetPos():DistToSqr(spawnpos) <= dist then
			return true
		end
	end

	return false
end
function team.GetSpawnPointGrouped(teamid, dist)
	dist = dist or 200

	local tab = {}
	local spawns = team.GetSpawnPoint(teamid)

	for _, spawn in pairs(spawns) do
		if not TooNear(spawn, tab, dist) then
			table.insert(tab, spawn)
		end
	end

	return tab
end

function AccessorFuncDT(tab, membername, type, id)
	local emeta = FindMetaTable("Entity")
	local setter = emeta["SetDT"..type]
	local getter = emeta["GetDT"..type]

	tab["Set"..membername] = function(me, val)
		setter(me, id, val)
	end

	tab["Get"..membername] = function(me)
		return getter(me, id)
	end
end

function team.GetValidSpawnPoint(teamid)
	local t = {}

	local spawns = team.GetSpawnPoint(teamid)
	if spawns then
		for _, ent in pairs(spawns) do
			if ent:IsValid() and not ent.Disabled then
				t[#t + 1] = ent
			end
		end
	end

	return t
end

function ents.CreateLimited(class, limit)
	if #ents.FindByClass(class) >= (limit or 32) then return NULL end

	return ents.Create(class)
end

function string.CommaSeparate(num)
	local k
	for ___=1, 10000 do
		num, k = string.gsub(num, "^(-?%d+)(%d%d%d)", "%1,%2")
		if k == 0 then break end
	end
	return num
end

function tonumbersafe(a)
	local n = tonumber(a)

	if n then
		if n == 0 or n < 0 or n > 0 then
			return n
		end

		-- NaN!
		return 0
	end

	return nil
end

-- y from the top left can be retrieved with quad_h - y
function util.IntersectRayWithQuad(start, dir, quad_bottom_left, quad_angles, quad_w, quad_h, double_sided)
	local quad_normal = quad_angles:Forward()

	if not double_sided and dir:Dot(quad_normal) > 0 then return end

	local hitpos = util.IntersectRayWithPlane(start, dir, quad_bottom_left, quad_normal)
	if hitpos then
		local lpos, _ = WorldToLocal(hitpos, quad_angles, quad_bottom_left, quad_angles)
		local x = lpos.y
		local y = lpos.z
		if x >= 0 and x <= quad_w and y >= 0 and y <= quad_h then
			return hitpos, x, y
		end
	end
end

local pulseeffect = EffectData()
pulseeffect:SetRadius(8)
pulseeffect:SetMagnitude(1)
pulseeffect:SetScale(1)
function util.CreatePulseImpactEffect(hitpos, hitnormal)
	pulseeffect:SetOrigin(hitpos)
	pulseeffect:SetNormal(hitnormal)
	util.Effect("cball_bounce", pulseeffect)
end
function ents.FindInBoxRadius(pos, radius)
	local min = pos - Vector(radius, radius, radius)
	local max = pos + Vector(radius, radius, radius)
	local all = ents.FindInBox(min, max)
	local entis = {}
	for _, ent in pairs(all) do
	  if ent:GetPos():Distance(pos) <= radius then
		table.insert(entis, ent)
	  end
	end
	return entis
end

  