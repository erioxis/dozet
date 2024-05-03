local TEXT_ALIGN_CENTER = TEXT_ALIGN_CENTER
local EyePos = EyePos
local EyeVector = EyeVector
local CurTime = CurTime
local string_format = string.format
local string_match = string.match
local math_max = math.max
local math_ceil = math.ceil
local draw = draw
local util = util

local trace = {mask = MASK_SHOT, mins = Vector(-2, -2, -2), maxs = Vector(2, 2, 2)}
local filter = {}
local entitylist = {}

local colTemp = Color(255, 255, 255)
function GM:DrawTargetID(ent, fade)
	
	fade = fade or 1
	local pos = ent:GetPos()
	pos.z = pos.z + 16
	local ts = pos:ToScreen()
	local x, y = ts.x, math.Clamp(ts.y, 0, ScrH() * 0.95)

	colTemp.a = fade * 255
	util.ColorCopy(COLOR_FRIENDLY, colTemp)

	local name = ent:Name()
	draw.SimpleTextBlur(name, "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
	y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 3

	local healthfraction = math_max(ent:Health() / (ent:Team() == TEAM_UNDEAD and ent:GetMaxZombieHealth() or ent:GetMaxHealth()), 0)
	local bloodarmor = ent:GetBloodArmor()
	if bloodarmor > 0 and ent:Team() == TEAM_HUMAN then
		util.ColorCopy(COLOR_SOFTRED, colTemp)
		draw.SimpleTextBlur(translate.Get("trg_bdarmor")..(ent:HasTrinket("curse_unknown") and "???" or math.floor(bloodarmor)), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
		y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
	end
	if self.MedicalAura and (MySelf:HasTrinket("processor_q4") or MySelf:HasTrinket("processor_q5")) then
		local localy = y-90
		for k,v in pairs(ent:GetStatuses()) do
			local class = v:GetClass()
			local ent = v:GetDTEntity(22)
			local tab = GAMEMODE.Statuses[string.sub(class,8,#class)]
			util.ColorCopy(tab.Debuff and COLOR_SOFTRED or COLOR_LIMEGREEN, colTemp)
			draw.SimpleTextBlur(translate.Get("s_"..tab.Name).."(".. math.floor(math.max(v:GetStartTime() + v:GetDuration() - CurTime(), 0)) ..")", "ZSHUDFontTiny", x, localy, colTemp, TEXT_ALIGN_CENTER)
			localy = localy - draw.GetFontHeight("ZSHUDFontTiny") - 2
			if ent and ent:IsValidPlayer() then
				util.ColorCopy(ent == MySelf and COLOR_LIMEGREEN or ent:Team() == TEAM_UNDEAD and COLOR_SOFTRED or color_white, colTemp)
				draw.SimpleTextBlur(translate.Format("applier_x_status",ent:Name()), "ZSHUDFontTiny", x, localy, colTemp, TEXT_ALIGN_CENTER)
				draw.SimpleTextBlur("+", "ZSHUDFontTiny", x, localy+18, colTemp, TEXT_ALIGN_CENTER)
				localy = localy - draw.GetFontHeight("ZSHUDFontTiny") - 2
			end
		end
	end
	if healthfraction ~= 1 then

		util.ColorCopy(0.75 <= healthfraction and COLOR_HEALTHY or 0.5 <= healthfraction and COLOR_SCRATCHED or 0.25 <= healthfraction and COLOR_HURT or COLOR_CRITICAL, colTemp)

		local hptxt = self.HealthTargetDisplay == 1 and math_ceil(ent:Health()).." HP" or self.HealthTargetDisplay == 2 and math_ceil(ent:Health()).."|"..math_ceil(ent:GetMaxHealth()) or math_ceil(healthfraction * 100).."%"
		if ent:HasTrinket("curse_unknown") then
			hptxt = "?"
		end
		draw.SimpleTextBlur(hptxt, "ZSHUDFont", x, y, colTemp, TEXT_ALIGN_CENTER)
		y = y + draw.GetFontHeight("ZSHUDFont") + 3


		if self.MedicalAura then
			if ent:GetDTBool(DT_PLAYER_BOOL_FRAIL) then
				util.ColorCopy(COLOR_LBLUE, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_frail"), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
			if ent:GetDTBool(DT_PLAYER_BOOL_LABUSE) then
				util.ColorCopy(COLOR_LBLUE, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_lastabuse"), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
			local poison = ent:GetPoisonDamage()
			local bleed = ent:GetBleedDamage()
			local phant = ent:GetPhantomHealth()
			local rot = ent:GetStatus("rot")
			if poison >= 1 then
				util.ColorCopy(COLOR_LIMEGREEN, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_poison").. math.floor(poison) ..")", "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
			if bleed >= 1 then
				util.ColorCopy(COLOR_SOFTRED, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_bleed").. math.floor(bleed) ..")", "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
			if phant >= 1 then
				util.ColorCopy(COLOR_MIDGRAY, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_bloodlust"), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
			if rot then
				util.ColorCopy(COLOR_YELLOW, colTemp)
				draw.SimpleTextBlur(translate.Get("trg_rot"), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
				y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
			end
		end
	end

	util.ColorCopy(color_white, colTemp)

	if ent:Team() == TEAM_UNDEAD then
		local classtab = ent:GetZombieClassTable()
		local classname = classtab.TranslationName and translate.Get(classtab.TranslationName) or classtab.Name
		if classname then
			draw.SimpleTextBlur(classname, "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
		end
		local zarmor = ent:GetZArmor() 
		if zarmor > 0 then
			util.ColorCopy(COLOR_LBLUE, colTemp)
			draw.SimpleTextBlur(translate.Get("trg_zarmor")..math.floor(zarmor), "ZSHUDFontSmaller", x, y + 16, colTemp, TEXT_ALIGN_CENTER)
			y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 2
		end
	else
		local holding = ent:GetHolding()
		if holding:IsValid() then
			draw.SimpleTextBlur(translate.Format("trg_car", string_match(holding:GetModel(), ".*/(.+)%.mdl") or "object"), "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
		else
			local wep = ent:GetActiveWeapon()
			if wep:IsValid() then
				draw.SimpleTextBlur(wep:GetPrintName(), "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
			end
		end

		local level = ent:GetZSLevel()
		local remortlevel = ent:GetZSRemortLevel()
		y = y + draw.GetFontHeight("ZSHUDFontTiny") + 4

		if remortlevel >= 1 then
			draw.SimpleTextBlur(translate.Format("trg_r_lvl", level, remortlevel), "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
		else
			draw.SimpleTextBlur(translate.Get("trg_lvl")..level, "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
		end
	end
end

function GM:DrawSigilTargetHint(ent, fade, anti)
	fade = fade or 1
	local pos = ent:GetPos()
	pos.z = pos.z + 16
	local ts = pos:ToScreen()
	local x, y = ts.x, math.Clamp(ts.y, 0, ScrH() * 0.95)

	colTemp.a = fade * 128
	util.ColorCopy(color_white, colTemp)

	draw.SimpleTextBlur(translate.Get("sigil_nm"..(anti and "_a" or "")), "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)
	y = y + draw.GetFontHeight("ZSHUDFontSmaller") + 0

	draw.SimpleTextBlur(translate.Get("sigil_tp"..(anti and "_a" or "")), "ZSHUDFontTiny", x, y, colTemp, TEXT_ALIGN_CENTER)
end

function GM:DrawInUseRange(ent, fade)
	fade = fade or 1
	local pos = ent:GetPos()
	pos.z = pos.z + 16
	local ts = pos:ToScreen()
	local x, y = ts.x, math.Clamp(ts.y, 0, ScrH() * 0.95)

	colTemp.a = fade * 255
	util.ColorCopy(color_white, colTemp)

	draw.SimpleTextBlur("E", "ZSHUDFontSmaller", x, y, colTemp, TEXT_ALIGN_CENTER)

end

function GM:DrawSigilZombieHint(ent, fade, anti)
	fade = fade or 1
	local pos = ent:GetPos()
	pos.z = pos.z + 16
	local ts = pos:ToScreen()
	local x, y = ts.x, math.Clamp(ts.y, 0, ScrH() * 0.95)

	colTemp.a = fade * 128
	util.ColorCopy(color_white, colTemp)
	draw.SimpleTextBlur("HP:"..math.Round(ent:GetSigilHealth()).."/"..ent:GetSigilMaxHealth(), "ZSHUDFont", x, y, colTemp, TEXT_ALIGN_CENTER)
end

GM.TraceTarget = NULL

local function FuncFilterPlayers(ent)
	return not ent:IsPlayer()
end
local function FuncFilterTeam(ent)
	return not (ent:IsPlayer() and ent:Team() == MySelf:Team())
end
function GM:HUDDrawTargetID(teamid)
	local start = EyePos()
	trace.start = start
	trace.endpos = start + EyeVector() * 2048
	filter[1] = MySelf.TargetIDFilter or MySelf
	filter[2] = MySelf:GetObserverTarget()
	trace.filter = filter

	local isspectator = MySelf:IsSpectator()

	local entity = util.TraceHull(trace).Entity
	self.TraceTarget = entity
	trace.filter = FuncFilterPlayers
	self.TraceTargetNoPlayers = util.TraceLine(trace).Entity

	if MySelf.TargetLocus then
		trace.filter = FuncFilterTeam
		self.TraceTargetTeam = util.TraceLine(trace).Entity
	end

	if entity:IsValid() and (entity:IsPlayer() and (entity:Team() == teamid or isspectator) or entity.Sigil or self.ShowElol and  self:FindUseEntity(MySelf, NULL) == entity) then
		entitylist[entity] = CurTime()
	end

	for ent, time in pairs(entitylist) do
		if ent:IsValidPlayer() and (ent:Team() == teamid or isspectator) and CurTime() < time + 1.5 then
			self:DrawTargetID(ent, 1 - math.Clamp((CurTime() - time) / 1.5, 0, 1))
		elseif teamid == TEAM_HUMAN and ent.Sigil and CurTime() < time + 0.5 then
			if ent.AntiSigil then
				self:DrawSigilTargetHint(ent, 1 - math.Clamp((CurTime() - time) / 0.5, 0, 1), true)
			else
				self:DrawSigilTargetHint(ent, 1 - math.Clamp((CurTime() - time) / 0.5, 0, 1))	
			end
		elseif teamid == TEAM_UNDEAD and ent.Sigil and CurTime() < time + 0.5 and !ent.AntiSigil then
			self:DrawSigilZombieHint(ent, 1 - math.Clamp((CurTime() - time) / 0.5, 0, 1))	
		elseif ent:IsValid() and CurTime() < time + .3 then
			self:DrawInUseRange(ent, 1 - math.Clamp((CurTime() - time) / .3, 0, 1))
		else
			entitylist[ent] = nil
		end
	end
end
