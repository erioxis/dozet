--CACHED GLOBALS
local math_min = math.min
local curtime = CurTime

local TEAM_HUMAN = TEAM_HUMAN

local GM_MaxLegDamage = GM.MaxLegDamage

local M_Entity = FindMetaTable("Entity")
local M_Player = FindMetaTable("Player")
local M_CMoveData = FindMetaTable("CMoveData")

local E_GetTable = M_Entity.GetTable
local E_GetDTFloat = M_Entity.GetDTFloat
local E_GetDTBool = M_Entity.GetDTBool
local P_Team = M_Player.Team
local P_KeyDown = M_Player.KeyDown
local P_SyncAngles = M_Player.SyncAngles
local P_CallZombieFunction1 = M_Player.CallZombieFunction1
local P_GetLegDamage = M_Player.GetLegDamage
local P_GetBarricadeGhosting = M_Player.GetBarricadeGhosting
local P_GetActiveWeapon = M_Player.GetActiveWeapon
local M_SetVelocity = M_CMoveData.SetVelocity
local M_GetVelocity = M_CMoveData.GetVelocity
local M_SetMaxSpeed = M_CMoveData.SetMaxSpeed
local M_GetMaxSpeed = M_CMoveData.GetMaxSpeed
local M_SetMaxClientSpeed = M_CMoveData.SetMaxClientSpeed
local M_GetMaxClientSpeed = M_CMoveData.GetMaxClientSpeed
local M_GetForwardSpeed = M_CMoveData.GetForwardSpeed
local M_GetSideSpeed = M_CMoveData.GetSideSpeed


function GM:SetupMove(pl, move, cmd)
end

local fw, sd, pt, vel, mul, phase
local function GetClimbSurface( pl )

    local climbtrace = {mask = MASK_SOLID_BRUSHONLY, mins = Vector(-5, -5, -5), maxs = Vector(5, 5, 5)}
    local fwd = pl:SyncAngles():Forward()
    local up = pl:GetUp()
    local pos = pl:GetPos()
    local height = pl:OBBMaxs().z
    local tr
    local ha
    for i=5, height, 5 do
        if not tr or not tr.Hit then
            climbtrace.start = pos + up * i
            climbtrace.endpos = climbtrace.start + fwd * 36
            tr = util.TraceHull(climbtrace)
            ha = i
            if tr.Hit and not tr.HitSky then break end
        end
    end

    if tr.Hit and not tr.HitSky then
        climbtrace.start = pos + up * ha --tr.HitPos + tr.HitNormal
        climbtrace.endpos = climbtrace.start + pl:SyncAngles():Up() * (height - ha)
        local tr2 = util.TraceHull(climbtrace)
        if tr2.Hit and not tr2.HitSky then
            return tr2
        end

        return tr
    end
end
local function EmitClimbSound( pl )
    local time = curtime()

    if not pl.NextClimbingSound then
        pl.NextClimbingSound = time + math.random( .2, .3 )
    end

    if pl.NextClimbingSound < time then
        pl:EmitSound("player/footsteps/metalgrate"..math.random(4)..".wav", 70, math.random( 185, 190 ) )
        pl.NextClimbingSound = time + math.random( .2, .3 )
    end
end
function GM:Move(pl, move)
	pt = E_GetTable(pl)

	if P_Team(pl) == TEAM_HUMAN then
		if P_GetBarricadeGhosting(pl) and not E_GetDTBool(pl, 1) then
			-- Use 7, because friction will amount this to a velocity of 1 roughly.
			phase = pt.NoGhosting and E_GetDTFloat(pl, DT_PLAYER_FLOAT_WIDELOAD) > curtime()
			M_SetMaxClientSpeed(move, math_min(M_GetMaxClientSpeed(move), phase and 7 or (30 * (pt.BarricadePhaseSpeedMul or 1))))
		elseif not pt.NoBWSpeedPenalty then
			fw = M_GetForwardSpeed(move)
			if fw < 0 then
				sd = M_GetSideSpeed(move)
				if sd < 0 then sd = -sd end

				if sd > fw then
					M_SetMaxClientSpeed(move, M_GetMaxClientSpeed(move) * (P_GetActiveWeapon(pl).IsMelee and 0.75 or 0.5))
				end
			end
		end
<<<<<<< Updated upstream
=======
			local wep = P_GetActiveWeapon(pl)
			if wep.Move then
				wep:Move(move) 
			end
			if pl.SpiderMechanism then

				if GetClimbSurface( pl ) and P_KeyDown( pl, IN_ATTACK2 ) then
	
					M_SetMaxSpeed( move, 0 )
					M_SetMaxClientSpeed( move, 0 )
	
					local tr = GetClimbSurface( pl )
					local angs = P_SyncAngles(pl)
					local dir = tr and tr.Hit and (tr.HitNormal.z <= -0.5 and (angs:Forward() * -1) or math.abs(tr.HitNormal.z) < 0.75 and tr.HitNormal:Angle():Up()) or Vector(0, 0, 1)
					local vel = Vector(0, 0, 4)
	
					if P_KeyDown( pl, IN_FORWARD ) then
						--move:SetGroundEntity( nil )
						vel = vel + dir * 250
						EmitClimbSound( pl )
					end
					if P_KeyDown( pl, IN_BACK ) then
						vel = vel + dir * -250
						EmitClimbSound( pl )
					end
	
					if vel.z == 4 then
						if P_KeyDown( pl, IN_MOVERIGHT ) then
							vel = vel + angs:Right() * 100
						end
						if P_KeyDown( pl, IN_MOVELEFT ) then
							vel = vel + angs:Right() * -100
						end
					end
	
					M_SetVelocity( move, vel )
				end
			end
>>>>>>> Stashed changes
	else
		if pt.SpawnProtection then
			M_SetMaxSpeed(move, M_GetMaxSpeed(move) * 1.30)
			M_SetMaxClientSpeed(move, M_GetMaxClientSpeed(move) * 1.30)
		end
		local wep = P_GetActiveWeapon(pl)
		if wep.Move then
			wep:Move(move) 
		end
		if P_CallZombieFunction1(pl, "Move", move) then return end
	end

	legdmg = P_GetLegDamage(pl)
	if legdmg > 0 then
		M_SetMaxClientSpeed(move, M_GetMaxClientSpeed(move) * (1 - math_min(1, legdmg / GM_MaxLegDamage)))
	end
end

