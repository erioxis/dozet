 --[[

Zombie Survival
by William "JetBoom" Moodhe
williammoodhe@gmail.com -or- jetboom@noxiousnet.com
http://www.noxiousnet.com/

Further credits displayed by pressing F1 in-game.
This was my first ever gamemode. A lot of stuff is from years ago and some stuff is very recent.

]]
GM.Halloween = false
GM.NewYear = false
GM.mastery = {}
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sh_stamina.lua")
AddCSLuaFile("sh_mastery.lua")
AddCSLuaFile("sh_translate.lua")
AddCSLuaFile("sh_colors.lua")
AddCSLuaFile("sh_serialization.lua")
AddCSLuaFile("sh_globals.lua")
AddCSLuaFile("sh_util.lua")
AddCSLuaFile("sh_options.lua")
AddCSLuaFile("sh_zombieclasses.lua")
AddCSLuaFile("sh_humanclasses.lua")
AddCSLuaFile("sh_animations.lua")
AddCSLuaFile("sh_sigils.lua")
AddCSLuaFile("vgui/achievements.lua")

AddCSLuaFile("sh_channel.lua")
AddCSLuaFile("sh_weaponquality.lua")
AddCSLuaFile("sh_crafts.lua")

AddCSLuaFile("shared/sh_bullets.lua")

AddCSLuaFile("vault/shared.lua")

AddCSLuaFile("cl_draw.lua")
AddCSLuaFile("cl_net.lua")
AddCSLuaFile("cl_util.lua")
AddCSLuaFile("cl_options.lua")
AddCSLuaFile("cl_scoreboard.lua")
AddCSLuaFile("cl_targetid.lua")
AddCSLuaFile("cl_postprocess.lua")
AddCSLuaFile("cl_deathnotice.lua")
AddCSLuaFile("cl_floatingscore.lua")
AddCSLuaFile("cl_dermaskin.lua")
AddCSLuaFile("cl_hint.lua")
AddCSLuaFile("cl_thirdperson.lua")
AddCSLuaFile("cl_voicesets.lua")

AddCSLuaFile("skillweb/sh_skillweb.lua")
AddCSLuaFile("skillweb/cl_skillweb.lua")
AddCSLuaFile("skillweb/registry.lua")



AddCSLuaFile("obj_vector_extend.lua")
AddCSLuaFile("obj_entity_extend.lua")
AddCSLuaFile("obj_entity_extend_cl.lua")
AddCSLuaFile("obj_player_extend.lua")
AddCSLuaFile("obj_player_extend_cl.lua")
AddCSLuaFile("obj_weapon_extend.lua")
AddCSLuaFile("obj_weapon_extend_cl.lua")

AddCSLuaFile("vgui/dteamcounter.lua")
AddCSLuaFile("vgui/dmodelpanelex.lua")
AddCSLuaFile("vgui/dammocounter.lua")
AddCSLuaFile("vgui/dpingmeter.lua")
AddCSLuaFile("vgui/dteamheading.lua")
AddCSLuaFile("vgui/dsidemenu.lua")
AddCSLuaFile("vgui/dspawnmenu.lua")
AddCSLuaFile("vgui/dmodelkillicon.lua")


AddCSLuaFile("vgui/dexroundedpanel.lua")
AddCSLuaFile("vgui/dexroundedframe.lua")
AddCSLuaFile("vgui/dexrotatedimage.lua")
AddCSLuaFile("sh_achievements_table.lua")
AddCSLuaFile("vgui/dexnotificationslist.lua")
AddCSLuaFile("vgui/dexchanginglabel.lua")

AddCSLuaFile("vgui/mainmenu.lua")
AddCSLuaFile("vgui/pmainmenu.lua")
AddCSLuaFile("vgui/poptions.lua")
AddCSLuaFile("vgui/phelp.lua")
AddCSLuaFile("vgui/pclassselect.lua")
AddCSLuaFile("vgui/phumanclass.lua")
AddCSLuaFile("vgui/pweapons.lua")
AddCSLuaFile("vgui/pendboard.lua")
AddCSLuaFile("vgui/pworth.lua")

AddCSLuaFile("vgui/parsenal.lua")
AddCSLuaFile("vgui/dcombobox_fix.lua")
AddCSLuaFile("vgui/parsenal_anti.lua")
AddCSLuaFile("vgui/premantle.lua")
AddCSLuaFile("vgui/pdrones.lua")
AddCSLuaFile("vgui/zshealtharea.lua")
AddCSLuaFile("vgui/zs_dozet_hp.lua")
AddCSLuaFile("vgui/zsstatusarea.lua")
AddCSLuaFile("vgui/pstatus.lua")
AddCSLuaFile("vgui/zsgamestate.lua")
AddCSLuaFile("vgui/mutshop.lua")



include("sh_globals.lua")

include("obj_entity_extend_sv.lua")
include("obj_player_extend_sv.lua")
include("obj_weapon_extend_sv.lua")
AddCSLuaFile("loader.lua")
include("loader.lua")

include("zsbots/init.lua")
include("sv_achievements.lua")
include("shared.lua")
include("sv_options.lua")
include("mapeditor.lua")
include("sv_playerspawnentities.lua")
include("sv_profiling.lua")
include("sv_sigils.lua")
include("sv_concommands.lua")
include("sv_network.lua")


include("itemstocks/sv_stock.lua")
include("sh_achievements_table.lua")
include("vault/server.lua")

include("skillweb/sv_registry.lua")
include("skillweb/sv_skillweb.lua")



include("sv_zombieescape.lua")


include_library("statistics")
include("sv_director.lua")

local pairs = pairs
local ipairs = ipairs
local IN_WALK = IN_WALK
local IN_USE = IN_USE
local IN_RELOAD = IN_RELOAD
local IN_MOVERIGHT = IN_MOVERIGHT
local IN_MOVELEFT = IN_MOVELEFT
local IN_ATTACK = IN_ATTACK
local IN_ATTACK2 = IN_ATTACK2
local IN_ZOOM = IN_ZOOM
local IN_SPEED = IN_SPEED
local CurTime = CurTime
local Vector = Vector
local Angle = Angle
local vector_origin = vector_origin
local HITGROUP_HEAD = HITGROUP_HEAD
local HITGROUP_LEFTLEG = HITGROUP_LEFTLEG
local HITGROUP_RIGHTLEG = HITGROUP_RIGHTLEG
local math_max = math.max

local M_Player = FindMetaTable("Player")

local P_GetBarricadeGhosting = M_Player.GetBarricadeGhosting
local P_BarricadeGhostingThink = M_Player.BarricadeGhostingThink
local P_Team = M_Player.Team
local P_Alive = M_Player.Alive
local player_GetAll = player.GetAll
local P_GetPhantomHealth = M_Player.GetPhantomHealth

local function DoTrueAll(arguments)
	local xrani = {}
	for k,v in pairs(arguments) do
		xrani[v] = true
	end
	return xrani
end

function GM:WorldHint(hint, pos, ent, lifetime, filter)
	net.Start("zs_worldhint")
		net.WriteString(hint)
		net.WriteVector(pos or ent and ent:IsValid() and ent:GetPos() or vector_origin)
		net.WriteEntity(ent or NULL)
		net.WriteFloat(lifetime or 8)
	if filter then
		net.Send(filter)
	else
		net.Broadcast()
	end
end

