
--SWEP.PrintName = "Mega Masher"
SWEP.PrintName = ""..translate.Get("wep_megamasher")
if CLIENT then
	SWEP.ViewModelFOV = 75

	SWEP.ShowViewModel = false
	SWEP.ShowWorldModel = false
	SWEP.VElements = {
		["base2"] = { type = "Model", model = "models/props_wasteland/buoy01.mdl", bone = "ValveBiped.Bip01", rel = "base", pos = Vector(12, 0, 0), angle = Angle(0, 90, 270), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/props_junk/iBeam01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(12.706, 2.761, -22), angle = Angle(13, -12.5, 0), size = Vector(0.15, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base3"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "ValveBiped.Bip01", rel = "base", pos = Vector(-5, 0, 0), angle = Angle(0, 270, 90), size = Vector(0.4, 0.4, 0.4), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base4"] = { type = "Model", model = "models/weapons/w_sledgehammer.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.299, 11), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}

	SWEP.WElements = {
		["base2"] = { type = "Model", model = "models/props_wasteland/buoy01.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(12, 0, 0), angle = Angle(0, 90, 270), size = Vector(0.2, 0.2, 0.2), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base"] = { type = "Model", model = "models/props_junk/iBeam01a.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(10, 1, -35), angle = Angle(0, 0, 0), size = Vector(0.15, 0.5, 0.5), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base3"] = { type = "Model", model = "models/props_borealis/bluebarrel001.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "base", pos = Vector(-5, 0, 0), angle = Angle(0, 90, 270), size = Vector(0.4, 0.4, 0.4), color = Color(255, 0, 0, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} },
		["base4"] = { type = "Model", model = "models/weapons/w_sledgehammer.mdl", bone = "ValveBiped.Bip01_R_Hand", rel = "", pos = Vector(3, 1.299, 0), angle = Angle(0, 0, 180), size = Vector(1, 1, 1), color = Color(255, 255, 255, 255), surpresslightning = false, material = "", skin = 0, bodygroup = {} }
	}
end

SWEP.Base = "weapon_zs_basemelee"

SWEP.HoldType = "melee2"

SWEP.DamageType = DMG_CLUB

SWEP.ViewModel = "models/weapons/v_sledgehammer/c_sledgehammer.mdl"
SWEP.WorldModel = "models/weapons/w_crowbar.mdl"
SWEP.UseHands = true

SWEP.MeleeDamage = 144
SWEP.MeleeRange = 75
SWEP.MeleeSize = 4
SWEP.MeleeKnockBack = 420

SWEP.Primary.Delay = 1.7

SWEP.WalkSpeed = SPEED_SLOWEST * 0.7

SWEP.SwingRotation = Angle(60, 0, -80)
SWEP.SwingOffset = Vector(0, -30, 0)
SWEP.SwingTime = 1.33
SWEP.SwingHoldType = "melee"

SWEP.Tier = 5

SWEP.AllowQualityWeapons = true

GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_MELEE_IMPACT_DELAY, -0.15, 1)
GAMEMODE:AttachWeaponModifier(SWEP, WEAPON_MODIFIER_FIRE_DELAY, -0.15, 1)

function SWEP:PlaySwingSound()
	self:EmitSound("weapons/iceaxe/iceaxe_swing1.wav", 75, math.random(20, 25))
end

function SWEP:PlayHitSound()
	self:EmitSound("vehicles/v8/vehicle_impact_heavy"..math.random(4)..".wav", 80, math.Rand(95, 105))
end

function SWEP:PlayHitFleshSound()
	self:EmitSound("physics/flesh/flesh_bloody_break.wav", 80, math.Rand(90, 100))
end

function SWEP:OnMeleeHit(hitent, hitflesh, tr)
	local ent = hitent
	if IsFirstTimePredicted() then
		if ent:IsPlayer() and SERVER then
			for i = 1, math.random(3) do
				for _, ent in pairs(ents.FindInSphere(tr.HitPos, 28)) do
					if ent:IsValid() and ent:IsPlayer() and ent ~= self:GetOwner() and ent:IsValidLivingZombie() then
						ent:TakeDamage((self.MeleeDamage * i) * 0.55, self:GetOwner(), self)
						break
					end
				end
			end
		end
	end
end

GAMEMODE:AddNewRemantleBranch(SWEP, 1, ""..translate.Get("wep_megamasher_r1"), ""..translate.Get("wep_d_megamasher_r1"), function(wept)
	wept.Primary.Delay = wept.Primary.Delay * 0.2
	wept.MeleeDamage = wept.MeleeDamage * 0.3
	wept.MeleeKnockBack = 612
   wept.SwingTime = 0.5
	
	wept.OnZombieKilled = function(self, zombie, total, dmginfo)
		local killer = self:GetOwner()
		local minushp = -zombie:Health()
		if killer:IsValid() and minushp > 0 then
			local pos = zombie:GetPos()
				local killer = self:GetOwner()
		
				if killer:IsValid() then
					killer:GiveStatus("strengthdartboost", 15)
				end
	
            if not killer:IsSkillActive(SKILL_SIGILIBERATOR) or (not killer:GetStatus("strengthdartboost")) then
			timer.Simple(0.15, function()
				util.BlastDamagePlayer(killer:GetActiveWeapon(), killer, pos, 72, minushp, DMG_ALWAYSGIB, 3)
			end)
		end

			local effectdata = EffectData()
				effectdata:SetOrigin(pos)
			util.Effect("Explosion", effectdata, true, true)
		end
	end
end)
