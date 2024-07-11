AddCSLuaFile("shared.lua")
include("shared.lua")

function CLASS:OnKilled(pl, attacker, inflictor, suicide, headshot, dmginfo)
	local fakedeath = pl:FakeDeath(pl:LookupSequence("death_0"..math.random(4)), self.ModelScale)
	if fakedeath and fakedeath:IsValid() then
		fakedeath:SetModel(self.OverrideModel)
		local ang = fakedeath:GetDeathAngles()
		fakedeath:SetPos(fakedeath:GetPos() + ang:Up() * 10)
		ang:RotateAroundAxis(ang:Right(), 90)
		fakedeath:SetDeathAngles(ang)
		--[[local override = ents.Create("status_overridemodel")
		if override:IsValid() then
			override:SetModel(self.OverrideModel)
			override:SetParent(fakedeath)
			override:SetOwner(fakedeath)
			override:Spawn()
		end]]
	end
	if attacker:IsPlayer() then
		pl:GiveAchievement("godisdead")
		attacker:GiveAchievement("godisdead")
	end

	return true
end
function CLASS:ProcessDamage(pl, dmginfo)
	local attacker = dmginfo:GetAttacker()
	if 	attacker and attacker:IsPlayer() and attacker:IsSkillActive(SKILL_GODHEART) then
		attacker:TakeSpecialDamage(1000,DMG_DIRECT,pl,pl)
	end
	return dmginfo
end