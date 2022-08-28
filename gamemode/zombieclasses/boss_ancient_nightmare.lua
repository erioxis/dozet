CLASS.Base = "boss_nightmare"

CLASS.Name = "Ancient Nightmare"
CLASS.TranslationName = "class_ancient_nightmare"
CLASS.Description = "description_ancient_nightmare"
CLASS.Help = "controls_ancient_nightmare"

CLASS.Boss = true

CLASS.Health = 1230
CLASS.Speed = 110

CLASS.Points = 30

CLASS.SWEP = "weapon_zs_anightmare"

CLASS.Model = Model("models/player/skeleton.mdl")
CLASS.OverrideModel = false

CLASS.Skeletal = true

local math_random = math.random
local math_min = math.min
local math_max = math.max
local string_format = string.format
local bit_band = bit.band

function CLASS:PlayerFootstep(pl, vFootPos, iFoot, strSoundName, fVolume, pFilter)
	if math_random(2) == 1 then
		pl:EmitSound("npc/barnacle/neck_snap1.wav", 65, math_random(115, 130), 0.27)
	else
		pl:EmitSound("npc/barnacle/neck_snap2.wav", 65, math_random(115, 130), 0.27)
	end

	return true
end
function CLASS:Think()
	for _, ent in pairs(ents.FindInSphere(pl:GetPos(), 560)) do
        if ent:IsPlayer() and ent:IsValidLivingHuman() then
			self.Speed = ent:GetWalkSpeed() * 2.5
			break
		end
	end
end
if SERVER then
	function CLASS:ProcessDamage(pl, dmginfo)
		if bit_band(dmginfo:GetDamageType(), DMG_BULLET) ~= 0 then
			dmginfo:ScaleDamage(0.2)
		elseif bit_band(dmginfo:GetDamageType(), DMG_SLASH) == 0 and bit_band(dmginfo:GetDamageType(), DMG_CLUB) == 0 then
			dmginfo:ScaleDamage(0.1)
		end
		if dmginfo:GetInflictor().IsMelee then
			dmginfo:ScaleDamage(0.34)
		end
	end
end
function CLASS:GetAlpha(pl)
	local wep = pl:GetActiveWeapon()
	if not wep.IsAttacking then wep = NULL end

	if wep:IsValid() and wep:IsAttacking() then
		return 0.7
	end

	local eyepos = EyePos()
	local nearest = pl:WorldSpaceCenter()
	local norm = nearest - eyepos
	norm:Normalize()
	local dot = EyeVector():Dot(norm)

	local vis = (dot * 0.4 + pl:GetVelocity():Length() / self.Speed / 2 - eyepos:Distance(nearest) / 400) * dot

	return math_Clamp(vis, MySelf:IsValid() and MySelf:Team() == TEAM_UNDEAD and 0.137 or 0, 0.7)
end

if not CLIENT then return end


CLASS.Icon = "zombiesurvival/killicons/ancient_nightmare"