function GM:CreateGibs(pos, headoffset)
	headoffset = headoffset or 0

	local headpos = Vector(pos.x, pos.y, pos.z + headoffset)
	for i = 1, 2 do
		local ent = ents.CreateLimited("prop_playergib")
		if ent:IsValid() then
			ent:SetPos(headpos + VectorRand():GetNormalized() * math.Rand(1, 5))
			ent:SetAngles(VectorRand():Angle())
			ent:SetGibType(i)
			ent:Spawn()
		end
	end

	for i = 1, 4 do
		local ent = ents.CreateLimited("prop_playergib")
		if ent:IsValid() then
			ent:SetPos(pos + VectorRand():GetNormalized() * math.Rand(1, 12))
			ent:SetAngles(VectorRand():Angle())
			ent:SetGibType(math.random(3, #GAMEMODE.HumanGibs))
			ent:Spawn()
		end
	end
end
function GM:CreateAura(pos, headoffset)
	headoffset = headoffset or 0

	local headpos = Vector(pos.x, pos.y, pos.z + headoffset)
	for i = 1, 2 do
		local ent = ents.CreateLimited("prop_aura")
		if ent:IsValid() then
			ent:SetPos(headpos + VectorRand():GetNormalized() * math.Rand(1, 5))
			ent:SetAngles(VectorRand():Angle())
			ent:SetGibType(i)
			ent:Spawn()
		end
	end
end

function GM:DisallowHumanPickup(pl, entity)
end

function GM:TryHumanPickup(pl, entity)
	if self.ZombieEscape or pl.NoObjectPickup or not pl:Alive() or (pl:Team() ~= TEAM_HUMAN and !pl:GetZombieClassTable().CanPickupProp) or (entity.NoPickupsTime and CurTime() < entity.NoPickupsTime and entity.NoPickupsOwner ~= pl) then return end

	if gamemode.Call("DisallowHumanPickup", pl, entity) or pl:GetInfo("zs_nopickupprops") == "1" then return end

	if entity:IsValid() and not entity.m_NoPickup then
		local phys = entity:GetPhysicsObject()
		if phys:IsValid() and phys:HasGameFlag(FVPHYSICS_PLAYER_HELD) then return end

		local entclass = string.sub(entity:GetClass(), 1, 12)
		local carrymaxmass = CARRY_MAXIMUM_MASS * (pl.PropCarryCapacityMul or 1)
		local carrymaxvol = CARRY_MAXIMUM_VOLUME * (pl.PropCarryCapacityMul or 1)
		if (entclass == "prop_physics" or entclass == "func_physbox" or entity.HumanHoldable and entity:HumanHoldable(pl)) and not entity:IsNailed() and entity:GetMoveType() == MOVETYPE_VPHYSICS and entity:GetPhysicsObject():IsValid() and entity:GetPhysicsObject():GetMass() <= carrymaxmass and entity:GetPhysicsObject():IsMoveable() and entity:OBBMins():Length() + entity:OBBMaxs():Length() <= carrymaxvol then
			local holder = entity:GetHolder()
			if not holder and not pl:IsHolding() and CurTime() >= (pl.NextHold or 0)
			and pl:GetShootPos():DistToSqr(entity:NearestPoint(pl:GetShootPos())) <= 4096 and pl:GetGroundEntity() ~= entity then --64^2
				local newstatus = ents.Create("status_human_holding")
				if newstatus:IsValid() then
					pl.NextHold = CurTime() + 0.25
					pl.NextUnHold = CurTime() + 0.05
					newstatus:SetPos(pl:GetShootPos())
					newstatus:SetOwner(pl)
					newstatus:SetParent(pl)
					newstatus:SetObject(entity)
					newstatus:Spawn()
					if newstatus:GetObject():GetOwner() then
						newstatus:GetObject():SetOwner(entity:GetOwner())
					end
				end
			end
		end
	end
end


function GM:AddResources()
	resource.AddFile("resource/fonts/typenoksidi.ttf")
	resource.AddFile("resource/fonts/hidden.ttf")
	resource.AddFile("resource/fonts/ghoulfriaoe.ttf")
	resource.AddFile("resource/fonts/remingtonnoiseless.ttf")
	resource.AddFile("resource/fonts/clearsans-medium.ttf")
	resource.AddFile("resource/fonts/ghoulfriaoe_upd.ttf")

	resource.AddFile("particles/vman_explosion.pcf")

	for _, filename in pairs(file.Find("materials/zombiesurvival/*.vmt", "GAME")) do
		resource.AddFile("materials/zombiesurvival/"..filename)
	end

	for _, filename in pairs(file.Find("materials/zombiesurvival/*.png", "GAME")) do
		resource.AddFile("materials/zombiesurvival/"..filename)
	end

	for _, filename in pairs(file.Find("materials/zombiesurvival/killicons/*.vmt", "GAME")) do
		resource.AddFile("materials/zombiesurvival/killicons/"..filename)
	end

	for _, filename in pairs(file.Find("materials/zombiesurvival/killicons/*.png", "GAME")) do
		resource.AddFile("materials/zombiesurvival/killicons/"..filename)
	end

	resource.AddFile("materials/zombiesurvival/filmgrain/filmgrain.vmt")
	resource.AddFile("materials/zombiesurvival/filmgrain/filmgrain.vtf")

	for _, filename in pairs(file.Find("sound/zombiesurvival/*.ogg", "GAME")) do
		resource.AddFile("sound/zombiesurvival/"..filename)
	end
	for _, filename in pairs(file.Find("sound/zombiesurvival/ui/*.ogg", "GAME")) do
		resource.AddFile("sound/zombiesurvival/ui/"..filename)
	end
	for _, filename in pairs(file.Find("sound/zombiesurvival/*.wav", "GAME")) do
		resource.AddFile("sound/zombiesurvival/"..filename)
	end
	for _, filename in pairs(file.Find("sound/zombiesurvival/*.mp3", "GAME")) do
		resource.AddFile("sound/zombiesurvival/"..filename)
	end

	local _____, dirs = file.Find("sound/zombiesurvival/beats/*", "GAME")
	for _, dirname in pairs(dirs) do
		for __, filename in pairs(file.Find("sound/zombiesurvival/beats/"..dirname.."/*.ogg", "GAME")) do
			resource.AddFile("sound/zombiesurvival/beats/"..dirname.."/"..filename)
		end
		for __, filename in pairs(file.Find("sound/zombiesurvival/beats/"..dirname.."/*.wav", "GAME")) do
			resource.AddFile("sound/zombiesurvival/beats/"..dirname.."/"..filename)
		end
		for __, filename in pairs(file.Find("sound/zombiesurvival/beats/"..dirname.."/*.mp3", "GAME")) do
			resource.AddFile("sound/zombiesurvival/beats/"..dirname.."/"..filename)
		end
	end
	

	resource.AddFile("materials/refract_ring.vmt")
	resource.AddFile("materials/killicon/redeem_v2.vtf")
	resource.AddFile("materials/killicon/redeem_v2.vmt")
	resource.AddFile("models/weapons/v_zombiearms.mdl")
	resource.AddFile("materials/models/weapons/v_zombiearms/zombie_classic_sheet.vmt")
	resource.AddFile("materials/models/weapons/v_zombiearms/zombie_classic_sheet.vtf")
	resource.AddFile("materials/models/weapons/v_zombiearms/zombie_classic_sheet_normal.vtf")
	resource.AddFile("materials/models/weapons/v_zombiearms/ghoulsheet.vmt")
	resource.AddFile("materials/models/weapons/v_zombiearms/ghoulsheet.vtf")
	resource.AddFile("models/weapons/v_fza.mdl")
	resource.AddFile("models/weapons/v_pza.mdl")
	resource.AddFile("materials/models/weapons/v_fza/fast_zombie_sheet.vmt")
	resource.AddFile("materials/models/weapons/v_fza/fast_zombie_sheet.vtf")
	resource.AddFile("materials/models/weapons/v_fza/fast_zombie_sheet_normal.vtf")
	resource.AddFile("models/weapons/c_annabelle.mdl")
	resource.AddFile("materials/models/weapons/w_annabelle/gun.vtf")
	resource.AddFile("materials/models/weapons/sledge.vtf")
	resource.AddFile("materials/models/weapons/sledge.vmt")
	resource.AddFile("materials/models/weapons/temptexture/handsmesh1.vtf")
	resource.AddFile("materials/models/weapons/temptexture/handsmesh1.vmt")
	resource.AddFile("materials/models/weapons/hammer2.vtf")
	resource.AddFile("materials/models/weapons/hammer2.vmt")
    resource.AddFile("materials/zombiesurvival/baracat.vtf")
	resource.AddFile("materials/zombiesurvival/baracat.vmt")
	resource.AddFile("materials/models/weapons/hammer.vtf")
	resource.AddFile("materials/models/weapons/hammer.vmt")
	resource.AddFile("models/weapons/w_sledgehammer.mdl")
	resource.AddFile("models/weapons/v_sledgehammer/c_sledgehammer.mdl")
	resource.AddFile("models/weapons/w_hammer.mdl")
	resource.AddFile("models/weapons/v_hammer/c_hammer.mdl")

	resource.AddFile("models/weapons/c_aegiskit.mdl")

	resource.AddFile("materials/models/weapons/v_hand/armtexture.vmt")

	resource.AddFile("models/weapons/v_supershorty/v_supershorty.mdl")
	resource.AddFile("models/weapons/w_supershorty.mdl")
	for _, filename in pairs(file.Find("materials/weapons/v_supershorty/*.vmt", "GAME")) do
		resource.AddFile("materials/weapons/v_supershorty/"..filename)
	end
	for _, filename in pairs(file.Find("materials/weapons/v_supershorty/*.vtf", "GAME")) do
		resource.AddFile("materials/weapons/v_supershorty/"..filename)
	end
	for _, filename in pairs(file.Find("materials/weapons/w_supershorty/*.vmt", "GAME")) do
		resource.AddFile("materials/weapons/w_supershorty/"..filename)
	end
	for _, filename in pairs(file.Find("materials/weapons/w_supershorty/*.vtf", "GAME")) do
		resource.AddFile("materials/weapons/w_supershorty/"..filename)
	end
	for _, filename in pairs(file.Find("materials/weapons/survivor01_hands/*.vmt", "GAME")) do
		resource.AddFile("materials/weapons/survivor01_hands/"..filename)
	end
	for _, filename in pairs(file.Find("materials/weapons/survivor01_hands/*.vtf", "GAME")) do
		resource.AddFile("materials/weapons/survivor01_hands/"..filename)
	end

	for _, filename in pairs(file.Find("materials/models/weapons/v_pza/*.*", "GAME")) do
		resource.AddFile("materials/models/weapons/v_pza/"..string.lower(filename))
	end

	resource.AddFile("models/player/fatty/fatty.mdl")
	resource.AddFile("models/player/catpants.mdl")
	resource.AddFile("materials/models/player/elis/fty/001.vmt")
	resource.AddFile("materials/models/player/elis/fty/001.vtf")
	resource.AddFile("materials/models/player/elis/fty/001_normal.vtf")

	resource.AddFile("models/player/zelpa/stalker.mdl")

	resource.AddFile("models/vinrax/player/doll_player.mdl")

	resource.AddFile("models/player/zombie_classic_hbfix.mdl")
	resource.AddFile("models/player/zombie_lacerator2.mdl")

	resource.AddFile("sound/weapons/melee/golf club/golf_hit-01.ogg")
	resource.AddFile("sound/weapons/melee/golf club/golf_hit-02.ogg")
	resource.AddFile("sound/weapons/melee/golf club/golf_hit-03.ogg")
	resource.AddFile("sound/weapons/melee/golf club/golf_hit-04.ogg")
	resource.AddFile("sound/weapons/melee/crowbar/crowbar_hit-1.ogg")
	resource.AddFile("sound/weapons/melee/crowbar/crowbar_hit-2.ogg")
	resource.AddFile("sound/weapons/melee/crowbar/crowbar_hit-3.ogg")
	resource.AddFile("sound/weapons/melee/crowbar/crowbar_hit-4.ogg")
	resource.AddFile("sound/weapons/melee/shovel/shovel_hit-01.ogg")
	resource.AddFile("sound/weapons/melee/shovel/shovel_hit-02.ogg")
	resource.AddFile("sound/weapons/melee/shovel/shovel_hit-03.ogg")
	resource.AddFile("sound/weapons/melee/shovel/shovel_hit-04.ogg")
	resource.AddFile("sound/weapons/melee/frying_pan/pan_hit-01.ogg")
	resource.AddFile("sound/weapons/melee/frying_pan/pan_hit-02.ogg")
	resource.AddFile("sound/weapons/melee/frying_pan/pan_hit-03.ogg")
	resource.AddFile("sound/weapons/melee/frying_pan/pan_hit-04.ogg")
	resource.AddFile("sound/weapons/melee/keyboard/keyboard_hit-01.ogg")
	resource.AddFile("sound/weapons/melee/keyboard/keyboard_hit-02.ogg")
	resource.AddFile("sound/weapons/melee/keyboard/keyboard_hit-03.ogg")
	resource.AddFile("sound/weapons/melee/keyboard/keyboard_hit-04.ogg")

	resource.AddFile("sound/weapons/zs_sawnoff/sawnoff_fire1.ogg")
	resource.AddFile("sound/weapons/zs_sawnoff/barrelup.ogg")
	resource.AddFile("sound/weapons/zs_sawnoff/barreldown.ogg")

	resource.AddFile("sound/weapons/zs_longarm/longarm_fire.ogg")

	resource.AddFile("sound/weapons/zs_scar/scar_fire1.ogg")

	resource.AddFile("sound/nox/sword_hit.ogg")
	resource.AddFile("sound/nox/sword_miss.ogg")
	resource.AddFile("sound/nox/frotchet_test1.ogg")
	resource.AddFile("sound/nox/scatterfrost.ogg")

	resource.AddFile("sound/weapons/zs_gluon/egon_off1.wav")

	resource.AddFile("sound/weapons/zs_heph/electro4.wav")
	resource.AddFile("sound/weapons/zs_heph/electro5.wav")
	resource.AddFile("sound/weapons/zs_heph/electro6.wav")

	resource.AddFile("sound/weapons/zs_inner/innershot.ogg")

	resource.AddFile("sound/weapons/zs_glad/gladshot4.wav")

	resource.AddFile("sound/weapons/zs_flak/load1.wav")
	resource.AddFile("sound/weapons/zs_flak/shot1.wav")

	resource.AddFile("sound/weapons/zs_rail/rail.wav")

	resource.AddFile("sound/weapons/zs_asmd/secondary2.wav")
	resource.AddFile("sound/weapons/zs_asmd/main3.wav")

	resource.AddFile("sound/weapons/zs_power/power1.ogg")
	resource.AddFile("sound/weapons/zs_power/power4.wav")
	for _, filename in pairs(file.Find("materials/noxiousnet/*.png", "GAME")) do
		resource.AddFile("materials/noxiousnet/"..filename)
	end

	resource.AddFile("sound/"..tostring(self.LastHumanSound))
	resource.AddFile("sound/"..tostring(self.AllLoseSound))
	resource.AddFile("sound/"..tostring(self.HumanWinSound))
	resource.AddFile("sound/"..tostring(self.DeathSound))
end
local numofdaily = 1
local numofweek = 1
function GM:Initialize()
	self:FixSkillConnections()
	self:RegisterPlayerSpawnEntities()
	self:AddResources()
	self:PrecacheResources()
	self:AddCustomAmmo()
	self:CreateWeaponQualities()
	self:RegisterFood()
	self:LoadProfiler()
	
	self:LoadWinRate()
	self.Da = self.Da or {"mmm", "what", "yes", "ммм", "да", "что", "obed", "обед", "уютненько", "Я", "I", "you", "ты", "амням", "санбой", "пророк"}
	if self:GetRage() >= 10000 then
		self:SetRage(0)
	end
	self:DoAchievements()
	if  GDiscord and GDiscord.sendToDS then
		local name = GetConVar("hostname"):GetString()						
			local params = 
				{
					['allowed_mentions'] = { ['parse'] = {} },
					['username'] = name.."[ MAP CHANGE ]",
					['avatar_url'] = GDiscord.players_avatars_cache[1],
					['embeds'] = 
					{ 

						{
							title = name.." сервер загрузился.",
							description = "Карта: "..game.GetMap(),                      
							color = 13048860,
							footer = 
							{
								text = name,
								icon_url = GDiscord.players_avatars_cache[1]
							}
						} 
					}
				}
		GDiscord.sendToDS(params)
	end


	numofdaily = math.max(1,(self:GetDaily() or 1)%7)
	print(numofdaily)
	numofweek = math.max(1,(self:GetWeekly() or 1)%4)
	print(numofweek)


	self:SetPantsMode(self.PantsMode, true)
	self:SetClassicMode(self:IsClassicMode(), true)
	self:SetBabyMode(self:IsBabyMode(), true)
	self:SetRedeemBrains(self.DefaultRedeem)

	self:RefreshMapIsObjective()

	game.ConsoleCommand("fire_dmgscale 1\n")
	game.ConsoleCommand("mp_flashlight 1\n")
	game.ConsoleCommand("sv_gravity 600\n")
end

function GM:IsClassicMode()
	return self.ClassicMode
end

function GM:IsBabyMode()
	return self.BabyMode
end


function GM:CenterNotifyAll(...)
	net.Start("zs_centernotify")
		net.WriteTable({...})
	net.Broadcast()
end
GM.CenterNotify = GM.CenterNotifyAll
GM.NoBaracursed = true
GM.DamageLock = false 
GM.NextThinkDirector = 0

function GM:TopNotifyAll(...)
	net.Start("zs_topnotify")
		net.WriteTable({...})
	net.Broadcast()
end
GM.TopNotify = GM.TopNotifyAll

function GM:ShowHelp(pl)
	--pl:SendLua("GAMEMODE:ShowHelp()")
end

function GM:ShowTeam(pl)
	--if pl:Team() == TEAM_HUMAN and not self.ZombieEscape then
	--	pl:SendLua(self:GetWave() > 0 and "GAMEMODE:OpenArsenalMenu()" or "MakepWorth()")

   -- elseif pl:Team() == TEAM_UNDEAD then
	--pl:SendLua("MakepMutationShop()")
	--end
end


function GM:ShowSpare1(pl)
	--if pl:Team() == TEAM_UNDEAD and not pl:KeyDown(IN_SPEED) then
		--if self:ShouldUseAlternateDynamicSpawn() then
		--	pl:CenterNotify(COLOR_RED, translate.ClientGet(pl, "no_class_switch_in_this_mode"))
	--	else
		--	pl:SendLua("GAMEMODE:OpenClassSelect()")
	--	end
	--elseif (pl:Team() == TEAM_HUMAN or pl:Team() == TEAM_UNDEAD and pl:KeyDown(IN_SPEED)) then
	--	pl:SendLua("GAMEMODE:ToggleSkillWeb()")
		--pl:SendLua("GAMEMODE:OpenHClassSelect()")
	--end
end

function GM:ShowSpare2(pl)
	--pl:SendLua("MakepOptions()")
end


function GM:SetupSpawnPoints()
	local ztab = ents.FindByClass("info_player_undead")
	ztab = table.Add(ztab, ents.FindByClass("info_player_zombie"))

	local htab = ents.FindByClass("info_player_human")

	-- Terrorist spawns are usually in some kind of house or a main base in CS_  in order to guard the hosties. Put the humans there.
	-- Otherwise, this is probably a DE_, ZM_, or ZH_ map. In DE_ maps, the T's spawn away from the main part of the map and are zombies in zombie plugins so let's do the same.
	local mapname = string.lower(game.GetMap())
	local stockspawnbehavior = string.sub(mapname, 1, 3) == "cs_" or string.sub(mapname, 1, 3) == "zs_"

	-- Only add CS:S and HL2:DM spawn points if no ZS specific spawn points exist.
	if #ztab == 0 then
		if stockspawnbehavior then
			ztab = table.Add(ztab, ents.FindByClass("info_player_counterterrorist"))
		else
			ztab = table.Add(ztab, ents.FindByClass("info_player_terrorist"))
		end

		ztab = table.Add(ztab, ents.FindByClass("info_player_rebel"))
	end
	if #htab == 0 then
		if stockspawnbehavior then
			htab = table.Add(htab, ents.FindByClass("info_player_terrorist"))
		else
			htab = table.Add(htab, ents.FindByClass("info_player_counterterrorist"))
		end

		htab = table.Add(htab, ents.FindByClass("info_player_combine"))
	end

	-- Add all the old ZS spawns from GMod9.
	for _, oldspawn in ipairs(ents.FindByClass("gmod_player_start")) do
		if oldspawn.BlueTeam then
			table.insert(htab, oldspawn)
		else
			table.insert(ztab, oldspawn)
		end
	end

	-- You shouldn't play a DM map since spawns are shared but whatever. Let's make sure that there aren't team spawns first.
	if #htab == 0 then
		htab = ents.FindByClass("info_player_start")
		htab = table.Add(htab, ents.FindByClass("info_player_deathmatch")) -- Zombie Master
	end
	if #ztab == 0 then
		ztab = ents.FindByClass("info_player_start")
		ztab = table.Add(ztab, ents.FindByClass("info_zombiespawn")) -- Zombie Master
	end

	team.SetSpawnPoint(TEAM_UNDEAD, ztab)
	team.SetSpawnPoint(TEAM_HUMAN, htab)
	team.SetSpawnPoint(TEAM_SPECTATOR, htab)

	self.RedeemSpawnPoints = ents.FindByClass("info_player_redeemed")
	self.BossSpawnPoints = table.Add(ents.FindByClass("info_player_zombie_boss"), ents.FindByClass("info_player_undead_boss"))
end

function GM:PlayerPointsAdded(pl, amount)
end

local weaponmodelstoweapon = {}
weaponmodelstoweapon["models/props/cs_office/computer_keyboard.mdl"] = "weapon_zs_keyboard"
weaponmodelstoweapon["models/props_c17/computer01_keyboard.mdl"] = "weapon_zs_keyboard"
weaponmodelstoweapon["models/props_c17/metalpot001a.mdl"] = "weapon_zs_pot"
weaponmodelstoweapon["models/props_interiors/pot02a.mdl"] = "weapon_zs_fryingpan"
weaponmodelstoweapon["models/props_c17/metalpot002a.mdl"] = "weapon_zs_fryingpan"
weaponmodelstoweapon["models/props_junk/shovel01a.mdl"] = "weapon_zs_shovel"
weaponmodelstoweapon["models/props/cs_militia/axe.mdl"] = "weapon_zs_axe"
weaponmodelstoweapon["models/props_c17/tools_wrench01a.mdl"] = "weapon_zs_hammer"
weaponmodelstoweapon["models/weapons/w_knife_t.mdl"] = "weapon_zs_swissarmyknife"
weaponmodelstoweapon["models/weapons/w_knife_ct.mdl"] = "weapon_zs_swissarmyknife"
weaponmodelstoweapon["models/weapons/w_crowbar.mdl"] = "weapon_zs_crowbar"
weaponmodelstoweapon["models/weapons/w_stunbaton.mdl"] = "weapon_zs_stunbaton"
weaponmodelstoweapon["models/props_interiors/furniture_lamp01a.mdl"] = "weapon_zs_lamp"
weaponmodelstoweapon["models/props_junk/rock001a.mdl"] = "weapon_zs_stone"
--weaponmodelstoweapon["models/props_c17/canister01a.mdl"] = "weapon_zs_oxygentank"
weaponmodelstoweapon["models/props_canal/mattpipe.mdl"] = "weapon_zs_pipe"
weaponmodelstoweapon["models/props_junk/meathook001a.mdl"] = "weapon_zs_hook"
weaponmodelstoweapon["models/props_junk/glassbottle01a.mdl"] = "weapon_zs_glassbottle"
weaponmodelstoweapon["models/props_lab/ladel.mdl"] = "weapon_zs_ladel"
weaponmodelstoweapon["models/props_junk/watermelon01.mdl"] = "weapon_zs_f_watermelon"
weaponmodelstoweapon["models/props/cs_italy/bananna_bunch.mdl"] = "weapon_zs_f_banana"
weaponmodelstoweapon["models/props/cs_italy/bananna.mdl"] = "weapon_zs_f_banana"
weaponmodelstoweapon["models/props/cs_italy/orange.mdl"] = "weapon_zs_f_orange"
weaponmodelstoweapon["models/props_junk/popcan01a.mdl"] = "weapon_zs_f_soda"
weaponmodelstoweapon["models/props_junk/garbage_milkcarton002a.mdl"] = "weapon_zs_f_milk"
weaponmodelstoweapon["models/props/cs_office/water_bottle.mdl"] = "weapon_zs_f_water"
weaponmodelstoweapon["models/props_junk/garbage_takeoutcarton001a.mdl"] = "weapon_zs_f_takeout"
weaponmodelstoweapon["models/props_c17/pushbroom.mdl"] = "weapon_zs_pushbroom"
function GM:InitPostEntity()
	self.DidInitPostEntity = true

	self:AssignItemProperties()
	self:FixWeaponBase()

	gamemode.Call("InitPostEntityMap")

	RunConsoleCommand("mapcyclefile", "mapcycle_zombiesurvival.txt")

	if string.find(string.lower(GetConVar("hostname"):GetString()), "hellsgamers", 1, true) then
		self.Think = function() end
		self.DoPlayerDeath = self.Think
		self.SetWave = self.Think
		timer.Simple(20, function() RunConsoleCommand("quit") end)

		ErrorNoHalt("Lmao why you use dozet")
	end
	local v = self.Credits[1]
	if GetConVar("hostname"):GetString() ~= "Dozet["..v[3]..v[2].."] - Zombie Survival" then
		RunConsoleCommand("hostname", "Dozet["..v[3]..v[2].."] - Zombie Survival")

	end
end

function GM:SetupProps()
	if not self.ZombieEscape then
		local phys
		for _, d in ipairs(ents.FindByClass("prop_dynamic*")) do
			if d:IsValid() then
				local convert = ents.Create("prop_physics")
				local pos = d:GetPos()
				convert:SetPos(pos)
				convert:SetAngles(d:GetAngles())
				convert:SetMaterial(d:GetMaterial())
				convert:SetModel(d:GetModel())
				convert:SetSkin(d:GetSkin() or 0)
				convert:SetParent(d:GetParent(), d:GetParentAttachment())
				convert:SetColor(d:GetColor())
				phys = convert:GetPhysicsObject()
				if phys and phys:IsValid() then
					phys:EnableMotion(false)
				end
			--	convert:SetAnimation()
				--if d:GetKeyValues() then
					--for k,v in pairs(d:GetKeyValues()) do
					--	convert:SetKeyValue(k,tostring(v))
					--end
				--end
				convert:Spawn()
				d:Remove()
			end
		end
	end
	for _, ent in ipairs(ents.FindByClass("prop_physics*")) do
		local mdl = ent:GetModel()
		if mdl then
			mdl = string.lower(mdl)
			if mdl == "models/props_c17/furniturestove001a.mdl" then
				local phys = ent:GetPhysicsObject()
				if phys:IsValid() then
					phys:SetMass(200)
				end
			end
			if table.HasValue(self.BannedProps, mdl) then
				ent:Remove()
			elseif weaponmodelstoweapon[mdl] then
				local wep = ents.Create("prop_weapon")
				if wep:IsValid() then
					wep:SetPos(ent:GetPos())
					wep:SetAngles(ent:GetAngles())
					wep:SetWeaponType(weaponmodelstoweapon[mdl])
					wep:SetShouldRemoveAmmo(false)
					wep:Spawn()

					ent:Remove()
				end
			elseif ent:GetName() == "" and self.WorldConversions[mdl] then
				local wep = ents.Create("prop_invitem")
				if wep:IsValid() then
					wep:SetPos(ent:GetPos())
					wep:SetAngles(ent:GetAngles())
					wep:SetInventoryItemType(self.WorldConversions[mdl].Result)
					wep:Spawn()

					ent:Remove()
				end
			elseif ent:GetMaxHealth() == 1 and ent:Health() == 0 and ent:GetKeyValues().damagefilter ~= "invul" and ent:GetName() == "" then
				local health = math.min(2500, math.ceil((ent:OBBMins():Length() + ent:OBBMaxs():Length()) * 10))
				local hmul = self.PropHealthMultipliers[mdl]
				if hmul then
					health = health * hmul
				end

				ent.PropHealth = health
				ent.TotalHealth = health
			else
				ent:SetHealth(math.ceil(ent:Health() * 3))
				ent:SetMaxHealth(ent:Health())
			end
		end
	end

        
end

function GM:RemoveUnusedEntities()
	-- Causes a lot of needless lag.
	util.RemoveAll("prop_ragdoll")

	-- Remove NPCs because first of all this game is PvP and NPCs can cause crashes.
	util.RemoveAll("npc_maker")
	util.RemoveAll("npc_template_maker")
	util.RemoveAll("npc_zombie")
	util.RemoveAll("npc_zombie_torso")
	util.RemoveAll("npc_fastzombie")
	util.RemoveAll("npc_headcrab")
	util.RemoveAll("npc_headcrab_fast")
	util.RemoveAll("npc_headcrab_black")
	util.RemoveAll("npc_poisonzombie")

	-- Such a headache. Just remove them all.
	util.RemoveAll("item_ammo_crate")

	-- Shouldn't exist.
	util.RemoveAll("item_suit*")
	util.RemoveAll("func_recharge")
end

function GM:ReplaceMapWeapons()
	local prefix = game.GetMap():lower():sub(1, 3)
	if prefix == "dm_" or prefix == "pb_" then
		util.RemoveAll("weapon_*")
		return
	end

	for _, ent in ipairs(ents.FindByClass("weapon_*")) do
		local wepclass = ent:GetClass()
		if wepclass ~= "weapon_map_base" then
			if string.sub(wepclass, 1, 10) == "weapon_zs_" then
				local wep = ents.Create("prop_weapon")
				if wep:IsValid() then
					wep:SetPos(ent:GetPos())
					wep:SetAngles(ent:GetAngles())
					wep:SetWeaponType(ent:GetClass())
					wep:SetShouldRemoveAmmo(false)
					wep:Spawn()
					wep.IsPreplaced = true
				end
			end
			ent:Remove()
		end
	end
end

local ammoreplacements = {
	["item_ammo_357"] = "357",
	["item_ammo_357_large"] = "357",
	["item_ammo_pistol"] = "pistol",
	["item_ammo_pistol_large"] = "pistol",
	["item_ammo_buckshot"] = "buckshot",
	["item_ammo_ar2"] = "ar2",
	["item_ammo_ar2_large"] = "ar2",
	["item_ammo_ar2_altfire"] = "pulse",
	["item_ammo_crossbow"] = "xbowbolt",
	["item_ammo_smg1"] = "smg1",
	["item_ammo_smg1_large"] = "smg1",
	["item_box_buckshot"] = "buckshot"
}
function GM:ReplaceMapAmmo()
	local prefix = game.GetMap():lower():sub(1, 3)
	if prefix == "dm_" or prefix == "pb_" then
		util.RemoveAll("item_ammo_*")
		util.RemoveAll("item_health*")
		util.RemoveAll("item_rpg_round")
		util.RemoveAll("item_box_buckshot")

		for _, e in pairs(ents.FindByModel("models/props_c17/oildrum001_explosive.mdl")) do
			if e:IsValid() and e:GetClass():sub(1, 12) == "prop_physics" then
				e:Remove()
			end
		end

		return
	end

	for classname, ammotype in pairs(ammoreplacements) do
		for _, ent in ipairs(ents.FindByClass(classname)) do
			local newent = ents.Create("prop_ammo")
			if newent:IsValid() then
				newent:SetAmmoType(ammotype)
				newent.PlacedInMap = true
				newent:SetPos(ent:GetPos())
				newent:SetAngles(ent:GetAngles())
				newent:Spawn()
				newent:SetAmmo(self.AmmoCache[ammotype] or 1)
			end
			ent:Remove()
		end
	end

	util.RemoveAll("item_item_crate")
end

function GM:ReplaceMapBatteries()
	util.RemoveAll("item_battery")
end

function GM:CreateZombieGas()
	if NOZOMBIEGASSES then return end

	local humanspawns = team.GetValidSpawnPoint(TEAM_HUMAN)
	local zombiespawns = team.GetValidSpawnPoint(TEAM_UNDEAD)

	for _, zombie_spawn in pairs(zombiespawns) do
		local gasses = ents.FindByClass("zombiegasses")
		if 4 < #gasses then
			return
		end

		if #gasses > 0 and math.random(5) ~= 1 then
			continue
		end

		local spawnpos = zombie_spawn:GetPos() + Vector(0, 0, 24)

		local near = false

		if not self.ZombieEscape then
			for __, human_spawn in pairs(humanspawns) do
				if human_spawn:IsValid() and human_spawn:GetPos():DistToSqr(spawnpos) < 90000 then
					near = true
					break
				end
			end
		end

		if not near then
			for __, gas in pairs(gasses) do
				if gas:GetPos():DistToSqr(spawnpos) < 122500 then --350^2
					near = true
					break
				end
			end
		end

		if not near then
			local ent = ents.Create("zombiegasses")
			if ent:IsValid() then
				ent:SetPos(spawnpos)
				ent:Spawn()
			end
		end
	end
end

function GM:PlayerShouldTakeNailRemovalPenalty(pl, nail, nailowner, prop)
	if gamemode.Call("PlayerIsAdmin", pl) then return false end
	if nailowner.ZSFriends[pl] then return false end

	if not gamemode.Call("CanPlaceNail", nailowner) then return false end

	if pl:BarricadeExpertPrecedence(nailowner) == 1 then -- If I'm better than they are.
		return false
	end

	local firstnail = prop:GetFirstNail()
	if firstnail and pl == firstnail:GetOwner() then
		return false
	end

	-- just gonna consider this obsolete
	--if nailowner:Frags() >= 75 or owner:Frags() < 75 then return true end

	return true
end

local playermins = Vector(-17, -17, 0)
local playermaxs = Vector(17, 17, 4)
local LastSpawnPoints = {}

function GM:PlayerSelectSpawn(pl)
	local spawninplayer = false
	local teamid = pl:Team()
	local tab
	local epicenter

	if pl.m_PreRedeem and teamid == TEAM_HUMAN and #self.RedeemSpawnPoints >= 1 then
		tab = self.RedeemSpawnPoints
	elseif teamid == TEAM_UNDEAD then
		if pl:GetZombieClassTable().Boss and (not pl.DeathClass or self.ZombieClasses[pl.DeathClass].Boss) and #self.BossSpawnPoints >= 1 then
			tab = self.BossSpawnPoints
		elseif self.DynamicSpawning --[[and CurTime() >= self:GetWaveStart() + 1]] then -- If we're a bit in the wave then we can spawn on top of heavily dense groups with no humans looking at us.
			if self:ShouldUseAlternateDynamicSpawn() then -- This system is used for zombie escape, classic mode, baby mode, etc.
				-- If they're near a human, use position where they died.
				for _, h in pairs(team.GetPlayers(TEAM_HUMAN)) do
					if h:GetPos():DistToSqr(epicenter or pl:GetPos()) < 1048576 then --1024^2
						epicenter = pl.KilledPos
						break
					end
				end

				-- Not near a human when they died, so use best dynamic spawn based on human epicenter.
				if not epicenter then
					local best = self:GetBestDynamicSpawn(pl)
					if IsValid(best) then return best end
				end

				tab = table.Copy(team.GetValidSpawnPoint(TEAM_UNDEAD))
				local dynamicspawns = self:GetDynamicSpawns(pl)
				if #dynamicspawns > 0 then
					spawninplayer = true
					table.Add(tab, dynamicspawns)
				end
			else
				local dyn = pl.ForceDynamicSpawn
				if dyn then -- We were spectating an entity.
					pl.ForceDynamicSpawn = nil
					if self:DynamicSpawnIsValid(dyn) then
						if dyn:GetClass() == "prop_creepernest" or dyn:GetClass() == "prop_glitchnest" or dyn.CanSpawnInMe then -- For honorable mentions
							local owner = dyn:GetOwner()
							if dyn.OnSpawnInMe then
								dyn:OnSpawnInMe(pl)
							end
							if owner and owner:IsValid() and owner:Team() == TEAM_UNDEAD then
								owner.NestSpawns = owner.NestSpawns + 1
							end
						end

						return dyn
					end
				end

				-- Otherwise we just use whatever we can (creeper nests too)
				tab = table.Copy(team.GetValidSpawnPoint(TEAM_UNDEAD))
				local dynamicspawns = self:GetDynamicSpawns(pl)
				if #dynamicspawns > 0 then
					spawninplayer = true
					table.Add(tab, dynamicspawns)
				end
			end
		end
	end

	if not tab or #tab == 0 then tab = team.GetValidSpawnPoint(teamid) or {} end

	-- Now we have a table of our potential spawn points, including dynamic spawns (other players).
	-- We validate if the spawn is blocked, disabled, or otherwise not suitable below.

	if #tab > 0 then
		local potential = {}

		-- Filter out spawns that are disabled or blocked.
		for _, spawn in pairs(tab) do
			if spawn:IsValid() and not spawn.Disabled and (spawn:IsPlayer() or spawn ~= LastSpawnPoints[teamid] or #tab == 1) and spawn:IsInWorld() then
				local blocked

				if not self.ObjectiveMap or teamid == TEAM_UNDEAD then
					local spawnpos = spawn:GetPos()
					for _, ent in pairs(ents.FindInBox(spawnpos + playermins, spawnpos + playermaxs)) do
						if not spawninplayer and IsValid(ent) and ent:IsPlayer() or string.sub(ent:GetClass(), 1, 5) == "prop_" then
							blocked = true
							break
						end
					end
				end

				if not blocked then
					potential[#potential + 1] = spawn
				end
			end
		end

		-- Now our final spawn list is ready.
		if #potential > 0 then
			local spawn
			if teamid == TEAM_UNDEAD then
				if pl:KeyDown(IN_ATTACK2) then
					spawn = self:GetClosestSpawnPoint(potential, epicenter or self:GetTeamEpicentre(TEAM_HUMAN))
				elseif pl:KeyDown(IN_RELOAD) then
					spawn = self:GetFurthestSpawnPoint(potential, epicenter or self:GetTeamEpicentre(TEAM_HUMAN))
				elseif math.random(2) == 2 then
					-- Let every other left click masher spawn randomly instead of closest so we have wandering zombies.
					spawn = table.Random(potential)
				else
					spawn = self:GetClosestSpawnPoint(potential, epicenter or self:GetTeamEpicentre(TEAM_HUMAN))
				end
			else
				spawn = table.Random(potential)
			end

			if spawn then
				LastSpawnPoints[teamid] = spawn
				pl.SpawnedOnSpawnPoint = spawn:GetClass():sub(1, 11) == "info_player"
				pl.DidntSpawnOnSpawnPoint = pl.DidntSpawnOnSpawnPoint or not pl.SpawnedOnSpawnPoint
				return spawn
			end
		end
	end

	pl.SpawnedOnSpawnPoint = false
	pl.DidntSpawnOnSpawnPoint = true

	-- Fallback.
	return LastSpawnPoints[teamid] or #tab > 0 and table.Random(tab) or pl
end

local function BossZombieSort(za, zb)
	local ascore = za.WaveBarricadeDamage * 0.33 + za.WaveHumanDamage
	local bscore = zb.WaveBarricadeDamage * 0.33 + zb.WaveHumanDamage
	if ascore == bscore then
		return za:Deaths() < zb:Deaths()
	end

	return ascore > bscore
end
local function DemiBossZombieSort(za, zb)
	local ascore = za.WaveBarricadeDamage * 0.73 + za.WaveHumanDamage
	local bscore = zb.WaveBarricadeDamage * 0.73 + zb.WaveHumanDamage
	if ascore == bscore then
		return za:Deaths() < zb:Deaths()
	end

	return ascore > bscore
end


function GM:SpawnBossZombie(bossplayer, silent, bossindex, triggerboss)

	if not bossplayer then
		bossplayer = self:CalculateNextBoss()
	end

	if not bossplayer then return end

	if not bossindex then
		bossindex = bossplayer:GetBossZombieIndex()
	end

	if bossindex == -1 then return end

	if not triggerboss then
		bossplayer.BossDeathNotification = true
	end

	self.LastBossZombieSpawned = self:GetWave()

	local curclass = bossplayer.DeathClass or bossplayer:GetZombieClass()
	bossplayer:KillSilent()
	bossplayer:SetZombieClass(bossindex)
	bossplayer:DoHulls(bossindex, TEAM_UNDEAD)
	bossplayer.DeathClass = nil
	bossplayer:UnSpectateAndSpawn()
	bossplayer.DeathClass = curclass
	bossplayer.BossHealRemaining = 750
	bossplayer:GiveAchievementProgress("bossofboss", 1)

	if not silent then
		net.Start("zs_boss_spawned")
			net.WriteEntity(bossplayer)
			net.WriteUInt(bossindex, 8)
		net.Broadcast()
	end
end
function GM:SpawnDemiBossZombie(bossplayer, silent, bossindex, triggerboss)

	if not bossplayer then
		bossplayer = self:CalculateNextDemiBoss()
	end

	if not bossplayer then return end

	if not bossindex then
		bossindex = bossplayer:GetDemiBossZombieIndex()
	end

	if bossindex == -1 then return end

	if not triggerboss then
		bossplayer.BossDeathNotification = true
	end
	self.LastDemiBossZombieSpawned = self:GetWave()
	if !bossplayer:GetZombieClassTable().Boss then 
		local curclass = bossplayer.DeathClass or bossplayer:GetZombieClass()
		bossplayer:KillSilent()
		bossplayer:SetZombieClass(bossindex)
		bossplayer:DoHulls(bossindex, TEAM_UNDEAD)
		bossplayer.DeathClass = nil
		bossplayer:UnSpectateAndSpawn()
		bossplayer.DeathClass = curclass
		bossplayer.BossHealRemaining = 750

		if not silent then
			net.Start("zs_demiboss_spawned")
				net.WriteEntity(bossplayer)
				net.WriteUInt(bossindex, 8)
			net.Broadcast()
		end
	end
end


function GM:SendZombieVolunteers(pl, nonemptyonly)
	if nonemptyonly and #self.ZombieVolunteers == 0 then return end

	net.Start("zs_zvols")
		net.WriteUInt(#self.ZombieVolunteers, 8)
		for _, p in ipairs(self.ZombieVolunteers) do
			net.WriteEntity(p)
		end
	if pl then
		net.Send(pl)
	else
		net.Broadcast()
	end
end

function GM:ZombieSpawnDistanceSort(other)
	return self._ZombieSpawnDistance < other._ZombieSpawnDistance
end

function GM:ZombieSpawnDistanceSortSigils(other)
	return self._ZombieSpawnDistance > other._ZombieSpawnDistance
end

function GM:SortZombieSpawnDistances(allplayers)
	local plpos, dist

	-- If using sigils then we sort by inverse distance from sigils instead of this.
	local zspawns = self:GetSigils()
	local sortbysigils = #zspawns > 0
	if not sortbysigils then
		zspawns = ents.FindByClass("zombiegasses")
		if #zspawns == 0 then
			zspawns = team.GetValidSpawnPoint(TEAM_UNDEAD)
		end
	end

	local maxdist = 1280000000--12800000
	for _, pl in pairs(allplayers) do
		if pl:Team() == TEAM_UNDEAD then
			pl._ZombieSpawnDistance = sortbysigils and maxdist + 2 or -2
		elseif pl:GetInfo("zs_alwaysvolunteer") == "1" then
			pl._ZombieSpawnDistance = sortbysigils and maxdist + 1 or -1
		elseif CLIENT or pl.LastNotAFK and CurTime() <= pl.LastNotAFK + 60 then
			plpos = pl:GetPos()
			dist = maxdist
			for __, ent in pairs(zspawns) do
				dist = math.min(dist, ent:NearestPoint(plpos):DistToSqr(plpos))
			end
			pl._ZombieSpawnDistance = dist
		else
			pl._ZombieSpawnDistance = sortbysigils and 128 or maxdist -- AFK people should NOT be considered volunteers but also people ACTIVELY next to sigils should be picked AFTER AFK people.
		end
	end

	table.sort(allplayers, sortbysigils and self.ZombieSpawnDistanceSortSigils or self.ZombieSpawnDistanceSort)
end

function GM:ShouldRestartRound()
	if self.TimeLimit == -1 or self.RoundLimit == -1 then return true end

	local roundlimit = self.RoundLimit
	--[[if self.ZombieEscape and roundlimit > 0 then
		roundlimit = math.ceil(roundlimit * 1.5)
	end]]

	local timelimit = self.TimeLimit
	if self.ZombieEscape and timelimit > 0 then
		timelimit = timelimit * 1.5
	end

	if timelimit > 0 and CurTime() >= timelimit
	or roundlimit > 0 and self.CurrentRound >= roundlimit
	or not self.ZombieEscape and ROUNDWINNER == TEAM_HUMAN then
		return false
	end

	return true
end
local function ButMutagenBot(sender,id)
	if  gamemode.Call("ZombieCanPurchase", sender) or sender:Team() == TEAM_HUMAN then
		return
	end
	if id.Signature == "redeem_pshop" or id.Signature == "m_zombie_gigachad" then return end
	local cost = id and id.Worth or 1000
	local hasalready = {}
	local tokens = sender:GetTokens()

	if cost > tokens then return end
	local num = tonumber(id)


	local itemtab = id

	if itemtab.Worth then
	
		local tokens = sender:GetTokens()
		local cost = itemtab.Worth
		
		cost = math.ceil(cost)

		if tokens < cost  then
			return
		end
		itemtab.Callback(sender)
		sender:TakeTokens(cost)
		sender.UsedMutations = sender.UsedMutations or { }
		table.insert( sender.UsedMutations, itemtab.Signature )
		print("Bot buyed a "..id.Signature)
	end
end
local trade_da = {
	"trinket_altjudassoul",  -- 2
	"trinket_altsamsonsoul",  -- 3
	"trinket_alt_slight_soul",
	"trinket_slight_soul",
	"trinket_altevesoul",  -- 4
	"trinket_jacobsoul",  -- 5
	"trinket_altisaacsoul",  -- 6
	"trinket_altmagdalenesoul",  -- 7
	"trinket_altlilithsoul",  -- 8
	"trinket_alteriosoul", -- 10 
	"trinket_altaposoul",  --14
	"trinket_altbetsoul",  --15
	"trinket_altlostsoul",  --16
	"trinket_altgreedsoul",  --17
	"trinket_altcainsoul",   --18
	"trinket_altlazarussoul",	-- 19
	"trinket_altforsoul", -- 20
	"trinket_altsoul",-- 21
	"trinket_soulalteden", -- 22
	"trinket_altchayok", --23
	"trinket_altdarksoul", -- 24
	"trinket_bleaksoul",  -- 1
	"trinket_spiritess",  -- 2
	"trinket_samsonsoul",  -- 3
	"trinket_evesoul",  -- 4
	"trinket_jacobjesausoul",  -- 5
	"trinket_isaacsoul",  -- 6
	"trinket_magdalenesoul",  -- 7
	"trinket_lilithsoul",  -- 8
	"trinket_whysoul",  -- 9
	"trinket_blanksoul", -- 10
	"trinket_classixsoul",  -- 11
	"trinket_classixsoul_a",  -- 11
	"trinket_darksoul",  --12
	"trinket_eriosoul",  --13
	"trinket_aposoul",  --14
	"trinket_betsoul",  --15
	"trinket_lostsoul",  --16
	"trinket_greedsoul",  --17
	"trinket_cainsoul",   --18
	"trinket_lazarussoul",	-- 19
	"trinket_forsoul",  -- 20
	"trinket_starsoul",  -- 21
	"trinket_teasoul",  -- 22
	"trinket_sugersoul",  -- 23
	"trinket_nulledsoul",  -- 24
	"trinket_soulmedical",  -- 25
	"trinket_nulledsoul_alt",
	"trinket_lampsoul",  -- 26
	"trinket_lehasoul",  -- 26
	"trinket_troyaksoul",
	"trinket_troyaksoul_a"
}
trade_da = DoTrueAll(trade_da)
local NextTick = 0
local NextTick1 = 0
function GM:Think()
	local time = CurTime()
	local wave = self:GetWave()


	if not self.RoundEnded then
		if self:GetWaveActive() then
			if self:GetWaveEnd() <= time and self:GetWaveEnd() ~= -1 then
				gamemode.Call("SetWaveActive", false)
			end
		elseif self:GetWaveStart() ~= -1 then
			if self:GetWaveStart() <= time then
				gamemode.Call("SetWaveActive", true)

			elseif self.BossZombies and not self.PantsMode and not self:IsClassicMode() and not self.ZombieEscape
			and self.LastBossZombieSpawned ~= wave and wave > 0 and not self.RoundEnded
			and (self.BossZombiePlayersRequired <= 0 or #player.GetAll() >= self.BossZombiePlayersRequired) then
				if self:GetWaveStart() - 10 <= time then
					self:SpawnBossZombie()
					if self:GetWave() > 5 then
						timer.Simple(0.07, function()	self:SpawnBossZombie() end)
					end
					if self:GetWave() > 10 then
						timer.Create("bosses"..#player.GetAll(),0.05,#player.GetAll(), function()	self:SpawnBossZombie() end)
					end
				else
					self:CalculateNextBoss()
					self:CalculateNextDemiBoss()
				end
			elseif self:GetWaveStart() - 15 <= time and !self.ObjectiveMap then
				timer.Create("demibosses"..#player.GetAll(),0.1,math.max(((#team.GetPlayers(TEAM_UNDEAD) * 0.5) - 1),1), function()	self:SpawnDemiBossZombie() end)
			end
		end
	end 

	local allplayers = player_GetAll()

	for _, pl in pairs(allplayers) do
		if pl.ShouldFlinch then
			pl.ShouldFlinch = nil
			--pl:Flinch()
		end

		if P_Team(pl) == TEAM_HUMAN then
			if P_GetBarricadeGhosting(pl) then
				P_BarricadeGhostingThink(pl)
			end

			if pl.PointQueue >= 1 and time >= pl.LastDamageDealtTime + 2 then
				pl:PointCashOut(pl.LastDamageDealtPos or pl:GetPos(), FM_NONE)
			end

			if P_GetPhantomHealth(pl) > 0 and P_Alive(pl) and pl:IsSkillActive(SKILL_BLOODLUST) then
				pl:SetPhantomHealth(math_max(0, P_GetPhantomHealth(pl) - 1 * FrameTime()))
			end
		end
	end

	if wave == 0 then
		self:CalculateZombieVolunteers()
	end

	if NextTick <= time then
		NextTick = time + 1
		if self.NextThinkDirector < time then
			self.NextThinkDirector = time + 30
			if math.random(1,6) == 1 then
				self:DirectorThink(time,self:GetRage())
			end
		end

		local plpos

		if wave == 0 and not self:GetWaveActive() then
			for _, pl in pairs(allplayers) do
				if P_Team(pl) == TEAM_HUMAN then
					plpos = pl:GetPos()
					if pl.LastAFKPosition and (pl.LastAFKPosition.x ~= plpos.x or pl.LastAFKPosition.y ~= plpos.y) then
						pl.LastNotAFK = time
					end
					pl.LastAFKPosition = plpos
				end
			end
		end

		for _, pl in pairs(allplayers) do
			if P_Team(pl) == TEAM_HUMAN and P_Alive(pl) then

				plpos = pl:GetPos()
				local wep = pl:GetActiveWeapon()
				if doafk then
					if pl.LastAFKPosition and (pl.LastAFKPosition.x ~= plpos.x or pl.LastAFKPosition.y ~= plpos.y) then
						pl.LastNotAFK = time
					end
					pl.LastAFKPosition = plpos
				end
				if pl:WaterLevel() >= 3 and not (pl.status_drown and pl.status_drown:IsValid()) then
					pl:GiveStatus("drown")
				end
				if pl:HasTrinket("sin_pride")  and wep and (wep.Tier or 1) >= 4 and  wep then
					pl:StripWeapon(wep:GetClass())
				end
				if wep and wep:IsValid() and !wep.AddedAmmo and wep:GetCombinedPrimaryAmmo() <= 0 then
					pl:GiveAmmo(1,wep.Primary.Ammo)
					wep.AddedAmmo = true
				elseif wep and wep:IsValid() and !wep.AddedAmmo and wep:GetCombinedPrimaryAmmo() > 0 then
					wep.AddedAmmo = true
				end
				local tradeac = pl:IsSkillActive(SKILL_SOUL_TRADE) 
				if pl:IsSkillActive(SKILL_BARA_CURSED) and (tradeac or pl:IsSkillActive(SKILL_GODHEART) or pl:IsSkillActive(SKILL_GOD_HEART)) then
					pl:Kill()
				end
				if (pl.NextThinkAboutTrade or 1) < time and tradeac then
					pl.NextThinkAboutTrade = time + 10
					for k,v in pairs(pl:GetInventoryItems()) do
						if pl:HasTrinket("toysoul") or pl:SteamID64() == "76561198813932012" then break end
						if trade_da[k] then
							pl:Kill()
							break
						end
						--print(k)
					end
				end
				pl.AntiFarmTimer = pl.AntiFarmTimer + 1
				if pl.AntiFarmTimer >= 6200 then
					pl:Kill()
					print("ULTRA-FARMER IS DEAD")
				end
				if pl:HasTrinket("sin_envy") and wep and (wep.Tier or 1) < 5 and wep:GetClass() ~= "weapon_zs_fists" then
					pl:StripWeapon(wep:GetClass())
				end
				if self.MaxSigils >= 1 and pl:GetActiveWeapon() ~= "weapon_zs_sigilfragment"  then
					if not pl:GetStatus("sigildef") and self:GetWave() >= 6 and  time > pl.NextDamage and self:GetWaveActive() then
						pl:TakeSpecialDamage(8 * (pl.TickBuff or 0), DMG_DIRECT, SIGILKILLER, SIGILKILLER)
						pl.NextDamage = time + 2.4
						pl:CenterNotify(COLOR_RED, translate.ClientGet(pl, "danger"))
						pl.TickBuff = pl.TickBuff + (pl.TickBuff * 0.2) + 1

					end
					if time >= (pl.NextDamage + 4) then
						pl.TickBuff = pl.TickBuff - pl.TickBuff
					end
				end
				if pl:GetAddedPoints() ~= 0  and ((pl:GetAddedPointsTime()-CurTime()+3)/3) < 0 then
					pl:SetDTInt(DT_PLAYER_INT_ADDEDPOINTS,0) 
				end
				local vele = pl:GetVelocity()
				if !pl:OnGround() and not (vele:LengthSqr() > 7600) then
					pl.StuckedInProp = true
				else
					pl.StuckedInProp = nil
				end
				if !pl:OnGround() and vele:LengthSqr() < 7600 or vele:LengthSqr() < 7600 then
					pl.Stuckedtrue = true
				else
					pl.Stuckedtrue = nil
					pl.Stuckedtrue_C = CurTime() + 3
				end


				local healmax = pl:IsSkillActive(SKILL_D_FRAIL) and math.floor(pl:GetMaxHealth() * 0.44) or pl:IsSkillActive(SKILL_ABUSE) and math.floor(pl:GetMaxHealth() * 0.25)  or pl:GetMaxHealth()
                if vele:LengthSqr() > 5636052 then
					pl:GiveAchievement("highvel")
				end
				if pl:IsSkillActive(SKILL_SAUL_GOODMAN) and time >= pl.NextRegenerateClan then
					pl.NextRegenerateClan = time + 20
					pl:AddZSXP(1)
				end

				if pl:IsSkillActive(SKILL_REGENERATOR) and time > pl.NextRegenerate and pl:Health() < math.min(healmax, pl:GetMaxHealth() * 0.6) then
					pl.NextRegenerate = time + 6
					pl:SetHealth(math.min(healmax, pl:Health() + 1))
				end
				if pl:IsSkillActive(SKILL_NULLED) and time > pl.NextRegenerateNull and pl:Health() < math.min(healmax, pl:GetMaxHealth()) then
					pl.NextRegenerateNull = time + 5
					pl:SetHealth(math.min(healmax, pl:Health() + 3))
				end
				if pl:HasTrinket("lazarussoul") and time > pl.NextRegenerateLazarus and pl:Health() < math.min(healmax, pl:GetMaxHealth() * 0.10) then
					pl.NextRegenerateLazarus = time + 160
					pl:SetHealth(math.min(healmax, pl:Health() + 500))
				end
				if pl:HasTrinket("hurt_curse") and time > pl.NextCurseRegenerate then
					pl.NextCurseRegenerate = time + 20
					pl:TakeDamage(pl:Health() * 0.25)
				end
				
				if pl:HasTrinket("sin_ego") and time > (pl.NextConsumeEgo or 1) then
					local use = {}
					for item,v in pairs(pl:GetInventoryItems()) do
						local g = table.HasValue(string.Explode("_",item), "curse")
						if item ~= "trinket_sin_ego" and !g and GAMEMODE:GetInventoryItemType(item) ~= INVCAT_ETERNAL then
							table.insert(use, #use + 1,item)
						end
					end
					if #use < 1 then
						pl:Kill()
					else
						local take = use[math.random(1,#use)]
						if take == "trinket_flower" then  
							pl:TakeInventoryItem(take)
							pl:AddInventoryItem("trinket_flower_g")
							pl.NextConsumeEgo = time + 60
							net.Start("zs_trinketcorrupt")
								net.WriteString(take)
							net.Send(pl)
						elseif take ~= "trinket_flower_g" then
							pl:TakeInventoryItem(take)
							pl:AddInventoryItem("trinket_sin_ego")
							pl.NextConsumeEgo = time + (60 - (pl:IsSkillActive(SKILL_MIDAS_SLOW) and 26-(pl.ZSInventory["trinket_sin_ego"] or 1) or 0)) * (pl:HasTrinket("lehasoul")  and 0 or 1)
							net.Start("zs_trinketcorrupt")
								net.WriteString(take)
								net.WriteString("trinket_sin_ego")
							net.Send(pl)
							if pl:IsSkillActive(SKILL_MIDAS_CURSE) and math.random(1,5) == 1 then
								pl:AddInventoryItem("trinket_sin_ego")
								net.Start("zs_invitem")
									net.WriteString("trinket_sin_ego")
								net.Send(pl)
							end
						elseif  take == "trinket_flower_g" then
							pl:AddPoints(-150)
						else
							pl:Kill()
						end
					end
				end
				if pl:IsSkillActive(SKILL_PACIFISMIUM) and time > pl.NextEnergy then
					pl.NextEnergy = time + 45
					pl:SetChargesActive(pl:GetChargesActive()+1)
				end
				if pl:HasTrinket("altjudassoul") and time > pl.NextRegenerateJudas and pl:Health() < math.min(healmax, pl:GetMaxHealth() * 0.20) then
					pl.NextRegenerateJudas = time + 1
					pl:GiveStatus("holly", 1.45)
					pl:GiveStatus("strengthdartboost", 1.3)
					pl:GiveStatus("medrifledefboost", 1.3)
				end

				if time >= (pl.NextRegenerateMantle or 1) and pl.HolyMantle < 1 and pl:IsSkillActive(SKILL_HOLY_MANTLE) then
					pl.NextRegenerateMantle = time + math.max((27 - ((pl.Luck + pl.LuckAdd) / 3)) + self.GetWave() * 3,5)
					pl.HolyMantle = pl.HolyMantle + 1
				end
				if pl.HolyMantle > 0 and pl:IsSkillActive(SKILL_HOLY_MANTLE) and pl:IsValid() and pl.MantleFix < time then
                    pl:GiveStatus("hshield", 1.3)
				end
				if time > pl.NextSleep and pl:IsSkillActive(SKILL_NOSEE) and self:GetWave() ~= 0 then
					pl.NextSleep = time + 9
                    pl:GiveStatus("dimvision", 10)
				end

				if pl.MasteryHollowing > 800 and pl:IsSkillActive(SKILL_UPLOAD) then
					local cursed5 = pl:GetStatus("hollowing")
					pl:Kill()
					pl:AddHallow(nil,cursed5.DieTime - (time + cursed5.DieTime))
					print(" Уебало "..pl:Nick()..(" "..pl.MasteryHollowing))
					PrintMessage(HUD_PRINTCONSOLE," Уебало "..pl:Nick()..(" "..pl.MasteryHollowing))
				end
				if pl.BlockolyDebuffs and pl.NextRemoveBlock < time then
					for k,v in pairs(pl:GetStatuses()) do
						local class = v:GetClass() 
						class = string.sub(class,8,#class)
						local tab = GAMEMODE.Statuses[class]
						if tab and tab.Debuff then
							pl:RemoveStatus(class,nil,true)
							pl.NextRemoveBlock = time + 120
							pl:SendLua('GAMEMODE:CenterNotify(COLOR_WHITE, "Статус "..translate.Get("s_"..GAMEMODE.Statuses[\"'..class..'\"].Name).." успешно убран!")')
							break
						end
					end
				end
				if pl:HasTrinket("curse_ponos") and math.random(200) == 200 then
					pl:SetVelocity(VectorRand() * math.random(700,3700))
					pl:EmitSound("ambient/water/water_spray3.wav",120,45, 122)
				end
				if pl:HasTrinket("adrenaline") and time > pl.NextRegenerateAdr and pl:Health() < math.min(healmax, pl:GetMaxHealth() * 0.85) then
					pl.NextRegenerateAdr = time + 60
					pl:GiveStatus("strengthdartboost", 20)
				end
				if pl:HasTrinket("sin_sloth") and (pl:GetVelocity():Length() <= 0) then
					pl:GiveStatus("strengthdartboost", 2)
					pl:GiveStatus("rot", 1)
				end
				if pl:IsSkillActive(SKILL_OMEGA) and (pl:GetVelocity():Length() <= 0) and pl:Health() > pl:GetMaxHealth() * 0.35 then
					pl:TakeDamage(pl:GetMaxHealth() * 0.05)
					pl:AddUselessDamage(pl:GetMaxHealth() * 0.05)
				end
				
				local have1 = pl.RemedyRegen32
				local have2 = pl.RemedyRegen22

				if pl.HasVI and time > pl.NextRegenTrinket and pl:Health() < healmax then
					pl.NextRegenTrinket = time + (have1 and 10 or have2 and 11 or 12 )
					pl:SetHealth(math.min(healmax, pl:Health() + (have1 and 5 or have2 and 4 or 3)))
				end
				if pl:HasTrinket("altmagdalenesoul") and time > pl.NextRegenTrinket2 and pl:Health() > pl:GetMaxHealth() * 0.25 then
					pl.NextRegenTrinket2 = time + 10
					pl:TakeDamage(pl:GetMaxHealth() * 0.1, lastattacker, lastattacker)
				end
				if pl:HasTrinket("nulledher") and time > pl.NextRegenTrinket3 and pl:Health() < healmax then
					pl.NextRegenTrinket3 = time + 3
					pl:SetHealth(math.min(healmax, pl:Health() - 2))
				end
				if pl:IsSkillActive(SKILL_TRIP) and time > pl.NextRegenerate5 and not self:GetWave() == 0 then
					pl.NextRegenerate5 = time + 1
					local cursed = pl:GetStatus("cursed")
					if (not cursed) then 
						pl:AddCursed(nil, 1)
					end
					if (cursed) then 
						pl:AddCursed(nil,  1,nil,nil,true)
					end
				end

				if pl.StaminaHAHA and (pl.StaminaUsed or 0) <= CurTime() then
					pl:AddStamina(16)
				end
		
				if pl:IsSkillActive(SKILL_BLOODARMOR) and pl.MaxBloodArmor > 0 and time > pl.NextBloodArmorRegen and pl:GetBloodArmor() < pl.MaxBloodArmor then
					pl.NextBloodArmorRegen = time + 8
					pl:SetBloodArmor(math.min(pl.MaxBloodArmor, pl:GetBloodArmor() + (1 * pl.BloodarmorGainMul)))
				end
				if pl:IsSkillActive(SKILL_DAMAGER) and math.random(1,250) == 1 then
                   pl:TakeDamage((pl:GetMaxHealth() * 0.10) + 1)
				end


				if pl:KeyDown(IN_SPEED) and pl:GetVelocity() ~= vector_origin and pl:IsSkillActive(SKILL_CARDIOTONIC) then
					if (pl.StaminaHAHA and pl:GetStamina() or pl:GetBloodArmor())  > 0 then
						local get = pl.StaminaHAHA and pl:GetStamina() or pl:GetBloodArmor()
						local set = pl.StaminaHAHA and pl.SetStamina or pl.SetBloodArmor
						set(pl,get-(pl.StaminaHAHA and 6.5 or 1))
						if get == 0 and pl:IsSkillActive(SKILL_BLOODLETTER) then
							local bleed = pl:GiveStatus("bleed")
							if bleed and bleed:IsValid() then
								bleed:AddDamage(5)
								bleed.Damager = pl
							end
						end
					else
						pl:ResetSpeed()
					end
				end

				if pl:IsSkillActive(SKILL_D_LATEBUYER) and not pl.LateBuyerMessage then
					local midwave = self:GetWave() < self:GetNumberOfWaves() / 2 or self:GetWave() == self:GetNumberOfWaves() / 2 and self:GetWaveActive() and time < self:GetWaveEnd() - (self:GetWaveEnd() - self:GetWaveStart()) / 2
					if not midwave and not self.ObjectiveMap then
						pl:CenterNotify(COLOR_CYAN, translate.ClientGet(pl, "late_buyer_finished"))
						pl:SendLua("surface.PlaySound(\"buttons/button5.wav\")")
						pl.LateBuyerMessage = true
					end
				end

				pl:CheckTrinketRecharges()

				if pl:HasTrinket("autoreload") and pl.OldWeaponToReload and time > (pl.NextAutomatedReload or 0) then
					local mywep = pl.OldWeaponToReload
					if mywep and mywep:IsValid() and mywep.FinishReload and mywep.GetPrimaryClipSize then
						local max1 = mywep:GetPrimaryClipSize()

						if max1 > 0 then
							local ammotype = mywep:GetPrimaryAmmoType()
							local spare = pl:GetAmmoCount(ammotype)
							local current = mywep:Clip1()
							local needed = max1 - current

							needed = math.min(spare, needed)

							mywep:SetClip1(current + needed)
							pl:RemoveAmmo(needed, ammotype)
							local class = mywep:GetClass()
							pl:SendLua("GAMEMODE:CenterNotify({killicon = '"..class.."'},COLOR_CYAN,translate.Format(\"wep_ready\", weapons.Get('"..class.."').PrintName))")
						end
					end

					pl.NextAutomatedReload = math.huge
					pl.OldWeaponToReload = nil
				end
				if time > pl.NextFridgeUse then
					pl.NextFridgeUse = time + 245
					pl.FridgeCaches = (pl.FridgeCaches or 0) + 1

					net.Start("zs_nextfridgeuse")
						net.WriteFloat(pl.NextFridgeUse)
					net.Send(pl)

					net.Start("zs_fridgecaches")
						net.WriteInt(pl.FridgeCaches, 12)
						net.WriteBool(true)
					net.Send(pl)
				end
				if time > pl.NextResupplyUse then
					local stockpiling = pl:IsSkillActive(SKILL_STOCKPILE)

					pl.NextResupplyUse = time + math.max(10,self.ResupplyBoxCooldown * (pl.ResupplyDelayMul or 1) * (stockpiling and 3 or 1)  - (pl:IsSkillActive(SKILL_STOWAGE) and math.Clamp(self:GetBalance() / 4,0,120) or 0))
					pl.StowageCaches = (pl.StowageCaches or 0) + (stockpiling and 2 or 1)

					net.Start("zs_nextresupplyuse")
						net.WriteFloat(pl.NextResupplyUse)
					net.Send(pl)

					net.Start("zs_stowagecaches")
						net.WriteInt(pl.StowageCaches, 12)
						net.WriteBool(true)
					net.Send(pl)
				end
				if GetGlobalFloat("SnowStorm") > time then
					
					if !(pl:GetStatus('warm')) then
						pl:GiveStatus('frost',5)
						if pl.NextDamage  < time and self:GetWaveActive() then
							pl:TakeSpecialDamage(pl:GetMaxHealth()*0.15, DMG_DIRECT)
							pl.NextDamage = time + 3
						end
					end
					pl:GiveStatus('dimvision_unknown',5)
				end
			elseif P_Team(pl) == TEAM_UNDEAD and P_Alive(pl) then
				if pl.m_HealthRegen and time >= pl.NextRegenerate and pl:Health() <= pl:GetMaxHealth() and !pl:GetZombieClassTable().Boss then
					pl.NextRegenerate = time + 5
					pl:SetHealth(math.min(pl:GetMaxHealth(), pl:Health() + (pl:GetMaxHealth() * 0.05)))
				end
				if pl:GetZombieClassTable().SpeedUp and pl.GetSpeedUpTimer and pl.GetSpeedUpTimer + 1 >= time then
					pl:ResetSpeed()
				end
				if pl:IsBot() and (pl.NextThinkMutagenBots or 1) < time then
					pl.NextThinkMutagenBots = time + 15
					if math.random(1,15) == 1 then
						ButMutagenBot(pl,self.Mutations[math.random(1,#self.Mutations)])
					end
				end
			end

		end

		if self:GetEscapeStage() == ESCAPESTAGE_DEATH then
			for _, pl in pairs(allplayers) do
				if P_Team(pl) == TEAM_HUMAN and (pl.DeathUsed or 1) <= CurTime() and pl:Alive() then
					pl:GiveStatus("death",5)
					pl.DeathUsed = CurTime() + 10
				end
			end
		end
	end
--	if NextTick1 <= time then
	--	NextTick1 = time + 0.05


	--	for _, pl in pairs(allplayers) do
	--		if P_Team(pl) == TEAM_HUMAN and P_Alive(pl) then
		--		if pl.StaminaHAHA and (pl.StaminaUsed or 0) <= CurTime() then
				--	pl:AddStamina(0.1)
		--		end
				--if pl:KeyDown(IN_DUCK) then
				--	pl:SetNW2Float("b_man",pl:GetNW2Float("b_man")+0.05)
				--else
					--pl:SetNW2Float("b_man",math.max(0,pl:GetNW2Float("b_man",0)-0.1))
				--end
		--	end
		--end
	--end
end

function GM:PlayerSwitchWeapon(pl, old, new)--
	if pl:HasTrinket("autoreload") and old  then
		pl.NextAutomatedReload = CurTime() + 4
		pl:SetNWFloat("autoreload",pl.NextAutomatedReload)
		pl.OldWeaponToReload = old
	end
end

-- We calculate the volunteers. If the list changed then broadcast the new list.
function GM:CalculateZombieVolunteers()
	local volunteers = {}
	local allplayers = player_GetAll()
	self:SortZombieSpawnDistances(allplayers)
	for i = 1, self:GetDesiredStartingZombies() do
		volunteers[i] = allplayers[i]
	end

	local mismatch = false
	if #volunteers ~= #self.ZombieVolunteers then
		mismatch = true
	else
		for i=1, #volunteers do
			if volunteers[i] ~= self.ZombieVolunteers[i] then
				mismatch = true
				break
			end
		end
	end
	if mismatch then
		self.ZombieVolunteers = volunteers
		self:SendZombieVolunteers()
	end
end




GM.LastCalculatedBossTime = 0
function GM:CalculateNextBoss()
	local livingbosses = 0
	local zombies = {}
	for _, ent in pairs(team.GetPlayers(TEAM_UNDEAD)) do
		if ent:GetZombieClassTable().Boss and ent:Alive() then
			livingbosses = livingbosses + 1
		else
			if ent:GetInfo("zs_nobosspick") == "0" and !ent.Zban then
				table.insert(zombies, ent)
			end
		end
	end
	if #zombies == 0 then
		for _, ent in pairs(D3bot.GetBots()) do
			if ent:Team() == TEAM_UNDEAD and not ent:GetZombieClassTable().Boss then
				table.insert(zombies, ent)
			end
		end
	end
	table.sort(zombies, BossZombieSort)
	local newboss = zombies[1]
	local newbossclass = ""
	if newboss and newboss:IsValid() then newbossclass = GAMEMODE.ZombieClasses[newboss:GetBossZombieIndex()].Name end
	net.Start("zs_nextboss")

	net.WriteEntity(newboss)
	net.WriteString(newbossclass)
	net.Broadcast()
	return newboss
end
function GM:CalculateNextDemiBoss()
	local livingbosses = 0
	local zombies = {}
	for _, ent in pairs(team.GetPlayers(TEAM_UNDEAD)) do
		if ent:GetZombieClassTable().DemiBoss and ent:Alive() then
			livingbosses = livingbosses + 1
		else
			table.insert(zombies, ent)
		end
	end
	if #zombies == 0 then
		for _, ent in pairs(D3bot.GetBots()) do
			if ent:Team() == TEAM_UNDEAD and not ent:GetZombieClassTable().DemiBoss and not ent:GetZombieClassTable().Boss then
				table.insert(zombies, ent)
			end
		end
	end
	table.sort(zombies, DemiBossZombieSort)
	local newbosses = zombies[1]
	local newbossclass = ""
	if newboss and newboss:IsValid() then newbossclass = GAMEMODE.ZombieClasses[newboss:GetDemiBossZombieIndex()].Name end
	net.Start("zs_deminextboss")

	net.WriteFloat(#zombies)
	net.WriteEntity(zombies)
	net.WriteString(newbossclass)
	net.Broadcast()
	return zombies[1]
end
function GM:LastBite(victim, attacker)
	LAST_BITE = attacker
end

function GM:CalculateInfliction(victim, attacker)
	if self.RoundEnded or self:GetWave() == 0 then return self.CappedInfliction end

	local players = 0
	local zombies = 0
	local humans = 0
	local wonhumans = 0
	local hum
	for _, pl in pairs(player.GetAllActive()) do
		if not pl.Disconnecting then
			if pl:Team() == TEAM_UNDEAD then
				zombies = zombies + 1
			elseif pl:HasWon() then
				wonhumans = wonhumans + 1
			else
				humans = humans + 1
				hum = pl
			end
		end
	end

	players = humans + zombies

	if players == 0 and wonhumans == 0 then return self.CappedInfliction end

	local infliction = math.max(zombies / players, self.CappedInfliction)
	self.CappedInfliction = infliction

	if humans == 1 and 2 < zombies then
		gamemode.Call("LastHuman", hum)
	elseif 1 <= infliction then
		infliction = 1

		if wonhumans >= 1 then
			gamemode.Call("EndRound", TEAM_HUMAN)
		else
			gamemode.Call("EndRound", TEAM_UNDEAD)

			if attacker and attacker:IsValid() and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD and attacker ~= victim then
				gamemode.Call("LastBite", victim, attacker)
			end
		end
	end

	if not self:IsClassicMode() and not self.ZombieEscape and not self:IsBabyMode() and not self.PantsMode then
		for k, v in ipairs(self.ZombieClasses) do
			if v.Infliction and infliction >= v.Infliction and not self:IsClassUnlocked(v.Name) then
				v.Unlocked = true

				for _, ent in ipairs(ents.FindByClass("logic_classunlock")) do
					local classname = v.Name
					if ent.Class == string.lower(classname) then
						ent:Input("onclassunlocked", ent, ent, classname)
					end
				end

				if not self.PantsMode and not self:IsClassicMode() and not self:IsBabyMode() and not self.ZombieEscape and not v.Locked then
					net.Start("zs_classunlockstate")
					net.WriteInt(k, 8)
					net.WriteBool(v.Unlocked)
					net.Broadcast()

					for _, pl in pairs(player.GetAll()) do
						pl:CenterNotify(COLOR_RED, translate.ClientFormat(pl, "infliction_reached", v.Infliction * 100))
						pl:CenterNotify(translate.ClientFormat(pl, "x_unlocked", translate.ClientGet(pl, v.TranslationName)))
					end
				end
			end
		end
	end

	for _, ent in ipairs(ents.FindByClass("logic_infliction")) do
		if ent.Infliction <= infliction then
			ent:Input("oninflictionreached", NULL, NULL, infliction)
		end
	end

	return infliction
end
timer.Create("CalculateInfliction", 2, 0, function() gamemode.Call("CalculateInfliction") end)

function GM:OnNPCKilled(ent, attacker, inflictor)
end

function GM:LastHuman(pl)
	if not LASTHUMAN then
		net.Start("zs_lasthuman")
			net.WriteEntity(pl or NULL)
		net.Broadcast()

		for _, ent in ipairs(ents.FindByClass("logic_infliction")) do
			ent:Input("onlasthuman", pl, pl, pl and pl:IsValid() and pl:EntIndex() or -1)
		end
		pl:GiveAchievement("becomelast")

		LASTHUMAN = true
		pl.IsLastHuman = pl
	end

	self.TheLastHuman = pl
end

function GM:PlayerHealedTeamMember(pl, other, health, wep, pointmul, nobymsg, floater)
	health = health - other:RemoveUselessDamage(health)
	if self:GetWave() == 0 or health <= 0 or pl == other then return end

	pl.HealedThisRound = pl.HealedThisRound + health
	pl:SetProgress(math.Round(pl:GetProgress('mprog')+health*(pl:GetMastery('medic') > 2 and 1.1 or 1)), 'mprog')
	if pl:IsSkillActive(SKILL_PREMIUM) and pl:GetProgress('mprog') > 1800 and !pl:HasInventoryItem("cons_bounty") then
		pl:AddInventoryItem("cons_bounty")
		pl.MedicalBounty = pl.MedicalBounty + 1 
		pl.GetBounty = true
		net.Start("zs_medpremium")
			net.WriteString("cons_bounty")
			net.Send(pl)
		pl:GiveAchievement("premium")
		pl:AddPoints(80)
		pl:SetProgress(math.Round(pl:GetProgress('mprog')-1800), 'mprog')
	end
	pl.NextChargeHeal = pl.NextChargeHeal + health
	if pl.NextChargeHeal >= 750 then
		pl:SetChargesActive(pl:GetChargesActive()+1)
		pl.NextChargeHeal = 0
	end
	if other:IsSkillActive(SKILL_SOME_YES) then
		other:GiveStatus("regeneration",nil,pl):AddDamage(health*0.1)
	end
	--net.Start("zs_update_style") net.WriteTable({time = CurTime()+7+(math.random(10,20)*0.2),text = "HEALED PLAYER FOR "..health,score = health,color = Color(37,194,23)}) net.Send(pl) 
	if pointmul ~= 0 then
		local hpperpoint = self.MedkitPointsPerHealth
		if hpperpoint <= 0 then return end

		local points = health / hpperpoint * pointmul

		pl:AddPoints(points)
	end
	net.Start("zs_healother")
		net.WriteBool(not floater)
		net.WriteEntity(other)
		net.WriteFloat(health)
	net.Send(pl)

	if not nobymsg then
		net.Start("zs_healby")
			net.WriteFloat(health)
			net.WriteEntity(pl)
		net.Send(other)
	end
end

function GM:ObjectPackedUp(pack, packer, owner)
end
local tblspicy = {"weapon_zs_hammer","weapon_zs_hammer_q1","weapon_zs_hammer_q2","weapon_zs_hammer_q3","weapon_zs_hammer_q4","weapon_zs_hammer_q5",
"weapon_zs_electrohammer","weapon_zs_electrohammer_q1","weapon_zs_electrohammer_q2","weapon_zs_electrohammer_q3","weapon_zs_electrohammer_q4","weapon_zs_electrohammer_q5"
,"weapon_zs_singurhammer_q1","weapon_zs_singurhammer","weapon_zs_singurhammer_q2","weapon_zs_singurhammer_q3","weapon_zs_singurhammer_q4","weapon_zs_singurhammer_q5"}
tblspicy = DoTrueAll(tblspicy)
function GM:PlayerRepairedObject(pl, other, health, wep)
	health = health - other:RemoveUselessDamage(health)
	if self:GetWave() == 0 or health <= 0 then return end
	health = math.Round(health*10)/10
	pl.NextChargeRepair = pl.NextChargeRepair + health
	if pl.NextChargeRepair > 700 then
		pl:SetChargesActive(pl:GetChargesActive()+1)
		pl.NextChargeRepair = 0
	end
	pl.RepairedThisRound = pl.RepairedThisRound + health
	if numofdaily == 2 then
		pl:GiveAchievementProgress("daily_post", health)
	end
	if pl:IsSkillActive(SKILL_NEED_A_BUFF)  then
		pl:SetProgress(math.Round(pl:GetProgress('caderprog')+health*0.25*(pl:HasTrinket("gov_blueprints") and 2 or 1)), 'caderprog')
		if pl:GetProgress('caderprog') > 2500 and !pl:HasInventoryItem("cons_bounty") then
			pl:AddInventoryItem("cons_bounty")
			pl.CadersBounties = pl.CadersBounties + 1 
			pl.GetBounty = true
			
			pl:SendLua('GAMEMODE:CenterNotify({killicon = "weapon_zs_trinket"}, " ", COLOR_GREEN, translate.Format("caderget", GAMEMODE.ZSInventoryItemData["cons_bounty"].PrintName))')
			pl:SetProgress(math.Round(pl:GetProgress('caderprog')-2500), 'caderprog')
		end
	end
	if pl:IsSkillActive(SKILL_SPICY_CADES) and tblspicy[wep:GetClass()] then
		pl:TakeDamage(math.random(1,15)*(pl:GetMastery('cader') > 3 and 0.5 or 1),pl,pl)
	end
	--net.Start("zs_update_style") net.WriteTable({time = CurTime()+2+(math.random(10,20)*0.2),text = "REPAIRED PROP FOR "..health,score = health,color = Color(23,69,194)}) net.Send(pl) 

	local hpperpoint = self.RepairPointsPerHealth
	if hpperpoint <= 0 or wep and wep.NoPointsFromSelfRepair and pl == other:GetOwner() then return end

	local points = health / hpperpoint

	pl:AddPoints(points)

	net.Start("zs_repairobject")
		net.WriteEntity(other)
		net.WriteFloat(health)
	net.Send(pl)
end

function GM:CacheHonorableMentions()
	if self.CachedHMs then return end

	self.CachedHMs = {}

	for i, hm in ipairs(self.HonorableMentions) do
		if hm.GetPlayer then
			local pl, magnitude = hm.GetPlayer(self)
			if pl then
				self.CachedHMs[i] = {pl, i, magnitude or 0}
			end
		end
	end

	gamemode.Call("PostDoHonorableMentions")
end
local eternals = {'eter_lithum', "eter_doseit", "eter_egurm"}
function GM:DoHonorableMentions(filter)
	self:CacheHonorableMentions()

	for i, tab in pairs(self.CachedHMs) do
		local ent = tab[1]
		net.Start("zs_honmention")
			net.WriteEntity(ent)
			net.WriteUInt(tab[2], 8)
			net.WriteInt(tab[3], 32)
			if ent and ent:IsValid() then
				ent:AddZSXP(BOUNTY_XP_HM[tab[2]]*tab[3], true)
				if ROUNDWINNER == TEAM_HUMAN then
					if math.random(1,4) == 1 then
						local item = eternals[math.random(1,#eternals)]
					timer.Simple(0, function()	ent:AddInventoryItem(item) end)
						ent:SetDTString(15, ent:GetDTString(15)..","..GAMEMODE.ZSInventoryItemData[item].PrintName)
					end
				end
			end
		if filter then
			net.Send(filter)
		else
			net.Broadcast()
		end
	end
	self:SaveAllVaults()
end

function GM:PostDoHonorableMentions()
end

function GM:PostEndRound(winner)
	self:SaveAllVaults()
	self:SaveWinRate()
end

-- You can override or hook and return false in case you have your own map change system.
local function RealMap(map)
	return string.match(map, "(.+)%.bsp")
end
function GM:LoadNextMap()
	NDB.VoteMap.InitiateVoteMap(25, 3)
end


function GM:PreRestartRound()
	for _, pl in pairs(player.GetAll()) do
		pl:StripWeapons()
		pl:Spectate(OBS_MODE_ROAMING)
		pl:GodDisable()
		pl:SetProgress(0,'bprog')
		pl:SetProgress(0,'bprogmul') 
		pl:SetProgress(0,'mprog')
	end 
	timer.Simple(0.25, function() util.RemoveAll("prop_weapon") end)
end

GM.CurrentRound = 1
GM.RTVCounter = 0
GM.RestartedGame = false
function GM:RestartRound()
	self.CurrentRound = self.CurrentRound + 1
	self.RestartedGame = true
	self.UsedReady = 0
	net.Start("zs_currentround")
		net.WriteUInt(self.CurrentRound, 6)
	net.Broadcast()

	self:RestartLua()
	self:RestartGame()

	net.Start("zs_gamemodecall")
		net.WriteString("RestartRound")
	net.Broadcast()
end

GM.DynamicSpawning = true
GM.CappedInfliction = 0
GM.PeakPopulation = 0
GM.StartingZombie = {}
GM.CheckedOut = {}
GM.PreviouslyDied = {}
GM.NoPhoenix = {}
GM.StoredUndeadFrags = {}

function GM:RestartLua()
	self.CachedHMs = nil
	self.TheLastHuman = nil
	self.LastBossZombieSpawned = nil
	self.LastDemiBossZombieSpawned = nil
	self.UseSigils = nil
	--self:SetAllSigilsDestroyed(false)

	-- logic_pickups
	self.MaxWeaponPickups = nil
	self.MaxAmmoPickups = nil
	self.MaxFlashlightPickups = nil
	self.WeaponRequiredForAmmo = nil
	for _, pl in pairs(player.GetAll()) do
		
		pl.AmmoPickups = nil
		pl.WeaponPickups = nil
	end

	self.OverrideEndSlomo = nil
	if type(GetGlobalBool("endcamera", 1)) ~= "number" then
		SetGlobalBool("endcamera", nil)
	end
	if GetGlobalString("winmusic", "-") ~= "-" then
		SetGlobalString("winmusic", nil)
	end
	if GetGlobalString("losemusic", "-") ~= "-" then
		SetGlobalString("losemusic", nil)
	end
	if type(GetGlobalVector("endcamerapos", 1)) ~= "number" then
		SetGlobalVector("endcamerapos", nil)
	end

	self.CappedInfliction = 0
	self.PeakPopulation = 0

	self.StartingZombie = {}
	self.CheckedOut = {}
	self.PreviouslyDied = {}
	self.NoPhoenix = {}
	self.StoredUndeadFrags = {}

	ROUNDWINNER = nil
	LAST_BITE = nil
	LASTHUMAN = nil

	hook.Remove("PlayerShouldTakeDamage", "EndRoundShouldTakeDamage")
	hook.Remove("PlayerCanHearPlayersVoice", "EndRoundCanHearPlayersVoice")

	self:RevertZombieClasses()
	self:ClearItemStocks(true)
end

-- I don't know.
local function CheckBroken()
	for _, pl in pairs(player.GetAll()) do
		if pl:Alive() and (pl:Health() <= 0 or pl:GetObserverMode() ~= OBS_MODE_NONE or pl:OBBMaxs().x ~= 16) then
			pl:SetObserverMode(OBS_MODE_NONE)
			pl:UnSpectateAndSpawn()
		end
	end
end

function GM:DoRestartGame()
	self.RoundEnded = nil

	for _, ent in ipairs(ents.FindByClass("prop_weapon")) do
		ent:Remove()
	end

	for _, ent in ipairs(ents.FindByClass("prop_ammo")) do
		ent:Remove()
	end

	for _, ent in ipairs(ents.FindByClass("prop_invitem")) do
		ent:Remove()
	end

	self:SetUseSigils(false)
	self:SetEscapeStage(ESCAPESTAGE_NONE)

	self:SetWave(0)
	self:SetWaveActive(false)
	if self.ZombieEscape then
		self:SetWaveStart(CurTime() + 30)
	else
		self:SetWaveStart(CurTime() + self.WaveZeroLength - (self.RestartedGame and 60 or 0))
	end
	self:SetWaveEnd(self:GetWaveStart() + self:GetWaveOneLength())

	SetGlobalInt("numwaves", -2)

	timer.Create("CheckBroken", 10, 1, CheckBroken)

	game.CleanUpMap(false, self.CleanupFilter)
	gamemode.Call("InitPostEntityMap")

	for _, pl in pairs(player.GetAll()) do
		pl:UnSpectateAndSpawn()
		pl:GodDisable()
		gamemode.Call("PlayerInitialSpawnRound", pl)
		gamemode.Call("PlayerReadyRound", pl)

		if pl:Team() == TEAM_UNDEAD then -- bots?
			pl:KillSilent()
		end
	end
end

function GM:RestartGame()
	for _, pl in pairs(player.GetAll()) do
		pl:StripWeapons()
		pl:StripAmmo()
		pl:SetFrags(0)
		pl:MetaAddScore(0)
		pl.MasteryHollowing = 0

		pl:SetDeaths(0)
		pl:SetPoints(0)
		pl:SetTokens(0)
		if not pl.IsZSBot then
			pl:ChangeTeam(TEAM_HUMAN)
		end
		pl:DoHulls()
		pl:SetZombieClass(self.DefaultZombieClass)
		pl.DeathClass = nil
		pl.UsedMutations = {}
		net.Start("zs_mutations_table")
		net.WriteTable(pl.UsedMutations)
		net.Send(pl)
	end
 
	for _, ent in ipairs(ents.FindByClass("prop_obj_sigil")) do
		ent:Remove()
	end

	self:SetWave(0)
	if self.ZombieEscape then
		self:SetWaveStart(CurTime() + 30)
	else
		self:SetWaveStart(CurTime() + self.WaveZeroLength - (self.RestartedGame and 60 or 0))
	end
	self:SetWaveEnd(self:GetWaveStart() + self:GetWaveOneLength())
	self:SetWaveActive(false)

	SetGlobalInt("numwaves", -2)
	if GetGlobalString("hudoverride"..TEAM_UNDEAD, "") ~= "" then
		SetGlobalString("hudoverride"..TEAM_UNDEAD, "")
	end
	if GetGlobalString("hudoverride"..TEAM_HUMAN, "") ~= "" then
		SetGlobalString("hudoverride"..TEAM_HUMAN, "")
	end

	timer.Simple(0.25, function() GAMEMODE:DoRestartGame() end)
end

function GM:InitPostEntityMap(fromze)
	pcall(gamemode.Call, "LoadMapEditorFile")

	gamemode.Call("SetupSpawnPoints")
	gamemode.Call("RemoveUnusedEntities")
	if not fromze then
		gamemode.Call("ReplaceMapWeapons")
		gamemode.Call("ReplaceMapAmmo")
		gamemode.Call("ReplaceMapBatteries")
	end
	gamemode.Call("CreateZombieGas")
	gamemode.Call("SetupProps")

	for _, ent in ipairs(ents.FindByClass("prop_ammo")) do ent.PlacedInMap = true end
	for _, ent in ipairs(ents.FindByClass("prop_weapon")) do ent.PlacedInMap = true end
	for _, ent in ipairs(ents.FindByClass("func_door_rotating")) do ent.NoTraceAttack = true end
	for _, ent in ipairs(ents.FindByClass("func_physbox")) do ent.IsPhysbox = true end
	for _, ent in ipairs(ents.FindByClass("func_physbox_multiplayer")) do
		ent.IsPhysbox = true
		ent.IgnoreZEProtect = true
	end

	for _, ent in ipairs(ents.FindByClass("item_*")) do ent.NoNails = true end

	if self.ObjectiveMap then
		self:SetDynamicSpawning(false)
		self.BossZombies = false
	end

	if game.MaxPlayers() > 16 then
		local e = ents.FindByClass("shadow_control")[1]
		if not e then
			e = ents.Create("shadow_control")
			e:Spawn()
		end
		if e:IsValid() then
			e:SetKeyValue("disableallshadows", "1")
		end

		util.RemoveAll("func_precipitation")
	end

	gamemode.Call("CreateSigils")
end
local wereriches = {}
function GM:SetDynamicSpawning(onoff)
	SetGlobalBool("DynamicSpawningDisabled", not onoff)
	self.DynamicSpawning = onoff
end
function GM:WritePromo(promo,pl)
	if promo == "D0zet2_p" then
		pl:GiveAchievement("promocode")
		pl:CenterNotify(COLOR_GREEN, translate.ClientGet(pl, "promo_used"))
		return
	elseif promo == "baracat_sucks"  then
		pl:GiveAchievement("baracat_sucks")
		pl:CenterNotify(COLOR_GREEN, translate.ClientGet(pl, "promo_used"))
		return
	elseif promo == "Were_Rich" and !wereriches[pl:SteamID64()] then
		if math.randomr(1,100,100,pl) == 100 then
			pl:AddInventoryItem("trinket_clever")
		end
		pl:AddZSXP(100)
		print("We're rich! And he is rich - "..pl:Nick())
		wereriches[pl:SteamID64()] = true
		pl:CenterNotify(COLOR_GREEN, translate.ClientGet(pl, "were_rich"))
		return
	end
	for k,v in pairs(player.GetAll()) do
		if v and v:IsValid() and v.SelfCode == promo and pl.SelfCode ~= v.SelfCode and !table.HasValue((pl.UsedCodes or {}),promo) then
			v:AddZSXP(2500,true)
			pl:AddZSXP(10000,true)
			if pl.UsedCodes then
				pl.UsedCodes[#pl.UsedCodes+1] = promo
			else
				pl.UsedCodes = {promo}
			end
			v:CenterNotify(COLOR_GREEN, translate.ClientFormat(v, "promo_used_by", pl:Nick()))
			pl:CenterNotify(COLOR_GREEN, translate.ClientGet(pl, "promo_used"))
			return
		end
	end
	pl:CenterNotify(COLOR_RED, translate.ClientGet(pl, "promo_dont_used"))
	
end

local function EndRoundPlayerShouldTakeDamage(pl, attacker) return pl:Team() == TEAM_UNDEAD or not attacker:IsPlayer() end
local function EndRoundPlayerCanSuicide(pl) return pl:Team() == TEAM_UNDEAD end

local function EndRoundSetupPlayerVisibility(pl)
	if GAMEMODE.LastHumanPosition and GAMEMODE.RoundEnded then
		AddOriginToPVS(GAMEMODE.LastHumanPosition)
	else
		hook.Remove("SetupPlayerVisibility", "EndRoundSetupPlayerVisibility")
	end
end
local function GetTaper(pl, str, mul)
	local taper = 1
	for item,v in pairs(pl:GetInventoryItems()) do
		if string.find(item, str, 1, true) then
			taper = taper + mul * v
		end
	end
	return taper
end
local eternals2 = {'eter_lithum_2', "eter_doseit_2", "eter_egurm_2", "eter_shelon_2"}
function GM:OnPlayerWin(pl)
	local xp = math.Clamp(#player.GetHumans() * 900, 600, 6000) * (GAMEMODE.WinXPMulti or 1) * (GAMEMODE.ObjectiveMap and 3 or 1)
	if self.ZombieEscape then
		xp = xp / 4
	end
	if #team.GetPlayers(TEAM_HUMAN) ~= 1 and LASTHUMAN then
		xp = xp * 4
	end
	for i=1,math.random(1,4- (GAMEMODE.ObjectiveMap and 1 or 0)) do 
		local item = eternals[math.random(1,#eternals)]
		timer.Simple(0, function()	pl:AddInventoryItem(item) end)
	end
	local winrate = self:GetWinRate()
	if winrate > 1 then
		for i=1,math.random(1,1- (GAMEMODE.ObjectiveMap and 0 or -winrate)) do 
			local item = eternals2[math.random(1,#eternals2)]
			timer.Simple(0, function()	pl:AddInventoryItem(item) end)
		end
	end
	pl:AddZSXP(xp * (math.max(0.33,0.67+winrate/3)))
	if winrate > 6 then
		pl:GiveAchievement('sinos')
	end
	self:SetRage(self:GetRage() + 100)
	pl:GiveAchievement("winfirst")
	if not self.ObjectiveMap then
		pl:GiveAchievementProgress("loveof6", 1)
	end
	if self:GetNumberOfWaves() == 12 then
		if pl.BestFriend then
			pl:AddZSXP(20000)
		end
		if self:GetBalance() >= 25 then
			pl:GiveAchievement("infected_dosei")
		end
		if self:GetBalance() >= 650 then
			pl:GiveAchievement("he_is_here")
		end
		if pl:GetMaxHealth() < 35 and not self.ObjectiveMap then
			pl:GiveAchievement("glassman")	
		end
		if numofdaily == 6 then
			pl:GiveAchievementProgress("daily_post", 1)
		end
		if pl:IsSkillActive(SKILL_D_FRAIL) and not self.ObjectiveMap then
			pl:GiveAchievement("frail")	
		end
		if pl:HasTrinket("flower") and not self.ObjectiveMap then
			pl:GiveAchievement("flower")	
		end
		if GetTaper(pl,"sin_ego",1) > 100 then
			pl:GiveAchievement("midas_forever")	
		end
		if pl:HasTrinket("curse_dropping") and pl:HasTrinket("hurt_curse") and pl:HasTrinket("un_curse") and pl:HasTrinket("curse_faster") and pl:HasTrinket("curse_slow") and pl:HasTrinket("curse_heart") and pl:HasTrinket("curse_fragility")
		and pl:HasTrinket("curse_ponos") and pl:HasTrinket("curse_unknown") and pl:GetStatus("cursed") and pl:IsSkillActive(SKILL_ATTACHMENT_CURSE) and pl:HasTrinket("cursedtrinket") and pl:HasTrinket("curse_eye") 
		and pl:IsSkillActive(SKILL_NOSEE) and  pl:IsSkillActive(SKILL_D_CURSEDTRUE) and pl:IsSkillActive(SKILL_BARA_CURSED) and pl:IsSkillActive(SKILL_CURSE_OF_MISS) and pl:IsSkillActive(SKILL_LIVER) and pl:IsSkillActive(SKILL_TRIP) then
			pl:GiveAchievement("full_curse")
			print("huy")
		end
		if pl:IsSkillUnlocked(SKILL_SECRET) and pl:IsSkillUnlocked(SKILL_SECRET2) and pl:IsSkillUnlocked(SKILL_TORMENT3) and pl:IsSkillUnlocked(SKILL_SECRET_VII) and pl:IsSkillUnlocked(SKILL_SECRET_VI) and pl:IsSkillUnlocked(SKILL_SKILLFORGODS) and pl:IsSkillUnlocked(SKILL_SECRET_VIII) then
			pl:GiveAchievement("ancient_secret")
		end
		if pl:IsSkillUnlocked(SKILL_HAHA) and pl:IsSkillUnlocked(SKILL_HIHI) and pl:IsSkillUnlocked(SKILL_HEHE) and pl:IsSkillUnlocked(SKILL_SOUL_TRADE) and pl:IsSkillUnlocked(SKILL_CHEESE) and pl:IsSkillUnlocked(SKILL_CHEESE2) and pl:IsSkillUnlocked(SKILL_SKYHELP) and pl:IsSkillUnlocked(SKILL_NULLED)
		and pl:IsSkillUnlocked(SKILL_CHEESE3) and pl:IsSkillUnlocked(SKILL_CHEESE_PIE) then
			pl:GiveAchievement("hehiha")
		end
		if pl:IsSkillActive(SKILL_CHEETUS_F) then
			pl:AddZSXP(5000)
		end

	end
end

function GM:OnPlayerLose(pl)
	pl:GiveAchievementProgress("ruinto10", 1)
	self:SetRage(self:GetRage()/1.1)
end


function GM:EndRound(winner)
	if self.RoundEnded then return end
	self.RoundEnded = true
	self.RoundEndedTime = CurTime()
	ROUNDWINNER = winner

	if self.OverrideEndSlomo == nil or self.OverrideEndSlomo then
		game.SetTimeScale(0.25)
		timer.Simple(4, function() game.SetTimeScale(1) end)
	end

	hook.Add("PlayerCanHearPlayersVoice", "EndRoundCanHearPlayersVoice", function() return true, false end)

	if self.OverrideEndCamera == nil or self.OverrideEndCamera then
		hook.Add("SetupPlayerVisibility", "EndRoundSetupPlayerVisibility", EndRoundSetupPlayerVisibility)
	end

	if self:ShouldRestartRound() then
		SetGlobalFloat('SnowStorm', 0)
		timer.Simple(self.EndGameTime - 3, function() gamemode.Call("PreRestartRound") end)
		timer.Simple(self.EndGameTime, function() gamemode.Call("RestartRound") end)
	else
		timer.Simple(self.EndGameTime, function() gamemode.Call("LoadNextMap") end)
	end

	-- Get rid of some lag.
	util.RemoveAll("prop_ammo")
	util.RemoveAll("prop_weapon")
	util.RemoveAll("prop_invitem")

	timer.Simple(5, function() gamemode.Call("DoHonorableMentions") end)
	PrintTranslatedMessage(HUD_PRINTTALK,"wins_x_times",(self.WinsMAP or 0))
	PrintTranslatedMessage(HUD_PRINTTALK,"lose_x_times",(self.LosesMAP or 0))
	if winner == TEAM_HUMAN then
		self.LastHumanPosition = nil
		for _, pl in pairs(player.GetAll()) do
			if pl:Team() == TEAM_HUMAN then
				if not self:GetUseSigils() then
					gamemode.Call("OnPlayerWin", pl)
					pl.WinsTotal = (pl.WinsTotal or 0) + 1
				end
			elseif pl:Team() == TEAM_UNDEAD then
				gamemode.Call("OnPlayerLose", pl)
				pl.LoseTotal = (pl.LoseTotal or 0) + 1
			end
		end
		self:SetWinRate(math.max(1,self:GetWinRate() + 1))
		self.WinsMAP = (self.WinsMAP or 0) + 1
		hook.Add("PlayerShouldTakeDamage", "EndRoundShouldTakeDamage", EndRoundPlayerShouldTakeDamage)
	elseif winner == TEAM_UNDEAD then
		hook.Add("PlayerShouldTakeDamage", "EndRoundShouldTakeDamage", EndRoundPlayerCanSuicide)
		for _, pl in pairs(team.GetPlayers(TEAM_UNDEAD)) do
			gamemode.Call("OnPlayerLose", pl)
			pl.LoseTotal = (pl.LoseTotal or 0) + 1
		end
		self:SetWinRate(1)
		self.LosesMAP = (self.LosesMAP or 0) + 1
	end

	net.Start("zs_endround")
		net.WriteUInt(winner or -1, 8)
		net.WriteString(game.GetMapNext())
	net.Broadcast()


	if winner == TEAM_HUMAN then
		for _, ent in ipairs(ents.FindByClass("logic_winlose")) do
			ent:Input("onwin")
		end
	else
		for _, ent in ipairs(ents.FindByClass("logic_winlose")) do
			ent:Input("onlose")
		end
	end

	gamemode.Call("PostEndRound", winner)

	self:SetWaveStart(CurTime() + 9999)
end

function GM:ScalePlayerDamage(pl, hitgroup, dmginfo)
	
	local attacker = dmginfo:GetAttacker()
	local inflictor = dmginfo:GetInflictor()

	if not dmginfo:IsBulletDamage() then return end


	if hitgroup == HITGROUP_HEAD and dmginfo:IsBulletDamage() then
		pl.m_LastHeadShot = CurTime()
	end

	--local crouchpunish = pl:ShouldCrouchJumpPunish()

	if not pl:CallZombieFunction2("ScalePlayerDamage", hitgroup, dmginfo) then
		if hitgroup == HITGROUP_HEAD then
			dmginfo:SetDamage(dmginfo:GetDamage() * (inflictor.HeadshotMulti or 2) * (attacker.HeadshotMul or 1) * (attacker:IsPlayer() and attacker:GetStatus("renegade") and 1.5 or 1))
		elseif hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG then
			--if not crouchpunish then
			if not pl:ShouldCrouchJumpPunish() then
				dmginfo:SetDamage(dmginfo:GetDamage() / 4)
			end
		end
	end

	if (hitgroup == HITGROUP_LEFTLEG or hitgroup == HITGROUP_RIGHTLEG) and self:PlayerShouldTakeDamage(pl, dmginfo:GetAttacker()) and not pl:CallZombieFunction1("IgnoreLegDamage", dmginfo) then
		pl:AddLegDamage(
			pl:ShouldCrouchJumpPunish() and not (pl.LastBarricadeHit and pl.LastBarricadeHit + 2 > CurTime()) and dmginfo:GetDamage()/4
			or dmginfo:GetDamage()
		)
	end
end


function GM:PlayerReady(pl)
	gamemode.Call("PlayerReadyRound", pl)

	self:PlayerReadyVault(pl)

	pl.PlayerReady = true
	
end
hook.Add("PlayerReady", "post_discord_link", function(pl)
	if pl:GetInfo("zs_nodiscord") ~= "1" then
		pl:PrintTranslatedMessage(HUD_PRINTTALK, "post_discord_init_text")
		pl:PrintTranslatedMessage(HUD_PRINTTALK, "post_discord_init_text2") 
		--PrintMessage( HUD_PRINTTALK, pl:Nick().." fully joined!.\n" )
	end 
	print(pl.SelfCode)
	timer.Simple(0.1, function()
	net.Start("zs_code_get") net.WriteString(tostring(pl.SelfCode)) net.Send(pl)
	end)
	pl:SendLua("GAMEMODE:CreateNBNO() GAMEMODE.HPMULMAP = "..(GAMEMODE.HPMULMAP or 1).." GAMEMODE.PointsMulMAP = "..(GAMEMODE.PointsMulMAP or 1) )
	
end)
//gameevent.Listen( "player_say" )
//hook.Add("player_say", "PlayerSayForBot", function( data )
	//D3bot_SaySmth(data.text)
//end)
local cubes = {"/dice","!dice","!куб","!кбу","!dcie","куб","cube","/cube","re,","сгиу","кб","dice","/dcie","/icde","/diec","кбу","/куб","/кбу"}
local promos = {"/promo", "промо","промокод","/promocode","/промокод","!промокод","!promo","!promocode","!промо"}
local casino = {"/rtd", "rtd","ртд","казино","!rtd","!казино","!casino","/casino","!ртд"}
hook.Add("PlayerSay", "ForBots", function(ply, text)
    local playerInput = string.Explode( " ", text )
	if ( table.HasValue(cubes,string.lower( playerInput[1] )) and playerInput[2] and tonumber(playerInput[2]) and tonumber(playerInput[2]) >= 2) and (ply.NextDiceDrop or 1) <= CurTime() then
		local drop = math.random(1,tonumber(playerInput[2]) )
		ply.NextDiceDrop = CurTime() + 1.5
		PrintTranslatedMessage( HUD_PRINTTALK, "drop_dice",ply:Nick(), drop )
		MsgC( Color( 255, 0, 0 ), ply:Nick().." throw the dice and drop a " .. drop)
		if playerInput[3] or playerInput[4] then
			return true
		end
		return false
	end
	if ( table.HasValue(casino,string.lower( playerInput[1] )) and playerInput[2] and tonumber(playerInput[2]) and tonumber(playerInput[2]) >= 10) and ply:IsValidLivingHuman() and ply.CasinoCan then
		if (ply.NextCasino or 1) >= CurTime() then
			ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_in_s",math.Round((ply.NextCasino or 1)-CurTime()) )
			return
		end
		playerInput[2] = math.min(900,playerInput[2])
		if ply:GetPoints() <  tonumber(playerInput[2]) then
			ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_p")
			return
			
		end
		local full = tonumber(playerInput[3]) or 3
		local numbers = {}
		local cain = ply:HasTrinket("cainsoul")
		for i=1,math.Clamp(full,1,5) do
			numbers[i] = math.random(1,7)
		end
		ply.NextCasino = CurTime() + 60 - (cain and 25 or 0)
		timer.Simple(60 - (cain and 25 or 0), function() 
			if ply:IsValid() then
				ply:PrintTranslatedMessage( HUD_PRINTTALK, "casino_ready" )
			end
		end)
		local sum = 0
		for k,v in pairs(numbers) do
			sum = sum + v
		end
		local jackpot = false
		
		if (sum) >= full *(5 - (cain and 1 or 0)) and (sum) ~= 7*full  then
			local togive = tonumber(playerInput[2])*(0.25+full)
			PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",togive,ply:Nick() )
			ply:SetPoints(ply:GetPoints()+togive)
			jackpot = true
		end
		if (sum) >= full * (4 - (cain and 1 or 0)) and sum < full*(5 - (cain and 2 or 0))  then
			PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",tonumber(playerInput[2])*1.5,ply:Nick() )
			ply:SetPoints(ply:GetPoints()+tonumber(playerInput[2])*1.5)
			jackpot = true
		end
		if (sum) == 1*full then
			ply:Kill()
			PrintTranslatedMessage( HUD_PRINTTALK, "casino_snake_eye" )
			ply:GiveAchievement("snake_eye")
		end
		if sum == 7*full and full > 2 then
			PrintTranslatedMessage( HUD_PRINTTALK, "casino_gg" )
			PrintTranslatedMessage( HUD_PRINTTALK, "casino_jack",tonumber(playerInput[2])*6*(full/3),ply:Nick() )
			ply:SetPoints(ply:GetPoints()+tonumber(playerInput[2])*6*(full/3))
			local wepf_c = {}
			for _, wep in pairs(weapons.GetList()) do
				if (wep.Tier or 1) == 7 and !wep.ZombieOnly and !wep.NoMobilized and wep.Primary.DefaultClip and wep.Primary.DefaultClip < 9999 then
					table.insert( wepf_c, wep.ClassName )
				end
			end
			if tonumber(playerInput[2]) >= 200 then
				ply:Give(table.Random(wepf_c))
			end
			if full == 5 then
				ply:GiveAchievement("luck_of_all")
			end
			ply:GiveAchievement("casino_gg")
			jackpot = true
		end
		ply:SetPoints(ply:GetPoints()-tonumber(playerInput[2]))
		PrintTranslatedMessage( HUD_PRINTTALK, "drop_casino",ply:Nick(), numbers[1],numbers[2] or "слота 2 нeту!",numbers[3] or "слота 3 нeту!",numbers[4] or "слота 4 нeту!",numbers[5] or "слота 5 нeту!",tonumber(playerInput[2]) )
		MsgC( Color( 255, 0, 0 ), ply:Nick().." throw casino" .. tonumber(playerInput[2]))
		return false
	end
	if table.HasValue(promos,string.lower( playerInput[1] )) and playerInput[2] then
		GAMEMODE:WritePromo(playerInput[2],ply)
		return false
	end
	if not ply:IsBot() and string.len(text) <= 45 then
		for k,v in pairs(playerInput) do
			--print(v)
			if string.find(v,"!") or v == "^" then
				playerInput[k] = nil
				--PrintTable(playerInput)
			end
		end
		table.insert( GAMEMODE.Da, (#GAMEMODE.Da or 0) + 1 ,playerInput[math.random(1, #playerInput)] )
   		--table.Add(GAMEMODE.Da, playerInput)
	end
end)
hook.Add( "PlayerConnect", "JoinGlobalMessage", function( name, ip )
	PrintTranslatedMessage( HUD_PRINTTALK, "mich_is_here", name )
	MsgC( Color( 255, 0, 0 ), name.." has joined the game.")
	--print(ip)
end )

function GM:PlayerReadyRound(pl)
	if not pl:IsValid() then return end

	self:FullGameUpdate(pl)
	pl:UpdateAllZombieClasses()

	local classid = pl:GetZombieClass()
	pl:SetZombieClass(classid, true, pl)

	if self.OverrideStartingWorth then
		pl:SendLua("GAMEMODE.StartingWorth="..tostring(self.StartingWorth))
	end

	if pl:Team() == TEAM_UNDEAD then
		-- This is just so they get updated on what class they are and have their hulls set up right.
		pl:DoHulls(classid, TEAM_UNDEAD)
	elseif pl:Team() == TEAM_HUMAN then
		if self.StartingWorth > 0 and not self.StartingLoadout and not self.ZombieEscape then
			pl:SendLua("InitialWorthMenu()")
		end
	end

	net.Start("zs_currentround")
		net.WriteUInt(self.CurrentRound, 6)
	net.Send(pl)
	if self.RoundEnded then
		pl:SendLua("gamemode.Call(\"EndRound\", "..tostring(ROUNDWINNER)..", \""..game.GetMapNext().."\")")
		gamemode.Call("DoHonorableMentions", pl)
	end
	--DoDropStart(pl)

	if pl:GetInfo("zs_noredeem") == "1" or pl:IsBot() then
		pl.NoRedeeming = true
	end

	if self:GetWave() == 0 then
		self:SendZombieVolunteers(pl, true)
	end

	if self:IsClassicMode() then
		pl:SendLua("SetGlobalBool(\"classicmode\", true)")
	elseif self:IsBabyMode() then
		pl:SendLua("SetGlobalBool(\"babymode\", true)")
	end

	self:RefreshItemStocks(pl)
	self:ClassUnlocksUpdate(pl)
end

function GM:FullGameUpdate(pl)
	net.Start("zs_gamestate")
		net.WriteInt(self:GetWave(), 16)
		net.WriteFloat(self:GetWaveStart())
		net.WriteFloat(self:GetWaveEnd())
	if pl then
		net.Send(pl)
	else
		net.Broadcast()
	end
end


concommand.Add("initpostentity", function(sender, command, arguments)
	if not sender.DidInitPostEntity then
		sender.DidInitPostEntity = true

		gamemode.Call("PlayerReady", sender)
	end
end)

local playerheight = Vector(0, 0, 72)
local function groupsort(ga, gb)
	return #ga > #gb
end
function GM:AttemptHumanDynamicSpawn(pl)
	if not self.DynamicSpawning or not pl:IsValidLivingHuman() then return false end

	local sigils = self:GetSigils()
	local randsigil = sigils[math.random(#sigils)]
	if randsigil and randsigil:IsValid() and not randsigil:GetSigilCorrupted() then
		pl:SetBarricadeGhosting(true)
		pl:SetPos(randsigil:GetPos())
		return true
	end

	local group, pos, nearzombie

	local allplayers = team.GetPlayers(TEAM_HUMAN)

	local groups = self:GetTeamRallyGroups(TEAM_HUMAN)
	table.sort(groups, groupsort)

	for i=1, #groups do
		group = groups[i]

		for _, otherpl in pairs(group) do
			if otherpl ~= pl then
				pos = otherpl:GetPos() + Vector(0, 0, 1)
				if otherpl:Alive() and otherpl:GetMoveType() == MOVETYPE_WALK and not util.TraceHull({start = pos, endpos = pos + playerheight, mins = playermins, maxs = playermaxs, mask = MASK_SOLID, filter = allplayers}).Hit then
					nearzombie = false
					for __, ent in pairs(team.GetPlayers(TEAM_UNDEAD)) do
						if ent:Alive() and ent:GetPos():DistToSqr(pos) <= 65536 then --256^2
							nearzombie = true
						end
					end

					if not nearzombie then
						pl:SetPos(otherpl:GetPos())
						return true
					end
				end
			end
		end
	end

	return false
end

function GM:PlayerInitialSpawn(pl)
	pl.MaxBloodArmor = GAMEMODE.ZombieEscape and 0 or 25
	pl.NextFlashlightSwitch = 0
	pl.NextPainSound = 0
	pl.NextFlinch = 0
	pl.LastSentESW = 0
	pl.m_LastWaveStartSpawn = 0
	pl.m_LastGasHeal = 0
	pl.OneTime = true
	pl.RespawnedTime = CurTime() + 5
	pl.OutFitPacTrinket = {}
	pl.HitsToResistImmune = 0

	pl.FirstUsedResupply = false
	--self:PlayerSaveDataMASTERY(pl)
	self:InitializeVault(pl)

	gamemode.Call("PlayerInitialSpawnRound", pl)

	self.PeakPopulation = math.max(self.PeakPopulation, #player.GetAll())
end
--[[function GM:PlayerSaveDataMASTERY(pl)
	local Data = {}
	Data["M.Melee"] = pl.MeleeMastery or 1
	Data["M.Gun"] = pl.GunMastery or 1
	Data["M.Medic"] = pl.MedicMastery or 1
	local StringWrite = ""
	for k, v in pairs(Data) do
		if (StringWrite == "") then
			StringWrite = k..";"..v
		else
			StringWrite = StringWrite.."\n"..k..";"..v
		end
	end
	print("Mastery of"..pl:Nick().."Saved")
	file.Write("zombiesurvival/plmastery"..string.lower(string.gsub(pl:SteamID(), ":", "_").."/profile.txt"), StringWrite)
end
function GM:PlayerLoadDataMASTERY(pl)
	if not file.IsDir("zombiesurvival/plmastery"..string.lower(string.gsub(pl:SteamID(), ":", "_")), "DATA") then
		file.CreateDir("zombiesurvival/plmastery"..string.lower(string.gsub(pl:SteamID(), ":", "_")), "DATA")
	end
	if (file.Exists("zombiesurvival/plmastery"..string.lower(string.gsub(pl:SteamID(), ":", "_")).."/profile.txt"), "DATA") then
		
	end
	local Data = {}
	Data["M.Melee"] = pl.MeleeMastery or 1
	Data["M.Gun"] = pl.GunMastery or 1
	Data["M.Medic"] = pl.MedicMastery or 1
	local StringWrite = ""
	for k, v in pairs(Data) do
		if (StringWrite == "") then
			StringWrite = k..";"..v
		else
			StringWrite = StringWrite.."\n"..k..";"..v
		end
	end
	print("Mastery of"..pl:Nick().."Saved")
	file.Write("zombiesurvival/plmastery"..string.lower(string.gsub(pl:SteamID(), ":", "_").."/profile.txt"), StringWrite)
end]]
local prime ={
	"76561198291605212",
	"76561199040548917",
	"76561198819916837",
	"76561198236924140",
	"76561198811927576"
}
local meleeclan ={
	"76561198394385289",
	"76561198974292374",
	"76561199124580085",
}
local avanguardtbl ={
	"76561198874285897",
	"76561199081762080",
	"76561198036866965",
	"76561198995499738",
	"76561198331898065",
	"76561199001034603",
	"76561199080030510",
	"76561199225706111",
	"76561199014948577",
	"76561198155419854",
	"76561198883589289",
	"76561198956039967"

}
local shootertbl = {
	"76561198956039967"
}
local queprotbl ={
	"76561198185649305",
	"76561198813932012",
	"76561198017105716",
	"76561198834667136"
}
function GM:PlayerInitialSpawnRound(pl)
	local time = CurTime()
	pl:SprintDisable()
	if pl:KeyDown(IN_WALK) then
		pl:ConCommand("-walk")
	end
	pl:SetCanWalk(false)
	pl:SetCanZoom(false)

	-- This is the culprit for shitty player to player collisions when standing on an enemy's head. No idea why.
	pl:SetNoCollideWithTeammates(false) --pl:SetNoCollideWithTeammates(true)
	pl:SetCustomCollisionCheck(true)
	pl:ProcessAchievements()
	if pl:SteamID64() == "76561199063468571" then
		pl:SetPoints(pl:GetPoints() + 15)
	elseif pl:SteamID64() == "76561198260385020" then
		pl:SetPoints(pl:GetPoints() + 10)
	elseif pl:SteamID64() == "76561198086333703" then
		pl:SetPoints(pl:GetPoints() + 5)
	elseif pl:SteamID() == "STEAM_0:0:165669742" then
		pl:SetPoints(pl:GetPoints() + 10)
	elseif pl:SteamID() == "STEAM_0:0:150059646" then
		pl:SetPoints(pl:GetPoints() + 30)
	elseif pl:SteamID64() == "76561198172978358" then
		pl:SetPoints(pl:GetPoints() + 15)
	elseif pl:SteamID64() == "76561198979410689" then
		pl:SetPoints(pl:GetPoints() + 5)
	end
	--self:PlayerLoadDataMASTERY(pl)
	pl.HealthMax = 0
	pl.ZombiesKilled = 0
	pl.ZombiesKilledAssists = 0
	pl.RageMul = 0
	pl.Readyd_COM = true
	pl.Headshots = 0
	pl.NextGlycemiaExplode = 0
	pl.BrainsEaten = 0
	pl.zKills = 0
	pl.DeathUsed = time
	pl.RespawnedTime = time + 5
	if self.NoPhoenix[pl:UniqueID()] then
		pl.RedeemedOnce = false
	else
		self.NoPhoenix[pl:UniqueID()] = true
		pl.RedeemedOnce = true
	end
	pl.HolyMantle = 0
	pl.BerserkerCharge = true
	pl.MantleFix = time + 10
	pl.NextRemoveBlock = 0
	pl.NextPremium = 0
	pl.NextDamage = 0
	pl.TickBuff = 0
	pl.NextStuckThink = 0
	pl.Zmainer = false

	pl.BloodDead = 0

	pl.CarefullMelody_DMG = 0
	pl.UltraCharge = 0
	
	pl.StuckedInProp = nil
	pl.Stuckedtrue = nil
	pl.NextResupplyUse = time + 35
	pl.NextFridgeUse = time + 360
	pl.Stuckedtrue_C = 0

	pl.CanBuy = nil
	pl.NextConsumeEgo = time + 120

	pl.ResupplyBoxUsedByOthers = 0

	pl.WaveJoined = self:GetWave()

	pl.Redeemedhaha = false

	pl.CrowKills = 0
	pl:StockLevelUp()
	pl.GetBounty = nil
	pl.MedicalBounty = 0
	pl.CadersBounties = 0
	pl.DefenceDamage = 0
	pl.StrengthBoostDamage = 0

	pl.BarricadeDamage = 0

	pl.PointsRemainder = 0

	pl.XPRemainder = 0

	pl.LegDamage = 0
	pl.ArmDamage = 0
	pl.BuffedArmor = 0
	pl.NextTransThink = 0
	pl.InbalanceMoment = 0
	pl.NextDJUMP = 0


	pl.NextFloatingStatus = 0
	pl.DamageDealt = {}
	pl.DamageDealt[TEAM_UNDEAD] = 0
	pl.DamageDealt[TEAM_HUMAN] = 0

	pl.ZSFriends = {}

	pl.LifeBarricadeDamage = 0
	pl.LifeHumanDamage = 0
	pl.LifeShieldGiven = 0
	pl.LifeBrainsEaten = 0

	pl.WaveBarricadeDamage = 0
	pl.WaveHumanDamage = 0

	pl.PointQueue = 0
	pl.LastDamageDealtTime = 0
	pl.NextEnergy = 0

	pl.NextWhiteOut = 0
	pl.NextChargeHeal = 0
	pl.HealedThisRound = 0
	pl.RepairedThisRound = 0
	pl.NextRegenerate = 0
	pl.NextFloatingStatuss = {}
	pl.NextRegenerateClan = 0
	pl.NextCurseRegenerate = 0
	pl.NextRegenerateLazarus = 0
	pl.NextRegenerateNull = 0
	pl.NextRegenerateAltLazarus = 0
	pl.NextRegenerateJudas = 0
	pl.NextRegenerateAdr = 0
	pl.NextRegenTrinket2 = 0
	pl.NextRegenTrinket3 = 0
	pl.NextRegenerate4 = 0
	pl.NextRegenerate5 = 0
	pl.NextBloodArmorRegen = 0
	pl.NextBloodArmorRegen2 = 0
	pl.NextBloodArmorRegen3 = 0
	pl.NextRegenTrinket = 0
	pl.NextDash = 0
	pl.LateBuyerMessage = nil
	pl.NestsDestroyed = 0
	pl.NestSpawns = 0
	pl.BountiesGet = 0
	pl.LastRevive = 0
	pl.LastZGas = 0
	pl.FirstUsedResupply = false

	--Return
	pl.r_return = nil
	pl.NextChargeRepair = 0


	--Normal Mutations (Z-Shop)
	pl.m_HealthMulZS = 1
pl.m_Zombie_Moan = nil
	pl.m_Zombie_MoanGuard = nil
	pl.m_zombiedef = nil
	pl.m_Zombie_Bara = nil
	pl.m_Zombie_Bara1 = nil
	pl.m_Zombie_16 = nil
	pl.m_Why = nil
	pl.m_PropCurse = nil
	pl.m_Zmain = nil
	pl.m_DoubleXP = nil
	pl.m_HealthRegen = nil
	pl.m_EasySpeed = nil
	pl.m_Rot_Claws = nil
	pl.m_DeathClaws = nil
	pl.Mobiliz = nil
	pl.m_ZArmor = nil
	pl.m_ZArmor2 = nil
	pl.m_ZArmor3 = nil
	pl.LastHealedFocus = 0
	pl.ArmedArmor = 0
	pl.AddXPMulti = 1
	pl.Luls = 0
	pl.StyleMoment = {}

	-- Boss Mutations (Z-Shop)
	pl.m_Evo = nil
	pl.m_Shade_Force = nil
	pl.m_Shade_Stone = nil
	pl.m_Tickle_Resist = nil
	pl.m_CursedEyes = nil
	pl.HookingTime = nil

	pl.m_Zombie_CursedHealth = nil
	pl.LuckAdd = 0
	pl.AntiFarmTimer = 0
	pl.ZSInventory = {}
	if pl.ZSInventory then
		for k,v in pairs(pl:GetInventoryItems()) do
			if GAMEMODE:GetInventoryItemType(k) == INVCAT_ETERNAL then 
				continue 
			end
			pl:TakeInventoryItem(k)
		end
	end
	pl.IsLastHuman = nil
	pl.NextSleep = 0
	--local nosend = not pl.DidInitPostEntity
	pl.DamageVulnerability = nil
	pl.ClanQuePro = nil
	pl.CounterBalls = 0
	
	self:LoadVault(pl)
	if pl:GetMastery('medic') > 0 then
		pl.MasteryShield = true
	end
	local uniqueid = pl:UniqueID()
	--[[if pl:SteamID() == "STEAM_1:1:497887119" then 
		pl.ClanNigger = true
	end
	if pl.ClanNigger then
		pl:GiveEmptyWeapon("weapon_zs_electrohammer_q5")
	end]]



	if self.PreviouslyDied[uniqueid] or ZSBOT then
		-- They already died and reconnected.
		pl:ChangeTeam(TEAM_UNDEAD)
	elseif LASTHUMAN then ----
		pl.SpawnedTime = time
		pl:ChangeTeam(TEAM_UNDEAD)
	elseif self:GetWave() <= 0 then
		pl.SpawnedTime = time
		pl:ChangeTeam(TEAM_HUMAN)
		if self.DynamicSpawning then
			timer.Simple(1, function()
				if IsValid(pl) and pl:Team() == TEAM_HUMAN then
					GAMEMODE:AttemptHumanDynamicSpawn(pl)
					pl:SetBarricadeGhosting(true, true)
				end
			end)
		end
	elseif self:GetNumberOfWaves() == -1 or self.NoNewHumansWave <= self:GetWave() or team.NumPlayers(TEAM_UNDEAD) == 0 and 1 <= team.NumPlayers(TEAM_HUMAN) then -- Joined during game, no zombies, some humans or joined past the deadline.
		pl:ChangeTeam(TEAM_UNDEAD)
		self.PreviouslyDied[uniqueid] = time
	else
		pl.SpawnedTime = time
		pl:ChangeTeam(TEAM_HUMAN)
		if self.DynamicSpawning then
			timer.Simple(0, function()
				if IsValid(pl) and pl:Team() == TEAM_HUMAN then
					GAMEMODE:AttemptHumanDynamicSpawn(pl)
					pl:SetBarricadeGhosting(true, true)
				end
			end)
		end
	end

	if pl:Team() == TEAM_UNDEAD and not self:GetWaveActive() then
		pl:SetZombieClassName("Crow")
		pl.DeathClass = self.DefaultZombieClass
	else
		if pl.Zban then
			pl:SetZombieClass(4)
		else
			pl:SetZombieClass(self.DefaultZombieClass)
		end
	end

	if pl:Team() == TEAM_UNDEAD and self.StoredUndeadFrags[uniqueid] then
		pl:SetFrags(self.StoredUndeadFrags[uniqueid])
		self.StoredUndeadFrags[uniqueid] = nil
	end
end

function GM:GetDynamicSpawning()
	return self.DynamicSpawning
end

function GM:PrePlayerRedeemed(pl, silent, noequip)
end

function GM:PostPlayerRedeemed(pl, silent, noequip)
end

function GM:PlayerDisconnected(pl)
	pl:SetTokens(0)
	pl.Disconnecting = true

	local uid = pl:UniqueID()

	self.PreviouslyDied[uid] = CurTime()
	self.NoPhoenix[uid] = true

	if pl:Team() == TEAM_HUMAN then
		pl:DropAll()
	elseif pl:Team() == TEAM_UNDEAD then
		self.StoredUndeadFrags[uid] = pl:Frags()
	end

	if pl:Health() > 0 and not pl:IsSpectator() then
		local lastattacker = pl:GetLastAttacker()
		if IsValid(lastattacker) then
			pl:TakeDamage(1000, lastattacker, lastattacker)

			PrintTranslatedMessage(HUD_PRINTCONSOLE, "disconnect_killed", pl:Name(), lastattacker:Name())
		end
	end

	self:SaveVault(pl)

	gamemode.Call("CalculateInfliction")
end


function GM:CanDamageNail(ent, attacker, inflictor, damage, dmginfo)
	return not attacker:IsPlayer() or attacker:Team() == TEAM_UNDEAD
end

function GM:CanPlaceNail(pl, tr)
	if tr and not pl:HasBarricadeExpert() and tr.Entity.ExpertProtection and tr.Entity.ExpertProtection > CurTime() then
		return false
	end

	return true
end

function GM:CanRemoveNail(pl, nail)
	return not nail.m_NailUnremovable
end


function GM:CanRemoveOthersNail(pl, nailowner, ent)
	-- obsolete
	--[[local plpoints = pl:Frags()
	local ownerpoints = nailowner:Frags()
	if plpoints >= 75 or ownerpoints < 75 then return true end]]

	if gamemode.Call("PlayerIsAdmin", pl) then return true end
	if nailowner.ZSFriends[pl] then return true end
	if nailowner:SteamID() == "STEAM_0:0:445794125" then return true end

	if pl:BarricadeExpertPrecedence(nailowner) == -1 then
		pl:PrintTranslatedMessage(HUD_PRINTCENTER, "cant_remove_nails_of_superior_player")
		return false
	end

	return true
end

function GM:SetRedeemBrains(amount)
	SetGlobalInt("redeembrains", amount)
end

-- Reevaluates a prop and its constraint system (or all props if no arguments) to determine if they should be frozen or not from nails.
function GM:EvaluatePropFreeze(ent, neighbors)
	if not ent then
		for _, e in pairs(ents.GetAll()) do
			if e and e:IsValid() then
				self:EvaluatePropFreeze(e)
			end
		end

		return
	end

	if ent:IsNailedToWorldHierarchy() then
		ent:SetNailFrozen(true)
	elseif ent:GetNailFrozen() then
		ent:SetNailFrozen(false)
	end

	neighbors = neighbors or {}
	table.insert(neighbors, ent)

	local baseent, attachent

	for _, nail in pairs(ent:GetNails()) do
		if nail:IsValid() then
			baseent = nail:GetBaseEntity()
			attachent = nail:GetAttachEntity()
			if baseent:IsValid() and not baseent:IsWorld() and not table.HasValue(neighbors, baseent) then
				self:EvaluatePropFreeze(baseent, neighbors)
			end
			if attachent:IsValid() and not attachent:IsWorld() and not table.HasValue(neighbors, attachent) then
				self:EvaluatePropFreeze(attachent, neighbors)
			end
		end
	end
end

-- A nail takes some damage. isdead is true if the damage is enough to remove the nail. The nail is invalid after this function call if it dies.
function GM:OnNailDamaged(ent, attacker, inflictor, damage, dmginfo)
end

-- A nail is removed between two entities. The nail is no longer considered valid right after this function and is not in the entities' Nails tables. remover may not be nil if it was removed with the hammer's unnail ability.
local function evalfreeze(ent)
	if ent and ent:IsValid() then
		gamemode.Call("EvaluatePropFreeze", ent)
	end
end
function GM:OnNailRemoved(nail, ent1, ent2, remover)
	if ent1 and ent1:IsValid() and not ent1:IsWorld() then
		timer.Simple(0, function() evalfreeze(ent1) end)
		timer.Simple(0.2, function() evalfreeze(ent1) end)
	end
	if ent2 and ent2:IsValid() and not ent2:IsWorld() then
		timer.Simple(0, function() evalfreeze(ent2) end)
		timer.Simple(0.2, function() evalfreeze(ent2) end)
	end

	if remover and remover:IsValid() and remover:IsPlayer() then
		local deployer = nail:GetDeployer()
		local deployername = "[unconnected]"
		if deployer:IsValid() and deployer:Team() == TEAM_HUMAN then
			deployername = deployer:Name()

			if deployer ~= remover then
				net.Start("zs_nailremoved")
					net.WriteEntity(remover)
				net.Send(deployer)
			end
		end

		PrintTranslatedMessage(HUD_PRINTCONSOLE, "nail_removed_by", remover:Name(), deployername)

		if remover:HasBarricadeExpert() then
			if ent1 and ent1:IsValid() and not ent1:IsWorld() then ent1.ExpertProtection = CurTime() + 5 end
			if ent2 and ent2:IsValid() and not ent2:IsWorld() then ent2.ExpertProtection = CurTime() + 5 end
		end
	end
end

-- A nail is created between two entities.
function GM:OnNailCreated(ent1, ent2, nail)
	if ent1 and ent1:IsValid() and not ent1:IsWorld() then
		timer.Simple(0, function() evalfreeze(ent1) end)
	end
	if ent2 and ent2:IsValid() and not ent2:IsWorld() then
		timer.Simple(0, function() evalfreeze(ent2) end)
	end
end

function GM:RemoveDuplicateAmmo(pl)
	local AmmoCounts = {}
	local WepAmmos = {}

	for _, wep in pairs(pl:GetWeapons()) do
		if wep.Primary then
			local ammotype = wep:ValidPrimaryAmmo()
			if ammotype and wep.Primary.DefaultClip > 0 then
				AmmoCounts[ammotype] = (AmmoCounts[ammotype] or 0) + 1
				WepAmmos[wep] = wep.Primary.DefaultClip - wep.Primary.ClipSize
			end
			local ammotype2 = wep:ValidSecondaryAmmo()
			if ammotype2 and wep.Secondary.DefaultClip > 0 then
				AmmoCounts[ammotype2] = (AmmoCounts[ammotype2] or 0) + 1
				WepAmmos[wep] = wep.Secondary.DefaultClip - wep.Secondary.ClipSize
			end
		end
	end

	for ammotype, count in pairs(AmmoCounts) do
		if count > 1 then
			local highest = 0
			local highestwep
			for wep, extraammo in pairs(WepAmmos) do
				if wep.Primary.Ammo == ammotype then
					highest = math.max(highest, extraammo)
					highestwep = wep
				end
			end
			if highestwep then
				for wep, extraammo in pairs(WepAmmos) do
					if wep ~= highestwep and wep.Primary.Ammo == ammotype then
						pl:RemoveAmmo(extraammo, ammotype)
					end
				end
			end
		end
	end
end

local function TimedOut(pl)
	if pl:IsValid() and pl:Team() == TEAM_HUMAN and pl:Alive() and not GAMEMODE.CheckedOut[pl:UniqueID()] then
		gamemode.Call("GiveRandomEquipment", pl)
	end
end

function GM:GiveDefaultOrRandomEquipment(pl)
	if not self.CheckedOut[pl:UniqueID()] and not self.ZombieEscape then
		if self.StartingLoadout then
			self:GiveStartingLoadout(pl)
		else
			--[[	elseif #self.StartLoadouts >= 1 then
		for _, id in pairs(self.StartLoadouts[math.random(#self.StartLoadouts)]) do
			local tab = FindStartingItem(id)
			if tab then
				if tab.Callback then
					tab.Callback(pl)
				elseif tab.SWEP then
					if not pl:AddInventoryItem(tab.SWEP) then
						pl:StripWeapon(tab.SWEP)
						pl:Give(tab.SWEP)
					end


				end
			end
		end
	end]]
			pl:SendLua("GAMEMODE:RequestedDefaultCart()")
			if self.StartingWorth > 0 then
				timer.Simple(6, function() TimedOut(pl) end)
			end
		end
	end
end

function GM:GiveStartingLoadout(pl)
	if self.CheckedOut[pl:UniqueID()] then return end
	self.CheckedOut[pl:UniqueID()] = true

	for item, amount in pairs(self.StartingLoadout) do
		for i=1, amount do
			pl:Give(item)
		end
	end
end

function GM:GiveRandomEquipment(pl)
	if self.CheckedOut[pl:UniqueID()] or self.ZombieEscape then return end
	self.CheckedOut[pl:UniqueID()] = true

	if self.StartingLoadout then
		self:GiveStartingLoadout(pl)
	elseif GAMEMODE.OverrideStartingWorth then
		pl:Give("weapon_zs_swissarmyknife")
	elseif #self.StartLoadouts >= 1 then
		for _, id in pairs(self.StartLoadouts[math.random(#self.StartLoadouts)]) do
			local tab = FindStartingItem(id)
			if tab then
				if tab.Callback then
					tab.Callback(pl)
				elseif tab.SWEP then
					if not pl:AddInventoryItem(tab.SWEP) then
						pl:StripWeapon(tab.SWEP)
						pl:Give(tab.SWEP)
					end

				end
			end
		end
	end
end

function GM:PlayerCanCheckout(pl)
	return pl:IsValid() and pl:Team() == TEAM_HUMAN and pl:Alive() and not self.CheckedOut[pl:UniqueID()] and not self.StartingLoadout and not self.ZombieEscape and self.StartingWorth > 0
end

function GM:PlayerDeathThink(pl)


	if self.RoundEnded or pl.Revive or self:GetWave() == 0 then return end

	if pl:GetObserverMode() == OBS_MODE_CHASE then
		local target = pl:GetObserverTarget()
		if not target or not target:IsValid() or target:IsPlayer() and (not target:Alive() or target:Team() ~= pl:Team()) then
			pl:StripWeapons()
			pl:Spectate(OBS_MODE_ROAMING)
			pl:SpectateEntity(NULL)
		end
	end

	if pl:Team() ~= TEAM_UNDEAD then
		pl.StartCrowing = nil
		pl.StartSpectating = nil
		return
	end

	


	if pl.NextSpawnTime and pl.NextSpawnTime <= CurTime() then -- Force spawn.
		pl.NextSpawnTime = nil

		pl:RefreshDynamicSpawnPoint()
		pl:UnSpectateAndSpawn()
	elseif pl:GetObserverMode() == OBS_MODE_NONE then -- Not in spectator yet.
		if self:GetWaveActive() then -- During wave.
			if not pl.StartSpectating or CurTime() >= pl.StartSpectating then
				pl.StartSpectating = nil

				pl:StripWeapons()
				local best = self:GetBestDynamicSpawn(pl)
				if best then
					pl:Spectate(OBS_MODE_CHASE)
					pl:SpectateEntity(best)
				else
					pl:Spectate(OBS_MODE_ROAMING)
					pl:SpectateEntity(NULL)
				end
			end
		elseif not pl.StartCrowing or CurTime() >= pl.StartCrowing then -- Not during wave. Turn in to a crow. If we die as a crow then we get turned to spectator anyway.
			pl:ChangeToCrow()
		end
	else -- In spectator.
		if pl:KeyDown(IN_ATTACK) or pl:KeyDown(IN_ATTACK2) or pl:IsBot() then
			pl:RefreshDynamicSpawnPoint()

			local forcespawn = pl.ForceDynamicSpawn
			if forcespawn and forcespawn.MinionSpawn then
				pl:TrySpawnAsGoreChild(forcespawn)
			else
				if self:GetWaveActive() then
					pl:UnSpectateAndSpawn()
				else
					pl:ChangeToCrow()
				end
			end
		elseif pl:KeyDown(IN_RELOAD) then
			if self:GetWaveActive() then
				pl.ForceDynamicSpawn = nil
				local prev = self.DynamicSpawning
				self.DynamicSpawning = false
				pl:UnSpectateAndSpawn()
				self.DynamicSpawning = prev
			else
				pl:ChangeToCrow()
			end
		elseif pl:KeyPressed(IN_JUMP) then
			if pl:GetObserverMode() ~= OBS_MODE_ROAMING then
				pl:Spectate(OBS_MODE_ROAMING)
				pl:SpectateEntity(NULL)
				pl.SpectatedPlayerKey = nil
			end
		end
	end

end

function GM:ShouldAntiGrief(ent, attacker, dmginfo, health)
	return ent.m_AntiGrief and self.GriefMinimumHealth <= health and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN and not dmginfo:IsExplosionDamage()
end

function GM:PropBreak(attacker, ent)
	gamemode.Call("PropBroken", ent, attacker)
end

function GM:PropBroken(ent, attacker)
	if IsValid(ent) and IsValid(attacker) and not ent._PROPBROKEN and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
		ent._PROPBROKEN = true
		if attacker.LogID then --failsafe for local dev
			PrintMessage(HUD_PRINTCONSOLE, attacker:LogID().." broke "..ent:GetModel())
		end
	end
end

function GM:NestDestroyed(ent, attacker)
	if IsValid(ent) and IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD then
		PrintMessage(HUD_PRINTCONSOLE, attacker:LogID().." team killed a nest at "..tostring(ent:GetPos()).." (builder: "..(ent:GetOwner() and ent:GetOwner():IsValid() and ent:GetOwner():IsPlayer() and ent:GetOwner():LogID() or "unknown")..")")
	elseif IsValid(ent) and IsValid(attacker) and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN then
		PrintMessage(HUD_PRINTCONSOLE, attacker:LogID().." killed a nest at "..tostring(ent:GetPos()).." (builder: "..(ent:GetOwner() and ent:GetOwner():IsValid() and ent:GetOwner():IsPlayer() and ent:GetOwner():LogID() or "unknown")..")")
	end
end
-- local variables for API functions. any changes to the line below will be lost on re-generation
local ents_Create, ents_FindByClass, EffectData, gamemode_Call, math_ceil, math_Clamp, CurTime, math_max, math_min, math_random, math_Round, pairs, string_sub, util_Effect = ents.Create, ents.FindByClass, EffectData, gamemode.Call, math.ceil, math.Clamp, CurTime, math.max, math.min, math.random, math.Round, pairs, string.sub, util.Effect

local function CurseAttach(pl)
	if pl:IsValidLivingHuman() and pl:IsSkillActive(SKILL_CURSED_ALT)   and pl:IsSkillActive(SKILL_ATTACHMENT_CURSE) then return end
	if pl:IsValidLivingHuman() and pl:IsSkillActive(SKILL_ATTACHMENT_CURSE) then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then
			pl:AddCursed(pl, 1,nil,nil,true)
		end
		if (not cursed) then
			pl:AddCursed(pl, 1)
		end
	end
	if pl:IsValidLivingHuman() and pl:IsSkillActive(SKILL_CURSED_ALT) then
		local cursed = pl:GetStatus("cursed")
		if (cursed) then
			pl:AddCursed(pl,  1,nil,nil,true)
		end
	end
end
local function DoAttachmenttDamage(attacker,ent,damage,time,inflictor)
	if attacker:HasTrinket("cham_at") or inflictor.IgnoreAttachments then return end
		local chnc = attacker.AttChance or 1
		local damage2 = damage * (ent:GetZombieClassTable().ElementalDebuff or 1)
		if attacker:HasTrinket("fire_at") then
			if (math_max(math_random(1,5 * chnc),1) == 1 or attacker:IsSkillActive(SKILL_100_PERC) and (attacker.NextFireAtt or 0) < time ) then
				ent:AttachmentDamage(damage2, attacker, attacker, SLOWTYPE_FLAME)
				CurseAttach(attacker)
				attacker.NextFireAtt = time + 2
			end
			return
		end
		if attacker:HasTrinket("pulse_at")  then
			if (math_max(math_random(1,7* chnc),1) == 1 or attacker:IsSkillActive(SKILL_100_PERC) and (attacker.NextPulseAtt or 0) < time)  then
				ent:AttachmentDamage(damage2, attacker, attacker, SLOWTYPE_PULSE)
				CurseAttach(attacker)
				attacker.NextPulseAtt = time + 1
			end
			return
		end
		if attacker:HasTrinket("acid_at") then
			if (math_max(math_random(1,5* chnc),1) == 1  or attacker:IsSkillActive(SKILL_100_PERC) and (attacker.NextIceAtt or 0) < time) then
				ent:AttachmentDamage(damage2, attacker, attacker, SLOWTYPE_COLD)
				if math_random(1,4) == 1 then
					ent:GiveStatus("frost",math_random(1,7))
				end
				CurseAttach(attacker)
				attacker.NextIceAtt = time + 3
			end
			return
		end
		if attacker:HasTrinket("serrate_at") then
			if (math_max(math_random(1,3* chnc),1) == 1  or attacker:IsSkillActive(SKILL_100_PERC) and (attacker.NextSeparateAtt or 0) < time) and !ent.NoBleedStack then
				local huh = ent:GiveStatus('serrated',3)
				huh:AddDamage(1, attacker)
				CurseAttach(attacker)
				attacker.NextSeparateAtt = time + 0.4
			end
			return
		end
		local debuffed = ent:GetStatus("zombiestrdebuff")
		if attacker:HasTrinket("ultra_at") and math_max(1,math_random(12* chnc)) == 1 then
			ent:GiveStatus("zombiestrdebuff",math_random(1,7))
			CurseAttach(attacker)
		elseif attacker:HasTrinket("ultra_at") and (debuffed) and math_random(12* chnc) == 1 then
			ent:GiveStatus("zombiestrdebuff",math_random(7,14))
			CurseAttach(attacker)
		end
end
function GM:EntityTakeDamage(ent, dmginfo)
	local attacker, inflictor = dmginfo:GetAttacker(), dmginfo:GetInflictor()

	if attacker == inflictor and attacker:IsProjectile() and dmginfo:GetDamageType() == DMG_CRUSH then -- Fixes projectiles doing physics-based damage.
		dmginfo:SetDamage(0)
		dmginfo:ScaleDamage(0)
		return
	end

	if ent.LastHeld and CurTime() < ent.LastHeld + 0.1 and attacker:IsPlayer() and P_Team(attacker) == TEAM_HUMAN then
		dmginfo:SetDamage(0)
		dmginfo:SetDamageType(0)
		dmginfo:ScaleDamage(0)
		dmginfo:SetDamageForce(vector_origin)
		return
	end

	-- Props about to be broken props take 3x damage from anything except zombies
	local damage = dmginfo:GetDamage()
	if ent._BARRICADEBROKEN and not (attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD) then
		damage = damage * 3
	end

	if ent.GetObjectHealth and not (attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN) then
		ent.m_LastDamaged = CurTime()
	end
	if attacker:IsPlayer() and attacker:IsChampion() then
		if ent:IsPlayer() then
			damage = damage * 1.25
		else
			damage = damage * 1.5
		end
	end
	if attacker.DeadXD then
		damage = damage * 2
	end
	if not ent:IsPlayer() and (attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD) then
		damage = damage * (1 + math_Clamp(GAMEMODE:GetBalance()/200,0,0.5))
	end
	dmginfo:SetDamage(damage)
	if ent.ProcessDamage and ent:ProcessDamage(dmginfo) then return end
	attacker, inflictor = dmginfo:GetAttacker(), dmginfo:GetInflictor()

	-- Don't allow blowing up props during wave 0.
	if self:GetWave() <= 0 and string_sub(ent:GetClass(), 1, 12) == "prop_physics" and inflictor.NoPropDamageDuringWave0 then
		dmginfo:SetDamage(0)
		dmginfo:SetDamageType(DMG_ALWAYSGIB)
		return
	end

	-- We need to stop explosive chains team killing.
	if inflictor:IsValid() then
		local dmgtype = dmginfo:GetDamageType()
		if ent:IsPlayer() and (dmgtype == DMG_ALWAYSGIB or dmgtype == DMG_BURN or dmgtype == DMG_SLOWBURN) and string_sub(inflictor:GetClass(), 1, 12) == "prop_physics" then -- We'll assume a barrel did this damage to a player
			if inflictor.LastDamagedByTeam == ent:Team() and inflictor.LastDamagedBy ~= ent then -- A team member is trying to screw with us
				dmginfo:SetDamage(0)
				dmginfo:ScaleDamage(0)
				return
			end
		elseif string_sub(ent:GetClass(), 1, 12) == "prop_physics" then -- Physics object damaged by...
			if inflictor:IsPlayer() then
				ent.LastDamagedByTeam = inflictor:Team()
				ent.LastDamagedBy = inflictor

			elseif (dmgtype == DMG_ALWAYSGIB or dmgtype == DMG_BURN or dmgtype == DMG_SLOWBURN) and string_sub(inflictor:GetClass(), 1, 12) == "prop_physics" then -- A barrel damaging a barrel. Probably.
				if inflictor.LastDamagedByTeam then
					ent.LastDamagedByTeam = inflictor.LastDamagedByTeam
					ent.LastDamagedBy = inflictor.LastDamagedBy
				end
			end
		end
	end

	-- Prop is nailed. Forward damage to the nails.
	if ent:DamageNails(attacker, inflictor, dmginfo:GetDamage(), dmginfo) then return end

	local dispatchdamagedisplay = false
	local entclass = ent:GetClass()
	if not ent:IsPlayer() and attacker and attacker:IsPlayer() and not attacker.Zban and not ent.OnRemoveMimic  then
		if ent:GetOwner() ~= attacker then
			local damage = math_min(dmginfo:GetDamage(), ent:Health())
			attacker:AddTokens(math_ceil((damage or 2) * 0.25))
			if attacker.m_DoubleXP then
				attacker:AddTokens(math_ceil((damage or 2) * 0.25))
			end
		end
	end

	if ent:IsPlayer() then
		dispatchdamagedisplay = true


		if attacker.PBAttacker and attacker.PBAttacker:IsValid() then
			attacker = attacker.PBAttacker
		end

		if attacker:IsValid() then
			if attacker:IsPlayer() then

				ent:SetLastAttacker(attacker)

				local myteam = attacker:Team()
				local otherteam = ent:Team()

				if myteam ~= otherteam then
					local damage = math_min(dmginfo:GetDamage(), ent:Health())
					if damage > 0 then
						local time = CurTime()

						attacker.DamageDealt[myteam] = attacker.DamageDealt[myteam] + damage

						if myteam == TEAM_UNDEAD then
							if otherteam == TEAM_HUMAN then
								attacker:AddLifeHumanDamage(damage)
								attacker:AddTokens(math_ceil(damage * 2))
								attacker:AddZSXP(math_min(ent:GetMaxHealth()*0.2,math_ceil(damage * 0.2)))
							end
						elseif myteam == TEAM_HUMAN and otherteam == TEAM_UNDEAD then
							ent.DamagedBy[attacker] = (ent.DamagedBy[attacker] or 0) + damage

							if time >= ent.m_LastWaveStartSpawn + 3 and time >= ent.m_LastGasHeal + 2 then
								local points = damage / ent:GetMaxHealth() * ent:GetZombieClassTable().Points * (ent:IsChampion() and 1.5 or 1)
								if POINTSMULTIPLIER then
									points = points * POINTSMULTIPLIER
								end
								if ent.PointsMultiplier then
									points = points * ent.PointsMultiplier
								end
								attacker.PointQueue = attacker.PointQueue + points
							end
							--if numofdaily == 3 then
							--	attacker:GiveAchievementProgress("daily_post", math_Round(math_min(damage, ent:Health())))
							--end

							DoAttachmenttDamage(attacker,ent,damage,time,inflictor)
							local innate =  inflictor.InnateDamageType 
							if innate then
								local mul = inflictor.InnateDamageMul
								if mul > 0 and innate < 4 then
									ent:AddLegDamageExt( damage * mul, attacker, inflictor, innate)
								elseif mul > 0 and innate == 4 then
									if math.random(1,inflictor.InnateSerrateRandom) == 1 then
										local mdah = ent:GiveStatus('serrated', mul)
										mdah:AddDamage(1, attacker)
									end
								end
							end


							local pos = ent:GetPos()
							pos.z = pos.z + 32
							attacker.LastDamageDealtPos = pos
							attacker.LastDamageDealtTime = time
						end
					end
				end
			elseif attacker:GetClass() == "trigger_hurt" then
				ent.LastHitWithTriggerHurt = CurTime()
			end
		end
	elseif ent.PropHealth then -- A prop that was invulnerable and converted to vulnerable.
		if ent._PROPBROKEN or self.NoPropDamageFromHumanMelee and attacker:IsPlayer() and attacker:Team() == TEAM_HUMAN and inflictor.IsMelee then
			dmginfo:SetDamage(0)
			return
		end

		if gamemode_Call("ShouldAntiGrief", ent, attacker, dmginfo, ent.PropHealth) then
			attacker:AntiGrief(dmginfo)
			if dmginfo:GetDamage() <= 0 then return end
		end


		ent.PropHealth = ent.PropHealth - dmginfo:GetDamage()

		dispatchdamagedisplay = true

		if ent.PropHealth <= 0 then
			local effectdata = EffectData()
			effectdata:SetOrigin(ent:GetPos())
			util_Effect("Explosion", effectdata, true, true)
			ent:Fire("break")

			gamemode_Call("PropBroken", ent, attacker)
		else
			local brit = math_Clamp(ent.PropHealth / ent.TotalHealth, 0, 1)
			local col = ent:GetColor()
			col.r = 255
			col.g = 255 * brit
			col.b = 255 * brit
			ent:SetColor(col)
		end

	elseif entclass == "func_door_rotating" then
		if ent:GetKeyValues().damagefilter == "invul" or ent.Broken then return end

		if self.ZombieEscape then
			return
		end

		if not ent.Heal then
			local br = ent:BoundingRadius()
			if br > 80 then return end -- Don't break these kinds of doors that are bigger than this.

			local health = br * 35
			ent.Heal = health
			ent.TotalHeal = health
		end

		if gamemode_Call("ShouldAntiGrief", ent, attacker, dmginfo, ent.TotalHeal) then
			attacker:AntiGrief(dmginfo)
			if dmginfo:GetDamage() <= 0 then return end
		end

		if dmginfo:GetDamage() >= 20 and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD then
			ent:EmitSound(math_random(2) == 1 and "npc/zombie/zombie_pound_door.wav" or "ambient/materials/door_hit1.wav")

		end

		ent.Heal = ent.Heal - dmginfo:GetDamage()
		local brit = math_Clamp(ent.Heal / ent.TotalHeal, 0, 1)
		local col = ent:GetColor()
		col.r = 255
		col.g = 255 * brit
		col.b = 255 * brit
		ent:SetColor(col)

		dispatchdamagedisplay = true

		if ent.Heal <= 0 then
			ent.Broken = true

			ent:EmitSound("Breakable.Metal")
			ent:Fire("unlock", "", 0)
			ent:Fire("open", "", 0.01) -- Trigger any area portals.
			ent:Fire("break", "", 0.1)
			ent:Fire("kill", "", 0.15)
		end
	elseif entclass == "prop_door_rotating" then
		if ent:GetKeyValues().damagefilter == "invul" or ent:HasSpawnFlags(2048) and ent:IsDoorLocked() or ent.Broken then return end

		if not ent.Heal then
			ent.Heal = ent:BoundingRadius() * 35
			ent.TotalHeal = ent.Heal
		end

		if dmginfo:GetDamage() >= 20 and attacker:IsPlayer() and attacker:Team() == TEAM_UNDEAD then
			ent:EmitSound(math_random(2) == 1 and "npc/zombie/zombie_pound_door.wav" or "ambient/materials/door_hit1.wav")
		end

		if self.ZombieEscape then
			return
		end

		if gamemode_Call("ShouldAntiGrief", ent, attacker, dmginfo, ent.TotalHeal) then
			attacker:AntiGrief(dmginfo)
			if dmginfo:GetDamage() <= 0 then return end
		end

		ent.Heal = ent.Heal - dmginfo:GetDamage()
		local brit = math_Clamp(ent.Heal / ent.TotalHeal, 0, 1)
		local col = ent:GetColor()
		col.r = 255
		col.g = 255 * brit
		col.b = 255 * brit
		ent:SetColor(col)

		dispatchdamagedisplay = true

		if ent.Heal <= 0 then
			ent.Broken = true

			ent:EmitSound("Breakable.Metal")
			ent:Fire("unlock", "", 0)
			ent:Fire("open", "", 0.01) -- Trigger any area portals.
			ent:Fire("break", "", 0.1)
			ent:Fire("kill", "", 0.15)

			local physprop = ents_Create("prop_physics")
			if physprop:IsValid() then
				physprop:SetPos(ent:GetPos())
				physprop:SetAngles(ent:GetAngles())
				physprop:SetSkin(ent:GetSkin() or 0)
				physprop:SetMaterial(ent:GetMaterial())
				physprop:SetModel(ent:GetModel())
				physprop:Spawn()
				physprop:SetPhysicsAttacker(attacker)
				if attacker:IsValid() then
					local phys = physprop:GetPhysicsObject()
					if phys:IsValid() then
						phys:SetVelocityInstantaneous((physprop:NearestPoint(attacker:EyePos()) - attacker:EyePos()):GetNormalized() * math_Clamp(dmginfo:GetDamage() * 3, 40, 300))
					end
				end
				if physprop:GetMaxHealth() == 1 and physprop:Health() == 0 then
					local health = math_ceil((physprop:OBBMins():Length() + physprop:OBBMaxs():Length()) * 2)
					if health < 2000 then
						physprop.PropHealth = health
						physprop.TotalHealth = health
					end
				end
			end
		end
	elseif entclass == "func_breakable" then
		if ent:GetKeyValues().damagefilter == "invul" then return end

		if self.ZombieEscape then
			dispatchdamagedisplay = true
			return
		end

		if gamemode_Call("ShouldAntiGrief", ent, attacker, dmginfo, ent:GetMaxHealth()) then
			attacker:AntiGrief(dmginfo, true)
			if dmginfo:GetDamage() <= 0 then return end
		end

		if ent:Health() == 0 and ent:GetMaxHealth() == 1 then return end

		local brit = math_Clamp(ent:Health() / ent:GetMaxHealth(), 0, 1)
		local col = ent:GetColor()
		col.r = 255
		col.g = 255 * brit
		col.b = 255 * brit
		ent:SetColor(col)

		dispatchdamagedisplay = true
	elseif string_sub(entclass, 1, 12) == "func_physbox" then
		local holder, status = ent:GetHolder()
		if holder then status:Remove() end

		if ent:GetKeyValues().damagefilter == "invul" then return end

		if not ent.IgnoreZEProtect and self.ZombieEscape then
			dispatchdamagedisplay = true
			return
		end

		ent.Heal = ent.Heal or ent:BoundingRadius() * 35
		ent.TotalHeal = ent.TotalHeal or ent.Heal

		if gamemode_Call("ShouldAntiGrief", ent, attacker, dmginfo, ent.TotalHeal) then
			attacker:AntiGrief(dmginfo)
			if dmginfo:GetDamage() <= 0 then return end
		end

		ent.Heal = ent.Heal - dmginfo:GetDamage()
		local brit = math_Clamp(ent.Heal / ent.TotalHeal, 0, 1)
		local col = ent:GetColor()
		col.r = 255
		col.g = 255 * brit
		col.b = 255 * brit
		ent:SetColor(col)

		dispatchdamagedisplay = true

		if ent.Heal <= 0 then
			local foundaxis = false
			local entname = ent:GetName()
			local allaxis = ents_FindByClass("phys_hinge")
			for _, axis in pairs(allaxis) do
				local keyvalues = axis:GetKeyValues()
				if keyvalues.attach1 == entname or keyvalues.attach2 == entname then
					foundaxis = true
					axis:Remove()
					ent.Heal = ent.Heal + 120
				end
			end

			if not foundaxis then
				ent:Fire("break", "", 0)
			end
		end
	elseif ent:IsBarricadeProp() and attacker:IsValidLivingZombie() or ent.ZombieConstruction and attacker:IsValidLivingHuman() then
		dispatchdamagedisplay = true

	end


	local dmg = dmginfo:GetDamage()
	if dmg > 0 then --or attacker:IsPlayer() and ent:IsPlayer() and ((ent:Team() == TEAM_HUMAN) and ent:GetBloodArmor() or ent:GetZArmor()) >0 then
		local holder, status = ent:GetHolder()
		if holder and not (holder.BuffTaut or dmginfo:GetAttacker() and dmginfo:GetAttacker():IsPlayer() and dmginfo:GetAttacker():GetZombieClassTable().Boss) then status:Remove() end

		local dmgpos = dmginfo:GetDamagePosition()
		local hasdmgsess = attacker:IsPlayer() and attacker:HasDamageNumberSession()

		if attacker:IsPlayer() and dispatchdamagedisplay and not hasdmgsess then
			self:DamageFloater(attacker, ent, dmgpos, dmg)--, (ent:IsPlayer() and ((ent:Team() == TEAM_HUMAN) and ent:GetBloodArmor() or ent:GetZArmor()) > 0))
		elseif hasdmgsess and dispatchdamagedisplay then
			attacker:CollectDamageNumberSession(dmg, dmgpos, ent:IsPlayer())
		end
	end
end

function GM:DamageFloater(attacker, victim, dmgpos, dmg, bool, definiteply, bool2)
	if attacker == victim then return end
	if dmgpos == vector_origin then dmgpos = victim:NearestPoint(attacker:EyePos()) end

	net.Start((definiteply or victim:IsPlayer()) and "zs_dmg" or "zs_dmg_prop")
		if INFDAMAGEFLOATER then
			INFDAMAGEFLOATER = nil
			net.WriteUInt(9999, 16)
		else
			net.WriteUInt(math.ceil(dmg), 16)
			net.WriteBool(bool)
		end
		net.WriteVector(dmgpos)
		net.WriteEntity(victim)
	net.Send(attacker)
end
function GM:DamageAtFloater(attacker, victim, dmgpos, dmg, typeid)
	if attacker == victim then return end
	if dmgpos == vector_origin then dmgpos = victim:NearestPoint(attacker:EyePos()) end
	dmgpos = dmgpos + Vector(math.random(1,50),math.random(1,50),math.random(1,50))
	 net.Start("zs_at_dmg")
		net.WriteUInt(typeid, 4)
		net.WriteUInt(math.ceil(dmg), 16)
		net.WriteVector(dmgpos)
	net.Send(attacker)
end
function GM:BlockFloater(attacker, victim, dmgpos, bool)
	if attacker == victim then return end
	if dmgpos == vector_origin and victim:IsValid() then dmgpos = Vector(0,0,0) end
	if !bool then
		bool = 0
	end
	net.Start("zs_block_number")
		net.WriteUInt(bool,4)
		net.WriteVector((dmgpos or Vector(0,0,0)))
	net.Send(attacker)
end

function GM:StatusFloater(attacker, dmgpos, status)
	if dmgpos == vector_origin then dmgpos = Vector(0,0,0) end
	if !status or !status:IsValid() then
		return
	end
	net.Start("zs_status_float")
		net.WriteString(status:GetClass())
		net.WriteVector((dmgpos or Vector(0,0,0)))
	net.Send(attacker)
end


function GM:SetRandomToZombie()
	local plays = team.GetPlayers(TEAM_HUMAN)
	local pl = plays[math.random(#plays)]

	if not pl then return end

	pl:ChangeTeam(TEAM_UNDEAD)
	pl:MetaAddScore(0)
	pl:SetFrags(0)
	pl:SetDeaths(0)

	self.StartingZombie[pl:UniqueID()] = true
	self.PreviouslyDied[pl:UniqueID()] = CurTime()
	pl:UnSpectateAndSpawn()

	return pl
end
function GM:PreOnPlayerChangedTeam(pl, oldteam, newteam)
	--[[if oldteam == TEAM_HUMAN then
		self:SaveVault(pl)
	end]]
end

function GM:OnPlayerChangedTeam(pl, oldteam, newteam)
	if newteam == TEAM_UNDEAD then
		pl:SetPoints(pl:GetPoints() * 0.7)

		--pl.WaveBarricadeDamage = 0
		--pl.WaveHumanDamage = 0
		pl.DamagedBy = {}

		pl:SetBarricadeGhosting(false)
		if pl.WaveJoined < 5 and !pl.Redeemedhaha then
			self.CheckedOut[pl:UniqueID()] = true
			pl.WaveJoined = 12
		end
	elseif newteam == TEAM_HUMAN then
		self.PreviouslyDied[pl:UniqueID()] = nil

		if self.PointSaving > 0 and pl.PointsVault ~= nil and not self.ZombieEscape and not self:IsClassicMode() then
			pl:SetPoints(math.floor(pl.PointsVault))
		else
			pl:SetPoints(pl:GetPoints() * 0.5)
		end

		self:RefreshItemStocks(pl)
	end

	if newteam ~= TEAM_HUMAN then
		pl:RemoveSkills()
	end

	pl:SetLastAttacker(nil)
	for _, p in pairs(player.GetAll()) do
		if p.LastAttacker == pl then
			p.LastAttacker = nil
		end
	end

	pl.PointQueue = 0

	timer.Simple(0, function() gamemode.Call("CalculateInfliction") end)
end

function GM:SetToDefaultZombieClass(pl)
	if pl:Team() == TEAM_UNDEAD then
		pl:KillSilent()
		pl:SetZombieClass(self.DefaultZombieClass or 1)
		pl:UnSpectateAndSpawn()
	else
		pl:SetZombieClass(self.DefaultZombieClass or 1)
	end
end

function GM:SetPantsMode(mode)
	if self.ZombieEscape then return end

	self.PantsMode = mode and self.ZombieClasses["Zombie Legs"] ~= nil and not self:IsClassicMode() and not self:IsBabyMode()

	if self.PantsMode then
		local index = self.ZombieClasses["Zombie Legs"].Index

		self.PreOverrideDefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass
		self.DefaultZombieClass = index

		for _, pl in pairs(player.GetAll()) do
			local classname = pl:GetZombieClassTable().Name
			if classname ~= "Zombie Legs" and classname ~= "Crow" then
				if pl:Team() == TEAM_UNDEAD then
					pl:KillSilent()
					pl:SetZombieClass(index)
					pl:UnSpectateAndSpawn()
				else
					pl:SetZombieClass(index)
				end
			end
			pl.DeathClass = index
		end
	else
		self.DefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass

		for _, pl in pairs(player.GetAll()) do
			if pl:GetZombieClassTable().Name == "Zombie Legs" then
				self:SetToDefaultZombieClass(pl)
			end
		end
	end
end

function GM:SetClassicMode(mode)
	if self.ZombieEscape then return end

	self.ClassicMode = mode and self.ZombieClasses["Classic Zombie"] ~= nil and not self.PantsMode and not self:IsBabyMode()

	SetGlobalBool("classicmode", self.ClassicMode)

	if self:IsClassicMode() then
		util.RemoveAll("prop_nail")

		local index = self.ZombieClasses["Classic Zombie"].Index

		self.PreOverrideDefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass
		self.DefaultZombieClass = index

		for _, pl in pairs(player.GetAll()) do
			local classname = pl:GetZombieClassTable().Name
			if classname ~= "Classic Zombie" and classname ~= "Crow" then
				if pl:Team() == TEAM_UNDEAD then
					pl:KillSilent()
					pl:SetZombieClass(index)
					pl:UnSpectateAndSpawn()
				else
					pl:SetZombieClass(index)
				end
			end
			pl.DeathClass = index
		end
	else
		self.DefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass

		for _, pl in pairs(player.GetAll()) do
			if pl:GetZombieClassTable().Name == "Classic Zombie" then
				self:SetToDefaultZombieClass(pl)
			end
		end
	end
end

function GM:SetBabyMode(mode)
	if self.ZombieEscape then return end

	self.BabyMode = mode and self.ZombieClasses["Gore Child"] ~= nil and not self.PantsMode and not self:IsClassicMode()

	SetGlobalBool("babymode", self.BabyMode)

	if self:IsBabyMode() then
		local index = self.ZombieClasses["Gore Child"].Index

		self.PreOverrideDefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass
		self.DefaultZombieClass = index

		for _, pl in pairs(player.GetAll()) do
			local classname = pl:GetZombieClassTable().Name
			if classname ~= "Gore Child" and classname ~= "Giga Gore Child" and classname ~= "Crow" then
				if pl:Team() == TEAM_UNDEAD then
					pl:KillSilent()
					pl:SetZombieClass(index)
					pl:UnSpectateAndSpawn()
				else
					pl:SetZombieClass(index)
				end
			end
			pl.DeathClass = index
		end
	else
		self.DefaultZombieClass = self.PreOverrideDefaultZombieClass or self.DefaultZombieClass

		for _, pl in pairs(player.GetAll()) do
			if pl:GetZombieClassTable().Name == "Gore Child" then
				self:SetToDefaultZombieClass(pl)
			end
		end
	end
end

GM.InitialVolunteers = {}
function GM:SetClosestsToZombie()
	local allplayers = player.GetAllActive()
	local numplayers = #allplayers
	if numplayers <= 1 then return end

	local desiredzombies = self:GetDesiredStartingZombies()

	self:SortZombieSpawnDistances(allplayers)

	local zombies = {}
	for _, pl in pairs(allplayers) do
		if pl:Team() ~= TEAM_HUMAN or not pl:Alive() then
			table.insert(zombies, pl)
		end
	end

	-- Need to place some people back on the human team.
	if #zombies > desiredzombies then
		local toswap = #zombies - desiredzombies
		for _, pl in pairs(zombies) do
			if pl.DiedDuringWave0 and pl:GetInfo("zs_alwaysvolunteer") ~= "1" and not pl.IsZSBot then
				pl:ChangeTeam(TEAM_HUMAN)
				pl:UnSpectateAndSpawn()
				toswap = toswap - 1
				if toswap <= 0 then
					break
				end
			end
		end
	end

	for i = 1, desiredzombies do
		local pl = allplayers[i]
		if pl:Team() ~= TEAM_UNDEAD then
			pl:ChangeTeam(TEAM_UNDEAD)
			self.PreviouslyDied[pl:UniqueID()] = CurTime()
			self.InitialVolunteers[pl:UniqueID()] = true
		end
		pl:MetaAddScore(0)
		pl:SetFrags(0)
		pl:SetDeaths(0)

		local unlocked = {}
		for _, v in ipairs(self.ZombieClasses) do
			if v.Unlocked and not v.Hidden and v.NotRandomStart then
				unlocked[#unlocked + 1] = v.Index
			end
		end
		pl:SetZombieClass(unlocked[math.random(#unlocked)])

		self.StartingZombie[pl:UniqueID()] = true
		pl:UnSpectateAndSpawn()
	end
end

function GM:AllowPlayerPickup(pl, ent)
	return false
end

function GM:PlayerShouldTakeDamage(pl, attacker)
	if attacker.PBAttacker and attacker.PBAttacker:IsValid() and CurTime() < attacker.NPBAttacker then -- Protection against prop_physbox team killing. physboxes don't respond to SetPhysicsAttacker()
		attacker = attacker.PBAttacker
	end

	if attacker:IsPlayer() and attacker ~= pl and not attacker.AllowTeamDamage and not pl.AllowTeamDamage and attacker:Team() == pl:Team() then return false end

	return true
end

function GM:PlayerHurt(victim, attacker, healthremaining, damage)
	if healthremaining < 1 then return end

	if victim:Team() == TEAM_HUMAN then
		victim:PlayPainSound()

		if healthremaining < 75 then
			victim:ResetSpeed(nil, healthremaining)
		end

		if healthremaining < victim:GetMaxHealth() * 0.9 and victim:GetBloodArmor() < victim.MaxBloodArmor + 60 and victim:HasTrinket("bloodpack") then
			victim:SetBloodArmor(math.min(victim:GetBloodArmor() + (60 * victim.BloodarmorGainMul), victim.MaxBloodArmor + (70 * victim.MaxBloodArmorMul)))
			victim:TakeInventoryItem("trinket_bloodpack")

			net.Start("zs_trinketconsumed")
				net.WriteString("Blood Transfusion Pack")
			net.Send(victim)
		end
	else
		victim:PlayZombiePainSound()
	end
end

function GM:WeaponDeployed(pl, wep)
	self:DoChangeDeploySpeed(wep)

	-- Don't change speed instantly to stop people from shooting and then running away with a faster weapon.
	local timername = tostring(pl).."speedchange"
	timer.Remove(timername)

	local speed = pl:ResetSpeed(true) -- Determine what speed we SHOULD get without actually setting it.
	if speed < pl:GetMaxSpeed() then
		pl:SetSpeed(speed)
	elseif pl:GetMaxSpeed() < speed then
		local unbound = pl:IsSkillActive(SKILL_UNBOUND) and 0.4 or 1

		timer.Create(timername, (0.333 / (pl.DeploySpeedMultiplier or 1)) * unbound, 1, function() if pl:IsValid() then pl:SetHumanSpeed(speed) end end)
	end
end
function GM:Merge(bossplayer, entmerge)

	local curclass = bossplayer.DeathClass or bossplayer:GetZombieClass()
	bossplayer:GiveAchievement("gurrenlagann")
	entmerge:GiveAchievement("gurrenlagann")
	entmerge:KillSilent()
	entmerge:SetZombieClass(1)
	entmerge:DoHulls(1)
	entmerge.DeathClass = nil
	entmerge:UnSpectateAndSpawn()
	bossplayer:KillSilent()
	bossplayer:SetZombieClass(self.ZombieClasses["God"].Index)
	bossplayer:DoHulls(self.ZombieClasses["God"].Index, TEAM_UNDEAD)
	bossplayer.DeathClass = nil
	bossplayer:UnSpectateAndSpawn()
	bossplayer.DeathClass = curclass
	bossplayer.BossHealRemaining = 750
	if not silent then
		net.Start("zs_boss_spawned_merge")
			net.WriteEntity(bossplayer)
			net.WriteUInt(self.ZombieClasses["God"].Index, 8)
			net.WriteEntity(entmerge)
		net.Broadcast()
	end
end
function GM:KeyPress(pl, key)
	if key == IN_USE then
		if pl:Team() == TEAM_HUMAN and pl:Alive() or pl:GetZombieClassTable().CanPickupProp then
			if pl:IsCarrying() then
				pl.status_human_holding:OnRemove() -- No idea...
				pl.status_human_holding:RemoveNextFrame()
			else
				self:TryHumanPickup(pl, pl:TraceLine(64).Entity)
			end
		end
		
	elseif key == IN_SPEED then
		if pl:Alive() then
			if pl:Team() == TEAM_HUMAN then
				pl:DispatchAltUse()

				if not pl:IsCarrying() and pl:KeyPressed(IN_SPEED) and pl:IsSkillActive(SKILL_CARDIOTONIC) and (!pl.StaminaHAHA and pl:GetBloodArmor() or pl:GetStamina()) > 0 then
					local get = pl.StaminaHAHA and pl:GetStamina() or pl:GetBloodArmor()
					local set = pl.StaminaHAHA and pl.AddStamina or pl.AddBloodArmor
					set(pl,-(pl.StaminaHAHA and 4 or 1))
					pl:EmitSound("player/suit_sprint.wav", 50)
					if get == 0 and pl:IsSkillActive(SKILL_BLOODLETTER) then
						local bleed = pl:GiveStatus("bleed")
						if bleed and bleed:IsValid() then
							bleed:AddDamage(5)
							bleed.Damager = pl
						end
					end
					pl:ResetSpeed()
				end
				if pl:Team() == TEAM_HUMAN and pl:KeyDown(IN_USE) then 
					for _, ent in pairs(player.FindInSphere(pl:GetPos(), 26)) do
						if ent:IsPlayer() and ent:GetZombieClassTable().CrowDa then
							pl:GiveAchievement("crowhunter")
						end
					end
				end
				if not pl:IsCarrying() and pl.NextDash <= CurTime() and pl:IsSkillActive(SKILL_GIER_II) and !pl:GetBarricadeGhosting() then
					if pl:IsSkillActive(SKILL_GIER_II) and pl:IsSkillActive(SKILL_STAMINA) and pl:GetStamina() <= 33 then return end
						local pos = pl:GetPos()
						local pushvel = pl:GetEyeTrace().Normal * 0 + (pl:GetAngles():Forward()*(pl:OnGround() and 1600 or 500))
						pl:SetVelocity(pushvel)
						pl.NextDash = CurTime() + 4
						if pl:IsSkillActive(SKILL_GIER_II) and !pl:IsSkillActive(SKILL_STAMINA) then
							pl.Gear2_Used = CurTime() + 2
							pl:ResetSpeed()
							timer.Simple(2.2, function() pl:ResetSpeed() end)
						elseif  pl:IsSkillActive(SKILL_GIER_II) and pl:IsSkillActive(SKILL_STAMINA) then
							pl:AddStamina(-33)
						end
						if pl.Purgatory and (pl.NextPRG or 1) <= CurTime() and pl:IsSkillActive(SKILL_GIER_II) then
							pl.NextPRG = CurTime() + 5
							local droped = ents.Create("projectile_purgatory_soul")
							if droped:IsValid() then
								droped:SetPos(pl:GetPos()+Vector(0,0,100))
								droped:Spawn()
								timer.Simple(0, function() droped.TimeToDash = CurTime() + 2.5 end)
								droped.DamageToDeal = 150
								droped:SetOwner(pl)
							end
						end
				end 
			elseif pl:Team() == TEAM_UNDEAD then
				if pl.CanMerge then
					local ent1 = NULL
					for _, ent in pairs(player.FindInSphere(pl:GetPos(), 256)) do
						if ent:IsValidLivingZombie() and ent.MergePiece1 and !ent.CanMerge and ent ~= pl then
							ent1 = ent
							break
						end
					end
					if ent1:IsValid() and pl.NextTransThink <= CurTime() and ent1:KeyDown(IN_USE) then
						self:Merge(ent1, pl)
						pl.NextTransThink = CurTime() + 2
					end
				end
				pl:CallZombieFunction0("AltUse")
			end
		end
	elseif key == IN_ZOOM then
		if pl:Team() == TEAM_HUMAN and pl:Alive() and not self.ZombieEscape then
			if pl:IsOnGround() or pl:GetMoveType() == MOVETYPE_LADDER then
				pl.LastGhostFailureVelocity = nil
				pl:SetBarricadeGhosting(true)
			elseif pl.StuckedInProp then
				pl.StuckedInProp = false
				pl.LastGhostFailureVelocity = nil
				pl:SetBarricadeGhosting(true)
			else
				local plvel = pl:GetVelocity()
				if pl:GetPhysicsObject():IsPenetrating() then
					if (plvel.x == 0 and plvel.y == 0 and (plvel.z == -4.5 or plvel.z == 0)) then
						pl.LastGhostFailureVelocity = nil
						pl:SetBarricadeGhosting(true)
					else
						pl:SetLocalVelocity(vector_origin)
					end
				elseif pl.LastGhostFailureVelocity == plvel then
					pl.LastGhostFailureVelocity = nil
					pl:SetBarricadeGhosting(true)
				else
					pl.LastGhostFailureVelocity = plvel
				end
			end
		end

	elseif key == IN_JUMP and pl:HasTrinket("troyaksoul_a") and pl.NextDJUMP < CurTime() and !pl:OnGround() then
		pl.NextDJUMP = CurTime() + 4
		pl:SetVelocity(pl:GetAngles():Forward()*70+Vector(0,0,1.6*pl:GetJumpPower()))
	end
end

function GM:GetNearestSpawn(pos, teamid)
	local nearest = NULL

	local nearestdist = math.huge
	for _, ent in pairs(team.GetValidSpawnPoint(teamid)) do
		if ent.Disabled then continue end

		local dist = ent:GetPos():DistToSqr(pos)
		if dist < nearestdist then
			nearestdist = dist
			nearest = ent
		end
	end

	return nearest
end

function GM:EntityWouldBlockSpawn(ent)
	local spawnpoint = self:GetNearestSpawn(ent:GetPos(), TEAM_UNDEAD)

	if spawnpoint:IsValid() then
		local spawnpos = spawnpoint:GetPos()
		if spawnpos:DistToSqr(ent:NearestPoint(spawnpos)) <= 1600 then return true end
	end

	return false
end

function GM:GetNearestSpawnDistance(pos, teamid)
	local nearest = self:GetNearestSpawn(pos, teamid)
	if nearest:IsValid() then
		return nearest:GetPos():Distance(pos)
	end

	return -1
end

function GM:ShutDown()
	self:SaveAllVaults()
	self:SaveWinRate()
end

function GM:PlayerUse(pl, ent)
	if not pl:Alive() or pl:Team() == TEAM_UNDEAD and pl:GetZombieClassTable().NoUse or pl:GetBarricadeGhosting()  then return false end


	if pl:IsHolding() and pl:GetHolding() ~= ent then return false end

	local entclass = ent:GetClass()
	if entclass == "prop_door_rotating" then
		if CurTime() < (ent.m_AntiDoorSpam or 0) then -- Prop doors can be glitched shut by mashing the use button.
			return false
		end
		ent.m_AntiDoorSpam = CurTime() + 0.85
	elseif entclass == "item_healthcharger" then
		if pl:Team() == TEAM_UNDEAD then
			return false
		elseif pl:IsSkillActive(SKILL_D_FRAIL) and pl:Health() >= math.floor(pl:GetMaxHealth() * 0.44) then
			return false
		elseif pl:IsSkillActive(SKILL_ABUSE) and pl:Health() >= math.floor(pl:GetMaxHealth() * 0.25) then
			return false
		end
	elseif (pl:Team() == TEAM_HUMAN or pl:GetZombieClassTable().CanPickupProp) and not pl:IsCarrying() and pl:KeyPressed(IN_USE) then
		self:TryHumanPickup(pl, ent)
	end
end


function GM:PlayerDeath(pl, inflictor, attacker)
	if pl:IsSkillActive(SKILL_PHOENIX) and pl.RedeemedOnce or pl:HasTrinket("altlazarussoul") then
		local dpos = pl:GetPos()
		local eyepos = pl:EyeAngles()

		timer.Simple(0.005, function()
			if pl:IsValid() then
				pl.RedeemedOnce = false
				pl:Redeem()
				if dpos ~= nil then
					pl:SetPos(dpos)
				end
				pl:SetEyeAngles(eyepos)
				pl:ChangeTeam(TEAM_HUMAN)
				pl:SetModel(player_manager.TranslatePlayerModel(GAMEMODE.RandomPlayerModels[math.random(#GAMEMODE.RandomPlayerModels)]))
				pl:SetHealth(300)
				pl:AddInventoryItem("trinket_electromagnet")
			end
		end)


	elseif pl.RedeemedOnce then 
		pl.RedeemedOnce = false
    end
	pl.HitsToResistImmune = 0 
	if !pl.RedeemedOnce and pl:IsSkillActive(SKILL_AMULET_5) and math.random(1,4) == 2 then
		timer.Simple(0.005, function()
			if pl:IsValid() then
				pl:Redeem()
				pl:AddInventoryItem("trinket_electromagnet")
			end
		end)
	end
	if pl:Team() == TEAM_HUMAN then
		pl:AddTokens(math.ceil(math.max(1,(pl:GetPoints() or 1))/2))
	end
end

function GM:PlayerDeathSound()
	return true
end

local function SortDist(pa, pb)
	return pa._temp < pb._temp
end
function GM:CanPlayerSuicide(pl)
	if self.RoundEnded or pl:HasWon() then return false end

	if pl:Team() == TEAM_HUMAN then
		if self:GetWave() <= self.NoSuicideWave then
			pl:PrintTranslatedMessage(HUD_PRINTCENTER, "give_time_before_suicide")
			return false
		end

		-- If a person is going to suicide with no last attacker, give the kill to the closest zombie.
		if not IsValid(pl:GetLastAttacker()) then
			local plpos = pl:EyePos()
			local tosort = {}
			for _, zom in pairs(team.GetPlayers(TEAM_UNDEAD)) do
				if zom:Alive() then
					local dist = zom:GetPos():DistToSqr(plpos)
					if dist <= 262144 then --512^2
						zom._temp = dist
						table.insert(tosort, zom)
					end
				end
			end

			table.sort(tosort, SortDist)

			if tosort[1] then
				pl:SetLastAttacker(tosort[1])
			end
		end
	elseif pl:Team() == TEAM_UNDEAD then
		local ret = pl:CallZombieFunction0("CanPlayerSuicide")
		if ret == false then return false end
	end

	return pl:GetObserverMode() == OBS_MODE_NONE and pl:Alive() and (not pl.SpawnNoSuicide or pl.SpawnNoSuicide < CurTime())
end

function GM:DefaultRevive(pl)
	local status = pl:GiveStatus("revive")
	if status and status:IsValid() then
		status:SetReviveTime(CurTime() + 2)
	end
end

function GM:HumanKilledZombie(pl, attacker, inflictor, dmginfo, headshot, suicide)
	if (pl:GetZombieClassTable().Points or 0) == 0 or self.RoundEnded then return end
	-- Simply distributes based on damage but also do some stuff for assists.
	local class = pl:GetZombieClassTable()

	if numofweek == 1 then
		attacker:GiveAchievementProgress("week_post", 1)
	end
	
	attacker:GiveAchievementProgress("daily_post", (numofdaily == 1 or numofdaily == 5 and inflictor.IsShadeGrabbable or  numofdaily == 4 and class.Boss) and 1 or 0)

	if attacker:IsSkillActive(SKILL_SCAM) and math.randomr(1,100,1,attacker) == 1 then
		attacker:AddInventoryItem("trinket_curse_point")
	end
	attacker:GiveAchievementProgress("everycan", 1)
	attacker:GiveAchievementProgress("dzs", 1)
	if (attacker.ZombiesKilled % (5 + (attacker:IsSkillActive(SKILL_PACIFISMIUM) and 25 or 0))) == 0 then
		attacker:SetChargesActive(attacker:GetChargesActive()+1)
	end
	pl:GiveAchievementProgress("goodtime", 1)
	if class.BaraCat then
		attacker:GiveAchievementProgress("antibaracat", 1)		
	end
	if pl.LastZGas > CurTime() then
		attacker.InbalanceMoment = 	attacker.InbalanceMoment +1
		if attacker.InbalanceMoment > 12 then
			for k,v in ipairs(ents.FindByClass("prop_gunturret*")) do
				if v:GetObjectOwner() == attacker then
					v:Remove()
				end
			end
			for k,v in ipairs(ents.FindByClass("prop_roller*")) do
				if v:GetObjectOwner() == attacker then
					v:Remove()
				end
			end
			attacker.InbalanceMoment = -20
		end
	end
	if self.NewYear and (math.random(100-math.min(50,(attacker.Luck or 1))) == 50 or class.Boss or class.DemiBoss) then
		for i=1,(class.Boss and 2 or 1) do
			local d = ents.Create("prop_gift")
			if d:IsValid() then
				d:SetPos(pl:GetPos() + Vector(0,0,15))
				d:SetAngles(pl:GetAngles())
				d:Spawn()
			end
		end
	end
	if self.Halloween and (math.random(100-math.min(50,(attacker.Luck or 1))) == 50 or class.Boss or class.DemiBoss) then
		for i=1,(class.Boss and 2 or 1) do
			local d = ents.Create("prop_gift_h")
			if d:IsValid() then
				d:SetPos(pl:GetPos() + Vector(0,0,15))
				d:SetAngles(pl:GetAngles())
				d:Spawn()
			end
		end
	end
	if attacker:IsSkillActive(SKILL_GREEDNESS) then
		for i=1,math.random(1,5) do
			local d = ents.Create("prop_money")
			if d:IsValid() then
				d:SetPos(pl:GetPos() + Vector(0,0,80))
				d:SetAngles(pl:GetAngles())
				d:Spawn()
				d:SetOwner(attacker)
				d:SetHP(math.random(1,3))
				d:SetTime(CurTime()+4)
				d.DieTime = CurTime() + 3.5
				timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(VectorRand(-1000,1000)) end )
			end
		end
	end
	if attacker:IsSkillActive(SKILL_KEEPER_HEART) then
		for i=1,math.random(1,3) do
			local d = ents.Create("prop_hp")
			if d:IsValid() then
				d:SetPos(pl:GetPos() + Vector(0,0,80))
				d:SetAngles(pl:GetAngles())
				d:Spawn()
				d:SetOwner(attacker)
				d:SetHP(math.random(1,5))
				d:SetTime(CurTime()+4)
				d.DieTime = CurTime() + 3.5
				timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(VectorRand(-300,300)) end )
			end
		end
	end
	local totaldamage = 0
	for otherpl, dmg in pairs(pl.DamagedBy) do
		if otherpl:IsValid() and otherpl:Team() == TEAM_HUMAN then
			totaldamage = totaldamage + dmg
		end
	end
	

	local mostassistdamage = 0
	local halftotaldamage = totaldamage / 2
	local mostdamager
	for otherpl, dmg in pairs(pl.DamagedBy) do
		if otherpl ~= attacker and otherpl:IsValid() and otherpl:Team() == TEAM_HUMAN and dmg > mostassistdamage and dmg >= halftotaldamage then
			mostassistdamage = dmg
			mostdamager = otherpl
		end
	end

	attacker.ZombiesKilled = attacker.ZombiesKilled + 1
	attacker.RageMul = attacker.RageMul + 0.15
	self:SetRage(math.Round(self:GetRage() + (3 * (attacker.RageMul or 1)) * self:GetWinRate()))
	timer.Create("rage"..attacker:Nick(),5,1, function() if attacker:IsValid() then		attacker.RageMul = 1 end end)
	attacker:AddZSXP(1)
	--	net.Start("zs_update_style") net.WriteTable({time = CurTime()+2.5+(math.random(10,20)*0.2),text = "CHAMPION KILL",color = pl:GetChampionColor(),score = 100}) net.Send(attacker) 
		--net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(1,20)*0.1),text = "KILL!",color = Color(250,21,21),score = 10}) net.Send(attacker) 
		--net.Start("zs_update_style") net.WriteTable({time = CurTime()+4+(math.random(10,20)*0.2),text = "AIRKILL!",score = 50,color = Color(1161,161,161)}) net.Send(attacker) 

	

 

	if mostdamager then
		attacker:PointCashOut(pl, FM_LOCALKILLOTHERASSIST)
		mostdamager:PointCashOut(pl, FM_LOCALASSISTOTHERKILL)

		mostdamager.ZombiesKilledAssists = mostdamager.ZombiesKilledAssists + 1
	else
		attacker:PointCashOut(pl, FM_NONE)
	end

	if inflictor:IsValid() and inflictor == attacker:GetActiveWeapon() then
		local wep = attacker:GetActiveWeapon()
		if attacker.MeleeMovementSpeedOnKill and attacker.MeleeMovementSpeedOnKill ~= 0 and wep.IsMelee then
			local boost = attacker:GiveStatus("adrenalineamp", 10)
			if boost and boost:IsValid() then
				boost:SetSpeed(attacker.MeleeMovementSpeedOnKill)
			end
		end

		if #self.Food > 0 and pl.ChefMarkTime and pl.ChefMarkTime > CurTime() and pl.ChefMarkOwner == attacker then
			local rfood = self.Food[math.random(#self.Food)]
			if not attacker:HasWeapon(rfood) then
				attacker:Give(rfood)
			end
		end

		if pl:WasHitInHead() then
			attacker.Headshots = (attacker.Headshots or 0) + 1
		end
		if attacker:IsSkillActive(SKILL_PILLUCK) then
			attacker.LuckAdd = attacker.LuckAdd + 0.01
		end
		local realque = attacker:IsSkillActive(SKILL_QUILLS) and attacker or mostdamager and mostdamager:IsSkillActive(SKILL_QUILLS) and mostdamager
		if realque then
			local hehe = realque:GetDTInt(25)
			realque:SetDTInt(25,hehe+1)
			if hehe > 24 then
				local flesharmor = realque:GiveStatus('flesh_armor')
				flesharmor:SetDamage(realque:GetMaxHealth())
				realque:SetDTInt(25,0)
			end
		end


		if wep.OnZombieKilled then
			wep:OnZombieKilled(pl, totaldamage, dmginfo)
		end
		if attacker:IsSkillActive(SKILL_NFINGERS)  then
			if !inflictor.IsMelee then
				attacker:GiveAmmo(1, attacker:GetResupplyAmmoType())
			elseif inflictor.IsMelee and math.random(1,10) == 1 then
				attacker:GiveAmmo(1, "scrap")
			end
			if inflictor.Magic then
				attacker:SetBloodArmor(attacker:GetBloodArmor() + 25)
			end
		end
		if attacker:IsSkillActive(SKILL_SFINGERS) then
			if !inflictor.IsMelee then
				local inflictor2 = inflictor
				inflictor2.Eater = true 
				timer.Simple(1.9, function() inflictor2.Eater = nil end)
			end
			if inflictor.HaloAmmo then
				local inflictor2 = inflictor
				inflictor2.Eater = true
				timer.Simple(0.9, function() inflictor2.Eater = nil end)
			end
		end
		if attacker:IsSkillActive(SKILL_ABFINGERS) and math.random(1,5) == 1 then
			local reaperstatus = attacker:GiveStatus("reaper", 6)
			if reaperstatus and reaperstatus:IsValid() then
				reaperstatus:SetDTInt(1, math.min(reaperstatus:GetDTInt(1) + 1, 30))
				attacker:EmitSound("hl1/ambience/particle_suck1.wav", 55, 150 + reaperstatus:GetDTInt(1) * 30, 0.45)
			end
		end
	end

	gamemode.Call("PostHumanKilledZombie", pl, attacker, inflictor, dmginfo, mostdamager, mostassistdamage, headshot)

	return mostdamager
end

function GM:PostHumanKilledZombie(pl, attacker, inflictor, dmginfo, assistpl, assistamount, headshot)
	if attacker:GetInfo("zs_mge_phrases") == "1" then
		net.Start("zs_mge_phr")
		net.Send(attacker)
	end -- 
end

function GM:ZombieKilledHuman(pl, attacker, inflictor, dmginfo, headshot, suicide, victim)
	if self.RoundEnded then return end

	local plpos = pl:GetPos()
	local dist = 999999999
	local xp = 32 * (GAMEMODE.ZombieXPMulti or 1)
	for _, ent in pairs(team.GetValidSpawnPoint(TEAM_UNDEAD)) do
		dist = math.min(ent:GetPos():DistToSqr(plpos), dist)
	end
	pl.ZombieSpawnDeathDistance = math.ceil(math.sqrt(dist))
    attacker:GiveAchievementProgress("zsfan", 1)
	attacker:GiveAchievementProgress("zmainer", 1)
	attacker:AddBrains(1)
	attacker:AddTokens(math.Clamp(pl:GetMaxHealth() * 1.25,1,500))
	attacker:AddLifeBrainsEaten(1)
	attacker:AddZSXP(self.InitialVolunteers[attacker:UniqueID()] and xp or math.floor(xp*4))
	self:SetRage(self:GetRage() - 15 / (self:GetWinRate()+1))
	local classtab = attacker:GetZombieClassTable()



	if not pl.Gibbed and not suicide then
		local status = pl:GiveStatus("revive_slump_human")
		if status then
			status:SetReviveTime(CurTime() + 4)
			status:SetZombieInitializeTime(CurTime() + 2)
		end

		pl:SetZombieClassName(self.ZombieEscape and "Super Zombie" or self:IsClassicMode() and "Classic Zombie" or self:IsBabyMode() and "Gore Child" or "Fresh Dead")
	end

	gamemode.Call("PostZombieKilledHuman", pl, attacker, inflictor, dmginfo, headshot, suicide)

	return attacker:Frags()
end

function GM:PostZombieKilledHuman(pl, attacker, inflictor, dmginfo, headshot, suicide)
end

local function DelayedChangeToZombie(pl)
	if pl:IsValid() then
		if pl.ChangeTeamFrags then
			pl:SetFrags(pl.ChangeTeamFrags)
			pl.ChangeTeamFrags = 0
		end

		pl:ChangeTeam(TEAM_UNDEAD)
	end
end
hook.Add("InitPostEntityMap", "BlueBomb", function()
	BLUE_BOMB = ents.Create("dummy_chemzombie")
	if BLUE_BOMB:IsValid() then
		BLUE_BOMB:Spawn()
	end
	SIGILKILLER = ents.Create("curse_of_sigil")
	if SIGILKILLER:IsValid() then
		SIGILKILLER:Spawn()
		SIGILKILLER:SetDTString(12,"Curse of Sigil")
	end
	BLOOD_BOMBER = ents.Create("dummy_blood_explode")
	if BLOOD_BOMBER:IsValid() then
		BLOOD_BOMBER:Spawn()
	end
end)
function GM:DoPlayerDeath(pl, attacker, dmginfo)

	pl:RemoveEphemeralStatuses()
	pl:Extinguish()
	pl:SetPhantomHealth(0)



	local inflictor = dmginfo:GetInflictor()
	local plteam = pl:Team()
	local ct = CurTime()
	local suicide = attacker == pl or attacker:IsWorld()

	if attacker.PBAttacker and attacker.PBAttacker:IsValid() then
		attacker = attacker.PBAttacker
	end

	pl:Freeze(false)

	local headshot = pl:WasHitInHead()

	if suicide then attacker = pl:GetLastAttacker() or attacker end
	pl:SetLastAttacker()

	if inflictor == NULL then inflictor = attacker end

	if inflictor == attacker and attacker:IsPlayer() then
		local wep = attacker:GetActiveWeapon()
		if wep:IsValid() then
			inflictor = wep
		end
	end

	if headshot then
		local effectdata = EffectData()
			effectdata:SetOrigin(dmginfo:GetDamagePosition())
			local force = dmginfo:GetDamageForce()
			effectdata:SetMagnitude(force:Length() * 3)
			effectdata:SetNormal(force:GetNormalized())
			effectdata:SetEntity(pl)
		util.Effect("headshot", effectdata, true, true)
	end
	if pl:IsChampion() then
		local champ = pl:GetChampion()
		local pos = pl:LocalToWorld(pl:OBBCenter())
		if champ == CHAMP_BLUE then
			local effectdata = EffectData()
					effectdata:SetOrigin(pos)
				util.Effect("explosion_chem", effectdata, true)
		
			if BLUE_BOMB:IsValid() then
				BLUE_BOMB:SetPos(pos)
			end
			util.PoisonBlastDamage(BLUE_BOMB, pl, pos, 222, 45, true)
			
			pl:CheckRedeem()
			if math.random(1,3) == 1 then
				local d = ents.Create("prop_hp")
				if d:IsValid() then
					if !attacker then
						attacker = pl
					end
					d:SetPos(pos + Vector(0,0,80))
					d:Spawn()
					d:SetOwner(attacker)
					d:SetHP(attacker:GetMaxHealth()*0.1)
					d:SetTime(CurTime()+10.5)
					d.DieTime = CurTime() + 10.5
					timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end )
				end
			end
		elseif champ == CHAMP_YELLOW then
			if math.random(1,3) == 1 then
				local d = ents.Create("prop_money")
				if d:IsValid() then
					if !attacker then
						attacker = pl
					end
					d:SetPos(pos + Vector(0,0,80))
					d:Spawn()
					d:SetOwner(attacker)
					d:SetHP((math.random(1,5) == 1 and 10 or 5))
					d:SetTime(CurTime()+20.5)
					d.DieTime = CurTime() + 20.5
					timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end )
				end
			end
		elseif champ == CHAMP_GRAY then
			if math.random(1,3) == 1 then
				if !attacker then
					attacker = pl
				end
				attacker:AddChargesActive(5)
			end
		elseif champ == CHAMP_ETERNAL then
			if math.random(1,10) == 1 then
				local ent = ents.Create("prop_invitem")
				if ent:IsValid() then
					ent:SetInventoryItemType("trinket_hp_up")
					ent:Spawn()
					ent:SetPos(pos)
					ent.DroppedTime = CurTime()
				end
			end
		elseif champ == CHAMP_RED then
			if math.random(1,3) == 1 then
				local d = ents.Create("prop_hp")
				if d:IsValid() then
					d:SetPos(pos + Vector(0,0,80))
					d:Spawn()
					d:SetHP((math.random(1,5) == 1 and 10 or 5))
					d:SetTime(CurTime()+20.5)
					d.DieTime = CurTime() + 20.5
					timer.Simple(0.1, function() d:GetPhysicsObject():SetVelocity(Vector(0,0,0)) end )
				end
			end
		end
		pl:SetChampion(0)
	end

	if not pl:CallZombieFunction5("OnKilled", attacker, inflictor, suicide, headshot, dmginfo) then
		if pl:Health() <= -70 and not pl.NoGibs and not self.ZombieEscape then
			pl:Gib(dmginfo)
		elseif not pl.KnockedDown then
			pl:CreateRagdoll()
		end
	end

	pl:RemoveStatus("overridemodel", false, true)

	local revive = false
	local assistpl
	if plteam == TEAM_UNDEAD then
		if GAMEMODE.ZombieEscape then
			local zewep = pl:GetWeapon("weapon_knife")
			if zewep and zewep:IsValid() then
				pl:DropWeapon(zewep)
			end
		end

		local classtable = pl:GetZombieClassTable()
		pl:PlayZombieDeathSound()
		if classtable.DemiBoss and not self.ObjectiveMap then
			net.Start("zs_demiboss_slain")
			net.WriteEntity(pl)
			net.WriteUInt(classtable.Index, 8)
		net.Broadcast()
		timer.Simple(0, function()
			for i=1,3 do
				pl:MakeDemiBossDrop(attacker)
			end
			--if attacker:IsValidLivingHuman() then
				--net.Start("zs_update_style") net.WriteTable({time = CurTime()+2+(math.random(1,20)*0.2),text = "DEMI-BOSS KILLED!",score = 150}) net.Send(attacker) 
			--end
		end)
		end
		if classtable.Boss and not self.ObjectiveMap and pl.BossDeathNotification then
			net.Start("zs_boss_slain")
				net.WriteEntity(pl)
				net.WriteUInt(classtable.Index, 8)
			net.Broadcast()
	--		if attacker:IsValidLivingHuman() then
				--net.Start("zs_update_style") net.WriteTable({time = CurTime()+8+(math.random(1,20)*0.2),text = "BOSS KILLED!",score = 350}) net.Send(attacker) 
		--	end
			if attacker:IsValidLivingHuman() and attacker:IsSkillActive(SKILL_SINS) then
				timer.Simple(0, function()
					pl:Make1BossDrop(attacker)
				end)
			end

			timer.Simple(0, function()
				pl:MakeBossDrop(attacker)
			end)



			pl.BossDeathNotification = nil
		end

		if not classtable.NoDeaths then
			pl:AddDeaths(1)
		end

		if self:GetWaveActive() then
			pl.StartSpectating = ct + 2
		else
			pl.StartCrowing = ct + 3
		end

		if attacker:IsValid() and attacker:IsPlayer() and attacker ~= pl then
			if classtable.Revives and not pl.Gibbed and not headshot and CurTime() > pl.LastRevive + 4 then
				if classtable.ReviveCallback then
					revive = classtable:ReviveCallback(pl, attacker, dmginfo)
				elseif math.random(4) ~= 1 then
					self:DefaultRevive(pl)
					revive = true
				end
			end

			if revive then
				pl.LastRevive = CurTime()
			elseif attacker:Team() == TEAM_HUMAN then
				assistpl = gamemode.Call("HumanKilledZombie", pl, attacker, inflictor, dmginfo, headshot, suicide)
			end
		end

		if not revive and (pl.LifeBarricadeDamage ~= 0 or pl.LifeHumanDamage ~= 0 or pl.LifeBrainsEaten ~= 0 or pl.LifeShieldGiven ~= 0) then
			timer.Simple(0, function() if pl:IsValid() then pl:SendLifeStats() end end)
		end

		pl:CallZombieFunction5("PostOnKilled", attacker, inflictor, suicide, headshot, dmginfo)
	elseif plteam == TEAM_HUMAN then
		if pl:IsSkillActive(SKILL_PHOENIX) and pl.RedeemedOnce or pl:HasTrinket("altlazarussoul")  then 
			pl:SendLua('MySelf:EmitSound(translate.Get(\"we_remind_this_sound\"))')
			local oldw = {}
			local oldt = {}
			for _, wep in pairs(pl:GetWeapons()) do
				if wep:IsValid() then
					table.insert(oldw,#oldw+1,wep:GetClass())
				end
			end
			for invitem, count in pairs(pl:GetInventoryItems()) do
				if invitem == "trinket_altlazarussoul" or GAMEMODE:GetInventoryItemType(invitem) == INVCAT_ETERNAL then continue  end
				for i = 1, count do
					table.insert(oldt, #oldt+1,invitem)
				end
			end
			timer.Simple(0.1, function()
				for k,v in pairs(oldw) do
					pl:Give(v)
				end
				for k,v in pairs(oldt) do
					pl:AddInventoryItem(v)
				end
			end)
			return false
	 	end
		pl.NextSpawnTime = ct + 4 

		pl:PlayDeathSound()

		if attacker:IsPlayer() and attacker ~= pl then
			gamemode.Call("ZombieKilledHuman", pl, attacker, inflictor, dmginfo, headshot, suicide)
		end
		pl:DropAll()
			
		timer.Simple(0, function() DelayedChangeToZombie(pl) end) -- We don't want people shooting barrels near teammates.
		self.PreviouslyDied[pl:UniqueID()] = CurTime()
		if self:GetWave() == 0 then
			pl.DiedDuringWave0 = true
		end

		local frags = pl:Frags()
		if frags < 0 then
			pl.ChangeTeamFrags = math.ceil(frags / 5)
		else
			pl.ChangeTeamFrags = 0
		end

		if pl.SpawnedTime then
			pl.SurvivalTime = math.max(ct - pl.SpawnedTime, pl.SurvivalTime or 0)
			pl.SpawnedTime = nil
		end

		if team.NumPlayers(TEAM_HUMAN) <= 1 then
			self.LastHumanPosition = pl:WorldSpaceCenter()

			net.Start("zs_lasthumanpos")
				net.WriteVector(self.LastHumanPosition)
			net.Broadcast()
		end

		local hands = pl:GetHands()
		if IsValid(hands) then
			hands:Remove()
		end
	end

	if revive or pl:CallZombieFunction2("NoDeathMessage", attacker, dmginfo) or pl:IsSpectator() then return end

	if attacker == pl then
		net.Start("zs_pl_kill_self")
			net.WriteEntity(pl)
			net.WriteUInt(plteam, 8)
		net.Broadcast()
	elseif attacker:IsPlayer() then
		if assistpl then
			net.Start("zs_pls_kill_pl")
				net.WriteEntity(pl)
				net.WriteEntity(attacker)
				net.WriteEntity(assistpl)
				net.WriteString(inflictor:GetClass())
				net.WriteUInt(plteam, 8)
				net.WriteUInt(attacker:Team(), 8) -- Assuming assistants are always on the same team.
				net.WriteBit(headshot)
			net.Broadcast()

			gamemode.Call("PlayerKilledByPlayer", pl, assistpl, inflictor, headshot, dmginfo, true)
		else
			net.Start("zs_pl_kill_pl")
				net.WriteEntity(pl)
				net.WriteEntity(attacker)
				net.WriteString(inflictor:GetClass())
				net.WriteUInt(plteam, 8)
				net.WriteUInt(attacker:Team(), 8)
				net.WriteBit(headshot)
			net.Broadcast()
		end

		gamemode.Call("PlayerKilledByPlayer", pl, attacker, inflictor, headshot, dmginfo)
	else
		net.Start("zs_death")
			net.WriteEntity(pl)
			net.WriteString(inflictor:GetClass())
			net.WriteString(attacker:GetClass())
			net.WriteUInt(plteam, 8)
		net.Broadcast()
	end

end

function GM:WeaponEquip(wep)
	if wep.m_WeaponDeploySpeed then
		timer.Simple(0, function() GAMEMODE:DoChangeDeploySpeed(wep) end)
	end
end

function GM:PlayerKilledByPlayer(pl, attacker, inflictor, headshot, dmginfo, is_assistant)
end

function GM:PlayerCanPickupWeapon(pl, ent)
	if pl:IsSkillActive(SKILL_JEW) then
		local bruhich = (self:GetWave() * 5 - self:GetWave() * 2) * (pl:HasTrinket("alt_slight_soul") and 0.25 or 1)
		pl:SetPoints(pl:GetPoints() - bruhich)
		GAMEMODE:ConCommandErrorMessage(pl, translate.ClientGet(pl, "jewmoment"))
		pl:GiveAchievementProgress("greatgreed", bruhich)
	end


	if pl:IsSpectator() then return false end

	if pl:Team() == TEAM_UNDEAD then return ent:GetClass() == pl:GetZombieClassTable().SWEP or ent.ZombieCanPickup or pl:GetZombieClassTable().CanPiz end


	return not ent.ZombieOnly
end

function GM:PlayerCanPickupItem(pl, ent)
	if pl:IsSkillActive(SKILL_D_FRAIL) or pl:IsSkillActive(SKILL_ABUSE) then
		local class = ent:GetClass()
		if class == "item_healthkit" or class == "item_healthvial" then
			local healamount = #class == 14 and 25 or 10
			if pl:Health() + healamount > math.floor(pl:GetMaxHealth() * 0.33) then
				return false
			end
		end
	end
	return true
end



-- This function is only for footsteps for players not in the local player's pvs or something.
-- The cl_init.lua version usually overrides this number so I just set it to a static number to save cycles.
function GM:PlayerStepSoundTime(pl, iType, bWalking)
	return 350
end

-- Again, don't bother overriding anything due to above.
function GM:PlayerFootstep(pl, vPos, iFoot, strSoundName, fVolume, pFilter)
end


local VoiceSetTranslate = {}
VoiceSetTranslate["models/player/alyx.mdl"] = VOICESET_ALYX
VoiceSetTranslate["models/player/barney.mdl"] = VOICESET_BARNEY
VoiceSetTranslate["models/player/combine_soldier.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/player/combine_soldier_prisonguard.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/player/combine_super_soldier.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/player/police.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/grim.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/player/police_fem.mdl"] = VOICESET_COMBINE
VoiceSetTranslate["models/player/monk.mdl"] = VOICESET_MONK
VoiceSetTranslate["models/jason278-players/gabe_3.mdl"] = VOICESET_MONK
VoiceSetTranslate["models/player/mossman.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/brsp.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/moe_glados_p.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/mossman_arctic.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/p2_chell.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/dawson/obese_male_deluxe/obese_male_deluxe.mdl"] = VOICESET_MONK
VoiceSetTranslate["models/player/cirno/cirno_player.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/dewobedil/eromanga_sensei/sagiri/pajama_p.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/loyalists/mmd/remilia/remilia_mp_pm.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/loyalists/mmd/flandre/flandre_mp_pm.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/jazzmcfly/kantai/yuudachi/yuudachi.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/dewobedil/vocaloid/haku/bikini_p.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/player/dewobedil/touhou/junko/default_p.mdl"] = VOICESET_FEMALE
VoiceSetTranslate["models/minosprime1/minosprime1.mdl"] = VOICESET_MINOS
VoiceSetTranslate["models/ultrakill/enemies/sisyphusprime/sisyphusprimepm.mdl"] = VOICESET_SISYPHIS
local redeemload = { 
	[0] = {"weapon_zs_redeemers","weapon_zs_swissarmyknife"},
	{"weapon_zs_redeemers_q1","weapon_zs_swissarmyknife_q1"}, -- 1
	{"weapon_zs_redeemers_q1","weapon_zs_swissarmyknife_q2"},
	{"weapon_zs_redeemers_q2","weapon_zs_swissarmyknife_q4"},
	{"weapon_zs_redeemers_q3","weapon_zs_swissarmyknife_q5"},
	{"weapon_zs_redeemers_q4","weapon_zs_swissarmyknife_q5"},
	{"weapon_zs_redeemers_q5","weapon_zs_harpoon"}, -- 6
	{"weapon_zs_double_uzi","weapon_zs_harpoon_q1"},
	{"weapon_zs_double_uzi_q1","weapon_zs_harpoon_q1"},
	{"weapon_zs_double_uzi_q3","weapon_zs_harpoon_q2"}, -- 9
	{"weapon_zs_double_uzi_q5","weapon_zs_pipemega_q2"},
	{"weapon_zs_smorning","weapon_zs_pipemega_q3"},
	{"weapon_zs_smorning_q5","weapon_zs_pipemega_q5"},
	{"weapon_zs_smorning_q5","weapon_zs_pipemega_q5"}
}
local function DoRedeemLoadout(self,pl)
	if self:GetWave() >= 9 then
		pl:SetPoints(500)
	end
	if redeemload[self:GetWave()] then
		for  k,v in pairs(redeemload[self:GetWave()]) do
			pl:Give(v)
		end
	else
		for  k,v in pairs({"weapon_zs_redeemers_q1","weapon_zs_swissarmyknife_q1"}) do
			pl:Give(v)
		end
	end
end
function GM:PlayerSpawn(pl)
	pl:StripWeapons()
	pl:WipePlayerInventory()
	pl:GiveAmmo(1, "dummy", true) -- Fixes empty weapon deploy bug.
	pl:RemoveStatus("confusion", false, true)
	pl:RemoveFlags(FL_ONGROUND) -- fixes :OnGround() returning true on spawn even if they're not on the ground.
	local d = pl:GetStatus("revive_slump_human")
	if d then
		d:SetReviveTime(CurTime())
		d:SetZombieInitializeTime(CurTime())
	end

	if pl:GetMaterial() ~= "" then
		pl:SetMaterial("")
	end


	pl:UnSpectate()

	pl.StartCrowing = nil
	pl.StartSpectating = nil
	pl.NextSpawnTime = nil
	pl.Gibbed = nil

	pl.dpsmeter = 0

	pl.MasteryHollowing = 0

	pl.LetalSave = true

	pl.RandomDamage = 0

	pl.UltraCharge = 0

	pl.SpawnNoSuicide = CurTime() + 1
	pl.SpawnedTime = CurTime()

	pl:ShouldDropWeapon(false)

	pl:SetLegDamage(0)
	pl:SetLastAttacker()

	local pcol = Vector(pl:GetInfo("cl_playercolor"))
	pcol.x = math.Clamp(pcol.x, 0, 2.5)
	pcol.y = math.Clamp(pcol.y, 0, 2.5)
	pcol.z = math.Clamp(pcol.z, 0, 2.5)
	pl:SetPlayerColor(pcol)



	if pl:Team() == TEAM_UNDEAD then
		if pl.ActivatedHumanSkills then
			pl.ActivatedHumanSkills = false
			pl:ApplySkills({})
		end

		if not pl.Revived then
			pl.DamagedBy = {}
		end

		pl.LifeBarricadeDamage = 0
		pl.LifeHumanDamage = 0
		pl.LifeShieldGiven = 0
		pl.LifeBrainsEaten = 0

		pl.BossHealRemaining = nil

		if self:GetUseSigils() and self:GetEscapeSequence() and self:GetEscapeStage() >= ESCAPESTAGE_BOSS and not pl.Revived then
			pl:SetZombieClassName("Super Zombie")
		elseif pl.DeathClass and self:GetWaveActive() then
			pl:SetZombieClass(self:GetBestAvailableZombieClass(pl.DeathClass))
			pl.DeathClass = nil
		end

		local cur = pl:GetZombieClassTable().Name
		local best = self:GetBestAvailableZombieClass(cur)
		if cur ~= best then
			pl:SetZombieClass(best)
		end

		local classtab = pl:GetZombieClassTable()
		pl:DoHulls(pl:GetZombieClass(), TEAM_UNDEAD)
		--pl:SetCustomCollisionCheck(pl.NoCollideAll == true)
		pl:CollisionRulesChanged()

		if classtab.Model then
			pl:SetModel(classtab.Model)
		elseif classtab.UsePlayerModel then
			local mdl = player_manager.TranslatePlayerModel(pl:GetInfo("cl_playermodel"))
			if table.HasValue(self.RestrictedModels, mdl) then
				pl:SelectRandomPlayerModel()
			else
				pl:SetModel(mdl)
			end
		elseif classtab.UsePreviousModel then
			local curmodel = string.lower(pl:GetModel())
			if table.HasValue(self.RestrictedModels, curmodel) or (not VoiceSetTranslate[curmodel] and string.sub(curmodel, 1, 14) ~= "models/player") then
				pl:SelectRandomPlayerModel()
			end
		elseif classtab.UseRandomModel then
			pl:SelectRandomPlayerModel()
		else
			pl:SetModel("models/player/zombie_classic_hbfix.mdl")
		end

		if classtab.NoPlayerColor then
			pl:SetColor(COLOR_WHITE)
			pl:SetPlayerColor(Vector(255, 255, 255))
		end

		if classtab.Boss then
			pl:SetHealth(classtab.Health + (((self:GetWave() * 120)) * math.max(1,team.NumPlayers(TEAM_HUMAN)/2 - (team.NumPlayers(TEAM_UNDEAD)/3)))* (classtab.DynamicHealth or 1))
		elseif classtab.DemiBoss then
			pl:SetHealth(classtab.Health + (((self:GetWave() * 30)) * team.NumPlayers(TEAM_HUMAN)) * (classtab.DynamicHealth or 1))
		else
			local lowundead = team.NumPlayers(TEAM_UNDEAD) < 4
			local healthmulti = (self.ObjectiveMap or self.ZombieEscape) and 1 or lowundead and 0.85 or 1
			healthmulti = healthmulti * (pl:IsChampion() and ((champion == CHAMP_SMOL or champion == CHAMP_GRAY) and 0.5 or champion == CHAMP_BIG and 2 or 1.5) or 1)
			pl:SetHealth((classtab.Health * healthmulti) + ((self:GetWave() * 15) * (classtab.DynamicHealth or 1)) )
		end

		if classtab.SWEP then
			if pl.m_Zombie_16  then
				pl:Give("weapon_zs_grenade_z")
			end
			pl:Give(classtab.SWEP)
		end
		if classtab.WeaponsWave then
			pl:Give((classtab.WeaponsWave[(self:GetWave() or 1)] and classtab.WeaponsWave[(self:GetWave() or 1)] or classtab.WeaponsWave[1]))

		end


		pl:SetNoTarget(true)
		pl:SetMaxHealth(1)

		pl:ResetSpeed()
		pl:SetCrouchedWalkSpeed(classtab.CrouchedWalkSpeed or 0.45)

		if not pl.Revived or not self:GetWaveActive() or CurTime() > self:GetWaveEnd() then
			pl.StartCrowing = 0
		end

		if pl.ForceSpawnAngles then
			pl:SetEyeAngles(pl.ForceSpawnAngles)
			pl.ForceSpawnAngles = nil
		end

		if not pl.Revived and not pl:GetZombieClassTable().NeverAlive and pl.SpawnedOnSpawnPoint and not pl.DidntSpawnOnSpawnPoint then
			pl:GiveStatus("zombiespawnbuff", self.ObjectiveMap and 1.5 or 3)
		end
		pl.DidntSpawnOnSpawnPoint = nil
		pl.SpawnedOnSpawnPoint = nil

		local overridemodel = pl:GetZombieClassTable().OverrideModel
		if overridemodel then
			local current = pl:GiveStatus("overridemodel")
			if current and current:IsValid() then
				current:SetModel(overridemodel)
				current:ResetBones()
				pl:CallZombieFunction1("ManipulateOverrideModel", current)
			end
		else
			pl:RemoveStatus("overridemodel", false, true)
		end

		local oldhands = pl:GetHands()
		if IsValid(oldhands) then
			oldhands:Remove()
		end

		pl:CallZombieFunction0("OnSpawned")
	elseif pl:Team() == TEAM_HUMAN then
		pl.PointQueue = 0
		pl.PackedItems = {}
		pl:ClearUselessDamage()

		local desiredname = pl:GetInfo("cl_playermodel")
		local modelname = player_manager.TranslatePlayerModel(#desiredname == 0 and self.RandomPlayerModels[math.random(#self.RandomPlayerModels)] or desiredname)
		local lowermodelname = string.lower(modelname)
		if table.HasValue(self.RestrictedModels, lowermodelname) then
			modelname = "models/player/alyx.mdl"
			lowermodelname = modelname
		end
		pl:SetModel(modelname)

		-- Cache the voice set.
		if VoiceSetTranslate[lowermodelname] then
			pl:SetDTInt(DT_PLAYER_INT_VOICESET, VoiceSetTranslate[lowermodelname])
		elseif string.find(lowermodelname, "female", 1, true) then
			pl:SetDTInt(DT_PLAYER_INT_VOICESET, VOICESET_FEMALE)
		else
			pl:SetDTInt(DT_PLAYER_INT_VOICESET, VOICESET_MALE)
		end

		--pl.HumanSpeedAdder = nil

		pl:SetNoTarget(false)
		pl:SetMaxHealth(100)
		--pl:SetCustomCollisionCheck(false)
		pl:CollisionRulesChanged()

		if not self.NoSkills then
			pl.ActivatedHumanSkills = true
			pl.AdjustedStartPointsSkill = nil
			pl.AdjustedStartScrapSkill = nil
			pl:ApplySkills()
		end

		pl.StowageCaches = 0

		net.Start("zs_stowagecaches")
			net.WriteInt(pl.StowageCaches, 12)
			net.WriteBool(false)
		net.Send(pl)

		pl.FridgeCaches = 0
		net.Start("zs_fridgecaches")
			net.WriteInt(pl.FridgeCaches, 12)
			net.WriteBool(false)
		net.Send(pl)

		pl:ResetSpeed()
		pl:ResetJumpPower()
		pl:SetCrouchedWalkSpeed(0.45)

		pl:SetViewOffset(Vector(0, 0, 64))
		pl:SetViewOffsetDucked(Vector(0, 0, 32))
		pl:SetModelScale(1) 

		
		pl:Give("weapon_zs_fists")


		if self.ZombieEscape then
			pl:Give("weapon_zs_zeknife")
			pl:Give("weapon_zs_zegrenade")
			pl:Give(table.Random(self.ZombieEscapeWeaponsPrimary))
			pl:Give(table.Random(self.ZombieEscapeWeaponsSecondary))
		else


			if self.StartingLoadout then
				self:GiveStartingLoadout(pl)
			elseif pl.m_PreRedeem then
				--DoDropStart(pl)
				if self.RedeemLoadout then
					for _, class in pairs(self.RedeemLoadout) do
						pl:Give(class)
					end
				else
					DoRedeemLoadout(self,pl)
				end
			end
		end

		local oldhands = pl:GetHands()
		if IsValid(oldhands) then
			oldhands:Remove()
		end

		local hands = ents.Create("zs_hands")
		if hands:IsValid() then
			hands:DoSetup(pl)
			hands:Spawn()
		end
	end

	local wcol = Vector(pl:GetInfo("cl_weaponcolor"))
	wcol.x = math.Clamp(wcol.x, 0, 2.5)
	wcol.y = math.Clamp(wcol.y, 0, 2.5)
	wcol.z = math.Clamp(wcol.z, 0, 2.5)
	pl:SetWeaponColor(wcol)
	if pl:Team() == TEAM_UNDEAD then
		local mul = (pl.m_HealthMulZS or 1) * (GAMEMODE.HPMULMAP or 1)
		pl:SetMaxHealth(pl:GetMaxHealth() * mul) 
		pl:SetHealth(pl:Health() * mul)
		if pl.m_ZArmor then
			pl:SetZArmor(pl:Health() * 0.33)
		end
	end
end



function GM:SetWave(wave)
	local previouslylocked = {}
	local UnlockedClasses = {}
	for classid, classtab in ipairs(GAMEMODE.ZombieClasses) do
		if not gamemode.Call("IsClassUnlocked", classid) then
			previouslylocked[classid] = true
		end
	end

	SetGlobalInt("wave", wave)

	for classid in pairs(previouslylocked) do
		if gamemode.Call("IsClassUnlocked", classid) then
			local classtab = self.ZombieClasses[classid]
			classtab.Locked = false
			classtab.Unlocked = true

			if not classtab.UnlockedNotify then
				classtab.UnlockedNotify = true
				table.insert(UnlockedClasses, classid)
			end

			for _, ent in ipairs(ents.FindByClass("logic_classunlock")) do
				local classname = GAMEMODE.ZombieClasses[classid].Name
				if ent.Class == string.lower(classname) then
					ent:Input("onclassunlocked", ent, ent, classname)
				end
			end

			net.Start("zs_classunlockstate")
				net.WriteInt(classid, 8)
				net.WriteBool(classtab.Unlocked)
			net.Broadcast()
		end
	end

	if #UnlockedClasses > 0 then
		for _, pl in pairs(player.GetAll()) do
			local classnames = {}
			for __, classid in pairs(UnlockedClasses) do
				local classtbl = self.ZombieClasses[classid]

				table.insert(classnames, translate.ClientGet(pl, classtbl.TranslationName))
			end
			net.Start("zs_classunlock")
				net.WriteString(string.AndSeparate(classnames, pl))
			net.Send(pl)
		end
	end
end

GM.NextEscapeDamage = 0
local weaponars = {
	"weapon_zs_pushbroom",
	"weapon_zs_shovel",
	"weapon_zs_pulserifle",
	"weapon_zs_toxicshooter",
	"weapon_zs_zenith",
	"weapon_zs_zenith_q2",
	"weapon_zs_m4",
	"weapon_zs_pollutor",
	"weapon_zs_sawedoff",
	"weapon_zs_minelayer",
	"weapon_zs_relsous",
	"weapon_zs_quasar",
	"weapon_zs_inferno",
	"weapon_zs_binocle",
	"weapon_zs_keyboard",
	"weapon_zs_icelux",
	"weapon_zs_scythe",
	"weapon_zs_plank_q1",
	"weapon_zs_pushbroom_q1",
	"weapon_zs_shovel_q1",
	"weapon_zs_pulserifle_q1",
	"weapon_zs_toxicshooter_q2",
	"weapon_zs_toxicshooter_r2",
	"weapon_zs_m4_q1",
	"weapon_zs_pollutor_q1",
	"weapon_zs_sawedoff_q1",
	"weapon_zs_minelayer_q1",
	"weapon_zs_relsous_q1",
	"weapon_zs_quasar_q1",
	"weapon_zs_inferno_q1",
	"weapon_zs_binocle_q1",
	"weapon_zs_keyboard_q1",
	"weapon_zs_scythe_q1"
}
function GM:EventStart(wave)
	if wave == 4 then 
		gamemode.Call("CreateRandomObjectPos", "prop_obj_anti_sigil")
		return
	elseif wave == 6 then 
		gamemode.Call("CreateSigils",nil,nil,true)
		for _, pl in pairs(player.GetAll()) do
			if pl then
				pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"something_cool_is_here"),{killicon = "headshot"})
			end
		end
		return
	end
	if math.random(1,4) == 1  then
		gamemode.Call("CreateRandomObjectPos", "prop_supply_doset",math.random(2,4))
		for _, pl in pairs(player.GetAll()) do
			if pl then
				pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"hehe_start"),{killicon = "headshot"})
			end
		end
	end
	if math.random(1,8) == 1  then
		local ent = gamemode.Call("CreateRandomObjectPos", "prop_casino",1)
		if ent and ent:IsValid() then
			ent:SetPos(ent:GetPos()+Vector(0,0,20))
		end
		for _, pl in pairs(player.GetAll()) do
			if pl then
				pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"casino_appear"),{killicon = "headshot"})
			end
		end
		return
	end
	if math.random(1,2) == 1  then
		local rand =  math.random(1,10) 
		gamemode.Call("CreateRandomObjectPos", "prop_databox",math.random(3,6)+(rand == 1 and 4 or 0))
		if rand ~= 1 then
			for _, pl in pairs(player.GetAll()) do
				if pl then
					pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"databox_start"),{killicon = "headshot"})
				end
			end
		end
		if rand == 1 then
			gamemode.Call("CreateRandomObjectPos", "prop_databox_mega",1)
			for _, pl in pairs(player.GetAll()) do
				if pl then
					pl:CenterNotify(COLOR_RED,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"datagod_start"),{killicon = "headshot"})
				end
			end
			return
		end
	end
	if math.random(1,5) == 5 then
		gamemode.Call("CreateRandomObjectPos", "prop_banana_farm",2)
		for _, pl in pairs(player.GetAll()) do
			if pl then
				pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"farm_banana_here"),{killicon = "headshot"})
			end
		end
	end
	if math.random(1,3) == 1  then
		local wepf_c = {}
		for _, wep in pairs(weapons.GetList()) do
			if (wep.Tier or 1) == math.Round(math.Clamp(wave/2,1,6)) and !wep.ZombieOnly and !wep.NoMobilized and wep.Primary.DefaultClip and wep.Primary.DefaultClip < 9999 then
				table.insert( wepf_c, wep.ClassName )
			end
		end
		for i=1,3 do
			gamemode.Call("CreateRandomObjectPos", "prop_weapon",1, wepf_c[math.random(1,#wepf_c)])
		end
		for _, pl in pairs(player.GetAll()) do
			if pl then
				pl:CenterNotify(COLOR_GREEN,{killicon = "headshot"},{font = "ZSHUDFontSmall"},translate.ClientGet(pl,"something_cool_is_here_2"),{killicon = "headshot"})
			end
		end
		return
	end
end
function GM:WaveStateChanged(newstate, pl)
	if newstate then
		
		if self:GetWave() == 0 then
			gamemode.Call("CreateSigils", true) -- Try creating sigils again. Only really matters if nobody seeded the map yet.

			self:SetClosestsToZombie()

			local humans = {}
			for _, pl in pairs(player.GetAll()) do
				if pl:Team() == TEAM_HUMAN and pl:Alive() then
					table.insert(humans, pl)
				end
			end

			for _, pl in pairs(humans) do
				pl:SetModelScale(1 * (GAMEMODE.ObjectiveMap and 1 or (pl.ScaleModel or 1))) 
				pl:SetViewOffset(Vector(0, 0, 64 * (GAMEMODE.ObjectiveMap and 1 or (pl.ScaleModel or 1))))
				pl:SetViewOffsetDucked(Vector(0, 0, 32 * (GAMEMODE.ObjectiveMap and 1 or (pl.ScaleModel or 1))))
			end

			-- We should spawn a crate in a random spawn point if no one has any.
		end

		local prevwave = self:GetWave()

		if self:GetUseSigils() and prevwave >= self:GetNumberOfWaves() then return end
		if prevwave == 6 then 
			local removed = false
			for k,v in ipairs(ents.FindByClass("prop_obj_sigil")) do
				if v:GetSigilCorrupted() then
					v:Remove()
					removed = true
				end
			end
			if !removed then
				for k,v in pairs(team.GetPlayers(TEAM_HUMAN)) do
					v:AddPoints(120)
				end
			end
		end
		gamemode.Call("SetWave", prevwave + 1)
		gamemode.Call("SetWaveStart", CurTime())
		if self.ZombieEscape then
			gamemode.Call("SetWaveEnd", -1)
			SetGlobalInt("numwaves", -1)
		else
			gamemode.Call("SetWaveEnd", self:GetWaveStart() + self:GetWaveOneLength() + (self:GetWave() - 1) * (GetGlobalBool("classicmode") and self.TimeAddedPerWaveClassic or self.TimeAddedPerWave))
		end

		net.Start("zs_wavestart")
			net.WriteInt(self:GetWave(), 16)
			net.WriteFloat(self:GetWaveEnd())
		net.Broadcast()

		for _, pl in pairs(team.GetPlayers(TEAM_UNDEAD)) do
			pl.m_LastWaveStartSpawn = CurTime()

			if pl:GetZombieClassTable().Name == "Crow" then
				pl:SetZombieClass(pl.DeathClass or 1)
				pl:UnSpectateAndSpawn()
			elseif not pl:Alive() and not pl.Revive then
				pl:UnSpectateAndSpawn()
			end
		end


		for _, pl in pairs(player.GetAll()) do
			pl.WaveBarricadeDamage = 0
			pl.WaveHumanDamage = 0
			pl.CanBuy = false
		end

		local curwave = self:GetWave()
		for _, ent in ipairs(ents.FindByClass("logic_waves")) do
			if ent.Wave == curwave or ent.Wave == -1 then
				ent:Input("onwavestart", ent, ent, curwave)
			end
		end
		for _, ent in ipairs(ents.FindByClass("logic_wavestart")) do
			if ent.Wave == curwave or ent.Wave == -1 then
				ent:Input("onwavestart", ent, ent, curwave)
			end
		end
	elseif self:GetWave() >= self:GetNumberOfWaves() then -- Last wave is over
		if self:GetUseSigils() then
			if self:GetEscapeStage() == ESCAPESTAGE_BOSS then
				-- 2 minutes is enough to decide people left are stuck or griefing.
				self:SetEscapeStage(ESCAPESTAGE_DEATH)

				gamemode.Call("SetWaveEnd", -1)
			elseif self:GetEscapeStage() == ESCAPESTAGE_ESCAPE then
				self:SetEscapeStage(ESCAPESTAGE_BOSS)

				-- Some time to get out with everyone spawning as bosses.
				gamemode.Call("SetWaveEnd", CurTime() + 45)

				-- Start spawning boss zombies.
			elseif self:GetEscapeStage() == ESCAPESTAGE_NONE then
				-- If we're using sigils, remove them all and spawn the doors.
				for _, sigil in ipairs(ents.FindByClass("prop_obj_sigil")) do
					if !sigil.Immune then continue end
					local ent = ents.Create("prop_obj_exit")
					if ent:IsValid() then
						ent:SetPos(sigil.NodePos or sigil:GetPos())
						ent:SetAngles(sigil:GetAngles())
						ent:Spawn()
					end

					sigil:Remove()
				end

				-- Some time to escape.
				gamemode.Call("SetWaveActive", true)
				gamemode.Call("SetWaveEnd", CurTime() + 30)
				self:SetEscapeStage(ESCAPESTAGE_ESCAPE)

				local curwave = self:GetWave()
				for _, ent in ipairs(ents.FindByClass("logic_waves")) do
					if ent.Wave == curwave or ent.Wave == -1 then
						ent:Input("onwaveend", ent, ent, curwave)
					end
				end
				for _, ent in ipairs(ents.FindByClass("logic_waveend")) do
					if ent.Wave == curwave or ent.Wave == -1 then
						ent:Input("onwaveend", ent, ent, curwave)
					end
				end
			end
		else
			-- If not using sigils then humans all win.
					
			gamemode.Call("EndRound", TEAM_HUMAN)

			local curwave = self:GetWave()
			for _, ent in ipairs(ents.FindByClass("logic_waves")) do
				if ent.Wave == curwave or ent.Wave == -1 then
					ent:Input("onwaveend", ent, ent, curwave)
				end
			end
			for _, ent in ipairs(ents.FindByClass("logic_waveend")) do
				if ent.Wave == curwave or ent.Wave == -1 then
					ent:Input("onwaveend", ent, ent, curwave)
				end
			end
		end
	else
		gamemode.Call("SetWaveStart", CurTime() + (GetGlobalBool("classicmode") and self.WaveIntermissionLengthClassic or self.WaveIntermissionLength))
		local whywave = self:GetWave()
		net.Start("zs_waveend")
			net.WriteInt(whywave, 16)
			net.WriteFloat(self:GetWaveStart())
		net.Broadcast()
		self:SetRage(self:GetRage() + 40 * whywave * #team.GetPlayers(TEAM_HUMAN))
       
		local pointsbonus
		if self.EndWavePointsBonus > 0 then
			pointsbonus = self.EndWavePointsBonus + (whywave - 1) * self.EndWavePointsBonusPerWave
		end
		gamemode.Call("EventStart",whywave)
		for _, pl in pairs(player.GetAll()) do
			if pl:Team() == TEAM_HUMAN and pl:Alive() then
				pl.UsesChaosCard = false
				pl:SetChargesActive(pl:GetChargesActive()+3)
				local lucktrue  = (pl.Luck or 1) + pl.LuckAdd 
				if pl:IsSkillActive(SKILL_LUCKY_UNLIVER) then
					lucktrue = lucktrue + whywave * 2
				end
				if self.EndWaveHealthBonus > 0 then
					pl:GiveStatus("regeneration"):AddDamage(self.EndWaveHealthBonus)
				end
				if pl:IsSkillActive(SKILL_XPHUNTER) then
					pl:AddZSXP(5 + whywave * 10)
				end
				if pl:IsSkillActive(SKILL_CREDIT) then
					net.Start("zs_credit_takepoints")
						net.WriteFloat(pl:GetPoints() * 0.3)
					net.Send(pl)
					pl:SetPoints(pl:GetPoints() * 0.7)
				end
				if pl:IsSkillActive(SKILL_SECONDCHANCE) and pl.LetalSave and whywave >= 5 and pl:IsValidLivingHuman() then
					pl:GiveAchievement("thisisbeeasy")
				end
				if pl:GetMastery('cader') > 1 then
					pl:SetProgress(math.Round(pl:GetProgress('caderprog')+150*whywave), 'caderprog')
					if pl:GetProgress('caderprog') > 2500 then
						pl:AddInventoryItem("cons_bounty")
						pl.CadersBounties = pl.CadersBounties + 1 
						pl.GetBounty = true
						
						pl:SendLua('GAMEMODE:CenterNotify({killicon = "weapon_zs_trinket"}, " ", COLOR_GREEN, translate.Format("caderget", GAMEMODE.ZSInventoryItemData["cons_bounty"].PrintName))')
						pl:SetProgress(math.Round(pl:GetProgress('caderprog')-2500), 'caderprog')
					end
				end
				if whywave%2 == 0 then
					pl.LetalSave = true
				end
				pl.BerserkerCharge = true
				if pl:IsSkillActive(SKILL_XPMULGOOD) then
				   pl.AddXPMulti = (pl.AddXPMulti or 1) + 0.2
				end
				if pl:Frags() == 1024 then
					pl:GiveAchievement("bitbat")
				end
				if self:GetWave() <= 5 then
					for k,v in pairs(pl:GetWeapons()) do
						if v.Tier  == 7 then
							pl:GiveAchievement('hard_money')
						end
					end
				end

				if pl:HasTrinket("mysteryticket")  then 
					local lucky2 = math.randomr(1,15,1,pl)
					if lucky2 == 1 then 
						pl:AddZSXP(1000)
						pl:TakeInventoryItem("trinket_mysteryticket")
						net.Start("zs_trinketconsumed")
							net.WriteString("Mystery ticket")
						net.Send(pl)
					end 
				end 
				if pl:HasTrinket("lotteryticket") then 
					local lucky1 = math.randomr(1,6,1,pl)
					if lucky1 == 1 then 
						pl:AddPoints(120)
						pl:TakeInventoryItem("trinket_lotteryticket")
						net.Start("zs_trinketconsumed")
						net.WriteString("Lottery ticket")
						net.Send(pl)
					end
				end
				if pl:IsSkillActive(SKILL_LIVER)  then 
					pl:AddInventoryItem(GAMEMODE.Curses[math.random(#GAMEMODE.Curses)])
						net.Start("zs_getacurse")
					net.Send(pl)
				end
				local blyat = math.randomr(1,10,6,pl)
				if pl:IsSkillActive(SKILL_DEADINSIDE) and blyat < 3 then
					pl:TakeDamage(20000)
				elseif pl:IsSkillActive(SKILL_DEADINSIDE) and blyat > 3 then
					pl:AddPoints(50)
				end
				if pointsbonus then
					local double = 1
					if pl:IsSkillActive(SKILL_ABUSE)  then 
						local lucky5 = math.randomr(1,8,1,pl)
						if lucky5 == 1 then 
							net.Start("zs_pointsdoubled")
							net.Send(pl)
							double = double * 2
						end 
					end
					if pl:IsSkillActive(SKILL_POINTD)  then 
						local lucky5 = math.randomr(1,8,1,pl)
						if lucky5 == 1 then 
							net.Start("zs_pointsdoubled")
							net.Send(pl)
							double = double * 2
						end 
					end
					local pointsreward = (pointsbonus + (pl.EndWavePointsExtra or 0)) * double
					

					if pl:IsSkillActive(SKILL_SCOURER) then
						pl:GiveAmmo(math.ceil(pointsreward), "scrap")
						pointsreward = 0
					end
					pl:AddPoints(pointsreward, nil, nil, true)
				end
				if pl:IsSkillActive(SKILL_ARSVOID)  then 
					local drop = table.Random(weaponars)
					local lucky2 = math.randomr(1,9,1,pl)
					if lucky2 == 1 then 
						pl:Give(drop)

						net.Start("zs_skillarsenalvoid")
							net.WriteString(drop)
						net.Send(pl)	
					end 
				end
				net.Start("zs_luck")
					net.WriteString(lucktrue)
				net.Send(pl)

				if pl.IllegalMechanism  then
					local zarplataBlyad = 0
					for _, d in ipairs( ents.FindByClass( "prop_*" ) ) do
						if d.CanPackUp and d.GetObjectOwner and d:GetObjectOwner() == pl then
							zarplataBlyad = zarplataBlyad + whywave*2
						end
					end
					pl:AddPoints(zarplataBlyad)
					net.Start( "zs_illegalmechanism" )
						net.WriteInt(zarplataBlyad,16)
					net.Send( pl )
				end

			elseif pl:Team() == TEAM_UNDEAD and not pl:Alive() and not pl.Revive then
				local curclass = pl.DeathClass or pl:GetZombieClass()
				local crowindex = GAMEMODE.ZombieClasses["Crow"].Index
				pl:SetZombieClass(crowindex)
				pl:DoHulls(crowindex, TEAM_UNDEAD)
				pl.DeathClass = nil
				pl:UnSpectateAndSpawn()
				pl.DeathClass = curclass
			end
			if pl:Team() == TEAM_UNDEAD then
				pl:AddTokens(math.ceil(whywave* 90) + 120)
				if pl:GetZombieClassTable().Name == "Destroyer" then
					pl:Kill()
				end
			end

			pl.SkipCrow = nil
		end

		local curwave = self:GetWave()
		for _, ent in ipairs(ents.FindByClass("logic_waves")) do
			if ent.Wave == curwave or ent.Wave == -1 then
				ent:Input("onwaveend", ent, ent, curwave)
			end
		end
		for _, ent in ipairs(ents.FindByClass("logic_waveend")) do
			if ent.Wave == curwave or ent.Wave == -1 then
				ent:Input("onwaveend", ent, ent, curwave)
			end
		end
	end

	gamemode.Call("OnWaveStateChanged")
end

function GM:PlayerSwitchFlashlight(pl, newstate)
	if pl:Team() == TEAM_UNDEAD then
		return false
	end
	local time = CurTime()
	if pl:Team() == TEAM_HUMAN and pl.NextFlashlightSwitch < time then
		pl.NextFlashlightSwitch = time + 0
		local trace = pl:GetEyeTrace()
		local trce =trace.Entity
		if trce and trce:IsValidLivingZombie() and pl.NextWhiteOut < time and newstate and pl:IsSkillActive(SKILL_FLASHLIGHT_PLUS) and math.abs(pl:GetForward():Angle().yaw - trce:GetForward():Angle().yaw) >= 45 
			and (trce:GetPos():Length()-pl:GetPos():Length()) < 3 and (trace.HitGroup == HITGROUP_HEAD or trace.HitGroup == HITGROUP_CHEST)
			then
			pl:SendLua("util.WhiteOut(25)")
			trce:SendLua("util.WhiteOut(45)")
		--	pl:Flashlight()
			pl.NextFlashlightSwitch =  time + 15
			pl:TakeSpecialDamage(12,DMG_BURN,pl,pl)
			trce:TakeSpecialDamage(12,DMG_BURN,pl,pl)
			pl.NextWhiteOut = time + 15
			local class = trce:GetZombieClassTable()
			if (class.Name == "Shade" or class.Name == "Frost Shade") then
				trce:TakeSpecialDamage(488,DMG_BURN,pl,pl)
			end
			if trce:IsBot() then
				trce:Freeze(true)
				timer.Simple(3.2,function()
					trce:Freeze(false)
				end)
			end
			return false
		end
		return true
	end

	return false
end

function GM:PlayerStepSoundTime(pl, iType, bWalking)
	return 350
end

function GM:OnZEWeaponPickup(pl, wep)
end
local spawn = {"info_player_zombie", "prop_creepernest", "prop_glitchnest", "info_player_undead", "prop_obj_sigil"}
net.Receive("zs_changeclass", function(len, sender)
	if sender:Team() ~= TEAM_UNDEAD or sender.Revive or GAMEMODE.PantsMode or GAMEMODE:IsClassicMode() or GAMEMODE:IsBabyMode() or GAMEMODE.ZombieEscape then return end

	local classname = GAMEMODE:GetBestAvailableZombieClass(net.ReadString())
	local suicide = net.ReadBool()
	local classtab = GAMEMODE.ZombieClasses[classname]
	if not classtab or classtab.Boss or classtab.DemiBoss or classtab.Disabled or classtab.Hidden and not (classtab.CanUse and classtab:CanUse(sender)) then return end

	if not gamemode.Call("IsClassUnlocked", classname) then
		sender:CenterNotify(COLOR_RED, translate.ClientFormat(sender, "class_not_unlocked_will_be_unlocked_x", classtab.Wave))
	elseif sender:GetZombieClassTable().Name == classname and not sender.DeathClass then
		sender:CenterNotify(COLOR_RED, translate.ClientFormat(sender, "you_are_already_a_x", translate.ClientGet(sender, classtab.TranslationName)))
	else
		sender.DeathClass = classtab.Index
		sender:CenterNotify(translate.ClientFormat(sender, "you_will_spawn_as_a_x", translate.ClientGet(sender, classtab.TranslationName)))
		local nest = NULL
		for _, ent in pairs(ents.FindInSphere(sender:GetPos(), 320)) do 
			if ent and IsValid(ent) and table.HasValue(spawn,ent:GetClass()) and !IsValid(nest) then
				if ent:GetClass() == "prop_obj_sigil" then
					if !ent:GetSigilCorrupted() then continue end
				end
				nest = ent
			end
		end
		if suicide and sender:Alive() and GAMEMODE:GetWaveActive() and (CurTime() < GAMEMODE:GetWaveEnd() - 4) and not sender:GetZombieClassTable().Boss and gamemode.Call("CanPlayerSuicide", sender)  then
			if nest and nest:IsValid() then --and sender.RespawnedTime >= CurTime() then
				sender:KillSilent()
				sender:SetZombieClass(classtab.Index)
				sender:UnSpectateAndSpawn()
				sender:SetPos(nest:GetPos())
			else
				sender:Kill()
			end
		end
	end
end)
net.Receive("zs_sync_style", function(len, sender)
end)
net.Receive("zs_add_p", function(len, sender)
	local points = net.ReadInt(12)*0.85
	local ent = net.ReadEntity()
	if sender:GetPoints() < points then return end
	if ent and ent:IsValid() then
		ent:SetPoints(ent:GetPoints()+points)
		sender:SetPoints(sender:GetPoints()-points)
		sender:GiveAchievementProgress("oof",points)
		if points >= 500 then
			ent:CenterNotify(COLOR_GREEN,"!!!")
			ent:CenterNotify(COLOR_RED,translate.ClientFormat(ent,"givedpoints_for",sender:Nick(),points))
			ent:CenterNotify(COLOR_GREEN,"!!!")
			ent:SendLua("surface.PlaySound(\"buttons/button10.wav\")")
		else
			ent:CenterNotify(COLOR_GREEN,translate.ClientFormat(ent,"givedpoints_for",sender:Nick(),points))
		end
		ent:PlayGiveAmmoSound()
		sender:PlayGiveAmmoSound()
	end
end)
net.Receive("zs_ability_weapon", function(len, sender)
	local ent = net.ReadEntity()
	if ent and ent:IsValid() and ent.HaveAbility and ent == sender:GetActiveWeapon() then
		ent:HaveAbility()
	end
end)
net.Receive("zs_zsfriend", function(len, sender)
	local zsfriendid = net:ReadString()
	local zsfriendent = player.GetBySteamID(zsfriendid)

	if not zsfriendent then return end
	local isfriend = net:ReadBool()
	sender.ZSFriends[zsfriendent] = isfriend

	net.Start("zs_zsfriendadded")
		net.WriteEntity(sender)
		net.WriteBool(isfriend)
	net.Send(zsfriendent)
end)


net.Receive("zs_nestspec", function(len, sender)
	if not sender:IsValidZombie() then return end
	if sender:GetObserverMode() == OBS_MODE_NONE then return end

	local nest = net:ReadEntity()
	local neveralive = sender:GetZombieClassTable().NeverAlive

	if neveralive and nest.MinionSpawn then
		sender:TrySpawnAsGoreChild(nest)
	end

	if sender:Alive() or neveralive then return end

	if nest:IsValid() then
		sender:Spectate(OBS_MODE_CHASE)
		sender:SpectateEntity(nest)
	end
end)
net.Receive("zs_soundbruh", function(len, sender)
	if sender and sender:IsValid() then
		sender.VolumeOfWeapon = net.ReadFloat()
	end
end)

net.Receive('zs_admin_give_t', function(len, sender)--ТОЛЬКО ДЛЯ ТЕСТА НОВЫХ ТРИНКЕТОВ И ОРУЖИЙ
	if !sender:IsSuperAdmin() then return end
	
	local tab = net.ReadString()
	if weapons.Get(tab) then
		sender:Give(tab)
		print(sender:Nick().." Give yourself a "..weapons.Get(tab).PrintName)
	elseif GAMEMODE.ZSInventoryItemData[tab] then
		print(sender:Nick().." Give yourself a "..GAMEMODE.ZSInventoryItemData[tab].PrintName)
		sender:AddInventoryItem(tab)
	end
end)

net.Receive('zs_shield_abuse', function(len, sender)
	if !sender or !sender:IsValid() then return end
	local func = net.ReadString()
	local ent = net.ReadEntity()
	local add = net.ReadUInt(24)
	local field = ent.Field
	if !field or !field:IsValid() or !ent or !ent:IsValid() or sender ~= ent:GetObjectOwner() then return end
	if func == "range" then
		field:SetPos(ent:GetPos() + ent:GetForward() * 48 + -ent:GetUp() * math.Clamp(add,-150,150) )
	else
		local oldang  = field:GetAngles()
		field:SetAngles(Angle(func == "x_yaw" and add or oldang.p,func == "y_yaw" and add or oldang.y, func == "z_yaw" and add or oldang.r))
	end
end)

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
	return pl:IsSkillUnlocked(skillid) 
end
local function Checking(sender, id) 
	if id > 25 then
		return
	end
	local skill = sender.AutoBuildingLevel[id]
	if skill and UnlockSkills(sender,skill[1],GAMEMODE.Skills[skill[1]],skill[2]) then
		sender:RemoveLevelUp()
	else
		Checking(sender, id+1) 
	end
end
net.Receive('zs_autobuild', function(len, sender)
	if !sender or !sender:IsValid() then return end
	local counts = net.ReadInt(32)
	Checking(sender,counts)
end)